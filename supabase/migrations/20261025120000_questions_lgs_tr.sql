-- 20261025120000_questions_lgs_tr. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-tr | Sözcükte Anlam konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Sözcükte Anlam konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözcükte Anlam$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "baş" sözcüğü gerçek anlamıyla kullanılmıştır?$q$, array[$o$Bu işin başında deneyimli biri var.$o$, $o$Dağın başına kar yağmış.$o$, $o$Hikâyenin başını dikkatle okudu.$o$, $o$Başını yastığa koyar koymaz uyudu.$o$], 3, $e$1. Gerçek anlamda baş, vücudun üst kısmıdır.
2. Diğer cümlelerde baş sözcüğü yönetici, tepe ve ilk bölüm gibi yan anlamlarda kullanılmıştır.

Diğer şıklar: **A** yönetici anlamını gerçek sanmak / **B** tepe anlamını gerçek sanmak / **C** ilk bölüm anlamını gerçek sanmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde altı çizili sözcük terim anlamıyla kullanılmıştır?$q$, array[$o$Hasta **yatağında** dinleniyordu.$o$, $o$Yaşlı adam **yolda** durdu.$o$, $o$Doktor hastanın **tansiyonunu** ölçtü.$o$, $o$Annem sofrayı **kurdu**.$o$], 2, $e$1. Terim anlam, bir sözcüğün bilim, sanat ya da meslek dalında kazandığı özel anlamdır.
2. Tansiyon sözcüğü tıp alanının terimidir.

Diğer şıklar: **A** gerçek anlam / **B** gerçek anlam / **D** gerçek anlam.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdaki sözcük çiftlerinden hangisi zıt anlamlıdır?$q$, array[$o$sevinç - üzüntü$o$, $o$cesur - yürekli$o$, $o$kalp - yürek$o$, $o$şiir - manzume$o$], 0, $e$1. Zıt anlamlı sözcükler birbirinin karşıtıdır. Sevinç ile üzüntü karşıt duygulardır.

Diğer şıklar: **B** eş anlamlı çifti seçmek / **C** eş anlamlı çifti seçmek / **D** eş anlamlı çifti seçmek.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi soyut anlamlıdır?$q$, array[$o$elma$o$, $o$kapı$o$, $o$mutluluk$o$, $o$deniz$o$], 2, $e$1. Soyut sözcükler duyu organlarıyla algılanamaz. Mutluluk soyut bir kavramdır.

Diğer şıklar: **A** somut sözcük / **B** somut sözcük / **D** somut sözcük.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "soğuk" sözcüğü mecaz anlamıyla kullanılmıştır?$q$, array[$o$Soğuk suyu bir dikişte içti.$o$, $o$Soğuk bir kış günüydü.$o$, $o$Soğuk hava yüzünü yaktı.$o$, $o$Konuklara oldukça soğuk davrandı.$o$], 3, $e$1. Mecaz anlamda soğuk, "ilgisiz, sevgisiz" demektir.
2. Diğer cümlelerde soğuk, sıcaklıkla ilgili gerçek anlamdadır.

Diğer şıklar: **A** gerçek anlam / **B** gerçek anlam / **C** gerçek anlam.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "yaz" sözcüğü mevsim anlamıyla kullanılmıştır?$q$, array[$o$Defterinin kapağına adını yaz.$o$, $o$Cevabını temiz bir kâğıda yaz.$o$, $o$Bu yaz dedemlerin köyüne gideceğiz.$o$, $o$Duyduklarını unutmadan hemen yaz.$o$], 2, $e$1. Eş sesli sözcüklerde anlamı cümleden anlarız.
2. "Bu yaz" ifadesinde yaz, yılın dört mevsiminden biridir.

Diğer şıklar: **A** fiil olan yaz sözcüğünü seçmek / **B** fiil olan yaz sözcüğünü seçmek / **D** fiil olan yaz sözcüğünü seçmek.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "ayak" sözcüğü yan anlamıyla kullanılmıştır?$q$, array[$o$Ayağını burkunca doktora gitti.$o$, $o$Masanın ayağı yerinden çıkmıştı.$o$, $o$Ayağı kayıp yere düştü.$o$, $o$Pazara çıplak ayakla gitti.$o$], 1, $e$1. Masanın ayağı, ayak sözcüğünün "destek olan parça" anlamında kazandığı yan anlamdır.
2. Diğer cümlelerde ayak organ anlamındadır.

Diğer şıklar: **A** gerçek anlam / **C** gerçek anlam / **D** gerçek anlam.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde altı çizili sözcük soyut anlamlıdır?$q$, array[$o$Çocuk **elma** yedi.$o$, $o$**Sevgi** insanları birbirine bağlar.$o$, $o$Masanın üstünde **bardak** vardı.$o$, $o$**Kapı** yavaşça açıldı.$o$], 1, $e$1. Sevgi duyu organlarıyla algılanamayan, soyut bir kavramdır.

Diğer şıklar: **A** somut sözcük / **C** somut sözcük / **D** somut sözcük.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi diğerlerini kapsayan genel anlamlı sözcüktür?$q$, array[$o$otobüs$o$, $o$uçak$o$, $o$gemi$o$, $o$taşıt$o$], 3, $e$1. Taşıt, otobüs, uçak ve gemiyi kapsayan genel bir sözcüktür.

Diğer şıklar: **A** özel anlamlı sözcük / **B** özel anlamlı sözcük / **C** özel anlamlı sözcük.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Dost" sözcüğünün eş anlamlısı aşağıdakilerden hangisidir?$q$, array[$o$düşman$o$, $o$komşu$o$, $o$arkadaş$o$, $o$yabancı$o$], 2, $e$1. Dost ile arkadaş aynı anlamda kullanılabilen eş anlamlı sözcüklerdir.

Diğer şıklar: **A** zıt anlamlısını seçmek / **B** yakın ama eş olmayan sözcük / **D** zıt anlama yakın sözcük.$e$, 2),
  (11, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde altı çizili sözcük terim anlamıyla kullanılmıştır?$q$, array[$o$İkinci dereceden denklemin **kökleri** bulundu.$o$, $o$Ağacın **kökleri** toprağa derinlemesine işlemişti.$o$, $o$Sorunun **kökü** çok eskilere dayanıyordu.$o$, $o$Dişin **kökü** çürüdüğü için çekildi.$o$], 0, $e$1. Matematikte denklemin kökü, denklemi sağlayan değerdir ve bir terimdir.
2. Diğer cümlelerde köken gerçek ya da mecaz anlamlıdır.

Diğer şıklar: **B** gerçek anlam / **C** mecaz anlam / **D** gerçek anlam.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "kalp" sözcüğü mecaz anlamıyla kullanılmıştır?$q$, array[$o$Kalbi kırılan çocuk köşeye çekildi.$o$, $o$Doktor hastanın kalbini dinledi.$o$, $o$Koşunca kalbi hızla çarpmaya başladı.$o$, $o$Kalp kasları spor yaparak güçlenir.$o$], 0, $e$1. "Kalbi kırılmak" üzülmek, incinmek anlamındadır ve kalp burada duygu merkezi olarak mecazdır.

Diğer şıklar: **B** gerçek anlam / **C** gerçek anlam / **D** gerçek anlam.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "kâr" sözcüğü kazanç anlamıyla kullanılmıştır?$q$, array[$o$Kar yağınca yollar kapandı.$o$, $o$Satıştan büyük bir kâr elde etti.$o$, $o$Çocuklar bahçede kardan adam yaptı.$o$, $o$Dağların zirvesi karla kaplıydı.$o$], 1, $e$1. Kâr (kazanç) ile kar (donmuş yağış) eş sesli sözcüklerdir.
2. Satıştan elde edilen kazanç kâr sözcüğüne uyar.

Diğer şıklar: **A** yağış anlamındaki kar sözcüğünü seçmek / **C** yağış anlamındaki kar sözcüğünü seçmek / **D** yağış anlamındaki kar sözcüğünü seçmek.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Hava çok sıcak olduğu için ______ bir içecek istedi.

Bu cümledeki boşluğa aşağıdakilerden hangisi getirilmelidir?$q$, array[$o$tatlı$o$, $o$soğuk$o$, $o$sert$o$, $o$ekşi$o$], 1, $e$1. Hava sıcak olduğuna göre karşıt anlamlı olan soğuk içecek istenir.

Diğer şıklar: **A** sıcaklıkla ilgisiz seçim / **C** anlamsız seçim / **D** sıcaklıkla ilgisiz seçim.$e$, 2),
  (15, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde mecaz anlam **yoktur**?$q$, array[$o$Kitaplar en iyi dosttur.$o$, $o$Sözleri yüreğime işledi.$o$, $o$Zaman su gibi akıp gitti.$o$, $o$Sabah erkenden pazara gitti.$o$], 3, $e$1. "Sabah erkenden pazara gitti" cümlesindeki sözcükler gerçek anlamdadır.
2. Diğer cümlelerde kitapların dost olması, sözün yüreğe işlemesi ve zamanın su gibi akması mecazdır.

Diğer şıklar: **A** mecaz kullanım / **B** mecaz kullanım / **C** mecaz kullanım.$e$, 3),
  (16, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "düşmek" fiili "ele geçmek" anlamında kullanılmıştır?$q$, array[$o$Kale düşman eline düştü.$o$, $o$Çocuk bisikletten düştü.$o$, $o$Yapraklar yere düştü.$o$, $o$Sebzelerin fiyatı düştü.$o$], 0, $e$1. Kalenin düşman eline düşmesi, ele geçirilmesi anlamındadır.
2. Diğer cümlelerde düşmek, yere inmek ve azalmak anlamlarında kullanılmıştır.

Diğer şıklar: **B** gerçek anlam / **C** gerçek anlam / **D** azalmak anlamı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Deyimler ve Atasözleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Deyimler ve Atasözleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Deyimler ve Atasözleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$"Göz yummak" deyimi aşağıdaki cümlelerin hangisinde yerinde kullanılmıştır?$q$, array[$o$Çocuk yorgunluktan göz yumdu.$o$, $o$Öğretmen küçük hataya göz yumdu.$o$, $o$Sabah erkenden göz yumdu.$o$, $o$Havuzda göz yumarak yüzdü.$o$], 1, $e$1. "Göz yummak", bir hatayı bilmezlikten gelmek, görmezden gelmek anlamındadır.

Diğer şıklar: **A** deyimi yanlış bağlamda kullanmak / **C** deyimi yanlış bağlamda kullanmak / **D** deyimi yanlış bağlamda kullanmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$"Damlaya damlaya göl olur." atasözü aşağıdakilerden hangisini anlatır?$q$, array[$o$Küçük birikimlerin büyüdüğünü$o$, $o$Su kaynaklarının çok önemli olduğunu$o$, $o$Göllerin yağmurla dolduğunu$o$, $o$Her işin bir zamanı olduğunu$o$], 0, $e$1. Atasözü, küçük birikimlerin zamanla büyüyeceğini söyler.

Diğer şıklar: **B** gerçek anlama takılmak / **C** gerçek anlama takılmak / **D** başka atasözü anlamını seçmek.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi bir deyimdir?$q$, array[$o$Ağaç yaşken eğilir.$o$, $o$Güneş balçıkla sıvanmaz.$o$, $o$Sakla samanı, gelir zamanı.$o$, $o$burnu havada olmak$o$], 3, $e$1. Deyimler kalıplaşmış söz öbekleridir. "Burnu havada olmak", kibirli olmak demektir.
2. Diğerleri atasözüdür.

Diğer şıklar: **A** atasözü / **B** atasözü / **C** atasözü.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi bir atasözüdür?$q$, array[$o$kulak vermek$o$, $o$gözden düşmek$o$, $o$Sakla samanı, gelir zamanı.$o$, $o$ağzı kulaklarında olmak$o$], 2, $e$1. Atasözleri öğüt ve ders veren, kalıplaşmış cümlelerdir.

Diğer şıklar: **A** deyim / **B** deyim / **D** deyim.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Komşu komşunun külüne muhtaçtır." atasözünün ana fikri aşağıdakilerden hangisidir?$q$, array[$o$İnsanlar birbirine ihtiyaç duyar.$o$, $o$Komşuların evleri birbirine yakın olmalıdır.$o$, $o$Kül, komşuluk için çok önemlidir.$o$, $o$Komşular birbirine hediye vermelidir.$o$], 0, $e$1. Atasözü komşuların, dolayısıyla insanların birbirine her zaman ihtiyaç duyacağını anlatır.

Diğer şıklar: **B** gerçek anlama takılmak / **C** gerçek anlama takılmak / **D** anlamı daraltmak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde boş bırakılan yere "ağzı kulaklarına varmak" deyimi getirilebilir?$q$, array[$o$Dün gece yağan yağmurdan sonra sabah hava ______.$o$, $o$Sınavdan yüz alan Ece'nin ______.$o$, $o$Çocuğun ayakkabısı çamurdan ______.$o$, $o$Yolculuğun süresi saatlerce ______.$o$], 1, $e$1. Bu deyim çok sevinmek anlamındadır. Sınavdan yüz alan biri çok sevinir.

Diğer şıklar: **A** anlamsız bağlam / **C** anlamsız bağlam / **D** anlamsız bağlam.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Ak akçe kara gün içindir." atasözü aşağıdaki davranışlardan hangisiyle ilgilidir?$q$, array[$o$Cömert davranmak$o$, $o$Tasarruf etmek$o$, $o$Hızlı çalışmak$o$, $o$Komşuya yardım etmek$o$], 1, $e$1. Zor günlere hazırlıklı olmak için para biriktirmek, tasarruf etmektir.

Diğer şıklar: **A** ters anlam / **C** ilgisiz anlam / **D** ilgisiz anlam.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde deyim yanlış anlamda kullanılmıştır?$q$, array[$o$Tarif için kılı kırk yararak uğraştı.$o$, $o$Bu sorunu çözmek için başını kaşıdı.$o$, $o$Çocuk yağmurda ıslanınca kılı kırk yardı.$o$, $o$Bütün gün ayağının tozuyla çalıştı.$o$], 2, $e$1. "Kılı kırk yarmak", çok ince eleyip sık dokumaktır ve yağmurda ıslanmayla ilgisi yoktur.

Diğer şıklar: **A** doğru kullanım / **B** doğru kullanım / **D** doğru kullanım.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$"Eşeğin ölümü köpeğin bayramı" ile aynı anlamı taşıyan atasözü aşağıdakilerden hangisidir?$q$, array[$o$Birinin zararı, başkasının kârıdır.$o$, $o$Bir elin nesi var, iki elin sesi var.$o$, $o$Sakla samanı, gelir zamanı.$o$, $o$Sabreden derviş muradına ermiş.$o$], 0, $e$1. Bu söz, birinin zararından başkasının yararlandığını anlatır.

Diğer şıklar: **B** birlik atasözü / **C** tasarruf atasözü / **D** sabır atasözü.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Ağaç yaşken eğilir." atasözü hangi durumda kullanılır?$q$, array[$o$Meyve ağaçlarına bakım yapılması gerektiğinde$o$, $o$Yaşlı kişiler dinlenmek istediğinde$o$, $o$Ormandaki ağaçlar kesildiğinde$o$, $o$Eğitime küçük yaşta başlanması gerektiğinde$o$], 3, $e$1. Atasözü, eğitimin küçük yaşta başlaması gerektiğini söyler.

Diğer şıklar: **A** gerçek anlama takılmak / **B** yanlış anlam / **C** gerçek anlama takılmak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "ayak uydurmak" deyimi kullanılmıştır?$q$, array[$o$Ayakkabısının numarası küçük geldi.$o$, $o$Yeni duruma kolayca ayak uydurdu.$o$, $o$Yürürken ayağını burktu.$o$, $o$Merdivenleri ayakla indi.$o$], 1, $e$1. Ayak uydurmak, yeni duruma uyum sağlamak anlamındadır.

Diğer şıklar: **A** gerçek anlamlı cümle / **C** gerçek anlamlı cümle / **D** gerçek anlamlı cümle.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$"Ateş olmayan yerden duman çıkmaz." atasözüne göre aşağıdaki durumlardan hangisi doğrudur?$q$, array[$o$Duman çıkan yerde yangın yoktur.$o$, $o$Yangın her zaman dumansız çıkar.$o$, $o$Her duman tehlikelidir.$o$, $o$Bir söylentinin bir nedeni vardır.$o$], 3, $e$1. Atasözü, bir söylentinin ya da durumun arkasında bir neden olduğunu anlatır.

Diğer şıklar: **A** ters anlam / **B** ters anlam / **C** aşırı genelleme.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde atasözü, durumu en iyi özetleyecek biçimde kullanılmıştır?$q$, array[$o$Her gün biraz biriktirince sonunda büyük para topladı. Dereyi görmeden paçaları sıvama.$o$, $o$Her gün biraz biriktirince sonunda büyük para topladı. Üzüm üzüme baka baka kararır.$o$, $o$Her gün biraz biriktirince sonunda büyük para topladı. Damlaya damlaya göl olur.$o$, $o$Her gün biraz biriktirince sonunda büyük para topladı. Ağaç yaşken eğilir.$o$], 2, $e$1. Küçük birikimlerin büyük sonuç vermesi "Damlaya damlaya göl olur." ile anlatılır.

Diğer şıklar: **A** uygunsuz atasözü / **B** yakın ama farklı atasözü / **D** uygunsuz atasözü.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$"Su akar, yolunu bulur." atasözünün anlamı aşağıdakilerden hangisidir?$q$, array[$o$Su kaynaklarını korumak gerekir.$o$, $o$Her yer suyla dolar.$o$, $o$Yağmur yağınca nehirler taşar.$o$, $o$Engellere rağmen amacına ulaşılır.$o$], 3, $e$1. Atasözü, kararlı olanların engelleri aşıp hedefe ulaştığını anlatır.

Diğer şıklar: **A** gerçek anlama takılmak / **B** gerçek anlama takılmak / **C** gerçek anlama takılmak.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$Aşağıdaki deyimlerden hangisi "çok sevinmek" anlamındadır?$q$, array[$o$başını yemek$o$, $o$dilinin altında bir şey olmak$o$, $o$havalara uçmak$o$, $o$elini kolunu sallamak$o$], 2, $e$1. "Havalara uçmak", aşırı sevinmek anlamına gelir.

Diğer şıklar: **A** farklı anlam / **B** farklı anlam / **D** farklı anlam.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Dost kara günde belli olur." atasözü aşağıdakilerden hangisini söyler?$q$, array[$o$Gerçek dost zor zamanlarda yanındadır.$o$, $o$Dostlar yalnızca mutlu günlerde bir arada olur.$o$, $o$Dost edinmek için kara bir gün beklenir.$o$, $o$Dostluk ancak kışın anlaşılır.$o$], 0, $e$1. Atasözü, gerçek dostun zor günlerde yanında olduğunu anlatır.

Diğer şıklar: **B** ters anlam / **C** gerçek anlama takılmak / **D** gerçek anlama takılmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Cümlede Anlam konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Cümlede Anlam konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi vardır?$q$, array[$o$Yağmur yağdığı için maç ertelendi.$o$, $o$Maç ertelensin diye dua etti.$o$, $o$Hava açık olursa maça gideceğiz.$o$, $o$Maç, geçen haftakinden daha heyecanlıydı.$o$], 0, $e$1. Neden-sonuç cümlesinde bir olay başka bir olayın sebebidir. Yağmur maçın ertelenme nedenidir.

Diğer şıklar: **B** amaç-sonuç ilişkisi / **C** koşul-sonuç ilişkisi / **D** karşılaştırma.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde amaç-sonuç ilişkisi vardır?$q$, array[$o$Çok çalıştığı için sınavı kazandı.$o$, $o$Çalışırsa sınavı kazanabilir.$o$, $o$Sınavı arkadaşından daha kolay buldu.$o$, $o$Sınavı kazanmak için gece gündüz çalışıyor.$o$], 3, $e$1. Amaç-sonuç cümlesinde yapılan işin bir hedefi vardır. "Kazanmak için" amaç bildirir.

Diğer şıklar: **A** neden-sonuç ilişkisi / **B** koşul-sonuç ilişkisi / **C** karşılaştırma.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde koşul-sonuç ilişkisi vardır?$q$, array[$o$Trene yetişmek için erken kalktı.$o$, $o$Erken kalkarsan trene yetişirsin.$o$, $o$Erken kalktığı için trene yetişti.$o$, $o$Tren, otobüsten daha hızlıdır.$o$], 1, $e$1. Koşul-sonuç cümlesinde bir şart gerçekleşirse sonuç da gerçekleşir. "Kalkarsan, yetişirsin" şart bildirir.

Diğer şıklar: **A** amaç-sonuç ilişkisi / **C** neden-sonuç ilişkisi / **D** karşılaştırma.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisi bir tanımlama içerir?$q$, array[$o$Kütüphaneye her hafta gidiyorum.$o$, $o$Kütüphane sabah dokuzda açılır.$o$, $o$Dün kütüphanede ödev yaptım.$o$, $o$Kütüphane, kitap saklanan yerdir.$o$], 3, $e$1. Tanımlama, bir şeyin ne olduğunu açıklar. Kütüphanenin ne olduğu anlatılmıştır.

Diğer şıklar: **A** bilgi verme / **B** bilgi verme / **C** bilgi verme.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde öznel bir yargı vardır?$q$, array[$o$Şiir on dörtlükten oluşuyor.$o$, $o$Şair 1960'ta doğmuş.$o$, $o$Bu şiir, okuduğum en güzel şiirdi.$o$, $o$Kitabın baskısı 2020'de yapılmış.$o$], 2, $e$1. Öznel yargılar kişiden kişiye değişir. "En güzel" kişisel bir değerlendirmedir.
2. Nesnel yargılar kanıtlanabilir.

Diğer şıklar: **A** nesnel yargı / **B** nesnel yargı / **D** nesnel yargı.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde nesnel bir yargı vardır?$q$, array[$o$Ankara, Türkiye'nin başkentidir.$o$, $o$Ankara'nın havası çok güzeldir.$o$, $o$Ankara'da yaşamak herkes için keyiflidir.$o$, $o$Ankara'daki parklar en şirin yerlerdir.$o$], 0, $e$1. Nesnel yargılar doğruluğu kanıtlanabilen yargılardır.

Diğer şıklar: **B** öznel yargı / **C** öznel yargı / **D** öznel yargı.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Bu ödevi yarın teslim edeceğim." cümlesi aşağıdakilerden hangisini bildirir?$q$, array[$o$Olasılık$o$, $o$Şart$o$, $o$Kesinlik$o$, $o$Neden$o$], 2, $e$1. Cümlede kararlılık vardır, olasılık anlamı yoktur.

Diğer şıklar: **A** kesinlik-olasılık karıştırmak / **B** ilgisiz anlam / **D** ilgisiz anlam.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Belki yarın yağmur yağar." cümlesinde hangi anlam vardır?$q$, array[$o$Kesinlik$o$, $o$Neden$o$, $o$Olasılık$o$, $o$Amaç$o$], 2, $e$1. "Belki" sözcüğü olasılık anlamı katar.

Diğer şıklar: **A** kesinlik-olasılık karıştırmak / **B** ilgisiz anlam / **D** ilgisiz anlam.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$"Ali, Veli'den daha çalışkandır." cümlesinde hangi anlam ilişkisi vardır?$q$, array[$o$Neden-sonuç$o$, $o$Amaç-sonuç$o$, $o$Tanımlama$o$, $o$Karşılaştırma$o$], 3, $e$1. Ali ve Veli çalışkanlık açısından karşılaştırılmıştır.

Diğer şıklar: **A** ilişki türünü karıştırmak / **B** ilişki türünü karıştırmak / **C** ilişki türünü karıştırmak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Gürültü yüzünden dersi dinleyemedik." cümlesinde neden hangisidir?$q$, array[$o$Gürültü$o$, $o$Dersi dinlemek$o$, $o$Sınıf$o$, $o$Ders$o$], 0, $e$1. "Yüzünden" nedeni bildirir. Dersi dinleyememe sonuçtur, gürültü ise nedendir.

Diğer şıklar: **B** sonucu neden sanmak / **C** ilgisiz sözcük / **D** ilgisiz sözcük.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde amaç bildiren bir sözcük kullanılmamıştır?$q$, array[$o$Bilet almak için kuyrukta bekledi.$o$, $o$Annem hasta olduğu için okula gelemedi.$o$, $o$Sınavı geçmek amacıyla çok çalıştı.$o$, $o$Sağlıklı kalmak için spor yapıyor.$o$], 1, $e$1. Birinci cümle neden-sonuç bildirir. Diğerleri "için" ve "amacıyla" ile amaç bildirir.

Diğer şıklar: **A** amaç bildiren / **C** amaç bildiren / **D** amaç bildiren.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinden "Hava soğuktur." yargısı çıkarılabilir?$q$, array[$o$Çocuklar kalın montla geldi.$o$, $o$Çocuklar okula yürüyerek geldi.$o$, $o$Okulun bahçesi çok geniş.$o$, $o$Öğretmen sınıfa erken geldi.$o$], 0, $e$1. Kalın mont giymek havanın soğuk olduğunu düşündürür.

Diğer şıklar: **B** çıkarım yok / **C** çıkarım yok / **D** çıkarım yok.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Kitap okumak insanı geliştirir." cümlesi için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Kişisel bir anıdır.$o$, $o$Soru cümlesidir.$o$, $o$Genel bir yargı bildirir.$o$, $o$Karşılaştırma yapar.$o$], 2, $e$1. Cümle herkes için geçerli genel bir görüş bildirir.

Diğer şıklar: **A** yargının türünü karıştırmak / **B** yargının türünü karıştırmak / **D** yargının türünü karıştırmak.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerden hangisi yalnızca olasılık bildirir?$q$, array[$o$Bu yaz tatile gideceğiz.$o$, $o$Bu yaz tatile gidebiliriz.$o$, $o$Bu yaz tatile gittik.$o$, $o$Bu yaz tatile gitmek zorundayız.$o$], 1, $e$1. "-ebiliriz" eki olasılık bildirir. Diğer cümleler kesinlik ya da zorunluluk bildirir.

Diğer şıklar: **A** kesinlik bildirir / **C** geçmiş olay / **D** zorunluluk bildirir.$e$, 2),
  (15, 'lgs-tr', null::integer, $q$"Ders çalışmadığı için sınavdan düşük not aldı." cümlesinden aşağıdaki yargılardan hangisi çıkarılamaz?$q$, array[$o$Düşük not almıştır.$o$, $o$Ders çalışmamıştır.$o$, $o$Notu ders çalışmamasına bağlıdır.$o$, $o$Sınavı çok kolay buldu.$o$], 3, $e$1. Cümle düşük not aldığını ve bunun nedeninin ders çalışmamak olduğunu söyler. Sınavı kolay bulduğu çıkarılamaz.

Diğer şıklar: **A** doğrudan çıkarım / **B** doğrudan çıkarım / **C** doğrudan çıkarım.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Bilgisayar bozulduğu için ödevimi teslim edemedim." cümlesinde sonuç aşağıdakilerden hangisidir?$q$, array[$o$Bilgisayarın bozulması$o$, $o$Ödevin teslim edilememesi$o$, $o$Ödevin yazılması$o$, $o$Teslim tarihinin yaklaşması$o$], 1, $e$1. "Bozulduğu için" nedeni bildirir. Bilgisayarın bozulması neden, ödevin teslim edilememesi sonuçtur.

Diğer şıklar: **A** nedeni sonuç sanmak / **C** ilgisiz ifade / **D** ilgisiz ifade.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Paragrafta Anlam konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Paragrafta Anlam konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Ağaçlar yalnızca gölge veren varlıklar değildir. Havadaki karbondioksiti alıp oksijen üretir, toprağı tutarak erozyonu önler, birçok canlıya yuva olur. Bu nedenle bir ağacı kesmek, aslında bir ekosistemi eksiltmektir.

Bu paragrafın konusu aşağıdakilerden hangisidir?$q$, array[$o$Erozyonun nedenleri$o$, $o$Ağaçların doğadaki işlevleri$o$, $o$Gölgede dinlenmenin önemi$o$, $o$Ormanlarda yaşayan canlılar$o$], 1, $e$1. Konu, paragrafın neyi anlattığıdır. Paragraf ağaçların oksijen üretmesi, erozyonu önlemesi ve yuva olması gibi işlevlerini anlatır.

Diğer şıklar: **A** yardımcı ayrıntıyı konu sanmak / **C** ilk cümledeki ayrıntıyı konu sanmak / **D** ayrıntıyı konu sanmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Ağaçlar yalnızca gölge veren varlıklar değildir. Havadaki karbondioksiti alıp oksijen üretir, toprağı tutarak erozyonu önler, birçok canlıya yuva olur. Bu nedenle bir ağacı kesmek, aslında bir ekosistemi eksiltmektir.

Bu paragrafın ana düşüncesi aşağıdakilerden hangisidir?$q$, array[$o$Ağaçlar gölge sağlayan varlıklardır.$o$, $o$Erozyon önlenmelidir.$o$, $o$Ağaç kesmek kesinlikle yasaklanmalıdır.$o$, $o$Ağaçlar doğa için çok değerlidir.$o$], 3, $e$1. Ana düşünce, yazarın vermek istediği asıl mesajdır. Yazar ağaçların yalnızca gölge vermediğini, birçok işlevi olduğunu vurgular.

Diğer şıklar: **A** ayrıntıyı ana düşünce sanmak / **B** ayrıntıyı ana düşünce sanmak / **C** paragrafta olmayan bir yargı.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Kitap okumak, dünyaya farklı pencerelerden bakmamızı sağlar. Bir romanda yüzyıllar öncesine gideriz, bir hikâyede bambaşka bir kültürü tanırız. Böylece yaşamadığımız hayatları da deneyimlemiş oluruz.

Bu paragrafın ana düşüncesi aşağıdakilerden hangisidir?$q$, array[$o$Romanlar yüzyıllar öncesini anlatır.$o$, $o$Hikâyeler farklı kültürleri tanıtır.$o$, $o$Kitap okumak bakış açımızı genişletir.$o$, $o$Herkes roman okumalıdır.$o$], 2, $e$1. Roman ve hikâye örnekleri yardımcı düşüncelerdir. Asıl vurgu, okumanın bakış açımızı genişletmesidir.

Diğer şıklar: **A** ayrıntıyı ana düşünce sanmak / **B** ayrıntıyı ana düşünce sanmak / **D** paragrafta olmayan bir yargı.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Sabahın erken saatlerinde köy meydanı henüz uyanmamıştı. Çeşmenin başında tek tük serçeler zıplıyor, fırının bacasından ince bir duman yükseliyordu. Sokağa taze ekmek kokusu yayılmıştı.

Bu paragrafta hangi anlatım biçimi ağır basmaktadır?$q$, array[$o$Betimleme$o$, $o$Öyküleme$o$, $o$Açıklama$o$, $o$Tartışma$o$], 0, $e$1. Paragrafta köy meydanı, çeşme ve fırın gözle görülür biçimde anlatılmıştır. Bu, betimlemedir.

Diğer şıklar: **B** olay anlatımı sanmak / **C** bilgi vermek sanmak / **D** görüş savunmak sanmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Kitap okumak, dünyaya farklı pencerelerden bakmamızı sağlar. Bir romanda yüzyıllar öncesine gideriz, bir hikâyede bambaşka bir kültürü tanırız. Böylece yaşamadığımız hayatları da deneyimlemiş oluruz.

Bu paragrafta düşünce hangi yolla geliştirilmiştir?$q$, array[$o$Karşılaştırma$o$, $o$Örneklendirme$o$, $o$Tanık gösterme$o$, $o$Tanımlama$o$], 1, $e$1. "Bir romanda yüzyıllar öncesine gideriz, bir hikâyede bambaşka bir kültürü tanırız" cümleleri örneklerle düşünceyi destekler.

Diğer şıklar: **A** yönteme ters bakmak / **C** yönteme ters bakmak / **D** yönteme ters bakmak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Dün akşam eve dönerken sokağın köşesinde bir kedi yavrusu gördüm. Önce korkarak geri çekildi, sonra yavaşça yanıma geldi. Onu eve götürmeye karar verdim.

Bu paragrafta hangi anlatım biçimi ağır basmaktadır?$q$, array[$o$Betimleme$o$, $o$Açıklama$o$, $o$Öyküleme$o$, $o$Tartışma$o$], 2, $e$1. Paragrafta zaman içinde gelişen olaylar anlatılmıştır. Bu, öykülemedir.

Diğer şıklar: **A** olay anlatımını betimleme sanmak / **B** olayı açıklama sanmak / **D** olayı tartışma sanmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Kent hayatı hızlı ve yorucudur, köy hayatı ise sakin ve doğayla iç içedir. Kentte gürültü hiç eksilmez, köyde sessizlik hâkimdir. Kentte herkes aceleyle yürür, köyde zaman daha yavaş akar.

Bu paragrafta düşünce hangi yolla geliştirilmiştir?$q$, array[$o$Tanık gösterme$o$, $o$Örneklendirme$o$, $o$Tanımlama$o$, $o$Karşılaştırma$o$], 3, $e$1. Kent ve köy hayatı birbiriyle karşılaştırılmıştır.

Diğer şıklar: **A** yönteme ters bakmak / **B** yönteme ters bakmak / **C** yönteme ters bakmak.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Atatürk, "Hayatta en hakiki mürşit ilimdir, fendir." demiştir. Bu söz, bilimin insanlığa yol gösterdiğini ve her alanda ilerlemenin bilimle mümkün olduğunu anlatır.

Bu paragrafta düşünce hangi yolla geliştirilmiştir?$q$, array[$o$Karşılaştırma$o$, $o$Betimleme$o$, $o$Tanık gösterme$o$, $o$Sayısal verilerden yararlanma$o$], 2, $e$1. Atatürk'ün sözü alıntılanarak düşünce desteklenmiştir. Bu, tanık göstermedir.

Diğer şıklar: **A** yönteme ters bakmak / **B** yönteme ters bakmak / **D** yönteme ters bakmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Ağaçlar yalnızca gölge veren varlıklar değildir. Havadaki karbondioksiti alıp oksijen üretir, toprağı tutarak erozyonu önler, birçok canlıya yuva olur. Bu nedenle bir ağacı kesmek, aslında bir ekosistemi eksiltmektir.

Aşağıdakilerden hangisi bu paragrafta yardımcı düşünce olarak yer alır?$q$, array[$o$Ağaçlar toprağı tutarak erozyonu önler.$o$, $o$Ağaçlar doğa için çok önemlidir.$o$, $o$Ağaçlar kesilmemelidir.$o$, $o$Doğa korunmalıdır.$o$], 0, $e$1. Yardımcı düşünceler ana düşünceyi destekler. Erozyonu önlemek, ana düşünceyi destekleyen bir ayrıntıdır.

Diğer şıklar: **B** ana düşünceyi yardımcı sanmak / **C** paragrafta olmayan yargı / **D** paragrafta olmayan yargı.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Sağlıklı beslenmek için ilk koşul öğünleri atlamamaktır. ______ Ayrıca yeterli su içmek de beslenmenin önemli bir parçasıdır.

Bu paragrafın boşluğuna aşağıdakilerden hangisi getirilmelidir?$q$, array[$o$Sebze ve meyve tüketimi de önemlidir.$o$, $o$Çocuklar bahçede oyun oynamayı sever.$o$, $o$Tatil için deniz kıyısı seçilir.$o$, $o$Sinema salonunun ışıkları sönmüştür.$o$], 0, $e$1. Paragraf beslenme konusundadır. Boşluk, beslenmeyle ilgili bir cümleyle doldurulmalıdır.

Diğer şıklar: **B** konuyla ilgisiz / **C** konuyla ilgisiz / **D** konuyla ilgisiz.$e$, 2),
  (11, 'lgs-tr', null::integer, $q$(I) Müzeler, geçmişle bugün arasında köprü kurar. (II) Ziyaretçiler eski eserleri görerek tarihi daha iyi anlar. (III) Müzenin girişinde büyük bir bahçe var. (IV) Eserler, bir toplumun yaşam biçimini yansıtır.

Bu parçadaki numaralanmış cümlelerden hangisi anlatım akışını bozmaktadır?$q$, array[$o$I$o$, $o$II$o$, $o$IV$o$, $o$III$o$], 3, $e$1. Diğer cümleler müzelerin önemini anlatır. III. cümle ise müzenin bahçesinden söz eder ve akışı bozar.

Diğer şıklar: **A** akışa uygun cümleyi seçmek / **B** akışa uygun cümleyi seçmek / **C** akışa uygun cümleyi seçmek.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Düzenli spor yapmak, vücut sağlığını korumanın en etkili yollarından biridir. Spor kasları güçlendirir, kalp ve akciğerlerin çalışmasını düzenler. Ayrıca stresi azaltarak ruh hâlini iyileştirir.

Bu paragrafın ana düşüncesi aşağıdakilerden hangisidir?$q$, array[$o$Kaslar ancak sporla güçlenir.$o$, $o$Stres yalnızca sporla azalır.$o$, $o$Spor beden ve ruh sağlığına yarar.$o$, $o$Kalp ve akciğer çalışması önemlidir.$o$], 2, $e$1. Paragraf sporun kas, kalp-akciğer ve ruh hâli üzerindeki olumlu etkilerini sayar. Ana düşünce bunların ortak sonucudur.

Diğer şıklar: **A** ayrıntıyı ana düşünce sanmak / **B** aşırı genelleme / **D** ayrıntıyı ana düşünce sanmak.$e$, 2),
  (13, 'lgs-tr', null::integer, $q$Kitap okumak, dünyaya farklı pencerelerden bakmamızı sağlar. Bir romanda yüzyıllar öncesine gideriz, bir hikâyede bambaşka bir kültürü tanırız. Böylece yaşamadığımız hayatları da deneyimlemiş oluruz.

Bu paragraftan aşağıdaki yargılardan hangisi çıkarılamaz?$q$, array[$o$Okumak farklı kültürleri tanımayı sağlar.$o$, $o$Roman okumak yalnızca eğlence amaçlıdır.$o$, $o$Okumak başka dönemleri hayal etmeyi sağlar.$o$, $o$Okuyan kişi yeni deneyimler kazanır.$o$], 1, $e$1. Paragraf okumanın bakış açısını genişlettiğini söyler. Romanın yalnızca eğlence için okunduğu yargısı paragrafta yoktur.

Diğer şıklar: **A** paragraftan çıkarılabilir / **C** paragraftan çıkarılabilir / **D** paragraftan çıkarılabilir.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$(I) Mimar Sinan, Osmanlı'nın en önemli mimarlarından biridir. (II) Süleymaniye Camii onun ustalık eseridir. (III) Sinan'ın eserleri, sağlam yapıları ve estetik anlayışıyla tanınır. (IV) Bu nedenle Sinan, dünya mimarlık tarihinde önemli bir yere sahiptir.

Bu parça ikiye bölünmek istenirse ikinci bölüm hangi cümleyle başlar?$q$, array[$o$II$o$, $o$III$o$, $o$IV$o$, $o$I$o$], 1, $e$1. İlk bölümde Sinan ve Süleymaniye tanıtılır. III. cümleden itibaren eserlerin genel özellikleri ve önemi anlatılır.

Diğer şıklar: **A** bölüm yerini yanlış belirlemek / **C** bölüm yerini yanlış belirlemek / **D** bölüm yerini yanlış belirlemek.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$Zamanı verimli kullananlar işlerini erteleme alışkanlığından uzak durur. Önce yapılacakları sıralar, sonra önem derecesine göre planlar, en sonunda da uygular. Bu yöntem hem zaman kazandırır hem de stresi azaltır.

Bu paragrafta anlatılan yöntemin sonucu aşağıdakilerden hangisidir?$q$, array[$o$İşler ertelenir.$o$, $o$Plan yapma gereği kalmaz.$o$, $o$Önem derecesi önemsiz olur.$o$, $o$Zaman kazanılır ve stres azalır.$o$], 3, $e$1. Son cümle yöntemin hem zaman kazandırdığını hem de stresi azalttığını söyler.

Diğer şıklar: **A** ters anlam / **B** ters anlam / **C** ters anlam.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Paragrafın başına getirilmesi uygun olan cümle hangisidir?

(...) Çünkü sabah sporu hem uykunun açılmasını hem de gün boyu enerjik kalmayı sağlar. Bu yüzden birçok sporcu antrenmanlarına sabahları başlar.$q$, array[$o$Spor için en uygun zaman sabahtır.$o$, $o$Akşam yemeğini erken yemek gerekir.$o$, $o$Sporcular yarışmalara hazırlanır.$o$, $o$Bazı insanlar geceleri çalışmayı sever.$o$], 0, $e$1. Verilen cümleler sabah sporunun faydasını anlatır. Başa gelecek cümle bu düşüncenin genel yargısı olmalıdır.

Diğer şıklar: **B** konuyla ilgisiz / **C** konuyu daraltmak / **D** konuyla ilgisiz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Metin Türleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Metin Türleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Metin Türleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Bir kişinin yaşamını, başkası tarafından anlatan yazı türü aşağıdakilerden hangisidir?$q$, array[$o$Biyografi$o$, $o$Otobiyografi$o$, $o$Günlük$o$, $o$Mektup$o$], 0, $e$1. Biyografi, bir kişinin hayatının başkası tarafından anlatılmasıdır.
2. Kişinin kendi hayatını anlatması otobiyografidir.

Diğer şıklar: **B** kişinin kendi yazdığı yazıyla karıştırmak / **C** yazı türünü karıştırmak / **D** yazı türünü karıştırmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Bir kişinin kendi yaşamını kendisinin anlattığı yazı türü aşağıdakilerden hangisidir?$q$, array[$o$Biyografi$o$, $o$Haber$o$, $o$Makale$o$, $o$Otobiyografi$o$], 3, $e$1. Otobiyografi, kişinin kendi hayatını kendisinin anlatmasıdır.

Diğer şıklar: **A** yazı türünü karıştırmak / **B** yazı türünü karıştırmak / **C** yazı türünü karıştırmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Olayların gerçekleştiği gün, tarih ve yer bilgisi verilerek yazılan, güncel olayları bildiren yazı türü aşağıdakilerden hangisidir?$q$, array[$o$Haber$o$, $o$Fıkra$o$, $o$Deneme$o$, $o$Gezi yazısı$o$], 0, $e$1. Haber metni, güncel olayları kısa ve doğru biçimde bildirir.

Diğer şıklar: **B** yazı türünü karıştırmak / **C** yazı türünü karıştırmak / **D** yazı türünü karıştırmak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Bir kişiyle yapılan soru-cevap biçimindeki yazı türü aşağıdakilerden hangisidir?$q$, array[$o$Makale$o$, $o$Anı$o$, $o$Söyleşi$o$, $o$Günlük$o$], 2, $e$1. Söyleşide (röportaj) gazeteci bir kişiye sorular yöneltir ve cevapları yazıya geçirir.

Diğer şıklar: **A** yazı türünü karıştırmak / **B** yazı türünü karıştırmak / **D** yazı türünü karıştırmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Hayvanların insanlar gibi konuştuğu ve genellikle ders verici sonuçlarla biten kısa öykü türü aşağıdakilerden hangisidir?$q$, array[$o$Fabl$o$, $o$Efsane$o$, $o$Destan$o$, $o$Roman$o$], 0, $e$1. Fabl, hayvan, bitki ya da eşyaların kişileştirildiği ve ders verici bir sonuca varan kısa öyküdür.

Diğer şıklar: **B** olağanüstü anlatı ile karıştırmak / **C** uzun kahramanlık anlatısı ile karıştırmak / **D** uzun kurmaca ile karıştırmak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Bir varmış, bir yokmuş..." kalıbıyla başlayan ve olağanüstü olayları anlatan anlatı türü aşağıdakilerden hangisidir?$q$, array[$o$Hikâye$o$, $o$Anı$o$, $o$Günlük$o$, $o$Masal$o$], 3, $e$1. Masallarda "bir varmış, bir yokmuş" gibi kalıplar ve olağanüstü kişiler bulunur.

Diğer şıklar: **A** gerçekçi anlatı ile karıştırmak / **B** gerçek yaşantı ile karıştırmak / **C** yazı türünü karıştırmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Bir milletin ortak belleğini yansıtan, ilk çağlarda kahramanlıkları anlatan uzun manzum ya da düz yazılı anlatı türü aşağıdakilerden hangisidir?$q$, array[$o$Destan$o$, $o$Fabl$o$, $o$Hikâye$o$, $o$Mektup$o$], 0, $e$1. Destanlar, millet hayatını etkileyen olayları ve kahramanlıkları anlatan, uzun anlatılardır.

Diğer şıklar: **B** ders veren hayvan öyküsü ile karıştırmak / **C** kısa gerçekçi anlatı ile karıştırmak / **D** yazı türünü karıştırmak.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Yazarın bir gün gördüğü ya da yaşadığı olayı, tarihini belirterek her gün kaleme aldığı yazı" türü aşağıdakilerden hangisidir?$q$, array[$o$Anı$o$, $o$Günlük$o$, $o$Makale$o$, $o$Mektup$o$], 1, $e$1. Günlükte olaylar tarih atılarak her gün yazılır. Anı ise geçmişte yaşanmış olayların sonradan anlatılmasıdır.

Diğer şıklar: **A** geçmişe dönük anlatıyla karıştırmak / **C** bilimsel yazıyla karıştırmak / **D** karşılıklı yazışmayla karıştırmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Yazarın gezdiği yerleri, gözlemlerini ve izlenimlerini anlattığı yazı türü aşağıdakilerden hangisidir?$q$, array[$o$Haber$o$, $o$Biyografi$o$, $o$Gezi yazısı$o$, $o$Söyleşi$o$], 2, $e$1. Gezi yazısı yazarın gezdiği yerlerdeki gözlem ve izlenimlerini aktarır.

Diğer şıklar: **A** yazı türünü karıştırmak / **B** yazı türünü karıştırmak / **D** yazı türünü karıştırmak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Dün öğleden sonra bahçede toplanan çocuklar, yağmura rağmen oyun oynamaya devam etti. Küçük Ali de ıslanmaktan çekinmedi." parçası aşağıdaki türlerden hangisine daha yakındır?$q$, array[$o$Makale$o$, $o$Hikâye$o$, $o$Mektup$o$, $o$Haber$o$], 1, $e$1. Parça kurmaca kişiler (çocuklar, Ali) ve olay örgüsü içerdiği için hikâyeye yakındır.

Diğer şıklar: **A** bilimsel yazıyla karıştırmak / **C** karşılıklı yazışmayla karıştırmak / **D** güncel olay bildirme ile karıştırmak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Sevgili anneciğim, buraya geleli bir hafta oldu. Yeni arkadaşlarım çok iyi. Sizi çok özledim. Hepinizi öperim." parçası aşağıdakilerden hangisidir?$q$, array[$o$Günlük$o$, $o$Anı$o$, $o$Söyleşi$o$, $o$Mektup$o$], 3, $e$1. Hitap (Sevgili anneciğim) ve kapanış (Hepinizi öperim) mektubun özellikleridir.

Diğer şıklar: **A** yazı türünü karıştırmak / **B** yazı türünü karıştırmak / **C** yazı türünü karıştırmak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki özelliklerden hangisi tiyatro (oyun) metinlerine özgüdür?$q$, array[$o$Soru-cevap biçiminde olması$o$, $o$Her gün tarih atılarak yazılması$o$, $o$Gezilen yerlerin anlatılması$o$, $o$Konuşmaların kişi adlarıyla yazılması$o$], 3, $e$1. Tiyatro metninde diyaloglar kişi adlarıyla yazılır ve sahne yönergeleri bulunur.

Diğer şıklar: **A** söyleşiyle karıştırmak / **B** günlükle karıştırmak / **C** gezi yazısıyla karıştırmak.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi destan ile efsane arasındaki farklardan biridir?$q$, array[$o$Destan kısa, efsane uzun bir metindir.$o$, $o$Destan milletin ortak olayını, efsane bir yeri anlatır.$o$, $o$Efsane gerçek olaylara dayanır, destan hayal ürünüdür.$o$, $o$Destan yalnızca şiir biçiminde yazılır.$o$], 1, $e$1. Destanlar milletin ortak belleğini yansıtır. Efsaneler ise bir yere ya da kişiye bağlı olağanüstü olaylar anlatır.

Diğer şıklar: **A** uzunluk farkını ters bilmek / **C** ilişkiyi ters bilmek / **D** yanlış genelleme.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$"Bence gençler bol bol kitap okumalı." cümlesinin yer aldığı yazı türü aşağıdakilerden hangisi olabilir?$q$, array[$o$Haber$o$, $o$Ansiklopedi maddesi$o$, $o$Deneme$o$, $o$Biyografi$o$], 2, $e$1. Deneme, yazarın kendi görüşünü içten ve kişisel biçimde anlattığı yazı türüdür.

Diğer şıklar: **A** nesnel türü seçmek / **B** nesnel türü seçmek / **D** yazı türünü karıştırmak.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$Şiir ile düz yazı arasındaki en belirgin fark aşağıdakilerden hangisidir?$q$, array[$o$Şiirin her zaman kafiyeli olması$o$, $o$Düz yazının mecaz kullanmaması$o$, $o$Şiirin dizeler hâlinde yazılması$o$, $o$Şiirin uzun cümlelerle yazılması$o$], 2, $e$1. Şiir dize ve dörtlüklerle (bentlerle) yazılır, düz yazı ise paragraflardan oluşur.

Diğer şıklar: **A** serbest şiiri düşünmemek / **B** yanlış genelleme / **D** ters bilgi.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Bir zamanlar köyümüzde herkes birbirine yardım ederdi. O günleri hâlâ özlemle anıyorum." cümlelerinde hangi yazı türünün özelliği vardır?$q$, array[$o$Haber$o$, $o$Anı$o$, $o$Makale$o$, $o$Söyleşi$o$], 1, $e$1. Geçmişte yaşananların sonradan anlatılması anıdır.

Diğer şıklar: **A** güncel olay bildirme ile karıştırmak / **C** bilimsel yazıyla karıştırmak / **D** soru-cevapla karıştırmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Söz Sanatları konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Söz Sanatları konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Söz Sanatları$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$"Dağlar, sabah sisinin içinde uyuyordu." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Benzetme$o$, $o$Abartma$o$, $o$Karşıtlık$o$, $o$Kişileştirme$o$], 3, $e$1. Dağlar insan gibi uyuyor. İnsana özgü özelliğin dağa verilmesi kişileştirmedir.

Diğer şıklar: **A** benzetme öğesi aramak / **B** aşırılık aramak / **C** zıt kavram aramak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$"Yüzü ay gibi parlıyordu." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Kişileştirme$o$, $o$Benzetme$o$, $o$Konuşturma$o$, $o$Ad aktarması$o$], 1, $e$1. Yüz (benzeyen) ay (benzetilen) ile "gibi" edatıyla benzetilmiştir.

Diğer şıklar: **A** benzetmeyi kişileştirme sanmak / **C** konuşma aramak / **D** ad aktarmasını sanmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$"Çiçekler, 'Bizi koparma!' diye yalvardı." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Konuşturma$o$, $o$Abartma$o$, $o$Karşıtlık$o$, $o$Ad aktarması$o$], 0, $e$1. Çiçeklere konuşma özelliği verildiği için konuşturma vardır. Konuşturmada kişileştirme de bulunur.

Diğer şıklar: **B** aşırılık aramak / **C** zıt kavram aramak / **D** bir adın yerine başka ad aramak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Kapıyı çaldım, bütün mahalle ayağa kalktı." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Benzetme$o$, $o$Abartma$o$, $o$Kişileştirme$o$, $o$Karşıtlık$o$], 1, $e$1. Kapı çalındığında bütün mahallenin ayağa kalkması gerçekçi değildir. Bu, abartmadır.

Diğer şıklar: **A** benzetme öğesi aramak / **C** insana özgü özellik aramak / **D** zıt kavram aramak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Gülmek kolay, ağlamak zor." ifadesinde hangi söz sanatı vardır?$q$, array[$o$Abartma$o$, $o$Benzetme$o$, $o$Karşıtlık$o$, $o$Kişileştirme$o$], 2, $e$1. Gülmek ile ağlamak, kolay ile zor zıt kavramlardır. Bu karşıtlıktır.

Diğer şıklar: **A** aşırılık aramak / **B** benzetme öğesi aramak / **D** insana özgü özellik aramak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Okulda bütün sınıf seni bekliyor." cümlesinde "sınıf" sözcüğü neyi anlatır?$q$, array[$o$Okulun binasını$o$, $o$Sınıftaki öğrencileri$o$, $o$Okulun müdürünü$o$, $o$Öğretmenlerin odasını$o$], 1, $e$1. "Sınıf" sözcüğü, içindeki öğrencilerin yerine kullanılmıştır. Bu, ad aktarmasıdır.

Diğer şıklar: **A** gerçek anlamı düşünmek / **C** farklı kişiyi düşünmek / **D** farklı yeri düşünmek.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Sabahın ilk ışıkları pencereden içeri süzüldü ve beni nazikçe uyandırdı." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Karşıtlık$o$, $o$Kişileştirme$o$, $o$Abartma$o$, $o$Konuşturma$o$], 1, $e$1. Işıkların "nazikçe uyandırması" insana özgü bir davranışı ışığa vermektir.

Diğer şıklar: **A** zıt kavram aramak / **C** aşırılık aramak / **D** konuşma aramak.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Bütün Ankara bu haberi konuşuyor." cümlesinde "Ankara" sözcüğü hangi söz sanatına örnektir?$q$, array[$o$Kişileştirme$o$, $o$Karşıtlık$o$, $o$Ad aktarması$o$, $o$Benzetme$o$], 2, $e$1. "Ankara" ile kentte yaşayan insanlar kastedilmiştir. Yerin adı, orada yaşayanların yerine kullanılmıştır.

Diğer şıklar: **A** konuşma eylemine bakmak / **B** zıt kavram aramak / **D** benzetme öğesi aramak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki dizelerin hangisinde benzetme vardır?$q$, array[$o$Gözlerin uykusuzdu bütün gece.$o$, $o$Çiçekler açtı bahçede.$o$, $o$Güneş doğdu sessizce.$o$, $o$Deniz gibi derin gözlerin var.$o$], 3, $e$1. "Gibi" edatıyla gözler denizle benzetilmiştir.

Diğer şıklar: **A** benzetme yok / **B** benzetme yok / **C** benzetme yok.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Bir bakışıyla dağları yerinden oynatırdı." ifadesinde hangi söz sanatı vardır?$q$, array[$o$Karşıtlık$o$, $o$Konuşturma$o$, $o$Abartma$o$, $o$Benzetme$o$], 2, $e$1. Bir bakışla dağları oynatmak gerçekte mümkün değildir. Bu abartılı bir anlatımdır.

Diğer şıklar: **A** zıt kavram aramak / **B** konuşma aramak / **D** benzetme öğesi aramak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Sessizce bağırıyordu yüreği." ifadesinde hangi söz sanatı vardır?$q$, array[$o$Karşıtlık$o$, $o$Abartma$o$, $o$Benzetme$o$, $o$Ad aktarması$o$], 0, $e$1. "Sessizce" ile "bağırmak" birbirine zıt anlamlıdır. Bu karşıtlıktır.

Diğer şıklar: **B** aşırılık aramak / **C** benzetme öğesi aramak / **D** ad aktarması aramak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$"Kaşları kara, gözleri kömür gibi kara olan çocuk geldi." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Benzetme$o$, $o$Abartma$o$, $o$Kişileştirme$o$, $o$Karşıtlık$o$], 0, $e$1. Gözler kömüre "gibi" edatıyla benzetilmiştir.

Diğer şıklar: **B** aşırılık aramak / **C** insana özgü özellik aramak / **D** zıt kavram aramak.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisinde kişileştirme **yoktur**?$q$, array[$o$Rüzgâr, ağaçların kulağına bir şeyler fısıldadı.$o$, $o$Güneş, bulutların arkasına saklandı.$o$, $o$Deniz, kıyıya sarılıp uyuyordu.$o$, $o$Kuşlar sabah erkenden ötmeye başladı.$o$], 3, $e$1. Kuşların ötmesi doğal bir davranıştır. Diğer cümlelerde rüzgâr, güneş ve deniz insan gibi davranır.

Diğer şıklar: **A** kişileştirme var / **B** kişileştirme var / **C** kişileştirme var.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$"Köy, bayram sabahı ayaktaydı." cümlesinde "köy" sözcüğü hangi söz sanatına örnektir?$q$, array[$o$Kişileştirme$o$, $o$Karşıtlık$o$, $o$Ad aktarması$o$, $o$Abartma$o$], 2, $e$1. "Köy" ile köyde yaşayan insanlar kastedilmiştir. Bu, ad aktarmasıdır.

Diğer şıklar: **A** ayakta olmaktan yola çıkmak / **B** zıt kavram aramak / **D** aşırılık aramak.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Vatan, çocuklarını bağrına basar." cümlesinde hangi söz sanatı vardır?$q$, array[$o$Kişileştirme$o$, $o$Benzetme$o$, $o$Karşıtlık$o$, $o$Abartma$o$], 0, $e$1. Vatana insana özgü bir davranış (bağrına basmak) verilmiştir.

Diğer şıklar: **B** benzetme öğesi aramak / **C** zıt kavram aramak / **D** aşırılık aramak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi konuşturmaya örnektir?$q$, array[$o$Ağaçlar rüzgârla sallanıyordu.$o$, $o$Ağaç kocaman bir dev gibiydi.$o$, $o$Ağaç sessizce büyüdü.$o$, $o$Ağaç, "Beni kesme!" diye yalvardı.$o$], 3, $e$1. Ağaca konuşma özelliği verilmiştir.

Diğer şıklar: **A** kişileştirme olmayan cümle / **B** benzetme / **C** kişileştirme olmayan cümle.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Fiilimsiler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Fiilimsiler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilimsiler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde isim-fiil (mastar) vardır?$q$, array[$o$Okuyan öğrenci başarılı olur.$o$, $o$Koşarak okula yetişti.$o$, $o$Kitabı okudu.$o$, $o$Okumak insanı geliştirir.$o$], 3, $e$1. Okumak, "-mak" ekiyle yapılmış isim-fiildir ve cümlede özne görevindedir.

Diğer şıklar: **A** sıfat-fiil / **B** zarf-fiil / **C** çekimli fiil.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde sıfat-fiil vardır?$q$, array[$o$Gelince bize haber vermeyi unutma.$o$, $o$Gelen misafirleri kapıda karşıladı.$o$, $o$Gelmek zorunda kaldığı için üzüldü.$o$, $o$Dün akşam saat onda geldi.$o$], 1, $e$1. "Gelen", "-en" ekiyle yapılmış sıfat-fiildir ve "misafirleri" sözcüğünü niteler.

Diğer şıklar: **A** zarf-fiil / **C** isim-fiil / **D** çekimli fiil.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde zarf-fiil vardır?$q$, array[$o$Gülen çocuğu gördüm.$o$, $o$Gülerek içeri girdi.$o$, $o$Gülmek sağlığa iyi gelir.$o$, $o$Çok güldü.$o$], 1, $e$1. "Gülerek", "-erek" ekiyle yapılmış zarf-fiildir ve "girdi" fiilini niteler.

Diğer şıklar: **A** sıfat-fiil / **C** isim-fiil / **D** çekimli fiil.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi fiilimsi **değildir**?$q$, array[$o$yazdı$o$, $o$yazmak$o$, $o$yazan$o$, $o$yazarak$o$], 0, $e$1. "Yazdı" çekimli bir fiildir. Fiilimsiler çekimsiz fiil biçimleridir.

Diğer şıklar: **B** isim-fiil / **C** sıfat-fiil / **D** zarf-fiil.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Kitap okurken uyuyakaldı." cümlesindeki "okurken" sözcüğü hangi fiilimsidir?$q$, array[$o$İsim-fiil$o$, $o$Sıfat-fiil$o$, $o$Zarf-fiil$o$, $o$Çekimli fiil$o$], 2, $e$1. "-ken" eki zarf-fiil ekidir. Okurken, uyuyakaldı fiilini zaman bakımından niteler.

Diğer şıklar: **A** ek türünü karıştırmak / **B** ek türünü karıştırmak / **D** fiilimsiyi çekimli sanmak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Yarın gidecek yolcular hazırlansın." cümlesindeki fiilimsi aşağıdakilerden hangisidir?$q$, array[$o$hazırlansın$o$, $o$yarın$o$, $o$yolcular$o$, $o$gidecek$o$], 3, $e$1. "Gidecek" sözcüğü "-ecek" ekiyle yapılmış sıfat-fiildir ve yolcuları niteler.

Diğer şıklar: **A** çekimli fiil / **B** zaman zarfı / **C** isim.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Çocuk, anne babasını görünce sevindi." cümlesinde fiilimsi hangisidir?$q$, array[$o$görünce$o$, $o$sevindi$o$, $o$çocuk$o$, $o$babasını$o$], 0, $e$1. "Görünce", "-ince" ekiyle yapılmış zarf-fiildir ve "sevindi" fiilini zaman yönünden niteler.

Diğer şıklar: **B** çekimli fiil / **C** isim / **D** isim.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde fiilimsi **yoktur**?$q$, array[$o$Oynayan çocuklar neşeliydi.$o$, $o$Oynarken düştü.$o$, $o$Oynamak çok eğlenceli.$o$, $o$Çocuklar bahçede oynadı.$o$], 3, $e$1. "Oynadı" çekimli fiildir. Diğer cümlelerde oynayan, oynarken ve oynamak fiilimsidir.

Diğer şıklar: **A** fiilimsi var / **B** fiilimsi var / **C** fiilimsi var.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$"Gelişi güzel konuşmak sevilmez." cümlesinde "konuşmak" sözcüğü hangi görevdedir?$q$, array[$o$Nesne$o$, $o$Yüklem$o$, $o$Özne$o$, $o$Zarf tümleci$o$], 2, $e$1. İsim-fiil olan "konuşmak" cümlede özne görevindedir. Ne sevilmez? Konuşmak.

Diğer şıklar: **A** göreve karıştırmak / **B** göreve karıştırmak / **D** göreve karıştırmak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde sıfat-fiil, bir isim gibi kullanılmıştır?$q$, array[$o$Gelen mektubu okudu.$o$, $o$Gelen misafir hoş karşılandı.$o$, $o$Gelenler hep birlikte yemek yedi.$o$, $o$Gelecek hafta tatil başlıyor.$o$], 2, $e$1. "Gelenler" sıfat-fiil ek aldığı ve isim gibi kullanıldığı için adlaşmış sıfat-fiildir.

Diğer şıklar: **A** isim niteleyen sıfat-fiil / **B** isim niteleyen sıfat-fiil / **D** isim niteleyen sıfat-fiil.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Bu yolu geçerken dikkatli ol!" cümlesindeki "geçerken" fiilimsisi ile aşağıdakilerden hangisindeki fiilimsi aynı türdedir?$q$, array[$o$Koşan çocuk yoruldu.$o$, $o$Eve dönünce telefon etti.$o$, $o$Okumak güzel bir alışkanlık.$o$, $o$Aldığı kitabı verdi.$o$], 1, $e$1. "Geçerken" zarf-fiildir. "Dönünce" de zarf-fiildir.

Diğer şıklar: **A** sıfat-fiil / **C** isim-fiil / **D** sıfat-fiil.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde altı çizili sözcük fiilimsi **değildir**?$q$, array[$o$Bahçede **oynadılar**.$o$, $o$**Oynayarak** vakit geçirdiler.$o$, $o$**Oynamak** için dışarı çıktılar.$o$, $o$**Oynayan** çocukları izledi.$o$], 0, $e$1. "Oynadılar" çekimli fiildir (yüklem). Diğerleri "-arak", "-mak" ve "-an" ekleriyle yapılmış fiilimsilerdir.

Diğer şıklar: **B** fiilimsi / **C** fiilimsi / **D** fiilimsi.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Çalışarak kazanılan para, en tatlı paradır." cümlesinde kaç fiilimsi vardır?$q$, array[$o$Bir$o$, $o$Üç$o$, $o$Hiç yok$o$, $o$İki$o$], 3, $e$1. "Çalışarak" zarf-fiil, "kazanılan" sıfat-fiildir. İki fiilimsi vardır.

Diğer şıklar: **A** sayıyı eksik saymak / **B** sayıyı fazla saymak / **C** fiilimsileri görememek.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "-ma/-me" eki isim-fiil yapmıştır?$q$, array[$o$Gülmesi herkesi mutlu etti.$o$, $o$Kapıyı sertçe kapatma!$o$, $o$Bu konuda hiç konuşma!$o$, $o$Dışarı hiç çıkmadı.$o$], 0, $e$1. "Gülmesi", gülmek fiilinden "-me" ekiyle yapılmış isim-fiildir. Diğer cümlelerde -ma/-me olumsuzluk ekidir.

Diğer şıklar: **B** olumsuzluk eki / **C** olumsuzluk eki / **D** olumsuzluk eki.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Sevinçle koşarak yanıma geldi." cümlesinde fiilimsi hangisidir?$q$, array[$o$geldi$o$, $o$koşarak$o$, $o$sevinçle$o$, $o$yanıma$o$], 1, $e$1. "Koşarak", "-arak" ekiyle yapılmış zarf-fiildir.

Diğer şıklar: **A** çekimli fiil / **C** isim / **D** isim.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Aşağıdaki fiilimsilerden hangisi sıfat-fiildir?$q$, array[$o$açarak$o$, $o$açmak$o$, $o$açan$o$, $o$açınca$o$], 2, $e$1. "-an" eki sıfat-fiil ekidir. "Açan çiçekler" gibi bir isim niteler.

Diğer şıklar: **A** zarf-fiil / **B** isim-fiil / **D** zarf-fiil.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Cümlenin Ögeleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Cümlenin Ögeleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlenin Ögeleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$"Ali, kitabı masaya koydu." cümlesinin yüklemi aşağıdakilerden hangisidir?$q$, array[$o$Ali$o$, $o$koydu$o$, $o$kitabı$o$, $o$masaya$o$], 1, $e$1. Yüklem, cümlede yargı bildiren ögedir. Cümleye "ne yaptı?" sorusu sorulur: koydu.

Diğer şıklar: **A** özneyi yüklem sanmak / **C** nesneyi yüklem sanmak / **D** dolaylı tümleci yüklem sanmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$"Dün akşam çocuklar parkta oynadı." cümlesinin öznesi aşağıdakilerden hangisidir?$q$, array[$o$dün akşam$o$, $o$parkta$o$, $o$çocuklar$o$, $o$oynadı$o$], 2, $e$1. Özne, yüklemi yapan varlıktır. Yüklem "oynadı" sorusuna "kim oynadı?" diye sorarsak cevap çocuklardır.

Diğer şıklar: **A** zarf tümlecini özne sanmak / **B** dolaylı tümleci özne sanmak / **D** yüklemi özne sanmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$"Ayşe, resmi duvara astı." cümlesinde altı çizili **resmi** sözcüğü hangi ögedir?$q$, array[$o$Belirtili nesne$o$, $o$Belirtisiz nesne$o$, $o$Dolaylı tümleç$o$, $o$Özne$o$], 0, $e$1. Yüklem "astı" fiiline "neyi?" sorusunu sorarız: resmi. -i ekiyle belirtilmiş olduğu için belirtili nesnedir.

Diğer şıklar: **B** ek almamış nesne sanmak / **C** yer bildirdiğini sanmak / **D** özneyle karıştırmak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Annem yemek pişirdi." cümlesinde altı çizili **yemek** sözcüğü hangi ögedir?$q$, array[$o$Belirtisiz nesne$o$, $o$Belirtili nesne$o$, $o$Özne$o$, $o$Zarf tümleci$o$], 0, $e$1. "Ne pişirdi?" sorusunun cevabı yemektir. Hal eki almadığı için belirtisiz nesnedir.

Diğer şıklar: **B** ek almadığını fark etmemek / **C** özneyle karıştırmak / **D** zarf tümleciyle karıştırmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Kitabı arkadaşıma verdim." cümlesinde dolaylı tümleç hangisidir?$q$, array[$o$kitabı$o$, $o$verdim$o$, $o$Dolaylı tümleç yoktur$o$, $o$arkadaşıma$o$], 3, $e$1. Dolaylı tümleç, yönelme (-e), bulunma (-de) ve ayrılma (-den) hâl ekleriyle kurulur. "Kime verdim?" sorusunun cevabı arkadaşıma.

Diğer şıklar: **A** nesneyi dolaylı tümleç sanmak / **B** yüklemi dolaylı tümleç sanmak / **C** ögeyi görmemek.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Çocuk hızlıca koştu." cümlesinde **hızlıca** sözcüğü hangi ögedir?$q$, array[$o$Nesne$o$, $o$Dolaylı tümleç$o$, $o$Zarf tümleci$o$, $o$Özne$o$], 2, $e$1. "Nasıl koştu?" sorusunun cevabı hızlıca. Eylemin nasıl yapıldığını bildiren öge zarf tümlecidir.

Diğer şıklar: **A** ögeyi karıştırmak / **B** ögeyi karıştırmak / **D** ögeyi karıştırmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Eve gittim." cümlesinin öznesi aşağıdakilerden hangisidir?$q$, array[$o$Eve$o$, $o$Gizli özne (ben)$o$, $o$Gittim$o$, $o$Özne yoktur$o$], 1, $e$1. "Gittim" fiilinin kişi eki "-im" öznenin "ben" olduğunu gösterir. Özne cümlede yazılmadığı için gizli öznedir.

Diğer şıklar: **A** dolaylı tümleci özne sanmak / **C** yüklemi özne sanmak / **D** gizli özneyi görmemek.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Bu ödev çok zor." cümlesinin yüklemi aşağıdakilerden hangisidir?$q$, array[$o$ödev$o$, $o$zor$o$, $o$çok$o$, $o$bu$o$], 1, $e$1. İsim cümlelerinde yüklem isim soylu bir sözcüktür. Cümlenin yargısı "zor" sözcüğünde toplanır.

Diğer şıklar: **A** özneyi yüklem sanmak / **C** zarfı yüklem sanmak / **D** belirteci yüklem sanmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$"Ali'ye bir hediye aldım." cümlesindeki ögeler aşağıdakilerden hangisinde doğru verilmiştir?$q$, array[$o$Ali'ye: nesne, hediye: dolaylı tümleç$o$, $o$Ali'ye: özne, hediye: nesne$o$, $o$Ali'ye: dolaylı tümleç, hediye: nesne$o$, $o$Ali'ye: zarf tümleci, hediye: özne$o$], 2, $e$1. "Kime aldım?" Ali'ye, dolaylı tümleç. "Ne aldım?" Hediye, belirtisiz nesne.

Diğer şıklar: **A** ögeleri ters kurmak / **B** özneyi yanlış belirlemek / **D** ögeleri yanlış belirlemek.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Çocuk, okula sabah gitti." cümlesinde **sabah** sözcüğü hangi ögedir?$q$, array[$o$Dolaylı tümleç$o$, $o$Belirtisiz nesne$o$, $o$Özne$o$, $o$Zarf tümleci$o$], 3, $e$1. "Ne zaman gitti?" sorusunun cevabı sabah. Zaman bildiren bu öge zarf tümlecidir.

Diğer şıklar: **A** zaman bildirmesini dolaylı tümleç sanmak / **B** nesneyle karıştırmak / **C** özneyle karıştırmak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Kapı açıldı." cümlesinde özne hangisidir?$q$, array[$o$Açıldı$o$, $o$Gizli özne$o$, $o$Özne yoktur$o$, $o$Kapı$o$], 3, $e$1. "Ne açıldı?" sorusunun cevabı kapıdır. Fiil edilgen olsa bile cümlenin öznesi kapıdır (gerçek özne olmasa da).

Diğer şıklar: **A** yüklemi özne sanmak / **B** gizli özne aramak / **C** özneyi görmemek.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde belirtisiz nesne vardır?$q$, array[$o$Çocuk kitabı okuyor.$o$, $o$Çocuk kitap okuyor.$o$, $o$Çocuk kitaba baktı.$o$, $o$Çocuk kitaptan sıkıldı.$o$], 1, $e$1. "Kitap" sözcüğü hâl eki almamıştır. "Ne okuyor?" sorusunun cevabı belirtisiz nesnedir.

Diğer şıklar: **A** belirtili nesne / **C** dolaylı tümleç / **D** dolaylı tümleç.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Annem bana yeni bir defter aldı." cümlesinde kaç öge vardır?$q$, array[$o$Dört$o$, $o$Üç$o$, $o$İki$o$, $o$Beş$o$], 0, $e$1. Özne annem, dolaylı tümleç bana, nesne yeni bir defter, yüklem aldı. Dört öge vardır.

Diğer şıklar: **B** ögeyi eksik saymak / **C** ögeyi eksik saymak / **D** ögeyi fazla saymak.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde dolaylı tümleç **yoktur**?$q$, array[$o$Kitabı kütüphaneye götürdü.$o$, $o$Yarın İzmir'den gelecek.$o$, $o$Bütün gün evde çalıştı.$o$, $o$Çocuk neşeyle şarkı söyledi.$o$], 3, $e$1. Dolaylı tümleç, -e, -de, -den hâl eklerini alan ögedir. İlk cümlede bu ekler yoktur, "neşeyle" zarf tümlecidir.

Diğer şıklar: **A** dolaylı tümleç var / **B** dolaylı tümleç var / **C** dolaylı tümleç var.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Öğretmen öğrencilere ödev verdi." cümlesinin nesnesi aşağıdakilerden hangisidir?$q$, array[$o$öğrencilere$o$, $o$öğretmen$o$, $o$ödev$o$, $o$verdi$o$], 2, $e$1. "Ne verdi?" sorusunun cevabı ödevdir.

Diğer şıklar: **A** dolaylı tümleci nesne sanmak / **B** özneyi nesne sanmak / **D** yüklemi nesne sanmak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Akşam yemeğinden sonra parka yürüdük." cümlesinde yüklem aşağıdakilerden hangisidir?$q$, array[$o$yürüdük$o$, $o$parka$o$, $o$sonra$o$, $o$yemeğinden$o$], 0, $e$1. Yüklem cümlenin sonunda bulunan "yürüdük" fiilidir.

Diğer şıklar: **B** dolaylı tümleci yüklem sanmak / **C** zaman ögesini yüklem sanmak / **D** ögeyi yüklem sanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Fiilde Çatı konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Fiilde Çatı konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilde Çatı$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$"Çocuk topu attı." cümlesindeki fiil, öznesine göre hangi çatıdadır?$q$, array[$o$Edilgen$o$, $o$Dönüşlü$o$, $o$Etken$o$, $o$İşteş$o$], 2, $e$1. Eylemi yapan özne (çocuk) bellidir. Öznesi eylemi yapan fiiller etken çatılıdır.

Diğer şıklar: **A** çatıyı karıştırmak / **B** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$"Kapı açıldı." cümlesindeki fiil, öznesine göre hangi çatıdadır?$q$, array[$o$Edilgen$o$, $o$Etken$o$, $o$Dönüşlü$o$, $o$İşteş$o$], 0, $e$1. Eylemi yapanı belli olmayan, öznesi eylemden etkilenen fiiller edilgendir. "-ıl" eki edilgenlik ekidir.

Diğer şıklar: **B** çatıyı karıştırmak / **C** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$"Çocuk yüzünü yıkadı." cümlesindeki "yıkadı" fiili hangi çatıdadır?$q$, array[$o$Dönüşlü$o$, $o$Edilgen$o$, $o$Etken$o$, $o$İşteş$o$], 2, $e$1. Özne yüzünü yıkıyor, ancak fiil dönüşlü ek (-n) almadığı için etkendir.

Diğer şıklar: **A** dönüşlü sanmak / **B** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Ayşe, aynanın karşısında süslendi." cümlesindeki fiil hangi çatıdadır?$q$, array[$o$Dönüşlü$o$, $o$Etken$o$, $o$Edilgen$o$, $o$İşteş$o$], 0, $e$1. Dönüşlü çatıda eylemi yapan özne, eylemden kendisi etkilenir. "-n" eki dönüşlülük ekidir: süslendi.

Diğer şıklar: **B** çatıyı karıştırmak / **C** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki fiillerden hangisi dönüşlü çatılıdır?$q$, array[$o$giydi$o$, $o$giydirdi$o$, $o$giyildi$o$, $o$giyindi$o$], 3, $e$1. "Giyindi" fiilinde "-in" dönüşlülük eki vardır. Özne kendi kendine giydiğinden dönüşlüdür.

Diğer şıklar: **A** etken fiil / **B** ettirgen fiil / **C** edilgen fiil.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Arkadaşlar yarışmada yarıştı." cümlesinde fiil hangi çatıdadır?$q$, array[$o$Etken$o$, $o$İşteş$o$, $o$Edilgen$o$, $o$Dönüşlü$o$], 1, $e$1. İşteş çatıda eylem birden çok özne tarafından karşılıklı ya da birlikte yapılır. "-ış" eki işteşlik ekidir.

Diğer şıklar: **A** çatıyı karıştırmak / **C** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde fiil geçişlidir?$q$, array[$o$Çocuk uyudu.$o$, $o$Çocuk geldi.$o$, $o$Çocuk kitabı okudu.$o$, $o$Çocuk güldü.$o$], 2, $e$1. Geçişli fiiller nesne alabilir. "Neyi okudu?" sorusuna cevap vardır.

Diğer şıklar: **A** geçişsiz fiil / **B** geçişsiz fiil / **D** geçişsiz fiil.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde fiil geçişsizdir?$q$, array[$o$Çocuk resmi çizdi.$o$, $o$Annem çorbayı pişirdi.$o$, $o$Ali kapıyı kapattı.$o$, $o$Kuşlar uçtu.$o$], 3, $e$1. Geçişsiz fiiller nesne almaz. "Uçtu" fiiline "neyi?" sorulamaz.

Diğer şıklar: **A** geçişli fiil / **B** geçişli fiil / **C** geçişli fiil.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde fiil ettirgendir?$q$, array[$o$Ben çorbayı sıcak sıcak içtim.$o$, $o$Çorba sofrada hemen içildi.$o$, $o$Çorba tezgâhta çabucak soğudu.$o$, $o$Annem bana çorba içirdi.$o$], 3, $e$1. Ettirgen fiillerde eylemi özne başkasına yaptırır. "-ir" eki ettirgenlik ekidir: içirdi.

Diğer şıklar: **A** etken fiil / **B** edilgen fiil / **C** geçişsiz fiil.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerden hangisinde edilgen çatılı bir fiil kullanılmıştır?$q$, array[$o$Kitaplar masaya konuldu.$o$, $o$Kitapları masaya koydu.$o$, $o$Kitaplar rafta duruyor.$o$, $o$Kitaplarla uğraşıyor.$o$], 0, $e$1. "Konuldu" fiilinde edilgenlik eki "-ul" vardır ve eylemi yapan belli değildir.

Diğer şıklar: **B** etken fiil / **C** geçişsiz etken / **D** geçişsiz etken.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Çocuklar parkta koşuştu." cümlesinde fiil hangi çatıdadır?$q$, array[$o$Etken$o$, $o$Dönüşlü$o$, $o$Edilgen$o$, $o$İşteş$o$], 3, $e$1. "Koşuştu" fiili "-ış" eki aldığı ve birden çok kişi tarafından yapıldığı için işteştir.

Diğer şıklar: **A** ek türünü kaçırmak / **B** ek türünü kaçırmak / **C** ek türünü kaçırmak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde fiil hem geçişli hem edilgen çatılıdır?$q$, array[$o$Mektup yazdı.$o$, $o$Mektup geldi.$o$, $o$Mektup yazıldı.$o$, $o$Mektup bekledi.$o$], 2, $e$1. "Yazıldı" fiili geçişli bir fiilden (yazmak) türemiş edilgen çatılı fiildir.

Diğer şıklar: **A** etken fiil / **B** geçişsiz etken fiil / **D** etken fiil.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Annem, çocuğa elbise giydirdi." cümlesindeki fiil hangi çatıdadır?$q$, array[$o$Dönüşlü$o$, $o$Ettirgen$o$, $o$İşteş$o$, $o$Edilgen$o$], 1, $e$1. "Giydirdi" fiilinde "-dir" ettirgenlik eki vardır. Eylemi yapan özne, başkasına yaptırır.

Diğer şıklar: **A** çatıyı karıştırmak / **C** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi geçişsiz fiilden geçişli fiil yapma örneğidir?$q$, array[$o$uyumak - uyutmak$o$, $o$yazmak - yazılmak$o$, $o$yıkamak - yıkanmak$o$, $o$bakmak - bakışmak$o$], 0, $e$1. "Uyumak" geçişsizdir, "uyutmak" ettirgenlik eki alarak geçişli olmuştur.

Diğer şıklar: **B** edilgen yapma / **C** dönüşlü yapma / **D** işteş yapma.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Çocuklar kapıda karşılaştı." cümlesinde fiil hangi çatıdadır?$q$, array[$o$Etken$o$, $o$İşteş$o$, $o$Edilgen$o$, $o$Dönüşlü$o$], 1, $e$1. "Karşılaştı" fiilinde "-ış" işteşlik eki vardır.

Diğer şıklar: **A** çatıyı karıştırmak / **C** çatıyı karıştırmak / **D** çatıyı karıştırmak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Aşağıdaki fiillerden hangisi ettirgen çatılıdır?$q$, array[$o$yaptı$o$, $o$yaptırdı$o$, $o$yapıldı$o$, $o$yapışmak$o$], 1, $e$1. "-dır" eki ettirgenlik eki olduğu için "yaptırdı" ettirgen fiildir.

Diğer şıklar: **A** etken fiil / **C** edilgen fiil / **D** işteş.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Cümle Türleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Cümle Türleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümle Türleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$"Çocuklar bahçede oynuyor." cümlesi yapısına göre hangi türdendir?$q$, array[$o$Birleşik cümle$o$, $o$Sıralı cümle$o$, $o$Bağlı cümle$o$, $o$Basit cümle$o$], 3, $e$1. Tek yüklemi (oynuyor) olan ve yan cümlecik içermeyen cümleler basit cümledir.

Diğer şıklar: **A** yan yükleme bakmamak / **B** yüklem sayısını karıştırmak / **C** bağlaç aramak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$"Hava soğuk olduğu için montumu giydim." cümlesi yapısına göre hangi türdendir?$q$, array[$o$Basit cümle$o$, $o$Birleşik cümle$o$, $o$Sıralı cümle$o$, $o$Bağlı cümle$o$], 1, $e$1. "Olduğu" fiilimsi içeren yan cümlecik, birleşik cümle yapar.

Diğer şıklar: **A** fiilimsi aramak / **C** virgülle bağlı cümle aramak / **D** bağlaç aramak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$"Geldi, gördü, yendi." cümlesi yapısına göre hangi türdendir?$q$, array[$o$Basit cümle$o$, $o$Birleşik cümle$o$, $o$Bağlı cümle$o$, $o$Sıralı cümle$o$], 3, $e$1. Birden çok yargının virgül ya da noktalı virgülle sıralandığı cümleler sıralı cümledir.

Diğer şıklar: **A** tek yüklem sanmak / **B** fiilimsi aramak / **C** bağlaç aramak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Yağmur yağıyor ama biz dışarı çıkacağız." cümlesi yapısına göre hangi türdendir?$q$, array[$o$Basit cümle$o$, $o$Bağlı cümle$o$, $o$Birleşik cümle$o$, $o$Sıralı cümle$o$], 1, $e$1. Cümleler "ama" bağlacıyla bağlandığı için bağlı cümledir.

Diğer şıklar: **A** tek yüklem sanmak / **C** fiilimsi aramak / **D** virgülle sıralama aramak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Bu kitap çok ilginç." cümlesinin yüklemi isim mi, fiil mi?$q$, array[$o$Fiil, çünkü yüklem "kitap" sözcüğüdür.$o$, $o$İsim, çünkü yüklem "çok" sözcüğüdür.$o$, $o$Fiil, çünkü yüklem "bu" sözcüğüdür.$o$, $o$İsim, çünkü yüklem "ilginç" sözcüğüdür.$o$], 3, $e$1. Yüklem "ilginç" sıfatı olduğu için isim cümlesidir.

Diğer şıklar: **A** yüklemi yanlış belirlemek / **B** yüklemi yanlış belirlemek / **C** yüklemi yanlış belirlemek.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Kapıyı yavaşça açtı." cümlesi yüklemin türüne göre hangi çeşittir?$q$, array[$o$İsim cümlesi$o$, $o$Fiil cümlesi$o$, $o$Devrik cümle$o$, $o$Soru cümlesi$o$], 1, $e$1. Yüklemi (açtı) fiil olduğu için fiil cümlesidir.

Diğer şıklar: **A** yüklemi yanlış belirlemek / **C** yer farkını karıştırmak / **D** anlam farkını karıştırmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$"Geldi bahçeye çocuklar." cümlesi yüklemin yerine göre hangi türdendir?$q$, array[$o$Devrik cümle$o$, $o$Kurallı cümle$o$, $o$İsim cümlesi$o$, $o$Soru cümlesi$o$], 0, $e$1. Yüklem cümlenin sonunda değil, başta olduğu için devrik cümledir.

Diğer şıklar: **B** yüklem yerini görmemek / **C** yüklem türünü karıştırmak / **D** anlam türünü karıştırmak.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Bu işi sen yapmalısın." cümlesi yüklemin yerine göre hangi türdendir?$q$, array[$o$Devrik cümle$o$, $o$Sıralı cümle$o$, $o$Kurallı cümle$o$, $o$Soru cümlesi$o$], 2, $e$1. Yüklem (yapmalısın) sonda olduğu için kurallı cümledir.

Diğer şıklar: **A** yüklem yerini karıştırmak / **B** yapı türünü karıştırmak / **D** anlam türünü karıştırmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$"Sen de bizimle gelir misin?" cümlesi anlamına göre hangi türdendir?$q$, array[$o$Ünlem cümlesi$o$, $o$Olumsuz cümle$o$, $o$Emir cümlesi$o$, $o$Soru cümlesi$o$], 3, $e$1. "Mi" soru eki ve soru işareti cümleyi soru cümlesi yapar.

Diğer şıklar: **A** tür karıştırmak / **B** tür karıştırmak / **C** tür karıştırmak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Yarın tatile çıkacağımız için bavullarımızı hazırladık." cümlesi hangi türdendir?$q$, array[$o$Birleşik cümle$o$, $o$Basit cümle$o$, $o$Sıralı cümle$o$, $o$Bağlı cümle$o$], 0, $e$1. "Çıkacağımız" fiilimsi olduğu için cümle birleşiktir.

Diğer şıklar: **B** fiilimsiyi görmemek / **C** virgül aramak / **D** bağlaç aramak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisi hem isim cümlesidir hem de kurallıdır?$q$, array[$o$Bu çiçekler çok güzel.$o$, $o$Güzel bu çiçekler.$o$, $o$Çiçekleri suladı.$o$, $o$Çiçekleri kim suladı?$o$], 0, $e$1. "Güzel" yüklemi isimdir ve cümlenin sonundadır. Diğerleri devrik ya da fiil cümlesidir.

Diğer şıklar: **B** devrik isim cümlesi / **C** fiil cümlesi / **D** fiil cümlesi, soru.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$"Ne güzel bir gün!" cümlesi anlamına göre hangi türdendir?$q$, array[$o$Soru cümlesi$o$, $o$Emir cümlesi$o$, $o$Ünlem cümlesi$o$, $o$Olumsuz cümle$o$], 2, $e$1. Şaşkınlık ve duygu belirtmek için kurulan cümleler ünlem cümlesidir.

Diğer şıklar: **A** tür karıştırmak / **B** tür karıştırmak / **D** tür karıştırmak.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Gelirsen sevinirim, gelmezsen üzülürüm." cümlesi yapısına göre hangi türdendir?$q$, array[$o$Basit cümle$o$, $o$Sıralı cümle$o$, $o$Birleşik cümle$o$, $o$Bağlı cümle$o$], 1, $e$1. Cümleler virgülle sıralanmıştır. Birden fazla yargı virgülle birbirine bağlanmıştır.

Diğer şıklar: **A** yüklem sayısını görmemek / **C** fiilimsi aramak / **D** bağlaç aramak.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdakilerden hangisi hem fiil cümlesi hem de devrik cümledir?$q$, array[$o$Otobüse yetişti.$o$, $o$Otobüs çok kalabalıktı.$o$, $o$Yetişti nihayet otobüse.$o$, $o$Kalabalıktı otobüs.$o$], 2, $e$1. Yüklem (yetişti) başta olduğu için devrik, fiil olduğu için fiil cümlesidir.

Diğer şıklar: **A** kurallı fiil cümlesi / **B** kurallı isim cümlesi / **D** devrik isim cümlesi.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Çok çalıştı ama sınavı kazanamadı." cümlesinde anlam bakımından aşağıdakilerden hangisi doğrudur?$q$, array[$o$Soru cümlesidir.$o$, $o$Emir cümlesidir.$o$, $o$Olumsuz yargı içerir.$o$, $o$Ünlem cümlesidir.$o$], 2, $e$1. "Kazanamadı" fiili olumsuzdur.

Diğer şıklar: **A** tür karıştırmak / **B** tür karıştırmak / **D** tür karıştırmak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Lütfen sessiz olun." cümlesi anlamına göre hangi türdendir?$q$, array[$o$Emir cümlesi$o$, $o$Soru cümlesi$o$, $o$Ünlem cümlesi$o$, $o$Olumsuz cümle$o$], 0, $e$1. Yapılması istenen bir işi bildirdiği için emir cümlesidir.

Diğer şıklar: **B** tür karıştırmak / **C** tür karıştırmak / **D** tür karıştırmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Yazım Kuralları konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Yazım Kuralları konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Yazım Kuralları$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "de" doğru yazılmıştır?$q$, array[$o$Sende bizimle gel.$o$, $o$Okul da çalıştım.$o$, $o$Sen de bizimle gel.$o$, $o$Eve de dönünce haber ver.$o$], 2, $e$1. Bağlaç olan "de" ayrı yazılır: sen de.
2. Bulunma hâl eki "-de" ise bitişik yazılır: okulda.

Diğer şıklar: **A** bağlaç olan de'yi bitişik yazmak / **B** bulunma ekini ayrı yazmak / **D** bağlaç ve ek karışıklığı.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde soru eki "mi" doğru yazılmıştır?$q$, array[$o$Yarın okula gelecekmisin?$o$, $o$Yarın okula gelecek mi sin?$o$, $o$Yarın okula gelecek mısın?$o$, $o$Yarın okula gelecek misin?$o$], 3, $e$1. "Mi" soru eki ayrı yazılır. Kişi ekleri soru ekine bitişik yazılır: misin.

Diğer şıklar: **A** soru ekini bitişik yazmak / **B** soru ekini kişi ekinden ayırmak / **C** ünlü uyumuna aykırı yazmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde büyük harf kullanımı **yanlıştır**?$q$, array[$o$Ali, ankara'da okuyor.$o$, $o$Ali Ankara'da okuyor.$o$, $o$Ankara, Türkiye'nin başkentidir.$o$, $o$Ayşe İzmir'e gitti.$o$], 0, $e$1. Özel adlar (kişi, şehir, ülke adları) büyük harfle başlar. "ankara" küçük yazılmıştır.

Diğer şıklar: **B** doğru kullanım / **C** doğru kullanım / **D** doğru kullanım.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi doğru yazılmıştır?$q$, array[$o$herkez$o$, $o$herkes$o$, $o$yanlız$o$, $o$şöför$o$], 1, $e$1. Doğru yazımlar: herkes, yalnız, şoför.

Diğer şıklar: **A** s yerine z yazmak / **C** yanlış yazım / **D** yanlış yazım.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "ki" bağlacı doğru yazılmıştır?$q$, array[$o$Öyle yorgundumki hemen uyudum.$o$, $o$Sanırımki yarın yağmur yağacak.$o$, $o$Öyle yorgundum ki hemen uyudum.$o$, $o$Bilirsinki beni çok üzdü.$o$], 2, $e$1. Bağlaç olan "ki" ayrı yazılır.

Diğer şıklar: **A** bağlacı bitişik yazmak / **B** bağlacı bitişik yazmak / **D** bağlacı bitişik yazmak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde yazım yanlışı vardır?$q$, array[$o$Benimki kırmızı, seninki mavi.$o$, $o$Evdeki çocuk bahçeye çıktı.$o$, $o$Bu iş senin ki gibi kolay değil.$o$, $o$Duvardaki saat bozulmuş.$o$], 2, $e$1. Aitlik bildiren "-ki" eki bitişik yazılır: seninki. "Senin ki" yazımı yanlıştır.

Diğer şıklar: **A** doğru yazım / **B** doğru yazım / **D** doğru yazım.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde kesme işareti yanlış kullanılmıştır?$q$, array[$o$Ali'nin kalemi düştü.$o$, $o$Ankara'lı çocuklar bugün geldi.$o$, $o$Türkiye'nin başkenti Ankara'dır.$o$, $o$Ayşe'ye mektup yazdı.$o$], 1, $e$1. Yapım eki (-lı) kesmeyle ayrılmaz: Ankaralı. Diğer cümlelerde çekim ekleri kesmeyle ayrılmıştır.

Diğer şıklar: **A** doğru kullanım / **C** doğru kullanım / **D** doğru kullanım.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "için" sözcüğü doğru yazılmıştır?$q$, array[$o$Seninçin bir hediye aldım.$o$, $o$Senin-için bir hediye aldım.$o$, $o$Seninicin bir hediye aldım.$o$, $o$Senin için bir hediye aldım.$o$], 3, $e$1. "İçin" edatı kendisinden önceki sözcükten ayrı yazılır.

Diğer şıklar: **A** kısaltılmış yazım / **B** tire kullanmak / **C** bitişik yazmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi doğru yazılmıştır?$q$, array[$o$kitapçı$o$, $o$kitabçı$o$, $o$kitapcı$o$, $o$kitabcı$o$], 0, $e$1. "Kitap" sözcüğüne "-cı" eki gelince sert ünsüzden dolayı "-çı" olur: kitapçı.

Diğer şıklar: **B** ünsüz benzeşmesini unutmak / **C** ünsüz benzeşmesini unutmak / **D** ünsüz benzeşmesini unutmak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisinin yazımı **yanlıştır**?$q$, array[$o$hafta sonu$o$, $o$hergün$o$, $o$her şey$o$, $o$akşam yemeği$o$], 1, $e$1. "Her gün" ayrı yazılır. Diğer sözcükler doğru yazılmıştır.

Diğer şıklar: **A** doğru yazım / **C** doğru yazım / **D** doğru yazım.$e$, 2),
  (11, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde yazım yanlışı **yoktur**?$q$, array[$o$Ben de geleceğim ama annem gelmiyor.$o$, $o$Bende geleceğim ama annem gelmiyor.$o$, $o$Ben de geleceğim ama annem gelmiyor$o$, $o$Ben de gelecegim ama annem gelmiyor.$o$], 0, $e$1. Bağlaç "de" ayrı yazılır ve cümle noktayla biter. "Geleceğim" sözcüğü de doğru yazılmıştır.

Diğer şıklar: **B** bağlaç de'yi bitişik yazmak / **C** noktalama eksik / **D** ğ harfini yanlış yazmak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde soru eki doğru yazılmıştır?$q$, array[$o$Bu kitabı okudunmu?$o$, $o$Bu kitabı okudun mı?$o$, $o$Bu kitabı okudun mü?$o$, $o$Bu kitabı okudun mu?$o$], 3, $e$1. Soru eki ayrı yazılır ve ünlü uyumuna uyar. "Okudun" sözcüğündeki son ünlü u olduğu için "mu" yazılır.

Diğer şıklar: **A** soru ekini bitişik yazmak / **B** ünlü uyumuna aykırı yazmak / **C** ünlü uyumuna aykırı yazmak.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde büyük harf kullanımı doğrudur?$q$, array[$o$Ben Ankara'da yaşıyorum.$o$, $o$Ben ankara'da oturuyorum.$o$, $o$Ben Okuldan yeni çıktım.$o$, $o$ben Konya'da yaşıyorum.$o$], 0, $e$1. Cümle başı ve özel adlar büyük harfle başlar. Ortak adlar (okul gibi) küçük yazılır.

Diğer şıklar: **B** özel adı küçük yazmak / **C** ortak adı büyük yazmak / **D** cümle başını küçük yazmak.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde kesme işareti doğru kullanılmıştır?$q$, array[$o$Mehmetin'kalemi çok güzel.$o$, $o$Mehmet'in' kalemi çok güzel.$o$, $o$Mehmet'in kalemi çok güzel.$o$, $o$Mehmet in kalemi çok güzel.$o$], 2, $e$1. Özel adlara gelen ekler kesmeyle ayrılır: Mehmet'in.

Diğer şıklar: **A** kesmeyi yanlış yere koymak / **B** gereksiz kesme kullanmak / **D** eki ayrı yazmak.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde "ile" doğru yazılmıştır?$q$, array[$o$Aliile Veli geldi.$o$, $o$Ali-ile Veli geldi.$o$, $o$Ali ileVeli geldi.$o$, $o$Ali ile Veli geldi.$o$], 3, $e$1. "İle" sözcüğü ayrı yazılır: Ali ile Veli.

Diğer şıklar: **A** bitişik yazmak / **B** tire kullanmak / **C** bitişik yazmak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Aşağıdaki sözcüklerden hangisi doğru yazılmıştır?$q$, array[$o$bir çok$o$, $o$birçok$o$, $o$bir-çok$o$, $o$birçok'$o$], 1, $e$1. "Birçok" bitişik yazılır.

Diğer şıklar: **A** ayrı yazmak / **C** tire koymak / **D** kesme kullanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Noktalama İşaretleri konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Noktalama İşaretleri konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Noktalama İşaretleri$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde virgül (,) yerinde kullanılmıştır?$q$, array[$o$Elma, armut, muz ve çilek aldım.$o$, $o$Elma armut, muz ve çilek, aldım.$o$, $o$Elma, armut muz ve çilek, aldım.$o$, $o$Elma armut muz, ve çilek aldım.$o$], 0, $e$1. Sıralanan sözcükler arasında virgül kullanılır. "Ve" bağlacından önce virgül konmaz.

Diğer şıklar: **B** gereksiz virgül / **C** gereksiz virgül / **D** gereksiz virgül.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinin sonunda soru işareti kullanılmalıdır?$q$, array[$o$Yarın okula gideceğim$o$, $o$Sen bu akşam bize gelecek misin$o$, $o$Bugün hava çok güzel$o$, $o$Kitabımı masaya bıraktım$o$], 1, $e$1. Soru anlamı taşıyan cümlelerin sonuna soru işareti konur. "Gelecek misin" soru cümlesidir.

Diğer şıklar: **A** bildirme cümlesi / **C** bildirme cümlesi / **D** bildirme cümlesi.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinin sonunda ünlem işareti kullanılmalıdır?$q$, array[$o$Ne güzel bir manzara$o$, $o$Dün akşam sinemaya gittik$o$, $o$Kitabı masaya koydum$o$, $o$Yarın yağmur yağacak mı$o$], 0, $e$1. Şaşma ve beğeni bildiren cümleler ünlemle biter.

Diğer şıklar: **B** bildirme cümlesi / **C** bildirme cümlesi / **D** soru cümlesi.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde nokta (.) yanlış kullanılmıştır?$q$, array[$o$Ali okula gitti.$o$, $o$Ali. okula gitti.$o$, $o$Dr. Ahmet Bey geldi.$o$, $o$Saat 12.30'da buluşacağız.$o$], 1, $e$1. Özne ile yüklem arasına nokta konmaz. Cümle tamamlanmadan nokta konulamaz.

Diğer şıklar: **A** doğru kullanım / **C** doğru kullanım / **D** doğru kullanım.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$"Annem bana şunları aldı ______ kalem, defter ve silgi." cümlesinde boşluğa hangi işaret gelmelidir?$q$, array[$o$Nokta (.)$o$, $o$Üç nokta (...)$o$, $o$Soru işareti (?)$o$, $o$İki nokta (:)$o$], 3, $e$1. Sıralamaya geçerken ve açıklama yaparken iki nokta kullanılır.

Diğer şıklar: **A** açıklama için yanlış işaret / **B** açıklama için yanlış işaret / **C** açıklama için yanlış işaret.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde tırnak işareti yerinde kullanılmıştır?$q$, array[$o$Atatürk, Egemenlik "kayıtsız şartsız" milletindir demiştir.$o$, $o$Atatürk, "Egemenlik kayıtsız şartsız milletindir." demiştir.$o$, $o$"Atatürk", Egemenlik kayıtsız şartsız milletindir demiştir.$o$, $o$Atatürk, Egemenlik kayıtsız şartsız milletindir "demiştir".$o$], 1, $e$1. Başkasının sözü tırnak içinde verilir.

Diğer şıklar: **A** tırnağı yanlış yere koymak / **C** tırnağı yanlış yere koymak / **D** tırnağı yanlış yere koymak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde üç nokta (...) yerinde kullanılmıştır?$q$, array[$o$Ali... okula gitti.$o$, $o$Hava... çok güzel.$o$, $o$Kitap... masanın üstünde.$o$, $o$Kapıyı açtım, sonra...$o$], 3, $e$1. Üç nokta, söylenmeden bırakılan düşünceyi ya da duraksamayı gösterir.

Diğer şıklar: **A** akışı gereksiz bölmek / **B** akışı gereksiz bölmek / **C** akışı gereksiz bölmek.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde parantez doğru kullanılmıştır?$q$, array[$o$Ankara Türkiye'nin başkenti (çok güzel) bir şehirdir.$o$, $o$Ankara çok güzel bir şehirdir (.$o$, $o$(Ankara) çok güzel bir şehir.$o$, $o$Ankara (Türkiye'nin başkenti) çok güzel bir şehirdir.$o$], 3, $e$1. Parantez açıklayıcı bilgi vermek için kullanılır.

Diğer şıklar: **A** parantezi yanlış yere koymak / **B** parantezi eksik kullanmak / **C** gereksiz parantez.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde eğik çizgi yanlış kullanılmıştır?$q$, array[$o$Kitap / kalem / defter aldım.$o$, $o$12/05/2024 tarihinde doğdum.$o$, $o$Öğrenci/veli toplantısı yapıldı.$o$, $o$Ali ve/veya Veli gelecek.$o$], 0, $e$1. Sıralamada virgül kullanılır. Eğik çizgi tarih ve seçenekleri belirtirken kullanılır.

Diğer şıklar: **B** tarihte doğru kullanım / **C** alternatif için doğru kullanım / **D** alternatif için doğru kullanım.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde virgül kullanımı **yanlıştır**?$q$, array[$o$Ali, Ahmet'in kardeşidir.$o$, $o$Gel, otur, dinlen.$o$, $o$Ben, okula gittim.$o$, $o$Hava soğuk, ama biz dışarı çıkacağız.$o$], 2, $e$1. Özne ile yüklem arasına virgül konmaz. İlk cümledeki virgül gereksizdir.

Diğer şıklar: **A** hitap virgülü / **B** sıralama virgülü / **D** bağlaç öncesi virgül.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Hey, bak buraya!" cümlesindeki virgül neden kullanılmıştır?$q$, array[$o$Sıralama yapıldığı için$o$, $o$Açıklama yapıldığı için$o$, $o$Cümle bittiği için$o$, $o$Seslenme olduğu için$o$], 3, $e$1. Seslenme sözcüğü olan "hey" cümleden virgülle ayrılır.

Diğer şıklar: **A** virgül amacını karıştırmak / **B** virgül amacını karıştırmak / **C** virgül amacını karıştırmak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde noktalama işaretleri doğru kullanılmıştır?$q$, array[$o$Annem "Yemek hazır" diye, seslendi!$o$, $o$Annem Yemek hazır, diye seslendi.$o$, $o$Annem, "Yemek hazır!" diye seslendi.$o$, $o$Annem, "Yemek hazır" diye seslendi?$o$], 2, $e$1. Doğrudan aktarılan söz tırnak içinde verilir. Ünlem işareti tırnak içinde kalır.

Diğer şıklar: **A** işaretleri yanlış yere koymak / **B** tırnak kullanmamak / **D** yanlış son işaret.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$"Şu sözcükleri öğrenmelisin ______ gözlük, çanta, defter." cümlesinde boşluğa hangi işaret konmalıdır?$q$, array[$o$Nokta (.)$o$, $o$Soru işareti (?)$o$, $o$İki nokta (:)$o$, $o$Ünlem (!)$o$], 2, $e$1. Örnekleme ya da sıralamadan önce iki nokta konur.

Diğer şıklar: **A** yanlış işaret / **B** yanlış işaret / **D** yanlış işaret.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde kısa çizgi (-) yerinde kullanılmıştır?$q$, array[$o$Ali-okula sabah erkenden gitti.$o$, $o$Ankara-İstanbul yolu kalabalık.$o$, $o$Dün-akşam birlikte sinemaya gittik.$o$, $o$Kitap-masada duruyordu bütün gün.$o$], 1, $e$1. Kısa çizgi iki yer ya da kavram arasındaki ilişkiyi gösterirken kullanılır.

Diğer şıklar: **A** gereksiz kullanım / **C** gereksiz kullanım / **D** gereksiz kullanım.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde kesme işareti yerinde kullanılmıştır?$q$, array[$o$Türkiye'nin başkenti Ankara'dır.$o$, $o$Türkiye'nin başkentiAnkara'dır.$o$, $o$Türkiyenin' başkenti Ankara'dır.$o$, $o$Türkiye nin başkenti Ankara dır.$o$], 0, $e$1. Özel adlara gelen ekler kesme işaretiyle ayrılır.

Diğer şıklar: **B** kesmeyi yanlış yere koymak / **C** kesmeyi yanlış yere koymak / **D** eki ayrı yazmak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Neden bu kadar geç geldin" cümlesinin sonuna hangi işaret konmalıdır?$q$, array[$o$Nokta (.)$o$, $o$Ünlem (!)$o$, $o$Soru işareti (?)$o$, $o$Üç nokta (...)$o$], 2, $e$1. Cümle soru anlamı taşıdığı için soru işareti konur.

Diğer şıklar: **A** anlama uygun olmayan işaret / **B** anlama uygun olmayan işaret / **D** anlama uygun olmayan işaret.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Anlatım Bozuklukları konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Anlatım Bozuklukları konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Anlatım Bozuklukları$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde gereksiz sözcük kullanımından kaynaklanan bir anlatım bozukluğu vardır?$q$, array[$o$Geri dönüp yeniden baktı.$o$, $o$Dönüp bir daha dikkatle baktı.$o$, $o$Yeniden bakmak istedi, vazgeçti.$o$, $o$Tekrar gelmemi istediğini söyledi.$o$], 0, $e$1. "Tekrar" ve "yeniden" aynı anlamdadır. Birlikte kullanılması gereksiz sözcük kullanımıdır.

Diğer şıklar: **B** doğru anlatım / **C** doğru anlatım / **D** doğru anlatım.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde anlatım bozukluğu **yoktur**?$q$, array[$o$Dün akşam arkadaşlarımla sinemaya gideceğiz.$o$, $o$Dün akşam arkadaşlarımla sinemaya gittik.$o$, $o$Akşam arkadaşlarımla sinemaya gitti.$o$, $o$Dün akşamdan yarın sinemaya gittik.$o$], 1, $e$1. Birinci cümlede zaman, özne ve yüklem uyumludur.

Diğer şıklar: **A** zaman uyumsuzluğu / **C** özne-yüklem uyumsuzluğu / **D** zaman çelişkisi.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$"Her sabah erkenden kalkar, hemen hemen dişlerini fırçalar." cümlesindeki bozukluğun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Özne-yüklem uyumsuzluğu$o$, $o$Anlam belirsizliği$o$, $o$Mantık hatası$o$, $o$Gereksiz sözcük kullanımı$o$], 3, $e$1. "Hemen hemen" ile "hemen" aynı anlamı taşıdığı için sözcük gereksiz yinelenmiştir.

Diğer şıklar: **A** bozukluk türünü karıştırmak / **B** bozukluk türünü karıştırmak / **C** bozukluk türünü karıştırmak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Sen yarın geldim." cümlesindeki bozukluk aşağıdakilerden hangisidir?$q$, array[$o$Gereksiz sözcük kullanımı$o$, $o$Anlam belirsizliği$o$, $o$Deyim yanlışı$o$, $o$Özne-yüklem uyumsuzluğu$o$], 3, $e$1. Özne "sen", yüklem "geldim" ile kişi bakımından uyumsuzdur.

Diğer şıklar: **A** bozukluk türünü karıştırmak / **B** bozukluk türünü karıştırmak / **C** bozukluk türünü karıştırmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde anlam belirsizliği vardır?$q$, array[$o$Ali dün akşam arkadaşıyla sinemaya gitti.$o$, $o$Ali, Veli'nin kardeşini görünce sevindi.$o$, $o$Ayşe yarın sabah okula gelecek.$o$, $o$Annem akşam için yemek yaptı.$o$], 1, $e$1. Cümlede "sevinen" kişi Ali mi Veli mi belli değildir.

Diğer şıklar: **A** belirsizlik yok / **C** belirsizlik yok / **D** belirsizlik yok.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$"Sağlıklı beslenmek için bol bol meyve yemeli, ama hiç sebze yememeliyiz." cümlesindeki bozukluk aşağıdakilerden hangisidir?$q$, array[$o$Zaman uyuşmazlığı$o$, $o$Özne-yüklem uyumsuzluğu$o$, $o$Çatı uyuşmazlığı$o$, $o$Mantık hatası$o$], 3, $e$1. Sağlıklı beslenme için meyve ve sebzenin birlikte yenmesi beklenir. Sebze yememek mantığa aykırıdır.

Diğer şıklar: **A** bozukluk türünü karıştırmak / **B** bozukluk türünü karıştırmak / **C** bozukluk türünü karıştırmak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde deyim yanlış anlamda kullanılmıştır?$q$, array[$o$Çok yorulunca ağzı kulaklarına vardı.$o$, $o$Haberi duyunca dünyası başına yıkıldı.$o$, $o$Bu konuda kılı kırk yardı.$o$, $o$Sınav sonucunu görünce havalara uçtu.$o$], 0, $e$1. "Ağzı kulaklarına varmak" çok sevinmek demektir, yorgunlukla ilgisi yoktur.

Diğer şıklar: **B** doğru deyim kullanımı / **C** doğru deyim kullanımı / **D** doğru deyim kullanımı.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$"Çocuk, bahçede oynarken düştüm ve ağladı." cümlesindeki bozukluğun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Özne-yüklem uyumsuzluğu$o$, $o$Gereksiz sözcük$o$, $o$Mantık hatası$o$, $o$Anlam belirsizliği$o$], 0, $e$1. "Çocuk" öznesi ile "düştüm" yüklemi uyumsuzdur.

Diğer şıklar: **B** bozukluk türünü karıştırmak / **C** bozukluk türünü karıştırmak / **D** bozukluk türünü karıştırmak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde zaman uyuşmazlığı vardır?$q$, array[$o$Dün akşam sinemaya gittik.$o$, $o$Yarın akşam sinemaya gideceğiz.$o$, $o$Dün akşam sinemaya gideceğiz.$o$, $o$Her akşam sinemaya gideriz.$o$], 2, $e$1. "Dün" geçmiş zaman, "gideceğiz" gelecek zaman bildirir. İkisi uyumsuzdur.

Diğer şıklar: **A** doğru anlatım / **B** doğru anlatım / **D** doğru anlatım.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$"Bu kitabı okuyan, çok bilgilendi ve yazıldı." cümlesindeki bozukluğun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Gereksiz sözcük$o$, $o$Çatı uyuşmazlığı$o$, $o$Mantık hatası$o$, $o$Anlam belirsizliği$o$], 1, $e$1. "Bilgilendi" etken, "yazıldı" edilgen çatılıdır. Çatılar uyumsuzdur.

Diğer şıklar: **A** bozukluk türünü karıştırmak / **C** bozukluk türünü karıştırmak / **D** bozukluk türünü karıştırmak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Öğretmen, öğrencilere sorular sordu ve öğrenciler cevaplayamadı." cümlesinde aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Özne-yüklem uyumsuzluğu vardır.$o$, $o$Zaman uyuşmazlığı vardır.$o$, $o$Anlatım bozukluğu yoktur.$o$, $o$Mantık hatası vardır.$o$], 2, $e$1. Cümlede özne-yüklem, zaman ve mantık bakımından uyumsuzluk yoktur.

Diğer şıklar: **A** olmayan bozukluğu görmek / **B** olmayan bozukluğu görmek / **D** olmayan bozukluğu görmek.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde öge eksikliği ya da ortak yüklem hatası vardır?$q$, array[$o$Ali kitabı aldı.$o$, $o$Ali kitabı ve defteri aldı.$o$, $o$Ali kitabı, Ayşe defter aldı.$o$, $o$Ali kitap, Ayşe defter aldı.$o$], 2, $e$1. Ali ve Ayşe için ortak yüklem kullanılırken "kitabı" belirtili, "defter" belirtisizdir. Bu, ortak yüklem hatasıdır.

Diğer şıklar: **A** doğru anlatım / **B** doğru anlatım / **D** doğru anlatım.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde anlam çelişkisi vardır?$q$, array[$o$Çok az ama bol bol yemek yedi.$o$, $o$Az ama dengeli yemek yedi.$o$, $o$Hızlı hızlı yemek yedi.$o$, $o$Çok yedi ve doydu.$o$], 0, $e$1. "Çok az" ile "bol bol" birbirine zıt anlamdadır.

Diğer şıklar: **B** doğru anlatım / **C** doğru anlatım / **D** doğru anlatım.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde gereksiz sözcük kullanılmamıştır?$q$, array[$o$Çok fazla yoruldum.$o$, $o$Sabahları erkenden kalkarım.$o$, $o$Hemen derhal geldi.$o$, $o$Beklemek zorunda kalmak zorundayım.$o$], 1, $e$1. "Çok fazla", "hemen derhal" ve "zorunda kalmak zorundayım" ifadelerinde aynı anlam iki kez söylenmiştir.

Diğer şıklar: **A** gereksiz sözcük / **C** gereksiz sözcük / **D** gereksiz sözcük.$e$, 2),
  (15, 'lgs-tr', null::integer, $q$Aşağıdaki cümlelerin hangisinde mantık hatası vardır?$q$, array[$o$Yağmur yağdığı için bahçemizdeki çiçekler canlandı.$o$, $o$Çok çalıştığı için sınavı kazandı.$o$, $o$Hava soğuk olduğu için montunu giydi.$o$, $o$Yağmur yağdığı için bahçemizdeki çiçekler susuz kaldı.$o$], 3, $e$1. Yağmurun yağması çiçeklerin susuz kalmasına neden olmaz. Cümlede neden-sonuç ilişkisi mantıksızdır.

Diğer şıklar: **A** doğru anlatım / **B** doğru anlatım / **C** doğru anlatım.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$"Bu sorunu çözmek için herkes seferber oldu." cümlesi için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Özne-yüklem uyumsuzluğu vardır.$o$, $o$Zaman uyuşmazlığı vardır.$o$, $o$Anlatım bozukluğu yoktur.$o$, $o$Çatı uyuşmazlığı vardır.$o$], 2, $e$1. Cümle anlam ve yapı bakımından düzgündür.

Diğer şıklar: **A** olmayan bozukluğu görmek / **B** olmayan bozukluğu görmek / **D** olmayan bozukluğu görmek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-tr | Sözel Mantık ve Görsel Okuma konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-tr', t.id, $t$Sözel Mantık ve Görsel Okuma konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözel Mantık ve Görsel Okuma$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', null::integer, $q$Ali, Veli'den uzundur. Veli, Can'dan uzundur.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?$q$, array[$o$Can, Veli'den uzundur.$o$, $o$Ali, Can'dan uzundur.$o$, $o$Veli en uzundur.$o$, $o$Ali ile Can aynı boydadır.$o$], 1, $e$1. Ali > Veli > Can sıralaması vardır. Bu yüzden Ali, Can'dan uzundur.

Diğer şıklar: **A** ilişkiyi ters kurmak / **C** sıralamayı yanlış kurmak / **D** eşitlik varsaymak.$e$, 1),
  (2, 'lgs-tr', null::integer, $q$Dört arkadaş bir yarışa katılıyor. Ece Ayşe'den önce, Ayşe Zeynep'ten önce, Zeynep ise Mina'dan önce bitiriyor.

Buna göre yarışı kim son bitirmiştir?$q$, array[$o$Mina$o$, $o$Ece$o$, $o$Ayşe$o$, $o$Zeynep$o$], 0, $e$1. Sıralama Ece, Ayşe, Zeynep, Mina şeklindedir. Son bitiren Mina'dır.

Diğer şıklar: **B** sıralamayı ters kurmak / **C** sıralamayı eksik kurmak / **D** sıralamayı eksik kurmak.$e$, 1),
  (3, 'lgs-tr', null::integer, $q$Üç arkadaşın en sevdiği meyveler elma, armut ve muzdur. Bora elma sevmiyor. Cem armut sevmiyor. Deniz'in en sevdiği meyve muzdur.

Buna göre Bora'nın en sevdiği meyve hangisidir?$q$, array[$o$Elma$o$, $o$Muz$o$, $o$Armut$o$, $o$Kesin bilinemez$o$], 2, $e$1. Deniz muzu sevdiğine göre Bora ve Cem arasında elma ile armut kalır. Bora elma sevmediği için armudu sever.

Diğer şıklar: **A** bilgiyi yanlış okumak / **B** bilgiyi yanlış okumak / **D** çıkarımı yapamamak.$e$, 1),
  (4, 'lgs-tr', null::integer, $q$"Bütün kediler hayvandır." ve "Tekir bir kedidir." bilgileri verilmiştir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?$q$, array[$o$Tekir bir hayvandır.$o$, $o$Bütün hayvanlar kedidir.$o$, $o$Tekir bir köpektir.$o$, $o$Kediler yalnızca tekirdir.$o$], 0, $e$1. Kediler hayvan kümesinin içindedir. Tekir de kedi olduğuna göre hayvandır.

Diğer şıklar: **B** ters çıkarım yapmak / **C** yanlış çıkarım yapmak / **D** yanlış çıkarım yapmak.$e$, 1),
  (5, 'lgs-tr', null::integer, $q$Aşağıdaki tabloda dört öğrencinin okuduğu kitap sayıları verilmiştir.

| Öğrenci | Kitap sayısı |
| --- | --- |
| Ayşe | 8 |
| Berk | 12 |
| Ceren | 5 |
| Deniz | 10 |

Bu tabloya göre hangi öğrenci en az kitap okumuştur?$q$, array[$o$Ayşe$o$, $o$Berk$o$, $o$Deniz$o$, $o$Ceren$o$], 3, $e$1. En küçük sayı 5'tir ve Ceren'e aittir.

Diğer şıklar: **A** tabloyu yanlış okumak / **B** tabloyu yanlış okumak / **C** tabloyu yanlış okumak.$e$, 2),
  (6, 'lgs-tr', null::integer, $q$Aşağıdaki tabloda bir kentin dört günlük hava sıcaklığı verilmiştir.

| Gün | Sıcaklık (°C) |
| --- | --- |
| Pazartesi | 14 |
| Salı | 16 |
| Çarşamba | 11 |
| Perşembe | 18 |

Bu tabloya göre hangi iki gün arasında sıcaklık farkı en büyüktür?$q$, array[$o$Çarşamba ve perşembe$o$, $o$Pazartesi ve salı$o$, $o$Salı ve çarşamba$o$, $o$Pazartesi ve çarşamba$o$], 0, $e$1. En düşük sıcaklık çarşamba (11), en yüksek perşembe (18) günüdür. Fark 7 derecedir.

Diğer şıklar: **B** farkı yanlış hesaplamak / **C** farkı yanlış hesaplamak / **D** farkı yanlış hesaplamak.$e$, 2),
  (7, 'lgs-tr', null::integer, $q$Bir sınıfta öğrencilerin üçte biri gözlüklüdür. Sınıfta 24 öğrenci vardır.

Buna göre gözlüksüz öğrenci sayısı kaçtır?$q$, array[$o$8$o$, $o$12$o$, $o$16$o$, $o$18$o$], 2, $e$1. Gözlüklü öğrenci sayısı 24'ün üçte biri olan 8'dir. Gözlüksüz öğrenci sayısı 24 - 8 = 16'dır.

Diğer şıklar: **A** gözlüklü sayısını yazmak / **B** yarısını almak / **D** sayıyı yanlış hesaplamak.$e$, 2),
  (8, 'lgs-tr', null::integer, $q$Ali, Berk ve Cem'in yaşları 11, 12 ve 13'tür. Ali, Berk'ten büyüktür. Cem, Berk'ten küçüktür.

Buna göre Cem kaç yaşındadır?$q$, array[$o$12$o$, $o$11$o$, $o$13$o$, $o$Kesin bilinemez$o$], 1, $e$1. Ali > Berk > Cem sıralaması vardır. En büyük 13, ortadaki 12 ve en küçük 11 olduğundan Cem 11 yaşındadır.

Diğer şıklar: **A** sıralamayı yanlış kurmak / **C** sıralamayı yanlış kurmak / **D** çıkarımı yapamamak.$e$, 2),
  (9, 'lgs-tr', null::integer, $q$Dört arkadaş bir sırada oturuyor. Ece, Zeynep'in solundadır. Aylin, Ece'nin solundadır. Mina en sağdadır.

Buna göre soldan sağa doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$Mina, Zeynep, Ece, Aylin$o$, $o$Ece, Aylin, Zeynep, Mina$o$, $o$Aylin, Ece, Zeynep, Mina$o$, $o$Zeynep, Ece, Aylin, Mina$o$], 2, $e$1. Aylin Ece'nin solunda, Ece de Zeynep'in solundadır. Mina en sağdadır. Soldan sağa Aylin, Ece, Zeynep, Mina.

Diğer şıklar: **A** sıralamayı ters kurmak / **B** solu sağ ile karıştırmak / **D** yönü ters yorumlamak.$e$, 2),
  (10, 'lgs-tr', null::integer, $q$Üç kişinin meslekleri öğretmen, doktor ve mühendistir. Ahmet doktor değildir. Berk mühendis değildir. Cemal öğretmen değildir. Ahmet mühendis değildir.

Buna göre Ahmet'in mesleği nedir?$q$, array[$o$Doktor$o$, $o$Mühendis$o$, $o$Kesin bilinemez$o$, $o$Öğretmen$o$], 3, $e$1. Ahmet doktor da mühendis de olmadığına göre öğretmendir.

Diğer şıklar: **A** bilgiyi yanlış okumak / **B** bilgiyi yanlış okumak / **C** çıkarımı yapamamak.$e$, 3),
  (11, 'lgs-tr', null::integer, $q$"Hava yağmurluysa maça gitmeyiz." ve "Maça gittik." bilgileri verilmiştir.

Buna göre aşağıdakilerden hangisi kesinlikle doğrudur?$q$, array[$o$Hava yağmurlu değildi.$o$, $o$Hava yağmurluydu.$o$, $o$Maça gitmek yasaktı.$o$, $o$Maç iptal edildi.$o$], 0, $e$1. Yağmurluysa gitmeyiz. Gittiğimize göre hava yağmurlu değildi.

Diğer şıklar: **B** koşulu ters çıkarmak / **C** bilgi dışına çıkmak / **D** bilgi dışına çıkmak.$e$, 3),
  (12, 'lgs-tr', null::integer, $q$Aşağıdaki afişte "Su hayattır, boşa akıtma!" yazmaktadır. Afişte akan bir musluk ve çevresinde kuruyan bir ağaç resmedilmiştir.

Bu afişin vermek istediği mesaj aşağıdakilerden hangisidir?$q$, array[$o$Ağaçlar çok sudan zarar görür.$o$, $o$Suyu tasarruflu kullanmalıyız.$o$, $o$Musluklar tamir edilmelidir.$o$, $o$Su yalnızca bitkiler için gereklidir.$o$], 1, $e$1. Akan musluk israfı, kuruyan ağaç ise suyun hayat için önemini gösterir.

Diğer şıklar: **A** resmi yanlış yorumlamak / **C** resmi yanlış yorumlamak / **D** yazıyı yanlış yorumlamak.$e$, 3),
  (13, 'lgs-tr', null::integer, $q$Bir karikatürde bir adam çöp kovasının önünde çöpünü yere atmaktadır. Altında "Temiz çevre için ilk adım!" yazmaktadır.

Bu karikatürde eleştirilen davranış aşağıdakilerden hangisidir?$q$, array[$o$Çöpü kovaya atmak$o$, $o$Kovayı temizlemek$o$, $o$Ağaç dikmek$o$, $o$Çevreyi kirletmek$o$], 3, $e$1. Adam kovanın önünde olduğu hâlde çöpünü yere atmaktadır. Yazı ise bu davranışı eleştiren ironik bir ifadedir.

Diğer şıklar: **A** davranışı ters yorumlamak / **B** davranışı yanlış yorumlamak / **C** ilgisiz davranış.$e$, 3),
  (14, 'lgs-tr', null::integer, $q$Aşağıdaki sütun grafiğinde bir kütüphanenin dört ayda ödünç verdiği kitap sayısı gösterilmiştir.

| Ay | Kitap sayısı |
| --- | --- |
| Ocak | 120 |
| Şubat | 150 |
| Mart | 90 |
| Nisan | 180 |

Bu grafiğe göre aşağıdakilerden hangisi doğrudur?$q$, array[$o$Şubat ayı Mart ayından daha az kitap vermiştir.$o$, $o$Ocak ayında 150 kitap verilmiştir.$o$, $o$Mart ayı en çok kitap verilen aydır.$o$, $o$En çok kitap Nisan ayında ödünç verilmiştir.$o$], 3, $e$1. Nisan ayı 180 ile en yüksek değerdir.

Diğer şıklar: **A** grafiği yanlış okumak / **B** grafiği yanlış okumak / **C** grafiği yanlış okumak.$e$, 3),
  (15, 'lgs-tr', null::integer, $q$"Bütün öğrenciler çalışkandır." bilgisi doğruysa aşağıdakilerden hangisi kesinlikle doğrudur?$q$, array[$o$Ali çalışkansa kesinlikle öğrencidir.$o$, $o$Bütün çalışkanlar mutlaka öğrencidir.$o$, $o$Ali öğrenciyse çalışkandır.$o$, $o$Çalışkan olmayan biri öğrencidir ve çalışmaz.$o$], 2, $e$1. Bütün öğrenciler çalışkansa, öğrenci olan herkes çalışkandır.

Diğer şıklar: **A** ters çıkarım yapmak / **B** ters çıkarım yapmak / **D** bilgiyi yanlış yorumlamak.$e$, 2),
  (16, 'lgs-tr', null::integer, $q$Bir markette 5 TL'lik 3 tane defter ve 4 TL'lik 2 tane kalem alınıyor.

Buna göre toplam harcama kaç TL'dir?$q$, array[$o$17$o$, $o$23$o$, $o$27$o$, $o$32$o$], 1, $e$1. Defterler 3 · 5 = 15 TL, kalemler 2 · 4 = 8 TL. Toplam 15 + 8 = 23 TL.

Diğer şıklar: **A** toplamı yanlış hesaplamak / **C** toplamı yanlış hesaplamak / **D** toplamı yanlış hesaplamak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

