-- Vurgu rengi hesaba bağlanır, her cihazda aynı renk gelir. Boş değer varsayılan yeşildir.
alter table public.profiles
  add column accent text check (accent in ('blue', 'violet', 'rose', 'orange', 'teal'));

grant update (accent) on public.profiles to authenticated;
