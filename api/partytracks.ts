import { jwtVerify, SignJWT } from 'jose'
import { admin, handle, HttpError, json } from './_lib/server.js'
import { browserIceServers, participantFromRequest, realtimeConfig, requireOpen, type IceServer } from './_lib/meeting.js'

const PREFIX = '/api/partytracks'
const SFU = 'https://rtc.live.cloudflare.com/v1'

type Config = NonNullable<ReturnType<typeof realtimeConfig>>

// Tarayıcıdaki partytracks istemcisi Realtime SFU'ya bu yoldan ulaşır. Her istekte görüşmenin katılımcısı ve saati doğrulanır,
// başka bir görüşmenin oturumundan iz çekilemez, bir oturumu yalnızca onu açan tarayıcı değiştirebilir.
// Uygulama anahtarı yalnızca burada kullanılır
async function proxy(request: Request) {
  const config = realtimeConfig()
  if (!config) throw new HttpError(503, 'Uygulama içi görüşme şu an kullanılamıyor')
  const url = new URL(request.url)
  const path = url.pathname.slice(PREFIX.length)
  const { meeting } = await participantFromRequest(request, request.headers.get('x-izlek-auth'), request.headers.get('x-meeting-id'))
  await requireOpen(meeting)

  if (path === '/generate-ice-servers') return json({ iceServers: await iceServers(config) })
  if (!/^\/sessions\/(new|[A-Za-z0-9_-]+(\/[a-z/]+)?)$/.test(path)) throw new HttpError(404, 'Bulunamadı')

  const body = request.method === 'GET' ? undefined : await request.text()
  if (body && body.length > 100_000) throw new HttpError(413, 'İstek çok büyük')
  const key = new TextEncoder().encode(config.secret)

  if (path === '/sessions/new') {
    const res = await sfu(config, path + url.search, request.method, body)
    const data = (await res.json()) as { sessionId?: string }
    if (!res.ok || !data.sessionId) return json(data, res.status)
    const token = await new SignJWT({ sessionId: data.sessionId })
      .setProtectedHeader({ alg: 'HS256' })
      .setIssuedAt()
      .setExpirationTime('3h')
      .sign(key)
    const response = json(data, res.status)
    response.headers.append('set-cookie', `pt-${data.sessionId}=${token}; HttpOnly; Secure; SameSite=Strict; Path=${PREFIX}; Max-Age=10800`)
    return response
  }

  const sessionId = path.split('/')[2]
  const cookie = (request.headers.get('cookie') ?? '').split(/;\s*/).find((c) => c.startsWith(`pt-${sessionId}=`))
  const verified = cookie ? await jwtVerify(cookie.slice(cookie.indexOf('=') + 1), key).catch(() => null) : null
  if (verified?.payload.sessionId !== sessionId) throw new HttpError(401, 'Görüşme bağlantısı doğrulanamadı, yeniden katılın')

  // Karşıdan iz çekme isteği yalnızca bu görüşmedeki oturumlardan yapılabilir
  if (path.endsWith('/tracks/new') && body) {
    const tracks = (JSON.parse(body) as { tracks?: { location?: string; sessionId?: string }[] }).tracks ?? []
    const remote = tracks.filter((t) => t.location === 'remote')
    if (remote.length) {
      const { data: peers } = await admin().from('meeting_peers').select('session_id').eq('meeting_id', meeting.id)
      const allowed = new Set((peers ?? []).map((p) => p.session_id))
      if (remote.some((t) => !t.sessionId || !allowed.has(t.sessionId))) throw new HttpError(403, 'Bu görüşmeye ait olmayan bağlantı')
    }
  }

  const res = await sfu(config, path + url.search, request.method, body)
  return new Response(res.body, {
    status: res.status,
    headers: { 'content-type': res.headers.get('content-type') ?? 'application/json', 'cache-control': 'no-store' },
  })
}

function sfu(config: Config, path: string, method: string, body?: string) {
  return fetch(`${SFU}/apps/${config.appId}${path}`, {
    method,
    headers: { authorization: `Bearer ${config.secret}`, 'content-type': 'application/json' },
    body: body || undefined,
  })
}

async function iceServers(config: Config): Promise<IceServer[]> {
  const stun = [{ urls: ['stun:stun.cloudflare.com:3478'] }]
  if (!config.turnKeyId || !config.turnToken) return stun
  const res = await fetch(`${SFU}/turn/keys/${config.turnKeyId}/credentials/generate-ice-servers`, {
    method: 'POST',
    headers: { authorization: `Bearer ${config.turnToken}`, 'content-type': 'application/json' },
    body: JSON.stringify({ ttl: 3 * 60 * 60 }),
  }).catch(() => null)
  const data = res?.ok ? ((await res.json().catch(() => null)) as { iceServers?: IceServer[] } | null) : null
  return data?.iceServers?.length ? browserIceServers(data.iceServers) : stun
}

const handler = handle(proxy)
export const GET = handler
export const POST = handler
export const PUT = handler
