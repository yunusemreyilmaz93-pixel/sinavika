-- Kullanıcı şikâyetlerine karşı güvenceler:
-- 1. Bildirim tercihleri: tür bazında kapatma, telefona göndermeme ve gece sessizliği
-- 2. Öğrenci arşive alınınca ya da geri alınınca öğrenci ve veli bilgilendirilir
-- 3. Öğretmenin 24 saattir okumadığı mesajlar için günlük hatırlatma

create table public.notification_prefs (
  user_id uuid primary key default auth.uid() references public.profiles (id) on delete cascade,
  muted text[] not null default '{}',
  push_muted text[] not null default '{}',
  quiet_night boolean not null default false,
  updated_at timestamptz not null default now(),
  check (muted <@ array['task', 'note', 'message', 'join', 'report', 'announcement', 'reminder', 'meeting']),
  check (push_muted <@ array['task', 'note', 'message', 'join', 'report', 'announcement', 'reminder', 'meeting'])
);

alter table public.notification_prefs enable row level security;
create policy "notification prefs own" on public.notification_prefs for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

revoke all on public.notification_prefs from anon, authenticated;
grant all on public.notification_prefs to service_role;
grant select on public.notification_prefs to authenticated;
grant insert (muted, push_muted, quiet_night), update (muted, push_muted, quiet_night, updated_at) on public.notification_prefs to authenticated;

create or replace function private.notify(
  p_id uuid, kind text, title text, body text, link text, dedupe text default null
) returns void
language plpgsql security definer set search_path = ''
as $$
begin
  if p_id is null or p_id = auth.uid() then
    return;
  end if;
  if exists (select 1 from public.notification_prefs p where p.user_id = p_id and notify.kind = any (p.muted)) then
    return;
  end if;
  if dedupe is not null then
    update public.notifications n
      set title = notify.title, body = notify.body, link = notify.link, created_at = now(), pushed_at = null
      where n.user_id = p_id and n.dedupe_key = dedupe and n.read_at is null;
    if found then
      return;
    end if;
  end if;
  insert into public.notifications (user_id, kind, title, body, link, dedupe_key)
  values (p_id, kind, title, body, link, dedupe);
end $$;

-- Arşiv bildirimi. Öğrenci ve veliler, öğretmenin çalışmayı bıraktığını uygulamadan öğrenir
create or replace function private.on_student_archive() returns trigger
language plpgsql security definer set search_path = ''
as $$
declare
  teacher_name text;
  student_name text;
  parent uuid;
  archived boolean := new.archived_at is not null;
  info text;
begin
  if (old.archived_at is null) = (new.archived_at is null) then
    return new;
  end if;
  select full_name into teacher_name from public.profiles where id = new.teacher_id;
  select split_part(full_name, ' ', 1) into student_name from public.profiles where id = new.id;
  info := case when archived
    then 'Kayıtlar silinmedi ve uygulama kullanılmaya devam edilebilir. Veriler Ayarlar sayfasından indirilebilir.'
    else 'Görevler, mesajlar ve raporlar yeniden öğretmenle paylaşılıyor.' end;
  perform private.notify(
    new.id, 'account',
    case when archived then teacher_name || ' koçluğu arşive aldı' else teacher_name || ' koçluğa yeniden başladı' end,
    info, '/app/ayarlar'
  );
  for parent in select parent_id from public.parent_links where student_id = new.id loop
    perform private.notify(
      parent, 'account',
      case when archived then student_name || ' arşive alındı' else student_name || ' arşivden çıkarıldı' end,
      teacher_name || '. ' || info, '/app/ayarlar'
    );
  end loop;
  return new;
end $$;

create trigger students_archive_notify after update of archived_at on public.students
for each row execute function private.on_student_archive();

-- Öğretmenin 24 ile 48 saat önce gelen ve hâlâ okumadığı mesajları. Her mesaj için en fazla bir hatırlatma
create or replace function public.send_unread_message_reminders() returns integer
language plpgsql security definer set search_path = ''
as $$
declare
  t record;
  sent integer := 0;
begin
  for t in
    select s.teacher_id,
           count(*) as threads,
           string_agg(distinct split_part(p.full_name, ' ', 1), ', ') as names
    from public.students s
    join public.profiles tp on tp.id = s.teacher_id and tp.status = 'active'
    join public.profiles p on p.id = s.id
    cross join (values ('student'::public.message_channel), ('parent'::public.message_channel)) c (channel)
    cross join lateral (
      select m.created_at, m.sender_id
      from public.messages m
      where m.student_id = s.id and m.channel = c.channel
      order by m.created_at desc
      limit 1
    ) last
    left join public.message_reads r on r.user_id = s.teacher_id and r.student_id = s.id and r.channel = c.channel
    where s.archived_at is null
      and last.sender_id <> s.teacher_id
      and last.created_at < now() - interval '24 hours'
      and last.created_at >= now() - interval '48 hours'
      and (r.last_read_at is null or r.last_read_at < last.created_at)
    group by s.teacher_id
  loop
    perform private.notify(
      t.teacher_id, 'message',
      case when t.threads = 1 then '1 mesaj 24 saattir okunmadı' else t.threads || ' sohbette okunmamış mesaj var' end,
      t.names || ' cevabınızı bekliyor.', '/app/mesajlar',
      'unread:' || private.today()
    );
    sent := sent + 1;
  end loop;
  return sent;
end $$;

revoke all on function public.send_unread_message_reminders() from public, anon, authenticated;
grant execute on function public.send_unread_message_reminders() to service_role;

-- Giriş yardımı. Şifresini unutan kişi isteği giriş ekranından gönderir, istek e-postaya değil doğrudan yetkiliye
-- bildirim olarak düşer: öğrenci ve veli için öğretmene, öğretmen için yöneticilere. Aynı hesap için okunmamış
-- istek varsa yenisi açılmaz, yalnızca zamanı güncellenir
create or replace function public.request_password_reset(p_user uuid) returns void
language plpgsql security definer set search_path = ''
as $$
declare
  target public.profiles;
  recipient record;
begin
  select * into target from public.profiles where id = p_user;
  if target.id is null or target.is_test then
    return;
  end if;
  if target.role = 'teacher' then
    for recipient in select id from public.profiles where is_admin and status = 'active' and id <> target.id loop
      perform private.notify(recipient.id, 'account', target.full_name || ' şifresini unuttu',
        'Giriş ekranından şifre sıfırlama istedi. Öğretmenler bölümünden yeni şifre belirleyin.',
        '/app/yonetim?bolum=ogretmenler', 'pwreset:' || target.id);
    end loop;
  else
    for recipient in
      select s.teacher_id, s.id as student_id from public.students s
      where s.id = target.id
         or s.id in (select student_id from public.parent_links where parent_id = target.id)
    loop
      perform private.notify(recipient.teacher_id, 'account',
        target.full_name || ' şifresini unuttu',
        case when target.role = 'parent' then 'Veli' else 'Öğrenci' end
          || ' giriş ekranından şifre sıfırlama istedi. Ayarlar sekmesinden yeni şifre belirleyip iletin.',
        '/app/ogrenciler/' || recipient.student_id || '?tab=ayarlar', 'pwreset:' || target.id);
    end loop;
  end if;
end $$;

revoke all on function public.request_password_reset(uuid) from public, anon, authenticated;
grant execute on function public.request_password_reset(uuid) to service_role;
