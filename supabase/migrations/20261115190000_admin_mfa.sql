-- Yönetici yetkisi iki adımlı doğrulamaya bağlanır: yönetici doğrulanmış bir TOTP faktörü eklediyse yetkisi yalnızca
-- iki adımla açılmış oturumda (aal2) geçerlidir. Şifresi çalınan yöneticinin hesabıyla yönetim işlemi yapılamaz
create or replace function private.is_admin() returns boolean
language sql stable security definer set search_path = ''
as $$
  select coalesce((select p.is_admin from public.profiles p where p.id = auth.uid() and p.status = 'active'), false)
    and (
      coalesce(auth.jwt() ->> 'aal', 'aal1') = 'aal2'
      or not exists (select 1 from auth.mfa_factors f where f.user_id = auth.uid() and f.status = 'verified')
    )
$$;
