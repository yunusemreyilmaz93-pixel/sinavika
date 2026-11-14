-- Katılma sayfası, geçersiz kodda sebebi söyleyebilsin diye: kullanılmış kod ile süresi dolmuş kod ayrı mesaj alır.
-- Yalnızca durum döner, kodun sahibi ya da öğretmeni hakkında bilgi vermez. Bilinmeyen kodda null döner
create function public.invite_state(p_code text) returns text
language sql stable security definer set search_path = ''
as $$
  select case
    when i.used_at is not null then 'used'
    when i.expires_at <= now() then 'expired'
    else 'valid'
  end
  from public.invites i
  where i.code = upper(trim(p_code))
$$;

revoke all on function public.invite_state(text) from public;
grant execute on function public.invite_state(text) to anon, authenticated, service_role;
