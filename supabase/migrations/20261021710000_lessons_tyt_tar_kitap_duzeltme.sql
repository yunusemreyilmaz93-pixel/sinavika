-- TYT Tarih: MEB ders kitaplarıyla uyum (takvim, Hz. Muhammed 571, Asya Hun MÖ 220, Gazneliler 1187, II. Kılıç Arslan 1156, Kafkas Cephesi)

update public.lessons l
set body = replace(replace(l.body, $a$- **Güneş takvimi:** Dünya’nın Güneş etrafındaki dönüşüne dayanır. Miladi takvim bu türdendir.$a$, $b$- **Güneş takvimi:** Dünya’nın Güneş etrafındaki dönüşüne dayanır. Miladi takvim bu türdendir. İlk güneş takvimini Eski Mısırlılar kullanmıştır. Roma İmparatoru Julius Caesar zamanında bu takvim yeniden düzenlenmiş (Jülyen), 1582’de Papa XIII. Gregorius’un değişiklikleriyle bugünkü Gregoryen takvim oluşmuştur.$b$), $a$- **Ay takvimi:** Ay’ın Dünya etrafındaki dönüşüne dayanır.$a$, $b$- **Ay takvimi:** Ay’ın Dünya etrafındaki dönüşüne dayanır. İlk ay takvimini Sümerler hazırlamıştır, bir yıl 12 ay ve 354 gündür.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Tarih ve Zaman'
  and position($a$- **Güneş takvimi:** Dünya’nın Güneş etrafındaki dönüşüne dayanır. Miladi takvim bu türdendir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Mezolitik (Orta Taş) | İklim ısındı, küçük av hayvanları, ilk köpek evcilleştirme |$a$, $b$| Mezolitik (Orta Taş) | İklim ısındı, küçük av hayvanları, küçük taş aletler |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İnsanlığın İlk Dönemleri'
  and position($a$| Mezolitik (Orta Taş) | İklim ısındı, küçük av hayvanları, ilk köpek evcilleştirme |$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$(Büyük Hun, MÖ 3. yüzyıl)$a$, $b$(Büyük Hun, MÖ 220)$b$), $a$| İlk Türk devleti | Asya Hun, MÖ 3. yüzyıl |$a$, $b$| İlk Türk devleti | Asya Hun, MÖ 220 |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk ve Orta Çağlarda Türk Dünyası'
  and position($a$(Büyük Hun, MÖ 3. yüzyıl)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Doğum | yaklaşık 570 | Mekke |$a$, $b$| Doğum | 571 | Mekke |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İslam Medeniyetinin Doğuşu'
  and position($a$| Doğum | yaklaşık 570 | Mekke |$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Gazneliler (963 ile 1186)$a$, $b$## 3. Gazneliler (963 ile 1187)$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk Türk İslam Devletleri'
  and position($a$## 3. Gazneliler (963 ile 1186)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$**II. Kılıç Arslan** (1155 ile 1192)$a$, $b$**II. Kılıç Arslan** (1156 ile 1192)$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Selçuklu Türkiyesi'
  and position($a$**II. Kılıç Arslan** (1155 ile 1192)$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Savaşın sonu$a$, $b$Kafkas Cephesi’nde Sarıkamış’tan sonra Osmanlı ordusu savunmaya geçti. Rus ordusu 1915’te Van’ı, 1916’da Erzurum’u işgal etti. Doğu Anadolu’da yaşayan Ermeniler, hükûmetin çıkardığı **Sevk ve İskân Kanunu (1915)** ile başta Suriye olmak üzere ülkenin diğer bölgelerine gönderildi. 1917’de Rusya’da Bolşevik İhtilali olunca **Erzincan Mütarekesi** (18 Aralık 1917) imzalandı ve Rus kuvvetleri çekilmeye başladı.

## 6. Savaşın sonu$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-tar' and t.name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya'
  and position($a$## 6. Savaşın sonu$a$ in l.body) > 0;
