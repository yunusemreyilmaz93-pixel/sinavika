-- Avatar: hazır avatar (preset:aNN) ya da yüklenen fotoğraf (photo:<kullanıcı>/<anahtar>.webp).
-- profiles.avatar yalnızca onaylı görüntüyü tutar. Kullanıcı bu sütunu doğrudan yazamaz (sütun yetkisi yok).
-- Fotoğraflar kullanıcı başına küçük WebP dosyasıdır, api/avatar.ts sunucuda doğrular ve denetler.

alter table public.profiles
  add column avatar text check (avatar ~ '^(preset:a[0-9]{2}|photo:[0-9a-f-]{36}/[0-9a-f]{16}\.webp)$');

create table public.avatar_uploads (
  id bigint generated always as identity primary key,
  user_id uuid not null references public.profiles (id) on delete cascade,
  path text not null unique,
  status text not null check (status in ('pending', 'approved', 'rejected', 'replaced', 'removed')),
  reason text check (char_length(reason) <= 200),
  bytes integer not null check (bytes between 1 and 102400),
  reviewed_by text check (reviewed_by in ('auto', 'admin')),
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  cleaned_at timestamptz
);
create index avatar_uploads_user_idx on public.avatar_uploads (user_id, created_at desc);
create index avatar_uploads_status_idx on public.avatar_uploads (status, created_at desc);

alter table public.avatar_uploads enable row level security;
create policy "avatar uploads own read" on public.avatar_uploads for select to authenticated
  using (user_id = auth.uid() or private.is_admin());
grant select on public.avatar_uploads to authenticated;

do $$
begin
  if to_regclass('storage.buckets') is not null then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('avatars', 'avatars', true, 102400, array['image/webp'])
    on conflict (id) do update set public = true, file_size_limit = 102400, allowed_mime_types = array['image/webp'];
  end if;
end $$;

-- Hazır avatar seçimi. Yüklenmiş fotoğraf varsa yerine geçtiği için kayıtları 'replaced' olur
create or replace function public.set_avatar_preset(p_preset text) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  if p_preset is not null and p_preset !~ '^a[0-9]{2}$' then
    raise exception 'Geçersiz avatar';
  end if;
  update public.profiles set avatar = case when p_preset is null then null else 'preset:' || p_preset end
    where id = auth.uid();
  update public.avatar_uploads set status = 'replaced', reviewed_at = now()
    where user_id = auth.uid() and status in ('approved', 'pending');
end $$;

-- Yönetici: son yüklemeler, bekleyenler önce
create or replace function public.admin_avatar_uploads()
returns table (
  id bigint, user_id uuid, full_name text, role public.user_role, path text, status text,
  reason text, reviewed_by text, created_at timestamptz
)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  return query
    select u.id, u.user_id, p.full_name, p.role, u.path, u.status, u.reason, u.reviewed_by, u.created_at
    from public.avatar_uploads u join public.profiles p on p.id = u.user_id
    where not p.is_test and u.status in ('pending', 'approved', 'rejected', 'removed')
    order by (u.status = 'pending') desc, u.created_at desc
    limit 100;
end $$;

-- Yönetici kararı: onay ya da kaldırma/red
create or replace function public.admin_review_avatar(p_id bigint, p_approve boolean) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  up public.avatar_uploads;
begin
  if not private.is_admin() then
    raise exception 'Yetkin yok';
  end if;
  select * into up from public.avatar_uploads where id = p_id;
  if not found then
    raise exception 'Kayıt bulunamadı';
  end if;
  if p_approve then
    if up.status <> 'pending' then
      raise exception 'Yalnızca bekleyen fotoğraf onaylanır';
    end if;
    update public.avatar_uploads set status = 'replaced', reviewed_at = now()
      where user_id = up.user_id and status = 'approved';
    update public.avatar_uploads set status = 'approved', reviewed_by = 'admin', reviewed_at = now() where id = p_id;
    update public.profiles set avatar = 'photo:' || up.path where id = up.user_id;
  else
    update public.avatar_uploads
      set status = case when status = 'pending' then 'rejected' else 'removed' end, reviewed_by = 'admin', reviewed_at = now()
      where id = p_id;
    update public.profiles set avatar = null where id = up.user_id and avatar = 'photo:' || up.path;
  end if;
end $$;

revoke execute on function public.set_avatar_preset(text), public.admin_avatar_uploads(),
  public.admin_review_avatar(bigint, boolean) from public, anon;
grant execute on function public.set_avatar_preset(text), public.admin_avatar_uploads(),
  public.admin_review_avatar(bigint, boolean) to authenticated;
