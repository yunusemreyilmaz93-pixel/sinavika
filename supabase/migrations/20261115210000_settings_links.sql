-- Ayarlar sayfası bölümlere ayrıldı. Arşiv bildirimi "Verilerimi indir"in bulunduğu Hesap bölümünü açar
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
    then 'Kayıtlar silinmedi ve uygulama kullanılmaya devam edilebilir. Veriler Ayarlar sayfasının Hesap bölümünden indirilebilir.'
    else 'Görevler, mesajlar ve raporlar yeniden öğretmenle paylaşılıyor.' end;
  perform private.notify(
    new.id, 'account',
    case when archived then teacher_name || ' koçluğu arşive aldı' else teacher_name || ' koçluğa yeniden başladı' end,
    info, '/app/ayarlar?bolum=hesap'
  );
  for parent in select parent_id from public.parent_links where student_id = new.id loop
    perform private.notify(
      parent, 'account',
      case when archived then student_name || ' arşive alındı' else student_name || ' arşivden çıkarıldı' end,
      teacher_name || '. ' || info, '/app/ayarlar?bolum=hesap'
    );
  end loop;
  return new;
end $$;
