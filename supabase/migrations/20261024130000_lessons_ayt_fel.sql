-- 20261024130000_lessons_ayt_fel. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Günlük hayatta sürekli çıkarım yaparız. Bir bilgiden başka bir bilgiye ulaşırız, bir iddiayı kabul ya da reddederiz. Peki bunu hangi kurallara göre yapıyoruz? **Mantık**, doğru düşünmenin kurallarını inceleyen bilimdir. Bu konuda **mantığın tanımını ve konusunu**, **tarihsel gelişimini**, **temel düşünme ilkelerini** (özdeşlik, çelişmezlik, üçüncü hâlin imkânsızlığı, yeter sebep) ve **doğruluk, tutarlılık, geçerlilik** kavramlarını öğreneceksin.

:::hedefler
1. Mantığın tanımını ve konusunu söylemek.
2. Mantığın gelişiminde önemli isimleri ve dönemleri sıralamak.
3. Dört temel düşünme ilkesini örneklerle ayırt etmek.
4. Doğruluk, tutarlılık ve geçerlilik kavramlarını karşılaştırmak.
5. Günlük hayattan bir yargıdaki mantık hatasını fark etmek.
:::

:::ipucu
Dört ilkeyi tek cümleyle hatırla: **özdeşlik** (A, A'dır), **çelişmezlik** (A, aynı anda hem A hem A değil olamaz), **üçüncü hâlin imkânsızlığı** (ya A ya A değil, üçüncüsü yoktur), **yeter sebep** (hiçbir şey sebepsiz değildir). Soruda "ya da" ve "üçüncü bir durum yoktur" geçiyorsa üçüncü hâlin imkânsızlığına bak.
:::

::video{id="asU1LnK_Sdg" etiket="Konu anlatımı videosu" baslik="Mantığa Giriş" kanal="Benim Hocam"}

## 1. Mantık nedir

**Mantık**, düşüncenin doğru biçimini ve doğru düşünmenin kurallarını inceleyen bilimdir. Mantık, düşüncenin **içeriğiyle** değil **biçimiyle** ilgilenir. Yani bir yargının gerçekten doğru olup olmadığı konusunda bilimler, o yargının tutarlı ve kurallara uygun biçimde ifade edilip edilmediği konusunda mantık söz sahibidir.

- **Konusu:** Düşünce ve düşünmenin biçimsel kuralları (kavram, önerme, çıkarım).
- **Amacı:** Doğruyu yanlıştan ayırmak ve tutarlı düşünmeyi sağlamak.
- **Yöntemi:** Çözümleme ve tümdengelim. Önermeler arasındaki ilişkileri biçimsel olarak inceler.
- **Mantık ve felsefe:** Mantık felsefenin bir dalı olarak doğdu. Matematikle birlikte gelişen sembolik mantık ise bugün bilgisayar bilimlerinin de temelidir.

## 2. Mantığın gelişimi

Mantığı sistemli bir bilim hâline getiren **Aristoteles**'tir (MÖ 4. yüzyıl). Mantık eserleri **Organon** adıyla toplanır ve kıyas kuramını içerir. Aristoteles'e **klasik mantığın kurucusu** denir. **Stoacılar** önermeler mantığının ilk biçimlerini geliştirdi. **Farabi** ve **İbn Sina** İslam dünyasında mantığı şerh edip geliştirdi. Orta Çağ'da skolastik düşünürler mantığı üniversite eğitiminin temeline koydu. **Bacon** tümevarım yöntemini öne çıkardı. **Leibniz** yeter sebep ilkesini ortaya koydu. 19. yüzyılda **Boole** ve **Frege** mantığı simgelerle ifade ederek **sembolik (matematiksel) mantığın** temelini attı. **Russell** ve **Gödel** bu gelenekte önemli adımlar attı.

::sim{tur="mantiktarihi"}

## 3. Temel düşünme ilkeleri

Bu ilkeler, tutarlı düşünmenin vazgeçilmez koşullarıdır.

- **Özdeşlik ilkesi:** Her şey kendisiyle özdeştir. A, A'dır. Bir kavram aynı akıl yürütme içinde aynı anlamda kullanılmalıdır.
- **Çelişmezlik (tutarlılık) ilkesi:** Bir şey aynı anda ve aynı bakımdan hem A hem de A değil olamaz. "Bu masa hem yuvarlak hem yuvarlak değil" diyemezsin.
- **Üçüncü hâlin imkânsızlığı ilkesi:** Bir şey ya A'dır ya A değildir, üçüncü bir ihtimal yoktur. "Bu sayı ya çifttir ya da tektir."
- **Yeter sebep ilkesi:** Hiçbir şey sebepsiz değildir. Bir yargının doğru olması için yeterli bir gerekçesi olmalıdır. Leibniz'e aittir.

## 4. Doğruluk, tutarlılık ve geçerlilik

- **Doğruluk:** Bir önermenin gerçeklikle uyuşmasıdır. "Ankara, Türkiye'nin başkentidir" önermesi doğrudur.
- **Tutarlılık:** Bir yargılar kümesinde birbiriyle çelişen yargıların bulunmamasıdır.
- **Geçerlilik:** Bir çıkarımda sonucun öncüllerden **zorunlu olarak** çıkmasıdır. Geçerlilik biçimle ilgilidir, içeriğin doğru olması şart değildir.

Örnek: "Bütün kuşlar uçar. Penguen kuştur. O hâlde penguen uçar." Çıkarım **geçerlidir**, çünkü sonuç öncüllerden zorunlu çıkar. Ancak birinci öncül yanlış olduğu için sonuç **doğru değildir.**

## 5. Mantığın yararları

- Tutarlı ve sistemli düşünme becerisi kazandırır.
- Argümanları ve iddiaları değerlendirmeyi öğretir.
- Hatalı akıl yürütmeyi (safsataları) fark ettirir.
- Bilimsel düşüncenin ve matematiğin temelidir.
- Bilgisayar programlama ve yapay zekânın dayandığı sembolik mantığın kaynağıdır.

## 6. Sık yapılan hatalar

- Mantığı bir yargının doğruluğunu belirleyen bilim sanmak. Mantık biçimle ilgilenir.
- Geçerli ile doğruyu karıştırmak. Geçerli bir çıkarımın sonucu yanlış olabilir.
- Çelişmezlik ile üçüncü hâlin imkânsızlığını karıştırmak. Çelişmezlik aynı anda ikisi birden olmayı, üçüncü hâl ise ikisinin dışında seçenek olmamasını söyler.
- Yeter sebep ilkesini Aristoteles'e bağlamak. Leibniz'e aittir.
- Mantığın yalnızca felsefeyle ilgili olduğunu sanmak. Matematik ve bilgisayarda da kullanılır.

:::baglanti
Bu konu, TYT'deki **Bilgi Felsefesi** (doğru bilgi ve doğruluk ölçütleri) konusunun düşünme kuralları yönüdür. **Klasik Mantık**, **Mantık ve Dil** ve **Sembolik Mantık** konuları bu temelin üzerine kurulur. **Matematik** dersindeki ispat ve önermeler, **Edebiyat** dersindeki anlatım ve çıkarım becerileri mantıkla doğrudan ilişkilidir. **Tarih** dersinde Eski Yunan ve İslam dünyasındaki bilim gelişimi bu başlıkla bağlantılıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Mantığın konusu | Doğru düşünmenin kuralları |
| Klasik mantığın kurucusu | Aristoteles (Organon) |
| Özdeşlik | A, A'dır |
| Çelişmezlik | Aynı anda hem A hem A değil olamaz |
| Üçüncü hâl | Ya A ya A değil |
| Yeter sebep | Leibniz |
| Geçerlilik | Sonuç öncüllerden zorunlu çıkar |

## Mini test

:::soru{cevap="B"}
"Bir şey aynı anda ve aynı bakımdan hem A hem de A değil olamaz." ifadesi mantığın hangi ilkesini dile getirir?

- A) Özdeşlik ilkesi
- B) Çelişmezlik ilkesi
- C) Yeter sebep ilkesi
- D) Üçüncü hâlin imkânsızlığı
- E) Tümdengelim ilkesi

---

1. Bir şeyin aynı anda hem kendisi hem de kendisinin olumsuzu olamayacağını söyleyen ilke çelişmezlik ilkesidir.
2. Özdeşlik her şeyin kendisiyle aynı olduğunu söyler. Doğru cevap B.

Diğer şıklar: **A** A, A'dır / **C** her şeyin bir sebebi vardır / **D** ya A ya A değil / **E** bir ilke değil, çıkarım yöntemi.
:::

:::soru{cevap="E"}
Mantığın konusu aşağıdakilerden hangisidir?

- A) Doğa olaylarının yasaları
- B) Toplumsal yapının işleyişi
- C) İnsan davranışlarının nedenleri
- D) Duyguların ortaya çıkışı
- E) Doğru düşünmenin kuralları

---

1. Mantık düşüncenin biçimsel kurallarını, yani doğru düşünmenin kurallarını inceler.
2. Doğa fizik ve biyolojinin, toplum sosyolojinin, davranış psikolojinin konusudur. Doğru cevap E.

Diğer şıklar: **A** doğa bilimleri / **B** sosyoloji / **C, D** psikoloji.
:::

:::soru{cevap="E"}
Mantığı sistemli bir bilim hâline getiren ve kıyas kuramını kuran düşünür aşağıdakilerden hangisidir?

- A) Platon
- B) Sokrates
- C) Bacon
- D) Descartes
- E) Aristoteles

---

1. Aristoteles mantık eserlerini Organon adıyla topladı ve kıyas kuramını geliştirdi.
2. Bu yüzden klasik mantığın kurucusu sayılır. Doğru cevap E.

Diğer şıklar: **A** idealar kuramı / **B** diyalog yöntemi / **C** tümevarım / **D** yöntemli kuşku.
:::

:::soru{cevap="B"}
"Bir sayı ya çifttir ya da tektir, üçüncü bir durum yoktur." yargısı mantığın hangi ilkesine dayanır?

- A) Özdeşlik ilkesi
- B) Üçüncü hâlin imkânsızlığı
- C) Yeter sebep ilkesi
- D) Çelişmezlik ilkesi
- E) Tümdengelim yöntemi

---

1. İki seçenek dışında bir seçeneğin bulunmadığını söyleyen ilke üçüncü hâlin imkânsızlığıdır.
2. Doğru cevap B.

Diğer şıklar: **A** her şey kendisidir / **C** her şeyin sebebi vardır / **D** aynı anda ikisi birden olamaz / **E** bir ilke değil.
:::

## Kendini dene

:::dene
1. Mantığı sistemli hâle getiren düşünür kimdir? => Aristoteles.
2. Yeter sebep ilkesi kime aittir? => Leibniz.
3. "A, A'dır" ifadesi hangi ilkedir? => Özdeşlik ilkesi.
4. Sonucun öncüllerden zorunlu çıkmasına ne denir? => Geçerlilik.
5. Mantık düşüncenin neyiyle ilgilenir? => Biçimiyle.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'Mantığa Giriş'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Mantık, düşüncenin üç temel öğesini inceler: **kavram**, **önerme** ve **çıkarım**. "İnsan", "Bütün insanlar ölümlüdür", "Sokrates insandır, o hâlde ölümlüdür" bunların sırasıyla örnekleridir. Bu konuda **kavramı** (içlem ve kaplam), **tanımı**, **önermeyi** (nitelik ve nicelik), **çıkarımı** (kıyas, tümevarım) ve **kıyasın temel kurallarını** öğreneceksin.

:::hedefler
1. Kavramın içlem ve kaplamını ayırt etmek.
2. Bir tanımda yakın cins ve ayrımı bulmak.
3. Önermeleri nitelik ve niceliğe göre sınıflandırmak.
4. Kıyasın öncül, sonuç ve orta terim öğelerini göstermek.
5. Tümdengelim ve tümevarım arasındaki farkı yorumlamak.
:::

:::ipucu
Önermeyi iki soruyla sınıflandır: **Kaç tane?** (bütün $\rightarrow$ tümel, bazı $\rightarrow$ tikel) ve **Olumlu mu olumsuz mu?** Dört hâl çıkar: tümel olumlu (A), tümel olumsuz (E), tikel olumlu (I), tikel olumsuz (O). Kavramda içlem ile kaplam **ters orantılıdır**.
:::

::video{id="j8vS-d5JbBw" etiket="Konu anlatımı videosu" baslik="Klasik Mantık" kanal="Benim Hocam"}

## 1. Kavram

**Kavram**, nesnelerin ortak özelliklerini zihnimizde temsil eden genel düşüncedir. "Ağaç", "öğrenci", "adalet" birer kavramdır.

- **İçlem:** Kavramın taşıdığı ortak özelliklerin tümü. "Üçgen" kavramının içlemi: Üç kenarlı, üç açılı, kapalı bir şekil olmasıdır.
- **Kaplam:** Kavramın kapsadığı bütün varlıklar kümesi. "Üçgen" kavramının kaplamı: Dik üçgen, eşkenar üçgen ve bütün üçgenlerdir.
- **İçlem ile kaplam ters orantılıdır.** Bir kavramın içlemi arttıkça (özellik eklendikçe) kaplamı azalır. "Canlı" kavramının kaplamı geniş, "kedi" kavramının kaplamı dardır. "Kedi" kavramının içlemi ise daha zengindir.

**Tümel, tikel ve tekil kavramlar:** "İnsan" tümel kavramdır. "Bu masa" tekil kavramdır.

## 2. Tanım

Bir kavramın ne olduğunu açıklayan ifadeye **tanım** denir. Klasik mantıkta tanım iki öğeden oluşur.

- **Yakın cins:** Kavramın bağlı olduğu en yakın genel sınıf.
- **Ayrım (ayırıcı özellik):** Kavramı aynı sınıftaki diğerlerinden ayıran özellik.

Örnek: "İnsan, **akıllı** (ayrım) **hayvandır** (yakın cins)." Tanım dairesel olmamalı, kavramdan geniş ya da dar olmamalı, olumsuz ifade içermemelidir.

## 3. Önerme

**Önerme**, doğru ya da yanlış olabilen yargı bildiren cümledir. "Her soru, emir ve ünlem cümlesi önerme değildir."

Önermeler **niteliğine** (olumlu, olumsuz) ve **niceliğine** (tümel, tikel) göre dört türe ayrılır.

- **Tümel olumlu (A):** Bütün S, P'dir. "Bütün insanlar ölümlüdür."
- **Tümel olumsuz (E):** Hiçbir S, P değildir. "Hiçbir balık memeli değildir."
- **Tikel olumlu (I):** Bazı S, P'dir. "Bazı öğrenciler çalışkandır."
- **Tikel olumsuz (O):** Bazı S, P değildir. "Bazı kuşlar uçamaz."

**Önermelerin karşıtlığı:** Tümel olumlu ile tikel olumsuz **çelişik**, tümel olumsuz ile tikel olumlu da çelişiktir. Çelişik iki önermeden biri doğruysa diğeri yanlıştır.

## 4. Çıkarım

Bilinen önermelerden (öncüllerden) yeni bir önerme (sonuç) elde etme işlemine **çıkarım** denir.

**Tümdengelim (dedüksiyon):** Genelden özele gider. Sonuç öncüllerden zorunlu çıkar.
- Örnek: Bütün insanlar ölümlüdür. Sokrates insandır. O hâlde Sokrates ölümlüdür.

**Tümevarım (indüksiyon):** Özelden genele gider. Sonuç olasıdır.
- Örnek: Bu metal ısınınca genleşti. Şu metal de genleşti. O hâlde bütün metaller ısınınca genleşir.
- **Tam tümevarım:** Bütün örnekler incelenir, kesin sonuç verir. **Eksik tümevarım:** Bazı örnekler incelenir, sonuç olasıdır. Bilimsel yöntemde kullanılır.

**Analoji (benzetme):** Özelden özele gider. İki şeyin bazı özelliklerde benzer olmasından başka özelliklerde de benzer olacağı sonucuna varılır.

## 5. Kıyas

**Kıyas (tasım)**, iki öncül ve bir sonuçtan oluşan tümdengelim çıkarımıdır. Üç terim vardır.

- **Küçük terim:** Sonucun öznesi. **Büyük terim:** Sonucun yüklemi. **Orta terim:** İki öncülde bulunur, sonuçta bulunmaz ve öncülleri birbirine bağlar.
- Örnek: Bütün canlılar ölümlüdür (büyük öncül). Kediler canlıdır (küçük öncül). O hâlde kediler ölümlüdür (sonuç). Orta terim: "canlı".

**Temel kıyas kuralları:**
- Kıyasta yalnızca üç terim bulunur.
- Orta terim sonuçta yer almaz.
- İki olumsuz öncülden sonuç çıkmaz.
- İki tikel öncülden sonuç çıkmaz.
- Öncüllerden biri olumsuzsa sonuç olumsuz, biri tikelse sonuç tikel olur.

## 6. Sık yapılan hatalar

- İçlem ile kaplamı karıştırmak. İçlem özellik, kaplam varlık kümesidir.
- Tikel önerme "bazı" ile başlar ve "yalnızca bazı" anlamına gelmez. Bazı, en az biri demektir.
- Tümevarımın sonucunu kesin sanmak. Eksik tümevarım olasılık verir.
- Orta terimi sonuçta aramak. Orta terim yalnızca öncüllerde bulunur.
- Her cümleyi önerme saymak. Soru ve emir cümleleri önerme değildir.

:::baglanti
Bu konu, **Mantığa Giriş** konusundaki ilkelerin uygulamasıdır. **Mantık ve Dil** konusunda önerme ile cümle ayrımı ve mantık hataları işlenir. **Sembolik Mantık** konusu aynı önermeleri simgelerle ifade eder. **Matematik** dersindeki kümeler (kaplam) ve ispat yöntemleri (tümdengelim), **Biyoloji** dersindeki sınıflandırma (cins ve tür) bu konuyla ilişkilidir.
:::

## 7. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| İçlem | Ortak özellikler |
| Kaplam | Kapsadığı varlıklar |
| İçlem ve kaplam | Ters orantılı |
| Tanım | Yakın cins ve ayrım |
| A, E, I, O | Tümel olumlu, tümel olumsuz, tikel olumlu, tikel olumsuz |
| Tümdengelim | Genelden özele, kesin |
| Tümevarım | Özelden genele, olası |

## Mini test

:::soru{cevap="E"}
Bir kavramın içlemi arttıkça kaplamı için aşağıdakilerden hangisi söylenebilir?

- A) Artar
- B) Değişmez
- C) Önce artar, sonra azalır
- D) Önce azalır, sonra artar
- E) Azalır

---

1. İçlem ile kaplam ters orantılıdır. Kavrama özellik eklendikçe kapsadığı varlık sayısı azalır.
2. Örneğin "kedi" kavramının içlemi "hayvan"dan zengindir, kaplamı ise daha dardır. Doğru cevap E.

Diğer şıklar: **A** doğru orantı olurdu / **B** değişimi yok sayar / **C, D** böyle bir değişim yoktur.
:::

:::soru{cevap="E"}
"Bütün insanlar ölümlüdür. Sokrates insandır. O hâlde Sokrates ölümlüdür." çıkarımı aşağıdakilerden hangisine örnektir?

- A) Tam tümevarım
- B) Eksik tümevarım
- C) Analoji
- D) Doğrudan çıkarım
- E) Kıyas (tümdengelim)

---

1. Genel bir önermeden başlayıp özel bir sonuca ulaşılmış ve iki öncül kullanılmıştır.
2. Bu yapı kıyastır. Doğru cevap E.

Diğer şıklar: **A, B** özelden genele / **C** özelden özele / **D** tek öncülle yapılır.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi tikel olumsuz bir önermedir?

- A) Bütün insanlar ölümlüdür.
- B) Hiçbir balık memeli değildir.
- C) Bazı öğrenciler çalışkandır.
- D) Bazı kuşlar uçamaz.
- E) Her çiçek kokuludur.

---

1. Tikel olumsuz önerme "Bazı S, P değildir" biçimindedir.
2. "Bazı kuşlar uçamaz" bu kalıba uyar. Doğru cevap D.

Diğer şıklar: **A, E** tümel olumlu / **B** tümel olumsuz / **C** tikel olumlu.
:::

:::soru{cevap="C"}
"İnsan, akıllı hayvandır." tanımında "akıllı" sözcüğü aşağıdakilerden hangisini ifade eder?

- A) Yakın cins
- B) Uzak cins
- C) Ayrım
- D) Tümel önerme
- E) Kıyas

---

1. Tanım yakın cins ve ayrımdan oluşur. "Hayvan" yakın cinstir.
2. "Akıllı" ise insanı diğer hayvanlardan ayıran özelliktir, yani ayrımdır. Doğru cevap C.

Diğer şıklar: **A** hayvan / **B** daha genel sınıf / **D, E** başka kavramlar.
:::

## Kendini dene

:::dene
1. Kavramın taşıdığı ortak özelliklere ne denir? => İçlem.
2. Kavramın kapsadığı varlıklara ne denir? => Kaplam.
3. "Bazı S, P'dir" önermesi hangi türdür? => Tikel olumlu (I).
4. Özelden genele giden çıkarım nedir? => Tümevarım.
5. Kıyasta sonuçta bulunmayan terim hangisidir? => Orta terim.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Klasik Mantık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Düşüncelerimizi başkalarına dil aracılığıyla aktarırız. Peki her cümle bir önerme midir? "Kapıyı kapat" cümlesi doğru ya da yanlış olabilir mi? Dil mantıksız kullanıldığında ne olur? Bu konuda **dil ile düşünce ilişkisini**, **önerme ile cümle farkını**, **dilin işlevlerini**, **anlam belirsizliklerini**, **argüman kavramını** ve **sık görülen mantık hatalarını** (safsataları) öğreneceksin.

:::hedefler
1. Önerme ile cümle arasındaki farkı açıklamak.
2. Dilin bildirme, duygu ve etkileme işlevlerini ayırt etmek.
3. Anlam belirsizliği (çok anlamlılık) ve eş seslilik hatalarını yorumlamak.
4. Argümanda öncül ve sonucu belirlemek.
5. Sık görülen mantık hatalarını (kişiye saldırı, otoriteye başvuru, kısır döngü, yanlış ikilem) tanımak.
:::

:::ipucu
Bir cümlenin önerme olup olmadığını anlamak için **"Doğru mu yanlış mı?"** diye sor. Cevap verilebiliyorsa önermedir. Soru, emir, dilek ve ünlem cümleleri doğru ya da yanlış olarak değerlendirilemez. Mantık hatalarında ise **gerekçenin konuyla ilgili olup olmadığına** bak.
:::

::video{id="_snzZH3xtfk" etiket="Konu anlatımı videosu" baslik="Mantık ve Dil" kanal="Benim Hocam"}

## 1. Dil ve düşünce

Düşünce, dil aracılığıyla ifade edilir. Dil olmadan düşüncenin sistemli biçimde paylaşılması zordur. Kavramlar sözcüklerle, önermeler cümlelerle ifade edilir. Ancak **dil ile mantık aynı şey değildir.** Mantık düşüncenin biçimini, dil ise o düşüncenin ifade aracıdır.

- Aynı önerme farklı cümlelerle ifade edilebilir. "Ali Ayşe'yi gördü." ve "Ayşe, Ali tarafından görüldü." aynı önermeyi taşır.
- Aynı cümle farklı bağlamlarda farklı anlamlar taşıyabilir.

## 2. Önerme ve cümle

- **Önerme:** Doğru ya da yanlış olabilen yargı bildiren ifadedir.
- **Cümle:** Bir düşünceyi, duyguyu ya da isteği bildiren sözcük dizisidir.

**Her önerme bir cümledir, ancak her cümle önerme değildir.**

- "Ankara Türkiye'nin başkentidir." $\rightarrow$ önerme (doğru).
- "İstanbul Türkiye'nin başkentidir." $\rightarrow$ önerme (yanlış).
- "Kapıyı kapatır mısın?" $\rightarrow$ soru cümlesi, önerme değil.
- "Lütfen sessiz olun." $\rightarrow$ emir cümlesi, önerme değil.
- "Ne güzel bir gün!" $\rightarrow$ ünlem cümlesi, önerme değil.

## 3. Dilin işlevleri

- **Bildirme (bilgi verme):** Bir durumu ya da olguyu aktarır. "Su, 100 derecede kaynar." Doğru ya da yanlış değeri taşır.
- **Duygu belirtme:** Duyguları dile getirir. "Çok mutluyum!"
- **Etkileme (emir):** Karşıdakini bir şey yapmaya yöneltir. "Pencereyi aç."
- **Sorma:** Bilgi almak için kullanılır.

Mantık, esas olarak **bildirme işlevi** taşıyan ifadelerle, yani önermelerle ilgilenir.

## 4. Anlam belirsizlikleri

Dil her zaman kesin olmayabilir. Sözcüklerin birden çok anlamı olabilir. Bu durum akıl yürütmede hataya yol açar.

- **Eş sesli kullanım:** "Yüz" sözcüğü sayı, surat ya da yüzmek anlamına gelir.
- **Çok anlamlılık:** Aynı sözcüğün farklı bağlamlarda farklı anlamlar taşıması. "Dil" hem konuşma organı hem de iletişim sistemidir.
- **Anlam kayması:** Akıl yürütme sırasında bir kavramın anlamının değişmesi. Örnek: "Işık hafiftir. Hafif olan karanlık değildir. O hâlde ışık karanlık değildir." Burada "hafif" kelimesi farklı anlamlarda kullanılmıştır.
- **Belirsiz kavramlar:** "Genç", "zengin", "yüksek" gibi kavramların sınırı nettir.

Doğru akıl yürütme için kavramlar **aynı anlamda** kullanılmalıdır (özdeşlik ilkesi).

## 5. Argüman

**Argüman**, bir iddiayı (sonucu) destekleyen önermeler (öncüller) bütünüdür. İyi bir argüman:

- **Öncüller doğru** olmalıdır.
- **Sonuç öncüllerden mantıksal olarak çıkmalıdır** (geçerlilik).
- Kavramlar **tutarlı** kullanılmalıdır.

Hem öncülleri doğru hem de geçerli olan argümana **sağlam argüman** denir.

## 6. Mantık hataları (safsatalar)

- **Kişiye saldırı (ad hominem):** Bir görüşü, görüşü savunanın kişisel özelliklerine saldırarak çürütmeye çalışmak. "Bu öneri yanlıştır, çünkü onu söyleyen kişi güvenilmezdir."
- **Otoriteye başvurma:** Bir şeyin doğruluğunu, uzman olmayan bir ünlü ya da otorite kişinin söylemesiyle temellendirmek.
- **Halka başvurma:** Bir şeyin doğru olduğunu çoğunluğun kabul etmesine bağlamak. "Herkes böyle düşünüyor, o hâlde doğrudur."
- **Kısır döngü:** Kanıtlanması gereken şeyi öncül olarak kullanmak. "Bu kitap doğrudur, çünkü içinde doğruları yazar."
- **Yanlış ikilem:** Birden fazla seçenek varken yalnızca iki seçenekmiş gibi sunmak. "Ya bizdensin ya da düşmanımızsın."
- **Aceleci genelleme:** Birkaç örnekten genel bir sonuç çıkarmak.
- **Yanlış neden gösterme:** Birbirini izleyen iki olayı neden ve sonuç sanmak.

## 7. Sık yapılan hatalar

- Her cümlenin önerme olduğunu sanmak. Soru, emir ve ünlem cümleleri önerme değildir.
- Önerme ile cümleyi aynı sanmak. Aynı önerme farklı cümlelerle ifade edilebilir.
- Kişiye saldırıyı gerçek eleştiri sanmak. Savunanı değil, görüşü değerlendirmek gerekir.
- Halka başvurmayı kanıt saymak. Çoğunluğun kabulü doğruluk ölçütü değildir.
- Anlam kaymasını fark etmemek.

:::baglanti
Bu konu, **Klasik Mantık** konusundaki önerme ve çıkarım bilgisinin dil boyutudur. **Sembolik Mantık** konusu dili belirsizlikten arındırmak için simgelere başvurur. **Bilgi Felsefesi** (TYT) konusundaki doğruluk ölçütleri bu tartışmayla ilişkilidir. **Türkçe** ve **Edebiyat** dersindeki anlam bilgisi, söz sanatları ve çok anlamlılık, dilin mantıkla ilişkisini tamamlar.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Önerme | Doğru ya da yanlış olabilir |
| Soru, emir, ünlem | Önerme değildir |
| Bildirme işlevi | Önermeler bu işlevdedir |
| Kısır döngü | Kanıtlanacak şeyi öncül yapmak |
| Kişiye saldırı | Görüşü değil kişiyi hedeflemek |
| Yanlış ikilem | İki seçeneğe indirgemek |

## Mini test

:::soru{cevap="C"}
Aşağıdaki cümlelerden hangisi bir önermedir?

- A) Yarın akşam bize gelir misiniz?
- B) Bu manzara ne kadar güzel!
- C) Ankara Türkiye'nin başkentidir.
- D) Lütfen kapıyı kapatır mısınız?
- E) Derslerinize düzenli çalışın.

---

1. Önerme, doğru ya da yanlış olabilen yargı bildiren cümledir.
2. "Ankara Türkiye'nin başkentidir" doğru bir önermedir. Doğru cevap C.

Diğer şıklar: **A** soru / **B** ünlem / **D** soru ve istek / **E** emir.
:::

:::soru{cevap="B"}
Bir görüşü, görüşü savunan kişinin kişisel özelliklerine saldırarak çürütmeye çalışmak aşağıdaki mantık hatalarından hangisine örnektir?

- A) Kısır döngü hatası
- B) Kişiye saldırı hatası
- C) Otoriteye başvurma hatası
- D) Halka başvurma hatası
- E) Aceleci genelleme hatası

---

1. Görüşü değil, görüşü savunan kişiyi hedef almak kişiye saldırı (ad hominem) hatasıdır.
2. Bir görüşün doğruluğu savunanın kişiliğine bağlı değildir. Doğru cevap B.

Diğer şıklar: **A** kanıtlanacak şeyi öncül yapmak / **C** uzman olmayan otoriteye dayanmak / **D** çoğunluğa dayanmak / **E** birkaç örnekten genel sonuç.
:::

:::soru{cevap="C"}
Aşağıdakilerden hangisi dilin bilgi verme (bildirme) işlevine örnektir?

- A) Pencereyi lütfen aç.
- B) Ne kadar güzel bir şarkı!
- C) Su, 100 derecede kaynar.
- D) Yarın okula gelir misin?
- E) Keşke daha çok çalışsaydım.

---

1. Bilgi verme işlevi taşıyan ifadeler doğru ya da yanlış olabilen yargılar bildirir.
2. Suyun kaynama noktası ölçülebilen bir olgudur. Doğru cevap C.

Diğer şıklar: **A** emir (etkileme) / **B** duygu / **D** soru / **E** dilek ve duygu.
:::

:::soru{cevap="B"}
"Ya bizim projemizi destekleyeceksin ya da sınıfın düşmanısın." ifadesinde aşağıdaki mantık hatalarından hangisi vardır?

- A) Kısır döngü
- B) Yanlış ikilem
- C) Otoriteye başvurma
- D) Halka başvurma
- E) Anlam kayması

---

1. İki seçenek dışında başka tutumlar da mümkünken yalnızca iki seçenek varmış gibi sunulmuştur.
2. Bu yanlış ikilemdir. Doğru cevap B.

Diğer şıklar: **A** kanıt yerine aynı şeyi tekrarlamak / **C** otorite kişi / **D** çoğunluk / **E** sözcük anlamının değişmesi.
:::

## Kendini dene

:::dene
1. Önerme hangi cümlelerdir? => Doğru ya da yanlış olabilen yargı bildiren cümleler.
2. Soru cümlesi önerme midir? => Hayır, doğru ya da yanlış olarak değerlendirilemez.
3. Kanıtlanacak şeyi öncül olarak kullanmaya ne denir? => Kısır döngü.
4. Çoğunluğun kabulüne dayanan mantık hatasının adı nedir? => Halka başvurma.
5. İyi bir argümanın iki özelliği nedir? => Öncüllerin doğru olması ve sonucun öncüllerden çıkması.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-fel' and name = 'Mantık ve Dil'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Günlük dil belirsiz olabilir. "Ya da" bazen "yalnızca biri", bazen "en az biri" anlamına gelir. Bu belirsizliği ortadan kaldırmak için önermeleri **simgelerle** yazar ve **doğruluk tablolarıyla** inceleriz. Bu konuda **önermeleri ve bileşik önermeleri** (değil, ve, veya, ya da, ise, ancak ve ancak), **doğruluk tablolarını**, **totoloji ve çelişkiyi**, **De Morgan kurallarını** ve **koşullu önermenin eşdeğerlerini** öğreneceksin.

:::hedefler
1. Önermeleri simgelerle (p, q, r) göstermek.
2. Bağlaçların doğruluk tablosunu kurmak.
3. Bileşik önermelerin doğruluk değerini bulmak.
4. Totoloji ve çelişkiyi ayırt etmek.
5. De Morgan kurallarını ve koşullu önermenin eşdeğerini uygulamak.
:::

:::ipucu
Bağlaçları **hangi durumda doğru** olduklarıyla hatırla: **ve** yalnızca ikisi de doğruysa, **veya** en az biri doğruysa, **ya da** yalnızca biri doğruysa, **ise** yalnızca $1 \Rightarrow 0$ olduğunda yanlış, **ancak ve ancak** iki değer aynıysa doğrudur. Aşağıdaki simülasyonda her bağlacın tablosunu dene.
:::

::video{id="x0IqL55AiUY" etiket="Konu anlatımı videosu" baslik="Sembolik Mantık" kanal="Benim Hocam"}

## 1. Önerme ve doğruluk değeri

Doğru ya da yanlış olabilen yargılara **önerme** denir ve $p$, $q$, $r$ gibi harflerle gösterilir. Doğru önermenin doğruluk değeri **1**, yanlış önermenin doğruluk değeri **0**'dır.

- $p$: "Ankara Türkiye'nin başkentidir." $\rightarrow$ 1.
- $q$: "Dünya düzdür." $\rightarrow$ 0.

**Olumsuzluk (değil):** $p$ önermesinin değili $p'$ ile gösterilir. $p$ doğruysa $p'$ yanlış, $p$ yanlışsa $p'$ doğrudur.

## 2. Bileşik önermeler ve bağlaçlar

İki ya da daha çok önermenin bağlaçlarla birleşmesiyle **bileşik önerme** oluşur.

- **Ve ($\wedge$):** $p \wedge q$ yalnızca iki önerme de doğruysa doğrudur.
- **Veya ($\vee$):** $p \vee q$ en az biri doğruysa doğrudur. İkisi de yanlışsa yanlıştır.
- **Ya da ($\veebar$):** $p \veebar q$ yalnızca biri doğruysa doğrudur. İkisi aynı değerdeyse yanlıştır.
- **İse ($\Rightarrow$):** $p \Rightarrow q$ yalnızca $p$ doğru, $q$ yanlış olduğunda yanlıştır. Diğer her durumda doğrudur.
- **Ancak ve ancak ($\Leftrightarrow$):** $p \Leftrightarrow q$ iki önerme aynı doğruluk değerindeyse doğrudur.

::sim{tur="mantik"}

## 3. Doğruluk tabloları

| $p$ | $q$ | $p \wedge q$ | $p \vee q$ | $p \veebar q$ | $p \Rightarrow q$ | $p \Leftrightarrow q$ |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 1 | 1 | 1 | 0 | 1 | 1 |
| 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 0 | 1 | 0 | 1 | 1 | 1 | 0 |
| 0 | 0 | 0 | 0 | 0 | 1 | 1 |

Bileşik önermede önce parantez içi, sonra olumsuzluk, sonra diğer bağlaçlar işlenir. Satır sayısı $2^n$'dir ($n$ önerme sayısı).

## 4. Totoloji, çelişki ve eşdeğerlik

- **Totoloji (özdeşlik):** Bileşenlerinin doğruluk değerleri ne olursa olsun daima doğru olan bileşik önerme. Örnek: $p \vee p'$.
- **Çelişki:** Daima yanlış olan bileşik önerme. Örnek: $p \wedge p'$.
- **Eşdeğer önermeler ($\equiv$):** Doğruluk tabloları aynı olan önermeler.

## 5. De Morgan kuralları ve koşullu önerme

**De Morgan kuralları:**

- $(p \wedge q)' \equiv p' \vee q'$
- $(p \vee q)' \equiv p' \wedge q'$

Yani "ve"nin değili "veya", "veya"nın değili "ve" olur ve her iki önermenin değili alınır.

**Koşullu önermenin eşdeğeri:** $p \Rightarrow q \equiv p' \vee q$. Ayrıca bir koşullu önerme ile **karşıt tersi** aynı doğruluk değerine sahiptir: $p \Rightarrow q \equiv q' \Rightarrow p'$.

| Önerme | Gösterim |
| --- | --- |
| Koşullu | $p \Rightarrow q$ |
| Karşıt (ters) | $q \Rightarrow p$ |
| Karşıt tersi | $q' \Rightarrow p'$ |

Karşıt ters, asıl koşullu ile eşdeğerdir. Karşıt (ters) önerme asıl önermeyle eşdeğer değildir.

## 6. Sık yapılan hatalar

- "Veya" ile "ya da"yı karıştırmak. Veya ikisi birden doğruyken de doğrudur, ya da değildir.
- $p \Rightarrow q$ önermesini $p$ yanlışken yanlış sanmak. $p$ yanlışsa önerme daima doğrudur.
- De Morgan'da bağlacı değiştirmeyi unutmak.
- $p \Rightarrow q$ ile $q \Rightarrow p$'yi eşdeğer sanmak. Eşdeğeri $q' \Rightarrow p'$'dür.
- Totolojiyi doğru bir önerme ile karıştırmak. Totoloji her durumda doğrudur.

:::baglanti
Bu konu, **Klasik Mantık** konusundaki önermelerin simgelerle ifade edilmesidir. **Mantık ve Dil** konusundaki belirsizliklerin giderilmesi için sembolik mantığa başvurulur. **Matematik** dersindeki önermeler, ispat yöntemleri ve kümeler (kesişim ve birleşim bağlaçlarla ilişkilidir) doğrudan bağlantılıdır. **Fizik** dersindeki devre elemanları ve mantık kapıları da aynı mantığı kullanır.
:::

## 7. Konuyu toparla

| Bağlaç | Ne zaman doğru |
| --- | --- |
| $p \wedge q$ | İkisi de doğruysa |
| $p \vee q$ | En az biri doğruysa |
| $p \veebar q$ | Yalnızca biri doğruysa |
| $p \Rightarrow q$ | $1 \Rightarrow 0$ dışında |
| $p \Leftrightarrow q$ | İkisi aynıysa |
| Totoloji | Her zaman doğru |
| Çelişki | Her zaman yanlış |

## Mini test

:::soru{cevap="D"}
$p$ önermesinin doğruluk değeri 1, $q$ önermesinin doğruluk değeri 0 olduğuna göre aşağıdaki bileşik önermelerden hangisinin doğruluk değeri 1'dir?

- A) $p \wedge q$
- B) $p \Rightarrow q$
- C) $p \Leftrightarrow q$
- D) $p \vee q$
- E) $p'$

---

1. $p = 1$ ve $q = 0$ için $p \wedge q = 0$, $p \Rightarrow q = 0$, $p \Leftrightarrow q = 0$ ve $p' = 0$ çıkar.
2. $p \vee q$ en az biri doğru olduğu için 1'dir. Doğru cevap D.

Diğer şıklar: **A** ikisi de doğru olmalı / **B** $1 \Rightarrow 0$ yanlıştır / **C** değerler farklı / **E** $p$'nin değili 0.
:::

:::soru{cevap="B"}
$p \Rightarrow q$ koşullu önermesinin doğruluk değerinin 0 olduğu durum aşağıdakilerden hangisidir?

- A) $p = 1$, $q = 1$
- B) $p = 1$, $q = 0$
- C) $p = 0$, $q = 1$
- D) $p = 0$, $q = 0$
- E) Doğruluk değerleri ne olursa olsun daima 0

---

1. Koşullu önerme yalnızca öncül doğru, sonuç yanlış olduğunda yanlıştır.
2. Bu durum $p = 1$ ve $q = 0$'dır. Doğru cevap B.

Diğer şıklar: **A, C, D** doğrudur / **E** koşullu önerme çelişki değildir.
:::

:::soru{cevap="A"}
$(p \wedge q)'$ önermesinin eşdeğeri aşağıdakilerden hangisidir?

- A) $p' \vee q'$
- B) $p' \wedge q'$
- C) $p \vee q$
- D) $p \wedge q'$
- E) $p \Rightarrow q'$

---

1. De Morgan kuralına göre "ve"nin değili, değillerin "veya"sıdır.
2. $(p \wedge q)' \equiv p' \vee q'$. Doğru cevap A.

Diğer şıklar: **B** bağlaç değişmemiş / **C, D, E** eşdeğer değil.
:::

:::soru{cevap="C"}
Aşağıdaki bileşik önermelerden hangisi bir totolojidir?

- A) $p \wedge p'$
- B) $p \wedge q$
- C) $p \vee p'$
- D) $p \Leftrightarrow p'$
- E) $p'$

---

1. Totoloji, her durumda doğru olan önermedir.
2. $p$ ne olursa olsun $p$ ya da $p'$ doğrudur, bu yüzden $p \vee p'$ totolojidir. Doğru cevap C.

Diğer şıklar: **A, D** çelişki / **B** değere bağlı / **E** değere bağlı.
:::

## Kendini dene

:::dene
1. "Ve" bağlacı hangi durumda doğrudur? => İki önerme de doğruysa.
2. $p \Rightarrow q$ hangi durumda yanlıştır? => $p = 1$ ve $q = 0$ iken.
3. Daima doğru olan bileşik önermeye ne denir? => Totoloji.
4. $(p \vee q)'$ neye eşdeğerdir? => $p' \wedge q'$.
5. Koşullu önermenin eşdeğeri olan karşıt tersi nedir? => $q' \Rightarrow p'$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'Sembolik Mantık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden bazı insanlar kaygılı, bazıları cesurdur? Öğrenme nasıl gerçekleşir? Davranışların arkasında ne var? **Psikoloji**, insan davranışını ve zihinsel süreçlerini **bilimsel yöntemlerle** inceleyen bilimdir. Bu konuda **psikolojinin tanımını ve amaçlarını**, **tarihsel gelişimini ve ekollerini**, **alt dallarını**, **araştırma yöntemlerini** ve **bilimsel yöntemin aşamalarını** öğreneceksin.

:::hedefler
1. Psikolojiyi tanımlamak ve amaçlarını söylemek.
2. Psikolojinin gelişiminde önemli isimleri ve ekolleri sıralamak.
3. Yapısalcılık, işlevselcilik, davranışçılık, psikanaliz, hümanistik ve bilişsel yaklaşımı karşılaştırmak.
4. Psikolojinin alt dallarını ayırt etmek.
5. Araştırma yöntemlerini (gözlem, deney, anket, görüşme, vaka çalışması) açıklamak.
:::

:::ipucu
Ekolleri **neye odaklandıklarıyla** hatırla: yapısalcılık (bilincin öğeleri), işlevselcilik (zihnin işlevi), **davranışçılık** (gözlenebilir davranış), **psikanaliz** (bilinçdışı), Gestalt (bütün), **hümanistik** (kendini gerçekleştirme), **bilişsel** (zihin bilgi işler). Yöntem sorularında **neden-sonuç ilişkisini ancak deneyin kurabildiğini** unutma.
:::

::video{id="k3xSTU9RlNU" etiket="Konu anlatımı videosu" baslik="Psikoloji Bilimini Tanıyalım" kanal="Benim Hocam"}

## 1. Psikoloji nedir

**Psikoloji**, davranışı ve zihinsel süreçleri bilimsel olarak inceleyen bilimdir. Sözcük Yunanca **psyche** (ruh) ve **logos** (bilim) kelimelerinden gelir.

**Amaçları:**
- **Betimleme:** Davranışı ve zihinsel süreci tanımlamak.
- **Açıklama:** Nedenlerini ortaya koymak.
- **Yordama:** Gelecekteki davranışı tahmin etmek.
- **Kontrol (değiştirme):** Davranışı etkilemek ve iyileştirmek.

## 2. Psikolojinin tarihçesi ve ekoller

- **Felsefe dönemi:** Psikoloji uzun süre felsefenin bir dalı olarak ele alındı.
- **1879:** **Wilhelm Wundt**, Leipzig'de ilk deneysel psikoloji laboratuvarını kurdu. Psikoloji bağımsız bir bilim oldu. Yapısalcılık: Bilincin öğelerini içebakışla inceledi.
- **İşlevselcilik:** **William James**. Zihnin canlının çevreye uyumundaki işlevi.
- **Psikanaliz:** **Sigmund Freud**. Bilinçdışı, rüyalar, çocukluk yaşantıları. Kişilik id, ego ve süperegodan oluşur.
- **Davranışçılık:** **Watson**, **Skinner**, **Pavlov**. Yalnızca gözlenebilir davranış incelenmelidir. Öğrenme koşullanmayla olur.
- **Gestalt (bütüncül) psikolojisi:** **Wertheimer, Köhler, Koffka**. Bütün, parçaların toplamından fazlasıdır.
- **Hümanistik psikoloji:** **Maslow, Rogers**. İnsanın iyi olma ve kendini gerçekleştirme eğilimi.
- **Bilişsel psikoloji:** Zihin bilgi işleyen sistemdir. Bellek, dikkat, düşünme.

::sim{tur="psikoloji"}

## 3. Psikolojinin alt dalları

- **Klinik psikoloji:** Ruhsal bozuklukların tanı ve tedavisi.
- **Gelişim psikolojisi:** Bebeklikten yaşlılığa yaşam boyu değişim ve gelişim.
- **Sosyal psikoloji:** Bireyin diğer insanlarla ve gruplarla etkileşimi, tutumlar, önyargılar.
- **Eğitim psikolojisi:** Öğrenme ve öğretme süreçleri.
- **Endüstri ve örgüt psikolojisi:** İş yaşamında çalışan davranışı, verimlilik.
- **Deneysel psikoloji:** Algı, öğrenme, bellek gibi temel süreçlerin laboratuvarda incelenmesi.
- **Adli psikoloji, spor psikolojisi, sağlık psikolojisi, nörobilim.**

## 4. Araştırma yöntemleri

- **Gözlem:** Davranışın doğal ortamında ya da kontrollü ortamda izlenmesi.
- **Deney:** Bir değişkeni (bağımsız) kontrollü biçimde değiştirip diğer değişken (bağımlı) üzerindeki etkisini inceleme. **Neden-sonuç ilişkisini kurabilen tek yöntemdir.** Deney grubu ve kontrol grubu kullanılır.
- **Anket:** Çok sayıda kişiye yazılı soru sorulması.
- **Görüşme (mülakat):** Yüz yüze ya da telefonla derinlemesine bilgi toplama.
- **Vaka (durum) çalışması:** Bir kişi ya da küçük grubun ayrıntılı incelenmesi.
- **Korelasyon çalışması:** İki değişken arasındaki ilişkiyi (yön ve güç) inceler. İlişki nedensellik anlamına gelmez.
- **Testler:** Zekâ ve kişilik testleri.

**Bilimsel yöntem:** Problemi belirleme, hipotez kurma, veri toplama, verileri çözümleme, sonuç ve yorum, sonuçları paylaşma.

## 5. Etik ilkeler

Psikolojik araştırmalarda **gönüllü katılım, bilgilendirilmiş onam, gizlilik, zarar vermeme** ve araştırma sonunda katılımcıların bilgilendirilmesi ilkeleri geçerlidir.

## 6. Sık yapılan hatalar

- Psikolojinin yalnızca ruhsal rahatsızlıkları incelediğini sanmak. Normal davranış ve gelişim de konusudur.
- Davranışçılığı bilinçdışına odaklanan ekol sanmak. Bilinçdışı psikanalizin konusudur.
- Korelasyonu nedensellik sanmak. İki değişkenin birlikte değişmesi biri diğerine neden olur demek değildir.
- Anketi neden-sonuç yöntemi sanmak. Neden-sonuç ilişkisi deneyle kurulur.
- Wundt'u psikanalizin kurucusu sanmak. Psikanalizin kurucusu Freud'dur.

:::baglanti
Bu konu, TYT'deki **Felsefeye Giriş** (felsefenin bilimlerle ilişkisi) ve **Bilgi Felsefesi** konularının sonrasında, felsefeden ayrılıp bilim olan psikolojiyi işler. **Psikolojinin Temel Süreçleri**, **Öğrenme, Bellek, Düşünme** ve **Ruh Sağlığının Temelleri** konuları bu çerçevenin ayrıntılarıdır. **Biyoloji** dersindeki sinir sistemi, **Sosyoloji** konularındaki birey ve toplum bu konuyla ilişkilidir. **Felsefe** dersinde zihin felsefesi aynı soruları farklı yöntemle ele alır.
:::

## 7. Konuyu toparla

| Ekol / isim | Odak |
| --- | --- |
| Wundt, 1879 | İlk laboratuvar |
| Freud | Bilinçdışı |
| Watson, Skinner | Gözlenebilir davranış |
| Gestalt | Bütün |
| Maslow, Rogers | Kendini gerçekleştirme |
| Deney | Neden-sonuç ilişkisi |
| Korelasyon | İlişki, nedensellik değil |

## Mini test

:::soru{cevap="A"}
Psikolojinin ilk deneysel laboratuvarı aşağıdakilerden hangisinde doğru verilmiştir?

- A) Wundt, Leipzig
- B) Freud, Viyana
- C) Watson, New York
- D) James, Boston
- E) Pavlov, Petersburg

---

1. Wilhelm Wundt 1879'da Leipzig'de ilk deneysel psikoloji laboratuvarını kurdu.
2. Bu tarih psikolojinin bağımsız bir bilim olarak doğuşu kabul edilir. Doğru cevap A.

Diğer şıklar: **B** psikanaliz / **C** davranışçılık / **D** işlevselcilik / **E** klasik koşullanma.
:::

:::soru{cevap="D"}
Psikolojinin yalnızca gözlenebilir ve ölçülebilir davranışları incelemesi gerektiğini savunan ekol aşağıdakilerden hangisidir?

- A) Yapısalcılık
- B) İşlevselcilik
- C) Psikanaliz
- D) Davranışçılık
- E) Gestalt psikolojisi

---

1. Davranışçılık, öznel olan zihni değil gözlenebilir davranışı inceler.
2. Watson ve Skinner bu ekolün önemli isimleridir. Doğru cevap D.

Diğer şıklar: **A** bilincin öğeleri / **B** zihnin işlevi / **C** bilinçdışı / **E** bütün algısı.
:::

:::soru{cevap="C"}
Bir araştırmacı, bağımsız değişkeni kontrollü biçimde değiştirerek bağımlı değişken üzerindeki etkisini incelemektedir. Bu araştırma hangi yöntemdir?

- A) Gözlem
- B) Anket
- C) Deney
- D) Görüşme
- E) Vaka çalışması

---

1. Bir değişkeni kontrollü değiştirip etkisini ölçmek deney yöntemidir.
2. Neden-sonuç ilişkisi ancak deneyle kurulabilir. Doğru cevap C.

Diğer şıklar: **A** izleme / **B** soru formu / **D** yüz yüze soru / **E** tek vaka incelemesi.
:::

:::soru{cevap="B"}
Bebeklikten yaşlılığa yaşam boyu değişim ve gelişimi inceleyen psikoloji dalı aşağıdakilerden hangisidir?

- A) Klinik psikoloji
- B) Gelişim psikolojisi
- C) Sosyal psikoloji
- D) Endüstri psikolojisi
- E) Deneysel psikoloji

---

1. Gelişim psikolojisi yaşam boyu bilişsel, duygusal ve sosyal değişimi inceler.
2. Doğru cevap B.

Diğer şıklar: **A** ruhsal bozukluklar / **C** insanlar arası etkileşim / **D** iş yaşamı / **E** laboratuvar araştırmaları.
:::

## Kendini dene

:::dene
1. Psikoloji hangi yıl bağımsız bir bilim oldu? => 1879 (Wundt'un laboratuvarı).
2. Psikanalizin kurucusu kimdir? => Freud.
3. Neden-sonuç ilişkisini kuran yöntem hangisidir? => Deney.
4. Maslow hangi ekolün temsilcisidir? => Hümanistik psikoloji.
5. Gestalt psikolojisinin temel görüşü nedir? => Bütün, parçaların toplamından fazladır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'Psikoloji Bilimini Tanıyalım'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir müziği duyduğumuzda ya da bir yüzü gördüğümüzde beynimizde neler olur? Uyurken neden rüya görürüz? Bizi harekete geçiren şey nedir? Bu konuda **duyum ve algıyı**, **algı ilkelerini** (Gestalt), **dikkati**, **bilinci ve uykuyu**, **güdüleri** (Maslow) ve **duyguları** öğreneceksin.

:::hedefler
1. Duyum ile algı arasındaki farkı açıklamak.
2. Gestalt algı ilkelerini örneklerle ayırt etmek.
3. Dikkatin türlerini ve işlevini söylemek.
4. Uyku evrelerini ve rüyayı açıklamak.
5. Güdü kavramını ve Maslow'un ihtiyaç basamaklarını sıralamak.
6. Duygunun bileşenlerini yorumlamak.
:::

:::ipucu
Süreci sıralamayı öğren: **uyarıcı $\rightarrow$ duyum (duyu organının ilk tepkisi) $\rightarrow$ algı (beynin anlamlandırması) $\rightarrow$ bellek ve düşünme.** Güdü sorularında Maslow'un basamaklarını aşağıdan yukarı say: **fizyolojik, güvenlik, ait olma, saygınlık, kendini gerçekleştirme.**
:::

::video{id="DbLUtRb0pdc" etiket="Konu anlatımı videosu" baslik="Psikolojinin Temel Süreçleri" kanal="Benim Hocam"}

## 1. Duyum ve algı

- **Duyum:** Duyu organlarının uyarıcıları alıp sinirsel sinyale çevirmesidir. Ham, anlamsız veri. Beş duyu: görme, işitme, koku, tat, dokunma.
- **Algı:** Duyumların beyinde **anlamlandırılması ve yorumlanmasıdır.** Geçmiş deneyim, beklenti ve dikkat algıyı etkiler.
- **Duyusal eşik:** Bir uyarıcının fark edilmesi için gereken en küçük şiddet (mutlak eşik).
- **Duyusal uyum:** Aynı uyarıcıya uzun süre maruz kalınca duyarlılığın azalması. Parfüm kokusunun bir süre sonra fark edilmemesi.

## 2. Algı ilkeleri (Gestalt)

Gestalt psikologları algının parçaların toplamı olmadığını, bütün olarak örgütlendiğini gösterdi.

- **Yakınlık:** Birbirine yakın nesneler bir grup olarak algılanır.
- **Benzerlik:** Benzer nesneler bir arada algılanır.
- **Süreklilik:** Kesintisiz akan çizgiler tercih edilir.
- **Tamamlama (kapalılık):** Eksik şekiller zihinde tamamlanır.
- **Şekil-zemin ayrımı:** Algıda bir nesne (şekil) arka plandan (zemin) ayrılır.
- **Algısal sabitlik:** Nesnelerin uzaklık ya da ışık değişse bile aynı boyut ve renkte algılanması.
- **Algısal yanılsama:** Müller-Lyer yanılsaması gibi, fiziksel gerçeklikle algının uyuşmaması.

## 3. Dikkat

Zihnin belirli bir uyarıcıya yönelmesi ve diğerlerini göz ardı etmesidir. Sınırlıdır.

- **Seçici dikkat:** Kalabalıkta bir sohbeti takip edebilmek (kokteyl partisi etkisi).
- **Bölünmüş dikkat:** Aynı anda birden fazla işe dikkat vermek. Zordur.
- **Sürdürülen dikkat:** Uzun süre aynı işe odaklanmak.

## 4. Bilinç ve uyku

- **Bilinç:** Kişinin kendisinin ve çevresinin farkında olma hâlidir. **Bilinç durumları:** Uyanıklık, uyku, rüya, hipnoz, meditasyon.
- **Uyku evreleri:** 1-4. evreler (**NREM**, giderek derinleşen uyku) ve **REM** (hızlı göz hareketleri) evresi. Bir uyku döngüsü yaklaşık 90 dakikadır, gece boyu birkaç kez tekrarlanır.
- **Rüya:** Rüyaların çoğu **REM evresinde** görülür. REM'de beyin çok etkindir, kaslar ise gevşektir.
- **Uyku işlevleri:** Dinlenme, bellekte pekiştirme, bağışıklık.
- **Uyku bozuklukları:** İnsomnia (uykusuzluk), uyku apnesi, narkolepsi.

## 5. Güdüler (motivasyon)

**Güdü**, davranışı başlatan, yönlendiren ve sürdüren içsel güçtür.

- **Fizyolojik güdüler:** Açlık, susuzluk, uyku, cinsellik. Doğuştan gelir.
- **Psikolojik ve sosyal güdüler:** Başarı, ait olma, güç, onay. Sonradan öğrenilir.
- **İçsel güdülenme:** Faaliyetin kendisinden zevk almak. **Dışsal güdülenme:** Ödül ya da ceza gibi dış etkenler.

**Maslow'un ihtiyaçlar hiyerarşisi** (aşağıdan yukarıya):

1. **Fizyolojik ihtiyaçlar** (yeme, içme, uyku, barınma).
2. **Güvenlik ihtiyacı.**
3. **Ait olma ve sevgi ihtiyacı.**
4. **Saygınlık ihtiyacı.**
5. **Kendini gerçekleştirme ihtiyacı.**

Alt basamaktaki ihtiyaçlar karşılanmadan üst basamak güdü olarak öne çıkmaz.

## 6. Duygular

**Duygu**, bir olaya karşı oluşan öznel yaşantı, bedensel tepki ve davranış bütünüdür.

- **Üç bileşen:** Bilişsel (düşünce ve yorum), fizyolojik (kalp atışı, terleme), davranışsal (yüz ifadesi, hareket).
- **Temel duygular:** Mutluluk, üzüntü, korku, öfke, şaşkınlık, tiksinme.
- **Kuramlar:** James-Lange kuramı (önce bedensel tepki, sonra duygu), Cannon-Bard kuramı (aynı anda), bilişsel değerlendirme kuramı (yorum belirler).
- **Duygusal zekâ:** Kendi ve başkalarının duygularını tanıma ve yönetme becerisi.

## 7. Sık yapılan hatalar

- Duyum ile algıyı karıştırmak. Duyum ilk tepki, algı yorumlamadır.
- Rüyaların yalnızca derin uykuda görüldüğünü sanmak. Çoğu REM evresindedir.
- Maslow basamaklarının sırasını karıştırmak. En altta fizyolojik ihtiyaçlar vardır.
- Dikkati sınırsız sanmak. Aynı anda çok sınırlı sayıda uyarıcıya odaklanılabilir.
- Duygunun yalnızca bedensel bir tepki olduğunu sanmak. Bilişsel bileşen de vardır.

:::baglanti
Bu konu, **Psikoloji Bilimini Tanıyalım** konusundaki Gestalt ve bilişsel yaklaşımların uygulamasıdır. **Öğrenme, Bellek, Düşünme** konusu algıdan sonra gelen süreçleri işler. **Ruh Sağlığının Temelleri** konusu stres ve duygu yönetimini ele alır. **Biyoloji** dersindeki duyu organları ve sinir sistemi bu konunun fizyolojik temelidir. **Fizik** dersindeki ışık ve ses bölümleri duyuma temel olan uyarıcıları verir.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Duyum | Duyu organının ilk tepkisi |
| Algı | Anlamlandırma |
| Yakınlık | Yakın nesneler grup görünür |
| REM | Rüyaların çoğu, hızlı göz hareketi |
| Maslow tabanı | Fizyolojik ihtiyaçlar |
| Maslow tepesi | Kendini gerçekleştirme |

## Mini test

:::soru{cevap="D"}
Maslow'un ihtiyaçlar hiyerarşisinde en alt basamakta yer alan ihtiyaç aşağıdakilerden hangisidir?

- A) Kendini gerçekleştirme
- B) Saygınlık
- C) Ait olma ve sevgi
- D) Fizyolojik ihtiyaçlar
- E) Güvenlik

---

1. Maslow'a göre yeme, içme, uyku gibi fizyolojik ihtiyaçlar en temel ihtiyaçlardır.
2. Bunlar karşılanmadan üst basamaklar öne çıkmaz. Doğru cevap D.

Diğer şıklar: **A** en üst basamak / **B** dördüncü / **C** üçüncü / **E** ikinci basamak.
:::

:::soru{cevap="B"}
Duyu organlarının uyarıcıları alıp sinirsel sinyale dönüştürmesine ne ad verilir?

- A) Algı
- B) Duyum
- C) Dikkat
- D) Bellek
- E) Güdü

---

1. Duyum, uyarıcının duyu organında yarattığı ilk tepkidir.
2. Bu verinin beyinde anlamlandırılması ise algıdır. Doğru cevap B.

Diğer şıklar: **A** yorumlama / **C** odaklanma / **D** saklama / **E** harekete geçiren güç.
:::

:::soru{cevap="A"}
Birbirine yakın duran nesnelerin bir grup olarak algılanması aşağıdaki Gestalt algı ilkelerinden hangisiyle açıklanır?

- A) Yakınlık
- B) Benzerlik
- C) Tamamlama
- D) Süreklilik
- E) Şekil-zemin

---

1. Yakınlık ilkesine göre birbirine yakın olan uyarıcılar bir bütün olarak görülür.
2. Doğru cevap A.

Diğer şıklar: **B** benzer nesneler / **C** eksiklerin tamamlanması / **D** kesintisiz çizgiler / **E** arka plan ayrımı.
:::

:::soru{cevap="C"}
Uyku ve rüya ile ilgili aşağıdakilerden hangisi doğrudur?

- A) REM evresinde beyin etkinliği durur.
- B) Rüyalar yalnızca derin uykuda görülür.
- C) Rüyaların çoğu REM evresinde görülür.
- D) REM evresinde kaslar aşırı gergindir.
- E) Uyku evreleri gece boyunca hiç tekrarlanmaz.

---

1. REM evresinde beyin çok etkindir ve rüyaların çoğu bu evrede görülür.
2. Doğru cevap C.

Diğer şıklar: **A, D** tersi / **B** derin uyku NREM'dir / **E** döngü birkaç kez tekrarlanır.
:::

## Kendini dene

:::dene
1. Duyum ile algı arasındaki fark nedir? => Duyum ilk tepki, algı anlamlandırmadır.
2. Maslow'un en üst basamağı nedir? => Kendini gerçekleştirme.
3. Rüyalar çoğunlukla hangi uyku evresinde görülür? => REM.
4. Benzer nesnelerin birlikte algılanması hangi ilkeyle açıklanır? => Benzerlik.
5. Duygunun üç bileşeni nedir? => Bilişsel, fizyolojik, davranışsal.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Psikolojinin Temel Süreçleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir köpek zil sesini duyunca neden salya salgılar? Bir çocuk gördüğü davranışı nasıl taklit eder? Dün öğrendiğini neden bugün hatırlayamazsın? **Öğrenme**, yaşantı yoluyla davranışta ortaya çıkan kalıcı değişikliktir. Bu konuda **öğrenme kuramlarını** (klasik koşullanma, edimsel koşullanma, sosyal öğrenme, bilişsel öğrenme), **belleğin yapısını ve işleyişini**, **unutmayı** ve **düşünme türlerini** öğreneceksin.

:::hedefler
1. Öğrenmeyi tanımlamak ve olgunlaşmadan ayırmak.
2. Klasik koşullanmanın öğelerini örnekle göstermek.
3. Edimsel koşullanma ve pekiştirmeyi açıklamak.
4. Sosyal ve bilişsel öğrenmeyi ayırt etmek.
5. Bellek türlerini ve evrelerini sıralamak.
6. Unutma nedenlerini ve düşünme türlerini söylemek.
:::

:::ipucu
Kuramları **ünlü deneyleriyle** bağla: **Pavlov** (köpek, zil, salya) klasik koşullanma, **Skinner** (kutu, kol, yem) edimsel koşullanma, **Bandura** (Bobo bebek) sosyal öğrenme, **Köhler** (maymun ve kutular) kavrayarak öğrenme. Bellekte **duyusal $\rightarrow$ kısa süreli $\rightarrow$ uzun süreli** sırasını unutma.
:::

::video{id="eL1Xk1riHLY" etiket="Konu anlatımı videosu" baslik="Öğrenme, Bellek ve Düşünce" kanal="Benim Hocam"}

## 1. Öğrenme

**Öğrenme**, yaşantı ve deneyim sonucunda davranışta oluşan **göreli olarak kalıcı** değişikliktir. Yorgunluk, ilaç ve **olgunlaşma** (yürümeyi sinir sisteminin gelişimiyle öğrenme) gibi geçici ya da biyolojik değişimler öğrenme sayılmaz.

## 2. Klasik koşullanma (Pavlov)

Nötr bir uyarıcının, doğal tepki oluşturan bir uyarıcıyla birlikte verilerek aynı tepkiyi oluşturur hâle gelmesidir.

- **Koşulsuz uyarıcı (KSU):** Doğal tepki yaratan. Yemek.
- **Koşulsuz tepki (KST):** Doğal tepki. Yemeği görünce salya salgılama.
- **Nötr uyarıcı:** Başlangıçta tepki yaratmayan. Zil sesi.
- **Koşullu uyarıcı (KU):** Öğrenmeden sonra tepki yaratan zil sesi.
- **Koşullu tepki (KT):** Zil sesine karşı salya salgılama.

**Süreçler:** Edinim (koşullanmanın kurulması), **sönme** (koşullu uyarıcı pekiştirilmezse tepkinin azalması), **kendiliğinden geri gelme**, **genelleme** (benzer uyarıcılara tepki), **ayırt etme.** Korkuların ve fobilerin oluşumu klasik koşullanmayla açıklanır.

## 3. Edimsel (işlemsel) koşullanma (Thorndike, Skinner)

Davranışın **sonuçlarına** göre artması ya da azalmasıdır.

- **Pekiştirme:** Davranışın tekrar olasılığını artırır. **Olumlu pekiştirme** (ödül vermek) ve **olumsuz pekiştirme** (hoş olmayan bir durumu ortadan kaldırmak). Olumsuz pekiştirme ceza değildir.
- **Ceza:** Davranışın tekrar olasılığını azaltır.
- **Pekiştirme tarifeleri:** Sürekli ve aralıklı pekiştirme. Aralıklı pekiştirme davranışın sönmesini geciktirir.
- Thorndike'ın **etki yasası:** Sonucu hoş olan davranışlar tekrarlanır.

## 4. Sosyal ve bilişsel öğrenme

- **Sosyal (gözlemsel) öğrenme (Bandura):** Başkasının davranışını gözleyerek ve model alarak öğrenme. Pekiştirmeye gerek duymaz. **Bobo bebek deneyi** (çocuklar yetişkinin saldırgan davranışını taklit etti).
- **Kavrayarak (sezgisel) öğrenme (Köhler):** Problemin öğelerini birden görüp çözüme ulaşmak ("aha" anı).
- **Gizil öğrenme ve bilişsel harita (Tolman):** Ödül olmasa da zihinsel harita oluşturma.

## 5. Bellek

**Bellek**, bilginin kodlanması, depolanması ve geri çağrılması sürecidir.

**Atkinson ve Shiffrin'in bellek modeli:**
- **Duyusal bellek:** Uyarıcıların birkaç saniye saklandığı kısa depo.
- **Kısa süreli bellek:** Dikkat edilen bilgiler. Kapasitesi yaklaşık **7 ± 2** birimdir, süresi 20 ile 30 saniyedir. Tekrar ve gruplama ile uzatılır.
- **Uzun süreli bellek:** Sınırsız kapasiteli, kalıcı depo. **Açık (bildirimsel) bellek:** Olaylar (epizodik) ve bilgiler (anlamsal). **Örtük (bildirimsel olmayan) bellek:** Beceriler (bisiklete binmek), alışkanlıklar.

**Etkili depolama:** Anlamlandırma, tekrar, örgütleme, ilişkilendirme, imgeleme.

## 6. Unutma

- **Ebbinghaus unutma eğrisi:** Öğrenmeden hemen sonra unutma hızlıdır, zamanla yavaşlar. Tekrar yapıldıkça eğri yavaş düşer.
- **Nedenler:**
  - **İz silinmesi (bozulma):** Zamanla bellek izinin zayıflaması.
  - **Girişim:** Yeni bilgi eskiyi (geriye etkili), eski bilgi yeniyi (ileriye etkili) engeller.
  - **Güdülenmiş unutma (bastırma):** Acı verici anıların bilinçdışına itilmesi.
  - **Geri çağırma ipuçlarının eksikliği:** Bilgi depoda vardır ama ulaşılamaz (dilimin ucunda).
- **Amnezi:** Ciddi bellek kaybı.

::sim{tur="unutma"}

## 7. Düşünme

- **Kavramlar:** Düşünmenin yapı taşları.
- **Problem çözme:** Deneme-yanılma, algoritma (adım adım kesin çözüm), sezgisel (kısa yol), kavrayış. Fonksiyonel bağlılık çözüm bulmayı zorlaştırabilir.
- **Akıl yürütme:** Tümdengelim ve tümevarım.
- **Yaratıcı düşünme:** Özgün ve yararlı çözümler üretme. **Iraksak düşünme** (çok çözüm), **yakınsak düşünme** (tek doğru çözüm).
- **Karar verme:** Seçenekler arasından seçim.
- **Üstbilişsel düşünme:** Kişinin kendi düşünmesini izlemesi ve yönetmesi.

## 8. Sık yapılan hatalar

- Olumsuz pekiştirmeyi ceza sanmak. Olumsuz pekiştirme davranışı artırır, ceza azaltır.
- Klasik koşullanmayı davranışın sonucuna bağlı sanmak. O, uyarıcılar arasındaki ilişkiye bağlıdır.
- Kısa süreli belleği sınırsız sanmak. Kapasitesi yaklaşık 7 ± 2 birimdir.
- Unutmayı yalnızca zamanla ilişkilendirmek. Girişim ve bastırma da vardır.
- Olgunlaşmayı öğrenme saymak.

:::baglanti
Bu konu, **Psikolojinin Temel Süreçleri** konusundaki algı ve dikkatten sonra gelen süreçlerdir. **Ruh Sağlığının Temelleri** konusu korku ve fobi gibi öğrenilmiş tepkilerle bağlanır. **Sosyoloji** konularındaki toplumsallaşma, Bandura'nın sosyal öğrenmesiyle doğrudan ilişkilidir. **Biyoloji** dersindeki sinir sistemi bellek ve öğrenmenin fizyolojik temelidir. **Mantık** konularındaki tümdengelim ve tümevarım düşünme türleriyle örtüşür.
:::

## 9. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Klasik koşullanma | Pavlov, uyarıcı-uyarıcı |
| Edimsel koşullanma | Skinner, davranış-sonuç |
| Sosyal öğrenme | Bandura, model alma |
| Kısa süreli bellek | 7 ± 2 birim |
| Uzun süreli bellek | Sınırsız ve kalıcı |
| Girişim | Bilgilerin birbirini engellemesi |

## Mini test

:::soru{cevap="B"}
Zil sesiyle yemeğin birlikte verildiği bir köpeğin yalnızca zil sesini duyunca salya salgılaması klasik koşullanmadaki hangi öğeye örnektir?

- A) Koşulsuz uyarıcı
- B) Koşullu tepki
- C) Koşulsuz tepki
- D) Nötr uyarıcı
- E) Olumlu pekiştirme

---

1. Zil sesi öğrenme sonrasında koşullu uyarıcı olmuştur.
2. Zile verilen salya salgılama tepkisi öğrenilmiştir ve koşullu tepkidir. Doğru cevap B.

Diğer şıklar: **A** yemek / **C** yemeğe verilen doğal tepki / **D** koşullanmadan önceki zil / **E** edimsel koşullanma kavramı.
:::

:::soru{cevap="D"}
Bir çocuğun, izlediği çizgi filmdeki kahramanın davranışını taklit etmesi aşağıdaki öğrenme türlerinden hangisiyle açıklanır?

- A) Klasik koşullanma
- B) Edimsel koşullanma
- C) Deneme-yanılma
- D) Sosyal öğrenme
- E) Kavrayarak öğrenme

---

1. Başkasını gözleyerek ve model alarak öğrenme, Bandura'nın sosyal öğrenme kuramıdır.
2. Bobo bebek deneyi bu duruma örnektir. Doğru cevap D.

Diğer şıklar: **A** uyarıcıların eşleşmesi / **B** davranışın sonucu / **C** tekrarlı denemeler / **E** ani çözüm.
:::

:::soru{cevap="A"}
Kısa süreli belleğin kapasitesi yaklaşık kaç birimdir?

- A) 5 ile 9
- B) 1 ile 2
- C) 20 ile 30
- D) 100 ile 200
- E) Sınırsızdır

---

1. Miller'a göre kısa süreli bellek yaklaşık 7 ± 2 birim bilgiyi tutabilir.
2. Yani 5 ile 9 arası. Doğru cevap A.

Diğer şıklar: **B** çok az / **C** süre (saniye) / **D** uzun süreli bellekle karıştırma / **E** uzun süreli belleğin özelliği.
:::

:::soru{cevap="C"}
Yeni öğrenilen bilginin daha önce öğrenilen bilginin hatırlanmasını güçleştirmesine ne ad verilir?

- A) Bozulma
- B) Bastırma
- C) Girişim
- D) Kodlama
- E) Pekiştirme

---

1. Öğrenilen bilgilerin birbirini engellemesine girişim denir.
2. Yeni bilginin eskisini engellemesi geriye etkili girişimdir. Doğru cevap C.

Diğer şıklar: **A** zamanla iz silinmesi / **B** acı anıların itilmesi / **D** bilgiyi belleğe işleme / **E** davranışı artırma.
:::

## Kendini dene

:::dene
1. Klasik koşullanmayı kim bulmuştur? => Pavlov.
2. Olumlu pekiştirmenin etkisi nedir? => Davranışın tekrar olasılığını artırır.
3. Bobo bebek deneyi hangi öğrenmeyi gösterir? => Sosyal (gözlemsel) öğrenme.
4. Bellek evreleri hangi sıradadır? => Duyusal, kısa süreli, uzun süreli.
5. Unutma eğrisinin yavaş düşmesi için ne yapılmalıdır? => Tekrar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'Öğrenme, Bellek, Düşünme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bedenimiz sağlıklı olabilir ama zihnimiz bunalmış olabilir. Ruh sağlığı, yalnızca bir hastalığın olmaması değil, kişinin kendisiyle ve çevresiyle uyum içinde, verimli ve mutlu yaşayabilmesidir. Bu konuda **ruh sağlığının tanımını ve ölçütlerini**, **uyum ve stresi**, **başa çıkma yollarını**, **savunma mekanizmalarını**, **başlıca ruhsal bozuklukları** ve **psikolojik yardım kaynaklarını** öğreneceksin.

:::hedefler
1. Ruh sağlığının ölçütlerini söylemek.
2. Stres kaynaklarını ve Selye'nin genel uyum sendromu aşamalarını sıralamak.
3. Problem odaklı ve duygu odaklı başa çıkmayı ayırt etmek.
4. Savunma mekanizmalarını örneklerle eşleştirmek.
5. Başlıca ruhsal bozuklukları ve yardım kaynaklarını tanımak.
:::

:::ipucu
Stresin aşamalarını sıra ile hatırla: **alarm $\rightarrow$ direnç $\rightarrow$ tükenme.** Savunma mekanizmalarında **bilinçdışı** çalıştığını, kişinin kaygıyı azaltmak için bunları farkında olmadan kullandığını unutma. **Psikolog** ilaç yazamaz, **psikiyatrist** yazar.
:::

::video{id="RaObiDSVgEI" etiket="Konu anlatımı videosu" baslik="Ruh Sağlığının Temelleri" kanal="Benim Hocam"}

## 1. Ruh sağlığı

**Ruh sağlığı**, kişinin duygusal, düşünsel ve sosyal açıdan iyi olma hâlidir. Dünya Sağlık Örgütü'ne göre yalnızca hastalığın yokluğu değil, bireyin kendi yeteneklerinin farkında olduğu, günlük stresle başa çıkabildiği, verimli çalışabildiği ve topluma katkıda bulunabildiği bir iyilik hâlidir.

**Ruh sağlığı iyi olan kişi:**
- Kendini tanır ve kabul eder.
- Duygularını uygun biçimde ifade eder.
- Stresle başa çıkar.
- Sağlıklı ilişkiler kurar.
- Sorumluluk alır ve gerçekçi hedefler koyar.

## 2. Uyum ve stres

- **Uyum:** Kişinin çevresindeki değişikliklere ve zorluklara ayak uydurması.
- **Stres:** Kişinin bir tehdit ya da zorlanma karşısında yaşadığı bedensel ve ruhsal gerilimdir. **Stres kaynakları:** Okul, sınav, aile sorunları, hastalık, iş, kayıp, çevresel koşullar.
- **Olumlu stres (eustres):** Motive eder. **Olumsuz stres (distres):** Sağlığı bozar.
- **Selye'nin genel uyum sendromu (GUS):**
  1. **Alarm:** Beden savaş ya da kaç tepkisine geçer. Kalp atışı hızlanır.
  2. **Direnç:** Beden stresle baş etmeye çalışır.
  3. **Tükenme:** Uzun süren stres enerjiyi tüketir. Hastalık riski artar.
- **Stresin etkileri:** Baş ağrısı, uyku sorunu, dikkat dağınıklığı, bağışıklığın zayıflaması, kaygı.

## 3. Stresle başa çıkma

- **Problem odaklı başa çıkma:** Stres kaynağını ortadan kaldırmaya yönelik eylem. Plan yapmak, zaman yönetmek, yardım istemek.
- **Duygu odaklı başa çıkma:** Stresin yarattığı duygusal gerilimi azaltmaya yönelik. Nefes egzersizi, spor, arkadaşlarla konuşmak.
- **Sağlıklı yollar:** Düzenli uyku ve beslenme, egzersiz, sosyal destek, gevşeme egzersizleri, zaman yönetimi.
- **Sağlıksız yollar:** Kaçınma, madde ve alkol kullanımı, aşırı yeme ya da hiç yememe.

## 4. Savunma mekanizmaları

Kaygıyı azaltmak için **bilinçdışı** kullanılan, gerçeği çarpıtan ruhsal yöntemlerdir (Freud, Anna Freud).

- **Bastırma:** Acı verici duygu ve anıların bilinçdışına itilmesi.
- **Yadsıma (inkâr):** Gerçeği kabul etmemek.
- **Yansıtma:** Kendi kabul edilemez duygusunu başkasına atfetmek. "Ben ona kızgın değilim, o bana kızgın."
- **Yer değiştirme:** Duyguyu asıl kaynağından başka bir hedefe yöneltmek. İşyerinde azar yiyip evde eşine kızmak.
- **Yüceltme:** Kabul edilemez dürtüleri toplumca değerli bir etkinliğe çevirmek. Saldırgan dürtüleri sporla boşaltmak.
- **Gerileme:** Daha ilkel davranışlara dönmek. Büyük çocuğun yeniden parmak emmesi.
- **Mantığa bürüme (rasyonalizasyon):** Başarısızlığa makul görünen bir gerekçe bulmak.
- **Özdeşim:** Güçlü birine benzeyerek kendini güvende hissetmek.

## 5. Ruhsal bozukluklar

- **Kaygı bozuklukları:** Aşırı ve sürekli kaygı. Panik bozukluğu, sosyal fobi, özgül fobiler, yaygın kaygı bozukluğu.
- **Duygudurum bozuklukları:** Depresyon (süregelen üzüntü, ilgi kaybı), bipolar bozukluk (ruh hâlinin iniş çıkışları).
- **Şizofreni:** Düşünce, algı ve davranışta ciddi bozulma. Varsanılar ve sanrılar.
- **Madde ve bağımlılık bozuklukları.**
- **Travma sonrası stres bozukluğu (TSSB).**
- **Yeme bozuklukları, uyku bozuklukları.**

Ruhsal bozukluk **"delilik" ya da irade zayıflığı değildir.** Tedavi edilebilir sağlık sorunudur. Damgalama (etiketleme) tedaviyi geciktirir.

## 6. Psikolojik yardım

- **Psikiyatrist:** Tıp doktorudur. Ruhsal bozuklukları tanılar ve **ilaç tedavisi** uygular.
- **Psikolog (klinik psikolog):** Psikoloji eğitimi almış uzmandır. Değerlendirme ve **psikoterapi** yapar, ilaç yazamaz.
- **Psikolojik danışman (rehber öğretmen):** Okullarda öğrencilere rehberlik eder.
- **Psikoterapi türleri:** Bilişsel davranışçı terapi, psikanalitik terapi, insan merkezli terapi, aile terapisi.
- **Koruyucu ruh sağlığı:** Erken fark etme, eğitim, sosyal destek, stres yönetimi. Kriz anlarında **182 (MHRS)**, **112** ve **ALO 183** gibi hatlara başvurulabilir.

## 7. Sık yapılan hatalar

- Ruh sağlığını yalnızca hastalığın olmaması sanmak.
- Psikolog ile psikiyatristi karıştırmak. İlaç yazma yetkisi yalnızca psikiyatristtedir.
- Savunma mekanizmalarını bilinçli seçilen davranışlar sanmak.
- Olumlu stresi (eustres) yok saymak.
- Ruhsal bozukluğu karakter zayıflığı sanmak.

:::baglanti
Bu konu, **Psikolojinin Temel Süreçleri** konusundaki duygu ve güdüler ile **Öğrenme, Bellek, Düşünme** konusundaki korku ve fobi öğrenimiyle bağlantılıdır. **Psikoloji Bilimini Tanıyalım** konusundaki psikanaliz ve klinik psikoloji savunma mekanizmalarını verir. **Birey ve Toplum** (Sosyoloji) konusu toplumsal desteği ve damgalamayı işler. **Biyoloji** dersindeki hormonal sistem stres tepkisinin fizyolojik karşılığıdır.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Stres aşamaları | Alarm, direnç, tükenme |
| Problem odaklı başa çıkma | Kaynağı ortadan kaldırmak |
| Bastırma | Anıları bilinçdışına itmek |
| Yansıtma | Duyguyu başkasına atfetmek |
| Yüceltme | Dürtüyü değerli bir etkinliğe çevirmek |
| Psikiyatrist | İlaç tedavisi |
| Psikolog | Psikoterapi, ilaç yazamaz |

## Mini test

:::soru{cevap="C"}
Selye'nin genel uyum sendromuna göre stres tepkisinin aşamaları sırasıyla aşağıdakilerden hangisidir?

- A) Direnç, alarm, tükenme
- B) Tükenme, direnç, alarm
- C) Alarm, direnç, tükenme
- D) Alarm, tükenme, direnç
- E) Direnç, tükenme, alarm

---

1. Beden önce alarm durumuna geçer, sonra dirençle baş etmeye çalışır ve uzun süren stres sonunda tükenir.
2. Doğru cevap C.

Diğer şıklar: **A, B, D, E** yanlış sıralamalar.
:::

:::soru{cevap="E"}
Acı verici bir anının bilinçdışına itilerek unutulmuş gibi olması aşağıdaki savunma mekanizmalarından hangisine örnektir?

- A) Yüceltme
- B) Yansıtma
- C) Yer değiştirme
- D) Yadsıma
- E) Bastırma

---

1. Bastırma, rahatsız edici anıların ve duyguların bilinçdışına itilmesidir.
2. Doğru cevap E.

Diğer şıklar: **A** dürtüyü değerli işe çevirmek / **B** duyguyu başkasına atfetmek / **C** duyguyu başka hedefe yöneltmek / **D** gerçeği kabul etmemek.
:::

:::soru{cevap="A"}
Ruhsal bozuklukları tıbbi açıdan değerlendiren ve ilaç tedavisi uygulayabilen uzman aşağıdakilerden hangisidir?

- A) Psikiyatrist
- B) Psikolog
- C) Sosyolog
- D) Rehber öğretmen
- E) Sosyal hizmet uzmanı

---

1. Psikiyatrist tıp eğitimi almış bir doktordur ve ilaç yazma yetkisine sahiptir.
2. Psikolog psikoterapi yapar ama ilaç yazamaz. Doğru cevap A.

Diğer şıklar: **B** ilaç yazamaz / **C** toplum bilimci / **D** okulda rehberlik / **E** sosyal destek hizmeti.
:::

:::soru{cevap="C"}
Aşağıdakilerden hangisi stresle başa çıkmada problem odaklı bir yöntemdir?

- A) Sorunu görmezden gelmek
- B) Duyguları bastırmak
- C) Plan yapıp harekete geçmek
- D) Suçlu aramak
- E) Uyuyarak sorundan kaçmak

---

1. Problem odaklı başa çıkma, stres kaynağını ortadan kaldırmaya yönelik eylem yapmaktır.
2. Plan yapıp harekete geçmek bunun örneğidir. Doğru cevap C.

Diğer şıklar: **A, E** kaçınma / **B** duygu bastırma / **D** sorunu çözmeyen davranış.
:::

## Kendini dene

:::dene
1. Genel uyum sendromunun aşamaları nelerdir? => Alarm, direnç, tükenme.
2. Duyguyu başka bir hedefe yöneltmek hangi savunma mekanizmasıdır? => Yer değiştirme.
3. Psikiyatrist ile psikolog arasındaki fark nedir? => Psikiyatrist ilaç yazabilir, psikolog yazamaz.
4. Olumlu stresin adı nedir? => Eustres.
5. Duygu odaklı başa çıkmaya bir örnek ver. => Nefes egzersizi ya da arkadaşla konuşmak.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-fel' and name = 'Ruh Sağlığının Temelleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden bazı toplumlarda insanlar erken evlenir, bazılarında geç? İntihar oranları neden ülkeden ülkeye farklıdır? Bu sorular tek bir kişinin değil, **toplumun** işleyişiyle ilgilidir. **Sosyoloji**, toplumu, toplumsal olguları ve toplumsal ilişkileri bilimsel yöntemlerle inceleyen bilimdir. Bu konuda **sosyolojinin doğuşunu ve kurucularını**, **konusunu ve yöntemlerini**, **toplumsal olgunun özelliklerini**, **sosyolojinin diğer bilimlerle ilişkisini** ve **temel sosyolojik yaklaşımları** öğreneceksin.

:::hedefler
1. Sosyolojiyi tanımlamak ve konusunu söylemek.
2. Sosyolojinin doğuşundaki tarihsel koşulları sıralamak.
3. Comte, Durkheim, Weber, Marx, İbn Haldun ve Ziya Gökalp'ın katkısını eşleştirmek.
4. Toplumsal olgunun özelliklerini açıklamak.
5. Sosyolojik araştırma yöntemlerini ayırt etmek.
6. İşlevselcilik, çatışma ve sembolik etkileşimcilik yaklaşımlarını karşılaştırmak.
:::

:::ipucu
İsimleri katkılarına bağla: **Comte** (adı koydu, pozitivizm), **Durkheim** (toplumsal olgu, işlevselcilik, İntihar), **Weber** (anlayıcı sosyoloji, toplumsal eylem), **Marx** (sınıf çatışması), **İbn Haldun** (öncü, asabiyet), **Ziya Gökalp** (Türk sosyolojisi). Bir olgunun "bireyin dışında ve onu zorlayan" olması **toplumsal olgu** ölçütüdür.
:::

::video{id="PvA4D755cVM" etiket="Konu anlatımı videosu" baslik="Sosyolojiye Giriş" kanal="Benim Hocam"}

## 1. Sosyoloji nedir

**Sosyoloji**, insan toplumlarını, toplumsal ilişkileri, kurumları ve toplumsal değişmeyi inceleyen bilimdir. "Sosyoloji" sözcüğünü ilk kez **Auguste Comte** kullandı (Latince socius, arkadaş ve Yunanca logos, bilim).

**Konusu:** Toplumsal olgular ve toplumsal ilişkiler. Birey tek başına değil, toplum içinde ve toplumla etkileşim hâlinde incelenir.

## 2. Doğuşu

Sosyolojinin doğuşunda etkili olan gelişmeler:

- **Sanayi Devrimi:** Kentleşme, işçi sınıfı, toplumsal sorunlar.
- **Fransız İhtilali:** Siyasi ve toplumsal düzenin değişmesi.
- **Aydınlanma:** Bilimsel ve akılcı düşünce.
- **Doğa bilimlerinin başarısı:** Toplumun da bilimsel yöntemle incelenebileceği düşüncesi.

**Öncü:** **İbn Haldun** (14. yüzyıl). Mukaddime'de toplumların yükseliş ve çöküşünü asabiyet gibi toplumsal olgularla açıkladı.

## 3. Kurucular ve önemli isimler

- **Auguste Comte:** Sosyoloji terimini ilk kullanan. **Pozitivizm.** Toplum bilimsel yöntemle incelenmelidir.
- **Herbert Spencer:** Toplumu organizmaya benzetti, evrim.
- **Karl Marx:** Sınıf çatışması ve ekonomik yapı. Çatışma kuramı.
- **Emile Durkheim:** Sosyolojiyi bağımsız bilim yaptı. **Toplumsal olgu.** Sosyolojik Yöntemin Kuralları ve İntihar eserleri.
- **Max Weber:** **Anlayıcı sosyoloji.** Toplumsal eylemin anlamı. Bürokrasi.
- **Georg Simmel, George Herbert Mead.** Etkileşim.
- **Ziya Gökalp:** **Türk sosyolojisinin kurucusu.** Kültür ve medeniyet ayrımı.

::sim{tur="sosyoloji"}

## 4. Toplumsal olgu

Durkheim'a göre toplumsal olgu, bireyin dışında var olan ve bireye **dışarıdan baskı uygulayan** davranış, düşünce ve hissetme biçimleridir.

**Özellikleri:**
- **Bireyin dışındadır.** Birey doğmadan önce de vardır.
- **Zorlayıcıdır.** Uyulmadığında yaptırım (kınama, ceza) vardır.
- **Geneldir.** Toplumun çoğunluğunda görülür.
- **Tarihseldir.** Zamanla değişir.
- **Toplumsaldır.** Bireysel değil, toplumsal köken taşır.

Örnekler: Dil, gelenek, hukuk kuralları, selamlaşma biçimleri, moda.

## 5. Sosyolojinin yöntemleri

- **Gözlem:** Katılımlı (araştırmacı topluluğun içinde yaşar) ve katılımsız gözlem.
- **Anket:** Çok sayıda kişiye standart sorular.
- **Görüşme (mülakat):** Derinlemesine bilgi.
- **İstatistik ve belge incelemesi:** Sayısal veri, tarihî belgeler. Durkheim'ın intihar çalışması istatistiğe dayanır.
- **Deney:** Toplumsal olgularda sınırlı kullanılır. Etik ve uygulama güçlüğü vardır.
- **Karşılaştırma (tarihsel yöntem):** Toplumları ve dönemleri karşılaştırma.

**Sosyolojide nesnellik:** Araştırmacı değer yargılarından uzak durmaya çalışır.

## 6. Sosyolojinin diğer bilimlerle ilişkisi

- **Psikoloji:** Bireyin davranışını inceler. Sosyoloji toplumsal olguları inceler.
- **Tarih:** Geçmişi inceler. Sosyoloji genelleme yapar.
- **Antropoloji:** Kültürleri inceler.
- **İktisat, siyaset bilimi, hukuk:** Toplumun belirli alanlarını inceler.

**Alt dalları:** Aile, kent, kır, eğitim, din, siyaset, hukuk, sanat, bilgi, iş ve sağlık sosyolojisi.

## 7. Sosyolojik yaklaşımlar

- **İşlevselcilik (Durkheim, Parsons):** Toplum, parçaları birbirini tamamlayan bir bütündür. Kurumların işlevi vardır.
- **Çatışma kuramı (Marx):** Toplum, sınıflar arası çıkar çatışmasıyla şekillenir.
- **Sembolik etkileşimcilik (Mead, Blumer):** Toplum, bireylerin sembollerle etkileşimiyle oluşur. Benlik toplumsal etkileşimden doğar.

## 8. Sık yapılan hatalar

- Sosyolojiyi psikolojiyle karıştırmak. Psikoloji bireyi, sosyoloji toplumu inceler.
- "Sosyoloji" terimini Durkheim'a bağlamak. Comte kullanmıştır.
- İbn Haldun'u sosyolojinin kurucusu saymak. Öncüsüdür. Bağımsız bilim olarak kurucusu genellikle Comte ve Durkheim kabul edilir.
- Toplumsal olguyu bireysel bir deneyim sanmak. Bireyin dışındadır.
- Sosyolojinin yalnızca anketle çalıştığını sanmak.

:::baglanti
Bu konu, **Birey ve Toplum**, **Toplumsal Yapı ve Değişme**, **Toplum ve Kültür** ve **Toplumsal Kurumlar** konularının girişidir. **Psikoloji Bilimini Tanıyalım** konusu aynı sorulara bireysel açıdan yaklaşır. **Tarih** dersindeki Sanayi Devrimi ve Fransız İhtilali sosyolojinin doğduğu koşulları verir. **Coğrafya** dersindeki nüfus ve kentleşme konuları sosyolojik verilerle çalışır.
:::

## 9. Konuyu toparla

| İsim | Katkı |
| --- | --- |
| Comte | Sosyoloji adını koydu, pozitivizm |
| Durkheim | Toplumsal olgu, işlevselcilik |
| Weber | Anlayıcı sosyoloji |
| Marx | Sınıf çatışması |
| İbn Haldun | Öncü, Mukaddime |
| Ziya Gökalp | Türk sosyolojisi |

## Mini test

:::soru{cevap="B"}
"Sosyoloji" terimini ilk kez kullanan düşünür aşağıdakilerden hangisidir?

- A) Durkheim
- B) Comte
- C) Weber
- D) Marx
- E) İbn Haldun

---

1. Auguste Comte, sosyoloji sözcüğünü ilk kez kullanan ve pozitivist toplum biliminin kurucusu olan düşünürdür.
2. Doğru cevap B.

Diğer şıklar: **A** toplumsal olgu / **C** anlayıcı sosyoloji / **D** çatışma kuramı / **E** sosyolojinin öncüsü.
:::

:::soru{cevap="A"}
Durkheim'a göre toplumsal olgunun temel özelliği aşağıdakilerden hangisidir?

- A) Bireyin dışında olması ve bireye baskı uygulaması
- B) Yalnızca bireyin kendi düşünceleri olması
- C) Doğuştan getirilmesi
- D) Yalnızca bir kişide görülmesi
- E) Hiçbir zaman değişmemesi

---

1. Toplumsal olgular bireyin dışındadır, onu zorlar ve geneldir.
2. Dil ve gelenekler bu duruma örnektir. Doğru cevap A.

Diğer şıklar: **B, C, D** bireysel özellikler / **E** toplumsal olgular zamanla değişir.
:::

:::soru{cevap="A"}
Türk sosyolojisinin kurucusu kabul edilen düşünür aşağıdakilerden hangisidir?

- A) Ziya Gökalp
- B) Namık Kemal
- C) Ahmet Cevdet Paşa
- D) Mehmet Akif Ersoy
- E) Yahya Kemal Beyatlı

---

1. Ziya Gökalp, kültür ve medeniyet ayrımını yapan ve Türk sosyolojisini kuran düşünürdür.
2. Doğru cevap A.

Diğer şıklar: **B** Tanzimat yazarı / **C** tarihçi ve devlet adamı / **D** şair / **E** şair.
:::

:::soru{cevap="C"}
Bir sosyoloğun, incelediği topluluğun içinde yaşayarak elde ettiği veriye dayanan araştırma yöntemi aşağıdakilerden hangisidir?

- A) Anket
- B) Deney
- C) Katılımlı gözlem
- D) İstatistik
- E) Belge incelemesi

---

1. Katılımlı gözlemde araştırmacı incelediği topluluğun içine girer.
2. Doğru cevap C.

Diğer şıklar: **A** standart soru formu / **B** kontrollü değişim / **D** sayısal veri / **E** yazılı kaynak.
:::

## Kendini dene

:::dene
1. Sosyoloji terimini kim kullandı? => Comte.
2. Toplumsal olgunun iki özelliğini söyle. => Bireyin dışında olması ve zorlayıcı olması.
3. Türk sosyolojisinin kurucusu kimdir? => Ziya Gökalp.
4. Sosyolojinin öncüsü olan İslam düşünürü kimdir? => İbn Haldun.
5. Weber'in yaklaşımının adı nedir? => Anlayıcı sosyoloji.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'Sosyolojiye Giriş'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Hiç kimse toplumsal davranışları doğuştan bilmez. Selamlaşmayı, sırada beklemeyi, bir bayramı kutlamayı sonradan öğreniriz. Birey ile toplum karşılıklı birbirini şekillendirir. Bu konuda **toplumsallaşmayı**, **statü ve rolü**, **toplumsal grupları**, **norm türlerini**, **toplumsal kontrolü** ve **sapmayı** öğreneceksin.

:::hedefler
1. Toplumsallaşmayı ve toplumsallaşma kurumlarını açıklamak.
2. Statü ve rol kavramlarını örneklerle ayırt etmek.
3. Birincil ve ikincil grupları karşılaştırmak.
4. Norm türlerini (gelenek, ahlak, görgü, hukuk) sıralamak.
5. Toplumsal kontrol ve sapma kavramlarını yorumlamak.
:::

:::ipucu
Statüyü **konum**, rolü **o konumun gerektirdiği davranış** olarak düşün. Doğuştan gelen ya da kendiliğinden kazanılan statü **atanmış**, çaba ve eğitimle elde edilen statü **kazanılmış** statüdür. Normları yaptırımın gücüne göre sırala: en kesin yaptırım **hukuktadır.**
:::

::video{id="jllTFYg_l3Q" etiket="Konu anlatımı videosu" baslik="Birey ve Toplum" kanal="Benim Hocam"}

## 1. Toplumsallaşma

**Toplumsallaşma**, bireyin içinde yaşadığı toplumun değerlerini, normlarını, rollerini ve davranış kalıplarını öğrenip benimsemesi sürecidir. Yaşam boyu sürer.

- **Birincil toplumsallaşma:** Çocukluk dönemi. **Aile** en etkili kurumdur.
- **İkincil toplumsallaşma:** Okul, akran grubu, iş yeri, medya, din kurumları.
- **Toplumsallaşma kurumları:** Aile, okul, akran grubu, kitle iletişim araçları, din, iş yeri.
- **Benlik:** Cooley'in "ayna benlik" kavramına göre kişi kendini başkalarının gözünden gördüğü gibi algılar. Mead'e göre benlik toplumsal etkileşimde oluşur.

## 2. Statü ve rol

- **Statü:** Bireyin toplumdaki konumudur. Öğrenci, öğretmen, anne, doktor.
- **Atanmış statü:** Doğuştan ya da kişinin çabası dışında kazanılır. Cinsiyet, yaş, soy.
- **Kazanılmış statü:** Çaba ve eğitimle elde edilir. Mühendis, öğretmen, başkan.
- **Rol:** Statünün gerektirdiği, toplumun beklediği davranışlardır. Öğretmen statüsünün rolü ders vermektir.
- **Rol çatışması:** Aynı kişinin birden fazla rolünün gereklerinin çelişmesi. Çalışan bir annenin iş ve ev sorumlulukları arasında kalması.

## 3. Toplumsal gruplar

- **Birincil grup:** Üyelerin yüz yüze, duygusal bağlarla birbirine bağlı olduğu küçük gruplar. Aile, yakın arkadaşlar. Üyelik doğal, ilişkiler samimidir.
- **İkincil grup:** Üyelerin resmî, geçici ve amaca dayalı ilişkiler kurduğu daha büyük gruplar. Okul sınıfı, şirket, dernek, siyasi parti. Kurallar yazılıdır.
- **İç grup ve dış grup:** "Biz" ve "onlar" ayrımı.

## 4. Normlar

**Norm**, toplumun üyelerinden beklediği davranış kurallarıdır. Yaptırımın gücü ve niteliği farklıdır.

- **Gelenek ve görenek:** Toplumun uzun süre uyguladığı davranışlar. Yaptırımı toplumsal baskı ve kınamadır.
- **Ahlak kuralları:** İyi ve kötüye dair değerler. Yaptırımı vicdan ve toplumsal tepkidir.
- **Görgü kuralları:** Nezaket ve davranış inceliği. Yaptırımı hafif tepki.
- **Din kuralları:** Dinî inançlara dayanır. Yaptırımı kişinin inancına göredir.
- **Hukuk kuralları:** Devletin koyduğu ve **zorlayıcı yaptırımı** olan yazılı kurallar. Yaptırımı ceza ve tazminattır. En belirgin yaptırım hukukta bulunur.
- **Moda:** Geçici davranış kalıpları.

## 5. Toplumsal kontrol ve sapma

- **Toplumsal kontrol:** Toplumun üyelerini normlara uymaya yönlendirme mekanizmasıdır.
  - **Biçimsel (resmî) kontrol:** Polis, mahkeme, okul disiplini, kanunlar.
  - **Biçimsel olmayan kontrol:** Aile, komşuluk, arkadaş çevresi, kınama, dışlama, takdir.
- **Yaptırım:** Normlara uyanı ödüllendiren ya da uymayanı cezalandıran tepki.
- **Sapma:** Toplumun norm ve beklentilerinden ayrılan davranıştır. Sapma kültürden kültüre ve çağdan çağa değişebilir. Suç, hukuk kurallarının ihlalidir.
- **Sapmanın nedenleri:** Toplumsallaşma eksikliği, yoksulluk, çevre etkisi, etiketleme, norm çatışması.

## 6. Sık yapılan hatalar

- Statü ile rolü karıştırmak. Statü konum, rol davranıştır.
- Aileyi ikincil grup saymak. Aile birincil gruptur.
- Her normun yaptırımını yasa sanmak. Yasal yaptırım yalnızca hukukta bulunur.
- Sapmayı mutlak kötü davranış sanmak. Toplumun normlarına göre tanımlanır.
- Toplumsallaşmayı yalnızca çocukluk dönemine bağlamak. Yaşam boyu sürer.

:::baglanti
Bu konu, **Sosyolojiye Giriş** konusunun birey odaklı bölümüdür. **Toplumsal Yapı ve Değişme** konusu bireylerin oluşturduğu yapıyı, **Toplum ve Kültür** konusu normların kaynağı olan kültürü işler. **Öğrenme, Bellek, Düşünme** konusundaki Bandura'nın sosyal öğrenmesi toplumsallaşmanın psikolojik açıklamasıdır. **Ruh Sağlığının Temelleri** konusundaki damgalama ve sosyal destek burada işlenen grup bağlarıyla ilişkilidir. **Din Kültürü** dersindeki ahlak kuralları normlarla bağlantılıdır.
:::

## 7. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Toplumsallaşma | Toplumun değer ve normlarını öğrenme |
| Atanmış statü | Doğuştan |
| Kazanılmış statü | Çaba ile |
| Rol | Statünün gerektirdiği davranış |
| Birincil grup | Yüz yüze, duygusal bağ |
| Hukuk | Zorlayıcı, resmî yaptırım |

## Mini test

:::soru{cevap="D"}
Bireyin içinde yaşadığı toplumun değer, norm ve davranış kalıplarını öğrenip benimsemesi sürecine ne ad verilir?

- A) Toplumsal değişme
- B) Kültürel yayılma
- C) Toplumsal hareketlilik
- D) Toplumsallaşma
- E) Toplumsal sapma

---

1. Toplumsallaşma, bireyin toplumun bir üyesi olmayı öğrenmesidir.
2. Aile, okul ve akran grubu bu sürecin başlıca kurumlarıdır. Doğru cevap D.

Diğer şıklar: **A** toplumda zamanla olan değişim / **B** bir kültür ögesinin başka topluma geçmesi / **C** statü değişimi / **E** normlardan ayrılma.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi kazanılmış statüye örnektir?

- A) Kız çocuğu olmak
- B) Yaşlı olmak
- C) Kardeş olmak
- D) Erkek olmak
- E) Mühendis olmak

---

1. Kazanılmış statü eğitim ve çabayla elde edilir.
2. Mühendis olmak bunun örneğidir. Diğer şıklar doğuştan ya da kişinin çabası dışında kazanılan atanmış statülerdir. Doğru cevap E.

Diğer şıklar: **A, B, C, D** atanmış statü.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi birincil gruplar için söylenebilir?

- A) Üyeler arası ilişkiler resmî ve geçicidir.
- B) Çok büyük kalabalıklardan oluşur.
- C) Kuralları yazılı ve katıdır.
- D) Üyelik bir sözleşmeyle gerçekleşir.
- E) Üyeler arası ilişkiler yüz yüze ve duygusaldır.

---

1. Birincil gruplar küçüktür ve yüz yüze, samimi ilişkilere dayanır. Aile bunun tipik örneğidir.
2. Doğru cevap E.

Diğer şıklar: **A, B, C, D** ikincil grupların özellikleri.
:::

:::soru{cevap="A"}
Aşağıdaki norm türlerinden hangisinin yaptırımı devlet tarafından uygulanan resmî ve zorlayıcı bir yaptırımdır?

- A) Hukuk kuralları
- B) Görgü kuralları
- C) Gelenekler
- D) Ahlak kuralları
- E) Modalar

---

1. Hukuk kuralları devletin koyduğu ve cezai yaptırımı olan yazılı kurallardır.
2. Diğer normların yaptırımı toplumsal tepki ya da vicdandır. Doğru cevap A.

Diğer şıklar: **B** nezaket kuralı / **C** toplumsal baskı / **D** vicdan / **E** geçici davranış kalıbı.
:::

## Kendini dene

:::dene
1. Toplumsallaşmanın en etkili ilk kurumu hangisidir? => Aile.
2. Statünün gerektirdiği davranışlara ne denir? => Rol.
3. Okul sınıfı hangi grup türüne örnektir? => İkincil grup.
4. Yaptırımı resmî olan norm türü hangisidir? => Hukuk kuralları.
5. Norm ve beklentilerden ayrılan davranışa ne denir? => Sapma.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Birey ve Toplum'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Toplumlar sabit kalmaz. Bir yandan kurumlar, roller ve normlardan oluşan bir **yapı** vardır, diğer yandan bu yapı zamanla **değişir.** Bu konuda **toplumsal yapıyı**, **toplumsal tabakalaşmayı**, **toplumsal hareketliliği**, **toplumsal değişme türlerini** (evrim, devrim, ilerleme, gelişme), **değişme etkenlerini** ve **kültürel gecikmeyi** öğreneceksin.

:::hedefler
1. Toplumsal yapının öğelerini sıralamak.
2. Kast, sınıf ve tabaka biçimlerini ayırt etmek.
3. Dikey ve yatay toplumsal hareketliliği örnekle göstermek.
4. Evrim, devrim, ilerleme ve gelişmeyi karşılaştırmak.
5. Toplumsal değişmeyi hızlandıran ve geciktiren etkenleri söylemek.
6. Kültürel gecikmeyi açıklamak.
:::

:::ipucu
Hareketliliği **yön** ile ayır: statüsü yükselen ya da düşen kişi **dikey**, statüsü aynı kalıp başka bir konuma geçen kişi **yatay** hareketlilik yaşar. Değişme türlerinde **hız** belirleyicidir: yavaş ve aşamalı **evrim**, ani ve köklü **devrim.**
:::

::video{id="5ueCqbWPnKY" etiket="Konu anlatımı videosu" baslik="Toplumsal Yapı" kanal="Benim Hocam"}

::video{id="Ir8OLAIWsVw" etiket="Konu anlatımı videosu" baslik="Toplumsal Değişme ve Gelişme" kanal="Benim Hocam"}

## 1. Toplumsal yapı

**Toplumsal yapı**, toplumu oluşturan kurumların, grupların, statü ve rollerin, normların ve değerlerin birbirleriyle ilişkili düzenli bütünüdür. Aile, eğitim, ekonomi, siyaset, din ve hukuk kurumları yapının temel ögeleridir. Yapı, toplumsal düzenin sürmesini sağlar.

## 2. Toplumsal tabakalaşma

**Tabakalaşma**, bir toplumda bireylerin ve grupların gelir, güç, itibar gibi ölçütlere göre hiyerarşik olarak sıralanmasıdır.

- **Kast sistemi:** Doğumla belirlenen, geçişin neredeyse imkânsız olduğu kapalı tabakalaşma. Hindistan'da geleneksel kast sistemi.
- **Sınıf sistemi:** Ekonomik ölçütlere dayanır, geçiş mümkündür. Modern toplumlarda görülür. Üst, orta ve alt sınıf.
- **Zümre (statü grubu) sistemi:** Orta Çağ Avrupa'sında soylular, din adamları, halk.
- **Marx:** Sınıfları üretim araçlarına sahip olma ya da olmama ile açıkladı (burjuvazi ve proletarya).
- **Weber:** Tabakalaşmayı üç boyutla açıkladı: sınıf (ekonomik), statü (itibar) ve güç (siyasi).

## 3. Toplumsal hareketlilik

Bireylerin ya da grupların tabakalaşma sisteminde yer değiştirmesidir.

- **Dikey hareketlilik:** Statünün yükselmesi (yukarı) ya da düşmesi (aşağı). Bir işçinin eğitim alarak mühendis olması yukarı dikey hareketliliktir. İflas eden bir işletmecinin düşük gelirli işe geçmesi aşağı dikey hareketliliktir.
- **Yatay hareketlilik:** Statü düzeyi aynı kalıp başka bir konuma geçiş. Bir öğretmenin başka şehirde aynı pozisyonda görev yapması.
- **Kuşaklar arası hareketlilik:** Çocuğun ebeveynine göre farklı bir statüye ulaşması.
- Hareketliliğin önünde engeller: Eğitim ve gelir eşitsizliği, ayrımcılık. Kolaylaştıranlar: Eğitim, liyakat, ekonomik gelişme.

## 4. Toplumsal değişme

**Toplumsal değişme**, toplumun yapısında, kurumlarında ve ilişkilerinde zaman içinde ortaya çıkan farklılaşmalardır.

- **Evrim:** Yavaş, aşamalı ve doğal bir değişim.
- **Devrim:** Ani, köklü ve çoğu kez şiddet içeren değişim. Fransız İhtilali, Sanayi Devrimi.
- **İlerleme:** Değişimin toplumun yararına ve daha iyi yönde olması anlamına gelen, değer yargısı içeren kavram.
- **Gelişme:** Belirli bir hedefe doğru niceliksel ve niteliksel artış. Ekonomik gelişme.
- **Modernleşme:** Geleneksel toplumdan modern topluma geçiş. Sanayileşme, kentleşme, eğitim, bilimsel düşünce.
- **Çağdaşlaşma, Batılılaşma, sanayileşme, kentleşme** değişme süreçlerinin bileşenleridir.

## 5. Toplumsal değişmenin etkenleri

**Hızlandıranlar:**
- Teknolojik buluşlar, iletişim araçlarının gelişmesi.
- Eğitim ve bilimsel gelişme.
- Göç, nüfus değişimi.
- Ekonomik gelişme, sanayileşme.
- Savaşlar, doğal afetler.
- Başka toplumlarla etkileşim.
- Siyasi ve ideolojik hareketler.

**Geciktirenler:**
- Geleneklere ve alışkanlıklara bağlılık.
- Kapalı toplum yapısı.
- Çıkar grupları ve değişime direnç.
- Eğitim eksikliği.

## 6. Kültürel gecikme

**William Ogburn**'e göre toplumda **maddi kültür** (teknoloji, araç gereç) **manevi kültüre** (değerler, gelenekler, hukuk) göre daha hızlı değişir. Manevi kültürün maddi kültüre uyum sağlamasındaki bu geri kalma **kültürel gecikme** olarak adlandırılır. Örneğin internet ve sosyal medya hızla yayılmışken, bunlarla ilgili hukuki düzenleme ve toplumsal alışkanlıklar daha yavaş oluşur.

## 7. Sık yapılan hatalar

- Dikey ve yatay hareketliliği karıştırmak. Dikey statü yükselmesi ya da düşmesidir.
- İlerleme ile değişmeyi aynı sanmak. Her değişme ilerleme değildir.
- Kast sistemini açık sistem sanmak. Kast kapalıdır.
- Kültürel gecikmeyi manevi kültürün maddiden önce değişmesi sanmak. Tersidir.
- Devrimin yavaş değişme olduğunu sanmak.

:::baglanti
Bu konu, **Birey ve Toplum** konusundaki statü ve rol bilgisinin toplum ölçeğindeki karşılığıdır. **Toplum ve Kültür** konusu kültürel değişmeyi, **Toplumsal Kurumlar** konusu yapının temel ögelerini ayrıntılandırır. **Tarih** dersindeki Sanayi Devrimi, Fransız İhtilali ve Tanzimat toplumsal değişmenin örnekleridir. **Coğrafya** dersindeki kentleşme ve göç, değişmenin hızlandıranlarıdır.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Kast | Kapalı, doğumla belirlenir |
| Sınıf | Ekonomik ölçüt, geçiş mümkün |
| Dikey hareketlilik | Statü yükselir ya da düşer |
| Yatay hareketlilik | Statü aynı kalır |
| Evrim | Yavaş ve aşamalı |
| Devrim | Ani ve köklü |
| Kültürel gecikme | Manevi kültür geriden gelir |

## Mini test

:::soru{cevap="E"}
Bir fabrika işçisinin üniversitede okuyarak mühendis olması aşağıdaki toplumsal hareketlilik türlerinden hangisine örnektir?

- A) Yatay hareketlilik
- B) Aşağı dikey hareketlilik
- C) Toplumsal devrim
- D) Kültürel yayılma
- E) Yukarı dikey hareketlilik

---

1. Statü yükseldiği için hareketlilik dikeydir ve yukarı yöndedir.
2. Doğru cevap E.

Diğer şıklar: **A** statü aynı kalır / **B** statü düşer / **C** köklü yapı değişimi / **D** kültür ögesinin geçişi.
:::

:::soru{cevap="A"}
Maddi kültürün manevi kültüre göre daha hızlı değişmesi sonucunda ortaya çıkan uyumsuzluğa ne ad verilir?

- A) Kültürel gecikme
- B) Kültürel yayılma
- C) Kültürleşme
- D) Toplumsal kontrol
- E) Sapma

---

1. Ogburn'e göre teknoloji gibi maddi ögeler hızlı, değerler ve hukuk gibi manevi ögeler yavaş değişir.
2. Aradaki uyumsuzluk kültürel gecikmedir. Doğru cevap A.

Diğer şıklar: **B** kültür ögesinin yayılması / **C** kültürler arası etkileşim / **D** normlara uygunluk baskısı / **E** normlardan ayrılma.
:::

:::soru{cevap="A"}
Toplumsal değişmenin yavaş ve aşamalı biçimde gerçekleşmesine ne ad verilir?

- A) Evrim
- B) Devrim
- C) İsyan
- D) Ayaklanma
- E) Darbe

---

1. Yavaş, kendiliğinden ve aşamalı değişime evrim denir.
2. Doğru cevap A.

Diğer şıklar: **B** ani ve köklü / **C, D** ani karşı çıkış / **E** zorla yönetime el koyma.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi toplumsal değişmeyi hızlandıran etkenlerden biridir?

- A) Geleneklere sıkı bağlılık
- B) Teknolojik buluşlar
- C) Kapalı toplum yapısı
- D) Değişime direnç
- E) Dış etkileşimin kesilmesi

---

1. Yeni teknolojiler üretim ve iletişim biçimlerini hızla değiştirir.
2. Diğer şıklar değişimi geciktirir. Doğru cevap B.

Diğer şıklar: **A, C, D, E** değişimi geciktirir.
:::

## Kendini dene

:::dene
1. Doğumla belirlenen kapalı tabakalaşma sistemi hangisidir? => Kast sistemi.
2. Statü yükselmesi hangi hareketliliktir? => Yukarı dikey hareketlilik.
3. Ani ve köklü toplumsal değişimin adı nedir? => Devrim.
4. Kültürel gecikme kavramını kim ortaya attı? => Ogburn.
5. Weber tabakalaşmayı hangi üç boyutla açıkladı? => Sınıf, statü ve güç.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Toplumsal Yapı ve Değişme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Her toplumun kendine özgü bir yaşam biçimi, değerleri ve gelenekleri vardır. Bir toplumun yemeği, dili, bayramları, mimarisi ve inançları o toplumun **kültürünü** oluşturur. Bu konuda **kültürün tanımını, ögelerini ve özelliklerini**, **kültür ve medeniyet ayrımını**, **kültürel çeşitliliği** (alt kültür, karşı kültür), **kültür merkezcilik ve kültürel göreciliği** ve **kültürel değişmeyi** (yayılma, kültürleşme) öğreneceksin.

:::hedefler
1. Kültürün tanımını ve ögelerini söylemek.
2. Kültürün özelliklerini sıralamak.
3. Kültür ile medeniyeti ayırt etmek.
4. Alt kültür, karşı kültür ve baskın kültürü örneklerle eşleştirmek.
5. Kültür merkezcilik ile kültürel göreciliği karşılaştırmak.
6. Kültürel yayılma, kültürleşme ve asimilasyonu açıklamak.
:::

:::ipucu
Kültürü iki parçada düşün: **maddi** (araç, yapı, giysi) ve **manevi** (dil, din, gelenek, değer). Ziya Gökalp'a göre **kültür millîdir**, **medeniyet uluslararasıdır.** Başka kültürü kendi ölçülerinle yargılamak **kültür merkezcilik**, o kültürü kendi bağlamında anlamak **kültürel görecelik**tir.
:::

::video{id="8np91IapXAI" etiket="Konu anlatımı videosu" baslik="Toplum ve Kültür" kanal="Benim Hocam"}

## 1. Kültür nedir

**Kültür**, bir toplumun üyelerinin ürettiği, paylaştığı ve kuşaktan kuşağa aktardığı maddi ve manevi değerlerin, bilgilerin, inançların, normların ve yaşam biçimlerinin bütünüdür.

**Kültürün ögeleri:**
- **Maddi kültür:** Araç gereç, yapı, giysi, teknoloji.
- **Manevi kültür:** Dil, din, gelenek, ahlak, sanat, hukuk, değerler.

## 2. Kültürün özellikleri

- **Öğrenilir.** Doğuştan gelmez, toplumsallaşma ile edinilir.
- **Toplumsaldır ve paylaşılır.** Bir kişiye ait değildir.
- **Kuşaktan kuşağa aktarılır.** Dil, bu aktarımın temel aracıdır.
- **Birikimlidir.** Önceki kuşakların birikimine yenisi eklenir.
- **Değişir ama yavaş değişir.**
- **Bütünleşiktir.** Ögeleri birbiriyle uyumludur.
- **Toplumdan topluma farklıdır.**

## 3. Kültür ve medeniyet

- **Kültür:** Bir topluma özgü, millî olan, duygu ve yaşam biçimi. Dil, gelenek, din.
- **Medeniyet:** Birçok toplumun ortak birikimi olan bilim, teknoloji, hukuk gibi akılcı ve uluslararası ögeler.
- **Ziya Gökalp:** Kültür millîdir, medeniyet uluslararasıdır. "Türk milletindenim, İslam ümmetindenim, Garp medeniyetindenim." anlayışı.

## 4. Kültürel çeşitlilik

- **Baskın (egemen) kültür:** Toplumda çoğunluğun ya da yönetimin benimsediği kültür.
- **Alt kültür:** Genel kültürle uyumlu olup ona bazı farklı özellikler katan grup kültürü. Bölgesel, mesleki, gençlik kültürleri.
- **Karşı kültür:** Baskın kültürün değerlerine açıkça karşı çıkan ve alternatif değerler öneren kültür. Hippi hareketi.
- **Kitle kültürü:** Medya ve kitle iletişim araçlarıyla yayılan, standartlaşmış kültür.
- **Halk kültürü ve yüksek kültür.**

## 5. Kültür merkezcilik ve görecelik

- **Kültür merkezcilik (etnosentrizm):** Kendi kültürünü ölçü alıp diğer kültürleri onunla değerlendirmek ve üstün görmek. Önyargıya ve ayrımcılığa yol açar.
- **Kültürel görecelik:** Her kültürün kendi bağlamında, kendi değerlerine göre anlaşılması gerektiği görüşü. Hoşgörü ve çeşitliliğe saygı sağlar.

## 6. Kültürel değişme

- **Kültürel yayılma (difüzyon):** Bir kültür ögesinin bir toplumdan başka topluma geçmesi. Kahvenin, futbolun yayılması.
- **Kültürleşme (akültürasyon):** İki farklı kültürün sürekli temasıyla birinin ya da her ikisinin özelliklerinde değişme.
- **Asimilasyon:** Bir kültürün başka bir kültür içinde eriyerek özgün niteliğini kaybetmesi.
- **Kültürel yabancılaşma:** Kişinin ya da toplumun kendi kültürel değerlerinden uzaklaşması.
- **Kültürel gecikme:** Maddi kültürün hızlı, manevi kültürün yavaş değişmesi.
- **Küreselleşme:** Kültürel etkileşimi artırır, hem zenginleştirir hem de yerel kültürleri zayıflatma riski taşır.

**Kültürel değişmeyi etkileyen etkenler:** Teknoloji, göç, ticaret, savaş, iletişim araçları, eğitim.

## 7. Sık yapılan hatalar

- Kültürü yalnızca sanat ve müzik sanmak. Dil, din, gelenek, teknoloji de kültürdür.
- Kültür ile medeniyeti aynı sanmak. Kültür millî, medeniyet uluslararasıdır.
- Alt kültür ile karşı kültürü karıştırmak. Alt kültür uyumlu, karşı kültür çatışmacıdır.
- Kültür merkezciliği kendi kültürünü sevmek sanmak. Başkalarını aşağı görmeyi içerir.
- Kültürün doğuştan geldiğini sanmak.

:::baglanti
Bu konu, **Birey ve Toplum** konusundaki norm ve toplumsallaşma bilgisinin kaynağıdır. **Toplumsal Yapı ve Değişme** konusundaki kültürel gecikme burada ayrıntılanır. **Toplumsal Kurumlar** konusu kültürün aktarıldığı kurumları işler. **Coğrafya-2** dersindeki **Kültür Bölgeleri** konusu aynı kavramı dünya ölçeğinde ele alır. **Edebiyat** ve **Tarih** dersleri Türk kültürünün kaynaklarını verir.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Maddi kültür | Araç, yapı |
| Manevi kültür | Dil, din, gelenek |
| Kültür | Millî |
| Medeniyet | Uluslararası |
| Karşı kültür | Baskın kültüre karşı çıkar |
| Kültür merkezcilik | Kendi kültürü ölçü alınır |
| Kültürel yayılma | Bir ögenin başka topluma geçmesi |

## Mini test

:::soru{cevap="C"}
Kendi kültürünü ölçü alarak diğer kültürleri değerlendirmek ve onları aşağı görmek aşağıdaki kavramlardan hangisiyle ifade edilir?

- A) Kültürel görecelik
- B) Kültürleşme
- C) Kültür merkezcilik
- D) Kültürel yayılma
- E) Alt kültür

---

1. Kültür merkezcilik (etnosentrizm), kendi kültürünü merkeze koyup diğerlerini ona göre yargılamaktır.
2. Doğru cevap C.

Diğer şıklar: **A** kültürü kendi bağlamında anlamak / **B** kültürlerin etkileşimi / **D** ögelerin geçişi / **E** genel kültür içindeki grup kültürü.
:::

:::soru{cevap="A"}
Bir kültür ögesinin bir toplumdan başka bir topluma geçmesine ne ad verilir?

- A) Kültürel yayılma
- B) Kültürel gecikme
- C) Kültürel görecelik
- D) Karşı kültür
- E) Sapma

---

1. Kültürel yayılma (difüzyon), kültür ögelerinin toplumlar arasında geçişidir.
2. Doğru cevap A.

Diğer şıklar: **B** maddi ve manevi kültür arasındaki uyumsuzluk / **C** değerlendirme yaklaşımı / **D** baskın kültüre karşı çıkan kültür / **E** normdan ayrılma.
:::

:::soru{cevap="C"}
Aşağıdakilerden hangisi kültürün özelliklerinden biridir?

- A) Doğuştan getirilir.
- B) Hiçbir zaman değişmez.
- C) Öğrenilir ve nesilden nesile aktarılır.
- D) Yalnızca maddi ögelerden oluşur.
- E) Tek bir kişiye aittir.

---

1. Kültür doğuştan gelmez. Toplumsallaşma yoluyla öğrenilir ve dil gibi araçlarla kuşaktan kuşağa aktarılır.
2. Doğru cevap C.

Diğer şıklar: **A** doğuştan değil / **B** yavaş da olsa değişir / **D** manevi ögeler de var / **E** toplumsaldır.
:::

:::soru{cevap="A"}
Toplumun baskın kültürünün değerlerine açıkça karşı çıkan ve farklı değerler öneren kültüre ne ad verilir?

- A) Karşı kültür
- B) Alt kültür
- C) Baskın kültür
- D) Kitle kültürü
- E) Halk kültürü

---

1. Karşı kültür, egemen kültürün değerlerini reddeder ve alternatif bir yaşam biçimi önerir.
2. Alt kültür ise genel kültürle uyumludur. Doğru cevap A.

Diğer şıklar: **B** uyumlu grup kültürü / **C** çoğunluğun kültürü / **D** medya ile yayılan / **E** geleneksel kültür.
:::

## Kendini dene

:::dene
1. Kültürün iki ana ögesi nedir? => Maddi ve manevi kültür.
2. Kültür ile medeniyeti kim ayırmıştır? => Ziya Gökalp.
3. Kültür merkezciliğin diğer adı nedir? => Etnosentrizm.
4. Kültürün özelliklerinden birini söyle. => Öğrenilir.
5. İki kültürün sürekli teması sonucu değişmeye ne denir? => Kültürleşme (akültürasyon).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Toplum ve Kültür'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Doğduğumuz andan itibaren aile, okul, sağlık kuruluşları, hukuk ve devlet gibi yapıların içinde yaşarız. Bu yapılar toplumun ihtiyaçlarını düzenli biçimde karşılar. **Toplumsal kurumlar**, toplumun temel ihtiyaçlarını karşılamak için oluşturulmuş, norm ve rollerle düzenlenmiş kalıplaşmış ilişkiler bütünüdür. Bu konuda **kurumların ortak özelliklerini**, **başlıca kurumları** (aile, eğitim, din, ekonomi, siyaset, hukuk, sağlık), **işlevlerini**, **kurumlar arası ilişkiyi** ve **kurumlardaki değişimi** öğreneceksin.

:::hedefler
1. Toplumsal kurumun tanımını ve özelliklerini söylemek.
2. Başlıca kurumları işlevleriyle eşleştirmek.
3. Aile türlerini (çekirdek, geniş) ve ailenin işlevlerini sıralamak.
4. Weber'in otorite türlerini ayırt etmek.
5. Kurumlar arası karşılıklı ilişkiyi örnekle açıklamak.
6. Kurumlardaki değişimi toplumsal değişmeyle ilişkilendirmek.
:::

:::ipucu
Kurumu **hangi ihtiyacı karşıladığına** göre tanı: aile (üreme ve toplumsallaşma), eğitim (bilgi ve beceri aktarımı), ekonomi (üretim, dağıtım, tüketim), siyaset (yönetim ve düzen), din (anlam ve inanç), hukuk (adalet ve kural), sağlık (bedensel ve ruhsal iyilik). Bir kurumun işlevi ihmal edilirse diğerleri de etkilenir.
:::

::video{id="y_ucJLqwsAM" etiket="Konu anlatımı videosu" baslik="Toplumsal Kurumlar" kanal="Benim Hocam"}

## 1. Toplumsal kurum nedir

**Toplumsal kurum**, toplumun temel ihtiyaçlarını karşılamak üzere ortaya çıkmış, normlar, roller ve statülerden oluşan, kalıcı ve düzenli ilişkiler bütünüdür.

**Ortak özellikleri:**
- Toplumsal bir ihtiyaca cevap verir.
- Belirli norm ve roller vardır.
- Kuşaktan kuşağa aktarılır ve süreklilik taşır.
- Birbirleriyle ilişki içindedir.
- Zamanla değişir.

## 2. Aile

**Aile**, evlilik, kan bağı ya da evlat edinmeyle oluşan, toplumun en küçük ve en temel birimidir.

**Aile türleri:**
- **Çekirdek aile:** Anne, baba ve evlenmemiş çocuklardan oluşur. Kentleşmeyle yaygınlaşmıştır.
- **Geniş aile:** Birkaç kuşağın (büyükanne, büyükbaba, amca, evli çocuklar) birlikte yaşadığı aile. Kırsal ve geleneksel toplumlarda yaygındır.
- **Tek ebeveynli aile:** Çocukların yalnızca bir ebeveynle yaşadığı aile.

**İşlevleri:**
- Üreme ve neslin devamı.
- **Çocuğun ilk toplumsallaşması.**
- Duygusal destek ve güven.
- Ekonomik işlevler (barınma, bakım).
- Statü kazandırma.

**Değişim:** Kentleşme, kadının çalışma hayatına girmesi ve eğitim düzeyinin artmasıyla geniş aileden çekirdek aileye geçiş, evlilik yaşının yükselmesi, boşanma oranlarında artış gözlenir.

## 3. Eğitim

Toplumun bilgi, beceri, değer ve normlarını yeni kuşaklara sistemli biçimde aktaran kurumdur. **Örgün eğitim** (okullar) ve **yaygın eğitim** (kurslar) vardır.

**İşlevleri:** Toplumsallaşma, mesleki hazırlık, kültürün aktarımı, toplumsal hareketliliği sağlama, bilimsel ilerleme.

## 4. Ekonomi

Toplumun üretim, dağıtım ve tüketim faaliyetlerini düzenleyen kurumdur. İhtiyaçların karşılanması, işbölümü, mülkiyet, para ve piyasa bu kurumun öğeleridir.

## 5. Siyaset ve devlet

Toplumda **iktidarı** ve **otoriteyi** düzenleyen, kolektif kararlar alan ve uygulayan kurumdur.

- **İktidar (güç):** Başkalarını kendi isteğine uygun davranmaya zorlama kapasitesi.
- **Otorite:** Meşru kabul edilen iktidar. **Weber'in otorite türleri:**
  - **Geleneksel otorite:** Gelenek ve göreneklere dayanır. Krallık, aşiret reisliği.
  - **Karizmatik otorite:** Liderin olağanüstü kişisel niteliklerine duyulan inanca dayanır.
  - **Yasal-ussal otorite:** Yasalara ve kurallara dayanır. Modern devletler, bürokrasi.
- **Devlet:** Meşru güç kullanma tekelini elinde bulunduran siyasi örgüt.

## 6. Din

İnsanlara anlam, ahlak ve toplumsal bütünleşme sağlayan inanç, ibadet ve topluluk sistemidir. **Durkheim**'a göre din toplumu bir arada tutan kutsal değerlerin ifadesidir.

## 7. Hukuk ve sağlık

- **Hukuk:** Toplumsal düzeni, adaleti ve hakları koruyan yazılı kurallar sistemi. Yaptırımı devlet uygular.
- **Sağlık:** Bireylerin bedensel ve ruhsal iyilik hâlini koruyan ve geliştiren kurumlar.

## 8. Kurumlar arası ilişki

Kurumlar birbirinden bağımsız değildir. Ekonomik kriz aile gelirini, eğitim başarısını ve sağlık hizmetini etkiler. Eğitim düzeyi siyasi katılımı etkiler.

- **İşlevselcilik (Durkheim, Parsons):** Kurumlar toplumun düzenini koruyan, birbirini tamamlayan parçalardır.
- **Çatışma kuramı (Marx):** Kurumlar egemen sınıfın çıkarlarını koruyabilir.

## 9. Sık yapılan hatalar

- Çekirdek aileyi yalnızca modern dönemde var sanmak. Ancak yaygınlaşması kentleşmeyle olmuştur.
- Güç ile otoriteyi aynı sanmak. Otorite meşru kabul edilen güçtür.
- Karizmatik otoriteyi yasalara dayalı sanmak. Kişisel niteliğe dayanır.
- Hukukun yaptırımını toplumsal kınamayla karıştırmak.
- Kurumların birbirinden bağımsız olduğunu sanmak.

:::baglanti
Bu konu, **Birey ve Toplum** konusundaki toplumsallaşma kurumlarının sistematik anlatımıdır. **Toplumsal Yapı ve Değişme** konusu kurumlardaki değişimi, **Toplum ve Kültür** konusu kurumların taşıdığı değerleri işler. **Din Kültürü** dersindeki din kurumu, **Tarih** dersindeki devlet teşkilatı ve **Coğrafya** dersindeki nüfus yapısı bu konuyla ilişkilidir. **Felsefe** dersindeki siyaset felsefesi devlet ve otorite tartışmasını felsefi düzeyde sürdürür.
:::

## 10. Konuyu toparla

| Kurum | İşlev |
| --- | --- |
| Aile | Üreme, ilk toplumsallaşma |
| Eğitim | Bilgi ve değer aktarımı |
| Ekonomi | Üretim, dağıtım, tüketim |
| Siyaset | Yönetim ve otorite |
| Hukuk | Adalet ve kural |
| Karizmatik otorite | Kişisel niteliğe dayanır |

## Mini test

:::soru{cevap="A"}
Anne, baba ve evlenmemiş çocuklardan oluşan aile tipine ne ad verilir?

- A) Çekirdek aile
- B) Geniş aile
- C) Tek ebeveynli aile
- D) Karma aile
- E) Akraba grubu

---

1. Çekirdek aile, anne, baba ve evlenmemiş çocuklardan oluşur.
2. Kentleşmeyle birlikte yaygınlaşmıştır. Doğru cevap A.

Diğer şıklar: **B** birkaç kuşak bir arada / **C** tek ebeveyn / **D** yeniden evlilikle oluşan / **E** soy bağıyla bağlı daha geniş topluluk.
:::

:::soru{cevap="B"}
Weber'e göre, liderin olağanüstü kişisel niteliklerine duyulan inanca dayanan otorite türü aşağıdakilerden hangisidir?

- A) Geleneksel otorite
- B) Karizmatik otorite
- C) Yasal-ussal otorite
- D) Zorlayıcı otorite
- E) Dinî otorite

---

1. Karizmatik otorite, liderin kişisel çekiciliğine ve olağanüstü niteliklerine bağlıdır.
2. Doğru cevap B.

Diğer şıklar: **A** geleneğe dayanır / **C** yasalara dayanır / **D, E** Weber'in üç temel türü arasında değildir.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi ailenin temel işlevlerinden biridir?

- A) Çocuğun ilk toplumsallaşmasını sağlamak
- B) Ülke savunmasını yürütmek
- C) Yasaları çıkarmak
- D) Mahkeme kararlarını uygulamak
- E) Ekonomik politikaları belirlemek

---

1. Çocuk, değerleri ve normları ilk olarak ailede öğrenir.
2. Diğer şıklar devlet kurumlarının görevidir. Doğru cevap A.

Diğer şıklar: **B** savunma / **C** yasama / **D** yargı / **E** siyaset ve ekonomi kurumları.
:::

:::soru{cevap="A"}
Toplumun üretim, dağıtım ve tüketim faaliyetlerini düzenleyen kurum aşağıdakilerden hangisidir?

- A) Ekonomi
- B) Din
- C) Eğitim
- D) Aile
- E) Hukuk

---

1. Ekonomi kurumu, ihtiyaç duyulan mal ve hizmetlerin üretimini, dağıtımını ve tüketimini düzenler.
2. Doğru cevap A.

Diğer şıklar: **B** inanç / **C** bilgi aktarımı / **D** üreme ve toplumsallaşma / **E** adalet.
:::

## Kendini dene

:::dene
1. Birkaç kuşağın birlikte yaşadığı aile türü nedir? => Geniş aile.
2. Meşru kabul edilen iktidara ne denir? => Otorite.
3. Weber'in üç otorite türünü say. => Geleneksel, karizmatik ve yasal-ussal.
4. Eğitim kurumunun bir işlevini söyle. => Bilgi, beceri ve değerleri aktarmak.
5. Çekirdek aile hangi süreçle yaygınlaştı? => Kentleşme.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fel' and name = 'Toplumsal Kurumlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Felsefe nerede ve nasıl başladı? Neden insanlar evreni mitlerle değil akılla açıklamaya yöneldi? **İlk Çağ felsefesi**, Antik Yunan'da Thales ile başlayan, doğanın ilk maddesini (arkhe) arayan doğa filozoflarından Sokrates, Platon ve Aristoteles'e, oradan Helenistik ve Roma dönemine uzanan düşünce çağıdır. Bu konuda **felsefenin doğuşunu**, **Sokrates öncesi filozofları**, **Sofistleri**, **Sokrates, Platon ve Aristoteles'i** ve **Helenistik dönem okullarını** öğreneceksin.

:::hedefler
1. Felsefenin mitostan logosa geçişini açıklamak.
2. Doğa filozoflarını arkhe görüşleriyle eşleştirmek.
3. Sofistlerle Sokrates'in bilgi ve ahlak anlayışını karşılaştırmak.
4. Platon'un idealar kuramını ve Aristoteles'in madde-form anlayışını ayırt etmek.
5. Helenistik dönem okullarının (Epikurosçuluk, Stoa, Septisizm) görüşlerini söylemek.
:::

:::ipucu
Doğa filozoflarını arkhe ile ezberle: **Thales (su), Anaksimenes (hava), Anaksimandros (apeiron, sınırsız), Herakleitos (ateş ve değişim), Pythagoras (sayı), Empedokles (dört element), Demokritos (atom).** Sokrates'ten itibaren ilgi doğadan **insana** döner.
:::

::video{id="ksEzsQlFDBw" etiket="Konu anlatımı videosu" baslik="İlk Çağ Felsefesi" kanal="Benim Hocam"}

## 1. Felsefenin doğuşu

Felsefe MÖ 6. yüzyılda **İyonya**'da (Batı Anadolu'da, Milet) doğdu. İnsanlar evreni **mitlerle** (efsanelerle) açıklarken, ilk filozoflar **akla ve gözleme** dayanan açıklamalar aradı. Bu geçişe **mitostan logosa** geçiş denir. Sözcüğü ilk kullanan **Pythagoras** kabul edilir (philosophia, bilgelik sevgisi).

## 2. Sokrates öncesi: doğa filozofları

Bu filozoflar evrenin **ilk maddesini (arkhe)** aradı.

- **Thales:** Arkhe sudur. Bilinen ilk filozof.
- **Anaksimandros:** Arkhe **apeiron**dur (sınırsız, belirsiz madde).
- **Anaksimenes:** Arkhe havadır.
- **Herakleitos:** Arkhe ateştir. Her şey sürekli değişir ("Aynı ırmakta iki kez yıkanılmaz").
- **Parmenides:** Varlık tektir, değişmez ve sonsuzdur. Değişim duyuların yanılgısıdır.
- **Pythagoras:** Evrenin özü sayılardır.
- **Empedokles:** Dört element (toprak, su, hava, ateş) ve sevgi ile nefret güçleri.
- **Anaksagoras:** Nous (akıl) evreni düzenler.
- **Demokritos:** Evren boşlukta hareket eden bölünemez atomlardan oluşur. Materyalisttir.

::sim{tur="ilkcagfelsefe"}

## 3. Sofistler

MÖ 5. yüzyılda gezgin öğretmenler. Retorik (söz sanatı) öğrettiler. **Protagoras:** "İnsan her şeyin ölçüsüdür." Bilgi ve ahlak **görelidir**, herkesin doğrusu kendinedir. Sokrates onları eleştirdi.

## 4. Sokrates (MÖ 470-399)

- İlgiyi doğadan **insana** çevirdi. Yazı yazmadı. Düşünceleri öğrencilerinden öğrenilir.
- **Yöntemi:** **Diyalog** (karşılıklı konuşma). İki aşama: **İroni** (bilmediğini kabul ettirme) ve **ebelik** (doğru bilginin ortaya çıkmasına yardım).
- **Erdem bilgidir.** İyiyi bilen kötü davranmaz.
- **Evrensel doğru** vardır. Sofistlerin görecelik anlayışını reddetti.
- Gençleri yoldan çıkarmak ve tanrıları tanımamakla suçlanıp ölüme mahkûm edildi.

## 5. Platon (MÖ 427-347)

- Sokrates'in öğrencisi, **Akademia**'nın kurucusu.
- **İdealar kuramı:** Gerçek varlık, değişmeyen ve mükemmel **ideaların** dünyasıdır. Duyularla algıladığımız dünya ideaların gölgesidir. Bilgi, duyu ile değil akılla elde edilir.
- **Mağara alegorisi:** İnsanlar mağarada gölgeleri gerçek sanır. Filozof dışarı çıkıp gerçeği görür.
- **İdeal devlet:** Yöneticiler filozoflardır (Devlet eseri). Toplum yöneticiler, askerler ve üreticilerden oluşur.
- **Ruh:** Ölümsüzdür ve ideaların dünyasından gelmiştir.

## 6. Aristoteles (MÖ 384-322)

- Platon'un öğrencisi, **Lykeion**'un kurucusu, İskender'in hocası.
- **Madde ve form:** Varlık maddeden ve formdan oluşur. Form, nesnede bulunur (idealar ayrı bir dünyada değildir). Platon'un idealar kuramını eleştirdi.
- **Mantığın kurucusu.** Kıyas kuramı.
- **Ahlak:** Erdem, iki aşırı uç arasındaki **orta yoldur** (cesaret, korkaklık ile gözü karalık arası).
- **Siyaset:** İnsan "toplumsal hayvandır."
- **Dört neden:** Maddi, formel, etkin ve ereksel neden.

## 7. Helenistik dönem (MÖ 4. yüzyıldan itibaren)

İskender sonrası dönemde felsefenin ilgisi insanın mutlu yaşamına kayar.

- **Epikuros (Epikurosçuluk):** Mutluluk haz ve ruh dinginliğidir (ataraksia). Haz, acıdan kurtuluş ve sade yaşamdır. Ölümden korkmaya gerek yoktur.
- **Stoa (Zenon, Epiktetos, Marcus Aurelius):** Doğaya uygun yaşamak. Akla uygun davranmak ve tutkulara hâkim olmak. Kadere razı olmak.
- **Septisizm (kuşkuculuk, Pyrrhon):** Kesin bilgiye ulaşılamaz. Yargıdan kaçınmak (epokhe) ruh huzuru getirir.
- **Yeni Platonculuk (Plotinos, MS 3. yüzyıl):** Her şey Bir'den taşar (sudur).

## 8. Sık yapılan hatalar

- Parmenides ile Herakleitos'u karıştırmak. Parmenides değişmeyen varlığı, Herakleitos sürekli değişimi savunur.
- Sokrates'in yazı yazdığını sanmak.
- Platon ile Aristoteles'in form anlayışını karıştırmak. Platon'da idea ayrı dünyadadır, Aristoteles'te nesnededir.
- Sofistlerin evrensel doğruyu savunduğunu sanmak. Görecelikçidirler.
- Epikuros'u sınırsız hazcı sanmak. Haz, sade yaşam ve ruh dinginliğidir.

:::baglanti
Bu konu, TYT'deki **Felsefeye Giriş**, **Bilgi Felsefesi**, **Varlık Felsefesi** ve **Ahlak Felsefesi** konularındaki ilk düşünceleri tarihsel sıra içinde toplar. **15. ve 17. Yüzyıl Felsefesi** konusu bu mirasın sonrasını işler. **Mantığa Giriş** konusundaki Aristoteles ve **Klasik Mantık** konusundaki kıyas bu dönemden gelir. **Tarih** dersindeki İlk Çağ uygarlıkları ve **Edebiyat** dersindeki destanlar bu felsefenin zeminini oluşturur.
:::

## 9. Konuyu toparla

| Filozof | Görüşü |
| --- | --- |
| Thales | Arkhe su |
| Anaksimandros | Arkhe apeiron |
| Herakleitos | Her şey değişir, arkhe ateş |
| Parmenides | Varlık değişmez |
| Demokritos | Atom |
| Sokrates | Diyalog, erdem bilgidir |
| Platon | İdealar kuramı |
| Aristoteles | Madde-form, orta yol |

## Mini test

:::soru{cevap="E"}
Evrenin ilk maddesinin (arkhe) apeiron, yani sınırsız ve belirsiz bir madde olduğunu savunan filozof aşağıdakilerden hangisidir?

- A) Thales
- B) Anaksimenes
- C) Herakleitos
- D) Demokritos
- E) Anaksimandros

---

1. Anaksimandros'a göre evrenin kaynağı sınırsız ve belirsiz bir maddedir, yani apeirondur.
2. Doğru cevap E.

Diğer şıklar: **A** su / **B** hava / **C** ateş / **D** atom.
:::

:::soru{cevap="B"}
Erdemin bilgi olduğunu savunan ve diyalog yöntemini (ironi ve ebelik) kullanan filozof aşağıdakilerden hangisidir?

- A) Platon
- B) Sokrates
- C) Aristoteles
- D) Protagoras
- E) Epikuros

---

1. Sokrates "erdem bilgidir" der ve soru-cevap yoluyla doğruya ulaşmayı öğretir.
2. Doğru cevap B.

Diğer şıklar: **A** idealar kuramı / **C** madde ve form / **D** sofist, görecelikçi / **E** haz ve ruh dinginliği.
:::

:::soru{cevap="A"}
Platon'a göre duyularla algılanan nesneler aşağıdakilerden hangisinin gölgeleridir?

- A) İdeaların
- B) Atomların
- C) Formların
- D) Arkhenin
- E) Sayıların

---

1. Platon'a göre gerçek varlık değişmeyen ideaların dünyasıdır. Duyularla algıladığımız dünya onun gölgesidir.
2. Mağara alegorisi bunu anlatır. Doğru cevap A.

Diğer şıklar: **B** Demokritos / **C** Aristoteles'in kavramı / **D** doğa filozoflarının ilk maddesi / **E** Pythagoras.
:::

:::soru{cevap="B"}
Aristoteles'in ahlak anlayışına göre erdem aşağıdakilerden hangisidir?

- A) Hazzı sürekli artırmak
- B) İki uç arasındaki orta yol
- C) Yalnızca bilgi sahibi olmak
- D) Doğaya uygun yaşamak
- E) Acıdan tamamen kaçınmak

---

1. Aristoteles'e göre erdem aşırılık ve eksiklik arasındaki orta yoldur.
2. Örneğin cesaret, korkaklık ile gözü karalık arasındadır. Doğru cevap B.

Diğer şıklar: **A** haz anlayışı / **C** Sokrates / **D** Stoa / **E** Epikuros'un amacı.
:::

## Kendini dene

:::dene
1. Felsefe nerede doğdu? => İyonya'da (Milet).
2. Thales'e göre arkhe nedir? => Su.
3. Sokrates'in yöntemi nedir? => Diyalog (ironi ve ebelik).
4. Platon'un okulunun adı nedir? => Akademia.
5. Aristoteles'in kurduğu okul hangisidir? => Lykeion.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = 'MÖ 6. Yüzyıl ile MS 2. Yüzyıl Felsefesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Orta Çağ'ın dinî otoritesinden sonra Avrupa'da akıl ve deneyim yeniden merkeze alındı. **Rönesans**, **Reform** ve **bilimsel gelişmeler** yeni bir düşünce ortamı yarattı. 17. yüzyılda bilginin kaynağı konusunda iki büyük akım ortaya çıktı: **rasyonalizm** (akılcılık) ve **empirizm** (deneycilik). Bu konuda **Rönesans ve hümanizmi**, **Bacon, Descartes, Spinoza, Leibniz, Hobbes, Locke ve Berkeley'i** ve **rasyonalizm ile empirizmin farklarını** öğreneceksin.

:::hedefler
1. Rönesans ve hümanizmin felsefeye etkisini açıklamak.
2. Rasyonalizm ve empirizmi bilginin kaynağı açısından karşılaştırmak.
3. Descartes'ın yöntemli kuşkusunu ve cogito ilkesini yorumlamak.
4. Bacon ve Locke'un deneye dayalı bilgi anlayışını söylemek.
5. Spinoza, Leibniz ve Berkeley'in görüşlerini eşleştirmek.
:::

:::ipucu
Ayrımı bilginin **kaynağı** ile yap: **akıl** doğuştan bilgi verir ve evrensel, zorunlu bilgiye götürür (**rasyonalizm**: Descartes, Spinoza, Leibniz). **Deneyim** bilginin tek kaynağıdır ve zihin doğuşta boştur (**empirizm**: Bacon, Hobbes, Locke, Berkeley, Hume).
:::

::video{id="IGPo58-hI54" etiket="Konu anlatımı videosu" baslik="Rönesans Felsefesi" kanal="Benim Hocam"}

## 1. Rönesans ve Reform

- **Rönesans (15. ve 16. yüzyıl):** İtalya'da başladı. İnsan, doğa ve bilim merkezli düşünce. Eski Yunan ve Roma eserleri yeniden okundu. **Hümanizm:** İnsanın değeri ve aklı vurgulandı.
- **Machiavelli:** **Hükümdar** eserinde siyaseti ahlak ve dinden ayırdı. Güç ve çıkar ilişkilerini çözümledi.
- **Reform:** Dinî otoriteyi sorguladı (Luther, 1517).
- **Bilimsel gelişmeler:** Kopernik (Güneş merkezli sistem), Galileo ve Kepler. Doğa matematikle ve deneyle incelenmeye başlandı. Aristoteles fiziği ve kilise otoritesi sarsıldı.

## 2. Bacon (1561-1626)

- **Empirizmin öncüsü.** "Bilgi güçtür."
- **Novum Organum:** Aristoteles'in kıyas yerine **tümevarıma** dayanan yeni yöntem.
- **Idoller (yanılgılar):** Zihni yanıltan engeller. Soy, mağara, çarşı (dil) ve tiyatro idolleri. Önyargılardan arınmak gerekir.
- Deney ve gözlemle doğa yasalarına ulaşılır.

## 3. Rasyonalizm

**Descartes (1596-1650):** Rasyonalizmin kurucusu.
- **Yöntemli kuşku:** Doğruluğundan emin olmadığı her şeyden kuşku duyar. Duyular aldatabilir.
- **Cogito ergo sum** ("Düşünüyorum, öyleyse varım"): Kuşku duyan düşünce vardır, bu kesindir. İlk kesin bilgi budur.
- **Doğuştan ideler:** Tanrı, ruh, sonsuzluk gibi akılda doğuştan bulunan ideler.
- **Düalizm:** Töz iki türdür: **düşünce** (ruh) ve **yer kaplama** (madde).
- **Matematik yöntem:** Açık ve seçik doğrulardan tümdengelim.

**Spinoza (1632-1677):**
- **Tek töz** vardır. O da Tanrı ya da doğadır (monizm ve panteizm).
- Ethica eserinde geometrik yöntemle ahlak ve metafizik.

**Leibniz (1646-1716):**
- Evren sayısız **monaddan** (bölünemez, ruhsal birimler) oluşur.
- **Yeter sebep ilkesi.** Mümkün dünyaların en iyisinde yaşıyoruz.

## 4. Empirizm

**Hobbes (1588-1679):** Materyalist, mekanist. **Toplum sözleşmesi:** Doğal durumda "insan insanın kurdudur." Güvenlik için güçlü devlet gerekir (Leviathan).

**Locke (1632-1704):**
- **Boş levha (tabula rasa):** Zihin doğuşta boştur. Doğuştan idelere karşı çıktı. Bilgi **deneyimden** gelir (duyum ve düşünme).
- **Siyaset:** Doğal haklar (yaşam, özgürlük, mülkiyet). Sınırlı iktidar, güçler ayrılığı. Liberalizmin kurucusu sayılır.

**Berkeley (1685-1753):**
- **"Olmak, algılanmaktır."** Maddenin bağımsız varlığı yoktur. Nesneler yalnızca algılandıkları sürece vardır.
- **Öznel idealizm.** Empirizmi uç noktaya götürdü.

::sim{tur="felsefe17"}

## 5. Rasyonalizm ve empirizm

| | Rasyonalizm | Empirizm |
| --- | --- | --- |
| Bilginin kaynağı | Akıl | Deneyim |
| Doğuştan idea | Vardır | Yoktur |
| Yöntem | Tümdengelim | Tümevarım |
| Temsilciler | Descartes, Spinoza, Leibniz | Bacon, Locke, Berkeley, Hume |

Bu iki akımı **Kant** 18. yüzyılda uzlaştırmaya çalışacaktır.

## 6. Sık yapılan hatalar

- Bacon'ı rasyonalist saymak. Empiristtir.
- Berkeley'i rasyonalist sanmak. Deneyi vurgulayan idealisttir.
- Cogito'yu bir inanç sanmak. Yöntemli kuşkunun sonunda ulaşılan kesin bilgidir.
- Locke'un doğuştan ideleri kabul ettiğini sanmak. Reddeder.
- Spinoza'yı düalist sanmak. Tek töz kabul eder.

:::baglanti
Bu konu, **MÖ 6. Yüzyıl ile MS 2. Yüzyıl Felsefesi** konusunun sonrasındadır ve **18. ve 19. Yüzyıl Felsefesi** konusuna zemin hazırlar. TYT'deki **Bilgi Felsefesi** (rasyonalizm, empirizm) bu konunun kavramsal özetidir. **Mantığa Giriş** konusundaki Bacon ve Leibniz, **Tarih** dersindeki Rönesans ve Reform bu konuyla ilişkilidir. **Fizik** dersindeki bilimsel yöntem, Bacon ve Galileo'nun mirasıdır.
:::

## 7. Konuyu toparla

| Düşünür | Görüş |
| --- | --- |
| Bacon | Tümevarım, idoller |
| Descartes | Cogito, doğuştan ide, düalizm |
| Spinoza | Tek töz, panteizm |
| Leibniz | Monad, yeter sebep |
| Hobbes | Güçlü devlet, toplum sözleşmesi |
| Locke | Boş levha, doğal haklar |
| Berkeley | Olmak algılanmaktır |

## Mini test

:::soru{cevap="C"}
"Düşünüyorum, öyleyse varım." ilkesine yöntemli kuşku sonunda ulaşan rasyonalist düşünür aşağıdakilerden hangisidir?

- A) Bacon
- B) Locke
- C) Descartes
- D) Hume
- E) Berkeley

---

1. Descartes duyuların ve bilgilerin doğruluğundan kuşku duydu. Kuşku duyan düşüncenin varlığından ise kuşku duyamadı.
2. Doğru cevap C.

Diğer şıklar: **A** empirist, tümevarım / **B** boş levha / **D** kuşkucu empirist / **E** olmak algılanmaktır.
:::

:::soru{cevap="B"}
Zihnin doğuşta boş bir levha olduğunu, bilginin deneyimden geldiğini savunan düşünür aşağıdakilerden hangisidir?

- A) Descartes
- B) Locke
- C) Spinoza
- D) Leibniz
- E) Machiavelli

---

1. Locke doğuştan idelere karşı çıkar ve zihni boş levhaya benzetir.
2. Bilgi duyum ve düşünme yoluyla edinilir. Doğru cevap B.

Diğer şıklar: **A, C, D** rasyonalist / **E** siyasetçi ve düşünür.
:::

:::soru{cevap="A"}
Bilginin güç olduğunu söyleyen ve Novum Organum'da tümevarım yöntemini savunan düşünür aşağıdakilerden hangisidir?

- A) Francis Bacon
- B) Descartes
- C) Spinoza
- D) Berkeley
- E) Leibniz

---

1. Bacon deney ve gözleme dayalı tümevarım yöntemini öne çıkarmıştır.
2. Zihni yanıltan idolleri de eleştirmiştir. Doğru cevap A.

Diğer şıklar: **B, C, E** rasyonalist / **D** idealist empirist.
:::

:::soru{cevap="C"}
"Olmak, algılanmaktır." ilkesini savunan düşünür aşağıdakilerden hangisidir?

- A) Hobbes
- B) Spinoza
- C) Berkeley
- D) Leibniz
- E) Machiavelli

---

1. Berkeley'e göre nesneler yalnızca algılandıkları sürece vardır.
2. Bu görüşe öznel idealizm denir. Doğru cevap C.

Diğer şıklar: **A** materyalist / **B** tek töz / **D** monad / **E** siyaset kuramı.
:::

## Kendini dene

:::dene
1. Rasyonalizm bilginin kaynağını nerede görür? => Akılda.
2. Empirizm bilginin kaynağını nerede görür? => Deneyimde.
3. Descartes'ın temel ilkesi nedir? => Düşünüyorum, öyleyse varım.
4. Locke'a göre zihin doğuşta nasıldır? => Boş levhadır.
5. Leibniz'e göre evren neyden oluşur? => Monadlardan.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = '15. ve 17. Yüzyıl Felsefesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

18. yüzyıl akla güvenin zirveye çıktığı **Aydınlanma Çağı**'dır. 19. yüzyılda ise bilim, sanayi ve toplumsal sorunlar felsefeyi yeni yönlere itti. Bu konuda **Aydınlanma düşüncesini**, **Hume ve Kant'ı**, **Hegel'in diyalektiğini**, **pozitivizmi** (Comte), **faydacılığı** (Mill), **Marx'ı**, **Schopenhauer, Kierkegaard ve Nietzsche'yi** öğreneceksin.

:::hedefler
1. Aydınlanmanın temel ilkelerini sıralamak.
2. Kant'ın bilgi ve ahlak felsefesini özetlemek.
3. Hegel'in diyalektik yöntemini açıklamak.
4. Pozitivizm, faydacılık ve Marksizmi ayırt etmek.
5. Schopenhauer, Kierkegaard ve Nietzsche'nin görüşlerini eşleştirmek.
:::

:::ipucu
Kant'ı **uzlaştırıcı** olarak hatırla: bilgide **akıl** (form) ve **deneyim** (içerik) birlikte gerekir ("Deneyimsiz akıl boştur, aklısız deneyim kördür" anlayışı). Ahlakta ise **niyet ve ödev** esastır: **kategorik imperatif.** Faydacılar (Mill) ise eylemin **sonucuna** bakar.
:::

::video{id="hPB6-OB-igg" etiket="Konu anlatımı videosu" baslik="Aydınlanma Felsefesi" kanal="Benim Hocam"}

## 1. Aydınlanma Çağı (18. yüzyıl)

Akla, bilime, özgürlüğe ve ilerlemeye güven. Dinî ve siyasi otoriteler sorgulandı.

- **Voltaire:** Hoşgörü ve düşünce özgürlüğü.
- **Montesquieu:** **Güçler ayrılığı** (yasama, yürütme, yargı).
- **Rousseau:** **Toplum Sözleşmesi.** Genel irade. İnsan doğuştan iyidir, toplum bozar.
- **Diderot ve d'Alembert:** Ansiklopedi.

Fransız İhtilali Aydınlanma düşüncesinden beslendi.

## 2. Hume (1711-1776)

- **Empirist ve kuşkucu.** Bilgi izlenimlere dayanır.
- **Nedensellik** gerçek bir bağ değil, olayların birbirini izlemesinden doğan **alışkanlık**tır. Bu görüş bilimin kesinliğini sarstı ve Kant'ı uyandırdı.

## 3. Kant (1724-1804)

- **Eleştirel felsefe.** Rasyonalizm ve empirizmi uzlaştırdı. **Saf Aklın Eleştirisi.**
- **Bilgi:** Deneyim olmadan bilgi olmaz. Ancak akıl da deneyimi kendi **a priori** (deneyimden bağımsız) kalıplarla (zaman, uzay, nedensellik gibi kategoriler) düzenler.
- **Fenomen ve numen:** Biz yalnızca nesnelerin bize görünen yüzünü (fenomen) bilebiliriz, kendinde şeyi (numen) bilemeyiz.
- **Ahlak:** Eylemin değeri sonucunda değil **niyetinde ve ödevinde** yatar. **Kategorik imperatif:** "Öyle davran ki davranışının ilkesi evrensel yasa olabilsin." İnsana bir araç değil, amaç olarak davranılmalıdır. Pratik Aklın Eleştirisi.

## 4. Hegel (1770-1831)

- **Nesnel idealizm.** Gerçek, **mutlak tin**in tarihte kendini gerçekleştirmesidir.
- **Diyalektik yöntem:** **Tez, antitez ve sentez.** Çelişkiler yeni bir bütünde aşılır ve tarih bu yolla ilerler.
- Devlet ahlaki bir bütünlüktür. "Akla uygun olan gerçektir."

## 5. Pozitivizm ve faydacılık

- **Auguste Comte (1798-1857):** **Pozitivizm.** Gerçek bilgi yalnızca gözlem ve deneye dayanan bilimsel bilgidir. **Üç hâl yasası:** Teolojik, metafizik, pozitif. Sosyolojinin kurucusu.
- **John Stuart Mill (1806-1873):** **Faydacılık (utilitarizm).** Doğru eylem, **en çok sayıda kişiye en çok mutluluk** sağlayan eylemdir. Özgürlük üzerine eseri, bireysel özgürlüğün yalnızca başkasına zarar vermedikçe sınırlanabileceğini savunur.

## 6. Marx (1818-1883)

- **Tarihsel materyalizm:** Toplumun temeli **ekonomik altyapıdır**, hukuk, din, siyaset gibi **üstyapıyı** belirler.
- **Sınıf mücadelesi:** Tarih, üretim araçlarına sahip sınıfla (burjuvazi) emekçi sınıf (proletarya) arasındaki mücadeledir.
- **Yabancılaşma:** İşçi ürettiği ürüne ve emeğine yabancılaşır.
- **Diyalektik materyalizm:** Hegel'in diyalektiğini madde temelinde uyguladı. Kapital, Komünist Manifesto.

## 7. Schopenhauer, Kierkegaard ve Nietzsche

- **Schopenhauer (1788-1860):** Dünya **irade ve tasavvurdur.** Hayatın özü bitmeyen istektir ve acı çekmenin kaynağıdır. Kötümser felsefe.
- **Kierkegaard (1813-1855):** **Varoluşçuluğun öncüsü.** Birey, kaygı ve seçim içinde var olur. Hakikat öznel yaşantıdır. İman sıçrayışı.
- **Nietzsche (1844-1900):** "Tanrı öldü." Geleneksel değerler çöktü. **Üstinsan** ve **güç istenci.** Değerlerin yeniden değerlendirilmesi. Böyle Buyurdu Zerdüşt.

::sim{tur="felsefe19"}

## 8. Sık yapılan hatalar

- Kant'ı salt empirist ya da rasyonalist saymak. İkisini uzlaştırır.
- Kant'ın ahlak anlayışında sonuca bakıldığını sanmak. Niyet ve ödev esastır.
- Mill'in faydacılığını bencillik sanmak. Toplumsal mutluluğu hedefler.
- Hegel ile Marx'ın diyalektiğini aynı sanmak. Hegel idealist, Marx materyalisttir.
- Nietzsche'yi pozitivist sanmak.

:::baglanti
Bu konu, **15. ve 17. Yüzyıl Felsefesi** konusundaki rasyonalizm ve empirizmin sonrasını işler ve **20. Yüzyıl Felsefesi** konusuna geçiş sağlar. **Sosyolojiye Giriş** konusundaki Comte ve Marx, **Toplumsal Yapı ve Değişme** konusundaki sınıf anlayışı bu başlıkla bağlantılıdır. TYT'deki **Ahlak Felsefesi** (Kant, faydacılık) ve **Siyaset Felsefesi** (Rousseau, Montesquieu) bu konunun özetidir. **Tarih** dersindeki Fransız İhtilali bu düşüncenin sonucudur.
:::

## 9. Konuyu toparla

| Düşünür | Görüş |
| --- | --- |
| Kant | A priori, fenomen-numen, kategorik imperatif |
| Hegel | Diyalektik, mutlak tin |
| Comte | Pozitivizm, üç hâl yasası |
| Mill | Faydacılık |
| Marx | Sınıf mücadelesi, altyapı-üstyapı |
| Kierkegaard | Varoluşçuluğun öncüsü |
| Nietzsche | Üstinsan, güç istenci |

## Mini test

:::soru{cevap="B"}
Bilginin hem akıl hem deneyimle oluştuğunu savunan, fenomen ve numen ayrımını yapan filozof aşağıdakilerden hangisidir?

- A) Hume
- B) Kant
- C) Hegel
- D) Comte
- E) Marx

---

1. Kant rasyonalizm ve empirizmi uzlaştırdı. Akıl ve deneyimin birlikte bilgi oluşturduğunu savundu.
2. Fenomen ve numen ayrımı da ona aittir. Doğru cevap B.

Diğer şıklar: **A** kuşkucu empirist / **C** diyalektik / **D** pozitivizm / **E** tarihsel materyalizm.
:::

:::soru{cevap="E"}
Pozitivizmin kurucusu olan ve üç hâl yasasını ortaya koyan düşünür aşağıdakilerden hangisidir?

- A) Marx
- B) Hegel
- C) Nietzsche
- D) Mill
- E) Comte

---

1. Comte'a göre insan düşüncesi teolojik, metafizik ve pozitif hâllerden geçer.
2. Pozitivizmde yalnızca gözleme dayalı bilimsel bilgi gerçek bilgidir. Doğru cevap E.

Diğer şıklar: **A** sınıf mücadelesi / **B** mutlak tin / **C** üstinsan / **D** faydacılık.
:::

:::soru{cevap="B"}
Faydacılığa (utilitarizm) göre doğru eylem aşağıdakilerden hangisidir?

- A) Niyeti iyi olan eylem
- B) En çok kişiye en çok mutluluk sağlayan eylem
- C) Geleneklere uygun eylem
- D) Evrensel yasa olabilecek ilkeye dayanan eylem
- E) Kişinin kendi çıkarına olan eylem

---

1. Mill'e göre eylemin değeri sonuçlarının sağladığı mutlulukla ölçülür.
2. Doğru cevap B.

Diğer şıklar: **A, D** Kant'ın niyet ve ödev anlayışı / **C** gelenekçilik / **E** bencillik.
:::

:::soru{cevap="E"}
"Tanrı öldü." diyen, üstinsan ve güç istenci kavramlarını savunan filozof aşağıdakilerden hangisidir?

- A) Schopenhauer
- B) Kierkegaard
- C) Marx
- D) Mill
- E) Nietzsche

---

1. Nietzsche geleneksel değerlerin çöktüğünü söyler ve yeni değerler yaratacak üstinsanı öne çıkarır.
2. Doğru cevap E.

Diğer şıklar: **A** irade / **B** varoluşçuluğun öncüsü / **C** sınıf mücadelesi / **D** faydacılık.
:::

## Kendini dene

:::dene
1. Güçler ayrılığını kim ortaya koydu? => Montesquieu.
2. Kant'ın ahlak ilkesinin adı nedir? => Kategorik imperatif.
3. Hegel'in diyalektiği hangi üç aşamadan oluşur? => Tez, antitez, sentez.
4. Marx'a göre toplumun temeli nedir? => Ekonomik altyapı.
5. Varoluşçuluğun öncüsü kimdir? => Kierkegaard.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fel' and name = '18. ve 19. Yüzyıl Felsefesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

20. yüzyıl, iki dünya savaşı, bilimsel ve teknolojik atılımlar ve büyük toplumsal dönüşümlerle felsefenin çok farklı yönlere dağıldığı bir çağdır. Bu konuda **fenomenolojiyi**, **varoluşçuluğu**, **analitik felsefeyi ve mantıksal pozitivizmi**, **bilim felsefesini** (Popper, Kuhn), **eleştirel kuramı** (Frankfurt Okulu), **pragmatizmi** ve **postmodern düşünürleri** (Foucault, Derrida) öğreneceksin.

:::hedefler
1. 20. yüzyıl felsefesinin başlıca akımlarını sıralamak.
2. Fenomenoloji ve varoluşçuluğu karşılaştırmak.
3. Mantıksal pozitivizmin ve analitik felsefenin dil anlayışını açıklamak.
4. Popper ve Kuhn'un bilim anlayışlarını ayırt etmek.
5. Pragmatizm, eleştirel kuram ve postmodernizmi tanımak.
:::

:::ipucu
Akımları **neye odaklandıklarıyla** hatırla: **fenomenoloji** (bilinç ve yaşantı), **varoluşçuluk** (birey ve özgürlük), **analitik felsefe** (dil ve mantık), **bilim felsefesi** (bilimin yöntemi), **eleştirel kuram** (toplum eleştirisi), **postmodernizm** (büyük anlatılara ve kesin anlama kuşku).
:::

::video{id="7UK99BH1HaE" etiket="Konu anlatımı videosu" baslik="Çağdaş Felsefe" kanal="Benim Hocam"}

## 1. Fenomenoloji

- **Husserl (1859-1938):** Kurucusu. "Şeylerin kendisine dönelim." Bilincin yaşantılarını, önyargılardan arınarak (parantez içine alma) betimler.
- **Yönelimsellik:** Bilinç her zaman bir şeye yönelmiştir.
- Bilimin ve felsefenin sağlam bir temele oturması amaçlanır.

## 2. Varoluşçuluk

İnsanın somut varoluşu, özgürlüğü ve sorumluluğu üzerine felsefedir. Öncüsü Kierkegaard'dır.

- **Heidegger (1889-1976):** **Varlık ve Zaman.** İnsan dünyaya atılmış bir varlıktır (Dasein). Ölüm ve kaygı varoluşun parçasıdır.
- **Sartre (1905-1980):** **"Varoluş özden önce gelir."** İnsan önce vardır, sonra seçimleriyle kendini yaratır. **İnsan özgürlüğe mahkûmdur.** Varlık ve Hiçlik.
- **Camus:** Absürt. Hayatın anlamsızlığına karşı başkaldırı.
- **Jaspers, Marcel.**

Sartre'a göre insan özgürdür ve her seçimden sorumludur. Seçimlerinden kaçmak kötü niyettir.

## 3. Analitik felsefe ve mantıksal pozitivizm

- **Russell, Moore, Frege:** Felsefenin temel işi **dil ve kavram çözümlemesidir.**
- **Wittgenstein (1889-1951):** **Tractatus**'ta dil ve dünyanın mantıksal yapısını inceledi. Daha sonra **Felsefi Soruşturmalar**'da anlamın dilin **kullanımında** aranması gerektiğini savundu (dil oyunları).
- **Viyana Çevresi (Carnap, Schlick):** **Mantıksal pozitivizm.** Anlamlı önermeler yalnızca **doğrulanabilir** önermelerdir. Metafizik önermeler doğrulanamadığı için anlamsızdır.

## 4. Bilim felsefesi

- **Popper (1902-1994):** **Yanlışlanabilirlik.** Bilimsel kuramlar ancak gözlemle çürütülebilir olduklarında bilimseldir. Doğrulama değil yanlışlama ölçüttür. **Açık toplum** ve otoriter ideolojilere karşı savunma.
- **Kuhn (1922-1996):** Bilim birikimle değil **paradigma** değişimleriyle ilerler. **Normal bilim** paradigmanın içinde sürer, **kriz** çıkar, yeni paradigma gelir.
- **Feyerabend:** Bilimde tek yöntem yoktur ("her şey mübah").
- **Lakatos:** Araştırma programları.

## 5. Eleştirel kuram, pragmatizm ve postmodernizm

- **Frankfurt Okulu (Adorno, Horkheimer, Marcuse):** **Eleştirel kuram.** Modern toplumda kültür endüstrisi ve teknik akıl bireyi nesneleştirir. Marcuse'nin **tek boyutlu insan** eleştirisi.
- **Pragmatizm (Peirce, James, Dewey):** Bir düşüncenin doğruluğu **pratik sonuçlarıyla** ölçülür. Dewey'nin eğitim anlayışı etkilidir.
- **Hermeneutik (Gadamer):** Yorumlama ve anlama sanatı.
- **Foucault (1926-1984):** Bilgi ile **iktidar** arasındaki ilişki. Hapishane, akıl hastanesi ve klinik gibi kurumları çözümledi.
- **Derrida (1930-2004):** **Yapıbozum.** Metinlerde kesin ve tek anlam fikrini ve ikili karşıtlıkları sorguladı.
- **Postmodernizm:** Büyük anlatılara ve tek hakikat iddiasına kuşku.

::sim{tur="felsefe20"}

## 6. Sık yapılan hatalar

- Varoluşçulukla fenomenolojiyi aynı sanmak. İkisi ilişkilidir ama aynı değildir.
- Popper'ın doğrulamayı ölçüt aldığını sanmak. O yanlışlanabilirliği savunur.
- Kuhn'u birikimci bilim anlayışının savunucusu sanmak. Paradigma değişimlerini savunur.
- Wittgenstein'ın anlamı tek bir dönemde aradığını sanmak. Düşüncesi iki dönemlidir.
- Sartre'a göre özün varoluştan önce geldiğini sanmak. Tersidir.

:::baglanti
Bu konu, **18. ve 19. Yüzyıl Felsefesi** konusunun devamıdır ve felsefe tarihi dizisini tamamlar. **Mantık ve Dil** ile **Sembolik Mantık** konuları analitik felsefenin kaynağıdır. TYT'deki **Bilim Felsefesi** (Popper, Kuhn) bu konunun özetini verir. **Psikoloji Bilimini Tanıyalım** konusundaki hümanistik psikoloji varoluşçu felsefeyle, **Toplumsal Kurumlar** konusundaki iktidar tartışması Foucault ile ilişkilidir. **Tarih** dersindeki dünya savaşları ve Soğuk Savaş düşüncenin arka planıdır.
:::

## 7. Konuyu toparla

| Akım / isim | Odak |
| --- | --- |
| Husserl | Fenomenoloji, yönelimsellik |
| Sartre | Varoluş özden önce gelir |
| Heidegger | Dasein, kaygı |
| Viyana Çevresi | Doğrulama ölçütü |
| Popper | Yanlışlanabilirlik |
| Kuhn | Paradigma değişimi |
| Foucault | Bilgi ve iktidar |
| Derrida | Yapıbozum |

## Mini test

:::soru{cevap="D"}
"Varoluş özden önce gelir." ve "İnsan özgürlüğe mahkûmdur." görüşlerini savunan filozof aşağıdakilerden hangisidir?

- A) Husserl
- B) Popper
- C) Kuhn
- D) Sartre
- E) Foucault

---

1. Sartre'a göre insan önce vardır, sonra seçimleriyle özünü oluşturur.
2. İnsan her seçimden sorumlu olduğu için özgürlüğe mahkûmdur. Doğru cevap D.

Diğer şıklar: **A** fenomenoloji / **B** yanlışlanabilirlik / **C** paradigma / **E** bilgi ve iktidar.
:::

:::soru{cevap="B"}
Bilimsel bir kuramın bilimsel sayılabilmesi için yanlışlanabilir olması gerektiğini savunan düşünür aşağıdakilerden hangisidir?

- A) Kuhn
- B) Popper
- C) Wittgenstein
- D) Carnap
- E) Russell

---

1. Popper'a göre bilimsel kuramlar gözlemle çürütülebilir olmalıdır.
2. Doğrulama değil yanlışlanabilirlik ölçüttür. Doğru cevap B.

Diğer şıklar: **A** paradigma / **C** dil felsefesi / **D** doğrulama ölçütü / **E** analitik felsefe.
:::

:::soru{cevap="D"}
Fenomenolojinin kurucusu ve "Şeylerin kendisine dönelim." diyen filozof aşağıdakilerden hangisidir?

- A) Heidegger
- B) Sartre
- C) Derrida
- D) Husserl
- E) Foucault

---

1. Husserl, bilincin yaşantılarını önyargılardan arınarak betimleyen fenomenolojiyi kurdu.
2. Doğru cevap D.

Diğer şıklar: **A, B** varoluşçu / **C** yapıbozum / **E** iktidar ve bilgi.
:::

:::soru{cevap="C"}
Mantıksal pozitivistlere göre aşağıdakilerden hangisi doğrudur?

- A) Metafizik önermeler en yüksek bilgidir.
- B) Anlam yalnızca dilin kullanımında aranır.
- C) Doğrulanamayan önermeler anlamsızdır.
- D) Bilimsel kuramlar asla çürütülemez.
- E) Her önerme aynı derecede anlamlıdır.

---

1. Viyana Çevresi'ne göre bir önerme ancak deneyle doğrulanabiliyorsa anlamlıdır.
2. Metafizik önermeler bu ölçüte uymadığı için anlamsız sayılır. Doğru cevap C.

Diğer şıklar: **A** tersi / **B** geç dönem Wittgenstein / **D** Popper'a karşıt / **E** ölçütle çelişir.
:::

## Kendini dene

:::dene
1. Fenomenolojinin kurucusu kimdir? => Husserl.
2. Sartre'a göre insan nasıl bir varlıktır? => Özgürlüğe mahkûmdur.
3. Popper'ın bilimsellik ölçütü nedir? => Yanlışlanabilirlik.
4. Kuhn'un temel kavramı nedir? => Paradigma.
5. Foucault neyi inceledi? => Bilgi ile iktidar ilişkisini.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-fel' and name = '20. Yüzyıl Felsefesi'
on conflict (topic_id) do nothing;

