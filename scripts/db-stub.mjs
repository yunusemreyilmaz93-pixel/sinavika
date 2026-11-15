// Supabase'in yerel Postgres'te olmayan parçalarının en küçük karşılığı (roller, auth şeması). test-db ve schema-fingerprint kullanır
export const supabaseStub = `
create schema if not exists extensions;
create extension if not exists pgcrypto with schema extensions;
do $$ begin
  create role anon nologin; create role authenticated nologin; create role service_role nologin bypassrls;
exception when duplicate_object then null; end $$;
create schema auth;
create table auth.users (id uuid primary key, email text, encrypted_password text, email_confirmed_at timestamptz, raw_app_meta_data jsonb, raw_user_meta_data jsonb, created_at timestamptz default now(), updated_at timestamptz default now(), last_sign_in_at timestamptz);
create function auth.uid() returns uuid language sql stable as $$
  select (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')::uuid $$;
create function auth.jwt() returns jsonb language sql stable as $$
  select coalesce(nullif(current_setting('request.jwt.claims', true), '')::jsonb, '{}'::jsonb) $$;
create table auth.mfa_factors (id uuid primary key default gen_random_uuid(), user_id uuid not null, status text not null);
grant execute on function auth.jwt() to anon, authenticated, service_role;
grant usage on schema auth to anon, authenticated, service_role;
grant execute on function auth.uid() to anon, authenticated, service_role;
grant usage on schema extensions to anon, authenticated, service_role;
`
