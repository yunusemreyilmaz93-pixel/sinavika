-- 20261025140000_questions_lgs_deneme. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | deneme | - | LGS genel deneme 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'deneme', null, $t$LGS genel deneme 1$t$, 155, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'deneme' and x.title = $t$LGS genel deneme 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözcükte Anlam$n$), $q$Aşağıdaki sözcük çiftlerinden hangisi birbirinin zıt anlamlısı **değildir**?$q$, array[$o$açmak, kapamak$o$, $o$gülmek, sevinmek$o$, $o$dolu, boş$o$, $o$ileri, geri$o$], 1, $e$1. "Gülmek" ile "sevinmek" birbirine yakın anlamlı sözcüklerdir, zıt anlamlı değildir.
2. Diğer çiftler birbirinin karşıtıdır.

Diğer şıklar: **A** zıt anlamlı çifti seçmek / **C** zıt anlamlı çifti seçmek / **D** zıt anlamlı çifti seçmek.$e$, 1),
  (2, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözcükte Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde "yüz" sözcüğü sayı anlamında kullanılmıştır?$q$, array[$o$Sınıfta yüz kadar öğrenci toplanmıştı.$o$, $o$Soğuk suyla yüzünü yıkayıp odadan çıktı.$o$, $o$Ali her hafta sonu havuzda yüzmeye gider.$o$, $o$Kumaşın yüzü pürüzsüz, arkası pütürlüydü.$o$], 0, $e$1. İlk cümlede "yüz" sayıyı anlatır.
2. Diğerlerinde sırasıyla surat, yüzmek fiili ve yüzey anlamlarındadır.

Diğer şıklar: **B** surat anlamını seçmek / **C** yüzmek fiilini seçmek / **D** yüzey anlamını seçmek.$e$, 2),
  (3, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Deyimler ve Atasözleri$n$), $q$"Ağzı kulaklarına varmak" deyimi aşağıdaki duygulardan hangisini anlatır?$q$, array[$o$Öfke$o$, $o$Korku$o$, $o$Sevinç$o$, $o$Üzüntü$o$], 2, $e$1. Çok sevinen birinin ağzı geniş bir gülümsemeyle kulaklarına kadar uzanır.

Diğer şıklar: **A** yakın bir duyguyu seçmek / **B** yakın bir duyguyu seçmek / **D** zıt bir duyguyu seçmek.$e$, 1),
  (4, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Deyimler ve Atasözleri$n$), $q$"Ak akçe kara gün içindir." atasözü aşağıdaki davranışlardan hangisiyle ilgilidir?$q$, array[$o$Zor zamanlarda arkadaşlarından yardım almakla$o$, $o$Kazandığı parayı hemen harcamakla$o$, $o$Başkalarının sözüne kulak vermemekle$o$, $o$Gelecekteki ihtiyaçlar için birikim yapmakla$o$], 3, $e$1. Atasözü, ilerideki zor günlere karşı para biriktirmenin gerekli olduğunu söyler.

Diğer şıklar: **A** yardımlaşmayı birikim sanmak / **B** atasözünün tersini seçmek / **C** ilgisiz davranışı seçmek.$e$, 2),
  (5, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde koşul ilişkisi vardır?$q$, array[$o$Hava soğuk olduğu için montumu giydim.$o$, $o$Sınava çalışarak başarılı oldu.$o$, $o$Erken kalkarsan otobüse yetişirsin.$o$, $o$Annem pazara gitti, ben ödevimi yaptım.$o$], 2, $e$1. "Erken kalkarsan" bir koşul bildirir, "otobüse yetişirsin" ise bu koşulun sonucudur.

Diğer şıklar: **A** neden-sonuç ilişkisini seçmek / **B** yol-yöntem ilişkisini seçmek / **D** eş zamanlı olayları koşul sanmak.$e$, 2),
  (6, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde bir karşılaştırma yapılmıştır?$q$, array[$o$Bu yıl kardeşim geçen yıla göre daha çok kitap okudu.$o$, $o$Kardeşim akşamları genellikle kitap okur.$o$, $o$Kitap okumak insana yeni bilgiler kazandırır.$o$, $o$Okuma saati herkes için ayrı bir saatte başlıyor.$o$], 0, $e$1. "Geçen yıla göre daha çok" ifadesi iki durumu birbiriyle kıyaslar.

Diğer şıklar: **B** alışkanlığı karşılaştırma sanmak / **C** genel yargıyı karşılaştırma sanmak / **D** ilgisiz bir durumu seçmek.$e$, 1),
  (7, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$Su, hayatın temelidir. Yeryüzündeki canlıların hiçbiri susuz yaşayamaz. Bu nedenle suyu tasarruflu kullanmak ve kirletmemek hepimizin sorumluluğudur.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?$q$, array[$o$Su yaşam için vazgeçilmezdir, bu yüzden korunmalıdır.$o$, $o$Suyun kirlenmesi yalnızca büyük şehirlerde ciddi bir sorundur.$o$, $o$Canlılar yaşamak için yalnızca suya ihtiyaç duyar.$o$, $o$Su kaynaklarının korunması yalnızca devletin görevidir.$o$], 0, $e$1. Parça, suyun canlılar için vazgeçilmez olduğunu söyler.
2. Sonuç olarak suyun korunması ve tasarruflu kullanılması gerektiğini vurgular.

Diğer şıklar: **B** parçada olmayan bir bilgi eklemek / **C** parçadaki yargıyı aşırı genellemek / **D** parçadaki yargıya ters düşmek.$e$, 2),
  (8, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$(I) Günlük yaşamda kullandığımız plastik ürünlerin sayısı hızla artıyor. (II) Plastikler doğada yüzlerce yıl yok olmadan kalabilir. (III) Atıkların büyük bölümü sonunda akarsular yoluyla denizlere ulaşır. (IV) Bu nedenle denizlerdeki plastik atık miktarı her yıl artmaktadır.

Bu cümleler anlamlı bir bütün oluşturacak biçimde sıralandığında hangisi ilk sırada yer almalıdır?$q$, array[$o$II. cümle$o$, $o$III. cümle$o$, $o$IV. cümle$o$, $o$I. cümle$o$], 3, $e$1. Parça, plastik ürünlerin artmasıyla başlar.
2. Sıralama I, II, III ve IV biçimindedir. IV. cümle "Bu nedenle" ile başlayan sonuç cümlesidir.

Diğer şıklar: **A** konunun ikinci adımını seçmek / **B** konunun üçüncü adımını seçmek / **C** sonuç cümlesini seçmek.$e$, 2),
  (9, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$Kitap okuma alışkanlığı kazanan çocukların sözcük dağarcığı daha geniş olur. Geniş bir dağarcık, kendini doğru ifade etmeyi kolaylaştırır. Kendini doğru ifade eden çocuk, derslerde de daha başarılı olur.

Bu parçadan aşağıdakilerden hangisi çıkarılabilir?$q$, array[$o$Başarılı olmak için tek gereken kitap okumaktır.$o$, $o$Sözcük dağarcığı geniş olan herkes derslerde başarılıdır.$o$, $o$Kitap okumak ders başarısını dolaylı etkileyebilir.$o$, $o$Kendini ifade etmek için kitap okumak zorunludur.$o$], 2, $e$1. Parça, kitap okumanın sözcük dağarcığını, bunun da ifade gücünü ve ders başarısını etkilediğini anlatır.
2. Bu zincir, kitap okumanın ders başarısına dolaylı etkisini gösterir.

Diğer şıklar: **A** parçadaki yargıyı aşırı genellemek / **B** parçadaki yargıyı kesinleştirmek / **D** parçada olmayan bir zorunluluk eklemek.$e$, 3),
  (10, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$Kitaplar bizi başka dünyalara götürür. ______ Bu yüzden kitap okumak hayal gücünü geliştirir.

Bu parçada boş bırakılan yere aşağıdakilerden hangisi getirilmelidir?$q$, array[$o$Kitap fiyatları bu yıl belirgin biçimde yükselmiştir.$o$, $o$Her sayfa yeni bir hayalin kapısını aralar.$o$, $o$Kütüphaneler hafta sonları kapalı kalmaktadır.$o$, $o$Okul çantaları genellikle çok ağır olmaktadır.$o$], 1, $e$1. Sonraki cümle hayal gücünün gelişmesinden söz eder.
2. Boşluğa hayal kurmayı anlatan bir cümle gelmelidir.

Diğer şıklar: **A** konuyla ilgisiz bir cümle seçmek / **C** konuyla ilgisiz bir cümle seçmek / **D** konuyla ilgisiz bir cümle seçmek.$e$, 2),
  (11, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Metin Türleri$n$), $q$Bir kişinin yaşamının, başka biri tarafından anlatıldığı metin türü aşağıdakilerden hangisidir?$q$, array[$o$Otobiyografi$o$, $o$Günlük$o$, $o$Mektup$o$, $o$Biyografi$o$], 3, $e$1. Biyografide bir kişinin hayatı başkası tarafından anlatılır.
2. Otobiyografide ise kişi kendi hayatını yazar.

Diğer şıklar: **A** kişinin kendi yaşamını anlatmasını seçmek / **B** gün gün tutulan notları seçmek / **C** yazışma türünü seçmek.$e$, 1),
  (12, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Söz Sanatları$n$), $q$Aşağıdaki cümlelerin hangisinde abartı sanatı kullanılmıştır?$q$, array[$o$Bu çantayı taşırken kollarım kopacaktı.$o$, $o$Kitabı bir saatte okuyup bitirdi.$o$, $o$Gökyüzü sanki kocaman bir deniz gibiydi.$o$, $o$Ağaçlar rüzgârla birlikte dans etti.$o$], 0, $e$1. Bir şeyi olduğundan fazla göstermeye abartı denir.
2. Çanta taşırken kolların kopması abartılı bir anlatımdır.

Diğer şıklar: **B** söz sanatı içermeyen cümleyi seçmek / **C** benzetmeyi seçmek / **D** kişileştirmeyi seçmek.$e$, 1),
  (13, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilimsiler$n$), $q$Aşağıdaki cümlelerin hangisinde isim-fiil (mastar) kullanılmıştır?$q$, array[$o$Gülerek içeri girdi ve herkesi selamladı.$o$, $o$Erken kalkmak sağlıklı bir alışkanlıktır.$o$, $o$Okuduğu kitabı bana ödünç verdi.$o$, $o$Eve gelince seni hemen arayacağım.$o$], 1, $e$1. "Kalkmak" sözcüğü fiilden türeyen ve isim görevinde kullanılan bir isim-fiildir.

Diğer şıklar: **A** zarf-fiili seçmek / **C** sıfat-fiili seçmek / **D** zarf-fiili seçmek.$e$, 2),
  (14, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlenin Ögeleri$n$), $q$Annem akşam sofraya taze ekmek koydu.

Bu cümlede nesne aşağıdakilerden hangisidir?$q$, array[$o$taze ekmek$o$, $o$sofraya$o$, $o$akşam$o$, $o$Annem$o$], 0, $e$1. Yüklem "koydu" dur. "Neyi koydu?" sorusunun cevabı "taze ekmek" tir.
2. Bu öge nesnedir.

Diğer şıklar: **B** dolaylı tümleci seçmek / **C** zarf tümlecini seçmek / **D** özneyi seçmek.$e$, 2),
  (15, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilde Çatı$n$), $q$Aşağıdaki cümlelerin hangisinde fiil işteş çatılıdır?$q$, array[$o$Çocuk yüzünü soğuk suyla özenle yıkadı.$o$, $o$Ödev defterine düzgün bir biçimde yazıldı.$o$, $o$Kapıyı rüzgâr bir anda ardına kadar açtırdı.$o$, $o$Komşularla yeni yıl için anlaştık.$o$], 3, $e$1. İşteş çatıda iş birlikte ya da karşılıklı yapılır ve fiile "-ş" eki gelir.
2. "Anlaştık" fiili bu özelliği taşır.

Diğer şıklar: **A** etken çatıyı seçmek / **B** edilgen çatıyı seçmek / **C** ettirgen çatıyı seçmek.$e$, 2),
  (16, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümle Türleri$n$), $q$Aşağıdaki cümlelerin hangisi yüklemine göre isim cümlesidir?$q$, array[$o$Akşam yemeğini birlikte yedik.$o$, $o$Bu sabah hava çok soğuktu.$o$, $o$Yarın sabah erken yola çıkacağız.$o$, $o$Çocuklar bahçede neşeyle oynuyor.$o$], 1, $e$1. Yüklemi ad soylu bir sözcük olan cümleye isim cümlesi denir.
2. "Soğuktu" ad soylu bir yüklemdir.

Diğer şıklar: **A** fiil cümlesini seçmek / **C** fiil cümlesini seçmek / **D** fiil cümlesini seçmek.$e$, 2),
  (17, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Yazım Kuralları$n$), $q$Aşağıdaki cümlelerin hangisinde yazım yanlışı **vardır**?$q$, array[$o$Her gün sabahları parkta yürüyüş yapar.$o$, $o$Sınava hazırlanıyorum ama çok heyecanlıyım.$o$, $o$Ahmet'de bizimle sinemaya geldi.$o$, $o$Bu akşam bizde kalırsın, değil mi?$o$], 2, $e$1. Bağlaç olan "de" ayrı yazılır ve kesme işaretiyle ayrılmaz.
2. Doğrusu "Ahmet de bizimle sinemaya geldi." olmalıdır.

Diğer şıklar: **A** doğru yazılmış cümleyi seçmek / **B** doğru yazılmış cümleyi seçmek / **D** doğru yazılmış cümleyi seçmek.$e$, 2),
  (18, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Noktalama İşaretleri$n$), $q$Aşağıdaki cümlelerden hangisinin sonuna ünlem işareti (!) konmalıdır?$q$, array[$o$Bugün hava nasıl olacak$o$, $o$Ne kadar güzel bir gün$o$, $o$Yarın okula erken gideceğim$o$, $o$Annem pazardan elma aldı$o$], 1, $e$1. Şaşkınlık ve coşkuyu anlatan cümlenin sonuna ünlem konur.
2. Diğer cümleler soru ve bildirme cümleleridir.

Diğer şıklar: **A** soru cümlesi olduğu için soru işareti gerekir / **C** bildirme cümlesi olduğu için nokta gerekir / **D** bildirme cümlesi olduğu için nokta gerekir.$e$, 1),
  (19, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Anlatım Bozuklukları$n$), $q$Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?$q$, array[$o$Toplantıya otuz kişi katıldı.$o$, $o$Öğrenciler sınav sonuçlarını merakla bekledi.$o$, $o$Yaklaşık olarak otuz kişi kadar toplantıya katıldı.$o$, $o$Bahçedeki çiçekleri her sabah sulayarak büyüttü.$o$], 2, $e$1. "Yaklaşık" ve "kadar" aynı anlamı karşıladığı için gereksiz sözcük kullanılmıştır.
2. Bu durum anlatım bozukluğudur.

Diğer şıklar: **A** anlatım bozukluğu olmayan cümleyi seçmek / **B** anlatım bozukluğu olmayan cümleyi seçmek / **D** anlatım bozukluğu olmayan cümleyi seçmek.$e$, 2),
  (20, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözel Mantık ve Görsel Okuma$n$), $q$Dört arkadaş bir yarışa katılmıştır. Ece, Mert'ten önce bitirmiştir. Sena, Ece'den sonra ancak Mert'ten önce bitirmiştir. Tuna yarışı birinci bitirmiştir.

Buna göre yarışı üçüncü sırada bitiren kimdir?$q$, array[$o$Ece$o$, $o$Mert$o$, $o$Sena$o$, $o$Tuna$o$], 2, $e$1. Tuna birincidir.
2. Ece, Sena'dan önce, Sena ise Mert'ten önce bitirdiğinden sıra Tuna, Ece, Sena, Mert olur.

Diğer şıklar: **A** ikinciyi üçüncü sanmak / **B** sonuncuyu üçüncü sanmak / **D** birinciyi üçüncü sanmak.$e$, 2),
  (21, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Bir Kahraman Doğuyor$n$), $q$Mustafa Kemal Atatürk aşağıdaki şehirlerden hangisinde doğmuştur?$q$, array[$o$Manastır$o$, $o$Selanik$o$, $o$İstanbul$o$, $o$Edirne$o$], 1, $e$1. Mustafa Kemal 1881 yılında Selanik'te doğmuştur.

Diğer şıklar: **A** eğitim gördüğü şehri seçmek / **C** askerî eğitim aldığı şehri seçmek / **D** ilgisiz bir şehri seçmek.$e$, 1),
  (22, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar$n$), $q$Erzurum Kongresi'nde alınan aşağıdaki kararlardan hangisi ulusal bağımsızlık anlayışının bir göstergesidir?$q$, array[$o$Manda ve himaye bir kurtuluş yolu olarak kabul edilmelidir.$o$, $o$Ulusal kuvvetler yabancı yönetimin emrine verilmelidir.$o$, $o$Azınlıklara siyasi ayrıcalıklar tanınmalıdır.$o$, $o$Vatanın bütünlüğü ve milletin bağımsızlığı esastır.$o$], 3, $e$1. Erzurum Kongresi'nde vatanın bütünlüğü ve milletin bağımsızlığının esas olduğu belirtilmiştir.
2. Manda ve himaye reddedilmiştir.

Diğer şıklar: **A** kongrenin kararına ters bir ifadeyi seçmek / **B** kongrenin kararına ters bir ifadeyi seçmek / **C** kongrenin kararına ters bir ifadeyi seçmek.$e$, 2),
  (23, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Bir Destan: Ya İstiklal Ya Ölüm$n$), $q$Lozan Barış Antlaşması ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Kapitülasyonlar kaldırılmıştır.$o$, $o$Boğazlar tamamen Türk askerî denetimine bırakılmıştır.$o$, $o$Hatay Türkiye'ye katılmıştır.$o$, $o$Musul sorunu kesin olarak çözülmüştür.$o$], 0, $e$1. Lozan'da kapitülasyonlar kaldırılmıştır.
2. Boğazlar silahsızlandırılmış, Musul sorunu ertelenmiş, Hatay ise 1939'da Türkiye'ye katılmıştır.

Diğer şıklar: **B** Boğazların silahsızlandırıldığını bilmemek / **C** sonraki yılları karıştırmak / **D** ertelenen sorunu çözülmüş sanmak.$e$, 2),
  (24, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürkçülük ve Çağdaşlaşan Türkiye$n$), $q$"Egemenlik kayıtsız şartsız milletindir." sözü Atatürk ilkelerinden hangisiyle ilgilidir?$q$, array[$o$Devletçilik$o$, $o$Laiklik$o$, $o$İnkılapçılık$o$, $o$Cumhuriyetçilik$o$], 3, $e$1. Egemenliğin millete ait olması cumhuriyetçilik ilkesinin temelidir.

Diğer şıklar: **A** ekonomi ilkesini seçmek / **B** din-devlet ilişkisini seçmek / **C** yenilik anlayışını seçmek.$e$, 2),
  (25, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürkçülük ve Çağdaşlaşan Türkiye$n$), $q$Türk kadınına milletvekili seçme ve seçilme hakkı aşağıdaki yıllardan hangisinde verilmiştir?$q$, array[$o$1923$o$, $o$1930$o$, $o$1938$o$, $o$1934$o$], 3, $e$1. Kadınlara belediye seçimlerinde hak 1930'da verilmiştir.
2. Milletvekili seçme ve seçilme hakkı ise 1934'te tanınmıştır.

Diğer şıklar: **A** cumhuriyetin ilan yılını seçmek / **B** belediye seçimleri yılını seçmek / **C** Atatürk'ün vefat yılını seçmek.$e$, 2),
  (26, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Demokratikleşme Çabaları$n$), $q$Cumhuriyet döneminde kurulan ilk muhalefet partisi aşağıdakilerden hangisidir?$q$, array[$o$Serbest Cumhuriyet Fırkası$o$, $o$Terakkiperver Cumhuriyet Fırkası$o$, $o$Cumhuriyet Halk Fırkası$o$, $o$Demokrat Parti$o$], 1, $e$1. Terakkiperver Cumhuriyet Fırkası 1924'te kurulan ilk muhalefet partisidir.
2. Serbest Cumhuriyet Fırkası 1930'da kurulmuştur.

Diğer şıklar: **A** sonradan kurulan muhalefet partisini seçmek / **C** iktidar partisini seçmek / **D** çok sonraki bir partiyi seçmek.$e$, 2),
  (27, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk Dönemi Türk Dış Politikası$n$), $q$Montrö Boğazlar Sözleşmesi ile Türkiye'nin kazandığı en önemli hak aşağıdakilerden hangisidir?$q$, array[$o$Doğu Trakya'nın sınırlarını genişletme hakkı$o$, $o$Hatay'ı doğrudan topraklarına katma ve yönetme hakkı$o$, $o$Boğazlarda askerî önlem alma ve tam egemenlik hakkı$o$, $o$Kapitülasyonları yeniden yürürlüğe koyma hakkı$o$], 2, $e$1. 1936 Montrö Sözleşmesi ile Boğazlar'da Türkiye askerî önlem alma hakkını kazanmıştır.
2. Böylece Boğazlar üzerinde tam egemenlik sağlanmıştır.

Diğer şıklar: **A** ilgisiz bir hakkı seçmek / **B** başka bir gelişmeyi karıştırmak / **D** Lozan'da kaldırılan düzeni seçmek.$e$, 2),
  (28, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk'ün Ölümü ve Sonrası$n$), $q$Atatürk'ün naaşı Anıtkabir'e hangi yılda nakledilmiştir?$q$, array[$o$1938$o$, $o$1945$o$, $o$1953$o$, $o$1960$o$], 2, $e$1. Atatürk 1938'de vefat etmiş, naaşı 1953'te Anıtkabir'e nakledilmiştir.

Diğer şıklar: **A** vefat yılını seçmek / **B** yakın bir yılı seçmek / **D** yakın bir yılı seçmek.$e$, 2),
  (29, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar$n$), $q$Son Osmanlı Mebusan Meclisi'nde kabul edilen ve ulusal sınırlarımızı belirleyen belge aşağıdakilerden hangisidir?$q$, array[$o$Amasya Genelgesi$o$, $o$Sivas Kongresi Bildirisi$o$, $o$Teşkilat-ı Esasiye Kanunu$o$, $o$Misak-ı Millî$o$], 3, $e$1. Misak-ı Millî 1920'de Meclis-i Mebusan'da kabul edilmiştir.
2. Ulusal sınırlarımızı belirleyen belgedir.

Diğer şıklar: **A** başka bir belgeyi seçmek / **B** başka bir belgeyi seçmek / **C** başka bir belgeyi seçmek.$e$, 1),
  (30, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Bir Kahraman Doğuyor$n$), $q$"Ben size taarruzu değil, ölmeyi emrediyorum." sözü hangi savaş sırasında söylenmiştir?$q$, array[$o$Çanakkale Savaşları$o$, $o$Sakarya Meydan Muharebesi$o$, $o$Dumlupınar Meydan Muharebesi$o$, $o$Trablusgarp Savaşı$o$], 0, $e$1. Mustafa Kemal bu sözü 1915'te Conkbayırı'nda, Çanakkale Savaşları sırasında söylemiştir.

Diğer şıklar: **B** sonraki savaşı seçmek / **C** sonraki savaşı seçmek / **D** önceki savaşı seçmek.$e$, 1),
  (31, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kader İnancı$n$), $q$Aşağıdakilerden hangisi kader inancının insana kazandırdığı olumlu bir tutumdur?$q$, array[$o$Tedbir almayı tamamen gereksiz görmek$o$, $o$Sorumluluğu her zaman başkalarına yüklemek$o$, $o$Başarısızlıkta umutsuzluğa kapılmamak$o$, $o$Çalışmadan boş yere sonuç beklemek$o$], 2, $e$1. Kader inancı insanı sabırlı ve umutlu kılar.
2. Diğer tutumlar kader inancıyla bağdaşmaz.

Diğer şıklar: **A** kaderi tedbirsizlik sanmak / **B** kaderi sorumluluktan kaçmak sanmak / **D** kaderi çalışmamak sanmak.$e$, 1),
  (32, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kader İnancı$n$), $q$Gereken tedbirleri aldıktan sonra sonucu Allah'a bırakmaya ne ad verilir?$q$, array[$o$Kanaat$o$, $o$Tevekkül$o$, $o$İsraf$o$, $o$Tembellik$o$], 1, $e$1. Tevekkül, çalışıp gerekeni yaptıktan sonra sonucu Allah'a bırakmaktır.

Diğer şıklar: **A** az olanla yetinmeyi seçmek / **C** gereksiz harcamayı seçmek / **D** çalışmamayı seçmek.$e$, 1),
  (33, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Zekât ve Sadaka$n$), $q$Aşağıdakilerden hangisine zekât verilebilir?$q$, array[$o$Geçimini sağlayamayan yoksul bir kişiye$o$, $o$Zekât veren kişinin kendi çocuğuna$o$, $o$Zengin bir komşuya$o$, $o$Düzenli geliri olan bir işletmeye$o$], 0, $e$1. Zekât, ihtiyaç sahiplerine verilir.
2. Kişinin bakmakla yükümlü olduğu kimselere ve zengin olanlara verilmez.

Diğer şıklar: **B** zekâtın verilemeyeceği kişiyi seçmek / **C** zekâtın verilemeyeceği kişiyi seçmek / **D** zekâtın verilemeyeceği yeri seçmek.$e$, 2),
  (34, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Zekât ve Sadaka$n$), $q$Zekâtın toplumsal faydası aşağıdakilerden hangisidir?$q$, array[$o$Toplumda yardımlaşma ve dayanışmayı güçlendirir.$o$, $o$Zenginler ile yoksullar arasındaki farkı artırır.$o$, $o$Bireylerin birbirinden uzaklaşmasını sağlar.$o$, $o$Yardımlaşma ihtiyacını ortadan kaldırır.$o$], 0, $e$1. Zekât, ihtiyaç sahiplerinin desteklenmesini sağlar.
2. Böylece toplumda yardımlaşma ve dayanışma güçlenir.

Diğer şıklar: **B** faydanın tersini seçmek / **C** faydanın tersini seçmek / **D** gerçekçi olmayan bir yargı seçmek.$e$, 1),
  (35, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Din ve Hayat$n$), $q$Aşağıdakilerden hangisi İslam ahlakının temel değerlerinden biridir?$q$, array[$o$Kıskançlık$o$, $o$İsraf$o$, $o$Doğruluk$o$, $o$Gösteriş$o$], 2, $e$1. Doğruluk, İslam ahlakında önemli bir değerdir.
2. Diğerleri İslam'ın hoş görmediği davranışlardır.

Diğer şıklar: **A** olumsuz bir davranışı seçmek / **B** olumsuz bir davranışı seçmek / **D** olumsuz bir davranışı seçmek.$e$, 1),
  (36, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Din ve Hayat$n$), $q$Aşağıdakilerden hangisi İslam'ın şartlarından biri **değildir**?$q$, array[$o$Namaz kılmak$o$, $o$Kurban kesmek$o$, $o$Oruç tutmak$o$, $o$Zekât vermek$o$], 1, $e$1. İslam'ın şartları: kelime-i şehadet, namaz, oruç, zekât ve hactır.
2. Kurban kesmek ise başka bir ibadettir.

Diğer şıklar: **A** İslam'ın şartını seçmek / **C** İslam'ın şartını seçmek / **D** İslam'ın şartını seçmek.$e$, 1),
  (37, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Hz. Muhammed'in Örnekliği$n$), $q$Hz. Muhammed'e ilk vahiy hangi mekânda gelmiştir?$q$, array[$o$Sevr Mağarası$o$, $o$Safa Tepesi$o$, $o$Arafat Dağı$o$, $o$Hira Mağarası$o$], 3, $e$1. Hz. Muhammed'e ilk vahiy Mekke yakınlarındaki Hira Mağarası'nda gelmiştir.

Diğer şıklar: **A** hicret sırasındaki mağarayı seçmek / **B** ilk davet yerini seçmek / **C** hac yerini seçmek.$e$, 1),
  (38, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Hz. Muhammed'in Örnekliği$n$), $q$Hz. Muhammed'in Veda Hutbesi'nde vurguladığı ilkelerden biri aşağıdakilerden hangisidir?$q$, array[$o$İnsanlar arasında ırk ve renk üstünlüğünün olmadığı$o$, $o$Zenginlerin yoksullardan üstün sayılması gerektiği$o$, $o$Erkeklerin kadınlardan üstün sayılması gerektiği$o$, $o$Arapların diğer milletlerden üstün olması gerektiği$o$], 0, $e$1. Veda Hutbesi'nde insanların eşit olduğu, üstünlüğün ancak takvada olduğu belirtilmiştir.

Diğer şıklar: **B** hutbeye ters bir ilkeyi seçmek / **C** hutbeye ters bir ilkeyi seçmek / **D** hutbeye ters bir ilkeyi seçmek.$e$, 2),
  (39, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kur'an-ı Kerim ve Özellikleri$n$), $q$Kur'an-ı Kerim kaç sureden oluşur?$q$, array[$o$30$o$, $o$99$o$, $o$114$o$, $o$124$o$], 2, $e$1. Kur'an-ı Kerim 114 sureden oluşur.

Diğer şıklar: **A** cüz sayısını seçmek / **B** Esmâ-ül Hüsnâ sayısını seçmek / **D** ilgisiz bir sayı seçmek.$e$, 1),
  (40, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kur'an-ı Kerim ve Özellikleri$n$), $q$Kur'an-ı Kerim'i doğru ve güzel okumayı öğreten bilgi alanına ne ad verilir?$q$, array[$o$Tefsir$o$, $o$Hadis$o$, $o$Tecvit$o$, $o$Fıkıh$o$], 2, $e$1. Tecvit, Kur'an'ı kurallarına uygun okumayı öğretir.
2. Tefsir ise ayetlerin yorumuyla ilgilidir.

Diğer şıklar: **A** ayetleri yorumlama alanını seçmek / **B** peygamberin sözlerini inceleme alanını seçmek / **D** dinî hükümleri inceleme alanını seçmek.$e$, 2),
  (41, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Friendship$n$), $q$Lara: Would you like to see a film with us?
Ella: ______ I have to study for my exam.$q$, array[$o$Yes, I'd love to.$o$, $o$That's a great idea.$o$, $o$I agree with you.$o$, $o$I'm sorry, I can't.$o$], 3, $e$1. Ella has to study, so she refuses the invitation.
2. "I'm sorry, I can't." is a polite refusal.

Diğer şıklar: **A** çelişen cevabı seçmek / **B** çelişen cevabı seçmek / **C** konuyla ilgisiz cevap seçmek.$e$, 2),
  (42, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Teen Life$n$), $q$Tom ______ playing computer games in his free time.$q$, array[$o$love$o$, $o$loving$o$, $o$loves$o$, $o$to love$o$], 2, $e$1. The subject is "Tom", which is third person singular.
2. The verb takes -s: "loves".

Diğer şıklar: **A** özneye uygun olmayan fiili seçmek / **B** fiilin -ing hâlini seçmek / **D** mastar hâlini seçmek.$e$, 1),
  (43, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$In the Kitchen$n$), $q$You ______ put too much salt in the soup. It isn't healthy.$q$, array[$o$should$o$, $o$must$o$, $o$shouldn't$o$, $o$can$o$], 2, $e$1. Too much salt is not healthy, so this is negative advice.
2. "Shouldn't" gives negative advice.

Diğer şıklar: **A** tavsiyenin olumsuzluğunu fark etmemek / **B** mantıksız modal seçmek / **D** mantıksız modal seçmek.$e$, 2),
  (44, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$On the Phone$n$), $q$Which sentence do we use to ask someone to wait on the phone?$q$, array[$o$Hold on, please.$o$, $o$Look out, please.$o$, $o$Turn off, please.$o$, $o$Take care, please.$o$], 0, $e$1. "Hold on" means wait a moment on the phone.

Diğer şıklar: **B** farklı bir deyimi seçmek / **C** farklı bir deyimi seçmek / **D** farklı bir deyimi seçmek.$e$, 1),
  (45, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$The Internet$n$), $q$You can ______ information about animals on the Internet.$q$, array[$o$search for$o$, $o$look after$o$, $o$give up$o$, $o$get on$o$], 0, $e$1. "Search for" means to look for something.
2. The other phrases do not fit the sentence.

Diğer şıklar: **B** başka bir deyimsel fiili seçmek / **C** başka bir deyimsel fiili seçmek / **D** başka bir deyimsel fiili seçmek.$e$, 1),
  (46, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Adventures$n$), $q$While we ______ in the forest, we saw a deer.$q$, array[$o$walk$o$, $o$will walk$o$, $o$have walked$o$, $o$were walking$o$], 3, $e$1. "While" shows an action that was in progress in the past.
2. Past continuous is used: "were walking".

Diğer şıklar: **A** geniş zamanı seçmek / **B** gelecek zamanı seçmek / **C** yakın geçmişi seçmek.$e$, 3),
  (47, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Tourism$n$), $q$Tourist: ______ is the museum?
Guide: It's next to the post office.$q$, array[$o$Where$o$, $o$What$o$, $o$Who$o$, $o$Why$o$], 0, $e$1. The guide answers with a place, so the question asks about location.

Diğer şıklar: **B** soru sözcüğünü karıştırmak / **C** soru sözcüğünü karıştırmak / **D** soru sözcüğünü karıştırmak.$e$, 1),
  (48, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Chores$n$), $q$Please ______ your room before dinner. It's very messy.$q$, array[$o$tidy up$o$, $o$look up$o$, $o$get up$o$, $o$put on$o$], 0, $e$1. "Tidy up" means to make a place neat.
2. The room is messy, so it fits the sentence.

Diğer şıklar: **B** başka bir deyimsel fiili seçmek / **C** başka bir deyimsel fiili seçmek / **D** başka bir deyimsel fiili seçmek.$e$, 2),
  (49, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Science$n$), $q$Water ______ at zero degrees Celsius.$q$, array[$o$freeze$o$, $o$freezes$o$, $o$is freeze$o$, $o$freezing$o$], 1, $e$1. General truths use the present simple tense.
2. The subject "water" is singular, so the verb takes -s.

Diğer şıklar: **A** özneye uygun olmayan fiili seçmek / **C** yapıyı yanlış kurmak / **D** fiilin -ing hâlini seçmek.$e$, 2),
  (50, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Natural Forces$n$), $q$A strong wind ______ many trees yesterday.$q$, array[$o$knock down$o$, $o$knocked down$o$, $o$knocks down$o$, $o$knocking down$o$], 1, $e$1. "Yesterday" shows past time.
2. The past form is "knocked down".

Diğer şıklar: **A** geçmiş zaman eki eksik / **C** geniş zamanı seçmek / **D** fiilin -ing hâlini seçmek.$e$, 2),
  (51, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Çarpanlar ve Katlar$n$), $q$$72$ sayısının farklı asal çarpanlarının toplamı kaçtır?$q$, array[$o$$6$$o$, $o$$12$$o$, $o$$17$$o$, $o$$5$$o$], 3, $e$1. $72 = 2^3 \cdot 3^2$ olduğundan farklı asal çarpanlar $2$ ve $3$ tür.
2. Toplamları $2 + 3 = 5$.

Diğer şıklar: **A** asal çarpanları çarpmak / **B** asal çarpanları tekrarlı toplamak / **C** yanlış çarpanlara ayırmak.$e$, 1),
  (52, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Çarpanlar ve Katlar$n$), $q$$A = 2^3 \cdot 3 \cdot 5$ ve $B = 2^2 \cdot 3^2 \cdot 7$ sayıları için EKOK$(A, B)$ değerinin EBOB$(A, B)$ değerine oranı kaçtır?$q$, array[$o$$210$$o$, $o$$105$$o$, $o$$252$$o$, $o$$420$$o$], 0, $e$1. EBOB için ortak asal çarpanların en küçük üslüleri alınır: $2^2 \cdot 3 = 12$.
2. EKOK için tüm asal çarpanların en büyük üslüleri alınır: $2^3 \cdot 3^2 \cdot 5 \cdot 7 = 2520$.
3. Oran $2520 \div 12 = 210$.

Diğer şıklar: **B** EKOK değerini yanlış hesaplamak / **C** ilgisiz bir değer bulmak / **D** EBOB değerini yanlış hesaplamak.$e$, 3),
  (53, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üslü İfadeler$n$), $q$$\dfrac{2^5 \cdot 2^3}{2^6}$ işleminin sonucu kaçtır?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$8$$o$, $o$$16$$o$], 1, $e$1. Çarpımda üsler toplanır: $2^5 \cdot 2^3 = 2^8$.
2. Bölümde üsler çıkarılır: $2^8 \div 2^6 = 2^2 = 4$.

Diğer şıklar: **A** üsleri çıkarırken hata yapmak / **C** üslerin yalnızca payını almak / **D** paydayı yok saymak.$e$, 1),
  (54, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üslü İfadeler$n$), $q$$0{,}00032$ sayısının bilimsel gösterimi aşağıdakilerden hangisidir?$q$, array[$o$$3{,}2 \cdot 10^{-4}$$o$, $o$$3{,}2 \cdot 10^{-3}$$o$, $o$$32 \cdot 10^{-5}$$o$, $o$$0{,}32 \cdot 10^{-3}$$o$], 0, $e$1. Virgül, ilk sıfırdan farklı rakamın sağına gelene kadar $4$ basamak sağa kaydırılır.
2. Bu nedenle sayı $3{,}2 \cdot 10^{-4}$ olur.

Diğer şıklar: **B** virgülü bir basamak eksik kaydırmak / **C** çarpanı $1$ ile $10$ arasına almamak / **D** çarpanı $1$ ile $10$ arasına almamak.$e$, 2),
  (55, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Kareköklü İfadeler$n$), $q$$\sqrt{50} + \sqrt{18}$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$8\sqrt{2}$$o$, $o$$\sqrt{68}$$o$, $o$$16\sqrt{2}$$o$, $o$$15\sqrt{2}$$o$], 0, $e$1. $\sqrt{50} = 5\sqrt{2}$ ve $\sqrt{18} = 3\sqrt{2}$ dir.
2. Toplam $5\sqrt{2} + 3\sqrt{2} = 8\sqrt{2}$.

Diğer şıklar: **B** kök içlerini toplamak / **C** katsayıları iki katına çıkarmak / **D** katsayıları çarpmak.$e$, 1),
  (56, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Kareköklü İfadeler$n$), $q$$7 < \sqrt{x} < 8$ eşitsizliğini sağlayan kaç farklı $x$ doğal sayısı vardır?$q$, array[$o$$13$$o$, $o$$15$$o$, $o$$16$$o$, $o$$14$$o$], 3, $e$1. Her tarafın karesi alınır: $49 < x < 64$.
2. Bu aralıktaki doğal sayılar $50$ ile $63$ arasındadır, yani $14$ tanedir.

Diğer şıklar: **A** $63$ sayısını dışarıda bırakmak / **B** $49$ sayısını da dahil etmek / **C** $49$ ve $64$ sayılarını da dahil etmek.$e$, 3),
  (57, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Veri Analizi$n$), $q$Bir öğrencinin ilk dört sınavdan aldığı notlar $70$, $80$, $90$ ve $85$ tir. Beş sınavın not ortalamasının $84$ olması için öğrencinin beşinci sınavdan kaç alması gerekir?$q$, array[$o$$84$$o$, $o$$90$$o$, $o$$95$$o$, $o$$100$$o$], 2, $e$1. Beş sınavın toplamı $5 \cdot 84 = 420$ olmalıdır.
2. İlk dört notun toplamı $325$ tir. Beşinci not $420 - 325 = 95$.

Diğer şıklar: **A** ortalamayı sınav notu sanmak / **B** ortalamaya yakın bir değer tahmin etmek / **D** ortalamayı aşan bir değer seçmek.$e$, 2),
  (58, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Basit Olayların Olma Olasılığı$n$), $q$Bir torbada $3$ kırmızı, $5$ mavi ve $2$ sarı bilye vardır. Torbadan rastgele çekilen bir bilyenin mavi olma olasılığı kaçtır?$q$, array[$o$$\dfrac{1}{2}$$o$, $o$$\dfrac{3}{10}$$o$, $o$$\dfrac{1}{5}$$o$, $o$$\dfrac{5}{7}$$o$], 0, $e$1. Toplam bilye sayısı $3 + 5 + 2 = 10$ dur.
2. Mavi olasılığı $\dfrac{5}{10} = \dfrac{1}{2}$.

Diğer şıklar: **B** kırmızı bilye sayısını almak / **C** sarı bilye sayısını almak / **D** toplamı yanlış hesaplamak.$e$, 1),
  (59, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Basit Olayların Olma Olasılığı$n$), $q$İki adil zar aynı anda atılıyor. Üst yüzlere gelen sayıların toplamının $8$ olma olasılığı kaçtır?$q$, array[$o$$\dfrac{1}{6}$$o$, $o$$\dfrac{1}{9}$$o$, $o$$\dfrac{7}{36}$$o$, $o$$\dfrac{5}{36}$$o$], 3, $e$1. Toplamı $8$ yapan durumlar $(2,6)$, $(3,5)$, $(4,4)$, $(5,3)$ ve $(6,2)$ olmak üzere $5$ tanedir.
2. Tüm durumlar $36$ tane olduğundan olasılık $\dfrac{5}{36}$.

Diğer şıklar: **A** olası durumları $6$ saymak / **B** olası durumları $4$ saymak / **C** olası durumları $7$ saymak.$e$, 2),
  (60, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Cebirsel İfadeler ve Özdeşlikler$n$), $q$$(x + 4)(x - 4)$ ifadesinin eşiti aşağıdakilerden hangisidir?$q$, array[$o$$x^2 + 16$$o$, $o$$x^2 - 8x + 16$$o$, $o$$x^2 - 16$$o$, $o$$x^2 + 8x - 16$$o$], 2, $e$1. İki kare farkı özdeşliği: $(a + b)(a - b) = a^2 - b^2$.
2. Buna göre $(x + 4)(x - 4) = x^2 - 16$.

Diğer şıklar: **A** işareti yanlış almak / **B** tam kare açılımıyla karıştırmak / **D** iki ifadeyi karıştırmak.$e$, 1),
  (61, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Cebirsel İfadeler ve Özdeşlikler$n$), $q$$x - y = 4$ ve $x \cdot y = 12$ olduğuna göre $x^2 + y^2$ ifadesinin değeri kaçtır?$q$, array[$o$$16$$o$, $o$$40$$o$, $o$$28$$o$, $o$$52$$o$], 1, $e$1. $(x - y)^2 = x^2 - 2xy + y^2$ özdeşliğinden $x^2 + y^2 = (x - y)^2 + 2xy$ bulunur.
2. $4^2 + 2 \cdot 12 = 16 + 24 = 40$.

Diğer şıklar: **A** yalnızca farkın karesini almak / **C** çarpımı iki katı yerine bir kez eklemek / **D** işlemi yanlış kurmak.$e$, 3),
  (62, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Doğrusal Denklemler$n$), $q$$3x - y = 6$ denklemiyle verilen doğrunun eğimi kaçtır?$q$, array[$o$$-3$$o$, $o$$2$$o$, $o$$3$$o$, $o$$6$$o$], 2, $e$1. Denklem $y$ yalnız bırakılırsa $y = 3x - 6$ olur.
2. $x$ in katsayısı eğimdir, yani $3$.

Diğer şıklar: **A** işareti yanlış almak / **B** doğrunun $x$ eksenini kestiği noktayı almak / **D** sabit terimi eğim sanmak.$e$, 2),
  (63, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Doğrusal Denklemler$n$), $q$$x + y = 14$ ve $x - y = 4$ denklem sistemini sağlayan $x$ ve $y$ değerleri için $x \cdot y$ çarpımı kaçtır?$q$, array[$o$$20$$o$, $o$$45$$o$, $o$$36$$o$, $o$$56$$o$], 1, $e$1. Denklemler taraf tarafa toplanırsa $2x = 18$ ve $x = 9$ bulunur.
2. Buradan $y = 5$ olur. Çarpım $9 \cdot 5 = 45$.

Diğer şıklar: **A** toplam ve farkı çarpmak / **C** çarpımı yanlış hesaplamak / **D** yanlış değerleri çarpmak.$e$, 2),
  (64, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşitsizlikler$n$), $q$$-3x + 5 < 17$ eşitsizliğini sağlayan en küçük tam sayı değeri kaçtır?$q$, array[$o$$-12$$o$, $o$$-4$$o$, $o$$4$$o$, $o$$-3$$o$], 3, $e$1. $-3x < 12$ olur. Negatif sayıya bölünürken eşitsizlik yön değiştirir: $x > -4$.
2. $-4$ dahil olmadığı için en küçük tam sayı $-3$ tür.

Diğer şıklar: **A** bölme yapmadan sabit terimi almak / **B** eşitlik durumunu da dahil etmek / **C** eşitsizlik yönünü çevirmemek.$e$, 3),
  (65, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üçgenler$n$), $q$Dik kenar uzunlukları $9$ cm ve $12$ cm olan bir dik üçgenin hipotenüs uzunluğu kaç cm'dir?$q$, array[$o$$13$$o$, $o$$15$$o$, $o$$18$$o$, $o$$21$$o$], 1, $e$1. Pisagor teoremine göre $9^2 + 12^2 = 81 + 144 = 225$.
2. Hipotenüs $\sqrt{225} = 15$ cm.

Diğer şıklar: **A** kareleri hatalı toplamak / **C** yanlış kare kökü almak / **D** dik kenarları toplamak.$e$, 1),
  (66, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üçgenler$n$), $q$Kenar uzunlukları $7$ cm, $10$ cm ve $x$ cm olan bir üçgende $x$ uzunluğu kaç farklı tam sayı değeri alabilir?$q$, array[$o$$11$$o$, $o$$12$$o$, $o$$14$$o$, $o$$13$$o$], 3, $e$1. Üçgen eşitsizliğine göre $10 - 7 < x < 10 + 7$ olmalıdır, yani $3 < x < 17$.
2. Tam sayı değerleri $4$ ile $16$ arasındadır ve $13$ tanedir.

Diğer şıklar: **A** iki uç değeri dışarıda bırakmak / **B** bir uç değeri dışarıda bırakmak / **C** bir uç değeri fazladan saymak.$e$, 2),
  (67, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşlik ve Benzerlik$n$), $q$ABC üçgeni ile DEF üçgeni benzerdir. $|AB| = 6$ cm, $|DE| = 9$ cm ve $|BC| = 8$ cm olduğuna göre $|EF|$ kaç cm'dir?$q$, array[$o$$5{,}33$$o$, $o$$11$$o$, $o$$12$$o$, $o$$14$$o$], 2, $e$1. Benzerlik oranı $\dfrac{|DE|}{|AB|} = \dfrac{9}{6} = \dfrac{3}{2}$ dir.
2. $|EF| = 8 \cdot \dfrac{3}{2} = 12$ cm.

Diğer şıklar: **A** oranı ters kurmak / **B** farkı toplamak / **D** yanlış oran kurmak.$e$, 1),
  (68, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşlik ve Benzerlik$n$), $q$İki benzer üçgenin benzerlik oranı $\dfrac{2}{3}$ tür. Küçük üçgenin alanı $24$ cm$^2$ ise büyük üçgenin alanı kaç cm$^2$'dir?$q$, array[$o$$54$$o$, $o$$36$$o$, $o$$48$$o$, $o$$72$$o$], 0, $e$1. Benzer şekillerde alanlar oranı, benzerlik oranının karesidir: $\dfrac{4}{9}$.
2. $\dfrac{24}{A} = \dfrac{4}{9}$ olduğundan $A = 54$ cm$^2$.

Diğer şıklar: **B** alan oranını oran ile aynı almak / **C** alanı iki katı almak / **D** oranı ters kurmak.$e$, 3),
  (69, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Dönüşüm Geometrisi$n$), $q$$A(3, -2)$ noktasının $x$ eksenine göre yansımasının koordinatları aşağıdakilerden hangisidir?$q$, array[$o$$(-3, -2)$$o$, $o$$(-3, 2)$$o$, $o$$(3, 2)$$o$, $o$$(2, 3)$$o$], 2, $e$1. $x$ eksenine göre yansımada apsis aynı kalır, ordinatın işareti değişir.
2. $(3, -2)$ noktasının yansıması $(3, 2)$ olur.

Diğer şıklar: **A** $y$ eksenine göre yansımayı almak / **B** orijine göre yansımayı almak / **D** koordinatların yerini değiştirmek.$e$, 1),
  (70, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Geometrik Cisimler$n$), $q$Taban yarıçapı $3$ cm, yüksekliği $5$ cm olan bir dik dairesel silindirin hacmi kaç cm$^3$'tür? ($\pi = 3$ alınız.)$q$, array[$o$$45$$o$, $o$$135$$o$, $o$$90$$o$, $o$$405$$o$], 1, $e$1. Silindirin hacmi $V = \pi r^2 h$ dır.
2. $V = 3 \cdot 3^2 \cdot 5 = 135$ cm$^3$.

Diğer şıklar: **A** tabanın yarıçapını yüksekliğiyle çarpmak / **C** yarıçapı kareye almamak / **D** yarıçapın küpünü almak.$e$, 2),
  (71, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Güney Yarım Küre'de yaz mevsimi yaşanırken Türkiye'de hangi mevsim yaşanır?$q$, array[$o$Yaz$o$, $o$Kış$o$, $o$İlkbahar$o$, $o$Sonbahar$o$], 1, $e$1. Yarım kürelerde mevsimler zıt yaşanır.
2. Güney Yarım Küre'de yaz iken Kuzey Yarım Küre'de kış yaşanır.

Diğer şıklar: **A** iki yarım küredeki mevsimleri aynı sanmak / **C** mevsimleri karıştırmak / **D** mevsimleri karıştırmak.$e$, 1),
  (72, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Aşağıdakilerden hangisi bir yerin iklim özelliğine örnektir?$q$, array[$o$Dün gün boyunca İzmir'de kuvvetli sağanak yağış görülmesi$o$, $o$Bu sabah İstanbul'un yoğun bir sisle kaplanmış olması$o$, $o$Hafta sonu Ankara'da rüzgârın giderek artacak olması$o$, $o$Akdeniz kıyılarında yazların sıcak, kışların yağışlı geçmesi$o$], 3, $e$1. İklim, bir yerde uzun yıllar boyunca gözlenen hava olaylarının ortalamasıdır.
2. Diğer seçenekler kısa süreli hava durumunu anlatır.

Diğer şıklar: **A** kısa süreli hava durumunu iklim sanmak / **B** kısa süreli hava durumunu iklim sanmak / **C** tahmini iklim sanmak.$e$, 2),
  (73, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Dünya'nın dönme ekseni yörünge düzlemine tam dik olsaydı aşağıdakilerden hangisi gerçekleşirdi?$q$, array[$o$Gece ile gündüz süreleri yıl boyunca değişirdi.$o$, $o$Kutuplarda yaz mevsimi çok uzun süre devam ederdi.$o$, $o$Mevsimler oluşmaz, yıl boyu benzer koşullar yaşanırdı.$o$, $o$Güneş ışınları Ekvator'a hiçbir zaman dik gelmezdi.$o$], 2, $e$1. Mevsimler eksen eğikliği nedeniyle oluşur.
2. Eksen dik olsaydı Güneş ışınlarının geliş açısı yıl boyu değişmez ve mevsimler oluşmazdı.

Diğer şıklar: **A** mevsimin ve gece-gündüz süresinin nedenini karıştırmak / **B** eksen eğikliğinin etkisini yok saymamak / **D** ışınların açısını yanlış yorumlamak.$e$, 3),
  (74, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Aşağıdakilerden hangisi DNA'nın görevlerinden biridir?$q$, array[$o$Oksijeni dokulara taşımak$o$, $o$Hücrede enerji üretmek$o$, $o$Besinleri küçük parçalara ayırmak$o$, $o$Canlının kalıtsal bilgisini taşımak$o$], 3, $e$1. DNA, canlıya ait kalıtsal bilgiyi taşıyan moleküldür.

Diğer şıklar: **A** kandaki görevle karıştırmak / **B** mitokondrinin görevini seçmek / **C** sindirim görevini seçmek.$e$, 1),
  (75, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Genetik bilgide meydana gelen ve sonraki nesillere aktarılabilen ani değişikliğe ne ad verilir?$q$, array[$o$Modifikasyon$o$, $o$Mutasyon$o$, $o$Adaptasyon$o$, $o$Seçilim$o$], 1, $e$1. DNA dizisindeki kalıcı değişikliğe mutasyon denir.
2. Mutasyon kalıtsal olduğu için sonraki nesillere aktarılabilir.

Diğer şıklar: **A** çevre etkisiyle oluşan, aktarılmayan değişikliği seçmek / **C** uyum kavramıyla karıştırmak / **D** doğal seçilim kavramıyla karıştırmak.$e$, 2),
  (76, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Aa genotipli bir bireyle aa genotipli bir bireyin çaprazlanmasından oluşan yavrulardan aa genotipli olma olasılığı yüzde kaçtır?$q$, array[$o$%50$o$, $o$%25$o$, $o$%75$o$, $o$%100$o$], 0, $e$1. Aa bireyi A ve a, aa bireyi yalnızca a gametleri üretir.
2. Yavruların yarısı Aa, yarısı aa olur. Dolayısıyla aa olasılığı %50 dir.

Diğer şıklar: **B** oranı dörtte bir sanmak / **C** baskın fenotip oranını almak / **D** tüm yavruların çekinik olacağını sanmak.$e$, 2),
  (77, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Bir yüzücü havuzda daha derine daldıkça üzerine etki eden sıvı basıncı nasıl değişir?$q$, array[$o$Artar.$o$, $o$Azalır.$o$, $o$Değişmez.$o$, $o$Önce artar sonra azalır.$o$], 0, $e$1. Sıvı basıncı derinlik arttıkça artar.

Diğer şıklar: **B** ilişkiyi ters kurmak / **C** derinliğin etkisini yok saymak / **D** basıncın derinlikle değiştiğini yanlış yorumlamak.$e$, 1),
  (78, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Bir cisme dik olarak $400$ N kuvvet uygulanıyor ve kuvvetin etki ettiği yüzey $0{,}2$ m$^2$ dir.

Buna göre cismin yüzeyine uyguladığı basınç kaç Pa'dır?$q$, array[$o$$80$$o$, $o$$200$$o$, $o$$2000$$o$, $o$$20000$$o$], 2, $e$1. $P = \dfrac{F}{A} = \dfrac{400}{0{,}2} = 2000$ Pa.

Diğer şıklar: **A** çarpmak / **B** bir sıfırı eksik yazmak / **D** bir sıfırı fazla yazmak.$e$, 2),
  (79, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Tabanları farklı genişlikte, eşit yükseklikte aynı sıvıyla doldurulmuş iki kabın tabanındaki sıvı basıncı için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Geniş tabanlı kapta basınç daha büyüktür.$o$, $o$Basınçlar eşittir.$o$, $o$Dar tabanlı kapta basınç daha büyüktür.$o$, $o$Hangisinin büyük olduğu belirlenemez.$o$], 1, $e$1. Sıvı basıncı $P = h \cdot d \cdot g$ bağıntısıyla bulunur.
2. Yükseklik ve sıvı aynı olduğundan kabın şekli ve taban genişliği basıncı değiştirmez.

Diğer şıklar: **A** kap genişliğini basınca etki eder sanmak / **C** kap genişliğini basınca etki eder sanmak / **D** bilgiyi yetersiz sanmak.$e$, 3),
  (80, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$Aşağıdakilerden hangisi kimyasal değişime örnektir?$q$, array[$o$Buzun erimesi$o$, $o$Suyun buharlaşması$o$, $o$Demirin paslanması$o$, $o$Şekerin suda çözünmesi$o$], 2, $e$1. Demir paslanınca yeni bir madde oluşur, bu yüzden kimyasal değişimdir.
2. Diğerlerinde maddenin cinsi değişmez.

Diğer şıklar: **A** fiziksel değişimi seçmek / **B** fiziksel değişimi seçmek / **D** fiziksel değişimi seçmek.$e$, 1),
  (81, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$Periyodik sistemde aynı grupta yer alan elementler için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Atom numaraları aynıdır.$o$, $o$Kimyasal özellikleri benzerdir.$o$, $o$Kütle numaraları eşittir.$o$, $o$Aynı fiziksel hâlde bulunurlar.$o$], 1, $e$1. Aynı grupta bulunan elementlerin son katmandaki elektron sayıları aynıdır.
2. Bu nedenle kimyasal özellikleri birbirine benzer.

Diğer şıklar: **A** grup ile atom numarasını karıştırmak / **C** grup ile kütle numarasını karıştırmak / **D** benzerliği fiziksel hâl sanmak.$e$, 2),
  (82, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$pH değeri $10$ olan bir çözelti kırmızı turnusol kâğıdına nasıl etki eder?$q$, array[$o$Kırmızı turnusolun rengini değiştirmez.$o$, $o$Mavi turnusolu kırmızıya çevirir.$o$, $o$Kırmızı turnusolu maviye çevirir.$o$, $o$Her iki turnusolu da kırmızı yapar.$o$], 2, $e$1. pH değeri $7$ den büyükse çözelti baziktir.
2. Bazlar kırmızı turnusolu maviye çevirir.

Diğer şıklar: **A** pH değerini nötr yorumlamak / **B** asit-baz etkisini ters kurmak / **D** yanlış genelleme yapmak.$e$, 2),
  (83, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$Hidrojen ile oksijen kütlece $1 : 8$ oranında birleşerek su oluşturur. $2$ g hidrojen ile $24$ g oksijen tepkimeye girerse en fazla kaç g su oluşur?$q$, array[$o$$18$$o$, $o$$16$$o$, $o$$24$$o$, $o$$26$$o$], 0, $e$1. $2$ g hidrojen için $2 \cdot 8 = 16$ g oksijen gerekir.
2. Oksijenden $24 - 16 = 8$ g artar. Oluşan su $2 + 16 = 18$ g olur.

Diğer şıklar: **B** yalnızca gereken oksijeni yazmak / **C** yalnızca oksijenin kütlesini almak / **D** bütün maddenin tepkimeye girdiğini sanmak.$e$, 3),
  (84, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$), $q$Sabit makara için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Kuvvetten kazanç sağlar, yönü ise değiştirmez.$o$, $o$Hem yönü değiştirir hem de kuvveti yarıya indirir.$o$, $o$Yük ve kuvvetin yönü her zaman aynı kalır.$o$, $o$Yalnızca kuvvetin yönünü değiştirir.$o$], 3, $e$1. Sabit makarada kuvvet yüke eşittir.
2. Yalnızca kuvvetin yönü değişir.

Diğer şıklar: **A** sabit ve hareketli makarayı karıştırmak / **B** sabit makarada kazanç olduğunu sanmak / **C** yön değişimini yok saymak.$e$, 1),
  (85, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$), $q$Ağırlığı $100$ N olan bir yük ağırlığı önemsiz tek bir hareketli makarayla kaldırılıyor.

Buna göre yükü dengede tutmak için kaç N kuvvet uygulanmalıdır?$q$, array[$o$$25$$o$, $o$$50$$o$, $o$$100$$o$, $o$$200$$o$], 1, $e$1. Hareketli makara kuvvetten $2$ kat kazanç sağlar.
2. Kuvvet $100 \div 2 = 50$ N olur.

Diğer şıklar: **A** kazancı dört katı sanmak / **C** kazancı yok saymak / **D** kuvveti iki katı almak.$e$, 2),
  (86, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$), $q$Bir hidroelektrik santralde elektrik üretilirken enerji dönüşümleri aşağıdakilerden hangisi gibi gerçekleşir?$q$, array[$o$Isı enerjisi, kinetik enerji, elektrik enerjisi$o$, $o$Kimyasal enerji, ısı enerjisi, elektrik enerjisi$o$, $o$Işık enerjisi, kimyasal enerji, elektrik enerjisi$o$, $o$Potansiyel enerji, kinetik enerji, elektrik enerjisi$o$], 3, $e$1. Barajdaki suyun yüksekliğinden gelen çekim potansiyel enerjisi akarken kinetik enerjiye dönüşür.
2. Türbini döndüren kinetik enerji elektrik enerjisine çevrilir.

Diğer şıklar: **A** termik santral ile karıştırmak / **B** fosil yakıtla karıştırmak / **C** güneş enerjisiyle karıştırmak.$e$, 2),
  (87, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$), $q$Aşağıdakilerden hangisi yenilenebilir enerji kaynağıdır?$q$, array[$o$Kömür$o$, $o$Doğal gaz$o$, $o$Petrol$o$, $o$Rüzgâr$o$], 3, $e$1. Rüzgâr enerjisi doğada kendiliğinden yenilenir.
2. Diğerleri tükenebilen fosil yakıtlardır.

Diğer şıklar: **A** fosil yakıtı seçmek / **B** fosil yakıtı seçmek / **C** fosil yakıtı seçmek.$e$, 1),
  (88, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$), $q$Bir gölde alg, küçük balık, büyük balık ve balıkçıl kuşundan oluşan bir besin zinciri vardır. Göle karışan zehirli bir kimyasal canlılarda birikmektedir.

Buna göre kimyasalın en yüksek yoğunlukta bulunacağı canlı hangisidir?$q$, array[$o$Alg$o$, $o$Balıkçıl kuşu$o$, $o$Küçük balık$o$, $o$Büyük balık$o$], 1, $e$1. Zehirli maddeler besin zincirinde basamaktan basamağa aktarılırken birikir.
2. Zincirin en üstündeki canlıda en yüksek yoğunluğa ulaşır.

Diğer şıklar: **A** zincirin başındaki canlıyı seçmek / **C** ikinci basamağı seçmek / **D** bir alt basamağı seçmek.$e$, 2),
  (89, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$), $q$Yüksüz bir elektroskobun topuzuna pozitif yüklü bir cisim dokundurulduğunda yaprakları açılıyor.

Bu durumun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Yapraklar zıt yükle yüklenip birbirini çeker.$o$, $o$Yapraklar nötr kalıp ağırlaşır.$o$, $o$Yapraklardaki proton sayısı azalır.$o$, $o$Yapraklar aynı cins yükle yüklenip birbirini iter.$o$], 3, $e$1. Dokunma ile yüklenmede elektroskop, cisimle aynı cins yükle yüklenir.
2. Yapraklar aynı cins yük taşıdıkları için birbirini iter ve açılır.

Diğer şıklar: **A** itme ve çekmeyi karıştırmak / **B** yükün geçtiğini yok saymak / **C** protonların yer değiştirdiğini sanmak.$e$, 2),
  (90, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$), $q$Gücü $2000$ W olan bir ütü $30$ dakika çalıştırılıyor.

Buna göre ütünün harcadığı elektrik enerjisi kaç kWh'dir?$q$, array[$o$$0{,}5$$o$, $o$$2$$o$, $o$$60$$o$, $o$$1$$o$], 3, $e$1. Güç $2000$ W $= 2$ kW dır.
2. Süre $30$ dakika $= 0{,}5$ saattir.
3. $E = 2 \cdot 0{,}5 = 1$ kWh.

Diğer şıklar: **A** gücü kilowatta çevirmemek / **B** süreyi saat sanmak / **C** birimleri dönüştürmemek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

