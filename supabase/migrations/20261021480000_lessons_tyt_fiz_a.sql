-- TYT Fizik konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir otomobilin hızını “saatte 90 kilometre” diye söylersin. Bir ışığın şiddetini, bir çayın sıcaklığını, bir ipin gerginliğini de ölçebilirsin. Fizik, doğadaki bu olayları **ölçerek ve sayılarla** anlatan bir bilimdir. Ölçmek için **büyüklüklere, birimlere ve ölçü aletlerine** ihtiyaç vardır. Bu konu, fiziğin bütün konularında kullanacağın dili kurar. Bu konuda fiziğin alt dallarını, büyüklük türlerini, SI birim sistemini ve birim dönüşümlerini öğreneceksin.

:::hedefler
1. Fizik biliminin tanımını ve alt dallarını bilmek.
2. Temel ve türetilmiş büyüklükleri ayırt etmek.
3. Skaler ve vektörel büyüklükleri ayırt etmek.
4. SI birim sistemini ve ön ekleri kullanarak birim dönüşümü yapmak.
5. Ölçme ve ölçü aletleri hakkında temel bilgileri bilmek.
:::

:::ipucu
Birim dönüşümünde **birimleri de çarp ya da böl**. “km/h” hızını “m/s”ye çevirirken kilometreyi metreye, saati saniyeye çevirirsin. İşlemleri yazarak yap: $\dfrac{72 \cdot 1000}{3600} = 20$. Sayıları ezberleme, nedenini bil.
:::

## 1. Fizik nedir?

**Fizik**, **madde ile enerji arasındaki etkileşimleri** inceleyen, doğa olaylarını gözlem ve deneye dayanarak açıklayan bilim dalıdır. Fizik, doğadaki olayların **nedenlerini ve sonuçlarını** bulmaya çalışır.

**Fiziğin alt dalları:**

| Alt dal | İncelediği konular |
| --- | --- |
| Mekanik | Hareket, kuvvet, enerji, basınç |
| Elektrik ve manyetizma | Yük, akım, devreler, mıknatıslar |
| Optik | Işık, yansıma, kırılma, mercekler |
| Termodinamik | Isı, sıcaklık, hal değişimi |
| Dalgalar | Su, ses, ışık dalgaları |
| Atom ve nükleer fizik | Atomun yapısı, radyoaktivite |
| Katıhal fiziği | Katı maddelerin yapısı ve özellikleri |

**Bilimsel yöntem:** Gözlem yap, problemi belirle, hipotez kur, deney yap, verileri topla, sonuç çıkar. Hipotez deneyle desteklenirse **kuram (teori)** ve çok sayıda deneyle doğrulanırsa **yasa** olur.

## 2. Fiziksel büyüklükler

Ölçülebilen her niceliğe **fiziksel büyüklük** denir.

**Temel büyüklükler:** Başka büyüklüklerden türetilemeyen büyüklüklerdir.

| Büyüklük | SI birimi | Sembol |
| --- | --- | --- |
| Uzunluk | metre | m |
| Kütle | kilogram | kg |
| Zaman | saniye | s |
| Sıcaklık | kelvin | K |
| Elektrik akımı | amper | A |
| Işık şiddeti | kandela | cd |
| Madde miktarı | mol | mol |

**Türetilmiş büyüklükler:** Temel büyüklüklerden elde edilen büyüklüklerdir.

| Büyüklük | Birimi | Temel birimlerle |
| --- | --- | --- |
| Hız | m/s | uzunluk bölü zaman |
| Kuvvet | newton (N) | kg·m/s² |
| Enerji ve iş | joule (J) | N·m |
| Güç | watt (W) | J/s |
| Basınç | pascal (Pa) | N/m² |

## 3. Skaler ve vektörel büyüklükler

**Skaler büyüklük:** Yalnızca **büyüklüğü** (sayısı ve birimi) olan, yönü olmayan büyüklüktür. Kütle, zaman, sıcaklık, hacim, yol, sürat, enerji, iş, güç.

**Vektörel büyüklük:** Hem **büyüklüğü hem yönü** olan büyüklüktür. Yer değiştirme, hız, ivme, kuvvet, momentum.

**Ayrım yöntemi:** “Bu büyüklüğü söylerken yön de söylemem gerekiyor mu?” Evet ise vektör. “Kuvvet 10 N” dersen eksik söylemişsindir, “yukarı doğru 10 N” demen gerekir. “Kütle 5 kg” ise tamdır.

## 4. SI ön ekleri ve birim dönüşümü

Büyük ya da küçük değerleri yazmak için SI ön ekleri kullanılır:

| Ön ek | Sembol | Çarpan |
| --- | --- | --- |
| nano | n | $10^{-9}$ |
| mikro | µ | $10^{-6}$ |
| mili | m | $10^{-3}$ |
| santi | c | $10^{-2}$ |
| kilo | k | $10^{3}$ |
| mega | M | $10^{6}$ |
| giga | G | $10^{9}$ |

**Örnekler:**

- $3\ \text{km} = 3 \cdot 10^3\ \text{m} = 3000\ \text{m}$
- $5\ \text{mm} = 5 \cdot 10^{-3}\ \text{m} = 0{,}005\ \text{m}$
- $1\ \text{mm} = 1000\ \text{µm}$ (çünkü $10^{-3} / 10^{-6} = 10^3$)

**Hız dönüşümü:** $1\ \text{m/s} = 3{,}6\ \text{km/h}$. $72\ \text{km/h} = \dfrac{72}{3{,}6} = 20\ \text{m/s}$. Tersine $10\ \text{m/s} = 36\ \text{km/h}$.

## 5. Ölçme ve ölçü aletleri

Ölçme, bir büyüklüğü **aynı türden bir birimle karşılaştırmaktır**. Ölçü aletleri hassasiyetlerine göre seçilir.

| Ölçü aleti | Ölçtüğü | Duyarlılık |
| --- | --- | --- |
| Cetvel | Uzunluk | 1 mm |
| Kumpas | Küçük uzunluk, çap | 0,1 mm |
| Mikrometre | Çok küçük uzunluk | 0,01 mm |
| Terazi | Kütle | Alete göre |
| Kronometre | Zaman | 0,01 s |
| Termometre | Sıcaklık | 1 derece |
| Dinamometre | Kuvvet | Alete göre |

**Ölçme hataları:** Hiçbir ölçüm tam doğru değildir. **Sistematik hata** (bozuk alet) ve **rastgele hata** (okuma farkı) vardır. Hatayı azaltmak için ölçümü birkaç kez yapıp **ortalama** alırsın.

:::ipucu{baslik="Sık yapılan hata"}
**Kütle ile ağırlığı karıştırmak** sık yapılan bir hatadır. Kütle, maddenin miktarıdır, skalerdir ve kilogramla ölçülür. Ağırlık, yerçekimi kuvvetidir, vektöreldir ve newtonla ölçülür. Ayrıca **sürat ile hızı** karıştırırsın: Sürat skaler, hız vektöreldir.
:::

:::baglanti
Bu konudaki büyüklükler ve birimler, “Hareket ve Kuvvet”, “İş, Güç ve Enerji”, “Basınç ve Kaldırma Kuvveti” konularının dilidir. Skaler ve vektörel ayrımı, özellikle hareket konusunda yol ile yer değiştirme farkını anlamanı sağlar. Birim dönüşümleri, TYT Fizik ve Kimya sorularında işlem hatalarını önler.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Fizik | Madde ve enerji etkileşimi |
| Temel büyüklükler | Uzunluk, kütle, zaman, sıcaklık, akım, ışık şiddeti, madde miktarı |
| Skaler | Yönü yok: kütle, zaman, enerji |
| Vektörel | Yönü var: kuvvet, hız, yer değiştirme |
| Ön ekler | n, µ, m, c, k, M, G |
| km/h → m/s | 3,6 ile böl |
| Kütle-ağırlık | Kütle skaler, ağırlık vektörel |

## Mini test

:::soru{cevap="B"}
Aşağıdaki fiziksel büyüklüklerden hangisi **vektörel** bir büyüklüktür?

- A) Kütle
- B) Yer değiştirme
- C) Sıcaklık
- D) Enerji
- E) Hacim

---

1. Vektörel büyüklüğün hem büyüklüğü hem de yönü vardır.
2. Yer değiştirme, bir noktadan diğerine olan en kısa uzaklığı ve yönünü belirtir. Vektöreldir.
3. Kütle, sıcaklık, enerji ve hacim yalnızca büyüklükle belirtilir, skalerdir. Doğru cevap B.

Diğer şıklar: **Kütle** yönü olmayan skaler büyüklük / **Sıcaklık** yönü olmayan skaler büyüklük / **Enerji** yönü olmayan skaler büyüklük / **Hacim** yönü olmayan skaler büyüklük.
:::

:::soru{cevap="B"}
Bir aracın hızı 90 km/h olarak ölçülüyor. Bu hız m/s cinsinden kaçtır?

- A) 15
- B) 25
- C) 90
- D) 250
- E) 324

---

1. $1\ \text{m/s} = 3{,}6\ \text{km/h}$ olduğundan km/h değeri 3,6'ya bölünür.
2. $\dfrac{90}{3{,}6} = 25\ \text{m/s}$. Doğru cevap B.

Diğer şıklar: **15** 6 ile bölünmüş / **90** birim dönüşümü yapılmamış / **250** 10 ile çarpılmış / **324** 3,6 ile çarpılmış.
:::

:::soru{cevap="C"}
Bir cismin uzunluğu 2,5 mm olarak ölçülüyor. Bu uzunluk kaç mikrometre (µm)dir?

- A) 25
- B) 250
- C) 2500
- D) 25000
- E) 2500000

---

1. $1\ \text{mm} = 10^{-3}\ \text{m}$ ve $1\ \text{µm} = 10^{-6}\ \text{m}$ olduğundan $1\ \text{mm} = 1000\ \text{µm}$.
2. $2{,}5 \cdot 1000 = 2500\ \text{µm}$. Doğru cevap C.

Diğer şıklar: **25** 10 ile çarpılmış / **250** 100 ile çarpılmış / **25000** 10 000 ile çarpılmış / **2500000** 1 000 000 ile çarpılmış.
:::

:::soru{cevap="D"}
Aşağıdaki birimlerden hangisi **SI birim sisteminde temel birim değildir**?

- A) Metre
- B) Kilogram
- C) Saniye
- D) Newton
- E) Kelvin

---

1. Temel birimler: metre, kilogram, saniye, kelvin, amper, kandela, mol.
2. Newton, kuvvetin birimidir ve $\text{kg} \cdot \text{m/s}^2$ ile ifade edilir. Türetilmiş birimdir.
3. Doğru cevap D.

Diğer şıklar: **Metre** uzunluğun temel birimi / **Kilogram** kütlenin temel birimi / **Saniye** zamanın temel birimi / **Kelvin** sıcaklığın temel birimi.
:::

## Kendini dene

:::dene
1. 36 km/h kaç m/s’dir? => $36 / 3{,}6 = 10$ m/s.
2. 3 km kaç metredir? => 3000 m.
3. Kütle skaler mi vektörel midir? => Skalerdir, yönü yoktur.
4. Kuvvetin SI birimi nedir? => Newton (N).
5. Hız vektörel mi skaler mi? => Vektöreldir, yönü vardır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-fiz' and name = 'Fizik Bilimine Giriş'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fizik biliminin tanımı ve alt dalları, bilimsel yöntem, temel ve türetilmiş büyüklükler, skaler ve vektörel büyüklükler, SI ön ekleri, birim dönüşümü, ölçü aletleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Ölçü aletlerinin duyarlılık değerleri yaklaşık, kullanılan alete göre değişir. Dördüncü soruda negatif kök koyu yazıldı.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Fizik Bilimine Giriş'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Aynı boyutta iki kutu düşün: Biri demir dolu, diğeri pamuk dolu. Boyutları aynı ama ağırlıkları çok farklı. Bir ağacın köklerinden yapraklarına su nasıl çıkar? Bir su damlası neden küre biçimindedir? Bu soruların cevabı **maddenin özelliklerinde** yatar. Bu konuda kütle, hacim ve özkütleyi, maddeyi ayırt eden özellikleri, adezyon ve kohezyonu, yüzey gerilimini ve kılcallığı öğreneceksin.

:::hedefler
1. Kütle, hacim ve özkütle kavramlarını tanımak.
2. Özkütleyi hesaplamak ve birimlerini dönüştürmek.
3. Karışımın özkütlesini hesaplamak.
4. Maddeyi ayırt eden özellikleri (özkütle, erime, kaynama) bilmek.
5. Adezyon, kohezyon, yüzey gerilimi ve kılcallığı ayırt etmek.
:::

:::ipucu
Özkütle sorularında **önce birimlere bak**. Kütle gram ve hacim cm³ ise özkütle g/cm³ olur. Kütle kg ve hacim m³ ise özkütle kg/m³ olur. Birimleri karıştırırsan sonuç yanlış çıkar. $1\ \text{g/cm}^3 = 1000\ \text{kg/m}^3$.
:::

## 1. Kütle, hacim, özkütle

**Kütle ($m$):** Bir cismin içerdiği madde miktarıdır. Birimi kilogramdır. Kütle her yerde aynıdır. Dünyada da Ay’da da bir cismin kütlesi aynıdır.

**Hacim ($V$):** Cismin uzayda kapladığı yerdir. Birimi $\text{m}^3$ ya da $\text{cm}^3$’tür. Sıvıların hacmi litre ile de ölçülür: $1\ \text{L} = 1000\ \text{cm}^3$.

**Özkütle (yoğunluk, $d$):** Birim hacmin kütlesidir:

$$d = \frac{m}{V}$$

**Örnek.** Kütlesi 120 g, hacmi 40 $\text{cm}^3$ olan cismin özkütlesi $\dfrac{120}{40} = 3\ \text{g/cm}^3$’tür.

**Birim dönüşümü.** $1\ \text{g/cm}^3 = 1000\ \text{kg/m}^3$. Alüminyumun özkütlesi $2{,}7\ \text{g/cm}^3 = 2700\ \text{kg/m}^3$’tür. Suyun özkütlesi $1\ \text{g/cm}^3$, yani $1000\ \text{kg/m}^3$’tür.

**Özkütlenin özellikleri:**

- Özkütle, **maddeyi ayırt eden** bir özelliktir. Aynı maddenin özkütlesi (aynı sıcaklık ve basınçta) her miktarda aynıdır.
- Bir cismi ikiye bölersen özkütlesi değişmez, kütlesi ve hacmi yarıya iner.
- Sıcaklık artınca genelde hacim artar, özkütle azalır.

## 2. Karışımın özkütlesi

Birbirine karışan sıvılarda hacim toplamı korunuyorsa karışımın özkütlesi, **toplam kütlenin toplam hacme** bölünmesiyle bulunur:

$$d_{\text{karışım}} = \frac{m_1 + m_2}{V_1 + V_2}$$

**Örnek.** Hacmi $100\ \text{cm}^3$ ve özkütlesi $1{,}2\ \text{g/cm}^3$ olan sıvı ile hacmi $200\ \text{cm}^3$ ve özkütlesi $0{,}9\ \text{g/cm}^3$ olan sıvı karıştırılıyor.

- $m_1 = 1{,}2 \cdot 100 = 120\ \text{g}$, $m_2 = 0{,}9 \cdot 200 = 180\ \text{g}$.
- Toplam kütle $300\ \text{g}$, toplam hacim $300\ \text{cm}^3$.
- $d = \dfrac{300}{300} = 1\ \text{g/cm}^3$.

**Dikkat:** Karışımın özkütlesi, iki özkütlenin aritmetik ortalaması değildir. Hacimler farklıysa ortalama, hacmi büyük olana yaklaşır. Karışımın özkütlesi, her zaman iki özkütle **arasında** bir değerdir.

## 3. Maddeyi ayırt eden özellikler

Maddenin **miktarına bağlı olmayan** özelliklerine ayırt edici özellikler denir:

| Özellik | Açıklama |
| --- | --- |
| Özkütle | Aynı koşullarda her madde için sabit |
| Erime noktası | Katı maddenin sıvı hâle geçtiği sıcaklık |
| Kaynama noktası | Sıvı maddenin gaza geçtiği sıcaklık |
| Çözünürlük | Belirli koşullarda çözünen madde miktarı |
| Genleşme katsayısı | Maddenin ısıyla genleşme derecesi |

Miktara bağlı özellikler: **Kütle, hacim, ağırlık, uzunluk**. Bunlar maddeyi ayırt etmez, çünkü miktar değişince değişir.

## 4. Adezyon, kohezyon, yüzey gerilimi

**Kohezyon:** **Aynı cins** moleküller arasındaki çekim kuvvetidir. Su molekülleri birbirini çeker.

**Adezyon:** **Farklı cins** moleküller arasındaki çekim kuvvetidir. Su molekülleri ile cam molekülleri arasındaki çekim.

| Durum | Davranış |
| --- | --- |
| Adezyon > kohezyon | Sıvı yüzeye yapışır, yüzeyi ıslatır (su ile cam) |
| Kohezyon > adezyon | Sıvı yüzeyde damla yapar, yüzeyi ıslatmaz (civa ile cam) |

**Yüzey gerilimi:** Sıvı yüzeyindeki moleküller, aşağı ve yanlardan çekilir. Yüzey gerilmiş bir zar gibi davranır. Bu yüzden **su damlası küre biçimini alır**, bazı böcekler su üzerinde yürür, ince bir iğne dikkatli bırakılırsa su yüzeyinde batmadan durur. Sıvının sıcaklığı artınca yüzey gerilimi azalır. Deterjan ya da sabun yüzey gerilimini azaltır.

## 5. Kılcallık

**Kılcallık:** Dar bir borunun içinde sıvının, boru dışındaki seviyeden **yükselmesi ya da alçalmasıdır**.

![Üç kılcal boru su kabına daldırılmış. Boru inceldikçe su daha fazla yükseliyor](/lessons/tyt-fiz/kilcallik.svg "Kılcallık | Yolumnet")

- Adezyon kohezyondan büyükse (su ile cam) sıvı boruda **yükselir**.
- Kohezyon adezyondan büyükse (civa ile cam) sıvı boruda **alçalır**.
- Boru **inceldikçe** yükselme (ya da alçalma) **artar**.
- Isı artınca yüzey gerilimi azaldığı için yükselme azalır.

**Günlük hayatta:** Bitkilerin köklerinden yapraklara su taşıması, havlunun suyu emmesi, mumun yağını fitilde yükseltmesi, kâğıt mendilin suyu çekmesi kılcallıktır.

:::ipucu{baslik="Sık yapılan hata"}
**Kütle ile özkütleyi karıştırmak** en sık yapılan hatadır. Bir cismi ikiye bölersen kütle ve hacim yarıya iner, özkütle aynı kalır. Bir de **kohezyon ile adezyonu** karıştırırsın. Aynı cins moleküller arası çekime kohezyon, farklı cins moleküller arası çekime adezyon denir. Kılcallıkta **adezyon baskınsa yükselme** olduğunu unutma.
:::

:::baglanti
Özkütle, “Basınç ve Kaldırma Kuvveti” konusunda cismin batıp batmayacağını belirler: Özkütlesi suyun özkütlesinden büyük olan batar. “Isı ve Sıcaklık” konusunda genleşme özkütleyi nasıl değiştirdiğini görürsün. Kılcallık ise “Kimyanın Temel Kanunları” ve biyolojideki “Bitkilerde Madde Taşınması” ile ilişkilidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Özkütle | $d = m / V$ |
| Birim dönüşümü | $1\ \text{g/cm}^3 = 1000\ \text{kg/m}^3$ |
| Karışım | Toplam kütle bölü toplam hacim |
| Ayırt edici | Özkütle, erime, kaynama |
| Kohezyon | Aynı cinsler arası çekim |
| Adezyon | Farklı cinsler arası çekim |
| Kılcallık | Boru inceldikçe artar |

## Mini test

:::soru{cevap="B"}
Kütlesi 450 g ve hacmi 150 $\text{cm}^3$ olan bir cismin özkütlesi kaç $\text{g/cm}^3$’tür?

- A) 2
- B) 3
- C) 300
- D) 600
- E) 67500

---

1. Özkütle, kütlenin hacme bölümüdür: $d = \dfrac{m}{V}$.
2. $d = \dfrac{450}{150} = 3\ \text{g/cm}^3$. Doğru cevap B.

Diğer şıklar: **2** işlem hatasıyla bir eksik bulunmuş / **300** kütle ile hacmin farkı alınmış / **600** kütle ile hacim toplanmış / **67500** kütle ile hacim çarpılmış.
:::

:::soru{cevap="B"}
Hacmi $100\ \text{cm}^3$ ve özkütlesi $1{,}2\ \text{g/cm}^3$ olan sıvı ile hacmi $200\ \text{cm}^3$ ve özkütlesi $0{,}9\ \text{g/cm}^3$ olan sıvı karıştırılıyor. Karışımın hacminin iki hacmin toplamı olduğu bilindiğine göre karışımın özkütlesi kaç $\text{g/cm}^3$ olur?

- A) $0,9$
- B) $1,0$
- C) $1,05$
- D) $1,2$
- E) $2,1$

---

1. Birinci sıvının kütlesi $1{,}2 \cdot 100 = 120\ \text{g}$, ikincinin kütlesi $0{,}9 \cdot 200 = 180\ \text{g}$.
2. Toplam kütle $300\ \text{g}$, toplam hacim $300\ \text{cm}^3$.
3. $d = \dfrac{300}{300} = 1\ \text{g/cm}^3$. Doğru cevap B.

Diğer şıklar: **$0,9$** ikinci sıvının özkütlesi alınmış / **$1,05$** özkütlelerin aritmetik ortalaması alınmış / **$1,2$** ilk sıvının özkütlesi alınmış / **$2,1$** özkütleler toplanmış.
:::

:::soru{cevap="A"}
Aşağıdaki olaylardan hangisi **adezyon** kuvvetinin sonucudur?

- A) Suyun cam yüzeyine yapışması
- B) Su damlasının küre biçimini alması
- C) Cıvanın cam üzerinde damla oluşturması
- D) Sabun köpüğünün küre biçiminde olması
- E) İğnenin su yüzeyinde batmadan durması

---

1. Adezyon, farklı cins moleküller arasındaki çekim kuvvetidir.
2. Su molekülleri ile cam molekülleri farklı cinstir. Suyun cama yapışması adezyon sonucudur.
3. Diğer seçenekler kohezyon ve yüzey gerilimi ile ilgilidir. Doğru cevap A.

Diğer şıklar: **Su damlasının küre biçimini alması** aynı cins moleküller arası çekim olan kohezyon ve yüzey gerilimi / **Cıvanın cam üzerinde damla oluşturması** kohezyonun adezyondan büyük olması / **Sabun köpüğünün küre biçiminde olması** yüzey geriliminin sonucu / **İğnenin su yüzeyinde batmadan durması** yüzey geriliminin sonucu.
:::

:::soru{cevap="E"}
Dar bir cam boru suya daldırıldığında borudaki su seviyesinin dışarıdaki seviyeden **yüksek** olmasının nedeni aşağıdakilerden hangisidir?

- A) Kohezyon kuvvetinin adezyon kuvvetinden büyük olması
- B) Atmosfer basıncının borunun içinde artması
- C) Suyun özkütlesinin borunun içinde azalması
- D) Borunun içindeki havanın ısınması
- E) Adezyon kuvvetinin kohezyon kuvvetinden büyük olması

---

1. Su ve cam arasında adezyon kuvveti, suyun kendi molekülleri arasındaki kohezyon kuvvetinden büyüktür.
2. Su cama yapışarak boruda yükselir. Boru inceldikçe yükselme artar.
3. Diğer seçenekler kılcallığın nedeni değildir. Doğru cevap E.

Diğer şıklar: **Kohezyon kuvvetinin adezyon kuvvetinden büyük olması** bu durumda sıvı boruda alçalırdı / **Atmosfer basıncının borunun içinde artması** kılcallık atmosfer basıncı artışından kaynaklanmaz / **Suyun özkütlesinin borunun içinde azalması** özkütle değişimi kılcallığın nedeni değil / **Borunun içindeki havanın ısınması** ısınma yükselmeyi artırmaz, yüzey gerilimini azaltır.
:::

## Kendini dene

:::dene
1. Kütlesi 80 g, hacmi 20 $\text{cm}^3$ olan cismin özkütlesi kaçtır? => $80 / 20 = 4\ \text{g/cm}^3$.
2. $5\ \text{g/cm}^3$ özkütle kaç $\text{kg/m}^3$’tür? => 5000.
3. Bir cisim ikiye bölünürse özkütlesi nasıl değişir? => Değişmez.
4. Su ile cam arasında hangi kuvvet baskındır? => Adezyon.
5. Kılcal boru inceldikçe sıvının yükselmesi nasıl değişir? => Artar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-fiz' and name = 'Madde ve Özellikleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Kütle, hacim, özkütle, birim dönüşümü, karışımın özkütlesi, ayırt edici özellikler, adezyon, kohezyon, yüzey gerilimi, kılcallık. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Dayanıklılık konusu metne alınmadı. Karışım örneğinde hacmin toplam olarak korunduğu varsayıldı, ilk soruda bu açıkça belirtildi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Madde ve Özellikleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yola çıkan bir otobüs önce hızlanır, sonra sabit hızla gider, durağa yaklaşırken yavaşlar. Bir elmayı bıraktığında yere hızlanarak düşer. Bir kutuyu itince hareket etmesi için kuvvet uygularsın, sürtünme onu durdurmaya çalışır. **Hareket ve kuvvet**, fiziğin en temel konusudur ve TYT’de sayısal soruların büyük kısmı buradan gelir. Bu konuda konum, yol, yer değiştirme, hız, ivme, düzgün doğrusal hareket, serbest düşme ve Newton’un hareket yasalarını öğreneceksin.

:::hedefler
1. Yol ile yer değiştirmeyi, sürat ile hızı ayırt etmek.
2. Düzgün doğrusal hareket ve düzgün hızlanan harekette hız ve yol hesaplamak.
3. Hız-zaman ve konum-zaman grafiklerini yorumlamak.
4. Serbest düşme hareketinde hız ve yüksekliği hesaplamak.
5. Newton’un hareket yasalarını ve sürtünmeli hareketi uygulamak.
:::

:::ipucu
Hareket sorularında **önce hareketi bölümlere ayır**: Hızlanma, sabit hızla gitme, yavaşlama. Her bölüm için ayrı formül kullanırsın. Grafik varsa **alan yolu, eğim ivmeyi** verir. Birimleri hep SI’ye çevir: metre, saniye, newton.
:::

## 1. Konum, yol, yer değiştirme

**Konum:** Cismin bir başlangıç noktasına göre bulunduğu yerdir. **Yol:** Cismin hareketi boyunca aldığı toplam uzunluktur (skaler). **Yer değiştirme:** Başlangıç noktasından son noktaya olan **düz uzaklıktır** (vektörel).

**Örnek.** Bir cisim A noktasından doğuya 300 m, sonra kuzeye 400 m gidiyor. **Yol:** $300 + 400 = 700\ \text{m}$. **Yer değiştirme:** Başlangıçtan bitiş noktasına olan düz uzaklıktır. 3, 4, 5 dik üçgeninin katı olduğundan $\sqrt{300^2 + 400^2} = 500\ \text{m}$.

Yer değiştirme her zaman yola eşit ya da küçüktür. Cisim bir yönde doğru giderse ikisi eşit olur.

## 2. Sürat ve hız

**Sürat (skaler):** $\dfrac{\text{toplam yol}}{\text{toplam süre}}$. **Hız (vektörel):** $\dfrac{\text{yer değiştirme}}{\text{süre}}$.

**Ortalama hız (ortalama sürat):** Toplam yol bölü toplam süre. İki eşit yolu farklı hızlarla giden araçta ortalama sürat, aritmetik ortalama değil **harmonik** ortalamadır:

$$v_{\text{ort}} = \frac{2 v_1 v_2}{v_1 + v_2}$$

**Örnek.** Yolun yarısını $40\ \text{km/h}$, yarısını $60\ \text{km/h}$ ile giden aracın ortalama sürati $\dfrac{2 \cdot 40 \cdot 60}{100} = 48\ \text{km/h}$’tir. Aritmetik ortalama olan 50 değildir.

## 3. Düzgün doğrusal hareket

Hızın **sabit** olduğu harekettir. İvme yoktur. Yol, hız ile süre çarpımıdır:

$$x = v \cdot t$$

**Konum-zaman grafiği:** Doğrusal ve eğimlidir. **Eğim hızdır.** Eğim büyükse hız büyüktür.

## 4. İvme ve düzgün hızlanan hareket

**İvme (a):** Hızın birim zamandaki değişimidir:

$$a = \frac{\Delta v}{\Delta t} \quad (\text{m/s}^2)$$

İvme vektöreldir. Hız artıyorsa ivme hareket yönündedir, hız azalıyorsa ters yöndedir (yavaşlama).

**Düzgün hızlanan harekette** ($v_0$: ilk hız, $a$ sabit):

| Bağıntı | Formül |
| --- | --- |
| Hız | $v = v_0 + a t$ |
| Yol | $x = v_0 t + \dfrac{1}{2} a t^2$ |
| Zamansız | $v^2 = v_0^2 + 2 a x$ |

**Örnek.** Durgun halden harekete geçen cismin ivmesi $2\ \text{m/s}^2$’dir. 5 s sonra hızı $v = 0 + 2 \cdot 5 = 10\ \text{m/s}$, aldığı yol $x = \dfrac{1}{2} \cdot 2 \cdot 25 = 25\ \text{m}$ olur.

**Hız-zaman grafiği:** Eğim ivmeyi, altında kalan alan yolu verir.

![Hız-zaman grafiği: 4 saniyede 0'dan 20 m/s'ye hızlanma, 4 saniye sabit hız, 2 saniyede duruş. Alanlar 40, 80 ve 20 metre](/lessons/tyt-fiz/hiz-zaman-grafigi.svg "Hız-zaman grafiği | Yolumnet")

Şekilde toplam yol $40 + 80 + 20 = 140\ \text{m}$, toplam süre 10 s olduğundan ortalama sürat $14\ \text{m/s}$’dir.

## 5. Serbest düşme

Havanın direnci ihmal edildiğinde cismin yalnızca **yerçekimi** etkisiyle düşmesidir. İvme **yerçekimi ivmesi** $g = 10\ \text{m/s}^2$’dir (TYT’de). Cisim ilk hızsız bırakılırsa:

$$v = g t, \qquad h = \frac{1}{2} g t^2, \qquad v^2 = 2 g h$$

**Örnek.** Bir cisim serbest bırakılıyor. 3 s sonra hızı $30\ \text{m/s}$, düştüğü yükseklik $\dfrac{1}{2} \cdot 10 \cdot 9 = 45\ \text{m}$’dir.

**Önemli:** Havasız ortamda tüm cisimler kütleleri ne olursa olsun **aynı ivmeyle** düşer. Tüy ve taş vakumda aynı anda yere ulaşır.

## 6. Newton’un hareket yasaları

**1. yasa (eylemsizlik):** Bir cisme etki eden net kuvvet sıfırsa, cisim durgunsa durmaya, hareketliyse sabit hızla gitmeye devam eder.

**2. yasa:** Net kuvvet, kütle ile ivmenin çarpımıdır:

$$F_{\text{net}} = m \cdot a$$

**3. yasa (etki-tepki):** Bir cisim başka bir cisme kuvvet uygularsa, ikinci cisim de ona **eşit büyüklükte, zıt yönde** kuvvet uygular. Bu kuvvetler **farklı cisimlere** etki eder, birbirini dengelemez.

**Net kuvvet:** Aynı doğrultudaki kuvvetler yönlerine göre toplanır ya da çıkarılır. $30\ \text{N}$ sağa, $10\ \text{N}$ sola kuvvet varsa net kuvvet $20\ \text{N}$ sağadır. Kütle 5 kg ise ivme $\dfrac{20}{5} = 4\ \text{m/s}^2$.

**Ağırlık:** $G = m g$. Kütlesi 10 kg olan cismin ağırlığı $10 \cdot 10 = 100\ \text{N}$’dur.

**Sürtünme kuvveti:** Hareketi engelleyen, hareket yönüne zıt kuvvettir.

$$f = \mu \cdot N$$

($\mu$: sürtünme katsayısı, $N$: yüzeyin tepki kuvveti). Yatay zeminde $N = mg$.

**Örnek.** 10 kg’lık cisme yatay $60\ \text{N}$ kuvvet uygulanıyor, $\mu = 0{,}4$, $g = 10$. $N = 100\ \text{N}$, $f = 0{,}4 \cdot 100 = 40\ \text{N}$. Net kuvvet $60 - 40 = 20\ \text{N}$, ivme $\dfrac{20}{10} = 2\ \text{m/s}^2$.

:::neden-sonuc
- Net kuvvet sıfır => İvme sıfır, cisim durur ya da sabit hızla gider.
- Net kuvvet var => Cisim kuvvet yönünde hızlanır.
- Hız-zaman grafiğinin eğimi var => İvme vardır.
- Hız-zaman grafiğinde alan => Alınan yoldur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Hız ile ivmeyi karıştırmak** en sık yapılan hatadır. Hız sıfır olsa bile ivme sıfır olmayabilir: Yukarı atılan cismin en tepe noktasında hızı sıfırdır ama ivmesi $g$’dir. Bir de **etki-tepki kuvvetlerini dengeli sanmak**: Bu kuvvetler farklı cisimlere uygulandığı için birbirini yok etmez. Dengeli kuvvetler aynı cisme etki eder.
:::

:::baglanti
Bu konu, “İş, Güç ve Enerji” konusunun temelidir: İş, kuvvet ile yol çarpımıdır. “Basınç ve Kaldırma Kuvveti” konusunda kuvvet dengesi cismin batıp batmayacağını belirler. Grafik okuma becerisi matematikteki “Fonksiyonlar” ve “Analitik Geometri” konularından gelir: Eğim burada hız ya da ivmedir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yol - yer değiştirme | Yol skaler, yer değiştirme vektörel |
| Düzgün doğrusal | $x = v t$ |
| İvme | $a = \Delta v / \Delta t$ |
| Düzgün hızlanan | $v = v_0 + a t$, $x = v_0 t + \tfrac{1}{2} a t^2$ |
| Serbest düşme | $g = 10$, $h = \tfrac{1}{2} g t^2$ |
| Newton 2 | $F = m a$ |
| Sürtünme | $f = \mu N$ |

## Mini test

:::soru{cevap="C"}
Bir araç yolun yarısını 40 km/h, kalan yarısını 60 km/h hızla gidiyor. Aracın ortalama sürati kaç km/h’tir?

- A) 20
- B) 24
- C) 48
- D) 50
- E) 100

---

1. Yolun yarısı $x$ olsun. Süreler: $t_1 = \dfrac{x}{40}$, $t_2 = \dfrac{x}{60}$.
2. Toplam yol $2x$, toplam süre $x\left(\dfrac{1}{40} + \dfrac{1}{60}\right) = \dfrac{x}{24}$.
3. Ortalama sürat $\dfrac{2x}{x/24} = 48\ \text{km/h}$. Doğru cevap C.

Diğer şıklar: **20** hızların farkı alınmış / **24** hızların çarpımı, hızlar toplamına bölünmüş / **50** iki hızın aritmetik ortalaması alınmış / **100** hızlar toplanmış.
:::

:::soru{cevap="C"}
Durgun halden harekete geçen bir cisim 5 s boyunca düzgün hızlanarak 15 m/s hıza ulaşıyor, 6 s sabit hızla gidiyor, sonra 3 s içinde düzgün yavaşlayarak duruyor. Cismin aldığı toplam yol kaç metredir?

- A) 60
- B) 90
- C) 150
- D) 151
- E) 210

---

1. Hız-zaman grafiğinin altında kalan alan yolu verir.
2. Hızlanma: $\dfrac{5 \cdot 15}{2} = 37{,}5$. Sabit hız: $6 \cdot 15 = 90$. Yavaşlama: $\dfrac{3 \cdot 15}{2} = 22{,}5$.
3. Toplam $37{,}5 + 90 + 22{,}5 = 150\ \text{m}$. Doğru cevap C.

Diğer şıklar: **60** yalnızca hızlanma ve yavaşlama bölümleri hesaplanmış / **90** yalnızca sabit hızlı bölüm hesaplanmış / **151** işlem hatasıyla bir fazla bulunmuş / **210** tüm süre boyunca en büyük hızla gidilmiş sayılmış.
:::

:::soru{cevap="D"}
Yerden 80 m yükseklikten serbest bırakılan bir cismin yere çarpma hızı kaç m/s’dir? ($g = 10\ \text{m/s}^2$, hava direnci ihmal ediliyor.)

- A) 4
- B) 38
- C) 39
- D) 40
- E) 80

---

1. $v^2 = 2 g h = 2 \cdot 10 \cdot 80 = 1600$.
2. $v = \sqrt{1600} = 40\ \text{m/s}$. Doğru cevap D.

Diğer şıklar: **4** düşme süresi bulunmuş / **38** işlem hatasıyla iki eksik bulunmuş / **39** işlem hatasıyla bir eksik bulunmuş / **80** yükseklik alınmış.
:::

:::soru{cevap="A"}
Kütlesi 10 kg olan bir cisim, sürtünme katsayısı 0,4 olan yatay zeminde duruyor. Cisme yatay doğrultuda 60 N’luk bir kuvvet uygulanırsa cismin ivmesi kaç $\text{m/s}^2$ olur? ($g = 10\ \text{m/s}^2$)

- A) 2
- B) 3
- C) 4
- D) 6
- E) 20

---

1. Yüzeyin tepki kuvveti $N = mg = 100\ \text{N}$, sürtünme $f = 0{,}4 \cdot 100 = 40\ \text{N}$.
2. Net kuvvet $60 - 40 = 20\ \text{N}$.
3. $a = \dfrac{20}{10} = 2\ \text{m/s}^2$. Doğru cevap A.

Diğer şıklar: **3** işlem hatasıyla bir fazla bulunmuş / **4** yalnızca sürtünme kuvveti kütleye bölünmüş / **6** sürtünme kuvveti hesaba katılmamış / **20** net kuvvet kütleye bölünmeden alınmış.
:::

## Kendini dene

:::dene
1. Hızı 20 m/s olan cisim 6 s’de kaç metre yol alır? => $20 \cdot 6 = 120$ m.
2. Durgun halden 3 $\text{m/s}^2$ ivmeyle hızlanan cismin 4 s sonraki hızı kaçtır? => $3 \cdot 4 = 12$ m/s.
3. Serbest bırakılan cisim 2 s sonra kaç m/s hıza ulaşır? => $10 \cdot 2 = 20$ m/s.
4. 4 kg’lık cisme 20 N net kuvvet etki ediyorsa ivmesi kaçtır? => $20 / 4 = 5\ \text{m/s}^2$.
5. Net kuvvet sıfırsa cisim ne yapar? => Durgunsa durur, hareketliyse sabit hızla gider.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-fiz' and name = 'Hareket ve Kuvvet'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Konum, yol, yer değiştirme, sürat ve hız, düzgün doğrusal hareket, ivme, düzgün hızlanan hareket, grafikler, serbest düşme, Newton'un hareket yasaları, sürtünme. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Yukarı atış ve bileşke kuvvet (iki boyutlu) metne alınmadı. Yerçekimi ivmesi 10 olarak alındı. Statik ve kinetik sürtünme ayrımı sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Hareket ve Kuvvet'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir yükü yukarı taşıyan kişi iş yapar. Aynı yükü kısa sürede taşıyan daha güçlüdür. Yukarıdaki yük, düşebileceği için enerjiye sahiptir. **İş, güç ve enerji**, fiziğin her konusunda ortak olarak kullanılan üç kavramdır. Enerji, evrendeki her olayın temelidir ve hiç yok olmaz, yalnızca biçim değiştirir. Bu konuda işin tanımını, gücü, kinetik ve potansiyel enerjiyi, mekanik enerjinin korunumunu ve verimi öğreneceksin.

:::hedefler
1. İşi, kuvvet ve yer değiştirme ile ilişkilendirerek hesaplamak.
2. Gücü hesaplamak ve birimlerini bilmek.
3. Kinetik ve potansiyel enerjiyi hesaplamak.
4. Mekanik enerjinin korunumunu uygulamak.
5. Verimi hesaplamak.
:::

:::ipucu
Enerji sorularında **iki durumu karşılaştır**: Başlangıç ve son. Mekanik enerji korunuyorsa başlangıçtaki toplam enerji ile sondaki toplam enerji eşittir. “Yere çarpma hızı” gibi soruları kuvvet ve ivme yerine **enerji ile çözmek** çok daha hızlıdır.
:::

## 1. İş

Bir kuvvet cismi **kendi yönünde** yer değiştirtiyorsa kuvvet iş yapmıştır:

$$W = F \cdot x$$

Birimi **joule (J)** olup $1\ \text{J} = 1\ \text{N} \cdot 1\ \text{m}$’dir.

**Örnek.** 20 N’luk kuvvet bir cismi kendi yönünde 5 m götürürse iş $20 \cdot 5 = 100\ \text{J}$.

**İşin sıfır olduğu durumlar:**

- Kuvvet var ama yer değiştirme yoksa (duvarı itmek): $W = 0$.
- Kuvvet, yer değiştirmeye **dik** ise (düz yolda yük taşırken ağırlık kuvveti): $W = 0$.

**İşin işareti:** Kuvvet ve yer değiştirme aynı yönde ise iş **pozitif**, zıt yönde ise (sürtünme) iş **negatiftir**.

**Kuvvet-yol grafiği:** Grafiğin altında kalan alan işi verir.

## 2. Güç

Birim zamanda yapılan işe **güç** denir:

$$P = \frac{W}{t}$$

Birimi **watt (W)**: $1\ \text{W} = 1\ \text{J/s}$. $1\ \text{kW} = 1000\ \text{W}$.

**Örnek.** 10 saniyede 600 J iş yapan makinenin gücü $\dfrac{600}{10} = 60\ \text{W}$’tır.

Aynı işi daha kısa sürede yapan cihazın gücü daha büyüktür. Güç, **işin hızlı yapılması**dır. Elektrik enerjisi **kilowatt-saat (kWh)** ile ölçülür: $1\ \text{kWh} = 1000\ \text{W} \cdot 3600\ \text{s} = 3{,}6 \cdot 10^6\ \text{J}$.

**Hız ile ilişkisi:** Sabit hızla giden bir cisim için $P = F \cdot v$.

## 3. Enerji

**Enerji**, iş yapabilme yeteneğidir. Birimi joule’dür. Enerji türleri:

| Enerji | Formül | Açıklama |
| --- | --- | --- |
| Kinetik (hareket) | $E_k = \dfrac{1}{2} m v^2$ | Hareket eden cismin enerjisi |
| Yerçekimi potansiyel | $E_p = m g h$ | Yüksekteki cismin enerjisi |
| Esneklik potansiyel | $E = \dfrac{1}{2} k x^2$ | Gerilmiş yayın enerjisi |
| Isı, ışık, elektrik, kimyasal | | Diğer enerji türleri |

**Örnek (kinetik).** Kütlesi 2 kg, hızı 10 m/s olan cismin kinetik enerjisi $\dfrac{1}{2} \cdot 2 \cdot 100 = 100\ \text{J}$.

**Örnek (potansiyel).** 5 kg’lık cisim 4 m yüksekte ise $E_p = 5 \cdot 10 \cdot 4 = 200\ \text{J}$ ($g = 10$).

**Önemli:** Kinetik enerji **hızın karesi** ile orantılıdır. Hız 2 katına çıkarsa kinetik enerji 4 katına çıkar.

## 4. İş-enerji teoremi

Cisme etki eden **net kuvvetin yaptığı iş**, cismin kinetik enerjisindeki değişime eşittir:

$$W_{\text{net}} = \Delta E_k$$

Sürtünmesiz yatay zeminde durgun cisme 10 J iş yapılırsa cismin kinetik enerjisi 10 J olur.

## 5. Mekanik enerjinin korunumu

**Mekanik enerji** = kinetik enerji + potansiyel enerji. **Sürtünme ve hava direnci yoksa mekanik enerji korunur.**

![Serbest bırakılan cisim üç konumda: tepede tüm enerji potansiyel, ortada yarı yarıya, yere çarparken tümü kinetik](/lessons/tyt-fiz/enerji-donusumu.svg "Enerji dönüşümü | Yolumnet")

$$E_{p1} + E_{k1} = E_{p2} + E_{k2}$$

**Örnek.** 2 kg’lık cisim 20 m yükseklikten serbest bırakılıyor ($g = 10$).

- Başlangıçta $E_p = 2 \cdot 10 \cdot 20 = 400\ \text{J}$, $E_k = 0$.
- Yere çarparken $E_p = 0$, tüm enerji kinetik: $\dfrac{1}{2} \cdot 2 \cdot v^2 = 400$ ve $v = 20\ \text{m/s}$.

Sürtünme varsa mekanik enerjinin bir kısmı **ısıya** dönüşür. Toplam enerji (ısı dahil) yine korunur.

## 6. Verim

Bir makineye verilen enerjinin **ne kadarının yararlı işe dönüştüğünü** gösterir:

$$\text{Verim} = \frac{\text{yararlı enerji}}{\text{harcanan enerji}} \cdot 100$$

**Örnek.** Bir makine 400 J enerji alıp 300 J yararlı iş yapıyorsa verimi $\dfrac{300}{400} \cdot 100 = \%75$’tir. Kalan 100 J, ısı olarak kaybolur. Hiçbir makinenin verimi %100 olamaz.

:::neden-sonuc
- Kuvvet yönünde yer değiştirme var => İş pozitif.
- Yer değiştirme yok ya da kuvvete dik => İş sıfır.
- Sürtünme ve hava direnci yok => Mekanik enerji korunur.
- Cismin hızı 2 katına çıkıyor => Kinetik enerji 4 katına çıkar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Gücü işle karıştırmak** en sık yapılan hatadır. İş joule, güç watt’tır. Aynı işi yapan iki makineden daha kısa sürede yapan daha güçlüdür. Ayrıca **dik kuvvetin iş yapmadığını** unutma: Yatay giderken yük taşıyan kişi, yükün ağırlığı yönünde iş yapmaz. Bir de **kinetik enerjide hızı ikiye katlamanın enerjiyi dört kat artırdığını** hatırla.
:::

:::baglanti
Bu konu, “Hareket ve Kuvvet” konusunun devamıdır: İş, kuvvet ile yolun çarpımıdır. “Isı ve Sıcaklık” konusunda enerjinin ısıya dönüşümünü, “Elektrik ve Manyetizma” konusunda elektrik enerjisini göreceksin. Enerjinin korunumu, bütün fizik ve kimya konularının ortak ilkesidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İş | $W = F x$, birimi J |
| Güç | $P = W / t$, birimi W |
| Kinetik enerji | $\tfrac{1}{2} m v^2$ |
| Potansiyel enerji | $m g h$ |
| Mekanik enerji | $E_k + E_p$ |
| Korunum | Sürtünme yoksa sabit |
| Verim | Yararlı / harcanan |

## Mini test

:::soru{cevap="C"}
Sürtünmesiz yatay bir zeminde 5 kg kütleli bir cisme yatay doğrultuda 30 N’luk bir kuvvet uygulanıyor ve cisim kuvvet yönünde 4 m yol alıyor. Kuvvetin yaptığı iş kaç J’dür?

- A) 30
- B) 34
- C) 120
- D) 150
- E) 600

---

1. Kuvvet yer değiştirme yönünde olduğundan $W = F \cdot x$.
2. $W = 30 \cdot 4 = 120\ \text{J}$. Kütle işi etkilemez. Doğru cevap C.

Diğer şıklar: **30** yalnızca kuvvet alınmış / **34** kuvvet ile yol toplanmış / **150** kuvvet ile kütle çarpılmış / **600** kuvvet, yol ve kütle çarpılmış.
:::

:::soru{cevap="B"}
Kütlesi 50 kg olan bir yük, 20 saniyede 10 m yüksekliğe sabit hızla çıkarılıyor. Yükü çıkaran düzeneğin yararlı gücü kaç W’tır? ($g = 10\ \text{m/s}^2$)

- A) 25
- B) 250
- C) 500
- D) 5000
- E) 100000

---

1. Yararlı iş yük potansiyel enerji kazancına eşittir: $W = mgh = 50 \cdot 10 \cdot 10 = 5000\ \text{J}$.
2. Güç $P = \dfrac{W}{t} = \dfrac{5000}{20} = 250\ \text{W}$. Doğru cevap B.

Diğer şıklar: **25** ağırlık süreye bölünmüş / **500** ağırlık alınmış / **5000** yapılan iş (güç yerine) alınmış / **100000** iş ile süre çarpılmış.
:::

:::soru{cevap="D"}
Kütlesi 2 kg olan bir cisim 45 m yükseklikten serbest bırakılıyor. Hava direnci ihmal edildiğine göre yere çarpmadan hemen önceki kinetik enerjisi kaç J’dür? ($g = 10\ \text{m/s}^2$)

- A) 30
- B) 90
- C) 450
- D) 900
- E) 1800

---

1. Mekanik enerji korunur: Yere çarparken kinetik enerji, başlangıçtaki potansiyel enerjiye eşittir.
2. $E_k = mgh = 2 \cdot 10 \cdot 45 = 900\ \text{J}$. Doğru cevap D.

Diğer şıklar: **30** yere çarpma hızı bulunmuş / **90** kütle ile yükseklik çarpılmış / **450** yarım çarpanı fazladan alınmış / **1800** enerji 2 ile çarpılmış.
:::

:::soru{cevap="B"}
Bir makineye 800 J enerji veriliyor ve makine bu enerjinin 600 J’ünü yararlı işe dönüştürüyor. Bu makinenin verimi yüzde kaçtır?

- A) 25
- B) 75
- C) 76
- D) 133
- E) 200

---

1. Verim $= \dfrac{\text{yararlı enerji}}{\text{harcanan enerji}} \cdot 100$.
2. $\dfrac{600}{800} \cdot 100 = 75$. Verim %75'tir. Doğru cevap B.

Diğer şıklar: **25** kayıp enerjinin yüzdesi alınmış / **76** işlem hatasıyla bir fazla bulunmuş / **133** verilen enerji yararlı enerjiye bölünmüş / **200** kaybolan enerji miktarı alınmış.
:::

## Kendini dene

:::dene
1. 10 N’luk kuvvet cismi 6 m götürürse yapılan iş kaçtır? => $10 \cdot 6 = 60$ J.
2. 200 J’lük işi 5 s’de yapan makinenin gücü kaçtır? => $200 / 5 = 40$ W.
3. 4 kg’lık cismin 3 m yükseklikteki potansiyel enerjisi kaçtır? ($g = 10$) => $4 \cdot 10 \cdot 3 = 120$ J.
4. 3 kg’lık cismin 4 m/s hızla hareket ederken kinetik enerjisi kaçtır? => $\tfrac{1}{2} \cdot 3 \cdot 16 = 24$ J.
5. 500 J enerji alıp 400 J yararlı iş yapan makinenin verimi yüzde kaçtır? => %80.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-fiz' and name = 'İş, Güç ve Enerji'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İş, güç, kinetik ve potansiyel enerji, iş-enerji teoremi, mekanik enerjinin korunumu, verim. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Kuvvet ile yer değiştirme arasında açı olan durumlar (W = F x cos açı) metne alınmadı. Yay potansiyel enerjisi yalnızca formülle verildi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'İş, Güç ve Enerji'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sıcak çayı karıştırınca neden soğur? Buz neden erirken sıcaklığı sabit kalır? Metal kaşık ateşte neden hemen ısınır, tahta kaşık ısınmaz? **Isı ve sıcaklık** günlük hayatta sürekli karşılaştığın olayları açıklar. TYT’de bu konunun sorularının büyük kısmı **sayısal** ve çoğu ısı alışverişi ile hal değişimine dayanır. Bu konuda ısı ile sıcaklığın farkını, ısı hesaplarını, ısıl dengeyi, hal değişimini, genleşmeyi ve ısı iletim yollarını öğreneceksin.

:::hedefler
1. Isı ile sıcaklığı ayırt etmek.
2. Öz ısı ve ısı sığasını kullanarak ısı alışverişini hesaplamak.
3. Isıl dengede karışımın sıcaklığını bulmak.
4. Hal değişimini ve hal değişimi sırasında sıcaklığın sabit kalmasını açıklamak.
5. Genleşmeyi ve ısı iletim yollarını (iletim, konveksiyon, ışıma) tanımak.
:::

:::ipucu
Isı sorularında **“alınan ısı = verilen ısı”** denklemini kur. Sıcak madde ısı verir, soğuk madde ısı alır, son sıcaklık ikisinin arasında kalır. Hal değişimi varsa sıcaklık değişmez: O bölümde $Q = m \cdot L$ kullan.
:::

## 1. Isı ve sıcaklık

**Sıcaklık:** Maddeyi oluşturan taneciklerin **ortalama kinetik enerjisinin** ölçüsüdür. Termometre ile ölçülür. Birimi °C (selsiyus) ve K (kelvin)’dir. $T(\text{K}) = t(°\text{C}) + 273$. 27 °C = 300 K.

**Isı ($Q$):** Sıcaklık farkı nedeniyle **sıcak cisimden soğuk cisme aktarılan enerjidir**. Birimi **joule (J)** ya da **kalori (cal)**: $1\ \text{cal} = 4{,}2\ \text{J}$.

| | Sıcaklık | Isı |
| --- | --- | --- |
| Nedir? | Ortalama kinetik enerji ölçüsü | Aktarılan enerji |
| Aleti | Termometre | Kalorimetre |
| Birimi | °C, K | J, cal |
| Miktara bağlı mı? | Hayır | Evet |

**Isı akışı** her zaman sıcak cisimden soğuk cisme doğrudur ve **sıcaklıklar eşitlenince durur**. Buna **ısıl denge** denir.

## 2. Öz ısı ve ısı sığası

**Öz ısı ($c$):** 1 gram maddenin sıcaklığını 1 °C artırmak için gereken ısıdır. Maddeyi ayırt eden özelliktir. Suyun öz ısısı $1\ \text{cal/g°C}$’dir (yaklaşık $4{,}2\ \text{J/g°C}$). Su, öz ısısı yüksek bir maddedir: Geç ısınır, geç soğur.

**Isı sığası ($C$):** Bir cismin sıcaklığını 1 °C artırmak için gereken ısıdır: $C = m \cdot c$. 500 g suyun ısı sığası $500\ \text{cal/°C}$’dir.

**Isı alışverişi:**

$$Q = m \cdot c \cdot \Delta T$$

**Örnek.** 200 g suyun sıcaklığı 20 °C’den 50 °C’ye çıkıyor. $Q = 200 \cdot 1 \cdot 30 = 6000\ \text{cal}$.

## 3. Isıl denge

Farklı sıcaklıktaki maddeler karıştırılırsa, sıcak olanın verdiği ısı soğuk olanın aldığı ısıya eşittir:

$$m_1 c_1 (T_1 - T) = m_2 c_2 (T - T_2)$$

**Aynı madde (örneğin su) ise** $c_1 = c_2$ olduğundan sadeleşir ve denge sıcaklığı

$$T = \frac{m_1 T_1 + m_2 T_2}{m_1 + m_2}$$

**Örnek.** 100 g 80 °C su ile 300 g 20 °C su karıştırılırsa $T = \dfrac{100 \cdot 80 + 300 \cdot 20}{400} = \dfrac{14000}{400} = 35\ \text{°C}$.

Denge sıcaklığı her zaman iki sıcaklığın **arasında** olur ve **kütlesi büyük olana yakındır**.

## 4. Hal değişimi

Maddeye ısı verilince sıcaklığı artar. Ancak **hal değişimi sırasında** (erime, kaynama) verilen ısı sıcaklığı değil, **taneciklerin düzenini** değiştirir. Bu yüzden hal değişimi sırasında **sıcaklık sabit** kalır.

![Buzun ısıtılırken sıcaklık-ısı grafiği: katı hâlde artış, erimede yatay bölüm, sıvıda artış, kaynamada yatay bölüm, gazda artış](/lessons/tyt-fiz/hal-degisimi-grafigi.svg "Hal değişimi grafiği | Yolumnet")

**Hal değişimi ısısı:**

$$Q = m \cdot L$$

| Hal değişimi | Isı | Su için |
| --- | --- | --- |
| Erime (katı → sıvı) | Alınır | $L_e = 80\ \text{cal/g}$ (0 °C) |
| Donma (sıvı → katı) | Verilir | $80\ \text{cal/g}$ |
| Buharlaşma (sıvı → gaz) | Alınır | $L_b = 540\ \text{cal/g}$ (100 °C) |
| Yoğuşma (gaz → sıvı) | Verilir | $540\ \text{cal/g}$ |

**Örnek.** 50 g buzun 0 °C’de erimesi için $50 \cdot 80 = 4000\ \text{cal}$ gerekir.

**Önemli:** Hal değişimi sıcaklığı basınca ve madde cinsine bağlıdır. Saf maddelerde sabit, karışımlarda değişkendir. Basınç artınca kaynama noktası yükselir.

## 5. Genleşme

Isınan katı, sıvı ve gazlar **genleşir** (hacmi ya da boyu artar). Isıtılınca taneciklerin hareketi artar, aralarındaki ortalama uzaklık büyür.

- **Boyca genleşme:** $\Delta L = L_0 \cdot \alpha \cdot \Delta T$. Demir köprülerin ve tren raylarının birleşim yerlerinde boşluk bırakılması bu nedenledir.
- **Hacimce genleşme:** Sıvılarda ve gazlarda belirgindir. Termometrenin cıva sütununun yükselmesi bu yüzdendir.
- **Suyun anormal genleşmesi:** Su 0 °C’den 4 °C’ye ısınırken **büzülür**, 4 °C’nin üzerinde genleşir. 4 °C’de özkütlesi en büyüktür. Bu yüzden göllerin üstü donsa da dibi yaşamı sürdürür.

## 6. Isı iletim yolları

| Yol | Nasıl | Örnek |
| --- | --- | --- |
| İletim | Taneciklerin çarpışmasıyla, madde yer değiştirmez | Ateşteki metal kaşığın sapının ısınması |
| Konveksiyon (taşınım) | Sıvı ve gazlarda madde akımıyla | Radyatörün odayı ısıtması, kaynayan su |
| Işıma | Madde olmadan, ışınlarla | Güneşin Dünya’yı ısıtması |

Metaller **iyi iletkendir**, tahta, plastik, hava ve yün **yalıtkandır**. Koyu renkli yüzeyler ışımayı daha iyi soğurur.

:::neden-sonuc
- Sıcak ile soğuk cisim temas ediyor => Isı sıcaktan soğuğa akar.
- Isıl denge kuruldu => Sıcaklıklar eşit, ısı akışı durur.
- Hal değişimi sırasında ısı veriliyor => Sıcaklık sabit kalır.
- Cisim ısınıyor => Genleşir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Isı ile sıcaklığı karıştırmak** en sık yapılan hatadır. Bir bardak sıcak su ile bir kova ılık suyu düşün: Bardakta sıcaklık yüksektir ama kovada toplam ısı çoktur. Isı miktara bağlıdır, sıcaklık değildir. Bir de **hal değişimi sırasında sıcaklığın arttığını sanma**: Verilen ısı bu sırada hâli değiştirir, sıcaklığı değil.
:::

:::baglanti
Isı, “İş, Güç ve Enerji” konusunun enerji dönüşümlerinin bir parçasıdır: Sürtünmeyle kaybolan mekanik enerji ısıya dönüşür. “Madde ve Özellikleri” konusunda genleşmenin özkütleyi nasıl değiştirdiğini, kimyada “Maddenin Halleri” konusunda hal değişimlerini bir daha göreceksin.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Sıcaklık | Ortalama kinetik enerji ölçüsü |
| Isı | Aktarılan enerji, J ya da cal |
| Isı alışverişi | $Q = m c \Delta T$ |
| Isıl denge | Alınan ısı = verilen ısı |
| Hal değişimi | $Q = m L$, sıcaklık sabit |
| Genleşme | Isınınca boy ve hacim artar |
| İletim yolları | İletim, konveksiyon, ışıma |

## Mini test

:::soru{cevap="C"}
Sıcaklığı 20 °C olan 200 g su ile sıcaklığı 70 °C olan 300 g su, ısı alışverişi yalnızca birbirleri arasında olacak biçimde karıştırılıyor. Isıl denge sıcaklığı kaç °C olur?

- A) 40
- B) 45
- C) 50
- D) 70
- E) 90

---

1. Aynı madde olduğundan $T = \dfrac{m_1 T_1 + m_2 T_2}{m_1 + m_2}$.
2. $T = \dfrac{200 \cdot 20 + 300 \cdot 70}{500} = \dfrac{25000}{500} = 50\ \text{°C}$. Doğru cevap C.

Diğer şıklar: **40** kütleler ters eşleştirilmiş / **45** iki sıcaklığın aritmetik ortalaması alınmış / **70** sıcak suyun sıcaklığı alınmış / **90** sıcaklıklar toplanmış.
:::

:::soru{cevap="E"}
Öz ısısı $0{,}2\ \text{cal/g°C}$ olan 500 g kütleli metal parçasının sıcaklığı 20 °C’den 60 °C’ye çıkarılıyor. Metalin aldığı ısı kaç kaloridir?

- A) 8
- B) 100
- C) 2500
- D) 3999
- E) 4000

---

1. $Q = m \cdot c \cdot \Delta T$.
2. $\Delta T = 60 - 20 = 40\ \text{°C}$.
3. $Q = 500 \cdot 0{,}2 \cdot 40 = 4000\ \text{cal}$. Doğru cevap E.

Diğer şıklar: **8** öz ısı ile sıcaklık farkı çarpılmış / **100** kütle ile öz ısı çarpılmış, sıcaklık farkı unutulmuş / **2500** kütle öz ısıya bölünmüş / **3999** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="D"}
Isıtılan buz parçasının sıcaklığı 0 °C’ye ulaştıktan sonra ısı verilmeye devam ettiği hâlde bir süre 0 °C’de sabit kalıyor. Bu sırada verilen ısı ne işe yarar?

- A) Buzun sıcaklığını yükseltir
- B) Buzun kütlesini artırır
- C) Buzun özkütlesini azaltır
- D) Buzun hâlini değiştirir
- E) Buzun öz ısısını değiştirir

---

1. Hal değişimi sırasında verilen ısı, taneciklerin düzenini değiştirir, sıcaklığı değil.
2. Bu nedenle erime boyunca sıcaklık sabit kalır.
3. Diğer seçenekler sıcaklığın sabit kalmasıyla çelişir. Doğru cevap D.

Diğer şıklar: **Buzun sıcaklığını yükseltir** sıcaklık sabit kaldığı için doğru olamaz / **Buzun kütlesini artırır** ısı verilmesiyle kütle değişmez / **Buzun özkütlesini azaltır** sıcaklık sabit kalırken özkütle azalmaz, hâl değişir / **Buzun öz ısısını değiştirir** öz ısı maddeyi ayırt eden özelliktir, ısıyla değişmez.
:::

:::soru{cevap="E"}
Isı ve sıcaklıkla ilgili aşağıdaki ifadelerden hangisi **doğrudur**?

- A) Isı ile sıcaklık aynı niceliğin iki farklı adıdır ve aynı aletle ölçülür.
- B) Sıcaklık, bir maddenin içerdiği toplam ısı miktarıdır ve joule ile ölçülür.
- C) Isı, soğuk cisimden sıcak cisme kendiliğinden akar ve sıcaklıkları eşitler.
- D) Isı alışverişinde cisimlerin sıcaklığı her zaman artar, hiçbir zaman azalmaz.
- E) Isı bir enerji türüdür, sıcaklık ise ortalama kinetik enerjinin ölçüsüdür.

---

1. Isı, sıcaklık farkı nedeniyle aktarılan enerjidir.
2. Sıcaklık, taneciklerin ortalama kinetik enerjisinin ölçüsüdür.
3. Diğer ifadeler yanlıştır. Doğru cevap E.

Diğer şıklar: **Isı ile sıcaklık aynı niceliğin iki farklı adıdır ve aynı aletle ölçülür.** ikisi farklı niceliklerdir / **Sıcaklık, bir maddenin içerdiği toplam ısı miktarıdır ve joule ile ölçülür.** toplam ısı miktarı sıcaklık değildir / **Isı, soğuk cisimden sıcak cisme kendiliğinden akar ve sıcaklıkları eşitler.** ısı sıcak cisimden soğuk cisme akar / **Isı alışverişinde cisimlerin sıcaklığı her zaman artar, hiçbir zaman azalmaz.** ısı veren cismin sıcaklığı azalır, hal değişiminde sabit kalır.
:::

## Kendini dene

:::dene
1. 400 g suyun sıcaklığı 10 °C’den 35 °C’ye çıkıyor. Alınan ısı kaç kalori? => $400 \cdot 1 \cdot 25 = 10000$ cal.
2. 127 °C kaç kelvindir? => 400 K.
3. 20 g buzun 0 °C’de erimesi için kaç kalori gerekir? ($L = 80\ \text{cal/g}$) => $20 \cdot 80 = 1600$ cal.
4. Erime sırasında sıcaklık nasıl değişir? => Sabit kalır.
5. Güneşin Dünya’yı ısıtması hangi ısı iletim yoludur? => Işıma.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-fiz' and name = 'Isı ve Sıcaklık'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Isı ve sıcaklık, öz ısı, ısı sığası, ısı alışverişi, ısıl denge, hal değişimi, genleşme, ısı iletim yolları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Hal değişimi ısıları su için verildi. Genleşme katsayısı örnekleri sayısal sorulmadığı için kısa tutuldu. Dördüncü soruda "doğrudur" kök yapısı kullanıldı.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Isı ve Sıcaklık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Kazağı çıkarırken çıtırtı sesi duyar, saçını tarağa değdirince saçının havalandığını görürsün. Bulutlardan yıldırım düşer. Bunların hepsi **durgun elektrik yüklerinin** sonucudur. Elektrostatik, hareket etmeyen (durgun) elektrik yüklerini ve aralarındaki kuvvetleri inceler. Bu konuda elektrik yükünü, yükleme yöntemlerini, iletken ve yalıtkanı, Coulomb yasasını, elektrik alanını ve elektroskobu öğreneceksin.

:::hedefler
1. Elektrik yükünün özelliklerini ve yük korunumunu bilmek.
2. Sürtme, dokunma ve etki ile yüklemeyi açıklamak.
3. İletken ve yalıtkanı ayırt etmek, elektroskopun çalışmasını yorumlamak.
4. Coulomb yasasıyla yükler arasındaki kuvveti hesaplamak.
5. Elektrik alanını ve alan çizgilerini yorumlamak.
:::

:::ipucu
Elektrostatik sorularında **önce yüklerin işaretine bak**. Aynı işaretli yükler birbirini iter, zıt işaretliler çeker. Sonra kuvvetin yönünü şekille belirle. Sayısal sorularda mikrokulon (µC) gibi birimleri **kulona çevirmeyi** unutma: $1\ \text{µC} = 10^{-6}\ \text{C}$.
:::

## 1. Elektrik yükü

Maddeyi oluşturan atomlarda **proton (pozitif)**, **elektron (negatif)** ve **nötron (yüksüz)** bulunur. Proton ve elektronun yük miktarı aynı büyüklüktedir:

$$e = 1{,}6 \cdot 10^{-19}\ \text{C}$$

(C: kulon). Yük birimi **kulon (C)**’dur.

- Bir cisimde proton ve elektron sayısı eşitse cisim **nötr (yüksüz)**dür.
- Elektron kaybeden cisim **pozitif**, elektron kazanan cisim **negatif** yüklenir.
- Yalnızca **elektronlar** hareket eder, protonlar çekirdekte kalır. Yani yük aktarımı **elektron aktarımıdır**.
- Bir cismin yükü $q = n \cdot e$ biçimindedir (n tam sayı): yük **kuantumludur**.

**Yük korunumu:** Yalıtılmış bir sistemde toplam yük değişmez. Yük yoktan var olmaz, vardan yok olmaz, yalnızca bir cisimden diğerine geçer.

**Etkileşim:** Aynı işaretli yükler **iter**, zıt işaretli yükler **çeker**. Yüksüz cisimler yüklü cisimler tarafından **çekilir** (etki ile yüklenme sonucu).

## 2. İletken ve yalıtkan

| Tür | Özellik | Örnek |
| --- | --- | --- |
| İletken | Yükler serbestçe hareket eder | Metaller, grafit, tuzlu su |
| Yalıtkan | Yükler bulundukları yerde kalır | Plastik, cam, lastik, kuru tahta |

**İletken küreye yük verilirse** yükler birbirini ittiği için **yüzeye** dağılır. Yalıtkan cisme verilen yük, verildiği noktada kalır.

## 3. Yükleme yöntemleri

**Sürtünme ile yükleme:** İki yalıtkan cisim birbirine sürtülünce elektron bir cisimden diğerine geçer. Biri pozitif, diğeri negatif yüklenir. **Her iki cisim zıt işaretli ve eşit büyüklükte yüklenir**.

**Dokunma ile yükleme:** Yüklü bir iletken, başka bir iletkene dokunursa yük paylaşılır. Aynı boyutlu (özdeş) iletken kürelerde **toplam yük eşit bölüşülür**.

**Örnek.** $+8\ \text{µC}$ ve $-2\ \text{µC}$ yüklü özdeş iki küre dokundurulursa toplam yük $+6\ \text{µC}$’dir. Ayrıldıklarında her biri $\dfrac{+6}{2} = +3\ \text{µC}$ yüklü olur.

**Etki (indüksiyon) ile yükleme:** Yüklü bir cisim, bir iletkene **dokunmadan** yaklaştırıldığında iletkendeki yükler ayrılır. Yakın uçta zıt işaretli, uzak uçta aynı işaretli yük toplanır. Uzak uca dokunularak (topraklama) elektron alınıp verilirse, iletken **zıt işaretle** yüklenir.

## 4. Elektroskop

**Elektroskop**, bir cismin **yüklü olup olmadığını** ve yükün işaretini anlamaya yarayan alettir. Metal topuz, çubuk ve iki ince metal yapraktan oluşur.

- Yüksüz elektroskopta yapraklar kapalıdır.
- Yüklü bir cisim topuza yaklaştırılırsa ya da dokundurulursa yapraklar **aynı işaretle yüklenir** ve birbirini iterek açılır.
- **Yapraklar ne kadar çok açılırsa yük o kadar büyüktür.**

**Örnek.** Yüksüz elektroskoba pozitif yüklü çubuk dokundurmadan yaklaştırılırsa topuz negatif, yapraklar pozitif olur ve yapraklar açılır. Çubuk uzaklaştırılırsa yapraklar kapanır (geçici yükleme).

## 5. Coulomb yasası

İki nokta yük arasındaki elektriksel kuvvet, yüklerin çarpımı ile doğru, aralarındaki uzaklığın karesi ile ters orantılıdır:

$$F = k \frac{q_1 q_2}{d^2}$$

Burada $k = 9 \cdot 10^9\ \text{N·m}^2/\text{C}^2$ olup $F$ newton, $q$ kulon, $d$ metre cinsindendir.

**Sonuçlar:**

- Yüklerden biri 2 katına çıkarsa kuvvet 2 katına çıkar.
- Uzaklık 2 katına çıkarsa kuvvet $\dfrac{1}{4}$’üne iner. Uzaklık 3 katına çıkarsa $\dfrac{1}{9}$’una iner.
- Kuvvetler etki-tepki çiftidir: Kütle ve yük ne olursa olsun **eşit büyüklükte, zıt yönlüdür**.

**Örnek.** $q_1 = 2\ \text{µC}$, $q_2 = 3\ \text{µC}$, $d = 30\ \text{cm} = 0{,}3\ \text{m}$:

$$F = 9 \cdot 10^9 \cdot \frac{2 \cdot 10^{-6} \cdot 3 \cdot 10^{-6}}{0{,}3^2} = 9 \cdot 10^9 \cdot \frac{6 \cdot 10^{-12}}{0{,}09} = 0{,}6\ \text{N}$$

## 6. Elektrik alanı

Bir yükün çevresinde, başka yüklere kuvvet uygulayabildiği bölgeye **elektrik alanı** denir. Bir noktadaki alan, o noktaya konan **birim pozitif yüke** etki eden kuvvettir:

$$E = \frac{F}{q} \quad (\text{N/C}), \qquad E = k \frac{Q}{d^2}$$

![Pozitif yükün alan çizgileri dışarı, negatif yükün alan çizgileri içeri doğrudur](/lessons/tyt-fiz/elektrik-alan.svg "Elektrik alan çizgileri | Yolumnet")

- Alan çizgileri **pozitiften çıkar, negatifte biter**.
- Çizgiler hiçbir noktada **kesişmez**. Sık olduğu yerde alan **şiddetlidir**.
- Alandaki yüke etki eden kuvvet $F = q \cdot E$’dir. Pozitif yüke alan yönünde, negatif yüke zıt yönde etki eder.

**Örnek.** Şiddeti $3000\ \text{N/C}$ olan alana $2\ \text{µC}$’luk yük konulursa kuvvet $2 \cdot 10^{-6} \cdot 3000 = 6 \cdot 10^{-3}\ \text{N}$ olur.

:::neden-sonuc
- İki yük aynı işaretli => Birbirini iter.
- İki yük zıt işaretli => Birbirini çeker.
- İki özdeş iletken küre dokunuyor => Toplam yük eşit bölüşülür.
- Uzaklık 3 katına çıkıyor => Kuvvet $\tfrac{1}{9}$’una iner.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Elektronların yerine protonların hareket ettiğini sanmak** sık yapılan bir hatadır. Yalnızca elektronlar hareket eder. Bir de **Coulomb yasasında uzaklığın karesini** unutmak ve **cm’yi metreye çevirmemek**, µC’yi C’ye çevirmemek sayısal hatalara neden olur. Dokunma ile yük paylaşımında **işaretleri de topla**: $+8$ ile $-2$’nin toplamı $+6$’dır.
:::

:::baglanti
Elektrostatik, “Elektrik ve Manyetizma” konusunda akım ve devre kavramlarına geçişin ilk adımıdır: Akım, hareket eden yüklerdir. Kimyada “Atom ve Periyodik Sistem” konusunda proton ve elektron sayısı, “Kimyasal Türler Arası Etkileşimler” konusunda iyonik bağ burada öğrendiğin çekim ve itme kuvvetlerine dayanır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yük | $e = 1{,}6 \cdot 10^{-19}\ \text{C}$, elektron hareket eder |
| Yük korunumu | Toplam yük sabit |
| İletken | Yük serbestçe hareket eder |
| Dokunma | Özdeş kürelerde eşit paylaşım |
| Coulomb | $F = k q_1 q_2 / d^2$ |
| Elektrik alan | $E = F / q$ |
| Alan çizgileri | Pozitiften çıkar, negatifte biter |

## Mini test

:::soru{cevap="D"}
Yükleri $+8\ \text{µC}$ ve $-2\ \text{µC}$ olan özdeş iki iletken küre birbirine dokundurulup ayrılıyor. Ayrıldıktan sonra her bir kürenin yükü kaç µC olur?

- A) $-$6 µC
- B) $-$3 µC
- C) 0 µC
- D) +3 µC
- E) +5 µC

---

1. Toplam yük $+8 + (-2) = +6\ \text{µC}$.
2. Özdeş iletken küreler yükü eşit paylaşır: $\dfrac{+6}{2} = +3\ \text{µC}$. Doğru cevap D.

Diğer şıklar: **$-$6 µC** toplam yükün işareti ters alınmış / **$-$3 µC** işaret hatası yapılmış / **0 µC** yükler birbirini yok etmiş sanılmış / **+5 µC** işaretler yanlış toplanıp $\dfrac{8 + 2}{2}$ yapılmış.
:::

:::soru{cevap="A"}
İki noktasal yük arasındaki uzaklık 3 katına çıkarılırsa yükler arasındaki elektriksel kuvvet kaç katına çıkar?

- A) $\dfrac{1}{9}$
- B) $\dfrac{1}{6}$
- C) $\dfrac{1}{3}$
- D) 3
- E) 9

---

1. Coulomb yasasında $F \sim \dfrac{1}{d^2}$.
2. Uzaklık 3 katına çıkarsa kuvvet $\dfrac{1}{3^2} = \dfrac{1}{9}$ katına iner. Doğru cevap A.

Diğer şıklar: **$\dfrac{1}{6}$** uzaklığın karesi yerine 2 katı alınmış / **$\dfrac{1}{3}$** kuvvetin uzaklıkla ters orantılı olduğu sanılmış / **3** kuvvetin uzaklıkla doğru orantılı olduğu sanılmış / **9** kuvvetin uzaklığın karesiyle doğru orantılı olduğu sanılmış.
:::

:::soru{cevap="D"}
$q_1 = 2\ \text{µC}$ ve $q_2 = 3\ \text{µC}$ yüklü iki noktasal yük, 30 cm aralıkla bulunuyor. Yükler arasındaki elektriksel kuvvet kaç N’dur? ($k = 9 \cdot 10^9\ \text{N·m}^2/\text{C}^2$)

- A) 0,054 N
- B) 0,18 N
- C) 0,3 N
- D) 0,6 N
- E) 1,2 N

---

1. Birimler: $q_1 = 2 \cdot 10^{-6}\ \text{C}$, $q_2 = 3 \cdot 10^{-6}\ \text{C}$, $d = 0{,}3\ \text{m}$.
2. $F = 9 \cdot 10^9 \cdot \dfrac{6 \cdot 10^{-12}}{0{,}09} = 0{,}6\ \text{N}$. Doğru cevap D.

Diğer şıklar: **0,054 N** uzaklık hesaba katılmamış / **0,18 N** uzaklığın karesi alınmamış / **0,3 N** kuvvet 2 ye bölünmüş / **1,2 N** kuvvet 2 ile çarpılmış.
:::

:::soru{cevap="D"}
Yüksüz bir elektroskobun topuzuna pozitif yüklü bir çubuk dokundurulmadan yaklaştırılıyor. Elektroskop yapraklarıyla ilgili aşağıdakilerden hangisi doğrudur?

- A) Yapraklar negatif yüklenir ve açılır.
- B) Yapraklar yüksüz kalır ve kapalı durur.
- C) Yapraklar önce kapanır, sonra açılır.
- D) Yapraklar pozitif yüklenir ve açılır.
- E) Topuz pozitif, yapraklar negatif olur.

---

1. Pozitif çubuk, elektronları topuza çeker. Topuz negatif olur.
2. Elektronlar yapraklardan ayrıldığı için yapraklar pozitif yüklenir ve birbirini iterek açılır.
3. Çubuk uzaklaştırılırsa yapraklar kapanır. Doğru cevap D.

Diğer şıklar: **Yapraklar negatif yüklenir ve açılır.** elektronlar topuza çekilir, yapraklar pozitif olur / **Yapraklar yüksüz kalır ve kapalı durur.** etki ile yük ayrışması nedeniyle yapraklar yüklenir / **Yapraklar önce kapanır, sonra açılır.** yapraklar yaklaştırma sırasında açılır, kapanıp açılmaz / **Topuz pozitif, yapraklar negatif olur.** topuz negatif, yapraklar pozitif olur.
:::

## Kendini dene

:::dene
1. Aynı işaretli iki yük birbirine nasıl kuvvet uygular? => İter.
2. $+6\ \text{µC}$ ve $0$ yüklü özdeş iletken küreler dokundurulursa her birinin yükü kaç µC olur? => $+3\ \text{µC}$.
3. İki yük arasındaki uzaklık 2 katına çıkarsa kuvvet nasıl değişir? => $\tfrac{1}{4}$’üne iner.
4. Elektroskopun yaprakları neden açılır? => Yapraklar aynı işaretle yüklenir ve birbirini iter.
5. Elektrik alan çizgileri hangi yükten çıkar? => Pozitif yükten.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-fiz' and name = 'Elektrostatik'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Elektrik yükü, yük korunumu, iletken ve yalıtkan, sürtme, dokunma ve etki ile yükleme, elektroskop, Coulomb yasası, elektrik alanı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Elektriksel potansiyel enerji ve potansiyel farkı bu konuya alınmadı. Elektrik alanının vektörel toplamı (birden çok yük) metne eklenmedi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Elektrostatik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Telefonun şarj olurken içinden **akım** geçer. Fişi prize takınca ampul yanar. Pusula iğnesi hep kuzeyi gösterir. Hepsinin ortak noktası, elektrik ve manyetizmanın birbirine bağlı olmasıdır: Akım manyetik alan oluşturur, değişen manyetik alan akım oluşturur. Bu konuda elektrik akımını, gerilimi, direnci, Ohm yasasını, seri ve paralel bağlamayı, elektriksel gücü ve manyetizmanın temellerini öğreneceksin.

:::hedefler
1. Akım, gerilim ve direnç kavramlarını tanımak.
2. Ohm yasasını uygulamak.
3. Seri ve paralel bağlı dirençlerin eşdeğerini bulmak.
4. Elektriksel gücü ve enerjiyi hesaplamak.
5. Mıknatısları, manyetik alanı ve akımın manyetik etkisini açıklamak.
:::

:::ipucu
Devre sorularında **önce eşdeğer direnci bul**, sonra Ohm yasasıyla toplam akımı hesapla. Seri devrede **akım aynı**, paralel devrede **gerilim aynıdır**. Bu iki kural neredeyse her sorunun anahtarıdır.
:::

## 1. Elektrik akımı, gerilim ve direnç

**Elektrik akımı ($I$):** Bir iletkenin kesitinden **birim zamanda geçen yük miktarıdır**:

$$I = \frac{q}{t}$$

Birimi **amper (A)**’dir: $1\ \text{A} = 1\ \text{C/s}$. 60 saniyede 120 C yük geçerse akım $\dfrac{120}{60} = 2\ \text{A}$.

**Potansiyel farkı (gerilim, $V$):** Akımı oluşturan etkidir, pilin ya da üretecin **birim yük başına verdiği enerjidir**. Birimi **volt (V)**’tur. Gerilim **voltmetre** ile ölçülür ve ölçülecek elemana **paralel** bağlanır.

**Direnç ($R$):** İletkenin akıma gösterdiği zorluktur. Birimi **ohm (Ω)**’dur. Direnç şu şekilde bulunur:

$$R = \rho \frac{\ell}{A}$$

Burada $\rho$ özdirenç (maddeye bağlı), $\ell$ iletkenin boyu, $A$ kesit alanıdır. **Tel uzadıkça direnç artar, kalınlaştıkça azalır.**

Akım **ampermetre** ile ölçülür ve **seri** bağlanır.

## 2. Ohm yasası

Sabit sıcaklıkta bir iletkenin uçları arasındaki gerilim, içinden geçen akımla doğru orantılıdır:

$$V = I \cdot R$$

**Örnek.** 12 V gerilim, 4 Ω dirençten $I = \dfrac{12}{4} = 3\ \text{A}$ akım geçirir.

**Gerilim-akım grafiği:** Doğrusaldır, eğim direnci verir.

## 3. Seri ve paralel bağlama

![Seri bağlı iki direnç ve paralel bağlı iki direnç devre şemaları](/lessons/tyt-fiz/devre-seri-paralel.svg "Seri ve paralel devre | Yolumnet")

| | Seri | Paralel |
| --- | --- | --- |
| Akım | Her yerde aynı | Kollara bölünür |
| Gerilim | Dirençlere bölünür | Her kolda aynı |
| Eşdeğer direnç | $R = R_1 + R_2$ | $\dfrac{1}{R} = \dfrac{1}{R_1} + \dfrac{1}{R_2}$ |
| Eşdeğer direnç | En büyük dirençten büyük | En küçük dirençten küçük |

**Örnek (seri).** $R_1 = 3\ \Omega$ ve $R_2 = 6\ \Omega$ seri ve 18 V’a bağlı. $R = 9\ \Omega$, akım $\dfrac{18}{9} = 2\ \text{A}$. Gerilimler: $V_1 = 2 \cdot 3 = 6\ \text{V}$, $V_2 = 2 \cdot 6 = 12\ \text{V}$. Toplam 18 V.

**Örnek (paralel).** Aynı iki direnç 12 V’a paralel bağlı. Her koldaki gerilim 12 V: $I_1 = \dfrac{12}{3} = 4\ \text{A}$, $I_2 = \dfrac{12}{6} = 2\ \text{A}$. Ana kolda $4 + 2 = 6\ \text{A}$ geçer. Eşdeğer direnç $\dfrac{3 \cdot 6}{3 + 6} = 2\ \Omega$ ve $I = \dfrac{12}{2} = 6\ \text{A}$.

**İki dirençte paralel kısa yol:** $R = \dfrac{R_1 R_2}{R_1 + R_2}$. Eşit $n$ direnç paralelse $R = \dfrac{R_1}{n}$.

## 4. Elektriksel güç ve enerji

Bir alıcının birim zamanda harcadığı elektrik enerjisine **elektriksel güç** denir:

$$P = V \cdot I = I^2 R = \frac{V^2}{R}$$

Birimi **watt (W)**.

**Örnek.** 12 V’a bağlı 4 Ω’luk rezistansın gücü $\dfrac{12^2}{4} = 36\ \text{W}$.

**Elektrik enerjisi:** $E = P \cdot t$. Faturadaki birim **kilowatt-saat (kWh)**’tir. 2 kW’lık cihaz 3 saat çalışırsa $2 \cdot 3 = 6\ \text{kWh}$ enerji harcar.

**Paralel bağlı lambalar:** Her lamba şebeke geriliminde çalışır, biri bozulunca diğerleri yanmaya devam eder. Evlerdeki aletler bu yüzden **paralel** bağlanır.

## 5. Manyetizma

**Mıknatıs:** Demir, nikel, kobalt gibi maddeleri çeken cisimlerdir. Her mıknatısın **iki kutbu** vardır: **N (kuzey)** ve **S (güney)**.

- Aynı kutuplar **iter**, zıt kutuplar **çeker**.
- Bir mıknatıs ikiye bölünürse her parça **yine iki kutuplu** mıknatıs olur. Tek kutup elde edilemez.
- Mıknatısın çevresinde **manyetik alan** vardır. Alan çizgileri **dışarıda N’den S’ye**, içeride S’den N’ye doğrudur. Çizgiler kesişmez ve kutuplarda yoğunlaşır.

![Çubuk mıknatısın manyetik alan çizgileri: dışarıda N kutbundan S kutbuna](/lessons/tyt-fiz/miknatis-alan.svg "Manyetik alan çizgileri | Yolumnet")

**Dünya’nın manyetik alanı:** Dünya büyük bir mıknatıs gibidir. Pusula iğnesinin N kutbu coğrafi kuzeyi gösterir. Çünkü coğrafi kuzeyde Dünya’nın manyetik **güney** kutbu bulunur.

**Akımın manyetik etkisi (Oersted):** Akım taşıyan bir telin çevresinde manyetik alan oluşur. Alanın yönü **sağ el kuralı** ile bulunur: Başparmak akım yönünü gösterirse kıvrılan parmaklar alanın yönünü gösterir. **Akım artarsa alan artar**.

**Elektromıknatıs:** Çekirdeği demir olan bir bobinden akım geçirilirse mıknatıs özelliği kazanılır. **Akım şiddeti**, **sarım sayısı** ve **demir çekirdek** artınca gücü artar. Akım kesilince özelliğini kaybeder. Zil, elektrik motoru, vinç, hoparlör gibi cihazlarda kullanılır.

:::neden-sonuc
- Seri bağlama => Akım her yerde aynı, eşdeğer direnç büyür.
- Paralel bağlama => Gerilim her kolda aynı, eşdeğer direnç küçülür.
- Tel uzatılıyor => Direnç artar.
- Bobinden akım geçiyor => Manyetik alan oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Seri ile paralelde akım ve gerilimi karıştırmak** en sık yapılan hatadır. Seride akım aynı, gerilim bölünür. Paralelde gerilim aynı, akım bölünür. Ayrıca **ampermetreyi paralel**, **voltmetreyi seri** bağlamak devreyi bozar: Ampermetre seri, voltmetre paralel bağlanır. Bir de mıknatısı ikiye bölünce tek kutuplu parçalar oluştuğunu sanma.
:::

:::baglanti
Elektrik, “Elektrostatik” konusundaki yük kavramının devamıdır: Akım, hareket eden yüklerdir. Elektrik enerjisi “İş, Güç ve Enerji” konusundaki güç ve enerji bağıntılarına uyar. Mıknatıs ve manyetik alan, “Dalgalar” ve “Optik” konularında elektromanyetik dalgaların temelini oluşturur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Akım | $I = q / t$, birimi A |
| Ohm yasası | $V = I R$ |
| Seri | $R = R_1 + R_2$, akım aynı |
| Paralel | $1/R = 1/R_1 + 1/R_2$, gerilim aynı |
| Güç | $P = V I = V^2 / R$ |
| Mıknatıs | Aynı kutup iter, zıt kutup çeker |
| Elektromıknatıs | Bobin, demir çekirdek, akım |

## Mini test

:::soru{cevap="D"}
Direnci $3\ \Omega$ ve $6\ \Omega$ olan iki direnç birbirine seri bağlanıp $18\ \text{V}$’luk bir üretece bağlanıyor. $6\ \Omega$’luk direncin uçları arasındaki gerilim kaç V’tur?

- A) 3
- B) 6
- C) 9
- D) 12
- E) 18

---

1. Eşdeğer direnç $R = 3 + 6 = 9\ \Omega$ ve akım $I = \dfrac{18}{9} = 2\ \text{A}$.
2. Seride akım aynıdır: $V_2 = I \cdot R_2 = 2 \cdot 6 = 12\ \text{V}$. Doğru cevap D.

Diğer şıklar: **3** $3\ \Omega$’luk direncin değeri alınmış / **6** $3\ \Omega$’luk direncin gerilimi alınmış / **9** iki gerilimin ortalaması alınmış / **18** üretecin gerilimi alınmış.
:::

:::soru{cevap="B"}
Direnci $3\ \Omega$ ve $6\ \Omega$ olan iki direnç birbirine paralel bağlanıp $12\ \text{V}$’luk bir üretece bağlanıyor. Üreteçten çekilen toplam akım kaç A’dır?

- A) 4
- B) 6
- C) 7
- D) 9
- E) 12

---

1. Paralelde gerilim her kolda 12 V'tur.
2. $I_1 = \dfrac{12}{3} = 4\ \text{A}$ ve $I_2 = \dfrac{12}{6} = 2\ \text{A}$.
3. Toplam akım $4 + 2 = 6\ \text{A}$. Doğru cevap B.

Diğer şıklar: **4** yalnızca $3\ \Omega$’luk koldaki akım alınmış / **7** işlem hatasıyla bir fazla bulunmuş / **9** seri bağlamadaki eşdeğer direnç alınmış / **12** üretecin gerilimi alınmış.
:::

:::soru{cevap="C"}
Direnci $4\ \Omega$ olan bir rezistans $12\ \text{V}$’luk gerilime bağlanıyor. Rezistansın gücü kaç W’tır?

- A) 3
- B) 16
- C) 36
- D) 48
- E) 144

---

1. $P = \dfrac{V^2}{R} = \dfrac{12^2}{4} = 36\ \text{W}$.
2. Aynı sonuç: $I = \dfrac{12}{4} = 3\ \text{A}$ ve $P = V \cdot I = 12 \cdot 3 = 36\ \text{W}$. Doğru cevap C.

Diğer şıklar: **3** akım güç sanılmış / **16** direncin karesi alınmış / **48** gerilim ile direnç çarpılmış / **144** gerilimin karesi dirence bölünmemiş.
:::

:::soru{cevap="C"}
Bir çubuk mıknatıs ortasından ikiye kesiliyor. Elde edilen parçalarla ilgili aşağıdakilerden hangisi doğrudur?

- A) Bir parça yalnızca N, diğeri yalnızca S kutbu taşır.
- B) Parçalar mıknatıs özelliğini tamamen kaybeder.
- C) Her parça yine N ve S kutuplu bir mıknatıs olur.
- D) Parçalardan biri nötr, diğeri çift kutuplu olur.
- E) Parçaların kutupları birbirine göre yer değiştirir.

---

1. Mıknatısın kutupları ayrılamaz.
2. Ortadan kesilen çubuk mıknatısın her parçası, yeni N ve S kutupları kazanarak ayrı bir mıknatıs olur.
3. Doğru cevap C.

Diğer şıklar: **Bir parça yalnızca N, diğeri yalnızca S kutbu taşır.** tek kutuplu mıknatıs elde edilemez / **Parçalar mıknatıs özelliğini tamamen kaybeder.** bölününce mıknatıs özelliği kalır / **Parçalardan biri nötr, diğeri çift kutuplu olur.** her iki parça da çift kutupludur / **Parçaların kutupları birbirine göre yer değiştirir.** kutup yer değiştirmesi olmaz.
:::

## Kendini dene

:::dene
1. 20 saniyede 100 C yük geçen telde akım kaç A’dır? => $100 / 20 = 5$ A.
2. 6 Ω’luk dirençten 2 A akım geçerse gerilim kaç V’tur? => $6 \cdot 2 = 12$ V.
3. 4 Ω ve 12 Ω seri bağlı ise eşdeğer direnç kaçtır? => 16 Ω.
4. 6 Ω ve 6 Ω paralel bağlı ise eşdeğer direnç kaçtır? => 3 Ω.
5. Bir mıknatısın aynı kutupları birbirine yaklaştırılırsa ne olur? => Birbirini iter.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-fiz' and name = 'Elektrik ve Manyetizma'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Elektrik akımı, gerilim, direnç, Ohm yasası, seri ve paralel bağlama, elektriksel güç ve enerji, mıknatıs, manyetik alan, akımın manyetik etkisi, elektromıknatıs. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekiller ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Manyetik kuvvet ve indüksiyon (Faraday) metne alınmadı, bunlar AYT kapsamındadır. Karma devreler tek bir örnekle verilmedi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Elektrik ve Manyetizma'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden karlı arazide yürürken kar ayakkabısı giyilir? Neden keskin bir bıçak, kör bir bıçaktan daha kolay keser? Gemiler yüzlerce ton çelik olduğu hâlde neden batmaz, bir taş neden hemen batar? Bunların cevabı **basınç** ve **kaldırma kuvvetinde** saklıdır. Bu konuda katı, sıvı ve gaz basıncını, Pascal ilkesini, açık hava basıncını, kaldırma kuvvetini ve yüzme-batma koşullarını öğreneceksin.

:::hedefler
1. Katı basıncını hesaplamak ve kuvvet ile alanın etkisini yorumlamak.
2. Sıvı basıncını hesaplamak ve derinlik ile özkütle ilişkisini kurmak.
3. Pascal ilkesini ve hidrolik sistemi kullanmak.
4. Açık hava basıncını tanımak.
5. Kaldırma kuvvetini hesaplamak, yüzme ve batma koşullarını belirlemek.
:::

:::ipucu
Basınç sorularında **önce kuvvetin yüzeye dik olduğunu** doğrula. Katı basıncında $P = F / A$ ile işlem yaparken alanı **$\text{m}^2$’ye** çevir. Sıvı basıncında **derinlik** (sıvı yüzeyinden olan düşey uzaklık) esastır. Kabın şekli ve içindeki sıvı miktarı basıncı değiştirmez.
:::

## 1. Katı basıncı

**Basınç**, yüzeye dik etki eden kuvvetin birim yüzeye düşen miktarıdır:

$$P = \frac{F}{A}$$

Birimi **pascal (Pa)**: $1\ \text{Pa} = 1\ \text{N/m}^2$.

**Örnek.** 200 N’luk dik kuvvet $0{,}5\ \text{m}^2$’lik alana etki ederse $P = \dfrac{200}{0{,}5} = 400\ \text{Pa}$. Alan yarıya düşerse basınç **iki katına** çıkar.

- Kuvvet sabitken alan küçülürse basınç **artar** (iğne, bıçak, çivi).
- Alan sabitken kuvvet artarsa basınç **artar**.
- Alan büyüdükçe basınç **azalır** (kar ayakkabısı, tank paletleri, geniş ayakkabı topukları).

Katı cisimler basıncı **yalnızca temas ettikleri yüzeye** iletir ve kuvveti **aynen** yüzeye aktarır. Sıvı ve gazlar basıncı **her yöne** iletir.

## 2. Sıvı basıncı

Sıvı, bulunduğu kabın tabanına ve yan duvarlarına **ağırlığından dolayı basınç** uygular. Sıvı içindeki bir noktada basınç:

$$P = h \cdot d \cdot g$$

($h$: derinlik, $d$: sıvının özkütlesi, $g = 10\ \text{m/s}^2$).

**Örnek.** Suyun ($d = 1000\ \text{kg/m}^3$) 5 m derinliğindeki basıncı $5 \cdot 1000 \cdot 10 = 50000\ \text{Pa}$.

**Sıvı basıncının özellikleri:**

- Derinlikle **doğru orantılı** artar. Derine inen dalgıç daha büyük basınç hisseder.
- Sıvının özkütlesiyle **doğru orantılıdır**.
- Aynı sıvıda **aynı derinlikteki** noktaların basıncı eşittir.
- Kabın **şekline ve sıvı miktarına** bağlı değildir. Geniş ve dar kapta eşit yükseklikte aynı sıvı, tabana aynı basıncı uygular.
- Sıvı basıncı **her yöne** iletilir.

**Toplam basınç:** Açık kapta, sıvı içinde bir noktadaki toplam basınç, **sıvı basıncı + açık hava basıncıdır**: $P_{\text{top}} = P_0 + h d g$.

## 3. Pascal ilkesi ve hidrolik

**Pascal ilkesi:** Kapalı kaptaki sıvıya uygulanan basınç, sıvının **her noktasına aynen iletilir**.

**Hidrolik sistem:** İki pistonu bir sıvıyla bağlı sistemde küçük pistona uygulanan basınç büyük pistona aynen iletilir:

$$\frac{F_1}{A_1} = \frac{F_2}{A_2}$$

**Örnek.** Küçük piston alanı $10\ \text{cm}^2$, büyük piston alanı $200\ \text{cm}^2$. Küçük pistona 50 N uygulanırsa büyük pistonda kuvvet $F_2 = 50 \cdot \dfrac{200}{10} = 1000\ \text{N}$ olur. Kuvvet 20 katına çıkar ama küçük piston 20 kat daha fazla yol alır. **İş korunur**, hidrolik düzenek iş kazandırmaz. Hidrolik kriko, fren sistemi, kaldırma platformları bu ilkeyle çalışır.

## 4. Açık hava basıncı

Dünya’yı saran hava tabakasının ağırlığı **açık hava basıncını** oluşturur. Deniz seviyesinde **yaklaşık $10^5\ \text{Pa}$** (76 cmHg) olup yükseldikçe azalır. Torricelli deneyi ile ölçülür: Bir ucu kapalı cam boru civayla doldurulup ters çevrilince civa yaklaşık 76 cm yükseklikte durur.

Pipetle içecek içmek, vantuz, enjektör ve barometre açık hava basıncıyla açıklanır.

## 5. Kaldırma kuvveti

Bir sıvıya (ya da gaza) batırılan cisme sıvının uyguladığı **yukarı yönlü kuvvet** kaldırma kuvvetidir. Arşimet ilkesine göre kaldırma kuvveti, **cismin batan hacminin yer değiştirdiği sıvının ağırlığına eşittir**:

$$F_k = V_{\text{batan}} \cdot d_{\text{sıvı}} \cdot g$$

**Örnek.** $2\ \text{L} = 0{,}002\ \text{m}^3$ hacimli cisim tamamen suya batırılırsa $F_k = 0{,}002 \cdot 1000 \cdot 10 = 20\ \text{N}$.

**Dinamometre ile ölçüm:** Havada 30 N, suda 20 N gösteren dinamometrede kaldırma kuvveti $30 - 20 = 10\ \text{N}$. Hacim $\dfrac{10}{1000 \cdot 10} = 0{,}001\ \text{m}^3 = 1\ \text{L}$, cismin özkütlesi $\dfrac{30}{10 \cdot 0{,}001} = 3000\ \text{kg/m}^3$.

## 6. Yüzme, askıda kalma, batma

![Üç kap: batan cisimde ağırlık kaldırma kuvvetinden büyük, askıda kalan ve yüzen cisimde eşit](/lessons/tyt-fiz/kaldirma-kuvveti.svg "Batma ve yüzme | Yolumnet")

| Durum | Ağırlık - kaldırma | Özkütle |
| --- | --- | --- |
| Batar | $G > F_k$ | $d_{\text{cisim}} > d_{\text{sıvı}}$ |
| Askıda kalır | $G = F_k$ (tamamen batmış) | $d_{\text{cisim}} = d_{\text{sıvı}}$ |
| Yüzer | $G = F_k$ (kısmen batmış) | $d_{\text{cisim}} < d_{\text{sıvı}}$ |

**Yüzen cismin batan hacim oranı:**

$$\frac{V_{\text{batan}}}{V_{\text{cisim}}} = \frac{d_{\text{cisim}}}{d_{\text{sıvı}}}$$

**Örnek.** Özkütlesi $600\ \text{kg/m}^3$ olan cisim suda yüzerse hacminin $\dfrac{600}{1000} = 0{,}6$’sı, yani **%60**’ı batar, %40’ı dışarıda kalır.

Gemiler, içi boş olduğu için ortalama özkütleleri suyun özkütlesinden küçüktür ve yüzer.

:::neden-sonuc
- Kuvvet aynı, alan küçülüyor => Basınç artar.
- Derinlik artıyor => Sıvı basıncı artar.
- Cismin özkütlesi sıvınınkinden büyük => Cisim batar.
- Cismin özkütlesi sıvınınkinden küçük => Cisim yüzer.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Sıvı basıncının kabın şekline bağlı olduğunu sanmak** çok yapılan bir hatadır. Basınç yalnızca derinliğe, sıvının özkütlesine ve yerçekimine bağlıdır. Ayrıca **kaldırma kuvvetinin cismin özkütlesine bağlı olduğunu** sanma: $F_k = V_{\text{batan}} d_{\text{sıvı}} g$ formülünde sıvının özkütlesi geçer, cismin özkütlesi değil. Cismin özkütlesi yalnızca batma ya da yüzme durumunu belirler.
:::

:::baglanti
Basınç ve kaldırma kuvveti, “Hareket ve Kuvvet” konusundaki kuvvet dengesinin uygulamasıdır: Yüzen cisimde ağırlık ve kaldırma kuvveti dengededir. “Madde ve Özellikleri” konusundaki özkütle, batma ve yüzmeyi belirler. Kimyada “Maddenin Halleri” konusunda gaz basıncını bir daha göreceksin.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Katı basıncı | $P = F / A$ |
| Sıvı basıncı | $P = h d g$ |
| Pascal | Basınç aynen iletilir |
| Hidrolik | $F_1 / A_1 = F_2 / A_2$ |
| Açık hava basıncı | Yaklaşık $10^5$ Pa, 76 cmHg |
| Kaldırma kuvveti | $F_k = V_{\text{batan}} d_{\text{sıvı}} g$ |
| Batma | $d_{\text{cisim}} > d_{\text{sıvı}}$ |

## Mini test

:::soru{cevap="C"}
Yüzeye dik doğrultuda etki eden 80 N’luk kuvvet, $0{,}02\ \text{m}^2$’lik bir alana uygulanıyor. Alana uygulanan basınç kaç Pa’dır?

- A) 20
- B) 400
- C) 4000
- D) 40000
- E) 400000

---

1. $P = \dfrac{F}{A}$.
2. $P = \dfrac{80}{0{,}02} = 4000\ \text{Pa}$. Doğru cevap C.

Diğer şıklar: **20** alan 4 $\text{m}^2$ alınmış / **400** alan 0,2 $\text{m}^2$ alınmış / **40000** alan 0,002 $\text{m}^2$ alınmış / **400000** alan 0,0002 $\text{m}^2$ alınmış.
:::

:::soru{cevap="E"}
Özkütlesi $800\ \text{kg/m}^3$ olan bir yağın 5 m derinliğindeki sıvı basıncı kaç Pa’dır? ($g = 10\ \text{m/s}^2$)

- A) 4000
- B) 8000
- C) 20000
- D) 39999
- E) 40000

---

1. Sıvı basıncı $P = h \cdot d \cdot g$.
2. $P = 5 \cdot 800 \cdot 10 = 40000\ \text{Pa}$. Doğru cevap E.

Diğer şıklar: **4000** yerçekimi ivmesi hesaba katılmamış / **8000** derinlik ile ivme çarpılıp özkütle unutulmuş / **20000** işlem hatasıyla yarısı bulunmuş / **39999** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="D"}
Hidrolik bir sistemde küçük pistonun alanı $20\ \text{cm}^2$, büyük pistonun alanı $100\ \text{cm}^2$’dir. Küçük pistona 50 N’luk kuvvet uygulanırsa büyük pistonda oluşan kuvvet kaç N olur?

- A) 5
- B) 10
- C) 50
- D) 250
- E) 1000

---

1. Pascal ilkesine göre $\dfrac{F_1}{A_1} = \dfrac{F_2}{A_2}$.
2. $F_2 = 50 \cdot \dfrac{100}{20} = 250\ \text{N}$. Doğru cevap D.

Diğer şıklar: **5** alanlar oranı alınmış / **10** oran ters kurulmuş / **50** kuvvetin aynen iletildiği sanılmış / **1000** kuvvet ile küçük piston alanı çarpılmış.
:::

:::soru{cevap="C"}
Özkütlesi $600\ \text{kg/m}^3$ olan homojen bir cisim, özkütlesi $1000\ \text{kg/m}^3$ olan suda dengede yüzüyor. Cismin hacminin yüzde kaçı suyun içindedir?

- A) 36
- B) 40
- C) 60
- D) 100
- E) 167

---

1. Yüzen cismin batan hacim oranı $\dfrac{d_{\text{cisim}}}{d_{\text{sıvı}}}$ kadardır.
2. $\dfrac{600}{1000} = 0{,}6$, yani hacmin %60'ı suyun içindedir. Doğru cevap C.

Diğer şıklar: **36** oranın karesi alınmış / **40** dışarıda kalan hacmin yüzdesi alınmış / **100** cismin tamamen battığı sanılmış / **167** oran ters kurulmuş.
:::

## Kendini dene

:::dene
1. 300 N’luk kuvvet $0{,}1\ \text{m}^2$’lik alana dik etki ederse basınç kaç Pa’dır? => 3000 Pa.
2. Suyun 3 m derinliğindeki basıncı kaç Pa’dır? ($g = 10$) => $3 \cdot 1000 \cdot 10 = 30000$ Pa.
3. Basınç, kuvvet sabitken alan yarıya inerse nasıl değişir? => 2 katına çıkar.
4. $0{,}003\ \text{m}^3$ hacimli cisim tamamen suya batırılırsa kaldırma kuvveti kaç N’dur? => $0{,}003 \cdot 1000 \cdot 10 = 30$ N.
5. Özkütlesi suyunkinden büyük olan cisim suda ne yapar? => Batar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-fiz' and name = 'Basınç ve Kaldırma Kuvveti'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Katı basıncı, sıvı basıncı, Pascal ilkesi, hidrolik sistem, açık hava basıncı, kaldırma kuvveti, yüzme, batma ve askıda kalma. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Gaz basıncı (kapalı kap) metne alınmadı, kimya konusunda yer alacak. U borusu soruları sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Basınç ve Kaldırma Kuvveti'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Taşı suya attığında halkalar yayılır, gitar teli titreşince ses duyarsın, telefonun ve radyonun dalgalarla haberleşir, güneş ışığı da bir dalgadır. **Dalga**, enerjiyi bir yerden başka bir yere **madde taşımadan** ileten titreşim hareketidir. Bu konuda dalgaların türlerini, özelliklerini, su ve yay dalgalarındaki yansıma ile kırılmayı, ses dalgalarını ve elektromanyetik dalgaları öğreneceksin.

:::hedefler
1. Dalga türlerini (mekanik, elektromanyetik, enine, boyuna) ayırt etmek.
2. Genlik, dalga boyu, periyot ve frekansı tanımak.
3. $v = \lambda \cdot f$ bağıntısını kullanmak.
4. Su dalgalarında yansıma ve kırılmayı yorumlamak.
5. Ses dalgalarının özelliklerini ve yankı hesabını yapmak.
:::

:::ipucu
Dalga sorularında önce **neyin değiştiğini ve neyin sabit kaldığını** belirle. Dalga bir ortamdan diğerine geçerken **frekans değişmez**, hız ve dalga boyu değişir. $v = \lambda f$ bağıntısı bu ilişkiyi kurar.
:::

## 1. Dalga nedir?

Dalga, **enerji taşıyan** bir titreşimdir. Taşınan enerjidir, **madde değildir**. Suyun üzerindeki bir mantar, dalga geçerken yalnızca aşağı yukarı hareket eder, dalgayla birlikte ilerlemez.

**Ortama göre:**

| Tür | Özellik | Örnek |
| --- | --- | --- |
| Mekanik dalga | Yayılmak için **maddesel ortam** gerekir | Su, yay, ses |
| Elektromanyetik dalga | Boşlukta da yayılır | Işık, radyo, X ışınları |

**Titreşim yönüne göre:**

| Tür | Titreşim yönü | Örnek |
| --- | --- | --- |
| Enine dalga | Yayılma yönüne **dik** | Su dalgası, ışık, yay dalgası |
| Boyuna dalga | Yayılma yönüne **paralel** | Ses, yay üzerinde sıkışma-seyrelme |

## 2. Dalga büyüklükleri

![Enine dalganın genliği (A), dalga boyu (lambda), tepe ve çukur noktaları](/lessons/tyt-fiz/dalga-ozellikleri.svg "Dalga büyüklükleri | Yolumnet")

- **Genlik (A):** Denge noktasından en uzak noktaya olan uzaklıktır. Dalganın taşıdığı enerjiyle ilgilidir. Genlik büyükse enerji büyüktür.
- **Dalga boyu ($\lambda$):** Ardışık iki tepe (ya da çukur) arasındaki uzaklıktır. Birimi metredir.
- **Periyot ($T$):** Bir dalga boyu kadar yol alma süresidir. Birimi saniyedir.
- **Frekans ($f$):** Bir saniyedeki dalga sayısıdır. Birimi **hertz (Hz)**’tir. $f = \dfrac{1}{T}$.

**Örnek.** Frekansı 5 Hz olan dalganın periyodu $T = \dfrac{1}{5} = 0{,}2\ \text{s}$’dir.

## 3. Dalga denklemi

Dalganın yayılma hızı, dalga boyu ve frekansla şöyle ilişkilidir:

$$v = \lambda \cdot f = \frac{\lambda}{T}$$

**Örnek.** $\lambda = 2\ \text{m}$ ve $f = 5\ \text{Hz}$ ise $v = 2 \cdot 5 = 10\ \text{m/s}$.

**Kural:** Dalganın hızı **ortama bağlıdır**, frekansı **kaynağa bağlıdır**. Bir dalga ortam değiştirirse **frekansı değişmez**, hız ve dalga boyu değişir.

## 4. Su dalgaları

Su dalgaları enine dalgalardır. Dalga leğeninde incelenir.

**Yansıma:** Dalga bir engele çarpınca geri döner. **Gelme açısı yansıma açısına eşittir**. Dalga boyu, frekans ve hız değişmez.

**Kırılma:** Dalga derinliği değişen bölgeye geçince **hızı değişir**. Derin kısımdan sığ kısma geçerken:

- **Hız azalır.**
- **Dalga boyu azalır.**
- **Frekans değişmez.**

Dalga sığ kısma eğik girerse yönü de değişir (normale yaklaşır).

**Girişim:** İki dalga üst üste gelince birbirini güçlendirebilir (tepe-tepe) ya da zayıflatabilir (tepe-çukur).

**Kırınım:** Dalga dar bir aralıktan ya da engelin kenarından geçerken bükülerek yayılır. Aralık dalga boyuna yakınsa kırınım belirgin olur.

## 5. Yay dalgaları

Gergin bir yay ya da ipte oluşturulan dalgalar enine, yayın sıkıştırılıp bırakılmasıyla oluşan dalgalar boyunadır.

- **Sabit uçtan yansıma:** Dalga ters döner (tepe çukura dönüşür).
- **Serbest uçtan yansıma:** Dalga aynı yönde döner (tepe tepe olarak kalır).
- Yaydaki gerginlik arttıkça hız artar. Yayın kalınlığı ve cinsi hızı etkiler. Frekans kaynağa bağlıdır.

## 6. Ses dalgaları

**Ses**, titreşen bir kaynağın oluşturduğu **boyuna mekanik dalgadır**. Hava gibi madde ortamında yayılır, **boşlukta yayılamaz**.

- Havada hızı yaklaşık **340 m/s**’dir (sıcaklığa bağlı). Katılarda ve sıvılarda daha hızlıdır.
- **Frekansı** sesin **tizliğini ya da peşliğini** (yükseklik) belirler. Frekans büyükse ses tizdir.
- **Genliği** sesin **şiddetini** belirler. Genlik büyükse ses güçlüdür.
- **Tını**, aynı frekanstaki farklı kaynakları (keman ve piyano) ayırt eden özelliktir.
- İnsan kulağı yaklaşık 20 Hz ile 20 000 Hz arasındaki sesleri duyar.

**Yankı:** Sesin bir engelden yansıyıp geri gelmesidir. Ses gidiş-dönüş yol aldığı için:

$$d = \frac{v \cdot t}{2}$$

**Örnek.** Yankı 3 saniye sonra duyuluyorsa engele uzaklık $\dfrac{340 \cdot 3}{2} = 510\ \text{m}$’dir.

## 7. Elektromanyetik dalgalar

Boşlukta ışık hızıyla ($3 \cdot 10^8\ \text{m/s}$) yayılırlar. **Enine dalgalardır**. Frekansa göre sıralanırlar:

**Radyo dalgaları, mikrodalga, kızılötesi, görünür ışık, morötesi, X ışınları, gama ışınları** (artan frekans ve enerji sırasıyla).

Görünür ışıkta **kırmızı**nın frekansı en küçük, **mor**un frekansı en büyüktür.

:::neden-sonuc
- Dalga ortam değiştiriyor => Frekansı değişmez.
- Dalga derinden sığa geçiyor => Hız ve dalga boyu azalır.
- Yankı ölçülüyor => Mesafe, ses hızı ve süre çarpımının yarısıdır.
- Ses boşlukta yayılmak isteniyor => Yayılamaz.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Dalgaların madde taşıdığını sanmak** en sık yapılan hatadır. Dalga enerjiyi taşır, maddeyi taşımaz. Bir de **yankı sorusunda sürenin yarısını almayı** unutursun: Ses engele gider ve döner, süre gidiş-dönüş süresidir. Ayrıca **ses ile ışığı karıştırma**: Ses boyuna mekanik dalgadır, ışık enine elektromanyetik dalgadır. Işık boşlukta yayılır, ses yayılamaz.
:::

:::baglanti
Dalgalar, “Optik” konusunda ışığın dalga özelliklerini anlamak için temeldir: Yansıma ve kırılma kuralları aynıdır. “Elektrik ve Manyetizma” konusundaki değişen elektrik ve manyetik alanlar elektromanyetik dalgaları oluşturur. “İş, Güç ve Enerji” konusunda enerjinin taşınması bu konunun özüdür.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Dalga | Enerji taşır, madde taşımaz |
| Mekanik | Ortam ister: su, yay, ses |
| Elektromanyetik | Boşlukta da yayılır |
| $v = \lambda f$ | Hız, dalga boyu, frekans |
| Ortam değişirse | Frekans sabit |
| Ses | Boyuna, 340 m/s |
| Yankı | $d = v t / 2$ |

## Mini test

:::soru{cevap="B"}
Dalga boyu $0{,}5\ \text{m}$ ve frekansı $20\ \text{Hz}$ olan bir dalganın yayılma hızı kaç m/s’dir?

- A) 0,5
- B) 10
- C) 20
- D) 20,5
- E) 40

---

1. Dalga denklemi $v = \lambda \cdot f$.
2. $v = 0{,}5 \cdot 20 = 10\ \text{m/s}$. Doğru cevap B.

Diğer şıklar: **0,5** dalga boyu hız sanılmış / **20** frekans hız sanılmış / **20,5** dalga boyu ile frekans toplanmış / **40** frekans dalga boyuna bölünmüş.
:::

:::soru{cevap="E"}
Bir kişi, karşısındaki dik yamaca seslenince yankıyı 3 saniye sonra duyuyor. Havada ses hızı $340\ \text{m/s}$ olduğuna göre yamaç kişiden kaç metre uzaktadır?

- A) 170
- B) 255
- C) 340
- D) 509
- E) 510

---

1. Ses, yamaca gidip geri döner. Toplam yol $v \cdot t = 340 \cdot 3 = 1020\ \text{m}$.
2. Yamaca uzaklık bu yolun yarısıdır: $\dfrac{1020}{2} = 510\ \text{m}$. Doğru cevap E.

Diğer şıklar: **170** ses hızı ikiye bölünmüş / **255** işlem hatasıyla yarısı bulunmuş / **340** ses hızı alınmış / **509** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="A"}
Derin bir bölgeden sığ bir bölgeye geçen su dalgası için aşağıdakilerden hangisi doğrudur?

- A) Hızı ve dalga boyu azalır, frekansı değişmez.
- B) Frekansı artar, hızı değişmez.
- C) Hızı ve frekansı azalır, dalga boyu değişmez.
- D) Dalga boyu artar, hızı azalır.
- E) Hızı ve dalga boyu artar, frekansı sabit kalır.

---

1. Frekans kaynağa bağlıdır, ortam değişince değişmez.
2. Su sığlaşınca dalganın hızı azalır. $v = \lambda f$ ve $f$ sabit olduğundan dalga boyu da azalır.
3. Doğru cevap A.

Diğer şıklar: **Frekansı artar, hızı değişmez.** frekans ortam değişiminde değişmez, hız azalır / **Hızı ve frekansı azalır, dalga boyu değişmez.** frekans sabit kalır, dalga boyu azalır / **Dalga boyu artar, hızı azalır.** hız azalırsa dalga boyu da azalır / **Hızı ve dalga boyu artar, frekansı sabit kalır.** sığ bölgede hız azalır.
:::

:::soru{cevap="E"}
Ses dalgalarıyla ilgili aşağıdaki ifadelerden hangisi doğrudur?

- A) Enine dalgalardır ve boşlukta yayılırlar.
- B) Elektromanyetik dalgalardır ve ışık hızıyla yayılırlar.
- C) Boyuna dalgalardır ve boşlukta ışık hızıyla yayılırlar.
- D) Mekanik enine dalgalardır ve yalnızca katılarda yayılırlar.
- E) Boyuna mekanik dalgalardır ve boşlukta yayılamazlar.

---

1. Ses, titreşen bir kaynağın ortamı sıkıştırıp seyreltmesiyle oluşan boyuna mekanik dalgadır.
2. Maddesel ortam gerektirdiği için boşlukta yayılamaz.
3. Doğru cevap E.

Diğer şıklar: **Enine dalgalardır ve boşlukta yayılırlar.** ses boyuna dalgadır ve ortam ister / **Elektromanyetik dalgalardır ve ışık hızıyla yayılırlar.** ses mekanik dalgadır, hızı yaklaşık 340 m/s / **Boyuna dalgalardır ve boşlukta ışık hızıyla yayılırlar.** ses boşlukta yayılmaz / **Mekanik enine dalgalardır ve yalnızca katılarda yayılırlar.** ses boyunadır ve gazlarda da yayılır.
:::

## Kendini dene

:::dene
1. Periyodu 0,5 s olan dalganın frekansı kaç Hz’dir? => $1 / 0{,}5 = 2$ Hz.
2. $\lambda = 3\ \text{m}$ ve $f = 4\ \text{Hz}$ ise dalganın hızı kaçtır? => $12\ \text{m/s}$.
3. Ses boşlukta yayılır mı? => Hayır, maddesel ortam gerekir.
4. Dalga ortam değiştirirse hangi büyüklük değişmez? => Frekans.
5. Yankı 2 s sonra duyulursa engele uzaklık kaç metredir? ($v = 340\ \text{m/s}$) => $340 \cdot 2 / 2 = 340$ m.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-fiz' and name = 'Dalgalar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Dalga türleri, genlik, dalga boyu, periyot, frekans, dalga denklemi, su dalgalarında yansıma ve kırılma, yay dalgaları, ses dalgaları, yankı, elektromanyetik dalgalar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Doppler etkisi ve durağan dalgalar metne alınmadı. Elektromanyetik spektrum sıralaması sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Dalgalar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Aynada kendine bakarken, gözlük takarken, gökkuşağını izlerken, havuzun içindeki bir çubuğun kırık görünmesinde, hepsinde **ışık** vardır. Optik, ışığın davranışını inceler. Işık düz bir çizgi boyunca yayılır, yüzeylerden yansır, saydam ortamlardan geçerken yön değiştirir ve renklere ayrılır. TYT’de optik soruları genellikle şekil çizerek çözülür. Bu konuda ışığın yayılmasını, gölgeyi, yansımayı, düzlem ayna ve küresel aynaları, kırılmayı, mercekleri ve renkleri öğreneceksin.

:::hedefler
1. Işığın doğrusal yayılmasını ve gölge oluşumunu açıklamak.
2. Yansıma kanunlarını ve düzlem aynada görüntü özelliklerini kullanmak.
3. Işığın kırılmasını ve ortamlara göre hızını yorumlamak.
4. Mercekleri ve görüntü oluşumunu tanımak.
5. Işığın renklere ayrılmasını ve cisimlerin renk görünümünü açıklamak.
:::

:::ipucu
Optik sorularında **önce ışın çiz**. Gelen ışını, normali, yansıyan ya da kırılan ışını çiz. Açıları **normale göre** ölç, ayna yüzeyine göre değil. Soru yüzeyle yapılan açı veriyorsa 90°’den çıkarıp normale göre açıyı bul.
:::

## 1. Işığın yayılması ve gölge

Işık **kaynaklardan çıkan, doğrusal yayılan** bir enerjidir. Boşlukta hızı $c = 3 \cdot 10^8\ \text{m/s}$’dir. Işık maddesel ortama gerek duymaz. Hızı ortama bağlıdır: Hava ve boşlukta yaklaşık $3 \cdot 10^8$, suda yaklaşık $2{,}25 \cdot 10^8\ \text{m/s}$.

**Cisimler:** Işık kaynağı (Güneş, ampul) kendi ışığını yayar, **ışık vermeyen cisimler** (ay, kitap) üzerlerine düşen ışığı yansıtarak görülür.

**Gölge:** Işık kaynağı ile ekran arasına opak (ışığı geçirmeyen) cisim konunca ekranda oluşan karanlık bölgedir. Işık doğrusal yayıldığı için gölgenin şekli cisme benzer.

- **Tam gölge:** Hiç ışık gelmeyen bölge.
- **Yarı gölge:** Kaynağın yalnızca bir kısmından ışık gelen bölge (noktasal olmayan kaynaklarda).

Güneş ve Ay tutulmaları gölge ile açıklanır.

## 2. Yansıma

Işığın bir yüzeye çarpıp aynı ortama geri dönmesidir.

![Düzlem aynada gelme ve yansıma açıları eşit, havadan suya geçerken ışının normale yaklaşması](/lessons/tyt-fiz/isik-yansima-kirilma.svg "Yansıma ve kırılma | Yolumnet")

**Yansıma kanunları:**

1. Gelen ışın, normal ve yansıyan ışın **aynı düzlemdedir**.
2. **Gelme açısı yansıma açısına eşittir** ($i = r$). Açılar **normale göre** ölçülür.

**Örnek.** Bir ışın düzlem aynaya, ayna yüzeyi ile 30° yapacak biçimde geliyor. Gelme açısı $90° - 30° = 60°$, yansıma açısı da $60°$’dir. Gelen ve yansıyan ışınlar arasındaki açı $60° + 60° = 120°$’dir.

**Düzgün ve dağınık yansıma:** Pürüzsüz yüzeyde ışınlar paralel yansır (ayna). Pürüzlü yüzeyde ışınlar her yöne dağılır (kâğıt, duvar). Cisimleri her yönden görmemizin nedeni dağınık yansımadır.

## 3. Düzlem ayna

Düzlem aynada oluşan görüntü:

- **Sanaldır** (ışınlar gerçekten kesişmez, ekranda toplanamaz).
- **Düzdür** (cisimle aynı yönlüdür, sağ-sol yer değiştirir).
- Cisimle **aynı boydadır**.
- Aynanın **arkasında, cisim ile ayna arasındaki uzaklık kadar** uzaktadır.

**Örnek.** Aynanın önünde 2 m uzaklıkta duran kişinin görüntüsü aynanın 2 m arkasındadır. Kişi ile görüntüsü arasındaki uzaklık $2 + 2 = 4\ \text{m}$. Kişi aynaya 1 m yaklaşırsa kişi ile görüntüsü arasındaki uzaklık $1 + 1 = 2\ \text{m}$ olur.

**Hız:** Kişi aynaya $v$ hızıyla yaklaşıyorsa görüntü de aynaya $v$ hızıyla yaklaşır. Kişi ile görüntü $2v$ hızıyla birbirine yaklaşır.

**Tam boy görüntü:** Boyunu tam görebilmek için aynanın boyu **kişinin boyunun en az yarısı** kadar olmalıdır.

## 4. Küresel aynalar

**Çukur ayna** (içbükey) ışınları **toplar**. Odak noktası aynanın önündedir. **Tümsek ayna** (dışbükey) ışınları **dağıtır** ve geniş görüş alanı sağlar (araç dikiz aynası).

Odak uzaklığı $f = \dfrac{R}{2}$ ($R$: eğrilik yarıçapı).

**Özel ışınlar (çukur ayna):**

- Asal eksene paralel gelen ışın odaktan geçerek yansır.
- Odaktan gelen ışın asal eksene paralel yansır.
- Merkezden gelen ışın aynı yoldan geri döner.

Çukur aynada cisim odak içindeyse görüntü **sanal, düz ve büyük**tür (makyaj aynası, diş hekimi aynası). Tümsek aynada görüntü her zaman **sanal, düz ve küçük**tür.

## 5. Kırılma

Işık bir saydam ortamdan başka bir saydam ortama geçerken **hızı değişir ve yönü değişir**. Buna kırılma denir. Işığın ortamdaki hızı $v$, boşluktaki hızı $c$ ise **kırıcılık indisi** $n = \dfrac{c}{v}$’dir. Hava için $n \approx 1$, su için $n = \dfrac{4}{3}$, cam için yaklaşık $1{,}5$.

**Kırılma kuralları:**

- **Seyrek ortamdan** (düşük $n$) **yoğun ortama** geçerse ışın **normale yaklaşır**, hızı **azalır**.
- **Yoğun ortamdan seyrek ortama** geçerse ışın normalden **uzaklaşır**, hızı **artar**.
- **Frekans değişmez**. Dalga boyu ve hız değişir.
- Normal boyunca (dik) gelen ışın **sapmaz**.

**Örnek.** Suda ışığın hızı $\dfrac{3 \cdot 10^8}{4/3} = 2{,}25 \cdot 10^8\ \text{m/s}$.

**Günlük hayatta kırılma:** Su dolu bardaktaki kaşığın kırık görünmesi, havuzun gerçekte olduğundan sığ görünmesi, mercekler, gökkuşağı.

## 6. Mercekler

**Mercek**, ışığı kırarak görüntü oluşturan saydam cisimdir.

| Mercek | Şekli | Işınlara etkisi |
| --- | --- | --- |
| İnce kenarlı (dışbükey) | Ortası kalın | **Yakınsatır** (toplar) |
| Kalın kenarlı (içbükey) | Ortası ince | **Iraksatır** (dağıtır) |

**Yakınsak merceğin özel ışınları:**

- Asal eksene paralel gelen ışın, odaktan geçer.
- Optik merkezden geçen ışın sapmadan geçer.
- Odaktan gelen ışın asal eksene paralel çıkar.

**Görüntü (yakınsak mercek):**

| Cismin yeri | Görüntü |
| --- | --- |
| $2f$’den uzak | Gerçek, ters, küçük |
| $2f$’de | Gerçek, ters, eşit boy ($2f$’de) |
| $f$ ile $2f$ arası | Gerçek, ters, büyük |
| $f$’de | Görüntü oluşmaz |
| $f$’den yakın | Sanal, düz, büyük (büyüteç) |

**Iraksak mercekte** görüntü her zaman **sanal, düz ve küçüktür**.

**Göz kusurları:** **Miyop** (uzağı görememe) ıraksak mercekle, **hipermetrop** (yakını görememe) yakınsak mercekle düzeltilir.

## 7. Işığın renkleri

Beyaz ışık, prizmadan geçince **kırmızı, turuncu, sarı, yeşil, mavi, lacivert, mor** renklere ayrılır (tayf). Kırmızı en az, mor en çok kırılır. Gökkuşağı, yağmur damlalarının ışığı renklerine ayırmasıdır.

**Cisimlerin rengi:** Bir cisim, üzerine düşen ışıktan **yalnızca kendi rengini yansıtır**, diğerlerini soğurur. Kırmızı bir elma beyaz ışıkta kırmızıyı yansıtır. **Beyaz cisim** tüm renkleri yansıtır, **siyah cisim** tümünü soğurur. Kırmızı elma, yeşil ışık altında **siyah** görünür, çünkü yeşili soğurur ve yansıtacak renk yoktur.

:::neden-sonuc
- Gelme açısı 40° => Yansıma açısı da 40°.
- Işık seyrek ortamdan yoğuna giriyor => Normale yaklaşır, hızı azalır.
- Cisim yakınsak merceğin odak uzaklığından daha yakın => Sanal, düz, büyük görüntü.
- Kırmızı cisim yeşil ışıkta => Siyah görünür.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Açıyı ayna yüzeyine göre ölçmek** en sık yapılan hatadır. Gelme ve yansıma açıları **normale** göre alınır. Soru ayna ile yapılan açıyı verirse 90°’den çıkar. Bir de düzlem aynada **görüntünün ayna arkasında olduğunu** unutma: Kişi aynaya 2 m uzaksa kişi ile görüntü arası 4 m’dir. Kırılmada ise ışının **normale yaklaştığını** ya da **uzaklaştığını** ortamın kırıcılığına bakarak belirle.
:::

:::baglanti
Optik, “Dalgalar” konusundaki yansıma ve kırılma ilkelerinin ışığa uygulanmasıdır: Işık da bir dalgadır. “Elektrik ve Manyetizma” konusunda ışığın elektromanyetik dalga olduğunu gördün. Biyolojide “Duyu organları” konusunda gözün bir mercek sistemi gibi çalıştığını ve göz kusurlarını bir kez daha göreceksin.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Işık hızı | $3 \cdot 10^8\ \text{m/s}$ boşlukta |
| Yansıma | $i = r$, normale göre |
| Düzlem ayna | Sanal, düz, eşit boy, ayna arkasında |
| Kırılma | Yoğun ortamda normale yaklaşır |
| Kırıcılık indisi | $n = c / v$ |
| Yakınsak mercek | Işınları toplar |
| Renk | Cisim kendi rengini yansıtır |

## Mini test

:::soru{cevap="E"}
Bir ışın düzlem aynaya, ayna yüzeyiyle $30°$’lik açı yapacak biçimde geliyor. Gelen ışın ile yansıyan ışın arasındaki açı kaç derecedir?

- A) 30
- B) 60
- C) 90
- D) 119
- E) 120

---

1. Açılar normale göre ölçülür. Gelme açısı $90° - 30° = 60°$.
2. Yansıma açısı da $60°$'dir.
3. Gelen ve yansıyan ışın arasındaki açı $60° + 60° = 120°$. Doğru cevap E.

Diğer şıklar: **30** yüzeyle yapılan açı alınmış / **60** normale göre gelme açısı alınmış / **90** ışının aynaya dik geldiği sanılmış / **119** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="A"}
Düzlem aynanın önünde, aynaya 2 m uzaklıkta duran bir kişi aynaya doğru 1 m yaklaşıyor. Yaklaşmadan sonra kişi ile görüntüsü arasındaki uzaklık kaç metre olur?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. Yaklaşınca kişi aynaya $2 - 1 = 1\ \text{m}$ uzaklıktadır.
2. Görüntü aynanın 1 m arkasındadır.
3. Kişi ile görüntü arası $1 + 1 = 2\ \text{m}$. Doğru cevap A.

Diğer şıklar: **3** başlangıç uzaklığından 1 m çıkarılmış / **4** başlangıçtaki uzaklık alınmış / **5** işlem hatasıyla üç fazla bulunmuş / **6** kişinin uzaklığı üç katı sanılmış.
:::

:::soru{cevap="A"}
Işık havadan suya geçerken aşağıdakilerden hangisi doğrudur?

- A) Normale yaklaşır, hızı azalır, frekansı değişmez.
- B) Normalden uzaklaşır, hızı azalır, frekansı değişmez.
- C) Normale yaklaşır, hızı artar, frekansı değişmez.
- D) Normale yaklaşır, hızı azalır, frekansı azalır.
- E) Doğrultusu değişmez, hızı azalır, frekansı artar.

---

1. Su, havadan daha yoğun bir ortamdır. Seyrek ortamdan yoğun ortama geçen ışın normale yaklaşır.
2. Yoğun ortamda ışığın hızı azalır. Frekans ortam değişse de değişmez.
3. Doğru cevap A.

Diğer şıklar: **Normalden uzaklaşır, hızı azalır, frekansı değişmez.** seyrekten yoğuna geçen ışın normale yaklaşır / **Normale yaklaşır, hızı artar, frekansı değişmez.** yoğun ortamda ışığın hızı azalır / **Normale yaklaşır, hızı azalır, frekansı azalır.** ortam değişince frekans sabit kalır / **Doğrultusu değişmez, hızı azalır, frekansı artar.** eğik gelen ışının doğrultusu değişir, frekans sabit kalır.
:::

:::soru{cevap="A"}
Odak uzaklığı $f$ olan bir yakınsak merceğin $2f$ uzaklığına bir cisim konuyor. Oluşan görüntü ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Gerçek, ters ve cisimle aynı boydadır.
- B) Sanal, düz ve cisimden büyüktür.
- C) Gerçek, ters ve cisimden küçüktür.
- D) Gerçek, ters ve cisimden büyüktür.
- E) Görüntü oluşmaz.

---

1. Cisim $2f$'deyse görüntü de mercekten $2f$ uzaklıkta oluşur.
2. Görüntü gerçek, ters ve cisimle aynı boydadır.
3. Doğru cevap A.

Diğer şıklar: **Sanal, düz ve cisimden büyüktür.** bu görüntü cisim odak içindeyken oluşur / **Gerçek, ters ve cisimden küçüktür.** cisim $2f$’den uzakken oluşur / **Gerçek, ters ve cisimden büyüktür.** cisim $f$ ile $2f$ arasındayken oluşur / **Görüntü oluşmaz.** görüntü yalnızca cisim odaktayken oluşmaz.
:::

## Kendini dene

:::dene
1. Gelme açısı 25° ise yansıma açısı kaç derecedir? => 25°.
2. Aynaya 3 m uzaklıktaki kişinin görüntüsüne uzaklığı kaç metredir? => $3 + 3 = 6$ m.
3. Işık havadan cama geçerken normale yaklaşır mı, uzaklaşır mı? => Yaklaşır.
4. Düzlem aynadaki görüntü gerçek mi sanal mıdır? => Sanal.
5. Yeşil ışık altında kırmızı bir cisim hangi renkte görünür? => Siyah.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-fiz' and name = 'Optik'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Işığın yayılması, gölge, yansıma, düzlem ayna, küresel aynalar, kırılma, kırıcılık indisi, mercekler, göz kusurları, ışığın renkleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Snell yasası ve tam yansıma metne alınmadı. Küresel ayna görüntü tabloları kısaltıldı. Sorular şekilsiz, metinle tanımlandı.$lesson$ from public.topics where subject_id = 'tyt-fiz' and name = 'Optik'
on conflict (topic_id) do nothing;
