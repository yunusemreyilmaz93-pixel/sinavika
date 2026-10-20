-- Video görevleri ve izleme takibi

update public.app_settings set value = '"https://yolumnet.vercel.app"' where key = 'site_url';

alter table public.tasks
  add column video_id text check (video_id ~ '^[A-Za-z0-9_-]{11}$'),
  add column video_title text check (char_length(video_title) <= 200),
  add column video_seconds integer check (video_seconds between 1 and 43200);

create or replace function private.guard_task_update() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.student_id <> old.student_id or (new.created_by is not null and new.created_by is distinct from old.created_by) then
    raise exception 'Görev başka birine taşınamaz';
  end if;
  if auth.uid() = old.student_id and old.created_by is distinct from old.student_id and (
    new.title <> old.title or new.kind <> old.kind or new.subject_id is distinct from old.subject_id
    or new.topic_id is distinct from old.topic_id or new.due_on <> old.due_on
    or new.target_questions is distinct from old.target_questions
    or new.target_minutes is distinct from old.target_minutes or new.note is distinct from old.note
    or new.video_id is distinct from old.video_id or new.video_title is distinct from old.video_title
  ) then
    raise exception 'Öğretmeninin verdiği görevi sadece tamamlandı olarak işaretleyebilirsin';
  end if;
  return new;
end $$;

-- Her 10 saniyelik dilim için kaç kez izlendiği tutulur. İleri sarılan kısımlar sayılmaz.
create table public.video_progress (
  task_id bigint primary key references public.tasks (id) on delete cascade,
  student_id uuid not null references public.students (id) on delete cascade,
  duration_seconds integer not null default 0 check (duration_seconds between 0 and 43200),
  position_seconds integer not null default 0 check (position_seconds >= 0),
  buckets smallint[] not null default '{}',
  watched_seconds integer not null default 0,
  max_rate numeric(3, 2) not null default 1,
  sessions integer not null default 0,
  completed_at timestamptz,
  first_seen_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index video_progress_student_idx on public.video_progress (student_id);

alter table public.video_progress enable row level security;
create policy "video progress read" on public.video_progress for select to authenticated
  using (private.can_read_student(student_id));
grant select on public.video_progress to authenticated;
grant all on public.video_progress to service_role;

create or replace function public.save_video_progress(
  p_task bigint, p_position integer, p_duration integer, p_watched integer[], p_rate numeric, p_new_session boolean
) returns public.video_progress
language plpgsql security definer set search_path = ''
as $$
declare
  task public.tasks;
  row public.video_progress;
  size integer;
  b smallint[];
  i integer;
  covered integer;
begin
  select * into task from public.tasks t where t.id = p_task;
  if task.id is null or task.student_id <> auth.uid() or task.video_id is null then
    raise exception 'Bu videoyu kaydetme yetkin yok';
  end if;
  if p_duration is null or p_duration < 1 or p_duration > 43200 then
    raise exception 'Geçersiz video süresi';
  end if;

  insert into public.video_progress (task_id, student_id) values (task.id, task.student_id)
  on conflict (task_id) do nothing;
  select * into row from public.video_progress v where v.task_id = task.id for update;

  size := ceil(p_duration / 10.0)::integer;
  b := row.buckets;
  if coalesce(array_length(b, 1), 0) < size then
    b := b || array_fill(0::smallint, array[size - coalesce(array_length(b, 1), 0)]);
  end if;
  foreach i in array coalesce(p_watched, '{}') loop
    if i >= 0 and i < size then
      b[i + 1] := least(b[i + 1] + 1, 999);
    end if;
  end loop;

  select count(*) into covered from unnest(b[1:size]) x where x > 0;

  update public.video_progress v set
    duration_seconds = p_duration,
    position_seconds = greatest(0, least(p_position, p_duration)),
    buckets = b,
    watched_seconds = least(covered * 10, p_duration),
    max_rate = greatest(v.max_rate, least(coalesce(p_rate, 1), 9.99)),
    sessions = v.sessions + case when p_new_session then 1 else 0 end,
    completed_at = case when v.completed_at is null and covered >= ceil(size * 0.9) then now() else v.completed_at end,
    updated_at = now()
  where v.task_id = task.id
  returning * into row;

  if task.video_seconds is null then
    update public.tasks set video_seconds = p_duration where id = task.id;
  end if;
  if row.completed_at is not null and task.done_at is null then
    update public.tasks set done_at = now() where id = task.id;
  end if;
  return row;
end $$;

revoke all on function public.save_video_progress(bigint, integer, integer, integer[], numeric, boolean) from public, anon;
grant execute on function public.save_video_progress(bigint, integer, integer, integer[], numeric, boolean) to authenticated;
