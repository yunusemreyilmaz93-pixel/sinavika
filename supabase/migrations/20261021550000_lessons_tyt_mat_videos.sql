-- TYT Temel Matematik anlatımlarına doğrulanmış YouTube videoları (konu başına 1 ya da 2). Metne dokunmaz, video zaten varsa atlar.

update public.lessons l
set body = replace(l.body, $a$## 1. Sayı kümeleri$a$, $v$::video{id="HlljWsAUXGQ" etiket="Konu anlatımı videosu" baslik="Temel Kavramlar" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Sayı kümeleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Temel Kavramlar'
  and position('::video{id="HlljWsAUXGQ"' in l.body) = 0 and position($a$## 1. Sayı kümeleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Rakam ve basamak$a$, $v$::video{id="WFyUZRwNxNs" etiket="Konu anlatımı videosu" baslik="Sayı Basamakları" kanal="Matematiğin Güler Yüzü"}

::video{id="thDQ_GTe9Lo" etiket="Kısa tekrar videosu" baslik="Sayı Basamakları" kanal="Yaşar Hoca MathMan"}$v$ || chr(10) || chr(10) || $a$## 1. Rakam ve basamak$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Sayı Basamakları'
  and position('::video{id="WFyUZRwNxNs"' in l.body) = 0 and position($a$## 1. Rakam ve basamak$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bölme algoritması$a$, $v$::video{id="c0JedUXSbh4" etiket="Konu anlatımı videosu" baslik="Bölme ve Bölünebilme" kanal="Matematiğin Güler Yüzü"}

::video{id="tQdbhTCgb8w" etiket="Kısa tekrar videosu" baslik="Bölme ve Bölünebilme" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Bölme algoritması$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Bölme ve Bölünebilme'
  and position('::video{id="c0JedUXSbh4"' in l.body) = 0 and position($a$## 1. Bölme algoritması$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Asal çarpanlara ayırma$a$, $v$::video{id="X8lWUraeAdw" etiket="Konu anlatımı videosu" baslik="EBOB ve EKOK" kanal="Matematiğin Güler Yüzü"}

::video{id="QsfUL6VRH3A" etiket="Kısa tekrar videosu" baslik="EBOB ve EKOK" kanal="Yaşar Hoca MathMan"}$v$ || chr(10) || chr(10) || $a$## 1. Asal çarpanlara ayırma$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'EBOB ve EKOK'
  and position('::video{id="X8lWUraeAdw"' in l.body) = 0 and position($a$## 1. Asal çarpanlara ayırma$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Kesir türleri$a$, $v$::video{id="-hXTpWAs7lk" etiket="Konu anlatımı videosu" baslik="Rasyonel Sayılar" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Kesir türleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Rasyonel Sayılar'
  and position('::video{id="-hXTpWAs7lk"' in l.body) = 0 and position($a$## 1. Kesir türleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Eşitsizlik, sayı doğrusu ve aralıklar$a$, $v$::video{id="G2Hh92Fetg0" etiket="Konu anlatımı videosu" baslik="Basit Eşitsizlikler" kanal="Matematiğin Güler Yüzü"}

::video{id="vLLaEH3rFY8" etiket="Kısa tekrar videosu" baslik="Basit Eşitsizlikler" kanal="Yaşar Hoca MathMan"}$v$ || chr(10) || chr(10) || $a$## 1. Eşitsizlik, sayı doğrusu ve aralıklar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Basit Eşitsizlikler'
  and position('::video{id="G2Hh92Fetg0"' in l.body) = 0 and position($a$## 1. Eşitsizlik, sayı doğrusu ve aralıklar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Tanım$a$, $v$::video{id="ot72L320gtU" etiket="Konu anlatımı videosu" baslik="Mutlak Değer" kanal="Matematiğin Güler Yüzü"}

::video{id="gv_KGtJM7yo" etiket="Kısa tekrar videosu" baslik="Mutlak Değer" kanal="Yaşar Hoca MathMan"}$v$ || chr(10) || chr(10) || $a$## 1. Tanım$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Mutlak Değer'
  and position('::video{id="ot72L320gtU"' in l.body) = 0 and position($a$## 1. Tanım$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Tanım ve temel kurallar$a$, $v$::video{id="_uavrNZLkB4" etiket="Konu anlatımı videosu" baslik="Üslü Sayılar" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Tanım ve temel kurallar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Üslü Sayılar'
  and position('::video{id="_uavrNZLkB4"' in l.body) = 0 and position($a$## 1. Tanım ve temel kurallar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Karekök$a$, $v$::video{id="tKE8SDILRNA" etiket="Konu anlatımı videosu" baslik="Köklü Sayılar" kanal="Matematiğin Güler Yüzü"}

::video{id="zBZcJNRYCq0" etiket="Kısa tekrar videosu" baslik="Köklü Sayılar" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Karekök$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Köklü Sayılar'
  and position('::video{id="tKE8SDILRNA"' in l.body) = 0 and position($a$## 1. Karekök$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Ortak çarpan ve gruplama$a$, $v$::video{id="UnqyDuoAm2A" etiket="Konu anlatımı videosu" baslik="Çarpanlara Ayırma" kanal="Yaşar Hoca MathMan"}

::video{id="du-HlXqsvAk" etiket="Kısa tekrar videosu" baslik="Çarpanlara Ayırma" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Ortak çarpan ve gruplama$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Çarpanlara Ayırma'
  and position('::video{id="UnqyDuoAm2A"' in l.body) = 0 and position($a$## 1. Ortak çarpan ve gruplama$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Oran$a$, $v$::video{id="nm6Hs0idx5E" etiket="Konu anlatımı videosu" baslik="Oran ve Orantı" kanal="3D Yayınları"}

::video{id="zeBrJfMGbPk" etiket="Kısa tekrar videosu" baslik="Oran ve Orantı" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Oran$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Oran ve Orantı'
  and position('::video{id="nm6Hs0idx5E"' in l.body) = 0 and position($a$## 1. Oran$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Birinci dereceden denklem$a$, $v$::video{id="wOyFp5DuLHM" etiket="Konu anlatımı videosu" baslik="Denklem Çözme" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Birinci dereceden denklem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Denklem Çözme'
  and position('::video{id="wOyFp5DuLHM"' in l.body) = 0 and position($a$## 1. Birinci dereceden denklem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Cümleden ifadeye$a$, $v$::video{id="xhtYyrmyY1U" etiket="Konu anlatımı videosu" baslik="Sayı ve Kesir Problemleri" kanal="SML Matematik"}

::video{id="wXe2cGBzLwQ" etiket="Kısa tekrar videosu" baslik="Sayı ve Kesir Problemleri" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Cümleden ifadeye$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Sayı ve Kesir Problemleri'
  and position('::video{id="xhtYyrmyY1U"' in l.body) = 0 and position($a$## 1. Cümleden ifadeye$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Zaman geçince yaşlar$a$, $v$::video{id="X5b8L-TrMTI" etiket="Konu anlatımı videosu" baslik="Yaş Problemleri" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Zaman geçince yaşlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Yaş Problemleri'
  and position('::video{id="X5b8L-TrMTI"' in l.body) = 0 and position($a$## 1. Zaman geçince yaşlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Temel bağıntı$a$, $v$::video{id="BVzBODvrmj4" etiket="Konu anlatımı videosu" baslik="Hareket Problemleri" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Temel bağıntı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Hareket Problemleri'
  and position('::video{id="BVzBODvrmj4"' in l.body) = 0 and position($a$## 1. Temel bağıntı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Bir günlük iş$a$, $v$::video{id="8H42JcUu8xA" etiket="Konu anlatımı videosu" baslik="İşçi ve Havuz Problemleri" kanal="tonguç AKADEMİ"}

::video{id="SyQzKS7jWZc" etiket="Kısa tekrar videosu" baslik="İşçi ve Havuz Problemleri" kanal="Rehber Matematik"}$v$ || chr(10) || chr(10) || $a$## 1. Bir günlük iş$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'İşçi ve Havuz Problemleri'
  and position('::video{id="8H42JcUu8xA"' in l.body) = 0 and position($a$## 1. Bir günlük iş$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Yüzde$a$, $v$::video{id="8m3VuHRAegI" etiket="Konu anlatımı videosu" baslik="Yüzde, Kâr ve Zarar Problemleri" kanal="3D Yayınları"}

::video{id="ujQuSIuihPc" etiket="Kısa tekrar videosu" baslik="Yüzde, Kâr ve Zarar Problemleri" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Yüzde$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Yüzde, Kâr ve Zarar Problemleri'
  and position('::video{id="8m3VuHRAegI"' in l.body) = 0 and position($a$## 1. Yüzde$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Çözelti ve yüzde$a$, $v$::video{id="UpRLGx6c5Ds" etiket="Konu anlatımı videosu" baslik="Karışım Problemleri" kanal="tonguç AKADEMİ"}

::video{id="31GhF91dkNQ" etiket="Kısa tekrar videosu" baslik="Karışım Problemleri" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Çözelti ve yüzde$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Karışım Problemleri'
  and position('::video{id="UpRLGx6c5Ds"' in l.body) = 0 and position($a$## 1. Çözelti ve yüzde$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Sütun grafiği$a$, $v$::video{id="AySB5QFJPBY" etiket="Konu anlatımı videosu" baslik="Grafik Problemleri" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Sütun grafiği$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Grafik Problemleri'
  and position('::video{id="AySB5QFJPBY"' in l.body) = 0 and position($a$## 1. Sütun grafiği$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Küme ve gösterimi$a$, $v$::video{id="cpLNoF2xwXQ" etiket="Konu anlatımı videosu" baslik="Kümeler" kanal="3D Yayınları"}

::video{id="6APiwaAXaqU" etiket="Kısa tekrar videosu" baslik="Kümeler" kanal="Rehber Matematik"}$v$ || chr(10) || chr(10) || $a$## 1. Küme ve gösterimi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Kümeler'
  and position('::video{id="cpLNoF2xwXQ"' in l.body) = 0 and position($a$## 1. Küme ve gösterimi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Önerme$a$, $v$::video{id="xbQlMzBGPVI" etiket="Konu anlatımı videosu" baslik="Mantık" kanal="Matematiğin Güler Yüzü"}

::video{id="xmgBYWPObhw" etiket="Kısa tekrar videosu" baslik="Mantık" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Önerme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Mantık'
  and position('::video{id="xbQlMzBGPVI"' in l.body) = 0 and position($a$## 1. Önerme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Fonksiyon nedir?$a$, $v$::video{id="JbrN_XwUYqQ" etiket="Konu anlatımı videosu" baslik="Fonksiyonlar" kanal="3D Yayınları"}

::video{id="UQKcerFS8X4" etiket="Kısa tekrar videosu" baslik="Fonksiyonlar" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Fonksiyon nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Fonksiyonlar'
  and position('::video{id="JbrN_XwUYqQ"' in l.body) = 0 and position($a$## 1. Fonksiyon nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Polinom nedir?$a$, $v$::video{id="Po09E7MDf-w" etiket="Konu anlatımı videosu" baslik="Polinomlar" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Polinom nedir?$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Polinomlar'
  and position('::video{id="Po09E7MDf-w"' in l.body) = 0 and position($a$## 1. Polinom nedir?$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Genel biçim ve çözüm yolları$a$, $v$::video{id="1HECEGNo0Ns" etiket="Konu anlatımı videosu" baslik="İkinci Dereceden Denklemler" kanal="MathBurger"}

::video{id="pCdaLIJl0Ik" etiket="Kısa tekrar videosu" baslik="İkinci Dereceden Denklemler" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Genel biçim ve çözüm yolları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'İkinci Dereceden Denklemler'
  and position('::video{id="1HECEGNo0Ns"' in l.body) = 0 and position($a$## 1. Genel biçim ve çözüm yolları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Sayma kuralları$a$, $v$::video{id="7wpEXdt1gqk" etiket="Konu anlatımı videosu" baslik="Permütasyon ve Kombinasyon" kanal="3D Yayınları"}

::video{id="-T69l53KL9Y" etiket="Kısa tekrar videosu" baslik="Permütasyon ve Kombinasyon" kanal="Matematiğin Güler Yüzü"}$v$ || chr(10) || chr(10) || $a$## 1. Sayma kuralları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Permütasyon ve Kombinasyon'
  and position('::video{id="7wpEXdt1gqk"' in l.body) = 0 and position($a$## 1. Sayma kuralları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Temel kavramlar$a$, $v$::video{id="doQke-MNd5g" etiket="Konu anlatımı videosu" baslik="Olasılık" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Temel kavramlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Olasılık'
  and position('::video{id="doQke-MNd5g"' in l.body) = 0 and position($a$## 1. Temel kavramlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Merkezi eğilim ölçüleri$a$, $v$::video{id="_geoPbpE8Cs" etiket="Konu anlatımı videosu" baslik="Veri ve İstatistik" kanal="3D Yayınları"}$v$ || chr(10) || chr(10) || $a$## 1. Merkezi eğilim ölçüleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Veri ve İstatistik'
  and position('::video{id="_geoPbpE8Cs"' in l.body) = 0 and position($a$## 1. Merkezi eğilim ölçüleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Doğruda açılar$a$, $v$::video{id="LIjN_p6NLEo" etiket="Konu anlatımı videosu" baslik="Doğruda ve Üçgende Açılar" kanal="Hocalara Geldik"}

::video{id="JFVsBHHAjPY" etiket="Kısa tekrar videosu" baslik="Doğruda ve Üçgende Açılar" kanal="tonguç AKADEMİ"}$v$ || chr(10) || chr(10) || $a$## 1. Doğruda açılar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Doğruda ve Üçgende Açılar'
  and position('::video{id="LIjN_p6NLEo"' in l.body) = 0 and position($a$## 1. Doğruda açılar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dik üçgen ve Pisagor bağıntısı$a$, $v$::video{id="PTZ5PMLYPmQ" etiket="Konu anlatımı videosu" baslik="Özel Üçgenler" kanal="Hocalara Geldik"}$v$ || chr(10) || chr(10) || $a$## 1. Dik üçgen ve Pisagor bağıntısı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Özel Üçgenler'
  and position('::video{id="PTZ5PMLYPmQ"' in l.body) = 0 and position($a$## 1. Dik üçgen ve Pisagor bağıntısı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Açıortay$a$, $v$::video{id="Z40q-fzMQmQ" etiket="Konu anlatımı videosu" baslik="Açıortay ve Kenarortay" kanal="Matematiğin Güler Yüzü"}

::video{id="8f_CnbT7Gjo" etiket="Kısa tekrar videosu" baslik="Açıortay ve Kenarortay" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Açıortay$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Açıortay ve Kenarortay'
  and position('::video{id="Z40q-fzMQmQ"' in l.body) = 0 and position($a$## 1. Açıortay$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Taban ve yükseklikle alan$a$, $v$::video{id="Liog2snc3DQ" etiket="Konu anlatımı videosu" baslik="Üçgende Alan" kanal="Rehber Matematik"}$v$ || chr(10) || chr(10) || $a$## 1. Taban ve yükseklikle alan$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Üçgende Alan'
  and position('::video{id="Liog2snc3DQ"' in l.body) = 0 and position($a$## 1. Taban ve yükseklikle alan$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Benzer üçgenler$a$, $v$::video{id="ot5Tsx4bCMY" etiket="Konu anlatımı videosu" baslik="Üçgende Benzerlik" kanal="tonguç AKADEMİ"}

::video{id="Sv1myl6pDK0" etiket="Kısa tekrar videosu" baslik="Üçgende Benzerlik" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Benzer üçgenler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Üçgende Benzerlik'
  and position('::video{id="ot5Tsx4bCMY"' in l.body) = 0 and position($a$## 1. Benzer üçgenler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Çokgenler$a$, $v$::video{id="jHQsHOENleI" etiket="Konu anlatımı videosu" baslik="Çokgenler ve Dörtgenler" kanal="MathBurger"}

::video{id="aBu3eUqiAk8" etiket="Kısa tekrar videosu" baslik="Çokgenler ve Dörtgenler" kanal="Rehber Matematik"}$v$ || chr(10) || chr(10) || $a$## 1. Çokgenler$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Çokgenler ve Dörtgenler'
  and position('::video{id="jHQsHOENleI"' in l.body) = 0 and position($a$## 1. Çokgenler$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Çemberin elemanları$a$, $v$::video{id="kvVSuPSaZHk" etiket="Konu anlatımı videosu" baslik="Çember ve Daire" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Çemberin elemanları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Çember ve Daire'
  and position('::video{id="kvVSuPSaZHk"' in l.body) = 0 and position($a$## 1. Çemberin elemanları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. İki nokta arasındaki uzaklık ve orta nokta$a$, $v$::video{id="LpDG-ENy73Q" etiket="Konu anlatımı videosu" baslik="Analitik Geometri" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. İki nokta arasındaki uzaklık ve orta nokta$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Analitik Geometri'
  and position('::video{id="LpDG-ENy73Q"' in l.body) = 0 and position($a$## 1. İki nokta arasındaki uzaklık ve orta nokta$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Prizmalar$a$, $v$::video{id="A2H9QvXtP1E" etiket="Konu anlatımı videosu" baslik="Katı Cisimler" kanal="MathBurger"}$v$ || chr(10) || chr(10) || $a$## 1. Prizmalar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Katı Cisimler'
  and position('::video{id="A2H9QvXtP1E"' in l.body) = 0 and position($a$## 1. Prizmalar$a$ in l.body) > 0;
