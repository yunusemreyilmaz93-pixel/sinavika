-- TYT Türkçe konularına konu anlatımı videoları ekler

update public.lessons l
set body = replace(l.body, $a$## 1. Gerçek, yan, mecaz ve terim anlam$a$, $v$::video{id="-y5OVO4u9rk" etiket="Konu anlatımı videosu" baslik="Sözcükte Anlam" kanal="Retro Yayıncılık"}

::video{id="gPMb0rAAPIk" etiket="Kısa tekrar videosu" baslik="Sözcükte Anlam" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Gerçek, yan, mecaz ve terim anlam$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Sözcükte Anlam'
  and position('::video{' in l.body) = 0 and position($a$## 1. Gerçek, yan, mecaz ve terim anlam$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Neden-sonuç, amaç-sonuç, koşul-sonuç$a$, $v$::video{id="5FNTWh8F0uk" etiket="Konu anlatımı videosu" baslik="Cümlede Anlam" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Neden-sonuç, amaç-sonuç, koşul-sonuç$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümlede Anlam'
  and position('::video{' in l.body) = 0 and position($a$## 1. Neden-sonuç, amaç-sonuç, koşul-sonuç$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Paragrafın yapısı$a$, $v$::video{id="M2GaVZVhn_4" etiket="Konu anlatımı videosu" baslik="Paragraf" kanal="Retro Yayıncılık"}

::video{id="Wrvf7kOTPbs" etiket="Kısa tekrar videosu" baslik="Paragraf" kanal="Benim Hocam"}$v$ || chr(10) || chr(10) || $a$## 1. Paragrafın yapısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Paragraf'
  and position('::video{' in l.body) = 0 and position($a$## 1. Paragrafın yapısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ünlüler ve ünsüzler$a$, $v$::video{id="juJFHVk7ieE" etiket="Konu anlatımı videosu" baslik="Ses Bilgisi" kanal="Retro Yayıncılık"}

::video{id="QzRfa3oZ4rQ" etiket="Kısa tekrar videosu" baslik="Ses Bilgisi" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Ünlüler ve ünsüzler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Ses Bilgisi'
  and position('::video{' in l.body) = 0 and position($a$## 1. Ünlüler ve ünsüzler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Büyük harflerin kullanımı$a$, $v$::video{id="X--d21iqVcc" etiket="Konu anlatımı videosu" baslik="Yazım Kuralları" kanal="Retro Yayıncılık"}

::video{id="aEvzd7KCf8s" etiket="Kısa tekrar videosu" baslik="Yazım Kuralları" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Büyük harflerin kullanımı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Yazım Kuralları'
  and position('::video{' in l.body) = 0 and position($a$## 1. Büyük harflerin kullanımı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Nokta ve virgül$a$, $v$::video{id="CpCxBmpQdjM" etiket="Konu anlatımı videosu" baslik="Noktalama İşaretleri" kanal="Retro Yayıncılık"}

::video{id="DedyiW2jRZs" etiket="Kısa tekrar videosu" baslik="Noktalama İşaretleri" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Nokta ve virgül$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Noktalama İşaretleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Nokta ve virgül$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kök, gövde, ek$a$, $v$::video{id="63k9-DXYJCI" etiket="Konu anlatımı videosu" baslik="Sözcükte Yapı" kanal="Retro Yayıncılık"}

::video{id="n8vFH-4xQHU" etiket="Kısa tekrar videosu" baslik="Sözcükte Yapı" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Kök, gövde, ek$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Sözcükte Yapı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Kök, gövde, ek$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İsim$a$, $v$::video{id="cwPVMIgVvwQ" etiket="Konu anlatımı videosu" baslik="İsim ve Sıfat" kanal="Retro Yayıncılık"}

::video{id="vtBBBsoM1zo" etiket="Kısa tekrar videosu" baslik="İsim ve Sıfat" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. İsim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'İsim ve Sıfat'
  and position('::video{' in l.body) = 0 and position($a$## 1. İsim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Zamir$a$, $v$::video{id="EXiiTMOGmE4" etiket="Konu anlatımı videosu" baslik="Zamir ve Zarf" kanal="Retro Yayıncılık"}

::video{id="su0P69I2T-o" etiket="Kısa tekrar videosu" baslik="Zamir ve Zarf" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Zamir$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Zamir ve Zarf'
  and position('::video{' in l.body) = 0 and position($a$## 1. Zamir$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Edat (ilgeç)$a$, $v$::video{id="zCtX9b7WcSM" etiket="Konu anlatımı videosu" baslik="Edat, Bağlaç, Ünlem" kanal="Retro Yayıncılık"}

::video{id="qUyfJCIEGWk" etiket="Kısa tekrar videosu" baslik="Edat, Bağlaç, Ünlem" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Edat (ilgeç)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Edat, Bağlaç, Ünlem'
  and position('::video{' in l.body) = 0 and position($a$## 1. Edat (ilgeç)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Fiilin anlam özellikleri$a$, $v$::video{id="rsoA3ggjhkU" etiket="Konu anlatımı videosu" baslik="Fiiller ve Ek Fiil" kanal="Retro Yayıncılık"}

::video{id="AmB9htRAx5o" etiket="Kısa tekrar videosu" baslik="Fiiller ve Ek Fiil" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Fiilin anlam özellikleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiiller ve Ek Fiil'
  and position('::video{' in l.body) = 0 and position($a$## 1. Fiilin anlam özellikleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Fiilimsi nedir?$a$, $v$::video{id="nHs5720AusQ" etiket="Konu anlatımı videosu" baslik="Fiilimsiler" kanal="Retro Yayıncılık"}

::video{id="Z1n5xzwHjz0" etiket="Kısa tekrar videosu" baslik="Fiilimsiler" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Fiilimsi nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiilimsiler'
  and position('::video{' in l.body) = 0 and position($a$## 1. Fiilimsi nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Özneye göre fiil çatısı$a$, $v$::video{id="0Cv4tVbwMVg" etiket="Konu anlatımı videosu" baslik="Fiil Çatısı" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Özneye göre fiil çatısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiil Çatısı'
  and position('::video{' in l.body) = 0 and position($a$## 1. Özneye göre fiil çatısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yüklem$a$, $v$::video{id="XBpjVOMMFj8" etiket="Konu anlatımı videosu" baslik="Cümlenin Ögeleri" kanal="Retro Yayıncılık"}

::video{id="pPMcIpwyvZQ" etiket="Kısa tekrar videosu" baslik="Cümlenin Ögeleri" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Yüklem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümlenin Ögeleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Yüklem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yapılarına göre cümleler$a$, $v$::video{id="lpoaJ8wcLr8" etiket="Konu anlatımı videosu" baslik="Cümle Türleri" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Yapılarına göre cümleler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümle Türleri'
  and position('::video{' in l.body) = 0 and position($a$## 1. Yapılarına göre cümleler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Anlamsal anlatım bozuklukları$a$, $v$::video{id="Lxa2hIvGYCI" etiket="Konu anlatımı videosu" baslik="Anlatım Bozuklukları" kanal="Retro Yayıncılık"}$v$ || chr(10) || chr(10) || $a$## 1. Anlamsal anlatım bozuklukları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Anlatım Bozuklukları'
  and position('::video{' in l.body) = 0 and position($a$## 1. Anlamsal anlatım bozuklukları$a$ in l.body) > 0;
