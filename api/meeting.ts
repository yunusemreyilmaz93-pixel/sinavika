import { z } from 'zod'
import { admin, callerId, handle, HttpError, json, readJson } from './_lib/server.js'
import { deadlineOf, isFresh, meetingFor, MEETING_COLUMNS, realtimeConfig, requireOpen, type Meeting, type Peer } from './_lib/meeting.js'

const id = z.string().uuid()
const track = z.object({
  trackName: z.string().max(100),
  sessionId: z.string().max(100),
  location: z.literal('remote').optional(),
  kind: z.enum(['audio', 'video', 'screen']),
})
const media = z.object({ mic: z.boolean(), camera: z.boolean(), screen: z.boolean() })

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('join'), meetingId: id }),
  z.object({ action: z.literal('announce'), meetingId: id, tracks: z.array(track).max(3), media }),
  z.object({ action: z.literal('state'), meetingId: id, media: media.optional() }),
  z.object({ action: z.literal('leave'), meetingId: id, end: z.boolean().optional() }),
])

// Görüşmenin durumu ve iki tarafın yayınladığı izlerin listesi. Görüntü ve ses /api/partytracks üzerinden geçer, kaydedilmez
export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Geçersiz istek')
  if (!realtimeConfig()) throw new HttpError(503, 'Uygulama içi görüşme şu an kullanılamıyor. Görüşme bağlantısıyla devam edebilirsiniz')
  const userId = await callerId(request)
  const body = parsed.data
  const db = admin()
  const meeting = await meetingFor(userId, body.meetingId)

  if (body.action === 'leave') {
    await db.from('meeting_peers').delete().eq('meeting_id', meeting.id).eq('user_id', userId)
    if (body.end && userId === meeting.teacher_id && meeting.started_at && !meeting.ended_at) {
      await db.from('meetings').update({ ended_at: new Date().toISOString() }).eq('id', meeting.id)
    }
    return json({ ok: true })
  }

  await requireOpen(meeting)
  const now = new Date().toISOString()

  if (body.action === 'announce') {
    const saved = await db.from('meeting_peers').upsert({
      meeting_id: meeting.id,
      user_id: userId,
      session_id: body.tracks[0]?.sessionId ?? null,
      tracks: body.tracks,
      media: body.media,
      seen_at: now,
    })
    if (saved.error) throw new HttpError(500, 'Görüşmeye katılınamadı, tekrar deneyin')
  } else if (body.action === 'state') {
    await db
      .from('meeting_peers')
      .update(body.media ? { seen_at: now, media: body.media } : { seen_at: now })
      .eq('meeting_id', meeting.id)
      .eq('user_id', userId)
  }

  const { data: peers } = await db
    .from('meeting_peers')
    .select('user_id, session_id, tracks, media, seen_at')
    .eq('meeting_id', meeting.id)
    .returns<Peer[]>()
  const here = (peers ?? []).filter((p) => isFresh(p.seen_at) && p.tracks.length > 0)
  const other = here.find((p) => p.user_id !== userId)
  const current = here.length === 2 && !meeting.started_at ? await start(meeting) : meeting

  return json({
    startedAt: current.started_at,
    deadline: new Date(deadlineOf(current)).toISOString(),
    serverTime: new Date().toISOString(),
    other: other ? { tracks: other.tracks, media: other.media } : null,
  })

  async function start(m: Meeting) {
    const { data } = await db
      .from('meetings')
      .update({ started_at: now })
      .eq('id', m.id)
      .is('started_at', null)
      .select(MEETING_COLUMNS)
      .maybeSingle<Meeting>()
    if (data) return data
    const { data: fresh } = await db.from('meetings').select(MEETING_COLUMNS).eq('id', m.id).single<Meeting>()
    return fresh ?? m
  }
})
