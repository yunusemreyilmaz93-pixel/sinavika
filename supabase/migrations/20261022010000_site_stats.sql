-- Üye olmayan ziyaretçi istatistikleri. Çerez yok. IP ve tarayıcı bilgisi saklanmaz.
-- api/hit.ts, IP ve tarayıcıdan günlük tuzla özet üretir. Ham özet 70 gün tutulur, günlük toplamlar kalıcıdır.
-- Yalnızca sunucu (service role) yazar, yalnızca yönetici okur.

create table public.site_visitors (
  day date not null,
  hash text not null,
  landing text not null,
  referrer text not null,
  device text not null,
  country text,
  primary key (day, hash)
);
create table public.site_daily (
  day date primary key,
  visitors integer not null default 0,
  views integer not null default 0
);
create table public.site_pages (
  day date not null,
  path text not null,
  views integer not null default 0,
  primary key (day, path)
);
create table public.site_events (
  day date not null,
  event text not null,
  total integer not null default 0,
  primary key (day, event)
);

alter table public.site_visitors enable row level security;
alter table public.site_daily enable row level security;
alter table public.site_pages enable row level security;
alter table public.site_events enable row level security;
revoke all on public.site_visitors, public.site_daily, public.site_pages, public.site_events from anon, authenticated;

create or replace function public.record_hit(
  p_hash text, p_path text, p_ref text, p_device text, p_country text, p_event text default null
) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  today date := (now() at time zone 'Europe/Istanbul')::date;
  fresh integer;
begin
  if p_event is not null then
    insert into public.site_events (day, event, total) values (today, left(p_event, 40), 1)
      on conflict (day, event) do update set total = public.site_events.total + 1;
    return;
  end if;

  insert into public.site_visitors (day, hash, landing, referrer, device, country)
    values (today, p_hash, left(p_path, 120), left(p_ref, 60), p_device, nullif(left(p_country, 2), ''))
    on conflict do nothing;
  get diagnostics fresh = row_count;

  insert into public.site_daily (day, visitors, views) values (today, fresh, 1)
    on conflict (day) do update set visitors = public.site_daily.visitors + fresh, views = public.site_daily.views + 1;
  insert into public.site_pages (day, path, views) values (today, left(p_path, 120), 1)
    on conflict (day, path) do update set views = public.site_pages.views + 1;

  if fresh = 1 and right(p_hash, 1) = '0' then
    delete from public.site_visitors where day < today - 70;
    delete from public.site_pages where day < today - 400;
    delete from public.site_events where day < today - 400;
  end if;
end $$;
revoke execute on function public.record_hit(text, text, text, text, text, text) from public, anon, authenticated;
grant execute on function public.record_hit(text, text, text, text, text, text) to service_role;

create or replace function public.admin_site_stats(p_days integer default 30) returns jsonb
language plpgsql stable security definer set search_path = ''
as $$
declare
  days integer := least(greatest(coalesce(p_days, 30), 1), 60);
  today date := (now() at time zone 'Europe/Istanbul')::date;
  since date := (now() at time zone 'Europe/Istanbul')::date - least(greatest(coalesce(p_days, 30), 1), 60) + 1;
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  return jsonb_build_object(
    'today', coalesce((select d.visitors from public.site_daily d where d.day = today), 0),
    'daily', coalesce((
      select jsonb_agg(jsonb_build_object('day', d.day, 'visitors', d.visitors, 'views', d.views) order by d.day)
      from public.site_daily d where d.day >= since
    ), '[]'::jsonb),
    'sources', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.referrer, 'visitors', s.n) order by s.n desc)
      from (select referrer, count(*) n from public.site_visitors where day >= since group by 1 order by 2 desc limit 12) s
    ), '[]'::jsonb),
    'devices', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.device, 'visitors', s.n) order by s.n desc)
      from (select device, count(*) n from public.site_visitors where day >= since group by 1) s
    ), '[]'::jsonb),
    'countries', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.country, 'visitors', s.n) order by s.n desc)
      from (select coalesce(country, '?') as country, count(*) n from public.site_visitors where day >= since group by 1 order by 2 desc limit 8) s
    ), '[]'::jsonb),
    'landings', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.landing, 'visitors', s.n) order by s.n desc)
      from (select landing, count(*) n from public.site_visitors where day >= since group by 1 order by 2 desc limit 12) s
    ), '[]'::jsonb),
    'pages', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.path, 'views', s.n) order by s.n desc)
      from (select path, sum(views)::integer n from public.site_pages where day >= since group by 1 order by 2 desc limit 15) s
    ), '[]'::jsonb),
    'events', coalesce((
      select jsonb_agg(jsonb_build_object('name', s.event, 'total', s.n))
      from (select event, sum(total)::integer n from public.site_events where day >= since group by 1) s
    ), '[]'::jsonb),
    'members', jsonb_build_object(
      'teacher_applications', (select count(*) from public.profiles p where p.role = 'teacher' and not p.is_test and p.created_at::date >= since),
      'teachers_approved', (select count(*) from public.profiles p where p.role = 'teacher' and not p.is_test and p.approved_at::date >= since),
      'students_joined', (select count(*) from public.profiles p where p.role = 'student' and not p.is_test and p.created_at::date >= since),
      'parents_joined', (select count(*) from public.profiles p where p.role = 'parent' and not p.is_test and p.created_at::date >= since)
    )
  );
end $$;
revoke execute on function public.admin_site_stats(integer) from public, anon;
grant execute on function public.admin_site_stats(integer) to authenticated;
