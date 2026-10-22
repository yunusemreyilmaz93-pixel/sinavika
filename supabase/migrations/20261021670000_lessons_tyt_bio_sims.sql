-- TYT Biyoloji: konulara simülasyonlar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Osmozu dene

Ortamın tuz derişimini değiştir. Su, derişimin düşük olduğu taraftan yüksek olduğu tarafa geçer.

::sim{tur="osmoz"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre Zarından Madde Geçişi'
  and position('::sim{tur="osmoz"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Dihibrit çaprazlama$a$, $v$## Punnett karesini kur

Ebeveyn genotiplerini seç ve yavruların genotip ile fenotip oranlarını gör.

::sim{tur="punnett"}$v$ || chr(10) || chr(10) || $a$## 3. Dihibrit çaprazlama$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Kalıtım'
  and position('::sim{tur="punnett"}' in l.body) = 0 and position($a$## 3. Dihibrit çaprazlama$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Madde döngüleri$a$, $v$## Piramidi dene

Aktarım yüzdesini değiştir. Her basamakta enerjinin büyük kısmı kaybolur.

::sim{tur="piramit"}$v$ || chr(10) || chr(10) || $a$## 4. Madde döngüleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Ekosistem Ekolojisi'
  and position('::sim{tur="piramit"}' in l.body) = 0 and position($a$## 4. Madde döngüleri$a$ in l.body) > 0;
