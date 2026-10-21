-- LGS Fen, Basınç: gaz simülasyonunu içeren anlatım. Taslak olarak eklenir, yönetici kontrol edip yayına alır.
insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Basınç, 8. sınıf fenin hem günlük hayata en yakın hem de hesaplama isteyen ünitelerinden biridir. Parmağını duvara ve iğneye aynı kuvvetle bastırdığında neden farklı hissettiğini, neden derine daldıkça kulağının ağrıdığını ve bir balonun ısınınca neden şiştiğini bu konuda açıklayacaksın.

:::hedefler
1. Katı basıncını kuvvet ve yüzey alanıyla ilişkilendirip hesaplamak.
2. Sıvı basıncının derinlik ve yoğunlukla değiştiğini, kabın şekline bağlı olmadığını açıklamak.
3. Açık hava basıncının yükseklikle nasıl değiştiğini söylemek.
4. Kapalı kaptaki gaz basıncının sıcaklık ve hacimle nasıl değiştiğini, parçacık modeliyle açıklamak.
:::

:::ipucu
Bu ünitedeki her soru aynı iki şeyi sorar: **Kuvvet ne kadar?** ve **Bu kuvvet nereye, hangi alana dağılıyor?** Basıncı hesaplamadan önce bu iki soruyu kendine sor.
:::

## 1. Basınç nedir?

Bir yüzeye dik olarak etki eden kuvvetin, o yüzeyin birim alanına düşen miktarına **basınç** denir. Aynı kuvvet küçük bir alana etki ederse basınç büyük, geniş bir alana yayılırsa basınç küçük olur.

$$P = \frac{F}{A}$$

| Simge | Anlamı | Birimi |
| --- | --- | --- |
| $P$ | Basınç | Pa (paskal) |
| $F$ | Yüzeye dik kuvvet | N (newton) |
| $A$ | Yüzey alanı | m² |

Bir paskal, 1 m² alana 1 N kuvvetin etki etmesidir: $1\ \text{Pa} = 1\ \text{N/m}^2$.

### Katılarda basınç

Bir kutuyu masaya koyduğunda kutunun ağırlığı, masa ile temas eden yüzeye dik kuvvet olarak etki eder. Kutuyu farklı yüzü üzerine çevirirsen **ağırlık değişmez**, ama **temas alanı** değişir.

| Durum | Kuvvet | Alan | Basınç |
| --- | --- | --- | --- |
| Geniş yüzü üzerine | Aynı | Büyük | Küçük |
| Dar yüzü üzerine | Aynı | Küçük | Büyük |

Bu yüzden kar ayakkabısının tabanı geniş, çivinin ucu sivridir. Keskin bıçak da aynı nedenle keser: Aynı kuvvet çok küçük bir alana yoğunlaşır.

:::neden-sonuc
- Kuvvet artar, alan aynı kalır => Basınç artar. Aynı alana daha çok kuvvet düşer.
- Alan artar, kuvvet aynı kalır => Basınç azalır. Kuvvet daha geniş bir yüzeye yayılır.
- Cisim hangi yüzü üzerine konursa konsun => Ağırlık değişmez, yalnızca basınç değişir.
:::

## 2. Sıvılarda basınç

Sıvılar ağırlıkları nedeniyle bulundukları kabın tabanına ve çeperlerine basınç uygular. Bu basınç **her yönde** etki eder: Aşağı, yana ve yukarı.

Sıvı basıncı üç şeye bağlıdır.

- **Derinlik (h):** Derine indikçe üstündeki sıvı sütunu uzar, basınç artar.
- **Sıvının yoğunluğu (d):** Yoğunluğu büyük sıvı, aynı derinlikte daha büyük basınç yapar.
- **Yerçekimi ivmesi (g):** Aynı yerde sabit kabul edilir.

$$P = h \cdot d \cdot g$$

:::baglanti
Sıvı basıncı **kabın şekline, genişliğine ve içindeki sıvı miktarına bağlı değildir**. Aynı derinlikte, aynı sıvıda basınç her yerde eşittir. Dar ve geniş iki kapta sıvı yüksekliği aynıysa tabandaki basınç da aynıdır.
:::

Bu bağıntıyı kullanırken birimleri aynı sisteme getir: $h$ metre, $d$ kg/m³ ve $g$ yaklaşık $10\ \text{m/s}^2$ alınırsa basınç paskal çıkar. Suyun yoğunluğu $1000\ \text{kg/m}^3$ tür.

:::dene
1. Su dolu bir gölde 3 m derinlikteki basıncı hesapla ($d = 1000\ \text{kg/m}^3$, $g = 10\ \text{m/s}^2$). => $P = 3 \cdot 1000 \cdot 10 = 30\ 000\ \text{Pa}$
2. Aynı derinlikte, yoğunluğu suyun iki katı olan bir sıvıda basınç kaç katı olur? => Yoğunluk iki katına çıktığı için basınç da iki katı olur.
:::

## 3. Açık hava basıncı

Dünya’yı saran hava tabakasının ağırlığı, üzerimize ve her yüzeye basınç uygular. Buna **açık hava basıncı** denir. Bunu fark etmemizin nedeni, vücudumuzun içindeki basıncın da buna eşit olmasıdır.

Açık hava basıncını **Torricelli** ilk kez ölçmüştür. Bir ucu kapalı, cıva dolu bir cam boruyu cıva dolu kaba ters çevirdi. Boruda cıva bir miktar indi ve belli bir yükseklikte durdu. Deniz seviyesinde bu yükseklik yaklaşık **76 cm** dir. Yani açık hava basıncı **76 cmHg** dir.

Açık hava basıncı **yükseldikçe azalır**. Çünkü yükseldikçe üstümüzdeki hava tabakası incelir ve ağırlığı azalır. Bu yüzden dağın tepesinde barometredeki cıva sütunu 76 cm den kısa olur.

:::ipucu
Torricelli deneyinde cıva sütununun yüksekliği, borunun **kalınlığına, eğimine ve boyuna bağlı değildir**. Yalnızca açık hava basıncına, yani bulunduğun yüksekliğe bağlıdır.
:::

## 4. Gazlarda basınç

Gaz parçacıkları sürekli ve rastgele hareket eder. Kapalı bir kapta bu parçacıklar kabın duvarına çarpar. Her çarpma duvara küçük bir kuvvet uygular. Çok sayıda parçacığın çarpmasının toplamı **gaz basıncını** oluşturur.

Gaz basıncı kapalı kapta iki şekilde değişir.

- **Sıcaklık arttığında** parçacıklar hızlanır. Duvara hem daha sık hem daha sert çarparlar. Basınç artar.
- **Hacim küçüldüğünde** aynı sayıda parçacık daha dar bir alana sıkışır. Duvara daha sık çarparlar. Basınç artar.

Aşağıdaki simülasyonda bunu kendin dene. Önce tahmin et, sonra kaydırıcıları oynat.

::sim{tur="gaz"}

:::baglanti
Gazın miktarı (parçacık sayısı) sabitken **sıcaklık arttıkça basınç artar**, **hacim arttıkça basınç azalır**. Parçacık sayısı artarsa da basınç artar: Bir lastiğe hava pompaladığında lastik sertleşir.
:::

Günlük hayattan örnekler: Güneşte kalan kapalı bir şişenin kapağı sıkılaşır, şişirilmiş balon ısınınca patlayabilir, şırıngaya parmağını basıp pistonu ittiğinde piston zor hareket eder.

## 5. Konuyu toparla

| Basınç türü | Neye bağlı? | Önemli not |
| --- | --- | --- |
| Katı basıncı | Kuvvet ve yüzey alanı | Ağırlık sabitken alan küçülünce basınç artar |
| Sıvı basıncı | Derinlik ve yoğunluk | Kabın şekline ve sıvı miktarına bağlı değil |
| Açık hava basıncı | Bulunduğun yükseklik | Yükseldikçe azalır, deniz seviyesinde 76 cmHg |
| Gaz basıncı | Sıcaklık, hacim, parçacık sayısı | Parçacıkların duvara çarpmasından oluşur |

## Mini test

:::soru{cevap="C"}
Ağırlığı 300 N olan bir blok, taban alanı $0{,}15\ \text{m}^2$ olan yüzü üzerine yatay bir zemine konuyor.

Buna göre bloğun zemine uyguladığı basınç kaç paskaldır?

- A) $45$
- B) $200$
- C) $2000$
- D) $20\ 000$

---

1. Blok yatay zeminde durduğu için zemine uyguladığı kuvvet ağırlığına eşittir: $F = 300\ \text{N}$.
2. $P = \dfrac{F}{A} = \dfrac{300}{0{,}15}$.
3. $\dfrac{300}{0{,}15} = 2000\ \text{Pa}$. Doğru cevap C.
:::

:::soru{cevap="D"}
Dikdörtgenler prizması şeklindeki bir kutu, üç farklı yüzü üzerine sırayla yatay masaya konuyor. Her durumda kutunun ağırlığı aynıdır.

Buna göre aşağıdakilerden hangisi doğrudur?

- A) Kutunun masaya uyguladığı kuvvet en geniş yüzü üzerindeyken en büyüktür.
- B) Basınç, hangi yüzü üzerine konursa konsun aynıdır.
- C) Basınç en geniş yüzü üzerindeyken en büyüktür.
- D) Basınç en dar yüzü üzerindeyken en büyüktür.

---

1. Kutu hangi yüzü üzerine konursa konsun kuvvet (ağırlık) değişmez. A yanlış.
2. Kuvvet sabitken temas alanı değişir, bu yüzden basınç da değişir. B yanlış.
3. $P = \dfrac{F}{A}$ olduğundan alan küçüldükçe basınç büyür. En büyük basınç **en dar yüz** üzerindeyken oluşur. Doğru cevap D.
:::

:::soru{cevap="B"}
Aynı sıvıyla aynı yüksekliğe kadar doldurulmuş, tabanları farklı genişlikte üç kap düz bir masada duruyor. Kapların hepsinin tabanına gelen sıvı basıncı karşılaştırılıyor.

Buna göre aşağıdakilerden hangisi doğrudur?

- A) Tabanı en geniş olan kabın tabanındaki basınç en büyüktür.
- B) Üçünün tabanındaki sıvı basıncı eşittir.
- C) Tabanı en dar olan kabın tabanındaki basınç en büyüktür.
- D) Kabın içindeki sıvı miktarı en çok olanın tabanındaki basınç en küçüktür.

---

1. Sıvı basıncı $P = h \cdot d \cdot g$ ile bulunur.
2. Kapların hepsinde sıvı aynı, yükseklik aynı. Yani $h$, $d$ ve $g$ aynıdır.
3. Sıvı basıncı kabın şekline, genişliğine ve sıvı miktarına bağlı olmadığı için üç kapta da basınç eşittir. Doğru cevap B.
:::

:::soru{cevap="A"}
Deniz seviyesinde cıvalı barometre ile yapılan Torricelli deneyinde cıva sütununun yüksekliği 76 cm ölçülüyor. Aynı deney, aynı düzenekle yüksek bir dağın tepesinde tekrarlanıyor.

Buna göre dağın tepesinde cıva sütununun yüksekliği için ne söylenebilir?

- A) 76 cm den küçük olur.
- B) 76 cm olur.
- C) 76 cm den büyük olur.
- D) Boru eğilirse artar.

---

1. Yükseldikçe üstümüzdeki hava tabakası incelir, açık hava basıncı azalır.
2. Cıva sütununu dengeleyen şey açık hava basıncıdır. Basınç azalınca cıva sütunu da kısalır.
3. Bu yüzden sütun 76 cm den küçük olur. Doğru cevap A.
:::

:::soru{cevap="C"}
Ucu kapatılmış bir şırınganın içinde hava vardır. Sıcaklık değişmeden piston yavaşça içeri itiliyor.

Buna göre şırınganın içindeki hava için aşağıdakilerden hangisi doğrudur?

- A) Parçacık sayısı azalır.
- B) Parçacıklar daha yavaş hareket eder.
- C) Parçacıklar duvara daha sık çarpar ve gaz basıncı artar.
- D) Gaz basıncı azalır.

---

1. Piston itilince gazın hacmi küçülür. Gaz dışarı çıkamayacağı için parçacık sayısı değişmez. A yanlış.
2. Sıcaklık sabit olduğu için parçacıkların hızı da değişmez. B yanlış.
3. Aynı sayıda parçacık daha küçük bir hacme sıkışınca duvara daha sık çarpar. Basınç artar. Doğru cevap C.
:::

## Kendini dene

Cevaplara bakmadan önce her soruyu kendin çöz. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. 600 N ağırlığındaki bir kişi, tabanlarının toplam alanı $0{,}05\ \text{m}^2$ olan ayakkabılarla duruyor. Zemine uyguladığı basınç kaç Pa dır? => $P = \dfrac{600}{0{,}05} = 12\ 000\ \text{Pa}$
2. Aynı kişi tek ayağı üzerinde dursa basınç nasıl değişir? Neden? => Basınç iki katına çıkar. Kuvvet (ağırlık) aynı kalır, ama temas alanı yarıya düşer.
3. Güneşte kalan, kapağı kapalı bir şişenin içindeki havanın basıncı neden artar? => Sıcaklık artınca parçacıklar hızlanır, duvara daha sık ve daha sert çarpar. Hacim sabit olduğu için basınç artar.
4. Bir dalgıç 10 m yerine 20 m derine inerse sıvı basıncı nasıl değişir? => Derinlik iki katına çıktığı için sıvı basıncı da iki katı olur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 12, false from public.topics where subject_id = 'lgs-fen' and name = 'Basınç'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Dört kazanım. (1) Katı basıncını kuvvet ve yüzey alanıyla ilişkilendirir. (2) Sıvı basıncını derinlik ve yoğunlukla ilişkilendirir. (3) Açık hava basıncının yükseklikle değiştiğini açıklar. (4) Kapalı kaptaki gaz basıncının sıcaklık ve hacimle ilişkisini parçacık modeliyle açıklar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) $P = h \cdot d \cdot g$ bağıntısının ve gazlarda sıcaklık/hacim ilişkisinin 8. sınıf kapsamında olup olmadığı, (b) "76 cmHg" bilgisi, (c) dilin 8. sınıfa uygunluğu, (d) soruların LGS tarzına uyup uymadığı. Pascal prensibi ve hidrolik sistemler bilerek konmadı, programda yoksa eklemeyin.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Basınç'
on conflict (topic_id) do nothing;
