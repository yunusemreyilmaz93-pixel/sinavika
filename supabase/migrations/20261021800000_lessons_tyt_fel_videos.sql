-- TYT Felsefe konularına video eklenir

update public.lessons l
set body = replace(l.body, $a$## 1. Felsefe nedir$a$, $v$::video{id="gOBZU4wAqLQ" etiket="Konu anlatımı videosu" baslik="Felsefeyi Tanıma" kanal="tonguç AKADEMİ"}

::video{id="6Qp7MjaHFks" etiket="Kısa tekrar videosu" baslik="Felsefeyi Tanıma" kanal="Açık Lise TV"}$v$ || chr(10) || chr(10) || $a$## 1. Felsefe nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Felsefeyi Tanıma'
  and position('::video{' in l.body) = 0 and position($a$## 1. Felsefe nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bilgi felsefesinin soruları$a$, $v$::video{id="WeMUy6Q3AY4" etiket="Konu anlatımı videosu" baslik="Bilgi Felsefesi" kanal="Hocalara Geldik"}

::video{id="Fa1Rg7xpQYA" etiket="Kısa tekrar videosu" baslik="Bilgi Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Bilgi felsefesinin soruları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Bilgi Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Bilgi felsefesinin soruları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Varlık felsefesi nedir$a$, $v$::video{id="MZ_RGLehgRY" etiket="Konu anlatımı videosu" baslik="Varlık Felsefesi" kanal="Hocalara Geldik"}

::video{id="NbEMOEyIDjA" etiket="Kısa tekrar videosu" baslik="Varlık Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Varlık felsefesi nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Varlık Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Varlık felsefesi nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ahlak ve etik$a$, $v$::video{id="HaHqbwGQsRo" etiket="Konu anlatımı videosu" baslik="Ahlak Felsefesi" kanal="Hocalara Geldik"}

::video{id="1GVZfZ1CsQ4" etiket="Kısa tekrar videosu" baslik="Ahlak Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Ahlak ve etik$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Ahlak Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ahlak ve etik$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Sanat felsefesi (estetik) nedir$a$, $v$::video{id="QrvxtFFGhKg" etiket="Konu anlatımı videosu" baslik="Sanat Felsefesi" kanal="Hocalara Geldik"}

::video{id="M74lab2opbE" etiket="Kısa tekrar videosu" baslik="Sanat Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Sanat felsefesi (estetik) nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Sanat Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Sanat felsefesi (estetik) nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Din felsefesi nedir$a$, $v$::video{id="o1khmFl939A" etiket="Konu anlatımı videosu" baslik="Din Felsefesi" kanal="Hocalara Geldik"}

::video{id="MgMGoy2XjLo" etiket="Kısa tekrar videosu" baslik="Din Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Din felsefesi nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Din Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Din felsefesi nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Siyaset felsefesi nedir$a$, $v$::video{id="zI0X4KnrY0M" etiket="Konu anlatımı videosu" baslik="Siyaset Felsefesi" kanal="Hocalara Geldik"}

::video{id="CeLo0vzaMTc" etiket="Kısa tekrar videosu" baslik="Siyaset Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Siyaset felsefesi nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Siyaset Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Siyaset felsefesi nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bilim nedir$a$, $v$::video{id="fXrb23RjwE0" etiket="Konu anlatımı videosu" baslik="Bilim Felsefesi" kanal="Hocalara Geldik"}

::video{id="AdH6TD-3B30" etiket="Kısa tekrar videosu" baslik="Bilim Felsefesi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Bilim nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Bilim Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Bilim nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dönemler$a$, $v$::video{id="ClTV1IZFsHU" etiket="Konu anlatımı videosu" baslik="İlk Çağ Felsefesi" kanal="Açık Lise TV"}

::video{id="s2oA-KTLqow" etiket="Kısa tekrar videosu" baslik="İlk Çağ Felsefesi" kanal="KhanAcademyTurkce"}$v$ || chr(10) || chr(10) || $a$## 1. Dönemler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'İlk Çağ Felsefesi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Dönemler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Genel özellikler$a$, $v$::video{id="4K98eTXMcYE" etiket="Konu anlatımı videosu" baslik="MS 2. Yüzyıldan 15. Yüzyıla Felsefe" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Genel özellikler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fel' and t.name = 'MS 2. Yüzyıldan 15. Yüzyıla Felsefe'
  and position('::video{' in l.body) = 0 and position($a$## 1. Genel özellikler$a$ in l.body) > 0;
