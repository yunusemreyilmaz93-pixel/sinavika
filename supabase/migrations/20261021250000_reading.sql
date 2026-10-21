-- Okuma takibi: kitaplar ve günlük sayfa kayıtları ------------------------------------------

create table public.books (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 120),
  author text check (char_length(author) <= 80),
  total_pages integer check (total_pages between 1 and 5000),
  started_on date not null default private.today(),
  finished_on date,
  created_at timestamptz not null default now()
);
create index books_student_idx on public.books (student_id, created_at desc);

create table public.reading_logs (
  id bigint generated always as identity primary key,
  student_id uuid not null references public.students (id) on delete cascade,
  book_id bigint not null references public.books (id) on delete cascade,
  pages smallint not null check (pages between 1 and 1000),
  read_on date not null default private.today() check (read_on <= private.today() + 1),
  created_at timestamptz not null default now()
);
create index reading_logs_student_idx on public.reading_logs (student_id, read_on desc);
create index reading_logs_book_idx on public.reading_logs (book_id);

create or replace function private.validate_reading_log() returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  if not exists (select 1 from public.books b where b.id = new.book_id and b.student_id = new.student_id) then
    raise exception 'Kitap bu öğrenciye ait değil';
  end if;
  return new;
end $$;
create trigger reading_logs_validate before insert or update on public.reading_logs
for each row execute function private.validate_reading_log();

alter table public.books enable row level security;
alter table public.reading_logs enable row level security;
create policy "books read" on public.books for select to authenticated using (private.can_read_student(student_id));
create policy "books write" on public.books for insert to authenticated with check (private.can_write_student(student_id));
create policy "books update" on public.books for update to authenticated
  using (private.can_write_student(student_id)) with check (private.can_write_student(student_id));
create policy "books delete" on public.books for delete to authenticated using (private.can_write_student(student_id));
create policy "reading read" on public.reading_logs for select to authenticated using (private.can_read_student(student_id));
create policy "reading write" on public.reading_logs for insert to authenticated with check (private.can_write_student(student_id));
create policy "reading delete" on public.reading_logs for delete to authenticated using (private.can_write_student(student_id));

revoke all on public.books, public.reading_logs from anon, authenticated;
grant select, delete on public.books, public.reading_logs to authenticated;
grant insert (student_id, title, author, total_pages, started_on) on public.books to authenticated;
grant update (title, author, total_pages, finished_on) on public.books to authenticated;
grant insert (student_id, book_id, pages, read_on) on public.reading_logs to authenticated;
