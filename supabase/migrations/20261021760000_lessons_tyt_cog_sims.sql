-- TYT Coğrafya: konulara etkileşimli harita, şema ve grafikler (taslak anlatımlar)

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $v$## Gelişimi zaman şeridinde gör

Bir çağ seç ve bilim insanlarına dokunarak ne yaptıklarını gör.

::sim{tur="cografyatarihi"}$v$ || chr(10) || chr(10) || $a$## 8. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğa ve İnsan'
  and position('::sim{tur="cografyatarihi"}' in l.body) = 0 and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Mevsimleri dene

Tarihi değiştirip Kuzey Yarım Küre’nin Güneş’e göre durumuna bak.

::sim{tur="mevsim"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Dünya''nın Şekli ve Hareketleri'
  and position('::sim{tur="mevsim"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Konuyu toparla$a$, $v$## Enlem, boylam ve yerel saati dene

Haritadan bir nokta seç ve boylama göre yerel saatin nasıl değiştiğine bak.

::sim{tur="koordinat"}$v$ || chr(10) || chr(10) || $a$## 5. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Coğrafi Konum'
  and position('::sim{tur="koordinat"}' in l.body) = 0 and position($a$## 5. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 6. Konuyu toparla$a$, $v$## Ölçeği dene

Ölçeği ve haritadaki uzaklığı değiştirip gerçek uzaklığı hesapla.

::sim{tur="olcek"}$v$ || chr(10) || chr(10) || $a$## 6. Konuyu toparla$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Harita Bilgisi'
  and position('::sim{tur="olcek"}' in l.body) = 0 and position($a$## 6. Konuyu toparla$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Nem ve yağış$a$, $v$## Basınç kuşaklarını ve rüzgârları incele

Katmanları değiştirerek enlemlere göre basıncı, hava hareketini, rüzgârları ve yağışı karşılaştır.

::sim{tur="basinc"}$v$ || chr(10) || chr(10) || $a$## 4. Nem ve yağış$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Atmosfer ve İklim'
  and position('::sim{tur="basinc"}' in l.body) = 0 and position($a$## 4. Nem ve yağış$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 2. Nüfus yoğunluğu$a$, $v$## Nüfus artışını incele

Her bir milyarlık artışın kaç yılda gerçekleştiğine bak.

::sim{tur="nufus"}$v$ || chr(10) || chr(10) || $a$## 2. Nüfus yoğunluğu$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Nüfus ve Göç'
  and position('::sim{tur="nufus"}' in l.body) = 0 and position($a$## 2. Nüfus yoğunluğu$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 4. Göç$a$, $v$## Demografik dönüşümü incele

Aşamaları seçip doğum ve ölüm oranlarının, nüfus artışının ve piramidin nasıl değiştiğini izle.

::sim{tur="demografi"}$v$ || chr(10) || chr(10) || $a$## 4. Göç$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Nüfus ve Göç'
  and position('::sim{tur="demografi"}' in l.body) = 0 and position($a$## 4. Göç$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 2. Tarım$a$, $v$## Sektör dağılımını incele

Türkiye’de ve farklı ülkelerde çalışan nüfusun sektörlere dağılımını karşılaştır.

::sim{tur="sektor"}$v$ || chr(10) || chr(10) || $a$## 2. Tarım$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ekonomik Faaliyetler'
  and position('::sim{tur="sektor"}' in l.body) = 0 and position($a$## 2. Tarım$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 2. Marmara Bölgesi$a$, $v$## Bölgeleri haritada gör

Bir bölge seçip özelliklerine bak, sonra Sına modunda bölgeleri haritada bul.

::sim{tur="bolgeler"}$v$ || chr(10) || chr(10) || $a$## 2. Marmara Bölgesi$a$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Bölgeler'
  and position('::sim{tur="bolgeler"}' in l.body) = 0 and position($a$## 2. Marmara Bölgesi$a$ in l.body) > 0;
