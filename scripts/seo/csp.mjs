// İçerik Güvenlik Politikası. Satır içi betiklere izin unsafe-inline ile değil, derlemedeki her betiğin SHA-256 özetiyle verilir.
// Derleme sonunda dist içindeki bütün HTML dosyaları taranır ve politika dist/_headers içindeki __CSP__ yerine yazılır.
// Yeni bir dış adres (betik, görsel, iframe, bağlantı) eklenirse buraya da eklenmeli, yoksa tarayıcı engeller
import { createHash } from 'node:crypto'
import { readdirSync, readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'

function htmlFiles(dir) {
  return readdirSync(dir, { withFileTypes: true }).flatMap((e) =>
    e.isDirectory() ? htmlFiles(join(dir, e.name)) : e.name.endsWith('.html') ? [join(dir, e.name)] : [],
  )
}

export function inlineScriptHashes(html) {
  const hashes = new Set()
  for (const m of html.matchAll(/<script(?![^>]*\bsrc=)([^>]*)>([\s\S]*?)<\/script>/g)) {
    if (/application\/ld\+json/.test(m[1])) continue
    hashes.add(`'sha256-${createHash('sha256').update(m[2]).digest('base64')}'`)
  }
  return hashes
}

export function cspPolicy(hashes, supabaseUrl) {
  const supabase = supabaseUrl ? new URL(supabaseUrl).host : '*.supabase.co'
  return [
    "default-src 'self'",
    `script-src 'self' 'wasm-unsafe-eval' ${[...hashes].sort().join(' ')} https://www.youtube.com https://s.ytimg.com https://static.cloudflareinsights.com`,
    "style-src 'self' 'unsafe-inline'",
    `img-src 'self' data: blob: https://${supabase} https://i.ytimg.com`,
    "font-src 'self' data:",
    `connect-src 'self' https://${supabase} wss://${supabase} https://cloudflareinsights.com`,
    "media-src 'self' blob:",
    'frame-src https://www.youtube-nocookie.com https://www.youtube.com',
    "worker-src 'self' blob:",
    "manifest-src 'self'",
    "object-src 'none'",
    "base-uri 'self'",
    "form-action 'self'",
    "frame-ancestors 'none'",
    'upgrade-insecure-requests',
  ].join('; ')
}

export function writeCsp(dist, supabaseUrl) {
  const hashes = new Set()
  for (const file of htmlFiles(dist)) for (const h of inlineScriptHashes(readFileSync(file, 'utf8'))) hashes.add(h)
  const target = join(dist, '_headers')
  const headers = readFileSync(target, 'utf8')
  if (!headers.includes('__CSP__')) throw new Error('dist/_headers içinde __CSP__ yer tutucusu yok')
  writeFileSync(target, headers.replace('__CSP__', cspPolicy(hashes, supabaseUrl)))
  return hashes.size
}
