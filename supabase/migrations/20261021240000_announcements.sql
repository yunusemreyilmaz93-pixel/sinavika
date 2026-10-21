-- Öğretmenin öğrencilerine ve velilerine duyurusu ----------------------------------------

create table public.announcements (
  id bigint generated always as identity primary key,
  teacher_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  audience text not null check (audience in ('students', 'parents', 'both')),
  title text not null check (char_length(title) between 1 and 80),
  body text not null check (char_length(body) between 1 and 1000),
  created_at timestamptz not null default now()
);
create index announcements_teacher_idx on public.announcements (teacher_id, created_at desc);

create or replace function private.can_read_announcement(p_teacher uuid, p_audience text) returns boolean
language sql stable security definer set search_path = ''
as $$
  select p_teacher = auth.uid()
    or (p_audience in ('students', 'both') and exists (
      select 1 from public.students s where s.id = auth.uid() and s.teacher_id = p_teacher and s.archived_at is null))
    or (p_audience in ('parents', 'both') and exists (
      select 1 from public.parent_links pl join public.students s on s.id = pl.student_id
      where pl.parent_id = auth.uid() and s.teacher_id = p_teacher and s.archived_at is null))
$$;

alter table public.announcements enable row level security;
create policy "announcements readable" on public.announcements for select to authenticated
  using (private.can_read_announcement(teacher_id, audience));
create policy "announcements teacher insert" on public.announcements for insert to authenticated
  with check (teacher_id = auth.uid() and private.is_active_teacher());
create policy "announcements teacher delete" on public.announcements for delete to authenticated
  using (teacher_id = auth.uid());

revoke all on public.announcements from anon, authenticated;
grant select, delete on public.announcements to authenticated;
grant insert (audience, title, body) on public.announcements to authenticated;

create or replace function private.announcement_notify() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  r record;
begin
  for r in
    select s.id as student_id from public.students s
    where s.teacher_id = new.teacher_id and s.archived_at is null
  loop
    if new.audience in ('students', 'both') then
      perform private.notify(r.student_id, 'announcement', new.title, left(new.body, 140), '/app/duyurular', 'announcement:' || new.id);
    end if;
    if new.audience in ('parents', 'both') then
      perform private.notify(pl.parent_id, 'announcement', new.title, left(new.body, 140), '/app/duyurular', 'announcement:' || new.id)
      from public.parent_links pl where pl.student_id = r.student_id;
    end if;
  end loop;
  return new;
end $$;

create trigger announcements_notify after insert on public.announcements
for each row execute function private.announcement_notify();
