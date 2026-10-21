-- LGS Fen Bilimleri konu anlatımları. Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yaz neden sıcak, kış neden soğuk? Aynı anda dünyanın bir yarısında yaz yaşanırken diğer yarısında neden kış olur? Hava durumu ile iklim aynı şey mi? Bu konuda bu soruların cevabını bulacak, günlük hayatta duyduğun “küresel ısınma” kavramını da bilimsel olarak açıklayacaksın.

:::hedefler
1. Mevsimlerin oluşumunu Dünya’nın eksen eğikliği ve Güneş etrafındaki hareketiyle ilişkilendirmek.
2. Güneş ışınlarının geliş açısının, gündüz süresinin ve sıcaklığın mevsimlere göre değişimini açıklamak.
3. Hava olayları ile iklim arasındaki farkı söylemek.
4. Sera etkisini, küresel ısınmayı ve iklim değişikliğini sebep-sonuç ilişkisiyle yorumlamak.
:::

:::ipucu
Bu ünitenin en sevilen tuzak sorusu: **“Mevsimler Dünya Güneş’e yaklaştığı için mi oluşur?”** Cevap hayır. Mevsimlerin sebebi **eksen eğikliği** ile **Güneş etrafında dolanmadır**. Bu cümleyi aklında tut.
:::

## 1. Dünya’nın iki hareketi

Dünya aynı anda iki hareket yapar.

- **Dönme (kendi ekseni etrafında):** Yaklaşık 24 saatte bir tur atar. Gece ile gündüzün oluşmasına sebep olur.
- **Dolanma (Güneş etrafında):** Yaklaşık 365 gün 6 saatte bir tur atar. Mevsimlerin oluşmasına sebep olur.

Dünya’nın dönme ekseni, Güneş etrafında dolandığı yörünge düzlemine **dik değildir**, yaklaşık $23^\circ 27'$ eğiktir. Üstelik dolanma sırasında bu eksen **aynı yönü gösterir**. Yani Dünya yörüngenin bir yerindeyken Kuzey Yarım Küre Güneş’e doğru eğik durur, yarım yıl sonra aynı eğiklik Güneş’in tersine bakar.

:::baglanti
Eksen eğik olmasaydı Güneş ışınları yıl boyunca aynı bölgelere aynı açıyla gelirdi. Bu durumda **mevsimler oluşmaz**, her yerde yıl boyu aynı iklim koşulları yaşanırdı.
:::

## 2. Mevsimler nasıl oluşur?

Eksen eğik olduğu için Güneş ışınları Dünya’ya yıl içinde farklı açılarla gelir.

- Işınlar yüzeye **dik ya da dike yakın** gelirse aynı enerji **daha küçük bir alana** düşer. O bölge daha çok ısınır.
- Işınlar **eğik** gelirse aynı enerji **daha geniş bir alana** yayılır. Birim yüzeye düşen enerji azalır, bölge daha az ısınır.

Ayrıca gündüz süresi de önemlidir. Güneş’in gökyüzünde kaldığı süre uzadıkça yüzey daha uzun süre ısınır.

:::neden-sonuc
- Kuzey Yarım Küre Güneş’e doğru eğik => Işınlar daha dik gelir, gündüzler uzar. Kuzey Yarım Küre’de yaz yaşanır.
- Kuzey Yarım Küre Güneş’in tersine eğik => Işınlar daha eğik gelir, gündüzler kısalır. Kuzey Yarım Küre’de kış yaşanır.
- Dünya Güneş’e yaklaşıyor ya da uzaklaşıyor => Mevsimlerin sebebi değildir. Dünya Güneş’e en yakın olduğu zamanda (Ocak başı) Kuzey Yarım Küre’de kış yaşanır.
:::

### Dört önemli tarih

| Tarih | Kuzey Yarım Küre’de | Güney Yarım Küre’de | Güneş ışınları dik gelir |
| --- | --- | --- | --- |
| 21 Mart | İlkbahar başlar | Sonbahar başlar | Ekvator |
| 21 Haziran | Yaz başlar | Kış başlar | Yengeç Dönencesi ($23^\circ 27'$ K) |
| 23 Eylül | Sonbahar başlar | İlkbahar başlar | Ekvator |
| 22 Aralık | Kış başlar | Yaz başlar | Oğlak Dönencesi ($23^\circ 27'$ G) |

Türkiye Kuzey Yarım Küre’de yer aldığı için **21 Haziran** Türkiye’de yılın en uzun gündüzünün, **22 Aralık** ise en kısa gündüzünün yaşandığı tarihtir. 21 Mart ve 23 Eylül’de dünyanın her yerinde gece ile gündüz yaklaşık eşittir.

:::ipucu
Sorularda **“hangi yarım kürede”** ifadesine dikkat et. Aynı tarihte iki yarım kürede mevsimler **zıttır**. Kuzey’de yaz ise Güney’de kış, Kuzey’de sonbahar ise Güney’de ilkbahardır.
:::

## 3. Hava olayları ve iklim

İkisi sık karıştırılır.

**Hava olayı** (hava durumu), bir yerde kısa bir zaman diliminde, yani bir gün ya da birkaç gün içinde yaşanan atmosfer koşullarıdır. Sıcaklık, nem, basınç, rüzgâr ve yağış hava olaylarının bileşenleridir. “Bugün İstanbul’da yağmur yağıyor” bir hava olayıdır.

**İklim**, bir bölgede **uzun yıllar boyunca** gözlenen hava olaylarının ortalamasıdır. “Akdeniz’de yazlar sıcak ve kurak, kışlar ılık ve yağışlıdır” cümlesi iklimi anlatır.

| Özellik | Hava olayı | İklim |
| --- | --- | --- |
| Süre | Kısa (saatler, günler) | Uzun (yıllar, genelde 30 yıl ve üzeri) |
| Değişkenlik | Çabuk değişir | Çok yavaş değişir |
| Örnek | “Yarın hava yağışlı” | “Karadeniz’de her mevsim yağış görülür” |

### İklimi etkileyen faktörler

- **Enlem:** Ekvatordan kutuplara gidildikçe Güneş ışınları daha eğik gelir, sıcaklık düşer.
- **Yükselti:** Yükseldikçe hava incelir, sıcaklık düşer. Bu yüzden aynı enlemde bile yüksek dağların tepesi karla kaplıdır.
- **Denize uzaklık:** Su geç ısınır, geç soğur. Denize yakın yerlerde sıcaklık farkları azdır, kara içlerinde yaz ile kış arası fark büyüktür.
- **Yer şekilleri:** Dağların uzanışı nemli rüzgârları kesebilir. Bir dağın denize bakan yamacı yağışlı, arka yamacı kurak olabilir.

:::baglanti
Türkiye’de Karadeniz kıyısı bol yağış alır, Doğu Anadolu’nun iç kesimleri ise çok soğuk geçer. Bunun sebepleri yükselti, denize uzaklık ve dağların yönüdür. Yani **iklim tek bir şeyin değil, birçok faktörün ortak sonucudur**.
:::

## 4. Sera etkisi ve küresel ısınma

Dünya’yı saran atmosferde su buharı, karbondioksit ($\text{CO}_2$), metan ve azot oksitler gibi gazlar vardır. Bu gazlar Güneş’ten gelen ışınların bir kısmını geçirir, yüzeyden geri yansıyan ısı ışınlarının bir kısmını ise **tutar**. Yer yüzeyini ısıtan bu doğal olaya **sera etkisi** denir.

Sera etkisi yaşam için gereklidir. Olmasaydı Dünya’nın ortalama sıcaklığı bugünkünden çok daha düşük olur, canlı yaşamı zorlaşırdı.

Sorun, insan faaliyetleriyle **atmosferdeki sera gazlarının fazlalaşmasıdır**. Fosil yakıtların (kömür, petrol, doğalgaz) yakılması, ormanların yok edilmesi ve sanayi atıkları atmosferdeki karbondioksit miktarını artırır. Atmosferde daha çok ısı tutulur ve Dünya’nın ortalama sıcaklığı yükselir. Buna **küresel ısınma** denir.

:::neden-sonuc
- Fosil yakıt kullanımı artar => Atmosferdeki $\text{CO}_2$ artar, sera etkisi güçlenir.
- Ormanlar yok edilir => $\text{CO}_2$ yutan bitki sayısı azalır, atmosferde $\text{CO}_2$ birikir.
- Ortalama sıcaklık yükselir => Kutuplardaki ve dağlardaki buzullar erir, deniz seviyesi yükselir.
- Sıcaklık ve yağış düzeni değişir => Kuraklık, sel ve orman yangınları gibi uç hava olayları sıklaşır. Bu uzun süreli değişime **iklim değişikliği** denir.
:::

### Ne yapabiliriz?

- Fosil yakıt yerine güneş, rüzgâr gibi **yenilenebilir enerji kaynaklarını** kullanmak.
- Enerji tasarrufu yapmak ve verimli cihazlar tercih etmek.
- Ağaç dikmek, ormanları korumak.
- Toplu taşımayı ve bisikleti tercih etmek.
- Geri dönüşüm yapmak ve gereksiz tüketimi azaltmak.

Bir kişinin ya da kurumun faaliyetleri sonucu atmosfere saldığı sera gazı miktarına **karbon ayak izi** denir. Karbon ayak izini küçültmek için yukarıdaki davranışlar önemlidir.

## 5. Konuyu toparla

| Kavram | Kısa tanım |
| --- | --- |
| Dönme | 24 saat, gece ve gündüz |
| Dolanma | 365 gün 6 saat, mevsimler |
| Eksen eğikliği | $23^\circ 27'$, ışınların geliş açısını değiştirir |
| Hava olayı | Kısa süreli atmosfer koşulları |
| İklim | Uzun yıllık hava olayı ortalaması |
| Sera etkisi | Atmosferin ısıyı tutması, doğal ve gerekli |
| Küresel ısınma | Sera gazlarının artmasıyla ortalama sıcaklığın yükselmesi |

## Mini test

:::soru{cevap="B"}
Aşağıdaki cümlelerden hangisi mevsimlerin oluşum sebebini doğru açıklar?

- A) Dünya yörüngesinde Güneş’e yaklaştığında yaz, uzaklaştığında kış yaşanır.
- B) Dünya’nın dönme ekseni eğik olduğu için Güneş ışınları yıl içinde farklı açılarla gelir.
- C) Dünya kendi ekseni etrafında döndüğü için mevsimler oluşur.
- D) Güneş’in yaydığı enerji mevsimlere göre değişir.

---

1. Mevsimlerin sebebi Dünya’nın Güneş’e olan uzaklığı değildir. Güneş’e en yakın olduğumuz Ocak ayında Kuzey Yarım Küre’de kış yaşanır. A yanlış.
2. Kendi ekseni etrafında dönme, gece ve gündüzü oluşturur. C yanlış.
3. Güneş’in yaydığı enerji yıl içinde belirgin biçimde değişmez. D yanlış.
4. Eksen eğik olduğu için ve Dünya Güneş etrafında dolandığı için ışınların geliş açısı ve gündüz süresi değişir. Doğru cevap B.
:::

:::soru{cevap="C"}
Ali 21 Haziran’da Türkiye’de, kuzeniyle telefonla konuşuyor. Kuzeni Avustralya’da yaşıyor ve orada hava çok soğuk.

Buna göre bu durumun sebebi aşağıdakilerden hangisidir?

- A) Avustralya Güneş’ten çok uzakta olduğu için soğuktur.
- B) Avustralya’da bu tarihte gündüz süresi daha uzundur.
- C) Güney Yarım Küre bu tarihte Güneş’in tersine eğiktir, ışınlar eğik gelir ve gündüz kısadır.
- D) Avustralya’da bu tarihte Güneş hiç doğmaz.

---

1. 21 Haziran’da Kuzey Yarım Küre’de yaz başlar. Mevsimler iki yarım kürede zıttır, bu yüzden Güney Yarım Küre’de kış yaşanır.
2. Güney Yarım Küre Güneş’in tersine eğik olduğunda ışınlar daha eğik gelir ve gündüzler kısalır. Hava soğur.
3. A, B ve D bu durumu doğru açıklamaz. Doğru cevap C.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi bir **iklim** bilgisidir?

- A) Dün akşam İzmir’de şiddetli yağmur yağdı.
- B) Bugün Ankara’da hava 12 derece.
- C) Yarın Rize’de kuvvetli rüzgâr bekleniyor.
- D) Rize’de yağış yıl boyunca görülür ve yılın büyük bölümü nemli geçer.

---

1. A, B ve C kısa bir zaman dilimindeki atmosfer koşullarını anlatır. Bunlar hava olayıdır.
2. D seçeneği uzun yıllar boyunca gözlenen genel durumu anlatır. Bu bir iklim bilgisidir. Doğru cevap D.
:::

:::soru{cevap="A"}
Bir öğrenci aşağıdaki bilgileri not ediyor.

- Fosil yakıtların kullanımı artıyor.
- Atmosferdeki karbondioksit miktarı artıyor.
- Dünya’nın ortalama sıcaklığı yükseliyor.

Buna göre öğrencinin not ettiği olaylar için aşağıdakilerden hangisi söylenebilir?

- A) Sera etkisinin güçlenmesiyle ortaya çıkan küresel ısınmayı anlatır.
- B) Mevsimlerin oluşumunu anlatır.
- C) Gece ile gündüzün oluşumunu anlatır.
- D) Hava olayları ile iklim arasındaki farkı anlatır.

---

1. Fosil yakıtlar yanınca karbondioksit gibi sera gazları atmosfere karışır.
2. Sera gazları arttıkça atmosfer daha fazla ısı tutar ve ortalama sıcaklık yükselir.
3. Bu zincir küresel ısınmayı anlatır. Doğru cevap A.
:::

## Kendini dene

:::dene
1. Mevsimlerin oluşmasında hangi iki etken birlikte rol oynar? => Dünya’nın dönme ekseninin eğik olması ve Dünya’nın Güneş etrafında dolanması.
2. 21 Mart’ta Güneş ışınları hangi paralele dik gelir? Bu tarihte gece ve gündüz nasıldır? => Ekvator’a dik gelir. Dünya’nın her yerinde gece ile gündüz yaklaşık eşittir.
3. Dünya’nın Güneş’e en yakın olduğu Ocak ayında Türkiye’de neden kış yaşanır? => Çünkü mevsimleri belirleyen şey uzaklık değil, ışınların geliş açısı ve gündüz süresidir. Ocak’ta Kuzey Yarım Küre Güneş’in tersine eğiktir.
4. Aynı enlemde bulunan iki şehirden biri deniz kenarında, diğeri yüksek bir platodadır. İklimleri neden farklı olabilir? => Yükselti ve denize uzaklık iklimi etkiler. Platoda hava daha soğuk, yıllık sıcaklık farkı daha büyük olur.
5. Sera etkisi ile küresel ısınma arasındaki fark nedir? => Sera etkisi doğal ve gerekli bir olaydır. Küresel ısınma, insan faaliyetleriyle sera gazlarının artması sonucu ortalama sıcaklığın yükselmesidir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-fen' and name = 'Mevsimler ve İklim'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Mevsimlerin oluşumu (eksen eğikliği, dolanma), hava olayları ve iklim, iklimi etkileyen faktörler, sera etkisi, küresel ısınma ve iklim değişikliği, karbon ayak izi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Mevsim başlangıç tarihleri (21 Mart, 21 Haziran, 23 Eylül, 22 Aralık), (b) eksen eğikliği değeri ($23^\circ 27'$), (c) 8. sınıf programında iklim türleri ya da Köppen sınıflaması aranmaz, bilerek konmadı, (d) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Mevsimler ve İklim'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden anne ve babana benziyorsun ama ikizin dışında kimseyle tıpatıp aynı değilsin? Bu özelliklerin nesilden nesile nasıl aktarıldığı DNA ve genlerle açıklanır. Bu konuda DNA’nın yapısını, kalıtımın temel kurallarını ve genetik bilgiyle ilgili günlük hayat konularını öğreneceksin.

:::hedefler
1. DNA’nın yapısını (nükleotit, çift sarmal) ve görevini açıklamak.
2. Gen, DNA ve kromozom arasındaki ilişkiyi sıralamak.
3. Baskın ve çekinik özellikleri, genotip ve fenotipi ayırt edip basit çaprazlama sorularını çözmek.
4. Mutasyon ile modifikasyonu karşılaştırmak, adaptasyonu açıklamak.
5. Biyoteknolojinin kullanım alanlarını örneklerle söylemek.
:::

:::ipucu
Bu ünitedeki sorular çoğunlukla **bir olayı kendi kelimelerinle yorumlamanı** ister. Önce şu sırayı aklında tut: **Nükleotit → DNA → gen → kromozom → hücre çekirdeği.** Küçükten büyüğe giden bu zinciri sorularda sıkça kullanacaksın.
:::

## 1. DNA nedir?

**DNA**, canlıların bütün kalıtsal bilgisini taşıyan, hücrelerin yönetim merkezi olan çekirdekte bulunan büyük bir moleküldür. Canlının hangi özelliklere sahip olacağını DNA’daki bilgi belirler.

DNA’nın yapı taşına **nükleotit** denir. Her nükleotit üç parçadan oluşur.

- **Fosfat** grubu
- **Şeker** (DNA’da deoksiriboz şekeri)
- **Organik baz**

DNA’da dört çeşit organik baz vardır: **Adenin (A), Timin (T), Guanin (G), Sitozin (S).** Bu dört baz, genetik bilgiyi yazan “harfler” gibidir.

DNA **çift sarmallı** bir yapıdadır, yani birbirine sarılmış iki zincirden oluşur. İki zincir bazlar arasındaki bağlarla birbirine bağlanır. Bu eşleşme rastgele değildir.

| Baz | Eşi |
| --- | --- |
| Adenin (A) | Timin (T) |
| Guanin (G) | Sitozin (S) |

:::dene
1. Bir DNA zincirinin baz dizilişi A-T-G-S-S-A ise karşısındaki zincirin dizilişi nasıl olur? => T-A-S-G-G-T. Çünkü A ile T, G ile S eşleşir.
2. Bir DNA molekülünde adenin sayısı 20 ise timin sayısı kaçtır? => 20. Adenin her zaman timinle eşleştiği için sayıları eşittir.
:::

### DNA ve RNA farkı

Hücrede DNA’nın yanında **RNA** adlı bir molekül de bulunur. RNA, DNA’daki bilgiyi proteinlere dönüştürme sürecinde görev alır. DNA’dan farkları şunlardır.

| Özellik | DNA | RNA |
| --- | --- | --- |
| Zincir sayısı | İki (çift sarmal) | Bir (tek zincir) |
| Şeker | Deoksiriboz | Riboz |
| Baz | A, T, G, S | A, U (urasil), G, S |

## 2. Gen, DNA ve kromozom

DNA çok uzun bir moleküldür. Hücre bölünürken yoğun şekilde paketlenir ve **kromozom** adı verilen yapıları oluşturur. DNA üzerinde belirli bir özelliği belirleyen bölgelere ise **gen** denir.

:::neden-sonuc
- Nükleotitler birleşir => Uzun DNA molekülü oluşur.
- DNA’nın belirli bir özelliği taşıyan bölgesi => Gen. Göz rengi gibi bir özelliği genler belirler.
- DNA sıkıca paketlenir => Kromozomlar oluşur ve hücre bölünmesi sırasında kolayca paylaşılır.
:::

İnsan vücut hücrelerinde **46 kromozom** (23 çift) vardır. Bunların 22 çifti vücut özelliklerini belirleyen **vücut kromozomlarıdır**. Son çift **eşey kromozomlarıdır**. Kadınlarda eşey kromozomları **XX**, erkeklerde **XY** biçimindedir. Üreme hücrelerinde (yumurta ve sperm) kromozom sayısı yarıya iner, yani 23 olur. Döllenmede yumurta ve sperm birleşince kromozom sayısı yeniden 46 olur.

:::baglanti
Çocuğun cinsiyetini babadan gelen sperm belirler. Anne her zaman X taşıyan yumurta hücresi verir. Baba X taşıyan sperm verirse çocuk kız (XX), Y taşıyan sperm verirse erkek (XY) olur.
:::

## 3. Kalıtımın temel esasları

**Kalıtım**, canlıların özelliklerinin ebeveynden yavrulara aktarılmasıdır. Bu kurallar ilk olarak **Gregor Mendel** tarafından bezelyelerle yapılan deneylerle ortaya konmuştur.

Bir özelliği belirleyen genler çiftler hâlinde bulunur. Bir çift gen, bir tanesi anneden bir tanesi babadan gelen iki taneden oluşur.

- **Baskın gen:** Tek başına bile kendini gösteren gendir. Büyük harfle yazılır (ör. A).
- **Çekinik gen:** Yalnızca baskın gen yokken kendini gösteren gendir. Küçük harfle yazılır (ör. a).

| Kavram | Anlamı | Örnek |
| --- | --- | --- |
| Genotip | Canlının sahip olduğu gen çifti | AA, Aa, aa |
| Fenotip | Dışarıdan görülen özellik | Kıvırcık saç |
| Saf döl (homozigot) | İki gen aynı | AA ya da aa |
| Melez döl (heterozigot) | İki gen farklı | Aa |

Aa genotipinde baskın gen kendini gösterir, yani fenotipte baskın özellik görülür. Çekinik özellik ancak **aa** genotipinde görülür.

### Çaprazlama

İki bireyin çiftleşmesinde yavrunun alabileceği gen dizilimleri **Punnett karesi** ile bulunur. Ebeveynlerin gametleri (üreme hücreleri) kareye yazılır ve birleştirilir.

Örnek: Her ikisi de melez (Aa) olan iki bireyin çaprazlaması.

| | A | a |
| --- | --- | --- |
| **A** | AA | Aa |
| **a** | Aa | aa |

Sonuç: Genotip oranı **1 AA : 2 Aa : 1 aa**, fenotip oranı **3 baskın : 1 çekinik** olur. Yani yavruların dörtte biri çekinik özelliği gösterir.

:::ipucu
Çaprazlama sorusunda önce **ebeveynlerin genotiplerini** yaz, sonra gametlerini ayır, sonra kareyi çiz. Soru “fenotip” diyorsa en sonda **baskın ya da çekinik** olarak say, “genotip” diyorsa gen çiftlerini say.
:::

## 4. Mutasyon, modifikasyon ve adaptasyon

**Mutasyon**, DNA’daki baz dizilişinde ya da kromozom yapısında meydana gelen ani ve kalıcı değişikliktir. Mutasyon kalıtsaldır, yani yavrulara aktarılabilir. Radyasyon, bazı kimyasal maddeler ve virüsler mutasyona sebep olabilir. Mutasyonların çoğu zararlıdır, ama bazıları canlıya avantaj sağlayabilir.

**Modifikasyon**, çevre koşullarının canlıda yarattığı geçici değişikliklerdir. DNA değişmediği için **kalıtsal değildir**. Güneşte kalınca derinin kararması, düzenli spor yapan birinin kaslarının gelişmesi modifikasyondur.

| Özellik | Mutasyon | Modifikasyon |
| --- | --- | --- |
| DNA değişir mi? | Evet | Hayır |
| Kalıtsal mı? | Evet | Hayır |
| Sebep | Radyasyon, kimyasal, virüs | Çevre koşulları |
| Örnek | Albinizm | Güneşte bronzlaşma |

**Adaptasyon (uyum)**, canlının yaşadığı ortama uygun özellikler kazanmasıdır. Kutup ayısının kalın yağ tabakası ve beyaz kürkü, devenin kolay su kaybetmemesi adaptasyona örnektir. Uzun zaman içinde, ortama daha uygun özelliklere sahip bireylerin hayatta kalma ve yavru bırakma şansı artar.

## 5. Biyoteknoloji

**Biyoteknoloji**, canlıları ya da canlıların bazı parçalarını kullanarak ürün üretmek ve insan hayatını iyileştirmektir. Uygulama alanları şunlardır.

- **Tıp:** İnsülin gibi ilaçların bakterilerde üretilmesi, aşı geliştirme, gen tedavisi.
- **Tarım:** Dayanıklı bitki çeşitleri geliştirme, genleri değiştirilmiş organizmalar (GDO).
- **Gıda:** Yoğurt, peynir ve ekmek gibi ürünlerin mikroorganizmalarla üretimi.
- **Adli bilimler:** DNA analiziyle kimlik tespiti ve babalık testi.
- **Klonlama:** Bir canlının genetik olarak aynısının üretilmesi. İlk klonlanan memeli Dolly adlı koyundur.

**Genetik mühendisliği**, bir canlının genetik yapısıyla oynayarak istenen özelliklerin kazandırılmasıdır. Bu çalışmaların yararları olduğu kadar etik tartışmaları da vardır. Örneğin GDO’lu gıdaların insan sağlığına ve doğaya uzun vadeli etkileri üzerine araştırmalar devam eder.

## 6. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Nükleotit | Fosfat + şeker + baz, DNA’nın yapı taşı |
| Baz eşleşmesi | A-T, G-S |
| Gen | DNA’nın belirli bir özelliği taşıyan bölgesi |
| Kromozom | Paketlenmiş DNA, insanda 46 adet |
| Genotip, fenotip | Gen çifti ve dışarıdan görünen özellik |
| Aa x Aa | 1 AA : 2 Aa : 1 aa, fenotipte 3 : 1 |
| Mutasyon | Kalıtsal DNA değişikliği |
| Modifikasyon | Çevreye bağlı, kalıtsal olmayan değişiklik |

## Mini test

:::soru{cevap="C"}
Aşağıdakilerden hangisi DNA’nın yapısı için **yanlıştır**?

- A) Nükleotitlerden oluşur.
- B) Çift sarmal yapıdadır.
- C) Bazları arasında adenin guanin ile eşleşir.
- D) Hücre çekirdeğinde bulunur.

---

1. DNA nükleotitlerden oluşur ve çift sarmallıdır. A ve B doğru.
2. DNA çekirdekte bulunur. D doğru.
3. Eşleşme adenin ile timin, guanin ile sitozin arasındadır. Adenin guanin ile eşleşmez. Doğru cevap C.
:::

:::soru{cevap="B"}
Kıvırcık saç (K) baskın, düz saç (k) çekiniktir. Her ikisi de melez kıvırcık saçlı (Kk) olan bir anne ve baba bir çocuk sahibi olacaktır.

Buna göre çocuğun düz saçlı olma ihtimali kaçtır?

- A) 0
- B) $\dfrac{1}{4}$
- C) $\dfrac{1}{2}$
- D) $\dfrac{3}{4}$

---

1. Ebeveynlerin genotipi Kk ve Kk’dır. Punnett karesi: KK, Kk, Kk, kk.
2. Düz saç çekinik olduğu için yalnızca **kk** genotipinde görülür.
3. Dört olasılıktan biri kk olduğundan ihtimal $\dfrac{1}{4}$ tür. Doğru cevap B.
:::

:::soru{cevap="D"}
Bir öğrenci aşağıdaki iki durumu gözlemliyor.

**I.** Yaz boyunca denizde vakit geçiren bir kişinin cildinin kararması
**II.** Bir bakterinin DNA’sındaki bir baz dizilişinin değişmesi sonucu antibiyotiğe dirençli hâle gelmesi

Buna göre I ve II için aşağıdakilerden hangisi söylenebilir?

- A) Her ikisi de kalıtsaldır.
- B) I mutasyon, II modifikasyondur.
- C) Her ikisi de modifikasyondur.
- D) I modifikasyon, II mutasyondur.

---

1. Cildin güneşte kararması çevre koşulunun sebep olduğu geçici bir değişikliktir. DNA değişmediği için bu bir modifikasyondur.
2. Bakterinin DNA’sındaki baz dizilişinin değişmesi mutasyondur. Mutasyon kalıtsaldır.
3. Doğru cevap D.
:::

## Kendini dene

:::dene
1. İnsan vücut hücresinde kaç kromozom bulunur? Yumurta ve sperm hücresinde kaç kromozom bulunur? => Vücut hücresinde 46, yumurta ve sperm hücresinde 23.
2. Gen ile kromozom arasındaki ilişki nedir? => Gen, DNA üzerinde belirli bir özelliği belirleyen bölgedir. DNA’nın paketlenmesiyle oluşan kromozom birçok gen taşır.
3. Aa genotipli bir birey ile aa genotipli bir bireyin çaprazlamasında yavruların fenotip oranı nedir? => Genotipler Aa ve aa olur, oran 1 : 1. Yavruların yarısı baskın, yarısı çekinik özelliği gösterir.
4. Bir bitkinin güneş gören yaprakları daha koyu yeşil, gölgede kalanları açık yeşil. Bu mutasyon mu modifikasyon mu? => Modifikasyon. Çevre koşulundan kaynaklanır ve DNA değişmez.
5. Genetik mühendisliğiyle insülin üretimi bize ne sağlar? => Şeker hastalarının ihtiyaç duyduğu insülinin bakterilerde kolayca ve bol miktarda üretilmesini sağlar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'lgs-fen' and name = 'DNA ve Genetik Kod'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: DNA’nın yapısı ve görevi, gen-DNA-kromozom ilişkisi, kalıtım (baskın, çekinik, genotip, fenotip, Punnett karesi), mutasyon, modifikasyon, adaptasyon, biyoteknoloji ve genetik mühendisliği. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) RNA tablosunun (urasil, riboz) 8. sınıf kapsamında olup olmadığı, olmuyorsa silin, (b) kan grubu ve eşeye bağlı kalıtım bilerek konmadı, (c) “Dolly” örneği, (d) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'DNA ve Genetik Kod'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir demir çivi paslanır, süt ekşir, mum erir, limon suyu mavi turnusolü kırmızıya çevirir. Bunların hepsi “madde değişimi” gibi görünür ama aralarında önemli farklar vardır. Bu konuda maddenin değişimlerini, elementlerin periyodik sistemde nasıl dizildiğini ve asit-baz kavramlarını öğreneceksin.

:::hedefler
1. Periyodik sistemdeki element sembollerini ve elementlerin sınıflandırılmasını (metal, ametal, yarı metal, soygaz) açıklamak.
2. Fiziksel ve kimyasal değişimi ayırt etmek.
3. Kimyasal tepkimelerde kütlenin korunduğunu, tepkime denklemlerinin denkleştirilmesini yorumlamak.
4. Asit ve bazların özelliklerini, pH ölçeğini ve nötrleşme olayını açıklamak.
5. Kimyanın endüstrideki ve günlük hayattaki yerini söylemek.
:::

:::ipucu
Bu ünitede **tanım ezberlemekten çok durum ayırt etmek** önemlidir. Soruyu okurken kendine sor: **“Yeni bir madde oluştu mu?”** Oluştuysa kimyasal değişim, oluşmadıysa fiziksel değişimdir.
:::

## 1. Periyodik sistem

Bilinen bütün elementler, atom numaralarına göre **periyodik sistemde** (periyodik cetvelde) sıralanır. Atom numarası, atomun çekirdeğindeki **proton sayısıdır**. Elementler **sembollerle** gösterilir. Sembolün ilk harfi büyük, varsa ikinci harfi küçük yazılır.

Atom numarası 1’den 20’ye kadar olan elementler ve sembolleri:

- **1-10:** **H** hidrojen, **He** helyum, **Li** lityum, **Be** berilyum, **B** bor, **C** karbon, **N** azot, **O** oksijen, **F** flor, **Ne** neon.
- **11-20:** **Na** sodyum, **Mg** magnezyum, **Al** alüminyum, **Si** silisyum, **P** fosfor, **S** kükürt, **Cl** klor, **Ar** argon, **K** potasyum, **Ca** kalsiyum.

Periyodik sistemde yatay sıralara **periyot**, dikey sütunlara **grup** denir. Aynı gruptaki elementlerin kimyasal özellikleri benzerdir.

### Elementlerin sınıflandırılması

| Sınıf | Bulunduğu yer | Özellikleri | Örnek |
| --- | --- | --- | --- |
| Metaller | Cetvelin sol ve orta kısmı | Parlak, işlenebilir, ısıyı ve elektriği iyi iletir (cıva hariç oda sıcaklığında katıdır) | Demir, bakır, sodyum |
| Ametaller | Cetvelin sağ kısmı | Mat, kırılgan, ısıyı ve elektriği iyi iletmez (grafit hariç) | Karbon, oksijen, kükürt |
| Yarı metaller | Metal ve ametal arasında | Hem metal hem ametal özelliği gösterir | Silisyum, bor |
| Soygazlar | En sağ sütun (8A) | Tepkimeye girmeye isteksiz, kararlı | Helyum, neon, argon |

Hidrojen cetvelin sol üst köşesinde yer almasına rağmen **ametaldir**. Ayrıca 1A grubundaki **alkali metaller** (lityum, sodyum, potasyum) çok aktiftir, 7A grubundaki **halojenler** (flor, klor) ise aktif ametallerdir.

:::baglanti
Neon tabelalarda, helyum balonlarda kullanılır. İkisi de soygazdır ve **tepkimeye girmedikleri** için güvenle kullanılır. Helyumun yanıcı olmaması, balonlarda hidrojenden daha güvenli olmasının sebebidir.
:::

## 2. Fiziksel ve kimyasal değişim

**Fiziksel değişim**, maddenin yalnızca görünüşünün, şeklinin ya da hâlinin değiştiği, **yeni madde oluşmadığı** değişimdir. Maddenin kimliği aynı kalır.

**Kimyasal değişim**, maddenin yapısının değişerek **yeni maddelerin oluştuğu** değişimdir.

| Fiziksel değişim | Kimyasal değişim |
| --- | --- |
| Buzun erimesi | Demirin paslanması |
| Suyun buharlaşması | Odunun yanması |
| Tuzun suda çözünmesi | Sütün ekşimesi |
| Kâğıdın yırtılması | Yemeğin pişmesi |
| Camın kırılması | Meyvenin çürümesi |

Kimyasal değişimin belirtileri şunlardır: Renk değişimi, gaz çıkışı, çökelti (katı madde) oluşması, ısı ve ışık açığa çıkması ya da tat ve koku değişimi. Ancak bu belirtiler **kesin kanıt değildir**, belirleyici olan yeni madde oluşup oluşmadığıdır.

:::ipucu
**Tuzun suda çözünmesi** fiziksel değişimdir. Tuz kaybolmuş gibi görünse de suyu buharlaştırınca tuz geri gelir, yani yeni madde oluşmamıştır. Bu soru tipi LGS’de çok sorulur.
:::

## 3. Kimyasal tepkimeler

Kimyasal değişimlere **kimyasal tepkime** denir. Tepkimede başlangıçtaki maddelere **girenler (tepkimeye girenler)**, sonunda oluşan maddelere **ürünler** denir. Tepkimeler denklemle gösterilir.

$$\text{Girenler} \longrightarrow \text{Ürünler}$$

Örnek: Hidrojen ile oksijenin tepkimesinden su oluşur.

$$2\,\text{H}_2 + \text{O}_2 \longrightarrow 2\,\text{H}_2\text{O}$$

### Kütlenin korunumu

Kimyasal tepkimelerde **atomlar yok olmaz, yoktan var olmaz**, yalnızca yeniden düzenlenir. Bu yüzden tepkimeye girenlerin toplam kütlesi, ürünlerin toplam kütlesine eşittir. Buna **kütlenin korunumu kanunu** denir (Lavoisier).

Denklemin denkleştirilmesi, her atomun **giren tarafta ve ürün tarafında aynı sayıda** olmasını sağlamaktır. Denklemde sembolün önüne yazılan sayıya **katsayı**, sembolün sağ altındaki küçük sayıya **indis** denir. Denkleştirirken yalnızca katsayı değiştirilir, indis değiştirilmez.

:::dene
1. $\text{H}_2 + \text{O}_2 \longrightarrow \text{H}_2\text{O}$ denklemini denkleştir. => $2\,\text{H}_2 + \text{O}_2 \longrightarrow 2\,\text{H}_2\text{O}$. Giren tarafta 4 H ve 2 O, ürün tarafında da 4 H ve 2 O olur.
2. 8 g metan gazı yanarken 32 g oksijen harcıyor ve 22 g karbondioksit oluşuyor. Su buharı kaç gram oluşur? => Girenlerin toplamı 8 + 32 = 40 g olduğu için ürünlerin toplamı da 40 g olmalıdır. Su buharı 40 − 22 = 18 g olur.
:::

Tepkimelerin hızı sıcaklık, madde miktarı ve maddelerin temas yüzeyi gibi etkenlerle değişir. Örneğin toz hâlindeki şeker, küp şekerden daha hızlı çözünür.

## 4. Asitler ve bazlar

Günlük hayatta kullandığımız birçok madde asit ya da bazdır. Bunları **tat** ile değil, güvenli yöntemlerle, örneğin **indikatörlerle** ayırt ederiz. (Bilinmeyen maddeleri asla tadarak deneme.)

| Özellik | Asitler | Bazlar |
| --- | --- | --- |
| Tat | Ekşi | Acı |
| Dokunma | Yakıcı, aşındırıcı | Kaygan (sabun gibi) |
| Mavi turnusol | Kırmızıya çevirir | Değiştirmez |
| Kırmızı turnusol | Değiştirmez | Maviye çevirir |
| Suda iyon oluşturma | H⁺ iyonu verir | OH⁻ iyonu verir |
| Örnek | Limon suyu, sirke, meyve suları, mide asidi | Sabun, çamaşır suyu, diş macunu, kabartma tozu |

### pH ölçeği

Bir çözeltinin asit ya da baz olma derecesi **pH ölçeği** ile gösterilir. Ölçek 0’dan 14’e kadardır.

- pH **7’den küçük** ise çözelti **asittir**. Değer küçüldükçe asitlik artar.
- pH **7’ye eşit** ise çözelti **nötrdür**. Saf su gibi.
- pH **7’den büyük** ise çözelti **bazdır**. Değer büyüdükçe bazlık artar.

| pH | Örnek | Sınıf |
| --- | --- | --- |
| 1 | Mide asidi | Kuvvetli asit |
| 3 | Limon suyu | Asit |
| 5 | Kahve | Zayıf asit |
| 7 | Saf su | Nötr |
| 9 | Kabartma tozu çözeltisi | Zayıf baz |
| 11 | Sabunlu su | Baz |
| 13 | Çamaşır suyu | Kuvvetli baz |

### İndikatörler

Asit ve bazları renk değişimiyle gösteren maddelere **indikatör** denir. Turnusol kâğıdı, fenolftalein ve kırmızı lahana suyu en bilinenleridir. Fenolftalein **asitte renksiz**, **bazda pembe** olur.

### Nötrleşme

Asit ile baz birbirleriyle tepkimeye girdiğinde, birbirlerinin özelliklerini yok ederler. Bu olaya **nötrleşme** denir. Sonunda **tuz ve su** oluşur.

$$\text{Asit} + \text{Baz} \longrightarrow \text{Tuz} + \text{Su}$$

Günlük hayattan örnekler: Mide asidi fazla olan kişiye antiasit ilaç verilmesi, arı sokmasına (asit) karbonatlı bir macun sürülmesi, asidik toprağa kireç atılması.

:::neden-sonuc
- Mide asidi fazla salgılanır => Yanma hissi olur. Bazik özellikli antiasit ilaç mide asidini nötrleştirir.
- Fabrikalardan kükürt dioksit gibi gazlar salınır => Yağmur suyu asidik olur ve **asit yağmuru** oluşur. Binalara, ormanlara ve göllere zarar verir.
- Asidik toprakta verim düşer => Toprağa kireç gibi bazik maddeler eklenerek toprağın pH değeri dengelenir.
:::

## 5. Kimya ve endüstri

Kimya, endüstrinin temelidir. Gübre, ilaç, plastik, boya, deterjan ve yakıt gibi birçok ürün kimyasal tepkimelerle üretilir. Bu ürünlerin hayatımızı kolaylaştırmasının yanında çevreye ve sağlığa zarar verebilecek yönleri de vardır.

- Kimyasal atıklar **arıtılmadan** doğaya bırakılırsa su ve toprak kirlenir.
- Plastik ürünlerin doğada çözünmesi çok uzun sürer. **Geri dönüşüm** önemlidir.
- Temizlik malzemelerini karıştırmak tehlikelidir. Örneğin çamaşır suyu ile tuz ruhu karışınca zehirli gaz çıkar.

## 6. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Atom numarası | Proton sayısı |
| Metaller | Parlak, iletken, işlenebilir |
| Soygazlar | 8A grubu, kararlı |
| Fiziksel değişim | Yeni madde oluşmaz |
| Kimyasal değişim | Yeni madde oluşur |
| Kütlenin korunumu | Giren kütle = ürün kütlesi |
| Asit / baz / nötr | pH < 7 / pH > 7 / pH = 7 |
| Nötrleşme | Asit + baz → tuz + su |

## Mini test

:::soru{cevap="D"}
Aşağıdaki olaylardan hangisi **kimyasal** değişime örnektir?

- A) Buzun erimesi
- B) Tuzun suda çözünmesi
- C) Odunun testereyle kesilmesi
- D) Demir bir çivinin paslanması

---

1. Buzun erimesi, tuzun çözünmesi ve odunun kesilmesinde yeni bir madde oluşmaz. Bunlar fiziksel değişimdir.
2. Demirin paslanmasında demir, oksijenle tepkimeye girerek **pas** adlı yeni bir madde oluşturur. Bu kimyasal değişimdir. Doğru cevap D.
:::

:::soru{cevap="B"}
Kapalı bir kapta 12 g magnezyum, 8 g oksijenle tamamen tepkimeye giriyor ve magnezyum oksit oluşuyor.

Buna göre oluşan magnezyum oksitin kütlesi kaç gramdır?

- A) 4
- B) 20
- C) 96
- D) 12

---

1. Kütlenin korunumuna göre tepkimeye giren maddelerin toplam kütlesi, ürünün kütlesine eşittir.
2. Girenlerin toplamı 12 + 8 = 20 g olduğundan oluşan magnezyum oksit de 20 g olur. Doğru cevap B.
:::

:::soru{cevap="A"}
Bir öğrenci, pH değeri 3 olan bir çözeltiye mavi turnusol kâğıdı daldırıyor.

Buna göre öğrencinin gözleyeceği durum aşağıdakilerden hangisidir?

- A) Kâğıt kırmızıya döner.
- B) Kâğıt değişmez.
- C) Kâğıt yeşile döner.
- D) Kâğıt renksizleşir.

---

1. pH değeri 7’den küçük olan çözelti asittir.
2. Asit, mavi turnusol kâğıdını kırmızıya çevirir. Doğru cevap A.
:::

:::soru{cevap="C"}
Mide ekşimesi yaşayan bir kişi, mide asidini azaltmak için bazik özellikli bir ilaç alıyor.

Bu olay için aşağıdakilerden hangisi söylenebilir?

- A) Bir fiziksel değişimdir, yeni madde oluşmaz.
- B) Mide asidinin pH değeri ilaçla birlikte düşer.
- C) Nötrleşme tepkimesi gerçekleşir ve tuz ile su oluşur.
- D) İlaç mide asidini daha da kuvvetli hâle getirir.

---

1. Bazik bir madde asitle karıştığında nötrleşme tepkimesi olur ve ürün olarak tuz ile su oluşur. Bu kimyasal bir değişimdir. A yanlış.
2. Asit azalınca ortam daha az asidik olur, yani pH değeri 7’ye doğru yükselir. B yanlış.
3. İlaç asidi güçlendirmez, nötrleştirir. D yanlış. Doğru cevap C.
:::

## Kendini dene

:::dene
1. Metaller ve ametaller arasındaki üç farkı say. => Metaller parlak, ısıyı ve elektriği iyi iletir, işlenebilir. Ametaller mat, kırılgan ve genellikle iletken değildir.
2. Sütün ekşimesi fiziksel mi kimyasal mı değişimdir? Neden? => Kimyasal. Süt ekşirken yeni maddeler oluşur, tat ve koku değişir.
3. $\text{N}_2 + \text{H}_2 \longrightarrow \text{NH}_3$ denklemini denkleştir. => $\text{N}_2 + 3\,\text{H}_2 \longrightarrow 2\,\text{NH}_3$
4. pH değeri 11 olan bir çözeltiye fenolftalein damlatılırsa renk nasıl olur? => Baz olduğu için pembe olur.
5. Asit yağmurları nasıl oluşur ve neye zarar verir? => Fabrika ve araç gazlarındaki kükürt ve azot bileşikleri yağmur suyuna karışarak asit oluşturur. Ormanlara, göllere, binalara ve tarihi eserlere zarar verir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'lgs-fen' and name = 'Madde ve Endüstri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Periyodik sistem (ilk 20 element sembolleri, metal, ametal, yarı metal, soygaz), fiziksel ve kimyasal değişim, kimyasal tepkimeler ve kütlenin korunumu, asitler ve bazlar (pH, indikatör, nötrleşme), kimyanın endüstrideki yeri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Element listesi ve sembolleri (1-20), (b) tepkime hızı paragrafının 8. sınıf kapsamında olup olmadığı, (c) pH ölçeği örnek değerleri yaklaşık değerlerdir, (d) indikatör anlatımı, (e) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Madde ve Endüstri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Ağır bir kutuyu tek başına kaldıramazsın ama bir tahta ile kolayca yerinden oynatabilirsin. Kapı kolu, makas, bisiklet vitesi ve rampa aynı mantıkla çalışır. Bu konuda iş yapmayı kolaylaştıran **basit makineleri** ve bunların nasıl hesaplandığını öğreneceksin.

:::hedefler
1. İş kavramını ve basit makinelerin işi nasıl kolaylaştırdığını açıklamak.
2. Kaldıraç, makara, eğik düzlem ve çıkrıkta kuvvet kazancını hesaplamak.
3. Dişli çarklar ve kasnakların dönme yönü ile dönme sayısı ilişkisini yorumlamak.
4. Basit makinelerde iş kazancı olmadığını örneklerle açıklamak.
:::

:::ipucu
Bu ünitenin bütün konuları tek bir kuralla özetlenir: **Kuvvetten kazanırsan yoldan kaybedersin.** Basit makineler işi kolaylaştırır ama **yapılan işi azaltmaz**. Her soruda önce bu kuralı hatırla.
:::

## 1. İş ve basit makineler

Fizikte **iş**, bir cisme kuvvet uygulayıp onu kuvvet yönünde yer değiştirmesidir.

$$W = F \cdot x$$

İşin birimi **joule (J)** dür. Kuvvet newton, yol metre alınır. Örneğin 10 N’luk kuvvetle bir cismi 3 m çekersen $10 \cdot 3 = 30$ J iş yaparsın.

**Basit makineler**, iş yapmayı kolaylaştıran araçlardır. Kuvvetin büyüklüğünü ya da yönünü değiştirirler. Ancak hiçbir basit makine **iş kazancı sağlamaz**. Kuvvet azalırsa yol uzar, yol kısalırsa kuvvet artar. Sürtünmesiz ideal durumda uygulanan kuvvetle yolun çarpımı (yani iş) değişmez.

:::neden-sonuc
- Kuvvet kazancı sağlanır => Yoldan kayıp olur. Daha küçük kuvvetle ama daha uzun mesafede çalışırsın.
- Yoldan kazanç sağlanır => Kuvvetten kayıp olur.
- İş hep aynı => “İş kazancı yoktur” kuralı. Sürtünme varsa iş kaybı bile olur.
:::

## 2. Kaldıraç

**Kaldıraç**, bir destek noktası etrafında dönebilen çubuktur. Üç temel kavram vardır.

- **Destek noktası:** Çubuğun etrafında döndüğü nokta.
- **Kuvvet kolu ($l_k$):** Uygulanan kuvvet ile destek arasındaki uzaklık.
- **Yük kolu ($l_y$):** Yük ile destek arasındaki uzaklık.

Kaldıraç dengedeyken **kuvvet ile kuvvet kolunun çarpımı, yük ile yük kolunun çarpımına eşittir**.

$$F \cdot l_k = G \cdot l_y$$

Kuvvet kolu ne kadar uzunsa yükü o kadar küçük kuvvetle dengeleyebilirsin. Bu yüzden kapı kolunun menteşeden uzağa takılması, uzun saplı pense kullanmak ve uzun bir demir çubukla kaya oynatmak daha kolaydır.

Örnek: Yük kolu 20 cm, kuvvet kolu 80 cm olan bir kaldıraçta 40 N’luk yükü dengelemek için gereken kuvvet:

$$F \cdot 80 = 40 \cdot 20 \Rightarrow F = 10\ \text{N}$$

Kuvvet kolu yük kolunun 4 katı olduğu için kuvvet 4 kat azalmıştır. Karşılığında kuvvetin uygulandığı uçta yol 4 kat fazla alınır.

:::baglanti
Günlük hayatta kaldıraç örnekleri: makas, kazan çubuğu, el arabası, sakız açacağı, tahterevalli, cımbız, fındık kıran. Bazılarında kuvvet kolu daha uzundur ve **kuvvetten kazanç** sağlanır. Cımbızda ise **yoldan kazanç** vardır, çünkü hassas iş yapılır.
:::

## 3. Makaralar

**Sabit makara**, bir yere sabitlenmiş makaradır. Yükü asılı ip aynı büyüklükte kuvvetle çekilir. **Kuvvet kazancı yoktur**, yalnızca kuvvetin **yönü** değişir. Yukarı kaldırmak için aşağı doğru çekersin.

$$F = G$$

**Hareketli makara**, yükle birlikte hareket eder. Yük iki ip tarafından taşınır. Bu nedenle kuvvetten **2 kat kazanç** sağlanır.

$$F = \frac{G}{2}$$

Yükü 1 m yükseltmek için ipin ucunu 2 m çekmen gerekir. Kuvvetten kazanç, yoldan kayıptır.

**Palanga**, birden fazla sabit ve hareketli makaranın birleşimidir. Yükü taşıyan hareketli iplerin sayısı kadar kuvvet kazancı sağlanır. Ağır yükleri kaldıran inşaat vinçleri bu sisteme örnektir.

| Makara | Kuvvet kazancı | Yön değişir mi? |
| --- | --- | --- |
| Sabit | Yok ($F = G$) | Evet |
| Hareketli | 2 kat ($F = G/2$) | Hayır |

:::dene
1. Ağırlığı 60 N olan bir yük, ağırlığı önemsenmeyen hareketli makara ile kaldırılıyor. Uygulanması gereken kuvvet kaç N’dur? => $F = 60 / 2 = 30$ N
2. Aynı yük sabit makarayla kaldırılsaydı kuvvet kaç N olurdu? => 60 N. Sabit makarada kuvvet kazancı yoktur.
:::

## 4. Eğik düzlem

**Eğik düzlem**, yükü doğrudan yukarı kaldırmak yerine bir rampa ile çıkarma düzeneğidir. Düzlemin boyu ($\ell$) yüksekliğinden ($h$) büyük olduğundan kuvvetten kazanç sağlanır.

$$F \cdot \ell = G \cdot h$$

Sürtünmesiz durumda 100 N’luk yükü 2 m yüksekliğe, 10 m uzunluğundaki rampa ile çıkarmak için gereken kuvvet:

$$F \cdot 10 = 100 \cdot 2 \Rightarrow F = 20\ \text{N}$$

Düzlem ne kadar **uzun ve az eğimli** olursa gereken kuvvet o kadar küçük olur, ama yol uzar. Dağ yollarının virajlı yapılması, rampalar ve merdivenler eğik düzlem örnekleridir.

**Vida**, silindir etrafına sarılmış eğik düzlemdir. Vida adımı (diş araları) küçüldükçe kuvvet kazancı artar.

**Kama**, iki eğik düzlemin birleşimidir. Bıçak, balta ve çivi buna örnektir.

## 5. Çıkrık

**Çıkrık**, bir silindire bağlı bir kol ya da manivelanın aynı eksen etrafında dönmesiyle çalışır. Kuyudan su çekmek, vinç ve direksiyon çıkrık örnekleridir. Kolun yarıçapı $R$, silindirin yarıçapı $r$ ise denge koşulu şöyledir.

$$F \cdot R = G \cdot r$$

Kol ne kadar uzunsa (R büyükse) o kadar küçük kuvvetle yük çekilir.

## 6. Dişli çarklar ve kasnaklar

**Dişli çarklar**, dişleri birbirine geçerek dönmeyi aktarır. Aralarında şu ilişkiler vardır.

- Birbirine **doğrudan temas eden** iki dişli **zıt yönde** döner.
- Büyük dişli **yavaş**, küçük dişli **hızlı** döner. **Diş sayısı ile dönme sayısının çarpımı** iki dişlide eşittir.

$$N_1 \cdot d_1 = N_2 \cdot d_2$$

Burada $N$ dönme sayısını, $d$ diş sayısını gösterir. Örneğin 40 dişli bir çark 3 tur atarsa, 20 dişli çark 6 tur atar.

**Kasnaklar**, kayışla birbirine bağlanır. Kayışla bağlanan kasnaklar **aynı yönde** döner. Büyük kasnak yavaş, küçük kasnak hızlı döner. Bisikletin pedal dişlisi ile arka dişlisi zincirle bağlıdır ve aynı yönde döner.

| Durum | Dönme yönü |
| --- | --- |
| Temas eden dişliler | Zıt |
| Kayışla bağlı kasnaklar | Aynı |
| Zincirle bağlı dişliler | Aynı |
| Aynı eksene bağlı çarklar | Aynı, dönme sayıları eşit |

## 7. Konuyu toparla

| Makine | Formül | Kazanç |
| --- | --- | --- |
| Kaldıraç | $F \cdot l_k = G \cdot l_y$ | Kuvvet kolu uzunsa kuvvetten |
| Sabit makara | $F = G$ | Yönden |
| Hareketli makara | $F = G/2$ | 2 kat kuvvetten |
| Eğik düzlem | $F \cdot \ell = G \cdot h$ | Uzun düzlemde kuvvetten |
| Çıkrık | $F \cdot R = G \cdot r$ | Kol uzunsa kuvvetten |
| Dişli çark | $N_1 \cdot d_1 = N_2 \cdot d_2$ | Dönme sayısı ve yön değişimi |

## Mini test

:::soru{cevap="C"}
Yük kolu 30 cm, kuvvet kolu 90 cm olan bir kaldıraçla 60 N’luk yük dengelenecektir.

Buna göre uygulanması gereken kuvvet kaç N’dur?

- A) 10
- B) 15
- C) 20
- D) 180

---

1. Denge koşulu: $F \cdot l_k = G \cdot l_y$.
2. $F \cdot 90 = 60 \cdot 30$ olduğundan $F = \dfrac{1800}{90} = 20$ N. Doğru cevap C.
:::

:::soru{cevap="A"}
Sürtünmelerin önemsenmediği bir ortamda, hareketli makara kullanılarak 80 N ağırlığındaki bir yük 2 m yükseltiliyor.

Buna göre ipin ucuna uygulanan kuvvet ve ipin çekilme miktarı için aşağıdakilerden hangisi doğrudur?

- A) 40 N, 4 m
- B) 40 N, 2 m
- C) 80 N, 4 m
- D) 160 N, 1 m

---

1. Hareketli makarada kuvvet, yükün yarısıdır: $F = \dfrac{80}{2} = 40$ N.
2. Kuvvetten kazanılan 2 kat, yoldan kaybedilir. Yük 2 m yükselince ipin ucu $2 \cdot 2 = 4$ m çekilir.
3. Doğru cevap A.
:::

:::soru{cevap="D"}
Eşit ağırlıkta üç ayrı yük, aynı yüksekliğe sürtünmesiz üç farklı eğik düzlemle çıkarılacaktır. Eğik düzlemlerin boyları sırasıyla 4 m, 6 m ve 8 m’dir.

Buna göre bu düzlemlerde yükü çıkarmak için gereken kuvvetler ve yapılan işler için aşağıdakilerden hangisi doğrudur?

- A) En çok kuvvet 8 m’lik düzlemde gerekir.
- B) En çok iş 4 m’lik düzlemde yapılır.
- C) Üçünde de gereken kuvvet eşittir.
- D) En az kuvvet 8 m’lik düzlemde gerekir, üçünde de yapılan iş eşittir.

---

1. $F \cdot \ell = G \cdot h$ olduğundan $G$ ve $h$ sabitken $\ell$ büyüdükçe $F$ küçülür. En az kuvvet en uzun düzlemde (8 m) gerekir. A ve C yanlış.
2. Basit makineler iş kazancı sağlamaz, sürtünme yoksa üçünde de yapılan iş $G \cdot h$ olup eşittir. B yanlış.
3. Doğru cevap D.
:::

:::soru{cevap="B"}
Birbirine temas eden X ve Y dişlilerinden X’in diş sayısı 40, Y’nin diş sayısı 20’dir. X dişlisi saat yönünde 3 tur yapıyor.

Buna göre Y dişlisi için aşağıdakilerden hangisi doğrudur?

- A) Saat yönünde 3 tur yapar.
- B) Saat yönünün tersinde 6 tur yapar.
- C) Saat yönünün tersinde 3 tur yapar.
- D) Saat yönünde 6 tur yapar.

---

1. Birbirine temas eden dişliler zıt yönde döner. Y, saat yönünün tersinde döner. A ve D yanlış.
2. $N_X \cdot d_X = N_Y \cdot d_Y$ olduğundan $3 \cdot 40 = N_Y \cdot 20$ ve $N_Y = 6$.
3. Doğru cevap B.
:::

## Kendini dene

:::dene
1. 50 N’luk kuvvetle bir cisim 4 m çekilirse yapılan iş kaç J’dür? => $W = 50 \cdot 4 = 200$ J
2. Sabit makaranın işi nasıl kolaylaştırdığını açıkla. => Kuvvetten kazanç sağlamaz, kuvvetin yönünü değiştirir. Aşağı doğru çekerek yükü yukarı kaldırmak daha kolaydır.
3. Bir cımbızda neden kuvvetten değil yoldan kazanç vardır? => Destek noktasından kuvvete uzaklık, yüke uzaklıktan kısadır. Küçük hareketle ince işler yapılır.
4. Bir rampanın boyu uzatılırsa yükü çıkarmak için gereken kuvvet ve yol nasıl değişir? => Kuvvet azalır, yol uzar. Yapılan iş değişmez.
5. Bisikletin pedal dişlisi ile arka dişli neden aynı yöne döner? => İkisi de zincirle bağlıdır. Zincirle bağlı çarklar aynı yönde döner.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'lgs-fen' and name = 'Basit Makineler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İş, basit makineler (kaldıraç, makara, eğik düzlem, vida, çıkrık, dişli çark, kasnak), kuvvet kazancı ve iş kazancı olmaması. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Hesaplamalı formüllerin (kaldıraç, eğik düzlem, çıkrık, dişli) 8. sınıf kapsamında olup olmadığı, (b) kama ve palanga bilgisi, (c) Dişli dönme sayısı ilişkisi, (d) Soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Basit Makineler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabah yediğin kahvaltıdaki enerji aslında bir bitkinin yakaladığı Güneş ışığıdır. Bir yaprağın ışığı nasıl besine çevirdiğini, bu enerjinin canlılar arasında nasıl el değiştirdiğini ve gezegenimizin kaynaklarını nasıl koruyabileceğimizi bu konuda öğreneceksin.

:::hedefler
1. Fotosentez ve hücresel solunumdaki enerji dönüşümlerini açıklamak.
2. Besin zincirinde enerji akışını ve enerjinin kaybını yorumlamak.
3. Karbon, azot ve su döngülerini sebep-sonuç ilişkisiyle anlatmak.
4. Çevre sorunlarını, sürdürülebilir kalkınma ve yenilenebilir enerjiyle ilişkilendirmek.
:::

:::ipucu
**Enerji yoktan var olmaz, yok olmaz**, yalnızca bir türden başka bir türe dönüşür. Bu ünitedeki her soruda “Enerji hangi türden hangi türe dönüştü?” sorusunu sor. Böylece cevabı kolayca bulursun.
:::

## 1. Enerji dönüşümleri

Enerji bir türden başka bir türe dönüşebilir. Günlük hayattan örnekler:

| Araç ya da olay | Dönüşüm |
| --- | --- |
| Elektrik süpürgesi | Elektrik enerjisi → hareket enerjisi (+ ısı ve ses) |
| Ampul | Elektrik enerjisi → ışık enerjisi (+ ısı) |
| Güneş paneli | Işık enerjisi → elektrik enerjisi |
| Pil | Kimyasal enerji → elektrik enerjisi |
| Yemek yiyen insan | Kimyasal enerji → hareket ve ısı enerjisi |
| Hidroelektrik santrali | Su kütlesinin enerjisi → elektrik enerjisi |

Dönüşüm sırasında enerjinin bir kısmı genellikle **ısı** olarak dağılır. Bu enerji yok olmaz ama işe yarayan kısımdan çıkar. Bu yüzden telefon şarj olurken ya da bilgisayar çalışırken ısınır.

## 2. Fotosentez

**Fotosentez**, yeşil bitkilerin, alglerin ve bazı bakterilerin **ışık enerjisini** kullanarak **su ve karbondioksitten besin (glikoz) ve oksijen** üretmesidir. Fotosentez bitki hücresindeki **kloroplast** denilen organelde, **klorofil** pigmentiyle gerçekleşir.

$$\text{Karbondioksit} + \text{Su} \xrightarrow{\text{ışık, klorofil}} \text{Glikoz} + \text{Oksijen}$$

Fotosentezde **ışık enerjisi kimyasal enerjiye** dönüşür ve glikozun içinde depolanır.

- **Girenler:** Karbondioksit (havadan), su (kökten), ışık.
- **Ürünler:** Glikoz (bitkinin besini) ve oksijen (atmosfere verilir).

:::baglanti
Fotosentezin ürünü olan **oksijen**, bütün canlıların solunumu için gereklidir. Ayrıca fotosentez havadaki karbondioksiti azaltır. Bu yüzden ormanlar küresel ısınmayla mücadelede önemlidir.
:::

Fotosentezin hızı **ışık şiddeti, karbondioksit miktarı ve sıcaklık** gibi etkenlere bağlıdır.

## 3. Hücresel solunum

**Hücresel solunum**, besinlerin (glikozun) oksijenle parçalanarak **enerji** elde edilmesidir. Bu olay bütün canlı hücrelerinde, **mitokondri** denen organelde gerçekleşir.

$$\text{Glikoz} + \text{Oksijen} \longrightarrow \text{Karbondioksit} + \text{Su} + \text{Enerji}$$

Hücresel solunumda **besinlerdeki kimyasal enerji**, hücrenin kullanabileceği enerjiye dönüşür. Enerjinin bir kısmı ısı olarak açığa çıkar. Vücut sıcaklığımızın sabit kalmasını sağlayan şey de budur.

| Özellik | Fotosentez | Hücresel solunum |
| --- | --- | --- |
| Nerede olur? | Kloroplastlı hücreler | Bütün canlı hücreler |
| Organel | Kloroplast | Mitokondri |
| Girenler | $\text{CO}_2$, su, ışık | Glikoz, $\text{O}_2$ |
| Ürünler | Glikoz, $\text{O}_2$ | $\text{CO}_2$, su, enerji |
| Enerji | Depolanır | Açığa çıkar |

:::ipucu
Fotosentez ile hücresel solunumun **girenleri ve ürünleri birbirinin tersidir**. Birinin ürünü, diğerinin girenidir. Tabloyu bu gözle okursan hiç karıştırmazsın.
:::

## 4. Besin zinciri ve enerji akışı

Canlıların besin ilişkisi **besin zinciri** ile gösterilir. Zincir, **üreticiyle** başlar.

- **Üretici:** Fotosentezle besin yapan canlı (bitkiler, algler). Güneş enerjisini zincire sokar.
- **Birincil tüketici:** Bitkiyle beslenen otçul canlı (tavşan, ceylan).
- **İkincil tüketici:** Otçullarla beslenen etçil canlı (tilki).
- **Ayrıştırıcı:** Ölü canlıları ve atıkları parçalayan bakteri ve mantarlar. Maddelerin doğaya geri dönmesini sağlar.

$$\text{Bitki} \longrightarrow \text{Tavşan} \longrightarrow \text{Tilki} \longrightarrow \text{Kartal}$$

Oklar **enerjinin ve maddenin akış yönünü** gösterir, yani okun yönü “yenilen canlıdan yiyen canlıya” doğrudur.

### Enerji kaybı

Her basamakta canlı, aldığı enerjinin büyük bölümünü **yaşamsal faaliyetlerde** (solunum, hareket, ısı) kullanır. Yalnızca küçük bir kısmı bir sonraki basamağa geçer. Kabaca her basamakta enerjinin **yaklaşık %10’u** bir üst basamağa aktarılır.

:::neden-sonuc
- Her basamakta enerjinin çoğu ısı olarak kaybolur => Zincirin uç basamaklarına çok az enerji ulaşır.
- Üst basamaklara az enerji ulaşır => Üst basamaktaki canlı sayısı daha azdır. Kartal sayısı tavşan sayısından, tavşan sayısı bitki sayısından azdır.
- Bir basamaktaki canlı sayısı aniden azalır => Zincirin diğer halkaları etkilenir. Tilki azalırsa tavşan sayısı artar, bitkiler azalır.
:::

Zincirde canlıların sayısının, kütlesinin ve enerjinin **alttan üste doğru azaldığı** görüntüye **enerji piramidi** denir.

## 5. Madde döngüleri

Enerji tek yönlü akar (Güneş’ten başlayıp ısı olarak uzaya gider), ama **madde döngü yapar**. Aynı atomlar defalarca kullanılır.

**Karbon döngüsü:** Bitkiler atmosferdeki $\text{CO}_2$’yi fotosentezle alır ve glikoza dönüştürür. Canlılar solunumla $\text{CO}_2$’yi tekrar atmosfere verir. Ölü canlılar ayrışınca, fosil yakıtlar yanınca da $\text{CO}_2$ atmosfere karışır.

**Azot döngüsü:** Havanın yaklaşık %78’i azottur ama canlılar bunu doğrudan kullanamaz. Baklagil kökündeki bazı bakteriler azotu bitkilerin kullanabileceği bileşiklere çevirir. Bitkiler bu bileşikleri alır, hayvanlar bitkileri yer. Ölü canlılar ayrıştırıcılarla parçalanır ve azot toprağa ya da havaya döner.

**Su döngüsü:** Güneş enerjisiyle denizler ve göller buharlaşır, buhar yükselip yoğunlaşarak bulut oluşturur ve yağış olarak yeryüzüne döner.

:::baglanti
Ayrıştırıcılar olmasaydı ölü canlılardaki maddeler toprağa karışamaz, bitkiler besin bulamaz ve döngü kesilirdi. Ayrıştırıcılar doğanın “geri dönüşüm ustalarıdır”.
:::

## 6. Çevre sorunları ve sürdürülebilirlik

İnsan faaliyetleri doğal dengeyi bozabilir.

| Sorun | Sebep | Sonuç |
| --- | --- | --- |
| Hava kirliliği | Fosil yakıt, sanayi, egzoz | Solunum hastalıkları, asit yağmuru |
| Su kirliliği | Atıkların ve kimyasalların suya karışması | Canlı ölümleri, içme suyu sorunu |
| Toprak kirliliği | Aşırı gübre, ilaç, çöp | Verim düşer, besin zincirine zehir karışır |
| Ormansızlaşma | Ağaç kesme, yangın | Karbondioksit artar, canlılar yaşam alanı kaybeder |

**Sürdürülebilir kalkınma**, bugünün ihtiyaçlarını karşılarken gelecek nesillerin kaynaklarını tüketmemektir. Bunun için şunlar yapılabilir:

- **Yenilenebilir enerji** kaynaklarını (güneş, rüzgâr, su, jeotermal) kullanmak. Bunlar tükenmez ve çevreye daha az zarar verir.
- **Geri dönüşüm** yapmak. Kâğıt, cam, plastik ve metal tekrar kullanılabilir.
- Enerji, su ve gıda israfını azaltmak.
- Bilinçli tüketim yapmak, gereksiz paketli ürünlerden kaçınmak.

## 7. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Enerji dönüşümü | Enerji yok olmaz, türü değişir |
| Fotosentez | Işık → kimyasal enerji, glikoz + $\text{O}_2$ üretir |
| Hücresel solunum | Glikoz + $\text{O}_2$ → $\text{CO}_2$ + su + enerji |
| Besin zinciri | Üretici ile başlar, her basamakta enerji kaybolur |
| Madde döngüsü | Madde döngüsel, enerji tek yönlü |
| Sürdürülebilirlik | Yenilenebilir enerji, geri dönüşüm, tasarruf |

## Mini test

:::soru{cevap="B"}
Aşağıdakilerden hangisi fotosentezin **ürünlerinden** biridir?

- A) Karbondioksit
- B) Glikoz
- C) Su
- D) Işık

---

1. Fotosentezin girenleri karbondioksit, su ve ışıktır. A, C ve D girendir.
2. Ürünler glikoz ve oksijendir. Doğru cevap B.
:::

:::soru{cevap="D"}
Bir ekosistemde şu besin zinciri bulunuyor: **Ot → Çekirge → Kurbağa → Yılan**

Buna göre aşağıdakilerden hangisi doğrudur?

- A) Yılan üretici canlıdır.
- B) Enerji miktarı yılana doğru artar.
- C) Çekirge ikincil tüketicidir.
- D) Yılan sayısı azalırsa kurbağa sayısı başlangıçta artabilir.

---

1. Üretici ot’tur. Yılan en üst basamaktaki tüketicidir. A yanlış.
2. Enerji her basamakta azalır, yılana en az enerji ulaşır. B yanlış.
3. Çekirge otla beslendiği için birincil tüketicidir. C yanlış.
4. Yılan azalırsa kurbağayı yiyen azalacağı için kurbağa sayısı başlangıçta artabilir. Doğru cevap D.
:::

:::soru{cevap="A"}
Aşağıdaki olaylardan hangisinde **kimyasal enerji** doğrudan elektrik enerjisine dönüşür?

- A) Bir cep telefonu bataryasının cihazı çalıştırması
- B) Bir güneş panelinin evi aydınlatması
- C) Bir rüzgâr türbininin elektrik üretmesi
- D) Bir elektrik sobasının odayı ısıtması

---

1. Pil ya da batarya, içindeki kimyasal enerjiyi elektrik enerjisine dönüştürür. Doğru cevap A.
2. Güneş panelinde ışık enerjisi elektriğe, rüzgâr türbininde hareket enerjisi elektriğe dönüşür. Elektrik sobasında ise elektrik, ısı enerjisine dönüşür.
:::

:::soru{cevap="C"}
Bir ormanda ağaçların büyük bölümü kesiliyor.

Buna göre bu durumun sonuçları arasında aşağıdakilerden hangisi **yer almaz**?

- A) Atmosferdeki karbondioksit miktarı artabilir.
- B) Hayvanlar yaşam alanlarını kaybedebilir.
- C) Atmosferdeki oksijen miktarı artar.
- D) Toprak erozyonu hızlanabilir.

---

1. Ağaçlar fotosentezle karbondioksiti alır, oksijen verir. Ağaçlar azalınca karbondioksit artar, oksijen üretimi azalır. A doğru, C yanlış.
2. Orman yok olunca canlılar barınma ve besin kaybeder, toprak tutunamadığı için erozyon hızlanır. B ve D doğru.
3. Yer almayan sonuç C’dir.
:::

## Kendini dene

:::dene
1. Fotosentez ve hücresel solunum arasındaki iki farkı yaz. => Fotosentez ışık enerjisini kimyasal enerjiye çevirir, kloroplastta olur ve oksijen üretir. Hücresel solunum besindeki enerjiyi açığa çıkarır, mitokondride olur ve oksijen harcar.
2. Besin zincirinde enerji neden üst basamaklara doğru azalır? => Her basamakta enerjinin çoğu solunum, hareket ve ısı olarak kullanılır, yalnızca küçük bir kısmı bir sonraki basamağa geçer.
3. Ayrıştırıcıların doğadaki görevi nedir? => Ölü canlıları ve atıkları parçalayıp maddelerin toprağa ve havaya geri dönmesini sağlarlar.
4. Yenilenebilir enerji kaynağı olan iki örnek ver. => Güneş enerjisi, rüzgâr enerjisi (ya da su ve jeotermal enerji).
5. Madde ile enerjinin doğadaki dolaşımı arasındaki fark nedir? => Madde döngü yapar, tekrar tekrar kullanılır. Enerji tek yönlüdür, Güneş’ten gelip sonunda ısı olarak dağılır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'lgs-fen' and name = 'Enerji Dönüşümleri ve Çevre Bilimi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Enerji dönüşümleri, fotosentez ve hücresel solunum, besin zincirinde enerji akışı, madde döngüleri (karbon, azot, su), çevre sorunları, sürdürülebilir kalkınma, yenilenebilir enerji. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Besin zincirinde “yaklaşık %10” bilgisinin 8. sınıf kapsamında olup olmadığı, (b) azot döngüsü ayrıntısı (havanın %78’i azot) programdan fazla ise kısaltın, (c) Hücresel solunum formülü, (d) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Enerji Dönüşümleri ve Çevre Bilimi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Kazağını çıkarırken saçların havalanır, kapı koluna dokununca elektrik çarpar, yağmurlu havada şimşek çakar. Bunların hepsi **elektrik yüklerinin** oyunudur. Bu konuda yüklü cisimlerin birbirini nasıl etkilediğini, yüklenmenin nasıl olduğunu ve evde harcadığımız elektrik enerjisinin nasıl hesaplandığını öğreneceksin.

:::hedefler
1. Atomdaki yükleri ve cisimlerin nötr, pozitif ya da negatif yüklü olma durumunu açıklamak.
2. Yüklü cisimler arasındaki çekme ve itme kuvvetini yorumlamak.
3. Sürtünme, dokunma ve etki ile yüklenmeyi karşılaştırmak, elektroskobu kullanmak.
4. Topraklama ve paratonerin işlevini açıklamak.
5. Elektrik enerjisini kWh cinsinden hesaplayıp tasarruf yollarını söylemek.
:::

:::ipucu
Bu ünitedeki sorular **yüklerin yönünü** takip etmeyi ister. Her soruda şunu yap: **Hangi yük hareket ediyor? Elektronlar.** Proton sayısı çekirdekte sabit kalır, yalnızca elektronlar yer değiştirir.
:::

## 1. Elektrik yükleri

Her madde atomlardan oluşur. Atomun yapısında üç parçacık vardır.

| Parçacık | Yük | Yeri |
| --- | --- | --- |
| Proton | Pozitif (+) | Çekirdekte |
| Nötron | Yüksüz | Çekirdekte |
| Elektron | Negatif (−) | Çekirdek etrafında |

Bir atomda proton ve elektron sayısı eşitse atom **nötrdür**. Cisimlerde de pozitif ve negatif yükler eşit sayıdaysa cisim **nötrdür**.

- Cisim **elektron kaybederse** pozitif yüklü olur (protonlar fazla kalır).
- Cisim **elektron kazanırsa** negatif yüklü olur (elektronlar fazla olur).

Katı maddelerde yalnızca elektronlar hareket edebilir. Protonlar çekirdekten ayrılmaz. Bu yüzden cismin yüklenmesi her zaman **elektron alışverişiyle** olur.

:::baglanti
Cismin yüklü olması, o cisimde **elektron fazlalığı ya da eksikliği olması** demektir. Yük sayısı, **elektron sayısıyla proton sayısı arasındaki farktır**. Örneğin 5 proton ve 3 elektronu olan bir cisim 2 birim pozitif yüklüdür.
:::

## 2. Yüklü cisimlerin etkileşimi

Yüklü cisimler birbirlerine kuvvet uygular.

- **Aynı cins yükler birbirini iter.** (+ ile +, − ile −)
- **Zıt cins yükler birbirini çeker.** (+ ile −)
- Yüklü bir cisim **nötr bir cismi de çeker.** Nötr cisimdeki yükler yer değiştirir (etki ile), yakın tarafta zıt yük birikir ve cisimler birbirini çeker.

Kuvvet, yükler arasındaki mesafe **küçüldükçe artar**, yüklerin miktarı **büyüdükçe artar**.

| Durum | Sonuç |
| --- | --- |
| (+) ve (+) | İtme |
| (−) ve (−) | İtme |
| (+) ve (−) | Çekme |
| Yüklü ve nötr | Çekme (etki ile) |

:::dene
1. Pozitif yüklü A cismi, B cismini itiyor. B cisminin yükü nasıldır? => Pozitiftir. Yalnızca aynı cins yükler birbirini iter.
2. C cismi hem A (+) hem B (−) cismini çekiyor. C cismi için ne söylenebilir? => C nötr olabilir. Nötr cisim, yüklü cisimleri etki ile çeker.
:::

## 3. Yüklenme çeşitleri

Cisimler üç yolla yüklenebilir.

### Sürtünme ile yüklenme

İki yalıtkan cisim birbirine sürtülünce biri diğerine elektron verir. Elektron veren **pozitif**, elektron alan **negatif** yüklenir. İkisi de **zıt cins ve eşit miktarda** yüklenir. Örneğin ebonit çubuk yünlü kumaşa sürtülünce ebonit negatif, kumaş pozitif yüklenir. Cam çubuk ipek kumaşa sürtülünce cam pozitif, ipek negatif yüklenir.

### Dokunma ile yüklenme

Yüklü bir iletken, nötr bir iletkene **dokundurulunca** yük paylaşılır. İki cisim de **aynı cins yükle** yüklenir. Negatif yüklü cisim dokunduğu cisme elektron verir, iki cisim de negatif olur.

### Etki ile yüklenme

Yüklü bir cisim, nötr bir iletkene **dokunmadan yaklaştırılınca** iletkendeki yükler ayrılır. İletken **topraklanır**, sonra toprak bağlantısı kesilip yüklü cisim uzaklaştırılırsa iletken **yaklaştırılan cismin tersi cins yükle** yüklenmiş olur.

Örnek: Negatif yüklü bir çubuk nötr bir iletken küreye yaklaştırılır.

1. Çubuğa yakın uçta (+) yükler, uzak uçta (−) yükler toplanır.
2. Uzak uçtaki (−) yükler topraklama ile toprağa gider.
3. Toprak bağlantısı kesilip çubuk uzaklaştırılınca küre **pozitif** yüklü kalır.

| Yüklenme | Yüklenme sonucu |
| --- | --- |
| Sürtünme | Zıt cins, eşit miktar |
| Dokunma | Aynı cins |
| Etki | Yaklaştırılan cismin tersi cins |

## 4. Elektroskop

**Elektroskop**, cismin yüklü olup olmadığını anlamaya yarayan araçtır. Metal bir topuz, çubuk ve ince metal yapraklardan oluşur.

- Nötr elektroskopta yapraklar **kapalıdır**.
- Yüklü bir cisim topuza **dokundurulursa** ya da **yaklaştırılırsa** yapraklar aynı cins yükle yüklenir ve **birbirini iterek açılır**.
- Yüklü cisim ne kadar çok yüklüyse yapraklar o kadar çok açılır.
- Yüklü elektroskoba **zıt cins yüklü cisim** yaklaştırılırsa yapraklar önce kapanabilir, sonra tekrar açılabilir.

:::ipucu
Elektroskop yapraklarının açılması **cismin yüklü olduğunu** gösterir ama **yükün cinsini** doğrudan söylemez. Cinsi anlamak için elektroskobun yükünü önceden bilmen gerekir.
:::

## 5. İletken, yalıtkan ve topraklama

**İletken** maddelerde (metaller) elektronlar serbestçe hareket eder. **Yalıtkan** maddelerde (plastik, cam, kauçuk) elektronlar hareket edemez. Yalıtkanlar sürtünmeyle yüklenir ama yükü yayamaz.

**Topraklama**, yüklü bir cismin elektronlarının toprağa akması ya da topraktan elektron alıp nötr hâle gelmesidir. Yer, çok büyük olduğu için yük alıp verebilir. Evlerdeki prizlerin topraklı olması, elektrikli aletlerde oluşabilecek fazla yükün güvenle boşalmasını sağlar.

**Paratoner**, yüksek binalara yerleştirilen sivri uçlu metal çubuktur. Yıldırım düşerken yük, paratoner üzerinden **toprağa** iletilir. Böylece binaya ve içindekilere zarar gelmez.

:::neden-sonuc
- Bulutlarda yük birikir => Bulut ile yer arasında şiddetli bir yük boşalması, yani **yıldırım** olur.
- Binaya paratoner takılır => Yıldırımın yükü metal çubuk ve kablo yoluyla toprağa gider, bina zarar görmez.
- Benzin tankerinin altına zincir sarkıtılır => Sürtünmeyle biriken yük toprağa iletilir, kıvılcım ve yangın riski azalır.
:::

## 6. Elektrik enerjisi ve tüketimi

Evlerde kullandığımız cihazlar elektrik enerjisini ışığa, ısıya, harekete ya da sese dönüştürür. Cihazların bir saniyede harcadığı enerjiye **güç** denir. Gücün birimi **watt (W)** tır.

$$E = P \cdot t$$

Elektrik enerjisi **kilowatt saat (kWh)** ile ölçülür ve faturada bu birim kullanılır. Güç kilowatt, süre saat alınır.

$$1\ \text{kW} = 1000\ \text{W}$$

Örnek: Gücü 2000 W olan bir ütü günde 1,5 saat çalışırsa harcadığı enerji:

$$2\ \text{kW} \cdot 1{,}5\ \text{h} = 3\ \text{kWh}$$

Bir kWh’ın fiyatı 4 TL ise bu ütünün günlük maliyeti $3 \cdot 4 = 12$ TL olur.

:::dene
1. Gücü 100 W olan bir ampul günde 5 saat yanarsa kaç kWh enerji harcar? => $0{,}1\ \text{kW} \cdot 5\ \text{h} = 0{,}5$ kWh
2. Gücü 1500 W olan bir saç kurutma makinesi 20 dakika çalışırsa kaç kWh enerji harcar? => $1{,}5\ \text{kW} \cdot \dfrac{1}{3}\ \text{h} = 0{,}5$ kWh
:::

### Enerji tasarrufu

- Kullanılmayan cihazları prizden çekmek ve bekleme modunda bırakmamak.
- **LED ampul** kullanmak. Aynı ışığı çok daha az enerjiyle verir.
- Enerji verimliliği yüksek (A+++ gibi) cihazları seçmek.
- Çamaşır ve bulaşık makinesini dolu çalıştırmak.
- Mümkün olduğunda gün ışığından yararlanmak.

## 7. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Yük taşıyıcıları | Elektron hareket eder, proton sabittir |
| Çekme ve itme | Aynı cins iter, zıt cins çeker |
| Sürtünme | Zıt cins, eşit yük |
| Dokunma | Aynı cins yük |
| Etki | Yaklaştırılanın tersi yük, topraklama gerekir |
| Elektroskop | Yapraklar aynı yükle birbirini iter |
| Elektrik enerjisi | $E = P \cdot t$, birim kWh |

## Mini test

:::soru{cevap="B"}
Nötr bir cam çubuk ipek kumaşa sürtülüyor ve cam çubuk pozitif yükleniyor.

Buna göre bu olay için aşağıdakilerden hangisi doğrudur?

- A) İpek kumaştan cam çubuğa proton geçmiştir.
- B) Cam çubuktan ipek kumaşa elektron geçmiştir.
- C) İpek kumaş da pozitif yüklenmiştir.
- D) Cam çubuktaki proton sayısı azalmıştır.

---

1. Katı maddelerde yalnızca elektronlar hareket eder, protonlar geçmez. A ve D yanlış.
2. Cam çubuk pozitif yüklendiğine göre elektron kaybetmiştir. Elektronlar ipek kumaşa geçmiştir. Doğru cevap B.
3. Sürtünmede zıt cins yüklenme olur, ipek negatif yüklenir. C yanlış.
:::

:::soru{cevap="C"}
Negatif yüklü bir çubuk, nötr bir elektroskobun topuzuna dokunmadan yaklaştırılıyor.

Buna göre elektroskobun yaprakları için aşağıdakilerden hangisi söylenebilir?

- A) Kapalı kalır.
- B) Pozitif yüklenerek açılır.
- C) Aynı cins yükle yüklenip birbirini iterek açılır.
- D) Yaprakların yükü azalır, kapanır.

---

1. Negatif yüklü çubuk yaklaştırılınca topuzdaki elektronlar itilir ve yapraklara doğru gider.
2. Yapraklar aynı cins (negatif) yükle yüklenir ve birbirini iter, yani açılır.
3. Doğru cevap C.
:::

:::soru{cevap="A"}
Gücü 500 W olan bir cihaz her gün 4 saat çalıştırılıyor.

Buna göre bu cihaz 10 günde kaç kWh elektrik enerjisi harcar?

- A) 20
- B) 2
- C) 200
- D) 5

---

1. $500\ \text{W} = 0{,}5\ \text{kW}$
2. Bir günlük enerji: $0{,}5 \cdot 4 = 2$ kWh.
3. 10 günlük enerji: $2 \cdot 10 = 20$ kWh. Doğru cevap A.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi enerji tasarrufu açısından **yanlış** bir davranıştır?

- A) Kullanılmayan cihazları prizden çekmek
- B) LED ampul kullanmak
- C) Gün ışığından yararlanmak
- D) Odadan çıkarken ışıkları açık bırakmak

---

1. A, B ve C elektrik tüketimini azaltan davranışlardır.
2. Boş odada ışık açık bırakmak gereksiz enerji harcar. Doğru cevap D.
:::

## Kendini dene

:::dene
1. Bir cisim neden elektron alıp vererek yüklenir, proton alıp vererek yüklenmez? => Protonlar çekirdeğin içinde bulunur ve yerinden ayrılmaz. Elektronlar atomun dış kısmında olduğu için kolayca geçebilir.
2. Pozitif yüklü bir cisim nötr bir iletkene dokundurulursa iletken nasıl yüklenir? => Pozitif yükle yüklenir. Dokunma ile yüklenmede iki cisim de aynı cins yük alır.
3. Topraklamanın ne işe yaradığını bir örnekle anlat. => Fazla yükü toprağa akıtır. Örneğin paratoner, yıldırımın yükünü toprağa ileterek binayı korur.
4. 60 W gücündeki bir ampul 10 saat yanarsa kaç kWh enerji harcar? => $0{,}06 \cdot 10 = 0{,}6$ kWh
5. Aynı cins yüklü iki cismi birbirine yaklaştırırsak ne gözlenir? => Birbirini iterler.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'lgs-fen' and name = 'Elektrik Yükleri ve Elektrik Enerjisi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Atomdaki yükler, yüklü cisimlerin etkileşimi, yüklenme çeşitleri (sürtünme, dokunma, etki), elektroskop, iletken ve yalıtkan, topraklama, paratoner, elektrik enerjisi ve tasarrufu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Etki ile yüklenme anlatımı (adımların sırası), (b) Elektrik enerjisi hesabında kWh ve $E = P \cdot t$ formülünün 8. sınıf kapsamında olup olmadığı, (c) Elektroskop ve yalıtkan örnekleri, (d) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-fen' and name = 'Elektrik Yükleri ve Elektrik Enerjisi'
on conflict (topic_id) do nothing;

