-- TYT Fizik: doğrulanmış videolar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 1. Fizik nedir?$a$, $v$::video{id="msPoSlKXzfs" etiket="Konu anlatımı videosu" baslik="Fizik Bilimine Giriş" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Fizik nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Fizik Bilimine Giriş'
  and position('::video{' in l.body) = 0 and position($a$## 1. Fizik nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kütle, hacim, özkütle$a$, $v$::video{id="VJ_cvF74iss" etiket="Konu anlatımı videosu" baslik="Madde ve Özellikleri" kanal="Kısa Bilim"}$v$ || chr(10) || chr(10) || $a$## 1. Kütle, hacim, özkütle$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Madde ve Özellikleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kütle, hacim, özkütle$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Konum, yol, yer değiştirme$a$, $v$::video{id="MWKn9jRL870" etiket="Konu anlatımı videosu" baslik="Hareket ve Kuvvet" kanal="VIP FİZİK"}

::video{id="qP0TAnsnAkI" etiket="Kısa tekrar videosu" baslik="Hareket ve Kuvvet" kanal="NETLER CEPTE"}$v$ || chr(10) || chr(10) || $a$## 1. Konum, yol, yer değiştirme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Hareket ve Kuvvet'
  and position('::video{' in l.body) = 0 and position($a$## 1. Konum, yol, yer değiştirme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İş$a$, $v$::video{id="IesK2MmVBk0" etiket="Konu anlatımı videosu" baslik="İş, Güç ve Enerji" kanal="Hocalara Geldik"}

::video{id="b297sh-tfwc" etiket="Kısa tekrar videosu" baslik="İş, Güç ve Enerji" kanal="Ünsal Efe Fizik"}$v$ || chr(10) || chr(10) || $a$## 1. İş$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'İş, Güç ve Enerji'
  and position('::video{' in l.body) = 0 and position($a$## 1. İş$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Isı ve sıcaklık$a$, $v$::video{id="PXVuSyaR-aI" etiket="Konu anlatımı videosu" baslik="Isı ve Sıcaklık" kanal="tonguç AKADEMİ"}

::video{id="kHTZxciLWaY" etiket="Kısa tekrar videosu" baslik="Isı ve Sıcaklık" kanal="PEK FİZİK"}$v$ || chr(10) || chr(10) || $a$## 1. Isı ve sıcaklık$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Isı ve Sıcaklık'
  and position('::video{' in l.body) = 0 and position($a$## 1. Isı ve sıcaklık$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Elektrik yükü$a$, $v$::video{id="AAuQ386JNvk" etiket="Konu anlatımı videosu" baslik="Elektrostatik" kanal="Hocalara Geldik"}

::video{id="c-tnh-jS2xA" etiket="Kısa tekrar videosu" baslik="Elektrostatik" kanal="Ünsal Efe Fizik"}$v$ || chr(10) || chr(10) || $a$## 1. Elektrik yükü$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrostatik'
  and position('::video{' in l.body) = 0 and position($a$## 1. Elektrik yükü$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Elektrik akımı, gerilim ve direnç$a$, $v$::video{id="-2DiISfHUgw" etiket="Konu anlatımı videosu" baslik="Elektrik ve Manyetizma" kanal="Hocalara Geldik"}

::video{id="2SgkGt9U7YY" etiket="Kısa tekrar videosu" baslik="Elektrik ve Manyetizma" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Elektrik akımı, gerilim ve direnç$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrik ve Manyetizma'
  and position('::video{' in l.body) = 0 and position($a$## 1. Elektrik akımı, gerilim ve direnç$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Katı basıncı$a$, $v$::video{id="weMmg-9AXuM" etiket="Konu anlatımı videosu" baslik="Basınç ve Kaldırma Kuvveti" kanal="tonguç AKADEMİ"}

::video{id="KP-5K7yEFWA" etiket="Kısa tekrar videosu" baslik="Basınç ve Kaldırma Kuvveti" kanal="EMRE ÇİVLİK İLE KOLAY FİZİK"}$v$ || chr(10) || chr(10) || $a$## 1. Katı basıncı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Basınç ve Kaldırma Kuvveti'
  and position('::video{' in l.body) = 0 and position($a$## 1. Katı basıncı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dalga nedir?$a$, $v$::video{id="eYUpgIvPP0Y" etiket="Konu anlatımı videosu" baslik="Dalgalar" kanal="tonguç AKADEMİ"}

::video{id="Vtk262n-Uzg" etiket="Kısa tekrar videosu" baslik="Dalgalar" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Dalga nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Dalgalar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Dalga nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Işığın yayılması ve gölge$a$, $v$::video{id="at4cIdjzH2o" etiket="Konu anlatımı videosu" baslik="Optik" kanal="ProKoç"}$v$ || chr(10) || chr(10) || $a$## 1. Işığın yayılması ve gölge$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Optik'
  and position('::video{' in l.body) = 0 and position($a$## 1. Işığın yayılması ve gölge$a$ in l.body) > 0;
