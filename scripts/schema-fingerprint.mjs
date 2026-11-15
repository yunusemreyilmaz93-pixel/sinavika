// Şema parmak izi: migration dosyalarından kurulan boş bir veritabanı ile canlı veritabanının aynı olduğunu denetler.
// Elle uygulanmış ya da unutulmuş bir migration'ı yakalar.
//   node scripts/schema-fingerprint.mjs            yereldeki dökümü yazdırır (JSON: nesne -> özet)
//   node scripts/schema-fingerprint.mjs --sql      canlıda çalıştırılacak sorguyu yazdırır
//   node scripts/schema-fingerprint.mjs --compare canli.json   yerel ile canlı sonucunu karşılaştırır
// Politika ifadeleri Postgres sürümüne göre farklı yazılabildiği için yalnızca adları ve komutları karşılaştırılır
import { readdirSync, readFileSync } from 'node:fs'
import pg from 'pg'
import { supabaseStub } from './db-stub.mjs'

export const fingerprintSql = `
select jsonb_object_agg(k, v) as fp from (
  select 'column:' || table_name || '.' || column_name as k,
         md5(data_type || ':' || udt_name || ':' || is_nullable || ':' || coalesce(column_default, '')) as v
  from information_schema.columns where table_schema = 'public'
  union all
  select 'function:' || n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')',
         md5(p.prosrc || ':' || p.prosecdef::text)
  from pg_proc p join pg_namespace n on n.oid = p.pronamespace where n.nspname in ('public', 'private')
  union all
  select 'policy:' || tablename || '.' || policyname, md5(cmd || ':' || array_to_string(roles, ','))
  from pg_policies where schemaname = 'public'
  union all
  select 'trigger:' || c.relname || '.' || t.tgname, md5(p.proname)
  from pg_trigger t join pg_class c on c.oid = t.tgrelid join pg_namespace n on n.oid = c.relnamespace
  join pg_proc p on p.oid = t.tgfoid where n.nspname = 'public' and not t.tgisinternal
  union all
  select 'index:' || indexname, md5(regexp_replace(indexdef, '\\s+', ' ', 'g')) from pg_indexes where schemaname = 'public'
) x`

async function local() {
  const baseUrl = process.env.TEST_DATABASE_URL ?? 'postgresql://postgres@localhost:54329/postgres'
  const name = 'izlek_fingerprint'
  const admin = new pg.Client({ connectionString: baseUrl })
  await admin.connect()
  await admin.query(`drop database if exists ${name} with (force)`)
  await admin.query(`create database ${name}`)
  const url = new URL(baseUrl)
  url.pathname = `/${name}`
  const db = new pg.Client({ connectionString: url.toString() })
  await db.connect()
  await db.query(supabaseStub)
  const dir = new URL('../supabase/migrations/', import.meta.url)
  for (const file of readdirSync(dir).filter((f) => f.endsWith('.sql')).sort()) await db.query(readFileSync(new URL(file, dir), 'utf8'))
  const { rows } = await db.query(fingerprintSql)
  if (process.argv.includes('--summary')) console.table((await db.query(summarySql)).rows)
  await db.end()
  await admin.query(`drop database ${name} with (force)`)
  await admin.end()
  return rows[0].fp
}

// Türe göre özet: canlıyla önce bunu karşılaştırmak yeterli, fark çıkan türde ayrıntıya inilir
export const summarySql = `with fp as (${fingerprintSql.replace('select jsonb_object_agg(k, v) as fp from (', 'select * from (')})
select split_part(k, ':', 1) as kind, count(*)::int as n, md5(string_agg(k || '=' || v, ',' order by k)) as h from fp group by 1 order by 1`

const [flag, file] = process.argv.slice(2)
if (flag === '--sql') {
  console.log(fingerprintSql.trim())
} else if (flag === '--summary-sql') {
  console.log(summarySql)
} else {
  const mine = await local()
  if (flag !== '--compare') {
    console.log(JSON.stringify(mine))
  } else {
    const raw = JSON.parse(readFileSync(file, 'utf8'))
    const live = raw.fp ?? raw[0]?.fp ?? raw
    const keys = [...new Set([...Object.keys(mine), ...Object.keys(live)])].sort()
    const missing = keys.filter((k) => !(k in live))
    const extra = keys.filter((k) => !(k in mine))
    const changed = keys.filter((k) => k in live && k in mine && live[k] !== mine[k])
    for (const [label, list] of [['Canlıda eksik', missing], ['Canlıda fazla', extra], ['Farklı', changed]]) {
      if (list.length) console.log(`${label} (${list.length}):\n  ${list.join('\n  ')}`)
    }
    if (!missing.length && !changed.length) console.log(`Şema aynı (${keys.length} nesne${extra.length ? `, canlıda ${extra.length} fazla` : ''})`)
    process.exitCode = missing.length || changed.length ? 1 : 0
  }
}
