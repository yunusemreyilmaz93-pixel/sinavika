-- Yanlış soru defteri ve denemelerde konu bazlı yanlışlar

create table public.wrong_questions (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  created_by uuid default auth.uid() references public.profiles (id) on delete set null,
  subject_id text not null references public.subjects (id),
  topic_id integer references public.topics (id) on delete set null,
  photo_path text check (char_length(photo_path) <= 200),
  note text check (char_length(note) <= 1000),
  source text check (char_length(source) <= 120),
  learned_at timestamptz,
  review_count smallint not null default 0 check (review_count between 0 and 100),
  next_review_on date not null default private.today() + 1,
  last_reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  check (photo_path is not null or note is not null)
);
create index wrong_questions_student_idx on public.wrong_questions (student_id, learned_at, next_review_on);

alter table public.wrong_questions enable row level security;
create policy "wrong read" on public.wrong_questions for select to authenticated
  using (private.can_read_student(student_id));
create policy "wrong insert" on public.wrong_questions for insert to authenticated
  with check (private.can_write_student(student_id) and created_by = auth.uid());
create policy "wrong update" on public.wrong_questions for update to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));
create policy "wrong delete" on public.wrong_questions for delete to authenticated
  using (private.can_write_student(student_id));
grant select, insert, update, delete on public.wrong_questions to authenticated;
grant all on public.wrong_questions to service_role;

create or replace function private.guard_wrong_question() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.student_id <> old.student_id or (new.created_by is not null and new.created_by is distinct from old.created_by) then
    raise exception 'Kayıt başka bir öğrenciye taşınamaz';
  end if;
  return new;
end $$;

create trigger wrong_questions_guard before update on public.wrong_questions
for each row execute function private.guard_wrong_question();

-- Tekrar aralıkları: 1, 3, 7, 14, 30 gün
create or replace function public.review_wrong_question(p_id bigint, p_learned boolean) returns public.wrong_questions
language plpgsql security invoker set search_path = ''
as $$
declare
  steps constant integer[] := array[1, 3, 7, 14, 30];
  result public.wrong_questions;
begin
  update public.wrong_questions w set
    review_count = least(w.review_count + 1, 100),
    last_reviewed_at = now(),
    learned_at = case when p_learned then now() else null end,
    next_review_on = private.today() + steps[least(w.review_count + 2, array_length(steps, 1))]
  where w.id = p_id
  returning * into result;
  if result.id is null then
    raise exception 'Kayıt bulunamadı';
  end if;
  return result;
end $$;
grant execute on function public.review_wrong_question(bigint, boolean) to authenticated;

-- Fotoğraflar: wrong-questions/<öğrenci id>/<dosya>
do $$
begin
  if to_regclass('storage.buckets') is null then
    return;
  end if;
  insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
  values ('wrong-questions', 'wrong-questions', false, 3145728, array['image/jpeg', 'image/png', 'image/webp'])
  on conflict (id) do nothing;

  execute $p$
    create policy "wrong photos read" on storage.objects for select to authenticated
    using (bucket_id = 'wrong-questions' and private.can_read_student(((storage.foldername(name))[1])::uuid))
  $p$;
  execute $p$
    create policy "wrong photos insert" on storage.objects for insert to authenticated
    with check (bucket_id = 'wrong-questions' and private.can_write_student(((storage.foldername(name))[1])::uuid))
  $p$;
  execute $p$
    create policy "wrong photos delete" on storage.objects for delete to authenticated
    using (bucket_id = 'wrong-questions' and private.can_write_student(((storage.foldername(name))[1])::uuid))
  $p$;
end $$;

-- Denemede konu bazlı yanlış ve boşlar ----------------------------------------

create table public.mock_exam_topic_misses (
  mock_exam_id bigint not null references public.mock_exams (id) on delete cascade,
  topic_id integer not null references public.topics (id) on delete cascade,
  misses smallint not null check (misses between 1 and 80),
  primary key (mock_exam_id, topic_id)
);

alter table public.mock_exam_topic_misses enable row level security;
create policy "topic misses read" on public.mock_exam_topic_misses for select to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_read_student(e.student_id)));
create policy "topic misses write" on public.mock_exam_topic_misses for all to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)))
  with check (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)));
grant select, insert, update, delete on public.mock_exam_topic_misses to authenticated;
grant all on public.mock_exam_topic_misses to service_role;

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
    raise exception 'Konulara dağıttığın yanlış ve boş sayısı dersin toplamını aşıyor (en fazla %)', coalesce(allowed, 0);
  end if;
  return new;
end $$;

create trigger mock_exam_topic_misses_validate before insert or update on public.mock_exam_topic_misses
for each row execute function private.validate_topic_miss();

-- Hatırlatmalara tekrar zamanı gelen yanlış sorular eklenir ---------------------

create or replace function public.send_daily_reminders() returns integer
language plpgsql security definer set search_path = ''
as $$
declare
  today date := private.today();
  sent integer := 0;
  r record;
  title text;
  body text;
  idle integer;
begin
  for r in
    select
      s.id,
      s.created_at,
      (select count(*) from public.tasks t where t.student_id = s.id and t.due_on = today and t.done_at is null)::integer as open_tasks,
      (select count(*) from public.wrong_questions w
        where w.student_id = s.id and w.learned_at is null and w.next_review_on <= today)::integer as due_reviews,
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
    idle := today - coalesce(r.last_activity, (r.created_at at time zone 'Europe/Istanbul')::date);
    if r.open_tasks > 0 then
      title := case when r.open_tasks = 1 then 'Bugün 1 görevin var' else 'Bugün ' || r.open_tasks || ' görevin var' end;
      body := 'Planına bak, bitirdikçe işaretle.';
    end if;
    if r.due_reviews > 0 then
      if title is null then
        title := 'Tekrar zamanı gelen ' || r.due_reviews || ' yanlış sorun var';
        body := 'Yanlış soru defterini aç, çözebildiklerini işaretle.';
      else
        body := body || ' Bir de tekrar zamanı gelen ' || r.due_reviews || ' yanlış sorun var.';
      end if;
    end if;
    if idle >= 2 and title is null then
      title := 'Bir süredir kayıt girmedin';
      body := idle || ' gündür çalışma kaydın yok. Kısa bir çalışma bile seriyi yeniden başlatır.';
    elsif idle >= 2 then
      body := body || ' ' || idle || ' gündür çalışma kaydı girmedin.';
    end if;
    if title is not null then
      perform private.notify(r.id, 'reminder', title, body, '/app', 'reminder:' || today);
      sent := sent + 1;
    end if;
  end loop;
  return sent;
end $$;

revoke all on function public.send_daily_reminders() from public, anon, authenticated;
grant execute on function public.send_daily_reminders() to service_role;
