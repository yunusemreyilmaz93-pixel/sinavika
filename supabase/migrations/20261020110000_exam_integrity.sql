-- Denemeyi ve ders sonuçlarını tek işlemde kaydet
create or replace function public.create_mock_exam(
  p_student_id uuid, p_kind public.exam_kind, p_title text, p_taken_on date, p_scores jsonb
) returns bigint
language plpgsql security invoker set search_path = ''
as $$
declare
  exam_id bigint;
begin
  if jsonb_typeof(p_scores) <> 'array' or jsonb_array_length(p_scores) = 0 then
    raise exception 'En az bir ders için sonuç gir';
  end if;
  insert into public.mock_exams (student_id, kind, title, taken_on)
  values (p_student_id, p_kind, trim(p_title), p_taken_on)
  returning id into exam_id;
  insert into public.mock_exam_scores (mock_exam_id, subject_id, correct, wrong, blank)
  select exam_id, s.subject_id, s.correct, s.wrong, s.blank
  from jsonb_to_recordset(p_scores) as s(subject_id text, correct smallint, wrong smallint, blank smallint);
  return exam_id;
end $$;

revoke all on function public.create_mock_exam(uuid, public.exam_kind, text, date, jsonb) from public, anon;
grant execute on function public.create_mock_exam(uuid, public.exam_kind, text, date, jsonb) to authenticated, service_role;

-- İleri tarihli deneme olmaz (bir gün tolerans saat dilimi farkı için)
alter table public.mock_exams
  add constraint mock_exams_not_future check (taken_on <= (now() at time zone 'Europe/Istanbul')::date + 1) not valid;

-- Sonuç girildikten sonra sınav türü değişmez
create or replace function private.guard_mock_exam_kind() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.kind <> old.kind and exists (select 1 from public.mock_exam_scores where mock_exam_id = old.id) then
    raise exception 'Sonuç girilmiş denemenin türü değiştirilemez';
  end if;
  if new.student_id <> old.student_id then
    raise exception 'Deneme başka öğrenciye taşınamaz';
  end if;
  return new;
end $$;

create trigger mock_exams_guard before update on public.mock_exams
for each row execute function private.guard_mock_exam_kind();

create or replace function private.touch_progress() returns trigger
language plpgsql set search_path = ''
as $$ begin new.updated_at := now(); return new; end $$;

create trigger topic_progress_touch before update on public.topic_progress
for each row execute function private.touch_progress();

grant execute on all functions in schema private to authenticated, service_role;
