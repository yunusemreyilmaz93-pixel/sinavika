// @vitest-environment node
import { afterEach, describe, expect, it, vi } from 'vitest'
import { browserIceServers, deadlineOf, joinWindow, MEETING_MINUTES } from '../api/_lib/meeting.ts'

const MIN = 60_000
const at = (iso: string) => Date.parse(iso)
const base = { starts_at: '2026-11-20T16:00:00Z', started_at: null, ended_at: null, cancelled_at: null }

function post(body: unknown) {
  return new Request('http://localhost/api/meeting', { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify(body) })
}

afterEach(() => {
  vi.unstubAllEnvs()
})

describe('görüşme zaman kuralları', () => {
  it('planlanan saatten 10 dakika önce açılır, daha önce açılmaz', () => {
    expect(joinWindow(base, at('2026-11-20T15:49:00Z')).ok).toBe(false)
    expect(joinWindow(base, at('2026-11-20T15:51:00Z')).ok).toBe(true)
  })

  it('kimse başlatmazsa 30 dakika sonra kapanır', () => {
    expect(joinWindow(base, at('2026-11-20T16:29:00Z')).ok).toBe(true)
    const late = joinWindow(base, at('2026-11-20T16:31:00Z'))
    expect(late.ok).toBe(false)
    expect(!late.ok && late.expired).toBe(true)
  })

  it('iki taraf bağlanınca 40 dakika sürer', () => {
    const started = { ...base, started_at: '2026-11-20T16:05:00Z' }
    expect(deadlineOf(started) - at(started.started_at)).toBe(MEETING_MINUTES * MIN)
    expect(joinWindow(started, at('2026-11-20T16:44:00Z')).ok).toBe(true)
    expect(joinWindow(started, at('2026-11-20T16:46:00Z')).ok).toBe(false)
  })

  it('iptal edilen ya da biten görüşmeye girilmez', () => {
    expect(joinWindow({ ...base, cancelled_at: '2026-11-19T10:00:00Z' }, at('2026-11-20T16:00:00Z')).ok).toBe(false)
    expect(joinWindow({ ...base, started_at: '2026-11-20T16:00:00Z', ended_at: '2026-11-20T16:20:00Z' }, at('2026-11-20T16:21:00Z')).ok).toBe(false)
  })

  it('tarayıcının engellediği 53 numaralı port çıkarılır', () => {
    const servers = browserIceServers([
      { urls: ['stun:stun.cloudflare.com:3478', 'stun:stun.cloudflare.com:53'] },
      { urls: ['turn:turn.cloudflare.com:53?transport=udp', 'turns:turn.cloudflare.com:443?transport=tcp'], username: 'u', credential: 'c' },
    ])
    expect(servers.flatMap((s) => s.urls)).toEqual(['stun:stun.cloudflare.com:3478', 'turns:turn.cloudflare.com:443?transport=tcp'])
  })
})

describe('api/meeting', () => {
  it('geçersiz isteği reddeder', async () => {
    const { POST } = await import('../api/meeting.ts')
    const res = await POST(post({ action: 'join', meetingId: 'x' }))
    expect(res.status).toBe(400)
  })

  it('Realtime anahtarı yoksa görüşme bağlantısına yönlendirir', async () => {
    vi.stubEnv('CALLS_APP_ID', '')
    vi.stubEnv('CALLS_APP_SECRET', '')
    const { POST } = await import('../api/meeting.ts')
    const res = await POST(post({ action: 'join', meetingId: '7f3c2a8e-1d4b-4c6a-9e2f-0a1b2c3d4e5f' }))
    expect(res.status).toBe(503)
    expect(((await res.json()) as { error: string }).error).toContain('Görüşme bağlantısıyla')
  })

  it('oturum olmadan görüşme bilgisine erişilemez', async () => {
    vi.stubEnv('CALLS_APP_ID', 'app')
    vi.stubEnv('CALLS_APP_SECRET', 'secret')
    const { POST } = await import('../api/meeting.ts')
    const res = await POST(post({ action: 'state', meetingId: '7f3c2a8e-1d4b-4c6a-9e2f-0a1b2c3d4e5f' }))
    expect(res.status).toBe(401)
  })
})
