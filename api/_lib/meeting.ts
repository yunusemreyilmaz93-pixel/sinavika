// Uygulama içi görüşmenin zaman kuralları ve katılımcı doğrulaması
import { admin, callerId, HttpError } from './server.js'

export const MEETING_MINUTES = 40
export const EARLY_JOIN_MINUTES = 10
export const START_WINDOW_MINUTES = 30
export const PEER_STALE_SECONDS = 20

const MIN = 60_000

export type MeetingTimes = { starts_at: string; started_at: string | null; ended_at: string | null; cancelled_at: string | null }
export type Meeting = MeetingTimes & { id: string; teacher_id: string; student_id: string; mode: 'app' | 'link' }
export type Peer = { user_id: string; session_id: string | null; tracks: unknown[]; media: Record<string, unknown>; seen_at: string }

export const MEETING_COLUMNS = 'id, teacher_id, student_id, mode, starts_at, started_at, ended_at, cancelled_at'

// Görüşmeye şu an girilebilir mi. Başlamadıysa planlanan saatten 10 dk önce ile 30 dk sonra arası,
// başladıysa (iki taraf da bağlandıysa) 40 dakika boyunca
export function joinWindow(m: MeetingTimes, now = Date.now()) {
  if (m.cancelled_at) return { ok: false as const, reason: 'Görüşme iptal edildi' }
  if (m.ended_at) return { ok: false as const, reason: 'Görüşme sona erdi' }
  const starts = Date.parse(m.starts_at)
  if (now < starts - EARLY_JOIN_MINUTES * MIN)
    return { ok: false as const, reason: `Görüşmeye en erken ${EARLY_JOIN_MINUTES} dakika önce girilebilir` }
  const deadline = deadlineOf(m)
  if (now > deadline) return { ok: false as const, reason: 'Görüşme süresi doldu', expired: true }
  return { ok: true as const, deadline }
}

export function deadlineOf(m: Pick<MeetingTimes, 'starts_at' | 'started_at'>) {
  return m.started_at ? Date.parse(m.started_at) + MEETING_MINUTES * MIN : Date.parse(m.starts_at) + START_WINDOW_MINUTES * MIN
}

export function isFresh(seenAt: string, now = Date.now()) {
  return now - Date.parse(seenAt) <= PEER_STALE_SECONDS * 1000
}

export function realtimeConfig() {
  const appId = process.env.CALLS_APP_ID?.trim()
  const secret = process.env.CALLS_APP_SECRET?.trim()
  if (!appId || !secret) return null
  return {
    appId,
    secret,
    turnKeyId: process.env.TURN_KEY_ID?.trim() || undefined,
    turnToken: process.env.TURN_KEY_API_TOKEN?.trim() || undefined,
  }
}

// İsteği yapan kişi bu görüşmenin öğretmeni (öğrencinin şu anki öğretmeni) ya da öğrencisi mi
export async function meetingFor(userId: string, meetingId: string) {
  const db = admin()
  const { data: meeting } = await db.from('meetings').select(MEETING_COLUMNS).eq('id', meetingId).maybeSingle<Meeting>()
  if (!meeting || (userId !== meeting.teacher_id && userId !== meeting.student_id)) throw new HttpError(404, 'Görüşme bulunamadı')
  if (userId === meeting.teacher_id) {
    const { data: student } = await db
      .from('students')
      .select('teacher_id')
      .eq('id', meeting.student_id)
      .maybeSingle<{ teacher_id: string }>()
    if (student?.teacher_id !== userId) throw new HttpError(404, 'Görüşme bulunamadı')
  }
  if (meeting.mode !== 'app') throw new HttpError(400, 'Bu görüşme dış bağlantıyla yapılıyor')
  return meeting
}

// Süresi geçmiş görüşmeyi kapatır ve hata verir
export async function requireOpen(meeting: Meeting) {
  const access = joinWindow(meeting)
  if (access.ok) return access.deadline
  if (access.expired && meeting.started_at && !meeting.ended_at) {
    await admin()
      .from('meetings')
      .update({ ended_at: new Date(deadlineOf(meeting)).toISOString() })
      .eq('id', meeting.id)
  }
  throw new HttpError(410, access.reason)
}

export async function participantFromRequest(request: Request, token: string | null, meetingId: string | null) {
  if (!meetingId || !/^[0-9a-f-]{36}$/i.test(meetingId)) throw new HttpError(400, 'Geçersiz istek')
  const userId = await callerId(new Request(request.url, { headers: token ? { authorization: `Bearer ${token}` } : {} }))
  const meeting = await meetingFor(userId, meetingId)
  return { userId, meeting }
}

export type IceServer = { urls: string | string[]; username?: string; credential?: string }

// Tarayıcılar 53 numaralı portu engeller, o adresler bağlantıyı bekletir
export function browserIceServers(servers: IceServer[]) {
  return servers
    .map((s) => ({ ...s, urls: (Array.isArray(s.urls) ? s.urls : [s.urls]).filter((u) => !/:53(\?|$)/.test(u)) }))
    .filter((s) => s.urls.length > 0)
}
