// Uygulama içi görüşmenin zaman kuralları ve Cloudflare Realtime çağrıları
import { HttpError } from './server.js'

export const MEETING_MINUTES = 40
export const EARLY_JOIN_MINUTES = 10
export const START_WINDOW_MINUTES = 30
export const PEER_STALE_SECONDS = 20
export const TRACK_NAMES = ['audio', 'video'] as const

const MIN = 60_000

export type MeetingTimes = { starts_at: string; started_at: string | null; ended_at: string | null; cancelled_at: string | null }

// Görüşmeye şu an girilebilir mi. Başlamadıysa planlanan saatten 10 dk önce ile 30 dk sonra arası,
// başladıysa (iki taraf da bağlandıysa) 40 dakika boyunca
export function joinWindow(m: MeetingTimes, now = Date.now()) {
  if (m.cancelled_at) return { ok: false as const, reason: 'Görüşme iptal edildi' }
  if (m.ended_at) return { ok: false as const, reason: 'Görüşme sona erdi' }
  const starts = Date.parse(m.starts_at)
  if (now < starts - EARLY_JOIN_MINUTES * MIN) return { ok: false as const, reason: `Görüşmeye en erken ${EARLY_JOIN_MINUTES} dakika önce girilebilir` }
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
  return { appId, secret, turnKeyId: process.env.TURN_KEY_ID?.trim() || null, turnToken: process.env.TURN_KEY_API_TOKEN?.trim() || null }
}

type Config = NonNullable<ReturnType<typeof realtimeConfig>>

export type SessionDescription = { type: 'offer' | 'answer'; sdp: string }
export type TrackResult = { trackName?: string; mid?: string; sessionId?: string; errorCode?: string; errorDescription?: string }
export type TracksResponse = { sessionDescription?: SessionDescription; requiresImmediateRenegotiation?: boolean; tracks?: TrackResult[]; errorCode?: string; errorDescription?: string }

async function sfu<T>(config: Config, path: string, init: { method: 'POST' | 'PUT'; body?: unknown }): Promise<T> {
  const res = await fetch(`https://rtc.live.cloudflare.com/v1/apps/${config.appId}${path}`, {
    method: init.method,
    headers: { authorization: `Bearer ${config.secret}`, 'content-type': 'application/json' },
    body: init.body === undefined ? undefined : JSON.stringify(init.body),
    signal: AbortSignal.timeout(10_000),
  }).catch(() => null)
  if (!res) throw new HttpError(502, 'Görüşme sunucusuna ulaşılamadı, tekrar deneyin')
  const data = (await res.json().catch(() => ({}))) as T & { errorCode?: string; errorDescription?: string }
  if (!res.ok || data.errorCode) {
    console.error('realtime', path, res.status, data.errorCode, data.errorDescription)
    throw new HttpError(502, 'Görüşme bağlantısı kurulamadı, tekrar deneyin')
  }
  return data
}

export async function newSession(config: Config) {
  const data = await sfu<{ sessionId?: string }>(config, '/sessions/new', { method: 'POST' })
  if (!data.sessionId) throw new HttpError(502, 'Görüşme bağlantısı kurulamadı, tekrar deneyin')
  return data.sessionId
}

export function pushTracks(config: Config, sessionId: string, sdp: string, tracks: { mid: string; trackName: string }[]) {
  return sfu<TracksResponse>(config, `/sessions/${encodeURIComponent(sessionId)}/tracks/new`, {
    method: 'POST',
    body: { sessionDescription: { type: 'offer', sdp }, tracks: tracks.map((t) => ({ location: 'local', mid: t.mid, trackName: t.trackName })) },
  })
}

export function pullTracks(config: Config, sessionId: string, remoteSessionId: string) {
  return sfu<TracksResponse>(config, `/sessions/${encodeURIComponent(sessionId)}/tracks/new`, {
    method: 'POST',
    body: { tracks: TRACK_NAMES.map((trackName) => ({ location: 'remote', sessionId: remoteSessionId, trackName })) },
  })
}

export function renegotiate(config: Config, sessionId: string, sdp: string) {
  return sfu<Record<string, unknown>>(config, `/sessions/${encodeURIComponent(sessionId)}/renegotiate`, {
    method: 'PUT',
    body: { sessionDescription: { type: 'answer', sdp } },
  })
}

type IceServer = { urls: string | string[]; username?: string; credential?: string }

// Tarayıcılar 53 numaralı portu engeller, o adresler bağlantıyı bekletir
export function browserIceServers(servers: IceServer[]): IceServer[] {
  return servers
    .map((s) => ({ ...s, urls: (Array.isArray(s.urls) ? s.urls : [s.urls]).filter((u) => !/:53(\?|$)/.test(u)) }))
    .filter((s) => s.urls.length > 0)
}

export async function iceServers(config: Config): Promise<IceServer[]> {
  const stun: IceServer[] = [{ urls: 'stun:stun.cloudflare.com:3478' }]
  if (!config.turnKeyId || !config.turnToken) return stun
  const res = await fetch(`https://rtc.live.cloudflare.com/v1/turn/keys/${config.turnKeyId}/credentials/generate-ice-servers`, {
    method: 'POST',
    headers: { authorization: `Bearer ${config.turnToken}`, 'content-type': 'application/json' },
    body: JSON.stringify({ ttl: (MEETING_MINUTES + START_WINDOW_MINUTES + EARLY_JOIN_MINUTES) * 60 }),
    signal: AbortSignal.timeout(6000),
  }).catch(() => null)
  const data = res?.ok ? ((await res.json().catch(() => null)) as { iceServers?: IceServer[] } | null) : null
  return data?.iceServers?.length ? browserIceServers(data.iceServers) : stun
}
