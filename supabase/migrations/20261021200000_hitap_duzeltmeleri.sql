-- Sunucu metinlerinde hitap düzeltmeleri. Öğretmene ve veliye "siz", ortak hatalarda kişisiz anlatım.

create or replace function public.create_parent_invite(p_student_id uuid) returns public.invites
language plpgsql security definer set search_path = ''
as $$
declare
  teacher uuid;
  result public.invites;
begin
  if not private.can_write_student(p_student_id) then
    raise exception 'Bu öğrenci için davet oluşturulamaz';
  end if;
  select teacher_id into teacher from public.students where id = p_student_id;
  delete from public.invites where kind = 'parent' and student_id = p_student_id and used_at is null;
  insert into public.invites (kind, teacher_id, student_id)
  values ('parent', teacher, p_student_id)
  returning * into result;
  return result;
end $$;

create or replace function public.register_teacher(
  p_user uuid, p_full_name text, p_email text, p_school text, p_branch text, p_note text, p_admin boolean
) returns public.account_status
language plpgsql security definer set search_path = ''
as $$
declare
  st public.account_status := case when p_admin then 'active' else 'pending' end;
begin
  if not p_admin and not coalesce((private.setting('applications_open'))::boolean, true) then
    raise exception 'Öğretmen başvuruları şu an kapalı' using hint = 'closed';
  end if;
  if not p_admin and (select count(*) from public.profiles where role = 'teacher' and status = 'pending') >= 200 then
    raise exception 'Çok fazla bekleyen başvuru var, daha sonra tekrar deneyin' using hint = 'closed';
  end if;
  insert into public.profiles (id, role, status, is_admin, full_name, email, school, branch, application_note, consent_at, approved_at)
  values (p_user, 'teacher', st, p_admin, trim(p_full_name), lower(trim(p_email)),
          nullif(trim(p_school), ''), nullif(trim(p_branch), ''), nullif(trim(p_note), ''), now(),
          case when p_admin then now() end);
  return st;
end $$;

create or replace function public.set_teacher_status(p_teacher uuid, p_status public.account_status) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  capacity integer := coalesce((private.setting('teacher_capacity'))::integer, 100);
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  if p_teacher = auth.uid() then
    raise exception 'Kendi hesabınızın durumunu değiştiremezsiniz';
  end if;
  if p_status = 'active' and (select count(*) from public.profiles where role = 'teacher' and status = 'active') >= capacity then
    raise exception 'Öğretmen kontenjanı dolu (%). Ayarlardan artırabilirsiniz', capacity;
  end if;
  update public.profiles
    set status = p_status, approved_at = case when p_status = 'active' then coalesce(approved_at, now()) else approved_at end
    where id = p_teacher and role = 'teacher';
  if p_status = 'active' then
    perform private.notify(p_teacher, 'approved', 'Hesabınız onaylandı', 'Öğrencilerinizi davet etmeye başlayabilirsiniz', '/app/davetler');
  end if;
end $$;

create or replace function public.admin_overview()
returns table (teachers_active integer, teachers_pending integer, students_active integer, parents integer, sessions_7d integer)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  return query select
    (select count(*) from public.profiles where role = 'teacher' and status = 'active')::int,
    (select count(*) from public.profiles where role = 'teacher' and status = 'pending')::int,
    (select count(*) from public.students where archived_at is null)::int,
    (select count(*) from public.profiles where role = 'parent')::int,
    (select count(*) from public.study_sessions where created_at > now() - interval '7 days')::int;
end $$;

create or replace function public.admin_teachers()
returns table (
  id uuid, full_name text, email text, school text, branch text, application_note text,
  status public.account_status, is_admin boolean, created_at timestamptz, approved_at timestamptz,
  last_seen_at timestamptz, student_count integer
)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  return query
    select p.id, p.full_name, p.email::text, p.school, p.branch, p.application_note, p.status, p.is_admin,
      p.created_at, p.approved_at, p.last_seen_at,
      (select count(*) from public.students s where s.teacher_id = p.id and s.archived_at is null)::int
    from public.profiles p where p.role = 'teacher'
    order by (p.status = 'pending') desc, p.created_at desc;
end $$;

create or replace function public.create_mock_exam(
  p_student_id uuid, p_kind public.exam_kind, p_title text, p_taken_on date, p_scores jsonb
) returns bigint
language plpgsql security invoker set search_path = ''
as $$
declare
  exam_id bigint;
begin
  if jsonb_typeof(p_scores) <> 'array' or jsonb_array_length(p_scores) = 0 then
    raise exception 'En az bir ders için sonuç girilmeli';
  end if;
  insert into public.mock_exams (student_id, kind, title, taken_on)
  values (p_student_id, p_kind, trim(p_title), p_taken_on)
  returning id into exam_id;
  insert into public.mock_exam_scores (mock_exam_id, subject_id, correct, wrong, blank)
  select exam_id, s.subject_id, s.correct, s.wrong, s.blank
  from jsonb_to_recordset(p_scores) as s(subject_id text, correct smallint, wrong smallint, blank smallint);
  return exam_id;
end $$;

create or replace function private.validate_topic_miss() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  topic_subject text;
  exam_kind public.exam_kind;
  allowed integer;
  used integer;
begin
  select t.subject_id into topic_subject from public.topics t where t.id = new.topic_id;
  select e.kind into exam_kind from public.mock_exams e where e.id = new.mock_exam_id;
  if not exists (select 1 from public.subjects s where s.id = topic_subject and s.exam = exam_kind) then
    raise exception 'Bu konu bu denemenin derslerinden birine ait değil';
  end if;
  select coalesce(sc.wrong + sc.blank, 0) into allowed
    from public.mock_exam_scores sc where sc.mock_exam_id = new.mock_exam_id and sc.subject_id = topic_subject;
  select coalesce(sum(m.misses), 0) into used
    from public.mock_exam_topic_misses m join public.topics t on t.id = m.topic_id
    where m.mock_exam_id = new.mock_exam_id and t.subject_id = topic_subject and m.topic_id <> new.topic_id;
  if used + new.misses > coalesce(allowed, 0) then
    raise exception 'Konulara dağıtılan yanlış ve boş sayısı dersin toplamını aşıyor (en fazla %)', coalesce(allowed, 0);
  end if;
  return new;
end $$;

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
        body := body || ' Planlanan ' || r.tasks || ' görevden ' || r.tasks_done || ' tanesini bitirdi.';
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
