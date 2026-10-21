-- Konu anlatımlarına etkileşimli simülasyonlar. Metne dokunmaz, simülasyon zaten varsa atlar.
update public.lessons l
set body = replace(l.body, $a$## 3. Hava olayları ve iklim$a$, $v$::sim{tur="mevsim"}$v$ || chr(10) || chr(10) || $a$## 3. Hava olayları ve iklim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim'
  and position('::sim{tur="mevsim"}' in l.body) = 0 and position($a$## 3. Hava olayları ve iklim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$::sim{tur="olasilik"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Basit Olayların Olma Olasılığı'
  and position('::sim{tur="olasilik"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Eksenleri kestiği noktalar$a$, $v$::sim{tur="dogru"}$v$ || chr(10) || chr(10) || $a$## 4. Eksenleri kestiği noktalar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Doğrusal Denklemler'
  and position('::sim{tur="dogru"}' in l.body) = 0 and position($a$## 4. Eksenleri kestiği noktalar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Konuyu toparla$a$, $v$::sim{tur="pisagor"}$v$ || chr(10) || chr(10) || $a$## 5. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Üçgenler'
  and position('::sim{tur="pisagor"}' in l.body) = 0 and position($a$## 5. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Makaralar$a$, $v$::sim{tur="kaldirac"}$v$ || chr(10) || chr(10) || $a$## 3. Makaralar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler'
  and position('::sim{tur="kaldirac"}' in l.body) = 0 and position($a$## 3. Makaralar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Dönüşümlerde değişmeyenler$a$, $v$::sim{tur="donusum"}$v$ || chr(10) || chr(10) || $a$## 4. Dönüşümlerde değişmeyenler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Dönüşüm Geometrisi'
  and position('::sim{tur="donusum"}' in l.body) = 0 and position($a$## 4. Dönüşümlerde değişmeyenler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$### İndikatörler$a$, $v$::sim{tur="ph"}$v$ || chr(10) || chr(10) || $a$### İndikatörler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Madde ve Endüstri'
  and position('::sim{tur="ph"}' in l.body) = 0 and position($a$### İndikatörler$a$ in l.body) > 0;
