-- 20261026080000_questions_ydt_kelime_4. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 22
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 22$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Religious ---- is a basic principle of the constitution, which guarantees that people of different faiths can live together in peace.$q$, array[$o$hesitation$o$, $o$arrangement$o$, $o$competition$o$, $o$exhaustion$o$, $o$tolerance$o$], 4, $e$1. Boşluğa **tolerance** (hoşgörü) gelir. Farklı inançların barış içinde yaşaması hoşgörüyle sağlanır.

Diğer şıklar: **A** hesitation (tereddüt) / **B** arrangement (düzenleme) / **C** competition (rekabet) / **D** exhaustion (bitkinlik).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The conference was attended by many ---- scientists, including two winners of the Nobel Prize in physics.$q$, array[$o$feeble$o$, $o$frantic$o$, $o$eminent$o$, $o$vacant$o$, $o$modest$o$], 2, $e$1. Boşluğa **eminent** (seçkin) gelir. Nobel ödüllü isimlerin katıldığı toplantıdaki bilim insanları seçkindir.

Diğer şıklar: **A** feeble (zayıf) / **B** frantic (çılgınca) / **D** vacant (boş) / **E** modest (mütevazı).$e$, 3),
  (3, 'ydt-dil', null::integer, $q$Shakespeare is ---- one of the greatest writers in the English language, and his plays are still performed all over the world.$q$, array[$o$undoubtedly$o$, $o$reluctantly$o$, $o$hardly$o$, $o$seldom$o$, $o$lazily$o$], 0, $e$1. Boşluğa **undoubtedly** (şüphesiz) gelir. Oyunlarının hâlâ sahnelenmesi büyüklüğünü şüphesiz kılar.

Diğer şıklar: **B** reluctantly (isteksizce) / **C** hardly (zar zor) / **D** seldom (nadiren) / **E** lazily (tembelce).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Biologists ---- living things into groups according to their shared characteristics, such as animals with and without backbones.$q$, array[$o$dismiss$o$, $o$hesitate$o$, $o$apologise$o$, $o$classify$o$, $o$reduce$o$], 3, $e$1. Boşluğa **classify** (sınıflandırmak) gelir. Ortak özelliklere göre gruplandırmak sınıflandırmaktır.

Diğer şıklar: **A** dismiss (reddetmek) / **B** hesitate (tereddüt etmek) / **C** apologise (özür dilemek) / **E** reduce (azaltmak).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The two neighbours finally managed to ---- their disagreement over the fence after a long talk with a mediator.$q$, array[$o$wear out$o$, $o$pour in$o$, $o$sort out$o$, $o$bring forward$o$, $o$eat away$o$], 2, $e$1. Boşluğa **sort out** (çözmek) gelir. Arabulucuyla anlaşmazlığı çözmek sort out ile söylenir.

Diğer şıklar: **A** wear out (yıpratmak) / **B** pour in (akın etmek) / **D** bring forward (öne almak) / **E** eat away (aşındırmak).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Archaeologists found ---- of pottery buried in the soil, and by joining the pieces they were able to rebuild a complete vase.$q$, array[$o$witnesses$o$, $o$fragments$o$, $o$ceremonies$o$, $o$interviews$o$, $o$vehicles$o$], 1, $e$1. Boşluğa **fragments** (parçalar) gelir. Birleştirilerek vazo oluşturulan kırık parçalar fragmandır.

Diğer şıklar: **A** witnesses (tanıklar) / **C** ceremonies (törenler) / **D** interviews (görüşmeler) / **E** vehicles (araçlar).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$He is so ---- that he often buys expensive things without thinking and regrets his decision later.$q$, array[$o$impulsive$o$, $o$cautious$o$, $o$patient$o$, $o$thrifty$o$, $o$sensible$o$], 0, $e$1. Boşluğa **impulsive** (fevri) gelir. Düşünmeden alışveriş yapıp pişman olan kişi fevridir.

Diğer şıklar: **B** cautious (temkinli) / **C** patient (sabırlı) / **D** thrifty (tutumlu) / **E** sensible (makul).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The new machines can sort thousands of parcels per hour, so the post office now works much more ---- than before.$q$, array[$o$loosely$o$, $o$randomly$o$, $o$efficiently$o$, $o$briefly$o$, $o$anxiously$o$], 2, $e$1. Boşluğa **efficiently** (verimli biçimde) gelir. Saatte binlerce paket ayıran makineler verimli çalışmayı sağlar.

Diğer şıklar: **A** loosely (gevşekçe) / **B** randomly (rastgele) / **D** briefly (kısaca) / **E** anxiously (endişeyle).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$Many scientists believe that birds ---- from small dinosaurs that lived on Earth more than a hundred million years ago.$q$, array[$o$depart$o$, $o$refrain$o$, $o$benefit$o$, $o$escape$o$, $o$evolve$o$], 4, $e$1. Boşluğa **evolve** (evrimleşmek) gelir. Kuşların küçük dinozorlardan evrimleştiği düşünülür.

Diğer şıklar: **A** depart (ayrılmak) / **B** refrain (kaçınmak) / **C** benefit (yararlanmak) / **D** escape (kaçmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$A good teacher knows how to ---- difficult ideas in a clear and simple way, using examples from everyday life.$q$, array[$o$tell apart$o$, $o$stand by$o$, $o$set back$o$, $o$get across$o$, $o$pour in$o$], 3, $e$1. Boşluğa **get across** (anlatmak) gelir. Zor fikirleri anlaşılır biçimde aktarmak get across ile söylenir.

Diğer şıklar: **A** tell apart (ayırt etmek) / **B** stand by (yanında olmak) / **C** set back (geciktirmek) / **E** pour in (akın etmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$A ---- between the two groups of fans began outside the stadium and spread quickly through the streets near the city centre.$q$, array[$o$clash$o$, $o$bargain$o$, $o$verdict$o$, $o$hobby$o$, $o$pledge$o$], 0, $e$1. Boşluğa **clash** (çatışma) gelir. İki taraftar grubunun sokaklara yayılan kavgası çatışmadır.

Diğer şıklar: **B** bargain (pazarlık) / **C** verdict (karar) / **D** hobby (hobi) / **E** pledge (söz).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Judging the beauty of a painting is largely a ---- matter, since different people like different styles and colours.$q$, array[$o$statistical$o$, $o$subjective$o$, $o$legal$o$, $o$chemical$o$, $o$physical$o$], 1, $e$1. Boşluğa **subjective** (öznel) gelir. Herkesin farklı beğenmesi konuyu öznel kılar.

Diğer şıklar: **A** statistical (istatistiksel) / **C** legal (hukuki) / **D** chemical (kimyasal) / **E** physical (fiziksel).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The disease is ---- spread by mosquitoes, although it can also pass from one person to another in rare cases.$q$, array[$o$scarcely$o$, $o$randomly$o$, $o$hardly$o$, $o$primarily$o$, $o$lightly$o$], 3, $e$1. Boşluğa **primarily** (başlıca) gelir. Nadiren kişiden kişiye geçmesi, yayılımın esas olarak sivrisinekle olduğunu gösterir.

Diğer şıklar: **A** scarcely (zar zor) / **B** randomly (rastgele) / **C** hardly (neredeyse hiç) / **E** lightly (hafifçe).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$For most people, the advantages of regular exercise far ---- the disadvantages, such as the time it takes and the occasional pain.$q$, array[$o$outsource$o$, $o$outlaw$o$, $o$outweigh$o$, $o$outline$o$, $o$outgrow$o$], 2, $e$1. Boşluğa **outweigh** (ağır basmak) gelir. Faydaların zararlardan çok daha fazla olması ağır basmaktır.

Diğer şıklar: **A** outsource (dışarıdan temin etmek) / **B** outlaw (yasaklamak) / **D** outline (özetlemek) / **E** outgrow (büyüyüp aşmak).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$To lose weight, you should ---- sweets and fast food and take more exercise.$q$, array[$o$put up with$o$, $o$look down on$o$, $o$come up with$o$, $o$run out of$o$, $o$cut down on$o$], 4, $e$1. Boşluğa **cut down on** (azaltmak) gelir. Kilo vermek için şeker ve fast food tüketimini azaltmak gerekir.

Diğer şıklar: **A** put up with (katlanmak) / **B** look down on (küçümsemek) / **C** come up with (ortaya atmak) / **D** run out of (tükenmek).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$Good ---- depends on honest officials, open decision-making and laws that apply equally to every citizen.$q$, array[$o$hostility$o$, $o$governance$o$, $o$apprehension$o$, $o$pastime$o$, $o$rumour$o$], 1, $e$1. Boşluğa **governance** (yönetişim) gelir. Dürüst görevli, açık karar ve eşit hukuk iyi yönetişimin unsurlarıdır.

Diğer şıklar: **A** hostility (düşmanlık) / **C** apprehension (kaygı) / **D** pastime (hobi) / **E** rumour (söylenti).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Good ---- skills, such as listening carefully and showing respect to others, are essential for anyone who works in a team.$q$, array[$o$hereditary$o$, $o$marital$o$, $o$subatomic$o$, $o$interpersonal$o$, $o$medieval$o$], 3, $e$1. Boşluğa **interpersonal** (kişilerarası) gelir. Dinlemek ve saygı göstermek kişilerarası becerilerdir.

Diğer şıklar: **A** hereditary (kalıtsal) / **B** marital (evliliğe ait) / **C** subatomic (atom altı) / **E** medieval (ortaçağa ait).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The journey from Ankara to Istanbul by train takes ---- four and a half hours, depending on the number of stops.$q$, array[$o$roughly$o$, $o$precisely$o$, $o$barely$o$, $o$hardly$o$, $o$solely$o$], 0, $e$1. Boşluğa **roughly** (yaklaşık olarak) gelir. Durak sayısına bağlı değişen süre yaklaşık verilir.

Diğer şıklar: **B** precisely (tam olarak) / **C** barely (zar zor) / **D** hardly (neredeyse hiç) / **E** solely (yalnızca).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The designers decided to ---- solar panels into the roof of the building, so that it produces most of its own electricity.$q$, array[$o$extinguish$o$, $o$recover$o$, $o$disagree$o$, $o$suspect$o$, $o$incorporate$o$], 4, $e$1. Boşluğa **incorporate** (dahil etmek) gelir. Güneş panellerini çatıya yerleştirmek onları yapıya dahil etmektir.

Diğer şıklar: **A** extinguish (söndürmek) / **B** recover (iyileşmek) / **C** disagree (aynı fikirde olmamak) / **D** suspect (şüphelenmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$In computing, the letters 'CPU' ---- 'central processing unit', which is the part of a computer that carries out instructions.$q$, array[$o$hold on$o$, $o$stand for$o$, $o$give in$o$, $o$catch up$o$, $o$turn out$o$], 1, $e$1. Boşluğa **stand for** (anlamına gelmek) gelir. Kısaltmanın açılımını vermek stand for ile söylenir.

Diğer şıklar: **A** hold on (tutunmak) / **C** give in (pes etmek) / **D** catch up (yetişmek) / **E** turn out (ortaya çıkmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 23
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 23$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The long delays at the airport caused great ---- among passengers, some of whom began shouting at the staff.$q$, array[$o$admiration$o$, $o$satisfaction$o$, $o$frustration$o$, $o$generosity$o$, $o$curiosity$o$], 2, $e$1. Boşluğa **frustration** (hayal kırıklığı) gelir. Personele bağıran yolcular hayal kırıklığına uğramıştır.

Diğer şıklar: **A** admiration (hayranlık) / **B** satisfaction (memnuniyet) / **D** generosity (cömertlik) / **E** curiosity (merak).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The words 'big' and 'large' are ---- in most contexts, which means that they can usually replace each other.$q$, array[$o$contradictory$o$, $o$unrelated$o$, $o$incomplete$o$, $o$permanent$o$, $o$synonymous$o$], 4, $e$1. Boşluğa **synonymous** (eş anlamlı) gelir. Birbirinin yerine kullanılabilen sözcükler eş anlamlıdır.

Diğer şıklar: **A** contradictory (çelişkili) / **B** unrelated (ilgisiz) / **C** incomplete (eksik) / **D** permanent (kalıcı).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The mayor ---- apologised for the mistake in front of hundreds of citizens and promised that it would never happen again.$q$, array[$o$publicly$o$, $o$secretly$o$, $o$hardly$o$, $o$lightly$o$, $o$barely$o$], 0, $e$1. Boşluğa **publicly** (alenen) gelir. Yüzlerce kişinin önünde özür dilemek alenidir.

Diğer şıklar: **B** secretly (gizlice) / **C** hardly (zar zor) / **D** lightly (hafifçe) / **E** barely (zar zor).$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The new law will ---- smoking in all restaurants, cafes and other public places from the beginning of next year.$q$, array[$o$encourage$o$, $o$allow$o$, $o$recommend$o$, $o$prohibit$o$, $o$reward$o$], 3, $e$1. Boşluğa **prohibit** (yasaklamak) gelir. Yasanın amacı kamusal alanda sigarayı yasaklamaktır.

Diğer şıklar: **A** encourage (teşvik etmek) / **B** allow (izin vermek) / **C** recommend (önermek) / **E** reward (ödüllendirmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Millions of people around the world ---- hunger, and many of them are children under the age of five.$q$, array[$o$show off$o$, $o$pass on$o$, $o$suffer from$o$, $o$wear out$o$, $o$back up$o$], 2, $e$1. Boşluğa **suffer from** (acı çekmek) gelir. Açlıktan mustarip olmak suffer from ile söylenir.

Diğer şıklar: **A** show off (gösteriş yapmak) / **B** pass on (aktarmak) / **D** wear out (yıpratmak) / **E** back up (desteklemek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$People who lived under the ---- of the dictator were afraid to speak freely, and many left the country in search of freedom.$q$, array[$o$oppression$o$, $o$assistance$o$, $o$allowance$o$, $o$invention$o$, $o$hospitality$o$], 0, $e$1. Boşluğa **oppression** (baskı) gelir. Özgürce konuşamamak ve ülkeyi terk etmek baskının sonucudur.

Diğer şıklar: **B** assistance (yardım) / **C** allowance (ödenek) / **D** invention (icat) / **E** hospitality (konukseverlik).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$My grandfather has ---- views about family life and often disagrees with the more modern ideas of younger people.$q$, array[$o$flexible$o$, $o$radical$o$, $o$innovative$o$, $o$conservative$o$, $o$careless$o$], 3, $e$1. Boşluğa **conservative** (muhafazakâr) gelir. Modern fikirlere karşı çıkan kişi muhafazakârdır.

Diğer şıklar: **A** flexible (esnek) / **B** radical (köktenci) / **C** innovative (yenilikçi) / **E** careless (dikkatsiz).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$Housing prices in the capital are ---- higher than those in smaller towns, which is why many workers live far from their offices.$q$, array[$o$barely$o$, $o$vastly$o$, $o$slightly$o$, $o$hardly$o$, $o$seldom$o$], 1, $e$1. Boşluğa **vastly** (çok daha) gelir. İşçilerin uzakta oturmasına yol açan fark çok büyüktür.

Diğer şıklar: **A** barely (zar zor) / **C** slightly (hafifçe) / **D** hardly (neredeyse hiç) / **E** seldom (nadiren).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The thermostat helps to ---- the temperature of the room, switching the heating on and off when necessary.$q$, array[$o$reveal$o$, $o$excuse$o$, $o$abandon$o$, $o$estimate$o$, $o$regulate$o$], 4, $e$1. Boşluğa **regulate** (ayarlamak) gelir. Isıtmayı açıp kapayarak sıcaklığı düzenlemek regulate ile söylenir.

Diğer şıklar: **A** reveal (ortaya çıkarmak) / **B** excuse (mazur görmek) / **C** abandon (terk etmek) / **D** estimate (tahmin etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Many popular sports, such as football and tennis, ---- Britain, where they were first played according to written rules.$q$, array[$o$originate from$o$, $o$account for$o$, $o$run out of$o$, $o$bring about$o$, $o$break into$o$], 0, $e$1. Boşluğa **originate from** (-den çıkmak) gelir. İlk kez yazılı kurallarla oynandıkları ülke sporların kökenidir.

Diğer şıklar: **B** account for (açıklamak) / **C** run out of (tükenmek) / **D** bring about (neden olmak) / **E** break into (zorla girmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The essay was poorly written and lacked ----, with ideas appearing in random order and no clear connection between paragraphs.$q$, array[$o$revenue$o$, $o$coherence$o$, $o$authority$o$, $o$harvest$o$, $o$ambition$o$], 1, $e$1. Boşluğa **coherence** (tutarlılık) gelir. Paragraflar arasında bağ olmaması tutarlılık eksikliğidir.

Diğer şıklar: **A** revenue (gelir) / **C** authority (otorite) / **D** harvest (hasat) / **E** ambition (hırs).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Sand is a ---- material that allows water to pass through it quickly, while clay holds water for a long time.$q$, array[$o$brittle$o$, $o$luminous$o$, $o$permeable$o$, $o$adjacent$o$, $o$voluminous$o$], 2, $e$1. Boşluğa **permeable** (geçirgen) gelir. Suyu hızlı geçiren malzeme geçirgendir.

Diğer şıklar: **A** brittle (kırılgan) / **B** luminous (parlak) / **D** adjacent (bitişik) / **E** voluminous (hacimli).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The heat in the stadium became ---- hot at midday, and many spectators had to leave before the end of the match.$q$, array[$o$unbearably$o$, $o$lazily$o$, $o$modestly$o$, $o$gladly$o$, $o$politely$o$], 0, $e$1. Boşluğa **unbearably** (dayanılmaz biçimde) gelir. Seyircilerin maçı bırakıp gitmesi sıcağın dayanılmaz olduğunu gösterir.

Diğer şıklar: **B** lazily (tembelce) / **C** modestly (mütevazı biçimde) / **D** gladly (memnuniyetle) / **E** politely (kibarca).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Heavy traffic noise can ---- people of sleep, and long-term lack of sleep may damage their health.$q$, array[$o$accuse$o$, $o$deprive$o$, $o$convince$o$, $o$remind$o$, $o$suspect$o$], 1, $e$1. Boşluğa **deprive** (mahrum etmek) gelir. Uykudan yoksun bırakmak deprive ... of kalıbıyla söylenir.

Diğer şıklar: **A** accuse (suçlamak) / **C** convince (ikna etmek) / **D** remind (hatırlatmak) / **E** suspect (şüphelenmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Parents are legally required to ---- their children until they are eighteen, which includes giving them food, housing and education.$q$, array[$o$pass on$o$, $o$get by$o$, $o$write off$o$, $o$fall behind$o$, $o$provide for$o$], 4, $e$1. Boşluğa **provide for** (geçimini sağlamak) gelir. Yiyecek, barınma ve eğitim sağlamak çocukların geçimini üstlenmektir.

Diğer şıklar: **A** pass on (aktarmak) / **B** get by (idare etmek) / **C** write off (değersiz saymak) / **D** fall behind (geride kalmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Babies receive all the ---- they need from their mother's milk during the first six months of their lives.$q$, array[$o$punishment$o$, $o$amusement$o$, $o$equipment$o$, $o$nourishment$o$, $o$treatment$o$], 3, $e$1. Boşluğa **nourishment** (besin) gelir. İlk altı ay anne sütüyle alınan şey besindir.

Diğer şıklar: **A** punishment (ceza) / **B** amusement (eğlence) / **C** equipment (ekipman) / **E** treatment (tedavi).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Small children are naturally ----, finding it hard to understand that other people may see or feel things differently from them.$q$, array[$o$generous$o$, $o$egocentric$o$, $o$sociable$o$, $o$thoughtful$o$, $o$courageous$o$], 1, $e$1. Boşluğa **egocentric** (benmerkezci) gelir. Başkalarının farklı hissedebileceğini anlamakta zorlanmak benmerkezciliktir.

Diğer şıklar: **A** generous (cömert) / **C** sociable (sosyal) / **D** thoughtful (düşünceli) / **E** courageous (cesur).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The hotel is ---- located next to the central station, so guests can reach the airport and the main sights in a few minutes.$q$, array[$o$reluctantly$o$, $o$formerly$o$, $o$conveniently$o$, $o$loosely$o$, $o$barely$o$], 2, $e$1. Boşluğa **conveniently** (elverişli biçimde) gelir. Havalimanına ve ana görülecek yerlere dakikalar içinde ulaşılması elverişli konumu gösterir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** formerly (eskiden) / **D** loosely (gevşekçe) / **E** barely (zar zor).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The opening hours of the two libraries ---- between ten and twelve, so students can use either one during those two hours.$q$, array[$o$quarrel$o$, $o$evaporate$o$, $o$hesitate$o$, $o$reserve$o$, $o$overlap$o$], 4, $e$1. Boşluğa **overlap** (çakışmak) gelir. Her iki kütüphanenin de açık olduğu saatler çakışmadır.

Diğer şıklar: **A** quarrel (tartışmak) / **B** evaporate (buharlaşmak) / **C** hesitate (tereddüt etmek) / **D** reserve (ayırtmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Students who miss many classes often ---- the rest of the group and find it very hard to catch up later.$q$, array[$o$end up$o$, $o$get by$o$, $o$go back to$o$, $o$fall behind$o$, $o$stand up for$o$], 3, $e$1. Boşluğa **fall behind** (geride kalmak) gelir. Sonradan yetişmek zor olduğuna göre öğrenciler gruptan geri kalır.

Diğer şıklar: **A** end up (sonunda ... olmak) / **B** get by (idare etmek) / **C** go back to (dönmek) / **E** stand up for (savunmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 24
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 24$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Cats have a natural ---- to hunt small animals, even when they are well fed and have no need to look for food.$q$, array[$o$permission$o$, $o$measurement$o$, $o$disagreement$o$, $o$tendency$o$, $o$suspicion$o$], 3, $e$1. Boşluğa **tendency** (eğilim) gelir. Karnı tok olsa bile avlanmak doğal bir eğilimdir.

Diğer şıklar: **A** permission (izin) / **B** measurement (ölçüm) / **C** disagreement (anlaşmazlık) / **E** suspicion (şüphe).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The player's ---- performance throughout the season, with at least one goal in almost every match, earned him the title of best forward.$q$, array[$o$erratic$o$, $o$occasional$o$, $o$accidental$o$, $o$reluctant$o$, $o$consistent$o$], 4, $e$1. Boşluğa **consistent** (tutarlı) gelir. Hemen her maçta gol atmak tutarlı performanstır.

Diğer şıklar: **A** erratic (düzensiz) / **B** occasional (ara sıra) / **C** accidental (tesadüfi) / **D** reluctant (isteksiz).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The meeting was cancelled at the last minute, ---- because the chairman was ill, although nobody has confirmed the reason.$q$, array[$o$presumably$o$, $o$definitely$o$, $o$officially$o$, $o$certainly$o$, $o$thoroughly$o$], 0, $e$1. Boşluğa **presumably** (muhtemelen) gelir. Nedenin doğrulanmamış olması tahmine dayanır.

Diğer şıklar: **B** definitely (kesinlikle) / **C** officially (resmen) / **D** certainly (kuşkusuz) / **E** thoroughly (etraflıca).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The airline called the passenger to ---- his reservation for the flight to London the next morning.$q$, array[$o$lessen$o$, $o$confirm$o$, $o$reject$o$, $o$forbid$o$, $o$pardon$o$], 1, $e$1. Boşluğa **confirm** (onaylamak) gelir. Rezervasyonu teyit etmek confirm ile söylenir.

Diğer şıklar: **A** lessen (azaltmak) / **C** reject (reddetmek) / **D** forbid (yasaklamak) / **E** pardon (affetmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The advertising campaign is ---- young people between fifteen and twenty-five, who spend a lot of time on social media.$q$, array[$o$looked after$o$, $o$made up$o$, $o$aimed at$o$, $o$turned down$o$, $o$worn out$o$], 2, $e$1. Boşluğa **aimed at** (hedeflenmiş) gelir. Sosyal medyada vakit geçiren gençler kampanyanın hedef kitlesidir.

Diğer şıklar: **A** looked after (bakılmış) / **B** made up (oluşturulmuş) / **D** turned down (reddedilmiş) / **E** worn out (yıpranmış).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$A passport is the main ---- for travelling abroad, and some countries also ask visitors to show a visa.$q$, array[$o$ambition$o$, $o$pleasure$o$, $o$debate$o$, $o$hobby$o$, $o$requirement$o$], 4, $e$1. Boşluğa **requirement** (gereklilik) gelir. Yurt dışına çıkmak için gereken belge bir gerekliliktir.

Diğer şıklar: **A** ambition (hırs) / **B** pleasure (zevk) / **C** debate (tartışma) / **D** hobby (hobi).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Most scientists consider the claim ----, since it contradicts everything that is known about physics and has no supporting evidence.$q$, array[$o$reasonable$o$, $o$undeniable$o$, $o$credible$o$, $o$implausible$o$, $o$acceptable$o$], 3, $e$1. Boşluğa **implausible** (inandırıcı olmayan) gelir. Fizikle çelişen iddia inandırıcı değildir.

Diğer şıklar: **A** reasonable (makul) / **B** undeniable (inkâr edilemez) / **C** credible (güvenilir) / **E** acceptable (kabul edilebilir).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The decision was made ---- on financial grounds, and the personal feelings of the managers played no part in it.$q$, array[$o$hardly$o$, $o$purely$o$, $o$loudly$o$, $o$secretly$o$, $o$lazily$o$], 1, $e$1. Boşluğa **purely** (tamamen) gelir. Kişisel duyguların rol oynamadığı karar yalnızca mali nedenlere dayanır.

Diğer şıklar: **A** hardly (zar zor) / **C** loudly (yüksek sesle) / **D** secretly (gizlice) / **E** lazily (tembelce).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$The new management hopes to ---- the old, loss-making company into a modern and profitable business within three years.$q$, array[$o$present$o$, $o$declare$o$, $o$transform$o$, $o$follow$o$, $o$locate$o$], 2, $e$1. Boşluğa **transform** (dönüştürmek) gelir. Zarar eden şirketi modern ve kârlı bir şirkete çevirmek dönüştürmektir.

Diğer şıklar: **A** present (sunmak) / **B** declare (ilan etmek) / **D** follow (izlemek) / **E** locate (yerini bulmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Sales this year have ---- expectations, so the company has decided to reduce its production plans for next year.$q$, array[$o$fallen short of$o$, $o$gone through$o$, $o$looked into$o$, $o$paid off$o$, $o$run out of$o$], 0, $e$1. Boşluğa **fallen short of** (ulaşamamak) gelir. Üretim planlarını azaltmak, satışların beklentinin altında kaldığını gösterir.

Diğer şıklar: **B** gone through (geçirmek) / **C** looked into (araştırmak) / **D** paid off (sonuç vermek) / **E** run out of (tükenmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Food factories are subject to regular ---- by health officials, who check hygiene standards and the quality of the products.$q$, array[$o$compensation$o$, $o$inspection$o$, $o$adoption$o$, $o$ownership$o$, $o$retirement$o$], 1, $e$1. Boşluğa **inspection** (denetim) gelir. Hijyen standartlarını kontrol etmek denetimdir.

Diğer şıklar: **A** compensation (tazminat) / **C** adoption (benimseme) / **D** ownership (sahiplik) / **E** retirement (emeklilik).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Travelling alone in an ---- city can be frightening, because you do not know the streets or speak the language.$q$, array[$o$affordable$o$, $o$eventful$o$, $o$unfamiliar$o$, $o$honest$o$, $o$elegant$o$], 2, $e$1. Boşluğa **unfamiliar** (yabancı) gelir. Sokakları ve dili bilmemek şehrin yabancı olmasından gelir.

Diğer şıklar: **A** affordable (uygun fiyatlı) / **B** eventful (olaylı) / **D** honest (dürüst) / **E** elegant (zarif).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$Ali and Ayşe scored 95 and 92 points, ----, in the final exam.$q$, array[$o$consecutively$o$, $o$simultaneously$o$, $o$eventually$o$, $o$frequently$o$, $o$respectively$o$], 4, $e$1. Boşluğa **respectively** (sırasıyla) gelir. Ali 95, Ayşe 92 aldığını sırasıyla ifade eder.

Diğer şıklar: **A** consecutively (art arda) / **B** simultaneously (aynı anda) / **C** eventually (sonunda) / **D** frequently (sık sık).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The bridge was designed to ---- earthquakes of up to magnitude eight, so it should remain safe even in a very strong tremor.$q$, array[$o$withstand$o$, $o$resemble$o$, $o$evacuate$o$, $o$hesitate$o$, $o$inform$o$], 0, $e$1. Boşluğa **withstand** (dayanmak) gelir. Sekiz büyüklüğündeki depreme rağmen güvenli kalmak dayanmaktır.

Diğer şıklar: **B** resemble (benzemek) / **C** evacuate (tahliye etmek) / **D** hesitate (tereddüt etmek) / **E** inform (bilgilendirmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$More and more households are planning to ---- solar energy because it is cheaper and better for the environment.$q$, array[$o$hold up$o$, $o$put out$o$, $o$cut off$o$, $o$switch to$o$, $o$eat away$o$], 3, $e$1. Boşluğa **switch to** (geçmek) gelir. Daha ucuz ve çevreci enerjiye geçmek switch to ile söylenir.

Diğer şıklar: **A** hold up (geciktirmek) / **B** put out (söndürmek) / **C** cut off (kesmek) / **E** eat away (aşındırmak).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$It was his strong ---- that every child should have access to education that led him to open schools in poor villages.$q$, array[$o$sacrifice$o$, $o$calculation$o$, $o$interruption$o$, $o$bargain$o$, $o$conviction$o$], 4, $e$1. Boşluğa **conviction** (kanaat) gelir. Eğitimin herkese ulaşması gerektiğine dair güçlü inanç kanaattir.

Diğer şıklar: **A** sacrifice (fedakârlık) / **B** calculation (hesaplama) / **C** interruption (kesinti) / **D** bargain (pazarlık).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Many farmers have moved away from ---- methods of farming and now use computers and satellites to decide when to plant and water crops.$q$, array[$o$radical$o$, $o$conventional$o$, $o$innovative$o$, $o$futuristic$o$, $o$advanced$o$], 1, $e$1. Boşluğa **conventional** (geleneksel) gelir. Bilgisayar ve uyduya geçilen eski yöntemler geleneksel yöntemlerdir.

Diğer şıklar: **A** radical (köktenci) / **C** innovative (yenilikçi) / **D** futuristic (fütüristik) / **E** advanced (gelişmiş).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The film is ---- based on a true story, but many of the characters and events were invented by the writers.$q$, array[$o$strictly$o$, $o$precisely$o$, $o$loosely$o$, $o$entirely$o$, $o$exactly$o$], 2, $e$1. Boşluğa **loosely** (gevşek biçimde) gelir. Birçok olay uydurulduğuna göre film gerçek hikâyeye gevşek biçimde dayanır.

Diğer şıklar: **A** strictly (kesin biçimde) / **B** precisely (tam olarak) / **D** entirely (tamamen) / **E** exactly (tam olarak).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The new software is designed to ---- communication between doctors and patients by allowing them to exchange messages quickly and safely.$q$, array[$o$facilitate$o$, $o$interrupt$o$, $o$dominate$o$, $o$dispose$o$, $o$distract$o$], 0, $e$1. Boşluğa **facilitate** (kolaylaştırmak) gelir. Hızlı ve güvenli mesajlaşma iletişimi kolaylaştırır.

Diğer şıklar: **B** interrupt (bölmek) / **C** dominate (hâkim olmak) / **D** dispose (elden çıkarmak) / **E** distract (dikkatini dağıtmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The government decided to ---- public transport rather than building new motorways, in order to reduce traffic and pollution.$q$, array[$o$apply for$o$, $o$long for$o$, $o$object to$o$, $o$invest in$o$, $o$head for$o$], 3, $e$1. Boşluğa **invest in** (yatırım yapmak) gelir. Trafiği azaltmak için toplu taşımaya kaynak ayırmak invest in ile söylenir.

Diğer şıklar: **A** apply for (başvurmak) / **B** long for (özlemek) / **C** object to (itiraz etmek) / **E** head for (yönelmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 25
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 25$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Constant ---- is needed from lifeguards at the beach, because a swimmer in trouble can disappear under the water within seconds.$q$, array[$o$reputation$o$, $o$allowance$o$, $o$disguise$o$, $o$flattery$o$, $o$vigilance$o$], 4, $e$1. Boşluğa **vigilance** (uyanıklık) gelir. Saniyeler içinde boğulabilecek yüzücüyü fark etmek için sürekli uyanıklık gerekir.

Diğer şıklar: **A** reputation (itibar) / **B** allowance (ödenek) / **C** disguise (kılık) / **D** flattery (dalkavukluk).$e$, 3),
  (2, 'ydt-dil', null::integer, $q$Flu is a highly ---- disease, which is why people with a fever are advised to stay at home and avoid contact with others.$q$, array[$o$infectious$o$, $o$hereditary$o$, $o$harmless$o$, $o$gradual$o$, $o$vacant$o$], 0, $e$1. Boşluğa **infectious** (bulaşıcı) gelir. Evde kalıp temastan kaçınmak bulaşıcı hastalık için söylenir.

Diğer şıklar: **B** hereditary (kalıtsal) / **C** harmless (zararsız) / **D** gradual (kademeli) / **E** vacant (boş).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The children ran ---- into the snow, shouting and laughing as they threw snowballs at each other.$q$, array[$o$reluctantly$o$, $o$sadly$o$, $o$nervously$o$, $o$gleefully$o$, $o$silently$o$], 3, $e$1. Boşluğa **gleefully** (neşeyle) gelir. Gülen ve bağıran çocukların koşması neşelidir.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** sadly (üzüntüyle) / **C** nervously (gergin biçimde) / **E** silently (sessizce).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Events began to ---- quickly after the president's resignation, and within a week a new government had been formed.$q$, array[$o$submit$o$, $o$unfold$o$, $o$dwell$o$, $o$inherit$o$, $o$yield$o$], 1, $e$1. Boşluğa **unfold** (gelişmek) gelir. Bir haftada yeni hükümetin kurulması olayların hızla gelişmesidir.

Diğer şıklar: **A** submit (sunmak) / **C** dwell (ikamet etmek) / **D** inherit (miras almak) / **E** yield (ürün vermek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Nurses ---- patients in hospitals, giving them medicine, checking their temperature and helping them to eat and wash.$q$, array[$o$get across$o$, $o$give up$o$, $o$look after$o$, $o$set off$o$, $o$take over$o$], 2, $e$1. Boşluğa **look after** (bakmak) gelir. İlaç vermek ve yemeğe yardım etmek hastalara bakmaktır.

Diğer şıklar: **A** get across (anlatmak) / **B** give up (vazgeçmek) / **D** set off (yola çıkmak) / **E** take over (devralmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Many young people learn a trade through an ----, working beside an experienced craftsman for several years while earning a small wage.$q$, array[$o$adoption$o$, $o$allowance$o$, $o$inspection$o$, $o$invasion$o$, $o$apprenticeship$o$], 4, $e$1. Boşluğa **apprenticeship** (çıraklık) gelir. Deneyimli ustanın yanında çalışarak meslek öğrenmek çıraklıktır.

Diğer şıklar: **A** adoption (benimseme) / **B** allowance (ödenek) / **C** inspection (denetim) / **D** invasion (istila).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Many plants growing in the mountains have ---- properties, and local people have used them for centuries to treat headaches and stomach problems.$q$, array[$o$decorative$o$, $o$medicinal$o$, $o$metallic$o$, $o$seasonal$o$, $o$hostile$o$], 1, $e$1. Boşluğa **medicinal** (şifalı) gelir. Baş ve mide ağrısını tedavi eden özellikler şifalıdır.

Diğer şıklar: **A** decorative (dekoratif) / **C** metallic (metalik) / **D** seasonal (mevsimlik) / **E** hostile (düşmanca).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The scientists were criticised for conducting experiments that were not ---- acceptable, because the animals suffered unnecessarily.$q$, array[$o$narrowly$o$, $o$frequently$o$, $o$loosely$o$, $o$ethically$o$, $o$distinctly$o$], 3, $e$1. Boşluğa **ethically** (etik olarak) gelir. Hayvanların gereksiz acı çekmesi etik açıdan kabul edilemezliğini gösterir.

Diğer şıklar: **A** narrowly (ucu ucuna) / **B** frequently (sık sık) / **C** loosely (gevşekçe) / **E** distinctly (belirgin biçimde).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Police managed to ---- more than two hundred kilos of illegal drugs hidden in a lorry at the border.$q$, array[$o$recall$o$, $o$apply$o$, $o$seize$o$, $o$praise$o$, $o$borrow$o$], 2, $e$1. Boşluğa **seize** (el koymak) gelir. Kamyonda saklı uyuşturucuya polis el koyar.

Diğer şıklar: **A** recall (hatırlamak) / **B** apply (başvurmak) / **D** praise (övmek) / **E** borrow (ödünç almak).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$Parents often ---- their cultural values and traditions to their children through stories, songs and family celebrations.$q$, array[$o$pass on$o$, $o$cut off$o$, $o$run into$o$, $o$break down$o$, $o$tear apart$o$], 0, $e$1. Boşluğa **pass on** (aktarmak) gelir. Değerleri çocuklara iletmek pass on ile söylenir.

Diğer şıklar: **B** cut off (kesmek) / **C** run into (rastlamak) / **D** break down (bozulmak) / **E** tear apart (parçalamak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Rising food prices led to social ---- in several cities, where thousands of people protested in the streets against the government.$q$, array[$o$hospitality$o$, $o$unrest$o$, $o$harvest$o$, $o$tolerance$o$, $o$delivery$o$], 1, $e$1. Boşluğa **unrest** (huzursuzluk) gelir. Binlerce kişinin sokaklarda protesto etmesi toplumsal huzursuzluktur.

Diğer şıklar: **A** hospitality (konukseverlik) / **C** harvest (hasat) / **D** tolerance (hoşgörü) / **E** delivery (teslimat).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The ---- smile of the woman in the painting has puzzled viewers for centuries, since nobody knows exactly what she is thinking.$q$, array[$o$obvious$o$, $o$rigid$o$, $o$grateful$o$, $o$tedious$o$, $o$enigmatic$o$], 4, $e$1. Boşluğa **enigmatic** (esrarengiz) gelir. Ne düşündüğü anlaşılmayan gülümseme esrarengizdir.

Diğer şıklar: **A** obvious (açık) / **B** rigid (katı) / **C** grateful (minnettar) / **D** tedious (sıkıcı).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The team won five matches ----, without losing a single game or even conceding a goal, and went to the top of the league.$q$, array[$o$consecutively$o$, $o$simultaneously$o$, $o$respectively$o$, $o$subsequently$o$, $o$approximately$o$], 0, $e$1. Boşluğa **consecutively** (art arda) gelir. Kaybetmeden beş maç üst üste kazanmak art arda kazanmaktır.

Diğer şıklar: **B** simultaneously (aynı anda) / **C** respectively (sırasıyla) / **D** subsequently (sonradan) / **E** approximately (yaklaşık olarak).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Other children used to ---- him because of his strange accent, which made him afraid to speak in class.$q$, array[$o$admire$o$, $o$defend$o$, $o$ridicule$o$, $o$support$o$, $o$join$o$], 2, $e$1. Boşluğa **ridicule** (alay etmek) gelir. Konuşmaktan korkmasına yol açan davranış alay etmektir.

Diğer şıklar: **A** admire (hayran olmak) / **B** defend (savunmak) / **D** support (desteklemek) / **E** join (katılmak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The bank decided to ---- the debt of the poor countries, which means that they no longer have to pay back the money.$q$, array[$o$look up$o$, $o$speed up$o$, $o$stand by$o$, $o$write off$o$, $o$hold on$o$], 3, $e$1. Boşluğa **write off** (silmek) gelir. Borcu geri ödemek zorunda kalmamak borcun silinmesidir.

Diğer şıklar: **A** look up (aramak) / **B** speed up (hızlandırmak) / **C** stand by (yanında olmak) / **E** hold on (tutunmak).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The museum is holding a special ---- of Egyptian art, which includes more than three hundred objects lent by museums in Cairo.$q$, array[$o$hesitation$o$, $o$recovery$o$, $o$reduction$o$, $o$pension$o$, $o$exhibition$o$], 4, $e$1. Boşluğa **exhibition** (sergi) gelir. Üç yüz eserin müzede gösterilmesi bir sergidir.

Diğer şıklar: **A** hesitation (tereddüt) / **B** recovery (iyileşme) / **C** reduction (azaltma) / **D** pension (emekli maaşı).$e$, 1),
  (17, 'ydt-dil', null::integer, $q$The theory is supported by ---- evidence from hundreds of experiments, rather than depending only on logical arguments.$q$, array[$o$hypothetical$o$, $o$empirical$o$, $o$imaginary$o$, $o$theoretical$o$, $o$traditional$o$], 1, $e$1. Boşluğa **empirical** (deneysel) gelir. Yüzlerce deneyden gelen kanıt deneyseldir.

Diğer şıklar: **A** hypothetical (varsayımsal) / **C** imaginary (hayali) / **D** theoretical (kuramsal) / **E** traditional (geleneksel).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Humans and chimpanzees are ---- very similar, sharing about ninety-eight percent of their genes.$q$, array[$o$politely$o$, $o$loosely$o$, $o$financially$o$, $o$biologically$o$, $o$musically$o$], 3, $e$1. Boşluğa **biologically** (biyolojik olarak) gelir. Genlerin yüzde doksan sekizini paylaşmak biyolojik benzerliktir.

Diğer şıklar: **A** politely (kibarca) / **B** loosely (gevşekçe) / **C** financially (mali olarak) / **E** musically (müzikal olarak).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The earthquake ---- thousands of people homeless and left many villages without electricity and clean water.$q$, array[$o$rendered$o$, $o$assumed$o$, $o$pretended$o$, $o$reserved$o$, $o$attached$o$], 0, $e$1. Boşluğa **rendered** (kılmak) gelir. Binlerce kişiyi evsiz bırakan deprem onları evsiz kılmıştır.

Diğer şıklar: **B** assumed (varsaydı) / **C** pretended (rol yaptı) / **D** reserved (ayırdı) / **E** attached (iliştirdi).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The company has set up a special department to ---- customer complaints quickly and politely.$q$, array[$o$depend on$o$, $o$cut off$o$, $o$deal with$o$, $o$bring up$o$, $o$wear out$o$], 2, $e$1. Boşluğa **deal with** (ele almak) gelir. Müşteri şikâyetleriyle ilgilenmek deal with ile söylenir.

Diğer şıklar: **A** depend on (bağlı olmak) / **B** cut off (kesmek) / **D** bring up (yetiştirmek) / **E** wear out (yıpratmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

