-- Öğretmenin kendi yapay zekâ anahtarı ve günlük kullanım sınırı --------------------
-- Anahtar sunucuda şifrelenip yazılır. İstemci şifreli metni okuyamaz, yazamaz, silemez.

create table public.teacher_ai_keys (
  teacher_id uuid primary key references public.profiles (id) on delete cascade,
  provider text not null check (provider in ('anthropic', 'openai', 'gemini')),
  model text not null check (char_length(model) between 1 and 80),
  key_ciphertext text not null,
  key_last4 text not null check (char_length(key_last4) = 4),
  consented_at timestamptz not null default now(),
  created_at timestamptz not null default now()
);

alter table public.teacher_ai_keys enable row level security;
create policy "own ai key status" on public.teacher_ai_keys for select to authenticated
  using (teacher_id = auth.uid());
revoke all on table public.teacher_ai_keys from public, anon, authenticated;
grant select (teacher_id, provider, model, key_last4, consented_at, created_at) on public.teacher_ai_keys to authenticated;

create table public.ai_usage (
  teacher_id uuid not null references public.profiles (id) on delete cascade,
  day date not null default private.today(),
  calls integer not null default 0,
  primary key (teacher_id, day)
);
alter table public.ai_usage enable row level security;
revoke all on table public.ai_usage from public, anon, authenticated;

create or replace function public.ai_take_quota(p_teacher uuid, p_limit integer) returns boolean
language plpgsql security definer set search_path = ''
as $$
declare
  taken integer;
begin
  insert into public.ai_usage as u (teacher_id, day, calls) values (p_teacher, private.today(), 1)
  on conflict (teacher_id, day) do update set calls = u.calls + 1 where u.calls < p_limit
  returning u.calls into taken;
  delete from public.ai_usage where day < private.today() - 7;
  return taken is not null;
end $$;

revoke all on function public.ai_take_quota(uuid, integer) from public, anon, authenticated;
grant execute on function public.ai_take_quota(uuid, integer) to service_role;
