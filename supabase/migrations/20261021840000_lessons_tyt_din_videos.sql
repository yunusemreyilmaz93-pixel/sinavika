-- TYT Din Kültürü konularına video eklenir

update public.lessons l
set body = replace(l.body, $a$## 1. Bilgi ve bilgi kaynakları$a$, $v$::video{id="b-CimsfYW1U" etiket="Konu anlatımı videosu" baslik="Bilgi ve İnanç" kanal="Hoca Kafası"}

::video{id="5pwXyEDJOHE" etiket="Kısa tekrar videosu" baslik="Bilgi ve İnanç" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Bilgi ve bilgi kaynakları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Bilgi ve İnanç'
  and position('::video{' in l.body) = 0 and position($a$## 1. Bilgi ve bilgi kaynakları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İbadet nedir$a$, $v$::video{id="XMYcscKZulA" etiket="Konu anlatımı videosu" baslik="İslam ve İbadet" kanal="Hoca Kafası"}

::video{id="-yVjkxBfFss" etiket="Kısa tekrar videosu" baslik="İslam ve İbadet" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. İbadet nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam ve İbadet'
  and position('::video{' in l.body) = 0 and position($a$## 1. İbadet nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Gençlik dönemi$a$, $v$::video{id="F_6PGjobzao" etiket="Konu anlatımı videosu" baslik="Gençlik ve Değerler" kanal="Hoca Kafası"}$v$ || chr(10) || chr(10) || $a$## 1. Gençlik dönemi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Gençlik ve Değerler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Gençlik dönemi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Allah inancı ve tevhid$a$, $v$::video{id="203SiC7AeT4" etiket="Konu anlatımı videosu" baslik="Allah İnsan İlişkisi" kanal="Açık Lise TV"}

::video{id="tOU5zHwMBcA" etiket="Kısa tekrar videosu" baslik="Allah İnsan İlişkisi" kanal="Cebrail Hocam"}$v$ || chr(10) || chr(10) || $a$## 1. Allah inancı ve tevhid$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Allah İnsan İlişkisi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Allah inancı ve tevhid$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Cahiliye ortamı, doğumu ve çocukluğu$a$, $v$::video{id="f3AwpVOOPZs" etiket="Konu anlatımı videosu" baslik="Hz. Muhammed ve Gençlik" kanal="Hoca Kafası"}

::video{id="iIi8M5ZKxOI" etiket="Kısa tekrar videosu" baslik="Hz. Muhammed ve Gençlik" kanal="Hoca Kafası"}$v$ || chr(10) || chr(10) || $a$## 1. Cahiliye ortamı, doğumu ve çocukluğu$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Hz. Muhammed ve Gençlik'
  and position('::video{' in l.body) = 0 and position($a$## 1. Cahiliye ortamı, doğumu ve çocukluğu$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Din, felsefe, bilim ve dinin işlevleri$a$, $v$::video{id="D4V8a0M3ry8" etiket="Konu anlatımı videosu" baslik="Din ve Toplumsal Hayat" kanal="Hoca Kafası"}$v$ || chr(10) || chr(10) || $a$## 1. Din, felsefe, bilim ve dinin işlevleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Din ve Toplumsal Hayat'
  and position('::video{' in l.body) = 0 and position($a$## 1. Din, felsefe, bilim ve dinin işlevleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ahlak nedir$a$, $v$::video{id="jnk2PNGe3-0" etiket="Konu anlatımı videosu" baslik="Ahlaki Tutum ve Davranışlar" kanal="Cebrail Hocam"}

::video{id="vicuyr1Bt9Q" etiket="Kısa tekrar videosu" baslik="Ahlaki Tutum ve Davranışlar" kanal="e akademi tv"}$v$ || chr(10) || chr(10) || $a$## 1. Ahlak nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Ahlaki Tutum ve Davranışlar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ahlak nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Mezhep ve yorum çeşitliliği$a$, $v$::video{id="ermL8AtrjpY" etiket="Konu anlatımı videosu" baslik="İslam Düşüncesinde Yorumlar" kanal="Hoca Kafası"}

::video{id="02k4CKuGONg" etiket="Kısa tekrar videosu" baslik="İslam Düşüncesinde Yorumlar" kanal="oz akademi"}$v$ || chr(10) || chr(10) || $a$## 1. Mezhep ve yorum çeşitliliği$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam Düşüncesinde Yorumlar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Mezhep ve yorum çeşitliliği$a$ in l.body) > 0;
