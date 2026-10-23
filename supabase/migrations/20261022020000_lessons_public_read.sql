-- Yayındaki konu anlatımları üye olmayan ziyaretçiye de açılır (herkese açık sayfalar derleme sırasında bu veriden üretilir).
-- Yalnızca yayındaki satırlar ve yazar kimliği dışındaki sütunlar okunur. Taslaklar ve öğretmen notları kapalı kalır.
grant select (topic_id, body, reading_minutes, published, updated_at) on public.lessons to anon;
drop policy if exists "lessons public read" on public.lessons;
create policy "lessons public read" on public.lessons for select to anon using (published);
