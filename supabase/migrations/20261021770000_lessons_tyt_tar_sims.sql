-- Tarih ve İnkılap Tarihi konularına zaman şeridi ve Millî Mücadele haritası simülasyonları

update public.lessons l
set body = replace(l.body, $a$## 7. Konuyu toparla$a$, $v$## Zaman şeridi

Malazgirt’ten devletin sonuna kadar olayların sırasını gör.

::sim{tur="selcuklu"}$v$ || chr(10) || chr(10) || $a$## 7. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Selçuklu Türkiyesi'
  and position('::sim{tur="selcuklu"}' in l.body) = 0 and position($a$## 7. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 7. Konuyu toparla$a$, $v$## Zaman şeridi

Beylikten İstanbul’un fethine kadar olayların sırasını gör.

::sim{tur="osmanlikurulus"}$v$ || chr(10) || chr(10) || $a$## 7. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Beylikten Devlete Osmanlı'
  and position('::sim{tur="osmanlikurulus"}' in l.body) = 0 and position($a$## 7. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Zaman şeridi

Fatih’ten II. Selim’e kadar fetihlerin sırasını gör.

::sim{tur="osmanlidunya"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Dünya Gücü Osmanlı'
  and position('::sim{tur="osmanlidunya"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Zaman şeridi

Duraklamadan Düyun-ı Umumiye’ye kadar olayların sırasını gör.

::sim{tur="osmanlidegisim"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Değişim Çağında Avrupa ve Osmanlı'
  and position('::sim{tur="osmanlidegisim"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 7. Konuyu toparla$a$, $v$## Zaman şeridi

II. Meşrutiyet’ten Mondros’a kadar olayların sırasını gör.

::sim{tur="yirminciyuzyil"}$v$ || chr(10) || chr(10) || $a$## 7. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya'
  and position('::sim{tur="yirminciyuzyil"}' in l.body) = 0 and position($a$## 7. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Olaylar haritada

Olayları hem yerleriyle hem tarih sırasıyla gör.

::sim{tur="kurtulus"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Milli Mücadele'
  and position('::sim{tur="kurtulus"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Olaylar haritada

Olayları hem yerleriyle hem tarih sırasıyla gör.

::sim{tur="kurtulus"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm'
  and position('::sim{tur="kurtulus"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Olaylar haritada

Olayları hem yerleriyle hem tarih sırasıyla gör.

::sim{tur="kurtulus"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar'
  and position('::sim{tur="kurtulus"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $v$## Zaman şeridi

İnkılapların hangi sırayla yapıldığını gör.

::sim{tur="inkilaplar"}$v$ || chr(10) || chr(10) || $a$## 8. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Atatürkçülük ve Türk İnkılabı'
  and position('::sim{tur="inkilaplar"}' in l.body) = 0 and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $v$## Zaman şeridi

İnkılapların hangi sırayla yapıldığını gör.

::sim{tur="inkilaplar"}$v$ || chr(10) || chr(10) || $a$## 8. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye'
  and position('::sim{tur="inkilaplar"}' in l.body) = 0 and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Olaylar haritada

Olayları hem yerleriyle hem tarih sırasıyla gör.

::sim{tur="kurtulus"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm'
  and position('::sim{tur="kurtulus"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $v$## Zaman şeridi

İnkılapların hangi sırayla yapıldığını gör.

::sim{tur="inkilaplar"}$v$ || chr(10) || chr(10) || $a$## 8. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye'
  and position('::sim{tur="inkilaplar"}' in l.body) = 0 and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;
