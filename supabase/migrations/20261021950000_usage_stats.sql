-- Kullanım istatistikleri. Yalnızca hesap, rol, süre ve sayfa adı tutulur. IP, tarayıcı bilgisi ve sayfa içeriği tutulmaz.
-- Test hesapları (is_test) hiç kaydedilmez. Yalnızca yönetici okuyabilir.

create table public.usage_sessions (
  id bigint generated always as identity primary key,
  user_id uuid not null references public.profiles (id) on delete cascade,
  role public.user_role not null,
  started_at timestamptz not null default now(),
  last_ping_at timestamptz not null default now(),
  seconds integer not null default 0 check (seconds >= 0),
  last_path text
);
create index usage_sessions_user_idx on public.usage_sessions (user_id, started_at desc);
create index usage_sessions_started_idx on public.usage_sessions (started_at desc);

create table public.usage_pages (
  day date not null,
  role public.user_role not null,
  path text not null check (char_length(path) <= 80),
  seconds bigint not null default 0,
  visits integer not null default 0,
  primary key (day, role, path)
);

alter table public.usage_sessions enable row level security;
alter table public.usage_pages enable row level security;
revoke all on public.usage_sessions, public.usage_pages from anon, authenticated;

-- İstemci dakikada bir çağırır. Son çağrıdan 5 dakikadan fazla geçtiyse yeni oturum açılır.
create or replace function public.usage_ping(p_path text) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  me uuid := auth.uid();
  prof record;
  cur public.usage_sessions;
  gap integer;
  v_path text := left(coalesce(nullif(trim(p_path), ''), '/'), 80);
  v_day date := (now() at time zone 'Europe/Istanbul')::date;
begin
  if me is null then
    return;
  end if;
  select p.role, p.is_test into prof from public.profiles p where p.id = me;
  if not found or prof.is_test then
    return;
  end if;

  select * into cur from public.usage_sessions s
    where s.user_id = me and s.last_ping_at > now() - interval '5 minutes'
    order by s.last_ping_at desc limit 1;

  if not found then
    insert into public.usage_sessions (user_id, role, last_path) values (me, prof.role, v_path);
    insert into public.usage_pages (day, role, path, visits) values (v_day, prof.role, v_path, 1)
      on conflict (day, role, path) do update set visits = public.usage_pages.visits + 1;
    delete from public.usage_sessions where started_at < now() - interval '400 days';
    delete from public.usage_pages where public.usage_pages.day < (now() - interval '400 days')::date;
    return;
  end if;

  gap := least(extract(epoch from now() - cur.last_ping_at)::integer, 90);
  if gap < 20 then
    return;
  end if;
  update public.usage_sessions set last_ping_at = now(), seconds = seconds + gap, last_path = v_path where id = cur.id;
  insert into public.usage_pages (day, role, path, seconds, visits)
    values (v_day, prof.role, v_path, gap, case when cur.last_path is distinct from v_path then 1 else 0 end)
    on conflict (day, role, path) do update
      set seconds = public.usage_pages.seconds + gap,
          visits = public.usage_pages.visits + case when cur.last_path is distinct from v_path then 1 else 0 end;
end $$;

-- Yönetici özeti: gün gün aktif kullanıcı, rol bazlı toplamlar, saat dağılımı, sayfalar
create or replace function public.admin_usage(p_days integer default 30) returns jsonb
language plpgsql stable security definer set search_path = ''
as $$
declare
  days integer := least(greatest(coalesce(p_days, 30), 1), 180);
  since timestamptz := now() - make_interval(days => days);
  result jsonb;
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  select jsonb_build_object(
    'active', (
      select jsonb_build_object(
        'd1', count(distinct user_id) filter (where last_ping_at > now() - interval '1 day'),
        'd7', count(distinct user_id) filter (where last_ping_at > now() - interval '7 days'),
        'd30', count(distinct user_id) filter (where last_ping_at > now() - interval '30 days')
      ) from public.usage_sessions
    ),
    'by_role', coalesce((
      select jsonb_agg(jsonb_build_object(
        'role', role, 'users', users, 'sessions', sessions, 'seconds', seconds
      ) order by role)
      from (
        select role, count(distinct user_id) users, count(*) sessions, sum(seconds) seconds
        from public.usage_sessions where started_at >= since group by role
      ) r
    ), '[]'::jsonb),
    'daily', coalesce((
      select jsonb_agg(jsonb_build_object('day', d.day, 'teacher', d.teacher, 'student', d.student, 'parent', d.parent) order by d.day)
      from (
        select (started_at at time zone 'Europe/Istanbul')::date as day,
          count(distinct user_id) filter (where role = 'teacher') teacher,
          count(distinct user_id) filter (where role = 'student') student,
          count(distinct user_id) filter (where role = 'parent') parent
        from public.usage_sessions where started_at >= since group by 1
      ) d
    ), '[]'::jsonb),
    'hours', coalesce((
      select jsonb_agg(jsonb_build_object('hour', h.hour, 'sessions', h.n) order by h.hour)
      from (
        select extract(hour from started_at at time zone 'Europe/Istanbul')::integer as hour, count(*) n
        from public.usage_sessions where started_at >= since group by 1
      ) h
    ), '[]'::jsonb),
    'pages', coalesce((
      select jsonb_agg(jsonb_build_object('role', g.role, 'path', g.path, 'seconds', g.seconds, 'visits', g.visits) order by g.seconds desc)
      from (
        select role, path, sum(seconds) seconds, sum(visits) visits
        from public.usage_pages where day >= (now() - make_interval(days => days))::date
        group by role, path order by sum(seconds) desc limit 40
      ) g
    ), '[]'::jsonb)
  ) into result;
  return result;
end $$;

-- Kullanıcı bazında liste
create or replace function public.admin_usage_users(p_days integer default 30)
returns table (
  id uuid, full_name text, role public.user_role, last_seen_at timestamptz,
  sessions integer, seconds bigint, avg_seconds integer, first_seen_at timestamptz
)
language plpgsql stable security definer set search_path = ''
as $$
declare
  days integer := least(greatest(coalesce(p_days, 30), 1), 180);
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  return query
    select p.id, p.full_name, p.role,
      max(s.last_ping_at),
      count(*)::integer,
      coalesce(sum(s.seconds), 0)::bigint,
      coalesce(avg(s.seconds), 0)::integer,
      (select min(a.started_at) from public.usage_sessions a where a.user_id = p.id)
    from public.usage_sessions s join public.profiles p on p.id = s.user_id
    where s.started_at >= now() - make_interval(days => days) and not p.is_test
    group by p.id, p.full_name, p.role
    order by max(s.last_ping_at) desc
    limit 500;
end $$;

-- Tek kullanıcının son oturumları
create or replace function public.admin_usage_sessions(p_user uuid)
returns table (started_at timestamptz, last_ping_at timestamptz, seconds integer, last_path text)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  return query
    select s.started_at, s.last_ping_at, s.seconds, s.last_path
    from public.usage_sessions s where s.user_id = p_user
    order by s.started_at desc limit 60;
end $$;

revoke execute on function public.usage_ping(text), public.admin_usage(integer),
  public.admin_usage_users(integer), public.admin_usage_sessions(uuid) from public, anon;
grant execute on function public.usage_ping(text), public.admin_usage(integer),
  public.admin_usage_users(integer), public.admin_usage_sessions(uuid) to authenticated;
