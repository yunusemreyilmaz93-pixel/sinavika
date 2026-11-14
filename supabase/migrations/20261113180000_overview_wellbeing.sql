-- Öğretmen panosu: tükenmişlik işaretleri için önceki haftanın çalışma süresi ve son 7 günde yapılan dinlenme sayısı
drop function if exists public.teacher_overview();

create or replace function public.teacher_overview()
returns table (
  id uuid, full_name text, username text, track public.exam_track, grade smallint, field public.yks_field,
  target text, archived_at timestamptz, last_seen_at timestamptz, last_activity_on date,
  minutes_7d integer, questions_7d integer, tasks_week integer, tasks_week_done integer, tasks_overdue integer,
  last_exam_kind public.exam_kind, last_net numeric, prev_net numeric, parent_count integer,
  minutes_prev_7d integer, rest_7d integer
)
language sql stable security invoker set search_path = ''
as $$
  with week as (
    select private.today() - ((extract(isodow from private.today())::int) - 1) as start
  )
  select
    s.id, p.full_name, p.username::text, s.track, s.grade, s.field, s.target, s.archived_at, p.last_seen_at,
    greatest(
      (select max(ss.studied_on) from public.study_sessions ss where ss.student_id = s.id),
      (select max(q.solved_on) from public.question_logs q where q.student_id = s.id),
      (select max(e.taken_on) from public.mock_exams e where e.student_id = s.id)
    ),
    coalesce((select sum(ss.minutes) from public.study_sessions ss where ss.student_id = s.id and ss.studied_on > private.today() - 7), 0)::int,
    coalesce((select sum(q.correct + q.wrong + q.blank) from public.question_logs q where q.student_id = s.id and q.solved_on > private.today() - 7), 0)::int,
    (select count(*) from public.tasks t, week w where t.student_id = s.id and t.due_on between w.start and w.start + 6)::int,
    (select count(*) from public.tasks t, week w where t.student_id = s.id and t.due_on between w.start and w.start + 6 and t.done_at is not null)::int,
    (select count(*) from public.tasks t where t.student_id = s.id and t.due_on < private.today() and t.done_at is null and t.due_on > private.today() - 14)::int,
    le.kind, le.net, pe.net,
    (select count(*) from public.parent_links pl where pl.student_id = s.id)::int,
    coalesce((select sum(ss.minutes) from public.study_sessions ss where ss.student_id = s.id and ss.studied_on > private.today() - 14 and ss.studied_on <= private.today() - 7), 0)::int,
    (select count(*) from public.tasks t where t.student_id = s.id and t.kind = 'rest' and t.done_at is not null and t.due_on > private.today() - 7)::int
  from public.students s
  join public.profiles p on p.id = s.id
  left join lateral (
    select e.id, e.kind, r.net from public.mock_exams e join public.mock_exam_results r on r.id = e.id
    where e.student_id = s.id order by e.taken_on desc, e.id desc limit 1
  ) le on true
  left join lateral (
    select r.net from public.mock_exams e join public.mock_exam_results r on r.id = e.id
    where e.student_id = s.id and e.kind = le.kind and e.id <> le.id order by e.taken_on desc, e.id desc limit 1
  ) pe on true
  where s.teacher_id = auth.uid()
  order by s.archived_at nulls first, p.full_name
$$;

revoke execute on function public.teacher_overview() from anon, public;
grant execute on function public.teacher_overview() to authenticated, service_role;
