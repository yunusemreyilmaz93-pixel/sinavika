-- Site izlek.site'a taşındı. Bildirim ve davet bağlantıları yeni adresi kullanır.
update public.app_settings set value = '"https://izlek.site"' where key = 'site_url';
