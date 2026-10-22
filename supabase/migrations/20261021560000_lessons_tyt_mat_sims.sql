-- TYT Temel Matematik: konulara simülasyonlar (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 4. EBOB ve EKOK arasındaki ilişki$a$, $v$## Döşeyerek gör

Genişliği ve uzunluğu değiştir. Zemini artık kalmadan döşeyen en büyük karenin kenarı EBOB'dur.

::sim{tur="ebob"}$v$ || chr(10) || chr(10) || $a$## 4. EBOB ve EKOK arasındaki ilişki$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'EBOB ve EKOK'
  and position('::sim{tur="ebob"}' in l.body) = 0 and position($a$## 4. EBOB ve EKOK arasındaki ilişki$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. İki mutlak değerin toplamı$a$, $v$## Sayı doğrusunda gör

Merkezi, yarıçapı ve $x$ noktasını değiştirip çözüm aralığının nasıl oluştuğuna bak.

::sim{tur="mutlak"}$v$ || chr(10) || chr(10) || $a$## 5. İki mutlak değerin toplamı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Mutlak Değer'
  and position('::sim{tur="mutlak"}' in l.body) = 0 and position($a$## 5. İki mutlak değerin toplamı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Üç değişkenli oranlar$a$, $v$## Grafikte gör

Doğru ve ters orantıyı karşılaştır. $x$ iki katına çıkınca $y$ bir durumda iki katına çıkar, ötekinde yarıya iner.

::sim{tur="oranti"}$v$ || chr(10) || chr(10) || $a$## 5. Üç değişkenli oranlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Oran ve Orantı'
  and position('::sim{tur="oranti"}' in l.body) = 0 and position($a$## 5. Üç değişkenli oranlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Akıntılı hareket$a$, $v$## Grafikte gör

Hızları ve uzaklığı değiştir. İki çizginin kesiştiği nokta araçların karşılaştığı andır.

::sim{tur="hareket"}$v$ || chr(10) || chr(10) || $a$## 4. Akıntılı hareket$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Hareket Problemleri'
  and position('::sim{tur="hareket"}' in l.body) = 0 and position($a$## 4. Akıntılı hareket$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Su ekleme$a$, $v$## Karıştırarak gör

Miktarları ve yoğunlukları değiştir. Karışımın yoğunluğu her zaman iki çözeltinin yoğunluğu arasında kalır.

::sim{tur="karisim"}$v$ || chr(10) || chr(10) || $a$## 3. Su ekleme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Karışım Problemleri'
  and position('::sim{tur="karisim"}' in l.body) = 0 and position($a$## 3. Su ekleme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Venn şemasıyla problem çözme$a$, $v$## Venn şemasında gör

Kesişimi büyüttükçe birleşimin küçüldüğüne dikkat et.

::sim{tur="venn"}$v$ || chr(10) || chr(10) || $a$## 5. Venn şemasıyla problem çözme$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Kümeler'
  and position('::sim{tur="venn"}' in l.body) = 0 and position($a$## 5. Venn şemasıyla problem çözme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Ters fonksiyon$a$, $v$## Makinede gör

$f$ ve $g$ makinelerinin sırasını değiştirince sonucun nasıl değiştiğine bak.

::sim{tur="fonksiyon"}$v$ || chr(10) || chr(10) || $a$## 4. Ters fonksiyon$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Fonksiyonlar'
  and position('::sim{tur="fonksiyon"}' in l.body) = 0 and position($a$## 4. Ters fonksiyon$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Kökler toplamı ve çarpımı$a$, $v$## Grafikte gör

Katsayıları değiştir. Parabolün $x$ eksenini kestiği noktalar denklemin kökleridir.

::sim{tur="parabol"}$v$ || chr(10) || chr(10) || $a$## 3. Kökler toplamı ve çarpımı$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'İkinci Dereceden Denklemler'
  and position('::sim{tur="parabol"}' in l.body) = 0 and position($a$## 3. Kökler toplamı ve çarpımı$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Özel durumlar$a$, $v$## Seçimleri listele

Eleman sayısını ve seçilecek sayıyı değiştirip tüm seçimleri gör.

::sim{tur="kombinasyon"}$v$ || chr(10) || chr(10) || $a$## 5. Özel durumlar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Permütasyon ve Kombinasyon'
  and position('::sim{tur="kombinasyon"}' in l.body) = 0 and position($a$## 5. Özel durumlar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Verilere işlem uygulanırsa$a$, $v$## Verilerle dene

Çubukları değiştirip ortalamanın, ortancanın ve tepe değerin nasıl tepki verdiğine bak.

::sim{tur="istatistik"}$v$ || chr(10) || chr(10) || $a$## 3. Verilere işlem uygulanırsa$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Veri ve İstatistik'
  and position('::sim{tur="istatistik"}' in l.body) = 0 and position($a$## 3. Verilere işlem uygulanırsa$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Açıortaylar$a$, $v$## Açıları değiştir

İki iç açıyı değiştir ve dış açının komşu olmayan iki iç açının toplamına eşit olduğunu gör.

::sim{tur="ucgenaci"}$v$ || chr(10) || chr(10) || $a$## 4. Açıortaylar$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Doğruda ve Üçgende Açılar'
  and position('::sim{tur="ucgenaci"}' in l.body) = 0 and position($a$## 4. Açıortaylar$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 2. Öklid bağıntıları$a$, $v$## Kenar karelerini gör

Dik kenarları değiştir. İki küçük karenin alanları toplamı büyük karenin alanına eşit kalır.

::sim{tur="pisagor"}$v$ || chr(10) || chr(10) || $a$## 2. Öklid bağıntıları$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Özel Üçgenler'
  and position('::sim{tur="pisagor"}' in l.body) = 0 and position($a$## 2. Öklid bağıntıları$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Temel orantı teoremi$a$, $v$## Oranı değiştir

Benzerlik oranını değiştir. Kenarlar $k$ katına çıkarken alan $k^2$ katına çıkar.

::sim{tur="benzerlik"}$v$ || chr(10) || chr(10) || $a$## 3. Temel orantı teoremi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Üçgende Benzerlik'
  and position('::sim{tur="benzerlik"}' in l.body) = 0 and position($a$## 3. Temel orantı teoremi$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 3. Teğet ve kiriş$a$, $v$## Açıyı gör

$P$ noktasını çember üzerinde gezdir. Aynı yayı gören çevre açı değişmez.

::sim{tur="cember"}$v$ || chr(10) || chr(10) || $a$## 3. Teğet ve kiriş$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Çember ve Daire'
  and position('::sim{tur="cember"}' in l.body) = 0 and position($a$## 3. Teğet ve kiriş$a$ in l.body) > 0;
