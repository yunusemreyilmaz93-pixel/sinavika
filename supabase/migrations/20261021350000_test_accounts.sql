-- Yönetici için test hesapları: örnek öğretmen, öğrenciler ve veli ----------------------------
-- Gerçek kullanıcı hesabına girilmez. Yalnızca is_test işaretli hesaplar yönetici tarafından açılabilir.

alter table public.profiles add column is_test boolean not null default false;

create or replace function public.admin_overview()
returns table (teachers_active integer, teachers_pending integer, students_active integer, parents integer, sessions_7d integer)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  return query select
    (select count(*) from public.profiles where role = 'teacher' and status = 'active' and not is_test)::int,
    (select count(*) from public.profiles where role = 'teacher' and status = 'pending' and not is_test)::int,
    (select count(*) from public.students s join public.profiles p on p.id = s.id where s.archived_at is null and not p.is_test)::int,
    (select count(*) from public.profiles where role = 'parent' and not is_test)::int,
    (select count(*) from public.study_sessions where created_at > now() - interval '7 days')::int;
end $$;

create or replace function public.admin_teachers()
returns table (
  id uuid, full_name text, email text, school text, branch text, application_note text,
  status public.account_status, is_admin boolean, created_at timestamptz, approved_at timestamptz,
  last_seen_at timestamptz, student_count integer
)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  return query
    select p.id, p.full_name, p.email::text, p.school, p.branch, p.application_note, p.status, p.is_admin,
      p.created_at, p.approved_at, p.last_seen_at,
      (select count(*) from public.students s where s.teacher_id = p.id and s.archived_at is null)::int
    from public.profiles p where p.role = 'teacher' and not p.is_test
    order by (p.status = 'pending') desc, p.created_at desc;
end $$;

create or replace function public.admin_test_accounts()
returns table (id uuid, role public.user_role, full_name text, environment uuid, created_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkiniz yok';
  end if;
  return query
    select p.id, p.role, p.full_name,
      case p.role
        when 'teacher' then p.id
        when 'student' then (select s.teacher_id from public.students s where s.id = p.id)
        else (select s.teacher_id from public.parent_links l join public.students s on s.id = l.student_id where l.parent_id = p.id limit 1)
      end,
      p.created_at
    from public.profiles p where p.is_test
    order by p.created_at, p.role;
end $$;

-- Sadece sunucu (service role) çağırır. Hesapların auth kayıtları önceden oluşturulur.
create or replace function public.create_test_environment(p_teacher uuid, p_lgs uuid, p_yks uuid, p_parent uuid, p_suffix text)
returns void
language plpgsql security definer set search_path = ''
as $$
begin
  insert into public.profiles (id, role, status, is_admin, full_name, email, school, branch, consent_at, approved_at, is_test)
  values (p_teacher, 'teacher', 'active', false, 'Test Öğretmen', 'test.ogretmen.' || p_suffix || '@hesap.sinavika.app', 'Test Okulu', 'Matematik', now(), now(), true);
  insert into public.profiles (id, role, full_name, username, consent_at, is_test) values
    (p_lgs, 'student', 'Test Öğrenci LGS', 'test.lgs.' || p_suffix, now(), true),
    (p_yks, 'student', 'Test Öğrenci YKS', 'test.yks.' || p_suffix, now(), true),
    (p_parent, 'parent', 'Test Veli', 'test.veli.' || p_suffix, now(), true);
  insert into public.students (id, teacher_id, track, grade, field)
  values (p_lgs, p_teacher, 'lgs', 8, null), (p_yks, p_teacher, 'yks', 12, 'say');
  insert into public.parent_links (parent_id, student_id) values (p_parent, p_lgs);
end $$;

revoke all on function public.create_test_environment(uuid, uuid, uuid, uuid, text) from public, anon, authenticated;
grant execute on function public.create_test_environment(uuid, uuid, uuid, uuid, text) to service_role;
revoke all on function public.admin_test_accounts() from public, anon;
grant execute on function public.admin_test_accounts() to authenticated;
