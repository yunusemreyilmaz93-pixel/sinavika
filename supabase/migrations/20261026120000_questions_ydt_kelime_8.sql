-- 20261026120000_questions_ydt_kelime_8. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 40
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 40$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Poor internet connections remain a major ---- for online schools in rural areas, where many families do not have a computer at home.$q$, array[$o$hindrance$o$, $o$privilege$o$, $o$pastime$o$, $o$trophy$o$, $o$souvenir$o$], 0, $e$1. Boşluğa **hindrance** (engel) gelir. Bilgisayarı olmayan ailelere ulaşmayı zorlaştıran şey bir engeldir.

Diğer şıklar: **B** privilege (ayrıcalık) / **C** pastime (hobi) / **D** trophy (kupa) / **E** souvenir (hatıra).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The island is covered with ---- vegetation, with thick forests and flowers of every colour growing wherever the eye can see.$q$, array[$o$barren$o$, $o$lush$o$, $o$scarce$o$, $o$brittle$o$, $o$withered$o$], 1, $e$1. Boşluğa **lush** (gür) gelir. Yoğun ormanlar ve çiçekler gür bitki örtüsünü gösterir.

Diğer şıklar: **A** barren (kurak) / **C** scarce (kıt) / **D** brittle (kırılgan) / **E** withered (solmuş).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The company ---- apologised to its customers and offered free repairs for all the machines affected by the fault.$q$, array[$o$hardly$o$, $o$barely$o$, $o$vaguely$o$, $o$swiftly$o$, $o$lazily$o$], 3, $e$1. Boşluğa **swiftly** (çabucak) gelir. Ücretsiz onarım önermek çabuk özür dilemeyi anlatır.

Diğer şıklar: **A** hardly (zar zor) / **B** barely (zar zor) / **C** vaguely (belirsizce) / **E** lazily (tembelce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The ancient manuscripts were ---- in a cave for more than two thousand years, which explains why they were in such good condition.$q$, array[$o$disguised$o$, $o$delivered$o$, $o$examined$o$, $o$censored$o$, $o$preserved$o$], 4, $e$1. Boşluğa **preserved** (korunmuş) gelir. Bin yıllarca iyi kalmaları mağarada korunmalarındandır.

Diğer şıklar: **A** disguised (gizlenmiş) / **B** delivered (teslim edilmiş) / **C** examined (incelenmiş) / **D** censored (sansürlenmiş).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Experts say that the economy will ---- slowly next year, after two difficult years of falling production and rising unemployment.$q$, array[$o$pass out$o$, $o$pick up$o$, $o$tear apart$o$, $o$show off$o$, $o$give away$o$], 1, $e$1. Boşluğa **pick up** (toparlanmak) gelir. Zor yılların ardından ekonominin yavaşça toparlanması pick up ile söylenir.

Diğer şıklar: **A** pass out (bayılmak) / **C** tear apart (parçalamak) / **D** show off (gösteriş yapmak) / **E** give away (bedavaya vermek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The artificial lake behind the dam acts as a huge ----, storing enough water to supply more than two million people during the dry summer months.$q$, array[$o$reservoir$o$, $o$audience$o$, $o$vacancy$o$, $o$mixture$o$, $o$reunion$o$], 0, $e$1. Boşluğa **reservoir** (rezervuar) gelir. İçme suyunu depolayan göl bir rezervuardır.

Diğer şıklar: **B** audience (izleyici) / **C** vacancy (boşluk) / **D** mixture (karışım) / **E** reunion (buluşma).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The old man has a ---- memory for faces, and he can still recognise people he met only once, many years ago.$q$, array[$o$feeble$o$, $o$trivial$o$, $o$remarkable$o$, $o$temporary$o$, $o$modest$o$], 2, $e$1. Boşluğa **remarkable** (olağanüstü) gelir. Bir kez gördüğü insanları tanımak olağanüstü hafızadır.

Diğer şıklar: **A** feeble (zayıf) / **B** trivial (önemsiz) / **D** temporary (geçici) / **E** modest (mütevazı).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The team played ---- throughout the tournament, scoring at least three goals in every match and not losing a single game.$q$, array[$o$poorly$o$, $o$carelessly$o$, $o$reluctantly$o$, $o$brilliantly$o$, $o$hardly$o$], 3, $e$1. Boşluğa **brilliantly** (parlak biçimde) gelir. Her maçta en az üç gol atmak ve hiç yenilmemek parlak oyundur.

Diğer şıklar: **A** poorly (kötü biçimde) / **B** carelessly (dikkatsizce) / **C** reluctantly (isteksizce) / **E** hardly (zar zor).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$Doctors believe that a healthy diet can ---- the risk of heart disease, although it cannot remove it completely.$q$, array[$o$multiply$o$, $o$predict$o$, $o$depict$o$, $o$deserve$o$, $o$diminish$o$], 4, $e$1. Boşluğa **diminish** (azaltmak) gelir. Riski tamamen yok etmeden düşürmek diminish ile söylenir.

Diğer şıklar: **A** multiply (çoğaltmak) / **B** predict (tahmin etmek) / **C** depict (betimlemek) / **D** deserve (hak etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The project will ---- more than ten million pounds, which is much higher than the amount the council had expected to pay.$q$, array[$o$go along$o$, $o$come to$o$, $o$break up$o$, $o$hold on$o$, $o$settle in$o$], 1, $e$1. Boşluğa **come to** (tutmak) gelir. Toplam maliyetin on milyon sterlini bulması come to ile söylenir.

Diğer şıklar: **A** go along (uymak) / **C** break up (dağılmak) / **D** hold on (tutunmak) / **E** settle in (yerleşmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The professor's ---- at the university lasted forty years, during which she taught more than ten thousand students.$q$, array[$o$tendency$o$, $o$tribute$o$, $o$tenure$o$, $o$tension$o$, $o$tolerance$o$], 2, $e$1. Boşluğa **tenure** (görev süresi) gelir. Kırk yıl boyunca üniversitede kalmak görev süresidir.

Diğer şıklar: **A** tendency (eğilim) / **B** tribute (saygı gösterisi) / **D** tension (gerilim) / **E** tolerance (hoşgörü).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Her ---- manner made everybody at the party feel comfortable, and even the shyest guests soon began to talk and laugh.$q$, array[$o$hostile$o$, $o$arrogant$o$, $o$reserved$o$, $o$hasty$o$, $o$amiable$o$], 4, $e$1. Boşluğa **amiable** (sevimli) gelir. Çekingen misafirleri bile rahatlatan tavır sevimlidir.

Diğer şıklar: **A** hostile (düşmanca) / **B** arrogant (kibirli) / **C** reserved (çekingen) / **D** hasty (aceleci).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The fire was ---- started by a faulty cable, although investigators have not yet been able to confirm the exact cause.$q$, array[$o$lovingly$o$, $o$allegedly$o$, $o$loudly$o$, $o$tightly$o$, $o$evenly$o$], 1, $e$1. Boşluğa **allegedly** (iddiaya göre) gelir. Nedenin henüz doğrulanmaması ifadenin iddiaya dayandığını gösterir.

Diğer şıklar: **A** lovingly (sevgiyle) / **C** loudly (yüksek sesle) / **D** tightly (sıkıca) / **E** evenly (eşit biçimde).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The charity was founded to ---- poverty in the region by providing training and small loans to people who want to start a business.$q$, array[$o$restore$o$, $o$inherit$o$, $o$illustrate$o$, $o$combat$o$, $o$comprise$o$], 3, $e$1. Boşluğa **combat** (mücadele etmek) gelir. Eğitim ve kredi vererek yoksullukla mücadele etmek combat ile söylenir.

Diğer şıklar: **A** restore (onarmak) / **B** inherit (miras almak) / **C** illustrate (örneklemek) / **E** comprise (kapsamak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The two countries have decided to ---- diplomatic relations after the ambassador was expelled, and each has ordered the other's diplomats to leave.$q$, array[$o$hand over$o$, $o$work in$o$, $o$break off$o$, $o$pass up$o$, $o$sit up$o$], 2, $e$1. Boşluğa **break off** (kesmek) gelir. Büyükelçinin sınır dışı edilmesinin ardından ilişkileri kesmek break off ile söylenir.

Diğer şıklar: **A** hand over (teslim etmek) / **B** work in (dahil etmek) / **D** pass up (kaçırmak) / **E** sit up (dik oturmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$A sudden ---- in the political system, with the fall of the government and the arrival of a new leader, surprised the whole region.$q$, array[$o$upheaval$o$, $o$allowance$o$, $o$pastime$o$, $o$fabric$o$, $o$anthem$o$], 0, $e$1. Boşluğa **upheaval** (altüst oluş) gelir. Hükümetin düşüp yeni liderin gelmesi siyasi altüst oluştur.

Diğer şıklar: **B** allowance (ödenek) / **C** pastime (hobi) / **D** fabric (kumaş) / **E** anthem (marş).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$It would be ---- to ignore the warnings of the experts, who have been predicting this crisis for more than ten years.$q$, array[$o$sensible$o$, $o$essential$o$, $o$legitimate$o$, $o$rational$o$, $o$unwise$o$], 4, $e$1. Boşluğa **unwise** (akılsızca) gelir. On yıldır uyaran uzmanları dinlememek akılsızcadır.

Diğer şıklar: **A** sensible (makul) / **B** essential (gerekli) / **C** legitimate (meşru) / **D** rational (mantıklı).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The president has ---- campaigned for education reform, giving speeches in more than fifty cities in a single month.$q$, array[$o$barely$o$, $o$faintly$o$, $o$vigorously$o$, $o$hardly$o$, $o$vaguely$o$], 2, $e$1. Boşluğa **vigorously** (güçlü biçimde) gelir. Bir ayda elliden fazla şehirde konuşmak yoğun bir kampanyadır.

Diğer şıklar: **A** barely (zar zor) / **B** faintly (belli belirsiz) / **D** hardly (neredeyse hiç) / **E** vaguely (belirsizce).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Employees who ---- the company's rules may be dismissed, even if they have worked there for many years.$q$, array[$o$violate$o$, $o$follow$o$, $o$approve$o$, $o$respect$o$, $o$observe$o$], 0, $e$1. Boşluğa **violate** (ihlal etmek) gelir. Kuralları çiğneyenin işten çıkarılabilmesi ihlali gösterir.

Diğer şıklar: **B** follow (izlemek) / **C** approve (onaylamak) / **D** respect (saygı göstermek) / **E** observe (gözlemlemek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The charity will ---- homeless families during the winter, offering them beds, hot meals and medical care in its old school building.$q$, array[$o$run out$o$, $o$cut across$o$, $o$break up$o$, $o$take in$o$, $o$give off$o$], 3, $e$1. Boşluğa **take in** (barındırmak) gelir. Evsiz ailelere barınak sağlamak take in ile söylenir.

Diğer şıklar: **A** run out (tükenmek) / **B** cut across (aşmak) / **C** break up (dağılmak) / **E** give off (yaymak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 41
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 41$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$She showed great courage in the face of ----, continuing to study even after losing her home and most of her belongings in the flood.$q$, array[$o$hospitality$o$, $o$authority$o$, $o$vanity$o$, $o$sincerity$o$, $o$adversity$o$], 4, $e$1. Boşluğa **adversity** (zorluk) gelir. Evini kaybedip okumaya devam etmek zorluk karşısında cesarettir.

Diğer şıklar: **A** hospitality (konukseverlik) / **B** authority (otorite) / **C** vanity (kibir) / **D** sincerity (samimiyet).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The climb to the summit was ---- and took nearly ten hours, with steep rocks, strong winds and very little oxygen.$q$, array[$o$arduous$o$, $o$effortless$o$, $o$pleasant$o$, $o$brief$o$, $o$casual$o$], 0, $e$1. Boşluğa **arduous** (zorlu) gelir. On saat süren, dik kayalı ve oksijensiz tırmanış çok zorludur.

Diğer şıklar: **B** effortless (zahmetsiz) / **C** pleasant (hoş) / **D** brief (kısa) / **E** casual (gelişigüzel).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The baby cried ---- throughout the night, and neither the parents nor the neighbours were able to sleep for more than ten minutes.$q$, array[$o$briefly$o$, $o$softly$o$, $o$occasionally$o$, $o$incessantly$o$, $o$hardly$o$], 3, $e$1. Boşluğa **incessantly** (durmaksızın) gelir. Kimsenin on dakikadan fazla uyuyamaması durmaksızın ağlamayı gösterir.

Diğer şıklar: **A** briefly (kısaca) / **B** softly (yumuşakça) / **C** occasionally (ara sıra) / **E** hardly (zar zor).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The police used tear gas to ---- the crowd, and within half an hour the square was completely empty.$q$, array[$o$gather$o$, $o$welcome$o$, $o$organise$o$, $o$protect$o$, $o$disperse$o$], 4, $e$1. Boşluğa **disperse** (dağıtmak) gelir. Meydanın boşalması kalabalığın dağıtıldığını gösterir.

Diğer şıklar: **A** gather (toplamak) / **B** welcome (karşılamak) / **C** organise (düzenlemek) / **D** protect (korumak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Eating too much sugar over many years can ---- serious health problems such as diabetes and heart disease.$q$, array[$o$get over$o$, $o$break up$o$, $o$lead to$o$, $o$turn off$o$, $o$give in$o$], 2, $e$1. Boşluğa **lead to** (yol açmak) gelir. Şeker tüketiminin hastalıklara yol açması lead to ile söylenir.

Diğer şıklar: **A** get over (atlatmak) / **B** break up (dağılmak) / **D** turn off (kapatmak) / **E** give in (pes etmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The scientists could not explain the ---- in the data, since one measurement was ten times higher than all the others.$q$, array[$o$anomaly$o$, $o$agreement$o$, $o$rehearsal$o$, $o$balance$o$, $o$delivery$o$], 0, $e$1. Boşluğa **anomaly** (anormallik) gelir. Diğerlerinden on kat yüksek ölçüm veri içindeki bir anormalliktir.

Diğer şıklar: **B** agreement (anlaşma) / **C** rehearsal (prova) / **D** balance (denge) / **E** delivery (teslimat).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The volcano has been ---- for hundreds of years, but scientists say that it could erupt again at any time.$q$, array[$o$extinct$o$, $o$dormant$o$, $o$fertile$o$, $o$pivotal$o$, $o$lucid$o$], 1, $e$1. Boşluğa **dormant** (uykuda) gelir. Yeniden patlayabilme ihtimali yanardağın uykuda olduğunu gösterir.

Diğer şıklar: **A** extinct (sönmüş) / **C** fertile (verimli) / **D** pivotal (kilit) / **E** lucid (anlaşılır).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The accountant ---- checked every figure in the report, correcting even the smallest mistakes before it was sent to the board.$q$, array[$o$carelessly$o$, $o$hastily$o$, $o$vaguely$o$, $o$loosely$o$, $o$meticulously$o$], 4, $e$1. Boşluğa **meticulously** (titizlikle) gelir. En küçük hataları bile düzeltmek titiz kontroldür.

Diğer şıklar: **A** carelessly (dikkatsizce) / **B** hastily (aceleyle) / **C** vaguely (belirsizce) / **D** loosely (gevşekçe).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Strict rules and constant control may ---- creativity, because people become afraid of trying anything new.$q$, array[$o$stifle$o$, $o$stimulate$o$, $o$inspire$o$, $o$reward$o$, $o$enhance$o$], 0, $e$1. Boşluğa **stifle** (bastırmak) gelir. Yenilikten korkulması yaratıcılığın bastırıldığını gösterir.

Diğer şıklar: **B** stimulate (uyarmak) / **C** inspire (ilham vermek) / **D** reward (ödüllendirmek) / **E** enhance (artırmak).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The patient's condition suddenly became worse, so the nurse quickly ---- the doctor, who arrived within minutes.$q$, array[$o$went through$o$, $o$looked up to$o$, $o$sent for$o$, $o$took over$o$, $o$made up$o$], 2, $e$1. Boşluğa **sent for** (çağırtmak) gelir. Birkaç dakikada gelen doktoru çağırtmak send for ile söylenir.

Diğer şıklar: **A** went through (geçirmek) / **B** looked up to (saygı duymak) / **D** took over (devralmak) / **E** made up (uydurmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Scientists have announced a major ---- in the treatment of cancer, and the new drug could save thousands of lives each year.$q$, array[$o$disaster$o$, $o$breakthrough$o$, $o$rumour$o$, $o$delay$o$, $o$loss$o$], 1, $e$1. Boşluğa **breakthrough** (atılım) gelir. Binlerce hayat kurtaracak yeni ilaç büyük bir atılımdır.

Diğer şıklar: **A** disaster (felaket) / **C** rumour (söylenti) / **D** delay (gecikme) / **E** loss (kayıp).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$The wedding was a ---- event, with five hundred guests, a famous orchestra and food prepared by chefs from three countries.$q$, array[$o$modest$o$, $o$informal$o$, $o$private$o$, $o$lavish$o$, $o$hasty$o$], 3, $e$1. Boşluğa **lavish** (görkemli) gelir. Beş yüz konuk ve ünlü orkestra görkemli bir düğünü gösterir.

Diğer şıklar: **A** modest (mütevazı) / **B** informal (resmî olmayan) / **C** private (özel) / **E** hasty (aceleci).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Although nobody had said anything openly, the members of the team ---- agreed that the coach should be replaced after the defeat.$q$, array[$o$vehemently$o$, $o$loudly$o$, $o$tacitly$o$, $o$publicly$o$, $o$formally$o$], 2, $e$1. Boşluğa **tacitly** (zımnen) gelir. Kimsenin açıkça söylememesi zımni mutabakatı gösterir.

Diğer şıklar: **A** vehemently (şiddetle) / **B** loudly (yüksek sesle) / **D** publicly (alenen) / **E** formally (resmen).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The king decided to ---- a title of honour on the general who had saved the capital from the enemy.$q$, array[$o$extract$o$, $o$bestow$o$, $o$conceal$o$, $o$withdraw$o$, $o$collect$o$], 1, $e$1. Boşluğa **bestow** (bahşetmek) gelir. Başkenti kurtaran generale unvan vermek bestow ile söylenir.

Diğer şıklar: **A** extract (çıkarmak) / **C** conceal (gizlemek) / **D** withdraw (çekmek) / **E** collect (toplamak).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The software is designed to ---- harmful content before it reaches children, so parents do not have to check every website.$q$, array[$o$screen out$o$, $o$pour in$o$, $o$stand for$o$, $o$give off$o$, $o$spell out$o$], 0, $e$1. Boşluğa **screen out** (elemek) gelir. Zararlı içeriği çocuklara ulaşmadan elemek screen out ile söylenir.

Diğer şıklar: **B** pour in (akın etmek) / **C** stand for (anlamına gelmek) / **D** give off (yaymak) / **E** spell out (açıkça belirtmek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The ---- of the law has caused confusion, because it can be understood in two completely different ways.$q$, array[$o$accuracy$o$, $o$simplicity$o$, $o$clarity$o$, $o$ambiguity$o$, $o$majority$o$], 3, $e$1. Boşluğa **ambiguity** (belirsizlik) gelir. İki farklı biçimde anlaşılabilmesi yasanın belirsizliğidir.

Diğer şıklar: **A** accuracy (doğruluk) / **B** simplicity (sadelik) / **C** clarity (açıklık) / **E** majority (çoğunluk).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Driving on icy roads without winter tyres is extremely ----, and the police advise people to stay at home in bad weather.$q$, array[$o$harmless$o$, $o$hazardous$o$, $o$convenient$o$, $o$profitable$o$, $o$amusing$o$], 1, $e$1. Boşluğa **hazardous** (tehlikeli) gelir. Polisin evde kalmayı önermesi sürüşün tehlikeli olduğunu gösterir.

Diğer şıklar: **A** harmless (zararsız) / **C** convenient (elverişli) / **D** profitable (kârlı) / **E** amusing (eğlenceli).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The villagers ---- refused to leave their homes, even when the army warned them that the river was about to flood the valley.$q$, array[$o$hesitantly$o$, $o$gently$o$, $o$lazily$o$, $o$hastily$o$, $o$resolutely$o$], 4, $e$1. Boşluğa **resolutely** (kararlılıkla) gelir. Orduya rağmen evden ayrılmamak kararlılıktır.

Diğer şıklar: **A** hesitantly (tereddütle) / **B** gently (nazikçe) / **C** lazily (tembelce) / **D** hastily (aceleyle).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The company was accused of trying to ---- important information from investors about the risks of the new project.$q$, array[$o$reveal$o$, $o$publish$o$, $o$withhold$o$, $o$announce$o$, $o$confirm$o$], 2, $e$1. Boşluğa **withhold** (esirgemek) gelir. Yatırımcılardan bilgi gizlemekle suçlanmak withhold ile söylenir.

Diğer şıklar: **A** reveal (ortaya çıkarmak) / **B** publish (yayımlamak) / **D** announce (duyurmak) / **E** confirm (doğrulamak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Police have ---- the list of suspects to three men, all of whom were in the building at the time of the robbery.$q$, array[$o$broken down$o$, $o$wound down$o$, $o$turned down$o$, $o$narrowed down$o$, $o$sat down$o$], 3, $e$1. Boşluğa **narrowed down** (daraltmak) gelir. Şüpheli listesini üç kişiye düşürmek narrow down ile söylenir.

Diğer şıklar: **A** broken down (bozulmak) / **B** wound down (sona erdirmek) / **C** turned down (reddetmek) / **E** sat down (oturmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 42
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 42$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The northern lights are a natural ---- caused by charged particles from the Sun colliding with gases in the Earth's atmosphere.$q$, array[$o$recipe$o$, $o$phenomenon$o$, $o$invoice$o$, $o$appointment$o$, $o$treaty$o$], 1, $e$1. Boşluğa **phenomenon** (olgu) gelir. Güneş parçacıklarının yol açtığı doğal olay bir olgudur.

Diğer şıklar: **A** recipe (tarif) / **C** invoice (fatura) / **D** appointment (randevu) / **E** treaty (antlaşma).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The court decided that the company had a ---- reason to dismiss the worker, since he had repeatedly ignored safety rules.$q$, array[$o$trivial$o$, $o$vague$o$, $o$arbitrary$o$, $o$hostile$o$, $o$legitimate$o$], 4, $e$1. Boşluğa **legitimate** (meşru) gelir. Güvenlik kurallarını çiğneyen işçiyi çıkarmak meşru bir nedendir.

Diğer şıklar: **A** trivial (önemsiz) / **B** vague (belirsiz) / **C** arbitrary (keyfi) / **D** hostile (düşmanca).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$----, a tomato is a fruit, but most people use it as a vegetable in cooking.$q$, array[$o$Rarely$o$, $o$Reluctantly$o$, $o$Technically$o$, $o$Hardly$o$, $o$Lazily$o$], 2, $e$1. Boşluğa **Technically** (Teknik olarak) gelir. Bilimsel sınıflandırmaya göre domates meyvedir.

Diğer şıklar: **A** Rarely (Nadiren) / **B** Reluctantly (İsteksizce) / **D** Hardly (Zar zor) / **E** Lazily (Tembelce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Becoming a doctor will ---- many years of study and training, as well as long hours of work in hospitals.$q$, array[$o$entail$o$, $o$evoke$o$, $o$elect$o$, $o$retain$o$, $o$resent$o$], 0, $e$1. Boşluğa **entail** (gerektirmek) gelir. Yıllarca eğitimi gerektirmek entail ile söylenir.

Diğer şıklar: **B** evoke (çağrıştırmak) / **C** elect (seçmek) / **D** retain (elde tutmak) / **E** resent (içerlemek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$She waited for an hour, but her friend did not ----, so she finally went home alone.$q$, array[$o$break out$o$, $o$sell out$o$, $o$fall for$o$, $o$look out$o$, $o$turn up$o$], 4, $e$1. Boşluğa **turn up** (gelmek) gelir. Arkadaşının gelmemesi turn up ile söylenir.

Diğer şıklar: **A** break out (patlak vermek) / **B** sell out (tükenmek) / **C** fall for (aşık olmak) / **D** look out (dikkat etmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The government is preparing new ---- to protect personal data, and companies that fail to follow it will face heavy fines.$q$, array[$o$delivery$o$, $o$reception$o$, $o$legislation$o$, $o$invitation$o$, $o$suspicion$o$], 2, $e$1. Boşluğa **legislation** (mevzuat) gelir. Uymayanlara ceza getiren düzenleme mevzuattır.

Diğer şıklar: **A** delivery (teslimat) / **B** reception (resepsiyon) / **D** invitation (davet) / **E** suspicion (şüphe).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$---- exposure to strong sunlight can damage the skin and increase the risk of cancer, even if you do not feel any pain at the time.$q$, array[$o$Brief$o$, $o$Rare$o$, $o$Casual$o$, $o$Prolonged$o$, $o$Gentle$o$], 3, $e$1. Boşluğa **Prolonged** (Uzun süren) gelir. Cilde ve kansere zarar veren maruz kalma uzun süren maruziyettir.

Diğer şıklar: **A** Brief (Kısa) / **B** Rare (Nadir) / **C** Casual (Gelişigüzel) / **E** Gentle (Nazik).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Rice has ---- been the main food in Asia, where people have grown it for more than five thousand years.$q$, array[$o$historically$o$, $o$lightly$o$, $o$briefly$o$, $o$hardly$o$, $o$secretly$o$], 0, $e$1. Boşluğa **historically** (tarih boyunca) gelir. Beş bin yıldır yetiştirilmesi tarihsel bir gerçektir.

Diğer şıklar: **B** lightly (hafifçe) / **C** briefly (kısaca) / **D** hardly (neredeyse hiç) / **E** secretly (gizlice).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Fallen trees and mud on the road continue to ---- the work of the rescue teams in the mountain villages.$q$, array[$o$assist$o$, $o$welcome$o$, $o$impede$o$, $o$remind$o$, $o$advance$o$], 2, $e$1. Boşluğa **impede** (engellemek) gelir. Yoldaki çamur ve ağaçlar kurtarma çalışmalarını engeller.

Diğer şıklar: **A** assist (yardım etmek) / **B** welcome (karşılamak) / **D** remind (hatırlatmak) / **E** advance (ilerletmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Rising unemployment and corruption scandals could ---- the government before the end of the year.$q$, array[$o$hold on$o$, $o$pass away$o$, $o$take up$o$, $o$get along$o$, $o$bring down$o$], 4, $e$1. Boşluğa **bring down** (devirmek) gelir. Hükümeti düşürmek bring down ile söylenir.

Diğer şıklar: **A** hold on (tutunmak) / **B** pass away (vefat etmek) / **C** take up (başlamak) / **D** get along (geçinmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The noise from the building site next door has become a real ---- for the residents, who cannot sleep or work in peace.$q$, array[$o$nuisance$o$, $o$privilege$o$, $o$pleasure$o$, $o$benefit$o$, $o$reward$o$], 0, $e$1. Boşluğa **nuisance** (rahatsızlık) gelir. Sakinlerin uyuyamaması gürültünün baş belası olduğunu gösterir.

Diğer şıklar: **B** privilege (ayrıcalık) / **C** pleasure (zevk) / **D** benefit (yarar) / **E** reward (ödül).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$Water is ---- for all living things, and no animal or plant can survive for long without it.$q$, array[$o$harmful$o$, $o$optional$o$, $o$trivial$o$, $o$vital$o$, $o$temporary$o$], 3, $e$1. Boşluğa **vital** (hayati) gelir. Susuz hayatta kalınamaması suyun hayati olduğunu gösterir.

Diğer şıklar: **A** harmful (zararlı) / **B** optional (isteğe bağlı) / **C** trivial (önemsiz) / **E** temporary (geçici).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$The building was ---- a palace, but it was turned into a hospital after the war and is now a museum.$q$, array[$o$suddenly$o$, $o$originally$o$, $o$hardly$o$, $o$loudly$o$, $o$roughly$o$], 1, $e$1. Boşluğa **originally** (aslında) gelir. Sonradan hastane ve müze olan binanın ilk kullanımı sarayıdır.

Diğer şıklar: **A** suddenly (aniden) / **C** hardly (zar zor) / **D** loudly (yüksek sesle) / **E** roughly (kabaca).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$Several old buildings began to ---- during the earthquake, and rescue teams searched the ruins for survivors for days.$q$, array[$o$collapse$o$, $o$expand$o$, $o$recover$o$, $o$promote$o$, $o$escape$o$], 0, $e$1. Boşluğa **collapse** (çökmek) gelir. Enkazda günlerce arama yapılması binaların çöktüğünü gösterir.

Diğer şıklar: **B** expand (genişlemek) / **C** recover (iyileşmek) / **D** promote (terfi ettirmek) / **E** escape (kaçmak).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$The old chair began to ---- when he sat on it, and the legs and the seat dropped to the floor in pieces.$q$, array[$o$show off$o$, $o$lay off$o$, $o$hand out$o$, $o$fall apart$o$, $o$step up$o$], 3, $e$1. Boşluğa **fall apart** (dağılmak) gelir. Parçalara ayrılan sandalye dağılmıştır.

Diğer şıklar: **A** show off (gösteriş yapmak) / **B** lay off (işten çıkarmak) / **C** hand out (dağıtmak) / **E** step up (artırmak).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$The new director promised to continue the reforms started by his ----, who had retired after twelve years in the post.$q$, array[$o$rival$o$, $o$predecessor$o$, $o$tenant$o$, $o$witness$o$, $o$critic$o$], 1, $e$1. Boşluğa **predecessor** (selef) gelir. On iki yıl görev yapıp emekli olan önceki yönetici selefidir.

Diğer şıklar: **A** rival (rakip) / **C** tenant (kiracı) / **D** witness (tanık) / **E** critic (eleştirmen).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Every sport has certain ---- risks, and even the most experienced players cannot completely avoid the possibility of injury.$q$, array[$o$casual$o$, $o$voluntary$o$, $o$inherent$o$, $o$marginal$o$, $o$foreign$o$], 2, $e$1. Boşluğa **inherent** (doğal) gelir. En deneyimlilerin bile kaçınamadığı risk sporun doğasında vardır.

Diğer şıklar: **A** casual (gelişigüzel) / **B** voluntary (gönüllü) / **D** marginal (ikincil) / **E** foreign (yabancı).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The decision was based ---- on the evidence presented in court, and no other information was taken into account.$q$, array[$o$barely$o$, $o$loosely$o$, $o$vaguely$o$, $o$gently$o$, $o$solely$o$], 4, $e$1. Boşluğa **solely** (yalnızca) gelir. Başka bilgi dikkate alınmadığı için karar yalnızca delile dayanır.

Diğer şıklar: **A** barely (zar zor) / **B** loosely (gevşekçe) / **C** vaguely (belirsizce) / **D** gently (nazikçe).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Some newspapers ---- the truth by publishing only the facts that support their own political views.$q$, array[$o$reveal$o$, $o$simplify$o$, $o$confirm$o$, $o$distort$o$, $o$honour$o$], 3, $e$1. Boşluğa **distort** (çarpıtmak) gelir. Yalnızca işine gelen gerçekleri yayımlamak gerçeği çarpıtmaktır.

Diğer şıklar: **A** reveal (ortaya çıkarmak) / **B** simplify (basitleştirmek) / **C** confirm (doğrulamak) / **E** honour (onurlandırmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$He promised to help us with the project, but he ---- us at the last minute and we had to finish it alone.$q$, array[$o$put up$o$, $o$let down$o$, $o$held on$o$, $o$gave in$o$, $o$set out$o$], 1, $e$1. Boşluğa **let down** (hayal kırıklığına uğratmak) gelir. Son anda yalnız bırakmak let down ile söylenir.

Diğer şıklar: **A** put up (dikmek) / **C** held on (tutunmak) / **D** gave in (pes etmek) / **E** set out (yola çıkmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 43
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 43$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The village has fewer than two hundred ----, and most of the young people have left to look for work in the big cities.$q$, array[$o$suspects$o$, $o$auditors$o$, $o$tourists$o$, $o$assistants$o$, $o$inhabitants$o$], 4, $e$1. Boşluğa **inhabitants** (sakinler) gelir. Köyde yaşayan insanlar sakinlerdir.

Diğer şıklar: **A** suspects (şüpheliler) / **B** auditors (denetçiler) / **C** tourists (turistler) / **D** assistants (asistanlar).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The new smartphone uses ---- technology that can recognise a person's face even in poor light and from different angles.$q$, array[$o$sophisticated$o$, $o$primitive$o$, $o$feeble$o$, $o$dormant$o$, $o$trivial$o$], 0, $e$1. Boşluğa **sophisticated** (gelişmiş) gelir. Zayıf ışıkta bile yüz tanıyan teknoloji gelişmiştir.

Diğer şıklar: **B** primitive (ilkel) / **C** feeble (zayıf) / **D** dormant (uykuda) / **E** trivial (önemsiz).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The report was ---- based on information from newspapers, and the writer did not interview a single person.$q$, array[$o$barely$o$, $o$hardly$o$, $o$entirely$o$, $o$rarely$o$, $o$lightly$o$], 2, $e$1. Boşluğa **entirely** (tamamen) gelir. Kimseyle görüşülmemesi raporun tamamen gazetelere dayandığını gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** hardly (neredeyse hiç) / **D** rarely (nadiren) / **E** lightly (hafifçe).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Parents who ---- their children's education often find that their children fall behind and lose interest in school.$q$, array[$o$support$o$, $o$neglect$o$, $o$encourage$o$, $o$respect$o$, $o$promote$o$], 1, $e$1. Boşluğa **neglect** (ihmal etmek) gelir. Çocukların geri kalması eğitimin ihmal edildiğini gösterir.

Diğer şıklar: **A** support (desteklemek) / **C** encourage (cesaretlendirmek) / **D** respect (saygı göstermek) / **E** promote (teşvik etmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Firefighters worked all night to ---- the fire in the forest, which had already destroyed more than a hundred hectares.$q$, array[$o$put out$o$, $o$take up$o$, $o$let down$o$, $o$hand in$o$, $o$pick up$o$], 0, $e$1. Boşluğa **put out** (söndürmek) gelir. Yangını söndürmek put out ile söylenir.

Diğer şıklar: **B** take up (başlamak) / **C** let down (hayal kırıklığına uğratmak) / **D** hand in (teslim etmek) / **E** pick up (toplamak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Young graduates in the region face poor job ----, since many factories have closed and few new companies have opened.$q$, array[$o$punishments$o$, $o$souvenirs$o$, $o$prospects$o$, $o$pastimes$o$, $o$pledges$o$], 2, $e$1. Boşluğa **prospects** (beklentiler) gelir. Fabrikalar kapanınca iş beklentileri kötüleşir.

Diğer şıklar: **A** punishments (cezalar) / **B** souvenirs (hatıralar) / **D** pastimes (hobiler) / **E** pledges (sözler).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She received an award for her ---- performance in the exam, since she was the only student to get full marks.$q$, array[$o$ordinary$o$, $o$mediocre$o$, $o$regular$o$, $o$modest$o$, $o$outstanding$o$], 4, $e$1. Boşluğa **outstanding** (olağanüstü) gelir. Tek tam puan alan öğrencinin başarısı olağanüstüdür.

Diğer şıklar: **A** ordinary (sıradan) / **B** mediocre (vasat) / **C** regular (düzenli) / **D** modest (mütevazı).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The two companies signed a ---- beneficial agreement, which gave each of them access to the other's technology and markets.$q$, array[$o$reluctantly$o$, $o$narrowly$o$, $o$loosely$o$, $o$mutually$o$, $o$vaguely$o$], 3, $e$1. Boşluğa **mutually** (karşılıklı olarak) gelir. Her iki tarafın da kazandığı anlaşma karşılıklı yararlıdır.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** narrowly (ucu ucuna) / **C** loosely (gevşekçe) / **E** vaguely (belirsizce).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The committee will ---- representatives from every region of the country, so that all opinions can be heard.$q$, array[$o$dismiss$o$, $o$comprise$o$, $o$cancel$o$, $o$reject$o$, $o$withdraw$o$], 1, $e$1. Boşluğa **comprise** (oluşturmak) gelir. Her bölgenin temsilcisinden oluşmak comprise ile söylenir.

Diğer şıklar: **A** dismiss (reddetmek) / **C** cancel (iptal etmek) / **D** reject (reddetmek) / **E** withdraw (çekmek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$Thieves ---- the shop through a back window and stole computers and phones worth more than ten thousand pounds.$q$, array[$o$broke into$o$, $o$came out$o$, $o$fell behind$o$, $o$went along$o$, $o$kept off$o$], 0, $e$1. Boşluğa **broke into** (zorla girmek) gelir. Arka pencereden dükkâna zorla girmek break into ile söylenir.

Diğer şıklar: **B** came out (çıkmak) / **C** fell behind (geride kalmak) / **D** went along (uymak) / **E** kept off (uzak durmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The team's ---- during the season, with as many defeats as victories, disappointed fans who had expected a title.$q$, array[$o$brilliance$o$, $o$supremacy$o$, $o$mediocrity$o$, $o$triumph$o$, $o$dominance$o$], 2, $e$1. Boşluğa **mediocrity** (vasatlık) gelir. Yenilgi kadar galibiyetle şampiyonluk beklentisini karşılamamak vasatlıktır.

Diğer şıklar: **A** brilliance (parlaklık) / **B** supremacy (üstünlük) / **D** triumph (zafer) / **E** dominance (hâkimiyet).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Your passport must be ---- for at least six months after the date of your arrival, or you may be refused entry.$q$, array[$o$fragile$o$, $o$humid$o$, $o$rural$o$, $o$eager$o$, $o$valid$o$], 4, $e$1. Boşluğa **valid** (geçerli) gelir. Giriş için pasaportun süresi geçerli olmalıdır.

Diğer şıklar: **A** fragile (kırılgan) / **B** humid (nemli) / **C** rural (kırsal) / **D** eager (hevesli).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The old man recognised his daughter ----, even though he had not seen her for more than twenty years.$q$, array[$o$gradually$o$, $o$hardly$o$, $o$eventually$o$, $o$instantly$o$, $o$reluctantly$o$], 3, $e$1. Boşluğa **instantly** (anında) gelir. Yirmi yıldır görmemesine rağmen hemen tanımak anındadır.

Diğer şıklar: **A** gradually (giderek) / **B** hardly (zar zor) / **C** eventually (sonunda) / **E** reluctantly (isteksizce).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$The price of gold tends to ---- from month to month, depending on political events and the strength of the dollar.$q$, array[$o$hesitate$o$, $o$fluctuate$o$, $o$evacuate$o$, $o$retire$o$, $o$retreat$o$], 1, $e$1. Boşluğa **fluctuate** (dalgalanmak) gelir. Aydan aya değişen fiyat dalgalanır.

Diğer şıklar: **A** hesitate (tereddüt etmek) / **C** evacuate (tahliye etmek) / **D** retire (emekli olmak) / **E** retreat (geri çekilmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$If you ---- for a moment, I will check whether the manager is available to speak to you.$q$, array[$o$hold on$o$, $o$wear out$o$, $o$cut off$o$, $o$pass on$o$, $o$give up$o$], 0, $e$1. Boşluğa **hold on** (beklemek) gelir. Telefonda beklemek hold on ile söylenir.

Diğer şıklar: **B** wear out (yıpratmak) / **C** cut off (kesmek) / **D** pass on (aktarmak) / **E** give up (vazgeçmek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$After three days of discussion, the jury delivered its ----: the accused was found not guilty of all charges.$q$, array[$o$rehearsal$o$, $o$ingredient$o$, $o$tribute$o$, $o$vacancy$o$, $o$verdict$o$], 4, $e$1. Boşluğa **verdict** (karar) gelir. Sanığın suçsuz bulunması jürinin kararıdır.

Diğer şıklar: **A** rehearsal (prova) / **B** ingredient (bileşen) / **C** tribute (saygı gösterisi) / **D** vacancy (boş kadro).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The instructions must be ---- because even a small mistake in measuring the chemicals could cause an explosion.$q$, array[$o$vague$o$, $o$casual$o$, $o$flexible$o$, $o$precise$o$, $o$optional$o$], 3, $e$1. Boşluğa **precise** (kesin) gelir. Küçük ölçüm hatasının patlamaya yol açması talimatın kesin olmasını gerektirir.

Diğer şıklar: **A** vague (belirsiz) / **B** casual (gelişigüzel) / **C** flexible (esnek) / **E** optional (isteğe bağlı).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The region is ---- very poor, although its landscape and cultural heritage attract thousands of visitors every year.$q$, array[$o$musically$o$, $o$medically$o$, $o$economically$o$, $o$legally$o$, $o$chemically$o$], 2, $e$1. Boşluğa **economically** (ekonomik olarak) gelir. Ziyaretçi çekmesine karşın bölge ekonomik olarak yoksuldur.

Diğer şıklar: **A** musically (müzikal olarak) / **B** medically (tıbbi olarak) / **D** legally (yasal olarak) / **E** chemically (kimyasal olarak).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The doctor told the patient to ---- himself to bed for at least a week and to avoid all physical activity.$q$, array[$o$pursue$o$, $o$confine$o$, $o$declare$o$, $o$elect$o$, $o$bury$o$], 1, $e$1. Boşluğa **confine** (sınırlamak) gelir. Hareketsiz yatağa bağlı kalmak confine oneself to ile söylenir.

Diğer şıklar: **A** pursue (peşinden gitmek) / **C** declare (ilan etmek) / **D** elect (seçmek) / **E** bury (gömmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Journalists managed to ---- documents proving that the company had known about the danger for years, and the story caused a scandal.$q$, array[$o$tear down$o$, $o$carry on$o$, $o$tell apart$o$, $o$dig up$o$, $o$wipe out$o$], 3, $e$1. Boşluğa **dig up** (ortaya çıkarmak) gelir. Saklı belgeleri bulup çıkarmak dig up ile söylenir.

Diğer şıklar: **A** tear down (yıkmak) / **B** carry on (sürdürmek) / **C** tell apart (ayırt etmek) / **E** wipe out (yok etmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 44
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 44$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$After five hours of talks, the negotiations ended in a ----, with neither side willing to give way and no agreement signed.$q$, array[$o$treaty$o$, $o$stalemate$o$, $o$sermon$o$, $o$vacancy$o$, $o$ritual$o$], 1, $e$1. Boşluğa **stalemate** (çıkmaz) gelir. Hiçbir tarafın taviz vermediği müzakere çıkmazla bitmiştir.

Diğer şıklar: **A** treaty (antlaşma) / **C** sermon (vaaz) / **D** vacancy (boş kadro) / **E** ritual (ritüel).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The old machine was large and ----, and it took four men to move it from the workshop to the lorry.$q$, array[$o$cumbersome$o$, $o$portable$o$, $o$elegant$o$, $o$compact$o$, $o$graceful$o$], 0, $e$1. Boşluğa **cumbersome** (hantal) gelir. Dört kişinin taşıyabildiği makine hantaldır.

Diğer şıklar: **B** portable (taşınabilir) / **C** elegant (zarif) / **D** compact (derli toplu) / **E** graceful (zarif).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The manager spoke so ---- that several employees were shocked by his words, and one of them left the room in tears.$q$, array[$o$gently$o$, $o$politely$o$, $o$calmly$o$, $o$shyly$o$, $o$bluntly$o$], 4, $e$1. Boşluğa **bluntly** (açık sözlü biçimde) gelir. Çalışanları şoke eden konuşma sert ve açıktır.

Diğer şıklar: **A** gently (nazikçe) / **B** politely (kibarca) / **C** calmly (sakince) / **D** shyly (utangaçça).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Several witnesses ---- that the police used excessive force during the protest, but the authorities have rejected these claims.$q$, array[$o$abandon$o$, $o$preserve$o$, $o$hesitate$o$, $o$allege$o$, $o$resign$o$], 3, $e$1. Boşluğa **allege** (iddia etmek) gelir. Yetkililerin reddettiği suçlama bir iddiadır.

Diğer şıklar: **A** abandon (terk etmek) / **B** preserve (korumak) / **C** hesitate (tereddüt etmek) / **E** resign (istifa etmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$Please ---- this form with your personal details and return it to the office before the end of the week.$q$, array[$o$fill in$o$, $o$pick up$o$, $o$hand out$o$, $o$break down$o$, $o$put off$o$], 0, $e$1. Boşluğa **fill in** (doldurmak) gelir. Formu bilgilerle doldurmak fill in ile söylenir.

Diğer şıklar: **B** pick up (almak) / **C** hand out (dağıtmak) / **D** break down (bozulmak) / **E** put off (ertelemek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Buying a used car can be risky, and one of the most common ---- is failing to check the history of the vehicle before paying.$q$, array[$o$privileges$o$, $o$rewards$o$, $o$pitfalls$o$, $o$hobbies$o$, $o$souvenirs$o$], 2, $e$1. Boşluğa **pitfalls** (tuzaklar) gelir. Aracın geçmişini kontrol etmemek ikinci el alımının yaygın tuzağıdır.

Diğer şıklar: **A** privileges (ayrıcalıklar) / **B** rewards (ödüller) / **D** hobbies (hobiler) / **E** souvenirs (hatıralar).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The calm surface of the lake is ----, because below it strong currents have already pulled several swimmers away from the shore.$q$, array[$o$honest$o$, $o$reliable$o$, $o$obvious$o$, $o$accurate$o$, $o$deceptive$o$], 4, $e$1. Boşluğa **deceptive** (aldatıcı) gelir. Altındaki akıntılar sakin görünüşün aldatıcı olduğunu gösterir.

Diğer şıklar: **A** honest (dürüst) / **B** reliable (güvenilir) / **C** obvious (açık) / **D** accurate (doğru).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The home team ---- won the match, scoring the winning goal in the last second after a long period of equal play.$q$, array[$o$easily$o$, $o$narrowly$o$, $o$comfortably$o$, $o$clearly$o$, $o$hugely$o$], 1, $e$1. Boşluğa **narrowly** (ucu ucuna) gelir. Son saniyede gelen golle kazanmak ucu ucuna kazanmaktır.

Diğer şıklar: **A** easily (kolayca) / **C** comfortably (rahatça) / **D** clearly (açıkça) / **E** hugely (muazzam biçimde).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The money the company saves on transport will ---- the higher cost of materials, so prices will remain the same.$q$, array[$o$inherit$o$, $o$provoke$o$, $o$offset$o$, $o$delay$o$, $o$assist$o$], 2, $e$1. Boşluğa **offset** (dengelemek) gelir. Fiyatların sabit kalması maliyet artışının dengelendiğini gösterir.

Diğer şıklar: **A** inherit (miras almak) / **B** provoke (kışkırtmak) / **D** delay (geciktirmek) / **E** assist (yardım etmek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$Battery power will ---- quickly if you leave the screen on, so it is better to turn the brightness down.$q$, array[$o$break in$o$, $o$sum up$o$, $o$stand for$o$, $o$pull out$o$, $o$run down$o$], 4, $e$1. Boşluğa **run down** (tükenmek) gelir. Ekran açıkken pilin hızla bitmesi run down ile söylenir.

Diğer şıklar: **A** break in (zorla girmek) / **B** sum up (özetlemek) / **C** stand for (anlamına gelmek) / **D** pull out (çekilmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$An ---- of flu at the school forced the authorities to close it for a week, as more than a hundred students had fallen ill.$q$, array[$o$invitation$o$, $o$ambition$o$, $o$audience$o$, $o$outbreak$o$, $o$occasion$o$], 3, $e$1. Boşluğa **outbreak** (salgın) gelir. Yüzden fazla öğrencinin hastalanması bir salgındır.

Diğer şıklar: **A** invitation (davet) / **B** ambition (hırs) / **C** audience (izleyici) / **E** occasion (fırsat).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$The weather was cold and ---- all week, with grey clouds and rain, and everybody longed for a sunny day.$q$, array[$o$gloomy$o$, $o$radiant$o$, $o$cheerful$o$, $o$pleasant$o$, $o$scenic$o$], 0, $e$1. Boşluğa **gloomy** (kasvetli) gelir. Gri bulut ve yağmurlu hava kasvetlidir.

Diğer şıklar: **B** radiant (parlak) / **C** cheerful (neşeli) / **D** pleasant (hoş) / **E** scenic (manzaralı).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$The journey was long and extremely tiring. ----, the children enjoyed every moment of it and asked to go again.$q$, array[$o$Therefore$o$, $o$Nonetheless$o$, $o$Likewise$o$, $o$Besides$o$, $o$Thus$o$], 1, $e$1. Boşluğa **Nonetheless** (Yine de) gelir. Yorucu olmasına rağmen çocukların keyif alması karşıtlıktır.

Diğer şıklar: **A** Therefore (Bu nedenle) / **C** Likewise (Aynı şekilde) / **D** Besides (Ayrıca) / **E** Thus (Böylece).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The price of oil continues to ---- as demand grows, and experts expect it to reach a record level next month.$q$, array[$o$dwindle$o$, $o$vanish$o$, $o$collapse$o$, $o$soar$o$, $o$retire$o$], 3, $e$1. Boşluğa **soar** (fırlamak) gelir. Rekor seviyeye gidecek fiyat fırlamaktadır.

Diğer şıklar: **A** dwindle (azalmak) / **B** vanish (yok olmak) / **C** collapse (çökmek) / **E** retire (emekli olmak).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Girls ---- about half of the students in the class, while boys are the other half.$q$, array[$o$make up$o$, $o$take off$o$, $o$hand in$o$, $o$put out$o$, $o$break out$o$], 0, $e$1. Boşluğa **make up** (oluşturmak) gelir. Sınıfın yarısını oluşturmak make up ile söylenir.

Diğer şıklar: **B** take off (çıkarmak) / **C** hand in (teslim etmek) / **D** put out (söndürmek) / **E** break out (patlak vermek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$There is no simple ---- for unemployment, but experts agree that better education and new industries would certainly help.$q$, array[$o$souvenir$o$, $o$pledge$o$, $o$remedy$o$, $o$vacancy$o$, $o$sermon$o$], 2, $e$1. Boşluğa **remedy** (çare) gelir. İşsizliğe basit bir çözüm olmadığı anlatılır.

Diğer şıklar: **A** souvenir (hatıra) / **B** pledge (söz) / **D** vacancy (boş kadro) / **E** sermon (vaaz).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$His ---- efforts finally paid off: after twelve rejections, a publisher agreed to print his first novel.$q$, array[$o$casual$o$, $o$persistent$o$, $o$reluctant$o$, $o$hasty$o$, $o$feeble$o$], 1, $e$1. Boşluğa **persistent** (azimli) gelir. On iki redden sonra vazgeçmeyen çaba azimlidir.

Diğer şıklar: **A** casual (gelişigüzel) / **C** reluctant (isteksiz) / **D** hasty (aceleci) / **E** feeble (zayıf).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The wind blew ---- across the open plain, and the travellers, who had no shelter, could do nothing but wait for the storm to end.$q$, array[$o$gently$o$, $o$softly$o$, $o$politely$o$, $o$gracefully$o$, $o$mercilessly$o$], 4, $e$1. Boşluğa **mercilessly** (acımasızca) gelir. Sığınaksız yolcuların beklemekten başka çare bulamaması rüzgârın acımasız olduğunu gösterir.

Diğer şıklar: **A** gently (nazikçe) / **B** softly (yumuşakça) / **C** politely (kibarca) / **D** gracefully (zarifçe).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The glass bottle fell from the table and ---- into hundreds of tiny pieces that were scattered all over the kitchen floor.$q$, array[$o$dissolved$o$, $o$bounced$o$, $o$melted$o$, $o$shattered$o$, $o$wandered$o$], 3, $e$1. Boşluğa **shattered** (parçalandı) gelir. Yüzlerce parçaya ayrılan şişe paramparça olmuştur.

Diğer şıklar: **A** dissolved (çözündü) / **B** bounced (sekti) / **C** melted (eridi) / **E** wandered (dolaştı).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$It was so hot in the room that several people began to feel dizzy, and one old man ---- and had to be carried outside.$q$, array[$o$picked up$o$, $o$pulled in$o$, $o$passed out$o$, $o$put on$o$, $o$ran off$o$], 2, $e$1. Boşluğa **passed out** (bayılmak) gelir. Dışarı taşınmak zorunda kalan yaşlı adam bayılmıştır.

Diğer şıklar: **A** picked up (almak) / **B** pulled in (girmek) / **D** put on (giymek) / **E** ran off (kaçmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 45
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 45$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The company had a ---- on the sale of electricity in the region for decades, so customers had no choice but to pay whatever price it asked.$q$, array[$o$pension$o$, $o$rehearsal$o$, $o$monopoly$o$, $o$audience$o$, $o$bargain$o$], 2, $e$1. Boşluğa **monopoly** (tekel) gelir. Müşterinin başka seçeneği olmaması tekeli gösterir.

Diğer şıklar: **A** pension (emekli maaşı) / **B** rehearsal (prova) / **D** audience (izleyici) / **E** bargain (pazarlık).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The snake's bite is ---- if it is not treated within an hour, so hikers in the region carry a special medicine.$q$, array[$o$lethal$o$, $o$harmless$o$, $o$tolerable$o$, $o$slight$o$, $o$minor$o$], 0, $e$1. Boşluğa **lethal** (öldürücü) gelir. Özel ilaç taşınması ısırığın öldürücü olduğunu gösterir.

Diğer şıklar: **B** harmless (zararsız) / **C** tolerable (katlanılabilir) / **D** slight (hafif) / **E** minor (küçük).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$She ---- believed that education could change the world, and she dedicated her whole life to building schools in poor regions.$q$, array[$o$barely$o$, $o$vaguely$o$, $o$casually$o$, $o$fervently$o$, $o$hardly$o$], 3, $e$1. Boşluğa **fervently** (tutkuyla) gelir. Bütün hayatını okul yapmaya adamak tutkulu bir inancı gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** vaguely (belirsizce) / **C** casually (gelişigüzel) / **E** hardly (neredeyse hiç).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Only the manager can ---- the payment of sums larger than one thousand pounds, so please send him the details first.$q$, array[$o$reject$o$, $o$authorise$o$, $o$resemble$o$, $o$murmur$o$, $o$locate$o$], 1, $e$1. Boşluğa **authorise** (yetki vermek) gelir. Yöneticinin onay vermesi authorise ile söylenir.

Diğer şıklar: **A** reject (reddetmek) / **C** resemble (benzemek) / **D** murmur (mırıldanmak) / **E** locate (yerini bulmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$After the argument, they decided to forgive each other and ----, and they never mentioned the subject again.$q$, array[$o$fall out$o$, $o$back out$o$, $o$break down$o$, $o$wear off$o$, $o$move on$o$], 4, $e$1. Boşluğa **move on** (devam etmek) gelir. Barışıp konuyu bir daha açmamak move on ile söylenir.

Diğer şıklar: **A** fall out (tartışmak) / **B** back out (vazgeçmek) / **C** break down (bozulmak) / **D** wear off (etkisini yitirmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- with the safety regulations is checked every year by inspectors, and factories that fail the inspection may be closed.$q$, array[$o$Resistance$o$, $o$Hesitation$o$, $o$Compliance$o$, $o$Departure$o$, $o$Reduction$o$], 2, $e$1. Boşluğa **Compliance** (Uyum) gelir. Kurallara uyumun yılda bir denetlenmesi compliance ile söylenir.

Diğer şıklar: **A** Resistance (Direnç) / **B** Hesitation (Tereddüt) / **D** Departure (Ayrılış) / **E** Reduction (Azaltma).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$Agatha Christie was a ---- writer who produced more than sixty novels and over a dozen collections of short stories.$q$, array[$o$reluctant$o$, $o$prolific$o$, $o$obscure$o$, $o$mediocre$o$, $o$hesitant$o$], 1, $e$1. Boşluğa **prolific** (üretken) gelir. Altmıştan fazla roman yazan yazar üretkendir.

Diğer şıklar: **A** reluctant (isteksiz) / **C** obscure (belirsiz) / **D** mediocre (vasat) / **E** hesitant (tereddütlü).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The government did not ---- support the rebels, but it secretly provided them with weapons and money.$q$, array[$o$reluctantly$o$, $o$briefly$o$, $o$lightly$o$, $o$overtly$o$, $o$sadly$o$], 3, $e$1. Boşluğa **overtly** (açıkça) gelir. Gizlice silah vermesi, açıktan desteklemediğini gösterir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** briefly (kısaca) / **C** lightly (hafifçe) / **E** sadly (üzüntüyle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The school plans to ---- the new timetable at the beginning of next term, after discussing it with parents and teachers.$q$, array[$o$interrupt$o$, $o$forget$o$, $o$entertain$o$, $o$mourn$o$, $o$implement$o$], 4, $e$1. Boşluğa **implement** (uygulamaya koymak) gelir. Yeni programı dönem başında uygulamak implement ile söylenir.

Diğer şıklar: **A** interrupt (bölmek) / **B** forget (unutmak) / **C** entertain (eğlendirmek) / **D** mourn (yas tutmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The dog growled loudly, and the postman slowly ---- when he realised that it was not a friendly animal.$q$, array[$o$sat in$o$, $o$backed off$o$, $o$ran up$o$, $o$came round$o$, $o$took in$o$], 1, $e$1. Boşluğa **backed off** (geri çekildi) gelir. Hırlayan köpekten uzaklaşmak back off ile söylenir.

Diğer şıklar: **A** sat in (katıldı) / **C** ran up (koştu) / **D** came round (ayıldı) / **E** took in (barındırdı).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$In the army, there is a strict ---- of ranks, and soldiers must obey the orders of those above them without question.$q$, array[$o$harvest$o$, $o$remedy$o$, $o$hierarchy$o$, $o$vacation$o$, $o$fiction$o$], 2, $e$1. Boşluğa **hierarchy** (hiyerarşi) gelir. Üst rütbeye itaat hiyerarşiyle ilgilidir.

Diğer şıklar: **A** harvest (hasat) / **B** remedy (çare) / **D** vacation (tatil) / **E** fiction (kurgu).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Applicants must pass a ---- series of tests, which includes a medical examination, a written paper and two interviews.$q$, array[$o$rigorous$o$, $o$casual$o$, $o$optional$o$, $o$spontaneous$o$, $o$lenient$o$], 0, $e$1. Boşluğa **rigorous** (sıkı) gelir. Tıbbi muayene, yazılı sınav ve iki mülakat sıkı bir değerlendirmedir.

Diğer şıklar: **B** casual (gelişigüzel) / **C** optional (isteğe bağlı) / **D** spontaneous (kendiliğinden) / **E** lenient (hoşgörülü).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The student walked ---- into the examination room, holding her pencil so tightly that her fingers turned white.$q$, array[$o$calmly$o$, $o$proudly$o$, $o$lazily$o$, $o$happily$o$, $o$nervously$o$], 4, $e$1. Boşluğa **nervously** (gergin biçimde) gelir. Kalemi sıkıca tutan öğrenci gergindir.

Diğer şıklar: **A** calmly (sakince) / **B** proudly (gururla) / **C** lazily (tembelce) / **D** happily (mutlu biçimde).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$In 1492, Columbus and his crew ---- on a voyage across the Atlantic, hoping to find a new route to Asia.$q$, array[$o$collapsed$o$, $o$resided$o$, $o$embarked$o$, $o$approved$o$, $o$retired$o$], 2, $e$1. Boşluğa **embarked** (yola çıktı) gelir. Asya'ya yeni yol aramak için yolculuğa çıkmak embark ile söylenir.

Diğer şıklar: **A** collapsed (çöktü) / **B** resided (ikamet etti) / **D** approved (onayladı) / **E** retired (emekli oldu).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$A small group of members decided to ---- from the party and to form a new organisation with different aims.$q$, array[$o$break away$o$, $o$hold out$o$, $o$fill in$o$, $o$set aside$o$, $o$pick up$o$], 0, $e$1. Boşluğa **break away** (ayrılmak) gelir. Partiden ayrılıp yeni örgüt kurmak break away ile söylenir.

Diğer şıklar: **B** hold out (dayanmak) / **C** fill in (doldurmak) / **D** set aside (ayırmak) / **E** pick up (toplamak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$A terrible ---- struck the region after three years of drought, and millions of people were left without enough food.$q$, array[$o$carnival$o$, $o$famine$o$, $o$reunion$o$, $o$scandal$o$, $o$ceremony$o$], 1, $e$1. Boşluğa **famine** (kıtlık) gelir. Yiyeceksiz kalan milyonlar kıtlıkla karşı karşıyadır.

Diğer şıklar: **A** carnival (karnaval) / **C** reunion (buluşma) / **D** scandal (skandal) / **E** ceremony (tören).$e$, 1),
  (17, 'ydt-dil', null::integer, $q$It would be ---- to make a decision before we have seen all the evidence, so let us wait until the report is ready.$q$, array[$o$cautious$o$, $o$sensible$o$, $o$wise$o$, $o$hasty$o$, $o$patient$o$], 3, $e$1. Boşluğa **hasty** (aceleci) gelir. Raporu beklemek isteyen kişi için kanıtsız karar aceleciliktir.

Diğer şıklar: **A** cautious (temkinli) / **B** sensible (makul) / **C** wise (akıllıca) / **E** patient (sabırlı).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$Salt should be used ---- in cooking, because too much of it can raise blood pressure and cause heart problems.$q$, array[$o$generously$o$, $o$freely$o$, $o$lavishly$o$, $o$heavily$o$, $o$sparingly$o$], 4, $e$1. Boşluğa **sparingly** (idareli biçimde) gelir. Fazlasının tansiyonu artırması tuzun idareli kullanılmasını gerektirir.

Diğer şıklar: **A** generously (cömertçe) / **B** freely (serbestçe) / **C** lavishly (bol bol) / **D** heavily (yoğun biçimde).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The smell of smoke continued to ---- in the house for several days after the fire, even though all the windows were kept open.$q$, array[$o$linger$o$, $o$prosper$o$, $o$retreat$o$, $o$hesitate$o$, $o$yield$o$], 0, $e$1. Boşluğa **linger** (oyalanmak) gelir. Pencereler açık olsa da kokunun günlerce kalması linger ile söylenir.

Diğer şıklar: **B** prosper (gelişmek) / **C** retreat (geri çekilmek) / **D** hesitate (tereddüt etmek) / **E** yield (boyun eğmek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The club was so full that the guards had to ---- hundreds of people at the door, and many of them waited outside until midnight.$q$, array[$o$pull off$o$, $o$take on$o$, $o$look up$o$, $o$turn away$o$, $o$put through$o$], 3, $e$1. Boşluğa **turn away** (geri çevirmek) gelir. Kapıda yüzlerce kişiyi geri çevirmek turn away ile söylenir.

Diğer şıklar: **A** pull off (başarmak) / **B** take on (üstlenmek) / **C** look up (aramak) / **E** put through (bağlamak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

