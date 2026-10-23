-- YDT İngilizce konularına videolar ekler

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de edat soruları nasıl çıkıyor$a$, $v$::video{id="rzONdvoagYw" etiket="Konu anlatımı videosu" baslik="Prepositions" kanal="K4 English"}

::video{id="WIeGEHJ_jdU" etiket="Soru çözümü videosu" baslik="Prepositions" kanal="Efedil"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de edat soruları nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Prepositions'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de edat soruları nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de bağlaç soruları nasıl çıkıyor$a$, $v$::video{id="E9sATn1wmb4" etiket="Konu anlatımı videosu" baslik="Conjunctions ve Linkers" kanal="Ozan Hoca"}

::video{id="nFONMcdrWcI" etiket="Soru çözümü videosu" baslik="Conjunctions ve Linkers" kanal="K4 English"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de bağlaç soruları nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Conjunctions ve Linkers'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de bağlaç soruları nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de modal nasıl çıkıyor$a$, $v$::video{id="FhBJ6OGQnIc" etiket="Konu anlatımı videosu" baslik="Modals" kanal="Full up English"}

::video{id="ZdIyBlyicQI" etiket="Geçmiş modaller videosu" baslik="Modals" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de modal nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Modals'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de modal nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de edilgen nasıl çıkıyor$a$, $v$::video{id="7fniBwFdJpM" etiket="Konu anlatımı videosu" baslik="Passive Voice" kanal="Ozan Hoca"}

::video{id="phthyjPY7qw" etiket="Kısa tekrar videosu" baslik="Passive Voice" kanal="Full up English"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de edilgen nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Passive Voice'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de edilgen nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de gerund ve infinitive nasıl çıkıyor$a$, $v$::video{id="dIuPUwOe9fk" etiket="Konu anlatımı videosu" baslik="Gerunds ve Infinitives" kanal="Full up English"}

::video{id="fY9zGe94hK4" etiket="Kısa tekrar videosu" baslik="Gerunds ve Infinitives" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de gerund ve infinitive nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Gerunds ve Infinitives'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de gerund ve infinitive nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de participle nasıl çıkıyor$a$, $v$::video{id="UZ8o50aryXk" etiket="Konu anlatımı videosu" baslik="Participles" kanal="Ozan Hoca"}

::video{id="8G2kKRqsMuQ" etiket="Kısa tekrar videosu" baslik="Participles" kanal="Oxford English Now"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de participle nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Participles'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de participle nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de sıfat nasıl çıkıyor$a$, $v$::video{id="BNwdTu_QUNQ" etiket="Konu anlatımı videosu" baslik="Adjectives" kanal="Full up English"}

::video{id="ml6Q3KVxGnk" etiket="Kısa tekrar videosu" baslik="Adjectives" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de sıfat nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Adjectives'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de sıfat nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de zarf nasıl çıkıyor$a$, $v$::video{id="GygQ5YqGzZU" etiket="Konu anlatımı videosu" baslik="Adverbs" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}

::video{id="jXtHCBgbks0" etiket="Kısa tekrar videosu" baslik="Adverbs" kanal="Oxford Online English"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de zarf nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Adverbs'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de zarf nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de sıfat cümleciği nasıl çıkıyor$a$, $v$::video{id="9VxwX8mjeRg" etiket="Konu anlatımı videosu" baslik="Relative Clauses" kanal="Full up English"}

::video{id="R26w2d6ftwA" etiket="Soru çözümü videosu" baslik="Relative Clauses" kanal="The Master of English Exams"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de sıfat cümleciği nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Relative Clauses'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de sıfat cümleciği nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de isim cümleciği nasıl çıkıyor$a$, $v$::video{id="zUq7nxmQXKU" etiket="Konu anlatımı videosu" baslik="Noun Clauses" kanal="Full up English"}

::video{id="JPn19ZDOgRw" etiket="Kısa tekrar videosu" baslik="Noun Clauses" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de isim cümleciği nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Noun Clauses'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de isim cümleciği nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de koşul cümleleri nasıl çıkıyor$a$, $v$::video{id="1YxOQzhet5Y" etiket="Konu anlatımı videosu" baslik="Conditionals" kanal="Ms. Jasmin ELT"}

::video{id="qE7pqSVh5mQ" etiket="Kısa tekrar videosu" baslik="Conditionals" kanal="Full up English"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de koşul cümleleri nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Conditionals'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de koşul cümleleri nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de wish yapıları nasıl çıkıyor$a$, $v$::video{id="I9tlfeKIlJw" etiket="Konu anlatımı videosu" baslik="Wish Clauses" kanal="Ms. Jasmin ELT"}

::video{id="p41Ns9MbsVs" etiket="Kısa tekrar videosu" baslik="Wish Clauses" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de wish yapıları nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Wish Clauses'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de wish yapıları nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de belirleyici ve nicelik sorusu nasıl çıkıyor$a$, $v$::video{id="pxtmrmcgu4Q" etiket="Konu anlatımı videosu" baslik="Determiners ve Quantifiers" kanal="Maksimum İngilizce"}

::video{id="xXMYMX5iyvk" etiket="Kısa tekrar videosu" baslik="Determiners ve Quantifiers" kanal="İngilizce Konu Anlatımı - Özer Kiraz"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de belirleyici ve nicelik sorusu nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Determiners ve Quantifiers'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de belirleyici ve nicelik sorusu nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de zamirler nasıl çıkıyor$a$, $v$::video{id="dECVuiPnEWg" etiket="Konu anlatımı videosu" baslik="Pronouns" kanal="Benim Hocam"}

::video{id="T-EKNDl48yI" etiket="Kısa tekrar videosu" baslik="Pronouns" kanal="Selahattin Hoca - İngilizce"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de zamirler nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Pronouns'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de zamirler nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’de ikili kalıplar nasıl çıkıyor$a$, $v$::video{id="VNdsgh-H2Y8" etiket="Konu anlatımı videosu" baslik="Comparison ve Correlatives" kanal="tonguç AKADEMİ"}

::video{id="XYYUXskbX_c" etiket="Kısa tekrar videosu" baslik="Comparison ve Correlatives" kanal="ENGLISH with James · engVid"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’de ikili kalıplar nasıl çıkıyor$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Comparison ve Correlatives'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’de ikili kalıplar nasıl çıkıyor$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. YDT’nin yapısı: 80 soru$a$, $v$::video{id="vdn-efWzt-Q" etiket="Çalışma yöntemi videosu" baslik="Kelime Bilgisi" kanal="FikirHastası"}

::video{id="dOEwN6Kw1mk" etiket="Sık çıkan kelimeler videosu" baslik="Kelime Bilgisi" kanal="Learn English With Me"}$v$ || chr(10) || chr(10) || $a$## 1. YDT’nin yapısı: 80 soru$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Kelime Bilgisi'
  and position('::video{' in l.body) = 0 and position($a$## 1. YDT’nin yapısı: 80 soru$a$ in l.body) > 0;
