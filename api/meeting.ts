import { z } from 'zod'
import { admin, callerId, handle, HttpError, json, readJson } from './_lib/server.js'
import { deadlineOf, iceServers, isFresh, joinWindow, newSession, pullTracks, pushTracks, realtimeConfig, renegotiate, TRACK_NAMES } from './_lib/meeting.js'

const id = z.string().uuid()
const sdp = z.string().min(10).max(30_000)

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('join'), meetingId: id }),
  z.object({ action: z.literal('state'), meetingId: id }),
  z.object({ action: z.literal('push'), meetingId: id, sdp, tracks: z.array(z.object({ mid: z.string().max(8), trackName: z.enum(TRACK_NAMES) })).min(1).max(2) }),
  z.object({ action: z.literal('pull'), meetingId: id }),
  z.object({ action: z.literal('renegotiate'), meetingId: id, sdp }),
  z.object({ action: z.literal('leave'), meetingId: id, end: z.boolean().optional() }),
])

type Meeting = { id: string; teacher_id: string; student_id: string; mode: 'app' | 'link'; starts_at: string; started_at: string | null; ended_at: string | null; cancelled_at: string | null }
type Peer = { user_id: string; session_id: string; seen_at: string }

// Görüşmeye yalnızca öğrencinin şu anki öğretmeni ve öğrencinin kendisi girer. Kayıt alınmaz
export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Geçersiz istek')
  const config = realtimeConfig()
  if (!config) throw new HttpError(503, 'Uygulama içi görüşme şu an kullanılamıyor. Görüşme bağlantısıyla devam edebilirsiniz')
  const userId = await callerId(request)
  const body = parsed.data
  const db = admin()

  const { data: meeting } = await db
    .from('meetings')
    .select('id, teacher_id, student_id, mode, starts_at, started_at, ended_at, cancelled_at')
    .eq('id', body.meetingId)
    .maybeSingle<Meeting>()
  if (!meeting || (userId !== meeting.teacher_id && userId !== meeting.student_id)) throw new HttpError(404, 'Görüşme bulunamadı')
  if (userId === meeting.teacher_id) {
    const { data: student } = await db.from('students').select('teacher_id').eq('id', meeting.student_id).maybeSingle<{ teacher_id: string }>()
    if (student?.teacher_id !== userId) throw new HttpError(404, 'Görüşme bulunamadı')
  }
  if (meeting.mode !== 'app') throw new HttpError(400, 'Bu görüşme dış bağlantıyla yapılıyor')

  if (body.action === 'leave') {
    await db.from('meeting_peers').delete().eq('meeting_id', meeting.id).eq('user_id', userId)
    if (body.end && userId === meeting.teacher_id && meeting.started_at && !meeting.ended_at) {
      await db.from('meetings').update({ ended_at: new Date().toISOString() }).eq('id', meeting.id)
    }
    return json({ ok: true })
  }

  const access = joinWindow(meeting)
  if (!access.ok) {
    if (access.expired && meeting.started_at && !meeting.ended_at) {
      await db.from('meetings').update({ ended_at: new Date(deadlineOf(meeting)).toISOString() }).eq('id', meeting.id)
    }
    throw new HttpError(410, access.reason)
  }

  const { data: peers } = await db.from('meeting_peers').select('user_id, session_id, seen_at').eq('meeting_id', meeting.id).returns<Peer[]>()
  const mine = peers?.find((p) => p.user_id === userId)
  const other = peers?.find((p) => p.user_id !== userId && isFresh(p.seen_at))

  if (body.action === 'join') {
    const sessionId = await newSession(config)
    const now = new Date().toISOString()
    const saved = await db.from('meeting_peers').upsert({ meeting_id: meeting.id, user_id: userId, session_id: sessionId, joined_at: now, seen_at: now })
    if (saved.error) throw new HttpError(500, 'Görüşmeye katılınamadı, tekrar deneyin')
    const started = await startIfBoth(meeting, Boolean(other))
    return json({ sessionId, iceServers: await iceServers(config), ...stateOf(started, other) })
  }

  if (!mine) throw new HttpError(409, 'Görüşme bağlantısı kopmuş, yeniden katılın')

  if (body.action === 'state') {
    await db.from('meeting_peers').update({ seen_at: new Date().toISOString() }).eq('meeting_id', meeting.id).eq('user_id', userId)
    return json(stateOf(await startIfBoth(meeting, Boolean(other)), other))
  }

  if (body.action === 'push') {
    const res = await pushTracks(config, mine.session_id, body.sdp, body.tracks)
    if (res.sessionDescription?.type !== 'answer') throw new HttpError(502, 'Görüşme bağlantısı kurulamadı, tekrar deneyin')
    return json({ sdp: res.sessionDescription.sdp })
  }

  if (body.action === 'pull') {
    if (!other) throw new HttpError(409, 'Karşı taraf henüz bağlanmadı')
    const res = await pullTracks(config, mine.session_id, other.session_id)
    return json({
      remoteSessionId: other.session_id,
      renegotiate: Boolean(res.requiresImmediateRenegotiation),
      sdp: res.sessionDescription?.type === 'offer' ? res.sessionDescription.sdp : null,
      tracks: (res.tracks ?? []).map((t) => ({ trackName: t.trackName ?? null, mid: t.mid ?? null, failed: Boolean(t.errorCode) })),
    })
  }

  await renegotiate(config, mine.session_id, body.sdp)
  return json({ ok: true })

  async function startIfBoth(m: Meeting, bothHere: boolean) {
    if (m.started_at || !bothHere) return m
    const startedAt = new Date().toISOString()
    const { data } = await db
      .from('meetings')
      .update({ started_at: startedAt })
      .eq('id', m.id)
      .is('started_at', null)
      .select('id, teacher_id, student_id, mode, starts_at, started_at, ended_at, cancelled_at')
      .maybeSingle<Meeting>()
    if (data) return data
    const { data: fresh } = await db.from('meetings').select('id, teacher_id, student_id, mode, starts_at, started_at, ended_at, cancelled_at').eq('id', m.id).single<Meeting>()
    return fresh ?? m
  }
})

function stateOf(m: Meeting, other: Peer | undefined) {
  return {
    startedAt: m.started_at,
    deadline: new Date(deadlineOf(m)).toISOString(),
    other: other ? { sessionId: other.session_id } : null,
    serverTime: new Date().toISOString(),
  }
}
