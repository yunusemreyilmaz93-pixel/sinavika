-- İşletim: günlük yedek ve hata alarmı
-- Yedek: Worker cron'u backup_dump() çıktısını Cloudflare R2'ye (izlek-backups) yazar. Migration'lardan yeniden üretilebilen
-- büyük katalog tabloları (YÖK Atlas, kitap ve film kataloğu) dışarıda kalır. auth.users satırları da girer, geri yüklemede
-- herkesin şifresi korunur

create or replace function public.backup_dump() returns json
language plpgsql security definer set search_path = ''
set statement_timeout = '60s'
as $$
declare
  t text;
  rows json;
  out jsonb := '{}'::jsonb;
  skip constant text[] := array['program_results', 'programs', 'universities', 'catalog_books', 'catalog_media'];
begin
  for t in
    select c.relname from pg_class c join pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public' and c.relkind = 'r' and not (c.relname = any (skip))
    order by c.relname
  loop
    execute format('select coalesce(json_agg(x), ''[]''::json) from public.%I x', t) into rows;
    out := out || jsonb_build_object(t, rows);
  end loop;
  select coalesce(json_agg(u), '[]'::json) into rows from (
    select id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, last_sign_in_at
    from auth.users
  ) u;
  return json_build_object('version', 1, 'created_at', now(), 'auth_users', rows, 'public', out);
end $$;

-- Depodaki dosyaların listesi. Worker yalnızca R2'de olmayanları kopyalar
create or replace function public.backup_storage_list() returns json
language plpgsql stable security definer set search_path = ''
as $$
declare
  result json;
begin
  select coalesce(json_agg(json_build_object('bucket', bucket_id, 'name', name)), '[]'::json) into result from storage.objects;
  return result;
end $$;

revoke all on function public.backup_dump() from public, anon, authenticated;
revoke all on function public.backup_storage_list() from public, anon, authenticated;
grant execute on function public.backup_dump() to service_role;
grant execute on function public.backup_storage_list() to service_role;

-- Hata alarmı: kullanıcıda ya da sunucuda beklenmeyen bir hata kaydedilince yöneticilere bildirim gider. Saatte en fazla bir
-- yeni bildirim, arada gelenler aynı bildirimin sayısını artırır
create or replace function private.notify_client_error() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  admin_id uuid;
  recent integer;
begin
  select count(*) into recent from public.client_errors where created_at > now() - interval '24 hours';
  for admin_id in select id from public.profiles where is_admin and status = 'active' loop
    if exists (
      select 1 from public.notifications n
      where n.user_id = admin_id and n.dedupe_key = 'client-errors' and n.read_at is null and n.created_at > now() - interval '1 hour'
    ) then
      update public.notifications n set body = recent || ' hata (son 24 saat). Son: ' || left(new.message, 120)
        where n.user_id = admin_id and n.dedupe_key = 'client-errors' and n.read_at is null;
      continue;
    end if;
    perform private.notify(
      admin_id, 'error', 'Uygulamada hata kaydedildi',
      recent || ' hata (son 24 saat). Son: ' || left(new.message, 120),
      '/app/yonetim?bolum=hatalar', 'client-errors'
    );
  end loop;
  return new;
end $$;

create trigger client_errors_notify after insert on public.client_errors
for each row execute function private.notify_client_error();
