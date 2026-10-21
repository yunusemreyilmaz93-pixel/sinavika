-- Konu anlatımları. Metin Markdown olarak saklanır, sadece yönetici yazar ve düzenler.
create table public.lessons (
  topic_id integer primary key references public.topics (id) on delete cascade,
  body text not null default '' check (char_length(body) <= 200000),
  reading_minutes smallint not null default 10 check (reading_minutes between 1 and 120),
  published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by uuid default auth.uid() references public.profiles (id) on delete set null
);

-- Öğretmen notu ayrı tabloda durur. Öğrenci ve veli bu tabloyu hiçbir şekilde okuyamaz.
create table public.lesson_notes (
  topic_id integer primary key references public.topics (id) on delete cascade,
  body text not null default '' check (char_length(body) <= 10000),
  updated_at timestamptz not null default now()
);

create or replace function private.touch_lesson() returns trigger
language plpgsql set search_path = ''
as $$
begin
  new.updated_at := now();
  if tg_table_name = 'lessons' then
    new.updated_by := auth.uid();
  end if;
  return new;
end $$;

create trigger lessons_touch before insert or update on public.lessons
for each row execute function private.touch_lesson();
create trigger lesson_notes_touch before insert or update on public.lesson_notes
for each row execute function private.touch_lesson();

alter table public.lessons enable row level security;
alter table public.lesson_notes enable row level security;

revoke all on public.lessons, public.lesson_notes from anon, authenticated;
grant select, insert, update, delete on public.lessons, public.lesson_notes to authenticated;
grant all on public.lessons, public.lesson_notes to service_role;

create policy "lessons read" on public.lessons for select to authenticated
  using (published or private.is_admin());
create policy "lessons admin insert" on public.lessons for insert to authenticated
  with check (private.is_admin());
create policy "lessons admin update" on public.lessons for update to authenticated
  using (private.is_admin()) with check (private.is_admin());
create policy "lessons admin delete" on public.lessons for delete to authenticated
  using (private.is_admin());

create policy "lesson notes read" on public.lesson_notes for select to authenticated
  using (private.is_admin() or private.is_active_teacher());
create policy "lesson notes admin insert" on public.lesson_notes for insert to authenticated
  with check (private.is_admin());
create policy "lesson notes admin update" on public.lesson_notes for update to authenticated
  using (private.is_admin()) with check (private.is_admin());
create policy "lesson notes admin delete" on public.lesson_notes for delete to authenticated
  using (private.is_admin());

-- Fotoğraflar herkese açık okunur, sadece yönetici yükler. Depolama servisi yoksa (yerel test) atlanır.
do $$
begin
  if exists (select 1 from information_schema.tables where table_schema = 'storage' and table_name = 'buckets') then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('lesson-images', 'lesson-images', true, 3145728, array['image/webp', 'image/jpeg', 'image/png'])
    on conflict (id) do nothing;

    execute $p$create policy "lesson images admin insert" on storage.objects for insert to authenticated
      with check (bucket_id = 'lesson-images' and private.is_admin())$p$;
    execute $p$create policy "lesson images admin update" on storage.objects for update to authenticated
      using (bucket_id = 'lesson-images' and private.is_admin()) with check (bucket_id = 'lesson-images' and private.is_admin())$p$;
    execute $p$create policy "lesson images admin delete" on storage.objects for delete to authenticated
      using (bucket_id = 'lesson-images' and private.is_admin())$p$;
  end if;
end $$;
