-- TYT Coğrafya: her konuya doğrulanmış YouTube videoları

update public.lessons l
set body = replace(l.body, $a$## 1. Coğrafya nedir$a$, $v$::video{id="LL8OQGD7Lmg" etiket="Konu anlatımı videosu" baslik="Doğa ve İnsan" kanal="tonguç AKADEMİ"}

::video{id="iCzYrvCVe04" etiket="Kısa tekrar videosu" baslik="Doğa ve İnsan" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Coğrafya nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğa ve İnsan'
  and position('::video{' in l.body) = 0 and position($a$## 1. Coğrafya nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dünya’nın şekli$a$, $v$::video{id="QtHLTq8gdr0" etiket="Konu anlatımı videosu" baslik="Dünya'nın Şekli ve Hareketleri" kanal="tonguç AKADEMİ"}

::video{id="E0k6vOhlfmA" etiket="Kısa tekrar videosu" baslik="Dünya'nın Şekli ve Hareketleri" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Dünya’nın şekli$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Dünya''nın Şekli ve Hareketleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Dünya’nın şekli$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Mutlak (matematik) konum$a$, $v$::video{id="wcswt1Pfqo4" etiket="Konu anlatımı videosu" baslik="Coğrafi Konum" kanal="tonguç AKADEMİ"}

::video{id="yY0RM7VOPnI" etiket="Kısa tekrar videosu" baslik="Coğrafi Konum" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Mutlak (matematik) konum$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Coğrafi Konum'
  and position('::video{' in l.body) = 0 and position($a$## 1. Mutlak (matematik) konum$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Harita ve temel öğeleri$a$, $v$::video{id="XpPOAkW7zVc" etiket="Konu anlatımı videosu" baslik="Harita Bilgisi" kanal="Coğrafyanın Kodları"}

::video{id="uPxVjQGSU0I" etiket="Kısa tekrar videosu" baslik="Harita Bilgisi" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Harita ve temel öğeleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Harita Bilgisi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Harita ve temel öğeleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Atmosfer$a$, $v$::video{id="u5qpXAEmy6o" etiket="Konu anlatımı videosu" baslik="Atmosfer ve İklim" kanal="Hocalara Geldik"}

::video{id="15i3fVmN7i8" etiket="Kısa tekrar videosu" baslik="Atmosfer ve İklim" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Atmosfer$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Atmosfer ve İklim'
  and position('::video{' in l.body) = 0 and position($a$## 1. Atmosfer$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İç kuvvetler$a$, $v$::video{id="XNq10EE6Gzk" etiket="Konu anlatımı videosu" baslik="İç ve Dış Kuvvetler" kanal="Coğrafyanın Kodları"}

::video{id="NS3Yvl908hY" etiket="Kısa tekrar videosu" baslik="İç ve Dış Kuvvetler" kanal="Coğrafyanın Kodları"}$v$ || chr(10) || chr(10) || $a$## 1. İç kuvvetler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'İç ve Dış Kuvvetler'
  and position('::video{' in l.body) = 0 and position($a$## 1. İç kuvvetler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Okyanus ve denizler$a$, $v$::video{id="K5smClyuIF4" etiket="Konu anlatımı videosu" baslik="Su, Toprak ve Bitki" kanal="Yargı Plus"}

::video{id="cAR0HUTUykI" etiket="Kısa tekrar videosu" baslik="Su, Toprak ve Bitki" kanal="Enes Hoca Coğrafya "}$v$ || chr(10) || chr(10) || $a$## 1. Okyanus ve denizler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Su, Toprak ve Bitki'
  and position('::video{' in l.body) = 0 and position($a$## 1. Okyanus ve denizler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Nüfus ve nüfus artışı$a$, $v$::video{id="3ZR9MHsf9jc" etiket="Konu anlatımı videosu" baslik="Nüfus ve Göç" kanal="Hocalara Geldik"}

::video{id="JKoHZ7is6FY" etiket="Kısa tekrar videosu" baslik="Nüfus ve Göç" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Nüfus ve nüfus artışı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Nüfus ve Göç'
  and position('::video{' in l.body) = 0 and position($a$## 1. Nüfus ve nüfus artışı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yerleşme nedir$a$, $v$::video{id="y-mhES3hxeE" etiket="Konu anlatımı videosu" baslik="Yerleşme" kanal="Mehmet Eğit"}

::video{id="MwTKmj-F9T8" etiket="Kısa tekrar videosu" baslik="Yerleşme" kanal="Mehmet Eğit"}$v$ || chr(10) || chr(10) || $a$## 1. Yerleşme nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Yerleşme'
  and position('::video{' in l.body) = 0 and position($a$## 1. Yerleşme nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Genel özellikler$a$, $v$::video{id="Q3MgO38w7M4" etiket="Konu anlatımı videosu" baslik="Türkiye'nin Yer Şekilleri" kanal="Yargı Plus"}

::video{id="67-LuBsOb7s" etiket="Kısa tekrar videosu" baslik="Türkiye'nin Yer Şekilleri" kanal="Mehmet Eğit"}$v$ || chr(10) || chr(10) || $a$## 1. Genel özellikler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Türkiye''nin Yer Şekilleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Genel özellikler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ekonomik faaliyetler ve sektörler$a$, $v$::video{id="e0V4GiYlie0" etiket="Konu anlatımı videosu" baslik="Ekonomik Faaliyetler" kanal="Mehmet Eğit"}

::video{id="4LfU178lPHg" etiket="Kısa tekrar videosu" baslik="Ekonomik Faaliyetler" kanal="Yargı Plus"}$v$ || chr(10) || chr(10) || $a$## 1. Ekonomik faaliyetler ve sektörler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ekonomik Faaliyetler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ekonomik faaliyetler ve sektörler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bölge nedir$a$, $v$::video{id="LAaq_yjw9FE" etiket="Konu anlatımı videosu" baslik="Bölgeler" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Bölge nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Bölgeler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Bölge nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ulaşımı etkileyen etmenler$a$, $v$::video{id="Zhba7Orj0GU" etiket="Konu anlatımı videosu" baslik="Ulaşım Hatları" kanal="Mehmet Eğit"}

::video{id="Mg0pyXaYDCQ" etiket="Kısa tekrar videosu" baslik="Ulaşım Hatları" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Ulaşımı etkileyen etmenler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ulaşım Hatları'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ulaşımı etkileyen etmenler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İnsan ve çevre$a$, $v$::video{id="U2Q4uqqV9X8" etiket="Konu anlatımı videosu" baslik="Çevre ve Toplum" kanal="Hocalara Geldik"}

::video{id="BtKjAaaFcnQ" etiket="Kısa tekrar videosu" baslik="Çevre ve Toplum" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. İnsan ve çevre$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Çevre ve Toplum'
  and position('::video{' in l.body) = 0 and position($a$## 1. İnsan ve çevre$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Doğal olay, afet ve risk$a$, $v$::video{id="hG8lu194n8c" etiket="Konu anlatımı videosu" baslik="Doğal Afetler" kanal="Coğrafyanın Kodları"}

::video{id="fCL5LqKsgBI" etiket="Kısa tekrar videosu" baslik="Doğal Afetler" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Doğal olay, afet ve risk$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğal Afetler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Doğal olay, afet ve risk$a$ in l.body) > 0;
