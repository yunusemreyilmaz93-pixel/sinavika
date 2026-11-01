-- 20261026090000_questions_ydt_kelime_5. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 26
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 26$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Lack of money is the biggest ---- for many talented students who want to continue their education at university.$q$, array[$o$obstacle$o$, $o$privilege$o$, $o$witness$o$, $o$celebration$o$, $o$souvenir$o$], 0, $e$1. Boşluğa **obstacle** (engel) gelir. Üniversiteye devam etmeyi zorlaştıran şey engeldir.

Diğer şıklar: **B** privilege (ayrıcalık) / **C** witness (tanık) / **D** celebration (kutlama) / **E** souvenir (hatıra).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The instructions were so ---- that half of the students understood them one way and the other half in the opposite way.$q$, array[$o$explicit$o$, $o$ambiguous$o$, $o$accurate$o$, $o$sufficient$o$, $o$obvious$o$], 1, $e$1. Boşluğa **ambiguous** (belirsiz) gelir. İki zıt biçimde anlaşılan talimat belirsizdir.

Diğer şıklar: **A** explicit (açık) / **C** accurate (doğru) / **D** sufficient (yeterli) / **E** obvious (aşikâr).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The music stopped ---- in the middle of the song, and the audience looked around in confusion.$q$, array[$o$gradually$o$, $o$gently$o$, $o$abruptly$o$, $o$slowly$o$, $o$smoothly$o$], 2, $e$1. Boşluğa **abruptly** (aniden) gelir. Seyircinin şaşkınlıkla etrafa bakması müziğin ani kesildiğini gösterir.

Diğer şıklar: **A** gradually (giderek) / **B** gently (nazikçe) / **D** slowly (yavaşça) / **E** smoothly (pürüzsüzce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The new engine technology can ---- the car from zero to one hundred kilometres per hour in less than four seconds.$q$, array[$o$hesitate$o$, $o$dissolve$o$, $o$withdraw$o$, $o$accelerate$o$, $o$convince$o$], 3, $e$1. Boşluğa **accelerate** (hızlandırmak) gelir. Sıfırdan yüze dört saniyeden kısa sürede çıkarmak hızlandırmaktır.

Diğer şıklar: **A** hesitate (tereddüt etmek) / **B** dissolve (çözmek) / **C** withdraw (çekmek) / **E** convince (ikna etmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The lawyer used photographs and witness statements to ---- his claim that his client had not been at the scene of the crime.$q$, array[$o$put out$o$, $o$back up$o$, $o$go off$o$, $o$hand in$o$, $o$wear out$o$], 1, $e$1. Boşluğa **back up** (desteklemek) gelir. İddiayı fotoğraf ve ifadelerle desteklemek back up ile söylenir.

Diğer şıklar: **A** put out (söndürmek) / **C** go off (bozulmak) / **D** hand in (teslim etmek) / **E** wear out (yıpratmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$A long ---- has dried up the rivers in the region, and farmers have lost most of their crops this year.$q$, array[$o$drought$o$, $o$flood$o$, $o$ceremony$o$, $o$alliance$o$, $o$treaty$o$], 0, $e$1. Boşluğa **drought** (kuraklık) gelir. Nehirleri kurutan olay kuraklıktır.

Diğer şıklar: **B** flood (sel) / **C** ceremony (tören) / **D** alliance (ittifak) / **E** treaty (antlaşma).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The restaurant serves ---- Italian food, prepared by chefs who were born in Italy and use traditional recipes and ingredients.$q$, array[$o$artificial$o$, $o$ordinary$o$, $o$synthetic$o$, $o$imaginary$o$, $o$authentic$o$], 4, $e$1. Boşluğa **authentic** (otantik) gelir. Geleneksel tarif ve malzemeyle yapılan yemek otantiktir.

Diğer şıklar: **A** artificial (yapay) / **B** ordinary (sıradan) / **C** synthetic (sentetik) / **D** imaginary (hayali).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The population of the island fell ---- after the epidemic, from about ten thousand to fewer than two thousand people.$q$, array[$o$slightly$o$, $o$marginally$o$, $o$leisurely$o$, $o$drastically$o$, $o$generously$o$], 3, $e$1. Boşluğa **drastically** (çarpıcı biçimde) gelir. On binden iki binin altına düşüş sert bir düşüştür.

Diğer şıklar: **A** slightly (hafifçe) / **B** marginally (çok az) / **C** leisurely (ağır ağır) / **E** generously (cömertçe).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The city introduced new rules to ---- the number of cars in the centre and to reduce noise and air pollution.$q$, array[$o$invite$o$, $o$inherit$o$, $o$curb$o$, $o$grasp$o$, $o$recall$o$], 2, $e$1. Boşluğa **curb** (sınırlamak) gelir. Araç sayısını sınırlayan kural gürültüyü ve kirliliği azaltmak içindir.

Diğer şıklar: **A** invite (davet etmek) / **B** inherit (miras almak) / **D** grasp (kavramak) / **E** recall (hatırlamak).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The police interviewed everyone in the building to ---- who had been in the office when the money disappeared.$q$, array[$o$run into$o$, $o$get along$o$, $o$pass away$o$, $o$break down$o$, $o$find out$o$], 4, $e$1. Boşluğa **find out** (öğrenmek) gelir. Paranın kaybolduğu sırada ofiste kimin olduğunu öğrenmek find out ile söylenir.

Diğer şıklar: **A** run into (rastlamak) / **B** get along (geçinmek) / **C** pass away (vefat etmek) / **D** break down (bozulmak).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$The government offers tax ---- to companies that build factories in poor regions, hoping to create more jobs there.$q$, array[$o$reservations$o$, $o$incentives$o$, $o$interruptions$o$, $o$nominations$o$, $o$assumptions$o$], 1, $e$1. Boşluğa **incentives** (teşvikler) gelir. Fabrika kurmaya özendiren vergi avantajları teşviktir.

Diğer şıklar: **A** reservations (çekinceler) / **C** interruptions (kesintiler) / **D** nominations (adaylıklar) / **E** assumptions (varsayımlar).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Education is ---- in most countries, which means that all children must go to school until a certain age.$q$, array[$o$optional$o$, $o$unnecessary$o$, $o$compulsory$o$, $o$forbidden$o$, $o$rare$o$], 2, $e$1. Boşluğa **compulsory** (zorunlu) gelir. Tüm çocukların okula gitmek zorunda olması eğitimin zorunlu olduğunu gösterir.

Diğer şıklar: **A** optional (isteğe bağlı) / **B** unnecessary (gereksiz) / **D** forbidden (yasak) / **E** rare (nadir).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$Temperatures have been rising ---- over the last fifty years, and scientists expect this trend to continue.$q$, array[$o$suddenly$o$, $o$hardly$o$, $o$rarely$o$, $o$steadily$o$, $o$bitterly$o$], 3, $e$1. Boşluğa **steadily** (istikrarlı biçimde) gelir. Elli yıldır süren artış istikrarlı bir artıştır.

Diğer şıklar: **A** suddenly (aniden) / **B** hardly (neredeyse hiç) / **C** rarely (nadiren) / **E** bitterly (acı biçimde).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$The company has announced that it will ---- all operations in the region by the end of the year, because it can no longer compete with cheaper imports.$q$, array[$o$cease$o$, $o$resume$o$, $o$expand$o$, $o$increase$o$, $o$improve$o$], 0, $e$1. Boşluğa **cease** (durdurmak) gelir. Rekabet edememe nedeniyle faaliyetleri tamamen sonlandırmak cease ile söylenir.

Diğer şıklar: **B** resume (sürdürmek) / **C** expand (genişletmek) / **D** increase (artırmak) / **E** improve (geliştirmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$After months of negotiations, the two sides finally ---- the deadlock and signed an agreement to end the strike.$q$, array[$o$backed up$o$, $o$wore out$o$, $o$looked after$o$, $o$came across$o$, $o$broke through$o$], 4, $e$1. Boşluğa **broke through** (aşmak) gelir. Anlaşmazlığı aşıp anlaşma imzalamak break through ile söylenir.

Diğer şıklar: **A** backed up (desteklemek) / **B** wore out (yıpratmak) / **C** looked after (bakmak) / **D** came across (rastlamak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The families suffered great ---- during the war, often going without food, clean water or a safe place to sleep.$q$, array[$o$pleasure$o$, $o$hardship$o$, $o$recognition$o$, $o$convenience$o$, $o$luxury$o$], 1, $e$1. Boşluğa **hardship** (zorluk) gelir. Yiyecek ve su bulamamak ağır zorluktur.

Diğer şıklar: **A** pleasure (zevk) / **C** recognition (tanınma) / **D** convenience (kolaylık) / **E** luxury (lüks).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Old paper becomes ---- with age and may break into pieces if it is handled without care.$q$, array[$o$flexible$o$, $o$waterproof$o$, $o$valuable$o$, $o$brittle$o$, $o$transparent$o$], 3, $e$1. Boşluğa **brittle** (kırılgan) gelir. Dikkatsiz tutulunca parçalanması kırılganlıktır.

Diğer şıklar: **A** flexible (esnek) / **B** waterproof (su geçirmez) / **C** valuable (değerli) / **E** transparent (saydam).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The teacher ---- warned the students that cheating would not be tolerated, yet several of them still copied from each other.$q$, array[$o$hardly$o$, $o$vaguely$o$, $o$repeatedly$o$, $o$secretly$o$, $o$barely$o$], 2, $e$1. Boşluğa **repeatedly** (defalarca) gelir. Uyarılara rağmen kopya çekilmesi, uyarının tekrar tekrar yapıldığını gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** vaguely (belirsizce) / **D** secretly (gizlice) / **E** barely (zar zor).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Lack of sleep can ---- a child's ability to learn, because the brain cannot store new information properly.$q$, array[$o$stimulate$o$, $o$enhance$o$, $o$improve$o$, $o$support$o$, $o$inhibit$o$], 4, $e$1. Boşluğa **inhibit** (engellemek) gelir. Beynin bilgi depolayamaması öğrenmenin engellendiğini gösterir.

Diğer şıklar: **A** stimulate (uyarmak) / **B** enhance (artırmak) / **C** improve (geliştirmek) / **D** support (desteklemek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The company plans to ---- fifty new workers next month to cope with the increase in orders before the holiday season.$q$, array[$o$take on$o$, $o$give off$o$, $o$put out$o$, $o$wipe out$o$, $o$hold up$o$], 0, $e$1. Boşluğa **take on** (işe almak) gelir. Siparişlere yetişmek için yeni işçi almak take on ile söylenir.

Diğer şıklar: **B** give off (yaymak) / **C** put out (söndürmek) / **D** wipe out (yok etmek) / **E** hold up (geciktirmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 27
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 27$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The whole plan is based on the ---- that the economy will continue to grow, which many experts now consider unrealistic.$q$, array[$o$assumption$o$, $o$ceremony$o$, $o$recovery$o$, $o$attraction$o$, $o$rebellion$o$], 0, $e$1. Boşluğa **assumption** (varsayım) gelir. Ekonominin büyümeye devam edeceği düşüncesi bir varsayımdır.

Diğer şıklar: **B** ceremony (tören) / **C** recovery (iyileşme) / **D** attraction (çekim) / **E** rebellion (isyan).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The soil in the river valley is extremely ----, so farmers can grow several crops a year without using many chemicals.$q$, array[$o$barren$o$, $o$fertile$o$, $o$hollow$o$, $o$sour$o$, $o$distant$o$], 1, $e$1. Boşluğa **fertile** (verimli) gelir. Kimyasal kullanmadan yılda birkaç ürün alınan toprak verimlidir.

Diğer şıklar: **A** barren (kurak) / **C** hollow (boş) / **D** sour (ekşi) / **E** distant (uzak).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The patient ---- recovered over the following months and was finally able to walk without any help.$q$, array[$o$abruptly$o$, $o$hardly$o$, $o$rarely$o$, $o$gradually$o$, $o$strictly$o$], 3, $e$1. Boşluğa **gradually** (giderek) gelir. Aylar içinde yavaş yavaş iyileşmek giderek olur.

Diğer şıklar: **A** abruptly (aniden) / **B** hardly (zar zor) / **C** rarely (nadiren) / **E** strictly (kesinlikle).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Animals living in the Arctic have ---- to the cold by developing thick fur and a layer of fat under their skin.$q$, array[$o$adapted$o$, $o$refused$o$, $o$deposited$o$, $o$resigned$o$, $o$compared$o$], 0, $e$1. Boşluğa **adapted** (uyum sağlamak) gelir. Kalın tüy geliştirerek soğuğa uyum sağlamak adapt ile söylenir.

Diğer şıklar: **B** refused (reddetmek) / **C** deposited (yatırmak) / **D** resigned (istifa etmek) / **E** compared (karşılaştırmak).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Hikers should ---- poisonous snakes in this area, especially in the warm months when they are most active.$q$, array[$o$put up with$o$, $o$look out for$o$, $o$get away with$o$, $o$keep up with$o$, $o$do away with$o$], 1, $e$1. Boşluğa **look out for** (dikkat etmek) gelir. Zehirli yılanlara karşı tetikte olmak look out for ile söylenir.

Diğer şıklar: **A** put up with (katlanmak) / **C** get away with (yanına kâr kalmak) / **D** keep up with (ayak uydurmak) / **E** do away with (kaldırmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$A serious ---- of water forced the town to limit the amount that each family could use every day.$q$, array[$o$reward$o$, $o$pleasure$o$, $o$shortage$o$, $o$decoration$o$, $o$reception$o$], 2, $e$1. Boşluğa **shortage** (kıtlık) gelir. Aile başına kullanımı sınırlamak su kıtlığından kaynaklanır.

Diğer şıklar: **A** reward (ödül) / **B** pleasure (zevk) / **D** decoration (süsleme) / **E** reception (resepsiyon).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$She is a ---- member of the city council and is often invited to speak on television about local issues.$q$, array[$o$reluctant$o$, $o$hostile$o$, $o$feeble$o$, $o$anonymous$o$, $o$prominent$o$], 4, $e$1. Boşluğa **prominent** (önde gelen) gelir. Televizyona sık davet edilen üye öne çıkan bir isimdir.

Diğer şıklar: **A** reluctant (isteksiz) / **B** hostile (düşmanca) / **C** feeble (zayıf) / **D** anonymous (anonim).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The success of the project was ---- due to the hard work of the volunteers, who gave up their weekends for six months.$q$, array[$o$barely$o$, $o$secretly$o$, $o$formerly$o$, $o$largely$o$, $o$hardly$o$], 3, $e$1. Boşluğa **largely** (büyük ölçüde) gelir. Altı ay hafta sonlarını feda eden gönüllüler başarının büyük bölümünü sağlar.

Diğer şıklar: **A** barely (zar zor) / **B** secretly (gizlice) / **C** formerly (eskiden) / **E** hardly (neredeyse hiç).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Drivers who ---- the speed limit by more than twenty kilometres per hour will have to pay a heavy fine.$q$, array[$o$resemble$o$, $o$assess$o$, $o$exceed$o$, $o$hesitate$o$, $o$dissolve$o$], 2, $e$1. Boşluğa **exceed** (aşmak) gelir. Hız sınırını aşanlar ağır para cezası öder.

Diğer şıklar: **A** resemble (benzemek) / **B** assess (değerlendirmek) / **D** hesitate (tereddüt etmek) / **E** dissolve (çözmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The success of the whole project may ---- the decision of a single investor, who has not yet said whether he will support it.$q$, array[$o$wear out$o$, $o$burn down$o$, $o$scale back$o$, $o$pull out$o$, $o$hinge on$o$], 4, $e$1. Boşluğa **hinge on** (bağlı olmak) gelir. Tek bir yatırımcının kararına bağlı olmak hinge on ile söylenir.

Diğer şıklar: **A** wear out (yıpratmak) / **B** burn down (yanıp kül olmak) / **C** scale back (azaltmak) / **D** pull out (çekilmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Scientists were surprised by the ---- of the earthquake, which was measured at 8.2 and was felt in cities hundreds of kilometres away.$q$, array[$o$reservation$o$, $o$ingredient$o$, $o$recipe$o$, $o$magnitude$o$, $o$souvenir$o$], 3, $e$1. Boşluğa **magnitude** (büyüklük) gelir. 8,2 olarak ölçülen deprem şiddeti büyüklükle ilgilidir.

Diğer şıklar: **A** reservation (çekince) / **B** ingredient (bileşen) / **C** recipe (tarif) / **E** souvenir (hatıra).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$There is no ---- evidence that the company broke the law, only rumours and unconfirmed reports from former employees.$q$, array[$o$tangible$o$, $o$hostile$o$, $o$seasonal$o$, $o$voluntary$o$, $o$hereditary$o$], 0, $e$1. Boşluğa **tangible** (somut) gelir. Yalnızca söylenti olması somut kanıt olmadığını gösterir.

Diğer şıklar: **B** hostile (düşmanca) / **C** seasonal (mevsimlik) / **D** voluntary (gönüllü) / **E** hereditary (kalıtsal).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The air in the city has become ---- cleaner since cars were banned from the centre, according to measurements taken last year.$q$, array[$o$reluctantly$o$, $o$politely$o$, $o$noticeably$o$, $o$vaguely$o$, $o$hardly$o$], 2, $e$1. Boşluğa **noticeably** (gözle görülür biçimde) gelir. Ölçümlerle görülebilen iyileşme gözle görülür bir iyileşmedir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** politely (kibarca) / **D** vaguely (belirsizce) / **E** hardly (neredeyse hiç).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Constant criticism from his colleagues began to ---- his confidence, and he gradually lost the courage to share his ideas.$q$, array[$o$assist$o$, $o$reward$o$, $o$praise$o$, $o$promote$o$, $o$undermine$o$], 4, $e$1. Boşluğa **undermine** (zayıflatmak) gelir. Cesaretini kaybetmesi güvenin zayıflatıldığını gösterir.

Diğer şıklar: **A** assist (yardım etmek) / **B** reward (ödüllendirmek) / **C** praise (övmek) / **D** promote (terfi ettirmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Many young footballers ---- older players who have won international trophies and set an example with their hard work.$q$, array[$o$look down on$o$, $o$look up to$o$, $o$put off$o$, $o$give out$o$, $o$set aside$o$], 1, $e$1. Boşluğa **look up to** (saygı duymak) gelir. Çalışmasıyla örnek olan oyunculara saygı duymak look up to ile söylenir.

Diğer şıklar: **A** look down on (küçümsemek) / **C** put off (ertelemek) / **D** give out (dağıtmak) / **E** set aside (ayırmak).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$Fishing is the main ---- of the people living in the village, and the sea provides almost everything that they need.$q$, array[$o$ambition$o$, $o$privilege$o$, $o$pastime$o$, $o$livelihood$o$, $o$rumour$o$], 3, $e$1. Boşluğa **livelihood** (geçim kaynağı) gelir. Köylülerin ihtiyaçlarını karşılayan balıkçılık geçim kaynağıdır.

Diğer şıklar: **A** ambition (hırs) / **B** privilege (ayrıcalık) / **C** pastime (hobi) / **E** rumour (söylenti).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The doctor said the wound was only ---- and would heal in a few days without any special treatment.$q$, array[$o$chronic$o$, $o$contagious$o$, $o$fatal$o$, $o$permanent$o$, $o$superficial$o$], 4, $e$1. Boşluğa **superficial** (yüzeysel) gelir. Birkaç günde kendiliğinden iyileşen yara yüzeyseldir.

Diğer şıklar: **A** chronic (kronik) / **B** contagious (bulaşıcı) / **C** fatal (ölümcül) / **D** permanent (kalıcı).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Most people ---- admit that they sometimes tell small lies to avoid hurting someone's feelings.$q$, array[$o$readily$o$, $o$tightly$o$, $o$fiercely$o$, $o$densely$o$, $o$bitterly$o$], 0, $e$1. Boşluğa **readily** (kolayca) gelir. Küçük yalanları çekinmeden kabul etmek kolaylıkla kabul etmektir.

Diğer şıklar: **B** tightly (sıkıca) / **C** fiercely (şiddetle) / **D** densely (yoğun biçimde) / **E** bitterly (acı biçimde).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Chemicals from the factory had begun to ---- the river, killing fish and making the water unsafe to drink.$q$, array[$o$purify$o$, $o$irrigate$o$, $o$contaminate$o$, $o$navigate$o$, $o$illustrate$o$], 2, $e$1. Boşluğa **contaminate** (kirletmek) gelir. Balıkları öldüren kimyasallar nehri kirletir.

Diğer şıklar: **A** purify (arıtmak) / **B** irrigate (sulamak) / **D** navigate (seyretmek) / **E** illustrate (örneklemek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$My parents do not ---- my plan to study abroad, because they think I am too young to live alone in a foreign country.$q$, array[$o$count on$o$, $o$approve of$o$, $o$turn into$o$, $o$hand out$o$, $o$break in$o$], 1, $e$1. Boşluğa **approve of** (onaylamak) gelir. Çok genç bulmaları planı onaylamadıklarını gösterir.

Diğer şıklar: **A** count on (güvenmek) / **C** turn into (dönüşmek) / **D** hand out (dağıtmak) / **E** break in (zorla girmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 28
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 28$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Smoking has serious ---- for health, including heart disease, lung cancer and breathing problems that can last for many years.$q$, array[$o$ceremonies$o$, $o$witnesses$o$, $o$recipes$o$, $o$consequences$o$, $o$rewards$o$], 3, $e$1. Boşluğa **consequences** (sonuçlar) gelir. Kalp hastalığı ve kanser sigaranın sağlık üzerindeki sonuçlarıdır.

Diğer şıklar: **A** ceremonies (törenler) / **B** witnesses (tanıklar) / **C** recipes (tarifler) / **E** rewards (ödüller).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The report gives a ---- account of the causes of the war, covering political, economic and social factors in great detail.$q$, array[$o$vague$o$, $o$comprehensive$o$, $o$biased$o$, $o$trivial$o$, $o$hasty$o$], 1, $e$1. Boşluğa **comprehensive** (kapsamlı) gelir. Siyasi, ekonomik ve sosyal nedenleri ayrıntılı ele alan anlatım kapsamlıdır.

Diğer şıklar: **A** vague (belirsiz) / **C** biased (taraflı) / **D** trivial (önemsiz) / **E** hasty (aceleci).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The new teaching method works ---- with young learners, who remember the vocabulary much better than with the old method.$q$, array[$o$hardly$o$, $o$barely$o$, $o$rudely$o$, $o$vaguely$o$, $o$effectively$o$], 4, $e$1. Boşluğa **effectively** (etkili biçimde) gelir. Kelimelerin daha iyi hatırlanması yöntemin etkili çalıştığını gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** barely (zar zor) / **C** rudely (kabaca) / **D** vaguely (belirsizce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Many doctors ---- a diet rich in vegetables and fruit, arguing that it reduces the risk of several serious diseases.$q$, array[$o$oppose$o$, $o$abandon$o$, $o$advocate$o$, $o$delay$o$, $o$refuse$o$], 2, $e$1. Boşluğa **advocate** (savunmak) gelir. Faydalarını öne sürerek bir beslenmeyi önermek savunmaktır.

Diğer şıklar: **A** oppose (karşı çıkmak) / **B** abandon (terk etmek) / **D** delay (ertelemek) / **E** refuse (reddetmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$At the meeting, several students ---- new ideas for improving the school library, such as longer opening hours and more computers.$q$, array[$o$put forward$o$, $o$put up with$o$, $o$ran out of$o$, $o$got over$o$, $o$gave off$o$], 0, $e$1. Boşluğa **put forward** (öne sürmek) gelir. Yeni fikirleri toplantıda öne sürmek put forward ile söylenir.

Diğer şıklar: **B** put up with (katlanmak) / **C** ran out of (tükenmek) / **D** got over (atlatmak) / **E** gave off (yaymak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The main ---- for choosing a candidate was experience, so younger applicants with fewer years of work found it difficult to be selected.$q$, array[$o$reunion$o$, $o$refugee$o$, $o$souvenir$o$, $o$criterion$o$, $o$sermon$o$], 3, $e$1. Boşluğa **criterion** (ölçüt) gelir. Adayı seçerken esas alınan nokta ölçüttür.

Diğer şıklar: **A** reunion (buluşma) / **B** refugee (mülteci) / **C** souvenir (hatıra) / **E** sermon (vaaz).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The ---- decision to close the old theatre caused angry debates, with some people supporting it and others protesting in the streets.$q$, array[$o$unanimous$o$, $o$ordinary$o$, $o$expected$o$, $o$trivial$o$, $o$controversial$o$], 4, $e$1. Boşluğa **controversial** (tartışmalı) gelir. Kimi destekleyip kimi protesto ettiğine göre karar tartışmalıdır.

Diğer şıklar: **A** unanimous (oybirliğiyle) / **B** ordinary (sıradan) / **C** expected (beklenen) / **D** trivial (önemsiz).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$Although the two proposals look different, they are ---- the same, since both aim to reduce taxes for small businesses.$q$, array[$o$essentially$o$, $o$eventually$o$, $o$formerly$o$, $o$barely$o$, $o$hastily$o$], 0, $e$1. Boşluğa **essentially** (özünde) gelir. Her ikisinin de vergiyi azaltmayı amaçlaması özünde aynı olduklarını gösterir.

Diğer şıklar: **B** eventually (sonunda) / **C** formerly (eskiden) / **D** barely (zar zor) / **E** hastily (aceleyle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The tailor will ---- the trousers by making them shorter, so they fit you perfectly.$q$, array[$o$elect$o$, $o$deny$o$, $o$seize$o$, $o$alter$o$, $o$quarrel$o$], 3, $e$1. Boşluğa **alter** (değiştirmek) gelir. Pantolonu kısaltmak onu değiştirmektir.

Diğer şıklar: **A** elect (seçmek) / **B** deny (inkâr etmek) / **C** seize (el koymak) / **E** quarrel (tartışmak).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$Doctors have not yet been able to ---- other possible causes of the illness, so further tests will be carried out next week.$q$, array[$o$hold on$o$, $o$call on$o$, $o$cut across$o$, $o$bring up$o$, $o$rule out$o$], 4, $e$1. Boşluğa **rule out** (elemek) gelir. Başka nedenleri dışlamak için test yapılır.

Diğer şıklar: **A** hold on (tutunmak) / **B** call on (ziyaret etmek) / **C** cut across (aşmak) / **D** bring up (yetiştirmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$She faced a difficult ---- when she was offered a better job in another city, because it meant leaving her elderly mother alone.$q$, array[$o$souvenir$o$, $o$pension$o$, $o$dilemma$o$, $o$harvest$o$, $o$audience$o$], 2, $e$1. Boşluğa **dilemma** (ikilem) gelir. İki seçenek arasında zor bir karar ikilemdir.

Diğer şıklar: **A** souvenir (hatıra) / **B** pension (emekli maaşı) / **D** harvest (hasat) / **E** audience (izleyici).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The goalkeeper's save in the final minute was ---- in the match, because it allowed his team to win the championship.$q$, array[$o$marginal$o$, $o$decisive$o$, $o$negligible$o$, $o$ordinary$o$, $o$spontaneous$o$], 1, $e$1. Boşluğa **decisive** (belirleyici) gelir. Şampiyonluğu getiren kurtarış belirleyicidir.

Diğer şıklar: **A** marginal (ikincil) / **C** negligible (önemsiz) / **D** ordinary (sıradan) / **E** spontaneous (kendiliğinden).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The city of Istanbul was ---- known as Constantinople, and before that as Byzantium.$q$, array[$o$formerly$o$, $o$presumably$o$, $o$hardly$o$, $o$densely$o$, $o$strictly$o$], 0, $e$1. Boşluğa **formerly** (eskiden) gelir. Önceki adlar eskiden kullanılmıştır.

Diğer şıklar: **B** presumably (muhtemelen) / **C** hardly (zar zor) / **D** densely (yoğun biçimde) / **E** strictly (kesinlikle).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Experts ---- that the number of tourists will double next summer, so hotels are already preparing for the extra guests.$q$, array[$o$regret$o$, $o$deny$o$, $o$anticipate$o$, $o$resign$o$, $o$revise$o$], 2, $e$1. Boşluğa **anticipate** (öngörmek) gelir. Otellerin hazırlık yapması artışın öngörüldüğünü gösterir.

Diğer şıklar: **A** regret (pişman olmak) / **B** deny (inkâr etmek) / **D** resign (istifa etmek) / **E** revise (gözden geçirmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The chairman announced that he would ---- at the end of the year, after leading the company for more than twenty years.$q$, array[$o$set off$o$, $o$break out$o$, $o$give off$o$, $o$fill in$o$, $o$step down$o$], 4, $e$1. Boşluğa **step down** (istifa etmek) gelir. Yirmi yıllık başkanlıktan ayrılmak step down ile söylenir.

Diğer şıklar: **A** set off (yola çıkmak) / **B** break out (patlak vermek) / **C** give off (yaymak) / **D** fill in (doldurmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The old city, with its mosques and bazaars, is part of the country's cultural ---- and is protected by law.$q$, array[$o$allowance$o$, $o$scandal$o$, $o$vacancy$o$, $o$heritage$o$, $o$hazard$o$], 3, $e$1. Boşluğa **heritage** (miras) gelir. Yasayla korunan tarihî şehir kültürel mirastır.

Diğer şıklar: **A** allowance (ödenek) / **B** scandal (skandal) / **C** vacancy (boş kadro) / **E** hazard (tehlike).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The climate in the tropical regions is hot and ----, with rain nearly every afternoon and a lot of water vapour in the air.$q$, array[$o$arid$o$, $o$humid$o$, $o$frozen$o$, $o$dull$o$, $o$sour$o$], 1, $e$1. Boşluğa **humid** (nemli) gelir. Havada su buharı çok olan iklim nemlidir.

Diğer şıklar: **A** arid (kurak) / **C** frozen (donmuş) / **D** dull (donuk) / **E** sour (ekşi).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The summers in the south are hot, ---- in July and August, when temperatures often rise above forty degrees.$q$, array[$o$particularly$o$, $o$scarcely$o$, $o$casually$o$, $o$hardly$o$, $o$lazily$o$], 0, $e$1. Boşluğa **particularly** (özellikle) gelir. Sıcaklığın kırk dereceyi aştığı aylar özellikle sıcaktır.

Diğer şıklar: **B** scarcely (zar zor) / **C** casually (gelişigüzel) / **D** hardly (neredeyse hiç) / **E** lazily (tembelce).$e$, 1),
  (19, 'ydt-dil', null::integer, $q$Nothing can ---- the use of violence against innocent people, whatever the political reason may be.$q$, array[$o$require$o$, $o$measure$o$, $o$justify$o$, $o$satisfy$o$, $o$locate$o$], 2, $e$1. Boşluğa **justify** (haklı çıkarmak) gelir. Şiddeti meşru göstermek haklı çıkarmaktır.

Diğer şıklar: **A** require (gerektirmek) / **B** measure (ölçmek) / **D** satisfy (tatmin etmek) / **E** locate (yerini bulmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The effect of the painkiller will ---- after about four hours, and you may need to take another tablet.$q$, array[$o$take after$o$, $o$wear off$o$, $o$hand in$o$, $o$burn down$o$, $o$look up$o$], 1, $e$1. Boşluğa **wear off** (etkisini yitirmek) gelir. İlaç etkisi bittiğinde yeni tablet gerekir.

Diğer şıklar: **A** take after (benzemek) / **C** hand in (teslim etmek) / **D** burn down (yanıp kül olmak) / **E** look up (aramak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 29
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 29$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The government has promised to build better ---- , including roads, bridges and power stations, in the poorest regions of the country.$q$, array[$o$infrastructure$o$, $o$ceremony$o$, $o$audience$o$, $o$departure$o$, $o$penalty$o$], 0, $e$1. Boşluğa **infrastructure** (altyapı) gelir. Yol, köprü ve santral altyapı örnekleridir.

Diğer şıklar: **B** ceremony (tören) / **C** audience (izleyici) / **D** departure (ayrılış) / **E** penalty (ceza).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The scientist's explanation was so ---- that even students without any background in physics could understand it easily.$q$, array[$o$feeble$o$, $o$obscure$o$, $o$reluctant$o$, $o$reckless$o$, $o$lucid$o$], 4, $e$1. Boşluğa **lucid** (anlaşılır) gelir. Fizik bilmeyenlerin bile anlayabildiği anlatım açıktır.

Diğer şıklar: **A** feeble (zayıf) / **B** obscure (belirsiz) / **C** reluctant (isteksiz) / **D** reckless (pervasız).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The shop owner ---- refused to sell the painting, although the customer offered him three times its real value.$q$, array[$o$lazily$o$, $o$gently$o$, $o$nearly$o$, $o$firmly$o$, $o$barely$o$], 3, $e$1. Boşluğa **firmly** (kararlılıkla) gelir. Üç katı fiyat önerilmesine rağmen satmayı reddetmek kararlılıktır.

Diğer şıklar: **A** lazily (tembelce) / **B** gently (nazikçe) / **C** nearly (neredeyse) / **E** barely (zar zor).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Companies must ---- their products to the needs of local customers if they want to be successful in foreign markets.$q$, array[$o$abolish$o$, $o$penetrate$o$, $o$adjust$o$, $o$resign$o$, $o$compete$o$], 2, $e$1. Boşluğa **adjust** (uyarlamak) gelir. Ürünleri yerel ihtiyaca göre ayarlamak adjust ile söylenir.

Diğer şıklar: **A** abolish (kaldırmak) / **B** penetrate (nüfuz etmek) / **D** resign (istifa etmek) / **E** compete (rekabet etmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The police officer asked the driver to ---- at the side of the road so that he could check his documents.$q$, array[$o$break up$o$, $o$set out$o$, $o$hold out$o$, $o$give in$o$, $o$pull over$o$], 4, $e$1. Boşluğa **pull over** (kenara çekmek) gelir. Sürücüden yol kenarında durmasını istemek pull over ile söylenir.

Diğer şıklar: **A** break up (dağılmak) / **B** set out (yola çıkmak) / **C** hold out (dayanmak) / **D** give in (pes etmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The ---- of the book is that a single act of kindness can change the course of a person's life, however small it may seem.$q$, array[$o$rehearsal$o$, $o$message$o$, $o$portion$o$, $o$budget$o$, $o$quarrel$o$], 1, $e$1. Boşluğa **message** (mesaj) gelir. Kitabın vermek istediği temel fikir mesajdır.

Diğer şıklar: **A** rehearsal (prova) / **C** portion (pay) / **D** budget (bütçe) / **E** quarrel (kavga).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Doctors say that ---- exercise, such as a short walk every day, is better for the heart than occasional very intensive training.$q$, array[$o$extreme$o$, $o$fatal$o$, $o$moderate$o$, $o$fragile$o$, $o$hostile$o$], 2, $e$1. Boşluğa **moderate** (ılımlı) gelir. Her gün kısa yürüyüş ılımlı egzersizdir.

Diğer şıklar: **A** extreme (aşırı) / **B** fatal (ölümcül) / **D** fragile (kırılgan) / **E** hostile (düşmanca).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The two brothers look ---- alike, and even their parents sometimes call one of them by the other's name.$q$, array[$o$strikingly$o$, $o$hardly$o$, $o$faintly$o$, $o$modestly$o$, $o$rarely$o$], 0, $e$1. Boşluğa **strikingly** (çarpıcı biçimde) gelir. Ebeveynlerin bile karıştırması çarpıcı benzerlikten gelir.

Diğer şıklar: **B** hardly (neredeyse hiç) / **C** faintly (belli belirsiz) / **D** modestly (mütevazı biçimde) / **E** rarely (nadiren).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The report ---- that the number of homeless people has increased by thirty percent since the beginning of the financial crisis.$q$, array[$o$conceals$o$, $o$denies$o$, $o$prevents$o$, $o$reveals$o$, $o$restores$o$], 3, $e$1. Boşluğa **reveals** (ortaya koyar) gelir. Artışı göstermek reveal ile söylenir.

Diğer şıklar: **A** conceals (gizler) / **B** denies (inkâr eder) / **C** prevents (önler) / **E** restores (geri getirir).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The two leaders agreed to ---- their differences and to work together to solve the economic crisis in their region.$q$, array[$o$take over$o$, $o$put aside$o$, $o$run into$o$, $o$wear out$o$, $o$break down$o$], 1, $e$1. Boşluğa **put aside** (bir kenara koymak) gelir. Farklılıkları unutup birlikte çalışmak put aside ile söylenir.

Diğer şıklar: **A** take over (devralmak) / **C** run into (rastlamak) / **D** wear out (yıpratmak) / **E** break down (bozulmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$A sudden ---- in temperature, from twenty degrees in the morning to near freezing at night, made it difficult for the plants to survive.$q$, array[$o$invitation$o$, $o$vacation$o$, $o$agreement$o$, $o$profession$o$, $o$fluctuation$o$], 4, $e$1. Boşluğa **fluctuation** (dalgalanma) gelir. Sabah yirmi, gece sıfıra yakın derece ani dalgalanmadır.

Diğer şıklar: **A** invitation (davet) / **B** vacation (tatil) / **C** agreement (anlaşma) / **D** profession (meslek).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The company's profits fell sharply last year, but its ---- position remains strong because it has very little debt and large savings.$q$, array[$o$spiritual$o$, $o$marital$o$, $o$tribal$o$, $o$financial$o$, $o$medieval$o$], 3, $e$1. Boşluğa **financial** (mali) gelir. Borcun az, birikimin çok olması mali durumu gösterir.

Diğer şıklar: **A** spiritual (ruhani) / **B** marital (evliliğe ait) / **C** tribal (kabileye ait) / **E** medieval (ortaçağa ait).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$The disease spread ---- through the camp, and within two weeks nearly everyone had fallen ill.$q$, array[$o$slowly$o$, $o$rapidly$o$, $o$barely$o$, $o$gently$o$, $o$partly$o$], 1, $e$1. Boşluğa **rapidly** (hızla) gelir. İki hafta içinde herkesin hastalanması hızlı yayılmayı gösterir.

Diğer şıklar: **A** slowly (yavaşça) / **C** barely (zar zor) / **D** gently (nazikçe) / **E** partly (kısmen).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$Advertising can ---- people to buy things they do not need by making them believe that these products will make them happier.$q$, array[$o$prohibit$o$, $o$imitate$o$, $o$exhaust$o$, $o$violate$o$, $o$persuade$o$], 4, $e$1. Boşluğa **persuade** (ikna etmek) gelir. Mutlu edeceğine inandırarak aldırmak ikna etmektir.

Diğer şıklar: **A** prohibit (yasaklamak) / **B** imitate (taklit etmek) / **C** exhaust (tüketmek) / **D** violate (ihlal etmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$After the meeting, the delegates ---- the airport to catch their flight home, since there was no time for lunch.$q$, array[$o$dealt with$o$, $o$looked into$o$, $o$ran out of$o$, $o$headed for$o$, $o$wore off$o$], 3, $e$1. Boşluğa **headed for** (yönelmek) gelir. Havalimanına yönelmek head for ile söylenir.

Diğer şıklar: **A** dealt with (ele aldı) / **B** looked into (araştırdı) / **C** ran out of (tükendi) / **E** wore off (etkisini yitirdi).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$Several museums in the city offer free ---- to students on the first Sunday of every month.$q$, array[$o$admission$o$, $o$demolition$o$, $o$execution$o$, $o$pollution$o$, $o$competition$o$], 0, $e$1. Boşluğa **admission** (giriş) gelir. Müzeye öğrencilerin ücretsiz girebilmesi giriş izni ile söylenir.

Diğer şıklar: **B** demolition (yıkım) / **C** execution (uygulama) / **D** pollution (kirlilik) / **E** competition (yarışma).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The new rules are ---- for all employees, so nobody, not even senior managers, is allowed to ignore them.$q$, array[$o$optional$o$, $o$tentative$o$, $o$binding$o$, $o$vacant$o$, $o$fragile$o$], 2, $e$1. Boşluğa **binding** (bağlayıcı) gelir. Kimsenin yok sayamadığı kural bağlayıcıdır.

Diğer şıklar: **A** optional (isteğe bağlı) / **B** tentative (geçici) / **D** vacant (boş) / **E** fragile (kırılgan).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The new law is ---- aimed at young drivers, who are involved in far more accidents than older people.$q$, array[$o$reluctantly$o$, $o$specifically$o$, $o$hardly$o$, $o$carelessly$o$, $o$softly$o$], 1, $e$1. Boşluğa **specifically** (özellikle) gelir. Genç sürücülere özel olarak yönelen kural belirli bir hedef gösterir.

Diğer şıklar: **A** reluctantly (isteksizce) / **C** hardly (neredeyse hiç) / **D** carelessly (dikkatsizce) / **E** softly (yumuşakça).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The charity hopes to ---- enough money to build a new school for the children who live in the mountain villages.$q$, array[$o$raise$o$, $o$wander$o$, $o$exceed$o$, $o$yield$o$, $o$vanish$o$], 0, $e$1. Boşluğa **raise** (toplamak) gelir. Okul için para toplamak raise money ile söylenir.

Diğer şıklar: **B** wander (dolaşmak) / **C** exceed (aşmak) / **D** yield (boyun eğmek) / **E** vanish (yok olmak).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The new student found it hard to ---- his classmates at first, because they all seemed to know each other already.$q$, array[$o$look up to$o$, $o$come up with$o$, $o$get along with$o$, $o$catch up with$o$, $o$put up with$o$], 2, $e$1. Boşluğa **get along with** (iyi geçinmek) gelir. Birbirini tanıyan sınıfla geçinmekte zorlanmak get along with ile söylenir.

Diğer şıklar: **A** look up to (saygı duymak) / **B** come up with (bulmak) / **D** catch up with (yetişmek) / **E** put up with (katlanmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 30
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 30$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Her great ---- was to become the first woman in her family to graduate from university, and she studied hard every day to achieve it.$q$, array[$o$hesitation$o$, $o$hostility$o$, $o$permission$o$, $o$suspicion$o$, $o$ambition$o$], 4, $e$1. Boşluğa **ambition** (hırs) gelir. İlk üniversite mezunu olmak isteyen kişinin gayesi bir hırstır.

Diğer şıklar: **A** hesitation (tereddüt) / **B** hostility (düşmanlık) / **C** permission (izin) / **D** suspicion (şüphe).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The apartment is ---- and bright, with large windows, high ceilings and enough room for a family of five.$q$, array[$o$cramped$o$, $o$gloomy$o$, $o$spacious$o$, $o$noisy$o$, $o$shabby$o$], 2, $e$1. Boşluğa **spacious** (geniş) gelir. Beş kişilik aileye yetecek kadar yer olması dairenin geniş olduğunu gösterir.

Diğer şıklar: **A** cramped (dar) / **B** gloomy (kasvetli) / **D** noisy (gürültülü) / **E** shabby (külüstür).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Cities are becoming ---- crowded as more and more people move from the countryside in search of work.$q$, array[$o$barely$o$, $o$hardly$o$, $o$rarely$o$, $o$increasingly$o$, $o$lazily$o$], 3, $e$1. Boşluğa **increasingly** (giderek) gelir. Gitgide artan göç şehirleri giderek kalabalıklaştırır.

Diğer şıklar: **A** barely (zar zor) / **B** hardly (neredeyse hiç) / **C** rarely (nadiren) / **E** lazily (tembelce).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Teachers use regular tests to ---- how much their students have learned and to decide which topics need to be repeated.$q$, array[$o$assess$o$, $o$flatter$o$, $o$resign$o$, $o$bury$o$, $o$adopt$o$], 0, $e$1. Boşluğa **assess** (değerlendirmek) gelir. Öğrencilerin ne kadar öğrendiğini ölçmek değerlendirmektir.

Diğer şıklar: **B** flatter (pohpohlamak) / **C** resign (istifa etmek) / **D** bury (gömmek) / **E** adopt (benimsemek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$After years of travelling around the world, he decided to ---- in a small town near the sea and open a bookshop.$q$, array[$o$break out$o$, $o$give off$o$, $o$sum up$o$, $o$take over$o$, $o$settle down$o$], 4, $e$1. Boşluğa **settle down** (yerleşmek) gelir. Yıllarca gezdikten sonra bir kasabaya yerleşmek settle down ile söylenir.

Diğer şıklar: **A** break out (patlak vermek) / **B** give off (yaymak) / **C** sum up (özetlemek) / **D** take over (devralmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Having the right to vote is a ---- that earlier generations had to fight for, and which should never be taken for granted.$q$, array[$o$punishment$o$, $o$privilege$o$, $o$nuisance$o$, $o$hardship$o$, $o$rumour$o$], 1, $e$1. Boşluğa **privilege** (ayrıcalık) gelir. İçin savaşılmış ve hafife alınmaması gereken hak bir ayrıcalıktır.

Diğer şıklar: **A** punishment (ceza) / **C** nuisance (baş belası) / **D** hardship (zorluk) / **E** rumour (söylenti).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Many scientists remain ---- about the claim, because the results have never been repeated by independent researchers.$q$, array[$o$enthusiastic$o$, $o$convinced$o$, $o$confident$o$, $o$sceptical$o$, $o$delighted$o$], 3, $e$1. Boşluğa **sceptical** (kuşkucu) gelir. Sonuçların tekrarlanmaması bilim insanlarını kuşkucu yapar.

Diğer şıklar: **A** enthusiastic (istekli) / **B** convinced (ikna olmuş) / **C** confident (kendinden emin) / **E** delighted (memnun).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The house, ---- owned by a famous painter, was sold last year to a family from abroad for a record price.$q$, array[$o$previously$o$, $o$densely$o$, $o$hardly$o$, $o$loudly$o$, $o$sharply$o$], 0, $e$1. Boşluğa **previously** (daha önce) gelir. Geçen yıl satılmadan önceki sahibi daha önceki sahiptir.

Diğer şıklar: **B** densely (yoğun biçimde) / **C** hardly (neredeyse hiç) / **D** loudly (yüksek sesle) / **E** sharply (keskin biçimde).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$She moved to London to ---- a career in fashion design, hoping to work for one of the famous brands there.$q$, array[$o$reject$o$, $o$expel$o$, $o$pursue$o$, $o$depart$o$, $o$shrink$o$], 2, $e$1. Boşluğa **pursue** (peşinden gitmek) gelir. Moda tasarımı kariyeri hedeflemek pursue ile söylenir.

Diğer şıklar: **A** reject (reddetmek) / **B** expel (kovmak) / **D** depart (ayrılmak) / **E** shrink (küçülmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$In difficult times, many people ---- their faith, which gives them the strength to continue and the hope that things will improve.$q$, array[$o$get away from$o$, $o$hold on to$o$, $o$look down on$o$, $o$cut off from$o$, $o$run out of$o$], 1, $e$1. Boşluğa **hold on to** (sıkı tutunmak) gelir. Güç veren inanca tutunmak hold on to ile söylenir.

Diğer şıklar: **A** get away from (uzaklaşmak) / **C** look down on (küçümsemek) / **D** cut off from (ayırmak) / **E** run out of (tükenmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The ---- against the king began in the northern provinces, where farmers refused to pay the new taxes and attacked tax collectors.$q$, array[$o$admission$o$, $o$recession$o$, $o$regulation$o$, $o$tradition$o$, $o$rebellion$o$], 4, $e$1. Boşluğa **rebellion** (isyan) gelir. Vergi memurlarına saldıran çiftçilerin başlattığı olay isyandır.

Diğer şıklar: **A** admission (kabul) / **B** recession (durgunluk) / **C** regulation (düzenleme) / **D** tradition (gelenek).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The judge was ---- with the young offender, giving him a warning and community work instead of sending him to prison.$q$, array[$o$ruthless$o$, $o$strict$o$, $o$lenient$o$, $o$hostile$o$, $o$brutal$o$], 2, $e$1. Boşluğa **lenient** (hoşgörülü) gelir. Hapis yerine uyarı ve toplum hizmeti vermek yumuşak davranmaktır.

Diğer şıklar: **A** ruthless (acımasız) / **B** strict (katı) / **D** hostile (düşmanca) / **E** brutal (zalim).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The committee has ---- agreed to the plan, but the final decision will not be made until the budget has been approved.$q$, array[$o$fiercely$o$, $o$tentatively$o$, $o$exclusively$o$, $o$immensely$o$, $o$bitterly$o$], 1, $e$1. Boşluğa **tentatively** (geçici olarak) gelir. Nihai kararın bütçeye bağlı olması geçici onayı gösterir.

Diğer şıklar: **A** fiercely (şiddetle) / **C** exclusively (yalnızca) / **D** immensely (son derece) / **E** bitterly (acı biçimde).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The two countries held talks to ---- their border dispute peacefully, without using military force.$q$, array[$o$prolong$o$, $o$intensify$o$, $o$provoke$o$, $o$resolve$o$, $o$neglect$o$], 3, $e$1. Boşluğa **resolve** (çözmek) gelir. Sınır anlaşmazlığını barışçıl çözmek resolve ile söylenir.

Diğer şıklar: **A** prolong (uzatmak) / **B** intensify (yoğunlaştırmak) / **C** provoke (kışkırtmak) / **E** neglect (ihmal etmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The witness was able to ---- the thief from a group of ten men standing in a row at the police station.$q$, array[$o$pick out$o$, $o$wear out$o$, $o$sign up$o$, $o$give off$o$, $o$run over$o$], 0, $e$1. Boşluğa **pick out** (seçmek) gelir. On kişi arasından hırsızı tanımak pick out ile söylenir.

Diğer şıklar: **B** wear out (yıpratmak) / **C** sign up (kaydolmak) / **D** give off (yaymak) / **E** run over (ezmek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The sudden ---- of foreign troops from the region left a power vacuum, and several armed groups fought for control of the capital.$q$, array[$o$delivery$o$, $o$invention$o$, $o$withdrawal$o$, $o$persuasion$o$, $o$compliment$o$], 2, $e$1. Boşluğa **withdrawal** (çekilme) gelir. Güç boşluğu bırakan yabancı askerlerin ayrılması çekilmedir.

Diğer şıklar: **A** delivery (teslimat) / **B** invention (icat) / **D** persuasion (ikna) / **E** compliment (iltifat).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$There is a ---- difference between the two words, and even native speakers sometimes find it hard to explain when to use each one.$q$, array[$o$enormous$o$, $o$blatant$o$, $o$obvious$o$, $o$subtle$o$, $o$dramatic$o$], 3, $e$1. Boşluğa **subtle** (ince) gelir. Ana dili konuşanların bile açıklamakta zorlandığı fark incedir.

Diğer şıklar: **A** enormous (muazzam) / **B** blatant (bariz) / **C** obvious (açık) / **E** dramatic (çarpıcı).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The meeting will begin ---- at nine o'clock, so anyone who arrives late will not be allowed to enter the room.$q$, array[$o$roughly$o$, $o$precisely$o$, $o$loosely$o$, $o$vaguely$o$, $o$sadly$o$], 1, $e$1. Boşluğa **precisely** (tam olarak) gelir. Geç kalanın alınmaması saatin tam olduğunu gösterir.

Diğer şıklar: **A** roughly (yaklaşık olarak) / **C** loosely (gevşekçe) / **D** vaguely (belirsizce) / **E** sadly (üzgün biçimde).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The island's economy cannot ---- such a large number of visitors for long, because its water and electricity supplies are limited.$q$, array[$o$refine$o$, $o$alter$o$, $o$dismiss$o$, $o$praise$o$, $o$sustain$o$], 4, $e$1. Boşluğa **sustain** (sürdürmek) gelir. Sınırlı su ve elektrik, bu kadar ziyaretçiyi taşımayı güçleştirir.

Diğer şıklar: **A** refine (arıtmak) / **B** alter (değiştirmek) / **C** dismiss (reddetmek) / **D** praise (övmek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The unexpected snowstorm ---- the construction of the new bridge by almost three months, and the cost of the project rose.$q$, array[$o$set back$o$, $o$let on$o$, $o$tell apart$o$, $o$take after$o$, $o$wipe out$o$], 0, $e$1. Boşluğa **set back** (geciktirmek) gelir. İnşaatı üç ay geciktirmek set back ile söylenir.

Diğer şıklar: **B** let on (ifşa etmek) / **C** tell apart (ayırt etmek) / **D** take after (benzemek) / **E** wipe out (yok etmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

