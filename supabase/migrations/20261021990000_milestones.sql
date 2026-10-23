-- Öğrencinin seri ve rozet sayıları. Yalnızca mevcut kayıtlardan hesaplanır, yeni veri tutulmaz.
-- Çalışılan gün: çalışma süresi, soru kaydı ya da tamamlanan görev olan gün. Erişim tablo RLS'ine bağlıdır.
create or replace function public.student_milestones(p_student uuid default auth.uid()) returns jsonb
language sql stable set search_path = ''
as $$
  with days as (
    select distinct day from (
      select s.studied_on as day from public.study_sessions s where s.student_id = p_student
      union all select q.solved_on from public.question_logs q where q.student_id = p_student
      union all select (t.done_at at time zone 'Europe/Istanbul')::date from public.tasks t
        where t.student_id = p_student and t.done_at is not null
    ) x where day is not null and day > private.today() - 400
  ),
  islands as (
    select day, day - (row_number() over (order by day))::integer as grp from days
  ),
  runs as (
    select count(*)::integer as len, max(day) as last_day from islands group by grp
  )
  select jsonb_build_object(
    'streak', coalesce((select max(len) from runs where last_day >= private.today() - 1), 0),
    'best_streak', coalesce((select max(len) from runs), 0),
    'tasks_done', (select count(*) from public.tasks t where t.student_id = p_student and t.done_at is not null),
    'questions', coalesce((select sum(q.correct + q.wrong + q.blank) from public.question_logs q where q.student_id = p_student), 0),
    'minutes', coalesce((select sum(s.minutes) from public.study_sessions s where s.student_id = p_student), 0),
    'exams', (select count(*) from public.mock_exams e where e.student_id = p_student),
    'topics_done', (select count(*) from public.topic_progress tp where tp.student_id = p_student and tp.status = 'done')
  )
$$;

revoke execute on function public.student_milestones(uuid) from public, anon;
grant execute on function public.student_milestones(uuid) to authenticated;
