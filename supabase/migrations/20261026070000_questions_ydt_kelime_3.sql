-- 20261026070000_questions_ydt_kelime_3. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 17
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 17$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The city introduced a new ---- on private cars in the historic centre, so only buses and taxis may enter after nine in the morning.$q$, array[$o$restriction$o$, $o$invitation$o$, $o$reward$o$, $o$bargain$o$, $o$audience$o$], 0, $e$1. Boşluğa **restriction** (kısıtlama) gelir. Yalnızca otobüs ve taksiye izin verilmesi bir kısıtlamadır.

Diğer şıklar: **B** invitation (davet) / **C** reward (ödül) / **D** bargain (pazarlık) / **E** audience (izleyici).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The food supplies were ---- for such a large group, so the climbers had to turn back after only five days.$q$, array[$o$abundant$o$, $o$insufficient$o$, $o$delicious$o$, $o$ideal$o$, $o$suspicious$o$], 1, $e$1. Boşluğa **insufficient** (yetersiz) gelir. Beş gün sonra geri dönmek yiyeceğin yetmediğini gösterir.

Diğer şıklar: **A** abundant (bol) / **C** delicious (lezzetli) / **D** ideal (ideal) / **E** suspicious (şüpheli).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The parents waited ---- outside the operating room, hoping that the doctors would soon bring good news about their son.$q$, array[$o$cheerfully$o$, $o$lazily$o$, $o$proudly$o$, $o$secretly$o$, $o$anxiously$o$], 4, $e$1. Boşluğa **anxiously** (endişeyle) gelir. Ameliyat odası önünde iyi haber beklemek endişelidir.

Diğer şıklar: **A** cheerfully (neşeyle) / **B** lazily (tembelce) / **C** proudly (gururla) / **D** secretly (gizlice).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Teachers must ---- the children at all times during the school trip to make sure that nobody gets lost or hurt.$q$, array[$o$supervise$o$, $o$abandon$o$, $o$ignore$o$, $o$punish$o$, $o$amuse$o$], 0, $e$1. Boşluğa **supervise** (gözetmek) gelir. Kimsenin kaybolmaması için çocukları sürekli gözetmek gerekir.

Diğer şıklar: **B** abandon (terk etmek) / **C** ignore (görmezden gelmek) / **D** punish (cezalandırmak) / **E** amuse (eğlendirmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Scientists will ---- a series of tests on the new material to find out whether it can survive extreme temperatures.$q$, array[$o$sit down$o$, $o$grow up$o$, $o$carry out$o$, $o$back away$o$, $o$come in$o$], 2, $e$1. Boşluğa **carry out** (gerçekleştirmek) gelir. Dayanıklılığı ölçmek için testler yürütmek carry out ile söylenir.

Diğer şıklar: **A** sit down (oturmak) / **B** grow up (büyümek) / **D** back away (geri çekilmek) / **E** come in (girmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The ---- of the ballerina's movements impressed the audience, who watched in complete silence until the music ended.$q$, array[$o$dilemma$o$, $o$bargain$o$, $o$hostility$o$, $o$urgency$o$, $o$elegance$o$], 4, $e$1. Boşluğa **elegance** (zarafet) gelir. Seyircisi sessizce izleten hareketler zarafetten gelir.

Diğer şıklar: **A** dilemma (ikilem) / **B** bargain (pazarlık) / **C** hostility (düşmanlık) / **D** urgency (aciliyet).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Teachers of foreign languages today prefer a ---- approach, which encourages students to speak in real situations rather than memorise grammar rules.$q$, array[$o$hostile$o$, $o$hereditary$o$, $o$marital$o$, $o$communicative$o$, $o$fragile$o$], 3, $e$1. Boşluğa **communicative** (iletişimsel) gelir. Gerçek durumlarda konuşturan yaklaşım iletişimseldir.

Diğer şıklar: **A** hostile (düşmanca) / **B** hereditary (kalıtsal) / **C** marital (evliliğe ait) / **E** fragile (kırılgan).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The village was ---- destroyed by the flood, and only two houses on the hill were left standing.$q$, array[$o$gently$o$, $o$reluctantly$o$, $o$virtually$o$, $o$formally$o$, $o$deliberately$o$], 2, $e$1. Boşluğa **virtually** (neredeyse) gelir. Yalnızca iki evin ayakta kalması köyün neredeyse tamamen yıkıldığını gösterir.

Diğer şıklar: **A** gently (nazikçe) / **B** reluctantly (isteksizce) / **D** formally (resmen) / **E** deliberately (kasten).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$She decided to ---- her career to helping homeless people and opened shelters in five cities.$q$, array[$o$interrupt$o$, $o$compare$o$, $o$withdraw$o$, $o$survive$o$, $o$dedicate$o$], 4, $e$1. Boşluğa **dedicate** (adamak) gelir. Kariyerini evsizlere yardıma ayırmak dedicate ile söylenir.

Diğer şıklar: **A** interrupt (bölmek) / **B** compare (karşılaştırmak) / **C** withdraw (çekmek) / **D** survive (hayatta kalmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$After the flood, the villagers ---- rebuilding their homes immediately, without waiting for any help from the government.$q$, array[$o$set about$o$, $o$held up$o$, $o$came down$o$, $o$ran out$o$, $o$turned in$o$], 0, $e$1. Boşluğa **set about** (girişmek) gelir. Beklemeden hemen yeniden inşaya başlamak set about ile söylenir.

Diğer şıklar: **B** held up (geciktirmek) / **C** came down (inmek) / **D** ran out (tükenmek) / **E** turned in (teslim etmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$After the accident, he spent six months in ----, learning to walk again with the help of doctors and physiotherapists.$q$, array[$o$isolation$o$, $o$rehabilitation$o$, $o$ambition$o$, $o$negotiation$o$, $o$exploration$o$], 1, $e$1. Boşluğa **rehabilitation** (rehabilitasyon) gelir. Doktor ve fizyoterapistlerle yeniden yürümeyi öğrenmek rehabilitasyondur.

Diğer şıklar: **A** isolation (yalıtım) / **C** ambition (hırs) / **D** negotiation (müzakere) / **E** exploration (keşif).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The ancient ruins looked ---- until the earthquake struck, and within seconds the walls that had stood for two thousand years collapsed.$q$, array[$o$fragile$o$, $o$temporary$o$, $o$insignificant$o$, $o$indestructible$o$, $o$tolerable$o$], 3, $e$1. Boşluğa **indestructible** (yıkılmaz) gelir. İki bin yıl ayakta kalan duvarlar yıkılmaz görünür.

Diğer şıklar: **A** fragile (kırılgan) / **B** temporary (geçici) / **C** insignificant (önemsiz) / **E** tolerable (katlanılabilir).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The number of people using the Internet has been growing ---- since the 1990s, doubling again and again within a few years.$q$, array[$o$slightly$o$, $o$evenly$o$, $o$vaguely$o$, $o$occasionally$o$, $o$exponentially$o$], 4, $e$1. Boşluğa **exponentially** (katlanarak) gelir. Birkaç yılda tekrar tekrar ikiye katlanma üssel artıştır.

Diğer şıklar: **A** slightly (hafifçe) / **B** evenly (eşit biçimde) / **C** vaguely (belirsizce) / **D** occasionally (ara sıra).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Young athletes often try to ---- their heroes by copying their training methods and even the way they dress.$q$, array[$o$accuse$o$, $o$persuade$o$, $o$emulate$o$, $o$transfer$o$, $o$dismiss$o$], 2, $e$1. Boşluğa **emulate** (özenmek) gelir. Antrenmanı ve giyinişi taklit etmek özenmektir.

Diğer şıklar: **A** accuse (suçlamak) / **B** persuade (ikna etmek) / **D** transfer (aktarmak) / **E** dismiss (reddetmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The government has ---- a large sum of money for the repair of historic buildings damaged by the earthquake.$q$, array[$o$set aside$o$, $o$looked after$o$, $o$made up$o$, $o$called off$o$, $o$given in$o$], 0, $e$1. Boşluğa **set aside** (ayırmak) gelir. Onarım için büyük bir bütçe ayırmak set aside ile söylenir.

Diğer şıklar: **B** looked after (bakmak) / **C** made up (oluşturmak) / **D** called off (iptal etmek) / **E** given in (pes etmek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Astronomers discovered a huge ---- of stars near the centre of the galaxy, containing more than a million bright stars.$q$, array[$o$hazard$o$, $o$ceremony$o$, $o$verdict$o$, $o$cluster$o$, $o$strategy$o$], 3, $e$1. Boşluğa **cluster** (küme) gelir. Bir milyondan fazla yıldız barındıran yıldız topluluğu kümedir.

Diğer şıklar: **A** hazard (tehlike) / **B** ceremony (tören) / **C** verdict (karar) / **E** strategy (strateji).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The school invited an expert to give a talk on ---- methods, including new ways of teaching mathematics to young children.$q$, array[$o$subatomic$o$, $o$pedagogical$o$, $o$marital$o$, $o$medieval$o$, $o$biological$o$], 1, $e$1. Boşluğa **pedagogical** (pedagojik) gelir. Matematik öğretim yöntemleri pedagojik yöntemlerdir.

Diğer şıklar: **A** subatomic (atom altı) / **C** marital (evliliğe ait) / **D** medieval (ortaçağa ait) / **E** biological (biyolojik).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Visitors to the temple are asked to dress ----, covering their shoulders and knees as a sign of respect.$q$, array[$o$randomly$o$, $o$carelessly$o$, $o$appropriately$o$, $o$lightly$o$, $o$slowly$o$], 2, $e$1. Boşluğa **appropriately** (uygun biçimde) gelir. Saygı için omuz ve dizleri örtmek uygun giyinmektir.

Diğer şıklar: **A** randomly (rastgele) / **B** carelessly (dikkatsizce) / **D** lightly (hafif) / **E** slowly (yavaşça).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The company was forced to ---- that its product was dangerous after several customers were injured.$q$, array[$o$conceal$o$, $o$predict$o$, $o$interrupt$o$, $o$acknowledge$o$, $o$refuse$o$], 3, $e$1. Boşluğa **acknowledge** (kabul etmek) gelir. Müşteriler yaralandıktan sonra tehlikeyi kabul etmek zorunda kalmıştır.

Diğer şıklar: **A** conceal (gizlemek) / **B** predict (tahmin etmek) / **C** interrupt (bölmek) / **E** refuse (reddetmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Before the exam, the teacher will ---- the most important topics once again, so students should bring their notebooks.$q$, array[$o$look out$o$, $o$go over$o$, $o$back off$o$, $o$pass out$o$, $o$break up$o$], 1, $e$1. Boşluğa **go over** (gözden geçirmek) gelir. Önemli konuları yeniden tekrar etmek go over ile söylenir.

Diğer şıklar: **A** look out (dikkat etmek) / **C** back off (geri çekilmek) / **D** pass out (bayılmak) / **E** break up (dağılmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 18
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 18$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The pavement looked wet from a distance, but this was an optical ----: the road was dry, and the shine was caused by the heat.$q$, array[$o$sacrifice$o$, $o$illusion$o$, $o$evidence$o$, $o$sentence$o$, $o$shortage$o$], 1, $e$1. Boşluğa **illusion** (yanılsama) gelir. Yolun ıslak görünüp kuru olması görsel bir yanılsamadır.

Diğer şıklar: **A** sacrifice (fedakârlık) / **C** evidence (kanıt) / **D** sentence (cümle) / **E** shortage (kıtlık).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Wearing a school uniform is ---- in some countries, and students may choose what they want to wear.$q$, array[$o$compulsory$o$, $o$essential$o$, $o$illegal$o$, $o$expensive$o$, $o$optional$o$], 4, $e$1. Boşluğa **optional** (isteğe bağlı) gelir. İstediğini giymekte serbest olmak isteğe bağlılıktır.

Diğer şıklar: **A** compulsory (zorunlu) / **B** essential (şart) / **C** illegal (yasadışı) / **D** expensive (pahalı).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The ambulance arrived ---- after the call, and the doctors were able to start treating the injured man within minutes.$q$, array[$o$hardly$o$, $o$lazily$o$, $o$eventually$o$, $o$promptly$o$, $o$vaguely$o$], 3, $e$1. Boşluğa **promptly** (derhal) gelir. Birkaç dakika içinde tedaviye başlanması ambulansın hemen geldiğini gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** lazily (tembelce) / **C** eventually (sonunda) / **E** vaguely (belirsizce).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Travellers in the desert may ---- extreme heat during the day and freezing temperatures at night, so they should carry suitable clothing.$q$, array[$o$encounter$o$, $o$generate$o$, $o$persuade$o$, $o$mention$o$, $o$overtake$o$], 0, $e$1. Boşluğa **encounter** (karşılaşmak) gelir. Çölde aşırı sıcak ve soğukla karşılaşmak encounter ile söylenir.

Diğer şıklar: **B** generate (üretmek) / **C** persuade (ikna etmek) / **D** mention (değinmek) / **E** overtake (geçmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Students who do not attend the first lesson may ---- important information about the course requirements.$q$, array[$o$set off$o$, $o$take after$o$, $o$pull through$o$, $o$burn down$o$, $o$miss out on$o$], 4, $e$1. Boşluğa **miss out on** (kaçırmak) gelir. İlk derse gelmeyenlerin önemli bilgiyi kaçırması miss out on ile söylenir.

Diğer şıklar: **A** set off (yola çıkmak) / **B** take after (benzemek) / **C** pull through (atlatmak) / **D** burn down (yanıp kül olmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$There is no moral ---- for punishing a person for a crime that he did not commit, whatever the reason may be.$q$, array[$o$alliance$o$, $o$vocabulary$o$, $o$justification$o$, $o$decoration$o$, $o$reduction$o$], 2, $e$1. Boşluğa **justification** (gerekçe) gelir. İşlemediği suçtan ceza vermenin ahlaki bir gerekçesi yoktur.

Diğer şıklar: **A** alliance (ittifak) / **B** vocabulary (kelime hazinesi) / **D** decoration (süsleme) / **E** reduction (azaltma).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$Chickenpox is highly ----, and a child who has caught it should stay at home until the spots have dried.$q$, array[$o$hereditary$o$, $o$contagious$o$, $o$chronic$o$, $o$voluntary$o$, $o$sensible$o$], 1, $e$1. Boşluğa **contagious** (bulaşıcı) gelir. Evde kalmayı gerektiren hastalık bulaşıcıdır.

Diğer şıklar: **A** hereditary (kalıtsal) / **C** chronic (kronik) / **D** voluntary (gönüllü) / **E** sensible (makul).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The old man, ---- unaware of the danger, continued to fish calmly while the storm clouds gathered above the lake.$q$, array[$o$seemingly$o$, $o$bitterly$o$, $o$mutually$o$, $o$briefly$o$, $o$roughly$o$], 0, $e$1. Boşluğa **seemingly** (görünüşe göre) gelir. Sakin sakin balık tutması tehlikeden habersiz görünmesine yol açar.

Diğer şıklar: **B** bitterly (acı biçimde) / **C** mutually (karşılıklı olarak) / **D** briefly (kısaca) / **E** roughly (kabaca).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Health organisations hope to ---- polio completely within the next decade through a worldwide vaccination programme.$q$, array[$o$preserve$o$, $o$negotiate$o$, $o$imitate$o$, $o$eradicate$o$, $o$forecast$o$], 3, $e$1. Boşluğa **eradicate** (kökünü kazımak) gelir. Aşı programıyla hastalığı tamamen yok etmek eradicate ile söylenir.

Diğer şıklar: **A** preserve (korumak) / **B** negotiate (müzakere etmek) / **C** imitate (taklit etmek) / **E** forecast (tahmin etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Many species of bats ---- insects, eating up to a thousand mosquitoes in a single night.$q$, array[$o$turn up$o$, $o$hand in$o$, $o$live on$o$, $o$fall for$o$, $o$look into$o$], 2, $e$1. Boşluğa **live on** (beslenmek) gelir. Böcekleri yiyerek hayatta kalan yarasalar böceklerle beslenir.

Diğer şıklar: **A** turn up (ortaya çıkmak) / **B** hand in (teslim etmek) / **D** fall for (aşık olmak) / **E** look into (araştırmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The city spends large amounts of money every year repairing the damage caused by ----, such as broken windows and painted walls.$q$, array[$o$ambition$o$, $o$migration$o$, $o$inflation$o$, $o$recovery$o$, $o$vandalism$o$], 4, $e$1. Boşluğa **vandalism** (tahribat) gelir. Kırık camlar ve boyalı duvarlar kasıtlı tahribatın sonucudur.

Diğer şıklar: **A** ambition (hırs) / **B** migration (göç) / **C** inflation (enflasyon) / **D** recovery (iyileşme).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The difference between the two shades of blue was barely ----, even when the colours were placed side by side.$q$, array[$o$discernible$o$, $o$disposable$o$, $o$hereditary$o$, $o$hostile$o$, $o$valid$o$], 0, $e$1. Boşluğa **discernible** (fark edilebilir) gelir. Yan yana konduğunda bile zor ayırt edilen fark seçilebilir olmayan fark gibidir.

Diğer şıklar: **B** disposable (tek kullanımlık) / **C** hereditary (kalıtsal) / **D** hostile (düşmanca) / **E** valid (geçerli).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The ceremony was ---- planned over a period of two years, with every detail, from the music to the colour of the flowers, chosen carefully.$q$, array[$o$scarcely$o$, $o$abruptly$o$, $o$elaborately$o$, $o$randomly$o$, $o$mildly$o$], 2, $e$1. Boşluğa **elaborately** (özenle) gelir. İki yıl boyunca her ayrıntının planlanması ayrıntılı ve özenli hazırlıktır.

Diğer şıklar: **A** scarcely (zar zor) / **B** abruptly (aniden) / **D** randomly (rastgele) / **E** mildly (hafifçe).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$In many countries, women now ---- men in universities, making up more than half of all students.$q$, array[$o$overthrow$o$, $o$deliver$o$, $o$persuade$o$, $o$outnumber$o$, $o$underline$o$], 3, $e$1. Boşluğa **outnumber** (sayıca geçmek) gelir. Öğrencilerin yarısından fazlasını oluşturmak sayıca geçmektir.

Diğer şıklar: **A** overthrow (devirmek) / **B** deliver (teslim etmek) / **C** persuade (ikna etmek) / **E** underline (altını çizmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The government plans to ---- petrol cars over the next fifteen years, replacing them gradually with electric vehicles.$q$, array[$o$put up$o$, $o$phase out$o$, $o$pick up$o$, $o$sit in$o$, $o$hold on$o$], 1, $e$1. Boşluğa **phase out** (kademeli olarak kaldırmak) gelir. Elektrikli araçlarla kademeli değişim, benzinlilerin aşamalı olarak kaldırılmasıdır.

Diğer şıklar: **A** put up (dikmek) / **C** pick up (toplamak) / **D** sit in (katılmak) / **E** hold on (tutunmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$After searching for his lost dog for three weeks, he fell into ---- and almost gave up hope of ever seeing it again.$q$, array[$o$delight$o$, $o$pride$o$, $o$curiosity$o$, $o$humour$o$, $o$despair$o$], 4, $e$1. Boşluğa **despair** (umutsuzluk) gelir. Umudunu yitirmeye yaklaşması umutsuzluğa kapılmaktır.

Diğer şıklar: **A** delight (sevinç) / **B** pride (gurur) / **C** curiosity (merak) / **D** humour (mizah).$e$, 1),
  (17, 'ydt-dil', null::integer, $q$A ---- analysis of the survey results showed that the difference between the two groups was too small to be important.$q$, array[$o$statistical$o$, $o$medieval$o$, $o$marital$o$, $o$tribal$o$, $o$hostile$o$], 0, $e$1. Boşluğa **statistical** (istatistiksel) gelir. Anket sonuçlarının sayısal incelemesi istatistikseldir.

Diğer şıklar: **B** medieval (ortaçağa ait) / **C** marital (evliliğe ait) / **D** tribal (kabileye ait) / **E** hostile (düşmanca).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Some farmers are against growing ---- modified crops, claiming that nobody knows their long-term effects on human health.$q$, array[$o$sincerely$o$, $o$politely$o$, $o$genetically$o$, $o$densely$o$, $o$hastily$o$], 2, $e$1. Boşluğa **genetically** (genetik olarak) gelir. Genleri değiştirilmiş ürünler genetik olarak değiştirilmiş ürünlerdir.

Diğer şıklar: **A** sincerely (içtenlikle) / **B** politely (kibarca) / **D** densely (yoğun biçimde) / **E** hastily (aceleyle).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The museum plans to ---- more than two hundred paintings by local artists in the new exhibition hall next month.$q$, array[$o$bury$o$, $o$display$o$, $o$resign$o$, $o$flatter$o$, $o$dismiss$o$], 1, $e$1. Boşluğa **display** (sergilemek) gelir. Yeni salonda tabloları göstermek sergilemektir.

Diğer şıklar: **A** bury (gömmek) / **C** resign (istifa etmek) / **D** flatter (pohpohlamak) / **E** dismiss (reddetmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$Because of falling sales, the company was forced to ---- nearly a third of its workers, who lost their jobs at the end of the month.$q$, array[$o$take on$o$, $o$show up$o$, $o$set out$o$, $o$lay off$o$, $o$break in$o$], 3, $e$1. Boşluğa **lay off** (işten çıkarmak) gelir. İşçilerin işini kaybetmesi, şirketin onları işten çıkarmasıdır.

Diğer şıklar: **A** take on (işe almak) / **B** show up (ortaya çıkmak) / **C** set out (yola çıkmak) / **E** break in (zorla girmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 19
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 19$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- of poverty requires more than financial aid, since it also requires education, healthcare and fair job opportunities for everyone.$q$, array[$o$accusation$o$, $o$elimination$o$, $o$reception$o$, $o$permission$o$, $o$imitation$o$], 1, $e$1. Boşluğa **elimination** (ortadan kaldırma) gelir. Yoksulluğu bitirmek için gereken çaba onun ortadan kaldırılmasıdır.

Diğer şıklar: **A** accusation (suçlama) / **C** reception (resepsiyon) / **D** permission (izin) / **E** imitation (taklit).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Einstein was one of the most ---- scientists of the twentieth century, and his theories changed the way we understand space and time.$q$, array[$o$remote$o$, $o$gloomy$o$, $o$influential$o$, $o$casual$o$, $o$elderly$o$], 2, $e$1. Boşluğa **influential** (etkili) gelir. Teorileriyle bilimi değiştiren kişi etkili bir bilim insanıdır.

Diğer şıklar: **A** remote (uzak) / **B** gloomy (kasvetli) / **D** casual (gelişigüzel) / **E** elderly (yaşlı).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The war ---- changed the lives of ordinary people, who lost their homes, jobs and many members of their families.$q$, array[$o$barely$o$, $o$slightly$o$, $o$politely$o$, $o$profoundly$o$, $o$casually$o$], 3, $e$1. Boşluğa **profoundly** (derinden) gelir. Ev, iş ve aile kaybı hayatların derinden değiştiğini gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** slightly (hafifçe) / **C** politely (kibarca) / **E** casually (gelişigüzel).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The enemy forces managed to ---- the city after a siege that lasted more than six months.$q$, array[$o$deliver$o$, $o$complain$o$, $o$witness$o$, $o$reject$o$, $o$occupy$o$], 4, $e$1. Boşluğa **occupy** (işgal etmek) gelir. Kuşatmanın ardından şehri ele geçirmek işgal etmektir.

Diğer şıklar: **A** deliver (teslim etmek) / **B** complain (şikâyet etmek) / **C** witness (tanık olmak) / **D** reject (reddetmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The new mayor plans to ---- all the neighbourhood leaders during his first month in office to listen to their concerns.$q$, array[$o$put out$o$, $o$pull off$o$, $o$call on$o$, $o$hold up$o$, $o$burn down$o$], 2, $e$1. Boşluğa **call on** (ziyaret etmek) gelir. Mahalle liderlerini dinlemek için onları ziyaret etmek call on ile söylenir.

Diğer şıklar: **A** put out (söndürmek) / **B** pull off (başarmak) / **D** hold up (geciktirmek) / **E** burn down (yanıp kül olmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$It is a common ---- that lightning never strikes the same place twice, and in fact tall buildings are hit many times each year.$q$, array[$o$prediction$o$, $o$misconception$o$, $o$assignment$o$, $o$reservation$o$, $o$ingredient$o$], 1, $e$1. Boşluğa **misconception** (yanlış kanı) gelir. Yüksek binaların defalarca yıldırım çarpması yaygın yanlış inancı çürütür.

Diğer şıklar: **A** prediction (tahmin) / **C** assignment (ödev) / **D** reservation (çekince) / **E** ingredient (bileşen).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ---- death of the young singer at the age of twenty-seven shocked millions of fans around the world.$q$, array[$o$tragic$o$, $o$tedious$o$, $o$hostile$o$, $o$ordinary$o$, $o$optional$o$], 0, $e$1. Boşluğa **tragic** (trajik) gelir. Genç şarkıcının ölümü milyonları sarsan trajik bir olaydır.

Diğer şıklar: **B** tedious (sıkıcı) / **C** hostile (düşmanca) / **D** ordinary (sıradan) / **E** optional (isteğe bağlı).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The patient recovered ---- quickly after the operation and was able to return to work after only two weeks.$q$, array[$o$reluctantly$o$, $o$barely$o$, $o$hardly$o$, $o$remarkably$o$, $o$gloomily$o$], 3, $e$1. Boşluğa **remarkably** (olağanüstü derecede) gelir. İki haftada işe dönebilmek olağanüstü hızlı iyileşmedir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** barely (zar zor) / **C** hardly (neredeyse hiç) / **E** gloomily (kasvetle).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Drivers who ---- traffic signs put their own lives and the lives of other people at serious risk.$q$, array[$o$respect$o$, $o$disregard$o$, $o$observe$o$, $o$admire$o$, $o$follow$o$], 1, $e$1. Boşluğa **disregard** (hiçe saymak) gelir. Işaretleri hiçe saymak hayati risk yaratır.

Diğer şıklar: **A** respect (saygı göstermek) / **C** observe (uymak) / **D** admire (hayran olmak) / **E** follow (izlemek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The committee ---- ten members, including five teachers, three parents and two students.$q$, array[$o$depends on$o$, $o$lives on$o$, $o$puts on$o$, $o$goes on$o$, $o$consists of$o$], 4, $e$1. Boşluğa **consists of** (-den oluşmak) gelir. On üyeden oluşan komite consist of ile söylenir.

Diğer şıklar: **A** depends on (bağlı olmak) / **B** lives on (beslenmek) / **C** puts on (giymek) / **D** goes on (devam etmek).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$The company has a ---- plan for the case of a sudden fire, which includes evacuation routes and a temporary office in another building.$q$, array[$o$pension$o$, $o$sermon$o$, $o$contingency$o$, $o$bargain$o$, $o$trophy$o$], 2, $e$1. Boşluğa **contingency** (olası durum) gelir. Beklenmedik yangın için hazırlanan plana olasılık planı denir.

Diğer şıklar: **A** pension (emekli maaşı) / **B** sermon (vaaz) / **D** bargain (pazarlık) / **E** trophy (kupa).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The economy has remained ---- for several years, with almost no growth in production, employment or exports.$q$, array[$o$stagnant$o$, $o$vibrant$o$, $o$explosive$o$, $o$flourishing$o$, $o$progressive$o$], 0, $e$1. Boşluğa **stagnant** (durgun) gelir. Üretim ve istihdamda büyüme olmaması durgunluktur.

Diğer şıklar: **B** vibrant (canlı) / **C** explosive (patlayıcı) / **D** flourishing (gelişen) / **E** progressive (ilerleyen).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The tourists ---- entered a restricted military zone because there were no signs, and they were questioned by soldiers for hours.$q$, array[$o$eagerly$o$, $o$unwittingly$o$, $o$proudly$o$, $o$mutually$o$, $o$officially$o$], 1, $e$1. Boşluğa **unwittingly** (farkında olmadan) gelir. Levhaların olmaması turistlerin farkında olmadan girdiğini gösterir.

Diğer şıklar: **A** eagerly (hevesle) / **C** proudly (gururla) / **D** mutually (karşılıklı olarak) / **E** officially (resmen).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Students who ---- tend to leave all their studying to the night before the exam and then find that they do not have enough time to cover everything.$q$, array[$o$evaluate$o$, $o$cooperate$o$, $o$dominate$o$, $o$graduate$o$, $o$procrastinate$o$], 4, $e$1. Boşluğa **procrastinate** (ertelemek) gelir. Çalışmayı sınav arifesine bırakmak procrastinate ile söylenir.

Diğer şıklar: **A** evaluate (değerlendirmek) / **B** cooperate (işbirliği yapmak) / **C** dominate (hâkim olmak) / **D** graduate (mezun olmak).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$In the thick fog, the pilot could hardly ---- the runway lights, so he decided to circle above the airport for another fifteen minutes.$q$, array[$o$make out$o$, $o$give in$o$, $o$hold back$o$, $o$put off$o$, $o$carry on$o$], 0, $e$1. Boşluğa **make out** (seçmek) gelir. Yoğun sis içinde pist ışıklarını zor seçmek make out ile söylenir.

Diğer şıklar: **B** give in (pes etmek) / **C** hold back (engellemek) / **D** put off (ertelemek) / **E** carry on (sürdürmek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$During the long ---- of Queen Victoria, Britain expanded its empire and became the most powerful industrial nation in the world.$q$, array[$o$bargain$o$, $o$hesitation$o$, $o$defence$o$, $o$reign$o$, $o$supply$o$], 3, $e$1. Boşluğa **reign** (saltanat) gelir. Kraliçenin yönetim süresi saltanattır.

Diğer şıklar: **A** bargain (pazarlık) / **B** hesitation (tereddüt) / **C** defence (savunma) / **E** supply (arz).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The new drug is so ---- that even a very small dose can relieve severe pain within a few minutes.$q$, array[$o$feeble$o$, $o$gradual$o$, $o$hollow$o$, $o$tolerable$o$, $o$potent$o$], 4, $e$1. Boşluğa **potent** (güçlü) gelir. Küçük dozla şiddetli ağrıyı dindiren ilaç çok güçlüdür.

Diğer şıklar: **A** feeble (zayıf) / **B** gradual (kademeli) / **C** hollow (içi boş) / **D** tolerable (katlanılabilir).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$After years of hard work and many failures, he ---- became the manager of the company he had joined as a cleaner.$q$, array[$o$hardly$o$, $o$merely$o$, $o$eventually$o$, $o$barely$o$, $o$loudly$o$], 2, $e$1. Boşluğa **eventually** (sonunda) gelir. Yıllık emek ve başarısızlıklardan sonra elde edilen sonuç sonunda gerçekleşir.

Diğer şıklar: **A** hardly (zar zor) / **B** merely (sadece) / **D** barely (zar zor) / **E** loudly (yüksek sesle).$e$, 1),
  (19, 'ydt-dil', null::integer, $q$The old factory was ---- into a modern shopping centre with cinemas, restaurants and an underground car park.$q$, array[$o$reserved$o$, $o$restricted$o$, $o$withdrawn$o$, $o$converted$o$, $o$compared$o$], 3, $e$1. Boşluğa **converted** (dönüştürüldü) gelir. Eski fabrikanın alışveriş merkezine çevrilmesi dönüşümdür.

Diğer şıklar: **A** reserved (ayrıldı) / **B** restricted (kısıtlandı) / **C** withdrawn (geri çekildi) / **E** compared (karşılaştırıldı).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The editor decided to ---- the final chapter of the book, because it was too long and repeated many of the earlier ideas.$q$, array[$o$leave out$o$, $o$set up$o$, $o$turn into$o$, $o$take over$o$, $o$rely on$o$], 0, $e$1. Boşluğa **leave out** (çıkarmak) gelir. Fazla uzun ve tekrar eden bölümü çıkarmak leave out ile söylenir.

Diğer şıklar: **B** set up (kurmak) / **C** turn into (dönüşmek) / **D** take over (devralmak) / **E** rely on (güvenmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 20
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 20$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Economists warn that growing income ---- between the rich and the poor can lead to social tension and political instability.$q$, array[$o$permission$o$, $o$hesitation$o$, $o$assistance$o$, $o$inequality$o$, $o$discovery$o$], 3, $e$1. Boşluğa **inequality** (eşitsizlik) gelir. Zengin ile yoksul arasındaki gelir farkı eşitsizliktir.

Diğer şıklar: **A** permission (izin) / **B** hesitation (tereddüt) / **C** assistance (yardım) / **E** discovery (keşif).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Regular ---- exercise, such as running or swimming for at least thirty minutes, strengthens the heart and improves breathing.$q$, array[$o$feeble$o$, $o$sluggish$o$, $o$vacant$o$, $o$awkward$o$, $o$vigorous$o$], 4, $e$1. Boşluğa **vigorous** (güçlü) gelir. Otuz dakika koşmak gibi yoğun egzersiz kuvvetli egzersizdir.

Diğer şıklar: **A** feeble (zayıf) / **B** sluggish (yavaş) / **C** vacant (boş) / **D** awkward (beceriksiz).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The hospital is ---- in need of blood donors, because the stock has fallen to a dangerously low level after the accident.$q$, array[$o$hardly$o$, $o$urgently$o$, $o$randomly$o$, $o$lightly$o$, $o$loosely$o$], 1, $e$1. Boşluğa **urgently** (acilen) gelir. Stokların tehlikeli seviyeye düşmesi acil ihtiyaç doğurur.

Diğer şıklar: **A** hardly (zar zor) / **C** randomly (rastgele) / **D** lightly (hafifçe) / **E** loosely (gevşekçe).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The temperature in the desert can ---- wildly between more than forty degrees during the day and below zero at night.$q$, array[$o$oscillate$o$, $o$deteriorate$o$, $o$accompany$o$, $o$spread$o$, $o$assure$o$], 0, $e$1. Boşluğa **oscillate** (dalgalanmak) gelir. Gündüz kırk derece, gece sıfırın altı arasında gidip gelmek oscillate ile söylenir.

Diğer şıklar: **B** deteriorate (kötüleşmek) / **C** accompany (eşlik etmek) / **D** spread (yayılmak) / **E** assure (temin etmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The students worked together for a week to ---- a creative solution to the problem of waste in their school canteen.$q$, array[$o$look out for$o$, $o$put up with$o$, $o$get away with$o$, $o$come up with$o$, $o$keep up with$o$], 3, $e$1. Boşluğa **come up with** (bulmak) gelir. Yaratıcı bir çözüm ortaya atmak come up with ile söylenir.

Diğer şıklar: **A** look out for (dikkat etmek) / **B** put up with (katlanmak) / **C** get away with (yanına kâr kalmak) / **E** keep up with (ayak uydurmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The ---- from childhood to adulthood is not easy for most teenagers, who must learn to take responsibility for their own decisions.$q$, array[$o$exhibition$o$, $o$suspicion$o$, $o$profession$o$, $o$contribution$o$, $o$transition$o$], 4, $e$1. Boşluğa **transition** (geçiş) gelir. Çocukluktan yetişkinliğe geçiş bir dönüşüm sürecidir.

Diğer şıklar: **A** exhibition (sergi) / **B** suspicion (şüphe) / **C** profession (meslek) / **D** contribution (katkı).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Modern cars cause ---- damage to the environment compared with older ones, because they use less fuel and produce fewer harmful gases.$q$, array[$o$excessive$o$, $o$minimal$o$, $o$enormous$o$, $o$severe$o$, $o$intense$o$], 1, $e$1. Boşluğa **minimal** (asgari) gelir. Daha az yakıt kullanan arabaların zararı asgaridir.

Diğer şıklar: **A** excessive (aşırı) / **C** enormous (muazzam) / **D** severe (şiddetli) / **E** intense (yoğun).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The student ---- opened the wrong file and deleted the document, which he had been working on for two weeks.$q$, array[$o$eagerly$o$, $o$proudly$o$, $o$mistakenly$o$, $o$purposely$o$, $o$formally$o$], 2, $e$1. Boşluğa **mistakenly** (yanlışlıkla) gelir. Yanlış dosyayı açması yanlışlıkla yapılmış bir eylemdir.

Diğer şıklar: **A** eagerly (hevesle) / **B** proudly (gururla) / **D** purposely (kasten) / **E** formally (resmen).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$The film's soundtrack helps to ---- the sadness of the main character without a single word being spoken.$q$, array[$o$convey$o$, $o$bargain$o$, $o$deposit$o$, $o$witness$o$, $o$dismiss$o$], 0, $e$1. Boşluğa **convey** (iletmek) gelir. Tek kelime söylemeden üzüntüyü hissettirmek iletmektir.

Diğer şıklar: **B** bargain (pazarlık etmek) / **C** deposit (yatırmak) / **D** witness (tanık olmak) / **E** dismiss (reddetmek).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The new restaurant has not been able to ---- the expectations of its customers, many of whom were disappointed by the service.$q$, array[$o$look up to$o$, $o$stand up for$o$, $o$catch up with$o$, $o$live up to$o$, $o$make up for$o$], 3, $e$1. Boşluğa **live up to** (beklentilere uymak) gelir. Müşterilerin hayal kırıklığı beklentilerin karşılanmadığını gösterir.

Diğer şıklar: **A** look up to (saygı duymak) / **B** stand up for (savunmak) / **C** catch up with (yetişmek) / **E** make up for (telafi etmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The ---- of the island by foreign troops in 1941 forced thousands of families to leave their homes and flee to the mountains.$q$, array[$o$inspection$o$, $o$invasion$o$, $o$invitation$o$, $o$inflation$o$, $o$insurance$o$], 1, $e$1. Boşluğa **invasion** (işgal) gelir. Yabancı askerlerin adaya girmesi istiladır.

Diğer şıklar: **A** inspection (denetim) / **C** invitation (davet) / **D** inflation (enflasyon) / **E** insurance (sigorta).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$Many ---- people believe that breaking a mirror brings seven years of bad luck, although there is no scientific evidence for this.$q$, array[$o$generous$o$, $o$logical$o$, $o$superstitious$o$, $o$punctual$o$, $o$sceptical$o$], 2, $e$1. Boşluğa **superstitious** (batıl inançlı) gelir. Bilimsel kanıt olmadan uğursuzluğa inananlar batıl inançlıdır.

Diğer şıklar: **A** generous (cömert) / **B** logical (mantıklı) / **D** punctual (dakik) / **E** sceptical (kuşkucu).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$----, I do not think this plan will work, because we do not have enough money, time or people to carry it out.$q$, array[$o$Gradually$o$, $o$Narrowly$o$, $o$Tightly$o$, $o$Densely$o$, $o$Frankly$o$], 4, $e$1. Boşluğa **Frankly** (Açıkçası) gelir. Kişisel görüşü açıkça söylemek frankly ile ifade edilir.

Diğer şıklar: **A** Gradually (Giderek) / **B** Narrowly (Ucu ucuna) / **C** Tightly (Sıkıca) / **D** Densely (Yoğun biçimde).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Some children ---- in mathematics from an early age and can solve problems that most adults find difficult.$q$, array[$o$excel$o$, $o$insist$o$, $o$pretend$o$, $o$consult$o$, $o$hesitate$o$], 0, $e$1. Boşluğa **excel** (üstün olmak) gelir. Yetişkinlerin zorlandığı soruları çözmek matematikte üstün olmaktır.

Diğer şıklar: **B** insist (ısrar etmek) / **C** pretend (rol yapmak) / **D** consult (danışmak) / **E** hesitate (tereddüt etmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$While walking through the old market, she ---- an old school friend whom she had not seen for more than ten years.$q$, array[$o$set up$o$, $o$fell apart$o$, $o$ran into$o$, $o$wore off$o$, $o$gave out$o$], 2, $e$1. Boşluğa **ran into** (rastlamak) gelir. Yıllardır görmediği arkadaşına rastlamak run into ile söylenir.

Diğer şıklar: **A** set up (kurmak) / **B** fell apart (dağılmak) / **D** wore off (etkisini yitirmek) / **E** gave out (dağıtmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The ---- of slaves in the United States was officially declared by President Lincoln in 1863, although full equality took another century.$q$, array[$o$evaluation$o$, $o$emancipation$o$, $o$exploration$o$, $o$examination$o$, $o$expansion$o$], 1, $e$1. Boşluğa **emancipation** (özgürleşme) gelir. Kölelerin özgürlüğünün ilan edilmesi emancipation ile söylenir.

Diğer şıklar: **A** evaluation (değerlendirme) / **C** exploration (keşif) / **D** examination (sınav) / **E** expansion (genişleme).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The firefighters' courage during the rescue was truly ----, and the mayor thanked each of them in a public ceremony.$q$, array[$o$deplorable$o$, $o$negligible$o$, $o$ambiguous$o$, $o$commendable$o$, $o$reluctant$o$], 3, $e$1. Boşluğa **commendable** (övgüye değer) gelir. Belediye başkanının teşekkür etmesi cesaretin övgüye değer olduğunu gösterir.

Diğer şıklar: **A** deplorable (acınacak) / **B** negligible (önemsiz) / **C** ambiguous (belirsiz) / **E** reluctant (isteksiz).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Mount Everest is ---- the highest mountain on Earth, as satellite measurements have repeatedly confirmed its height above sea level.$q$, array[$o$reluctantly$o$, $o$barely$o$, $o$undeniably$o$, $o$jokingly$o$, $o$vaguely$o$], 2, $e$1. Boşluğa **undeniably** (şüphesiz) gelir. Uydu ölçümlerinin yinelenerek doğrulaması inkâr edilemez bir gerçeği gösterir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** barely (zar zor) / **D** jokingly (şakayla) / **E** vaguely (belirsizce).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The manager decided to ---- the employee about his repeated lateness instead of ignoring the problem any longer.$q$, array[$o$confront$o$, $o$accompany$o$, $o$imitate$o$, $o$dispatch$o$, $o$evacuate$o$], 0, $e$1. Boşluğa **confront** (yüzleşmek) gelir. Sorunu görmezden gelmek yerine çalışanla konuşmak onunla yüzleşmektir.

Diğer şıklar: **B** accompany (eşlik etmek) / **C** imitate (taklit etmek) / **D** dispatch (göndermek) / **E** evacuate (tahliye etmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$She was offered a job abroad with a very high salary, but she decided to ---- the offer because she did not want to leave her family.$q$, array[$o$carry out$o$, $o$use up$o$, $o$pour in$o$, $o$cash in on$o$, $o$turn down$o$], 4, $e$1. Boşluğa **turn down** (reddetmek) gelir. Ailesinden ayrılmak istememesi teklifi reddetmesine yol açar.

Diğer şıklar: **A** carry out (gerçekleştirmek) / **B** use up (tüketmek) / **C** pour in (akın etmek) / **D** cash in on (kârlanmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 21
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 21$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- of the villagers, who shared their food and homes with the refugees for months, was praised by aid workers.$q$, array[$o$hostility$o$, $o$rivalry$o$, $o$generosity$o$, $o$ambition$o$, $o$authority$o$], 2, $e$1. Boşluğa **generosity** (cömertlik) gelir. Yiyecek ve evlerini paylaşan köylülerin davranışı cömertliktir.

Diğer şıklar: **A** hostility (düşmanlık) / **B** rivalry (rekabet) / **D** ambition (hırs) / **E** authority (otorite).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The company recalled thousands of ---- products after customers complained that the batteries overheated and caused fires.$q$, array[$o$defective$o$, $o$delicate$o$, $o$durable$o$, $o$decorative$o$, $o$dormant$o$], 0, $e$1. Boşluğa **defective** (kusurlu) gelir. Aşırı ısınıp yangına yol açan piller kusurludur.

Diğer şıklar: **B** delicate (hassas) / **C** durable (dayanıklı) / **D** decorative (dekoratif) / **E** dormant (uykuda).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The cause of the disease has not yet been ---- established, although scientists have proposed several possible explanations.$q$, array[$o$casually$o$, $o$gently$o$, $o$lazily$o$, $o$slightly$o$, $o$definitively$o$], 4, $e$1. Boşluğa **definitively** (kesin olarak) gelir. Birkaç olası açıklama olmasına rağmen nedenin kesin olarak belirlenememesi söz konusudur.

Diğer şıklar: **A** casually (gelişigüzel) / **B** gently (nazikçe) / **C** lazily (tembelce) / **D** slightly (hafifçe).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Doctors use special machines to ---- the heartbeat of patients during an operation and warn the team if anything changes.$q$, array[$o$bargain$o$, $o$replace$o$, $o$monitor$o$, $o$admire$o$, $o$inherit$o$], 2, $e$1. Boşluğa **monitor** (izlemek) gelir. Ameliyat sırasında kalp atışını sürekli izlemek monitor ile söylenir.

Diğer şıklar: **A** bargain (pazarlık etmek) / **B** replace (değiştirmek) / **D** admire (hayran olmak) / **E** inherit (miras almak).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The lawyers worked all weekend to ---- a contract that both companies could sign on Monday morning.$q$, array[$o$draw up$o$, $o$wear out$o$, $o$go off$o$, $o$cut across$o$, $o$speed up$o$], 0, $e$1. Boşluğa **draw up** (hazırlamak) gelir. Sözleşme taslağı hazırlamak draw up ile söylenir.

Diğer şıklar: **B** wear out (yıpratmak) / **C** go off (bozulmak) / **D** cut across (aşmak) / **E** speed up (hızlandırmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Traffic ---- in the city centre has become so serious that a journey of five kilometres can take more than an hour at rush hour.$q$, array[$o$ceremony$o$, $o$congestion$o$, $o$reception$o$, $o$persuasion$o$, $o$allowance$o$], 1, $e$1. Boşluğa **congestion** (sıkışıklık) gelir. Beş kilometrenin bir saat sürmesi trafik sıkışıklığını gösterir.

Diğer şıklar: **A** ceremony (tören) / **C** reception (resepsiyon) / **D** persuasion (ikna) / **E** allowance (ödenek).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$It was ---- from the way she smiled that she was delighted with the news, although she said nothing.$q$, array[$o$obscure$o$, $o$unlikely$o$, $o$rare$o$, $o$tedious$o$, $o$evident$o$], 4, $e$1. Boşluğa **evident** (açık) gelir. Gülümsemesinden memnuniyeti belli oluyordu.

Diğer şıklar: **A** obscure (belirsiz) / **B** unlikely (olasılığı düşük) / **C** rare (nadir) / **D** tedious (sıkıcı).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$People often copy the body language of the person they are talking to ----, without realising that they are doing so.$q$, array[$o$deliberately$o$, $o$eagerly$o$, $o$officially$o$, $o$unconsciously$o$, $o$proudly$o$], 3, $e$1. Boşluğa **unconsciously** (bilinçsizce) gelir. Farkında olmadan taklit etmek bilinçsiz yapılır.

Diğer şıklar: **A** deliberately (kasten) / **B** eagerly (hevesle) / **C** officially (resmen) / **E** proudly (gururla).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The experiment was designed to ---- that plants need light to grow, using two groups of seeds, one kept in the dark.$q$, array[$o$hesitate$o$, $o$demonstrate$o$, $o$evaporate$o$, $o$apologise$o$, $o$retreat$o$], 1, $e$1. Boşluğa **demonstrate** (kanıtlamak) gelir. Bitkilerin ışığa ihtiyacı olduğunu deneyle göstermek demonstrate ile söylenir.

Diğer şıklar: **A** hesitate (tereddüt etmek) / **C** evaporate (buharlaşmak) / **D** apologise (özür dilemek) / **E** retreat (geri çekilmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Young children ---- their parents for food, clothing and protection, and cannot survive on their own.$q$, array[$o$get through$o$, $o$put aside$o$, $o$refer to$o$, $o$wear out$o$, $o$rely on$o$], 4, $e$1. Boşluğa **rely on** (güvenmek) gelir. Kendi başlarına hayatta kalamayan çocuklar ebeveynlerine bağımlıdır.

Diğer şıklar: **A** get through (geçmek) / **B** put aside (bir kenara koymak) / **C** refer to (değinmek) / **D** wear out (yıpratmak).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$Farmers in dry regions depend on ---- systems that bring water from rivers and wells to their fields during the summer months.$q$, array[$o$navigation$o$, $o$decoration$o$, $o$education$o$, $o$irrigation$o$, $o$registration$o$], 3, $e$1. Boşluğa **irrigation** (sulama) gelir. Nehir ve kuyu suyunu tarlaya taşıyan sistemler sulama sistemidir.

Diğer şıklar: **A** navigation (seyrüsefer) / **B** decoration (süsleme) / **C** education (eğitim) / **E** registration (kayıt).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$We are looking for a ---- engineer with at least five years of experience in designing bridges and tunnels.$q$, array[$o$competent$o$, $o$reluctant$o$, $o$spacious$o$, $o$ambiguous$o$, $o$hostile$o$], 0, $e$1. Boşluğa **competent** (yetkin) gelir. Beş yıllık deneyim isteyen ilanda aranan kişi yetkin bir mühendistir.

Diğer şıklar: **B** reluctant (isteksiz) / **C** spacious (geniş) / **D** ambiguous (belirsiz) / **E** hostile (düşmanca).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The word 'the' is the most ---- used word in the English language, appearing in almost every sentence.$q$, array[$o$barely$o$, $o$frequently$o$, $o$scarcely$o$, $o$reluctantly$o$, $o$lightly$o$], 1, $e$1. Boşluğa **frequently** (sık sık) gelir. Hemen her cümlede geçen sözcük en sık kullanılandır.

Diğer şıklar: **A** barely (zar zor) / **C** scarcely (neredeyse hiç) / **D** reluctantly (isteksizce) / **E** lightly (hafifçe).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$Tenants were told to ---- the building by the end of the month, because it was going to be demolished.$q$, array[$o$inhabit$o$, $o$renovate$o$, $o$vacate$o$, $o$inherit$o$, $o$purchase$o$], 2, $e$1. Boşluğa **vacate** (boşaltmak) gelir. Yıkılacak binayı boşaltmak vacate ile söylenir.

Diğer şıklar: **A** inhabit (ikamet etmek) / **B** renovate (yenilemek) / **D** inherit (miras almak) / **E** purchase (satın almak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$All companies must ---- the new environmental regulations or face heavy fines, which can reach millions of dollars.$q$, array[$o$comply with$o$, $o$catch up with$o$, $o$cut across$o$, $o$go off$o$, $o$put aside$o$], 0, $e$1. Boşluğa **comply with** (uymak) gelir. Ağır cezadan kaçınmak için kurallara uymak gerekir.

Diğer şıklar: **B** catch up with (yetişmek) / **C** cut across (aşmak) / **D** go off (bozulmak) / **E** put aside (bir kenara koymak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Experts are worried about the country's growing ---- on imported energy, which makes its economy sensitive to changes in world prices.$q$, array[$o$confidence$o$, $o$dependency$o$, $o$reluctance$o$, $o$sympathy$o$, $o$vacancy$o$], 1, $e$1. Boşluğa **dependency** (bağımlılık) gelir. İthal enerjiye bağlılık dünya fiyatlarına duyarlılığı artırır.

Diğer şıklar: **A** confidence (güven) / **C** reluctance (isteksizlik) / **D** sympathy (sempati) / **E** vacancy (boşluk).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$On a clear night in the countryside, you can see ---- stars that are invisible from the bright lights of the city.$q$, array[$o$inevitable$o$, $o$inadequate$o$, $o$indifferent$o$, $o$innumerable$o$, $o$inaccurate$o$], 3, $e$1. Boşluğa **innumerable** (sayısız) gelir. Şehirden görünmeyen çok sayıda yıldız sayısızdır.

Diğer şıklar: **A** inevitable (kaçınılmaz) / **B** inadequate (yetersiz) / **C** indifferent (kayıtsız) / **E** inaccurate (hatalı).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Since the introduction of the new law, the number of road accidents has fallen ----, from over two thousand to under five hundred a year.$q$, array[$o$slightly$o$, $o$hardly$o$, $o$dramatically$o$, $o$leisurely$o$, $o$quietly$o$], 2, $e$1. Boşluğa **dramatically** (çarpıcı biçimde) gelir. İki binden beş yüzün altına düşüş çarpıcıdır.

Diğer şıklar: **A** slightly (hafifçe) / **B** hardly (neredeyse hiç) / **D** leisurely (ağır ağır) / **E** quietly (sessizce).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The government used the army to ---- the protests, and hundreds of demonstrators were arrested in the first week.$q$, array[$o$welcome$o$, $o$inspire$o$, $o$celebrate$o$, $o$tolerate$o$, $o$repress$o$], 4, $e$1. Boşluğa **repress** (bastırmak) gelir. Ordu kullanılması ve tutuklamalar protestoların bastırıldığını gösterir.

Diğer şıklar: **A** welcome (karşılamak) / **B** inspire (ilham vermek) / **C** celebrate (kutlamak) / **D** tolerate (hoş görmek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Doctors advise people with high blood pressure to ---- salt and fatty foods in order to reduce the risk of heart disease.$q$, array[$o$draw up$o$, $o$attribute to$o$, $o$get through$o$, $o$cut back on$o$, $o$speed up$o$], 3, $e$1. Boşluğa **cut back on** (azaltmak) gelir. Tuz ve yağlı gıdayı azaltmak cut back on ile söylenir.

Diğer şıklar: **A** draw up (hazırlamak) / **B** attribute to (atfetmek) / **C** get through (geçmek) / **E** speed up (hızlandırmak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

