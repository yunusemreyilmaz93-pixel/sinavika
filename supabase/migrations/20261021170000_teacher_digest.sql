-- Öğretmen için haftalık dikkat özeti ----------------------------------------

create or replace function public.send_teacher_digests() returns integer
language plpgsql security definer set search_path = ''
as $$
declare
  today date := private.today();
  week_end date := today - extract(isodow from today)::integer;
  week_start date := week_end - 6;
  sent integer := 0;
  t record;
  r record;
  reasons text[];
  lines text[];
  total integer;
  idle integer;
  drop numeric;
begin
  for t in
    select p.id from public.profiles p where p.role = 'teacher' and p.status = 'active'
  loop
    lines := '{}';
    total := 0;
    for r in
      select
        s.id,
        split_part(p.full_name, ' ', 1) as first_name,
        s.created_at,
        greatest(
          (select max(ss.studied_on) from public.study_sessions ss where ss.student_id = s.id),
          (select max(q.solved_on) from public.question_logs q where q.student_id = s.id),
          (select max(e.taken_on) from public.mock_exams e where e.student_id = s.id)
        ) as last_activity,
        (select count(*) from public.tasks k
          where k.student_id = s.id and k.due_on < today and k.done_at is null and k.due_on > today - 14)::integer as overdue,
        (select count(*) from public.tasks k where k.student_id = s.id and k.due_on between week_start and week_end)::integer as tasks,
        (select count(*) from public.tasks k
          where k.student_id = s.id and k.due_on between week_start and week_end and k.done_at is not null)::integer as tasks_done,
        le.net as last_net,
        pe.net as prev_net
      from public.students s
      join public.profiles p on p.id = s.id
      left join lateral (
        select e.id, e.kind, x.net from public.mock_exams e join public.mock_exam_results x on x.id = e.id
        where e.student_id = s.id order by e.taken_on desc, e.id desc limit 1
      ) le on true
      left join lateral (
        select x.net from public.mock_exams e join public.mock_exam_results x on x.id = e.id
        where e.student_id = s.id and e.kind = le.kind and e.id <> le.id order by e.taken_on desc, e.id desc limit 1
      ) pe on true
      where s.teacher_id = t.id and s.archived_at is null
      order by p.full_name
    loop
      reasons := '{}';
      idle := today - coalesce(r.last_activity, (r.created_at at time zone 'Europe/Istanbul')::date);
      if r.last_activity is null and idle >= 3 then
        reasons := reasons || 'henüz kayıt yok';
      elsif idle >= 3 then
        reasons := reasons || (idle || ' gündür kayıt yok');
      end if;
      if r.overdue >= 3 then
        reasons := reasons || (r.overdue || ' gecikmiş görev');
      end if;
      if r.tasks > 0 and r.tasks_done::numeric / r.tasks < 0.5 then
        reasons := reasons || ('geçen hafta ' || r.tasks_done || '/' || r.tasks || ' görev tamam');
      end if;
      if r.last_net is not null and r.prev_net is not null then
        drop := round(r.prev_net - r.last_net, 2);
        if drop >= 3 then
          reasons := reasons || ('net ' || replace(trim(to_char(drop, 'FM990.00')), '.00', '') || ' düştü');
        end if;
      end if;
      if cardinality(reasons) > 0 then
        total := total + 1;
        if total <= 5 then
          lines := lines || (r.first_name || ': ' || array_to_string(reasons, ', '));
        end if;
      end if;
    end loop;

    if total > 0 then
      perform private.notify(
        t.id, 'report',
        case when total = 1 then '1 öğrenciye bakmak iyi olur' else total || ' öğrenciye bakmak iyi olur' end,
        array_to_string(lines, '. ') || case when total > 5 then '. Ve ' || (total - 5) || ' öğrenci daha.' else '.' end,
        '/app', 'teacher-digest:' || week_start
      );
      sent := sent + 1;
    end if;
  end loop;
  return sent;
end $$;

revoke all on function public.send_teacher_digests() from public, anon, authenticated;
grant execute on function public.send_teacher_digests() to service_role;
