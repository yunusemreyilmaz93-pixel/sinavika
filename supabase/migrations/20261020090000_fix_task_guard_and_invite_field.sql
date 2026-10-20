-- Hesap silinince görevlerin created_by alanı NULL'a çekilir. Bu bir taşıma değildir, izin ver.
create or replace function private.guard_task_update() returns trigger
language plpgsql set search_path = ''
as $$
begin
  if new.student_id <> old.student_id
     or (new.created_by is distinct from old.created_by and new.created_by is not null) then
    raise exception 'Görev başka birine taşınamaz';
  end if;
  if auth.uid() = old.student_id and old.created_by is distinct from old.student_id and (
    new.title <> old.title or new.kind <> old.kind or new.subject_id is distinct from old.subject_id
    or new.topic_id is distinct from old.topic_id or new.due_on <> old.due_on
    or new.target_questions is distinct from old.target_questions
    or new.target_minutes is distinct from old.target_minutes or new.note is distinct from old.note
  ) then
    raise exception 'Öğretmeninin verdiği görevi sadece tamamlandı olarak işaretleyebilirsin';
  end if;
  return new;
end $$;

drop function public.preview_invite(text);

create function public.preview_invite(p_code text)
returns table (
  kind public.invite_kind, teacher_name text, student_name text,
  track public.exam_track, grade smallint, field public.yks_field
)
language sql stable security definer set search_path = ''
as $$
  select i.kind, t.full_name,
    coalesce(i.student_name, sp.full_name), coalesce(i.track, s.track), coalesce(i.grade, s.grade),
    case when i.kind = 'student' then i.field else s.field end
  from public.invites i
  join public.profiles t on t.id = i.teacher_id and t.status = 'active'
  left join public.students s on s.id = i.student_id
  left join public.profiles sp on sp.id = i.student_id
  where i.code = upper(trim(p_code)) and i.used_at is null and i.expires_at > now()
$$;

revoke all on function public.preview_invite(text) from public;
grant execute on function public.preview_invite(text) to anon, authenticated, service_role;
