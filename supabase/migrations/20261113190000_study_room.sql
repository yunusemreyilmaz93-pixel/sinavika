-- Sanal etüt: sayaç çalışırken öğrenci, aynı öğretmenin öğrencileriyle "şu an çalışıyor" bilgisini paylaşır.
-- Realtime presence özel kanalı "etut:<öğretmen kimliği>". Öğrenci yalnızca kendi öğretmeninin kanalına,
-- öğretmen yalnızca kendi kanalına girebilir. Hiçbir şey kaydedilmez, bilgi yalnızca bağlantı açıkken durur.
create or replace function private.study_room_topic() returns text
language sql stable security definer set search_path = ''
as $$
  select 'etut:' || coalesce(
    (select s.teacher_id::text from public.students s where s.id = auth.uid() and s.archived_at is null),
    (select p.id::text from public.profiles p where p.id = auth.uid() and p.role = 'teacher')
  )
$$;
revoke all on function private.study_room_topic() from public, anon;
grant execute on function private.study_room_topic() to authenticated;

do $$
begin
  if exists (select 1 from information_schema.tables where table_schema = 'realtime' and table_name = 'messages') then
    execute $p$
      create policy "study room read" on realtime.messages for select to authenticated
      using (realtime.messages.extension = 'presence' and (select realtime.topic()) = (select private.study_room_topic()))
    $p$;
    execute $p$
      create policy "study room track" on realtime.messages for insert to authenticated
      with check (realtime.messages.extension = 'presence' and (select realtime.topic()) = (select private.study_room_topic()))
    $p$;
  end if;
end $$;
