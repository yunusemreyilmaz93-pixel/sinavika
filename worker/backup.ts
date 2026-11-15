// Günlük yedek: veritabanı dökümü ve depodaki yeni dosyalar Cloudflare R2'ye (izlek-backups) yazılır.
// Ücretsiz Workers planının işlemci sınırı için döküm ayrıştırılmadan ham bayt olarak saklanır.
// Geri yükleme: scripts/backup/restore.mjs

type R2Object = { key: string; uploaded: Date }
export type R2Bucket = {
  put: (key: string, value: ArrayBuffer, options?: { httpMetadata?: { contentType?: string } }) => Promise<unknown>
  list: (options: { prefix: string; cursor?: string; limit?: number }) => Promise<{ objects: R2Object[]; truncated: boolean; cursor?: string }>
  delete: (keys: string[]) => Promise<void>
}

const KEEP_DAYS = 30
const STORAGE_PER_RUN = 10

function supabase() {
  const url = process.env.SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY
  if (!url || !key) throw new Error('Supabase yapılandırması eksik')
  const headers: Record<string, string> = { apikey: key, 'content-type': 'application/json' }
  if (key.startsWith('eyJ')) headers.authorization = `Bearer ${key}`
  return { url, headers }
}

async function rpc(name: string) {
  const { url, headers } = supabase()
  const res = await fetch(`${url}/rest/v1/rpc/${name}`, { method: 'POST', headers, body: '{}' })
  if (!res.ok) throw new Error(`${name}: ${res.status} ${(await res.text()).slice(0, 200)}`)
  return res
}

async function listAll(bucket: R2Bucket, prefix: string) {
  const out: R2Object[] = []
  let cursor: string | undefined
  do {
    const page = await bucket.list({ prefix, cursor, limit: 1000 })
    out.push(...page.objects)
    cursor = page.truncated ? page.cursor : undefined
  } while (cursor)
  return out
}

async function copyStorage(bucket: R2Bucket) {
  const files = (await (await rpc('backup_storage_list')).json()) as { bucket: string; name: string }[]
  const have = new Set((await listAll(bucket, 'storage/')).map((o) => o.key))
  const missing = files.filter((f) => !have.has(`storage/${f.bucket}/${f.name}`)).slice(0, STORAGE_PER_RUN)
  const { url, headers } = supabase()
  for (const f of missing) {
    const res = await fetch(`${url}/storage/v1/object/${f.bucket}/${f.name.split('/').map(encodeURIComponent).join('/')}`, { headers })
    if (!res.ok) continue
    await bucket.put(`storage/${f.bucket}/${f.name}`, await res.arrayBuffer(), { httpMetadata: { contentType: res.headers.get('content-type') ?? undefined } })
  }
  return missing.length
}

async function prune(bucket: R2Bucket) {
  const cutoff = Date.now() - KEEP_DAYS * 864e5
  const old = (await listAll(bucket, 'db/')).filter((o) => o.uploaded.getTime() < cutoff).map((o) => o.key)
  if (old.length) await bucket.delete(old)
  return old.length
}

async function record(key: string, value: unknown) {
  const { url, headers } = supabase()
  await fetch(`${url}/rest/v1/app_settings?on_conflict=key`, {
    method: 'POST',
    headers: { ...headers, prefer: 'resolution=merge-duplicates' },
    body: JSON.stringify({ key, value }),
  })
}

async function logError(message: string) {
  const { url, headers } = supabase()
  await fetch(`${url}/rest/v1/client_errors`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ message: `Yedek: ${message}`.slice(0, 500), path: 'cron/backup' }),
  }).catch(() => undefined)
}

export async function runBackup(bucket: R2Bucket | undefined) {
  if (!bucket) return { skipped: true }
  try {
    const dump = await (await rpc('backup_dump')).arrayBuffer()
    const key = `db/${new Date().toISOString().slice(0, 10)}.json`
    await bucket.put(key, dump, { httpMetadata: { contentType: 'application/json' } })
    const files = await copyStorage(bucket)
    const pruned = await prune(bucket)
    await record('last_backup', { at: new Date().toISOString(), key, bytes: dump.byteLength })
    return { key, bytes: dump.byteLength, files, pruned }
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err)
    await logError(message)
    return { error: message }
  }
}
