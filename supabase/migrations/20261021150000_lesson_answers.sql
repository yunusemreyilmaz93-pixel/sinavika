-- Konu anlatımındaki örnek soruların cevapları. İlk cevap istatistiğe (question_logs) yazılır, tekrar denemeler yazılmaz.
create table public.lesson_answers (
  student_id uuid not null references public.students (id) on delete cascade,
  topic_id integer not null references public.topics (id) on delete cascade,
  question_key text not null check (char_length(question_key) between 1 and 64),
  first_correct boolean not null,
  last_correct boolean not null,
  attempts smallint not null default 1 check (attempts between 1 and 100),
  answered_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (student_id, topic_id, question_key)
);

alter table public.lesson_answers enable row level security;
create policy "lesson answers read" on public.lesson_answers for select to authenticated
  using (private.can_read_student(student_id));
grant select on public.lesson_answers to authenticated;
grant all on public.lesson_answers to service_role;

create or replace function public.answer_lesson_question(p_topic integer, p_key text, p_correct boolean)
returns public.lesson_answers
language plpgsql security definer set search_path = ''
as $$
declare
  subject text;
  inserted integer;
  result public.lesson_answers;
begin
  if not exists (select 1 from public.students s where s.id = auth.uid()) then
    raise exception 'Sadece öğrenciler cevap kaydedebilir';
  end if;
  select t.subject_id into subject from public.topics t
  join public.lessons l on l.topic_id = t.id and l.published
  where t.id = p_topic;
  if subject is null then
    raise exception 'Bu konunun yayınlanmış bir anlatımı yok';
  end if;

  insert into public.lesson_answers (student_id, topic_id, question_key, first_correct, last_correct)
  values (auth.uid(), p_topic, p_key, p_correct, p_correct)
  on conflict (student_id, topic_id, question_key) do nothing;
  get diagnostics inserted = row_count;

  if inserted = 1 then
    insert into public.question_logs (student_id, subject_id, topic_id, correct, wrong)
    values (auth.uid(), subject, p_topic, case when p_correct then 1 else 0 end, case when p_correct then 0 else 1 end);
  else
    update public.lesson_answers a set
      last_correct = p_correct,
      attempts = least(a.attempts + 1, 100),
      updated_at = now()
    where a.student_id = auth.uid() and a.topic_id = p_topic and a.question_key = p_key;
  end if;

  select * into result from public.lesson_answers a
  where a.student_id = auth.uid() and a.topic_id = p_topic and a.question_key = p_key;
  return result;
end $$;

revoke all on function public.answer_lesson_question(integer, text, boolean) from public, anon;
grant execute on function public.answer_lesson_question(integer, text, boolean) to authenticated, service_role;
