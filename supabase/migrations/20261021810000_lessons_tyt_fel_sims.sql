-- TYT Felsefe konularına filozof zaman şeritleri

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $v$## Filozoflar sırayla

Filozofları yaşadıkları sırayla gör ve her birinin görüşünü hatırla.

::sim{tur="ilkcagfelsefe"}$v$ || chr(10) || chr(10) || $a$## 8. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'İlk Çağ Felsefesi'
  and position('::sim{tur="ilkcagfelsefe"}' in l.body) = 0 and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Konuyu toparla$a$, $v$## Düşünürler sırayla

Düşünürleri yaşadıkları sırayla gör ve her birinin görüşünü hatırla.

::sim{tur="ortacagfelsefe"}$v$ || chr(10) || chr(10) || $a$## 5. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'MS 2. Yüzyıldan 15. Yüzyıla Felsefe'
  and position('::sim{tur="ortacagfelsefe"}' in l.body) = 0 and position($a$## 5. Konuyu toparla$a$ in l.body) > 0;
