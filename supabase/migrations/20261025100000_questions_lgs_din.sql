-- 20261025100000_questions_lgs_din. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-din | Kader İnancı konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-din', t.id, $t$Kader İnancı konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kader İnancı$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', null::integer, $q$Allah'ın her şeyi ilmiyle bilmesi, planlaması ve takdir etmesine ne ad verilir?$q$, array[$o$Kaza$o$, $o$Kader$o$, $o$Tevekkül$o$, $o$Cüz'i irade$o$], 1, $e$1. Kader, Allah'ın her şeyi önceden bilmesi ve takdir etmesidir.
2. Kaza ise takdir edilenin zamanı gelince gerçekleşmesidir.

Diğer şıklar: **A** kaza ile kaderi karıştırmak / **C** çabadan sonra güvenmekle karıştırmak / **D** insanın seçme gücüyle karıştırmak.$e$, 1),
  (2, 'lgs-din', null::integer, $q$Takdir edilenin zamanı gelince meydana gelmesine ne denir?$q$, array[$o$Kaza$o$, $o$Kader$o$, $o$Sabır$o$, $o$Dua$o$], 0, $e$1. Kaza, Allah'ın takdir ettiği şeyin zamanı geldiğinde yaratılmasıdır.
2. Kader ise önceden bilme ve takdir etmedir.

Diğer şıklar: **B** kaza ile kaderi karıştırmak / **C** dayanmakla karıştırmak / **D** yakarışla karıştırmak.$e$, 1),
  (3, 'lgs-din', null::integer, $q$İnsanın iyi ya da kötüyü seçebilme gücüne ne ad verilir?$q$, array[$o$Kaza$o$, $o$Tevekkül$o$, $o$Hidayet$o$, $o$Cüz'i irade$o$], 3, $e$1. İnsanın kendi sınırları içinde karar vermesine cüz'i irade denir.
2. İnsan bu irade sayesinde davranışlarından sorumlu tutulur.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **C** kavramı karıştırmak.$e$, 1),
  (4, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi tevekkülün tanımıdır?$q$, array[$o$Çalışmadan sonucun gelmesini beklemek$o$, $o$Çabadan sonra sonucu Allah'a bırakmak$o$, $o$Zorluk karşısında hemen isyan etmek$o$, $o$Sonucu yalnızca kendi gücüne bağlamak$o$], 1, $e$1. Tevekkül, çalışıp çabalamanın ardından sonucu Allah'a bırakmaktır.
2. Tevekkül tembellik değildir. Önce çalışmak, sonra güvenmek esastır.

Diğer şıklar: **A** tembelliği tevekkül sanmak / **C** sabrın karşıtını seçmek / **D** tevekkülün karşıtını seçmek.$e$, 1),
  (5, 'lgs-din', null::integer, $q$"Ne olacaksa olur." diyerek ders çalışmayan bir öğrencinin tutumu için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Tevekkül örneğidir.$o$, $o$Sabır örneğidir.$o$, $o$Cüz'i iradeyi doğru kullanmıştır.$o$, $o$Kader inancı yanlış anlaşılmıştır.$o$], 3, $e$1. Kader inancı çalışmayı terk etmek değildir.
2. Çalışmayı bırakıp her şeyi kadere yüklemek yanlış bir anlayıştır.

Diğer şıklar: **A** tembelliği tevekkül sanmak / **B** pasifliği sabır sanmak / **C** iradeyi yanlış yorumlamak.$e$, 2),
  (6, 'lgs-din', null::integer, $q$"Bir toplum kendini değiştirmedikçe Allah onların durumunu değiştirmez." ayeti aşağıdakilerden hangisini vurgular?$q$, array[$o$Çabanın gereksiz olduğunu$o$, $o$Sonucun önceden değişmez olduğunu$o$, $o$İnsanın çaba göstermesinin önemini$o$, $o$Sorumluluğun kadere ait olduğunu$o$], 2, $e$1. Ra'd suresi 11. ayet, değişimin insanın kendi çabasıyla başladığını anlatır.
2. Bu ayet insanın çaba göstermesinin önemini vurgular.

Diğer şıklar: **A** ayeti ters yorumlamak / **B** ayeti ters yorumlamak / **D** ayeti ters yorumlamak.$e$, 2),
  (7, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi sabrın tanımına en uygundur?$q$, array[$o$Zorlukta hiçbir şey yapmadan beklemek$o$, $o$Zorlukta başkalarını suçlamak$o$, $o$Zorluktan kaçıp sorumluluğu bırakmak$o$, $o$Zorlukta dayanıp çabaya devam etmek$o$], 3, $e$1. Sabır, zorluk ve sıkıntı karşısında dayanmak, isyan etmemek ve doğru yoldan ayrılmamaktır.
2. Sabır pasif beklemek değil, çabaya devam etmektir.

Diğer şıklar: **A** sabrı pasiflikle karıştırmak / **B** sabrın karşıtını seçmek / **C** sabrın karşıtını seçmek.$e$, 2),
  (8, 'lgs-din', null::integer, $q$Dua ile çalışma arasındaki ilişki için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Dua çalışmanın yerini tutmaz, güç verir.$o$, $o$Dua, çalışmanın yerini tamamen tutar.$o$, $o$Dua eden kişi çalışmaktan sorumlu olmaz.$o$, $o$Dua ile çalışma birbirine tamamen zıt şeylerdir.$o$], 0, $e$1. Dua, insanın Allah'tan yardım dilemesidir.
2. Çalışmanın yerini tutmaz, ama çalışmaya manevi güç verir.

Diğer şıklar: **B** duayı çalışmanın yerine koymak / **C** sorumluluğu yok saymak / **D** ilişkiyi yanlış kurmak.$e$, 2),
  (9, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi kader inancının doğru anlaşıldığında insana kazandırdıklarından biridir?$q$, array[$o$Sorumsuzluk$o$, $o$Tembellik$o$, $o$Ruhsal huzur$o$, $o$Kibir$o$], 2, $e$1. Doğru anlaşılan kader inancı ruhsal huzur, sorumluluk bilinci, sabır, şükür ve cesaret kazandırır.
2. Sorumsuzluk ve tembellik yanlış anlayışın sonucudur.

Diğer şıklar: **A** yanlış anlayışın sonucunu seçmek / **B** yanlış anlayışın sonucunu seçmek / **D** başarıdaki yanlış tutumu seçmek.$e$, 2),
  (10, 'lgs-din', null::integer, $q$Aşağıdaki tabloda bazı davranışlar verilmiştir.

| Kişi | Davranış |
| --- | --- |
| Ali | Sınava çalıştıktan sonra sonucu Allah'a bırakıyor. |
| Zeynep | "Kaderimde yoksa olmaz." deyip hiç çalışmıyor. |
| Mert | Hatasını başkasının kaderine yüklüyor. |

Bu tabloya göre kader inancını doğru anlayan kişi aşağıdakilerden hangisidir?$q$, array[$o$Yalnızca Zeynep$o$, $o$Zeynep ve Mert$o$, $o$Yalnızca Ali$o$, $o$Ali ve Mert$o$], 2, $e$1. Ali önce çalışıyor, sonra sonucu Allah'a bırakıyor. Bu, tevekkülün doğru anlaşılmış hâlidir.
2. Zeynep ve Mert kaderi sorumluluktan kaçmak için kullanıyor, bu yanlış bir anlayıştır.

Diğer şıklar: **A** tembelliği doğru anlayış sanmak / **B** yanlış anlayışları doğru sanmak / **D** sorumluluktan kaçışı doğru sanmak.$e$, 3),
  (11, 'lgs-din', null::integer, $q$Bir öğretmenin "Bu öğrenci çalışmazsa sınıfta kalır." demesi, öğrencinin çalışmamasının sebebi değildir.

Bu örnek aşağıdakilerden hangisini açıklamak için kullanılabilir?$q$, array[$o$Allah'ın ilminin seçimi zorlamadığını$o$, $o$İnsanın hiçbir seçim yapamadığını ve zorlandığını$o$, $o$Kaderin insandan bağımsız işlediğini ve çabanın boş olduğunu$o$, $o$Çalışmanın tamamen gereksiz olduğunu$o$], 0, $e$1. Öğretmenin önceden bilmesi, öğrencinin kararını belirlemez.
2. Allah'ın ilmi de insanın seçimini zorlamaz, insan iradesiyle seçer ve sorumlu olur.

Diğer şıklar: **B** irade özgürlüğünü yok saymak / **C** ilişkiyi yanlış kurmak / **D** çabayı yok saymak.$e$, 3),
  (12, 'lgs-din', null::integer, $q$Kader inancının yanlış anlaşılmasının sonuçlarından biri aşağıdakilerden hangisidir?$q$, array[$o$Haksızlığa karşı çıkılmaması$o$, $o$Çalışmaya daha çok önem verilmesi$o$, $o$Sorumluluk bilincinin güçlenmesi$o$, $o$Sabrın güçlenmesi$o$], 0, $e$1. Her kötülüğü kadere bağlayan kişi haksızlıklara karşı çıkmaz.
2. Bu, kader inancının yanlış anlaşılmasının zararlarındandır.

Diğer şıklar: **B** doğru anlayışın sonucunu seçmek / **C** doğru anlayışın sonucunu seçmek / **D** doğru anlayışın sonucunu seçmek.$e$, 3),
  (13, 'lgs-din', null::integer, $q$Çiftçi tohumu eker, çalışır, sonra yağmuru Allah'tan bekler.

Bu örnek aşağıdaki kavramlardan hangisini açıklar?$q$, array[$o$Kaza$o$, $o$Cüz'i irade$o$, $o$Tevekkül$o$, $o$Hurafe$o$], 2, $e$1. Çiftçi önce çabasını gösteriyor, sonra sonucu Allah'a bırakıyor.
2. Bu, tevekkülün tanımına uygundur.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **D** alakasız bir kavramı seçmek.$e$, 3),
  (14, 'lgs-din', null::integer, $q$Bir kişi başarılı olduğunda kibirlenmeyip Allah'a şükrediyor.

Bu davranış kader inancının insana kazandırdığı hangi özellikle ilgilidir?$q$, array[$o$Cesaret$o$, $o$Şükür$o$, $o$Sabır$o$, $o$Tevekkül$o$], 1, $e$1. Kader inancı doğru anlaşıldığında başarıda kibirlenmemeyi ve Allah'a şükretmeyi sağlar.
2. Başarıda şükür, zorlukta sabır gösterilir.

Diğer şıklar: **A** özelliği karıştırmak / **C** özelliği karıştırmak / **D** özelliği karıştırmak.$e$, 3),
  (15, 'lgs-din', null::integer, $q$"Allah kimseye gücünün yeteceğinden fazlasını yüklemez." ayeti hangi surede yer alır?$q$, array[$o$Alak suresi$o$, $o$Bakara suresi$o$, $o$Kevser suresi$o$, $o$Nisa suresi$o$], 1, $e$1. Bu ifade Bakara suresinin 286. ayetinde yer alır.
2. İnsanın sorumluluğu gücü ölçüsündedir.

Diğer şıklar: **A** ilk inen sureyi seçmek / **C** kısa bir sureyi seçmek / **D** başka bir sureyi seçmek.$e$, 2),
  (16, 'lgs-din', null::integer, $q$Kader ve kaza hangi inanç grubu içinde yer alır?$q$, array[$o$İbadetler$o$, $o$Ahlaki davranışlar$o$, $o$Sosyal yardımlaşma$o$, $o$İman esasları$o$], 3, $e$1. Kaza ve kader İslam'ın iman esasları arasında yer alır.
2. İbadet namaz, oruç, zekât ve hac gibi uygulamalardır.

Diğer şıklar: **A** alanı karıştırmak / **B** alanı karıştırmak / **C** alanı karıştırmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-din | Zekât ve Sadaka konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-din', t.id, $t$Zekât ve Sadaka konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Zekât ve Sadaka$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', null::integer, $q$Zekât, İslam'ın şartlarından hangisi sayılır?$q$, array[$o$Altı iman esasından biri$o$, $o$Beş şartından biri$o$, $o$Sünnet olan bir davranış$o$, $o$Yalnızca Ramazan'a özgü ibadet$o$], 1, $e$1. Zekât, İslam'ın beş şartından biridir.
2. Hem malî hem de sosyal bir ibadettir.

Diğer şıklar: **A** iman esasları ile şartları karıştırmak / **C** farz olduğunu bilmemek / **D** zamanını yanlış bilmek.$e$, 1),
  (2, 'lgs-din', null::integer, $q$Para, altın ve ticaret mallarında zekât oranı aşağıdakilerden hangisidir?$q$, array[$o$Onda bir$o$, $o$Yüzde on$o$, $o$Beşte bir$o$, $o$Kırkta bir$o$], 3, $e$1. Para, altın, gümüş ve ticaret mallarında zekât oranı kırkta bir, yani yüzde 2,5'tir.

Diğer şıklar: **A** tarım ürünlerinin oranını seçmek / **B** oranı yanlış bilmek / **C** oranı yanlış bilmek.$e$, 1),
  (3, 'lgs-din', null::integer, $q$Ramazan ayının sonunda, bayram namazından önce verilen sadakaya ne denir?$q$, array[$o$Sadaka-i câriye$o$, $o$Sadaka-i fıtır$o$, $o$Kurban$o$, $o$Zekât$o$], 1, $e$1. Sadaka-i fıtır (fitre), yoksulların bayramı sevinçle geçirmesi için bayram namazından önce verilir.

Diğer şıklar: **A** sadaka çeşitlerini karıştırmak / **C** Zilhicce ibadetini seçmek / **D** nisaplı ibadeti seçmek.$e$, 1),
  (4, 'lgs-din', null::integer, $q$Kişinin ölümünden sonra da sevabı devam eden hayırlara ne ad verilir?$q$, array[$o$Sadaka-i fıtır$o$, $o$Sadaka-i câriye$o$, $o$Kurban$o$, $o$Zekât$o$], 1, $e$1. Okul, çeşme, köprü ve kütüphane yaptırmak sadaka-i câriyeye örnektir.
2. Bu hayırların sevabı kişi öldükten sonra da sürer.

Diğer şıklar: **A** sadaka çeşitlerini karıştırmak / **C** sadaka çeşitlerini karıştırmak / **D** sadaka çeşitlerini karıştırmak.$e$, 1),
  (5, 'lgs-din', null::integer, $q$Nisabı aşan ve üzerinden bir yıl geçen 20 000 TL birikimi olan bir kişi, zekât oranı kırkta bir ise kaç TL zekât verir?$q$, array[$o$200$o$, $o$2 000$o$, $o$5 000$o$, $o$500$o$], 3, $e$1. Zekât miktarı $20\,000 \cdot \dfrac{1}{40}$ ile bulunur.
2. $20\,000 \div 40 = 500$ TL.

Diğer şıklar: **A** oranı yanlış kullanmak / **B** oranı onda bir almak / **C** oranı dörtte bir almak.$e$, 2),
  (6, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi zekâtın farz olması için aranan şartlardan biridir?$q$, array[$o$Her gün gelir elde etmek$o$, $o$Nisap miktarı mala sahip olmak$o$, $o$Mal varlığının yurt dışında olması$o$, $o$Bir yakınının zekât istemesi$o$], 1, $e$1. Zekât için kişinin Müslüman, akıllı ve ergen olması, nisap miktarı mala sahip olması ve malın üzerinden bir yıl geçmesi gerekir.

Diğer şıklar: **A** şartı yanlış bilmek / **C** ilgisiz şartı seçmek / **D** şartı yanlış bilmek.$e$, 2),
  (7, 'lgs-din', null::integer, $q$Zekât aşağıdaki kişilerden hangisine verilemez?$q$, array[$o$Kişinin kendi annesine$o$, $o$Borcunu ödeyemeyen bir komşuya$o$, $o$Yolda kalmış bir yolcuya$o$, $o$Geliri ihtiyacını karşılamayan bir kişiye$o$], 0, $e$1. Anne-baba, dede-nine, çocuk, torun ve eşin bakım yükümlülüğü zaten kişiye aittir.
2. Bu yüzden zekât bu yakınlara verilmez.

Diğer şıklar: **B** doğru alıcıyı yanlış sanmak / **C** doğru alıcıyı yanlış sanmak / **D** doğru alıcıyı yanlış sanmak.$e$, 2),
  (8, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi sadakanın zekâttan farklı yönlerinden biridir?$q$, array[$o$Yalnızca zenginler verir.$o$, $o$Oranı kırkta birdir.$o$, $o$Nisap ve süre şartı aranmaz.$o$, $o$Yalnızca Ramazan'da verilir.$o$], 2, $e$1. Sadaka, Allah rızası için karşılık beklemeden yapılan her iyiliktir.
2. Zekâttan farklı olarak nisap ve süre şartı yoktur, herkes gücü ölçüsünde verebilir.

Diğer şıklar: **A** şartı zekâtla karıştırmak / **B** oranı zekâtla karıştırmak / **D** zamanı yanlış bilmek.$e$, 2),
  (9, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi sadaka olarak kabul edilir?$q$, array[$o$Yolda engel olan bir taşı kaldırmak$o$, $o$Gösteriş için yardım dağıtmak$o$, $o$Karşılık bekleyerek ödünç vermek$o$, $o$Borcu ödememek$o$], 0, $e$1. Sadaka, Allah rızası için yapılan her iyiliktir.
2. Yola engel olan bir şeyi kaldırmak, güzel söz söylemek ve gülümsemek sadakadır.

Diğer şıklar: **B** niyeti göz ardı etmek / **C** niyeti göz ardı etmek / **D** ilgisiz bir davranışı seçmek.$e$, 2),
  (10, 'lgs-din', null::integer, $q$Aşağıdaki tabloda bazı yardımlar verilmiştir.

| Yardım | Özellik |
| --- | --- |
| I | Bayram namazından önce verilir. |
| II | Ölümden sonra da sevap kazandırır. |
| III | Nisap miktarı mal gerektirir. |

Buna göre I, II ve III sırasıyla hangi yardım türleridir?$q$, array[$o$Zekât, fitre, sadaka-i câriye$o$, $o$Sadaka-i câriye, zekât, fitre$o$, $o$Fitre, sadaka-i câriye, zekât$o$, $o$Fitre, zekât, sadaka-i câriye$o$], 2, $e$1. Bayram namazından önce verilen fitredir.
2. Ölümden sonra da sevap kazandıran sadaka-i câriyedir ve nisap gerektiren zekâttır.

Diğer şıklar: **A** özellikleri yanlış eşlemek / **B** özellikleri yanlış eşlemek / **D** özellikleri yanlış eşlemek.$e$, 3),
  (11, 'lgs-din', null::integer, $q$Zekât sorularında üç şey kontrol edilir: Kim verir, ne kadar verir, kime verir.

Bu bilgiye göre aşağıdakilerden hangisi doğrudur?$q$, array[$o$Herkes, onda bir oranında, yalnızca akrabalarına verir.$o$, $o$Yalnızca devlet, kırkta bir oranında verir.$o$, $o$Nisabı aşan Müslüman, yarı oranında, istediği kişiye verir.$o$, $o$Nisabı aşan Müslüman, kırkta bir oranında, sayılan sekiz gruba verir.$o$], 3, $e$1. Zekât, nisabı aşan Müslümanın genelde kırkta bir oranında Kur'an'da sayılan sekiz gruba vermesidir.

Diğer şıklar: **A** ölçütleri yanlış bilmek / **B** ölçütleri yanlış bilmek / **C** ölçütleri yanlış bilmek.$e$, 3),
  (12, 'lgs-din', null::integer, $q$Zekât yardım edilen kişinin onurunu zedelemeden verilmelidir.

Bu ilke aşağıdaki davranışlardan hangisiyle uyumludur?$q$, array[$o$Yardımı herkesin önünde duyurmak$o$, $o$Yardım edilene minnet baskısı yapmak$o$, $o$Yardımı gizlice yapmak$o$, $o$Yardıma karşılık beklemek$o$], 2, $e$1. Gizlice verilen yardım daha değerli kabul edilir.
2. Minnet altında bırakmak, üstünlük taslamak veya karşılık beklemek zekâtın ruhuna aykırıdır.

Diğer şıklar: **A** gösterişi onurla karıştırmak / **B** ilkeyi ters yorumlamak / **D** ilkeyi ters yorumlamak.$e$, 3),
  (13, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi vakfa örnektir?$q$, array[$o$Tek seferlik para yardımı yapmak$o$, $o$Zekâtı yıl sonunda dağıtmak$o$, $o$Malı okul için kalıcı ayırmak$o$, $o$Bayramda akraba ziyareti yapmak$o$], 2, $e$1. Vakıf, malı belli bir amaç için kalıcı olarak ayırmaktır.
2. Selçuklu ve Osmanlı'da vakıflar eğitim, sağlık ve sosyal yardım alanında büyük hizmet verdi.

Diğer şıklar: **A** vakfı tek seferlik yardım sanmak / **B** vakfı zekâtla karıştırmak / **D** ilgisiz bir davranış seçmek.$e$, 3),
  (14, 'lgs-din', null::integer, $q$Bir tüccarın 80 000 TL'lik ticaret malı ve birikimi vardır ve üzerinden bir yıl geçmiştir. Nisabı aşmaktadır.

Zekât oranı kırkta bir ise bu tüccarın vermesi gereken zekât kaç TL'dir?$q$, array[$o$800$o$, $o$8 000$o$, $o$20 000$o$, $o$2 000$o$], 3, $e$1. Zekât $80\,000 \cdot \dfrac{1}{40}$ ile bulunur.
2. $80\,000 \div 40 = 2\,000$ TL.

Diğer şıklar: **A** oranı onda biri sanmak / **B** oranı onda bir almak / **C** oranı dörtte bir almak.$e$, 3),
  (15, 'lgs-din', null::integer, $q$Kurban hangi ayda kesilir?$q$, array[$o$Zilhicce$o$, $o$Ramazan$o$, $o$Muharrem$o$, $o$Recep$o$], 0, $e$1. Kurban Zilhicce ayında belirli şartları taşıyanlar tarafından Allah rızası için kesilir.
2. Etin bir bölümü yoksullara dağıtılır.

Diğer şıklar: **B** fitreyi karıştırmak / **C** ayları karıştırmak / **D** ayları karıştırmak.$e$, 2),
  (16, 'lgs-din', null::integer, $q$Zekât verilecek gruplar Kur'an'da hangi surede sayılmıştır?$q$, array[$o$Tevbe suresi$o$, $o$Fatiha suresi$o$, $o$İhlas suresi$o$, $o$Kevser suresi$o$], 0, $e$1. Zekâtın verileceği sekiz grup Tevbe suresinin 60. ayetinde sayılmıştır.

Diğer şıklar: **B** sureyi karıştırmak / **C** sureyi karıştırmak / **D** sureyi karıştırmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-din | Din ve Hayat konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-din', t.id, $t$Din ve Hayat konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Din ve Hayat$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', null::integer, $q$İslam'ın ilk emri aşağıdakilerden hangisidir?$q$, array[$o$Namaz kıl!$o$, $o$Zekât ver!$o$, $o$Oruç tut!$o$, $o$Oku!$o$], 3, $e$1. İslam'ın ilk emri "Oku!" olmuştur (Alak suresi, 1. ayet).
2. Bu, ilme verilen önemi gösterir.

Diğer şıklar: **A** ilk emri ibadetle karıştırmak / **B** ilk emri ibadetle karıştırmak / **C** ilk emri ibadetle karıştırmak.$e$, 1),
  (2, 'lgs-din', null::integer, $q$İslam'ın korunmasını istediği temel değerler aşağıdakilerden hangisinde doğru verilmiştir?$q$, array[$o$Din, can, ırk, nesil, makam$o$, $o$Mal, makam, güç, nesil, akıl$o$, $o$Can, mal, şöhret, din, soy$o$, $o$Din, can, akıl, nesil, mal$o$], 3, $e$1. İslam din, can, akıl, nesil ve malın korunmasını önemser.
2. Bu değerler günümüz insan hakları anlayışıyla da örtüşür.

Diğer şıklar: **A** değerleri yanlış bilmek / **B** değerleri yanlış bilmek / **C** değerleri yanlış bilmek.$e$, 1),
  (3, 'lgs-din', null::integer, $q$Dinde aslı olmayan, akla ve ilme aykırı halk inanışlarına ne ad verilir?$q$, array[$o$Hurafe$o$, $o$Ahlak$o$, $o$Vicdan$o$, $o$İlim$o$], 0, $e$1. Hurafe, dinde aslı olmayan ve halk arasında yayılmış inançlardır.
2. Ahlak, vicdan ve ilim ise dinin desteklediği değerlerdir.

Diğer şıklar: **B** kavramı karıştırmak / **C** kavramı karıştırmak / **D** kavramı karıştırmak.$e$, 1),
  (4, 'lgs-din', null::integer, $q$İnsanın içindeki "iyi ile kötüyü ayıran ses" olarak tanımlanan kavram aşağıdakilerden hangisidir?$q$, array[$o$Hurafe$o$, $o$Batıl inanç$o$, $o$Vicdan$o$, $o$Kader$o$], 2, $e$1. Vicdan, insanı yanlış yapmaktan alıkoyan iç denetimdir.
2. Dinî duyarlılık vicdanı güçlendirir.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **D** kavramı karıştırmak.$e$, 1),
  (5, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi hurafe ya da batıl inanca örnektir?$q$, array[$o$Hasta olunca tedavi için doktora gitmek$o$, $o$Sınava düzenli çalışarak hazırlanmak$o$, $o$Kara kedi yolu keserse uğursuzluk gelir sanmak$o$, $o$Aşı yaptırarak hastalıktan korunmak$o$], 2, $e$1. Kara kedi, merdiven altı gibi uğursuzluk inançları hurafedir.
2. Diğer davranışlar akla ve ilme uygundur.

Diğer şıklar: **A** doğru davranışı yanlış sanmak / **B** doğru davranışı yanlış sanmak / **D** doğru davranışı yanlış sanmak.$e$, 2),
  (6, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi hurafelerin zararlarından biri **değildir**?$q$, array[$o$Çaba ve sorumluluğun azalması$o$, $o$Bireyin akla ve ilme yönelmesi$o$, $o$Dinin yanlış anlaşılması$o$, $o$Toplumun sömürüye açık hâle gelmesi$o$], 1, $e$1. Hurafeler insanı akıldan ve gerçeklerden uzaklaştırır.
2. Akla ve ilme yönelmek hurafelerin zararı değil, onlardan korunma yoludur.

Diğer şıklar: **A** zararı doğru sanmamak / **C** zararı doğru sanmamak / **D** zararı doğru sanmamak.$e$, 2),
  (7, 'lgs-din', null::integer, $q$Hz. Muhammed'in "Ben ahlakın güzelliğini tamamlamak için gönderildim." sözü dinin hangi yönünü vurgular?$q$, array[$o$Yalnızca ibadetleri ritüel olarak yapmayı$o$, $o$Yalnızca bilimi öğretmeyi$o$, $o$Ahlak sahibi insan yetiştirmeyi$o$, $o$Ticareti geliştirmeyi$o$], 2, $e$1. İbadetlerin hedefi yalnızca ritüel değil, ahlak sahibi insan yetiştirmektir.
2. Oruç sabrı, zekât cömertliği öğretir.

Diğer şıklar: **A** sözü daraltmak / **B** sözü daraltmak / **D** ilgisiz bir hedef seçmek.$e$, 2),
  (8, 'lgs-din', null::integer, $q$İslam medeniyetinde yetişen İbn-i Sina hangi alanda ünlüdür?$q$, array[$o$Tıp$o$, $o$Matematik$o$, $o$Astronomi$o$, $o$Edebiyat$o$], 0, $e$1. İbn-i Sina tıp, Harezmi matematik, Biruni astronomi, Farabi felsefe alanlarında ünlüdür.

Diğer şıklar: **B** bilginleri karıştırmak / **C** bilginleri karıştırmak / **D** bilginleri karıştırmak.$e$, 2),
  (9, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi din ile akıl arasındaki ilişkiyi doğru ifade eder?$q$, array[$o$Din akılla tamamen çatışır.$o$, $o$Akıl, dinin anlaşılmasında bir araçtır.$o$, $o$Akıl varsa dinî sorumluluk yoktur.$o$, $o$Aklın bilemeyeceği hiçbir konu yoktur.$o$], 1, $e$1. Akıl insanı sorumlu kılan temel özelliktir ve dinin anlaşılmasında araçtır.
2. Aklın bilemeyeceği konularda (ahiret, melekler) vahyin bildirdiğine güvenilir.

Diğer şıklar: **A** ilişkiyi ters yorumlamak / **C** ilişkiyi ters yorumlamak / **D** aklın sınırını yok saymak.$e$, 2),
  (10, 'lgs-din', null::integer, $q$Aşağıdaki tabloda bazı değerler ve koruma biçimleri eşleştirilmiştir.

| Değer | Korunma biçimi |
| --- | --- |
| I. Can | Yaşama hakkının güvence altına alınması |
| II. Mal | Hırsızlığın ve haksız kazancın engellenmesi |
| III. Akıl | İnanç özgürlüğünün sağlanması |
| IV. Din | İbadet hakkının tanınması |

Buna göre hangi eşleştirme **yanlıştır**?$q$, array[$o$III$o$, $o$I$o$, $o$II$o$, $o$IV$o$], 0, $e$1. Aklın korunması, zararlı maddelerden uzak durulması ve eğitim hakkıyla ilgilidir.
2. İnanç özgürlüğü dinin korunmasıdır.

Diğer şıklar: **B** doğru eşleştirmeyi yanlış sanmak / **C** doğru eşleştirmeyi yanlış sanmak / **D** doğru eşleştirmeyi yanlış sanmak.$e$, 3),
  (11, 'lgs-din', null::integer, $q$Bir öğrenci, "Kara kedi gördüm, sınavda başarısız olacağım." diyerek çalışmayı bırakıyor.

Bu davranış için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Tevekkülün güzel bir örneğidir.$o$, $o$Hurafedir, çabayı azaltmıştır.$o$, $o$Akla uygun, bilimsel bir tutumdur.$o$, $o$İlmin doğal bir sonucudur.$o$], 1, $e$1. Hurafeler çaba ve sorumluluğu azaltır.
2. Öğrenci gerçek sebepleri aramak yerine boş inanca sığınmıştır.

Diğer şıklar: **A** çabasız bırakmayı tevekkül sanmak / **C** hurafeyi akla uygun sanmak / **D** hurafeyi ilme bağlamak.$e$, 3),
  (12, 'lgs-din', null::integer, $q$Kur'an'da insanlar sık sık düşünmeye, akıl yürütmeye çağrılır.

Bu bilgiye göre İslam'ın aklı nasıl gördüğü söylenebilir?$q$, array[$o$Önemsiz bir araç olarak gördüğü$o$, $o$Çok önemli bir değer olarak gördüğü$o$, $o$Dinin karşıtı olarak gördüğü$o$, $o$Yalnızca bilginlere ait saydığı$o$], 1, $e$1. Kur'an düşünmeyi ve akıl yürütmeyi teşvik eder.
2. Bu, İslam'ın aklı çok önemli bir değer olarak gördüğünü gösterir.

Diğer şıklar: **A** bilgiyi ters yorumlamak / **C** bilgiyi ters yorumlamak / **D** bilgiyi daraltmak.$e$, 3),
  (13, 'lgs-din', null::integer, $q$Aşağıdaki davranışlardan hangisi dinin günlük hayata yansımalarından biri **değildir**?$q$, array[$o$Çevreyi temiz tutmak$o$, $o$Komşuya yardım etmek$o$, $o$Helal kazanç için çalışmak$o$, $o$Zamanı ve kaynakları israf etmek$o$], 3, $e$1. İslam temizliği, komşuluğu, çalışmayı ve zamanı doğru kullanmayı teşvik eder.
2. İsraf ise Kur'an'da kınanmıştır.

Diğer şıklar: **A** doğru davranışı yanlış sanmak / **B** doğru davranışı yanlış sanmak / **C** doğru davranışı yanlış sanmak.$e$, 3),
  (14, 'lgs-din', null::integer, $q$Hz. Muhammed'in "İlim öğrenmek her Müslümana farzdır." hadisi aşağıdakilerden hangisini gösterir?$q$, array[$o$İlmin yalnızca âlimlere özgü olduğunu$o$, $o$İlmin dinden bağımsız olduğunu$o$, $o$İlmin isteğe bağlı olduğunu$o$, $o$İlmin ibadet sayıldığını$o$], 3, $e$1. Hadis, ilim öğrenmenin her Müslüman için farz olduğunu söyler.
2. İslam ilim öğrenmeyi ibadet saymıştır.

Diğer şıklar: **A** hadisi daraltmak / **B** hadisi yanlış yorumlamak / **C** hadisi ters yorumlamak.$e$, 3),
  (15, 'lgs-din', null::integer, $q$Bilim ile din arasındaki ilişki için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Biri diğerini tamamen yok eder.$o$, $o$Bilim dinin düşmanıdır.$o$, $o$İkisi birbirini tamamlar.$o$, $o$Din bilimin sonuçlarını reddeder.$o$], 2, $e$1. Bilim evrenin nasıl işlediğini açıklar.
2. Din ise neden var olduğumuzu ve nasıl yaşamamız gerektiğini açıklar. İkisi birbirini tamamlar.

Diğer şıklar: **A** ilişkiyi yanlış kurmak / **B** ilişkiyi yanlış kurmak / **D** ilişkiyi yanlış kurmak.$e$, 2),
  (16, 'lgs-din', null::integer, $q$Dinin insana kazandırdıklarından biri aşağıdakilerden hangisidir?$q$, array[$o$Hayatın anlamını bilmek$o$, $o$Sorumluluktan kurtulmak$o$, $o$Toplumdan kopmak$o$, $o$Yalnızca kural koymak$o$], 0, $e$1. Din insana hayatın anlamını, ruhsal huzuru, ahlaki değerleri, sorumluluk bilincini ve birlik duygusunu kazandırır.

Diğer şıklar: **B** etkiyi ters yorumlamak / **C** etkiyi ters yorumlamak / **D** etkiyi daraltmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-din | Hz. Muhammed'in Örnekliği konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-din', t.id, $t$Hz. Muhammed'in Örnekliği konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Hz. Muhammed'in Örnekliği$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', null::integer, $q$Hz. Muhammed hangi yılda ve hangi şehirde doğmuştur?$q$, array[$o$570, Medine$o$, $o$610, Mekke$o$, $o$570, Mekke$o$, $o$622, Medine$o$], 2, $e$1. Hz. Muhammed 570 yılında Mekke'de doğdu.
2. 610 ilk vahiy, 622 hicret yılıdır.

Diğer şıklar: **A** şehri karıştırmak / **B** ilk vahiy yılını yazmak / **D** hicret yılını yazmak.$e$, 1),
  (2, 'lgs-din', null::integer, $q$Hz. Muhammed'e gençliğinde verilen "el-Emin" unvanı ne anlama gelir?$q$, array[$o$Cömert kişi$o$, $o$Bilgili kişi$o$, $o$Cesur kişi$o$, $o$Güvenilir kişi$o$], 3, $e$1. Dürüstlüğü ve güvenilirliği nedeniyle Mekkeliler ona "el-Emin" yani güvenilir kişi dediler.

Diğer şıklar: **A** unvanın anlamını karıştırmak / **B** unvanın anlamını karıştırmak / **C** unvanın anlamını karıştırmak.$e$, 1),
  (3, 'lgs-din', null::integer, $q$Müslümanların Mekke'den Medine'ye göç etmesine ne ad verilir?$q$, array[$o$Hicret$o$, $o$Hudeybiye$o$, $o$Veda$o$, $o$Fetih$o$], 0, $e$1. Hicret 622'de gerçekleşti ve İslam takviminin başlangıcıdır.

Diğer şıklar: **B** olayı karıştırmak / **C** olayı karıştırmak / **D** olayı karıştırmak.$e$, 1),
  (4, 'lgs-din', null::integer, $q$Hz. Muhammed'in Arafat'ta son hac sırasında yaptığı konuşmaya ne denir?$q$, array[$o$Medine Sözleşmesi$o$, $o$Veda Hutbesi$o$, $o$Hudeybiye Barışı$o$, $o$Hicret Hutbesi$o$], 1, $e$1. Veda Hutbesi 632'de Veda Hacı sırasında Arafat'ta yapıldı.
2. İnsan hakları, adalet, kadın ve çocuk hakları gibi ilkeleri içerir.

Diğer şıklar: **A** belgeyle konuşmayı karıştırmak / **C** antlaşmayla karıştırmak / **D** var olmayan bir ad seçmek.$e$, 1),
  (5, 'lgs-din', null::integer, $q$Mekke'nin fethinde Hz. Muhammed'in Mekkelilere "Bugün size kınama yok. Gidin, hepiniz serbestsiniz." demesi hangi özelliğini gösterir?$q$, array[$o$Hoşgörü ve affediciliğini$o$, $o$Savaş yeteneğini$o$, $o$Zenginliğini$o$, $o$Mekke'ye kızgınlığını$o$], 0, $e$1. Yıllarca zulmeden Mekkelileri affetti ve intikam almadı.
2. Bu, hoşgörü ve affediciliğin en büyük örneklerindendir.

Diğer şıklar: **B** özelliği yanlış yorumlamak / **C** özelliği yanlış yorumlamak / **D** özelliği ters yorumlamak.$e$, 2),
  (6, 'lgs-din', null::integer, $q$Hz. Muhammed Taif'te taşlandığı hâlde taşlayanlara beddua etmemiştir.

Bu davranış aşağıdaki özelliklerden hangisine örnektir?$q$, array[$o$Cimrilik$o$, $o$Kibir$o$, $o$Sabır ve hoşgörü$o$, $o$Korkaklık$o$], 2, $e$1. Taşlanmasına rağmen "Belki onların soyundan Allah'a inanacak kimseler çıkar" diyerek dua etti.
2. Bu davranış sabır ve hoşgörüdür.

Diğer şıklar: **A** özelliği yanlış yorumlamak / **B** özelliği ters yorumlamak / **D** özelliği yanlış yorumlamak.$e$, 2),
  (7, 'lgs-din', null::integer, $q$Medine Sözleşmesi'nde aşağıdaki ilkelerden hangisi yer almaz?$q$, array[$o$Herkesin dinî özgürlüğünün korunması$o$, $o$Saldırıya karşı birlikte savunma yapılması$o$, $o$Birbirinin haklarına saygı gösterilmesi$o$, $o$Yalnızca Müslümanların hukuk önünde eşit sayılması$o$], 3, $e$1. Medine Sözleşmesi'nde herkes hukuk karşısında eşittir.
2. Eşitlik yalnızca Müslümanlarla sınırlı değildir.

Diğer şıklar: **A** ilkeyi yanlış sanmak / **B** ilkeyi yanlış sanmak / **C** ilkeyi yanlış sanmak.$e$, 2),
  (8, 'lgs-din', null::integer, $q$Hudeybiye Barışı hangi tarafların arasında yapılmıştır?$q$, array[$o$Müslümanlar ve Bizanslılar$o$, $o$Mekkeliler ve Taifliler$o$, $o$Müslümanlar ve Mekkeliler$o$, $o$Medineliler ve Yahudiler$o$], 2, $e$1. Hudeybiye Barışı 628'de Müslümanlar ile Mekkeliler arasında yapıldı.
2. Barışın yolunu açtı.

Diğer şıklar: **A** tarafları yanlış bilmek / **B** tarafları yanlış bilmek / **D** Medine Sözleşmesi ile karıştırmak.$e$, 2),
  (9, 'lgs-din', null::integer, $q$Veda Hutbesi'nde aşağıdakilerden hangisi yer alır?$q$, array[$o$Irk, renk ve soy farkının üstünlük sağlamadığı$o$, $o$Arapların diğer toplumlardan üstün olduğu$o$, $o$Faizin teşvik edildiği$o$, $o$Kadınların haklarının önemsiz olduğu$o$], 0, $e$1. Veda Hutbesi'nde "Üstünlük ancak takvadadır" denir.
2. Canın, malın ve namusun dokunulmazlığı, faizin kaldırılması ve kadınlara iyi davranılması da vurgulanır.

Diğer şıklar: **B** ilkeyi ters bilmek / **C** ilkeyi ters bilmek / **D** ilkeyi ters bilmek.$e$, 2),
  (10, 'lgs-din', null::integer, $q$Aşağıdaki tabloda Hz. Muhammed'in hayatındaki bazı olaylar verilmiştir.

| Olay | Yıl |
| --- | --- |
| Hicret | 622 |
| Hudeybiye Barışı | 628 |
| Mekke'nin fethi | 630 |
| Veda Hutbesi | 632 |

Bu tabloya göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Hicret, Hudeybiye'den sonra gerçekleşmiştir.$o$, $o$Veda Hutbesi, fetihten önce yapılmıştır.$o$, $o$Mekke'nin fethi, Hudeybiye Barışı'ndan sonradır.$o$, $o$Dört olay da aynı yıl içinde yaşanmıştır.$o$], 2, $e$1. Sıralama Hicret (622), Hudeybiye (628), Mekke'nin fethi (630), Veda Hutbesi (632) şeklindedir.
2. Bu nedenle fetih Hudeybiye'den sonradır.

Diğer şıklar: **A** kronolojiyi ters okumak / **B** kronolojiyi ters okumak / **D** tarihleri yanlış okumak.$e$, 3),
  (11, 'lgs-din', null::integer, $q$Hicret gecesi Hz. Muhammed'in, düşmanlarının emanetlerini iade etmesi için Hz. Ali'yi Mekke'de bırakması hangi özelliğini gösterir?$q$, array[$o$Cimriliğini$o$, $o$Güvenilirliğini$o$, $o$Korkaklığını$o$, $o$Düşmanlık duygusunu$o$], 1, $e$1. Düşman olanların bile emanetlerini iade ettirmesi, ne kadar güvenilir olduğunu gösterir.
2. Emanete ihanet etmemek örnek alınacak bir ahlak özelliğidir.

Diğer şıklar: **A** özelliği yanlış yorumlamak / **C** özelliği yanlış yorumlamak / **D** özelliği ters yorumlamak.$e$, 3),
  (12, 'lgs-din', null::integer, $q$Hz. Muhammed'in, yıllarca zulmeden Mekkelileri güç elindeyken affetmesi neyi kanıtlar?$q$, array[$o$İntikam almanın asıl güç olduğunu$o$, $o$Gücün yalnızca ordudan geldiğini$o$, $o$Affetmenin bir zayıflık olduğunu$o$, $o$Kendini kontrolün gerçek güç olduğunu$o$], 3, $e$1. Gücü eline geçtiğinde kötülük yapanları affetti.
2. Mekke'nin fethi askerî bir zafer olduğu kadar ahlaki bir zaferdir.

Diğer şıklar: **A** ilkeyi ters yorumlamak / **B** ilkeyi daraltmak / **C** ilkeyi ters yorumlamak.$e$, 3),
  (13, 'lgs-din', null::integer, $q$Aşağıdaki davranışlardan hangisi Hz. Muhammed'i örnek almanın günlük hayattaki karşılığı **değildir**?$q$, array[$o$Komşulara iyi davranmak$o$, $o$Verilen sözü kolayca unutmak$o$, $o$Hayvanlara merhamet etmek$o$, $o$Affedici olmak$o$], 1, $e$1. Doğru sözlü olmak, verilen sözü tutmak, emanete ihanet etmemek örnek alınacak davranışlardır.
2. Sözünü unutmak bu örnekliğin karşıtıdır.

Diğer şıklar: **A** doğru davranışı yanlış sanmak / **C** doğru davranışı yanlış sanmak / **D** doğru davranışı yanlış sanmak.$e$, 3),
  (14, 'lgs-din', null::integer, $q$Medine Sözleşmesi çok kültürlü toplumda barış içinde bir arada yaşamanın ilk örneklerinden biri sayılır.

Bu yargıya aşağıdakilerden hangisi dayanak olur?$q$, array[$o$Yalnızca bir kabilenin yönetimi ele geçirmesi$o$, $o$Bütün gayrimüslimlerin Medine'den çıkarılması$o$, $o$Savaşın sürekli ilan edilmesi ve süregelmesi$o$, $o$Farklı inançların güvence altına alınması$o$], 3, $e$1. Sözleşmeyle herkesin dinî özgürlüğü korundu, saldırıya karşı birlikte savunma yapıldı ve herkes hukuk önünde eşit sayıldı.

Diğer şıklar: **A** bilgiyi ters yorumlamak / **B** bilgiyi ters yorumlamak / **C** bilgiyi ters yorumlamak.$e$, 3),
  (15, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi Hz. Muhammed'in çocukluğuyla ilgili doğru bir bilgidir?$q$, array[$o$Annesini ve dedesini küçük yaşta kaybetmiştir.$o$, $o$Babası onu büyük bir sevgiyle büyütmüştür.$o$, $o$Amcasıyla hiçbir zaman birlikte yaşamamıştır.$o$, $o$Çocukluğunun tamamını Medine'de geçirmiştir.$o$], 0, $e$1. Babası Abdullah doğumundan önce vefat etti.
2. Annesi Âmine ve dedesi Abdülmuttalib onu büyüttü, sonra amcası Ebu Talib baktı.

Diğer şıklar: **B** bilgiyi yanlış bilmek / **C** bilgiyi yanlış bilmek / **D** yeri yanlış bilmek.$e$, 2),
  (16, 'lgs-din', null::integer, $q$"Komşusu aç iken tok yatan bizden değildir." sözü Hz. Muhammed'in hangi özelliğini gösterir?$q$, array[$o$Yalnızca ticarete verdiği önemi$o$, $o$Komşuluk haklarına verdiği önemi$o$, $o$Askerliğe verdiği önemi$o$, $o$Yalnızca ilme verdiği önemi$o$], 1, $e$1. Komşu haklarına büyük önem verirdi.
2. Bu söz, komşuluk ve yardımlaşmanın değerini gösterir.

Diğer şıklar: **A** sözün kapsamını yanlış yorumlamak / **C** sözün kapsamını yanlış yorumlamak / **D** sözün kapsamını yanlış yorumlamak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-din | Kur'an-ı Kerim ve Özellikleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-din', t.id, $t$Kur'an-ı Kerim ve Özellikleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kur'an-ı Kerim ve Özellikleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', null::integer, $q$Kur'an-ı Kerim'in ilk inen ayetleri hangi sureye aittir?$q$, array[$o$Fatiha suresi$o$, $o$Bakara suresi$o$, $o$İhlas suresi$o$, $o$Alak suresi$o$], 3, $e$1. İlk inen ayetler "Oku! Yaratan Rabbinin adıyla oku." ayetleridir.
2. Bu ayetler Alak suresindedir.

Diğer şıklar: **A** ilk sureyi ilk inen sanmak / **B** ilk sureyi ilk inen sanmak / **C** kısa sureyi ilk inen sanmak.$e$, 1),
  (2, 'lgs-din', null::integer, $q$Allah'ın vahyi peygamberlere ulaştıran melek aşağıdakilerden hangisidir?$q$, array[$o$Cebrail$o$, $o$Mikail$o$, $o$İsrafil$o$, $o$Azrail$o$], 0, $e$1. Vahiy genellikle Cebrail adlı melek aracılığıyla gelir.

Diğer şıklar: **B** meleği karıştırmak / **C** meleği karıştırmak / **D** meleği karıştırmak.$e$, 1),
  (3, 'lgs-din', null::integer, $q$Kur'an-ı Kerim kaç sureden oluşur?$q$, array[$o$30$o$, $o$99$o$, $o$114$o$, $o$124$o$], 2, $e$1. Kur'an 114 sure ve 30 cüzden oluşur.

Diğer şıklar: **A** cüz sayısını yazmak / **B** esmaülhüsna sayısını yazmak / **D** sayıyı yanlış bilmek.$e$, 1),
  (4, 'lgs-din', null::integer, $q$Kur'an-ı Kerim yaklaşık kaç yılda indirilmiştir?$q$, array[$o$10$o$, $o$23$o$, $o$40$o$, $o$63$o$], 1, $e$1. Kur'an 610-632 arasında yaklaşık 23 yılda, parça parça indirilmiştir.

Diğer şıklar: **A** süreyi yanlış bilmek / **C** süreyi yanlış bilmek / **D** Hz. Muhammed'in yaşını yazmak.$e$, 1),
  (5, 'lgs-din', null::integer, $q$Kur'an'ın parça parça indirilmesinin nedenlerinden biri aşağıdakilerden hangisidir?$q$, array[$o$Kitabın yalnızca bir kişiye öğretilmesi$o$, $o$Olaylara ve sorulara zamanında cevap vermek$o$, $o$Yazılı metne gerek olmaması$o$, $o$Peygamberin bilgisinin kıt olması$o$], 1, $e$1. Parça parça inmesi kolay anlaşılmasını, ezberlenmesini ve olaylara zamanında cevap verilmesini sağladı.
2. Aynı zamanda eğitimin kademeli yapılmasına yardım etti.

Diğer şıklar: **A** nedeni yanlış bilmek / **C** nedeni yanlış bilmek / **D** nedeni yanlış bilmek.$e$, 2),
  (6, 'lgs-din', null::integer, $q$Aşağıdaki sureler arasında Medeni sure olan hangisidir?$q$, array[$o$Bakara$o$, $o$Alak$o$, $o$Kevser$o$, $o$İhlas$o$], 0, $e$1. Bakara, Nisa ve Maide Medeni surelerdir.
2. Alak, Kevser ve İhlas Mekki surelerdir.

Diğer şıklar: **B** Mekki sureyi Medeni sanmak / **C** Mekki sureyi Medeni sanmak / **D** Mekki sureyi Medeni sanmak.$e$, 2),
  (7, 'lgs-din', null::integer, $q$Mekki surelerin ana konuları aşağıdakilerden hangisidir?$q$, array[$o$Ayrıntılı miras hukuku$o$, $o$İman esasları, ahlak ve kıssalar$o$, $o$Savaş ve barış kuralları$o$, $o$Ticaret ve borç hükümleri$o$], 1, $e$1. Mekke'de inen ayetler kalplerde sağlam bir inanç oluşturmayı hedefler.
2. Medine'de inen ayetler ise toplum düzenini ve hukuku düzenler.

Diğer şıklar: **A** Medeni sure konusunu seçmek / **C** Medeni sure konusunu seçmek / **D** Medeni sure konusunu seçmek.$e$, 2),
  (8, 'lgs-din', null::integer, $q$Kur'an'ın ilk kez bir araya toplanmasına hangi halifenin döneminde karar verilmiştir?$q$, array[$o$Hz. Ömer$o$, $o$Hz. Osman$o$, $o$Hz. Ebubekir$o$, $o$Hz. Ali$o$], 2, $e$1. Yemame Savaşı'nda çok sayıda hafız şehit olunca Hz. Ebubekir döneminde Zeyd b. Sabit başkanlığında ayetler toplandı.

Diğer şıklar: **A** halifeyi karıştırmak / **B** çoğaltma yapan halifeyi seçmek / **D** halifeyi karıştırmak.$e$, 2),
  (9, 'lgs-din', null::integer, $q$Mushaf-ı Osmani'nin oluşturulmasının amacı aşağıdakilerden hangisidir?$q$, array[$o$Kur'an'ı yeni baştan yazmak$o$, $o$Kur'an'ı farklı dillere çevirmek$o$, $o$Kur'an'ın ayet sayısını artırmak$o$, $o$Metin birliğini sağlamak$o$], 3, $e$1. Farklı bölgelerde okunuş ayrılıkları ortaya çıkınca Hz. Osman, Hz. Ebubekir döneminde toplanan nüshayı esas alarak çoğalttı.
2. Nüshalar merkezlere gönderildi ve metin birliği sağlandı.

Diğer şıklar: **A** amacı yanlış bilmek / **B** meal ile karıştırmak / **C** amacı yanlış bilmek.$e$, 2),
  (10, 'lgs-din', null::integer, $q$Aşağıdaki tabloda Kur'an'ın tarihine ait bazı olaylar verilmiştir.

| Olay | Dönem |
| --- | --- |
| I. Ayetlerin kemik, deri, hurma dalına yazılması | Hz. Muhammed |
| II. Ayetlerin sayfalar hâlinde toplanması | Hz. Ebubekir |
| III. Nüshaların çoğaltılıp merkezlere gönderilmesi | Hz. Osman |

Buna göre doğru eskiden yeniye sıralama aşağıdakilerden hangisidir?$q$, array[$o$I, II, III$o$, $o$II, I, III$o$, $o$I, III, II$o$, $o$III, II, I$o$], 0, $e$1. Önce Hz. Muhammed döneminde yazım ve ezber, sonra Hz. Ebubekir döneminde toplama, sonra Hz. Osman döneminde çoğaltma yapıldı.

Diğer şıklar: **B** ilk iki olayı karıştırmak / **C** son iki olayı karıştırmak / **D** sırayı ters kurmak.$e$, 3),
  (11, 'lgs-din', null::integer, $q$Aşağıdakilerden hangisi Kur'an'ın korunmasına katkı sağlayan unsurlardan biri **değildir**?$q$, array[$o$Her bölgede farklı metinlerin okunması$o$, $o$Hafızlık geleneğinin sürmesi$o$, $o$Yazılı nüshaların çoğaltılması$o$, $o$Tecvid ve kıraat ilimlerinin gelişmesi$o$], 0, $e$1. Kur'an hafızlık, yazılı nüshalar ve tecvid sayesinde korunmuştur.
2. Bugün dünyanın her yerinde aynı metin kullanılır.

Diğer şıklar: **B** doğru unsuru yanlış sanmak / **C** doğru unsuru yanlış sanmak / **D** doğru unsuru yanlış sanmak.$e$, 3),
  (12, 'lgs-din', null::integer, $q$Kur'an'daki kıssalar (Hz. İbrahim, Hz. Musa, Hz. Yusuf gibi) neden anlatılır?$q$, array[$o$Yalnızca tarih bilgisi vermek için$o$, $o$Ders çıkarmak ve örnek olmak için$o$, $o$Eğlence sağlamak için$o$, $o$Hukuk kuralı koymak için$o$], 1, $e$1. Kıssalar geçmiş peygamberlerin ve toplumların hikâyelerini anlatır.
2. Amaç tarih anlatmak değil, ders çıkarmaktır.

Diğer şıklar: **A** kıssaların amacını daraltmak / **C** kıssaların amacını yanlış bilmek / **D** konusunu karıştırmak.$e$, 3),
  (13, 'lgs-din', null::integer, $q$Kur'an'ın anlamının başka bir dile çevrilmesine ne ad verilir?$q$, array[$o$Tefsir$o$, $o$Tecvid$o$, $o$Meal$o$, $o$Hatim$o$], 2, $e$1. Meal, Kur'an'ın anlamının başka bir dile çevrilmesidir.
2. Tefsir ayetlerin ayrıntılı açıklanması, hatim ise tamamının okunmasıdır.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **D** kavramı karıştırmak.$e$, 3),
  (14, 'lgs-din', null::integer, $q$Kur'an'ın tamamını baştan sona okuyup bitirmeye ne denir?$q$, array[$o$Tertil$o$, $o$Meal$o$, $o$Tecvid$o$, $o$Hatim$o$], 3, $e$1. Hatim, Kur'an'ın tamamını baştan sona okumaktır.
2. Tertil yavaş ve düşünerek okumaktır, tecvid ise kurallarla okumaktır.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **C** kavramı karıştırmak.$e$, 3),
  (15, 'lgs-din', null::integer, $q$Kur'an'ı yavaş, düşünerek ve anlaşılır biçimde okumaya ne denir?$q$, array[$o$Hatim$o$, $o$Tefsir$o$, $o$Tertil$o$, $o$Meal$o$], 2, $e$1. Tertil, Kur'an'ı yavaş, düşünerek ve anlaşılır biçimde okumaktır.
2. Asıl amaç sadece okumak değil, anlamak ve yaşamaktır.

Diğer şıklar: **A** kavramı karıştırmak / **B** kavramı karıştırmak / **D** kavramı karıştırmak.$e$, 3),
  (16, 'lgs-din', null::integer, $q$Kur'an'ın en önemli özelliklerinden biri evrensel olmasıdır.

Bu özellik aşağıdakilerden hangisini ifade eder?$q$, array[$o$Yalnızca Araplara hitap etmesini$o$, $o$Yalnızca bir döneme özgü olmasını$o$, $o$Yalnızca âlimlerce anlaşılmasını$o$, $o$Bütün insanlığa hitap etmesini$o$], 3, $e$1. Kur'an belirli bir ırka ya da döneme özgü değildir.
2. Bütün insanlığa hitap eder.

Diğer şıklar: **A** özelliği daraltmak / **B** özelliği daraltmak / **C** özelliği daraltmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

