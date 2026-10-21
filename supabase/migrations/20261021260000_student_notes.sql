-- Öğrencinin kendi notları. Varsayılan olarak yalnızca öğrenci görür, isterse öğretmenle paylaşır --------

create table public.student_notes (
  id bigint generated always as identity primary key,
  student_id uuid not null default auth.uid() references public.students (id) on delete cascade,
  topic_id integer references public.topics (id) on delete set null,
  title text not null check (char_length(title) between 1 and 100),
  body text not null check (char_length(body) between 1 and 5000),
  shared boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index student_notes_student_idx on public.student_notes (student_id, updated_at desc);
create trigger student_notes_touch before update on public.student_notes
for each row execute function private.touch_updated_at();

alter table public.student_notes enable row level security;
create policy "own notes read" on public.student_notes for select to authenticated
  using (student_id = auth.uid() or (shared and private.teaches(student_id)));
create policy "own notes insert" on public.student_notes for insert to authenticated with check (student_id = auth.uid());
create policy "own notes update" on public.student_notes for update to authenticated
  using (student_id = auth.uid()) with check (student_id = auth.uid());
create policy "own notes delete" on public.student_notes for delete to authenticated using (student_id = auth.uid());

revoke all on public.student_notes from anon, authenticated;
grant select, delete on public.student_notes to authenticated;
grant insert (topic_id, title, body, shared) on public.student_notes to authenticated;
grant update (topic_id, title, body, shared) on public.student_notes to authenticated;
