-- Öğretmen ile öğrenci arasındaki görüşmeler. Uygulama içi görüşme (app) haftada bir ve 40 dakika,
-- dış bağlantılı görüşme (link, Meet ya da Zoom) sınırsız. Görüntü ve ses kaydedilmez
create type public.meeting_mode as enum ('app', 'link');

create table public.meetings (
  id uuid primary key default gen_random_uuid(),
  teacher_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  student_id uuid not null references public.students (id) on delete cascade,
  mode public.meeting_mode not null,
  starts_at timestamptz not null,
  link text check (link is null or (link ~ '^https://[^\s]+$' and char_length(link) <= 500)),
  started_at timestamptz,
  ended_at timestamptz,
  cancelled_at timestamptz,
  created_at timestamptz not null default now(),
  check ((mode = 'link') = (link is not null))
);
create index meetings_student_idx on public.meetings (student_id, starts_at desc);
create index meetings_teacher_idx on public.meetings (teacher_id, starts_at desc);

-- Haftada bir uygulama içi görüşme (Türkiye saatiyle pazartesi başlayan hafta)
create unique index meetings_app_weekly_idx on public.meetings (student_id, date_trunc('week', starts_at at time zone 'Europe/Istanbul'))
  where mode = 'app' and cancelled_at is null;

-- Görüşmeye bağlı Realtime oturumları. Yalnızca sunucu yazar ve okur
create table public.meeting_peers (
  meeting_id uuid not null references public.meetings (id) on delete cascade,
  user_id uuid not null references public.profiles (id) on delete cascade,
  session_id text not null check (char_length(session_id) <= 200),
  joined_at timestamptz not null default now(),
  seen_at timestamptz not null default now(),
  primary key (meeting_id, user_id)
);

alter table public.meetings enable row level security;
alter table public.meeting_peers enable row level security;

create policy "meetings read" on public.meetings for select to authenticated
  using ((teacher_id = auth.uid() and private.teaches(student_id)) or student_id = auth.uid() or private.parent_of(student_id));
create policy "meetings insert" on public.meetings for insert to authenticated
  with check (teacher_id = auth.uid() and private.teaches(student_id));
create policy "meetings update" on public.meetings for update to authenticated
  using (teacher_id = auth.uid() and private.teaches(student_id))
  with check (teacher_id = auth.uid() and private.teaches(student_id));

revoke all on public.meetings, public.meeting_peers from anon, authenticated;
grant all on public.meetings, public.meeting_peers to service_role;
grant select on public.meetings to authenticated;
grant insert (student_id, mode, starts_at, link) on public.meetings to authenticated;
grant update (starts_at, link, cancelled_at) on public.meetings to authenticated;

create or replace function private.meeting_guard() returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  -- Yetkisiz yazmayı RLS reddeder, buradaki kurallar yalnızca öğrencinin öğretmeni için çalışır
  if auth.uid() is not null and not private.teaches(new.student_id) then
    return new;
  end if;
  if tg_op = 'INSERT' then
    if new.starts_at < now() - interval '10 minutes' or new.starts_at > now() + interval '90 days' then
      raise exception 'Görüşme zamanı geçmişte ya da 90 günden ileride olamaz';
    end if;
  elsif new.starts_at is distinct from old.starts_at or new.link is distinct from old.link then
    if old.started_at is not null or old.cancelled_at is not null then
      raise exception 'Başlamış ya da iptal edilmiş görüşme değiştirilemez';
    end if;
    if new.starts_at < now() - interval '10 minutes' or new.starts_at > now() + interval '90 days' then
      raise exception 'Görüşme zamanı geçmişte ya da 90 günden ileride olamaz';
    end if;
  end if;
  if new.mode = 'app' and new.cancelled_at is null and exists (
    select 1 from public.meetings m
    where m.student_id = new.student_id and m.id <> new.id and m.mode = 'app' and m.cancelled_at is null
      and date_trunc('week', m.starts_at at time zone 'Europe/Istanbul') = date_trunc('week', new.starts_at at time zone 'Europe/Istanbul')
  ) then
    raise exception 'Bu hafta bu öğrenciyle uygulama içi görüşme zaten planlı. Haftada bir uygulama içi görüşme yapılabilir, dilerseniz kendi görüşme bağlantınızı ekleyin';
  end if;
  return new;
end $$;

create trigger meetings_guard before insert or update on public.meetings
for each row execute function private.meeting_guard();

create or replace function private.on_meeting_change() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  label text := to_char(new.starts_at at time zone 'Europe/Istanbul', 'DD.MM.YYYY HH24:MI');
begin
  if tg_op = 'INSERT' then
    perform private.notify(new.student_id, 'meeting', 'Yeni görüşme planlandı', label, '/app/gorusmeler', 'meeting:' || new.id);
  elsif new.cancelled_at is not null and old.cancelled_at is null then
    perform private.notify(new.student_id, 'meeting', 'Görüşme iptal edildi', label, '/app/gorusmeler', 'meeting:' || new.id);
  elsif new.starts_at is distinct from old.starts_at then
    perform private.notify(new.student_id, 'meeting', 'Görüşme saati değişti', label, '/app/gorusmeler', 'meeting:' || new.id);
  end if;
  return new;
end $$;

create trigger meetings_notify after insert or update on public.meetings
for each row execute function private.on_meeting_change();
