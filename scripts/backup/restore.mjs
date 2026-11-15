// Yedekten geri yükleme. R2'deki günlük dökümü (izlek-backups/db/YYYY-MM-DD.json) SQL dosyasına çevirir.
//
// 1. Dökümü indirin: npx wrangler r2 object get izlek-backups/db/2026-11-15.json --remote --file dump.json
// 2. SQL üretin:     node scripts/backup/restore.mjs dump.json > restore.sql
// 3. Yeni ya da boş bir Supabase projesine önce migration'ları uygulayın, sonra restore.sql dosyasını
//    postgres kullanıcısıyla çalıştırın (psql "$DATABASE_URL" -f restore.sql). Mevcut satırlara dokunmaz.
// Depodaki dosyalar R2'de storage/<kova>/<yol> altında durur, aynı yollarla geri yüklenir.
import { readFileSync } from 'node:fs'

const quote = (value) => `$izlek$${value}$izlek$`

export function restoreSql(dump, { auth = true } = {}) {
  if (dump.version !== 1) throw new Error(`Bilinmeyen döküm sürümü: ${dump.version}`)
  const out = ['begin;', 'set session_replication_role = replica;']
  if (auth && dump.auth_users.length) {
    out.push(`insert into auth.users (instance_id, aud, role, id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, last_sign_in_at)
select '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', u.id, u.email, u.encrypted_password, u.email_confirmed_at, u.raw_app_meta_data, u.raw_user_meta_data, u.created_at, u.updated_at, u.last_sign_in_at
from json_to_recordset(${quote(JSON.stringify(dump.auth_users))}::json) as u (id uuid, email text, encrypted_password text, email_confirmed_at timestamptz, raw_app_meta_data jsonb, raw_user_meta_data jsonb, created_at timestamptz, updated_at timestamptz, last_sign_in_at timestamptz)
on conflict (id) do nothing;`)
    out.push(`insert into auth.identities (id, user_id, provider_id, provider, identity_data, created_at, updated_at)
select gen_random_uuid(), u.id, u.id::text, 'email', jsonb_build_object('sub', u.id::text, 'email', u.email, 'email_verified', true), u.created_at, u.updated_at
from auth.users u where not exists (select 1 from auth.identities i where i.user_id = u.id and i.provider = 'email');`)
  }
  for (const [table, rows] of Object.entries(dump.public)) {
    if (!rows.length) continue
    out.push(`insert into public.${table} overriding system value select * from json_populate_recordset(null::public.${table}, ${quote(JSON.stringify(rows))}::json) on conflict do nothing;`)
  }
  // Kimlik sütunlarının sayaçları geri yüklenen en büyük değerden devam etsin
  out.push(`do $$
declare r record;
begin
  for r in select table_name, column_name from information_schema.columns where table_schema = 'public' and is_identity = 'YES' loop
    execute format('select setval(pg_get_serial_sequence(%L, %L), coalesce((select max(%I) from public.%I), 0) + 1, false)', 'public.' || r.table_name, r.column_name, r.column_name, r.table_name);
  end loop;
end $$;`)
  out.push('set session_replication_role = origin;', 'commit;')
  return out.join('\n\n')
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const file = process.argv[2]
  if (!file) {
    console.error('Kullanım: node scripts/backup/restore.mjs dump.json > restore.sql')
    process.exit(1)
  }
  process.stdout.write(restoreSql(JSON.parse(readFileSync(file, 'utf8'))) + '\n')
}
