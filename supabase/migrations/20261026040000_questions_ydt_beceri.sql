-- 20261026040000_questions_ydt_beceri. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Kelime Bilgisi konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Kelime Bilgisi konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- of the experiment surprised the researchers, because nobody had expected such a result.$q$, array[$o$outcome$o$, $o$purpose$o$, $o$background$o$, $o$ingredient$o$, $o$symptom$o$], 0, $e$1. Sonuç beklenmedik olduğu için deneyin **outcome** (sonuç) kelimesi uygundur.
2. Diğer sözcükler amaç, arka plan, bileşen ve belirti anlamındadır.

Diğer şıklar: **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Scientists are worried about the ---- of rare species caused by the loss of forests.$q$, array[$o$consumption$o$, $o$generation$o$, $o$treatment$o$, $o$extinction$o$, $o$ceremony$o$], 3, $e$1. Ormanların kaybı nedeniyle nadir türlerin yok olması anlatılır: **extinction**.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **C** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The government has introduced a new ---- to reduce air pollution in big cities.$q$, array[$o$tradition$o$, $o$landscape$o$, $o$witness$o$, $o$ingredient$o$, $o$policy$o$], 4, $e$1. Hava kirliliğini azaltmak için hükümet yeni bir **policy** (politika) uygulamıştır.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Her ---- for classical music began when she heard a violin concert at the age of five.$q$, array[$o$ceremony$o$, $o$passion$o$, $o$obstacle$o$, $o$estimate$o$, $o$residence$o$], 1, $e$1. Klasik müziğe duyulan güçlü ilgi **passion** (tutku) kelimesiyle anlatılır.

Diğer şıklar: **A** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The company needs a ---- solution to the problem, because temporary fixes have failed.$q$, array[$o$fragile$o$, $o$hostile$o$, $o$permanent$o$, $o$reluctant$o$, $o$ambiguous$o$], 2, $e$1. **Temporary** sözcüğünün zıttı **permanent** (kalıcı) kelimesidir.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$It was ---- of him to forget her birthday after all she had done for him.$q$, array[$o$thoughtless$o$, $o$generous$o$, $o$punctual$o$, $o$humble$o$, $o$reasonable$o$], 0, $e$1. Doğum gününü unutmak düşüncesiz bir davranıştır: **thoughtless**.

Diğer şıklar: **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ---- landscape of the desert makes it difficult for plants to grow.$q$, array[$o$fertile$o$, $o$lush$o$, $o$crowded$o$, $o$diverse$o$, $o$barren$o$], 4, $e$1. Bitki yetişmesini zorlaştıran kurak ve verimsiz arazi **barren** ile anlatılır.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He was ---- to admit his mistake, so the argument continued for hours.$q$, array[$o$eager$o$, $o$relieved$o$, $o$reluctant$o$, $o$grateful$o$, $o$capable$o$], 2, $e$1. Hatayı kabul etmek istemeyen biri **reluctant** (isteksiz) olur.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The new law will ---- affect small businesses, since they cannot afford the extra costs.$q$, array[$o$barely$o$, $o$severely$o$, $o$merely$o$, $o$scarcely$o$, $o$rarely$o$], 1, $e$1. Ekstra maliyetleri karşılayamadıkları için etkilenme ciddidir: **severely**.

Diğer şıklar: **A** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The manager ---- refused our request, saying that it was against company rules.$q$, array[$o$hardly$o$, $o$nearly$o$, $o$relatively$o$, $o$flatly$o$, $o$lately$o$], 3, $e$1. Kesin ve net biçimde reddetmek **flatly refused** ile anlatılır.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **C** anlama uymaz / **E** anlama uymaz.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$The price of the hotel was ---- lower than we had expected.$q$, array[$o$considerably$o$, $o$rarely$o$, $o$barely$o$, $o$hardly$o$, $o$previously$o$], 0, $e$1. Beklenenden önemli ölçüde düşük fiyat **considerably** ile anlatılır.

Diğer şıklar: **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The book was ---- recommended by critics, so it sold millions of copies.$q$, array[$o$barely$o$, $o$highly$o$, $o$seldom$o$, $o$narrowly$o$, $o$slightly$o$], 1, $e$1. Eleştirmenlerce çok önerilen kitap **highly recommended** olur.

Diğer şıklar: **A** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The new tax is expected to ---- small businesses most, because they have fewer resources.$q$, array[$o$inherit$o$, $o$estimate$o$, $o$accompany$o$, $o$persuade$o$, $o$affect$o$], 4, $e$1. Vergi küçük işletmeleri etkiler: **affect**.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The doctor ---- the patient not to eat anything before the operation.$q$, array[$o$suggested$o$, $o$insisted$o$, $o$admitted$o$, $o$advised$o$, $o$wondered$o$], 3, $e$1. **Advise somebody (not) to do** kalıbı kullanılır: **advised**.
2. **Suggest** ve **insist** bu yapıyı kurmaz.

Diğer şıklar: **A** yapı uymaz / **B** yapı uymaz / **C** yapı uymaz / **E** yapı uymaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Heavy rain ---- the football match for two hours, so the fans had to wait.$q$, array[$o$prevented$o$, $o$ignored$o$, $o$delayed$o$, $o$achieved$o$, $o$ruined$o$], 2, $e$1. İki saat ertelenen maç **delayed** ile anlatılır.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (16, 'ydt-dil', null::integer, $q$The scientists ---- a new species of fish in the deep sea last year.$q$, array[$o$discovered$o$, $o$invented$o$, $o$founded$o$, $o$produced$o$, $o$decorated$o$], 0, $e$1. Mevcut ama bilinmeyen bir tür **discover** edilir.

Diğer şıklar: **B** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The match was ---- because of the heavy rain, and the tickets were refunded.$q$, array[$o$called for$o$, $o$called on$o$, $o$called up$o$, $o$called off$o$, $o$called at$o$], 3, $e$1. **Call off** iptal etmek anlamındadır.

Diğer şıklar: **A** deyim anlamı uymaz / **B** deyim anlamı uymaz / **C** deyim anlamı uymaz / **E** deyim anlamı uymaz.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$I can't ---- why she left without saying a word, it makes no sense to me.$q$, array[$o$give up$o$, $o$figure out$o$, $o$turn down$o$, $o$put off$o$, $o$take over$o$], 1, $e$1. **Figure out** anlamak, çözmek anlamındadır.

Diğer şıklar: **A** deyim anlamı uymaz / **C** deyim anlamı uymaz / **D** deyim anlamı uymaz / **E** deyim anlamı uymaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$We have run ---- of milk, so I'll go to the shop and buy some.$q$, array[$o$up$o$, $o$over$o$, $o$down$o$, $o$away$o$, $o$out$o$], 4, $e$1. **Run out of** bitmek anlamındadır.

Diğer şıklar: **A** deyim anlamı uymaz / **B** deyim anlamı uymaz / **C** deyim anlamı uymaz / **D** deyim anlamı uymaz.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The company decided to ---- the meeting until next week because the CEO was ill.$q$, array[$o$put on$o$, $o$put out$o$, $o$put off$o$, $o$put up$o$, $o$put away$o$], 2, $e$1. **Put off** ertelemek anlamındadır.

Diğer şıklar: **A** deyim anlamı uymaz / **B** deyim anlamı uymaz / **D** deyim anlamı uymaz / **E** deyim anlamı uymaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Cloze Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Cloze Testi 1$t$, 25, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Cloze Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$Many people believe that the Internet ---- our lives completely over the last two decades. Today, it is hard to imagine life without it.$q$, array[$o$changed$o$, $o$had changed$o$, $o$has changed$o$, $o$will change$o$, $o$is changing$o$], 2, $e$1. **Over the last two decades** şimdiye kadar süren bir dönemdir. Present Perfect gerekir: **has changed**.

Diğer şıklar: **A** zaman ifadesine uymaz / **B** zaman ifadesine uymaz / **D** zaman ifadesine uymaz / **E** zaman ifadesine uymaz.$e$, 1),
  (2, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$), $q$The festival attracts thousands of visitors ---- all over the world every summer, and hotels are fully booked months in advance.$q$, array[$o$of$o$, $o$by$o$, $o$with$o$, $o$at$o$, $o$from$o$], 4, $e$1. Ziyaretçilerin geldiği yer **from all over the world** ile anlatılır.

Diğer şıklar: **A** edat kalıbına uymaz / **B** edat kalıbına uymaz / **C** edat kalıbına uymaz / **D** edat kalıbına uymaz.$e$, 1),
  (3, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Many students fail the exam ---- they do not manage their time well, even though they study hard.$q$, array[$o$unless$o$, $o$because$o$, $o$until$o$, $o$whereas$o$, $o$therefore$o$], 1, $e$1. Başarısızlığın nedeni zaman yönetimidir: **because**.

Diğer şıklar: **A** anlam bağlantısı kurmaz / **C** anlam bağlantısı kurmaz / **D** anlam bağlantısı kurmaz / **E** anlam bağlantısı kurmaz.$e$, 2),
  (4, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$), $q$Scientists have found a new treatment, ---- could save millions of lives in the coming years.$q$, array[$o$what$o$, $o$who$o$, $o$which$o$, $o$whose$o$, $o$whom$o$], 2, $e$1. Virgülden sonra önceki cümleyi niteleyen **which** gelir.

Diğer şıklar: **A** ilgi zamiri uymaz / **B** ilgi zamiri uymaz / **D** ilgi zamiri uymaz / **E** ilgi zamiri uymaz.$e$, 2),
  (5, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$The ancient city ---- by an earthquake in the sixth century, and it was never rebuilt.$q$, array[$o$was destroyed$o$, $o$destroyed$o$, $o$had destroyed$o$, $o$was destroying$o$, $o$has destroyed$o$], 0, $e$1. Şehri biri yıkmamıştır, deprem yıkmıştır ve bitmiş zaman verilmiştir. Edilgen Simple Past gerekir: **was destroyed**.

Diğer şıklar: **B** çatı ya da zaman uymaz / **C** çatı ya da zaman uymaz / **D** çatı ya da zaman uymaz / **E** çatı ya da zaman uymaz.$e$, 2),
  (6, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$), $q$Many young people prefer ---- online to going to shops, because it saves time and money.$q$, array[$o$shop$o$, $o$shopped$o$, $o$to shop$o$, $o$shopping$o$, $o$shops$o$], 3, $e$1. **Prefer + gerund to + gerund** kalıbı kullanılır: **shopping**.

Diğer şıklar: **A** kalıba uymaz / **B** kalıba uymaz / **C** kalıba uymaz / **E** kalıba uymaz.$e$, 2),
  (7, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Determiners ve Quantifiers$n$), $q$Only ---- people attended the lecture, so the hall looked almost empty.$q$, array[$o$a little$o$, $o$much$o$, $o$a great deal of$o$, $o$any$o$, $o$a few$o$], 4, $e$1. Sayılabilir çoğul isimle **a few** kullanılır.

Diğer şıklar: **A** nicelik sözcüğü uymaz / **B** nicelik sözcüğü uymaz / **C** nicelik sözcüğü uymaz / **D** nicelik sözcüğü uymaz.$e$, 1),
  (8, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$), $q$The new model is ---- more efficient than the old one, using half as much energy.$q$, array[$o$very$o$, $o$so$o$, $o$much$o$, $o$too$o$, $o$such$o$], 2, $e$1. Comparative önünde **much** kullanılır.

Diğer şıklar: **A** comparative ile kullanılmaz / **B** comparative ile kullanılmaz / **D** comparative ile kullanılmaz / **E** comparative ile kullanılmaz.$e$, 2),
  (9, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$The report ---- have been written by an expert, because it contains very detailed analysis.$q$, array[$o$ought$o$, $o$must$o$, $o$needn't$o$, $o$shouldn't$o$, $o$can't$o$], 1, $e$1. Güçlü çıkarım **must have + V3** ile yapılır.

Diğer şıklar: **A** çıkarım anlamı vermez / **C** çıkarım anlamı vermez / **D** çıkarım anlamı vermez / **E** çıkarım anlamı vermez.$e$, 3),
  (10, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adverbs$n$), $q$Prices have ---- fallen in recent months, which has encouraged people to buy more.$q$, array[$o$sharp$o$, $o$hardly$o$, $o$barely$o$, $o$sharply$o$, $o$seldom$o$], 3, $e$1. **Fallen** fiilini niteleyen zarf gerekir: **sharply**.

Diğer şıklar: **A** zarf anlam ya da biçim uymaz / **B** zarf anlam ya da biçim uymaz / **C** zarf anlam ya da biçim uymaz / **E** zarf anlam ya da biçim uymaz.$e$, 2),
  (11, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$), $q$It was an ---- experience for the children, who had never seen the sea before.$q$, array[$o$unnecessary$o$, $o$unreliable$o$, $o$unforgettable$o$, $o$unknown$o$, $o$unwilling$o$], 2, $e$1. Çocuklar için unutulmaz bir deneyim anlatılır: **unforgettable**.

Diğer şıklar: **A** anlama uymaz / **B** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (12, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$), $q$If governments ---- more money in education, the country would develop much faster.$q$, array[$o$invested$o$, $o$invest$o$, $o$will invest$o$, $o$had invested$o$, $o$would invest$o$], 0, $e$1. **Would develop** gerçek dışı koşul kurar, if sonrasında Past Simple gerekir: **invested**.

Diğer şıklar: **B** koşul yapısına uymaz / **C** koşul yapısına uymaz / **D** koşul yapısına uymaz / **E** koşul yapısına uymaz.$e$, 2),
  (13, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$), $q$Nobody knows exactly ---- the first computer was invented, though many people think it was in the 1940s.$q$, array[$o$that$o$, $o$which$o$, $o$whom$o$, $o$whose$o$, $o$when$o$], 4, $e$1. Zaman sorgulanır ve noun clause kurulur: **when**.

Diğer şıklar: **A** noun clause kurmaz / **B** noun clause kurmaz / **C** noun clause kurmaz / **D** noun clause kurmaz.$e$, 3),
  (14, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Pronouns$n$), $q$The twins look so much alike that even their teachers cannot tell ---- apart.$q$, array[$o$themselves$o$, $o$them$o$, $o$they$o$, $o$their$o$, $o$theirs$o$], 1, $e$1. **Tell somebody apart** kalıbında nesne zamiri gerekir: **them**.

Diğer şıklar: **A** zamir biçimi uymaz / **C** zamir biçimi uymaz / **D** zamir biçimi uymaz / **E** zamir biçimi uymaz.$e$, 2),
  (15, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$), $q$He wishes he ---- more time to spend with his family, but his job is too demanding.$q$, array[$o$has$o$, $o$will have$o$, $o$would have$o$, $o$had$o$, $o$having$o$], 3, $e$1. Şimdiki gerçek dışı durum **wish + Past Simple** ile kurulur: **had**.

Diğer şıklar: **A** wish yapısına uymaz / **B** wish yapısına uymaz / **C** wish yapısına uymaz / **E** wish yapısına uymaz.$e$, 2),
  (16, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Participles$n$), $q$---- by the beauty of the island, the tourists decided to stay another week.$q$, array[$o$Impressed$o$, $o$Impressing$o$, $o$To impress$o$, $o$Impress$o$, $o$Impression$o$], 0, $e$1. Turistler etkilenen taraftır, edilgen participle gerekir: **Impressed**.

Diğer şıklar: **B** participle biçimi uymaz / **C** participle biçimi uymaz / **D** participle biçimi uymaz / **E** participle biçimi uymaz.$e$, 2),
  (17, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Kelime Bilgisi$n$), $q$Heavy rain caused severe ---- in the region, destroying hundreds of homes.$q$, array[$o$ceremony$o$, $o$damage$o$, $o$recipe$o$, $o$rumour$o$, $o$tradition$o$], 1, $e$1. Evleri yıkan yağış **damage** (hasar) verir.

Diğer şıklar: **A** anlama uymaz / **C** anlama uymaz / **D** anlama uymaz / **E** anlama uymaz.$e$, 1),
  (18, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$), $q$She has been working ---- the project since January, and she hopes to finish it soon.$q$, array[$o$for$o$, $o$to$o$, $o$of$o$, $o$on$o$, $o$by$o$], 3, $e$1. **Work on a project** kalıbı kullanılır.

Diğer şıklar: **A** edat kalıbına uymaz / **B** edat kalıbına uymaz / **C** edat kalıbına uymaz / **E** edat kalıbına uymaz.$e$, 2),
  (19, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$---- the weather was terrible, the concert took place as planned.$q$, array[$o$Because$o$, $o$Unless$o$, $o$Since$o$, $o$So$o$, $o$Although$o$], 4, $e$1. Beklenmeyen bir durum karşıtlıkla anlatılır: **Although**.

Diğer şıklar: **A** anlam bağlantısı kurmaz / **B** anlam bağlantısı kurmaz / **C** anlam bağlantısı kurmaz / **D** anlam bağlantısı kurmaz.$e$, 2),
  (20, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$By the time the ambulance arrived, the injured man ---- consciousness.$q$, array[$o$had lost$o$, $o$has lost$o$, $o$lost$o$, $o$was losing$o$, $o$loses$o$], 0, $e$1. **By the time** ile ambulanstan önce olan eylem Past Perfect ile anlatılır: **had lost**.

Diğer şıklar: **B** zaman uyumu bozulur / **C** zaman uyumu bozulur / **D** zaman uyumu bozulur / **E** zaman uyumu bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Cümle Tamamlama Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Cümle Tamamlama Testi 1$t$, 25, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Cümle Tamamlama Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Although the company had made huge profits last year, ----.$q$, array[$o$it laid off hundreds of workers this year$o$, $o$its shareholders were very satisfied with it$o$, $o$it was able to raise the salaries again$o$, $o$its products sold better than expected$o$, $o$it opened several new branches abroad$o$], 0, $e$1. **Although** beklenmeyen bir sonuç ister. Büyük kâr sonrası işten çıkarma zıt bir durumdur.

Diğer şıklar: **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Despite the heavy traffic, ----.$q$, array[$o$we were an hour late for the meeting$o$, $o$we missed the flight to Istanbul entirely$o$, $o$we managed to arrive at the airport on time$o$, $o$the main roads were closed for the day$o$, $o$we decided to cancel the whole holiday$o$], 2, $e$1. **Despite** karşıtlık kurar. Trafiğe rağmen zamanında varmak beklenmeyen sonuçtur.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She was so tired that ----.$q$, array[$o$she decided to run a marathon the next morning$o$, $o$she fell asleep on the sofa as soon as she got home$o$, $o$she stayed awake and chatted until midnight$o$, $o$she felt full of energy and invited her friends$o$, $o$she started cleaning the whole house at once$o$], 1, $e$1. **So ... that** sonuç bildirir. Yorgunluğun sonucu uyumaktır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$You will not be allowed into the exam hall unless ----.$q$, array[$o$you arrive twenty minutes after the exam starts$o$, $o$you leave your bag next to your friend's desk$o$, $o$you talk to the other students inside the hall$o$, $o$you keep your phone switched on in your pocket$o$, $o$you show your identity card at the door$o$], 4, $e$1. **Unless** olumsuz koşul bildirir. İzin için gereken şart kimlik göstermektir.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The government has built new roads so that ----.$q$, array[$o$the old roads will be closed for good$o$, $o$fewer people will want to visit the cities$o$, $o$traffic in the centre will become much worse$o$, $o$people can travel between the cities more quickly$o$, $o$the cost of travel will increase every year$o$], 3, $e$1. **So that** amaç bildirir. Yeni yolların amacı seyahati hızlandırmaktır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$As soon as the teacher entered the classroom, ----.$q$, array[$o$the students stopped talking and sat down$o$, $o$the lesson had already finished long before$o$, $o$the students were still waiting outside the door$o$, $o$the teacher left the room without saying a word$o$, $o$the school bell rang for the end of the day$o$], 0, $e$1. **As soon as** hemen sonrayı gösterir. Öğretmenin girmesinin hemen ardından sessizlik gelir.

Diğer şıklar: **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Some people like to spend their holidays by the sea, whereas ----.$q$, array[$o$they enjoy swimming and sunbathing on the beach$o$, $o$the sea is very warm and beautiful in summer$o$, $o$most hotels near the coast are crowded in July$o$, $o$many tourists love eating fresh fish at the harbour$o$, $o$others prefer to visit historical places in the mountains$o$], 4, $e$1. **Whereas** zıtlık kurar. Denizi sevenlerin karşısında dağı ve tarihi yerleri sevenler gelir.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Since the shop was closed, ----.$q$, array[$o$we bought everything we needed from there$o$, $o$we stayed inside the shop for several hours$o$, $o$the shop owner was friendly and very helpful$o$, $o$we had to buy the bread from another place$o$, $o$we could take our time and look around inside$o$], 3, $e$1. **Since** neden bildirir. Dükkan kapalıysa başka yerden almak gerekir.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$You should take an umbrella in case ----.$q$, array[$o$the weather is hot and sunny all afternoon$o$, $o$you want to go swimming at the weekend$o$, $o$it starts to rain while you are walking home$o$, $o$the buses are running on time this evening$o$, $o$your friends are waiting for you at the station$o$], 2, $e$1. **In case** olası bir duruma karşı önlem bildirir. Şemsiye yağmura karşı alınır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Not only did the manager praise the team, ----.$q$, array[$o$and the team was criticised in front of everyone$o$, $o$but he also gave every member a bonus$o$, $o$so the manager left the meeting immediately$o$, $o$because they had failed to finish the project$o$, $o$although nobody worked on the project at all$o$], 1, $e$1. **Not only ... but also** kalıbı iki olumlu ekleme yapar. Övgüye bonus eklenir.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$He studied very hard for the exam. However, ----.$q$, array[$o$he could not pass it because the questions were too difficult$o$, $o$he passed it with the highest score in the class$o$, $o$he enjoyed every moment of the long preparation$o$, $o$he did not need to study for the exam at all$o$, $o$everybody in his class passed it without any effort$o$], 0, $e$1. **However** önceki cümleyle karşıtlık kurar. Çok çalışmasına rağmen geçememek beklenmeyen sonuçtur.

Diğer şıklar: **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$We must leave now. Otherwise, ----.$q$, array[$o$we will arrive earlier than we planned$o$, $o$we can still have dinner at home calmly$o$, $o$the train will wait for us at the station$o$, $o$there will be plenty of time to relax first$o$, $o$we will miss the last train to the city$o$], 4, $e$1. **Otherwise** uyarı sonucu bildirir. Şimdi çıkılmazsa son tren kaçar.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Neither of the candidates ----.$q$, array[$o$have enough experience for such a position$o$, $o$were very well prepared and experienced enough$o$, $o$is both experienced and highly qualified for it$o$, $o$has enough experience for such a responsible position$o$, $o$are suitable for the job and for the company$o$], 3, $e$1. **Neither of** tekil fiil alır ve olumsuz anlam taşır: **has**.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$While the children were playing in the garden, ----.$q$, array[$o$their mother has already left the house for work$o$, $o$their mother was preparing dinner in the kitchen$o$, $o$the dinner will be ready in about three weeks$o$, $o$the garden is quite small and rather old now$o$, $o$their father will return from abroad tomorrow$o$], 1, $e$1. **While** eş zamanlı iki eylemi bağlar. Çocukların oynamasıyla annenin yemek hazırlaması eş zamanlıdır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Provided that you finish your homework, ----.$q$, array[$o$you can go out and play with your friends$o$, $o$you must stay at home for the whole weekend$o$, $o$your teacher will be angry with you again$o$, $o$you will fail the course at the end of term$o$, $o$you are not allowed to watch any television$o$], 0, $e$1. **Provided that** koşul bildirir. Ödev bitince izin verilmesi mantıklıdır.

Diğer şıklar: **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$He could not buy the car. Moreover, ----.$q$, array[$o$he bought it later at a very low price$o$, $o$he got a big discount from the car dealer$o$, $o$he did not even have enough money for a bicycle$o$, $o$he easily paid the whole amount in cash$o$, $o$he was perfectly happy with his decision$o$], 2, $e$1. **Moreover** aynı yönde ek bilgi verir. Arabayı alamamasına, bisiklet parası olmaması eklenir.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The more you practise speaking English, ----.$q$, array[$o$the less confident you will be in class$o$, $o$the more confident you will become$o$, $o$the weather is getting colder every week$o$, $o$the faster the train arrives at the station$o$, $o$the higher the prices of tickets will rise$o$], 1, $e$1. **The more ..., the more ...** kalıbı orantılı artış kurar.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Even though he is very rich, ----.$q$, array[$o$he buys a new sports car every single month$o$, $o$he owns several enormous houses around the world$o$, $o$he spends a fortune on luxury hotels every year$o$, $o$he lives in a small flat and rarely buys luxuries$o$, $o$he lives in the most expensive district of the city$o$], 3, $e$1. **Even though** beklenmeyen bir durumu anlatır. Zengin olmasına rağmen sade yaşamak karşıtlıktır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Either you apologise to her now, or ----.$q$, array[$o$she has already forgiven you completely$o$, $o$you do not need to say anything at all$o$, $o$she is very happy with your behaviour$o$, $o$both of you will continue just as before$o$, $o$she will never speak to you again$o$], 4, $e$1. **Either ... or** iki seçenek sunar. Özür dilememek olumsuz sonuca götürür.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **C** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Unless the weather improves by this evening, ----.$q$, array[$o$the players will enjoy a hot and sunny game$o$, $o$the stadium will be packed with happy fans$o$, $o$the football match will probably be cancelled$o$, $o$the referee will start the game ahead of time$o$, $o$all the tickets will be sold within minutes$o$], 2, $e$1. **Unless** olumsuz koşul bildirir. Hava düzelmezse maçın iptal edilmesi mantıklıdır.

Diğer şıklar: **A** anlam ya da bağlantı uymaz / **B** anlam ya da bağlantı uymaz / **D** anlam ya da bağlantı uymaz / **E** anlam ya da bağlantı uymaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Diyalog Tamamlama Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Diyalog Tamamlama Testi 1$t$, 25, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Diyalog Tamamlama Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$A: I'm sorry I'm late. The bus broke down on the way here.
B: ----$q$, array[$o$Congratulations! I'm really proud of you today.$o$, $o$Yes, I would love another cup of coffee, thanks.$o$, $o$No, I haven't seen that film yet either, sorry.$o$, $o$That's all right. Please take a seat and we'll begin.$o$, $o$I'm afraid the shop closes at six every evening.$o$], 3, $e$1. A özür diliyor. Uygun cevap özrü kabul edip devam etmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$A: Would you like me to carry your bags upstairs?
B: ----$q$, array[$o$I'm afraid the film starts at nine tonight, sorry.$o$, $o$That's very kind of you, but I can manage on my own.$o$, $o$Yes, the weather is much colder than yesterday.$o$, $o$No, I have never been to that museum before.$o$, $o$It took us about three hours to get to the village.$o$], 1, $e$1. A yardım teklif ediyor. Uygun cevap teklifi nazikçe geri çevirmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$A: Excuse me, is there a bank near here?
B: ----$q$, array[$o$I usually pay by credit card when I travel abroad.$o$, $o$No, I have never opened an account in that country.$o$, $o$Yes, there is one at the end of this street on the left.$o$, $o$The manager said the meeting will start at ten o'clock.$o$, $o$It is open from Monday to Friday during the summer.$o$], 2, $e$1. A yol soruyor. Uygun cevap yeri tarif etmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$A: Would you like to join us for dinner tonight?
B: ----$q$, array[$o$Thanks, I'd love to. What time shall I come?$o$, $o$No, I didn't enjoy the dinner we had last night.$o$, $o$Yes, I usually have dinner at around eight o'clock.$o$, $o$It was a great meal, but the service was rather slow.$o$, $o$I think the restaurant on the corner has closed down.$o$], 0, $e$1. A davet ediyor. Uygun cevap daveti kabul edip detay sormaktır.

Diğer şıklar: **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$A: I'd like to return this jacket. It's too small for me.
B: ----$q$, array[$o$I'm sorry, but we don't sell any winter coats now.$o$, $o$Yes, it is made of wool and it comes in three colours.$o$, $o$You should wear a thicker jacket when it gets colder.$o$, $o$Of course. Do you have the receipt with you?$o$, $o$The sale will continue until the end of this month.$o$], 3, $e$1. A ürün iadesi istiyor. Uygun cevap fişi sormaktır.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$A: Could you lend me your notes from yesterday's lecture?
B: ----$q$, array[$o$The lecture was about the history of the Roman Empire.$o$, $o$No, the professor did not give us any homework today.$o$, $o$I'm afraid I haven't been to the library this week.$o$, $o$You can borrow my umbrella if it starts to rain.$o$, $o$Sure, I'll bring them to class tomorrow.$o$], 4, $e$1. A not istiyor. Uygun cevap notları getireceğini söylemektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$A: What did you think of the new science fiction film?
B: ----$q$, array[$o$I'm going to watch it with my cousins next Saturday evening.$o$, $o$I found the story rather slow, but the special effects were impressive.$o$, $o$It was released in more than fifty countries last month.$o$, $o$Yes, it starts at eight and finishes at around ten thirty.$o$, $o$The cinema is only a five-minute walk from my house.$o$], 1, $e$1. A film hakkında görüş soruyor. Uygun cevap fikir belirtmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$A: I have a terrible headache.
B: ----$q$, array[$o$I'm sure the pharmacy will open at nine tomorrow morning.$o$, $o$That's wonderful! I hope you enjoy the concert tonight.$o$, $o$Why don't you take a rest and drink some water?$o$, $o$Yes, I have been to that hospital several times before.$o$, $o$You should buy a ticket before the train leaves the station.$o$], 2, $e$1. A rahatsızlığını söylüyor. Uygun cevap öneri vermektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (9, 'ydt-dil', null::integer, $q$A: I have a reservation under the name Kaya.
B: ----$q$, array[$o$No, I'm afraid we don't accept any pets in our restaurant.$o$, $o$The flight to Ankara leaves from gate number twelve.$o$, $o$You can pay for your meal at the cashier near the door.$o$, $o$We have a wide range of laptops at very good prices.$o$, $o$Yes, Mr Kaya. Your room is ready on the third floor.$o$], 4, $e$1. A otel rezervasyonunu belirtiyor. Uygun cevap odanın hazır olduğunu söylemektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$A: Hello, may I speak to Mrs Brown, please?
B: ----$q$, array[$o$Yes, I have been working in this city for six years.$o$, $o$No, thank you, I have already finished my dinner.$o$, $o$She is going to travel to Spain in the middle of May.$o$, $o$I'm afraid she is in a meeting. Can I take a message?$o$, $o$I think it will be sunny and warm at the weekend.$o$], 3, $e$1. A telefonda birini arıyor. Uygun cevap kişinin toplantıda olduğunu söyleyip mesaj sormaktır.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$A: How much is this laptop?
B: ----$q$, array[$o$It's on sale this week, so it's twenty percent cheaper than usual.$o$, $o$I bought it last year when I started university classes.$o$, $o$Yes, you can check your emails on it very quickly.$o$, $o$The shop assistant told me the battery lasts ten hours.$o$, $o$It was invented in the middle of the last century.$o$], 0, $e$1. A fiyat soruyor. Uygun cevap fiyat bilgisi vermektir.

Diğer şıklar: **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$A: What are you doing this weekend?
B: ----$q$, array[$o$I visited the museum with my classmates last Sunday.$o$, $o$I'm going to visit my grandparents in the village.$o$, $o$Yes, I have been living in this neighbourhood for years.$o$, $o$It rained heavily and the match was postponed twice.$o$, $o$My grandparents are very kind and love telling stories.$o$], 1, $e$1. A gelecek plan soruyor. Uygun cevap planı söylemektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (13, 'ydt-dil', null::integer, $q$A: Thank you so much for helping me with my project.
B: ----$q$, array[$o$I'm sorry, but I don't have enough time to help you.$o$, $o$Yes, the project is due on the first of next month.$o$, $o$It was my pleasure. I'm glad it went well.$o$, $o$No, I haven't heard anything about it from the teacher.$o$, $o$You must hand in the report before the deadline ends.$o$], 2, $e$1. A teşekkür ediyor. Uygun cevap teşekküre karşılık vermektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 1),
  (14, 'ydt-dil', null::integer, $q$A: Shall we take a taxi to the station?
B: ----$q$, array[$o$Good idea. The buses are very slow at this time.$o$, $o$No, I haven't bought my ticket for the concert yet.$o$, $o$Yes, the station was built in the early nineteen hundreds.$o$, $o$I'm afraid the taxi driver was born in a small village.$o$, $o$We should have brought more sandwiches for the trip.$o$], 0, $e$1. A öneri sunuyor. Uygun cevap öneriyi gerekçeyle kabul etmektir.

Diğer şıklar: **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$A: I've just been accepted to the university I wanted!
B: ----$q$, array[$o$I'm sorry to hear that. I hope you feel better soon.$o$, $o$Well, I think you should take the next bus home today.$o$, $o$Why didn't you tell me you had lost your keys?$o$, $o$It's too late now. The shops have already closed.$o$, $o$That's wonderful news! You really deserve it.$o$], 4, $e$1. A güzel haber veriyor. Uygun cevap tebrik etmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz.$e$, 1),
  (16, 'ydt-dil', null::integer, $q$A: Do you mind if I open the window?
B: ----$q$, array[$o$Yes, please. I would like to have another sandwich.$o$, $o$Not at all. It is a bit hot in here.$o$, $o$I'm afraid the window was broken during the storm.$o$, $o$No, I'm not hungry, but thank you for asking me.$o$, $o$I opened it yesterday, and the room became very cold.$o$], 1, $e$1. A izin soruyor. "Do you mind" sorusuna olumlu cevap **Not at all** olur.

Diğer şıklar: **A** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$A: How long have you had this cough?
B: ----$q$, array[$o$Since I have never been to that doctor before.$o$, $o$At the pharmacy near the bus station in the city.$o$, $o$I'll have it checked by the end of next month.$o$, $o$For about a week, and it gets worse at night.$o$, $o$Because it is the best medicine for that illness.$o$], 3, $e$1. A süre soruyor. Uygun cevap süre bildirmektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$A: Sorry, I didn't catch what you said.
B: ----$q$, array[$o$Yes, I'd like a coffee with two sugars, please.$o$, $o$It's not far. You can walk there in ten minutes.$o$, $o$I said the meeting has been moved to Thursday.$o$, $o$No problem. I can lend you my notebook tomorrow.$o$, $o$The meeting room is on the second floor, I think.$o$], 2, $e$1. A söyleneni duymadığını belirtiyor. Uygun cevap cümleyi tekrarlamaktır.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$A: Are you ready to order?
B: ----$q$, array[$o$No, thanks. I have already paid for my ticket.$o$, $o$I think the waiter has just gone to the kitchen.$o$, $o$It was founded by a famous chef in the nineties.$o$, $o$I usually go to the gym three times every week.$o$, $o$Yes, I'll have the grilled fish and a salad, please.$o$], 4, $e$1. A sipariş soruyor. Uygun cevap sipariş vermektir.

Diğer şıklar: **A** konuşmanın akışına uymaz / **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$A: Why do you want to work for our company?
B: ----$q$, array[$o$I admire its focus on environmental projects and want to be part of them.$o$, $o$Because the interview will take place on the second floor today.$o$, $o$I learned to swim in a lake near my grandparents' village once.$o$, $o$My previous manager told me the office opens at eight o'clock.$o$, $o$The salary was already discussed in the meeting held last Tuesday.$o$], 0, $e$1. A mülakatta motivasyon soruyor. Uygun cevap şirketle ilgili bir gerekçe vermektir.

Diğer şıklar: **B** konuşmanın akışına uymaz / **C** konuşmanın akışına uymaz / **D** konuşmanın akışına uymaz / **E** konuşmanın akışına uymaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Anlamca En Yakın Cümle Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Anlamca En Yakın Cümle Testi 1$t$, 30, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Anlamca En Yakın Cümle Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$He is too young to drive a car.

Which one is closest in meaning to the sentence above?$q$, array[$o$He is young enough to drive a car safely.$o$, $o$He is old enough to drive a car but refuses.$o$, $o$Although he is young, he drives a car well.$o$, $o$He is so young that he cannot drive a car.$o$, $o$He drives a car because he is still young.$o$], 3, $e$1. **Too ... to** olumsuz sonuç verir. **So ... that ... cannot** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **E** anlamı farklıdır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Unless you hurry, you will miss the bus.

Which one is closest in meaning to the sentence above?$q$, array[$o$If you hurry, you will miss the bus.$o$, $o$You will hurry because you miss the bus.$o$, $o$When you miss the bus, you will not hurry.$o$, $o$Since you hurry, you will not miss the bus.$o$, $o$If you don't hurry, you will miss the bus.$o$], 4, $e$1. **Unless** if not anlamındadır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I haven't seen him since last June.

Which one is closest in meaning to the sentence above?$q$, array[$o$I saw him for the first time last June.$o$, $o$The last time I saw him was last June.$o$, $o$I will see him again after next June.$o$, $o$I have seen him every month since June.$o$, $o$I didn't want to see him last June.$o$], 1, $e$1. **Haven't seen since** son görmenin geçmişte olduğunu gösterir.

Diğer şıklar: **A** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$It is the first time she has flown in a plane.

Which one is closest in meaning to the sentence above?$q$, array[$o$She has never flown in a plane before.$o$, $o$She has often flown in a plane in the past.$o$, $o$She will fly in a plane for the first time tomorrow.$o$, $o$She refused to fly in a plane last year.$o$, $o$She flew in a plane for the last time yesterday.$o$], 0, $e$1. **It is the first time ... has** daha önce hiç yapmadığını gösterir.

Diğer şıklar: **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Although it was raining, they played football.

Which one is closest in meaning to the sentence above?$q$, array[$o$They played football because of the rain.$o$, $o$They did not play football as it was raining.$o$, $o$They played football in spite of the rain.$o$, $o$They played football after the rain stopped.$o$, $o$They stopped playing when the rain started.$o$], 2, $e$1. **Although** karşıtlık kurar. **In spite of** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Hardly had he arrived when the phone rang.

Which one is closest in meaning to the sentence above?$q$, array[$o$He arrived long after the phone had rung.$o$, $o$The phone rang because he had not arrived.$o$, $o$He arrived while the phone was still ringing.$o$, $o$The phone did not ring when he arrived.$o$, $o$As soon as he arrived, the phone rang.$o$], 4, $e$1. **Hardly ... when** hemen sonrayı gösterir.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$"I will call you tomorrow," he said to me.

Which one is closest in meaning to the sentence above?$q$, array[$o$He told me that he would call me the next day.$o$, $o$He told me that he called me the day before.$o$, $o$He asked me if I would call him tomorrow.$o$, $o$He said that I would call him the next day.$o$, $o$He told me that he has called me tomorrow.$o$], 0, $e$1. Doğrudan anlatım dolaylı anlatıma çevrilirken **will** → **would**, **tomorrow** → **the next day** olur.

Diğer şıklar: **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The teacher made the students rewrite the essay.

Which one is closest in meaning to the sentence above?$q$, array[$o$The students made the teacher rewrite the essay.$o$, $o$The essay was rewritten by the teacher herself.$o$, $o$The students were made to rewrite the essay.$o$, $o$The students were allowed to rewrite the essay.$o$, $o$The teacher was made to rewrite the essay.$o$], 2, $e$1. **Make somebody do** edilgen olduğunda **be made to do** olur.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He would rather stay at home than go out.

Which one is closest in meaning to the sentence above?$q$, array[$o$He prefers going out to staying at home.$o$, $o$He prefers staying at home to going out.$o$, $o$He cannot stay at home because he must go out.$o$, $o$He stays at home when he goes out.$o$, $o$He would stay at home after he went out.$o$], 1, $e$1. **Would rather A than B** ile **prefer A to B** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Neither the manager nor the employees were aware of the problem.

Which one is closest in meaning to the sentence above?$q$, array[$o$Only the manager was aware of the problem.$o$, $o$The employees knew the problem but the manager didn't.$o$, $o$Neither the manager nor the employees solved the problem.$o$, $o$Both the manager and the employees were unaware of the problem.$o$, $o$Both the manager and the employees were aware of it.$o$], 3, $e$1. **Neither ... nor** her ikisinin de bilmediğini gösterir.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **E** anlamı farklıdır.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$No sooner had we left the house than it started to snow.

Which one is closest in meaning to the sentence above?$q$, array[$o$It started to snow before we left the house.$o$, $o$We left the house because it started to snow.$o$, $o$As soon as we left the house, it started to snow.$o$, $o$It stopped snowing as we left the house.$o$, $o$We stayed in the house until it started to snow.$o$], 2, $e$1. **No sooner ... than** hemen sonrayı gösterir.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She used to play the piano when she was a child.

Which one is closest in meaning to the sentence above?$q$, array[$o$She is learning to play the piano now.$o$, $o$She doesn't play the piano now, but she did as a child.$o$, $o$She had never played the piano as a child.$o$, $o$She still plays the piano every day as a child.$o$, $o$She will play the piano when she is a child.$o$], 1, $e$1. **Used to** geçmişte yapılıp artık yapılmayan alışkanlığı gösterir.

Diğer şıklar: **A** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The film was so boring that we left early.

Which one is closest in meaning to the sentence above?$q$, array[$o$It was a boring film, so we stayed until the end.$o$, $o$We left early because the film had not started.$o$, $o$The film was boring enough for us to stay late.$o$, $o$It was such a boring film that we left early.$o$, $o$We enjoyed the film so much that we left early.$o$], 3, $e$1. **So ... that** ile **such a ... that** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$If I were you, I would accept the offer.

Which one is closest in meaning to the sentence above?$q$, array[$o$I will accept the offer if you want me to.$o$, $o$I think you refused the offer last week.$o$, $o$I advise you to accept the offer.$o$, $o$I would like you to reject the offer.$o$, $o$I am you, so I accept the offer.$o$], 2, $e$1. **If I were you** öneri anlamı taşır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He failed the exam because he hadn't studied enough.

Which one is closest in meaning to the sentence above?$q$, array[$o$He would have passed the exam if he had studied enough.$o$, $o$He will pass the exam if he studies enough.$o$, $o$He passed the exam although he hadn't studied.$o$, $o$He would pass the exam if he studied more now.$o$, $o$He failed the exam so he started studying.$o$], 0, $e$1. Geçmişteki gerçek durumun geçmiş koşullu karşılığı **would have passed if he had studied** olur.

Diğer şıklar: **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$They have been married for ten years.

Which one is closest in meaning to the sentence above?$q$, array[$o$They will get married in ten years.$o$, $o$They were married ten years ago but are divorced now.$o$, $o$They have not yet decided to get married.$o$, $o$They got married for the tenth time.$o$, $o$They got married ten years ago.$o$], 4, $e$1. **Have been married for ten years** on yıl önce evlendiklerini ve hâlâ evli olduklarını gösterir.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$It is said that the old castle is haunted.

Which one is closest in meaning to the sentence above?$q$, array[$o$The old castle said that it was haunted.$o$, $o$The old castle is said to be haunted.$o$, $o$People said that the castle had been haunted.$o$, $o$The castle was haunted by the people who said it.$o$, $o$It is known that the old castle is not haunted.$o$], 1, $e$1. **It is said that** ile **is said to be** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The meeting was cancelled due to the heavy snow.

Which one is closest in meaning to the sentence above?$q$, array[$o$Because of the heavy snow, they cancelled the meeting.$o$, $o$They cancelled the meeting in spite of the heavy snow.$o$, $o$The heavy snow started after they cancelled the meeting.$o$, $o$The meeting continued even though it snowed heavily.$o$, $o$They cancelled the snow because of the meeting.$o$], 0, $e$1. **Due to** ile **because of** aynı anlamdadır.

Diğer şıklar: **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır / **E** anlamı farklıdır.$e$, 1),
  (19, 'ydt-dil', null::integer, $q$Not only did she win the race, but she also broke the record.

Which one is closest in meaning to the sentence above?$q$, array[$o$She won the race but couldn't break the record.$o$, $o$She broke the record but didn't win the race.$o$, $o$She didn't win the race, so she broke the record.$o$, $o$She won the race and broke the record as well.$o$, $o$She won the race because she broke the record.$o$], 3, $e$1. **Not only ... but also** iki olumlu bilgiyi birleştirir.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **E** anlamı farklıdır.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He is the tallest player in the team.

Which one is closest in meaning to the sentence above?$q$, array[$o$He is taller than only one player in the team.$o$, $o$Every player in the team is as tall as he is.$o$, $o$He is not as tall as the other players.$o$, $o$The team has no tall players except his friend.$o$, $o$No other player in the team is as tall as he is.$o$], 4, $e$1. **The tallest** ile **no other is as tall as** aynı anlamdadır.

Diğer şıklar: **A** anlamı farklıdır / **B** anlamı farklıdır / **C** anlamı farklıdır / **D** anlamı farklıdır.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Durum Soruları Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Durum Soruları Testi 1$t$, 25, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Durum Soruları Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Your friend has just told you that he failed his driving test. You want to cheer him up. What would you say to him?$q$, array[$o$Congratulations! You have really earned this success.$o$, $o$I'm afraid the shop closes at six every evening.$o$, $o$You should have brought your umbrella this morning.$o$, $o$Don't worry. You'll do much better next time.$o$, $o$Thanks for the invitation, but I can't come tonight.$o$], 3, $e$1. Arkadaş üzgün olduğu için teselli etmek gerekir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$You are in a restaurant and you want to ask the waiter for the bill. What would you say?$q$, array[$o$Excuse me, could you tell me the way to the station?$o$, $o$Excuse me, is this seat free for my friend?$o$, $o$Excuse me, could we have the bill, please?$o$, $o$Excuse me, do you know where I can buy a ticket?$o$, $o$Excuse me, would you mind opening the window a little?$o$], 2, $e$1. Hesap istemek **could we have the bill** ile ifade edilir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Your teacher has asked you to speak louder because the students at the back cannot hear you. What would you most probably say?$q$, array[$o$I'm sorry. I'll try to speak more clearly.$o$, $o$It was my pleasure. I'm glad that you enjoyed it.$o$, $o$No, thanks. I have already finished my lunch.$o$, $o$I'd rather stay at home than go to the cinema.$o$, $o$Well, congratulations on your wonderful new job.$o$], 0, $e$1. Öğretmen uyarı yaptığı için özür dileyip düzelteceğini söyler.

Diğer şıklar: **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$You phone a friend, but his mother answers and says he is out. You want to leave a message. What would you say?$q$, array[$o$Could you show me where the nearest post office is?$o$, $o$Could you tell him that I called and ask him to ring me back?$o$, $o$Could you lend me some money until the end of the week?$o$, $o$Could you explain why the train was cancelled yesterday?$o$, $o$Could you recommend a good restaurant near the hotel?$o$], 1, $e$1. Mesaj bırakmak için **Could you tell him ...** kalıbı kullanılır.

Diğer şıklar: **A** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Your classmate has just won a national science competition. What would you say to him?$q$, array[$o$Never mind. You'll have another chance next year.$o$, $o$I'm sorry to hear that you've lost your wallet.$o$, $o$Congratulations! You really deserve this prize.$o$, $o$Excuse me, could you repeat the question once more?$o$, $o$Please be quiet. I am trying to study for my exam.$o$], 2, $e$1. Başarı kazanan birini tebrik etmek gerekir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$You accidentally stepped on a stranger's foot on a crowded bus. What would you say?$q$, array[$o$You're welcome. It was no trouble at all for me.$o$, $o$Thank you, but I've already had my breakfast.$o$, $o$Of course. You can use my phone if you want to.$o$, $o$Oh, I'm so sorry! I didn't mean to do that.$o$, $o$Good luck with your exam tomorrow morning.$o$], 3, $e$1. Yanlışlıkla ayağına basıldığı için özür dilenir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$You want to borrow your friend's dictionary for a few minutes. How would you ask politely?$q$, array[$o$Would you mind lending me your dictionary for a moment?$o$, $o$Would you mind showing me the new bus timetable?$o$, $o$Would you mind if I borrowed your car next week?$o$, $o$Would you mind explaining the rules of this game?$o$, $o$Would you mind turning off the lights after you leave?$o$], 0, $e$1. Sözlük ödünç almak için **lend me your dictionary** ifadesi gerekir.

Diğer şıklar: **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$A tourist asks you how to get to the museum, but you are not from this city and do not know. What would you say?$q$, array[$o$It's about two kilometres away, just behind the station.$o$, $o$I'm sorry, I'm a stranger here myself, so I can't help you.$o$, $o$Take the second left and go straight until the bridge.$o$, $o$I believe the museum opens at nine o'clock every day.$o$, $o$You can buy a ticket from the machine over there.$o$], 1, $e$1. Şehri bilmeyen kişi bunu belirtip özür diler.

Diğer şıklar: **A** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Your friend invites you to a party, but you have to study for an important exam. How would you refuse politely?$q$, array[$o$Thanks for asking, and I will bring some cake tomorrow.$o$, $o$Thanks a lot, because I won the competition yesterday.$o$, $o$Thanks for the lift, but I walked all the way home.$o$, $o$Thanks for waiting, as the bus was late this morning.$o$, $o$Thanks for asking, but I'm afraid I have to study tonight.$o$], 4, $e$1. Daveti nazikçe reddetmek için gerekçe sunulur.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$You are at a shop and you want to know the price of a pair of shoes. What would you say?$q$, array[$o$Excuse me, how much are these shoes?$o$, $o$Excuse me, how long does the film last?$o$, $o$Excuse me, how far is the nearest bank?$o$, $o$Excuse me, how old is the building next door?$o$, $o$Excuse me, how often does the ferry leave?$o$], 0, $e$1. Fiyat sormak için **how much** kullanılır.

Diğer şıklar: **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 1),
  (11, 'ydt-dil', null::integer, $q$Your younger brother is making too much noise while you are doing your homework. What would you say to him?$q$, array[$o$Could you please bring me a glass of water and some bread?$o$, $o$Could you please tell me what time the match begins?$o$, $o$Could you please give me the telephone number of the doctor?$o$, $o$Could you please keep your voice down? I'm trying to concentrate.$o$, $o$Could you please show me the photos from the holiday?$o$], 3, $e$1. Gürültüden rahatsız olunduğunda sessiz olması istenir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Your colleague has just told you that his grandfather passed away last week. What would you say to him?$q$, array[$o$That's wonderful news! I'm really happy for you.$o$, $o$I'm sorry, but I can't attend the meeting tomorrow.$o$, $o$Thanks a lot. It was a delicious dinner last night.$o$, $o$Don't forget to bring your passport to the airport.$o$, $o$I'm so sorry to hear that. Please accept my condolences.$o$], 4, $e$1. Yakın kaybı için başsağlığı dilenir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$You want to suggest to your friends that you all go for a picnic this weekend. What would you say?$q$, array[$o$Why didn't you tell me about the picnic last week?$o$, $o$Why is the picnic area so crowded at this time?$o$, $o$Why don't we go for a picnic by the lake this Saturday?$o$, $o$Why do people usually bring their dogs to picnics?$o$, $o$Why was the picnic cancelled by the local council?$o$], 2, $e$1. Öneri sunmak için **Why don't we ...** kalıbı kullanılır.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Your friend is about to take a very important exam tomorrow. You want to wish him luck. What would you say?$q$, array[$o$Well done! You passed the exam brilliantly.$o$, $o$Take care! The roads are slippery in this weather.$o$, $o$Bless you! I hope you feel better soon.$o$, $o$Good luck! I'm sure you'll do very well.$o$, $o$Cheers! Let's celebrate your new job tonight.$o$], 3, $e$1. Önemli bir sınav öncesinde şans dilenir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$You are on a plane and your seat is next to a window, but a passenger is sitting in it. How would you politely tell him?$q$, array[$o$Excuse me, I think the flight has been cancelled.$o$, $o$Excuse me, I think you're sitting in my seat.$o$, $o$Excuse me, I think you've dropped your passport.$o$, $o$Excuse me, I think this seat is too close to the door.$o$, $o$Excuse me, I think the pilot is waiting for me.$o$], 1, $e$1. Koltuğunuzda oturan kişiyi nazikçe uyarmak gerekir.

Diğer şıklar: **A** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Your friend asks you whether you would like to have some more tea, but you've had enough. What would you say?$q$, array[$o$Yes, please. I'd love to go for a walk now.$o$, $o$No, thanks. I haven't been to that café yet.$o$, $o$Sorry, I didn't realise that you were waiting.$o$, $o$Of course not. I think the weather will improve.$o$, $o$No, thank you. I've had enough, but it was delicious.$o$], 4, $e$1. Daha fazla çay teklifini nazikçe reddetmek gerekir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$You have forgotten your friend's name and you want to ask for it politely. What would you say?$q$, array[$o$I'm sorry, I've forgotten your name. Could you remind me?$o$, $o$I'm sorry, I've forgotten my umbrella. Could you lend me yours?$o$, $o$I'm sorry, I've lost my way. Could you show me the road?$o$, $o$I'm sorry, I've missed the bus. Could you call a taxi?$o$, $o$I'm sorry, I've broken a plate. Could you bring another?$o$], 0, $e$1. Adını unuttuğunuz kişiden adını tekrar söylemesini istemek gerekir.

Diğer şıklar: **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$You think your friend should see a doctor because he has been coughing for two weeks. What would you say?$q$, array[$o$You should have called me before you went to the concert.$o$, $o$You should see a doctor if you've been coughing for so long.$o$, $o$You should try this new restaurant in the city centre.$o$, $o$You should be careful when you cross the busy street.$o$, $o$You should read the instructions before using the machine.$o$], 1, $e$1. Uzun süren öksürük için doktora gitme önerisi yapılır.

Diğer şıklar: **A** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$A friend tells you that she has been offered a job abroad but she is not sure whether to accept it. What advice would you give?$q$, array[$o$If I were you, I would have stayed at home yesterday.$o$, $o$If I were you, I would not have bought this expensive car.$o$, $o$If I were you, I would call the hotel to cancel the booking.$o$, $o$If I were you, I would have told him the truth earlier.$o$, $o$If I were you, I would accept it. It's a great opportunity.$o$], 4, $e$1. Gerçek dışı koşullu tavsiye cümlesi şimdiki karara yönelik verilmelidir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **C** verilen durumda söylenmez / **D** verilen durumda söylenmez.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$You are in a library and you want to ask a student at the next table to lower the volume of his music. What would you say?$q$, array[$o$Excuse me, would you mind passing me the salt, please?$o$, $o$Excuse me, would you mind telling me what time it is?$o$, $o$Excuse me, would you mind turning your music down a little?$o$, $o$Excuse me, would you mind giving me a lift to the airport?$o$, $o$Excuse me, would you mind opening the door for me?$o$], 2, $e$1. Müziğin sesini kısmasını nazikçe istemek gerekir.

Diğer şıklar: **A** verilen durumda söylenmez / **B** verilen durumda söylenmez / **D** verilen durumda söylenmez / **E** verilen durumda söylenmez.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Paragraf Tamamlama Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Paragraf Tamamlama Testi 1$t$, 30, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Paragraf Tamamlama Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Bees play a vital role in our food supply. ---- Without them, many fruits and vegetables would become much more expensive or even disappear.$q$, array[$o$They usually build their nests in cold and dark caves.$o$, $o$Some people are afraid of them because of their sound.$o$, $o$Their honey is sold in many shops around the country.$o$, $o$They can fly faster than most birds in the forest.$o$, $o$They carry pollen from flower to flower for plants.$o$], 4, $e$1. Sonraki cümle arılar olmadan meyve ve sebzelerin azalacağını söylüyor. Boşluk, arıların bitkilere katkısını açıklamalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz.$e$, 2),
  (2, 'ydt-dil', null::integer, $q$Many people think that learning a language is only about memorising words. ---- In fact, understanding grammar and practising speaking are equally important.$q$, array[$o$Therefore, everybody should buy the same dictionary.$o$, $o$However, vocabulary is only one part of language learning.$o$, $o$Similarly, words are easy to forget after a long holiday.$o$, $o$As a result, language classes are always crowded.$o$, $o$For example, English is spoken in many countries.$o$], 1, $e$1. Önceki cümle yalnızca kelime ezberlemeyi eleştiriyor, sonraki cümle diğer önemli unsurları sıralıyor.

Diğer şıklar: **A** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$The first cities appeared thousands of years ago along rivers. ---- As a result, people could grow crops easily and trade with each other.$q$, array[$o$Most of these cities were destroyed by earthquakes.$o$, $o$People used to wear simple clothes made of animal skins.$o$, $o$Some rivers are longer than the largest mountain ranges.$o$, $o$Rivers provided fresh water and fertile land for farming.$o$, $o$Modern cities have much faster transport systems today.$o$], 3, $e$1. Sonuç cümlesi tarımın ve ticaretin kolay olmasını söylüyor. Boşluk nehirlerin sağladığı avantajı vermeli.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Exercise is good not only for the body but also for the mind. ---- That is why doctors often recommend a daily walk to people who feel anxious.$q$, array[$o$Many gyms are open twenty-four hours in big cities.$o$, $o$Some sports can only be played in the summer.$o$, $o$Professional athletes earn very high salaries nowadays.$o$, $o$Walking shoes should be replaced every two years.$o$, $o$Regular physical activity reduces stress and improves our mood.$o$], 4, $e$1. Sonuç cümlesindeki öneri, egzersizin stresi azalttığı bilgisine dayanır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Plastic waste is a serious problem for the oceans. ---- Many sea animals mistake these pieces for food and become seriously ill.$q$, array[$o$Fishing has been an important industry for centuries.$o$, $o$Over time, plastic breaks down into tiny pieces.$o$, $o$Some countries have much longer coastlines than others.$o$, $o$Beaches are usually crowded during the summer months.$o$, $o$Tourists often collect shells as souvenirs of their trip.$o$], 1, $e$1. Sonraki cümle "these pieces" ifadesini kullanıyor. Boşluk plastiğin küçük parçalara ayrıldığını söylemelidir.

Diğer şıklar: **A** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 3),
  (6, 'ydt-dil', null::integer, $q$I used to think that public speaking was terrifying. ---- But after joining a debate club, I realised that confidence comes with practice.$q$, array[$o$Debate clubs are open to students from all departments.$o$, $o$My teacher recommends reading at least one book a month.$o$, $o$Even thinking about speaking made my hands shake.$o$, $o$The club meets in the library every Wednesday afternoon.$o$, $o$Many famous politicians studied law at university.$o$], 2, $e$1. "But" ile başlayan cümle önceki korkuyla çelişiyor. Boşluk eski korkuyu anlatmalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Tea is the most popular drink in many countries. ---- However, in some regions people prefer coffee, especially in the morning.$q$, array[$o$People drink it at breakfast and late in the evening.$o$, $o$Coffee beans are grown in warm and humid climates.$o$, $o$The first cups were made of a special kind of clay.$o$, $o$A new café has opened near the central bus station.$o$, $o$Sugar was once much more expensive than gold.$o$], 0, $e$1. "However" sonraki cümlede karşıtlık getirir. Boşluk çayın yaygın tüketimini anlatmalıdır.

Diğer şıklar: **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Scientists have discovered that sleeping well improves memory. ---- During deep sleep, the brain organises the information it has received during the day.$q$, array[$o$Some animals sleep for as long as twenty hours daily.$o$, $o$Beds have become much more comfortable in recent years.$o$, $o$Many people prefer to wake up before the sun rises.$o$, $o$Dreams are usually forgotten within a few minutes.$o$, $o$This is why well-rested students often do better in exams.$o$], 4, $e$1. Sonraki cümle derin uykuda beynin bilgiyi düzenlediğini açıklıyor. Boşluk bu açıklamanın sonucunu içermelidir.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Online shopping has changed the way we buy things. ---- On the other hand, it has also caused problems for small shops, which cannot compete with big companies.$q$, array[$o$Delivery trucks are often painted in bright colours.$o$, $o$Credit cards were first used in the middle of the last century.$o$, $o$On the one hand, it saves time and offers a wider choice of products.$o$, $o$Many customers write long reviews about their purchases.$o$, $o$Some websites are available only in a few languages.$o$], 2, $e$1. "On the other hand" ifadesi öncesinde "On the one hand" ile başlayan olumlu bir yön bekler.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Our neighbour is a very generous person. ---- Last winter, she even gave her own coat to a homeless man.$q$, array[$o$She lives in the green house at the end of the street.$o$, $o$She always helps those in need without asking for anything.$o$, $o$She works as a nurse in the city hospital.$o$, $o$She moved here from another town three years ago.$o$, $o$She has two cats and a large garden full of roses.$o$], 1, $e$1. Sonraki örnek cömertliği gösteriyor. Boşluk cömertliği genel olarak anlatmalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Wind energy is becoming more popular every year. ---- For this reason, many governments are investing heavily in wind farms.$q$, array[$o$The first windmills were built in ancient Persia.$o$, $o$Wind speeds change according to the time of the year.$o$, $o$Wind farms are usually built far from city centres.$o$, $o$It is clean, renewable and does not produce harmful gases.$o$, $o$Some birds migrate to warmer places in autumn.$o$], 3, $e$1. "For this reason" bir önceki cümlenin sebep olduğu sonucu bildirir. Boşluk rüzgâr enerjisinin avantajını vermelidir.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The museum was built in the nineteenth century as a royal palace. ---- Today, visitors can see paintings, sculptures and ancient coins in its many halls.$q$, array[$o$After the royal family left, it was converted into a museum.$o$, $o$The garden contains more than a hundred types of flowers.$o$, $o$Tickets can be bought at the entrance or online.$o$, $o$It is closed to visitors on Mondays during the winter.$o$, $o$The capital has several other buildings from the same period.$o$], 0, $e$1. Önce saray, sonra bugün müze. Boşluk saraydan müzeye geçişi anlatmalıdır.

Diğer şıklar: **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Many teenagers spend hours on social media every day. ---- This is why some schools have started to limit the use of phones in classrooms.$q$, array[$o$Phones have become much thinner than they used to be.$o$, $o$Some applications are free but show many advertisements.$o$, $o$Experts warn that it can affect their concentration and sleep.$o$, $o$Teachers often use projectors to display their slides.$o$, $o$The first mobile phones were large and very heavy.$o$], 2, $e$1. "This is why" okulların neden telefonu kısıtladığını açıklar. Boşluk sosyal medyanın zararını söylemelidir.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Coral reefs are home to about a quarter of all marine species. ---- If the reefs disappear, thousands of animals will lose their habitat.$q$, array[$o$Divers from all over the world visit them every summer.$o$, $o$Rising sea temperatures are damaging them at an alarming rate.$o$, $o$Fish farms are common along the coasts of Asia.$o$, $o$Some islands are famous for their white sandy beaches.$o$, $o$Sharks can detect blood from several kilometres away.$o$], 1, $e$1. Sonraki cümle resiflerin yok olma ihtimalini koşul olarak anlatıyor. Boşluk bu tehdidi tanıtmalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Ali did not have enough money to buy a new bicycle. ---- Finally, after six months of work, he saved enough and bought the one he wanted.$q$, array[$o$His brother has a blue bicycle that he never uses.$o$, $o$Bicycles are an excellent way to protect the environment.$o$, $o$The shop on the corner sells sports equipment.$o$, $o$Ali's school is located near the city park.$o$, $o$So he started delivering newspapers every morning before school.$o$], 4, $e$1. "Finally ... saved enough" bir süreci anlatır. Boşluk Ali'nin para biriktirmek için ne yaptığını söylemelidir.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Some people believe that money brings happiness. ---- Research shows that after basic needs are met, extra income makes little difference to our well-being.$q$, array[$o$Moreover, rich people usually live in bigger houses.$o$, $o$Therefore, everybody wants to find a job as soon as possible.$o$, $o$As a result, banks offer higher interest rates every year.$o$, $o$Nevertheless, this idea is not completely supported by evidence.$o$, $o$Besides, people spend their money on many different things.$o$], 3, $e$1. "Research shows" ile gelen cümle ilk görüşü eleştirir. Boşluk karşıtlık kuran bir cümle olmalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The library will be closed for renovation next month. ---- Students who need books can borrow them from the faculty library instead.$q$, array[$o$Therefore, the main building will not be available for use.$o$, $o$Moreover, the café on the ground floor serves delicious soup.$o$, $o$For example, the first floor has a large collection of maps.$o$, $o$Likewise, the museum shop sells postcards and posters.$o$, $o$Besides, many students prefer studying at home.$o$], 0, $e$1. Sonraki cümle alternatif sunuyor. Boşluk kapanmanın sonucunu belirtmelidir.

Diğer şıklar: **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Mount Everest attracts climbers from all over the world. ---- Every year, some of them have to turn back before reaching the top.$q$, array[$o$The mountain is covered with snow throughout the year.$o$, $o$Photographers visit the area to take pictures of sunsets.$o$, $o$Reaching the summit requires great strength and planning.$o$, $o$Local guides sell traditional clothes to the tourists.$o$, $o$A new road has been built to the nearest airport.$o$], 2, $e$1. Sonraki cümle bazı kişilerin zirveye ulaşamadığını söyler. Boşluk zirveye çıkmanın zorluğunu anlatmalıdır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The invention of the printing press changed the world. ---- As a result, ideas spread faster than ever before, and literacy rates began to rise.$q$, array[$o$Paper had been made in China for several centuries.$o$, $o$Many kings collected rare books in their libraries.$o$, $o$Handwriting was taught carefully in all schools then.$o$, $o$Books became cheaper and could be produced in large numbers.$o$, $o$Ink was originally prepared from the juice of plants.$o$], 3, $e$1. "As a result" ile verilen sonuç, matbaanın kitapları ucuzlatıp çoğaltması sebebine dayanır.

Diğer şıklar: **A** paragrafın akışına uymaz / **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Maria is learning to cook, but she makes a lot of mistakes. ---- Yesterday, for example, she forgot to add salt to the soup.$q$, array[$o$Her family is very patient and keeps encouraging her.$o$, $o$She has been living in the same city for five years.$o$, $o$She bought a new pair of shoes at the weekend.$o$, $o$She is planning to visit her cousins during the holiday.$o$, $o$She prefers watching documentaries to reading novels.$o$], 0, $e$1. "For example" ile verilen örnek, Maria'nın hata yaptığını gösterir, boşluk yine Maria'nın mutfaktaki durumunu sürdürmelidir.

Diğer şıklar: **B** paragrafın akışına uymaz / **C** paragrafın akışına uymaz / **D** paragrafın akışına uymaz / **E** paragrafın akışına uymaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT İngilizce-Türkçe Çeviri Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT İngilizce-Türkçe Çeviri Testi 1$t$, 30, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT İngilizce-Türkçe Çeviri Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$She has been working here since 2015.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$O, 2015'te burada çalışmaya başlayacak.$o$, $o$O, 2015'te burada çalışıyordu.$o$, $o$O, 2015'ten beri burada çalışmıyor.$o$, $o$O, burada 2015'te çalışmış olmalı.$o$, $o$O, 2015'ten beri burada çalışıyor.$o$], 4, $e$1. **Has been working since** geçmişte başlayıp süren eylemi gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (2, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$), $q$If it rains tomorrow, we will cancel the picnic.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Dün yağmur yağsaydı pikniği iptal ederdik.$o$, $o$Yarın yağmur yağsa pikniği iptal ederdik.$o$, $o$Yarın yağmur yağdığı için pikniği iptal ettik.$o$, $o$Yarın yağmur yağarsa pikniği iptal edeceğiz.$o$, $o$Yağmur yağarsa pikniği iptal etmeyeceğiz.$o$], 3, $e$1. **If + Present Simple, will** gerçekçi gelecek koşulunu gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (3, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$The report must have been written by an expert.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Rapor bir uzman tarafından yazılmış olmalı.$o$, $o$Raporu bir uzman yazmak zorundaydı.$o$, $o$Rapor bir uzman tarafından yazılabilir.$o$, $o$Rapor bir uzman tarafından yazılmamış olmalı.$o$, $o$Raporu bir uzmana yazdırmalıyız.$o$], 0, $e$1. **Must have been written** geçmişe dair güçlü çıkarım ve edilgenlik gösterir.

Diğer şıklar: **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (4, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Hardly had he left the room when the phone rang.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Telefon çalınca odadan hiç çıkamadı.$o$, $o$Odadan çıkar çıkmaz telefon çaldı.$o$, $o$Telefon çaldığında odadan yeni çıkacaktı.$o$, $o$Odadan çıkmasına rağmen telefon çaldı.$o$, $o$Odadan çıkmadan önce telefon çalmıştı.$o$], 1, $e$1. **Hardly ... when** hemen sonrayı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (5, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$), $q$I wish I had studied harder for the exam.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Sınav için daha çok çalışacağımı umuyorum.$o$, $o$Keşke sınav için daha çok çalışıyor olsam.$o$, $o$Sınav için daha çok çalışmayı istemiyorum.$o$, $o$Keşke sınav için daha çok çalışsaydım.$o$, $o$Sınav için daha çok çalıştığıma sevindim.$o$], 3, $e$1. **Wish + Past Perfect** geçmişteki pişmanlığı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (6, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$He is said to have lost a lot of money.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Onun çok para kaybettiği söyleniyor.$o$, $o$O, çok para kaybetmesini söyledi.$o$, $o$Çok para kaybedeceği söyleniyor.$o$, $o$O, çok para kaybettiğini kimseye söylemedi.$o$, $o$Ona çok para kaybetmesi söylendi.$o$], 0, $e$1. **Is said to have lost** geçmişte bir olayın söylendiğini ifade eder.

Diğer şıklar: **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (7, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Despite being tired, she continued working.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Yorgun olduğu için çalışmaya devam etti.$o$, $o$Yorgun olunca çalışmayı bıraktı.$o$, $o$Yorgun olduğunda çalışmaya devam edecek.$o$, $o$Yorgun olmasa çalışmaya devam ederdi.$o$, $o$Yorgun olmasına rağmen çalışmaya devam etti.$o$], 4, $e$1. **Despite** karşıtlık bildirir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (8, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$), $q$The more you read, the more you learn.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Çok okuduğun için çok öğrendin.$o$, $o$Ne kadar çok okursan o kadar çok öğrenirsin.$o$, $o$Okumadığın sürece öğrenemezsin.$o$, $o$Daha çok öğrenmek için daha az okumalısın.$o$, $o$Hem okudun hem de öğrendin.$o$], 1, $e$1. **The more ..., the more ...** orantılı artışı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (9, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$), $q$I'd rather you didn't smoke here.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Burada sigara içmeyi tercih ederim.$o$, $o$Burada sigara içmediğinizi sanıyorum.$o$, $o$Burada sigara içmemenizi tercih ederim.$o$, $o$Burada sigara içmek zorunda değilsiniz.$o$, $o$Burada sigara içmenizi isterdim.$o$], 2, $e$1. **I'd rather you didn't** karşı tarafın yapmamasını tercih etmeyi gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (10, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$By the time we arrived, the film had already started.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Biz varmadan film hiç başlamadı.$o$, $o$Biz varınca film başlayacaktı.$o$, $o$Filmi izlemek için biz varmıştık.$o$, $o$Film başlayınca biz varmıştık.$o$, $o$Biz vardığımızda film çoktan başlamıştı.$o$], 4, $e$1. **Had already started** varıştan önceki olayı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (11, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Not only did he apologise, but he also offered to pay.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Özür dilemekle kalmadı, ödemeyi de teklif etti.$o$, $o$Özür dilemedi ama ödemeyi teklif etti.$o$, $o$Özür dilemek için ödemeyi teklif etmedi.$o$, $o$Özür diledi, çünkü ödemeyi teklif etmedi.$o$, $o$Ödemeyi teklif edince özür dilemeyi bıraktı.$o$], 0, $e$1. **Not only ... but also** iki olumlu eylemi birleştirir.

Diğer şıklar: **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 3),
  (12, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$), $q$She is too proud to ask for help.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Yardım istediği için çok gururlu.$o$, $o$Yardım isteyecek kadar gururlu değil.$o$, $o$Yardım isteyemeyecek kadar gururlu.$o$, $o$Çok gururlu olduğu için yardım etti.$o$, $o$Gururlu olmak için yardım istedi.$o$], 2, $e$1. **Too ... to** olumsuz sonuç bildirir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (13, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$), $q$This is the house where I grew up.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Bu ev benim büyüyeceğim yer.$o$, $o$Burası benim büyüdüğüm ev.$o$, $o$Burası benim yaşadığım ilk ev değil.$o$, $o$Ben evde büyümedim.$o$, $o$Bu ev bizim için çok küçüktü.$o$], 1, $e$1. **Where** yer belirten ilgi zamiridir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (14, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$), $q$Whoever finishes first will get a prize.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$İlk bitiren hiçbir ödül kazanamadı.$o$, $o$Önce ödül alan işini bitirecek.$o$, $o$Ödülü ilk bitirene verdiler.$o$, $o$Kim ilk bitirirse ödül kazanacak.$o$, $o$İlk bitirdikten sonra ödül aldı.$o$], 3, $e$1. **Whoever** kim olursa olsun anlamını verir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (15, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$You needn't have bought so much food.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Bu kadar çok yiyecek almamalıydın.$o$, $o$Bu kadar çok yiyecek alman gerekir.$o$, $o$Bu kadar çok yiyecek almana gerek yoktu.$o$, $o$Bu kadar çok yiyecek alamazdın.$o$, $o$Bu kadar çok yiyecek almış olabilirsin.$o$], 2, $e$1. **Needn't have + V3** yapılmış ama gereksiz olan işi gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (16, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$), $q$It's about time we made a decision.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Artık bir karar vermemizin zamanı geldi.$o$, $o$Bir karar verirsek zamanında yaparız.$o$, $o$Karar vermek için çok zamanımız var.$o$, $o$Bir kararı zamanında vermiştik.$o$, $o$Karar vermeyi bir sonraki zamana bıraktık.$o$], 0, $e$1. **It's about time + Past Simple** gecikmiş bir işin zamanının geldiğini söyler.

Diğer şıklar: **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (17, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$He used to smoke, but he gave it up.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Sigara içmeye alışmıştı ve bırakmadı.$o$, $o$Şimdi sigara içiyor ama bırakacak.$o$, $o$Sigara içmediği için bıraktı.$o$, $o$Sigara içtiğinde hep bırakıyordu.$o$, $o$Eskiden sigara içerdi ama bıraktı.$o$], 4, $e$1. **Used to** geçmişteki alışkanlığı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır.$e$, 1),
  (18, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$We were made to wait for two hours.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Biz iki saat bekledik ve ayrıldık.$o$, $o$İki saat bekleyen birini yaptık.$o$, $o$İki saat beklemeye zorlandık.$o$, $o$Bize iki saat bekleme sözü verildi.$o$, $o$İki saat sonra bizi bekleyeceklerdi.$o$], 2, $e$1. **Be made to do** bir şeyi yapmaya zorlanmayı gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2),
  (19, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$), $q$Had I known, I would have helped you.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Bilirsem sana yardım ederim.$o$, $o$Bildiğim için sana yardım ettim.$o$, $o$Sana yardım edince öğrenecektim.$o$, $o$Bilseydim sana yardım ederdim.$o$, $o$Bilmeden sana yardım etmiştim.$o$], 3, $e$1. **Had + özne + V3** geçmişteki gerçek dışı koşulu gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **B** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 3),
  (20, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$They are said to be building a new bridge.

Which one is the correct Turkish translation of the sentence above?$q$, array[$o$Yeni bir köprü yaptıklarını söylediler.$o$, $o$Yeni bir köprü yaptıkları söyleniyor.$o$, $o$Yeni köprü yapılırsa söylenecek.$o$, $o$Köprü yapanlar yeni biri olarak söyleniyor.$o$, $o$Onlara yeni bir köprü yapmaları söylendi.$o$], 1, $e$1. **Are said to be building** şu an yapıldığı söylenen eylemi gösterir.

Diğer şıklar: **A** çeviri anlamı ya da zamanı yanlıştır / **C** çeviri anlamı ya da zamanı yanlıştır / **D** çeviri anlamı ya da zamanı yanlıştır / **E** çeviri anlamı ya da zamanı yanlıştır.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Türkçe-İngilizce Çeviri Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Türkçe-İngilizce Çeviri Testi 1$t$, 30, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Türkçe-İngilizce Çeviri Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$), $q$Yarın hava güzel olursa pikniğe gideceğiz.

Which one is the correct English translation of the sentence above?$q$, array[$o$If the weather will be nice tomorrow, we go on a picnic.$o$, $o$If the weather were nice tomorrow, we will go on a picnic.$o$, $o$If the weather had been nice tomorrow, we would go on a picnic.$o$, $o$When the weather is nice tomorrow, we went on a picnic.$o$, $o$If the weather is nice tomorrow, we will go on a picnic.$o$], 4, $e$1. Gerçekçi gelecek koşulu: **If + Present Simple, will**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (2, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Ben gelene kadar bekle.

Which one is the correct English translation of the sentence above?$q$, array[$o$Wait until I come.$o$, $o$Wait until I will come.$o$, $o$Wait unless I come.$o$, $o$Wait while I will be coming.$o$, $o$Wait before I came.$o$], 0, $e$1. Zaman bağlacından sonra gelecek **Present Simple** ile verilir: **until I come**.

Diğer şıklar: **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (3, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$Bu kitabı okumuş olmalısın.

Which one is the correct English translation of the sentence above?$q$, array[$o$You must read this book.$o$, $o$You should read this book.$o$, $o$You can't have read this book.$o$, $o$You must have read this book.$o$, $o$You must be reading this book.$o$], 3, $e$1. Geçmişe dair güçlü çıkarım: **must have + V3**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (4, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$), $q$Keşke daha çok param olsaydı.

Which one is the correct English translation of the sentence above?$q$, array[$o$I wish I have more money.$o$, $o$I wish I had more money.$o$, $o$I wish I would have more money.$o$, $o$I wish I will have more money.$o$, $o$I wish I had had more money.$o$], 1, $e$1. Şimdiki gerçek dışı durum: **wish + Past Simple**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (5, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$Kapı kimse tarafından açılmadı.

Which one is the correct English translation of the sentence above?$q$, array[$o$The door did not open by anyone.$o$, $o$The door has not been opening by anyone.$o$, $o$Anyone did not open the door.$o$, $o$The door is not opening by someone.$o$, $o$The door was not opened by anyone.$o$], 4, $e$1. Edilgen Simple Past: **was not opened**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (6, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Sınavı geçemememe rağmen üzülmedim.

Which one is the correct English translation of the sentence above?$q$, array[$o$Although I couldn't pass the exam, I wasn't upset.$o$, $o$Despite I couldn't pass the exam, I wasn't upset.$o$, $o$Because I couldn't pass the exam, I wasn't upset.$o$, $o$I couldn't pass the exam, so I was upset.$o$, $o$Although I can't pass the exam, I haven't upset.$o$], 0, $e$1. **Although + cümle** karşıtlık kurar.

Diğer şıklar: **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (7, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$Telefon çaldığında duş alıyordum.

Which one is the correct English translation of the sentence above?$q$, array[$o$I took a shower when the phone was ringing.$o$, $o$I have taken a shower when the phone rang.$o$, $o$I was taking a shower when the phone rang.$o$, $o$I am taking a shower when the phone rings.$o$, $o$I had taken a shower while the phone rang.$o$], 2, $e$1. Devam eden eylem **was taking**, kesen olay **rang**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (8, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$Gelecek hafta İstanbul'a gidiyor olacağım.

Which one is the correct English translation of the sentence above?$q$, array[$o$I am going to Istanbul last week.$o$, $o$I will be going to Istanbul next week.$o$, $o$I will have gone to Istanbul next week.$o$, $o$I went to Istanbul next week.$o$, $o$I have been going to Istanbul next week.$o$], 1, $e$1. Gelecekte belirli bir anda sürecek eylem: **will be going**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (9, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$), $q$Ne kadar çok çalışırsan o kadar başarılı olursun.

Which one is the correct English translation of the sentence above?$q$, array[$o$The more hard you work, the successfuller you become.$o$, $o$The hardest you work, the most successful you become.$o$, $o$As hard you work, as successful you become.$o$, $o$Harder you work, more successful you are become.$o$, $o$The harder you work, the more successful you become.$o$], 4, $e$1. **The + comparative, the + comparative** kalıbı.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (10, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Toplantı bitmeden salondan ayrılma.

Which one is the correct English translation of the sentence above?$q$, array[$o$Don't leave the hall before the meeting will end.$o$, $o$Don't leave the hall until the meeting ended.$o$, $o$Don't leave the hall before the meeting ends.$o$, $o$Don't left the hall before the meeting ends.$o$, $o$Don't leave the hall after the meeting ends.$o$], 2, $e$1. Zaman bağlacından sonra Present Simple: **before the meeting ends**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (11, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$Ona doğruyu söylemeliydin.

Which one is the correct English translation of the sentence above?$q$, array[$o$You should tell him the truth.$o$, $o$You must have told him the truth.$o$, $o$You would tell him the truth.$o$, $o$You should have told him the truth.$o$, $o$You could have told him a lie.$o$], 3, $e$1. Geçmişte yapılmayan şey: **should have + V3**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (12, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$), $q$Bu, şimdiye kadar gördüğüm en güzel manzara.

Which one is the correct English translation of the sentence above?$q$, array[$o$This is the more beautiful view I have ever seen.$o$, $o$This is the most beautiful view I have ever seen.$o$, $o$This is the most beautiful view I had ever seen.$o$, $o$This is the beautifulest view I have ever seen.$o$, $o$This is most beautiful view I saw ever.$o$], 1, $e$1. **Superlative + Present Perfect**: **the most beautiful ... I have ever seen**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (13, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$), $q$Çocukken her yaz deniz kenarına giderdik.

Which one is the correct English translation of the sentence above?$q$, array[$o$We use to go to the seaside every summer when we were children.$o$, $o$We are used to going to the seaside every summer as children.$o$, $o$We used to go to the seaside every summer when we were children.$o$, $o$We would use to go to the seaside every summer in childhood.$o$, $o$We have gone to the seaside every summer when we were children.$o$], 2, $e$1. Geçmiş alışkanlık: **used to go**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (14, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$), $q$Nereye gittiğini bilmiyorum.

Which one is the correct English translation of the sentence above?$q$, array[$o$I don't know where did he go.$o$, $o$I don't know where he goes to.$o$, $o$I didn't know where he has gone.$o$, $o$I don't know where he went.$o$, $o$I don't know where he going.$o$], 3, $e$1. Dolaylı soruda düz cümle sırası: **where he went**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (15, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$), $q$O kadar yorgundu ki yemek yemeden uyudu.

Which one is the correct English translation of the sentence above?$q$, array[$o$He was so tired that he fell asleep without eating.$o$, $o$He was too tired that he fell asleep without eating.$o$, $o$He was such tired that he fell asleep without eating.$o$, $o$He was so tired to fall asleep without eating.$o$, $o$He was tired enough that he fell asleep without eat.$o$], 0, $e$1. **So + sıfat + that** sonuç bildirir.

Diğer şıklar: **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (16, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$), $q$Yeni bir ev almayı planlıyoruz.

Which one is the correct English translation of the sentence above?$q$, array[$o$We are planning buying a new house.$o$, $o$We plan to buying a new house.$o$, $o$We are plan to buy a new house.$o$, $o$We planned buy a new house.$o$, $o$We are planning to buy a new house.$o$], 4, $e$1. **Plan + to-infinitive** kalıbı.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 1),
  (17, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$), $q$Seni tanısaydım yardım ederdim.

Which one is the correct English translation of the sentence above?$q$, array[$o$If I knew you, I would have helped.$o$, $o$If I had known you, I would have helped.$o$, $o$If I had known you, I will help.$o$, $o$If I have known you, I would help.$o$, $o$If I would know you, I had helped.$o$], 1, $e$1. Geçmişteki gerçek dışı durum: **If + Past Perfect, would have + V3**.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 3),
  (18, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$), $q$Sınavda kopya çekmesi yüzünden okuldan atıldı.

Which one is the correct English translation of the sentence above?$q$, array[$o$He was expelled from school because of cheating in the exam.$o$, $o$He expelled from school because of cheating in the exam.$o$, $o$He was expelling from school because he cheated in the exam.$o$, $o$He had expelled the school because he cheated in exam.$o$, $o$He was expelled the school although he cheated in the exam.$o$], 0, $e$1. Edilgen yapı: **was expelled**.

Diğer şıklar: **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (19, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$), $q$Yağmur yağmasına rağmen maç oynandı.

Which one is the correct English translation of the sentence above?$q$, array[$o$The match was played because of the rain.$o$, $o$The match played in spite of rain.$o$, $o$The match was playing in spite the rain.$o$, $o$The match was played in spite of the rain.$o$, $o$The match has played in spite of the rain.$o$], 3, $e$1. **In spite of + isim** karşıtlık kurar.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **C** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2),
  (20, 'ydt-dil', (select t.id from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$), $q$Bu işi yarına kadar bitirmem gerekiyor.

Which one is the correct English translation of the sentence above?$q$, array[$o$I have finish this job until tomorrow.$o$, $o$I must to finish this job by tomorrow.$o$, $o$I have to finish this job by tomorrow.$o$, $o$I have to finishing this job by tomorrow.$o$, $o$I should finished this job until tomorrow.$o$], 2, $e$1. **Have to + V1** zorunluluğu, **by tomorrow** son tarihi bildirir.

Diğer şıklar: **A** çeviri anlamı ya da dil bilgisi yanlıştır / **B** çeviri anlamı ya da dil bilgisi yanlıştır / **D** çeviri anlamı ya da dil bilgisi yanlıştır / **E** çeviri anlamı ya da dil bilgisi yanlıştır.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Anlam Bütünlüğünü Bozan Cümle Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Anlam Bütünlüğünü Bozan Cümle Testi 1$t$, 25, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Anlam Bütünlüğünü Bozan Cümle Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$(I) Sleep is essential for good health. (II) During sleep, the body repairs tissues and strengthens the immune system. (III) The first computers were as large as an entire room. (IV) Lack of sleep, on the other hand, can reduce concentration and memory. (V) For this reason, experts recommend seven to nine hours of sleep each night for adults.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 2, $e$1. Parça uykunun sağlığa etkisini anlatır. Bilgisayarların boyutu konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$(I) Many tourists enjoy shopping in the old bazaar. (II) A volcano is an opening in the Earth's crust through which hot gases and melted rock escape. (III) When pressure builds up underground, it can cause a violent eruption. (IV) Some eruptions are so powerful that they change the climate for years. (V) Scientists therefore monitor active volcanoes carefully to protect nearby communities.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 0, $e$1. Parça yanardağları anlatır. Çarşıda alışveriş yapan turistler konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$(I) Electric cars are becoming more popular in many countries. (II) They produce no exhaust gases, so they help to keep city air clean. (III) Their running costs are also lower than those of petrol cars. (IV) However, the limited number of charging stations remains a problem for drivers. (V) Pizza is one of the most popular foods among young people.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 4, $e$1. Parça elektrikli arabaları anlatır. Pizza ile ilgili cümle konudan sapar.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$(I) Libraries have been centres of learning for thousands of years. (II) Many people prefer to travel by train in winter. (III) The Library of Alexandria, for example, collected scrolls from across the ancient world. (IV) Today, libraries also offer digital resources and free internet access. (V) As a result, they continue to serve people of all ages.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 1, $e$1. Parça kütüphanelerin işlevini anlatır. Kışın tren yolculuğu tercihi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$(I) Urban gardens are small green areas created inside crowded cities. (II) They provide fresh vegetables for local families. (III) Working in a garden also helps people relax after a busy day. (IV) The Pacific Ocean is the deepest ocean on Earth. (V) Many city councils therefore support such projects with land and funding.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 3, $e$1. Parça kent bahçelerini anlatır. Pasifik Okyanusu cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$(I) Children can learn a second language more easily than adults. (II) Their brains are flexible and absorb new sounds quickly. (III) Chocolate was first made from the seeds of the cacao tree. (IV) They also feel less afraid of making mistakes while speaking. (V) Therefore, many schools start foreign language lessons at a very early age.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 2, $e$1. Parça çocukların dil öğrenmesini anlatır. Çikolatanın yapıldığı bitki konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$(I) Honey is one of the oldest foods known to humans. (II) Ancient Egyptians used it both as food and as medicine. (III) It can be stored for many years without going bad. (IV) Scientists explain this by its low water content and natural acidity. (V) The tallest building in the city is more than three hundred metres high.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 4, $e$1. Parça balı anlatır. En yüksek bina cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$(I) The football season will start in the first week of September. (II) Many students feel anxious before an important exam. (III) A good study plan can reduce this anxiety considerably. (IV) Getting enough sleep and eating well on the exam day also helps. (V) Parents can support their children by staying calm and encouraging.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 0, $e$1. Parça sınav kaygısını anlatır. Futbol sezonu cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 1),
  (9, 'ydt-dil', null::integer, $q$(I) The Silk Road was a network of trade routes between East and West. (II) Merchants carried silk, spices and precious stones along it. (III) Along the way, they also exchanged ideas, religions and technologies. (IV) Most modern phones have cameras with high resolution sensors. (V) Many cities on the route became rich and famous thanks to this trade.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 3, $e$1. Parça İpek Yolu'nu anlatır. Telefon kameraları cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$(I) Recycling helps us protect natural resources. (II) Snow usually covers the mountains from December to March. (III) Used paper, glass and metal can be turned into new products. (IV) This reduces the amount of waste sent to landfills. (V) It also saves energy that would be used to produce new materials.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 1, $e$1. Parça geri dönüşümü anlatır. Dağlardaki kar cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 1),
  (11, 'ydt-dil', null::integer, $q$(I) Dolphins communicate with each other by making clicking sounds. (II) Marie Curie was one of the greatest scientists of the twentieth century. (III) She discovered two new elements, polonium and radium. (IV) She was also the first person to win Nobel Prizes in two different sciences. (V) Her work laid the foundation for modern cancer treatment.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 0, $e$1. Parça Marie Curie'yi anlatır. Yunusların iletişimi cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$(I) Public transport reduces traffic jams in big cities. (II) A single bus can carry as many passengers as forty cars. (III) Giraffes eat leaves from the tops of tall trees. (IV) It also cuts air pollution because fewer private vehicles are on the road. (V) That is why many cities invest in modern metro and tram systems.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 2, $e$1. Parça toplu taşımayı anlatır. Zürafaların beslenmesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$(I) Reading regularly improves vocabulary and imagination. (II) It also helps people concentrate for longer periods. (III) Readers often learn about other cultures without leaving home. (IV) Setting aside twenty minutes a day is enough to build the habit. (V) The Danube River flows through ten European countries.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 4, $e$1. Parça okuma alışkanlığını anlatır. Tuna Nehri cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$(I) Knowing basic first aid can save lives in emergencies. (II) The film festival will begin in Antalya next month. (III) For example, pressing firmly on a wound helps to stop heavy bleeding. (IV) Cooling a burn under running water reduces the pain and damage. (V) Many schools therefore include first aid lessons in their programmes.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 1, $e$1. Parça ilk yardımı anlatır. Film festivali cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$(I) The first Olympic Games were held in ancient Greece. (II) Athletes competed in running, wrestling and chariot racing. (III) The winners received a crown made of olive leaves. (IV) The inventor of the telephone was born in Scotland. (V) The games were held every four years in honour of Zeus.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 3, $e$1. Parça eski Olimpiyatları anlatır. Telefonun mucidi cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$(I) Honey bees live in organised colonies. (II) Volunteering means working for others without being paid. (III) It allows people to develop new skills and make new friends. (IV) Many volunteers say that helping others gives them a sense of purpose. (V) Communities benefit greatly from this free support.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 0, $e$1. Parça gönüllülüğü anlatır. Bal arıları cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$(I) Tourism brings money to many small towns. (II) Hotels, restaurants and shops create thousands of new jobs. (III) Oxygen makes up about twenty-one percent of the air. (IV) However, too many visitors can damage fragile natural areas. (V) Local governments must therefore plan tourism carefully.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 2, $e$1. Parça turizmin etkilerini anlatır. Havadaki oksijen oranı konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$(I) Social media has changed the way people get news. (II) Stories now spread around the world within minutes. (III) However, not all of them are true. (IV) Readers should check the source before sharing any information. (V) My uncle has been collecting old coins since childhood.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 4, $e$1. Parça sosyal medyada haberi anlatır. Amcanın para koleksiyonu konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir.$e$, 1),
  (19, 'ydt-dil', null::integer, $q$(I) Mimar Sinan is considered the greatest architect of the Ottoman Empire. (II) Basketball was invented in the United States in 1891. (III) He designed hundreds of mosques, schools and bridges during his long career. (IV) His most famous works include the Süleymaniye and the Selimiye mosques. (V) His buildings are admired today for their balance and engineering skill.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 1, $e$1. Parça Mimar Sinan'ı anlatır. Basketbolun icadı cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **D** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$(I) Drinking enough water is important for the human body. (II) Water helps to carry nutrients to the cells. (III) It also keeps our body temperature under control. (IV) The Eiffel Tower was completed in 1889 for the World Fair. (V) Experts advise adults to drink about two litres of water a day.

Which one of the numbered sentences disrupts the flow of the passage?$q$, array[$o$I$o$, $o$II$o$, $o$III$o$, $o$IV$o$, $o$V$o$], 3, $e$1. Parça su içmenin önemini anlatır. Eyfel Kulesi cümlesi konuyla ilgisizdir.
2. Diğer cümleler parçanın ana fikrini sırayla geliştirir.

Diğer şıklar: **A** konuyla uyumlu bir cümledir / **B** konuyla uyumlu bir cümledir / **C** konuyla uyumlu bir cümledir / **E** konuyla uyumlu bir cümledir.$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | deneme | - | YDT Okuma Testi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'YDT', 'deneme', null, $t$YDT Okuma Testi 1$t$, 40, true
  where not exists (select 1 from public.question_sets x where x.exam = 'YDT' and x.kind = 'deneme' and x.title = $t$YDT Okuma Testi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$In recent years, beekeeping has moved from the countryside to the rooftops of big cities. In London, Paris and Istanbul, small hives now sit on the roofs of offices, hotels and even museums. Surprisingly, city bees often produce more honey than their rural relatives. Cities have parks, gardens and tree-lined streets that bloom at different times of the year, so the bees can find flowers for longer. Moreover, farms in the countryside usually grow only one type of crop and use strong chemicals, which can harm the insects. However, urban beekeepers warn that the trend has limits. If too many hives are placed in a small area, wild bees may not find enough food. For this reason, experts recommend that city councils plan the number of hives carefully.

Which one best summarises the passage?$q$, array[$o$Honey is more expensive in big cities than in villages.$o$, $o$Urban beekeeping has benefits but needs careful planning.$o$, $o$Farmers in the countryside should stop using chemicals.$o$, $o$Beekeeping started in London and spread to other places.$o$, $o$Bees choose the flowers they visit according to colour.$o$], 1, $e$1. Parça kentte arıcılığın avantajlarını ve sınırlarını anlatır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (2, 'ydt-dil', null::integer, $q$In recent years, beekeeping has moved from the countryside to the rooftops of big cities. In London, Paris and Istanbul, small hives now sit on the roofs of offices, hotels and even museums. Surprisingly, city bees often produce more honey than their rural relatives. Cities have parks, gardens and tree-lined streets that bloom at different times of the year, so the bees can find flowers for longer. Moreover, farms in the countryside usually grow only one type of crop and use strong chemicals, which can harm the insects. However, urban beekeepers warn that the trend has limits. If too many hives are placed in a small area, wild bees may not find enough food. For this reason, experts recommend that city councils plan the number of hives carefully.

According to the passage, city bees can produce more honey because ----.$q$, array[$o$flowers in cities bloom at different times of the year$o$, $o$city councils feed them during the long winter$o$, $o$hives on roofs are much larger than farm hives$o$, $o$there are no wild bees in urban areas at all$o$, $o$farmers protect them from the strong chemicals$o$], 0, $e$1. Parkların ve bahçelerin farklı zamanlarda çiçek açması arılara uzun süre çiçek bulma imkânı verir.

Diğer şıklar: **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$In recent years, beekeeping has moved from the countryside to the rooftops of big cities. In London, Paris and Istanbul, small hives now sit on the roofs of offices, hotels and even museums. Surprisingly, city bees often produce more honey than their rural relatives. Cities have parks, gardens and tree-lined streets that bloom at different times of the year, so the bees can find flowers for longer. Moreover, farms in the countryside usually grow only one type of crop and use strong chemicals, which can harm the insects. However, urban beekeepers warn that the trend has limits. If too many hives are placed in a small area, wild bees may not find enough food. For this reason, experts recommend that city councils plan the number of hives carefully.

It can be understood from the passage that ----.$q$, array[$o$wild bees are more productive than city bees$o$, $o$beekeeping is forbidden in most big cities$o$, $o$honey from the city is always healthier than farm honey$o$, $o$too many hives in one area could harm wild bee populations$o$, $o$farms are the best place for keeping bees$o$], 3, $e$1. Çok fazla kovan yabani arıların yiyecek bulmasını zorlaştırabilir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 3),
  (4, 'ydt-dil', null::integer, $q$In recent years, beekeeping has moved from the countryside to the rooftops of big cities. In London, Paris and Istanbul, small hives now sit on the roofs of offices, hotels and even museums. Surprisingly, city bees often produce more honey than their rural relatives. Cities have parks, gardens and tree-lined streets that bloom at different times of the year, so the bees can find flowers for longer. Moreover, farms in the countryside usually grow only one type of crop and use strong chemicals, which can harm the insects. However, urban beekeepers warn that the trend has limits. If too many hives are placed in a small area, wild bees may not find enough food. For this reason, experts recommend that city councils plan the number of hives carefully.

The word "trend" in the passage is closest in meaning to ----.$q$, array[$o$a sudden danger$o$, $o$a legal rule$o$, $o$a hidden secret$o$, $o$an old custom$o$, $o$a growing practice$o$], 4, $e$1. **Trend** gelişen ve yaygınlaşan bir uygulama anlamındadır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Many teenagers struggle to wake up early for school, and scientists say this is not simply laziness. During adolescence, the body's internal clock shifts, so teenagers naturally feel sleepy later at night and want to wake up later in the morning. When classes begin very early, they often get less sleep than they need, which affects concentration, mood and even physical health. Some schools in the United States and Europe have therefore delayed their starting times by an hour. The results were encouraging: students were more alert, attendance improved, and test scores rose slightly. Critics, however, point out that a later start means a later finish, which can disturb sports practice and after-school jobs. They argue that other solutions, such as teaching healthy sleep habits, should also be considered.

What is the main idea of the passage?$q$, array[$o$Teenagers are lazy because they play games all night.$o$, $o$Schools in Europe are better than those in the United States.$o$, $o$Later school start times may help teenagers but cause problems.$o$, $o$Sports practice should be organised only in the mornings.$o$, $o$Healthy sleep habits cannot be taught to young students.$o$], 2, $e$1. Parça geç başlayan okulun gençlere faydalarını ve sorunlarını anlatır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Many teenagers struggle to wake up early for school, and scientists say this is not simply laziness. During adolescence, the body's internal clock shifts, so teenagers naturally feel sleepy later at night and want to wake up later in the morning. When classes begin very early, they often get less sleep than they need, which affects concentration, mood and even physical health. Some schools in the United States and Europe have therefore delayed their starting times by an hour. The results were encouraging: students were more alert, attendance improved, and test scores rose slightly. Critics, however, point out that a later start means a later finish, which can disturb sports practice and after-school jobs. They argue that other solutions, such as teaching healthy sleep habits, should also be considered.

Which of the following is NOT mentioned as a result of delaying school start times?$q$, array[$o$Students were more alert in class.$o$, $o$Attendance at school improved.$o$, $o$Test scores rose slightly.$o$, $o$Students joined more sports clubs.$o$, $o$Students felt less sleepy during lessons.$o$], 3, $e$1. Spor kulüplerine katılımın arttığı parçada geçmez, aksine spor antrenmanının aksayabileceği söylenir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Many teenagers struggle to wake up early for school, and scientists say this is not simply laziness. During adolescence, the body's internal clock shifts, so teenagers naturally feel sleepy later at night and want to wake up later in the morning. When classes begin very early, they often get less sleep than they need, which affects concentration, mood and even physical health. Some schools in the United States and Europe have therefore delayed their starting times by an hour. The results were encouraging: students were more alert, attendance improved, and test scores rose slightly. Critics, however, point out that a later start means a later finish, which can disturb sports practice and after-school jobs. They argue that other solutions, such as teaching healthy sleep habits, should also be considered.

The writer suggests that the critics of later starting times ----.$q$, array[$o$want classes to start even earlier than before$o$, $o$believe that teaching healthy sleep habits could also help$o$, $o$think that teenagers do not need any sleep$o$, $o$prefer to cancel all sports activities after school$o$, $o$agree that test scores have fallen sharply$o$], 1, $e$1. Eleştirmenler uyku alışkanlıklarının öğretilmesi gibi başka çözümleri de önerir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 3),
  (8, 'ydt-dil', null::integer, $q$Many teenagers struggle to wake up early for school, and scientists say this is not simply laziness. During adolescence, the body's internal clock shifts, so teenagers naturally feel sleepy later at night and want to wake up later in the morning. When classes begin very early, they often get less sleep than they need, which affects concentration, mood and even physical health. Some schools in the United States and Europe have therefore delayed their starting times by an hour. The results were encouraging: students were more alert, attendance improved, and test scores rose slightly. Critics, however, point out that a later start means a later finish, which can disturb sports practice and after-school jobs. They argue that other solutions, such as teaching healthy sleep habits, should also be considered.

The word "they" in the last sentence refers to ----.$q$, array[$o$teenagers$o$, $o$schools$o$, $o$scientists$o$, $o$students$o$, $o$critics$o$], 4, $e$1. Son cümlede **They argue ...** ifadesi eleştirmenleri gösterir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (9, 'ydt-dil', null::integer, $q$According to legend, tea was discovered in China about five thousand years ago, when leaves from a wild tree fell into the emperor's boiling water. At first it was used as a medicine, but over time it became a daily drink. By the ninth century, tea had reached Japan, where it became part of an elegant ceremony. European traders brought it to their countries in the seventeenth century, and soon it was so popular that governments began to tax it heavily. These taxes led to smuggling, and in 1773 anger over a tea tax in America ended with colonists throwing crates of tea into Boston Harbour. Today, tea is the most widely consumed drink in the world after water.

The writer's main aim is to ----.$q$, array[$o$explain how to prepare the perfect cup of tea$o$, $o$criticise governments that tax popular drinks$o$, $o$describe how tea spread and became important over time$o$, $o$compare tea with coffee in different countries$o$, $o$prove that the legend about the emperor is true$o$], 2, $e$1. Parça çayın keşfinden bugüne yayılışını anlatır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$According to legend, tea was discovered in China about five thousand years ago, when leaves from a wild tree fell into the emperor's boiling water. At first it was used as a medicine, but over time it became a daily drink. By the ninth century, tea had reached Japan, where it became part of an elegant ceremony. European traders brought it to their countries in the seventeenth century, and soon it was so popular that governments began to tax it heavily. These taxes led to smuggling, and in 1773 anger over a tea tax in America ended with colonists throwing crates of tea into Boston Harbour. Today, tea is the most widely consumed drink in the world after water.

According to the passage, tea was first used as ----.$q$, array[$o$a medicine$o$, $o$a decoration$o$, $o$a gift$o$, $o$a ceremony$o$, $o$a punishment$o$], 0, $e$1. Parçada çayın önce ilaç olarak kullanıldığı belirtilir.

Diğer şıklar: **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (11, 'ydt-dil', null::integer, $q$According to legend, tea was discovered in China about five thousand years ago, when leaves from a wild tree fell into the emperor's boiling water. At first it was used as a medicine, but over time it became a daily drink. By the ninth century, tea had reached Japan, where it became part of an elegant ceremony. European traders brought it to their countries in the seventeenth century, and soon it was so popular that governments began to tax it heavily. These taxes led to smuggling, and in 1773 anger over a tea tax in America ended with colonists throwing crates of tea into Boston Harbour. Today, tea is the most widely consumed drink in the world after water.

It can be inferred from the passage that high taxes on tea ----.$q$, array[$o$made tea much more popular in Japan$o$, $o$encouraged some people to buy it illegally$o$, $o$stopped European traders from selling it$o$, $o$were welcomed by the American colonists$o$, $o$reduced the price of tea in Boston$o$], 1, $e$1. Vergiler kaçakçılığa yol açmıştır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$According to legend, tea was discovered in China about five thousand years ago, when leaves from a wild tree fell into the emperor's boiling water. At first it was used as a medicine, but over time it became a daily drink. By the ninth century, tea had reached Japan, where it became part of an elegant ceremony. European traders brought it to their countries in the seventeenth century, and soon it was so popular that governments began to tax it heavily. These taxes led to smuggling, and in 1773 anger over a tea tax in America ended with colonists throwing crates of tea into Boston Harbour. Today, tea is the most widely consumed drink in the world after water.

The word "widely" in the last sentence is closest in meaning to ----.$q$, array[$o$rarely$o$, $o$secretly$o$, $o$slowly$o$, $o$commonly$o$, $o$hardly$o$], 3, $e$1. **Widely** yaygın biçimde anlamına gelir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (13, 'ydt-dil', null::integer, $q$Many people say that smartphones have damaged our memory because we no longer need to remember phone numbers, directions or dates. A recent study, however, suggests that the situation is more complicated. Researchers asked two groups to remember a list of facts. One group was told that the facts would be saved on a computer, and the other was told that they would be deleted. The first group remembered fewer facts, but they were better at remembering where the information was stored. The scientists concluded that people do not stop using their memory. They simply change what they store. In the digital age, knowing how to find information may be as important as knowing the information itself.

What does the passage argue?$q$, array[$o$Smartphones may change what we remember, not destroy it.$o$, $o$People should stop using their smartphones entirely now.$o$, $o$Computers can never save any facts in the right way.$o$, $o$Memory problems appear only among very young people.$o$, $o$Remembering phone numbers is the best brain exercise.$o$], 0, $e$1. Parça hafızanın yok olmadığını, depolanan bilginin değiştiğini söyler.

Diğer şıklar: **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Many people say that smartphones have damaged our memory because we no longer need to remember phone numbers, directions or dates. A recent study, however, suggests that the situation is more complicated. Researchers asked two groups to remember a list of facts. One group was told that the facts would be saved on a computer, and the other was told that they would be deleted. The first group remembered fewer facts, but they were better at remembering where the information was stored. The scientists concluded that people do not stop using their memory. They simply change what they store. In the digital age, knowing how to find information may be as important as knowing the information itself.

In the study, the group told that the facts would be saved ----.$q$, array[$o$remembered all the facts without any mistakes$o$, $o$forgot both the facts and their locations$o$, $o$refused to take part in the experiment$o$, $o$remembered the facts better than the other group$o$, $o$remembered fewer facts but knew where they were kept$o$], 4, $e$1. Birinci grup daha az bilgi hatırlamış ama nerede saklandığını daha iyi bilmiştir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Many people say that smartphones have damaged our memory because we no longer need to remember phone numbers, directions or dates. A recent study, however, suggests that the situation is more complicated. Researchers asked two groups to remember a list of facts. One group was told that the facts would be saved on a computer, and the other was told that they would be deleted. The first group remembered fewer facts, but they were better at remembering where the information was stored. The scientists concluded that people do not stop using their memory. They simply change what they store. In the digital age, knowing how to find information may be as important as knowing the information itself.

The writer would most probably agree that ----.$q$, array[$o$people no longer need to learn anything new$o$, $o$phones have completely destroyed our thinking skills$o$, $o$the ability to find information is valuable today$o$, $o$memory is more useful than searching for facts$o$, $o$scientists should avoid studying human memory$o$], 2, $e$1. Son cümle bilgiyi bulmayı bilmenin önemini vurgular.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Many people say that smartphones have damaged our memory because we no longer need to remember phone numbers, directions or dates. A recent study, however, suggests that the situation is more complicated. Researchers asked two groups to remember a list of facts. One group was told that the facts would be saved on a computer, and the other was told that they would be deleted. The first group remembered fewer facts, but they were better at remembering where the information was stored. The scientists concluded that people do not stop using their memory. They simply change what they store. In the digital age, knowing how to find information may be as important as knowing the information itself.

The word "complicated" is closest in meaning to ----.$q$, array[$o$complex$o$, $o$simple$o$, $o$dangerous$o$, $o$obvious$o$, $o$amusing$o$], 0, $e$1. **Complicated** karmaşık anlamındadır.

Diğer şıklar: **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (17, 'ydt-dil', null::integer, $q$When Ayşe started running at the age of fifty, she could hardly complete one kilometre without stopping. Her doctor had advised her to exercise after she was diagnosed with high blood pressure, and a neighbour suggested joining a local running group. At first, she felt embarrassed because everyone seemed faster and younger than her. Gradually, however, the encouragement of her group helped her to continue. Two years later, she finished her first half marathon, and last spring she completed a full marathon in just under five hours. She says the medals matter less to her than the friendships she has made and the energy she now feels every morning.

What is the passage mainly about?$q$, array[$o$Why marathons are too difficult for older people$o$, $o$How doctors treat high blood pressure with medicine$o$, $o$The history of running groups in small towns$o$, $o$How running changed a woman's life after she started at fifty$o$, $o$A neighbour who wanted to win many medals$o$], 3, $e$1. Parça Ayşe'nin geç yaşta koşuyla hayatının değişmesini anlatır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$When Ayşe started running at the age of fifty, she could hardly complete one kilometre without stopping. Her doctor had advised her to exercise after she was diagnosed with high blood pressure, and a neighbour suggested joining a local running group. At first, she felt embarrassed because everyone seemed faster and younger than her. Gradually, however, the encouragement of her group helped her to continue. Two years later, she finished her first half marathon, and last spring she completed a full marathon in just under five hours. She says the medals matter less to her than the friendships she has made and the energy she now feels every morning.

Why did Ayşe begin to exercise?$q$, array[$o$She wanted to win a medal at a marathon.$o$, $o$Her neighbour offered her a job in a gym.$o$, $o$She was tired of walking to work every day.$o$, $o$Her friends had asked her to run with them.$o$, $o$Her doctor advised it for her blood pressure.$o$], 4, $e$1. Doktoru yüksek tansiyonu nedeniyle spor önermiştir.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur.$e$, 1),
  (19, 'ydt-dil', null::integer, $q$When Ayşe started running at the age of fifty, she could hardly complete one kilometre without stopping. Her doctor had advised her to exercise after she was diagnosed with high blood pressure, and a neighbour suggested joining a local running group. At first, she felt embarrassed because everyone seemed faster and younger than her. Gradually, however, the encouragement of her group helped her to continue. Two years later, she finished her first half marathon, and last spring she completed a full marathon in just under five hours. She says the medals matter less to her than the friendships she has made and the energy she now feels every morning.

It can be inferred that Ayşe now values ----.$q$, array[$o$speed more than any other quality$o$, $o$medals more than her new friends$o$, $o$friendship and good health more than prizes$o$, $o$the opinions of faster runners$o$, $o$her doctor's advice less than before$o$], 2, $e$1. Madalyaların arkadaşlıklardan ve enerjiden daha az önemli olduğunu söyler.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **B** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$When Ayşe started running at the age of fifty, she could hardly complete one kilometre without stopping. Her doctor had advised her to exercise after she was diagnosed with high blood pressure, and a neighbour suggested joining a local running group. At first, she felt embarrassed because everyone seemed faster and younger than her. Gradually, however, the encouragement of her group helped her to continue. Two years later, she finished her first half marathon, and last spring she completed a full marathon in just under five hours. She says the medals matter less to her than the friendships she has made and the energy she now feels every morning.

The word "embarrassed" is closest in meaning to ----.$q$, array[$o$delighted$o$, $o$awkward$o$, $o$exhausted$o$, $o$furious$o$, $o$curious$o$], 1, $e$1. **Embarrassed** utanmış, mahcup anlamındadır.

Diğer şıklar: **A** parçayla uyuşmaz ya da parçada yoktur / **C** parçayla uyuşmaz ya da parçada yoktur / **D** parçayla uyuşmaz ya da parçada yoktur / **E** parçayla uyuşmaz ya da parçada yoktur.$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

