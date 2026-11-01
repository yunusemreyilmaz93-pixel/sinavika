-- 20261026050000_questions_ydt_kelime_1. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The region's ---- of fresh water and fertile soil made it one of the first places where permanent farming settlements developed.$q$, array[$o$shortage$o$, $o$absence$o$, $o$abundance$o$, $o$tendency$o$, $o$reliability$o$], 2, $e$1. Boşluğa **abundance** (bolluk) gelir. Tatlı su ve verimli toprağın bolluğu, kalıcı tarım yerleşimlerinin burada ilk gelişmesini açıklar.

Diğer şıklar: **A** shortage (kıtlık) / **B** absence (yokluk) / **D** tendency (eğilim) / **E** reliability (güvenilirlik).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Unlike the strict forms of classical music, ---- composers often experiment with electronic sounds and unusual instruments.$q$, array[$o$suspicious$o$, $o$gradual$o$, $o$hollow$o$, $o$contemporary$o$, $o$elementary$o$], 3, $e$1. Boşluğa **contemporary** (çağdaş) gelir. Klasik müziğin katı biçimlerinden farklı olarak yeni sesler deneyenler çağdaş bestecilerdir.

Diğer şıklar: **A** suspicious (şüpheli) / **B** gradual (kademeli) / **C** hollow (içi boş) / **E** elementary (temel).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$When a baby hears a sudden loud noise, it ---- closes its eyes and stretches out its arms before it learns what the noise is.$q$, array[$o$lately$o$, $o$instinctively$o$, $o$respectively$o$, $o$formerly$o$, $o$mutually$o$], 1, $e$1. Boşluğa **instinctively** (içgüdüsel olarak) gelir. Bebek ne olduğunu öğrenmeden tepki verdiğine göre bu davranış içgüdüseldir.

Diğer şıklar: **A** lately (son zamanlarda) / **C** respectively (sırasıyla) / **D** formerly (eskiden) / **E** mutually (karşılıklı olarak).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$If the dispute between the two countries is not settled through talks, it may ---- into a full-scale war.$q$, array[$o$escalate$o$, $o$retain$o$, $o$compress$o$, $o$assemble$o$, $o$deprive$o$], 0, $e$1. Boşluğa **escalate** (tırmanmak) gelir. Müzakereyle çözülmeyen anlaşmazlığın tam ölçekli savaşa dönüşmesi, anlaşmazlığın tırmanması demektir.

Diğer şıklar: **B** retain (elde tutmak) / **C** compress (sıkıştırmak) / **D** assemble (bir araya getirmek) / **E** deprive (mahrum etmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Engineers must ---- the effects of strong winds when designing tall buildings, so that the structures remain stable during storms.$q$, array[$o$put off$o$, $o$turn down$o$, $o$give up$o$, $o$hand in$o$, $o$allow for$o$], 4, $e$1. Boşluğa **allow for** (hesaba katmak) gelir. Yüksek binalar tasarlanırken rüzgârın etkileri hesaba katılmalıdır.

Diğer şıklar: **A** put off (ertelemek) / **B** turn down (reddetmek) / **C** give up (vazgeçmek) / **D** hand in (teslim etmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The university has an international ---- for its research in marine biology, and scholars from many countries apply to work in its laboratories.$q$, array[$o$suspicion$o$, $o$obligation$o$, $o$reputation$o$, $o$exhibition$o$, $o$restriction$o$], 2, $e$1. Boşluğa **reputation** (itibar) gelir. Dünyanın dört yanından araştırmacıların başvurması, üniversitenin uluslararası itibarı olduğunu gösterir.

Diğer şıklar: **A** suspicion (şüphe) / **B** obligation (yükümlülük) / **D** exhibition (sergi) / **E** restriction (kısıtlama).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Archaeologists found ---- tools made of stone and bone, which suggest that the settlement was inhabited more than ten thousand years ago.$q$, array[$o$luxurious$o$, $o$voluntary$o$, $o$adjacent$o$, $o$primitive$o$, $o$flexible$o$], 3, $e$1. Boşluğa **primitive** (ilkel) gelir. Taş ve kemikten yapılmış, on bin yıl öncesine ait aletler ilkel aletlerdir.

Diğer şıklar: **A** luxurious (lüks) / **B** voluntary (gönüllü) / **C** adjacent (bitişik) / **E** flexible (esnek).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$As the world's population continues to grow, the demand for energy will ---- increase, putting more pressure on natural resources.$q$, array[$o$inevitably$o$, $o$barely$o$, $o$selectively$o$, $o$accidentally$o$, $o$reluctantly$o$], 0, $e$1. Boşluğa **inevitably** (kaçınılmaz olarak) gelir. Nüfus artarken enerji talebinin yükselmesi kaçınılmaz bir sonuçtur.

Diğer şıklar: **B** barely (zar zor) / **C** selectively (seçici olarak) / **D** accidentally (kazara) / **E** reluctantly (isteksizce).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Overfishing has begun to ---- the stocks of many species, and some fish populations are now too small to recover naturally.$q$, array[$o$appoint$o$, $o$deplete$o$, $o$adopt$o$, $o$convince$o$, $o$reveal$o$], 1, $e$1. Boşluğa **deplete** (tüketmek) gelir. Popülasyonların kendini toparlayamayacak kadar küçülmesi stokların tükenmesi demektir.

Diğer şıklar: **A** appoint (atamak) / **C** adopt (benimsemek) / **D** convince (ikna etmek) / **E** reveal (ortaya çıkarmak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Doctors say that eating more fruit and vegetables cannot ---- a lack of exercise, as both are essential for good health.$q$, array[$o$look up to$o$, $o$run out of$o$, $o$keep up with$o$, $o$come across$o$, $o$make up for$o$], 4, $e$1. Boşluğa **make up for** (telafi etmek) gelir. Meyve ve sebzenin hareketsizliği telafi edemeyeceği söyleniyor.

Diğer şıklar: **A** look up to (saygı duymak) / **B** run out of (tükenmek) / **C** keep up with (ayak uydurmak) / **D** come across (rastlamak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Before any new drug is sold to the public, it must go through a long testing ----, which can last more than ten years.$q$, array[$o$procedure$o$, $o$exception$o$, $o$contribution$o$, $o$alliance$o$, $o$currency$o$], 0, $e$1. Boşluğa **procedure** (prosedür) gelir. Yıllarca süren test süreci bir prosedürdür.

Diğer şıklar: **B** exception (istisna) / **C** contribution (katkı) / **D** alliance (ittifak) / **E** currency (para birimi).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The ---- people of the Amazon basin have developed detailed knowledge of local plants, many of which are used as medicine.$q$, array[$o$immense$o$, $o$reluctant$o$, $o$spacious$o$, $o$indigenous$o$, $o$drastic$o$], 3, $e$1. Boşluğa **indigenous** (yerli) gelir. Bölgenin yerli halkı yerel bitkiler hakkında ayrıntılı bilgi geliştirmiştir.

Diğer şıklar: **A** immense (muazzam) / **B** reluctant (isteksiz) / **C** spacious (geniş) / **E** drastic (sert).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Despite decades of research, scientists have not yet been able to prove ---- that the disease is caused by a single virus.$q$, array[$o$gradually$o$, $o$conclusively$o$, $o$briefly$o$, $o$casually$o$, $o$cheerfully$o$], 1, $e$1. Boşluğa **conclusively** (kesin olarak) gelir. Kanıtlanmamış olması, nedenin kesin olarak ispatlanamadığını anlatır.

Diğer şıklar: **A** gradually (giderek) / **C** briefly (kısaca) / **D** casually (gelişigüzel) / **E** cheerfully (neşeyle).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$It is the task of the police to ---- the law and to protect citizens from crime.$q$, array[$o$diminish$o$, $o$persuade$o$, $o$enforce$o$, $o$precede$o$, $o$withdraw$o$], 2, $e$1. Boşluğa **enforce** (uygulamak) gelir. Yasayı uygulamak polisin görevidir.

Diğer şıklar: **A** diminish (azaltmak) / **B** persuade (ikna etmek) / **D** precede (önce gelmek) / **E** withdraw (geri çekmek).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Many companies are trying to ---- the growing market for electric cars by developing cheaper and more efficient batteries.$q$, array[$o$back out$o$, $o$give away$o$, $o$settle down$o$, $o$pass away$o$, $o$tap into$o$], 4, $e$1. Boşluğa **tap into** (yararlanmak) gelir. Büyüyen pazardan yararlanmak, şirketlerin ucuz batarya geliştirme amacıdır.

Diğer şıklar: **A** back out (vazgeçmek) / **B** give away (bedavaya vermek) / **C** settle down (yerleşmek) / **D** pass away (vefat etmek).$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Many of the greatest works of Renaissance art drew their ---- from the rediscovered texts and sculptures of ancient Greece and Rome.$q$, array[$o$inspiration$o$, $o$permission$o$, $o$punishment$o$, $o$expectation$o$, $o$restriction$o$], 0, $e$1. Boşluğa **inspiration** (ilham) gelir. Eserlerin eski Yunan ve Roma'dan ilham aldığı anlatılır.

Diğer şıklar: **B** permission (izin) / **C** punishment (ceza) / **D** expectation (beklenti) / **E** restriction (kısıtlama).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$In order to control inflation, the central bank raised interest rates, a ---- policy that makes borrowing more expensive.$q$, array[$o$ethical$o$, $o$verbal$o$, $o$monetary$o$, $o$spatial$o$, $o$ancient$o$], 2, $e$1. Boşluğa **monetary** (parasal) gelir. Faiz oranlarını merkez bankası belirlediği için bu bir parasal politikadır.

Diğer şıklar: **A** ethical (ahlaki) / **B** verbal (sözlü) / **D** spatial (uzamsal) / **E** ancient (antik).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Patients with heart disease are ---- checked by nurses, who measure blood pressure several times a day.$q$, array[$o$obviously$o$, $o$extremely$o$, $o$scarcely$o$, $o$routinely$o$, $o$narrowly$o$], 3, $e$1. Boşluğa **routinely** (düzenli olarak) gelir. Günde birkaç kez yapılan ölçüm, kontrolün düzenli olduğunu gösterir.

Diğer şıklar: **A** obviously (açıkça) / **B** extremely (son derece) / **C** scarcely (güçlükle) / **E** narrowly (ucu ucuna).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The organisers decided to ---- anyone under the age of eighteen from the competition, which was open only to adults.$q$, array[$o$involve$o$, $o$exclude$o$, $o$require$o$, $o$attract$o$, $o$acquire$o$], 1, $e$1. Boşluğa **exclude** (hariç tutmak) gelir. Yarışma yalnızca yetişkinlere açık olduğu için on sekiz yaşından küçükler dışarıda tutulur.

Diğer şıklar: **A** involve (dahil etmek) / **C** require (gerektirmek) / **D** attract (çekmek) / **E** acquire (edinmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The first modern bicycles ---- the workshops of French and British inventors in the 1860s, and they quickly became popular across Europe.$q$, array[$o$depended on$o$, $o$withdrew from$o$, $o$insisted on$o$, $o$settled for$o$, $o$emerged from$o$], 4, $e$1. Boşluğa **emerged from** (-den çıkmak) gelir. İlk bisikletler atölyelerden çıkmıştır.

Diğer şıklar: **A** depended on (bağlı olmak) / **B** withdrew from (çekilmek) / **C** insisted on (ısrar etmek) / **D** settled for (razı olmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Scientists test a ---- by designing experiments that could prove it wrong, and if it survives repeated tests, it may become part of a larger theory.$q$, array[$o$hypothesis$o$, $o$insurance$o$, $o$ceremony$o$, $o$ingredient$o$, $o$tradition$o$], 0, $e$1. Boşluğa **hypothesis** (hipotez) gelir. Yanlışlanabilecek deneylerle sınanan ve sonunda teoriye dönüşebilen şey hipotezdir.

Diğer şıklar: **B** insurance (sigorta) / **C** ceremony (tören) / **D** ingredient (bileşen) / **E** tradition (gelenek).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Governments are encouraging the use of ---- energy sources such as wind and solar power, which can be used for generations without being exhausted.$q$, array[$o$fragile$o$, $o$hostile$o$, $o$conventional$o$, $o$arbitrary$o$, $o$sustainable$o$], 4, $e$1. Boşluğa **sustainable** (sürdürülebilir) gelir. Nesiller boyu tükenmeden kullanılabilen kaynaklar sürdürülebilirdir. Geleneksel olan, rüzgâr ve güneşle çelişir.

Diğer şıklar: **A** fragile (kırılgan) / **B** hostile (düşmanca) / **C** conventional (geleneksel) / **D** arbitrary (keyfi).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$Several members of the family became famous, ---- the youngest daughter, who won an Olympic medal at the age of sixteen.$q$, array[$o$barely$o$, $o$evenly$o$, $o$tightly$o$, $o$notably$o$, $o$repeatedly$o$], 3, $e$1. Boşluğa **notably** (özellikle) gelir. Aileden ünlü olanlar arasında birini öne çıkaran sözcük 'özellikle' anlamındaki notably'dir.

Diğer şıklar: **A** barely (zar zor) / **B** evenly (eşit olarak) / **C** tightly (sıkıca) / **E** repeatedly (tekrar tekrar).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The construction of the dam will ---- thousands of villagers, who will have to move to new homes built on higher ground.$q$, array[$o$attach$o$, $o$displace$o$, $o$bargain$o$, $o$illustrate$o$, $o$soothe$o$], 1, $e$1. Boşluğa **displace** (yerinden etmek) gelir. Köylülerin yeni evlere taşınması gerektiği için baraj onları yerinden eder.

Diğer şıklar: **A** attach (iliştirmek) / **C** bargain (pazarlık etmek) / **D** illustrate (örneklemek) / **E** soothe (yatıştırmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Many cases of lung cancer ---- smoking, but a small number occur in people who have never smoked.$q$, array[$o$resort to$o$, $o$break into$o$, $o$get over$o$, $o$carry on$o$, $o$result from$o$], 4, $e$1. Boşluğa **result from** (-den kaynaklanmak) gelir. Akciğer kanserlerinin çoğunun sigaradan kaynaklandığı anlatılıyor.

Diğer şıklar: **A** resort to (başvurmak) / **B** break into (zorla girmek) / **C** get over (atlatmak) / **D** carry on (sürdürmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$After a person recovers from certain diseases such as measles, the body develops ---- and the same illness rarely occurs again.$q$, array[$o$hostility$o$, $o$authority$o$, $o$immunity$o$, $o$sincerity$o$, $o$vanity$o$], 2, $e$1. Boşluğa **immunity** (bağışıklık) gelir. Aynı hastalığın tekrarlanmaması vücudun bağışıklık geliştirdiğini gösterir.

Diğer şıklar: **A** hostility (düşmanlık) / **B** authority (otorite) / **D** sincerity (samimiyet) / **E** vanity (kibir).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Scientists have developed an ---- skin made of soft materials that can be attached to burn victims until their own tissue grows back.$q$, array[$o$relevant$o$, $o$artificial$o$, $o$hostile$o$, $o$fatal$o$, $o$ancient$o$], 1, $e$1. Boşluğa **artificial** (yapay) gelir. Bilim insanlarının geliştirdiği, yumuşak malzemeden yapılmış deri yapay derinin tanımıdır.

Diğer şıklar: **A** relevant (ilgili) / **C** hostile (düşmanca) / **D** fatal (ölümcül) / **E** ancient (antik).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The students worked ---- throughout the semester, spending long hours in the library, and as a result almost all of them passed the final exam.$q$, array[$o$carelessly$o$, $o$randomly$o$, $o$vaguely$o$, $o$hastily$o$, $o$diligently$o$], 4, $e$1. Boşluğa **diligently** (özenle) gelir. Kütüphanede uzun saatler çalışıp sınavı geçmek gayretli çalışmaya işaret eder.

Diğer şıklar: **A** carelessly (dikkatsizce) / **B** randomly (rastgele) / **C** vaguely (belirsizce) / **D** hastily (aceleyle).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$It is difficult to ---- the economic damage caused by the floods, since many businesses have not yet reported their losses.$q$, array[$o$tolerate$o$, $o$occupy$o$, $o$refuse$o$, $o$quantify$o$, $o$inherit$o$], 3, $e$1. Boşluğa **quantify** (ölçmek) gelir. Kayıplar bildirilmediği için zararı sayısal olarak ölçmek zordur.

Diğer şıklar: **A** tolerate (hoşgörmek) / **B** occupy (işgal etmek) / **C** refuse (reddetmek) / **E** inherit (miras almak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Doctors advise patients to ---- the diet they are given, because changing it without permission can make the treatment less effective.$q$, array[$o$wipe out$o$, $o$pass on$o$, $o$stick to$o$, $o$set off$o$, $o$back down$o$], 2, $e$1. Boşluğa **stick to** (bağlı kalmak) gelir. İzinsiz değiştirmenin zararlı olması, hastaların verilen diyete bağlı kalmasını gerektirir.

Diğer şıklar: **A** wipe out (yok etmek) / **B** pass on (aktarmak) / **D** set off (yola çıkmak) / **E** back down (geri adım atmak).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$Many of the techniques used in modern surgery were already known in ----, when Greek and Roman doctors treated wounds and broken bones.$q$, array[$o$antiquity$o$, $o$privacy$o$, $o$maturity$o$, $o$curiosity$o$, $o$fatigue$o$], 0, $e$1. Boşluğa **antiquity** (antik çağ) gelir. Yunan ve Roma hekimlerinin dönemi antik çağdır.

Diğer şıklar: **B** privacy (gizlilik) / **C** maturity (olgunluk) / **D** curiosity (merak) / **E** fatigue (yorgunluk).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The invention of the printing press had a ---- impact on European society, because books became cheap enough for ordinary people to buy.$q$, array[$o$negligible$o$, $o$temporary$o$, $o$confidential$o$, $o$ambiguous$o$, $o$tremendous$o$], 4, $e$1. Boşluğa **tremendous** (muazzam) gelir. Kitapların sıradan insanlarca alınabilir hâle gelmesi çok büyük bir etkidir.

Diğer şıklar: **A** negligible (önemsiz) / **B** temporary (geçici) / **C** confidential (gizli) / **D** ambiguous (belirsiz).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Some people argue that humans are ---- cooperative, since even very young children try to help others without being asked.$q$, array[$o$reluctantly$o$, $o$inherently$o$, $o$temporarily$o$, $o$financially$o$, $o$hardly$o$], 1, $e$1. Boşluğa **inherently** (doğası gereği) gelir. Çok küçük çocukların bile yardım etmesi, işbirliğinin doğuştan olduğu iddiasını destekler.

Diğer şıklar: **A** reluctantly (isteksizce) / **C** temporarily (geçici olarak) / **D** financially (mali olarak) / **E** hardly (zar zor).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The smell of freshly baked bread can ---- strong memories of childhood, even in people who have not been in their old homes for decades.$q$, array[$o$confess$o$, $o$depart$o$, $o$reject$o$, $o$evoke$o$, $o$violate$o$], 3, $e$1. Boşluğa **evoke** (çağrıştırmak) gelir. Koku, eski anıları uyandırır ve çağrıştırır.

Diğer şıklar: **A** confess (itiraf etmek) / **B** depart (ayrılmak) / **C** reject (reddetmek) / **E** violate (ihlal etmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Modern architects often ---- traditional building methods, combining them with new materials to create energy-efficient houses.$q$, array[$o$draw on$o$, $o$get over$o$, $o$run away$o$, $o$cut in$o$, $o$wake up$o$], 0, $e$1. Boşluğa **draw on** (yararlanmak) gelir. Geleneksel yöntemleri yeni malzemelerle birleştirmek, o yöntemlerden yararlanmak demektir.

Diğer şıklar: **B** get over (atlatmak) / **C** run away (kaçmak) / **D** cut in (lafa girmek) / **E** wake up (uyanmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Missionaries travelled across Asia in the Middle Ages, spreading the religious ---- of their faith to communities that had never heard of them.$q$, array[$o$disasters$o$, $o$vehicles$o$, $o$doctrines$o$, $o$ingredients$o$, $o$permissions$o$], 2, $e$1. Boşluğa **doctrines** (öğretiler) gelir. Dinin öğretilerini yaymak, misyonerlerin amacıdır.

Diğer şıklar: **A** disasters (felaketler) / **B** vehicles (araçlar) / **D** ingredients (bileşenler) / **E** permissions (izinler).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The arrival of large numbers of tourists in small villages can be ---- to local life, as noise and crowds change the daily routine of residents.$q$, array[$o$suitable$o$, $o$loyal$o$, $o$faithful$o$, $o$disruptive$o$, $o$reliable$o$], 3, $e$1. Boşluğa **disruptive** (düzeni bozan) gelir. Gürültü ve kalabalığın günlük düzeni değiştirmesi, yerel hayatı aksatır.

Diğer şıklar: **A** suitable (uygun) / **B** loyal (sadık) / **C** faithful (vefalı) / **E** reliable (güvenilir).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- the bridge was damaged during the earthquake, but engineers will need several weeks to examine it before they can say how serious the damage is.$q$, array[$o$Eagerly$o$, $o$Apparently$o$, $o$Equally$o$, $o$Strictly$o$, $o$Narrowly$o$], 1, $e$1. Boşluğa **Apparently** (Görünüşe göre) gelir. Hasarın boyutu henüz bilinmediği için ifade görünüşe dayalı bir tahmindir.

Diğer şıklar: **A** Eagerly (Hevesle) / **C** Equally (Eşit olarak) / **D** Strictly (Kesinlikle) / **E** Narrowly (Ucu ucuna).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The criminals tried to ---- the stolen paintings by hiding them behind the walls of an old farmhouse.$q$, array[$o$purchase$o$, $o$inspect$o$, $o$conceal$o$, $o$recover$o$, $o$transport$o$], 2, $e$1. Boşluğa **conceal** (gizlemek) gelir. Tabloları duvar arkasına saklamak, onları gizlemektir.

Diğer şıklar: **A** purchase (satın almak) / **B** inspect (incelemek) / **D** recover (geri almak) / **E** transport (taşımak).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The costs of repairing the old bridge ---- more than the cost of building a new one, so the city decided to replace it.$q$, array[$o$amount to$o$, $o$depend on$o$, $o$refer to$o$, $o$look after$o$, $o$take over$o$], 0, $e$1. Boşluğa **amount to** (toplamda ... tutmak) gelir. Onarım maliyetinin yenisinden fazla tutması amount to ile söylenir.

Diğer şıklar: **B** depend on (bağlı olmak) / **C** refer to (değinmek) / **D** look after (bakmak) / **E** take over (devralmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Experienced doctors sometimes sense that a patient is seriously ill before any tests are done, and they often describe this ability as ----, a feeling built on years of observation.$q$, array[$o$compensation$o$, $o$intuition$o$, $o$hesitation$o$, $o$settlement$o$, $o$commitment$o$], 1, $e$1. Boşluğa **intuition** (sezgi) gelir. Yılların gözlemine dayanan, testlerden önce hissedilen şey sezgidir.

Diğer şıklar: **A** compensation (tazminat) / **C** hesitation (tereddüt) / **D** settlement (yerleşim) / **E** commitment (bağlılık).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$The evidence that the climate is warming is now ----, since measurements from thousands of stations show the same trend.$q$, array[$o$negligible$o$, $o$ambiguous$o$, $o$undeniable$o$, $o$fictional$o$, $o$casual$o$], 2, $e$1. Boşluğa **undeniable** (inkâr edilemez) gelir. Binlerce istasyonun aynı eğilimi göstermesi kanıtı inkâr edilemez kılar.

Diğer şıklar: **A** negligible (önemsiz) / **B** ambiguous (belirsiz) / **D** fictional (kurgusal) / **E** casual (gelişigüzel).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The universe is ---- large, and even light, travelling at nearly 300,000 kilometres per second, needs billions of years to cross it.$q$, array[$o$narrowly$o$, $o$briefly$o$, $o$politely$o$, $o$voluntarily$o$, $o$unimaginably$o$], 4, $e$1. Boşluğa **unimaginably** (hayal edilemeyecek kadar) gelir. Işığın bile milyarlarca yılda geçebildiği bir büyüklük hayal edilemeyecek kadar büyüktür.

Diğer şıklar: **A** narrowly (ucu ucuna) / **B** briefly (kısaca) / **C** politely (kibarca) / **D** voluntarily (gönüllü olarak).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Meteorologists use satellite images and computer models to ---- the path of hurricanes several days before they reach land.$q$, array[$o$contradict$o$, $o$suppress$o$, $o$dismiss$o$, $o$predict$o$, $o$delay$o$], 3, $e$1. Boşluğa **predict** (tahmin etmek) gelir. Kasırgaların yolunu önceden söylemek tahmin etmektir.

Diğer şıklar: **A** contradict (çelişmek) / **B** suppress (bastırmak) / **C** dismiss (reddetmek) / **E** delay (geciktirmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The pilot was criticised for ---- the planned route without informing air traffic control, which put the passengers at risk.$q$, array[$o$deviating from$o$, $o$depending on$o$, $o$resorting to$o$, $o$sticking to$o$, $o$recovering from$o$], 0, $e$1. Boşluğa **deviating from** (sapmak) gelir. Planlanan rotadan haber vermeden ayrılmak, rotadan sapmaktır.

Diğer şıklar: **B** depending on (bağlı olmak) / **C** resorting to (başvurmak) / **D** sticking to (bağlı kalmak) / **E** recovering from (iyileşmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The spread of cholera in nineteenth-century cities slowed down only after governments built sewers and improved public ----.$q$, array[$o$entertainment$o$, $o$tourism$o$, $o$competition$o$, $o$advertising$o$, $o$sanitation$o$], 4, $e$1. Boşluğa **sanitation** (hijyen) gelir. Kanalizasyon yapmak ve halk sağlığı koşullarını iyileştirmek sanitasyonla ilgilidir.

Diğer şıklar: **A** entertainment (eğlence) / **B** tourism (turizm) / **C** competition (rekabet) / **D** advertising (reklam).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$In the north of the country, farming is the ---- source of income, employing far more people than industry or tourism.$q$, array[$o$temporary$o$, $o$minimal$o$, $o$predominant$o$, $o$abstract$o$, $o$fragile$o$], 2, $e$1. Boşluğa **predominant** (baskın) gelir. Sanayi ve turizmden çok daha fazla insanı çalıştıran kaynak baskın gelir kaynağıdır.

Diğer şıklar: **A** temporary (geçici) / **B** minimal (çok az) / **D** abstract (soyut) / **E** fragile (kırılgan).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The negotiations between the two sides failed ----, and the conflict that followed destroyed much of the old city.$q$, array[$o$patiently$o$, $o$catastrophically$o$, $o$favourably$o$, $o$harmlessly$o$, $o$modestly$o$], 1, $e$1. Boşluğa **catastrophically** (feci biçimde) gelir. Eski şehri yıkan bir çatışmaya yol açan başarısızlık felaket derecesindedir.

Diğer şıklar: **A** patiently (sabırla) / **C** favourably (olumlu biçimde) / **D** harmlessly (zararsızca) / **E** modestly (alçakgönüllülükle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$In maps, a blue line is often used to ---- a river, while a green area usually shows a forest or a park.$q$, array[$o$adjust$o$, $o$blame$o$, $o$defend$o$, $o$denote$o$, $o$obtain$o$], 3, $e$1. Boşluğa **denote** (göstermek) gelir. Haritada mavi çizgi nehri gösterir, yani ifade eder.

Diğer şıklar: **A** adjust (ayarlamak) / **B** blame (suçlamak) / **C** defend (savunmak) / **E** obtain (elde etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Among thousands of applicants, only those who ---- from the crowd with unusual skills or experience are invited for an interview.$q$, array[$o$stand out$o$, $o$break up$o$, $o$pass away$o$, $o$cut down$o$, $o$sign up$o$], 0, $e$1. Boşluğa **stand out** (öne çıkmak) gelir. Kalabalıktan sıyrılıp öne çıkanlar mülakata çağrılır.

Diğer şıklar: **B** break up (dağılmak) / **C** pass away (vefat etmek) / **D** cut down (azaltmak) / **E** sign up (kaydolmak).$e$, 1),
  (11, 'ydt-dil', null::integer, $q$Although she spent twenty years studying rare insects, she received little ---- from other scientists until her discovery was published in a major journal.$q$, array[$o$punishment$o$, $o$recognition$o$, $o$equipment$o$, $o$transition$o$, $o$hesitation$o$], 1, $e$1. Boşluğa **recognition** (takdir) gelir. Keşfi büyük bir dergide yayımlanana kadar diğer bilim insanlarından takdir görmemiştir.

Diğer şıklar: **A** punishment (ceza) / **C** equipment (ekipman) / **D** transition (geçiş) / **E** hesitation (tereddüt).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$Malaria is still ---- in many tropical regions, where the climate allows mosquitoes to breed throughout the year.$q$, array[$o$scarce$o$, $o$obsolete$o$, $o$desirable$o$, $o$prevalent$o$, $o$compulsory$o$], 3, $e$1. Boşluğa **prevalent** (yaygın) gelir. Sivrisineklerin yıl boyu üremesi hastalığı yaygın kılar.

Diğer şıklar: **A** scarce (nadir) / **B** obsolete (modası geçmiş) / **C** desirable (istenen) / **E** compulsory (zorunlu).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The walls of the palace are ---- decorated with tiny patterns of flowers and geometric shapes, which took craftsmen decades to complete.$q$, array[$o$plainly$o$, $o$roughly$o$, $o$accidentally$o$, $o$briefly$o$, $o$intricately$o$], 4, $e$1. Boşluğa **intricately** (girift biçimde) gelir. Ustaların on yıllarca uğraştığı süsleme ayrıntılı ve girifttir.

Diğer şıklar: **A** plainly (sade biçimde) / **B** roughly (kabaca) / **C** accidentally (kazara) / **D** briefly (kısaca).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$She decided to ---- her life to the study of whales and spent more than forty years collecting data on their migration.$q$, array[$o$abandon$o$, $o$compare$o$, $o$devote$o$, $o$disturb$o$, $o$resemble$o$], 2, $e$1. Boşluğa **devote** (adamak) gelir. Kırk yılı aşkın süre balina araştırmak, hayatını ona adamaktır.

Diğer şıklar: **A** abandon (terk etmek) / **B** compare (karşılaştırmak) / **D** disturb (rahatsız etmek) / **E** resemble (benzemek).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Students who want to ---- a scholarship must submit their documents to the faculty office by the end of March.$q$, array[$o$apply for$o$, $o$account for$o$, $o$care for$o$, $o$stand for$o$, $o$pay for$o$], 0, $e$1. Boşluğa **apply for** (başvurmak) gelir. Burs için belge teslim etmek, bursa başvurmaktır.

Diğer şıklar: **B** account for (açıklamak) / **C** care for (bakmak) / **D** stand for (anlamına gelmek) / **E** pay for (ödemek).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$The sudden collapse of the country's largest bank had serious ---- for the whole economy, and thousands of small businesses were forced to close.$q$, array[$o$coincidences$o$, $o$repercussions$o$, $o$assignments$o$, $o$reservations$o$, $o$signatures$o$], 1, $e$1. Boşluğa **repercussions** (olumsuz sonuçlar) gelir. Binlerce küçük işletmenin kapanması, bankanın çöküşünün ağır yansımalarıdır.

Diğer şıklar: **A** coincidences (tesadüfler) / **C** assignments (ödevler) / **D** reservations (çekinceler) / **E** signatures (imzalar).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The discovery of penicillin played a ---- role in modern medicine, since it made it possible to cure infections that had once been fatal.$q$, array[$o$peripheral$o$, $o$frivolous$o$, $o$hesitant$o$, $o$pivotal$o$, $o$spontaneous$o$], 3, $e$1. Boşluğa **pivotal** (kilit) gelir. Ölümcül enfeksiyonları tedavi edilebilir kılan buluş modern tıpta kilit rol oynar.

Diğer şıklar: **A** peripheral (ikincil) / **B** frivolous (önemsiz) / **C** hesitant (tereddütlü) / **E** spontaneous (kendiliğinden).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The young goalkeeper handled the pressure ----, saving three penalties in a row and helping his team to reach the final.$q$, array[$o$hardly$o$, $o$loosely$o$, $o$sharply$o$, $o$unfairly$o$, $o$admirably$o$], 4, $e$1. Boşluğa **admirably** (takdire şayan biçimde) gelir. Üç penaltı kurtarmak takdire şayan bir performanstır.

Diğer şıklar: **A** hardly (zar zor) / **B** loosely (gevşekçe) / **C** sharply (keskin biçimde) / **D** unfairly (haksızca).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$When sugar is added to hot tea, it begins to ----, and soon the crystals disappear completely.$q$, array[$o$dissolve$o$, $o$collide$o$, $o$ignore$o$, $o$expand$o$, $o$obey$o$], 0, $e$1. Boşluğa **dissolve** (erimek) gelir. Kristallerin tamamen kaybolması şekerin çayda erimesidir.

Diğer şıklar: **B** collide (çarpışmak) / **C** ignore (görmezden gelmek) / **D** expand (genişlemek) / **E** obey (itaat etmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The company plans to ---- its new software in thirty countries next year, after testing it with a small group of customers.$q$, array[$o$back out$o$, $o$drop in$o$, $o$roll out$o$, $o$fall out$o$, $o$call off$o$], 2, $e$1. Boşluğa **roll out** (kullanıma sunmak) gelir. Küçük bir müşteri grubunda denendikten sonra yazılımı otuz ülkede kullanıma sunmak roll out ile anlatılır.

Diğer şıklar: **A** back out (vazgeçmek) / **B** drop in (uğramak) / **D** fall out (tartışmak) / **E** call off (iptal etmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 5
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 5$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- of the flight from Istanbul to London is about four hours, depending on the weather and wind conditions.$q$, array[$o$hostility$o$, $o$ownership$o$, $o$authority$o$, $o$duration$o$, $o$reaction$o$], 3, $e$1. Boşluğa **duration** (süre) gelir. Uçuşun kaç saat sürdüğü, uçuşun süresiyle ifade edilir.

Diğer şıklar: **A** hostility (düşmanlık) / **B** ownership (sahiplik) / **C** authority (otorite) / **E** reaction (tepki).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The climate of the region has undergone a ---- change over thousands of years rather than a sudden one.$q$, array[$o$hostile$o$, $o$gradual$o$, $o$absolute$o$, $o$vital$o$, $o$eager$o$], 1, $e$1. Boşluğa **gradual** (kademeli) gelir. Ani değişimin karşıtı kademeli değişimdir.

Diğer şıklar: **A** hostile (düşmanca) / **C** absolute (mutlak) / **D** vital (hayati) / **E** eager (hevesli).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The new library was ---- popular among students, who filled its study rooms from early morning until midnight.$q$, array[$o$immensely$o$, $o$narrowly$o$, $o$barely$o$, $o$loosely$o$, $o$gently$o$], 0, $e$1. Boşluğa **immensely** (son derece) gelir. Sabahtan geceye kadar dolu olması kütüphanenin son derece popüler olduğunu gösterir.

Diğer şıklar: **B** narrowly (ucu ucuna) / **C** barely (zar zor) / **D** loosely (gevşekçe) / **E** gently (nazikçe).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The government tried to ---- the news of the disaster, but the story quickly spread through social media.$q$, array[$o$affirm$o$, $o$refine$o$, $o$suppress$o$, $o$assist$o$, $o$persist$o$], 2, $e$1. Boşluğa **suppress** (bastırmak) gelir. Haberin sosyal medyada yayılması, hükümetin haberi bastırmaya çalıştığını gösterir.

Diğer şıklar: **A** affirm (onaylamak) / **B** refine (arıtmak) / **D** assist (yardım etmek) / **E** persist (ısrar etmek).$e$, 3),
  (5, 'ydt-dil', null::integer, $q$In his report, the inspector ---- several serious safety problems in the factory and recommended that it be closed until they were fixed.$q$, array[$o$gave away$o$, $o$backed up$o$, $o$put on$o$, $o$came into$o$, $o$pointed out$o$], 4, $e$1. Boşluğa **pointed out** (belirtmek) gelir. Müfettiş raporunda sorunları belirtmiştir.

Diğer şıklar: **A** gave away (bedavaya vermek) / **B** backed up (desteklemek) / **C** put on (giymek) / **D** came into (girmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The emperor was killed in a ---- planned by a small group of senators who feared that he was becoming too powerful.$q$, array[$o$conspiracy$o$, $o$generation$o$, $o$constitution$o$, $o$expedition$o$, $o$occupation$o$], 0, $e$1. Boşluğa **conspiracy** (komplo) gelir. Güçlü olmasından korkan senatörlerin planı bir komplodur.

Diğer şıklar: **B** generation (nesil) / **C** constitution (anayasa) / **D** expedition (sefer) / **E** occupation (meslek).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$Doctors warn that ---- consumption of salt can raise blood pressure and increase the risk of heart disease.$q$, array[$o$marginal$o$, $o$excessive$o$, $o$ambiguous$o$, $o$fragile$o$, $o$reluctant$o$], 1, $e$1. Boşluğa **excessive** (aşırı) gelir. Tansiyonu artıran şey tuzun aşırı tüketilmesidir.

Diğer şıklar: **A** marginal (sınırda) / **C** ambiguous (belirsiz) / **D** fragile (kırılgan) / **E** reluctant (isteksiz).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The villagers decided ---- to rebuild the school, and each family contributed money, tools or labour.$q$, array[$o$fatally$o$, $o$lengthily$o$, $o$collectively$o$, $o$dimly$o$, $o$rudely$o$], 2, $e$1. Boşluğa **collectively** (toplu olarak) gelir. Her ailenin katkıda bulunması kararın hep birlikte alındığını gösterir.

Diğer şıklar: **A** fatally (ölümcül biçimde) / **B** lengthily (uzun uzadıya) / **D** dimly (loş biçimde) / **E** rudely (kabaca).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Volunteers arrived at dawn to ---- food and blankets to the families whose homes had been destroyed by the earthquake.$q$, array[$o$distribute$o$, $o$abandon$o$, $o$criticise$o$, $o$postpone$o$, $o$calculate$o$], 0, $e$1. Boşluğa **distribute** (dağıtmak) gelir. Gönüllüler gıda ve battaniye dağıtmak için gelmiştir.

Diğer şıklar: **B** abandon (terk etmek) / **C** criticise (eleştirmek) / **D** postpone (ertelemek) / **E** calculate (hesaplamak).$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The climate of the northern coast ---- that of the southern regions in many ways, with colder winters and much heavier rainfall.$q$, array[$o$depends on$o$, $o$results from$o$, $o$refers to$o$, $o$agrees with$o$, $o$differs from$o$], 4, $e$1. Boşluğa **differs from** (-den farklı olmak) gelir. Daha soğuk kış ve daha çok yağış kuzey kıyısının güneyden farklı olduğunu gösterir.

Diğer şıklar: **A** depends on (bağlı olmak) / **B** results from (-den kaynaklanmak) / **C** refers to (değinmek) / **D** agrees with (uyuşmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Early medical ---- such as vaccination and clean drinking water have saved far more lives than most modern treatments.$q$, array[$o$prejudices$o$, $o$restrictions$o$, $o$interventions$o$, $o$ingredients$o$, $o$departures$o$], 2, $e$1. Boşluğa **interventions** (müdahaleler) gelir. Aşı ve temiz su gibi uygulamalar tıbbi müdahalelerdir.

Diğer şıklar: **A** prejudices (önyargılar) / **B** restrictions (kısıtlamalar) / **D** ingredients (bileşenler) / **E** departures (ayrılışlar).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Economists were ---- about the future after the company reported its third consecutive year of falling profits.$q$, array[$o$enthusiastic$o$, $o$hospitable$o$, $o$vigorous$o$, $o$pessimistic$o$, $o$gentle$o$], 3, $e$1. Boşluğa **pessimistic** (kötümser) gelir. Üç yıl üst üste azalan kârdan sonra ekonomistlerin geleceğe kötümser bakması beklenir.

Diğer şıklar: **A** enthusiastic (istekli) / **B** hospitable (konuksever) / **C** vigorous (dinç) / **E** gentle (nazik).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The scientist ---- discovered the new substance while cleaning his laboratory equipment, and it later became one of the most useful materials in industry.$q$, array[$o$deliberately$o$, $o$inadvertently$o$, $o$eagerly$o$, $o$officially$o$, $o$gradually$o$], 1, $e$1. Boşluğa **inadvertently** (istemeden) gelir. Alet temizlerken tesadüfen bulunan madde, istemeden keşfedilmiştir.

Diğer şıklar: **A** deliberately (kasıtlı olarak) / **C** eagerly (hevesle) / **D** officially (resmen) / **E** gradually (giderek).$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The success of the film's lead actor tended to ---- the achievements of the rest of the cast, who received little attention from journalists.$q$, array[$o$approach$o$, $o$sustain$o$, $o$overshadow$o$, $o$witness$o$, $o$compensate$o$], 2, $e$1. Boşluğa **overshadow** (gölgede bırakmak) gelir. Diğer oyuncuların az ilgi görmesi, başarılarının gölgede kalmasıdır.

Diğer şıklar: **A** approach (yaklaşmak) / **B** sustain (sürdürmek) / **D** witness (tanık olmak) / **E** compensate (telafi etmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The disease ---- almost half of the population of Europe in the fourteenth century, leaving many villages completely empty.$q$, array[$o$took over$o$, $o$set off$o$, $o$carried on$o$, $o$wiped out$o$, $o$dropped in$o$], 3, $e$1. Boşluğa **wiped out** (yok etmek) gelir. Köylerin bomboş kalması hastalığın nüfusu yok etmesidir.

Diğer şıklar: **A** took over (devralmak) / **B** set off (yola çıkmak) / **C** carried on (sürdürmek) / **E** dropped in (uğramak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The team faced several ---- during the project, including delays in delivery and a sudden shortage of funds, but it still finished on time.$q$, array[$o$inventions$o$, $o$ceremonies$o$, $o$witnesses$o$, $o$pioneers$o$, $o$setbacks$o$], 4, $e$1. Boşluğa **setbacks** (aksilikler) gelir. Teslimat gecikmeleri ve para sıkıntısı projenin önündeki aksiliklerdir.

Diğer şıklar: **A** inventions (icatlar) / **B** ceremonies (törenler) / **C** witnesses (tanıklar) / **D** pioneers (öncüler).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The introduction of the steam engine brought ---- changes to the way goods were produced and transported across Europe.$q$, array[$o$literal$o$, $o$radical$o$, $o$vacant$o$, $o$compact$o$, $o$jealous$o$], 1, $e$1. Boşluğa **radical** (köklü) gelir. Üretim ve taşıma biçimini değiştiren etki köklü değişimdir.

Diğer şıklar: **A** literal (kelimesi kelimesine) / **C** vacant (boş) / **D** compact (sıkışık) / **E** jealous (kıskanç).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Many children in the region cannot study ---- because their schools do not have enough books, desks or qualified teachers.$q$, array[$o$adequately$o$, $o$splendidly$o$, $o$hastily$o$, $o$willingly$o$, $o$obviously$o$], 0, $e$1. Boşluğa **adequately** (yeterince) gelir. Kitap, sıra ve öğretmen eksikliği çocukların yeterince ders çalışamamasına yol açar.

Diğer şıklar: **B** splendidly (muhteşem biçimde) / **C** hastily (aceleyle) / **D** willingly (isteyerek) / **E** obviously (açıkça).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The old bridge seems to ---- the laws of physics, since it hangs in the air with no visible support and yet can carry heavy trucks.$q$, array[$o$obey$o$, $o$reflect$o$, $o$estimate$o$, $o$defy$o$, $o$dismiss$o$], 3, $e$1. Boşluğa **defy** (meydan okumak) gelir. Desteksiz durup ağır kamyonları taşıması fizik kurallarına meydan okumaktır.

Diğer şıklar: **A** obey (uymak) / **B** reflect (yansıtmak) / **C** estimate (tahmin etmek) / **E** dismiss (reddetmek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Over many years, fatty deposits can ---- in the arteries and eventually block the flow of blood to the heart.$q$, array[$o$take off$o$, $o$go off$o$, $o$hold on$o$, $o$settle for$o$, $o$build up$o$], 4, $e$1. Boşluğa **build up** (birikmek) gelir. Atardamarda yağın zamanla birikmesi build up ile söylenir.

Diğer şıklar: **A** take off (havalanmak) / **B** go off (bozulmak) / **C** hold on (tutunmak) / **D** settle for (razı olmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 6
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 6$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Students who set clear goals for themselves usually show higher ---- and are more likely to keep studying even when the subject becomes difficult.$q$, array[$o$motivation$o$, $o$ceremony$o$, $o$revenue$o$, $o$witness$o$, $o$gravity$o$], 0, $e$1. Boşluğa **motivation** (motivasyon) gelir. Zor konuda bile çalışmayı sürdürme eğilimi, yüksek motivasyonun göstergesidir.

Diğer şıklar: **B** ceremony (tören) / **C** revenue (gelir) / **D** witness (tanık) / **E** gravity (yerçekimi).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Children who grow up in a ---- family, where parents encourage them and listen to their worries, usually develop greater self-confidence.$q$, array[$o$hostile$o$, $o$supportive$o$, $o$vacant$o$, $o$brutal$o$, $o$sceptical$o$], 1, $e$1. Boşluğa **supportive** (destekleyici) gelir. Çocuklarını cesaretlendiren ve dinleyen aile destekleyicidir.

Diğer şıklar: **A** hostile (düşmanca) / **C** vacant (boş) / **D** brutal (acımasız) / **E** sceptical (kuşkucu).$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Living costs in the small town are ---- low, so many young families prefer it to the expensive city centre.$q$, array[$o$purposely$o$, $o$anxiously$o$, $o$permanently$o$, $o$eagerly$o$, $o$comparatively$o$], 4, $e$1. Boşluğa **comparatively** (nispeten) gelir. Pahalı şehir merkeziyle kıyaslanınca masraflar nispeten düşüktür.

Diğer şıklar: **A** purposely (kasıtlı olarak) / **B** anxiously (endişeyle) / **C** permanently (kalıcı olarak) / **D** eagerly (hevesle).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Good teachers do not only teach facts, they also ---- curiosity in their students and help them to become independent thinkers.$q$, array[$o$suppress$o$, $o$declare$o$, $o$nurture$o$, $o$exhaust$o$, $o$reserve$o$], 2, $e$1. Boşluğa **nurture** (beslemek) gelir. Bağımsız düşünmeye yardım etmek merakı beslemektir.

Diğer şıklar: **A** suppress (bastırmak) / **B** declare (ilan etmek) / **D** exhaust (tüketmek) / **E** reserve (ayırtmak).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Because of the economic crisis, the factory had to ---- last year, and almost five hundred workers lost their jobs.$q$, array[$o$shut down$o$, $o$take up$o$, $o$look up$o$, $o$speed up$o$, $o$build up$o$], 0, $e$1. Boşluğa **shut down** (kapanmak) gelir. İşçilerin işini kaybetmesi fabrikanın kapanmasıdır.

Diğer şıklar: **B** take up (başlamak) / **C** look up (aramak) / **D** speed up (hızlanmak) / **E** build up (birikmek).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Doctors measure the ---- of a burn by looking at how deeply it has damaged the layers of the skin.$q$, array[$o$generosity$o$, $o$pleasure$o$, $o$vocabulary$o$, $o$severity$o$, $o$ownership$o$], 3, $e$1. Boşluğa **severity** (şiddet) gelir. Derinin ne kadar derin hasar gördüğü yanığın ciddiyetini belirler.

Diğer şıklar: **A** generosity (cömertlik) / **B** pleasure (zevk) / **C** vocabulary (kelime hazinesi) / **E** ownership (sahiplik).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The results of the first clinical trial were ----, so researchers decided to repeat the experiment with a much larger group of patients.$q$, array[$o$remarkable$o$, $o$inconclusive$o$, $o$dramatic$o$, $o$harmless$o$, $o$credible$o$], 1, $e$1. Boşluğa **inconclusive** (kesin olmayan) gelir. Deneyi daha büyük bir grupla tekrarlama kararı, sonuçların kesin olmadığını gösterir.

Diğer şıklar: **A** remarkable (dikkat çekici) / **C** dramatic (çarpıcı) / **D** harmless (zararsız) / **E** credible (güvenilir).$e$, 3),
  (8, 'ydt-dil', null::integer, $q$The secretary worked ---- on every detail of the report, checking each figure three times before sending it to the director.$q$, array[$o$carelessly$o$, $o$rapidly$o$, $o$casually$o$, $o$bitterly$o$, $o$conscientiously$o$], 4, $e$1. Boşluğa **conscientiously** (titizlikle) gelir. Her rakamı üç kez kontrol etmek titiz çalışmaktır.

Diğer şıklar: **A** carelessly (dikkatsizce) / **B** rapidly (hızlıca) / **C** casually (gelişigüzel) / **D** bitterly (acı biçimde).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The sharp needle was able to ---- the thick skin of the fruit without leaving a large hole.$q$, array[$o$cure$o$, $o$reject$o$, $o$import$o$, $o$pierce$o$, $o$pause$o$], 3, $e$1. Boşluğa **pierce** (delmek) gelir. İğne meyvenin kalın kabuğunu delmiştir.

Diğer şıklar: **A** cure (iyileştirmek) / **B** reject (reddetmek) / **C** import (ithal etmek) / **E** pause (duraklamak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Some people are naturally good at ---- stress, while others need professional help to deal with pressure at work.$q$, array[$o$giving up$o$, $o$showing off$o$, $o$coping with$o$, $o$turning into$o$, $o$passing by$o$], 2, $e$1. Boşluğa **coping with** (başa çıkmak) gelir. Stresle başa çıkmak coping with ile söylenir.

Diğer şıklar: **A** giving up (vazgeçmek) / **B** showing off (gösteriş yapmak) / **D** turning into (dönüşmek) / **E** passing by (yanından geçmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Becoming a skilled violinist requires not only talent but also years of practice, since ---- of the instrument cannot be achieved quickly.$q$, array[$o$ignorance$o$, $o$destruction$o$, $o$retirement$o$, $o$sympathy$o$, $o$mastery$o$], 4, $e$1. Boşluğa **mastery** (ustalık) gelir. Yıllarca çalışmayı gerektiren şey enstrümanda ustalıktır.

Diğer şıklar: **A** ignorance (cehalet) / **B** destruction (yıkım) / **C** retirement (emeklilik) / **D** sympathy (sempati).$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Construction workers face many ---- hazards, such as falls from heights, heavy machinery and exposure to dust and noise.$q$, array[$o$ceremonial$o$, $o$occupational$o$, $o$spiritual$o$, $o$seasonal$o$, $o$domestic$o$], 1, $e$1. Boşluğa **occupational** (mesleki) gelir. İş yerinde karşılaşılan tehlikeler mesleki risklerdir.

Diğer şıklar: **A** ceremonial (törensel) / **C** spiritual (ruhsal) / **D** seasonal (mevsimlik) / **E** domestic (evsel).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The lights in the corridor switch on ---- when someone enters, so there is no need to press any button.$q$, array[$o$bitterly$o$, $o$mutually$o$, $o$automatically$o$, $o$nervously$o$, $o$politely$o$], 2, $e$1. Boşluğa **automatically** (otomatik olarak) gelir. Düğmeye basmaya gerek kalmaması ışıkların otomatik yandığını gösterir.

Diğer şıklar: **A** bitterly (acı biçimde) / **B** mutually (karşılıklı olarak) / **D** nervously (gergin biçimde) / **E** politely (kibarca).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$Wind turbines ---- electricity by using the movement of the air to turn large blades connected to a generator.$q$, array[$o$admire$o$, $o$enclose$o$, $o$resist$o$, $o$generate$o$, $o$overlook$o$], 3, $e$1. Boşluğa **generate** (üretmek) gelir. Jeneratöre bağlı kanatlar elektrik üretir.

Diğer şıklar: **A** admire (hayran olmak) / **B** enclose (çevrelemek) / **C** resist (direnmek) / **E** overlook (gözden kaçırmak).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Teenagers who regularly ---- sports activities tend to sleep better and are less likely to suffer from depression.$q$, array[$o$run out of$o$, $o$engage in$o$, $o$account for$o$, $o$look after$o$, $o$hold back$o$], 1, $e$1. Boşluğa **engage in** (katılmak) gelir. Düzenli spor yapan gençler spora katılanlardır.

Diğer şıklar: **A** run out of (tükenmek) / **C** account for (açıklamak) / **D** look after (bakmak) / **E** hold back (engellemek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The worldwide ---- of smallpox, achieved through a long vaccination campaign, was declared complete by the World Health Organization in 1980.$q$, array[$o$nomination$o$, $o$negotiation$o$, $o$suspicion$o$, $o$evaluation$o$, $o$eradication$o$], 4, $e$1. Boşluğa **eradication** (kökünün kazınması) gelir. Uzun bir aşı kampanyasıyla hastalığın tamamen yok edilmesi eradikasyondur.

Diğer şıklar: **A** nomination (aday gösterme) / **B** negotiation (müzakere) / **C** suspicion (şüphe) / **D** evaluation (değerlendirme).$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Although the idea is interesting from a ---- point of view, there is no practical way to test it with the technology available today.$q$, array[$o$theoretical$o$, $o$mandatory$o$, $o$spacious$o$, $o$distant$o$, $o$honest$o$], 0, $e$1. Boşluğa **theoretical** (kuramsal) gelir. Pratikte sınanamayan bir fikir yalnızca kuramsal olarak ilginçtir.

Diğer şıklar: **B** mandatory (zorunlu) / **C** spacious (geniş) / **D** distant (uzak) / **E** honest (dürüst).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The film's budget was ---- high, but it earned back more than ten times its cost within a year.$q$, array[$o$barely$o$, $o$mildly$o$, $o$rarely$o$, $o$enormously$o$, $o$partly$o$], 3, $e$1. Boşluğa **enormously** (son derece) gelir. Maliyetinin on katından fazla kazandığı bir filmin bütçesi çok yüksektir.

Diğer şıklar: **A** barely (zar zor) / **B** mildly (hafifçe) / **C** rarely (nadiren) / **E** partly (kısmen).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Authorities decided to ---- the residents of the coastal villages before the hurricane reached land.$q$, array[$o$interview$o$, $o$punish$o$, $o$evacuate$o$, $o$examine$o$, $o$deceive$o$], 2, $e$1. Boşluğa **evacuate** (tahliye etmek) gelir. Kasırga öncesinde sakinleri güvenli yere taşımak tahliyedir.

Diğer şıklar: **A** interview (görüşme yapmak) / **B** punish (cezalandırmak) / **D** examine (incelemek) / **E** deceive (aldatmak).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$After weeks of protests, the government finally ---- to the demands of the workers and agreed to raise their wages.$q$, array[$o$gave in$o$, $o$came up$o$, $o$ran out$o$, $o$broke down$o$, $o$set off$o$], 0, $e$1. Boşluğa **gave in** (pes etmek) gelir. Maaş artışını kabul etmek, taleplere boyun eğmektir.

Diğer şıklar: **B** came up (ortaya çıkmak) / **C** ran out (tükenmek) / **D** broke down (bozulmak) / **E** set off (yola çıkmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 7
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 7$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Environmental groups argue that the long-term ---- of fishing in the region depends on limiting the number of boats allowed in its waters.$q$, array[$o$sustainability$o$, $o$generosity$o$, $o$publicity$o$, $o$curiosity$o$, $o$hospitality$o$], 0, $e$1. Boşluğa **sustainability** (sürdürülebilirlik) gelir. Uzun vadeli balıkçılığın tekne sayısına bağlı olması sürdürülebilirlikle ilgilidir.

Diğer şıklar: **B** generosity (cömertlik) / **C** publicity (tanıtım) / **D** curiosity (merak) / **E** hospitality (konukseverlik).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Bamboo is a ---- plant that can recover quickly after being cut, which is why it is widely used in building and furniture.$q$, array[$o$fragile$o$, $o$tedious$o$, $o$resilient$o$, $o$lavish$o$, $o$hostile$o$], 2, $e$1. Boşluğa **resilient** (dayanıklı) gelir. Kesildikten sonra çabuk toparlanan bitki dirençlidir.

Diğer şıklar: **A** fragile (kırılgan) / **B** tedious (sıkıcı) / **D** lavish (cömert) / **E** hostile (düşmanca).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The explorers were ---- exhausted after crossing the mountains on foot for twelve days without enough food.$q$, array[$o$narrowly$o$, $o$formerly$o$, $o$reluctantly$o$, $o$utterly$o$, $o$rarely$o$], 3, $e$1. Boşluğa **utterly** (tamamen) gelir. On iki günlük yürüyüşten sonra tükenmişlik tamamen olur.

Diğer şıklar: **A** narrowly (ucu ucuna) / **B** formerly (eskiden) / **C** reluctantly (isteksizce) / **E** rarely (nadiren).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Strong waves and heavy rain slowly ---- the cliffs along the coast, and some houses built near the edge have already been lost.$q$, array[$o$protect$o$, $o$decorate$o$, $o$illustrate$o$, $o$negotiate$o$, $o$erode$o$], 4, $e$1. Boşluğa **erode** (aşındırmak) gelir. Falezlerin yavaş yavaş yok olması aşınmadır.

Diğer şıklar: **A** protect (korumak) / **B** decorate (süslemek) / **C** illustrate (örneklemek) / **D** negotiate (müzakere etmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Volunteers will ---- free water bottles to runners at the finish line of the marathon.$q$, array[$o$log in$o$, $o$hand out$o$, $o$grow up$o$, $o$pass by$o$, $o$look into$o$], 1, $e$1. Boşluğa **hand out** (dağıtmak) gelir. Ücretsiz su şişelerini koşucuya dağıtmak hand out'tur.

Diğer şıklar: **A** log in (giriş yapmak) / **C** grow up (büyümek) / **D** pass by (yanından geçmek) / **E** look into (araştırmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Workers in chemical factories are trained to recognise the ---- around them, such as toxic gases and highly flammable liquids.$q$, array[$o$hazards$o$, $o$rewards$o$, $o$anniversaries$o$, $o$vacations$o$, $o$appointments$o$], 0, $e$1. Boşluğa **hazards** (tehlikeler) gelir. Zehirli gaz ve yanıcı sıvılar iş yerindeki tehlikelerdir.

Diğer şıklar: **B** rewards (ödüller) / **C** anniversaries (yıldönümleri) / **D** vacations (tatiller) / **E** appointments (randevular).$e$, 1),
  (7, 'ydt-dil', null::integer, $q$The two neighbouring countries signed an agreement based on ---- respect and cooperation, ending decades of tension.$q$, array[$o$sceptical$o$, $o$feeble$o$, $o$mutual$o$, $o$vacant$o$, $o$numerous$o$], 2, $e$1. Boşluğa **mutual** (karşılıklı) gelir. İki ülkenin birbirine duyduğu saygı karşılıklıdır.

Diğer şıklar: **A** sceptical (kuşkucu) / **B** feeble (zayıf) / **D** vacant (boş) / **E** numerous (çok sayıda).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The museum's collection consists ---- of paintings from the seventeenth century, and no modern works are displayed.$q$, array[$o$gradually$o$, $o$hardly$o$, $o$lately$o$, $o$gently$o$, $o$exclusively$o$], 4, $e$1. Boşluğa **exclusively** (yalnızca) gelir. Modern eser sergilenmemesi koleksiyonun yalnızca bu dönemden oluştuğunu gösterir.

Diğer şıklar: **A** gradually (giderek) / **B** hardly (zar zor) / **C** lately (geçenlerde) / **D** gently (nazikçe).$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The government decided to ---- more than two thousand soldiers to the flooded areas to help with rescue and repair work.$q$, array[$o$overtake$o$, $o$deploy$o$, $o$retain$o$, $o$forbid$o$, $o$digest$o$], 1, $e$1. Boşluğa **deploy** (konuşlandırmak) gelir. Askerleri afet bölgesine göndermek konuşlandırmaktır.

Diğer şıklar: **A** overtake (geçmek) / **C** retain (elde tutmak) / **D** forbid (yasaklamak) / **E** digest (sindirmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Poor living conditions in crowded cities in the nineteenth century ---- many diseases, which spread quickly from one neighbourhood to another.$q$, array[$o$took part in$o$, $o$fell behind$o$, $o$looked up$o$, $o$gave rise to$o$, $o$cut off$o$], 3, $e$1. Boşluğa **gave rise to** (yol açmak) gelir. Kötü yaşam koşulları hastalıklara yol açmıştır.

Diğer şıklar: **A** took part in (katılmak) / **B** fell behind (geride kalmak) / **C** looked up (aramak) / **E** cut off (kesmek).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The scientist was arrested on charges of ----, after the police found that he had been selling secret military plans to a foreign government.$q$, array[$o$negligence$o$, $o$hospitality$o$, $o$espionage$o$, $o$compensation$o$, $o$migration$o$], 2, $e$1. Boşluğa **espionage** (casusluk) gelir. Gizli planları yabancı devlete satmak casusluktur.

Diğer şıklar: **A** negligence (ihmal) / **B** hospitality (konukseverlik) / **D** compensation (tazminat) / **E** migration (göç).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$After the accident, the government introduced more ---- safety rules for chemical plants, including monthly inspections and heavy fines.$q$, array[$o$stringent$o$, $o$flexible$o$, $o$optional$o$, $o$ordinary$o$, $o$vague$o$], 0, $e$1. Boşluğa **stringent** (sıkı) gelir. Aylık denetim ve ağır para cezaları kuralların sıkı olduğunu gösterir.

Diğer şıklar: **B** flexible (esnek) / **C** optional (isteğe bağlı) / **D** ordinary (sıradan) / **E** vague (belirsiz).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$Both researchers reached the same conclusion ----, without knowing about each other's work.$q$, array[$o$loudly$o$, $o$cheaply$o$, $o$tightly$o$, $o$independently$o$, $o$bitterly$o$], 3, $e$1. Boşluğa **independently** (bağımsız olarak) gelir. Birbirinin çalışmasından habersiz sonuca varmak bağımsız çalışmaktır.

Diğer şıklar: **A** loudly (yüksek sesle) / **B** cheaply (ucuza) / **C** tightly (sıkıca) / **E** bitterly (acı biçimde).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$The company was accused of using complicated accounting methods to ---- paying taxes for more than a decade.$q$, array[$o$accomplish$o$, $o$evade$o$, $o$resemble$o$, $o$anticipate$o$, $o$possess$o$], 1, $e$1. Boşluğa **evade** (kaçınmak) gelir. Karmaşık muhasebeyle vergi ödemekten kaçınmak evade ile söylenir.

Diğer şıklar: **A** accomplish (başarmak) / **C** resemble (benzemek) / **D** anticipate (öngörmek) / **E** possess (sahip olmak).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$It took her several months to ---- the shock of losing her job, but she eventually found a new career in teaching.$q$, array[$o$bring up$o$, $o$give off$o$, $o$break in$o$, $o$shut down$o$, $o$get over$o$], 4, $e$1. Boşluğa **get over** (atlatmak) gelir. İşini kaybetmenin şokunu atlatmak get over ile söylenir.

Diğer şıklar: **A** bring up (gündeme getirmek) / **B** give off (yaymak) / **C** break in (zorla girmek) / **D** shut down (kapatmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Many politicians use ---- to win the support of powerful people, praising them far more than they honestly deserve.$q$, array[$o$flattery$o$, $o$prejudice$o$, $o$insurance$o$, $o$privacy$o$, $o$hesitation$o$], 0, $e$1. Boşluğa **flattery** (dalkavukluk) gelir. Hak ettiğinden fazla övmek dalkavukluktur.

Diğer şıklar: **B** prejudice (önyargı) / **C** insurance (sigorta) / **D** privacy (gizlilik) / **E** hesitation (tereddüt).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The ---- tribes of the desert move from place to place with their animals, looking for water and fresh grass.$q$, array[$o$urban$o$, $o$wealthy$o$, $o$marine$o$, $o$nomadic$o$, $o$loyal$o$], 3, $e$1. Boşluğa **nomadic** (göçebe) gelir. Yer değiştirerek su ve otlak arayan topluluklar göçebedir.

Diğer şıklar: **A** urban (kentsel) / **B** wealthy (zengin) / **C** marine (denizsel) / **E** loyal (sadık).$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Tropical rainforests ---- receive more than two metres of rain a year, which explains why the vegetation is so dense.$q$, array[$o$formally$o$, $o$reluctantly$o$, $o$typically$o$, $o$abruptly$o$, $o$fiercely$o$], 2, $e$1. Boşluğa **typically** (genellikle) gelir. Yıllık yağışın genellikle iki metreyi aşması durumu tipik biçimde anlatır.

Diğer şıklar: **A** formally (resmen) / **B** reluctantly (isteksizce) / **D** abruptly (aniden) / **E** fiercely (şiddetle).$e$, 1),
  (19, 'ydt-dil', null::integer, $q$The company plans to ---- its new electric car next spring, after two years of testing on roads in several countries.$q$, array[$o$dismiss$o$, $o$launch$o$, $o$quarrel$o$, $o$attach$o$, $o$shrink$o$], 1, $e$1. Boşluğa **launch** (piyasaya sürmek) gelir. Testlerden sonra yeni arabayı piyasaya sunmak launch ile anlatılır.

Diğer şıklar: **A** dismiss (işten çıkarmak) / **C** quarrel (tartışmak) / **D** attach (iliştirmek) / **E** shrink (küçülmek).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$Local residents strongly ---- the plan to build a motorway through the forest, arguing that it would destroy wildlife.$q$, array[$o$approve of$o$, $o$apply for$o$, $o$look after$o$, $o$deal with$o$, $o$object to$o$], 4, $e$1. Boşluğa **object to** (itiraz etmek) gelir. Doğayı yok edeceğini savunanlar plana itiraz eder.

Diğer şıklar: **A** approve of (onaylamak) / **B** apply for (başvurmak) / **C** look after (bakmak) / **D** deal with (ele almak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 8
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 8$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Most genetic ---- are harmless, but a few can cause serious diseases when they affect genes that control cell growth.$q$, array[$o$ingredients$o$, $o$mutations$o$, $o$pensions$o$, $o$treaties$o$, $o$rumours$o$], 1, $e$1. Boşluğa **mutations** (mutasyonlar) gelir. Genlerde meydana gelen değişimler mutasyondur.

Diğer şıklar: **A** ingredients (bileşenler) / **C** pensions (emekli maaşları) / **D** treaties (antlaşmalar) / **E** rumours (söylentiler).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Some of the world's most ---- snakes live in Australia, where a single bite can kill a human within hours.$q$, array[$o$venomous$o$, $o$fertile$o$, $o$reluctant$o$, $o$legitimate$o$, $o$compulsory$o$], 0, $e$1. Boşluğa **venomous** (zehirli) gelir. Isırığı saatler içinde öldüren yılanlar zehirlidir.

Diğer şıklar: **B** fertile (verimli) / **C** reluctant (isteksiz) / **D** legitimate (meşru) / **E** compulsory (zorunlu).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The detective ---- slipped the letter into his pocket so that nobody in the busy cafe would notice it.$q$, array[$o$openly$o$, $o$noisily$o$, $o$discreetly$o$, $o$proudly$o$, $o$frequently$o$], 2, $e$1. Boşluğa **discreetly** (gizlice) gelir. Kimsenin fark etmemesi için yapılan hareket sezdirmeden yapılır.

Diğer şıklar: **A** openly (açıkça) / **B** noisily (gürültülü biçimde) / **D** proudly (gururla) / **E** frequently (sık sık).$e$, 3),
  (4, 'ydt-dil', null::integer, $q$Some historians ---- that the city was founded by traders, but others believe it was originally a military camp.$q$, array[$o$acquire$o$, $o$assert$o$, $o$dispose$o$, $o$transmit$o$, $o$withdraw$o$], 1, $e$1. Boşluğa **assert** (iddia etmek) gelir. Bazı tarihçilerin görüşünü ileri sürmesi assert ile ifade edilir.

Diğer şıklar: **A** acquire (edinmek) / **C** dispose (elden çıkarmak) / **D** transmit (iletmek) / **E** withdraw (geri çekmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The architect ---- the plan of the garden carefully, placing paths, fountains and flower beds in a perfectly balanced pattern.$q$, array[$o$turned down$o$, $o$took after$o$, $o$held on$o$, $o$got by$o$, $o$laid out$o$], 4, $e$1. Boşluğa **laid out** (düzenlemek) gelir. Yolları, çeşmeleri ve çiçek tarhlarını yerleştirmek planı düzenlemektir.

Diğer şıklar: **A** turned down (reddetmek) / **B** took after (benzemek) / **C** held on (tutunmak) / **D** got by (idare etmek).$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Many political ---- were forced to leave the country in the 1970s, because the government did not tolerate any criticism.$q$, array[$o$spectators$o$, $o$tenants$o$, $o$volunteers$o$, $o$dissidents$o$, $o$pioneers$o$], 3, $e$1. Boşluğa **dissidents** (muhalifler) gelir. Eleştiriye tahammül etmeyen yönetimden kaçan kişiler muhaliflerdir.

Diğer şıklar: **A** spectators (seyirciler) / **B** tenants (kiracılar) / **C** volunteers (gönüllüler) / **E** pioneers (öncüler).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$In the ---- system of medieval Europe, peasants worked the land of powerful lords in exchange for protection.$q$, array[$o$feudal$o$, $o$ethical$o$, $o$stylistic$o$, $o$metallic$o$, $o$auditory$o$], 0, $e$1. Boşluğa **feudal** (feodal) gelir. Köylülerin lordların toprağında çalıştığı sistem feodaldir.

Diğer şıklar: **B** ethical (ahlaki) / **C** stylistic (üslupsal) / **D** metallic (metalik) / **E** auditory (işitsel).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The desert is ---- dry, and some regions have not received any rain for several years.$q$, array[$o$barely$o$, $o$extremely$o$, $o$hardly$o$, $o$slightly$o$, $o$seldom$o$], 1, $e$1. Boşluğa **extremely** (son derece) gelir. Yıllarca yağmur almamak aşırı kuraklığı gösterir.

Diğer şıklar: **A** barely (zar zor) / **C** hardly (neredeyse hiç) / **D** slightly (hafifçe) / **E** seldom (nadiren).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$It took scholars many years to ---- the ancient writing on the stones, because no one could read the language.$q$, array[$o$flatter$o$, $o$recruit$o$, $o$resemble$o$, $o$decipher$o$, $o$confine$o$], 3, $e$1. Boşluğa **decipher** (çözmek) gelir. Kimsenin okuyamadığı yazıyı çözmek decipher ile anlatılır.

Diğer şıklar: **A** flatter (pohpohlamak) / **B** recruit (işe almak) / **C** resemble (benzemek) / **E** confine (sınırlamak).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The numbers on the left of the table ---- the years, while those at the top show the months.$q$, array[$o$differ from$o$, $o$give in$o$, $o$correspond to$o$, $o$look after$o$, $o$take over$o$], 2, $e$1. Boşluğa **correspond to** (karşılık gelmek) gelir. Soldaki sayıların yıllara karşılık geldiği anlatılıyor.

Diğer şıklar: **A** differ from (-den farklı olmak) / **B** give in (pes etmek) / **D** look after (bakmak) / **E** take over (devralmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$In the evenings, the hotel offers live music and other forms of ---- for guests of all ages.$q$, array[$o$evidence$o$, $o$treatment$o$, $o$punishment$o$, $o$equipment$o$, $o$entertainment$o$], 4, $e$1. Boşluğa **entertainment** (eğlence) gelir. Canlı müzik bir eğlence biçimidir.

Diğer şıklar: **A** evidence (kanıt) / **B** treatment (tedavi) / **C** punishment (ceza) / **D** equipment (ekipman).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$Before science explained thunder, people believed that it was caused by ---- beings who lived in the sky.$q$, array[$o$profitable$o$, $o$rural$o$, $o$moderate$o$, $o$supernatural$o$, $o$accurate$o$], 3, $e$1. Boşluğa **supernatural** (doğaüstü) gelir. Gökte yaşayan, bilimle açıklanamayan varlıklar doğaüstüdür.

Diğer şıklar: **A** profitable (kârlı) / **B** rural (kırsal) / **C** moderate (ılımlı) / **E** accurate (doğru).$e$, 1),
  (13, 'ydt-dil', null::integer, $q$He went to the market to buy fruit and, ----, met an old school friend whom he had not seen for more than twenty years.$q$, array[$o$hardly$o$, $o$evenly$o$, $o$incidentally$o$, $o$mainly$o$, $o$roughly$o$], 2, $e$1. Boşluğa **incidentally** (tesadüfen) gelir. Meyve almaya giderken beklenmedik biçimde eski bir arkadaşla karşılaşmak tesadüfen olur.

Diğer şıklar: **A** hardly (zar zor) / **B** evenly (eşit biçimde) / **D** mainly (çoğunlukla) / **E** roughly (kabaca).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The court decided to ---- the earlier decision, so the company still has to pay the fine.$q$, array[$o$uphold$o$, $o$reverse$o$, $o$cancel$o$, $o$abolish$o$, $o$dismiss$o$], 0, $e$1. Boşluğa **uphold** (onaylamak) gelir. Şirketin yine de ceza ödemesi, mahkemenin kararı onadığını gösterir.

Diğer şıklar: **B** reverse (bozmak) / **C** cancel (iptal etmek) / **D** abolish (kaldırmak) / **E** dismiss (reddetmek).$e$, 3),
  (15, 'ydt-dil', null::integer, $q$When their computer stopped working, the students ---- an IT specialist for help.$q$, array[$o$got along$o$, $o$turned to$o$, $o$came up$o$, $o$stood out$o$, $o$ran out$o$], 1, $e$1. Boşluğa **turned to** (başvurmak) gelir. Bilgisayar bozulunca uzmana başvurmak turn to ile söylenir.

Diğer şıklar: **A** got along (geçinmek) / **C** came up (ortaya çıkmak) / **D** stood out (öne çıkmak) / **E** ran out (tükenmek).$e$, 1),
  (16, 'ydt-dil', null::integer, $q$A spider's web is made of thin ---- of silk that are stronger than steel threads of the same thickness.$q$, array[$o$reservoirs$o$, $o$pioneers$o$, $o$strands$o$, $o$impulses$o$, $o$standards$o$], 2, $e$1. Boşluğa **strands** (teller) gelir. İpekten ince iplikçikler tel (strand) olarak adlandırılır.

Diğer şıklar: **A** reservoirs (rezervuarlar) / **B** pioneers (öncüler) / **D** impulses (dürtüler) / **E** standards (standartlar).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Canada and the United States share the longest border in the world, and the 48 ---- states form a continuous block of land south of it.$q$, array[$o$hostile$o$, $o$obscure$o$, $o$tolerant$o$, $o$cautious$o$, $o$contiguous$o$], 4, $e$1. Boşluğa **contiguous** (bitişik) gelir. Kesintisiz bir kara parçası oluşturan eyaletler bitişiktir.

Diğer şıklar: **A** hostile (düşmanca) / **B** obscure (belirsiz) / **C** tolerant (hoşgörülü) / **D** cautious (temkinli).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The rules have changed, so teachers should plan their lessons ----.$q$, array[$o$lightly$o$, $o$formerly$o$, $o$narrowly$o$, $o$accordingly$o$, $o$vaguely$o$], 3, $e$1. Boşluğa **accordingly** (ona göre) gelir. Kurallar değiştiği için dersler buna uygun planlanmalıdır.

Diğer şıklar: **A** lightly (hafifçe) / **B** formerly (eskiden) / **C** narrowly (ucu ucuna) / **E** vaguely (belirsizce).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The two ships were travelling in thick fog and ---- near the harbour, causing serious damage to both.$q$, array[$o$collided$o$, $o$embarked$o$, $o$glanced$o$, $o$marched$o$, $o$ruled$o$], 0, $e$1. Boşluğa **collided** (çarpışmak) gelir. İki geminin birbirine zarar vermesi çarpışmadır.

Diğer şıklar: **B** embarked (bindi) / **C** glanced (göz attı) / **D** marched (yürüdü) / **E** ruled (hüküm sürdü).$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The committee was accused of trying to ---- the proposal so that powerful companies would not be affected by it.$q$, array[$o$fill in$o$, $o$pick out$o$, $o$make up for$o$, $o$settle down$o$, $o$water down$o$], 4, $e$1. Boşluğa **water down** (sulandırmak) gelir. Teklifin etkisini zayıflatmak water down ile anlatılır.

Diğer şıklar: **A** fill in (doldurmak) / **B** pick out (seçmek) / **C** make up for (telafi etmek) / **D** settle down (yerleşmek).$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 9
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 9$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Before vaccines were developed, deadly ---- of diseases such as smallpox and cholera regularly swept through crowded cities.$q$, array[$o$epidemics$o$, $o$ceremonies$o$, $o$currencies$o$, $o$alliances$o$, $o$cabinets$o$], 0, $e$1. Boşluğa **epidemics** (salgınlar) gelir. Şehirleri kasıp kavuran hastalık dalgaları salgındır.

Diğer şıklar: **B** ceremonies (törenler) / **C** currencies (para birimleri) / **D** alliances (ittifaklar) / **E** cabinets (kabineler).$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Rather than arguing about ideals, the new mayor took a ---- approach and chose the solutions that were cheapest and easiest to apply.$q$, array[$o$hostile$o$, $o$pragmatic$o$, $o$fragile$o$, $o$ceremonial$o$, $o$spiritual$o$], 1, $e$1. Boşluğa **pragmatic** (pratik) gelir. En ucuz ve uygulanabilir çözümü seçen yaklaşım pragmatiktir.

Diğer şıklar: **A** hostile (düşmanca) / **C** fragile (kırılgan) / **D** ceremonial (törensel) / **E** spiritual (ruhsal).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$Without treatment, the disease ---- damages the nerves, and patients lose the ability to walk, speak and eventually swallow.$q$, array[$o$hardly$o$, $o$politely$o$, $o$formerly$o$, $o$progressively$o$, $o$barely$o$], 3, $e$1. Boşluğa **progressively** (giderek) gelir. Önce yürüme, sonra konuşma ve yutma yeteneğinin kaybı hastalığın giderek ilerlediğini gösterir.

Diğer şıklar: **A** hardly (zar zor) / **B** politely (kibarca) / **C** formerly (eskiden) / **E** barely (zar zor).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Every year, people gather at the monument to ---- the soldiers who lost their lives in the war.$q$, array[$o$dominate$o$, $o$interrupt$o$, $o$commemorate$o$, $o$recruit$o$, $o$evaluate$o$], 2, $e$1. Boşluğa **commemorate** (anmak) gelir. Anıtta şehitleri toplanıp anmak commemorate ile söylenir.

Diğer şıklar: **A** dominate (egemen olmak) / **B** interrupt (bölmek) / **D** recruit (işe almak) / **E** evaluate (değerlendirmek).$e$, 2),
  (5, 'ydt-dil', null::integer, $q$With good care, the small seed can ---- a tall tree within a few years.$q$, array[$o$look after$o$, $o$give up$o$, $o$fall apart$o$, $o$take part$o$, $o$turn into$o$], 4, $e$1. Boşluğa **turn into** (dönüşmek) gelir. Tohumun büyüyüp ağaç olması dönüşmektir.

Diğer şıklar: **A** look after (bakmak) / **B** give up (vazgeçmek) / **C** fall apart (dağılmak) / **D** take part (katılmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The company's financial reports are subject to close ---- by independent auditors, who check every figure for possible errors or fraud.$q$, array[$o$allowance$o$, $o$ambition$o$, $o$hostility$o$, $o$scrutiny$o$, $o$pension$o$], 3, $e$1. Boşluğa **scrutiny** (sıkı denetim) gelir. Her rakamın hata ve hile için kontrol edilmesi yakın incelemedir.

Diğer şıklar: **A** allowance (ödenek) / **B** ambition (hırs) / **C** hostility (düşmanlık) / **E** pension (emekli maaşı).$e$, 3),
  (7, 'ydt-dil', null::integer, $q$The ship had to sail through ---- waters, where strong winds and high waves made the journey extremely dangerous.$q$, array[$o$tranquil$o$, $o$turbulent$o$, $o$pleasant$o$, $o$modest$o$, $o$diplomatic$o$], 1, $e$1. Boşluğa **turbulent** (çalkantılı) gelir. Güçlü rüzgâr ve yüksek dalgalı sular çalkantılıdır.

Diğer şıklar: **A** tranquil (sakin) / **C** pleasant (hoş) / **D** modest (mütevazı) / **E** diplomatic (diplomatik).$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Before eating, you should wash fruit and vegetables ---- to remove dirt and any chemicals left on their skin.$q$, array[$o$hardly$o$, $o$lately$o$, $o$suddenly$o$, $o$mildly$o$, $o$thoroughly$o$], 4, $e$1. Boşluğa **thoroughly** (iyice) gelir. Kir ve kimyasalı gidermek için iyice yıkamak gerekir.

Diğer şıklar: **A** hardly (neredeyse hiç) / **B** lately (son zamanlarda) / **C** suddenly (aniden) / **D** mildly (hafifçe).$e$, 1),
  (9, 'ydt-dil', null::integer, $q$Employers are required to ---- income tax from their workers' salaries and pay it directly to the government.$q$, array[$o$import$o$, $o$prevent$o$, $o$deduct$o$, $o$admire$o$, $o$reside$o$], 2, $e$1. Boşluğa **deduct** (kesmek) gelir. Maaştan vergi kesmek deduct ile söylenir.

Diğer şıklar: **A** import (ithal etmek) / **B** prevent (önlemek) / **D** admire (hayran olmak) / **E** reside (ikamet etmek).$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Some farmers hang bright objects in their fields to ---- birds that might eat the crops.$q$, array[$o$ward off$o$, $o$take on$o$, $o$draw up$o$, $o$tear down$o$, $o$hold up$o$], 0, $e$1. Boşluğa **ward off** (savuşturmak) gelir. Ürünü yiyebilecek kuşları uzak tutmak ward off'tur.

Diğer şıklar: **B** take on (üstlenmek) / **C** draw up (hazırlamak) / **D** tear down (yıkmak) / **E** hold up (geciktirmek).$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Plants take in ---- from the soil through their roots, and without enough of it their leaves begin to dry and fall.$q$, array[$o$pressure$o$, $o$audience$o$, $o$evidence$o$, $o$reputation$o$, $o$moisture$o$], 4, $e$1. Boşluğa **moisture** (nem) gelir. Kökle topraktan alınan ve eksikliğinde yaprakları kurutan şey nemdir.

Diğer şıklar: **A** pressure (basınç) / **B** audience (izleyici) / **C** evidence (kanıt) / **D** reputation (itibar).$e$, 1),
  (12, 'ydt-dil', null::integer, $q$The team's ---- efforts to find the missing hikers continued day and night for a week, despite heavy snow and freezing temperatures.$q$, array[$o$negligible$o$, $o$casual$o$, $o$relentless$o$, $o$reluctant$o$, $o$premature$o$], 2, $e$1. Boşluğa **relentless** (amansız) gelir. Kar ve soğuğa rağmen gece gündüz süren çaba amansızdır.

Diğer şıklar: **A** negligible (önemsiz) / **B** casual (gelişigüzel) / **D** reluctant (isteksiz) / **E** premature (erken).$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The old sailor remembered the storm ----, describing every wave and every sound as if it had happened yesterday.$q$, array[$o$slightly$o$, $o$vividly$o$, $o$merely$o$, $o$hastily$o$, $o$rarely$o$], 1, $e$1. Boşluğa **vividly** (canlı biçimde) gelir. Her dalgayı ve sesi anlatmak canlı hatırlamaktır.

Diğer şıklar: **A** slightly (hafifçe) / **C** merely (sadece) / **D** hastily (aceleyle) / **E** rarely (nadiren).$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The painting seems to ---- a peaceful village scene, with farmers working in the fields and children playing by a river.$q$, array[$o$depict$o$, $o$persuade$o$, $o$interrupt$o$, $o$bargain$o$, $o$crush$o$], 0, $e$1. Boşluğa **depict** (betimlemek) gelir. Tablonun bir köy sahnesini göstermesi tasvir etmektir.

Diğer şıklar: **B** persuade (ikna etmek) / **C** interrupt (bölmek) / **D** bargain (pazarlık etmek) / **E** crush (ezmek).$e$, 1),
  (15, 'ydt-dil', null::integer, $q$Large dogs ---- to live shorter lives than small ones, although the reasons for this are still not completely clear.$q$, array[$o$refer to$o$, $o$lead to$o$, $o$belong to$o$, $o$tend to$o$, $o$stick to$o$], 3, $e$1. Boşluğa **tend to** (eğilimli olmak) gelir. Büyük köpeklerin kısa yaşama eğilimi vardır.

Diğer şıklar: **A** refer to (değinmek) / **B** lead to (yol açmak) / **C** belong to (ait olmak) / **E** stick to (bağlı kalmak).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Many ---- have lived for years among remote tribes in order to understand their customs, beliefs and family structures.$q$, array[$o$auditors$o$, $o$anthropologists$o$, $o$pilots$o$, $o$mayors$o$, $o$athletes$o$], 1, $e$1. Boşluğa **anthropologists** (antropologlar) gelir. Kabilelerin gelenek ve inançlarını inceleyenler antropologlardır.

Diğer şıklar: **A** auditors (denetçiler) / **C** pilots (pilotlar) / **D** mayors (belediye başkanları) / **E** athletes (sporcular).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Many people find the ---- sound of rain on the roof so relaxing that they fall asleep more quickly.$q$, array[$o$rhythmic$o$, $o$immense$o$, $o$furious$o$, $o$temporary$o$, $o$rigid$o$], 0, $e$1. Boşluğa **rhythmic** (ritmik) gelir. Yağmurun düzenli sesi ritmiktir.

Diğer şıklar: **B** immense (muazzam) / **C** furious (öfkeli) / **D** temporary (geçici) / **E** rigid (katı).$e$, 1),
  (18, 'ydt-dil', null::integer, $q$The two scientists, who had never met, ---- chose the same topic for their research and published almost identical results in the same month.$q$, array[$o$reluctantly$o$, $o$frequently$o$, $o$coincidentally$o$, $o$formally$o$, $o$smoothly$o$], 2, $e$1. Boşluğa **coincidentally** (tesadüfen) gelir. Hiç tanışmamış iki bilim insanının aynı konuyu seçmesi tesadüftür.

Diğer şıklar: **A** reluctantly (isteksizce) / **B** frequently (sık sık) / **D** formally (resmen) / **E** smoothly (pürüzsüzce).$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Many small companies were quick to ---- the new technology, while larger ones hesitated because of the high cost of change.$q$, array[$o$contradict$o$, $o$evaporate$o$, $o$intercept$o$, $o$quarrel$o$, $o$embrace$o$], 4, $e$1. Boşluğa **embrace** (benimsemek) gelir. Büyük şirketlerin tereddüt ettiği yeniliği küçükler hemen benimsemiştir.

Diğer şıklar: **A** contradict (çelişmek) / **B** evaporate (buharlaşmak) / **C** intercept (yolunu kesmek) / **D** quarrel (tartışmak).$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Agriculture and forestry ---- nearly forty percent of the country's employment, making them far more important than industry.$q$, array[$o$break into$o$, $o$call off$o$, $o$look into$o$, $o$account for$o$, $o$put up$o$], 3, $e$1. Boşluğa **account for** (oluşturmak) gelir. İstihdamın yüzde kırkını oluşturmak account for ile söylenir.

Diğer şıklar: **A** break into (zorla girmek) / **B** call off (iptal etmek) / **C** look into (araştırmak) / **E** put up (dikmek).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi 10
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi 10$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The survivors expressed their deep ---- to the rescue workers, who had searched for them through the night in freezing weather.$q$, array[$o$gratitude$o$, $o$rivalry$o$, $o$ambition$o$, $o$disbelief$o$, $o$fatigue$o$], 0, $e$1. Boşluğa **gratitude** (minnettarlık) gelir. Geceyi donan havada arayarak geçiren kurtarıcılara duyulan duygu minnettarlıktır.

Diğer şıklar: **B** rivalry (rekabet) / **C** ambition (hırs) / **D** disbelief (inanmazlık) / **E** fatigue (yorgunluk).$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Although the speech looked ----, the president had in fact rehearsed every sentence and gesture for several days.$q$, array[$o$deliberate$o$, $o$elaborate$o$, $o$spontaneous$o$, $o$compulsory$o$, $o$adjacent$o$], 2, $e$1. Boşluğa **spontaneous** (doğaçlama) gelir. Günlerce prova yapılmış olması, konuşmanın doğaçlama görünüp öyle olmadığını anlatır.

Diğer şıklar: **A** deliberate (kasıtlı) / **B** elaborate (ayrıntılı) / **D** compulsory (zorunlu) / **E** adjacent (bitişik).$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The two political systems differ ---- in the way they treat private property and personal freedom.$q$, array[$o$equally$o$, $o$fundamentally$o$, $o$politely$o$, $o$immediately$o$, $o$briefly$o$], 1, $e$1. Boşluğa **fundamentally** (temelde) gelir. Mülkiyet ve özgürlüğe bakışta köklü farklar temel farktır.

Diğer şıklar: **A** equally (eşit olarak) / **C** politely (kibarca) / **D** immediately (hemen) / **E** briefly (kısaca).$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The coin seemed to ---- into thin air when the magician covered it with the cloth.$q$, array[$o$bargain$o$, $o$flatter$o$, $o$restore$o$, $o$convert$o$, $o$vanish$o$], 4, $e$1. Boşluğa **vanish** (yok olmak) gelir. Paranın havaya karışması kaybolmak demektir.

Diğer şıklar: **A** bargain (pazarlık etmek) / **B** flatter (pohpohlamak) / **C** restore (onarmak) / **D** convert (dönüştürmek).$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Students who want to take part in the summer language course should ---- before the end of May.$q$, array[$o$sign up$o$, $o$pick out$o$, $o$hold up$o$, $o$back up$o$, $o$wear out$o$], 0, $e$1. Boşluğa **sign up** (kaydolmak) gelir. Yaz kursuna katılmak için kaydolmak gerekir.

Diğer şıklar: **B** pick out (seçmek) / **C** hold up (geciktirmek) / **D** back up (yedeklemek) / **E** wear out (yıpratmak).$e$, 1),
  (6, 'ydt-dil', null::integer, $q$A balanced diet rich in fruit, vegetables and whole grains provides the ---- that growing children need for healthy bones and muscles.$q$, array[$o$exhibition$o$, $o$suspension$o$, $o$tension$o$, $o$nutrition$o$, $o$mission$o$], 3, $e$1. Boşluğa **nutrition** (besin) gelir. Kemik ve kas gelişimi için gereken şey besindir.

Diğer şıklar: **A** exhibition (sergi) / **B** suspension (askıya alma) / **C** tension (gerilim) / **E** mission (görev).$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The decision to ignore the weather warnings proved ----, as the storm destroyed the harbour and sank several boats.$q$, array[$o$profitable$o$, $o$harmless$o$, $o$disastrous$o$, $o$reasonable$o$, $o$ordinary$o$], 2, $e$1. Boşluğa **disastrous** (felaket getiren) gelir. Fırtınanın limanı yok etmesi kararın felaket olduğunu gösterir.

Diğer şıklar: **A** profitable (kârlı) / **B** harmless (zararsız) / **D** reasonable (makul) / **E** ordinary (sıradan).$e$, 1),
  (8, 'ydt-dil', null::integer, $q$The lawyer argued ---- for more than an hour, and in the end even the sceptical members of the jury accepted his version of events.$q$, array[$o$vaguely$o$, $o$carelessly$o$, $o$timidly$o$, $o$hastily$o$, $o$persuasively$o$], 4, $e$1. Boşluğa **persuasively** (ikna edici biçimde) gelir. Şüpheci jüri üyelerini bile ikna eden savunma ikna edicidir.

Diğer şıklar: **A** vaguely (belirsizce) / **B** carelessly (dikkatsizce) / **C** timidly (çekingenle) / **D** hastily (aceleyle).$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Investigators are still trying to ---- the exact cause of the fire, which started in the early hours of Sunday morning.$q$, array[$o$ascertain$o$, $o$extend$o$, $o$import$o$, $o$reproduce$o$, $o$exclude$o$], 0, $e$1. Boşluğa **ascertain** (tespit etmek) gelir. Yangının tam nedenini araştırmak tespit etmektir.

Diğer şıklar: **B** extend (uzatmak) / **C** import (ithal etmek) / **D** reproduce (çoğaltmak) / **E** exclude (hariç tutmak).$e$, 3),
  (10, 'ydt-dil', null::integer, $q$You can ---- the support of the local community, because most residents strongly favour the new park.$q$, array[$o$see to$o$, $o$count on$o$, $o$cut down$o$, $o$wear out$o$, $o$fall for$o$], 1, $e$1. Boşluğa **count on** (güvenmek) gelir. Çoğu sakin parkı desteklediği için desteğe güvenilebilir.

Diğer şıklar: **A** see to (ilgilenmek) / **C** cut down (azaltmak) / **D** wear out (yıpratmak) / **E** fall for (aşık olmak).$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Years of success made the company's managers so full of ---- that they stopped investing in new products, and soon rivals began to take their customers.$q$, array[$o$enthusiasm$o$, $o$suspicion$o$, $o$complacency$o$, $o$generosity$o$, $o$sympathy$o$], 2, $e$1. Boşluğa **complacency** (rehavet) gelir. Başarıdan sonra yatırımı bırakmak rehavetin sonucudur.

Diğer şıklar: **A** enthusiasm (coşku) / **B** suspicion (şüphe) / **D** generosity (cömertlik) / **E** sympathy (sempati).$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The children became ---- during the long journey and kept asking when they would arrive.$q$, array[$o$sensible$o$, $o$modest$o$, $o$reliable$o$, $o$elderly$o$, $o$restless$o$], 4, $e$1. Boşluğa **restless** (huzursuz) gelir. Sürekli ne zaman varacağını sormak huzursuzluktur.

Diğer şıklar: **A** sensible (makul) / **B** modest (mütevazı) / **C** reliable (güvenilir) / **D** elderly (yaşlı).$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The match ended ---- when the home team scored three goals in the last five minutes and won 3-2.$q$, array[$o$gradually$o$, $o$unexpectedly$o$, $o$gently$o$, $o$mainly$o$, $o$formally$o$], 1, $e$1. Boşluğa **unexpectedly** (beklenmedik biçimde) gelir. Son beş dakikada atılan üç gol sonucu beklenmedik kılar.

Diğer şıklar: **A** gradually (giderek) / **C** gently (nazikçe) / **D** mainly (çoğunlukla) / **E** formally (resmen).$e$, 1),
  (14, 'ydt-dil', null::integer, $q$Education can ---- young women to make their own decisions about their careers, finances and families.$q$, array[$o$convict$o$, $o$scatter$o$, $o$freeze$o$, $o$empower$o$, $o$mislead$o$], 3, $e$1. Boşluğa **empower** (güçlendirmek) gelir. Kendi kararlarını verebilmelerini sağlamak güçlendirmektir.

Diğer şıklar: **A** convict (mahkûm etmek) / **B** scatter (dağıtmak) / **C** freeze (dondurmak) / **E** mislead (yanıltmak).$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Years of hard work finally ---- when she won a scholarship to one of the best universities in the country.$q$, array[$o$paid off$o$, $o$ran over$o$, $o$set back$o$, $o$turned down$o$, $o$put out$o$], 0, $e$1. Boşluğa **paid off** (sonuç vermek) gelir. Burs kazanmak, yıllık emeğin sonuç vermesidir.

Diğer şıklar: **B** ran over (ezmek) / **C** set back (geciktirmek) / **D** turned down (reddetmek) / **E** put out (söndürmek).$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The museum's most valuable ----, carved from marble more than two thousand years ago, are displayed in a specially lit hall.$q$, array[$o$invoices$o$, $o$sculptures$o$, $o$refugees$o$, $o$textbooks$o$, $o$vaccines$o$], 1, $e$1. Boşluğa **sculptures** (heykeller) gelir. Mermerden oyulmuş eserler heykeldir.

Diğer şıklar: **A** invoices (faturalar) / **C** refugees (mülteciler) / **D** textbooks (ders kitapları) / **E** vaccines (aşılar).$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Some psychologists believe that the best learners are driven by ---- motivation, studying because they enjoy the subject rather than for rewards or grades.$q$, array[$o$extrinsic$o$, $o$hostile$o$, $o$obsolete$o$, $o$intrinsic$o$, $o$feasible$o$], 3, $e$1. Boşluğa **intrinsic** (içsel) gelir. Not ya da ödül için değil konuyu sevdiği için çalışmak içsel motivasyondur.

Diğer şıklar: **A** extrinsic (dışsal) / **B** hostile (düşmanca) / **C** obsolete (modası geçmiş) / **E** feasible (uygulanabilir).$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Judges should assess the evidence ----, without allowing their personal feelings or opinions to influence their decision.$q$, array[$o$loudly$o$, $o$anxiously$o$, $o$casually$o$, $o$eagerly$o$, $o$objectively$o$], 4, $e$1. Boşluğa **objectively** (tarafsızca) gelir. Kişisel duyguları işe karıştırmamak tarafsız değerlendirmedir.

Diğer şıklar: **A** loudly (yüksek sesle) / **B** anxiously (endişeyle) / **C** casually (gelişigüzel) / **D** eagerly (hevesle).$e$, 2),
  (19, 'ydt-dil', null::integer, $q$To ---- profits, the company reduced production costs by moving its factories to countries where labour is cheaper.$q$, array[$o$minimize$o$, $o$neglect$o$, $o$maximize$o$, $o$simplify$o$, $o$postpone$o$], 2, $e$1. Boşluğa **maximize** (en üst düzeye çıkarmak) gelir. Maliyeti düşürmenin amacı kârı artırmaktır.

Diğer şıklar: **A** minimize (en aza indirmek) / **B** neglect (ihmal etmek) / **D** simplify (basitleştirmek) / **E** postpone (ertelemek).$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Many scientists believe that large mammals ---- at the end of the last Ice Age because of climate change and hunting.$q$, array[$o$broke out$o$, $o$fell out$o$, $o$set out$o$, $o$died out$o$, $o$went out$o$], 3, $e$1. Boşluğa **died out** (soyu tükenmek) gelir. İklim değişimi ve avlanma nedeniyle türlerin yok olması soyunun tükenmesidir.

Diğer şıklar: **A** broke out (patlak vermek) / **B** fell out (tartışmak) / **C** set out (yola çıkmak) / **E** went out (çıkmak).$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

