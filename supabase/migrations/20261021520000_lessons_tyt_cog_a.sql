-- TYT Coğrafya konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir şehrin neden denize yakın kurulduğunu, bir köyde neden sadece fındık yetiştirildiğini, bir ovada neden yoğun nüfus bulunduğunu merak ettin mi? Coğrafya bu soruların cevabını arar. Yeryüzünü sadece haritada yer isimleri öğrenmek olarak değil, **doğa ile insan arasındaki ilişkiyi** inceleyen bir bilim olarak görürsün. Bu konuda coğrafyanın tanımını, **doğal ve beşeri unsurları**, **coğrafyanın ilkelerini**, bilim dallarını ve coğrafya incelemelerinde kullanılan araçları öğreneceksin.

:::hedefler
1. Coğrafyanın tanımını ve inceleme alanlarını açıklamak.
2. Doğal ve beşeri unsurları ayırt etmek, fiziki ve beşeri coğrafyayı eşleştirmek.
3. Coğrafyanın ilkelerini örneklerle tanımak.
4. Coğrafi bilgi sistemleri, uzaktan algılama ve harita gibi araçların amacını söylemek.
5. Doğa ile insan arasındaki karşılıklı etkileşimi yorumlamak.
:::

## 1. Coğrafya nedir

**Coğrafya**, yeryüzü şekillerini, doğal olayları, canlıları ve insan faaliyetlerini **dağılış, neden-sonuç ve karşılıklı ilişki** içinde inceleyen bilimdir. Sadece “nerede” sorusuna değil, “**neden orada?**” ve “**bunun sonucu ne?**” sorularına da cevap arar.

Coğrafya **doğal** ve **beşeri** olmak üzere iki ana kola ayrılır.

| Alan | Örnek | Ne inceler |
| --- | --- | --- |
| **Fiziki (doğal) coğrafya** | Klimatoloji, jeomorfoloji, hidrografya, biyocoğrafya | İklim, yer şekilleri, sular, bitki ve hayvan dağılışı |
| **Beşeri coğrafya** | Nüfus, yerleşme, ekonomi, ulaşım, kültür coğrafyası | Nüfus, şehirler, tarım, sanayi, ticaret, göç |

Beşeri coğrafya, insanın doğayı **nasıl kullandığını ve değiştirdiğini** inceler.

## 2. Doğal ve beşeri unsurlar

- **Doğal unsurlar:** İnsanın yapmadığı, doğada kendiliğinden bulunan öğelerdir. Dağ, ova, akarsu, göl, deniz, iklim, bitki örtüsü, toprak, yer altı kaynakları.
- **Beşeri unsurlar:** İnsanın oluşturduğu ya da insanla ilgili öğelerdir. Şehir, köy, yol, baraj, tarım alanı, fabrika, nüfus, dil, din, gelenek.

Doğal unsurlar insan faaliyetlerini etkiler: Verimli bir ova **tarımı**, geniş bir kıyı **limanı ve turizmi**, bir maden yatağı **sanayiyi** destekler. İnsan da doğayı değiştirir: Baraj yapar, orman keser, bataklığı kurutur, sera kurar. Bu **karşılıklı etkileşim** coğrafyanın temelidir.

:::ipucu{baslik="Doğal mı, beşeri mi"}
Bir unsurun adını aklına getir ve “**insan olmasaydı yine de var olur muydu?**” diye sor. Cevap evetse doğaldır (dağ, nehir). Hayırsa beşeridir (köprü, şehir, tarım arazisi).
:::

## 3. Coğrafyanın ilkeleri

Coğrafi bir olayı doğru incelemek için bazı ilkelere dayanılır:

- **Nedensellik (Sebep-sonuç) ilkesi:** Bir olayın nedenlerini ve sonuçlarını arar. “Bu bölgede neden yağış fazla?”
- **Dağılış ilkesi:** Olayların yeryüzünde nerede, nasıl dağıldığını inceler. “Fındık neden Karadeniz kıyılarında yetişir?”
- **Karşılaştırma ilkesi:** Farklı yerleri benzerlik ve farklarıyla kıyaslar.
- **Bağlantı (Etkileşim) ilkesi:** Olayların birbirini etkilediğini kabul eder. Yağış azalınca tarım, tarım azalınca göç etkilenir.
- **Analiz ve sentez ilkesi:** Olayı parçalarına ayırır (analiz), sonra bütün olarak değerlendirir (sentez).
- **Mekân (Yer) ilkesi:** Her olayın bir yeri ve konumu vardır. Aynı olay farklı yerlerde farklı gelişebilir.

## 4. Coğrafyanın yardımcı bilimleri

Coğrafya, diğer bilimlerden yararlanır:

| Bilim | Katkısı |
| --- | --- |
| Jeoloji | Yerkabuğunun yapısı ve tarihi |
| Meteoroloji | Hava olayları |
| Astronomi | Dünya’nın hareketleri ve konumu |
| Ekoloji | Canlı ve çevre ilişkisi |
| Tarih | Geçmiş ve yerleşme |
| Ekonomi, sosyoloji | Beşeri faaliyetler |

## 5. Coğrafi araçlar ve teknolojiler

- **Harita:** Yeryüzünün küçültülmüş, düzlem üzerindeki gösterimidir. Coğrafyanın en temel aracıdır.
- **Coğrafi Bilgi Sistemleri (CBS):** Konuma bağlı verilerin (nüfus, yol, arazi kullanımı, yağış) bilgisayarda toplanıp katmanlar halinde analiz edildiği sistemdir. Afet yönetimi, şehir planlama ve tarım gibi alanlarda kullanılır.
- **Uzaktan algılama:** Uydu ve uçaklarla yeryüzünün görüntülerinin alınması. Orman yangını, buzul erimesi, şehir büyümesi gibi değişimler izlenir.
- **Küresel Konumlama Sistemi (GPS):** Uydu sinyalleriyle yer tespiti ve yön bulma.
- **Arazi gözlemi, anket ve ölçme.**

Bu araçlar sayesinde afet öncesi risk analizi, yer seçimi ve planlama daha doğru yapılabilir.

## 6. Doğa ve insan etkileşimi

- Dağlık ve kurak yerlerde **nüfus seyrek**, verimli ova ve iklimi ılıman bölgelerde yoğundur.
- Kıyı şehirleri **ticaret ve turizm** ile gelişir.
- İnsan, **teknoloji** sayesinde doğal engelleri aşabilir (tünel, köprü, sulama, sera).
- Bilinçsiz kullanım **çevre sorunlarına** yol açar: Orman azalması, kirlilik, toprak erozyonu.
- **Sürdürülebilirlik:** Kaynakların gelecek kuşakları da düşünerek kullanılması.

**Örnek.** Akdeniz kıyısındaki bir ilçede turizmin gelişmesi: Doğal etken **iklim ve deniz**, beşeri etken **ulaşım ve otel yatırımları**dır.

:::neden-sonuc
- İklim sıcak ve güneşli => Turizm ve seracılık gelişir.
- Ova toprağı verimli ve su var => Nüfus yoğunlaşır, tarım ve yerleşme artar.
- Orman kesiliyor => Toprak erozyonu ve su kaybı artar.
- Uydu görüntüsü alınıyor => Orman yangını gibi değişimler izlenir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Coğrafyayı yalnızca “yer isimleri bilgisi” sanma.** Coğrafya olayın **nedenini ve sonucunu** araştırır. Bir de **baraj, tarım alanı ve limanı doğal unsur sanma**: Bunlar insanın yaptığı beşeri unsurlardır. **İklimin, dağın ve nehrin** doğal olduğunu aklında tut.
:::

:::baglanti
Bu konu, coğrafyanın bütün konularına giriş yapar. “Harita Bilgisi” konusunda haritalar ve coğrafi araçlar ayrıntılandırılır. “Çevre ve Toplum” konusu, doğa ile insan etkileşiminin çevre sorunlarına ve sürdürülebilirliğe nasıl yol açtığını işler. Biyolojide “Ekosistem Ekolojisi” ve “Güncel Çevre Sorunları” konuları da canlı ile çevre ilişkisini ele alır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Coğrafya | Dağılış, neden-sonuç, ilişki |
| Fiziki coğrafya | İklim, yer şekli, su, bitki |
| Beşeri coğrafya | Nüfus, yerleşme, ekonomi |
| Doğal unsur | İnsan yapmaz, dağ ve akarsu |
| Beşeri unsur | İnsan yapar, şehir ve baraj |
| CBS | Konuma bağlı veri, katman analizi |
| Uzaktan algılama | Uydu ve uçak görüntüsü |
| Sürdürülebilirlik | Kaynakları gelecek için korumak |

## Mini test

:::soru{cevap="A"}
Aşağıdaki sorulardan hangisi coğrafyanın nedensellik (sebep-sonuç) ilkesine en uygun örnektir?

- A) Karadeniz kıyısında yağış neden fazladır?
- B) Türkiye’nin kıyısı olan kaç il vardır?
- C) Ege Bölgesi’nin yüzölçümü kaç kilometrekaredir?
- D) Ankara hangi yıl başkent ilan edilmiştir?
- E) Uludağ’ın adı nereden gelmiştir?

---

1. Nedensellik ilkesi bir olayın nedenini ve sonucunu araştırır.
2. Yağışın neden fazla olduğunu soran soru bu ilkeye uygundur. Diğerleri sayı, ölçü, tarih ya da ad sorar. Doğru cevap A.

Diğer şıklar: **Türkiye’nin kıyısı olan kaç il vardır?** yalnızca sayı soruyor, neden aramıyor / **Ege Bölgesi’nin yüzölçümü kaç kilometrekaredir?** ölçü soruyor, neden aramıyor / **Ankara hangi yıl başkent ilan edilmiştir?** tarih soruyor, coğrafi neden aramıyor / **Uludağ’ın adı nereden gelmiştir?** ad kökeni soruyor, doğal olayın nedeni değil.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi beşeri unsurlara örnektir?

- A) Sulama kanalı
- B) Akarsu
- C) Dağ
- D) Bitki örtüsü
- E) İklim

---

1. Beşeri unsurlar insanın yaptığı ya da insanla ilgili öğelerdir.
2. Sulama kanalını insan açar, diğerleri doğal unsurlardır. Doğru cevap A.

Diğer şıklar: **Akarsu** akarsu doğal bir unsurdur / **Dağ** dağ doğal bir unsurdur / **Bitki örtüsü** bitki örtüsü doğal bir unsurdur / **İklim** iklim doğal bir unsurdur.
:::

:::soru{cevap="C"}
Bir bölgedeki orman yangınının yayılma alanı, uydu görüntülerinden her gün izleniyor. Bu çalışmada kullanılan teknolojik yöntem aşağıdakilerden hangisidir?

- A) Nüfus sayımı
- B) Arazi anketi
- C) Uzaktan algılama
- D) Stratigrafi
- E) Kadastro

---

1. Uydu ve uçak görüntüleriyle yeryüzünü izleme yöntemi uzaktan algılamadır.
2. Doğru cevap C.

Diğer şıklar: **Nüfus sayımı** nüfus sayımı insan sayısını belirler / **Arazi anketi** anket kişilere sorularla veri toplar / **Stratigrafi** stratigrafi yerkabuğu tabakalarını inceler / **Kadastro** kadastro mülkiyet ve arazi kaydıdır.
:::

:::soru{cevap="D"}
Konuma bağlı verileri (nüfus, yol, yağış, arazi kullanımı) bilgisayar ortamında katmanlar halinde birleştirerek analiz etmeyi sağlayan sistem aşağıdakilerden hangisidir?

- A) Küresel Konumlama Sistemi
- B) Uzaktan algılama
- C) Ölçek
- D) Coğrafi Bilgi Sistemleri
- E) Meridyen

---

1. Farklı verileri katmanlar halinde analiz eden sistem CBS'dir.
2. GPS konum bulur, uzaktan algılama görüntü verir. Doğru cevap D.

Diğer şıklar: **Küresel Konumlama Sistemi** GPS konum belirlemeye yarar, katman analizi yapmaz / **Uzaktan algılama** uzaktan algılama görüntü alma yöntemidir / **Ölçek** ölçek haritanın küçültme oranıdır / **Meridyen** meridyen yeryüzünde hayali bir çizgidir.
:::

## Kendini dene

:::dene
1. Coğrafya hangi iki ana kola ayrılır? => Fiziki (doğal) ve beşeri coğrafya.
2. Baraj doğal mı beşeri unsur mudur? => Beşeri.
3. “Neden orada?” sorusu hangi ilkeye aittir? => Nedensellik.
4. Uydu görüntülerinden yararlanma yöntemi nedir? => Uzaktan algılama.
5. Kaynakları gelecek kuşakları da düşünerek kullanmaya ne denir? => Sürdürülebilirlik.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Doğa ve İnsan'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Coğrafyanın tanımı, fiziki ve beşeri coğrafya, doğal ve beşeri unsurlar, coğrafya ilkeleri, yardımcı bilimler, CBS, uzaktan algılama, GPS, doğa ve insan etkileşimi, sürdürülebilirlik. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Coğrafya ilkelerinin sayısı ve adları ders kitaplarında farklı sunulur (yerel, dağılış, nedensellik, bağlantı gibi). Bu metin sade bir sınıflandırma verir. Kitabın kullandığı ilke adlarına göre uyarlanmalı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Doğa ve İnsan'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Gece ile gündüzün art arda gelmesi, yaz ile kışın değişmesi, uçakla batıya giderken saatin geri alınması, hava durumunda rüzgârların hep aynı yöne sapması. Bunların hepsi **Dünya’nın şekli ve hareketleriyle** ilgilidir. Bu konuda Dünya’nın şeklini, **günlük (dönüş) hareketini**, **yıllık (dolanma) hareketini**, bunların sonuçlarını ve **mevsimlerin oluşumunu** öğreneceksin.

:::hedefler
1. Dünya’nın şeklini ve bu şeklin kanıtlarını açıklamak.
2. Dönüş ve dolanma hareketlerini ve sonuçlarını ayırt etmek.
3. Mevsimlerin nasıl oluştuğunu, eksen eğikliğinin rolünü söylemek.
4. Dönenceleri, kutup dairelerini ve gün dönümlerini yorumlamak.
5. Güneş ışınlarının dik geldiği yerleri tarihlere göre belirlemek.
:::

## 1. Dünya’nın şekli

Dünya **tam bir küre değildir**. Kutuplardan basık, ekvatordan şişkin bir şekle sahiptir. Bu şekle **geoit** denir. Basıklığın nedeni **dönme hareketidir**.

**Şeklinin küresel olduğuna dair kanıtlar:**

- Ay tutulmasında Ay üzerindeki Dünya gölgesi **yuvarlaktır**.
- Gemiler ufukta **kıç tarafı önce**, ana gövdesi sonradan kaybolur.
- Yüksekten bakıldıkça ufuk çizgisi genişler.
- Dünya’nın etrafını dolaşmak mümkündür.
- Uydu ve uzay fotoğrafları.
- Farklı enlemlerde gökyüzünde farklı yıldızlar görülür.

**Şeklin sonuçları:**

- Güneş ışınları yeryüzüne **farklı açılarla** gelir. Ekvatora **dik**, kutuplara **eğik**. Bu yüzden ısınma farklıdır.
- Her yerde aynı anda gün doğumu ve batımı gerçekleşmez, **yerel saat farkları** oluşur.
- Kutuplarda sıcaklık düşük, ekvatorda yüksektir.
- Ekvatordan kutuplara gidildikçe **yer çekimi** artar. Kutuplarda ağırlık ekvatordakinden biraz daha fazladır.

## 2. Dönüş (günlük) hareketi

Dünya, **kendi ekseni etrafında batıdan doğuya** doğru döner. Bir tam dönüşü yaklaşık **24 saatte** (23 saat 56 dakika) tamamlar. Ekvatordaki çizgisel hız en büyüktür (yaklaşık saatte 1670 km), kutuplarda sıfırdır. **Açısal hız** her yerde aynıdır (saatte 15°).

**Sonuçları:**

- **Gece ve gündüz** birbirini izler.
- **Yerel saat farkları** doğar. Doğuya gidildikçe saat ilerler, batıya gidildikçe geri kalır. **1 boylam = 4 dakika**, **15 boylam = 1 saat**.
- **Coriolis kuvveti (sapma):** Hareket halindeki cisimler **Kuzey Yarım Küre’de sağa, Güney Yarım Küre’de sola** sapar. Rüzgârlar ve okyanus akıntıları bu yüzden sapar. Ekvatorda sapma yoktur.
- **Günlük sıcaklık değişimi** (gün içinde ısınma, gece soğuma).
- **Dünya’nın basık şekli** (ekvatordan şişkin).

## 3. Yıllık (dolanma) hareketi

Dünya, **Güneş etrafında eliptik bir yörüngede**, batıdan doğuya doğru dolanır. Bir turu **365 gün 6 saatte** tamamlar. Her dört yılda biri birikir ve **Şubat 29 gün** olur (artık yıl). **Eksen eğikliği 23°27′**’dir. Dünya’nın ekseni yörünge düzlemine **eğiktir** ve dolanma sırasında **aynı yöne** bakmaya devam eder.

![Dünya’nın dört konumu. Eksen eğikliği her konumda aynı yönde kalır ve kuzey yarım küre yaz gündönümünde Güneş’e doğru eğiktir](/lessons/tyt-cog/yorunge-mevsim.svg "Dünya’nın yörüngesi ve mevsimler | Yolumnet")

**Sonuçları:**

- **Mevsimlerin oluşması**
- **Gece-gündüz sürelerinin yıl boyunca değişmesi**
- **Güneş ışınlarının yeryüzüne düşme açısının değişmesi**
- **Yıllık sıcaklık farkları**, iklim kuşaklarının oluşumu
- **Dönenceler ve kutup dairelerinin ortaya çıkması**
- Bitki örtüsü, tarım takvimi ve hayvan göçleri.

**Mevsimleri oluşturan etken:** Dünya’nın **ekseninin eğik olması** ve **Güneş çevresinde dolanmasıdır.** Yörüngenin eliptik olması mevsimlerin nedeni değildir. Dünya, Güneş’e **Ocak ayında en yakın** (günberi), **Temmuz ayında en uzak** (günöte) olur. Yine de Kuzey Yarım Küre’de Ocak kış, Temmuz yazdır.

## 4. Gün dönümleri, ekinokslar ve dönenceler

| Tarih | Güneş ışınları dik gelir | Kuzey Yarım Küre’de | Güney Yarım Küre’de |
| --- | --- | --- | --- |
| **21 Mart** | Ekvator | İlkbahar ekinoksu (gece = gündüz) | Sonbahar ekinoksu |
| **21 Haziran** | **Yengeç Dönencesi (23°27′ K)** | **Yaz gündönümü** (en uzun gündüz) | Kış gündönümü (en kısa gündüz) |
| **23 Eylül** | Ekvator | Sonbahar ekinoksu (gece = gündüz) | İlkbahar ekinoksu |
| **22 Aralık** | **Oğlak Dönencesi (23°27′ G)** | **Kış gündönümü** (en kısa gündüz) | Yaz gündönümü (en uzun gündüz) |

- **Dönenceler (23°27′ K ve G):** Güneş ışınlarının yılda bir kez dik geldiği en uzak enlemlerdir.
- **Kutup daireleri (66°33′ K ve G):** Yaz gündönümünde gündüzün 24 saat sürdüğü (kutup gecesinin ve gündüzünün başladığı) enlemlerdir. Kutuplarda yılın yarısı gündüz, yarısı gecedir.
- **Güneş ışınları** yalnızca iki dönence arasındaki bölgeye dik gelebilir. Bu bölgedeki her enlem ışınları yılda iki kez dik alır, dönencelerde ise yılda bir kez. Dönencelerin dışındaki yerlere (Türkiye gibi) ışınlar hiçbir zaman dik gelmez.
- **Ekvatorda** gece ve gündüz yıl boyunca yaklaşık 12 saattir, mevsim farkı yoktur.

## 5. Gece ve gündüz süresi

- **Kuzey Yarım Küre’de** 21 Mart’tan 23 Eylül’e kadar **gündüzler geceden uzun** (yaz yarıyılı). 23 Eylül’den 21 Mart’a kadar **geceler uzun** (kış yarıyılı).
- Yazın gündüz uzadıkça güneş ışınları daha dik, ısınma daha fazla olur.
- **Güney Yarım Küre’de** mevsimler tersine yaşanır. Aralık’ta Avustralya’da yaz, Türkiye’de kış yaşanır.

:::neden-sonuc
- Dünya kendi ekseni etrafında dönüyor => Gece ve gündüz oluşur, yerel saat farkı doğar.
- Eksen 23°27′ eğik ve Dünya Güneş’i dolanıyor => Mevsimler oluşur.
- Dünya kendi etrafında dönüyor => Rüzgâr ve akıntılar Kuzey Yarım Küre’de sağa sapar.
- Dünya şekli geoit => Güneş ışınları farklı açıyla gelir, sıcaklık farkları oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Mevsimlerin Güneş’e yakınlık-uzaklıktan olduğunu sanma.** Dünya Ocak’ta Güneş’e en yakındır ama Kuzey Yarım Küre’de kıştır. Mevsimlerin nedeni **eksen eğikliği** ve **dolanma hareketidir**. Bir de **dönüş ile dolanmayı karıştırma**: Dönüş gece-gündüz, dolanma mevsimleri oluşturur. **21 Haziran’da ışınların dik geldiği yeri** Oğlak Dönencesi sanma, Yengeç Dönencesi’dir.
:::

:::baglanti
Bu konu, “Coğrafi Konum” konusundaki yerel saat ve enlem hesaplarının temelidir. “Atmosfer ve İklim” konusunda sıcaklık dağılışı, basınç ve rüzgârların sapması bu hareketlerle açıklanır. “Su, Toprak ve Bitki” konusunda okyanus akıntıları ve bitki kuşakları bu konuyla ilişkilidir. Tarihte “Tarih ve Zaman” konusundaki takvimler Dünya’nın dolanmasına dayanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Şekil | Geoit, kutuplardan basık |
| Dönüş | 24 saat, batıdan doğuya, gece-gündüz, yerel saat, Coriolis |
| Dolanma | 365 gün 6 saat, mevsimler |
| Eksen eğikliği | 23°27′ |
| 21 Haziran | Yengeç Dönencesi, kuzeyde yaz |
| 22 Aralık | Oğlak Dönencesi, kuzeyde kış |
| 21 Mart ve 23 Eylül | Ekvator, gece = gündüz |
| Dönenceler | 23°27′ K ve G |
| Kutup daireleri | 66°33′ K ve G |

## Mini test

:::soru{cevap="A"}
21 Haziran tarihinde Güneş ışınlarının yeryüzüne dik geldiği yer ile bu tarihte Güney Yarım Küre’de yaşanan mevsim olayı aşağıdakilerden hangisinde doğru verilmiştir?

- A) Yengeç Dönencesi, kış gündönümü
- B) Oğlak Dönencesi, yaz gündönümü
- C) Ekvator, ilkbahar ekinoksu
- D) Yengeç Dönencesi, yaz gündönümü
- E) Oğlak Dönencesi, kış gündönümü

---

1. 21 Haziran'da ışınlar Yengeç Dönencesi'ne (23°27' K) dik gelir.
2. Kuzey Yarım Küre'de yaz gündönümü olduğu için Güney Yarım Küre'de kış gündönümüdür. Doğru cevap A.

Diğer şıklar: **Oğlak Dönencesi, yaz gündönümü** 22 Aralık’taki duruma ait bilgi verilmiş / **Ekvator, ilkbahar ekinoksu** ekvatora ışınlar 21 Mart ve 23 Eylül’de dik gelir / **Yengeç Dönencesi, yaz gündönümü** bu durum Kuzey Yarım Küre için doğrudur / **Oğlak Dönencesi, kış gündönümü** ışınlar 21 Haziran’da Oğlak Dönencesi’ne dik gelmez.
:::

:::soru{cevap="A"}
Dünya’nın Ocak ayında Güneş’e en yakın konumda olmasına rağmen Kuzey Yarım Küre’de kış yaşanmasının asıl nedeni aşağıdakilerden hangisidir?

- A) Eksen eğikliği nedeniyle ışınların eğik gelmesi
- B) Dünya’nın dönüş hızının azalması
- C) Güneş’in Ocak ayında daha az ışın yayması
- D) Dünya’nın şeklinin geoit olması
- E) Ay’ın Dünya’ya yaklaşması

---

1. Mevsimler Güneş'e yakınlık ve uzaklıktan değil, eksen eğikliğinden doğar.
2. Ocak ayında Kuzey Yarım Küre Güneş'ten uzağa eğiktir, ışınlar eğik gelir ve gündüzler kısadır. Doğru cevap A.

Diğer şıklar: **Dünya’nın dönüş hızının azalması** dönüş hızı mevsimleri belirlemez / **Güneş’in Ocak ayında daha az ışın yayması** Güneş’in yaydığı enerji mevsimle değişmez / **Dünya’nın şeklinin geoit olması** şekil mevsim değişimini açıklamaz / **Ay’ın Dünya’ya yaklaşması** Ay mevsimleri belirlemez.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi Dünya’nın günlük hareketinin sonuçlarından biri **değildir**?

- A) Gece ile gündüzün oluşması
- B) Mevsimlerin oluşması
- C) Yerel saat farklarının doğması
- D) Rüzgârların ve akıntıların sapması
- E) Günlük sıcaklık değişimi

---

1. Mevsimler yıllık hareketin (dolanmanın) ve eksen eğikliğinin sonucudur.
2. Diğer seçenekler dönüş hareketinin sonucudur. Doğru cevap B.

Diğer şıklar: **Gece ile gündüzün oluşması** günlük hareketin sonucudur / **Yerel saat farklarının doğması** günlük hareketin sonucudur / **Rüzgârların ve akıntıların sapması** Coriolis, günlük hareketin sonucudur / **Günlük sıcaklık değişimi** gün içinde ısınma ve soğuma günlük hareketin sonucudur.
:::

:::soru{cevap="C"}
Dünya’nın dönüş hareketi nedeniyle iki yer arasındaki boylam farkı 75° ise bu iki yer arasındaki yerel saat farkı kaç saattir?

- A) 3
- B) 4
- C) 5
- D) 15
- E) 300

---

1. 15° boylam 1 saatlik yerel saat farkı oluşturur.
2. $75 \div 15 = 5$ saat. Doğru cevap C.

Diğer şıklar: **3** işlem hatasıyla iki eksik bulunmuş / **4** bir boylam derecesinin dakika karşılığı alınmış / **15** saatteki dönüş açısı (15°) alınmış / **300** dakika cinsinden bulunan değer saat sanılmış.
:::

## Kendini dene

:::dene
1. Dünya’nın dönüş hareketi ne kadar sürer? => Yaklaşık 24 saat.
2. Mevsimlerin oluşmasının asıl nedeni nedir? => Eksen eğikliği ve dolanma hareketi.
3. 21 Haziran’da Güneş ışınları hangi enleme dik gelir? => Yengeç Dönencesi (23°27′ K).
4. Kuzey Yarım Küre’de yaz gündönümü hangi tarihtir? => 21 Haziran.
5. Coriolis kuvveti Kuzey Yarım Küre’de hareketi hangi yöne saptırır? => Sağa.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-cog' and name = 'Dünya''nın Şekli ve Hareketleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Dünya'nın şekli, dönüş hareketi, dolanma hareketi, eksen eğikliği, mevsimler, ekinokslar ve gün dönümleri, dönenceler ve kutup daireleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Eksen eğikliği, dönence ve kutup dairesi enlemleri standart değerlerdir. Ekvatordaki çizgisel hız yaklaşık değerdir.
Kontrol edilecekler: Güneş ışınlarının dönenceler arasındaki geliş sayısı ifadesi ders kitabı ile karşılaştırılmalı. Günberi ve günöte tarihleri yaklaşıktır. Şekil sadeleştirilmiştir, ölçekli değildir.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Dünya''nın Şekli ve Hareketleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir yerin adresini anlatırken “Ankara’da” demek yetmez. Dünya üzerinde bir noktayı kesin olarak göstermek için **enlem ve boylam** gerekir. Aynı zamanda bir yerin **kıtalara, denizlere ve komşulara göre** nerede olduğu, o yerin önemini belirler. Bu konuda **mutlak (matematik) konumu**, **göreceli (özel) konumu**, **yerel saat hesabını** ve **Türkiye’nin coğrafi konumunu** öğreneceksin.

:::hedefler
1. Paralel, meridyen, enlem ve boylam kavramlarını açıklamak.
2. Bir yerin enlem ve boylamını okumak, yönünü belirlemek.
3. Yerel saat ve ortak saat hesabı yapmak.
4. Mutlak ve göreceli konum arasındaki farkı örneklerle açıklamak.
5. Türkiye’nin matematik ve özel konumunun sonuçlarını yorumlamak.
:::

## 1. Mutlak (matematik) konum

Bir yerin **enlem ve boylam** değerleriyle tanımlanan, hiçbir zaman değişmeyen konumudur.

### Paralel ve enlem

- **Paraleller:** Ekvatora paralel, doğu-batı doğrultusunda çizilen hayali çemberlerdir. Boyları kutuplara gidildikçe **kısalır**, kutupta nokta olur.
- **Ekvator:** 0° paralel, en uzun paralel. Dünya’yı **Kuzey** ve **Güney Yarım Küre**’ye ayırır.
- **Enlem:** Bir noktanın **ekvatora olan açısal uzaklığıdır.** Değeri **0° ile 90°** arasındadır (kuzey ve güney). Kutuplar 90°’dir.
- Her enlem derecesi arası **yaklaşık 111 km**’dir. Bu uzaklık yeryüzünün her yerinde hemen hemen aynıdır.

### Meridyen ve boylam

- **Meridyenler:** Kutupları birleştiren, kuzey-güney doğrultusunda çizilen yarım çemberlerdir. **Boyları birbirine eşittir.**
- **Başlangıç meridyeni:** **Greenwich (0°)**. Dünya’yı **Doğu** ve **Batı** yarım küreye ayırır.
- **Boylam:** Bir noktanın **başlangıç meridyenine olan açısal uzaklığıdır.** Değeri **0° ile 180°** arasında olup doğu ya da batı olarak belirtilir.
- Boylam derecelerinin arasındaki uzaklık **ekvatorda en fazla (111 km)**, **kutuplara doğru azalır**, kutuplarda sıfır olur.

### Özel paraleller

| Paralel | Değer |
| --- | --- |
| Ekvator | 0° |
| Yengeç ve Oğlak Dönenceleri | 23°27′ K ve G |
| Kuzey ve Güney Kutup Daireleri | 66°33′ K ve G |
| Kutup noktaları | 90° K ve G |

### Yön bulma

Paralellerde **kuzey-güney**, meridyenlerde **doğu-batı** yönü bulunur. İki yer arasında, **enlemi büyük olan** (kuzey yarım kürede) **kuzeyde**, **boylamı büyük olan** (doğu yarım kürede) **doğudadır**.

## 2. Yerel saat

Güneş, bir meridyen üzerine **tam tepeye** geldiğinde o meridyenin **öğle vaktidir (12.00)**. Dünya batıdan doğuya döndüğü için Güneş **doğudaki yerlere önce** doğar. Dolayısıyla:

- **Doğuya** gidildikçe saat **ileri**, **batıya** gidildikçe saat **geri** alınır.
- **1° = 4 dakika**, **15° = 1 saat**. Dünya 24 saatte 360° döner, $360 \div 24 = 15$.

**Örnek.** Greenwich’te saat 12.00 iken 45° D meridyeninde saat $45 \div 15 = 3$ saat ileri, **15.00**’tir. 30° B meridyeninde ise $30 \div 15 = 2$ saat geri, **10.00**’dur.

**Boylam farkıyla hesap:** İki yer arasındaki boylam farkı bulunur. Aynı yarım kürede ise **çıkarma**, farklı yarım kürede ise **toplama** yapılır. Fark 15’e bölünerek saat bulunur.

**Ortak (ulusal) saat:** Ülke içinde farklı yerel saatler kullanmak sorun olacağı için ülkeler bir meridyenin saatini **ortak saat** olarak kabul eder. **Türkiye’de 45° D meridyeninin yerel saati** kullanılır (UTC+3). Sıfır meridyeninin saatine göre **3 saat ilerde** olur.

**Gün çizgisi (180° meridyeni):** Doğuya giderken bu çizgiyi geçince bir gün geri, batıya giderken bir gün ileri alınır.

## 3. Göreceli (özel) konum

Bir yerin **çevresindeki diğer yerlere göre** konumudur. Zamanla değişebilir. Şunlara göre belirlenir:

- Karalar, denizler, yarımadalar, boğazlar.
- **Ticaret yolları** ve geçitler.
- Komşu ülkeler, siyasi ve ekonomik ilişkiler.
- Doğal kaynaklara ve enerji yollarına yakınlık.

Bir yerin özel konumu, **jeopolitik** (siyasi ve stratejik) önemi ile ilişkilidir.

## 4. Türkiye’nin coğrafi konumu

**Matematik konum:** **36° ile 42° kuzey** enlemleri, **26° ile 45° doğu** boylamları arasındadır. **Kuzey Yarım Küre**’de ve **Doğu Yarım Küre**’dedir. **Orta kuşakta** yer alır.

- **Kuzey-güney arası** $42 - 36 = 6$ enlem derecesidir. Uzaklık $6 \cdot 111 = 666\ \text{km}$.
- **Doğu-batı arası** $45 - 26 = 19$ boylam derecesidir. Bu yüzden **en doğu ile en batı arasında yerel saat farkı** $19 \cdot 4 = 76$ dakikadır. Doğudaki Iğdır’da güneş **batıdaki Edirne’ye göre yaklaşık 76 dakika önce** doğar.
- Yüzölçümü yaklaşık **783 562 km²**’dir.

**Matematik konumun sonuçları:**

- **Dört mevsim** yaşanır, mevsim farkları belirgindir.
- Güneş ışınları yıl boyunca **eğik** gelir, hiçbir zaman dik gelmez (dönencelerin kuzeyinde).
- Sıcaklık farkları ve yağış çeşitliliği görülür.
- Ülke içinde **yerel saat farkı** olsa da **ortak saat** kullanılır.
- Yılın dört mevsimi tarım ürünü çeşitliliğine yol açar.

**Özel konumun sonuçları:**

- **Üç kıtanın (Asya, Avrupa, Afrika) birleştiği** noktada, **Asya ile Avrupa arasında köprü**dür.
- **Akdeniz, Karadeniz ve Ege** denizleriyle çevrilidir. **İstanbul ve Çanakkale Boğazları** deniz ticaretinde stratejik önemi nedeniyle büyük önemlidir.
- **Tarihî İpek Yolu** ve **enerji koridoru** üzerindedir. Orta Doğu ve Hazar bölgesinin enerji kaynaklarının Avrupa’ya ulaşmasında geçiş ülkesidir (**Bakü-Tiflis-Ceyhan petrol boru hattı**).
- **Yarımada** özelliği (üç tarafı denizle çevrili) ticareti ve turizmi destekler.
- Komşuları: Yunanistan, Bulgaristan, Gürcistan, Ermenistan, Azerbaycan (Nahçıvan), İran, Irak, Suriye.
- Önemli ve **jeopolitik değeri yüksek** bir ülke olması, siyasi ve ekonomik ilişkilerde etkisini artırır.

:::neden-sonuc
- Doğuya gidiliyor => Yerel saat ileri alınır (15° = 1 saat).
- Türkiye 36° ile 42° kuzey enlemleri arasında => Orta kuşakta yer alır, dört mevsim yaşanır.
- Türkiye üç kıtanın kavşağında => Tarih boyunca ticaret yolları ve boğazlar önem kazanmıştır.
- Boylam farkı 19° => En doğu ile en batı arasında 76 dakika yerel saat farkı vardır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Yerel saati hesaplarken yönü karıştırma.** Doğuya gidince saat **ileri**, batıya gidince **geri** olur. Bir de **farklı yarım kürelerde çıkarma yapma**: Greenwich’in iki tarafındaki yerler arasında boylamlar **toplanır**. **Kutuplarda boylam derecelerinin arası sıfırdır**, enlem dereceleri ise her yerde yaklaşık 111 km’dir.
:::

:::baglanti
Bu konu, “Dünya’nın Şekli ve Hareketleri” konusundaki dönüş hareketinin (15° = 1 saat) bir uygulamasıdır. “Harita Bilgisi” konusunda enlem ve boylam ağı haritada nasıl kullanıldığını göreceksin. “Bölgeler” ve “Ulaşım Hatları” konusunda Türkiye’nin özel konumu ulaşım ve ticaretle ilişkilendirilir. Tarihte “Dünya Gücü Osmanlı” ve “Milli Mücadele” konularındaki Boğazlar, bu özel konumun sonucudur.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Enlem | 0° ile 90°, ekvatordan uzaklık, 1° yaklaşık 111 km |
| Boylam | 0° ile 180°, Greenwich’ten uzaklık |
| Yerel saat | 1° = 4 dk, 15° = 1 saat |
| Doğu | Saat ileri |
| Türkiye enlem | 36° ile 42° K |
| Türkiye boylam | 26° ile 45° D |
| Ortak saat | 45° D meridyeni |
| Özel konum | Kıtaların kavşağı, boğazlar |

## Mini test

:::soru{cevap="B"}
Boylamı 30° D olan A kentinde yerel saat 14.00 iken boylamı 75° D olan B kentinde yerel saat kaçtır?

- A) 11.00
- B) 17.00
- C) 15.00
- D) 19.00
- E) 16.00

---

1. Boylam farkı $75 - 30 = 45°$, aynı yarım kürede olduğu için çıkarılır.
2. $45 \div 15 = 3$ saat. B kenti doğuda olduğundan saat ileri alınır: $14.00 + 3 = 17.00$. Doğru cevap B.

Diğer şıklar: **11.00** doğuya gidilirken saat geri alınmış / **15.00** boylam farkı 15° (1 saat) sanılmış / **19.00** B kentinin boylamı tek başına 15’e bölünüp eklenmiş / **16.00** A kentinin boylamı tek başına 15’e bölünüp eklenmiş.
:::

:::soru{cevap="D"}
A kentinde yerel saat 09.00, B kentinde yerel saat 13.00 olduğuna göre iki kent arasındaki boylam farkı kaç derecedir? (B kenti A’nın doğusundadır.)

- A) 4
- B) 15
- C) 16
- D) 60
- E) 120

---

1. Yerel saat farkı $13 - 9 = 4$ saattir.
2. 1 saat 15° olduğundan boylam farkı $4 \cdot 15 = 60°$. Doğru cevap D.

Diğer şıklar: **4** saat farkı boylam farkı sanılmış / **15** tek saatlik boylam farkı alınmış / **16** saat farkı 4 ile çarpılmış / **120** dakika cinsinden bulunan değer alınmış.
:::

:::soru{cevap="D"}
Türkiye’nin kuzey ucu 42° K, güney ucu 36° K enleminde yer almaktadır. Bir enlem derecesi arası yaklaşık 111 km olduğuna göre Türkiye’nin kuzey-güney arası uzaklığı yaklaşık kaç km’dir?

- A) 111
- B) 444
- C) 555
- D) 666
- E) 888

---

1. Enlem farkı $42 - 36 = 6°$.
2. $6 \cdot 111 = 666\ \text{km}$. Doğru cevap D.

Diğer şıklar: **111** tek enlem derecesinin uzaklığı alınmış / **444** enlem farkı 4 alınmış / **555** enlem farkı 5 alınmış / **888** enlem farkı 8 alınmış.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi Türkiye’nin özel (göreceli) konumunun bir sonucudur?

- A) Boğazlar üzerinden deniz yolunu kontrol etmesi
- B) Doğu-batı yönünde 76 dakikalık yerel saat farkı olması
- C) Güneş ışınlarının yıl boyunca eğik gelmesi
- D) Dört mevsimin belirgin yaşanması
- E) Orta kuşakta yer alması

---

1. Özel konum, bir yerin çevresindeki denizler, boğazlar, ülkeler ve yollara göre konumudur.
2. Boğazların kontrolü özel konumun sonucudur, diğerleri enlem ve boylamdan (matematik konum) kaynaklanır. Doğru cevap A.

Diğer şıklar: **Doğu-batı yönünde 76 dakikalık yerel saat farkı olması** bu sonuç matematik konumdan kaynaklanır / **Güneş ışınlarının yıl boyunca eğik gelmesi** bu sonuç matematik konumdan kaynaklanır / **Dört mevsimin belirgin yaşanması** bu sonuç matematik konumdan kaynaklanır / **Orta kuşakta yer alması** bu sonuç matematik konumdandır.
:::

## Kendini dene

:::dene
1. Başlangıç meridyeni hangisidir? => Greenwich (0°).
2. Boylam farkı 30° olan iki yer arasındaki saat farkı kaç saattir? => 2 saat.
3. Türkiye hangi paraleller arasındadır? => 36° ile 42° kuzey.
4. Türkiye’nin ortak saati hangi meridyene göredir? => 45° doğu.
5. Türkiye’de en doğu ve en batı arasındaki yerel saat farkı nedir? => 76 dakika.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-cog' and name = 'Coğrafi Konum'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Paralel ve meridyen, enlem ve boylam, yön bulma, yerel saat ve ortak saat, mutlak ve göreceli konum, Türkiye'nin matematik ve özel konumu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Hesaplar betikle doğrulandı. Türkiye'nin enlem, boylam ve yüzölçümü değerleri ders kitabı bilgileridir.
Kontrol edilecekler: Enlem derecesi uzunluğundaki küçük farklar (110,6 ve 111,7 km) kaynakla teyit edilmeli. Türkiye'nin ortak saati (UTC+3) ve 76 dakikalık fark hesabı ders kitabına göre kontrol edilmeli. Komşu listesi güncel siyasi duruma göre doğrulanmalı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Coğrafi Konum'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir yolu bulmak, bir şehri planlamak, bir barajın nereye yapılacağına karar vermek için **haritaya** bakılır. Harita yeryüzünün küçültülmüş ve düzlem üzerindeki gösterimidir. Bu konuda haritaların **temel öğelerini**, **ölçek hesabını**, **harita türlerini**, **izohips (eş yükselti) eğrilerini**, yamaç eğimini ve haritaların çarpılmasına yol açan **projeksiyonları** öğreneceksin.

:::hedefler
1. Haritanın temel öğelerini (başlık, ölçek, yön oku, lejant) söylemek.
2. Ölçek hesabı yapmak, büyük ve küçük ölçekli harita farkını açıklamak.
3. İzohips eğrilerinden yükselti, eğim ve yer şekli yorumlamak.
4. Eğim yüzdesini hesaplamak.
5. Projeksiyon çeşitlerini ve haritalardaki çarpılmayı açıklamak.
:::

## 1. Harita ve temel öğeleri

**Harita:** Yeryüzünün tamamının ya da bir bölümünün belli bir **ölçekle küçültülerek, kuşbakışı görünümde düzleme çizilmiş** hâlidir.

**Haritada bulunması gereken öğeler:**

- **Başlık:** Haritanın neyi gösterdiği.
- **Ölçek:** Küçültme oranı.
- **Yön oku:** Haritanın yönü. Yön oku yoksa **kuzey haritanın üst kenarıdır.**
- **Lejant (işaret anahtarı):** Haritada kullanılan renk ve simgelerin açıklaması.
- **Koordinat ağı:** Enlem ve boylam çizgileri.
- **Kaynak ve yapım tarihi.**

## 2. Ölçek

**Ölçek**, harita üzerindeki uzaklığın gerçek uzaklığa oranıdır. İki türü vardır:

- **Kesir ölçek:** $\dfrac{1}{100\,000}$ gibi. Haritada 1 cm, gerçekte 100 000 cm (**1 km**) demektir.
- **Çizgi ölçek:** Haritaya çizilmiş cetvel. Üzerinde kaç km olduğu yazılır. **Harita büyütülüp küçültülse de doğru kalır.**

**Hesap:** Gerçek uzaklık = harita üzerindeki uzaklık $\times$ ölçeğin paydası. Sonucu cm’den km’ye çevirmek için 100 000’e bölünür.

**Örnek.** Ölçeği $\dfrac{1}{250\,000}$ olan bir haritada iki kent arası 8 cm ise gerçek uzaklık $8 \cdot 250\,000 = 2\,000\,000\ \text{cm} = 20\ \text{km}$.

**Büyük ve küçük ölçek:**

- **Büyük ölçekli harita** ($\dfrac{1}{1\,000}$, $\dfrac{1}{25\,000}$): **Küçük alan**, çok ayrıntı gösterir. Kent planı, mahalle haritası.
- **Küçük ölçekli harita** ($\dfrac{1}{5\,000\,000}$): **Büyük alan**, az ayrıntı gösterir. Dünya ve ülke haritası.
- Paydası **küçük olan** ölçek (kesir olarak daha büyük) büyük ölçektir. Ölçek büyüdükçe ayrıntı artar, gösterilen alan küçülür.

## 3. Harita türleri

| Tür | Ne gösterir |
| --- | --- |
| **Fiziki harita** | Yer şekillerini, yükseltiyi, nehir ve gölleri (renklerle) |
| **Siyasi harita** | Ülke sınırları, il ve şehirler |
| **Topografya haritası** | Yer şekilleri izohips eğrileriyle, ayrıntılı ve büyük ölçekli |
| **Tematik harita** | Nüfus yoğunluğu, yağış, tarım ürünü gibi tek bir konu |
| **Kadastro, imar haritası** | Mülkiyet ve yapılaşma |

## 4. İzohips (eş yükselti) eğrileri

**İzohips**, deniz seviyesinden **aynı yükseklikteki noktaları birleştiren** eğrilerdir. Topografya haritalarında kullanılır.

![Solda tepeyi gösteren kapalı halkalar, sağda izohips sıklığına göre eğim farkı. Eğriler sıkışınca yamaç diktir](/lessons/tyt-cog/izohips.svg "İzohips eğrileri | Yolumnet")

**Kurallar:**

- İzohips eğrileri **birbirini kesmez** ve birleşmez. Yalnızca çok dik uçurumlarda üst üste gelebilir.
- **Eğriler sık** ise **eğim fazla** (dik yamaç), **seyrek** ise **eğim az**dır.
- **Kapalı halkalar:** İçe doğru yükselti artıyorsa **tepe**, azalıyorsa **çukur** (çukur izohipsleri dışa doğru tırtıklı çizilir).
- **Vadi:** İzohipsler **yüksek kotlara doğru V şeklinde** kıvrılır. V’nin ucu yükseltiye doğru bakar. Akarsu bu V’nin içinde akar.
- **Sırt:** İzohipsler **alçak kotlara doğru** V ya da U biçiminde bükülür.
- **Boyun:** İki tepe arasındaki alçak geçit.
- **Akarsu yönü:** Vadinin V’si yüksek yere bakar, akarsu **alçak kota doğru** akar.

**Eğim hesabı:**

$$\text{Eğim} (\%) = \dfrac{\text{Yükselti farkı}}{\text{Yatay uzaklık}} \cdot 100$$

Yükselti farkı ve yatay uzaklık **aynı birimde** (metre) olmalıdır.

**Örnek.** Yatay uzaklığı 2 km olan A ve B noktaları arasında yükselti farkı 100 m ise eğim $\dfrac{100}{2000} \cdot 100 = \%5$’tir.

**Profil çıkarma:** İki nokta arasında kesit alarak yükseltinin nasıl değiştiğini grafiğe dökmek. Eğim, yer şekli ve görüş analizi yapmak için kullanılır.

## 5. Projeksiyon

Yeryüzü **küre** biçimindedir, harita ise **düzlem**dir. Küreyi düzlem üzerine çizerken **çarpılma** kaçınılmazdır. Bu çarpılmayı azaltmak için **projeksiyon** yöntemleri geliştirilmiştir.

| Projeksiyon | Özellik |
| --- | --- |
| **Silindirik** | Ekvator çevresi doğru, kutuplara doğru alan büyür. Dünya haritası, kutup bölgeleri çarpık |
| **Konik** | Orta enlemlerin (örneğin Türkiye) gösterimi uygundur |
| **Düzlem (azimutal)** | Kutup bölgeleri için uygun |

Hiçbir projeksiyon bütün özellikleri (alan, yön, uzaklık, şekil) aynı anda doğru gösteremez. Haritanın amacına göre uygun projeksiyon seçilir. **Küre (glob)** yeryüzünü çarpıtmadan gösterir.

:::neden-sonuc
- Haritanın ölçeği büyüyor => Gösterilen alan küçülür, ayrıntı artar.
- İzohipsler sıklaşıyor => Eğim artar, yamaç diktir.
- Kürenin yüzeyi düzleme çiziliyor => Alan, şekil ya da uzaklıkta çarpılma olur.
- Haritada yön oku yok => Kuzey haritanın üst kenarıdır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Büyük ölçeği büyük alan sanma.** Büyük ölçekli harita **küçük alanı** ayrıntılı gösterir. $\dfrac{1}{25\,000}$ ölçek $\dfrac{1}{1\,000\,000}$’dan büyüktür. Bir de **ölçek hesabında birimi karıştırma**: Cm’den km’ye çevirirken 100 000’e bölmeyi unutma. **Eğimde** yükselti farkını ve yatay uzaklığı aynı birime (metre) çevir.
:::

:::baglanti
Bu konu, “Coğrafi Konum” konusundaki enlem-boylam ağının haritada nasıl kullanıldığını gösterir. “Türkiye’nin Yer Şekilleri” konusunda yükselti ve dağ, ova gibi şekilleri haritalardan okuyacaksın. “Doğa ve İnsan” konusundaki CBS ve uzaktan algılama, haritacılığın modern araçlarıdır. Matematikteki “Oran ve Orantı” konusu ölçek hesaplarında, “Analitik Geometri” konusu koordinat sisteminde kullanılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ölçek | Harita uzaklığı / gerçek uzaklık |
| Gerçek uzaklık | Harita uzaklığı $\times$ payda |
| Büyük ölçek | Küçük alan, çok ayrıntı |
| Küçük ölçek | Büyük alan, az ayrıntı |
| İzohips | Eş yükselti eğrisi |
| Sık izohips | Dik yamaç |
| Vadi | İzohipsler yükseğe doğru V |
| Eğim | Yükselti farkı / yatay uzaklık $\cdot$ 100 |
| Projeksiyon | Küreyi düzleme geçirme, çarpılma |

## Mini test

:::soru{cevap="C"}
Ölçeği $\dfrac{1}{500\,000}$ olan bir haritada iki şehir arasındaki uzaklık 6 cm olarak ölçülmüştür. Bu iki şehir arasındaki gerçek uzaklık kaç km’dir?

- A) 3
- B) 6
- C) 30
- D) 300
- E) 3000

---

1. Gerçek uzaklık $6 \cdot 500\,000 = 3\,000\,000\ \text{cm}$.
2. $3\,000\,000\ \text{cm} = 30\ \text{km}$. Doğru cevap C.

Diğer şıklar: **3** bir sıfır fazla atılmış / **6** haritadaki uzaklık gerçek uzaklık sanılmış / **300** bir sıfır eksik atılmış / **3000** iki sıfır eksik atılmış.
:::

:::soru{cevap="C"}
Aşağıdaki ölçeklerden hangisiyle çizilmiş harita, aynı büyüklükteki kâğıtta en küçük alanı en ayrıntılı biçimde gösterir?

- A) $\dfrac{1}{25\,000}$
- B) $\dfrac{1}{500\,000}$
- C) $\dfrac{1}{1\,000}$
- D) $\dfrac{1}{5\,000\,000}$
- E) $\dfrac{1}{50\,000\,000}$

---

1. Paydası küçük olan ölçek büyük ölçektir. Büyük ölçek küçük alanı çok ayrıntılı gösterir.
2. En küçük payda $1\,000$ olduğu için doğru cevap C.

Diğer şıklar: **$\dfrac{1}{25\,000}$** paydası büyük olan ölçek daha az ayrıntı gösterir / **$\dfrac{1}{500\,000}$** bu ölçek geniş alan ve az ayrıntı gösterir / **$\dfrac{1}{5\,000\,000}$** bu ölçek çok geniş alan ve çok az ayrıntı gösterir / **$\dfrac{1}{50\,000\,000}$** bu ölçek en küçük ölçeklerden biridir ve dünya düzeyi gösterir.
:::

:::soru{cevap="C"}
Bir topografya haritasında A bölgesinde izohips eğrileri birbirine çok yakın, B bölgesinde ise birbirinden uzak çizilmiştir. Bu durumla ilgili aşağıdakilerden hangisi söylenebilir?

- A) B bölgesinin eğimi A bölgesinden daha fazladır.
- B) A bölgesi çukur, B bölgesi tepedir.
- C) A bölgesinin eğimi B bölgesinden daha fazladır.
- D) İki bölgenin yükseltisi aynıdır.
- E) A bölgesinde akarsu akamaz.

---

1. İzohips eğrileri sık ise iki kot arasındaki yatay uzaklık kısadır, yamaç diktir.
2. A bölgesi B bölgesinden daha eğimlidir. Doğru cevap C.

Diğer şıklar: **B bölgesinin eğimi A bölgesinden daha fazladır.** seyrek izohips az eğim demektir / **A bölgesi çukur, B bölgesi tepedir.** sıklık çukur ya da tepeyi göstermez / **İki bölgenin yükseltisi aynıdır.** izohipsler farklı kotları gösterir / **A bölgesinde akarsu akamaz.** dik yamaçlarda akarsu daha hızlı akar.
:::

:::soru{cevap="B"}
Yatay uzaklığı 5 km olan iki nokta arasındaki yükselti farkı 150 m’dir. Bu iki nokta arasındaki ortalama eğim yüzde kaçtır?

- A) 1
- B) 3
- C) 5
- D) 30
- E) 150

---

1. Yatay uzaklık $5\ \text{km} = 5000\ \text{m}$.
2. Eğim $= \dfrac{150}{5000} \cdot 100 = \%3$. Doğru cevap B.

Diğer şıklar: **1** yükselti farkı 50 m alınmış / **5** yatay uzaklık eğim sanılmış / **30** yatay uzaklık metreye çevrilmemiş (150/5) / **150** yükselti farkı eğim sanılmış.
:::

## Kendini dene

:::dene
1. 1/100 000 ölçekli haritada 1 cm gerçekte kaç km’dir? => 1 km.
2. Hangi ölçek daha büyüktür: 1/25 000 mi 1/500 000 mi? => 1/25 000.
3. İzohips eğrileri sıklaşırsa eğim nasıl olur? => Artar.
4. Yön oku yoksa kuzey neresidir? => Haritanın üst kenarı.
5. Yükselti farkı 50 m, yatay uzaklık 1 km ise eğim yüzde kaçtır? => %5.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Harita Bilgisi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Harita ve öğeleri, ölçek ve ölçek hesabı, harita türleri, izohips ve eğim, projeksiyonlar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Hesaplar betikle doğrulandı.
Kontrol edilecekler: Projeksiyon tablosu sadeleştirildi (silindirik, konik, düzlem). İzohipslerin kesişmeyeceği kuralı için uçurum istisnası ders kitabına göre teyit edilmeli. Profil çıkarma anlatımı kısa tutuldu.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Harita Bilgisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabah evden çıkarken şemsiye alıp almamayı, yazın nereye tatile gideceğini, bir bölgede hangi ürünün yetişeceğini belirleyen şey **hava durumu ve iklimdir**. Hava durumu kısa süreli, iklim ise uzun yıllara ait ortalama hava olaylarıdır. Bu konuda **atmosferin yapısını**, **sıcaklık, basınç, rüzgâr, nem ve yağış** gibi iklim elemanlarını, **iklim tiplerini** ve **Türkiye’nin iklimini** öğreneceksin.

:::hedefler
1. Atmosferin bileşimini ve katmanlarını özellikleriyle sıralamak.
2. Sıcaklığın dağılışını etkileyen etmenleri açıklamak.
3. Basınç ve rüzgâr ilişkisini, rüzgâr çeşitlerini yorumlamak.
4. Yağış türlerini ve oluşum şartlarını ayırt etmek.
5. Dünya iklim tiplerini ve Türkiye’deki iklim tiplerini tanımak.
:::

## 1. Atmosfer

**Atmosfer**, Dünya’yı saran gaz tabakasıdır. Dünya’nın çekim gücü onu tutar.

**Bileşimi:** Yaklaşık **%78 azot**, **%21 oksijen**, geri kalan %1 argon, karbondioksit, su buharı ve diğer gazlardır.

**Önemi:** Canlıların soluduğu havayı sağlar, Güneş’in zararlı ışınlarını (UV) süzer, sıcaklığı dengeler (sera etkisi), hava olaylarını oluşturur, meteorları yakar.

![Atmosferin katmanları. Aşağıdan yukarıya troposfer, stratosfer, mezosfer, termosfer ve ekzosfer](/lessons/tyt-cog/atmosfer-katmanlari.svg "Atmosferin katmanları | Yolumnet")

| Katman | Özellik |
| --- | --- |
| **Troposfer** (0 ile 12 km, ekvatorda daha kalın) | Hava olaylarının görüldüğü, canlıların yaşadığı katman. **Yükseldikçe sıcaklık azalır.** Su buharının tamamına yakını burada |
| **Stratosfer** (12 ile 50 km) | **Ozon tabakası** burada. Yukarı doğru sıcaklık artar. Uçaklar uçar |
| **Mezosfer** (50 ile 80 km) | En soğuk katman. **Meteorlar** burada yanar |
| **Termosfer** (80 ile yaklaşık 500 km) | Sıcaklık çok artar. **Radyo dalgaları** yansır. Kutup ışıkları burada oluşur |
| **Ekzosfer** | Gazların uzaya karıştığı üst sınır |

## 2. Sıcaklık

Sıcaklık, güneş enerjisinin yeryüzünü ısıtmasıyla oluşur. Dağılışını etkileyen etmenler:

- **Enlem (Güneş ışınlarının geliş açısı):** Ekvatordan kutuplara doğru sıcaklık azalır.
- **Yükselti:** Yükseldikçe sıcaklık düşer. **Her 200 metrede yaklaşık 1°C** azalır.
- **Kara ve denizlerin dağılışı:** Karalar çabuk ısınıp çabuk soğur, denizler geç ısınıp geç soğur. Kıyıda sıcaklık farkı az, iç kesimde fazladır (**karasal etki**).
- **Okyanus akıntıları:** Sıcak akıntı geçtiği kıyıyı ısıtır, soğuk akıntı soğutur.
- **Bakı:** Güneye bakan yamaçlar (Kuzey Yarım Küre’de) daha sıcaktır.
- **Bitki örtüsü, rüzgârlar, bulutluluk** ve **kar örtüsü** da etkilidir.

**İzoterm:** Aynı sıcaklıktaki yerleri birleştiren eğridir.

**Örnek.** Deniz seviyesinde sıcaklığı 20°C olan yerde 600 m yükseklikte sıcaklık $\dfrac{600}{200} = 3°\text{C}$ azalır, 17°C olur.

## 3. Basınç ve rüzgâr

**Basınç**, havanın yeryüzüne yaptığı ağırlıktır. Birimi **milibar (mb)** ya da hPa’dır. Deniz seviyesinde ortalama **1013 mb**.

- **Yükseldikçe basınç azalır** (yaklaşık her 10 m’de 1 mb).
- **Sıcaklık artarsa hava genleşir, basınç düşer.** Sıcak yerlerde **alçak basınç**, soğuk yerlerde **yüksek basınç** oluşur.
- **Rüzgâr:** Yüksek basınçtan alçak basınca doğru esen hava hareketidir. Basınç farkı arttıkça (izobarlar sıklaşırsa) **rüzgâr hızı artar.**
- **Coriolis kuvveti** rüzgârı Kuzey Yarım Küre’de **sağa**, Güney’de **sola** saptırır.

**Örnek.** Deniz seviyesinde 1013 mb olan basınç 500 m yükseklikte $500 \div 10 = 50$ mb azalarak 963 mb olur.

**Rüzgâr çeşitleri:**

- **Sürekli rüzgârlar:** Alizeler (dönenceler çevresinden ekvatora), batı rüzgârları (orta enlemlerde batıdan doğuya), kutup doğu rüzgârları.
- **Mevsimlik rüzgârlar:** **Muson** rüzgârları. Yazın denizden karaya (yağışlı), kışın karadan denize (kurak).
- **Yerel rüzgârlar:** Meltem (gündüz denizden karaya, gece karadan denize), fön (dağdan inen kuru ve sıcak rüzgâr).

## 4. Nem ve yağış

- **Nem:** Havadaki su buharıdır. **Mutlak nem** (havada kaç gram su buharı) ve **bağıl nem** (havanın taşıyabileceği buhara oranı, yüzde).
- Sıcak hava daha çok buhar taşır. Soğuyunca fazla buhar **yoğunlaşır**, bulut ve yağış oluşur.

**Yağış çeşitleri (oluşuma göre):**

- **Konveksiyonel (Yükselim) yağışı:** Isınan, nemli havanın yükselip soğuyarak sağanak yağış bırakması. Ekvator bölgesi ve yaz aylarında iç kesimler.
- **Orografik (Yamaç) yağışı:** Nemli havanın dağ yamacında zorla yükselip soğuması ve rüzgâra bakan yamaçta yağış bırakması. **Rüzgâr altı yamaç ise kurak kalır.** Karadeniz’in dağ yamaçları.
- **Cephesel yağış:** Sıcak ve soğuk hava kütlelerinin karşılaşmasında oluşur. Orta kuşakta sık görülür.

**Yağış şekilleri:** Yağmur, kar, dolu, sis, çiğ, kırağı.

## 5. İklim tipleri

**İklim**, bir yerde uzun yıllar boyunca gözlenen ortalama hava koşullarıdır.

| İklim | Özellik | Bitki örtüsü |
| --- | --- | --- |
| **Ekvatoral** | Yıl boyu sıcak ve yağışlı | Yağmur ormanları |
| **Muson** | Yaz yağışlı, kış kurak | Muson ormanı |
| **Savan** | Sıcak, yağış mevsimlik | Savan (uzun otlar, ağaççıklar) |
| **Çöl** | Çok az yağış, gece ve gündüz sıcaklık farkı büyük | Seyrek çöl bitkileri |
| **Akdeniz** | Yazlar sıcak ve kurak, kışlar ılık ve yağışlı | **Maki** |
| **Okyanusal** | Yıl boyu yağışlı, serin | Geniş yapraklı ve karışık orman |
| **Karasal** | Kışlar soğuk, yazlar sıcak, yağış az | **Bozkır**, iğne yapraklı orman |
| **Tundra ve kutup** | Çok soğuk | Yosun ve likenler, buzul |

## 6. Türkiye’nin iklimi

Türkiye **orta kuşakta** yer alır, **dört mevsim** görülür. Üç iklim tipi egemendir:

- **Akdeniz iklimi:** Akdeniz ve Ege kıyıları. Yazlar sıcak ve kurak, kışlar ılık ve yağışlıdır. Bitki örtüsü **maki**. Zeytin, narenciye, pamuk.
- **Karadeniz iklimi:** Karadeniz kıyısı. **Her mevsim yağışlıdır**, yazlar serin, kışlar ılıktır. Bitki örtüsü **geniş yapraklı orman**. Çay, fındık.
- **Karasal iklim:** İç kesimler ve Doğu Anadolu. Kışlar soğuk ve kar yağışlı, yazlar sıcak ve kurak. Bitki örtüsü **bozkır**. Buğday ve arpa tarımı, hayvancılık.

**Marmara** bölgesi, bu iklimlerin **geçiş** özelliklerini gösterir. Türkiye’de iklimin farklı olmasında **dağların kıyıya paralel uzanması**, deniz etkisinin iç kesimlere girememesi ve **yükselti** etkilidir.

:::neden-sonuc
- Yükseltiye çıkılıyor => Sıcaklık ve basınç azalır.
- Hava ısınıyor => Genleşir, alçak basınç oluşur.
- Nemli hava dağ yamacından yükseliyor => Rüzgâra bakan yamaçta orografik yağış oluşur.
- Dağlar kıyıya paralel uzanıyor => Deniz etkisi iç kesimlere giremez, karasallık artar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Hava durumu ile iklimi karıştırma.** Hava durumu kısa süreli, iklim uzun yıllık ortalamadır. Bir de **sıcak havanın yüksek basınç oluşturduğunu sanma**: Sıcak hava **alçak basınç** oluşturur. **Rüzgârın alçaktan yükseğe estiğini sanma**: Rüzgâr yüksek basınçtan alçak basınca eser.
:::

:::baglanti
Bu konu, “Dünya’nın Şekli ve Hareketleri” konusundaki Güneş ışınlarının geliş açısı ve Coriolis kuvvetinin devamıdır. “Su, Toprak ve Bitki” konusunda iklimin bitki örtüsünü ve toprağı belirlemesini göreceksin. “Doğal Afetler” konusunda sel, kuraklık ve çığ iklim olaylarıyla ilişkilendirilir. Biyolojideki “Güncel Çevre Sorunları” konusunda sera etkisi ve küresel ısınma atmosferin bileşimiyle ilgilidir. Fizikte “Isı ve Sıcaklık” konusu sıcaklık ve basınç ilişkisini destekler.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Bileşim | %78 azot, %21 oksijen |
| Troposfer | Hava olayları, yükseldikçe sıcaklık azalır |
| Stratosfer | Ozon tabakası |
| Sıcaklık | Yükseldikçe her 200 m’de yaklaşık 1°C azalır |
| Basınç | Yükseldikçe azalır (10 m’de 1 mb) |
| Rüzgâr | Yüksek basınçtan alçak basınca |
| Orografik yağış | Dağ yamacı |
| Akdeniz iklimi | Yaz kurak, maki |
| Karadeniz iklimi | Her mevsim yağışlı |

## Mini test

:::soru{cevap="C"}
Deniz seviyesinde sıcaklığı 24°C olan bir yerden 1800 m yükseklikteki bir noktaya çıkıldığında, sıcaklığın her 200 m’de 1°C azaldığı kabul edilirse bu noktadaki sıcaklık kaç °C olur?

- A) 6
- B) 9
- C) 15
- D) 16
- E) 33

---

1. Sıcaklık düşüşü $\dfrac{1800}{200} = 9°\text{C}$.
2. Sıcaklık $24 - 9 = 15°\text{C}$. Doğru cevap C.

Diğer şıklar: **6** her 100 m’de 1°C azalma uygulanmış / **9** düşüş miktarı sıcaklık sanılmış / **16** işlem hatasıyla bir fazla bulunmuş / **33** sıcaklık azalmak yerine artırılmış.
:::

:::soru{cevap="A"}
Deniz seviyesinde basıncın 1013 mb olduğu bir bölgede 300 m yükseklikteki bir yerleşimde, basıncın her 10 m’de 1 mb azaldığı kabul edilirse basınç kaç mb olur?

- A) 983
- B) 984
- C) 1010
- D) 1013
- E) 1043

---

1. Basınç azalması $\dfrac{300}{10} = 30\ \text{mb}$.
2. Basınç $1013 - 30 = 983\ \text{mb}$. Doğru cevap A.

Diğer şıklar: **984** işlem hatasıyla bir fazla bulunmuş / **1010** yükselti 30 m alınmış / **1013** yükselti ile basınç değişmez sanılmış / **1043** basınç azalmak yerine artırılmış.
:::

:::soru{cevap="E"}
Bir dağın deniz tarafındaki yamacında nemli havanın zorla yükselip soğuması sonucu bol yağış alınırken dağın diğer yamacı kurak kalıyor. Buradaki yağış türü aşağıdakilerden hangisidir?

- A) Konveksiyonel yağış
- B) Cephesel yağış
- C) Muson yağışı
- D) Çiğ ve kırağı
- E) Orografik (yamaç) yağışı

---

1. Nemli havanın dağ yamacında yükselip soğuması orografik yağışın özelliğidir.
2. Rüzgâr altı yamaç kurak kalır. Doğru cevap E.

Diğer şıklar: **Konveksiyonel yağış** konveksiyonel yağış ısınan havanın dikey yükselmesiyle oluşur / **Cephesel yağış** cephesel yağışta iki hava kütlesi karşılaşır / **Muson yağışı** muson mevsimlik rüzgârlarla ilişkilidir / **Çiğ ve kırağı** çiğ ve kırağı yoğunlaşma ürünleridir, yağış çeşidi değildir.
:::

:::soru{cevap="C"}
Yazları sıcak ve kurak, kışları ılık ve yağışlı olan, bitki örtüsünün maki olduğu bir bölgenin iklim tipi aşağıdakilerden hangisidir?

- A) Karadeniz iklimi
- B) Karasal iklim
- C) Akdeniz iklimi
- D) Ekvatoral iklim
- E) Muson iklimi

---

1. Sıcak ve kurak yaz, ılık ve yağışlı kış ile maki bitki örtüsü Akdeniz iklimine özgüdür.
2. Doğru cevap C.

Diğer şıklar: **Karadeniz iklimi** Karadeniz’de yaz kurak olmaz, yıl boyu yağış vardır / **Karasal iklim** karasal iklimde kışlar soğuktur ve bitki örtüsü bozkırdır / **Ekvatoral iklim** ekvatoral iklim yıl boyu yağışlıdır / **Muson iklimi** muson iklimi yaz yağışlı ve kış kuraktır.
:::

## Kendini dene

:::dene
1. Atmosferde en çok bulunan gaz hangisidir? => Azot.
2. Hava olaylarının görüldüğü katman hangisidir? => Troposfer.
3. Sıcak hava hangi basıncı oluşturur? => Alçak basınç.
4. Dağ yamacında zorla yükselen nemli havanın bıraktığı yağış nedir? => Orografik yağış.
5. Karadeniz iklimi hangi özelliğiyle bilinir? => Her mevsim yağışlıdır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-cog' and name = 'Atmosfer ve İklim'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Atmosferin bileşimi ve katmanları, sıcaklığı etkileyen etmenler, basınç ve rüzgâr, nem ve yağış, iklim tipleri, Türkiye'nin iklimi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Atmosfer bileşimi ve katman sınırları genel değerlerdir.
Kontrol edilecekler: Yükseltiyle sıcaklık ve basınç azalması "her 200 m'de 1°C" ve "her 10 m'de 1 mb" ders kitabı kolaylaştırmasıdır. Katman yükseklikleri kaynaklara göre biraz değişir. Rüzgâr çeşitleri kısaltıldı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Atmosfer ve İklim'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Dağlar nasıl oluşur, nehirler vadileri nasıl oyar, bir volkan neden patlar, bir deprem neden olur, mağaralarda sarkıtlar nasıl oluşur? Yeryüzü şekilleri iki zıt güç tarafından sürekli yeniden biçimlendirilir: **İç kuvvetler** (yerin içinden gelen, yeryüzünü yükselten, kıran, kıvıran) ve **dış kuvvetler** (güneş enerjisiyle çalışan, yeryüzünü aşındıran ve biriktiren). Bu konuda **levha hareketlerini**, **dağ oluşumunu**, volkan ve depremi, **akarsu, buzul, rüzgâr, kıyı ve karst şekillerini** öğreneceksin.

:::hedefler
1. Levha hareketlerini ve sınır türlerini açıklamak.
2. Orojenez, epirojenez, volkanizma ve depremin oluşumunu anlatmak.
3. Ayrışma, aşınma, taşınma ve birikme kavramlarını ayırt etmek.
4. Akarsu, buzul, rüzgâr, kıyı ve karst şekillerini sıralamak.
5. Türkiye’deki fay hatlarını ve levhaların etkilerini yorumlamak.
:::

## 1. İç kuvvetler

İç kuvvetlerin kaynağı **yerin içindeki ısıdır.** Bu kuvvetler yeryüzünü **kabartır, kırar, kıvırır**, yani yer şekilleri **oluşturur**.

### Levha hareketleri

Yerkabuğu, **levha** adı verilen büyük parçalara bölünmüştür. Levhalar mantonun üstünde çok yavaş (yılda birkaç cm) hareket eder.

![Levhaların üç sınır türü. Yakınsakta çarpışma ve dalma-batma, ıraksakta yeni kabuk oluşumu, yanalda birbirini sıyırma](/lessons/tyt-cog/levha-sinirlari.svg "Levha sınırları | Yolumnet")

- **Yakınsak (çarpışan) sınır:** Levhalar birbirine yaklaşır. Biri diğerinin altına dalar (**dalma-batma**) ya da çarpışarak **kıvrım dağlarını** (Alpler, Himalayalar, Toroslar) oluşturur. Depremler ve volkanlar görülür.
- **Iraksak (ayrılan) sınır:** Levhalar birbirinden uzaklaşır. Araya **yeni kabuk** yükselir. **Okyanus ortası sırtları**, Doğu Afrika yarılma vadisi.
- **Yanal (sıyrılan) sınır:** Levhalar birbirinin yanından kayar. **Fay** oluşur, **deprem** görülür. Kuzey Anadolu Fay Hattı, San Andreas Fayı.

### Dağ oluşumu (orojenez)

- **Kıvrım dağları:** Yanal sıkışma ile tortulların kıvrılmasıyla oluşur. Genç dağlardır. **Alp-Himalaya dağ kuşağı** (Pireneler, Alpler, Toroslar, Kafkaslar, Himalayalar).
- **Kırık (blok) dağları:** Kabuğun kırılıp bir kısmının yükselmesi (**horst**), bir kısmının çökmesi (**graben**) ile oluşur. Türkiye’de **Gediz ve Büyük Menderes grabenleri**.
- **Epirojenez:** Karaların **yavaş yükselmesi ya da alçalması**. Teraslar, kıyı değişiklikleri.

### Volkanizma

**Magma**, yer yüzüne çıkınca **lav**, kül ve gaz olarak püskürür. Volkanlar çoğunlukla levha sınırlarında görülür.

- **Tabakalı (konik) volkan:** Erciyes, Ağrı.
- **Kalkan volkan:** Hawaii.
- **Kaldera:** Püskürmeden sonra tepenin çökmesiyle oluşan çukur. Nemrut Krater Gölü.
- **Sonuçlar:** Verimli volkanik toprak, jeotermal enerji, kaplıca ve sıcak su, ama can ve mal kaybı riski.

### Deprem

Yer kabuğunda biriken enerjinin **ani olarak serbest kalmasıyla** yer sarsılmasıdır.

- **Odak (hiposantr):** Depremin yerin içinde başladığı yer.
- **Yüzey merkezi (episantr):** Odağın yeryüzündeki dik izdüşümü, hasarın en fazla olduğu yer.
- **Büyüklük (magnitüd):** Açığa çıkan enerjidir. **Richter** ya da **moment ölçeğiyle** ölçülür. **Şiddet:** Depremin yeryüzünde yarattığı etkidir, **Mercalli** ölçeğiyle belirlenir. Bir depremin büyüklüğü tektir, şiddeti yerden yere değişir.
- **Sismograf** depremleri kaydeder.

## 2. Türkiye ve levhalar

Türkiye, **Alp-Himalaya deprem kuşağı** üzerinde yer alır. **Avrasya, Afrika ve Arap levhaları** arasında sıkışan **Anadolu levhası** vardır.

- **Kuzey Anadolu Fay Hattı (KAF):** Marmara’dan Doğu Anadolu’ya uzanan en önemli fay. 17 Ağustos 1999 İzmit (Kocaeli) depremi bu fay üzerinde gerçekleşmiştir.
- **Doğu Anadolu Fay Hattı (DAF):** Karlıova’dan Hatay’a. Şubat 2023 Kahramanmaraş depremleri bu fay sistemi ile ilgilidir.
- **Batı Anadolu graben sistemi:** Gediz, Büyük Menderes, Küçük Menderes. Ege’de deprem sık görülür.
- Türkiye’de **volkanlar** (Erciyes, Hasan, Ağrı, Nemrut, Süphan) ve **jeotermal** alanlar vardır.

## 3. Dış kuvvetler

Dış kuvvetlerin enerjisi **Güneş’ten** gelir. Yeryüzü şekillerini **aşındırır, taşır, biriktirir**. Genel olarak **yer şekillerini düzleştirme** eğilimindedir.

**Aşamalar:**

1. **Ayrışma (çözülme):** Kayaçların yerinde parçalanması. **Fiziksel** (donma-çözülme, sıcaklık farkı) ya da **kimyasal** (suyla çözülme).
2. **Aşınma:** Bir kuvvetin (akarsu, rüzgâr, buzul, dalga) kayaçları oyması.
3. **Taşınma:** Aşınan malzemenin başka yere götürülmesi.
4. **Birikme:** Taşınma gücü azalınca malzemenin bırakılması.

### Akarsu şekilleri

- **Aşındırma:** **V biçimli vadiler**, **kanyonlar**, boğazlar, şelaleler.
- **Birikme:** **Delta** (akarsuyun denize ya da göle döküldüğü yerde birikinti), **alüvyal ova**, **birikinti konisi**, **taraça** (eski vadi tabanının yükselmiş basamağı), **menderes** (kıvrımlı yatak). **Kızılırmak ve Büyük Menderes** deltaları.

### Buzul şekilleri

- **U biçimli vadi**, **sirk** (buzul oyuğu), **moren** (buzulun bıraktığı yığın), buzul gölleri.
- Türkiye’de Ağrı, Erciyes, Cilo ve Kaçkar dağlarında küçük buzullar var.

### Rüzgâr şekilleri

- **Aşındırma:** Mantar kaya, yardang.
- **Birikme:** **Kumul (kum tepesi)**, **lös** (ince tozların birikmesi). Çöl ve yarı kurak yerlerde, kıyılarda görülür.

### Kıyı şekilleri (dalga aşındırma)

- **Falez (yalıyar):** Dalgaların oyduğu dik kıyı.
- **Kum seti, lagün (kıyı gölü), tombolo (kumsalla bağlanan ada):** Birikme şekilleri.

### Karstik şekiller

**Kalker** gibi suda çözünen kayaçlarda suyun çözmesiyle oluşur. Türkiye’de **Toros Dağları** ve Göller Yöresi karstik bakımdan zengindir.

- **Lapya, dolin (obruk), uvala, polye** (karstik ova), **mağara**.
- **Sarkıt (stalaktit):** Tavandan sarkar. **Dikit (stalagmit):** Tabandan yükselir. İkisi birleşince **sütun** olur.

### Kütle hareketleri

Eğimli yamaçlarda malzemenin yerçekimiyle aşağı kayması. **Heyelan**, **çığ**, **toprak kayması**.

:::neden-sonuc
- İki levha birbirine yaklaşıyor => Dalma-batma ya da çarpışma, kıvrım dağları ve depremler oluşur.
- Yanal sınırda levhalar sürtünüyor => Fay oluşur, deprem olur.
- Akarsu denize ulaşıp hızı azalıyor => Taşıdığı malzemeyi bırakır, delta oluşur.
- Kalker bölgesinde su çözücü etki yapıyor => Karstik şekiller (dolin, mağara) oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Depremin büyüklüğü ile şiddetini karıştırma.** Büyüklük enerjidir, tek değerdir (Richter). Şiddet etkidir, yerden yere değişir (Mercalli). Bir de **iç kuvvetler ile dış kuvvetleri karıştırma**: İç kuvvetler yeryüzünü **oluşturur** (kıvrım, kırık, volkan, deprem), dış kuvvetler ise **aşındırıp biriktirerek şekillendirir**. **Sarkıt ve dikiti** ayır: Sarkıt tavandan, dikit tabandan.
:::

:::baglanti
Bu konu, “Türkiye’nin Yer Şekilleri” konusunda Türkiye’deki dağ, ova ve plato oluşumunu anlamak için temeldir. “Doğal Afetler” konusunda deprem ve volkan afet olarak ele alınır. “Su, Toprak ve Bitki” konusunda toprak oluşumu ayrışma ve aşınmaya dayanır. Kimyada “Karışımlar” ve “Asitler, Bazlar ve Tuzlar” konuları, kalkerin suda çözünmesi gibi kimyasal ayrışmayı açıklar.
:::

## 4. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yakınsak sınır | Çarpışma, dalma-batma, kıvrım dağı |
| Iraksak sınır | Yeni kabuk, okyanus ortası sırtı |
| Yanal sınır | Fay, deprem |
| Orojenez | Dağ oluşumu |
| Epirojenez | Kara yükselmesi ya da alçalması |
| Odak, yüzey merkezi | Odak içte, yüzey merkezi yüzeyde |
| Delta | Akarsu birikimi |
| U vadi | Buzul aşındırması |
| Sarkıt ve dikit | Karstik birikme şekilleri |

## Mini test

:::soru{cevap="B"}
Levhaların birbirinin yanından kayarak hareket ettiği sınırda en çok görülen yer şekli ya da olay aşağıdakilerden hangisidir?

- A) Kıvrım dağlarının oluşması
- B) Fay oluşumu ve deprem
- C) Yeni okyanus tabanının oluşması
- D) Delta oluşumu
- E) Karstik şekillerin oluşması

---

1. Yanal (sıyrılan) sınırda levhalar birbirine sürtünerek kayar.
2. Bu sürtünme fay oluşturur ve deprem yaratır. Doğru cevap B.

Diğer şıklar: **Kıvrım dağlarının oluşması** kıvrım dağları yakınsak sınırda oluşur / **Yeni okyanus tabanının oluşması** yeni okyanus tabanı ıraksak sınırda oluşur / **Delta oluşumu** delta akarsu birikimidir, levha sınırıyla ilgili değildir / **Karstik şekillerin oluşması** karstik şekiller kalkerin çözünmesiyle oluşur.
:::

:::soru{cevap="C"}
Aşağıdakilerden hangisi dış kuvvetlerin oluşturduğu bir yer şeklidir?

- A) Horst
- B) Kıvrım dağı
- C) Delta
- D) Graben
- E) Volkan konisi

---

1. Delta, akarsuyun taşıdığı malzemeyi biriktirmesiyle oluşur, bir dış kuvvet şeklidir.
2. Diğerleri iç kuvvetlerin ürünüdür. Doğru cevap C.

Diğer şıklar: **Horst** horst kabuğun kırılmasıyla oluşan iç kuvvet şeklidir / **Kıvrım dağı** kıvrım dağı iç kuvvetle oluşur / **Graben** graben kırılmayla oluşan çöküntü alanıdır / **Volkan konisi** volkan konisi iç kuvvetle oluşur.
:::

:::soru{cevap="C"}
Bir depremle ilgili olarak aşağıdaki ifadelerden hangisi **yanlıştır**?

- A) Yüzey merkezi, odağın yeryüzündeki dik izdüşümüdür.
- B) Sismograf depremi kaydeden cihazdır.
- C) Depremin büyüklüğü bulunduğu yere göre farklı ölçülür.
- D) Şiddet, depremin yeryüzünde yarattığı etkidir.
- E) Büyüklük açığa çıkan enerjiyi anlatır.

---

1. Bir depremin büyüklüğü tek bir değerdir, yere göre değişmez.
2. Yere göre değişen şiddettir. Doğru cevap C.

Diğer şıklar: **Yüzey merkezi, odağın yeryüzündeki dik izdüşümüdür.** yüzey merkezi odağın yeryüzündeki izdüşümüdür / **Sismograf depremi kaydeden cihazdır.** sismograf depremleri kaydeder / **Şiddet, depremin yeryüzünde yarattığı etkidir.** şiddet etkiyi anlatır / **Büyüklük açığa çıkan enerjiyi anlatır.** büyüklük enerjiyle ilgilidir.
:::

:::soru{cevap="E"}
Kalker gibi suda çözünebilen kayaçların bulunduğu bölgelerde yer altı sularının kayaçları çözmesiyle oluşan, tavandan sarkan sivri şekillere ne ad verilir?

- A) Dikit
- B) Dolin
- C) Polye
- D) Kaldera
- E) Sarkıt

---

1. Tavandan sarkan karstik şekil sarkıttır.
2. Tabandan yükselen şekil dikittir. Doğru cevap E.

Diğer şıklar: **Dikit** dikit tabandan yukarı doğru büyür / **Dolin** dolin çanak biçimli çukurdur / **Polye** polye karstik ovadır / **Kaldera** kaldera volkanik çöküntüdür.
:::

## Kendini dene

:::dene
1. Levhaların birbirinden uzaklaştığı sınır türü hangisidir? => Iraksak sınır.
2. Karaların yavaş yükselmesine ne denir? => Epirojenez.
3. Büyüklük hangi ölçekle ölçülür? => Richter (moment) ölçeği.
4. U biçimli vadiyi hangi dış kuvvet oluşturur? => Buzul.
5. Tavandan sarkan karstik şekil nedir? => Sarkıt.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-cog' and name = 'İç ve Dış Kuvvetler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Levha hareketleri, orojenez, epirojenez, volkanizma, deprem, Türkiye'nin fay hatları, ayrışma, aşınma, taşınma ve birikme, akarsu, buzul, rüzgâr, kıyı ve karst şekilleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür.
Kontrol edilecekler: Kahramanmaraş depremleri ve İzmit depremi tarihleri ve fay ilişkisi güncel kaynaklarla teyit edilmeli (deprem büyüklükleri metne yazılmadı). Türkiye'de buzul bulunan dağ listesi sadeleştirildi. Graben örneklerinin adları kaynakla kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'İç ve Dış Kuvvetler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yeryüzünün dörtte üçü suyla kaplıdır. Su, toprak ve bitki bir arada yaşamın temelini oluşturur. Su buharlaşır, yağmur olur, toprağı sular, bitkiyi besler. Toprak bitkiyi tutar, bitki toprağı korur. Bu konuda **hidrosferi** (okyanuslar, akıntılar, akarsular, göller, yer altı suları), **toprağın oluşumunu ve türlerini**, **bitki örtüsünü** ve Türkiye’deki özelliklerini öğreneceksin.

:::hedefler
1. Okyanus ve denizlerin tuzluluğunu etkileyen etmenleri ve su hareketlerini (dalga, akıntı, gel-git) açıklamak.
2. Akarsu, göl ve yer altı sularının özelliklerini ve Türkiye’deki örneklerini söylemek.
3. Toprağın oluşumunu etkileyen etmenleri ve toprak tiplerini sıralamak.
4. Erozyonun nedenlerini ve önlemlerini açıklamak.
5. Bitki örtüsü tiplerini iklimle ilişkilendirmek.
:::

## 1. Okyanus ve denizler

Yeryüzünün yaklaşık **%71’i** su, **%29’u** karadır. Okyanusların suyu **tuzludur**. Ortalama tuzluluk **binde 35 (‰35)**’tir.

**Tuzluluğu etkileyen etmenler:**

- **Buharlaşma arttıkça** tuzluluk artar (sıcak, kurak yerlerde). Akdeniz’de (‰38) tuzluluk yüksektir.
- **Yağış ve akarsu girişi arttıkça** tuzluluk azalır. Karadeniz’de (yaklaşık ‰18) tuzluluk düşüktür.
- **Buzul erimesi** tuzluluğu azaltır, buz oluşumu artırır.
- **Okyanus akıntıları** ve çevre denizlerle bağlantı.
- Kapalı ve sığ denizlerde tuzluluk daha çok değişir.

**Su hareketleri:**

- **Dalga:** Rüzgârın etkisiyle oluşur. Kıyı şekillerini oluşturur.
- **Okyanus akıntıları:** Belli yönde akan su kütleleri. **Sıcak akıntılar** ekvator yönünden kutba (kıyıyı ısıtır, nem getirir), **soğuk akıntılar** kutuptan ekvatora (kıyıyı soğutur, kurak yapar). Sürekli rüzgârlar ve Coriolis etkisiyle yönleri belirlenir. **Kuzey Atlantik Akıntısı** (sıcak) Kuzeybatı Avrupa kıyılarını aynı enlemdeki Kuzey Amerika kıyılarından daha ılık yapar.
- **Gel-git:** Ay ve Güneş’in çekim etkisiyle su seviyesinin yükselip alçalması. Ay’ın etkisi daha büyüktür. Dünya, Ay ve Güneş aynı doğrultuda iken gel-git en büyüktür.

## 2. Akarsu, göl ve yer altı suları

**Akarsular:** Yağış, kar ve buzul erimesiyle beslenir. **Rejim:** Akarsuyun yıl içinde su miktarı değişimi. Türkiye’de akarsu rejimleri **düzensizdir**, yağış ve kar erimesine bağlıdır. Türkiye’de **en uzun akarsu Kızılırmak’tır** (yaklaşık 1355 km). Fırat, Dicle, Sakarya, Yeşilırmak, Gediz, Büyük Menderes önemli akarsulardır. Akarsular **hidroelektrik enerji**, sulama ve içme suyu için kullanılır. Akarsuyun yatağının eğimi, taşıdığı su ve yük, aşındırma ve biriktirmeyi belirler.

**Göller:** Oluşumuna göre **tektonik** (Tuz, Burdur), **volkanik** (Nemrut Krater Gölü), **karstik** (çukurlarda), **set** (heyelan ya da volkanik set: Van Gölü), **buzul gölleri** ve **baraj gölleri** (insan yapımı). Türkiye’de **en büyük göl Van Gölü**, tatlı sulu en büyük göl **Beyşehir Gölü**’dür.

**Yer altı suları:** Yağışın bir kısmı yer altına sızar. **Kaynak**, **artezyen** (basınçlı su) ve **kaplıcalar** (jeotermal) buradan çıkar. **Kuyu** açılarak kullanılır. Bu su **sulama ve içme suyu** için önemlidir. Aşırı kullanım **yer altı su seviyesini düşürür** ve çökme (obruk) riski yaratır.

## 3. Toprak

**Toprak**, ayrışmış kayaç parçaları ile çürümüş bitki ve hayvan kalıntılarının (**humus**) karışımıdır. Yeryüzünün ince bir örtüsüdür ve bitki yetişmesinin temelidir.

**Toprağı oluşturan etmenler:** Ana kayaç, **iklim** (en etkili), **bitki ve canlılar**, **yer şekilleri (eğim)** ve **zaman**. Ayrıca insan faaliyetleri toprağı etkiler.

**Toprak profili (horizonlar):**

- **A horizonu:** Humusça zengin, verimli üst tabaka.
- **B horizonu:** Yıkanan maddelerin biriktiği tabaka.
- **C horizonu:** Ayrışmış ana kaya.
- **Ana kaya** en altta.

**Toprak tipleri:**

- **Zonal topraklar:** İklim ve bitki örtüsüne bağlı oluşur, geniş alanlarda görülür (kahverengi orman toprağı, kestane renkli topraklar, çernozyom, podzol).
- **İntrazonal topraklar:** Yerel koşullarla (ana kaya, drenaj) oluşur (kalkerli bölgelerde **terra rossa**, tuzlu topraklar, bataklık toprakları).
- **Azonal topraklar:** Henüz tam gelişmemiş genç topraklardır (**alüvyal topraklar**, kolüvyal topraklar). Akarsu ovalarında verimlidir.

**Erozyon:** Toprağın su ya da rüzgârla taşınması. Nedenleri: **Ormansızlaşma**, aşırı otlatma, yanlış tarım (eğime dikey sürüm), eğimli arazi, kuraklık. **Önlemler:** Ağaçlandırma, teraslama, eğime dik sürüm, mera ıslahı, ekim nöbeti.

## 4. Bitki örtüsü

Bitki örtüsünü belirleyen en önemli etmenler **iklim** (sıcaklık ve yağış) ve **yükseltidir**. Ayrıca toprak, bakı ve insan etkisi önemlidir.

| Bitki örtüsü | İklim | Özellik |
| --- | --- | --- |
| **Tropikal yağmur ormanı** | Ekvatoral | Çok katlı, yıl boyu yeşil |
| **Savan** | Savan | Uzun otlar, seyrek ağaçlar |
| **Çöl bitkileri** | Çöl | Seyrek, derin kökler |
| **Maki** | Akdeniz | Kış yeşil, kurak yaza dayanıklı çalı, kızılçam |
| **Geniş yapraklı orman** | Okyanusal, Karadeniz | Yaprak döken (kayın, meşe) |
| **İğne yapraklı orman** | Soğuk, nemli | Yıl boyu yeşil (çam, ladin) |
| **Bozkır (step)** | Karasal | Kısa otlar, ağaçsız, tahıl |
| **Tundra** | Kutup | Yosun ve liken |

**Türkiye’de bitki örtüsü:**

- **Karadeniz kıyıları:** Nemli, yaprak döken ve iğne yapraklı orman.
- **Akdeniz ve Ege kıyıları:** Maki, kızılçam ormanları.
- **İç Anadolu ve Doğu Anadolu:** Bozkır (step) ve dağlık kesimlerde orman, dağ çayırları.
- **Yükseltiyle değişim:** Dağın eteğinden zirvesine doğru bitki kuşakları değişir. Yüksek yerlerde **ağaç sınırı** vardır, üstünde alpin çayır.
- Türkiye **bitki çeşitliliği** bakımından zengindir. Çok sayıda **endemik** (yalnızca belirli bir bölgede yaşayan) tür vardır.

**Ormanların faydaları:** Oksijen üretimi, toprağı koruma, su rejimini düzenleme, iklimi dengeleme, biyolojik çeşitlilik, hammadde.

:::neden-sonuc
- Buharlaşma fazla, akarsu girişi az => Deniz suyunun tuzluluğu artar.
- Sıcak akıntı kıyıdan geçiyor => Kıyı ısınır, nem artar.
- Orman azalıyor => Toprak erozyonu ve su kaybı artar.
- Bölgede iklim kurak ve karasal => Bozkır bitki örtüsü gelişir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Karadeniz’in en tuzlu deniz olduğunu sanma.** Karadeniz’de çok sayıda akarsu döküldüğü için tuzluluk düşüktür (yaklaşık ‰18). Akdeniz’de ise buharlaşma fazla, akarsu az olduğu için tuzluluk fazladır. Bir de **Türkiye’de Van Gölü’nün tatlı sulu olduğunu sanma**: Van Gölü sodalıdır. Tatlı sulu en büyük göl Beyşehir’dir.
:::

:::baglanti
Bu konu, “Atmosfer ve İklim” konusundaki yağış ve sıcaklığa dayanır. “İç ve Dış Kuvvetler” konusundaki ayrışma ve aşınma toprağın oluşumunu başlatır. “Ekonomik Faaliyetler” konusunda tarım ve hayvancılık toprak ve bitki örtüsüne bağlıdır. Biyolojide “Ekosistem Ekolojisi” ve “Güncel Çevre Sorunları” konularındaki üretici, besin zinciri ve erozyon bu konuyla ilişkilidir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ortalama tuzluluk | ‰35 |
| Tuzluluğu artıran | Buharlaşma fazla, akarsu az |
| Sıcak akıntı | Kıyıyı ısıtır |
| Gel-git | Ay ve Güneş çekimi |
| Kızılırmak | En uzun akarsu |
| Van Gölü | En büyük göl |
| Zonal toprak | İklim ve bitkiye bağlı |
| Alüvyal toprak | Azonal, ova toprağı |
| Maki | Akdeniz iklimi bitkisi |

## Mini test

:::soru{cevap="B"}
Aşağıdakilerden hangisi bir deniz ya da okyanustaki tuzluluk oranını artıran etmenlerden biridir?

- A) Akarsu girişinin fazla olması
- B) Buharlaşmanın fazla olması
- C) Yağışın fazla olması
- D) Buzulların erimesi
- E) Denizin çevre denizlerle geniş bağlantısı olması

---

1. Buharlaşma suyu uzaklaştırır, tuz geride kalır ve tuzluluk artar.
2. Akarsu, yağış ve buzul erimesi tatlı su katarak tuzluluğu azaltır. Doğru cevap B.

Diğer şıklar: **Akarsu girişinin fazla olması** tatlı su girişi tuzluluğu azaltır / **Yağışın fazla olması** yağış tuzluluğu azaltır / **Buzulların erimesi** buzul erimesi tatlı su katar / **Denizin çevre denizlerle geniş bağlantısı olması** bağlantı tuzluluğu dengeler.
:::

:::soru{cevap="B"}
Batı Avrupa kıyıları, aynı enlemdeki Kuzey Amerika’nın doğu kıyılarına göre kışın daha ılıktır. Bunun en önemli nedeni aşağıdakilerden hangisidir?

- A) Batı Avrupa’nın ekvatora daha yakın olması
- B) Sıcak bir okyanus akıntısının geçmesi
- C) Gel-git olayının Avrupa’da daha etkili olması
- D) Batı Avrupa’da buzulların bulunması
- E) Soğuk bir akıntının Avrupa kıyısından geçmesi

---

1. Kuzey Atlantik Akıntısı sıcak bir akıntıdır ve Batı Avrupa kıyılarını ısıtır.
2. Aynı enlemde olmalarına rağmen Batı Avrupa daha ılık olur. Doğru cevap B.

Diğer şıklar: **Batı Avrupa’nın ekvatora daha yakın olması** iki bölge aynı enlemde alınmış / **Gel-git olayının Avrupa’da daha etkili olması** gel-git iklimi belirleyen ana etken değildir / **Batı Avrupa’da buzulların bulunması** buzul ılık iklim oluşturmaz / **Soğuk bir akıntının Avrupa kıyısından geçmesi** soğuk akıntı kıyıyı soğutur.
:::

:::soru{cevap="D"}
Aşağıdaki toprak tiplerinden hangisi azonal (genç) topraklar arasında yer alır ve akarsu ovalarında verimli tarım alanlarını oluşturur?

- A) Podzol
- B) Çernozyom
- C) Terra rossa
- D) Alüvyal topraklar
- E) Tuzlu topraklar

---

1. Akarsuların taşıyıp biriktirdiği malzeme alüvyondur, bu topraklar gelişmemiş genç (azonal) topraklardır.
2. Akarsu ovalarında verimlidir. Doğru cevap D.

Diğer şıklar: **Podzol** podzol soğuk ve nemli iklim zonal toprağıdır / **Çernozyom** çernozyom bozkır kuşağının zonal toprağıdır / **Terra rossa** terra rossa kalkerli yerlerde oluşan intrazonal topraktır / **Tuzlu topraklar** tuzlu topraklar yerel koşullarla oluşan intrazonal topraktır.
:::

:::soru{cevap="D"}
Yazları sıcak ve kurak, kışları ılık ve yağışlı olan Akdeniz kıyılarında yaygın olan bitki örtüsü aşağıdakilerden hangisidir?

- A) Bozkır (step)
- B) Tundra
- C) Savan
- D) Maki
- E) İğne yapraklı orman

---

1. Akdeniz iklim bölgesinin karakteristik bitki örtüsü makidir.
2. Doğru cevap D.

Diğer şıklar: **Bozkır (step)** bozkır karasal iklim bitkisidir / **Tundra** tundra kutup bitki örtüsüdür / **Savan** savan sıcak kuşağın bitkisidir / **İğne yapraklı orman** iğne yapraklı orman soğuk ve nemli yerlerde görülür.
:::

## Kendini dene

:::dene
1. Okyanusların ortalama tuzluluğu nedir? => Binde 35.
2. Türkiye’nin en uzun akarsuyu hangisidir? => Kızılırmak.
3. Toprağın üst, humusça zengin tabakasına ne denir? => A horizonu.
4. Karadeniz’de ağırlıklı bitki örtüsü nedir? => Nemli orman.
5. Erozyonu önlemek için ne yapılır? => Ağaçlandırma ve teraslama.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-cog' and name = 'Su, Toprak ve Bitki'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Okyanus ve deniz suyunun tuzluluğu, dalga, akıntı, gel-git, akarsu, göl ve yer altı suları, toprak oluşumu ve tipleri, erozyon, bitki örtüsü, Türkiye'de su, toprak ve bitki. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Karadeniz tuzluluğu (yaklaşık ‰18), Akdeniz tuzluluğu (‰38), Kızılırmak uzunluğu (yaklaşık 1355 km) ders kitabı değerleridir.
Kontrol edilecekler: Van Gölü'nün oluşumu (volkanik set ve tektonik) kaynaklara göre farklı verilebilir. Göl türü örnekleri kitapla karşılaştırılmalı. Dünya yüzeyindeki su ve kara oranı yaklaşık değerdir.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Su, Toprak ve Bitki'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ülkenin geleceğini planlamak için kaç kişi yaşadığını, hangi yaşta olduklarını, nerede yoğunlaştıklarını bilmek gerekir. Okul, hastane, yol ve enerji ihtiyacı nüfusa göre belirlenir. İnsanlar kendi istekleriyle ya da zorunlu olarak yer değiştirir. Bu konuda **nüfusun artışını ve dağılışını**, **nüfus yoğunluğunu**, **nüfus piramitlerini**, **göç türlerini** ve Türkiye’nin nüfus özelliklerini öğreneceksin.

:::hedefler
1. Nüfus sayımı, doğum, ölüm ve doğal artış kavramlarını açıklamak.
2. Nüfus yoğunluğu ve doğal artış hızı hesaplamak.
3. Nüfusun dağılışını etkileyen etmenleri sıralamak.
4. Nüfus piramitlerini yorumlamak.
5. Göç türlerini ve sonuçlarını Türkiye örnekleriyle açıklamak.
:::

## 1. Nüfus ve nüfus artışı

**Nüfus**, bir yerde belli bir zamanda yaşayan insan sayısıdır. **Nüfus sayımı** ile belirlenir.

**Nüfus artışı** üç etkene bağlıdır:

- **Doğum**
- **Ölüm**
- **Göç** (içe ve dışa)

**Doğal artış hızı** = doğum hızı $-$ ölüm hızı. Binde (‰) ya da yüzde (%) olarak verilir.

**Örnek.** Bir ülkede doğum hızı ‰20, ölüm hızı ‰8 ise doğal artış hızı $20 - 8 = ‰12$, yani %1,2’dir.

**Nüfus artış hızı** göçü de içerir. Göç alan bir ülkede nüfus artışı doğal artıştan fazla olabilir.

**Nüfusu etkileyen etmenler:** Sağlık hizmetleri, eğitim düzeyi, kadının toplumdaki yeri, ekonomik gelişmişlik, savaş, salgın hastalık, kültürel ve dinî yapı, devlet politikaları. **Gelişmiş ülkelerde** doğum ve ölüm düşük, nüfus artışı yavaştır. **Gelişmekte olan ülkelerde** ölüm düştükçe nüfus hızlı artar.

## 2. Nüfus yoğunluğu

**Genel nüfus yoğunluğu** = Nüfus / Yüzölçümü (kişi/km²).

**Örnek.** Yüzölçümü 780 000 km² olan ve nüfusu 78 milyon olan bir ülkede yoğunluk $\dfrac{78\,000\,000}{780\,000} = 100\ \text{kişi/km}^2$’dir.

**Tarım nüfus yoğunluğu**, tarım yapılan alanın km²’sine düşen çiftçi sayısıdır. **Fizyolojik yoğunluk**, işlenebilir toprağa düşen nüfustur.

**Nüfusun dağılışını etkileyen etmenler:**

- **Doğal etmenler:** İklim (ılıman iklimler), yer şekilleri (ovalar), su kaynakları, toprak verimliliği, yükselti. Dağlık, çöl ve çok soğuk yerlerde nüfus seyrektir.
- **Beşeri etmenler:** Ekonomik faaliyetler (sanayi, ticaret), ulaşım, tarihî gelişme, iş imkânları, savaşlar.

Dünya’da nüfus **kıyılarda, nehir ovalarında, sanayi bölgelerinde** yoğundur. Dünya nüfusunun büyük kısmı **Asya’da** yaşar.

## 3. Nüfus piramitleri

**Yaş ve cinsiyete göre** nüfus dağılımını gösteren grafiklerdir. Soldan erkek, sağdan kadın nüfus gösterilir. Yaş grupları genellikle genç (0-14), yetişkin (15-64) ve yaşlı (65 ve üstü) olarak ayrılır.

| Piramit | Şekil | Özellik | Örnek |
| --- | --- | --- | --- |
| **Genç nüfuslu** | Tabanı geniş, üstü dar (üçgen) | Doğum yüksek, nüfus hızla artar | Nijerya |
| **Yetişkin nüfuslu** | Orta kısmı geniş | Doğum ve ölüm dengelenir | Türkiye gibi geçiş dönemindeki ülkeler |
| **Yaşlı nüfuslu** | Tabanı dar, üst kısmı geniş (urna) | Doğum düşük, yaşlı nüfus yüksek | Japonya, Almanya |

**Yaşlı nüfus fazlalığının** sorunları: Çalışan nüfusun azalması, sağlık ve emekli harcamalarının artması. **Genç nüfusun** getirdiği: Eğitim ve iş ihtiyacı fakat aynı zamanda gelecekte işgücü fırsatı.

**Bağımlı nüfus:** Çalışmayan nüfus (0-14 ve 65+). Çalışan nüfusa oranı **bağımlılık oranıdır.**

## 4. Göç

**Göç**, insanların bir yerden başka bir yere **yerleşmek amacıyla** gitmesidir.

**Göç türleri:**

- **İç göç:** Ülke içinde. **Dış göç:** Ülkeler arası.
- **Gönüllü göç:** İş, eğitim, daha iyi yaşam için. **Zorunlu göç:** Savaş, doğal afet, baskı nedeniyle (mübadele, sığınmacılar).
- **Geçici göç:** Belli bir süre. **Kalıcı göç:** Yerleşmek için.
- **Mevsimlik göç:** Tarım işçisi, yaylacılık.
- **Beyin göçü:** Eğitimli ve nitelikli insanların daha iyi imkân için başka ülkeye gitmesi.

**Göçün nedenleri:**

- **İtici faktörler:** Yaşadığı yerde işsizlik, savaş, doğal afet, yoksulluk.
- **Çekici faktörler:** Gidilen yerde iş, eğitim, sağlık hizmetleri, güvenlik.

**Göçün sonuçları:**

- **Göç veren yerde:** Nüfus azalır, genç ve çalışan nüfus kaybı, köylerde yaşlanma, tarım alanlarının işlenememesi.
- **Göç alan yerde:** Nüfus artar, **çarpık kentleşme**, gecekondu, altyapı yetersizliği, işsizlik, trafik, çevre sorunları, kültürel çeşitlilik ve işgücü artışı.

## 5. Türkiye’nin nüfus özellikleri

- Nüfus **genç ve dinamiktir**, ancak son yıllarda **doğum hızı düşmekte**, yaşlı nüfus oranı artmaktadır.
- Nüfus **eşit dağılmamıştır.** **Marmara, Ege kıyıları, Çukurova ve büyük şehirler** yoğun, **Doğu ve Güneydoğu’nun yüksek yerleri** seyrektir.
- **Kentsel nüfus oranı** yüksek ve artmaktadır. 1950’den sonra **makineleşme** ile kırdan kente göç hızlanmıştır.
- **İç göç yönü:** Doğu ve Orta Karadeniz’den batıya (İstanbul, İzmir, Ankara, Bursa, Kocaeli).
- **Dış göç:** 1960’lardan itibaren Avrupa’ya (özellikle Almanya) işçi göçü.
- **Zorunlu göçler:** 1923 Türk-Yunan nüfus mübadelesi, 1989’da Bulgaristan’dan göç ve son yıllarda sığınmacılar.

**Nüfus politikaları:** Devletler nüfusu **artırmak** (doğum teşviki) ya da **sınırlamak** (doğum kontrolü) amacıyla politika izleyebilir. Çin uzun yıllar “tek çocuk” politikasını uyguladı.

:::neden-sonuc
- Ölüm hızı düşüyor, doğum hızı yüksek kalıyor => Nüfus hızla artar.
- Kırsal alanda iş imkânı azalıyor => Kırdan kente göç artar.
- Kentlere hızlı göç oluyor => Çarpık kentleşme ve altyapı sorunları artar.
- Doğum oranı düşük, ortalama ömür uzun => Yaşlı nüfus artar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Nüfus yoğunluğu ile nüfus artış hızını karıştırma.** Yoğunluk kişi/km², artış hızı ise yıllık oransal değişimdir. Bir de **doğal artışı hesaplarken göçü katma**: Doğal artış yalnızca doğum ile ölüm farkıdır. **Piramidin tabanının geniş olması gençliği** gösterir, yaşlılığı değil.
:::

:::baglanti
Bu konu, “Yerleşme” konusundaki şehirleşmenin ve kırsal yerleşmenin nedenini açıklar. “Ekonomik Faaliyetler” konusundaki işgücü ve sanayi, nüfusun dağılışını belirler. “Çevre ve Toplum” konusunda nüfus artışı ve çevre baskısı işlenir. Matematikteki “Oran ve Orantı”, “Yüzde” ve “Veri ve İstatistik” konuları burada hesaplarda kullanılır. Tarihte “Milli Mücadele” ve “Atatürkçülük ve Türk İnkılabı” konularındaki mübadele ve nüfus politikaları bu konuyla bağlantılıdır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Doğal artış hızı | Doğum hızı $-$ ölüm hızı |
| Genel yoğunluk | Nüfus / yüzölçümü |
| Genç piramit | Tabanı geniş |
| Yaşlı piramit | Tabanı dar |
| İç göç | Ülke içi |
| Dış göç | Ülkeler arası |
| İtici faktör | Gidilen yerden uzaklaştıran |
| Çekici faktör | Gidilen yere çeken |
| Beyin göçü | Nitelikli insan göçü |

## Mini test

:::soru{cevap="E"}
Yüzölçümü 600 000 km² olan bir ülkenin nüfusu 30 milyondur. Bu ülkenin genel nüfus yoğunluğu kaç kişi/km²’dir?

- A) 5
- B) 20
- C) 30
- D) 49
- E) 50

---

1. Yoğunluk $= \dfrac{30\,000\,000}{600\,000}$.
2. $= 50$ kişi/km². Doğru cevap E.

Diğer şıklar: **5** bir sıfır eksik alınmış / **20** yüzölçümü (bin km²) nüfusa (milyon) bölünmüş / **30** nüfus (milyon) yoğunluk sanılmış / **49** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="E"}
Bir ülkede doğum hızı ‰19, ölüm hızı ‰7 ve yıllık göç dengesi sıfırdır. Bu ülkenin nüfus artış hızı yüzde kaçtır?

- A) %12
- B) %2,6
- C) %0,12
- D) %1,9
- E) %1,2

---

1. Doğal artış hızı $19 - 7 = ‰12$.
2. Binde 12, yüzde 1,2'dir. Göç dengesi sıfır olduğu için artış hızı bu değerdir. Doğru cevap E.

Diğer şıklar: **%12** binde değer yüzde sanılmış / **%2,6** doğum ve ölüm hızı toplanmış / **%0,12** bir basamak fazla küçültülmüş / **%1,9** yalnızca doğum hızı alınmış.
:::

:::soru{cevap="B"}
Bir ülkede nüfus piramidinin tabanı geniş, üst kısmı dar bir üçgen biçimindedir. Bu ülke için aşağıdakilerden hangisi söylenebilir?

- A) Yaşlı nüfus oranı yüksektir.
- B) Genç nüfus oranı yüksektir.
- C) Doğum hızı çok düşüktür.
- D) Nüfus artış hızı sıfırdır.
- E) Bağımlı nüfus yoktur.

---

1. Geniş taban, yüksek doğum hızını ve genç nüfusun fazla olduğunu gösterir.
2. Üst kısmın dar olması yaşlı nüfusun az olduğunu gösterir. Doğru cevap B.

Diğer şıklar: **Yaşlı nüfus oranı yüksektir.** geniş taban gençliği gösterir / **Doğum hızı çok düşüktür.** geniş taban yüksek doğum hızını gösterir / **Nüfus artış hızı sıfırdır.** taban geniş olduğu için nüfus artmaktadır / **Bağımlı nüfus yoktur.** genç nüfus bağımlı nüfusa dahildir.
:::

:::soru{cevap="C"}
Bir ilde 4 000 km² tarım alanında 120 000 kişi geçimini tarımdan sağlamaktadır. Bu ilin tarım nüfus yoğunluğu kaç kişi/km² olur?

- A) 3
- B) 4
- C) 30
- D) 120
- E) 300

---

1. Tarım nüfus yoğunluğu, tarım nüfusunun tarım alanına bölümüdür.
2. $\dfrac{120\,000}{4\,000} = 30$ kişi/km². Doğru cevap C.

Diğer şıklar: **3** bir sıfır eksik alınmış / **4** tarım alanı (bin km²) yoğunluk sanılmış / **120** tarım nüfusu (bin kişi) yoğunluk sanılmış / **300** bir sıfır fazla alınmış.
:::

## Kendini dene

:::dene
1. Doğal artış hızı nasıl hesaplanır? => Doğum hızı eksi ölüm hızı.
2. Yüzölçümü 1000 km², nüfusu 50 000 olan yerin yoğunluğu nedir? => 50 kişi/km².
3. Tabanı geniş piramit hangi nüfusu gösterir? => Genç nüfusu.
4. Savaş yüzünden yapılan göç hangi tür göçtür? => Zorunlu göç.
5. Türkiye’de kırdan kente göçün hızlandığı dönem hangisidir? => 1950’den sonra.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Nüfus ve Göç'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Nüfus sayımı, doğal artış, nüfus yoğunluğu, nüfusun dağılışını etkileyen etmenler, nüfus piramitleri, göç türleri ve sonuçları, Türkiye'nin nüfus özellikleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Hesaplar betikle doğrulandı. Güncel nüfus rakamı yazılmadı, TÜİK verileriyle güncellenmeli.
Kontrol edilecekler: Yaş grupları (0-14, 15-64, 65 ve üstü) ders kitabına göre teyit edilmeli. Türkiye'nin kentsel nüfus oranı ve doğurganlık verileri her yıl değiştiği için metne sayı yazılmadı. Mübadele ve Bulgaristan göçü tarihleri kaynakla kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Nüfus ve Göç'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İnsanlar göçebe yaşamdan yerleşik yaşama geçtiğinde köyler ve kentler ortaya çıktı. Bugün dünya nüfusunun yarıdan fazlası şehirlerde yaşıyor. Bir köyün dağ yamacında dağınık, bir ovada ise toplu kurulmasının, bir şehrin liman ya da ticaret merkezi olmasının sebepleri vardır. Bu konuda **yerleşmenin türlerini**, yerleşmeyi etkileyen etmenleri, **şehirlerin işlevlerini** ve şehirleşmenin sorunlarını öğreneceksin.

:::hedefler
1. Kırsal ve kentsel yerleşmeyi ayırt etmek.
2. Yerleşme biçimlerini (toplu ve dağınık) ve nedenlerini açıklamak.
3. Yerleşmenin kuruluşunu ve dağılışını etkileyen doğal ve beşeri etmenleri sıralamak.
4. Şehirlerin işlevlerini örneklerle eşleştirmek.
5. Şehirleşme sorunlarını ve çözümlerini yorumlamak.
:::

## 1. Yerleşme nedir

**Yerleşme (iskân)**, insanların barınma, çalışma ve sosyal yaşam için bir araya geldiği yerdir. Genellikle **kırsal** ve **kentsel** olarak iki gruba ayrılır:

| Özellik | Kırsal yerleşme | Kentsel yerleşme |
| --- | --- | --- |
| Nüfus | Az | Çok |
| Ekonomik faaliyet | Tarım, hayvancılık, ormancılık, balıkçılık | Sanayi, ticaret, hizmet |
| Yapı | Genellikle alçak, bahçeli evler | Çok katlı yapılar, yoğun yapılaşma |
| İşbölümü | Azdır | Çoktur |
| Örnek | Köy, mezra, kom | Şehir, kasaba, metropol |

Yerleşmeler **sürekli** ya da **geçici** olabilir:

- **Sürekli yerleşme:** Yıl boyu oturulan köy ve şehirler.
- **Geçici yerleşme:** **Yayla** (yazın hayvan otlatmak için çıkılan yüksek yerler), **kışlak** (kışın inilen yer), çiftlik evi, mezra. Mevsimlik kullanılır. **Yaylacılık**, Karadeniz, Toroslar ve Doğu Anadolu’da yaygındır.

## 2. Yerleşme biçimleri

- **Toplu yerleşme:** Evler bir arada, yan yana. Ovalarda, verimli ve düz alanlarda, su kaynağı çevresinde. **İç Anadolu** köyleri tipiktir. **Güvenlik, su ve tarım kolaylığı** neden olur.
- **Dağınık yerleşme:** Evler birbirinden uzak, arazi içine yayılmış. Engebeli, bol yağışlı, ormanlık, tarım alanı parçalı yerlerde. **Karadeniz kıyıları** ve **Doğu Karadeniz dağları** tipiktir. Her ailenin kendi tarlasına yakın olması istenir.
- **Çizgisel yerleşme:** Yol ya da akarsu boyunca sıralı.

## 3. Yerleşmeyi etkileyen etmenler

**Doğal etmenler:**

- **Su kaynakları:** Akarsu, kaynak, göl çevresinde yerleşme olur.
- **İklim:** Ağır iklim koşullarından kaçınılır.
- **Yer şekilleri ve eğim:** Düz ve hafif eğimli alanlar elverişlidir. Taşkın ve heyelan riskli yerler kaçınılır.
- **Toprak verimliliği ve bitki örtüsü:** Tarıma elverişli ovalar.
- **Yer altı kaynakları:** Maden bölgelerinde yerleşme doğar.

**Beşeri etmenler:**

- **Ulaşım:** Kavşak, liman, geçit yerleri.
- **Güvenlik:** Savunmaya elverişli yerler (kale, tepe).
- **Ekonomik faaliyetler:** Ticaret, sanayi, tarım.
- **Tarihî ve kültürel etmenler:** Dinî merkezler, devlet merkezleri.
- **Planlama ve teknoloji:** Barajlar, sulama, enerji, yol yapımı ile eskiden elverişsiz yerler de yerleşmeye açılabilir.

**Konutu etkileyen etmenler:** İklim, bitki örtüsü (ormanlık yerlerde **ahşap**), yer şekilleri, yapı malzemesi (**taş**, kerpiç, ahşap), geleneksel yaşam biçimi. Karadeniz’de **ahşap, çatılı**, Doğu Anadolu’da **toprak damlı**, kıyılarda **beton ve taş** evler yaygındır.

## 4. Şehirler ve işlevleri

**Şehir**, nüfusu ve yapılaşması yoğun, tarım dışı faaliyetlerin ağır bastığı yerleşmedir. Şehirler **konum** ve **ekonomik faaliyetlerine** göre farklı **işlevler** kazanır:

| İşlev | Örnek |
| --- | --- |
| **Ticaret** | İstanbul, İzmir, Gaziantep |
| **Sanayi** | Kocaeli, Bursa, Eskişehir |
| **Turizm** | Antalya, Bodrum, Muğla, Nevşehir (Kapadokya) |
| **Liman ve ulaşım** | Mersin, İskenderun, Samsun |
| **Madencilik** | Zonguldak, Batman (petrol) |
| **Tarım ticareti** | Konya, Adana |
| **Dinî** | Mekke, Konya (Mevlana) |
| **İdari (başkent)** | Ankara |
| **Eğitim** | Eskişehir, Ankara |
| **Askerî** | Kars, Çanakkale (tarihte) |

Bir şehir **birden fazla işleve** sahip olabilir. Kuruluşundaki işlev zamanla değişebilir.

**Kentleşme:** Kentsel nüfus oranının artması. Türkiye’de **1950’den sonra** makineleşme ve sanayi ile hızlandı. Kentleşme, **sanayileşmenin sonucudur**.

## 5. Şehirleşme sorunları ve çözümler

**Sorunlar:**

- **Çarpık kentleşme ve gecekondu:** Plansız yapılaşma, kaçak yapı.
- **Altyapı yetersizliği:** Su, kanalizasyon, elektrik, ulaşım.
- **Trafik sıkışıklığı** ve **hava kirliliği**.
- **Yeşil alan azalması.**
- **Konut sorunu**, işsizlik, güvenlik sorunları.
- **Deprem ve afetlere dayanıksız yapılar.**
- **Tarım arazilerinin yapılaşmaya açılması.**

**Çözümler:**

- **Planlı kentleşme** ve imar düzeni.
- **Kentsel dönüşüm:** Eski ve dayanıksız yapıların yenilenmesi.
- Toplu taşımanın geliştirilmesi, yeşil alanların artırılması.
- **Uydu kentler**, kırsalda iş imkânı geliştirme (göçü azaltmak).
- Afet riskine göre yer seçimi.

:::neden-sonuc
- Engebeli ve bol yağışlı arazi => Dağınık yerleşme görülür.
- Düz ova ve su kaynağı var => Toplu yerleşme olur.
- Kırsaldan kente göç artıyor => Çarpık kentleşme ve altyapı sorunları artar.
- Sanayi gelişiyor => Şehirleşme hızlanır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Dağınık yerleşmeyi yağışsız bölgeye bağlama.** Dağınık yerleşme genellikle **bol yağışlı, engebeli ve ormanlık** yerlerde olur. Bir de **yayla ve kışlağı sürekli yerleşme sanma**: Mevsimlik, geçici yerleşmelerdir. **Şehrin tek işlevi olduğunu** düşünme: İstanbul ticaret, sanayi, turizm gibi çok işlevlidir.
:::

:::baglanti
Bu konu, “Nüfus ve Göç” konusundaki kırdan kente göçün sonuçlarını açıklar. “Türkiye’nin Yer Şekilleri” ve “Atmosfer ve İklim” konuları yerleşmenin kurulmasında doğal koşulları belirler. “Ekonomik Faaliyetler” ve “Ulaşım Hatları” konuları şehirlerin işlevlerini oluşturur. “Doğal Afetler” konusunda deprem ve sel gibi afetlerin yerleşme seçimine etkisi görülür.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kırsal yerleşme | Köy, tarım ve hayvancılık |
| Kentsel yerleşme | Şehir, sanayi ve hizmet |
| Toplu yerleşme | Ova, su kaynağı |
| Dağınık yerleşme | Engebeli, yağışlı |
| Yayla | Geçici, yaz |
| Şehir işlevi | Ticaret, sanayi, turizm, liman |
| Çarpık kentleşme | Plansız yapılaşma |
| Kentsel dönüşüm | Eski yapıların yenilenmesi |

## Mini test

:::soru{cevap="E"}
Evlerin bir arada ve yan yana kurulduğu, genellikle su kaynağı çevresindeki düz ve verimli alanlarda görülen yerleşme biçimi aşağıdakilerden hangisidir?

- A) Dağınık yerleşme
- B) Yayla yerleşmesi
- C) Kışlak
- D) Mezra
- E) Toplu yerleşme

---

1. Evlerin bir arada olduğu, düz ve verimli yerlerde kurulan yerleşme toplu yerleşmedir.
2. Dağınık yerleşmede evler uzaktır. Doğru cevap E.

Diğer şıklar: **Dağınık yerleşme** dağınık yerleşmede evler birbirinden uzaktır / **Yayla yerleşmesi** yayla geçici bir yerleşmedir / **Kışlak** kışlak kışın kullanılan geçici yerleşmedir / **Mezra** mezra küçük ve geçici/yarı sürekli yerleşmedir.
:::

:::soru{cevap="E"}
Karadeniz kıyılarında evlerin birbirinden uzak ve tarlaların arasına dağılmış olmasının en önemli nedeni aşağıdakilerden hangisidir?

- A) Arazinin çok düz olması
- B) İklimin çok kurak olması
- C) Nüfusun yok denecek kadar az olması
- D) Tarımın yapılmaması
- E) Arazinin engebeli ve bol yağışlı olması

---

1. Engebeli ve yağışlı yerlerde tarım alanları parçalıdır, evler tarlalara yakın kurulur.
2. Bu yüzden yerleşme dağınıktır. Doğru cevap E.

Diğer şıklar: **Arazinin çok düz olması** Karadeniz kıyıları engebelidir / **İklimin çok kurak olması** Karadeniz bol yağışlıdır / **Nüfusun yok denecek kadar az olması** bölgenin nüfusu fazladır / **Tarımın yapılmaması** Karadeniz’de çay ve fındık tarımı yapılır.
:::

:::soru{cevap="A"}
Aşağıdaki şehir ve baskın işlev eşleştirmelerinden hangisi **yanlıştır**?

- A) Antalya, madencilik
- B) Zonguldak, madencilik
- C) Kocaeli, sanayi
- D) Ankara, idari (başkent)
- E) Mersin, liman ve ulaşım

---

1. Antalya turizmle öne çıkan bir şehirdir.
2. Madencilik işlevi Zonguldak için doğrudur, Antalya için yanlıştır. Doğru cevap A.

Diğer şıklar: **Zonguldak, madencilik** Zonguldak taş kömürü ile bilinir / **Kocaeli, sanayi** Kocaeli sanayi şehridir / **Ankara, idari (başkent)** Ankara başkenttir / **Mersin, liman ve ulaşım** Mersin önemli bir limandır.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi şehirleşmenin ortaya çıkardığı sorunlardan biri **değildir**?

- A) Trafik sıkışıklığı
- B) Hava kirliliği
- C) Gecekondu ve çarpık yapılaşma
- D) Tarımsal nüfusun hızla artması
- E) Altyapı yetersizliği

---

1. Şehirleşme kırdan kente göçle ilişkilidir, tarım nüfusu artmaz, azalır.
2. Diğer seçenekler şehirleşmenin sorunlarıdır. Doğru cevap D.

Diğer şıklar: **Trafik sıkışıklığı** büyük şehirlerde trafik sorunu yaşanır / **Hava kirliliği** yoğun yapılaşma ve trafik kirliliği artırır / **Gecekondu ve çarpık yapılaşma** hızlı göç plansız yapılaşmaya yol açar / **Altyapı yetersizliği** hızlı nüfus artışı altyapıyı zorlar.
:::

## Kendini dene

:::dene
1. Yaz aylarında hayvan otlatmak için çıkılan geçici yerleşme nedir? => Yayla.
2. Dağınık yerleşme hangi koşullarda görülür? => Engebeli ve bol yağışlı yerlerde.
3. Zonguldak hangi işlevle öne çıkar? => Madencilik.
4. Çarpık kentleşmeye ne sebep olur? => Plansız ve hızlı göç.
5. Eski ve dayanıksız yapıların yenilenmesine ne denir? => Kentsel dönüşüm.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Yerleşme'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Kırsal ve kentsel yerleşme, toplu ve dağınık yerleşme, geçici yerleşmeler (yayla, kışlak), yerleşmeyi etkileyen etmenler, şehirlerin işlevleri, kentleşme ve sorunları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Şehir ve işlev örnekleri (Batman petrol, Çanakkale askerî) kaynakla teyit edilmeli. "Kom" ve "mezra" tanımları ders kitabına göre kontrol edilmeli. Konut örnekleri (toprak damlı, ahşap) sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Yerleşme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Türkiye’de bir saat içinde karlı dağdan sıcak kıyıya inebilirsin. Ülkemiz dağları, platoları, ovaları, vadileri ve kıyılarıyla çok çeşitli yer şekillerine sahiptir. Bu çeşitlilik iklimi, bitki örtüsünü, yerleşmeyi ve ekonomiyi doğrudan etkiler. Bu konuda **Türkiye’nin yer şekillerinin oluşumunu**, **dağları, platoları, ovaları, kıyıları** ve bunların uzanışının sonuçlarını öğreneceksin.

:::hedefler
1. Türkiye’nin yer şekillerinin oluşumunu levha hareketleriyle ilişkilendirmek.
2. Dağları, platoları ve ovaları örnekleriyle sıralamak.
3. Ovaların oluşum türlerini (delta, graben, tabanlı) ayırt etmek.
4. Kıyı tiplerini ve boğazları açıklamak.
5. Yer şekillerinin iklim, yerleşme ve ekonomi üzerindeki etkilerini yorumlamak.
:::

## 1. Genel özellikler

- Türkiye, **Alp-Himalaya dağ kuşağı** üzerindedir. Yer şekillerinin çoğu **genç kıvrım dağları** ve **kırıklı yapıdır**.
- **Ortalama yükselti** yaklaşık **1132 metredir.** Doğuya doğru yükselti artar. Yükseltinin yüksek olması iklim, ulaşım ve tarım üzerinde sınırlayıcıdır.
- Dağlar kıyılara **paralel** uzanır. Bu durum deniz etkisinin iç kesimlere girmesini zorlaştırır, **kıyı ile iç kesim arasında** iklim, bitki örtüsü ve nüfus farkı doğurur.
- Dağlar **volkanik** (Erciyes, Ağrı), **kıvrımlı** (Toroslar, Kuzey Anadolu) ve **kırıklı** (Batı Anadolu) çeşitlerdendir.
- **Deprem ve volkanizma** aktiftir. Yer şekilleri halen şekillenmektedir.

## 2. Dağlar

| Dağ kuşağı | Yer | Özellik |
| --- | --- | --- |
| **Kuzey Anadolu Dağları** | Karadeniz kıyısına paralel | Doğuda yüksek (Kaçkar 3937 m), nemli yamaçlar, ormanlar |
| **Toroslar** | Akdeniz kıyısına paralel | Batı, Orta ve Güneydoğu Toroslar. Karstik, kalkerli |
| **Doğu Anadolu dağları** | Doğu Anadolu | **Ağrı Dağı (5137 m, Türkiye’nin en yüksek dağı)**, Süphan, Nemrut, Tendürek. Yüksek volkanik koniler |
| **İç Anadolu volkanik dağları** | İç Anadolu | **Erciyes (3917 m)**, Hasan Dağı (3268 m) |
| **Batı Anadolu dağları** | Ege | **Kırıklı**, doğu-batı uzanır (Bozdağlar, Aydın Dağları) |
| **Uludağ** | Marmara | 2543 m, kış turizmi |

## 3. Platolar

**Plato (yayla):** Çevresine göre yüksek, düzlüğe yakın arazilerdir. Akarsu vadileriyle yarılmıştır.

- **İç Anadolu Platoları** (Haymana, Cihanbeyli, Obruk, Bozok)
- **Doğu Anadolu Platoları** (Erzurum-Kars, Muş)
- **Güneydoğu Platosu** (Mardin, Diyarbakır)
- **Teke Platosu**, **Taşeli (Toros) Platosu** (karstik)
- **Karacadağ** bazalt platosu (Diyarbakır, Şanlıurfa).

## 4. Ovalar

**Ova:** Çevresine göre alçak, düz ya da hafif eğimli alanlar. **Tarıma elverişli** ve nüfusun toplandığı yerlerdir.

**Oluşumlarına göre:**

- **Delta ovaları:** Akarsuyun denize döküldüğü yerde birikme ile oluşur. **Çukurova** (Seyhan-Ceyhan), **Bafra** (Kızılırmak), **Çarşamba** (Yeşilırmak), **Büyük Menderes** deltası.
- **Çöküntü (graben) ovaları:** Fay hatlarıyla çöken alanların akarsu malzemesiyle dolmasıdır. **Gediz, Büyük Menderes, Küçük Menderes** (Ege), **Antalya** ovası.
- **Tabanlı (göl tabanı) ovaları:** Eski göl tabanlarının kuruması ile oluşmuştur. **Konya Ovası**, **Iğdır**, **Muş** ovaları.
- **Karstik ovalar (polye):** Göller Yöresi ve Toroslardaki karstik ovalar.
- **Akarsu ovaları:** Harran, Bursa, Erzurum ovaları.

**Önem:** Pamuk, tahıl, meyve ve sebze tarımı yapılır, sulama kolaydır, nüfus ve sanayi yoğunlaşır.

## 5. Kıyılar ve boğazlar

- **Karadeniz kıyısı:** Dağlar kıyıya paralel, **düz ve girintisiz** kıyıdır. Büyük körfez azdır. Limanlar sınırlıdır. Kıyıyla iç kesim arasında dik yamaç bulunur.
- **Ege kıyısı:** Dağlar kıyıya **dik** uzanır, kıyılar **girintili çıkıntılıdır** (ria). Çok sayıda koy, körfez, yarımada ve ada vardır. **Limanlar, turizm ve deniz etkisinin içeriye girişi** kolaydır.
- **Akdeniz kıyısı:** Batıda **kıyıya paralel dağlar**, kıyı dik ve falezlidir. Doğuda Çukurova gibi **delta** ovaları düzdür. Antalya ve İskenderun körfezi belirgindir.
- **Marmara kıyısı:** Kocaeli, Biga ve Gelibolu yarımadaları, **İstanbul ve Çanakkale boğazları** burada.

**Boğazlar:** **İstanbul Boğazı** ve **Çanakkale Boğazı** hem Karadeniz-Akdeniz bağlantısı hem **stratejik** öneme sahiptir. Boğaz geçiş rejimi **Montrö Sözleşmesi**’ne göredir.

**Yarımadalar:** Kocaeli, Biga, Gelibolu, Karaburun, Datça, Teke. **Adalar:** Gökçeada, Bozcaada, Marmara Adası.

## 6. Yer şekillerinin etkileri

- **İklim:** Karadeniz ve Akdeniz’de dağların kıyıya paralel olması, deniz etkisini kıyıda tutar, iç kesimleri karasal yapar. Ege’de dağların dik uzanması deniz etkisini içeriye taşır.
- **Bitki örtüsü:** Kıyıda orman ve maki, iç kesimde bozkır, yüksek yerde dağ çayırları.
- **Tarım:** Ovalarda tarım, yüksek yerde hayvancılık.
- **Nüfus ve yerleşme:** Ovalarda ve kıyıda yoğun, dağlık yerlerde seyrek.
- **Ulaşım:** Dağlar ulaşımı zorlaştırır, tünel ve viyadük gerektirir. Ovalarda yol ve demiryolu kolaydır.
- **Enerji:** Dağlık yerlerde akarsular **hidroelektrik** için uygun.

:::neden-sonuc
- Dağlar kıyıya paralel uzanıyor => Deniz etkisi iç kesimlere giremez, iç kesim karasallaşır.
- Dağlar kıyıya dik uzanıyor => Deniz etkisi içeriye girer, kıyı girintili çıkıntılı olur.
- Akarsu denize ulaşıp biriktiriyor => Delta ovası oluşur.
- Fay boyunca çöküntü oluşuyor => Graben ovası oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Çukurova ile Gediz’i aynı tür ova sanma.** Çukurova delta, Gediz graben ovasıdır. Bir de **Ege kıyısındaki dik dağ uzanışını Karadeniz ve Akdeniz’deki paralel uzanışla karıştırma**: Ege’de dik, diğerlerinde paraleldir. **Ağrı Dağı’nı kıvrım dağı sanma**: Ağrı volkanik bir dağdır.
:::

:::baglanti
Bu konu, “İç ve Dış Kuvvetler” konusundaki levha hareketleri, volkanlar ve akarsu aşındırma ve birikmesinin Türkiye’ye uygulamasıdır. “Atmosfer ve İklim” ve “Su, Toprak ve Bitki” konuları, dağların uzanışının iklime ve bitki örtüsüne etkisini açıklar. “Bölgeler” konusunda bu şekiller bölgelere göre ayrıntılandırılır. “Harita Bilgisi” konusunda haritalardaki izohips ve yükselti bu şekilleri okumayı sağlar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ortalama yükselti | Yaklaşık 1132 m, doğuya doğru artar |
| En yüksek dağ | Ağrı (5137 m), volkanik |
| Delta ovası | Çukurova, Bafra, Çarşamba |
| Graben ovası | Gediz, Büyük Menderes |
| Tabanlı ova | Konya, Iğdır |
| Karadeniz ve Akdeniz dağları | Kıyıya paralel |
| Ege dağları | Kıyıya dik |
| Ege kıyısı | Girintili çıkıntılı |

## Mini test

:::soru{cevap="E"}
Aşağıdaki dağlardan hangisi volkanik kökenlidir?

- A) Uludağ
- B) Kaçkar Dağları
- C) Bozdağlar
- D) Toroslar
- E) Erciyes Dağı

---

1. Erciyes, İç Anadolu'daki sönmüş bir volkandır.
2. Diğer dağlar kıvrım ya da kırık dağlarıdır. Doğru cevap E.

Diğer şıklar: **Uludağ** Uludağ kırıklı (horst) yapıdadır / **Kaçkar Dağları** Kaçkar Kuzey Anadolu kıvrım dağları sırasındadır / **Bozdağlar** Bozdağlar Batı Anadolu’nun kırıklı dağlarıdır / **Toroslar** Toroslar kıvrım dağlarıdır.
:::

:::soru{cevap="D"}
Aşağıdaki ovalardan hangisi akarsuyun denize döküldüğü yerde taşıdığı malzemeyi biriktirmesiyle oluşan bir delta ovasıdır?

- A) Gediz Ovası
- B) Konya Ovası
- C) Muş Ovası
- D) Çukurova
- E) Harran Ovası

---

1. Çukurova, Seyhan ve Ceyhan akarsularının biriktirmesiyle oluşan delta ovasıdır.
2. Diğer ovalar farklı oluşumludur. Doğru cevap D.

Diğer şıklar: **Gediz Ovası** Gediz bir graben ovasıdır / **Konya Ovası** Konya Ovası eski göl tabanıdır / **Muş Ovası** Muş Ovası bir çöküntü ve göl tabanı ovasıdır / **Harran Ovası** Harran Ovası akarsu ovasıdır.
:::

:::soru{cevap="A"}
Ege Bölgesi’nde dağların kıyıya dik uzanmasının sonucu aşağıdakilerden hangisidir?

- A) Deniz etkisinin iç kesimlere kadar girebilmesi
- B) İç kesimlerin karasal iklim özelliği taşıması
- C) Kıyıların düz ve girintisiz olması
- D) Kıyı ile iç kesim arasında keskin iklim farkı oluşması
- E) Ulaşımın çok kısıtlı olması

---

1. Dağlar kıyıya dik uzandığında aralarındaki vadiler deniz etkisini içeri taşır.
2. Doğru cevap A.

Diğer şıklar: **İç kesimlerin karasal iklim özelliği taşıması** dik uzanışta deniz etkisi içeri girer, karasallık azalır / **Kıyıların düz ve girintisiz olması** dik uzanış girintili çıkıntılı kıyı oluşturur / **Kıyı ile iç kesim arasında keskin iklim farkı oluşması** keskin fark paralel uzanışta görülür / **Ulaşımın çok kısıtlı olması** Ege’de vadiler ulaşımı kolaylaştırır.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Türkiye’nin Karadeniz kıyılarının özelliklerinden biri **değildir**?

- A) Dağların kıyıya paralel uzanması
- B) Büyük körfezlerin az olması
- C) Kıyıdan iç kesime dik yamaçla geçilmesi
- D) Doğal limanların sınırlı olması
- E) Kıyıların çok girintili çıkıntılı olması

---

1. Karadeniz kıyıları düz ve girintisizdir.
2. Girintili çıkıntılı kıyı Ege'ye özgüdür. Doğru cevap E.

Diğer şıklar: **Dağların kıyıya paralel uzanması** Kuzey Anadolu Dağları kıyıya paraleldir / **Büyük körfezlerin az olması** Karadeniz kıyısında büyük körfez azdır / **Kıyıdan iç kesime dik yamaçla geçilmesi** Karadeniz’de dağlar kıyıya yakın ve diktir / **Doğal limanların sınırlı olması** düz kıyıda doğal liman azdır.
:::

## Kendini dene

:::dene
1. Türkiye’nin en yüksek dağı hangisidir? => Ağrı Dağı.
2. Çukurova hangi tür ovadır? => Delta ovası.
3. Gediz ovası nasıl oluşmuştur? => Graben (çöküntü) ile.
4. Hangi kıyıda dağlar kıyıya diktir? => Ege kıyısı.
5. İki boğazın adı nedir? => İstanbul ve Çanakkale.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Türkiye''nin Yer Şekilleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Türkiye'nin yer şekillerinin oluşumu, dağlar, platolar, ovalar (delta, graben, tabanlı), kıyılar ve boğazlar, yer şekillerinin etkileri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Yükseklik değerleri (Ağrı 5137 m, Erciyes 3917 m, Hasan 3268 m, Kaçkar 3937 m, Uludağ 2543 m) ders kitabı bilgileridir. Ortalama yükselti (1132 m) kitaplara göre farklı yazılabilir.
Kontrol edilecekler: Ova oluşum sınıflandırması ve örnekler (Muş, Harran) kaynakla teyit edilmeli. Kıyı tipleri sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Türkiye''nin Yer Şekilleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabah içtiğin çayın yetiştiği yerden fabrikaya, markete, evine gelişi bir **ekonomik faaliyet zinciridir**. Doğadan hammadde alınır, işlenir, taşınır, satılır. Bu konuda **ekonomik faaliyetlerin türlerini** (tarım, hayvancılık, madencilik, sanayi, ticaret, turizm, ulaşım), **enerji kaynaklarını** ve Türkiye’de bu faaliyetlerin dağılışını etkileyen coğrafi koşulları öğreneceksin.

:::hedefler
1. Ekonomik faaliyetleri birinci, ikinci ve üçüncü sektöre göre sınıflandırmak.
2. Tarım ürünlerinin yetiştiği bölgeleri iklim ve toprakla ilişkilendirmek.
3. Hayvancılık, ormancılık, balıkçılık ve madenciliğin Türkiye’deki dağılışını söylemek.
4. Sanayinin yer seçimini etkileyen etmenleri açıklamak.
5. Enerji kaynaklarını ve turizmin dağılışını yorumlamak.
:::

## 1. Ekonomik faaliyetler ve sektörler

İnsanın ihtiyaçlarını karşılamak için yaptığı üretim, dağıtım ve tüketim faaliyetlerine **ekonomik faaliyet** denir.

| Sektör | Faaliyet | Örnek |
| --- | --- | --- |
| **Birinci (ilk) sektör** | Doğadan doğrudan ürün alma | Tarım, hayvancılık, ormancılık, balıkçılık, madencilik |
| **İkinci sektör** | Hammaddeyi işleme | Sanayi (fabrika üretimi), inşaat, enerji üretimi |
| **Üçüncü sektör** | Hizmet | Ticaret, ulaşım, turizm, bankacılık, sağlık, eğitim |

Gelişmiş ülkelerde **üçüncü sektörün payı** yüksektir. Gelişmekte olan ülkelerde birinci sektörün payı fazladır.

Faaliyetlerin dağılışını **doğal etmenler** (iklim, toprak, yer şekilleri, su, yer altı kaynakları) ve **beşeri etmenler** (nüfus, sermaye, teknoloji, ulaşım, pazar, devlet politikaları) belirler.

## 2. Tarım

Türkiye’de iklim, toprak ve yer şekli çeşitliliği tarımda **ürün çeşitliliğini** sağlar.

**Ürünlerin dağılışı:**

| Ürün | Yetiştiği bölge | Neden |
| --- | --- | --- |
| **Buğday, arpa** (tahıl) | İç Anadolu, Güneydoğu, Trakya | Karasal iklim, geniş ova |
| **Çay** | Doğu Karadeniz (Rize) | Bol yağış, asitli toprak, her mevsim nem |
| **Fındık** | Karadeniz kıyıları | Ilıman, nemli iklim |
| **Zeytin, incir, üzüm** | Ege, Akdeniz kıyıları | Akdeniz iklimi |
| **Narenciye** | Akdeniz kıyıları (Mersin, Antalya) | Kışı ılık iklim |
| **Pamuk** | Çukurova, Ege, Güneydoğu | Sıcak, sulanan ova |
| **Şeker pancarı** | İç Anadolu, Trakya | Serin iklim, düz arazi |
| **Ayçiçeği** | Trakya | Karasal ve ılıman geçiş |
| **Antep fıstığı** | Güneydoğu Anadolu | Kurak ve sıcak iklim |
| **Sera ürünleri** | Antalya, Mersin | Kışın ılık ve güneşli |

**Tarımın verimini artıran etkenler:** Sulama, gübreleme, kaliteli tohum, makineleşme, **nadas**ın azaltılması (toprağın dinlendirilmesi), bilinçli ilaçlama, tarım teknolojisi.

**Verim hesabı:** Verim = Toplam üretim / Ekilen alan.

**Örnek.** 50 dekarlık tarladan 10 ton ürün alınıyorsa verim $\dfrac{10\,000\ \text{kg}}{50\ \text{dekar}} = 200\ \text{kg/dekar}$’dır.

**GAP (Güneydoğu Anadolu Projesi):** Fırat ve Dicle üzerinde barajlar (Atatürk Barajı) ve hidroelektrik santralleri kurularak enerji üretimi ve **sulama** ile bölgenin kalkınmasını amaçlar. Pamuk, buğday, mercimek gibi ürünlerin üretimi artmıştır.

## 3. Hayvancılık, ormancılık, balıkçılık

- **Hayvancılık:** Doğu Anadolu’da büyükbaş ve koyunculuk (geniş meralar). İç Anadolu’da koyun, **tiftik keçisi** (Ankara). Marmara ve Ege’de modern süt sığırcılığı. Karadeniz’de büyükbaş. Hayvancılığın temel girdisi **mera ve yem bitkileridir.** Mera alanlarının azalması sorun yaratır.
- **Ormancılık:** Orman, **Karadeniz, Akdeniz ve Ege** dağlık kesimlerinde yaygındır. Ormanlar kereste, kâğıt ve yakacak sağlar. Aşırı kesim, yangın ve izinsiz açma ormanları azaltır.
- **Balıkçılık:** Karadeniz’de hamsi (en önemli balık), Marmara’da, Ege’de ve Akdeniz’de çeşitli balıklar. **Su ürünleri yetiştiriciliği** (alabalık, levrek, çipura) yaygınlaşmaktadır.

## 4. Madencilik ve enerji

**Madenler:**

- **Bor** (Eskişehir, Balıkesir, Kütahya): Türkiye dünya bor rezervinde ilk sıralardadır.
- **Krom** (Elazığ, Muğla), **bakır** (Artvin, Elazığ), **demir** (Sivas Divriği, Malatya Hekimhan), **boksit**, **mermer** (Afyon, Muğla).
- **Taş kömürü** (Zonguldak), **linyit** (Soma, Afşin-Elbistan, Tunçbilek).
- **Petrol** (Batman, Adıyaman), **doğal gaz** (az miktarda). Büyük kısmı **dışarıdan alınır.**

**Enerji kaynakları:**

- **Yenilenemeyen (fosil):** Kömür, petrol, doğal gaz. Sera gazı ve kirlilik yaratır.
- **Yenilenebilir:** **Hidroelektrik** (akarsu, baraj), **rüzgâr** (Ege, Marmara kıyıları), **güneş** (Akdeniz, Güneydoğu), **jeotermal** (Batı Anadolu), **biyokütle**.
- Türkiye enerjide **dışa bağımlıdır.** Yenilenebilir enerji kullanımının artırılması hedeflenir.

## 5. Sanayi

Sanayi, hammaddenin işlenerek **ürüne** dönüştürülmesidir.

**Sanayinin yer seçimini etkileyen etmenler:**

- **Hammadde** (şeker fabrikası pancar bölgesinde, çay fabrikası Rize’de).
- **Enerji** kaynakları.
- **Ulaşım** (liman, karayolu, demiryolu).
- **Pazar** (nüfus yoğunluğu).
- **İşgücü** ve sermaye.
- **Devlet politikaları** ve teşvikler (organize sanayi bölgeleri, serbest bölgeler).

**Türkiye’de sanayinin dağılışı:** **Marmara** (İstanbul, Kocaeli, Bursa), **Ege** (İzmir, Manisa), **İç Anadolu** (Ankara, Eskişehir, Konya, Kayseri), **Akdeniz** (Adana, Mersin). Doğu ve Güneydoğu’da sanayi gelişmemiştir.

**Sanayi türleri:** Tekstil, gıda, otomotiv, demir-çelik, kimya, elektronik, makine, çimento. **Hammaddeye bağlı** sanayiler hammadde kaynağına yakın, **pazara bağlı** sanayiler büyük şehir yakınında kurulur.

## 6. Turizm ve ticaret

- **Turizm:** Hem doğal (iklim, deniz, plajlar, dağlar, yaylalar, termal kaynaklar) hem beşeri (tarihî yapılar, müzeler, festivaller) kaynaklara dayanır. Türkiye’de **deniz-kum-güneş turizmi** (Antalya, Muğla, İzmir), **kış turizmi** (Uludağ, Erciyes, Palandöken), **kültür turizmi** (İstanbul, Efes, Kapadokya), **sağlık turizmi** (termal), **inanç turizmi**. Turizm döviz getirir, istihdam sağlar.
- **Ticaret:** İç ticaret ve dış ticaret. Dış ticaretin başlıca araçları ulaşım hatlarıdır. **İhracat** ürün satışı, **ithalat** ürün alımıdır. Türkiye’nin ithalatında enerji payı yüksektir.

:::neden-sonuc
- Bol yağış ve asitli toprak => Doğu Karadeniz’de çay tarımı gelişir.
- Kışın ılık ve güneşli iklim => Akdeniz kıyılarında seracılık ve narenciye yaygınlaşır.
- Hammadde ve liman yakın => Sanayi o bölgede kurulur.
- Dağlık ve engebeli arazi => Tarım yerine hayvancılık ve ormancılık yaygın olur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Üçüncü sektörü sanayi sanma.** Sanayi ikinci, ticaret ve turizm üçüncü sektördür. Bir de **madenciliği ikinci sektöre koyma**: Madencilik, doğadan doğrudan ürün aldığı için birinci sektördür. **Verimi toplam üretimle karıştırma**: Verim, birim alana düşen üründür.
:::

:::baglanti
Bu konu, “Atmosfer ve İklim” ve “Su, Toprak ve Bitki” konularındaki iklim, toprak ve bitki örtüsünün ekonomiye yansımasıdır. “Türkiye’nin Yer Şekilleri” ve “Bölgeler” konuları, faaliyetlerin dağılışını belirler. “Ulaşım Hatları” konusu bu faaliyetlerin birbirine bağlanmasını sağlar. Kimyada “Kimya Her Yerde” konusundaki yakıtlar ve enerji, matematikteki “Oran ve Orantı” konusu verim hesabıyla ilişkilidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Birinci sektör | Tarım, hayvancılık, madencilik |
| İkinci sektör | Sanayi |
| Üçüncü sektör | Ticaret, turizm, ulaşım |
| Çay | Doğu Karadeniz |
| Pamuk | Çukurova, Ege, Güneydoğu |
| Taş kömürü | Zonguldak |
| GAP | Fırat ve Dicle, sulama, enerji |
| Yenilenebilir enerji | Hidroelektrik, rüzgâr, güneş, jeotermal |
| Verim | Üretim / alan |

## Mini test

:::soru{cevap="C"}
40 dekarlık bir tarlada hasat sonunda 12 ton buğday elde edilmiştir. Bu tarlanın verimi kaç kg/dekar’dır?

- A) 12
- B) 30
- C) 300
- D) 480
- E) 3000

---

1. 12 ton $= 12\,000\ \text{kg}$.
2. Verim $= \dfrac{12\,000}{40} = 300\ \text{kg/dekar}$. Doğru cevap C.

Diğer şıklar: **12** üretim değeri verim sanılmış / **30** bir sıfır eksik alınmış / **480** üretim ile alan çarpılıp 1000’e bölünmüş / **3000** bir sıfır fazla alınmış.
:::

:::soru{cevap="A"}
Aşağıdaki faaliyetlerden hangisi birinci sektör (ilk sektör) faaliyetidir?

- A) Zonguldak’ta taş kömürü çıkarılması
- B) Bir fabrikada kömürden kok üretilmesi
- C) Kömürün trenle limana taşınması
- D) Kömürün satış mağazasında satılması
- E) Kömür santralinde elektrik üretilmesi

---

1. Birinci sektör doğadan doğrudan ürün alma faaliyetidir.
2. Kömürün yerden çıkarılması madenciliktir. Doğru cevap A.

Diğer şıklar: **Bir fabrikada kömürden kok üretilmesi** hammaddeyi işleyen faaliyet ikinci sektördür / **Kömürün trenle limana taşınması** taşıma üçüncü sektördür / **Kömürün satış mağazasında satılması** ticaret üçüncü sektördür / **Kömür santralinde elektrik üretilmesi** enerji üretimi ikinci sektördür.
:::

:::soru{cevap="D"}
Aşağıdaki ürün ve yetiştiği bölge eşleştirmelerinden hangisi doğrudur?

- A) Narenciye: İç Anadolu
- B) Antep fıstığı: Karadeniz
- C) Fındık: Doğu Anadolu
- D) Çay: Doğu Karadeniz
- E) Zeytin: Doğu Karadeniz yüksek kesimi

---

1. Çay bol yağış ve nem isteyen bir üründür ve Doğu Karadeniz'de yetişir.
2. Diğer eşleştirmeler yanlıştır. Doğru cevap D.

Diğer şıklar: **Narenciye: İç Anadolu** narenciye kışı ılık Akdeniz kıyısında yetişir / **Antep fıstığı: Karadeniz** Antep fıstığı Güneydoğu Anadolu’da yetişir / **Fındık: Doğu Anadolu** fındık Karadeniz kıyısında yetişir / **Zeytin: Doğu Karadeniz yüksek kesimi** zeytin Ege ve Akdeniz kıyısında yetişir.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi sanayi tesislerinin yer seçiminde etkili olan etmenlerden biri **değildir**?

- A) Hammaddeye yakınlık
- B) Dağlık alan zorunluluğu
- C) Ulaşım olanakları
- D) Pazara yakınlık
- E) Enerji ve işgücü varlığı

---

1. Sanayi yer seçiminde hammadde, enerji, ulaşım, pazar ve işgücü etkilidir.
2. Yalnızca dağlık alanda kurulabilme bir etmen değildir. Doğru cevap B.

Diğer şıklar: **Hammaddeye yakınlık** hammadde yer seçiminde önemlidir / **Ulaşım olanakları** ulaşım yer seçiminde önemlidir / **Pazara yakınlık** pazar yer seçiminde önemlidir / **Enerji ve işgücü varlığı** enerji ve işgücü yer seçiminde önemlidir.
:::

## Kendini dene

:::dene
1. Madencilik hangi sektördedir? => Birinci sektör.
2. Çay hangi bölgede yetişir? => Doğu Karadeniz.
3. Verim nasıl hesaplanır? => Toplam üretim bölü ekilen alan.
4. GAP hangi akarsular üzerindedir? => Fırat ve Dicle.
5. Hammaddeye bağlı sanayi nerede kurulur? => Hammadde kaynağına yakın.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-cog' and name = 'Ekonomik Faaliyetler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Ekonomik faaliyetler ve sektörler, tarım ürünlerinin dağılışı, hayvancılık, ormancılık, balıkçılık, madencilik, enerji kaynakları, sanayinin yer seçimi, turizm ve ticaret, GAP. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Verim hesapları betikle doğrulandı. Ürün-bölge eşleştirmeleri ders kitabı bilgileridir.
Kontrol edilecekler: Türkiye'nin bor rezervi ifadesi "ilk sıralarda" olarak yumuşatıldı, güncel veriyle teyit edilmeli. Ürün dağılışı ve madenlerin yerleri kaynakla kontrol edilmeli. İhracat ve ithalat verisi yazılmadı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Ekonomik Faaliyetler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Türkiye’nin kuzeyinden güneyine ya da batısından doğusuna gittiğinde iklim, bitki örtüsü, tarım ürünleri, evler ve yaşam biçimi değişir. Coğrafyacılar bu farklılıkları ortak özellikleri taşıyan **bölgelere** ayırarak inceler. Bu konuda **bölge kavramını**, **Türkiye’nin yedi coğrafi bölgesini**, her bölgenin özelliklerini ve **bölgeler arası farklılıkları** ve **bölgesel kalkınma projelerini** öğreneceksin.

:::hedefler
1. Bölge kavramını ve bölge ayırma ölçütlerini açıklamak.
2. Türkiye’nin yedi coğrafi bölgesini haritada konum ve özelliklerine göre ayırt etmek.
3. Her bölgenin iklim, yer şekli, ekonomik faaliyet özelliklerini eşleştirmek.
4. Bölgeler arasındaki farklılıkların nedenlerini yorumlamak.
5. Bölgesel kalkınma projelerinin amacını söylemek.
:::

## 1. Bölge nedir

**Bölge**, belirli ölçütlere göre ortak özellikleri taşıyan, çevresinden ayrılabilen alandır.

- **Doğal bölgeler:** İklim, yer şekli, bitki örtüsü gibi doğal ölçütlere göre (Akdeniz iklim bölgesi, Karadeniz bölgesi).
- **Beşeri (ekonomik) bölgeler:** Nüfus, sanayi, tarım gibi ölçütlere göre.
- **İdari bölgeler:** Yönetim kolaylığı için (il, ilçe).
- **Planlama (kalkınma) bölgeleri:** Ekonomik kalkınma için.

Türkiye’nin **yedi coğrafi bölgesi**, **1941’deki Birinci Coğrafya Kongresi’nde** belirlenmiştir. Bölge sınırları idari sınırlarla birebir örtüşmez.

## 2. Marmara Bölgesi

- **Konum:** Kuzeybatıda. **Marmara Denizi** çevresi. İstanbul ve Çanakkale boğazları buradadır.
- **İklim:** Akdeniz, Karadeniz ve karasal iklimler arası **geçiş iklimi**. Yazlar sıcak, kışlar ılık ve yağışlıdır.
- **Yer şekilleri:** Yükselti azdır, Uludağ (2543 m) en yüksek noktalarındandır. Ergene Havzası, Bursa ve Adapazarı ovaları.
- **Ekonomi:** **Sanayi** en gelişmiş bölgedir (İstanbul, Kocaeli, Bursa). Ticaret, ulaşım, turizm. Tarımda **ayçiçeği, buğday, zeytin, şeftali, kiraz**, ipek böcekçiliği (Bursa).
- **Nüfus:** **En yoğun nüfuslu** bölgedir, en yüksek şehirleşme.
- **Özellik:** Türkiye’de **en kalabalık ve en gelişmiş** bölgedir, ulaşım ağı yoğundur.

## 3. Ege Bölgesi

- **Konum:** Batıda, **Ege Denizi** kıyısı.
- **İklim:** **Akdeniz iklimi** kıyıda, iç kesimlerde karasala geçiş.
- **Yer şekilleri:** Dağlar kıyıya **dik** uzanır, **graben ovaları** (Gediz, Küçük ve Büyük Menderes). **Kıyılar çok girintili çıkıntılı.**
- **Ekonomi:** **Zeytin, incir, üzüm, tütün, pamuk, narenciye**. Turizm (Bodrum, Marmaris, Kuşadası). İzmir sanayi ve ihracat limanı. Mermer ve krom.
- **Özellik:** Deniz etkisi içeri kolayca girer, tarım çeşitlidir.

## 4. Akdeniz Bölgesi

- **Konum:** Güneyde. **Toroslar** kıyıya paralel uzanır.
- **İklim:** **Akdeniz iklimi**. Yazlar sıcak ve kurak, kışlar ılık ve yağışlı.
- **Yer şekilleri:** Dik dağlık kıyı, **Çukurova, Antalya, Silifke ovaları** (delta ve graben).
- **Ekonomi:** **Narenciye, seracılık (sebze ve meyve), pamuk, muz, zeytin, turizm** (Antalya). Adana ve Mersin’de sanayi, Mersin ve İskenderun limanları. **Bölgenin en önemli özelliği: Kışın bile sebze meyve yetişmesidir.**
- **Özellik:** **Yaylacılık**, Toroslarda orman.

## 5. Karadeniz Bölgesi

- **Konum:** Kuzeyde, uzun ve dar bir kıyı şeridi. **Kuzey Anadolu Dağları** kıyıya paralel.
- **İklim:** **Karadeniz iklimi**. Her mevsim yağışlı, yazlar serin, kışlar ılık. **En çok yağış alan bölgedir**, Rize çevresi özellikle yağışlıdır.
- **Bitki örtüsü:** **Nemli orman** (kayın, kestane, gürgen), yüksek kesimlerde dağ çayırları (**yayla**).
- **Ekonomi:** **Çay** (Rize), **fındık** (Ordu, Giresun, Sakarya), **mısır**, tütün (Samsun), kivi. Balıkçılık (hamsi), ormancılık, **madencilik** (Zonguldak taş kömürü, Karabük demir-çelik). Karadeniz sanayisi sınırlıdır.
- **Yerleşme:** **Dağınık yerleşme**. **Nüfusu kıyıda** yoğundur.
- **Özellik:** Heyelan ve sel görülür, **ulaşım zor**dur, kıyı ile iç kesim arası geçit sınırlıdır.

## 6. İç Anadolu Bölgesi

- **Konum:** Ülkenin ortasında, **en geniş bölgelerden biri**.
- **İklim:** **Karasal iklim**. Yazlar sıcak ve kurak, kışlar soğuk ve karlı, yağış azdır.
- **Yer şekilleri:** Geniş **platolar**, kapalı havzalar (**Tuz Gölü**), tabanlı ovalar (**Konya Ovası**), volkanik dağlar (Erciyes, Hasan).
- **Bitki örtüsü:** **Bozkır (step).**
- **Ekonomi:** **Tahıl tarımı** (buğday, arpa, ‘Türkiye’nin tahıl ambarı’), **şeker pancarı**, hayvancılık (koyun, **Ankara keçisi** tiftik), sanayi (Ankara, Eskişehir, Konya, Kayseri). Tuz çıkarımı (Tuz Gölü).
- **Özellik:** Deniz etkisinden uzak, **karasallık** en fazla. **Kapadokya**: Volkanik tüflerin aşınmasıyla oluşan peri bacaları.

## 7. Doğu Anadolu Bölgesi

- **Konum:** Doğuda. **En büyük ve en yüksek bölge.**
- **İklim:** **Sert karasal iklim.** Kışlar çok soğuk ve uzun, karlı, yazlar kısa ve serin. Sıcaklık farkı çok.
- **Yer şekilleri:** Yüksek dağlar (**Ağrı**, Süphan, Nemrut), geniş platolar, **Van Gölü**, **Fırat ve Dicle’nin kaynak bölgesi**, **volkanik dağlar**.
- **Bitki örtüsü:** Bozkır, dağ çayırları, yüksek yerlerde seyrek orman.
- **Ekonomi:** **Hayvancılık** (büyükbaş ve küçükbaş, meralar), sınırlı tarım (arpa, buğday, patates, şeker pancarı Erzurum), madencilik (krom, bakır), **hidroelektrik** potansiyeli yüksek (barajlar).
- **Özellik:** **Nüfus yoğunluğu en düşük, göç veren** bölgedir. **Kış turizmi** (Palandöken, Sarıkamış) gelişiyor.

## 8. Güneydoğu Anadolu Bölgesi

- **Konum:** Güneydoğuda, **Suriye sınırında**. **En küçük bölgedir.**
- **İklim:** **Sıcak ve kurak** yazlar, ılık ve yağışlı kışlar. Yazları en sıcak bölgedir.
- **Yer şekilleri:** Yüksekliği az, **platolar ve ovalar** (Harran), **Karacadağ** (bazalt).
- **Ekonomi:** **Pamuk, buğday, mercimek, antepfıstığı, zeytin**. **GAP** ile sulu tarım gelişmiştir. **Petrol** (Batman, Adıyaman), **hayvancılık** (koyun).
- **Özellik:** **Hızlı nüfus artışı.** **Gaziantep** sanayi ve ticaret merkezidir.

## 9. Bölgeler arası farklar ve kalkınma projeleri

- **Batı bölgeleri** (Marmara, Ege) sanayi, nüfus ve gelir bakımından gelişmiş. **Doğu ve Güneydoğu** geri kalmıştır.
- **Fark nedenleri:** Yer şekli ve iklim, ulaşım, sermaye ve işgücü dağılışı, tarihî gelişim ve devlet politikaları.
- **Bölgesel kalkınma projeleri:** **GAP** (Güneydoğu Anadolu Projesi), **DAP** (Doğu Anadolu Projesi), **KOP** (Konya Ovası Projesi), **DOKAP** (Doğu Karadeniz Projesi). Amaç: bölgeler arası dengesizliği azaltmak, sulama, enerji, sanayi ve istihdamı geliştirmek.

:::neden-sonuc
- Marmara’da liman, sanayi ve ulaşım gelişmiş => En yoğun nüfuslu ve gelişmiş bölge olur.
- Karadeniz dağları kıyıya paralel => Her mevsim yağışlı, ulaşım ve yerleşme dağınık olur.
- Konya Ovası ve İç Anadolu platoları => Tahıl tarımı gelişir.
- Doğu Anadolu’da sert iklim ve yüksek yer => Hayvancılık öne çıkar, nüfus seyrektir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**En büyük bölgeyi İç Anadolu sanma.** Yüzölçümü bakımından en büyük bölge Doğu Anadolu, en küçük bölge Güneydoğu Anadolu’dur. Bir de **Akdeniz iklimini yalnızca Akdeniz Bölgesi’nde sanma**: Ege’nin kıyıları da Akdeniz iklimi altındadır. **Çay ve fındığı Ege’de sanma**: Her ikisi Karadeniz ürünüdür.
:::

:::baglanti
Bu konu, Türkiye’nin yer şekilleri, iklimi, bitki örtüsü, nüfusu ve ekonomisi konularının bölgelere göre bir özetidir. “Ekonomik Faaliyetler” konusu ürünlerin bölgelere göre dağılışını, “Ulaşım Hatları” konusu bölgeleri birbirine bağlayan yolları ayrıntılandırır. “Çevre ve Toplum” ve “Doğal Afetler” konularında bölgelerin çevre ve afet riskleri incelenir. Tarihte “Selçuklu Türkiyesi” ve “Milli Mücadele” konularının mekânları da bu bölgelerdedir.
:::

## 10. Konuyu toparla

| Bölge | Kısa not |
| --- | --- |
| Marmara | En yoğun nüfus, sanayi, geçiş iklimi |
| Ege | Zeytin, incir, üzüm, girintili kıyı |
| Akdeniz | Narenciye, seracılık, turizm |
| Karadeniz | Her mevsim yağışlı, çay, fındık |
| İç Anadolu | Karasal, bozkır, tahıl |
| Doğu Anadolu | En büyük ve yüksek, hayvancılık |
| Güneydoğu Anadolu | En küçük, GAP, pamuk |

## Mini test

:::soru{cevap="A"}
Her mevsim yağışlı olan, dağları kıyıya paralel uzanan, dağınık yerleşmenin yaygın olduğu ve çay ile fındığın yetiştirildiği coğrafi bölge aşağıdakilerden hangisidir?

- A) Karadeniz Bölgesi
- B) Ege Bölgesi
- C) İç Anadolu Bölgesi
- D) Güneydoğu Anadolu Bölgesi
- E) Marmara Bölgesi

---

1. Her mevsim yağış, kıyıya paralel dağlar, dağınık yerleşme, çay ve fındık Karadeniz Bölgesi'nin özelliğidir.
2. Doğru cevap A.

Diğer şıklar: **Ege Bölgesi** Ege’de Akdeniz iklimi etkilidir, çay yetişmez / **İç Anadolu Bölgesi** İç Anadolu karasal iklimlidir ve yağış azdır / **Güneydoğu Anadolu Bölgesi** Güneydoğu’da yazlar sıcak ve kuraktır / **Marmara Bölgesi** Marmara geçiş iklimine sahiptir, çay yetişmez.
:::

:::soru{cevap="B"}
Aşağıdaki bölge ve özellik eşleştirmelerinden hangisi **yanlıştır**?

- A) Marmara: Sanayinin en gelişmiş olduğu bölge
- B) Doğu Anadolu: En yoğun nüfuslu bölge
- C) Güneydoğu Anadolu: En küçük bölge
- D) İç Anadolu: Karasal iklim ve bozkır
- E) Akdeniz: Kışın seracılık yapılabilen bölge

---

1. Nüfus yoğunluğu en fazla olan bölge Marmara'dır. Doğu Anadolu'da yoğunluk en düşüktür.
2. Bu eşleştirme yanlıştır. Doğru cevap B.

Diğer şıklar: **Marmara: Sanayinin en gelişmiş olduğu bölge** Marmara sanayide en gelişmiş bölgedir / **Güneydoğu Anadolu: En küçük bölge** Güneydoğu Anadolu yüzölçümü en küçük bölgedir / **İç Anadolu: Karasal iklim ve bozkır** İç Anadolu karasal iklim ve bozkırdır / **Akdeniz: Kışın seracılık yapılabilen bölge** Akdeniz’de kışlar ılık, seracılık yapılır.
:::

:::soru{cevap="C"}
Güneydoğu Anadolu Projesi (GAP) ile Fırat ve Dicle üzerinde yapılan barajların temel amacı aşağıdakilerden hangisidir?

- A) Karadeniz kıyısının iklimini değiştirmek
- B) Ege kıyısında turizmi artırmak
- C) Sulama ve enerji üretmek
- D) İç Anadolu’da bozkırı ormana çevirmek
- E) Doğu Anadolu’da kış turizmi geliştirmek

---

1. GAP Güneydoğu Anadolu'da barajlar ve sulama kanallarıyla tarımı ve enerji üretimini geliştirmeyi amaçlar.
2. Doğru cevap C.

Diğer şıklar: **Karadeniz kıyısının iklimini değiştirmek** GAP Güneydoğu’dadır ve Karadeniz iklimiyle ilgili değildir / **Ege kıyısında turizmi artırmak** GAP turizm projesi değildir / **İç Anadolu’da bozkırı ormana çevirmek** GAP’ın bu amacı yoktur / **Doğu Anadolu’da kış turizmi geliştirmek** GAP kış turizmi projesi değildir.
:::

:::soru{cevap="D"}
Türkiye’nin yedi coğrafi bölgesinin belirlendiği kongre hangi yılda toplanmıştır?

- A) 1923
- B) 1938
- C) 1940
- D) 1941
- E) 1950

---

1. Yedi coğrafi bölge Birinci Coğrafya Kongresi'nde (1941) belirlenmiştir.
2. Doğru cevap D.

Diğer şıklar: **1923** Cumhuriyet’in ilan yılı alınmış / **1938** Atatürk’ün vefat yılı alınmış / **1940** işlem hatasıyla bir eksik bulunmuş / **1950** kırdan kente göçün hızlandığı yıl alınmış.
:::

## Kendini dene

:::dene
1. Türkiye’nin kaç coğrafi bölgesi vardır? => Yedi.
2. En yoğun nüfuslu bölge hangisidir? => Marmara.
3. Çay hangi bölgenin ürünüdür? => Karadeniz.
4. GAP hangi bölgeyi kapsar? => Güneydoğu Anadolu.
5. Hangi bölgede kışın bile sebze ve meyve üretilir? => Akdeniz.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-cog' and name = 'Bölgeler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Bölge kavramı, Türkiye'nin yedi coğrafi bölgesi, bölgelerin iklim, yer şekli ve ekonomik özellikleri, bölgesel kalkınma projeleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Bölgeler Birinci Coğrafya Kongresi (1941) bilgisidir.
Kontrol edilecekler: Bölgelerin yüzölçümü sıralaması (Doğu Anadolu en büyük, Güneydoğu en küçük) ders kitabı bilgisidir, güncel ölçümlerle teyit edilmeli. Ürün ve şehir örnekleri kısaltıldı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Bölgeler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ürünün tarladan sofraya, bir insanın evinden okula, bir ülkenin mallarının dünyaya ulaşması **ulaşım** sayesinde olur. Ulaşım yolları hem insanı hem malı hem bilgiyi taşır, bölgeleri birbirine bağlar. Türkiye’nin kıtaların kavşağında olması ulaşımı daha da önemli yapar. Bu konuda **ulaşım türlerini** (karayolu, demiryolu, denizyolu, havayolu, boru hattı), her birinin **avantaj ve dezavantajlarını**, **Türkiye’deki ulaşım ağını** ve ulaşımın ekonomi ve yerleşmeye etkilerini öğreneceksin.

:::hedefler
1. Ulaşım türlerini ve özelliklerini karşılaştırmak.
2. Ulaşımı etkileyen doğal ve beşeri etmenleri açıklamak.
3. Türkiye’nin ulaşım ağını ve önemli ulaşım projelerini tanımak.
4. Boru hatlarının ve enerji koridorlarının önemini söylemek.
5. Ulaşımın ekonomi, yerleşme ve çevre üzerindeki etkilerini yorumlamak.
:::

## 1. Ulaşımı etkileyen etmenler

**Doğal etmenler:**

- **Yer şekilleri:** Dağlık alanda yol yapımı zor ve pahalıdır (tünel, viyadük). Ovalarda kolaydır.
- **İklim:** Kar, buzlanma, sis, fırtına ulaşımı aksatır. Kuzey denizleri kışın donabilir.
- **Akarsu, göl, deniz:** Köprü ve feribot gerektirir, limanlar için uygun kıyı önemlidir.

**Beşeri etmenler:**

- **Ekonomik gelişmişlik ve sermaye.**
- **Nüfus yoğunluğu** ve yük hacmi.
- **Teknoloji.**
- **Devlet politikaları** ve ulaşım planlaması.
- **Siyasi ilişkiler** (sınır kapıları, ticaret anlaşmaları).

## 2. Ulaşım türleri

| Tür | Avantaj | Dezavantaj |
| --- | --- | --- |
| **Karayolu** | Kapıdan kapıya, esnek, kısa ve orta mesafede ucuz | Kapasite az, kaza ve çevre kirliliği, uzun mesafede pahalı |
| **Demiryolu** | Ağır ve toplu yükte ucuz, güvenli, çevre dostu | Hat yatırımı pahalı, esnek değil |
| **Denizyolu** | Çok ağır yük ve uzun mesafede en ucuz, uluslararası ticaretin ana yolu | Yavaş, limana bağımlı |
| **Havayolu** | En hızlı, uzak mesafe, yolcu ve değerli yük | En pahalı, hava koşullarına bağlı, kapasite az |
| **Boru hattı** | Petrol, doğal gaz, su gibi sıvı ve gazlarda ucuz, sürekli | Yalnızca belli ürünlerde, ilk yatırım yüksek |

## 3. Türkiye’de ulaşım

### Karayolu

- Türkiye’de **yolcu ve yük taşımacılığının büyük kısmı** karayoluyla yapılır.
- **Otoyollar** (Edirne-Ankara-İstanbul, Mersin-Adana), devlet ve il yolları.
- **Boğaz köprüleri** (1973’te açılan ilk Boğaz köprüsü, Fatih Sultan Mehmet Köprüsü, Yavuz Sultan Selim Köprüsü), **Osmangazi Köprüsü** (İzmit Körfezi), **1915 Çanakkale Köprüsü**.
- **Tüneller** (Zigana, Bolu, Avrasya Tüneli).
- Karayolu ağı **Marmara ve Ege’de** yoğundur, **Doğu’da** seyrektir.

### Demiryolu

- İlk hat Osmanlı döneminde İzmir-Aydın (1856) ile yapıldı. **Cumhuriyet döneminde** hatlar hızla artırıldı (Ankara başkent merkezli).
- **Yüksek Hızlı Tren (YHT)** Ankara-Eskişehir (2009) ile başladı, İstanbul, Konya, Sivas gibi merkezlere uzandı.
- **Marmaray (2013):** İstanbul Boğazı’nın altından kıtaları birleştiren raylı sistem.
- Türkiye’de demiryolu payı karayoluna göre düşüktür. Hatlar **Ankara merkezli** gelişmiştir.

### Denizyolu

- Üç yanı denizlerle çevrili olması denizyolunu önemli kılar. **Dış ticaretin büyük kısmı** denizden yapılır.
- Önemli limanlar: **İstanbul, İzmir, Mersin, İskenderun, Samsun, Kocaeli, Trabzon.**
- **İstanbul ve Çanakkale Boğazları** dünya deniz ticareti için stratejik geçittir. **Montrö Sözleşmesi (1936)** geçiş düzenini belirler.

### Havayolu

- Hızlı ve uzak mesafelere elverişlidir. **İstanbul Havalimanı** büyük bir aktarma merkezidir. Turizm bölgelerinde (Antalya, Muğla) yoğundur.
- Türkiye coğrafi konumu sayesinde Avrupa, Asya ve Afrika arasında **aktarma merkezi** olma avantajına sahiptir.

### Boru hatları

- **Bakü-Tiflis-Ceyhan (BTC) ham petrol boru hattı** (2006): Hazar petrolünü Ceyhan Terminali’ne taşır.
- **Kerkük-Yumurtalık** (Irak petrolü), **Mavi Akım** ve **TürkAkım** (Rusya doğal gazı), **TANAP** (Azerbaycan gazı) gibi hatlarla Türkiye bir **enerji koridoru** durumundadır.

## 4. Ulaşımın etkileri

- **Ekonomi:** Ürünler pazara ulaşır, sanayi, ticaret ve turizm gelişir. Ulaşımı iyi olan yerlerde **yatırım** artar.
- **Yerleşme:** Yol kavşaklarında, limanlarda ve istasyonlarda yerleşme büyür. Ulaşım zayıf yerlerde nüfus azalır.
- **Bölgeler arası ilişki:** Uzak yerler birbirine yaklaşır.
- **Çevre:** Karayolu ve havayolu **sera gazı** ve **gürültü** yaratır, tarım alanı ve ormanları daraltabilir. Demiryolu ve toplu taşıma çevre dostudur.
- **Stratejik önem:** Ulaşım hatları ve enerji koridorları ülkenin **jeopolitik gücünü** artırır.

:::neden-sonuc
- Çok ağır yük uzun mesafeye gidiyor => Denizyolu en ucuz çözümdür.
- Sıvı ve gaz taşınıyor => Boru hattı ucuz ve sürekli taşıma sağlar.
- Dağlık arazide yol yapılıyor => Tünel ve viyadük gerekir, maliyet artar.
- Türkiye üç kıtanın kavşağında => Boğazlar, boru hatları ve havalimanları stratejik hale gelir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**En ucuz ulaşımın karayolu olduğunu sanma.** Kısa mesafede karayolu uygundur, ağır yükte ve uzun mesafede **denizyolu** en ucuzdur. Bir de **Marmaray ile Avrasya Tüneli’ni karıştırma**: Marmaray bir raylı sistemdir, Avrasya Tüneli karayolu tünelidir. **BTC’yi doğal gaz hattı sanma**: BTC ham petrol hattıdır.
:::

:::baglanti
Bu konu, “Coğrafi Konum” konusundaki Türkiye’nin özel konumunun ulaşım ve enerji koridoru olarak değerlendirilmesini gösterir. “Ekonomik Faaliyetler” ve “Bölgeler” konuları, ulaşımın ekonomik ve bölgesel etkilerini destekler. “Türkiye’nin Yer Şekilleri” konusundaki dağlar ve boğazlar yol güzergâhlarını belirler. Tarihte “Dünya Gücü Osmanlı” konusundaki ticaret yolları ve “Milli Mücadele” konusundaki Boğazlar da bu bağlamla ilişkilidir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Karayolu | Esnek, kısa ve orta mesafe, kapıdan kapıya |
| Demiryolu | Ağır yük, güvenli, çevre dostu |
| Denizyolu | Ağır yük, uzun mesafe, en ucuz |
| Havayolu | En hızlı, en pahalı |
| Boru hattı | Petrol ve gaz |
| Marmaray | Raylı sistem, Boğaz altı |
| BTC | Ham petrol, Hazar'dan Ceyhan'a |
| Boğazlar | Montrö Sözleşmesi |

## Mini test

:::soru{cevap="E"}
Bir şirket, çok miktardaki ham maddeyi Türkiye’den başka bir kıtadaki ülkeye taşıyacaktır. Maliyetin en düşük olması isteniyorsa hangi ulaşım türü tercih edilmelidir?

- A) Havayolu
- B) Karayolu
- C) Demiryolu
- D) Boru hattı
- E) Denizyolu

---

1. Ağır yük ve uzun mesafede en ucuz taşıma denizyoludur.
2. Hava en pahalı, karayolu uzun mesafede pahalıdır. Doğru cevap E.

Diğer şıklar: **Havayolu** havayolu en pahalı ulaşım türüdür / **Karayolu** karayolu uzun mesafede ve kıtalar arasında pahalı ve yetersizdir / **Demiryolu** kıtalar arasında demiryolu bağlantısı sınırlıdır / **Boru hattı** boru hattı yalnızca sıvı ve gaz taşıyabilir.
:::

:::soru{cevap="E"}
Hazar Denizi çevresindeki petrolün Azerbaycan ve Gürcistan üzerinden Türkiye’deki Ceyhan Terminali’ne taşınmasını sağlayan hat aşağıdakilerden hangisidir?

- A) Mavi Akım doğal gaz hattı
- B) Kerkük-Yumurtalık boru hattı
- C) Marmaray
- D) Avrasya Tüneli
- E) BTC ham petrol hattı

---

1. Azerbaycan'dan Gürcistan üzerinden Ceyhan'a uzanan hat BTC'dir.
2. Diğerleri farklı ürün ya da güzergâhtır. Doğru cevap E.

Diğer şıklar: **Mavi Akım doğal gaz hattı** Mavi Akım Rusya doğal gazını taşır / **Kerkük-Yumurtalık boru hattı** Kerkük-Yumurtalık Irak petrolünü taşır / **Marmaray** Marmaray raylı ulaşım sistemidir / **Avrasya Tüneli** Avrasya Tüneli karayolu tünelidir.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi karayolu ulaşımının üstünlüklerinden biri **değildir**?

- A) Kapıdan kapıya taşıma imkânı sağlaması
- B) Esnek olması ve her yere ulaşabilmesi
- C) Kısa ve orta mesafelerde ekonomik olması
- D) Her tür arazide yol yapılabilmesi
- E) Çok ağır yükü çok uzağa en ucuz taşıması

---

1. Çok ağır yükü çok uzağa en ucuz taşıyan denizyoludur.
2. Karayolunun üstünlükleri esneklik, kapıdan kapıya taşıma ve kısa mesafede ekonomidir. Doğru cevap E.

Diğer şıklar: **Kapıdan kapıya taşıma imkânı sağlaması** karayolu kapıdan kapıya taşıma sağlar / **Esnek olması ve her yere ulaşabilmesi** karayolu esnek ve yaygındır / **Kısa ve orta mesafelerde ekonomik olması** karayolu kısa mesafede ekonomiktir / **Her tür arazide yol yapılabilmesi** karayolu çeşitli arazilerde yapılabilir.
:::

:::soru{cevap="B"}
Türkiye’de ilk Boğaz Köprüsü (15 Temmuz Şehitler Köprüsü) hangi yılda hizmete açılmıştır?

- A) 1972
- B) 1973
- C) 1988
- D) 2013
- E) 2016

---

1. İlk Boğaz Köprüsü 1973'te hizmete açılmıştır.
2. 1988 Fatih Sultan Mehmet, 2013 Marmaray, 2016 Yavuz Sultan Selim'in yılıdır. Doğru cevap B.

Diğer şıklar: **1972** işlem hatasıyla bir eksik bulunmuş / **1988** Fatih Sultan Mehmet Köprüsü’nün açılış yılı alınmış / **2013** Marmaray’ın açılış yılı alınmış / **2016** Yavuz Sultan Selim Köprüsü’nün açılış yılı alınmış.
:::

## Kendini dene

:::dene
1. Ağır yükü uzun mesafeye en ucuz taşıyan ulaşım türü hangisidir? => Denizyolu.
2. En hızlı ulaşım türü hangisidir? => Havayolu.
3. Petrol ve doğal gaz hangi yolla taşınır? => Boru hattı.
4. Marmaray ne tür bir sistemdir? => Raylı sistem.
5. Boğazlardan geçişi hangi sözleşme düzenler? => Montrö Sözleşmesi.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Ulaşım Hatları'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Ulaşımı etkileyen etmenler, ulaşım türleri ve karşılaştırması, Türkiye'de karayolu, demiryolu, denizyolu, havayolu ve boru hatları, ulaşımın etkileri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Köprü ve proje yılları (1973, 1988, 2009, 2013, 2016, 2006) genel kabul görmüş bilgilerdir.
Kontrol edilecekler: Boru hattı listesi ve açılış yılları güncel kaynaklarla teyit edilmeli. Köprülerin güncel adları kitaba göre yazılmalı. 1915 Çanakkale Köprüsü'nün açılış tarihi ve YHT hatları güncellenmeli.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Ulaşım Hatları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İnsan çevresinden yararlanır ama çevresini aynı zamanda değiştirir. Doğal kaynaklar sınırsız değildir ve bir yerde yapılan müdahale başka yerleri de etkiler. Bu konuda **insan ile çevre arasındaki etkileşimi**, **doğal kaynakların kullanımını**, **çevre sorunlarını** (küresel ve yerel), **sürdürülebilir kalkınmayı** ve çevreyi korumaya yönelik **uluslararası ve ulusal çabaları** öğreneceksin.

:::hedefler
1. İnsanın doğal çevreyi kullanma ve değiştirme biçimlerini açıklamak.
2. Yenilenebilir ve yenilenemeyen kaynakları ayırt etmek.
3. Önemli çevre sorunlarının nedenlerini ve sonuçlarını sıralamak.
4. Sürdürülebilir kalkınma ve ekolojik ayak izi kavramlarını yorumlamak.
5. Çevre koruma çalışmalarını (milli park, sözleşme, geri dönüşüm) örneklemek.
:::

## 1. İnsan ve çevre

İnsan **doğal çevreyi** (hava, su, toprak, bitki, hayvan, madenler) beslenme, barınma, enerji ve üretim için kullanır. Teknoloji geliştikçe doğaya etkisi artmıştır:

- **Tarım:** Orman açma, sulama, gübre ve ilaç kullanma.
- **Sanayi:** Hammadde çıkarma, atık ve gaz üretme.
- **Şehirleşme:** Yapılaşma, atık, enerji tüketimi.
- **Ulaşım:** Yollar, sera gazı.
- **Enerji:** Fosil yakıt yakma, baraj yapımı.

İnsan çevreyi değiştirdiği gibi **çevre de insanı etkiler**: İklim değişikliği, kuraklık, kirli hava, sel, sağlık sorunları. Çevre sorunlarının nedeni **nüfus artışı**, hızlı tüketim, plansız sanayileşme ve şehirleşme, bilinçsiz kaynak kullanımıdır.

## 2. Doğal kaynaklar

- **Yenilenemeyen kaynaklar:** Oluşumu çok uzun süren, kullanıldıkça tükenen kaynaklar. Kömür, petrol, doğal gaz, madenler.
- **Yenilenebilir kaynaklar:** Doğada yeniden oluşan ya da tükenmeyen kaynaklar. Güneş, rüzgâr, akarsu, jeotermal, biyokütle, orman (doğru yönetilirse), su.

Yenilenebilir kaynaklar da **aşırı ve yanlış** kullanılırsa tükenebilir (ormanlar, balık stokları, yer altı suları). Doğal kaynakların **gelecek kuşaklar için** korunması gerekir.

## 3. Çevre sorunları

**Hava kirliliği:** Fosil yakıt, sanayi ve taşıtlardan çıkan gazlar (karbondioksit, kükürt dioksit, azot oksitler), toz. Sonuçları: Solunum hastalıkları, **asit yağmuru**, **sera etkisinin artması**, ozon incelmesi. Büyük şehirlerde kış aylarında ısınma ve taşıtlarla artar.

**Su kirliliği:** Evsel ve sanayi atıkları, gübre ve ilaçlar, petrol sızıntıları, çöp. **Deniz, göl ve akarsu** kirlenir, canlı ölümleri ve içme suyu sorunları oluşur. **Aral Gölü** aşırı sulama için akarsuların yönünün değiştirilmesi yüzünden **büyük ölçüde kurumuştur.** 2021’de Marmara Denizi’nde yoğun **müsilaj** (deniz salyası) görülmüştür.

**Toprak kirliliği ve erozyon:** Kimyasal gübre, ilaç, atık. **Erozyon** (ormansızlaşma, aşırı otlatma, yanlış tarım), **çölleşme**, tuzlanma. Verimli toprak kaybı.

**Ormansızlaşma:** Tarım, yerleşme, kereste ve yangın nedeniyle ormanlar azalır. Sonuçları: Erozyon, sel, iklim değişikliği, biyoçeşitlilik kaybı, oksijen azalması.

**Küresel iklim değişikliği:** Sera gazlarının artışı sonucu **küresel sıcaklık yükselir.** Buzullar erir, deniz seviyesi yükselir, kuraklık ve aşırı hava olayları artar.

**Biyoçeşitlilik kaybı:** Yaşam alanlarının yok edilmesi, avlanma, kirlilik. Türlerin yok olması, ekosistem dengesinin bozulması.

**Atık sorunu:** Katı atıklar, plastikler, tehlikeli atıklar. Düzensiz depolama toprak, su ve havayı kirletir.

## 4. Sürdürülebilirlik

- **Sürdürülebilir kalkınma:** Bugünün ihtiyaçlarını, **gelecek kuşakların ihtiyaçlarını tehlikeye atmadan** karşılayan kalkınmadır. Ekonomik gelişme, toplumsal adalet ve çevre koruma birlikte düşünülür.
- **Ekolojik ayak izi:** Bir kişi ya da toplumun kaynak tüketimi ve ürettiği atığı karşılamak için gereken doğal alandır. Tüketim arttıkça ayak izi büyür. **Karbon ayak izi** ise salınan sera gazı miktarıdır.
- **Kaynakları verimli kullanma:** Enerji ve su tasarrufu, geri dönüşüm.

**Bireysel olarak yapılabilecekler:** Enerji ve su tasarrufu, toplu taşıma ve bisiklet, geri dönüşüm, gereksiz tüketimden kaçınma, ağaç dikme, atıkları ayrı toplama, yerel ürün tercih etme.

## 5. Çevreyi koruma çalışmaları

- **Milli parklar:** Doğal ve kültürel değeri yüksek yerlerin koruma altına alınması. Dünyanın ilk milli parkı **Yellowstone** (ABD, 1872). Türkiye’nin ilk milli parkı **Yozgat Çamlığı**’dır (1958).
- **Sulak alanlar:** **Ramsar Sözleşmesi** sulak alanları (göl, bataklık, delta) korur. Türkiye’de **Kızılırmak Deltası**, Burdur Gölü, Sultan Sazlığı gibi alanlar Ramsar listesindedir.
- **Uluslararası anlaşmalar:** **Kyoto Protokolü** ve **Paris Anlaşması** (sera gazı azaltma), **Montreal Protokolü** (ozon tabakası).
- **Çevre mevzuatı:** Çevre Kanunu, çevresel etki değerlendirme (**ÇED**) raporu (büyük yatırımlar öncesi gerekir).
- **Geri dönüşüm ve Sıfır Atık** uygulamaları. **Yenilenebilir enerji** yatırımları.
- **Çevre eğitimi:** Bilinç artışı, sivil toplum kuruluşlarının çalışmaları.

:::neden-sonuc
- Nüfus ve tüketim artıyor => Kaynak kullanımı ve atık miktarı artar.
- Fosil yakıt tüketimi artıyor => Sera gazı artar, küresel iklim değişir.
- Orman azalıyor => Erozyon, sel ve biyoçeşitlilik kaybı artar.
- Akarsular tarım için aşırı kullanılıyor => Göller ve denizler kuruyabilir (Aral Gölü örneği).
:::

:::ipucu{baslik="Sık yapılan hata"}
**Yenilenebilir kaynak sınırsız kullanılabilir sanma.** Orman, balık stoku ve yer altı suyu yenilenebilir olsa da aşırı kullanımda tükenir. Bir de **sürdürülebilirliği yalnızca çevre koruma sanma**: Ekonomi, toplum ve çevre birlikte düşünülür. **Ekolojik ayak izi büyüdükçe** çevre baskısı artar, azalmaz.
:::

:::baglanti
Bu konu, “Doğa ve İnsan” konusundaki doğa ve insan etkileşiminin devamıdır. “Atmosfer ve İklim”, “Su, Toprak ve Bitki” konuları, çevre sorunlarının doğal zeminini oluşturur. “Nüfus ve Göç” ve “Ekonomik Faaliyetler” konuları nüfus artışı ve üretimin çevre üzerindeki baskısını açıklar. Biyolojide “Güncel Çevre Sorunları” ve “Ekosistem Ekolojisi”, kimyada “Doğa ve Kimya” ve “Kimya Her Yerde” konuları bu konuyla örtüşür.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yenilenemeyen kaynak | Kömür, petrol, doğal gaz |
| Yenilenebilir kaynak | Güneş, rüzgâr, akarsu |
| Hava kirliliği | Sera etkisi, asit yağmuru |
| Erozyon | Üst toprağın kaybı |
| Sürdürülebilir kalkınma | Gelecek kuşakları düşünen kalkınma |
| Ekolojik ayak izi | Tüketimin doğal alan karşılığı |
| Milli park | Koruma alanı |
| Ramsar | Sulak alan sözleşmesi |
| ÇED | Çevresel etki değerlendirmesi |

## Mini test

:::soru{cevap="E"}
Aşağıdakilerden hangisi yenilenemeyen (tükenebilir) doğal kaynaklar arasında yer alır?

- A) Rüzgâr
- B) Güneş enerjisi
- C) Jeotermal enerji
- D) Akarsu enerjisi
- E) Doğal gaz

---

1. Doğal gaz fosil yakıttır, oluşumu çok uzun sürer ve kullanıldıkça tükenir.
2. Diğer seçenekler yenilenebilir kaynaklardır. Doğru cevap E.

Diğer şıklar: **Rüzgâr** rüzgâr yenilenebilir bir enerji kaynağıdır / **Güneş enerjisi** güneş enerjisi yenilenebilir kaynaktır / **Jeotermal enerji** jeotermal yenilenebilir kaynaktır / **Akarsu enerjisi** akarsu enerjisi yenilenebilir kaynaktır.
:::

:::soru{cevap="D"}
Bir ülke, yeni bir sanayi bölgesi kurmadan önce çevreye olası etkilerini ayrıntılı biçimde incelemek için hangi raporu hazırlatmak zorundadır?

- A) Kadastro raporu
- B) Nüfus sayım raporu
- C) Meteoroloji raporu
- D) ÇED raporu
- E) İhracat raporu

---

1. Büyük yatırımların çevreye etkisi önceden ÇED raporuyla değerlendirilir.
2. Doğru cevap D.

Diğer şıklar: **Kadastro raporu** kadastro mülkiyet ve arazi kaydıdır / **Nüfus sayım raporu** nüfus sayımı çevre etkisini değerlendirmez / **Meteoroloji raporu** meteoroloji raporu hava durumunu gösterir / **İhracat raporu** ihracat raporu dış ticaret verisidir.
:::

:::soru{cevap="A"}
Bir toplumun yaşam biçimi için gereken kaynakların ve atıkların emilmesi için kullanılan doğal alan miktarını ifade eden kavram aşağıdakilerden hangisidir?

- A) Ekolojik ayak izi
- B) Nüfus yoğunluğu
- C) Kentleşme oranı
- D) Doğal artış hızı
- E) Bağımlılık oranı

---

1. Ekolojik ayak izi, tüketim ve atıkları karşılamak için gereken doğal alanı ifade eder.
2. Doğru cevap A.

Diğer şıklar: **Nüfus yoğunluğu** nüfus yoğunluğu insan sayısının alana oranıdır / **Kentleşme oranı** kentleşme oranı kentte yaşayan nüfus oranıdır / **Doğal artış hızı** doğal artış hızı doğum ve ölüm farkıdır / **Bağımlılık oranı** bağımlılık oranı çalışmayan nüfusun oranıdır.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi küresel ısınmanın olası sonuçlarından biri **değildir**?

- A) Deniz seviyesinin yükselmesi
- B) Buzulların büyümesi ve deniz seviyesinin düşmesi
- C) Kuraklık ve aşırı hava olaylarının artması
- D) Bazı canlı türlerinin yaşam alanlarının kayması
- E) Tarımsal veriminin bölgesel olarak düşmesi

---

1. Küresel ısınmada buzullar erir, deniz seviyesi yükselir.
2. Buzulların büyümesi ve deniz seviyesinin düşmesi bu sonuçların tersidir. Doğru cevap B.

Diğer şıklar: **Deniz seviyesinin yükselmesi** buzullar erirse deniz seviyesi yükselir / **Kuraklık ve aşırı hava olaylarının artması** iklim değişikliği bunları artırabilir / **Bazı canlı türlerinin yaşam alanlarının kayması** iklim değişince yaşam alanları kayar / **Tarımsal veriminin bölgesel olarak düşmesi** kuraklık ve sıcaklık verimi etkiler.
:::

## Kendini dene

:::dene
1. Kömür yenilenebilir bir kaynak mıdır? => Hayır, yenilenemeyen kaynaktır.
2. Sürdürülebilir kalkınmanın temel fikri nedir? => Gelecek kuşakların ihtiyaçlarını tehlikeye atmamak.
3. Sulak alanları koruyan sözleşme hangisidir? => Ramsar Sözleşmesi.
4. Türkiye’nin ilk milli parkı hangisidir? => Yozgat Çamlığı.
5. Büyük yatırımlar öncesi hangi rapor istenir? => ÇED raporu.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-cog' and name = 'Çevre ve Toplum'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İnsan ve çevre etkileşimi, doğal kaynaklar, çevre sorunları, sürdürülebilir kalkınma, ekolojik ayak izi, çevreyi koruma çalışmaları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Yellowstone (1872) ve Yozgat Çamlığı (1958) bilgileri genel kabul görmüş bilgilerdir.
Kontrol edilecekler: Marmara müsilajı (2021) ve Aral Gölü bilgisi güncel kaynaklarla teyit edilmeli. Türkiye'nin Ramsar alanları listesi güncellenmeli. Paris Anlaşması ve Kyoto ayrıntıları kısaltıldı.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Çevre ve Toplum'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Deprem, sel, heyelan, çığ, orman yangını, kuraklık ve hortum. Türkiye’de neredeyse her yıl bu afetlerden biri yaşanır. Doğal olaylar insanı ve yapılaşmayı etkilediğinde **afete** dönüşür. Doğal olayı engellemek çoğu zaman mümkün değildir ama **hazırlıklı olmak** can ve mal kaybını büyük ölçüde azaltır. Bu konuda **afet kavramını**, **afet türlerini**, **Türkiye’de afetlerin dağılışını** ve **afet öncesi, sırası ve sonrası yapılması gerekenleri** öğreneceksin.

:::hedefler
1. Doğal olay, afet ve risk kavramlarını ayırt etmek.
2. Afet türlerini oluşum nedenine göre sınıflandırmak.
3. Türkiye’de afetlerin dağılışını yer şekli, iklim ve yapıyla ilişkilendirmek.
4. Deprem, sel, heyelan, çığ ve orman yangınında alınacak önlemleri açıklamak.
5. Afet yönetiminin evrelerini (zarar azaltma, hazırlık, müdahale, iyileştirme) sıralamak.
:::

## 1. Doğal olay, afet ve risk

- **Doğal olay:** Doğanın kendi işleyişinde gerçekleşen olay (deprem, yağış, volkan püskürmesi).
- **Afet:** Doğal olayın insanlara, yapılara ve çevreye **zarar vermesi** (can ve mal kaybı, ekonomik kayıp). İnsansız bir çölde olan deprem afet değildir.
- **Tehlike:** Zarar verme potansiyeli olan olay.
- **Risk:** Tehlikenin, yaşam alanı ve yapıların **zarar görme ihtimaliyle** birleşimidir. Yapılar dayanıksız ve nüfus yoğunsa **risk artar.**

Afetin büyüklüğü, doğal olayın şiddeti kadar **hazırlık düzeyine, yapı kalitesine, nüfus yoğunluğuna** da bağlıdır.

## 2. Afet türleri

| Tür | Afetler |
| --- | --- |
| **Jeolojik (yerle ilgili)** | Deprem, volkan, heyelan, çığ, tsunami |
| **Meteorolojik ve hidrolojik (hava ve su ile ilgili)** | Sel ve taşkın, kuraklık, fırtına, hortum, dolu, don, aşırı sıcak |
| **Biyolojik ve diğer** | Orman yangını, salgın hastalık, çekirge istilası |
| **İnsan kaynaklı** | Sanayi kazaları, kirlilik, bina çökmesi |

## 3. Başlıca afetler ve önlemler

### Deprem

Deprem, **fay hatları** ve levha sınırlarında görülür. **Önlemler:**

- **Yer seçimi:** Fay hatlarından, dolgu ve zayıf zeminden, eğimli arazilerden kaçınma.
- **Depreme dayanıklı yapı** (yönetmelik, denetim, kaliteli malzeme). Depremi önlemek mümkün değildir ama dayanıklı yapı can kaybını büyük ölçüde azaltır.
- **Eski yapıların güçlendirilmesi** ya da yenilenmesi (kentsel dönüşüm).
- **Eğitim ve tatbikat.** Deprem anında **“çök, kapan, tutun”**. Merdivenlere ve asansöre değil, sağlam bir mobilyanın yanına, boşluğa çökülür. Bina sarsıntı bitince terk edilir.
- **Afet çantası**, toplanma alanlarını bilmek.

### Sel ve taşkın

Aşırı yağış, kar erimesi, baraj yıkılması. **Önlemler:** Dere yataklarına yapılaşmama, **baraj, bent**, ağaçlandırma, dere ıslahı, erken uyarı sistemleri. Karadeniz’de ani sellere sık rastlanır.

### Heyelan

Eğimli yamaçlarda toprak ve kayanın yerçekimiyle kayması. Nedenleri: Aşırı yağış, deprem, **ormansızlaşma**, yanlış yapılaşma. Önlem: **Ağaçlandırma, drenaj, istinat duvarı**, yamaca yapı yapmama. Karadeniz’de çok görülür.

### Çığ

Karlı yamaçlarda kar kütlesinin aşağıya kayması. **Doğu Anadolu ve Toroslar**’da görülür. Önlem: Çığ riskli yerlere yerleşmeme, **çığ bariyerleri**, ağaçlandırma, uyarı sistemleri.

### Orman yangını

**Sıcak ve kurak yaz** mevsiminde, Akdeniz ve Ege kıyılarında yaygın. Çoğu **insan kaynaklı** (ihmal, kasıt). Önlem: Ormanda ateş yakmama, gözetleme kuleleri, erken müdahale, yangına dayanıklı bitkilendirme.

### Kuraklık

Yağışın uzun süre ortalamanın altında kalması. İç Anadolu ve Güneydoğu’da riskli. Su kaynakları azalır, tarım zarar görür. Önlem: Su tasarrufu, **damla sulama**, kuraklığa dayanıklı ürün, su depolama.

### Volkan, tsunami, hortum

- **Volkan:** Türkiye’de **sönmüş ya da uykuda** volkanlar var (Erciyes, Hasan, Ağrı).
- **Tsunami:** Deniz altı depremlerinde oluşan dev dalgalar. Ege ve Akdeniz kıyılarında olası.
- **Hortum:** Kısa süreli, şiddetli dönen hava hareketi. Akdeniz ve Ege kıyılarında yaz sonu ve sonbaharda görülür.

## 4. Türkiye’de afetlerin dağılışı

- **Deprem:** **Kuzey Anadolu Fay Hattı**, **Doğu Anadolu Fay Hattı** ve **Batı Anadolu’daki graben alanları**. Türkiye’nin büyük kısmı deprem bölgesidir. Tarihte çok sayıda yıkıcı deprem yaşanmıştır: **1999 İzmit** ve **6 Şubat 2023 Kahramanmaraş** depremleri.
- **Sel ve heyelan:** **Karadeniz** (bol yağış, dik yamaç, ormansızlaşma).
- **Çığ:** **Doğu Anadolu, Toroslar**, dağlık kış alanları.
- **Orman yangını:** **Ege ve Akdeniz kıyıları** (yaz kuraklığı, maki ve çam ormanları).
- **Kuraklık:** İç Anadolu, Güneydoğu Anadolu, Ege’nin iç kesimleri.
- **Dolu, don:** İç Anadolu, bahar ve sonbahar.

## 5. Afet yönetimi

Afet yönetimi **dört evreden** oluşur:

1. **Zarar azaltma (önleme):** Risk analizi, yer seçimi, dayanıklı yapı, planlama, ağaçlandırma, imar kuralları.
2. **Hazırlık:** Eğitim, tatbikat, afet planları, acil durum çantası, erken uyarı sistemleri, malzeme ve gönüllü ekipler.
3. **Müdahale:** Arama ve kurtarma, ilk yardım, barınma, yiyecek, haberleşme. Türkiye’de **AFAD** (Afet ve Acil Durum Yönetimi Başkanlığı) merkezi koordinasyonu yürütür. Ayrıca AKUT gibi gönüllü kuruluşlar çalışır.
4. **İyileştirme:** Hasar tespiti, kalıcı konut, altyapının onarımı, ekonomik destek, psikolojik destek.

**Zarar azaltma ve hazırlık**, can ve mal kaybını **en çok azaltan** evrelerdir. Afetten sonra yapılan müdahale ne kadar hızlı olursa olsun, öncesindeki hazırlık eksikse kayıp artar.

**Bireysel ve toplumsal sorumluluk:**

- **Yapı denetimi** ve sağlam yapı.
- **Afet sigortası** (zorunlu deprem sigortası DASK).
- Eğitim ve bilinç, afet çantası, aile planı.
- Doğayı korumak: Ormanları korumak, dere yataklarına müdahale etmemek.

:::neden-sonuc
- Fay hattı üzerinde yapılaşma var => Deprem riski ve zararı artar.
- Eğimli yamaçta orman kesiliyor => Heyelan riski artar.
- Dere yatağı yapılaşmaya açılıyor => Sel afeti olasılığı artar.
- Afet öncesi hazırlık yapılıyor => Can ve mal kaybı azalır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Her doğal olayı afet sanma.** Doğal olay insana ve yapılara zarar verdiğinde afettir. Bir de **deprem anında hemen dışarı koşmayı ya da asansörü kullanmayı** doğru sanma: Önce **çök, kapan, tutun**, sarsıntı bitince güvenli biçimde çık. **Afet yönetimini yalnızca müdahaleden ibaret sanma**: Zarar azaltma ve hazırlık en önemli evrelerdir.
:::

:::baglanti
Bu konu, “İç ve Dış Kuvvetler” konusundaki deprem, volkan ve heyelanın afet boyutudur. “Atmosfer ve İklim” konusundaki yağış ve kuraklık, “Su, Toprak ve Bitki” konusundaki erozyon, sel ve heyelanı açıklar. “Yerleşme” konusunda yapılaşma ve yer seçimi, “Çevre ve Toplum” konusunda çevre koruma bu konuyla birleşir. “Doğa ve İnsan” konusundaki CBS afet risk haritalarında kullanılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Afet | Doğal olay zarar verirse |
| Risk | Tehlike ve zarar görebilirlik |
| Deprem | Fay hatları, dayanıklı yapı |
| Sel ve heyelan | Karadeniz, ağaçlandırma |
| Çığ | Doğu Anadolu, Toroslar |
| Orman yangını | Ege ve Akdeniz yazı |
| Kuraklık | İç Anadolu, Güneydoğu |
| Afet yönetimi | Zarar azaltma, hazırlık, müdahale, iyileştirme |
| AFAD | Müdahale koordinasyonu |

## Mini test

:::soru{cevap="D"}
Aşağıdakilerden hangisi doğal olayın afete dönüşmesinde etkili olan beşeri etmenlerden biridir?

- A) Levhaların hareket etmesi
- B) Bölgede yağışın mevsimlik değişmesi
- C) Dağların kıyıya paralel uzanması
- D) Fay üzerinde dayanıksız bina yapılması
- E) Akarsuyun eğimli arazide hızlı akması

---

1. Afete dönüşmede hem doğal hem beşeri etmenler etkilidir.
2. Fay hattı üzerinde dayanıksız yapılaşma insan kaynaklıdır, diğerleri doğal etmenlerdir. Doğru cevap D.

Diğer şıklar: **Levhaların hareket etmesi** levha hareketi doğal bir etmendir / **Bölgede yağışın mevsimlik değişmesi** yağış rejimi doğal bir etmendir / **Dağların kıyıya paralel uzanması** dağ uzanışı doğal bir unsurdur / **Akarsuyun eğimli arazide hızlı akması** akış hızı doğal bir etmendir.
:::

:::soru{cevap="B"}
Bir deprem anında kapalı bir binada bulunan kişinin yapması gereken aşağıdakilerden hangisidir?

- A) Asansöre binip hızla zemin kata inmek
- B) Sağlam mobilyanın yanına çökmek
- C) Balkona çıkıp dışarıya bakmak
- D) Pencerenin yanına gidip cama dayanmak
- E) Merdivenlerden aşağıya koşmak

---

1. Deprem anında çök, kapan, tutun uygulanır.
2. Asansör, balkon, pencere ve merdiven tehlikelidir. Doğru cevap B.

Diğer şıklar: **Asansöre binip hızla zemin kata inmek** deprem anında asansör kullanılmaz / **Balkona çıkıp dışarıya bakmak** balkon düşme riskine sahiptir / **Pencerenin yanına gidip cama dayanmak** cam kırılıp yaralayabilir / **Merdivenlerden aşağıya koşmak** sarsıntı sırasında merdiven tehlikelidir.
:::

:::soru{cevap="D"}
Aşağıdaki afet ve görüldüğü bölge eşleştirmelerinden hangisi **yanlıştır**?

- A) Sel ve heyelan: Karadeniz kıyıları
- B) Çığ: Doğu Anadolu ve Toroslar
- C) Orman yangını: Ege ve Akdeniz kıyıları
- D) Orman yangını: Doğu Karadeniz yüksek kesimi
- E) Kuraklık: İç Anadolu

---

1. Orman yangınları sıcak ve kurak yazlı Ege ve Akdeniz kıyılarında çoktur.
2. Doğu Karadeniz'in nemli yüksek kesimi yangına en az açık yerdir. Doğru cevap D.

Diğer şıklar: **Sel ve heyelan: Karadeniz kıyıları** Karadeniz bol yağış ve dik yamaçla sel ve heyelana açıktır / **Çığ: Doğu Anadolu ve Toroslar** karlı dağlık yerlerde çığ görülür / **Orman yangını: Ege ve Akdeniz kıyıları** yaz kuraklığı yangına yol açar / **Kuraklık: İç Anadolu** İç Anadolu kuraklık riski taşır.
:::

:::soru{cevap="A"}
Afet yönetimi evrelerinden hangisi can ve mal kaybını en çok azaltan, afet gelmeden yapılan çalışmaları kapsar?

- A) Zarar azaltma ve hazırlık
- B) Yalnızca arama ve kurtarma
- C) Yalnızca iyileştirme
- D) Yalnızca müdahale
- E) Yalnızca yardım dağıtımı

---

1. Zarar azaltma ve hazırlık afetten önce yapılır, can ve mal kaybını en çok azaltır.
2. Diğer evreler afet sırasında ve sonrasındadır. Doğru cevap A.

Diğer şıklar: **Yalnızca arama ve kurtarma** arama kurtarma afetten sonraki müdahale evresindedir / **Yalnızca iyileştirme** iyileştirme afetten sonraki evredir / **Yalnızca müdahale** müdahale afet sırasında ve hemen sonrasındadır / **Yalnızca yardım dağıtımı** yardım dağıtımı afet sonrası evrenin parçasıdır.
:::

## Kendini dene

:::dene
1. Deprem anında ne yapılır? => Çök, kapan, tutun.
2. Karadeniz’de sık görülen iki afet hangisidir? => Sel ve heyelan.
3. Afet yönetiminin evrelerinden biri hangisidir? => Zarar azaltma.
4. Orman yangınları en çok hangi kıyılarda görülür? => Ege ve Akdeniz.
5. Türkiye’de afet müdahalesini koordine eden kurum hangisidir? => AFAD.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-cog' and name = 'Doğal Afetler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Doğal olay, afet ve risk kavramları, afet türleri, deprem, sel, heyelan, çığ, orman yangını, kuraklık, Türkiye'de afetlerin dağılışı, afet yönetimi evreleri, AFAD. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Deprem anında yapılması gerekenler (çök-kapan-tutun) güncel AFAD önerileriyle karşılaştırılmalı. 1999 İzmit ve 2023 Kahramanmaraş depremleri tarihleri teyit edilmeli. DASK (zorunlu deprem sigortası) ayrıntısı kaynakla kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-cog' and name = 'Doğal Afetler'
on conflict (topic_id) do nothing;
