-- Supabase ücretsiz planında veritabanı sınırı 500 MB. Boyut /api/health ve günlük işte izlenir
create or replace function public.db_size_mb() returns integer
language sql stable security definer set search_path = ''
as $$ select (pg_database_size(current_database()) / 1024 / 1024)::integer $$;

revoke all on function public.db_size_mb() from public, anon, authenticated;
grant execute on function public.db_size_mb() to service_role;
