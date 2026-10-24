-- 20261024100000_lessons_ayt_cog1. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ormanda ya da bir gölde canlılar neden birbirinden bağımsız yaşayamaz? Güneşten gelen enerji bir otun, bir tavşanın ve bir tilkinin arasında nasıl dolaşır? **Ekosistem**, belli bir alandaki **canlılar (biyotik)** ile **cansız çevrenin (abiyotik)** birbirleriyle etkileşim hâlinde olduğu doğal sistemdir. Bu konuda **ekosistemin bileşenlerini**, **besin zinciri ve ağını**, **enerji akışını**, **madde döngülerini** ve **dünyanın başlıca biyomlarını** öğreneceksin.

:::hedefler
1. Biyotik ve abiyotik bileşenleri ayırt etmek.
2. Üretici, tüketici ve ayrıştırıcıların görevini açıklamak.
3. Besin zinciri ile besin ağını karşılaştırmak.
4. Enerji akışının tek yönlü, madde döngüsünün çevrimsel olduğunu yorumlamak.
5. Karbon, azot ve su döngüsünü kısaca anlatmak.
6. Başlıca biyomları iklim ve bitki örtüsüyle eşleştirmek.
:::

:::ipucu
İki kuralı aklında tut: **enerji tek yönlüdür** (Güneş $\rightarrow$ üretici $\rightarrow$ tüketici, her basamakta yaklaşık **%10** aktarılır) ve **madde döngüseldir** (ayrıştırıcılar maddeyi toprağa geri verir). Biyom sorularında önce iklime, sonra bitki örtüsüne bak.
:::

::video{id="2JrhVyC_SmI" etiket="Konu anlatımı videosu" baslik="Ekosistem ve Madde Döngüleri" kanal="Coğrafyanın Kodları"}

## 1. Ekosistemin bileşenleri

- **Abiyotik (cansız) bileşenler:** Güneş ışığı, sıcaklık, su, toprak, hava, iklim, yer şekilleri.
- **Biyotik (canlı) bileşenler:** Bitkiler, hayvanlar, mantarlar, bakteriler.
- **Habitat:** Bir canlının yaşadığı doğal ortam. **Ekolojik niş:** Canlının ekosistemdeki görevi ve yaşam biçimi.
- **Populasyon (birey topluluğu):** Aynı türün belli bir alandaki bireyleri. **Komünite (canlı topluluğu):** O alandaki tüm populasyonlar.

Ekosistem büyük ya da küçük olabilir. Bir göl, bir orman, bir çayır ve hatta tek bir çürüyen kütük de ekosistemdir. Dünya'nın tamamı da bir **biyosfer** olarak tek büyük sistemdir.

## 2. Canlıların ekosistemdeki görevleri

- **Üreticiler:** Fotosentezle Güneş enerjisini besine çeviren **bitkiler, algler ve bazı bakteriler.** Besin zincirinin ilk halkasıdır.
- **Tüketiciler:** Hazır besin alan canlılar. **Birincil tüketici** (otçul), **ikincil tüketici** (etçil), **üçüncül tüketici** (üst etçil). Hem bitki hem hayvan yiyenlere **omnivor** denir.
- **Ayrıştırıcılar:** Ölü organizmaları ve atıkları parçalayan **bakteri ve mantarlar.** Maddeyi inorganik hâle getirip toprağa ve havaya geri verir.

## 3. Besin zinciri ve besin ağı

**Besin zinciri**, enerjinin ve maddenin üreticiden başlayarak tüketicilere doğru aktarıldığı tek yönlü sıradır. Örnek: ot $\rightarrow$ çekirge $\rightarrow$ kurbağa $\rightarrow$ yılan $\rightarrow$ kartal.

Doğada bir canlı birden fazla zincirin halkası olabilir. Bu zincirlerin kesişmesiyle **besin ağı** oluşur. Besin ağı ne kadar karmaşıksa ekosistem o kadar **kararlıdır.** Bir tür yok olsa bile diğer türler besin bulabilir.

## 4. Enerji akışı

- Enerjinin kaynağı **Güneş**'tir.
- Her basamakta alınan enerjinin yaklaşık **%10**'u bir üst basamağa geçer. Kalan kısmı canlı yaşamsal faaliyetlerde kullanır, ısı olarak kaybeder.
- Bu nedenle zincir **kısadır** (genellikle 4-5 halka) ve en üst basamakta canlı sayısı azdır. Üretici sayısı en çoktur. Bu duruma **enerji piramidi** denir.
- Enerji **döngüsel değil, tek yönlüdür.**

::sim{tur="piramit"}

## 5. Madde döngüleri

- **Karbon döngüsü:** Bitkiler atmosferdeki $CO_2$'yi fotosentezle alır. Canlılar solunumla geri verir. Fosil yakıtların yakılması atmosferdeki karbonu artırır.
- **Azot döngüsü:** Atmosferin yaklaşık %78'i azottur. Baklagillerin köklerindeki bakteriler azotu bağlar ve bitkiler kullanır. Ayrıştırıcılar azotu toprağa geri verir.
- **Su döngüsü:** Buharlaşma, yoğunlaşma, yağış ve akış ile sürer. Bitkilerin terlemesi de döngüye katılır.
- **Madde döngüsel, enerji tek yönlüdür.** Madde ayrıştırıcılar sayesinde tekrar kullanılır.

## 6. Başlıca biyomlar

**Biyom**, geniş bir alanda iklimin belirlediği büyük bitki ve hayvan topluluğudur.

- **Tropikal yağmur ormanı:** Ekvator çevresi. Yıl boyu sıcak ve çok yağışlı. En zengin tür çeşitliliği. Amazon ve Kongo havzaları.
- **Savan:** Tropikal kuşağın kuzey ve güneyinde. Yazlar yağışlı, kışlar kurak. Uzun otlar ve seyrek ağaçlar. Afrika.
- **Çöl:** Çok kurak. Seyrek bitki örtüsü. Sahra.
- **Bozkır (step):** Yarı kurak. Kısa otlar. İç Anadolu, Orta Asya.
- **Akdeniz (maki):** Yazı sıcak ve kurak, kışı ılık ve yağışlı. Her dem yeşil, kısa boylu, kuraklığa dayanıklı bitkiler.
- **Ilıman geniş yapraklı orman:** Yağışı düzenli ve sıcaklığı ılıman bölgeler. Yaprak döken ağaçlar. Karadeniz kıyıları, Batı Avrupa.
- **Tayga (iğne yapraklı orman):** Kışı uzun ve soğuk. Kuzey Asya, Kanada.
- **Tundra:** Kutba yakın. Yıl boyu soğuk. Yosun ve likenler.

Biyomun belirleyicisi **sıcaklık ve yağıştır.**

## 7. İnsan etkisi ve ekosistem dengesi

- **Ormansızlaşma** biyolojik çeşitliliği azaltır.
- **Aşırı avlanma** besin zincirini bozar.
- **Kirlilik** (sanayi atıkları, kimyasal gübre) ekosistemlere zarar verir. **Ötrofikasyon** göl ve denizlerde alg patlaması yaratır.
- **İstilacı türler** yerel türleri baskılar.
- **Küresel ısınma** biyomların sınırlarını kaydırır.

Korumanın yolları: **milli parklar, koruma alanları, sürdürülebilir kaynak kullanımı.**

## 8. Sık yapılan hatalar

- Enerjinin de madde gibi döngü yaptığını sanmak. Enerji tek yönlüdür.
- Ayrıştırıcıları tüketici saymak. Ayrı bir gruptur.
- Savan ile bozkırı karıştırmak. Savan tropikal, bozkır ılıman kuşaktadır.
- Besin zincirinin ilk halkasını otçul sanmak. İlk halka üreticidir.
- Besin ağını zincirden bağımsız sanmak. Ağ, zincirlerin kesişmesidir.

:::baglanti
Bu konu, TYT'deki **doğa ve insan** başlığının devamıdır. **Çevre ve Toplum** ile **Doğal Kaynakların Sürdürülebilir Kullanımı** (Coğrafya-2) konuları ekosistem sağlığıyla doğrudan ilişkilidir. **Biyoloji** dersindeki ekosistem ekolojisi, enerji akışı ve madde döngüleri bu konunun daha ayrıntılı hâlini işler. **Ekonomik Faaliyetler** konusunda biyomun etkisi tarım ve hayvancılığı belirler.
:::

## 9. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Üretici | Fotosentez yapar |
| Ayrıştırıcı | Bakteri ve mantar |
| Enerji aktarımı | Her basamakta yaklaşık %10 |
| Enerji | Tek yönlü |
| Madde | Döngüsel |
| Savan | Tropikal, otlar |
| Maki | Akdeniz iklimi |

## Mini test

:::soru{cevap="C"}
Bir besin zincirinde üreticilerde 10.000 birim enerji bulunuyorsa, birincil tüketicilere yaklaşık kaç birim enerji aktarılır?

- A) 100
- B) 500
- C) 1000
- D) 5000
- E) 10.000

---

1. Enerji aktarımında her basamakta yaklaşık %10'u bir üst basamağa geçer.
2. 10.000 birimin %10'u 1000 birimdir. Doğru cevap C.

Diğer şıklar: **A** iki basamak sonrası / **B** %5 / **D** %50 / **E** hiç kayıp yok.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi bir ekosistemin abiyotik (cansız) bileşenidir?

- A) Mantarlar
- B) Güneş ışığı
- C) Otçul hayvanlar
- D) Toprak bakterileri
- E) Kuşlar

---

1. Abiyotik bileşenler ışık, sıcaklık, su, hava ve toprak gibi cansız öğelerdir.
2. Diğer şıklar canlıdır. Doğru cevap B.

Diğer şıklar: **A** ayrıştırıcı / **C** tüketici / **D** ayrıştırıcı / **E** tüketici.
:::

:::soru{cevap="A"}
Yazları sıcak ve kurak, kışları ılık ve yağışlı iklim koşullarında gelişen, kısa boylu ve her dem yeşil bitki topluluğuna ne ad verilir?

- A) Maki
- B) Tundra
- C) Tayga
- D) Savan
- E) Bozkır

---

1. Bu iklim Akdeniz iklimidir ve bu iklimin tipik bitki örtüsü makidir.
2. Doğru cevap A.

Diğer şıklar: **B** kutba yakın / **C** soğuk iğne yapraklı orman / **D** tropikal, yazı yağışlı / **E** yarı kurak otlak.
:::

:::soru{cevap="E"}
Ekosistemde enerji akışı ile madde döngüsü için aşağıdakilerden hangisi doğrudur?

- A) İkisi de tek yönlüdür.
- B) İkisi de döngüseldir.
- C) Enerji döngüsel, madde tek yönlüdür.
- D) Enerji ve madde ayrıştırıcılarla çevrilir.
- E) Enerji tek yönlü akar, madde döngü yapar.

---

1. Enerji Güneş'ten üreticilere, oradan tüketicilere ısı kaybıyla ilerler ve geri dönmez.
2. Madde ise ayrıştırıcılar sayesinde yeniden kullanılır. Doğru cevap E.

Diğer şıklar: **A, B, C** yanlış eşleştirme / **D** enerji çevrilmez.
:::

## Kendini dene

:::dene
1. Besin zincirinin ilk halkası hangi canlı grubudur? => Üreticiler.
2. Ölü canlıları parçalayan canlılara ne denir? => Ayrıştırıcılar.
3. Her basamakta aktarılan enerji oranı yaklaşık kaçtır? => Yaklaşık %10.
4. Ekvator çevresindeki yıl boyu sıcak ve nemli biyom hangisidir? => Tropikal yağmur ormanı.
5. Kutba yakın, yosun ve likenlerin bulunduğu biyom hangisidir? => Tundra.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-cog1' and name = 'Ekosistem'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ülke neden nüfusunu artırmaya çalışırken başka bir ülke nüfus artışını sınırlamak ister? Dünya nüfusu 8 milyarı aşarken ülkelerin nüfus yapıları neden bu kadar farklı? **Nüfus politikaları**, devletlerin **nüfusun sayısını, yapısını ve dağılışını** etkilemek için uyguladığı yöntemlerdir. Bu konuda **nüfus artışını etkileyen etkenleri**, **nüfus politikası türlerini**, **demografik dönüşümü**, **nüfus piramitlerini** ve **göçün sonuçlarını** öğreneceksin.

:::hedefler
1. Doğum ve ölüm oranından doğal artış hızını hesaplamak.
2. Nüfusu artırıcı ve azaltıcı politikaları ayırt etmek.
3. Demografik dönüşümün aşamalarını yorumlamak.
4. Nüfus piramidinden ülkenin yapısını okumak.
5. Göçün nedenlerini ve sonuçlarını sıralamak.
6. Türkiye'nin nüfus politikalarının tarihsel gelişimini söylemek.
:::

:::ipucu
Doğal artış hızı = **doğum oranı $-$ ölüm oranı** (binde). Net göç eklenince **nüfus artış hızı** bulunur. Piramit sorularında **tabanın genişliği** doğum oranını, **tepenin daralması** ölümleri ve yaşlı nüfusu gösterir.
:::

::video{id="9mGLs25ax88" etiket="Konu anlatımı videosu" baslik="Nüfus Politikaları" kanal="Coğrafyanın Kodları"}

## 1. Nüfus artışını etkileyen etkenler

- **Doğurganlık:** Kadın başına düşen çocuk sayısı. Eğitim düzeyi, kentleşme ve kadının çalışma hayatındaki yeri düşürür.
- **Ölüm oranı:** Sağlık hizmetleri, beslenme ve hijyen düzeyi ile azalır.
- **Göç:** Ülke içi ve ülkeler arası. Net göç, nüfusu değiştirir.
- **Ekonomik düzey:** Gelişmiş ülkelerde doğurganlık düşük, az gelişmiş ülkelerde yüksek olma eğilimindedir.
- **Kültürel ve dinî etkenler.**
- **Savaş, doğal afet ve salgın** da kısa vadede etki eder.

**Doğal artış hızı (binde)** = Doğum oranı $-$ Ölüm oranı. Örneğin doğum oranı binde 15, ölüm oranı binde 6 ise doğal artış binde 9'dur (%0,9).

## 2. Demografik dönüşüm

Ülkelerin ekonomik gelişmesiyle doğum ve ölüm oranları birlikte değişir. Bu süreç **beş aşamada** özetlenir.

- **1. aşama:** Doğum ve ölüm oranları yüksek, nüfus artışı yavaş.
- **2. aşama:** Ölüm oranı hızla düşer, doğum yüksek kalır. **Nüfus patlaması.**
- **3. aşama:** Doğum oranı da düşmeye başlar. Artış yavaşlar.
- **4. aşama:** Doğum ve ölüm düşük, nüfus dengeli.
- **5. aşama:** Doğum oranı ölümün altına inebilir. Nüfus azalır, yaşlanma belirgin.

::sim{tur="demografi"}

## 3. Nüfus piramidi

Nüfusun yaş ve cinsiyete göre dağılımını gösteren grafiktir.

- **Taban geniş, tepe dar (üçgen):** Genç nüfus yüksek, doğum yüksek, yaşlı az. Gelişmekte olan ülkeler.
- **Taban ve orta eşit (çan şekli):** Gelişmiş ve dengeli nüfus.
- **Taban dar, orta ve tepe geniş (urna):** Doğum oranı düşük, yaşlı nüfus fazla. Japonya, Almanya, İtalya gibi ülkeler.

![Üç tür nüfus piramidi: geniş tabanlı, çan biçimli ve urna biçimli](/lessons/ayt-cog1/nufus-piramidi.svg "Nüfus piramidi türleri")

**Bağımlı nüfus:** 0-14 yaş ve 65+ yaş. **Aktif nüfus:** 15-64 yaş. Yaşlı oranı arttıkça sağlık ve emeklilik yükü artar.

## 4. Nüfus politikaları

**Nüfusu artırıcı politikalar:**
- Doğum teşvikleri, kreş ve eğitim destekleri.
- Doğum izni ve vergi indirimleri.
- Göçmen kabulü.
- Örnekler: Fransa, Rusya, Güney Kore, bir dönem Türkiye.

**Nüfusu sınırlayıcı politikalar:**
- Doğum kontrolü ve aile planlaması kampanyaları.
- Evlilik yaşının yükseltilmesi.
- **Çin'in tek çocuk politikası (1979-2015):** Nüfus artış hızını düşürdü ama yaşlanma ve cinsiyet dengesizliği doğurdu. Sonradan gevşetildi.
- Hindistan'ın aile planlaması programları.

**Nüfusu dağıtıcı politikalar:** Nüfusun belli bölgelerde yığılmasını önlemek amacıyla **bölgesel kalkınma, yeni kentler, teşvikler.** (Brezilya'nın başkenti Brasília, Türkiye'de Ankara.)

## 5. Türkiye'de nüfus politikaları

- **Cumhuriyet'in ilk yılları:** Savaşlar ve salgınlar nedeniyle nüfus kaybı. Nüfusu artırıcı politika izlendi (1930'larda).
- **1965 Nüfus Planlaması Kanunu:** Aile planlaması hizmetleri yasal hâle geldi. Doğum oranı düştü.
- **1983 Nüfus Planlaması Kanunu:** Doğum kontrol yöntemleri ve gebeliğin sonlandırılması ile ilgili düzenleme getirdi.
- **2000'ler sonrası:** Doğurganlık oranı yenileme düzeyinin (2,1) altına indi. Yaşlanma tartışmaları ve doğumu teşvik edici düzenlemeler gündeme geldi.

## 6. Göç

- **İçgöç / dışgöç:** Ülke içi ya da ülke dışına.
- **Zorunlu göç:** Savaş, afet, baskı. **Gönüllü göç:** İş, eğitim.
- **İtici etkenler:** İşsizlik, savaş, kuraklık. **Çekici etkenler:** İş fırsatı, güvenlik.
- **Beyin göçü:** Eğitimli nüfusun gelişmiş ülkelere gitmesi.
- **Sonuçlar:** Gelen bölgede nüfus ve kültürel çeşitlilik artar, giden bölgede işgücü kaybı olur. Kentlerde barınma ve altyapı sorunları ortaya çıkar.

## 7. Sık yapılan hatalar

- Doğal artış hızını göçle karıştırmak. Doğal artış doğum ve ölümden hesaplanır.
- Nüfus artışı yüksek her ülkeyi gelişmiş sanmak. Genelde az gelişmiş ülkelerde yüksek.
- Çin'in tek çocuk politikasını hâlâ yürürlükte sanmak. 2015'te sona erdi.
- Nüfus piramidinin yalnızca doğum oranını gösterdiğini sanmak. Ölüm ve yaş yapısını da gösterir.
- Dışgöçü içgöçle karıştırmak.

:::baglanti
Bu konu, TYT'deki **nüfus** başlığının politikalar boyutudur. **Türkiye'de Nüfus ve Yerleşme** konusu bu kavramların Türkiye'deki karşılığını işler. **Bölgesel Kalkınma Projeleri** konusu dağıtıcı politikaların aracıdır. **Tarih** dersinde Cumhuriyet dönemi sosyal politikalar, **Sosyoloji** dersinde toplumsal değişme ve göç bu konuyla ilişkilidir.
:::

## 8. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Doğal artış | Doğum $-$ ölüm |
| Nüfus patlaması | 2. aşama |
| Taban geniş piramit | Genç nüfus |
| Urna biçimli piramit | Yaşlı nüfus |
| Tek çocuk politikası | Çin, 1979-2015 |
| Nüfus Planlaması Kanunu | 1965, Türkiye |

## Mini test

:::soru{cevap="C"}
Bir ülkede doğum oranı binde 22, ölüm oranı binde 7 ise doğal nüfus artış hızı binde kaçtır?

- A) 7
- B) 10
- C) 15
- D) 22
- E) 29

---

1. Doğal artış hızı doğum oranı eksi ölüm oranıdır.
2. 22 $-$ 7 $=$ 15 binde. Doğru cevap C.

Diğer şıklar: **A** yalnızca ölüm oranı / **B** hatalı çıkarma / **D** yalnızca doğum oranı / **E** toplama hatası.
:::

:::soru{cevap="C"}
Demografik dönüşümün hangi aşamasında doğum oranı da düşmeye başlar ve nüfus artış hızı yavaşlar?

- A) 1. aşama
- B) 2. aşama
- C) 3. aşama
- D) 4. aşama
- E) 5. aşama

---

1. İlk aşamada doğum ve ölüm yüksektir, ikinci aşamada ölüm düşer ve nüfus patlaması olur.
2. Üçüncü aşamada doğum oranı da düşmeye başlar ve artış yavaşlar. Doğru cevap C.

Diğer şıklar: **A** ikisi de yüksek / **B** nüfus patlaması / **D** ikisi de düşük / **E** doğum ölümün altında.
:::

:::soru{cevap="B"}
Taban kısmı geniş, tepe kısmı dar olan bir nüfus piramidine sahip bir ülke için aşağıdakilerden hangisi söylenebilir?

- A) Yaşlı nüfus oranı yüksektir.
- B) Genç nüfus oranı yüksektir.
- C) Doğum oranı çok düşüktür.
- D) Nüfus azalmaktadır.
- E) Bağımlı nüfus yoktur.

---

1. Geniş taban, doğum oranının yüksek olduğunu ve genç nüfusun fazla olduğunu gösterir.
2. Bu tür piramitler gelişmekte olan ülkelerde görülür. Doğru cevap B.

Diğer şıklar: **A** urna biçimli piramit / **C** dar taban / **D** dar taban / **E** genç nüfus da bağımlıdır.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi nüfusu sınırlandırmayı amaçlayan bir politikadır?

- A) Doğum izni sürelerini uzatmak
- B) Kreş desteği sağlamak
- C) Çocuk sahibi olan ailelere vergi indirimi
- D) Aile planlaması kampanyaları yürütmek
- E) Göçmen kabulünü artırmak

---

1. Aile planlaması, doğurganlığı azaltarak nüfus artışını sınırlar.
2. Diğer şıklar nüfusu artırıcı politikalardır. Doğru cevap D.

Diğer şıklar: **A, B, C** doğum teşviki / **E** nüfusu artırır.
:::

## Kendini dene

:::dene
1. Doğal artış hızı nasıl hesaplanır? => Doğum oranı eksi ölüm oranı.
2. Taban dar, tepe geniş piramit hangi nüfus yapısını gösterir? => Yaşlı nüfusun fazla olduğunu.
3. Çin'in tek çocuk politikası hangi yıl sona erdi? => 2015.
4. Eğitimli nüfusun gelişmiş ülkelere gitmesine ne denir? => Beyin göçü.
5. Türkiye'de aile planlamasını yasal hâle getiren kanun hangi yıl çıktı? => 1965.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-cog1' and name = 'Nüfus Politikaları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Türkiye'de nüfus neden bazı bölgelerde yoğun, bazılarında seyrek? İstanbul neden bu kadar büyüdü? Köyden kente göç, ülkenin yüzünü nasıl değiştirdi? Bu konuda **Türkiye'nin nüfus özelliklerini**, **nüfusun dağılışını** (yoğunluk, kent ve kır), **göçleri**, **yerleşme tiplerini** ve **kentleşmenin sorunlarını** öğreneceksin.

:::hedefler
1. Türkiye'nin nüfus özelliklerini (genç nüfus, artış hızı) söylemek.
2. Nüfus yoğunluğunun bölgelere göre dağılışının nedenlerini açıklamak.
3. Kırsal ve kentsel yerleşmeyi karşılaştırmak.
4. İç ve dış göçlerin nedenlerini sıralamak.
5. Kentleşmenin olumlu ve olumsuz sonuçlarını yorumlamak.
6. Yerleşme tiplerini (toplu, dağınık) ayırt etmek.
:::

:::ipucu
Nüfus yoğunluğu = **nüfus $\div$ yüzölçümü.** Yoğunluğu belirleyen etkenleri üç grupta düşün: **doğal** (iklim, yer şekilleri, su), **ekonomik** (sanayi, ticaret, tarım) ve **beşerî** (göç, tarihî gelişim). Yoğunluk Marmara'da en yüksek, Doğu Anadolu'da düşüktür.
:::

::video{id="o1o5F1kFdWw" etiket="Konu anlatımı videosu" baslik="Türkiye'de Nüfus Hareketleri ve Yerleşme" kanal="Benim Hocam"}

## 1. Türkiye'nin nüfus özellikleri

- Nüfus yaklaşık **85 milyon.** Dünya nüfusunun yaklaşık %1'ini oluşturur.
- İlk genel nüfus sayımı **1927** yılında yapılmıştır (13,6 milyon). Sayımlar bundan sonra düzenli aralıklarla sürdü. 2007'den itibaren adrese dayalı nüfus kayıt sistemi (ADNKS) uygulanıyor.
- Nüfus artış hızı geçmişte yüksekti, günümüzde **düşüyor.** Doğurganlık oranı yenileme düzeyinin (2,1) altına indi.
- **Genç nüfus oranı yüksek**, ancak yaşlanma hızlanıyor.
- Nüfusun yaklaşık **%93'ü kentlerde** (il ve ilçe merkezleri), %7'si köylerde yaşar.
- Kadın ve erkek sayısı birbirine yakın.

## 2. Nüfus yoğunluğu

Türkiye'nin ortalama nüfus yoğunluğu km² başına yaklaşık **110** kişidir.

- **Yoğun bölgeler:** Marmara (özellikle İstanbul, Kocaeli), Ege kıyıları, Akdeniz kıyı ovaları (Çukurova), Karadeniz kıyısı (Trabzon, Rize).
- **Seyrek bölgeler:** Doğu Anadolu'nun yüksek ve engebeli kesimleri, İç Anadolu'nun kurak merkezi (Tuz Gölü çevresi), yüksek dağlık alanlar.

**Yoğunluğu etkileyen etkenler:**
- **İklim:** Ilıman iklimli kıyılar yoğun, sert iklimli yüksek alanlar seyrek.
- **Yer şekilleri:** Ovalar ve havzalar yoğun, dağlar seyrek.
- **Ekonomik faaliyetler:** Sanayi ve ticaretin geliştiği yerler yoğun.
- **Ulaşım:** Ulaşım ağının sıklığı.
- **Su kaynakları.**

::sim{tur="nufus"}

## 3. Kır ve kent yerleşmeleri

**Kırsal yerleşme:**
- Köy, mezra, yayla, divan. Tarım, hayvancılık ve ormancılıkla uğraşılır.
- **Toplu yerleşme:** Evlerin birbirine yakın olduğu köyler. Ovalar ve su kaynağı çevresi. İç Anadolu'da yaygın.
- **Dağınık yerleşme:** Evlerin birbirinden uzak olduğu köyler. Yağışı bol ve engebeli alanlarda. Karadeniz, Ege dağlık kesimleri.

**Kentsel yerleşme:** Sanayi, ticaret ve hizmet etkinlikleri ile öne çıkar. Nüfusun büyük bölümü kentlerde yaşar.

## 4. Kentleşme ve sorunları

Türkiye'de kentleşme **1950'lerden sonra hızlandı.** Tarımda makineleşmenin işgücünü fazlalaştırması ve sanayinin gelişmesi köyden kente göçe yol açtı.

**Sorunlar:**
- Çarpık kentleşme ve gecekondulaşma.
- Altyapı yetersizliği (ulaşım, su, kanalizasyon).
- Trafik, hava kirliliği, konut sorunu.
- Tarım alanlarının yerleşmeye açılması.
- Afet riski (deprem bölgelerinde yoğun yapılaşma).

**Çözüm:** Planlı kentleşme, toplu konut projeleri, depreme dayanıklı yapılaşma, çok merkezli gelişme.

## 5. Göçler

**İç göç:**
- Köyden kente (1950 sonrası).
- Doğudan batıya (iş imkânları).
- Sonuç: İstanbul, Ankara, İzmir ve Kocaeli gibi kentlerde nüfus yığılması.
- Son yıllarda **kentten kente** ve iklim, afet, eğitim kaynaklı göçler de artıyor.

**Dış göç:**
- **1960'lardan itibaren Avrupa'ya işçi göçü** (Almanya, Hollanda, Fransa). Dış göçle yurt dışındaki Türk nüfusu yaklaşık altı milyona ulaştı.
- **Balkanlardan ve Kafkasya'dan gelen göçler** (Cumhuriyet'ten önce ve sonra).
- **Suriye'den gelen sığınmacılar** (2011 sonrası): Türkiye dünyanın en çok mülteci barındıran ülkelerinden biri oldu.

## 6. Sık yapılan hatalar

- Nüfus yoğunluğunu toplam nüfusla karıştırmak. Yoğunluk, yüzölçümüne oranlanır.
- Karadeniz'de dağınık yerleşmenin nedeninin ormanlar olduğunu bilmeyip toplu yerleşme sanmak.
- 1927 ve 2007 sayımlarının farkını karıştırmak.
- Türkiye'de nüfusun çoğunun köylerde yaşadığını sanmak.
- Kentleşmeyi yalnızca olumsuz sanmak. Hizmet erişimi, istihdam gibi olumlu yönleri de vardır.

:::baglanti
Bu konu, **Nüfus Politikaları** konusunun Türkiye'ye uygulanmasıdır. **Ekonomik Faaliyetler** ve **Sanayi** konuları nüfusun dağılışını açıklar. **Bölgesel Kalkınma Projeleri** konusu nüfus yığılmasını azaltma çabalarıdır. **Tarih** dersinde Cumhuriyet dönemi nüfus hareketleri ve mübadele ilişkilidir. **Sosyoloji** dersinde kentleşme ve göç konularında bu başlıklar yer alır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İlk sayım | 1927 |
| Kentleşme hızlanması | 1950 sonrası |
| En yoğun bölge | Marmara |
| Seyrek bölge | Doğu Anadolu yükseklikleri |
| Dağınık yerleşme | Engebeli, bol yağışlı alanlar |
| İşçi göçü | 1960'lardan itibaren Avrupa'ya |

## Mini test

:::soru{cevap="D"}
Türkiye'de nüfus yoğunluğunun Marmara Bölgesi'nde en yüksek olmasının nedenlerinden biri aşağıdakilerden hangisidir?

- A) Dağlık arazinin geniş olması
- B) Tarımsal nüfusun çok fazla olması
- C) İklimin sert geçmesi
- D) Sanayi ve ticaretin gelişmiş olması
- E) Ulaşımın zor olması

---

1. Marmara, sanayi ve ticaretin merkezi olduğu için iş imkânları fazladır ve nüfus çeker.
2. Diğer şıklar nüfusu azaltıcı ya da ilgisiz etkenlerdir. Doğru cevap D.

Diğer şıklar: **A** nüfusu azaltır / **B** tarım yoğunluğu düşüktür / **C** nüfus çekmez / **E** nüfusu azaltır.
:::

:::soru{cevap="E"}
Türkiye'de köyden kente göçün 1950'lerden sonra hızlanmasının nedenlerinden biri aşağıdakilerden hangisidir?

- A) Tarımın bütün alanlarda yaygınlaşması
- B) Sanayinin yalnızca kırda gelişmesi
- C) Kentlerdeki iş imkânlarının azalması
- D) Köylerde doğum oranının düşmesi
- E) Tarımda makineleşme ve sanayi gelişimi

---

1. Makineleşme tarımda gereken işgücünü azalttı.
2. Aynı dönemde sanayinin gelişmesi kentlerde iş imkânı yarattı ve göçü hızlandırdı. Doğru cevap E.

Diğer şıklar: **A, B, C** yanlış yön / **D** göçün nedeni değil.
:::

:::soru{cevap="E"}
Evlerin birbirinden uzakta, çevresindeki bahçelerle birlikte dağınık bulunduğu köy tipi aşağıdakilerden hangisinde yaygındır?

- A) Tuz Gölü çevresi
- B) Konya Ovası
- C) Harran Ovası
- D) Çukurova
- E) Doğu Karadeniz

---

1. Dağınık yerleşme yağışı bol, engebeli ve ormanlık alanlarda görülür.
2. Doğu Karadeniz bu özelliklere sahiptir. Doğru cevap E.

Diğer şıklar: **A, B, C, D** ova ve düz alanlar, toplu yerleşme.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi Türkiye'de hızlı kentleşmenin sonuçlarından biri **değildir**?

- A) Altyapı sorunlarının artması
- B) Tarım alanlarının artması
- C) Trafik ve hava kirliliği
- D) Gecekondulaşma
- E) Konut ihtiyacının artması

---

1. Hızlı kentleşme tarım alanlarını yerleşmeye açarak azaltır.
2. Diğer şıklar kentleşmenin sorunlarıdır. Doğru cevap B.

Diğer şıklar: **A, C, D, E** kentleşmenin olumsuz sonuçları.
:::

## Kendini dene

:::dene
1. Türkiye'de ilk genel nüfus sayımı hangi yıl yapıldı? => 1927.
2. Nüfus yoğunluğunun en yüksek olduğu bölge hangisidir? => Marmara.
3. Evlerin birbirine yakın olduğu köy tipine ne denir? => Toplu yerleşme.
4. Almanya'ya işçi göçü hangi yıllarda başladı? => 1960'lardan itibaren.
5. Kentleşme Türkiye'de hangi yıllardan sonra hızlandı? => 1950'lerden sonra.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-cog1' and name = 'Türkiye''de Nüfus ve Yerleşme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İnsanlar neden kimi yerde tarımla, kimi yerde madencilikle, kimi yerde bankacılıkla geçinir? Bir ülkenin zenginliği doğal kaynaklarından mı gelir? **Ekonomik faaliyetler**, insanların ihtiyaçlarını karşılamak için yaptığı **üretim, dağıtım ve tüketim** çalışmalarıdır. Bu konuda **ekonomik faaliyet sektörlerini** (birincil, ikincil, üçüncül, dördüncül, beşincil), **doğal kaynakları** (yenilenebilir, yenilenemez), **kaynak kullanımının coğrafi etkenlerini** ve **Türkiye'nin ekonomik yapısını** öğreneceksin.

:::hedefler
1. Ekonomik faaliyetleri sektörlere ayırmak.
2. Yenilenebilir ve yenilenemez kaynakları ayırt etmek.
3. Ekonomik faaliyetleri etkileyen doğal ve beşerî etkenleri sıralamak.
4. Gelişmiş ve gelişmekte olan ülkelerin sektör dağılımını karşılaştırmak.
5. Türkiye'de sektörlerin ekonomideki payını yorumlamak.
:::

:::ipucu
Sektör sorusunda faaliyetin **doğadan ham madde alıp almadığına** bak. Doğadan doğrudan alıyorsa **birincil**, işliyorsa **ikincil**, hizmet veriyorsa **üçüncül**. Gelişmiş ülkelerde üçüncül ve üstü sektörlerin payı yüksek, gelişmekte olanlarda birincil sektör ağır basar.
:::

::video{id="sR-FHddY3aE" etiket="Konu anlatımı videosu" baslik="Ekonomik Faaliyet Türleri, Doğal Kaynaklar ve Ekonomi" kanal="Benim Hocam"}

## 1. Ekonomik faaliyet sektörleri

- **Birincil (ham madde):** Tarım, hayvancılık, ormancılık, madencilik, balıkçılık. Doğadan doğrudan ürün alınır.
- **İkincil (sanayi):** Ham maddenin işlenmesi. Fabrikalarda üretim, inşaat, enerji üretimi.
- **Üçüncül (hizmet):** Ticaret, ulaşım, turizm, bankacılık, sağlık, eğitim.
- **Dördüncül:** Bilgi, araştırma-geliştirme (Ar-Ge), danışmanlık, yazılım.
- **Beşincil:** Karar verici üst yönetim, bilimsel araştırma, hükümet politikaları.

Dördüncül ve beşincil sektörler bazen üçüncül sektörün içinde ele alınır.

## 2. Doğal kaynaklar

**Yenilenebilir kaynaklar:**
- Su (döngü ile yenilenir), orman, rüzgâr, Güneş, jeotermal (doğru kullanılırsa), toprak.
- Aşırı kullanım tükenmesine yol açabilir (ormansızlaşma, aşırı avlanma).

**Yenilenemez kaynaklar:**
- Maden (demir, bakır, krom), kömür, petrol, doğal gaz. Oluşumları milyonlarca yıl sürer.
- Tükenmeleri durumunda yerine yenisi konmaz.

**Süregen (sürekli) kaynaklar:** Güneş ve rüzgâr gibi tükenmeyen kaynaklar.

## 3. Ekonomik faaliyetleri etkileyen etkenler

**Doğal etkenler:**
- İklim, yer şekilleri, toprak, su kaynakları, madenler, bitki örtüsü.
- Örneğin: Ovalar tarım ve sanayi, dağlar hayvancılık ve ormancılık için uygundur.

**Beşerî etkenler:**
- Nüfus, işgücü, sermaye, teknoloji, ulaşım, pazar, hükümet politikaları.
- Örneğin: Sanayi, pazara ve işgücüne yakın yerlerde gelişir.

Doğal etkenler bir faaliyetin **başlangıcını**, beşerî etkenler ise **gelişimini** belirler.

## 4. Sektörlerin ülke ekonomisindeki payı

- **Az gelişmiş ülkelerde:** Çalışan nüfusun büyük bölümü birincil sektördedir (tarım). Milli gelirin payı düşüktür.
- **Gelişmekte olan ülkelerde:** İkincil sektör (sanayi) ağırlık kazanır.
- **Gelişmiş ülkelerde:** Üçüncül ve üstü sektörler baskındır. Birincil sektör çalışanların küçük bir oranıdır ama verimlidir.

**Türkiye'de:** Tarım çalışanların yaklaşık %18'ini istihdam eder ama milli gelire katkısı düşüktür. Hizmet sektörü en büyük paya sahiptir. Sanayi sanayileşme sürecinde önem kazanmıştır.

::sim{tur="sektor"}

## 5. Türkiye'nin doğal kaynak zenginliği

- **Su:** Akarsu, göl, baraj. Yağış dağılımı eşit değildir.
- **Orman:** Karadeniz, Marmara, Ege ve Akdeniz kıyıları. Yüzölçümünün yaklaşık %30'u.
- **Maden:** Bor (dünya rezervlerinin büyük bölümü), krom, bakır, demir, mermer, linyit.
- **Enerji:** Hidroelektrik, rüzgâr, Güneş, jeotermal. Petrol ve doğal gazda ithalata bağımlılık yüksek.
- **Tarım toprağı:** Verimli ovalar. Tarım alanları yerleşme ve sanayi nedeniyle azalıyor.

## 6. Sürdürülebilirlik

Doğal kaynakların gelecek nesillerin ihtiyaçlarını karşılayacak şekilde kullanılmasına **sürdürülebilirlik** denir. Geri dönüşüm, yenilenebilir enerji kullanımı, verimli tarım ve ormanların korunması bunun araçlarıdır.

## 7. Sık yapılan hatalar

- Madenciliği ikincil sektör sanmak. Madencilik birincil sektörün parçasıdır.
- Ormanı yenilenemez kaynak saymak. Orman, doğru kullanımda yenilenebilirdir.
- Ham maddeyi ürünle karıştırmak. Ham madde işlenmemiş, ürün işlenmiştir.
- Türkiye'de tarımın ekonomideki payını yüksek sanmak.
- Bor madeninin Türkiye'nin tek önemli madeni olduğunu sanmak.

:::baglanti
Bu konu, **Ekosistem** konusundaki doğal kaynak anlayışının ekonomik tarafıdır. **Türkiye'de Tarım ve Hayvancılık**, **Madenler ve Enerji Kaynakları**, **Sanayi**, **Ulaşım ve Ticaret** ve **Turizm** konuları bu sektörleri ayrı ayrı işler. **Doğal Kaynakların Sürdürülebilir Kullanımı** (Coğrafya-2) konusu bu başlığın devamıdır. **Felsefe** dersindeki ekonomi ve toplum tartışmaları da ilişkilidir.
:::

## 8. Konuyu toparla

| Sektör | Örnek |
| --- | --- |
| Birincil | Tarım, madencilik |
| İkincil | Fabrikada üretim |
| Üçüncül | Ticaret, turizm |
| Dördüncül | Ar-Ge, yazılım |
| Yenilenebilir | Su, orman, rüzgâr |
| Yenilenemez | Petrol, kömür, maden |

## Mini test

:::soru{cevap="D"}
Aşağıdakilerden hangisi birincil sektör faaliyetidir?

- A) Otomobil üretimi
- B) Bankacılık
- C) Turizm
- D) Madencilik
- E) Yazılım geliştirme

---

1. Birincil sektör, doğadan doğrudan ürün alma faaliyetidir.
2. Madencilik yer altı kaynaklarını çıkarır. Doğru cevap D.

Diğer şıklar: **A** ikincil / **B** üçüncül / **C** üçüncül / **E** dördüncül.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi yenilenemez doğal kaynaklara örnektir?

- A) Rüzgâr enerjisi
- B) Orman
- C) Güneş enerjisi
- D) Petrol
- E) Akarsu

---

1. Petrol milyonlarca yılda oluşur ve tüketilince yerine yenisi konmaz.
2. Diğer şıklar yenilenebilir ya da süregen kaynaklardır. Doğru cevap D.

Diğer şıklar: **A, C** süregen / **B** doğru kullanımda yenilenir / **E** döngü ile yenilenir.
:::

:::soru{cevap="B"}
Gelişmiş ülkelerin ekonomisi için aşağıdakilerden hangisi söylenebilir?

- A) Çalışan nüfusun çoğu birincil sektördedir.
- B) Üçüncül ve üstü sektörlerin payı yüksektir.
- C) Sanayi hiç gelişmemiştir.
- D) Tarım milli gelirin en büyük kaynağıdır.
- E) Hizmet sektörü yok denecek kadar azdır.

---

1. Gelişmiş ülkelerde hizmet ve bilgi sektörleri baskındır.
2. Birincil sektör küçük bir paya sahiptir ancak verimlidir. Doğru cevap B.

Diğer şıklar: **A, D** az gelişmiş ülkelerin özelliği / **C, E** gelişmiş ülkelerde sanayi ve hizmet güçlüdür.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi ekonomik faaliyetleri etkileyen **beşerî** etkenlerden biridir?

- A) İklim
- B) Yer şekilleri
- C) Su kaynakları
- D) Toprak yapısı
- E) Ulaşım ağı

---

1. Beşerî etkenler insan kaynaklıdır. Nüfus, sermaye, ulaşım ve teknoloji bunlardandır.
2. Diğer şıklar doğal etkenlerdir. Doğru cevap E.

Diğer şıklar: **A, B, C, D** doğal etkenler.
:::

## Kendini dene

:::dene
1. Tarım hangi sektöre girer? => Birincil sektör.
2. Fabrikada ham maddenin işlenmesi hangi sektördür? => İkincil sektör.
3. Güneş ve rüzgâr gibi kaynaklara ne denir? => Süregen (yenilenebilir) kaynaklar.
4. Gelişmiş ülkelerde hangi sektörün payı yüksektir? => Üçüncül ve üstü sektörler.
5. Türkiye'de hangi madenin rezervi çok fazladır? => Bor.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-cog1' and name = 'Ekonomik Faaliyetler ve Doğal Kaynaklar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Türkiye'de neden her yerde aynı ürün yetişmez? Çay neden Rize'de, pamuk neden Çukurova'da, fındık neden Karadeniz'de? **Tarım ve hayvancılık**, ülkenin gıda ihtiyacını karşılayan ve ihracata katkı sağlayan temel faaliyettir. Bu konuda **tarımı etkileyen etkenleri**, **başlıca tarım ürünlerini ve yetiştiği bölgeleri**, **tarım yöntemlerini**, **hayvancılığı**, **ormancılık ve balıkçılığı** ve **tarımda sorunları** öğreneceksin.

:::hedefler
1. Tarımı etkileyen doğal ve beşerî etkenleri sıralamak.
2. Başlıca ürünleri yetiştirildiği bölgeyle eşleştirmek.
3. Kuru ve sulu tarım, nadas, ekim-dikim yöntemlerini ayırt etmek.
4. Hayvancılığın türlerini ve bölgelere dağılışını söylemek.
5. Tarımda verimliliği artıran yöntemleri yorumlamak.
:::

:::ipucu
Ürün-bölge eşleştirmesinde **iklimi** düşün: sıcak ve nemli kıyılar (çay, fındık, turunçgil), sıcak ve sulanan ovalar (pamuk, mısır), kurak iç kesimler (buğday, arpa), serin yüksek alanlar (hayvancılık). Hayvancılıkta **mera** varlığı belirleyicidir.
:::

::video{id="s3JXvFsY4bI" etiket="Konu anlatımı videosu" baslik="Türkiye'de Tarım" kanal="Benim Hocam"}

## 1. Tarımı etkileyen etkenler

- **Doğal:** İklim (sıcaklık, yağış), yer şekilleri (ova, eğim), toprak, su kaynakları.
- **Beşerî:** Nüfus, teknoloji (makineleşme, gübre, sulama), pazar, ulaşım, devlet politikaları, destekler.

Türkiye'de **iklim çeşitliliği** nedeniyle ürün çeşitliliği yüksektir. Yağışın ve sıcaklığın bölgelere dağılımı farklıdır.

## 2. Başlıca tarım ürünleri ve bölgeleri

**Tahıllar:**
- **Buğday:** En yaygın. İç Anadolu (Konya, Ankara), Güneydoğu Anadolu, Trakya.
- **Arpa:** İç Anadolu, Ege.
- **Mısır:** Karadeniz, Çukurova, Güneydoğu.
- **Çeltik (pirinç):** Trakya (Meriç Ovası), Samsun (Çarşamba), Kastamonu.

**Endüstri bitkileri:**
- **Pamuk:** Çukurova, Ege (Gediz, Menderes), Güneydoğu Anadolu (GAP sonrası).
- **Şeker pancarı:** İç Anadolu, Marmara, Karadeniz (Samsun).
- **Tütün:** Ege, Karadeniz, Marmara.
- **Çay:** Doğu Karadeniz (Rize). Yazın bol yağış ve nem.
- **Ayçiçeği:** Trakya, Marmara.

**Meyve ve sebze:**
- **Fındık:** Karadeniz. Dünya üretiminin büyük bölümü Türkiye'dendir.
- **İncir ve zeytin:** Ege ve Akdeniz.
- **Turunçgiller:** Akdeniz kıyıları.
- **Üzüm:** Ege (Manisa, Denizli), Doğu Anadolu (Elazığ), Güneydoğu Anadolu.
- **Kayısı:** Malatya. **Fıstık:** Gaziantep.
- **Antep fıstığı** ve **kayısı** gibi ürünlerde Türkiye dünya lideri arasındadır.

## 3. Tarım yöntemleri

- **Kuru tarım:** Yağışa bağlı, sulama yapılmaz. İç Anadolu'da yaygın. Buğday, arpa.
- **Sulu tarım:** Sulama ile yapılır. Ürün çeşitliliği ve verim artar. Çukurova, Ege ovaları.
- **Nadas:** Toprağın dinlendirilmesi, bir yıl ekim yapılmaz. Su tasarrufu. Kuru tarımda verimi artırır.
- **Seracılık:** Örtü altı tarım. Akdeniz kıyılarında (Antalya).
- **Organik tarım:** Kimyasal gübre ve ilaç kullanılmaz.
- **Ekim nöbeti (münavebe):** Aynı toprakta farklı ürünlerin sırayla yetiştirilmesi.

## 4. Hayvancılık

- **Koyun ve keçi:** İç Anadolu, Doğu Anadolu, Güneydoğu. Mera varlığı ve yarı kurak iklim.
- **Büyükbaş (sığır):** Karadeniz, Marmara, Ege. Besi ve süt hayvancılığı.
- **Tavukçuluk:** Marmara ve Ege'de yoğun. Sanayi tipi.
- **Arıcılık:** Karadeniz, Ege, Doğu Anadolu. Türkiye bal üretiminde önemli bir ülkedir.
- **Mera hayvancılığı** geleneksel yöntemlerle, **ahır hayvancılığı** modern yöntemlerle yapılır. **Yaylacılık:** Yazın dağ yaylalarına çıkma.

**Su ürünleri:** Karadeniz'de hamsi, Akdeniz ve Ege'de çipura ve levrek yetiştiriciliği. Bol su kaynaklarında tatlı su balıkçılığı.

**Ormancılık:** Orman alanlarının yüzölçümü içindeki payı yaklaşık %30. Karadeniz ve Akdeniz bölgelerinde yoğun. Kereste, kâğıt, mobilya sanayisi için ham madde sağlar.

## 5. Tarımda sorunlar ve çözümler

**Sorunlar:**
- Küçük ve parçalı araziler (miras yoluyla bölünme).
- Kuraklık ve iklim değişikliği.
- Tarım alanlarının yerleşme ve sanayiye açılması.
- Genç nüfusun tarımdan uzaklaşması.
- Girdi maliyetlerinin yüksekliği, ithal girdi bağımlılığı.

**Çözümler:**
- **Arazi toplulaştırma.**
- Sulama projeleri (GAP).
- Tarım destekleri, kooperatifler.
- Havza bazlı üretim planlaması.
- Teknolojik tarım (damla sulama, akıllı tarım).

## 6. Sık yapılan hatalar

- Pamuğu Karadeniz ürünü sanmak. Sıcak ve sulanan ovaları sever.
- Çayın Akdeniz ürünü olduğunu sanmak. Doğu Karadeniz'de yetişir.
- Nadasın toprağı yıpratma yöntemi olduğunu sanmak. Dinlendirme yöntemidir.
- Fındığı İç Anadolu ürünü sanmak.
- Hayvancılığın yalnızca kırsal olduğunu sanmak. Sanayi tipi besicilik ve tavukçuluk da yaygındır.

:::baglanti
Bu konu, **Ekonomik Faaliyetler ve Doğal Kaynaklar** konusundaki birincil sektörün ayrıntısıdır. **Bölgesel Kalkınma Projeleri** konusu GAP'ın tarım üzerindeki etkisini işler. **Sanayi** konusu tarım ürünlerinin işlenmesiyle bağlantılıdır. **Ekosistem** konusundaki iklim ve biyom bilgisi ürün dağılımını açıklar. **Tarih** dersinde tarımsal üretim, ziraat bankası ve köy enstitüleri ilişkilidir.
:::

## 7. Konuyu toparla

| Ürün | Bölge |
| --- | --- |
| Buğday | İç Anadolu |
| Çay | Doğu Karadeniz |
| Fındık | Karadeniz |
| Pamuk | Çukurova, Ege, Güneydoğu |
| Zeytin | Ege, Akdeniz |
| Kayısı | Malatya |
| Çeltik | Meriç, Çarşamba |

## Mini test

:::soru{cevap="B"}
Aşağıdaki tarım ürünlerinden hangisi Doğu Karadeniz'de yaygın olarak yetiştirilir?

- A) Pamuk
- B) Çay
- C) Zeytin
- D) Buğday
- E) Muz

---

1. Doğu Karadeniz'de yıl boyu yağış ve nemli ılıman iklim çay yetiştiriciliğine uygundur.
2. Doğru cevap B.

Diğer şıklar: **A** Çukurova, Ege / **C** Ege ve Akdeniz / **D** İç Anadolu / **E** Akdeniz kıyıları.
:::

:::soru{cevap="E"}
Yağışa bağlı olarak yapılan, sulamanın bulunmadığı ve İç Anadolu'da yaygın olan tarım şekli aşağıdakilerden hangisidir?

- A) Seracılık
- B) Organik tarım
- C) Sulu tarım
- D) Bahçe tarımı
- E) Kuru tarım

---

1. Kuru tarım yağışa bağlıdır ve sulamaya ihtiyaç duyulmaz.
2. İç Anadolu'da buğday ve arpa kuru tarımla yetiştirilir. Doğru cevap E.

Diğer şıklar: **A** örtü altı / **B** kimyasal kullanılmaz / **C** sulama ile / **D** bahçe ürünleri.
:::

:::soru{cevap="B"}
Aşağıdaki ürün-bölge eşleştirmelerinden hangisi **yanlıştır**?

- A) Fındık: Karadeniz
- B) Pamuk: Doğu Anadolu yaylaları
- C) Kayısı: Malatya
- D) Çay: Rize
- E) Antep fıstığı: Gaziantep

---

1. Pamuk sıcak ve sulanan ovaları sever. Çukurova, Ege ve Güneydoğu Anadolu'da yetişir.
2. Doğu Anadolu yaylaları soğuk ve yüksektir. Doğru cevap B.

Diğer şıklar: **A, C, D, E** doğru eşleştirmeler.
:::

:::soru{cevap="C"}
Türkiye'de tarım arazilerinin küçük ve parçalı olmasının sonuçlarından biri aşağıdakilerden hangisidir?

- A) Makineleşmenin çok kolaylaşması
- B) Birim üretim maliyetinin düşmesi
- C) Verim ve makine kullanımının azalması
- D) Tarımsal ihracatın hızla artması
- E) Sulamanın ve ulaşımın kolaylaşması

---

1. Küçük ve parçalı arazilerde makine kullanımı güçleşir ve maliyet artar.
2. Bu nedenle verim düşer. Çözüm arazi toplulaştırmadır. Doğru cevap C.

Diğer şıklar: **A** tersi / **B** maliyet artar / **D** ihracat artmaz / **E** sulama zorlaşır.
:::

## Kendini dene

:::dene
1. Türkiye'de fındık hangi bölgede yetiştirilir? => Karadeniz.
2. Çukurova'nın en önemli endüstri bitkisi hangisidir? => Pamuk.
3. Toprağın dinlenmesi için ekim yapılmayan uygulamaya ne denir? => Nadas.
4. Malatya hangi ürünüyle ünlüdür? => Kayısı.
5. Aynı toprakta farklı ürünlerin sırayla yetiştirilmesine ne denir? => Ekim nöbeti (münavebe).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-cog1' and name = 'Türkiye''de Tarım ve Hayvancılık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ülke enerjisini nereden sağlar? Türkiye neden petrol ve doğal gazı büyük ölçüde dışarıdan alıyor? Bor, krom ve mermer Türkiye'ye ne kazandırır? Bu konuda **madenlerin türlerini ve dağılışını**, **enerji kaynaklarını** (fosil, yenilenebilir), **Türkiye'nin enerji üretim ve tüketimini**, **dışa bağımlılığı** ve **yenilenebilir enerjiye geçişi** öğreneceksin.

:::hedefler
1. Madenleri metalik ve metalik olmayan olarak ayırmak.
2. Türkiye'nin önemli madenlerini ve bulunduğu yerleri eşleştirmek.
3. Fosil ve yenilenebilir enerji kaynaklarını karşılaştırmak.
4. Türkiye'nin enerji üretiminde hangi kaynakların öne çıktığını söylemek.
5. Enerjide dışa bağımlılığın nedenlerini yorumlamak.
6. Yenilenebilir enerji potansiyelini bölgelerle eşleştirmek.
:::

:::ipucu
Madenleri **oluşum ortamına** bağla: kömür (bataklık bitkilerinden), petrol (deniz canlılarından), metalik madenler (magmatik/volkanik). Türkiye için kısa özet: **Bor, krom, mermer ve linyit** bol. **Petrol ve doğal gaz** yetersiz. **Hidroelektrik, rüzgâr, Güneş ve jeotermal** potansiyeli yüksek.
:::

::video{id="TlC_uJMfI4E" etiket="Konu anlatımı videosu" baslik="Madenler, Enerji Kaynakları ve Çevresel Etkileri" kanal="Benim Hocam"}

## 1. Madenler

**Metalik madenler:**
- **Demir:** Divriği (Sivas), Hekimhan (Malatya), Hasançelebi.
- **Bakır:** Küre (Kastamonu), Murgul (Artvin), Ergani (Diyarbakır), Çayeli (Rize).
- **Krom:** Guleman (Elazığ), Fethiye, Marmaris, Bursa. Türkiye önemli krom üreticisidir.
- **Boksit (alüminyum):** Seydişehir (Konya), Akseki (Antalya).
- **Çinko, kurşun, altın, gümüş.**

**Metalik olmayan madenler:**
- **Bor:** Eskişehir (Kırka), Kütahya (Emet), Balıkesir (Bigadiç). Dünya bor rezervinin büyük bölümü Türkiye'dedir.
- **Mermer:** Afyon, Muğla, Bilecik, Marmara Adası.
- **Seramik hammaddeleri:** Kaolen, feldispat, kuvars (Çanakkale, Bilecik).
- **Tuz:** Tuz Gölü, Çankırı.

## 2. Fosil enerji kaynakları

**Kömür:**
- **Taşkömürü:** Zonguldak. Demir-çelik sanayisinin ham maddesi.
- **Linyit:** Soma (Manisa), Afşin-Elbistan (Kahramanmaraş), Tunçbilek (Kütahya). Termik santrallerde kullanılır. Kalitesi düşüktür ama miktarı fazladır.

**Petrol:**
- **Güneydoğu Anadolu** (Raman, Garzan, Batman). Türkiye'nin üretimi ihtiyacının küçük bir bölümünü karşılar.
- Rafineriler: **İzmit (Tüpraş), İzmir (Aliağa), Kırıkkale, Batman.**

**Doğal gaz:**
- Ülke içi üretim çok sınırlı. Rusya, İran, Azerbaycan gibi ülkelerden **boru hattı** ile ve LNG olarak ithal edilir.
- **Mavi Akım, TürkAkım, BTE (Bakü-Tiflis-Erzurum)**, Azerbaycan'dan **TANAP**.

**Petrol boru hatları:** **Bakü-Tiflis-Ceyhan (BTC)** Hazar petrolünü Ceyhan'a taşır. **Kerkük-Yumurtalık** hattı Irak petrolü için.

## 3. Yenilenebilir enerji kaynakları

- **Hidroelektrik (HES):** Fırat (Atatürk, Keban), Dicle, Kızılırmak, Çoruh. Barajlar. Doğu Anadolu ve Karadeniz'in yüksek, engebeli ve su zengini alanlarında.
- **Rüzgâr:** Ege ve Marmara kıyıları, Çanakkale, İzmir, Balıkesir. Rüzgârı sürekli ve güçlü alanlar.
- **Güneş:** Güney Anadolu, Akdeniz, Güneydoğu Anadolu. Konya, Karapınar bölgesi.
- **Jeotermal:** Batı Anadolu (Denizli, Aydın, Manisa, Kütahya). Türkiye dünya jeotermal sıralamasında üst sıralarda.
- **Biyokütle ve biyogaz.**

**Nükleer enerji:** Mersin Akkuyu'da kurulan santral Türkiye'nin ilk nükleer enerji projesidir.

## 4. Türkiye'nin enerji durumu

- Elektrik üretiminin önemli bölümü **doğal gaz, kömür (linyit ve ithal kömür), hidroelektrik, rüzgâr ve Güneş** kaynaklarından sağlanır.
- **Enerjide dışa bağımlılık** yüksektir (petrol ve doğal gazın büyük bölümü ithal).
- **Yenilenebilir kaynakların payı** son yıllarda hızla artmaktadır. Kurulu güç içinde rüzgâr ve Güneş kapasitesi artıyor.
- **Enerji arz güvenliği:** Çeşitlendirme, depolama, boru hatları, yerli kaynakların kullanımı.
- **Türkiye'nin konumu:** Doğu ve batı arasında **enerji koridoru.** Hazar ve Orta Doğu enerjisini Avrupa'ya taşıyan hatlar.

## 5. Sorunlar ve çözümler

- Fosil yakıtlar **hava kirliliğine ve küresel ısınmaya** yol açar.
- Barajlar ekosistemi ve yerleşimi etkiler.
- Madencilik çevre bozulmasına neden olabilir.

**Çözümler:** Enerji verimliliği, yenilenebilir kaynak yatırımları, geri dönüşüm, çevreye duyarlı madencilik, yerli ve milli teknoloji.

## 6. Sık yapılan hatalar

- Linyiti kaliteli kömür sanmak. Düşük kalitedir.
- Taşkömürünü Soma'ya bağlamak. Taşkömürü Zonguldak'tır, Soma linyittir.
- Türkiye'nin doğal gazda kendine yeterli olduğunu sanmak.
- Boru hatlarını karıştırmak. BTC petrol, TANAP doğal gaz hattıdır.
- Hidroelektrik santralleri yalnızca Doğu Anadolu'da sanmak. Karadeniz ve Güneydoğu'da da yoğun.

:::baglanti
Bu konu, **Ekonomik Faaliyetler ve Doğal Kaynaklar** konusunun enerji ve madencilik ayağıdır. **Sanayi** konusu madenlerin ve enerjinin sanayideki kullanımını işler. **Ulaşım ve Ticaret** konusu boru hatları ve enerji koridorunu kapsar. **Jeopolitik Konum** ve **Ülkeler Arası Etkileşim** (Coğrafya-2) konuları enerji politikalarını stratejik açıdan ele alır. **Fizik** dersindeki enerji dönüşümleri ve **Kimya** dersindeki fosil yakıtlar bu konuyla ilişkilidir.
:::

## 7. Konuyu toparla

| Kaynak | Yer / not |
| --- | --- |
| Taşkömürü | Zonguldak |
| Linyit | Soma, Afşin-Elbistan |
| Bor | Kırka, Emet, Bigadiç |
| Krom | Guleman, Fethiye |
| Bakır | Küre, Murgul |
| BTC | Petrol hattı |
| Jeotermal | Batı Anadolu |

## Mini test

:::soru{cevap="D"}
Aşağıdakilerden hangisi Türkiye'nin taşkömürü üretim merkezidir?

- A) Soma
- B) Afşin-Elbistan
- C) Tunçbilek
- D) Zonguldak
- E) Batman

---

1. Zonguldak Türkiye'nin tek taşkömürü havzasıdır ve demir-çelik sanayisinin ham maddesini sağlar.
2. Doğru cevap D.

Diğer şıklar: **A, B, C** linyit / **E** petrol.
:::

:::soru{cevap="A"}
Türkiye'nin dünya rezervleri içinde çok önemli bir paya sahip olduğu maden aşağıdakilerden hangisidir?

- A) Bor
- B) Kömür
- C) Petrol
- D) Doğal gaz
- E) Uranyum

---

1. Bor madeni rezervlerinin büyük bölümü Türkiye'de bulunur (Kırka, Emet, Bigadiç).
2. Doğru cevap A.

Diğer şıklar: **B** orta düzey / **C, D** yetersiz / **E** önemli rezerv yok.
:::

:::soru{cevap="E"}
Hazar Denizi çevresindeki petrolü Ceyhan Limanı'na taşıyan boru hattı aşağıdakilerden hangisidir?

- A) Mavi Akım
- B) TürkAkım
- C) TANAP
- D) Kerkük-Yumurtalık
- E) Bakü-Tiflis-Ceyhan

---

1. BTC hattı Azerbaycan, Gürcistan ve Türkiye üzerinden Ceyhan'a ulaşır.
2. Doğru cevap E.

Diğer şıklar: **A, B, C** doğal gaz hatları / **D** Irak petrolü hattı.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi Türkiye'de enerjide dışa bağımlılığı artıran etkenlerden biridir?

- A) Hidroelektrik potansiyelin yüksek olması
- B) Rüzgâr ve Güneş enerjisi potansiyeli
- C) Jeotermal kaynakların zenginliği
- D) Petrol ve doğal gaz rezervinin az olması
- E) Linyit rezervlerinin fazla olması

---

1. Türkiye'nin petrol ve doğal gaz rezervleri tüketime göre çok azdır.
2. Bu nedenle bu kaynaklar büyük ölçüde ithal edilir. Doğru cevap D.

Diğer şıklar: **A, B, C, E** yerli kaynaklardır ve bağımlılığı azaltır.
:::

## Kendini dene

:::dene
1. Taşkömürü hangi ilimizde çıkarılır? => Zonguldak.
2. Linyit rezervi ile ünlü bir havza söyleyiniz. => Soma ya da Afşin-Elbistan.
3. Türkiye'de hangi maden dünya rezervinde önemli yer tutar? => Bor.
4. BTC hattı hangi limana ulaşır? => Ceyhan.
5. Jeotermal enerji potansiyeli en çok hangi bölgededir? => Batı Anadolu.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-cog1' and name = 'Madenler ve Enerji Kaynakları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir fabrika neden hep aynı bölgelerde toplanır? Demir-çelik tesisleri neden kıyıda ya da kömür havzasındadır? **Sanayi**, ham maddenin işlenerek **ürüne dönüştürüldüğü** üretim faaliyetidir. Bu konuda **sanayinin yer seçimini etkileyen etkenleri**, **sanayi türlerini**, **Türkiye'de başlıca sanayi kollarını ve merkezlerini**, **organize sanayi bölgelerini** ve **sanayileşmenin sonuçlarını** öğreneceksin.

:::hedefler
1. Sanayinin yer seçimini etkileyen etkenleri sıralamak.
2. Sanayi kollarını ham maddeye ve ürüne göre ayırmak.
3. Türkiye'nin başlıca sanayi merkezlerini kollarıyla eşleştirmek.
4. Organize sanayi bölgesi (OSB) ve serbest bölge kavramlarını ayırt etmek.
5. Sanayileşmenin ekonomik ve çevresel sonuçlarını yorumlamak.
:::

:::ipucu
Yer seçiminde **ham maddeye mi, pazara mı, işgücüne mi yakınlık** önemli? Ağır ham maddeli ve ağırlık kaybeden sanayiler (demir-çelik, çimento, şeker) ham maddeye yakın, hafif ve pazar odaklı sanayiler (dokuma, elektronik, otomotiv montajı) pazar ve işgücüne yakın kurulur.
:::

::video{id="0ZtJ_L-P7Gw" etiket="Konu anlatımı videosu" baslik="Türkiye'de Sanayi" kanal="Benim Hocam"}

## 1. Sanayinin yer seçimini etkileyen etkenler

- **Ham madde:** En belirleyici etkenlerden. Ağırlık kaybeden ham maddeler kaynağında işlenir.
- **Enerji:** Özellikle ağır sanayi için.
- **Ulaşım:** Kara, demir, deniz yolu bağlantısı. Limanlara yakınlık.
- **Pazar:** Ürünün satılacağı büyük nüfuslu merkezlere yakınlık.
- **İşgücü ve sermaye.**
- **Su:** Kâğıt, tekstil, kimya sanayisinde.
- **Teknoloji ve devlet politikaları:** Teşvik, vergi, OSB'ler.

## 2. Sanayi kolları

**Ham maddesi tarımdan gelenler:**
- **Gıda:** Şeker, un, yağ, konserve, süt ürünleri. Kentlerde ve tarım bölgelerinde.
- **Dokuma ve tekstil:** Pamuk, yün. Ege, Çukurova, Marmara.
- **Deri ve ayakkabı.**

**Ham maddesi madenden gelenler:**
- **Demir-çelik:** Karabük (iç kesimde, kömür ve demir yakın), Ereğli (Zonguldak, kıyıda), İskenderun (Hatay). Karabük Türkiye'nin ilk demir-çelik tesisi (1939).
- **Çimento, seramik, cam:** Her bölgede. Ham maddeye yakın.
- **Alüminyum:** Seydişehir (Konya).
- **Bakır:** Samsun (Karadeniz Bakır İşletmeleri).

**Ham maddesi ithal edilenler:**
- **Petro-kimya:** Aliağa (İzmir), İzmit (Kocaeli), Yarımca. Petrol rafinerileri.
- **Otomotiv:** Bursa, Kocaeli, İstanbul, Sakarya. Yan sanayi ile birlikte.
- **Elektronik ve beyaz eşya:** İstanbul, Kocaeli, Manisa, Eskişehir.

**Diğer:** Gemi inşa (Tuzla, Yalova), savunma sanayisi (Ankara, Kırıkkale), mobilya (Kayseri, Bursa İnegöl).

## 3. Türkiye'de sanayinin dağılışı

- **En gelişmiş bölge Marmara** (İstanbul-Kocaeli-Sakarya-Bursa). Sanayi, ticaret, nüfus ve ulaşım bir arada.
- **Ege:** İzmir, Manisa, Denizli (tekstil), Aydın. Gıda ve tekstil.
- **Akdeniz:** Adana-Mersin (tekstil, gıda), İskenderun (demir-çelik).
- **İç Anadolu:** Ankara, Konya, Kayseri, Eskişehir. Makine, otomotiv, havacılık, savunma.
- **Karadeniz:** Zonguldak-Karabük-Ereğli (demir-çelik), Samsun.
- **Güneydoğu:** Gaziantep (tekstil, gıda), son yıllarda GAP ile gelişen.
- **Doğu Anadolu:** Sanayi az gelişmiş. Teşviklerle destekleniyor.

## 4. Organize sanayi bölgeleri

**Organize Sanayi Bölgesi (OSB):** Sanayi kuruluşlarının planlı olarak bir araya getirildiği, altyapısı hazır bölgelerdir. Amaçları:
- Sanayiyi planlı yerleştirmek, kentleri korumak.
- Altyapı maliyetlerini azaltmak.
- Çevre kirliliğini kontrol etmek.

**Serbest bölgeler:** Dış ticareti kolaylaştırmak için gümrük ve vergi muafiyeti sağlanan alanlar (Mersin, İzmir, Kocaeli serbest bölgeleri).

**Teknoloji geliştirme bölgeleri (Teknokent):** Ar-Ge ve yüksek teknoloji.

## 5. Sanayileşmenin sonuçları

**Olumlu:**
- İstihdam, gelir, ihracat.
- Teknoloji gelişimi.
- Kentleşme ve altyapı.

**Olumsuz:**
- Hava, su, toprak kirliliği.
- Plansız kentleşme, tarım alanlarının yok olması.
- Bölgeler arası gelişmişlik farkı.
- Doğal kaynakların tükenmesi.

## 6. Sık yapılan hatalar

- Sanayi tesislerinin her zaman ham maddeye yakın kurulduğunu sanmak. Pazar ve işgücü de belirleyicidir.
- Karabük'ün kıyıda olduğunu sanmak. Karabük iç kesimdedir, Ereğli kıyıdadır.
- OSB ile serbest bölgeyi karıştırmak. OSB planlı sanayi alanıdır, serbest bölge gümrük avantajlıdır.
- Otomotiv sanayisini yalnızca ham maddeye bağlı sanmak.
- Doğu Anadolu'da sanayinin yoğun olduğunu sanmak.

:::baglanti
Bu konu, **Madenler ve Enerji Kaynakları** konusunun ürettiği ham maddelerin işlenmesidir. **Ulaşım ve Ticaret** konusu sanayi ürünlerinin pazara ulaşmasını işler. **Bölgesel Kalkınma Projeleri** konusu sanayinin dengeli dağılımı için yapılan çalışmaları ele alır. **Ekonomik Faaliyetler** konusundaki sektör ayrımı sanayinin yerini belirler. **Kimya** dersinde petro-kimya, **Fizik** dersinde enerji bu başlıkla ilişkilidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| En gelişmiş sanayi bölgesi | Marmara |
| İlk demir-çelik tesisi | Karabük (1939) |
| Kıyıdaki demir-çelik | Ereğli, İskenderun |
| Alüminyum | Seydişehir |
| Organize sanayi bölgesi | Planlı sanayi alanı |
| Serbest bölge | Gümrük avantajı |

## Mini test

:::soru{cevap="B"}
Aşağıdaki sanayi tesislerinden hangisinin kuruluşunda ham maddeye yakınlık en önemli etkendir?

- A) Otomobil montaj tesisi
- B) Çimento fabrikası
- C) Elektronik tesisi
- D) Hazır giyim atölyesi
- E) Yazılım şirketi

---

1. Çimento üretiminde kullanılan ham madde ağırdır ve taşınması maliyetlidir.
2. Bu nedenle ham madde kaynağı yakınında kurulur. Doğru cevap B.

Diğer şıklar: **A, C, D** pazar ve işgücü / **E** bilgi sektörü.
:::

:::soru{cevap="A"}
Türkiye'nin ilk demir-çelik tesisi aşağıdaki hangi ilde kurulmuştur?

- A) Karabük
- B) Ereğli
- C) İskenderun
- D) Sivas
- E) Kayseri

---

1. Karabük Demir-Çelik Fabrikaları 1939'da kurulmuştur.
2. Ereğli (1965) ve İskenderun (1970'lerde) sonradan açılmıştır. Doğru cevap A.

Diğer şıklar: **B, C** sonraki yıllar / **D** demir cevheri çıkarılır / **E** makine ve gıda.
:::

:::soru{cevap="C"}
Sanayinin planlı olarak bir araya getirildiği, altyapısı hazır olan alanlara ne ad verilir?

- A) Serbest ticaret bölgesi
- B) Teknopark bölgesi
- C) Organize sanayi bölgesi
- D) Lojistik köy merkezi
- E) Kalkınma ajansı birimi

---

1. OSB, sanayi tesislerinin planlı bir arada bulunduğu bölgelerdir.
2. Altyapı ve çevre kontrolü kolaylaşır. Doğru cevap C.

Diğer şıklar: **A** gümrük ve vergi avantajı / **B** Ar-Ge / **D** taşımacılık / **E** bölgesel planlama kurumu.
:::

:::soru{cevap="E"}
Türkiye'de sanayinin en gelişmiş olduğu bölge aşağıdakilerden hangisidir?

- A) Doğu Anadolu
- B) Güneydoğu Anadolu
- C) Karadeniz
- D) İç Anadolu
- E) Marmara

---

1. Marmara'da sanayi, ticaret, nüfus ve ulaşım ağı bir arada gelişmiştir.
2. Türkiye'nin sanayi üretiminin en büyük bölümü buradan gelir. Doğru cevap E.

Diğer şıklar: **A, B** sanayi az gelişmiş / **C, D** önemli ama Marmara'nın gerisinde.
:::

## Kendini dene

:::dene
1. Ağırlık kaybeden ham maddeli sanayiler nerede kurulur? => Ham madde kaynağına yakın.
2. Karabük'te hangi sanayi vardır? => Demir-çelik.
3. Alüminyum tesisi hangi ilimizdedir? => Konya (Seydişehir).
4. OSB'nin amacı nedir? => Sanayiyi planlı yerleştirmek.
5. Türkiye'nin en gelişmiş sanayi bölgesi hangisidir? => Marmara.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-cog1' and name = 'Sanayi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ürün üretildiği yerden satılacağı yere nasıl ulaşır? Türkiye'nin konumu neden ticaret için bir avantajdır? **Ulaşım**, insan ve yükün bir yerden başka bir yere taşınmasıdır. **Ticaret**, mal ve hizmetlerin alınıp satılmasıdır. Bu konuda **ulaşım türlerini** (kara, demir, deniz, hava, boru hattı), **Türkiye'nin ulaşım ağını**, **dış ticaretin yapısını**, **ticaret ortaklarını** ve **lojistik** merkezlerini öğreneceksin.

:::hedefler
1. Ulaşım türlerinin üstünlük ve sınırlılıklarını karşılaştırmak.
2. Türkiye'nin başlıca ulaşım koridorlarını ve projelerini söylemek.
3. Dış ticaretin ihracat ve ithalat yapısını yorumlamak.
4. Başlıca ticaret ortaklarını ve ürün gruplarını ayırt etmek.
5. Ulaşım ve ticaretin ekonomik gelişmeye katkısını açıklamak.
:::

:::ipucu
Ulaşım türlerini **maliyet, hız ve yük kapasitesine** göre karşılaştır. Deniz yolu en ucuz ve yüksek kapasiteli, hava yolu en hızlı ama pahalıdır. Kara yolu esnektir, demir yolu ağır yükte ekonomiktir. Türkiye'de yolcu ve yükün çoğu hâlâ kara yoluyla taşınır.
:::

::video{id="Z8MDh5jhMtY" etiket="Konu anlatımı videosu" baslik="Türkiye'de Ulaşım" kanal="Benim Hocam"}

## 1. Ulaşım türleri

- **Kara yolu:** Esnek, kapıdan kapıya. Kısa-orta mesafe. Türkiye'de yolcu ve yükün büyük bölümü. Maliyeti ve karbon salımı yüksek.
- **Demir yolu:** Ağır yük ve toplu taşıma için ekonomik. Yüksek hızlı tren (YHT) Ankara-İstanbul, Ankara-Konya, Ankara-Sivas.
- **Deniz yolu:** En ucuz ve en yüksek kapasiteli. Dış ticaretin büyük bölümü (ağırlık olarak) buradan. Türkiye üç tarafı denizle çevrili.
- **Hava yolu:** En hızlı. Yolcu, değerli ve çabuk bozulan yük. İstanbul Havalimanı büyük aktarma merkezi.
- **Boru hattı:** Petrol, doğal gaz, su. Sürekli ve ucuz. BTC, TANAP.

## 2. Türkiye'de ulaşım

**Kara yolu:** Otoyollar, bölünmüş yollar. **Kuzey Marmara Otoyolu**, **Avrasya Tüneli**, **Yavuz Sultan Selim Köprüsü**, **1915 Çanakkale Köprüsü**, **Osmangazi Köprüsü**.

**Demir yolu:** Cumhuriyet'in ilk yıllarında yoğun hat inşası. **Marmaray** (2013) Asya ile Avrupa'yı deniz altından birleştirir. **Bakü-Tiflis-Kars** hattı Orta Asya-Avrupa bağlantısı. Yüksek hızlı tren hatları genişliyor.

**Deniz yolu:** Önemli limanlar: **Ambarlı, Mersin, İzmir (Alsancak), İskenderun, Samsun, Trabzon.** **İstanbul ve Çanakkale Boğazları** uluslararası ticarette stratejik.

**Hava yolu:** İstanbul, Ankara, İzmir, Antalya havalimanları. Dünyada birçok ülkeye doğrudan uçuş.

**Boru hatları:** Petrol ve doğal gaz.

## 3. Ticaret

**İç ticaret:** Ülke içinde alım satım. Pazarlar, halleri, alışveriş merkezleri.

**Dış ticaret:**
- **İhracat:** Yurt dışına satış. **İthalat:** Yurt dışından alış. **Dış ticaret dengesi** = ihracat $-$ ithalat. Türkiye genelde **dış ticaret açığı** verir.
- **İhracat ürünleri:** Otomotiv, hazır giyim ve tekstil, makine, demir-çelik, elektronik, gıda, kimya, savunma sanayi ürünleri.
- **İthalat ürünleri:** Enerji (petrol, doğal gaz), ara malları, makine, altın, elektronik.
- **Ticaret ortakları:** Almanya, Birleşik Krallık, ABD, İtalya, Fransa gibi Avrupa ülkeleri ihracatta, Rusya, Çin, Almanya ithalatta öne çıkar.
- **Serbest ticaret anlaşmaları, Gümrük Birliği** (AB ile) ticareti destekler.

## 4. Türkiye'nin konumu ve ticaret avantajı

- **Üç kıtanın kesişim noktasında** (Asya, Avrupa, Afrika).
- **Boğazlar** Karadeniz'i Akdeniz'e bağlar. **Montrö Sözleşmesi (1936)** boğazlardan geçişi düzenler.
- **Enerji ve ticaret koridoru:** Orta Doğu, Hazar ve Orta Asya'yı Avrupa'ya bağlar.
- **Lojistik üs:** Limanlar, havalimanları, serbest bölgeler.
- **Yeni İpek Yolu / Orta Koridor:** Çin-Orta Asya-Hazar-Kafkasya-Türkiye-Avrupa hattı.

## 5. Sorunlar ve çözümler

- Kara yolu ağırlığı ve karbon salımı.
- Kombine (çok modlu) taşımacılığın yetersizliği.
- Dış ticaret açığı, enerji ithalatına bağımlılık.

**Çözümler:** Demir yolu ve deniz yolu payını artırmak, lojistik merkezler, dijital gümrük, ihracat çeşitlendirme, katma değerli ürün ihracatı.

## 6. Sık yapılan hatalar

- Türkiye'de en çok kullanılan ulaşım türünü demir yolu sanmak. Kara yoludur.
- Marmaray'ı köprü sanmak. Deniz altı tüp geçittir.
- İhracat ve ithalatı karıştırmak.
- Montrö Sözleşmesi'ni Lozan ile karıştırmak.
- Hava yolunun ağır yük için ucuz olduğunu sanmak.

:::baglanti
Bu konu, **Sanayi** konusunun ürünlerinin pazarlanmasıdır. **Madenler ve Enerji Kaynakları** konusundaki boru hatları burada da ele alınır. **Turizm** konusu ulaşım ağına bağlıdır. **Jeopolitik Konum** ve **Ülkeler Arası Etkileşim** (Coğrafya-2) konuları boğazlar ve koridorlar bakımından bu konuyu tamamlar. **Tarih** dersindeki Montrö ve Lozan, **Küreselleşen Dünya** konusundaki Gümrük Birliği ile ilişkilidir.
:::

## 7. Konuyu toparla

| Ulaşım | Üstünlüğü |
| --- | --- |
| Kara yolu | Esnek, yaygın |
| Demir yolu | Ağır yükte ekonomik |
| Deniz yolu | En ucuz, en çok yük |
| Hava yolu | En hızlı |
| Boru hattı | Petrol ve gaz |
| Marmaray | Deniz altı tüp geçit (2013) |

## Mini test

:::soru{cevap="E"}
Aşağıdaki ulaşım türlerinden hangisi en yüksek yük kapasitesine ve en düşük birim maliyete sahiptir?

- A) Kara yolu
- B) Demir yolu
- C) Hava yolu
- D) Boru hattı
- E) Deniz yolu

---

1. Deniz yolu, büyük gemilerle çok yüksek hacimde yükü ucuza taşır.
2. Dış ticaretin ağırlık olarak büyük bölümü bu yolla yapılır. Doğru cevap E.

Diğer şıklar: **A** esnek ama pahalı / **B** ağır yük için ekonomik ama sabit hat / **C** en hızlı ama pahalı / **D** yalnızca akışkanlar.
:::

:::soru{cevap="C"}
Marmaray projesi ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Asya ve Avrupa'yı birleştiren bir asma köprüdür.
- B) Karadeniz'i Marmara'ya bağlayan kanaldır.
- C) Asya ve Avrupa'yı deniz altından birleştirir.
- D) Ankara-İstanbul yüksek hızlı tren hattıdır.
- E) Bir boru hattı projesidir.

---

1. Marmaray 2013'te açılan, İstanbul Boğazı'nın altından geçen raylı sistem tüneldir.
2. Asya ve Avrupa yakasını birleştirir. Doğru cevap C.

Diğer şıklar: **A** Yavuz Sultan Selim vb. / **B** Kanal İstanbul tartışması / **D** YHT / **E** BTC.
:::

:::soru{cevap="D"}
Dış ticaret dengesi aşağıdakilerden hangisiyle hesaplanır?

- A) İthalat $+$ İhracat
- B) İthalat $\times$ İhracat
- C) İhracat $\div$ Nüfus
- D) İhracat $-$ İthalat
- E) İthalat $\div$ İhracat

---

1. Dış ticaret dengesi, ihracat ile ithalat arasındaki farktır.
2. İhracat ithalattan azsa dış ticaret açığı oluşur. Doğru cevap D.

Diğer şıklar: **A, B, C, E** denge göstergesi değil.
:::

:::soru{cevap="B"}
Türkiye'nin dış ticarette sahip olduğu aşağıdaki avantajlardan hangisi coğrafi konumundan kaynaklanır?

- A) Petrol rezervlerinin fazla olması
- B) Üç kıtanın kesişimi ve boğazların konumu
- C) Geniş tarım alanlarının bulunması
- D) Nüfusun genç olması
- E) Dünyanın en büyük bor rezervine sahip olması

---

1. Türkiye Asya, Avrupa ve Afrika'nın kesiştiği alanda, boğazlara sahip olarak ticaret koridoru oluşturur.
2. Doğru cevap B.

Diğer şıklar: **A** yetersiz / **C, D** konumla ilgili değil / **E** maden zenginliği.
:::

## Kendini dene

:::dene
1. Türkiye'de en çok kullanılan ulaşım türü hangisidir? => Kara yolu.
2. Marmaray hangi yıl açıldı? => 2013.
3. En ucuz taşıma yolu hangisidir? => Deniz yolu.
4. Boğazlardan geçişi düzenleyen sözleşme hangisidir? => Montrö Boğazlar Sözleşmesi (1936).
5. İhracat ithalattan az olursa ne olur? => Dış ticaret açığı oluşur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-cog1' and name = 'Ulaşım ve Ticaret'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Milyonlarca insan her yıl neden Türkiye'ye geliyor? Turizm yalnızca deniz-kum-güneş midir? **Turizm**, insanların en az bir gece kalmak koşuluyla yaşadıkları yerin dışına **dinlenme, eğlenme, inanç, sağlık, spor ve kültür** amacıyla yaptığı seyahatlerdir. Bu konuda **turizmi etkileyen etkenleri**, **turizm türlerini**, **Türkiye'nin turizm bölgelerini ve merkezlerini**, **turizmin ekonomiye katkısını** ve **sorunlarını** öğreneceksin.

:::hedefler
1. Turizmi etkileyen doğal ve beşerî etkenleri sıralamak.
2. Turizm türlerini (deniz, kış, kültür, inanç, sağlık, yayla, kongre) eşleştirmek.
3. Türkiye'nin turizm merkezlerini yerleriyle bilmek.
4. Turizmin ekonomiye katkısını ve sorunlarını yorumlamak.
5. Sürdürülebilir turizm kavramını açıklamak.
:::

:::ipucu
Turizm türünü **çekiciliğin kaynağına** bağla: iklim ve deniz (kıyı turizmi), kar ve yükselti (kış turizmi), tarihî eser (kültür turizmi), kutsal mekân (inanç turizmi), kaplıca ve jeotermal (sağlık turizmi). Doğal çekicilikler iklimi ve yer şekillerine, beşerî çekicilikler tarihe ve kültüre dayanır.
:::

::video{id="NaMQame7qnU" etiket="Konu anlatımı videosu" baslik="Türkiye'de Turizm" kanal="Coğrafyanın Kodları"}

## 1. Turizmi etkileyen etkenler

**Doğal etkenler:**
- Deniz, kum, plajlar (kıyı şekilleri).
- İklim (ılıman, güneşli yaz).
- Dağlar, karlı alanlar, yaylalar, şelaleler, mağaralar.
- Kaplıcalar ve jeotermal kaynaklar.
- Milli parklar, doğal güzellikler.

**Beşerî etkenler:**
- Tarihî eserler, antik kentler, müzeler, kültür.
- İnanç merkezleri.
- Ulaşım ve konaklama olanakları.
- Güvenlik, politik istikrar.
- Tanıtım ve turizm politikaları.
- Kişi başına gelir ve boş zaman.

## 2. Turizm türleri

- **Deniz-kum-güneş (kıyı) turizmi:** Antalya, Muğla (Bodrum, Marmaris, Fethiye), Aydın (Kuşadası), İzmir (Çeşme). Türkiye turizminin ana gelir kaynağı.
- **Kış turizmi:** Uludağ (Bursa), Erciyes (Kayseri), Palandöken (Erzurum), Sarıkamış (Kars), Kartalkaya (Bolu), Kartepe, Davraz.
- **Kültür turizmi:** Efes, Bergama, Truva, Göbeklitepe, Nemrut, Ani, Kapadokya, Mardin, İstanbul'un tarihî alanları.
- **İnanç turizmi:** İstanbul, Konya (Mevlana), Mardin, Hatay (Antakya), Efes (Meryem Ana Evi), Şanlıurfa (Balıklıgöl).
- **Sağlık turizmi:** Pamukkale, Bursa, Afyon, Yalova, Kütahya kaplıcaları. Tıp turizmi (İstanbul, Ankara, İzmir).
- **Yayla ve doğa turizmi:** Karadeniz yaylaları (Uzungöl, Ayder), Munzur Vadisi, Salda Gölü.
- **Kongre, fuar ve sanat turizmi:** İstanbul, Ankara, Antalya, İzmir.
- **Kırsal ve gastronomi turizmi:** Hatay, Gaziantep, Şanlıurfa mutfakları.

## 3. Türkiye'nin turizm potansiyeli

- **Üç tarafı denizlerle çevrili** uzun kıyı şeridi.
- **Çeşitli iklim** ve zengin doğal çeşitlilik.
- **Zengin tarihî miras:** Birçok uygarlığa ev sahipliği yapmış Anadolu. UNESCO Dünya Mirası listesinde çok sayıda alan.
- **Dünya turizminde ilk onda** yer alan ülkeler arasındadır.
- **En çok turist gelen ülkeler:** Rusya, Almanya, Birleşik Krallık gibi Avrupa ülkeleri.
- **En çok ziyaret edilen il:** İstanbul ve Antalya.

**Mevsimsellik:** Turizmin yaz aylarında yoğunlaşması. Çözüm: Kış, kültür, inanç, sağlık turizmi ile **12 aya yayma.**

## 4. Turizmin ekonomiye katkısı ve sorunları

**Katkılar:**
- Döviz girdisi, cari açığı azaltma.
- İstihdam, yerel kalkınma.
- Ulaşım, konaklama ve hizmet sektörlerinin gelişmesi.
- Kültürel etkileşim ve tanıtım.

**Sorunlar:**
- Mevsimlik istihdam.
- Doğal ve tarihî alanların bozulması, çevre kirliliği.
- Plansız yapılaşma, tarım alanlarının turizme açılması.
- Dışa bağımlılık: Dış piyasadaki krizler turizmi etkiler.
- Su kaynaklarının aşırı kullanımı.

## 5. Sürdürülebilir turizm

Doğa ve kültürel mirası koruyarak yerel halkın faydasını gözeten turizmdir. **Taşıma kapasitesi** gözetilir. **Ekoturizm, agroturizm, kırsal turizm** örnekleridir. Bölgeye özgü, çevreye duyarlı yatırımlar ve sertifikalı işletmeler (Mavi Bayrak) bu anlayışın aracıdır.

## 6. Sık yapılan hatalar

- Turizmin yalnızca yaz mevsiminde olduğunu sanmak. Kış, kültür, sağlık turizmi de vardır.
- Pamukkale'yi kış turizmi sanmak. Sağlık ve doğal güzellik turizmidir.
- Kapadokya'yı deniz turizmi merkezi sanmak. Kültür ve doğa turizmi.
- Turizmin sorunsuz bir gelir kaynağı olduğunu sanmak.
- Uludağ ve Erciyes'in kıyı turizmiyle ilgili olduğunu sanmak.

:::baglanti
Bu konu, **Ulaşım ve Ticaret** konusuna dayanır. Ulaşım ve konaklama, turizmin altyapısıdır. **Çevre ve Toplum** ile **Doğal Kaynakların Sürdürülebilir Kullanımı** (Coğrafya-2) konuları sürdürülebilir turizm anlayışını tamamlar. **Tarih** dersindeki antik kentler, Selçuklu ve Osmanlı mimarisi kültür turizminin temelidir. **Edebiyat** dersindeki Mevlana ve Hacı Bektaş Veli gibi isimler inanç turizmiyle ilişkilidir.
:::

## 7. Konuyu toparla

| Tür | Örnek |
| --- | --- |
| Deniz-kum-güneş | Antalya, Bodrum |
| Kış turizmi | Uludağ, Erciyes |
| Kültür | Efes, Kapadokya |
| İnanç | Konya, Mardin |
| Sağlık | Pamukkale, Bursa |
| Yayla | Uzungöl, Ayder |

## Mini test

:::soru{cevap="A"}
Aşağıdakilerden hangisi kış turizmi merkezlerinden biridir?

- A) Uludağ
- B) Bodrum
- C) Pamukkale
- D) Efes
- E) Kuşadası

---

1. Uludağ, Bursa'da kayak ve kış sporlarının yapıldığı merkezdir.
2. Doğru cevap A.

Diğer şıklar: **B** kıyı turizmi / **C** sağlık ve doğal güzellik / **D** kültür turizmi / **E** kıyı turizmi.
:::

:::soru{cevap="C"}
Türkiye turizminin yaz aylarında yoğunlaşması sorununun çözümü için aşağıdakilerden hangisi önerilebilir?

- A) Yalnızca kıyı turizmini geliştirmek
- B) Turizm yatırımlarını azaltmak
- C) Kış ve kültür turizmini geliştirmek
- D) Tanıtım çalışmalarını durdurmak
- E) Yeni otel yapımını artırmak

---

1. Mevsimsellik, farklı turizm türleriyle 12 aya yayılabilir.
2. Kış, kültür, inanç ve sağlık turizmi yaz dışındaki aylarda da turist çeker. Doğru cevap C.

Diğer şıklar: **A** mevsimselliği artırır / **B, D** çözüm değil / **E** mevsimselliği çözmez.
:::

:::soru{cevap="B"}
Aşağıdaki turizm merkezi-türü eşleştirmelerinden hangisi **yanlıştır**?

- A) Antalya: Kıyı turizmi
- B) Erciyes: Deniz turizmi
- C) Efes: Kültür turizmi
- D) Pamukkale: Sağlık turizmi
- E) Konya: İnanç turizmi

---

1. Erciyes, Kayseri'de kayak yapılan bir kış turizmi merkezidir.
2. Deniz turizmi ile ilgisi yoktur. Doğru cevap B.

Diğer şıklar: **A, C, D, E** doğru eşleştirmeler.
:::

:::soru{cevap="A"}
Turizmin ekonomiye katkısı olarak aşağıdakilerden hangisi **söylenemez**?

- A) Dış ticaret açığını artırması
- B) Döviz girdisi sağlaması
- C) İstihdam yaratması
- D) Hizmet sektörünü geliştirmesi
- E) Bölgesel kalkınmaya katkıda bulunması

---

1. Turizm döviz girdisi sağlayarak dış ticaret ve cari açığı azaltmaya yardımcı olur.
2. Dolayısıyla açığı artırması bir katkı değildir. Doğru cevap A.

Diğer şıklar: **B, C, D, E** turizmin ekonomik katkıları.
:::

## Kendini dene

:::dene
1. Kayak merkezi olan bir dağ söyleyiniz. => Uludağ, Erciyes ya da Palandöken.
2. Mevlana türbesi hangi ildedir? => Konya.
3. Sağlık turizminde öne çıkan Denizli'deki yer neresidir? => Pamukkale.
4. Turizmin mevsimsel olması neden sorundur? => Gelir ve istihdam yaz aylarında yoğunlaşır.
5. Doğayı koruyarak yapılan turizme ne denir? => Sürdürülebilir turizm (ekoturizm).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-cog1' and name = 'Turizm'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden Marmara ile Doğu Anadolu arasında bu kadar büyük bir gelişmişlik farkı var? Devlet bu farkı nasıl kapatmaya çalışıyor? **Bölgesel kalkınma**, ülkenin bölgeleri arasındaki gelişmişlik farklarını azaltmak amacıyla yapılan **planlı çalışmalardır.** Bu konuda **bölgeler arası farkın nedenlerini**, **Türkiye'deki kalkınma projelerini** (GAP, DAP, KOP, DOKAP), **kalkınma ajanslarını** ve **projelerin sonuçlarını** öğreneceksin.

:::hedefler
1. Bölgeler arası gelişmişlik farkının nedenlerini söylemek.
2. GAP, DAP, KOP ve DOKAP projelerini bölge ve amaçlarıyla eşleştirmek.
3. Kalkınma projelerinin sosyal, ekonomik ve çevresel sonuçlarını yorumlamak.
4. Kalkınma ajanslarının görevini açıklamak.
5. Dengeli kalkınmanın önemini değerlendirmek.
:::

:::ipucu
Bölgesel kalkınma projelerini **harita üzerinde** düşün: **GAP** Güneydoğu (Fırat-Dicle), **DAP** Doğu Anadolu, **KOP** Konya Ovası ve çevresi, **DOKAP** Doğu Karadeniz, **ZBK** Zonguldak-Bartın-Karabük, **YHGP** Yeşilırmak Havzası. İsmindeki harfler bölgeyi söyler.
:::

::video{id="nHVDZEN2yvQ" etiket="Konu anlatımı videosu" baslik="Türkiye'de Bölgesel Kalkınma Projeleri" kanal="Benim Hocam"}

## 1. Bölgeler arası gelişmişlik farkı

**Nedenleri:**
- Doğal etkenler: İklim, yer şekilleri, kaynaklar.
- Ulaşım olanaklarının yetersizliği.
- Sanayi ve hizmet sektörünün belli bölgelerde toplanması.
- Tarihî nedenler ve göç.
- Yatırımların belli yerlerde yoğunlaşması.

**Sonuçları:**
- Göç ve nüfus yığılması.
- İşsizlik ve gelir farkı.
- Kentlerde çarpık yapılaşma.
- Güvenlik ve sosyal sorunlar.

Türkiye'de **Marmara ve Ege** gelişmiş, **Doğu ve Güneydoğu Anadolu** daha az gelişmiştir.

## 2. Bölgesel kalkınma projeleri

**GAP (Güneydoğu Anadolu Projesi):**
- Fırat ve Dicle üzerinde 22 baraj ve 19 hidroelektrik santral planlanan dev projedir.
- Kapsadığı iller: Adıyaman, Batman, Diyarbakır, Gaziantep, Kilis, Mardin, Siirt, Şanlıurfa ve Şırnak.
- **Atatürk Barajı** projenin en büyük barajıdır. **Şanlıurfa tüneli** Harran Ovası'nı sular.
- Amaç: Sulama (tarım verimi), enerji üretimi, sanayi ve istihdam, bölgeler arası farkı azaltma.
- Sonuç: Pamuk, mısır, sebze üretimi arttı. Ürün çeşitliliği ve tarıma dayalı sanayi gelişti.

**DAP (Doğu Anadolu Projesi):**
- Doğu Anadolu'yu kapsar. Tarım, hayvancılık, turizm, enerji ve altyapı.

**KOP (Konya Ovası Projesi):**
- Konya Ovası ve çevresi. **Sulu tarım, su yönetimi.** Kuraklık ve yeraltı suyu azalması ana sorun.

**DOKAP (Doğu Karadeniz Projesi):**
- Doğu Karadeniz. Turizm, tarım, enerji ve ulaşım. Yaylacılık, çay ve fındık.

**Diğer:** **ZBK (Zonguldak-Bartın-Karabük)**, **YHGP (Yeşilırmak Havzası Gelişim Projesi).**

## 3. Kalkınma ajansları

- Bölgesel kalkınmayı yerelde yönlendiren kuruluşlardır. **26 kalkınma ajansı** vardır.
- Görevleri: Bölge planı hazırlamak, yatırımcıya destek vermek, yerel kaynakları harekete geçirmek, sanayi, tarım ve turizm projelerini finanse etmek.
- **Kalkınma planları** ve **bölge planları** ile ulusal ölçekte dengeli gelişme hedeflenir.

## 4. Projelerin sonuçları

**Olumlu:**
- Tarımda verim artışı (özellikle sulu tarım).
- Elektrik üretimi.
- İstihdam ve gelir artışı.
- Göçün azalması.
- Altyapı ve ulaşım gelişimi.

**Olumsuz:**
- Baraj göllerinde sular altında kalan yerleşim ve tarihî alanlar (Hasankeyf).
- Ekosistem değişimi, balık göçlerinin etkilenmesi.
- Sulama sonucu tuzlanma.
- Komşu ülkelerle (Irak, Suriye) su paylaşımı sorunları.

## 5. Dengeli kalkınma

Dengeli kalkınma için **sanayinin dağıtılması, ulaşımın geliştirilmesi, yerel kaynakların kullanılması, eğitim ve sağlık hizmetlerinin yaygınlaştırılması** gerekir. Çok merkezli bir kentleşme göç baskısını azaltır.

::sim{tur="bolgeler"}

## 6. Sık yapılan hatalar

- GAP'ı yalnızca bir baraj projesi sanmak. Sulama, enerji, sanayi, eğitim ve sağlığı kapsayan bütünleşik bir projedir.
- GAP'ın Karadeniz'de olduğunu sanmak. Güneydoğu'dadır.
- DOKAP'ı Doğu Anadolu ile karıştırmak. DAP Doğu Anadolu, DOKAP Doğu Karadeniz.
- Kalkınma projelerinin sadece olumlu sonuç doğurduğunu sanmak.
- Kalkınma ajanslarını Bakanlıkla karıştırmak.

:::baglanti
Bu konu, **Türkiye'de Nüfus ve Yerleşme** konusundaki göç ve yoğunlaşma sorununa yanıttır. **Türkiye'de Tarım ve Hayvancılık**, **Sanayi** ve **Madenler ve Enerji Kaynakları** konuları projelerin alanlarıdır. **Ülkeler Arası Etkileşim** (Coğrafya-2) konusu, GAP'ın Dicle ve Fırat sularını paylaşan komşularla ilişkisini işler. **Tarih** dersinde Cumhuriyet dönemi iktisat politikaları, planlı kalkınma dönemleri bu başlıkla ilişkilidir.
:::

## 7. Konuyu toparla

| Proje | Bölge |
| --- | --- |
| GAP | Güneydoğu Anadolu |
| DAP | Doğu Anadolu |
| KOP | Konya Ovası ve çevresi |
| DOKAP | Doğu Karadeniz |
| ZBK | Zonguldak-Bartın-Karabük |
| YHGP | Yeşilırmak Havzası |

## Mini test

:::soru{cevap="A"}
Fırat ve Dicle nehirleri üzerinde baraj ve hidroelektrik santraller kurulmasını öngören bölgesel kalkınma projesi aşağıdakilerden hangisidir?

- A) GAP
- B) DAP
- C) KOP
- D) DOKAP
- E) ZBK

---

1. GAP, Güneydoğu Anadolu Projesi'dir ve Fırat ile Dicle havzasını kapsar.
2. Atatürk Barajı bu projenin en büyük barajıdır. Doğru cevap A.

Diğer şıklar: **B** Doğu Anadolu / **C** Konya Ovası / **D** Doğu Karadeniz / **E** Zonguldak-Bartın-Karabük.
:::

:::soru{cevap="B"}
Bölgesel kalkınma projelerinin temel amacı aşağıdakilerden hangisidir?

- A) Bölgesel farkları artırmak
- B) Bölgeler arası gelişmişlik farkını azaltmak
- C) Nüfusu belli bölgelerde toplamak
- D) Tarımı tamamen sona erdirmek
- E) Sanayiyi yalnızca Marmara'da yoğunlaştırmak

---

1. Bölgesel kalkınma projeleri, geri kalmış bölgelerin gelişmesini sağlar.
2. Böylece dengeli kalkınma ve göçün azalması hedeflenir. Doğru cevap B.

Diğer şıklar: **A, C, E** tersi / **D** proje amacı değil.
:::

:::soru{cevap="A"}
Aşağıdaki proje-bölge eşleştirmelerinden hangisi **yanlıştır**?

- A) KOP: Doğu Karadeniz
- B) GAP: Güneydoğu Anadolu
- C) DAP: Doğu Anadolu
- D) DOKAP: Doğu Karadeniz
- E) ZBK: Zonguldak-Bartın-Karabük

---

1. KOP, Konya Ovası Projesi'dir. İç Anadolu'da sulu tarım ve su yönetimi üzerinedir.
2. Doğu Karadeniz'in projesi DOKAP'tır. Doğru cevap A.

Diğer şıklar: **B, C, D, E** doğru eşleştirmeler.
:::

:::soru{cevap="D"}
GAP projesinin olumlu sonuçlarından biri aşağıdakilerden hangisidir?

- A) Tarım alanlarının tamamen azalması
- B) Hidroelektrik üretiminin düşmesi
- C) Göçün artması
- D) Sulu tarımın yaygınlaşması
- E) Baraj gölü bulunmaması

---

1. GAP ile Harran gibi ovalar sulandı ve pamuk, mısır gibi ürünlerin üretimi arttı.
2. Sulu tarım yaygınlaştı. Doğru cevap D.

Diğer şıklar: **A, B, C, E** projenin sonuçlarına ters.
:::

## Kendini dene

:::dene
1. GAP hangi akarsuları kapsar? => Fırat ve Dicle.
2. GAP'ın en büyük barajı hangisidir? => Atatürk Barajı.
3. Konya Ovası Projesi'nin kısaltması nedir? => KOP.
4. Bölgesel kalkınmanın amacı nedir? => Bölgeler arası gelişmişlik farkını azaltmak.
5. Doğu Karadeniz Projesi'nin kısaltması nedir? => DOKAP.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-cog1' and name = 'Bölgesel Kalkınma Projeleri'
on conflict (topic_id) do nothing;

