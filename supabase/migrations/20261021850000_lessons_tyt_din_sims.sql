-- TYT Din Kültürü konularına zaman şeridi simülasyonları

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Hayatı zaman şeridinde

Önemli olayları sırasıyla gör.

::sim{tur="hzmuhammed"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Hz. Muhammed ve Gençlik'
  and position('::sim{tur="hzmuhammed"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Şahsiyetler zaman şeridinde

İmamları, kelamcıları ve mutasavvıfları yaşadıkları sırayla gör.

::sim{tur="islamdusuncesi"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam Düşüncesinde Yorumlar'
  and position('::sim{tur="islamdusuncesi"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;
