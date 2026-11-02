-- 20261026145000_questions_ydt_gramer_5. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Adjectives konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adjectives konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$She is very ---- of spiders, but she is quite ---- in snakes.$q$, array[$o$afraid / interested$o$, $o$afraid in / interested$o$, $o$afraid / interested of$o$, $o$fond / afraid$o$, $o$keen / responsible$o$], 0, $e$1. **Afraid of** kalıbı kullanılır: **afraid**.
2. **Interested in** kalıbı kullanılır: **interested**.

Diğer şıklar: **B** of ile kullanılır / **C** in ile kullanılır / **D** anlam ve edat uyumsuz ve sonrasında in ile kullanılmaz / **E** of ile uyumsuz ve in ile uyumsuz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He bought a ---- leather jacket, and she wore a ---- silk scarf.$q$, array[$o$brown beautiful / lovely red$o$, $o$beautiful brown / red lovely$o$, $o$leather beautiful / silk lovely$o$, $o$brown leather / lovely silk$o$, $o$beautiful brown / lovely red$o$], 4, $e$1. Sıfat sırası: görüş, renk. **beautiful brown** doğrudur.
2. Aynı kurala göre: **lovely red**.

Diğer şıklar: **A** görüş sıfatı renkten önce gelir / **B** değer sıfatı renkten önce gelir / **C** madde sıfatı sonda gelir ve madde sıfatı sonda gelir / **D** jacket önünde sıfat sıralaması bozulur ve renk madde öncesi gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The test was ---- difficult for me, but my brother found it ----.$q$, array[$o$enough / easy$o$, $o$too / easily$o$, $o$so / ease$o$, $o$too / easy$o$, $o$very / easiest$o$], 3, $e$1. **Too** olumsuz sonuç anlamı verir: **too**.
2. **Find + nesne + sıfat** kalıbı sıfat ister: **easy**.

Diğer şıklar: **A** sıfattan sonra gelir / **B** bulmak fiili sıfat ister / **C** sonuç cümlesi that ister ve isimdir / **E** for me ile sonuç ifadesi uyumsuz ve karşılaştırma yoktur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The ---- children were playing in the garden, and the ---- weather made everyone happy.$q$, array[$o$happily / sunny$o$, $o$happy / sunny$o$, $o$happy / sun$o$, $o$happiness / sunnily$o$, $o$happier / sunlight$o$], 1, $e$1. İsmi niteleyen **sıfat** gelir: **happy**.
2. Aynı kurala göre: **sunny**.

Diğer şıklar: **A** zarf sıfat işlevi görmez / **C** isim sıfat yerine geçmez / **D** isimdir ve zarf sıfat işlevi görmez / **E** karşılaştırma gerekmez ve isimdir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The soup tastes ----, and the flowers smell ----.$q$, array[$o$deliciously / lovely$o$, $o$delicious / lovingly$o$, $o$deliciousness / lovelily$o$, $o$delight / love$o$, $o$delicious / lovely$o$], 4, $e$1. Duyu fiillerinden sonra sıfat gelir: **delicious**.
2. Aynı kurala göre: **lovely**.

Diğer şıklar: **A** taste duyu fiili sıfat ister / **B** smell duyu fiili sıfat ister / **C** isimdir ve zarf biçimi yoktur / **D** isimdir ve isimdir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$It was a ---- journey, and we arrived completely ----.$q$, array[$o$six hours / exhausted$o$, $o$six-hour / exhausting$o$, $o$six-hour / exhausted$o$, $o$six-hours / exhaust$o$, $o$six hour / exhaustion$o$], 2, $e$1. Birleşik sıfatta isim tekil kalır: **six-hour**.
2. Hisseden kişi için **V-ed** sıfat gelir: **exhausted**.

Diğer şıklar: **A** compound sıfatta çoğul eki kullanılmaz / **B** hisseden kişi için V-ed gerekir / **D** compound sıfatta çoğul eki kullanılmaz ve sıfat olmaz / **E** tire gerekir ve isimdir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ---- are often forgotten in this society, and the ---- usually receive more attention.$q$, array[$o$elderly / young$o$, $o$elder / young$o$, $o$elderly / youth people$o$, $o$old people's / youngs$o$, $o$age / younger$o$], 0, $e$1. **The + sıfat** çoğul grubu anlatır: **the elderly**.
2. Aynı kurala göre: **the young**.

Diğer şıklar: **B** the ile çoğul grup için elderly gelir / **C** the + sıfat çoğul grubu anlatır / **D** anlam bozulur ve sıfat s eki almaz / **E** isimdir ve karşılaştırma gerekmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$She looked ---- when she heard the news, and she spoke very ---- for the rest of the evening.$q$, array[$o$surprising / quietly$o$, $o$surprised / quietly$o$, $o$surprised / quiet$o$, $o$surprise / quieter$o$, $o$surprisingly / quietness$o$], 1, $e$1. **Look** sonrası sıfat gelir: **surprised**.
2. **Speak** fiilini zarf niteler: **quietly**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **C** speak fiilini niteleyen zarf gerekir / **D** sıfat olmaz ve karşılaştırma gerekmez / **E** look sonrası sıfat gelir ve isimdir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'm not ---- with the results, and I'm ---- that we will have to repeat the test.$q$, array[$o$satisfying / afraid$o$, $o$satisfied / afraid of$o$, $o$satisfy / frightening$o$, $o$satisfied / afraid$o$, $o$satisfaction / fear$o$], 3, $e$1. **Satisfied with** kalıbı kullanılır: **satisfied**.
2. **I'm afraid that** kalıbı üzülerek bildirir: **afraid**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **B** that cümlesi öncesi afraid gelir / **C** sıfat olmaz ve anlam bozulur / **E** isimdir ve isimdir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$This room is ---- than the one upstairs, but it is not ---- as bright.$q$, array[$o$small / quite$o$, $o$smaller / so$o$, $o$smallest / very$o$, $o$the smaller / enough$o$, $o$smaller / quite$o$], 4, $e$1. **Than** ile karşılaştırma yapılır: **smaller**.
2. **Not quite as...as** kalıbı kullanılır: **quite**.

Diğer şıklar: **A** karşılaştırma için than ile -er gerekir / **B** not so as kalıbı bozulur / **C** than ile üstünlük kullanılmaz ve not very as kalıbı bozulur / **D** than ile the kullanılmaz ve as öncesinde bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Everyone was ---- to hear the news, and the children were ---- in the garden.$q$, array[$o$delighting / excited$o$, $o$delighted / exciting$o$, $o$delighted / excited$o$, $o$delight / excite$o$, $o$delightful / excitement$o$], 2, $e$1. Hisseden kişi için **V-ed** sıfat gelir: **delighted**.
2. Aynı kurala göre: **excited**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **B** hisseden kişi V-ed ister / **D** sıfat olmaz ve sıfat olmaz / **E** anlam yönü uymaz ve isimdir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The new manager is ---- for the budget, and he is ---- to resign if the figures are wrong.$q$, array[$o$responsible / likely$o$, $o$responsibility / likely$o$, $o$responsible / probable$o$, $o$respond / possible$o$, $o$responsive / certain$o$], 0, $e$1. **Responsible for** kalıbı kullanılır: **responsible**.
2. **Likely to** kalıbı kullanılır: **likely**.

Diğer şıklar: **B** isimdir / **C** likely to kalıbı gerekir / **D** fiildir ve to-infinitive ile kullanılmaz / **E** for ile uyumsuz ve anlam yönü uymaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$This bag is different ---- mine, but it is similar ---- the one I lost last year.$q$, array[$o$of / to$o$, $o$from / to$o$, $o$from / from$o$, $o$with / with$o$, $o$at / of$o$], 1, $e$1. **Different from** kalıbı kullanılır: **from**.
2. **Similar to** kalıbı kullanılır: **to**.

Diğer şıklar: **A** different of kullanılmaz / **C** similar to kalıbı kullanılır / **D** different with kullanılmaz ve similar with kullanılmaz / **E** different at kullanılmaz ve similar of kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The film was ---- long that many people left early, and the ending was ---- disappointing.$q$, array[$o$such / rather$o$, $o$so / quite so$o$, $o$too / enough$o$, $o$so / rather$o$, $o$very / so$o$], 3, $e$1. **So + sıfat + that** sonuç kalıbıdır: **so**.
2. **Rather** olumsuz anlamlı sıfatı pekiştirir: **rather**.

Diğer şıklar: **A** sıfat öncesinde so gelir / **B** anlam yönü uyumsuz / **C** that sonuç cümlesi so ister ve sıfattan sonra gelir / **E** that sonuç cümlesi so ister ve rather sıfatı niteler.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He is not ---- to carry the box on his own, and she isn't strong ---- either.$q$, array[$o$enough strong / enough$o$, $o$strong enough / too$o$, $o$so strong / as$o$, $o$very strong / so$o$, $o$strong enough / enough$o$], 4, $e$1. **Sıfat + enough** doğru sıradır: **strong enough**.
2. **Strong enough** burada kısaltılır: **enough**.

Diğer şıklar: **A** enough sıfattan sonra gelir / **B** sıfattan sonra enough gelir / **C** to ile sonuç kalıbı bozulur ve kalıp bozulur / **D** to ile sonuç kalıbı bozulur ve kalıp bozulur.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$There was a ---- old wooden table in the corner, and on it stood two ---- metal lamps.$q$, array[$o$old beautiful / small$o$, $o$beautiful / small two$o$, $o$beautiful / small$o$, $o$wooden beautiful / metal small$o$, $o$table beautiful / lamps small$o$], 2, $e$1. Değer sıfatı yaş ve madde sıfatından önce gelir: **beautiful**.
2. Boyut sıfatı madde sıfatından önce gelir: **small**.

Diğer şıklar: **A** değer sıfatı yaş ve maddeden önce gelir / **B** sayı sıfatı önce gelir / **D** madde sıfatı sondadır ve madde sıfatı isimden hemen önce gelir / **E** sıfat isimden önce gelir ve sıfat isimden önce gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I have ---- idea what you are talking about, and I'm ---- sure that you are making a mistake.$q$, array[$o$not / quite$o$, $o$no / quite$o$, $o$no / quiet$o$, $o$none / quit$o$, $o$any / quiete$o$], 1, $e$1. **No idea** kalıbı kullanılır: **no**.
2. **Quite sure** kalıbı kullanılır: **quite**.

Diğer şıklar: **A** no yerine not any gelir / **C** sessiz anlamı yoktur / **D** isimden önce no gelir ve fiildir / **E** olumsuz anlam gerekir ve yanlış yazım.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The ---- character of the novel is a man ---- name is never mentioned in the whole book.$q$, array[$o$central / whose$o$, $o$center / whose$o$, $o$central / which$o$, $o$centrally / who$o$, $o$centre / whom$o$], 0, $e$1. İsimden önce sıfat gelir: **central**.
2. Sahiplik **whose** ile verilir: **whose**.

Diğer şıklar: **B** sıfat olarak central gerekir / **C** sahiplik için whose gerekir / **D** zarftır ve sahiplik için whose gerekir / **E** isimdir ve sahiplik için whose gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Despite being ----, he refused to give up, and he finally won the ---- prize.$q$, array[$o$exhausting / coveted$o$, $o$exhausted / covetous$o$, $o$exhaust / covet$o$, $o$exhausted / coveted$o$, $o$exhaustion / covetted$o$], 3, $e$1. Hisseden kişi için **V-ed** sıfat gelir: **exhausted**.
2. **Coveted prize** özlenen ödül demektir: **coveted**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **B** anlamı uyumsuz / **C** sıfat olmaz ve fiildir / **E** isimdir ve yazımı yanlış.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It is ---- that the company will go bankrupt, but it is ---- for the staff to be prepared for the worst.$q$, array[$o$unlikable / essential$o$, $o$unlikely / essence$o$, $o$unlikely / essential$o$, $o$unlikeable / essentially$o$, $o$unlike / essentials$o$], 2, $e$1. **Unlikely that** kalıbı kullanılır: **unlikely**.
2. **Essential for ... to** kalıbı kullanılır: **essential**.

Diğer şıklar: **A** anlam yönü uymaz / **B** isimdir / **D** anlam yönü uymaz ve zarftır / **E** edattır ve isimdir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adjectives konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adjectives konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The children were ---- of the dark, and they seemed ---- to sleep without a light.$q$, array[$o$scared in / unwilling$o$, $o$afraid / willing$o$, $o$frightening / unwillingly$o$, $o$afraid / unwilling$o$, $o$afraid for / unwilling of$o$], 3, $e$1. **Afraid of** kalıbı kullanılır: **afraid**.
2. **Unwilling to** kalıbı kullanılır: **unwilling**.

Diğer şıklar: **A** of ile kullanılır / **B** seemed sonrası unwilling anlamı gerekir / **C** hisseden kişi V-ed ister ve zarf sıfat yerine geçmez / **E** anlam bozulur ve to ile kullanılır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$This is the ---- film I have ever seen, and the actors were ---- good.$q$, array[$o$baddest / extremely$o$, $o$worst / extreme$o$, $o$most bad / extremist$o$, $o$badder / more extreme$o$, $o$worst / extremely$o$], 4, $e$1. Düzensiz üstünlük **worst** olur: **worst**.
2. Sıfatı **extremely** zarfı niteler: **extremely**.

Diğer şıklar: **A** bad düzensiz sıfattır / **B** sıfatı niteleyen zarf gerekir / **C** bad düzensizdir ve isimdir / **D** bad düzensizdir ve anlam bozulur.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I am ---- in jazz, but my brother is ---- on classical music.$q$, array[$o$interesting / keen$o$, $o$interested / keen$o$, $o$interested / keen at$o$, $o$interest / keen for$o$, $o$interests / keen with$o$], 1, $e$1. **Interested in** kalıbı kullanılır: **interested**.
2. **Keen on** kalıbı kullanılır: **keen**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **C** on ile keen kullanılır / **D** fiil ya da isim ve on ile keen kullanılır / **E** çoğul isim ve on ile keen kullanılır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$He gave me a ---- smile, and then he said something very ----.$q$, array[$o$warmly / funny$o$, $o$warm / funnily$o$, $o$warm / funny$o$, $o$warmth / fun$o$, $o$warmed / funnier$o$], 2, $e$1. İsimden önce **sıfat** gelir: **warm**.
2. **Something** sonrasında sıfat gelir: **funny**.

Diğer şıklar: **A** zarf isimden önce gelmez / **B** something sonrası sıfat gelir / **D** isimdir ve isimdir / **E** fiildir ve karşılaştırma yoktur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$She is ---- than her sister, but she isn't ---- as her mother.$q$, array[$o$tallest / as tall$o$, $o$taller / so tall as$o$, $o$more tall / tall as$o$, $o$taller / as tall$o$, $o$the taller / taller as$o$], 3, $e$1. **Than** ile karşılaştırma yapılır: **taller**.
2. **Not as tall as** kalıbı kullanılır: **as tall**.

Diğer şıklar: **A** than ile üstünlük kullanılmaz / **B** so as olumsuzda kullanılır, şık eşleşmesi bozulur / **C** tall tek heceli sıfattır ve as öncesinde as gerekir / **E** than ile the kullanılmaz ve as ile eşitlik kullanılır.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The ---- man was lying on the road, and the ---- baby was sleeping in the cot.$q$, array[$o$injured / sleeping$o$, $o$injuring / sleeping$o$, $o$injured / asleep$o$, $o$injure / slept$o$, $o$injury / sleepy$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **injured**.
2. İsimden önce **sleeping** kullanılır: **sleeping**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** isimden önce asleep kullanılmaz / **D** sıfat olmaz ve sıfat olarak kullanılmaz / **E** isimdir ve anlam farklıdır.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The patient is ---- and needs rest, and the doctor is ---- about his condition.$q$, array[$o$weakly / concerned$o$, $o$weak / concerning$o$, $o$weaken / concern$o$, $o$weakness / concerns$o$, $o$weak / concerned$o$], 4, $e$1. **Be** sonrası sıfat gelir: **weak**.
2. Hisseden kişi için **V-ed** gelir: **concerned**.

Diğer şıklar: **A** be sonrası sıfat gelir / **B** hisseden kişi V-ed ister / **C** fiildir ve isim ya da fiil / **D** isimdir ve çoğul isim.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The older he got, the ---- he became, and the ---- he looked at every problem.$q$, array[$o$wisest / more calmly$o$, $o$wiser / calmer$o$, $o$wiser / more calmly$o$, $o$wise / more calm$o$, $o$more wise / calmly$o$], 2, $e$1. **The + karşılaştırma** yapısı kullanılır: **wiser**.
2. Fiili niteleyen zarfta **more calmly** kullanılır: **more calmly**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** look at fiilini zarf niteler / **D** the + karşılaştırma ister ve look at fiilini zarf niteler / **E** wise tek heceli, -er alır ve the + karşılaştırma gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'm ---- with my job, and I've been ---- for a change for some time.$q$, array[$o$fed up / looking$o$, $o$bored of / looking$o$, $o$fed up / looked$o$, $o$tired off / look$o$, $o$sick off / looks$o$], 0, $e$1. **Fed up with** kalıbı kullanılır: **fed up**.
2. Present Perfect Continuous için V-ing gerekir: **looking**.

Diğer şıklar: **B** fed up with yaygın kalıbıdır / **C** have been ile V-ing gelir / **D** off ile uyumsuz ve have been ile V-ing gelir / **E** off ile uyumsuz ve have been ile V-ing gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He is ---- of making a decision, and she is ---- to every kind of criticism.$q$, array[$o$uncapable / sensitive$o$, $o$incapable / sensitive$o$, $o$incapable / sensible$o$, $o$unable / sensitiveness$o$, $o$disabled / sensing$o$], 1, $e$1. **Incapable of** kalıbı kullanılır: **incapable**.
2. **Sensitive to** kalıbı kullanılır: **sensitive**.

Diğer şıklar: **A** yazım ve kalıp yanlış / **C** anlamı farklıdır / **D** of ile kullanılmaz ve isimdir / **E** anlam bozulur ve fiil biçimidir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$It was a ---- speech, and the audience listened ----.$q$, array[$o$moved / attentively$o$, $o$moving / attentive$o$, $o$move / attention$o$, $o$movement / attend$o$, $o$moving / attentively$o$], 4, $e$1. Duygu yaratan şey **V-ing** alır: **moving**.
2. Fiili **zarf** niteler: **attentively**.

Diğer şıklar: **A** nesne duygu yaratıyor, V-ing gerekir / **B** listened fiilini zarf niteler / **C** sıfat olmaz ve isimdir / **D** isimdir ve fiildir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She is the ---- of the three sisters, and she is ---- the most intelligent.$q$, array[$o$younger / by far$o$, $o$youngest / by farthest$o$, $o$youngest / by far$o$, $o$most young / far by$o$, $o$the younger / far much$o$], 2, $e$1. Üç kişi arasında üstünlük **youngest** ile söylenir: **youngest**.
2. **By far** üstünlüğü pekiştirir: **by far**.

Diğer şıklar: **A** üç kişi arasında üstünlük gerekir / **B** by far kalıbı / **D** young tek hecelidir ve sırası yanlış / **E** iki kişi için kullanılır ve sırası yanlış.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She is ---- a fast learner that she completed the course in half the time, and her teachers were ---- impressed.$q$, array[$o$so / deeply$o$, $o$such / deep$o$, $o$very / deepen$o$, $o$such / deeply$o$, $o$too / depth$o$], 3, $e$1. **Such a + sıfat + isim** kalıbı kullanılır: **such**.
2. Fiilden türeyen sıfatı **deeply** niteler: **deeply**.

Diğer şıklar: **A** a + sıfat + isim önünde such gelir / **B** impressed fiili zarfla nitelenir / **C** that sonuç cümlesi such ister ve fiildir / **E** that sonuç cümlesi such ister ve isimdir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The company's ---- decision to close the factory was ---- to the workers, who had not been warned.$q$, array[$o$sudden / shocking$o$, $o$suddenly / shocking$o$, $o$sudden / shocked$o$, $o$suddenness / shock$o$, $o$sudden of / shocks$o$], 0, $e$1. İsimden önce **sıfat** gelir: **sudden**.
2. Duygu yaratan şey **V-ing** alır: **shocking**.

Diğer şıklar: **B** zarf isimden önce gelmez / **C** nesne duygu yaratıyor, V-ing gerekir / **D** isimdir ve sıfat olmaz / **E** anlam bozulur ve çoğul isim.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Few things are more ---- than a child who is genuinely ---- about learning.$q$, array[$o$inspired / enthusiastic$o$, $o$inspiring / enthusiastic$o$, $o$inspiring / enthusiasm$o$, $o$inspire / enthused$o$, $o$inspiration / enthusiastically$o$], 1, $e$1. Duygu yaratan şey **V-ing** alır: **inspiring**.
2. **Enthusiastic about** kalıbı kullanılır: **enthusiastic**.

Diğer şıklar: **A** nesne duygu yaratıyor, V-ing gerekir / **C** isimdir / **D** sıfat olmaz ve nadir kullanım / **E** isimdir ve zarf be sonrası gelmez.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The ---- scenery of the lake made the walk worthwhile, and the ---- climate was perfect for farming.$q$, array[$o$stunned / mild$o$, $o$stunning / mildly$o$, $o$stun / mildness$o$, $o$stunt / milder$o$, $o$stunning / mild$o$], 4, $e$1. Duygu yaratan şey **V-ing** alır: **stunning**.
2. İsimden önce **sıfat** gelir: **mild**.

Diğer şıklar: **A** nesne duygu yaratıyor, V-ing gerekir / **B** zarf isimden önce gelmez / **C** sıfat olmaz ve isimdir / **D** anlam farklıdır ve karşılaştırma gerekmez.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$He is ---- to criticism and ---- of other people's feelings, which makes him a poor leader.$q$, array[$o$pervious / oblivious$o$, $o$impervious / obvious$o$, $o$impervious / oblivious$o$, $o$imperious / oblivion$o$, $o$impartial / obliging$o$], 2, $e$1. **Impervious to** kalıbı kullanılır: **impervious**.
2. **Oblivious of** kalıbı kullanılır: **oblivious**.

Diğer şıklar: **A** anlam yönü uyumsuz / **B** of ile kullanılmaz / **D** anlamı farklıdır ve isimdir / **E** to ile uyumsuz ve anlam bozulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The more ---- the weather became, the more ---- we were about the safety of the climbers.$q$, array[$o$hostility / anxious$o$, $o$hostile / anxiously$o$, $o$hostilely / anxiety$o$, $o$hostile / anxious$o$, $o$hostiles / anxieties$o$], 3, $e$1. **The more + sıfat** karşılaştırma yapısı kullanılır: **hostile**.
2. **Be anxious about** kalıbı kullanılır: **anxious**.

Diğer şıklar: **A** isimdir / **B** be sonrası sıfat gelir / **C** zarftır ve isimdir / **E** çoğul isimdir ve çoğul isim.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The weather was ---- yesterday, so we stayed indoors, and the film we watched was ----.$q$, array[$o$terrible / hilarious$o$, $o$terribly / hilarious$o$, $o$terrible / hilariously$o$, $o$terror / hilarity$o$, $o$terrified / hilarities$o$], 0, $e$1. **Be** sonrası sıfat gelir: **terrible**.
2. Aynı kurala göre: **hilarious**.

Diğer şıklar: **B** be sonrası sıfat gelir / **C** be sonrası sıfat gelir / **D** isimdir ve isimdir / **E** hisseden kişi V-ed ister ve çoğul isim.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$He is ---- good at maths, but he is ---- at spelling.$q$, array[$o$extreme / hopeless$o$, $o$extremely / hopeless$o$, $o$extremely / hopelessly$o$, $o$extremist / hope$o$, $o$more extreme / hopeful$o$], 1, $e$1. Sıfatı **zarf** niteler: **extremely**.
2. **Hopeless at** kalıbı kullanılır: **hopeless**.

Diğer şıklar: **A** good sıfatını zarf niteler / **C** be sonrası sıfat gelir / **D** isimdir ve isimdir / **E** anlam bozulur ve anlam yönü uymaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adjectives konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adjectives konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$This coffee is too ---- for me to drink, and the tea is not ---- enough either.$q$, array[$o$strongly / sweet$o$, $o$strong / sweetly$o$, $o$strength / sweetness$o$, $o$strong / sweet$o$, $o$stronger / sweetest$o$], 3, $e$1. **Too + sıfat** olumsuz sonuç verir: **strong**.
2. **Sıfat + enough** doğru sıradır: **sweet**.

Diğer şıklar: **A** be sonrası sıfat gelir / **B** sıfattan sonra enough gelir, zarf değil sıfat gerekir / **C** isimdir ve isimdir / **E** too ile karşılaştırma kullanılmaz ve enough ile üstünlük kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The ---- students wanted to leave, and the ---- teacher told them to wait.$q$, array[$o$boring / patient$o$, $o$bored / patiently$o$, $o$bored / patient$o$, $o$bore / patience$o$, $o$boredom / patients$o$], 2, $e$1. Hisseden kişi için **V-ed** gelir: **bored**.
2. İsimden önce **sıfat** gelir: **patient**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **B** isimden önce sıfat gelir / **D** sıfat olmaz ve isimdir / **E** isimdir ve çoğul isimdir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She felt ---- when she saw the results, and her parents were very ---- of her.$q$, array[$o$pride / proud$o$, $o$proud / pride$o$, $o$proudly / proudly$o$, $o$prouder / proudest$o$, $o$proud / proud$o$], 4, $e$1. **Feel** sonrası sıfat gelir: **proud**.
2. **Be proud of** kalıbı kullanılır: **proud**.

Diğer şıklar: **A** isimdir / **B** be sonrası sıfat gelir / **C** feel sonrası sıfat gelir ve be sonrası sıfat gelir / **D** karşılaştırma yoktur ve very ile üstünlük kullanılmaz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$It is ---- to learn a language without practice, and it is ---- to speak with native speakers.$q$, array[$o$difficult / useful$o$, $o$difficulty / useful$o$, $o$difficult / usefully$o$, $o$difficultly / use$o$, $o$more difficulty / using$o$], 0, $e$1. **It is + sıfat + to** kalıbı kullanılır: **difficult**.
2. Aynı kurala göre: **useful**.

Diğer şıklar: **B** isimdir / **C** be sonrası sıfat gelir / **D** zarf kalıbı yanlış ve isim ya da fiil / **E** isim kalıbı bozulur ve fiil biçimidir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$He is the ---- student in the class, and he is also the ----.$q$, array[$o$tallest of / most intelligent$o$, $o$tallest / more intelligent$o$, $o$tallest / most intelligent$o$, $o$most tall / most intelligenter$o$, $o$taller / intelligentest$o$], 2, $e$1. Üstünlük **tallest** ile söylenir: **tallest**.
2. Uzun sıfatta **most intelligent** kullanılır: **most intelligent**.

Diğer şıklar: **A** class ile in kullanılır / **B** class içinde üstünlük gerekir / **D** tek heceli sıfattır ve biçim yanlış / **E** class içinde üstünlük gerekir ve biçim yanlış.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$There was a ---- Italian restaurant at the corner, and the food was ----.$q$, array[$o$smally / delicious$o$, $o$small / delicious$o$, $o$small / deliciously$o$, $o$smaller / delight$o$, $o$smallest / delighted$o$], 1, $e$1. Boyut sıfatı milliyetten önce gelir: **small**.
2. **Be** sonrası sıfat gelir: **delicious**.

Diğer şıklar: **A** sıfat zarf biçimi yoktur / **C** be sonrası sıfat gelir / **D** karşılaştırma yoktur ve isimdir / **E** üstünlük yoktur ve hisseden kişi V-ed ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I find his jokes ----, but his sister is ---- of them.$q$, array[$o$annoyed / tolerant$o$, $o$annoying / tolerable$o$, $o$annoy / tolerating$o$, $o$annoying / tolerant$o$, $o$annoyance / tolerance$o$], 3, $e$1. Duygu yaratan şey **V-ing** alır: **annoying**.
2. **Tolerant of** kalıbı kullanılır: **tolerant**.

Diğer şıklar: **A** nesne duygu yaratıyor, V-ing gerekir / **B** anlam yönü uymaz / **C** sıfat olmaz ve fiil biçimidir / **E** isimdir ve isimdir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The teacher was ---- with the students' work, and they were ---- when she praised them.$q$, array[$o$impressed / delighted$o$, $o$impressive / delighted$o$, $o$impressed / delightful$o$, $o$impress / delight$o$, $o$impression / delighting$o$], 0, $e$1. **Impressed with** kalıbı kullanılır: **impressed**.
2. Hisseden kişi için **V-ed** gelir: **delighted**.

Diğer şıklar: **B** hisseden kişi V-ed ister / **C** hisseden kişi V-ed ister / **D** sıfat olmaz ve isim ya da fiil / **E** isimdir ve hisseden kişi V-ed ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Neither of the two answers was ----, and the explanation was too ---- to follow.$q$, array[$o$correctly / complicated$o$, $o$correct / complicated$o$, $o$correct / complicating$o$, $o$correction / complicate$o$, $o$corrected / complication$o$], 1, $e$1. **Be** sonrası sıfat gelir: **correct**.
2. **Too + sıfat + to** kalıbı kullanılır: **complicated**.

Diğer şıklar: **A** be sonrası sıfat gelir / **C** edilgen anlam V-ed ister / **D** isimdir ve sıfat olmaz / **E** edilgen anlam eşleşmez ve isimdir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$It was ---- of you to help me, and I am very ---- for your support.$q$, array[$o$kindly / grateful$o$, $o$kind / gratitude$o$, $o$kindness / gratefully$o$, $o$kind / grateful$o$, $o$kinder / grateful of$o$], 3, $e$1. **Kind of you** kalıbı kullanılır: **kind**.
2. **Grateful for** kalıbı kullanılır: **grateful**.

Diğer şıklar: **A** be sonrası sıfat gelir / **B** isimdir / **C** isimdir ve be sonrası sıfat gelir / **E** karşılaştırma yoktur ve for ile kullanılır.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The ---- weather ruined our holiday, and the ---- hotel made things worse.$q$, array[$o$awfully / noisy$o$, $o$awful / noise$o$, $o$awe / noisily$o$, $o$awed / noisier$o$, $o$awful / noisy$o$], 4, $e$1. İsmi **sıfat** niteler: **awful**.
2. Aynı kurala göre: **noisy**.

Diğer şıklar: **A** zarf isimden önce sıfat işlevi görmez / **B** isim sıfat olmaz / **C** isimdir ve zarf isimden önce gelmez / **D** hisseden kişi V-ed ister ve karşılaştırma yoktur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She was ---- surprised that she dropped the cup, and her friends were ---- shocked.$q$, array[$o$such / equally$o$, $o$so / same$o$, $o$so / equally$o$, $o$very / alike$o$, $o$too / equal$o$], 2, $e$1. **So + sıfat + that** sonuç kalıbıdır: **so**.
2. Sıfatı **zarf** niteler: **equally**.

Diğer şıklar: **A** sıfat öncesi so gelir / **B** zarf gerekir / **D** that sonuç cümlesi so ister ve cümle sonunda gelir / **E** that sonuç cümlesi so ister ve sıfatı zarf niteler.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The task seems ----, but it is actually quite ----.$q$, array[$o$simple / demanding$o$, $o$simply / demanding$o$, $o$simple / demand$o$, $o$simplicity / demandingly$o$, $o$simpler / demanded$o$], 0, $e$1. **Seem** sonrası sıfat gelir: **simple**.
2. Aynı kurala göre: **demanding**.

Diğer şıklar: **B** seem sonrası sıfat gelir / **C** isim ya da fiil / **D** isimdir ve be sonrası sıfat gelir / **E** karşılaştırma yoktur ve edilgen anlam eşleşmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$There isn't ---- point in waiting, and I'm sure there is ---- better way.$q$, array[$o$no / a$o$, $o$any / the$o$, $o$some / one$o$, $o$the / some$o$, $o$any / a$o$], 4, $e$1. Olumsuz cümlede **any** kullanılır: **any**.
2. Belirsiz tekil sayılabilir isim için **a** gelir: **a**.

Diğer şıklar: **A** olumsuz fiil ile any kullanılır / **B** belirsiz tekil sayılabilir için a gelir / **C** olumsuz cümlede any kullanılır ve better way önünde a gelir / **D** belirsiz anlam gerekir ve tekil sayılabilir isimle uyumsuz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$They were ---- to see us after so many years, and they were ---- with how much we had changed.$q$, array[$o$thrilling / amazed$o$, $o$thrilled / amazing$o$, $o$thrill / amaze$o$, $o$thrilled / amazed$o$, $o$thrills / amazement$o$], 3, $e$1. Hisseden kişi için **V-ed** gelir: **thrilled**.
2. Aynı kurala göre: **amazed**.

Diğer şıklar: **A** hisseden kişi V-ed ister / **B** hisseden kişi V-ed ister / **C** sıfat olmaz ve sıfat olmaz / **E** çoğul isim ve isimdir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Compared ---- his brother, he is far less ----, but he is much more reliable.$q$, array[$o$than / talkative$o$, $o$with / talkative$o$, $o$with / talk$o$, $o$to / talking$o$, $o$from / talkatively$o$], 1, $e$1. **Compared with** kalıbı kullanılır: **with**.
2. **Less + sıfat** kalıbı kullanılır: **talkative**.

Diğer şıklar: **A** compared with kalıbı vardır / **C** sıfat olmaz / **D** compared with kalıbı baskındır ve fiil biçimidir / **E** compared from yoktur ve zarf biçimi.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The boy was found ---- on the beach, and he was ---- of the danger he had been in.$q$, array[$o$live / unaware$o$, $o$alive / unaware about$o$, $o$living / not aware$o$, $o$lively / unawares$o$, $o$alive / unaware$o$], 4, $e$1. **Found alive** kalıbı kullanılır: **alive**.
2. **Unaware of** kalıbı kullanılır: **unaware**.

Diğer şıklar: **A** isimden sonra be sonrası alive gerekir / **B** of ile kullanılır / **C** anlam farkı vardır ve aware ile of gerekir, şık eşleşmesi bozulur / **D** canlı anlamı verir ve zarftır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The author's ---- style makes her books ---- to read, even for those who normally dislike novels.$q$, array[$o$simple / enjoyable$o$, $o$simply / enjoyable$o$, $o$simple / enjoyed$o$, $o$simplify / enjoying$o$, $o$simplicity / enjoyment$o$], 0, $e$1. İsimden önce **sıfat** gelir: **simple**.
2. **Sıfat + to-infinitive** kalıbı kullanılır: **enjoyable**.

Diğer şıklar: **B** isimden önce sıfat gelir / **C** anlam bozulur / **D** fiildir ve fiil biçimidir / **E** isimdir ve isimdir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It was ---- of him to forget her birthday, and she was ---- upset about it.$q$, array[$o$thoughtlessly / understandably$o$, $o$thoughtless / understandable$o$, $o$thoughtless / understandably$o$, $o$thought / understanding$o$, $o$thoughtful / understood$o$], 2, $e$1. **It was + sıfat + of him** kalıbında sıfat gelir: **thoughtless**.
2. Sıfatı **zarf** niteler: **understandably**.

Diğer şıklar: **A** be sonrası sıfat gelir / **B** sıfatı zarf niteler / **D** isim ya da fiil ve anlam bozulur / **E** anlam yönü uymaz ve edilgen anlam eşleşmez.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The minister was ---- accused of corruption, but he remained ---- in his denials.$q$, array[$o$public / adamant$o$, $o$publicly / adamant$o$, $o$publicly / adamantly$o$, $o$publicity / adamance$o$, $o$publication / adamants$o$], 1, $e$1. Fiili **zarf** niteler: **publicly**.
2. **Remain** sonrası sıfat gelir: **adamant**.

Diğer şıklar: **A** fiil zarfla nitelenir / **C** remain sonrası sıfat gelir / **D** isimdir ve isimdir / **E** isimdir ve çoğul isim.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adverbs konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adverbs konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adverbs$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$He worked ---- all night, but he could ---- keep his eyes open the next morning.$q$, array[$o$hardly / hardly$o$, $o$hard / hard$o$, $o$hard / hardly$o$, $o$harder / harshly$o$, $o$harshly / heavily$o$], 2, $e$1. Çok çalışmak **hard** ile söylenir: **hard**.
2. Neredeyse hiç anlamı **hardly** ile verilir: **hardly**.

Diğer şıklar: **A** work fiilini hard niteler / **B** anlam olumsuzdur, hardly gerekir / **D** karşılaştırma yoktur ve anlamı farklıdır / **E** anlamı farklıdır ve anlam uymaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She speaks English very ----, and she writes even ----.$q$, array[$o$fluent / better$o$, $o$fluently / good$o$, $o$fluency / best$o$, $o$fluenter / well$o$, $o$fluently / better$o$], 4, $e$1. Fiili **zarf** niteler: **fluently**.
2. **Even** ile karşılaştırma **better** olur: **better**.

Diğer şıklar: **A** fiili zarf niteler / **B** write fiilini zarf niteler / **C** isimdir ve even ile karşılaştırma gerekir / **D** karşılaştırma biçimi yok ve even ile better gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I have ---- seen such a beautiful sunset, and I would like to see it ----.$q$, array[$o$ever / again$o$, $o$never / already$o$, $o$always / yet$o$, $o$never / again$o$, $o$seldom / still$o$], 3, $e$1. **Never** hiç görmediğini söyler: **never**.
2. **Again** yeniden anlamını verir: **again**.

Diğer şıklar: **A** olumsuz anlam yok / **B** to see sonrasında again gelir / **C** anlam bozulur ve olumlu cümlede kullanılmaz / **E** have ile hiç anlamı güçlü değildir ve anlam bozulur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The train arrived ----, so we had ---- time to spare.$q$, array[$o$lately / plenty of$o$, $o$early / plenty of$o$, $o$early / plenty$o$, $o$latest / much$o$, $o$earliest / many$o$], 1, $e$1. **Early** erken anlamı verir: **early**.
2. **Plenty of** kalıbı kullanılır: **plenty of**.

Diğer şıklar: **A** son zamanlarda anlamı verir / **C** of olmadan kullanılmaz / **D** en son anlamı verir ve olumlu cümlede plenty of kullanılır / **E** üstünlük gerekmez ve sayılamayan time ile kullanılmaz.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$We go to the cinema ---- on Saturdays, but we ---- go there on weekdays.$q$, array[$o$usual / seldom$o$, $o$usually / seldomly$o$, $o$usually / seldom$o$, $o$usualness / seldoms$o$, $o$used / seldomness$o$], 2, $e$1. Sıklık zarfı **usually** olur: **usually**.
2. Nadir yapılan eylem **seldom** ile söylenir: **seldom**.

Diğer şıklar: **A** fiili zarf niteler / **B** seldom zaten zarftır / **D** isimdir ve çoğul biçim yok / **E** anlam bozulur ve isimdir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The exam was ---- difficult, so ---- any of the students finished it on time.$q$, array[$o$extremely / hardly$o$, $o$extreme / hardly$o$, $o$extremely / hard$o$, $o$extremes / hardily$o$, $o$extremist / barely not$o$], 0, $e$1. Sıfatı **zarf** niteler: **extremely**.
2. **Hardly any** kalıbı kullanılır: **hardly**.

Diğer şıklar: **B** sıfatı zarf niteler / **C** hardly any kalıbı gerekir / **D** çoğul isimdir ve biçim yanlış / **E** isimdir ve çift olumsuzluk olur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- had he arrived at the station ---- the train left, so he had to wait for the next one.$q$, array[$o$Seldom / when$o$, $o$Hardly / when$o$, $o$Hardly / while$o$, $o$Rarely / that$o$, $o$Often / because$o$], 1, $e$1. **Hardly...when** kalıbı kullanılır: **Hardly**.
2. Aynı kalıp **when** ister: **when**.

Diğer şıklar: **A** hardly ... when kalıbı gerekir / **C** hardly ... when kalıbı gerekir / **D** hardly ... when kalıbı gerekir ve hardly ... when kalıbı gerekir / **E** devrik yapı kurmaz ve hardly ... when kalıbı gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I have ---- finished my homework, but my brother hasn't started ----.$q$, array[$o$yet / yet$o$, $o$already / already$o$, $o$still / still$o$, $o$ever / ever$o$, $o$already / yet$o$], 4, $e$1. Olumlu cümlede **already** kullanılır: **already**.
2. Olumsuz cümle sonunda **yet** kullanılır: **yet**.

Diğer şıklar: **A** olumlu cümlede already kullanılır / **B** olumsuz cümle sonunda yet kullanılır / **C** olumlu cümlede already kullanılır ve olumsuz cümle sonunda yet kullanılır / **D** olumlu cümlede already kullanılır ve olumsuz cümle sonunda yet kullanılır.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He is not ---- to drive a car, but he is ---- young to understand politics.$q$, array[$o$enough old / too$o$, $o$old enough / enough$o$, $o$old enough / too$o$, $o$too old / so$o$, $o$very old / very$o$], 2, $e$1. **Sıfat + enough** doğru sıradır: **old enough**.
2. **Too + sıfat + to** olumsuz sonuç verir: **too**.

Diğer şıklar: **A** enough sıfattan sonra gelir / **B** young too ile kullanılır / **D** olumsuz sonuç anlamı verir ve to ile sonuç kalıbı bozulur / **E** to ile sonuç kalıbı bozulur ve to ile sonuç kalıbı bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The company has been losing money ----, and the situation is ---- worse.$q$, array[$o$late / getting$o$, $o$lately / got$o$, $o$latest / gets$o$, $o$lately / getting$o$, $o$lateness / get$o$], 3, $e$1. **Lately** son zamanlarda anlamı verir: **lately**.
2. **Is getting worse** sürekli yapı verir: **getting**.

Diğer şıklar: **A** geç anlamı verir / **B** Present Continuous ile getting gerekir / **C** en son anlamı verir ve Present Continuous ile getting gerekir / **E** isimdir ve Present Continuous ile getting gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She plays the piano ---- than her sister, but she doesn't play ---- as her teacher.$q$, array[$o$better / as well$o$, $o$best / as well$o$, $o$better / as good$o$, $o$good / as best$o$, $o$more good / as better$o$], 0, $e$1. **Than** ile **better** gelir: **better**.
2. **As well as** kalıbı kullanılır: **as well**.

Diğer şıklar: **B** than ile karşılaştırma gerekir / **C** play fiilini zarf niteler / **D** fiili zarf niteler ve as ile eşitlik kalıbı bozulur / **E** well düzensizdir ve as ile eşitlik kalıbı bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The accident happened ---- because the driver was not paying attention, and ---- no one was seriously hurt.$q$, array[$o$probable / fortunately$o$, $o$probably / fortunate$o$, $o$probability / fortune$o$, $o$probabilities / fortunes$o$, $o$probably / fortunately$o$], 4, $e$1. Olasılık zarfı **probably** olur: **probably**.
2. Cümleyi niteleyen **fortunately** olur: **fortunately**.

Diğer şıklar: **A** fiili zarf niteler / **B** cümleyi zarf niteler / **C** isimdir ve isimdir / **D** çoğul isim ve çoğul isim.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Rarely ---- I seen such a crowd, and never ---- I heard such a noise.$q$, array[$o$do / have$o$, $o$have / have$o$, $o$have / do$o$, $o$am / am$o$, $o$was / did$o$], 1, $e$1. **Rarely** sonrası devrik Present Perfect **have I seen** ile kurulur: **have**.
2. Aynı kurala göre: **have**.

Diğer şıklar: **A** Present Perfect devrik yapı have ister / **C** Present Perfect devrik yapı have ister / **D** devrik yapıda have gerekir ve devrik yapıda have gerekir / **E** devrik yapıda have gerekir ve Present Perfect devrik yapı have ister.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Only when the results were announced ---- the extent of the damage, and only then ---- the government take action.$q$, array[$o$we realised / did$o$, $o$did we realise / does$o$, $o$did we realise / did$o$, $o$we did realise / had$o$, $o$had we realised / was$o$], 2, $e$1. **Only when** sonrası devrik yapı kurulur: **did we realise**.
2. **Only then** sonrası devrik yapı kurulur: **did**.

Diğer şıklar: **A** only when sonrası devrik yapı gerekir / **B** geçmiş anlatım gerekir / **D** only when sonrası devrik yapı gerekir ve only then sonrası did gerekir / **E** geçmiş zaman anlatımı Past Simple ister ve only then sonrası did gerekir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The results were ---- better than we had expected, and the weather was ---- perfect for a picnic.$q$, array[$o$far / absolutely$o$, $o$very / absolutely$o$, $o$far / very$o$, $o$so / rather$o$, $o$too / fairly$o$], 0, $e$1. Karşılaştırmayı **far** pekiştirir: **far**.
2. Derecelenemeyen sıfatı **absolutely** niteler: **absolutely**.

Diğer şıklar: **B** karşılaştırmayı far/much/a lot pekiştirir / **C** perfect derecelenemeyen sıfattır / **D** karşılaştırmayı far/much/a lot pekiştirir ve perfect derecelenemeyen sıfattır / **E** karşılaştırmayı far/much/a lot pekiştirir ve perfect derecelenemeyen sıfattır.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The more ---- you drive, the more ---- you will arrive, so take your time.$q$, array[$o$careful / safely$o$, $o$carefully / safe$o$, $o$care / safety$o$, $o$carefully / safely$o$, $o$carefulness / safer$o$], 3, $e$1. **The more + zarf** karşılaştırma yapısı kullanılır: **carefully**.
2. Aynı kurala göre: **safely**.

Diğer şıklar: **A** zarf gerekir / **B** fiili zarf niteler / **C** isimdir ve isimdir / **E** isimdir ve more ile karşılaştırma bozulur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Not only ---- the film boring, but the sound quality was ---- poor as well.$q$, array[$o$is / equally$o$, $o$was / equal$o$, $o$did / equality$o$, $o$has been / equals$o$, $o$was / equally$o$], 4, $e$1. **Not only** sonrası devrik yapı kurulur: **was**.
2. Sıfatı **zarf** niteler: **equally**.

Diğer şıklar: **A** geçmiş anlatım gerekir / **B** sıfatı zarf niteler / **C** Not only sonrası yardımcı fiil olmalı, was gerekir ve isimdir / **D** geçmiş anlatım gerekir ve çoğul isim.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He ran as ---- as he could, but the bus had ---- left.$q$, array[$o$fast / already$o$, $o$fastly / already$o$, $o$fast / yet$o$, $o$quick / still$o$, $o$quickly / ever$o$], 0, $e$1. **Fast** hem sıfat hem zarftır: **fast**.
2. Olumlu cümlede **already** kullanılır: **already**.

Diğer şıklar: **B** fast hem sıfat hem zarftır / **C** olumlu cümlede already kullanılır / **D** fiili zarf niteler ve olumlu cümlede already kullanılır / **E** fast ile eşitlik kalıbı yerleşik ve olumlu cümlede already kullanılır.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Prices have risen ---- over the last year, and many families can ---- afford basic food.$q$, array[$o$sharp / barely$o$, $o$sharply / bare$o$, $o$sharpness / barren$o$, $o$sharply / barely$o$, $o$sharpest / barest$o$], 3, $e$1. Fiili **zarf** niteler: **sharply**.
2. **Can barely** zor anlamı verir: **barely**.

Diğer şıklar: **A** fiili zarf niteler / **B** can sonrası zarf gerekir / **C** isimdir ve anlamı farklıdır / **E** üstünlük gerekmez ve üstünlük gerekmez.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Seldom ---- he speak in public, and ---- when he does, he speaks very briefly.$q$, array[$o$he does / even$o$, $o$does / even$o$, $o$does / so$o$, $o$is / still$o$, $o$has / already$o$], 1, $e$1. **Seldom** sonrası devrik yapı kurulur: **does**.
2. **Even when** kalıbı kullanılır: **even**.

Diğer şıklar: **A** seldom sonrası devrik yapı gerekir / **C** when ile pekiştirme even ile yapılır / **D** seldom sonrası yardımcı fiil does olmalı ve when ile pekiştirme even ile yapılır / **E** seldom sonrası yardımcı fiil does olmalı ve when ile pekiştirme even ile yapılır.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adverbs konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adverbs konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adverbs$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$They live ---- from the city centre, so they ---- go out in the evenings.$q$, array[$o$farly / seldom$o$, $o$far / seldomly$o$, $o$distant / seldoms$o$, $o$far / seldom$o$, $o$long / seldomness$o$], 3, $e$1. **Far** uzaklık zarfıdır: **far**.
2. **Seldom** nadiren anlamı verir: **seldom**.

Diğer şıklar: **A** far zaten zarftır / **B** seldom zaten zarftır / **C** fiilden sonra zarf gerekir ve çoğul biçim yok / **E** uzaklık için far kullanılır ve isimdir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He drives ----, so he has never had an accident, and he ---- breaks the speed limit.$q$, array[$o$careful / never$o$, $o$carefully / always$o$, $o$carefully / never$o$, $o$care / often$o$, $o$carefulness / usually$o$], 2, $e$1. Fiili **zarf** niteler: **carefully**.
2. Hiç yapmama **never** ile söylenir: **never**.

Diğer şıklar: **A** fiili zarf niteler / **B** anlam çelişir / **D** isimdir ve anlam çelişir / **E** isimdir ve anlam çelişir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I asked her ----, but she answered ----.$q$, array[$o$polite / rudely$o$, $o$politely / rude$o$, $o$politeness / rudeness$o$, $o$politer / ruder$o$, $o$politely / rudely$o$], 4, $e$1. Fiili **zarf** niteler: **politely**.
2. Aynı kurala göre: **rudely**.

Diğer şıklar: **A** fiili zarf niteler / **B** fiili zarf niteler / **C** isimdir ve isimdir / **D** karşılaştırma yoktur ve karşılaştırma yoktur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The film was ---- long, so we left ---- before the end.$q$, array[$o$too / early$o$, $o$enough / early$o$, $o$too / earlier$o$, $o$so / earliest$o$, $o$such / earlily$o$], 0, $e$1. **Too** olumsuz sonuç verir: **too**.
2. **Early** hem sıfat hem zarftır: **early**.

Diğer şıklar: **B** sıfattan sonra gelir / **C** karşılaştırma yoktur / **D** sonuç cümlesi that ister ve üstünlük yoktur / **E** sıfattan önce a gerekir ve biçim yanlış.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$He is ---- tired, so he has ---- gone to bed.$q$, array[$o$much / already$o$, $o$very / already$o$, $o$very / yet$o$, $o$too / ever$o$, $o$enough / never$o$], 1, $e$1. **Very** sıfatı pekiştirir: **very**.
2. Olumlu cümlede **already** kullanılır: **already**.

Diğer şıklar: **A** sıfat öncesinde very gelir / **C** olumlu cümlede already gelir / **D** sonuç cümlesi yoktur ve olumlu cümlede already gelir / **E** sıfattan sonra gelir ve anlam çelişir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$She is ---- late for work because she lives so ---- to the office.$q$, array[$o$no / close$o$, $o$never / closely$o$, $o$not / closed$o$, $o$never / close$o$, $o$seldom / closing$o$], 3, $e$1. **Never** hiç anlamı verir: **never**.
2. **Close** yakın anlamıyla zarf olarak kullanılır: **close**.

Diğer şıklar: **A** never ile yardımcı fiil gerekir / **B** lives so close kalıbı zarf ister, anlam farklıdır / **C** anlam bozulur ve sıfat biçimi uymaz / **E** sıfat gerekmez ve fiil biçimidir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The patient was ---- ill when he arrived, and he is ---- much better now.$q$, array[$o$seriously / already$o$, $o$serious / already$o$, $o$seriously / yet$o$, $o$seriousness / ever$o$, $o$more serious / never$o$], 0, $e$1. Sıfatı **zarf** niteler: **seriously**.
2. Olumlu cümlede **already** kullanılır: **already**.

Diğer şıklar: **B** sıfatı zarf niteler / **C** olumlu cümlede already kullanılır / **D** isimdir ve anlam bozulur / **E** anlam bozulur ve anlam çelişir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I ---- agree with you, but I think the plan is ---- risky.$q$, array[$o$total / rather$o$, $o$totally / rather$o$, $o$totally / rathers$o$, $o$totality / quite not$o$, $o$totals / pretty not$o$], 1, $e$1. Fiili **zarf** niteler: **totally**.
2. Sıfatı **rather** niteler: **rather**.

Diğer şıklar: **A** fiili zarf niteler / **C** biçim yanlıştır / **D** isimdir ve anlam bozulur / **E** çoğul isim ve anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$It rained ---- all week, and the river rose ----.$q$, array[$o$heavy / rapidly$o$, $o$heavily / rapid$o$, $o$heavily / rapidly$o$, $o$heaviness / rapidity$o$, $o$heavier / rapids$o$], 2, $e$1. Fiili **zarf** niteler: **heavily**.
2. Aynı kurala göre: **rapidly**.

Diğer şıklar: **A** fiili zarf niteler / **B** fiili zarf niteler / **D** isimdir ve isimdir / **E** karşılaştırma yoktur ve çoğul isim.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$We arrived ---- early, so we had ---- time to look around the town.$q$, array[$o$quiet / plenty of$o$, $o$quite / plentiful$o$, $o$quit / plenty$o$, $o$quietly / many$o$, $o$quite / plenty of$o$], 4, $e$1. **Quite** sıfatı niteler: **quite**.
2. **Plenty of** kalıbı kullanılır: **plenty of**.

Diğer şıklar: **A** sessiz anlamı verir / **B** isim önünde plenty of gelir / **C** fiildir ve of olmadan kullanılmaz / **D** anlam bozulur ve sayılamayan time ile kullanılmaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The team played ---- well in the first half, but ---- in the second half they lost control.$q$, array[$o$extreme / surprisingly$o$, $o$extremely / surprising$o$, $o$extremist / surprise$o$, $o$extremely / surprisingly$o$, $o$extremes / surprised$o$], 3, $e$1. Sıfatı niteleyen zarf **extremely** olur: **extremely**.
2. Cümleyi niteleyen zarf **surprisingly** olur: **surprisingly**.

Diğer şıklar: **A** sıfat ya da isim, zarf gerekir / **B** cümleyi zarf niteler / **C** isimdir ve isimdir / **E** çoğul isim ve hisseden kişi için V-ed.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He apologised ---- for his mistake, and he promised to be more careful ----.$q$, array[$o$sincerely / in future$o$, $o$sincere / in future$o$, $o$sincerely / on future$o$, $o$sincerity / at future$o$, $o$sincerer / for future$o$], 0, $e$1. Fiili **zarf** niteler: **sincerely**.
2. **In future** kalıbı kullanılır: **in future**.

Diğer şıklar: **B** fiili zarf niteler / **C** in future kalıbıdır / **D** isimdir ve in future kalıbıdır / **E** karşılaştırma yoktur ve in future kalıbıdır.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The cake looks ----, but it tastes ----.$q$, array[$o$deliciously / terrible$o$, $o$delicious / terribly$o$, $o$deliciousness / terror$o$, $o$delight / terrified$o$, $o$delicious / terrible$o$], 4, $e$1. Duyu fiillerinden sonra sıfat gelir: **delicious**.
2. Aynı kurala göre: **terrible**.

Diğer şıklar: **A** look sonrası sıfat gelir / **B** taste duyu fiili sıfat ister / **C** isimdir ve isimdir / **D** isimdir ve hisseden kişi V-ed ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$I'm afraid I can't help you ----, because I'm ---- busy at the moment.$q$, array[$o$right / extremely$o$, $o$now / extreme$o$, $o$now / extremely$o$, $o$never / extremes$o$, $o$later / extremist$o$], 2, $e$1. **Now** şu an anlamı verir: **now**.
2. Sıfatı **zarf** niteler: **extremely**.

Diğer şıklar: **A** anlam farklıdır / **B** sıfatı zarf niteler / **D** anlam bozulur ve çoğul isim / **E** anlam bozulur ve isimdir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The shop assistant was very ---- to us, and she explained everything ----.$q$, array[$o$helpful / patiently$o$, $o$helpfully / patiently$o$, $o$helpful / patient$o$, $o$help / patience$o$, $o$helps / patients$o$], 0, $e$1. Sıfat gerekir: **helpful**.
2. Fiili zarf niteler: **patiently**.

Diğer şıklar: **B** be sonrası sıfat gelir / **C** fiili zarf niteler / **D** fiildir ve isimdir / **E** fiil biçimidir ve çoğul isim.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Little ---- they know that the manager ---- them closely for weeks.$q$, array[$o$do / had been watching$o$, $o$did / had been watching$o$, $o$did / watched$o$, $o$are / has been watching$o$, $o$have / is watching$o$], 1, $e$1. **Little** sonrası devrik yapı **did** ile kurulur: **did**.
2. Süre ve önceki an **had been watching** ile verilir: **had been watching**.

Diğer şıklar: **A** Little sonrası geçmiş anlatım did ister / **C** weeks süre vurgusu ve önceki an ister / **D** devrik yapıda did gerekir ve özne them ile uyumsuz, geçmiş an gerekir / **E** devrik yapıda did gerekir ve süre vurgusu gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The speaker was ---- criticised, yet she remained ---- calm throughout the debate.$q$, array[$o$severe / remarkably$o$, $o$severely / remarkable$o$, $o$severity / remark$o$, $o$severely / remarkably$o$, $o$severer / remarks$o$], 3, $e$1. Fiili zarf niteler: **severely**.
2. Sıfatı zarf niteler: **remarkably**.

Diğer şıklar: **A** fiili zarf niteler / **B** sıfatı zarf niteler / **C** isimdir ve fiildir / **E** karşılaştırma yoktur ve çoğul isim.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Under no circumstances ---- the door open, and at no time ---- anyone allowed to enter without permission.$q$, array[$o$you should leave / was$o$, $o$should you leave / were$o$, $o$should you leave / was$o$, $o$you do leave / is$o$, $o$leave you / has been$o$], 2, $e$1. **Under no circumstances** sonrası devrik yapı kurulur: **should you leave**.
2. **At no time** sonrası devrik yapı kurulur: **was**.

Diğer şıklar: **A** Under no circumstances sonrası devrik yapı gerekir / **B** at no time sonrası tekil was gerekir / **D** devrik yapı gerekir ve geçmiş anlatım gerekir / **E** yapı bozulur ve geçmiş anlatım gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- did the committee reject the proposal, but it also criticised its authors ----.$q$, array[$o$Not alone / harshly$o$, $o$Not only / harsh$o$, $o$Not until / harshness$o$, $o$Not since / harsher$o$, $o$Not only / harshly$o$], 4, $e$1. **Not only** sonrası devrik yapı kurulur: **Not only**.
2. Fiili zarf niteler: **harshly**.

Diğer şıklar: **A** devrik yapı Not only ile kurulur / **B** fiili zarf niteler / **C** anlam bozulur ve isimdir / **D** anlam bozulur ve karşılaştırma yoktur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The weather has been ---- unpredictable this summer, and temperatures have ---- risen above thirty degrees.$q$, array[$o$wild / rarely$o$, $o$wildly / rarely$o$, $o$wildly / rare$o$, $o$wilderness / rareness$o$, $o$wilder / rarer$o$], 1, $e$1. Sıfatı zarf niteler: **wildly**.
2. Have ile V3 arasında sıklık zarfı gelir: **rarely**.

Diğer şıklar: **A** sıfatı zarf niteler / **C** have sonrası zarf gerekir / **D** isimdir ve isimdir / **E** karşılaştırma yoktur ve karşılaştırma yoktur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adverbs konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adverbs konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adverbs$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$He speaks ----, so everyone can understand him, and he never talks ----.$q$, array[$o$clearly / too fast$o$, $o$clear / too fast$o$, $o$clearly / fast too$o$, $o$clarity / so fast$o$, $o$clearer / fastly$o$], 0, $e$1. Fiili zarf niteler: **clearly**.
2. **Too + zarf** kalıbı kullanılır: **too fast**.

Diğer şıklar: **B** fiili zarf niteler / **C** too sıfattan önce gelir / **D** isimdir ve sonuç cümlesi yok / **E** karşılaştırma yoktur ve fast hem sıfat hem zarftır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She was ---- tired, but she ---- finished the report.$q$, array[$o$too / still$o$, $o$very / still$o$, $o$very / yet$o$, $o$enough / already$o$, $o$much / ever$o$], 1, $e$1. **Very** sıfatı pekiştirir: **very**.
2. **Still** anlam yönünü korur: **still**.

Diğer şıklar: **A** sonuç cümlesi yok / **C** olumlu cümlede still kullanılır / **D** sıfattan sonra gelir ve anlam çelişir / **E** sıfat öncesinde very gelir ve anlam bozulur.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I will ---- forget your kindness, and I hope to see you ---- soon.$q$, array[$o$ever / again$o$, $o$never / before$o$, $o$hardly / already$o$, $o$never / again$o$, $o$seldom / yet$o$], 3, $e$1. **Never** hiç anlamı verir: **never**.
2. **Again** yeniden anlamı verir: **again**.

Diğer şıklar: **A** olumlu cümlede never gerekir / **B** soon ile kullanılmaz / **C** anlam bozulur ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The students listened ---- to the speaker, and they asked questions ----.$q$, array[$o$careful / afterwards$o$, $o$carefully / after$o$, $o$carefully / afterwards$o$, $o$care / at last$o$, $o$carefulness / lately$o$], 2, $e$1. Fiili zarf niteler: **carefully**.
2. **Afterwards** sonrasında anlamı verir: **afterwards**.

Diğer şıklar: **A** fiili zarf niteler / **B** cümle sonunda zarf afterwards gerekir / **D** isimdir ve anlam bozulur / **E** isimdir ve anlam bozulur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I ---- go to the gym, but I ---- eat fast food.$q$, array[$o$some times / never$o$, $o$sometimes / ever$o$, $o$sometime / hardly$o$, $o$some time / seldom$o$, $o$sometimes / never$o$], 4, $e$1. **Sometimes** ara sıra anlamı verir: **sometimes**.
2. **Never** hiç anlamı verir: **never**.

Diğer şıklar: **A** zarf biçimi yanlış / **B** olumlu cümlede never gerekir / **C** zaman zarfı, sıklık değil ve anlam bozulur / **D** isim öbeğidir ve anlam bozulur.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The film was ---- better than I expected, and the ending was ---- surprising.$q$, array[$o$very / quite$o$, $o$much / quite$o$, $o$much / quiet$o$, $o$so / quit$o$, $o$too / quitely$o$], 1, $e$1. Karşılaştırmayı **much** pekiştirir: **much**.
2. Sıfatı **quite** niteler: **quite**.

Diğer şıklar: **A** karşılaştırmayı much pekiştirir / **C** sessiz anlamı verir / **D** karşılaştırmayı much pekiştirir ve fiildir / **E** karşılaştırmayı much pekiştirir ve biçim yanlış.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She didn't pass the exam, ---- she had studied ----.$q$, array[$o$because / hard$o$, $o$although / hardly$o$, $o$so / harder$o$, $o$although / hard$o$, $o$since / hardness$o$], 3, $e$1. Zıtlık **although** ile verilir: **although**.
2. Çok çalışmak **hard** ile söylenir: **hard**.

Diğer şıklar: **A** zıtlık anlamı gerekir / **B** çok çalışmak hard ile söylenir / **C** zıtlık anlamı gerekir ve karşılaştırma yoktur / **E** zıtlık anlamı gerekir ve isimdir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He ---- sleeps more than five hours, and he ---- feels tired in the morning.$q$, array[$o$rare / always$o$, $o$rarely / never$o$, $o$rareness / seldom$o$, $o$rarer / hardly$o$, $o$rarely / always$o$], 4, $e$1. **Rarely** nadiren anlamı verir: **rarely**.
2. **Always** her zaman anlamı verir: **always**.

Diğer şıklar: **A** fiili zarf niteler / **B** çelişir, rarely ile anlam uyumu bozulur / **C** isimdir ve anlam yönü bozulur / **D** karşılaştırma yoktur ve anlam yönü bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The teacher spoke ---- quietly that the students ---- hear her at the back.$q$, array[$o$such / couldn't$o$, $o$so / couldn't$o$, $o$so / can$o$, $o$very / could$o$, $o$too / might$o$], 1, $e$1. **So + zarf + that** sonuç kalıbıdır: **so**.
2. Olumsuz sonuç **couldn't** ile söylenir: **couldn't**.

Diğer şıklar: **A** zarf öncesinde so gelir / **C** sonuç cümlesi olumsuz anlam ister / **D** that sonuç cümlesi so ister ve olumsuz anlam gerekir / **E** that sonuç cümlesi so ister ve olumsuz anlam gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I've ---- finished the book, so I'll lend it to you ----.$q$, array[$o$just / tomorrow$o$, $o$only / tomorrow$o$, $o$just / yesterday$o$, $o$yet / last night$o$, $o$ever / ago$o$], 0, $e$1. Present Perfect ile **just** kullanılır: **just**.
2. Gelecek zaman zarfı **tomorrow** olur: **tomorrow**.

Diğer şıklar: **B** just now anlamı için just gerekir / **C** will ile geçmiş zaman zarfı olmaz / **D** olumlu cümlede just kullanılır ve will ile geçmiş zaman zarfı olmaz / **E** anlam bozulur ve tek başına kullanılmaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$He is ---- the best player in the team, and ---- the most experienced one.$q$, array[$o$easy / probably$o$, $o$easily / probable$o$, $o$easily / probably$o$, $o$ease / probability$o$, $o$easier / probabilities$o$], 2, $e$1. Üstünlüğü **easily** pekiştirir: **easily**.
2. Olasılık zarfı **probably** olur: **probably**.

Diğer şıklar: **A** sıfatı zarf niteler / **B** sıfatı zarf niteler / **D** isimdir ve isimdir / **E** karşılaştırma yoktur ve çoğul isim.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The car stopped ----, and the driver got out ----.$q$, array[$o$sudden / angrily$o$, $o$suddenly / angry$o$, $o$suddenness / anger$o$, $o$suddenly / angrily$o$, $o$suddener / angrier$o$], 3, $e$1. Fiili zarf niteler: **suddenly**.
2. Aynı kurala göre: **angrily**.

Diğer şıklar: **A** fiili zarf niteler / **B** fiili zarf niteler / **C** isimdir ve isimdir / **E** karşılaştırma yoktur ve karşılaştırma yoktur.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$We have ---- met before, but I feel as if I've known him ----.$q$, array[$o$never / forever$o$, $o$ever / forever$o$, $o$never / for long$o$, $o$always / forever and ever$o$, $o$often / ever$o$], 0, $e$1. **Never** hiç anlamı verir: **never**.
2. **Forever** çok uzun süre anlamı verir: **forever**.

Diğer şıklar: **B** olumlu cümlede never gerekir / **C** feel as if ile forever kullanılır / **D** anlam bozulur ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He doesn't drive ---- any more, and he ---- goes out at night.$q$, array[$o$fastly / hardly ever$o$, $o$fast / hardly never$o$, $o$fast / hardly ever$o$, $o$faster / almost$o$, $o$fastness / nearly$o$], 2, $e$1. **Fast** zarf olarak kullanılır: **fast**.
2. **Hardly ever** hemen hemen hiç anlamı verir: **hardly ever**.

Diğer şıklar: **A** fast zarf olarak zaten kullanılır, fastly yoktur / **B** çift olumsuz olur / **D** any more ile karşılaştırma bozulur ve anlam bozulur / **E** isimdir ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$She answered all the questions ----, and she ---- made a mistake.$q$, array[$o$correct / never$o$, $o$correctly / ever$o$, $o$correction / hardly$o$, $o$corrected / seldom$o$, $o$correctly / never$o$], 4, $e$1. Fiili zarf niteler: **correctly**.
2. **Never** hiç yapmadı anlamı verir: **never**.

Diğer şıklar: **A** fiili zarf niteler / **B** olumlu fiille never gerekir / **C** isimdir ve made ile hardly ever gerekir / **D** edilgen anlam eşleşmez ve correctly ile anlam çelişir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$No sooner had the plan been announced ---- the protests began, and the government ---- reconsidered it.$q$, array[$o$than / promptly$o$, $o$when / promptly$o$, $o$than / prompt$o$, $o$that / promptness$o$, $o$then / prompter$o$], 0, $e$1. **No sooner...than** kalıbı kullanılır: **than**.
2. Fiili zarf niteler: **promptly**.

Diğer şıklar: **B** no sooner ... than kalıbı gerekir / **C** fiili zarf niteler / **D** no sooner ... than kalıbı gerekir ve isimdir / **E** no sooner ... than kalıbı gerekir ve karşılaştırma yoktur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Had the manager acted ----, the crisis would have been avoided, and the damage ---- have been far less.$q$, array[$o$swift / would$o$, $o$swiftly / will$o$, $o$swiftness / can$o$, $o$swiftly / would$o$, $o$swifter / must$o$], 3, $e$1. Fiili zarf niteler: **swiftly**.
2. Üçüncü tip koşul sonucu **would have** ile kurulur: **would**.

Diğer şıklar: **A** fiili zarf niteler / **B** üçüncü tip koşulda would have gelir / **C** isimdir ve üçüncü tip koşulda would have gelir / **E** karşılaştırma yoktur ve üçüncü tip koşulda would have gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The negotiations ---- collapsed, and the delegates left the room ---- disappointed.$q$, array[$o$virtually had / visibly$o$, $o$had virtually / visible$o$, $o$had virtual / visibility$o$, $o$virtual had / visibly$o$, $o$had virtually / visibly$o$], 4, $e$1. Zarf yardımcı fiilden sonra gelir: **had virtually**.
2. Sıfatı zarf niteler: **visibly**.

Diğer şıklar: **A** had sonrası zarf gelir / **B** sıfatı zarf niteler / **C** fiili zarf niteler ve isimdir / **D** sıra yanlış ve sıfat öncesi doğru ancak şık eşleşmesi bozulur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It was not until the ship sank ---- the crew realised how ---- the situation had become.$q$, array[$o$when / serious$o$, $o$that / seriously$o$, $o$that / serious$o$, $o$than / seriousness$o$, $o$which / more serious$o$], 2, $e$1. **It was not until...that** kalıbı kullanılır: **that**.
2. **How + sıfat** kalıbı kullanılır: **serious**.

Diğer şıklar: **A** not until ... that kalıbı gerekir / **B** how sonrası sıfat gelir / **D** not until ... that kalıbı gerekir ve isimdir / **E** not until ... that kalıbı gerekir ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Barely ---- the exam hall ---- the fire alarm went off, and the students had to leave at once.$q$, array[$o$they had entered / when$o$, $o$had they entered / when$o$, $o$had they entered / than$o$, $o$did they enter / that$o$, $o$have they entered / while$o$], 1, $e$1. **Barely** sonrası devrik yapı kurulur: **had they entered**.
2. **Barely...when** kalıbı kullanılır: **when**.

Diğer şıklar: **A** barely sonrası devrik yapı gerekir / **C** barely ... when kalıbı gerekir / **D** barely ile Past Perfect gerekir ve barely ... when kalıbı gerekir / **E** barely ile Past Perfect gerekir ve barely ... when kalıbı gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Passive Voice konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Passive Voice konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The bridge ---- in 1998, and it ---- by thousands of cars every day.$q$, array[$o$built / is used$o$, $o$was built / is used$o$, $o$was built / uses$o$, $o$has built / is using$o$, $o$is building / used$o$], 1, $e$1. **In 1998** geçmişte bitmiş bir zamandır: **was built**.
2. Genel durum edilgen Present Simple ile söylenir: **is used**.

Diğer şıklar: **A** nesne olan köprü edilgen yapı ister / **C** özne cars ile by agent kullanılır, edilgen yapı gerekir / **D** köprü edilgen yapı ister ve edilgen yapı gerekir / **E** köprü edilgen yapı ister ve edilgen yapı gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The new law ---- next month, and all the details ---- on the ministry's website tomorrow.$q$, array[$o$will introduce / will be published$o$, $o$will be introduced / will publish$o$, $o$introduces / publish$o$, $o$will be introduced / will be published$o$, $o$has introduced / are publishing$o$], 3, $e$1. Gelecekte edilgen yapı **will be + V3** ile kurulur: **will be introduced**.
2. Aynı kurala göre: **will be published**.

Diğer şıklar: **A** yasa eylemi yapan değil, uğrayandır / **B** ayrıntılar edilgen yapı ister / **C** yasa edilgen yapı ister ve edilgen yapı ister / **E** edilgen yapı ister ve edilgen yapı ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$My car ---- at the moment, so I ---- to work by bus this week.$q$, array[$o$is being repaired / am going$o$, $o$is repairing / am going$o$, $o$is being repaired / am gone$o$, $o$repairs / go$o$, $o$was repaired / went$o$], 0, $e$1. **At the moment** edilgen sürekli yapı ister: **is being repaired**.
2. **Go** geçişsiz fiildir ve edilgen olmaz: **am going**.

Diğer şıklar: **B** araba edilgen yapı ister / **C** go geçişsiz fiildir / **D** araba edilgen yapı ister ve this week için sürekli yapı gerekir / **E** at the moment şu anı gösterir ve this week geçmiş değildir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The letters ---- yesterday, but the parcel ---- yet.$q$, array[$o$posted / hasn't been sent$o$, $o$were posted / hasn't sent$o$, $o$were posted / hasn't been sent$o$, $o$have posted / wasn't sending$o$, $o$are posted / doesn't send$o$], 2, $e$1. **Yesterday** geçmiş edilgen yapı ister: **were posted**.
2. **Yet** Present Perfect Passive ister: **hasn't been sent**.

Diğer şıklar: **A** mektuplar edilgen yapı ister / **B** parcel edilgen yapı ister / **D** yesterday ile Present Perfect olmaz ve yet Present Perfect ister / **E** yesterday geçmiştir ve yet Present Perfect ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$A lot of English ---- all over the world, and many languages ---- in this city.$q$, array[$o$speaks / are spoken$o$, $o$is spoken / are spoken$o$, $o$is spoken / speak$o$, $o$speaking / spoken$o$, $o$is speaking / are speaking$o$], 1, $e$1. Genel durum edilgen Present Simple ile söylenir: **is spoken**.
2. Çoğul özne are ister: **are spoken**.

Diğer şıklar: **A** English konuşulan nesnedir / **C** languages edilgen yapı ister / **D** edilgen yapı ister ve çekimli yardımcı fiil gerekir / **E** edilgen yapı ister ve edilgen yapı ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The report ---- by Friday, and the results ---- to the committee on Monday.$q$, array[$o$has to finish / will be presented$o$, $o$has to be finished / presents$o$, $o$has finished / will present$o$, $o$has to be finished / will be presented$o$, $o$must finish / are presenting$o$], 3, $e$1. Modal edilgen yapı **has to be + V3** ile kurulur: **has to be finished**.
2. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be presented**.

Diğer şıklar: **A** report edilgen yapı ister / **B** results edilgen yapı ister / **C** edilgen yapı ister ve results edilgen yapı ister / **E** report edilgen yapı ister ve results edilgen yapı ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The injured ---- to hospital by ambulance, and they ---- by the best doctors in the city.$q$, array[$o$were taken / are being treated$o$, $o$took / are being treated$o$, $o$were taken / are treating$o$, $o$were taking / treat$o$, $o$have taken / were treating$o$], 0, $e$1. Edilgen geçmiş **was/were + V3** ile kurulur: **were taken**.
2. Sürmekte olan eylem edilgen sürekli yapı ile söylenir: **are being treated**.

Diğer şıklar: **B** injured edilgen yapı ister / **C** they edilgen yapı ister / **D** edilgen yapı ister ve they edilgen yapı ister / **E** geçmişte bir olay anlatılıyor ve they edilgen yapı ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The thief ---- by the police last night, and he ---- of stealing the jewels.$q$, array[$o$arrested / is accused$o$, $o$was arrested / accuses$o$, $o$has arrested / is accusing$o$, $o$is arrested / accused$o$, $o$was arrested / is accused$o$], 4, $e$1. **Last night** geçmiş edilgen yapı ister: **was arrested**.
2. Şimdiki suçlama edilgen Present Simple ile söylenir: **is accused**.

Diğer şıklar: **A** thief edilgen yapı ister / **B** he edilgen yapı ister / **C** edilgen yapı ister ve he edilgen yapı ister / **D** last night geçmiştir ve edilgen yapı ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He is said ---- a fortune last year, and he is believed ---- millions of pounds by now.$q$, array[$o$making / to have earned$o$, $o$to have made / to have earned$o$, $o$to have made / earning$o$, $o$to make / to earn$o$, $o$made / earned$o$], 1, $e$1. Geçmişteki eylem **to have + V3** ile verilir: **to have made**.
2. **By now** perfect infinitive ister: **to have earned**.

Diğer şıklar: **A** said edilgen yapıda to-infinitive ister / **C** believed edilgen yapıda to-infinitive ister / **D** geçmiş için perfect infinitive gerekir ve by now için perfect infinitive gerekir / **E** said edilgen yapıda to-infinitive ister ve believed edilgen yapıda to ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The cake ---- by my mother, and the table ---- by the time the guests arrive.$q$, array[$o$made / will have been set$o$, $o$was made / will set$o$, $o$was making / will be set$o$, $o$was made / will have been set$o$, $o$has made / has been set$o$], 3, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was made**.
2. **By the time** gelecek tamamlanma ister: **will have been set**.

Diğer şıklar: **A** cake edilgen yapı ister / **B** table edilgen yapı ister / **C** edilgen yapı ister ve by the time Future Perfect Passive ister / **E** edilgen yapı ister ve by the time gelecek zaman ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The windows ---- every week, and the floor ---- twice a month.$q$, array[$o$clean / is polished$o$, $o$are cleaned / polishes$o$, $o$cleaned / polishing$o$, $o$are cleaning / is polishing$o$, $o$are cleaned / is polished$o$], 4, $e$1. Düzenli tekrar edilgen Present Simple ile söylenir: **are cleaned**.
2. Tekil özne is ister: **is polished**.

Diğer şıklar: **A** windows edilgen yapı ister / **B** floor edilgen yapı ister / **C** çekimli yardımcı fiil gerekir ve edilgen yapı ister / **D** edilgen yapı ister ve edilgen yapı ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$We had the roof ---- last month, and we are going to have the windows ---- soon.$q$, array[$o$repaired / replaced$o$, $o$repair / replaced$o$, $o$repaired / replace$o$, $o$repairing / replacing$o$, $o$to repair / to replace$o$], 0, $e$1. **Have + nesne + V3** yaptırma anlamı verir: **repaired**.
2. Aynı kurala göre: **replaced**.

Diğer şıklar: **B** have + nesne + V3 ister / **C** have + nesne + V3 ister / **D** have + nesne + V3 ister ve have + nesne + V3 ister / **E** have + nesne + V3 ister ve have + nesne + V3 ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The children ---- to play near the river, and they ---- to stay inside after dark.$q$, array[$o$do not allow / are told$o$, $o$are not allowed / tell$o$, $o$are not allowed / are told$o$, $o$are not allowing / telling$o$, $o$have not allowed / are telling$o$], 2, $e$1. Edilgen yapı **are + not + V3** ile kurulur: **are not allowed**.
2. Aynı kurala göre: **are told**.

Diğer şıklar: **A** children edilgen yapı ister / **B** they edilgen yapı ister / **D** children edilgen yapı ister ve they edilgen yapı ister / **E** children edilgen yapı ister ve they edilgen yapı ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The old castle is believed ---- by a French architect, and it ---- as a prison before it became a museum.$q$, array[$o$to design / was used$o$, $o$to have been designed / used$o$, $o$designing / was using$o$, $o$to have been designed / was used$o$, $o$to be designed / had used$o$], 3, $e$1. Geçmişteki edilgen eylem **to have been + V3** ile verilir: **to have been designed**.
2. Geçmiş edilgen yapı **was + V3** ile kurulur: **was used**.

Diğer şıklar: **A** castle edilgen anlam ister / **B** castle edilgen yapı ister / **C** believed edilgen yapıda to-infinitive ister ve edilgen yapı ister / **E** geçmişteki eylem perfect infinitive ister ve edilgen yapı ister.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The patient needs ---- immediately, and the wound must ---- carefully before it gets infected.$q$, array[$o$operating / be cleaned$o$, $o$to be operated on / to clean$o$, $o$to operate on / cleaning$o$, $o$operated / cleaned$o$, $o$to be operated on / be cleaned$o$], 4, $e$1. **Need to be + V3** edilgen anlam verir: **to be operated on**.
2. **Must be + V3** modal edilgen yapıdır: **be cleaned**.

Diğer şıklar: **A** need + gerund edilgen anlam taşır, on edatı gerekir / **B** wound edilgen yapı ister / **C** hasta işlemi yapan değil, uğrayandır ve wound edilgen yapı ister / **D** need sonrasında to be gerekir ve must sonrasında yalın fiil gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$He hates ---- at in public, and he was annoyed at ---- that he had to wait for another hour.$q$, array[$o$to laugh / being told$o$, $o$being laughed / to tell$o$, $o$being laughed / being told$o$, $o$laughing / telling$o$, $o$having laughed / having told$o$], 2, $e$1. **Hate** sonrasında edilgen gerund **being + V3** ile verilir: **being laughed**.
2. **At** edatından sonra edilgen gerund gelir: **being told**.

Diğer şıklar: **A** hate sonrasında edilgen gerund gelir / **B** at edatından sonra gerund gelir / **D** edilgen anlam gerekir ve edilgen anlam gerekir / **E** edilgen anlam gerekir ve edilgen anlam gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$By the time the rescuers arrived, the villagers ---- from the flood, and the cows ---- out of the barns.$q$, array[$o$had rescued / were being led$o$, $o$had been rescued / were being led$o$, $o$had been rescued / led$o$, $o$were rescued / were leading$o$, $o$have been rescued / had led$o$], 1, $e$1. **By the time** ile Past Perfect Passive gerekir: **had been rescued**.
2. Süren eylem Past Continuous Passive ile söylenir: **were being led**.

Diğer şıklar: **A** villagers edilgen yapı ister / **C** cows edilgen yapı ister / **D** by the time ile Past Perfect gerekir ve edilgen yapı ister / **E** geçmişteki bir an anlatılıyor ve edilgen yapı ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The new bridge is expected ---- by next spring, and the old one ---- down in the summer.$q$, array[$o$to be completed / will be pulled$o$, $o$to complete / will be pulled$o$, $o$to be completed / pulls$o$, $o$completing / will pull$o$, $o$completed / is pulling$o$], 0, $e$1. **Expect** edilgen yapıda **to be + V3** ister: **to be completed**.
2. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be pulled**.

Diğer şıklar: **B** edilgen anlam gerekir / **C** old one edilgen yapı ister / **D** expect sonrasında to-infinitive gelir ve old one edilgen yapı ister / **E** expect sonrasında to be gerekir ve old one edilgen yapı ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It is thought that the manuscript ---- by a monk in the 12th century, and nobody knows who ---- the final pages.$q$, array[$o$wrote / added$o$, $o$was written / was added$o$, $o$has written / is adding$o$, $o$is written / had been added$o$, $o$was written / added$o$], 4, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was written**.
2. **Who** özne olduğundan etken yapı gelir: **added**.

Diğer şıklar: **A** manuscript edilgen yapı ister / **B** who sorusunda özne etken yapı ister / **C** manuscript edilgen yapı ister ve geçmiş etken yapı gerekir / **D** 12th century geçmiştir ve who sorusunda özne etken yapı ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The accident ---- on the motorway last night, and two people ---- seriously in the crash.$q$, array[$o$was happened / were injured$o$, $o$happened / injured$o$, $o$happened / were injured$o$, $o$was happening / are injured$o$, $o$has been happened / have injured$o$], 2, $e$1. **Happen** geçişsiz fiildir ve edilgen olmaz: **happened**.
2. Geçmiş edilgen yapı **were + V3** ile kurulur: **were injured**.

Diğer şıklar: **A** happen geçişsiz fiildir, edilgen olmaz / **B** two people edilgen yapı ister / **D** geçmişte bitmiş bir olay anlatılıyor ve last night geçmiştir / **E** happen edilgen olmaz ve two people edilgen yapı ister.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Passive Voice konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Passive Voice konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The room ---- every day, and the beds ---- by a maid in the morning.$q$, array[$o$cleans / are made$o$, $o$is cleaned / make$o$, $o$is cleaning / made$o$, $o$is cleaned / are made$o$, $o$cleaned / are making$o$], 3, $e$1. Düzenli tekrar edilgen Present Simple ile söylenir: **is cleaned**.
2. Çoğul özne are ister: **are made**.

Diğer şıklar: **A** room edilgen yapı ister / **B** beds edilgen yapı ister / **C** room edilgen yapı ister ve çekimli yardımcı fiil gerekir / **E** çekimli yardımcı fiil gerekir ve beds edilgen yapı ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$A new hospital ---- in our town last year, and it ---- by the mayor in May.$q$, array[$o$was built / was opened$o$, $o$built / was opened$o$, $o$was built / opened$o$, $o$has built / has opened$o$, $o$is built / is opened$o$], 0, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was built**.
2. Aynı kurala göre: **was opened**.

Diğer şıklar: **B** hospital edilgen yapı ister / **C** it edilgen yapı ister / **D** hospital edilgen yapı ister ve it edilgen yapı ister / **E** last year geçmiştir ve in May geçmiştir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$These shoes ---- in Italy, and they ---- all over Europe.$q$, array[$o$make / are sold$o$, $o$are made / sell$o$, $o$are made / are sold$o$, $o$made / sold$o$, $o$are making / are selling$o$], 2, $e$1. Genel durum edilgen Present Simple ile söylenir: **are made**.
2. Aynı kurala göre: **are sold**.

Diğer şıklar: **A** shoes edilgen yapı ister / **B** they edilgen yapı ister / **D** çekimli yardımcı fiil gerekir ve çekimli yardımcı fiil gerekir / **E** shoes edilgen yapı ister ve they edilgen yapı ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The students ---- the results tomorrow, so they ---- to wait until then.$q$, array[$o$will give / have$o$, $o$will be given / are had$o$, $o$give / having$o$, $o$are giving / has$o$, $o$will be given / have$o$], 4, $e$1. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be given**.
2. **Have to** edilgen olmaz: **have**.

Diğer şıklar: **A** students edilgen yapı ister / **B** have to kalıbı edilgen olmaz / **C** students edilgen yapı ister ve have to kalıbı gerekir / **D** students edilgen yapı ister ve students çoğul öznedir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The film ---- by millions of people, and it ---- an Oscar last year.$q$, array[$o$has been seen / won$o$, $o$has seen / won$o$, $o$has been seen / was won$o$, $o$sees / has been won$o$, $o$is seeing / wins$o$], 0, $e$1. **Film** edilgen Present Perfect ile söylenir: **has been seen**.
2. **Win** burada etken kullanılır: **won**.

Diğer şıklar: **B** film edilgen yapı ister / **C** win aktif kullanılır, nesne Oscar'dır / **D** film edilgen yapı ister ve özne film etken yapı ister / **E** film edilgen yapı ister ve last year geçmiştir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The manager asked for the documents ---- immediately, and he ordered the hall ---- for the meeting.$q$, array[$o$to send / to be prepared$o$, $o$to be sent / to be prepared$o$, $o$to be sent / preparing$o$, $o$sending / prepared$o$, $o$sent / to prepare$o$], 1, $e$1. Nesne edilgen ise **to be + V3** gelir: **to be sent**.
2. Aynı kurala göre: **to be prepared**.

Diğer şıklar: **A** documents edilgen anlam ister / **C** order + nesne edilgen to be + V3 ister / **D** ask for + nesne sonrasında to be + V3 gelir ve order sonrasında to be gerekir / **E** ask for + nesne sonrasında to be gerekir ve hall edilgen anlam ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I ---- a postcard by my cousin last week, and a gift ---- to me from Spain too.$q$, array[$o$sent / was brought$o$, $o$was sent / brought$o$, $o$was sent / was brought$o$, $o$have sent / has brought$o$, $o$am sent / is brought$o$], 2, $e$1. Çift nesneli fiilde kişi özne olabilir: **was sent**.
2. Aynı geçmiş edilgen yapı sürer: **was brought**.

Diğer şıklar: **A** özne I edilgen yapı ister / **B** gift edilgen yapı ister / **D** last week ile Present Perfect olmaz ve gift edilgen yapı ister / **E** last week geçmiştir ve geçmiş anlatım gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The house ---- while we were away, and a lot of valuable things ----.$q$, array[$o$was broken into / were taken$o$, $o$broke into / were taken$o$, $o$was broken into / took$o$, $o$was broken / was taken$o$, $o$had broken into / were taking$o$], 0, $e$1. Birleşik fiil edilgende bütün kalır: **was broken into**.
2. Çoğul özne were ister: **were taken**.

Diğer şıklar: **B** house edilgen yapı ister / **C** things edilgen yapı ister / **D** break into birleşik fiildir, into gerekir ve things çoğuldur / **E** house edilgen yapı ister ve edilgen yapı ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Smoking ---- in hospitals, and visitors ---- to switch off their mobile phones.$q$, array[$o$does not allow / are asked$o$, $o$is not allowed / are asked$o$, $o$is not allowed / ask$o$, $o$is not allowing / asked$o$, $o$has not allowed / are asking$o$], 1, $e$1. Genel kural edilgen Present Simple ile söylenir: **is not allowed**.
2. Aynı kurala göre: **are asked**.

Diğer şıklar: **A** smoking edilgen yapı ister / **C** visitors edilgen yapı ister / **D** smoking edilgen yapı ister ve çekimli yardımcı fiil gerekir / **E** smoking edilgen yapı ister ve visitors edilgen yapı ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$A new species of bird ---- recently in the rainforest, and its habitat ---- by loggers.$q$, array[$o$has discovered / is being destroyed$o$, $o$has been discovered / destroys$o$, $o$discovered / is destroying$o$, $o$has been discovered / is being destroyed$o$, $o$is discovering / has destroyed$o$], 3, $e$1. **Recently** Present Perfect Passive ister: **has been discovered**.
2. Süren eylem edilgen sürekli yapı ile söylenir: **is being destroyed**.

Diğer şıklar: **A** species edilgen yapı ister / **B** habitat edilgen yapı ister / **C** recently Present Perfect ister ve habitat edilgen yapı ister / **E** species edilgen yapı ister ve habitat edilgen yapı ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The tennis match ---- because of the rain, so the players ---- to come back on Sunday.$q$, array[$o$called off / were told$o$, $o$was called off / told$o$, $o$was calling off / were telling$o$, $o$has called off / have told$o$, $o$was called off / were told$o$], 4, $e$1. Birleşik fiil edilgende bütün kalır: **was called off**.
2. Edilgen yapı **were + V3** ile kurulur: **were told**.

Diğer şıklar: **A** match edilgen yapı ister / **B** players edilgen yapı ister / **C** match edilgen yapı ister ve players edilgen yapı ister / **D** match edilgen yapı ister ve players edilgen yapı ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The prisoner is said ---- from the jail last night, and the police are believed ---- his tracks.$q$, array[$o$to escape / to be following$o$, $o$to have escaped / to be following$o$, $o$to have escaped / following$o$, $o$escaping / to follow$o$, $o$escaped / follow$o$], 1, $e$1. Geçmişteki eylem **to have + V3** ile verilir: **to have escaped**.
2. Süren eylem **to be + V-ing** ile verilir: **to be following**.

Diğer şıklar: **A** last night için perfect infinitive gerekir / **C** believed edilgen yapıda to-infinitive ister / **D** said edilgen yapıda to-infinitive ister ve süren eylem için to be + V-ing gerekir / **E** said edilgen yapıda to ister ve believed sonrasında to gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The children were warned ---- the river, and the boy was punished for ---- the rule.$q$, array[$o$not crossing / breaking$o$, $o$not to cross / to break$o$, $o$to not cross / break$o$, $o$not to cross / breaking$o$, $o$don't cross / broke$o$], 3, $e$1. **Be warned** sonrasında olumsuz to-infinitive gelir: **not to cross**.
2. **For** edatından sonra gerund gelir: **breaking**.

Diğer şıklar: **A** warn edilgen yapıda to-infinitive ister / **B** for edatından sonra gerund gelir / **C** olumsuzluk not to ile kurulur ve for edatından sonra gerund gelir / **E** warn edilgen yapıda to-infinitive ister ve for edatından sonra gerund gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The meeting ---- to last about two hours, but it ---- for nearly five.$q$, array[$o$expected / went on$o$, $o$was expected / was gone on$o$, $o$was expecting / was going on$o$, $o$has expected / goes on$o$, $o$was expected / went on$o$], 4, $e$1. Edilgen yapı **was + V3** ile kurulur: **was expected**.
2. **Go on** edilgen olmaz: **went on**.

Diğer şıklar: **A** meeting edilgen yapı ister / **B** go on edilgen olmaz / **C** edilgen yapı ister ve but ile geçmiş sonuç gerekir / **D** edilgen yapı ister ve geçmiş anlatım gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$They have their car ---- every year, and they had the engine ---- last month.$q$, array[$o$serviced / checked$o$, $o$service / checked$o$, $o$serviced / check$o$, $o$servicing / checking$o$, $o$to service / to check$o$], 0, $e$1. **Have + nesne + V3** yaptırma anlamı verir: **serviced**.
2. Aynı kurala göre: **checked**.

Diğer şıklar: **B** have + nesne + V3 ister / **C** have + nesne + V3 ister / **D** have + nesne + V3 ister ve have + nesne + V3 ister / **E** have + nesne + V3 ister ve have + nesne + V3 ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The painting, ---- to be worth millions, ---- from the museum last week, but it has not been found yet.$q$, array[$o$believing / was stolen$o$, $o$believed / stole$o$, $o$believed / was stolen$o$, $o$to believe / has stolen$o$, $o$having believed / was stealing$o$], 2, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** ile verilir: **believed**.
2. Geçmiş edilgen yapı **was + V3** ile kurulur: **was stolen**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** painting edilgen yapı ister / **D** sıfat işlevi yok ve painting edilgen yapı ister / **E** edilgen anlam V-ed ister ve painting edilgen yapı ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The fire ---- in the kitchen at midnight, and several families ---- from their homes since then.$q$, array[$o$was broken out / have been evacuated$o$, $o$broke out / have evacuated$o$, $o$was breaking out / evacuated$o$, $o$had been broken out / are evacuated$o$, $o$broke out / have been evacuated$o$], 4, $e$1. **Break out** geçişsiz birleşik fiildir, edilgen olmaz: **broke out**.
2. **Since then** Present Perfect Passive ister: **have been evacuated**.

Diğer şıklar: **A** break out edilgen olmaz / **B** families edilgen yapı ister / **C** geçmişte bitmiş olay ve since then Present Perfect ister / **D** break out edilgen olmaz ve since then şimdiye uzanır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The Great Wall ---- over many centuries by different dynasties, and it ---- by millions of tourists every year.$q$, array[$o$built / is visited$o$, $o$was built / is visited$o$, $o$was built / visits$o$, $o$has built / is visiting$o$, $o$is building / visited$o$], 1, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was built**.
2. Düzenli tekrar edilgen Present Simple ile söylenir: **is visited**.

Diğer şıklar: **A** wall edilgen yapı ister / **C** it edilgen yapı ister / **D** wall edilgen yapı ister ve it edilgen yapı ister / **E** wall edilgen yapı ister ve every year düzenli tekrarı gösterir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The goods ---- to have been damaged during transport, so the company ---- to compensate the customers.$q$, array[$o$says / is required$o$, $o$are said / requires$o$, $o$are said / is required$o$, $o$are saying / is requiring$o$, $o$were said to / has required$o$], 2, $e$1. Haber verme edilgen yapısı **are said to** ile kurulur: **are said**.
2. Zorunluluk edilgen yapıda **is required to** ile söylenir: **is required**.

Diğer şıklar: **A** goods edilgen yapı ister / **B** company edilgen yapı ister / **D** goods edilgen yapı ister ve company edilgen yapı ister / **E** said edilgen yapı ister ve company edilgen yapı ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The employees ---- of the changes yesterday, but nobody ---- them what the new rules were.$q$, array[$o$informed / told$o$, $o$were informed / was told$o$, $o$had informed / has been told$o$, $o$were informed / told$o$, $o$were informing / is telling$o$], 3, $e$1. Edilgen yapı **were + V3** ile kurulur: **were informed**.
2. **Nobody** özne olduğundan etken yapı gelir: **told**.

Diğer şıklar: **A** employees edilgen yapı ister / **B** nobody özne olduğundan etken yapı gelir / **C** employees edilgen yapı ister ve nobody özne olduğundan etken yapı gelir / **E** employees edilgen yapı ister ve yesterday geçmiş zaman ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Passive Voice konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Passive Voice konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$English ---- in many countries, and it ---- by more than a billion people.$q$, array[$o$is taught / is spoken$o$, $o$teaches / is spoken$o$, $o$is taught / speaks$o$, $o$is teaching / is speaking$o$, $o$taught / spoken$o$], 0, $e$1. Genel durum edilgen Present Simple ile söylenir: **is taught**.
2. Aynı kurala göre: **is spoken**.

Diğer şıklar: **B** English edilgen yapı ister / **C** it edilgen yapı ister / **D** English edilgen yapı ister ve it edilgen yapı ister / **E** çekimli yardımcı fiil gerekir ve çekimli yardımcı fiil gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The thief ---- by a policeman, and the stolen money ---- yesterday.$q$, array[$o$caught / was found$o$, $o$was caught / was found$o$, $o$was caught / found$o$, $o$has caught / has found$o$, $o$is caught / finds$o$], 1, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was caught**.
2. Aynı kurala göre: **was found**.

Diğer şıklar: **A** thief edilgen yapı ister / **C** money edilgen yapı ister / **D** thief edilgen yapı ister ve yesterday ile Present Perfect olmaz / **E** geçmiş anlatım gerekir ve geçmiş anlatım gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$A new road ---- at the moment, so traffic ---- to use other streets.$q$, array[$o$has been building / has been forced$o$, $o$is being built / forced$o$, $o$was being built / is forcing$o$, $o$will be building / forces$o$, $o$is being built / has been forced$o$], 4, $e$1. **At the moment** edilgen sürekli yapı ister: **is being built**.
2. Sonuç şimdiyi etkiler: **has been forced**.

Diğer şıklar: **A** road edilgen yapı ister / **B** traffic edilgen yapı ister / **C** at the moment şu anı gösterir ve traffic edilgen yapı ister / **D** road edilgen yapı ister ve traffic edilgen yapı ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The tickets ---- online, and the confirmation email ---- within a few minutes.$q$, array[$o$can be bought / will be sent$o$, $o$can buy / will be sent$o$, $o$can be bought / will send$o$, $o$buy / sends$o$, $o$can be buying / is sending$o$], 0, $e$1. Modal edilgen yapı **can be + V3** ile kurulur: **can be bought**.
2. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be sent**.

Diğer şıklar: **B** tickets edilgen yapı ister / **C** email edilgen yapı ister / **D** tickets edilgen yapı ister ve email edilgen yapı ister / **E** tickets edilgen yapı ister ve email edilgen yapı ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The house ---- in 1950, and it ---- since then.$q$, array[$o$built / has been repaired$o$, $o$was built / repaired$o$, $o$was built / has been repaired$o$, $o$has built / was repaired$o$, $o$is built / is repaired$o$], 2, $e$1. **In 1950** geçmiş edilgen yapı ister: **was built**.
2. **Since then** Present Perfect Passive ister: **has been repaired**.

Diğer şıklar: **A** house edilgen yapı ister / **B** since then Present Perfect Passive ister / **D** house edilgen yapı ister ve since then şimdiye uzanır / **E** in 1950 geçmiştir ve since then şimdiye uzanır.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The singer ---- by thousands of fans at the airport, and she ---- with flowers.$q$, array[$o$welcomed / was greeted$o$, $o$was welcomed / greeted$o$, $o$has welcomed / has greeted$o$, $o$was welcomed / was greeted$o$, $o$is welcomed / is greeted$o$], 3, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was welcomed**.
2. Aynı kurala göre: **was greeted**.

Diğer şıklar: **A** singer edilgen yapı ister / **B** she edilgen yapı ister / **C** singer edilgen yapı ister ve she edilgen yapı ister / **E** geçmiş anlatım gerekir ve geçmiş anlatım gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The room ---- when we arrived, and the table ---- for dinner.$q$, array[$o$was cleaned / was being laid$o$, $o$had been cleaned / was being laid$o$, $o$had been cleaned / laid$o$, $o$cleaned / had laid$o$, $o$has been cleaned / has been laid$o$], 1, $e$1. Önce biten eylem Past Perfect Passive ile söylenir: **had been cleaned**.
2. Süren eylem Past Continuous Passive ile söylenir: **was being laid**.

Diğer şıklar: **A** when we arrived öncesini gösterir, Past Perfect gerekir / **C** table edilgen yapı ister / **D** room edilgen yapı ister ve table edilgen yapı ister / **E** geçmiş anlatım gerekir ve süren eylem anlatılıyor.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He doesn't like ---- told what to do, and he refused ---- orders from his younger colleague.$q$, array[$o$to be / to take$o$, $o$being / taking$o$, $o$be / take$o$, $o$been / taken$o$, $o$being / to take$o$], 4, $e$1. **Like** sonrasında edilgen gerund **being + V3** ile verilir: **being**.
2. **Refuse** sonrasında to-infinitive gelir: **to take**.

Diğer şıklar: **A** like sonrasında edilgen gerund gelir / **B** refuse sonrasında to-infinitive gelir / **C** like sonrasında edilgen gerund gelir ve refuse sonrasında to gerekir / **D** like sonrasında edilgen gerund gelir ve refuse sonrasında to-infinitive gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The accident ---- by a sudden fog, and the drivers ---- to slow down.$q$, array[$o$was caused / were advised$o$, $o$caused / were advised$o$, $o$was caused / advised$o$, $o$has caused / were advising$o$, $o$is caused / have advised$o$], 0, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was caused**.
2. Aynı kurala göre: **were advised**.

Diğer şıklar: **B** accident edilgen yapı ister / **C** drivers edilgen yapı ister / **D** accident edilgen yapı ister ve drivers edilgen yapı ister / **E** geçmiş anlatım gerekir ve drivers edilgen yapı ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Nothing ---- since the meeting ended, so the problem ---- unsolved.$q$, array[$o$has done / remains$o$, $o$has been done / is remained$o$, $o$is done / is remaining$o$, $o$has been done / remains$o$, $o$was done / remained$o$], 3, $e$1. **Since** Present Perfect Passive ister: **has been done**.
2. **Remain** geçişsiz fiildir, edilgen olmaz: **remains**.

Diğer şıklar: **A** nothing edilgen yapı ister / **B** remain geçişsiz fiildir / **C** since Present Perfect ister ve remains kalıbı daha uygundur / **E** since şimdiye uzanır ve Present Perfect bağlamı şimdiyi gösterir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The invitation ---- to over a hundred guests, but only fifty ----.$q$, array[$o$sent / came$o$, $o$was sent / were come$o$, $o$has sent / were coming$o$, $o$is sent / had been come$o$, $o$was sent / came$o$], 4, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was sent**.
2. **Come** geçişsiz fiildir, edilgen olmaz: **came**.

Diğer şıklar: **A** invitation edilgen yapı ister / **B** come geçişsiz fiildir / **C** invitation edilgen yapı ister ve but ile geçmiş sonuç gerekir / **D** geçmiş anlatım gerekir ve come geçişsiz fiildir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He was made ---- the room, and he was seen ---- to his friend in the corridor.$q$, array[$o$leave / talking$o$, $o$to leave / to talk$o$, $o$to leave / talking$o$, $o$leaving / talk$o$, $o$left / talked$o$], 2, $e$1. **Be made** sonrasında to-infinitive gelir: **to leave**.
2. **Be seen** sonrasında süreç **V-ing** ile verilir: **talking**.

Diğer şıklar: **A** make edilgen yapıda to-infinitive ister / **B** see edilgen yapıda süreç V-ing ile verilir / **D** make edilgen yapıda to-infinitive ister ve see edilgen yapıda yalın fiil kullanılmaz / **E** make edilgen yapıda to-infinitive ister ve see edilgen yapıda V-ing ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$All the passengers ---- to fasten their seat belts, and smoking ---- during the flight.$q$, array[$o$asked / is forbidden$o$, $o$were asked / forbids$o$, $o$asking / is forbidding$o$, $o$were asked / is forbidden$o$, $o$were asking / forbidden$o$], 3, $e$1. Edilgen yapı **were + V3** ile kurulur: **were asked**.
2. Tekil özne is ister: **is forbidden**.

Diğer şıklar: **A** passengers edilgen yapı ister / **B** smoking edilgen yapı ister / **C** passengers edilgen yapı ister ve smoking edilgen yapı ister / **E** passengers edilgen yapı ister ve çekimli yardımcı fiil gerekir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The orders ---- by the end of the week, and the customers ---- as soon as the goods are ready.$q$, array[$o$will deliver / will be informed$o$, $o$will have been delivered / will be informed$o$, $o$will have been delivered / will inform$o$, $o$are delivered / inform$o$, $o$have delivered / informed$o$], 1, $e$1. **By the end of the week** Future Perfect Passive ister: **will have been delivered**.
2. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be informed**.

Diğer şıklar: **A** orders edilgen yapı ister / **C** customers edilgen yapı ister / **D** by the end of the week gelecek tamamlanmayı gösterir ve customers edilgen yapı ister / **E** orders edilgen yapı ister ve çekimli yardımcı fiil gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The project is reported ---- by a private company, and the building work is expected ---- by the end of the year.$q$, array[$o$to be financed / to be finished$o$, $o$to finance / to be finished$o$, $o$to be financed / to finish$o$, $o$financing / finishing$o$, $o$financed / finished$o$], 0, $e$1. Nesne edilgen ise **to be + V3** gelir: **to be financed**.
2. Aynı kurala göre: **to be finished**.

Diğer şıklar: **B** project edilgen anlam ister / **C** building work edilgen anlam ister / **D** reported edilgen yapıda to-infinitive ister ve expect edilgen yapıda to-infinitive ister / **E** reported sonrasında to be gerekir ve expected sonrasında to be gerekir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Nobody likes ---- by strangers, so the guide made sure the tourists ---- in a group at all times.$q$, array[$o$to photograph / were kept$o$, $o$being photographed / kept$o$, $o$being photographed / were kept$o$, $o$photographing / kept$o$, $o$photographed / had kept$o$], 2, $e$1. **Like** sonrasında edilgen gerund **being + V3** ile verilir: **being photographed**.
2. Edilgen yan cümle **were + V3** ile kurulur: **were kept**.

Diğer şıklar: **A** like sonrasında edilgen gerund gelir / **B** tourists edilgen yapı ister / **D** edilgen anlam gerekir ve made sure sonrasında yan cümle gelir / **E** like sonrasında being gerekir ve tourists edilgen yapı ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The bill, ---- by the committee last week, will be voted on tomorrow, and the amendments ---- by the opposition will be discussed first.$q$, array[$o$approving / proposed$o$, $o$approved / proposed$o$, $o$approved / proposing$o$, $o$approve / propose$o$, $o$having approved / to propose$o$], 1, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** ile verilir: **approved**.
2. Aynı kurala göre: **proposed**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **C** edilgen anlam V-ed ister / **D** edilgen anlam V-ed ister ve edilgen anlam V-ed ister / **E** edilgen anlam V-ed ister ve edilgen anlam V-ed ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The company's decision ---- as a mistake by most analysts, and several experts ---- that it will soon be reversed.$q$, array[$o$criticised / predict$o$, $o$was criticised / are predicted$o$, $o$has criticised / were predicting$o$, $o$is criticising / have been predicted$o$, $o$was criticised / predict$o$], 4, $e$1. Edilgen yapı **was + V3** ile kurulur: **was criticised**.
2. **Experts** özne olduğundan etken yapı gelir: **predict**.

Diğer şıklar: **A** decision edilgen yapı ister / **B** experts özne etken yapı ister / **C** decision edilgen yapı ister ve that cümlesi şimdiki beklenti anlatır / **D** decision edilgen yapı ister ve experts özne etken yapı ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The stolen paintings, ---- by the police at the border, are now ---- in a secure room until the trial.$q$, array[$o$seizing / being kept$o$, $o$seized / keeping$o$, $o$seized / being kept$o$, $o$seize / kept$o$, $o$having seized / been kept$o$], 2, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** ile verilir: **seized**.
2. Süren edilgen eylem **being + V3** ile verilir: **being kept**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** are now sonrasında edilgen sürekli yapı gerekir / **D** edilgen anlam V-ed ister ve şu an süren eylem being ister / **E** edilgen anlam V-ed ister ve şu an süren eylem being ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It ---- that the minister ---- the report before it was published, but he has strongly denied it.$q$, array[$o$alleges / read$o$, $o$is alleged / was read$o$, $o$is alleging / has read$o$, $o$is alleged / read$o$, $o$has alleged / had been read$o$], 3, $e$1. **It is alleged that...** kalıbı edilgendir: **is alleged**.
2. **Minister** özne olduğundan etken yapı gelir: **read**.

Diğer şıklar: **A** it ile edilgen yapı gerekir / **B** minister etken özne ister / **C** it ile edilgen yapı gerekir ve geçmişte bir olay anlatılıyor / **E** it ile edilgen yapı gerekir ve minister etken özne ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Pronouns konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Pronouns konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Pronouns$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$I forgot my umbrella, so my friend lent me ----, and she took ---- coat from the hook.$q$, array[$o$she / her own$o$, $o$hers / hers$o$, $o$her / she$o$, $o$hers / her own$o$, $o$herself / herself$o$], 3, $e$1. Sahiplik zamiri nesne olmadan **hers** olur: **hers**.
2. İsimden önce sahiplik sıfatı gelir: **her own**.

Diğer şıklar: **A** sahiplik zamiri gerekir / **B** coat önünde sıfat sahiplik gerekir / **C** sahiplik zamiri gerekir ve coat önünde sahiplik sıfatı gerekir / **E** sahiplik anlamı yoktur ve coat önünde sahiplik sıfatı gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The two brothers don't like ---- very much, and they never help ---- with homework.$q$, array[$o$together / one another$o$, $o$each other / together$o$, $o$each other / one another$o$, $o$them / them$o$, $o$each / each$o$], 2, $e$1. Karşılıklı eylem **each other** ile söylenir: **each other**.
2. Aynı anlam **one another** ile verilir: **one another**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** karşılıklı eylem one another ile söylenir / **D** karşılıklı eylem each other ile söylenir ve karşılıklı eylem one another ile söylenir / **E** nesne zamiri gerekir ve nesne zamiri gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$He cut ---- while he was shaving, and then he looked at ---- in the mirror.$q$, array[$o$him / himself$o$, $o$himself / him$o$, $o$his / his$o$, $o$itself / itself$o$, $o$himself / himself$o$], 4, $e$1. Özne ve nesne aynı kişi ise **himself** gelir: **himself**.
2. Aynı kurala göre: **himself**.

Diğer şıklar: **A** dönüşlü zamir gerekir / **B** dönüşlü zamir gerekir / **C** dönüşlü zamir gerekir ve dönüşlü zamir gerekir / **D** özne he ile uyumsuz ve özne he ile uyumsuz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Would you like ---- more tea? No, thanks. I don't want ---- else.$q$, array[$o$a / anything$o$, $o$some / anything$o$, $o$some / something$o$, $o$no / nothing$o$, $o$none / everything$o$], 1, $e$1. Teklif sorularında **some** kullanılır: **some**.
2. Olumsuz cümlede **anything** kullanılır: **anything**.

Diğer şıklar: **A** teklif sorusunda some kullanılır / **C** else ile any- zamiri olumsuz cümlede gelir / **D** teklif sorusunda some kullanılır ve olumsuz cümlede nothing kullanılmaz / **E** teklif sorusunda some kullanılır ve olumsuz cümlede anlam bozulur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$There are two exits, and ---- of them is closed, so we can use ---- one.$q$, array[$o$neither / either$o$, $o$none / either$o$, $o$neither / any$o$, $o$no / each$o$, $o$both / all$o$], 0, $e$1. İki varlıktan hiçbiri **neither** ile söylenir: **neither**.
2. İki varlıktan biri **either** ile söylenir: **either**.

Diğer şıklar: **B** iki varlık için neither kullanılır / **C** iki varlık için either kullanılır / **D** sonrasında isim gelmez ve sonrasında tek isim gerekir / **E** exit kapalı olamaz ve iki varlık için kullanılmaz.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I don't like this shirt. Could you show me a different ----? I like the two blue ---- on the shelf.$q$, array[$o$it / ones$o$, $o$one / one$o$, $o$another / it$o$, $o$one / ones$o$, $o$other / them$o$], 3, $e$1. Tekil sayılabilir isim yerine **one** kullanılır: **one**.
2. Çoğul isim yerine **ones** kullanılır: **ones**.

Diğer şıklar: **A** tekil sayılabilir isim yerine one gelir / **B** çoğul isim yerine ones gelir / **C** one olmadan kullanılmaz ve çoğul isim yerine ones gelir / **E** tek başına gelmez ve ones yerine kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- the students passed the exam, but ---- of them got full marks.$q$, array[$o$Almost / none$o$, $o$Most of / no$o$, $o$Few / any$o$, $o$Every / nobody$o$, $o$Most of / none$o$], 4, $e$1. **Most of** sonrasında belirli çoğul isim gelir: **Most of**.
2. **None of** sonrasında isim öbeği gelir: **none**.

Diğer şıklar: **A** of ile birlikte gelmez / **B** of ile birlikte gelmez / **C** anlam bozulur ve olumlu bağlamda anlam bozulur / **D** of ile birlikte gelmez ve of ile birlikte gelmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Neither of the answers ---- correct, and each of the students ---- a different explanation.$q$, array[$o$is / has$o$, $o$are / has$o$, $o$is / have$o$, $o$were / are having$o$, $o$have been / had been$o$], 0, $e$1. **Neither of** tekil fiil ister: **is**.
2. **Each of** tekil fiil ister: **has**.

Diğer şıklar: **B** neither of tekil fiil alır / **C** each of tekil fiil alır / **D** neither of tekil fiil alır ve each of tekil fiil alır / **E** neither of tekil fiil alır ve each of tekil fiil alır.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Everyone in the room felt ---- were being watched, but ---- could explain why.$q$, array[$o$he / nobody$o$, $o$they / nobody$o$, $o$they / anyone$o$, $o$it / somebody$o$, $o$we / everybody$o$], 1, $e$1. **Everyone** için sonraki zamir **they** olabilir: **they**.
2. Olumsuz özne **nobody** ile söylenir: **nobody**.

Diğer şıklar: **A** everyone için they kullanılır / **C** nobody ile olumsuzluk verilir / **D** insan için they kullanılır ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$She spoke so quietly that I could hardly hear ----, and she talked about ---- as if no one else mattered.$q$, array[$o$she / herself$o$, $o$her / she$o$, $o$hers / her$o$, $o$her / herself$o$, $o$herself / hers$o$], 3, $e$1. Özne farklı olduğundan nesne zamiri gelir: **her**.
2. Özne aynı kişi olduğundan dönüşlü zamir gelir: **herself**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** about sonrası dönüşlü zamir gerekir / **C** nesne zamiri gerekir ve özne aynı kişi olduğundan dönüşlü gerekir / **E** özne farklı kişi (I) olduğundan dönüşlü kullanılmaz ve about sonrası anlam bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The company has lost ---- best employees, and many of ---- are now working for its competitors.$q$, array[$o$it's / them$o$, $o$its / they$o$, $o$their / their$o$, $o$it / themselves$o$, $o$its / them$o$], 4, $e$1. Tekil kurum için sahiplik sıfatı **its** olur: **its**.
2. **Of** sonrasında nesne zamiri gelir: **them**.

Diğer şıklar: **A** sahiplik sıfatı gerekir / **B** of sonrası nesne zamiri gelir / **C** company tekil olarak its ister ve of sonrası nesne zamiri gelir / **D** sahiplik sıfatı gerekir ve of sonrası anlam bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I met a woman ---- husband works at the bank, and I know a man ---- sister is a famous singer.$q$, array[$o$who / whose$o$, $o$whose / whose$o$, $o$whose / who$o$, $o$whom / whom$o$, $o$which / which$o$], 1, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Aynı kurala göre: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **E** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Some of the tourists went hiking, ---- went sightseeing, and ---- stayed at the hotel.$q$, array[$o$the others / the rest$o$, $o$others / the rests$o$, $o$others / the rest$o$, $o$another / rest$o$, $o$other / others$o$], 2, $e$1. Belirsiz diğerleri **others** ile söylenir: **others**.
2. Kalan herkes **the rest** ile söylenir: **the rest**.

Diğer şıklar: **A** belirsiz bir grup için others kullanılır / **B** rest sayılamazdır / **D** çoğul grup için gelmez ve the ile gelir / **E** tek başına gelmez ve sınırlı kalan grup the rest ile söylenir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$If you can't find a cup, I'll bring you ---- one, and then you can have ---- cup of coffee.$q$, array[$o$other / another$o$, $o$another / other$o$, $o$the other / the other$o$, $o$another / another$o$, $o$others / others$o$], 3, $e$1. Ek bir tane için **another** kullanılır: **another**.
2. Aynı kurala göre: **another**.

Diğer şıklar: **A** one ile another kullanılır / **B** cup önünde another gelir / **C** belirli bir tane anlamı yok ve cup önünde another gelir / **E** tekil one ile uyumsuz ve cup tekildir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$It was ---- hot yesterday that we stayed indoors, and ---- a heat has not been recorded for years.$q$, array[$o$so / such$o$, $o$such / such$o$, $o$so / so$o$, $o$very / quite$o$, $o$too / very$o$], 0, $e$1. Tek sıfat öncesinde **so** gelir: **so**.
2. **Such a** + isim yapısı kurulur: **such**.

Diğer şıklar: **B** sıfat öncesi so gelir / **C** a + sıfat + isim öncesi such gelir / **D** that sonuç cümlesi so ister ve anlam bozulur / **E** that sonuç cümlesi so ister ve a heat önünde such gelir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$We should respect ---- opinions, even if they are different from ----.$q$, array[$o$other people / ours$o$, $o$other people's / our$o$, $o$other people's / ours$o$, $o$others people's / us$o$, $o$the other people / we$o$], 2, $e$1. Sahiplik **other people's** ile söylenir: **other people's**.
2. Nesnesiz sahiplik zamiri **ours** olur: **ours**.

Diğer şıklar: **A** sahiplik eki gerekir / **B** nesne olmadan sahiplik zamiri gerekir / **D** other çoğul eki almaz ve sahiplik anlamı yok / **E** anlam bozulur ve sahiplik anlamı yok.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The population of Istanbul is larger than ---- of Ankara, and the streets here are as crowded as ---- in London.$q$, array[$o$those / those$o$, $o$that / that$o$, $o$it / them$o$, $o$this / it$o$, $o$that / those$o$], 4, $e$1. Tekil isim yerine **that** kullanılır: **that**.
2. Çoğul isim yerine **those** kullanılır: **those**.

Diğer şıklar: **A** population tekildir / **B** streets çoğuldur / **C** of ile yapı bozulur ve sonrasında in London gelir / **D** belirsiz kalır ve streets çoğuldur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She is proud of ----, and she always speaks well of ---- who have helped her in the past.$q$, array[$o$herself / those$o$, $o$her / those$o$, $o$herself / them$o$, $o$she / whom$o$, $o$hers / whose$o$], 0, $e$1. Özne aynı kişi olduğundan dönüşlü zamir gelir: **herself**.
2. **Those who** kalıbı kullanılır: **those**.

Diğer şıklar: **B** özne aynı kişi, dönüşlü gerekir / **C** who ile birlikte those gelir / **D** of sonrası nesne ya da dönüşlü gerekir ve who öncesinde belirsiz zamir gerekir / **E** sahiplik zamiri anlam bozar ve who öncesinde belirsiz zamir gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He prefers working by ----, because he can't stand ---- looking over his shoulder.$q$, array[$o$him / anyone$o$, $o$himself / anyone$o$, $o$himself / no one$o$, $o$his own / none$o$, $o$itself / nobody$o$], 1, $e$1. **By himself** yalnız anlamı verir: **himself**.
2. Olumsuz cümlede **anyone** kullanılır: **anyone**.

Diğer şıklar: **A** by sonrası dönüşlü zamir gelir / **C** can't stand ile çift olumsuz olur / **D** by sonrası dönüşlü zamir gelir ve can't stand ile çift olumsuz olur / **E** özne he ile uyumsuz ve can't stand ile çift olumsuz olur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Of the two plans, ---- you choose will have to be approved by the board, and ---- the board decides will be final.$q$, array[$o$whoever / whatever$o$, $o$whichever / whoever$o$, $o$whichever / whatever$o$, $o$whomever / however$o$, $o$however / whenever$o$], 2, $e$1. Sınırlı seçeneklerden biri **whichever** ile söylenir: **whichever**.
2. Sınırsız seçenek **whatever** ile söylenir: **whatever**.

Diğer şıklar: **A** iki plan arasından seçim whichever ile söylenir / **B** karar verilen şey için whatever kullanılır / **D** insan zamiri plan için uygun değil ve zarftır / **E** zarftır ve zarftır.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Pronouns konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Pronouns konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Pronouns$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The teacher asked ---- of us to write ---- own essay.$q$, array[$o$every / our$o$, $o$each / us$o$, $o$each / our$o$, $o$all / we$o$, $o$everyone / ours$o$], 2, $e$1. **Each of us** ayrı ayrı her birini gösterir: **each**.
2. Sahiplik sıfatı **our** olur: **our**.

Diğer şıklar: **A** of ile each of kullanılır / **B** sahiplik sıfatı gerekir / **D** her bir anlamı için each gerekir ve sahiplik sıfatı gerekir / **E** of ile kullanılmaz ve own önünde sahiplik sıfatı gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I called Tom, but ---- answered, and I left ---- a message.$q$, array[$o$anybody / him$o$, $o$nobody / he$o$, $o$somebody / his$o$, $o$everybody / himself$o$, $o$nobody / him$o$], 4, $e$1. Cevap vermeme **nobody** ile söylenir: **nobody**.
2. Nesne zamiri **him** olur: **him**.

Diğer şıklar: **A** olumlu cümlede anlam bozulur / **B** nesne zamiri gerekir / **C** ama ile anlam çelişir ve nesne zamiri gerekir / **D** ama ile anlam çelişir ve özne farklı kişi.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$This isn't my book. ---- is on the desk, and the one over there is ----.$q$, array[$o$My / hers$o$, $o$Mine / hers$o$, $o$Mine / she$o$, $o$I / her$o$, $o$Me / herself$o$], 1, $e$1. Nesnesiz sahiplik zamiri **mine** olur: **Mine**.
2. Nesnesiz sahiplik zamiri **hers** olur: **hers**.

Diğer şıklar: **A** sahiplik zamiri gerekir / **C** sahiplik zamiri gerekir / **D** sahiplik zamiri gerekir ve sahiplik zamiri gerekir / **E** sahiplik zamiri gerekir ve sahiplik anlamı yoktur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$We enjoyed ---- very much at the party, and we thanked the host for ---- kindness.$q$, array[$o$us / his$o$, $o$ourselves / him$o$, $o$our / he$o$, $o$ourselves / his$o$, $o$we / himself$o$], 3, $e$1. **Enjoy oneself** kalıbıdır: **ourselves**.
2. İsimden önce sahiplik sıfatı gelir: **his**.

Diğer şıklar: **A** özne aynı kişi, dönüşlü gerekir / **B** sahiplik sıfatı gerekir / **C** nesne yerine dönüşlü gerekir ve sahiplik sıfatı gerekir / **E** özne zamiri fiil sonrasında gelmez ve sahiplik anlamı yoktur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$There is ---- in the fridge, so I'll have to go to the shop and buy ---- for dinner.$q$, array[$o$anything / something$o$, $o$nothing / anything$o$, $o$everything / nothing$o$, $o$anybody / nobody$o$, $o$nothing / something$o$], 4, $e$1. Boş buzdolabı **nothing** ile söylenir: **nothing**.
2. Olumlu amaç cümlesinde **something** kullanılır: **something**.

Diğer şıklar: **A** olumlu cümlede nothing anlamı verilir / **B** amaç cümlesinde something gelir / **C** anlam bozulur ve çift olumsuzluk olmaz / **D** nesne uygun değil ve nesne uygun değil.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The lecture was so boring that ---- of the students stayed awake, and ---- left before the end.$q$, array[$o$none / most$o$, $o$no / most$o$, $o$none / much$o$, $o$neither / little$o$, $o$every / each$o$], 0, $e$1. Hiçbirini **none of** ile söyleriz: **none**.
2. **Most of** sonrasında çoğul isim gelir: **most**.

Diğer şıklar: **B** sonrasında of ile kullanılmaz / **C** sayılabilir çoğul için many kullanılır / **D** ikiden çok varlık için kullanılmaz ve sayılabilir çoğul için few kullanılır / **E** sonrasında of ile kullanılmaz ve anlam bozulur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She is a friend of ----, and I have known ---- since we were children.$q$, array[$o$me / her$o$, $o$mine / her$o$, $o$mine / she$o$, $o$my / hers$o$, $o$I / herself$o$], 1, $e$1. **A friend of** sonrası sahiplik zamiri gelir: **mine**.
2. Nesne zamiri **her** olur: **her**.

Diğer şıklar: **A** a friend of sonrası sahiplik zamiri gelir / **C** nesne zamiri gerekir / **D** a friend of sonrası sahiplik zamiri gelir ve nesne zamiri gerekir / **E** a friend of sonrası sahiplik zamiri gelir ve özne farklı kişi.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$All three girls took part in the competition, but ---- of them won a prize, and ---- were disappointed.$q$, array[$o$neither / all$o$, $o$none / both$o$, $o$none / all$o$, $o$either / each$o$, $o$both / either$o$], 2, $e$1. İkiden çok kişiden hiçbiri **none** ile söylenir: **none**.
2. Üç kişi birlikte **all** ile söylenir: **all**.

Diğer şıklar: **A** ikiden çok varlık için none gerekir / **B** üç kişi için all gerekir / **D** ikiden çok varlık için none gerekir ve çoğul fiil were ile uyumsuz / **E** üç kişi için all gerekir ve olumsuz bağlamda kullanılmaz.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The man ---- you were talking to is my uncle, and the woman ---- sits next to him is my aunt.$q$, array[$o$whose / who$o$, $o$whom / whom$o$, $o$which / whose$o$, $o$whom / who$o$, $o$what / which$o$], 3, $e$1. Edat nesnesi insan için **whom** gelir: **whom**.
2. Özne insan için **who** gelir: **who**.

Diğer şıklar: **A** sahiplik anlamı yok / **B** özne olarak who gerekir / **C** insan için who/whom kullanılır ve sahiplik anlamı yok / **E** sıfat cümlesi kurmaz ve insan için who kullanılır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The children were told to behave ----, but ---- of them listened to the warning.$q$, array[$o$themselves / none$o$, $o$them / none$o$, $o$themselves / no$o$, $o$their / neither$o$, $o$they / nobody$o$], 0, $e$1. **Behave oneself** kalıbı kullanılır: **themselves**.
2. **None of** sonrası çoğul isim gelir: **none**.

Diğer şıklar: **B** dönüşlü zamir gerekir / **C** of ile kullanılmaz / **D** dönüşlü zamir gerekir ve ikiden çok kişi için kullanılmaz / **E** dönüşlü zamir gerekir ve of ile kullanılmaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I like both of these jackets, but I'll take ---- one. I don't like ---- of the other ones.$q$, array[$o$these / any$o$, $o$this / any$o$, $o$this / some$o$, $o$those / none$o$, $o$them / either$o$], 1, $e$1. Tekil yakın nesne **this one** ile söylenir: **this**.
2. Olumsuz cümlede **any of** kullanılır: **any**.

Diğer şıklar: **A** one tekildir / **C** olumsuz cümlede any kullanılır / **D** one tekildir ve olumsuz fiil ile çift olumsuz olur / **E** one ile kullanılmaz ve ikiden çok varlık için kullanılmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Whoever ---- the vase yesterday must have been very careless, and ---- should be asked to pay for it.$q$, array[$o$has broken / he$o$, $o$broke / whoever$o$, $o$breaks / him$o$, $o$had broken / himself$o$, $o$broke / he$o$], 4, $e$1. **Whoever** + geçmiş eylem kullanılır: **broke**.
2. Özne zamiri **he** olur: **he**.

Diğer şıklar: **A** yesterday ile Present Perfect olmaz / **B** ikinci bölümde özne zamiri gerekir / **C** geçmiş olay anlatılıyor ve özne zamiri gerekir / **D** sıra vurgusu yok ve özne zamiri gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$He is a very selfish man. He never thinks of ----, and he only cares about ----.$q$, array[$o$other / himself$o$, $o$others / him$o$, $o$the other / his$o$, $o$others / himself$o$, $o$another / he$o$], 3, $e$1. Belirsiz başka insanlar **others** ile söylenir: **others**.
2. Özne aynı kişi olduğundan dönüşlü zamir gelir: **himself**.

Diğer şıklar: **A** çoğul belirsiz kişi için others gelir / **B** özne aynı kişi, dönüşlü gerekir / **C** belirli iki kişiden biri anlamı verir ve sahiplik zamiri nesneye uymaz / **E** tekil kullanılır ve nesne yerinde özne zamiri gelmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Our neighbours invited ---- to dinner, but we had to refuse ---- invitation because we were away.$q$, array[$o$we / their$o$, $o$us / them$o$, $o$us / their$o$, $o$our / they$o$, $o$ours / theirs$o$], 2, $e$1. Nesne zamiri **us** olur: **us**.
2. İsimden önce sahiplik sıfatı **their** olur: **their**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** isimden önce sahiplik sıfatı gerekir / **D** nesne zamiri gerekir ve isimden önce sahiplik sıfatı gerekir / **E** nesne zamiri gerekir ve isimden önce sahiplik sıfatı gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Please help ---- to some cake, and make ---- at home while I make the coffee.$q$, array[$o$you / yourself$o$, $o$yourself / yourself$o$, $o$yourself / you$o$, $o$your / your$o$, $o$yours / yours$o$], 1, $e$1. **Help yourself** kalıbıdır: **yourself**.
2. **Make yourself at home** kalıbıdır: **yourself**.

Diğer şıklar: **A** dönüşlü kalıp gerekir / **C** dönüşlü kalıp gerekir / **D** dönüşlü kalıp gerekir ve dönüşlü kalıp gerekir / **E** dönüşlü kalıp gerekir ve dönüşlü kalıp gerekir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Between you and ----, this plan will never work, and nobody except ---- knows about it.$q$, array[$o$me / him$o$, $o$I / him$o$, $o$me / he$o$, $o$myself / his$o$, $o$mine / himself$o$], 0, $e$1. **Between** sonrası nesne zamiri gelir: **me**.
2. **Except** sonrası nesne zamiri gelir: **him**.

Diğer şıklar: **B** edat sonrası nesne zamiri gelir / **C** except sonrası nesne zamiri gelir / **D** edat sonrası ve iki kişi arasında nesne zamiri gelir ve except sonrası nesne zamiri gelir / **E** edat sonrası nesne zamiri gelir ve özne farklı kişidir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The members of the committee respect ----, but they rarely talk about ---- achievements in public.$q$, array[$o$each / their own$o$, $o$one another / them own$o$, $o$themselves / theirs own$o$, $o$others / themselves$o$, $o$one another / their own$o$], 4, $e$1. Karşılıklı eylem **one another** ile söylenir: **one another**.
2. **Own** öncesinde sahiplik sıfatı gelir: **their own**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** own öncesi sahiplik sıfatı gelir / **C** karşılıklı eylem anlamı yoktur ve own öncesi sahiplik sıfatı gelir / **D** belirsiz kalır ve sahiplik anlamı yoktur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Few of the guests knew ----, yet ---- seemed to enjoy the evening.$q$, array[$o$themselves / everyone$o$, $o$each other / anyone$o$, $o$each other / everyone$o$, $o$them / no one$o$, $o$the others / none$o$], 2, $e$1. Karşılıklı eylem **each other** ile söylenir: **each other**.
2. **Yet** ile tanışmamalarına rağmen herkes eğlendi: **everyone**.

Diğer şıklar: **A** karşılıklı eylem each other ile söylenir / **B** olumlu cümlede everyone uygundur / **D** karşılıklı eylem each other ile söylenir ve yet ile çelişir / **E** belirsiz kalır ve yet ile çelişir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Neither the manager nor his assistants ---- aware of the mistake, and ---- of them was blamed for it.$q$, array[$o$was / none$o$, $o$were / any$o$, $o$is / no$o$, $o$were / none$o$, $o$has been / all$o$], 3, $e$1. **Nor** sonrası en yakın özne çoğul olduğundan **were** gelir: **were**.
2. **None of** sonrası fiil tekil olabilir: **none**.

Diğer şıklar: **A** nor sonrası en yakın özne çoğuldur / **B** olumsuz fiil olmadığı için none gerekir / **C** geçmiş anlatım gerekir ve of ile kullanılmaz / **E** geçmiş anlatım gerekir ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$When one is learning a language, ---- should not be afraid of making mistakes, because ---- are a natural part of learning.$q$, array[$o$one / they$o$, $o$we / they$o$, $o$one / it$o$, $o$you / she$o$, $o$they / he$o$], 0, $e$1. Genel kişi **one** ile devam eder: **one**.
2. Çoğul isim yerine **they** kullanılır: **they**.

Diğer şıklar: **B** genel kişi one ile devam eder / **C** çoğul mistakes için they gelir / **D** resmi anlatım one ile sürer ve çoğul mistakes için they gelir / **E** özne uyumsuz ve çoğul mistakes için they gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Pronouns konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Pronouns konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Pronouns$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$I looked for my keys everywhere, but I couldn't find ----, so I asked ---- for help.$q$, array[$o$it / my brother$o$, $o$them / he$o$, $o$them / my brother$o$, $o$they / my brother's$o$, $o$themselves / himself$o$], 2, $e$1. Çoğul isim yerine nesne zamiri **them** kullanılır: **them**.
2. Nesne olarak isim gelir: **my brother**.

Diğer şıklar: **A** keys çoğuldur / **B** asked sonrası nesne gerekir / **D** nesne zamiri gerekir ve sahiplik eki gereksiz / **E** özne farklı kişi ve özne farklı kişi.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She made the cake ----, and nobody helped ---- with the washing up.$q$, array[$o$her / her$o$, $o$herself / herself$o$, $o$hers / hers$o$, $o$herself / her$o$, $o$she / she$o$], 3, $e$1. Kendi başına anlamı **herself** ile söylenir: **herself**.
2. Özne farklı kişi olduğundan nesne zamiri gelir: **her**.

Diğer şıklar: **A** özne aynı kişi, dönüşlü gerekir / **B** özne farklı kişi, nesne zamiri gerekir / **C** sahiplik zamiri anlam bozar ve nesne zamiri gerekir / **E** nesne yerine özne zamiri gelmez ve nesne zamiri gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Is there ---- in the room? No, there isn't ----.$q$, array[$o$everyone / anyone$o$, $o$anyone / anyone$o$, $o$anyone / someone$o$, $o$nobody / no one$o$, $o$each one / everyone$o$], 1, $e$1. Soru cümlesinde **anyone** kullanılır: **anyone**.
2. Olumsuz cümlede **anyone** kullanılır: **anyone**.

Diğer şıklar: **A** soru cümlesinde anyone kullanılır / **C** olumsuz cümlede anyone kullanılır / **D** soru cümlesinde anyone kullanılır ve olumsuz cümlede anyone kullanılır / **E** soru cümlesinde anyone kullanılır ve olumsuz cümlede anyone kullanılır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$All of ---- were excited about the trip, and ---- of them had packed carefully.$q$, array[$o$us / each$o$, $o$we / each$o$, $o$us / every$o$, $o$our / all$o$, $o$ours / everyone$o$], 0, $e$1. **Of** sonrasında nesne zamiri gelir: **us**.
2. **Each of** ile her bir kişiyi ayrı vurgularız: **each**.

Diğer şıklar: **B** of sonrası nesne zamiri gelir / **C** of ile kullanılmaz / **D** of sonrası nesne zamiri gelir ve anlam bozulur / **E** of sonrası nesne zamiri gelir ve of ile kullanılmaz.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The coat on the chair isn't ----. It must be ----.$q$, array[$o$my / someone else's$o$, $o$mine / else someone's$o$, $o$me / someone's else$o$, $o$mine / someone else's$o$, $o$I / someone else$o$], 3, $e$1. Nesnesiz sahiplik zamiri **mine** olur: **mine**.
2. **Someone else's** doğru sıradır: **someone else's**.

Diğer şıklar: **A** sahiplik zamiri gerekir / **B** sıra yanlış / **C** sahiplik zamiri gerekir ve sıra yanlış / **E** sahiplik zamiri gerekir ve sahiplik eki gerekir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I like the red dress, but I don't like the blue ----, and I need ---- to wear tonight.$q$, array[$o$it / something$o$, $o$one / anything$o$, $o$ones / nothing$o$, $o$another / everything$o$, $o$one / something$o$], 4, $e$1. Sıfattan sonra tekil isim yerine **one** gelir: **one**.
2. Olumlu cümlede **something** kullanılır: **something**.

Diğer şıklar: **A** sıfattan sonra one gelir / **B** olumlu cümlede something gelir / **C** tekil isim yerine one gelir ve anlam bozulur / **D** sıfattan sonra one gelir ve anlam bozulur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He said he had met ---- interesting at the conference, but he couldn't remember ---- name.$q$, array[$o$someone / her$o$, $o$something / her$o$, $o$someone / she$o$, $o$anything / hers$o$, $o$nothing / herself$o$], 0, $e$1. Kişi için olumlu cümlede **someone** gelir: **someone**.
2. İsimden önce sahiplik sıfatı gelir: **her**.

Diğer şıklar: **B** kişi için someone gelir / **C** sahiplik sıfatı gerekir / **D** olumlu cümlede someone gelir ve sahiplik sıfatı gerekir / **E** anlam bozulur ve sahiplik anlamı yok.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The two sisters look alike, but ---- is taller than ----.$q$, array[$o$each / the other$o$, $o$one / the other$o$, $o$one / another$o$, $o$another / other$o$, $o$others / others$o$], 1, $e$1. İki kişiden biri **one** ile söylenir: **one**.
2. Kalan kişi **the other** ile söylenir: **the other**.

Diğer şıklar: **A** one ile karşılaştırma yapılmaz / **C** iki kişide diğeri the other ile söylenir / **D** belirli iki kişiden biri one ile söylenir ve the olmadan kullanılmaz / **E** iki kişiden biri tekil olur ve iki kişide tekil gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Of the two options, I prefer ----, and I think ---- is much more practical.$q$, array[$o$the last / it$o$, $o$the latter / them$o$, $o$the latter / it$o$, $o$the later / those$o$, $o$latter / themselves$o$], 2, $e$1. İki öğeden ikincisi **the latter** ile söylenir: **the latter**.
2. Tekil öğe için **it** kullanılır: **it**.

Diğer şıklar: **A** iki öğede latter kullanılır / **B** latter tekildir / **D** zaman anlamı verir ve latter tekildir / **E** the olmadan kullanılmaz ve latter tekildir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$There is ---- wrong with the engine, but I can't find out ---- is causing the noise.$q$, array[$o$anything / what$o$, $o$something / which$o$, $o$nothing / that$o$, $o$everything / who$o$, $o$something / what$o$], 4, $e$1. Olumlu cümlede **something** kullanılır: **something**.
2. Dolaylı soruda **what** kullanılır: **what**.

Diğer şıklar: **A** olumlu cümlede something gelir / **B** sınırsız seçenekte what kullanılır / **C** but ile çelişir ve dolaylı soru cümlesinde that kullanılmaz / **D** anlam bozulur ve nesne cansızdır.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$---- is believed that the fire started in the kitchen, and ---- were no survivors.$q$, array[$o$There / there$o$, $o$It / there$o$, $o$It / it$o$, $o$This / they$o$, $o$That / these$o$], 1, $e$1. **It is believed that** kalıbı kullanılır: **It**.
2. Varlık bildiren **there were** kalıbı kullanılır: **there**.

Diğer şıklar: **A** it is believed kalıbı gerekir / **C** varlık bildirmek için there were gelir / **D** it is believed kalıbı gerekir ve varlık bildirmek için there gelir / **E** it is believed kalıbı gerekir ve varlık bildirmek için there gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$My laptop is broken, so I'm using ---- sister's, and I'll give ---- back tomorrow.$q$, array[$o$me / it$o$, $o$my / them$o$, $o$mine / one$o$, $o$my / it$o$, $o$I / itself$o$], 3, $e$1. İsimden önce sahiplik sıfatı gelir: **my**.
2. Tekil belirli nesne için **it** kullanılır: **it**.

Diğer şıklar: **A** sahiplik sıfatı gerekir / **B** laptop tekildir / **C** isimden önce sahiplik sıfatı gerekir ve geri verilen belirli şey it ile söylenir / **E** sahiplik sıfatı gerekir ve özne farklı kişi.$e$, 1),
  (13, 'ydt-dil', null::integer, $q$Not ---- of the cars in the showroom was cheap, and ---- of them had a sunroof.$q$, array[$o$no / some$o$, $o$one / any$o$, $o$one / some$o$, $o$any / none$o$, $o$none / neither$o$], 2, $e$1. **Not one of** kalıbı kullanılır: **one**.
2. Olumlu cümlede **some of** kullanılır: **some**.

Diğer şıklar: **A** Not no birlikte kullanılmaz / **B** olumlu cümlede some kullanılır / **D** Not any birlikte kullanılmaz ve of ile birlikte olumsuz anlam yok / **E** Not none birlikte kullanılmaz ve ikiden çok varlık için kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It was Ayşe ---- gave me the news, and it was ---- who told you about the party.$q$, array[$o$who / he$o$, $o$whom / he$o$, $o$who / his$o$, $o$whose / them$o$, $o$which / himself$o$], 0, $e$1. Özne vurgulanan yapıda insan için **who** gelir: **who**.
2. **It was he who** vurgulu yapısında özne zamiri gelir: **he**.

Diğer şıklar: **B** özne olduğundan who gerekir / **C** who ile vurgu yapısında özne zamiri gelir / **D** sahiplik anlamı yok ve tekil özne he ister / **E** insan için who gerekir ve who ile özne zamiri gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The workers asked ---- about the new contract, but the manager never explained ---- to them.$q$, array[$o$his / it$o$, $o$him / them$o$, $o$he / they$o$, $o$himself / themselves$o$, $o$him / it$o$], 4, $e$1. Nesne zamiri **him** olur: **him**.
2. Tekil nesne için **it** kullanılır: **it**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** contract tekildir / **C** nesne zamiri gerekir ve contract tekildir / **D** özne farklı kişi ve özne farklı kişi.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Not only ---- she ignore the warning, but she also told ---- else to ignore it.$q$, array[$o$does / everybody$o$, $o$did / everybody$o$, $o$did / anybody$o$, $o$has / nobody$o$, $o$was / somebody$o$], 1, $e$1. **Not only** sonrası devrik yapı **did she ignore** ile kurulur: **did**.
2. **Everybody else** kalıbı kullanılır: **everybody**.

Diğer şıklar: **A** geçmiş anlatım gerekir / **C** olumlu cümlede everybody anlamı korunur / **D** geçmiş anlatım gerekir ve anlam bozulur / **E** yardımcı fiil did olmalıdır ve else ile anlam zayıflar.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The more a person has, the more ---- wants, and the less ---- is satisfied with what he already owns.$q$, array[$o$she / he$o$, $o$he / him$o$, $o$it / it$o$, $o$he / he$o$, $o$they / they$o$], 3, $e$1. Genel tekil kişi için **he** devam eder: **he**.
2. Aynı özne devam eder: **he**.

Diğer şıklar: **A** genel kişi için tutarlı zamir gerekir / **B** özne zamiri gerekir / **C** insan için he gelir ve insan için he gelir / **E** a person tekildir ve a person tekildir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Those ---- wish to attend the ceremony should register by Friday, and the people ---- names are on the list will be contacted.$q$, array[$o$who / whose$o$, $o$whom / whose$o$, $o$who / who$o$, $o$whose / whom$o$, $o$which / which$o$], 0, $e$1. **Those who** kalıbı kullanılır: **who**.
2. Sahiplik **whose** ile verilir: **whose**.

Diğer şıklar: **B** özne olduğundan who gerekir / **C** sahiplik anlamı için whose gerekir / **D** those ile özne gerekir ve sahiplik anlamı için whose gerekir / **E** insan için who gerekir ve sahiplik anlamı için whose gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$My colleagues and ---- have been working on the project for months, and ---- of us has taken a day off.$q$, array[$o$me / none$o$, $o$I / neither$o$, $o$myself / no$o$, $o$mine / nobody$o$, $o$I / none$o$], 4, $e$1. Özne olarak **I** gelir: **I**.
2. İkiden çok kişi için **none of** kullanılır: **none**.

Diğer şıklar: **A** özne olarak I gerekir / **B** ikiden çok kişi için none gerekir / **C** özne olarak I gerekir ve of ile kullanılmaz / **D** özne olarak I gerekir ve of ile kullanılmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Everything ---- she said was true, and all ---- he had done was to ask a question.$q$, array[$o$what / that$o$, $o$that / what$o$, $o$that / that$o$, $o$who / who$o$, $o$whom / whom$o$], 2, $e$1. **Everything** sonrası **that** gelir: **that**.
2. **All** sonrası **that** gelir: **that**.

Diğer şıklar: **A** everything sonrasında that gelir / **B** all sonrasında that gelir / **D** cansız nesne için kullanılmaz ve cansız nesne için kullanılmaz / **E** cansız nesne için kullanılmaz ve cansız nesne için kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

