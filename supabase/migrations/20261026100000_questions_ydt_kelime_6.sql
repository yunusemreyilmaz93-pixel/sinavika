-- 20261026100000_questions_ydt_kelime_6. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 31
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 31$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The river forms the natural ---- between the two countries, and the bridge over it is the only official crossing point.$q$, array[$o$boundary$o$, $o$reward$o$, $o$delay$o$, $o$privilege$o$, $o$audience$o$], 0, $e$1. Boşluğa **boundary** (sınır) gelir. İki ülkeyi ayıran nehir doğal bir sınırdır.

Diğer şıklar: **B** reward (ödül) / **C** delay (gecikme) / **D** privilege (ayrıcalık) / **E** audience (izleyici).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Fish are ---- in the lakes of the region, and fishing has been the main source of food for the local people for centuries.$q$, array[$o$scarce$o$, $o$abundant$o$, $o$fragile$o$, $o$hostile$o$, $o$remote$o$], 1, $e$1. Boşluğa **abundant** (bol) gelir. Yüzyıllardır ana besin olması balığın bol olduğunu gösterir.

Diğer şıklar: **A** scarce (kıt) / **C** fragile (kırılgan) / **D** hostile (düşmanca) / **E** remote (uzak).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$When he said he was dying of hunger, he did not mean it ----, and simply meant that he was very hungry.$q$, array[$o$hardly$o$, $o$sharply$o$, $o$mutually$o$, $o$barely$o$, $o$literally$o$], 4, $e$1. Boşluğa **literally** (kelimesi kelimesine) gelir. Çok acıkmış demek istemesi, sözü gerçek anlamıyla söylemediğini gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** sharply (keskin biçimde) / **C** mutually (karşılıklı olarak) / **D** barely (zar zor).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Students who study abroad often ---- a second language more quickly because they hear it in daily situations.$q$, array[$o$acquire$o$, $o$abolish$o$, $o$dispose$o$, $o$lament$o$, $o$refund$o$], 0, $e$1. Boşluğa **acquire** (edinmek) gelir. İkinci dili günlük hayatta edinmek acquire ile söylenir.

Diğer şıklar: **B** abolish (kaldırmak) / **C** dispose (elden çıkarmak) / **D** lament (yakınmak) / **E** refund (iade etmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The invention of the printing press ---- major changes in society, as knowledge became available to ordinary people.$q$, array[$o$held on$o$, $o$gave up$o$, $o$brought about$o$, $o$took after$o$, $o$ran out$o$], 2, $e$1. Boşluğa **brought about** (neden olmak) gelir. Toplumda büyük değişime yol açmak bring about ile söylenir.

Diğer şıklar: **A** held on (tutunmak) / **B** gave up (vazgeçmek) / **D** took after (benzemek) / **E** ran out (tükenmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The new coach showed great ---- to the club, working twelve hours a day and refusing offers from richer teams.$q$, array[$o$reluctance$o$, $o$punishment$o$, $o$suspicion$o$, $o$commitment$o$, $o$distance$o$], 3, $e$1. Boşluğa **commitment** (bağlılık) gelir. Daha zengin tekliflerini reddetmesi kulübe bağlılığını gösterir.

Diğer şıklar: **A** reluctance (isteksizlik) / **B** punishment (ceza) / **C** suspicion (şüphe) / **E** distance (mesafe).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Plastic is a cheap and ---- material, which explains why so many products, from toys to car parts, are made of it.$q$, array[$o$fragile$o$, $o$durable$o$, $o$perishable$o$, $o$scarce$o$, $o$brittle$o$], 1, $e$1. Boşluğa **durable** (dayanıklı) gelir. Oyuncaktan araba parçasına kadar kullanımı dayanıklılığı gösterir.

Diğer şıklar: **A** fragile (kırılgan) / **C** perishable (çabuk bozulan) / **D** scarce (kıt) / **E** brittle (kırılgan).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Women live longer than men, ---- speaking, although this does not mean that every woman will outlive her husband.$q$, array[$o$emotionally$o$, $o$generously$o$, $o$statistically$o$, $o$locally$o$, $o$hastily$o$], 2, $e$1. Boşluğa **statistically** (istatistiksel olarak) gelir. Her kadının eşinden uzun yaşamayacağını belirtmek ortalamaya dayalı bir ifadedir.

Diğer şıklar: **A** emotionally (duygusal olarak) / **B** generously (cömertçe) / **D** locally (yerel olarak) / **E** hastily (aceleyle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The librarian spent three years trying to ---- a complete list of all the books published in the region since 1900.$q$, array[$o$compile$o$, $o$ignore$o$, $o$persuade$o$, $o$minimise$o$, $o$suspect$o$], 0, $e$1. Boşluğa **compile** (derlemek) gelir. Kitapların tam listesini hazırlamak derlemektir.

Diğer şıklar: **B** ignore (görmezden gelmek) / **C** persuade (ikna etmek) / **D** minimise (en aza indirmek) / **E** suspect (şüphelenmek).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$The old wooden bridge ---- in a fire last winter, and the villagers have been asking for a new one ever since.$q$, array[$o$came up$o$, $o$burned down$o$, $o$set out$o$, $o$wore off$o$, $o$dropped in$o$], 1, $e$1. Boşluğa **burned down** (yanıp kül olmak) gelir. Yangında tamamen yok olan köprü burned down ile söylenir.

Diğer şıklar: **A** came up (ortaya çıkmak) / **C** set out (yola çıkmak) / **D** wore off (etkisini yitirmek) / **E** dropped in (uğramak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The strike caused serious ---- to public transport, and thousands of commuters had to walk or cycle to their workplaces.$q$, array[$o$assistance$o$, $o$compensation$o$, $o$promotion$o$, $o$disruption$o$, $o$supervision$o$], 3, $e$1. Boşluğa **disruption** (aksama) gelir. İşe yürüyerek gitmek zorunda kalmak ulaşımın aksamasının sonucudur.

Diğer şıklar: **A** assistance (yardım) / **B** compensation (tazminat) / **C** promotion (terfi) / **E** supervision (gözetim).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Remarkably, the ancient vase was found completely ---- after two thousand years under the sea, without a single crack.$q$, array[$o$extinct$o$, $o$obsolete$o$, $o$intact$o$, $o$defective$o$, $o$hostile$o$], 2, $e$1. Boşluğa **intact** (sağlam) gelir. Tek çatlağı olmayan vazo sağlam kalmıştır.

Diğer şıklar: **A** extinct (soyu tükenmiş) / **B** obsolete (modası geçmiş) / **D** defective (kusurlu) / **E** hostile (düşmanca).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The road will be ---- closed while engineers repair the damaged bridge, and it is expected to reopen within two weeks.$q$, array[$o$permanently$o$, $o$eternally$o$, $o$immensely$o$, $o$firmly$o$, $o$temporarily$o$], 4, $e$1. Boşluğa **temporarily** (geçici olarak) gelir. İki hafta içinde açılması kapanmanın geçici olduğunu gösterir.

Diğer şıklar: **A** permanently (kalıcı olarak) / **B** eternally (sonsuza dek) / **C** immensely (son derece) / **D** firmly (sıkıca).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Adding a small amount of lemon juice can ---- the flavour of the soup without making it taste sour.$q$, array[$o$weaken$o$, $o$decline$o$, $o$refuse$o$, $o$enhance$o$, $o$depart$o$], 3, $e$1. Boşluğa **enhance** (güçlendirmek) gelir. Çorbanın lezzetini ekşitmeden artırmak enhance ile söylenir.

Diğer şıklar: **A** weaken (zayıflatmak) / **B** decline (reddetmek) / **C** refuse (reddetmek) / **E** depart (ayrılmak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The government wants to ---- the process of issuing passports because people sometimes have to wait for months.$q$, array[$o$back down$o$, $o$speed up$o$, $o$hold out$o$, $o$look after$o$, $o$fall for$o$], 1, $e$1. Boşluğa **speed up** (hızlandırmak) gelir. Aylarca beklemeyi önlemek için işlemi hızlandırmak speed up ile söylenir.

Diğer şıklar: **A** back down (geri adım atmak) / **C** hold out (dayanmak) / **D** look after (bakmak) / **E** fall for (aşık olmak).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$Travelling to different countries gives young people a wider ---- on life and helps them to understand other cultures.$q$, array[$o$perspective$o$, $o$audience$o$, $o$decision$o$, $o$budget$o$, $o$alliance$o$], 0, $e$1. Boşluğa **perspective** (bakış açısı) gelir. Başka kültürleri anlamayı sağlayan şey daha geniş bir bakış açısıdır.

Diğer şıklar: **B** audience (izleyici) / **C** decision (karar) / **D** budget (bütçe) / **E** alliance (ittifak).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The president won the election with an ---- majority, receiving more than eighty percent of all votes.$q$, array[$o$eager$o$, $o$ambiguous$o$, $o$occasional$o$, $o$obscure$o$, $o$overwhelming$o$], 4, $e$1. Boşluğa **overwhelming** (ezici) gelir. Oyların yüzde seksenini almak ezici çoğunluktur.

Diğer şıklar: **A** eager (hevesli) / **B** ambiguous (belirsiz) / **C** occasional (ara sıra) / **D** obscure (belirsiz).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$With a six-goal lead after sixty minutes, the match was ---- over, and many spectators started to leave the stadium.$q$, array[$o$barely$o$, $o$hardly$o$, $o$practically$o$, $o$rarely$o$, $o$formerly$o$], 2, $e$1. Boşluğa **practically** (neredeyse) gelir. Altı gol farkıyla seyircilerin stadı terk etmesi maçın fiilen bittiğini gösterir.

Diğer şıklar: **A** barely (zar zor) / **B** hardly (neredeyse hiç) / **D** rarely (nadiren) / **E** formerly (eskiden).$e$, 1),
  (19, 'ydt-dil', null::integer, $q$The company refused to ---- the details of the agreement, claiming that they were confidential.$q$, array[$o$conceal$o$, $o$preserve$o$, $o$suppress$o$, $o$disclose$o$, $o$withhold$o$], 3, $e$1. Boşluğa **disclose** (açıklamak) gelir. Gizlilik gerekçesiyle ayrıntıları açıklamayı reddetmek disclose ile söylenir.

Diğer şıklar: **A** conceal (gizlemek) / **B** preserve (korumak) / **C** suppress (bastırmak) / **E** withhold (esirgemek).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The speaker ---- his talk by thanking the audience and inviting them to ask questions over coffee.$q$, array[$o$fell out$o$, $o$stood out$o$, $o$burnt out$o$, $o$backed out$o$, $o$wrapped up$o$], 4, $e$1. Boşluğa **wrapped up** (bitirmek) gelir. Teşekkür edip soruya davet ederek konuşmayı bitirmek wrap up ile söylenir.

Diğer şıklar: **A** fell out (tartışmak) / **B** stood out (öne çıkmak) / **C** burnt out (tükenmek) / **D** backed out (vazgeçmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 32
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 32$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Women in the 1950s faced strong ---- when they tried to enter professions such as medicine and law, which were considered suitable only for men.$q$, array[$o$hospitality$o$, $o$prejudice$o$, $o$reduction$o$, $o$fascination$o$, $o$assistance$o$], 1, $e$1. Boşluğa **prejudice** (önyargı) gelir. Mesleklerin yalnızca erkeğe uygun görülmesi önyargıdır.

Diğer şıklar: **A** hospitality (konukseverlik) / **C** reduction (azaltma) / **D** fascination (büyülenme) / **E** assistance (yardım).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Engineers say that building a tunnel under the sea is technically ----, but the cost would be much higher than the government can afford.$q$, array[$o$reluctant$o$, $o$deceptive$o$, $o$negligent$o$, $o$feasible$o$, $o$frugal$o$], 3, $e$1. Boşluğa **feasible** (uygulanabilir) gelir. Teknik olarak yapılabilir ama pahalı olan proje uygulanabilirdir.

Diğer şıklar: **A** reluctant (isteksiz) / **B** deceptive (aldatıcı) / **C** negligent (ihmalkâr) / **E** frugal (tutumlu).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$Pilots ---- check the weather conditions before taking off, because ignoring this step could put the passengers in danger.$q$, array[$o$invariably$o$, $o$seldom$o$, $o$reluctantly$o$, $o$carelessly$o$, $o$hardly$o$], 0, $e$1. Boşluğa **invariably** (değişmez biçimde) gelir. Yolcuları tehlikeye atabilecek adım her seferinde kontrol edilir.

Diğer şıklar: **B** seldom (nadiren) / **C** reluctantly (isteksizce) / **D** carelessly (dikkatsizce) / **E** hardly (zar zor).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Taking a warm bath can ---- muscle pain after a long day of physical work, although it will not cure the underlying problem.$q$, array[$o$aggravate$o$, $o$ignore$o$, $o$develop$o$, $o$stimulate$o$, $o$alleviate$o$], 4, $e$1. Boşluğa **alleviate** (hafifletmek) gelir. Asıl sorunu iyileştirmeden ağrıyı azaltmak alleviate ile söylenir.

Diğer şıklar: **A** aggravate (ağırlaştırmak) / **B** ignore (görmezden gelmek) / **C** develop (geliştirmek) / **D** stimulate (uyarmak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The explorers ---- to cross the desert in the early morning, before the temperature became too high to travel.$q$, array[$o$ran out$o$, $o$gave in$o$, $o$set out$o$, $o$broke down$o$, $o$held up$o$], 2, $e$1. Boşluğa **set out** (yola çıkmak) gelir. Sabah erkenden çölü geçmek için yola çıkmak set out ile söylenir.

Diğer şıklar: **A** ran out (tükenmek) / **B** gave in (pes etmek) / **D** broke down (bozulmak) / **E** held up (geciktirmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The strikers received messages of ---- from workers in other countries, who promised to support them with money and public protests.$q$, array[$o$deception$o$, $o$resignation$o$, $o$hostility$o$, $o$solidarity$o$, $o$indifference$o$], 3, $e$1. Boşluğa **solidarity** (dayanışma) gelir. Para ve protesto sözü veren işçiler dayanışma gösterir.

Diğer şıklar: **A** deception (aldatma) / **B** resignation (istifa) / **C** hostility (düşmanlık) / **E** indifference (ilgisizlik).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$Scientists have shown that the long-term use of certain chemicals is ---- to human health, and many of them are now banned.$q$, array[$o$beneficial$o$, $o$detrimental$o$, $o$indifferent$o$, $o$relevant$o$, $o$essential$o$], 1, $e$1. Boşluğa **detrimental** (zararlı) gelir. Yasaklanmalarına yol açan kimyasallar zararlıdır.

Diğer şıklar: **A** beneficial (yararlı) / **C** indifferent (kayıtsız) / **D** relevant (ilgili) / **E** essential (gerekli).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$Pelé is ---- the greatest footballer of all time, although some fans would say that Maradona or Messi was better.$q$, array[$o$arguably$o$, $o$flatly$o$, $o$vaguely$o$, $o$barely$o$, $o$lazily$o$], 0, $e$1. Boşluğa **arguably** (tartışmalı biçimde) gelir. Başkalarının farklı düşünebilmesi ifadenin tartışılabilir olduğunu gösterir.

Diğer şıklar: **B** flatly (kesin biçimde) / **C** vaguely (belirsizce) / **D** barely (zar zor) / **E** lazily (tembelce).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Poor roads and the lack of electricity continue to ---- economic development in the rural parts of the country.$q$, array[$o$foster$o$, $o$boost$o$, $o$hamper$o$, $o$promote$o$, $o$accelerate$o$], 2, $e$1. Boşluğa **hamper** (engellemek) gelir. Kötü yollar ve elektrik eksikliği gelişmeyi engeller.

Diğer şıklar: **A** foster (beslemek) / **B** boost (artırmak) / **D** promote (teşvik etmek) / **E** accelerate (hızlandırmak).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$In the meeting, one of the employees ---- the problem of low salaries, and several others agreed that it should be discussed.$q$, array[$o$put off$o$, $o$ran over$o$, $o$wore out$o$, $o$turned down$o$, $o$brought up$o$], 4, $e$1. Boşluğa **brought up** (gündeme getirmek) gelir. Maaş sorununu toplantıda açmak bring up ile söylenir.

Diğer şıklar: **A** put off (ertelemek) / **B** ran over (ezmek) / **C** wore out (yıpratmak) / **D** turned down (reddetmek).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$The country was in ---- after the president's sudden resignation, with protests in the streets and no clear idea about who would govern.$q$, array[$o$tranquillity$o$, $o$turmoil$o$, $o$harmony$o$, $o$prosperity$o$, $o$equilibrium$o$], 1, $e$1. Boşluğa **turmoil** (kargaşa) gelir. Protesto ve belirsizlik kargaşa yaratır.

Diğer şıklar: **A** tranquillity (huzur) / **C** harmony (uyum) / **D** prosperity (refah) / **E** equilibrium (denge).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$London is one of the most culturally ---- cities in the world, with residents from more than two hundred countries speaking over three hundred languages.$q$, array[$o$uniform$o$, $o$isolated$o$, $o$rigid$o$, $o$diverse$o$, $o$hostile$o$], 3, $e$1. Boşluğa **diverse** (çeşitli) gelir. İki yüz ülkeden insanın yaşaması kültürel çeşitliliktir.

Diğer şıklar: **A** uniform (tekdüze) / **B** isolated (yalıtılmış) / **C** rigid (katı) / **E** hostile (düşmanca).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The minister has ---- resigned, although the government has not yet made an official announcement about it.$q$, array[$o$reportedly$o$, $o$officially$o$, $o$formally$o$, $o$legally$o$, $o$strictly$o$], 0, $e$1. Boşluğa **reportedly** (söylentiye göre) gelir. Resmî açıklama olmaması istifanın haberlere dayandığını gösterir.

Diğer şıklar: **B** officially (resmen) / **C** formally (resmî olarak) / **D** legally (yasal olarak) / **E** strictly (kesinlikle).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Heavy fines are intended to ---- drivers from using their phones while driving, but many people still ignore the law.$q$, array[$o$persuade$o$, $o$invite$o$, $o$require$o$, $o$allow$o$, $o$deter$o$], 4, $e$1. Boşluğa **deter** (caydırmak) gelir. Ağır cezanın amacı sürücüleri caydırmaktır.

Diğer şıklar: **A** persuade (ikna etmek) / **B** invite (davet etmek) / **C** require (gerektirmek) / **D** allow (izin vermek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$A serious accident on the motorway ---- traffic for several hours, and many passengers missed their flights.$q$, array[$o$took on$o$, $o$held up$o$, $o$kept on$o$, $o$went off$o$, $o$passed on$o$], 1, $e$1. Boşluğa **held up** (geciktirmek) gelir. Uçuşları kaçırtan gecikme hold up ile söylenir.

Diğer şıklar: **A** took on (üstlenmek) / **C** kept on (sürdürmek) / **D** went off (bozulmak) / **E** passed on (aktarmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The company's ---- of its main competitor for two billion dollars made it the largest supplier of mobile phones in the world.$q$, array[$o$abolition$o$, $o$separation$o$, $o$acquisition$o$, $o$hesitation$o$, $o$dedication$o$], 2, $e$1. Boşluğa **acquisition** (satın alma) gelir. Rakip şirketi iki milyar dolara almak satın almadır.

Diğer şıklar: **A** abolition (kaldırma) / **B** separation (ayrılma) / **D** hesitation (tereddüt) / **E** dedication (adanmışlık).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Oil prices have been extremely ---- this year, rising by thirty percent in March and then falling just as fast in May.$q$, array[$o$stable$o$, $o$steady$o$, $o$modest$o$, $o$volatile$o$, $o$predictable$o$], 3, $e$1. Boşluğa **volatile** (oynak) gelir. Hızla yükselip düşen fiyatlar oynaktır.

Diğer şıklar: **A** stable (sabit) / **B** steady (istikrarlı) / **C** modest (mütevazı) / **E** predictable (tahmin edilebilir).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The committee voted ---- in favour of the proposal, and not a single member raised an objection.$q$, array[$o$unanimously$o$, $o$narrowly$o$, $o$partially$o$, $o$reluctantly$o$, $o$hardly$o$], 0, $e$1. Boşluğa **unanimously** (oybirliğiyle) gelir. Tek itiraz olmaması oybirliğini gösterir.

Diğer şıklar: **B** narrowly (ucu ucuna) / **C** partially (kısmen) / **D** reluctantly (isteksizce) / **E** hardly (zar zor).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Dust and dirt slowly ---- on the surface of the table if it is not cleaned regularly.$q$, array[$o$evaporate$o$, $o$resign$o$, $o$compare$o$, $o$retreat$o$, $o$accumulate$o$], 4, $e$1. Boşluğa **accumulate** (birikmek) gelir. Temizlenmeyen masada toz birikir.

Diğer şıklar: **A** evaporate (buharlaşmak) / **B** resign (istifa etmek) / **C** compare (karşılaştırmak) / **D** retreat (geri çekilmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$After the television appeal, donations began to ---- from all over the country, and within a week they had reached a million pounds.$q$, array[$o$sort out$o$, $o$switch on$o$, $o$pour in$o$, $o$carry out$o$, $o$back off$o$], 2, $e$1. Boşluğa **pour in** (akın etmek) gelir. Bir haftada bir milyon sterline ulaşan bağışlar akın etmiştir.

Diğer şıklar: **A** sort out (çözmek) / **B** switch on (açmak) / **D** carry out (gerçekleştirmek) / **E** back off (geri çekilmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 33
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 33$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The film challenges the common ---- that older people cannot learn to use new technology, showing a grandmother who builds websites.$q$, array[$o$stereotype$o$, $o$ingredient$o$, $o$hardship$o$, $o$witness$o$, $o$ritual$o$], 0, $e$1. Boşluğa **stereotype** (basmakalıp yargı) gelir. Yaşlıların teknolojiyi öğrenemeyeceği düşüncesi bir basmakalıp yargıdır.

Diğer şıklar: **B** ingredient (bileşen) / **C** hardship (zorluk) / **D** witness (tanık) / **E** ritual (ritüel).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Weather experts have warned that a storm is ----, and residents of the coast have been told to leave their homes immediately.$q$, array[$o$distant$o$, $o$reluctant$o$, $o$rural$o$, $o$obsolete$o$, $o$imminent$o$], 4, $e$1. Boşluğa **imminent** (yakın) gelir. Hemen tahliye uyarısı fırtınanın çok yakın olduğunu gösterir.

Diğer şıklar: **A** distant (uzak) / **B** reluctant (isteksiz) / **C** rural (kırsal) / **D** obsolete (modası geçmiş).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$He travelled to the city ---- to attend a conference, but in fact he spent most of his time visiting friends and relatives.$q$, array[$o$genuinely$o$, $o$urgently$o$, $o$ostensibly$o$, $o$fluently$o$, $o$mutually$o$], 2, $e$1. Boşluğa **ostensibly** (güya) gelir. Asıl amaç başka olduğuna göre konferans bahanesi güya söylenmiştir.

Diğer şıklar: **A** genuinely (gerçekten) / **B** urgently (acilen) / **D** fluently (akıcı biçimde) / **E** mutually (karşılıklı olarak).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$The government decided to ---- spending on defence in order to provide more money for schools and hospitals.$q$, array[$o$curtail$o$, $o$exaggerate$o$, $o$imitate$o$, $o$accomplish$o$, $o$disclose$o$], 0, $e$1. Boşluğa **curtail** (kısıtlamak) gelir. Okul ve hastaneye pay ayırmak için harcamayı kısmak curtail ile söylenir.

Diğer şıklar: **B** exaggerate (abartmak) / **C** imitate (taklit etmek) / **D** accomplish (başarmak) / **E** disclose (açıklamak).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$Most of the committee members were willing to ---- the chairman's proposal, though a few of them had some doubts.$q$, array[$o$get through$o$, $o$go along with$o$, $o$cut across$o$, $o$hold out$o$, $o$pour in$o$], 1, $e$1. Boşluğa **go along with** (uymak) gelir. Başkanın önerisini kabullenmek go along with ile söylenir.

Diğer şıklar: **A** get through (geçmek) / **C** cut across (aşmak) / **D** hold out (dayanmak) / **E** pour in (akın etmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Residents in the ---- of the factory complain about the smoke, and many of them have asked the council to move it elsewhere.$q$, array[$o$absence$o$, $o$fragment$o$, $o$ambition$o$, $o$vicinity$o$, $o$distinction$o$], 3, $e$1. Boşluğa **vicinity** (çevre) gelir. Fabrikanın yakınında oturanlar duman şikâyetinde bulunur.

Diğer şıklar: **A** absence (yokluk) / **B** fragment (parça) / **C** ambition (hırs) / **E** distinction (ayrım).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$Selling souvenirs to tourists has become a ---- business for many families in the village, who earn more than farmers.$q$, array[$o$lucrative$o$, $o$feeble$o$, $o$tedious$o$, $o$hollow$o$, $o$gloomy$o$], 0, $e$1. Boşluğa **lucrative** (kazançlı) gelir. Çiftçiden çok kazandıran iş kazançlıdır.

Diğer şıklar: **B** feeble (zayıf) / **C** tedious (sıkıcı) / **D** hollow (boş) / **E** gloomy (kasvetli).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The harvest failed because of the drought. ----, food prices rose sharply in the following months.$q$, array[$o$Otherwise$o$, $o$Consequently$o$, $o$Meanwhile$o$, $o$Likewise$o$, $o$Instead$o$], 1, $e$1. Boşluğa **Consequently** (Sonuç olarak) gelir. Mahsul kaybı fiyat artışının nedenidir.

Diğer şıklar: **A** Otherwise (Aksi takdirde) / **C** Meanwhile (Bu arada) / **D** Likewise (Aynı şekilde) / **E** Instead (Bunun yerine).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$The soldiers had to ---- freezing temperatures and very little food during the long march across the mountains.$q$, array[$o$invent$o$, $o$afford$o$, $o$assemble$o$, $o$endure$o$, $o$pronounce$o$], 3, $e$1. Boşluğa **endure** (dayanmak) gelir. Dondurucu soğuğa ve az yiyeceğe katlanmak endure ile söylenir.

Diğer şıklar: **A** invent (icat etmek) / **B** afford (gücü yetmek) / **C** assemble (bir araya getirmek) / **E** pronounce (telaffuz etmek).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$It was a difficult week, but she managed to ---- all her exams and now she is looking forward to the holidays.$q$, array[$o$put out$o$, $o$run over$o$, $o$get through$o$, $o$switch off$o$, $o$look up$o$], 2, $e$1. Boşluğa **get through** (atlatmak) gelir. Zor haftada tüm sınavları atlatmak get through ile söylenir.

Diğer şıklar: **A** put out (söndürmek) / **B** run over (ezmek) / **D** switch off (kapatmak) / **E** look up (aramak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The mayor has strongly denied the ---- that he accepted money from a construction company in return for building permits.$q$, array[$o$apology$o$, $o$exhibition$o$, $o$pension$o$, $o$harvest$o$, $o$allegation$o$], 4, $e$1. Boşluğa **allegation** (iddia) gelir. Rüşvet aldığı yönünde ortaya atılan suçlama bir iddiadır.

Diğer şıklar: **A** apology (özür) / **B** exhibition (sergi) / **C** pension (emekli maaşı) / **D** harvest (hasat).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$He was so ---- that he believed every story the salesman told him and bought a machine that was completely useless.$q$, array[$o$sceptical$o$, $o$cautious$o$, $o$experienced$o$, $o$gullible$o$, $o$wary$o$], 3, $e$1. Boşluğa **gullible** (saf) gelir. Her söze inanıp işe yaramaz makine almak safdillikle ilgilidir.

Diğer şıklar: **A** sceptical (kuşkucu) / **B** cautious (temkinli) / **C** experienced (deneyimli) / **E** wary (ihtiyatlı).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The test was extremely difficult. ----, almost all the students managed to pass it thanks to careful preparation.$q$, array[$o$Therefore$o$, $o$Similarly$o$, $o$Nevertheless$o$, $o$Besides$o$, $o$Meanwhile$o$], 2, $e$1. Boşluğa **Nevertheless** (Yine de) gelir. Zor olmasına karşın sınavın geçilmesi karşıtlık bildirir.

Diğer şıklar: **A** Therefore (Bu nedenle) / **B** Similarly (Benzer biçimde) / **D** Besides (Ayrıca) / **E** Meanwhile (Bu arada).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Some medicines can ---- sleep, which is why drivers should not take them before getting behind the wheel.$q$, array[$o$prevent$o$, $o$induce$o$, $o$withhold$o$, $o$reject$o$, $o$abandon$o$], 1, $e$1. Boşluğa **induce** (uyandırmak) gelir. Sürücülerin almaması gereken ilaç uyku getirir.

Diğer şıklar: **A** prevent (önlemek) / **C** withhold (esirgemek) / **D** reject (reddetmek) / **E** abandon (terk etmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The villagers could only ---- for a few more days, since their food supplies were almost finished and help had not arrived.$q$, array[$o$pull off$o$, $o$check in$o$, $o$wear off$o$, $o$look on$o$, $o$hold out$o$], 4, $e$1. Boşluğa **hold out** (dayanmak) gelir. Yiyecek bitmek üzereyken birkaç gün daha dayanmak hold out ile söylenir.

Diğer şıklar: **A** pull off (başarmak) / **B** check in (giriş yapmak) / **C** wear off (etkisini yitirmek) / **D** look on (seyretmek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The ---- of fresh water in the desert has forced people to travel long distances to find wells that have not dried up.$q$, array[$o$abundance$o$, $o$delivery$o$, $o$scarcity$o$, $o$diversity$o$, $o$reputation$o$], 2, $e$1. Boşluğa **scarcity** (kıtlık) gelir. Kuyu için uzun yol gitmek tatlı su kıtlığının sonucudur.

Diğer şıklar: **A** abundance (bolluk) / **B** delivery (teslimat) / **D** diversity (çeşitlilik) / **E** reputation (itibar).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$When the factory introduced robots, hundreds of workers became ---- and had to look for jobs in other industries.$q$, array[$o$redundant$o$, $o$valuable$o$, $o$essential$o$, $o$eligible$o$, $o$reliable$o$], 0, $e$1. Boşluğa **redundant** (işsiz kalan) gelir. Başka sektörde iş aramak zorunda kalan işçiler fazlalık hâline gelmiştir.

Diğer şıklar: **B** valuable (değerli) / **C** essential (gerekli) / **D** eligible (uygun) / **E** reliable (güvenilir).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The flight has been delayed ----, and passengers have been told that they may have to stay at the airport overnight.$q$, array[$o$barely$o$, $o$indefinitely$o$, $o$sharply$o$, $o$densely$o$, $o$scarcely$o$], 1, $e$1. Boşluğa **indefinitely** (süresiz olarak) gelir. Gece havalimanında kalma ihtimali gecikmenin süresiz olduğunu gösterir.

Diğer şıklar: **A** barely (zar zor) / **C** sharply (keskin biçimde) / **D** densely (yoğun biçimde) / **E** scarcely (zar zor).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The pain should ---- within a few hours, but if it gets worse you should contact your doctor.$q$, array[$o$expand$o$, $o$inherit$o$, $o$assemble$o$, $o$subside$o$, $o$pursue$o$], 3, $e$1. Boşluğa **subside** (dinmek) gelir. Birkaç saatte hafiflemesi beklenen ağrı dinecektir.

Diğer şıklar: **A** expand (genişlemek) / **B** inherit (miras almak) / **C** assemble (toplanmak) / **E** pursue (peşinden gitmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The new road will ---- the national park and will certainly harm the habitat of many rare birds living there.$q$, array[$o$call on$o$, $o$back up$o$, $o$hold up$o$, $o$wear out$o$, $o$cut across$o$], 4, $e$1. Boşluğa **cut across** (ikiye bölmek) gelir. Milli parkı boydan boya kesen yol cut across ile söylenir.

Diğer şıklar: **A** call on (ziyaret etmek) / **B** back up (desteklemek) / **C** hold up (geciktirmek) / **D** wear out (yıpratmak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 34
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 34$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The events of the novel are not told in the order in which they happened, and readers have to put them back into the correct ----.$q$, array[$o$budget$o$, $o$mixture$o$, $o$defence$o$, $o$quotation$o$, $o$sequence$o$], 4, $e$1. Boşluğa **sequence** (sıra) gelir. Olayların doğru sıraya konması gerekir.

Diğer şıklar: **A** budget (bütçe) / **B** mixture (karışım) / **C** defence (savunma) / **D** quotation (alıntı).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The shop sells only ---- leather bags, not cheap copies made of plastic, so its prices are rather high.$q$, array[$o$fake$o$, $o$genuine$o$, $o$imaginary$o$, $o$temporary$o$, $o$accidental$o$], 1, $e$1. Boşluğa **genuine** (gerçek) gelir. Plastik taklit olmayan çantalar gerçek deridendir.

Diğer şıklar: **A** fake (sahte) / **C** imaginary (hayali) / **D** temporary (geçici) / **E** accidental (tesadüfi).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Bangladesh is one of the most ---- populated countries in the world, with more than a thousand people per square kilometre.$q$, array[$o$sparsely$o$, $o$lightly$o$, $o$barely$o$, $o$densely$o$, $o$casually$o$], 3, $e$1. Boşluğa **densely** (yoğun biçimde) gelir. Kilometrekareye bin kişiden fazla düşmesi yoğun nüfusu gösterir.

Diğer şıklar: **A** sparsely (seyrek biçimde) / **B** lightly (hafifçe) / **C** barely (zar zor) / **E** casually (gelişigüzel).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The programme aims to ---- friendship between young people from different countries by organising summer camps every year.$q$, array[$o$abolish$o$, $o$criticise$o$, $o$foster$o$, $o$interrupt$o$, $o$postpone$o$], 2, $e$1. Boşluğa **foster** (beslemek) gelir. Yaz kamplarıyla dostluğu geliştirmek foster ile söylenir.

Diğer şıklar: **A** abolish (kaldırmak) / **B** criticise (eleştirmek) / **D** interrupt (bölmek) / **E** postpone (ertelemek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$With such a small salary, it is difficult for families to ---- in a city where rent and food are so expensive.$q$, array[$o$get by$o$, $o$take on$o$, $o$pull off$o$, $o$show up$o$, $o$wear off$o$], 0, $e$1. Boşluğa **get by** (idare etmek) gelir. Küçük maaşla pahalı şehirde idare etmek get by ile söylenir.

Diğer şıklar: **B** take on (üstlenmek) / **C** pull off (başarmak) / **D** show up (ortaya çıkmak) / **E** wear off (etkisini yitirmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The government spends a large part of its budget on social ----, including pensions, unemployment benefits and free healthcare for the poor.$q$, array[$o$hostility$o$, $o$fiction$o$, $o$vocabulary$o$, $o$decoration$o$, $o$welfare$o$], 4, $e$1. Boşluğa **welfare** (sosyal yardım) gelir. Emekli maaşı ve sağlık hizmeti sosyal refah harcamalarıdır.

Diğer şıklar: **A** hostility (düşmanlık) / **B** fiction (kurgu) / **C** vocabulary (kelime hazinesi) / **D** decoration (süsleme).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The school has very ---- rules about uniforms and behaviour, and students who break them are punished without exception.$q$, array[$o$flexible$o$, $o$rigid$o$, $o$generous$o$, $o$casual$o$, $o$optional$o$], 1, $e$1. Boşluğa **rigid** (katı) gelir. İstisnasız ceza verilen kurallar katıdır.

Diğer şıklar: **A** flexible (esnek) / **C** generous (cömert) / **D** casual (gelişigüzel) / **E** optional (isteğe bağlı).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Doctors ---- recommend that children get at least nine hours of sleep a night during the school period.$q$, array[$o$strongly$o$, $o$hardly$o$, $o$barely$o$, $o$scarcely$o$, $o$vaguely$o$], 0, $e$1. Boşluğa **strongly** (kuvvetle) gelir. Doktorların güçlü önerisi strongly recommend ile söylenir.

Diğer şıklar: **B** hardly (zar zor) / **C** barely (zar zor) / **D** scarcely (neredeyse hiç) / **E** vaguely (belirsizce).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$The government decided to ---- a new tax on sugary drinks in order to reduce their consumption among teenagers.$q$, array[$o$inherit$o$, $o$admire$o$, $o$reveal$o$, $o$impose$o$, $o$gather$o$], 3, $e$1. Boşluğa **impose** (uygulamak) gelir. Tüketimi azaltmak için yeni vergi koymak impose ile söylenir.

Diğer şıklar: **A** inherit (miras almak) / **B** admire (hayran olmak) / **C** reveal (ortaya çıkarmak) / **E** gather (toplamak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The driver did not see the cyclist in the dark and nearly ---- him, but fortunately the cyclist jumped aside in time.$q$, array[$o$wore out$o$, $o$gave in$o$, $o$ran over$o$, $o$set up$o$, $o$dropped out$o$], 2, $e$1. Boşluğa **ran over** (ezmek) gelir. Neredeyse bisikletliyi ezmek run over ile söylenir.

Diğer şıklar: **A** wore out (yıpratmak) / **B** gave in (pes etmek) / **D** set up (kurmak) / **E** dropped out (bırakmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The explorers spent three months in the Arctic ----, where there are no roads, no villages and not a single human being for hundreds of kilometres.$q$, array[$o$cathedral$o$, $o$wilderness$o$, $o$institution$o$, $o$factory$o$, $o$reception$o$], 1, $e$1. Boşluğa **wilderness** (ıssız doğa) gelir. Yol ve köyün bulunmadığı bölge ıssız doğadır.

Diğer şıklar: **A** cathedral (katedral) / **C** institution (kurum) / **D** factory (fabrika) / **E** reception (resepsiyon).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Typewriters became ---- when computers appeared, and today they are found only in museums or in the homes of collectors.$q$, array[$o$indispensable$o$, $o$fertile$o$, $o$humid$o$, $o$unanimous$o$, $o$obsolete$o$], 4, $e$1. Boşluğa **obsolete** (modası geçmiş) gelir. Yalnızca müzede bulunan daktilolar modası geçmiştir.

Diğer şıklar: **A** indispensable (vazgeçilmez) / **B** fertile (verimli) / **C** humid (nemli) / **D** unanimous (oybirliğiyle).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The road turns ---- to the left just after the bridge, so drivers should reduce their speed before entering the bend.$q$, array[$o$gently$o$, $o$lazily$o$, $o$sharply$o$, $o$politely$o$, $o$mildly$o$], 2, $e$1. Boşluğa **sharply** (keskin biçimde) gelir. Hızı düşürmek gerektiği için dönüş keskindir.

Diğer şıklar: **A** gently (yumuşakça) / **B** lazily (tembelce) / **D** politely (kibarca) / **E** mildly (hafifçe).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Heavy rain forced the organisers to ---- the match for almost an hour, but play resumed when the clouds cleared.$q$, array[$o$halt$o$, $o$start$o$, $o$enjoy$o$, $o$extend$o$, $o$reward$o$], 0, $e$1. Boşluğa **halt** (durdurmak) gelir. Bulutlar dağılınca yeniden başlayan maç durdurulmuştur.

Diğer şıklar: **B** start (başlatmak) / **C** enjoy (keyif almak) / **D** extend (uzatmak) / **E** reward (ödüllendirmek).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Many students ---- of university in their first year because they cannot afford the fees or find the courses too difficult.$q$, array[$o$sit out$o$, $o$drop out$o$, $o$try out$o$, $o$work out$o$, $o$hang out$o$], 1, $e$1. Boşluğa **drop out** (bırakmak) gelir. Üniversiteyi yarıda bırakmak drop out of ile söylenir.

Diğer şıklar: **A** sit out (beklemek) / **C** try out (denemek) / **D** work out (çözmek) / **E** hang out (takılmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The concert was a ---- to the famous singer who had died the previous year, and all the songs were from her best-known albums.$q$, array[$o$complaint$o$, $o$forecast$o$, $o$command$o$, $o$tribute$o$, $o$rival$o$], 3, $e$1. Boşluğa **tribute** (saygı gösterisi) gelir. Geçen yıl ölen şarkıcıyı anmak için verilen konser bir anma gösterisidir.

Diğer şıklar: **A** complaint (şikâyet) / **B** forecast (tahmin) / **C** command (emir) / **E** rival (rakip).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Corruption is ---- in some countries, where almost every official expects to receive money in return for helping citizens.$q$, array[$o$rare$o$, $o$unusual$o$, $o$isolated$o$, $o$impossible$o$, $o$widespread$o$], 4, $e$1. Boşluğa **widespread** (yaygın) gelir. Hemen her görevlinin para beklemesi yolsuzluğun yaygın olduğunu gösterir.

Diğer şıklar: **A** rare (nadir) / **B** unusual (alışılmadık) / **C** isolated (yalıtılmış) / **D** impossible (imkânsız).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The bridge was not ---- strong to carry heavy lorries, so only cars and small vans were allowed to cross it.$q$, array[$o$sufficiently$o$, $o$barely$o$, $o$scarcely$o$, $o$hardly$o$, $o$fiercely$o$], 0, $e$1. Boşluğa **sufficiently** (yeterince) gelir. Ağır kamyonları taşıyacak kadar güçlü olmaması yeterince güçlü olmamaktır.

Diğer şıklar: **B** barely (zar zor) / **C** scarcely (neredeyse hiç) / **D** hardly (neredeyse hiç) / **E** fiercely (şiddetle).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The teacher used a simple drawing to ---- how the heart pumps blood around the body, and the students understood at once.$q$, array[$o$fabricate$o$, $o$exhaust$o$, $o$conquer$o$, $o$illustrate$o$, $o$bargain$o$], 3, $e$1. Boşluğa **illustrate** (göstermek) gelir. Çizimle bir işleyişi açıklamak illustrate ile söylenir.

Diğer şıklar: **A** fabricate (uydurmak) / **B** exhaust (tüketmek) / **C** conquer (fethetmek) / **E** bargain (pazarlık etmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$Only twelve people ---- for the first lesson, so the teacher decided to postpone the course until more students had registered.$q$, array[$o$gave off$o$, $o$wore out$o$, $o$showed up$o$, $o$went off$o$, $o$put on$o$], 2, $e$1. Boşluğa **showed up** (gelmek) gelir. Yalnızca on iki kişinin derse gelmesi show up ile söylenir.

Diğer şıklar: **A** gave off (yaymak) / **B** wore out (yıpratmak) / **D** went off (bozulmak) / **E** put on (giymek).$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 35
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 35$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Political ---- is essential for economic growth, because investors are unwilling to put their money into countries where governments change every few months.$q$, array[$o$rivalry$o$, $o$stability$o$, $o$fatigue$o$, $o$curiosity$o$, $o$privacy$o$], 1, $e$1. Boşluğa **stability** (istikrar) gelir. Hükümetlerin sık değiştiği ülkeden yatırımcı kaçar, istikrar gerekir.

Diğer şıklar: **A** rivalry (rekabet) / **C** fatigue (yorgunluk) / **D** curiosity (merak) / **E** privacy (gizlilik).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The map is not very ----, so travellers may easily lose their way in the narrow streets of the old town.$q$, array[$o$reluctant$o$, $o$generous$o$, $o$tedious$o$, $o$fluent$o$, $o$accurate$o$], 4, $e$1. Boşluğa **accurate** (doğru) gelir. Yolcuların kaybolması haritanın doğru olmadığını gösterir.

Diğer şıklar: **A** reluctant (isteksiz) / **B** generous (cömert) / **C** tedious (sıkıcı) / **D** fluent (akıcı).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The old man complained ---- about the noise from the street, and in the end he decided to move to a quieter neighbourhood.$q$, array[$o$hardly$o$, $o$barely$o$, $o$lightly$o$, $o$constantly$o$, $o$politely$o$], 3, $e$1. Boşluğa **constantly** (sürekli) gelir. Sonunda taşınmaya karar vermesi şikâyetin sürekli olduğunu gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** barely (zar zor) / **C** lightly (hafifçe) / **E** politely (kibarca).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Scientists will ---- the samples of soil taken from the field to find out whether they contain dangerous chemicals.$q$, array[$o$analyse$o$, $o$bury$o$, $o$spoil$o$, $o$invite$o$, $o$comfort$o$], 0, $e$1. Boşluğa **analyse** (incelemek) gelir. Toprak örneklerini kimyasal için incelemek analiz etmektir.

Diğer şıklar: **B** bury (gömmek) / **C** spoil (bozmak) / **D** invite (davet etmek) / **E** comfort (teselli etmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I missed the first week of lessons because I was ill, so I have to work hard to ---- the rest of the class.$q$, array[$o$look out for$o$, $o$catch up with$o$, $o$put up with$o$, $o$get away with$o$, $o$do away with$o$], 1, $e$1. Boşluğa **catch up with** (yetişmek) gelir. Kaçırılan haftayı telafi edip sınıfa yetişmek catch up with ile söylenir.

Diğer şıklar: **A** look out for (dikkat etmek) / **C** put up with (katlanmak) / **D** get away with (yanına kâr kalmak) / **E** do away with (kaldırmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The country produces a large ---- of wheat every year, and the extra grain is sold to neighbouring countries at a good price.$q$, array[$o$shortage$o$, $o$sacrifice$o$, $o$surplus$o$, $o$reception$o$, $o$rumour$o$], 2, $e$1. Boşluğa **surplus** (fazlalık) gelir. Komşulara satılan fazla buğday üretim fazlasıdır.

Diğer şıklar: **A** shortage (kıtlık) / **B** sacrifice (fedakârlık) / **D** reception (resepsiyon) / **E** rumour (söylenti).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The hospital did not have ---- equipment to treat so many patients at the same time, so some were sent to other cities.$q$, array[$o$adequate$o$, $o$excessive$o$, $o$luxurious$o$, $o$decorative$o$, $o$obsolete$o$], 0, $e$1. Boşluğa **adequate** (yeterli) gelir. Hastaların başka şehre gönderilmesi ekipmanın yetersiz olduğunu gösterir.

Diğer şıklar: **B** excessive (aşırı) / **C** luxurious (lüks) / **D** decorative (dekoratif) / **E** obsolete (modası geçmiş).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The disease affects ---- young children and elderly people, whose immune systems are weaker than those of healthy adults.$q$, array[$o$scarcely$o$, $o$casually$o$, $o$mildly$o$, $o$chiefly$o$, $o$lazily$o$], 3, $e$1. Boşluğa **chiefly** (başlıca) gelir. Bağışıklığı zayıf iki grubun başlıca etkilendiği anlatılır.

Diğer şıklar: **A** scarcely (zar zor) / **B** casually (gelişigüzel) / **C** mildly (hafifçe) / **E** lazily (tembelce).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$It took the climbers almost a week to ---- the summit of the mountain, where they spent only ten minutes before starting the long journey down.$q$, array[$o$abandon$o$, $o$surround$o$, $o$attain$o$, $o$inform$o$, $o$punish$o$], 2, $e$1. Boşluğa **attain** (ulaşmak) gelir. Zirveye bir haftada ulaşmak attain ile söylenir.

Diğer şıklar: **A** abandon (terk etmek) / **B** surround (kuşatmak) / **D** inform (bilgilendirmek) / **E** punish (cezalandırmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Before you sign the contract, it is a good idea to ---- the company's reputation by reading reviews written by former customers.$q$, array[$o$hold back$o$, $o$cut in$o$, $o$give away$o$, $o$run off$o$, $o$check out$o$], 4, $e$1. Boşluğa **check out** (araştırmak) gelir. Yorumları okuyarak şirketi incelemek check out ile söylenir.

Diğer şıklar: **A** hold back (engellemek) / **B** cut in (lafa girmek) / **C** give away (bedavaya vermek) / **D** run off (kaçmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Prices have crossed the ---- of what most families can afford, and many have started to buy cheaper products or to go without.$q$, array[$o$harvest$o$, $o$threshold$o$, $o$rehearsal$o$, $o$vacancy$o$, $o$hobby$o$], 1, $e$1. Boşluğa **threshold** (eşik) gelir. Ailelerin karşılayabileceği sınırın aşılması eşiğin geçilmesidir.

Diğer şıklar: **A** harvest (hasat) / **C** rehearsal (prova) / **D** vacancy (boş kadro) / **E** hobby (hobi).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The ---- heat of the summer makes outdoor work almost impossible in the afternoon, so farmers start before sunrise.$q$, array[$o$mild$o$, $o$moderate$o$, $o$intense$o$, $o$gentle$o$, $o$pleasant$o$], 2, $e$1. Boşluğa **intense** (yoğun) gelir. Öğleden sonra dışarıda çalışmayı imkânsız kılan sıcak yoğundur.

Diğer şıklar: **A** mild (ılıman) / **B** moderate (ılımlı) / **D** gentle (yumuşak) / **E** pleasant (hoş).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The population of the region is ---- Muslim, although there are also small Christian and Jewish communities.$q$, array[$o$marginally$o$, $o$narrowly$o$, $o$tightly$o$, $o$predominantly$o$, $o$briefly$o$], 3, $e$1. Boşluğa **predominantly** (ağırlıklı olarak) gelir. Küçük topluluklara rağmen nüfusun ağırlığı Müslümanlardır.

Diğer şıklar: **A** marginally (çok az) / **B** narrowly (ucu ucuna) / **C** tightly (sıkıca) / **E** briefly (kısaca).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Some companies ---- cheap labour in poor countries, paying workers very low wages and making them work in unsafe conditions.$q$, array[$o$exploit$o$, $o$appreciate$o$, $o$protect$o$, $o$assist$o$, $o$reward$o$], 0, $e$1. Boşluğa **exploit** (sömürmek) gelir. Düşük ücret ve güvensiz koşul işçiyi sömürmektir.

Diğer şıklar: **B** appreciate (takdir etmek) / **C** protect (korumak) / **D** assist (yardım etmek) / **E** reward (ödüllendirmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Many businesses tried to ---- the popularity of the film by selling toys, clothes and books with pictures of its characters.$q$, array[$o$pass out$o$, $o$get across$o$, $o$work out$o$, $o$sum up$o$, $o$cash in on$o$], 4, $e$1. Boşluğa **cash in on** (kârlanmak) gelir. Filmin popülerliğinden kâr etmek cash in on ile söylenir.

Diğer şıklar: **A** pass out (bayılmak) / **B** get across (anlatmak) / **C** work out (çözmek) / **D** sum up (özetlemek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$High ---- is a serious problem in the region, where more than a quarter of young people cannot find work.$q$, array[$o$hospitality$o$, $o$attendance$o$, $o$architecture$o$, $o$unemployment$o$, $o$vocabulary$o$], 3, $e$1. Boşluğa **unemployment** (işsizlik) gelir. Gençlerin dörtte birinin iş bulamaması işsizliktir.

Diğer şıklar: **A** hospitality (konukseverlik) / **B** attendance (devam) / **C** architecture (mimari) / **E** vocabulary (kelime hazinesi).$e$, 1),
  (17, 'ydt-dil', null::integer, $q$The island is ---- for its dangerous currents, which have caused the deaths of many swimmers over the years.$q$, array[$o$grateful$o$, $o$suitable$o$, $o$notorious$o$, $o$eager$o$, $o$loyal$o$], 2, $e$1. Boşluğa **notorious** (kötü şöhretli) gelir. Yüzücülerin ölümüne yol açan akıntılarla kötü şöhretlidir.

Diğer şıklar: **A** grateful (minnettar) / **B** suitable (uygun) / **D** eager (hevesli) / **E** loyal (sadık).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Nobody was forced to take part in the experiment, since all the volunteers participated ---- and could leave whenever they wanted.$q$, array[$o$willingly$o$, $o$reluctantly$o$, $o$forcibly$o$, $o$grudgingly$o$, $o$accidentally$o$], 0, $e$1. Boşluğa **willingly** (isteyerek) gelir. Zorlama olmaması katılımın isteyerek olduğunu gösterir.

Diğer şıklar: **B** reluctantly (isteksizce) / **C** forcibly (zorla) / **D** grudgingly (gönülsüzce) / **E** accidentally (kazara).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Patients who ---- major surgery usually need to stay in hospital for at least a week, and their recovery may take months.$q$, array[$o$decline$o$, $o$undergo$o$, $o$undermine$o$, $o$pursue$o$, $o$assess$o$], 1, $e$1. Boşluğa **undergo** (geçirmek) gelir. Ameliyat geçirmek undergo surgery ile söylenir.

Diğer şıklar: **A** decline (reddetmek) / **C** undermine (zayıflatmak) / **D** pursue (peşinden gitmek) / **E** assess (değerlendirmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The poor harvests that ---- the revolution had already weakened the king's authority long before the first protests began.$q$, array[$o$made up for$o$, $o$brought up$o$, $o$held back$o$, $o$came across$o$, $o$led up to$o$], 4, $e$1. Boşluğa **led up to** (öncesinde yaşanmak) gelir. Devrimden önceki kötü hasatlar led up to ile söylenir.

Diğer şıklar: **A** made up for (telafi etmek) / **B** brought up (yetiştirmek) / **C** held back (engellemek) / **D** came across (rastlamak).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

