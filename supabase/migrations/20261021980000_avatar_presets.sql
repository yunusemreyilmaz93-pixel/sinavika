-- Hazır avatar paketleri: a Notionists, l Lorelei, p Open Peeps, t Thumbs, s Shapes
alter table public.profiles drop constraint profiles_avatar_check;
alter table public.profiles
  add constraint profiles_avatar_check
  check (avatar ~ '^(preset:[alpts][0-9]{2}|photo:[0-9a-f-]{36}/[0-9a-f]{16}\.webp)$');

create or replace function public.set_avatar_preset(p_preset text) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  if p_preset is not null and p_preset !~ '^[alpts][0-9]{2}$' then
    raise exception 'Geçersiz avatar';
  end if;
  update public.profiles set avatar = case when p_preset is null then null else 'preset:' || p_preset end
    where id = auth.uid();
  update public.avatar_uploads set status = 'replaced', reviewed_at = now()
    where user_id = auth.uid() and status in ('approved', 'pending');
end $$;
