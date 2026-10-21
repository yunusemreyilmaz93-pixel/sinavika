-- Kullanıcıların elle gönderdiği hata bildirimleri: yazı ve en fazla 3 ekran görüntüsü ------

create table public.bug_reports (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  role public.user_role,
  reporter_name text check (char_length(reporter_name) <= 120),
  message text not null check (char_length(trim(message)) between 5 and 2000),
  path text check (char_length(path) <= 300),
  user_agent text check (char_length(user_agent) <= 300),
  images text[] not null default '{}' check (cardinality(images) <= 3),
  status text not null default 'open' check (status in ('open', 'done')),
  created_at timestamptz not null default now()
);
create index bug_reports_status_idx on public.bug_reports (status, created_at desc);
create index bug_reports_user_idx on public.bug_reports (user_id, created_at desc);

create or replace function private.prepare_bug_report() returns trigger
language plpgsql security definer set search_path = ''
as $$
begin
  if (select count(*) from public.bug_reports r where r.user_id = new.user_id and r.created_at > now() - interval '1 day') >= 10 then
    raise exception 'Bugün çok fazla bildirim gönderildi. Yarın tekrar deneyin';
  end if;
  select p.role, p.full_name into new.role, new.reporter_name from public.profiles p where p.id = new.user_id;
  return new;
end $$;
create trigger bug_reports_prepare before insert on public.bug_reports
for each row execute function private.prepare_bug_report();

create or replace function private.notify_bug_report() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  admin_id uuid;
begin
  for admin_id in select p.id from public.profiles p where p.is_admin loop
    perform private.notify(admin_id, 'bug', 'Yeni hata bildirimi', left(new.message, 140), '/app/yonetim?bolum=bildirimler');
  end loop;
  return new;
end $$;
create trigger bug_reports_notify after insert on public.bug_reports
for each row execute function private.notify_bug_report();

alter table public.bug_reports enable row level security;
create policy "bug reports insert" on public.bug_reports for insert to authenticated with check (user_id = auth.uid());
create policy "bug reports read" on public.bug_reports for select to authenticated using (user_id = auth.uid() or private.is_admin());
create policy "bug reports update" on public.bug_reports for update to authenticated using (private.is_admin()) with check (private.is_admin());
create policy "bug reports delete" on public.bug_reports for delete to authenticated using (private.is_admin());

revoke all on public.bug_reports from anon, authenticated;
grant select, delete on public.bug_reports to authenticated;
grant insert (message, path, user_agent, images) on public.bug_reports to authenticated;
grant update (status) on public.bug_reports to authenticated;

-- Ekran görüntüleri özel depoda durur. Herkes kendi klasörüne yükler, sadece yönetici okur.
-- Depolama servisi yoksa (yerel test) atlanır.
do $$
begin
  if exists (select 1 from information_schema.tables where table_schema = 'storage' and table_name = 'buckets') then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('bug-reports', 'bug-reports', false, 3145728, array['image/webp', 'image/jpeg', 'image/png'])
    on conflict (id) do nothing;

    execute $p$create policy "bug report images insert" on storage.objects for insert to authenticated
      with check (bucket_id = 'bug-reports' and (storage.foldername(name))[1] = auth.uid()::text)$p$;
    execute $p$create policy "bug report images admin read" on storage.objects for select to authenticated
      using (bucket_id = 'bug-reports' and private.is_admin())$p$;
    execute $p$create policy "bug report images admin delete" on storage.objects for delete to authenticated
      using (bucket_id = 'bug-reports' and private.is_admin())$p$;
  end if;
end $$;
