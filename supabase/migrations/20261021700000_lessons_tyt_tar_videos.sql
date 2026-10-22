-- TYT Tarih: doğrulanmış videolar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 1. Tarih nedir$a$, $v$::video{id="FXh-EmhlVfk" etiket="Konu anlatımı videosu" baslik="Tarih ve Zaman" kanal="Hocalara Geldik"}

::video{id="GXkdtN57sJA" etiket="Kısa tekrar videosu" baslik="Tarih ve Zaman" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Tarih nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Tarih ve Zaman'
  and position('::video{' in l.body) = 0 and position($a$## 1. Tarih nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Tarih öncesi çağlar$a$, $v$::video{id="D4msnlDtS7I" etiket="Konu anlatımı videosu" baslik="İnsanlığın İlk Dönemleri" kanal="Hocalara Geldik"}

::video{id="ptTEW1Ys6Ok" etiket="Kısa tekrar videosu" baslik="İnsanlığın İlk Dönemleri" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Tarih öncesi çağlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İnsanlığın İlk Dönemleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Tarih öncesi çağlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Orta Çağ’ın başlangıcı$a$, $v$::video{id="UTmWBf1zsuE" etiket="Konu anlatımı videosu" baslik="Orta Çağ'da Dünya" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Orta Çağ’ın başlangıcı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Orta Çağ''da Dünya'
  and position('::video{' in l.body) = 0 and position($a$## 1. Orta Çağ’ın başlangıcı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Türklerin ilk yurdu ve yaşamı$a$, $v$::video{id="T7YaD8EPM8o" etiket="Konu anlatımı videosu" baslik="İlk ve Orta Çağlarda Türk Dünyası" kanal="Retro Yayıncılık"}

::video{id="KjAhQwcLKsU" etiket="Kısa tekrar videosu" baslik="İlk ve Orta Çağlarda Türk Dünyası" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Türklerin ilk yurdu ve yaşamı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk ve Orta Çağlarda Türk Dünyası'
  and position('::video{' in l.body) = 0 and position($a$## 1. Türklerin ilk yurdu ve yaşamı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İslam öncesi Arabistan$a$, $v$::video{id="cd8xnS1tI3E" etiket="Konu anlatımı videosu" baslik="İslam Medeniyetinin Doğuşu" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. İslam öncesi Arabistan$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İslam Medeniyetinin Doğuşu'
  and position('::video{' in l.body) = 0 and position($a$## 1. İslam öncesi Arabistan$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Türklerin İslam’ı kabulü$a$, $v$::video{id="hMhr6ZpkNsI" etiket="Konu anlatımı videosu" baslik="İlk Türk İslam Devletleri" kanal="Yediiklim Yayincilik"}

::video{id="Jh499iZm6Uk" etiket="Kısa tekrar videosu" baslik="İlk Türk İslam Devletleri" kanal="Yusuf Kayaalp"}$v$ || chr(10) || chr(10) || $a$## 1. Türklerin İslam’ı kabulü$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk Türk İslam Devletleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Türklerin İslam’ı kabulü$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kuruluş ve yükseliş$a$, $v$::video{id="8JI3As5t58Q" etiket="Konu anlatımı videosu" baslik="Selçuklu Türkiyesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Kuruluş ve yükseliş$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Selçuklu Türkiyesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kuruluş ve yükseliş$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kuruluşun şartları$a$, $v$::video{id="K25zGospEm8" etiket="Konu anlatımı videosu" baslik="Beylikten Devlete Osmanlı" kanal="Retro Yayıncılık"}

::video{id="iC9g3ERtNGU" etiket="Kısa tekrar videosu" baslik="Beylikten Devlete Osmanlı" kanal="Yusuf Kayaalp"}$v$ || chr(10) || chr(10) || $a$## 1. Kuruluşun şartları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Beylikten Devlete Osmanlı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kuruluşun şartları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Fatih ve II. Bayezid dönemi$a$, $v$::video{id="33BbrRlbFtE" etiket="Konu anlatımı videosu" baslik="Dünya Gücü Osmanlı" kanal="Yusuf Kayaalp"}

::video{id="Zlynsf2zdaI" etiket="Kısa tekrar videosu" baslik="Dünya Gücü Osmanlı" kanal="Anime Tarih"}$v$ || chr(10) || chr(10) || $a$## 1. Fatih ve II. Bayezid dönemi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Dünya Gücü Osmanlı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Fatih ve II. Bayezid dönemi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Avrupa’daki büyük değişimler$a$, $v$::video{id="Kt7x_lXmnWc" etiket="Konu anlatımı videosu" baslik="Değişim Çağında Avrupa ve Osmanlı" kanal="Anime Tarih"}$v$ || chr(10) || chr(10) || $a$## 1. Avrupa’daki büyük değişimler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Değişim Çağında Avrupa ve Osmanlı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Avrupa’daki büyük değişimler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. II. Meşrutiyet (1908)$a$, $v$::video{id="rqE7llEveW0" etiket="Konu anlatımı videosu" baslik="XX. Yüzyıl Başlarında Osmanlı ve Dünya" kanal="Yusuf Kayaalp"}

::video{id="XwkZHytp8lA" etiket="Kısa tekrar videosu" baslik="XX. Yüzyıl Başlarında Osmanlı ve Dünya" kanal="Anime Tarih"}$v$ || chr(10) || chr(10) || $a$## 1. II. Meşrutiyet (1908)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya'
  and position('::video{' in l.body) = 0 and position($a$## 1. II. Meşrutiyet (1908)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İşgaller ve direniş$a$, $v$::video{id="pWsQfqKK--k" etiket="Konu anlatımı videosu" baslik="Milli Mücadele" kanal="tonguç AKADEMİ"}

::video{id="QYO6FrzRcRY" etiket="Kısa tekrar videosu" baslik="Milli Mücadele" kanal="Yusuf Kayaalp"}$v$ || chr(10) || chr(10) || $a$## 1. İşgaller ve direniş$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Milli Mücadele'
  and position('::video{' in l.body) = 0 and position($a$## 1. İşgaller ve direniş$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Siyasi alandaki gelişmeler$a$, $v$::video{id="sS499ccnGMk" etiket="Konu anlatımı videosu" baslik="Atatürkçülük ve Türk İnkılabı" kanal="tonguç AKADEMİ"}

::video{id="yAzReANOLEk" etiket="Kısa tekrar videosu" baslik="Atatürkçülük ve Türk İnkılabı" kanal="Ali Hoca Tarih"}$v$ || chr(10) || chr(10) || $a$## 1. Siyasi alandaki gelişmeler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Atatürkçülük ve Türk İnkılabı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Siyasi alandaki gelişmeler$a$ in l.body) > 0;
