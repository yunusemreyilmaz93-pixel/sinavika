-- 20261026110000_questions_ydt_kelime_7. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 36
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 36$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The company introduced several ---- in the last decade, including a battery that charges in five minutes and a car that drives itself.$q$, array[$o$rehearsals$o$, $o$reservations$o$, $o$complaints$o$, $o$migrations$o$, $o$innovations$o$], 4, $e$1. Boşluğa **innovations** (yenilikler) gelir. Beş dakikada şarj olan pil ve kendi kendine giden araba yeniliklerdir.

Diğer şıklar: **A** rehearsals (provalar) / **B** reservations (çekinceler) / **C** complaints (şikâyetler) / **D** migrations (göçler).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$A good teacher should be ---- enough to change the lesson plan if the students do not understand a topic.$q$, array[$o$rigid$o$, $o$flexible$o$, $o$hostile$o$, $o$vacant$o$, $o$reckless$o$], 1, $e$1. Boşluğa **flexible** (esnek) gelir. Planı değiştirebilmek esnek olmayı gerektirir.

Diğer şıklar: **A** rigid (katı) / **C** hostile (düşmanca) / **D** vacant (boş) / **E** reckless (pervasız).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The coach ---- refused to change the team, even after three defeats in a row, because he believed in the players.$q$, array[$o$gladly$o$, $o$politely$o$, $o$loosely$o$, $o$stubbornly$o$, $o$hardly$o$], 3, $e$1. Boşluğa **stubbornly** (inatla) gelir. Üç yenilgiye rağmen değiştirmemek inatçı bir tutumdur.

Diğer şıklar: **A** gladly (memnuniyetle) / **B** politely (kibarca) / **C** loosely (gevşekçe) / **E** hardly (zar zor).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The company had to ---- its headquarters from the capital to a smaller city because the rent in the centre had become too high.$q$, array[$o$cooperate$o$, $o$compensate$o$, $o$relocate$o$, $o$hesitate$o$, $o$dominate$o$], 2, $e$1. Boşluğa **relocate** (taşımak) gelir. Kira pahalı olduğu için merkezi başka şehre taşımak relocate ile söylenir.

Diğer şıklar: **A** cooperate (işbirliği yapmak) / **B** compensate (telafi etmek) / **D** hesitate (tereddüt etmek) / **E** dominate (hâkim olmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$She decided to ---- painting after she retired, and now she sells her pictures at local markets every weekend.$q$, array[$o$give out$o$, $o$set back$o$, $o$wear off$o$, $o$burn down$o$, $o$take up$o$], 4, $e$1. Boşluğa **take up** (başlamak) gelir. Emekli olunca yeni bir uğraşa başlamak take up ile söylenir.

Diğer şıklar: **A** give out (dağıtmak) / **B** set back (geciktirmek) / **C** wear off (etkisini yitirmek) / **D** burn down (yanıp kül olmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Archaeologists have gained new ---- into the daily life of the ancient city after discovering hundreds of letters written on clay tablets.$q$, array[$o$delivery$o$, $o$fatigue$o$, $o$pardon$o$, $o$insight$o$, $o$spectacle$o$], 3, $e$1. Boşluğa **insight** (kavrayış) gelir. Mektuplar eski şehirdeki yaşam hakkında yeni bir kavrayış sağlar.

Diğer şıklar: **A** delivery (teslimat) / **B** fatigue (yorgunluk) / **C** pardon (af) / **E** spectacle (gösteri).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The new phones are very ----: they can be used to take photographs, to pay for shopping, to navigate and even to measure your heartbeat.$q$, array[$o$versatile$o$, $o$trivial$o$, $o$reluctant$o$, $o$remote$o$, $o$vague$o$], 0, $e$1. Boşluğa **versatile** (çok yönlü) gelir. Fotoğraf, ödeme ve yön bulma yapabilmesi çok yönlülüktür.

Diğer şıklar: **B** trivial (önemsiz) / **C** reluctant (isteksiz) / **D** remote (uzak) / **E** vague (belirsiz).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The new rules apply ---- to all students, so nobody, including the children of teachers, can be treated differently.$q$, array[$o$partly$o$, $o$rarely$o$, $o$gently$o$, $o$vaguely$o$, $o$equally$o$], 4, $e$1. Boşluğa **equally** (eşit biçimde) gelir. Öğretmen çocukları dahil kimsenin farklı muamele görmemesi eşit uygulamadır.

Diğer şıklar: **A** partly (kısmen) / **B** rarely (nadiren) / **C** gently (nazikçe) / **D** vaguely (belirsizce).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Children usually ---- their first words at around twelve months, although some begin to speak earlier and others later.$q$, array[$o$forbid$o$, $o$utter$o$, $o$enclose$o$, $o$pledge$o$, $o$wander$o$], 1, $e$1. Boşluğa **utter** (söylemek) gelir. Ilk sözcükleri ağızdan çıkarmak utter ile söylenir.

Diğer şıklar: **A** forbid (yasaklamak) / **C** enclose (çevrelemek) / **D** pledge (söz vermek) / **E** wander (dolaşmak).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The two brothers ---- after a silly argument about money, and they did not speak to each other for almost ten years.$q$, array[$o$fell out$o$, $o$fell through$o$, $o$fell behind$o$, $o$fell apart$o$, $o$fell for$o$], 0, $e$1. Boşluğa **fell out** (tartışıp küsmek) gelir. On yıl konuşmayan kardeşler tartışıp küsmüştür.

Diğer şıklar: **B** fell through (suya düşmek) / **C** fell behind (geride kalmak) / **D** fell apart (dağılmak) / **E** fell for (aşık olmak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Every citizen has an ---- to obey the law, and ignorance of the rules is not accepted as a reason for breaking them.$q$, array[$o$opposition$o$, $o$ambition$o$, $o$obligation$o$, $o$invitation$o$, $o$vacation$o$], 2, $e$1. Boşluğa **obligation** (yükümlülük) gelir. Kanunlara uymak vatandaşın yükümlülüğüdür.

Diğer şıklar: **A** opposition (muhalefet) / **B** ambition (hırs) / **D** invitation (davet) / **E** vacation (tatil).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$It is ---- that the climate will continue to change over the coming decades, whatever steps governments may take today.$q$, array[$o$optional$o$, $o$trivial$o$, $o$reversible$o$, $o$inevitable$o$, $o$incidental$o$], 3, $e$1. Boşluğa **inevitable** (kaçınılmaz) gelir. Önlemlere rağmen iklimin değişmesi kaçınılmazdır.

Diğer şıklar: **A** optional (isteğe bağlı) / **B** trivial (önemsiz) / **C** reversible (geri döndürülebilir) / **E** incidental (tesadüfi).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The tourists were ---- welcomed by the villagers, who invited them into their homes and offered them tea and fresh bread.$q$, array[$o$coldly$o$, $o$warmly$o$, $o$rudely$o$, $o$barely$o$, $o$lazily$o$], 1, $e$1. Boşluğa **warmly** (sıcak biçimde) gelir. Çay ve ekmek ikram etmek sıcak karşılamadır.

Diğer şıklar: **A** coldly (soğuk biçimde) / **C** rudely (kabaca) / **D** barely (zar zor) / **E** lazily (tembelce).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$The old mine was closed after an accident, but the owners plan to ---- it next year, using safer methods than before.$q$, array[$o$reopen$o$, $o$cancel$o$, $o$bury$o$, $o$mislead$o$, $o$restrict$o$], 0, $e$1. Boşluğa **reopen** (yeniden açmak) gelir. Daha güvenli yöntemlerle madeni yeniden işletmek reopen ile söylenir.

Diğer şıklar: **B** cancel (iptal etmek) / **C** bury (gömmek) / **D** mislead (yanıltmak) / **E** restrict (kısıtlamak).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$The film is so popular that tickets for the evening shows ---- within an hour of going on sale.$q$, array[$o$sort out$o$, $o$set out$o$, $o$sell out$o$, $o$show off$o$, $o$spell out$o$], 2, $e$1. Boşluğa **sell out** (tükenmek) gelir. Bir saat içinde biletlerin tükenmesi sell out ile söylenir.

Diğer şıklar: **A** sort out (çözmek) / **B** set out (yola çıkmak) / **D** show off (gösteriş yapmak) / **E** spell out (açıklamak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Doctors advise travellers to take simple ---- against malaria, such as sleeping under a net and using a special cream on the skin.$q$, array[$o$restrictions$o$, $o$fragments$o$, $o$privileges$o$, $o$precautions$o$, $o$souvenirs$o$], 3, $e$1. Boşluğa **precautions** (önlemler) gelir. Cibinlik ve krem sıtmaya karşı alınan önlemlerdir.

Diğer şıklar: **A** restrictions (kısıtlamalar) / **B** fragments (parçalar) / **C** privileges (ayrıcalıklar) / **E** souvenirs (hatıralar).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Scientists have collected ---- evidence of the effects of pollution, including thousands of photographs, samples and measurements.$q$, array[$o$trivial$o$, $o$anonymous$o$, $o$temporary$o$, $o$tedious$o$, $o$substantial$o$], 4, $e$1. Boşluğa **substantial** (önemli miktarda) gelir. Binlerce fotoğraf, örnek ve ölçüm az olmayan kanıttır.

Diğer şıklar: **A** trivial (önemsiz) / **B** anonymous (anonim) / **C** temporary (geçici) / **D** tedious (sıkıcı).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The number of visitors to the museum has risen ---- over the last year, and the director now plans to open a second building.$q$, array[$o$markedly$o$, $o$slightly$o$, $o$marginally$o$, $o$hardly$o$, $o$faintly$o$], 0, $e$1. Boşluğa **markedly** (belirgin biçimde) gelir. İkinci bina planı, ziyaretçi sayısının çok arttığını gösterir.

Diğer şıklar: **B** slightly (hafifçe) / **C** marginally (çok az) / **D** hardly (neredeyse hiç) / **E** faintly (belli belirsiz).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Researchers will ---- the results of the survey carefully before they publish any conclusions about the health of the students.$q$, array[$o$interrupt$o$, $o$imitate$o$, $o$interpret$o$, $o$inherit$o$, $o$insult$o$], 2, $e$1. Boşluğa **interpret** (yorumlamak) gelir. Sonuç yayımlamadan önce anket verisini yorumlamak gerekir.

Diğer şıklar: **A** interrupt (bölmek) / **B** imitate (taklit etmek) / **D** inherit (miras almak) / **E** insult (hakaret etmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$She decided to ---- her old clothes and give them to a charity that helps families who have lost their homes.$q$, array[$o$clear up$o$, $o$clear out$o$, $o$check in$o$, $o$chip in$o$, $o$cheer up$o$], 1, $e$1. Boşluğa **clear out** (boşaltmak) gelir. Eski kıyafetleri ayıklayıp bağışlamak clear out ile söylenir.

Diğer şıklar: **A** clear up (açıklığa kavuşturmak) / **C** check in (giriş yapmak) / **D** chip in (katkıda bulunmak) / **E** cheer up (neşelenmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 37
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 37$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Relations between the two neighbours remain full of ----, and the smallest incident on the border could easily start a new conflict.$q$, array[$o$admiration$o$, $o$delight$o$, $o$pardon$o$, $o$tension$o$, $o$reward$o$], 3, $e$1. Boşluğa **tension** (gerilim) gelir. Küçük bir sınır olayının çatışma çıkarabilmesi gerilimin yüksek olduğunu gösterir.

Diğer şıklar: **A** admiration (hayranlık) / **B** delight (sevinç) / **C** pardon (af) / **E** reward (ödül).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Fresh water is becoming ---- in many parts of the world, and experts warn that wars may be fought over it in the future.$q$, array[$o$abundant$o$, $o$available$o$, $o$plentiful$o$, $o$affordable$o$, $o$scarce$o$], 4, $e$1. Boşluğa **scarce** (kıt) gelir. Su yüzünden savaş çıkabileceği uyarısı suyun kıt olduğunu gösterir.

Diğer şıklar: **A** abundant (bol) / **B** available (mevcut) / **C** plentiful (bol) / **D** affordable (uygun fiyatlı).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The book is ---- read in schools across the country, and many teachers say it has changed the way children think about history.$q$, array[$o$widely$o$, $o$barely$o$, $o$hardly$o$, $o$secretly$o$, $o$lightly$o$], 0, $e$1. Boşluğa **widely** (yaygın biçimde) gelir. Ülke çapında okullarda okunması yaygın okunmasıdır.

Diğer şıklar: **B** barely (zar zor) / **C** hardly (neredeyse hiç) / **D** secretly (gizlice) / **E** lightly (hafifçe).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The engineers decided to ---- the old bridge with steel supports so that it could carry heavier traffic.$q$, array[$o$demolish$o$, $o$disguise$o$, $o$postpone$o$, $o$reinforce$o$, $o$weaken$o$], 3, $e$1. Boşluğa **reinforce** (güçlendirmek) gelir. Daha ağır trafik için çelik destekle sağlamlaştırmak reinforce ile söylenir.

Diğer şıklar: **A** demolish (yıkmak) / **B** disguise (gizlemek) / **C** postpone (ertelemek) / **E** weaken (zayıflatmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Students must ---- their projects before Friday afternoon, because late work will not be accepted by the teacher.$q$, array[$o$pick up$o$, $o$take off$o$, $o$hand in$o$, $o$break out$o$, $o$turn on$o$], 2, $e$1. Boşluğa **hand in** (teslim etmek) gelir. Projeleri öğretmene teslim etmek hand in ile söylenir.

Diğer şıklar: **A** pick up (almak) / **B** take off (çıkarmak) / **D** break out (patlak vermek) / **E** turn on (açmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$In the Arctic, the ---- of small animals depends on the thickness of their fur and on finding enough food during the long winter.$q$, array[$o$tourism$o$, $o$survival$o$, $o$curriculum$o$, $o$ceremony$o$, $o$invoice$o$], 1, $e$1. Boşluğa **survival** (hayatta kalma) gelir. Kalın tüy ve yiyecek bulmak hayatta kalmayı belirler.

Diğer şıklar: **A** tourism (turizm) / **C** curriculum (müfredat) / **D** ceremony (tören) / **E** invoice (fatura).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$The ---- glass allows visitors to see the fish swimming in the tank from every side without any difficulty.$q$, array[$o$transparent$o$, $o$opaque$o$, $o$frozen$o$, $o$sticky$o$, $o$bitter$o$], 0, $e$1. Boşluğa **transparent** (saydam) gelir. Balıkları her yönden görmeyi sağlayan cam saydamdır.

Diğer şıklar: **B** opaque (mat) / **C** frozen (donmuş) / **D** sticky (yapışkan) / **E** bitter (acı).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The idea that the Earth is flat has been ---- rejected by scientists since ancient times, because of clear evidence to the contrary.$q$, array[$o$narrowly$o$, $o$vaguely$o$, $o$universally$o$, $o$fiercely$o$, $o$casually$o$], 2, $e$1. Boşluğa **universally** (evrensel olarak) gelir. Bilim insanlarının hepsince reddedilen fikir evrensel olarak reddedilmiştir.

Diğer şıklar: **A** narrowly (ucu ucuna) / **B** vaguely (belirsizce) / **D** fiercely (şiddetle) / **E** casually (gelişigüzel).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Workers spent five years trying to ---- the damaged cathedral to its original condition after the fire.$q$, array[$o$abandon$o$, $o$restore$o$, $o$sell$o$, $o$copy$o$, $o$bury$o$], 1, $e$1. Boşluğa **restore** (eski haline getirmek) gelir. Yangından sonra eski haline getirmek restore ile söylenir.

Diğer şıklar: **A** abandon (terk etmek) / **C** sell (satmak) / **D** copy (kopyalamak) / **E** bury (gömmek).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The film was expected to be a disaster, but it ---- to be the most successful comedy of the year.$q$, array[$o$pulled in$o$, $o$came in$o$, $o$ran in$o$, $o$stood in$o$, $o$turned out$o$], 4, $e$1. Boşluğa **turned out** (çıkmak) gelir. Beklenenin tersine yılın en başarılı komedisi olmak turn out ile söylenir.

Diğer şıklar: **A** pulled in (girmek) / **B** came in (girmek) / **C** ran in (koşmak) / **D** stood in (yerini almak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Short breaks during the working day can increase ----, as employees return to their desks more focused and make fewer mistakes.$q$, array[$o$hostility$o$, $o$punishment$o$, $o$hesitation$o$, $o$productivity$o$, $o$complexity$o$], 3, $e$1. Boşluğa **productivity** (verimlilik) gelir. Daha odaklı çalışıp az hata yapmak verimliliği artırır.

Diğer şıklar: **A** hostility (düşmanlık) / **B** punishment (ceza) / **C** hesitation (tereddüt) / **E** complexity (karmaşıklık).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Filling in the long forms by hand was a ---- job that took the whole afternoon, and everyone was relieved when it was over.$q$, array[$o$thrilling$o$, $o$rewarding$o$, $o$tedious$o$, $o$spontaneous$o$, $o$desirable$o$], 2, $e$1. Boşluğa **tedious** (sıkıcı) gelir. Bitince herkesin rahatlaması işin sıkıcı olduğunu gösterir.

Diğer şıklar: **A** thrilling (heyecan verici) / **B** rewarding (tatmin edici) / **D** spontaneous (kendiliğinden) / **E** desirable (istenen).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Smoking is ---- forbidden in the hospital, and people who ignore the rule are asked to leave the building immediately.$q$, array[$o$loosely$o$, $o$strictly$o$, $o$hardly$o$, $o$lazily$o$, $o$barely$o$], 1, $e$1. Boşluğa **strictly** (kesinlikle) gelir. Kuralı çiğneyenin binadan çıkarılması katı yasağı gösterir.

Diğer şıklar: **A** loosely (gevşekçe) / **C** hardly (neredeyse hiç) / **D** lazily (tembelce) / **E** barely (zar zor).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Children ---- the world differently from adults, noticing small details that grown-ups usually ignore.$q$, array[$o$consume$o$, $o$compile$o$, $o$bargain$o$, $o$resign$o$, $o$perceive$o$], 4, $e$1. Boşluğa **perceive** (algılamak) gelir. Dünyayı farklı görmek perceive ile söylenir.

Diğer şıklar: **A** consume (tüketmek) / **B** compile (derlemek) / **C** bargain (pazarlık etmek) / **D** resign (istifa etmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Nobody knows exactly how the misunderstanding ----, but both sides now agree that someone should have checked the facts earlier.$q$, array[$o$came about$o$, $o$held out$o$, $o$went off$o$, $o$pulled up$o$, $o$got over$o$], 0, $e$1. Boşluğa **came about** (meydana gelmek) gelir. Yanlış anlamanın nasıl ortaya çıktığı come about ile söylenir.

Diğer şıklar: **B** held out (dayanmak) / **C** went off (bozulmak) / **D** pulled up (durmak) / **E** got over (atlatmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The two companies have been bitter ---- for decades, each trying to attract the other's customers with lower prices and new products.$q$, array[$o$witnesses$o$, $o$rivals$o$, $o$relatives$o$, $o$tenants$o$, $o$hosts$o$], 1, $e$1. Boşluğa **rivals** (rakipler) gelir. Müşteri çekmek için yarışan şirketler rakiptir.

Diğer şıklar: **A** witnesses (tanıklar) / **C** relatives (akrabalar) / **D** tenants (kiracılar) / **E** hosts (ev sahipleri).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The detective's theory seemed ---- at first, but it was later proved false when new evidence was discovered at the scene.$q$, array[$o$absurd$o$, $o$unlikely$o$, $o$reluctant$o$, $o$hostile$o$, $o$plausible$o$], 4, $e$1. Boşluğa **plausible** (akla yatkın) gelir. Sonradan yanlışlanan teori önce akla yatkın görünür.

Diğer şıklar: **A** absurd (saçma) / **B** unlikely (olası olmayan) / **C** reluctant (isteksiz) / **D** hostile (düşmanca).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is a quiet man who ---- speaks at meetings, but when he does, everyone listens carefully to what he says.$q$, array[$o$occasionally$o$, $o$constantly$o$, $o$frequently$o$, $o$eagerly$o$, $o$noisily$o$], 0, $e$1. Boşluğa **occasionally** (ara sıra) gelir. Konuştuğunda herkesin dinlemesi nadiren konuştuğunu gösterir.

Diğer şıklar: **B** constantly (sürekli) / **C** frequently (sık sık) / **D** eagerly (hevesle) / **E** noisily (gürültülü biçimde).$e$, 1),
  (19, 'ydt-dil', null::integer, $q$If the symptoms ---- for more than two weeks, you should see a doctor, since they may be a sign of a more serious illness.$q$, array[$o$vanish$o$, $o$fade$o$, $o$persist$o$, $o$improve$o$, $o$decline$o$], 2, $e$1. Boşluğa **persist** (sürmek) gelir. İki haftadan uzun süren belirtiler için doktora gidilir.

Diğer şıklar: **A** vanish (yok olmak) / **B** fade (solmak) / **D** improve (iyileşmek) / **E** decline (azalmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$True friends ---- you in difficult times, even when everybody else turns away and nobody believes your story.$q$, array[$o$look into$o$, $o$take over$o$, $o$carry out$o$, $o$stand by$o$, $o$make up$o$], 3, $e$1. Boşluğa **stand by** (yanında olmak) gelir. Herkes yüz çevirirken yanında kalmak stand by ile söylenir.

Diğer şıklar: **A** look into (araştırmak) / **B** take over (devralmak) / **C** carry out (gerçekleştirmek) / **E** make up (uydurmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 38
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 38$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Clinical trials are conducted to test both the safety and the ---- of a new drug, that is, how well it actually cures the disease.$q$, array[$o$vocabulary$o$, $o$hostility$o$, $o$ownership$o$, $o$publicity$o$, $o$efficacy$o$], 4, $e$1. Boşluğa **efficacy** (etkinlik) gelir. İlacın hastalığı ne kadar iyileştirdiği etkinliğidir.

Diğer şıklar: **A** vocabulary (kelime hazinesi) / **B** hostility (düşmanlık) / **C** ownership (sahiplik) / **D** publicity (tanıtım).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$Smartphones have become ---- in modern life, and it is almost impossible to find a place where nobody is using one.$q$, array[$o$exceptional$o$, $o$dormant$o$, $o$ubiquitous$o$, $o$fragile$o$, $o$obscure$o$], 2, $e$1. Boşluğa **ubiquitous** (her yerde bulunan) gelir. Neredeyse her yerde kullanılan şey her yerde bulunandır.

Diğer şıklar: **A** exceptional (istisnai) / **B** dormant (uykuda) / **D** fragile (kırılgan) / **E** obscure (belirsiz).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The minister ---- denied the rumours, insisting that he had never taken any money and that the story was a complete lie.$q$, array[$o$vaguely$o$, $o$gently$o$, $o$casually$o$, $o$vehemently$o$, $o$slowly$o$], 3, $e$1. Boşluğa **vehemently** (şiddetle) gelir. Tamamen yalan diyerek reddetmek şiddetli bir inkârdır.

Diğer şıklar: **A** vaguely (belirsizce) / **B** gently (nazikçe) / **C** casually (gelişigüzel) / **E** slowly (yavaşça).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Taking strong medicine without a doctor's advice may ---- the problem instead of solving it, and the patient may feel even worse.$q$, array[$o$exacerbate$o$, $o$alleviate$o$, $o$cure$o$, $o$clarify$o$, $o$simplify$o$], 0, $e$1. Boşluğa **exacerbate** (ağırlaştırmak) gelir. Hastanın daha kötü hissetmesi sorunun ağırlaşmasıdır.

Diğer şıklar: **B** alleviate (hafifletmek) / **C** cure (iyileştirmek) / **D** clarify (açıklığa kavuşturmak) / **E** simplify (basitleştirmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$Please ---- my offer carefully, and let me know your decision by the end of next week.$q$, array[$o$take off$o$, $o$think over$o$, $o$pull out$o$, $o$drop in$o$, $o$back down$o$], 1, $e$1. Boşluğa **think over** (iyice düşünmek) gelir. Teklifi dikkatle düşünmek think over ile söylenir.

Diğer şıklar: **A** take off (çıkarmak) / **C** pull out (çekilmek) / **D** drop in (uğramak) / **E** back down (geri adım atmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The auditors found a large ---- between the figures in the company's accounts and the amount of money actually in its bank account.$q$, array[$o$alliance$o$, $o$ceremony$o$, $o$compliment$o$, $o$discrepancy$o$, $o$reduction$o$], 3, $e$1. Boşluğa **discrepancy** (tutarsızlık) gelir. Hesaplar ile gerçek para arasındaki uyumsuzluk tutarsızlıktır.

Diğer şıklar: **A** alliance (ittifak) / **B** ceremony (tören) / **C** compliment (iltifat) / **E** reduction (azaltma).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The difference in price between the two models is ----, so most customers choose the one that looks better.$q$, array[$o$negligible$o$, $o$enormous$o$, $o$drastic$o$, $o$decisive$o$, $o$vital$o$], 0, $e$1. Boşluğa **negligible** (önemsiz) gelir. Müşterinin görünüme bakması fiyat farkının önemsiz olduğunu gösterir.

Diğer şıklar: **B** enormous (muazzam) / **C** drastic (sert) / **D** decisive (belirleyici) / **E** vital (hayati).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The volunteers worked ---- for three days and nights, searching for survivors under the ruins of the collapsed buildings.$q$, array[$o$carelessly$o$, $o$reluctantly$o$, $o$tirelessly$o$, $o$leisurely$o$, $o$hesitantly$o$], 2, $e$1. Boşluğa **tirelessly** (yorulmadan) gelir. Üç gün üç gece arama yapmak yorulmadan çalışmaktır.

Diğer şıklar: **A** carelessly (dikkatsizce) / **B** reluctantly (isteksizce) / **D** leisurely (ağır ağır) / **E** hesitantly (çekinerek).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Some companies try to ---- the rules by moving their factories to countries where environmental laws are weaker.$q$, array[$o$obey$o$, $o$ratify$o$, $o$honour$o$, $o$respect$o$, $o$circumvent$o$], 4, $e$1. Boşluğa **circumvent** (dolanmak) gelir. Kuralları aşmak için fabrikayı taşımak dolanmaktır.

Diğer şıklar: **A** obey (uymak) / **B** ratify (onaylamak) / **C** honour (onurlandırmak) / **D** respect (saygı göstermek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The newspaper was asked to ---- its criticism of the government, since several articles had been considered too aggressive.$q$, array[$o$show off$o$, $o$tone down$o$, $o$pay off$o$, $o$dig up$o$, $o$sort out$o$], 1, $e$1. Boşluğa **tone down** (yumuşatmak) gelir. Fazla sert yazıları yumuşatmak tone down ile söylenir.

Diğer şıklar: **A** show off (gösteriş yapmak) / **C** pay off (sonuç vermek) / **D** dig up (ortaya çıkarmak) / **E** sort out (çözmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The decision to raise ticket prices caused a ---- among passengers, and thousands of them signed a petition against it.$q$, array[$o$backlash$o$, $o$refreshment$o$, $o$merger$o$, $o$sample$o$, $o$triumph$o$], 0, $e$1. Boşluğa **backlash** (tepki) gelir. Bilet zammına karşı imza toplayan yolcuların tepkisi backlash ile söylenir.

Diğer şıklar: **B** refreshment (ikram) / **C** merger (birleşme) / **D** sample (örnek) / **E** triumph (zafer).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Computers have become ---- tools in modern offices, and without them most of the daily work would simply stop.$q$, array[$o$optional$o$, $o$peripheral$o$, $o$indispensable$o$, $o$obsolete$o$, $o$trivial$o$], 2, $e$1. Boşluğa **indispensable** (vazgeçilmez) gelir. Olmadan işin duracağı araç vazgeçilmezdir.

Diğer şıklar: **A** optional (isteğe bağlı) / **B** peripheral (ikincil) / **D** obsolete (modası geçmiş) / **E** trivial (önemsiz).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The restaurant is ---- the best in town, but when we ate there the food was cold and the service was extremely slow.$q$, array[$o$certainly$o$, $o$obviously$o$, $o$permanently$o$, $o$supposedly$o$, $o$freely$o$], 3, $e$1. Boşluğa **supposedly** (sözde) gelir. Beklentiyi tutmayan restoran sözde en iyisidir.

Diğer şıklar: **A** certainly (kuşkusuz) / **B** obviously (açıkça) / **C** permanently (kalıcı olarak) / **E** freely (serbestçe).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$From the footprints in the snow, the detective could ---- that at least two people had entered the garden during the night.$q$, array[$o$expand$o$, $o$yield$o$, $o$quarrel$o$, $o$settle$o$, $o$infer$o$], 4, $e$1. Boşluğa **infer** (çıkarım yapmak) gelir. Ayak izlerinden sonuç çıkarmak infer ile söylenir.

Diğer şıklar: **A** expand (genişletmek) / **B** yield (boyun eğmek) / **C** quarrel (tartışmak) / **D** settle (yerleşmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The company uses a series of tests to ---- unsuitable candidates before inviting the best applicants for a final interview.$q$, array[$o$weed out$o$, $o$run out$o$, $o$hold out$o$, $o$drop out$o$, $o$work out$o$], 0, $e$1. Boşluğa **weed out** (elemek) gelir. Uygun olmayanları testle ayıklamak weed out ile söylenir.

Diğer şıklar: **B** run out (tükenmek) / **C** hold out (dayanmak) / **D** drop out (bırakmak) / **E** work out (çözmek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$A sudden ---- in demand for face masks left many shops empty within hours, and prices rose rapidly.$q$, array[$o$defect$o$, $o$surge$o$, $o$refund$o$, $o$pledge$o$, $o$quarrel$o$], 1, $e$1. Boşluğa **surge** (ani artış) gelir. Saatler içinde rafları boşaltan talep artışı ani yükselmedir.

Diğer şıklar: **A** defect (kusur) / **C** refund (iade) / **D** pledge (söz) / **E** quarrel (kavga).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The police stopped the ---- driver who was racing through the city centre at twice the speed limit.$q$, array[$o$cautious$o$, $o$patient$o$, $o$sensible$o$, $o$reliable$o$, $o$reckless$o$], 4, $e$1. Boşluğa **reckless** (pervasız) gelir. Hız sınırının iki katıyla giden sürücü pervasızdır.

Diğer şıklar: **A** cautious (temkinli) / **B** patient (sabırlı) / **C** sensible (makul) / **D** reliable (güvenilir).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The documents had been stored ----, with files from different years mixed together, so finding a single letter took hours.$q$, array[$o$systematically$o$, $o$carefully$o$, $o$neatly$o$, $o$haphazardly$o$, $o$strictly$o$], 3, $e$1. Boşluğa **haphazardly** (gelişigüzel) gelir. Yılların karışık olduğu dosyalar gelişigüzel saklanmıştır.

Diğer şıklar: **A** systematically (sistemli biçimde) / **B** carefully (dikkatle) / **C** neatly (düzenli biçimde) / **E** strictly (kesinlikle).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The police managed to ---- the robbers' plan by arresting them just before they reached the bank.$q$, array[$o$support$o$, $o$thwart$o$, $o$assist$o$, $o$copy$o$, $o$encourage$o$], 1, $e$1. Boşluğa **thwart** (engellemek) gelir. Soygunu bankaya varmadan bozmak thwart ile söylenir.

Diğer şıklar: **A** support (desteklemek) / **C** assist (yardım etmek) / **D** copy (kopyalamak) / **E** encourage (cesaretlendirmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Running on hard roads every day can ---- your shoes very quickly, so good runners often replace them every few months.$q$, array[$o$pick out$o$, $o$hand out$o$, $o$wear out$o$, $o$set out$o$, $o$pass out$o$], 2, $e$1. Boşluğa **wear out** (yıpratmak) gelir. Ayakkabıların çabuk eskimesi wear out ile söylenir.

Diğer şıklar: **A** pick out (seçmek) / **B** hand out (dağıtmak) / **D** set out (yola çıkmak) / **E** pass out (bayılmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 39
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 39$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The country's trade ---- grew last year because it bought far more goods from abroad than it sold, and the government is worried.$q$, array[$o$surplus$o$, $o$alliance$o$, $o$disguise$o$, $o$deficit$o$, $o$pension$o$], 3, $e$1. Boşluğa **deficit** (açık) gelir. Satılandan çok alınması ticaret açığıdır.

Diğer şıklar: **A** surplus (fazla) / **B** alliance (ittifak) / **C** disguise (kılık) / **E** pension (emekli maaşı).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$A sense of fear was ---- in the city after the attacks, and people avoided crowded places and public transport.$q$, array[$o$adjacent$o$, $o$pervasive$o$, $o$frugal$o$, $o$feasible$o$, $o$eligible$o$], 1, $e$1. Boşluğa **pervasive** (yaygın) gelir. Kalabalıktan kaçınan halkta her yere sinen bir korku vardır.

Diğer şıklar: **A** adjacent (bitişik) / **C** frugal (tutumlu) / **D** feasible (uygulanabilir) / **E** eligible (uygun).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The president ---- rejected the proposal, saying that there was no possibility of changing his mind under any circumstances.$q$, array[$o$hesitantly$o$, $o$partially$o$, $o$unequivocally$o$, $o$vaguely$o$, $o$mildly$o$], 2, $e$1. Boşluğa **unequivocally** (kesin biçimde) gelir. Hiçbir koşulda fikrini değiştirmeyeceğini söylemesi kesin bir ret anlamına gelir.

Diğer şıklar: **A** hesitantly (tereddütle) / **B** partially (kısmen) / **D** vaguely (belirsizce) / **E** mildly (hafifçe).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$The teacher asked clever questions to ---- responses from even the shyest students in the class.$q$, array[$o$elicit$o$, $o$conceal$o$, $o$dismiss$o$, $o$demolish$o$, $o$prohibit$o$], 0, $e$1. Boşluğa **elicit** (ortaya çıkarmak) gelir. Çekingen öğrencilerden bile cevap almak elicit ile söylenir.

Diğer şıklar: **B** conceal (gizlemek) / **C** dismiss (reddetmek) / **D** demolish (yıkmak) / **E** prohibit (yasaklamak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The council decided to ---- the old stadium and build a new park and a swimming pool on the same land.$q$, array[$o$hand in$o$, $o$sit down$o$, $o$lay off$o$, $o$pick up$o$, $o$tear down$o$], 4, $e$1. Boşluğa **tear down** (yıkmak) gelir. Eski stadı yıkıp park yapmak tear down ile söylenir.

Diğer şıklar: **A** hand in (teslim etmek) / **B** sit down (oturmak) / **C** lay off (işten çıkarmak) / **D** pick up (toplamak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$After hours of discussion, the committee reached a ---- that the old building should be preserved, and nobody voted against it.$q$, array[$o$departure$o$, $o$complaint$o$, $o$rumour$o$, $o$consensus$o$, $o$refund$o$], 3, $e$1. Boşluğa **consensus** (uzlaşı) gelir. Kimsenin karşı oy kullanmadığı ortak karar uzlaşıdır.

Diğer şıklar: **A** departure (ayrılış) / **B** complaint (şikâyet) / **C** rumour (söylenti) / **E** refund (iade).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Travellers should be ---- of strangers who offer to carry their bags, since some of them may be thieves.$q$, array[$o$wary$o$, $o$fond$o$, $o$proud$o$, $o$tired$o$, $o$capable$o$], 0, $e$1. Boşluğa **wary** (temkinli) gelir. Hırsız olabilecek yabancılara karşı temkinli olmak gerekir.

Diğer şıklar: **B** fond (düşkün) / **C** proud (gururlu) / **D** tired (yorgun) / **E** capable (yetenekli).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The journalists pursued the minister ----, asking the same question again and again until he finally agreed to answer.$q$, array[$o$lightly$o$, $o$politely$o$, $o$relentlessly$o$, $o$casually$o$, $o$lazily$o$], 2, $e$1. Boşluğa **relentlessly** (amansızca) gelir. Aynı soruyu tekrar tekrar sormak amansız bir takiptir.

Diğer şıklar: **A** lightly (hafifçe) / **B** politely (kibarca) / **D** casually (gelişigüzel) / **E** lazily (tembelce).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Fast-food restaurants have begun to ---- in the city centre, and now there are more than fifty of them within a kilometre.$q$, array[$o$evaporate$o$, $o$proliferate$o$, $o$hesitate$o$, $o$dwindle$o$, $o$retreat$o$], 1, $e$1. Boşluğa **proliferate** (hızla çoğalmak) gelir. Bir kilometrede elliden fazla olması hızla çoğalmayı gösterir.

Diğer şıklar: **A** evaporate (buharlaşmak) / **C** hesitate (tereddüt etmek) / **D** dwindle (azalmak) / **E** retreat (geri çekilmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The lecturer only ---- the subject of climate change briefly, since most of the lesson was about the history of energy.$q$, array[$o$touched on$o$, $o$went off$o$, $o$put out$o$, $o$came round$o$, $o$dropped by$o$], 0, $e$1. Boşluğa **touched on** (değinmek) gelir. Konuya kısaca değinmek touch on ile söylenir.

Diğer şıklar: **B** went off (bozulmak) / **C** put out (söndürmek) / **D** came round (ayılmak) / **E** dropped by (uğramak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$It is a ---- that the more connected we are through social media, the lonelier many of us feel in our everyday lives.$q$, array[$o$precaution$o$, $o$syllable$o$, $o$forecast$o$, $o$retreat$o$, $o$paradox$o$], 4, $e$1. Boşluğa **paradox** (paradoks) gelir. Bağlantı arttıkça yalnızlığın artması çelişkili bir durumdur.

Diğer şıklar: **A** precaution (önlem) / **B** syllable (hece) / **C** forecast (tahmin) / **D** retreat (geri çekilme).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Wearing a helmet is ---- for all cyclists in the city, and anyone caught without one has to pay a fine.$q$, array[$o$optional$o$, $o$unlikely$o$, $o$mandatory$o$, $o$unnecessary$o$, $o$wasteful$o$], 2, $e$1. Boşluğa **mandatory** (zorunlu) gelir. Kasksız yakalananın ceza ödemesi kask zorunluluğunu gösterir.

Diğer şıklar: **A** optional (isteğe bağlı) / **B** unlikely (olası olmayan) / **D** unnecessary (gereksiz) / **E** wasteful (savurgan).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$The restorers ---- cleaned the ancient painting with tiny brushes, spending three years on a surface smaller than a door.$q$, array[$o$hastily$o$, $o$carelessly$o$, $o$roughly$o$, $o$painstakingly$o$, $o$lazily$o$], 3, $e$1. Boşluğa **painstakingly** (büyük bir titizlikle) gelir. Küçük bir yüzeye üç yıl harcamak çok titiz bir çalışmadır.

Diğer şıklar: **A** hastily (aceleyle) / **B** carelessly (dikkatsizce) / **C** roughly (kabaca) / **E** lazily (tembelce).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Farmers must ---- the soil with natural fertilisers after each harvest, otherwise the crops will gradually become weaker.$q$, array[$o$pollute$o$, $o$replenish$o$, $o$abandon$o$, $o$exhaust$o$, $o$neglect$o$], 1, $e$1. Boşluğa **replenish** (yenilemek) gelir. Toprağı gübreyle yeniden doldurmak replenish ile söylenir.

Diğer şıklar: **A** pollute (kirletmek) / **C** abandon (terk etmek) / **D** exhaust (tüketmek) / **E** neglect (ihmal etmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The doctors were not sure whether the patient would ----, but after a week in intensive care he began to improve.$q$, array[$o$pull through$o$, $o$run out$o$, $o$back off$o$, $o$break in$o$, $o$sign up$o$], 0, $e$1. Boşluğa **pull through** (atlatmak) gelir. Yoğun bakımdan sonra düzelen hasta atlatmıştır.

Diğer şıklar: **B** run out (tükenmek) / **C** back off (geri çekilmek) / **D** break in (zorla girmek) / **E** sign up (kaydolmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Farmers receive a government ---- for every tonne of wheat they grow, which helps them to survive when world prices fall.$q$, array[$o$penalty$o$, $o$sermon$o$, $o$hazard$o$, $o$refugee$o$, $o$subsidy$o$], 4, $e$1. Boşluğa **subsidy** (sübvansiyon) gelir. Fiyatlar düşünce çiftçiyi koruyan devlet desteği sübvansiyondur.

Diğer şıklar: **A** penalty (ceza) / **B** sermon (vaaz) / **C** hazard (tehlike) / **D** refugee (mülteci).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The lawyer presented a ---- argument that convinced even the most sceptical members of the jury.$q$, array[$o$feeble$o$, $o$hesitant$o$, $o$trivial$o$, $o$compelling$o$, $o$vacant$o$], 3, $e$1. Boşluğa **compelling** (ikna edici) gelir. En kuşkucu jüriyi bile ikna eden argüman ikna edicidir.

Diğer şıklar: **A** feeble (zayıf) / **B** hesitant (tereddütlü) / **C** trivial (önemsiz) / **E** vacant (boş).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The crowd began to sing ---- when the national team scored, and soon the whole stadium joined in without anyone leading.$q$, array[$o$deliberately$o$, $o$reluctantly$o$, $o$spontaneously$o$, $o$formally$o$, $o$officially$o$], 2, $e$1. Boşluğa **spontaneously** (kendiliğinden) gelir. Kimse yönetmeden şarkıya başlamak kendiliğindendir.

Diğer şıklar: **A** deliberately (kasten) / **B** reluctantly (isteksizce) / **D** formally (resmen) / **E** officially (resmen).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The company promised to ---- the error immediately and to send a corrected invoice to all its customers.$q$, array[$o$repeat$o$, $o$ignore$o$, $o$excuse$o$, $o$defend$o$, $o$rectify$o$], 4, $e$1. Boşluğa **rectify** (düzeltmek) gelir. Düzeltilmiş fatura göndermek hatayı düzeltmektir.

Diğer şıklar: **A** repeat (tekrar etmek) / **B** ignore (görmezden gelmek) / **C** excuse (mazur görmek) / **D** defend (savunmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Nobody believed that the small team could win the championship, but they managed to ---- an incredible victory in the final minute.$q$, array[$o$set up$o$, $o$pull off$o$, $o$hold back$o$, $o$run into$o$, $o$dig up$o$], 1, $e$1. Boşluğa **pull off** (başarmak) gelir. İnanılmaz bir galibiyeti başarmak pull off ile söylenir.

Diğer şıklar: **A** set up (kurmak) / **C** hold back (engellemek) / **D** run into (rastlamak) / **E** dig up (ortaya çıkarmak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

