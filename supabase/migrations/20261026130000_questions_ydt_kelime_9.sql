-- 20261026130000_questions_ydt_kelime_9. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 46
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 46$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Modern ---- relies increasingly on drones and computers, and a single operator can now control a weapon thousands of kilometres away.$q$, array[$o$warfare$o$, $o$hospitality$o$, $o$vocabulary$o$, $o$rehearsal$o$, $o$recreation$o$], 0, $e$1. Boşluğa **warfare** (savaş) gelir. Silah ve dronlarla yürütülen savaş biçimi warfare'dir.

Diğer şıklar: **B** hospitality (konukseverlik) / **C** vocabulary (kelime hazinesi) / **D** rehearsal (prova) / **E** recreation (eğlence).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The restorer used tiny brushes for this ---- work, because a single wrong movement could destroy the fragile painting.$q$, array[$o$rough$o$, $o$brutal$o$, $o$delicate$o$, $o$careless$o$, $o$rigid$o$], 2, $e$1. Boşluğa **delicate** (hassas) gelir. Tek hatalı hareketin tabloyu bozabileceği iş hassastır.

Diğer şıklar: **A** rough (kaba) / **B** brutal (acımasız) / **D** careless (dikkatsiz) / **E** rigid (katı).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The lawyer spoke ---- for two hours, and by the end of his speech even his opponents were nodding in agreement.$q$, array[$o$clumsily$o$, $o$hesitantly$o$, $o$flatly$o$, $o$eloquently$o$, $o$briefly$o$], 3, $e$1. Boşluğa **eloquently** (etkili ve güzel) gelir. Rakiplerini bile ikna eden konuşma belagatlidir.

Diğer şıklar: **A** clumsily (beceriksizce) / **B** hesitantly (tereddütle) / **C** flatly (düz biçimde) / **E** briefly (kısaca).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Cutting down the forests may ---- the survival of many rare animals, which depend on the trees for food and shelter.$q$, array[$o$guarantee$o$, $o$secure$o$, $o$protect$o$, $o$ensure$o$, $o$jeopardise$o$], 4, $e$1. Boşluğa **jeopardise** (tehlikeye atmak) gelir. Ağaçlara bağımlı hayvanların hayatta kalmasını riske atmak jeopardise ile söylenir.

Diğer şıklar: **A** guarantee (garanti etmek) / **B** secure (güvence altına almak) / **C** protect (korumak) / **D** ensure (sağlamak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$Try not to ---- past mistakes, because it is better to learn from them and to look forward to the future.$q$, array[$o$pick on$o$, $o$hold on$o$, $o$dwell on$o$, $o$carry on$o$, $o$give on$o$], 2, $e$1. Boşluğa **dwell on** (takılıp kalmak) gelir. Geçmiş hatalarda takılıp kalmamak dwell on ile söylenir.

Diğer şıklar: **A** pick on (sataşmak) / **B** hold on (tutunmak) / **D** carry on (sürdürmek) / **E** give on (vermek).$e$, 3),
  (6, 'ydt-dil', null::integer, $q$He caught only a brief ---- of the famous actor through the crowd before the car drove away at high speed.$q$, array[$o$rumour$o$, $o$glimpse$o$, $o$pledge$o$, $o$refund$o$, $o$tribute$o$], 1, $e$1. Boşluğa **glimpse** (bir anlık görüntü) gelir. Kalabalık arasından kısa bir an görmek glimpse'tır.

Diğer şıklar: **A** rumour (söylenti) / **C** pledge (söz) / **D** refund (iade) / **E** tribute (saygı gösterisi).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$The team faced a ---- opponent: the champions had won every match for two years and had not conceded a goal.$q$, array[$o$feeble$o$, $o$harmless$o$, $o$negligible$o$, $o$mediocre$o$, $o$formidable$o$], 4, $e$1. Boşluğa **formidable** (çetin) gelir. İki yıldır yenilmeyen rakip çetin bir rakiptir.

Diğer şıklar: **A** feeble (zayıf) / **B** harmless (zararsız) / **C** negligible (önemsiz) / **D** mediocre (vasat).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The mother searched ---- for her lost child in the crowded market, calling his name and asking everyone she met.$q$, array[$o$calmly$o$, $o$leisurely$o$, $o$frantically$o$, $o$casually$o$, $o$lightly$o$], 2, $e$1. Boşluğa **frantically** (çılgınca) gelir. Herkese soran ve bağıran anne çılgınca arar.

Diğer şıklar: **A** calmly (sakince) / **B** leisurely (ağır ağır) / **D** casually (gelişigüzel) / **E** lightly (hafifçe).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The young player hopes to ---- the record set by his father, who scored fifty goals in a single season.$q$, array[$o$avoid$o$, $o$forgive$o$, $o$mention$o$, $o$surpass$o$, $o$drag$o$], 3, $e$1. Boşluğa **surpass** (aşmak) gelir. Babasının rekorunu geçmek surpass ile söylenir.

Diğer şıklar: **A** avoid (kaçınmak) / **B** forgive (affetmek) / **C** mention (değinmek) / **E** drag (sürüklemek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$It is time for the government to ---- the fact that the economy is not growing as quickly as it had promised.$q$, array[$o$run out of$o$, $o$face up to$o$, $o$look out for$o$, $o$put up with$o$, $o$go along with$o$], 1, $e$1. Boşluğa **face up to** (kabullenmek) gelir. Gerçeği kabullenmek face up to ile söylenir.

Diğer şıklar: **A** run out of (tükenmek) / **C** look out for (dikkat etmek) / **D** put up with (katlanmak) / **E** go along with (uymak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Each country has a fixed ---- for the number of fish it may catch each year, in order to protect the sea from overfishing.$q$, array[$o$quota$o$, $o$souvenir$o$, $o$penalty$o$, $o$fabric$o$, $o$rebate$o$], 0, $e$1. Boşluğa **quota** (kota) gelir. Yıllık avlanabilecek balık sayısı için belirlenen sınır kotadır.

Diğer şıklar: **B** souvenir (hatıra) / **C** penalty (ceza) / **D** fabric (kumaş) / **E** rebate (indirim).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$An ---- crowd, estimated at more than a million people, gathered in the square to welcome the returning heroes.$q$, array[$o$ordinary$o$, $o$occasional$o$, $o$elderly$o$, $o$obscure$o$, $o$immense$o$], 4, $e$1. Boşluğa **immense** (muazzam) gelir. Bir milyonu aşan kalabalık muazzamdır.

Diğer şıklar: **A** ordinary (sıradan) / **B** occasional (ara sıra) / **C** elderly (yaşlı) / **D** obscure (belirsiz).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$He ---- decided to save part of his salary every month, and years later this habit helped him to buy his own house.$q$, array[$o$hardly$o$, $o$loudly$o$, $o$suddenly$o$, $o$wisely$o$, $o$rudely$o$], 3, $e$1. Boşluğa **wisely** (akıllıca) gelir. Yıllar sonra ev aldıran karar akıllıcadır.

Diğer şıklar: **A** hardly (zar zor) / **B** loudly (yüksek sesle) / **C** suddenly (aniden) / **E** rudely (kabaca).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$The government has promised to ---- the problem of unemployment by creating new jobs in the construction industry.$q$, array[$o$tackle$o$, $o$ignore$o$, $o$conceal$o$, $o$admire$o$, $o$invent$o$], 0, $e$1. Boşluğa **tackle** (ele almak) gelir. Yeni iş yaratarak sorunla başa çıkmak tackle ile söylenir.

Diğer şıklar: **B** ignore (görmezden gelmek) / **C** conceal (gizlemek) / **D** admire (hayran olmak) / **E** invent (icat etmek).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Let us stop talking about the problem and ---- the work, because we have only two days left before the deadline.$q$, array[$o$look forward to$o$, $o$cut down on$o$, $o$get on with$o$, $o$run out of$o$, $o$fall back on$o$], 2, $e$1. Boşluğa **get on with** (sürdürmek) gelir. Konuşmayı bırakıp işe devam etmek get on with ile söylenir.

Diğer şıklar: **A** look forward to (sabırsızlıkla beklemek) / **B** cut down on (azaltmak) / **D** run out of (tükenmek) / **E** fall back on (başvurmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The discovery of gold gave a new ---- to the economy of the region, and thousands of workers moved there within a few years.$q$, array[$o$hindrance$o$, $o$impetus$o$, $o$delay$o$, $o$tension$o$, $o$drought$o$], 1, $e$1. Boşluğa **impetus** (ivme) gelir. Binlerce işçiyi çeken keşif ekonomiye ivme kazandırır.

Diğer şıklar: **A** hindrance (engel) / **C** delay (gecikme) / **D** tension (gerilim) / **E** drought (kuraklık).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She was so ---- that she gave her bank details to a stranger who phoned her and promised to double her money.$q$, array[$o$cautious$o$, $o$sceptical$o$, $o$experienced$o$, $o$naive$o$, $o$realistic$o$], 3, $e$1. Boşluğa **naive** (saf) gelir. Yabancıya banka bilgisini veren kişi safdildir.

Diğer şıklar: **A** cautious (temkinli) / **B** sceptical (kuşkucu) / **C** experienced (deneyimli) / **E** realistic (gerçekçi).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The old farmer ---- rejected every offer for his land, even when the company offered him ten times its real value.$q$, array[$o$gladly$o$, $o$willingly$o$, $o$easily$o$, $o$eagerly$o$, $o$adamantly$o$], 4, $e$1. Boşluğa **adamantly** (kararlılıkla) gelir. On katı fiyata bile reddetmek kararlılıkla reddetmektir.

Diğer şıklar: **A** gladly (memnuniyetle) / **B** willingly (isteyerek) / **C** easily (kolayca) / **D** eagerly (hevesle).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Older residents often ---- the loss of traditional shops, which have been replaced by big supermarkets and shopping centres.$q$, array[$o$celebrate$o$, $o$lament$o$, $o$advertise$o$, $o$copy$o$, $o$organise$o$], 1, $e$1. Boşluğa **lament** (yakınmak) gelir. Geleneksel dükkânların kaybına üzülmek lament ile söylenir.

Diğer şıklar: **A** celebrate (kutlamak) / **C** advertise (reklam yapmak) / **D** copy (kopyalamak) / **E** organise (düzenlemek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He was a clever man, but he ---- the trick and gave the stranger all his savings, as thousands of others had done before him.$q$, array[$o$fell for$o$, $o$ran into$o$, $o$dropped by$o$, $o$worked out$o$, $o$turned over$o$], 0, $e$1. Boşluğa **fell for** (kanmak) gelir. Hileye kanıp birikimini vermek fall for ile söylenir.

Diğer şıklar: **B** ran into (rastlamak) / **C** dropped by (uğramak) / **D** worked out (çözmek) / **E** turned over (çevirmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 47
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 47$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Honesty is a ---- that most people admire in others, and it is often considered more important than intelligence or wealth.$q$, array[$o$bargain$o$, $o$vacancy$o$, $o$trait$o$, $o$fraction$o$, $o$fabric$o$], 2, $e$1. Boşluğa **trait** (özellik) gelir. Başkalarında beğenilen kişilik özelliği trait ile söylenir.

Diğer şıklar: **A** bargain (pazarlık) / **B** vacancy (boş kadro) / **D** fraction (kesir) / **E** fabric (kumaş).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Scientists regard the claim as ----, since it has never been tested and is based on a single unreliable source.$q$, array[$o$dubious$o$, $o$convincing$o$, $o$evident$o$, $o$proven$o$, $o$sound$o$], 0, $e$1. Boşluğa **dubious** (şüpheli) gelir. Hiç sınanmamış ve tek güvenilmez kaynağa dayanan iddia şüphelidir.

Diğer şıklar: **B** convincing (inandırıcı) / **C** evident (açık) / **D** proven (kanıtlanmış) / **E** sound (sağlam).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The president ---- admitted that his government had made mistakes, and promised to correct them within six months.$q$, array[$o$secretly$o$, $o$barely$o$, $o$hardly$o$, $o$openly$o$, $o$vaguely$o$], 3, $e$1. Boşluğa **openly** (açıkça) gelir. Hataları herkesin önünde kabul etmek açıkça kabul etmektir.

Diğer şıklar: **A** secretly (gizlice) / **B** barely (zar zor) / **C** hardly (neredeyse hiç) / **E** vaguely (belirsizce).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The date of the festival happens to ---- with the national holiday, so many people will be able to attend.$q$, array[$o$disagree$o$, $o$depart$o$, $o$advance$o$, $o$resign$o$, $o$coincide$o$], 4, $e$1. Boşluğa **coincide** (çakışmak) gelir. Bayramla aynı güne denk gelmek coincide ile söylenir.

Diğer şıklar: **A** disagree (aynı fikirde olmamak) / **B** depart (ayrılmak) / **C** advance (ilerlemek) / **D** resign (istifa etmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The old building was ---- by workers in a controlled explosion lasting only a few seconds, and nothing remained but dust.$q$, array[$o$put up$o$, $o$blown up$o$, $o$held up$o$, $o$set up$o$, $o$lined up$o$], 1, $e$1. Boşluğa **blown up** (patlatıldı) gelir. Kontrollü patlamayla yıkılan bina blow up ile söylenir.

Diğer şıklar: **A** put up (dikildi) / **C** held up (geciktirildi) / **D** set up (kuruldu) / **E** lined up (sıraya dizildi).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Winning the national championship was an important ---- in the young swimmer's career, and it opened the door to international competitions.$q$, array[$o$restriction$o$, $o$rebate$o$, $o$milestone$o$, $o$failure$o$, $o$disguise$o$], 2, $e$1. Boşluğa **milestone** (dönüm noktası) gelir. Uluslararası yarışlara kapı açan başarı bir dönüm noktasıdır.

Diğer şıklar: **A** restriction (kısıtlama) / **B** rebate (indirim) / **D** failure (başarısızlık) / **E** disguise (kılık).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The talks between the two leaders were ----, and they signed three agreements on trade, energy and education.$q$, array[$o$fruitful$o$, $o$fruitless$o$, $o$hostile$o$, $o$tedious$o$, $o$vague$o$], 0, $e$1. Boşluğa **fruitful** (verimli) gelir. Üç anlaşma imzalanan görüşme verimlidir.

Diğer şıklar: **B** fruitless (sonuçsuz) / **C** hostile (düşmanca) / **D** tedious (sıkıcı) / **E** vague (belirsiz).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$She held the child's hand ---- as they crossed the busy street, afraid that he might run into the traffic.$q$, array[$o$loosely$o$, $o$lazily$o$, $o$politely$o$, $o$tightly$o$, $o$rarely$o$], 3, $e$1. Boşluğa **tightly** (sıkıca) gelir. Trafiğe koşmasından korkan kişi eli sıkı tutar.

Diğer şıklar: **A** loosely (gevşekçe) / **B** lazily (tembelce) / **C** politely (kibarca) / **E** rarely (nadiren).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$The government decided to ---- more money to the health service, which had been short of doctors and equipment for years.$q$, array[$o$withdraw$o$, $o$allocate$o$, $o$borrow$o$, $o$waste$o$, $o$deposit$o$], 1, $e$1. Boşluğa **allocate** (ayırmak) gelir. Doktor ve ekipman eksikliği için pay ayırmak allocate ile söylenir.

Diğer şıklar: **A** withdraw (çekmek) / **C** borrow (ödünç almak) / **D** waste (israf etmek) / **E** deposit (yatırmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The two companies still need to ---- a few small disagreements before the merger can be officially announced next month.$q$, array[$o$hold up$o$, $o$call in$o$, $o$draw on$o$, $o$step in$o$, $o$iron out$o$], 4, $e$1. Boşluğa **iron out** (gidermek) gelir. Küçük anlaşmazlıkları gidermek iron out ile söylenir.

Diğer şıklar: **A** hold up (geciktirmek) / **B** call in (çağırmak) / **C** draw on (yararlanmak) / **D** step in (araya girmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The plan to close the local hospital caused a public ----, with thousands of residents writing letters and joining demonstrations.$q$, array[$o$harvest$o$, $o$rehearsal$o$, $o$refund$o$, $o$outcry$o$, $o$ceremony$o$], 3, $e$1. Boşluğa **outcry** (tepki) gelir. Mektup yazan ve gösteriye katılan halkın tepkisi bir infialdir.

Diğer şıklar: **A** harvest (hasat) / **B** rehearsal (prova) / **C** refund (iade) / **E** ceremony (tören).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$There was a ---- smell in the kitchen, and nobody could say whether it was coming from the fridge or from the old pipes.$q$, array[$o$familiar$o$, $o$pleasant$o$, $o$peculiar$o$, $o$identical$o$, $o$ordinary$o$], 2, $e$1. Boşluğa **peculiar** (tuhaf) gelir. Kaynağı bilinmeyen koku tuhaftır.

Diğer şıklar: **A** familiar (tanıdık) / **B** pleasant (hoş) / **D** identical (aynı) / **E** ordinary (sıradan).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$When the manager criticised his report, he answered ----, explaining that other people were responsible for the errors.$q$, array[$o$defensively$o$, $o$eagerly$o$, $o$calmly$o$, $o$gratefully$o$, $o$cheerfully$o$], 0, $e$1. Boşluğa **defensively** (savunmacı biçimde) gelir. Hataları başkalarına yüklemek savunmacı bir cevaptır.

Diğer şıklar: **B** eagerly (hevesle) / **C** calmly (sakince) / **D** gratefully (minnetle) / **E** cheerfully (neşeyle).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The members of the committee will ---- on Monday morning to discuss the proposal and to vote on the final budget.$q$, array[$o$confess$o$, $o$convene$o$, $o$depart$o$, $o$dwindle$o$, $o$retreat$o$], 1, $e$1. Boşluğa **convene** (toplanmak) gelir. Pazartesi sabahı görüşmek için toplanmak convene ile söylenir.

Diğer şıklar: **A** confess (itiraf etmek) / **C** depart (ayrılmak) / **D** dwindle (azalmak) / **E** retreat (geri çekilmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The government decided to ---- the failing bank with public money, fearing that its collapse would destroy thousands of small savings.$q$, array[$o$blow over$o$, $o$tie up$o$, $o$sit out$o$, $o$wind up$o$, $o$bail out$o$], 4, $e$1. Boşluğa **bail out** (kurtarmak) gelir. Çöküşü önlemek için bankayı kurtarmak bail out ile söylenir.

Diğer şıklar: **A** blow over (yatışmak) / **B** tie up (bağlamak) / **C** sit out (beklemek) / **D** wind up (sonunda ... olmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The small island became a ---- for artists who wanted to escape the noise of the city and work in peace and quiet.$q$, array[$o$haven$o$, $o$hazard$o$, $o$barrier$o$, $o$penalty$o$, $o$dispute$o$], 0, $e$1. Boşluğa **haven** (sığınak) gelir. Gürültüden kaçıp sakin çalışmak isteyenler için ada bir sığınaktır.

Diğer şıklar: **B** hazard (tehlike) / **C** barrier (engel) / **D** penalty (ceza) / **E** dispute (anlaşmazlık).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The city is famous for being ---- of different religions, and people of many faiths have lived together there for centuries.$q$, array[$o$suspicious$o$, $o$tolerant$o$, $o$afraid$o$, $o$critical$o$, $o$jealous$o$], 1, $e$1. Boşluğa **tolerant** (hoşgörülü) gelir. Farklı inançların asırlarca birlikte yaşaması hoşgörünün göstergesidir.

Diğer şıklar: **A** suspicious (şüpheci) / **C** afraid (korkak) / **D** critical (eleştirel) / **E** jealous (kıskanç).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$He ---- bought a motorbike on the way home from work, and when he arrived his wife asked him where he was going to put it.$q$, array[$o$carefully$o$, $o$gradually$o$, $o$reluctantly$o$, $o$sensibly$o$, $o$impulsively$o$], 4, $e$1. Boşluğa **impulsively** (ani bir dürtüyle) gelir. Nereye koyacağını bile düşünmeden almak dürtüsel davranıştır.

Diğer şıklar: **A** carefully (dikkatle) / **B** gradually (giderek) / **C** reluctantly (isteksizce) / **D** sensibly (makul biçimde).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Share prices began to ---- when the company announced that it had lost millions of pounds during the first three months of the year.$q$, array[$o$ascend$o$, $o$recover$o$, $o$plunge$o$, $o$stabilise$o$, $o$advance$o$], 2, $e$1. Boşluğa **plunge** (sert düşmek) gelir. Milyonlarca sterlin zarar açıklanınca hisse fiyatları sert düşer.

Diğer şıklar: **A** ascend (yükselmek) / **B** recover (toparlanmak) / **D** stabilise (sabitlenmek) / **E** advance (ilerlemek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$After the long investigation, the police were forced to ---- the documents to the court, where the judge will decide what to do.$q$, array[$o$hold on$o$, $o$set off$o$, $o$turn up$o$, $o$hand over$o$, $o$step in$o$], 3, $e$1. Boşluğa **hand over** (teslim etmek) gelir. Belgeleri mahkemeye teslim etmek hand over ile söylenir.

Diğer şıklar: **A** hold on (tutunmak) / **B** set off (yola çıkmak) / **C** turn up (ortaya çıkmak) / **E** step in (araya girmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 48
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 48$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- between the two brothers lasted for decades, and they refused to speak to each other even at their mother's funeral.$q$, array[$o$bond$o$, $o$alliance$o$, $o$feud$o$, $o$reunion$o$, $o$courtesy$o$], 2, $e$1. Boşluğa **feud** (husumet) gelir. Onlarca yıl konuşmamak süregelen bir husumeti gösterir.

Diğer şıklar: **A** bond (bağ) / **B** alliance (ittifak) / **D** reunion (buluşma) / **E** courtesy (nezaket).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The scientist was ---- in her belief that the results were correct, even when all her colleagues argued against her.$q$, array[$o$hesitant$o$, $o$indifferent$o$, $o$fragile$o$, $o$steadfast$o$, $o$reluctant$o$], 3, $e$1. Boşluğa **steadfast** (kararlı) gelir. Herkes karşı çıksa bile inancından vazgeçmemek kararlılıktır.

Diğer şıklar: **A** hesitant (tereddütlü) / **B** indifferent (ilgisiz) / **C** fragile (kırılgan) / **E** reluctant (isteksiz).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The proposal was ---- rejected by voters, with more than ninety percent of them voting against it.$q$, array[$o$overwhelmingly$o$, $o$narrowly$o$, $o$slightly$o$, $o$rarely$o$, $o$partly$o$], 0, $e$1. Boşluğa **overwhelmingly** (ezici çoğunlukla) gelir. Yüzde doksandan fazla ret oyu ezici çoğunluktur.

Diğer şıklar: **B** narrowly (dar farkla) / **C** slightly (hafifçe) / **D** rarely (nadiren) / **E** partly (kısmen).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The new law is intended to ---- people from using their phones while they are driving, and offenders will pay a heavy fine.$q$, array[$o$entitle$o$, $o$persuade$o$, $o$dissuade$o$, $o$encourage$o$, $o$oblige$o$], 2, $e$1. Boşluğa **dissuade** (caydırmak) gelir. Ağır para cezası insanları telefon kullanmaktan caydırmak içindir.

Diğer şıklar: **A** entitle (hak vermek) / **B** persuade (ikna etmek) / **D** encourage (teşvik etmek) / **E** oblige (zorunlu kılmak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The plan to build a new stadium has ----, because the investors withdrew their money at the last minute.$q$, array[$o$taken over$o$, $o$broken out$o$, $o$set up$o$, $o$carried on$o$, $o$fallen through$o$], 4, $e$1. Boşluğa **fallen through** (suya düştü) gelir. Yatırımcıların çekilmesiyle planın suya düşmesi fall through ile söylenir.

Diğer şıklar: **A** taken over (devralındı) / **B** broken out (patlak verdi) / **C** set up (kuruldu) / **D** carried on (sürdürüldü).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The company offered a generous ---- to employees who agreed to leave their jobs voluntarily before the end of the year.$q$, array[$o$premium$o$, $o$severance$o$, $o$tuition$o$, $o$warranty$o$, $o$mortgage$o$], 1, $e$1. Boşluğa **severance** (kıdem tazminatı) gelir. İşten gönüllü ayrılanlara verilen ödeme tazminattır.

Diğer şıklar: **A** premium (prim) / **C** tuition (öğrenim ücreti) / **D** warranty (garanti) / **E** mortgage (ipotek).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The glasses are extremely ----, so the delivery company asked us to pack them in several layers of paper.$q$, array[$o$sturdy$o$, $o$bulky$o$, $o$durable$o$, $o$fragile$o$, $o$transparent$o$], 3, $e$1. Boşluğa **fragile** (kırılgan) gelir. Kağıtla sarmayı gerektiren cam bardaklar kırılgandır.

Diğer şıklar: **A** sturdy (sağlam) / **B** bulky (hantal) / **C** durable (dayanıklı) / **E** transparent (şeffaf).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The two teams ---- competed for the title, and the winner was decided only in the last minute of the final.$q$, array[$o$fiercely$o$, $o$gently$o$, $o$casually$o$, $o$calmly$o$, $o$shyly$o$], 0, $e$1. Boşluğa **fiercely** (çetin biçimde) gelir. Son dakikaya kadar süren mücadele çetin bir rekabettir.

Diğer şıklar: **B** gently (nazikçe) / **C** casually (gelişigüzel) / **D** calmly (sakince) / **E** shyly (utangaçça).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The teacher tried to ---- the shy boy to take part in the school play, but he was too frightened to say yes.$q$, array[$o$compel$o$, $o$dismiss$o$, $o$interrupt$o$, $o$neglect$o$, $o$coax$o$], 4, $e$1. Boşluğa **coax** (ikna etmeye çalışmak) gelir. Çekingen çocuğu nazikçe yönlendirmeye çalışmak coax ile söylenir.

Diğer şıklar: **A** compel (zorlamak) / **B** dismiss (reddetmek) / **C** interrupt (bölmek) / **D** neglect (ihmal etmek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The shopkeeper decided to ---- the old stock at half price in order to make room for the new season's clothes.$q$, array[$o$fill in$o$, $o$sign up$o$, $o$pull in$o$, $o$dispose of$o$, $o$look up$o$], 3, $e$1. Boşluğa **dispose of** (elden çıkarmak) gelir. Eski malları yarı fiyatına elden çıkarmak dispose of ile söylenir.

Diğer şıklar: **A** fill in (doldurmak) / **B** sign up (kaydolmak) / **C** pull in (yanaşmak) / **E** look up (araştırmak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Doctors warned that the ---- of the disease could be much faster in older patients who have weak immune systems.$q$, array[$o$prevention$o$, $o$progression$o$, $o$possession$o$, $o$precision$o$, $o$persuasion$o$], 1, $e$1. Boşluğa **progression** (ilerleyiş) gelir. Hastalığın yaşlılarda hızlanması ilerleyişle ilgilidir.

Diğer şıklar: **A** prevention (önleme) / **C** possession (sahiplik) / **D** precision (kesinlik) / **E** persuasion (ikna).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Having grown up in poverty, she remained ---- all her life and never spent money on things she did not need.$q$, array[$o$extravagant$o$, $o$generous$o$, $o$frugal$o$, $o$selfish$o$, $o$ambitious$o$], 2, $e$1. Boşluğa **frugal** (tutumlu) gelir. Gereksiz harcama yapmamak tutumlu olmaktır.

Diğer şıklar: **A** extravagant (savurgan) / **B** generous (cömert) / **D** selfish (bencil) / **E** ambitious (hırslı).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The wealthy family ---- decorated the hall with flowers and gold for the wedding, spending more than a hundred thousand dollars.$q$, array[$o$sparingly$o$, $o$barely$o$, $o$plainly$o$, $o$rarely$o$, $o$lavishly$o$], 4, $e$1. Boşluğa **lavishly** (cömertçe) gelir. Yüz binden fazla harcamak görkemli ve cömert süslemedir.

Diğer şıklar: **A** sparingly (idareli biçimde) / **B** barely (zar zor) / **C** plainly (sade biçimde) / **D** rarely (nadiren).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Archaeologists were able to ---- the age of the bones by measuring the amount of carbon that was left in them.$q$, array[$o$abandon$o$, $o$determine$o$, $o$exaggerate$o$, $o$defend$o$, $o$impose$o$], 1, $e$1. Boşluğa **determine** (belirlemek) gelir. Karbon miktarını ölçerek yaşı belirlemek determine ile söylenir.

Diğer şıklar: **A** abandon (terk etmek) / **C** exaggerate (abartmak) / **D** defend (savunmak) / **E** impose (dayatmak).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$The footballer tried to ---- the injury as a minor problem, but the doctors insisted that he should rest for a month.$q$, array[$o$shrug off$o$, $o$take up$o$, $o$hold up$o$, $o$call for$o$, $o$fill out$o$], 0, $e$1. Boşluğa **shrug off** (hafife almak) gelir. Sakatlığı küçük bir sorunmuş gibi göstermek shrug off ile söylenir.

Diğer şıklar: **B** take up (başlamak) / **C** hold up (geciktirmek) / **D** call for (gerektirmek) / **E** fill out (doldurmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$A small ---- of students refused to take part in the protest, saying they preferred to continue their studies.$q$, array[$o$majority$o$, $o$spectrum$o$, $o$fortune$o$, $o$minority$o$, $o$bulk$o$], 3, $e$1. Boşluğa **minority** (azınlık) gelir. Katılmayı reddeden küçük bir grup azınlıktır.

Diğer şıklar: **A** majority (çoğunluk) / **B** spectrum (yelpaze) / **C** fortune (servet) / **E** bulk (yığın).$e$, 1),
  (17, 'ydt-dil', null::integer, $q$He made a ---- remark about her cooking in front of the guests, and she was too embarrassed to say anything in reply.$q$, array[$o$thoughtful$o$, $o$humble$o$, $o$diplomatic$o$, $o$sincere$o$, $o$tactless$o$], 4, $e$1. Boşluğa **tactless** (patavatsız) gelir. Misafirlerin önünde utandıran söz patavatsızdır.

Diğer şıklar: **A** thoughtful (düşünceli) / **B** humble (alçakgönüllü) / **C** diplomatic (diplomatik) / **D** sincere (samimi).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$He complained ---- about the way he had been treated by the committee, and he said that he deserved an apology.$q$, array[$o$bitterly$o$, $o$gratefully$o$, $o$cheerfully$o$, $o$casually$o$, $o$eventually$o$], 0, $e$1. Boşluğa **bitterly** (acı acı) gelir. Özür hak ettiğini söylemek acı bir yakınmayı gösterir.

Diğer şıklar: **B** gratefully (minnetle) / **C** cheerfully (neşeyle) / **D** casually (umursamazca) / **E** eventually (sonunda).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The old bridge was so weak that it began to ---- under the weight of the heavy trucks, and it was closed to traffic.$q$, array[$o$expand$o$, $o$blossom$o$, $o$crumble$o$, $o$hesitate$o$, $o$glow$o$], 2, $e$1. Boşluğa **crumble** (ufalanmak) gelir. Ağır kamyonlar altında zayıf köprü ufalanmaya başlar.

Diğer şıklar: **A** expand (genişlemek) / **B** blossom (çiçek açmak) / **D** hesitate (tereddüt etmek) / **E** glow (parlamak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The school decided to ---- the traditional exams and to replace them with project work throughout the year.$q$, array[$o$go along with$o$, $o$do away with$o$, $o$keep up with$o$, $o$look down on$o$, $o$make up for$o$], 1, $e$1. Boşluğa **do away with** (ortadan kaldırmak) gelir. Geleneksel sınavları kaldırıp yerine proje koymak do away with ile söylenir.

Diğer şıklar: **A** go along with (uyum sağlamak) / **C** keep up with (ayak uydurmak) / **D** look down on (küçümsemek) / **E** make up for (telafi etmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 49
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 49$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- of the old king was so great that his son spent his whole life trying to live up to it.$q$, array[$o$legacy$o$, $o$rumour$o$, $o$oath$o$, $o$plea$o$, $o$slump$o$], 0, $e$1. Boşluğa **legacy** (miras) gelir. Oğlun ömür boyu ulaşmaya çalıştığı şey bırakılan mirastır.

Diğer şıklar: **B** rumour (söylenti) / **C** oath (yemin) / **D** plea (yalvarma) / **E** slump (çöküş).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The ---- old man lived alone in a small hut, and the villagers found him strange because he never spoke to anybody.$q$, array[$o$reliable$o$, $o$vain$o$, $o$eccentric$o$, $o$humble$o$, $o$jealous$o$], 2, $e$1. Boşluğa **eccentric** (eksantrik) gelir. Kimseyle konuşmayan garip yaşlı adam eksantriktir.

Diğer şıklar: **A** reliable (güvenilir) / **B** vain (kendini beğenmiş) / **D** humble (alçakgönüllü) / **E** jealous (kıskanç).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The president ---- promised to protect the rights of every citizen, raising his right hand in front of the crowd.$q$, array[$o$casually$o$, $o$jokingly$o$, $o$carelessly$o$, $o$solemnly$o$, $o$hardly$o$], 3, $e$1. Boşluğa **solemnly** (ciddiyetle) gelir. Sağ elini kaldırarak söz vermek ciddi bir yeminle yapılır.

Diğer şıklar: **A** casually (umursamazca) / **B** jokingly (şaka yollu) / **C** carelessly (dikkatsizce) / **E** hardly (neredeyse hiç).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The lawyer tried to ---- the witness by asking the same question again and again in different words.$q$, array[$o$comfort$o$, $o$confuse$o$, $o$reward$o$, $o$assist$o$, $o$greet$o$], 1, $e$1. Boşluğa **confuse** (şaşırtmak) gelir. Aynı soruyu tekrar sormanın amacı tanığı şaşırtmaktır.

Diğer şıklar: **A** comfort (teselli etmek) / **C** reward (ödüllendirmek) / **D** assist (yardım etmek) / **E** greet (selamlamak).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The two small companies decided to ---- in order to compete with the large international firms in the market.$q$, array[$o$team up$o$, $o$break up$o$, $o$run out$o$, $o$back down$o$, $o$pull over$o$], 0, $e$1. Boşluğa **team up** (güçlerini birleştirmek) gelir. Büyük firmalarla rekabet için küçük şirketlerin birleşmesi team up ile söylenir.

Diğer şıklar: **B** break up (ayrılmak) / **C** run out (tükenmek) / **D** back down (geri adım atmak) / **E** pull over (kenara çekmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The two neighbours had a bitter ---- over the fence, and in the end they had to take the matter to court.$q$, array[$o$ritual$o$, $o$ordeal$o$, $o$vow$o$, $o$quarrel$o$, $o$utility$o$], 3, $e$1. Boşluğa **quarrel** (kavga) gelir. Mahkemeye kadar giden çekişme bir kavgadır.

Diğer şıklar: **A** ritual (ritüel) / **B** ordeal (çile) / **C** vow (yemin) / **E** utility (fayda).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$The soup was rather ----, so she added some salt and some pepper to give it a little more taste.$q$, array[$o$spicy$o$, $o$sour$o$, $o$rich$o$, $o$fresh$o$, $o$bland$o$], 4, $e$1. Boşluğa **bland** (yavan) gelir. Tuz ve karabiber eklemek gereken çorba yavandır.

Diğer şıklar: **A** spicy (baharatlı) / **B** sour (ekşi) / **C** rich (yağlı) / **D** fresh (taze).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The workers ---- moved the heavy machine across the floor, because the slightest mistake could damage it badly.$q$, array[$o$carelessly$o$, $o$gingerly$o$, $o$roughly$o$, $o$eagerly$o$, $o$loudly$o$], 1, $e$1. Boşluğa **gingerly** (dikkatle) gelir. En küçük hatanın zarar vereceği makine dikkatle taşınır.

Diğer şıklar: **A** carelessly (dikkatsizce) / **C** roughly (sertçe) / **D** eagerly (hevesle) / **E** loudly (yüksek sesle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Strong winds and heavy snow ---- the rescue team from reaching the village, so the villagers had to wait another day.$q$, array[$o$allowed$o$, $o$invited$o$, $o$prevented$o$, $o$helped$o$, $o$enabled$o$], 2, $e$1. Boşluğa **prevented** (engellemek) gelir. Köye ulaşılamamasının nedeni fırtına ve karın engellemesidir.

Diğer şıklar: **A** allowed (izin vermek) / **B** invited (davet etmek) / **D** helped (yardım etmek) / **E** enabled (olanak sağlamak).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The government has promised to ---- corruption in public offices before the next election, but few people believe it.$q$, array[$o$cut off$o$, $o$drop out$o$, $o$pass away$o$, $o$give off$o$, $o$root out$o$], 4, $e$1. Boşluğa **root out** (kökünü kazımak) gelir. Yolsuzluğu kökünden kazımak root out ile söylenir.

Diğer şıklar: **A** cut off (kesmek) / **B** drop out (bırakmak) / **C** pass away (ölmek) / **D** give off (yaymak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The young soldier had to go through a terrible ---- in the mountains, and he did not speak about it for years after the war.$q$, array[$o$pledge$o$, $o$merit$o$, $o$wealth$o$, $o$ordeal$o$, $o$wit$o$], 3, $e$1. Boşluğa **ordeal** (çile) gelir. Yıllarca konuşulmayan yaşantı bir çiledir.

Diğer şıklar: **A** pledge (söz) / **B** merit (değer) / **C** wealth (servet) / **E** wit (nükte).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$His ---- reply to the reporter's question made it clear that he was not willing to give any further details about the case.$q$, array[$o$cordial$o$, $o$curt$o$, $o$lengthy$o$, $o$vivid$o$, $o$tender$o$], 1, $e$1. Boşluğa **curt** (kısa ve kaba) gelir. Daha fazla ayrıntı vermek istemeyen kişinin cevabı kısa ve kabadır.

Diğer şıklar: **A** cordial (samimi) / **C** lengthy (uzun) / **D** vivid (canlı) / **E** tender (şefkatli).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The boy was ---- late for school, and after the fifth time in a single month his teacher decided to call his parents.$q$, array[$o$persistently$o$, $o$rarely$o$, $o$hardly$o$, $o$slightly$o$, $o$luckily$o$], 0, $e$1. Boşluğa **persistently** (sürekli) gelir. Bir ayda beş kez gecikme sürekli geç kalmaktır.

Diğer şıklar: **B** rarely (nadiren) / **C** hardly (neredeyse hiç) / **D** slightly (biraz) / **E** luckily (şans eseri).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The company has decided to ---- its activities in Asia, and it plans to open ten new offices in the coming two years.$q$, array[$o$reduce$o$, $o$postpone$o$, $o$reject$o$, $o$conceal$o$, $o$expand$o$], 4, $e$1. Boşluğa **expand** (genişletmek) gelir. On yeni ofis açılması faaliyetleri genişletmektir.

Diğer şıklar: **A** reduce (azaltmak) / **B** postpone (ertelemek) / **C** reject (reddetmek) / **D** conceal (gizlemek).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$The scandal ---- many years ago, but the old man still refuses to talk about it with anyone in the village.$q$, array[$o$took over$o$, $o$broke down$o$, $o$blew over$o$, $o$showed off$o$, $o$held on$o$], 2, $e$1. Boşluğa **blew over** (yatıştı) gelir. Skandalın zamanla yatışması blow over ile söylenir.

Diğer şıklar: **A** took over (devralındı) / **B** broke down (bozuldu) / **D** showed off (gösteriş yapıldı) / **E** held on (tutundu).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The footballer's ---- in form during the second half of the season cost his team the championship.$q$, array[$o$stake$o$, $o$slump$o$, $o$scheme$o$, $o$spectacle$o$, $o$toll$o$], 1, $e$1. Boşluğa **slump** (düşüş) gelir. Sezonun ikinci yarısında formun düşmesi bir düşüş dönemidir.

Diğer şıklar: **A** stake (pay) / **C** scheme (plan) / **D** spectacle (gösteri) / **E** toll (bedel).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Experts warn that the elderly and the very young are particularly ---- to the disease and should be vaccinated first.$q$, array[$o$vulnerable$o$, $o$immune$o$, $o$resistant$o$, $o$indifferent$o$, $o$superior$o$], 0, $e$1. Boşluğa **vulnerable** (savunmasız) gelir. Önce aşılanması gerekenler hastalığa karşı savunmasızdır.

Diğer şıklar: **B** immune (bağışık) / **C** resistant (dirençli) / **D** indifferent (ilgisiz) / **E** superior (üstün).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$He looked ---- at the floor when the teacher asked who had broken the window, because he was the one who had done it.$q$, array[$o$proudly$o$, $o$angrily$o$, $o$curiously$o$, $o$calmly$o$, $o$sheepishly$o$], 4, $e$1. Boşluğa **sheepishly** (mahcup biçimde) gelir. Camı kıran kişi yere mahcup biçimde bakar.

Diğer şıklar: **A** proudly (gururla) / **B** angrily (öfkeyle) / **C** curiously (merakla) / **D** calmly (sakince).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The old photographs helped him ---- many happy memories from his childhood, and he spent the whole evening talking about his village.$q$, array[$o$erase$o$, $o$distort$o$, $o$revive$o$, $o$discard$o$, $o$bury$o$], 2, $e$1. Boşluğa **revive** (canlandırmak) gelir. Çocukluk anılarını yeniden canlandırmak revive ile söylenir.

Diğer şıklar: **A** erase (silmek) / **B** distort (çarpıtmak) / **D** discard (atmak) / **E** bury (gömmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Because of the heavy rain, many farmers could not ---- their crops in time, and the prices increased dramatically.$q$, array[$o$turn in$o$, $o$stand for$o$, $o$look after$o$, $o$bring in$o$, $o$carry on$o$], 3, $e$1. Boşluğa **bring in** (toplamak) gelir. Ürünü zamanında toplamak bring in ile söylenir.

Diğer şıklar: **A** turn in (teslim etmek) / **B** stand for (anlamına gelmek) / **C** look after (bakmak) / **E** carry on (sürdürmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 50
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 50$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The sudden death of the lead investor was a serious ---- for the project, and the team had to look for new funding.$q$, array[$o$breakthrough$o$, $o$setback$o$, $o$privilege$o$, $o$bonus$o$, $o$advantage$o$], 1, $e$1. Boşluğa **setback** (aksilik) gelir. Yatırımcının ölümüyle yeni fon aranması bir aksiliktir.

Diğer şıklar: **A** breakthrough (atılım) / **C** privilege (ayrıcalık) / **D** bonus (ikramiye) / **E** advantage (avantaj).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Her ---- manner made the nervous students feel at ease, and they began to ask questions without fear.$q$, array[$o$cold$o$, $o$stiff$o$, $o$blunt$o$, $o$warm$o$, $o$odd$o$], 3, $e$1. Boşluğa **warm** (sıcak) gelir. Çekingen öğrencilerin rahatlaması samimi tavırdan kaynaklanır.

Diğer şıklar: **A** cold (soğuk) / **B** stiff (sert) / **C** blunt (kaba) / **E** odd (tuhaf).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$He ---- packed his bags and left the house, forgetting his passport on the kitchen table.$q$, array[$o$hastily$o$, $o$slowly$o$, $o$carefully$o$, $o$gradually$o$, $o$patiently$o$], 0, $e$1. Boşluğa **hastily** (aceleyle) gelir. Pasaportu masada unutmak aceleyle toplanmaktan kaynaklanır.

Diğer şıklar: **B** slowly (yavaşça) / **C** carefully (dikkatle) / **D** gradually (giderek) / **E** patiently (sabırla).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The company will ---- heavy losses if it continues to produce goods that nobody wants to buy.$q$, array[$o$earn$o$, $o$incur$o$, $o$avoid$o$, $o$gain$o$, $o$predict$o$], 1, $e$1. Boşluğa **incur** (uğramak) gelir. Kimsenin almadığı mal üretmek ağır zarara uğratır.

Diğer şıklar: **A** earn (kazanmak) / **C** avoid (kaçınmak) / **D** gain (elde etmek) / **E** predict (tahmin etmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The fire ---- in the old market during the night, and by morning more than fifty shops had been destroyed.$q$, array[$o$came out$o$, $o$set out$o$, $o$gave out$o$, $o$pulled out$o$, $o$broke out$o$], 4, $e$1. Boşluğa **broke out** (çıktı) gelir. Gece çıkan yangın break out ile söylenir.

Diğer şıklar: **A** came out (ortaya çıktı) / **B** set out (yola çıktı) / **C** gave out (tükendi) / **D** pulled out (çekildi).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Due to an ---- in the contract, the company was not paid for the extra work and had to take the matter to court.$q$, array[$o$intention$o$, $o$approval$o$, $o$insurance$o$, $o$oversight$o$, $o$agreement$o$], 3, $e$1. Boşluğa **oversight** (gözden kaçırma) gelir. Sözleşmedeki ödenmeme sorunu bir gözden kaçırmadan doğar.

Diğer şıklar: **A** intention (niyet) / **B** approval (onay) / **C** insurance (sigorta) / **E** agreement (anlaşma).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The village is so ---- that visitors say they can hear the birds from early morning until late at night.$q$, array[$o$crowded$o$, $o$hectic$o$, $o$tranquil$o$, $o$noisy$o$, $o$polluted$o$], 2, $e$1. Boşluğa **tranquil** (huzurlu) gelir. Kuş seslerinin duyulduğu köy huzurludur.

Diğer şıklar: **A** crowded (kalabalık) / **B** hectic (telaşlı) / **D** noisy (gürültülü) / **E** polluted (kirli).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The teacher ---- warned the class that anyone caught cheating in the exam would fail the course.$q$, array[$o$sternly$o$, $o$gently$o$, $o$playfully$o$, $o$carelessly$o$, $o$cheerfully$o$], 0, $e$1. Boşluğa **sternly** (sert biçimde) gelir. Kopya çekenin kalacağını söylemek sert bir uyarıdır.

Diğer şıklar: **B** gently (nazikçe) / **C** playfully (şakacı biçimde) / **D** carelessly (dikkatsizce) / **E** cheerfully (neşeyle).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The rebels managed to ---- the president, and they announced on the radio that a new government had been formed.$q$, array[$o$rescue$o$, $o$overthrow$o$, $o$elect$o$, $o$protect$o$, $o$welcome$o$], 1, $e$1. Boşluğa **overthrow** (devirmek) gelir. Yeni hükümet kurulduğunu duyuran isyancılar başkanı devirmiştir.

Diğer şıklar: **A** rescue (kurtarmak) / **C** elect (seçmek) / **D** protect (korumak) / **E** welcome (karşılamak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$At the last moment, the buyer decided to ---- of the deal, and the owner had to look for another customer.$q$, array[$o$set off$o$, $o$go on$o$, $o$turn up$o$, $o$back out$o$, $o$hold on$o$], 3, $e$1. Boşluğa **back out** (vazgeçmek) gelir. Son anda anlaşmadan vazgeçmek back out of ile söylenir.

Diğer şıklar: **A** set off (yola çıkmak) / **B** go on (devam etmek) / **C** turn up (ortaya çıkmak) / **E** hold on (beklemek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The party has changed its ---- on immigration several times, and voters no longer know what it really thinks.$q$, array[$o$stance$o$, $o$instance$o$, $o$rumour$o$, $o$tribute$o$, $o$fragment$o$], 0, $e$1. Boşluğa **stance** (tutum) gelir. Seçmenin partinin ne düşündüğünü bilememesi, tutumun sık değişmesinden kaynaklanır.

Diğer şıklar: **B** instance (örnek) / **C** rumour (söylenti) / **D** tribute (övgü) / **E** fragment (parça).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The politician gave a deliberately ---- answer, so that nobody could tell whether he supported the plan or not.$q$, array[$o$precise$o$, $o$frank$o$, $o$evasive$o$, $o$hostile$o$, $o$emotional$o$], 2, $e$1. Boşluğa **evasive** (kaçamak) gelir. Plana destek verip vermediğini belli etmeyen cevap kaçamaktır.

Diğer şıklar: **A** precise (kesin) / **B** frank (açık sözlü) / **D** hostile (düşmanca) / **E** emotional (duygusal).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$She ---- accepted the job offer, because she knew that the salary was lower than the one she had hoped for.$q$, array[$o$eagerly$o$, $o$proudly$o$, $o$instantly$o$, $o$gladly$o$, $o$reluctantly$o$], 4, $e$1. Boşluğa **reluctantly** (isteksizce) gelir. Beklediğinden düşük maaş isteksiz kabule yol açar.

Diğer şıklar: **A** eagerly (hevesle) / **B** proudly (gururla) / **C** instantly (hemen) / **D** gladly (memnuniyetle).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Critics ---- the film as a dull and badly written story, and it was soon forgotten by the public.$q$, array[$o$acclaimed$o$, $o$embraced$o$, $o$endorsed$o$, $o$dismissed$o$, $o$cherished$o$], 3, $e$1. Boşluğa **dismissed** (geçiştirmek) gelir. Sıkıcı ve kötü yazılmış bulup yüzünü çevirmek dismiss ile söylenir.

Diğer şıklar: **A** acclaimed (alkışlamak) / **B** embraced (benimsemek) / **C** endorsed (onaylamak) / **E** cherished (değer vermek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$He had always wanted to be a doctor, but he ---- as a teacher after his father became ill and the family needed an income.$q$, array[$o$held up$o$, $o$made up$o$, $o$ended up$o$, $o$carried out$o$, $o$backed up$o$], 2, $e$1. Boşluğa **ended up** (sonunda ... oldu) gelir. Planlanmayan bir sonuca varmak end up ile söylenir.

Diğer şıklar: **A** held up (geciktirildi) / **B** made up (uydurdu) / **D** carried out (gerçekleştirdi) / **E** backed up (destekledi).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The new road will be a great ---- to farmers, because they will be able to carry their products to the city market much faster.$q$, array[$o$burden$o$, $o$nuisance$o$, $o$obstacle$o$, $o$penalty$o$, $o$boon$o$], 4, $e$1. Boşluğa **boon** (nimet) gelir. Ürünleri pazara hızlı götürmek çiftçiler için bir nimettir.

Diğer şıklar: **A** burden (yük) / **B** nuisance (baş belası) / **C** obstacle (engel) / **D** penalty (ceza).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The detective looked at the crime scene with a ---- eye, and he noticed small details that the other officers had missed.$q$, array[$o$keen$o$, $o$dull$o$, $o$tender$o$, $o$hasty$o$, $o$weary$o$], 0, $e$1. Boşluğa **keen** (keskin) gelir. Başkalarının gözden kaçırdığı ayrıntıları görmek keskin bir gözle olur.

Diğer şıklar: **B** dull (donuk) / **C** tender (hassas) / **D** hasty (aceleci) / **E** weary (yorgun).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The new model is only ---- faster than the old one, so most customers did not think it was worth the extra money.$q$, array[$o$considerably$o$, $o$marginally$o$, $o$enormously$o$, $o$dramatically$o$, $o$immensely$o$], 1, $e$1. Boşluğa **marginally** (çok az) gelir. Fazla paraya değmediğini düşündürecek hız farkı çok azdır.

Diğer şıklar: **A** considerably (önemli ölçüde) / **C** enormously (muazzam biçimde) / **D** dramatically (çarpıcı biçimde) / **E** immensely (son derece).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The new manager decided to ---- the team's weaknesses first, and then to work out a plan to improve them one by one.$q$, array[$o$conceal$o$, $o$praise$o$, $o$ignore$o$, $o$imitate$o$, $o$identify$o$], 4, $e$1. Boşluğa **identify** (belirlemek) gelir. Zayıflıkları tek tek düzeltmek için önce onları belirlemek gerekir.

Diğer şıklar: **A** conceal (gizlemek) / **B** praise (övmek) / **C** ignore (görmezden gelmek) / **D** imitate (taklit etmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The new fashion ---- quickly, and within a month almost every young person in the city was wearing the same style.$q$, array[$o$died out$o$, $o$broke down$o$, $o$caught on$o$, $o$held out$o$, $o$dropped off$o$], 2, $e$1. Boşluğa **caught on** (yaygınlaştı) gelir. Bir ayda herkesin aynı stili giymesi modanın yaygınlaşmasını gösterir.

Diğer şıklar: **A** died out (yok oldu) / **B** broke down (bozuldu) / **D** held out (dayandı) / **E** dropped off (azaldı).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

