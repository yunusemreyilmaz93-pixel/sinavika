import { admin, handle } from './_lib/server.js'
import { deviceOf, EVENTS, isBot, normalizePath, referrerName, visitorHash } from './_lib/hit.js'

// Sayfa görüntüleme ve hedef olayları. İstemci sendBeacon ile gönderir, her zaman 204 döner
export const POST = handle(async (request) => {
  const noContent = new Response(null, { status: 204 })
  const userAgent = request.headers.get('user-agent')
  if (isBot(userAgent) || request.headers.get('dnt') === '1' || request.headers.get('sec-gpc') === '1') return noContent

  let body: { path?: unknown; ref?: unknown; utm?: unknown; event?: unknown }
  try {
    body = JSON.parse(await request.text())
  } catch {
    return noContent
  }

  const ownHost = request.headers.get('host')
  const event = typeof body.event === 'string' && EVENTS.has(body.event) ? body.event : null
  const path = normalizePath(body.path)
  if (!event && !path) return noContent

  const ip = request.headers.get('x-forwarded-for')?.split(',')[0].trim() || 'bilinmiyor'
  const day = new Intl.DateTimeFormat('en-CA', { timeZone: 'Europe/Istanbul' }).format(new Date())
  const secret = process.env.STATS_SALT || process.env.SUPABASE_SERVICE_ROLE_KEY || 'yolumnet'

  const { error } = await admin().rpc('record_hit', {
    p_hash: visitorHash(secret, day, ip, userAgent ?? ''),
    p_path: path ?? '/',
    p_ref: referrerName(body.ref, body.utm, ownHost),
    p_device: deviceOf(userAgent ?? ''),
    p_country: request.headers.get('x-vercel-ip-country') ?? '',
    p_event: event,
  })
  if (error) console.error('Ziyaret kaydedilemedi', error.message)
  return noContent
})
