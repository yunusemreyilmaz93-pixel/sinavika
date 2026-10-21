-- Veli için süreli, iptal edilebilir, hesapsız rapor bağlantısı -----------------------------
-- Bağlantı anahtarı yalnızca oluşturulurken görünür, veritabanında özeti saklanır.

create table public.report_links (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  created_by uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  token_hash text not null unique,
  label text check (char_length(label) <= 60),
  expires_at timestamptz not null,
  revoked_at timestamptz,
  last_viewed_at timestamptz,
  view_count integer not null default 0,
  created_at timestamptz not null default now()
);
create index report_links_student_idx on public.report_links (student_id, created_at desc);

alter table public.report_links enable row level security;
create policy "report links teacher read" on public.report_links for select to authenticated
  using (private.teaches(student_id));
revoke all on public.report_links from anon, authenticated;
grant select (id, student_id, label, expires_at, revoked_at, last_viewed_at, view_count, created_at) on public.report_links to authenticated;

create or replace function public.create_report_link(p_student uuid, p_days integer, p_label text default null) returns text
language plpgsql security definer set search_path = ''
as $$
declare
  token text;
begin
  if not private.teaches(p_student) then
    raise exception 'Bu öğrenci için rapor bağlantısı oluşturamazsınız';
  end if;
  if p_days not in (7, 14, 30) then
    raise exception 'Süre 7, 14 ya da 30 gün olmalı';
  end if;
  if (select count(*) from public.report_links l
      where l.student_id = p_student and l.revoked_at is null and l.expires_at > now()) >= 5 then
    raise exception 'Bu öğrenci için en fazla 5 geçerli bağlantı olabilir. Birini iptal edin';
  end if;
  token := translate(encode(extensions.gen_random_bytes(24), 'base64'), '+/=', '-_');
  insert into public.report_links (student_id, token_hash, label, expires_at)
  values (p_student, encode(extensions.digest(token, 'sha256'), 'hex'), nullif(left(trim(p_label), 60), ''), now() + make_interval(days => p_days));
  return token;
end $$;

create or replace function public.revoke_report_link(p_id bigint) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  update public.report_links l set revoked_at = now()
  where l.id = p_id and l.revoked_at is null and private.teaches(l.student_id);
  if not found then
    raise exception 'Bağlantı bulunamadı';
  end if;
end $$;

-- Herkese açık: anahtarı bilen salt okunur rapor görür. Not, mesaj ve iletişim bilgisi içermez
create or replace function public.report_by_token(p_token text) returns jsonb
language plpgsql security definer set search_path = ''
as $$
declare
  link public.report_links;
  stu record;
  today date := private.today();
  result jsonb;
begin
  select * into link from public.report_links l
  where l.token_hash = encode(extensions.digest(coalesce(p_token, ''), 'sha256'), 'hex')
    and l.revoked_at is null and l.expires_at > now();
  if link.id is null then
    return null;
  end if;
  update public.report_links set last_viewed_at = now(), view_count = view_count + 1 where id = link.id;
  select split_part(p.full_name, ' ', 1) as first_name, s.track, s.grade
    into stu from public.students s join public.profiles p on p.id = s.id where s.id = link.student_id;

  select jsonb_build_object(
    'student', jsonb_build_object('name', stu.first_name, 'track', stu.track, 'grade', stu.grade),
    'expires_at', link.expires_at,
    'generated_at', now(),
    'days', coalesce((
      select jsonb_agg(jsonb_build_object('day', d::date, 'minutes', coalesce((
        select sum(ss.minutes) from public.study_sessions ss where ss.student_id = link.student_id and ss.studied_on = d::date), 0)) order by d)
      from generate_series(today - 6, today, interval '1 day') d), '[]'::jsonb),
    'questions', coalesce((select sum(q.correct + q.wrong + q.blank) from public.question_logs q
      where q.student_id = link.student_id and q.solved_on > today - 7), 0),
    'tasks_total', (select count(*) from public.tasks t where t.student_id = link.student_id and t.due_on between today - 6 and today),
    'tasks_done', (select count(*) from public.tasks t where t.student_id = link.student_id and t.due_on between today - 6 and today and t.done_at is not null),
    'exams', coalesce((
      select jsonb_agg(jsonb_build_object('title', e.title, 'kind', e.kind, 'taken_on', e.taken_on, 'net', e.net) order by e.taken_on desc, e.id desc)
      from (select r.* from public.mock_exam_results r where r.student_id = link.student_id order by r.taken_on desc, r.id desc limit 5) e), '[]'::jsonb)
  ) into result;
  return result;
end $$;

revoke all on function public.create_report_link(uuid, integer, text), public.revoke_report_link(bigint), public.report_by_token(text) from public, anon, authenticated;
grant execute on function public.create_report_link(uuid, integer, text), public.revoke_report_link(bigint) to authenticated;
grant execute on function public.report_by_token(text) to anon, authenticated;
