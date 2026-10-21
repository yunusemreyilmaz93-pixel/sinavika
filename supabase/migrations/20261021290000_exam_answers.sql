-- Soru bazlı karne: her sorunun cevap anahtarı, öğrenci cevabı ve konusu --------

create table public.mock_exam_answers (
  mock_exam_id bigint not null references public.mock_exams (id) on delete cascade,
  subject_id text not null references public.subjects (id),
  number smallint not null check (number between 1 and 160),
  key char(1) check (key in ('A', 'B', 'C', 'D', 'E')),
  answer char(1) check (answer in ('A', 'B', 'C', 'D', 'E')),
  topic_id integer references public.topics (id) on delete set null,
  primary key (mock_exam_id, subject_id, number)
);

alter table public.mock_exam_answers enable row level security;
create policy "exam answers read" on public.mock_exam_answers for select to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_read_student(e.student_id)));
create policy "exam answers write" on public.mock_exam_answers for all to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)))
  with check (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)));
grant select, insert, update, delete on public.mock_exam_answers to authenticated;
grant all on public.mock_exam_answers to service_role;

-- Bir dersin cevaplarını yazar, ders sonucunu (D/Y/B) ve konu bazlı yanlışları bu cevaplardan yeniden üretir.
-- Anahtarı olmayan soru boş sayılır. Yetki, çağıranın satır güvenliği ile denetlenir
create or replace function public.save_exam_answers(p_exam_id bigint, p_subject_id text, p_rows jsonb)
returns void
language plpgsql security invoker set search_path = ''
as $$
declare
  exam_kind public.exam_kind;
  qcount smallint;
  c smallint;
  w smallint;
begin
  select e.kind into exam_kind from public.mock_exams e where e.id = p_exam_id;
  if not found then
    raise exception 'Deneme bulunamadı';
  end if;
  select s.question_count into qcount from public.subjects s where s.id = p_subject_id and s.exam = exam_kind;
  if not found then
    raise exception 'Bu ders bu denemeye ait değil';
  end if;
  if jsonb_typeof(p_rows) <> 'array' or jsonb_array_length(p_rows) > qcount then
    raise exception 'Bu ders için en fazla % soru girilebilir', qcount;
  end if;
  if exists (
    select 1 from jsonb_to_recordset(p_rows) as r(number int, key text, answer text, topic_id int)
    left join public.topics t on t.id = r.topic_id and t.subject_id = p_subject_id
    where r.number not between 1 and qcount or (r.topic_id is not null and t.id is null)
  ) then
    raise exception 'Soru numarası ya da konu bu derse uymuyor';
  end if;

  delete from public.mock_exam_answers where mock_exam_id = p_exam_id and subject_id = p_subject_id;
  insert into public.mock_exam_answers (mock_exam_id, subject_id, number, key, answer, topic_id)
  select p_exam_id, p_subject_id, r.number, nullif(r.key, ''), nullif(r.answer, ''), r.topic_id
  from jsonb_to_recordset(p_rows) as r(number int, key text, answer text, topic_id int);

  select count(*) filter (where key is not null and answer = key),
         count(*) filter (where key is not null and answer is not null and answer <> key)
    into c, w
    from public.mock_exam_answers where mock_exam_id = p_exam_id and subject_id = p_subject_id;

  insert into public.mock_exam_scores (mock_exam_id, subject_id, correct, wrong, blank)
  values (p_exam_id, p_subject_id, c, w, qcount - c - w)
  on conflict (mock_exam_id, subject_id) do update set correct = excluded.correct, wrong = excluded.wrong, blank = excluded.blank;

  delete from public.mock_exam_topic_misses m using public.topics t
    where m.mock_exam_id = p_exam_id and m.topic_id = t.id and t.subject_id = p_subject_id;
  insert into public.mock_exam_topic_misses (mock_exam_id, topic_id, misses)
  select p_exam_id, a.topic_id, count(*)
    from public.mock_exam_answers a
    where a.mock_exam_id = p_exam_id and a.subject_id = p_subject_id and a.topic_id is not null
      and (a.answer is null or a.answer is distinct from a.key)
    group by a.topic_id;
end $$;

revoke all on function public.save_exam_answers(bigint, text, jsonb) from public, anon;
grant execute on function public.save_exam_answers(bigint, text, jsonb) to authenticated, service_role;
