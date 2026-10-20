-- Aynı öğrenciye bağlı veliler birbirinin adını görebilir (veli sohbetinde gönderen adı için)
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
    or exists (
      select 1 from public.parent_links mine join public.parent_links other on other.student_id = mine.student_id
      where mine.parent_id = auth.uid() and other.parent_id = p_id
    )
    or (private.is_admin() and exists (select 1 from public.profiles p where p.id = p_id and p.role = 'teacher'))
$$;
