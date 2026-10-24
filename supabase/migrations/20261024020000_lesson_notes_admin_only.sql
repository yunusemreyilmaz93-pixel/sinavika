-- Konu anlatımı notları artık yalnızca yöneticiye görünür. Mevcut notlar silinir
delete from public.lesson_notes;

drop policy "lesson notes read" on public.lesson_notes;
create policy "lesson notes read" on public.lesson_notes for select to authenticated
  using (private.is_admin());
