-- 20261025090000_questions_lgs_ink. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-ink | Bir Kahraman Doğuyor konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Bir Kahraman Doğuyor konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Bir Kahraman Doğuyor$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$Mustafa Kemal hangi şehirde dünyaya gelmiştir?$q$, array[$o$İstanbul$o$, $o$Selanik$o$, $o$Manastır$o$, $o$Ankara$o$], 1, $e$1. Mustafa Kemal 1881'de Selanik'te doğmuştur.
2. Manastır'da askeri idadide, İstanbul'da Harp Okulu'nda okumuştur.

Diğer şıklar: **A** Harp Okulu'nun bulunduğu şehri doğum yeri sanmak / **C** okuduğu askeri idadinin şehri ile karıştırmak / **D** Cumhuriyet'in başkentini doğum yeri sanmak.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Mustafa Kemal'e "Kemal" adını veren kişi aşağıdakilerden hangisidir?$q$, array[$o$Babası Ali Rıza Efendi$o$, $o$Edebiyat öğretmeni Ömer Naci$o$, $o$Tarih öğretmeni Mehmet Tevfik Bey$o$, $o$Matematik öğretmeni Mustafa Sabri Bey$o$], 3, $e$1. Selanik Askeri Rüştiyesi'nde matematik öğretmeni Mustafa Sabri Bey, onun başarısını görünce adına "Kemal" adını ekledi.
2. Ömer Naci edebiyat ve hitabet alanında arkadaşıydı, Mehmet Tevfik Bey tarih öğretmeniydi.

Diğer şıklar: **A** adı babasının verdiğini sanmak / **B** Ömer Naci'yi öğretmeni sanmak / **C** tarih öğretmeniyle karıştırmak.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Avrupa'da Osmanlı Devleti'ni etkileyen Fransız İhtilali'nin yaydığı bir fikirdir?$q$, array[$o$Sömürgecilik$o$, $o$Milliyetçilik$o$, $o$Teokrasi$o$, $o$Feodalite$o$], 1, $e$1. Fransız İhtilali milliyetçilik, eşitlik, özgürlük ve adalet fikirlerini yaydı.
2. Sömürgecilik ise Sanayi İnkılabı'nın ham madde ve pazar ihtiyacıyla hızlandı.

Diğer şıklar: **A** Sanayi İnkılabı'nın sonucunu ihtilalin fikri sanmak / **C** ihtilalin getirdiği fikre ters bir kavram seçmek / **D** ihtilalin kaldırdığı düzeni fikir sanmak.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$1906'da Şam'da Mustafa Kemal'in arkadaşlarıyla kurduğu cemiyet aşağıdakilerden hangisidir?$q$, array[$o$Kilikyalılar Cemiyeti$o$, $o$Vatan ve Hürriyet Cemiyeti$o$, $o$Redd-i İlhak Cemiyeti$o$, $o$Trakya-Paşaeli Müdafaa-i Hukuk Cemiyeti$o$], 1, $e$1. Mustafa Kemal 1906'da Şam'da Vatan ve Hürriyet Cemiyeti'ni kurdu.
2. Diğer cemiyetler Mondros'tan sonra işgallere karşı kuruldu.

Diğer şıklar: **A** Milli Mücadele dönemi cemiyetiyle karıştırmak / **C** Milli Mücadele dönemi cemiyetiyle karıştırmak / **D** Milli Mücadele dönemi cemiyetiyle karıştırmak.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Mustafa Kemal'in Şemsi Efendi Okulu'na gönderilmesi, ailesinin hangi özelliğini göstermektedir?$q$, array[$o$Yeni eğitim yöntemlerine açık olduğunu$o$, $o$Ekonomik olarak çok zengin olduğunu$o$, $o$Askeri eğitime karşı olduğunu$o$, $o$Selanik'ten ayrılmak istediğini$o$], 0, $e$1. Şemsi Efendi Okulu yeni yöntemlerle eğitim veren bir okuldu.
2. Babasının bu tercihi, ailenin yeniliğe açık olduğunu gösterir.

Diğer şıklar: **B** okul tercihini zenginlikle açıklamak / **C** okul seçimini askerlik karşıtlığı sanmak / **D** okul tercihini göç isteğiyle açıklamak.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$Mustafa Kemal'in Selanik Askeri Rüştiyesi'ne annesi istemediği hâlde sınava girmesi, onun aşağıdaki özelliklerinden hangisini gösterir?$q$, array[$o$Her konuda annesine karşı çıktığını$o$, $o$Çalışmaya ilgisi olmadığını$o$, $o$Kararlarında başkalarına bağlı olduğunu$o$, $o$Kararlı ve bağımsız olduğunu$o$], 3, $e$1. Annesi istemediği hâlde kendi isteğiyle askeri okula girmesi kararlı ve bağımsız bir kişiliğe işaret eder.
2. Tek bir olaydan her konuda karşı çıktığı sonucu çıkarılamaz.

Diğer şıklar: **A** tek bir olayı genellemek / **B** özelliği yanlış yorumlamak / **C** özelliği ters yorumlamak.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Sanayi İnkılabı sonrasında Avrupa devletlerinin sömürgecilik politikasına yönelmesinin temel nedeni aşağıdakilerden hangisidir?$q$, array[$o$Ham madde ve pazar ihtiyacının artması$o$, $o$Nüfusun azalması ve işçi ihtiyacı$o$, $o$Dinî görüşlerin yayılma isteği$o$, $o$Anayasal yönetimin kurulması$o$], 0, $e$1. Fabrikalar çok mal üretiyordu ve bunun için ham madde ile pazar gerekiyordu.
2. Bu ihtiyaç Avrupa devletlerini sömürge aramaya yöneltti.

Diğer şıklar: **B** nüfus artışını nedeni sanmak / **C** ekonomik nedeni dinî sanmak / **D** ilgisiz bir gelişmeyi neden saymak.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Osmanlı Devleti'nde II. Meşrutiyet hangi yıl ilan edilmiştir?$q$, array[$o$1839$o$, $o$1876$o$, $o$1908$o$, $o$1909$o$], 2, $e$1. I. Meşrutiyet 1876'da, II. Meşrutiyet 1908'de ilan edildi.
2. Tanzimat Fermanı 1839, 31 Mart Olayı ise 1909'dadır.

Diğer şıklar: **A** Tanzimat Fermanı'nın yılını yazmak / **B** I. Meşrutiyet'in yılını yazmak / **D** 31 Mart Olayı'nın yılını yazmak.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Mustafa Kemal'in Trablusgarp Savaşı sırasında Mısır üzerinden gizlice bölgeye geçmesi, aşağıdaki özelliklerinden hangisine örnektir?$q$, array[$o$Vatanseverlik ve fedakârlık$o$, $o$Yeniliğe açıklık$o$, $o$Ordunun siyasetten uzak durmasını savunması$o$, $o$Edebiyata ilgi$o$], 0, $e$1. Osmanlı'nın bölgeye asker göndermesi zorken Mustafa Kemal gazeteci kimliğiyle gizlice gitti.
2. Bu davranış vatanseverlik, cesaret ve fedakârlığı gösterir.

Diğer şıklar: **B** Sofya gözlemlerindeki özelliği seçmek / **C** başka bir olaya dair özelliği seçmek / **D** okul yıllarındaki özelliği seçmek.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Sofya'da askeri ataşe olarak bulunan Mustafa Kemal'in Bulgaristan'ın meclisini ve toplum hayatını gözlemlemesinin sonucu için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Askerlik görevinden istifa etmesine yol açmıştır.$o$, $o$Osmanlı'nın savaşa girmesini sağlamıştır.$o$, $o$Balkan Savaşları'nın bitmesine neden olmuştur.$o$, $o$Yeni devlete ilişkin fikirlerini zenginleştirmiştir.$o$], 3, $e$1. Sofya'daki gözlemleri ileride kuracağı yeni devlete dair fikirlerini zenginleştirdi.
2. Diğer sonuçlar bu gözlemle ilişkili değildir.

Diğer şıklar: **A** gözlemin sonucunu yanlış bağlamak / **B** gözlemin sonucunu yanlış bağlamak / **C** gözlemin sonucunu yanlış bağlamak.$e$, 2),
  (11, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda Mustafa Kemal'in bazı okul yıllarına ilişkin bilgiler verilmiştir.

| Okul | Yıl | Onun hakkında ne söyler? |
| --- | --- | --- |
| Selanik Askeri Rüştiyesi | 1893 | Kendi kararını verdi, matematikte çok başarılıydı. |
| Manastır Askeri İdadisi | 1896 | Edebiyata, tarihe ve hitabete ilgi duydu. |
| İstanbul Harp Okulu | 1899 | 1902'de teğmen olarak mezun oldu. |

Bu tabloya göre aşağıdaki çıkarımlardan hangisi yapılabilir?$q$, array[$o$Önce Harp Okulu'na, sonra Selanik Askeri Rüştiyesi'ne gitmiştir.$o$, $o$Matematiğe hiç ilgi duymamış, yalnızca edebiyata yönelmiştir.$o$, $o$Manastır yıllarının, etkili konuşmacılığında payı vardır.$o$, $o$Teğmen olarak mezun olduğu yıl, tabloda 1893 olarak verilmiştir.$o$], 2, $e$1. Manastır'da edebiyata, tarihe ve hitabete ilgi duydu. Bu ilgi etkili konuşmalar yapan bir lider olmasına katkı sağlamıştır.
2. Sıralama Selanik, Manastır, Harp Okulu şeklindedir ve mezuniyet yılı 1902'dir.

Diğer şıklar: **A** kronolojiyi ters okumak / **B** tablodaki bilgiyi yanlış okumak / **D** yılları karıştırmak.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$Mustafa Kemal, 31 Mart Olayı'nı bastıran orduya Hareket Ordusu adını vermiş ve ordunun siyasete karışmaması gerektiğini savunmuştur.

Bu bilgilerden hareketle Mustafa Kemal için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Siyasetle hiç ilgilenmemiş, yalnızca askerlikle uğraşmıştır.$o$, $o$Meşrutiyet yönetimine karşı çıkan bir subaydır.$o$, $o$Öncülük yapan ve ilkeli davranan bir subaydır.$o$, $o$Ordusuz hareket etmeyi tercih eden bir subaydır.$o$], 2, $e$1. Orduya ad vermesi öncülük ve sorumluluk almayı, siyasete karışılmaması gerektiğini savunması ise ilkeli olmayı gösterir.
2. 31 Mart Olayı meşrutiyete karşı bir ayaklanmaydı ve bastırılmasında yer aldı.

Diğer şıklar: **A** tek bir tutumu her duruma genellemek / **B** olayın yönünü ters yorumlamak / **D** bilgiyle ilgisiz çıkarım yapmak.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Aşağıdaki olaylar eskiden yeniye doğru sıralanacaktır:

I. Trablusgarp Savaşı
II. Hareket Ordusu'nun İstanbul'a gelmesi
III. Sofya'da ataşemiliterlik
IV. Balkan Savaşları

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$I, II, III, IV$o$, $o$II, III, I, IV$o$, $o$I, IV, II, III$o$, $o$II, I, IV, III$o$], 3, $e$1. Hareket Ordusu 1909, Trablusgarp Savaşı 1911, Balkan Savaşları 1912-1913 ve Sofya ataşemiliterliği 1913'tür.
2. Sıralama II, I, IV, III olur.

Diğer şıklar: **A** yılları karıştırmak / **B** yılları karıştırmak / **C** yılları karıştırmak.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$Mustafa Kemal'in Trablusgarp'ta yerel halkı örgütleyerek savaşması, ileriki yıllarda aşağıdaki gelişmelerden hangisinde ona deneyim sağlamıştır?$q$, array[$o$Latin harflerinin kabulünde$o$, $o$Milli Mücadele'de halkı örgütlemesinde$o$, $o$Montrö Sözleşmesi'nin imzalanmasında$o$, $o$Çok partili hayata geçişte$o$], 1, $e$1. Yerel halkı örgütleme deneyimi Milli Mücadele'de halkı örgütlerken işe yaradı.
2. Diğer gelişmeler bu deneyimle doğrudan ilişkili değildir.

Diğer şıklar: **A** ilgisiz bir inkılabı seçmek / **C** ilgisiz bir gelişmeyi seçmek / **D** ilgisiz bir gelişmeyi seçmek.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Milliyetçilik fikrinin yayılması, Osmanlı Devleti için diğer devletlere kıyasla daha büyük bir tehlike oluşturmuştur.

Bu durumun temel nedeni aşağıdakilerden hangisidir?$q$, array[$o$Osmanlı'nın tek millete dayanması$o$, $o$Osmanlı'da hiç aydın bulunmaması$o$, $o$Çok sayıda millete sahip olması$o$, $o$Osmanlı'nın sömürge sahibi olması$o$], 2, $e$1. Her millet kendi devletini kurmalı düşüncesi, içinde pek çok milleti barındıran Osmanlı'yı parçalayabilirdi.
2. Sırplar 1804'te isyan etti, Yunanistan 1830'da bağımsız oldu.

Diğer şıklar: **A** devletin yapısını yanlış bilmek / **B** ilgisiz bir neden uydurmak / **D** ilgisiz bir neden uydurmak.$e$, 3),
  (16, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Mustafa Kemal'in okuduğu Aydınlanma düşünürlerinden biridir?$q$, array[$o$Voltaire$o$, $o$Namık Kemal$o$, $o$Tevfik Fikret$o$, $o$Ziya Gökalp$o$], 0, $e$1. Mustafa Kemal Fransızca öğrenerek Voltaire, Montesquieu ve Rousseau gibi Aydınlanma düşünürlerini okudu.
2. Namık Kemal, Tevfik Fikret ve Ziya Gökalp Osmanlı yazar ve düşünürleridir.

Diğer şıklar: **B** Osmanlı yazarını Aydınlanma düşünürü sanmak / **C** Osmanlı yazarını Aydınlanma düşünürü sanmak / **D** Osmanlı düşünürünü Aydınlanma düşünürü sanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$Osmanlı Devleti I. Dünya Savaşı'ndan sonra hangi antlaşmayı imzalayarak savaştan çekilmiştir?$q$, array[$o$Mondros Ateşkes Antlaşması$o$, $o$Sevr Barış Antlaşması$o$, $o$Mudanya Ateşkes Antlaşması$o$, $o$Lozan Barış Antlaşması$o$], 0, $e$1. Osmanlı Devleti 30 Ekim 1918'de Mondros Ateşkes Antlaşması'nı imzaladı.
2. Mudanya Ateşkesi 1922'de, Lozan 1923'te imzalandı.

Diğer şıklar: **B** ateşkesi barış antlaşmasıyla karıştırmak / **C** Kurtuluş Savaşı sonundaki ateşkesi seçmek / **D** Cumhuriyet dönemi antlaşmasını seçmek.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Mustafa Kemal Samsun'a hangi tarihte çıkmıştır?$q$, array[$o$15 Mayıs 1919$o$, $o$19 Mayıs 1919$o$, $o$22 Haziran 1919$o$, $o$23 Nisan 1920$o$], 1, $e$1. Mustafa Kemal 19 Mayıs 1919'da Samsun'a çıktı. Bu tarih Milli Mücadele'nin başlangıcı kabul edilir.
2. 15 Mayıs 1919 İzmir'in işgal tarihidir.

Diğer şıklar: **A** İzmir'in işgal tarihini yazmak / **C** Amasya Genelgesi'nin tarihini yazmak / **D** TBMM'nin açılış tarihini yazmak.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$İzmir'in Yunanistan tarafından işgal edildiği tarih aşağıdakilerden hangisidir?$q$, array[$o$19 Mayıs 1919$o$, $o$30 Ekim 1918$o$, $o$15 Mayıs 1919$o$, $o$16 Mart 1920$o$], 2, $e$1. İzmir 15 Mayıs 1919'da Yunanistan tarafından işgal edildi.
2. Samsun'a çıkış 19 Mayıs, İstanbul'un resmen işgali 16 Mart 1920'dir.

Diğer şıklar: **A** Samsun'a çıkış tarihini yazmak / **B** Mondros tarihini yazmak / **D** İstanbul'un işgal tarihini yazmak.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Aşağıdaki kongrelerden hangisi bölgesel nitelik taşır?$q$, array[$o$Sivas Kongresi$o$, $o$Lozan Konferansı$o$, $o$İzmir İktisat Kongresi$o$, $o$Erzurum Kongresi$o$], 3, $e$1. Erzurum Kongresi doğu illerinin temsilcilerinin katıldığı bölgesel bir kongredir.
2. Sivas Kongresi ise bütün yurdun temsilcilerinin katıldığı ulusal kongredir.

Diğer şıklar: **A** ulusal kongreyi bölgesel sanmak / **B** kongre olmayan bir toplantıyı seçmek / **C** Cumhuriyet dönemi kongresini seçmek.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Amasya Genelgesi'nde aşağıdakilerden hangisi ilk kez ilan edilmiştir?$q$, array[$o$Cumhuriyet'in kuruluşu$o$, $o$Saltanatın kaldırılması$o$, $o$Misak-ı Milli sınırları$o$, $o$Milli mücadelenin amacı$o$], 3, $e$1. Amasya Genelgesi (22 Haziran 1919), milli mücadelenin gerekçesini, amacını ve yöntemini ilk kez ortaya koydu.
2. Sivas'ta ulusal bir kongre toplanacağı da bu genelgeyle bildirildi.

Diğer şıklar: **A** genelgenin kapsamını yanlış bilmek / **B** genelgenin kapsamını yanlış bilmek / **C** genelgenin kapsamını yanlış bilmek.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$İzmir'in işgal edilmesi üzerine Anadolu'da halk protesto mitingleri düzenlemiştir.

Bu durum aşağıdakilerden hangisini gösterir?$q$, array[$o$Halkın işgali kabul ettiğini$o$, $o$Osmanlı hükümetinin işgali desteklediğini$o$, $o$İşgale karşı halkın tepki gösterdiğini$o$, $o$İşgalin hemen sona erdiğini$o$], 2, $e$1. Halk mitinglerle işgali protesto etti.
2. Bu, işgale karşı büyük bir tepkinin ve milli direnişin hızlandığının göstergesidir.

Diğer şıklar: **A** tepkiyi onay sanmak / **B** hükümetin tutumunu yanlış yorumlamak / **D** sonucu yanlış yorumlamak.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Sivas Kongresi'nde alınan kararlardan biri aşağıdakilerden hangisidir?$q$, array[$o$Saltanatın kaldırılması$o$, $o$Cemiyetlerin birleştirilmesi$o$, $o$Latin harflerinin kabulü$o$, $o$Musul'un Irak'a bırakılması$o$], 1, $e$1. Sivas Kongresi'nde bütün cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti adı altında birleştirildi.
2. Heyet-i Temsiliye de bu kongrede oluşturuldu.

Diğer şıklar: **A** Cumhuriyet dönemi kararını seçmek / **C** inkılabı kongre kararı sanmak / **D** 1926 gelişmesini seçmek.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Erzurum Kongresi'nde alınan "Manda ve himaye kabul edilemez." kararı, aşağıdakilerden hangisinin ifadesidir?$q$, array[$o$Yabancı yardımının kabul edileceğinin$o$, $o$Bağımsızlıktan taviz verilmeyeceğinin$o$, $o$Padişahın yetkilerinin artacağının$o$, $o$Ateşkesin devam edeceğinin$o$], 1, $e$1. Manda ve himaye, bir devletin başka bir devletin yönetimine girmesidir.
2. Bu karar, tam bağımsızlıktan taviz verilmeyeceğini gösterir.

Diğer şıklar: **A** manda anlamını ters yorumlamak / **C** kararın amacını yanlış bilmek / **D** kararın amacını yanlış bilmek.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Misak-ı Milli kararlarına tepki gösteren İtilaf devletleri hangi şehri resmen işgal etmiştir?$q$, array[$o$Ankara$o$, $o$Samsun$o$, $o$İstanbul$o$, $o$Erzurum$o$], 2, $e$1. Misak-ı Milli kabul edilince İtilaf devletleri 16 Mart 1920'de İstanbul'u resmen işgal etti.
2. Meclis-i Mebusan dağıldı ve TBMM Ankara'da açıldı.

Diğer şıklar: **A** başkenti işgal edilen şehir sanmak / **B** çıkış şehrini seçmek / **D** kongre şehrini seçmek.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Kuva-yi Milliye'nin özelliklerinden biridir?$q$, array[$o$Düşmanı oyalayıp zaman kazandırması$o$, $o$Padişah tarafından kurulmuş olması$o$, $o$Düzenli ve merkezden yönetilmesi$o$, $o$Yalnızca şehirlerde görev yapması$o$], 0, $e$1. Kuva-yi Milliye halkın gönüllülerden oluşan silahlı direnişiydi.
2. Düzenli ordu kurulana kadar düşmanı oyalayarak zaman kazandırdı.

Diğer şıklar: **B** kuruluş kaynağını yanlış bilmek / **C** düzenli ordunun özelliğini seçmek / **D** yayılışı yanlış bilmek.$e$, 2),
  (11, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda bazı milli cemiyetler ve kuruluş amaçları verilmiştir.

| Cemiyet | Amaç |
| --- | --- |
| Redd-i İlhak Cemiyeti | İzmir ve çevresinin Yunanistan'a bağlanmasına karşı çıkmak |
| Kilikyalılar Cemiyeti | Çukurova'nın işgaline karşı koymak |
| Doğu Anadolu Müdafaa-i Hukuk Cemiyeti | Doğu illerinin bir Ermeni devletine verilmesini engellemek |

Bu tabloya göre cemiyetlerle ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Tüm cemiyetler ülkenin tamamını savunur.$o$, $o$Tüm cemiyetler Cumhuriyet'i ilan etmeyi amaçlar.$o$, $o$Tüm cemiyetler padişahın emriyle kurulmuştur.$o$, $o$Bölgesel savunma amacı taşımışlardır.$o$], 3, $e$1. Tabloda her cemiyetin ayrı bir bölgenin savunması için kurulduğu görülür.
2. Bu bölgesel savunmalar Sivas Kongresi'yle tek çatı altında birleştirildi.

Diğer şıklar: **A** bölgesel niteliği görememek / **B** amacı yanlış okumak / **C** kuruluş kaynağını yanlış okumak.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$Aşağıdaki olaylar eskiden yeniye doğru sıralanacaktır:

I. Sivas Kongresi
II. Amasya Genelgesi
III. TBMM'nin açılışı
IV. Mustafa Kemal'in Samsun'a çıkışı

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$IV, II, I, III$o$, $o$II, IV, I, III$o$, $o$IV, I, II, III$o$, $o$IV, II, III, I$o$], 0, $e$1. Samsun'a çıkış 19 Mayıs 1919, Amasya Genelgesi 22 Haziran 1919, Sivas Kongresi Eylül 1919 ve TBMM'nin açılışı 23 Nisan 1920'dir.
2. Doğru sıralama IV, II, I, III olur.

Diğer şıklar: **B** ilk iki olayın sırasını karıştırmak / **C** genelge ile kongrenin sırasını karıştırmak / **D** kongre ile Meclis'in sırasını karıştırmak.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Amasya Görüşmeleri'nde İstanbul Hükümeti, Mustafa Kemal ve arkadaşlarını muhatap almıştır.

Bu durumun sonucu için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Heyet-i Temsiliye kapatılmıştır.$o$, $o$Milli hareket resmen tanınmıştır.$o$, $o$Milli Mücadele sona ermiştir.$o$, $o$Hükümet Ankara'ya taşınmıştır.$o$], 1, $e$1. Hükümetin Mustafa Kemal ve arkadaşlarını muhatap alması milli hareketi resmen tanıması anlamına gelir.
2. Diğer sonuçlar yaşanmamıştır.

Diğer şıklar: **A** görüşmenin sonucunu ters yorumlamak / **C** görüşmenin sonucunu abartmak / **D** ilgisiz bir sonuç uydurmak.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$Aşağıdaki ifadelerden hangisi Erzurum ve Sivas Kongreleri'nin ortak kararlarından biri olarak gösterilebilir?$q$, array[$o$Heyet-i Temsiliye'nin kurulması$o$, $o$Saltanatın kaldırılması$o$, $o$Manda ve himayenin reddedilmesi$o$, $o$Türk Dil Kurumu'nun kurulması$o$], 2, $e$1. Manda ve himaye Erzurum Kongresi'nde reddedildi, Sivas Kongresi'nde bir kez daha reddedildi.
2. Heyet-i Temsiliye yalnızca Sivas Kongresi'nde oluşturuldu.

Diğer şıklar: **A** yalnızca Sivas'a ait kararı ortak sanmak / **B** sonraki dönem kararını seçmek / **D** Cumhuriyet dönemi kararını seçmek.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Mondros Ateşkesi'nin 7. maddesi, itilaf devletlerine güvenliklerini tehdit eden durumlarda stratejik noktaları işgal etme hakkı vermiştir.

Bu madde sonrasında yaşanan gelişme aşağıdakilerden hangisidir?$q$, array[$o$Osmanlı ordusunun güçlenmesi$o$, $o$Boğazların Osmanlı'ya geçmesi$o$, $o$Milli cemiyetlerin kapatılması$o$, $o$Anadolu'da işgallerin hızlanması$o$], 3, $e$1. Bu madde işgallerin hukuki dayanağı gibi kullanıldı.
2. Orduların terhis edilmesiyle birlikte Anadolu savunmasız kaldı ve işgaller hızlandı.

Diğer şıklar: **A** maddenin etkisini ters yorumlamak / **B** maddenin etkisini ters yorumlamak / **C** ilgisiz bir sonuç uydurmak.$e$, 3),
  (16, 'lgs-ink', null::integer, $q$TBMM 23 Nisan 1920'de hangi şehirde açılmıştır?$q$, array[$o$Ankara$o$, $o$Sivas$o$, $o$İstanbul$o$, $o$Erzurum$o$], 0, $e$1. TBMM 23 Nisan 1920'de Ankara'da açıldı.
2. Mustafa Kemal Meclis Başkanı seçildi.

Diğer şıklar: **B** kongre şehrini seçmek / **C** eski başkenti seçmek / **D** kongre şehrini seçmek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Milli Bir Destan: Ya İstiklal Ya Ölüm konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Milli Bir Destan: Ya İstiklal Ya Ölüm konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Bir Destan: Ya İstiklal Ya Ölüm$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$TBMM'nin imzaladığı ilk uluslararası antlaşma aşağıdakilerden hangisidir?$q$, array[$o$Ankara Antlaşması$o$, $o$Gümrü Antlaşması$o$, $o$Mudanya Ateşkesi$o$, $o$Lozan Antlaşması$o$], 1, $e$1. Gümrü Antlaşması (3 Aralık 1920) Ermenilerle imzalandı ve TBMM'nin ilk uluslararası antlaşmasıdır.
2. Ankara Antlaşması 1921'de Fransa ile yapıldı.

Diğer şıklar: **A** Fransa ile yapılan antlaşmayı ilk sanmak / **C** daha sonraki bir ateşkesi seçmek / **D** daha sonraki barışı seçmek.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Düzenli ordunun kazandığı ilk zafer aşağıdakilerden hangisidir?$q$, array[$o$İkinci İnönü Muharebesi$o$, $o$Sakarya Meydan Muharebesi$o$, $o$Büyük Taarruz$o$, $o$Birinci İnönü Muharebesi$o$], 3, $e$1. Birinci İnönü (6-10 Ocak 1921) düzenli ordunun ilk zaferidir.
2. Sakarya savaşın dönüm noktasıdır, Büyük Taarruz ise son aşamadır.

Diğer şıklar: **A** ilk zaferi ikinci muharebe sanmak / **B** dönüm noktasını ilk zafer sanmak / **C** son taarruzu ilk zafer sanmak.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Zafer Bayramı olarak kutlanan 30 Ağustos tarihi hangi olayla ilgilidir?$q$, array[$o$Sakarya Meydan Muharebesi$o$, $o$Mudanya Ateşkesi$o$, $o$Başkomutanlık Meydan Muharebesi$o$, $o$Lozan Antlaşması$o$], 2, $e$1. 30 Ağustos 1922'de Dumlupınar'da Yunan ordusu kuşatıldı.
2. Bu zafer, Zafer Bayramı olarak kutlanır.

Diğer şıklar: **A** Sakarya'nın tarihini karıştırmak / **B** ateşkes tarihini karıştırmak / **D** barış tarihini karıştırmak.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Mustafa Kemal'e Mareşal rütbesi ve Gazi unvanını TBMM hangi muharebeden sonra vermiştir?$q$, array[$o$Birinci İnönü Muharebesi$o$, $o$Kütahya-Eskişehir Savaşları$o$, $o$Büyük Taarruz$o$, $o$Sakarya Meydan Muharebesi$o$], 3, $e$1. Sakarya Meydan Muharebesi'nin ardından 19 Eylül 1921'de TBMM Mustafa Kemal'e Mareşal rütbesi ve Gazi unvanı verdi.
2. Kütahya-Eskişehir yenilgisi ise Başkomutanlık yetkisinin verilmesine yol açtı.

Diğer şıklar: **A** rütbenin verildiği muharebeyi karıştırmak / **B** yenilgi sonrasını rütbe nedeni sanmak / **C** daha sonraki muharebeyi seçmek.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Doğu Cephesi'nde Ermenilere karşı savaşan ve Gümrü Antlaşması'nı imzalayan komutan aşağıdakilerden hangisidir?$q$, array[$o$İsmet İnönü$o$, $o$Fethi Okyar$o$, $o$Kâzım Karabekir$o$, $o$Çerkez Ethem$o$], 2, $e$1. Doğu'da Ermenilere karşı Kâzım Karabekir komutasındaki Doğu Ordusu savaştı.
2. İsmet Bey Batı Cephesi komutanıydı.

Diğer şıklar: **A** batı cephesi komutanıyla karıştırmak / **B** başka bir siyasi isim seçmek / **D** isyan eden birlik komutanını seçmek.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$Fransızlara karşı direnişleri nedeniyle Antep, Maraş ve Urfa'ya verilen unvanlar nedir?$q$, array[$o$Gazilik ve şehitlik$o$, $o$Mareşallik$o$, $o$Başkomutanlık$o$, $o$Kahramanlık nişanı$o$], 0, $e$1. Güney Cephesi'nde halk Kuva-yi Milliye ile birlikte kahramanca savaştı.
2. Bu direniş sonunda şehirlere gazilik ve şehitlik unvanları verildi: Gaziantep, Kahramanmaraş, Şanlıurfa.

Diğer şıklar: **B** unvanı kişiye ait sanmak / **C** unvanı kişiye ait sanmak / **D** var olmayan bir unvan seçmek.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Kütahya-Eskişehir Savaşları'ndan sonra Mustafa Kemal'e Başkomutanlık yetkisi verilmesi talebi güçlenmiştir.

Bu durumun nedeni aşağıdakilerden hangisidir?$q$, array[$o$Ordunun savaşı hemen bitirmek istemesi$o$, $o$Meclis'in dağıtılmak istenmesi$o$, $o$Savaşın tek elden yönetilmesi isteği$o$, $o$Yunan ordusunun geri çekilmesi$o$], 2, $e$1. Kütahya-Eskişehir'de ordu geri çekildi ve Meclis'te kaygı arttı.
2. Başkomutanlık ile ordunun tüm yetkisi tek elde toplandı ve savaş planlı yürütüldü.

Diğer şıklar: **A** talebin nedenini yanlış yorumlamak / **B** talebin nedenini yanlış yorumlamak / **D** gelişmeyi ters yorumlamak.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$"Hattı müdafaa yoktur, sathı müdafaa vardır. O satıh bütün vatandır." sözü hangi muharebe öncesinde söylenmiştir?$q$, array[$o$Birinci İnönü Muharebesi$o$, $o$İkinci İnönü Muharebesi$o$, $o$Başkomutanlık Meydan Muharebesi$o$, $o$Sakarya Meydan Muharebesi$o$], 3, $e$1. Bu söz Sakarya Meydan Muharebesi'nin stratejisini anlatır.
2. Muharebe 22 gün 22 gece sürmüştür.

Diğer şıklar: **A** söz ile muharebeyi karıştırmak / **B** söz ile muharebeyi karıştırmak / **C** söz ile muharebeyi karıştırmak.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Mudanya Ateşkes Antlaşması aşağıdakilerden hangisini göstermektedir?$q$, array[$o$Savaşın askerî olarak bittiğini$o$, $o$Savaşın yeni baştan başladığını$o$, $o$Lozan'ın imzalandığını$o$, $o$Cumhuriyet'in ilan edildiğini$o$], 0, $e$1. Mudanya Ateşkesi (11 Ekim 1922) Büyük Taarruz'un ardından imzalandı.
2. Doğu Trakya ve İstanbul'un Türklere geri verilmesi kabul edildi.

Diğer şıklar: **B** ateşkesin anlamını ters yorumlamak / **C** ateşkesi barış sanmak / **D** tarihleri karıştırmak.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Lozan Barış Antlaşması'nda aşağıdakilerden hangisi gerçekleşmemiştir?$q$, array[$o$Kapitülasyonların kaldırılması$o$, $o$Türkiye'nin bağımsız tanınması$o$, $o$Boğazlar'da tam askerî hak tanınması$o$, $o$Azınlık haklarının düzenlenmesi$o$], 2, $e$1. Lozan'da Boğazlar için bir rejim belirlendi ve bölge askerden arındırıldı.
2. Türkiye'nin Boğazlar'da tam askerî hakka kavuşması 1936 Montrö'yle olacaktır.

Diğer şıklar: **A** gerçekleşen kararı seçmek / **B** gerçekleşen kararı seçmek / **D** gerçekleşen kararı seçmek.$e$, 2),
  (11, 'lgs-ink', null::integer, $q$Düzenli ordunun kurulmasına karşı çıkan ve bu nedenle bastırılan isyanın lideri aşağıdakilerden hangisidir?$q$, array[$o$Çerkez Ethem$o$, $o$Hasan Tahsin$o$, $o$Nene Hatun$o$, $o$Kâzım Karabekir$o$], 0, $e$1. TBMM'nin düzenli ordu kararına Çerkez Ethem ve çevresindeki birlikler karşı çıktı.
2. Bu isyan bastırıldı ve düzenli ordu güçlendi.

Diğer şıklar: **B** ilk kurşunu atan gazeteciyle karıştırmak / **C** kadın kahramanı seçmek / **D** cephe komutanını seçmek.$e$, 2),
  (12, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda Kurtuluş Savaşı'ndaki bazı gelişmeler verilmiştir.

| Tarih | Olay |
| --- | --- |
| 26 Ağustos 1922 | Büyük Taarruz başladı. |
| 30 Ağustos 1922 | Yunan ordusu Dumlupınar'da kuşatıldı. |
| 9 Eylül 1922 | İzmir kurtuldu. |

Bu tabloya göre aşağıdaki çıkarımlardan hangisi yapılabilir?$q$, array[$o$Yunan ordusu taarruzdan önce kuşatılmıştır.$o$, $o$Yunan ordusu kısa sürede etkisiz kalmıştır.$o$, $o$İzmir, Dumlupınar'dan önce kurtuldu.$o$, $o$Taarruz 9 Eylül'de başlamıştır.$o$], 1, $e$1. Taarruz 26 Ağustos'ta başladı, 30 Ağustos'ta Yunan ordusu kuşatıldı ve 9 Eylül'de İzmir kurtuldu.
2. Olaylar kısa sürede peş peşe gelişmiştir.

Diğer şıklar: **A** kronolojiyi ters okumak / **C** kronolojiyi ters okumak / **D** tarihleri karıştırmak.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Mudanya Ateşkesi'nden sonra TBMM saltanatı kaldırmıştır.

Bu karar aşağıdaki sonuçlardan hangisine yol açmıştır?$q$, array[$o$Cumhuriyet'in o gün ilan edilmesine$o$, $o$Halifeliğin aynı gün kaldırılmasına$o$, $o$İstanbul'un işgal edilmesine$o$, $o$Hanedan yönetiminin bitmesine$o$], 3, $e$1. Saltanat 1 Kasım 1922'de kaldırıldı.
2. Bu, hanedan yönetiminin sona ermesi demektir. Cumhuriyet 29 Ekim 1923'te ilan edildi.

Diğer şıklar: **A** tarihleri karıştırmak / **B** tarihleri karıştırmak / **C** ilgisiz bir sonucu seçmek.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$Kütahya-Eskişehir Savaşları'nda geri çekilen ordu için Tekâlif-i Milliye Emirleri yayımlanmıştır.

Bu emirler aşağıdakilerden hangisini amaçlamıştır?$q$, array[$o$Ordunun terhis edilerek dağıtılmasını$o$, $o$Ordu ihtiyacının halktan karşılanmasını$o$, $o$Yabancı yardımın tamamen kesilmesini$o$, $o$Meclis'in kapatılıp dağıtılmasını$o$], 1, $e$1. Tekâlif-i Milliye Emirleri'yle halktan ordu için erzak, giyecek ve hayvan toplandı.
2. Böylece ordunun ihtiyaçları karşılanmaya çalışıldı.

Diğer şıklar: **A** emirlerin amacını ters yorumlamak / **C** ilgisiz bir amaç seçmek / **D** ilgisiz bir amaç seçmek.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Aşağıdaki ifadelerden hangisi Sakarya Meydan Muharebesi'nin sonucu olarak gösterilebilir?$q$, array[$o$Yunan ordusunun Ankara'yı alması$o$, $o$Ordunun taarruza geçmesi$o$, $o$Mondros Ateşkesi'nin imzalanması$o$, $o$Gümrü Antlaşması'nın imzalanması$o$], 1, $e$1. Sakarya'da Yunan ordusu geri atıldı.
2. Bu muharebe savaşın dönüm noktasıdır ve ordu sonrasında taarruz hazırlığı yaptı.

Diğer şıklar: **A** sonucu ters yorumlamak / **C** tarihleri karıştırmak / **D** tarihleri karıştırmak.$e$, 3),
  (16, 'lgs-ink', null::integer, $q$Aşağıdaki gelişmeler eskiden yeniye doğru sıralanacaktır:

I. Sakarya Meydan Muharebesi
II. Birinci İnönü Muharebesi
III. Mudanya Ateşkesi
IV. Kütahya-Eskişehir Savaşları

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$II, IV, I, III$o$, $o$II, I, IV, III$o$, $o$IV, II, I, III$o$, $o$II, IV, III, I$o$], 0, $e$1. Birinci İnönü 1921 Ocak, Kütahya-Eskişehir 1921 Temmuz, Sakarya 1921 Ağustos-Eylül ve Mudanya 1922 Ekim'dir.
2. Sıralama II, IV, I, III olur.

Diğer şıklar: **B** Sakarya ile Kütahya-Eskişehir'in sırasını karıştırmak / **C** ilk muharebeyi karıştırmak / **D** ateşkes ile muharebenin sırasını karıştırmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Atatürkçülük ve Çağdaşlaşan Türkiye konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Atatürkçülük ve Çağdaşlaşan Türkiye konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürkçülük ve Çağdaşlaşan Türkiye$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$Cumhuriyet hangi tarihte ilan edilmiştir?$q$, array[$o$1 Kasım 1922$o$, $o$29 Ekim 1923$o$, $o$23 Nisan 1920$o$, $o$3 Mart 1924$o$], 1, $e$1. Cumhuriyet 29 Ekim 1923'te ilan edildi ve Mustafa Kemal ilk Cumhurbaşkanı seçildi.
2. Saltanat 1 Kasım 1922'de, halifelik 3 Mart 1924'te kaldırıldı.

Diğer şıklar: **A** saltanatın kaldırıldığı tarihi yazmak / **C** TBMM'nin açıldığı tarihi yazmak / **D** halifeliğin kaldırıldığı tarihi yazmak.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Latin harflerinin kabul edildiği inkılap aşağıdakilerden hangisidir?$q$, array[$o$Şapka Kanunu$o$, $o$Soyadı Kanunu$o$, $o$Tevhid-i Tedrisat Kanunu$o$, $o$Harf İnkılabı$o$], 3, $e$1. Harf İnkılabı 1 Kasım 1928'de gerçekleşti ve Latin harfleri kabul edildi.
2. Amaç okuma yazmayı yaygınlaştırmaktı.

Diğer şıklar: **A** kıyafet inkılabını seçmek / **B** isimle ilgili inkılabı seçmek / **C** eğitimde birliği sağlayan kanunu seçmek.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Atatürk ilkelerinden hangisi, devletin özel girişimin yetersiz kaldığı alanlarda ekonomiye müdahale etmesini ifade eder?$q$, array[$o$Devletçilik$o$, $o$Halkçılık$o$, $o$Laiklik$o$, $o$Milliyetçilik$o$], 0, $e$1. Devletçilik, özel girişimin yetersiz kaldığı alanlarda devletin ekonomiye müdahalesidir.
2. Sümerbank ve beş yıllık sanayi planları bu ilkenin örnekleridir.

Diğer şıklar: **B** eşitlik ilkesini seçmek / **C** din-devlet ayrımını seçmek / **D** milli birlik ilkesini seçmek.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Soyadı Kanunu ile aşağıdakilerden hangisi amaçlanmıştır?$q$, array[$o$Okuma yazmayı yaygınlaştırmak$o$, $o$Sınıf ayrımını ve unvanları kaldırmak$o$, $o$Takvimi Avrupa ile uyumlu yapmak$o$, $o$Ekonomide planlı sanayiyi başlatmak$o$], 1, $e$1. Soyadı Kanunu (21 Haziran 1934) herkesin soyadı almasını zorunlu kıldı.
2. Bu, sınıf ayrımını ve unvanları kaldırdı.

Diğer şıklar: **A** harf inkılabının amacını seçmek / **C** takvim inkılabının amacını seçmek / **D** ekonomik inkılabın amacını seçmek.$e$, 2),
  (5, 'lgs-ink', null::integer, $q$Halifeliğin kaldırılması ve Tevhid-i Tedrisat Kanunu'nun kabulü hangi ilkeyle ilişkilendirilebilir?$q$, array[$o$Cumhuriyetçilik$o$, $o$Halkçılık$o$, $o$Devletçilik$o$, $o$Laiklik$o$], 3, $e$1. İkisi de 3 Mart 1924'te gerçekleşti ve din ile devlet işlerinin ayrılmasında önemli adımlardır.
2. Bu yüzden laiklik ilkesiyle ilişkilidir.

Diğer şıklar: **A** yönetim şekli ilkesini seçmek / **B** eşitlik ilkesini seçmek / **C** ekonomi ilkesini seçmek.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$Türk Tarih Kurumu ve Türk Dil Kurumu'nun kurulması hangi ilkeyle ilişkilendirilir?$q$, array[$o$Devletçilik$o$, $o$Halkçılık$o$, $o$Milliyetçilik$o$, $o$Cumhuriyetçilik$o$], 2, $e$1. Bu kurumlar Türk tarihini ve dilini bilimsel olarak inceleyerek milli kimliği güçlendirdi.
2. Bu nedenle milliyetçilik ilkesiyle ilişkilendirilir.

Diğer şıklar: **A** ilkeyi karıştırmak / **B** ilkeyi karıştırmak / **D** ilkeyi karıştırmak.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Kadınlara milletvekili seçme ve seçilme hakkının tanınması hangi yıldadır?$q$, array[$o$1926$o$, $o$1930$o$, $o$1934$o$, $o$1946$o$], 2, $e$1. Kadınlar 1930'da belediye seçimlerinde, 1934'te milletvekili seçme ve seçilme hakkını kazandı.
2. Medeni Kanun 1926'dadır.

Diğer şıklar: **A** Medeni Kanun'un yılını yazmak / **B** belediye seçimleri hakkının yılını yazmak / **D** çok partili hayata geçiş yılını yazmak.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Şapka Kanunu ile Harf İnkılabı ortak olarak hangi ilkeyle ilişkilendirilir?$q$, array[$o$Devletçilik$o$, $o$Cumhuriyetçilik$o$, $o$Laiklik$o$, $o$İnkılapçılık$o$], 3, $e$1. Her iki gelişme de toplumun çağdaşlaşması için yapılan yeniliklerdir.
2. Bu nedenle inkılapçılık ilkesiyle ilişkilendirilir.

Diğer şıklar: **A** ilkeyi karıştırmak / **B** ilkeyi karıştırmak / **C** ilkeyi karıştırmak.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi eğitim ve kültür alanındaki inkılaplardan biri **değildir**?$q$, array[$o$Tevhid-i Tedrisat Kanunu$o$, $o$Harf İnkılabı$o$, $o$Soyadı Kanunu$o$, $o$Türk Dil Kurumu'nun kurulması$o$], 2, $e$1. Tevhid-i Tedrisat, Harf İnkılabı ve TDK eğitim ve kültür alanındadır.
2. Soyadı Kanunu ise toplumsal alandaki bir inkılaptır.

Diğer şıklar: **A** doğru inkılabı yanlış sanmak / **B** doğru inkılabı yanlış sanmak / **D** doğru inkılabı yanlış sanmak.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda bazı inkılaplar ve tarihleri verilmiştir.

| İnkılap | Tarih |
| --- | --- |
| Tevhid-i Tedrisat Kanunu | 3 Mart 1924 |
| Şapka Kanunu | 25 Kasım 1925 |
| Harf İnkılabı | 1 Kasım 1928 |

Bu tabloya göre aşağıdaki çıkarımlardan hangisi yapılabilir?$q$, array[$o$Şapka Kanunu, Tevhid-i Tedrisat'tan önce çıkmıştır.$o$, $o$Harf İnkılabı, Şapka Kanunu'ndan sonra gerçekleşmiştir.$o$, $o$Harf İnkılabı tabloda ilk gerçekleşen inkılaptır.$o$, $o$Üç inkılap aynı yıl yapılmıştır.$o$], 1, $e$1. Tarihlere göre sıralama Tevhid-i Tedrisat (1924), Şapka Kanunu (1925), Harf İnkılabı (1928) şeklindedir.
2. Bu nedenle Harf İnkılabı Şapka Kanunu'ndan sonradır.

Diğer şıklar: **A** kronolojiyi ters okumak / **C** kronolojiyi ters okumak / **D** tarihleri yanlış okumak.$e$, 3),
  (11, 'lgs-ink', null::integer, $q$Eski yazıyla okuma yazma zor olduğu için okur yazarlık oranı düşüktü.

Bu sorunun çözümü için yapılan inkılap ve ona bağlı olarak açılan kurumlar aşağıdakilerden hangisidir?$q$, array[$o$Şapka Kanunu ve Soyadı Kanunu$o$, $o$Harf İnkılabı ve Millet Mektepleri$o$, $o$Medeni Kanun ve Sümerbank$o$, $o$Saltanatın kaldırılması ve Halifelik$o$], 1, $e$1. Latin harfleri kabul edilince halka yeni harfleri öğretmek için Millet Mektepleri açıldı.
2. Böylece okuma yazma yaygınlaştırılmak istendi.

Diğer şıklar: **A** ilgisiz inkılapları seçmek / **C** ilgisiz gelişmeleri seçmek / **D** ilgisiz gelişmeleri seçmek.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$1929 Büyük Ekonomik Bunalımı'ndan etkilenen Türkiye'de devlet, ekonomiye daha çok müdahale ederek sanayileşmeyi planlı hâle getirmiştir.

Bu uygulama hangi ilkenin gereğidir?$q$, array[$o$Devletçilik$o$, $o$Halkçılık$o$, $o$Laiklik$o$, $o$Milliyetçilik$o$], 0, $e$1. Devletin ekonomiye müdahale edip planlı sanayileşmeyi başlatması devletçilik ilkesinin gereğidir.
2. Birinci Beş Yıllık Sanayi Planı ve Sümerbank bu uygulamaların örnekleridir.

Diğer şıklar: **B** ilkeyi karıştırmak / **C** ilkeyi karıştırmak / **D** ilkeyi karıştırmak.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Medeni Kanun ile aşağıdakilerden hangisi gerçekleşmemiştir?$q$, array[$o$Evliliğin resmî nikâha bağlanması$o$, $o$Kadınlara miras ve boşanma haklarında eşitlik tanınması$o$, $o$Çok eşliliğin yasal hâle getirilmesi$o$, $o$Çağdaş ve laik hukukun getirilmesi$o$], 2, $e$1. Medeni Kanun ile çok eşlilik kaldırıldı.
2. Diğer maddeler Medeni Kanun'un getirdikleridir.

Diğer şıklar: **A** gerçekleşen maddeyi seçmek / **B** gerçekleşen maddeyi seçmek / **D** gerçekleşen maddeyi seçmek.$e$, 2),
  (14, 'lgs-ink', null::integer, $q$Aşağıdaki inkılaplar alanlarına göre eşleştirilmiştir.

I. Cumhuriyet'in ilanı - Siyasi
II. Medeni Kanun - Hukuk
III. Şapka Kanunu - Eğitim ve kültür
IV. Sümerbank - Ekonomik

Buna göre hangi eşleştirme **yanlıştır**?$q$, array[$o$III$o$, $o$I$o$, $o$II$o$, $o$IV$o$], 0, $e$1. Şapka Kanunu toplumsal alandaki bir inkılaptır.
2. Diğer eşleştirmeler doğrudur.

Diğer şıklar: **B** doğru eşleştirmeyi yanlış sanmak / **C** doğru eşleştirmeyi yanlış sanmak / **D** doğru eşleştirmeyi yanlış sanmak.$e$, 2),
  (15, 'lgs-ink', null::integer, $q$Aşağıdaki ifadelerden hangisi laiklik ilkesiyle ilgili doğru bir bilgidir?$q$, array[$o$Laiklik, dinsizliği savunur.$o$, $o$Laiklikte bireyler inançlarını yaşayamaz.$o$, $o$Devlet işleri dinî kurallara göre yürütülür.$o$, $o$Devlet hiçbir dine ve inanca öncelik tanımaz.$o$], 3, $e$1. Laiklikte her yurttaş inancını özgürce yaşayabilir.
2. Devlet hiçbir dine öncelik tanımaz ve devlet işleri dinî kurallara göre yürütülmez.

Diğer şıklar: **A** laikliği dinsizlik sanmak / **B** bireysel inanç özgürlüğünü yok saymak / **C** laikliğin tanımını ters bilmek.$e$, 3),
  (16, 'lgs-ink', null::integer, $q$Mustafa Kemal'e "Atatürk" soyadı hangi kurum tarafından verilmiştir?$q$, array[$o$TBMM$o$, $o$Türk Dil Kurumu$o$, $o$Milletler Cemiyeti$o$, $o$Heyet-i Temsiliye$o$], 0, $e$1. Mustafa Kemal'e "Atatürk" soyadı TBMM tarafından 24 Kasım 1934'te verildi.
2. Soyadı Kanunu aynı yıl 21 Haziran'da çıkmıştı.

Diğer şıklar: **B** kurumu karıştırmak / **C** kurumu karıştırmak / **D** kurumu karıştırmak.$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Demokratikleşme Çabaları konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Demokratikleşme Çabaları konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Demokratikleşme Çabaları$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$"Hâkimiyet, kayıtsız şartsız milletindir." ilkesi hangi anayasada yer almıştır?$q$, array[$o$1921 Anayasası$o$, $o$1876 Kanun-i Esasi$o$, $o$1924 Anayasası$o$, $o$1982 Anayasası$o$], 0, $e$1. 1921 Anayasası (Teşkilat-ı Esasiye) bu ilkeyi koymuştur.
2. 1924 Anayasası ise Cumhuriyet'i ve milli egemenliği anayasal güvenceye aldı.

Diğer şıklar: **B** Osmanlı anayasasını seçmek / **C** sonraki anayasayı seçmek / **D** yakın dönem anayasasını seçmek.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Terakkiperver Cumhuriyet Fırkası'nın kurucusu aşağıdakilerden hangisidir?$q$, array[$o$Fethi Okyar$o$, $o$Kâzım Karabekir$o$, $o$İsmet İnönü$o$, $o$Celal Bayar$o$], 1, $e$1. Terakkiperver Cumhuriyet Fırkası 17 Kasım 1924'te Kâzım Karabekir ve arkadaşlarınca kuruldu.
2. Serbest Cumhuriyet Fırkası'nı Fethi Okyar kurdu.

Diğer şıklar: **A** Serbest Fırka'nın kurucusunu seçmek / **C** başka bir devlet adamını seçmek / **D** Demokrat Parti'nin kurucusunu seçmek.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Serbest Cumhuriyet Fırkası hangi yılda kurulmuştur?$q$, array[$o$1924$o$, $o$1925$o$, $o$1930$o$, $o$1946$o$], 2, $e$1. Serbest Cumhuriyet Fırkası 12 Ağustos 1930'da Fethi Okyar önderliğinde kuruldu.

Diğer şıklar: **A** ilk partinin yılını yazmak / **B** Şeyh Said İsyanı'nın yılını yazmak / **D** Demokrat Parti'nin yılını yazmak.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Türkiye'de ilk kez iktidarın seçimle el değiştirdiği seçim hangisidir?$q$, array[$o$1923 seçimleri$o$, $o$1930 seçimleri$o$, $o$1946 seçimleri$o$, $o$1950 seçimleri$o$], 3, $e$1. 14 Mayıs 1950 seçimlerinde Demokrat Parti büyük bir çoğunlukla iktidara geldi.
2. 1946 ise çok partili hayatın ilk seçimidir.

Diğer şıklar: **A** ilk seçimi seçmek / **B** yerel seçimleri seçmek / **C** ilk çok partili seçimi seçmek.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Terakkiperver Cumhuriyet Fırkası'nın kapatılmasının temel nedeni aşağıdakilerden hangisidir?$q$, array[$o$Şeyh Said İsyanı'nın ardından yaşananlar$o$, $o$Partinin kendi kendini feshetmesi$o$, $o$Menemen Olayı'nın hemen ardından$o$, $o$Çok partili hayatın hemen başlaması$o$], 0, $e$1. Şeyh Said İsyanı Cumhuriyet ve laiklik karşıtı bir ayaklanmaydı.
2. İsyanın ardından Haziran 1925'te parti kapatıldı.

Diğer şıklar: **B** Serbest Fırka'nın sonunu karıştırmak / **C** olayın zamanını karıştırmak / **D** gelişmeyi ters yorumlamak.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$Şeyh Said İsyanı'nın bastırılması için çıkarılan kanun aşağıdakilerden hangisidir?$q$, array[$o$Takrir-i Sükûn Kanunu$o$, $o$Tevhid-i Tedrisat Kanunu$o$, $o$Soyadı Kanunu$o$, $o$Medeni Kanun$o$], 0, $e$1. Takrir-i Sükûn Kanunu (4 Mart 1925) hükümete olağanüstü yetkiler verdi.
2. İstiklal Mahkemeleri de bu dönemde yeniden kuruldu.

Diğer şıklar: **B** eğitim kanununu seçmek / **C** isimle ilgili kanunu seçmek / **D** hukuk kanununu seçmek.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Serbest Cumhuriyet Fırkası'nın kapanışı için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Parti Şeyh Said İsyanı sonrası kapatılmıştır.$o$, $o$Parti seçimleri kazanarak iktidara gelmiştir.$o$, $o$Fethi Okyar partiyi kendisi feshetmiştir.$o$, $o$Parti Kâzım Karabekir tarafından kapatılmıştır.$o$], 2, $e$1. Bazı çevreler partiyi Cumhuriyet'e ve inkılaplara karşı kullanmaya çalıştı.
2. Bunun üzerine Fethi Okyar 17 Kasım 1930'da partisini kendisi feshetti.

Diğer şıklar: **A** iki partinin kapanışını karıştırmak / **B** sonucu ters yorumlamak / **D** kurucuyu karıştırmak.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Menemen Olayı'nda şehit edilen öğretmen aşağıdakilerden hangisidir?$q$, array[$o$Mustafa Kemal Atatürk$o$, $o$Derviş Mehmet$o$, $o$Fethi Okyar$o$, $o$Mustafa Fehmi Kubilay$o$], 3, $e$1. Menemen Olayı 23 Aralık 1930'da yaşandı. Derviş Mehmet ve yandaşları Yedek Subay Öğretmen Mustafa Fehmi Kubilay'ı şehit etti.

Diğer şıklar: **A** tarihî kişileri karıştırmak / **B** olayın sorumlusunu seçmek / **C** siyasi ismi seçmek.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Kadınlara belediye seçimlerinde seçme ve seçilme hakkı hangi yılda tanınmıştır?$q$, array[$o$1926$o$, $o$1934$o$, $o$1930$o$, $o$1946$o$], 2, $e$1. Belediye seçimlerinde hak 3 Nisan 1930'da, milletvekili seçme ve seçilme hakkı 5 Aralık 1934'te tanındı.

Diğer şıklar: **A** Medeni Kanun'un yılını yazmak / **B** milletvekilliği hakkının yılını yazmak / **D** çok partili hayata geçiş yılını yazmak.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda iki partinin bazı özellikleri verilmiştir.

| Parti | Kuruluş | Kapanış sebebi |
| --- | --- | --- |
| I | 1924 | Şeyh Said İsyanı sonrası kapatıldı |
| II | 1930 | Kurucusu tarafından feshedildi |

Bu tabloya göre I ve II ile ilgili aşağıdakilerden hangisi söylenebilir?$q$, array[$o$I Serbest Cumhuriyet, II Terakkiperver Fırkası'dır.$o$, $o$Her iki parti de 1924'te kurulmuştur.$o$, $o$Her iki parti de kurucuları tarafından kapatılmıştır.$o$, $o$I Terakkiperver, II Serbest Cumhuriyet Fırkası'dır.$o$], 3, $e$1. 1924'te kurulup Şeyh Said İsyanı sonrası kapatılan parti Terakkiperver Cumhuriyet Fırkası'dır.
2. 1930'da kurulup Fethi Okyar tarafından feshedilen parti Serbest Cumhuriyet Fırkası'dır.

Diğer şıklar: **A** partileri ters eşlemek / **B** tarihleri karıştırmak / **C** kapanış sebeplerini karıştırmak.$e$, 3),
  (11, 'lgs-ink', null::integer, $q$Serbest Cumhuriyet Fırkası'nın kurulmasında 1929 Dünya Ekonomik Bunalımı'nın etkisi olmuştur.

Bu bilgiye göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Atatürk, çok partili hayatın yasaklanmasını istemiştir.$o$, $o$Atatürk, ekonomik sıkıntıların eleştirilmesini istemiştir.$o$, $o$Parti, Cumhuriyet'i kaldırmak için kurulmuştur.$o$, $o$Ekonomik bunalım Türkiye'yi hiç etkilememiştir.$o$], 1, $e$1. Bunalım halkta ekonomik sıkıntıyı artırdı.
2. Atatürk, bu sıkıntıların hükümete eleştiri yoluyla dile getirilmesi için bir muhalefet partisi kurulmasını istedi.

Diğer şıklar: **A** amacı ters yorumlamak / **C** amacı yanlış yorumlamak / **D** bilgiyle çelişmek.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$Aşağıdaki olaylar eskiden yeniye doğru sıralanacaktır:

I. Menemen Olayı
II. Terakkiperver Cumhuriyet Fırkası'nın kapatılması
III. Kadınlara milletvekili seçme ve seçilme hakkı
IV. Serbest Cumhuriyet Fırkası'nın kurulması

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$IV, II, I, III$o$, $o$II, I, IV, III$o$, $o$II, IV, III, I$o$, $o$II, IV, I, III$o$], 3, $e$1. Terakkiperver 1925'te kapatıldı, Serbest Fırka Ağustos 1930'da kuruldu, Menemen Olayı Aralık 1930'da yaşandı, milletvekili hakkı 1934'te tanındı.
2. Sıralama II, IV, I, III olur.

Diğer şıklar: **A** ilk iki olayı karıştırmak / **B** Menemen ile kuruluş sırasını karıştırmak / **C** son iki olayı karıştırmak.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Demokrat Parti'nin 1946'da kurulması aşağıdaki sonuçlardan hangisini doğurmuştur?$q$, array[$o$Cumhuriyet'in ilan edilmesini$o$, $o$Çok partili yönetime geçişin başlamasını$o$, $o$Saltanatın kaldırılmasını$o$, $o$Kadınların seçme hakkının tanınmasını$o$], 1, $e$1. Demokrat Parti 7 Ocak 1946'da kuruldu.
2. Bu, tek partili yönetimden çok partili yönetime geçişin önemli adımı oldu.

Diğer şıklar: **A** tarihleri karıştırmak / **C** tarihleri karıştırmak / **D** tarihleri karıştırmak.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$İki partinin ortak kaderi için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$İkisi de inkılap karşıtlarına alet edilmeye çalışılmıştır.$o$, $o$İkisi de uzun yıllar boyunca iktidarda kalmıştır.$o$, $o$İkisi de Atatürk'ün kendi isteğiyle kapatılmıştır.$o$, $o$İkisi de silahlı bir isyan sonucu kurulmuştur.$o$], 0, $e$1. Terakkiperver ve Serbest Cumhuriyet Fırkası demokratik muhalefet için kuruldu.
2. Her ikisi de inkılap karşıtlarının kullanma çabasına yakalandı ve kısa ömürlü oldu.

Diğer şıklar: **B** sonucu ters yorumlamak / **C** sebebi yanlış yorumlamak / **D** kuruluş biçimini yanlış bilmek.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Cumhuriyet Halk Fırkası'nı kuran kişi aşağıdakilerden hangisidir?$q$, array[$o$Kâzım Karabekir$o$, $o$Mustafa Kemal Atatürk$o$, $o$Fethi Okyar$o$, $o$Celal Bayar$o$], 1, $e$1. Cumhuriyet Halk Fırkası Mustafa Kemal'in öncülüğünde kuruldu (9 Eylül 1923).
2. Parti, inkılapları gerçekleştiren ana siyasi güç oldu.

Diğer şıklar: **A** başka partinin kurucusunu seçmek / **C** başka partinin kurucusunu seçmek / **D** başka partinin kurucusunu seçmek.$e$, 2),
  (16, 'lgs-ink', null::integer, $q$1935 seçimlerinde kaç kadın milletvekili TBMM'ye girmiştir?$q$, array[$o$5$o$, $o$8$o$, $o$18$o$, $o$28$o$], 2, $e$1. 1935 seçimlerinde 18 kadın milletvekili TBMM'ye girdi.
2. Türkiye bu hakkı birçok Avrupa ülkesinden önce tanıdı.

Diğer şıklar: **A** sayıyı bilmemek / **B** sayıyı bilmemek / **D** sayıyı bilmemek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Atatürk Dönemi Türk Dış Politikası konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Atatürk Dönemi Türk Dış Politikası konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk Dönemi Türk Dış Politikası$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$Atatürk dönemi dış politikasının temel ilkesi aşağıdakilerden hangisidir?$q$, array[$o$Hattı müdafaa yoktur, sathı müdafaa vardır$o$, $o$Egemenlik kayıtsız şartsız milletindir$o$, $o$Ordular, ilk hedefiniz Akdeniz'dir$o$, $o$Yurtta sulh, cihanda sulh$o$], 3, $e$1. "Yurtta sulh, cihanda sulh" Atatürk'ün dış politikasını özetleyen sözdür.
2. Diğer sözler farklı alanlara aittir.

Diğer şıklar: **A** Sakarya sözünü seçmek / **B** anayasa ilkesini seçmek / **C** Büyük Taarruz emrini seçmek.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Türkiye hangi tarihte Milletler Cemiyeti'ne üye olmuştur?$q$, array[$o$1926$o$, $o$1932$o$, $o$1934$o$, $o$1936$o$], 1, $e$1. Türkiye 18 Temmuz 1932'de Milletler Cemiyeti'ne üye oldu.
2. Bu üyelik, uluslararası alanda güvenilir bir devlet olarak kabul edildiğini gösterir.

Diğer şıklar: **A** Musul antlaşmasının yılını yazmak / **C** Balkan Antantı'nın yılını yazmak / **D** Montrö'nün yılını yazmak.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Montrö Boğazlar Sözleşmesi hangi yıl imzalanmıştır?$q$, array[$o$1923$o$, $o$1932$o$, $o$1936$o$, $o$1939$o$], 2, $e$1. Montrö Boğazlar Sözleşmesi 20 Temmuz 1936'da imzalandı.

Diğer şıklar: **A** Lozan'ın yılını yazmak / **B** Milletler Cemiyeti yılını yazmak / **D** Hatay'ın katılış yılını yazmak.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Sadabat Paktı'na üye olan devletler arasında aşağıdakilerden hangisi **yoktur**?$q$, array[$o$İran$o$, $o$Irak$o$, $o$Yunanistan$o$, $o$Afganistan$o$], 2, $e$1. Sadabat Paktı'na Türkiye, İran, Irak ve Afganistan katıldı.
2. Yunanistan Balkan Antantı üyesidir.

Diğer şıklar: **A** üye devleti yanlış sanmak / **B** üye devleti yanlış sanmak / **D** üye devleti yanlış sanmak.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Balkan Antantı'na üye olan devletler aşağıdakilerden hangisinde doğru verilmiştir?$q$, array[$o$Türkiye, İran, Irak, Afganistan$o$, $o$Türkiye, Yunanistan, Romanya, Yugoslavya$o$, $o$Türkiye, İngiltere, Fransa, İtalya$o$, $o$Türkiye, Bulgaristan, Macaristan, Almanya$o$], 1, $e$1. Balkan Antantı 9 Şubat 1934'te imzalandı.
2. Üyeler Türkiye, Yunanistan, Romanya ve Yugoslavya'dır.

Diğer şıklar: **A** Sadabat Paktı üyelerini seçmek / **C** ilgisiz devletleri seçmek / **D** ilgisiz devletleri seçmek.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$Montrö Sözleşmesi ile Türkiye'nin kazandığı en önemli hak aşağıdakilerden hangisidir?$q$, array[$o$Musul petrollerinden pay alma hakkı$o$, $o$Boğazlar'da askerî güç bulundurma hakkı$o$, $o$Hatay'ı birleştirme hakkı$o$, $o$Milletler Cemiyeti'ne girme hakkı$o$], 1, $e$1. Montrö ile Türkiye Boğazlar'da askerî güç bulundurma ve tahkimat yapma hakkına kavuştu.
2. Savaş zamanında geçişi kontrol yetkisi de arttı.

Diğer şıklar: **A** Ankara Antlaşması'nı seçmek / **C** Hatay sorununu seçmek / **D** 1932 gelişmesini seçmek.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Musul sorunu hangi antlaşma ile çözüme bağlanmıştır?$q$, array[$o$1926 Ankara Antlaşması$o$, $o$1920 Gümrü Antlaşması$o$, $o$1921 Ankara Antlaşması$o$, $o$1936 Montrö Sözleşmesi$o$], 0, $e$1. Musul sorunu Lozan'da çözülememiş, Milletler Cemiyeti'ne taşınmıştı.
2. 5 Haziran 1926'da Türkiye, İngiltere ve Irak arasında Ankara Antlaşması imzalandı ve Musul Irak'a bırakıldı.

Diğer şıklar: **B** doğu cephesi antlaşmasını seçmek / **C** Fransa ile yapılan antlaşmayı seçmek / **D** Boğazlar sözleşmesini seçmek.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Hatay'ın Türkiye'ye katılma kararı hangi yılda alınmıştır?$q$, array[$o$1923$o$, $o$1936$o$, $o$1938$o$, $o$1939$o$], 3, $e$1. Hatay Meclisi 23 Temmuz 1939'da Türkiye'ye katılma kararı aldı.
2. Bu, Atatürk'ün ölümünden sonra olsa da süreç onun döneminde başlamıştı.

Diğer şıklar: **A** Lozan'ın yılını yazmak / **B** Fransa'nın Suriye kararının yılını yazmak / **C** Hatay Devleti'nin yılını yazmak.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$Atatürk dönemi dış politikasında sorunların çoğu aşağıdaki yöntemlerden hangisiyle çözülmüştür?$q$, array[$o$Savaş$o$, $o$Yabancı müdahale$o$, $o$Diplomasi$o$, $o$Ekonomik ambargo$o$], 2, $e$1. Atatürk sorunları çoğu zaman diplomasi ile çözdü.
2. Bu, "Yurtta sulh, cihanda sulh" anlayışının bir yansımasıdır.

Diğer şıklar: **A** politikayı ters yorumlamak / **B** politikayı ters yorumlamak / **D** ilgisiz bir yöntemi seçmek.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda bazı dış politika gelişmeleri verilmiştir.

| Gelişme | Yıl |
| --- | --- |
| Milletler Cemiyeti'ne giriş | 1932 |
| Balkan Antantı | 1934 |
| Montrö Sözleşmesi | 1936 |
| Sadabat Paktı | 1937 |

Bu tabloya göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Balkan Antantı, Montrö'den önce imzalanmıştır.$o$, $o$Sadabat Paktı en erken gelişmedir.$o$, $o$Montrö, Milletler Cemiyeti'nden önce imzalanmıştır.$o$, $o$Dördü de aynı yıl gerçekleşmiştir.$o$], 0, $e$1. Tarihlere göre sıralama Milletler Cemiyeti (1932), Balkan Antantı (1934), Montrö (1936) ve Sadabat (1937) şeklindedir.
2. Bu nedenle Balkan Antantı Montrö'den önce imzalanmıştır.

Diğer şıklar: **B** kronolojiyi ters okumak / **C** kronolojiyi ters okumak / **D** tarihleri yanlış okumak.$e$, 3),
  (11, 'lgs-ink', null::integer, $q$İtalya ve Almanya'nın tehditkâr politikaları Boğazlar'ın güvenliğini tehlikeye atmıştır.

Bu durum Türkiye'yi aşağıdakilerden hangisini yapmaya yöneltmiştir?$q$, array[$o$Boğazlar rejimini değiştirmeye$o$, $o$Milletler Cemiyeti'nden ayrılmaya$o$, $o$Lozan'ı yeniden imzalamaya$o$, $o$Musul'u istemeye$o$], 0, $e$1. Tehdit artınca Türkiye, Lozan'a imza atan devletlere başvurdu.
2. Montrö Konferansı toplandı ve 1936'da sözleşme imzalandı.

Diğer şıklar: **B** ilgisiz bir sonuç seçmek / **C** ilgisiz bir sonuç seçmek / **D** ilgisiz bir sonuç seçmek.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$Balkan Antantı'nın imzalanmasında aşağıdakilerden hangisi etkili olmuştur?$q$, array[$o$Osmanlı Devleti'nin yeniden kurulması$o$, $o$Musul sorununun çözülmesi$o$, $o$Hatay'ın katılması$o$, $o$Avrupa'da gerginliğin artması$o$], 3, $e$1. Almanya'da Hitler'in iktidara gelmesi ve İtalya'nın saldırgan tutumu Avrupa'yı tehdit ediyordu.
2. Balkanların güvenliği için Balkan Antantı imzalandı.

Diğer şıklar: **A** tarihleri karıştırmak / **B** ilgisiz bir neden seçmek / **C** ilgisiz bir neden seçmek.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Lozan'da çözülemeyen sorunlardan biridir?$q$, array[$o$Musul sorunu$o$, $o$Kapitülasyonların kaldırılması$o$, $o$Türkiye'nin tanınması$o$, $o$Mudanya Ateşkesi$o$], 0, $e$1. Lozan'da kapitülasyonlar kaldırıldı ve Türkiye bağımsız bir devlet olarak tanındı.
2. Musul, Boğazlar rejimi ve Hatay açık kalan konulardı.

Diğer şıklar: **B** çözülen konuyu seçmek / **C** çözülen konuyu seçmek / **D** başka bir antlaşmayı seçmek.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$Aşağıdaki gelişmeler eskiden yeniye doğru sıralanacaktır:

I. Montrö Sözleşmesi
II. Ankara Antlaşması (Musul)
III. Hatay'ın katılması
IV. Balkan Antantı

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$II, I, IV, III$o$, $o$IV, II, I, III$o$, $o$II, IV, III, I$o$, $o$II, IV, I, III$o$], 3, $e$1. Musul 1926, Balkan Antantı 1934, Montrö 1936 ve Hatay'ın katılması 1939'dur.
2. Sıralama II, IV, I, III olur.

Diğer şıklar: **A** Montrö ile Balkan Antantı'nı karıştırmak / **B** ilk iki gelişmeyi karıştırmak / **C** son iki gelişmeyi karıştırmak.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Atatürk dönemi dış politikasının ilkelerinden biri **değildir**?$q$, array[$o$Tam bağımsızlık$o$, $o$Sömürge elde etmek$o$, $o$Komşularla dostluk$o$, $o$Gerçekçilik$o$], 1, $e$1. Atatürk dönemi dış politikası barış, tam bağımsızlık, gerçekçilik, komşularla dostluk ve uluslararası iş birliğine dayanır.
2. Sömürge elde etmek bu ilkeler arasında yoktur.

Diğer şıklar: **A** doğru ilkeyi yanlış sanmak / **C** doğru ilkeyi yanlış sanmak / **D** doğru ilkeyi yanlış sanmak.$e$, 2),
  (16, 'lgs-ink', null::integer, $q$Hatay (İskenderun Sancağı) Lozan'dan sonra hangi devletin mandası altındaki bölgenin sınırları içinde kalmıştır?$q$, array[$o$İngiltere'nin mandasındaki Irak$o$, $o$İngiltere'nin mandasındaki Filistin$o$, $o$Fransa'nın mandasındaki Suriye$o$, $o$İtalya'nın sömürgesi olan Libya$o$], 2, $e$1. Hatay, Lozan'dan sonra Fransız mandasındaki Suriye sınırları içinde kaldı.
2. Halkının büyük bölümü Türk'tü ve Atatürk diplomatik yolları kullandı.

Diğer şıklar: **A** mandayı karıştırmak / **B** mandayı karıştırmak / **D** ilgisiz bir bölgeyi seçmek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ink | Atatürk'ün Ölümü ve Sonrası konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ink', t.id, $t$Atatürk'ün Ölümü ve Sonrası konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk'ün Ölümü ve Sonrası$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', null::integer, $q$Atatürk hangi tarihte yaşama veda etmiştir?$q$, array[$o$29 Ekim 1938$o$, $o$21 Kasım 1938$o$, $o$10 Kasım 1938$o$, $o$10 Kasım 1953$o$], 2, $e$1. Atatürk 10 Kasım 1938'de saat 09.05'te Dolmabahçe Sarayı'nda yaşama veda etti.
2. Cenaze töreni 21 Kasım 1938'de, Anıtkabir'e nakil 10 Kasım 1953'te gerçekleşti.

Diğer şıklar: **A** Cumhuriyet Bayramı'nı yazmak / **B** cenaze töreni tarihini yazmak / **D** Anıtkabir'e nakil tarihini yazmak.$e$, 1),
  (2, 'lgs-ink', null::integer, $q$Atatürk'ün naaşı Anıtkabir'e nakledilmeden önce nerede bulunmuştur?$q$, array[$o$Dolmabahçe Sarayı$o$, $o$Topkapı Sarayı$o$, $o$Etnografya Müzesi$o$, $o$TBMM binası$o$], 2, $e$1. Cenaze töreninden sonra naaş geçici olarak Ankara'da Etnografya Müzesi'ne konuldu.
2. 10 Kasım 1953'te Anıtkabir'e nakledildi.

Diğer şıklar: **A** vefat yerini seçmek / **B** ilgisiz bir müzeyi seçmek / **D** ilgisiz bir yeri seçmek.$e$, 1),
  (3, 'lgs-ink', null::integer, $q$Atatürk'ün ölümünden sonra Cumhurbaşkanı seçilen kişi aşağıdakilerden hangisidir?$q$, array[$o$İsmet İnönü$o$, $o$Celal Bayar$o$, $o$Fethi Okyar$o$, $o$Kâzım Karabekir$o$], 0, $e$1. TBMM 11 Kasım 1938'de İsmet İnönü'yü ikinci Cumhurbaşkanı seçti.
2. İnönü'ye "Milli Şef" unvanı verildi.

Diğer şıklar: **B** sonraki cumhurbaşkanını seçmek / **C** başka bir devlet adamını seçmek / **D** başka bir devlet adamını seçmek.$e$, 1),
  (4, 'lgs-ink', null::integer, $q$Türkiye'de her yıl 10 Kasım'da saat kaçta saygı duruşu yapılır?$q$, array[$o$08.15$o$, $o$09.05$o$, $o$10.05$o$, $o$12.00$o$], 1, $e$1. Atatürk 10 Kasım 1938'de saat 09.05'te vefat etti.
2. Her yıl bu saatte sirenler çalar ve saygı duruşu yapılır.

Diğer şıklar: **A** başka bir saati yazmak / **C** başka bir saati yazmak / **D** başka bir saati yazmak.$e$, 1),
  (5, 'lgs-ink', null::integer, $q$Atatürk'ün vasiyetnamesinde mal varlığının önemli bir bölümünü bıraktığı kurumlar aşağıdakilerden hangisidir?$q$, array[$o$Milli Eğitim Bakanlığı ve TBMM$o$, $o$Sümerbank ve Etibank$o$, $o$Ankara Üniversitesi ve İstanbul Üniversitesi$o$, $o$Türk Dil Kurumu ve Türk Tarih Kurumu$o$], 3, $e$1. Atatürk 5 Eylül 1938'de vasiyetnamesini yazdı.
2. Mal varlığının önemli bir bölümünü Türk Dil Kurumu ve Türk Tarih Kurumu'na bıraktı.

Diğer şıklar: **A** kurumları karıştırmak / **B** ekonomik kurumları seçmek / **C** üniversiteleri seçmek.$e$, 2),
  (6, 'lgs-ink', null::integer, $q$II. Dünya Savaşı sırasında Türkiye'nin izlediği genel politika aşağıdakilerden hangisidir?$q$, array[$o$Savaşın başından itibaren cephede yer almak$o$, $o$Almanya'nın yanında savaşa girmek$o$, $o$Savaşın büyük bölümünde tarafsız kalmak$o$, $o$Bütün komşularla savaşmak$o$], 2, $e$1. Türkiye "Yurtta sulh, cihanda sulh" ilkesine bağlı kalarak savaşa doğrudan girmedi.
2. Şubat 1945'te sembolik olarak savaş ilan etti.

Diğer şıklar: **A** politikayı ters bilmek / **B** politikayı ters bilmek / **D** politikayı ters bilmek.$e$, 2),
  (7, 'lgs-ink', null::integer, $q$Türkiye'nin Şubat 1945'te Almanya ve Japonya'ya savaş ilan etmesinin amacı aşağıdakilerden hangisidir?$q$, array[$o$Almanya topraklarını işgal etmek$o$, $o$Montrö'yü yeniden müzakere etmek$o$, $o$Hatay'ı birleştirmek$o$, $o$BM'nin kurucu üyesi olabilmek$o$], 3, $e$1. Birleşmiş Milletler'in kurucu üyesi olabilmek için Almanya ve Japonya'ya savaş ilan edildi.
2. Türkiye 1945'te BM'nin kurucu üyelerinden biri oldu.

Diğer şıklar: **A** amacı yanlış yorumlamak / **B** ilgisiz bir amaç seçmek / **C** ilgisiz bir amaç seçmek.$e$, 2),
  (8, 'lgs-ink', null::integer, $q$Aşağıdakilerden hangisi Atatürk'ün gençlere verdiği önemi gösteren bir örnektir?$q$, array[$o$Gençliğe Hitabe'nin yazılması$o$, $o$Soyadı Kanunu'nun çıkarılması$o$, $o$Türk Dil Kurumu'nun kuruluşu$o$, $o$Medeni Kanun'un kabul edilmesi$o$], 0, $e$1. Gençliğe Hitabe (1927), Nutuk'un sonunda yer alır.
2. Gençlere cumhuriyeti koruma görevi verir.

Diğer şıklar: **B** ilgisiz bir kanunu seçmek / **C** ilgisiz bir kurumu seçmek / **D** ilgisiz bir kanunu seçmek.$e$, 2),
  (9, 'lgs-ink', null::integer, $q$23 Nisan Ulusal Egemenlik ve Çocuk Bayramı ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$30 Ağustos'ta kutlanır.$o$, $o$Çocuklara armağan edilen ilk bayramdır.$o$, $o$Cumhuriyet'in ilanı için kutlanır.$o$, $o$Yalnızca TBMM'de kutlanır.$o$], 1, $e$1. Atatürk 23 Nisan'ı çocuklara armağan etti.
2. Bayram dünyada çocuklara armağan edilen ilk bayramdır.

Diğer şıklar: **A** tarihi karıştırmak / **C** bayramın nedenini karıştırmak / **D** bayramın kapsamını yanlış bilmek.$e$, 2),
  (10, 'lgs-ink', null::integer, $q$Aşağıdaki tabloda bazı olaylar ve tarihleri verilmiştir.

| Olay | Tarih |
| --- | --- |
| Atatürk'ün vefatı | 10 Kasım 1938 |
| İsmet İnönü'nün seçilmesi | 11 Kasım 1938 |
| Cenaze töreni | 21 Kasım 1938 |
| Anıtkabir'e nakil | 10 Kasım 1953 |

Bu tabloya göre aşağıdakilerden hangisi söylenebilir?$q$, array[$o$İnönü, vefattan önce seçilmiştir.$o$, $o$Anıtkabir'e nakil 15 yıl sonra olmuştur.$o$, $o$Cenaze töreni vefat gününde olmuştur.$o$, $o$Nakil 1938'de yapılmıştır.$o$], 1, $e$1. Vefat 1938, nakil 1953'tür. Aradan 15 yıl geçmiştir.
2. İnönü vefattan bir gün sonra, cenaze töreni ise 11 gün sonra yapılmıştır.

Diğer şıklar: **A** kronolojiyi ters okumak / **C** tarihleri yanlış okumak / **D** tarihleri yanlış okumak.$e$, 3),
  (11, 'lgs-ink', null::integer, $q$Savaştan sonra dünyanın ABD ve SSCB olmak üzere iki kutba ayrılması Türkiye'yi nasıl etkilemiştir?$q$, array[$o$Türkiye tarafsızlığını tamamen sürdürmüştür.$o$, $o$Türkiye Doğu bloğuna katılmıştır.$o$, $o$Türkiye dış politikada yalnız kalmıştır.$o$, $o$Türkiye Batı bloğuyla ilişkilerini güçlendirmiştir.$o$], 3, $e$1. Savaştan sonra Türkiye Batı bloğuyla ilişkilerini güçlendirdi.
2. Marshall Planı (1947) ve NATO üyeliği (1952) bu yakınlaşmanın örnekleridir.

Diğer şıklar: **A** gelişmenin etkisini yok saymak / **B** etkiyi ters yorumlamak / **C** etkiyi ters yorumlamak.$e$, 3),
  (12, 'lgs-ink', null::integer, $q$Atatürk, "Hayatta en hakiki mürşit ilimdir, fendir." demiştir.

Bu söz Atatürk'ün aşağıdaki yaklaşımlarından hangisini yansıtır?$q$, array[$o$Geleneklere sıkı sıkıya bağlı olması$o$, $o$Yalnızca askerliğe önem vermesi$o$, $o$Bilimi ve aklı rehber alması$o$, $o$Dış politikada tarafsız kalması$o$], 2, $e$1. "İlim ve fen" ifadesi bilimin yol gösterici olduğunu belirtir.
2. Bu, Atatürk'ün bilimi ve aklı rehber alan anlayışını yansıtır.

Diğer şıklar: **A** sözü ters yorumlamak / **B** sözün kapsamını daraltmak / **D** ilgisiz bir yaklaşımı seçmek.$e$, 3),
  (13, 'lgs-ink', null::integer, $q$Aşağıdaki olaylar eskiden yeniye doğru sıralanacaktır:

I. Anıtkabir'e nakil
II. İsmet İnönü'nün Cumhurbaşkanı seçilmesi
III. II. Dünya Savaşı'nın başlaması
IV. Türkiye'nin BM kurucu üyesi olması

Buna göre doğru sıralama aşağıdakilerden hangisidir?$q$, array[$o$II, III, I, IV$o$, $o$II, III, IV, I$o$, $o$III, II, IV, I$o$, $o$II, IV, III, I$o$], 1, $e$1. İnönü 1938, II. Dünya Savaşı 1939, BM 1945 ve Anıtkabir'e nakil 1953'tür.
2. Sıralama II, III, IV, I olur.

Diğer şıklar: **A** son iki olayı karıştırmak / **C** ilk iki olayı karıştırmak / **D** ortadaki iki olayı karıştırmak.$e$, 3),
  (14, 'lgs-ink', null::integer, $q$Cenaze töreninin 21 Kasım 1938'de Ankara'da yapılması ve naaşın geçici olarak müzede tutulması aşağıdakilerden hangisinin sonucudur?$q$, array[$o$Anıtkabir'in henüz tamamlanmamış olması$o$, $o$Naaşın yurt dışına gönderilmesi$o$, $o$Cumhuriyet'in ilan edilmemiş olması$o$, $o$Cenazenin İstanbul'da bırakılması$o$], 0, $e$1. Anıtkabir tamamlanana kadar naaş Etnografya Müzesi'nde kaldı.
2. Bu yüzden nakil, ölümden 15 yıl sonra gerçekleşti.

Diğer şıklar: **B** ilgisiz bir sonuç seçmek / **C** tarihleri karıştırmak / **D** olayı yanlış bilmek.$e$, 3),
  (15, 'lgs-ink', null::integer, $q$Atatürk'ün vasiyetinde gençlerin öğrenimi için de pay bırakmasının anlamı aşağıdakilerden hangisidir?$q$, array[$o$Eğitime ve gençlere verdiği önemi göstermesi$o$, $o$Ailesini düşünmediğini göstermesi$o$, $o$Mal varlığının olmadığını göstermesi$o$, $o$Yalnızca askeri okullara önem vermesi$o$], 0, $e$1. Vasiyetnamede çocukların öğrenimi için de pay ayırdı.
2. Bu, eğitime ve gençlere verdiği önemi gösterir.

Diğer şıklar: **B** bilgiyi ters yorumlamak / **C** bilgiyle çelişmek / **D** bilgiyi daraltmak.$e$, 2),
  (16, 'lgs-ink', null::integer, $q$İsmet İnönü'ye verilen unvan aşağıdakilerden hangisidir?$q$, array[$o$Gazi$o$, $o$Mareşal$o$, $o$Başkomutan$o$, $o$Milli Şef$o$], 3, $e$1. İnönü Cumhurbaşkanı seçildikten sonra "Milli Şef" unvanını aldı.
2. Gazi unvanı ve Mareşal rütbesi Mustafa Kemal'e Sakarya sonrası verilmişti.

Diğer şıklar: **A** Mustafa Kemal'in unvanını seçmek / **B** Mustafa Kemal'in rütbesini seçmek / **C** Kurtuluş Savaşı unvanını seçmek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

