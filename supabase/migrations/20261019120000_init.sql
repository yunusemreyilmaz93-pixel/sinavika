create extension if not exists citext with schema extensions;

create schema if not exists private;

create type public.user_role as enum ('teacher', 'student', 'parent');
create type public.account_status as enum ('pending', 'active', 'rejected', 'disabled');
create type public.exam_track as enum ('lgs', 'yks');
create type public.exam_kind as enum ('LGS', 'TYT', 'AYT', 'YDT');
create type public.yks_field as enum ('say', 'ea', 'soz', 'dil');
create type public.topic_status as enum ('learning', 'done', 'review');
create type public.task_kind as enum ('study', 'questions', 'reading', 'video', 'review', 'other');
create type public.note_kind as enum ('note', 'meeting');
create type public.note_visibility as enum ('private', 'student', 'parent', 'both');
create type public.invite_kind as enum ('student', 'parent');
create type public.message_channel as enum ('student', 'parent');

create or replace function private.today() returns date
language sql stable set search_path = ''
as $$ select (now() at time zone 'Europe/Istanbul')::date $$;

-- Settings ------------------------------------------------------------------

create table public.app_settings (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

insert into public.app_settings (key, value) values
  ('student_capacity', '10'),
  ('teacher_capacity', '100'),
  ('applications_open', 'true'),
  ('exam_dates', '{"LGS": {"date": "2027-06-12", "official": false}, "YKS": {"date": "2027-06-19", "official": false}}');

-- People --------------------------------------------------------------------

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  role public.user_role not null,
  status public.account_status not null default 'active',
  is_admin boolean not null default false,
  full_name text not null check (char_length(full_name) between 2 and 80),
  username extensions.citext unique check (username ~ '^[a-z0-9._]{3,24}$'),
  email extensions.citext unique,
  school text check (char_length(school) <= 120),
  branch text check (char_length(branch) <= 60),
  application_note text check (char_length(application_note) <= 600),
  consent_at timestamptz,
  last_seen_at timestamptz,
  approved_at timestamptz,
  created_at timestamptz not null default now(),
  check (username is not null or email is not null)
);

create table public.students (
  id uuid primary key references public.profiles (id) on delete cascade,
  teacher_id uuid not null references public.profiles (id),
  track public.exam_track not null,
  grade smallint not null check (grade in (8, 11, 12, 13)),
  field public.yks_field,
  target text check (char_length(target) <= 120),
  daily_minutes_goal smallint not null default 120 check (daily_minutes_goal between 0 and 960),
  weekly_questions_goal smallint not null default 500 check (weekly_questions_goal between 0 and 10000),
  archived_at timestamptz,
  created_at timestamptz not null default now(),
  check ((track = 'lgs') = (grade = 8)),
  check (track = 'yks' or field is null)
);
create index students_teacher_idx on public.students (teacher_id);

create table public.parent_links (
  parent_id uuid not null references public.profiles (id) on delete cascade,
  student_id uuid not null references public.students (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (parent_id, student_id)
);
create index parent_links_student_idx on public.parent_links (student_id);

create or replace function private.invite_code() returns text
language plpgsql volatile set search_path = ''
as $$
declare
  alphabet constant text := 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
  bytes bytea := extensions.gen_random_bytes(8);
  result text := '';
begin
  for i in 0..7 loop
    result := result || substr(alphabet, (get_byte(bytes, i) % 31) + 1, 1);
  end loop;
  return result;
end $$;

create table public.invites (
  code text primary key default private.invite_code() check (code ~ '^[A-Z0-9]{8}$'),
  kind public.invite_kind not null,
  teacher_id uuid not null references public.profiles (id) on delete cascade,
  student_id uuid references public.students (id) on delete cascade,
  student_name text check (char_length(student_name) <= 80),
  track public.exam_track,
  grade smallint check (grade in (8, 11, 12, 13)),
  field public.yks_field,
  expires_at timestamptz not null default now() + interval '14 days',
  used_at timestamptz,
  used_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  check (kind = 'student' or student_id is not null),
  check (kind = 'parent' or (track is not null and grade is not null and (track = 'lgs') = (grade = 8)))
);
create index invites_teacher_idx on public.invites (teacher_id);

-- Curriculum ----------------------------------------------------------------

create table public.subjects (
  id text primary key,
  exam public.exam_kind not null,
  name text not null,
  short text not null,
  question_count smallint not null check (question_count > 0),
  fields public.yks_field[],
  sort smallint not null default 0,
  color text not null default 'slate'
);

create table public.topics (
  id integer generated always as identity primary key,
  subject_id text not null references public.subjects (id) on delete cascade,
  name text not null,
  sort smallint not null default 0,
  unique (subject_id, name)
);
create index topics_subject_idx on public.topics (subject_id);

-- Student work --------------------------------------------------------------

create table public.topic_progress (
  student_id uuid not null references public.students (id) on delete cascade,
  topic_id integer not null references public.topics (id) on delete cascade,
  status public.topic_status not null,
  updated_at timestamptz not null default now(),
  primary key (student_id, topic_id)
);

create table public.study_sessions (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  subject_id text references public.subjects (id) on delete set null,
  topic_id integer references public.topics (id) on delete set null,
  minutes smallint not null check (minutes between 1 and 600),
  studied_on date not null default private.today(),
  source text not null default 'manual' check (source in ('timer', 'manual')),
  created_at timestamptz not null default now()
);
create index study_sessions_student_idx on public.study_sessions (student_id, studied_on desc);

create table public.question_logs (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  subject_id text not null references public.subjects (id),
  topic_id integer references public.topics (id) on delete set null,
  correct smallint not null default 0 check (correct between 0 and 1000),
  wrong smallint not null default 0 check (wrong between 0 and 1000),
  blank smallint not null default 0 check (blank between 0 and 1000),
  solved_on date not null default private.today(),
  created_at timestamptz not null default now(),
  check (correct + wrong + blank > 0)
);
create index question_logs_student_idx on public.question_logs (student_id, solved_on desc);

create table public.mock_exams (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  kind public.exam_kind not null,
  title text not null check (char_length(title) between 1 and 80),
  taken_on date not null default private.today(),
  created_by uuid default auth.uid() references public.profiles (id) on delete set null,
  created_at timestamptz not null default now()
);
create index mock_exams_student_idx on public.mock_exams (student_id, taken_on desc);

create table public.mock_exam_scores (
  mock_exam_id bigint not null references public.mock_exams (id) on delete cascade,
  subject_id text not null references public.subjects (id),
  correct smallint not null default 0 check (correct >= 0),
  wrong smallint not null default 0 check (wrong >= 0),
  blank smallint not null default 0 check (blank >= 0),
  primary key (mock_exam_id, subject_id)
);

create table public.student_goals (
  student_id uuid not null references public.students (id) on delete cascade,
  kind public.exam_kind not null,
  target_net numeric(5, 2) not null check (target_net between 0 and 200),
  primary key (student_id, kind)
);

create table public.tasks (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  created_by uuid default auth.uid() references public.profiles (id) on delete set null,
  title text not null check (char_length(title) between 1 and 140),
  kind public.task_kind not null default 'study',
  subject_id text references public.subjects (id) on delete set null,
  topic_id integer references public.topics (id) on delete set null,
  due_on date not null,
  target_questions smallint check (target_questions between 1 and 2000),
  target_minutes smallint check (target_minutes between 1 and 600),
  note text check (char_length(note) <= 500),
  done_at timestamptz,
  sort integer not null default 0,
  created_at timestamptz not null default now()
);
create index tasks_student_due_idx on public.tasks (student_id, due_on);

create table public.plan_templates (
  id bigint generated always as identity primary key,
  teacher_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  name text not null check (char_length(name) between 1 and 60),
  items jsonb not null default '[]' check (jsonb_typeof(items) = 'array' and jsonb_array_length(items) <= 100),
  created_at timestamptz not null default now()
);

-- Communication -------------------------------------------------------------

create table public.notes (
  id bigint generated always as identity primary key,
  teacher_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  student_id uuid not null references public.students (id) on delete cascade,
  kind public.note_kind not null default 'note',
  visibility public.note_visibility not null default 'private',
  body text not null check (char_length(body) between 1 and 4000),
  met_on date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index notes_student_idx on public.notes (student_id, created_at desc);

create table public.messages (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  channel public.message_channel not null,
  sender_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now()
);
create index messages_thread_idx on public.messages (student_id, channel, created_at desc);

create table public.message_reads (
  user_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  student_id uuid not null references public.students (id) on delete cascade,
  channel public.message_channel not null,
  last_read_at timestamptz not null default now(),
  primary key (user_id, student_id, channel)
);

create table public.notifications (
  id bigint generated always as identity primary key,
  user_id uuid not null references public.profiles (id) on delete cascade,
  kind text not null,
  title text not null,
  body text,
  link text,
  dedupe_key text,
  read_at timestamptz,
  created_at timestamptz not null default now()
);
create index notifications_user_idx on public.notifications (user_id, created_at desc);
create unique index notifications_dedupe_idx on public.notifications (user_id, dedupe_key) where read_at is null and dedupe_key is not null;

-- Access helpers ------------------------------------------------------------

create or replace function private.is_admin() returns boolean
language sql stable security definer set search_path = ''
as $$
  select coalesce((select p.is_admin from public.profiles p where p.id = auth.uid() and p.status = 'active'), false)
$$;

create or replace function private.is_active_teacher() returns boolean
language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'teacher' and p.status = 'active')
$$;

create or replace function private.teaches(p_id uuid) returns boolean
language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.students s
    join public.profiles p on p.id = s.teacher_id
    where s.id = p_id and s.teacher_id = auth.uid() and p.status = 'active'
  )
$$;

create or replace function private.parent_of(p_id uuid) returns boolean
language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.parent_links pl where pl.student_id = p_id and pl.parent_id = auth.uid())
$$;

create or replace function private.can_read_student(p_id uuid) returns boolean
language sql stable security definer set search_path = ''
as $$
  select p_id = auth.uid() or private.teaches(p_id) or private.parent_of(p_id)
$$;

create or replace function private.can_write_student(p_id uuid) returns boolean
language sql stable security definer set search_path = ''
as $$
  select p_id = auth.uid() or private.teaches(p_id)
$$;

create or replace function private.can_see_profile(p_id uuid) returns boolean
language sql stable security definer set search_path = ''
as $$
  select
    p_id = auth.uid()
    or private.can_read_student(p_id)
    or exists (select 1 from public.students s where s.id = auth.uid() and s.teacher_id = p_id)
    or exists (select 1 from public.parent_links pl where pl.student_id = auth.uid() and pl.parent_id = p_id)
    or exists (
      select 1 from public.parent_links pl join public.students s on s.id = pl.student_id
      where pl.parent_id = p_id and s.teacher_id = auth.uid()
    )
    or exists (
      select 1 from public.parent_links pl join public.students s on s.id = pl.student_id
      where pl.parent_id = auth.uid() and s.teacher_id = p_id
    )
    or (private.is_admin() and exists (select 1 from public.profiles p where p.id = p_id and p.role = 'teacher'))
$$;

create or replace function private.setting(name text) returns jsonb
language sql stable security definer set search_path = ''
as $$ select value from public.app_settings where key = name $$;

-- Integrity triggers --------------------------------------------------------

create or replace function private.enforce_student_capacity() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  teacher uuid := new.teacher_id;
  capacity integer := coalesce((private.setting('student_capacity'))::integer, 10);
  used integer;
begin
  if tg_table_name = 'invites' then
    if new.kind <> 'student' then
      return new;
    end if;
  elsif tg_op = 'UPDATE' then
    if not (old.archived_at is not null and new.archived_at is null) then
      return new;
    end if;
  end if;

  perform pg_advisory_xact_lock(hashtext('capacity:' || teacher::text));

  select
    (select count(*) from public.students s where s.teacher_id = teacher and s.archived_at is null)
    + (select count(*) from public.invites i where i.teacher_id = teacher and i.kind = 'student'
       and i.used_at is null and i.expires_at > now())
  into used;

  if used >= capacity then
    raise exception 'Öğrenci kontenjanı dolu (en fazla % öğrenci)', capacity using errcode = 'P0001', hint = 'capacity';
  end if;
  return new;
end $$;

create trigger students_capacity before insert or update of archived_at on public.students
for each row execute function private.enforce_student_capacity();

create trigger invites_capacity before insert on public.invites
for each row execute function private.enforce_student_capacity();

create or replace function private.guard_student_update() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.teacher_id is distinct from old.teacher_id then
    raise exception 'Öğretmen değiştirilemez';
  end if;
  if auth.uid() = old.id and (
    new.track is distinct from old.track or new.grade is distinct from old.grade
    or new.field is distinct from old.field or new.archived_at is distinct from old.archived_at
  ) then
    raise exception 'Bu alanı sadece öğretmenin değiştirebilir';
  end if;
  return new;
end $$;

create trigger students_guard before update on public.students
for each row execute function private.guard_student_update();

create or replace function private.guard_task_update() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.student_id <> old.student_id or new.created_by is distinct from old.created_by then
    raise exception 'Görev başka birine taşınamaz';
  end if;
  if auth.uid() = old.student_id and old.created_by is distinct from old.student_id and (
    new.title <> old.title or new.kind <> old.kind or new.subject_id is distinct from old.subject_id
    or new.topic_id is distinct from old.topic_id or new.due_on <> old.due_on
    or new.target_questions is distinct from old.target_questions
    or new.target_minutes is distinct from old.target_minutes or new.note is distinct from old.note
  ) then
    raise exception 'Öğretmeninin verdiği görevi sadece tamamlandı olarak işaretleyebilirsin';
  end if;
  return new;
end $$;

create trigger tasks_guard before update on public.tasks
for each row execute function private.guard_task_update();

create or replace function private.validate_mock_score() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  subject public.subjects;
  exam_kind public.exam_kind;
begin
  select * into subject from public.subjects where id = new.subject_id;
  select kind into exam_kind from public.mock_exams where id = new.mock_exam_id;
  if subject.exam <> exam_kind then
    raise exception 'Ders bu sınav türüne ait değil';
  end if;
  if new.correct + new.wrong + new.blank > subject.question_count then
    raise exception '% için en fazla % soru girilebilir', subject.name, subject.question_count;
  end if;
  return new;
end $$;

create trigger mock_exam_scores_validate before insert or update on public.mock_exam_scores
for each row execute function private.validate_mock_score();

create or replace function private.touch_updated_at() returns trigger
language plpgsql set search_path = ''
as $$ begin new.updated_at := now(); return new; end $$;

create trigger notes_touch before update on public.notes
for each row execute function private.touch_updated_at();

create or replace function private.guard_profile_update() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if current_user in ('authenticated', 'anon') and (
    new.role <> old.role or new.status <> old.status or new.is_admin <> old.is_admin
    or new.username is distinct from old.username or new.email is distinct from old.email
    or new.approved_at is distinct from old.approved_at
  ) then
    raise exception 'Bu alan değiştirilemez';
  end if;
  return new;
end $$;

create trigger profiles_guard before update on public.profiles
for each row execute function private.guard_profile_update();

-- Notifications -------------------------------------------------------------

create or replace function private.notify(
  p_id uuid, kind text, title text, body text, link text, dedupe text default null
) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  if p_id is null or p_id = auth.uid() then
    return;
  end if;
  if dedupe is not null then
    update public.notifications n
      set title = notify.title, body = notify.body, link = notify.link, created_at = now()
      where n.user_id = p_id and n.dedupe_key = dedupe and n.read_at is null;
    if found then
      return;
    end if;
  end if;
  insert into public.notifications (user_id, kind, title, body, link, dedupe_key)
  values (p_id, kind, title, body, link, dedupe);
end $$;

create or replace function private.on_task_insert() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  pending integer;
begin
  if new.created_by is not distinct from new.student_id then
    return new;
  end if;
  select count(*) into pending from public.tasks t
    where t.student_id = new.student_id and t.created_by is distinct from t.student_id
      and t.done_at is null and t.created_at > now() - interval '1 day';
  perform private.notify(
    new.student_id, 'task',
    case when pending > 1 then pending || ' yeni görev' else 'Yeni görev' end,
    new.title, '/app/plan', 'tasks:' || private.today()
  );
  return new;
end $$;

create trigger tasks_notify after insert on public.tasks
for each row execute function private.on_task_insert();

create or replace function private.on_note_shared() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  teacher_name text;
  parent uuid;
begin
  if new.visibility = 'private' or (tg_op = 'UPDATE' and old.visibility = new.visibility) then
    return new;
  end if;
  select full_name into teacher_name from public.profiles where id = new.teacher_id;
  if new.visibility in ('student', 'both') then
    perform private.notify(new.student_id, 'note', teacher_name || ' bir not paylaştı', left(new.body, 140), '/app/notlar');
  end if;
  if new.visibility in ('parent', 'both') then
    for parent in select parent_id from public.parent_links where student_id = new.student_id loop
      perform private.notify(parent, 'note', teacher_name || ' bir not paylaştı', left(new.body, 140), '/app/notlar');
    end loop;
  end if;
  return new;
end $$;

create trigger notes_notify after insert or update of visibility on public.notes
for each row execute function private.on_note_shared();

create or replace function private.on_message() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  sender_name text;
  teacher uuid;
  parent uuid;
  link text;
begin
  select full_name into sender_name from public.profiles where id = new.sender_id;
  select teacher_id into teacher from public.students where id = new.student_id;
  link := '/app/mesajlar/' || new.student_id || '/' || new.channel;
  perform private.notify(teacher, 'message', sender_name, left(new.body, 140), link, 'msg:' || new.student_id || ':' || new.channel);
  if new.channel = 'student' then
    perform private.notify(new.student_id, 'message', sender_name, left(new.body, 140), link, 'msg:' || new.student_id || ':student');
  else
    for parent in select parent_id from public.parent_links where student_id = new.student_id loop
      perform private.notify(parent, 'message', sender_name, left(new.body, 140), link, 'msg:' || new.student_id || ':parent');
    end loop;
  end if;
  return new;
end $$;

create trigger messages_notify after insert on public.messages
for each row execute function private.on_message();

-- Row level security --------------------------------------------------------

alter table public.app_settings enable row level security;
alter table public.profiles enable row level security;
alter table public.students enable row level security;
alter table public.parent_links enable row level security;
alter table public.invites enable row level security;
alter table public.subjects enable row level security;
alter table public.topics enable row level security;
alter table public.topic_progress enable row level security;
alter table public.study_sessions enable row level security;
alter table public.question_logs enable row level security;
alter table public.mock_exams enable row level security;
alter table public.mock_exam_scores enable row level security;
alter table public.student_goals enable row level security;
alter table public.tasks enable row level security;
alter table public.plan_templates enable row level security;
alter table public.notes enable row level security;
alter table public.messages enable row level security;
alter table public.message_reads enable row level security;
alter table public.notifications enable row level security;

create policy "settings readable" on public.app_settings for select using (true);
create policy "settings admin write" on public.app_settings for update to authenticated
  using (private.is_admin()) with check (private.is_admin());

create policy "profiles visible" on public.profiles for select to authenticated
  using (private.can_see_profile(id));
create policy "profiles self update" on public.profiles for update to authenticated
  using (id = auth.uid()) with check (id = auth.uid());

create policy "students readable" on public.students for select to authenticated
  using (private.can_read_student(id));
create policy "students writable" on public.students for update to authenticated
  using (private.can_write_student(id)) with check (private.can_write_student(id));

create policy "parent links readable" on public.parent_links for select to authenticated
  using (parent_id = auth.uid() or private.can_write_student(student_id));
create policy "parent links removable" on public.parent_links for delete to authenticated
  using (parent_id = auth.uid() or private.teaches(student_id));

create policy "invites readable" on public.invites for select to authenticated
  using (teacher_id = auth.uid() or (kind = 'parent' and student_id = auth.uid()));
create policy "invites revocable" on public.invites for delete to authenticated
  using (used_at is null and (teacher_id = auth.uid() or (kind = 'parent' and student_id = auth.uid())));

create policy "subjects readable" on public.subjects for select using (true);
create policy "subjects admin" on public.subjects for all to authenticated
  using (private.is_admin()) with check (private.is_admin());
create policy "topics readable" on public.topics for select using (true);
create policy "topics admin" on public.topics for all to authenticated
  using (private.is_admin()) with check (private.is_admin());

create policy "topic progress read" on public.topic_progress for select to authenticated
  using (private.can_read_student(student_id));
create policy "topic progress write" on public.topic_progress for all to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));

create policy "sessions read" on public.study_sessions for select to authenticated
  using (private.can_read_student(student_id));
create policy "sessions write" on public.study_sessions for all to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));

create policy "questions read" on public.question_logs for select to authenticated
  using (private.can_read_student(student_id));
create policy "questions write" on public.question_logs for all to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));

create policy "mock exams read" on public.mock_exams for select to authenticated
  using (private.can_read_student(student_id));
create policy "mock exams write" on public.mock_exams for all to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));

create policy "mock scores read" on public.mock_exam_scores for select to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_read_student(e.student_id)));
create policy "mock scores write" on public.mock_exam_scores for all to authenticated
  using (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)))
  with check (exists (select 1 from public.mock_exams e where e.id = mock_exam_id and private.can_write_student(e.student_id)));

create policy "goals read" on public.student_goals for select to authenticated
  using (private.can_read_student(student_id));
create policy "goals write" on public.student_goals for all to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));

create policy "tasks read" on public.tasks for select to authenticated
  using (private.can_read_student(student_id));
create policy "tasks insert" on public.tasks for insert to authenticated
  with check (private.can_write_student(student_id) and created_by = auth.uid());
create policy "tasks update" on public.tasks for update to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));
create policy "tasks delete" on public.tasks for delete to authenticated
  using (private.teaches(student_id) or (student_id = auth.uid() and created_by = auth.uid()));

create policy "templates own" on public.plan_templates for all to authenticated
  using (teacher_id = auth.uid()) with check (teacher_id = auth.uid() and private.is_active_teacher());

create policy "notes read" on public.notes for select to authenticated
  using (
    (teacher_id = auth.uid() and private.teaches(student_id))
    or (visibility in ('student', 'both') and student_id = auth.uid())
    or (visibility in ('parent', 'both') and private.parent_of(student_id))
  );
create policy "notes write" on public.notes for all to authenticated
  using (teacher_id = auth.uid() and private.teaches(student_id))
  with check (teacher_id = auth.uid() and private.teaches(student_id));

create or replace function private.in_channel(p_id uuid, ch public.message_channel) returns boolean
language sql stable security definer set search_path = ''
as $$
  select private.teaches(p_id)
    or (ch = 'student' and p_id = auth.uid())
    or (ch = 'parent' and private.parent_of(p_id))
$$;

create policy "messages read" on public.messages for select to authenticated
  using (private.in_channel(student_id, channel));
create policy "messages send" on public.messages for insert to authenticated
  with check (sender_id = auth.uid() and private.in_channel(student_id, channel));

create policy "reads own" on public.message_reads for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid() and private.in_channel(student_id, channel));

create policy "notifications own read" on public.notifications for select to authenticated
  using (user_id = auth.uid());
create policy "notifications own update" on public.notifications for update to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "notifications own delete" on public.notifications for delete to authenticated
  using (user_id = auth.uid());

create view public.mock_exam_results with (security_invoker = true) as
select
  e.id, e.student_id, e.kind, e.title, e.taken_on, e.created_at,
  coalesce(sum(s.correct), 0)::int as correct,
  coalesce(sum(s.wrong), 0)::int as wrong,
  coalesce(sum(s.blank), 0)::int as blank,
  round(coalesce(sum(s.correct - s.wrong / case when e.kind = 'LGS' then 3.0 else 4.0 end), 0), 2) as net
from public.mock_exams e
left join public.mock_exam_scores s on s.mock_exam_id = e.id
group by e.id;

-- RPC -----------------------------------------------------------------------

create or replace function public.create_student_invite(
  p_student_name text, p_track public.exam_track, p_grade smallint, p_field public.yks_field default null
) returns public.invites
language plpgsql security definer set search_path = ''
as $$
declare
  result public.invites;
begin
  if not private.is_active_teacher() then
    raise exception 'Davet oluşturmak için onaylı öğretmen hesabı gerekir';
  end if;
  insert into public.invites (kind, teacher_id, student_name, track, grade, field)
  values ('student', auth.uid(), nullif(trim(p_student_name), ''), p_track, p_grade,
          case when p_track = 'yks' then p_field end)
  returning * into result;
  return result;
end $$;

create or replace function public.create_parent_invite(p_student_id uuid) returns public.invites
language plpgsql security definer set search_path = ''
as $$
declare
  teacher uuid;
  result public.invites;
begin
  if not private.can_write_student(p_student_id) then
    raise exception 'Bu öğrenci için davet oluşturamazsın';
  end if;
  select teacher_id into teacher from public.students where id = p_student_id;
  delete from public.invites where kind = 'parent' and student_id = p_student_id and used_at is null;
  insert into public.invites (kind, teacher_id, student_id)
  values ('parent', teacher, p_student_id)
  returning * into result;
  return result;
end $$;

create or replace function public.preview_invite(p_code text)
returns table (kind public.invite_kind, teacher_name text, student_name text, track public.exam_track, grade smallint)
language sql stable security definer set search_path = ''
as $$
  select i.kind, t.full_name,
    coalesce(i.student_name, sp.full_name), coalesce(i.track, s.track), coalesce(i.grade, s.grade)
  from public.invites i
  join public.profiles t on t.id = i.teacher_id and t.status = 'active'
  left join public.students s on s.id = i.student_id
  left join public.profiles sp on sp.id = i.student_id
  where i.code = upper(trim(p_code)) and i.used_at is null and i.expires_at > now()
$$;

create or replace function public.redeem_invite(p_code text, p_user uuid, p_full_name text, p_username text)
returns public.user_role
language plpgsql security definer set search_path = ''
as $$
declare
  inv public.invites;
  role public.user_role;
begin
  select * into inv from public.invites where code = upper(trim(p_code)) for update;
  if inv is null or inv.used_at is not null or inv.expires_at <= now() then
    raise exception 'Davet kodu geçersiz veya süresi dolmuş' using hint = 'invite';
  end if;
  if not exists (select 1 from public.profiles where id = inv.teacher_id and status = 'active') then
    raise exception 'Davet kodu geçersiz veya süresi dolmuş' using hint = 'invite';
  end if;

  role := case inv.kind when 'student' then 'student'::public.user_role else 'parent'::public.user_role end;

  update public.invites set used_at = now(), used_by = null where code = inv.code;

  insert into public.profiles (id, role, full_name, username, consent_at)
  values (p_user, role, trim(p_full_name), lower(p_username), now());

  if inv.kind = 'student' then
    insert into public.students (id, teacher_id, track, grade, field)
    values (p_user, inv.teacher_id, inv.track, inv.grade, inv.field);
    perform private.notify(inv.teacher_id, 'join', trim(p_full_name) || ' katıldı', 'Öğrenci davet kodunu kullandı', '/app/ogrenciler/' || p_user);
  else
    insert into public.parent_links (parent_id, student_id) values (p_user, inv.student_id);
    perform private.notify(inv.teacher_id, 'join', trim(p_full_name) || ' veli olarak bağlandı',
      null, '/app/ogrenciler/' || inv.student_id);
    perform private.notify(inv.student_id, 'join', trim(p_full_name) || ' veli olarak bağlandı', null, '/app/ayarlar');
  end if;

  update public.invites set used_by = p_user where code = inv.code;
  return role;
end $$;

create or replace function public.link_parent(p_code text) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  inv public.invites;
begin
  if not exists (select 1 from public.profiles where id = auth.uid() and role = 'parent') then
    raise exception 'Bu işlem veli hesapları içindir';
  end if;
  select * into inv from public.invites where code = upper(trim(p_code)) and kind = 'parent' for update;
  if inv is null or inv.used_at is not null or inv.expires_at <= now() then
    raise exception 'Davet kodu geçersiz veya süresi dolmuş' using hint = 'invite';
  end if;
  update public.invites set used_at = now(), used_by = auth.uid() where code = inv.code;
  insert into public.parent_links (parent_id, student_id) values (auth.uid(), inv.student_id)
  on conflict do nothing;
  perform private.notify(inv.teacher_id, 'join', (select full_name from public.profiles where id = auth.uid()) || ' veli olarak bağlandı',
    null, '/app/ogrenciler/' || inv.student_id);
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
    raise exception 'Çok fazla bekleyen başvuru var, daha sonra tekrar dene' using hint = 'closed';
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
    raise exception 'Yetkin yok';
  end if;
  if p_teacher = auth.uid() then
    raise exception 'Kendi hesabının durumunu değiştiremezsin';
  end if;
  if p_status = 'active' and (select count(*) from public.profiles where role = 'teacher' and status = 'active') >= capacity then
    raise exception 'Öğretmen kontenjanı dolu (%). Ayarlardan artırabilirsin', capacity;
  end if;
  update public.profiles
    set status = p_status, approved_at = case when p_status = 'active' then coalesce(approved_at, now()) else approved_at end
    where id = p_teacher and role = 'teacher';
  if p_status = 'active' then
    perform private.notify(p_teacher, 'approved', 'Hesabın onaylandı', 'Öğrencilerini davet etmeye başlayabilirsin', '/app/davetler');
  end if;
end $$;

create or replace function public.touch_last_seen() returns void
language sql security definer set search_path = ''
as $$
  update public.profiles set last_seen_at = now()
  where id = auth.uid() and (last_seen_at is null or last_seen_at < now() - interval '10 minutes')
$$;

create or replace function public.teacher_overview()
returns table (
  id uuid, full_name text, username text, track public.exam_track, grade smallint, field public.yks_field,
  target text, archived_at timestamptz, last_seen_at timestamptz, last_activity_on date,
  minutes_7d integer, questions_7d integer, tasks_week integer, tasks_week_done integer, tasks_overdue integer,
  last_exam_kind public.exam_kind, last_net numeric, prev_net numeric, parent_count integer
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
    (select count(*) from public.parent_links pl where pl.student_id = s.id)::int
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

create or replace function public.admin_overview()
returns table (teachers_active integer, teachers_pending integer, students_active integer, parents integer, sessions_7d integer)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
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
    raise exception 'Yetkin yok';
  end if;
  return query
    select p.id, p.full_name, p.email::text, p.school, p.branch, p.application_note, p.status, p.is_admin,
      p.created_at, p.approved_at, p.last_seen_at,
      (select count(*) from public.students s where s.teacher_id = p.id and s.archived_at is null)::int
    from public.profiles p where p.role = 'teacher'
    order by (p.status = 'pending') desc, p.created_at desc;
end $$;


-- Grants --------------------------------------------------------------------

revoke all on all tables in schema public from anon, authenticated;
revoke all on all functions in schema public from public, anon, authenticated;
revoke all on all functions in schema private from public, anon, authenticated;

grant usage on schema private to anon, authenticated, service_role;
grant execute on all functions in schema private to authenticated, service_role;
grant execute on function private.today() to anon;
grant usage on schema public to anon, authenticated, service_role;
grant all on all tables in schema public to service_role;
grant all on all functions in schema public to service_role;
grant usage, select on all sequences in schema public to authenticated, service_role;

grant select on public.app_settings, public.subjects, public.topics to anon, authenticated;
grant update (value, updated_at) on public.app_settings to authenticated;
grant insert, update, delete on public.subjects, public.topics to authenticated;

grant select on public.profiles to authenticated;
grant update (full_name, last_seen_at) on public.profiles to authenticated;

grant select on public.students to authenticated;
grant update (target, daily_minutes_goal, weekly_questions_goal, track, grade, field, archived_at)
  on public.students to authenticated;

grant select, delete on public.parent_links, public.invites to authenticated;

grant select, insert, update, delete on
  public.topic_progress, public.study_sessions, public.question_logs, public.mock_exams,
  public.mock_exam_scores, public.student_goals, public.tasks, public.plan_templates, public.notes
  to authenticated;
grant select on public.mock_exam_results to authenticated;

grant select, insert on public.messages to authenticated;
grant select, insert, update on public.message_reads to authenticated;
grant select, update (read_at), delete on public.notifications to authenticated;

grant execute on function
  public.create_student_invite(text, public.exam_track, smallint, public.yks_field),
  public.create_parent_invite(uuid),
  public.link_parent(text),
  public.set_teacher_status(uuid, public.account_status),
  public.touch_last_seen(),
  public.teacher_overview(),
  public.admin_overview(),
  public.admin_teachers()
  to authenticated;
grant execute on function public.preview_invite(text) to anon, authenticated;

do $$
begin
  if exists (select 1 from pg_publication where pubname = 'supabase_realtime') then
    alter publication supabase_realtime add table public.messages, public.notifications;
  end if;
end $$;
