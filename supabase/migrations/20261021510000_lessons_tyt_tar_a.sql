-- TYT Tarih konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir olayın ne zaman, nerede ve neden yaşandığını bilmeden o olayı anlayamazsın. Tarih bilimi geçmişi tek tek olaylar yığını olarak değil, **neden-sonuç ilişkisi içinde** inceler. Bu konuda tarihin tanımını, **kaynaklarını**, yardımcı bilimlerini, **zamanı ölçme yöntemlerini** ve tarihin çağlara nasıl ayrıldığını öğreneceksin. Bu temel, bütün tarih konularında kullanacağın bir araç takımıdır.

:::hedefler
1. Tarihin tanımını ve tarih bilimine özgü ilkeleri açıklamak.
2. Tarihî kaynakları türlerine göre ve birincil, ikincil ayrımıyla sınıflandırmak.
3. Tarihin yardımcı bilimlerini ve ilgi alanlarını eşleştirmek.
4. Takvimleri ve tarihin çağlarını tanımak, olayları kronolojik sıraya koymak.
5. Tarihçinin objektifliğini ve kaynak eleştirisini yorumlamak.
:::

## 1. Tarih nedir

**Tarih**, geçmişte yaşanmış olayları **yer ve zaman göstererek**, **neden-sonuç ilişkisi içinde** inceleyen bilimdir. Tarih bilimi şu özelliklere sahiptir:

- Olaylar **belgelere** dayanılarak incelenir. Belge yoksa kesin yargı verilmez.
- Olaylar bir daha **aynı biçimde tekrar edemez**, bu yüzden tarihte deney yapılamaz.
- Tarihçi **objektif** olmaya çalışır. Yani kişisel görüş ve duygularını araya katmamalıdır.
- Olaylar yaşandıkları dönemin koşulları içinde değerlendirilir.
- Tarih, geçmişten ders çıkarmaya ve geleceği anlamaya yardımcı olur.

**Tarihçilik** tarihi araştırma ve yazma işidir. **Herodot** “tarihin babası” olarak bilinir. **İbn Haldun** ise toplum ve tarih ilişkisini ilk inceleyenlerden biri olarak tanınır.

## 2. Tarihî kaynaklar

Tarihçi geçmişi **kaynaklar** aracılığıyla öğrenir.

| Tür | Örnek |
| --- | --- |
| Yazılı | Kitabe, ferman, kronik, anı (hatırat), mektup, arşiv belgesi |
| Sözlü | Destan, efsane, mani, türkü, atasözü |
| Görsel | Resim, fotoğraf, harita, film |
| Maddi (arkeolojik) | Aletler, kap kacak, silah, mezar, yapı kalıntısı |

Kaynaklar ayrıca **birincil** ve **ikincil** olarak ayrılır:

- **Birincil kaynak:** Olayın yaşandığı dönemde, olaya tanık olan ya da katılanlarca üretilen belgedir. Örnek: Padişah fermanı, savaşa katılan komutanın günlüğü.
- **İkincil kaynak:** Olaydan sonra, birincil kaynaklara dayanarak yazılmış eserdir. Örnek: Bir tarihçinin yazdığı akademik kitap, ders kitabı.

Tarihçi kaynakları **eleştirel** biçimde değerlendirir. Bir tek kaynağa bakmaz, kaynakları birbirleriyle karşılaştırır. Bir olayı anlatan kişinin tarafsız olup olmadığına dikkat eder.

## 3. Yardımcı bilimler

| Bilim | İncelediği alan |
| --- | --- |
| Arkeoloji | Kazılarla çıkarılan maddi kalıntılar |
| Antropoloji | İnsanın biyolojik ve kültürel gelişimi |
| Nümizmatik | Sikke ve paralar |
| Epigrafi | Taş, kaya ve mermer üzerindeki yazıtlar (kitabeler) |
| Filoloji | Dil ve yazı |
| Paleografya | Eski yazıların okunması |
| Diplomatik | Belge ve fermanların biçimi, doğruluğu |
| Kronoloji | Olayların zaman sıralaması |
| Coğrafya | Olayların geçtiği mekânın özellikleri |
| Sigillografi | Mühür ve damgalar |
| Heraldik | Arma ve sembol |
| Genealoji | Soy ağacı |
| Etnografya | Halkların yaşam biçimi ve kültürü |

## 4. Zamanın ölçülmesi: takvimler

**Takvim**, zamanı gün, hafta, ay ve yıl gibi birimlerle bölen sistemdir. Zamanın ölçülmesi tarihçiye olayları sıraya koyma imkânı verir.

- **Güneş takvimi:** Dünya’nın Güneş etrafındaki dönüşüne dayanır. Miladi takvim bu türdendir.
- **Ay takvimi:** Ay’ın Dünya etrafındaki dönüşüne dayanır. Hicri takvim bu türdendir ve Güneş yılından yaklaşık 11 gün kısadır.
- **Miladi takvim:** Hz. İsa’nın doğumu başlangıç kabul edilir. Bu tarihten önceki yıllar **MÖ**, sonrakiler **MS** diye yazılır.
- **Hicri takvim:** Hz. Muhammed’in Mekke’den Medine’ye **hicreti** başlangıç alınır. Miladi 622 yılıdır. Hz. Ömer döneminde kabul edilmiştir.
- **Jülyen** ve **Gregoryen takvimleri** Miladi takvimin sürümleridir. Gregoryen takvim, Jülyen takvimin hata payını düzelten takvimdir.
- **Rumi takvim:** Osmanlı’da mali işlerde kullanılan takvimdir (Jülyen esaslı).
- **Eski Türklerde on iki hayvanlı Türk takvimi** (Fare, Öküz, Kaplan, Tavşan, Ejderha, Yılan, At, Koyun, Maymun, Tavuk, Köpek, Domuz) kullanılmıştır.
- **Cumhuriyet döneminde:** 1926’da Miladi takvim kabul edilmiştir.

## 5. Tarihin çağları

![Tarihin beş bölümü. Tarih öncesi ve İlk, Orta, Yeni ve Yakın Çağ, sınır olayları ile birlikte gösterilmiştir](/lessons/tyt-tar/tarih-cagleri.svg "Tarihin çağları | Yolumnet")

- **Tarih öncesi (Tarih öncesi çağlar):** Yazının bulunmasından önceki dönem. Bilgiler arkeolojik buluntulara dayanır.
- **İlk Çağ:** Yazının bulunmasından (yaklaşık MÖ 3200, Sümerler) Batı Roma’nın yıkılışına (476) kadar.
- **Orta Çağ:** 476’dan İstanbul’un fethine (1453) kadar.
- **Yeni Çağ:** 1453’ten Fransız İhtilali’ne (1789) kadar.
- **Yakın Çağ:** 1789’dan günümüze.

Bu bölümlemeler **Avrupa tarihine göre** yapılmıştır, her topluma tam uymaz. Türk tarihinde bu çağlar yerine genellikle Türk devletleri ve dönemleri esas alınır. Çağ başlangıç ve bitişlerini belirleyen olaylar **dönüm noktalarıdır**.

:::neden-sonuc
- Olay yazılı belgeyle destekleniyor => Güvenilirliği artar.
- Yazı bulunuyor => Tarih öncesi biter, İlk Çağ başlar.
- İstanbul fethediliyor => Orta Çağ biter, Yeni Çağ başlar.
- Tarihçi görüşlerini araya katıyor => Objektiflik zedelenir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Birincil kaynakla ikincil kaynağı karıştırma.** Olayın kendi zamanında yazılan belge birincil, sonradan o belgelere bakarak yazılan eser ikincildir. Bir de **tarihte deney yapılabileceğini sanma**: Olaylar tekrar edemez, bu yüzden tarih bilimi belge ve gözleme dayanır. **Hicri takvimi Miladi 610 ile başlatma**: 610 ilk vahiy yılıdır, hicret ise 622’dir.
:::

:::baglanti
Bu konudaki çağ bölümlemesi, “İnsanlığın İlk Dönemleri” ve “Orta Çağ’da Dünya” konularının çerçevesini çizer. Takvim bilgisi “İslam Medeniyetinin Doğuşu” konusunda hicret olayı ile, “Atatürkçülük ve Türk İnkılabı” konusunda takvim değişikliği ile yeniden karşına çıkar. Coğrafyada “Dünya’nın Şekli ve Hareketleri” konusundaki Dünya’nın dönüşleri takvimlerin temelidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tarih | Yer, zaman ve neden-sonuç içinde geçmiş |
| Birincil kaynak | Olay zamanında üretilen belge |
| İkincil kaynak | Sonradan, belgelere dayanan eser |
| Arkeoloji | Kazı ve maddi kalıntı |
| Nümizmatik | Sikke |
| Epigrafi | Yazıt (kitabe) |
| Hicri takvim | Ay takvimi, başlangıç Miladi 622 |
| İlk Çağ | Yazıdan 476’ya |
| Orta Çağ | 476 ile 1453 |

## Mini test

:::soru{cevap="A"}
Bir tarihçi, bir savaşa katılmış komutanın savaştan hemen sonra yazdığı günlüğü ve o savaşın geçtiği alanda yapılan kazıda bulunan silah parçalarını birlikte inceliyor. Bu iki kaynak türü sırasıyla aşağıdakilerden hangisidir?

- A) Yazılı birincil kaynak ve maddi kaynak
- B) Yazılı ikincil kaynak ve görsel kaynak
- C) Sözlü kaynak ve maddi kaynak
- D) Görsel kaynak ve yazılı kaynak
- E) Yazılı ikincil kaynak ve sözlü kaynak

---

1. Komutanın günlüğü yazılıdır ve olayı yaşayan kişiden geldiği için birincil kaynaktır.
2. Kazıdan çıkan silah parçaları maddi (arkeolojik) kaynaktır. Doğru cevap A.

Diğer şıklar: **Yazılı ikincil kaynak ve görsel kaynak** günlük olay sırasında yazıldığı için birincildir / **Sözlü kaynak ve maddi kaynak** günlük yazılı kaynaktır / **Görsel kaynak ve yazılı kaynak** silah parçaları görsel değil maddi kaynaktır / **Yazılı ikincil kaynak ve sözlü kaynak** günlük birincil kaynaktır, silah parçası sözlü kaynak değildir.
:::

:::soru{cevap="D"}
Aşağıdaki olayların eskiden yeniye doğru kronolojik sıralaması hangisinde doğru verilmiştir?

- A) Batı Roma’nın yıkılışı, yazının icadı, İstanbul’un fethi, Fransız İhtilali
- B) Yazının icadı, İstanbul’un fethi, Batı Roma’nın yıkılışı, Fransız İhtilali
- C) Yazının icadı, Batı Roma’nın yıkılışı, Fransız İhtilali, İstanbul’un fethi
- D) Yazının icadı, Batı Roma’nın yıkılışı, İstanbul’un fethi, Fransız İhtilali
- E) İstanbul’un fethi, yazının icadı, Batı Roma’nın yıkılışı, Fransız İhtilali

---

1. Yazı yaklaşık MÖ 3200'de, Batı Roma'nın yıkılışı 476'da, İstanbul'un fethi 1453'te, Fransız İhtilali 1789'da gerçekleşti.
2. Bu sıra D seçeneğindedir.

Diğer şıklar: **Batı Roma’nın yıkılışı, yazının icadı, İstanbul’un fethi, Fransız İhtilali** yazının icadı Batı Roma’nın yıkılışından çok önce / **Yazının icadı, İstanbul’un fethi, Batı Roma’nın yıkılışı, Fransız İhtilali** İstanbul’un fethi Batı Roma’nın yıkılışından sonra / **Yazının icadı, Batı Roma’nın yıkılışı, Fransız İhtilali, İstanbul’un fethi** İstanbul’un fethi Fransız İhtilali’nden önce / **İstanbul’un fethi, yazının icadı, Batı Roma’nın yıkılışı, Fransız İhtilali** İstanbul’un fethi yazının icadından çok sonra.
:::

:::soru{cevap="D"}
Bir araştırmacı, Selçuklu döneminden kalan bir bakır paranın üzerindeki yazı ve kabartmalardan hükümdarın adını ve basıldığı şehri belirlemeye çalışıyor. Bu çalışma tarihin hangi yardımcı bilimiyle ilgilidir?

- A) Epigrafi
- B) Genealoji
- C) Heraldik
- D) Nümizmatik
- E) Kronoloji

---

1. Paralar ve sikkeler nümizmatiğin inceleme alanıdır.
2. Epigrafi taş ve mermer yazıtlarla ilgilenir. Doğru cevap D.

Diğer şıklar: **Epigrafi** epigrafi taş ve kaya yazıtlarını inceler / **Genealoji** genealoji soy ağacıyla ilgilidir / **Heraldik** heraldik arma ve sembolleri inceler / **Kronoloji** kronoloji olayların zaman sıralamasını inceler.
:::

:::soru{cevap="C"}
Hz. Muhammed’in Mekke’den Medine’ye hicretiyle başlayan Hicri takvimin başlangıcı Miladi takvime göre hangi yıldır?

- A) 570
- B) 610
- C) 622
- D) 623
- E) 632

---

1. Hicri takvimin başlangıcı hicret olayıdır.
2. Hicret Miladi 622 yılında gerçekleşmiştir. Doğru cevap C.

Diğer şıklar: **570** doğum yılı olarak bilinen yıl alınmış / **610** ilk vahyin geldiği yıl alınmış / **623** işlem hatasıyla bir fazla bulunmuş / **632** Hz. Muhammed’in vefat yılı alınmış.
:::

## Kendini dene

:::dene
1. Taş üzerindeki yazıtları inceleyen bilim hangisidir? => Epigrafi.
2. Hicri takvim hangi olayla başlar? => Hicret.
3. Orta Çağ hangi olayla sona erer? => İstanbul’un fethi (1453).
4. Olayın yaşandığı dönemde yazılan belge hangi tür kaynaktır? => Birincil kaynak.
5. Tarihte neden deney yapılamaz? => Olaylar aynı biçimde tekrar etmez.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'Tarih ve Zaman'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Tarih bilimi, kaynaklar, yardımcı bilimler, takvimler, tarihin çağları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (MÖ 3200, 476, 1453, 1789, 622, 1926) genel kabul görmüş bilgilerdir.
Kontrol edilecekler: Yazının icadı için MÖ 3200 yaklaşık değerdir (kaynaklara göre MÖ 3500 ile 3000 arasında verilir). Hicri takvimin Hz. Ömer döneminde başlatıldığı bilgisi ders kitabına göre teyit edilmeli. Çağ bölümlemesinin Avrupa merkezli olduğu notu eklendi.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Tarih ve Zaman'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İnsanlık tarihinin büyük kısmı yazının bulunmasından öncesine aittir. Bu uzun dönemde insan, avcılıktan tarıma, mağaradan köye ve şehre geçti. Sonra yazı bulundu, devletler kuruldu, ilk uygarlıklar ortaya çıktı. Bu konuda **tarih öncesi çağları**, Anadolu’nun önemli yerleşimlerini, **Mezopotamya ve Mısır uygarlıklarını**, **Anadolu uygarlıklarını** ile Yunan ve Roma dünyasını öğreneceksin.

:::hedefler
1. Tarih öncesi çağları ve her çağın ayırt edici özelliklerini sıralamak.
2. Anadolu’daki önemli yerleşim yerlerini (Göbeklitepe, Çatalhöyük vb.) tanımak.
3. Mezopotamya ve Mısır uygarlıklarının katkılarını açıklamak.
4. Anadolu uygarlıklarını (Hititler, Frigler, Lidyalılar vb.) özellikleriyle eşleştirmek.
5. Yunan ve Roma uygarlıklarının yönetim özelliklerini karşılaştırmak.
:::

## 1. Tarih öncesi çağlar

| Çağ | Özellik |
| --- | --- |
| Paleolitik (Eski Taş) | Avcılık ve toplayıcılık, göçebe yaşam, ateşin bulunması, yontma taş |
| Mezolitik (Orta Taş) | İklim ısındı, küçük av hayvanları, ilk köpek evcilleştirme |
| Neolitik (Yeni Taş) | **Tarıma geçiş**, hayvanların evcilleştirilmesi, **yerleşik hayat**, cilalı taş, çanak çömlek |
| Kalkolitik (Bakır) | Bakırın bulunması ve işlenmesi, ticaretin gelişmesi |
| Tunç (Bronz) Çağı | Bakır ve kalay karışımıyla tunç, tekerlek, şehir devletleri, yazı |
| Demir Çağı | Demirin kullanımı, silah ve alet gelişmesi |

**Neolitik Devrim** insanlık tarihinin dönüm noktasıdır. Tarım sayesinde insanlar artı ürün elde etti, bir yere yerleşti, nüfus arttı, işbölümü ve ticaret başladı, sonunda şehirler ve devletler doğdu.

## 2. Anadolu’daki ilk yerleşimler

- **Göbeklitepe (Şanlıurfa):** Bilinen en eski anıtsal tapınak alanlarından biridir (yaklaşık MÖ 10. bin yıl). İnsanların yerleşik hayata geçmeden de büyük yapılar inşa edebildiğini göstermiştir.
- **Çatalhöyük (Konya):** Neolitik dönemin en önemli yerleşimlerinden biridir. Evler yan yana, girişler çatıdan idi. Tarım ve hayvancılık yapılmıştır.
- **Çayönü (Diyarbakır):** Tarıma geçişin ve hayvanların evcilleştirilmesinin izlendiği yerleşimdir.
- **Hacılar (Burdur):** Neolitik ve Kalkolitik dönem. Boyalı çanak çömlek ve ev yapısıyla bilinir.
- **Alacahöyük (Çorum):** Tunç Çağı’nda Hatti uygarlığının önemli merkezidir. Mezarlarında bulunan altın ve tunç eşyalarıyla tanınır.

## 3. Yazının bulunuşu ve Mezopotamya

**Mezopotamya**, Dicle ve Fırat nehirleri arasındaki verimli bölgedir. İlk şehir devletleri ve yazı burada ortaya çıkmıştır.

- **Sümerler:** **Çivi yazısını** bulmuşlardır (yaklaşık MÖ 3200). Tekerleği, ilk okulları ve kil tabletleri kullanmışlardır. Şehir devletleri halinde yaşamışlardır.
- **Akadlar:** Sümer şehirlerini birleştirerek ilk imparatorluklardan birini kurmuştur.
- **Babilliler:** **Hammurabi** adlı kralları ilk yazılı kanunlardan biri olan **Hammurabi Kanunları**’nı yazdırmıştır. Gök bilimi ve matematik gelişmiştir.
- **Asurlular:** Askerî güçleriyle bilinen, demir silah kullanan bir devlettir.

## 4. Mısır

Mısır, **Nil Nehri** çevresinde gelişmiştir. Nil’in taşması tarıma uygun bir toprak getirdiği için “Mısır Nil’in armağanıdır” sözü vardır.

- Yönetici **firavun**dur ve tanrı kabul edilir. Merkezi, güçlü bir krallıktır.
- **Hiyeroglif** yazısı kullanılmıştır. Papirüs yazı malzemesi olmuştur.
- **Piramitler** firavunların mezarlarıdır. Ölümden sonra yaşama inanıldığı için **mumyalama** gelişmiştir.
- Güneş takvimine yakın 365 günlük bir takvim kullanılmış, geometri ve tıp ilerlemiştir.

## 5. Anadolu uygarlıkları

Anadolu, tarihin her döneminde pek çok uygarlığa ev sahipliği yapmıştır.

| Uygarlık | Özellik |
| --- | --- |
| Hattiler | Anadolu’nun ilk yerlileri, Alacahöyük, tunç işleme |
| **Hititler** | Merkezi **Hattuşa** (Çorum), **Kadeş Antlaşması** (Mısır ile, bilinen ilk yazılı antlaşmalardan), çivi yazısı, kanunlar |
| **Frigler** | Merkezi Gordion, Kral Midas, gamalı ve geometrik motifler |
| **Lidyalılar** | Merkezi Sard, **parayı** ilk kullananlar, ticaretle zenginleşme |
| Urartular | Van çevresi, kale ve su kanalları, demir işleme |
| İyonlar | Batı Anadolu kıyısı (Milet, Efes), felsefenin ve bilimin ilk adımları (Thales) |

**Fenikeliler** denizci bir halktı ve bugünkü **alfabenin** atası olan ses işaretli alfabeyi geliştirdiler.

## 6. Yunan ve Roma

**Yunan uygarlığı**, Ege’de ve Anadolu kıyılarında **site (polis) devletleri** halinde yaşamıştır. Bu devletler küçük, bağımsız ve kendi yasalarına sahipti.

- **Atina:** Demokrasi ve bilim, felsefe ve sanat öne çıkmıştır.
- **Sparta:** Askerî disiplini ve güçlü ordusuyla bilinir.
- **Olimpiyat oyunları**, Zeus onuruna düzenlenen oyunlar olarak ortak kültürün parçasıydı.
- **Makedonya Kralı Büyük İskender**, MÖ 4. yüzyılda Anadolu, Mısır ve Orta Asya’ya kadar uzanan geniş bir imparatorluk kurmuş ve Doğu ile Batı kültürlerinin kaynaşmasını (**Helenizm**) sağlamıştır.

**Roma uygarlığı** İtalya’da bir şehir devleti olarak başladı. Önce krallıkla, sonra **cumhuriyetle**, sonra **imparatorlukla** yönetildi. **Roma hukuku** sonraki hukuk sistemlerine örnek oldu. 395’te Roma İmparatorluğu **Doğu ve Batı** olarak ikiye ayrıldı. Doğu Roma (Bizans) İstanbul’da yaşadı, Batı Roma 476’da yıkıldı.

**Persler** Anadolu ve Mezopotamya’yı kapsayan geniş bir imparatorluk kurmuştur. Eyaletleri **satraplık** adı verilen bölümlerle yönetmiş, Sard’dan Susa’ya uzanan **Kral Yolu** ile haberleşmeyi ve ticareti kolaylaştırmıştır.

:::neden-sonuc
- Tarım yapılmaya başlanıyor => Yerleşik hayat başlar, nüfus artar.
- Nil taşıp verimli toprak bırakıyor => Mısır’da tarım ve devlet gelişir.
- Ticaret gelişiyor => Para ve yazı ihtiyacı doğar.
- Lidyalılar para basıyor => Ticaret kolaylaşır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Çivi yazısı ile hiyeroglifi karıştırma.** Çivi yazısı Sümerlerin, hiyeroglif Mısırlıların yazısıdır. Bir de **Kadeş Antlaşması’nı Hititlerin Babil ile yaptığı sanma**: Antlaşma Hititler ile Mısır arasındadır. **Parayı Lidyalıların** ilk kullandığını unutma. Kral Yolu ise Pers İmparatorluğu’nun yoludur.
:::

:::baglanti
Bu konu, “Tarih ve Zaman” konusundaki çağ bölümlemesinin İlk Çağ kısmını doldurur. “Orta Çağ’da Dünya” konusu Roma’nın bölünmesiyle başlar. Coğrafyada “Doğa ve İnsan” konusundaki nehir kıyısı yerleşimleri (Mezopotamya, Mısır) bu uygarlıkların nedenini açıklar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Neolitik | Tarım, yerleşik hayat |
| Göbeklitepe | Anıtsal tapınak, Şanlıurfa |
| Çatalhöyük | Konya, Neolitik yerleşim |
| Sümer | Çivi yazısı, tekerlek |
| Babil | Hammurabi Kanunları |
| Mısır | Hiyeroglif, piramit, mumya |
| Hitit | Kadeş Antlaşması, Hattuşa |
| Lidya | Para |
| Fenike | Alfabe |

## Mini test

:::soru{cevap="B"}
İnsanların avcılık ve toplayıcılıktan çıkıp tarım yapmaya, hayvanları evcilleştirmeye ve bir yere yerleşmeye başladığı, böylece artı ürün elde edilen çağ aşağıdakilerden hangisidir?

- A) Paleolitik
- B) Neolitik
- C) Mezolitik
- D) Kalkolitik
- E) Demir Çağı

---

1. Tarıma geçiş, hayvanların evcilleştirilmesi ve yerleşik hayat Neolitik (Yeni Taş) Çağı'nın özelliğidir.
2. Doğru cevap B.

Diğer şıklar: **Paleolitik** Paleolitik’te insan avcı toplayıcı göçebedir / **Mezolitik** Mezolitik geçiş dönemidir, tarım henüz yaygın değildir / **Kalkolitik** Kalkolitik’in ayırıcı özelliği bakırın işlenmesidir / **Demir Çağı** Demir Çağı’nın ayırıcı özelliği demirin kullanılmasıdır.
:::

:::soru{cevap="E"}
Bir tarihçi bilinen ilk yazılı antlaşmalardan birinin Hititler ile Mısırlılar arasında yapıldığını belirtiyor. Bu antlaşma aşağıdakilerden hangisidir?

- A) Hammurabi Kanunları
- B) Kral Yolu Anlaşması
- C) Roma Hukuku
- D) Atina Anayasası
- E) Kadeş Antlaşması

---

1. Hititler ile Mısır arasında yapılan antlaşma Kadeş Antlaşması'dır.
2. Hammurabi Kanunları Babil'e aittir. Doğru cevap E.

Diğer şıklar: **Hammurabi Kanunları** Hammurabi Kanunları Babil’in yasa metnidir / **Kral Yolu Anlaşması** Kral Yolu bir ticaret yoludur, antlaşma değildir / **Roma Hukuku** Roma hukuku bir hukuk sistemidir / **Atina Anayasası** Atina yönetim yapısı Yunan site devletiyle ilgilidir.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Lidyalılar için **söylenemez**?

- A) Parayı ticarette ilk kullananlardandır.
- B) Başkentleri Sard’dır.
- C) Ticaretle zenginleşmişlerdir.
- D) Batı Anadolu’da yaşamışlardır.
- E) Çivi yazısını bulmuşlardır.

---

1. Çivi yazısını bulan Sümerlerdir, Lidyalılar değil.
2. Diğer seçenekler Lidyalıların özellikleridir. Doğru cevap E.

Diğer şıklar: **Parayı ticarette ilk kullananlardandır.** Lidyalılar parayı ilk kullananlardandır / **Başkentleri Sard’dır.** Lidyalıların başkenti Sard’dır / **Ticaretle zenginleşmişlerdir.** Lidyalılar ticaretle zenginleşmiştir / **Batı Anadolu’da yaşamışlardır.** Lidyalılar Batı Anadolu’da yaşamıştır.
:::

:::soru{cevap="C"}
Roma İmparatorluğu hangi yıl Doğu ve Batı olmak üzere ikiye ayrılmıştır?

- A) 330
- B) 394
- C) 395
- D) 476
- E) 1453

---

1. Roma İmparatorluğu 395 yılında ikiye bölünmüştür.
2. 476 Batı Roma'nın yıkılışı, 1453 İstanbul'un fethidir. Doğru cevap C.

Diğer şıklar: **330** İstanbul’un başkent yapıldığı yıl alınmış / **394** işlem hatasıyla bir eksik bulunmuş / **476** Batı Roma’nın yıkıldığı yıl alınmış / **1453** İstanbul’un fethedildiği yıl alınmış.
:::

## Kendini dene

:::dene
1. Tarıma geçiş hangi çağda olmuştur? => Neolitik.
2. Çivi yazısını hangi uygarlık bulmuştur? => Sümerler.
3. Parayı ilk kullanan Anadolu uygarlığı hangisidir? => Lidyalılar.
4. Hititlerin başkenti neresidir? => Hattuşa.
5. Roma İmparatorluğu hangi yılda ikiye bölünmüştür? => 395.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tar' and name = 'İnsanlığın İlk Dönemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Tarih öncesi çağlar, Anadolu'daki ilk yerleşimler, Mezopotamya, Mısır, Anadolu uygarlıkları, Yunan ve Roma. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Göbeklitepe tarihi (MÖ 10. bin yıl) yaklaşık değerdir.
Kontrol edilecekler: Kral Yolu'nun hangi uygarlığa atfedildiği ders kitaplarında farklı sunulabilir, bu metinde Pers yolu olarak yazıldı. Mezolitikte köpeğin evcilleştirilmesi bilgisi kaynağa göre değişir. Büyük İskender'in imparatorluk sınırları sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'İnsanlığın İlk Dönemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Batı Roma yıkılınca Avrupa’da merkezî yönetim çöktü. Toprağı olan güçlü beyler ortaya çıktı, köylüler onlara bağlandı, kilise hem dinî hem siyasî bir güce dönüştü. Doğuda ise Bizans yaşamaya devam etti. Avrupa’nın bu dönemi çoğu zaman “karanlık” diye anılsa da Orta Çağ sonunda Haçlı Seferleri, ticaretin canlanması ve şehirlerin gelişmesiyle yeni bir çağın zemini hazırlandı. Bu konuda **Orta Çağ’ın başlangıcını**, **feodal düzeni**, kilisenin rolünü, **Bizans’ı**, **Haçlı Seferleri’ni** ve Yeni Çağ’a geçişi hazırlayan gelişmeleri öğreneceksin.

:::hedefler
1. Orta Çağ’ın başlangıç ve bitişini belirleyen olayları söylemek.
2. Feodal düzenin sosyal yapısını ve kilisenin rolünü açıklamak.
3. Bizans İmparatorluğu’nun özelliklerini ve Hristiyanlığın bölünmesini anlatmak.
4. Haçlı Seferleri’nin nedenlerini ve sonuçlarını sıralamak.
5. Orta Çağ’dan Yeni Çağ’a geçişi hazırlayan gelişmeleri sıralamak.
:::

## 1. Orta Çağ’ın başlangıcı

Orta Çağ, **476’da Batı Roma İmparatorluğu’nun yıkılmasıyla** başlar. Yıkılışta etkili olan gelişmeler şunlardır:

- **Kavimler Göçü (375):** Hunların batıya ilerlemesi diğer kavimleri (Gotlar, Vandallar, Franklar) Roma topraklarına itti. Göçler Roma’nın dengesini bozdu.
- Roma’daki ekonomik sıkıntı, vergilerin artması, ordunun zayıflaması ve iç karışıklıklar.
- 395’te Roma’nın ikiye bölünmesi.

Batı Roma yıkıldıktan sonra Batı Avrupa’da çeşitli **Germen krallıkları** kuruldu. Bunlardan **Franklar** güçlendi. Frank Kralı **Şarlman** (Charlemagne) 800’de papa tarafından “Roma imparatoru” ilan edildi. Doğu Roma (**Bizans**) ise İstanbul’da yaşamaya devam etti.

## 2. Feodal düzen

Merkezî devlet zayıflayınca **feodalite (derebeylik)** düzeni ortaya çıktı.

- **Kral** nominal olarak en yüksektir ama gücü sınırlıdır.
- **Senyör (derebey):** Toprakların sahibidir. Kendi şatosunda yaşar, kendi ordusu ve mahkemesi vardır.
- **Şövalye:** Senyörün askerî hizmetindeki soylu savaşçıdır.
- **Serf (köylü):** Toprakla birlikte alınıp satılır. Senyörün toprağında çalışır, ürünün bir kısmını verir, toprağı terk edemez.

Feodal düzende **toprak** zenginliğin ve gücün kaynağıdır. Şehirler küçük, ticaret zayıftır. Ekonomi kapalı, tarıma dayalıdır. **Yönetim parçalıdır**, merkezî otorite yoktur.

## 3. Kilise ve Hristiyanlık

**Katolik kilisesi**, Orta Çağ Avrupa’sının en güçlü kurumuydu. **Papa**, Hristiyan dünyanın dinî lideri olmakla birlikte krallar üzerinde de nüfuz kurardı. Kilise:

- Okul ve manastırlar aracılığıyla **eğitimi** elinde tuttu. Eğitim dili Latince idi.
- Büyük topraklara sahipti, vergi (**ondalık**) alıyordu.
- Bir kişiyi kiliseden **aforoz** ederek toplumdan dışlayabiliyordu.
- Günah bağışı belgeleri (**endüljans**) sattı. Bu uygulama sonradan eleştirilecektir.

**Hristiyanlık 1054’te** **Katolik** (Batı, Roma) ve **Ortodoks** (Doğu, İstanbul) olarak ayrıldı.

## 4. Bizans İmparatorluğu

**Doğu Roma (Bizans)**, **İstanbul**’da yaşayan bir imparatorluktu. Yönetim merkezî ve güçlüydü, imparator hem devlet hem kilisenin başı gibiydi.

- Dili Yunanca, dini Ortodoks Hristiyanlıktı.
- **Ayasofya**, en önemli yapısıdır.
- **I. Justinianus** döneminde (6. yüzyıl) hukuk derlendi (Corpus Juris Civilis), imparatorluk en geniş sınırlarına yaklaştı.
- Doğuda İslam devletleriyle, Anadolu’da Türklerle mücadele etti.
- **1453’te İstanbul’un Osmanlılar tarafından fethiyle** yıkıldı.

## 5. Haçlı Seferleri

**Haçlı Seferleri** (1096’dan 1291’e), Avrupalı Hristiyanların **Kudüs** ve Kutsal Topraklar’ı Müslümanlardan almak amacıyla düzenlediği seferlerdir. Papa II. Urban 1095’te Clermont’ta sefer çağrısı yaptı. I. Haçlı ordusu 1099’da Kudüs’ü ele geçirdi.

**Nedenler:**

- Dinî: Kudüs’ün kutsallığı, Papa’nın etki alanını genişletmek istemesi.
- Siyasî: Selçuklu ilerleyişi karşısında Bizans’ın yardım istemesi.
- Ekonomik: Doğu ticaret yollarını ele geçirmek, yeni topraklar ve zenginlik.
- Sosyal: Serflerin ve küçük şövalyelerin yeni imkân arayışı.

**Sonuçlar:**

- Kutsal Topraklar tam olarak ele geçirilemedi, Müslümanlar kazandı.
- Avrupa, Doğu’nun bilimini, ticaretini ve ürünlerini tanıdı. **Ticaret ve şehirler** gelişti.
- **Feodalite zayıfladı**, bir kısım senyör ve şövalye seferlerde yok oldu ya da malını sattı. Krallar güçlendi.
- Kilisenin ve Papa’nın itibarı sarsıldı.
- İtalyan şehirleri (Venedik, Cenova) Akdeniz ticaretinde zenginleşti.
- Avrupa’da **Rönesans** ve **Coğrafi Keşiflere** giden yolu açan gelişmelerden biri oldu.

## 6. Yeni Çağ’a doğru

Orta Çağ’ın sonlarında Avrupa’da büyük değişimler yaşandı:

- **Rönesans (yeniden doğuş):** İtalya’da başladı, 14 ve 15. yüzyıllarda sanat, bilim ve edebiyatta antik Yunan ve Roma’ya dönüş, **insan merkezli düşünce**. Leonardo da Vinci, Michelangelo.
- **Matbaanın** bulunması (Gutenberg, yaklaşık 1450): Bilgi hızla yayıldı.
- **Coğrafi Keşifler:** Kristof Kolomb 1492’de Amerika’ya, Vasco da Gama 1498’de Ümit Burnu yoluyla Hindistan’a ulaştı. Ticaret yolları değişti.
- **Reform:** Martin Luther 1517’de 95 tezini yayımladı, Katolik kilisesine itiraz etti ve **Protestanlık** doğdu.
- **İstanbul’un fethi (1453):** Orta Çağ’ın bitişi.

:::neden-sonuc
- Merkezî devlet zayıflıyor => Feodal düzen ortaya çıkar.
- Haçlılar Doğu ile temas kuruyor => Ticaret ve şehirler gelişir.
- Senyörler seferlerde güç kaybediyor => Krallar güçlenir.
- Matbaa bulunuyor => Bilgi hızla yayılır, Reform ve Rönesans desteklenir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Haçlı Seferleri’ni Avrupa’nın kazandığını sanma.** Kutsal Topraklar’ı sonunda Müslümanlar elinde tuttu, Avrupa asıl kazanımını **ticaret ve kültürde** elde etti. Bir de **Katolik ve Ortodoks ayrılığını Reform ile karıştırma**: 1054 ayrılığı Roma ile İstanbul arasındadır, Reform ise 1517’de Katolik kilisesi içinde başlayan Protestan hareketidir.
:::

:::baglanti
Bu konu, “İnsanlığın İlk Dönemleri” konusunda gördüğün Roma’nın bölünmesinden başlar. “İlk ve Orta Çağlarda Türk Dünyası” konusundaki Hunlar, Kavimler Göçü’nün başlatıcısıdır. “İlk Türk İslam Devletleri” ve “Selçuklu Türkiyesi” konularındaki gelişmeler Haçlı Seferleri’nin nedenlerini oluşturur. “Dünya Gücü Osmanlı” ve “Değişim Çağında Avrupa ve Osmanlı” konularında Coğrafi Keşifler ve Reform yeniden karşına çıkacak.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Orta Çağ başlangıcı | 476, Batı Roma’nın yıkılışı |
| Kavimler Göçü | 375, Hunlar |
| Feodalite | Derebey, şövalye, serf |
| Büyük ayrılık | 1054, Katolik ve Ortodoks |
| Bizans | İstanbul, Ortodoks, 1453’te yıkıldı |
| Haçlı Seferleri | 1096 ile 1291, Kudüs |
| Haçlıların sonucu | Ticaret ve şehir gelişti, feodalite zayıfladı |
| Reform | 1517, Martin Luther |

## Mini test

:::soru{cevap="C"}
Orta Çağ Avrupa’sında toprağın sahibi olan, kendi şatosunda yaşayan ve kendi ordusu bulunan soylu sınıf aşağıdakilerden hangisidir?

- A) Serf
- B) Papa
- C) Senyör (derebey)
- D) Tüccar
- E) Şövalye

---

1. Feodal düzende toprak sahibi ve yerel otorite senyördür (derebey).
2. Serf toprağı işler, şövalye senyöre askerî hizmet verir. Doğru cevap C.

Diğer şıklar: **Serf** serf toprağı işleyen köylüdür / **Papa** papa kilisenin dinî lideridir / **Tüccar** tüccar ticaretle uğraşır, toprak sahibi sınıf değildir / **Şövalye** şövalye senyörün askerî hizmetindeki savaşçıdır.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi Haçlı Seferleri’nin Avrupa’da ortaya çıkardığı sonuçlardan biri **değildir**?

- A) Ticaretin gelişmesi
- B) Feodal beylerin güçlenmesi
- C) Şehirlerin büyümesi
- D) Kral gücünün artması
- E) Papa’nın etkisinin azalması

---

1. Seferlerde senyörlerin çoğu mal ve can kaybetti, feodalite zayıfladı.
2. Bu yüzden feodal beylerin güçlenmesi bir sonuç değildir. Doğru cevap B.

Diğer şıklar: **Ticaretin gelişmesi** Doğu ile temas ticareti canlandırmıştır / **Şehirlerin büyümesi** ticaret şehirleri büyütmüştür / **Kral gücünün artması** senyörler zayıflayınca krallar güçlenmiştir / **Papa’nın etkisinin azalması** seferlerin başarısızlığı kilise itibarını sarsmıştır.
:::

:::soru{cevap="A"}
Kristof Kolomb, Amerika kıtasına 1492 yılında ulaşmıştır. Aşağıdaki olaylardan hangisi bu tarihten sonra gerçekleşmiştir?

- A) Martin Luther’in 95 tezini yayımlaması
- B) İstanbul’un fethi
- C) Batı Roma’nın yıkılışı
- D) I. Haçlı Seferi’nin Kudüs’ü alması
- E) Şarlman’ın imparator ilan edilmesi

---

1. Martin Luther 1517'de 95 tezini yayımladı, bu tarih 1492'den sonradır.
2. Diğer olaylar 1492'den önce gerçekleşmiştir. Doğru cevap A.

Diğer şıklar: **İstanbul’un fethi** İstanbul 1453’te fethedildi, Kolomb’dan önce / **Batı Roma’nın yıkılışı** Batı Roma 476’da yıkıldı / **I. Haçlı Seferi’nin Kudüs’ü alması** bu olay 1099’da, Kolomb’dan çok önce / **Şarlman’ın imparator ilan edilmesi** Şarlman 800’de imparator ilan edildi.
:::

:::soru{cevap="B"}
Hunların batıya ilerlemesiyle başlayan ve Roma’nın dengesini bozan Kavimler Göçü hangi yılda başlamıştır?

- A) 330
- B) 375
- C) 376
- D) 395
- E) 476

---

1. Hunların Avrupa'ya ilerlemesiyle Kavimler Göçü 375'te başlamıştır.
2. 395 Roma'nın ikiye bölünmesi, 476 Batı Roma'nın yıkılışıdır. Doğru cevap B.

Diğer şıklar: **330** İstanbul’un başkent yapıldığı yıl alınmış / **376** işlem hatasıyla bir fazla bulunmuş / **395** Roma’nın ikiye bölündüğü yıl alınmış / **476** Batı Roma’nın yıkıldığı yıl alınmış.
:::

## Kendini dene

:::dene
1. Orta Çağ hangi olayla başlar? => Batı Roma’nın yıkılışı (476).
2. Feodal düzende toprağı işleyen sınıf hangisidir? => Serfler.
3. Hristiyanlık 1054’te hangi iki kola ayrıldı? => Katolik ve Ortodoks.
4. Haçlı Seferleri’nin Avrupa’ya en önemli sonucu nedir? => Ticaret ve şehirlerin gelişmesi, feodalitenin zayıflaması.
5. Martin Luther 1517’de ne yapmıştır? => 95 tezini yayımlamış, Reform’u başlatmıştır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tar' and name = 'Orta Çağ''da Dünya'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Orta Çağ'ın başlangıcı, Kavimler Göçü, feodalite, kilise, Bizans, 1054 ayrılığı, Haçlı Seferleri, Rönesans, matbaa, Coğrafi Keşifler, Reform. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (375, 395, 476, 800, 1054, 1095, 1099, 1291, 1453, 1492, 1498, 1517) genel kabul görmüş bilgilerdir.
Kontrol edilecekler: Gutenberg tarihi yaklaşıktır. Konu başlığı İslam dünyasını ayrı konuya bıraktığı için bu metinde İslam tarihi yoktur. Hristiyanlığın bölünmesi (1054) kısaca verildi.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Orta Çağ''da Dünya'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Türkler, tarihin en eski ve en geniş coğrafyaya yayılmış topluluklarından biridir. Anayurtları Orta Asya’dır. Hunlardan Göktürklere, Uygurlardan Karahanlılara kadar uzanan bir devlet geleneği oluşmuştur. Bu konuda **Türk adının anlamını**, Orta Asya’daki ilk Türk devletlerini, **Orhun Yazıtları**’nı, Türklerin **devlet yapısını ve kültürünü** ve Avrupa’ya ulaşan kolları öğreneceksin.

:::hedefler
1. Türk adının anlamını, Türklerin ilk yurdunu ve yaşam biçimini açıklamak.
2. Asya Hun, Göktürk ve Uygur devletlerinin özelliklerini ayırt etmek.
3. Orhun Yazıtları’nın önemini söylemek.
4. Türklerin devlet yapısını ve ordu sistemini örneklerle anlatmak.
5. Avrupa’da ve Anadolu yönünde görülen Türk boylarını sıralamak.
:::

## 1. Türklerin ilk yurdu ve yaşamı

Türklerin anayurdu **Orta Asya**’dır (Altay Dağları ve Tanrı Dağları çevresi). İklim değişimi, nüfus artışı ve otlak sıkıntısı Türkleri başka bölgelere göçe zorlamıştır.

- **Türk** sözcüğü Göktürk yazıtlarında “güçlü, kuvvetli” anlamında geçer. Siyasi bir ad olarak Göktürklerle birlikte öne çıkmıştır.
- Ekonomi **hayvancılığa** dayanır. At, Türk yaşamının merkezindedir. At üzerinde **savaşçı ve göçebe** bir yaşam sürmüşlerdir.
- Kışın sıcak yerlere, yazın yaylaya göç etmişlerdir. Çadır (yurt, otağ) kullanmışlardır.
- İnanç olarak **Gök Tanrı** ve **Şamanizm**. Atalara saygı gösterilir, ölen kişi eşyaları ile gömülür (**kurgan**).

## 2. Asya Hunları

Bilinen **ilk Türk devleti** Asya Hun Devleti’dir (Büyük Hun, MÖ 3. yüzyıl).

- **Teoman** devletin kurucusu kabul edilir. Oğlu **Mete (Mete Han)** MÖ 209’da tahta çıkmış ve devleti güçlendirmiştir.
- Mete **onlu sisteme** dayalı ordu kurmuştur. Ordu on, yüz, bin, on bin kişilik birimlere ayrılır. Bu sistem sonraki Türk devletlerinde de görülür.
- Çin’i vergiye bağlamıştır. Çin, Hun akınlarından korunmak için **Çin Seddi**’ni güçlendirmiştir.
- Mete’den sonra Hunlar ikiye ayrılmıştır (Kuzey Hun ve Güney Hun).
- Batıya göç eden Hunlar Avrupa’ya ulaşıp **Avrupa Hun Devleti**’ni kurmuştur. **Attila** döneminde en güçlü dönemini yaşamıştır. Bu göç **Kavimler Göçü’nü** (375) tetiklemiştir.

## 3. Göktürkler

- **Bumin Kağan** (552) Göktürk Devleti’ni kurmuştur. Kardeşi **İstemi** batıyı yönetmiştir.
- **Türk adını siyasi anlamda** ilk kullanan devlettir.
- Devlet ikiye ayrılmış, sonra tekrar birleşmiştir. **II. Göktürk (Kutluk) Devleti**, **Kapgan Kağan** ve **Bilge Kağan** dönemlerinde güçlenmiştir. Bilge Kağan’ın veziri **Tonyukuk** ve kardeşi **Kül Tigin** önemlidir.
- **Orhun (Göktürk) Yazıtları:** Kül Tigin (732), Bilge Kağan (735) ve Tonyukuk yazıtlarıdır. **Türkçe yazılmış ilk yazılı belgeler** kabul edilir. Orhun Nehri kıyısında bulunmuştur. Türklerin tarihi, töresi, devlete bağlılığı anlatılır. Yazıtları **Danimarkalı Vilhelm Thomsen** 1893’te çözmüştür.
- Göktürk alfabesi (Orhun alfabesi) kullanılmıştır.

## 4. Uygurlar

- **744’te** Orhun Nehri çevresinde **Kutluk Bilge Kül Kağan** ile kurulmuştur. Başkenti **Ordubalık** (Karabalgasun)’tır.
- **Yerleşik hayata** geçen ilk Türk topluluğudur. Tarım, ticaret ve el sanatları gelişmiştir.
- Maniheizm, Budizm gibi dinleri kabul etmişlerdir. Bu yüzden Türk **göçebe savaşçı** yapısı zayıflamıştır.
- Kendi alfabelerini (**Uygur alfabesi**) kullanmışlardır. Bu alfabe sonraki Türk devletlerince de kullanılmıştır.
- **Kırgızlar** devletlerine son vermiştir (840).

## 5. Türklerin kültürü ve devlet yapısı

**Devlet anlayışı:**

- Hükümdar yetkisini **Tanrı’dan** (**kut**) aldığına inanır. **Kağan** (han, hakan) devletin başıdır.
- Devlet bütün hanedan üyelerinin ortak malı sayılmıştır. Bu yüzden **veraset** sorunları yaşanmış ve devletler parçalanmıştır.
- **Kurultay (Toy):** Hükümdar seçimi, savaş ve barış kararları görüşülen toplantıdır.
- **Töre:** Yazısız kanunlar topluluğudur. Devlet yönetimi töreye göre yapılır.
- Hükümdar ve devlet adamlarının bütün ülkeye, yani **cihan hâkimiyeti** (dünyaya hükmetme) anlayışı vardır.

**Ordu:** **Onlu sisteme** dayanır. Her Türk **asker** sayılırdı. Çok iyi at binicisi ve okçuydular. Hareketli savaş taktikleri kullanılmıştır.

**Sosyal yapı:** **Aile** temeldir. Kadının statüsü yüksektir. Hükümdarın eşi (hatun) devlet işlerine katılır. **Boy** ve **oymak** olarak örgütlüdürler.

**Sanat ve bilim:** Kaya resimleri, kurganlar, taş yazıtlar, destanlar (**Oğuz Kağan, Alp Er Tunga, Ergenekon, Bozkurt**) ve **sözlü edebiyat** geleneği. **Kopuz** müzik aracıdır.

## 6. Diğer Türk toplulukları

- **Avarlar:** Orta Avrupa’ya (Macaristan çevresi) ulaşan Türk boyu.
- **Hazarlar:** Karadeniz’in kuzeyinde, Volga çevresinde kurulmuştur. Yöneticileri Musevi dinini kabul etmiştir. Ticaret önemlidir.
- **Bulgarlar:** Balkanlar’a yerleşmişler, Slavlarla karışmışlardır.
- **Peçenekler, Kıpçaklar (Kumanlar), Oğuzlar:** Karadeniz’in kuzeyinde ve Anadolu yönünde görülen boylardır. Oğuzlar **Selçuklu** ve **Osmanlı** devletlerini kuran boy olmuştur.
- **Karluklar:** Orta Asya’da yaşayan ve sonradan Karahanlıları kuran boydur.

:::neden-sonuc
- Otlak ve iklim sorunları artıyor => Türkler başka bölgelere göç eder.
- Uygurlar yerleşik hayata geçiyor => Savaşçı yapı zayıflar, Kırgızlara yenilirler.
- Hanedan üyeleri ortak yönetime hak iddia ediyor => Devletler parçalanır.
- Hunlar Avrupa’ya ilerliyor => Kavimler Göçü başlar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Göktürk yazıtlarını Uygur dönemine bağlama.** Orhun Yazıtları Göktürklere aittir. **Uygurlar yerleşik, Göktürkler göçebe** idi. Bir de **Çin Seddi’ni Türklerin yaptığını sanma**: Çinliler, Hun akınlarından korunmak için güçlendirmiştir. **Mete’yi Teoman ile karıştırma**: Teoman babadır, Mete oğludur ve MÖ 209’da tahta çıkmıştır.
:::

:::baglanti
Bu konu, “Orta Çağ’da Dünya” konusundaki Kavimler Göçü’nün (Hun baskısı) nedenini gösterir. “İlk Türk İslam Devletleri” ve “Selçuklu Türkiyesi” konularında bu geleneğin (onlu sistem, kurultay, töre) İslam sonrası nasıl devam ettiği görülür. “İslam Medeniyetinin Doğuşu” ile Türklerin İslam’la tanışması bu konuların köprüsüdür. Edebiyatta “Orhun Yazıtları” İslamiyet öncesi Türk edebiyatının ilk örneğidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İlk Türk devleti | Asya Hun, MÖ 3. yüzyıl |
| Mete | MÖ 209, onlu ordu sistemi |
| Göktürk | 552, Bumin, Orhun Yazıtları |
| Orhun Yazıtları | 732 ve 735, ilk yazılı Türkçe belge |
| Uygur | 744, yerleşik hayat, Uygur alfabesi |
| Kut | Egemenliğin Tanrı’dan gelmesi |
| Kurultay | Danışma toplantısı |
| Töre | Yazısız kanun |

## Mini test

:::soru{cevap="D"}
Mete Han döneminde Asya Hun Devleti’nde ordu on, yüz, bin ve on bin kişilik birimlere ayrılmış ve komutanlar bu birimlere göre görevlendirilmiştir. Bu uygulama aşağıdakilerden hangisinin göstergesidir?

- A) Yerleşik hayata geçişin
- B) Cihan hâkimiyeti anlayışının yokluğunun
- C) Hanedanın bölünmesinin
- D) Onlu sisteme dayalı düzenli ordu anlayışının
- E) Dinî otoritenin güçlenmesinin

---

1. Ordunun on, yüz, bin ve on bin kişilik birimlere ayrılması onlu sistemdir.
2. Bu, düzenli bir ordu anlayışını gösterir. Doğru cevap D.

Diğer şıklar: **Yerleşik hayata geçişin** ordu düzeni göçebe savaşçı yapıya aittir / **Cihan hâkimiyeti anlayışının yokluğunun** ordu düzeni cihan hâkimiyeti anlayışına aykırı değildir / **Hanedanın bölünmesinin** ordu bölümleri hanedanın bölünmesi değildir / **Dinî otoritenin güçlenmesinin** ordu düzeni dinî otoriteyle ilgili değildir.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi Uygurlar için **söylenemez**?

- A) Göçebe savaşçı yaşamlarını sürdürmüşlerdir.
- B) Yerleşik hayata geçen ilk Türk devletlerindendir.
- C) Kendi alfabelerini kullanmışlardır.
- D) Başkentleri Ordubalık’tır.
- E) Maniheizm ve Budizm’i kabul etmişlerdir.

---

1. Uygurlar yerleşik hayata geçmiştir, bu yüzden göçebe savaşçı yaşamlarını sürdürmediler.
2. Diğer seçenekler Uygurlar için doğrudur. Doğru cevap A.

Diğer şıklar: **Yerleşik hayata geçen ilk Türk devletlerindendir.** Uygurlar yerleşik hayata geçmiştir / **Kendi alfabelerini kullanmışlardır.** Uygur alfabesi kullanılmıştır / **Başkentleri Ordubalık’tır.** başkent Ordubalık’tır / **Maniheizm ve Budizm’i kabul etmişlerdir.** bu dinleri benimsemişlerdir.
:::

:::soru{cevap="E"}
Türkçe yazılmış ilk yazılı belgeler olarak kabul edilen ve Orhun Nehri kıyısında bulunan yazıtlar hangi devletin yöneticilerine aittir?

- A) Asya Hun Devleti
- B) Uygur Devleti
- C) Karahanlı Devleti
- D) Avar Devleti
- E) Göktürk Devleti

---

1. Orhun Yazıtları Bilge Kağan, Kül Tigin ve Tonyukuk adına dikilen Göktürk yazıtlarıdır.
2. Doğru cevap E.

Diğer şıklar: **Asya Hun Devleti** Hunlardan yazılı belge kalmamıştır / **Uygur Devleti** Orhun Yazıtları Uygurlara ait değildir / **Karahanlı Devleti** Karahanlılar İslamiyet sonrasıdır / **Avar Devleti** Avarlar Avrupa’ya göç eden bir boydur.
:::

:::soru{cevap="A"}
Göktürk Devleti’nin kurucusu Bumin Kağan hangi yılda devleti kurmuştur?

- A) 552
- B) 553
- C) 732
- D) 735
- E) 744

---

1. Göktürk Devleti 552'de Bumin Kağan tarafından kurulmuştur.
2. 744 Uygurların, 732 ve 735 ise yazıtların yılıdır. Doğru cevap A.

Diğer şıklar: **553** işlem hatasıyla bir fazla bulunmuş / **732** Kül Tigin Yazıtı’nın dikildiği yıl alınmış / **735** Bilge Kağan Yazıtı’nın dikildiği yıl alınmış / **744** Uygur Devleti’nin kuruluş yılı alınmış.
:::

## Kendini dene

:::dene
1. Bilinen ilk Türk devleti hangisidir? => Asya Hun Devleti.
2. Orhun Yazıtları hangi devlete aittir? => Göktürkler.
3. Yerleşik hayata geçen ilk Türk devleti hangisidir? => Uygurlar.
4. Onlu ordu sistemini kuran hükümdar kimdir? => Mete.
5. Türklerde hükümdarın yetkiyi Tanrı’dan aldığı inancına ne denir? => Kut.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tar' and name = 'İlk ve Orta Çağlarda Türk Dünyası'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Türklerin ilk yurdu ve yaşamı, Asya Hun, Avrupa Hun, Göktürk, Uygur, Orhun Yazıtları, devlet yapısı ve kültür, diğer Türk toplulukları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (MÖ 209, 552, 732, 735, 744, 840, 1893) ders kitaplarında kullanılan değerlerdir.
Kontrol edilecekler: Türk adının anlamı ve ilk geçtiği yer kaynağa göre farklı anlatılır. Asya Hun kuruluşu için MÖ 3. yüzyıl yaklaşık yazıldı. Hazarların Musevi dinini benimsemesi bilgisi ders kitabına göre teyit edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'İlk ve Orta Çağlarda Türk Dünyası'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

7. yüzyılın başında Arabistan yarımadasında küçük kabilelerden oluşan, ticaretle ve hayvancılıkla geçinen bir toplum yaşıyordu. Yüz yıldan az bir sürede bu toplum, Atlantik kıyılarından Orta Asya’ya uzanan bir imparatorluk kurdu. Tarihin en büyük kültür ve bilim hareketlerinden biri olan **İslam medeniyeti** doğdu. Bu konuda **İslam öncesi Arabistan’ı**, Hz. Muhammed dönemini, **dört halife dönemini**, **Emevi ve Abbasi** devletlerini ile İslam dünyasında bilim ve kültürün gelişimini öğreneceksin.

:::hedefler
1. İslam öncesi Arap toplumunun siyasi, sosyal ve ekonomik yapısını açıklamak.
2. Hz. Muhammed dönemindeki önemli olayları sıraya koymak.
3. Dört halife dönemini ve fetihleri özetlemek.
4. Emevi ve Abbasi devletlerinin özelliklerini karşılaştırmak.
5. İslam dünyasında bilimin gelişmesinin nedenlerini ve önemli bilginleri sayabilmek.
:::

## 1. İslam öncesi Arabistan

Arabistan yarımadasında kabileler halinde yaşanıyordu. **Bedeviler** göçebe, şehirlerde yaşayanlar ise tüccardı.

- **Mekke** ticaret ve dinî açıdan merkezdi. **Kâbe** burada bulunuyordu. **Medine, Taif** önemli şehirlerdi.
- **Ukaz panayırı** gibi panayırlarda ticaret ve şiir yarışmaları yapılırdı.
- Kabilelerin başında **şeyh** bulunurdu. Merkezî devlet yoktu. Kabile asabiyeti (aşiret bağlılığı) güçlüydü.
- Dinî inanç olarak **putperestlik** yaygındı, bir kısım Hristiyan, Yahudi ve Hanif (tek Tanrı inancında) vardı.
- Kız çocuklarının, kadınların ve kölelerin hakları kısıtlıydı.

## 2. Hz. Muhammed dönemi

| Olay | Yıl | Açıklama |
| --- | --- | --- |
| Doğum | yaklaşık 570 | Mekke |
| İlk vahiy | 610 | Hira Mağarası, “Oku” emri |
| **Hicret** | **622** | Mekke’den Medine’ye. Hicri takvimin başlangıcı |
| Medine Vesikası | 622 sonrası | Müslüman, Yahudi ve diğer toplulukların haklarını güvence altına alan yazılı düzen |
| Bedir Savaşı | 624 | İlk büyük zafer |
| Uhud Savaşı | 625 | Müslümanlar kayıp verdi |
| Hendek Savaşı | 627 | Medine hendekle savunuldu |
| Hudeybiye Barışı | 628 | Mekkelilerle antlaşma |
| **Mekke’nin Fethi** | **630** | Kâbe putlardan temizlendi |
| Veda Hutbesi ve vefat | 632 | İnsan hakları ve eşitlik mesajı |

Hz. Muhammed Medine’de **dinî, siyasi ve askerî** bir yönetim kurdu. Kabile ayrımını kaldırıp **ümmet** (inanç birliği) anlayışını getirdi. Kadınlara ve kölelere hak ve saygınlık verdi, adalet ve eşitlik vurguladı.

## 3. Dört Halife dönemi (632 ile 661)

Hz. Muhammed’den sonra yönetime **halife** denildi.

- **Hz. Ebubekir (632 ile 634):** Mürtedlerle ve zekât vermeyenlerle mücadele etti. **Kur’an-ı Kerim** bir araya toplandı (mushaf).
- **Hz. Ömer (634 ile 644):** Fetihler genişledi. **Suriye, Kudüs, Mısır ve İran**’ın büyük kısmı alındı. Divan teşkilatı ve Hicri takvim bu dönemde düzenlendi.
- **Hz. Osman (644 ile 656):** Fetihler sürdü. Kur’an çoğaltılıp çeşitli bölgelere gönderildi. Dönemin sonunda iç karışıklıklar çıktı, Hz. Osman öldürüldü.
- **Hz. Ali (656 ile 661):** İç savaşlar (**Cemel, Sıffin**) yaşandı, Hariciler ortaya çıktı. Hz. Ali’nin vefatıyla dönem sona erdi. Muaviye iktidarı ele aldı.

Dört halife dönemi, yönetimde **şura** (danışma) anlayışının uygulandığı dönemdir.

## 4. Emeviler (661 ile 750)

- **Kurucu Muaviye**, başkent **Şam**. Yönetim **saltanata** (babadan oğula) döndü. Halifelik şura ile değil **veraset** ile geçti.
- Yönetimde Araplara ayrıcalık tanındı (**Arap milliyetçiliği**). Arap olmayan Müslümanlar vergi ve yönetimde eşit görülmedi. Bu da muhalefet doğurdu.
- Fetihler Kuzey Afrika ve **İspanya**’ya (711) ulaştı. **Tarık bin Ziyad** Cebelitarık Boğazı’nı geçti.
- **Poitiers (Puvatya) Savaşı (732):** Franklara karşı kaybedildi. İslam’ın Avrupa’da ilerleyişi durdu.
- Emevi yönetiminin sonunda Abbasi ve Şii muhalefeti güç kazandı.

## 5. Abbasiler (750 ile 1258)

- **Ebu’l-Abbas** (Seffah) Emevileri yıktı ve devleti kurdu. Başkent önce Küfe, sonra **Bağdat** oldu.
- Emevilerin Arap ayrıcalığı kaldırıldı. **Arap olmayan Müslümanlar** (özellikle İranlılar, sonra Türkler) yönetimde ve ordu içinde yer aldı.
- **Talas Savaşı (751):** Abbasi ordusu ile Çin Tang ordusu arasında yapıldı. Karluk Türklerinin Abbasi tarafına geçmesiyle Abbasiler kazandı. Bu savaşla **Türkler ile Müslümanlar yakınlaştı**, Türklerin İslam’la tanışması hızlandı.
- **Harun Reşid** ve **Me’mun** dönemleri en parlak devirdir. Bağdat’ta **Beytü’l-Hikme** (Hikmet Evi) kuruldu. Yunanca, Farsça, Sanskritçe eserler Arapçaya çevrildi.
- Zamanla Abbasi halifeleri Türk komutanlara bağımlı hale geldi, eyaletlerde bağımsız devletler kuruldu. **1258’de Hülagü** komutasındaki Moğollar Bağdat’ı yıktı.

## 6. İslam’da bilim ve kültür

İslam dünyasında bilimin gelişmesinde şu etkenler rol oynamıştır:

- Dinin **ilim öğrenmeyi teşvik etmesi.**
- Çeviri çalışmaları ve Beytü’l-Hikme gibi kurumlar.
- Başkentlerin zenginliği, **medreselerin** yaygınlaşması, **kâğıdın** kullanımı.
- Devlet adamlarının bilginleri desteklemesi.

| Bilgin | Alan |
| --- | --- |
| **El-Harezmî** | Matematik, cebir, algoritma |
| **İbn-i Sina** | Tıp (El-Kanun fi’t-Tıb), felsefe |
| **Farabi** | Felsefe, mantık (“İkinci Öğretmen”) |
| **Biruni** | Astronomi, coğrafya, tarih |
| **İbn-i Heysem** | Optik, gözlem ve deney |
| **Cabir bin Hayyan** | Kimya |
| **İbn-i Rüşd** | Felsefe, tıp |

**Mezhepler:** Fıkıh alanında **Hanefi** (Ebu Hanife), **Maliki**, **Şafii**, **Hanbeli**. İtikadî mezheplerden **Maturidilik ve Eş’arilik** Sünni kelamı oluşturdu.

:::neden-sonuc
- Abbasiler Arap olmayan Müslümanlara yönetimde yer veriyor => Türk ve İran etkisi artar.
- Talas Savaşı’nı Müslümanlar kazanıyor => Türk-İslam tanışması hızlanır.
- Beytü’l-Hikme’de çeviri yapılıyor => Bilim ve felsefe gelişir.
- Halifelik babadan oğula geçiyor => Şura anlayışı bırakılır, saltanat başlar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Hicret ile Mekke’nin fethini karıştırma.** Hicret 622’de Mekke’den Medine’ye gitmektir, Mekke’nin fethi 630’da Mekke’ye dönmektir. Bir de **Emevi başkentini Bağdat sanma**: Emevi başkenti Şam, Abbasi başkenti Bağdat’tır. **Talas Savaşı’nı Türk-Çin savaşı** sanma: Abbasiler ile Çinliler arasındadır, Karluklar Abbasi tarafında yer almıştır.
:::

:::baglanti
Bu konu, “Tarih ve Zaman” konusundaki Hicri takvimin başlangıcı olan hicreti açıklar. “İlk ve Orta Çağlarda Türk Dünyası” ile birlikte Talas Savaşı’ndan sonra Türklerin İslam’la tanışmasını anlamanı sağlar. “İlk Türk İslam Devletleri” konusu doğrudan buradan devam eder. “Orta Çağ’da Dünya” konusunda Haçlı Seferleri ile Müslüman devletlerin ilişkisini bu temel üzerine oturtursun. Din kültüründe “Bilgi ve İnanç” ve “Hz. Muhammed ve Gençlik” konuları da bu dönemle ilişkilidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Hicret | 622, Medine |
| Mekke’nin fethi | 630 |
| Dört halife | 632 ile 661, şura |
| Emeviler | Başkent Şam, saltanat |
| Abbasiler | Başkent Bağdat, Beytü’l-Hikme |
| Talas | 751, Abbasi zaferi |
| Poitiers | 732, Franklar |
| Bağdat’ın yıkılışı | 1258, Moğollar |

## Mini test

:::soru{cevap="B"}
Aşağıdaki olayların eskiden yeniye doğru sıralanışı hangisinde doğru verilmiştir?

- A) Mekke’nin fethi, hicret, Talas Savaşı, Bağdat’ın Moğollarca yıkılışı
- B) Hicret, Mekke’nin fethi, Talas Savaşı, Bağdat’ın Moğollarca yıkılışı
- C) Hicret, Talas Savaşı, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı
- D) Hicret, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı, Talas Savaşı
- E) Talas Savaşı, hicret, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı

---

1. Hicret 622, Mekke'nin fethi 630, Talas Savaşı 751, Bağdat'ın Moğollarca yıkılışı 1258'dir.
2. Doğru sıra B seçeneğindedir.

Diğer şıklar: **Mekke’nin fethi, hicret, Talas Savaşı, Bağdat’ın Moğollarca yıkılışı** hicret Mekke’nin fethinden önce gerçekleşti / **Hicret, Talas Savaşı, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı** Mekke’nin fethi Talas Savaşı’ndan önce / **Hicret, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı, Talas Savaşı** Talas Savaşı 751’de, Bağdat’ın yıkılışı 1258’de / **Talas Savaşı, hicret, Mekke’nin fethi, Bağdat’ın Moğollarca yıkılışı** Talas Savaşı hicretten sonra gerçekleşti.
:::

:::soru{cevap="A"}
Arap olmayan Müslümanların (İranlılar, sonra Türkler) ordu ve yönetimde yer aldığı, başkentin Bağdat olduğu ve bilim çalışmalarının Beytü’l-Hikme’de yürütüldüğü devlet aşağıdakilerden hangisidir?

- A) Abbasiler
- B) Emeviler
- C) Dört Halife dönemi
- D) Gazneliler
- E) Karahanlılar

---

1. Başkent Bağdat, Beytü'l-Hikme ve Arap olmayanların yönetimde yer alması Abbasilerin özellikleridir.
2. Doğru cevap A.

Diğer şıklar: **Emeviler** Emevilerin başkenti Şam’dı, Arap ayrıcalığı vardı / **Dört Halife dönemi** dört halife döneminde başkent Medine’ydi / **Gazneliler** Gazneliler Abbasilerden sonra kurulan bir Türk-İslam devletidir / **Karahanlılar** Karahanlıların başkenti Kâşgar ve Balasagun’dur.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Emevi Devleti için **söylenemez**?

- A) Başkent Şam’dır.
- B) İspanya’nın fethi bu dönemde olmuştur.
- C) Arap milliyetçiliği ağır basmıştır.
- D) Halifelik babadan oğula geçmiştir.
- E) Halifeler şura ile seçilmiştir.

---

1. Emeviler döneminde halifelik veraset yoluyla babadan oğula geçmiştir.
2. Şura ile seçim dört halife dönemine aittir. Doğru cevap E.

Diğer şıklar: **Başkent Şam’dır.** Emevi başkenti Şam’dır / **İspanya’nın fethi bu dönemde olmuştur.** 711’de İspanya fethedilmiştir / **Arap milliyetçiliği ağır basmıştır.** Arap ayrıcalığı bu dönemin özelliğidir / **Halifelik babadan oğula geçmiştir.** saltanat usulü uygulanmıştır.
:::

:::soru{cevap="E"}
Abbasi ordusu ile Çin Tang ordusu arasında yapılan ve Karluk Türklerinin Abbasi tarafına geçmesiyle sonuçlanan Talas Savaşı hangi yılda yapılmıştır?

- A) 375
- B) 711
- C) 732
- D) 750
- E) 751

---

1. Talas Savaşı 751 yılında yapılmıştır.
2. 732 Poitiers, 750 Abbasilerin kuruluşu, 711 İspanya'nın fethidir. Doğru cevap E.

Diğer şıklar: **375** işlem hatasıyla yarısı bulunmuş / **711** İspanya’nın fethi yılı alınmış / **732** Poitiers Savaşı’nın yılı alınmış / **750** Abbasi Devleti’nin kuruluş yılı alınmış.
:::

## Kendini dene

:::dene
1. Hicretin yapıldığı yıl hangisidir? => 622.
2. Kur’an-ı Kerim hangi halife döneminde bir araya toplanmıştır? => Hz. Ebubekir.
3. Emevi Devleti’nin başkenti neresidir? => Şam.
4. Abbasilerde bilim merkezi olan kurum nedir? => Beytü’l-Hikme.
5. Talas Savaşı’nın Türkler için önemi nedir? => Türklerin İslam’la tanışmasını hızlandırdı.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'İslam Medeniyetinin Doğuşu'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İslam öncesi Arabistan, Hz. Muhammed dönemi, dört halife, Emeviler, Abbasiler, İslam'da bilim ve kültür, mezhepler. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (570, 610, 622, 624, 625, 627, 628, 630, 632, 634, 644, 656, 661, 711, 732, 750, 751, 1258) genel kabul görmüş değerlerdir.
Kontrol edilecekler: Doğum yılı için 570 yaklaşık değerdir. Hz. Ömer döneminde Hicri takvimin ve divan teşkilatının düzenlenmesi ders kitabına göre teyit edilmeli. İtikadi mezheplerle ilgili bölüm "Din Kültürü" ile örtüşmeyecek şekilde kısaltıldı.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'İslam Medeniyetinin Doğuşu'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Talas Savaşı’ndan sonra Türkler İslam dinine hızla yaklaştı. 10. yüzyılda Türkler kitleler halinde Müslüman oldu ve Türk-İslam devletleri kuruldu. Bu devletler hem **İslam dünyasının koruyucusu** hem de **Türk kültürünün taşıyıcısı** oldu. Bu konuda **Karahanlıları**, **Gazneliler’i** ve **Büyük Selçuklu Devleti**’ni, **Malazgirt Savaşı**’nı ve bu dönemin kültür ve bilim eserlerini öğreneceksin.

:::hedefler
1. Türklerin İslam’la tanışmasını ve Müslüman olmalarını açıklamak.
2. Karahanlı, Gazneli ve Büyük Selçuklu devletlerini kuruluş, başkent ve önemli hükümdarlarıyla tanımak.
3. Malazgirt Savaşı’nın nedenlerini, sonuçlarını ve önemini söylemek.
4. Bu dönemde yazılan önemli eserleri yazarlarıyla eşleştirmek.
5. Nizamiye Medreseleri ve iktaları açıklamak.
:::

## 1. Türklerin İslam’ı kabulü

- **Talas Savaşı (751)** Türklerle Müslümanları yakınlaştırdı.
- Türkler Abbasi ordusunda asker ve komutan olarak yer aldı.
- Müslüman tüccarlar, âlimler ve sufiler Orta Asya’da İslam’ı yaydı.
- Türkler İslam’ı **kitleler halinde** 10. yüzyılda kabul etti. Bu yüzyılda **Karahanlılar**, sonra Oğuzlar (Selçuklular) Müslüman oldu.
- Türkler İslam’ı **kendi kültürleriyle birleştirerek** yorumladı. **Cihad ve gaza** anlayışı Türklerin eski savaşçı yapısıyla birleşti.

İslam’ı kabul eden Türkler **eski kültür öğelerini** (törenler, kurultay, hükümdar anlayışı) korudu, bunlara İslam’ın değerlerini ekledi.

## 2. Karahanlılar (840 ile 1212)

- **Karluk, Yağma ve Çiğil** boylarından kurulmuştur. Başkentleri **Balasagun** ve **Kâşgar**’dır.
- **Satuk Buğra Han** İslam’ı kabul eden ilk Türk hükümdarlarından biridir. Oğlu **Musa Baytaş** döneminde İslam resmî din ilan edilmiştir (10. yüzyıl).
- **İlk Müslüman Türk devleti** kabul edilir.
- Devlet, hanedan üyeleri arasında paylaşılıyordu (doğu ve batı). Bu uygulama devleti zayıflattı.
- Türkçe, Arapça ve Farsça birlikte kullanıldı. **Türkçe resmî dil** olarak korundu. **Uygur alfabesi ve Arap alfabesi** birlikte kullanıldı.
- Medreseler, hastaneler (**darüşşifa**) ve **kervansaraylar** yapıldı.

**Karahanlı dönemi eserleri:**

| Eser | Yazar | Konu |
| --- | --- | --- |
| **Kutadgu Bilig** | Yusuf Has Hacib | Siyasetname, devlet yönetimi. İslam sonrası ilk Türkçe eserlerden |
| **Divanü Lügati’t-Türk** | Kâşgarlı Mahmud | İlk Türkçe sözlük, Türk boyları ve dil bilgisi, ilk Türkiye haritası |
| **Atabetü’l-Hakayık** | Edip Ahmet Yükneki | Ahlak kitabı |
| **Divan-ı Hikmet** | Ahmet Yesevi | Tasavvuf şiirleri, Yesevilik |

## 3. Gazneliler (963 ile 1186)

- Başkentleri **Gazne**’dir. **Sebüktekin** kurucudur (Samanoğullarının komutanı iken bağımsızlık kazanmıştır).
- **Gazneli Mahmut** (998 ile 1030) devleti en geniş sınırlarına ulaştırdı. **Hindistan’a 17 sefer** düzenledi. İslam’ı Hindistan’da yaydı.
- Sultan unvanını kullanan **ilk Türk hükümdarı** olarak bilinir. **Abbasi halifesi** tarafından kabul edildi.
- Ünlü şair **Firdevsi** Şehname’yi Gazneli Mahmut’a sunmuştur. **Biruni** bu sarayda yaşamıştır.
- **Dandanakan Savaşı (1040):** Gazneliler Selçuklulara yenildi. Gazneli devleti zayıfladı, Horasan Selçukluların eline geçti.

## 4. Büyük Selçuklu Devleti (1040 ile 1157)

- **Oğuzların Kınık boyundan** gelen **Selçuk Bey**’in torunları **Çağrı ve Tuğrul Bey** tarafından kurulmuştur.
- **Dandanakan Zaferi (1040)** ile fiilen kuruldu. Başkentleri önce **Nişabur**, sonra **Rey**, **İsfahan** oldu.
- **Tuğrul Bey** Abbasi halifesini Şii Büveyhoğullarının baskısından kurtarmış, halife ona **“Sultan”** unvanını vermiştir (1055, Bağdat). Böylece Selçuklular **İslam dünyasının siyasi lideri** oldu.
- Tuğrul Bey döneminde Anadolu’ya akınlar başladı. Oğuz (Türkmen) boyları Doğu Anadolu’ya ilerledi.

### Alparslan ve Malazgirt (1064 ile 1072)

- **Alparslan** Anadolu seferleri yaptı. Ani (1064), Kars ve çevresi alındı.
- **Malazgirt Savaşı (26 Ağustos 1071):** Alparslan, Bizans İmparatoru **Romen Diyojen** ordusunu yendi.
  - **Nedenler:** Selçukluların Anadolu akınları, Bizans’ın bunları durdurmak istemesi.
  - **Sonuçlar:** **Anadolu’nun kapıları Türklere açıldı.** Türkmen boyları Anadolu’ya yerleşti. Bizans’ın askerî gücü zayıfladı. Bu zafer **Anadolu’nun Türk yurdu olmasının** başlangıcıdır. Haçlı Seferleri’nin nedenlerinden biri oldu.
- Alparslan’ın ölümünden sonra (1072) oğlu **Melikşah** tahta çıktı.

### Melikşah dönemi (1072 ile 1092)

- Devlet en geniş sınırlarına ulaştı. **Nizamülmülk** vezirliği ile devlet düzenlendi.
- Devletin düzeni: **İkta sistemi** (komutanlara, vergi toplama hakkı karşılığı toprak ayrılması), **Nizamiye medreseleri**.
- **Nizamiye Medreseleri** (Bağdat’ta 1067) Sünni düşünceyi yaymak, devlet adamı ve bilgin yetiştirmek için kuruldu. İmam Gazali burada ders vermiştir.
- **Ömer Hayyam**, **Celali takvimi**’ni hazırlamıştır.
- **Siyasetname** adlı eseriyle Nizamülmülk devlet yönetimini anlatmıştır.
- **Haşhaşiler** (Batıni) tehdidi: Nizamülmülk bir suikastla öldürüldü.

Melikşah’tan sonra taht kavgaları devleti zayıflattı. Devlet **Anadolu Selçukluları**, **Kirman**, **Suriye** ve **Irak** gibi kollara ayrıldı. **Sultan Sencer (1157)** döneminin sonunda Büyük Selçuklu Devleti yıkıldı. **Katvan Savaşı (1141)**’nda Karahıtaylara yenilgi alındı.

:::neden-sonuc
- Türkler İslam’ı kabul ediyor => Türk-İslam devletleri kurulur.
- Malazgirt Savaşı kazanılıyor => Anadolu’nun kapıları Türklere açılır.
- Devlet hanedan üyeleri arasında paylaşılıyor => Devlet zayıflar, bölünür.
- Nizamiye Medreseleri kuruluyor => Sünni düşünce ve devlet adamı yetiştirme yaygınlaşır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Gazneliler ile Karahanlıları karıştırma.** Karahanlılar ilk Müslüman Türk devletidir (Balasagun, Kâşgar), Gazneliler Hindistan seferleriyle bilinir (Gazne). **Dandanakan’ı (1040) Malazgirt (1071) ile karıştırma.** Dandanakan Selçukluların Gazneliler karşısındaki, Malazgirt ise Bizans karşısındaki zaferidir. **Kutadgu Bilig’i Kâşgarlı Mahmud’a yazma**: Yusuf Has Hacib’in eseridir.
:::

:::baglanti
Bu konu, “İslam Medeniyetinin Doğuşu” konusundaki Talas Savaşı ile başlar. “İlk ve Orta Çağlarda Türk Dünyası” konusundaki kut, kurultay ve onlu sistem bu devletlerde İslam’la birleşir. “Selçuklu Türkiyesi” konusu, Malazgirt’ten sonra Anadolu’da kurulan devleti anlatır. “Orta Çağ’da Dünya” konusundaki Haçlı Seferleri, Malazgirt sonrası Selçuklu ilerleyişinin sonucudur. Edebiyatta “Geçiş Dönemi Türk Edebiyatı” bu dönemin eserlerini kapsar.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Karahanlılar | İlk Müslüman Türk devleti, Kâşgar |
| Kutadgu Bilig | Yusuf Has Hacib |
| Divanü Lügati’t-Türk | Kâşgarlı Mahmud, ilk sözlük |
| Gazneliler | Gazneli Mahmut, Hindistan |
| Dandanakan | 1040, Selçuklu zaferi |
| Malazgirt | 1071, Alparslan, Bizans |
| Nizamiye | Bağdat 1067, medrese |
| İkta | Hizmet karşılığı toprak |

## Mini test

:::soru{cevap="E"}
Karahanlı döneminde yazılmış, Türk boylarının dillerini, yaşadıkları yerleri ve kültürlerini anlatan ve ilk Türkiye haritasını içeren eser aşağıdakilerden hangisidir?

- A) Kutadgu Bilig
- B) Atabetü’l-Hakayık
- C) Divan-ı Hikmet
- D) Siyasetname
- E) Divanü Lügati’t-Türk

---

1. Türk boylarını, dillerini ve ilk haritayı içeren eser Kâşgarlı Mahmud'un Divanü Lügati't-Türk'üdür.
2. Diğer eserlerin konuları farklıdır. Doğru cevap E.

Diğer şıklar: **Kutadgu Bilig** Kutadgu Bilig devlet yönetimiyle ilgili siyasetnamedir / **Atabetü’l-Hakayık** Atabetü’l-Hakayık ahlak kitabıdır / **Divan-ı Hikmet** Divan-ı Hikmet tasavvuf şiirleri içerir / **Siyasetname** Siyasetname’yi Nizamülmülk yazmıştır, Karahanlı dönemi eseri değildir.
:::

:::soru{cevap="C"}
Selçuklu hükümdarı Alparslan’ın Bizans İmparatoru Romen Diyojen’i yendiği 1071 Malazgirt Savaşı’nın en önemli sonucu aşağıdakilerden hangisidir?

- A) Büyük Selçuklu Devleti’nin kurulması
- B) Abbasi halifesinin Selçuklulardan yardım istemesi
- C) Anadolu’nun kapılarının Türklere açılması
- D) Gaznelilerin Hindistan’ı fethi
- E) Moğolların Anadolu’yu işgali

---

1. Malazgirt Savaşı Bizans'ın Anadolu'daki savunmasını çökertti.
2. Türkmen boylarının Anadolu'ya yerleşmesinin yolu açıldı. Doğru cevap C.

Diğer şıklar: **Büyük Selçuklu Devleti’nin kurulması** Büyük Selçuklu Devleti 1040 Dandanakan’da kuruldu / **Abbasi halifesinin Selçuklulardan yardım istemesi** bu olay Tuğrul Bey zamanında yaşanmıştır / **Gaznelilerin Hindistan’ı fethi** Gazneli Hindistan seferleri Malazgirt’ten önceydi / **Moğolların Anadolu’yu işgali** Moğol işgali Kösedağ’dan (1243) sonra gerçekleşir.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi Karahanlılar ile ilgili **değildir**?

- A) Başkenti Gazne’dir.
- B) İlk Müslüman Türk devletidir.
- C) Kutadgu Bilig bu dönemde yazılmıştır.
- D) Devlet doğu ve batı olarak paylaşılmıştır.
- E) Kâşgar önemli bir merkezdir.

---

1. Gazne, Gaznelilerin başkentidir.
2. Karahanlıların merkezleri Balasagun ve Kâşgar'dır. Doğru cevap A.

Diğer şıklar: **İlk Müslüman Türk devletidir.** Karahanlılar ilk Müslüman Türk devletidir / **Kutadgu Bilig bu dönemde yazılmıştır.** Kutadgu Bilig Karahanlı döneminin eseridir / **Devlet doğu ve batı olarak paylaşılmıştır.** Karahanlı devleti hanedan üyeleri arasında paylaşılmıştır / **Kâşgar önemli bir merkezdir.** Kâşgar Karahanlı merkezlerindendir.
:::

:::soru{cevap="B"}
Selçukluların Gazneliler karşısında kazandığı ve Büyük Selçuklu Devleti’nin fiilen kurulmasını sağlayan savaş hangi yılda yapılmıştır?

- A) 1039
- B) 1040
- C) 1055
- D) 1071
- E) 1141

---

1. Dandanakan Savaşı 1040'ta yapılmış ve Büyük Selçuklu Devleti kurulmuştur.
2. 1071 Malazgirt, 1055 Tuğrul Bey'in sultan unvanı, 1141 Katvan Savaşı'dır. Doğru cevap B.

Diğer şıklar: **1039** işlem hatasıyla bir eksik bulunmuş / **1055** Tuğrul Bey’in sultan unvanı aldığı yıl alınmış / **1071** Malazgirt Savaşı’nın yılı alınmış / **1141** Katvan Savaşı’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. İlk Müslüman Türk devleti hangisidir? => Karahanlılar.
2. İlk Türkçe sözlük hangi eserdir? => Divanü Lügati’t-Türk.
3. Büyük Selçuklu Devleti’nin kurulmasını sağlayan savaş hangisidir? => Dandanakan (1040).
4. Malazgirt Savaşı’nın tarihi nedir? => 1071.
5. Nizamülmülk neyi kurmuştur? => Nizamiye Medreselerini.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tar' and name = 'İlk Türk İslam Devletleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Türklerin İslam'ı kabulü, Karahanlılar, Gazneliler, Büyük Selçuklu Devleti, Malazgirt, Nizamiye Medreseleri, ikta, dönemin eserleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (840, 963, 1040, 1055, 1067, 1071, 1141, 1157, 1186, 1212) ders kitabı ve genel kabul bilgileridir.
Kontrol edilecekler: Karahanlıların kuruluş yılı (840) ve resmi din kabulü yılı kaynaklara göre değişir. Gaznelilerin son yılı (1186) ile Karahanlıların son yılı (1212) yaklaşık değerlerdir. Katvan Savaşı tarihi (1141) ders kitabına göre doğrulanmalı.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'İlk Türk İslam Devletleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Malazgirt’ten sonra Anadolu’ya yerleşen Türkmenler burada yeni bir devlet kurdu: **Anadolu (Türkiye) Selçuklu Devleti**. Bu devlet Anadolu’yu yalnızca fethetmedi, **Türkleştirdi ve İslamlaştırdı**. Konya’dan Antalya’ya, Sivas’tan Alanya’ya yayılan medreseler, kervansaraylar, camiler hâlâ ayaktadır. Bu konuda **devletin kuruluşunu**, önemli hükümdarlarını ve savaşlarını, **Moğol istilasını**, **Anadolu’nun Türkleşmesini**, Selçuklu kültür ve medeniyetini öğreneceksin.

:::hedefler
1. Anadolu Selçuklu Devleti’nin kuruluşunu ve önemli hükümdarlarını sıralamak.
2. Miryokefalon ve Kösedağ savaşlarının sonuçlarını açıklamak.
3. Anadolu’nun Türkleşmesini sağlayan etkenleri sıralamak.
4. Selçuklu yönetim, ekonomi ve kültür özelliklerini örneklerle anlatmak.
5. Mevlana, Yunus Emre, Hacı Bektaş Veli ve Ahilik’i tanımak.
:::

## 1. Kuruluş ve yükseliş

- **Kutalmışoğlu Süleyman Şah**, Malazgirt’ten sonra Anadolu’da **1075’te İznik’i** merkez yaparak devleti kurdu. Böylece **Anadolu Selçuklu Devleti** doğdu.
- Süleyman Şah’tan sonra **I. Kılıç Arslan** döneminde (1092 ile 1107) **I. Haçlı Seferi** (1096 ile 1099) başladı. Haçlılar 1097’de **İznik**’i aldı. Başkent **Konya**’ya taşındı.
- Haçlılara **Dorylaion Savaşı**’nda (1097) yenilen Selçuklular zor günler yaşadı. Yine de Haçlılar Anadolu içlerine yerleşemedi.
- **II. Kılıç Arslan** (1155 ile 1192) döneminde **Miryokefalon Savaşı (1176)** yapıldı. Bizans İmparatoru I. Manuel Komnenos ordusu yenildi. **Anadolu’nun artık Türk yurdu olduğu kesinleşti**, Bizans Anadolu’yu geri alma umudunu yitirdi.
- **I. Gıyaseddin Keyhüsrev** döneminde Antalya alındı (1207). **I. İzzeddin Keykâvus** döneminde Sinop alınarak Karadeniz’e ulaşıldı (1214).

### I. Alaeddin Keykubat dönemi (1220 ile 1237)

Selçukluların **en parlak dönemidir**:

- **Alanya** alındı (1221), Akdeniz kıyısındaki limanlar güçlendi.
- Kayseri, Sivas, Konya’da imar çalışmaları yapıldı. **Alanya Kalesi** ve **Kızıl Kule**, **Kubadabad Sarayı** yaptırıldı.
- Ticaret, **Venedik** gibi Avrupa devletleriyle yapılan antlaşmalarla gelişti.
- Moğol tehlikesi yaklaşırken ittifaklar ve savunma hazırlıkları yapıldı.

## 2. Kösedağ ve Moğol hakimiyeti

- **II. Gıyaseddin Keyhüsrev** döneminde Moğollar Anadolu’ya ilerledi.
- **Kösedağ Savaşı (1243):** Selçuklu ordusu Moğollara yenildi. **Anadolu Selçuklu Devleti Moğol hakimiyetine girdi.** Devlet siyasi gücünü yitirdi ve vergi ödemek zorunda kaldı.
- Anadolu’da **Babai isyanı (1240)** (Baba İlyas önderliğinde) yaşandı, devleti zayıflattı.
- Moğol baskısıyla Türkmen **beylikleri** güç kazandı. Selçuklu devleti 14. yüzyılın başında yıkıldı (1308 civarı). Anadolu’da **Anadolu Beylikleri** dönemi başladı. Bunlardan biri de **Osmanlı Beyliği**’dir.

## 3. Anadolu’nun Türkleşmesi

Anadolu’nun Türk yurdu hâline gelmesinde şunlar etkili oldu:

- **Malazgirt Zaferi** ve Türkmen boylarının akın akın yerleşmesi.
- Selçuklu devletinin kurulması ve **yerleşim politikası**. Uç bölgelere (sınırlara) göçebe Türkmenler yerleştirildi.
- **Dervişler, Ahiler ve ulema**: Anadolu’da İslam’ı yaydı, Türkleri şehirlere ve köylere yerleştirdi.
- **Kervansaraylar, medreseler, camiler** Türk kültürünü kalıcı yaptı.
- Moğol baskısından kaçan Orta Asya nüfusu Anadolu’ya geldi.
- **Fetih sonrası Türkçe** resmî dil olmaya başladı (Karamanoğlu Mehmet Bey 1277’de Türkçeyi resmî dil ilan etti).

## 4. Yönetim ve toplum yapısı

- Devletin başında **sultan** vardı. **Divan-ı Saltanat** (vezir başkanlığında) devlet işlerini yürütürdü.
- **Taşra**: Eyaletleri **melikler** (hanedan üyeleri) ya da **valiler** yönetti. Sınırlarda **uç beyleri** vardı.
- **İkta sistemi** (hizmet karşılığı toprak) ordunun finansmanını sağlar. **Ordu**: Sultanın kapıkulu askerleri, iktalı askerler ve Türkmen birlikleri.
- **Toplum:** Şehirlerde tüccar, zanaatkâr, bilgin, kırda çiftçi ve Türkmen göçebeler. Gayrimüslimler (Rum, Ermeni) kendi dinlerinde serbest yaşadı.

## 5. Ekonomi

- **Tarım, hayvancılık, el sanatları ve ticaret.** Dokuma (halı, kilim), maden, deri, kervan ticareti önemli.
- **Kervansaraylar**: Ticaret yolları üzerinde, yaklaşık bir günlük yolda bir inşa edildi. Yolcu, tüccar ve hayvan için barınma, yemek ve güvenlik sağlardı. **Sultanhanı** (Aksaray, Kayseri) bunların en büyüklerindendir.
- **Ticaret antlaşmaları**, **Antalya ve Sinop limanları** dış ticareti canlandırdı.
- **Ahilik**: Esnaf ve sanatkâr teşkilatı. Ahi Evran öncüsüdür. Ahlak ve dürüstlük esasına dayanır.

## 6. Kültür ve medeniyet

- **Mimari:** Camiler (Konya Alaeddin Camii), medreseler (**Çifte Minareli Medrese**, **İnce Minareli Medrese**), şifahaneler (darüşşifa, Divriği Ulu Camii ve Darüşşifası), saraylar, **kervansaraylar**. Taş işçiliği ve çini sanatı gelişmiştir.
- **Dil ve edebiyat:** Resmî yazışmada Farsça, ilimde Arapça kullanıldı. **Halk arasında Türkçe** yaygındı.
- **Mevlana Celaleddin Rumi:** Mesnevi’yi yazdı. Hoşgörü, sevgi ve insan olgunluğunu vurguladı. **Mevlevilik** Konya’da kuruldu.
- **Yunus Emre:** **Sade Türkçe** ile ilahi ve şiirler yazdı. “Yaratılanı hoş gör, Yaratandan ötürü” dizesiyle tanınır.
- **Hacı Bektaş Veli:** **Bektaşilik** tarikatının kurucusudur. Hoşgörü ve insan sevgisi vurguladı.
- **Ahi Evran:** Ahilik teşkilatının öncüsü, Kırşehir.
- **Sadreddin Konevi**, **Hacı Bayram Veli** (daha sonra) gibi mutasavvıflar yetişti.

:::neden-sonuc
- Miryokefalon kazanılıyor => Bizans Anadolu’yu geri alamaz, Anadolu Türk yurdu olur.
- Kösedağ kaybediliyor => Selçuklu Moğol egemenliğine girer.
- Moğol baskısı artıyor => Beylikler güçlenir.
- Kervansaraylar yapılıyor => Ticaret yolları güvenli hale gelir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Büyük Selçuklu ile Anadolu Selçuklu devletini karıştırma.** Büyük Selçuklu merkezi İran (1040), Anadolu Selçuklu merkezi İznik ve sonra Konya’dır (1075). **Malazgirt’i (1071) Miryokefalon (1176) ile karıştırma**: Malazgirt Anadolu’nun kapısını açtı, Miryokefalon Anadolu’nun Türk yurdu olduğunu kesinleştirdi. **Kösedağ’ı (1243) kuruluşla bağlama**: Bu savaş devletin çöküş sürecini başlatır.
:::

:::baglanti
Bu konu, “İlk Türk İslam Devletleri” konusundaki Malazgirt ile başlar. “Beylikten Devlete Osmanlı” konusunda Selçuklunun yıkılışından sonra doğan Anadolu beylikleri anlatılır. “Orta Çağ’da Dünya” konusundaki Haçlı Seferleri bu devletin ilk yıllarını etkilemiştir. Edebiyatta “Geçiş Dönemi Türk Edebiyatı” ve “Halk Edebiyatı” konuları Yunus Emre ve Mevlana’yı kapsar. Din kültüründe “İslam Düşüncesinde Yorumlar” konusu tasavvufla ilgilidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kuruluş | 1075, Süleyman Şah, İznik |
| Başkent | İznik, sonra Konya |
| Miryokefalon | 1176, II. Kılıç Arslan, Bizans yenildi |
| En parlak dönem | I. Alaeddin Keykubat |
| Kösedağ | 1243, Moğollar kazandı |
| Ahilik | Esnaf teşkilatı |
| Mevlana | Mesnevi, Konya |
| Yunus Emre | Sade Türkçe |
| Kervansaray | Ticaret yolu konaklama yeri |

## Mini test

:::soru{cevap="C"}
Anadolu Selçuklu Devleti’nin Bizans ordusunu yendiği, Bizans’ın Anadolu’yu geri alma umudunu kesin olarak yitirdiği ve Anadolu’nun artık bir Türk yurdu olduğunun kesinleştiği savaş aşağıdakilerden hangisidir?

- A) Malazgirt Savaşı
- B) Kösedağ Savaşı
- C) Miryokefalon Savaşı
- D) Dandanakan Savaşı
- E) Katvan Savaşı

---

1. Miryokefalon (1176) II. Kılıç Arslan'ın Bizans'ı yendiği savaştır.
2. Bu savaştan sonra Bizans Anadolu'yu geri alma umudunu yitirdi. Doğru cevap C.

Diğer şıklar: **Malazgirt Savaşı** Malazgirt Büyük Selçuklu zaferidir, Anadolu’nun kapılarını açtı / **Kösedağ Savaşı** Kösedağ’da Moğollara yenilindi / **Dandanakan Savaşı** Dandanakan Gaznelilere karşı kazanıldı / **Katvan Savaşı** Katvan’da Karahıtaylara yenilindi.
:::

:::soru{cevap="A"}
Selçuklular döneminde ticaret yolları üzerinde, yaklaşık bir günlük yolda yapılan ve yolculara, tüccarlara ve hayvanlara barınma ile güvenlik sağlayan yapılar aşağıdakilerden hangisidir?

- A) Kervansaraylar
- B) Medreseler
- C) Darüşşifalar
- D) İmaretler
- E) Zaviyeler

---

1. Kervansaraylar ticaret yollarında konaklama, barınma ve güvenlik sağlardı.
2. Doğru cevap A.

Diğer şıklar: **Medreseler** medreseler eğitim kurumlarıdır / **Darüşşifalar** darüşşifalar hastane işlevi görürdü / **İmaretler** imaretler yemek dağıtılan hayır kurumlarıdır / **Zaviyeler** zaviyeler tarikat ve derviş toplanma yerleridir.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Anadolu’nun Türkleşmesinde etkili olan gelişmelerden biri **değildir**?

- A) Malazgirt Zaferi’nin ardından Türkmen boylarının Anadolu’ya yerleşmesi
- B) Dervişler ve ahilerin Anadolu’da İslam’ı yaymaları
- C) Kervansaray, medrese ve camilerin yapılması
- D) Orta Asya’dan Moğol baskısıyla gelen Türklerin Anadolu’ya yerleşmesi
- E) Kösedağ Savaşı’ndan sonra Selçukluların Moğollarla birleşmesi

---

1. Selçuklular Moğollara yenilmiş, Moğol egemenliğine girmişti. Moğollarla birleşme Türkleşmeye katkı sayılmaz.
2. Diğer seçenekler Anadolu'nun Türkleşmesini sağlayan etkenlerdir. Doğru cevap E.

Diğer şıklar: **Malazgirt Zaferi’nin ardından Türkmen boylarının Anadolu’ya yerleşmesi** Türkmen yerleşimi Türkleşmenin temel etkenidir / **Dervişler ve ahilerin Anadolu’da İslam’ı yaymaları** dervişler ve ahiler Türkleşmede etkili oldu / **Kervansaray, medrese ve camilerin yapılması** yapılar Türk kültürünü kalıcı kıldı / **Orta Asya’dan Moğol baskısıyla gelen Türklerin Anadolu’ya yerleşmesi** göçler Anadolu’daki Türk nüfusunu artırdı.
:::

:::soru{cevap="D"}
Anadolu Selçuklu Devleti’nin Moğollara yenildiği ve Moğol egemenliğine girdiği Kösedağ Savaşı hangi yılda yapılmıştır?

- A) 1071
- B) 1075
- C) 1176
- D) 1243
- E) 1244

---

1. Kösedağ Savaşı 1243'te yapılmıştır.
2. 1176 Miryokefalon, 1071 Malazgirt, 1075 Anadolu Selçuklu Devleti'nin kuruluşudur. Doğru cevap D.

Diğer şıklar: **1071** Malazgirt Savaşı’nın yılı alınmış / **1075** Anadolu Selçuklu Devleti’nin kuruluş yılı alınmış / **1176** Miryokefalon Savaşı’nın yılı alınmış / **1244** işlem hatasıyla bir fazla bulunmuş.
:::

## Kendini dene

:::dene
1. Anadolu Selçuklu Devleti’ni kim kurmuştur? => Kutalmışoğlu Süleyman Şah.
2. Anadolu’nun Türk yurdu olduğunu kesinleştiren savaş hangisidir? => Miryokefalon (1176).
3. Selçukluların en parlak dönemi hangi sultan zamanındadır? => I. Alaeddin Keykubat.
4. Anadolu Selçuklu Devleti’ni Moğol egemenliğine sokan savaş hangisidir? => Kösedağ (1243).
5. Mesnevi’yi kim yazmıştır? => Mevlana.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tar' and name = 'Selçuklu Türkiyesi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Anadolu Selçuklu Devleti'nin kuruluşu, Miryokefalon, I. Alaeddin Keykubat dönemi, Kösedağ ve Moğol hakimiyeti, Anadolu'nun Türkleşmesi, yönetim, ekonomi, kültür ve medeniyet. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (1075, 1097, 1176, 1207, 1220, 1237, 1240, 1243, 1277) ders kitabı ve genel kabul bilgileridir.
Kontrol edilecekler: Anadolu Selçuklu devletinin yıkılış yılı için 1308 yaklaşık yazıldı. Karamanoğlu Mehmet Bey'in Türkçeyi resmî dil ilan etme tarihi (1277) teyit edilmeli. Mevlana ve Yunus Emre alıntıları kısaltılmış halidir. Kızıl Kule ve Kubadabad ayrıntıları kaynakla kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Selçuklu Türkiyesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Söğüt çevresinde küçük bir uç beyliği olarak başlayan Osmanlı, bir buçuk yüzyıl içinde Balkanlar’a yayılan, İstanbul’u fetheden bir devlete dönüştü. Bu hızlı yükselişin ardında **coğrafi konum**, **gaza ve Ahilik anlayışı**, yetenekli hükümdarlar ve **güçlü kurumlar** vardı. Bu konuda **Osmanlı’nın kuruluş şartlarını**, ilk padişahları ve fetihleri, **Rumeli’ye geçişi**, Ankara Savaşı’nı, **Fetret Devri**ni, devletin kurumlarını ve **İstanbul’un Fethi**’ni öğreneceksin.

:::hedefler
1. Osmanlı Beyliği’nin kuruluşunu sağlayan etkenleri sıralamak.
2. İlk Osmanlı hükümdarlarını ve dönemlerindeki gelişmeleri eşleştirmek.
3. Rumeli’ye geçişin ve Balkan fetihlerinin önemini açıklamak.
4. Ankara Savaşı ve Fetret Devri’nin sonuçlarını söylemek.
5. İstanbul’un fethini, nedenlerini ve sonuçlarını açıklamak.
:::

## 1. Kuruluşun şartları

- **Konum:** Osmanlı Beyliği, **Bizans sınırında (uç bölgesinde)** kuruldu. Bizans zayıftı, bölgede siyasi boşluk vardı.
- **Selçuklu çöküşü:** Moğol baskısı Anadolu Selçuklularını zayıflatmıştı. Türkmenler batı uçlarına yöneldi.
- **Gaza ve Ahilik:** Gaza ruhu ve Ahilerin desteği Osmanlı’ya güç verdi.
- **Konum avantajı:** Ticaret yolları ve verimli topraklar, Marmara’ya yakınlık.
- **Liderlik:** Başarılı beyler ve kurumlar kısa sürede merkezileşme sağladı.

**Kayı boyu**ndan **Ertuğrul Gazi**, Selçuklu uç beyi olarak Söğüt ve Domaniç çevresine yerleşti. Oğlu **Osman Bey** beyliği büyüttü.

## 2. Beylik dönemi hükümdarları

### Osman Bey (gelenekle 1299 ile 1326)

- Osmanlı Beyliği’nin kurucusudur. Selçuklu Devleti’nden bağımsız davranmaya başladı.
- **Koyunhisar (Bafeus) Savaşı (1302)** Bizans’a karşı ilk büyük zaferdir.
- Bursa kuşatması sırasında öldü. Oğlu Orhan Bey Bursa’yı fethetti (**1326**).

### Orhan Bey (1326 ile 1362)

- **Bursa** başkent oldu. İznik (1331), İzmit (1337) alındı.
- **Karesi Beyliği** Osmanlıya katıldı (1345). Böylece Osmanlı **Çanakkale Boğazı**’na ulaştı ve Rumeli’ye geçiş kolaylaştı.
- Oğlu **Süleyman Paşa** Gelibolu Yarımadası’ndaki **Çimpe Kalesi**’ni ele geçirdi (1352). Bu, **Rumeli’ye ilk yerleşmedir.**
- İlk **medrese** İznik’te, ilk **düzenli ordu** (yaya ve müsellem) kuruldu. İlk **Osmanlı parası** (sikke) bastırıldı.

### I. Murat (1362 ile 1389)

- **Edirne** alındı (1361 ya da 1362), sonra başkent oldu (1365). **Rumeli’de ilerleme** sürdü.
- **Sırpsındığı Savaşı (1364)** ve **Çirmen (Meriç) Savaşı (1371)** ile Balkanlar’da Osmanlı’nın yerleşmesi güçlendi.
- **Yeniçeri Ocağı** ve **devşirme sistemi** kuruldu. Kazaskerlik ve beylerbeyliği (Rumeli ve Anadolu) bu dönemdedir.
- **I. Kosova Savaşı (1389)**: Balkan krallıklarını yendi. I. Murat savaş alanında şehit edildi.

## 3. Yıldırım Bayezid ve Ankara Savaşı

- **Yıldırım Bayezid** (1389 ile 1402) Anadolu’da bir kısım beylikleri Osmanlıya kattı. Anadolu birliğini kurmaya çalıştı.
- **Niğbolu Savaşı (1396):** Macar Kralı Sigismund önderliğindeki Haçlı ordusunu yendi. Bu zafer Osmanlı’nın Balkanlar’daki hâkimiyetini kesinleştirdi.
- **İstanbul’u kuşattı** ama Timur tehdidi yüzünden kaldırmak zorunda kaldı.
- **Ankara Savaşı (1402):** **Timur** ile yapıldı. Osmanlı ordusundaki Anadolu beyliklerinden gelen askerlerin Timur’a geçmesi ve Tatar birliklerinin saf değiştirmesi gibi etkenlerle Osmanlı yenildi. Yıldırım Bayezid esir düştü (1403’te öldü). **Timur** Anadolu beyliklerini yeniden kurdu.

**Sonuç:** **Fetret Devri** (1402 ile 1413) başladı. Bayezid’in oğulları (Süleyman, İsa, Musa, Mehmet) arasında **taht mücadelesi** yaşandı. Bu dönemde Anadolu Birliği bozuldu, devlet parçalandı.

## 4. Devletin toparlanması

- **I. Mehmed (Çelebi) (1413 ile 1421)** kardeşlerini yenerek devleti **yeniden birleştirdi**, bu yüzden “ikinci kurucu” sayılır.
- **II. Murat (1421 ile 1451):** İstanbul kuşatması, Balkanlarda mücadele. **Varna Savaşı (1444)**: Macar ve Haçlı ordusunu yendi. **II. Kosova (1448)**: Macarlara karşı kesin sonuç. Bu zaferlerle Balkanlarda Osmanlı hâkimiyeti kesinleşti.
- Bu dönemde Osmanlı **Rumeli’de yerleşmeyi** sağladı, **iskân ve sürgün** politikaları uygulandı.

**Fetih yöntemleri:** **İstimalet** (halkı gönlünü alma, vergi ve dinî serbestlik), **iskân** (Türkmenleri uç bölgelere yerleştirme), **sürgün**. Bu yöntemler fethedilen yerlerin Osmanlı yapısına katılmasını sağladı.

## 5. İstanbul’un Fethi (1453)

**II. Mehmet (Fatih)** 1451’de tahta çıktı. İstanbul’u almak için hazırlık yaptı:

- **Rumeli Hisarı** (Boğazkesen) inşa edildi.
- **Şahi toplarını** (Macar mühendis Urban dökmüştür) ve donanmayı hazırladı.
- Kuşatma sırasında gemileri karadan **Haliç’e** indirdi.
- **29 Mayıs 1453’te** İstanbul fethedildi. Bizans İmparatoru **XI. Konstantinos** (Palaiologos) savaşta öldü.

**Nedenler:** Bizans’ın Osmanlı topraklarını bölmesi, İstanbul’un stratejik konumu, Rumeli ile Anadolu’yu birleştirme isteği, Hz. Muhammed’in müjdesi (İstanbul’un fethine dair hadis).

**Sonuçlar:**

- **Orta Çağ sona erdi, Yeni Çağ başladı.**
- **Bizans İmparatorluğu yıkıldı.**
- İstanbul Osmanlı’nın başkenti oldu. Osmanlı dünya devleti olma yoluna girdi.
- **Ticaret yolları** Osmanlı kontrolüne girdi. Avrupalılar yeni yollar aramaya başladı, bu **Coğrafi Keşifler**’i hızlandırdı.
- Avrupa’da Rönesans’a Bizans bilginlerinin göçü katkı sağladı.
- Fatih, **Ortodoks Patrikhanesi**ni yeniden kurdu, gayrimüslimlere dinî özgürlük tanıdı.

## 6. Kurumlar

- **Padişah:** Devletin başıdır. Yetkisi **töre ve şeriatla** sınırlıdır.
- **Divan-ı Hümayun:** Devlet işlerinin görüşüldüğü kurul (sonra Fatih döneminde yeniden düzenlenmiş).
- **Tımar sistemi:** Sipahilere hizmet karşılığı toprak verilirdi (ikta gibidir).
- **Yeniçeri Ocağı:** Devşirmelerden kurulan **düzenli, maaşlı** piyade ordusu.
- **Devşirme:** Hristiyan çocuklarının toplanıp Türk-İslam terbiyesi ile yetiştirilerek devlet hizmetine alınması.
- **Medrese ve vakıflar:** Eğitim ve hayır hizmetleri.

:::neden-sonuc
- Bizans zayıf ve Selçuklu çökmüş => Osmanlı uç beyliği güçlenir.
- Karesi Beyliği Osmanlıya katılıyor => Rumeli’ye geçiş kolaylaşır.
- Ankara Savaşı kaybediliyor => Fetret Devri başlar, devlet parçalanır.
- İstanbul fethediliyor => Orta Çağ biter, Yeni Çağ başlar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Ankara Savaşı (1402) ile İstanbul’un Fethi (1453) arasında Osmanlı’nın yıkıldığını sanma.** Fetret Devri 1413’te sona erdi, devlet Çelebi Mehmed’le yeniden birleşti. Bir de **Rumeli’ye ilk geçişi Edirne ile karıştırma**: Çimpe Kalesi (1352) ilk yerleşme, Edirne (1361 ya da 1362) ilk başkent değişimidir.
:::

:::baglanti
Bu konu, “Selçuklu Türkiyesi” konusundaki Kösedağ ve Moğol baskısıyla başlayan Anadolu beylikleri dönemini devam ettirir. “Orta Çağ’da Dünya” konusundaki Bizans’ın sonu, İstanbul’un fethiyle gerçekleşir. “Dünya Gücü Osmanlı” konusu, bu fetihten sonraki yükselişi anlatır. “Tarih ve Zaman” konusundaki Orta Çağ’ın bitişi ve Yeni Çağ’ın başlangıcı burada ortaya çıkar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kuruluş | Osman Bey, 1299, Söğüt |
| Koyunhisar | 1302, Bizans’a karşı ilk zafer |
| Bursa | 1326, ilk başkent |
| Çimpe | 1352, Rumeli’ye ilk yerleşme |
| Edirne | 1361-62, I. Murat, başkent 1365 |
| Kosova | 1389, I. Murat şehit |
| Niğbolu | 1396, Yıldırım Bayezid, Haçlı yenildi |
| Ankara | 1402, Timur, Fetret Devri |
| İstanbul | 1453, Fatih |

## Mini test

:::soru{cevap="B"}
Osmanlılar Orhan Bey döneminde Karesi Beyliği’ni topraklarına kattığında Çanakkale Boğazı’na ulaşmış ve oğlu Süleyman Paşa, Gelibolu Yarımadası’ndaki Çimpe Kalesi’ni almıştır. Bu gelişmenin Osmanlı tarihi açısından en önemli sonucu aşağıdakilerden hangisidir?

- A) İstanbul’un fethedilmesi
- B) Rumeli’ye geçişin başlaması
- C) Ankara Savaşı’nın kazanılması
- D) Anadolu Birliği’nin tamamlanması
- E) Yeniçeri Ocağı’nın kurulması

---

1. Çimpe Kalesi (1352) Osmanlıların Rumeli'ye ilk yerleştiği yerdir.
2. Böylece Balkanlara yayılma başladı. Doğru cevap B.

Diğer şıklar: **İstanbul’un fethedilmesi** İstanbul’un fethi 1453’te gerçekleşti / **Ankara Savaşı’nın kazanılması** Ankara Savaşı 1402’de kaybedildi / **Anadolu Birliği’nin tamamlanması** Çimpe Kalesi’nin alınmasıyla bu birlik gerçekleşmedi / **Yeniçeri Ocağı’nın kurulması** Yeniçeri Ocağı I. Murat zamanında kuruldu.
:::

:::soru{cevap="D"}
Aşağıdaki olaylardan hangisi Osmanlı tarihinde Fetret Devri’nin başlamasına yol açmıştır?

- A) Niğbolu Savaşı’nın kazanılması
- B) I. Kosova Savaşı’nın kazanılması
- C) İznik’in alınması
- D) Ankara Savaşı’nda Timur’a yenilinmesi
- E) Varna Savaşı’nın kazanılması

---

1. Yıldırım Bayezid 1402'de Ankara Savaşı'nda Timur'a yenilip esir düştü.
2. Ardından şehzadeler arasında taht mücadelesi (Fetret Devri) başladı. Doğru cevap D.

Diğer şıklar: **Niğbolu Savaşı’nın kazanılması** Niğbolu Osmanlı zaferidir, karışıklık doğurmadı / **I. Kosova Savaşı’nın kazanılması** Kosova zaferi Balkan hâkimiyetini güçlendirdi / **İznik’in alınması** İznik’in alınması 1331’de, Orhan Bey zamanında / **Varna Savaşı’nın kazanılması** Varna 1444’te, Fetret Devri bittikten sonra.
:::

:::soru{cevap="A"}
İstanbul’un fethedilmesi aşağıdakilerden hangisinin sonucu **değildir**?

- A) Anadolu Selçuklu Devleti’nin yıkılması
- B) Bizans İmparatorluğu’nun sona ermesi
- C) Yeni Çağ’ın başlaması
- D) Osmanlı’nın başkentinin İstanbul olması
- E) Avrupalıların yeni ticaret yolları araması

---

1. Anadolu Selçuklu Devleti İstanbul'un fethinden çok önce Moğol baskısıyla yıkılmıştı.
2. Diğer seçenekler fethin sonuçlarıdır. Doğru cevap A.

Diğer şıklar: **Bizans İmparatorluğu’nun sona ermesi** Bizans İstanbul’un fethiyle yıkıldı / **Yeni Çağ’ın başlaması** fetih Yeni Çağ’ın başlangıcı sayılır / **Osmanlı’nın başkentinin İstanbul olması** Fatih başkenti İstanbul yaptı / **Avrupalıların yeni ticaret yolları araması** Doğu ticaret yolları Osmanlı’nın eline geçti.
:::

:::soru{cevap="C"}
Osmanlı Devleti’nin Rumeli’deki ilerleyişinde Haçlı ordusunu yendiği ve Balkanlardaki hâkimiyetini kesinleştirdiği Niğbolu Savaşı hangi yılda yapılmıştır?

- A) 1389
- B) 1395
- C) 1396
- D) 1402
- E) 1444

---

1. Niğbolu Savaşı 1396'da yapılmış, Yıldırım Bayezid Haçlı ordusunu yenmiştir.
2. 1389 Kosova, 1402 Ankara, 1444 Varna Savaşı'dır. Doğru cevap C.

Diğer şıklar: **1389** I. Kosova Savaşı’nın yılı alınmış / **1395** işlem hatasıyla bir eksik bulunmuş / **1402** Ankara Savaşı’nın yılı alınmış / **1444** Varna Savaşı’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. Osmanlı Devleti’nin ilk başkenti neresidir? => Bursa.
2. Rumeli’ye ilk yerleşme hangi kaledir? => Çimpe Kalesi (1352).
3. Yeniçeri Ocağı hangi padişah döneminde kuruldu? => I. Murat.
4. Ankara Savaşı’nın sonucu ne olmuştur? => Osmanlı yenildi, Fetret Devri başladı.
5. İstanbul hangi tarihte fethedildi? => 29 Mayıs 1453.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'Beylikten Devlete Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Osmanlı'nın kuruluş şartları, Osman Bey, Orhan Bey, I. Murat, Yıldırım Bayezid, Ankara Savaşı, Fetret Devri, II. Murat, İstanbul'un Fethi, kurumlar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (1299, 1302, 1326, 1331, 1337, 1345, 1352, 1361, 1364, 1371, 1389, 1396, 1402, 1413, 1444, 1448, 1453) ders kitabı bilgileridir.
Kontrol edilecekler: Osmanlı'nın kuruluş yılı (1299) gelenekseldir, kaynaklara göre değişir. Edirne'nin alınış yılı (1361 ya da 1362) tartışmalıdır. Ankara Savaşı'ndaki yenilgi nedenleri sadeleştirildi. Fatih'in toplarını döken Urban bilgisi kaynakla kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Beylikten Devlete Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İstanbul’un fethinden sonra Osmanlı üç kıtaya yayılan bir dünya gücü oldu. 16. yüzyılda Viyana kapılarına dayandı, Akdeniz’de donanması en güçlü denizcilerle yarıştı, Kızıldeniz ve Hint Okyanusu’nda Portekiz’le mücadele etti. Bu konuda **Fatih’ten Kanuni’ye** uzanan fetihleri, **Mısır Seferi ve Halifeliğin Osmanlı’ya geçişini**, **Akdeniz ve Hint Okyanusu** mücadelelerini, devletin **yönetim ve toplum yapısını** ve kültür-medeniyet eserlerini öğreneceksin.

:::hedefler
1. Fatih’ten Kanuni’ye önemli padişahları ve fetihlerini sıralamak.
2. Çaldıran, Mercidabık, Ridaniye, Mohaç, Preveze savaşlarının sonuçlarını açıklamak.
3. Osmanlı’nın denizlerdeki mücadelesini ve nedenlerini anlatmak.
4. Osmanlı yönetim, ekonomi ve toplum düzenini açıklamak.
5. Osmanlı kültür ve medeniyetinden örnekler vermek.
:::

## 1. Fatih ve II. Bayezid dönemi

**II. Mehmet (Fatih) (1451 ile 1481):**

- İstanbul’un fethinden sonra **Balkanlarda** (Sırbistan, Bosna, Mora, Eflak ve Boğdan), **Anadolu’da** (Trabzon Rum İmparatorluğu 1461) ve **Karadeniz’de** (Kırım Hanlığı Osmanlı himayesine girdi 1475) genişledi.
- **Otlukbeli Savaşı (1473):** Akkoyunlu hükümdarı **Uzun Hasan**’a karşı kazanıldı. Doğu Anadolu’da Osmanlı hâkimiyeti sağlandı.
- **Kanunname-i Âli Osman** (Fatih Kanunnamesi) hazırlandı. Devlet teşkilatı düzenlendi, **kardeş katli** kanunlaştı (veraset sorununu önlemek için).
- **Sahn-ı Semân Medreseleri** kuruldu.
- **Gedik Ahmet Paşa** Güney İtalya’da Otranto’yu aldı (1480).

**II. Bayezid (1481 ile 1512):**

- Kardeşi **Cem Sultan** ile taht mücadelesi yaşadı, Cem Avrupa’ya sığındı.
- **Barışçı** bir politika izledi. **Memlüklerle** ilk mücadeleler oldu.
- **Endülüs’ten kaçan Yahudilere** (1492) sığınma verdi.
- Donanma güçlendirildi. **Venedik** ile savaşlar yapıldı.

## 2. Yavuz Sultan Selim (1512 ile 1520)

- **Çaldıran Savaşı (1514):** **Safevi Şahı İsmail**’i yendi. Doğu Anadolu ve Azerbaycan’da Safevi tehdidi kırıldı. Şii propagandası durduruldu.
- **Mercidabık Savaşı (1516)** ve **Ridaniye Savaşı (1517):** **Memlük Devleti** yıkıldı. **Suriye, Filistin, Mısır** ve **Hicaz** Osmanlıya geçti.
- **Halifelik Osmanlılara geçti** ve **Kutsal Emanetler** İstanbul’a getirildi. Mekke ve Medine’nin koruyuculuğu Osmanlı’ya verildi.
- **Baharat yolu** ve Kızıldeniz Osmanlı kontrolüne girdi. Osmanlı **İslam dünyasının lideri** oldu.
- **Hint Okyanusu**’nda Portekiz ile mücadele başladı.

## 3. Kanuni Sultan Süleyman (1520 ile 1566)

Osmanlı’nın **en güçlü dönemi**dir. “Kanuni”, kanun düzenlemesi nedeniyle verilmiş addır. Avrupa’da “Muhteşem Süleyman” de denir.

### Avrupa seferleri

- **Belgrad (1521)** ve **Rodos (1522)** alındı.
- **Mohaç Savaşı (1526):** Macar Kralı II. Lajos yenildi. Macaristan’ın büyük kısmı Osmanlı hâkimiyetine girdi.
- **I. Viyana Kuşatması (1529):** Başarısız oldu. Osmanlı’nın Avrupa’da en uzak noktasıdır.
- Habsburglara karşı Fransa ile yakınlaşıldı.

### Doğu ve Güney seferleri

- **Irakeyn Seferi (1534 ile 1535):** Bağdat alındı, Irak Osmanlıya geçti.
- Safevilerle mücadele sürdü. **Amasya Antlaşması (1555)** yapıldı.
- **Cezayir** Barbaros Hayrettin Paşa ile Osmanlı’ya bağlı bir üs oldu, **Trablusgarp** alındı (1551).

### Akdeniz ve denizler

- **Preveze Deniz Savaşı (1538):** **Barbaros Hayrettin Paşa** komutasındaki Osmanlı donanması, Haçlı donanmasını (Andrea Doria) yendi. Osmanlı **Akdeniz’in hâkimi** oldu.
- **Hint Okyanusu:** **Piri Reis, Seydi Ali Reis** gibi denizciler Portekiz’e karşı mücadele etti. Fakat Kızıldeniz’in dışına tam hâkimiyet sağlanamadı.
- **II. Selim (1566 ile 1574)** döneminde **Kıbrıs** alındı (1571). Aynı yıl **İnebahtı Deniz Savaşı** (1571) kaybedildi, ama Osmanlı donanmasını kısa sürede yeniledi (Sadrazam **Sokullu Mehmet Paşa** önderliğinde).
- Sokullu **Don-Volga kanalı** projesini düşündü (başarısız).

### Kanuni dönemi iç düzeni

- Devletin kanunları düzenlendi (**Kanunnameler**). Adalet ve hukuk gelişti.
- **Fransa’ya ticari ayrıcalıklar (kapitülasyonlar)** verildi. Bunlar zamanla genişletilerek Osmanlı ekonomisine zarar verecek duruma geldi.
- Bayındırlık ve imar: **Mimar Sinan**’ın eserleri.

## 4. Yönetim ve toplum

- **Padişah:** Devletin başı, **halife**dir (Yavuz’dan sonra).
- **Divan-ı Hümayun:** Başkan **sadrazam**. Üyeler: vezirler, kazaskerler, defterdar, nişancı.
- **Eyalet, sancak, kaza:** Eyaleti **beylerbeyi**, sancağı **sancak beyi**, kazayı **kadı** yönetir.
- **Tımar sistemi:** Askerî-idari sistem. **Sipahiler** toprak gelirinden asker besler.
- **Kapıkulu ocakları:** Yeniçeri, cebeci, topçu vb. **Merkezde** maaşlı ordudur. Devşirme ile yetişen **Enderun** mezunları devlet kademelerine yükselir.
- **Millet sistemi:** Gayrimüslimler **dinî cemaatleri** halinde kendi inanç, eğitim ve hukuki işlerinde özerk idi. Rum, Ermeni, Yahudi milletleri.
- **İstimalet:** Fethedilen yerlerin halkının gönlü alınır, adalet ve vergi kolaylığı verilirdi.
- **Ekonomi:** Tarım, ticaret, zanaat. **Loncalar** esnaf örgütüdür. Doğu-Batı ticaret yollarının kontrolü, **baharat ve ipek yolu**.

## 5. Kültür ve medeniyet

- **Mimar Sinan** (16. yüzyıl): **Şehzade Camii** (çıraklık), **Süleymaniye Camii** (kalfalık), **Selimiye Camii** (Edirne, ustalık eseri) önemli eserleridir.
- **Piri Reis:** 1513’te dünya haritasını çizdi, **Kitab-ı Bahriye** adlı eseri yazdı.
- **Matrakçı Nasuh:** Minyatür ve haritalar, sefer güzergahları.
- **Bâkî** (şair), **Fuzûlî** (Divan edebiyatı), **Evliya Çelebi** (17. yüzyıl, Seyahatname).
- **Enderun** mektebi, **sıbyan mektepleri**, **medreseler**, **külliyeler**, **darüşşifalar** (hastaneler).

:::neden-sonuc
- Çaldıran kazanılıyor => Safevi tehdidi kırılır, Doğu Anadolu güvene girer.
- Memlük Devleti yıkılıyor => Halifelik ve Kutsal Emanetler Osmanlıya geçer.
- Preveze kazanılıyor => Osmanlı Akdeniz’de üstünlük kazanır.
- Fransa’ya kapitülasyon veriliyor => Uzun vadede Osmanlı ekonomisi zarar görür.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Mohaç (1526) ile I. Viyana Kuşatması’nı (1529) karıştırma.** Mohaç bir zaferdir, Viyana kuşatması başarısızlıktır. **Preveze’yi (1538) İnebahtı (1571) ile karıştırma**: Preveze zafer, İnebahtı kayıptır. **Halifeliğin Osmanlıya geçişini Fatih zamanına bağlama**: Bu olay Yavuz Sultan Selim’in Mısır Seferi (1517) sonucudur.
:::

:::baglanti
Bu konu, “Beylikten Devlete Osmanlı” konusunun devamıdır ve İstanbul’un fethinden sonraki yükselişi anlatır. “Orta Çağ’da Dünya” konusundaki Coğrafi Keşifler ve Portekiz, Osmanlı’nın denizlerdeki mücadelesini açıklar. “Değişim Çağında Avrupa ve Osmanlı” konusu, bu yükselişin sonunda başlayan değişimi ele alır. Coğrafyada “Ulaşım Hatları” konusu baharat yollarını kapsar. Edebiyatta “Divan Edebiyatı” Bâkî ve Fuzûlî ile ilişkilidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Fatih | 1451 ile 1481, İstanbul, Otlukbeli (1473) |
| Çaldıran | 1514, Yavuz, Safevi |
| Mercidabık ve Ridaniye | 1516 ve 1517, Memlük, halifelik |
| Mohaç | 1526, Kanuni, Macar |
| Viyana | 1529, başarısız kuşatma |
| Preveze | 1538, Barbaros, Akdeniz üstünlüğü |
| İnebahtı | 1571, deniz yenilgisi |
| Mimar Sinan | Şehzade, Süleymaniye, Selimiye |

## Mini test

:::soru{cevap="C"}
Yavuz Sultan Selim döneminde Mercidabık ve Ridaniye savaşlarında Memlük Devleti yıkılmıştır. Bu gelişmenin aşağıdaki sonuçlarından hangisi **yanlıştır**?

- A) Mısır, Suriye ve Hicaz Osmanlı topraklarına katılmıştır.
- B) Halifelik Osmanlılara geçmiştir.
- C) Akdeniz’deki donanma üstünlüğünün kaybedilmesi
- D) Kutsal Emanetler İstanbul’a getirilmiştir.
- E) Osmanlı İslam dünyasının lideri konumuna gelmiştir.

---

1. Memlük Devleti'nin yıkılması Osmanlı'ya Suriye, Mısır, Hicaz, halifelik ve Kutsal Emanetleri kazandırdı.
2. Donanma üstünlüğünün kaybedildiği bir sonuç ortaya çıkmamıştır. Doğru cevap C.

Diğer şıklar: **Mısır, Suriye ve Hicaz Osmanlı topraklarına katılmıştır.** bu bölgeler Osmanlı’ya geçmiştir / **Halifelik Osmanlılara geçmiştir.** halifelik bu seferle Osmanlıya geçmiştir / **Kutsal Emanetler İstanbul’a getirilmiştir.** Kutsal Emanetler bu dönemde getirilmiştir / **Osmanlı İslam dünyasının lideri konumuna gelmiştir.** Osmanlı İslam dünyasının lideri olmuştur.
:::

:::soru{cevap="D"}
Barbaros Hayrettin Paşa komutasındaki Osmanlı donanmasının Haçlı donanmasını yenerek Akdeniz’de üstünlük sağladığı savaş aşağıdakilerden hangisidir?

- A) İnebahtı Deniz Savaşı
- B) Mohaç Savaşı
- C) Mercidabık Savaşı
- D) Preveze Deniz Savaşı
- E) Otlukbeli Savaşı

---

1. Preveze Deniz Savaşı (1538) Barbaros Hayrettin Paşa'nın Haçlı donanmasını yendiği savaştır.
2. Bu zaferle Osmanlı Akdeniz'de üstün hale geldi. Doğru cevap D.

Diğer şıklar: **İnebahtı Deniz Savaşı** İnebahtı’da Osmanlı donanması yenilmiştir / **Mohaç Savaşı** Mohaç bir kara savaşıdır / **Mercidabık Savaşı** Mercidabık Memlüklere karşı bir kara savaşıdır / **Otlukbeli Savaşı** Otlukbeli Akkoyunlulara karşı bir kara savaşıdır.
:::

:::soru{cevap="B"}
Aşağıdaki Osmanlı padişahlarının her biri için verilen olaylardan hangisi **yanlış** eşleştirilmiştir?

- A) Yavuz Sultan Selim: Çaldıran Savaşı
- B) Fatih Sultan Mehmet: Mohaç Savaşı
- C) Kanuni Sultan Süleyman: I. Viyana Kuşatması
- D) II. Selim: Kıbrıs’ın alınması
- E) Fatih Sultan Mehmet: Otlukbeli Savaşı

---

1. Mohaç Savaşı 1526'da Kanuni Sultan Süleyman döneminde yapılmıştır.
2. Fatih Sultan Mehmet ile eşleştirilmesi yanlıştır. Doğru cevap B.

Diğer şıklar: **Yavuz Sultan Selim: Çaldıran Savaşı** Çaldıran Yavuz döneminde Safevilere karşı yapıldı / **Kanuni Sultan Süleyman: I. Viyana Kuşatması** Viyana Kuşatması 1529’da Kanuni döneminde / **II. Selim: Kıbrıs’ın alınması** Kıbrıs 1571’de II. Selim döneminde alındı / **Fatih Sultan Mehmet: Otlukbeli Savaşı** Otlukbeli 1473’te Fatih zamanında yapıldı.
:::

:::soru{cevap="C"}
Kanuni Sultan Süleyman döneminde Macar Kralı II. Lajos’un yenildiği ve Macaristan’ın büyük bölümünün Osmanlı hâkimiyetine girdiği Mohaç Savaşı hangi yılda yapılmıştır?

- A) 1521
- B) 1525
- C) 1526
- D) 1529
- E) 1538

---

1. Mohaç Savaşı 1526'da yapılmıştır.
2. 1521 Belgrad'ın alınışı, 1529 Viyana Kuşatması, 1538 Preveze Deniz Savaşı'dır. Doğru cevap C.

Diğer şıklar: **1521** Belgrad’ın alındığı yıl alınmış / **1525** işlem hatasıyla bir eksik bulunmuş / **1529** I. Viyana Kuşatması’nın yılı alınmış / **1538** Preveze Deniz Savaşı’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. Çaldıran Savaşı’nda Osmanlı kimi yenmiştir? => Safevi Şahı İsmail’i.
2. Halifelik hangi padişah döneminde Osmanlıya geçmiştir? => Yavuz Sultan Selim.
3. Preveze Deniz Savaşı hangi yıldadır? => 1538.
4. Selimiye Camii’ni kim yapmıştır? => Mimar Sinan.
5. Osmanlı’nın Avrupa’da en uzak noktası neresidir? => Viyana (1529).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'Dünya Gücü Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fatih ve II. Bayezid dönemi, Yavuz Sultan Selim, Çaldıran, Mercidabık, Ridaniye, halifelik, Kanuni Sultan Süleyman, Mohaç, Viyana, Preveze, İnebahtı, yönetim, toplum ve kültür. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (1461, 1473, 1480, 1514, 1516, 1517, 1521, 1522, 1526, 1529, 1534, 1538, 1555, 1571) ders kitabı bilgileridir.
Kontrol edilecekler: Kırım Hanlığı'nın Osmanlı himayesine girişi (1475) ve Otranto (1480) kaynakla teyit edilmeli. Kapitülasyonların başlangıç tarihi ders kitaplarında farklı verilir, metinde yıl yazılmadı. Don-Volga kanalı bilgisi sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Dünya Gücü Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

16. yüzyıldan sonra Avrupa büyük bir dönüşüm yaşadı. Yeni deniz yolları bulundu, kıtaya zenginlik aktı, bilim ve düşünce özgürleşti, fabrikalar kuruldu, krallıklar devrildi. Osmanlı ise geçmişte olduğu gibi yaşamaya devam ederken Avrupa’ya göre geri kalmaya başladı. Bu konuda **Avrupa’daki büyük değişimleri** (Coğrafi Keşifler, Rönesans, Reform, Aydınlanma, Sanayi İnkılabı, Fransız İhtilali), **Osmanlı’nın duraklama, gerileme ve dağılma dönemlerini** ile **yenileşme (ıslahat) hareketlerini** öğreneceksin.

:::hedefler
1. Avrupa’daki büyük değişimleri ve nedenlerini sıralamak.
2. Osmanlı’nın dönemlerini ve dönemleri ayıran antlaşmaları söylemek.
3. Karlofça, Pasarofça, Küçük Kaynarca antlaşmalarının sonuçlarını açıklamak.
4. Osmanlı’da III. Selim’den Tanzimat’a ıslahat hareketlerini sıralamak.
5. Fransız İhtilali’nin Osmanlı üzerindeki etkisini açıklamak.
:::

## 1. Avrupa’daki büyük değişimler

- **Coğrafi Keşifler (15. ve 16. yüzyıl):** Pusula, usturlap ve gelişen gemicilik ile yeni yollar bulundu. **Kolomb (1492, Amerika)**, **Vasco da Gama (1498, Hindistan)**, **Macellan** seferi. Nedenleri: **Osmanlı’nın Doğu ticaret yollarını** (baharat ve ipek yolu) kontrol etmesi, zenginlik ve yeni topraklar arayışı, bilimsel merak ve misyonerlik.
- **Sonuçları:** Ticaret merkezi Akdeniz’den **Atlantik’e** kaydı. Avrupa’ya Amerika’dan altın ve gümüş aktı, **fiyatlar yükseldi** (fiyat devrimi). **Sömürgecilik** ve **merkantilizm** (devletin zenginliği altın ve gümüş birikimi) doğdu. Burjuva (tüccar) sınıfı güçlendi.
- **Rönesans ve Reform:** İnsan merkezli düşünce, bilimsel merak. Martin Luther ve Kalvin ile Katolik kilisesinin otoritesi sarsıldı.
- **Aydınlanma Çağı (18. yüzyıl):** Akıl ve bilim önde. **Montesquieu** (güçler ayrılığı), **Rousseau** (halk egemenliği, toplum sözleşmesi), **Voltaire** (düşünce özgürlüğü). Krallığın mutlak yetkisi eleştirildi.
- **Sanayi İnkılabı (18. yüzyıl, İngiltere):** Buhar makinesi, fabrika üretimi. **İşçi sınıfı**, şehirleşme, ham madde ve pazar ihtiyacı doğdu. Avrupa güçleri Osmanlı’yı ham madde ve pazar olarak gördü.
- **Fransız İhtilali (1789):** **Hürriyet, eşitlik, kardeşlik** fikirleri yayıldı. **Milliyetçilik** akımı çok uluslu imparatorlukları (Osmanlı, Avusturya) tehdit etti.

## 2. Osmanlı’nın dönemleri

| Dönem | Yıllar | Başlangıç ve bitiş |
| --- | --- | --- |
| Kuruluş | 1299 ile 1453 | Beylikten devlete |
| Yükselme | 1453 ile 1595 | İstanbul’un fethi |
| Duraklama | 1595 ile 1699 | Karlofça Antlaşması ile sona erer |
| Gerileme | 1699 ile 1792 | Karlofça ile Yaş arası |
| Dağılma | 1792 ile 1918 | Yaş Antlaşması’ndan I. Dünya Savaşı’na |

## 3. Duraklama dönemi (17. yüzyıl)

- **Neden:** Kapıkulu, tımar ve vergi düzeninin bozulması, padişahların zayıflığı ve saray entrikaları, **ekonomik sorunlar**, Coğrafi Keşiflerle gelir azalması, **Avrupa’nın teknolojik üstünlüğü**.
- **Celali isyanları:** Anadolu’da vergi ve düzen bozulunca çıkan isyanlar.
- **IV. Murat** döneminde Bağdat alındı (1638), devlet toparlandı.
- **Köprülüler dönemi:** Köprülü Mehmet Paşa ve oğlu Fazıl Ahmet Paşa Girit’i aldı (1669).
- **II. Viyana Kuşatması (1683):** **Kara Mustafa Paşa** başarısız oldu. **Kutsal İttifak** kuruldu, Osmanlı geri çekilmeye başladı.
- **Karlofça Antlaşması (1699):** Osmanlı’nın **ilk toprak kaybı** (Macaristan ve Transilvanya Avusturya’ya, Mora Venedik’e, Podolya Lehistan’a). **Osmanlı artık savunmaya geçti.**

## 4. Gerileme dönemi (18. yüzyıl)

- **Pasarofça Antlaşması (1718):** Kaybedilen topraklar. Ardından **Lale Devri** (1718 ile 1730, Sadrazam **Damat İbrahim Paşa**): Barış, eğlence ve Avrupa’ya yönelim, **ilk Türk matbaası** (**İbrahim Müteferrika**, 1727), Fransa’ya elçiler gönderildi, **Patrona Halil isyanı** (1730) ile bitti.
- **Küçük Kaynarca Antlaşması (1774):** Osmanlı-Rus savaşı sonrası imzalandı. Kırım bağımsız oldu, Rusya Osmanlı Hristiyanlarını (Ortodoks) koruma hakkı elde etti (**Osmanlı’nın iç işlerine karışma kapısı**). Rusya Karadeniz’e ulaştı. Rusya Kırım’ı **1783**’te topraklarına kattı.
- **Yaş Antlaşması (1792):** Rusya, Kırım’ı ve Karadeniz’in kuzeyini kesinleştirdi.
- Gerileme döneminde Osmanlı kuvvetle değil **diplomasiyle** ayakta kalmaya çalıştı (denge politikası).

## 5. Dağılma dönemi ve ıslahatlar

Osmanlı, çöküşü durdurmak için **Batı’yı örnek alarak** yenilik yaptı. İlk ıslahatlar **askerî alanda**, sonra yönetim, hukuk ve eğitimde yapıldı.

- **III. Selim (1789 ile 1807):** **Nizam-ı Cedid** (Yeni Düzen) ordusu kurdu, Avrupa’da daimi elçilikler açtı. Yeniçeriler ve ayanlar karşı çıktı, **Kabakçı Mustafa isyanı** ile tahttan indirildi.
- **II. Mahmud (1808 ile 1839):**
  - **Sened-i İttifak (1808):** Padişah ile ayanlar arasında yapılan sözleşme. Ayanlar padişahın otoritesini kabul etti. Padişahın yetkisini ilk kez sınırlayan belge olarak anılır.
  - **Vaka-i Hayriye (1826):** **Yeniçeri Ocağı kaldırıldı.** Yerine Asakir-i Mansure-i Muhammediye kuruldu.
  - Kıyafet ve eğitim yeniliği, **Tercüme Odası**, Mühendishane, gazete (Takvim-i Vekayi), **nüfus sayımı** ve **posta** teşkilatı.
- **Tanzimat Dönemi (1839 ile 1876):**
  - **Tanzimat Fermanı (Gülhane Hatt-ı Hümayunu, 1839)**, **Mustafa Reşit Paşa** hazırladı. Can, mal ve namus güvenliği, vergide eşitlik, düzenli askerlik, yargılamada eşitlik.
  - **Islahat Fermanı (1856):** Gayrimüslimlere ek haklar.
  - **Kırım Savaşı (1853 ile 1856)** ve **Paris Antlaşması (1856):** Osmanlı Avrupa devletlerinin yanında yer aldı, “Avrupa devletler topluluğu”na kabul edildi.
  - **Mecelle** (İslam hukukuna dayalı ilk medeni kanun), **Düyun-ı Umumiye** (1881, borçlar yönetimi), **Maarif Nezareti**, **Darülfünun**.
- **I. Meşrutiyet (1876):** **Kanun-ı Esasi** ilan edildi (**Mithat Paşa**, II. Abdülhamit). **Meclis-i Mebusan** açıldı. Ancak **93 Harbi (1877 ile 1878)** gerekçesiyle II. Abdülhamit meclisi kapattı (1878).

**Dağılma:** **Milliyetçilik** akımları ile Sırbistan, Yunanistan, Romanya, Bulgaristan bağımsızlığını aldı. **Yunan isyanı (1821)** sonunda Yunanistan kuruldu (1830). Mısır Valisi **Mehmet Ali Paşa** isyanı, **Berlin Antlaşması (1878)** ile Balkanlarda toprak kayıpları yaşandı.

:::neden-sonuc
- Coğrafi Keşifler yapılıyor => Ticaret yolları Atlantik’e kayar, Akdeniz’in önemi düşer.
- Fransız İhtilali yayılıyor => Milliyetçilik, Osmanlı’da azınlık isyanlarını artırır.
- Osmanlı ordusu yenileniyor => Yeniçeriler ve ayanlar karşı çıkar.
- Küçük Kaynarca imzalanıyor => Rusya’ya Ortodoksları koruma hakkı verilir, iç işlere karışma başlar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Karlofça (1699) ile Pasarofça (1718) antlaşmalarını karıştırma.** Karlofça ilk toprak kaybı ve gerilemenin başlangıcı, Pasarofça Lale Devri’ne açılan antlaşmadır. Bir de **Tanzimat Fermanı’nı Islahat Fermanı ile karıştırma**: Tanzimat 1839’da tüm halka haklar, Islahat 1856’da gayrimüslimlere ek haklar getirir. **Sened-i İttifak’ı yeni bir anayasa sanma**: Padişah ve ayan arasında bir sözleşmedir.
:::

:::baglanti
Bu konu, “Dünya Gücü Osmanlı” konusundaki yükselişin sonrasını anlatır. “Orta Çağ’da Dünya” konusunda gördüğün Rönesans ve Coğrafi Keşifler burada sonuçlarıyla yeniden karşına çıkar. “XX. Yüzyıl Başlarında Osmanlı ve Dünya” konusu, bu konunun sonundaki Meşrutiyet ve milliyetçilik hareketlerine bağlanır. Coğrafyada “Ulaşım Hatları” ve “Ekonomik Faaliyetler” konularındaki ticaret yolları bu değişimin zeminidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Coğrafi Keşifler | Ticaret Atlantik’e kaydı, sömürgecilik |
| Aydınlanma | Akıl, halk egemenliği, güçler ayrılığı |
| Sanayi İnkılabı | İngiltere, buhar makinesi |
| Fransız İhtilali | 1789, milliyetçilik |
| Karlofça | 1699, ilk toprak kaybı |
| Lale Devri | 1718 ile 1730, ilk matbaa |
| Küçük Kaynarca | 1774, Rusya iç işlere karışma |
| Vaka-i Hayriye | 1826, Yeniçeri kaldırıldı |
| Tanzimat | 1839 |
| I. Meşrutiyet | 1876, Kanun-ı Esasi |

## Mini test

:::soru{cevap="B"}
Osmanlı Devleti’nin Rusya’ya, Osmanlı sınırları içindeki Ortodoks Hristiyanları koruma hakkını tanıdığı ve Kırım’ı bağımsız kıldığı, Karadeniz’de Rusya’nın ilerlemesine zemin hazırlayan antlaşma aşağıdakilerden hangisidir?

- A) Karlofça Antlaşması
- B) Küçük Kaynarca Antlaşması
- C) Pasarofça Antlaşması
- D) Paris Antlaşması
- E) Berlin Antlaşması

---

1. Ortodoksları koruma hakkı ve Kırım'ın bağımsızlığı Küçük Kaynarca Antlaşması'nın (1774) maddeleridir.
2. Doğru cevap B.

Diğer şıklar: **Karlofça Antlaşması** Karlofça Avusturya, Venedik ve Lehistan ile yapıldı / **Pasarofça Antlaşması** Pasarofça Avusturya ve Venedik ile yapıldı / **Paris Antlaşması** Paris Antlaşması Kırım Savaşı’ndan sonra imzalandı / **Berlin Antlaşması** Berlin Antlaşması 93 Harbi’nden sonra yapıldı.
:::

:::soru{cevap="A"}
Osmanlı Devleti’nde padişah ile ayanlar arasında imzalanan, padişahın otoritesini ayanların kabul ettiği ve padişah yetkilerinin ilk kez sınırlandırıldığı belge aşağıdakilerden hangisidir?

- A) Sened-i İttifak
- B) Tanzimat Fermanı
- C) Islahat Fermanı
- D) Kanun-ı Esasi
- E) Vaka-i Hayriye

---

1. Sened-i İttifak 1808'de II. Mahmud ile ayanlar arasında imzalanmış bir sözleşmedir.
2. Padişahın yetkisini ilk kez sınırlayan belge olarak anılır. Doğru cevap A.

Diğer şıklar: **Tanzimat Fermanı** Tanzimat Fermanı padişahın tüm halka güvence verdiği fermandır / **Islahat Fermanı** Islahat Fermanı gayrimüslimlere haklar tanır / **Kanun-ı Esasi** Kanun-ı Esasi 1876’da ilan edilen anayasadır / **Vaka-i Hayriye** Vaka-i Hayriye Yeniçeri Ocağı’nın kaldırılmasıdır.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Coğrafi Keşiflerin Avrupa’da ortaya çıkardığı sonuçlardan biri **değildir**?

- A) Sömürgeciliğin ortaya çıkması
- B) Fiyatların yükselmesi
- C) Ticaret merkezlerinin Atlantik kıyılarına kayması
- D) Burjuva sınıfının güçlenmesi
- E) Akdeniz ticaretinin önem kazanması

---

1. Keşiflerle ticaret merkezi Akdeniz'den Atlantik'e kaydı, Akdeniz'in önemi azaldı.
2. Akdeniz ticaretinin önem kazanması bu sonuçlardan biri değildir. Doğru cevap E.

Diğer şıklar: **Sömürgeciliğin ortaya çıkması** keşifler sömürgeciliği doğurmuştur / **Fiyatların yükselmesi** altın ve gümüş akışı fiyatları yükseltmiştir / **Ticaret merkezlerinin Atlantik kıyılarına kayması** ticaret Atlantik’e kaymıştır / **Burjuva sınıfının güçlenmesi** ticaret burjuvayı güçlendirmiştir.
:::

:::soru{cevap="B"}
Osmanlı Devleti’nin ilk toprak kaybına yol açan Karlofça Antlaşması hangi yılda imzalanmıştır?

- A) 1683
- B) 1699
- C) 1700
- D) 1718
- E) 1774

---

1. Karlofça Antlaşması 1699'da imzalanmıştır.
2. 1718 Pasarofça, 1683 II. Viyana Kuşatması, 1774 Küçük Kaynarca'dır. Doğru cevap B.

Diğer şıklar: **1683** II. Viyana Kuşatması’nın yılı alınmış / **1700** işlem hatasıyla bir fazla bulunmuş / **1718** Pasarofça Antlaşması’nın yılı alınmış / **1774** Küçük Kaynarca’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. Osmanlı’nın ilk toprak kaybı hangi antlaşmayla olmuştur? => Karlofça (1699).
2. Yeniçeri Ocağı hangi olayla kaldırılmıştır? => Vaka-i Hayriye (1826).
3. Padişahın yetkisini ilk sınırlayan belge hangisidir? => Sened-i İttifak (1808).
4. İlk Türk matbaası kim tarafından kurulmuştur? => İbrahim Müteferrika.
5. Kanun-ı Esasi hangi yıl ilan edilmiştir? => 1876.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'Değişim Çağında Avrupa ve Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Coğrafi Keşifler, Rönesans, Reform, Aydınlanma, Sanayi İnkılabı, Fransız İhtilali, Osmanlı'nın dönemleri, duraklama, gerileme ve dağılma, III. Selim, II. Mahmud, Tanzimat, I. Meşrutiyet. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (1699, 1718, 1727, 1774, 1783, 1792, 1808, 1826, 1839, 1856, 1876, 1878) ders kitabı bilgileridir.
Kontrol edilecekler: Osmanlı dönemlerinin sınırları ders kitaplarında farklı verilebilir (duraklamanın 1580 ile 1595 arasında başlaması). Yunan isyanı ve bağımsızlık tarihleri ayrıntılı yazılmadı. Mecelle ve Düyun-ı Umumiye tarihleri kaynakla teyit edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Değişim Çağında Avrupa ve Osmanlı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

20. yüzyılın başında Osmanlı hem içte hem dışta büyük sınavlardan geçti. İçte **II. Meşrutiyet** ile yeni bir yönetim kurulurken dışta Trablusgarp ve Balkan Savaşları toprak kayıplarına yol açtı. Sonra dünya tarihin en büyük savaşına, **I. Dünya Savaşı**’na sürüklendi. Bu konuda **II. Meşrutiyet’i**, **Trablusgarp ve Balkan Savaşları’nı**, **I. Dünya Savaşı’nın nedenlerini ve cephelerini**, Osmanlı’nın savaşa girişini, **Çanakkale’yi** ve **Mondros Mütarekesi**’ni öğreneceksin.

:::hedefler
1. II. Meşrutiyet’in ilanını ve önemli gelişmelerini açıklamak.
2. Trablusgarp ve Balkan Savaşları’nın sonuçlarını söylemek.
3. I. Dünya Savaşı’nın nedenlerini ve tarafları sıralamak.
4. Osmanlı’nın savaşa katılışını ve cepheleri sıralamak.
5. Çanakkale Savaşları’nın önemini ve Mondros Mütarekesi’nin sonuçlarını açıklamak.
:::

## 1. II. Meşrutiyet (1908)

- **Jön Türkler** ve **İttihat ve Terakki Cemiyeti**, II. Abdülhamit’in baskıcı yönetimine karşı çıktı.
- **1908’de** Makedonya’daki subaylar ayaklandı (**Niyazi Bey, Enver Bey**). Abdülhamit **Kanun-ı Esasi’yi yeniden yürürlüğe koydu**, Meclis-i Mebusan açıldı. Bu olaya **II. Meşrutiyet** denir.
- **31 Mart Vakası (1909):** Meşrutiyet karşıtı bir ayaklanma çıktı, **Hareket Ordusu** bastırdı. II. Abdülhamit tahttan indirildi, yerine **V. Mehmet Reşat** geçti.
- **Fikir akımları:** Osmanlıcılık, İslamcılık, Türkçülük, Batıcılık. Devleti kurtarma yolları tartışıldı.
- **Dış gelişme:** Meşrutiyet ilanından hemen sonra **Bulgaristan bağımsızlığını** ilan etti, **Avusturya Bosna-Hersek’i** topraklarına kattı, **Girit** Yunanistan’a bağlanmak istedi.

## 2. Trablusgarp ve Balkan Savaşları

**Trablusgarp Savaşı (1911 ile 1912):** İtalya, Osmanlı’nın Kuzey Afrika’daki topraklarına saldırdı. Osmanlı donanma gönderemedi. **Mustafa Kemal, Enver Bey** gibi subaylar gönüllü olarak savaştı. **Uşi (Ouchy) Antlaşması (1912)** ile Trablusgarp ve Bingazi İtalya’ya bırakıldı (fiilen). **On İki Ada** İtalya’da kaldı.

**Balkan Savaşları:**

- **I. Balkan Savaşı (1912 ile 1913):** Bulgaristan, Sırbistan, Yunanistan ve Karadağ **Balkan Birliği** kurup Osmanlı’ya saldırdı. Osmanlı yenildi, **Edirne’yi** Bulgarlara bıraktı. **Londra Antlaşması (1913)** imzalandı. Rumeli’de Osmanlı toprakları neredeyse kaybedildi.
- **II. Balkan Savaşı (1913):** Balkan devletleri ganimet yüzünden birbirine girdi. Osmanlı bundan yararlanıp **Edirne’yi geri aldı**. **İstanbul Antlaşması (1913)** ile Edirne ve Kırklareli yeniden Osmanlı’ya kaldı.

**Sonuçlar:** Osmanlı Balkanlardaki topraklarının neredeyse tamamını yitirdi, **Rumeli’den Anadolu’ya göç** arttı. **Osmanlıcılık** fikri zayıfladı, **Türkçülük** güçlendi.

## 3. I. Dünya Savaşı’nın nedenleri

**Uzak nedenler:**

- **Sömürge ve pazar rekabeti** (Almanya, İngiltere, Fransa).
- **Silahlanma yarışı** ve **militarizm**.
- **Milliyetçilik:** Balkanlarda Slavlar, Fransa-Almanya (Alsace-Lorraine) çekişmesi.
- **Bloklaşma:** **İtilaf Devletleri** (İngiltere, Fransa, Rusya) ve **İttifak Devletleri** (Almanya, Avusturya-Macaristan, İtalya, sonra Osmanlı, Bulgaristan). İtalya sonradan İtilaf tarafına geçti.
- **Doğu Sorunu:** Osmanlı topraklarının paylaşılması.

**Yakın neden:** **28 Haziran 1914’te** Avusturya-Macaristan Prensi **Ferdinand’ın** Saraybosna’da bir Sırp milliyetçisi tarafından öldürülmesi (**Saraybosna Suikastı**). Avusturya Sırbistan’a savaş açtı, ittifaklar yüzünden savaş büyüdü.

## 4. Osmanlı’nın savaşa girişi

- Osmanlı başlangıçta tarafsız kalmak istedi ama Balkan yenilgileri sonrası **Almanya ile gizli ittifak** yaptı (Ağustos 1914).
- Almanya’ya ait **Goeben ve Breslau** gemileri Osmanlı’ya devredildi.
- **29 Ekim 1914’te** Osmanlı donanması Rus limanlarını bombaladı. Rusya, İngiltere ve Fransa savaş ilan etti. Osmanlı savaşa **İttifak Devletleri** yanında girdi.

## 5. Osmanlı’nın savaştığı cepheler

| Cephe | Karşı taraf | Önemli olay |
| --- | --- | --- |
| **Kafkas** | Rusya | Sarıkamış Harekâtı (1914 ile 1915), soğuk ve kötü şartlarda büyük kayıp |
| **Kanal (Mısır)** | İngiltere | Süveyş Kanalı’nı almak amacıyla yapıldı, başarısız |
| **Irak** | İngiltere | **Kut’ül Amare (1916)** Osmanlı zaferi |
| **Çanakkale** | İngiltere, Fransa | Boğazları geçip İstanbul’u almak isteyen İtilaf’ın yenilgisi |
| **Filistin ve Suriye** | İngiltere, Arap isyanı | Kudüs ve Şam kaybedildi |
| **Hicaz** | İngiltere, Arap isyanı | Arap isyanı (1916), Medine direnişi |
| **Galiçya, Romanya, Makedonya** | Rusya, Romanya, İtilaf | Müttefiklere destek olarak asker gönderildi |

### Çanakkale Savaşları (1915)

- **Amaç:** İtilaf Devletleri, İstanbul’u almak, **Rusya ile bağlantı kurmak** ve Osmanlı’yı savaş dışı bırakmak istedi.
- **18 Mart 1915 Deniz Savaşı:** İtilaf donanması boğazı **geçemedi**, birçok gemisini yitirdi. **Nusret mayın gemisi** önemli rol oynadı.
- **25 Nisan 1915’ten sonra kara savaşları:** İtilaf kuvvetleri Gelibolu Yarımadası’na çıkarma yaptı. **Seddülbahir, Arıburnu, Conkbayırı, Anafartalar** çarpışmaları. Albay **Mustafa Kemal** Conkbayırı ve Anafartalar’da önemli rol oynadı.
- **Sonuç:** İtilaf kuvvetleri geri çekildi (Ocak 1916). **Osmanlı** büyük bir zafer kazandı.
- **Önem:** Rusya’ya yardım ulaştırılamadı, Rusya içinde **1917 Bolşevik İhtilali**ne giden süreç hızlandı. Türk milletine moral ve **Mustafa Kemal**’in ünü arttı.

## 6. Savaşın sonu

- **1917:** Rusya’da **Bolşevik İhtilali**, Rusya savaştan çekildi. **ABD** İtilaf tarafında savaşa girdi.
- **1918:** **Brest-Litovsk Antlaşması** (Rusya ile Almanya) imzalandı. ABD Başkanı **Wilson** barış için “**Wilson İlkeleri**”ni açıkladı (milletlerin kendi geleceğini belirlemesi).
- **Almanya ateşkes istedi.** Osmanlı’nın müttefikleri yenildi.
- **Mondros Mütarekesi (30 Ekim 1918):** Osmanlı’nın savaştan çekilişi. **Boğazlar açıldı**, orduyu terhis etti, İtilaf devletleri **stratejik noktaları işgal edebilecekti** (**7. madde**). Bu madde sonraki işgallerin dayanağı oldu.
- **Paris Barış Konferansı ve Versay Antlaşması (1919):** Galip devletler Almanya ile barış yaptı.

:::neden-sonuc
- Balkan Savaşları’nda toprak kaybediliyor => Osmanlıcılık zayıflar, Türkçülük güçlenir.
- Çanakkale’de İtilaf başarısız oluyor => Rusya’ya yardım gidemez, Osmanlı moral kazanır.
- Rusya’da Bolşevik İhtilali oluyor => Rusya savaştan çekilir.
- Mondros imzalanıyor => Osmanlı fiilen teslim olur, İtilaf işgalleri başlar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Trablusgarp (1911) ile Balkan Savaşları’nı (1912 ile 1913) karıştırma.** Trablusgarp’ta düşman İtalya, Balkan Savaşları’nda Balkan devletleridir. **I. ve II. Balkan Savaşlarını ayırma**: Edirne birincisinde kaybedilmiş, ikincisinde geri alınmıştır. **Mondros ile Mudanya’yı karıştırma**: Mondros 1918’de savaşı bitirir, Mudanya 1922’de Milli Mücadele’nin sonunda imzalanır.
:::

:::baglanti
Bu konu, “Değişim Çağında Avrupa ve Osmanlı” konusundaki ıslahatların ve milliyetçiliğin sonucunu gösterir. “Milli Mücadele” konusu, Mondros Mütarekesi’yle başlar. “Atatürkçülük ve Türk İnkılabı” konusunda Mustafa Kemal’in Çanakkale’deki rolü tanıtılır. Edebiyatta “Milli Edebiyat” dönemi bu dönemin fikir akımlarıyla ilişkilidir. Coğrafyada “Coğrafi Konum” konusundaki Boğazların önemi Çanakkale’yi açıklar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| II. Meşrutiyet | 1908, Kanun-ı Esasi yeniden |
| 31 Mart Vakası | 1909, Abdülhamit tahttan indirildi |
| Trablusgarp | 1911 ile 1912, İtalya, Uşi |
| Balkan Savaşları | 1912 ile 1913, Edirne |
| Saraybosna suikastı | 28 Haziran 1914 |
| Osmanlı’nın savaşa girişi | 29 Ekim 1914 |
| Çanakkale | 1915, İtilaf yenildi |
| Mondros | 30 Ekim 1918 |

## Mini test

:::soru{cevap="D"}
I. Dünya Savaşı’nın yakın nedeni olan ve Avusturya-Macaristan Prensi Ferdinand’ın bir Sırp milliyetçisi tarafından öldürüldüğü olay aşağıdakilerden hangisidir?

- A) 31 Mart Vakası
- B) Bosna-Hersek’in ilhakı
- C) Ağustos Gizli İttifakı
- D) Saraybosna Suikastı
- E) Balkan Birliği’nin kurulması

---

1. Saraybosna Suikastı (28 Haziran 1914) savaşın başlamasına yol açan olaydır.
2. Doğru cevap D.

Diğer şıklar: **31 Mart Vakası** 31 Mart Vakası Osmanlı’da çıkan ayaklanmadır / **Bosna-Hersek’in ilhakı** ilhak Avusturya-Macaristan’ın 1908’de yaptığı işlemdir / **Ağustos Gizli İttifakı** bu ittifak Osmanlı ile Almanya arasında yapıldı / **Balkan Birliği’nin kurulması** Balkan Birliği Balkan Savaşları’nın öncesinde kuruldu.
:::

:::soru{cevap="B"}
Aşağıdaki gelişmelerden hangisi Çanakkale Savaşları’nın sonuçlarından biri **değildir**?

- A) İtilaf Devletleri’nin Rusya’ya yardım ulaştıramaması
- B) Osmanlı Devleti’nin Balkanlardaki kayıplarını geri alması
- C) Mustafa Kemal’in tanınmaya başlanması
- D) İstanbul’un işgalinin ertelenmesi
- E) Türk milletinin moral kazanması

---

1. Çanakkale zaferi Balkan kayıplarını geri getirmedi.
2. Diğer seçenekler savaşın sonuçlarındandır. Doğru cevap B.

Diğer şıklar: **İtilaf Devletleri’nin Rusya’ya yardım ulaştıramaması** Boğazlar açılamadığı için yardım ulaştırılamadı / **Mustafa Kemal’in tanınmaya başlanması** Conkbayırı ve Anafartalar Mustafa Kemal’in tanınmasını sağladı / **İstanbul’un işgalinin ertelenmesi** savaş İstanbul’un işgalini geciktirdi / **Türk milletinin moral kazanması** zafer moral kaynağı oldu.
:::

:::soru{cevap="E"}
Osmanlı Devleti, Rumeli’deki topraklarının çoğunu kaybettiği I. Balkan Savaşı’ndan sonra yapılan II. Balkan Savaşı’nda hangi şehri geri almıştır?

- A) Selanik
- B) Üsküp
- C) Manastır
- D) Trablusgarp
- E) Edirne

---

1. Balkan devletleri ganimet yüzünden birbirine girince Osmanlı Edirne'yi geri aldı.
2. İstanbul Antlaşması (1913) bunu belgeledi. Doğru cevap E.

Diğer şıklar: **Selanik** Selanik I. Balkan Savaşı’nda Yunanistan’a geçti / **Üsküp** Üsküp Sırbistan’ın eline geçti / **Manastır** Manastır Osmanlı’dan alındı, geri alınmadı / **Trablusgarp** Trablusgarp İtalya ile savaşın konusudur.
:::

:::soru{cevap="D"}
Osmanlı Devleti’nin I. Dünya Savaşı’na İttifak Devletleri yanında girmesine neden olan Karadeniz’deki Rus limanlarının bombalanması hangi yılda gerçekleşmiştir?

- A) 1911
- B) 1912
- C) 1913
- D) 1914
- E) 1915

---

1. Osmanlı donanması 29 Ekim 1914'te Rus limanlarını bombalamış ve savaşa girmiştir.
2. 1915 Çanakkale, 1918 Mondros, 1912 Balkan Savaşları'nın başlangıcıdır. Doğru cevap D.

Diğer şıklar: **1911** işlem hatasıyla üç eksik bulunmuş / **1912** Balkan Savaşları’nın başladığı yıl alınmış / **1913** işlem hatasıyla bir eksik bulunmuş / **1915** Çanakkale Savaşları’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. II. Meşrutiyet hangi yıl ilan edildi? => 1908.
2. I. Dünya Savaşı’nın yakın nedeni nedir? => Saraybosna Suikastı.
3. Osmanlı hangi tarafta savaşa girdi? => İttifak Devletleri yanında.
4. Çanakkale Deniz Savaşı hangi tarihte olmuştur? => 18 Mart 1915.
5. Mondros Mütarekesi hangi tarihte imzalandı? => 30 Ekim 1918.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: II. Meşrutiyet, 31 Mart Vakası, Trablusgarp Savaşı, Balkan Savaşları, I. Dünya Savaşı'nın nedenleri ve cepheleri, Osmanlı'nın savaşa girişi, Çanakkale, Mondros Mütarekesi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler (1908, 1909, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918) ders kitabı bilgileridir.
Kontrol edilecekler: Tehcir ve Ermeni meselesi metinde kasıtlı olarak yer almadı, ders kitabındaki ilgili bölüm yayın öncesi ayrıca gözden geçirilmeli. Uşi Antlaşması ayrıntıları (Trablusgarp'ın fiili devri) sadeleştirildi. Mondros 7. madde bilgisi teyit edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Mondros Mütarekesi’nden sonra Osmanlı fiilen teslim olmuştu. İtilaf devletleri ülkenin her yerinde işgale başladı, İstanbul’da hükümet güçsüzdü. Bu karanlık tabloda Anadolu’da bir direniş doğdu. **Mustafa Kemal Paşa’nın** önderliğinde kurulan direnişle önce işgaller durduruldu, ardından **Türkiye Büyük Millet Meclisi** kuruldu ve **Büyük Taarruz** ile düşman Anadolu’dan atıldı. Bu konuda **işgalleri**, **Kuva-yi Milliye’yi**, **kongreleri**, **TBMM’nin açılışını**, **cepheleri** ve **Lozan Barış Antlaşması**’nı öğreneceksin.

:::hedefler
1. İtilaf devletlerinin işgallerini ve Anadolu’daki tepkileri sıralamak.
2. Mustafa Kemal’in Samsun’a çıkışından Sivas Kongresi’ne kadar olan gelişmeleri açıklamak.
3. TBMM’nin açılışını ve Sevr’e karşı direnişi anlatmak.
4. Doğu, Güney ve Batı cephelerindeki gelişmeleri sıralamak.
5. Büyük Taarruz, Mudanya ve Lozan’ın sonuçlarını söylemek.
:::

## 1. İşgaller ve direniş

Mondros’un 7. maddesine dayanarak İtilaf devletleri Anadolu’yu işgale başladı:

- **İngilizler:** Musul, Antep, Urfa, Maraş, Samsun, Merzifon.
- **Fransızlar:** Adana, Mersin, Antep, Maraş, Urfa.
- **İtalyanlar:** Antalya, Konya, Muğla çevresi.
- **Yunanlılar:** **15 Mayıs 1919’da İzmir**’i işgal etti.
- **Ermeniler** doğuda, **Rumlar** Karadeniz’de çete faaliyetleri yürüttü.

**İzmir’in işgali** halkta büyük bir tepki uyandırdı, yurdun her yerinde **mitingler** düzenlendi. Direniş **Kuva-yi Milliye** adıyla başladı. Bu, düzenli ordu olmayan, **halkın örgütlediği milis kuvvetlerdir**. Ayrıca **Müdafaa-i Hukuk** ve **Redd-i İlhak** cemiyetleri kuruldu. Bu cemiyetler işgale karşı hukuki ve siyasi mücadele yürüttü.

## 2. Mustafa Kemal’in Anadolu’ya geçişi

- **19 Mayıs 1919:** Mustafa Kemal, 9. Ordu Müfettişi olarak **Samsun**’a çıktı. Milli Mücadele’nin başlangıcı kabul edilir.
- **Havza Genelgesi (Mayıs 1919):** Mitinglerle protesto çağrısı.
- **Amasya Genelgesi (22 Haziran 1919):** Genelgede vatanın bütünlüğünün ve milletin istiklalinin tehlikede olduğu, İstanbul hükümetinin görevini yapamadığı belirtilir ve **“Milletin istiklalini yine milletin azim ve kararı kurtaracaktır”** denir. Bu belge, **millî egemenliğe dayalı** yeni bir yönetim kurmanın başlangıcıdır. Sivas’ta kongre toplanması kararlaştırıldı.
- **Erzurum Kongresi (23 Temmuz ile 7 Ağustos 1919):** Doğu illerinin temsilcileriyle yapıldı (bölgesel). Kararlar: Vatan bütündür, **manda ve himayeyi kabul etmeyiz**, millî iradeyi hâkim kılmak esastır, **Heyet-i Temsiliye** seçildi.
- **Sivas Kongresi (4 ile 11 Eylül 1919):** Ülke genelini temsil eden **ulusal** kongredir. Cemiyetler **Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti** adı altında birleştirildi. Manda ve himaye kesin olarak reddedildi. Heyet-i Temsiliye ülke yönetimine yetkili oldu.
- **Amasya Görüşmeleri ve Protokolü (Ekim 1919):** İstanbul hükümetinin Heyet-i Temsiliye’yi **ilk kez tanıdığı** görüşmelerdir. Bu, İstanbul hükümetinin Anadolu hareketini resmen kabul etmesidir.

## 3. Misak-ı Millî ve TBMM

- **Son Osmanlı Mebusan Meclisi (12 Ocak 1920)** İstanbul’da toplandı, **28 Ocak 1920’de Misak-ı Millî**’yi (Milli Ahit) kabul etti. Milli sınırlar çizildi: Mondros ateşkesi sırasında Osmanlı sınırları içinde **Türk çoğunluğun yaşadığı yerler bölünmez bir bütündür.**
- **16 Mart 1920:** İtilaf devletleri **İstanbul’u resmen işgal etti**, bazı mebuslar tutuklandı, Meclis kapatıldı.
- **23 Nisan 1920:** **Ankara’da TBMM açıldı.** Başkanı Mustafa Kemal. Meclis **hem yasama hem yürütme gücünü** elinde topladı (**meclis hükümeti** sistemi). **Millî egemenlik** ilkesi benimsendi.
- **10 Ağustos 1920: Sevr Antlaşması** İstanbul hükümetince imzalandı. Anadolu parçalanıyordu. TBMM bu antlaşmayı **tanımadı**, uygulanamadı.
- **20 Ocak 1921:** İlk anayasa **Teşkilat-ı Esasiye Kanunu** kabul edildi. “Hâkimiyet bilâ kayd ü şart milletindir” ilkesi yer aldı.

## 4. İç isyanlar ve cepheler

**İç isyanlar:** İstanbul hükümetinin ve itilaf devletlerinin teşvikiyle çıkan isyanlar (Ahmet Anzavur, Çerkez Ethem vb.) **Kuva-yi Milliye** ile **düzenli ordu** kurularak bastırıldı. Çerkez Ethem’in Kuva-yi Milliye’si düzenli orduya katılmak istemedi ve dağıtıldı.

### Doğu Cephesi

- **Ermenilere karşı** Kâzım Karabekir komutasında Sarıkamış, Kars ve Gümrü alındı.
- **Gümrü Antlaşması (Aralık 1920):** TBMM’nin imzaladığı **ilk antlaşma**dır. Doğu sınırı belirlendi.

### Güney Cephesi

- **Fransızlara karşı** Antep, Maraş, Urfa halkı kahramanca direndi. Bu şehirlere sonradan **Gazi, Kahraman, Şanlı** unvanları verildi.
- **Ankara Antlaşması (20 Ekim 1921):** Fransa, TBMM’yi **resmen tanıyan ilk Batılı devlet** oldu. Güney sınırı belirlendi.

### Batı Cephesi

- **Kuva-yi Milliye** döneminde Yunanlıya karşı direniş.
- **I. İnönü Savaşı (Ocak 1921):** Düzenli ordunun **ilk zaferi**. Kuva-yi Milliye döneminin sonu. **Moskova Antlaşması (Mart 1921)** ile doğu sınırı Sovyetler Birliği ile de belirlendi.
- **II. İnönü Savaşı (Mart 1921):** Yunan ordusu yeniden yenildi.
- **Kütahya-Eskişehir Savaşları (Temmuz 1921):** Türk ordusu yenilerek **Sakarya Nehri’nin doğusuna** çekildi. TBMM, **Mustafa Kemal’i Başkomutan** seçti (5 Ağustos 1921). Yetkiler **olağanüstü** hale getirildi.
- **Sakarya Meydan Muharebesi (23 Ağustos ile 13 Eylül 1921):** 22 gün süren savaşta Yunan ordusu geri püskürtüldü. **“Hattı müdafaa yoktur, sathı müdafaa vardır. O satıh bütün vatandır.”** Savaş sonunda **Mareşal** rütbesi ve **Gazi** unvanı verildi. Yunan ordusu taarruz gücünü yitirdi, savunmaya geçti.
- **Büyük Taarruz (26 Ağustos 1922):** Afyon Kocatepe’den başlatıldı. **Başkomutan Meydan Muharebesi (30 Ağustos 1922)** Dumlupınar’da Yunan ordusu yok edildi. **9 Eylül 1922’de İzmir** kurtarıldı. “Ordular, ilk hedefiniz Akdeniz’dir, ileri!” emri verildi.

## 5. Mudanya ve Lozan

- **Mudanya Ateşkes Antlaşması (11 Ekim 1922):** Yunanistan ve İtilaf devletleriyle imzalandı. **Doğu Trakya ve Edirne** Türklere bırakıldı. **Savaş fiilen bitti.**
- **Saltanatın kaldırılması (1 Kasım 1922):** İstanbul hükümeti ve saltanat sona erdi. Osmanlı yönetimi tarihe karıştı. **Vahdettin** ülkeyi terk etti, **Abdülmecit** halife seçildi.
- **Lozan Barış Antlaşması (24 Temmuz 1923):** Baş delege **İsmet (İnönü) Paşa**. **Yeni Türkiye Devleti’nin** sınırları uluslararası alanda tanındı. **Kapitülasyonlar kaldırıldı.** Boğazlar demilitarize edildi, Musul sorunu ertelendi. **Sevr geçersiz oldu.**

:::neden-sonuc
- İzmir işgal ediliyor => Halk mitinglerle tepki gösterir, direniş örgütlenir.
- Mustafa Kemal Samsun’a çıkıyor => Millî Mücadele başlar.
- İstanbul işgal ediliyor => Meclis Ankara’da toplanır, TBMM açılır.
- Sakarya kazanılıyor => Yunan ordusu taarruz gücünü yitirir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Erzurum ile Sivas Kongresi’ni karıştırma.** Erzurum doğu illeri için bölgesel, Sivas ülke genelini kapsayan ulusal kongredir. **Mudanya’yı Lozan ile karıştırma**: Mudanya ateşkes, Lozan barış antlaşmasıdır. **Gümrü Antlaşması ile Ankara Antlaşması’nı karıştırma**: Gümrü doğuda Ermenistan ile, Ankara güneyde Fransa ile yapılmıştır. **Saltanatın kaldırılmasını Cumhuriyet’in ilanı ile karıştırma**: 1922 ve 1923’tür.
:::

:::baglanti
Bu konu, “XX. Yüzyıl Başlarında Osmanlı ve Dünya” konusundaki Mondros’la başlar. “Atatürkçülük ve Türk İnkılabı” konusu, Lozan sonrası Cumhuriyet’in kuruluşunu ve inkılapları anlatır. Coğrafyada “Harita Bilgisi” ve “Coğrafi Konum” konularındaki sınırlar ve Boğazlar Lozan’ın konusudur. Edebiyatta “Milli Edebiyat” ve “Cumhuriyet Dönemi” bu dönemin şiir ve romanlarını kapsar.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İzmir’in işgali | 15 Mayıs 1919, Yunanlılar |
| Samsun’a çıkış | 19 Mayıs 1919 |
| Amasya Genelgesi | 22 Haziran 1919, “milletin istiklalini yine millet kurtaracak” |
| Erzurum Kongresi | 1919, bölgesel |
| Sivas Kongresi | 1919, ulusal |
| TBMM | 23 Nisan 1920 |
| Sakarya | 1921, Mustafa Kemal Başkomutan |
| Büyük Taarruz | 26 Ağustos 1922 |
| Mudanya | 11 Ekim 1922 |
| Lozan | 24 Temmuz 1923 |

## Mini test

:::soru{cevap="D"}
Mustafa Kemal Paşa’nın kaleme aldığı ve “Milletin istiklalini yine milletin azim ve kararı kurtaracaktır.” cümlesinin yer aldığı, millî egemenliğe dayalı yeni bir yönetimin kurulması yolunda ilk adım sayılan belge aşağıdakilerden hangisidir?

- A) Havza Genelgesi
- B) Erzurum Kongresi Kararları
- C) Misak-ı Millî
- D) Amasya Genelgesi
- E) Teşkilat-ı Esasiye Kanunu

---

1. Bu cümle 22 Haziran 1919 tarihli Amasya Genelgesi'nde yer alır.
2. Genelge millî egemenliğe dayalı yeni yönetimin başlangıcı sayılır. Doğru cevap D.

Diğer şıklar: **Havza Genelgesi** Havza Genelgesi mitingler düzenlenmesini istemiştir / **Erzurum Kongresi Kararları** bu kararlar doğu illerinin kongresinde alındı / **Misak-ı Millî** Misak-ı Millî Mebusan Meclisi’nde kabul edildi / **Teşkilat-ı Esasiye Kanunu** Teşkilat-ı Esasiye 1921’de kabul edilen ilk anayasadır.
:::

:::soru{cevap="D"}
Aşağıdaki gelişmelerin eskiden yeniye doğru sıralanışı hangisinde doğru verilmiştir?

- A) Sivas Kongresi, İzmir’in işgali, TBMM’nin açılışı, Sakarya Meydan Muharebesi
- B) İzmir’in işgali, TBMM’nin açılışı, Sivas Kongresi, Sakarya Meydan Muharebesi
- C) İzmir’in işgali, Sivas Kongresi, Sakarya Meydan Muharebesi, TBMM’nin açılışı
- D) İzmir’in işgali, Sivas Kongresi, TBMM’nin açılışı, Sakarya Meydan Muharebesi
- E) TBMM’nin açılışı, İzmir’in işgali, Sivas Kongresi, Sakarya Meydan Muharebesi

---

1. İzmir 15 Mayıs 1919'da işgal edildi, Sivas Kongresi Eylül 1919'da yapıldı.
2. TBMM 23 Nisan 1920'de açıldı, Sakarya Meydan Muharebesi 1921'de yapıldı. Doğru cevap D.

Diğer şıklar: **Sivas Kongresi, İzmir’in işgali, TBMM’nin açılışı, Sakarya Meydan Muharebesi** İzmir’in işgali Sivas Kongresi’nden önce / **İzmir’in işgali, TBMM’nin açılışı, Sivas Kongresi, Sakarya Meydan Muharebesi** Sivas Kongresi TBMM’den önce / **İzmir’in işgali, Sivas Kongresi, Sakarya Meydan Muharebesi, TBMM’nin açılışı** Sakarya Meydan Muharebesi TBMM’nin açılışından sonra / **TBMM’nin açılışı, İzmir’in işgali, Sivas Kongresi, Sakarya Meydan Muharebesi** TBMM İzmir’in işgalinden sonra açıldı.
:::

:::soru{cevap="C"}
TBMM’nin imzaladığı ilk antlaşma ile TBMM’yi resmen tanıyan ilk Batılı devletle yapılan antlaşma sırasıyla aşağıdakilerden hangisinde doğru verilmiştir?

- A) Ankara Antlaşması ve Gümrü Antlaşması
- B) Moskova Antlaşması ve Mudanya Ateşkesi
- C) Gümrü Antlaşması ve Ankara Antlaşması
- D) Sevr Antlaşması ve Lozan Antlaşması
- E) Lozan Antlaşması ve Mudanya Ateşkesi

---

1. Gümrü Antlaşması (Aralık 1920) Ermenistan ile yapılan, TBMM'nin ilk antlaşmasıdır.
2. Ankara Antlaşması (1921) ile Fransa TBMM'yi tanıyan ilk Batılı devlet olmuştur. Doğru cevap C.

Diğer şıklar: **Ankara Antlaşması ve Gümrü Antlaşması** sıralama ters verilmiş / **Moskova Antlaşması ve Mudanya Ateşkesi** Mudanya Ateşkesi Yunanistan ve İtilaf ile yapıldı / **Sevr Antlaşması ve Lozan Antlaşması** Sevr TBMM’nin tanımadığı antlaşmadır / **Lozan Antlaşması ve Mudanya Ateşkesi** Lozan en son imzalandı.
:::

:::soru{cevap="D"}
Yunan ordusunun Anadolu’da yok edildiği, Başkomutan Meydan Muharebesi’nin yapıldığı ve İzmir’in kurtarıldığı Büyük Taarruz hangi yılda başlamıştır?

- A) 1919
- B) 1920
- C) 1921
- D) 1922
- E) 1923

---

1. Büyük Taarruz 26 Ağustos 1922'de Afyon'da başlamıştır.
2. 1921 Sakarya, 1923 Lozan, 1920 TBMM'nin açılışıdır. Doğru cevap D.

Diğer şıklar: **1919** işlem hatasıyla üç eksik bulunmuş / **1920** TBMM’nin açılış yılı alınmış / **1921** Sakarya Meydan Muharebesi’nin yılı alınmış / **1923** Lozan Antlaşması’nın yılı alınmış.
:::

## Kendini dene

:::dene
1. Milli Mücadele hangi olayla başlar? => Mustafa Kemal’in Samsun’a çıkışı (19 Mayıs 1919).
2. TBMM hangi tarihte açılmıştır? => 23 Nisan 1920.
3. Düzenli ordunun ilk zaferi hangisidir? => I. İnönü Savaşı.
4. Savaşı fiilen bitiren ateşkes hangisidir? => Mudanya Ateşkesi.
5. Kapitülasyonlar hangi antlaşmayla kaldırıldı? => Lozan.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-tar' and name = 'Milli Mücadele'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Mondros sonrası işgaller, Kuva-yi Milliye, Mustafa Kemal'in Samsun'a çıkışı, genelgeler, Erzurum ve Sivas kongreleri, Misak-ı Millî, TBMM, cepheler, Sakarya, Büyük Taarruz, Mudanya, Lozan. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler ders kitabı bilgileridir.
Kontrol edilecekler: Amasya Genelgesi alıntısı ve Sakarya sözü ders kitabı ifadesiyle karşılaştırılmalı. İşgal edilen şehirlerin listesi sadeleştirildi. Lozan maddeleri (kapitülasyonlar, Boğazlar, Musul) kısaltıldı.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Milli Mücadele'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Milli Mücadele’yi kazanmak yeni Türkiye’yi kurmak için yeterli değildi. Ülkeyi çağdaş uygarlık düzeyine ulaştıracak köklü bir dönüşüm gerekiyordu. **Cumhuriyet** ilan edildi, **saltanat ve halifelik** kaldırıldı, hukuk, eğitim, toplum yaşamı ve ekonomi yeniden düzenlendi. Bu konuda **Cumhuriyet’in kuruluşunu**, **Atatürk ilkelerini**, siyasi, hukuk, eğitim, toplumsal ve ekonomik **inkılapları** ve Atatürk dönemi **dış politikasını** öğreneceksin.

:::hedefler
1. Cumhuriyet’in ilanını ve siyasi alandaki inkılapları sıralamak.
2. Atatürk ilkelerini (altı ilke) ve anlamlarını açıklamak.
3. Hukuk, eğitim ve kültür, toplumsal ve ekonomik alandaki inkılapları ayırt etmek.
4. İnkılapların nedenlerini ve sonuçlarını yorumlamak.
5. Atatürk dönemi dış politikasının ilkelerini ve önemli gelişmelerini söylemek.
:::

## 1. Siyasi alandaki gelişmeler

- **Saltanatın kaldırılması (1 Kasım 1922):** Osmanlı saltanatı sona erdi. Egemenlik kayıtsız şartsız millete geçti.
- **Cumhuriyet’in ilanı (29 Ekim 1923):** Rejim cumhuriyet oldu. **Mustafa Kemal ilk cumhurbaşkanı**, **İsmet İnönü** ilk başbakan oldu. Başkent **Ankara** (13 Ekim 1923).
- **Halifeliğin kaldırılması (3 Mart 1924):** Halifelik kaldırıldı, Osmanlı hanedanı yurt dışına çıkarıldı. **Din ile devlet ayrımı** yolunda önemli bir adım oldu. Aynı gün **Tevhid-i Tedrisat Kanunu**, **Şer’iye ve Evkaf Vekâleti’nin kaldırılması** ve Genelkurmay’ın Millî Savunma’dan ayrılması yapıldı.
- **1924 Anayasası:** Teşkilat-ı Esasiye (1921) yerine yeni anayasa yapıldı.
- **Çok partili hayata ilk denemeler:** **Terakkiperver Cumhuriyet Fırkası (1924)** ve **Serbest Cumhuriyet Fırkası (1930)** kuruldu ama kısa sürede kapandı.
- **Kadınlara siyasi haklar:** **1930’da belediye seçimlerinde**, **1933’te muhtar seçimlerinde**, **1934’te milletvekili seçme ve seçilme** hakkı verildi.

## 2. Hukuk alanındaki inkılaplar

- **Medeni Kanun (1926):** İsviçre Medeni Kanunu’ndan alındı. **Mecelle kalktı.** **Resmî nikâh** zorunlu oldu, çok eşlilik kaldırıldı, **kadın-erkek eşitliği** getirildi (miras, boşanma, tanıklık).
- **Ceza Kanunu, Ticaret Kanunu, Borçlar Kanunu** da yabancı kanunlardan uyarlanarak çıkarıldı.
- **Mahkemelerin** laikleşmesi, şer’i mahkemeler kapatıldı.
- **Hukukta birlik:** Herkes tek hukuk düzenine tabi oldu.

## 3. Eğitim ve kültür alanındaki inkılaplar

- **Tevhid-i Tedrisat Kanunu (1924):** Bütün eğitim kurumları **Maarif Vekâleti’ne** bağlandı (eğitimde birlik). Medreseler kapatıldı.
- **Harf İnkılabı (1928):** Arap alfabesi yerine **Latin harfleri** kabul edildi. Okuma-yazma oranının artması amaçlandı.
- **Millet Mektepleri (1928):** Yetişkinlere yeni harfleri öğretmek için açıldı.
- **Türk Tarih Kurumu (1931)** ve **Türk Dil Kurumu (1932)** kuruldu. **Güneş Dil Teorisi**, **Türk Tarih Tezi** geliştirildi.
- **Üniversite Reformu (1933):** Darülfünun kapatıldı, yerine **İstanbul Üniversitesi** kuruldu.
- **Güzel sanatlar:** Heykel, resim, müzik ve tiyatro desteklendi. **Halkevleri (1932)** açıldı.
- **Köy Enstitüleri (1940)** daha sonra açılmıştır.

## 4. Toplumsal alandaki inkılaplar

- **Şapka Kanunu (1925):** Fes yerine şapka. Kıyafette çağdaşlaşma.
- **Tekke, zaviye ve türbelerin kapatılması (1925).**
- **Miladi takvim, saat ve rakamlar (1925 ve 1926):** Uluslararası uyum.
- **Soyadı Kanunu (1934):** Herkes soyadı aldı. Mustafa Kemal’e **“Atatürk”** soyadı verildi.
- **Lakap ve unvanların kaldırılması (1934):** Ağa, bey, paşa gibi sıfatlar kaldırıldı, **eşitlik ilkesi** pekiştirildi.
- **Uluslararası ölçü birimleri (1931)**, hafta tatilinin Cuma’dan Pazar’a alınması (1935).
- **Kadın hakları:** Eğitimde ve çalışma hayatında yer alması desteklendi.

## 5. Ekonomik alandaki gelişmeler

- **İzmir İktisat Kongresi (1923):** Ekonomi politikasının ilkeleri. **Millî ekonomi** hedefi.
- **Aşar vergisinin kaldırılması (1925):** Köylünün yükü azaldı.
- **İş Bankası (1924)** ve **Sanayi ve Maadin Bankası** kuruldu. **Ziraat Bankası** güçlendirildi.
- **Teşvik-i Sanayi Kanunu (1927):** Özel girişimciliğe destek.
- **Demiryolları devletleştirildi, yeni hatlar yapıldı.**
- **1929 Dünya Ekonomik Buhranı** sonrasında **devletçilik** öne çıktı. **I. Beş Yıllık Sanayi Planı (1933)** uygulandı. **Sümerbank (1933)** ve **Etibank** gibi devlet kurumları açıldı.

## 6. Atatürk ilkeleri

Atatürk ilkeleri altı tanedir (**altı ok**):

| İlke | Anlamı |
| --- | --- |
| **Cumhuriyetçilik** | Yönetim biçimi cumhuriyettir, egemenlik millettedir |
| **Milliyetçilik** | Ortak tarih, kültür ve ülkü birliği, ırkçılık yoktur |
| **Halkçılık** | Kanun önünde eşitlik, sınıf ve ayrıcalık yoktur |
| **Devletçilik** | Devlet ekonomide, özel girişimin yapamadığı alanlarda yer alır |
| **Laiklik** | Din ve devlet işleri ayrıdır, vicdan özgürlüğü vardır |
| **İnkılapçılık** | Çağdaş gelişmelere sürekli yenilenme, gelenekçilikten ayrılma |

İlkeler Cumhuriyet Halk Fırkası’nın 1931 programında yer aldı, altısı birlikte **1937’de Anayasa’ya** girdi. **Laiklik** de bu yıl anayasaya girdi.

## 7. Atatürk dönemi dış politikası

**İlke:** **“Yurtta sulh, cihanda sulh.”** Barışçı, bağımsız ve gerçekçi bir dış politika.

- **Musul Sorunu:** Lozan’da çözülemedi. **Ankara Antlaşması (1926)** ile Musul İngiltere (Irak) yönetiminde kaldı.
- **Boğazlar:** **Montrö Boğazlar Sözleşmesi (1936)** ile Türkiye’nin Boğazlar üzerindeki **egemenlik hakkı** yeniden sağlandı.
- **Hatay:** 1939’da Hatay anavatana katıldı (Hatay Cumhuriyeti kurulduktan sonra).
- **Balkan Antantı (1934):** Türkiye, Yunanistan, Romanya, Yugoslavya. **Sadabat Paktı (1937):** Türkiye, İran, Irak, Afganistan.
- **Milletler Cemiyeti’ne üyelik (1932).**
- **Kapitülasyonlar** Lozan’da kaldırılmıştı, dış borçlar ödendi.

:::neden-sonuc
- Halifelik kaldırılıyor => Din ve devlet işleri ayrışır, laikleşme yolunda adım atılır.
- Medeni Kanun kabul ediliyor => Kadın ve erkek hukukta eşitlenir.
- Latin harfleri kabul ediliyor => Okuma-yazma kolaylaşır, kültürel birlik güçlenir.
- Dünya Ekonomik Buhranı yaşanıyor => Devletçilik politikası öne çıkar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Saltanatın kaldırılmasını (1922) Cumhuriyet’in ilanı (1923) ile karıştırma.** Önce saltanat kalktı, sonra cumhuriyet ilan edildi, halifelik ise 1924’te kaldırıldı. Bir de **Tevhid-i Tedrisat’ı Harf İnkılabı ile karıştırma**: Tevhid-i Tedrisat eğitimde birliktir (1924), Harf İnkılabı Latin alfabesine geçiştir (1928). **Laikliğin Anayasaya girişini 1924 sanma**: 1937’dir.
:::

:::baglanti
Bu konu, “Milli Mücadele” konusunun devamıdır ve Lozan’dan sonra kurulan Cumhuriyet’i anlatır. Edebiyatta “Cumhuriyet Dönemi Türk Edebiyatı” ve Türkçede “Yazım Kuralları” Harf İnkılabı ve Dil Kurumu ile ilişkilidir. Coğrafyada “Ekonomik Faaliyetler” ve “Ulaşım Hatları” konuları demiryolu ve sanayileşme politikalarını kapsar. Din kültüründe “Din ve Toplumsal Hayat” konusu laiklik kavramıyla ilişkilidir.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Saltanat | 1 Kasım 1922 kaldırıldı |
| Cumhuriyet | 29 Ekim 1923 |
| Halifelik | 3 Mart 1924 kaldırıldı |
| Medeni Kanun | 1926 |
| Harf İnkılabı | 1928 |
| Soyadı Kanunu | 1934 |
| Kadınlara seçme ve seçilme | 1930 belediye, 1934 milletvekili |
| Altı ilke | Cumhuriyetçilik, milliyetçilik, halkçılık, devletçilik, laiklik, inkılapçılık |
| Montrö | 1936, Boğazlar |

## Mini test

:::soru{cevap="A"}
Türkiye’de Latin alfabesinin kabul edilmesi, eğitimde birliğin sağlanması ve medreselerin kapatılması sırasıyla hangi yıllarda gerçekleşmiştir?

- A) 1928 ve 1924
- B) 1924 ve 1928
- C) 1926 ve 1925
- D) 1923 ve 1934
- E) 1930 ve 1933

---

1. Harf İnkılabı 1928'de, Tevhid-i Tedrisat Kanunu (medreselerin kapatılması dâhil) 1924'te gerçekleşmiştir.
2. Doğru cevap A.

Diğer şıklar: **1924 ve 1928** sıralama ters verilmiş / **1926 ve 1925** Medeni Kanun 1926’da, Şapka Kanunu 1925’te çıkmıştır / **1923 ve 1934** Cumhuriyet’in ilanı ve Soyadı Kanunu yılları verilmiş / **1930 ve 1933** kadınlara belediye seçimlerinde hak ve Üniversite Reformu yılları verilmiş.
:::

:::soru{cevap="C"}
İsviçre Medeni Kanunu’ndan alınarak kabul edilen, resmî nikâhı zorunlu kılan, çok eşliliği kaldıran ve kadın-erkek eşitliğini hukuka taşıyan düzenleme aşağıdakilerden hangisidir?

- A) Mecelle
- B) Teşkilat-ı Esasiye Kanunu
- C) Medeni Kanun
- D) Tevhid-i Tedrisat Kanunu
- E) Soyadı Kanunu

---

1. İsviçre Medeni Kanunu'ndan alınan düzenleme 1926 tarihli Medeni Kanun'dur.
2. Resmî nikâhı zorunlu kılmış, çok eşliliği kaldırmış, eşitlik getirmiştir. Doğru cevap C.

Diğer şıklar: **Mecelle** Mecelle Osmanlı dönemindeki İslam hukukuna dayalı kanundur / **Teşkilat-ı Esasiye Kanunu** Teşkilat-ı Esasiye bir anayasadır / **Tevhid-i Tedrisat Kanunu** Tevhid-i Tedrisat eğitimde birliği sağlar / **Soyadı Kanunu** Soyadı Kanunu soyadı almayı zorunlu kılar.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi Atatürk dönemi dış politikasında yapılan düzenlemelerden biri **değildir**?

- A) Montrö Boğazlar Sözleşmesi’nin imzalanması
- B) Balkan Antantı’nın kurulması
- C) Sadabat Paktı’nın imzalanması
- D) Milletler Cemiyeti’ne üye olunması
- E) Sevr Antlaşması’nın imzalanması

---

1. Sevr Antlaşması 1920'de Osmanlı hükümetince imzalanmış, TBMM tarafından tanınmamıştır.
2. Diğer seçenekler Atatürk döneminin dış politika adımlarıdır. Doğru cevap E.

Diğer şıklar: **Montrö Boğazlar Sözleşmesi’nin imzalanması** Montrö 1936’da imzalandı / **Balkan Antantı’nın kurulması** Balkan Antantı 1934’te kuruldu / **Sadabat Paktı’nın imzalanması** Sadabat Paktı 1937’de imzalandı / **Milletler Cemiyeti’ne üye olunması** Türkiye 1932’de Milletler Cemiyeti’ne üye oldu.
:::

:::soru{cevap="C"}
Türkiye’de Cumhuriyet’in ilan edildiği ve Mustafa Kemal’in ilk cumhurbaşkanı seçildiği yıl hangisidir?

- A) 1920
- B) 1922
- C) 1923
- D) 1924
- E) 1925

---

1. Cumhuriyet 29 Ekim 1923'te ilan edilmiştir.
2. 1922 saltanatın, 1924 halifeliğin kaldırılışı, 1920 TBMM'nin açılışıdır. Doğru cevap C.

Diğer şıklar: **1920** TBMM’nin açıldığı yıl alınmış / **1922** saltanatın kaldırıldığı yıl alınmış / **1924** halifeliğin kaldırıldığı yıl alınmış / **1925** işlem hatasıyla iki fazla bulunmuş.
:::

## Kendini dene

:::dene
1. Cumhuriyet hangi tarihte ilan edilmiştir? => 29 Ekim 1923.
2. Halifelik hangi yıl kaldırılmıştır? => 1924.
3. Latin harfleri hangi yılda kabul edilmiştir? => 1928.
4. Kadınlara milletvekili seçme ve seçilme hakkı hangi yılda verilmiştir? => 1934.
5. Boğazlar üzerindeki egemenlik hakkı hangi sözleşmeyle sağlanmıştır? => Montrö (1936).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tar' and name = 'Atatürkçülük ve Türk İnkılabı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Cumhuriyet'in ilanı, saltanat ve halifeliğin kaldırılması, hukuk, eğitim, toplumsal ve ekonomik inkılaplar, Atatürk ilkeleri, Atatürk dönemi dış politikası. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Tarihler ders kitabı bilgileridir.
Kontrol edilecekler: Kadınlara tanınan hakların yılları (1930, 1933, 1934) kaynakla teyit edilmeli. Hafta tatili değişikliği (1935) ve Hatay ayrıntıları sadeleştirildi. Atatürk ilkelerinin anayasaya girişi (1937) ve 1931 parti programı bilgisi ders kitabına göre kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-tar' and name = 'Atatürkçülük ve Türk İnkılabı'
on conflict (topic_id) do nothing;
