-- TYT Kimya: konulara simülasyonlar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 4. Periyodik sistem$a$, $v$## Elektron dizilimini gör

Atom numarasını değiştir. Elektronların katmanlara nasıl yerleştiğini, periyodu ve grubu gör.

::sim{tur="atom"}$v$ || chr(10) || chr(10) || $a$## 4. Periyodik sistem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Atom ve Periyodik Sistem'
  and position('::sim{tur="atom"}' in l.body) = 0 and position($a$## 4. Periyodik sistem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Gazların özellikleri ve basıncı$a$, $v$## Grafikte gör

Verilen ısıyı artır. Hâl değişimi sırasında sıcaklığın sabit kaldığına dikkat et.

::sim{tur="hal"}$v$ || chr(10) || chr(10) || $a$## 3. Gazların özellikleri ve basıncı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Maddenin Halleri'
  and position('::sim{tur="hal"}' in l.body) = 0 and position($a$## 3. Gazların özellikleri ve basıncı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. İdeal gaz denklemi$a$, $v$## Gazı dene

Sıcaklığı ve hacmi değiştir. Basıncın taneciklerin çarpışmalarından doğduğunu gör.

::sim{tur="gaz"}$v$ || chr(10) || chr(10) || $a$## 5. İdeal gaz denklemi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Maddenin Halleri'
  and position('::sim{tur="gaz"}' in l.body) = 0 and position($a$## 5. İdeal gaz denklemi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Formülden atom sayısı$a$, $v$## Mol hesabını dene

Madde miktarını değiştir. Kütle, tanecik sayısı ve gaz hacminin mol ile birlikte nasıl değiştiğine bak.

::sim{tur="mol"}$v$ || chr(10) || chr(10) || $a$## 4. Formülden atom sayısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Mol Kavramı'
  and position('::sim{tur="mol"}' in l.body) = 0 and position($a$## 4. Formülden atom sayısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Verim$a$, $v$## Sınırlayıcı bileşeni bul

Girenlerin mol sayısını değiştir. Önce biten madde sınırlayıcıdır, ürün miktarını o belirler.

::sim{tur="tepkime"}$v$ || chr(10) || chr(10) || $a$## 5. Verim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Tepkimeler ve Hesaplamalar'
  and position('::sim{tur="tepkime"}' in l.body) = 0 and position($a$## 5. Verim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Karışımları ayırma yöntemleri$a$, $v$## Karıştırarak gör

İki çözeltinin miktarını ve yoğunluğunu değiştir. Karışımın derişimi iki derişimin arasında kalır.

::sim{tur="karisim"}$v$ || chr(10) || chr(10) || $a$## 4. Karışımları ayırma yöntemleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Karışımlar'
  and position('::sim{tur="karisim"}' in l.body) = 0 and position($a$## 4. Karışımları ayırma yöntemleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Nötrleşme ve tuzlar$a$, $v$## pH ölçeğini dene

pH değerini değiştirip çözeltinin asidik, bazik ya da nötr olduğunu ve indikatör renklerini gör.

::sim{tur="ph"}$v$ || chr(10) || chr(10) || $a$## 4. Nötrleşme ve tuzlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Asitler, Bazlar ve Tuzlar'
  and position('::sim{tur="ph"}' in l.body) = 0 and position($a$## 4. Nötrleşme ve tuzlar$a$ in l.body) > 0;
