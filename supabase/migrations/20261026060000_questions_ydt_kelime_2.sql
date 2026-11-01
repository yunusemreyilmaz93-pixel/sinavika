-- 20261026060000_questions_ydt_kelime_2. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 11
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 11$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$After the earthquake, the ---- of the historic mosque took nearly ten years, because every damaged stone had to be replaced by hand.$q$, array[$o$restoration$o$, $o$invention$o$, $o$retirement$o$, $o$negotiation$o$, $o$hesitation$o$], 0, $e$1. Boşluğa **restoration** (onarım) gelir. Hasarlı taşların elle değiştirildiği çalışma restorasyondur.

Diğer şıklar: **B** invention (icat) / **C** retirement (emeklilik) / **D** negotiation (müzakere) / **E** hesitation (tereddüt).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Climbers avoided the northern route because the ice was thin and the weather was ----, making any attempt extremely dangerous.$q$, array[$o$pleasant$o$, $o$ordinary$o$, $o$mutual$o$, $o$feasible$o$, $o$treacherous$o$], 4, $e$1. Boşluğa **treacherous** (tehlikeli) gelir. Her girişimi tehlikeli kılan hava güvenilmez ve sinsidir.

Diğer şıklar: **A** pleasant (hoş) / **B** ordinary (sıradan) / **C** mutual (karşılıklı) / **D** feasible (uygulanabilir).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The plan was ---- rejected by the board, but after several changes it was finally accepted.$q$, array[$o$fatally$o$, $o$generously$o$, $o$initially$o$, $o$lengthily$o$, $o$mutually$o$], 2, $e$1. Boşluğa **initially** (başlangıçta) gelir. Sonunda kabul edilmesi, ilk reddin başlangıçta olduğunu gösterir.

Diğer şıklar: **A** fatally (ölümcül biçimde) / **B** generously (cömertçe) / **D** lengthily (uzun uzadıya) / **E** mutually (karşılıklı olarak).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$To make the dessert, you should slowly ---- the sugar and the eggs until the mixture becomes smooth and pale.$q$, array[$o$blend$o$, $o$abandon$o$, $o$threaten$o$, $o$relieve$o$, $o$defend$o$], 0, $e$1. Boşluğa **blend** (karıştırmak) gelir. Şeker ve yumurtayı pürüzsüz oluncaya kadar karıştırmak gerekir.

Diğer şıklar: **B** abandon (terk etmek) / **C** threaten (tehdit etmek) / **D** relieve (hafifletmek) / **E** defend (savunmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The police promised to ---- the disappearance of the painting from the museum and to report their findings next week.$q$, array[$o$get over$o$, $o$run out$o$, $o$pass on$o$, $o$look into$o$, $o$give in$o$], 3, $e$1. Boşluğa **look into** (araştırmak) gelir. Kaybolan tablonun nedenini araştırmak look into'dur.

Diğer şıklar: **A** get over (atlatmak) / **B** run out (tükenmek) / **C** pass on (aktarmak) / **E** give in (pes etmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Regular ---- of the engine, including changing the oil and checking the brakes, helps a car to last much longer.$q$, array[$o$opposition$o$, $o$maintenance$o$, $o$ambition$o$, $o$conclusion$o$, $o$recognition$o$], 1, $e$1. Boşluğa **maintenance** (bakım) gelir. Yağ değişimi ve fren kontrolü düzenli bakımdır.

Diğer şıklar: **A** opposition (muhalefet) / **C** ambition (hırs) / **D** conclusion (sonuç) / **E** recognition (tanınma).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$The streets of the old market are full of ---- colours, as traders display silk cloth, fruit and spices in the open air.$q$, array[$o$vibrant$o$, $o$dull$o$, $o$fatal$o$, $o$frail$o$, $o$vacant$o$], 0, $e$1. Boşluğa **vibrant** (canlı) gelir. İpek, meyve ve baharatın açıkta sergilenmesi renkleri canlı kılar.

Diğer şıklar: **B** dull (donuk) / **C** fatal (ölümcül) / **D** frail (zayıf) / **E** vacant (boş).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Smoking ---- increases the risk of lung cancer, and the danger grows with the number of cigarettes smoked per day.$q$, array[$o$barely$o$, $o$rarely$o$, $o$casually$o$, $o$briefly$o$, $o$significantly$o$], 4, $e$1. Boşluğa **significantly** (belirgin biçimde) gelir. Günde içilen sigara arttıkça büyüyen risk belirgin bir artıştır.

Diğer şıklar: **A** barely (zar zor) / **B** rarely (nadiren) / **C** casually (gelişigüzel) / **D** briefly (kısaca).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$A few large companies ---- the market for mobile phones, and smaller producers find it hard to compete with them.$q$, array[$o$witness$o$, $o$recall$o$, $o$dominate$o$, $o$conceal$o$, $o$sacrifice$o$], 2, $e$1. Boşluğa **dominate** (hâkim olmak) gelir. Küçük üreticilerin rekabet edememesi pazarda büyüklerin hâkim olduğunu gösterir.

Diğer şıklar: **A** witness (tanık olmak) / **B** recall (hatırlamak) / **D** conceal (gizlemek) / **E** sacrifice (feda etmek).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$Some drivers think they can ---- parking in forbidden areas, but traffic officers have started to give heavy fines.$q$, array[$o$come up with$o$, $o$keep up with$o$, $o$put up with$o$, $o$get away with$o$, $o$do away with$o$], 3, $e$1. Boşluğa **get away with** (yanına kâr kalmak) gelir. Ağır cezanın gelmesi, sürücülerin yanlarına kâr kalacağını sanmalarıyla çelişir.

Diğer şıklar: **A** come up with (ortaya atmak) / **B** keep up with (ayak uydurmak) / **C** put up with (katlanmak) / **E** do away with (kaldırmak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$There is a striking ---- between the two brothers, and strangers often mistake one for the other.$q$, array[$o$contrast$o$, $o$resemblance$o$, $o$distance$o$, $o$allowance$o$, $o$invention$o$], 1, $e$1. Boşluğa **resemblance** (benzerlik) gelir. Yabancıların karıştırması iki kardeş arasındaki çarpıcı benzerlikten gelir.

Diğer şıklar: **A** contrast (zıtlık) / **C** distance (mesafe) / **D** allowance (ödenek) / **E** invention (icat).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She is a ---- researcher who records every observation in detail and double-checks all of her calculations before publishing.$q$, array[$o$careless$o$, $o$generous$o$, $o$meticulous$o$, $o$elderly$o$, $o$casual$o$], 2, $e$1. Boşluğa **meticulous** (titiz) gelir. Her gözlemi kaydedip hesapları iki kez kontrol eden araştırmacı titizdir.

Diğer şıklar: **A** careless (dikkatsiz) / **B** generous (cömert) / **D** elderly (yaşlı) / **E** casual (gelişigüzel).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$Nobody forced the students to join the clean-up, and they all took part ---- on the weekend.$q$, array[$o$compulsorily$o$, $o$accidentally$o$, $o$hardly$o$, $o$fiercely$o$, $o$voluntarily$o$], 4, $e$1. Boşluğa **voluntarily** (gönüllü olarak) gelir. Kimsenin zorlamadığı katılım gönüllüdür.

Diğer şıklar: **A** compulsorily (zorunlu olarak) / **B** accidentally (kazara) / **C** hardly (zar zor) / **D** fiercely (şiddetle).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Young people under the age of twenty ---- almost half of the country's population, which makes education a major national concern.$q$, array[$o$defend$o$, $o$decorate$o$, $o$postpone$o$, $o$constitute$o$, $o$wander$o$], 3, $e$1. Boşluğa **constitute** (oluşturmak) gelir. Nüfusun yarısını oluşturmak constitute ile söylenir.

Diğer şıklar: **A** defend (savunmak) / **B** decorate (süslemek) / **C** postpone (ertelemek) / **E** wander (dolaşmak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The younger son will ---- the family business when his father retires at the end of the year.$q$, array[$o$fall behind$o$, $o$take over$o$, $o$break out$o$, $o$back up$o$, $o$tell apart$o$], 1, $e$1. Boşluğa **take over** (devralmak) gelir. Babanın emekli olmasıyla işi devralmak take over'dır.

Diğer şıklar: **A** fall behind (geride kalmak) / **C** break out (patlak vermek) / **D** back up (desteklemek) / **E** tell apart (ayırt etmek).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$The city has experienced a sudden ---- in tourism this year, with hotel bookings almost doubling compared with the previous summer.$q$, array[$o$shortage$o$, $o$refusal$o$, $o$upsurge$o$, $o$disguise$o$, $o$privilege$o$], 2, $e$1. Boşluğa **upsurge** (ani artış) gelir. Otel rezervasyonlarının neredeyse iki katına çıkması turizmdeki ani artıştır.

Diğer şıklar: **A** shortage (kıtlık) / **B** refusal (ret) / **D** disguise (kılık) / **E** privilege (ayrıcalık).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The trade routes made the city one of the most ---- in the region, with rich merchants, large markets and beautiful buildings.$q$, array[$o$hostile$o$, $o$barren$o$, $o$humble$o$, $o$remote$o$, $o$prosperous$o$], 4, $e$1. Boşluğa **prosperous** (zengin) gelir. Zengin tüccarlar ve büyük pazarlar şehrin müreffeh olduğunu gösterir.

Diğer şıklar: **A** hostile (düşmanca) / **B** barren (kurak) / **C** humble (alçakgönüllü) / **D** remote (uzak).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The new law limits the number of cars in the city centre, ---- reducing air pollution and making the streets safer for pedestrians.$q$, array[$o$whereas$o$, $o$thereby$o$, $o$nevertheless$o$, $o$albeit$o$, $o$meanwhile$o$], 1, $e$1. Boşluğa **thereby** (böylece) gelir. Araç sayısını sınırlamanın sonucu olarak havanın temizlenmesi thereby ile bağlanır.

Diğer şıklar: **A** whereas (oysa) / **C** nevertheless (yine de) / **D** albeit (gerçi) / **E** meanwhile (bu arada).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The student asked the university to ---- his entrance for one year so that he could complete his military service.$q$, array[$o$refine$o$, $o$sustain$o$, $o$convey$o$, $o$defer$o$, $o$undermine$o$], 3, $e$1. Boşluğa **defer** (ertelemek) gelir. Askerlik için kaydı bir yıl ertetmek defer ile söylenir.

Diğer şıklar: **A** refine (arıtmak) / **B** sustain (sürdürmek) / **C** convey (iletmek) / **E** undermine (zayıflatmak).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Salaries have not kept pace with prices, so many families can no longer ---- the cost of living.$q$, array[$o$keep up with$o$, $o$get away with$o$, $o$look down on$o$, $o$make up for$o$, $o$run out of$o$], 0, $e$1. Boşluğa **keep up with** (ayak uydurmak) gelir. Maaşların fiyatlara yetişememesi, hayat pahalılığına ayak uyduramamaktır.

Diğer şıklar: **B** get away with (yanına kâr kalmak) / **C** look down on (küçümsemek) / **D** make up for (telafi etmek) / **E** run out of (tükenmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 12
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 12$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The artist mixed ---- made from crushed minerals with oil to create paint in rich shades of red, blue and yellow.$q$, array[$o$pensions$o$, $o$pigments$o$, $o$vehicles$o$, $o$sermons$o$, $o$glaciers$o$], 1, $e$1. Boşluğa **pigments** (pigmentler) gelir. Ezilmiş minerallerden yapılıp boyaya renk veren maddeler pigmenttir.

Diğer şıklar: **A** pensions (emekli maaşları) / **C** vehicles (araçlar) / **D** sermons (vaazlar) / **E** glaciers (buzullar).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The proposal to build a new airport proved highly ----, splitting the local community into two angry groups.$q$, array[$o$unanimous$o$, $o$tolerable$o$, $o$divisive$o$, $o$productive$o$, $o$reversible$o$], 2, $e$1. Boşluğa **divisive** (bölücü) gelir. Halkı iki öfkeli gruba ayıran öneri bölücüdür.

Diğer şıklar: **A** unanimous (oybirliğiyle) / **B** tolerable (katlanılabilir) / **D** productive (verimli) / **E** reversible (geri döndürülebilir).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$The teacher was ---- interested in the students' ideas, listening carefully and asking questions about every suggestion.$q$, array[$o$barely$o$, $o$randomly$o$, $o$briefly$o$, $o$genuinely$o$, $o$secretly$o$], 3, $e$1. Boşluğa **genuinely** (gerçekten) gelir. Dikkatle dinleyip soru sorması ilginin gerçek olduğunu gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** randomly (rastgele) / **C** briefly (kısaca) / **E** secretly (gizlice).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Students who sleep at least eight hours a night tend to ---- those who regularly stay up late, even when both groups study the same number of hours.$q$, array[$o$interpret$o$, $o$endure$o$, $o$violate$o$, $o$remind$o$, $o$outperform$o$], 4, $e$1. Boşluğa **outperform** (daha iyi performans göstermek) gelir. Daha az uyuyanlardan daha başarılı olmak outperform ile söylenir.

Diğer şıklar: **A** interpret (yorumlamak) / **B** endure (dayanmak) / **C** violate (ihlal etmek) / **D** remind (hatırlatmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The doctor warned the patient to ---- her advice at once, since delaying treatment could make the illness much worse.$q$, array[$o$count for$o$, $o$look up$o$, $o$act on$o$, $o$sign up$o$, $o$run out$o$], 2, $e$1. Boşluğa **act on** (göre hareket etmek) gelir. Tavsiyeye hemen göre hareket etmek act on ile söylenir.

Diğer şıklar: **A** count for (değeri olmak) / **B** look up (aramak) / **D** sign up (kaydolmak) / **E** run out (tükenmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$China was ruled by a series of ----, each of which controlled the country for hundreds of years before being replaced.$q$, array[$o$dynasties$o$, $o$vaccines$o$, $o$ambassadors$o$, $o$currencies$o$, $o$ceilings$o$], 0, $e$1. Boşluğa **dynasties** (hanedanlar) gelir. Yüzlerce yıl ülkeyi yöneten ardışık ailelere hanedan denir.

Diğer şıklar: **B** vaccines (aşılar) / **C** ambassadors (elçiler) / **D** currencies (para birimleri) / **E** ceilings (tavanlar).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The region is ---- in matters of education and culture, although defence and foreign policy are decided by the central government.$q$, array[$o$rigid$o$, $o$autonomous$o$, $o$feeble$o$, $o$spacious$o$, $o$hostile$o$], 1, $e$1. Boşluğa **autonomous** (özerk) gelir. Eğitim ve kültürde kendi kararını verip savunmayı merkeze bırakan bölge özerktir.

Diğer şıklar: **A** rigid (katı) / **C** feeble (zayıf) / **D** spacious (geniş) / **E** hostile (düşmanca).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The word 'kid' is used ---- to mean a child, although in formal writing the word 'child' is preferred.$q$, array[$o$formally$o$, $o$strictly$o$, $o$colloquially$o$, $o$rarely$o$, $o$hardly$o$], 2, $e$1. Boşluğa **colloquially** (konuşma dilinde) gelir. Resmî yazıda tercih edilmemesi, kelimenin gündelik konuşma diline ait olduğunu gösterir.

Diğer şıklar: **A** formally (resmî olarak) / **B** strictly (kesin olarak) / **D** rarely (nadiren) / **E** hardly (zar zor).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$It takes the workers about two hours to ---- one machine, because each one contains hundreds of small parts.$q$, array[$o$complain$o$, $o$predict$o$, $o$reward$o$, $o$assemble$o$, $o$appoint$o$], 3, $e$1. Boşluğa **assemble** (monte etmek) gelir. Yüzlerce küçük parçanın birleştirilmesi montajdır.

Diğer şıklar: **A** complain (şikâyet etmek) / **B** predict (tahmin etmek) / **C** reward (ödüllendirmek) / **E** appoint (atamak).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$Engineers worked for months to ---- a solution to the problem of the leaking tunnel.$q$, array[$o$work out$o$, $o$bring down$o$, $o$hold on$o$, $o$pick up$o$, $o$use up$o$], 0, $e$1. Boşluğa **work out** (bulmak) gelir. Sızan tünel için çözüm bulmak work out ile söylenir.

Diğer şıklar: **B** bring down (indirmek) / **C** hold on (tutunmak) / **D** pick up (toplamak) / **E** use up (tüketmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Rare paintings and antique furniture are often sold at ----, where buyers compete by offering higher and higher prices.$q$, array[$o$funerals$o$, $o$lectures$o$, $o$auctions$o$, $o$harvests$o$, $o$elections$o$], 2, $e$1. Boşluğa **auctions** (açık artırmalar) gelir. Alıcıların giderek yüksek fiyat verdiği satışlar açık artırmadır.

Diğer şıklar: **A** funerals (cenazeler) / **B** lectures (dersler) / **D** harvests (hasatlar) / **E** elections (seçimler).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$After being cheated by several politicians, many voters have become ---- and no longer believe that anything will change.$q$, array[$o$gullible$o$, $o$enthusiastic$o$, $o$generous$o$, $o$hospitable$o$, $o$cynical$o$], 4, $e$1. Boşluğa **cynical** (alaycı) gelir. Hiçbir şeyin değişeceğine inanmamak kuşkucu ve alaycı bir tutumdur.

Diğer şıklar: **A** gullible (saf) / **B** enthusiastic (istekli) / **C** generous (cömert) / **D** hospitable (konuksever).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The two countries are ---- close but very different in language, religion and customs.$q$, array[$o$chemically$o$, $o$musically$o$, $o$medically$o$, $o$geographically$o$, $o$legally$o$], 3, $e$1. Boşluğa **geographically** (coğrafi olarak) gelir. Dil, din ve gelenek farkının karşısında coğrafi yakınlık konu edilir.

Diğer şıklar: **A** chemically (kimyasal olarak) / **B** musically (müzikal olarak) / **C** medically (tıbbi olarak) / **E** legally (yasal olarak).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Before cleaning the vacuum cleaner, you should always ---- the hose from the main body of the machine.$q$, array[$o$detach$o$, $o$enclose$o$, $o$deliver$o$, $o$reinforce$o$, $o$spread$o$], 0, $e$1. Boşluğa **detach** (ayırmak) gelir. Hortumu gövdeden ayırmak detach ile söylenir.

Diğer şıklar: **B** enclose (çevrelemek) / **C** deliver (teslim etmek) / **D** reinforce (güçlendirmek) / **E** spread (yaymak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$In the final paragraph, the writer tries to ---- the main arguments of the essay in just three sentences.$q$, array[$o$hold on$o$, $o$sum up$o$, $o$look out$o$, $o$set off$o$, $o$blow up$o$], 1, $e$1. Boşluğa **sum up** (özetlemek) gelir. Ana fikirleri üç cümlede özetlemek sum up'tır.

Diğer şıklar: **A** hold on (tutunmak) / **C** look out (dikkat etmek) / **D** set off (yola çıkmak) / **E** blow up (patlatmak).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$A large ---- gathered outside the stadium hours before the match, waiting for the team's bus to arrive.$q$, array[$o$ripple$o$, $o$vessel$o$, $o$glimpse$o$, $o$treaty$o$, $o$throng$o$], 4, $e$1. Boşluğa **throng** (kalabalık) gelir. Stadyum önünde toplanan büyük insan topluluğu kalabalıktır.

Diğer şıklar: **A** ripple (dalgacık) / **B** vessel (gemi) / **C** glimpse (bakış) / **D** treaty (antlaşma).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Although the factory uses modern machines, some tasks, such as packing delicate glass objects, still require ---- work.$q$, array[$o$verbal$o$, $o$mutual$o$, $o$marginal$o$, $o$manual$o$, $o$digital$o$], 3, $e$1. Boşluğa **manual** (elle yapılan) gelir. Makine kullanılmasına rağmen elle yapılan işler manuel çalışmadır.

Diğer şıklar: **A** verbal (sözlü) / **B** mutual (karşılıklı) / **C** marginal (ikincil) / **E** digital (dijital).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The old castle was only ---- destroyed in the fire, and the main tower and several rooms can still be visited today.$q$, array[$o$partially$o$, $o$entirely$o$, $o$completely$o$, $o$permanently$o$, $o$fatally$o$], 0, $e$1. Boşluğa **partially** (kısmen) gelir. Ana kulenin ayakta kalması yıkımın kısmî olduğunu gösterir.

Diğer şıklar: **B** entirely (tamamen) / **C** completely (bütünüyle) / **D** permanently (kalıcı olarak) / **E** fatally (ölümcül biçimde).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Few economists could ---- such a rapid fall in oil prices at the beginning of the year, so the sudden change surprised markets.$q$, array[$o$defy$o$, $o$dispense$o$, $o$insult$o$, $o$exceed$o$, $o$envisage$o$], 4, $e$1. Boşluğa **envisage** (öngörmek) gelir. Piyasaları şaşırtan ani düşüşü az kişi önceden tasavvur edebilmiştir.

Diğer şıklar: **A** defy (meydan okumak) / **B** dispense (dağıtmak) / **C** insult (hakaret etmek) / **D** exceed (aşmak).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Many students find it easier to learn when the examples ---- their own lives and interests.$q$, array[$o$dispose of$o$, $o$relate to$o$, $o$head for$o$, $o$dream of$o$, $o$burst into$o$], 1, $e$1. Boşluğa **relate to** (ilgili olmak) gelir. Öğrencilerin kendi hayatıyla ilgili örnekler daha kolay öğrenilir.

Diğer şıklar: **A** dispose of (elden çıkarmak) / **C** head for (yönelmek) / **D** dream of (hayal etmek) / **E** burst into (aniden girmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 13
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 13$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The yearly ---- of birds from northern Europe to Africa covers thousands of kilometres and takes several weeks to complete.$q$, array[$o$decoration$o$, $o$permission$o$, $o$appointment$o$, $o$subtraction$o$, $o$migration$o$], 4, $e$1. Boşluğa **migration** (göç) gelir. Kuşların kıtalar arası yolculuğu göçtür.

Diğer şıklar: **A** decoration (süsleme) / **B** permission (izin) / **C** appointment (randevu) / **D** subtraction (çıkarma).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The new library is easily ---- by public transport, with a bus stop and a metro station only two minutes from the entrance.$q$, array[$o$accessible$o$, $o$eager$o$, $o$absent$o$, $o$curious$o$, $o$immune$o$], 0, $e$1. Boşluğa **accessible** (erişilebilir) gelir. Girişe iki dakika uzaklıktaki durak, kütüphanenin kolay ulaşılabilir olduğunu gösterir.

Diğer şıklar: **B** eager (hevesli) / **C** absent (yok) / **D** curious (meraklı) / **E** immune (bağışık).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Thanks to better farming methods, the amount of wheat produced per hectare has risen ---- over the past fifty years.$q$, array[$o$merely$o$, $o$scarcely$o$, $o$secretly$o$, $o$substantially$o$, $o$reluctantly$o$], 3, $e$1. Boşluğa **substantially** (önemli ölçüde) gelir. Daha iyi tarım yöntemleriyle verim önemli ölçüde artmıştır.

Diğer şıklar: **A** merely (sadece) / **B** scarcely (zar zor) / **C** secretly (gizlice) / **E** reluctantly (isteksizce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The government introduced new measures to ---- the economy, including lower taxes for small businesses and cheaper loans.$q$, array[$o$undermine$o$, $o$ignore$o$, $o$bolster$o$, $o$complicate$o$, $o$mislead$o$], 2, $e$1. Boşluğa **bolster** (desteklemek) gelir. Vergi indirimi ve ucuz kredi ekonomiyi güçlendirmeye yöneliktir.

Diğer şıklar: **A** undermine (zayıflatmak) / **B** ignore (görmezden gelmek) / **D** complicate (karmaşıklaştırmak) / **E** mislead (yanıltmak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$Fear of failure can ---- talented people from applying for jobs for which they are perfectly qualified.$q$, array[$o$put up$o$, $o$hold back$o$, $o$take over$o$, $o$get over$o$, $o$fall for$o$], 1, $e$1. Boşluğa **hold back** (engellemek) gelir. Başarısızlık korkusu yetenekli kişileri başvurudan alıkoyar.

Diğer şıklar: **A** put up (dikmek) / **C** take over (devralmak) / **D** get over (atlatmak) / **E** fall for (aşık olmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Buying a house is so expensive that most families have to take out a bank ---- and spend many years repaying it.$q$, array[$o$mortgage$o$, $o$scholarship$o$, $o$sentence$o$, $o$lecture$o$, $o$sermon$o$], 0, $e$1. Boşluğa **mortgage** (konut kredisi) gelir. Evi satın almak için bankadan alınan ve yıllarca ödenen borç konut kredisidir.

Diğer şıklar: **B** scholarship (burs) / **C** sentence (hüküm) / **D** lecture (ders) / **E** sermon (vaaz).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The company is known for its ---- designs, which combine traditional materials with completely new ways of producing furniture.$q$, array[$o$outdated$o$, $o$identical$o$, $o$innovative$o$, $o$hesitant$o$, $o$monotonous$o$], 2, $e$1. Boşluğa **innovative** (yenilikçi) gelir. Tamamen yeni üretim yöntemleri kullanan tasarımlar yenilikçidir.

Diğer şıklar: **A** outdated (eskimiş) / **B** identical (aynı) / **D** hesitant (tereddütlü) / **E** monotonous (monoton).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The winter was ---- cold, with temperatures staying below minus twenty for almost a month, which is very rare in this region.$q$, array[$o$barely$o$, $o$exceptionally$o$, $o$mildly$o$, $o$hardly$o$, $o$seldom$o$], 1, $e$1. Boşluğa **exceptionally** (olağanüstü derecede) gelir. Bölgede çok nadir görülen soğuk olağanüstü bir soğuktur.

Diğer şıklar: **A** barely (zar zor) / **C** mildly (hafifçe) / **D** hardly (neredeyse hiç) / **E** seldom (nadiren).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$If the weather continues to ----, the ferry service between the two islands may be cancelled for several days.$q$, array[$o$improve$o$, $o$interpret$o$, $o$accompany$o$, $o$deteriorate$o$, $o$reserve$o$], 3, $e$1. Boşluğa **deteriorate** (kötüleşmek) gelir. Seferlerin iptal edilmesi havanın kötüleşmesine bağlıdır.

Diğer şıklar: **A** improve (iyileşmek) / **B** interpret (yorumlamak) / **C** accompany (eşlik etmek) / **E** reserve (ayırtmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Before the performance, the actors ---- their lines one last time to make sure that nobody had forgotten anything.$q$, array[$o$dropped out$o$, $o$backed away$o$, $o$came about$o$, $o$gave up$o$, $o$ran through$o$], 4, $e$1. Boşluğa **ran through** (gözden geçirmek) gelir. Repliklere son kez göz gezdirmek run through ile söylenir.

Diğer şıklar: **A** dropped out (bırakmak) / **B** backed away (geri çekilmek) / **C** came about (meydana gelmek) / **D** gave up (vazgeçmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Cotton is popular for its ----, since it can be used to make everything from light summer shirts to heavy work trousers.$q$, array[$o$versatility$o$, $o$ambiguity$o$, $o$hostility$o$, $o$dishonesty$o$, $o$obedience$o$], 0, $e$1. Boşluğa **versatility** (çok yönlülük) gelir. Hafif gömlekten ağır pantolona kadar kullanılabilmesi çok yönlülüktür.

Diğer şıklar: **B** ambiguity (belirsizlik) / **C** hostility (düşmanlık) / **D** dishonesty (sahtekârlık) / **E** obedience (itaat).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$It is ---- that the patient takes the medicine at the same time every day, since missing a dose can reduce its effect.$q$, array[$o$questionable$o$, $o$imperative$o$, $o$amusing$o$, $o$tolerable$o$, $o$apparent$o$], 1, $e$1. Boşluğa **imperative** (şart) gelir. Dozu kaçırmanın etkiyi azaltması ilacın düzenli alınmasını zorunlu kılar.

Diğer şıklar: **A** questionable (şüpheli) / **C** amusing (eğlenceli) / **D** tolerable (katlanılabilir) / **E** apparent (açık).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$----, the man who had spent his whole life warning people about fire lost his own house in a fire.$q$, array[$o$Gradually$o$, $o$Hopefully$o$, $o$Briefly$o$, $o$Gently$o$, $o$Ironically$o$], 4, $e$1. Boşluğa **Ironically** (İronik biçimde) gelir. Hayatını yangına karşı uyarmakla geçiren adamın evinin yanması ironiktir.

Diğer şıklar: **A** Gradually (Giderek) / **B** Hopefully (Umarım) / **C** Briefly (Kısaca) / **D** Gently (Nazikçe).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The company will not ---- any form of dishonesty, and employees who lie about their work are dismissed immediately.$q$, array[$o$generate$o$, $o$inspect$o$, $o$tolerate$o$, $o$postpone$o$, $o$assemble$o$], 2, $e$1. Boşluğa **tolerate** (hoş görmek) gelir. Yalan söyleyenlerin hemen işten çıkarılması hoşgörüsüzlüğü gösterir.

Diğer şıklar: **A** generate (üretmek) / **B** inspect (denetlemek) / **D** postpone (ertelemek) / **E** assemble (monte etmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The manager ---- being informed about every change in the schedule, even the smallest ones.$q$, array[$o$got away from$o$, $o$looked up to$o$, $o$came across$o$, $o$insisted on$o$, $o$made up for$o$], 3, $e$1. Boşluğa **insisted on** (ısrar etmek) gelir. En küçük değişikliklerin bile bildirilmesinde ısrar etmek insist on'dur.

Diğer şıklar: **A** got away from (uzaklaşmak) / **B** looked up to (saygı duymak) / **C** came across (rastlamak) / **E** made up for (telafi etmek).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$Governments are being urged to invest in the ---- of climate change by cutting carbon emissions as quickly as possible.$q$, array[$o$discovery$o$, $o$mitigation$o$, $o$recognition$o$, $o$approval$o$, $o$assumption$o$], 1, $e$1. Boşluğa **mitigation** (hafifletme) gelir. Karbon salımını azaltarak iklim değişikliğinin etkisini hafifletmek mitigasyondur.

Diğer şıklar: **A** discovery (keşif) / **C** recognition (tanınma) / **D** approval (onay) / **E** assumption (varsayım).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Many people have ---- fears, such as being afraid of harmless spiders, even though they know that there is no real danger.$q$, array[$o$rational$o$, $o$legitimate$o$, $o$irrational$o$, $o$profitable$o$, $o$modest$o$], 2, $e$1. Boşluğa **irrational** (mantıksız) gelir. Zararsız örümcekten korkmak gerçek tehlikeye dayanmayan, mantıksız bir korkudur.

Diğer şıklar: **A** rational (mantıklı) / **B** legitimate (meşru) / **D** profitable (kârlı) / **E** modest (mütevazı).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The two leaders hold ---- opposed views on the question of taxation, and neither is willing to accept any compromise.$q$, array[$o$rarely$o$, $o$modestly$o$, $o$casually$o$, $o$gently$o$, $o$diametrically$o$], 4, $e$1. Boşluğa **diametrically** (taban tabana) gelir. Hiçbir tarafın taviz vermemesi görüşlerin taban tabana zıt olduğunu gösterir.

Diğer şıklar: **A** rarely (nadiren) / **B** modestly (mütevazı biçimde) / **C** casually (gelişigüzel) / **D** gently (nazikçe).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The city council decided to ---- the old factory and build a public park on the empty land.$q$, array[$o$demolish$o$, $o$preserve$o$, $o$inherit$o$, $o$admire$o$, $o$rent$o$], 0, $e$1. Boşluğa **demolish** (yıkmak) gelir. Boş arazide park yapılması için fabrikanın yıkılması gerekir.

Diğer şıklar: **B** preserve (korumak) / **C** inherit (miras almak) / **D** admire (hayran olmak) / **E** rent (kiralamak).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$It took the detectives three years to ---- the thief who had stolen the famous painting from the gallery.$q$, array[$o$call off$o$, $o$wear out$o$, $o$turn into$o$, $o$track down$o$, $o$put aside$o$], 3, $e$1. Boşluğa **track down** (izini bulmak) gelir. Yıllarca süren araştırmanın sonunda hırsızı bulmak track down'dır.

Diğer şıklar: **A** call off (iptal etmek) / **B** wear out (yıpratmak) / **C** turn into (dönüşmek) / **E** put aside (bir kenara koymak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 14
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 14$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The government reduced public ---- on defence by ten percent this year, and used the savings to build new schools.$q$, array[$o$expenditure$o$, $o$opposition$o$, $o$congratulation$o$, $o$decoration$o$, $o$exhibition$o$], 0, $e$1. Boşluğa **expenditure** (harcama) gelir. Tasarruf edilen kaynak savunma harcamasının kısılmasından gelir.

Diğer şıklar: **B** opposition (muhalefet) / **C** congratulation (tebrik) / **D** decoration (süsleme) / **E** exhibition (sergi).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$The ---- donation of a local businessman allowed the hospital to buy two new ambulances and modern medical equipment.$q$, array[$o$hostile$o$, $o$absent$o$, $o$fragile$o$, $o$frequent$o$, $o$generous$o$], 4, $e$1. Boşluğa **generous** (cömert) gelir. İki ambulans ve ekipman alınmasını sağlayan bağış cömerttir.

Diğer şıklar: **A** hostile (düşmanca) / **B** absent (yok) / **C** fragile (kırılgan) / **D** frequent (sık).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The interpreter translates the speaker's words ----, so listeners hear the translation almost at the same moment as the original speech.$q$, array[$o$subsequently$o$, $o$reluctantly$o$, $o$simultaneously$o$, $o$eventually$o$, $o$thereafter$o$], 2, $e$1. Boşluğa **simultaneously** (eş zamanlı olarak) gelir. Çevirinin konuşmayla neredeyse aynı anda duyulması eş zamanlıdır.

Diğer şıklar: **A** subsequently (sonradan) / **B** reluctantly (isteksizce) / **D** eventually (sonunda) / **E** thereafter (ondan sonra).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Ultraviolet rays can ---- the clouds and still burn your skin, which is why sunscreen is important even on cloudy days.$q$, array[$o$penetrate$o$, $o$admire$o$, $o$dispatch$o$, $o$cancel$o$, $o$sympathise$o$], 0, $e$1. Boşluğa **penetrate** (nüfuz etmek) gelir. Bulutlu havada bile cildi yakan ışınlar bulutların içinden geçer.

Diğer şıklar: **B** admire (hayran olmak) / **C** dispatch (göndermek) / **D** cancel (iptal etmek) / **E** sympathise (empati kurmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Loud music from the nearby restaurant ---- the students' ability to concentrate during the evening lessons.$q$, array[$o$comes across$o$, $o$runs out of$o$, $o$stands for$o$, $o$looks after$o$, $o$interferes with$o$], 4, $e$1. Boşluğa **interferes with** (engel olmak) gelir. Gürültünün konsantrasyonu bozması interfere with ile söylenir.

Diğer şıklar: **A** comes across (rastlamak) / **B** runs out of (tükenmek) / **C** stands for (anlamına gelmek) / **D** looks after (bakmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Steel is widely used in bridges because of its ----, as it can carry heavy loads and resist weather for many decades.$q$, array[$o$hospitality$o$, $o$privacy$o$, $o$rivalry$o$, $o$durability$o$, $o$vanity$o$], 3, $e$1. Boşluğa **durability** (dayanıklılık) gelir. Ağır yük taşıyıp hava koşullarına dayanma dayanıklılıktır.

Diğer şıklar: **A** hospitality (konukseverlik) / **B** privacy (gizlilik) / **C** rivalry (rekabet) / **E** vanity (kibir).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Many doctors warn that some video games are ----, as players find it difficult to stop even when they want to.$q$, array[$o$affordable$o$, $o$addictive$o$, $o$educational$o$, $o$unreliable$o$, $o$ordinary$o$], 1, $e$1. Boşluğa **addictive** (bağımlılık yapan) gelir. Oyuncuların durmakta zorlanması bağımlılık yapmasıdır.

Diğer şıklar: **A** affordable (uygun fiyatlı) / **C** educational (eğitici) / **D** unreliable (güvenilmez) / **E** ordinary (sıradan).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The company was founded in 1990 and ---- expanded to twelve countries, becoming the largest producer of its kind in Europe.$q$, array[$o$hardly$o$, $o$mutually$o$, $o$subsequently$o$, $o$barely$o$, $o$blindly$o$], 2, $e$1. Boşluğa **subsequently** (sonradan) gelir. 1990'da kurulan şirketin sonradan büyümesi subsequently ile söylenir.

Diğer şıklar: **A** hardly (zar zor) / **B** mutually (karşılıklı olarak) / **D** barely (zar zor) / **E** blindly (körü körüne).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$After the speech, the president took the opportunity to ---- his commitment to peace, a promise he had already made in several earlier addresses.$q$, array[$o$eliminate$o$, $o$distribute$o$, $o$evacuate$o$, $o$magnify$o$, $o$reiterate$o$], 4, $e$1. Boşluğa **reiterate** (yinelemek) gelir. Daha önce verilen sözü tekrar dile getirmek reiterate ile söylenir.

Diğer şıklar: **A** eliminate (ortadan kaldırmak) / **B** distribute (dağıtmak) / **C** evacuate (tahliye etmek) / **D** magnify (büyütmek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The small donations from thousands of people ---- more than two million pounds, which was enough to build the new hospital wing.$q$, array[$o$added up to$o$, $o$cut down on$o$, $o$held on to$o$, $o$stood up for$o$, $o$came down with$o$], 0, $e$1. Boşluğa **added up to** (toplamı ... olmak) gelir. Küçük bağışların toplamı iki milyon sterlini aşmıştır.

Diğer şıklar: **B** cut down on (azaltmak) / **C** held on to (tutunmak) / **D** stood up for (savunmak) / **E** came down with (hastalanmak).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The two schools improved their results through close ----, sharing teachers, laboratories and teaching materials.$q$, array[$o$competition$o$, $o$suspicion$o$, $o$cooperation$o$, $o$criticism$o$, $o$distance$o$], 2, $e$1. Boşluğa **cooperation** (işbirliği) gelir. Öğretmen ve laboratuvar paylaşımı işbirliğidir.

Diğer şıklar: **A** competition (rekabet) / **B** suspicion (şüphe) / **D** criticism (eleştiri) / **E** distance (mesafe).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$Fame in the world of pop music is often ----: a singer may be popular for a few months and then be completely forgotten.$q$, array[$o$permanent$o$, $o$hereditary$o$, $o$voluminous$o$, $o$ephemeral$o$, $o$legislative$o$], 3, $e$1. Boşluğa **ephemeral** (geçici) gelir. Birkaç ay sonra unutulan şöhret geçicidir.

Diğer şıklar: **A** permanent (kalıcı) / **B** hereditary (kalıtsal) / **C** voluminous (hacimli) / **E** legislative (yasama).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$It rained ---- all morning, with short heavy showers followed by periods of bright sunshine.$q$, array[$o$continuously$o$, $o$intermittently$o$, $o$permanently$o$, $o$consistently$o$, $o$increasingly$o$], 1, $e$1. Boşluğa **intermittently** (aralıklı olarak) gelir. Kısa sağanakların güneşli aralıklarla sürmesi aralıklı yağıştır.

Diğer şıklar: **A** continuously (sürekli olarak) / **C** permanently (kalıcı olarak) / **D** consistently (tutarlı biçimde) / **E** increasingly (giderek).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Cacti ---- in dry climates because they store water in their thick stems and lose very little through their skin.$q$, array[$o$vanish$o$, $o$quarrel$o$, $o$thrive$o$, $o$hesitate$o$, $o$retreat$o$], 2, $e$1. Boşluğa **thrive** (gelişmek) gelir. Suyu depolayan kaktüsler kuru iklimde iyi gelişir.

Diğer şıklar: **A** vanish (yok olmak) / **B** quarrel (tartışmak) / **D** hesitate (tereddüt etmek) / **E** retreat (geri çekilmek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The whole case ---- the testimony of one witness, so if she changes her story, the prosecution will have no evidence.$q$, array[$o$puts off$o$, $o$breaks into$o$, $o$wears out$o$, $o$rests on$o$, $o$turns up$o$], 3, $e$1. Boşluğa **rests on** (dayanmak) gelir. Tüm dava bir tanığın ifadesine dayanmaktadır.

Diğer şıklar: **A** puts off (ertelemek) / **B** breaks into (zorla girmek) / **C** wears out (yıpratmak) / **E** turns up (ortaya çıkmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The earthquake exposed the ---- of buildings constructed without proper foundations, as hundreds of them collapsed within seconds.$q$, array[$o$vulnerability$o$, $o$generosity$o$, $o$majority$o$, $o$simplicity$o$, $o$accuracy$o$], 0, $e$1. Boşluğa **vulnerability** (savunmasızlık) gelir. Saniyeler içinde çöken binalar zayıflığı ve savunmasızlığı gösterir.

Diğer şıklar: **B** generosity (cömertlik) / **C** majority (çoğunluk) / **D** simplicity (sadelik) / **E** accuracy (doğruluk).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The flood had ---- consequences for the region, destroying thousands of homes and leaving farmland under water for months.$q$, array[$o$insignificant$o$, $o$catastrophic$o$, $o$negligible$o$, $o$beneficial$o$, $o$temporary$o$], 1, $e$1. Boşluğa **catastrophic** (yıkıcı) gelir. Binlerce evin yıkılması sonuçların felaket boyutunda olduğunu gösterir.

Diğer şıklar: **A** insignificant (önemsiz) / **C** negligible (ihmal edilebilir) / **D** beneficial (yararlı) / **E** temporary (geçici).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The region has been ---- studied by geologists, who have published hundreds of reports on its rocks and underground water.$q$, array[$o$barely$o$, $o$secretly$o$, $o$briefly$o$, $o$casually$o$, $o$extensively$o$], 4, $e$1. Boşluğa **extensively** (kapsamlı biçimde) gelir. Yüzlerce rapor yayımlanması bölgenin geniş çapta incelendiğini gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** secretly (gizlice) / **C** briefly (kısaca) / **D** casually (gelişigüzel).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Before giving the medicine to children, parents should ---- it with water, because the pure liquid is too strong for them.$q$, array[$o$forbid$o$, $o$alert$o$, $o$abandon$o$, $o$dilute$o$, $o$reward$o$], 3, $e$1. Boşluğa **dilute** (seyreltmek) gelir. Sıvı çocuklar için fazla güçlü olduğu için suyla seyreltilmelidir.

Diğer şıklar: **A** forbid (yasaklamak) / **B** alert (uyarmak) / **C** abandon (terk etmek) / **E** reward (ödüllendirmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$A heavy snowstorm ---- the mountain village from the rest of the region, and supplies had to be delivered by helicopter.$q$, array[$o$took up$o$, $o$cut off$o$, $o$looked up$o$, $o$sat down$o$, $o$gave out$o$], 1, $e$1. Boşluğa **cut off** (ayırmak) gelir. Yardımın helikopterle taşınması köyün dış dünyayla bağlantısının kesildiğini gösterir.

Diğer şıklar: **A** took up (başlamak) / **C** looked up (aramak) / **D** sat down (oturmak) / **E** gave out (dağıtmak).$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 15
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 15$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The museum has built a climate-controlled ---- area underground, where thousands of old documents are kept at a constant temperature.$q$, array[$o$audience$o$, $o$storage$o$, $o$treaty$o$, $o$refusal$o$, $o$contest$o$], 1, $e$1. Boşluğa **storage** (depolama) gelir. Belgelerin sabit sıcaklıkta saklandığı alan depolama alanıdır.

Diğer şıklar: **A** audience (izleyici) / **C** treaty (antlaşma) / **D** refusal (ret) / **E** contest (yarışma).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Doctors say that ---- diseases such as diabetes need long-term treatment and regular check-ups, unlike short illnesses such as flu.$q$, array[$o$chronic$o$, $o$transparent$o$, $o$temporary$o$, $o$voluntary$o$, $o$adjacent$o$], 0, $e$1. Boşluğa **chronic** (kronik) gelir. Uzun süreli tedavi gerektiren hastalıklar kronik hastalıklardır.

Diğer şıklar: **B** transparent (saydam) / **C** temporary (geçici) / **D** voluntary (gönüllü) / **E** adjacent (bitişik).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The weather forecast ---- predicted the heavy snow, so the roads were closed before the storm arrived.$q$, array[$o$reluctantly$o$, $o$rarely$o$, $o$accurately$o$, $o$politely$o$, $o$hardly$o$], 2, $e$1. Boşluğa **accurately** (doğru biçimde) gelir. Yolların fırtınadan önce kapatılması tahminin doğru olduğunu gösterir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** rarely (nadiren) / **D** politely (kibarca) / **E** hardly (zar zor).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Children under twelve must be ---- by an adult when they enter the swimming pool, for safety reasons.$q$, array[$o$defeated$o$, $o$released$o$, $o$avoided$o$, $o$measured$o$, $o$accompanied$o$], 4, $e$1. Boşluğa **accompanied** (eşlik edilmek) gelir. Güvenlik için bir yetişkinle birlikte olmaları gerekir.

Diğer şıklar: **A** defeated (yenilmek) / **B** released (serbest bırakılmak) / **C** avoided (kaçınılmak) / **D** measured (ölçülmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$In many cities, old wooden houses have ---- modern apartment blocks, and only a few traditional buildings remain.$q$, array[$o$given way to$o$, $o$got over$o$, $o$run out of$o$, $o$made up for$o$, $o$set up$o$], 0, $e$1. Boşluğa **given way to** (yerini bırakmak) gelir. Eski evlerin yerini modern bloklara bırakması give way to ile söylenir.

Diğer şıklar: **B** got over (atlatmak) / **C** run out of (tükenmek) / **D** made up for (telafi etmek) / **E** set up (kurmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Many families prefer to live in ---- to a good school, so house prices in those neighbourhoods are usually higher.$q$, array[$o$contrast$o$, $o$response$o$, $o$proximity$o$, $o$favour$o$, $o$exchange$o$], 2, $e$1. Boşluğa **proximity** (yakınlık) gelir. İyi bir okula yakın oturmak, in proximity to kalıbıyla söylenir.

Diğer şıklar: **A** contrast (zıtlık) / **B** response (yanıt) / **D** favour (iyilik) / **E** exchange (değişim).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The results of the match were quite ----, as the strongest team in the league easily beat the weakest one.$q$, array[$o$astonishing$o$, $o$controversial$o$, $o$spontaneous$o$, $o$predictable$o$, $o$suspicious$o$], 3, $e$1. Boşluğa **predictable** (tahmin edilebilir) gelir. En güçlü takımın en zayıfı yenmesi tahmin edilebilir bir sonuçtur.

Diğer şıklar: **A** astonishing (şaşırtıcı) / **B** controversial (tartışmalı) / **C** spontaneous (kendiliğinden) / **E** suspicious (şüpheli).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The disagreement began over a small issue, but it ---- led to the end of a friendship that had lasted twenty years.$q$, array[$o$ultimately$o$, $o$barely$o$, $o$mildly$o$, $o$politely$o$, $o$vaguely$o$], 0, $e$1. Boşluğa **ultimately** (sonunda) gelir. Küçük bir sorunla başlayıp yirmi yıllık dostluğu bitiren olay sonunda böyle sonuçlanmıştır.

Diğer şıklar: **B** barely (zar zor) / **C** mildly (hafifçe) / **D** politely (kibarca) / **E** vaguely (belirsizce).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Some advertisements try to ---- consumers' emotions in order to make them buy products they do not really need.$q$, array[$o$evacuate$o$, $o$manipulate$o$, $o$absorb$o$, $o$commence$o$, $o$resign$o$], 1, $e$1. Boşluğa **manipulate** (manipüle etmek) gelir. İhtiyaç olmayan şeyi aldırmak için duyguları yönlendirmek manipülasyondur.

Diğer şıklar: **A** evacuate (tahliye etmek) / **C** absorb (emmek) / **D** commence (başlamak) / **E** resign (istifa etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Despite the heavy rain, the farmers decided to ---- working in the fields until all the wheat had been harvested.$q$, array[$o$pull out$o$, $o$hand in$o$, $o$carry on$o$, $o$sign up$o$, $o$wear out$o$], 2, $e$1. Boşluğa **carry on** (sürdürmek) gelir. Yağmura rağmen çalışmayı sürdürmek carry on'dur.

Diğer şıklar: **A** pull out (çekilmek) / **B** hand in (teslim etmek) / **D** sign up (kaydolmak) / **E** wear out (yıpratmak).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$Their first business ---- was a small coffee shop, but it was so successful that they soon opened branches in five other cities.$q$, array[$o$cabin$o$, $o$mortgage$o$, $o$stimulus$o$, $o$venture$o$, $o$quarrel$o$], 3, $e$1. Boşluğa **venture** (girişim) gelir. Beş şehirde şube açan işe girişim denir.

Diğer şıklar: **A** cabin (kulübe) / **B** mortgage (konut kredisi) / **C** stimulus (uyaran) / **E** quarrel (kavga).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The pilot said that the ---- behaviour of the engine, which sometimes worked normally and sometimes lost power for no apparent reason, made the flight dangerous.$q$, array[$o$consistent$o$, $o$reliable$o$, $o$steady$o$, $o$functional$o$, $o$erratic$o$], 4, $e$1. Boşluğa **erratic** (düzensiz) gelir. Bazen normal, bazen güç kaybeden motor düzensiz çalışır.

Diğer şıklar: **A** consistent (tutarlı) / **B** reliable (güvenilir) / **C** steady (sabit) / **D** functional (işlevsel).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The politician was ---- mistaken if he believed that the voters would forget the scandal after only a few weeks.$q$, array[$o$lightly$o$, $o$gravely$o$, $o$shyly$o$, $o$loosely$o$, $o$evenly$o$], 1, $e$1. Boşluğa **gravely** (ciddi biçimde) gelir. Seçmenin skandalı unutacağını sanmak ciddi bir yanılgıdır.

Diğer şıklar: **A** lightly (hafifçe) / **C** shyly (utangaçça) / **D** loosely (gevşekçe) / **E** evenly (eşit biçimde).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The famous footballer agreed to ---- the new sports brand, and his picture now appears on posters across the city.$q$, array[$o$endorse$o$, $o$suppress$o$, $o$frighten$o$, $o$deposit$o$, $o$erase$o$], 0, $e$1. Boşluğa **endorse** (desteklemek) gelir. Ünlü futbolcunun markayı afişlerde desteklemesi endorse ile söylenir.

Diğer şıklar: **B** suppress (bastırmak) / **C** frighten (korkutmak) / **D** deposit (yatırmak) / **E** erase (silmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Many English words ---- Latin, which is why speakers of Spanish and Italian often find them easy to learn.$q$, array[$o$head for$o$, $o$bring about$o$, $o$look after$o$, $o$derive from$o$, $o$put off$o$], 3, $e$1. Boşluğa **derive from** (-den türemek) gelir. İspanyolca ve İtalyanca konuşanlar Latince kökenli kelimeleri kolay öğrenir.

Diğer şıklar: **A** head for (yönelmek) / **B** bring about (neden olmak) / **C** look after (bakmak) / **E** put off (ertelemek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The ---- of the local population, who rebuilt their homes within months of the disaster, impressed the visiting officials.$q$, array[$o$hesitation$o$, $o$scarcity$o$, $o$negligence$o$, $o$hostility$o$, $o$resilience$o$], 4, $e$1. Boşluğa **resilience** (dayanıklılık) gelir. Felaketten aylar sonra evlerini yeniden yapan halkın direnci dayanıklılıktır.

Diğer şıklar: **A** hesitation (tereddüt) / **B** scarcity (kıtlık) / **C** negligence (ihmal) / **D** hostility (düşmanlık).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The ---- dictator showed no mercy to his opponents and had thousands of them imprisoned or killed.$q$, array[$o$generous$o$, $o$sensitive$o$, $o$ruthless$o$, $o$tolerant$o$, $o$humble$o$], 2, $e$1. Boşluğa **ruthless** (acımasız) gelir. Binlerce muhalifi hapseden veya öldüren diktatör acımasızdır.

Diğer şıklar: **A** generous (cömert) / **B** sensitive (hassas) / **D** tolerant (hoşgörülü) / **E** humble (alçakgönüllü).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Some people feel more energetic after eating sugar. ----, others feel tired and unable to concentrate.$q$, array[$o$Accordingly$o$, $o$Conversely$o$, $o$Similarly$o$, $o$Therefore$o$, $o$Thereby$o$], 1, $e$1. Boşluğa **Conversely** (Tersine) gelir. İkinci cümle birincinin tersini söylediği için Conversely gelir.

Diğer şıklar: **A** Accordingly (Buna göre) / **C** Similarly (Benzer biçimde) / **D** Therefore (Bu nedenle) / **E** Thereby (Böylece).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$When the argument between the two neighbours became violent, the police had to ---- to calm everyone down.$q$, array[$o$hibernate$o$, $o$inherit$o$, $o$wander$o$, $o$intervene$o$, $o$retire$o$], 3, $e$1. Boşluğa **intervene** (müdahale etmek) gelir. Kavgayı yatıştırmak için polisin araya girmesi gerekir.

Diğer şıklar: **A** hibernate (kış uykusuna yatmak) / **B** inherit (miras almak) / **C** wander (dolaşmak) / **E** retire (emekli olmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$All employees are expected to ---- the safety regulations, and those who ignore them may lose their jobs.$q$, array[$o$account for$o$, $o$cut down on$o$, $o$give rise to$o$, $o$run into$o$, $o$adhere to$o$], 4, $e$1. Boşluğa **adhere to** (bağlı kalmak) gelir. Kuralları görmezden gelenlerin işini kaybetmesi, kurallara uyma beklentisini gösterir.

Diğer şıklar: **A** account for (açıklamak) / **B** cut down on (azaltmak) / **C** give rise to (yol açmak) / **D** run into (karşılaşmak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 16
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 16$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Bacteria that develop ---- to antibiotics are becoming a serious problem, because drugs that once cured infections no longer work.$q$, array[$o$attraction$o$, $o$resistance$o$, $o$generosity$o$, $o$sympathy$o$, $o$humour$o$], 1, $e$1. Boşluğa **resistance** (direnç) gelir. İlaçların artık işe yaramaması bakterilerin direnç geliştirmesidir.

Diğer şıklar: **A** attraction (çekim) / **C** generosity (cömertlik) / **D** sympathy (sempati) / **E** humour (mizah).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Bacteria are so small that they can only be seen with a microscope, and the ---- creatures live in almost every place on Earth.$q$, array[$o$venomous$o$, $o$medieval$o$, $o$tribal$o$, $o$insistent$o$, $o$microscopic$o$], 4, $e$1. Boşluğa **microscopic** (mikroskobik) gelir. Yalnızca mikroskopla görülebilen canlılar mikroskobiktir.

Diğer şıklar: **A** venomous (zehirli) / **B** medieval (ortaçağa ait) / **C** tribal (kabileye ait) / **D** insistent (ısrarcı).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$She ---- left her phone at home on holiday, because she wanted to spend a week without checking messages or the news.$q$, array[$o$hardly$o$, $o$accidentally$o$, $o$deliberately$o$, $o$briefly$o$, $o$rarely$o$], 2, $e$1. Boşluğa **deliberately** (kasten) gelir. Bir hafta mesaj görmemek istemesi, telefonu bilerek bıraktığını gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** accidentally (kazara) / **D** briefly (kısaca) / **E** rarely (nadiren).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Heavy snow and strong winds ---- the rescue teams, making it almost impossible for them to reach the injured climbers.$q$, array[$o$hinder$o$, $o$assist$o$, $o$honour$o$, $o$recall$o$, $o$praise$o$], 0, $e$1. Boşluğa **hinder** (engellemek) gelir. Yaralılara ulaşmayı neredeyse imkânsız kılan kar ve rüzgâr ekiplere engel olur.

Diğer şıklar: **B** assist (yardım etmek) / **C** honour (onurlandırmak) / **D** recall (hatırlamak) / **E** praise (övmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The football season will ---- on the first Saturday of September with a match between last year's two finalists.$q$, array[$o$break down$o$, $o$kick off$o$, $o$give up$o$, $o$run out$o$, $o$fall behind$o$], 1, $e$1. Boşluğa **kick off** (başlamak) gelir. Sezonun ilk maçla başlaması kick off ile söylenir.

Diğer şıklar: **A** break down (bozulmak) / **C** give up (vazgeçmek) / **D** run out (tükenmek) / **E** fall behind (geride kalmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The robbers held a bank employee ---- for six hours and released him only after the police promised to let them leave the country.$q$, array[$o$verdict$o$, $o$tenant$o$, $o$ally$o$, $o$hostage$o$, $o$refuge$o$], 3, $e$1. Boşluğa **hostage** (rehine) gelir. Polisten taviz koparmak için tutulan kişi rehinedir.

Diğer şıklar: **A** verdict (karar) / **B** tenant (kiracı) / **C** ally (müttefik) / **E** refuge (sığınak).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Eating a healthy breakfast is ---- for children, because it gives them the energy they need to concentrate at school.$q$, array[$o$crucial$o$, $o$unnecessary$o$, $o$harmless$o$, $o$occasional$o$, $o$unfair$o$], 0, $e$1. Boşluğa **crucial** (hayati) gelir. Okulda odaklanmak için gereken enerji kahvaltının hayati olduğunu gösterir.

Diğer şıklar: **B** unnecessary (gereksiz) / **C** harmless (zararsız) / **D** occasional (ara sıra) / **E** unfair (haksız).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The two companies are ---- connected, because they have no business together, but both are owned by the same family.$q$, array[$o$directly$o$, $o$indirectly$o$, $o$openly$o$, $o$strongly$o$, $o$rapidly$o$], 1, $e$1. Boşluğa **indirectly** (dolaylı olarak) gelir. Aynı aileye ait olmaları dışında iş ilişkisi olmaması dolaylı bağlantıdır.

Diğer şıklar: **A** directly (doğrudan) / **C** openly (açıkça) / **D** strongly (güçlü biçimde) / **E** rapidly (hızla).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Further experiments are needed to ---- the results of the first study, since a single test cannot prove that a theory is correct.$q$, array[$o$ignore$o$, $o$disguise$o$, $o$validate$o$, $o$abandon$o$, $o$contrast$o$], 2, $e$1. Boşluğa **validate** (doğrulamak) gelir. Tek testin yeterli olmaması sonuçların yeni deneylerle doğrulanmasını gerektirir.

Diğer şıklar: **A** ignore (görmezden gelmek) / **B** disguise (gizlemek) / **D** abandon (terk etmek) / **E** contrast (karşılaştırmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The residents had to ---- the noise of the construction work for more than a year before the new bridge was finally opened.$q$, array[$o$catch up with$o$, $o$come up with$o$, $o$keep up with$o$, $o$put up with$o$, $o$get away with$o$], 3, $e$1. Boşluğa **put up with** (katlanmak) gelir. Bir yıl boyunca gürültüye katlanmak put up with ile söylenir.

Diğer şıklar: **A** catch up with (yetişmek) / **B** come up with (ortaya atmak) / **C** keep up with (ayak uydurmak) / **E** get away with (yanına kâr kalmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$A good knowledge of basic algebra and geometry is among the ---- for students who wish to take the advanced physics course.$q$, array[$o$pensions$o$, $o$hazards$o$, $o$farewells$o$, $o$sanctions$o$, $o$prerequisites$o$], 4, $e$1. Boşluğa **prerequisites** (ön koşullar) gelir. İleri fizik dersi için gereken temel bilgi ön koşuldur.

Diğer şıklar: **A** pensions (emekli maaşları) / **B** hazards (tehlikeler) / **C** farewells (veda) / **D** sanctions (yaptırımlar).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The scientist's claims were ---- because he had never published his data and refused to let anyone repeat his experiments.$q$, array[$o$reliable$o$, $o$questionable$o$, $o$flexible$o$, $o$adjacent$o$, $o$generous$o$], 1, $e$1. Boşluğa **questionable** (şüpheli) gelir. Verisini paylaşmayan bilim insanının iddiaları şüphelidir.

Diğer şıklar: **A** reliable (güvenilir) / **C** flexible (esnek) / **D** adjacent (bitişik) / **E** generous (cömert).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The mountain road is ---- dangerous, and every year dozens of drivers lose their lives on its sharp bends and narrow bridges.$q$, array[$o$notoriously$o$, $o$favourably$o$, $o$hardly$o$, $o$gracefully$o$, $o$mutually$o$], 0, $e$1. Boşluğa **notoriously** (kötü şöhretli biçimde) gelir. Her yıl onlarca sürücünün ölmesi yolun kötü şöhretli biçimde tehlikeli olduğunu gösterir.

Diğer şıklar: **B** favourably (olumlu biçimde) / **C** hardly (zar zor) / **D** gracefully (zarifçe) / **E** mutually (karşılıklı olarak).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Several recent studies seem to ---- the old belief that humans use only ten percent of their brains.$q$, array[$o$inherit$o$, $o$assemble$o$, $o$convey$o$, $o$refute$o$, $o$undertake$o$], 3, $e$1. Boşluğa **refute** (çürütmek) gelir. Yanlış bir inancı bilimsel çalışmalar çürütür.

Diğer şıklar: **A** inherit (miras almak) / **B** assemble (monte etmek) / **C** convey (iletmek) / **E** undertake (üstlenmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The hotel manager promised to ---- the problem immediately and sent a technician to repair the broken air conditioning.$q$, array[$o$get over$o$, $o$stand for$o$, $o$head for$o$, $o$bring up$o$, $o$see to$o$], 4, $e$1. Boşluğa **see to** (ilgilenmek) gelir. Teknisyen göndermek sorunla ilgilenmektir.

Diğer şıklar: **A** get over (atlatmak) / **B** stand for (anlamına gelmek) / **C** head for (yönelmek) / **D** bring up (gündeme getirmek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$To avoid depending on a single product, the company is working on the ---- of its activities, including tourism and renewable energy.$q$, array[$o$diversification$o$, $o$admission$o$, $o$evacuation$o$, $o$assumption$o$, $o$suspension$o$], 0, $e$1. Boşluğa **diversification** (çeşitlendirme) gelir. Tek ürüne bağımlılığı azaltmak için faaliyetlerin çeşitlendirilmesi gerekir.

Diğer şıklar: **B** admission (kabul) / **C** evacuation (tahliye) / **D** assumption (varsayım) / **E** suspension (askıya alma).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The snow leopard is a very ---- animal that lives in remote mountains and is so well hidden that even experts rarely see one in the wild.$q$, array[$o$abundant$o$, $o$hostile$o$, $o$elusive$o$, $o$sociable$o$, $o$ordinary$o$], 2, $e$1. Boşluğa **elusive** (yakalanması zor) gelir. Uzmanların bile nadiren gördüğü hayvan ele geçmezdir.

Diğer şıklar: **A** abundant (bol) / **B** hostile (düşmanca) / **D** sociable (sosyal) / **E** ordinary (sıradan).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The waiter ---- spilled soup on a customer's jacket and apologised many times, but the man was very angry.$q$, array[$o$deliberately$o$, $o$frequently$o$, $o$formally$o$, $o$unintentionally$o$, $o$lazily$o$], 3, $e$1. Boşluğa **unintentionally** (istemeden) gelir. Defalarca özür dilemesi çorbayı kasıtsız döktüğünü gösterir.

Diğer şıklar: **A** deliberately (kasten) / **B** frequently (sık sık) / **C** formally (resmen) / **E** lazily (tembelce).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The school decided to ---- the student who had been caught cheating in the final exam for the second time.$q$, array[$o$reward$o$, $o$admire$o$, $o$invite$o$, $o$promote$o$, $o$expel$o$], 4, $e$1. Boşluğa **expel** (okuldan atmak) gelir. İkinci kez kopya çeken öğrenciye uygulanan yaptırım okuldan atmaktır.

Diğer şıklar: **A** reward (ödüllendirmek) / **B** admire (hayran olmak) / **C** invite (davet etmek) / **D** promote (terfi ettirmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$Many of the country's economic problems ---- decisions made decades ago, when the government spent more money than it earned.$q$, array[$o$pass away$o$, $o$break out$o$, $o$stem from$o$, $o$give off$o$, $o$burn down$o$], 2, $e$1. Boşluğa **stem from** (-den kaynaklanmak) gelir. Sorunların eski kararlardan doğması stem from ile söylenir.

Diğer şıklar: **A** pass away (vefat etmek) / **B** break out (patlak vermek) / **D** give off (yaymak) / **E** burn down (yanıp kül olmak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

