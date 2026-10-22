-- TYT Fizik: konulara simülasyonlar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 5. Serbest düşme$a$, $v$## Grafikte gör

İlk hızı ve ivmeyi değiştir. Grafiğin eğimi ivmeyi, altında kalan alan yer değiştirmeyi verir.

::sim{tur="ivme"}$v$ || chr(10) || chr(10) || $a$## 5. Serbest düşme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Hareket ve Kuvvet'
  and position('::sim{tur="ivme"}' in l.body) = 0 and position($a$## 5. Serbest düşme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Verim$a$, $v$## Enerjinin dönüşümünü gör

Cismin yüksekliğini değiştir. Sürtünme yokken potansiyel enerjideki azalma kadar kinetik enerji artar.

::sim{tur="enerji"}$v$ || chr(10) || chr(10) || $a$## 6. Verim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'İş, Güç ve Enerji'
  and position('::sim{tur="enerji"}' in l.body) = 0 and position($a$## 6. Verim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Genleşme$a$, $v$## Grafikte gör

Verilen ısıyı artır. Erime ve kaynama sırasında ısı verilmesine rağmen sıcaklığın sabit kaldığına dikkat et.

::sim{tur="hal"}$v$ || chr(10) || chr(10) || $a$## 5. Genleşme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Isı ve Sıcaklık'
  and position('::sim{tur="hal"}' in l.body) = 0 and position($a$## 5. Genleşme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Elektrik alanı$a$, $v$## Kuvveti değiştir

Yükleri ve uzaklığı değiştir. Uzaklık iki katına çıkınca kuvvet dörtte birine iner.

::sim{tur="coulomb"}$v$ || chr(10) || chr(10) || $a$## 6. Elektrik alanı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrostatik'
  and position('::sim{tur="coulomb"}' in l.body) = 0 and position($a$## 6. Elektrik alanı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Elektriksel güç ve enerji$a$, $v$## Devreyi kur

Seri ve paralel bağlamada akımın ve gerilimin nasıl paylaşıldığını karşılaştır.

::sim{tur="devre"}$v$ || chr(10) || chr(10) || $a$## 4. Elektriksel güç ve enerji$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrik ve Manyetizma'
  and position('::sim{tur="devre"}' in l.body) = 0 and position($a$## 4. Elektriksel güç ve enerji$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Yüzme, askıda kalma, batma$a$, $v$## Yüzme ve batmayı dene

Cismin ve sıvının özkütlesini değiştir. Cisim, ağırlığına eşit kaldırma kuvveti oluşana kadar batar.

::sim{tur="kaldirma"}$v$ || chr(10) || chr(10) || $a$## 6. Yüzme, askıda kalma, batma$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Basınç ve Kaldırma Kuvveti'
  and position('::sim{tur="kaldirma"}' in l.body) = 0 and position($a$## 6. Yüzme, askıda kalma, batma$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Su dalgaları$a$, $v$## Dalgayı değiştir

Genliği, dalga boyunu ve frekansı değiştir. Dalganın hızı genliğe bağlı değildir.

::sim{tur="dalga"}$v$ || chr(10) || chr(10) || $a$## 4. Su dalgaları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Dalgalar'
  and position('::sim{tur="dalga"}' in l.body) = 0 and position($a$## 4. Su dalgaları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 7. Işığın renkleri$a$, $v$## Görüntüyü gör

Cismi merceğe yaklaştırıp uzaklaştır. Cisim odak noktasının içine girince görüntü sanal ve düz olur.

::sim{tur="mercek"}$v$ || chr(10) || chr(10) || $a$## 7. Işığın renkleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Optik'
  and position('::sim{tur="mercek"}' in l.body) = 0 and position($a$## 7. Işığın renkleri$a$ in l.body) > 0;
