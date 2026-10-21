-- Konu anlatımlarına özgün şemalar (public/lessons altındaki SVG dosyaları). Metne dokunmaz, görsel zaten varsa atlar.
update public.lessons l
set body = replace(l.body, $a$## 2. Fiziksel ve kimyasal değişim$a$, $v$![İlk 20 elementin periyodik sistemdeki yeri, metal, yarı metal, ametal ve soygaz renkleriyle](/lessons/madde-ve-endustri/periyodik-sistem.svg "İlk 20 element ve sınıfları")$v$ || chr(10) || chr(10) || $a$## 2. Fiziksel ve kimyasal değişim$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Madde ve Endüstri'
  and position('/lessons/madde-ve-endustri/periyodik-sistem.svg' in l.body) = 0 and position($a$## 2. Fiziksel ve kimyasal değişim$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 2. Gen, DNA ve kromozom$a$, $v$![DNA’nın iki zincirinde adenin timinle, guanin sitozinle eşleşir](/lessons/dna-genetik-kod/baz-eslesmesi.svg "DNA’da baz eşleşmesi")$v$ || chr(10) || chr(10) || $a$## 2. Gen, DNA ve kromozom$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod'
  and position('/lessons/dna-genetik-kod/baz-eslesmesi.svg' in l.body) = 0 and position($a$## 2. Gen, DNA ve kromozom$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Kalıtımın temel esasları$a$, $v$![Hücre, çekirdek, kromozom, DNA, gen ve nükleotitler iç içe kutular olarak gösterilmiş](/lessons/dna-genetik-kod/hucreden-nukleotide.svg "Hücreden nükleotide: Küçükten büyüğe sıra")$v$ || chr(10) || chr(10) || $a$## 3. Kalıtımın temel esasları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod'
  and position('/lessons/dna-genetik-kod/hucreden-nukleotide.svg' in l.body) = 0 and position($a$## 3. Kalıtımın temel esasları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Eğik düzlem$a$, $v$![Sabit makarada F = G, hareketli makarada F = G/2](/lessons/basit-makineler/makaralar.svg "Sabit ve hareketli makara")$v$ || chr(10) || chr(10) || $a$## 4. Eğik düzlem$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler'
  and position('/lessons/basit-makineler/makaralar.svg' in l.body) = 0 and position($a$## 4. Eğik düzlem$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Çıkrık$a$, $v$![10 m uzunluğunda ve 2 m yüksekliğinde eğik düzlemde 100 N’luk yük 20 N ile dengelenir](/lessons/basit-makineler/egik-duzlem.svg "Eğik düzlem: F · ℓ = G · h")$v$ || chr(10) || chr(10) || $a$## 5. Çıkrık$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler'
  and position('/lessons/basit-makineler/egik-duzlem.svg' in l.body) = 0 and position($a$## 5. Çıkrık$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Besin zinciri ve enerji akışı$a$, $v$![Fotosentezin ürünleri hücresel solunumun girenleridir, solunumun ürünleri fotosentezin girenleridir](/lessons/enerji-donusumleri/fotosentez-solunum.svg "Fotosentez ve hücresel solunum birbirinin tersidir")$v$ || chr(10) || chr(10) || $a$## 4. Besin zinciri ve enerji akışı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi'
  and position('/lessons/enerji-donusumleri/fotosentez-solunum.svg' in l.body) = 0 and position($a$## 4. Besin zinciri ve enerji akışı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Madde döngüleri$a$, $v$![Enerji piramidinde her basamakta enerji yaklaşık onda birine düşer](/lessons/enerji-donusumleri/enerji-piramidi.svg "Enerji piramidi (örnek değerler)")$v$ || chr(10) || chr(10) || $a$## 5. Madde döngüleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi'
  and position('/lessons/enerji-donusumleri/enerji-piramidi.svg' in l.body) = 0 and position($a$## 5. Madde döngüleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Yüklenme çeşitleri$a$, $v$![Aynı cins yükler birbirini iter, zıt cins yükler birbirini çeker](/lessons/elektrik-yukleri/yuklerin-etkilesimi.svg "Yüklü cisimlerin etkileşimi")$v$ || chr(10) || chr(10) || $a$## 3. Yüklenme çeşitleri$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Elektrik Yükleri ve Elektrik Enerjisi'
  and position('/lessons/elektrik-yukleri/yuklerin-etkilesimi.svg' in l.body) = 0 and position($a$## 3. Yüklenme çeşitleri$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Eşitsizlik çözme$a$, $v$![x büyüktür 3, x büyük eşittir 3, x küçüktür 3 ve x küçük eşittir 3 eşitsizliklerinin sayı doğrusunda gösterimi](/lessons/esitsizlikler/sayi-dogrusu.svg "Eşitsizliklerin sayı doğrusunda gösterimi")$v$ || chr(10) || chr(10) || $a$## 3. Eşitsizlik çözme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Eşitsizlikler'
  and position('/lessons/esitsizlikler/sayi-dogrusu.svg' in l.body) = 0 and position($a$## 3. Eşitsizlik çözme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$### Üçgenlerde benzerlik şartları$a$, $v$![Kenarları 3, 4, 5 cm ve 6, 8, 10 cm olan iki benzer üçgen, benzerlik oranı 2](/lessons/esitlik-ve-benzerlik/benzerlik.svg "Benzer üçgenler: k = 2")$v$ || chr(10) || chr(10) || $a$### Üçgenlerde benzerlik şartları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Eşlik ve Benzerlik'
  and position('/lessons/esitlik-ve-benzerlik/benzerlik.svg' in l.body) = 0 and position($a$### Üçgenlerde benzerlik şartları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 1. Dik prizma$a$, $v$![Dik prizma, silindir, koni ve piramit](/lessons/geometrik-cisimler/cisimler.svg "Geometrik cisimler")$v$ || chr(10) || chr(10) || $a$## 1. Dik prizma$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Geometrik Cisimler'
  and position('/lessons/geometrik-cisimler/cisimler.svg' in l.body) = 0 and position($a$## 1. Dik prizma$a$ in l.body) > 0;
