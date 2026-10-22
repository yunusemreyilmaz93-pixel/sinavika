-- TYT Türkçe konularındaki yazım ve noktalama ayrıntılarını düzeltir

update public.lessons l
set body = replace(l.body, $a$- **Ay ve gün adları:** mayıs ayında, pazartesi günü$a$, $b$- **Ay ve gün adları** belli bir tarih bildirmiyorsa: mayıs ayında, pazartesi günü. Belli bir tarih bildirirken büyük harfle başlar: 15 Mayıs 1919, 23 Nisan Ulusal Egemenlik ve Çocuk Bayramı$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Yazım Kuralları'
  and position($a$- **Ay ve gün adları:** mayıs ayında, pazartesi günü$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Tarihlerde ay ile gün/yıl arasında | 10 Kasım 1938, Perşembe |$a$, $b$| Tarihten sonra gelen gün adından önce | 10 Kasım 1938, Perşembe |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Noktalama İşaretleri'
  and position($a$| Tarihlerde ay ile gün/yıl arasında | 10 Kasım 1938, Perşembe |$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Soru sıfatı | Hangi, kaç, ne? | **Hangi** yol? **Kaç** kitap? **Ne** zaman? |$a$, $b$| Soru sıfatı | Hangi, kaç, ne? | **Hangi** yol? **Kaç** kitap? **Ne** iş yapıyorsun? |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tr' and t.name = 'İsim ve Sıfat'
  and position($a$| Soru sıfatı | Hangi, kaç, ne? | **Hangi** yol? **Kaç** kitap? **Ne** zaman? |$a$ in l.body) > 0;
