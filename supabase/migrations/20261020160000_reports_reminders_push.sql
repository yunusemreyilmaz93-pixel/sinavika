-- Haftalık veli raporu, günlük hatırlatmalar ve telefona bildirim (web push)

insert into public.app_settings (key, value) values ('site_url', '"https://sinavika-app.vercel.app"')
on conflict (key) do nothing;

-- Push abonelikleri ---------------------------------------------------------

create table public.push_subscriptions (
  endpoint text primary key check (char_length(endpoint) <= 1000),
  user_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  p256dh text not null check (char_length(p256dh) <= 200),
  auth text not null check (char_length(auth) <= 100),
  created_at timestamptz not null default now()
);
create index push_subscriptions_user_idx on public.push_subscriptions (user_id);

alter table public.push_subscriptions enable row level security;
create policy "push own" on public.push_subscriptions for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());
grant select, insert, delete on public.push_subscriptions to authenticated;
grant all on public.push_subscriptions to service_role;

-- VAPID anahtarları sunucu tarafında bir kez üretilir ve sadece service role okur
create table public.push_keys (
  id boolean primary key default true check (id),
  public_key text not null,
  private_key text not null,
  created_at timestamptz not null default now()
);
alter table public.push_keys enable row level security;
revoke all on public.push_keys from anon, authenticated;
grant all on public.push_keys to service_role;

alter table public.notifications add column pushed_at timestamptz;

create or replace function private.notify(
  p_id uuid, kind text, title text, body text, link text, dedupe text default null
) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  if p_id is null or p_id = auth.uid() then
    return;
  end if;
  if dedupe is not null then
    update public.notifications n
      set title = notify.title, body = notify.body, link = notify.link, created_at = now(), pushed_at = null
      where n.user_id = p_id and n.dedupe_key = dedupe and n.read_at is null;
    if found then
      return;
    end if;
  end if;
  insert into public.notifications (user_id, kind, title, body, link, dedupe_key)
  values (p_id, kind, title, body, link, dedupe);
end $$;

do $$
begin
  create extension if not exists pg_net;
exception when others then
  null;
end $$;

-- Yeni bildirim olduğunda Vercel'deki gönderici çağrılır. Gönderici bekleyen bildirimleri kendisi bulur.
create or replace function private.request_push() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  site text := (select value #>> '{}' from public.app_settings where key = 'site_url');
begin
  if site is null or to_regproc('net.http_post') is null then
    return null;
  end if;
  if not exists (select 1 from public.push_subscriptions) then
    return null;
  end if;
  execute 'select net.http_post(url := $1, body := $2, headers := $3)'
    using site || '/api/push', '{"action":"dispatch"}'::jsonb, '{"content-type":"application/json"}'::jsonb;
  return null;
exception when others then
  return null;
end $$;

create trigger notifications_push_insert after insert on public.notifications
for each statement execute function private.request_push();
create trigger notifications_push_update after update of created_at on public.notifications
for each statement execute function private.request_push();

-- Haftalık veli raporu ------------------------------------------------------

create or replace function private.duration_text(minutes integer) returns text
language sql immutable set search_path = ''
as $$
  select case
    when minutes < 60 then minutes || ' dk'
    when minutes % 60 = 0 then (minutes / 60) || ' sa'
    else (minutes / 60) || ' sa ' || (minutes % 60) || ' dk'
  end
$$;

create or replace function public.send_weekly_reports() returns integer
language plpgsql security definer set search_path = ''
as $$
declare
  week_end date := private.today() - extract(isodow from private.today())::integer;
  week_start date := week_end - 6;
  sent integer := 0;
  r record;
  body text;
begin
  for r in
    select
      pl.parent_id,
      s.id as student_id,
      split_part(p.full_name, ' ', 1) as first_name,
      coalesce((select sum(ss.minutes) from public.study_sessions ss
        where ss.student_id = s.id and ss.studied_on between week_start and week_end), 0)::integer as minutes,
      coalesce((select sum(q.correct + q.wrong + q.blank) from public.question_logs q
        where q.student_id = s.id and q.solved_on between week_start and week_end), 0)::integer as questions,
      (select count(*) from public.tasks t
        where t.student_id = s.id and t.due_on between week_start and week_end)::integer as tasks,
      (select count(*) from public.tasks t
        where t.student_id = s.id and t.due_on between week_start and week_end and t.done_at is not null)::integer as tasks_done,
      (select count(*) from public.mock_exams e
        where e.student_id = s.id and e.taken_on between week_start and week_end)::integer as exams
    from public.parent_links pl
    join public.students s on s.id = pl.student_id and s.archived_at is null
    join public.profiles p on p.id = s.id
  loop
    if r.minutes = 0 and r.questions = 0 and r.tasks = 0 and r.exams = 0 then
      body := 'Geçen hafta hiç çalışma kaydı girilmedi.';
    else
      body := 'Geçen hafta ' || private.duration_text(r.minutes) || ' çalıştı, ' || r.questions || ' soru çözdü.';
      if r.tasks > 0 then
        body := body || ' Görevlerin ' || r.tasks_done || '/' || r.tasks || ' kadarını bitirdi.';
      end if;
      if r.exams > 0 then
        body := body || ' ' || r.exams || ' deneme girdi.';
      end if;
    end if;
    perform private.notify(
      r.parent_id, 'report', r.first_name || ' için haftalık rapor', body, '/app/ilerleme',
      'report:' || r.student_id || ':' || week_start
    );
    sent := sent + 1;
  end loop;
  return sent;
end $$;

-- Günlük hatırlatmalar ------------------------------------------------------

create or replace function public.send_daily_reminders() returns integer
language plpgsql security definer set search_path = ''
as $$
declare
  today date := private.today();
  sent integer := 0;
  r record;
  title text;
  body text;
begin
  for r in
    select
      s.id,
      s.created_at,
      (select count(*) from public.tasks t where t.student_id = s.id and t.due_on = today and t.done_at is null)::integer as open_tasks,
      greatest(
        (select max(ss.studied_on) from public.study_sessions ss where ss.student_id = s.id),
        (select max(q.solved_on) from public.question_logs q where q.student_id = s.id)
      ) as last_activity
    from public.students s
    join public.profiles t on t.id = s.teacher_id and t.status = 'active'
    where s.archived_at is null
  loop
    title := null;
    body := null;
    if r.open_tasks > 0 then
      title := case when r.open_tasks = 1 then 'Bugün 1 görevin var' else 'Bugün ' || r.open_tasks || ' görevin var' end;
      body := 'Planına bak, bitirdikçe işaretle.';
    end if;
    if coalesce(r.last_activity, (r.created_at at time zone 'Europe/Istanbul')::date) <= today - 2 then
      title := coalesce(title, 'Bir süredir kayıt girmedin');
      body := (today - coalesce(r.last_activity, (r.created_at at time zone 'Europe/Istanbul')::date))
        || ' gündür çalışma kaydın yok. Kısa bir çalışma bile seriyi yeniden başlatır.';
    end if;
    if title is not null then
      perform private.notify(r.id, 'reminder', title, body, '/app', 'reminder:' || today);
      sent := sent + 1;
    end if;
  end loop;
  return sent;
end $$;

revoke all on function public.send_weekly_reports(), public.send_daily_reminders() from public, anon, authenticated;
grant execute on function public.send_weekly_reports(), public.send_daily_reminders() to service_role;
