-- Soru bankası: konu testleri, branş denemeleri ve genel denemeler. Doğru cevap istemciye inmez, puanlama sunucuda yapılır.
create table public.question_sets (
  id integer generated always as identity primary key,
  exam public.exam_kind not null,
  kind text not null check (kind in ('konu', 'brans', 'deneme')),
  subject_id text references public.subjects (id),
  topic_id integer references public.topics (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 120),
  duration_min smallint check (duration_min between 1 and 300),
  sort smallint not null default 0,
  published boolean not null default false,
  created_at timestamptz not null default now(),
  check ((kind = 'konu') = (topic_id is not null)),
  check ((kind = 'deneme') = (subject_id is null))
);
create unique index question_sets_topic_idx on public.question_sets (topic_id) where kind = 'konu';
create index question_sets_exam_idx on public.question_sets (exam, kind, sort);

create table public.questions (
  id bigint generated always as identity primary key,
  set_id integer not null references public.question_sets (id) on delete cascade,
  position smallint not null check (position > 0),
  subject_id text not null references public.subjects (id),
  topic_id integer references public.topics (id) on delete set null,
  stem text not null check (char_length(stem) between 1 and 4000),
  options text[] not null check (array_length(options, 1) between 2 and 5),
  correct smallint not null check (correct >= 0),
  explanation text not null default '' check (char_length(explanation) <= 4000),
  difficulty smallint not null default 2 check (difficulty between 1 and 3),
  unique (set_id, position),
  check (correct < array_length(options, 1))
);

create table public.test_attempts (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  set_id integer not null references public.question_sets (id) on delete cascade,
  correct smallint not null,
  wrong smallint not null,
  blank smallint not null,
  seconds integer check (seconds between 0 and 86400),
  created_at timestamptz not null default now()
);
create index test_attempts_student_idx on public.test_attempts (student_id, set_id, created_at desc);

create table public.test_answers (
  attempt_id bigint not null references public.test_attempts (id) on delete cascade,
  question_id bigint not null references public.questions (id) on delete cascade,
  choice smallint,
  is_correct boolean not null,
  primary key (attempt_id, question_id)
);

alter table public.question_sets enable row level security;
alter table public.questions enable row level security;
alter table public.test_attempts enable row level security;
alter table public.test_answers enable row level security;

revoke all on public.question_sets, public.questions, public.test_attempts, public.test_answers from anon, authenticated;
grant select on public.question_sets to authenticated;
grant select (id, set_id, position, subject_id, topic_id, stem, options, difficulty) on public.questions to authenticated;
grant select on public.test_attempts, public.test_answers to authenticated;
grant all on public.question_sets, public.questions, public.test_attempts, public.test_answers to service_role;

create policy "question sets read" on public.question_sets for select to authenticated
  using (published or private.is_admin());
create policy "questions read" on public.questions for select to authenticated
  using (exists (select 1 from public.question_sets s where s.id = set_id and (s.published or private.is_admin())));
create policy "test attempts read" on public.test_attempts for select to authenticated
  using (private.can_read_student(student_id));
create policy "test answers read" on public.test_answers for select to authenticated
  using (exists (select 1 from public.test_attempts a where a.id = attempt_id and private.can_read_student(a.student_id)));

create or replace function private.test_result(p_attempt bigint) returns jsonb
language sql stable security definer set search_path = ''
as $$
  select jsonb_build_object(
    'attempt_id', a.id,
    'set_id', a.set_id,
    'correct', a.correct,
    'wrong', a.wrong,
    'blank', a.blank,
    'seconds', a.seconds,
    'created_at', a.created_at,
    'review', coalesce((
      select jsonb_agg(jsonb_build_object(
        'question_id', q.id,
        'position', q.position,
        'choice', x.choice,
        'correct_choice', q.correct,
        'is_correct', x.is_correct,
        'explanation', q.explanation
      ) order by q.position)
      from public.test_answers x join public.questions q on q.id = x.question_id
      where x.attempt_id = a.id
    ), '[]'::jsonb)
  )
  from public.test_attempts a where a.id = p_attempt
$$;
revoke all on function private.test_result(bigint) from public, anon, authenticated;

create or replace function public.submit_test(p_set integer, p_answers jsonb, p_seconds integer default null)
returns jsonb
language plpgsql security definer set search_path = ''
as $$
declare
  attempt bigint;
  first_try boolean;
  c smallint;
  w smallint;
  b smallint;
begin
  if not exists (select 1 from public.students s where s.id = auth.uid()) then
    raise exception 'Sadece öğrenciler test çözebilir';
  end if;
  if not exists (select 1 from public.question_sets s where s.id = p_set and s.published) then
    raise exception 'Bu test yayınlanmamış';
  end if;
  if p_answers is null or jsonb_typeof(p_answers) <> 'object' then
    raise exception 'Cevaplar geçersiz';
  end if;

  first_try := not exists (select 1 from public.test_attempts a where a.student_id = auth.uid() and a.set_id = p_set);

  create temporary table if not exists pg_temp.graded (
    question_id bigint, subject_id text, topic_id integer, choice smallint, is_correct boolean
  ) on commit drop;
  truncate pg_temp.graded;
  insert into pg_temp.graded
  select q.id, q.subject_id, q.topic_id,
    case when (p_answers ->> q.id::text) ~ '^[0-4]$' and (p_answers ->> q.id::text)::smallint < array_length(q.options, 1)
      then (p_answers ->> q.id::text)::smallint end,
    coalesce(case when (p_answers ->> q.id::text) ~ '^[0-4]$' then (p_answers ->> q.id::text)::smallint = q.correct end, false)
  from public.questions q where q.set_id = p_set;

  select count(*) filter (where is_correct), count(*) filter (where choice is not null and not is_correct), count(*) filter (where choice is null)
  into c, w, b from pg_temp.graded;
  if c + w + b = 0 then
    raise exception 'Bu testte soru yok';
  end if;

  insert into public.test_attempts (student_id, set_id, correct, wrong, blank, seconds)
  values (auth.uid(), p_set, c, w, b, p_seconds) returning id into attempt;
  insert into public.test_answers (attempt_id, question_id, choice, is_correct)
  select attempt, question_id, choice, is_correct from pg_temp.graded;

  if first_try then
    insert into public.question_logs (student_id, subject_id, topic_id, correct, wrong, blank)
    select auth.uid(), g.subject_id, g.topic_id,
      count(*) filter (where g.is_correct), count(*) filter (where g.choice is not null and not g.is_correct), count(*) filter (where g.choice is null)
    from pg_temp.graded g group by g.subject_id, g.topic_id;
  end if;

  return private.test_result(attempt) || jsonb_build_object('first', first_try);
end $$;

create or replace function public.test_review(p_attempt bigint) returns jsonb
language plpgsql stable security definer set search_path = ''
as $$
declare owner uuid;
begin
  select a.student_id into owner from public.test_attempts a where a.id = p_attempt;
  if owner is null or not private.can_read_student(owner) then
    raise exception 'Bu sonuca erişim yok';
  end if;
  return private.test_result(p_attempt);
end $$;

revoke all on function public.submit_test(integer, jsonb, integer), public.test_review(bigint) from public, anon;
grant execute on function public.submit_test(integer, jsonb, integer), public.test_review(bigint) to authenticated, service_role;
