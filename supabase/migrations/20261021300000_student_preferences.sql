-- Öğrencinin sıralı tercih listesi (YKS). Taban puan ve sıra program_results tablosundan okunur ------

create table public.student_preferences (
  student_id uuid not null references public.students (id) on delete cascade,
  program_code bigint not null references public.programs (code) on delete cascade,
  position smallint not null default 0,
  created_at timestamptz not null default now(),
  primary key (student_id, program_code)
);
create index student_preferences_student_idx on public.student_preferences (student_id, position);

alter table public.student_preferences enable row level security;
create policy "preferences read" on public.student_preferences for select to authenticated
  using (private.can_read_student(student_id));
create policy "preferences write" on public.student_preferences for all to authenticated
  using (private.can_write_student(student_id))
  with check (private.can_write_student(student_id));
grant select, insert, update, delete on public.student_preferences to authenticated;
grant all on public.student_preferences to service_role;

-- YKS tercih formunda en fazla 24 tercih yapılabilir
create or replace function private.limit_preferences() returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  if (select count(*) from public.student_preferences where student_id = new.student_id) >= 24 then
    raise exception 'Tercih listesine en fazla 24 bölüm eklenebilir';
  end if;
  return new;
end $$;

create trigger student_preferences_limit before insert on public.student_preferences
for each row execute function private.limit_preferences();
