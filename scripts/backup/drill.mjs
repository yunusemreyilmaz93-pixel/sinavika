// Yedek tatbikatı: son gece dökümünü boş bir veritabanına gerçekten geri yükler ve satır sayılarını karşılaştırır.
// Ayda bir çalıştırılır. Yerel Postgres gerekir (test:db ile aynı).
//   node scripts/backup/drill.mjs                  R2'deki son dökümü Cloudflare API ile indirir
//   node scripts/backup/drill.mjs --file dump.json elle indirilmiş döküm
// Cloudflare isteği CLOUDFLARE_API_TOKEN ile ya da bu oturumun ağ vekiliyle yetkilendirilir
import { readdirSync, readFileSync } from 'node:fs'
import pg from 'pg'
import { supabaseStub } from '../db-stub.mjs'
import { restoreSql } from './restore.mjs'

const ACCOUNT = process.env.CLOUDFLARE_ACCOUNT_ID ?? 'b430291cb7939a82b339d1d466b6a192'
const BUCKET = 'izlek-backups'

async function latestDump() {
  const base = `https://api.cloudflare.com/client/v4/accounts/${ACCOUNT}/r2/buckets/${BUCKET}/objects`
  const headers = process.env.CLOUDFLARE_API_TOKEN ? { authorization: `Bearer ${process.env.CLOUDFLARE_API_TOKEN}` } : {}
  const list = await (await fetch(`${base}?prefix=db/&per_page=1000`, { headers })).json()
  const keys = (list.result ?? []).map((o) => o.key).sort()
  if (!keys.length) throw new Error('R2 kovasında döküm yok')
  const key = keys.at(-1)
  const res = await fetch(`${base}/${encodeURIComponent(key)}`, { headers })
  if (!res.ok) throw new Error(`${key} indirilemedi: ${res.status}`)
  return { key, dump: await res.json() }
}

const fileArg = process.argv.indexOf('--file')
const { key, dump } = fileArg > 0 ? { key: process.argv[fileArg + 1], dump: JSON.parse(readFileSync(process.argv[fileArg + 1], 'utf8')) } : await latestDump()
console.log(`Döküm: ${key}, ${dump.created_at}, ${Object.keys(dump.public).length} tablo, ${dump.auth_users.length} hesap`)

const baseUrl = process.env.TEST_DATABASE_URL ?? 'postgresql://postgres@localhost:54329/postgres'
const name = 'izlek_drill'
const admin = new pg.Client({ connectionString: baseUrl })
await admin.connect()
await admin.query(`drop database if exists ${name} with (force)`)
await admin.query(`create database ${name}`)
const url = new URL(baseUrl)
url.pathname = `/${name}`
const db = new pg.Client({ connectionString: url.toString() })
await db.connect()
await db.query(supabaseStub)
const dir = new URL('../../supabase/migrations/', import.meta.url)
for (const file of readdirSync(dir).filter((f) => f.endsWith('.sql')).sort()) await db.query(readFileSync(new URL(file, dir), 'utf8'))
// Migration'ların eklediği müfredat ve katalog satırları silinir, döküm boş veritabanına yüklenir
const tables = Object.keys(dump.public)
await db.query(`truncate ${tables.map((t) => `public.${t}`).join(', ')} cascade`)
const started = Date.now()
await db.query(restoreSql(dump, { auth: false }))

const mismatches = []
for (const t of tables) {
  const { rows } = await db.query(`select count(*)::int as n from public.${t}`)
  if (rows[0].n !== dump.public[t].length) mismatches.push(`${t}: dökümde ${dump.public[t].length}, yüklenen ${rows[0].n}`)
}
await db.end()
await admin.query(`drop database ${name} with (force)`)
await admin.end()

if (mismatches.length) {
  console.error(`Tatbikat başarısız:\n  ${mismatches.join('\n  ')}`)
  process.exit(1)
}
console.log(`Tatbikat geçti: ${tables.length} tablo, ${tables.reduce((n, t) => n + dump.public[t].length, 0)} satır ${Math.round((Date.now() - started) / 1000)} sn'de geri yüklendi`)
