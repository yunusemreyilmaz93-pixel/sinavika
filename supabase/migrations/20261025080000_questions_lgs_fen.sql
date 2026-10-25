-- 20261025080000_questions_lgs_fen. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-fen | Mevsimler ve İklim konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Mevsimler ve İklim konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi mevsimlerin oluşmasının nedenidir?$q$, array[$o$Dünya'nın kendi ekseni etrafında 24 saatte dönmesi$o$, $o$Eksen eğikliği ve Dünya'nın Güneş çevresinde dolanması$o$, $o$Dünya ile Güneş arasındaki uzaklığın yıl boyu değişmesi$o$, $o$Ay'ın Dünya çevresinde dolanırken Güneş'i örtmesi$o$], 1, $e$1. Mevsimlerin nedeni, eksen eğikliği ile Dünya'nın Güneş etrafında dolanmasıdır.
2. Dönme hareketi gece ve gündüzü oluşturur. Uzaklık mevsimleri belirlemez.

Diğer şıklar: **A** gece ile gündüzün nedenini mevsimin nedeni sanmak / **C** mevsimleri uzaklıkla açıklamak / **D** Ay'ın hareketini mevsimle karıştırmak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$21 Haziran tarihinde Kuzey Yarım Küre'de aşağıdakilerden hangisi yaşanır?$q$, array[$o$Kış mevsimi başlar ve yılın en uzun gündüzü görülür.$o$, $o$Yaz mevsimi başlar ve yılın en kısa gündüzü görülür.$o$, $o$Gece ile gündüz süresi eşit olur.$o$, $o$Yaz mevsimi başlar ve yılın en uzun gündüzü görülür.$o$], 3, $e$1. 21 Haziran'da Güneş ışınları Yengeç Dönencesi'ne dik gelir.
2. Kuzey Yarım Küre'de yaz başlar ve gündüz en uzun olur.

Diğer şıklar: **A** mevsimi yanlış eşlemek / **B** gündüz süresini yanlış eşlemek / **C** 21 Haziran'ı ekinoks tarihi sanmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Aşağıdaki ifadelerden hangisi iklimi anlatmaktadır?$q$, array[$o$Bugün İzmir'de hava güneşli, sıcaklık 28 dereceyi buldu ve rüzgâr hafif esti.$o$, $o$Dün gece Erzurum'da sıcaklık eksi 15 dereceye düştü ve yollar buzlandı.$o$, $o$Akdeniz kıyılarında yazlar sıcak ve kurak, kışlar ılık ve yağışlı geçer.$o$, $o$Bu hafta sonu Karadeniz'de yer yer sağanak yağış ve fırtına bekleniyor.$o$], 2, $e$1. İklim, bir bölgede uzun yıllar boyunca görülen hava olaylarının ortalamasıdır.
2. Diğer ifadeler bir gün ya da birkaç günlük hava olaylarını anlatır.

Diğer şıklar: **A** tek günün hava durumunu iklim sanmak / **B** tek olayı iklim sanmak / **D** kısa süreli tahmini iklim sanmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi atmosferdeki sera gazı miktarını artıran bir insan faaliyetidir?$q$, array[$o$Güneş enerjisi santrallerinden elektrik üretmek$o$, $o$Kömür ve petrol gibi fosil yakıtları çok yakmak$o$, $o$Boş arazilere yeni ormanlar kurmak$o$, $o$Plastik ve kâğıt atıklarını geri dönüştürmek$o$], 1, $e$1. Fosil yakıtlar yanınca atmosfere karbondioksit verir.
2. Diğer faaliyetler sera gazı miktarını artırmaz, azaltmaya yardımcı olur.

Diğer şıklar: **A** yenilenebilir enerjinin gaz saldığını sanmak / **C** ağaçlandırmanın karbondioksiti artırdığını sanmak / **D** geri dönüşümün sera gazı artırdığını sanmak.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Avustralya Güney Yarım Küre'de yer almaktadır.

Buna göre 22 Aralık tarihinde Avustralya'da hangi mevsim başlar?$q$, array[$o$Kış$o$, $o$İlkbahar$o$, $o$Yaz$o$, $o$Sonbahar$o$], 2, $e$1. 22 Aralık'ta Kuzey Yarım Küre'de kış başlar.
2. İki yarım kürede mevsimler zıttır. Güney Yarım Küre'de yaz başlar.

Diğer şıklar: **A** Kuzey Yarım Küre'deki mevsimi almak / **B** ekinoks tarihleriyle karıştırmak / **D** ekinoks tarihleriyle karıştırmak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Selin, Dünya'nın Ocak ayı başında Güneş'e en yakın konumda olduğunu öğreniyor. Selin bu bilgiden hareketle "Türkiye'de Ocak ayında hava sıcak olmalı." diyor.

Buna göre Selin'in düşüncesi için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Doğrudur, çünkü Güneş'e yaklaşan bölgelerde sıcaklık artar ve mevsim yaz olur.$o$, $o$Yanlıştır, çünkü mevsimleri Güneş ışınlarının geliş açısı ve gündüz süresi belirler.$o$, $o$Doğrudur, çünkü Ocak ayında Kuzey Yarım Küre'de ışınlar dik gelir ve yaz yaşanır.$o$, $o$Yanlıştır, çünkü Dünya Ocak ayında Güneş'ten en uzak konumdadır ve hava soğuktur.$o$], 1, $e$1. Dünya Ocak başında Güneş'e en yakındır, ancak mevsimleri belirleyen uzaklık değildir.
2. Ocak'ta Kuzey Yarım Küre'de ışınlar eğik gelir ve gündüzler kısadır, bu yüzden kış yaşanır.

Diğer şıklar: **A** mevsimleri uzaklıkla açıklamak / **C** mevsimleri karıştırmak / **D** gerçek yörünge bilgisini yanlış hatırlamak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda aynı enlemdeki iki şehrin Ocak ve Temmuz ayı ortalama sıcaklıkları verilmiştir.

| Şehir | Özellik | Ocak (°C) | Temmuz (°C) |
| --- | --- | --- | --- |
| X | Deniz kıyısı, yükselti 20 m | 8 | 26 |
| Y | Kara içi, yükselti 1800 m | -8 | 22 |

Buna göre bu iki şehrin sıcaklıklarındaki fark, aşağıdakilerden hangileriyle açıklanabilir?$q$, array[$o$Yükselti ve denize uzaklık$o$, $o$Yalnızca enlem$o$, $o$Yalnızca Dünya'nın Güneş'e uzaklığı$o$, $o$Dünya'nın dönme hızı ve Ay'ın konumu$o$], 0, $e$1. İki şehir aynı enlemde olduğundan fark enlemden gelmez.
2. Y şehri daha yüksektedir ve denizden uzaktır. Yükseldikçe sıcaklık düşer, kara içlerinde yaz ile kış arasındaki fark büyür.

Diğer şıklar: **B** iki şehir aynı enlemde olduğu hâlde enlemi neden saymak / **C** uzaklığın mevsimlere etkisini iklim farkına taşımak / **D** ilgisiz etkenleri seçmek.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Sera etkisi ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Sera etkisi, yalnızca insan faaliyetleriyle ortaya çıkan zararlı bir olaydır.$o$, $o$Sera gazları Güneş ışınlarının tamamını uzaya geri yansıtır.$o$, $o$Atmosferdeki sera gazı miktarı artınca Dünya soğur.$o$, $o$Doğal sera etkisi, Dünya'nın yaşanabilir bir sıcaklıkta kalmasını sağlar.$o$], 3, $e$1. Atmosferdeki gazlar yüzeyden yansıyan ısının bir kısmını tutar. Bu doğal olay yaşam için gereklidir.
2. Sorun, insan faaliyetleriyle sera gazlarının fazlalaşmasıdır.

Diğer şıklar: **A** doğal sera etkisini bilmemek / **B** gazların ısıyı tuttuğunu bilmemek / **C** küresel ısınmanın yönünü ters bilmek.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Ekvator çevresindeki bölgelerde yıl boyunca sıcaklık yüksektir.

Bu durumun temel nedeni aşağıdakilerden hangisidir?$q$, array[$o$Dünya'nın Güneş'e en yakın noktasının her zaman Ekvator olması$o$, $o$Ekvator'da yıl boyunca gecenin hiç yaşanmaması ve gündüzün sürmesi$o$, $o$Güneş ışınlarının yıl boyunca dik ya da dike yakın açıyla gelmesi$o$, $o$Ekvator çevresinde su kütlelerinin bulunmayıp yalnızca kara olması$o$], 2, $e$1. Ekvator'da ışınlar yıl boyu dike yakın gelir, aynı enerji küçük alana düşer.
2. Ekvator'da gece ile gündüz de hemen hemen eşittir.

Diğer şıklar: **A** uzaklık kavramına dayanmak / **B** gece-gündüz süresini yanlış bilmek / **D** denizlerin sıcaklığı düşürdüğünü yanlış genellemek.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$21 Mart tarihinde Güneş ışınları Ekvator'a dik gelir.

Buna göre bu tarihte Dünya'da aşağıdakilerden hangisi görülür?$q$, array[$o$Kuzey Yarım Küre'de yılın en uzun gündüzü yaşanır.$o$, $o$Güney Yarım Küre'de yılın en kısa gündüzü yaşanır.$o$, $o$Kutup bölgelerinde Güneş hiç doğmaz ve gece sürer.$o$, $o$Her yerde gece ile gündüz süresi yaklaşık eşittir.$o$], 3, $e$1. Işınlar Ekvator'a dik geldiğinde iki yarım küre Güneş'ten eşit yararlanır.
2. Bu yüzden her yerde gece ile gündüz yaklaşık eşittir.

Diğer şıklar: **A** 21 Haziran ile karıştırmak / **B** tarihleri karıştırmak / **C** kutup gecesini bu tarihe bağlamak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Bir el feneri, karanlık bir odada duvara dik tutulduğunda küçük ve parlak bir ışık çemberi, eğik tutulduğunda ise daha geniş ve sönük bir ışık alanı oluşturuyor.

Bu gözlem, aşağıdaki olaylardan hangisini açıklamak için kullanılabilir?$q$, array[$o$Dünya'nın Güneş'e yaklaşıp uzaklaşarak mevsimleri oluşturmasını$o$, $o$Ay'ın Dünya çevresindeki konumuna göre evre değiştirmesini$o$, $o$Güneş ışınlarının geliş açısının yüzeyin ısınmasını değiştirmesini$o$, $o$Dünya'nın kendi ekseni etrafında dönerek gece oluşturmasını$o$], 2, $e$1. Işık dik gelince enerji küçük alana düşer, eğik gelince geniş alana yayılır.
2. Bu, Güneş ışınlarının geliş açısına bağlı olarak bölgelerin farklı ısınmasını ve mevsimleri açıklar.

Diğer şıklar: **A** uzaklık etkisini ışık açısıyla karıştırmak / **B** ilgisiz bir olayı seçmek / **D** dönme hareketini ışın açısıyla karıştırmak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Dünya'nın dönme ekseni yörünge düzlemine dik olsaydı aşağıdakilerden hangisi gerçekleşirdi?$q$, array[$o$Dünya'da gece ile gündüz oluşmaz ve hep karanlık olurdu.$o$, $o$Ekvator ile kutuplar arasındaki sıcaklık farkı tamamen ortadan kalkardı.$o$, $o$Dünya'nın Güneş çevresindeki dolanma süresi yarım yıla inerdi.$o$, $o$Mevsimler oluşmaz, aynı bölgede yıl boyu benzer koşullar yaşanırdı.$o$], 3, $e$1. Eksen eğik olmasaydı ışınlar yıl boyu aynı bölgelere aynı açıyla gelirdi ve mevsimler oluşmazdı.
2. Gece ile gündüz dönme hareketiyle oluşur, enlem etkisi ve dolanma süresi değişmezdi.

Diğer şıklar: **A** gece-gündüzü eksen eğikliğine bağlamak / **B** enlem etkisini yok saymak / **C** dolanma süresini eksenle ilişkilendirmek.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda Ankara'da dört önemli tarihteki gündüz süreleri verilmiştir.

| Tarih | Gündüz süresi |
| --- | --- |
| 21 Mart | 12 saat |
| 21 Haziran | 15 saat 10 dakika |
| 23 Eylül | 12 saat |
| 22 Aralık | 9 saat 10 dakika |

Bu tabloya göre aşağıdaki çıkarımlardan hangisi yapılabilir?$q$, array[$o$Güneş ışınları Ankara'ya en dik 21 Haziran'da gelir.$o$, $o$Dünya 22 Aralık'ta Güneş'e en yakındır.$o$, $o$Ankara'da gündüz süresi yıl boyu artar.$o$, $o$21 Mart'ta Ankara'da mevsimler kış olarak yaşanır.$o$], 0, $e$1. Gündüz süresinin en uzun olduğu 21 Haziran'da Kuzey Yarım Küre Güneş'e doğru eğiktir ve ışınlar en dik gelir.
2. Gündüz süresi uzaklıkla ilgili bir bilgi vermez, tabloda gündüz süresi artıp azalır.

Diğer şıklar: **B** gündüz süresinden uzaklığı çıkarmak / **C** tablodaki azalışı görmemek / **D** ekinoks tarihini kış sanmak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Fosil yakıt kullanımının artması sonucunda oluşan olaylar aşağıdaki sıralamalardan hangisinde doğru verilmiştir?$q$, array[$o$Atmosferde karbondioksit artar → sera etkisi güçlenir → ortalama sıcaklık yükselir → buzullar erir$o$, $o$Buzullar erir → sera etkisi güçlenir → atmosferde karbondioksit artar → ortalama sıcaklık yükselir$o$, $o$Ortalama sıcaklık yükselir → atmosferde karbondioksit artar → buzullar erir → sera etkisi güçlenir$o$, $o$Sera etkisi güçlenir → ortalama sıcaklık yükselir → buzullar erir → atmosferde karbondioksit artar$o$], 0, $e$1. Fosil yakıtlar yanınca atmosfere karbondioksit verilir. Bu gaz artınca sera etkisi güçlenir ve ortalama sıcaklık yükselir.
2. Sıcaklık artışının sonucunda buzullar erir.

Diğer şıklar: **B** neden-sonuç sırasını ters kurmak / **C** sıcaklık artışını nedeni sanmak / **D** gaz artışını sonuç sanmak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi karbon ayak izini küçültmeye yönelik bir davranış **değildir**?$q$, array[$o$Toplu taşıma ya da bisiklet kullanmak$o$, $o$Kısa mesafeler için bile özel araç kullanmak$o$, $o$Enerji tasarruflu cihazları tercih etmek$o$, $o$Ağaç dikmeye ve ormanları korumaya katkı vermek$o$], 1, $e$1. Karbon ayak izi, kişinin atmosfere saldığı sera gazı miktarıdır.
2. Özel araç kullanımı fosil yakıt tüketimini ve sera gazı salımını artırır.

Diğer şıklar: **A** doğru davranışı yanlış sanmak / **C** doğru davranışı yanlış sanmak / **D** doğru davranışı yanlış sanmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Karadeniz kıyısına paralel uzanan dağların kıyıya bakan yamaçlarında bol yağış görülürken, dağların arkasında kalan iç kesimler daha kuraktır.

Bu durumun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Dağların, nemli rüzgârların yağışı kıyı yamaçlarında bırakmasına yol açması$o$, $o$İç kesimlerin kıyıya göre Güneş'e daha yakın olması ve çok ısınması$o$, $o$Kıyıdaki eksen eğikliğinin iç kesimdekinden çok daha fazla olması$o$, $o$İç kesimlerde hava olaylarının hiç yaşanmayıp yağışın kesilmesi$o$], 0, $e$1. Nemli rüzgârlar dağlara çarpıp yükselir ve yağışı kıyı yamaçlarında bırakır.
2. Dağların arkasına ulaşan hava kurudur. Bu, yer şekillerinin iklimi etkilemesine örnektir.

Diğer şıklar: **B** uzaklık etkisini iklime taşımak / **C** eksen eğikliğini bölgeye göre değişir sanmak / **D** uç bir genellemeye varmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | DNA ve Genetik Kod konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$DNA ve Genetik Kod konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$DNA'nın yapı taşı olan nükleotit hangi üç parçadan oluşur?$q$, array[$o$Fosfat grubu, riboz şekeri ve amino asit$o$, $o$Yağ asidi, deoksiriboz şekeri ve organik baz$o$, $o$Fosfat grubu, deoksiriboz şekeri ve organik baz$o$, $o$Amino asit, glikoz ve organik baz$o$], 2, $e$1. Nükleotit fosfat, şeker ve organik bazdan oluşur.
2. DNA'da şeker deoksiriboz, RNA'da riboz şekeridir.

Diğer şıklar: **A** RNA şekeri ile amino asidi karıştırmak / **B** yağ asidini nükleotit parçası sanmak / **D** protein yapı taşını nükleotitte aramak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Bir DNA zincirinin baz dizilişi A-T-G-S-S-A olarak verilmiştir.

Buna göre bu zincire karşılık gelen diğer zincirin baz dizilişi aşağıdakilerden hangisidir?$q$, array[$o$T-A-S-G-G-T$o$, $o$A-T-G-S-S-A$o$, $o$S-G-T-A-A-S$o$, $o$T-A-S-G-G-U$o$], 0, $e$1. DNA'da adenin timinle, guanin sitozinle eşleşir.
2. A-T-G-S-S-A zincirinin karşısı T-A-S-G-G-T olur.

Diğer şıklar: **B** zinciri aynen yazmak / **C** eşleşmeyi A-S ve T-G yapmak / **D** DNA'da urasil kullanmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$İnsan vücut hücrelerinde 46 kromozom bulunur.

Buna göre bir sperm hücresindeki kromozom sayısı kaçtır?$q$, array[$o$2$o$, $o$23$o$, $o$46$o$, $o$92$o$], 1, $e$1. Üreme hücreleri (yumurta ve sperm) kromozom sayısının yarısını taşır.
2. 46 / 2 = 23.

Diğer şıklar: **A** eşey kromozomu sayısını yazmak / **C** üreme hücresinde sayının yarıya indiğini bilmemek / **D** sayıyı iki katına çıkarmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi DNA ile RNA arasındaki farklardan biridir?$q$, array[$o$DNA'da urasil, RNA'da timin bulunur.$o$, $o$RNA'da şeker olarak deoksiriboz bulunur.$o$, $o$DNA çift zincirli, RNA tek zincirlidir.$o$, $o$RNA hücre çekirdeği dışında hiçbir yerde bulunamaz.$o$], 2, $e$1. DNA çift sarmallı, RNA tek zincirli yapıdadır.
2. DNA'da timin ve deoksiriboz, RNA'da urasil ve riboz bulunur.

Diğer şıklar: **A** bazları ters yazmak / **B** şekerleri ters yazmak / **D** RNA'nın görevini bilmemek.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Bir bezelye bitkisinde mor çiçek rengi baskın (M), beyaz çiçek rengi çekiniktir (m). Genotipi Mm olan bir bitki ile mm olan bir bitki çaprazlanıyor.

Buna göre oluşacak bitkilerin fenotip oranı aşağıdakilerden hangisidir?$q$, array[$o$Tamamı mor$o$, $o$Yarısı mor, yarısı beyaz$o$, $o$Dörtte üçü mor, dörtte biri beyaz$o$, $o$Tamamı beyaz$o$], 1, $e$1. Mm x mm çaprazlamasında yavrular Mm ve mm olur.
2. Mm mor, mm beyazdır. Oran 1 : 1'dir.

Diğer şıklar: **A** baskın gen düşüncesini her yavruya genellemek / **C** Mm x Mm çaprazlamasının oranını uygulamak / **D** çekinik gen düşüncesini her yavruya genellemek.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Genotipi Aa olan iki birey çaprazlanıyor. A baskın, a çekinik gendir.

Buna göre yavruların yüzde kaçının çekinik fenotipte olması beklenir?$q$, array[$o$0$o$, $o$25$o$, $o$50$o$, $o$75$o$], 1, $e$1. Aa x Aa çaprazlamasında yavrular 1 AA : 2 Aa : 1 aa oranında oluşur.
2. Çekinik fenotip yalnızca aa'da görülür, bu da dörtte bir yani %25 eder.

Diğer şıklar: **A** çekinik genin hiç kendini göstermeyeceğini sanmak / **C** Aa x aa çaprazlamasıyla karıştırmak / **D** baskın fenotip oranını yazmak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi modifikasyona örnektir?$q$, array[$o$Bir bitkide ilk kez beyaz çiçekli bir bireyin ortaya çıkması$o$, $o$Düzenli spor yapan bir kişinin kaslarının gelişmesi$o$, $o$Radyasyon sonucu bir hücrenin DNA'sında bozulma olması$o$, $o$Albino bir canlının doğması$o$], 1, $e$1. Modifikasyon, çevre koşullarının neden olduğu geçici değişikliktir. DNA değişmez, yavrulara aktarılmaz.
2. Diğer seçenekler DNA'daki değişikliklerdir, mutasyondur.

Diğer şıklar: **A** DNA'daki ani değişikliği modifikasyon sanmak / **C** mutasyonu modifikasyon sanmak / **D** mutasyonu modifikasyon sanmak.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Kutup ayısının kalın yağ tabakası ve beyaz kürkü, soğuk bölgede hayatta kalmasını kolaylaştırır.

Bu durum aşağıdaki kavramlardan hangisine örnektir?$q$, array[$o$Mutasyon$o$, $o$Modifikasyon$o$, $o$Adaptasyon$o$, $o$Klonlama$o$], 2, $e$1. Canlının yaşadığı ortama uygun özellikler kazanmasına adaptasyon denir.
2. Kalın yağ tabakası ve beyaz kürk kutup koşullarına uyum sağlar.

Diğer şıklar: **A** ani DNA değişikliği ile karıştırmak / **B** geçici çevre etkisi ile karıştırmak / **D** genetik kopyalamayı alakasız yerde kullanmak.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$İnsanda eşey kromozomları kadında XX, erkekte XY biçimindedir.

Buna göre bir çocuğun cinsiyetini aşağıdakilerden hangisi belirler?$q$, array[$o$Anneden gelen yumurtadaki eşey kromozomu$o$, $o$Çocuğun doğduğu mevsim$o$, $o$Anne ve babanın göz rengi$o$, $o$Babadan gelen spermdeki eşey kromozomu$o$], 3, $e$1. Anne her zaman X taşıyan yumurta verir.
2. Sperm X taşırsa çocuk kız, Y taşırsa erkek olur.

Diğer şıklar: **A** annenin her zaman X verdiğini bilmemek / **B** ilgisiz bir etken seçmek / **C** başka bir özelliği cinsiyetle karıştırmak.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Genetik mühendisliği ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Yalnızca bitkilerin görünüşünü değiştirmek için kullanılır.$o$, $o$Canlıların DNA'sında hiçbir değişiklik yapmaz.$o$, $o$Tamamen etik tartışmaların dışındadır.$o$, $o$İnsülin gibi ilaçların bakterilerde üretilmesinde kullanılır.$o$], 3, $e$1. Genetik mühendisliğinde bir canlının genetik yapısına müdahale edilir.
2. İnsülin üretimi tıpta kullanım örneğidir. GDO gibi uygulamalar etik tartışmalar da doğurur.

Diğer şıklar: **A** kullanım alanlarını dar bilmek / **B** yöntemin doğasını yanlış bilmek / **C** etik boyutu yok saymak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda bir ailenin üyelerinin göz rengi genotipleri verilmiştir. Kahverengi göz rengi baskın (K), mavi göz rengi çekiniktir (k).

| Aile üyesi | Genotip |
| --- | --- |
| Anne | Kk |
| Baba | Kk |
| Birinci çocuk | kk |

Buna göre bu aileyle ilgili aşağıdaki yargılardan hangisi doğrudur?$q$, array[$o$Birinci çocuk mavi gözlüdür, çünkü anne ve babadan birer çekinik gen almıştır.$o$, $o$Anne ve baba mavi gözlüdür, çünkü her ikisi de çekinik gen taşımaktadır.$o$, $o$Birinci çocuk kahverengi gözlüdür, çünkü genotipinde baskın gen bulunmaktadır.$o$, $o$Bu aileden mavi gözlü çocuk doğması imkânsızdır, çünkü anne ve baba kahverengi gözlüdür.$o$], 0, $e$1. Kk genotipinde baskın gen kendini gösterir, anne ve baba kahverengi gözlüdür.
2. kk genotipli çocuk mavi gözlüdür ve bir k genini anneden, bir k genini babadan almıştır.

Diğer şıklar: **B** Kk genotipinin fenotipini yanlış yorumlamak / **C** kk genotipinin fenotipini yanlış yorumlamak / **D** çekinik özelliğin ortaya çıkma ihtimalini bilmemek.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Aşağıdaki durumlardan hangisinde canlıda görülen değişiklik yavrulara aktarılabilir?$q$, array[$o$Güneşte uzun süre kalan bir kişinin cildinin kararması$o$, $o$Gölgede yetişen bir bitkinin yapraklarının açık yeşil olması$o$, $o$Bir bitkinin tohumundaki DNA'da radyasyonla meydana gelen değişiklik$o$, $o$Ağır kaldıran bir kişinin kaslarının gelişmesi$o$], 2, $e$1. Yavrulara yalnızca DNA'daki değişiklikler aktarılır.
2. Radyasyon DNA'da mutasyona neden olabilir ve üreme hücrelerinde olursa aktarılır. Diğerleri çevre kaynaklı modifikasyondur.

Diğer şıklar: **A** modifikasyonu kalıtsal sanmak / **B** modifikasyonu kalıtsal sanmak / **D** modifikasyonu kalıtsal sanmak.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Bir DNA molekülünde toplam 200 baz bulunmaktadır ve adenin sayısı 60'tır.

Buna göre bu DNA'da guanin sayısı kaçtır?$q$, array[$o$40$o$, $o$60$o$, $o$80$o$, $o$140$o$], 0, $e$1. Adenin ile timin eşit sayıdadır: 60 + 60 = 120 baz.
2. Kalan 80 bazın yarısı guanin, yarısı sitozindir. Guanin sayısı 40'tır.

Diğer şıklar: **B** guanin sayısını adeninle eşit sanmak / **C** adenin sayısını toplamdan çıkarıp ikiye bölmeyi eksik yapmak / **D** toplamdan yalnızca adenini çıkarmak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Gen, DNA, kromozom ve nükleotit kavramları büyükten küçüğe doğru sıralanacaktır.

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$DNA, kromozom, gen, nükleotit$o$, $o$Kromozom, gen, DNA, nükleotit$o$, $o$Nükleotit, gen, DNA, kromozom$o$, $o$Kromozom, DNA, gen, nükleotit$o$], 3, $e$1. Kromozom, paketlenmiş DNA'dır. DNA üzerinde genler bulunur ve DNA nükleotitlerden oluşur.
2. Büyükten küçüğe sıralama: kromozom, DNA, gen, nükleotit.

Diğer şıklar: **A** kromozom ve DNA'nın sırasını karıştırmak / **B** gen ve DNA'nın sırasını karıştırmak / **C** sıralamayı küçükten büyüğe yazmak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$Biyoteknolojik çalışmalarla ilgili aşağıdakilerden hangisi **yanlıştır**?$q$, array[$o$Yalnızca genetik mühendisliği ile yapılır ve mikroorganizmaları kullanmaz.$o$, $o$Yoğurt ve peynir üretimi biyoteknolojik uygulamalara örnektir.$o$, $o$DNA analiziyle kimlik tespiti yapılabilir.$o$, $o$Dolly adlı koyun klonlama ile üretilmiştir.$o$], 0, $e$1. Biyoteknoloji, canlıları ya da canlı parçalarını kullanarak ürün üretmektir. Mikroorganizmalar sık kullanılır.
2. Yoğurt, peynir, DNA analizi ve klonlama biyoteknoloji örnekleridir.

Diğer şıklar: **B** doğru ifadeyi yanlış sanmak / **C** doğru ifadeyi yanlış sanmak / **D** doğru ifadeyi yanlış sanmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Bir bitkide uzun boy baskın (U), kısa boy çekiniktir (u). Uzun boylu bir bitki ile kısa boylu bir bitki çaprazlandığında yavruların yarısı uzun, yarısı kısa boylu çıkıyor.

Buna göre uzun boylu ebeveynin genotipi aşağıdakilerden hangisidir?$q$, array[$o$Baskın saf döl (UU)$o$, $o$Çekinik saf döl (uu)$o$, $o$Genotip belirlenemez$o$, $o$Melez döl (Uu)$o$], 3, $e$1. Kısa boylu ebeveyn uu'dur. Yavruların yarısının kısa (uu) çıkması için uzun ebeveyn çekinik gen taşımalıdır.
2. Uzun ebeveyn Uu olursa Uu x uu çaprazlamasında 1 : 1 oran elde edilir.

Diğer şıklar: **A** saf döl olsaydı tüm yavruların uzun olacağını görememek / **B** çekinik genotipin uzun fenotip vermeyeceğini görememek / **C** çaprazlama sonucundan genotip çıkarılabileceğini görememek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | Madde ve Endüstri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Madde ve Endüstri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Sodyum elementinin sembolü aşağıdakilerden hangisidir?$q$, array[$o$Na$o$, $o$S$o$, $o$K$o$, $o$N$o$], 0, $e$1. Sodyumun sembolü Na'dır.
2. S kükürt, K potasyum, N azot elementinin sembolüdür.

Diğer şıklar: **B** kükürt sembolü ile karıştırmak / **C** potasyum sembolü ile karıştırmak / **D** azot sembolü ile karıştırmak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Aşağıdaki olaylardan hangisinde kimyasal değişim gerçekleşir?$q$, array[$o$Buzun oda sıcaklığında erimesi$o$, $o$Tuzun suda çözünerek kaybolması$o$, $o$Camın yere düşünce kırılması$o$, $o$Sütün bir süre bekleyince ekşimesi$o$], 3, $e$1. Kimyasal değişimde yeni madde oluşur. Süt ekşirken tat ve koku değişir, yeni maddeler oluşur.
2. Erime, çözünme ve kırılmada madde kimliği değişmez, bunlar fiziksel değişimdir.

Diğer şıklar: **A** hâl değişimini kimyasal sanmak / **B** çözünmeyi kimyasal sanmak / **C** şekil değişimini kimyasal sanmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Limon suyu mavi turnusol kâğıdına damlatıldığında kâğıt kırmızıya dönüyor.

Buna göre limon suyu ile ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Bazik özellik gösterir ve pH değeri 7'den büyüktür.$o$, $o$Nötr özellik gösterir ve pH değeri tam 7'dir.$o$, $o$Bazik özellik gösterir ve pH değeri 7'ye eşittir.$o$, $o$Asidik özellik gösterir ve pH değeri 7'den küçüktür.$o$], 3, $e$1. Mavi turnusolu kırmızıya çeviren maddeler asittir.
2. Asitlerin pH değeri 7'den küçüktür.

Diğer şıklar: **A** turnusol renk değişimini ters yorumlamak / **B** nötr maddenin turnusolu değiştireceğini sanmak / **C** baz ile nötrü karıştırmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Balonlarda hidrojen yerine helyum gazı kullanılması tercih edilir.

Bunun temel nedeni aşağıdakilerden hangisidir?$q$, array[$o$Helyumun bir metal olduğu için çok hafif ve esnek olması$o$, $o$Helyumun soygaz olduğu için yanmaması ve tepkimeye girmemesi$o$, $o$Helyumun hidrojenden çok daha ağır ve yoğun bir gaz olması$o$, $o$Helyumun yanıcı olması ve balonu havada ısıtarak yükseltmesi$o$], 1, $e$1. Helyum soygazdır, kararlıdır ve yanmaz.
2. Hidrojen yanıcı bir gazdır. Bu yüzden balonlar için helyum daha güvenlidir.

Diğer şıklar: **A** helyumun metal olduğunu sanmak / **C** gazın yoğunluğunu yanlış bilmek / **D** helyumun özelliğini ters bilmek.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Bir kapalı kapta 24 g magnezyum ile 16 g oksijen tamamen tepkimeye giriyor ve magnezyum oksit oluşuyor.

Buna göre oluşan magnezyum oksit kaç gramdır?$q$, array[$o$8$o$, $o$16$o$, $o$40$o$, $o$384$o$], 2, $e$1. Kütlenin korunumu gereği giren maddelerin toplam kütlesi ürünlerin toplam kütlesine eşittir.
2. 24 + 16 = 40 g.

Diğer şıklar: **A** iki kütlenin farkını almak / **B** yalnızca oksijenin kütlesini yazmak / **D** iki kütleyi çarpmak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Kalsiyum ile oksijenin tepkimesi $\text{Ca} + \text{O}_2 \longrightarrow \text{CaO}$ biçiminde gösteriliyor.

Bu denklem denkleştirildiğinde katsayılar toplamı kaç olur?$q$, array[$o$3$o$, $o$4$o$, $o$5$o$, $o$6$o$], 2, $e$1. Giren tarafta 2 oksijen atomu vardır. Ürün tarafında da 2 oksijen için CaO'nun önüne 2 yazılır.
2. Bu durumda Ca'nın önüne de 2 yazılır: $2\text{Ca} + \text{O}_2 \longrightarrow 2\text{CaO}$. Katsayılar toplamı 2 + 1 + 2 = 5.

Diğer şıklar: **A** denklemi denkleştirmeden katsayıları 1 almak / **B** bir katsayıyı eksik yazmak / **D** bir katsayıyı fazla yazmak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda bazı maddelerin pH değerleri verilmiştir.

| Madde | pH |
| --- | --- |
| Limon suyu | 2 |
| Kahve | 5 |
| Saf su | 7 |
| Sabunlu su | 10 |

Bu tabloya göre aşağıdakilerden hangisi doğrudur?$q$, array[$o$Sabunlu su pH değeri 10 olduğundan asidiktir.$o$, $o$Saf su kahveden daha asidik özellik gösterir.$o$, $o$Kahve pH değeri 5 olduğundan bazik özellik gösterir.$o$, $o$Limon suyu kahveden daha kuvvetli asittir.$o$], 3, $e$1. pH 7'den küçükse madde asittir, değer küçüldükçe asitlik artar.
2. Limon suyunun pH'ı 2, kahvenin 5'tir. Limon suyu daha kuvvetli asittir.

Diğer şıklar: **A** pH 10'u asit sanmak / **B** pH büyüdükçe asitliğin arttığını sanmak / **C** pH 5'i baz sanmak.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Bir çözeltiye fenolftalein damlatıldığında çözeltinin renginde değişiklik olmuyor.

Buna göre çözelti ile ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Kesinlikle kuvvetli bir bazdır.$o$, $o$Bazik değildir, asit ya da nötr olabilir.$o$, $o$Kesinlikle sadece nötr bir çözeltidir.$o$, $o$Kesinlikle sadece asit özelliğindedir.$o$], 1, $e$1. Fenolftalein asitte ve nötr ortamda renksiz, bazda pembedir.
2. Renk değişmediğine göre çözelti baz değildir, asit ya da nötr olabilir.

Diğer şıklar: **A** fenolftaleinin renk değişimini ters yorumlamak / **C** asidi hesaba katmamak / **D** nötrü hesaba katmamak.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Mide asidi fazla salgılanan bir kişiye antiasit ilaç verilmesi aşağıdaki olaylardan hangisine örnektir?$q$, array[$o$Nötrleşme$o$, $o$Çözünme$o$, $o$Buharlaşma$o$, $o$Yanma$o$], 0, $e$1. Antiasit ilaçlar baziktir ve mide asidiyle tepkimeye girer.
2. Asit ile bazın tepkimesinde tuz ve su oluşur, bu olaya nötrleşme denir.

Diğer şıklar: **B** çözünmeyi nötrleşme ile karıştırmak / **C** hâl değişimini nötrleşme ile karıştırmak / **D** yanmayı nötrleşme ile karıştırmak.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Fabrikalardan salınan kükürt dioksit ve azot oksit gibi gazlar yağmur suyuna karıştığında aşağıdakilerden hangisi oluşur?$q$, array[$o$Asit yağmuru$o$, $o$Sera etkisi$o$, $o$Nötr yağmur$o$, $o$Bazik yağmur$o$], 0, $e$1. Bu gazlar yağmur suyuyla birleşerek asit oluşturur.
2. Oluşan asit yağmuru binalara, ormanlara ve göllere zarar verir.

Diğer şıklar: **B** sera etkisini asit yağmuru ile karıştırmak / **C** karışımın özelliğini yanlış bilmek / **D** asit gazı ürününü baz sanmak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Bir öğrenci, bir deneyde gözlemlerini aşağıdaki tabloya yazmıştır.

| Deney | Gözlem |
| --- | --- |
| 1 | Katı madde ısıtıldığında eriyor, soğutulunca eski hâlini alıyor. |
| 2 | Beyaz toz suya atılıyor, kaybolup berrak çözelti oluşuyor. |
| 3 | Gri bir tel ısıtıldığında renk değiştiriyor ve gevrek bir madde oluşuyor. |
| 4 | Su kaynatılınca buhar çıkıyor. |

Buna göre hangi deneyde kimyasal değişim gerçekleşmiştir?$q$, array[$o$1$o$, $o$2$o$, $o$3$o$, $o$4$o$], 2, $e$1. 3. deneyde tel ısıtılınca farklı özelliklere sahip yeni bir madde oluşuyor.
2. Diğer deneylerde madde kimliği değişmeden yalnızca hâl ya da görünüm değişir.

Diğer şıklar: **A** erimeyi kimyasal sanmak / **B** çözünmeyi kimyasal sanmak / **D** buharlaşmayı kimyasal sanmak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Açık bir kapta mermer parçası üzerine seyreltik asit damlatıldığında gaz kabarcıkları çıkıyor ve kabın kütlesinin azaldığı görülüyor.

Bu durum için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Kütle yok olmuştur, bu yüzden kütlenin korunumu kanunu geçersizdir.$o$, $o$Çıkan gaz kaptan ayrıldığı için kütle azalmıştır, kütlenin korunumu yine geçerlidir.$o$, $o$Mermer asitle fiziksel değişime uğramıştır, bu yüzden kütle azalmıştır.$o$, $o$Asit buharlaştığı için kütle azalmıştır, tepkime olmamıştır.$o$], 1, $e$1. Mermer ile asit tepkimeye girer ve karbondioksit gazı oluşur.
2. Gaz açık kaptan uzaklaşır. Toplam kütle korunur, ancak gazın kütlesi kapta ölçülemez.

Diğer şıklar: **A** kütle azalmasını yok olma sanmak / **C** gaz çıkışını fiziksel değişim sanmak / **D** gaz çıkışının tepkime işareti olduğunu bilmemek.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda dört çözeltinin pH değerleri verilmiştir.

| Çözelti | X | Y | Z | T |
| --- | --- | --- | --- | --- |
| pH | 2 | 6 | 8 | 13 |

Buna göre bu çözeltilerin asitlik özelliğinden bazlık özelliğine doğru sıralanışı aşağıdakilerden hangisidir?$q$, array[$o$T, Z, Y, X$o$, $o$Y, X, Z, T$o$, $o$X, Y, T, Z$o$, $o$X, Y, Z, T$o$], 3, $e$1. pH 7'den küçük olanlar asittir ve değer küçüldükçe asitlik artar, X en kuvvetli asittir.
2. pH 7'den büyük olanlar bazdır ve değer büyüdükçe bazlık artar. Sıralama X, Y, Z, T olur.

Diğer şıklar: **A** sıralamayı ters kurmak / **B** pH 2 ile 6'nın asitlik derecesini karıştırmak / **C** pH 8 ile 13'ün bazlık derecesini karıştırmak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Klor (Cl), periyodik sistemde 7A grubunda yer alan aktif bir ametaldir.

Buna göre aşağıdaki elementlerden hangisinin kimyasal özellikleri klora en çok benzer?$q$, array[$o$Flor (F)$o$, $o$Argon (Ar)$o$, $o$Sodyum (Na)$o$, $o$Kükürt (S)$o$], 0, $e$1. Aynı grupta bulunan elementlerin kimyasal özellikleri benzerdir.
2. Flor da 7A grubundadır. Ar, Na ve S ise klorla aynı periyottadır ama farklı gruplardadır.

Diğer şıklar: **B** periyottaki komşu elementi benzer sanmak / **C** periyottaki komşu metali benzer sanmak / **D** periyottaki komşu elementi benzer sanmak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$X elementi parlaktır, tel ve levha hâline getirilebilir, ısıyı ve elektriği iyi iletir.

Buna göre X elementi için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Ametaldir.$o$, $o$Metaldir.$o$, $o$Soygazdır.$o$, $o$Yarı metaldir.$o$], 1, $e$1. Parlak, işlenebilir ve ısıyı elektriği iyi ileten elementler metaldir.
2. Ametaller mat ve kırılgandır, soygazlar tepkimeye isteksizdir.

Diğer şıklar: **A** özellikleri ametal özellikleriyle karıştırmak / **C** soygazın özelliklerini bilmemek / **D** yarı metali metalle karıştırmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Aşağıdaki davranışlardan hangisi sağlık ve çevre açısından **yanlıştır**?$q$, array[$o$Kimyasal atıkları arıtma tesisinden geçirdikten sonra bırakmak$o$, $o$Plastik atıkları ayrı toplayıp geri dönüşüme vermek$o$, $o$Çamaşır suyu ile tuz ruhunu karıştırarak banyoyu temizlemek$o$, $o$Temizlik maddelerini etiketlerindeki uyarılara göre kullanmak$o$], 2, $e$1. Çamaşır suyu ile tuz ruhu karışınca zehirli gaz çıkar.
2. Diğer davranışlar doğrudur.

Diğer şıklar: **A** doğru davranışı yanlış sanmak / **B** doğru davranışı yanlış sanmak / **D** doğru davranışı yanlış sanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | Basit Makineler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Basit Makineler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Bir cisme 10 N'luk kuvvet uygulanarak cisim kuvvet doğrultusunda 3 m yer değiştiriyor.

Buna göre yapılan iş kaç joule'dür?$q$, array[$o$3$o$, $o$13$o$, $o$30$o$, $o$300$o$], 2, $e$1. İş, kuvvet ile kuvvet yönündeki yolun çarpımıdır: $W = F \cdot x$.
2. $10 \cdot 3 = 30$ J.

Diğer şıklar: **A** kuvvet ile yolu bölmek yerine yolu yazmak / **B** kuvvet ile yolu toplamak / **D** yolu 10 ile fazladan çarpmak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Ağırlığı 60 N olan bir yük, sürtünmelerin ve makara ağırlığının önemsenmediği bir sabit makara ile kaldırılıyor.

Buna göre yükü dengeleyen kuvvet kaç N'dur?$q$, array[$o$20$o$, $o$30$o$, $o$60$o$, $o$120$o$], 2, $e$1. Sabit makarada kuvvet kazancı yoktur, yalnızca kuvvetin yönü değişir.
2. Bu yüzden $F = G = 60$ N.

Diğer şıklar: **A** kuvvetin üçte birine düştüğünü sanmak / **B** sabit makarada kuvvetin yarıya indiğini sanmak / **D** kuvvetin iki katı gerektiğini sanmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Ağırlığı 80 N olan bir yük, ağırlığı önemsenmeyen bir hareketli makara ile kaldırılıyor.

Buna göre ipe uygulanan kuvvet en az kaç N olmalıdır?$q$, array[$o$20$o$, $o$80$o$, $o$40$o$, $o$160$o$], 2, $e$1. Hareketli makarada yük iki ip tarafından taşınır ve kuvvet yarıya iner.
2. $F = \dfrac{G}{2} = \dfrac{80}{2} = 40$ N.

Diğer şıklar: **A** kuvvetin dörtte birine düştüğünü sanmak / **B** hareketli makarada kuvvet kazancı olmadığını sanmak / **D** kuvvetin iki katı gerektiğini sanmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Basit makinelerle ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Kuvvetten kazanç sağlanan durumlarda yoldan kayıp olur.$o$, $o$İş kazancı sağlayarak yapılan işi azaltırlar.$o$, $o$Hem kuvvetten hem yoldan aynı anda kazanç sağlarlar.$o$, $o$Yalnızca kuvvetin yönünü değiştirirler.$o$], 0, $e$1. Basit makineler iş kazancı sağlamaz, sürtünmesiz durumda iş değişmez.
2. Kuvvetten kazanç sağlanırsa yol uzar, yani yoldan kayıp olur.

Diğer şıklar: **B** basit makinelerin iş kazancı sağladığını sanmak / **C** kuvvet ve yol kazancının birlikte olabileceğini sanmak / **D** yalnızca sabit makarayı genellemek.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Yük kolu 20 cm, kuvvet kolu 80 cm olan bir kaldıraç dengededir. Yükün ağırlığı 40 N'dur.

Buna göre kuvvet kaç N'dur?$q$, array[$o$4$o$, $o$10$o$, $o$20$o$, $o$160$o$], 1, $e$1. Kaldıraç dengede iken $F \cdot l_k = G \cdot l_y$ olur.
2. $F \cdot 80 = 40 \cdot 20$ olduğundan $F = 10$ N.

Diğer şıklar: **A** kuvvet kolunu yük koluna bölmek / **C** kuvveti yük kolunun değeriyle eşlemek / **D** kuvveti kolların oranıyla çarpmak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Sürtünmesiz bir eğik düzlemde ağırlığı 100 N olan bir yük, 2 m yüksekliğe 10 m uzunluğundaki rampa ile çıkarılacaktır.

Buna göre yükü çekmek için gereken kuvvet kaç N'dur?$q$, array[$o$10$o$, $o$20$o$, $o$50$o$, $o$200$o$], 1, $e$1. Eğik düzlemde $F \cdot \ell = G \cdot h$ olur.
2. $F \cdot 10 = 100 \cdot 2$ olduğundan $F = 20$ N.

Diğer şıklar: **A** boyu yükseklikle karıştırmak / **C** kuvvetin yarıya indiğini varsaymak / **D** kuvveti yük ile yüksekliğin çarpımı sanmak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Birbirine temas eden iki dişli çarktan 40 dişli olan 3 tur atarken 20 dişli olan kaç tur atar?$q$, array[$o$1,5$o$, $o$3$o$, $o$6$o$, $o$12$o$], 2, $e$1. Dişlilerde diş sayısı ile dönme sayısının çarpımı eşittir: $40 \cdot 3 = 20 \cdot N$.
2. $N = 6$ tur.

Diğer şıklar: **A** dönme sayısını ters oranlamak / **B** dişli sayısını dönme sayısına etkisiz sanmak / **D** dişli sayılarını çarpmak.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Bir bisikletin pedal dişlisi, arka dişliye zincirle bağlıdır.

Buna göre pedal dişlisi saat yönünde dönerken arka dişli nasıl döner?$q$, array[$o$Saat yönünün tersine döner.$o$, $o$Dönmeden sabit kalır.$o$, $o$Önce saat yönünde sonra tersine döner.$o$, $o$Saat yönünde döner.$o$], 3, $e$1. Zincir ya da kayışla bağlı çarklar aynı yönde döner.
2. Birbirine doğrudan temas eden dişliler ise zıt yönde döner.

Diğer şıklar: **A** temas eden dişlilerin yönüyle karıştırmak / **B** zincirin iletimini bilmemek / **C** yön değişimini sanmak.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Kolun yarıçapı 40 cm, silindirin yarıçapı 10 cm olan bir çıkrıkla ağırlığı 200 N olan yük dengeleniyor.

Buna göre kola uygulanan kuvvet kaç N'dur?$q$, array[$o$20$o$, $o$50$o$, $o$200$o$, $o$800$o$], 1, $e$1. Çıkrıkta denge koşulu $F \cdot R = G \cdot r$ dir.
2. $F \cdot 40 = 200 \cdot 10$ olduğundan $F = 50$ N.

Diğer şıklar: **A** yarıçapları yanlış eşlemek / **C** kuvvet kazancını yok saymak / **D** kuvveti kolların oranıyla çarpmak.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Bir tahterevallinin destek noktasına 2 m uzaklıkta ağırlığı 30 kg olan bir çocuk oturuyor. Tahterevalliyi dengelemek için diğer çocuk destek noktasına 1,5 m uzaklıkta oturuyor.

Buna göre ikinci çocuğun kütlesi kaç kg'dır?$q$, array[$o$40$o$, $o$22,5$o$, $o$30$o$, $o$60$o$], 0, $e$1. Tahterevalli bir kaldıraçtır. Dengede kütle ile kolun çarpımı eşit olur.
2. $30 \cdot 2 = m \cdot 1{,}5$ olduğundan $m = 40$ kg.

Diğer şıklar: **B** oranı ters kurmak / **C** uzaklıkları dikkate almamak / **D** yalnızca bir uzaklıkla çarpmak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Ağırlığı 120 N olan bir yük, ağırlığı önemsenmeyen bir hareketli makara ile 2 m yükseltiliyor.

Buna göre ipin ucu kaç m çekilmelidir?$q$, array[$o$1$o$, $o$2$o$, $o$8$o$, $o$4$o$], 3, $e$1. Hareketli makarada kuvvetten 2 kat kazanç sağlanır, yoldan 2 kat kayıp olur.
2. Yük 2 m yükselirken ip $2 \cdot 2 = 4$ m çekilir.

Diğer şıklar: **A** yükseklikle yolu bölmek / **B** yoldan kazanç sanmak / **C** yükseltmeyi dört katı almak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Sürtünmesiz bir eğik düzlemde ağırlığı 200 N olan bir yük, 5 m uzunluğundaki rampa ile 1,5 m yüksekliğe çıkarılıyor.

Buna göre kuvvetin yaptığı iş ve uygulanan kuvvet aşağıdakilerden hangisidir?$q$, array[$o$300 J, 40 N$o$, $o$1000 J, 60 N$o$, $o$60 J, 300 N$o$, $o$300 J, 60 N$o$], 3, $e$1. Sürtünmesiz durumda iş, yükü yükseltmek için gereken işe eşittir: $W = G \cdot h = 200 \cdot 1{,}5 = 300$ J.
2. $F \cdot 5 = 300$ olduğundan $F = 60$ N.

Diğer şıklar: **A** kuvveti yük ile yüksekliğin oranı sanmak / **B** işi yük ile boyun çarpımı almak / **C** iş ile kuvvet değerlerini yer değiştirmek.$e$, 2),
  (13, 'lgs-fen', null::integer, $q$Eşit bölmeli bir kaldıraçta destek noktasının solunda 3. bölmeye 40 N'luk yük asılıdır. Kaldıracı dengelemek için destek noktasının sağında 2. bölmeye bir yük asılacaktır.

Buna göre asılması gereken yükün ağırlığı kaç N olmalıdır?$q$, array[$o$60$o$, $o$20$o$, $o$40$o$, $o$120$o$], 0, $e$1. Denge için $40 \cdot 3 = G \cdot 2$ olmalıdır.
2. $G = 60$ N.

Diğer şıklar: **B** kolları ters oranlamak / **C** kolları eşit sanmak / **D** kolları çarpmak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Birbirine temas eden üç dişli çarkın diş sayıları A için 40, B için 20 ve C için 10'dur. A dişlisi saat yönünde 1 tur atıyor.

Buna göre C dişlisi hangi yönde kaç tur atar?$q$, array[$o$Saat yönünde 4 tur$o$, $o$Saat yönünün tersinde 4 tur$o$, $o$Saat yönünde 2 tur$o$, $o$Saat yönünün tersinde 2 tur$o$], 0, $e$1. A ile B temas ettiği için B zıt yönde döner. B, A'nın 2 katı, yani 2 tur atar.
2. B ile C temas eder, C zıt yönde döner ve B'nin 2 katı, yani 4 tur atar. C, A ile aynı yöndedir.

Diğer şıklar: **B** ardışık iki temasta yönün değişmediğini kaçırmak / **C** yalnızca bir dişliyi hesaba katmak / **D** hem yönü hem sayıyı hatalı almak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$Aşağıdaki basit makinelerden hangisinde kuvvetten kazanç **sağlanmaz**?$q$, array[$o$Hareketli makara$o$, $o$Sabit makara$o$, $o$Eğik düzlem$o$, $o$Kuvvet kolu uzun bir kaldıraç$o$], 1, $e$1. Sabit makara kuvvetin yalnızca yönünü değiştirir. $F = G$ olur.
2. Diğerlerinde kuvvetten kazanç vardır, karşılığında yoldan kayıp olur.

Diğer şıklar: **A** kuvvet kazancı olduğunu bilmemek / **C** kuvvet kazancı olduğunu bilmemek / **D** kuvvet kazancı olduğunu bilmemek.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Sürtünme ve makara ağırlığı önemsenmeyen bir hareketli makarada Ali, ipi 10 N'luk kuvvetle 4 m çekiyor.

Buna göre kaldırılan yükün ağırlığı ve yükselme miktarı aşağıdakilerden hangisidir?$q$, array[$o$10 N, 4 m$o$, $o$20 N, 4 m$o$, $o$40 N, 2 m$o$, $o$20 N, 2 m$o$], 3, $e$1. Hareketli makarada kuvvet yarıya iner, yani yük 20 N'dur.
2. İpin ucu 4 m çekilirken yük 2 m yükselir. Yapılan iş $10 \cdot 4 = 20 \cdot 2 = 40$ J'dür.

Diğer şıklar: **A** kuvvet ve yol kazancını yok saymak / **B** yoldan kazanç sanmak / **C** ağırlığı yol ile çarpmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | Enerji Dönüşümleri ve Çevre Bilimi konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Enerji Dönüşümleri ve Çevre Bilimi konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Bir güneş panelinde meydana gelen enerji dönüşümü aşağıdakilerden hangisidir?$q$, array[$o$Elektrik enerjisi → ışık enerjisi$o$, $o$Kimyasal enerji → elektrik enerjisi$o$, $o$Işık enerjisi → elektrik enerjisi$o$, $o$Isı enerjisi → hareket enerjisi$o$], 2, $e$1. Güneş panelleri Güneş'ten gelen ışık enerjisini elektrik enerjisine çevirir.
2. Elektrik enerjisinden ışık elde edilen araç ampuldür, kimyasal enerjiden elektrik elde edilen araç ise pildir.

Diğer şıklar: **A** dönüşümün yönünü ters kurmak / **B** pil dönüşümü ile karıştırmak / **D** ilgisiz bir dönüşümü seçmek.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Fotosentez olayında aşağıdaki maddelerden hangisi ürün olarak oluşur?$q$, array[$o$Karbondioksit ve su$o$, $o$Glikoz ve oksijen$o$, $o$Karbondioksit ve glikoz$o$, $o$Su ve oksijen$o$], 1, $e$1. Fotosentezde karbondioksit ve su ışık enerjisiyle glikoza ve oksijene dönüşür.
2. Karbondioksit ve su fotosentezin girenleridir.

Diğer şıklar: **A** girenleri ürün sanmak / **C** girenle ürünü karıştırmak / **D** girenle ürünü karıştırmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Hücresel solunum canlı hücrelerinde hangi organelde gerçekleşir?$q$, array[$o$Kloroplast$o$, $o$Çekirdek$o$, $o$Mitokondri$o$, $o$Koful$o$], 2, $e$1. Hücresel solunum, besinlerdeki enerjinin açığa çıkarıldığı olaydır ve mitokondride gerçekleşir.
2. Kloroplast fotosentezin yapıldığı organeldir.

Diğer şıklar: **A** fotosentez organeli ile karıştırmak / **B** genetik bilgi merkezini solunum merkezi sanmak / **D** depolama organelini solunum organeli sanmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Aşağıdakilerden hangisi yenilenebilir enerji kaynağıdır?$q$, array[$o$Kömür$o$, $o$Doğal gaz$o$, $o$Petrol$o$, $o$Rüzgâr enerjisi$o$], 3, $e$1. Rüzgâr, güneş, su ve jeotermal kaynaklar tükenmez, yenilenebilir enerji kaynaklarıdır.
2. Kömür, petrol ve doğal gaz fosil yakıttır ve tükenir.

Diğer şıklar: **A** fosil yakıtı yenilenebilir sanmak / **B** fosil yakıtı yenilenebilir sanmak / **C** fosil yakıtı yenilenebilir sanmak.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Bir besin zinciri şöyledir: Ot → Çekirge → Kurbağa → Yılan.

Bu zincirde kurbağa için aşağıdakilerden hangisi doğrudur?$q$, array[$o$İkincil tüketicidir ve çekirgeyle beslenir.$o$, $o$Üreticidir ve fotosentez yapar.$o$, $o$Birincil tüketicidir ve otla beslenir.$o$, $o$Ayrıştırıcıdır ve ölü canlıları parçalar.$o$], 0, $e$1. Ot üretici, çekirge otla beslendiği için birincil tüketicidir.
2. Kurbağa çekirge yediği için ikincil tüketicidir.

Diğer şıklar: **B** tüketiciyi üretici sanmak / **C** basamağı yanlış saymak / **D** tüketiciyi ayrıştırıcı sanmak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Bir besin zincirinde enerji akışı sırasında üst basamaklara çıkıldıkça canlı sayısının azalması aşağıdakilerden hangisiyle açıklanır?$q$, array[$o$Her basamakta enerjinin tamamının bir üst basamağa aktarılması ve birikmesi$o$, $o$Üst basamaktaki canlıların yaşamsal faaliyetlerde hiç enerji harcamaması$o$, $o$Her basamakta enerjinin büyük kısmının solunum ve ısı olarak harcanması$o$, $o$Alt basamaktaki canlıların fotosentezle besin üretememesi$o$], 2, $e$1. Her basamakta enerjinin büyük kısmı solunum, hareket ve ısı olarak kullanılır.
2. Yalnızca küçük bir kısmı bir üst basamağa geçtiği için üst basamaklarda canlı sayısı azalır.

Diğer şıklar: **A** enerjinin kayıpsız aktarıldığını sanmak / **B** tüketicilerin yaşamsal faaliyetlerini yok saymak / **D** üreticinin görevini bilmemek.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Aşağıdaki bilgilerden hangisi madde ve enerjinin doğadaki dolaşımıyla ilgili doğrudur?$q$, array[$o$Madde tek yönlü akar, enerji ise döngü yapar.$o$, $o$Hem madde hem enerji tamamen yok olur.$o$, $o$Madde ve enerji doğada yoktan var olabilir.$o$, $o$Madde döngü yapar, enerji ise tek yönlü akar.$o$], 3, $e$1. Madde ayrıştırıcılar ve döngüler sayesinde tekrar tekrar kullanılır.
2. Enerji Güneş'ten gelir ve sonunda ısı olarak dağılır, tek yönlüdür.

Diğer şıklar: **A** madde ile enerjiyi ters yorumlamak / **B** korunum ilkesini bilmemek / **C** korunum ilkesini bilmemek.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Ayrıştırıcılar ekosistemden tamamen kaldırılsaydı aşağıdakilerden hangisi gerçekleşirdi?$q$, array[$o$Bitkiler fotosentez yapamaz, besin zinciri anında sona ererdi.$o$, $o$Ölü canlılardaki maddeler toprağa dönemez, bitkiler zorlanırdı.$o$, $o$Ölü canlılar daha hızlı parçalanır, toprak daha verimli olurdu.$o$, $o$Su döngüsü durur, hiçbir yerde yağış olmazdı ve bulut oluşmazdı.$o$], 1, $e$1. Ayrıştırıcılar ölü canlıları ve atıkları parçalayarak maddelerin toprağa geri dönmesini sağlar.
2. Onlar olmasaydı madde döngüsü kesilir ve bitkiler besin bulamazdı.

Diğer şıklar: **A** ayrıştırıcıların görevini üreticilerle karıştırmak / **C** ayrıştırıcıların görevini tersine yorumlamak / **D** ilgisiz bir döngüyü seçmek.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Bitkiler fotosentez yaparken havadan karbondioksit alır, canlılar solunum yaparken ise karbondioksit verir.

Bu bilgilerden yola çıkarak atmosferdeki karbondioksit miktarıyla ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Ormanların artması karbondioksit miktarını artırır.$o$, $o$Solunum, atmosferdeki karbondioksiti azaltır.$o$, $o$Fosil yakıt kullanımı karbondioksit miktarını etkilemez.$o$, $o$Ormanların yok edilmesi karbondioksit miktarını artırır.$o$], 3, $e$1. Ormanlar fotosentezle karbondioksit alır. Orman yok edilince bu gazı yutan bitki azalır ve atmosferde birikir.
2. Solunum ve fosil yakıtların yanması karbondioksit verir.

Diğer şıklar: **A** ormanların fotosentezle karbondioksit aldığını bilmemek / **B** solunumun karbondioksit verdiğini bilmemek / **C** yakıtların karbondioksit saldığını bilmemek.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Aşağıdaki enerji dönüşümlerinden hangisi yanlış verilmiştir?$q$, array[$o$Pil: Elektrik enerjisi → Kimyasal enerji$o$, $o$Ampul: Elektrik enerjisi → Işık enerjisi$o$, $o$Elektrik süpürgesi: Elektrik enerjisi → Hareket enerjisi$o$, $o$Yemek yiyen insan: Kimyasal enerji → Hareket enerjisi$o$], 0, $e$1. Pil, depolanmış kimyasal enerjiyi elektrik enerjisine dönüştürür.
2. Verilen dönüşüm ters yazılmıştır.

Diğer şıklar: **B** doğru dönüşümü yanlış sanmak / **C** doğru dönüşümü yanlış sanmak / **D** doğru dönüşümü yanlış sanmak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Fotosentez ve hücresel solunum karşılaştırıldığında aşağıdaki ifadelerden hangisi doğrudur?$q$, array[$o$Fotosentezin ürünleri, hücresel solunumun girenleridir.$o$, $o$Fotosentez enerji açığa çıkarır, solunum enerji depolar.$o$, $o$İkisi de yalnızca kloroplastlı hücrelerde gerçekleşir.$o$, $o$İkisinde de karbondioksit ürün olarak oluşur.$o$], 0, $e$1. Fotosentezin ürünleri glikoz ve oksijendir. Hücresel solunumda bu maddeler harcanır.
2. Solunumun ürünleri karbondioksit ve sudur, bunlar da fotosentezin girenleridir.

Diğer şıklar: **B** iki olayı ters yorumlamak / **C** solunumun tüm hücrelerde olduğunu bilmemek / **D** fotosentezin girenini ürün sanmak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda dört canlının bir ekosistemdeki besin ilişkisi verilmiştir.

| Canlı | Beslendiği canlı |
| --- | --- |
| Tavşan | Ot |
| Tilki | Tavşan |
| Kartal | Tilki |

Tilkilerin sayısı bir hastalık yüzünden hızla azaldığında kısa sürede ilk olarak aşağıdakilerden hangisi beklenir?$q$, array[$o$Tavşan sayısı azalır, ot miktarı artar.$o$, $o$Tavşan sayısı artar, ot miktarı azalır.$o$, $o$Kartal sayısı artar, ot miktarı değişmez.$o$, $o$Ot sayısı artar, tavşan sayısı değişmez.$o$], 1, $e$1. Tilkiler tavşanla beslenir. Tilki azalınca tavşanlar daha az avlanır ve sayıları artar.
2. Tavşan sayısı arttıkça otlar daha çok yenir ve ot miktarı azalır.

Diğer şıklar: **A** tilki azalmasının tavşana etkisini ters yorumlamak / **C** alt basamakların etkilenmeyeceğini sanmak / **D** tavşanın etkilenmeyeceğini sanmak.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Aşağıdaki enerji akışı şemasında bir besin zincirindeki üç basamağın enerji miktarları gösterilmiştir.

Ot: 10000 kJ → Çekirge: 1000 kJ → Kurbağa: 100 kJ

Bu şemaya göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Bir basamaktan diğerine enerjinin yaklaşık %10'u aktarılır.$o$, $o$Bir basamaktan diğerine enerjinin tamamı aktarılır.$o$, $o$Bir basamaktan diğerine enerjinin yarısı aktarılır.$o$, $o$Enerji miktarı yukarı basamaklara doğru artar.$o$], 0, $e$1. 10000'den 1000'e, 1000'den 100'e geçişte enerjinin onda biri aktarılmıştır.
2. Geri kalan kısım solunum, hareket ve ısı olarak kullanılır.

Diğer şıklar: **B** kayıpsız aktarım varsaymak / **C** oranı yanlış okumak / **D** azalışı artış olarak okumak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Havanın %78'i azottur. Ancak canlıların çoğu bu azotu doğrudan kullanamaz. Baklagil köklerindeki bazı bakteriler azotu bitkilerin kullanabileceği bileşiklere dönüştürür.

Bu bilgiye göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Bu bakteriler, bitkilerin havadan karbondioksit almasını sağlar.$o$, $o$Bitkiler azotu yalnızca solunumla doğrudan alır.$o$, $o$Hayvanlar azotu bitkiler olmadan havadan kullanır.$o$, $o$Bu bakteriler azotun besin zincirine girmesini sağlar.$o$], 3, $e$1. Bakteriler azotu bitkilerin kullanabileceği bileşiklere çevirir.
2. Bitkiler bu bileşikleri alır, hayvanlar bitkileri yer. Böylece azot besin zincirine girer.

Diğer şıklar: **A** azot ile karbon döngüsünü karıştırmak / **B** bakterilerin rolünü yok saymak / **C** hayvanların azotu doğrudan kullandığını sanmak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$Sürdürülebilir kalkınma için aşağıdakilerden hangisi yapılabilir?$q$, array[$o$Enerji ihtiyacını yalnızca kömürden karşılamak$o$, $o$Ormanlık alanları tarım için hızla yok etmek$o$, $o$Kâğıt, cam ve plastik atıkları geri dönüşüme vermek$o$, $o$Kullanılmayan cihazları sürekli açık bırakmak$o$], 2, $e$1. Sürdürülebilirlik, gelecek nesillerin kaynaklarını tüketmeden bugünün ihtiyaçlarını karşılamaktır.
2. Geri dönüşüm kaynak kullanımını ve atık miktarını azaltır.

Diğer şıklar: **A** fosil yakıta bağımlılığı artırmak / **B** kaynakları tüketmeyi sürdürülebilir sanmak / **D** enerji israfını sürdürülebilir sanmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Aşağıdaki durumlardan hangisinde bir enerji dönüşümü diğerlerinden farklı bir yönde gerçekleşir?$q$, array[$o$Bir ampulün elektrikle ışık yayması$o$, $o$Bir pilin elektrik enerjisi üretmesi$o$, $o$Bir radyonun elektrikle ses çıkarması$o$, $o$Bir ısıtıcının elektrikle suyu ısıtması$o$], 1, $e$1. Ampul, radyo ve ısıtıcıda elektrik enerjisi başka türlere dönüşür.
2. Pilde ise kimyasal enerji elektrik enerjisine dönüşür, yani diğerlerinden farklı yöndedir.

Diğer şıklar: **A** elektrikten ışığa dönüşümü seçmek / **C** elektrikten sese dönüşümü seçmek / **D** elektrikten ısıya dönüşümü seçmek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | Elektrik Yükleri ve Elektrik Enerjisi konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Elektrik Yükleri ve Elektrik Enerjisi konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Katı bir cismin elektrik yükü kazanması ya da kaybetmesi sırasında hangi parçacıklar bir cisimden diğerine geçer?$q$, array[$o$Elektronlar$o$, $o$Protonlar$o$, $o$Nötronlar$o$, $o$Protonlar ve nötronlar$o$], 0, $e$1. Protonlar ve nötronlar çekirdekte bulunur ve yerinden ayrılmaz.
2. Cisimlerin yüklenmesi elektron alışverişiyle olur.

Diğer şıklar: **B** protonların çekirdekten ayrılabileceğini sanmak / **C** yüksüz parçacığı yük taşıyıcı sanmak / **D** çekirdek parçacıklarını yük taşıyıcı sanmak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Pozitif (+) yüklü A cismi, B cismini itiyor.

Buna göre B cismi için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Pozitif yüklüdür.$o$, $o$Negatif yüklüdür.$o$, $o$Nötrdür.$o$, $o$Yük cinsi belirlenemez.$o$], 0, $e$1. Yalnızca aynı cins yükler birbirini iter.
2. A pozitif olduğundan B de pozitiftir.

Diğer şıklar: **B** zıt yüklerin ittiğini sanmak / **C** nötr cismin itildiğini sanmak / **D** itmenin yük cinsini belirlediğini bilmemek.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Bir cisimde 5 proton ve 3 elektron bulunmaktadır.

Buna göre bu cismin yükü ile ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$2 birim negatif yüklüdür.$o$, $o$8 birim pozitif yüklüdür.$o$, $o$2 birim pozitif yüklüdür.$o$, $o$Nötrdür.$o$], 2, $e$1. Yük, proton sayısı ile elektron sayısı arasındaki farktır.
2. Proton fazla olduğundan cisim 5 - 3 = 2 birim pozitif yüklüdür.

Diğer şıklar: **A** protonla elektronun farkını ters yorumlamak / **B** proton ve elektron sayısını toplamak / **D** yük farkını fark etmemek.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Ebonit çubuk yünlü kumaşa sürtülüyor ve ebonit çubuk negatif yüklenmiş oluyor.

Buna göre yünlü kumaşın yükü ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Negatif yüklenir, çünkü elektron kazanmıştır.$o$, $o$Nötr kalır, çünkü yük alışverişi olmamıştır.$o$, $o$Pozitif yüklenir, çünkü proton kazanmıştır.$o$, $o$Pozitif yüklenir, çünkü elektron kaybetmiştir.$o$], 3, $e$1. Sürtünmeyle yüklenmede iki cisim zıt cins ve eşit miktarda yüklenir.
2. Ebonit elektron kazandığına göre kumaş elektron kaybeder ve pozitif yüklenir.

Diğer şıklar: **A** kumaşın da çubukla aynı yüklendiğini sanmak / **B** sürtünmede iki cismin yük alıp verdiğini bilmemek / **C** protonun geçtiğini sanmak.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Nötr bir elektroskobun topuzuna, dokunmadan negatif yüklü bir çubuk yaklaştırılıyor.

Buna göre elektroskopta aşağıdakilerden hangisi gözlenir?$q$, array[$o$Yapraklar kapalı kalır, çünkü elektroskop nötrdür.$o$, $o$Yapraklar açılır, çünkü yapraklar zıt cins yükle yüklenir.$o$, $o$Yapraklar kapanır, çünkü topuz pozitif olur.$o$, $o$Yapraklar açılır, çünkü yapraklar aynı cins yükle yüklenir.$o$], 3, $e$1. Negatif çubuk elektronları topuzdan uzağa, yapraklara doğru iter.
2. Yapraklar aynı cins (negatif) yüklenir ve birbirini iterek açılır.

Diğer şıklar: **A** yaklaştırmanın etkisini yok saymak / **B** yapraklardaki yükü yanlış belirlemek / **C** kapanmayı açılma yerine yorumlamak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Yükü -6 birim olan özdeş iletken bir küre, nötr özdeş bir iletken küreye dokundurulup ayrılıyor.

Buna göre kürelerin son yükleri aşağıdakilerden hangisidir?$q$, array[$o$Biri -6, diğeri 0 birim$o$, $o$Biri -6, diğeri +6 birim$o$, $o$Her ikisi de -3 birim$o$, $o$Her ikisi de -6 birim$o$], 2, $e$1. Dokunma ile yüklenmede yük, özdeş iletkenler arasında eşit paylaşılır.
2. Toplam yük -6 birim olduğundan her küre -3 birim yüklü olur.

Diğer şıklar: **A** dokunma ile yük paylaşıldığını bilmemek / **B** dokunmayı sürtünme gibi yorumlamak / **D** yükün çoğaldığını sanmak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Negatif yüklü bir çubuk, topraklanmış nötr bir iletken küreye dokunmadan yaklaştırılıyor. Ardından önce toprak bağlantısı, sonra çubuk uzaklaştırılıyor.

Buna göre küre hangi yükle yüklenir?$q$, array[$o$Negatif$o$, $o$Nötr kalır$o$, $o$Önce negatif sonra pozitif$o$, $o$Pozitif$o$], 3, $e$1. Etki ile yüklenmede iletken, yaklaştırılan cismin tersi cins yükle yüklenir.
2. Negatif çubuk elektronları toprağa gönderir, küre elektron kaybeder ve pozitif kalır.

Diğer şıklar: **A** etki ile yüklenmede çubukla aynı yükü almak / **B** toprak bağlantısının etkisini bilmemek / **C** adımları karıştırmak.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Yüksek binalara paratoner takılmasının amacı aşağıdakilerden hangisidir?$q$, array[$o$Yıldırımın oluşmasını tamamen engellemek$o$, $o$Yıldırımın yükünü toprağa ileterek binayı korumak$o$, $o$Bulutlardaki yükün bina içinde depolanmasını sağlamak$o$, $o$Binayı rüzgârdan korumak$o$], 1, $e$1. Paratoner, sivri uçlu metal bir çubuktur.
2. Yıldırım yükünü metal yoldan toprağa iletir ve bina zarar görmez.

Diğer şıklar: **A** paratonerin yıldırımı önlediğini sanmak / **C** yükün binada tutulduğunu sanmak / **D** ilgisiz bir görev saymak.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Gücü 100 W olan bir ampul günde 5 saat yanıyor.

Buna göre bu ampulün bir günde harcadığı elektrik enerjisi kaç kWh'dir?$q$, array[$o$0,05$o$, $o$0,5$o$, $o$5$o$, $o$500$o$], 1, $e$1. Gücü kilowatta çevir: 100 W = 0,1 kW.
2. $E = P \cdot t = 0{,}1 \cdot 5 = 0{,}5$ kWh.

Diğer şıklar: **A** watt kilowatt dönüşümünde virgülü yanlış kaydırmak / **C** gücü kilowatt çevirmeden saatle çarpmak / **D** watt değerini doğrudan kullanmak.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Gücü 2000 W olan bir ütü günde 1,5 saat çalıştırılıyor ve 1 kWh elektrik enerjisinin fiyatı 4 TL'dir.

Buna göre bu ütünün bir günde elektrik maliyeti kaç TL'dir?$q$, array[$o$12$o$, $o$3$o$, $o$8$o$, $o$12000$o$], 0, $e$1. Gücü kilowatta çevir: 2000 W = 2 kW.
2. Enerji $2 \cdot 1{,}5 = 3$ kWh olur. Maliyet $3 \cdot 4 = 12$ TL.

Diğer şıklar: **B** enerjiyi fiyatla çarpmayı unutmak / **C** 1,5 saat yerine 1 saat hesaplamak / **D** watt değerini kilowatta çevirmemek.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda dört cismin birbiriyle etkileşimi verilmiştir. X cismi pozitif (+) yüklüdür.

| Cisimler | Etkileşim |
| --- | --- |
| X ve Y | Çekiyor |
| Y ve Z | İtiyor |
| Z ve T | Çekiyor |

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?$q$, array[$o$Y nötr, Z pozitiftir.$o$, $o$Y ve Z negatif yüklüdür.$o$, $o$Z ve T aynı cins yüklüdür.$o$, $o$Y pozitif, Z negatiftir.$o$], 1, $e$1. X pozitif olduğundan onu çeken Y negatif ya da nötr olabilir. Y ile Z birbirini ittiğine göre ikisi de yüklüdür ve aynı cinstir.
2. Y nötr olamayacağına göre negatiftir. Z de negatiftir.

Diğer şıklar: **A** itme olayında nötr cismin yer alabileceğini sanmak / **C** çekmeyi aynı cins yük sanmak / **D** itme olayında zıt cins yüklerin yer alabileceğini sanmak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Pozitif yüklü bir elektroskopun yaprakları açıktır. Elektroskobun topuzuna dokunmadan negatif yüklü bir çubuk yaklaştırılıyor.

Buna göre yapraklar için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Yaprakların açıklığı hiç değişmez.$o$, $o$Yaprakların açıklığı anında artar.$o$, $o$Yaprakların açıklığı başlangıçta azalır.$o$, $o$Yapraklar zıt cins yükle yüklenir.$o$], 2, $e$1. Negatif çubuk elektronları yapraklara doğru iter. Yapraklardaki pozitif yük azalır.
2. Bu yüzden yapraklar başlangıçta birbirine yaklaşır, açıklık azalır.

Diğer şıklar: **A** yaklaştırmanın etkisini yok saymak / **B** zıt yükün aynı etkiyi yaptığını sanmak / **D** elektroskop yükünün cinsini değiştirdiğini sanmak.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Bir evde günde 5 saat yanan 100 W'lık bir akkor ampul, aynı ışığı veren 20 W'lık bir LED ampulle değiştiriliyor.

Buna göre 30 günde yapılan elektrik enerjisi tasarrufu kaç kWh'dir?$q$, array[$o$3$o$, $o$12$o$, $o$15$o$, $o$18$o$], 1, $e$1. Akkor ampul 30 günde $0{,}1 \cdot 5 \cdot 30 = 15$ kWh harcar.
2. LED ampul $0{,}02 \cdot 5 \cdot 30 = 3$ kWh harcar. Tasarruf $15 - 3 = 12$ kWh.

Diğer şıklar: **A** bir günlük farkı bulup ayla çarpmamak / **C** LED ampulün tüm tüketimini yazmak / **D** akkor ampul tüketiminden yanlış tasarruf hesaplamak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Özdeş iletken A ve B kürelerinin yükleri sırasıyla +8 ve -4 birimdir. Küreler birbirine dokundurulup ayrılıyor.

Buna göre kürelerin son yükleri aşağıdakilerden hangisi olur?$q$, array[$o$Her ikisi de +4 birim$o$, $o$Her ikisi de +6 birim$o$, $o$Her ikisi de +2 birim$o$, $o$A +4, B -2 birim$o$], 2, $e$1. Dokunma ile yük paylaşımında toplam yük korunur: $+8 + (-4) = +4$ birim.
2. Özdeş iletkenler yükü eşit paylaşır. Her biri $+4 \div 2 = +2$ birim olur.

Diğer şıklar: **A** yükleri toplamak yerine büyük yükü almak / **B** işaretleri hesaba katmamak / **D** paylaşım oranını yanlış yapmak.$e$, 3),
  (15, 'lgs-fen', null::integer, $q$Benzin taşıyan tankerlerin arkasından yere değecek şekilde metal bir zincir sarkıtılması aşağıdaki nedenlerden hangisine dayanır?$q$, array[$o$Tankerin yola daha çok tutunmasını sağlamak$o$, $o$Tankerin yük taşıma kapasitesini artırmak$o$, $o$Tanker içindeki benzinin sıcaklığını düşürmek$o$, $o$Sürtünmeyle biriken yükü toprağa iletmek$o$], 3, $e$1. Tanker hareket ederken sürtünmeyle yüklenebilir.
2. Zincir bu yükü toprağa iletir, kıvılcım ve yangın riskini azaltır.

Diğer şıklar: **A** zincirin işlevini hız sanmak / **B** zincirin işlevini taşıma sanmak / **C** zincirin işlevini ısı iletimi sanmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Cam çubuk ipek kumaşa sürtülüyor ve cam çubuk 5 birim pozitif yüklenmiş oluyor.

Buna göre ipek kumaşın yükü aşağıdakilerden hangisi olur?$q$, array[$o$5 birim negatif$o$, $o$5 birim pozitif$o$, $o$Nötr$o$, $o$10 birim negatif$o$], 0, $e$1. Sürtünme ile yüklenmede iki cisim zıt cins ve eşit miktarda yüklenir.
2. Cam pozitif olduğuna göre ipek 5 birim negatif yüklenir.

Diğer şıklar: **B** iki cismin aynı yükle yüklendiğini sanmak / **C** kumaşın yüklenmediğini sanmak / **D** yükün iki katına çıktığını sanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-fen | Basınç konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-fen', t.id, $t$Basınç konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', null::integer, $q$Bir yüzeye dik olarak 200 N'luk kuvvet uygulanıyor ve kuvvetin etki ettiği alan 0,5 m$^2$ oluyor.

Buna göre yüzeye uygulanan basınç kaç paskaldır?$q$, array[$o$40$o$, $o$100$o$, $o$400$o$, $o$4000$o$], 2, $e$1. Basınç, yüzeye dik kuvvetin yüzey alanına bölümüdür: $P = \dfrac{F}{A}$.
2. $P = \dfrac{200}{0{,}5} = 400$ Pa.

Diğer şıklar: **A** bölme işleminde virgülü yanlış kaydırmak / **B** kuvvet ile alanı çıkarmak / **D** bölme işleminde virgülü yanlış kaydırmak.$e$, 1),
  (2, 'lgs-fen', null::integer, $q$Çivinin ucunun sivri yapılmasının nedeni aşağıdakilerden hangisidir?$q$, array[$o$Aynı kuvvetle daha geniş bir alana etki edip basıncı azaltmak$o$, $o$Çivinin ağırlığını artırarak basıncı büyütmek$o$, $o$Çivinin yoğunluğunu azaltarak daha kolay girmesini sağlamak$o$, $o$Aynı kuvvetle daha küçük bir alana etki edip basıncı artırmak$o$], 3, $e$1. Basınç, kuvvet ile doğru, yüzey alanı ile ters orantılıdır.
2. Ucu sivri olan çivide kuvvet küçük bir alana yoğunlaşır ve basınç artar.

Diğer şıklar: **A** alan-basınç ilişkisini ters kurmak / **B** ağırlığı basıncın nedeni sanmak / **C** yoğunlukla karıştırmak.$e$, 1),
  (3, 'lgs-fen', null::integer, $q$Su dolu bir gölde 3 m derinlikteki basınç kaç paskaldır? (Suyun yoğunluğu 1000 kg/m$^3$, $g = 10$ m/s$^2$ alınacaktır.)$q$, array[$o$300$o$, $o$30 000$o$, $o$3000$o$, $o$300 000$o$], 1, $e$1. Sıvı basıncı $P = h \cdot d \cdot g$ ile bulunur.
2. $P = 3 \cdot 1000 \cdot 10 = 30\,000$ Pa.

Diğer şıklar: **A** yoğunluğu hesaba katmamak / **C** bir sıfırı eksik yazmak / **D** bir sıfırı fazla yazmak.$e$, 1),
  (4, 'lgs-fen', null::integer, $q$Dağa çıkıldıkça açık hava basıncı nasıl değişir?$q$, array[$o$Artar, çünkü hava tabakası kalınlaşır.$o$, $o$Değişmez, çünkü hava her yerde aynı ağırlıktadır.$o$, $o$Önce artar sonra azalır, çünkü sıcaklık yükselir.$o$, $o$Azalır, çünkü üstteki hava tabakası incelir.$o$], 3, $e$1. Yükseldikçe üstümüzdeki hava tabakası incelir ve ağırlığı azalır.
2. Bu yüzden açık hava basıncı yükseldikçe azalır.

Diğer şıklar: **A** yüksekliğin etkisini ters yorumlamak / **B** basıncın yükseklikle değişmediğini sanmak / **C** basıncı sıcaklıkla karıştırmak.$e$, 1),
  (5, 'lgs-fen', null::integer, $q$Dikdörtgenler prizması şeklindeki bir tuğla, üç farklı yüzü üzerine sırayla yatay zemine konuyor.

Buna göre aşağıdakilerden hangisi doğrudur?$q$, array[$o$Basınç en dar yüzü üzerindeyken en büyüktür.$o$, $o$Basınç en geniş yüzü üzerindeyken en büyüktür.$o$, $o$Zemine uygulanan kuvvet en dar yüzü üzerindeyken en büyüktür.$o$, $o$Üç durumda da basınç eşittir, çünkü ağırlık sabittir.$o$], 0, $e$1. Tuğlanın ağırlığı değişmez, zemine uyguladığı kuvvet hep aynıdır.
2. Temas alanı küçüldükçe basınç artar. En dar yüzde basınç en büyüktür.

Diğer şıklar: **B** alan-basınç ilişkisini ters kurmak / **C** ağırlığın yüze göre değiştiğini sanmak / **D** alanın etkisini yok saymak.$e$, 2),
  (6, 'lgs-fen', null::integer, $q$Aşağıdaki şekillerde ağzı açık, farklı biçimli üç kabın hepsinde aynı yükseklikte su vardır.

Kab 1: Dar ve uzun, Kab 2: Geniş ve alçak tabanlı, Kab 3: Alt tarafı dar, üst tarafı geniş.

Buna göre kapların tabanlarındaki sıvı basınçları için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Kab 2'de en büyüktür, çünkü sıvı miktarı en fazladır.$o$, $o$Kab 1'de en büyüktür, çünkü kap en dardır.$o$, $o$Kab 3'te en küçüktür, çünkü şekli düzensizdir.$o$, $o$Üçünde de eşittir, çünkü derinlik ve sıvı aynıdır.$o$], 3, $e$1. Sıvı basıncı derinliğe, sıvının yoğunluğuna ve yerçekimine bağlıdır.
2. Kabın şekli ve sıvı miktarı basıncı etkilemez. Üç kapta da derinlik ve sıvı aynı olduğundan basınç eşittir.

Diğer şıklar: **A** basıncı sıvı miktarına bağlamak / **B** basıncı kap genişliğine bağlamak / **C** basıncı kap şekline bağlamak.$e$, 2),
  (7, 'lgs-fen', null::integer, $q$Yoğunluğu 1200 kg/m$^3$ olan tuzlu suda 2 m derinlikteki sıvı basıncı kaç paskaldır? ($g = 10$ m/s$^2$ alınacaktır.)$q$, array[$o$2 400$o$, $o$12 000$o$, $o$24 000$o$, $o$20 000$o$], 2, $e$1. Sıvı basıncı $P = h \cdot d \cdot g$ ile bulunur.
2. $P = 2 \cdot 1200 \cdot 10 = 24\,000$ Pa.

Diğer şıklar: **A** bir sıfırı eksik yazmak / **B** derinliği hesaba katmamak / **D** suyun yoğunluğunu kullanmak.$e$, 2),
  (8, 'lgs-fen', null::integer, $q$Torricelli deneyinde bir ucu kapalı cıva dolu cam boru cıva dolu kaba ters çevriliyor ve boruda cıva belli bir yükseklikte duruyor. Deney daha kalın bir borunun eğik tutulmasıyla tekrarlanıyor.

Buna göre cıva sütununun dikey yüksekliği için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Artar, çünkü boru daha kalın olduğu için basınç artar.$o$, $o$Değişmez, çünkü yalnızca açık hava basıncına bağlıdır.$o$, $o$Azalır, çünkü boru eğik tutulduğu için basınç azalır.$o$, $o$Boru boyuna göre değişir, çünkü sütun boru boyunca yükselir.$o$], 1, $e$1. Cıva sütununun dikey yüksekliği borunun kalınlığına, eğimine ve boyuna bağlı değildir.
2. Yalnızca açık hava basıncına, yani bulunduğun yüksekliğe bağlıdır.

Diğer şıklar: **A** borunun kalınlığının etkili olduğunu sanmak / **C** eğimin etkili olduğunu sanmak / **D** boru boyunun etkili olduğunu sanmak.$e$, 2),
  (9, 'lgs-fen', null::integer, $q$Kapalı bir kaptaki gazın sıcaklığı artırıldığında gaz basıncının artması aşağıdakilerden hangisiyle açıklanır?$q$, array[$o$Gaz parçacıklarının daha yavaş hareket edip kap duvarına daha az çarpması$o$, $o$Gaz parçacıklarının daha hızlı hareket edip kap duvarına daha sık ve sert çarpması$o$, $o$Gaz parçacıklarının sayısının kendiliğinden artması$o$, $o$Gaz parçacıklarının birbirine yapışıp ağırlaşması$o$], 1, $e$1. Sıcaklık artınca parçacıklar hızlanır.
2. Duvara daha sık ve daha sert çarpmaları basıncı artırır.

Diğer şıklar: **A** hızı ters yorumlamak / **C** parçacık sayısının sıcaklıkla değiştiğini sanmak / **D** gaz parçacıklarının yapıştığını sanmak.$e$, 2),
  (10, 'lgs-fen', null::integer, $q$Şırıngaya hava çekilip ucu kapatıldıktan sonra piston itilerek hacim yarıya indiriliyor.

Buna göre şırıngadaki gazın basıncı için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Artar, çünkü parçacıklar duvara daha sık çarpar.$o$, $o$Azalır, çünkü parçacıklar daha az yer kaplar.$o$, $o$Değişmez, çünkü parçacık sayısı değişmemiştir.$o$, $o$Sıfır olur, çünkü gaz sıkışmıştır.$o$], 0, $e$1. Hacim küçülünce aynı sayıdaki parçacık daha dar bir alana sıkışır.
2. Parçacıklar duvara daha sık çarptığı için gaz basıncı artar.

Diğer şıklar: **B** hacim-basınç ilişkisini ters kurmak / **C** hacmin etkisini yok saymak / **D** uç bir sonuca varmak.$e$, 2),
  (11, 'lgs-fen', null::integer, $q$Aşağıdaki tabloda üç cismin yatay zemine uyguladığı kuvvet ve temas alanı verilmiştir.

| Cisim | Kuvvet (N) | Temas alanı (m$^2$) |
| --- | --- | --- |
| X | 100 | 0,5 |
| Y | 150 | 1 |
| Z | 80 | 0,25 |

Buna göre cisimlerin zemine uyguladığı basınçların büyükten küçüğe sıralanışı aşağıdakilerden hangisidir?$q$, array[$o$Y, X, Z$o$, $o$X, Z, Y$o$, $o$Z, X, Y$o$, $o$Y, Z, X$o$], 2, $e$1. Basınç $P = \dfrac{F}{A}$ ile hesaplanır.
2. X: 200 Pa, Y: 150 Pa, Z: 320 Pa. Büyükten küçüğe Z, X, Y olur.

Diğer şıklar: **A** yalnızca kuvvete bakmak / **B** ikinci ve üçüncü cismin basıncını karıştırmak / **D** kuvvet ile alanı çarpmak.$e$, 3),
  (12, 'lgs-fen', null::integer, $q$Bir gölde 5 m derinlikte sıvı basıncı 50 000 Pa olarak ölçülmüştür.

Buna göre aynı gölde 20 m derinlikteki basınç kaç paskaldır?$q$, array[$o$200 000$o$, $o$100 000$o$, $o$150 000$o$, $o$250 000$o$], 0, $e$1. Sıvı basıncı derinlikle doğru orantılıdır.
2. Derinlik $20 \div 5 = 4$ katına çıktığı için basınç $50\,000 \cdot 4 = 200\,000$ Pa olur.

Diğer şıklar: **B** derinliği iki katı almak / **C** yalnızca fark kadar eklemek / **D** derinliği beş katı almak.$e$, 3),
  (13, 'lgs-fen', null::integer, $q$Deniz seviyesinde hava geçirmeyen bir poşet ağzı kapalı şekilde doldurulup yüksek bir dağın tepesine çıkarılıyor ve poşetin şiştiği görülüyor.

Bu durumun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Dış açık hava basıncının azalıp iç basıncın dış basınçtan büyük kalması$o$, $o$Dışarıdaki açık hava basıncının artması ve iç basıncın azalması$o$, $o$Poşetin içindeki gaz parçacık sayısının dağda kendiliğinden artması$o$, $o$Poşetin dağda kendiliğinden ısınıp içindeki hacmin büyümesi$o$], 0, $e$1. Yükseldikçe açık hava basıncı azalır, poşetin içindeki basınç ise yaklaşık aynı kalır.
2. İç basınç dış basınçtan büyük kaldığı için poşet şişer.

Diğer şıklar: **B** yüksekliğin etkisini ters yorumlamak / **C** parçacık sayısının değiştiğini sanmak / **D** ısınmayı yüksekliğin sonucu sanmak.$e$, 3),
  (14, 'lgs-fen', null::integer, $q$Kapalı ve sabit hacimli bir kapta bulunan gazın sıcaklığı yükseltilirse aşağıdakilerden hangisi gerçekleşir?$q$, array[$o$Gaz basıncı azalır.$o$, $o$Gaz basıncı artar.$o$, $o$Kabın hacmi küçülür.$o$, $o$Parçacık sayısı azalır.$o$], 1, $e$1. Kap kapalı ve hacim sabit olduğundan parçacık sayısı ve hacim değişmez.
2. Sıcaklık artınca parçacıklar hızlanır ve gaz basıncı artar.

Diğer şıklar: **A** sıcaklık-basınç ilişkisini ters kurmak / **C** hacmin sabit olduğunu unutmak / **D** kapalı kapta sayının değiştiğini sanmak.$e$, 2),
  (15, 'lgs-fen', null::integer, $q$Bir kasap, bıçağını bilediğinde et kesmenin daha kolay olduğunu fark ediyor.

Bu durumun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Bıçağın temas alanı büyüdüğü için kuvvetin basınca dönüşmesi$o$, $o$Bıçağın ağırlığının artması ve bu yüzden daha çok basınç uygulaması$o$, $o$Bileme sonucunda uygulanan kuvvetin kendiliğinden büyümesi$o$, $o$Temas alanı küçüldüğü için aynı kuvvetle daha büyük basınç uygulanması$o$], 3, $e$1. Bileme ile bıçağın keskin kısmının temas alanı küçülür.
2. Aynı kuvvet daha küçük alana etki ettiği için basınç artar ve kesmek kolaylaşır.

Diğer şıklar: **A** alan-basınç ilişkisini ters kurmak / **B** ağırlığın bileme ile değiştiğini sanmak / **C** kuvvetin bileme ile arttığını sanmak.$e$, 2),
  (16, 'lgs-fen', null::integer, $q$Aynı yükseklikte (0,4 m) iki özdeş kabın birine su (1000 kg/m$^3$), diğerine zeytinyağı (800 kg/m$^3$) dolduruluyor.

Buna göre kapların tabanlarındaki sıvı basınçları aşağıdakilerden hangisidir? ($g = 10$ m/s$^2$)$q$, array[$o$Su: 3200 Pa, zeytinyağı: 4000 Pa$o$, $o$Su: 4000 Pa, zeytinyağı: 4000 Pa$o$, $o$Su: 4000 Pa, zeytinyağı: 3200 Pa$o$, $o$Su: 400 Pa, zeytinyağı: 320 Pa$o$], 2, $e$1. Sıvı basıncı $P = h \cdot d \cdot g$ ile bulunur.
2. Su için $0{,}4 \cdot 1000 \cdot 10 = 4000$ Pa, zeytinyağı için $0{,}4 \cdot 800 \cdot 10 = 3200$ Pa.

Diğer şıklar: **A** yoğunlukları ters eşlemek / **B** yoğunluk farkını yok saymak / **D** bir sıfırı eksik yazmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

