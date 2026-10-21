-- Konu anlatımlarına doğrulanmış YouTube videoları. Metne dokunmaz, video zaten varsa atlar.
update public.lessons l
set body = replace(l.body, $a$## 1. Dünya’nın iki hareketi$a$, $v$::video{id="alcKj5-UDoM" etiket="Konu anlatımı videosu" baslik="Mevsimler ve İklim" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Dünya’nın iki hareketi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim'
  and position('::video{id="alcKj5-UDoM"' in l.body) = 0 and position($a$## 1. Dünya’nın iki hareketi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. DNA nedir?$a$, $v$::video{id="hjAQYYsZT50" etiket="Konu anlatımı videosu" baslik="DNA ve Genetik Kod" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. DNA nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod'
  and position('::video{id="hjAQYYsZT50"' in l.body) = 0 and position($a$## 1. DNA nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Periyodik sistem$a$, $v$::video{id="8RFW5spP8sY" etiket="Konu anlatımı videosu" baslik="Periyodik Sistem ve Kimyasal Tepkimeler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Periyodik sistem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Madde ve Endüstri'
  and position('::video{id="8RFW5spP8sY"' in l.body) = 0 and position($a$## 1. Periyodik sistem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Asitler ve bazlar$a$, $v$::video{id="rEJbvWonpOY" etiket="Konu anlatımı videosu" baslik="Asitler ve Bazlar" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 4. Asitler ve bazlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Madde ve Endüstri'
  and position('::video{id="rEJbvWonpOY"' in l.body) = 0 and position($a$## 4. Asitler ve bazlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İş ve basit makineler$a$, $v$::video{id="MjXAoVA0YI8" etiket="Konu anlatımı videosu" baslik="Basit Makineler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. İş ve basit makineler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler'
  and position('::video{id="MjXAoVA0YI8"' in l.body) = 0 and position($a$## 1. İş ve basit makineler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Enerji dönüşümleri$a$, $v$::video{id="8bjvA5ftASA" etiket="Konu anlatımı videosu" baslik="Enerji Dönüşümleri ve Çevre Bilimi" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Enerji dönüşümleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi'
  and position('::video{id="8bjvA5ftASA"' in l.body) = 0 and position($a$## 1. Enerji dönüşümleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Elektrik yükleri$a$, $v$::video{id="SgOvZMl1v3U" etiket="Konu anlatımı videosu" baslik="Elektrik Yükleri ve Elektrik Enerjisi" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Elektrik yükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Elektrik Yükleri ve Elektrik Enerjisi'
  and position('::video{id="SgOvZMl1v3U"' in l.body) = 0 and position($a$## 1. Elektrik yükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Basınç nedir?$a$, $v$::video{id="ngE_L9p1a1A" etiket="Konu anlatımı videosu" baslik="Basınç" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Basınç nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basınç'
  and position('::video{id="ngE_L9p1a1A"' in l.body) = 0 and position($a$## 1. Basınç nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Asal sayılar ve asal çarpanlara ayırma$a$, $v$::video{id="Hs7lwgDJksQ" etiket="Konu anlatımı videosu" baslik="Çarpanlar ve Katlar" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Asal sayılar ve asal çarpanlara ayırma$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Çarpanlar ve Katlar'
  and position('::video{id="Hs7lwgDJksQ"' in l.body) = 0 and position($a$## 1. Asal sayılar ve asal çarpanlara ayırma$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Üslü ifade nedir?$a$, $v$::video{id="xw8Q5DkrvV0" etiket="Konu anlatımı videosu" baslik="Üslü İfadeler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Üslü ifade nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Üslü İfadeler'
  and position('::video{id="xw8Q5DkrvV0"' in l.body) = 0 and position($a$## 1. Üslü ifade nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Tam kare sayılar ve karekök$a$, $v$::video{id="JchTFYRbyCM" etiket="Konu anlatımı videosu" baslik="Kareköklü İfadeler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Tam kare sayılar ve karekök$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Kareköklü İfadeler'
  and position('::video{id="JchTFYRbyCM"' in l.body) = 0 and position($a$## 1. Tam kare sayılar ve karekök$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Veri nedir, nasıl gösterilir?$a$, $v$::video{id="MxoRVK5ScV0" etiket="Konu anlatımı videosu" baslik="Veri Analizi" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Veri nedir, nasıl gösterilir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Veri Analizi'
  and position('::video{id="MxoRVK5ScV0"' in l.body) = 0 and position($a$## 1. Veri nedir, nasıl gösterilir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Temel kavramlar$a$, $v$::video{id="w1ORZBJ38X8" etiket="Konu anlatımı videosu" baslik="Basit Olayların Olma Olasılığı" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Temel kavramlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Basit Olayların Olma Olasılığı'
  and position('::video{id="w1ORZBJ38X8"' in l.body) = 0 and position($a$## 1. Temel kavramlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Cebirsel ifadeler$a$, $v$::video{id="DKbbEKe8D_g" etiket="Konu anlatımı videosu" baslik="Cebirsel İfadeler ve Özdeşlikler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Cebirsel ifadeler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Cebirsel İfadeler ve Özdeşlikler'
  and position('::video{id="DKbbEKe8D_g"' in l.body) = 0 and position($a$## 1. Cebirsel ifadeler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Koordinat sistemi$a$, $v$::video{id="d8wrn4nVhEY" etiket="Konu anlatımı videosu" baslik="Doğrusal Denklemler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Koordinat sistemi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Doğrusal Denklemler'
  and position('::video{id="d8wrn4nVhEY"' in l.body) = 0 and position($a$## 1. Koordinat sistemi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Eşitsizlik sembolleri$a$, $v$::video{id="DbAkYhtk8XM" etiket="Konu anlatımı videosu" baslik="Eşitsizlikler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Eşitsizlik sembolleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Eşitsizlikler'
  and position('::video{id="DbAkYhtk8XM"' in l.body) = 0 and position($a$## 1. Eşitsizlik sembolleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Üçgenin açıları$a$, $v$::video{id="GOs0S73mNmk" etiket="Konu anlatımı videosu" baslik="Üçgen Eşitsizliği ve Açı Kenar Bağlantısı" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Üçgenin açıları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Üçgenler'
  and position('::video{id="GOs0S73mNmk"' in l.body) = 0 and position($a$## 1. Üçgenin açıları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Pisagor bağıntısı$a$, $v$::video{id="IFKbDS1TGLU" etiket="Konu anlatımı videosu" baslik="Pisagor Bağıntısı" kanal="Partikül Matematik"}$v$ || chr(10) || chr(10) || $a$## 4. Pisagor bağıntısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Üçgenler'
  and position('::video{id="IFKbDS1TGLU"' in l.body) = 0 and position($a$## 4. Pisagor bağıntısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Eşlik$a$, $v$::video{id="WHDDVmHJcs4" etiket="Konu anlatımı videosu" baslik="Üçgende Eşlik ve Benzerlik" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Eşlik$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Eşlik ve Benzerlik'
  and position('::video{id="WHDDVmHJcs4"' in l.body) = 0 and position($a$## 1. Eşlik$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Öteleme$a$, $v$::video{id="pFjwzfwbSQI" etiket="Konu anlatımı videosu" baslik="Dönüşüm Geometrisi" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Öteleme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Dönüşüm Geometrisi'
  and position('::video{id="pFjwzfwbSQI"' in l.body) = 0 and position($a$## 1. Öteleme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dik prizma$a$, $v$::video{id="kIOTM0Pbd_U" etiket="Konu anlatımı videosu" baslik="Geometrik Cisimler" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Dik prizma$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Geometrik Cisimler'
  and position('::video{id="kIOTM0Pbd_U"' in l.body) = 0 and position($a$## 1. Dik prizma$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Gerçek, yan, mecaz ve terim anlam$a$, $v$::video{id="2Ot5cca0oYQ" etiket="Konu anlatımı videosu" baslik="Sözcükte Anlam" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Gerçek, yan, mecaz ve terim anlam$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam'
  and position('::video{id="2Ot5cca0oYQ"' in l.body) = 0 and position($a$## 1. Gerçek, yan, mecaz ve terim anlam$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Deyim$a$, $v$::video{id="sf1jZkjCr10" etiket="Konu anlatımı videosu" baslik="Deyimler ve Atasözleri" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Deyim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Deyimler ve Atasözleri'
  and position('::video{id="sf1jZkjCr10"' in l.body) = 0 and position($a$## 1. Deyim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Neden-sonuç cümleleri$a$, $v$::video{id="nOaqVgv37us" etiket="Konu anlatımı videosu" baslik="Cümlede Anlam" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Neden-sonuç cümleleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümlede Anlam'
  and position('::video{id="nOaqVgv37us"' in l.body) = 0 and position($a$## 1. Neden-sonuç cümleleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Paragraf nedir?$a$, $v$::video{id="kUfYgs9Kzt8" etiket="Konu anlatımı videosu" baslik="Paragrafta Anlam" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Paragraf nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Paragrafta Anlam'
  and position('::video{id="kUfYgs9Kzt8"' in l.body) = 0 and position($a$## 1. Paragraf nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Öyküleyici metinler$a$, $v$::video{id="BE8mJitN-bU" etiket="Konu anlatımı videosu" baslik="Metin Türleri" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Öyküleyici metinler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Metin Türleri'
  and position('::video{id="BE8mJitN-bU"' in l.body) = 0 and position($a$## 1. Öyküleyici metinler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Benzetme (teşbih)$a$, $v$::video{id="5fgB6AilwF4" etiket="Konu anlatımı videosu" baslik="Söz Sanatları" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Benzetme (teşbih)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Söz Sanatları'
  and position('::video{id="5fgB6AilwF4"' in l.body) = 0 and position($a$## 1. Benzetme (teşbih)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yüklem$a$, $v$::video{id="a8PFDjLHNRk" etiket="Konu anlatımı videosu" baslik="Cümlenin Ögeleri" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Yüklem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümlenin Ögeleri'
  and position('::video{id="a8PFDjLHNRk"' in l.body) = 0 and position($a$## 1. Yüklem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Özneye göre çatı$a$, $v$::video{id="qRgr1_SdSTY" etiket="Konu anlatımı videosu" baslik="Fiilde Çatı" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Özneye göre çatı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Fiilde Çatı'
  and position('::video{id="qRgr1_SdSTY"' in l.body) = 0 and position($a$## 1. Özneye göre çatı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yapısına göre cümleler$a$, $v$::video{id="C4ScvzAwHmw" etiket="Konu anlatımı videosu" baslik="Cümle Türleri" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Yapısına göre cümleler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümle Türleri'
  and position('::video{id="C4ScvzAwHmw"' in l.body) = 0 and position($a$## 1. Yapısına göre cümleler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. “de, da” ayrı mı bitişik mi?$a$, $v$::video{id="UOWCB4Fl-vA" etiket="Konu anlatımı videosu" baslik="Yazım Kuralları" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. “de, da” ayrı mı bitişik mi?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Yazım Kuralları'
  and position('::video{id="UOWCB4Fl-vA"' in l.body) = 0 and position($a$## 1. “de, da” ayrı mı bitişik mi?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Nokta (.)$a$, $v$::video{id="idwfHskHiio" etiket="Konu anlatımı videosu" baslik="Noktalama İşaretleri" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Nokta (.)$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Noktalama İşaretleri'
  and position('::video{id="idwfHskHiio"' in l.body) = 0 and position($a$## 1. Nokta (.)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Anlama dayalı anlatım bozuklukları$a$, $v$::video{id="EnWt05-pTTc" etiket="Konu anlatımı videosu" baslik="Anlatım Bozuklukları" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Anlama dayalı anlatım bozuklukları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Anlatım Bozuklukları'
  and position('::video{id="EnWt05-pTTc"' in l.body) = 0 and position($a$## 1. Anlama dayalı anlatım bozuklukları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Sözel mantık: sıralama$a$, $v$::video{id="L0hulsAu5mY" etiket="Konu anlatımı videosu" baslik="Sözel Mantık" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Sözel mantık: sıralama$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözel Mantık ve Görsel Okuma'
  and position('::video{id="L0hulsAu5mY"' in l.body) = 0 and position($a$## 1. Sözel mantık: sıralama$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Görsel okuma: tablo ve grafik$a$, $v$::video{id="KTkmrh1XmaU" etiket="Konu anlatımı videosu" baslik="Tablo, Grafik ve Görsel Yorumlama" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 4. Görsel okuma: tablo ve grafik$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözel Mantık ve Görsel Okuma'
  and position('::video{id="KTkmrh1XmaU"' in l.body) = 0 and position($a$## 4. Görsel okuma: tablo ve grafik$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Mondros Ateşkesi ve işgaller$a$, $v$::video{id="3g8RdBuSunU" etiket="Konu anlatımı videosu" baslik="Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Mondros Ateşkesi ve işgaller$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar'
  and position('::video{id="3g8RdBuSunU"' in l.body) = 0 and position($a$## 1. Mondros Ateşkesi ve işgaller$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Savaşın cepheleri$a$, $v$::video{id="gOXZ9JsvxlE" etiket="Konu anlatımı videosu" baslik="Milli Bir Destan: Ya İstiklal Ya Ölüm" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Savaşın cepheleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm'
  and position('::video{id="gOXZ9JsvxlE"' in l.body) = 0 and position($a$## 1. Savaşın cepheleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Atatürk ilkeleri$a$, $v$::video{id="u_qBMm2jNlo" etiket="Konu anlatımı videosu" baslik="Atatürkçülük ve Çağdaşlaşan Türkiye" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Atatürk ilkeleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye'
  and position('::video{id="u_qBMm2jNlo"' in l.body) = 0 and position($a$## 1. Atatürk ilkeleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Demokrasinin ilk adımları$a$, $v$::video{id="VuANTfE7CA0" etiket="Konu anlatımı videosu" baslik="Demokratikleşme Çabaları" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Demokrasinin ilk adımları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Demokratikleşme Çabaları'
  and position('::video{id="VuANTfE7CA0"' in l.body) = 0 and position($a$## 1. Demokrasinin ilk adımları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dış politikanın temel ilkeleri$a$, $v$::video{id="Frrwfy3dGn4" etiket="Konu anlatımı videosu" baslik="Atatürk Dönemi Türk Dış Politikası" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Dış politikanın temel ilkeleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk Dönemi Türk Dış Politikası'
  and position('::video{id="Frrwfy3dGn4"' in l.body) = 0 and position($a$## 1. Dış politikanın temel ilkeleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Atatürk’ün hastalığı ve ölümü$a$, $v$::video{id="1ZiQRvuGSW8" etiket="Konu anlatımı videosu" baslik="Atatürk'ün Ölümü ve Sonrası" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Atatürk’ün hastalığı ve ölümü$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk''ün Ölümü ve Sonrası'
  and position('::video{id="1ZiQRvuGSW8"' in l.body) = 0 and position($a$## 1. Atatürk’ün hastalığı ve ölümü$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kader ve kaza nedir?$a$, $v$::video{id="qnwC5_tNHRY" etiket="Konu anlatımı videosu" baslik="Kader İnancı" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Kader ve kaza nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kader İnancı'
  and position('::video{id="qnwC5_tNHRY"' in l.body) = 0 and position($a$## 1. Kader ve kaza nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Zekât nedir?$a$, $v$::video{id="bgC6WbQoHS0" etiket="Konu anlatımı videosu" baslik="Zekât ve Sadaka" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Zekât nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Zekât ve Sadaka'
  and position('::video{id="bgC6WbQoHS0"' in l.body) = 0 and position($a$## 1. Zekât nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Din nedir, insana ne kazandırır?$a$, $v$::video{id="4igA04ju7Hk" etiket="Konu anlatımı videosu" baslik="Din ve Hayat" kanal="Cebrail Hocam"}$v$ || chr(10) || chr(10) || $a$## 1. Din nedir, insana ne kazandırır?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat'
  and position('::video{id="4igA04ju7Hk"' in l.body) = 0 and position($a$## 1. Din nedir, insana ne kazandırır?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Hz. Muhammed’in hayatından kesitler$a$, $v$::video{id="jSuznEeGQAE" etiket="Konu anlatımı videosu" baslik="Hz. Muhammed'in Örnekliği" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Hz. Muhammed’in hayatından kesitler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Hz. Muhammed''in Örnekliği'
  and position('::video{id="jSuznEeGQAE"' in l.body) = 0 and position($a$## 1. Hz. Muhammed’in hayatından kesitler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Vahiy ve Kur’an$a$, $v$::video{id="DCYmaxdQq1w" etiket="Konu anlatımı videosu" baslik="Kur'an-ı Kerim ve Özellikleri" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Vahiy ve Kur’an$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kur''an-ı Kerim ve Özellikleri'
  and position('::video{id="DCYmaxdQq1w"' in l.body) = 0 and position($a$## 1. Vahiy ve Kur’an$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Arkadaşlık sözcükleri$a$, $v$::video{id="mv_hIOaScSI" etiket="Konu anlatımı videosu" baslik="Friendship" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Arkadaşlık sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Friendship'
  and position('::video{id="mv_hIOaScSI"' in l.body) = 0 and position($a$## 1. Arkadaşlık sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Genç hayatı sözcükleri$a$, $v$::video{id="tW8ZaZzQdYY" etiket="Konu anlatımı videosu" baslik="Teen Life" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Genç hayatı sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life'
  and position('::video{id="tW8ZaZzQdYY"' in l.body) = 0 and position($a$## 1. Genç hayatı sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Mutfak sözcükleri$a$, $v$::video{id="NJOfeBoEbjA" etiket="Konu anlatımı videosu" baslik="In the Kitchen" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Mutfak sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'In the Kitchen'
  and position('::video{id="NJOfeBoEbjA"' in l.body) = 0 and position($a$## 1. Mutfak sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Telefon sözcükleri$a$, $v$::video{id="R6L2q0CWpVU" etiket="Konu anlatımı videosu" baslik="On the Phone" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Telefon sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone'
  and position('::video{id="R6L2q0CWpVU"' in l.body) = 0 and position($a$## 1. Telefon sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İnternet sözcükleri$a$, $v$::video{id="fC2x-PKfLIU" etiket="Konu anlatımı videosu" baslik="The Internet" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. İnternet sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet'
  and position('::video{id="fC2x-PKfLIU"' in l.body) = 0 and position($a$## 1. İnternet sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Macera sözcükleri$a$, $v$::video{id="SM7qKb0FOgs" etiket="Konu anlatımı videosu" baslik="Adventures" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Macera sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Adventures'
  and position('::video{id="SM7qKb0FOgs"' in l.body) = 0 and position($a$## 1. Macera sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Turizm sözcükleri$a$, $v$::video{id="q5vsO2uso0s" etiket="Konu anlatımı videosu" baslik="Tourism" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Turizm sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Tourism'
  and position('::video{id="q5vsO2uso0s"' in l.body) = 0 and position($a$## 1. Turizm sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ev işleri sözcükleri$a$, $v$::video{id="qzrggBPkJv0" etiket="Konu anlatımı videosu" baslik="Chores" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Ev işleri sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Chores'
  and position('::video{id="qzrggBPkJv0"' in l.body) = 0 and position($a$## 1. Ev işleri sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bilim sözcükleri$a$, $v$::video{id="YVIIt6CxpT0" etiket="Konu anlatımı videosu" baslik="Science" kanal="Hız Yayınları Ortaokul"}$v$ || chr(10) || chr(10) || $a$## 1. Bilim sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Science'
  and position('::video{id="YVIIt6CxpT0"' in l.body) = 0 and position($a$## 1. Bilim sözcükleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Doğal afet sözcükleri$a$, $v$::video{id="q6ReZZ5e2ls" etiket="Konu anlatımı videosu" baslik="Natural Forces" kanal="Tonguç 8. Sınıf"}$v$ || chr(10) || chr(10) || $a$## 1. Doğal afet sözcükleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Natural Forces'
  and position('::video{id="q6ReZZ5e2ls"' in l.body) = 0 and position($a$## 1. Doğal afet sözcükleri$a$ in l.body) > 0;
