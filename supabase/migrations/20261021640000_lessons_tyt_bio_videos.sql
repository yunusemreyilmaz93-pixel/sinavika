-- TYT Biyoloji: doğrulanmış videolar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 1. Canlıların ortak özellikleri$a$, $v$::video{id="-I1AQNdRzYs" etiket="Konu anlatımı videosu" baslik="Canlıların Ortak Özellikleri" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Canlıların ortak özellikleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Ortak Özellikleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Canlıların ortak özellikleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İnorganik bileşikler$a$, $v$::video{id="ABPBUbKajJc" etiket="Konu anlatımı videosu" baslik="Canlıların Temel Bileşenleri" kanal="tonguç AKADEMİ"}

::video{id="r0PduzRjwXA" etiket="Kısa tekrar videosu" baslik="Canlıların Temel Bileşenleri" kanal="FUNDAmentals Biyoloji"}$v$ || chr(10) || chr(10) || $a$## 1. İnorganik bileşikler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Temel Bileşenleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. İnorganik bileşikler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Hücre kuramı$a$, $v$::video{id="fuZBrTHoygc" etiket="Konu anlatımı videosu" baslik="Hücre ve Organelleri" kanal="UFUK KIY"}

::video{id="EA9cwCaooxI" etiket="Kısa tekrar videosu" baslik="Hücre ve Organelleri" kanal="YavuzBio"}$v$ || chr(10) || chr(10) || $a$## 1. Hücre kuramı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre ve Organelleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Hücre kuramı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Zarın yapısı$a$, $v$::video{id="XlRPaw1NeQ8" etiket="Konu anlatımı videosu" baslik="Hücre Zarından Madde Geçişi" kanal="Beş dakikada Biyoloji"}

::video{id="07AslsHZ7CI" etiket="Kısa tekrar videosu" baslik="Hücre Zarından Madde Geçişi" kanal="Selin Hoca Biyoloji"}$v$ || chr(10) || chr(10) || $a$## 1. Zarın yapısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre Zarından Madde Geçişi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Zarın yapısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Sınıflandırmanın amacı$a$, $v$::video{id="yKFpPuzCSEk" etiket="Konu anlatımı videosu" baslik="Canlıların Sınıflandırılması" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Sınıflandırmanın amacı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Sınıflandırılması'
  and position('::video{' in l.body) = 0 and position($a$## 1. Sınıflandırmanın amacı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Temel kavramlar$a$, $v$::video{id="F5TUDgiWFSI" etiket="Konu anlatımı videosu" baslik="Hücre Bölünmeleri" kanal="Seda Hoca Biyoloji"}$v$ || chr(10) || chr(10) || $a$## 1. Temel kavramlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre Bölünmeleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Temel kavramlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Temel kavramlar$a$, $v$::video{id="kZJhmNLt_oQ" etiket="Konu anlatımı videosu" baslik="Kalıtım" kanal="Selin Hoca Biyoloji"}$v$ || chr(10) || chr(10) || $a$## 1. Temel kavramlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Kalıtım'
  and position('::video{' in l.body) = 0 and position($a$## 1. Temel kavramlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ekosistemin bileşenleri$a$, $v$::video{id="-Vjjy5p3DNQ" etiket="Konu anlatımı videosu" baslik="Ekosistem Ekolojisi" kanal="Senin Biyolojin"}$v$ || chr(10) || chr(10) || $a$## 1. Ekosistemin bileşenleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Ekosistem Ekolojisi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ekosistemin bileşenleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Hava kirliliği$a$, $v$::video{id="a29-zBpBA4M" etiket="Konu anlatımı videosu" baslik="Güncel Çevre Sorunları" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Hava kirliliği$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Güncel Çevre Sorunları'
  and position('::video{' in l.body) = 0 and position($a$## 1. Hava kirliliği$a$ in l.body) > 0;
