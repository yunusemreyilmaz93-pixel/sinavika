-- TYT Kimya: doğrulanmış videolar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 1. Kimya ve alt dalları$a$, $v$::video{id="keBVhREFAHk" etiket="Konu anlatımı videosu" baslik="Kimya Bilimi" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Kimya ve alt dalları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimya Bilimi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kimya ve alt dalları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Atom modelleri$a$, $v$::video{id="mICK1fCWPUA" etiket="Konu anlatımı videosu" baslik="Atom ve Periyodik Sistem" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Atom modelleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Atom ve Periyodik Sistem'
  and position('::video{' in l.body) = 0 and position($a$## 1. Atom modelleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Güçlü etkileşimler (kimyasal bağlar)$a$, $v$::video{id="uoDrWS5Og_8" etiket="Konu anlatımı videosu" baslik="Kimyasal Türler Arası Etkileşimler" kanal="Kimyacım Plus"}

::video{id="fOxQ-grkGIQ" etiket="Kısa tekrar videosu" baslik="Kimyasal Türler Arası Etkileşimler" kanal="Benim Hocam"}$v$ || chr(10) || chr(10) || $a$## 1. Güçlü etkileşimler (kimyasal bağlar)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Türler Arası Etkileşimler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Güçlü etkileşimler (kimyasal bağlar)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Maddenin hâlleri$a$, $v$::video{id="D-rE89dpxrU" etiket="Konu anlatımı videosu" baslik="Maddenin Halleri" kanal="Hocalara Geldik"}

::video{id="7tlTzGIt8cU" etiket="Kısa tekrar videosu" baslik="Maddenin Halleri" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Maddenin hâlleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Maddenin Halleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Maddenin hâlleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Hava ve atmosfer$a$, $v$::video{id="mm0SN19OrW4" etiket="Konu anlatımı videosu" baslik="Doğa ve Kimya" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Hava ve atmosfer$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Doğa ve Kimya'
  and position('::video{' in l.body) = 0 and position($a$## 1. Hava ve atmosfer$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kütlenin korunumu (Lavoisier)$a$, $v$::video{id="BB1jlc4YgRA" etiket="Konu anlatımı videosu" baslik="Kimyanın Temel Kanunları" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Kütlenin korunumu (Lavoisier)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyanın Temel Kanunları'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kütlenin korunumu (Lavoisier)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Mol ve Avogadro sayısı$a$, $v$::video{id="PGZNyf1kfYk" etiket="Konu anlatımı videosu" baslik="Mol Kavramı" kanal="tonguç AKADEMİ"}

::video{id="5j8yanfgUR4" etiket="Kısa tekrar videosu" baslik="Mol Kavramı" kanal="KhanAcademyTurkce"}$v$ || chr(10) || chr(10) || $a$## 1. Mol ve Avogadro sayısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Mol Kavramı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Mol ve Avogadro sayısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Tepkime türleri$a$, $v$::video{id="RiWjDeHKxJ4" etiket="Konu anlatımı videosu" baslik="Kimyasal Tepkimeler ve Hesaplamalar" kanal="Hocalara Geldik"}

::video{id="fAqM4qo6GSY" etiket="Kısa tekrar videosu" baslik="Kimyasal Tepkimeler ve Hesaplamalar" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Tepkime türleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Tepkimeler ve Hesaplamalar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Tepkime türleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Karışım çeşitleri$a$, $v$::video{id="MczDdGmSma4" etiket="Konu anlatımı videosu" baslik="Karışımlar" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Karışım çeşitleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Karışımlar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Karışım çeşitleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Asit ve baz nedir$a$, $v$::video{id="zqmt7_foFbo" etiket="Konu anlatımı videosu" baslik="Asitler, Bazlar ve Tuzlar" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Asit ve baz nedir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Asitler, Bazlar ve Tuzlar'
  and position('::video{' in l.body) = 0 and position($a$## 1. Asit ve baz nedir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Su ve sertlik$a$, $v$::video{id="30YUKlAa7TY" etiket="Konu anlatımı videosu" baslik="Kimya Her Yerde" kanal="Kimya Dersleri - Sinan İHTİYAROĞLU"}$v$ || chr(10) || chr(10) || $a$## 1. Su ve sertlik$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimya Her Yerde'
  and position('::video{' in l.body) = 0 and position($a$## 1. Su ve sertlik$a$ in l.body) > 0;
