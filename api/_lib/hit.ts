import { createHash } from 'node:crypto'

const BOT = /bot|crawl|spider|slurp|headless|lighthouse|preview|facebookexternalhit|bingpreview|pingdom|uptime|monitor|curl|wget|python-requests|axios|node-fetch|go-http|java\//i

export function isBot(userAgent: string | null) {
  return !userAgent || BOT.test(userAgent)
}

export function deviceOf(userAgent: string) {
  return /mobi|android|iphone|ipad|ipod/i.test(userAgent) ? 'mobil' : 'masaüstü'
}

// Sorgu ve parça atılır, sayılar ve uzun kimlikler :id olur, yalnızca güvenli karakterler kalır
export function normalizePath(raw: unknown) {
  if (typeof raw !== 'string') return null
  const path = raw.split(/[?#]/)[0].toLowerCase().replace(/\/+$/, '') || '/'
  if (!/^\/[a-z0-9\-_/.:çğıöşü]*$/.test(path) || path.length > 120) return null
  return path
    .split('/')
    .map((part) => (/^\d+$/.test(part) || /^[0-9a-f-]{32,36}$/.test(part) ? ':id' : part))
    .join('/')
}

const engines: [RegExp, string][] = [
  [/(^|\.)google\./, 'google'],
  [/(^|\.)bing\.com$/, 'bing'],
  [/(^|\.)yandex\./, 'yandex'],
  [/(^|\.)duckduckgo\.com$/, 'duckduckgo'],
  [/(^|\.)yahoo\./, 'yahoo'],
  [/(^|\.)ecosia\.org$/, 'ecosia'],
]
const socials: [RegExp, string][] = [
  [/(^|\.)instagram\.com$|^l\.instagram\.com$/, 'instagram'],
  [/(^|\.)facebook\.com$|^fb\.me$|^l\.facebook\.com$/, 'facebook'],
  [/^t\.co$|(^|\.)twitter\.com$|(^|\.)x\.com$/, 'x'],
  [/(^|\.)youtube\.com$|^youtu\.be$/, 'youtube'],
  [/(^|\.)tiktok\.com$/, 'tiktok'],
  [/(^|\.)whatsapp\.com$|^wa\.me$/, 'whatsapp'],
  [/(^|\.)telegram\.org$|^t\.me$/, 'telegram'],
  [/(^|\.)linkedin\.com$|^lnkd\.in$/, 'linkedin'],
  [/(^|\.)reddit\.com$/, 'reddit'],
  [/(^|\.)pinterest\./, 'pinterest'],
]

// Kaynak: utm_source öncelikli, sonra yönlendiren sitenin adı. Kendi sitemizden gelen ya da boş olan "doğrudan" sayılır
export function referrerName(ref: unknown, utm: unknown, ownHost: string | null) {
  if (typeof utm === 'string' && /^[a-z0-9_.-]{1,30}$/i.test(utm)) return utm.toLowerCase()
  if (typeof ref !== 'string' || !ref) return 'doğrudan'
  let host: string
  try {
    host = new URL(ref).hostname.toLowerCase()
  } catch {
    return 'doğrudan'
  }
  if (!host || host === ownHost || host.endsWith('.vercel.app') && ownHost?.endsWith('.vercel.app')) return 'doğrudan'
  for (const [re, name] of [...engines, ...socials]) if (re.test(host)) return name
  return host.replace(/^www\./, '').slice(0, 60)
}

export const EVENTS = new Set(['basvuru-gonderildi', 'davetle-katildi'])

export function visitorHash(secret: string, day: string, ip: string, userAgent: string) {
  return createHash('sha256').update(`${secret}|${day}|${ip}|${userAgent}`).digest('hex').slice(0, 32)
}
