-- Blog yazıları. Yönetici yazar, yayındaki yazıyı herkes (anonim dahil) okur. Gövde konu anlatımlarıyla aynı Markdown söz dizimindedir
create table public.posts (
  id bigint generated always as identity primary key,
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$' and char_length(slug) <= 120),
  title text not null check (char_length(title) between 3 and 140),
  summary text not null default '' check (char_length(summary) <= 300),
  body text not null default '' check (char_length(body) <= 200000),
  audience text not null default 'genel' check (audience in ('genel', 'ogrenci', 'veli', 'ogretmen')),
  reading_minutes smallint not null default 5 check (reading_minutes between 1 and 120),
  published boolean not null default false,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  author_id uuid default auth.uid() references public.profiles (id) on delete set null
);
create index posts_published_idx on public.posts (published, published_at desc);

alter table public.posts enable row level security;

create policy "posts anon read" on public.posts for select to anon using (published);
create policy "posts read" on public.posts for select to authenticated using (published or private.is_admin());
create policy "posts admin write" on public.posts for all to authenticated using (private.is_admin()) with check (private.is_admin());

revoke all on public.posts from anon, authenticated;
grant all on public.posts to service_role;
grant select on public.posts to anon, authenticated;
grant insert (slug, title, summary, body, audience, reading_minutes, published), update (slug, title, summary, body, audience, reading_minutes, published), delete on public.posts to authenticated;

create or replace function private.post_touch() returns trigger
language plpgsql set search_path = ''
as $$
begin
  new.updated_at := now();
  if new.published and (tg_op = 'INSERT' or not old.published) and new.published_at is null then
    new.published_at := now();
  end if;
  return new;
end $$;

create trigger posts_touch before insert or update on public.posts
for each row execute function private.post_touch();
