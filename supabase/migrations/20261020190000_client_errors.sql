-- Kullanıcıların karşılaştığı hatalar admin panelinde görünsün diye kaydedilir

create table public.client_errors (
  id bigint generated always as identity primary key,
  user_id uuid references public.profiles (id) on delete set null,
  role public.user_role,
  message text not null check (char_length(message) <= 500),
  shown text check (char_length(shown) <= 300),
  path text check (char_length(path) <= 300),
  detail text check (char_length(detail) <= 2000),
  user_agent text check (char_length(user_agent) <= 300),
  version text check (char_length(version) <= 40),
  created_at timestamptz not null default now()
);
create index client_errors_created_idx on public.client_errors (created_at desc);
create index client_errors_user_idx on public.client_errors (user_id, created_at desc);

alter table public.client_errors enable row level security;
create policy "errors admin read" on public.client_errors for select to authenticated using (private.is_admin());
create policy "errors admin delete" on public.client_errors for delete to authenticated using (private.is_admin());
grant select, delete on public.client_errors to authenticated;
grant all on public.client_errors to service_role;

create or replace function public.log_client_error(
  p_message text, p_shown text, p_path text, p_detail text, p_user_agent text, p_version text
) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  me uuid := auth.uid();
  recent integer;
begin
  select count(*) into recent from public.client_errors e
    where e.created_at > now() - interval '1 hour'
      and (e.user_id = me or (me is null and e.user_id is null));
  if recent >= (case when me is null then 200 else 30 end) then
    return;
  end if;
  insert into public.client_errors (user_id, role, message, shown, path, detail, user_agent, version)
  values (
    me,
    (select p.role from public.profiles p where p.id = me),
    left(coalesce(nullif(trim(p_message), ''), 'Bilinmeyen hata'), 500),
    left(p_shown, 300), left(p_path, 300), left(p_detail, 2000), left(p_user_agent, 300), left(p_version, 40)
  );
  delete from public.client_errors where created_at < now() - interval '30 days';
end $$;

revoke all on function public.log_client_error(text, text, text, text, text, text) from public;
grant execute on function public.log_client_error(text, text, text, text, text, text) to anon, authenticated;
