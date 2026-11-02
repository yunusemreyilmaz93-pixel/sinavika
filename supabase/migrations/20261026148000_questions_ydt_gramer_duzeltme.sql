-- 20261026148000_questions_ydt_gramer_duzeltme. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Adjectives konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$She was wearing a ---- dress, and her husband carried a ---- leather briefcase.$q$, array[$o$silk long beautiful / large brown$o$, $o$beautiful long silk / brown large leather$o$, $o$beautiful long silk / large brown$o$, $o$long beautiful silk / leather large brown$o$, $o$beautiful silk long / large leather brown$o$], 2, $e$1. **Sıfat sırası**: görüş, boyut, renk, madde: **beautiful long silk / large brown**.

Diğer şıklar: **A** sıfat sırası: görüş, boyut, madde / **B** boyut renkten önce gelir / **D** görüş sıfatı boyuttan önce gelir ve madde sıfatı isme en yakındır / **E** madde sıfatı isme en yakın olur ve renk maddeden önce gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The ---- child was found wandering in the street, and the ---- doctor refused to answer questions about her.$q$, array[$o$frightening / exhausted$o$, $o$frightened / exhausted$o$, $o$frightened / exhausting$o$, $o$fright / exhaust$o$, $o$frighten / exhaustion$o$], 1, $e$1. **Hisseden kişi V-ed** ile: **frightened / exhausted**.

Diğer şıklar: **A** hisseden çocuk için V-ed gerekir / **C** hisseden doktor için V-ed gerekir / **D** isimdir ve sıfat olmaz / **E** sıfat olmaz ve isimdir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The baby in the next room has finally fallen ----, so please keep your voices down.$q$, array[$o$asleep$o$, $o$sleeping$o$, $o$sleepy$o$, $o$slept$o$, $o$sleep$o$], 0, $e$1. **Fall asleep** kalıbı: **asleep**.

Diğer şıklar: **B** fall + asleep kalıbı / **C** fall + asleep kalıbı / **D** sıfat olmaz / **E** fall + asleep kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Is there ---- you would like to drink, or would you prefer ---- to eat?$q$, array[$o$something / something$o$, $o$anything / anything$o$, $o$nothing / nothing$o$, $o$anything / something$o$, $o$everything / everything$o$], 3, $e$1. **Soru**: **anything**. **Teklif**: **something**.

Diğer şıklar: **A** soru cümlesinde anything gelir / **B** teklifte something gelir / **C** soru cümlesinde anything gelir ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The new manager is ---- to criticism, and she is ---- of her team's achievements.$q$, array[$o$indifferent of / proud$o$, $o$indifferent / proud for$o$, $o$indifferent / proud$o$, $o$sensitive of / proud at$o$, $o$blind of / proud in$o$], 2, $e$1. **Indifferent to** ve **proud of** kalıpları: **indifferent / proud**.

Diğer şıklar: **A** indifferent to kalıbı / **B** proud of kalıbı / **D** sensitive to kalıbı ve proud of kalıbı / **E** blind to kalıbı ve proud of kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adjectives konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Adjectives konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (6, 'ydt-dil', null::integer, $q$The ---- man was lying on the road, and the ---- baby was lying in the cot.$q$, array[$o$injured / sleeping$o$, $o$injuring / sleeping$o$, $o$injured / asleep$o$, $o$injure / slept$o$, $o$injury / sleepy$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **injured**.
2. İsimden önce **sleeping** kullanılır: **sleeping**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** isimden önce asleep kullanılmaz / **D** sıfat olmaz ve sıfat olarak kullanılmaz / **E** isimdir ve anlam farklıdır.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The patient is ---- and needs rest, and the doctor is ---- about his condition.$q$, array[$o$weakly / concerned$o$, $o$weak / concerning$o$, $o$weaken / concern$o$, $o$weakness / concerns$o$, $o$weak / concerned$o$], 4, $e$1. **Be** sonrası sıfat gelir: **weak**.
2. Hisseden kişi için **V-ed** gelir: **concerned**.

Diğer şıklar: **A** be sonrası sıfat gelir / **B** hisseden kişi V-ed ister / **C** fiildir ve isim ya da fiil / **D** isimdir ve çoğul isim.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The older he got, the ---- he became, and the ---- he looked at every problem.$q$, array[$o$wisest / more calmly$o$, $o$wiser / calmer$o$, $o$wiser / more calmly$o$, $o$wise / more calm$o$, $o$more wise / calmly$o$], 2, $e$1. **The + karşılaştırma** yapısı kullanılır: **wiser**.
2. Fiili niteleyen zarfta **more calmly** kullanılır: **more calmly**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** look at fiilini zarf niteler / **D** the + karşılaştırma ister ve look at fiilini zarf niteler / **E** wise tek heceli, -er alır ve the + karşılaştırma gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'm ---- with my job, and I've been ---- for a change for some time.$q$, array[$o$fed up / looking$o$, $o$interested in / looking$o$, $o$fed up / looked$o$, $o$tired off / look$o$, $o$sick off / looks$o$], 0, $e$1. **Fed up with** kalıbı kullanılır: **fed up**.
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
  (13, 'ydt-dil', null::integer, $q$The ---- scenery of the lake made the walk worthwhile, and the ---- climate was perfect for farming.$q$, array[$o$stunned / mild$o$, $o$stunning / mildly$o$, $o$stun / mildness$o$, $o$stunning / mild$o$, $o$stunt / milder$o$], 3, $e$1. Duygu yaratan şey **V-ing** alır: **stunning**.
2. İsimden önce **sıfat** gelir: **mild**.

Diğer şıklar: **A** nesne duygu yaratıyor, V-ing gerekir / **B** zarf isimden önce gelmez / **C** sıfat olmaz ve isimdir / **E** anlam farklıdır ve karşılaştırma gerekmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The weather was ---- yesterday, so we stayed indoors, and the film we watched was ----.$q$, array[$o$terrible / hilarious$o$, $o$terribly / hilarious$o$, $o$terrible / hilariously$o$, $o$terror / hilarity$o$, $o$terrified / hilarities$o$], 0, $e$1. **Be** sonrası sıfat gelir: **terrible**.
2. Aynı kurala göre: **hilarious**.

Diğer şıklar: **B** be sonrası sıfat gelir / **C** be sonrası sıfat gelir / **D** isimdir ve isimdir / **E** hisseden kişi V-ed ister ve çoğul isim.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He is ---- good at maths, but he is ---- at spelling.$q$, array[$o$extreme / hopeless$o$, $o$extremely / hopeless$o$, $o$extremely / hopelessly$o$, $o$extremist / hope$o$, $o$more extreme / hopeful$o$], 1, $e$1. Sıfatı **zarf** niteler: **extremely**.
2. **Hopeless at** kalıbı kullanılır: **hopeless**.

Diğer şıklar: **A** good sıfatını zarf niteler / **C** be sonrası sıfat gelir / **D** isimdir ve isimdir / **E** anlam bozulur ve anlam yönü uymaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The scientists were ---- surprised by the results that they repeated the experiment three times.$q$, array[$o$such$o$, $o$very$o$, $o$too$o$, $o$enough$o$, $o$so$o$], 4, $e$1. **So + sıfat + that** sonuç kalıbı: **so**.

Diğer şıklar: **A** sıfattan önce so gelir / **B** that sonuç cümlesi so ister / **C** that sonuç cümlesi so ister / **D** sıfattan sonra gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$It was ---- a long and tiring journey that we decided to stay overnight in the first town we came to.$q$, array[$o$so$o$, $o$very$o$, $o$such$o$, $o$too$o$, $o$quite so$o$], 2, $e$1. **Such a + sıfat + isim + that**: **such**.

Diğer şıklar: **A** a long journey öncesinde such gerekir / **B** that sonuç cümlesi gerekir / **D** that sonuç cümlesi gerekir / **E** kalıp bozulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The exam was ---- difficult for the students to finish in the time allowed, so the teacher extended the deadline.$q$, array[$o$enough$o$, $o$so$o$, $o$very$o$, $o$too$o$, $o$such$o$], 3, $e$1. **Too + sıfat + to-infinitive**: **too**.

Diğer şıklar: **A** sıfattan sonra gelir / **B** to-infinitive ile too gerekir / **C** to-infinitive ile too gerekir / **E** sıfattan önce so gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The more ---- the weather became, the more reluctant the climbers were to continue, and the ---- they felt, the more mistakes they made.$q$, array[$o$severe / more tired$o$, $o$severely / more tired$o$, $o$severe / most tired$o$, $o$severity / tired$o$, $o$severer / tiredly$o$], 0, $e$1. **The more ..., the more**: **severe / more tired**.

Diğer şıklar: **B** the more + sıfat yapısı / **C** the + karşılaştırma ister / **D** isimdir ve the + karşılaştırma ister / **E** biçim yanlış ve the + karşılaştırma ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The company's ---- decision to reduce prices was ---- by its competitors, who accused it of unfair practice.$q$, array[$o$suddenly / criticised$o$, $o$sudden / criticised$o$, $o$sudden / criticising$o$, $o$suddenness / criticise$o$, $o$sudden of / criticism$o$], 1, $e$1. **İsimden önce sıfat**: **sudden**. **Edilgen**: **criticised**.

Diğer şıklar: **A** isimden önce sıfat gelir / **C** edilgen anlam V-ed ister / **D** isimdir ve edilgen yapı gerekir / **E** anlam bozulur ve isimdir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adjectives konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Adjectives konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$Nobody was ---- of the danger until the water had reached the second floor, and by then it was almost ---- to escape.$q$, array[$o$conscious about / impossible$o$, $o$aware / impossible$o$, $o$aware / impossibly$o$, $o$sure of / impossibility$o$, $o$known of / unable$o$], 1, $e$1. **Aware of**, **impossible to**: **aware / impossible**.

Diğer şıklar: **A** aware of kalıbı / **C** be sonrası sıfat gelir / **D** anlam yönü uymaz ve isimdir / **E** biçim yanlış ve to-infinitive ile it was unable kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The film was far ---- than I had expected, and the acting was ---- the best I have seen this year.$q$, array[$o$well / easily$o$, $o$better / easy$o$, $o$best / ease$o$, $o$gooder / easier$o$, $o$better / easily$o$], 4, $e$1. **Far better than**, **easily the best**: **better / easily**.

Diğer şıklar: **A** than ile karşılaştırma better gerekir / **B** zarf gerekir / **C** than ile üstünlük kullanılmaz ve isimdir / **D** biçim yanlış ve the best öncesinde easily gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It was the ---- performance that the orchestra had ever given, and the audience was ---- to the point of tears.$q$, array[$o$most moving / moved$o$, $o$moved / moved$o$, $o$most moving / moving$o$, $o$more moving / move$o$, $o$moving / movement$o$], 0, $e$1. **Üstünlük + duygu yaratan**: **most moving**. **Hisseden**: **moved**.

Diğer şıklar: **B** nesne duygu yaratıyor, V-ing gerekir / **C** hisseden kişi için V-ed gerekir / **D** ever ile üstünlük gerekir ve sıfat olmaz / **E** the ile üstünlük gerekir ve isimdir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Compared with last year, the situation is ---- worse, and many families are ---- poorer than they were before the crisis.$q$, array[$o$considerable / noticeably$o$, $o$considerably / noticeable$o$, $o$considerably / noticeably$o$, $o$consider / notice$o$, $o$considering / noticing$o$], 2, $e$1. **Karşılaştırmayı zarf niteler**: **considerably / noticeably**.

Diğer şıklar: **A** zarf gerekir / **B** karşılaştırmayı zarf niteler / **D** fiildir ve fiildir / **E** bağlaç işlevi görür ve fiil biçimidir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The new regulations are ---- to those who have worked for the company for more than ten years, but they do not apply ---- newly recruited staff.$q$, array[$o$favourably / to$o$, $o$favourable / to$o$, $o$favourable / for$o$, $o$favour / at$o$, $o$favouring / with$o$], 1, $e$1. **Favourable to**, **apply to**: **favourable / to**.

Diğer şıklar: **A** be sonrası sıfat gelir / **C** do not apply to kalıbı / **D** isim ya da fiil ve do not apply to kalıbı / **E** anlam bozulur ve do not apply to kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adjectives konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Adverbs konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (13, 'ydt-dil', null::integer, $q$The results were ---- better than we had expected, and the weather was ---- perfect for a picnic.$q$, array[$o$very / absolutely$o$, $o$far / absolutely$o$, $o$far / very$o$, $o$so / rather$o$, $o$too / fairly$o$], 1, $e$1. Karşılaştırmayı **far** pekiştirir: **far**.
2. Derecelenemeyen sıfatı **absolutely** niteler: **absolutely**.

Diğer şıklar: **A** karşılaştırmayı far/much/a lot pekiştirir / **C** perfect derecelenemeyen sıfattır / **D** karşılaştırmayı far/much/a lot pekiştirir ve perfect derecelenemeyen sıfattır / **E** karşılaştırmayı far/much/a lot pekiştirir ve perfect derecelenemeyen sıfattır.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He ran as ---- as he could, but the bus had ---- left.$q$, array[$o$fastly / already$o$, $o$fast / yet$o$, $o$fast / already$o$, $o$quick / still$o$, $o$quickly / ever$o$], 2, $e$1. **Fast** hem sıfat hem zarftır: **fast**.
2. Olumlu cümlede **already** kullanılır: **already**.

Diğer şıklar: **A** fast hem sıfat hem zarftır / **B** olumlu cümlede already kullanılır / **D** fiili zarf niteler ve olumlu cümlede already kullanılır / **E** fast ile eşitlik kalıbı yerleşik ve olumlu cümlede already kullanılır.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Prices have risen ---- over the last year, and many families can ---- afford basic food.$q$, array[$o$sharply / barely$o$, $o$sharp / barely$o$, $o$sharply / bare$o$, $o$sharpness / barren$o$, $o$sharpest / barest$o$], 0, $e$1. Fiili **zarf** niteler: **sharply**.
2. **Can barely** zor anlamı verir: **barely**.

Diğer şıklar: **B** fiili zarf niteler / **C** can sonrası zarf gerekir / **D** isimdir ve anlamı farklıdır / **E** üstünlük gerekmez ve üstünlük gerekmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Not until the investigators examined the black box ---- the real cause of the crash, and only then ---- the airline change its safety procedures.$q$, array[$o$they discovered / did$o$, $o$did they discover / had$o$, $o$they did discover / was$o$, $o$did they discover / did$o$, $o$had they discovered / does$o$], 3, $e$1. **Not until + yan cümle + devrik ana cümle**: **did they discover**. **Only then did**: **did**.

Diğer şıklar: **A** Not until sonrası ana cümlede devrik yapı gerekir / **B** Only then sonrası devrik yapı did ister / **C** devrik yapı yardımcı fiili başa alır ve Only then sonrası did gerekir / **E** Past Perfect gerekmez ve geçmiş anlatım gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Under no circumstances ---- employees remove confidential documents from the building.$q$, array[$o$employees should$o$, $o$do not$o$, $o$are$o$, $o$might$o$, $o$should$o$], 4, $e$1. **Under no circumstances** sonrası devrik yapı: **should employees**.

Diğer şıklar: **A** devrik yapı gerekir / **B** olumsuz yapı çift olumsuz yaratır / **C** yardımcı fiil anlamı bozulur / **D** anlam bozulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Rarely ---- a more talented young player, and never before ---- so much admiration from the critics.$q$, array[$o$have I seen / has a debut attracted$o$, $o$I have seen / has a debut attracted$o$, $o$have I seen / a debut attracted$o$, $o$did I saw / did a debut attract$o$, $o$do I saw / a debut has attracted$o$], 0, $e$1. **Rarely / never before** sonrası devrik yapı: **have I seen / has a debut attracted**.

Diğer şıklar: **B** devrik yapı gerekir / **C** devrik yapı gerekir / **D** biçim yanlış ve Present Perfect ile uyum için has gerekir, şık eşleşmesi bozulur / **E** biçim yanlış ve devrik yapı gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The negotiations went ---- than anyone had expected, and the two delegations reached an agreement ---- quickly.$q$, array[$o$far more smooth / remarkably$o$, $o$far more smoothly / remarkable$o$, $o$much smoothlier / remarkableness$o$, $o$far more smoothly / remarkably$o$, $o$more smooth / remarked$o$], 3, $e$1. **Zarf karşılaştırması**: **far more smoothly**, sıfatı niteleyen zarf **remarkably**.

Diğer şıklar: **A** zarf gerekir / **B** zarf gerekir / **C** biçim yanlış ve isimdir / **E** zarf gerekir ve fiildir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The students studied ---- all week for the exam, but they could ---- remember anything once the questions were in front of them.$q$, array[$o$hardly / hardly$o$, $o$hard / hardly$o$, $o$hard / hard$o$, $o$heavily / harder$o$, $o$harshly / heavily$o$], 1, $e$1. **Hard** çok çalışmak, **hardly** neredeyse hiç: **hard / hardly**.

Diğer şıklar: **A** çok çalıştı anlamı hard ister / **C** zor zor anlamı hardly ister / **D** work ile hard kalıbı ve karşılaştırma yoktur / **E** anlamı farklıdır ve anlamı farklıdır.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adverbs konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Adverbs konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$The longer the rescue operation was delayed, the ---- the chances of finding survivors became.$q$, array[$o$slim$o$, $o$slimmer$o$, $o$slimmest$o$, $o$more slim$o$, $o$slimly$o$], 1, $e$1. **The longer ..., the slimmer** yapısı: **slimmer**.

Diğer şıklar: **A** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** slim -er alır / **E** the + karşılaştırma sıfat gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The project was so ---- planned that it collapsed within weeks, and the investors were left ---- empty-handed.$q$, array[$o$poor / completely$o$, $o$poorly / complete$o$, $o$poorness / completion$o$, $o$poorly / completely$o$, $o$poorer / completeness$o$], 3, $e$1. **Zarf**: **poorly / completely**.

Diğer şıklar: **A** planned fiilini zarf niteler / **B** empty-handed sıfatı zarf ister / **C** isimdir ve isimdir / **E** so ile karşılaştırma yok ve isimdir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$By the time the ambulance arrived, the injured man was ---- conscious, and the doctors feared that he might not survive.$q$, array[$o$hardly not$o$, $o$scarcely not$o$, $o$barely$o$, $o$never$o$, $o$nearly$o$], 2, $e$1. **Barely conscious** zar zor bilinci açık anlamı verir: **barely**.

Diğer şıklar: **A** çift olumsuz olur / **B** çift olumsuz olur / **D** barely yerine geçmez / **E** neredeyse anlamı verir, durum zıttır.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- had the talks begun when the delegates from the opposition walked out, ---- the negotiations came to a sudden end.$q$, array[$o$No sooner / and$o$, $o$Hardly / but$o$, $o$Seldom / so that$o$, $o$Rarely / because$o$, $o$Hardly / and$o$], 4, $e$1. **Hardly had...when** kalıbı: **Hardly**. Sonuç **and**.

Diğer şıklar: **A** than ile kullanılır / **B** sonuç and ister / **C** when ile kullanılmaz ve amaç anlamı verir / **D** when ile kullanılmaz ve sebep anlamı bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It was ---- a cold winter that the lake froze over completely, and ---- did anyone dare to cross it.$q$, array[$o$so / hardly$o$, $o$such / hardly$o$, $o$such / hard$o$, $o$very / seldom is$o$, $o$too / never$o$], 1, $e$1. **Such a + sıfat + isim**: **such**. **Hardly** devrik yapı: **hardly did anyone dare**.

Diğer şıklar: **A** a cold winter önünde such gerekir / **C** anlam yönü farklıdır / **D** that sonuç cümlesi ister ve devrik yapıda hardly ever ya da hardly kalıbı / **E** that sonuç cümlesi ister ve devrik yapı gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adverbs konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Adverbs konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$The new law, which will take effect ---- next month, has been ---- criticised by opposition parties and legal experts alike.$q$, array[$o$early / widely$o$, $o$earlily / widely$o$, $o$early / wide$o$, $o$earlier / widened$o$, $o$earliest / widen$o$], 0, $e$1. **Early** hem sıfat hem zarf, **widely criticised**: **early / widely**.

Diğer şıklar: **B** zarf biçimi yok / **C** fiili zarf niteler / **D** karşılaştırma anlamı ve fiil biçimidir / **E** üstünlük anlamı ve fiildir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She answered all the questions ----, but she was ---- aware that her performance had not impressed the examiners.$q$, array[$o$confident / acutely$o$, $o$confidently / acute$o$, $o$confidence / acuteness$o$, $o$confidently / acutely$o$, $o$confidential / acutest$o$], 3, $e$1. **Fiili zarf niteler**: **confidently**. **Sıfatı zarf niteler**: **acutely**.

Diğer şıklar: **A** fiili zarf niteler / **B** aware sıfatını zarf niteler / **C** isimdir ve isimdir / **E** anlam farklıdır ve biçim yanlış.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He apologised sincerely for the delay, ---- admitting that he should have informed the customers earlier.$q$, array[$o$ever$o$, $o$yet$o$, $o$still$o$, $o$already$o$, $o$even$o$], 4, $e$1. **Even admitting** ek vurgu verir: **even**.

Diğer şıklar: **A** admitting ile even gelir / **B** anlam bozulur / **C** anlam yönü zayıf / **D** anlam bozulur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The cost of living has risen ---- over the past year, and many families are ---- able to make ends meet.$q$, array[$o$sharp / barely$o$, $o$sharply / bare$o$, $o$sharply / barely$o$, $o$sharpness / barren$o$, $o$sharpest / barest$o$], 2, $e$1. **Zarf**: **sharply / barely**.

Diğer şıklar: **A** fiili zarf niteler / **B** able sıfatını zarf niteler / **D** isimdir ve anlam farklıdır / **E** üstünlük yok ve biçim yanlış.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It was a lovely evening, and we stayed up ----, ---- aware that we would have to get up early the next morning.$q$, array[$o$lately / fully$o$, $o$late / fully$o$, $o$late / full$o$, $o$latest / fulfilled$o$, $o$lateness / fullest$o$], 1, $e$1. **Late** geç saate kadar, **fully aware**: **late / fully**.

Diğer şıklar: **A** son zamanlarda anlamı verir / **C** aware sıfatını zarf niteler / **D** en son anlamı verir ve anlam farklıdır / **E** isimdir ve biçim yanlış.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Adverbs konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$This exam was ---- than the last one, but it wasn't ---- difficult as the final.$q$, array[$o$easier / as$o$, $o$easy / as$o$, $o$easier / than$o$, $o$easiest / like$o$, $o$more easy / that$o$], 0, $e$1. **Than** ile karşılaştırma yapılır: **easier**.
2. **Not as...as** kalıbı kullanılır: **as**.

Diğer şıklar: **B** than ile karşılaştırma -er ister / **C** as ... as kalıbı ister / **D** than ile üstünlük kullanılmaz ve as ... as kalıbı ister / **E** easy -er alır ve as ... as kalıbı ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The more you practise, the ---- you become, and the ---- you get, the more confident you feel.$q$, array[$o$good / better$o$, $o$better / good$o$, $o$best / best$o$, $o$better / better$o$, $o$more good / more good$o$], 3, $e$1. **The more..., the better** yapısı kullanılır: **better**.
2. Aynı kurala göre: **better**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **C** the + karşılaştırma ister ve the + karşılaştırma ister / **E** good düzensizdir ve good düzensizdir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She is the ---- student in the class, and she runs ---- than anyone else.$q$, array[$o$taller / faster$o$, $o$tallest / fastest$o$, $o$tallest / faster$o$, $o$most tall / fast$o$, $o$tall / more fast$o$], 2, $e$1. Üstünlük **tallest** ile söylenir: **tallest**.
2. **Than** ile **faster** gelir: **faster**.

Diğer şıklar: **A** class içinde üstünlük gerekir / **B** than ile üstünlük kullanılmaz / **D** tek heceli sıfat -est alır ve than ile karşılaştırma gerekir / **E** üstünlük gerekir ve fast -er alır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Ali is as ---- as his brother, but he is not as ---- as his sister.$q$, array[$o$taller / clever$o$, $o$tall / cleverer$o$, $o$tallest / cleverest$o$, $o$more tall / more clever$o$, $o$tall / clever$o$], 4, $e$1. **As...as** arasında yalın sıfat gelir: **tall**.
2. Aynı kurala göre: **clever**.

Diğer şıklar: **A** as ... as sıfat yalın ister / **B** as ... as sıfat yalın ister / **C** as ... as sıfat yalın ister ve as ... as sıfat yalın ister / **D** as ... as sıfat yalın ister ve as ... as sıfat yalın ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Both the manager ---- the assistant were late, and neither of them ---- an excuse.$q$, array[$o$or / had$o$, $o$and / had$o$, $o$and / have$o$, $o$nor / were$o$, $o$but / are$o$], 1, $e$1. **Both...and** kalıbı kullanılır: **and**.
2. **Neither of** tekil fiil ister: **had**.

Diğer şıklar: **A** both ile and kullanılır / **C** neither of tekil fiil ister / **D** both ile and kullanılır ve neither of tekil fiil ister / **E** both ile and kullanılır ve neither of tekil fiil ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$This laptop is twice ---- expensive as that one, and it is ---- more powerful.$q$, array[$o$as / much$o$, $o$more / much$o$, $o$as / very$o$, $o$so / so$o$, $o$than / too$o$], 0, $e$1. **Twice as...as** kalıbı kullanılır: **as**.
2. Karşılaştırmayı **much** pekiştirir: **much**.

Diğer şıklar: **B** twice as ... as kalıbı ister / **C** karşılaştırmayı much pekiştirir / **D** twice as ... as kalıbı ister ve karşılaştırmayı much pekiştirir / **E** twice as ... as kalıbı ister ve karşılaştırmayı much pekiştirir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The population of Istanbul is ---- than that of Ankara, and it is growing ---- faster.$q$, array[$o$large / even$o$, $o$larger / very$o$, $o$largest / so$o$, $o$more large / too$o$, $o$larger / even$o$], 4, $e$1. **Than** ile **larger** gelir: **larger**.
2. Karşılaştırmayı **even** pekiştirir: **even**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** karşılaştırmayı even pekiştirir / **C** than ile üstünlük kullanılmaz ve karşılaştırmayı even pekiştirir / **D** large -er alır ve karşılaştırmayı even pekiştirir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Neither the teacher ---- the students ---- the answer, so they asked the principal.$q$, array[$o$or / knew$o$, $o$nor / know$o$, $o$nor / knew$o$, $o$and / knows$o$, $o$but / known$o$], 2, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. Geçmiş anlatım Past Simple ister: **knew**.

Diğer şıklar: **A** neither ile nor kullanılır / **B** geçmiş anlatım gerekir / **D** neither ile nor kullanılır ve geçmiş anlatım gerekir / **E** neither ile nor kullanılır ve çekimli fiil gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The ---- the weather became, the ---- we were, so we decided to go home.$q$, array[$o$cold / unhappier$o$, $o$colder / unhappy$o$, $o$coldest / unhappiest$o$, $o$colder / unhappier$o$, $o$more cold / more unhappy$o$], 3, $e$1. **The + karşılaştırma** yapısı kullanılır: **colder**.
2. Aynı kurala göre: **unhappier**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **C** the + karşılaştırma ister ve the + karşılaştırma ister / **E** cold -er alır ve unhappy -er alır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He is not only talented ---- also hardworking, and he is ---- a good listener.$q$, array[$o$and / such$o$, $o$but / such$o$, $o$but / so$o$, $o$or / very$o$, $o$nor / too$o$], 1, $e$1. **Not only...but also** kalıbı kullanılır: **but**.
2. **Such a + isim** kalıbı kullanılır: **such**.

Diğer şıklar: **A** not only ile but also kullanılır / **C** a + isim önünde such gelir / **D** not only ile but also kullanılır ve a good listener önünde such gelir / **E** not only ile but also kullanılır ve anlam bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Her handwriting is ---- as mine, but her spelling is far ---- than mine.$q$, array[$o$same / better$o$, $o$the same / good$o$, $o$the same / better$o$, $o$like / best$o$, $o$similar / more good$o$], 2, $e$1. **The same as** kalıbı kullanılır: **the same**.
2. **Than** ile **better** gelir: **better**.

Diğer şıklar: **A** as ile the gerekir / **B** than ile karşılaştırma gerekir / **D** as ile the same kalıbı ve than ile üstünlük kullanılmaz / **E** as ile kullanılmaz ve good düzensizdir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The longer the film went on, the ---- bored the audience became, and the ---- they talked.$q$, array[$o$most / louder$o$, $o$more / loudest$o$, $o$much / loud$o$, $o$very / more loud$o$, $o$more / louder$o$], 4, $e$1. **The + karşılaştırma** yapısı kullanılır: **more**.
2. Aynı kurala göre: **louder**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **C** the + karşılaştırma ister ve the + karşılaştırma ister / **D** the + karşılaştırma ister ve loud -er alır.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$It is ---- the most difficult exam I have ever taken, and ---- the most important one.$q$, array[$o$far by / probably$o$, $o$by far / probable$o$, $o$much / probability$o$, $o$by far / probably$o$, $o$very / more probably$o$], 3, $e$1. Üstünlüğü **by far** pekiştirir: **by far**.
2. Zarf **probably** olur: **probably**.

Diğer şıklar: **A** by far kalıbı / **B** zarf gerekir / **C** the most ile by far kullanılır ve isimdir / **E** the most ile by far kullanılır ve anlam bozulur.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Neither my brother ---- my sister likes spicy food, so we ---- order anything hot.$q$, array[$o$or / never$o$, $o$nor / never$o$, $o$nor / ever$o$, $o$and / hardly$o$, $o$but / seldom$o$], 1, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. **Never** hiç anlamı verir: **never**.

Diğer şıklar: **A** neither ile nor kullanılır / **C** olumlu fiille never gerekir / **D** neither ile nor kullanılır ve anlam bozulur / **E** neither ile nor kullanılır ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$This year's profits are slightly ---- than last year's, but the sales are ---- higher.$q$, array[$o$high / considerably$o$, $o$higher / considerable$o$, $o$higher / considerably$o$, $o$highest / consider$o$, $o$more high / considering$o$], 2, $e$1. **Than** ile **higher** gelir: **higher**.
2. Karşılaştırmayı **considerably** pekiştirir: **considerably**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** zarf gerekir / **D** than ile üstünlük kullanılmaz ve fiildir / **E** high -er alır ve bağlaç işlevi görür.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Neither the director nor his assistants ---- willing to take responsibility for the failure, although the public demanded explanations.$q$, array[$o$were$o$, $o$was$o$, $o$is$o$, $o$has been$o$, $o$being$o$], 0, $e$1. **Neither ... nor** ile fiil en yakın özneye uyar: **were**.

Diğer şıklar: **B** nor sonrası en yakın özne çoğuldur / **C** geçmiş anlatım gerekir / **D** geçmiş anlatım gerekir / **E** geçmiş anlatım gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The new model is ---- as powerful as the old one, yet it uses only half as much energy.$q$, array[$o$double$o$, $o$twice$o$, $o$two$o$, $o$twofold$o$, $o$second$o$], 1, $e$1. **Twice as ... as**: **twice**.

Diğer şıklar: **A** twice as ... as kalıbı gerekir / **C** twice as ... as kalıbı gerekir / **D** biçim yanlış / **E** twice as ... as kalıbı gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is not so much a talented musician ---- a hard-working one, which explains why he has made such rapid progress.$q$, array[$o$than$o$, $o$but$o$, $o$like$o$, $o$as$o$, $o$that$o$], 3, $e$1. **Not so much A as B**: **as**.

Diğer şıklar: **A** not so much ... as kalıbı ister / **B** not so much ... as kalıbı ister / **C** not so much ... as kalıbı ister / **E** not so much ... as kalıbı ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The more she practised, the ---- she felt about her performance, and the less she worried, the ---- she played.$q$, array[$o$more confident / better$o$, $o$most confident / better$o$, $o$more confident / best$o$, $o$confident / well$o$, $o$confidenter / more well$o$], 0, $e$1. **The more ..., the more confident**, **the better**.

Diğer şıklar: **B** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** biçim yanlış ve well düzensizdir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$We should send the invitations as ---- as possible, since the sooner the guests know the date, the more likely they are to attend.$q$, array[$o$earlier$o$, $o$earliest$o$, $o$more early$o$, $o$earlily$o$, $o$early$o$], 4, $e$1. **As ... as possible**: **early**.

Diğer şıklar: **A** as ... as possible arasında yalın biçim gelir / **B** as ... as possible arasında yalın biçim gelir / **C** biçim yanlış / **D** zarf biçimi yok.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Comparison ve Correlatives konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$My house is ---- than yours, but your garden is ---- than mine.$q$, array[$o$small / bigger$o$, $o$smaller / big$o$, $o$smallest / biggest$o$, $o$more small / more big$o$, $o$smaller / bigger$o$], 4, $e$1. **Than** ile **smaller** gelir: **smaller**.
2. Aynı kurala göre: **bigger**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** than ile karşılaştırma ister / **C** than ile üstünlük kullanılmaz ve than ile üstünlük kullanılmaz / **D** small -er alır ve big -er alır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Mehmet is the ---- player in the team, and he is also the ----.$q$, array[$o$best / most experienced$o$, $o$better / most experienced$o$, $o$best / more experienced$o$, $o$good / experiencedest$o$, $o$most good / most experienced$o$], 0, $e$1. Düzensiz üstünlük **best** olur: **best**.
2. Uzun sıfatta **most experienced** kullanılır: **most experienced**.

Diğer şıklar: **B** takım içinde üstünlük gerekir / **C** takım içinde üstünlük gerekir / **D** takım içinde üstünlük gerekir ve biçim yanlış / **E** good düzensizdir ve doğru, şık eşleşmesi bozulur.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$This bag is ---- expensive as that one, but it is not as ----.$q$, array[$o$so / durable$o$, $o$as / durable$o$, $o$as / durabler$o$, $o$than / more durable$o$, $o$more / most durable$o$], 1, $e$1. **As...as** kalıbı kullanılır: **as**.
2. **As** sonrası yalın sıfat gelir: **durable**.

Diğer şıklar: **A** as ... as kalıbı ister / **C** biçim yanlış / **D** as ... as kalıbı ister ve as ... as arasında yalın sıfat gelir / **E** as ... as kalıbı ister ve as ... as arasında yalın sıfat gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Both my father ---- my mother work at the hospital, and neither of them ---- a car.$q$, array[$o$or / drives$o$, $o$and / driving$o$, $o$and / drives$o$, $o$nor / are driving$o$, $o$but / have drive$o$], 2, $e$1. **Both...and** kalıbı kullanılır: **and**.
2. **Neither of** tekil fiil ister: **drives**.

Diğer şıklar: **A** both ile and kullanılır / **B** neither of tekil fiil ister / **D** both ile and kullanılır ve neither of tekil fiil ister / **E** both ile and kullanılır ve biçim yanlış.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$You can either stay here ---- come with us, but you can't do ----.$q$, array[$o$or / both$o$, $o$nor / both$o$, $o$or / all$o$, $o$and / each$o$, $o$but / neither$o$], 0, $e$1. **Either...or** kalıbı kullanılır: **or**.
2. İki seçenek birlikte **both** ile söylenir: **both**.

Diğer şıklar: **B** either ile or kullanılır / **C** iki seçenek için both kullanılır / **D** either ile or kullanılır ve iki seçenek için both kullanılır / **E** either ile or kullanılır ve olumsuz fiille çift olumsuz olur.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$It is getting ---- and ---- difficult to find a job, as the competition becomes fiercer.$q$, array[$o$most / more$o$, $o$more / most$o$, $o$much / much$o$, $o$more / more$o$, $o$very / very$o$], 3, $e$1. **More and more** artan değişimi anlatır: **more**.
2. Aynı kurala göre: **more**.

Diğer şıklar: **A** more and more kalıbı ister / **B** more and more kalıbı ister / **C** more and more kalıbı ister ve more and more kalıbı ister / **E** more and more kalıbı ister ve more and more kalıbı ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ---- you spend on advertising, the ---- customers you will attract.$q$, array[$o$most / more$o$, $o$more / most$o$, $o$more / more$o$, $o$much / many$o$, $o$very / very$o$], 2, $e$1. **The more..., the more** yapısı kullanılır: **more**.
2. Aynı kurala göre: **more**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** the + karşılaştırma ister ve the + karşılaştırma ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He drives ---- carefully than his brother, but he is not as ---- as his father.$q$, array[$o$most / experienced$o$, $o$more / experienced$o$, $o$more / more experienced$o$, $o$much / experiencedly$o$, $o$very / most experienced$o$], 1, $e$1. **Than** ile **more carefully** gelir: **more**.
2. **As...as** arasında yalın sıfat gelir: **experienced**.

Diğer şıklar: **A** than ile karşılaştırma ister / **C** as ... as arasında yalın sıfat gelir / **D** than ile karşılaştırma ister ve as ... as arasında yalın sıfat gelir / **E** than ile karşılaştırma ister ve as ... as arasında yalın sıfat gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Of all the cities I have visited, Prague is ---- most beautiful, and I would like to go back ----.$q$, array[$o$a / again$o$, $o$the / before$o$, $o$this / already$o$, $o$the / again$o$, $o$that / yet$o$], 3, $e$1. Üstünlük **the most** ile kurulur: **the**.
2. **Again** yeniden anlamı verir: **again**.

Diğer şıklar: **A** üstünlük the ile kurulur / **B** again anlamı gerekir / **C** üstünlük the ile kurulur ve anlam bozulur / **E** üstünlük the ile kurulur ve anlam bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The patient is feeling ---- today than yesterday, so the doctor is ---- optimistic.$q$, array[$o$good / more$o$, $o$better / most$o$, $o$better / more$o$, $o$best / much$o$, $o$more good / very$o$], 2, $e$1. **Than** ile **better** gelir: **better**.
2. **More optimistic** karşılaştırma yapar: **more**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** zarf gerekir / **D** than ile üstünlük kullanılmaz ve optimistic ile more gerekir / **E** good düzensizdir ve optimistic ile more gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Neither the manager ---- his two assistants were informed of the change, and ---- of them complained.$q$, array[$o$or / none$o$, $o$nor / either$o$, $o$and / no$o$, $o$but / nobody$o$, $o$nor / none$o$], 4, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. **None of** ikiden çok kişi için kullanılır: **none**.

Diğer şıklar: **A** neither ile nor kullanılır / **B** ikiden çok kişi için none kullanılır / **C** neither ile nor kullanılır ve of ile kullanılmaz / **D** neither ile nor kullanılır ve of ile kullanılmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The exam was ---- harder than we expected, and ---- fewer students passed than last year.$q$, array[$o$very / far$o$, $o$much / very$o$, $o$so / so$o$, $o$much / far$o$, $o$too / too$o$], 3, $e$1. Karşılaştırmayı **much** pekiştirir: **much**.
2. **Far fewer** kalıbı kullanılır: **far**.

Diğer şıklar: **A** karşılaştırmayı much pekiştirir / **B** fewer ile far/many/a lot pekiştirir / **C** karşılaştırmayı much pekiştirir ve fewer ile far pekiştirir / **E** karşılaştırmayı much pekiştirir ve fewer ile far pekiştirir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The sooner we leave, the ---- we will arrive, and the ---- we arrive, the more time we will have.$q$, array[$o$soon / earlier$o$, $o$sooner / earlier$o$, $o$sooner / early$o$, $o$soonest / earliest$o$, $o$more soon / more early$o$], 1, $e$1. **The + karşılaştırma** yapısı kullanılır: **sooner**.
2. Aynı kurala göre: **earlier**.

Diğer şıklar: **A** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** soon -er alır ve early -er alır.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$This is by ---- the best restaurant in town, and it is ---- popular among tourists.$q$, array[$o$much / especially$o$, $o$far / especial$o$, $o$far / especially$o$, $o$very / specially$o$, $o$most / special$o$], 2, $e$1. Üstünlüğü **by far** pekiştirir: **far**.
2. Sıfatı **especially** niteler: **especially**.

Diğer şıklar: **A** by far kalıbı / **B** popular sıfatı zarfla nitelenir / **D** by far kalıbı ve special ile specially anlam farkı vardır / **E** by far kalıbı ve zarf gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He neither called me ---- sent me a message, and he didn't ---- explain why.$q$, array[$o$or / even$o$, $o$nor / still$o$, $o$and / yet$o$, $o$but / already$o$, $o$nor / even$o$], 4, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. **Didn't even** kalıbı kullanılır: **even**.

Diğer şıklar: **A** neither ile nor kullanılır / **B** didn't ile even kullanılır / **C** neither ile nor kullanılır ve didn't ile even kullanılır / **D** neither ile nor kullanılır ve didn't ile even kullanılır.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Not only ---- the report contain several factual errors, but it ---- misleading figures to support its conclusions.$q$, array[$o$does / also used$o$, $o$did / also used$o$, $o$did / used also$o$, $o$was / also uses$o$, $o$had / was using$o$], 1, $e$1. **Not only did**, **but ... also used**: **did / also used**.

Diğer şıklar: **A** geçmiş anlatım gerekir / **C** sıra bozulur / **D** Not only sonrası did gerekir ve geçmiş anlatım gerekir / **E** Not only sonrası did gerekir ve tamamlanmış eylem anlatılıyor.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Neither the board ---- the shareholders seem to have a clear plan for the company's survival.$q$, array[$o$nor$o$, $o$or$o$, $o$and$o$, $o$but$o$, $o$either$o$], 0, $e$1. **Neither ... nor**: **nor**.

Diğer şıklar: **B** neither ile nor kullanılır / **C** neither ile nor kullanılır / **D** neither ile nor kullanılır / **E** neither ile nor kullanılır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The earlier you apply, the ---- your chances of getting a place, and the ---- you prepare, the less nervous you will feel.$q$, array[$o$good / more thoroughly$o$, $o$better / thorough$o$, $o$best / more thorough$o$, $o$more good / thoroughly$o$, $o$better / more thoroughly$o$], 4, $e$1. **The earlier ..., the better**, **the more thoroughly**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma zarf ister / **C** the + karşılaştırma ister ve prepare fiilini zarf niteler / **D** good düzensizdir ve the + karşılaştırma gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The play was not ---- as interesting as I had been led to believe.$q$, array[$o$very$o$, $o$much$o$, $o$more$o$, $o$nearly$o$, $o$so many$o$], 3, $e$1. **Not nearly as ... as**: **nearly**.

Diğer şıklar: **A** not nearly as ... as kalıbı gerekir / **B** not nearly as ... as kalıbı gerekir / **C** as ... as kalıbı ister / **E** anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He would ---- work late every night than let his clients down, and he is ---- the most reliable lawyer in the firm.$q$, array[$o$rather / by far$o$, $o$sooner than / by far$o$, $o$rather / far by$o$, $o$better / much$o$, $o$prefer / very$o$], 0, $e$1. **Would rather ... than**, **by far the most**: **rather / by far**.

Diğer şıklar: **B** would sooner kalıbı, rather ile birlikte kullanılmaz / **C** by far kalıbı / **D** would better kalıbı yanlış ve the most ile by far gelir / **E** would prefer ... than kalıbı ve the most ile by far gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Comparison ve Correlatives konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$This road is ---- than the old one, but it is not as ---- as the highway.$q$, array[$o$wide / fast$o$, $o$wider / faster$o$, $o$wider / fast$o$, $o$widest / fastest$o$, $o$more wide / more fast$o$], 2, $e$1. **Than** ile **wider** gelir: **wider**.
2. **As...as** arasında yalın sıfat gelir: **fast**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** as ... as arasında yalın sıfat gelir / **D** than ile üstünlük kullanılmaz ve as ... as arasında yalın sıfat gelir / **E** wide -er alır ve as ... as arasında yalın sıfat gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She is ---- girl in her class, and her brother is the oldest ---- of the family.$q$, array[$o$cleverer / member$o$, $o$the cleverest / members$o$, $o$clever / memberest$o$, $o$the cleverest / member$o$, $o$more clever / membering$o$], 3, $e$1. Üstünlük **the cleverest** ile söylenir: **the cleverest**.
2. Tekil isim gelir: **member**.

Diğer şıklar: **A** class içinde üstünlük gerekir / **B** tekil isim gerekir / **C** üstünlük gerekir ve biçim yanlış / **E** üstünlük gerekir ve biçim yanlış.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The ---- you eat, the ---- weight you gain, so be careful.$q$, array[$o$most / more$o$, $o$more / most$o$, $o$much / much$o$, $o$very / very$o$, $o$more / more$o$], 4, $e$1. **The more..., the more** yapısı kullanılır: **more**.
2. Aynı kurala göre: **more**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **C** the + karşılaştırma ister ve the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$You can pay either by cash ---- by credit card, but you can't pay ---- cheque.$q$, array[$o$or / by$o$, $o$nor / by$o$, $o$or / on$o$, $o$and / at$o$, $o$but / from$o$], 0, $e$1. **Either...or** kalıbı kullanılır: **or**.
2. **Pay by cheque** kalıbı kullanılır: **by**.

Diğer şıklar: **B** either ile or kullanılır / **C** pay by cheque kalıbı / **D** either ile or kullanılır ve pay by cheque kalıbı / **E** either ile or kullanılır ve pay by cheque kalıbı.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Neither Ali ---- Veli passed the exam, so ---- of them can go to university this year.$q$, array[$o$or / neither$o$, $o$nor / all$o$, $o$nor / neither$o$, $o$and / both$o$, $o$but / either$o$], 2, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. İki kişi için **neither of** kullanılır: **neither**.

Diğer şıklar: **A** neither ile nor kullanılır / **B** iki kişi için neither kullanılır / **D** neither ile nor kullanılır ve olumsuz anlam gerekir / **E** neither ile nor kullanılır ve olumsuz anlam gerekir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The population of China is much ---- than that of Japan, and the cities are ---- crowded.$q$, array[$o$large / more$o$, $o$larger / most$o$, $o$largest / much$o$, $o$more large / very$o$, $o$larger / more$o$], 4, $e$1. **Than** ile **larger** gelir: **larger**.
2. **More crowded** karşılaştırma yapar: **more**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** crowded ile more gerekir / **C** than ile üstünlük kullanılmaz ve crowded ile more gerekir / **D** large -er alır ve karşılaştırma gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She is not ---- tall as her brother, but she is ---- stronger.$q$, array[$o$less / much$o$, $o$as / much$o$, $o$as / very$o$, $o$more / so$o$, $o$than / too$o$], 1, $e$1. **Not as...as** kalıbı kullanılır: **as**.
2. Karşılaştırmayı **much** pekiştirir: **much**.

Diğer şıklar: **A** not as ... as kalıbı ister / **C** karşılaştırmayı much pekiştirir / **D** not as ... as kalıbı ister ve karşılaştırmayı much pekiştirir / **E** not as ... as kalıbı ister ve karşılaştırmayı much pekiştirir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Prices are rising ---- and ----, and families can hardly afford basic goods.$q$, array[$o$faster / faster$o$, $o$fast / faster$o$, $o$faster / fast$o$, $o$fastest / fastest$o$, $o$more fast / more fast$o$], 0, $e$1. **Faster and faster** artan değişimi anlatır: **faster**.
2. Aynı kurala göre: **faster**.

Diğer şıklar: **B** faster and faster kalıbı / **C** faster and faster kalıbı / **D** faster and faster kalıbı ve faster and faster kalıbı / **E** faster and faster kalıbı ve faster and faster kalıbı.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Neither of the answers ---- correct, but the second is ---- better than the first.$q$, array[$o$being / slightly$o$, $o$is / slight$o$, $o$were / slightness$o$, $o$have been / slighter$o$, $o$is / slightly$o$], 4, $e$1. **Neither of** tekil fiil ister: **is**.
2. Karşılaştırmayı **slightly** zayıflatır: **slightly**.

Diğer şıklar: **A** neither of tekil fiil ister / **B** karşılaştırmayı slightly pekiştirir / **C** şimdiki anlatım is ister ve isimdir / **D** şimdiki anlatım is ister ve karşılaştırma tekrarlanır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$This is the ---- problem I have ever faced, and it is ---- harder than the previous one.$q$, array[$o$baddest / far$o$, $o$worst / very$o$, $o$most bad / so$o$, $o$worst / far$o$, $o$worse / too$o$], 3, $e$1. Düzensiz üstünlük **worst** olur: **worst**.
2. Karşılaştırmayı **far** pekiştirir: **far**.

Diğer şıklar: **A** bad düzensizdir / **B** karşılaştırmayı far pekiştirir / **C** bad düzensizdir ve karşılaştırmayı far pekiştirir / **E** üstünlük gerekir ve karşılaştırmayı far pekiştirir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$He is ---- than his father, and he is almost as ---- as his grandfather.$q$, array[$o$taller / tall$o$, $o$tall / tall$o$, $o$taller / taller$o$, $o$tallest / tallest$o$, $o$more tall / more tall$o$], 0, $e$1. **Than** ile **taller** gelir: **taller**.
2. **As...as** arasında yalın sıfat gelir: **tall**.

Diğer şıklar: **B** than ile karşılaştırma ister / **C** as ... as arasında yalın sıfat gelir / **D** than ile üstünlük kullanılmaz ve as ... as arasında yalın sıfat gelir / **E** tall -er alır ve as ... as arasında yalın sıfat gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Prices are ---- lower than they were last year, and ---- fewer people are complaining.$q$, array[$o$slight / far$o$, $o$slightly / far$o$, $o$slightly / very$o$, $o$slightest / so$o$, $o$slightness / too$o$], 1, $e$1. Karşılaştırmayı **slightly** zayıflatır: **slightly**.
2. **Far fewer** kalıbı kullanılır: **far**.

Diğer şıklar: **A** karşılaştırmayı slightly zayıflatır / **C** fewer ile far/many/a lot pekiştirir / **D** biçim yanlış ve fewer ile far pekiştirir / **E** isimdir ve fewer ile far pekiştirir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Both my sisters ---- doctors, and neither of them ---- to move abroad.$q$, array[$o$is / wants$o$, $o$are / wanting$o$, $o$be / are wanting$o$, $o$are / wants$o$, $o$being / have wanted$o$], 3, $e$1. **Both** çoğul fiil ister: **are**.
2. **Neither of** tekil fiil ister: **wants**.

Diğer şıklar: **A** both çoğul fiil ister / **B** neither of tekil fiil ister / **C** çekimli fiil gerekir ve neither of tekil fiil ister / **E** çekimli fiil gerekir ve neither of tekil fiil ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The higher you climb, the ---- the air becomes, and the ---- it gets to breathe.$q$, array[$o$thinner / harder$o$, $o$thin / harder$o$, $o$thinner / hard$o$, $o$thinnest / hardest$o$, $o$more thin / more hard$o$], 0, $e$1. **The + karşılaştırma** yapısı kullanılır: **thinner**.
2. Aynı kurala göre: **harder**.

Diğer şıklar: **B** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** thin -er alır ve hard -er alır.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The test was ---- difficult as we had feared, but it was ---- longer than usual.$q$, array[$o$no / considerably$o$, $o$not as / considerable$o$, $o$not as / considerably$o$, $o$less / consider$o$, $o$not so / considering$o$], 2, $e$1. **Not as...as** kalıbı kullanılır: **not as**.
2. Karşılaştırmayı **considerably** pekiştirir: **considerably**.

Diğer şıklar: **A** not as ... as kalıbı ister / **B** zarf gerekir / **D** not as ... as kalıbı ister ve fiildir / **E** so ... as olumsuzda kullanılabilir, şık eşleşmesi bozulur ve bağlaç işlevi görür.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Of the two candidates, Selin is ---- experienced, but her rival is ---- the more ambitious.$q$, array[$o$most / clearly$o$, $o$the more / clearly$o$, $o$the more / clear$o$, $o$more / clearer$o$, $o$the most / clearest$o$], 1, $e$1. **İki kişi arasında**: **the more**. **Clearly the more ambitious**.

Diğer şıklar: **A** iki kişi arasında the more gerekir / **C** the more ambitious önünde zarf gerekir / **D** the more kalıbı tercih edilir ve biçim yanlış / **E** üç ve üzeri için ve biçim yanlış.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The new regulations are ---- stricter than those in force last year, and compliance costs are correspondingly higher.$q$, array[$o$considerable$o$, $o$consider$o$, $o$considering$o$, $o$considerably$o$, $o$considerate$o$], 3, $e$1. **Karşılaştırmayı pekiştiren zarf**: **considerably**.

Diğer şıklar: **A** zarf gerekir / **B** fiildir / **C** bağlaç işlevi görür / **E** anlam farklıdır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Whether you choose the cheaper option ---- the more expensive one, the quality of service will be much the same.$q$, array[$o$nor$o$, $o$and$o$, $o$or$o$, $o$but$o$, $o$than$o$], 2, $e$1. **Whether ... or**: **or**.

Diğer şıklar: **A** whether ile or kullanılır / **B** whether ile or kullanılır / **D** whether ile or kullanılır / **E** whether ile or kullanılır.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Both the teachers ---- the parents were concerned about the new curriculum, and neither group ---- consulted before the decision was made.$q$, array[$o$or / was$o$, $o$and / was$o$, $o$and / were$o$, $o$nor / had$o$, $o$but / is$o$], 1, $e$1. **Both ... and**, **neither group was**.

Diğer şıklar: **A** both ile and kullanılır / **C** neither group tekil fiil ister / **D** both ile and kullanılır ve edilgen yapı gerekir / **E** both ile and kullanılır ve geçmiş anlatım gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She is ---- more intelligent than her brother, but he is ---- more hard-working than she is.$q$, array[$o$very / much$o$, $o$far / very$o$, $o$so / so$o$, $o$too / too$o$, $o$far / much$o$], 4, $e$1. **Far/much more**: **far / much**.

Diğer şıklar: **A** karşılaştırmayı far/much pekiştirir / **B** karşılaştırmayı far/much pekiştirir / **C** karşılaştırmayı far/much pekiştirir ve karşılaştırmayı far/much pekiştirir / **D** karşılaştırmayı far/much pekiştirir ve karşılaştırmayı far/much pekiştirir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Comparison ve Correlatives konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conditionals konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$If you ---- ice, it ---- into water, so be careful.$q$, array[$o$heated / melts$o$, $o$heat / melted$o$, $o$will heat / will melt$o$, $o$would heat / would melt$o$, $o$heat / melts$o$], 4, $e$1. Genel doğruda **if + Present Simple** kullanılır: **heat**.
2. Sonuç Present Simple ile devam eder: **melts**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **C** if cümlesinde will kullanılmaz ve genel doğruda Present Simple tercih edilir / **D** genel doğru Present Simple ister ve genel doğruda would kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If it ---- tomorrow, we ---- the match, so let's hope for good weather.$q$, array[$o$will rain / will cancel$o$, $o$rains / cancelled$o$, $o$rained / would cancel$o$, $o$rains / will cancel$o$, $o$is raining / cancel$o$], 3, $e$1. Gerçekçi koşulda **if + Present Simple** kullanılır: **rains**.
2. Sonuç **will + V1** ile verilir: **will cancel**.

Diğer şıklar: **A** if cümlesinde will kullanılmaz / **B** sonuç cümlesi will ister / **C** gerçekçi koşul Present Simple ister ve gerçekçi koşulda will gelir / **E** gelecek koşul Present Simple ister ve gelecek kararı will ile verilir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If I ---- you, I ---- that job offer without thinking twice.$q$, array[$o$am / would accept$o$, $o$were / will accept$o$, $o$were / would accept$o$, $o$was / accepted$o$, $o$would be / have accepted$o$], 2, $e$1. **If I were you** gerçek dışı tavsiye kurar: **were**.
2. Sonuç **would + V1** ile verilir: **would accept**.

Diğer şıklar: **A** gerçek dışı durumda were kullanılır / **B** gerçek dışı sonuç would ister / **D** resmi anlatımda were tercih edilir ve sonuç cümlesi would ister / **E** if cümlesinde would kullanılmaz ve sonuç cümlesi would ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$If she ---- the bus, she ---- late for the interview, but luckily she caught it.$q$, array[$o$had missed / would have been$o$, $o$missed / would have been$o$, $o$had missed / would be$o$, $o$has missed / was$o$, $o$would miss / had been$o$], 0, $e$1. Geçmiş gerçek dışılık **if + Past Perfect** ile kurulur: **had missed**.
2. Sonuç **would have + V3** ile verilir: **would have been**.

Diğer şıklar: **B** geçmiş gerçek dışılık Past Perfect ister / **C** geçmiş sonucu would have + V3 ister / **D** geçmiş gerçek dışılık Past Perfect ister ve geçmiş sonucu would have + V3 ister / **E** if cümlesinde would olmaz ve sonuç cümlesinde would have gerekir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- you study hard, you will pass the exam, but ---- you don't, you will fail.$q$, array[$o$Unless / if$o$, $o$If / Unless$o$, $o$When / Although$o$, $o$If / if$o$, $o$Although / Because$o$], 3, $e$1. Olumlu koşul **if** ile kurulur: **If**.
2. Olumsuz koşul **if...don't** ile kurulur: **if**.

Diğer şıklar: **A** olumlu koşul if ister / **B** olumsuz fiille unless kullanılmaz / **C** koşul if ister ve koşul if ister / **E** koşul if ister ve koşul if ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- you leave now, you will miss the train, but you will catch it ---- you hurry.$q$, array[$o$Because / if$o$, $o$Unless / if$o$, $o$Unless / unless$o$, $o$Although / although$o$, $o$While / because$o$], 1, $e$1. **Unless** olumsuz koşul bildirir: **Unless**.
2. Olumlu koşul **if** ile kurulur: **if**.

Diğer şıklar: **A** koşul anlamı unless ister / **C** olumlu koşul if ister / **D** koşul anlamı unless ister ve koşul anlamı bozulur / **E** koşul anlamı unless ister ve koşul anlamı bozulur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I would ---- you if I ---- your phone number, but I lost it.$q$, array[$o$call / had$o$, $o$called / had$o$, $o$call / have$o$, $o$calling / will have$o$, $o$to call / would have$o$], 0, $e$1. **Would** sonrasında yalın fiil gelir: **call**.
2. Gerçek dışı koşul **if + Past Simple** ile kurulur: **had**.

Diğer şıklar: **B** would sonrasında yalın fiil gelir / **C** gerçek dışı koşul Past Simple ister / **D** would sonrasında yalın fiil gelir ve if cümlesinde will kullanılmaz / **E** would sonrasında yalın fiil gelir ve if cümlesinde would olmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$If he ---- harder when he was young, he ---- a better job now.$q$, array[$o$worked / would have$o$, $o$had worked / will have$o$, $o$has worked / would have had$o$, $o$would work / has$o$, $o$had worked / would have$o$], 4, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had worked**.
2. Şimdiki sonuç **would + V1** ile verilir: **would have**.

Diğer şıklar: **A** karma koşulda Past Perfect gerekir / **B** karma koşulda would + V1 gelir / **C** geçmiş koşulda Past Perfect gerekir ve now şimdiki sonuç ister / **D** if cümlesinde would olmaz ve gerçek dışı sonuç would ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$We'll go for a picnic ---- the weather is fine, but we will stay at home ---- it rains.$q$, array[$o$unless / if$o$, $o$provided / if$o$, $o$provided / unless$o$, $o$otherwise / provided$o$, $o$although / so that$o$], 1, $e$1. **Provided (that)** koşul bildirir: **provided**.
2. Olumlu koşul **if** ile kurulur: **if**.

Diğer şıklar: **A** olumlu koşul anlamı bozulur / **C** olumsuz fiilsiz unless anlamı bozulur / **D** bağlaç değildir ve anlam yönü uymaz / **E** koşul anlamı bozulur ve anlam yönü uymaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Take an umbrella ---- it rains later, because the forecast is not clear.$q$, array[$o$unless$o$, $o$although$o$, $o$in case$o$, $o$so that$o$, $o$whereas$o$], 2, $e$1. **In case** önlem bildirir: **in case**.

Diğer şıklar: **A** önlem anlamı vermez / **B** zıtlık anlamı yaratır / **D** amaç bildirir / **E** zıtlık anlamı yaratır.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$If the company ---- more money last year, it ---- the new factory by now.$q$, array[$o$invested / would have built$o$, $o$had invested / would build$o$, $o$invests / built$o$, $o$had invested / would have built$o$, $o$would invest / will have built$o$], 3, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had invested**.
2. Sonuç **would have + V3** ile verilir: **would have built**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **B** by now sonucu would have + V3 ister / **C** geçmiş koşul Past Perfect ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve gerçek dışı sonuç would ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He ---- never have found the house if his neighbour ---- him the directions.$q$, array[$o$would / hadn't given$o$, $o$will / hadn't given$o$, $o$would / didn't give$o$, $o$can / wouldn't give$o$, $o$must / hasn't given$o$], 0, $e$1. Sonuç **would never have + V3** ile verilir: **would**.
2. Geçmiş koşul **if + Past Perfect** ile kurulur: **hadn't given**.

Diğer şıklar: **B** üçüncü tip koşul would have ister / **C** üçüncü tip koşul Past Perfect ister / **D** üçüncü tip koşul would have ister ve if cümlesinde would olmaz / **E** üçüncü tip koşul would have ister ve geçmiş koşul Past Perfect ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Suppose you ---- a million pounds, what ---- you do with the money?$q$, array[$o$have won / would$o$, $o$won / will$o$, $o$will win / did$o$, $o$would win / shall$o$, $o$won / would$o$], 4, $e$1. **Suppose** gerçek dışı durumda Past Simple alır: **won**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** gerçek dışı şimdi Past Simple ister / **B** gerçek dışı sonuç would ister / **C** Suppose gerçek dışı Past Simple ister ve sonuç cümlesinde would gerekir / **D** Suppose sonrasında would olmaz ve gerçek dışı sonuç would ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$You can borrow my car ---- you promise to drive carefully, otherwise I ---- be able to trust you.$q$, array[$o$unless / won't$o$, $o$as long as / won't$o$, $o$as long as / couldn't have$o$, $o$although / shouldn't$o$, $o$despite / can't$o$], 1, $e$1. **As long as** koşul bildirir: **as long as**.
2. Gerçekçi sonuç **won't** ile verilir: **won't**.

Diğer şıklar: **A** olumsuz anlam yaratır / **C** gerçekçi sonuç won't ister / **D** zıtlık anlamı yaratır ve anlam bozulur / **E** edat olarak kullanılır ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$If the water ---- to boil away, the pan ---- empty, so turn off the gas immediately.$q$, array[$o$had / would be$o$, $o$were / will be$o$, $o$were / would be$o$, $o$is going / was$o$, $o$would / is$o$], 2, $e$1. Gerçek dışı koşulda **were** kullanılır: **were**.
2. Sonuç **would + V1** ile verilir: **would be**.

Diğer şıklar: **A** if cümlesinde gerçek dışı Past Simple ister / **B** gerçek dışı sonuç would ister / **D** anlam bozulur ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If the board ---- the warnings last year, the company ---- in such serious financial trouble today.$q$, array[$o$heeded / wouldn't be$o$, $o$had heeded / hadn't been$o$, $o$heeds / won't be$o$, $o$would heed / isn't$o$, $o$had heeded / wouldn't be$o$], 4, $e$1. **Karma koşul** (geçmiş neden, şimdiki sonuç): **had heeded / wouldn't be**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **B** today şimdiki sonuç ister / **C** geçmiş koşul Past Perfect ister ve karma koşulda would ister / **D** if cümlesinde would olmaz ve gerçek dışı sonuç would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I would not be sitting here today ---- it ---- for the generosity of a stranger who paid for my education.$q$, array[$o$unless / hadn't been$o$, $o$if / won't be$o$, $o$although / isn't$o$, $o$if / hadn't been$o$, $o$because / wasn't$o$], 3, $e$1. **If it hadn't been for** kalıbı: **if / hadn't been**.

Diğer şıklar: **A** olumsuz koşul anlamı verir, but for ile çelişir / **B** geçmiş etkili koşul hadn't been ister / **C** zıtlık anlamı verir ve gerçek dışı koşul gerekir / **E** sebep anlamı verir ve geçmiş etkili koşul hadn't been ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- the government to raise taxes, many small businesses would be forced to close down.$q$, array[$o$Was$o$, $o$Should$o$, $o$Were$o$, $o$Had$o$, $o$If$o$], 2, $e$1. **Were + özne + to + V1**: gerçek dışı devrik koşul: **Were**.

Diğer şıklar: **A** resmi gerçek dışı devrik yapıda Were gerekir / **B** gerçek dışı değil gerçekçi koşul anlamı verir / **D** geçmiş koşul anlamı verir / **E** devrik yapı Were ile kurulur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- you need further assistance, please do not hesitate to contact our customer service team.$q$, array[$o$Would$o$, $o$Should$o$, $o$Could$o$, $o$Might$o$, $o$Had$o$], 1, $e$1. **Should + özne** devrik gerçekçi koşul: **Should**.

Diğer şıklar: **A** gerçekçi koşul Should ile kurulur / **C** gerçekçi koşul Should ile kurulur / **D** gerçekçi koşul Should ile kurulur / **E** geçmiş koşul anlamı verir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$We will go ahead with the plan ---- the funding is approved by the end of the month.$q$, array[$o$provided that$o$, $o$unless$o$, $o$although$o$, $o$as if$o$, $o$in case$o$], 0, $e$1. **Provided that**: koşul bildirir.

Diğer şıklar: **B** olumsuz koşul anlamı verir, onay gerekliliği zıt kalır / **C** zıtlık anlamı verir / **D** gerçek dışı karşılaştırma verir / **E** önlem anlamı verir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conditionals konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conditionals konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$If you ---- me, I ---- you with the homework, but I'm too busy.$q$, array[$o$ask / would help$o$, $o$asked / will help$o$, $o$will ask / helped$o$, $o$had asked / have helped$o$, $o$asked / would help$o$], 4, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **asked**.
2. Sonuç **would + V1** ile verilir: **would help**.

Diğer şıklar: **A** gerçek dışı koşul Past Simple ister / **B** gerçek dışı sonuç would ister / **C** if cümlesinde will olmaz ve sonuç cümlesi would ister / **D** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If you ---- the button, the machine ---- automatically.$q$, array[$o$pressed / starts$o$, $o$press / started$o$, $o$will press / would start$o$, $o$press / starts$o$, $o$would press / had started$o$], 3, $e$1. Genel doğruda **if + Present Simple** kullanılır: **press**.
2. Sonuç Present Simple ile söylenir: **starts**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **C** if cümlesinde will olmaz ve genel doğruda would olmaz / **E** genel doğru Present Simple ister ve genel doğruda geçmiş olmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If I ---- him yesterday, I ---- him the news, but I didn't see him.$q$, array[$o$saw / would have told$o$, $o$had seen / would tell$o$, $o$had seen / would have told$o$, $o$see / told$o$, $o$would see / had told$o$], 2, $e$1. Geçmiş gerçek dışılık **if + Past Perfect** ile kurulur: **had seen**.
2. Sonuç **would have + V3** ile verilir: **would have told**.

Diğer şıklar: **A** geçmiş gerçek dışılık Past Perfect ister / **B** geçmiş sonucu would have + V3 ister / **D** geçmiş gerçek dışılık Past Perfect ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I'll lend you the book ---- you return it by Friday, but I ---- lend it to you if you lose things.$q$, array[$o$unless / won't$o$, $o$provided / won't$o$, $o$provided / wouldn't$o$, $o$although / can't$o$, $o$despite / shouldn't$o$], 1, $e$1. **Provided (that)** koşul bildirir: **provided**.
2. Gerçekçi sonuç **won't** ile verilir: **won't**.

Diğer şıklar: **A** olumsuz anlam yaratır / **C** gerçekçi sonuç won't ister / **D** zıtlık anlamı yaratır ve anlam bozulur / **E** edat olarak kullanılır ve anlam bozulur.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- it rains, we will stay at home, but ---- it is sunny, we will go to the beach.$q$, array[$o$Unless / if$o$, $o$If / unless$o$, $o$Because / because$o$, $o$If / if$o$, $o$Although / although$o$], 3, $e$1. Koşul **if** ile kurulur: **If**.
2. Aynı kurala göre: **if**.

Diğer şıklar: **A** olumlu koşul if ister / **B** olumlu koşul if ister / **C** koşul if ister ve koşul if ister / **E** koşul if ister ve koşul if ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$If you had left earlier, you ---- stuck in the traffic now, and you ---- the beginning of the film.$q$, array[$o$won't be / wouldn't have missed$o$, $o$wouldn't be / won't miss$o$, $o$wouldn't be / wouldn't have missed$o$, $o$aren't / didn't miss$o$, $o$hadn't been / hadn't missed$o$], 2, $e$1. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.
2. Geçmiş sonuç **would have + V3** ile verilir: **wouldn't have missed**.

Diğer şıklar: **A** karma koşulda would gerekir / **B** geçmiş sonuç wouldn't have + V3 ister / **D** karma koşulda would gerekir ve sonuç cümlesi would ister / **E** now şimdiki sonuç ister ve sonuç cümlesi would ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$If only I ---- more money, I ---- that expensive house, but I can't afford it.$q$, array[$o$had / would buy$o$, $o$have / would buy$o$, $o$had / will buy$o$, $o$will have / bought$o$, $o$would have / have bought$o$], 0, $e$1. **If only + Past Simple** gerçek dışı dilek kurar: **had**.
2. Sonuç **would + V1** ile verilir: **would buy**.

Diğer şıklar: **B** gerçek dışı dilek Past Simple ister / **C** gerçek dışı sonuç would ister / **D** if only sonrasında will olmaz ve sonuç cümlesi would ister / **E** if only sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$If you ---- to see the manager, ---- him that the report is ready.$q$, array[$o$had happened / tell$o$, $o$happen / tell$o$, $o$happen / told$o$, $o$will happen / telling$o$, $o$would happen / to tell$o$], 1, $e$1. **If you happen to** olasılık bildirir: **happen**.
2. Emir kipi yalın fiille kurulur: **tell**.

Diğer şıklar: **A** imperative ile Present Simple gelir / **C** if cümlesinden sonra emir kipi gelir / **D** if cümlesinde will olmaz ve if cümlesinden sonra emir kipi gelir / **E** if cümlesinde would olmaz ve if cümlesinden sonra emir kipi gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'll call you as soon as I ---- there, and if you ---- me, I'll ask my brother to pick you up.$q$, array[$o$will get / need$o$, $o$get / will need$o$, $o$got / needed$o$, $o$have got / would need$o$, $o$get / need$o$], 4, $e$1. **As soon as** sonrasında gelecek için Present Simple gelir: **get**.
2. **If** sonrasında Present Simple gelir: **need**.

Diğer şıklar: **A** as soon as sonrasında will olmaz / **B** if cümlesinde will olmaz / **C** gelecek zaman Present Simple ister ve gerçekçi koşul Present Simple ister / **D** anlam bozulur ve gerçekçi koşul Present Simple ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$If I ---- the lottery, I ---- round the world, but the chance is very small.$q$, array[$o$won / would travel$o$, $o$win / would travel$o$, $o$won / will travel$o$, $o$had won / travelled$o$, $o$would win / have travelled$o$], 0, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **won**.
2. Sonuç **would + V1** ile verilir: **would travel**.

Diğer şıklar: **B** gerçek dışı koşul Past Simple ister / **C** gerçek dışı sonuç would ister / **D** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$You won't succeed ---- you try harder, and you will regret it ---- you give up now.$q$, array[$o$if / if$o$, $o$unless / unless$o$, $o$unless / if$o$, $o$although / although$o$, $o$because / because$o$], 2, $e$1. **Unless** olumsuz koşul bildirir: **unless**.
2. Olumlu koşul **if** ile kurulur: **if**.

Diğer şıklar: **A** unless olumsuz anlam taşır, won't succeed ile birlikte unless gerekir / **B** olumlu sonuç gerekir, if kullanılır / **D** zıtlık anlamı yaratır ve zıtlık anlamı yaratır / **E** sebep anlamı yaratır ve sebep anlamı yaratır.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$If I had known you were ill, I ---- you, but nobody told me about it until yesterday.$q$, array[$o$will visit$o$, $o$would visit$o$, $o$visited$o$, $o$would have visited$o$, $o$have visited$o$], 3, $e$1. Geçmiş sonuç **would have + V3** ile verilir: **would have visited**.

Diğer şıklar: **A** geçmiş sonuç would have + V3 ister / **B** geçmiş sonuç would have + V3 ister / **C** sonuç cümlesi would ister / **E** sonuç cümlesi would ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Unless the government ---- action soon, the situation ---- even worse.$q$, array[$o$will take / will get$o$, $o$takes / would get$o$, $o$took / got$o$, $o$has taken / gets$o$, $o$takes / will get$o$], 4, $e$1. **Unless** sonrasında Present Simple gelir: **takes**.
2. Gerçekçi sonuç **will + V1** ile verilir: **will get**.

Diğer şıklar: **A** unless sonrasında will olmaz / **B** gerçekçi sonuç will ister / **C** gerçekçi koşul Present Simple ister ve gerçekçi sonuç will ister / **D** gelecek koşul Present Simple ister ve gelecek tahmin will ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Had the company invested in new technology a decade ago, it ---- its rivals at that time with ease, but it chose to economise instead.$q$, array[$o$can outperform$o$, $o$could have outperformed$o$, $o$will have outperformed$o$, $o$could outperform$o$, $o$must have outperformed$o$], 1, $e$1. **Had + özne + V3**: **could have outperformed**.

Diğer şıklar: **A** Had devrik yapı geçmiş koşul would/could have ister / **C** geçmiş gerçek dışı sonuç could have ister / **D** geçmiş sonuç perfect ister / **E** çıkarım anlamı verir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$If I ---- you, I ---- accepting their offer without reading the small print, because the conditions are far from generous.$q$, array[$o$am / wouldn't consider$o$, $o$were / won't consider$o$, $o$were / wouldn't consider$o$, $o$had been / don't consider$o$, $o$would be / wouldn't have considered$o$], 2, $e$1. **If I were you**: **were / wouldn't consider**.

Diğer şıklar: **A** gerçek dışı tavsiye were ister / **B** gerçek dışı sonuç would ister / **D** şimdiki tavsiye Past Simple ister ve gerçek dışı sonuç would ister / **E** if cümlesinde would olmaz ve şimdiki tavsiye için geçmiş sonuç gerekmez.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$---- it not been for the heroic efforts of the rescue workers, the death toll in last year's disaster ---- far higher.$q$, array[$o$Had / would have been$o$, $o$If / would have been$o$, $o$Had / would be$o$, $o$Were / will be$o$, $o$Should / had been$o$], 0, $e$1. **Had it not been for**: **Had / would have been**.

Diğer şıklar: **B** if olmadan devrik yapı Had ile kurulur / **C** geçmiş sonuç perfect ister / **D** geçmiş koşul Had ister ve geçmiş sonuç perfect ister / **E** gerçekçi koşul anlamı verir ve sonuç cümlesinde would gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$You will not get a refund ---- you can show the receipt, and even then the shop ---- the right to refuse.$q$, array[$o$if / reserves$o$, $o$unless / reserved$o$, $o$although / is reserving$o$, $o$since / has reserved$o$, $o$unless / reserves$o$], 4, $e$1. **Unless** olumsuz koşul bildirir: **unless / reserves**.

Diğer şıklar: **A** olumsuz koşul unless ister / **B** Present Simple genel kural ister / **C** zıtlık anlamı verir ve durum fiili sürekli yapı almaz / **D** sebep anlamı verir ve genel kural Present Simple ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$If you happen ---- see him, tell him that the documents ---- by courier this afternoon.$q$, array[$o$for / have been sent$o$, $o$to / have been sent$o$, $o$to / will send$o$, $o$on / were sent$o$, $o$at / sent$o$], 1, $e$1. **Happen to + V1**: **to**. Edilgen Present Perfect: **have been sent**.

Diğer şıklar: **A** happen to kalıbı / **C** documents edilgen yapı ister / **D** happen to kalıbı ve this afternoon yakın geleceği ya da sonucu ifade eder, Present Perfect ister / **E** happen to kalıbı ve documents edilgen yapı ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Were it not for the scholarship, he ---- study abroad, and he says he ---- always be grateful for it.$q$, array[$o$couldn't / will$o$, $o$can't / will$o$, $o$couldn't / is$o$, $o$won't be able to / was$o$, $o$hadn't / had been$o$], 0, $e$1. **Were it not for** gerçek dışı şimdiki koşuldur: **couldn't**.
2. **Will always be** gelecek bildirir: **will**.

Diğer şıklar: **B** gerçek dışı sonuç could ister / **C** always be ile will gerekir / **D** gerçek dışı sonuç could ister ve always be ile will gerekir / **E** anlam bozulur ve always be ile will gerekir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Supposing the plane ---- delayed, what ---- you do about your connection?$q$, array[$o$is / would$o$, $o$were / will$o$, $o$will be / did$o$, $o$were / would$o$, $o$had been / should$o$], 3, $e$1. **Supposing** gerçek dışı durumda Past Simple alır: **were**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** Supposing sonrasında gerçek dışı Past Simple gelir / **B** gerçek dışı sonuç would ister / **C** Supposing sonrasında will olmaz ve soru yapısında would gerekir / **E** şimdiki gerçek dışılık Past Simple ister ve anlam bozulur.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conditionals konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conditionals konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$If you ---- sugar and water, it ---- into a sweet liquid.$q$, array[$o$mixed / turns$o$, $o$mix / turned$o$, $o$will mix / will turn$o$, $o$would mix / would turn$o$, $o$mix / turns$o$], 4, $e$1. Genel doğruda **if + Present Simple** kullanılır: **mix**.
2. Sonuç Present Simple ile söylenir: **turns**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **C** if cümlesinde will olmaz ve genel doğrularda Present Simple tercih edilir / **D** genel doğru Present Simple ister ve genel doğruda would olmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If I ---- rich, I ---- a big house, but I'm not rich.$q$, array[$o$am / would buy$o$, $o$were / would buy$o$, $o$were / will buy$o$, $o$will be / bought$o$, $o$had been / have bought$o$], 1, $e$1. Gerçek dışı koşulda **were** kullanılır: **were**.
2. Sonuç **would + V1** ile verilir: **would buy**.

Diğer şıklar: **A** gerçek dışı koşulda were kullanılır / **C** gerçek dışı sonuç would ister / **D** if cümlesinde will olmaz ve sonuç cümlesi would ister / **E** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If it ---- tomorrow, I ---- at home and read a book.$q$, array[$o$will rain / will stay$o$, $o$rains / stayed$o$, $o$had rained / would stay$o$, $o$rains / will stay$o$, $o$is rained / have stayed$o$], 3, $e$1. Gerçekçi koşulda **if + Present Simple** kullanılır: **rains**.
2. Sonuç **will + V1** ile verilir: **will stay**.

Diğer şıklar: **A** if cümlesinde will olmaz / **B** sonuç cümlesi will ister / **C** gerçekçi koşul Present Simple ister ve gerçekçi koşulda will gelir / **E** anlam bozulur ve sonuç cümlesi will ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$If they ---- earlier, they ---- the train, but they were late.$q$, array[$o$had left / would have caught$o$, $o$left / would have caught$o$, $o$had left / would catch$o$, $o$have left / caught$o$, $o$would leave / had caught$o$], 0, $e$1. Geçmiş gerçek dışılık **if + Past Perfect** ile kurulur: **had left**.
2. Sonuç **would have + V3** ile verilir: **would have caught**.

Diğer şıklar: **B** geçmiş gerçek dışılık Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş gerçek dışılık Past Perfect ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$You can take the exam again ---- you fail it, and you can use a dictionary ---- you need it.$q$, array[$o$unless / if$o$, $o$if / unless$o$, $o$if / if$o$, $o$although / although$o$, $o$because / because$o$], 2, $e$1. Koşul **if** ile kurulur: **if**.
2. Aynı kurala göre: **if**.

Diğer şıklar: **A** olumlu koşul if ister / **B** olumlu koşul if ister / **D** koşul if ister ve koşul if ister / **E** koşul if ister ve koşul if ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$If he ---- the truth, he ---- very angry, so please don't tell him anything yet.$q$, array[$o$knows / would be$o$, $o$knew / will be$o$, $o$will know / was$o$, $o$knew / would be$o$, $o$had known / had been$o$], 3, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **knew**.
2. Sonuç **would + V1** ile verilir: **would be**.

Diğer şıklar: **A** gerçek dışı koşul Past Simple ister / **B** gerçek dışı sonuç would ister / **C** if cümlesinde will olmaz ve sonuç cümlesi would ister / **E** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$If I ---- the alarm, I ---- late for work yesterday, and my boss would have been furious.$q$, array[$o$didn't hear / would have been$o$, $o$hadn't heard / would have been$o$, $o$hadn't heard / would be$o$, $o$haven't heard / was$o$, $o$wouldn't hear / had been$o$], 1, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **hadn't heard**.
2. Sonuç **would have + V3** ile verilir: **would have been**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş koşul Past Perfect ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- you take this medicine regularly, you ---- better within a week.$q$, array[$o$Unless / will feel$o$, $o$If / would feel$o$, $o$If / will feel$o$, $o$Because / felt$o$, $o$Although / have felt$o$], 2, $e$1. Koşul **if** ile kurulur: **If**.
2. Sonuç **will + V1** ile verilir: **will feel**.

Diğer şıklar: **A** olumlu koşul if ister / **B** gerçekçi sonuç will ister / **D** koşul if ister ve gerçekçi sonuç will ister / **E** koşul if ister ve gerçekçi sonuç will ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'd go to the party if I ---- so tired, but I think I'll stay at home and sleep.$q$, array[$o$wouldn't be$o$, $o$am not$o$, $o$hadn't been$o$, $o$won't be$o$, $o$weren't$o$], 4, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **weren't**.

Diğer şıklar: **A** if cümlesinde would olmaz / **B** gerçek dışı koşul Past Simple ister / **C** şimdiki gerçek dışılık Past Simple ister / **D** if cümlesinde will olmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Don't worry. If you ---- any problems, just call me, and I ---- you at once.$q$, array[$o$have / will help$o$, $o$had / will help$o$, $o$have / would help$o$, $o$will have / helped$o$, $o$would have / have helped$o$], 0, $e$1. Gerçekçi koşul **if + Present Simple** ile kurulur: **have**.
2. Sonuç **will + V1** ile verilir: **will help**.

Diğer şıklar: **B** gerçekçi koşul Present Simple ister / **C** gerçekçi sonuç will ister / **D** if cümlesinde will olmaz ve gerçekçi sonuç will ister / **E** if cümlesinde would olmaz ve gerçekçi sonuç will ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$If you ---- the instructions carefully, you wouldn't have made so many mistakes, and you ---- more time now.$q$, array[$o$read / would have$o$, $o$had read / would have$o$, $o$had read / would had$o$, $o$have read / will have$o$, $o$would read / had$o$], 1, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had read**.
2. Şimdiki sonuç **would + V1** ile verilir: **would have**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **C** biçim yanlış / **D** geçmiş koşul Past Perfect ister ve şimdiki karma sonuç would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- the weather improves, the match will be played on Saturday, but if it doesn't, it ---- postponed.$q$, array[$o$Unless / will be$o$, $o$Provided / would be$o$, $o$Because / was$o$, $o$Provided / will be$o$, $o$Although / has been$o$], 3, $e$1. **Provided (that)** koşul bildirir: **Provided**.
2. Gerçekçi sonuç **will be + V3** ile verilir: **will be**.

Diğer şıklar: **A** olumlu koşul if ister / **B** gerçekçi sonuç will ister / **C** koşul if ister ve gerçekçi sonuç will ister / **E** koşul if ister ve gerçekçi sonuç will ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I wouldn't be so worried if I ---- exactly where he was, but he ---- his phone off for hours.$q$, array[$o$know / has had$o$, $o$knew / had$o$, $o$knew / has had$o$, $o$had known / is having$o$, $o$would know / will have$o$], 2, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **knew**.
2. **For hours** Present Perfect ister: **has had**.

Diğer şıklar: **A** gerçek dışı koşul Past Simple ister / **B** for hours Present Perfect ister / **D** şimdiki gerçek dışılık Past Simple ister ve for hours Present Perfect ister / **E** if cümlesinde would olmaz ve for hours Present Perfect ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$If the meeting ---- earlier, we ---- lunch together, but now there isn't enough time.$q$, array[$o$finished / could have had$o$, $o$had finished / can have$o$, $o$finishes / could have$o$, $o$would finish / will have$o$, $o$had finished / could have had$o$], 4, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had finished**.
2. Sonuç **could have + V3** ile verilir: **could have had**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **B** geçmiş sonuç could have + V3 ister / **C** geçmiş koşul Past Perfect ister ve geçmiş sonuç could have + V3 ister, şık eşleşmesi bozulur / **D** if cümlesinde would olmaz ve geçmiş sonuç could have + V3 ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$If she ---- anything about the plan, she would have told us, so she probably ---- nothing at the time.$q$, array[$o$had known / knew$o$, $o$knew / knew$o$, $o$had known / knows$o$, $o$knows / has known$o$, $o$would know / will know$o$], 0, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had known**.
2. **At the time** geçmiş zaman ister: **knew**.

Diğer şıklar: **B** geçmiş koşul Past Perfect ister / **C** at the time geçmiş zaman ister / **D** geçmiş koşul Past Perfect ister ve at the time geçmiş zaman ister / **E** if cümlesinde would olmaz ve at the time geçmiş zaman ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Suppose the manager ---- to resign tomorrow, ---- the company be able to find a suitable replacement at such short notice?$q$, array[$o$is / would$o$, $o$were / would$o$, $o$were / will$o$, $o$will be / did$o$, $o$had been / is$o$], 1, $e$1. **Suppose + were to**: **were**. Sonuç: **would**.

Diğer şıklar: **A** Suppose were to ister / **C** gerçek dışı sonuç would ister / **D** Suppose were to ister ve sonuç cümlesinde would gerekir / **E** Suppose were to ister ve sonuç cümlesinde would gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$You can use my laptop ---- you promise not to delete any of the files, but ---- you do, I will never lend you anything again.$q$, array[$o$unless / if$o$, $o$as long as / unless$o$, $o$although / although$o$, $o$because / as long as$o$, $o$as long as / if$o$], 4, $e$1. **As long as** koşul bildirir: **as long as**, olumlu ihtimal **if**.

Diğer şıklar: **A** olumlu koşul as long as ister / **B** olumlu koşul if ister / **C** zıtlık anlamı verir ve zıtlık anlamı verir / **D** sebep anlamı verir ve bağlamı bozar.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$If the instructions ---- more clearly, the engineers ---- the mistake, but the diagrams were hopelessly confusing.$q$, array[$o$had been written / would have avoided$o$, $o$were written / would have avoided$o$, $o$had been written / would avoid$o$, $o$are written / avoided$o$, $o$would be written / had avoided$o$], 0, $e$1. **Üçüncü tip koşul** edilgen: **had been written / would have avoided**.

Diğer şıklar: **B** geçmiş etkili koşul Past Perfect ister / **C** geçmiş sonuç perfect ister / **D** geçmiş etkili koşul Past Perfect ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Were I ---- the decision, I ---- the proposal immediately and look for other investors.$q$, array[$o$having made / would reject$o$, $o$to make / will reject$o$, $o$to make / would reject$o$, $o$make / rejected$o$, $o$made / would have rejected$o$], 2, $e$1. **Were I to**: **to make / would reject**.

Diğer şıklar: **A** Were I sonrasında to-infinitive gelir / **B** gerçek dışı sonuç would ister / **D** Were I sonrasında to gerekir ve sonuç cümlesi would ister / **E** Were I sonrasında to-infinitive gelir ve şimdiki gerçek dışı sonuç would + V1 ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It ---- impossible to complete the project on schedule if the supplier had not delivered the materials on time.$q$, array[$o$would be$o$, $o$will be$o$, $o$had been$o$, $o$would have been$o$, $o$is$o$], 3, $e$1. **Üçüncü tip koşul sonucu**: **would have been**.

Diğer şıklar: **A** geçmiş koşul would have + V3 ister / **B** geçmiş koşul would have + V3 ister / **C** sonuç cümlesinde would gerekir / **E** geçmiş koşul would have + V3 ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conditionals konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$---- the rain was heavy, we didn't cancel the trip, ---- everything had already been booked.$q$, array[$o$Because / because$o$, $o$Although / although$o$, $o$Although / because$o$, $o$Despite / so$o$, $o$So / but$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık anlamı gerekir / **B** sebep anlamı because ister / **D** sonrasında cümle gelmez ve sebep anlamı because ister / **E** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He stayed at home ---- he was ill, and he didn't go out ---- the weather was awful.$q$, array[$o$although / because$o$, $o$because / although$o$, $o$despite / despite$o$, $o$because / because$o$, $o$so / so$o$], 3, $e$1. Sebep **because** ile kurulur: **because**.
2. Aynı kurala göre: **because**.

Diğer şıklar: **A** sebep anlamı gerekir / **B** sebep anlamı gerekir / **C** sonrasında cümle gelmez ve sonrasında cümle gelmez / **E** sebep anlamı gerekir ve sebep anlamı gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She worked hard ---- she could pass the exam, ---- she failed.$q$, array[$o$so that / but$o$, $o$because / but$o$, $o$so that / so$o$, $o$although / because$o$, $o$despite / and$o$], 0, $e$1. Amaç **so that** ile kurulur: **so that**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **B** amaç anlamı so that ister / **C** zıtlık anlamı but ister / **D** amaç anlamı so that ister ve zıtlık anlamı but ister / **E** sonrasında cümle gelmez ve zıtlık anlamı but ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$---- the bad weather, the flight was not cancelled, ---- it was delayed for two hours.$q$, array[$o$Although / but$o$, $o$Despite / but$o$, $o$Despite / so$o$, $o$Because / because$o$, $o$So / since$o$], 1, $e$1. **Despite** sonrasında isim öbeği gelir: **Despite**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** sonrasında isim öbeği gelir, Despite kullanılır / **C** zıtlık anlamı but ister / **D** zıtlık anlamı gerekir ve zıtlık anlamı but ister / **E** zıtlık anlamı gerekir ve zıtlık anlamı but ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$You can borrow my car ---- you drive carefully, ---- you can't borrow it at all.$q$, array[$o$unless / otherwise$o$, $o$if / and$o$, $o$if / otherwise$o$, $o$although / so$o$, $o$because / however$o$], 2, $e$1. Koşul **if** ile kurulur: **if**.
2. Aksi durumu **otherwise** verir: **otherwise**.

Diğer şıklar: **A** olumlu koşul if ister / **B** önceki koşulun tersi otherwise ister / **D** koşul anlamı bozulur ve önceki koşulun tersi otherwise ister / **E** koşul anlamı bozulur ve cümle içi bağlaç değildir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- being tired, he continued working, ---- he wanted to finish the project that night.$q$, array[$o$Since / because$o$, $o$Despite / although$o$, $o$Because / despite$o$, $o$So / so$o$, $o$Despite / because$o$], 4, $e$1. **Despite** sonrasında gerund gelir: **Despite**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık anlamı gerekir / **B** sebep anlamı because ister / **C** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **D** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She didn't pass the exam ---- she hadn't studied enough. ----, she didn't give up.$q$, array[$o$although / Nevertheless$o$, $o$because / Nevertheless$o$, $o$because / Therefore$o$, $o$despite / Moreover$o$, $o$so / For example$o$], 1, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **nevertheless** ile kurulur: **nevertheless**.

Diğer şıklar: **A** sebep anlamı because ister / **C** zıtlık nevertheless ister / **D** sonrasında cümle gelmez ve ek bilgi verir / **E** sebep anlamı because ister ve örnek verir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'll call you ---- I arrive, but I won't call you ---- I have something to say.$q$, array[$o$until / unless$o$, $o$as soon as / although$o$, $o$although / because$o$, $o$as soon as / unless$o$, $o$despite / despite$o$], 3, $e$1. **As soon as** hemen sonrasını verir: **as soon as**.
2. **Unless** olumsuz koşul bildirir: **unless**.

Diğer şıklar: **A** as soon as zaman ilişkisi verir, until farklıdır / **B** olumsuz koşul unless ister / **C** zıtlık anlamı verir ve olumsuz koşul unless ister / **E** sonrasında cümle gelmez ve sonrasında cümle gelmez.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The film was boring. ----, we stayed until the end ---- we had paid for the tickets.$q$, array[$o$Nevertheless / because$o$, $o$Therefore / because$o$, $o$Nevertheless / although$o$, $o$Moreover / despite$o$, $o$For example / so$o$], 0, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **B** zıtlık anlamı nevertheless ister / **C** sebep anlamı because ister / **D** ek bilgi verir ve sonrasında cümle gelmez / **E** örnek verir ve sebep anlamı because ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He is a good teacher, ---- his brother is a poor one, ---- they come from the same family.$q$, array[$o$because / although$o$, $o$whereas / because$o$, $o$so / so$o$, $o$unless / unless$o$, $o$whereas / although$o$], 4, $e$1. Karşıtlık **whereas** ile kurulur: **whereas**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** zıtlık anlamı whereas ister / **B** zıtlık anlamı although ister / **C** zıtlık anlamı whereas ister ve zıtlık anlamı although ister / **D** zıtlık anlamı whereas ister ve zıtlık anlamı although ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Take a jacket ---- it gets cold, and wait here ---- I come back.$q$, array[$o$unless / until$o$, $o$in case / when$o$, $o$although / while$o$, $o$in case / until$o$, $o$so that / as$o$], 3, $e$1. **In case** önlem bildirir: **in case**.
2. **Until** bekleme süresi bildirir: **until**.

Diğer şıklar: **A** önlem anlamı vermez / **B** until bekleme süresi bildirir / **C** anlam bozulur ve anlam bozulur / **E** amaç bildirir ve anlam bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- the price is high, many people buy this brand, ---- it is of excellent quality.$q$, array[$o$Although / because$o$, $o$Despite / because$o$, $o$Although / although$o$, $o$Because / despite$o$, $o$So / so$o$], 0, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **B** sonrasında cümle gelir, Although kullanılır / **C** sebep anlamı because ister / **D** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **E** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$He apologised ---- his mistake, and he promised to work harder ---- the problem would not happen again.$q$, array[$o$of / so that$o$, $o$for / because$o$, $o$about / although$o$, $o$to / unless$o$, $o$for / so that$o$], 4, $e$1. **Apologise for** kalıbı kullanılır: **for**.
2. Amaç **so that** ile verilir: **so that**.

Diğer şıklar: **A** apologise for kalıbı / **B** amaç so that ile verilir / **C** apologise for kalıbı ve amaç so that ile verilir / **D** apologise for kalıbı ve amaç so that ile verilir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She speaks French and German, ---- she can't speak Spanish, ---- she lived in Madrid for years.$q$, array[$o$and / although$o$, $o$but / although$o$, $o$but / because$o$, $o$so / so$o$, $o$because / unless$o$], 1, $e$1. Zıtlık **but** ile kurulur: **but**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** zıtlık but ister / **C** zıtlık although ister / **D** zıtlık but ister ve zıtlık although ister / **E** zıtlık but ister ve zıtlık although ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The train was late. ----, we missed our connection, and ----, we had to spend the night in the station.$q$, array[$o$However / consequently$o$, $o$Therefore / however$o$, $o$Nevertheless / instead$o$, $o$Therefore / consequently$o$, $o$On the contrary / on the other hand$o$], 3, $e$1. Sonuç **therefore** ile kurulur: **therefore**.
2. Sonuç **consequently** ile kurulur: **consequently**.

Diğer şıklar: **A** sonuç therefore ister / **B** sonuç consequently ister / **C** sonuç therefore ister ve sonuç consequently ister / **E** sonuç therefore ister ve sonuç consequently ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The first experiment produced exactly the results that the team had predicted. ----, the second one yielded data that contradicted the hypothesis completely.$q$, array[$o$Likewise$o$, $o$Therefore$o$, $o$By contrast$o$, $o$Moreover$o$, $o$Consequently$o$], 2, $e$1. Zıtlık bildiren: **By contrast**.

Diğer şıklar: **A** benzerlik bildirir, zıtlık gerekir / **B** sonuç bildirir / **D** ek bilgi verir / **E** sonuç bildirir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Many farmers have abandoned traditional methods ---- they can no longer afford the labour, ---- the use of machinery has increased dramatically.$q$, array[$o$because / and so$o$, $o$although / and so$o$, $o$because / but so$o$, $o$so that / so that$o$, $o$unless / however$o$], 0, $e$1. **Sebep**: **because**, sonuç **and so**.

Diğer şıklar: **B** sebep because ister / **C** biçim yanlış / **D** amaç anlamı verir ve amaç anlamı verir / **E** anlam bozulur ve cümle içi bağlaç değildir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Smoking is banned in all public buildings in this country. ----, in some neighbouring countries it is still permitted in designated areas.$q$, array[$o$Consequently$o$, $o$For example$o$, $o$Similarly$o$, $o$Therefore$o$, $o$By contrast$o$], 4, $e$1. Zıtlık: **By contrast**.

Diğer şıklar: **A** sonuç anlamı verir / **B** örnek verir / **C** benzerlik bildirir / **D** sonuç anlamı verir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The company has invested heavily in research. ----, it has failed to develop a single marketable product in the last five years.$q$, array[$o$Therefore$o$, $o$Nevertheless$o$, $o$Moreover$o$, $o$For instance$o$, $o$Likewise$o$], 1, $e$1. **Nevertheless**: beklenenin tersi sonuç.

Diğer şıklar: **A** sonuç anlamı verir / **C** ek bilgi verir / **D** örnek verir / **E** benzerlik bildirir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The tickets must be booked at least two weeks in advance, ---- you will have to pay a considerable surcharge.$q$, array[$o$although$o$, $o$unless$o$, $o$otherwise$o$, $o$therefore$o$, $o$however$o$], 2, $e$1. **Otherwise**: aksi hâlde.

Diğer şıklar: **A** zıtlık anlamı verir / **B** olumsuz koşul olur, otherwise ile aynı cümlede kullanılmaz / **D** sonuç anlamı verir / **E** zıtlık bağlacı olarak anlam bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conjunctions ve Linkers konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I was tired, ---- I went to bed early, and I fell asleep ---- I closed my eyes.$q$, array[$o$because / as soon as$o$, $o$so / although$o$, $o$although / because$o$, $o$so / as soon as$o$, $o$but / unless$o$], 3, $e$1. Sonuç **so** ile kurulur: **so**.
2. Hemen sonra **as soon as** ile verilir: **as soon as**.

Diğer şıklar: **A** sonuç so ister / **B** as soon as zaman ilişkisi verir / **C** sonuç so ister ve zaman ilişkisi gerekir / **E** sonuç so ister ve zaman ilişkisi gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$---- he was very rich, he was not happy, ---- he felt lonely.$q$, array[$o$Because / because$o$, $o$Although / so$o$, $o$Although / because$o$, $o$Despite / although$o$, $o$So / despite$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık anlamı gerekir / **B** sebep anlamı because ister / **D** sonrasında cümle gelmez ve sebep anlamı because ister / **E** zıtlık anlamı gerekir ve sonrasında cümle gelmez.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$We will go for a picnic ---- the weather is fine, but we will stay at home ---- it rains.$q$, array[$o$if / if$o$, $o$unless / if$o$, $o$if / unless$o$, $o$although / although$o$, $o$because / because$o$], 0, $e$1. Koşul **if** ile kurulur: **if**.
2. Aynı kurala göre: **if**.

Diğer şıklar: **B** olumlu koşul if ister / **C** olumlu koşul if ister / **D** koşul anlamı bozulur ve koşul anlamı bozulur / **E** koşul anlamı bozulur ve koşul anlamı bozulur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$She studied hard. ----, she passed the exam, ---- she didn't get a high mark.$q$, array[$o$However / but$o$, $o$Therefore / but$o$, $o$Therefore / and$o$, $o$Otherwise / so$o$, $o$Nevertheless / because$o$], 1, $e$1. Sonuç **therefore** ile kurulur: **therefore**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** sonuç therefore ister / **C** zıtlık but ister / **D** sonuç therefore ister ve zıtlık but ister / **E** sonuç therefore ister ve zıtlık but ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$He didn't come to the meeting ---- he was sick, ---- he sent his report.$q$, array[$o$although / but$o$, $o$because / because$o$, $o$despite / unless$o$, $o$so / if$o$, $o$because / but$o$], 4, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** sebep anlamı because ister / **B** zıtlık but ister / **C** sonrasında cümle gelmez ve zıtlık but ister / **D** sebep anlamı because ister ve zıtlık but ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- the heavy traffic, we arrived on time, ---- we had left an hour earlier.$q$, array[$o$Although / because$o$, $o$Despite / although$o$, $o$Despite / because$o$, $o$Because / despite$o$, $o$Since / so$o$], 2, $e$1. **Despite** sonrasında isim öbeği gelir: **Despite**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** sonrasında isim öbeği gelir, Despite kullanılır / **B** sebep anlamı because ister / **D** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **E** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The match was cancelled ---- the heavy rain, and the fans were sent home.$q$, array[$o$because of$o$, $o$because$o$, $o$although$o$, $o$so that$o$, $o$unless$o$], 0, $e$1. **Because of + isim öbeği**: **because of**.

Diğer şıklar: **B** sonrasında isim öbeği gelir, because of kullanılır / **C** sonrasında cümle gelir / **D** amaç anlamı verir / **E** olumsuz koşul anlamı verir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- you have finished your homework, you can go out and play, ---- you must be back by six.$q$, array[$o$Unless / but$o$, $o$Now that / so$o$, $o$Although / because$o$, $o$Because of / although$o$, $o$Now that / but$o$], 4, $e$1. **Now that** sebep ve zaman ilişkisi kurar: **Now that**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** anlam bozulur / **B** zıtlık but ister / **C** anlam bozulur ve zıtlık but ister / **D** sonrasında cümle gelmez ve zıtlık but ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He was late for work ---- the bus broke down, but ---- his boss was angry, he didn't say a word.$q$, array[$o$although / although$o$, $o$because / because$o$, $o$despite / despite$o$, $o$because / although$o$, $o$so / so$o$], 3, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** sebep anlamı because ister / **B** zıtlık although ister / **C** sonrasında cümle gelmez ve sonrasında cümle gelmez / **E** sebep anlamı because ister ve zıtlık although ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- the tickets were expensive, we bought them, ---- the concert was certain to be a success.$q$, array[$o$Because / because$o$, $o$Although / although$o$, $o$Although / because$o$, $o$Despite / despite$o$, $o$So / so$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık anlamı gerekir / **B** sebep anlamı because ister / **D** sonrasında cümle gelmez ve sonrasında cümle gelmez / **E** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$You won't succeed ---- you work hard, and you won't be happy ---- you enjoy what you do.$q$, array[$o$if / unless$o$, $o$unless / unless$o$, $o$unless / if$o$, $o$although / although$o$, $o$because / because$o$], 1, $e$1. **Unless** olumsuz koşul bildirir: **unless**.
2. Aynı kurala göre: **unless**.

Diğer şıklar: **A** olumsuz koşul unless ister / **C** olumsuz koşul unless ister / **D** anlam bozulur ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- his injury, the player continued the race, ---- he finished in second place.$q$, array[$o$Despite / and$o$, $o$Although / and$o$, $o$Despite / because$o$, $o$Because / although$o$, $o$So / so that$o$], 0, $e$1. **Despite** sonrasında isim öbeği gelir: **Despite**.
2. Sonuç **and** ile eklenir: **and**.

Diğer şıklar: **B** sonrasında isim öbeği gelir, Despite kullanılır / **C** sonuç and ister / **D** zıtlık anlamı gerekir ve sonuç and ister / **E** zıtlık anlamı gerekir ve sonuç and ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$He lost his job. ----, he did not give up, ---- he had no savings.$q$, array[$o$Therefore / although$o$, $o$Nevertheless / so$o$, $o$Moreover / unless$o$, $o$Nevertheless / although$o$, $o$For instance / whereas$o$], 3, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** zıtlık nevertheless ister / **B** zıtlık although ister / **C** ek bilgi verir ve zıtlık although ister / **E** örnek verir ve zıtlık although ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$I'll wait here ---- you come back, and I'll stay ---- the shop closes.$q$, array[$o$when / until$o$, $o$until / when$o$, $o$while / while$o$, $o$as / as$o$, $o$until / until$o$], 4, $e$1. Bekleme süresi **until** ile verilir: **until**.
2. Aynı kurala göre: **until**.

Diğer şıklar: **A** bekleme süresi until ister / **B** bekleme süresi until ister / **C** bekleme süresi until ister ve bekleme süresi until ister / **D** bekleme süresi until ister ve bekleme süresi until ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- he had been warned repeatedly about the risks, he went ahead with the investment, which resulted in heavy losses.$q$, array[$o$Despite$o$, $o$In spite$o$, $o$Even though$o$, $o$However$o$, $o$Unless$o$], 2, $e$1. **Even though** + cümle: **Even though**.

Diğer şıklar: **A** sonrasında cümle gelmez / **B** of olmadan kullanılmaz / **D** cümle başı bağlaç değildir / **E** anlam bozulur.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The new software is easy to use and highly efficient. ----, it is considerably cheaper than any of its rivals.$q$, array[$o$However$o$, $o$Therefore$o$, $o$Otherwise$o$, $o$Moreover$o$, $o$In contrast$o$], 3, $e$1. **Moreover**: ek bilgi.

Diğer şıklar: **A** zıtlık verir / **B** sonuç verir / **C** aksi hâl verir / **E** zıtlık verir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$You may leave early today, ---- you finish the report first and hand it in before you go.$q$, array[$o$unless$o$, $o$provided that$o$, $o$although$o$, $o$whereas$o$, $o$in case$o$], 1, $e$1. **Provided that**: koşul.

Diğer şıklar: **A** olumsuz koşul anlamı verir / **C** zıtlık anlamı verir / **D** zıtlık anlamı verir / **E** önlem anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She decided to take a taxi ---- she should miss the last train and be stranded in the city for the night.$q$, array[$o$so that$o$, $o$in order to$o$, $o$because$o$, $o$unless$o$, $o$lest$o$], 4, $e$1. **Lest should**: korkudan kaçınma.

Diğer şıklar: **A** amaç anlamı verir, lest ile aynı anlam yönü değildir / **B** sonrasında fiil gelir / **C** sebep anlamı verir / **D** olumsuz koşul anlamı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The government has introduced stricter controls. ----, the number of illegal immigrants has risen sharply this year.$q$, array[$o$Even so$o$, $o$Therefore$o$, $o$Likewise$o$, $o$Consequently$o$, $o$For example$o$], 0, $e$1. **Even so**: beklenenin tersi.

Diğer şıklar: **B** zıtlık gerekir / **C** benzerlik bildirir / **D** sonuç bildirir / **E** örnek verir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She has been unwell for weeks. ----, she insists on working, ---- she is afraid of losing her job.$q$, array[$o$Therefore / because$o$, $o$Nevertheless / because$o$, $o$Nevertheless / although$o$, $o$Moreover / so$o$, $o$As a result / unless$o$], 1, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık nevertheless ister / **C** sebep because ister / **D** ek bilgi verir ve sebep because ister / **E** sonuç bildirir ve sebep because ister.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conjunctions ve Linkers konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$She was tired, ---- she went to bed early, and she slept well ---- the noise outside.$q$, array[$o$because / despite$o$, $o$so / despite$o$, $o$so / although$o$, $o$although / because$o$, $o$but / so$o$], 1, $e$1. Sonuç **so** ile kurulur: **so**.
2. **Despite** sonrasında isim öbeği gelir: **despite**.

Diğer şıklar: **A** sonuç so ister / **C** sonrasında isim öbeği gelir, despite kullanılır / **D** sonuç so ister ve zıtlık despite ister / **E** sonuç so ister ve zıtlık despite ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He stayed at home ---- he was ill, but his sister went to school ---- she had a cold.$q$, array[$o$although / although$o$, $o$because / because$o$, $o$despite / despite$o$, $o$because / although$o$, $o$so / so$o$], 3, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** sebep anlamı because ister / **B** zıtlık although ister / **C** sonrasında cümle gelmez ve sonrasında cümle gelmez / **E** sebep anlamı because ister ve zıtlık although ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Wait here ---- I come back, and don't open the door ---- you know who it is.$q$, array[$o$when / unless$o$, $o$until / if$o$, $o$while / although$o$, $o$as / because$o$, $o$until / unless$o$], 4, $e$1. **Until** bekleme süresi bildirir: **until**.
2. **Unless** olumsuz koşul bildirir: **unless**.

Diğer şıklar: **A** until bekleme süresi bildirir / **B** olumsuz koşul unless ister / **C** anlam bozulur ve anlam bozulur / **D** anlam bozulur ve anlam bozulur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$---- he is very young, he plays the piano beautifully, ---- he practises every day.$q$, array[$o$Despite / because$o$, $o$Although / because$o$, $o$Although / so$o$, $o$Because / although$o$, $o$So / despite$o$], 1, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** sonrasında cümle gelmez / **C** sebep anlamı because ister / **D** zıtlık anlamı gerekir ve sebep anlamı because ister / **E** zıtlık anlamı gerekir ve sonrasında cümle gelmez.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$He was hungry, ---- he ate a sandwich, ---- it was not enough.$q$, array[$o$so / but$o$, $o$but / but$o$, $o$so / so$o$, $o$because / because$o$, $o$although / unless$o$], 0, $e$1. Sonuç **so** ile kurulur: **so**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **B** sonuç so ister / **C** zıtlık but ister / **D** sonuç so ister ve zıtlık but ister / **E** sonuç so ister ve zıtlık but ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- the doctor told him to rest, he went back to work, ---- he got worse.$q$, array[$o$Despite / and$o$, $o$Although / because$o$, $o$Although / and$o$, $o$Because / so$o$, $o$So / although$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sonuç **and** ile eklenir: **and**.

Diğer şıklar: **A** sonrasında cümle gelmez / **B** sonuç and ister / **D** zıtlık anlamı gerekir ve sonuç and ister / **E** zıtlık anlamı gerekir ve sonuç and ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The roads were closed ---- the snow, ---- we couldn't travel.$q$, array[$o$because / so$o$, $o$because of / because$o$, $o$despite / although$o$, $o$although / but$o$, $o$because of / so$o$], 4, $e$1. **Because of** sonrasında isim öbeği gelir: **because of**.
2. Sonuç **so** ile kurulur: **so**.

Diğer şıklar: **A** sonrasında isim öbeği gelir / **B** sonuç so ister / **C** sebep anlamı bozulur ve sonuç so ister / **D** sonrasında isim öbeği gelmez ve sonuç so ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- you take the medicine regularly, you will not recover quickly.$q$, array[$o$Unless$o$, $o$If$o$, $o$Although$o$, $o$Because$o$, $o$Whereas$o$], 0, $e$1. Olumsuz koşul **Unless** ile kurulur: **Unless**.

Diğer şıklar: **B** olumsuz koşul unless ister / **C** anlam bozulur / **D** anlam bozulur / **E** anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He doesn't speak English well. ----, he managed to explain everything, ---- his gestures were clear.$q$, array[$o$Therefore / because$o$, $o$Nevertheless / although$o$, $o$Moreover / despite$o$, $o$Nevertheless / because$o$, $o$As a result / so$o$], 3, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık nevertheless ister / **B** sebep because ister / **C** ek bilgi verir ve sebep because ister / **E** sonuç bildirir ve sebep because ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- the weather improves, we will have the barbecue, ---- we will cook indoors.$q$, array[$o$Unless / otherwise$o$, $o$If / however$o$, $o$If / otherwise$o$, $o$Although / therefore$o$, $o$Because / moreover$o$], 2, $e$1. Koşul **If** ile kurulur: **If**.
2. Aksi durumu **otherwise** verir: **otherwise**.

Diğer şıklar: **A** olumlu koşul if ister / **B** önceki koşulun tersi otherwise ister / **D** koşul anlamı bozulur ve sonuç otherwise ister / **E** koşul anlamı bozulur ve ek bilgi verir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The two sisters look alike, ---- their characters are very different.$q$, array[$o$so$o$, $o$because$o$, $o$unless$o$, $o$therefore$o$, $o$but$o$], 4, $e$1. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** zıtlık but ister / **B** zıtlık but ister / **C** zıtlık but ister / **D** bağlaç değildir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- he had studied for months, he failed. ----, he tried again and passed.$q$, array[$o$Although / However$o$, $o$Despite / However$o$, $o$Although / Moreover$o$, $o$Because / As a result$o$, $o$So / For example$o$], 0, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Zıtlık **however** ile kurulur: **however**.

Diğer şıklar: **B** sonrasında cümle gelmez / **C** zıtlık however ister / **D** zıtlık anlamı gerekir ve sonuç bildirir / **E** zıtlık anlamı gerekir ve örnek verir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She didn't answer the phone ---- she was busy, ---- she called me back later.$q$, array[$o$although / but$o$, $o$because / but$o$, $o$because / unless$o$, $o$despite / because$o$, $o$so / although$o$], 1, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** sebep anlamı because ister / **C** zıtlık but ister / **D** sonrasında cümle gelmez ve zıtlık but ister / **E** sebep anlamı because ister ve zıtlık but ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$---- his talent, he never became famous, ---- he never tried to promote himself.$q$, array[$o$Although / because$o$, $o$Despite / although$o$, $o$Because / despite$o$, $o$So / so$o$, $o$Despite / because$o$], 4, $e$1. **Despite** sonrasında isim öbeği gelir: **Despite**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** sonrasında isim öbeği gelir, Despite kullanılır / **B** sebep because ister / **C** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **D** zıtlık anlamı gerekir ve sebep because ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$You may borrow the book ---- you return it by Monday. ----, I will have to charge a fine.$q$, array[$o$unless / Otherwise$o$, $o$provided that / However$o$, $o$provided that / Otherwise$o$, $o$although / Moreover$o$, $o$because / Therefore$o$], 2, $e$1. Koşul **provided that** ile kurulur: **provided that**.
2. Aksi durumu **otherwise** verir: **otherwise**.

Diğer şıklar: **A** olumlu koşul provided that ister / **B** önceki koşulun tersi otherwise ister / **D** anlam bozulur ve ek bilgi verir / **E** anlam bozulur ve sonuç otherwise ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The negotiations lasted far longer than anyone had anticipated, ---- the two delegations finally signed the agreement at dawn.$q$, array[$o$so that$o$, $o$because$o$, $o$unless$o$, $o$but$o$, $o$since$o$], 3, $e$1. Zıtlık: **but**.

Diğer şıklar: **A** amaç anlamı verir / **B** sebep anlamı verir / **C** olumsuz koşul olur / **E** sebep anlamı verir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- the weather remains favourable, the match will be played as scheduled on Sunday afternoon.$q$, array[$o$As long as$o$, $o$Unless$o$, $o$Although$o$, $o$Whereas$o$, $o$Despite$o$], 0, $e$1. **As long as** koşul.

Diğer şıklar: **B** olumsuz koşul anlamı verir / **C** zıtlık anlamı verir / **D** zıtlık anlamı verir / **E** sonrasında cümle gelmez.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is extremely generous with his friends, ---- he is surprisingly mean when it comes to his family.$q$, array[$o$because$o$, $o$so that$o$, $o$whereas$o$, $o$unless$o$, $o$since$o$], 2, $e$1. **Whereas**: karşıtlık.

Diğer şıklar: **A** sebep anlamı verir / **B** amaç anlamı verir / **D** olumsuz koşul olur / **E** sebep anlamı verir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The lecture was ---- long and technical that most of the audience lost interest after the first half hour.$q$, array[$o$such$o$, $o$very$o$, $o$too$o$, $o$so$o$, $o$enough$o$], 3, $e$1. **So + sıfat + that**: **so**.

Diğer şıklar: **A** sıfat öncesinde so gelir / **B** that sonuç cümlesi so ister / **C** that sonuç cümlesi so ister / **E** sıfattan sonra gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The two companies agreed to merge ---- they could compete more effectively against the multinational giants that dominated the market.$q$, array[$o$because$o$, $o$so that$o$, $o$although$o$, $o$unless$o$, $o$whereas$o$], 1, $e$1. Amaç: **so that**.

Diğer şıklar: **A** amaç anlamı so that ister / **C** zıtlık anlamı verir / **D** olumsuz koşul olur / **E** zıtlık anlamı verir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Conjunctions ve Linkers konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$There isn't ---- milk in the fridge, but there are ---- eggs on the table.$q$, array[$o$many / a few$o$, $o$much / a little$o$, $o$few / little$o$, $o$a few / much$o$, $o$much / a few$o$], 4, $e$1. Sayılamayan isim için **much** kullanılır: **much**.
2. Sayılabilir çoğul için **a few** kullanılır: **a few**.

Diğer şıklar: **A** sayılamayan milk ile much gelir / **B** sayılabilir eggs ile a few gelir / **C** olumsuz cümlede much gerekir ve sayılabilir eggs ile few/a few gelir / **D** sayılamayan isimle kullanılmaz ve sayılabilir eggs ile kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He has ---- friends, so he often feels lonely, and he spends ---- time alone.$q$, array[$o$few / a lot of$o$, $o$a few / a lot of$o$, $o$few / a many$o$, $o$little / many of$o$, $o$much / much$o$], 0, $e$1. Olumsuz anlamda sayılabilir çoğul için **few** kullanılır: **few**.
2. Olumlu cümlede **a lot of** kullanılır: **a lot of**.

Diğer şıklar: **B** olumsuz anlam için few gerekir / **C** biçim yanlış / **D** sayılabilir friends ile few gelir ve anlam bozulur / **E** sayılabilir friends ile kullanılmaz ve olumlu cümlede a lot of kullanılır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I'd like ---- apple and ---- orange juice, please.$q$, array[$o$a / an$o$, $o$an / a$o$, $o$the / the$o$, $o$an / an$o$, $o$one / some$o$], 3, $e$1. Ünlü seste **an** gelir: **an**.
2. Aynı kurala göre: **an**.

Diğer şıklar: **A** ünlü sesle başlayan apple için an gelir / **B** ünlü sesle başlayan orange için an gelir / **C** belirsiz tek bir nesne için an gelir ve belirsiz nesne için an gelir / **E** tekil isimle kullanılmaz ve sayılamayan anlam için kullanılır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$---- sun rises in ---- east, and sets in the west.$q$, array[$o$A / the$o$, $o$The / the$o$, $o$The / a$o$, $o$An / an$o$, $o$This / this$o$], 1, $e$1. Tek olan varlık için **the** kullanılır: **The**.
2. Yön adı için **the** kullanılır: **the**.

Diğer şıklar: **A** tek olan varlık için the gelir / **C** yön adı için the gelir / **D** tek olan varlık için the gelir ve yön adı için the gelir / **E** tek olan varlık için the gelir ve yön adı için the gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- of the students passed the exam, but ---- of them got full marks.$q$, array[$o$Most / none$o$, $o$Every / none$o$, $o$Most / any$o$, $o$Much / every$o$, $o$Each / each$o$], 0, $e$1. **Most of** sonrasında çoğul isim gelir: **Most**.
2. **None of** hiçbiri anlamını verir: **none**.

Diğer şıklar: **B** of ile kullanılmaz / **C** olumlu cümlede none gerekir / **D** sayılabilir çoğul ile kullanılmaz ve of ile kullanılmaz / **E** of ile pass anlamı bozulur ve none anlamı gerekir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I don't have ---- money with me, so could you lend me ----?$q$, array[$o$some / some$o$, $o$any / every$o$, $o$no / no$o$, $o$none / none$o$, $o$any / some$o$], 4, $e$1. Olumsuz cümlede **any** kullanılır: **any**.
2. Rica ve teklifte **some** kullanılır: **some**.

Diğer şıklar: **A** olumsuz cümlede any kullanılır / **B** rica cümlesinde some kullanılır / **C** olumsuz fiille kullanılmaz ve rica cümlesinde some kullanılır / **D** sonrasında isim gelmez ve rica cümlesinde some kullanılır.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- of the two roads leads to the village, so you can take ---- one.$q$, array[$o$Both / either$o$, $o$Either / either$o$, $o$Either / both$o$, $o$All / all$o$, $o$Each / each$o$], 1, $e$1. **Either of** iki varlıktan birini anlatır: **Either**.
2. Aynı kurala göre: **either**.

Diğer şıklar: **A** either one ile birlikte kullanılmaz / **C** one tekil ister / **D** iki varlık için both/either gelir ve one tekil ister / **E** iki varlık için either gelir ve one tekil ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The number of students ---- increased, but a number of them ---- not satisfied with the course.$q$, array[$o$have / are$o$, $o$has / is$o$, $o$are / has$o$, $o$has / are$o$, $o$were / was$o$], 3, $e$1. **The number of** tekil fiil ister: **has**.
2. **A number of** çoğul fiil ister: **are**.

Diğer şıklar: **A** the number of tekil fiil ister / **B** a number of çoğul fiil ister / **C** the number of tekil fiil ister ve a number of çoğul fiil ister / **E** the number of tekil fiil ister ve a number of çoğul fiil ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$---- people think that money is everything, but ---- people would agree with that.$q$, array[$o$Any / few$o$, $o$Some / a little$o$, $o$Some / few$o$, $o$Much / little$o$, $o$Every / much$o$], 2, $e$1. **Some people** bir kısım insanı anlatır: **Some**.
2. **Few people** çok az insanı anlatır: **few**.

Diğer şıklar: **A** olumlu cümlede some gerekir / **B** sayılabilir çoğul ile few gelir / **D** sayılabilir çoğul ile kullanılmaz ve sayılabilir çoğul ile few gelir / **E** çoğul isimle kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- of the cake was left after the party, and ---- of the guests had gone home.$q$, array[$o$None / most$o$, $o$Each / most$o$, $o$None / much$o$, $o$Every / little$o$, $o$Many / every$o$], 0, $e$1. Sayılamayan isimde **none of** kullanılır: **None**.
2. Sayılabilir çoğulda **most of** kullanılır: **most**.

Diğer şıklar: **B** sayılamayan cake ile none of gelir / **C** guests sayılabilir, most of gelir / **D** of ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz / **E** sayılamayan cake ile kullanılmaz ve of ile kullanılmaz.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She has ---- experience in teaching, but she has ---- opportunities to use it.$q$, array[$o$a lots of / few$o$, $o$a lot of / few$o$, $o$a lot of / a few$o$, $o$lots / little$o$, $o$many / much$o$], 1, $e$1. Sayılamayan isimle **a lot of** kullanılır: **a lot of**.
2. Sayılabilir çoğulla **few** kullanılır: **few**.

Diğer şıklar: **A** biçim yanlış / **C** olumsuz anlam için few gerekir / **D** of olmadan kullanılmaz ve sayılabilir opportunities ile few gelir / **E** sayılamayan experience ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- student in the class has to bring ---- own dictionary.$q$, array[$o$All / his or her$o$, $o$Every / its$o$, $o$Both / him or her$o$, $o$Every / his or her$o$, $o$Several / theirs$o$], 3, $e$1. **Every** tekil isim alır: **Every**.
2. Tekil özneye uygun sahiplik **his or her** olur: **his or her**.

Diğer şıklar: **A** tekil student ile every gelir / **B** insan için its kullanılmaz / **C** tekil student ile every gelir ve sahiplik sıfatı gerekir / **E** çoğul isimle kullanılır ve sahiplik sıfatı gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$---- time I visit her, she is cooking, and ---- time I phone her, she is out.$q$, array[$o$All / each$o$, $o$Every / whole$o$, $o$Both / some$o$, $o$Most / all$o$, $o$Every / each$o$], 4, $e$1. **Every time** kalıbı kullanılır: **Every**.
2. **Each time** kalıbı kullanılır: **each**.

Diğer şıklar: **A** tekil time ile every gelir / **B** each time kalıbı / **C** tekil time ile every gelir ve each time kalıbı / **D** tekil time ile kullanılmaz ve each time kalıbı.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The teacher gave ---- a book, and ---- of the books was about history.$q$, array[$o$every of us / each$o$, $o$each of us / every$o$, $o$each of us / each$o$, $o$all of us / all$o$, $o$both us / both$o$], 2, $e$1. **Each of us** her birimiz anlamını verir: **each of us**.
2. Tekil özne **each** olur: **each**.

Diğer şıklar: **A** every of ile kullanılmaz / **B** of ile birlikte kullanılmaz / **D** her biri anlamı each ister ve tekil fiil ister / **E** biçim yanlış ve tekil fiil ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- of my friends live abroad, and ---- of them are coming to my wedding.$q$, array[$o$Much / most$o$, $o$Several / most$o$, $o$Several / much$o$, $o$Every / every$o$, $o$Each / little$o$], 1, $e$1. **Several of** sonrasında çoğul isim gelir: **Several**.
2. **Most of** sonrasında çoğul isim gelir: **most**.

Diğer şıklar: **A** sayılabilir çoğul ile kullanılmaz / **C** sayılabilir çoğul ile kullanılmaz / **D** of ile kullanılmaz ve of ile kullanılmaz / **E** çoğul fiil live ile uyumsuz ve sayılabilir çoğul ile kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$---- of the students who applied for the scholarship were successful, but the exact figure has not been announced yet.$q$, array[$o$A number$o$, $o$The number$o$, $o$Number$o$, $o$Numbers$o$, $o$Any number$o$], 0, $e$1. **A number of** çoğul fiil alır: **A number**.

Diğer şıklar: **B** tekil fiil ister ve of ile çoğul anlam vermez / **C** belirteç eksik / **D** biçim yanlış / **E** anlam bozulur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The number of road accidents ---- sharply this year, and a number of experts ---- that stricter laws are needed.$q$, array[$o$have risen / believe$o$, $o$has risen / believes$o$, $o$has risen / believe$o$, $o$rise / is believing$o$, $o$were rising / has believed$o$], 2, $e$1. **The number of** tekil, **a number of** çoğul.

Diğer şıklar: **A** the number of tekil fiil ister / **B** a number of çoğul fiil ister / **D** the number of tekil fiil ister ve a number of çoğul fiil ister / **E** this year Present Perfect ister ve a number of çoğul fiil ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$There is far ---- traffic on the roads at weekends than during the week, and ---- accidents are reported as a result.$q$, array[$o$fewer / fewer$o$, $o$less / less$o$, $o$little / little$o$, $o$less / fewer$o$, $o$lesser / few$o$], 3, $e$1. **Sayılamayan**: **less**. **Sayılabilir**: **fewer**.

Diğer şıklar: **A** sayılamayan traffic ile less gelir / **B** sayılabilir accidents ile fewer gelir / **C** karşılaştırma için less gerekir ve sayılabilir çoğul ile kullanılmaz / **E** biçim yanlış ve karşılaştırma yok.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- Netherlands is a small country, but ---- Dutch economy is one of the strongest in Europe.$q$, array[$o$A / the$o$, $o$The / a$o$, $o$Zero / zero$o$, $o$Some / some$o$, $o$The / the$o$], 4, $e$1. **The Netherlands**, **the Dutch economy**.

Diğer şıklar: **A** ülke adı the ile kullanılır / **B** belirli ekonomi için the gelir / **C** the Netherlands the alır ve belirli ekonomi için the gelir / **D** anlam bozulur ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- evening I walk along the beach, and ---- time I do, I feel completely relaxed.$q$, array[$o$All / each$o$, $o$Every / whole$o$, $o$Every / each$o$, $o$Both / some$o$, $o$Most / all$o$], 2, $e$1. **Every evening**, **each time**.

Diğer şıklar: **A** tekil evening ile every gelir / **B** each time kalıbı / **D** tekil isimle kullanılmaz ve each time kalıbı / **E** tekil evening ile kullanılmaz ve each time kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Determiners ve Quantifiers konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$We have ---- time left, so we must hurry, and there are only ---- minutes before the train leaves.$q$, array[$o$little / a few$o$, $o$few / a few$o$, $o$little / a little$o$, $o$a little / little$o$, $o$many / much$o$], 0, $e$1. Sayılamayan olumsuz anlam **little** ile verilir: **little**.
2. Sayılabilir çoğul **a few** ile verilir: **a few**.

Diğer şıklar: **B** sayılamayan time ile little gelir / **C** sayılabilir minutes ile a few gelir / **D** olumsuz anlam için little gerekir ve sayılabilir minutes ile few/a few gelir / **E** sayılamayan time ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I'd like ---- sugar in my coffee, but I don't want ---- milk.$q$, array[$o$any / any$o$, $o$some / some$o$, $o$no / no$o$, $o$some / any$o$, $o$none / none$o$], 3, $e$1. İstek cümlesinde **some** kullanılır: **some**.
2. Olumsuz cümlede **any** kullanılır: **any**.

Diğer şıklar: **A** teklif ve istekte some gelir / **B** olumsuz cümlede any gelir / **C** teklif ve istekte some gelir ve olumsuz fiille kullanılmaz / **E** sonrasında isim gelmez ve sonrasında isim gelmez.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$---- Nile is ---- longest river in Africa, and it flows through Egypt.$q$, array[$o$A / the$o$, $o$The / the$o$, $o$The / a$o$, $o$An / an$o$, $o$This / this$o$], 1, $e$1. Nehir adı için **the** kullanılır: **The**.
2. Üstünlük için **the** kullanılır: **the**.

Diğer şıklar: **A** özel nehir adı için the gelir / **C** üstünlük için the gelir / **D** özel nehir adı için the gelir ve üstünlük için the gelir / **E** özel nehir adı için the gelir ve üstünlük için the gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$There were ---- people at the concert, and ---- of them were standing at the back.$q$, array[$o$much / some$o$, $o$many / any$o$, $o$many / some$o$, $o$a little / no$o$, $o$little / every$o$], 2, $e$1. Sayılabilir çoğul için **many** kullanılır: **many**.
2. Olumlu cümlede **some of** kullanılır: **some**.

Diğer şıklar: **A** sayılabilir çoğul ile kullanılmaz / **B** olumlu cümlede some gelir / **D** sayılabilir çoğul ile kullanılmaz ve olumlu cümlede some gelir / **E** sayılabilir çoğul ile kullanılmaz ve of ile kullanılmaz.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- boy in the class received ---- own certificate at the end of the year.$q$, array[$o$All / his$o$, $o$Every / the$o$, $o$Both / a$o$, $o$Every / his$o$, $o$Most / an$o$], 3, $e$1. **Every** tekil isim alır: **Every**.
2. **Own** öncesinde sahiplik sıfatı gelir: **his**.

Diğer şıklar: **A** tekil boy ile every gelir / **B** own öncesinde sahiplik sıfatı gelir / **C** tekil boy ile every gelir ve own öncesinde sahiplik sıfatı gelir / **E** tekil boy ile kullanılmaz ve own öncesinde sahiplik sıfatı gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I have ---- brothers, and ---- of them lives in London.$q$, array[$o$two / one$o$, $o$two of / one$o$, $o$two / other$o$, $o$both / every$o$, $o$all / all$o$], 0, $e$1. Sayı sıfatı isimden önce gelir: **two**.
2. **One of them** kalıbı kullanılır: **one**.

Diğer şıklar: **B** sayı sıfatı brothers önüne gelir, of gelmez / **C** one of kalıbı yerine geçmez / **D** sayı yerine kullanılır ve of ile kullanılmaz / **E** anlam bozulur ve tekil fiil lives ile uyumsuz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She doesn't have ---- friends in the city, so she spends ---- of her free time alone.$q$, array[$o$much / most$o$, $o$many / much$o$, $o$little / few$o$, $o$a little / every$o$, $o$many / most$o$], 4, $e$1. Olumsuz cümlede sayılabilir çoğul **many** alır: **many**.
2. **Most of her free time** kalıbı kullanılır: **most**.

Diğer şıklar: **A** sayılabilir çoğul ile olumsuzda many gelir / **B** of her free time ile most of kalıbı / **C** sayılabilir çoğul ile kullanılmaz ve of her free time kalıbı / **D** sayılabilir çoğul ile kullanılmaz ve of ile kullanılmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- the students were tired after the trip, but ---- of them wanted to go home.$q$, array[$o$Every / none$o$, $o$All / none$o$, $o$All / all$o$, $o$Each / every$o$, $o$Much / each$o$], 1, $e$1. **All the students** kalıbı kullanılır: **All**.
2. **None of them** hiçbiri anlamını verir: **none**.

Diğer şıklar: **A** çoğul students ile every kullanılmaz / **C** but ile olumsuz bir sonuç none ister / **D** çoğul students ile all gelir ve of ile kullanılmaz / **E** sayılabilir çoğul ile kullanılmaz ve of them tekil olur, anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He drinks ---- coffee, so he often has ---- trouble sleeping.$q$, array[$o$too many / a lot of$o$, $o$too much / few$o$, $o$too much / a lot of$o$, $o$too few / many$o$, $o$enough / a few$o$], 2, $e$1. Sayılamayan isimle **too much** kullanılır: **too much**.
2. Sayılamayan isimle **a lot of** kullanılır: **a lot of**.

Diğer şıklar: **A** sayılamayan coffee ile too much gelir / **B** sayılamayan trouble ile kullanılmaz / **D** anlam bozulur ve sayılamayan trouble ile kullanılmaz / **E** anlam bozulur ve sayılamayan trouble ile kullanılmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- of the two candidates is suitable for the job, so ---- of them will be hired.$q$, array[$o$Both / neither$o$, $o$Neither / both$o$, $o$All / either$o$, $o$Either / each$o$, $o$Neither / neither$o$], 4, $e$1. İki varlıktan hiçbiri **neither of** ile söylenir: **Neither**.
2. Aynı kurala göre: **neither**.

Diğer şıklar: **A** olumsuz sonuç neither ister / **B** olumsuz sonuç neither ister / **C** olumsuz sonuç neither ister ve olumsuz sonuç neither ister / **D** olumsuz sonuç neither ister ve olumsuz sonuç neither ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$---- of the two brothers is a doctor, but ---- of them has a car.$q$, array[$o$One / neither$o$, $o$Both / neither$o$, $o$One / both$o$, $o$All / each$o$, $o$Each / all$o$], 0, $e$1. **One of the two** iki kişiden birini anlatır: **One**.
2. Olumsuz anlam **neither of** ile verilir: **neither**.

Diğer şıklar: **B** iki kişiden biri one ile söylenir / **C** olumsuz anlam neither ister / **D** iki kişi için both/one gelir ve but ile olumsuz anlam gerekir / **E** iki kişiden biri one ile söylenir ve iki kişi için kullanılmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I need ---- advice, but I don't want ---- information about the price.$q$, array[$o$a / any$o$, $o$some / some$o$, $o$many / no$o$, $o$some / any$o$, $o$few / none$o$], 3, $e$1. Sayılamayan olumlu istek **some** ile verilir: **some**.
2. Olumsuz cümlede **any** kullanılır: **any**.

Diğer şıklar: **A** sayılamayan advice ile a kullanılmaz / **B** olumsuz cümlede any gelir / **C** sayılamayan advice ile kullanılmaz ve olumsuz fiille kullanılmaz / **E** sayılamayan advice ile kullanılmaz ve sonrasında isim gelmez.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$There was ---- noise outside, so we couldn't hear ---- word of what he said.$q$, array[$o$so many / a$o$, $o$so much / the$o$, $o$so much / a$o$, $o$so few / some$o$, $o$so little / many$o$], 2, $e$1. Sayılamayan isimle **so much** kullanılır: **so much**.
2. Tekil sayılabilir isim için **a** kullanılır: **a**.

Diğer şıklar: **A** sayılamayan noise ile so much gelir / **B** olumsuz cümlede a single/any anlamı a ile verilir / **D** anlam bozulur ve olumsuz cümlede kullanılmaz / **E** anlam bozulur ve tekil word ile kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She spent ---- money on clothes, and she bought ---- shoes in a single day.$q$, array[$o$a lots of / ten pairs of$o$, $o$a lot of / ten pair of$o$, $o$many / a pairs$o$, $o$few / pair of ten$o$, $o$a lot of / ten pairs of$o$], 4, $e$1. Sayılamayan isimle **a lot of** kullanılır: **a lot of**.
2. Ölçü sözcüğü çoğul olur: **ten pairs of**.

Diğer şıklar: **A** biçim yanlış / **B** pairs çoğul kullanılır / **C** sayılamayan money ile kullanılmaz ve biçim yanlış / **D** olumlu cümlede a lot of gelir ve sıra yanlış.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The minister announced that ---- the schools in the region would be closed for a week.$q$, array[$o$every$o$, $o$all$o$, $o$each$o$, $o$whole$o$, $o$much$o$], 1, $e$1. **All the + çoğul isim**: **all**.

Diğer şıklar: **A** çoğul schools ile every kullanılmaz / **C** çoğul schools ile each kullanılmaz / **D** çoğul isimle kullanılmaz / **E** sayılabilir çoğul ile kullanılmaz.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$---- of the two proposals seems entirely satisfactory, so the committee has asked for a revised version.$q$, array[$o$None$o$, $o$Both$o$, $o$Either$o$, $o$Neither$o$, $o$No$o$], 3, $e$1. İki varlıktan hiçbiri: **Neither of**.

Diğer şıklar: **A** iki varlık için neither kullanılır / **B** olumsuz anlam gerekir / **C** olumsuz bağlam neither ister / **E** of ile kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$He spent ---- of his savings on the car, and the rest he gave to charity.$q$, array[$o$most$o$, $o$the most$o$, $o$almost$o$, $o$mostly$o$, $o$much of$o$], 0, $e$1. **Most of**: büyük kısmı.

Diğer şıklar: **B** of ile birlikte the most kullanılmaz / **C** of ile birlikte kullanılmaz / **D** zarf / **E** most of anlamı eksik.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He has a good command of ---- English, a language which he studied at a bilingual school.$q$, array[$o$the$o$, $o$zero article$o$, $o$an$o$, $o$some$o$, $o$a$o$], 1, $e$1. **Dil adı**: **zero article**.

Diğer şıklar: **A** genel dil adı article almaz / **C** dil adı article almaz / **D** anlam bozulur / **E** dil adı article almaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Many ---- visitor has been charmed by the simple beauty of the old town, though others find it overrated.$q$, array[$o$an$o$, $o$the$o$, $o$a$o$, $o$some$o$, $o$one$o$], 2, $e$1. **Many a + tekil isim** tekil fiil alır: **a**.

Diğer şıklar: **A** many ile a gelir / **B** belirsiz sayısal kalıp bozulur / **D** many a kalıbı yok / **E** biçim yanlış.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He is ---- honest man and ---- university professor, so everybody respects him.$q$, array[$o$a / a$o$, $o$an / an$o$, $o$the / the$o$, $o$some / some$o$, $o$an / a$o$], 4, $e$1. Sessiz h'li honest için **an** gelir: **an**.
2. /j/ sesiyle başlayan university için **a** gelir: **a**.

Diğer şıklar: **A** honest sessiz h ile ünlüyle başlar, an gelir / **B** university /j/ sesiyle başlar, a gelir / **C** belirsiz tek kişi için an gelir ve belirsiz tek kişi için a gelir / **D** tekil sayılabilir isimle kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Determiners ve Quantifiers konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I'd like ---- orange juice and ---- apple, please.$q$, array[$o$some / an$o$, $o$a / an$o$, $o$some / a$o$, $o$an / the$o$, $o$many / some$o$], 0, $e$1. Sayılamayan istek **some** ile verilir: **some**.
2. Ünlü seste **an** gelir: **an**.

Diğer şıklar: **B** sayılamayan juice ile some kullanılır / **C** ünlü sesle başlayan apple için an gelir / **D** sayılamayan juice ile an kullanılmaz ve belirsiz nesne için an gelir / **E** sayılamayan juice ile kullanılmaz ve tekil isimle kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$There isn't ---- bread left, and there aren't ---- eggs either.$q$, array[$o$many / many$o$, $o$much / much$o$, $o$few / little$o$, $o$much / many$o$, $o$a few / a little$o$], 3, $e$1. Sayılamayan olumsuz **much** alır: **much**.
2. Sayılabilir çoğul olumsuz **many** alır: **many**.

Diğer şıklar: **A** sayılamayan bread ile much gelir / **B** sayılabilir eggs ile many gelir / **C** olumsuz cümlede much gelir ve sayılabilir çoğul ile kullanılmaz / **E** sayılamayan isimle kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$---- moon goes round ---- earth once a month.$q$, array[$o$A / the$o$, $o$The / the$o$, $o$The / a$o$, $o$An / an$o$, $o$This / this$o$], 1, $e$1. Tek olan varlık için **the** kullanılır: **The**.
2. Aynı kurala göre: **the**.

Diğer şıklar: **A** tek olan varlık için the gelir / **C** tek olan varlık için the gelir / **D** tek olan varlık için the gelir ve tek olan varlık için the gelir / **E** tek olan varlık için the gelir ve tek olan varlık için the gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$She has ---- friends in the city, so she doesn't feel lonely, and she has ---- time to meet them.$q$, array[$o$a lots of / plenty of$o$, $o$a lot of / plenty$o$, $o$a lot of / plenty of$o$, $o$lots / many$o$, $o$much / few$o$], 2, $e$1. **A lot of** hem sayılabilir hem sayılamayan isimle olur: **a lot of**.
2. **Plenty of** kalıbı kullanılır: **plenty of**.

Diğer şıklar: **A** biçim yanlış / **B** of olmadan kullanılmaz / **D** of olmadan kullanılmaz ve sayılamayan time ile kullanılmaz / **E** olumlu cümlede much kullanılmaz ve olumsuz anlam verir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- of the books on the shelf is mine, but ---- of them belong to my brother.$q$, array[$o$None / all$o$, $o$Every / all$o$, $o$None / every$o$, $o$All / each$o$, $o$Both / no$o$], 0, $e$1. **None of** hiçbiri anlamını verir: **None**.
2. **All of** çoğul fiil alır: **all**.

Diğer şıklar: **B** of ile kullanılmaz / **C** of ile kullanılmaz / **D** tekil fiil is ile uyumsuz ve belong ile tekil fiil gerekir / **E** tekil fiil is ile uyumsuz ve of ile kullanılmaz.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- time I see her, she is wearing ---- different hat.$q$, array[$o$All / a$o$, $o$Every / a$o$, $o$Every / the$o$, $o$Both / an$o$, $o$Most / some$o$], 1, $e$1. **Every time** kalıbı kullanılır: **Every**.
2. Belirsiz tekil isim için **a** kullanılır: **a**.

Diğer şıklar: **A** tekil time ile every gelir / **C** belirsiz tek nesne için a gelir / **D** tekil time ile every gelir ve consonant ile a gelir / **E** tekil time ile kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- people enjoy sports, but ---- people can afford the equipment.$q$, array[$o$Much / few$o$, $o$Many / a little$o$, $o$Each / little$o$, $o$Every / much$o$, $o$Many / few$o$], 4, $e$1. Sayılabilir çoğulla **many** kullanılır: **Many**.
2. Sayılabilir çoğulla olumsuz anlam **few** ile verilir: **few**.

Diğer şıklar: **A** sayılabilir çoğul ile kullanılmaz / **B** sayılabilir çoğul ile few gelir / **C** çoğul people ile kullanılmaz ve sayılabilir çoğul ile few gelir / **D** çoğul isimle kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He took ---- of the money and left ---- rest on the table.$q$, array[$o$every / the$o$, $o$most / a$o$, $o$most / the$o$, $o$each / an$o$, $o$many / some$o$], 2, $e$1. Sayılamayan isimle **most of** kullanılır: **most**.
2. **The rest** kalıbı kullanılır: **the**.

Diğer şıklar: **A** of ile kullanılmaz / **B** rest ile the gelir / **D** of ile birlikte sayılabilir isim gerekir ve rest ile the gelir / **E** sayılamayan money ile kullanılmaz ve rest ile the gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$---- of my two sisters live in Ankara, but ---- of them is married.$q$, array[$o$All / neither$o$, $o$Both / both$o$, $o$Each / either$o$, $o$Both / neither$o$, $o$Every / each$o$], 3, $e$1. İki kişi birlikte **both of** ile söylenir: **Both**.
2. İki kişiden hiçbiri **neither of** ile söylenir: **neither**.

Diğer şıklar: **A** iki varlık için both gelir / **B** olumsuz anlam neither ister / **C** çoğul fiil live ile uyumsuz ve olumsuz anlam neither ister / **E** of ile kullanılmaz ve olumsuz anlam neither ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$She gave me ---- useful advice, and ---- piece of advice I remember is to save money.$q$, array[$o$some / the best$o$, $o$a / the best$o$, $o$some / a best$o$, $o$many / best$o$, $o$few / the better$o$], 0, $e$1. Sayılamayan isimle **some** kullanılır: **some**.
2. Üstünlük **the best** ile kurulur: **the best**.

Diğer şıklar: **B** sayılamayan advice ile a kullanılmaz / **C** superlative the ile gelir / **D** sayılamayan advice ile kullanılmaz ve the olmadan kalıp bozulur / **E** sayılamayan advice ile kullanılmaz ve iki öğe için kullanılır.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$He was sent to ---- prison for ten years, and his wife works as ---- nurse.$q$, array[$o$the / a$o$, $o$zero / a$o$, $o$zero / the$o$, $o$a / an$o$, $o$an / zero$o$], 1, $e$1. Cezaevine mahkûm olmak **zero article** ister: **zero**.
2. Meslek için **a** kullanılır: **a**.

Diğer şıklar: **A** cezaevine mahkûm olmak article almaz / **C** meslek belirtmek için a gelir / **D** cezaevine mahkûm olmak article almaz ve consonant ile a gelir / **E** cezaevine mahkûm olmak article almaz ve meslek belirtmek için a gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$We didn't have ---- time to visit the museum, but we saw ---- of the old town.$q$, array[$o$too / most$o$, $o$enough / every$o$, $o$much / each$o$, $o$enough / most$o$, $o$many / many$o$], 3, $e$1. **Enough time** kalıbı kullanılır: **enough**.
2. **Most of the old town** kalıbı kullanılır: **most**.

Diğer şıklar: **A** olumsuz anlam too ile kurulmaz / **B** of ile kullanılmaz / **C** olumsuz cümlede enough gelir ve of ile kullanılır, anlam bozulur / **E** sayılamayan time ile kullanılmaz ve of the old town sayılamaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$---- of the girls was wearing a red dress, and ---- of them had a hat.$q$, array[$o$Every / some$o$, $o$Each / any$o$, $o$All / every$o$, $o$Both / no$o$, $o$Each / some$o$], 4, $e$1. **Each of** tekil fiil alır: **Each**.
2. Olumlu cümlede **some of** kullanılır: **some**.

Diğer şıklar: **A** of ile kullanılmaz / **B** olumlu cümlede some gelir / **C** tekil fiil was ile uyumsuz ve of ile kullanılmaz / **D** tekil fiil was ile uyumsuz ve olumlu cümlede some gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$There is ---- little sugar in the jar. We'll have to buy ---- more.$q$, array[$o$enough / some$o$, $o$very / some$o$, $o$very / any$o$, $o$quite / no$o$, $o$so / none$o$], 1, $e$1. **Very little** azlığı pekiştirir: **very**.
2. Olumlu cümlede **some** kullanılır: **some**.

Diğer şıklar: **A** very little kalıbı / **C** olumlu cümlede some gelir / **D** very little kalıbı ve olumlu cümlede some gelir / **E** very little kalıbı ve sonrasında isim gelmez.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I know ---- people in this city, so I feel like ---- stranger.$q$, array[$o$little / a$o$, $o$few / the$o$, $o$few / a$o$, $o$a little / an$o$, $o$much / some$o$], 2, $e$1. Olumsuz anlamda sayılabilir çoğul **few** alır: **few**.
2. Belirsiz tekil isim için **a** kullanılır: **a**.

Diğer şıklar: **A** sayılabilir people ile few gelir / **B** belirsiz tek nesne için a gelir / **D** sayılabilir people ile few gelir ve consonant ile a gelir / **E** sayılabilir çoğul ile kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I can't decide between the two jackets. ---- of them fits me properly, but I'll have to take ---- of them anyway.$q$, array[$o$All / one$o$, $o$Neither / both$o$, $o$Both / each$o$, $o$Either / all$o$, $o$Neither / one$o$], 4, $e$1. **Neither of**, **one of them**.

Diğer şıklar: **A** iki varlık için neither kullanılır / **B** ikisini almak anlamı bağlama uymaz / **C** olumsuz anlam gerekir ve anlam yönü zayıf / **D** olumsuz bağlamda neither gerekir ve iki varlık için kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$This is ---- most interesting book on the subject that I have ever read, and it contains ---- information that cannot be found elsewhere.$q$, array[$o$the / some$o$, $o$a / some$o$, $o$the / a$o$, $o$zero / many$o$, $o$an / few$o$], 0, $e$1. **The most + sıfat**, **some information**.

Diğer şıklar: **B** most ile üstünlük the ister / **C** sayılamayan information ile a kullanılmaz / **D** most ile üstünlük the ister ve sayılamayan information ile kullanılmaz / **E** most ile üstünlük the ister ve sayılamayan information ile kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Of the three brothers, one is a doctor, ---- is a teacher, and the youngest is still a student.$q$, array[$o$other$o$, $o$others$o$, $o$another$o$, $o$the other$o$, $o$each other$o$], 2, $e$1. **One ... another ... the youngest**: **another**.

Diğer şıklar: **A** tek başına tekil kullanılmaz / **B** çoğul olur / **D** iki kişi için kullanılır / **E** karşılıklı anlam verir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$There were ---- people at the concert than the organisers had expected, so ---- tickets were left unsold.$q$, array[$o$less / many$o$, $o$fewer / much$o$, $o$little / little$o$, $o$fewer / many$o$, $o$lesser / a little$o$], 3, $e$1. **Fewer people**, **many tickets**.

Diğer şıklar: **A** sayılabilir people ile fewer gelir / **B** sayılabilir tickets ile kullanılmaz / **C** sayılabilir çoğul ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz / **E** biçim yanlış ve sayılabilir çoğul ile kullanılmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$After ---- long and exhausting journey, we reached a small hotel near the harbour, where we received ---- warm welcome.$q$, array[$o$one / a$o$, $o$a / the$o$, $o$an / an$o$, $o$some / some$o$, $o$a / a$o$], 4, $e$1. **Belirsiz tekil isim**: **a / a**.

Diğer şıklar: **A** belirsiz tekil isim için a gelir / **B** belirsiz tekil isim için a gelir / **C** consonant ile a gelir ve consonant ile a gelir / **D** tekil sayılabilir isimle kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Determiners ve Quantifiers konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The manager suggested ---- the meeting until Monday, but nobody agreed ---- the date.$q$, array[$o$postponing / to change$o$, $o$to postpone / to change$o$, $o$postponing / changing$o$, $o$postpone / change$o$, $o$postponed / to changing$o$], 0, $e$1. **Suggest** sonrasında gerund gelir: **postponing**.
2. **Agree** sonrasında to-infinitive gelir: **to change**.

Diğer şıklar: **B** suggest sonrasında gerund gelir / **C** agree sonrasında to-infinitive gelir / **D** suggest sonrasında gerund gelir ve agree sonrasında to gerekir / **E** suggest sonrasında gerund gelir ve agree sonrasında to + V1 gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I always try to avoid ---- in long queues, so I decided ---- my tickets online.$q$, array[$o$to wait / to book$o$, $o$waiting / booking$o$, $o$waiting / to book$o$, $o$wait / book$o$, $o$waited / to booking$o$], 2, $e$1. **Avoid** sonrasında gerund gelir: **waiting**.
2. **Decide** sonrasında to-infinitive gelir: **to book**.

Diğer şıklar: **A** avoid sonrasında gerund gelir / **B** decide sonrasında to-infinitive gelir / **D** avoid sonrasında gerund gelir ve decide sonrasında to gerekir / **E** avoid sonrasında gerund gelir ve decide sonrasında to + V1 gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She promised ---- me as soon as she finished ---- the report.$q$, array[$o$calling / writing$o$, $o$to call / writing$o$, $o$to call / to write$o$, $o$call / write$o$, $o$to calling / written$o$], 1, $e$1. **Promise** sonrasında to-infinitive gelir: **to call**.
2. **Finish** sonrasında gerund gelir: **writing**.

Diğer şıklar: **A** promise sonrasında to-infinitive gelir / **C** finish sonrasında gerund gelir / **D** promise sonrasında to gerekir ve finish sonrasında gerund gelir / **E** promise sonrasında to + V1 gelir ve finish sonrasında gerund gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Would you mind ---- the window? It's too hot in here and I'd like ---- some fresh air.$q$, array[$o$opening / to get$o$, $o$to open / to get$o$, $o$opening / getting$o$, $o$open / get$o$, $o$opened / got$o$], 0, $e$1. **Mind** sonrasında gerund gelir: **opening**.
2. **Would like** sonrasında to-infinitive gelir: **to get**.

Diğer şıklar: **B** mind sonrasında gerund gelir / **C** would like sonrasında to-infinitive gelir / **D** mind sonrasında gerund gelir ve would like sonrasında to gerekir / **E** mind sonrasında gerund gelir ve would like sonrasında to-infinitive gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The teacher let the students ---- their notes during the exam, but she didn't allow them ---- their phones.$q$, array[$o$to use / to use$o$, $o$use / use$o$, $o$using / using$o$, $o$use / to use$o$, $o$used / to using$o$], 3, $e$1. **Let** sonrasında nesne ile yalın fiil gelir: **use**.
2. **Allow + nesne** sonrasında to-infinitive gelir: **to use**.

Diğer şıklar: **A** let sonrasında yalın fiil gelir / **B** allow + object sonrasında to-infinitive gelir / **C** let sonrasında yalın fiil gelir ve allow + object sonrasında to-infinitive gelir / **E** let sonrasında yalın fiil gelir ve allow + object sonrasında to + V1 gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I remember ---- the door before I left, so I'm sure someone else opened it, and please remember ---- it when you leave.$q$, array[$o$to lock / to lock$o$, $o$locking / locking$o$, $o$lock / lock$o$, $o$locked / locked$o$, $o$locking / to lock$o$], 4, $e$1. Geçmişte yapılanı hatırlama **remember + gerund** ile söylenir: **locking**.
2. Yapılması gereken işi hatırlama **remember + to-infinitive** ile söylenir: **to lock**.

Diğer şıklar: **A** remember + to-infinitive yapılacak işi anlatır / **B** yapılacak iş için to-infinitive gerekir / **C** remember sonrasında gerund gelir ve remember sonrasında to gerekir / **D** remember sonrasında gerund gelir ve remember sonrasında to-infinitive gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He regrets ---- so much money on the car, and now he regrets ---- you that the repairs will cost even more.$q$, array[$o$to spend / to tell$o$, $o$spending / telling$o$, $o$spending / to tell$o$, $o$spend / tell$o$, $o$spent / told$o$], 2, $e$1. Yapılmış işten pişmanlık **regret + gerund** ile söylenir: **spending**.
2. Kötü haber verme **regret + to-infinitive** ile söylenir: **to tell**.

Diğer şıklar: **A** regret + gerund pişmanlığı anlatır / **B** kötü haber verme anlamı için to gerekir / **D** regret sonrasında gerund gelir ve regret sonrasında to gerekir / **E** regret sonrasında gerund gelir ve regret sonrasında to gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The company has decided to stop ---- paper cups, and the workers stopped ---- at the road signs to check the map.$q$, array[$o$to use / to look$o$, $o$using / looking$o$, $o$use / look$o$, $o$using / to look$o$, $o$used / to looking$o$], 3, $e$1. Eylemi bırakmak **stop + gerund** ile söylenir: **using**.
2. Durup başka bir şey yapmak **stop + to-infinitive** ile söylenir: **to look**.

Diğer şıklar: **A** stop + to-infinitive amaç anlatır / **B** stop + gerund eylemi bırakmayı anlatır / **C** stop sonrasında gerund gelir ve stop sonrasında to gerekir / **E** stop sonrasında gerund gelir ve stop + to + V1 gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He is not used to ---- up early, so he had difficulty ---- the first train this morning.$q$, array[$o$get / catching$o$, $o$getting / catch$o$, $o$to get / to catch$o$, $o$got / caught$o$, $o$getting / catching$o$], 4, $e$1. **Be used to** içindeki **to** edattır, gerund gelir: **getting**.
2. **Have difficulty** sonrasında gerund gelir: **catching**.

Diğer şıklar: **A** be used to sonrasında gerund gelir / **B** have difficulty sonrasında gerund gelir / **C** be used to içindeki to edattır ve have difficulty sonrasında gerund gelir / **D** be used to sonrasında gerund gelir ve have difficulty sonrasında gerund gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The new law will force companies ---- their employees fairly, and it will encourage them ---- more women.$q$, array[$o$to treat / to hire$o$, $o$treat / to hire$o$, $o$to treat / hire$o$, $o$treating / hiring$o$, $o$treated / hired$o$], 0, $e$1. **Force + nesne** sonrasında to-infinitive gelir: **to treat**.
2. **Encourage + nesne** sonrasında to-infinitive gelir: **to hire**.

Diğer şıklar: **B** force + nesne sonrasında to-infinitive gelir / **C** encourage + nesne sonrasında to-infinitive gelir / **D** force + nesne sonrasında to-infinitive gelir ve encourage + nesne sonrasında to-infinitive gelir / **E** force + nesne sonrasında to-infinitive gelir ve encourage + nesne sonrasında to-infinitive gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$It's no use ---- him, because he never admits ---- a mistake even when everyone knows he is wrong.$q$, array[$o$to argue with / making$o$, $o$arguing with / making$o$, $o$arguing with / to make$o$, $o$argue with / make$o$, $o$argued with / made$o$], 1, $e$1. **It's no use** sonrasında gerund gelir: **arguing with**.
2. **Admit** sonrasında gerund gelir: **making**.

Diğer şıklar: **A** it's no use sonrasında gerund gelir / **C** admit sonrasında gerund gelir / **D** it's no use sonrasında gerund gelir ve admit sonrasında gerund gelir / **E** it's no use sonrasında gerund gelir ve admit sonrasında gerund gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The task is too difficult ---- alone, but it is worth ---- if you have a good team.$q$, array[$o$doing / trying$o$, $o$to do / to try$o$, $o$do / try$o$, $o$done / tried$o$, $o$to do / trying$o$], 4, $e$1. **Too + sıfat** sonrasında to-infinitive gelir: **to do**.
2. **Be worth** sonrasında gerund gelir: **trying**.

Diğer şıklar: **A** too + sıfat sonrasında to-infinitive gelir / **B** be worth sonrasında gerund gelir / **C** too + sıfat sonrasında to gerekir ve be worth sonrasında gerund gelir / **D** too + sıfat sonrasında to-infinitive gelir ve be worth sonrasında gerund gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She pretended ---- the question, but I could tell she was avoiding ---- the truth.$q$, array[$o$not hearing / telling$o$, $o$not to hear / to tell$o$, $o$not hear / tell$o$, $o$not to hear / telling$o$, $o$to not hearing / told$o$], 3, $e$1. **Pretend** sonrasında to-infinitive gelir: **not to hear**.
2. **Avoid** sonrasında gerund gelir: **telling**.

Diğer şıklar: **A** pretend sonrasında to-infinitive gelir / **B** avoid sonrasında gerund gelir / **C** pretend sonrasında to gerekir ve avoid sonrasında gerund gelir / **E** pretend sonrasında to + V1 gelir ve avoid sonrasında gerund gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$We are looking forward to ---- you next week, and we hope you will have time ---- the city with us.$q$, array[$o$see / to visit$o$, $o$seeing / visiting$o$, $o$seeing / to visit$o$, $o$to see / visit$o$, $o$saw / visited$o$], 2, $e$1. **Look forward to** içindeki **to** edattır, gerund gelir: **seeing**.
2. **Have time** sonrasında to-infinitive gelir: **to visit**.

Diğer şıklar: **A** look forward to içindeki to edattır / **B** have time sonrasında to-infinitive gelir / **D** look forward to içindeki to edattır ve have time sonrasında to gerekir / **E** look forward to içindeki to edattır ve have time sonrasında to-infinitive gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The minister is widely believed ---- the contract to his brother's firm, an allegation he has repeatedly refused ----.$q$, array[$o$to award / to address$o$, $o$to have awarded / to address$o$, $o$to have awarded / addressing$o$, $o$awarding / address$o$, $o$having awarded / to be addressing$o$], 1, $e$1. **Is believed** + geçmiş eylem: **to have awarded**. **Refuse** + to-infinitive: **to address**.

Diğer şıklar: **A** geçmişteki eylem perfect infinitive ister / **C** refuse sonrasında to-infinitive gelir / **D** believed edilgen yapıda to-infinitive ister ve refuse sonrasında to gerekir / **E** is believed sonrasında to gerekir ve refuse sonrasında basit to-infinitive gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Having been warned several times, the driver insisted on ---- the speed limit, and the police had no choice but ---- him.$q$, array[$o$to ignore / to fine$o$, $o$ignoring / fining$o$, $o$ignore / fine$o$, $o$being ignored / to be fined$o$, $o$ignoring / to fine$o$], 4, $e$1. **Insist on** + gerund: **ignoring**. **Have no choice but to** + V1: **to fine**.

Diğer şıklar: **A** insist on sonrasında gerund gelir / **B** have no choice but sonrasında to-infinitive gelir / **C** insist on sonrasında gerund gelir ve have no choice but to kalıbı / **D** etken anlam gerekir ve etken anlam gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The new regulations are designed ---- small businesses from ---- unfair competition.$q$, array[$o$protecting / suffering$o$, $o$to protect / to suffer$o$, $o$to protect / suffering$o$, $o$protect / suffer$o$, $o$having protected / suffered$o$], 2, $e$1. **Be designed + to-infinitive**: **to protect**. **From** + gerund: **suffering**.

Diğer şıklar: **A** be designed sonrasında to-infinitive gelir / **B** from edatından sonra gerund gelir / **D** be designed sonrasında to gerekir ve from edatından sonra gerund gelir / **E** amaç anlatılır ve from edatından sonra gerund gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I distinctly remember ---- him the key, so I can't understand why he claims not ---- it.$q$, array[$o$to give / to have received$o$, $o$giving / to have received$o$, $o$giving / receiving$o$, $o$give / to receive$o$, $o$having to give / having received$o$], 1, $e$1. **Remember + gerund** (geçmişte yapılan). **Claim + to have + V3**: **to have received**.

Diğer şıklar: **A** remember sonrasında geçmiş eylem gerund ister / **C** claim sonrasında to-infinitive gelir / **D** remember sonrasında gerund gelir ve geçmiş eylem perfect infinitive ister / **E** anlam bozulur ve claim sonrasında to-infinitive gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$She would never dream of ---- anyone to do something she was not prepared ---- herself.$q$, array[$o$asking / to do$o$, $o$to ask / to do$o$, $o$asking / doing$o$, $o$ask / do$o$, $o$being asked / done$o$], 0, $e$1. **Dream of + gerund**: **asking**. **Be prepared + to-infinitive**: **to do**.

Diğer şıklar: **B** dream of sonrasında gerund gelir / **C** be prepared sonrasında to-infinitive gelir / **D** of edatından sonra gerund gelir ve be prepared sonrasında to gerekir / **E** etken anlam gerekir ve be prepared sonrasında to-infinitive gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The machine needs ---- before it can be used again, and the engineer clearly remembered ---- the technician about the fault last week.$q$, array[$o$to repair / telling$o$, $o$repairing / to tell$o$, $o$repair / tell$o$, $o$repairing / telling$o$, $o$repaired / told$o$], 3, $e$1. **Need + gerund** edilgen anlam taşır: **repairing**.
2. Geçmişte yapılan eylemi hatırlama **remember + gerund** ile söylenir: **telling**.

Diğer şıklar: **A** need + gerund edilgen anlam taşır / **B** geçen hafta yapılmış eylem gerund ister / **C** need sonrasında gerund edilgen anlam verir ve remember sonrasında gerund gelir / **E** need sonrasında gerund gelir ve remember sonrasında gerund gelir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Gerunds ve Infinitives konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$Most students enjoy ---- in groups, but some would love ---- alone in a quiet room.$q$, array[$o$to work / to study$o$, $o$working / studying$o$, $o$work / study$o$, $o$working / to study$o$, $o$worked / studied$o$], 3, $e$1. **Enjoy** sonrasında gerund gelir: **working**.
2. **Would love** sonrasında to-infinitive gelir: **to study**.

Diğer şıklar: **A** enjoy sonrasında gerund gelir / **B** would love sonrasında to-infinitive gelir / **C** enjoy sonrasında gerund gelir ve would love sonrasında to gerekir / **E** enjoy sonrasında gerund gelir ve would love sonrasında to-infinitive gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He gave up ---- cigarettes last year, and he has managed ---- healthy ever since.$q$, array[$o$to smoke / to stay$o$, $o$smoking / staying$o$, $o$smoke / stay$o$, $o$smoked / stayed$o$, $o$smoking / to stay$o$], 4, $e$1. **Give up** sonrasında gerund gelir: **smoking**.
2. **Manage** sonrasında to-infinitive gelir: **to stay**.

Diğer şıklar: **A** give up sonrasında gerund gelir / **B** manage sonrasında to-infinitive gelir / **C** give up sonrasında gerund gelir ve manage sonrasında to gerekir / **D** give up sonrasında gerund gelir ve manage sonrasında to-infinitive gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The doctor advised him ---- more water, and warned him ---- too much coffee.$q$, array[$o$drinking / not to have$o$, $o$to drink / not having$o$, $o$to drink / not to have$o$, $o$drink / don't have$o$, $o$drank / to not having$o$], 2, $e$1. **Advise + nesne** sonrasında to-infinitive gelir: **to drink**.
2. **Warn + nesne** sonrasında not to + V1 gelir: **not to have**.

Diğer şıklar: **A** advise + nesne sonrasında to-infinitive gelir / **B** warn + nesne sonrasında not to + V1 gelir / **D** advise + nesne sonrasında to gerekir ve warn + nesne sonrasında to-infinitive gelir / **E** advise + nesne sonrasında to-infinitive gelir ve warn + nesne sonrasında not to + V1 gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$My parents made me ---- my room, and they let me ---- out with my friends afterwards.$q$, array[$o$clean / go$o$, $o$to clean / go$o$, $o$clean / to go$o$, $o$cleaning / going$o$, $o$cleaned / gone$o$], 0, $e$1. **Make + nesne** sonrasında yalın fiil gelir: **clean**.
2. **Let + nesne** sonrasında yalın fiil gelir: **go**.

Diğer şıklar: **B** make + nesne sonrasında yalın fiil gelir / **C** let + nesne sonrasında yalın fiil gelir / **D** make + nesne sonrasında yalın fiil gelir ve let + nesne sonrasında yalın fiil gelir / **E** make + nesne sonrasında yalın fiil gelir ve let + nesne sonrasında yalın fiil gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I can't afford ---- a new car, so I'm thinking of ---- a used one instead.$q$, array[$o$buying / getting$o$, $o$to buy / to get$o$, $o$buy / get$o$, $o$to buy / getting$o$, $o$bought / got$o$], 3, $e$1. **Afford** sonrasında to-infinitive gelir: **to buy**.
2. **Think of** sonrasında gerund gelir: **getting**.

Diğer şıklar: **A** afford sonrasında to-infinitive gelir / **B** think of sonrasında gerund gelir / **C** afford sonrasında to gerekir ve think of sonrasında gerund gelir / **E** afford sonrasında to-infinitive gelir ve think of sonrasında gerund gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The new job will mean ---- to another city, but I never meant ---- you by leaving without telling you.$q$, array[$o$to move / to hurt$o$, $o$moving / hurting$o$, $o$move / hurt$o$, $o$moved / hurt$o$, $o$moving / to hurt$o$], 4, $e$1. **Mean** gerektirmek anlamında gerund alır: **moving**.
2. **Mean** niyet etmek anlamında to-infinitive alır: **to hurt**.

Diğer şıklar: **A** mean (gerektirmek) sonrasında gerund gelir / **B** mean (niyet etmek) sonrasında to-infinitive gelir / **C** mean sonrasında gerund gelir ve mean sonrasında to gerekir / **D** mean sonrasında gerund gelir ve mean niyet anlamında to-infinitive ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She went on ---- about her problems for hours, and then went on ---- how she would solve them.$q$, array[$o$talking / to explain$o$, $o$to talk / to explain$o$, $o$talking / explained$o$, $o$talk / explain$o$, $o$talked / be explaining$o$], 0, $e$1. Aynı eylemi sürdürmek **go on + gerund** ile söylenir: **talking**.
2. Sonraki eyleme geçmek **go on + to-infinitive** ile söylenir: **to explain**.

Diğer şıklar: **B** go on + gerund sürdürmeyi anlatır / **C** go on + to-infinitive sonraki eylemi anlatır / **D** go on sonrasında gerund gelir ve go on sonrasında to gerekir / **E** go on sonrasında gerund gelir ve yapı bozulur.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The book is well worth ---- again, but I don't have enough time ---- it before the exam.$q$, array[$o$to read / to read$o$, $o$reading / to read$o$, $o$reading / reading$o$, $o$read / read$o$, $o$being read / having read$o$], 1, $e$1. **Be worth** sonrasında gerund gelir: **reading**.
2. **Enough time** sonrasında to-infinitive gelir: **to read**.

Diğer şıklar: **A** be worth sonrasında gerund gelir / **C** enough time sonrasında to-infinitive gelir / **D** be worth sonrasında gerund gelir ve enough time sonrasında to gerekir / **E** anlam değişir // ve enough time sonrasında to-infinitive gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He resented ---- as a child by his classmates, and he never forgave them for ---- him.$q$, array[$o$to treat / ignoring$o$, $o$being treated / to ignore$o$, $o$being treated / ignoring$o$, $o$treating / ignore$o$, $o$having treated / ignored$o$], 2, $e$1. **Resent** sonrasında gerund gelir ve anlam edilgendir: **being treated**.
2. **For** edatından sonra gerund gelir: **ignoring**.

Diğer şıklar: **A** resent sonrasında gerund gelir / **B** for edatından sonra gerund gelir / **D** edilgen anlam gerekir ve for edatından sonra gerund gelir / **E** edilgen anlam gerekir ve for edatından sonra gerund gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$There is no point in ---- for the job if you aren't prepared ---- abroad.$q$, array[$o$to apply / to work$o$, $o$applying / working$o$, $o$apply / work$o$, $o$applying / to work$o$, $o$applied / worked$o$], 3, $e$1. **There is no point in** sonrasında gerund gelir: **applying**.
2. **Be prepared** sonrasında to-infinitive gelir: **to work**.

Diğer şıklar: **A** edatından sonra gerund gelir / **B** be prepared sonrasında to-infinitive gelir / **C** in edatından sonra gerund gelir ve be prepared sonrasında to gerekir / **E** in edatından sonra gerund gelir ve be prepared sonrasında to-infinitive gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The police ordered everyone ---- the building, and the guards made them ---- outside in the cold.$q$, array[$o$leave / wait$o$, $o$to leave / wait$o$, $o$to leave / to wait$o$, $o$leaving / waiting$o$, $o$left / waited$o$], 1, $e$1. **Order + nesne** sonrasında to-infinitive gelir: **to leave**.
2. **Make + nesne** sonrasında yalın fiil gelir: **wait**.

Diğer şıklar: **A** order + nesne sonrasında to gerekir / **C** make + nesne sonrasında yalın fiil gelir / **D** order + nesne sonrasında to-infinitive gelir ve make + nesne sonrasında yalın fiil gelir / **E** order + nesne sonrasında to-infinitive gelir ve make + nesne sonrasında yalın fiil gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She spends hours ---- her garden at weekends, and she's always busy ---- new flowers.$q$, array[$o$looking after / planting$o$, $o$to look after / planting$o$, $o$looking after / to plant$o$, $o$look after / plant$o$, $o$looked after / planted$o$], 0, $e$1. **Spend + zaman** sonrasında gerund gelir: **looking after**.
2. **Be busy** sonrasında gerund gelir: **planting**.

Diğer şıklar: **B** spend + zaman sonrasında gerund gelir / **C** be busy sonrasında gerund gelir / **D** spend + zaman sonrasında gerund gelir ve be busy sonrasında gerund gelir / **E** spend + zaman sonrasında gerund gelir ve be busy sonrasında gerund gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I forgot ---- the milk on my way home yesterday, but I'll never forget ---- the look on the shopkeeper's face when I told him.$q$, array[$o$buying / seeing$o$, $o$to buy / to see$o$, $o$to buy / seeing$o$, $o$buy / see$o$, $o$bought / saw$o$], 2, $e$1. Yapılması gereken işi unutmak **forget + to-infinitive** ile söylenir: **to buy**.
2. Yaşanmış bir anıyı unutmamak **forget + gerund** ile söylenir: **seeing**.

Diğer şıklar: **A** yapılması gereken işi unutma to-infinitive ister / **B** yaşanmış anıyı unutmama gerund ister / **D** forget sonrasında to gerekir ve forget sonrasında gerund gelir / **E** forget sonrasında to-infinitive gelir ve forget sonrasında gerund gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The company agreed ---- the workers' wages, but only after the unions threatened ---- a strike.$q$, array[$o$raising / to call$o$, $o$to raise / calling$o$, $o$raise / call$o$, $o$raised / called$o$, $o$to raise / to call$o$], 4, $e$1. **Agree** sonrasında to-infinitive gelir: **to raise**.
2. **Threaten** sonrasında to-infinitive gelir: **to call**.

Diğer şıklar: **A** agree sonrasında to-infinitive gelir / **B** threaten sonrasında to-infinitive gelir / **C** agree sonrasında to gerekir ve threaten sonrasında to gerekir / **D** agree sonrasında to-infinitive gelir ve threaten sonrasında to-infinitive gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The negotiators agreed ---- the talks until the following week, despite ---- under pressure from both governments to reach a deal immediately.$q$, array[$o$postponing / being$o$, $o$to postpone / being$o$, $o$to postpone / to be$o$, $o$postpone / be$o$, $o$having postponed / been$o$], 1, $e$1. **Agree + to-infinitive**: **to postpone**. **Despite + gerund**: **being**.

Diğer şıklar: **A** agree sonrasında to-infinitive gelir / **C** despite sonrasında gerund gelir / **D** agree sonrasında to gerekir ve despite sonrasında gerund gelir / **E** agree sonrasında to gelir ve despite sonrasında gerund gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$I would rather ---- the truth now than ---- the consequences of a lie later.$q$, array[$o$to tell / face$o$, $o$tell / facing$o$, $o$tell / face$o$, $o$telling / to face$o$, $o$told / faced$o$], 2, $e$1. **Would rather ... than** kalıbında iki fiil de yalın gelir: **tell / face**.

Diğer şıklar: **A** would rather sonrasında yalın fiil gelir / **B** than sonrasında yalın fiil gelir / **D** would rather sonrasında yalın fiil gelir ve would rather than kalıbında yalın fiil gelir / **E** would rather sonrasında yalın fiil gelir ve than sonrasında yalın fiil gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The report is thought ---- by a retired judge, and its authors are reluctant ---- any comments before publication.$q$, array[$o$to have been drafted / to make$o$, $o$to draft / to make$o$, $o$to have been drafted / making$o$, $o$drafting / make$o$, $o$to be drafted / made$o$], 0, $e$1. **Is thought + to have been V3**: **to have been drafted**. **Reluctant + to-infinitive**: **to make**.

Diğer şıklar: **B** geçmişteki edilgen eylem ister / **C** reluctant sonrasında to-infinitive gelir / **D** is thought sonrasında to gelir ve reluctant sonrasında to gerekir / **E** geçmiş zaman perfect infinitive ister ve reluctant sonrasında to-infinitive gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He resented ---- as a child and spent the rest of his life trying ---- his own children from ever feeling the same.$q$, array[$o$to ignore / to protect$o$, $o$being ignored / protecting$o$, $o$ignoring / protect$o$, $o$having ignored / protected$o$, $o$being ignored / to protect$o$], 4, $e$1. **Resent + being + V3**: **being ignored**. **Try + to-infinitive** çaba göstermek: **to protect**.

Diğer şıklar: **A** resent sonrasında edilgen gerund gelir / **B** try + gerund deneme anlamı verir, çaba için to-infinitive gerekir / **C** etken anlam yanlıştır ve try sonrasında to gerekir / **D** edilgen anlam gerekir ve try sonrasında to gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The old woman was accused ---- the donations she had received for the orphanage, although nothing was ever proved.$q$, array[$o$for misusing$o$, $o$of misusing$o$, $o$to misuse$o$, $o$misusing$o$, $o$with misuse$o$], 1, $e$1. **Accuse of + gerund**: **of misusing**.

Diğer şıklar: **A** accuse of kalıbı / **C** accuse of sonrasında gerund gelir / **D** accuse sonrasında of gerekir / **E** accuse of + gerund kalıbı.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The workers were made ---- overtime, and they weren't allowed ---- the factory until the order was complete.$q$, array[$o$work / to leave$o$, $o$to work / leave$o$, $o$working / leaving$o$, $o$to work / to leave$o$, $o$worked / left$o$], 3, $e$1. **Make** edilgen yapıda to-infinitive alır: **to work**.
2. **Be allowed** sonrasında to-infinitive gelir: **to leave**.

Diğer şıklar: **A** make edilgen yapıda to-infinitive ister / **B** allowed sonrasında to-infinitive gelir / **C** make edilgen yapıda to-infinitive ister ve allowed sonrasında to-infinitive gelir / **E** make edilgen yapıda to-infinitive ister ve allowed sonrasında to-infinitive gelir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Gerunds ve Infinitives konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I look forward to ---- you, and I hope ---- you soon.$q$, array[$o$to meet / to see$o$, $o$meeting / seeing$o$, $o$meet / see$o$, $o$met / saw$o$, $o$meeting / to see$o$], 4, $e$1. **Look forward to** sonrasında gerund gelir: **meeting**.
2. **Hope** sonrasında to-infinitive gelir: **to see**.

Diğer şıklar: **A** look forward to içindeki to edattır / **B** hope sonrasında to-infinitive gelir / **C** look forward to sonrasında gerund gelir ve hope sonrasında to gerekir / **D** look forward to sonrasında gerund gelir ve hope sonrasında to-infinitive gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He is too tired ---- tonight, and he doesn't feel like ---- out either.$q$, array[$o$studying / going$o$, $o$to study / going$o$, $o$to study / to go$o$, $o$study / go$o$, $o$studied / went$o$], 1, $e$1. **Too + sıfat** sonrasında to-infinitive gelir: **to study**.
2. **Feel like** sonrasında gerund gelir: **going**.

Diğer şıklar: **A** too + sıfat sonrasında to-infinitive gelir / **C** feel like sonrasında gerund gelir / **D** too + sıfat sonrasında to gerekir ve feel like sonrasında gerund gelir / **E** too + sıfat sonrasında to-infinitive gelir ve feel like sonrasında gerund gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Please remember ---- the lights when you leave, and don't forget ---- the door too.$q$, array[$o$to turn off / to lock$o$, $o$turning off / to lock$o$, $o$to turn off / locking$o$, $o$turn off / lock$o$, $o$turned off / locked$o$], 0, $e$1. **Remember + to-infinitive** yapılacak işi anlatır: **to turn off**.
2. **Forget + to-infinitive** yapılacak işi anlatır: **to lock**.

Diğer şıklar: **B** yapılacak iş için to-infinitive gelir / **C** yapılacak iş için to-infinitive gelir / **D** remember sonrasında to gerekir ve forget sonrasında to gerekir / **E** remember sonrasında to-infinitive gelir ve forget sonrasında to-infinitive gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$My teacher told me ---- harder, so I gave up ---- computer games in the evenings.$q$, array[$o$studying / playing$o$, $o$to study / to play$o$, $o$to study / playing$o$, $o$study / play$o$, $o$studied / played$o$], 2, $e$1. **Tell + nesne** sonrasında to-infinitive gelir: **to study**.
2. **Give up** sonrasında gerund gelir: **playing**.

Diğer şıklar: **A** tell + nesne sonrasında to-infinitive gelir / **B** give up sonrasında gerund gelir / **D** tell + nesne sonrasında to gerekir ve give up sonrasında gerund gelir / **E** tell + nesne sonrasında to-infinitive gelir ve give up sonrasında gerund gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$They didn't let the passengers ---- the plane until the captain asked them ---- their seats.$q$, array[$o$to leave / to take$o$, $o$leave / take$o$, $o$leaving / taking$o$, $o$left / took$o$, $o$leave / to take$o$], 4, $e$1. **Let + nesne** sonrasında yalın fiil gelir: **leave**.
2. **Ask + nesne** sonrasında to-infinitive gelir: **to take**.

Diğer şıklar: **A** let + nesne sonrasında yalın fiil gelir / **B** ask + nesne sonrasında to-infinitive gelir / **C** let + nesne sonrasında yalın fiil gelir ve ask + nesne sonrasında to-infinitive gelir / **D** let + nesne sonrasında yalın fiil gelir ve ask + nesne sonrasında to-infinitive gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$Instead of ---- the problem, the manager chose ---- it for another week.$q$, array[$o$to solve / to ignore$o$, $o$solving / ignoring$o$, $o$solve / ignore$o$, $o$solving / to ignore$o$, $o$solved / ignored$o$], 3, $e$1. **Instead of** sonrasında gerund gelir: **solving**.
2. **Choose** sonrasında to-infinitive gelir: **to ignore**.

Diğer şıklar: **A** instead of sonrasında gerund gelir / **B** choose sonrasında to-infinitive gelir / **C** instead of sonrasında gerund gelir ve choose sonrasında to gerekir / **E** instead of sonrasında gerund gelir ve choose sonrasında to-infinitive gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She is capable of ---- three languages fluently, but she is reluctant ---- in public.$q$, array[$o$speaking / to perform$o$, $o$to speak / to perform$o$, $o$speaking / performing$o$, $o$speak / perform$o$, $o$spoken / performed$o$], 0, $e$1. **Capable of** sonrasında gerund gelir: **speaking**.
2. **Reluctant** sonrasında to-infinitive gelir: **to perform**.

Diğer şıklar: **B** capable of sonrasında gerund gelir / **C** reluctant sonrasında to-infinitive gelir / **D** capable of sonrasında gerund gelir ve reluctant sonrasında to gerekir / **E** capable of sonrasında gerund gelir ve reluctant sonrasında to-infinitive gelir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$They accused him of ---- the documents, but he denied ---- anything illegal.$q$, array[$o$to forge / doing$o$, $o$forging / doing$o$, $o$forging / to do$o$, $o$forge / do$o$, $o$forged / done$o$], 1, $e$1. **Accuse of** sonrasında gerund gelir: **forging**.
2. **Deny** sonrasında gerund gelir: **doing**.

Diğer şıklar: **A** accuse of sonrasında gerund gelir / **C** deny sonrasında gerund gelir / **D** of edatından sonra gerund gelir ve deny sonrasında gerund gelir / **E** of edatından sonra gerund gelir ve deny sonrasında gerund gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I was surprised ---- him at the airport, because I thought he had given up ---- abroad.$q$, array[$o$seeing / travelling$o$, $o$to see / to travel$o$, $o$to see / travelling$o$, $o$see / travel$o$, $o$seen / travelled$o$], 2, $e$1. **Be surprised** sonrasında to-infinitive gelir: **to see**.
2. **Give up** sonrasında gerund gelir: **travelling**.

Diğer şıklar: **A** surprised sonrasında to-infinitive gelir / **B** give up sonrasında gerund gelir / **D** surprised sonrasında to gerekir ve give up sonrasında gerund gelir / **E** surprised sonrasında to-infinitive gelir ve give up sonrasında gerund gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The new software enables users ---- files quickly, and it prevents anyone ---- them without permission.$q$, array[$o$sharing / from deleting$o$, $o$to share / to delete$o$, $o$share / from delete$o$, $o$to share / from deleting$o$, $o$shared / deleting$o$], 3, $e$1. **Enable + nesne** sonrasında to-infinitive gelir: **to share**.
2. **Prevent + nesne** sonrasında from + gerund gelir: **from deleting**.

Diğer şıklar: **A** enable + nesne sonrasında to-infinitive gelir / **B** prevent + nesne + from + gerund gelir / **C** enable + nesne sonrasında to gerekir ve from sonrasında gerund gelir / **E** enable + nesne sonrasında to-infinitive gelir ve prevent + nesne sonrasında from gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I'd rather ---- than ---- in this crowded room for another hour.$q$, array[$o$leave / stay$o$, $o$to leave / stay$o$, $o$leave / to stay$o$, $o$leaving / staying$o$, $o$left / stayed$o$], 0, $e$1. **Would rather** sonrasında yalın fiil gelir: **leave**.
2. **Than** sonrasında da yalın fiil gelir: **stay**.

Diğer şıklar: **B** would rather sonrasında yalın fiil gelir / **C** than sonrasında yalın fiil gelir / **D** would rather sonrasında yalın fiil gelir ve would rather than kalıbında yalın fiil gelir / **E** would rather sonrasında yalın fiil gelir ve than sonrasında yalın fiil gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He was the first person ---- the summit, and he was lucky ---- the storm.$q$, array[$o$reaching / to survive$o$, $o$to reach / surviving$o$, $o$reach / survive$o$, $o$reached / survived$o$, $o$to reach / to survive$o$], 4, $e$1. **The first** sonrasında to-infinitive gelir: **to reach**.
2. **Lucky** sonrasında to-infinitive gelir: **to survive**.

Diğer şıklar: **A** the first sonrasında to-infinitive gelir / **B** lucky sonrasında to-infinitive gelir / **C** the first sonrasında to-infinitive gelir ve lucky sonrasında to gerekir / **D** the first sonrasında to-infinitive gelir ve lucky sonrasında to-infinitive gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$It took her three years ---- the novel, and she doesn't regret ---- so much time on it.$q$, array[$o$finishing / spending$o$, $o$to finish / to spend$o$, $o$to finish / spending$o$, $o$finish / spend$o$, $o$finished / spent$o$], 2, $e$1. **It takes + zaman** sonrasında to-infinitive gelir: **to finish**.
2. **Regret** sonrasında gerund gelir: **spending**.

Diğer şıklar: **A** it takes + kişi + zaman sonrasında to-infinitive gelir / **B** regret sonrasında gerund gelir / **D** it takes sonrasında to gerekir ve regret sonrasında gerund gelir / **E** it takes sonrasında to-infinitive gelir ve regret sonrasında gerund gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The mechanic warned us ---- the car without servicing, and he suggested ---- it to the garage every six months.$q$, array[$o$not driving / taking$o$, $o$not to drive / taking$o$, $o$not to drive / to take$o$, $o$not drive / take$o$, $o$to not drive / took$o$], 1, $e$1. **Warn + nesne** sonrasında olumsuz to-infinitive gelir: **not to drive**.
2. **Suggest** sonrasında gerund gelir: **taking**.

Diğer şıklar: **A** warn + nesne sonrasında not to + V1 gelir / **C** suggest sonrasında gerund gelir / **D** warn + nesne sonrasında to gerekir ve suggest sonrasında gerund gelir / **E** olumsuzluk not to ile kurulur ve suggest sonrasında gerund gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The children were not allowed ---- the room until they had finished ---- their toys away.$q$, array[$o$leaving / putting$o$, $o$to leave / to put$o$, $o$leave / put$o$, $o$to leave / putting$o$, $o$left / having put$o$], 3, $e$1. **Be allowed + to-infinitive**: **to leave**. **Finish + gerund**: **putting**.

Diğer şıklar: **A** allowed sonrasında to-infinitive gelir / **B** finish sonrasında gerund gelir / **C** allow edilgen yapıda to gerekir ve finish sonrasında gerund gelir / **E** allowed sonrasında to-infinitive gelir ve anlam bozulur.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$It is no good ---- over spilt milk, and there is little point in ---- about what cannot be changed.$q$, array[$o$to cry / worrying$o$, $o$crying / to worry$o$, $o$cry / worry$o$, $o$cried / worried$o$, $o$crying / worrying$o$], 4, $e$1. **It is no good + gerund**: **crying**. **Point in + gerund**: **worrying**.

Diğer şıklar: **A** it is no good sonrasında gerund gelir / **B** point in sonrasında gerund gelir / **C** it is no good sonrasında gerund gelir ve in edatından sonra gerund gelir / **D** it is no good sonrasında gerund gelir ve in edatından sonra gerund gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She pretended ---- asleep so as ---- drawn into the argument between her parents.$q$, array[$o$being / not to be$o$, $o$to be / not to be$o$, $o$to be / for not being$o$, $o$be / not being$o$, $o$having been / don't be$o$], 1, $e$1. **Pretend + to-infinitive**: **to be**. **So as not to + V1**: **not to be**.

Diğer şıklar: **A** pretend sonrasında to-infinitive gelir / **C** so as sonrasında not to kalıbı / **D** pretend sonrasında to gerekir ve so as sonrasında to-infinitive gelir / **E** pretend sonrasında to gelir ve so as sonrasında to-infinitive gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I vividly remember ---- terrified when the pilot announced that we were about ---- an emergency landing.$q$, array[$o$feeling / to make$o$, $o$to feel / to make$o$, $o$feeling / making$o$, $o$feel / make$o$, $o$having felt / made$o$], 0, $e$1. **Remember + gerund**: **feeling**. **Be about to + V1**: **to make**.

Diğer şıklar: **B** remember sonrasında geçmiş deneyim gerund ister / **C** be about sonrasında to-infinitive gelir / **D** remember sonrasında gerund gelir ve be about to kalıbı / **E** anlam bozulur ve be about to kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$They had no intention ---- the project, yet they could not afford ---- it public that funding was running out.$q$, array[$o$to abandon / to make$o$, $o$of abandoning / making$o$, $o$of abandoning / to make$o$, $o$abandon / make$o$, $o$abandoned / made$o$], 2, $e$1. **Intention of + gerund**: **of abandoning**. **Afford + to-infinitive**: **to make**.

Diğer şıklar: **A** intention of sonrasında gerund gelir / **B** afford sonrasında to-infinitive gelir / **D** of edatından sonra gerund gelir ve afford sonrasında to gerekir / **E** of edatından sonra gerund gelir ve afford sonrasında to-infinitive gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She claims ---- the first woman ---- the Atlantic in a rowing boat, but nobody has confirmed it.$q$, array[$o$being / to cross$o$, $o$to have been / crossing$o$, $o$to be / cross$o$, $o$to have been / to cross$o$, $o$have been / crossed$o$], 3, $e$1. **Claim** ile geçmişteki durum **to have been** ile söylenir.
2. **The first** sonrasında to-infinitive gelir: **to cross**.

Diğer şıklar: **A** claim sonrasında to-infinitive gelir / **B** the first sonrasında to-infinitive gelir / **C** geçmişteki durum perfect infinitive ister ve the first sonrasında to gerekir / **E** claim sonrasında to gerekir ve the first sonrasında to-infinitive gelir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Gerunds ve Infinitives konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Modals konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$You ---- park here, because it is a no-parking zone, but you ---- use the car park across the road.$q$, array[$o$mustn't / can$o$, $o$needn't / can$o$, $o$mustn't / must$o$, $o$don't have to / should$o$, $o$may not / have to$o$], 0, $e$1. Yasak **mustn't** ile söylenir: **mustn't**.
2. İzin **can** ile söylenir: **can**.

Diğer şıklar: **B** yasak anlamı mustn't ile verilir / **C** izin anlamı can ile verilir / **D** yasak anlamı mustn't ile verilir ve izin anlamı can ile verilir / **E** yasak anlamı mustn't ile verilir ve izin anlamı can ile verilir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$When I was a child, I ---- swim, but now I ---- swim two kilometres without stopping.$q$, array[$o$can't / can$o$, $o$couldn't / can$o$, $o$couldn't / could$o$, $o$mustn't / must$o$, $o$shouldn't / may$o$], 1, $e$1. Geçmişteki yetenek **could** ile söylenir: **couldn't**.
2. Şimdiki yetenek **can** ile söylenir: **can**.

Diğer şıklar: **A** geçmişteki yetenek could ile söylenir / **C** şimdiki yetenek can ile söylenir / **D** yasak anlamı verir ve şimdiki yetenek can ile söylenir / **E** tavsiye anlamı verir ve şimdiki yetenek can ile söylenir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$You ---- see a doctor if the pain continues, and you ---- take any medicine without asking him first.$q$, array[$o$needn't / shouldn't$o$, $o$should / needn't$o$, $o$can't / don't have to$o$, $o$mustn't / can$o$, $o$should / shouldn't$o$], 4, $e$1. Tavsiye **should** ile söylenir: **should**.
2. Olumsuz tavsiye **shouldn't** ile söylenir: **shouldn't**.

Diğer şıklar: **A** tavsiye anlamı should ile verilir / **B** olumsuz tavsiye shouldn't ile verilir / **C** tavsiye anlamı should ile verilir ve olumsuz tavsiye shouldn't ile verilir / **D** tavsiye anlamı should ile verilir ve olumsuz tavsiye shouldn't ile verilir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$---- I borrow your pen for a moment? I ---- find mine in my bag.$q$, array[$o$Must / can't$o$, $o$May / needn't$o$, $o$Should / mustn't$o$, $o$May / can't$o$, $o$Need / won't$o$], 3, $e$1. **May** izin istemek için kullanılır: **May**.
2. Yeteneksizlik **can't** ile söylenir: **can't**.

Diğer şıklar: **A** izin isteme may ile söylenir / **B** bulamama yeteneksizliği can't ile söylenir / **C** izin isteme may ile söylenir ve bulamama yeteneksizliği can't ile söylenir / **E** izin isteme may ile söylenir ve bulamama yeteneksizliği can't ile söylenir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Tomorrow is a holiday, so we ---- get up early, but we ---- be at the airport by noon.$q$, array[$o$mustn't / must$o$, $o$don't have to / can$o$, $o$don't have to / must$o$, $o$can't / may$o$, $o$shouldn't / might$o$], 2, $e$1. Zorunluluk olmaması **don't have to** ile söylenir: **don't have to**.
2. Güçlü zorunluluk **must** ile söylenir: **must**.

Diğer şıklar: **A** zorunluluk olmaması don't have to ile söylenir / **B** güçlü zorunluluk must ile söylenir / **D** zorunluluk olmaması don't have to ile söylenir ve güçlü zorunluluk must ile söylenir / **E** zorunluluk olmaması don't have to ile söylenir ve güçlü zorunluluk must ile söylenir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The lights are off, so they ---- be at home, but they ---- have gone out for dinner.$q$, array[$o$can't / may$o$, $o$must / may$o$, $o$can't / can$o$, $o$should / must$o$, $o$needn't / shall$o$], 0, $e$1. Olumsuz çıkarım **can't** ile söylenir: **can't**.
2. Geçmişe dair olasılık **may have + V3** ile söylenir: **may**.

Diğer şıklar: **B** ışıklar kapalıyken evde oldukları kesin sanılmaz / **C** geçmişe dair olasılık may have ile söylenir / **D** olumsuz çıkarım can't ile söylenir ve geçmişe dair olasılık may have ile söylenir / **E** olumsuz çıkarım can't ile söylenir ve geçmişe dair olasılık may have ile söylenir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He ---- have left his wallet at the office, because he has looked for it everywhere at home, and it ---- have been stolen.$q$, array[$o$can / might$o$, $o$must / must$o$, $o$should / can't$o$, $o$must / might$o$, $o$needn't / would$o$], 3, $e$1. Güçlü çıkarım **must have + V3** ile söylenir: **must**.
2. Zayıf olasılık **might have + V3** ile söylenir: **might**.

Diğer şıklar: **A** güçlü çıkarım must have ile söylenir / **B** zayıf olasılık might have ile söylenir / **C** güçlü çıkarım must have ile söylenir ve zayıf olasılık might have ile söylenir / **E** güçlü çıkarım must have ile söylenir ve zayıf olasılık might have ile söylenir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$You ---- have told me earlier, because now it is too late, but you ---- have known that I was away, so I don't blame you.$q$, array[$o$needn't / couldn't$o$, $o$should / couldn't$o$, $o$should / must$o$, $o$must / shouldn't$o$, $o$might / needn't$o$], 1, $e$1. Geçmişteki eleştiri **should have + V3** ile söylenir: **should**.
2. Bilme olanağının olmaması **couldn't have + V3** ile söylenir: **couldn't**.

Diğer şıklar: **A** geçmiş eleştirisi should have ile söylenir / **C** imkânsız çıkarım couldn't have ile söylenir / **D** geçmiş eleştirisi should have ile söylenir ve anlam bozulur / **E** geçmiş eleştirisi should have ile söylenir ve anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The flight was delayed by three hours, so we ---- have hurried to the airport, and the airline ---- have told us about it earlier.$q$, array[$o$mustn't / could$o$, $o$needn't / can$o$, $o$needn't / could$o$, $o$can't / mustn't$o$, $o$couldn't / will$o$], 2, $e$1. Gereksiz yapılmış eylem **needn't have + V3** ile söylenir: **needn't**.
2. Yapılabilecek ama yapılmayan eylem **could have + V3** ile söylenir: **could**.

Diğer şıklar: **A** gereksiz davranış needn't have ile söylenir / **B** geçmişte yapılabilecek ama yapılmayan eylem could have ile söylenir / **D** gereksiz davranış needn't have ile söylenir ve geçmişte yapılabilecek eylem could have ile söylenir / **E** gereksiz davranış needn't have ile söylenir ve geçmişte yapılabilecek eylem could have ile söylenir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Although the road was icy, the driver ---- stop the bus before it hit the wall, so nobody was hurt.$q$, array[$o$should$o$, $o$must$o$, $o$would$o$, $o$might$o$, $o$was able to$o$], 4, $e$1. Geçmişte tek seferlik başarı **was able to** ile söylenir: **was able to**.

Diğer şıklar: **A** tek seferlik başarı was able to ile söylenir / **B** tek seferlik başarı was able to ile söylenir / **C** tek seferlik başarı was able to ile söylenir / **D** tek seferlik başarı was able to ile söylenir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$If you want to get a good seat, you ---- queue early, but you ---- pay in advance because the tickets will be available at the door.$q$, array[$o$had better / needn't$o$, $o$needn't / needn't$o$, $o$had better / have to$o$, $o$can't / must$o$, $o$mustn't / should$o$], 0, $e$1. Güçlü öneri **had better** ile söylenir: **had better**.
2. Gerek olmaması **needn't** ile söylenir: **needn't**.

Diğer şıklar: **B** öneri had better ile söylenir / **C** gerek olmaması needn't ile söylenir / **D** öneri had better ile söylenir ve gerek olmaması needn't ile söylenir / **E** öneri had better ile söylenir ve gerek olmaması needn't ile söylenir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Students ---- hand in their projects by Friday, otherwise they ---- fail the course.$q$, array[$o$can / will$o$, $o$must / would$o$, $o$must / will$o$, $o$may / could$o$, $o$might / should$o$], 2, $e$1. Zorunluluk **must** ile söylenir: **must**.
2. Gerçekçi sonuç **will** ile söylenir: **will**.

Diğer şıklar: **A** zorunluluk must ile söylenir / **B** gerçekçi sonuç will ile söylenir / **D** zorunluluk must ile söylenir ve gerçekçi sonuç will ile söylenir / **E** zorunluluk must ile söylenir ve gerçekçi sonuç will ile söylenir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The meeting ---- be cancelled because the director is ill, but I ---- confirm it until I speak to his assistant.$q$, array[$o$needn't / can't$o$, $o$may / needn't$o$, $o$mustn't / shouldn't$o$, $o$shall / might$o$, $o$may / can't$o$], 4, $e$1. Olasılık **may** ile söylenir: **may**.
2. Doğrulayamama **can't** ile söylenir: **can't**.

Diğer şıklar: **A** olasılık may ile söylenir / **B** yeteneksizlik anlamı can't ile söylenir / **C** olasılık may ile söylenir ve yeteneksizlik anlamı can't ile söylenir / **D** olasılık may ile söylenir ve yeteneksizlik anlamı can't ile söylenir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Shall we ---- the shopping tomorrow, or ---- we do it this evening, since the stores close late?$q$, array[$o$doing / should$o$, $o$do / should$o$, $o$do / do$o$, $o$to do / shall$o$, $o$done / would$o$], 1, $e$1. **Shall we** sonrasında yalın fiil gelir: **do**.
2. Öneri **should we** ile devam eder: **should**.

Diğer şıklar: **A** shall we sonrasında yalın fiil gelir / **C** or sonrasında modal gerekir / **D** shall we sonrasında yalın fiil gelir ve öneri cümlesi should ile kurulur / **E** shall we sonrasında yalın fiil gelir ve öneri cümlesi should ile kurulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He is so strong that he ---- lift the heavy box on his own, but he ---- be careful with his back.$q$, array[$o$must / should$o$, $o$can / can$o$, $o$should / could$o$, $o$can / should$o$, $o$needn't / would$o$], 3, $e$1. Yetenek **can** ile söylenir: **can**.
2. Tavsiye **should** ile söylenir: **should**.

Diğer şıklar: **A** yetenek can ile söylenir / **B** tavsiye should ile söylenir / **C** yetenek can ile söylenir ve tavsiye should ile söylenir / **E** yetenek can ile söylenir ve tavsiye should ile söylenir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The lights were on and the car was in the drive, so they ---- at home when we called, although nobody answered.$q$, array[$o$can't have been$o$, $o$should be$o$, $o$must be$o$, $o$needn't have been$o$, $o$must have been$o$], 4, $e$1. **Geçmişe dair güçlü çıkarım**: **must have been**.

Diğer şıklar: **A** ışıklar ve araba evde olduklarını düşündürür / **B** geçmişteki durum ister / **C** geçmişe dair çıkarım perfect ister / **D** çıkarım anlamı yok.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$We took a taxi because we thought the train had left, but it was delayed, so we ---- the money.$q$, array[$o$needn't have spent$o$, $o$mustn't have spent$o$, $o$can't have spent$o$, $o$shouldn't have spent$o$, $o$couldn't have spent$o$], 0, $e$1. **Gereksiz yapılmış eylem**: **needn't have spent**.

Diğer şıklar: **B** yasak anlamı verir / **C** imkânsız çıkarım anlamı verir / **D** eleştiri, gereksizlik anlamı için needn't gerekir / **E** imkânsız çıkarım.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The manager ---- us earlier about the changes, but he said nothing until the last day.$q$, array[$o$ought to tell$o$, $o$must have told$o$, $o$ought to have told$o$, $o$can have told$o$, $o$would tell$o$], 2, $e$1. **Yapılması gerekirdi ama yapılmadı**: **ought to have told**.

Diğer şıklar: **A** geçmişe dair eleştiri perfect ister / **B** geçmişte söylemedi, çıkarım anlamı çelişir / **D** anlam bozulur / **E** geçmişteki alışkanlık anlamı verir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The vase was priceless, and the cleaner is very careful, so it ---- by her.$q$, array[$o$mustn't have been broken$o$, $o$needn't have been broken$o$, $o$shouldn't be broken$o$, $o$can't have been broken$o$, $o$may be broken$o$], 3, $e$1. **Geçmişe dair olumsuz çıkarım edilgen**: **can't have been broken**.

Diğer şıklar: **A** yasak anlamı verir / **B** gereksizlik anlamı verir / **C** geçmişe dair çıkarım yok / **E** geçmiş edilgen yapı gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She is not in the library right now. She ---- there, because she told me she was going to the gym.$q$, array[$o$mustn't be$o$, $o$can't be$o$, $o$needn't be$o$, $o$shouldn't have been$o$, $o$may have been$o$], 1, $e$1. **Şimdiye dair olumsuz çıkarım**: **can't be**.

Diğer şıklar: **A** yasak anlamı verir / **C** gereksizlik anlamı verir / **D** şimdiki çıkarım gerekir / **E** geçmişe dair olasılık.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Modals konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Modals konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$Visitors ---- touch the paintings, but they ---- take photos without a flash.$q$, array[$o$mustn't / can$o$, $o$needn't / can$o$, $o$mustn't / must$o$, $o$don't have to / should$o$, $o$may not / have to$o$], 0, $e$1. Yasak **mustn't** ile söylenir: **mustn't**.
2. İzin **can** ile söylenir: **can**.

Diğer şıklar: **B** yasak anlamı mustn't ile söylenir / **C** izin can ile söylenir / **D** yasak anlamı mustn't ile söylenir ve izin can ile söylenir / **E** yasak anlamı mustn't ile söylenir ve izin can ile söylenir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$My grandmother ---- speak four languages when she was young, but now she ---- only understand a few words of them.$q$, array[$o$can / can$o$, $o$could / could$o$, $o$must / must$o$, $o$should / will$o$, $o$could / can$o$], 4, $e$1. Geçmişteki yetenek **could** ile söylenir: **could**.
2. **Now** ile şimdiki yetenek **can** ile söylenir: **can**.

Diğer şıklar: **A** geçmişteki yetenek could ile söylenir / **B** now şimdiki yetenek can ile söylenir / **C** geçmişteki yetenek could ile söylenir ve now şimdiki yetenek can ile söylenir / **D** geçmişteki yetenek could ile söylenir ve now şimdiki yetenek can ile söylenir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$You ---- worry about the dinner, because we ---- eat out if you are too tired to cook.$q$, array[$o$mustn't / can$o$, $o$needn't / can$o$, $o$needn't / must$o$, $o$can't / need$o$, $o$shouldn't / have to$o$], 1, $e$1. Gerek olmaması **needn't** ile söylenir: **needn't**.
2. Seçenek **can** ile söylenir: **can**.

Diğer şıklar: **A** gerek olmaması needn't ile söylenir / **C** seçenek can ile söylenir / **D** gerek olmaması needn't ile söylenir ve seçenek can ile söylenir / **E** gerek olmaması needn't ile söylenir ve seçenek can ile söylenir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Excuse me, ---- you tell me where the station is? I think I ---- have taken the wrong bus.$q$, array[$o$must / may$o$, $o$could / would$o$, $o$should / shall$o$, $o$could / may$o$, $o$need / need$o$], 3, $e$1. Kibar rica **could you** ile söylenir: **could**.
2. Olasılık **may have + V3** ile söylenir: **may**.

Diğer şıklar: **A** kibar rica could ile söylenir / **B** olasılık may have ile söylenir / **C** kibar rica could ile söylenir ve olasılık may have ile söylenir / **E** kibar rica could ile söylenir ve olasılık may have ile söylenir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$You ---- be 18 to vote in this country, and you ---- register at least a month before the election.$q$, array[$o$can / have to$o$, $o$must / can$o$, $o$may / may$o$, $o$might / should have$o$, $o$must / have to$o$], 4, $e$1. Yasal zorunluluk **must** ile söylenir: **must**.
2. Dışsal zorunluluk **have to** ile söylenir: **have to**.

Diğer şıklar: **A** zorunluluk must ile söylenir / **B** zorunluluk have to ile söylenir / **C** zorunluluk must ile söylenir ve zorunluluk have to ile söylenir / **D** zorunluluk must ile söylenir ve zorunluluk have to ile söylenir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$He ---- be at least seventy by now, because he was already an old man when I was a child, but he ---- still work every day.$q$, array[$o$can't / can$o$, $o$must / must$o$, $o$must / can$o$, $o$might / should$o$, $o$needn't / need$o$], 2, $e$1. Güçlü çıkarım **must** ile söylenir: **must**.
2. Yetenek **can** ile söylenir: **can**.

Diğer şıklar: **A** güçlü çıkarım must ile söylenir / **B** yetenek can ile söylenir / **D** güçlü çıkarım must ile söylenir ve yetenek can ile söylenir / **E** güçlü çıkarım must ile söylenir ve yetenek can ile söylenir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The injured climber ---- have survived the night without a tent, but he did, which ---- have been a miracle.$q$, array[$o$mustn't / must$o$, $o$couldn't / must$o$, $o$couldn't / can't$o$, $o$needn't / needn't$o$, $o$shouldn't / shouldn't$o$], 1, $e$1. Beklenmeyen hayatta kalma için **couldn't have + V3** kullanılır: **couldn't**.
2. Güçlü çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** imkânsız çıkarım couldn't have ile söylenir / **C** olumlu çıkarım must have ile söylenir / **D** imkânsız çıkarım couldn't have ile söylenir ve olumlu çıkarım must have ile söylenir / **E** imkânsız çıkarım couldn't have ile söylenir ve olumlu çıkarım must have ile söylenir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$We ---- have taken the umbrellas because it didn't rain, but you ---- have brought a coat. It was freezing.$q$, array[$o$needn't / should$o$, $o$mustn't / should$o$, $o$needn't / needn't$o$, $o$can't / mustn't$o$, $o$shouldn't / can't$o$], 0, $e$1. Gereksiz eylem **needn't have + V3** ile söylenir: **needn't**.
2. Yapılması gereken eylem **should have + V3** ile söylenir: **should**.

Diğer şıklar: **B** gereksiz davranış needn't have ile söylenir / **C** geçmiş eleştirisi should have ile söylenir / **D** gereksiz davranış needn't have ile söylenir ve geçmiş eleştirisi should have ile söylenir / **E** gereksiz davranış needn't have ile söylenir ve geçmiş eleştirisi should have ile söylenir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I'm sorry, but I ---- come to the party tomorrow. I ---- finish a report that is due on Friday.$q$, array[$o$mustn't / have to$o$, $o$can't / can$o$, $o$can't / have to$o$, $o$shouldn't / may$o$, $o$needn't / might$o$], 2, $e$1. Katılamama **can't** ile söylenir: **can't**.
2. Dışsal zorunluluk **have to** ile söylenir: **have to**.

Diğer şıklar: **A** imkânsızlık can't ile söylenir / **B** zorunluluk have to ile söylenir / **D** imkânsızlık can't ile söylenir ve zorunluluk have to ile söylenir / **E** imkânsızlık can't ile söylenir ve zorunluluk have to ile söylenir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He is a very honest person, so he ---- have told a lie, and the manager ---- have misunderstood what he said.$q$, array[$o$mustn't / must$o$, $o$can't / can't$o$, $o$needn't / might not$o$, $o$shouldn't / needn't$o$, $o$can't / must$o$], 4, $e$1. Güçlü olumsuz çıkarım **can't have + V3** ile söylenir: **can't**.
2. Güçlü olumlu çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** imkânsız çıkarım can't have ile söylenir / **B** güçlü çıkarım must have ile söylenir / **C** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir / **D** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$When the exam results are announced, students ---- check them online, but they ---- call the school.$q$, array[$o$mustn't / needn't$o$, $o$can / may$o$, $o$shouldn't / must$o$, $o$can / needn't$o$, $o$can't / may$o$], 3, $e$1. Seçenek **can** ile söylenir: **can**.
2. Gerek olmaması **needn't** ile söylenir: **needn't**.

Diğer şıklar: **A** seçenek can ile söylenir / **B** gerek olmaması needn't ile söylenir / **C** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir / **E** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She looked so pale that I thought she ---- be ill, so I suggested that she ---- go home early.$q$, array[$o$had to / should$o$, $o$might / should$o$, $o$might / would$o$, $o$ought / could$o$, $o$shall / had to$o$], 1, $e$1. Olasılık **might** ile söylenir: **might**.
2. **Suggest that** sonrasında **should + V1** gelir: **should**.

Diğer şıklar: **A** olasılık might ile söylenir / **C** suggest that sonrası should + V1 gelir / **D** olasılık might ile söylenir ve suggest that sonrası should + V1 gelir / **E** olasılık might ile söylenir ve suggest that sonrası should + V1 gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The company ---- invest a large amount of money in advertising, otherwise it ---- lose its customers.$q$, array[$o$has to / will$o$, $o$needn't / will$o$, $o$has to / would$o$, $o$mustn't / could$o$, $o$can't / should$o$], 0, $e$1. Zorunluluk **has to** ile söylenir: **has to**.
2. Gerçekçi sonuç **will** ile söylenir: **will**.

Diğer şıklar: **B** zorunluluk has to ile söylenir / **C** gerçekçi sonuç will ile söylenir / **D** zorunluluk has to ile söylenir ve gerçekçi sonuç will ile söylenir / **E** zorunluluk has to ile söylenir ve gerçekçi sonuç will ile söylenir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$When I was at school, we ---- wear a uniform, but we ---- choose our own shoes.$q$, array[$o$must / could$o$, $o$had to / can$o$, $o$had to / could$o$, $o$should / must$o$, $o$may / should$o$], 2, $e$1. Geçmişteki zorunluluk **had to** ile söylenir: **had to**.
2. Geçmişteki izin **could** ile söylenir: **could**.

Diğer şıklar: **A** geçmiş zorunluluk had to ile söylenir / **B** geçmişte izin could ile söylenir / **D** geçmiş zorunluluk had to ile söylenir ve geçmişte izin could ile söylenir / **E** geçmiş zorunluluk had to ile söylenir ve geçmişte izin could ile söylenir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- you possibly lend me some money until Friday? I promise I ---- pay you back as soon as I get my salary.$q$, array[$o$Must / will$o$, $o$Could / might$o$, $o$Need / must$o$, $o$Could / will$o$, $o$Should / may$o$], 3, $e$1. Kibar rica **Could you** ile söylenir: **Could**.
2. Söz **will** ile söylenir: **will**.

Diğer şıklar: **A** kibar rica could you ile söylenir / **B** söz will ile söylenir / **C** kibar rica could you ile söylenir ve söz will ile söylenir / **E** kibar rica could you ile söylenir ve söz will ile söylenir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If you ---- the instructions carefully, you ---- the machine properly, and it would not have broken down.$q$, array[$o$followed / could have operated$o$, $o$had followed / could have operated$o$, $o$had followed / can operate$o$, $o$follow / could operate$o$, $o$would follow / may have operated$o$], 1, $e$1. **Üçüncü tip koşul**: **had followed / could have operated**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **C** geçmiş sonuç could have + V3 ister / **D** geçmiş koşul Past Perfect ister ve geçmiş sonuç could have + V3 ister / **E** if cümlesinde would olmaz ve geçmiş sonuç could have ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$You ---- have paid for the ticket. The film was shown free of charge in the park that night.$q$, array[$o$mustn't$o$, $o$can't$o$, $o$needn't$o$, $o$wouldn't$o$, $o$may not$o$], 2, $e$1. **Gereksiz yapılmış eylem**: **needn't have paid**.

Diğer şıklar: **A** yasak anlamı verir / **B** imkânsız çıkarım anlamı verir / **D** geçmişteki alışkanlık anlamı verir / **E** olasılık anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Had the pilot ignored the warning, the plane ---- crashed, and hundreds of passengers ---- killed.$q$, array[$o$will have / would have been$o$, $o$would have / will have been$o$, $o$would / would be$o$, $o$might / had been$o$, $o$would have / would have been$o$], 4, $e$1. **Had + özne + V3** geçmiş koşulu kurar: **would have crashed / would have been killed**.

Diğer şıklar: **A** Had inversion geçmiş gerçek dışılık would have ister / **B** geçmiş edilgen yapı would have been ister / **C** geçmiş sonuç would have ister ve geçmiş sonuç would have been ister / **D** anlam yönü zayıf ve sonuç cümlesinde would gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$You ---- the doctor's advice if you wanted to recover quickly, but you ignored it completely.$q$, array[$o$must have followed$o$, $o$can have followed$o$, $o$would follow$o$, $o$should have followed$o$, $o$needn't have followed$o$], 3, $e$1. **Yapılması gerekirdi ama yapılmadı**: **should have followed**.

Diğer şıklar: **A** çıkarım anlamı verir / **B** anlam bozulur / **C** gerçek dışı anlam / **E** gereksizlik anlamı verir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He looked so exhausted when he arrived that he ---- driven all night, but he insists that he stopped to rest twice.$q$, array[$o$might have$o$, $o$needn't have$o$, $o$ought to have$o$, $o$would have$o$, $o$can't have$o$], 0, $e$1. **Geçmişe dair olasılık**: **might have driven**.

Diğer şıklar: **B** gereksizlik anlamı verir / **C** eleştiri anlamı verir / **D** gerçek dışı anlam / **E** imkânsız çıkarım, yan cümle ile çelişmez ama anlam zayıf.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Modals konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Modals konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$Yesterday I ---- go to work because the office was closed, so I ---- stay at home all day.$q$, array[$o$mustn't / could$o$, $o$didn't have to / can$o$, $o$can't / must$o$, $o$shouldn't / may$o$, $o$didn't have to / could$o$], 4, $e$1. Geçmişte gerek olmaması **didn't have to** ile söylenir: **didn't have to**.
2. Geçmişte olanak **could** ile söylenir: **could**.

Diğer şıklar: **A** gerek olmaması didn't have to ile söylenir / **B** geçmişte olanak could ile söylenir / **C** gerek olmaması didn't have to ile söylenir ve geçmişte olanak could ile söylenir / **D** gerek olmaması didn't have to ile söylenir ve geçmişte olanak could ile söylenir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$---- I carry your bag? It looks heavy, and you ---- hurt your back if you lift it alone.$q$, array[$o$Shall / might$o$, $o$Must / might$o$, $o$Shall / must$o$, $o$Need / can$o$, $o$Would / need$o$], 0, $e$1. Teklif **Shall I** ile yapılır: **Shall**.
2. Olasılık **might** ile söylenir: **might**.

Diğer şıklar: **B** teklif Shall I ile yapılır / **C** olasılık might ile söylenir / **D** teklif Shall I ile yapılır ve olasılık might ile söylenir / **E** teklif Shall I ile yapılır ve olasılık might ile söylenir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$You ---- smoke in the hospital, and you ---- ask a nurse if you need help.$q$, array[$o$needn't / can$o$, $o$mustn't / can$o$, $o$mustn't / must$o$, $o$don't have to / should$o$, $o$may / have to$o$], 1, $e$1. Yasak **mustn't** ile söylenir: **mustn't**.
2. İzin **can** ile söylenir: **can**.

Diğer şıklar: **A** yasak mustn't ile söylenir / **C** izin can ile söylenir / **D** yasak mustn't ile söylenir ve izin can ile söylenir / **E** yasak mustn't ile söylenir ve izin can ile söylenir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$He ---- speak French fluently before he moved to Paris, but he ---- understand a little when people spoke slowly.$q$, array[$o$can't / could$o$, $o$couldn't / can$o$, $o$mustn't / must$o$, $o$shouldn't / may$o$, $o$couldn't / could$o$], 4, $e$1. Geçmişte yeteneksizlik **couldn't** ile söylenir: **couldn't**.
2. Geçmişte yetenek **could** ile söylenir: **could**.

Diğer şıklar: **A** geçmiş yeteneksizlik couldn't ile söylenir / **B** geçmiş yetenek could ile söylenir / **C** geçmiş yeteneksizlik couldn't ile söylenir ve geçmiş yetenek could ile söylenir / **D** geçmiş yeteneksizlik couldn't ile söylenir ve geçmiş yetenek could ile söylenir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Yesterday it rained heavily, so we ---- stay at home, but today the weather is fine, so we ---- go for a walk.$q$, array[$o$have to / can$o$, $o$had to / had to$o$, $o$had to / can$o$, $o$must / must$o$, $o$should / couldn't$o$], 2, $e$1. Geçmişteki zorunluluk **had to** ile söylenir: **had to**.
2. Şimdiki olanak **can** ile söylenir: **can**.

Diğer şıklar: **A** yesterday geçmiş zorunluluk had to ile söylenir / **B** today şimdiki olanak can ile söylenir / **D** yesterday geçmiş zorunluluk had to ile söylenir ve today şimdiki olanak can ile söylenir / **E** yesterday geçmiş zorunluluk had to ile söylenir ve today şimdiki olanak can ile söylenir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I ---- tell you the answer, but I'm afraid I'm not allowed to, so you ---- ask the teacher.$q$, array[$o$could / had better$o$, $o$must / had better$o$, $o$could / needn't$o$, $o$should / mustn't$o$, $o$would / can't$o$], 0, $e$1. Yapılabilecek ama yapılmayacak eylem **could** ile söylenir: **could**.
2. Güçlü öneri **had better** ile söylenir: **had better**.

Diğer şıklar: **B** imkânsızlık could ile söylenir / **C** öneri had better ile söylenir / **D** imkânsızlık could ile söylenir ve öneri had better ile söylenir / **E** imkânsızlık could ile söylenir ve öneri had better ile söylenir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The tickets are very expensive, but you ---- see the match on television, so you ---- spend so much money.$q$, array[$o$must / needn't$o$, $o$can / can't$o$, $o$should / mustn't$o$, $o$can / needn't$o$, $o$need / have to$o$], 3, $e$1. Seçenek **can** ile söylenir: **can**.
2. Gerek olmaması **needn't** ile söylenir: **needn't**.

Diğer şıklar: **A** seçenek can ile söylenir / **B** gerek olmaması needn't ile söylenir / **C** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir / **E** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He is very ambitious, and he ---- well become the youngest manager in the company, but he ---- be careful not to lose his friends.$q$, array[$o$must / should$o$, $o$may / can$o$, $o$can't / may$o$, $o$needn't / would$o$, $o$may / should$o$], 4, $e$1. Olasılık **may well** ile söylenir: **may**.
2. Tavsiye **should** ile söylenir: **should**.

Diğer şıklar: **A** olasılık may well ile söylenir / **B** tavsiye should ile söylenir / **C** olasılık may well ile söylenir ve tavsiye should ile söylenir / **D** olasılık may well ile söylenir ve tavsiye should ile söylenir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Excuse me, ---- I ask you a question? I ---- find the entrance, and I would be grateful if you showed me.$q$, array[$o$Must / can't$o$, $o$May / needn't$o$, $o$May / can't$o$, $o$Need / mustn't$o$, $o$Would / shouldn't$o$], 2, $e$1. **May I** izin istemek için kullanılır: **May**.
2. Yeteneksizlik **can't** ile söylenir: **can't**.

Diğer şıklar: **A** izin isteme May I ile yapılır / **B** bulamama yeteneksizliği can't ile söylenir / **D** izin isteme May I ile yapılır ve bulamama yeteneksizliği can't ile söylenir / **E** izin isteme May I ile yapılır ve bulamama yeteneksizliği can't ile söylenir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I didn't ---- to buy a ticket, because the museum was free, and I ---- have gone earlier if I had known.$q$, array[$o$need / would$o$, $o$must / would$o$, $o$need / will$o$, $o$should / can$o$, $o$ought / must$o$], 0, $e$1. **Didn't need to** gerek olmadığını söyler: **need**.
2. Gerçek dışı geçmiş **would have + V3** ile söylenir: **would**.

Diğer şıklar: **B** didn't need to kalıbı ister / **C** gerçek dışı geçmiş would have ile söylenir / **D** didn't need to kalıbı ister ve gerçek dışı geçmiş would have ile söylenir / **E** didn't need to kalıbı ister ve gerçek dışı geçmiş would have ile söylenir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The noise is terrible, and I ---- hardly think, so I wonder whether we ---- move to a quieter office.$q$, array[$o$must / could$o$, $o$can / must$o$, $o$should / need$o$, $o$can / could$o$, $o$need / would$o$], 3, $e$1. Zorlukla düşünebilmek **can hardly** ile söylenir: **can**.
2. Kibar öneri **could** ile söylenir: **could**.

Diğer şıklar: **A** güç anlamı can ile söylenir / **B** öneri could ile söylenir / **C** güç anlamı can ile söylenir ve öneri could ile söylenir / **E** güç anlamı can ile söylenir ve öneri could ile söylenir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$If the doctor ---- here, he would help, but he is away. You ---- call another doctor in the meantime.$q$, array[$o$is / should$o$, $o$were / should$o$, $o$were / would$o$, $o$will be / used to$o$, $o$had been / couldn't$o$], 1, $e$1. Gerçek dışı şimdi **were** ile söylenir: **were**.
2. Tavsiye **should** ile söylenir: **should**.

Diğer şıklar: **A** gerçek dışı şimdi were ile söylenir / **C** tavsiye should ile söylenir / **D** gerçek dışı şimdi were ile söylenir ve tavsiye should ile söylenir / **E** gerçek dışı şimdi were ile söylenir ve tavsiye should ile söylenir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$My uncle ---- to work in a factory, and he ---- take the bus every day, even in the snow.$q$, array[$o$would / would$o$, $o$used / might$o$, $o$might / had to$o$, $o$had / could$o$, $o$used / would$o$], 4, $e$1. **Used to** geçmiş durumu anlatır: **used**.
2. Geçmişteki alışkanlık **would** ile söylenir: **would**.

Diğer şıklar: **A** used to kalıbı ister / **B** geçmiş alışkanlık would ile söylenir / **C** used to kalıbı ister ve geçmiş alışkanlık would ile söylenir / **D** used to kalıbı ister ve geçmiş alışkanlık would ile söylenir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The door was locked from the inside, so the thief ---- have come in through it, and he ---- have used the window instead.$q$, array[$o$can't / must$o$, $o$must / must$o$, $o$can't / can't$o$, $o$might / needn't$o$, $o$should / shouldn't$o$], 0, $e$1. İmkânsız çıkarım **can't have + V3** ile söylenir: **can't**.
2. Güçlü çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **B** imkânsız çıkarım can't have ile söylenir / **C** güçlü çıkarım must have ile söylenir / **D** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir / **E** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$My brother ---- be a professional footballer one day if he keeps practising, but he ---- play in the national team yet.$q$, array[$o$must / hasn't been able to$o$, $o$could / doesn't$o$, $o$could / hasn't been able to$o$, $o$needn't / didn't$o$, $o$had better / won't have$o$], 2, $e$1. Gelecek olasılığı **could** ile söylenir: **could**.
2. **Yet** olumsuz cümlede Present Perfect ister: **hasn't been able to**.

Diğer şıklar: **A** olasılık could ile söylenir / **B** yet Present Perfect ister / **D** olasılık could ile söylenir ve yet Present Perfect ister / **E** olasılık could ile söylenir ve yet Present Perfect ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I'd rather you ---- anything about this to the press until the investigation is complete, and I'd prefer it if they ---- find out from us.$q$, array[$o$don't say / didn't$o$, $o$didn't say / didn't$o$, $o$didn't say / wouldn't$o$, $o$won't say / don't$o$, $o$hadn't said / hadn't$o$], 1, $e$1. **Would rather + özne + Past Simple**: **didn't say**. **Prefer it if + Past Simple**: **didn't**.

Diğer şıklar: **A** would rather you sonrası Past Simple ister / **C** prefer it if sonrasında Past Simple gelir / **D** would rather you sonrası Past Simple ister ve prefer it if sonrasında Past Simple gelir / **E** şimdiki tercih için Past Simple gelir ve prefer it if sonrasında Past Simple gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The government ---- the economic crisis if it had acted when the first warning signs appeared, but it chose to wait.$q$, array[$o$can avoid$o$, $o$could avoid$o$, $o$may avoid$o$, $o$could have avoided$o$, $o$must have avoided$o$], 3, $e$1. **Üçüncü tip koşul sonucu**: **could have avoided**.

Diğer şıklar: **A** geçmiş koşul could have ister / **B** geçmiş koşul could have ister / **C** geçmiş koşul could have ister / **E** çıkarım anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$They ---- the match easily, but a series of injuries in the second half changed everything.$q$, array[$o$must have won$o$, $o$can have won$o$, $o$should have won$o$, $o$would win$o$, $o$needn't have won$o$], 2, $e$1. **Beklenen ama gerçekleşmeyen**: **should have won**.

Diğer şıklar: **A** çıkarım anlamı, beklenti için should gerekir / **B** anlam bozulur / **D** geçmiş sonuç anlatılmıyor / **E** gereksizlik anlamı verir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Visitors ---- touch the exhibits, and children under twelve ---- be accompanied by an adult at all times.$q$, array[$o$needn't / must$o$, $o$must not / must$o$, $o$must not / needn't$o$, $o$may / may$o$, $o$can / can$o$], 1, $e$1. **Yasak**: **must not**. **Zorunluluk**: **must**.

Diğer şıklar: **A** zorunlu değil anlamı yasakla çelişir / **C** zorunlu değil anlamı kuralla çelişir / **D** izin anlamı verir ve izin anlamı verir / **E** izin anlamı verir ve izin anlamı verir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Since the minutes show that the issue was raised at three consecutive meetings, the board ---- have been aware of the risks.$q$, array[$o$can't$o$, $o$needn't$o$, $o$shouldn't$o$, $o$must$o$, $o$mustn't$o$], 3, $e$1. **Kanıta dayalı güçlü çıkarım**: **must have been aware**.

Diğer şıklar: **A** imkânsız çıkarım, kanıtla çelişir / **B** gereksizlik anlamı verir / **C** eleştiri anlamı verir / **E** yasak anlamı verir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Modals konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Noun Clauses konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I don't know ---- he lives, and I wonder ---- he will come to the party.$q$, array[$o$where does / whether$o$, $o$where / that$o$, $o$where / whether$o$, $o$what / what$o$, $o$when / which$o$], 2, $e$1. Dolaylı soruda **where** düz sırayla gelir: **where**.
2. **Wonder whether** kalıbı kullanılır: **whether**.

Diğer şıklar: **A** dolaylı soruda düz cümle sırası gelir / **B** wonder ile whether/if gelir / **D** yer sorusu where ister ve wonder ile whether/if gelir / **E** yer anlamı bozulur ve wonder ile whether/if gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She told me ---- she was tired, and she asked ---- I could drive her home.$q$, array[$o$that / if$o$, $o$what / if$o$, $o$that / that$o$, $o$which / what$o$, $o$who / how$o$], 0, $e$1. Bildirme cümlesinde **that** gelir: **that**.
2. Evet/hayır dolaylı sorusunda **if** gelir: **if**.

Diğer şıklar: **B** bildirme cümlesinde that gelir / **C** evet/hayır sorusu if/whether ister / **D** bildirme cümlesinde that gelir ve evet/hayır sorusu if/whether ister / **E** bildirme cümlesinde that gelir ve evet/hayır sorusu if/whether ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Could you tell me ---- the nearest bank is, and ---- time the bank opens?$q$, array[$o$where is / what$o$, $o$where / which$o$, $o$what is / how$o$, $o$where / what$o$, $o$which / when$o$], 3, $e$1. Kibar soruda düz cümle sırası kullanılır: **where**.
2. **What time** kalıbı kullanılır: **what**.

Diğer şıklar: **A** dolaylı soruda düz sıra gelir / **B** time önünde what gelir / **C** yer bilgisi where ister ve time önünde what gelir / **E** anlam bozulur ve time önünde what gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I'm not sure ---- the train leaves at six or at seven, and I don't know ---- we should wait for him.$q$, array[$o$that / if$o$, $o$whether / if$o$, $o$whether / that$o$, $o$what / what$o$, $o$which / which$o$], 1, $e$1. **Whether...or** kalıbı kullanılır: **whether**.
2. Evet/hayır dolaylı sorusunda **if** gelir: **if**.

Diğer şıklar: **A** or ile whether kullanılır / **C** evet/hayır sorusu if/whether ister / **D** or ile whether kullanılır ve evet/hayır sorusu if/whether ister / **E** or ile whether kullanılır ve evet/hayır sorusu if/whether ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- he said surprised everyone, and ---- he did next was even more shocking.$q$, array[$o$What / what$o$, $o$That / what$o$, $o$What / That$o$, $o$Which / Which$o$, $o$Whose / How$o$], 0, $e$1. Konu yan cümlesinde **what** kullanılır: **What**.
2. Aynı kurala göre: **what**.

Diğer şıklar: **B** what he said nesne değil konu gerektirir / **C** what he did eylemi ister / **D** konu yan cümlesi what ister ve konu yan cümlesi what ister / **E** anlam bozulur ve anlam bozulur.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$It is important ---- everyone should arrive on time, and it is clear ---- the meeting will be long.$q$, array[$o$what / that$o$, $o$that / what$o$, $o$which / which$o$, $o$if / whether$o$, $o$that / that$o$], 4, $e$1. **It is important that** kalıbı kullanılır: **that**.
2. **It is clear that** kalıbı kullanılır: **that**.

Diğer şıklar: **A** it is important sonrası that gelir / **B** it is clear sonrası that gelir / **C** it is important sonrası that gelir ve it is clear sonrası that gelir / **D** bu yapıda that gelir ve bu yapıda that gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Nobody knows ---- the fire started, and the police are trying to find out ---- is responsible.$q$, array[$o$what / who$o$, $o$how / who$o$, $o$how / whom$o$, $o$which / whose$o$, $o$whom / how$o$], 1, $e$1. Yöntem dolaylı sorusu **how** ile kurulur: **how**.
2. Kişi özne ise **who** gelir: **who**.

Diğer şıklar: **A** yöntem anlamı how ister / **C** özne olduğundan who gerekir / **D** yöntem anlamı how ister ve sahiplik anlamı yok / **E** yöntem anlamı how ister ve kişi sorusu who ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The question is ---- we can afford it, and the problem is ---- we should do next.$q$, array[$o$that / what$o$, $o$whether / whether$o$, $o$whether / what$o$, $o$what / where$o$, $o$which / when$o$], 2, $e$1. **The question is whether** kalıbı kullanılır: **whether**.
2. **What we should do** sonucu belirler: **what**.

Diğer şıklar: **A** question is whether kalıbı / **B** problem is what kalıbı / **D** question is whether kalıbı ve anlam bozulur / **E** question is whether kalıbı ve anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I have no idea ---- she is crying, and I can't understand ---- she doesn't tell us.$q$, array[$o$who / why$o$, $o$why / who$o$, $o$where / where$o$, $o$why / why$o$, $o$when / when$o$], 3, $e$1. Neden dolaylı soruda **why** kullanılır: **why**.
2. Aynı kurala göre: **why**.

Diğer şıklar: **A** neden anlamı bozulur / **B** neden anlamı bozulur / **C** neden anlamı bozulur ve neden anlamı bozulur / **E** neden anlamı bozulur ve neden anlamı bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The teacher asked the students ---- they had finished, and they said ---- they had not.$q$, array[$o$what / that$o$, $o$whether / whether$o$, $o$which / what$o$, $o$who / which$o$, $o$whether / that$o$], 4, $e$1. Evet/hayır dolaylı sorusunda **whether** gelir: **whether**.
2. Bildirme cümlesinde **that** gelir: **that**.

Diğer şıklar: **A** evet/hayır sorusu whether ister / **B** bildirme cümlesinde that gelir / **C** evet/hayır sorusu whether ister ve bildirme cümlesinde that gelir / **D** evet/hayır sorusu whether ister ve bildirme cümlesinde that gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$---- you pass the exam depends on how hard you work, and ---- hard you try is up to you.$q$, array[$o$Whether / how$o$, $o$What / how$o$, $o$Whether / whether$o$, $o$Which / what$o$, $o$Where / that$o$], 0, $e$1. **Whether** konu yan cümlesi başlatır: **Whether**.
2. **How hard** kalıbı kullanılır: **how**.

Diğer şıklar: **B** konu yan cümlesi whether ister / **C** how hard kalıbı gerekir / **D** konu yan cümlesi whether ister ve how hard kalıbı gerekir / **E** konu yan cümlesi whether ister ve how hard kalıbı gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I'll give the prize to ---- finishes first, and I'll invite ---- wants to come to the celebration.$q$, array[$o$whomever / whoever$o$, $o$whoever / whoever$o$, $o$whoever / whomever$o$, $o$whichever / whichever$o$, $o$whatever / whatever$o$], 1, $e$1. Özne görevli kişi için **whoever** kullanılır: **whoever**.
2. Aynı kurala göre: **whoever**.

Diğer şıklar: **A** özne olduğundan whoever gelir / **C** özne olduğundan whoever gelir / **D** kişi için whoever gelir ve kişi için whoever gelir / **E** kişi için whoever gelir ve kişi için whoever gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She didn't tell me ---- she was going, and I didn't ask her ---- she would be back.$q$, array[$o$where is / when$o$, $o$where / when will$o$, $o$what / what$o$, $o$which / who$o$, $o$where / when$o$], 4, $e$1. Dolaylı soruda **where** düz sırayla gelir: **where**.
2. Zaman için **when** gelir: **when**.

Diğer şıklar: **A** dolaylı soruda düz sıra gelir / **B** dolaylı soruda düz sıra gelir / **C** yer anlamı bozulur ve zaman sorusu when ister / **D** yer anlamı bozulur ve zaman sorusu when ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The fact ---- he lied to us is unacceptable, and ---- he did it again made us angry.$q$, array[$o$what / that$o$, $o$that / what$o$, $o$which / which$o$, $o$that / that$o$, $o$how / how$o$], 3, $e$1. **The fact that** kalıbı kullanılır: **that**.
2. Konu yan cümlesi **that** ile başlar: **that**.

Diğer şıklar: **A** the fact sonrası that gelir / **B** konu yan cümlesi that ister / **C** the fact sonrası that gelir ve konu yan cümlesi that ister / **E** the fact sonrası that gelir ve konu yan cümlesi that ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Nobody was sure ---- the old building would be demolished, but everyone agreed ---- it was dangerous.$q$, array[$o$that / that$o$, $o$whether / whether$o$, $o$whether / that$o$, $o$what / what$o$, $o$which / which$o$], 2, $e$1. Belirsizlik **whether** ile verilir: **whether**.
2. Bildirme cümlesinde **that** gelir: **that**.

Diğer şıklar: **A** whether sonrası seçenek bildirir, belirsizlik için whether gerekir / **B** agree sonrası that gelir / **D** belirsizlik için whether gerekir ve agree sonrası that gelir / **E** belirsizlik için whether gerekir ve agree sonrası that gelir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The success of the plan depends ---- the manager is willing to take the risk, but nobody can tell ---- he will decide.$q$, array[$o$on if / how$o$, $o$on whether / how$o$, $o$on whether / which$o$, $o$whether / that$o$, $o$if / which$o$], 1, $e$1. **Depend on whether** (edat sonrası if olmaz): **on whether**. Dolaylı soru: **how**.

Diğer şıklar: **A** edat sonrasında if kullanılmaz, whether gerekir / **C** how he will decide kalıbı / **D** depends sonrasında on gerekir ve how kalıbı / **E** depends on if kalıbı yanlış ve how kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The committee insisted that the report ---- revised before it was submitted, and it recommended that the author ---- more evidence.$q$, array[$o$is / provide$o$, $o$be / provides$o$, $o$was / provided$o$, $o$would be / would provide$o$, $o$be / provide$o$], 4, $e$1. **Insist/recommend that + yalın fiil**: **be / provide**.

Diğer şıklar: **A** insist that sonrasında yalın fiil gelir / **B** recommend that sonrasında yalın fiil gelir / **C** insist that sonrasında yalın fiil gelir ve recommend that sonrasında yalın fiil gelir / **D** insist that sonrasında yalın fiil gelir ve recommend that sonrasında yalın fiil gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It never occurred to me ---- the money I had lent him ---- be returned, so I was astonished when he handed it back.$q$, array[$o$that / would$o$, $o$what / would$o$, $o$that / will$o$, $o$which / had$o$, $o$whether / shall$o$], 0, $e$1. **It occurred to me that**: **that**. Geçmişteki gelecek: **would**.

Diğer şıklar: **B** occurred to me sonrasında that gelir / **C** geçmişteki gelecek would ister / **D** occurred to me sonrasında that gelir ve anlam bozulur / **E** bu yapıda that gelir ve geçmişteki gelecek would ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- the committee eventually decided was kept secret for months, which only increased the public's suspicion ---- something was being hidden.$q$, array[$o$That / that$o$, $o$What / which$o$, $o$What / that$o$, $o$Which / what$o$, $o$Whatever / whether$o$], 2, $e$1. **What** konu cümlesi, **suspicion that** özdeşlik cümlesi.

Diğer şıklar: **A** decided nesnesi eksik, what gerekir / **B** suspicion sonrasında that gelir / **D** sınırsız seçenek what ister ve suspicion sonrasında that gelir / **E** anlam yönü zayıf ve bu yapıda that gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$I can't remember exactly ---- she said, but I do remember ---- she looked when she said it.$q$, array[$o$that / how$o$, $o$what / what$o$, $o$which / that$o$, $o$what / how$o$, $o$whether / which$o$], 3, $e$1. **Dolaylı soru**: **what / how**.

Diğer şıklar: **A** wh-sorusu what ister / **B** how she looked kalıbı / **C** sınırsız seçenek what ister ve how kalıbı / **E** anlam bozulur ve how kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Noun Clauses konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Noun Clauses konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I don't know ---- bag this is, and I can't remember ---- I left it.$q$, array[$o$whose / where$o$, $o$who / where$o$, $o$whose / what$o$, $o$whom / who$o$, $o$that / whose$o$], 0, $e$1. Sahiplik dolaylı sorusu **whose** ile kurulur: **whose**.
2. Yer dolaylı sorusu **where** ile kurulur: **where**.

Diğer şıklar: **B** sahiplik anlamı whose ile verilir / **C** yer anlamı where ister / **D** sahiplik anlamı whose ile verilir ve yer anlamı where ister / **E** sahiplik anlamı whose ile verilir ve yer anlamı where ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He asked me ---- I wanted a coffee, and I told him ---- I did.$q$, array[$o$what / that$o$, $o$if / if$o$, $o$if / that$o$, $o$which / what$o$, $o$who / whether$o$], 2, $e$1. Evet/hayır dolaylı sorusunda **if** gelir: **if**.
2. Bildirme cümlesinde **that** gelir: **that**.

Diğer şıklar: **A** evet/hayır sorusu if ister / **B** bildirme cümlesinde that gelir / **D** evet/hayır sorusu if ister ve bildirme cümlesinde that gelir / **E** evet/hayır sorusu if ister ve bildirme cümlesinde that gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Can you tell me ---- the library opens, and ---- I can get a membership card?$q$, array[$o$what / where$o$, $o$when / where$o$, $o$when / whom$o$, $o$which / whose$o$, $o$who / which$o$], 1, $e$1. Zaman dolaylı sorusu **when** ile kurulur: **when**.
2. Yer dolaylı sorusu **where** ile kurulur: **where**.

Diğer şıklar: **A** zaman anlamı when ister / **C** yer anlamı where ister / **D** zaman anlamı when ister ve yer anlamı where ister / **E** zaman anlamı when ister ve yer anlamı where ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I wonder ---- she will accept the offer, and I hope ---- she will be happy.$q$, array[$o$what / that$o$, $o$whether / whether$o$, $o$which / what$o$, $o$who / which$o$, $o$whether / that$o$], 4, $e$1. **Wonder whether** kalıbı kullanılır: **whether**.
2. **Hope that** kalıbı kullanılır: **that**.

Diğer şıklar: **A** wonder ile whether/if gelir / **B** hope ile that gelir / **C** wonder ile whether/if gelir ve hope ile that gelir / **D** wonder ile whether/if gelir ve hope ile that gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$It is a pity ---- you can't come, and I'm sorry ---- you have to leave so early.$q$, array[$o$what / that$o$, $o$that / what$o$, $o$which / which$o$, $o$that / that$o$, $o$if / if$o$], 3, $e$1. **It is a pity that** kalıbı kullanılır: **that**.
2. **Sorry that** kalıbı kullanılır: **that**.

Diğer şıklar: **A** it is a pity sonrası that gelir / **B** sorry sonrası that gelir / **C** it is a pity sonrası that gelir ve sorry sonrası that gelir / **E** bu yapıda that gelir ve bu yapıda that gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- the exam will be about is still a secret, and no one can guess ---- will happen next.$q$, array[$o$That / what$o$, $o$What / that$o$, $o$What / what$o$, $o$Which / which$o$, $o$Whether / whether$o$], 2, $e$1. Konu yan cümlesi **What** ile başlar: **What**.
2. Aynı kurala göre: **what**.

Diğer şıklar: **A** what konu yan cümlesi başlatır / **B** what will happen konu yan cümlesi ister / **D** sınırsız seçenek what ister ve sınırsız seçenek what ister / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I want to know ---- you did last night, and why you didn't answer ---- phone.$q$, array[$o$what / my$o$, $o$which / my$o$, $o$what / me$o$, $o$that / mine$o$, $o$who / I$o$], 0, $e$1. Dolaylı soruda **what** kullanılır: **what**.
2. İsimden önce sahiplik sıfatı gelir: **my**.

Diğer şıklar: **B** sınırsız seçenek what ister / **C** sahiplik sıfatı gerekir / **D** wh-sorusu what ister ve isimden önce sahiplik sıfatı gerekir / **E** nesne cansızdır ve sahiplik sıfatı gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The guide explained ---- the castle had been built, and he told us ---- it had been used for.$q$, array[$o$what / what$o$, $o$when / when$o$, $o$that / where$o$, $o$when / what$o$, $o$who / who$o$], 3, $e$1. Zaman dolaylı sorusu **when** ile kurulur: **when**.
2. Kullanım amacı **what** ile sorulur: **what**.

Diğer şıklar: **A** zaman anlamı when ister / **B** nesne cansız, ne için what ister / **C** zaman anlamı when ister ve anlam bozulur / **E** zaman anlamı when ister ve nesne cansızdır.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$They haven't decided ---- to go on holiday this year, and they are arguing about ---- they should spend.$q$, array[$o$what / how much$o$, $o$where / how much$o$, $o$where / how many$o$, $o$which / how long$o$, $o$that / how often$o$], 1, $e$1. Yer dolaylı sorusu **where** ile kurulur: **where**.
2. Sayılamayan para için **how much** kullanılır: **how much**.

Diğer şıklar: **A** yer anlamı where ister / **C** para sayılamaz, how much gerekir / **D** yer anlamı where ister ve anlam bozulur / **E** yer anlamı where ister ve anlam bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$She is worried about ---- people will think of her, and she is anxious about ---- she looks.$q$, array[$o$that / how$o$, $o$what / what$o$, $o$which / that$o$, $o$whether / whether$o$, $o$what / how$o$], 4, $e$1. Dolaylı soruda **what** kullanılır: **what**.
2. Görünüş için **how** kullanılır: **how**.

Diğer şıklar: **A** wh-sorusu what ister / **B** görünüş için how kullanılır / **C** sınırsız seçenek what ister ve anlam bozulur / **D** anlam bozulur ve anlam bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$It doesn't matter ---- you do, as long as you do it carefully, and I'll support you in ---- you decide.$q$, array[$o$that / whatever$o$, $o$what / however$o$, $o$what / whatever$o$, $o$which / that$o$, $o$whether / what$o$], 2, $e$1. **It doesn't matter what** kalıbı kullanılır: **what**.
2. **Whatever** sınırsız seçenek bildirir: **whatever**.

Diğer şıklar: **A** konu yan cümlesi what ister / **B** zarftır, konu yan cümlesi başlatmaz / **D** sınırsız seçenek what ister ve anlam bozulur / **E** anlam bozulur ve in sonrası whatever gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The report suggests ---- the company has lost money, but it doesn't explain ----.$q$, array[$o$what / why$o$, $o$that / why$o$, $o$that / because$o$, $o$which / that$o$, $o$whether / which$o$], 1, $e$1. Bildirme cümlesinde **that** gelir: **that**.
2. Neden dolaylı sorusu **why** ile kurulur: **why**.

Diğer şıklar: **A** suggests sonrası that gelir / **C** explain sonrası why gelir / **D** suggests sonrası that gelir ve explain sonrası why gelir / **E** suggests sonrası that gelir ve explain sonrası why gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I'd like to know ---- the meeting begins, and ---- it will take.$q$, array[$o$what / how long$o$, $o$when / how often$o$, $o$which / how much$o$, $o$when / how long$o$, $o$who / how many$o$], 3, $e$1. Zaman dolaylı sorusu **when** ile kurulur: **when**.
2. Süre sorusu **how long** ile kurulur: **how long**.

Diğer şıklar: **A** zaman anlamı when ister / **B** süre sorusu how long ister / **C** zaman anlamı when ister ve süre sorusu how long ister / **E** zaman anlamı when ister ve süre sorusu how long ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The problem is ---- nobody knows how to fix the machine, and the worry is ---- it may break again.$q$, array[$o$what / that$o$, $o$that / what$o$, $o$that / that$o$, $o$which / which$o$, $o$whether / whether$o$], 2, $e$1. **The problem is that** kalıbı kullanılır: **that**.
2. Aynı kurala göre: **that**.

Diğer şıklar: **A** the problem is that kalıbı / **B** the worry is that kalıbı / **D** the problem is that kalıbı ve the worry is that kalıbı / **E** bu yapıda that gelir ve bu yapıda that gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Please remember ---- you promised to do, and tell me ---- you need my help.$q$, array[$o$what / if$o$, $o$that / if$o$, $o$what / what$o$, $o$which / that$o$, $o$whether / how$o$], 0, $e$1. Nesne yan cümlesi **what** ile başlar: **what**.
2. Evet/hayır sorusunda **if** gelir: **if**.

Diğer şıklar: **B** what wh-sorusu ister / **C** if evet/hayır sorusu ister / **D** what wh-sorusu ister ve evet/hayır sorusu if/whether ister / **E** anlam bozulur ve evet/hayır sorusu if/whether ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$She never explained ---- she had left the company so suddenly, and nobody dared to ask her.$q$, array[$o$what$o$, $o$when$o$, $o$whose$o$, $o$whom$o$, $o$why$o$], 4, $e$1. Dolaylı soru: **why**.

Diğer şıklar: **A** neden anlamı why ister / **B** anlam yönü zayıf / **C** sahiplik anlamı yok / **D** neden anlamı why ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The manager wanted to know ---- the new system would be introduced and ---- it would cost the company.$q$, array[$o$what / how much$o$, $o$when / how much$o$, $o$when / how many$o$, $o$which / what$o$, $o$who / how long$o$], 1, $e$1. **Dolaylı soru**: **when / how much**.

Diğer şıklar: **A** zaman anlamı when ister / **C** para sayılamaz, how much gerekir / **D** zaman anlamı when ister ve anlam bozulur / **E** zaman anlamı when ister ve süre anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- you decide to do, you must inform the authorities, because the law requires ---- every accident be reported within 24 hours.$q$, array[$o$Whatever / that$o$, $o$Whichever / that$o$, $o$Whatever / what$o$, $o$Whoever / which$o$, $o$However / whether$o$], 0, $e$1. **Whatever** konu cümlesi, **require that**: **Whatever / that**.

Diğer şıklar: **B** sınırsız seçenek whatever ister / **C** require sonrası that gelir / **D** eylem için whatever gerekir ve require sonrası that gelir / **E** zarftır ve bu yapıda that gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The prime minister's refusal to resign raised ---- she would be able to remain in office until the end of the year.$q$, array[$o$the question of if$o$, $o$the question that$o$, $o$the question what$o$, $o$the question of that$o$, $o$the question of whether$o$], 4, $e$1. **The question of whether**: edat sonrası if kullanılmaz.

Diğer şıklar: **A** edat sonrası whether gerekir / **B** özdeşlik cümlesi anlam bozar / **C** biçim yanlış / **D** edat sonrası that kullanılmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It remains a mystery ---- the thieves managed to enter the vault without setting off the alarm.$q$, array[$o$what$o$, $o$where$o$, $o$who$o$, $o$how$o$, $o$whose$o$], 3, $e$1. Dolaylı soru: **how**.

Diğer şıklar: **A** yöntem anlamı how ister / **B** yer anlamı verir / **C** anlam bozulur / **E** anlam bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Noun Clauses konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Noun Clauses konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I don't know ---- she is crying, and I'm not sure ---- I should ask her.$q$, array[$o$what / whether$o$, $o$why / that$o$, $o$who / what$o$, $o$why / whether$o$, $o$where / which$o$], 3, $e$1. Neden dolaylı sorusu **why** ile kurulur: **why**.
2. **Not sure whether** kalıbı kullanılır: **whether**.

Diğer şıklar: **A** neden anlamı why ister / **B** not sure ile whether/if gelir / **C** neden anlamı why ister ve not sure ile whether/if gelir / **E** neden anlamı why ister ve not sure ile whether/if gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Tell me ---- you are doing and ---- you are going.$q$, array[$o$that / where$o$, $o$what / what$o$, $o$what / where$o$, $o$which / that$o$, $o$whether / who$o$], 2, $e$1. Dolaylı soruda **what** kullanılır: **what**.
2. Yer dolaylı sorusu **where** ile kurulur: **where**.

Diğer şıklar: **A** wh-sorusu what ister / **B** yer anlamı where ister / **D** sınırsız seçenek what ister ve yer anlamı where ister / **E** anlam bozulur ve yer anlamı where ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She said ---- she was busy, and she asked ---- I could come back later.$q$, array[$o$what / if$o$, $o$that / if$o$, $o$that / that$o$, $o$which / what$o$, $o$who / how$o$], 1, $e$1. Bildirme cümlesinde **that** gelir: **that**.
2. Evet/hayır dolaylı sorusunda **if** gelir: **if**.

Diğer şıklar: **A** bildirme cümlesinde that gelir / **C** evet/hayır sorusu if/whether ister / **D** bildirme cümlesinde that gelir ve evet/hayır sorusu if/whether ister / **E** bildirme cümlesinde that gelir ve evet/hayır sorusu if/whether ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Do you know ---- this bag belongs to, and ---- it was left here?$q$, array[$o$what / why$o$, $o$who / what$o$, $o$which / who$o$, $o$who / why$o$, $o$whose / where$o$], 3, $e$1. Kişi dolaylı sorusu **who** ile kurulur: **who**.
2. Neden dolaylı sorusu **why** ile kurulur: **why**.

Diğer şıklar: **A** kişi sorusu who/whom ister / **B** neden anlamı why ister / **C** kişi sorusu who/whom ister ve neden anlamı why ister / **E** to sonrasında whom gerekir ve neden anlamı why ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$It is certain ---- he will win, and it is likely ---- he will break the record.$q$, array[$o$that / that$o$, $o$what / that$o$, $o$that / what$o$, $o$which / which$o$, $o$whether / whether$o$], 0, $e$1. **It is certain that** kalıbı kullanılır: **that**.
2. **It is likely that** kalıbı kullanılır: **that**.

Diğer şıklar: **B** it is certain sonrası that gelir / **C** it is likely sonrası that gelir / **D** it is certain sonrası that gelir ve it is likely sonrası that gelir / **E** bu yapıda that gelir ve bu yapıda that gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The police want to find out ---- the thief got into the house and ---- he took.$q$, array[$o$what / what$o$, $o$how / what$o$, $o$how / that$o$, $o$that / which$o$, $o$which / how$o$], 1, $e$1. Yöntem dolaylı sorusu **how** ile kurulur: **how**.
2. Nesne dolaylı sorusu **what** ile kurulur: **what**.

Diğer şıklar: **A** yöntem anlamı how ister / **C** nesne sorusu what ister / **D** yöntem anlamı how ister ve sınırsız seçenek what ister / **E** yöntem anlamı how ister ve nesne sorusu what ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- you are tired is obvious, but ---- you should rest is not so clear.$q$, array[$o$What / whether$o$, $o$That / that$o$, $o$That / whether$o$, $o$Which / what$o$, $o$Whose / which$o$], 2, $e$1. Olgu bildiren konu yan cümlesi **That** ile başlar: **That**.
2. Belirsizlik **whether** ile verilir: **whether**.

Diğer şıklar: **A** olgu bildirir, that gerekir / **B** belirsizlik için whether gerekir / **D** olgu bildirir, that gerekir ve belirsizlik için whether gerekir / **E** anlam bozulur ve belirsizlik için whether gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'll give ---- tickets to whoever arrives first, and ---- comes late will have to wait.$q$, array[$o$freely / whoever$o$, $o$free / whomever$o$, $o$freedom / whichever$o$, $o$frees / whatever$o$, $o$free / whoever$o$], 4, $e$1. İsimden önce **sıfat** gelir: **free**.
2. Özne görevli kişi için **whoever** kullanılır: **whoever**.

Diğer şıklar: **A** ticket önünde sıfat gerekir / **B** özne olduğundan whoever gerekir / **C** isimdir ve kişi için whoever gerekir / **D** fiil biçimidir ve kişi için whoever gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He couldn't believe ---- he saw, and he wondered ---- anyone else had noticed.$q$, array[$o$what / whether$o$, $o$that / whether$o$, $o$what / that$o$, $o$which / what$o$, $o$who / who$o$], 0, $e$1. Nesne yan cümlesi **what** ile başlar: **what**.
2. **Wonder whether** kalıbı kullanılır: **whether**.

Diğer şıklar: **B** nesne yan cümlesi what ister / **C** wonder ile whether/if gelir / **D** sınırsız seçenek what ister ve wonder ile whether/if gelir / **E** cansız nesne için kullanılmaz ve wonder ile whether/if gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He answered ---- he was asked, and he explained ---- he had done it.$q$, array[$o$that / why$o$, $o$what / because$o$, $o$what / why$o$, $o$which / what$o$, $o$who / where$o$], 2, $e$1. Nesne yan cümlesi **what** ile başlar: **what**.
2. Neden dolaylı sorusu **why** ile kurulur: **why**.

Diğer şıklar: **A** nesne yan cümlesi what ister / **B** explain sonrası why gelir / **D** sınırsız seçenek what ister ve neden anlamı why ister / **E** cansız nesne için kullanılmaz ve neden anlamı why ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I can't decide ---- to buy the red dress or the blue one, so I'll take ---- is cheaper.$q$, array[$o$what / whichever$o$, $o$which / whatever$o$, $o$that / whoever$o$, $o$who / however$o$, $o$which / whichever$o$], 4, $e$1. Sınırlı seçenekte **which** kullanılır: **which**.
2. Sınırlı seçenekte **whichever** kullanılır: **whichever**.

Diğer şıklar: **A** iki seçenek which ister / **B** iki seçenek whichever ister / **C** iki seçenek which ister ve cansız nesne için kullanılmaz / **D** cansız nesne için kullanılmaz ve zarftır.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The news ---- the team had won the cup made everyone happy, and the rumour ---- he was leaving upset them.$q$, array[$o$that / that$o$, $o$what / that$o$, $o$that / what$o$, $o$which / which$o$, $o$whether / whether$o$], 0, $e$1. **The news that** özdeş yapıyı kurar: **that**.
2. **The rumour that** özdeş yapıyı kurar: **that**.

Diğer şıklar: **B** the news sonrası that gelir / **C** the rumour sonrası that gelir / **D** the news sonrası that gelir ve the rumour sonrası that gelir / **E** bu yapıda that gelir ve bu yapıda that gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She asked him ---- he had been, and he said he had been to the dentist ----.$q$, array[$o$what / yesterday$o$, $o$where / yesterday$o$, $o$where / tomorrow$o$, $o$who / next week$o$, $o$which / soon$o$], 1, $e$1. Yer dolaylı sorusu **where** ile kurulur: **where**.
2. Geçmiş zaman zarfı **yesterday** olur: **yesterday**.

Diğer şıklar: **A** yer anlamı where ister / **C** Past Perfect ile gelecek zaman olmaz / **D** yer anlamı where ister ve Past Perfect ile gelecek zaman olmaz / **E** yer anlamı where ister ve Past Perfect ile kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$I'm interested in ---- he is going to say, and I'm curious about ---- he will say it.$q$, array[$o$that / how$o$, $o$what / what$o$, $o$which / that$o$, $o$whether / whether$o$, $o$what / how$o$], 4, $e$1. Dolaylı soruda **what** kullanılır: **what**.
2. Yöntem dolaylı sorusu **how** ile kurulur: **how**.

Diğer şıklar: **A** in sonrası what gelir / **B** yöntem anlamı how ister / **C** in sonrası what gelir ve yöntem anlamı how ister / **D** anlam bozulur ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- really matters in the end is not how much money you earn, but ---- you treat the people around you.$q$, array[$o$That / how$o$, $o$What / whether$o$, $o$What / how$o$, $o$Which / what$o$, $o$Whether / that$o$], 2, $e$1. **What matters** ve **but how**: **What / how**.

Diğer şıklar: **A** konu cümlesi what ister / **B** but sonrasında how kalıbı / **D** sınırsız seçenek what ister ve but sonrasında how kalıbı / **E** anlam bozulur ve but sonrasında how kalıbı.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$I would be grateful if you could tell me ---- the nearest post office is.$q$, array[$o$where is$o$, $o$what$o$, $o$when$o$, $o$where$o$, $o$which$o$], 3, $e$1. Dolaylı soru düz sıra: **where**.

Diğer şıklar: **A** dolaylı soruda düz sıra gelir / **B** yer anlamı where ister / **C** yer anlamı where ister / **E** sınırsız seçenek what ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The fact ---- he had been away for months did not excuse his failure to inform us, and ---- he said in his defence only made matters worse.$q$, array[$o$that / what$o$, $o$which / what$o$, $o$that / that$o$, $o$what / which$o$, $o$whether / whether$o$], 0, $e$1. **The fact that**: **that**. Konu cümlesi: **what**.

Diğer şıklar: **B** the fact sonrasında that gelir / **C** konu cümlesi what ister / **D** the fact sonrasında that gelir ve sınırsız seçenek what ister / **E** özdeşlik cümlesi that ister ve anlam bozulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The organisers wondered ---- the speaker would be willing to return the following year.$q$, array[$o$that$o$, $o$whether$o$, $o$what$o$, $o$which$o$, $o$how$o$], 1, $e$1. **Wonder whether**: **whether**.

Diğer şıklar: **A** wonder sonrasında whether/if gelir / **C** wonder sonrasında whether/if gelir / **D** wonder sonrasında whether/if gelir / **E** evet/hayır sorusu whether ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He was dismissed not because he lacked ability but because ---- he had told the manager was found to be untrue.$q$, array[$o$that$o$, $o$which$o$, $o$whether$o$, $o$whichever$o$, $o$what$o$], 4, $e$1. **Because + what ... was untrue**: **what**.

Diğer şıklar: **A** konu cümlesi what ister / **B** sınırsız seçenek what ister / **C** anlam bozulur / **D** anlam yönü zayıf.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He is not the person ---- he used to be, and I don't recognise ---- he has become.$q$, array[$o$what / what$o$, $o$that / that$o$, $o$which / which$o$, $o$that / what$o$, $o$whose / who$o$], 3, $e$1. **The person that** kalıbı kullanılır: **that**.
2. Nesne yan cümlesi **what** ile başlar: **what**.

Diğer şıklar: **A** the person sonrası that gelir / **B** recognise sonrası what gelir / **C** insan için that gelir ve sınırsız seçenek what ister / **E** anlam bozulur ve cansız nesne için kullanılmaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Noun Clauses konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Participles konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The film was so ---- that the audience felt ---- by the end of it.$q$, array[$o$bored / bored$o$, $o$boring / bored$o$, $o$boring / boring$o$, $o$bore / bore$o$, $o$boredom / boredom$o$], 1, $e$1. Duygu yaratan şey **V-ing** alır: **boring**.
2. Duyguyu hisseden kişi **V-ed** alır: **bored**.

Diğer şıklar: **A** film nesnesi etkileyen için V-ing gerekir / **C** hisseden kişi için V-ed gerekir / **D** sıfat olarak kullanılmaz ve sıfat olarak kullanılmaz / **E** isim olur, sıfat gerekir ve isim olur, sıfat gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The ---- children were playing in the garden, and the ---- glass was lying on the floor.$q$, array[$o$laughing / broken$o$, $o$laughed / broken$o$, $o$laughing / breaking$o$, $o$laugh / break$o$, $o$to laugh / to break$o$], 0, $e$1. Etken anlam **V-ing** ile verilir: **laughing**.
2. Edilgen anlam **V-ed** ile verilir: **broken**.

Diğer şıklar: **B** etken anlam V-ing ile verilir / **C** edilgen anlam V-ed ile verilir / **D** sıfat işlevi yoktur ve sıfat işlevi yoktur / **E** sıfat olarak kullanılmaz ve sıfat olarak kullanılmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I was ---- by the news, but my parents were not ---- at all.$q$, array[$o$shocking / surprised$o$, $o$shocked / surprising$o$, $o$shock / surprise$o$, $o$shocked / surprised$o$, $o$shocks / surprises$o$], 3, $e$1. Duyguyu hisseden kişi **V-ed** alır: **shocked**.
2. Aynı kurala göre: **surprised**.

Diğer şıklar: **A** kişi duyguyu hissediyor, V-ed gerekir / **B** kişi duyguyu hissediyor, V-ed gerekir / **C** sıfat işlevi yoktur ve sıfat işlevi yoktur / **E** fiil biçimidir ve fiil biçimidir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The man ---- by the window is my uncle, and the book ---- on the table is his.$q$, array[$o$stood / lying$o$, $o$standing / lying$o$, $o$standing / lain$o$, $o$stand / lay$o$, $o$to stand / to lie$o$], 1, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **standing**.
2. Aynı yapı **lying** ile sürer: **lying**.

Diğer şıklar: **A** reduced relative etken anlam V-ing ister / **C** lying ile aynı anlam V-ing ister / **D** sıfat fiil işlevi yok ve geçişli fiil nesne ister / **E** sıfat fiil işlevi yok ve sıfat fiil işlevi yok.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- tired after the long walk, she went straight to bed without ---- dinner.$q$, array[$o$Felt / having$o$, $o$Feeling / to have$o$, $o$To feel / have$o$, $o$Being felt / had$o$, $o$Feeling / having$o$], 4, $e$1. Etken eş zamanlı durum **V-ing** ile verilir: **Feeling**.
2. **Without** sonrasında gerund gelir: **having**.

Diğer şıklar: **A** etken zaman anlamı V-ing ister / **B** without sonrasında gerund gelir / **C** amaç anlamı verir ve without sonrasında gerund gelir / **D** edilgen anlamı bozar ve without sonrasında gerund gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- the exam, the students left the hall quietly, and ---- the papers, the teacher put them in a bag.$q$, array[$o$Finished / collecting$o$, $o$Having finished / collected$o$, $o$To finish / being collected$o$, $o$Having finished / collecting$o$, $o$Being finished / to collect$o$], 3, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having finished**.
2. Etken eş zamanlı eylem **V-ing** ile verilir: **collecting**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** etken anlam V-ing ister / **C** amaç anlamı verir ve edilgen anlam eşleşmez / **E** edilgen anlam eşleşmez ve amaç anlamı verir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- in 1923, the university, ---- by hundreds of foreign students every year, is one of the oldest in the country.$q$, array[$o$Founded / attended$o$, $o$Founding / attended$o$, $o$Founded / attending$o$, $o$Having founded / attend$o$, $o$To found / to attend$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **Founded**.
2. Aynı kurala göre: **attended**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** edilgen anlam V-ed ister / **D** edilgen anlam V-ed ister ve edilgen anlam V-ed ister / **E** edilgen anlam V-ed ister ve edilgen anlam V-ed ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- the traffic, we decided to take the underground, and ---- the station, we realised we had left our tickets at home.$q$, array[$o$Seen / reaching$o$, $o$Seeing / Reached$o$, $o$Seeing / reaching$o$, $o$Be seeing / Be reached$o$, $o$To see / To reach$o$], 2, $e$1. Etken eş zamanlı eylem **V-ing** ile verilir: **Seeing**.
2. İstasyona varınca anlam **V-ing** ile verilir: **reaching**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **D** yapı bozulur ve yapı bozulur / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The package ---- last week has still not arrived, and the parcel ---- by the post office has been returned to the sender.$q$, array[$o$sending / delivered$o$, $o$sent / delivering$o$, $o$send / deliver$o$, $o$sent / delivered$o$, $o$to send / to deliver$o$], 3, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** alır: **sent**.
2. Aynı kurala göre: **delivered**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** edilgen anlam V-ed ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Not ---- what to do, he asked a friend for advice, and, ---- her suggestion, he applied for the job.$q$, array[$o$known / following$o$, $o$knowing / to follow$o$, $o$to know / followed$o$, $o$having known / follow$o$, $o$knowing / following$o$], 4, $e$1. Olumsuz participle clause **Not + V-ing** ile kurulur: **knowing**.
2. Etken eş zamanlı eylem **V-ing** ile verilir: **following**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** eş zamanlı eylem V-ing ister / **C** amaç anlamı verir ve etken anlam V-ing ister / **D** sıra vurgusu yok ve yapı bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$There were several people ---- for the bus, and a boy ---- a newspaper was standing next to them.$q$, array[$o$waited / reading$o$, $o$waiting / reading$o$, $o$waiting / read$o$, $o$wait / to read$o$, $o$to wait / reads$o$], 1, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **waiting**.
2. Aynı kurala göre: **reading**.

Diğer şıklar: **A** etken anlam V-ing ister / **C** etken anlam V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve fiil biçimidir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- his promise, he arrived at the party on time, and ---- his gift, he handed it to the host.$q$, array[$o$Kept / carrying$o$, $o$Keeping / Carried$o$, $o$Keeping / carrying$o$, $o$Having kept / Having carried$o$, $o$To keep / To carry$o$], 2, $e$1. Etken eş zamanlı eylem **V-ing** ile verilir: **Keeping**.
2. Aynı kurala göre: **carrying**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **D** sıra vurgusu yok ve sırayı bozar / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$We watched the sun ---- behind the mountains and the people ---- the village.$q$, array[$o$to set / leaving$o$, $o$setting / left$o$, $o$sets / to leave$o$, $o$setting / leaving$o$, $o$was set / leaves$o$], 3, $e$1. Algı fiilinden sonra süreç **V-ing** ile verilir: **setting**.
2. Aynı kurala göre: **leaving**.

Diğer şıklar: **A** algı fiilinden sonra to gelmez / **B** edilgen anlam gelir / **C** fiil biçimidir ve algı fiilinden sonra to gelmez / **E** algı fiilinden sonra çekimli fiil gelmez ve fiil biçimidir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The police found the stolen car ---- in a field, and the thieves were seen ---- away in a van.$q$, array[$o$abandoned / driving$o$, $o$abandoning / driving$o$, $o$abandoned / driven$o$, $o$abandon / drives$o$, $o$to abandon / drove$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **abandoned**.
2. Etken görülen eylem **V-ing** ile verilir: **driving**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** etken anlam V-ing ister / **D** nesne sonrası V-ed gerekir ve fiil biçimidir / **E** nesne sonrası V-ed gerekir ve edilgen yapıda çekimli fiil gelmez.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- a lot of money, the company was able to expand, and ---- the competition, it entered new markets.$q$, array[$o$Raised / facing$o$, $o$Having raised / Faced$o$, $o$Having raised / facing$o$, $o$Having been raised / Having faced$o$, $o$To raise / To face$o$], 2, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having raised**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **facing**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** etken anlam V-ing ister / **D** edilgen anlam eşleşmez ve sırayı bozar / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$---- clear instructions by the manager before the meeting, the new employees knew exactly what to do.$q$, array[$o$Having given$o$, $o$Giving$o$, $o$To be given$o$, $o$Gave$o$, $o$Having been given$o$], 4, $e$1. Özne çalışanlar talimatı **almış** olduğundan edilgen perfect participle gerekir: **Having been given**.

Diğer şıklar: **A** özne instructions veren değil, alan konumundadır / **B** etken anlam özneyle çelişir / **C** amaç anlamı verir / **D** çekimli fiil bağlaç olmadan gelmez.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Walking along the beach, ----.$q$, array[$o$we saw a dolphin leaping$o$, $o$a dolphin was seen by us$o$, $o$the sun began to set slowly$o$, $o$a strong wind suddenly started$o$, $o$the waves became larger$o$], 0, $e$1. **Participle clause** öznesi ana cümle öznesiyle aynı olmalıdır: **we saw a dolphin**.

Diğer şıklar: **B** zarf-fiil öznesi dolphin olamaz, özne yürüyen kişidir / **C** yürüyen kişi özne değildir / **D** yürüyen kişi özne değildir / **E** yürüyen kişi özne değildir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$With the final exam ---- next week, the students have very little time to relax.$q$, array[$o$approached$o$, $o$approaching$o$, $o$to approach$o$, $o$approach$o$, $o$having approached$o$], 1, $e$1. **With + nesne + V-ing**: **approaching**.

Diğer şıklar: **A** etken anlam V-ing ister / **C** with + nesne sonrasında to gelmez / **D** with + nesne + V-ing gerekir / **E** sıra anlamı bozar.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$With his hands ---- behind his back, the prisoner was led slowly into the courtroom.$q$, array[$o$tying$o$, $o$tie$o$, $o$to tie$o$, $o$having tied$o$, $o$tied$o$], 4, $e$1. **With + nesne + V3** edilgen anlam verir: **tied**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** with + nesne + V3 gerekir / **C** with + nesne sonrasında to gelmez / **D** edilgen anlam eşleşmez.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Having been left alone for hours, ----.$q$, array[$o$his mother became very worried$o$, $o$the neighbours heard a baby crying$o$, $o$the baby began to cry loudly$o$, $o$the door was locked from outside$o$, $o$the doctor arrived quite late$o$], 2, $e$1. Özne yalnız bırakılmış olan kişi olmalıdır: **the baby began to cry loudly**.

Diğer şıklar: **A** bebek yalnız bırakılan değil, anne öznedir / **B** yalnız bırakılan komşular değildir / **D** özne door yalnız bırakılmış değildir / **E** yalnız bırakılan doktor değildir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Participles konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Participles konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$We had our house ---- last month, and we are going to have the garden ---- next week.$q$, array[$o$paint / redesigned$o$, $o$painted / redesign$o$, $o$painting / redesigning$o$, $o$to paint / to redesign$o$, $o$painted / redesigned$o$], 4, $e$1. **Have + nesne + V3** yaptırma anlamı verir: **painted**.
2. Aynı kurala göre: **redesigned**.

Diğer şıklar: **A** have + nesne + V3 ister / **B** have + nesne + V3 ister / **C** have + nesne + V3 ister ve have + nesne + V3 ister / **D** have + nesne + V3 ister ve have + nesne + V3 ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The ---- story kept the children awake, and the ---- children asked for another one.$q$, array[$o$excited / excited$o$, $o$exciting / exciting$o$, $o$exciting / excited$o$, $o$excite / excite$o$, $o$excitement / excitement$o$], 2, $e$1. Duygu yaratan şey **V-ing** alır: **exciting**.
2. Duyguyu hisseden kişi **V-ed** alır: **excited**.

Diğer şıklar: **A** hikaye heyecan veren, V-ing gerekir / **B** heyecanlanan çocuklar, V-ed gerekir / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** isimdir ve isimdir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She spent the whole evening ---- her homework, and then she wasted an hour ---- videos.$q$, array[$o$to do / watching$o$, $o$doing / watching$o$, $o$doing / to watch$o$, $o$do / watch$o$, $o$done / watched$o$], 1, $e$1. **Spend + zaman** sonrasında V-ing gelir: **doing**.
2. **Waste + zaman** sonrasında V-ing gelir: **watching**.

Diğer şıklar: **A** spend + zaman sonrasında V-ing gelir / **C** waste + zaman sonrasında V-ing gelir / **D** spend + zaman sonrasında V-ing gelir ve waste + zaman sonrasında V-ing gelir / **E** spend + zaman sonrasında V-ing gelir ve waste + zaman sonrasında V-ing gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I saw the thief ---- over the fence and ---- into the next garden.$q$, array[$o$climbing / jumping$o$, $o$climbed / jumping$o$, $o$climbing / jumped$o$, $o$to climb / to jump$o$, $o$climbs / jumps$o$], 0, $e$1. Algı fiili + nesne sonrasında **V-ing** gelir: **climbing**.
2. Aynı kurala göre: **jumping**.

Diğer şıklar: **B** algı fiili + nesne + V-ing ister / **C** algı fiili + nesne + V-ing ister / **D** algı fiili sonrası to gelmez ve algı fiili sonrası to gelmez / **E** fiil biçimidir ve fiil biçimidir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$The police caught the boy ---- a car, and the owner found his car ----.$q$, array[$o$steal / damaged$o$, $o$stealing / damaging$o$, $o$stealing / damaged$o$, $o$stolen / damage$o$, $o$to steal / to damage$o$], 2, $e$1. **Catch + nesne** sonrasında **V-ing** gelir: **stealing**.
2. **Find + nesne** sonrasında edilgen anlam **V-ed** ile verilir: **damaged**.

Diğer şıklar: **A** catch + nesne + V-ing ister / **B** edilgen anlam V-ed ister / **D** etken anlam V-ing ister ve edilgen anlam V-ed ister / **E** catch + nesne sonrası to gelmez ve edilgen anlam V-ed ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- the book twice, I still couldn't understand the ending, and ---- the same problem, my friend asked me for help.$q$, array[$o$Read / having$o$, $o$Having read / having$o$, $o$Having read / had$o$, $o$To read / Having$o$, $o$Having been read / To have$o$], 1, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having read**.
2. Aynı özne durumu **Having** ile sürer: **having**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **C** having ile devam eder / **D** amaç anlamı verir ve perfect participle gerekmez / **E** edilgen anlam eşleşmez ve amaç anlamı verir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$---- all the evidence, the jury found him guilty, and the judge, ---- by the decision, sentenced him to ten years.$q$, array[$o$Consider / convinced$o$, $o$Having considered / convincing$o$, $o$Considered / convince$o$, $o$Having considered / convinced$o$, $o$To consider / to convince$o$], 3, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having considered**.
2. Edilgen anlam **V-ed** ile verilir: **convinced**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** edilgen anlam V-ed ister / **C** etken anlam gerekir ve edilgen anlam V-ed ister / **E** amaç anlamı verir ve edilgen anlam V-ed ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The company, ---- by two brothers, now employs over 2,000 people, and the products ---- in its factories are exported to 40 countries.$q$, array[$o$founded / made$o$, $o$founding / made$o$, $o$founded / making$o$, $o$having founded / make$o$, $o$to found / to make$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **founded**.
2. Aynı kurala göre: **made**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** edilgen anlam V-ed ister / **D** edilgen anlam V-ed ister ve sıfat işlevi yok / **E** edilgen anlam V-ed ister ve edilgen anlam V-ed ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Our teacher, ---- in the next room, asked us to stop talking, but the students, ---- themselves, took no notice.$q$, array[$o$sat / amusing$o$, $o$sitting / amused$o$, $o$seated / amuse$o$, $o$sit / to amuse$o$, $o$sitting / amusing$o$], 4, $e$1. Etken eş zamanlı eylem **V-ing** ile verilir: **sitting**.
2. Etken anlam **V-ing** ile verilir: **amusing**.

Diğer şıklar: **A** etken kısaltılmış sıfat cümlesi V-ing ister / **B** etken anlam V-ing ister / **C** oturma eylemi etken anlam ister ve yanlış biçim / **D** fiil çekimli değil ve amaç anlamı verir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- his homework, he went out to play, and ---- the doorbell, she opened the door.$q$, array[$o$Doing / hearing$o$, $o$Having done / heard$o$, $o$Done / having heard$o$, $o$Having done / hearing$o$, $o$To do / to hear$o$], 3, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having done**.
2. Anlık algı **V-ing** ile verilir: **hearing**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** etken anlam V-ing ister / **C** etken anlam gerekir ve sırayı bozar / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$He stood there ---- the door, ---- to hear any sound inside, but nothing could be heard.$q$, array[$o$held / trying$o$, $o$holding / trying$o$, $o$holding / tried$o$, $o$to hold / to try$o$, $o$holds / tries$o$], 1, $e$1. Eş zamanlı etken eylem **V-ing** ile verilir: **holding**.
2. Aynı kurala göre: **trying**.

Diğer şıklar: **A** etken anlam V-ing ister / **C** etken anlam V-ing ister / **D** amaç anlamı verir ve amaç anlamı verir / **E** fiil biçimidir ve fiil biçimidir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- the instructions carefully, the technician connected the cables, and ---- the screen, he switched the machine on.$q$, array[$o$Followed / checking$o$, $o$Following / Checked$o$, $o$Being followed / Being checked$o$, $o$To follow / To check$o$, $o$Following / checking$o$], 4, $e$1. Etken eş zamanlı eylem **V-ing** ile verilir: **Following**.
2. Aynı kurala göre: **checking**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **C** edilgen anlam eşleşmez ve edilgen anlam eşleşmez / **D** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I found the instructions ---- and the results ----, so I asked for a refund.$q$, array[$o$confused / disappointing$o$, $o$confusing / disappointed$o$, $o$confuse / disappoint$o$, $o$confusing / disappointing$o$, $o$to confuse / to disappoint$o$], 3, $e$1. Duygu yaratan şey **V-ing** alır: **confusing**.
2. Aynı kurala göre: **disappointing**.

Diğer şıklar: **A** nesne duygu yaratıyor V-ing ister / **B** sonuç duygu yaratıyor V-ing ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$With the lights ---- off and the doors ----, the building looked completely deserted.$q$, array[$o$turned / locked$o$, $o$turning / locked$o$, $o$turned / locking$o$, $o$turn / lock$o$, $o$to turn / to lock$o$], 0, $e$1. **With + nesne + V3** edilgen anlam verir: **turned**.
2. Aynı kurala göre: **locked**.

Diğer şıklar: **B** with + nesne + V3 edilgen anlam ister / **C** with + nesne + V3 edilgen anlam ister / **D** with + nesne + V3 ister ve with + nesne + V3 ister / **E** with + nesne + V3 ister ve with + nesne + V3 ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Anyone ---- to join the team should contact the coach, and all the members ---- the course will receive a certificate.$q$, array[$o$wanted / completing$o$, $o$wanting / completed$o$, $o$wanting / completing$o$, $o$to want / to complete$o$, $o$wants / completes$o$], 2, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **wanting**.
2. Aynı kurala göre: **completing**.

Diğer şıklar: **A** etken kısaltılmış sıfat cümlesi V-ing ister / **B** etken kısaltılmış sıfat cümlesi V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$---- from a distance, the mountain looks like a sleeping giant.$q$, array[$o$Seeing$o$, $o$Having seen$o$, $o$To see$o$, $o$Seen$o$, $o$Saw$o$], 3, $e$1. Özne mountain **görülen** olduğundan edilgen participle gerekir: **Seen**.

Diğer şıklar: **A** etken anlam, özne mountain görmez / **B** özne mountain gördü anlamı verir / **C** amaç anlamı verir / **E** çekimli fiil bağlaçsız gelmez.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The company, ---- more than 2,000 people, has announced that it will close two of its factories next year.$q$, array[$o$employing$o$, $o$employed$o$, $o$employs$o$, $o$having been employed$o$, $o$to employ$o$], 0, $e$1. **Etken** eş zamanlı bilgi **V-ing** ile verilir: **employing**.

Diğer şıklar: **B** etken anlam V-ing ister / **C** çekimli fiil bağlaçsız gelmez / **D** edilgen anlam eşleşmez / **E** amaç anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Frightened by the sudden noise, ----.$q$, array[$o$the noise was heard by everyone$o$, $o$the stable was completely empty$o$, $o$the horse ran away across the field$o$, $o$the stable doors were locked$o$, $o$the field was covered in snow$o$], 2, $e$1. **Frightened** olan özne ana cümle öznesidir: **the horse**.

Diğer şıklar: **A** özne frightened olan canlı olmalıdır / **B** özne frightened olan canlı olmalıdır / **D** özne frightened olan canlı olmalıdır / **E** özne frightened olan canlı olmalıdır.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The students ---- the exam hall were asked to leave their bags and mobile phones at the entrance.$q$, array[$o$entered$o$, $o$entering$o$, $o$having entered$o$, $o$to enter$o$, $o$being entered$o$], 1, $e$1. **Etken kısaltılmış sıfat cümlesi**: **entering**.

Diğer şıklar: **A** etken kısaltılmış sıfat cümlesi V-ing ister / **C** sırayı bozar ve asıl anlamı kaydırır / **D** amaç anlamı verir / **E** edilgen anlam eşleşmez.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- as one of the greatest players of all time, he was invited to the opening ceremony of the stadium.$q$, array[$o$Regarding$o$, $o$Having regarded$o$, $o$To regard$o$, $o$Regards$o$, $o$Regarded$o$], 4, $e$1. Özne **sayılan** kişi olduğundan edilgen participle gerekir: **Regarded**.

Diğer şıklar: **A** özne etken olamaz / **B** etken anlam özneyle çelişir / **C** amaç anlamı verir / **D** çekimli fiil bağlaçsız gelmez.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Participles konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Participles konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The ---- water in the lake is dangerous, and the ---- engine of the boat made a terrible noise.$q$, array[$o$polluted / damaged$o$, $o$polluting / damaged$o$, $o$polluted / damaging$o$, $o$pollute / damage$o$, $o$to pollute / to damage$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **polluted**.
2. Aynı kurala göre: **damaged**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** edilgen anlam V-ed ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I'm ---- in history, and I find the museum ----.$q$, array[$o$interesting / fascinating$o$, $o$interested / fascinated$o$, $o$interest / fascinate$o$, $o$interests / fascination$o$, $o$interested / fascinating$o$], 4, $e$1. Duyguyu hisseden kişi **V-ed** alır: **interested**.
2. Duygu yaratan şey **V-ing** alır: **fascinating**.

Diğer şıklar: **A** kişi ilgiyi hisseder, V-ed gerekir / **B** nesne ilgi uyandırıyor, V-ing gerekir / **C** sıfat işlevi yok ve sıfat işlevi yok / **D** fiil ya da çoğul isimdir ve isimdir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$He sat on the sofa ---- a book, and his sister lay on the carpet ---- to music.$q$, array[$o$read / listening$o$, $o$reading / listening$o$, $o$reading / listened$o$, $o$to read / to listen$o$, $o$reads / listens$o$], 1, $e$1. Eş zamanlı eylem **V-ing** ile verilir: **reading**.
2. Aynı kurala göre: **listening**.

Diğer şıklar: **A** eş zamanlı eylem V-ing ister / **C** eş zamanlı eylem V-ing ister / **D** amaç anlamı verir ve amaç anlamı verir / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The letter ---- yesterday is on your desk, and the people ---- outside want to see you.$q$, array[$o$writing / waiting$o$, $o$written / waited$o$, $o$write / wait$o$, $o$written / waiting$o$, $o$to write / to wait$o$], 3, $e$1. Edilgen anlam **V-ed** ile verilir: **written**.
2. Etken anlam **V-ing** ile verilir: **waiting**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** etken anlam V-ing ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- my homework, I went to bed, and ---- by the long day, I fell asleep at once.$q$, array[$o$Having finished / exhausted$o$, $o$Finish / exhausted$o$, $o$Having finished / exhausting$o$, $o$Finished / to exhaust$o$, $o$To finish / exhaust$o$], 0, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having finished**.
2. Edilgen anlam **V-ed** ile verilir: **exhausted**.

Diğer şıklar: **B** önce biten eylem Having + V3 ister / **C** edilgen anlam V-ed ister / **D** etken anlam gerekir ve amaç anlamı verir / **E** amaç anlamı verir ve çekimli fiil bağlaçsız gelmez.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$---- his bag on the train, the tourist had to buy new clothes, and ---- the police, he waited for their help.$q$, array[$o$Left / informing$o$, $o$Having left / informed$o$, $o$To leave / having informed$o$, $o$Being left / to inform$o$, $o$Having left / informing$o$], 4, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having left**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **informing**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** etken anlam V-ing ister / **C** amaç anlamı verir ve sıra bozulur / **D** edilgen anlam eşleşmez ve amaç anlamı verir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The experiment ---- by the students was a success, and the results ---- in the journal attracted international attention.$q$, array[$o$conducting / published$o$, $o$conducted / publishing$o$, $o$conduct / publish$o$, $o$conducted / published$o$, $o$to conduct / to publish$o$], 3, $e$1. Edilgen anlam **V-ed** ile verilir: **conducted**.
2. Aynı kurala göre: **published**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** edilgen anlam V-ed ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$There was a ---- noise outside, and the ---- dog barked at the stranger.$q$, array[$o$frightened / frightened$o$, $o$frightening / frightening$o$, $o$frightening / frightened$o$, $o$fright / fright$o$, $o$frighten / frighten$o$], 2, $e$1. Korku uyandıran şey **V-ing** alır: **frightening**.
2. Korkan canlı **V-ed** alır: **frightened**.

Diğer şıklar: **A** gürültü korku uyandırıyor, V-ing gerekir / **B** köpek korku hisseden, V-ed gerekir / **D** isimdir ve isimdir / **E** sıfat işlevi yok ve sıfat işlevi yok.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$---- the last bus, we had to walk home, and ---- in the rain, we got completely wet.$q$, array[$o$Missing / caught$o$, $o$Having missed / caught$o$, $o$Having missed / catching$o$, $o$Missed / to catch$o$, $o$To miss / catches$o$], 1, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having missed**.
2. Edilgen anlam **V-ed** ile verilir: **caught**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **C** edilgen anlam V-ed ister / **D** etken anlam gerekir ve edilgen anlam V-ed ister / **E** amaç anlamı verir ve çekimli fiil gelmez.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The students ---- the exam hall were asked to show their cards, and the cards ---- by the guards had to be returned.$q$, array[$o$entering / collected$o$, $o$entered / collected$o$, $o$entering / collecting$o$, $o$to enter / collect$o$, $o$enters / to collect$o$], 0, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **entering**.
2. Edilgen anlam **V-ed** ile verilir: **collected**.

Diğer şıklar: **B** etken kısaltılmış sıfat cümlesi V-ing ister / **C** edilgen anlam V-ed ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** çekimli fiil gelmez ve sıfat işlevi yok.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$---- to the manager, the clerk explained the problem, and ---- his anger, the manager asked for a written report.$q$, array[$o$Talked / controlling$o$, $o$Talking / controlled$o$, $o$Having talked / having controlled$o$, $o$Talking / controlling$o$, $o$To talk / to control$o$], 3, $e$1. Eş zamanlı etken eylem **V-ing** ile verilir: **Talking**.
2. Aynı kurala göre: **controlling**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **C** eş zamanlı eylem V-ing ister ve sırayı bozar / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The workers ---- on the bridge were wearing helmets, and the equipment ---- for the job was brought from abroad.$q$, array[$o$worked / needed$o$, $o$working / needing$o$, $o$to work / need$o$, $o$works / to need$o$, $o$working / needed$o$], 4, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **working**.
2. Edilgen anlam **V-ed** ile verilir: **needed**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** edilgen anlam V-ed ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **D** çekimli fiil gelmez ve sıfat işlevi yok.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The room was full of people ---- loudly, and the music ---- from the speakers was too loud to bear.$q$, array[$o$talked / coming$o$, $o$talking / coming$o$, $o$talking / come$o$, $o$to talk / to come$o$, $o$talks / comes$o$], 1, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **talking**.
2. Aynı kurala göre: **coming**.

Diğer şıklar: **A** etken anlam V-ing ister / **C** etken kısaltılmış sıfat cümlesi V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$A man ---- Tom was waiting at the door, and the girl ---- next to him smiled at us.$q$, array[$o$naming / standing$o$, $o$named / stood$o$, $o$named / standing$o$, $o$name / to stand$o$, $o$to name / stands$o$], 2, $e$1. Edilgen anlam **named** ile verilir: **named**.
2. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **standing**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** etken anlam V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** sıfat işlevi yok ve çekimli fiil gelmez.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The little boy sat ---- in the corner, ---- his toys, until his mother came back.$q$, array[$o$crying / holding$o$, $o$cried / holding$o$, $o$crying / held$o$, $o$cry / hold$o$, $o$to cry / to hold$o$], 0, $e$1. Eş zamanlı etken eylem **V-ing** ile verilir: **crying**.
2. Aynı kurala göre: **holding**.

Diğer şıklar: **B** etken anlam V-ing ister / **C** etken anlam V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Weather ----, the open-air concert will take place on Saturday evening as planned.$q$, array[$o$permitted$o$, $o$to permit$o$, $o$permits$o$, $o$having permitted$o$, $o$permitting$o$], 4, $e$1. **Weather permitting** kalıp ifadedir: **permitting**.

Diğer şıklar: **A** absolute yapıda etken V-ing gerekir / **B** amaç anlamı verir / **C** çekimli fiil bağlaçsız gelmez / **D** sıra anlamı bozar.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Not ---- anyone in the city, the tourists decided to ask a policeman for directions.$q$, array[$o$known$o$, $o$to know$o$, $o$knowing$o$, $o$having been known$o$, $o$know$o$], 2, $e$1. **Not + V-ing** olumsuz participle clause: **knowing**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** amaç anlamı verir / **D** edilgen anlam eşleşmez / **E** çekimli fiil olmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Having ---- the report three times, the editor was finally satisfied that no mistakes remained.$q$, array[$o$revising$o$, $o$revise$o$, $o$to revise$o$, $o$revised$o$, $o$been revised$o$], 3, $e$1. **Having + V3**: **revised**.

Diğer şıklar: **A** having sonrası V3 gelir / **B** having sonrası V3 gelir / **C** having sonrası V3 gelir / **E** edilgen anlam eşleşmez.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The children, ---- by their parents to behave properly, sat quietly through the whole ceremony.$q$, array[$o$telling$o$, $o$told$o$, $o$to tell$o$, $o$having told$o$, $o$tells$o$], 1, $e$1. **Edilgen** anlam **V-ed** ile verilir: **told**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **C** amaç anlamı verir / **D** etken anlam özneyle çelişir / **E** çekimli fiil bağlaçsız gelmez.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Considering how ---- the project was, everyone was surprised that it was completed within the deadline.$q$, array[$o$complicating$o$, $o$complicate$o$, $o$complicated$o$, $o$complication$o$, $o$complicatedly$o$], 2, $e$1. **How + sıfat**: **complicated**.

Diğer şıklar: **A** nesne duygu yaratmaz, durum sıfatı complicated gerekir / **B** sıfat olarak kullanılmaz / **D** isimdir / **E** how sonrasında sıfat gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Participles konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Passive Voice konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (14, 'ydt-dil', null::integer, $q$The accident ---- on the motorway last night, and two people ---- seriously in the crash.$q$, array[$o$was happened / were injured$o$, $o$happened / injured$o$, $o$was happening / are injured$o$, $o$happened / were injured$o$, $o$has been happened / have injured$o$], 3, $e$1. **Happen** geçişsiz fiildir ve edilgen olmaz: **happened**.
2. Geçmiş edilgen yapı **were + V3** ile kurulur: **were injured**.

Diğer şıklar: **A** happen geçişsiz fiildir, edilgen olmaz / **B** two people edilgen yapı ister / **C** geçmişte bitmiş bir olay anlatılıyor ve last night geçmiştir / **E** happen edilgen olmaz ve two people edilgen yapı ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$It is thought that the manuscript ---- by a monk in the 12th century, and nobody knows who ---- the final pages.$q$, array[$o$wrote / added$o$, $o$was written / was added$o$, $o$has written / is adding$o$, $o$is written / had been added$o$, $o$was written / added$o$], 4, $e$1. Geçmiş edilgen yapı **was + V3** ile kurulur: **was written**.
2. **Who** özne olduğundan etken yapı gelir: **added**.

Diğer şıklar: **A** manuscript edilgen yapı ister / **B** who sorusunda özne etken yapı ister / **C** manuscript edilgen yapı ister ve geçmiş etken yapı gerekir / **D** 12th century geçmiştir ve who sorusunda özne etken yapı ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The new bridge is believed ---- by the end of next year, but several experts doubt whether it ---- on time given the delays so far.$q$, array[$o$to complete / will be finished$o$, $o$to be completed / will finish$o$, $o$to be completed / will be finished$o$, $o$completing / finishes$o$, $o$to have completed / has been finished$o$], 2, $e$1. **Is believed + to be + V3**: **to be completed**. Edilgen gelecek: **will be finished**.

Diğer şıklar: **A** nesne köprü edilgen anlam ister / **B** özne it etken değil edilgen yapı gerekir / **D** believed edilgen yapıda to-infinitive ister ve gelecek bağlamda edilgen yapı gerekir / **E** gelecek için perfect infinitive uygun değil ve gelecek zaman anlatılıyor.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The suspect, ---- at the scene by two witnesses, denies that he ever ---- the house.$q$, array[$o$seeing / entered$o$, $o$seen / entered$o$, $o$seen / had been entered$o$, $o$having seen / was entered$o$, $o$to see / enters$o$], 1, $e$1. **Edilgen participle**: **seen**. Özne etken: **entered**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **C** ever ile etken geçmiş gerekir / **D** edilgen anlam eşleşmez ve özne he etken yapı ister / **E** amaç anlamı verir ve geçmiş anlatım gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Only when the data ---- thoroughly ---- the researchers realise that the experiment had been flawed from the start.$q$, array[$o$had been analysed / did$o$, $o$had analysed / did$o$, $o$had been analysed / do$o$, $o$was analysing / had$o$, $o$has been analysed / were$o$], 0, $e$1. **Only when** sonrası yan cümle edilgen Past Perfect, ana cümle devrik yapı: **had been analysed / did**.

Diğer şıklar: **B** data edilgen yapı ister / **C** ana cümlede devrik yapı did ister / **D** data edilgen yapı ister ve ana cümlede devrik yapı did ister / **E** Only when sonrasında geçmiş anlatım gerekir ve ana cümlede devrik yapı did ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It ---- that the minister ---- the documents before they were made public, but he has denied any wrongdoing.$q$, array[$o$alleges / had altered$o$, $o$is alleged / alters$o$, $o$is alleging / has altered$o$, $o$has alleged / was altering$o$, $o$is alleged / had altered$o$], 4, $e$1. **It is alleged that**: **is alleged**. Önceki eylem: **had altered**.

Diğer şıklar: **A** it ile edilgen yapı gerekir / **B** önceki eylem Past Perfect ister / **C** it ile edilgen yapı gerekir ve made public geçmişte olmuştur / **D** it ile edilgen yapı gerekir ve tamamlanmış önceki eylem.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The children were made ---- in a straight line, and they were not allowed ---- until the bell rang.$q$, array[$o$stand / to speak$o$, $o$to stand / speaking$o$, $o$to stand / to speak$o$, $o$standing / speak$o$, $o$stood / spoke$o$], 2, $e$1. **Be made + to-infinitive**: **to stand**. **Be allowed + to-infinitive**: **to speak**.

Diğer şıklar: **A** make edilgen yapıda to-infinitive ister / **B** allowed sonrasında to-infinitive gelir / **D** make edilgen yapıda to-infinitive ister ve allowed sonrasında to gelir / **E** make edilgen yapıda to-infinitive ister ve allowed sonrasında to-infinitive gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Passive Voice konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Passive Voice konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$The patient's condition ---- carefully for the past forty-eight hours, and a decision on surgery ---- tomorrow.$q$, array[$o$is monitoring / will be taken$o$, $o$has been monitored / will take$o$, $o$has been monitored / will be taken$o$, $o$was monitored / takes$o$, $o$monitors / is taking$o$], 2, $e$1. **For the past forty-eight hours**: **has been monitored**. Gelecek edilgen: **will be taken**.

Diğer şıklar: **A** condition edilgen yapı ister / **B** decision edilgen yapı ister / **D** for the past ile Present Perfect gerekir ve gelecek zaman edilgen yapı ister / **E** condition edilgen yapı ister ve decision edilgen yapı ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$He denied ---- the document, but the handwriting proved it ---- by him.$q$, array[$o$to sign / to have been written$o$, $o$having signed / writing$o$, $o$signing / to write$o$, $o$being signed / written$o$, $o$having signed / to have been written$o$], 4, $e$1. **Deny + having + V3**: **having signed**. **Prove + nesne + to have been written**: **to have been written**.

Diğer şıklar: **A** deny sonrasında gerund gelir / **B** prove + nesne sonrasında to-infinitive gelir / **C** deny + geçmiş eylem perfect gerund tercih edilir, şık eşleşmesi bozulur ve edilgen anlam gerekir / **D** etken anlam gerekir ve prove sonrasında to gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The workers demanded that the dangerous machinery ---- immediately and that no one ---- to use it until it had been inspected.$q$, array[$o$is replaced / be allowed$o$, $o$be replaced / be allowed$o$, $o$be replaced / is allowed$o$, $o$was replaced / was allowed$o$, $o$would replace / allowed$o$], 1, $e$1. **Demand that + yalın fiil** (be + V3): **be replaced / be allowed**.

Diğer şıklar: **A** demand that sonrasında yalın fiil gelir / **C** demand that sonrasında yalın fiil gelir / **D** demand that sonrasında yalın fiil gelir ve demand that sonrasında yalın fiil gelir / **E** edilgen yapı gerekir ve edilgen yapı be allowed ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The painting is thought ---- in the sixteenth century, although it ---- as the work of a nineteenth-century artist until recently.$q$, array[$o$to paint / was regarded$o$, $o$to have been painted / regarded$o$, $o$to have been painted / was regarded$o$, $o$painting / had regarded$o$, $o$to be painted / regards$o$], 2, $e$1. **Is thought + to have been V3**: **to have been painted**. Geçmiş edilgen: **was regarded**.

Diğer şıklar: **A** edilgen anlam ister / **B** painting edilgen yapı ister / **D** thought edilgen yapıda to-infinitive ister ve edilgen yapı ister / **E** geçmiş zaman perfect infinitive ister ve until recently geçmiş zaman ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Several new schools ---- in the region over the past decade, but the quality of teaching ---- by many parents.$q$, array[$o$were built / is still criticised$o$, $o$have been built / still criticises$o$, $o$have built / is still criticising$o$, $o$have been built / is still criticised$o$, $o$built / has still criticised$o$], 3, $e$1. **Over the past decade**: **have been built**. Edilgen Present: **is still criticised**.

Diğer şıklar: **A** over the past decade Present Perfect ister / **B** teaching edilgen yapı ister / **C** schools edilgen yapı ister ve teaching edilgen yapı ister / **E** edilgen yapı ister ve teaching edilgen yapı ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Passive Voice konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Passive Voice konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (7, 'ydt-dil', null::integer, $q$The room ---- when we arrived, and the table ---- for dinner.$q$, array[$o$was cleaning / was being laid$o$, $o$had been cleaned / was being laid$o$, $o$had been cleaned / laid$o$, $o$cleaned / had laid$o$, $o$has been cleaned / has been laid$o$], 1, $e$1. Önce biten eylem Past Perfect Passive ile söylenir: **had been cleaned**.
2. Süren eylem Past Continuous Passive ile söylenir: **was being laid**.

Diğer şıklar: **A** when we arrived öncesini gösterir, Past Perfect gerekir / **C** table edilgen yapı ister / **D** room edilgen yapı ister ve table edilgen yapı ister / **E** geçmiş anlatım gerekir ve süren eylem anlatılıyor.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$He doesn't like ---- told what to do, and he refused ---- orders from his younger colleague.$q$, array[$o$to have been / to take$o$, $o$being / taking$o$, $o$be / take$o$, $o$been / taken$o$, $o$being / to take$o$], 4, $e$1. **Like** sonrasında edilgen gerund **being + V3** ile verilir: **being**.
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
  (12, 'ydt-dil', null::integer, $q$He was made ---- the room, and he was seen ---- to his friend in the corridor.$q$, array[$o$leave / talking$o$, $o$to leave / for talking$o$, $o$to leave / talking$o$, $o$leaving / talk$o$, $o$left / talked$o$], 2, $e$1. **Be made** sonrasında to-infinitive gelir: **to leave**.
2. **Be seen** sonrasında süreç **V-ing** ile verilir: **talking**.

Diğer şıklar: **A** make edilgen yapıda to-infinitive ister / **B** see edilgen yapıda süreç V-ing ile verilir / **D** make edilgen yapıda to-infinitive ister ve see edilgen yapıda yalın fiil kullanılmaz / **E** make edilgen yapıda to-infinitive ister ve see edilgen yapıda V-ing ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$All the passengers ---- to fasten their seat belts, and smoking ---- during the flight.$q$, array[$o$asked / is forbidden$o$, $o$were asked / forbids$o$, $o$asking / is forbidding$o$, $o$were asked / is forbidden$o$, $o$were asking / forbidden$o$], 3, $e$1. Edilgen yapı **were + V3** ile kurulur: **were asked**.
2. Tekil özne is ister: **is forbidden**.

Diğer şıklar: **A** passengers edilgen yapı ister / **B** smoking edilgen yapı ister / **C** passengers edilgen yapı ister ve smoking edilgen yapı ister / **E** passengers edilgen yapı ister ve çekimli yardımcı fiil gerekir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The orders ---- by the end of the week, and the customers ---- as soon as the goods are ready.$q$, array[$o$will deliver / will be informed$o$, $o$will have been delivered / will be informed$o$, $o$will have been delivered / will inform$o$, $o$are delivered / inform$o$, $o$have delivered / informed$o$], 1, $e$1. **By the end of the week** Future Perfect Passive ister: **will have been delivered**.
2. Gelecek edilgen yapı **will be + V3** ile kurulur: **will be informed**.

Diğer şıklar: **A** orders edilgen yapı ister / **C** customers edilgen yapı ister / **D** by the end of the week gelecek tamamlanmayı gösterir ve customers edilgen yapı ister / **E** orders edilgen yapı ister ve çekimli yardımcı fiil gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$It ---- that the minister ---- the report before it was published, but he has strongly denied it.$q$, array[$o$is alleged / read$o$, $o$alleges / read$o$, $o$is alleged / was reading$o$, $o$is alleging / has read$o$, $o$has alleged / had been read$o$], 0, $e$1. **It is alleged that...** kalıbı edilgendir: **is alleged**.
2. **Minister** özne olduğundan etken yapı gelir: **read**.

Diğer şıklar: **B** it ile edilgen yapı gerekir / **C** minister etken özne ister / **D** it ile edilgen yapı gerekir ve geçmişte bir olay anlatılıyor / **E** it ile edilgen yapı gerekir ve minister etken özne ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$By the time the firefighters reached the building, the residents ----, but a few cats and dogs ---- inside.$q$, array[$o$are evacuated / were still trapped$o$, $o$had been evacuated / still trapped$o$, $o$had been evacuated / were still trapped$o$, $o$have been evacuated / had still trapped$o$, $o$evacuated / are still trapped$o$], 2, $e$1. **By the time**: **had been evacuated**. Süren durum: **were still trapped**.

Diğer şıklar: **A** by the time ile Past Perfect gerekir / **B** çekimli fiil gerekir / **D** geçmiş anlatım gerekir ve edilgen anlam eşleşmez / **E** edilgen anlam gerekir ve geçmiş anlatım gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Nothing ---- about the matter since the committee ----, and everyone is wondering what has been decided.$q$, array[$o$has said / met$o$, $o$has been said / met$o$, $o$has been said / has met$o$, $o$is said / had met$o$, $o$was said / meets$o$], 1, $e$1. **Since**: **has been said**, başlangıç noktası Past Simple: **met**.

Diğer şıklar: **A** nothing edilgen anlam ister / **C** since sonrasında Past Simple gelir / **D** since ile Present Perfect gerekir ve since sonrasında Past Simple gelir / **E** since şimdiye uzanır ve geçmiş başlangıç noktası gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$You should have your eyes ---- regularly, and you ought to get the prescription ---- whenever your vision changes.$q$, array[$o$test / updated$o$, $o$tested / update$o$, $o$testing / updating$o$, $o$to test / to update$o$, $o$tested / updated$o$], 4, $e$1. **Have/get + nesne + V3** yaptırma yapısı: **tested / updated**.

Diğer şıklar: **A** have + nesne + V3 ister / **B** get + nesne + V3 ister / **C** have + nesne + V3 ister ve get + nesne + V3 ister / **D** have + nesne + V3 ister ve get + nesne + V3 ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The prisoners are known ---- ill-treated in the camp, yet no inquiry ---- so far.$q$, array[$o$to being / has been held$o$, $o$to have been / has held$o$, $o$to have been / has been held$o$, $o$being / was held$o$, $o$to have / is held$o$], 2, $e$1. **Are known + to have been + V3**: **to have been**. **So far**: **has been held**.

Diğer şıklar: **A** geçmişteki durum perfect infinitive ister / **B** inquiry edilgen yapı ister / **D** known sonrasında to-infinitive gelir ve so far Present Perfect ister / **E** edilgen anlam ister ve so far Present Perfect ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Little attention ---- to the warnings at the time, and consequently the disaster could not ----.$q$, array[$o$paid / have been avoided$o$, $o$was paid / avoid$o$, $o$has been paid / be avoided$o$, $o$was paid / have been avoided$o$, $o$is paid / have avoided$o$], 3, $e$1. **At the time**: **was paid**. Geçmiş modal edilgen: **could not have been avoided**.

Diğer şıklar: **A** attention edilgen yapı ister / **B** disaster edilgen yapı ister / **C** at the time geçmiştir ve geçmişe dair perfect gerekir / **E** at the time geçmiştir ve disaster edilgen yapı ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Passive Voice konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Prepositions konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The meeting starts ---- 9 o'clock ---- Monday morning.$q$, array[$o$in / on$o$, $o$at / on$o$, $o$at / in$o$, $o$on / at$o$, $o$by / by$o$], 1, $e$1. Saat için **at** kullanılır: **at**.
2. Belirli gün için **on** kullanılır: **on**.

Diğer şıklar: **A** saat için at gelir / **C** belirli gün için on gelir / **D** saat için at gelir ve belirli gün için on gelir / **E** saat için at gelir ve belirli gün için on gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She was born ---- 1995 ---- the summer.$q$, array[$o$on / in$o$, $o$in / on$o$, $o$at / at$o$, $o$by / by$o$, $o$in / in$o$], 4, $e$1. Yıl için **in** kullanılır: **in**.
2. Mevsim için **in** kullanılır: **in**.

Diğer şıklar: **A** yıl için in gelir / **B** mevsim için in gelir / **C** yıl için in gelir ve mevsim için in gelir / **D** yıl için in gelir ve mevsim için in gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$He is good ---- maths, but he is afraid ---- speaking in public.$q$, array[$o$in / of$o$, $o$at / at$o$, $o$at / of$o$, $o$on / in$o$, $o$for / from$o$], 2, $e$1. **Good at** kalıbı kullanılır: **at**.
2. **Afraid of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** good at kalıbı / **B** afraid of kalıbı / **D** good at kalıbı ve afraid of kalıbı / **E** good at kalıbı ve afraid of kalıbı.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I'm looking forward ---- seeing you, and I apologise ---- being late.$q$, array[$o$to / for$o$, $o$for / for$o$, $o$to / of$o$, $o$at / about$o$, $o$with / to$o$], 0, $e$1. **Look forward to** kalıbı kullanılır: **to**.
2. **Apologise for** kalıbı kullanılır: **for**.

Diğer şıklar: **B** look forward to kalıbı / **C** apologise for kalıbı / **D** look forward to kalıbı ve apologise for kalıbı / **E** look forward to kalıbı ve apologise for kalıbı.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$She lives ---- London, ---- 25 Baker Street.$q$, array[$o$at / at$o$, $o$in / in$o$, $o$on / on$o$, $o$to / to$o$, $o$in / at$o$], 4, $e$1. Şehir için **in** kullanılır: **in**.
2. Tam adres için **at** kullanılır: **at**.

Diğer şıklar: **A** şehir için in gelir / **B** tam adres için at gelir / **C** şehir için in gelir ve tam adres için at gelir / **D** şehir için in gelir ve tam adres için at gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$We arrived just ---- time to catch the film, and we got ---- the train just before it left.$q$, array[$o$at / on$o$, $o$in / in$o$, $o$in / on$o$, $o$by / at$o$, $o$with / to$o$], 2, $e$1. **Just in time** tam zamanında yetişmek anlamını verir: **in**.
2. **Get on the train** kalıbı kullanılır: **on**.

Diğer şıklar: **A** in time kalıbı / **B** get on the train kalıbı / **D** in time kalıbı ve get on the train kalıbı / **E** in time kalıbı ve get on the train kalıbı.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He suffers ---- a serious illness, and he depends ---- his family for help.$q$, array[$o$of / on$o$, $o$from / on$o$, $o$from / of$o$, $o$with / in$o$, $o$by / from$o$], 1, $e$1. **Suffer from** kalıbı kullanılır: **from**.
2. **Depend on** kalıbı kullanılır: **on**.

Diğer şıklar: **A** suffer from kalıbı / **C** depend on kalıbı / **D** suffer from kalıbı ve depend on kalıbı / **E** suffer from kalıbı ve depend on kalıbı.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The manager is responsible ---- the budget, and he is in charge ---- all the staff.$q$, array[$o$of / of$o$, $o$for / for$o$, $o$to / on$o$, $o$for / of$o$, $o$with / with$o$], 3, $e$1. **Responsible for** kalıbı kullanılır: **for**.
2. **In charge of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** responsible for kalıbı / **B** in charge of kalıbı / **C** responsible for kalıbı ve in charge of kalıbı / **E** responsible for kalıbı ve in charge of kalıbı.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$We drove ---- the tunnel and then walked ---- the bridge to reach the island.$q$, array[$o$through / across$o$, $o$across / across$o$, $o$through / through$o$, $o$over / into$o$, $o$along / to$o$], 0, $e$1. Tünel için **through** kullanılır: **through**.
2. Köprü üstünde karşıya geçiş için **across** kullanılır: **across**.

Diğer şıklar: **B** tünel için through gelir / **C** köprü üstünde karşıdan karşıya across gelir / **D** tünel için through gelir ve köprü üstünde across gelir / **E** tünel için through gelir ve köprü üstünde across gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He arrived ---- the airport ---- the morning and left again in the evening.$q$, array[$o$in / in$o$, $o$at / in$o$, $o$at / on$o$, $o$to / at$o$, $o$on / by$o$], 1, $e$1. **Arrive at** küçük yer için kullanılır: **at**.
2. **In the morning** kalıbı kullanılır: **in**.

Diğer şıklar: **A** havalimanına varmak at ister / **C** sabah için in the morning kalıbı / **D** arrive to kullanılmaz ve sabah için in the morning kalıbı / **E** arrive on kullanılmaz ve sabah için in the morning kalıbı.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The shop is open ---- Monday to Friday, and it stays open ---- midnight on Saturdays.$q$, array[$o$since / until$o$, $o$from / by$o$, $o$at / at$o$, $o$from / until$o$, $o$by / in$o$], 3, $e$1. **From...to** kalıbı kullanılır: **from**.
2. Devam eden süre **until** ile verilir: **until**.

Diğer şıklar: **A** geçmişten şimdiye uzanır / **B** until süre devam eder, by son zamanı bildirir / **C** from ... to kalıbı ve anlam bozulur / **E** from ... to kalıbı ve anlam bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He is married ---- a doctor, and he is very proud ---- his wife.$q$, array[$o$with / of$o$, $o$to / for$o$, $o$to / of$o$, $o$by / about$o$, $o$of / with$o$], 2, $e$1. **Married to** kalıbı kullanılır: **to**.
2. **Proud of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** married to kalıbı / **B** proud of kalıbı / **D** married to kalıbı ve proud of kalıbı / **E** married to kalıbı ve proud of kalıbı.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The report must be finished ---- Friday, so we can't wait ---- the results.$q$, array[$o$until / for$o$, $o$by / of$o$, $o$at / to$o$, $o$in / on$o$, $o$by / for$o$], 4, $e$1. Son zaman **by** ile verilir: **by**.
2. **Wait for** kalıbı kullanılır: **for**.

Diğer şıklar: **A** son zaman by ile verilir / **B** wait for kalıbı / **C** son zaman by ile verilir ve wait for kalıbı / **D** son zaman by ile verilir ve wait for kalıbı.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She is interested ---- art, and she often goes ---- exhibitions at the weekend.$q$, array[$o$at / to$o$, $o$in / at$o$, $o$on / in$o$, $o$in / to$o$, $o$for / for$o$], 3, $e$1. **Interested in** kalıbı kullanılır: **in**.
2. **Go to** kalıbı kullanılır: **to**.

Diğer şıklar: **A** interested in kalıbı / **B** go to kalıbı / **C** interested in kalıbı ve go to kalıbı / **E** interested in kalıbı ve go to kalıbı.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The committee will make its decision ---- accordance ---- the rules laid down in the constitution.$q$, array[$o$on / with$o$, $o$in / to$o$, $o$in / with$o$, $o$at / by$o$, $o$by / for$o$], 2, $e$1. **In accordance with**: **in / with**.

Diğer şıklar: **A** in accordance with kalıbı ister / **B** in accordance with kalıbı ister / **D** in accordance with kalıbı ister ve in accordance with kalıbı ister / **E** in accordance with kalıbı ister ve in accordance with kalıbı ister.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The new policy was introduced ---- a view ---- reducing the number of accidents on the motorway.$q$, array[$o$in / to$o$, $o$with / of$o$, $o$for / for$o$, $o$on / at$o$, $o$with / to$o$], 4, $e$1. **With a view to + gerund**: **with / to**.

Diğer şıklar: **A** with a view to kalıbı / **B** with a view to kalıbı / **C** with a view to kalıbı ve with a view to kalıbı / **D** with a view to kalıbı ve with a view to kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The accident, which resulted ---- the death of three people, was caused ---- a failure of the braking system.$q$, array[$o$in / by$o$, $o$from / by$o$, $o$in / with$o$, $o$with / from$o$, $o$to / to$o$], 0, $e$1. **Result in**, **caused by**: **in / by**.

Diğer şıklar: **B** result in sonuç, result from neden bildirir / **C** edilgen yapıda yapan şey by ile verilir / **D** result in kalıbı ve cause by kalıbı / **E** result in kalıbı ve cause by kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The firm refused to pay compensation, claiming that it could not be held responsible ---- damage that had occurred ---- its control.$q$, array[$o$of / beyond$o$, $o$for / beyond$o$, $o$for / out$o$, $o$to / outside of$o$, $o$with / above$o$], 1, $e$1. **Responsible for**, **beyond its control**.

Diğer şıklar: **A** responsible for kalıbı / **C** beyond its control kalıbı / **D** responsible to kişi ister ve biçim yanlış / **E** responsible for kalıbı ve beyond its control kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He was extremely proud ---- his son's achievements, but he never took any credit ---- them himself.$q$, array[$o$for / for$o$, $o$of / of$o$, $o$at / to$o$, $o$of / for$o$, $o$in / about$o$], 3, $e$1. **Proud of**, **take credit for**: **of / for**.

Diğer şıklar: **A** proud of kalıbı / **B** take credit for kalıbı / **C** proud of kalıbı ve take credit for kalıbı / **E** proud of kalıbı ve take credit for kalıbı.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He congratulated her ---- her success, and she thanked him ---- his kind words.$q$, array[$o$on / for$o$, $o$for / for$o$, $o$on / of$o$, $o$at / on$o$, $o$about / at$o$], 0, $e$1. **Congratulate on** kalıbı kullanılır: **on**.
2. **Thank for** kalıbı kullanılır: **for**.

Diğer şıklar: **B** congratulate on kalıbı / **C** thank for kalıbı / **D** congratulate on kalıbı ve thank for kalıbı / **E** congratulate on kalıbı ve thank for kalıbı.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Prepositions konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Prepositions konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I'll see you ---- Friday, and we'll leave ---- 6 o'clock.$q$, array[$o$in / at$o$, $o$on / in$o$, $o$at / on$o$, $o$by / by$o$, $o$on / at$o$], 4, $e$1. Gün için **on** kullanılır: **on**.
2. Saat için **at** kullanılır: **at**.

Diğer şıklar: **A** gün için on gelir / **B** saat için at gelir / **C** gün için on gelir ve saat için at gelir / **D** gün için on gelir ve saat için at gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$We moved here ---- 2010, and we've lived here ---- then.$q$, array[$o$on / since$o$, $o$in / for$o$, $o$in / since$o$, $o$at / from$o$, $o$by / during$o$], 2, $e$1. Yıl için **in** kullanılır: **in**.
2. Başlangıç noktası **since** ile verilir: **since**.

Diğer şıklar: **A** yıl için in gelir / **B** then ile since gelir / **D** yıl için in gelir ve then ile since gelir / **E** yıl için in gelir ve then ile since gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The book is ---- the table, and the keys are ---- the drawer.$q$, array[$o$on / in$o$, $o$in / in$o$, $o$on / on$o$, $o$at / at$o$, $o$by / by$o$], 0, $e$1. Yüzey için **on** kullanılır: **on**.
2. Kapalı yer için **in** kullanılır: **in**.

Diğer şıklar: **B** yüzey için on gelir / **C** kapalı yer için in gelir / **D** yüzey için on gelir ve kapalı yer için in gelir / **E** yüzey için on gelir ve kapalı yer için in gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$She is married ---- a lawyer and he works ---- Ankara.$q$, array[$o$with / in$o$, $o$to / at$o$, $o$by / on$o$, $o$of / to$o$, $o$to / in$o$], 4, $e$1. **Married to** kalıbı kullanılır: **to**.
2. Şehir için **in** kullanılır: **in**.

Diğer şıklar: **A** married to kalıbı / **B** şehir için in gelir / **C** married to kalıbı ve şehir için in gelir / **D** married to kalıbı ve şehir için in gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$He walked ---- the room and sat ---- the sofa.$q$, array[$o$on / on$o$, $o$into / at$o$, $o$on / by$o$, $o$into / on$o$, $o$from / with$o$], 3, $e$1. Hareket için **into** kullanılır: **into**.
2. Yüzey üstü için **on** kullanılır: **on**.

Diğer şıklar: **A** hareket için into gelir / **B** sofa üstünde oturmak on ister / **C** hareket için into gelir ve sofa üstünde oturmak on ister / **E** hareket için into gelir ve sofa üstünde oturmak on ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$She is jealous ---- her sister, but she is proud ---- her own talent.$q$, array[$o$for / of$o$, $o$of / of$o$, $o$of / for$o$, $o$with / with$o$, $o$at / at$o$], 1, $e$1. **Jealous of** kalıbı kullanılır: **of**.
2. **Proud of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** jealous of kalıbı / **C** proud of kalıbı / **D** jealous of kalıbı ve proud of kalıbı / **E** jealous of kalıbı ve proud of kalıbı.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ball flew ---- the fence and landed ---- the neighbour's garden.$q$, array[$o$over / in$o$, $o$at / in$o$, $o$over / at$o$, $o$by / by$o$, $o$with / to$o$], 0, $e$1. Üstünden aşmak **over** ile verilir: **over**.
2. Bahçenin içi **in** ile verilir: **in**.

Diğer şıklar: **B** çit üstünden aşmak over ister / **C** bahçenin içine düşmek in ister / **D** çit üstünden aşmak over ister ve bahçenin içine düşmek in ister / **E** çit üstünden aşmak over ister ve bahçenin içine düşmek in ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'm tired ---- waiting, and I'm fed up ---- his excuses.$q$, array[$o$from / with$o$, $o$of / for$o$, $o$at / from$o$, $o$for / at$o$, $o$of / with$o$], 4, $e$1. **Tired of** kalıbı kullanılır: **of**.
2. **Fed up with** kalıbı kullanılır: **with**.

Diğer şıklar: **A** tired of kalıbı / **B** fed up with kalıbı / **C** tired of kalıbı ve fed up with kalıbı / **D** tired of kalıbı ve fed up with kalıbı.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The result depends ---- many factors, and it differs ---- last year's.$q$, array[$o$of / from$o$, $o$on / to$o$, $o$on / from$o$, $o$in / with$o$, $o$from / of$o$], 2, $e$1. **Depend on** kalıbı kullanılır: **on**.
2. **Differ from** kalıbı kullanılır: **from**.

Diğer şıklar: **A** depend on kalıbı / **B** differ from kalıbı / **D** depend on kalıbı ve differ from kalıbı / **E** depend on kalıbı ve differ from kalıbı.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He insisted ---- paying the bill, and I agreed ---- him.$q$, array[$o$in / with$o$, $o$on / with$o$, $o$on / to$o$, $o$at / on$o$, $o$to / at$o$], 1, $e$1. **Insist on** kalıbı kullanılır: **on**.
2. **Agree with** kişi için kullanılır: **with**.

Diğer şıklar: **A** insist on kalıbı / **C** agree with someone kalıbı / **D** insist on kalıbı ve agree with someone kalıbı / **E** insist on kalıbı ve agree with someone kalıbı.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The prize was divided ---- the three winners, and each received a certificate ---- the director.$q$, array[$o$into / from$o$, $o$among / with$o$, $o$for / with$o$, $o$among / from$o$, $o$at / of$o$], 3, $e$1. Üç kişi arasında bölüşüm **among** ile verilir: **among**.
2. **Receive from** kalıbı kullanılır: **from**.

Diğer şıklar: **A** bölüşüm among ile verilir / **B** receive from kalıbı / **C** bölüşüm among ile verilir ve receive from kalıbı / **E** bölüşüm among ile verilir ve receive from kalıbı.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He has been working ---- this company ---- ten years.$q$, array[$o$to / for$o$, $o$at / since$o$, $o$at / for$o$, $o$on / during$o$, $o$by / from$o$], 2, $e$1. Çalışılan şirket için **at** kullanılır: **at**.
2. Süre **for** ile verilir: **for**.

Diğer şıklar: **A** çalışılan şirket için at gelir / **B** süre for ile verilir / **D** çalışılan şirket için at gelir ve süre for ile verilir / **E** çalışılan şirket için at gelir ve süre for ile verilir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She is famous ---- her paintings, and she is known ---- an artist all over the world.$q$, array[$o$of / as$o$, $o$for / to$o$, $o$in / for$o$, $o$with / like$o$, $o$for / as$o$], 4, $e$1. **Famous for** kalıbı kullanılır: **for**.
2. **Known as** rol bildirir: **as**.

Diğer şıklar: **A** famous for kalıbı / **B** known as kalıbı rol bildirir / **C** famous for kalıbı ve known for özellik bildirir, rol için as / **D** famous for kalıbı ve known as kalıbı.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$We discussed the plan ---- length and finally agreed ---- a date.$q$, array[$o$at / on$o$, $o$in / on$o$, $o$at / at$o$, $o$on / for$o$, $o$by / with$o$], 0, $e$1. **At length** uzun uzun anlamını verir: **at**.
2. **Agree on** konu için kullanılır: **on**.

Diğer şıklar: **B** at length kalıbı / **C** agree on a date kalıbı / **D** at length kalıbı ve agree on a date kalıbı / **E** at length kalıbı ve agree on a date kalıbı.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The temperature fell ---- zero ---- the night, and the lake froze.$q$, array[$o$at / during$o$, $o$to / while$o$, $o$by / for$o$, $o$to / during$o$, $o$under / since$o$], 3, $e$1. **Fall to** ulaşılan değeri belirtir: **to**.
2. **During** isim ile süreyi belirtir: **during**.

Diğer şıklar: **A** fall to kalıbı / **B** during isim ister / **C** fall to kalıbı ve durum süresi for ile verilir / **E** fall to kalıbı ve anlam bozulur.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Everything depends ---- whether the team can win the next match.$q$, array[$o$of$o$, $o$on$o$, $o$in$o$, $o$at$o$, $o$from$o$], 1, $e$1. **Depend on**: **on**.

Diğer şıklar: **A** depend on kalıbı / **C** depend on kalıbı / **D** depend on kalıbı / **E** depend on kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The manager has been accused ---- fraud, and he is said to have been involved ---- several other illegal transactions.$q$, array[$o$of / in$o$, $o$for / in$o$, $o$of / at$o$, $o$with / on$o$, $o$about / with$o$], 0, $e$1. **Accuse of**, **involved in**.

Diğer şıklar: **B** accuse of kalıbı / **C** involved in kalıbı / **D** accuse of kalıbı ve involved in kalıbı / **E** accuse of kalıbı ve involved in kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The company will provide assistance ---- a small fee to anyone who has lost important documents.$q$, array[$o$of$o$, $o$at$o$, $o$with$o$, $o$for$o$, $o$by$o$], 3, $e$1. **For a fee**: ücret karşılığı.

Diğer şıklar: **A** provide assistance for fee yerine in exchange for kalıbı / **B** anlam yönü zayıf / **C** anlam yönü zayıf / **E** anlam yönü zayıf.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The protesters were ---- favour of reform, but the government was firmly opposed ---- any change to the constitution.$q$, array[$o$on / to$o$, $o$in / to$o$, $o$in / with$o$, $o$for / at$o$, $o$at / from$o$], 1, $e$1. **In favour of**, **opposed to**.

Diğer şıklar: **A** in favour of kalıbı / **C** opposed to kalıbı / **D** in favour of kalıbı ve opposed to kalıbı / **E** in favour of kalıbı ve opposed to kalıbı.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- the event of a fire, all visitors must leave the building immediately.$q$, array[$o$On$o$, $o$At$o$, $o$In$o$, $o$For$o$, $o$By$o$], 2, $e$1. **In the event of**: **In**.

Diğer şıklar: **A** in the event of kalıbı / **B** in the event of kalıbı / **D** in the event of kalıbı / **E** in the event of kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Prepositions konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Prepositions konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$We have a meeting ---- Tuesday ---- 10 a.m.$q$, array[$o$in / at$o$, $o$on / in$o$, $o$on / at$o$, $o$at / on$o$, $o$by / by$o$], 2, $e$1. Gün için **on** kullanılır: **on**.
2. Saat için **at** kullanılır: **at**.

Diğer şıklar: **A** gün için on gelir / **B** saat için at gelir / **D** gün için on gelir ve saat için at gelir / **E** gün için on gelir ve saat için at gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The children are playing ---- the garden, ---- their mother.$q$, array[$o$on / with$o$, $o$in / with$o$, $o$in / by$o$, $o$at / to$o$, $o$to / of$o$], 1, $e$1. Kapalı alan için **in** kullanılır: **in**.
2. Birliktelik **with** ile verilir: **with**.

Diğer şıklar: **A** bahçe içi için in gelir / **C** with birlikte anlamı verir / **D** bahçe içi için in gelir ve with birlikte anlamı verir / **E** bahçe içi için in gelir ve with birlikte anlamı verir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She cut the bread ---- a knife and wrote the letter ---- a pen.$q$, array[$o$by / with$o$, $o$with / by$o$, $o$in / in$o$, $o$with / with$o$, $o$on / on$o$], 3, $e$1. Araç için **with** kullanılır: **with**.
2. Aynı kurala göre: **with**.

Diğer şıklar: **A** araç için with gelir / **B** araç için with gelir / **C** araç için with gelir ve araç için with gelir / **E** araç için with gelir ve araç için with gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$He travels ---- bus, but his wife goes ---- foot.$q$, array[$o$in / on$o$, $o$by / by$o$, $o$with / in$o$, $o$at / with$o$, $o$by / on$o$], 4, $e$1. Ulaşım aracı için **by** kullanılır: **by**.
2. **On foot** yürüyerek anlamını verir: **on**.

Diğer şıklar: **A** ulaşım aracı için by gelir / **B** on foot kalıbı / **C** ulaşım aracı için by gelir ve on foot kalıbı / **D** ulaşım aracı için by gelir ve on foot kalıbı.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I've known him ---- 2005, and we've been friends ---- ten years.$q$, array[$o$for / for$o$, $o$since / for$o$, $o$since / since$o$, $o$from / during$o$, $o$in / from$o$], 1, $e$1. Başlangıç noktası **since** ile verilir: **since**.
2. Süre **for** ile verilir: **for**.

Diğer şıklar: **A** başlangıç noktası since ile verilir / **C** süre for ile verilir / **D** başlangıç noktası since ile verilir ve süre for ile verilir / **E** başlangıç noktası since ile verilir ve süre for ile verilir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$He is very keen ---- football, and he is good ---- all kinds of sports.$q$, array[$o$on / at$o$, $o$in / at$o$, $o$on / in$o$, $o$of / on$o$, $o$for / with$o$], 0, $e$1. **Keen on** kalıbı kullanılır: **on**.
2. **Good at** kalıbı kullanılır: **at**.

Diğer şıklar: **B** keen on kalıbı / **C** good at kalıbı / **D** keen on kalıbı ve good at kalıbı / **E** keen on kalıbı ve good at kalıbı.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I'm grateful ---- your help, and I'm responsible ---- the delay.$q$, array[$o$of / for$o$, $o$for / of$o$, $o$to / to$o$, $o$for / for$o$, $o$with / with$o$], 3, $e$1. **Grateful for** kalıbı kullanılır: **for**.
2. **Responsible for** kalıbı kullanılır: **for**.

Diğer şıklar: **A** grateful for kalıbı / **B** responsible for kalıbı / **C** grateful for kalıbı ve responsible for kalıbı / **E** grateful for kalıbı ve responsible for kalıbı.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The children were excited ---- the trip, but their parents were worried ---- the weather.$q$, array[$o$with / about$o$, $o$about / about$o$, $o$about / for$o$, $o$in / of$o$, $o$for / with$o$], 1, $e$1. **Excited about** kalıbı kullanılır: **about**.
2. **Worried about** kalıbı kullanılır: **about**.

Diğer şıklar: **A** excited about kalıbı / **C** worried about kalıbı / **D** excited about kalıbı ve worried about kalıbı / **E** excited about kalıbı ve worried about kalıbı.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The thief escaped ---- the window and hid ---- the bushes.$q$, array[$o$across / in$o$, $o$through / on$o$, $o$through / in$o$, $o$over / to$o$, $o$by / with$o$], 2, $e$1. Pencereden geçiş **through** ile verilir: **through**.
2. Çalıların içi **in** ile verilir: **in**.

Diğer şıklar: **A** pencereden geçmek through ister / **B** çalıların içinde saklanmak in ister / **D** pencereden geçmek through ister ve çalıların içinde saklanmak in ister / **E** pencereden geçmek through ister ve çalıların içinde saklanmak in ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$They have lived ---- Istanbul ---- they got married.$q$, array[$o$in / since$o$, $o$at / since$o$, $o$in / for$o$, $o$on / from$o$, $o$to / during$o$], 0, $e$1. Şehir için **in** kullanılır: **in**.
2. Başlangıç noktası **since** ile verilir: **since**.

Diğer şıklar: **B** şehir için in gelir / **C** başlangıç noktası since ile verilir / **D** şehir için in gelir ve başlangıç noktası since ile verilir / **E** şehir için in gelir ve başlangıç noktası since ile verilir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She has a great talent ---- music, and she is capable ---- composing her own songs.$q$, array[$o$of / of$o$, $o$for / at$o$, $o$in / for$o$, $o$at / in$o$, $o$for / of$o$], 4, $e$1. **Talent for** kalıbı kullanılır: **for**.
2. **Capable of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** talent for kalıbı / **B** capable of kalıbı / **C** talent for kalıbı ve capable of kalıbı / **D** talent for kalıbı ve capable of kalıbı.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He takes after his father ---- appearance, and he takes pride ---- his family history.$q$, array[$o$on / in$o$, $o$in / in$o$, $o$in / of$o$, $o$at / on$o$, $o$by / for$o$], 1, $e$1. **In appearance** kalıbı kullanılır: **in**.
2. **Take pride in** kalıbı kullanılır: **in**.

Diğer şıklar: **A** in appearance kalıbı / **C** take pride in kalıbı / **D** in appearance kalıbı ve take pride in kalıbı / **E** in appearance kalıbı ve take pride in kalıbı.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$There is no excuse ---- such behaviour, and no reason ---- anyone to be rude.$q$, array[$o$of / for$o$, $o$for / of$o$, $o$for / for$o$, $o$to / to$o$, $o$about / about$o$], 2, $e$1. **Excuse for** kalıbı kullanılır: **for**.
2. **Reason for** kalıbı kullanılır: **for**.

Diğer şıklar: **A** excuse for kalıbı / **B** reason for kalıbı / **D** excuse for kalıbı ve reason for kalıbı / **E** excuse for kalıbı ve reason for kalıbı.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She replied ---- my letter ---- three weeks.$q$, array[$o$at / after$o$, $o$to / at$o$, $o$on / for$o$, $o$to / after$o$, $o$for / since$o$], 3, $e$1. **Reply to** kalıbı kullanılır: **to**.
2. Zaman geçişi **after** ile verilir: **after**.

Diğer şıklar: **A** reply to kalıbı / **B** süre sonrasında after gelir / **C** reply to kalıbı ve süre sonrasında after gelir / **E** reply to kalıbı ve süre sonrasında after gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$He is allergic ---- cats, so he stays away ---- them.$q$, array[$o$to / from$o$, $o$of / from$o$, $o$to / of$o$, $o$with / to$o$, $o$at / off$o$], 0, $e$1. **Allergic to** kalıbı kullanılır: **to**.
2. **Stay away from** kalıbı kullanılır: **from**.

Diğer şıklar: **B** allergic to kalıbı / **C** stay away from kalıbı / **D** allergic to kalıbı ve stay away from kalıbı / **E** allergic to kalıbı ve stay away from kalıbı.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The plan was rejected ---- the grounds that it was too expensive, ---- spite of the strong support it had received from the staff.$q$, array[$o$in / in$o$, $o$on / on$o$, $o$by / at$o$, $o$at / by$o$, $o$on / in$o$], 4, $e$1. **On the grounds that**, **in spite of**.

Diğer şıklar: **A** on the grounds that kalıbı / **B** in spite of kalıbı / **C** on the grounds that kalıbı ve in spite of kalıbı / **D** on the grounds that kalıbı ve in spite of kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$He is very good ---- persuading people, but he is hopeless ---- keeping secrets.$q$, array[$o$in / at$o$, $o$at / in$o$, $o$at / at$o$, $o$with / with$o$, $o$for / of$o$], 2, $e$1. **Good at**, **hopeless at**.

Diğer şıklar: **A** good at kalıbı / **B** hopeless at kalıbı / **D** good at kalıbı ve hopeless at kalıbı / **E** good at kalıbı ve hopeless at kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The opposition leader spoke ---- behalf of all those who had been affected by the floods, calling ---- immediate government action.$q$, array[$o$at / for$o$, $o$on / to$o$, $o$by / on$o$, $o$on / for$o$, $o$for / at$o$], 3, $e$1. **On behalf of**, **call for**.

Diğer şıklar: **A** on behalf of kalıbı / **B** call for kalıbı / **C** on behalf of kalıbı ve call for kalıbı / **E** on behalf of kalıbı ve call for kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$She has been working ---- the project ---- the past three years, and she is determined to see it through.$q$, array[$o$at / for$o$, $o$on / since$o$, $o$in / during$o$, $o$over / from$o$, $o$on / for$o$], 4, $e$1. **Work on**, **for the past three years**.

Diğer şıklar: **A** work on a project kalıbı / **B** süre for ile verilir / **C** work on a project kalıbı ve süre for ile verilir / **D** work on a project kalıbı ve süre for ile verilir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$They finally reached an agreement ---- the terms of the contract, ---- the objections of several board members.$q$, array[$o$on / despite$o$, $o$in / despite$o$, $o$on / in spite$o$, $o$at / although$o$, $o$by / because$o$], 0, $e$1. **Agreement on**, **despite + isim**.

Diğer şıklar: **B** agreement on kalıbı / **C** of olmadan kullanılmaz / **D** agreement on kalıbı ve sonrasında cümle gelir / **E** agreement on kalıbı ve sebep anlamı verir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Prepositions konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Pronouns konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (6, 'ydt-dil', null::integer, $q$---- the students passed the exam, but ---- of them got full marks.$q$, array[$o$Almost / none$o$, $o$Most of / no$o$, $o$Few / any$o$, $o$Most of / none$o$, $o$Every / nobody$o$], 3, $e$1. **Most of** sonrasında belirli çoğul isim gelir: **Most of**.
2. **None of** sonrasında isim öbeği gelir: **none**.

Diğer şıklar: **A** of ile birlikte gelmez / **B** of ile birlikte gelmez / **C** anlam bozulur ve olumlu bağlamda anlam bozulur / **E** of ile birlikte gelmez ve of ile birlikte gelmez.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Neither of the answers ---- correct, and each of the students ---- a different explanation.$q$, array[$o$are / has$o$, $o$is / have$o$, $o$were / are having$o$, $o$have been / had been$o$, $o$is / has$o$], 4, $e$1. **Neither of** tekil fiil ister: **is**.
2. **Each of** tekil fiil ister: **has**.

Diğer şıklar: **A** neither of tekil fiil alır / **B** each of tekil fiil alır / **C** neither of tekil fiil alır ve each of tekil fiil alır / **D** neither of tekil fiil alır ve each of tekil fiil alır.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Everyone in the room felt ---- were being watched, but ---- could explain why.$q$, array[$o$they / nobody$o$, $o$he / nobody$o$, $o$they / anyone$o$, $o$it / somebody$o$, $o$we / everybody$o$], 0, $e$1. **Everyone** için sonraki zamir **they** olabilir: **they**.
2. Olumsuz özne **nobody** ile söylenir: **nobody**.

Diğer şıklar: **B** everyone için they kullanılır / **C** nobody ile olumsuzluk verilir / **D** insan için they kullanılır ve anlam bozulur / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$She spoke so quietly that I could hardly hear ----, and she talked about ---- as if no one else mattered.$q$, array[$o$she / herself$o$, $o$her / herself$o$, $o$her / she$o$, $o$hers / her$o$, $o$herself / hers$o$], 1, $e$1. Özne farklı olduğundan nesne zamiri gelir: **her**.
2. Özne aynı kişi olduğundan dönüşlü zamir gelir: **herself**.

Diğer şıklar: **A** nesne zamiri gerekir / **C** about sonrası dönüşlü zamir gerekir / **D** nesne zamiri gerekir ve özne aynı kişi olduğundan dönüşlü gerekir / **E** özne farklı kişi (I) olduğundan dönüşlü kullanılmaz ve about sonrası anlam bozulur.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The company has lost ---- best employees, and many of ---- are now working for its competitors.$q$, array[$o$it's / them$o$, $o$its / they$o$, $o$their / their$o$, $o$its / them$o$, $o$it / themselves$o$], 3, $e$1. Tekil kurum için sahiplik sıfatı **its** olur: **its**.
2. **Of** sonrasında nesne zamiri gelir: **them**.

Diğer şıklar: **A** sahiplik sıfatı gerekir / **B** of sonrası nesne zamiri gelir / **C** company tekil olarak its ister ve of sonrası nesne zamiri gelir / **E** sahiplik sıfatı gerekir ve of sonrası anlam bozulur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I met a woman ---- husband works at the bank, and I know a man ---- sister is a famous singer.$q$, array[$o$who / whose$o$, $o$whose / who$o$, $o$whom / whom$o$, $o$which / which$o$, $o$whose / whose$o$], 4, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Aynı kurala göre: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Some of the tourists went hiking, ---- went sightseeing, and ---- stayed at the hotel.$q$, array[$o$the others / the rest$o$, $o$others / the rest$o$, $o$others / the rests$o$, $o$another / rest$o$, $o$other / others$o$], 1, $e$1. Belirsiz diğerleri **others** ile söylenir: **others**.
2. Kalan herkes **the rest** ile söylenir: **the rest**.

Diğer şıklar: **A** belirsiz bir grup için others kullanılır / **C** rest sayılamazdır / **D** çoğul grup için gelmez ve the ile gelir / **E** tek başına gelmez ve sınırlı kalan grup the rest ile söylenir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$If you can't find a cup, I'll bring you ---- one, and then you can have ---- cup of coffee.$q$, array[$o$other / another$o$, $o$another / other$o$, $o$another / another$o$, $o$the other / the other$o$, $o$others / others$o$], 2, $e$1. Ek bir tane için **another** kullanılır: **another**.
2. Aynı kurala göre: **another**.

Diğer şıklar: **A** one ile another kullanılır / **B** cup önünde another gelir / **D** belirli bir tane anlamı yok ve cup önünde another gelir / **E** tekil one ile uyumsuz ve cup tekildir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It was ---- hot yesterday that we stayed indoors, and ---- a heat has not been recorded for years.$q$, array[$o$such / such$o$, $o$so / so$o$, $o$very / quite$o$, $o$so / such$o$, $o$too / very$o$], 3, $e$1. Tek sıfat öncesinde **so** gelir: **so**.
2. **Such a** + isim yapısı kurulur: **such**.

Diğer şıklar: **A** sıfat öncesi so gelir / **B** a + sıfat + isim öncesi such gelir / **C** that sonuç cümlesi so ister ve anlam bozulur / **E** that sonuç cümlesi so ister ve a heat önünde such gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$We should respect ---- opinions, even if they are different from ----.$q$, array[$o$other people's / ours$o$, $o$other people / ours$o$, $o$other people's / our$o$, $o$others people's / us$o$, $o$the other people / we$o$], 0, $e$1. Sahiplik **other people's** ile söylenir: **other people's**.
2. Nesnesiz sahiplik zamiri **ours** olur: **ours**.

Diğer şıklar: **B** sahiplik eki gerekir / **C** nesne olmadan sahiplik zamiri gerekir / **D** other çoğul eki almaz ve sahiplik anlamı yok / **E** anlam bozulur ve sahiplik anlamı yok.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The committee will award the prize to ---- it considers has made the greatest contribution to the community.$q$, array[$o$whomever$o$, $o$whichever$o$, $o$whoever$o$, $o$whatever$o$, $o$whom$o$], 2, $e$1. **Whoever**: ilişki cümlesinde öznedir (araya giren *it considers* nedeniyle whomever tuzağı).

Diğer şıklar: **A** has made öznesi olduğundan whoever gerekir / **B** insan için whichever uygun değildir / **D** cansız anlamı verir / **E** nesne konumunda it considers araya girse de özne eksiktir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Of the two proposals, the first is more realistic, but ---- is likely to be accepted by the board because it is cheaper.$q$, array[$o$the former$o$, $o$none$o$, $o$neither$o$, $o$both$o$, $o$the latter$o$], 4, $e$1. İki öğeden ikincisi **the latter** ile söylenir.

Diğer şıklar: **A** ilk teklif kastedilir, ikinci için the latter gerekir / **B** belirsiz iki teklifte kalıp farklıdır / **C** ikisinden hiçbiri anlamı bağlama uymaz / **D** ikisi birden anlamı bağlama uymaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She is so self-confident that she never asks ---- for advice. She believes she can solve every problem by ----.$q$, array[$o$anyone / herself$o$, $o$no one / herself$o$, $o$anyone / her$o$, $o$someone / she$o$, $o$everyone / hers$o$], 0, $e$1. **Never** ile **anyone**, **by herself** kendi başına anlamı verir.

Diğer şıklar: **B** never ile çift olumsuz olur / **C** by sonrasında dönüşlü zamir gelir / **D** olumsuz anlam gerekir ve by sonrasında dönüşlü zamir gelir / **E** anlam bozulur ve by sonrasında dönüşlü zamir gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Neither of the candidates was qualified for the job, and ---- of them had any previous experience in the field.$q$, array[$o$nobody$o$, $o$neither$o$, $o$either$o$, $o$no$o$, $o$any$o$], 1, $e$1. İki kişi için **neither of**.

Diğer şıklar: **A** iki aday için neither kullanılır / **C** olumsuz çift anlam bozulur / **D** of ile kullanılmaz / **E** olumlu bağlamda uyumsuz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The two sisters have not spoken to ---- since the argument, although each of them still thinks about the other quite often.$q$, array[$o$themselves$o$, $o$them$o$, $o$each other$o$, $o$one$o$, $o$ourselves$o$], 2, $e$1. **Karşılıklı eylem**: **each other**.

Diğer şıklar: **A** karşılıklı eylem each other ister / **B** nesne zamiri özneyle aynı kişilere gider, karşılıklı anlam için each other gerekir / **D** nesne zamiri değil / **E** özneyle uyumsuz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Pronouns konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Pronouns konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (16, 'ydt-dil', null::integer, $q$Our proposal is similar to ---- of the other company, but it differs from it in several important respects.$q$, array[$o$that$o$, $o$those$o$, $o$this$o$, $o$it$o$, $o$one$o$], 0, $e$1. Tekil isim yerine **that of** kalıbı kullanılır.

Diğer şıklar: **B** proposal tekildir, that gerekir / **C** uzak ve karşılaştırılan nesne anlamı vermez / **D** of ile birlikte kullanılmaz / **E** of ile birlikte anlam bozulur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$There were three applicants, ---- of whom had previous experience, so the manager decided to interview ---- of them.$q$, array[$o$neither / all$o$, $o$none / either$o$, $o$no / no$o$, $o$either / both$o$, $o$none / all$o$], 4, $e$1. **Üç kişiden hiçbiri**: **none of whom**. **Hepsi**: **all of them**.

Diğer şıklar: **A** üç kişi için kullanılmaz / **B** üç kişi için kullanılmaz / **C** of whom ile kullanılmaz ve of them ile kullanılmaz / **D** iki kişi için kullanılır ve iki kişi için kullanılır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It is not easy to put ---- in someone else's position, and it takes a lot of imagination to understand ---- feel.$q$, array[$o$one / how others$o$, $o$oneself / that others$o$, $o$oneself / how others$o$, $o$him / how other$o$, $o$you / how another$o$], 2, $e$1. **Put oneself in someone's position**: **oneself**. **How others feel**: **how others**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** how feel kalıbı / **D** genel kişi anlamı bozulur ve others çoğul gerekir / **E** resmi genel kişi one ile devam eder ve anlam bozulur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- who wish to apply for the scholarship must submit their documents by Friday, and ---- who fail to do so will not be considered.$q$, array[$o$Them / those$o$, $o$Those / them$o$, $o$These / these$o$, $o$Those / those$o$, $o$They / they$o$], 3, $e$1. **Those who** kalıbı kullanılır.

Diğer şıklar: **A** özne zamiri değil / **B** who ile birlikte those gerekir / **C** belirli yakın grup anlamı verir ve belirli yakın grup anlamı verir / **E** who ile birlikte those gerekir ve who ile birlikte those gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The film was a disaster, and the critics were unanimous in condemning ----, while the audience found ---- as boring as the reviewers did.$q$, array[$o$it / it$o$, $o$them / it$o$, $o$it / them$o$, $o$itself / itself$o$, $o$that / that$o$], 0, $e$1. Tekil nesne için **it** kullanılır.

Diğer şıklar: **B** film tekildir / **C** film tekildir / **D** özne farklıdır ve özne farklıdır / **E** nesne zamiri it gerekir ve nesne zamiri it gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Pronouns konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Pronouns konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
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
  (13, 'ydt-dil', null::integer, $q$Not ---- of the cars in the showroom was cheap, and ---- of them had a sunroof.$q$, array[$o$no / some$o$, $o$one / any$o$, $o$one / some$o$, $o$every / none$o$, $o$no / neither$o$], 2, $e$1. **Not one of** kalıbı kullanılır: **one**.
2. Olumlu cümlede **some of** kullanılır: **some**.

Diğer şıklar: **A** Not no birlikte kullanılmaz / **B** olumlu cümlede some kullanılır / **D** Not every birlikte kullanılmaz ve of ile birlikte olumsuz anlam yok / **E** Not no birlikte kullanılmaz ve ikiden çok varlık için kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It was Ayşe ---- gave me the news, and it was ---- who told you about the party.$q$, array[$o$who / he$o$, $o$whom / he$o$, $o$who / his$o$, $o$whose / them$o$, $o$which / himself$o$], 0, $e$1. Özne vurgulanan yapıda insan için **who** gelir: **who**.
2. **It was he who** vurgulu yapısında özne zamiri gelir: **he**.

Diğer şıklar: **B** özne olduğundan who gerekir / **C** who ile vurgu yapısında özne zamiri gelir / **D** sahiplik anlamı yok ve tekil özne he ister / **E** insan için who gerekir ve who ile özne zamiri gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The workers asked ---- about the new contract, but the manager never explained ---- to them.$q$, array[$o$his / it$o$, $o$him / them$o$, $o$he / they$o$, $o$himself / themselves$o$, $o$him / it$o$], 4, $e$1. Nesne zamiri **him** olur: **him**.
2. Tekil nesne için **it** kullanılır: **it**.

Diğer şıklar: **A** nesne zamiri gerekir / **B** contract tekildir / **C** nesne zamiri gerekir ve contract tekildir / **D** özne farklı kişi ve özne farklı kişi.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If you ever meet a man ---- you cannot trust, remember that ---- who deceives others usually ends up deceiving himself.$q$, array[$o$where / he$o$, $o$whom / he$o$, $o$whom / him$o$, $o$whose / them$o$, $o$which / one$o$], 1, $e$1. **Nesne**: **whom**. **He who** kalıbı: **he**.

Diğer şıklar: **A** nesne konumunda whom gerekir / **C** who sonrasında özne zamiri he gerekir / **D** sahiplik anlamı yok ve tekil özne ister / **E** insan için kullanılmaz ve anlam bozulur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I don't mind which of the two routes we take, because ---- of them is much faster than the other.$q$, array[$o$none$o$, $o$no$o$, $o$both$o$, $o$neither$o$, $o$any$o$], 3, $e$1. İki varlıktan hiçbiri **neither of**.

Diğer şıklar: **A** iki yol için neither gerekir / **B** of ile kullanılmaz / **C** olumsuz anlam gerekir / **E** iki yol için either ya da neither gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The manager, along with his two assistants, ---- responsible for the error, but ---- of them has admitted it so far.$q$, array[$o$is / none$o$, $o$are / none$o$, $o$is / neither$o$, $o$were / no$o$, $o$have been / either$o$], 0, $e$1. **Along with** özneyi değiştirmez: **is**. Üç kişiden hiçbiri: **none**.

Diğer şıklar: **B** along with özneyi çoğul yapmaz / **C** üç kişi için none gerekir / **D** şimdiki durum is ister ve of ile kullanılmaz / **E** so far ile bağlam bozulur ve üç kişi için kullanılmaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$When children are brought up in a strict environment, ---- often become either very obedient or very rebellious as ---- grow older.$q$, array[$o$those / they$o$, $o$they / those$o$, $o$them / them$o$, $o$it / it$o$, $o$they / they$o$], 4, $e$1. Çoğul isim yerine özne zamiri **they**.

Diğer şıklar: **A** belirli grup anlamı değil / **B** as sonrasında özne zamiri gerekir / **C** özne zamiri gerekir ve özne zamiri gerekir / **D** çoğul children için they gerekir ve çoğul children için they gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The tourists were impressed by the hotel and by the friendliness of ---- who worked there, although ---- complained about the food.$q$, array[$o$them / some$o$, $o$those / any$o$, $o$those / some$o$, $o$these / each$o$, $o$they / none$o$], 2, $e$1. **Those who** kalıbı, kısmi grup **some**.

Diğer şıklar: **A** who ile those gerekir / **B** olumlu cümlede some gerekir / **D** belirli yakın grup ve of ile tekil kullanılır / **E** who ile those gerekir ve although ile çelişir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Pronouns konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Relative Clauses konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The woman ---- lives next door is a doctor, and the man ---- I met yesterday is her husband.$q$, array[$o$whom / whom$o$, $o$who / which$o$, $o$whose / whose$o$, $o$who / whom$o$, $o$which / where$o$], 3, $e$1. Özne insan için **who** gelir: **who**.
2. Nesne insan için **whom** gelir: **whom**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** insan için whom ya da who gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** insan için who gerekir ve yer anlamı verir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$This is the house ---- I was born, and that is the school ---- I studied.$q$, array[$o$which / where$o$, $o$where / which$o$, $o$whose / whose$o$, $o$who / who$o$, $o$where / where$o$], 4, $e$1. Yer için **where** gelir: **where**.
2. Aynı kurala göre: **where**.

Diğer şıklar: **A** yer anlamı where ister / **B** yer anlamı where ister / **C** yer anlamı where ister ve yer anlamı where ister / **D** yer anlamı where ister ve yer anlamı where ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The book ---- is on the table belongs to me, and the pen ---- you gave me is lost.$q$, array[$o$which / which$o$, $o$who / which$o$, $o$which / who$o$, $o$whose / whose$o$, $o$where / where$o$], 0, $e$1. Cansız özne için **which** gelir: **which**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **B** cansız varlık için which gelir / **C** cansız varlık için which gelir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I know a girl ---- father is a famous pilot, and a boy ---- sister is a singer.$q$, array[$o$who / whose$o$, $o$whose / whose$o$, $o$whose / who$o$, $o$which / which$o$, $o$whom / whom$o$], 1, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Aynı kurala göre: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **E** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$That is the reason ---- he left, and 2005 was the year ---- we met.$q$, array[$o$which / when$o$, $o$why / where$o$, $o$who / why$o$, $o$why / when$o$, $o$where / whose$o$], 3, $e$1. **The reason why** kalıbı kullanılır: **why**.
2. Zaman için **when** gelir: **when**.

Diğer şıklar: **A** neden anlamı why ister / **B** zaman anlamı when ister / **C** neden anlamı why ister ve zaman anlamı when ister / **E** neden anlamı why ister ve zaman anlamı when ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$My uncle, ---- lives in Ankara, is a lawyer, and his wife, ---- I like very much, is a teacher.$q$, array[$o$that / whom$o$, $o$who / whose$o$, $o$who / whom$o$, $o$whose / that$o$, $o$which / which$o$], 2, $e$1. Virgüllü özne için **who** gelir: **who**.
2. Virgüllü nesne için **whom** gelir: **whom**.

Diğer şıklar: **A** virgüllü sıfat cümlesinde that kullanılmaz / **B** sahiplik anlamı yok / **D** sahiplik anlamı yok ve virgüllü sıfat cümlesinde that kullanılmaz / **E** insan için who gelir ve insan için whom gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The company, ---- was founded in 1990, employs 500 people, all of ---- are well paid.$q$, array[$o$that / whom$o$, $o$which / whom$o$, $o$which / them$o$, $o$who / who$o$, $o$whose / which$o$], 1, $e$1. Cansız varlık için **which** gelir: **which**.
2. **All of whom** kalıbı kullanılır: **whom**.

Diğer şıklar: **A** virgüllü sıfat cümlesinde that kullanılmaz / **C** all of whom kalıbı gerekir / **D** cansız varlık için which gelir ve of sonrasında whom gelir / **E** sahiplik anlamı yok ve insan için whom gelir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The man to ---- I spoke was very kind, and the chair on ---- he was sitting was broken.$q$, array[$o$whom / which$o$, $o$who / which$o$, $o$whom / that$o$, $o$that / who$o$, $o$whose / whom$o$], 0, $e$1. Edat sonrasında insan için **whom** gelir: **whom**.
2. Edat sonrasında cansız varlık için **which** gelir: **which**.

Diğer şıklar: **B** edat sonrasında whom gelir / **C** edat sonrasında that kullanılmaz / **D** edat sonrasında that kullanılmaz ve cansız varlık için which gelir / **E** sahiplik anlamı yok ve cansız varlık için which gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Everything ---- he said was true, and the only person ---- could help us was Tom.$q$, array[$o$whom / who$o$, $o$that / which$o$, $o$that / who$o$, $o$what / whom$o$, $o$whom / whose$o$], 2, $e$1. **Everything** sonrasında **that** gelir: **that**.
2. Özne insan için **who** gelir: **who**.

Diğer şıklar: **A** everything sonrasında that gelir / **B** insan için who ya da that gelir / **D** everything sonrasında that gelir ve özne olduğundan who gelir / **E** everything sonrasında that gelir ve sahiplik anlamı yok.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The students ---- passed the exam were happy, but the ones ---- failed were disappointed.$q$, array[$o$whom / who$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$who / who$o$, $o$which / which$o$], 3, $e$1. Özne insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** özne olduğundan who gerekir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** insan için who gelir ve insan için who gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The film, ---- I watched last night, was boring, but the actor ---- played the lead was excellent.$q$, array[$o$that / who$o$, $o$which / whom$o$, $o$whom / which$o$, $o$whose / whose$o$, $o$which / who$o$], 4, $e$1. Virgüllü cansız nesne için **which** gelir: **which**.
2. Özne insan için **who** gelir: **who**.

Diğer şıklar: **A** virgüllü sıfat cümlesinde that kullanılmaz / **B** özne olduğundan who gerekir / **C** cansız varlık için which gelir ve insan için who gelir / **D** sahiplik anlamı yok ve sahiplik anlamı yok.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She has three brothers, two of ---- are doctors, and a car, the engine of ---- is very old.$q$, array[$o$who / which$o$, $o$whom / whose$o$, $o$whom / which$o$, $o$them / that$o$, $o$which / whom$o$], 2, $e$1. **Two of whom** kalıbı kullanılır: **whom**.
2. **The engine of which** kalıbı kullanılır: **which**.

Diğer şıklar: **A** of sonrasında whom gelir / **B** the engine of which kalıbı gerekir / **D** of whom kalıbı gerekir ve of sonrasında that kullanılmaz / **E** insan için whom gelir ve cansız varlık için which gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The town ---- we visited last summer was beautiful, and the people ---- we met were friendly.$q$, array[$o$that / that$o$, $o$who / that$o$, $o$that / where$o$, $o$whose / whose$o$, $o$where / what$o$], 0, $e$1. Tanımlayıcı cümlede nesne için **that** kullanılır: **that**.
2. Aynı kurala göre: **that**.

Diğer şıklar: **B** cansız varlık için that/which gelir / **C** yer anlamı verir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** we visited ile nesne eksik kalır ve the people sonrasında what kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He passed the exam, ---- surprised everyone, and he got the job, ---- made his family proud.$q$, array[$o$that / which$o$, $o$which / which$o$, $o$which / that$o$, $o$who / who$o$, $o$what / what$o$], 1, $e$1. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.
2. Aynı kurala göre: **which**.

Diğer şıklar: **A** virgülden sonra that kullanılmaz / **C** virgülden sonra that kullanılmaz / **D** cümleyi niteler, which gerekir ve cümleyi niteler, which gerekir / **E** virgülden sonra what kullanılmaz ve virgülden sonra what kullanılmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The man ---- car was stolen called the police, and the woman ---- bag was lost cried.$q$, array[$o$who / whose$o$, $o$whose / who$o$, $o$which / which$o$, $o$whom / whom$o$, $o$whose / whose$o$], 4, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Aynı kurala göre: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The author, ---- latest novel has been translated into more than thirty languages, is a woman ---- sudden fame has surprised even her publishers.$q$, array[$o$who / whose$o$, $o$whose / which$o$, $o$whose / whose$o$, $o$whom / that$o$, $o$of whom / who$o$], 2, $e$1. **Sahiplik**: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **E** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The two reports, ---- contained serious errors, were withdrawn, and the committee, ---- chairman resigned in protest, was dissolved.$q$, array[$o$of which both / whose$o$, $o$both of which / whose$o$, $o$both of which / who$o$, $o$both of whom / which$o$, $o$all of them / of which$o$], 1, $e$1. **Both of which**, **whose chairman**.

Diğer şıklar: **A** sıra yanlış / **C** sahiplik anlamı whose ile verilir / **D** cansız varlık için which gelir ve sahiplik anlamı whose ile verilir / **E** bağlaç gerekir ve sahiplik anlamı whose ile verilir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$This is exactly the same problem ---- we faced last year, and it is the only one ---- we have not managed to solve.$q$, array[$o$who / that$o$, $o$as / which$o$, $o$whom / what$o$, $o$what / who$o$, $o$as / that$o$], 4, $e$1. **The same ... as**, **the only one that**: **as / that**.

Diğer şıklar: **A** the same ... as kalıbı ister / **B** the only one sonrasında that gelir / **C** the same ... as kalıbı ister ve the only one sonrasında that gelir / **D** the same ... as kalıbı ister ve cansız varlık için kullanılmaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The man to ---- she was engaged turned out to be married, a fact ---- she discovered only on the eve of the wedding.$q$, array[$o$who / which$o$, $o$whom / where$o$, $o$which / what$o$, $o$whom / which$o$, $o$that / who$o$], 3, $e$1. **Edat + whom**: **to whom**. **A fact which**: **which**.

Diğer şıklar: **A** edat sonrası whom gerekir / **B** virgülden sonra that kullanılmaz, sıfat cümlesi a fact'i niteler / **C** insan için whom gelir ve a fact sonrasında what kullanılmaz / **E** edat sonrası that kullanılmaz ve cansız varlık için which gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The new regulations, ---- are intended to reduce pollution, will be introduced in stages, ---- means that the full effect will not be felt for years.$q$, array[$o$which / which$o$, $o$that / which$o$, $o$which / that$o$, $o$what / what$o$, $o$who / who$o$], 0, $e$1. **Virgüllü cümle**: **which**, tüm cümleyi niteleyen **which**.

Diğer şıklar: **B** virgülden sonra that kullanılmaz / **C** virgülden sonra that kullanılmaz / **D** virgülden sonra what kullanılmaz ve virgülden sonra what kullanılmaz / **E** cansız varlık için which gelir ve cansız varlık için which gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Relative Clauses konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Relative Clauses konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The teacher ---- taught me English retired last year, and the book ---- he wrote is still popular.$q$, array[$o$whom / which$o$, $o$who / who$o$, $o$whose / whose$o$, $o$who / which$o$, $o$where / where$o$], 3, $e$1. Özne insan için **who** gelir: **who**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** cansız varlık için which gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I remember the day ---- we first met, and the café ---- we used to go every Friday.$q$, array[$o$when / where$o$, $o$where / where$o$, $o$when / when$o$, $o$which / which$o$, $o$who / whose$o$], 0, $e$1. Zaman için **when** gelir: **when**.
2. Yer için **where** gelir: **where**.

Diğer şıklar: **B** zaman anlamı when ister / **C** yer anlamı where ister / **D** zaman anlamı when ister ve yer anlamı where ister / **E** zaman anlamı when ister ve yer anlamı where ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She is the girl ---- brother plays for Fenerbahçe, and he is the player ---- scored two goals.$q$, array[$o$who / who$o$, $o$whose / whom$o$, $o$which / whose$o$, $o$whom / which$o$, $o$whose / who$o$], 4, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Özne insan için **who** gelir: **who**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** özne olduğundan who gerekir / **C** sahiplik anlamı whose ile verilir ve sahiplik anlamı yok / **D** sahiplik anlamı whose ile verilir ve insan için who gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$The man ---- I spoke to yesterday is the manager, and the woman ---- I work with is his assistant.$q$, array[$o$where / whom$o$, $o$whom / whom$o$, $o$whom / where$o$, $o$whose / whose$o$, $o$which / which$o$], 1, $e$1. Nesne insan için **whom** gelir: **whom**.
2. Aynı kurala göre: **whom**.

Diğer şıklar: **A** yer anlamı verir / **C** yer anlamı verir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** insan için whom gelir ve insan için whom gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$That is the house ---- roof was damaged in the storm, and the tree ---- fell on it was very old.$q$, array[$o$which / which$o$, $o$whose / who$o$, $o$who / whose$o$, $o$whose / which$o$, $o$whom / where$o$], 3, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Cansız özne için **which** gelir: **which**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** cansız varlık için which gelir / **C** sahiplik anlamı whose ile verilir ve sahiplik anlamı yok / **E** sahiplik anlamı whose ile verilir ve yer anlamı verir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$This is the only film ---- I have ever seen twice, and it is the best ---- he has directed.$q$, array[$o$whom / that$o$, $o$that / whom$o$, $o$that / that$o$, $o$who / who$o$, $o$what / what$o$], 2, $e$1. **The only** sonrasında **that** gelir: **that**.
2. Üstünlük sonrasında **that** gelir: **that**.

Diğer şıklar: **A** the only sonrasında that gelir / **B** superlative sonrasında that gelir / **D** cansız varlık için that gelir ve cansız varlık için that gelir / **E** the only sonrasında what kullanılmaz ve superlative sonrasında what kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The professor, ---- lectures I attend every week, is very strict, and the students, most of ---- are first-years, are afraid of him.$q$, array[$o$whose / whom$o$, $o$who / whom$o$, $o$whose / who$o$, $o$whom / them$o$, $o$which / which$o$], 0, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. **Most of whom** kalıbı kullanılır: **whom**.

Diğer şıklar: **B** sahiplik anlamı whose ile verilir / **C** most of sonrasında whom gelir / **D** sahiplik anlamı whose ile verilir ve most of whom kalıbı gerekir / **E** insan için whose gelir ve insan için whom gelir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I can't find the keys ---- I left on the table, so I don't know ---- to start the car.$q$, array[$o$who / how$o$, $o$which / what$o$, $o$whose / that$o$, $o$which / how$o$, $o$where / why$o$], 3, $e$1. Cansız nesne için **which** gelir: **which**.
2. Yöntem için **how** gelir: **how**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** yöntem anlamı how ister / **C** sahiplik anlamı yok ve yöntem anlamı how ister / **E** yer anlamı verir ve yöntem anlamı how ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The reason ---- she resigned remains unknown, and the way ---- she did it surprised everyone.$q$, array[$o$when / in which$o$, $o$why / how$o$, $o$why / in which$o$, $o$where / where$o$, $o$which / why$o$], 2, $e$1. **The reason why** kalıbı kullanılır: **why**.
2. **The way in which** kalıbı kullanılır: **in which**.

Diğer şıklar: **A** neden anlamı why ister / **B** the way ile how kullanılmaz / **D** neden anlamı why ister ve the way ile where kullanılmaz / **E** neden anlamı why ister ve the way ile why kullanılmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The man ---- you saw was my uncle, and the car ---- he was driving belongs to his boss.$q$, array[$o$whose / which$o$, $o$whom / which$o$, $o$whom / who$o$, $o$where / whose$o$, $o$whomever / where$o$], 1, $e$1. Nesne insan için **whom** gelir: **whom**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **A** sahiplik anlamı yok / **C** cansız varlık için which gelir / **D** yer anlamı verir ve sahiplik anlamı yok / **E** kalıp yanlıştır ve yer anlamı verir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The children, ---- parents work abroad, live with their grandmother, ---- house is near the school.$q$, array[$o$who / whose$o$, $o$whose / who$o$, $o$which / which$o$, $o$whom / whom$o$, $o$whose / whose$o$], 4, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Aynı kurala göre: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir / **D** sahiplik anlamı whose ile verilir ve sahiplik anlamı whose ile verilir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He told me something ---- I had never heard before, and nothing ---- he said was true.$q$, array[$o$that / that$o$, $o$what / that$o$, $o$that / what$o$, $o$who / who$o$, $o$whose / whose$o$], 0, $e$1. **Something** sonrasında **that** gelir: **that**.
2. **Nothing** sonrasında **that** gelir: **that**.

Diğer şıklar: **B** something sonrasında that gelir / **C** nothing sonrasında that gelir / **D** cansız varlık için that gelir ve cansız varlık için that gelir / **E** sahiplik anlamı yok ve sahiplik anlamı yok.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The singer ---- songs you like so much is coming to Istanbul, and the hall ---- she will perform is huge.$q$, array[$o$who / where$o$, $o$whose / which$o$, $o$whose / where$o$, $o$which / when$o$, $o$whom / whose$o$], 2, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Yer için **where** gelir: **where**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** in which ya da where gerekir, nesne eksik kalır / **D** sahiplik anlamı whose ile verilir ve yer anlamı where ister / **E** sahiplik anlamı whose ile verilir ve sahiplik anlamı yok.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The picture ---- hangs on the wall was painted by my grandfather, ---- died last year.$q$, array[$o$who / who$o$, $o$which / which$o$, $o$whose / whom$o$, $o$which / who$o$, $o$whom / whose$o$], 3, $e$1. Cansız özne için **which** gelir: **which**.
2. Virgüllü insan özne için **who** gelir: **who**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** insan için who gelir / **C** sahiplik anlamı yok ve özne olduğundan who gerekir / **E** cansız varlık için which gelir ve sahiplik anlamı yok.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I met a man ---- claimed to be a doctor, but ---- I did not trust.$q$, array[$o$whom / whom$o$, $o$who / whom$o$, $o$who / which$o$, $o$which / that$o$, $o$whose / which$o$], 1, $e$1. Özne insan için **who** gelir: **who**.
2. Nesne insan için **whom** gelir: **whom**.

Diğer şıklar: **A** özne olduğundan who gerekir / **C** insan için whom gelir / **D** insan için who gelir ve but sonrasında that kullanılmaz / **E** sahiplik anlamı yok ve insan için whom gelir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The reason ---- she gave for her resignation was not the real one, and the way ---- she announced it surprised everybody.$q$, array[$o$why / in which$o$, $o$that / how$o$, $o$whom / where$o$, $o$whose / why$o$, $o$that / in which$o$], 4, $e$1. **The reason (that) she gave**, **the way in which**.

Diğer şıklar: **A** the reason why that gelmeden kullanılır, şık eşleşmesi bozulur / **B** the way ile how kullanılmaz / **C** cansız varlık için kullanılmaz ve yer anlamı verir / **D** sahiplik anlamı yok ve the way ile why kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The villagers, ---- homes had been destroyed in the earthquake, were given temporary shelter in the school, ---- had been converted into a refugee centre.$q$, array[$o$who / which$o$, $o$whose / that$o$, $o$whose / which$o$, $o$whom / where$o$, $o$which / who$o$], 2, $e$1. **Whose homes**, **the school, which**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** virgülden sonra that kullanılmaz / **D** sahiplik anlamı whose ile verilir ve in the school ile kullanılabilir, nesne eksik kalır / **E** sahiplik anlamı whose ile verilir ve cansız varlık için which gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The scientist ---- discoveries were once dismissed as worthless is now regarded as one of the founders of modern medicine.$q$, array[$o$who$o$, $o$whose$o$, $o$whom$o$, $o$which$o$, $o$that$o$], 1, $e$1. **Sahiplik**: **whose**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı whose ile verilir / **D** insan için which kullanılmaz / **E** sahiplik anlamı that ile verilmez.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He was honoured at the university ---- he had once studied, an institution ---- reputation he had always admired.$q$, array[$o$where / whose$o$, $o$which / whose$o$, $o$where / which$o$, $o$that / that$o$, $o$when / of which$o$], 0, $e$1. **Yer**: **where**. **Whose reputation**.

Diğer şıklar: **B** where ile in which kalıbı, nesne eksik kalır / **C** sahiplik anlamı whose ile verilir / **D** where ile that kalıbı, nesne eksik kalır ve sahiplik anlamı whose ile verilir / **E** yer anlamı where ister ve reputation önünde biçim bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The candidates, ---- were interviewed on Monday, will be informed of the results by Friday.$q$, array[$o$most of them$o$, $o$most of which$o$, $o$who most$o$, $o$whom most of$o$, $o$most of whom$o$], 4, $e$1. **Most of whom**: kısmi kapsama.

Diğer şıklar: **A** bağlaç gerekir, sıfat cümlesi kurmaz / **B** insan için whom gelir / **C** sıra yanlış / **D** biçim yanlış.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Relative Clauses konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Relative Clauses konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The girl ---- won the prize is my cousin, and the boy ---- sat next to her is her friend.$q$, array[$o$whom / who$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$which / which$o$, $o$who / who$o$], 4, $e$1. Özne insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** özne olduğundan who gerekir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **D** insan için who gelir ve insan için who gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$This is the shop ---- I bought my coat, and that is the street ---- the shop is located.$q$, array[$o$which / where$o$, $o$where / which$o$, $o$where / where$o$, $o$whose / whose$o$, $o$who / who$o$], 2, $e$1. Yer için **where** gelir: **where**.
2. Aynı kurala göre: **where**.

Diğer şıklar: **A** yer anlamı where ister / **B** yer anlamı where ister / **D** yer anlamı where ister ve yer anlamı where ister / **E** yer anlamı where ister ve yer anlamı where ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The phone ---- rang woke the baby, and the noise ---- it made scared the dog.$q$, array[$o$who / which$o$, $o$which / who$o$, $o$whose / whose$o$, $o$which / which$o$, $o$where / where$o$], 3, $e$1. Cansız özne için **which** gelir: **which**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** cansız varlık için which gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$He is a man ---- everybody respects, and she is a woman ---- everybody loves.$q$, array[$o$where / whom$o$, $o$whom / where$o$, $o$whose / whose$o$, $o$which / which$o$, $o$whom / whom$o$], 4, $e$1. Nesne insan için **whom** gelir: **whom**.
2. Aynı kurala göre: **whom**.

Diğer şıklar: **A** yer anlamı verir / **B** yer anlamı verir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **D** insan için whom gelir ve insan için whom gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I'll never forget the day ---- we won the match, and the place ---- we celebrated.$q$, array[$o$when / where$o$, $o$where / where$o$, $o$when / when$o$, $o$which / which$o$, $o$who / whose$o$], 0, $e$1. Zaman için **when** gelir: **when**.
2. Yer için **where** gelir: **where**.

Diğer şıklar: **B** zaman anlamı when ister / **C** yer anlamı where ister / **D** zaman anlamı when ister ve yer anlamı where ister / **E** zaman anlamı when ister ve yer anlamı where ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$The report ---- by the committee last week has been published, and the people ---- in the study were paid.$q$, array[$o$preparing / involved$o$, $o$prepared / involving$o$, $o$prepared / involved$o$, $o$prepare / involve$o$, $o$to prepare / to involve$o$], 2, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** alır: **prepared**.
2. Aynı kurala göre: **involved**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** edilgen anlam V-ed ister / **D** edilgen anlam V-ed ister ve edilgen anlam V-ed ister / **E** edilgen anlam V-ed ister ve edilgen anlam V-ed ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The students ---- in the front row are the best, and the teacher ---- them is very proud.$q$, array[$o$sat / teaching$o$, $o$sitting / taught$o$, $o$seated / taught by$o$, $o$sitting / teaching$o$, $o$sit / teach$o$], 3, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **sitting**.
2. Aynı kurala göre: **teaching**.

Diğer şıklar: **A** kısaltılmış sıfat cümlesi V-ing ister / **B** etken kısaltılmış sıfat cümlesi V-ing ister / **C** oturma eylemi etken anlam ister ve anlam bozulur / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The book ---- you recommended was excellent, and the author ---- you told me about is amazing.$q$, array[$o$that / that$o$, $o$who / that$o$, $o$that / which$o$, $o$whose / whose$o$, $o$where / where$o$], 0, $e$1. Tanımlayıcı cümlede nesne için **that** kullanılır: **that**.
2. Aynı kurala göre: **that**.

Diğer şıklar: **B** cansız varlık için that gelir / **C** insan için that/whom gelir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I have a friend ---- lives in Canada, and I often visit the city ---- he works.$q$, array[$o$whom / where$o$, $o$who / where$o$, $o$who / which$o$, $o$whose / who$o$, $o$which / whose$o$], 1, $e$1. Özne insan için **who** gelir: **who**.
2. Yer için **where** gelir: **where**.

Diğer şıklar: **A** özne olduğundan who gerekir / **C** yer anlamı where ister / **D** sahiplik anlamı yok ve yer anlamı where ister / **E** insan için who gelir ve yer anlamı where ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$She bought a dress ---- she never wore, and a pair of shoes ---- she lost the next day.$q$, array[$o$who / which$o$, $o$which / who$o$, $o$whose / whose$o$, $o$where / where$o$, $o$which / which$o$], 4, $e$1. Cansız nesne için **which** gelir: **which**.
2. Aynı kurala göre: **which**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** cansız varlık için which gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **D** yer anlamı verir ve yer anlamı verir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The architect ---- designed the bridge won an award, and the engineers ---- built it were praised.$q$, array[$o$whom / who$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$who / who$o$, $o$which / which$o$], 3, $e$1. Özne insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** özne olduğundan who gerekir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** insan için who gelir ve insan için who gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$All the money ---- he had saved was stolen, and the little ---- remained was spent on food.$q$, array[$o$that / that$o$, $o$what / that$o$, $o$that / what$o$, $o$who / who$o$, $o$whom / whom$o$], 0, $e$1. **All** sonrasında **that** gelir: **that**.
2. **The little** sonrasında **that** gelir: **that**.

Diğer şıklar: **B** all sonrasında that gelir / **C** the little sonrasında that gelir / **D** cansız varlık için that gelir ve cansız varlık için that gelir / **E** cansız varlık için that gelir ve cansız varlık için that gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The man ---- you were talking about is my teacher, and the house ---- he lives in is huge.$q$, array[$o$where / which$o$, $o$whom / which$o$, $o$whom / what$o$, $o$whose / whom$o$, $o$where / where$o$], 1, $e$1. Nesne insan için **whom** gelir: **whom**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **A** yer anlamı verir / **C** in sonrasında which gelir / **D** sahiplik anlamı yok ve cansız varlık için which gelir / **E** yer anlamı verir ve in ile birlikte kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$My neighbour, ---- we invited to dinner, never came, ---- annoyed us a little.$q$, array[$o$where / which$o$, $o$whom / that$o$, $o$whose / what$o$, $o$whom / which$o$, $o$which / who$o$], 3, $e$1. Virgüllü nesne insan için **whom** gelir: **whom**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** yer anlamı verir / **B** virgülden sonra that kullanılmaz / **C** sahiplik anlamı yok ve virgülden sonra what kullanılmaz / **E** insan için whom gelir ve cümleyi niteler, which gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The boy ---- mother is a nurse lives next door, and the dog ---- barks all night is his.$q$, array[$o$who / that$o$, $o$whose / whose$o$, $o$whose / that$o$, $o$which / what$o$, $o$whom / where$o$], 2, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Tanımlayıcı cümlede özne için **that** kullanılır: **that**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** sahiplik anlamı yok, özne gerekir / **D** sahiplik anlamı whose ile verilir ve the dog sonrasında what kullanılmaz / **E** sahiplik anlamı whose ile verilir ve yer anlamı verir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Everything ---- he told us about the accident was true, and the only witness ---- could have contradicted him had disappeared.$q$, array[$o$whom / who$o$, $o$that / who$o$, $o$that / whom$o$, $o$what / whose$o$, $o$whom / which$o$], 1, $e$1. **Everything that**, **the only witness who**: **that / who**.

Diğer şıklar: **A** everything sonrasında that gelir / **C** özne olduğundan who gerekir / **D** everything sonrasında that gelir ve sahiplik anlamı yok / **E** everything sonrasında that gelir ve insan için who/that gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She gave me a magazine ---- contents I could hardly understand, but it was the only one ---- she had.$q$, array[$o$whose / that$o$, $o$whom / that$o$, $o$whose / which$o$, $o$that / where$o$, $o$of which / who$o$], 0, $e$1. **Whose contents**, **the only one that**.

Diğer şıklar: **B** sahiplik anlamı whose ile verilir / **C** the only one sonrasında that gelir / **D** sahiplik anlamı whose ile verilir ve the only one sonrasında that gelir / **E** contents önünde biçim bozulur ve cansız varlık için kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The tourists we met on the train turned out to be neighbours of the people ---- we had grown up.$q$, array[$o$whom with$o$, $o$who with$o$, $o$which with$o$, $o$with who$o$, $o$with whom$o$], 4, $e$1. **Edat + whom**: **with whom**.

Diğer şıklar: **A** edat sıralaması bozuk / **B** edat who ile başta kullanılmaz / **C** insan için which kullanılmaz / **D** resmi yapıda edat + whom gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Nothing ---- he promised us during the campaign has been delivered, ---- has seriously damaged his credibility among voters.$q$, array[$o$what / which$o$, $o$that / that$o$, $o$that / which$o$, $o$who / what$o$, $o$whose / who$o$], 2, $e$1. **Nothing that**, cümleyi niteleyen **which**.

Diğer şıklar: **A** nothing sonrasında that gelir / **B** virgülden sonra that kullanılmaz / **D** cansız varlık için kullanılmaz ve virgülden sonra what kullanılmaz / **E** sahiplik anlamı yok ve cümleyi niteleyen sıfat cümlesi which ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$It was in the small village ---- his grandfather was born that he decided to spend the rest of his life.$q$, array[$o$which$o$, $o$where$o$, $o$that$o$, $o$when$o$, $o$whose$o$], 1, $e$1. **Yer**: **where**.

Diğer şıklar: **A** where ile in which gerekir, nesne eksik kalır / **C** in which anlamında that tek başına yetmez / **D** zaman anlamı verir / **E** sahiplik anlamı yok.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Relative Clauses konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Tenses konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The train ---- at 6.45 tomorrow morning, so we ---- up very early to pack our bags.$q$, array[$o$leaves / will have to get$o$, $o$would leave / will have to get$o$, $o$leaves / got$o$, $o$left / have got$o$, $o$has left / are getting$o$], 0, $e$1. Tarifeli ve önceden belirlenmiş olaylar Present Simple ile anlatılır: **leaves**.
2. **So** sonucu kesin bir zorunluluktur ve gelecekte olur: **will have to get**.

Diğer şıklar: **B** tomorrow ile tarife için Present Simple kullanılır / **C** tomorrow ile geçmiş zaman kullanılmaz / **D** tomorrow geçmiş zaman almaz ve have got to kalıbı bozulur / **E** tomorrow ile Present Perfect kullanılmaz ve zorunluluk anlatılmıyor.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She ---- a new phone last week, but she ---- it much since then because she is always busy.$q$, array[$o$has bought / hasn't used$o$, $o$bought / didn't use$o$, $o$bought / hasn't used$o$, $o$buys / doesn't use$o$, $o$was buying / wasn't using$o$], 2, $e$1. **Last week** bitmiş bir zamandır: **bought**.
2. **Since then** geçmişten şimdiye uzanan bir dönemdir: **hasn't used**.

Diğer şıklar: **A** last week ile Present Perfect kullanılmaz / **B** since then Present Perfect ister / **D** geçmişte bitmiş bir eylem ve since then geçmişten şimdiye uzanır / **E** tek seferlik biten bir eylem anlatılır ve since then ile Past Continuous kullanılmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I ---- the report right now, so please ---- me until I finish it.$q$, array[$o$write / don't disturb$o$, $o$am writing / don't disturb$o$, $o$am writing / not disturb$o$, $o$wrote / won't disturb$o$, $o$have written / aren't disturbing$o$], 1, $e$1. **Right now** şu an süren eylemi gösterir: **am writing**.
2. **Please** ile olumsuz emir kurulur: **don't disturb**.

Diğer şıklar: **A** right now Present Continuous ister / **C** emir cümlesi bu yapıyla kurulmaz / **D** right now geçmiş değildir ve please ile emir beklenir / **E** eylem şu an sürüyor ve emir cümlesi kurulmaz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$My brother ---- in Izmir for ten years now, but next year he ---- to Ankara.$q$, array[$o$lived / is moving$o$, $o$has lived / moved$o$, $o$lives / has moved$o$, $o$has lived / is moving$o$, $o$is living / moves$o$], 3, $e$1. **For ten years now** şimdiye uzanan süreyi gösterir: **has lived**.
2. **Next year** için önceden planlanmış gelecek Present Continuous ile söylenir: **is moving**.

Diğer şıklar: **A** for ten years now şimdiye uzanır / **B** next year geçmiş zaman almaz / **C** süre vurgusu için Present Perfect gerekir ve next year geçmiş zaman almaz / **E** süre vurgusu için Present Perfect gerekir ve planlı bir değişiklik için Present Continuous kullanılır.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Look at those dark clouds! It ---- soon, so we ---- the picnic until next weekend.$q$, array[$o$is going to rain / had better postpone$o$, $o$would rain / had better postpone$o$, $o$is going to rain / postponed$o$, $o$has been raining / are postponing$o$, $o$is raining / would postpone$o$], 0, $e$1. Görünür kanıta dayalı yakın tahmin be going to ile söylenir: **is going to rain**.
2. **Had better** kalıbından sonra yalın fiil gelir: **postpone**.

Diğer şıklar: **B** görünür kanıta dayalı tahmin be going to ister / **C** had better ile yalın fiil gelir / **D** gelecek zaman gerekir ve had better ile yalın fiil gelir / **E** soon gelecek bir zaman gösterir ve had better ile yalın fiil gelir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$By the end of this month, the company ---- all of its old machines, and the workers ---- the new ones for a week.$q$, array[$o$has replaced / will have been testing$o$, $o$will have replaced / will have been testing$o$, $o$will have replaced / have been testing$o$, $o$replaced / will test$o$, $o$is replacing / would have tested$o$], 1, $e$1. **By the end of this month** Future Perfect ister: **will have replaced**.
2. **For a week** süre vurgusu için Future Perfect Continuous gerekir: **will have been testing**.

Diğer şıklar: **A** by the end of this month Future Perfect ister / **C** bir haftalık süre ve gelecek vurgusu vardır / **D** gelecekteki bitiş zamanı belirtiliyor ve süre vurgusu için sürekli yapı gerekir / **E** bitiş zamanı Future Perfect ister ve gelecek zaman gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$It was the first time that he ---- abroad, and he ---- how to use the public transport system.$q$, array[$o$has travelled / didn't know$o$, $o$had travelled / doesn't know$o$, $o$travelled / hasn't known$o$, $o$was travelling / won't know$o$, $o$had travelled / didn't know$o$], 4, $e$1. **It was the first time** kalıbından sonra Past Perfect gelir: **had travelled**.
2. Ana anlatım Past Simple ile sürer: **didn't know**.

Diğer şıklar: **A** ana cümle geçmiştir / **B** ana cümle geçmiş zamandır / **C** ilk kez vurgusu Past Perfect ister ve geçmiş anlatımda Present Perfect olmaz / **D** yaşam deneyimi anlatılır ve geçmiş anlatımda gelecek olmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The lecture ---- when I ---- into the hall, so I quietly took a seat at the back.$q$, array[$o$already started / walked$o$, $o$had already started / had walked$o$, $o$had already started / walked$o$, $o$was already starting / was walking$o$, $o$has already started / have walked$o$], 2, $e$1. Salona girmeden önce başlamış eylem Past Perfect ile söylenir: **had already started**.
2. Sonraki kısa eylem Past Simple ile verilir: **walked**.

Diğer şıklar: **A** zaman sırası için had gerekir / **B** sonraki olay Past Simple ile verilir / **D** eylem biter bitmez sonuç vardır ve kısa ve tamamlanmış bir eylemdir / **E** geçmiş anlatım Present Perfect almaz ve geçmiş anlatım Present Perfect almaz.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Please don't call me at 8 o'clock tonight, because I ---- dinner with my clients and I ---- my phone off.$q$, array[$o$have had / will turn$o$, $o$will be having / turned$o$, $o$had / have turned$o$, $o$will be having / will turn$o$, $o$has had / was turning$o$], 3, $e$1. **At 8 o'clock tonight** belirli bir anda sürecek eylemi gösterir: **will be having**.
2. Telefonu kapatma kararı anında verilir: **will turn**.

Diğer şıklar: **A** tonight gelecek bir an gösterir / **B** gelecek zaman gerekir / **C** tonight gelecek bir an gösterir ve gelecek zaman gerekir / **E** özne I ile uyumsuz ve geçmiş anlamı verir ve gelecek zaman gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$Ever since Mr. Brown ---- the chair of the committee, the members ---- on a number of important decisions.$q$, array[$o$became / have agreed$o$, $o$had become / have agreed$o$, $o$became / agreed$o$, $o$becomes / were agreeing$o$, $o$will become / will agree$o$], 0, $e$1. **Ever since** sonrasında başlangıç noktası Past Simple ile verilir: **became**.
2. Ana cümle Present Perfect ile sürer: **have agreed**.

Diğer şıklar: **B** başlangıç noktası Past Simple ile verilir / **C** ever since ile ana cümle Present Perfect ister / **D** geçmiş bir başlangıç anlatılıyor ve since ile geçmişten şimdiye bir dönem anlatılır / **E** geçmiş bir başlangıç anlatılıyor ve since ile geçmişten şimdiye bir dönem anlatılır.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I'm sure you ---- the film as soon as you ---- the first scene, because everybody in my class loved it.$q$, array[$o$liked / see$o$, $o$will like / see$o$, $o$will like / will see$o$, $o$have liked / saw$o$, $o$were liking / would see$o$], 1, $e$1. Kesin gelecek tahmin **will** ile yapılır: **will like**.
2. **As soon as** sonrasında gelecek için Present Simple kullanılır: **see**.

Diğer şıklar: **A** gelecek tahmin için will gerekir / **C** as soon as sonrasında will kullanılmaz / **D** gelecek tahmin söyleniyor ve gelecek zaman cümlesi anlatılıyor / **E** durum fiili sürekli yapıda olmaz ve gelecek zaman cümlesi anlatılıyor.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The company ---- more than 200 employees when it ---- in 1998, but now it has more than 3,000.$q$, array[$o$has / opened$o$, $o$had / opens$o$, $o$is having / has opened$o$, $o$will have / was opening$o$, $o$had / opened$o$], 4, $e$1. Geçmişteki durum Past Simple ile söylenir: **had**.
2. **In 1998** belirli bir geçmiş zamandır: **opened**.

Diğer şıklar: **A** geçmişteki durum anlatılıyor / **B** 1998 geçmiştir / **C** durum fiili sürekli yapıda olmaz ve 1998 ile Present Perfect olmaz / **D** geçmiş bir zaman anlatılıyor ve tek bir başlangıç anlatılıyor.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The two friends ---- at the cafe at five, but when Ali ----, Mert had already left.$q$, array[$o$meet / arrived$o$, $o$were going to meet / had arrived$o$, $o$had met / arrives$o$, $o$were going to meet / arrived$o$, $o$would meet / has arrived$o$], 3, $e$1. Geçmişte planlanan ama gerçekleşmeyen eylem was going to ile söylenir: **were going to meet**.
2. Sonraki olay Past Simple ile verilir: **arrived**.

Diğer şıklar: **A** planlanan ama gerçekleşmeyen eylem anlatılır / **B** ikinci olay Mert'in ayrılmasından sonradır / **C** plan henüz gerçekleşmemiştir ve geçmiş anlatım gerekir / **E** geçmişte gelecek plan was going to ile belirginleşir ve geçmiş anlatım gerekir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He ---- under a lot of pressure at work for months, and the doctor says he ---- more rest.$q$, array[$o$worked / needs$o$, $o$has been working / is needing$o$, $o$has been working / needs$o$, $o$was working / needed$o$, $o$is working / will need$o$], 2, $e$1. **For months** şimdiye uzanan sürekli eylemi gösterir: **has been working**.
2. **Need** durum fiilidir ve sürekli yapıda kullanılmaz: **needs**.

Diğer şıklar: **A** for months şimdiye uzanan süreklilik ister / **B** need durum fiilidir / **D** sonuç şimdiyi etkiler ve doktorun şimdiki tavsiyesi anlatılıyor / **E** for months şimdiye uzanan süre ister ve doktor şimdi söylüyor.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$When we ---- the village last summer, the old bridge ---- by the flood, so we crossed the river by boat.$q$, array[$o$visited / had been destroyed$o$, $o$had visited / had been destroyed$o$, $o$visited / was destroying$o$, $o$were visiting / destroyed$o$, $o$visit / has been destroyed$o$], 0, $e$1. **Last summer** bitmiş bir zamandır: **visited**.
2. Ziyaretten önce yıkılan köprü Past Perfect Passive ister: **had been destroyed**.

Diğer şıklar: **B** ana olay köye gidiştir / **C** köprü eylemi yapan değil, uğrayandır / **D** eylem tek seferliktir ve köprü yıkılan nesnedir / **E** geçmiş zaman gerekir ve geçmişte bir olay anlatılıyor.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$By the end of this year, my grandfather ---- the same shop for exactly fifty years.$q$, array[$o$will own$o$, $o$will have owned$o$, $o$will have been owning$o$, $o$would have owned$o$, $o$has owned$o$], 1, $e$1. **By the end of this year** Future Perfect ister. **Own** durum fiilidir, sürekli yapı almaz: **will have owned**.

Diğer şıklar: **A** by the end of this year tamamlanan süre ister / **C** own durum fiilidir, sürekli yapıda kullanılmaz / **D** gelecek tahmin would have ile söylenmez / **E** by the end of this year gelecekteki bir noktayı gösterir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I'm sure that by the time you read this letter, I ---- on the plane for at least two hours.$q$, array[$o$will sit$o$, $o$am sitting$o$, $o$would have sat$o$, $o$will be sitting$o$, $o$will have been sitting$o$], 4, $e$1. **By the time** gelecekte bir noktayı, **for at least two hours** süreyi vurgular: **will have been sitting**.

Diğer şıklar: **A** by the time ve süre vurgusu perfect ister / **B** gelecekteki bir noktaya kadar süre anlatılıyor / **C** gelecek tahmin would have ile söylenmez / **D** süre vurgusu için perfect gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The injured driver ---- consciousness long before the ambulance reached the scene, which is why the paramedics worked so frantically.$q$, array[$o$lost$o$, $o$has lost$o$, $o$had lost$o$, $o$was losing$o$, $o$would lose$o$], 2, $e$1. **Long before** geçmişteki bir olaydan önceki eylemi gösterir: **had lost**.

Diğer şıklar: **A** ambulansın gelişinden önceki eylem Past Perfect ister / **B** geçmişteki bir noktadan öncesi anlatılıyor / **D** eylem tamamlanmıştır, long before ile Past Perfect gerekir / **E** geçmişte tamamlanmış bir olay anlatılıyor.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Scarcely had the chairman finished his speech ---- the audience rose to its feet and began to applaud.$q$, array[$o$than$o$, $o$that$o$, $o$because$o$, $o$when$o$, $o$as$o$], 3, $e$1. **Scarcely had...when** kalıbı kullanılır: **when**.

Diğer şıklar: **A** scarcely ... when kalıbı ister / **B** scarcely ... when kalıbı ister / **C** scarcely ... when kalıbı ister / **E** scarcely ... when kalıbı ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Nobody realised that the manager ---- the company's accounts for months until the auditors arrived and found the missing money.$q$, array[$o$was manipulating$o$, $o$manipulated$o$, $o$has been manipulating$o$, $o$would manipulate$o$, $o$had been manipulating$o$], 4, $e$1. **For months until** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been manipulating**.

Diğer şıklar: **A** until ile geçmişteki bir noktaya kadar süre anlatılıyor / **B** süre vurgusu için perfect continuous gerekir / **C** geçmiş anlatımda Present Perfect olmaz / **D** tamamlanmış süre anlatılıyor.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Tenses konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Tenses konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I ---- my homework yet, so I ---- you a call as soon as I finish it.$q$, array[$o$haven't finished / will give$o$, $o$didn't finish / will give$o$, $o$haven't finished / gave$o$, $o$don't finish / have given$o$, $o$wasn't finishing / was giving$o$], 0, $e$1. **Yet** olumsuz cümlede Present Perfect ister: **haven't finished**.
2. **As soon as** sonrası gelecek söz will ile söylenir: **will give**.

Diğer şıklar: **B** yet ile Present Perfect gerekir / **C** gelecek söz will ile söylenir / **D** yet ile Present Perfect gerekir ve gelecek söz will ile söylenir / **E** yet ile Present Perfect gerekir ve gelecek söz will ile söylenir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The children ---- in the garden when it ---- to rain, so they ran inside.$q$, array[$o$played / began$o$, $o$were playing / began$o$, $o$were playing / had begun$o$, $o$have played / was beginning$o$, $o$had played / begins$o$], 1, $e$1. Sürmekte olan eylem Past Continuous ile söylenir: **were playing**.
2. Kesen kısa olay Past Simple ile verilir: **began**.

Diğer şıklar: **A** sürmekte olan eylem vurgusu gerekir / **C** kısa kesen olay Past Simple ile verilir / **D** geçmiş anlatım gerekir ve kısa olay anlatılıyor / **E** arka plan eylem anlatılıyor ve geçmiş anlatım gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Water ---- at 100 degrees Celsius, and ice ---- when the temperature drops below zero.$q$, array[$o$is boiling / forms$o$, $o$boils / is forming$o$, $o$boils / forms$o$, $o$boiled / formed$o$, $o$will boil / has formed$o$], 2, $e$1. Bilimsel genel doğrular Present Simple ile söylenir: **boils**.
2. Genel doğrular Present Simple ile devam eder: **forms**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **D** genel doğru geçmiş zaman almaz ve genel doğru geçmiş zaman almaz / **E** genel doğru Present Simple ister ve genel doğru geçmiş zaman almaz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$We ---- the news yet because nobody ---- us a message since this morning.$q$, array[$o$didn't hear / has sent$o$, $o$haven't heard / sent$o$, $o$don't hear / sends$o$, $o$hadn't heard / had sent$o$, $o$haven't heard / has sent$o$], 4, $e$1. **Yet** olumsuz cümlede Present Perfect ister: **haven't heard**.
2. **Since this morning** şimdiye uzanır: **has sent**.

Diğer şıklar: **A** yet Present Perfect ister / **B** since this morning Present Perfect ister / **C** yet Present Perfect ister ve since this morning Present Perfect ister / **D** since this morning şimdiyi kapsar ve since this morning şimdiyi kapsar.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Tomorrow, my parents ---- from their holiday, and I ---- them at the airport at nine.$q$, array[$o$returned / will meet$o$, $o$are returning / will meet$o$, $o$are returning / met$o$, $o$have returned / have met$o$, $o$has returned / was meeting$o$], 1, $e$1. Önceden planlanmış yakın gelecek Present Continuous ile söylenir: **are returning**.
2. Konuşma anında verilen karar will ile söylenir: **will meet**.

Diğer şıklar: **A** tomorrow geçmiş zaman almaz / **C** tomorrow geçmiş zaman almaz / **D** tomorrow geçmiş zaman almaz ve tomorrow geçmiş zaman almaz / **E** tomorrow geçmiş zaman almaz ve tomorrow geçmiş zaman almaz.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I ---- English for five years now, but I still ---- difficulty understanding fast speakers.$q$, array[$o$learned / have$o$, $o$have been learning / had$o$, $o$have been learning / have$o$, $o$am learning / will have$o$, $o$learn / have had$o$], 2, $e$1. **For five years now** şimdiye uzanan süreyi gösterir: **have been learning**.
2. **Still** ile şimdiki durum anlatılır: **have**.

Diğer şıklar: **A** for five years now şimdiye uzanır / **B** still şimdiki durumu gösterir / **D** for five years süre vurgusu gerekir ve still şimdiki durumu gösterir / **E** süre vurgusu gerekir ve still şimdiki durumu gösterir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Last night, while I ---- the dishes, my sister ---- in to tell me the exciting news.$q$, array[$o$wash / came$o$, $o$was washing / was coming$o$, $o$have washed / had come$o$, $o$was washing / came$o$, $o$had washed / comes$o$], 3, $e$1. **While** ile süren eylem Past Continuous ile söylenir: **was washing**.
2. Kesen kısa olay Past Simple ile verilir: **came**.

Diğer şıklar: **A** süren eylem Past Continuous ister / **B** kısa olay kesen eylemdir / **C** geçmiş zaman gerekir ve kısa eylem Past Simple ile verilir / **E** süren eylem gerekir ve geçmiş zaman gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The committee ---- the proposal for three hours when the chairman finally ---- everyone for their patience.$q$, array[$o$has been discussing / thanked$o$, $o$had been discussing / thanked$o$, $o$had been discussing / has thanked$o$, $o$discussed / had thanked$o$, $o$is discussing / thanks$o$], 1, $e$1. **For three hours when...** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been discussing**.
2. Başkanın teşekkürü sonraki olaydır: **thanked**.

Diğer şıklar: **A** when sonrası geçmiş zamandır / **C** geçmiş anlatım gerekir / **D** when anında süren eylem gerekir ve ana olay Past Simple ile verilir / **E** when sonrası geçmiş zamandır ve geçmiş anlatım gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Don't worry about the tickets. I ---- them for you as soon as the box office ---- tomorrow morning.$q$, array[$o$would buy / opens$o$, $o$will buy / will open$o$, $o$bought / opened$o$, $o$have bought / has opened$o$, $o$will buy / opens$o$], 4, $e$1. Konuşma anında verilen söz will ile söylenir: **will buy**.
2. **As soon as** sonrasında gelecek için Present Simple kullanılır: **opens**.

Diğer şıklar: **A** karar o anda verilir / **B** as soon as sonrasında will kullanılmaz / **C** tomorrow ile geçmiş olmaz ve gelecek zaman cümlesi anlatılır / **D** tomorrow ile Present Perfect olmaz ve gelecek zaman cümlesi anlatılır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$My sister ---- in London since she ---- a scholarship at the university in 2020.$q$, array[$o$has lived / won$o$, $o$lived / won$o$, $o$has lived / has won$o$, $o$is living / had won$o$, $o$had lived / wins$o$], 0, $e$1. **Since** ana cümlede Present Perfect ister: **has lived**.
2. **In 2020** belirli bir geçmiş zamandır: **won**.

Diğer şıklar: **B** since ile Present Perfect gerekir / **C** 2020 ile Present Perfect olmaz / **D** since ile Present Perfect gerekir ve since sonrası Past Simple ister / **E** since şimdiyi kapsar ve 2020 geçmiştir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The workshop ---- at 10 a.m. every Monday, but this week it ---- at noon because of the holiday.$q$, array[$o$started / is starting$o$, $o$starts / starts$o$, $o$has started / started$o$, $o$starts / is starting$o$, $o$is going to start / has started$o$], 3, $e$1. **Every Monday** düzenli tekrarı gösterir: **starts**.
2. **This week** için değişen yakın plan Present Continuous ile söylenir: **is starting**.

Diğer şıklar: **A** her pazartesi tekrar eden program Present Simple ister / **B** bu hafta özel bir düzenleme anlatılıyor / **C** tekrarlayan bir program anlatılıyor ve this week gelecek planı belirtir / **E** tekrarlayan bir program anlatılıyor ve this week gelecek planı belirtir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He ---- all day on the roof, so he ---- exhausted now and wants to go to bed.$q$, array[$o$will work / is$o$, $o$has been working / was$o$, $o$works / has been$o$, $o$was working / will be$o$, $o$has been working / is$o$], 4, $e$1. **All day** ile şimdiye etkisi süren eylem Present Perfect Continuous ile söylenir: **has been working**.
2. **Now** şimdiki durumu gösterir: **is**.

Diğer şıklar: **A** all day ve now şimdiye uzanır / **B** now şimdiki durum gerektirir / **C** all day süre vurgusu gerekir ve now ile şimdiki durum söylenir / **D** sonuç şimdiyi etkiler ve şimdiki durum anlatılıyor.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The prime minister ---- a speech at the moment, and thousands of people ---- the broadcast online.$q$, array[$o$gives / are watching$o$, $o$is giving / are watching$o$, $o$is giving / watch$o$, $o$gave / watched$o$, $o$has given / have watched$o$], 1, $e$1. **At the moment** şu an süren eylemi gösterir: **is giving**.
2. Aynı anda süren ikinci eylem de Present Continuous ile söylenir: **are watching**.

Diğer şıklar: **A** at the moment Present Continuous ister / **C** aynı anda süren eylem anlatılıyor / **D** at the moment şimdiyi anlatır ve şu anda gerçekleşiyor / **E** at the moment süren eylemi gösterir ve şu anda gerçekleşiyor.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$By next summer, the engineers ---- the tunnel, and trains ---- through it for the first time.$q$, array[$o$will have completed / will run$o$, $o$complete / will run$o$, $o$will have completed / ran$o$, $o$completed / have run$o$, $o$are completing / are run$o$], 0, $e$1. **By next summer** Future Perfect ister: **will have completed**.
2. Tünelin tamamlanmasından sonraki gelecek olay will ile söylenir: **will run**.

Diğer şıklar: **B** by next summer Future Perfect ister / **C** gelecek zaman gerekir / **D** gelecekteki bir tarih belirtilir ve gelecek zaman gerekir / **E** bitiş tarihi vurgulanıyor ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Once the committee ---- its final report, the government ---- the new regulations into force without further delay.$q$, array[$o$will submit / will bring$o$, $o$has submitted / would bring$o$, $o$submitted / brought$o$, $o$has submitted / will bring$o$, $o$had submitted / is bringing$o$], 3, $e$1. **Once** sonrasında gelecek için Present Perfect gelir: **has submitted**. Ana cümle gelecektir: **will bring**.

Diğer şıklar: **A** once sonrasında gelecek için Present Perfect ya da Present Simple gelir / **B** gelecek karar will ister / **C** gelecek bir koşul anlatılıyor ve gelecek zaman ister / **E** gelecek zaman bağlamında Past Perfect olmaz ve gelecek planı will ile verilir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The report revealed that the company ---- losses for three consecutive years before the new management ---- the situation around.$q$, array[$o$was making / turned$o$, $o$had been making / would turn$o$, $o$had been making / turned$o$, $o$made / turns$o$, $o$has been making / has turned$o$], 2, $e$1. **Before** ile önce başlayan süre **had been making**, sonraki olay **turned** ile verilir.

Diğer şıklar: **A** geçmişteki bir noktadan önceki süre perfect continuous ister / **B** before sonrasında Past Simple ana olay olur / **D** süre vurgusu ve sıra bozulur ve geçmiş anlatım gerekir / **E** geçmiş anlatımda Present Perfect olmaz ve geçmiş anlatım gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$By the time we ---- the village, the rain ---- for hours, and the road was almost impassable.$q$, array[$o$have reached / had been falling$o$, $o$reached / was falling$o$, $o$reach / fell$o$, $o$were reaching / has been falling$o$, $o$reached / had been falling$o$], 4, $e$1. **By the time** sonrasında Past Simple, önceki süre **had been falling** ile verilir.

Diğer şıklar: **A** by the time sonrasında Past Simple gelir / **B** süre vurgusu için perfect continuous gerekir / **C** geçmiş anlatım gerekir ve süre vurgusu için perfect continuous gerekir / **D** by the time sonrasında tamamlanmış olay gerekir ve geçmiş anlatım gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$This time next week, the delegates ---- in the conference hall, and the opening session ---- by the president himself.$q$, array[$o$will sit / will be chaired$o$, $o$will be sitting / will chair$o$, $o$will have been sitting / is chaired$o$, $o$will be sitting / will be chaired$o$, $o$are sitting / has been chaired$o$], 3, $e$1. **This time next week** belirli bir anda süren eylemi gösterir: **will be sitting**. Oturum edilgendir: **will be chaired**.

Diğer şıklar: **A** belirli bir anda süren eylem Future Continuous ister / **B** özne session edilgen yapı ister / **C** belirli bir an için süre vurgusu yok ve gelecek bir an anlatılıyor / **E** gelecek bir an anlatılıyor ve gelecek zaman gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It is hard to believe that the same man who ---- us so much trouble last year ---- now one of our most loyal customers.$q$, array[$o$gave / is$o$, $o$has given / is$o$, $o$gave / was$o$, $o$had given / has been$o$, $o$gives / will be$o$], 0, $e$1. **Last year** Past Simple, **now** Present Simple ister: **gave / is**.

Diğer şıklar: **B** last year belirli geçmiştir / **C** now şimdiki durumu gösterir / **D** geçmişteki başka bir olaydan önceki an yok ve now şimdiki durum ister / **E** geçmiş zamanlı yan cümle gerekir ve now şimdiki durum ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$My neighbours ---- the same car for fifteen years, but next month they ---- it for a hybrid model.$q$, array[$o$had / are exchanging$o$, $o$have had / exchange$o$, $o$have had / are exchanging$o$, $o$are having / exchanged$o$, $o$have been having / have exchanged$o$], 2, $e$1. **For fifteen years** şimdiye uzanan durumu gösterir. **Have** durum fiilidir: **have had**.
2. **Next month** önceden planlanmış yakın geleceği gösterir: **are exchanging**.

Diğer şıklar: **A** for fifteen years şimdiye uzanır / **B** yakın planlı gelecek yerine genel şimdi anlatılır / **D** have durum fiilidir ve next month geçmiş zaman almaz / **E** have durum fiilidir ve next month geçmiş zaman almaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Tenses konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Tenses konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$The shop ---- at nine every morning, but this morning it ---- an hour late because of a power cut.$q$, array[$o$opened / opened$o$, $o$opens / has been opening$o$, $o$opens / opened$o$, $o$has opened / is going to open$o$, $o$is opening / will open$o$], 2, $e$1. **Every morning** düzenli tekrarı gösterir: **opens**.
2. **This morning** ile bitmiş bir sonuç Past Simple ile söylenir: **opened**.

Diğer şıklar: **A** her sabah tekrarı Present Simple ister / **B** this morning bitmiş geçmiş olaydır / **D** her sabah düzenli tekrar anlatılıyor ve power cut nedeniyle olmuş bir olaydır / **E** düzenli program anlatılıyor ve this morning geçmiş bir olaydır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I ---- Ayşe at the library yesterday, and we ---- about the exam for an hour.$q$, array[$o$have met / talked$o$, $o$met / talked$o$, $o$met / talk$o$, $o$meet / have talked$o$, $o$was meeting / are talking$o$], 1, $e$1. **Yesterday** bitmiş bir zamandır: **met**.
2. Aynı geçmiş anlatım Past Simple ile sürer: **talked**.

Diğer şıklar: **A** yesterday ile Present Perfect olmaz / **C** geçmişte bitmiş eylem anlatılıyor / **D** yesterday geçmiştir ve geçmiş anlatım gerekir / **E** bitmiş tek olay anlatılıyor ve geçmiş anlatım gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Mr. Aydın ---- in this company since 1999, and he ---- to retire next year.$q$, array[$o$has worked / is going$o$, $o$worked / is going$o$, $o$has worked / going$o$, $o$works / will go$o$, $o$is working / goes$o$], 0, $e$1. **Since 1999** şimdiye uzanır: **has worked**.
2. **Is going to retire** niyeti anlatır: **is going**.

Diğer şıklar: **B** since ile Present Perfect gerekir / **C** is going to kalıbında to gelir / **D** since ile Present Perfect gerekir ve to retire ile uyumsuz / **E** since ile Present Perfect gerekir ve to retire ile uyumsuz.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$We ---- to the countryside last weekend, and we ---- a wonderful time there.$q$, array[$o$have gone / had$o$, $o$went / have$o$, $o$go / are having$o$, $o$went / had$o$, $o$are going / will have$o$], 3, $e$1. **Last weekend** bitmiş bir zamandır: **went**.
2. Aynı geçmiş anlatım sürer: **had**.

Diğer şıklar: **A** last weekend ile Present Perfect olmaz / **B** geçmiş zaman anlatılıyor / **C** last weekend geçmiştir ve geçmiş zaman anlatılıyor / **E** last weekend geçmiştir ve geçmiş zaman anlatılıyor.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Sorry, I can't talk now. I ---- on the other line, but I ---- you back in ten minutes.$q$, array[$o$speak / will call$o$, $o$am speaking / called$o$, $o$am speaking / will call$o$, $o$spoke / have called$o$, $o$have spoken / am calling$o$], 2, $e$1. **Now** şu an süren eylemi gösterir: **am speaking**.
2. Anında verilen söz will ile söylenir: **will call**.

Diğer şıklar: **A** now ile Present Continuous gerekir / **B** söz gelecekle ilgilidir / **D** şu an süren eylemdir ve söz gelecekle ilgilidir / **E** şu an süren eylemdir ve anında verilen söz will ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$They ---- the match for ninety minutes when the referee suddenly ---- it because of the heavy fog.$q$, array[$o$have been playing / stopped$o$, $o$had been playing / had stopped$o$, $o$were playing / stops$o$, $o$played / has stopped$o$, $o$had been playing / stopped$o$], 4, $e$1. **Ninety minutes when...** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been playing**.
2. Hakemin kararı sonraki olaydır: **stopped**.

Diğer şıklar: **A** when sonrası geçmiştir / **B** ana olay Past Simple ile verilir / **C** ninety minutes süre vurgusu gerekir ve geçmiş anlatım gerekir / **D** süre vurgusu gerekir ve geçmiş anlatım gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I'm sure the parcel ---- by tomorrow afternoon, because the courier ---- it to the depot yesterday.$q$, array[$o$arrives / delivered$o$, $o$will have arrived / has delivered$o$, $o$arrived / delivers$o$, $o$will have arrived / delivered$o$, $o$has arrived / is delivering$o$], 3, $e$1. **By tomorrow afternoon** Future Perfect ister: **will have arrived**.
2. **Yesterday** bitmiş bir zamandır: **delivered**.

Diğer şıklar: **A** by tomorrow Future Perfect ister / **B** yesterday ile Present Perfect olmaz / **C** gelecekteki bir zaman anlatılıyor ve yesterday geçmiştir / **E** gelecekteki bir zaman anlatılıyor ve yesterday geçmiştir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$She ---- a lot of weight since she ---- to the gym every day last spring.$q$, array[$o$has lost / started going$o$, $o$lost / started going$o$, $o$has lost / has started going$o$, $o$loses / had started going$o$, $o$is losing / starts going$o$], 0, $e$1. **Since** ana cümlede Present Perfect ister: **has lost**.
2. **Last spring** bitmiş zamandır: **started going**.

Diğer şıklar: **B** since şimdiyi kapsar / **C** last spring geçmiştir / **D** since şimdiyi kapsar ve since sonrası Past Simple / **E** since şimdiyi kapsar ve last spring geçmiştir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$When the manager ----, all the employees ---- in the meeting room for an hour.$q$, array[$o$arrives / had been waiting$o$, $o$arrived / had been waiting$o$, $o$arrived / waited$o$, $o$has arrived / were waiting$o$, $o$was arriving / have been waiting$o$], 1, $e$1. Yöneticinin gelişi kısa bir geçmiş olaydır: **arrived**.
2. Gelişten önce süren eylem Past Perfect Continuous ile söylenir: **had been waiting**.

Diğer şıklar: **A** geçmiş olay anlatılıyor / **C** when anında süre vurgusu gerekir / **D** geçmiş olay anlatılıyor ve for an hour süre vurgusu ister / **E** kısa olay anlatılıyor ve geçmiş anlatım gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I ---- Spanish for two years, but I ---- it fluently until I move to Madrid next summer.$q$, array[$o$study / won't speak$o$, $o$have been studying / don't speak$o$, $o$am studying / didn't speak$o$, $o$study / haven't spoken$o$, $o$have been studying / won't speak$o$], 4, $e$1. **For two years** şimdiye uzanan eylemi gösterir: **have been studying**.
2. **Until I move** gelecekle ilgili bir tahmindir: **won't speak**.

Diğer şıklar: **A** for two years şimdiye uzanır / **B** until ve gelecek anlatılıyor / **C** for two years süre vurgusu gerekir ve gelecek anlatılıyor / **D** süre vurgusu gerekir ve gelecek anlatılıyor.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Unless the weather ---- by noon, the organisers ---- the outdoor concert to Sunday.$q$, array[$o$will improve / will postpone$o$, $o$improves / postponed$o$, $o$improves / will postpone$o$, $o$improved / have postponed$o$, $o$has improved / are postponing$o$], 2, $e$1. **Unless** sonrasında gelecek için Present Simple kullanılır: **improves**.
2. Sonuç gelecek karardır: **will postpone**.

Diğer şıklar: **A** unless sonrasında will kullanılmaz / **B** gelecek tahmin will ister / **D** gerçekçi koşul anlatılıyor ve gelecek tahmin will ister / **E** gerçekçi koşul anlatılıyor ve karar henüz verilmemiştir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The patient ---- better by the time the doctor ---- the results of the last blood test.$q$, array[$o$had been feeling / received$o$, $o$has been feeling / received$o$, $o$had been feeling / has received$o$, $o$is feeling / receives$o$, $o$feels / was receiving$o$], 0, $e$1. Hasta sonuçlardan önce düzelmeye başlamıştır: **had been feeling**.
2. **By the time** sonrasında geçmiş olay Past Simple ile verilir: **received**.

Diğer şıklar: **B** by the time geçmiş bir an gerektirir / **C** sonraki olay Past Simple ile verilir / **D** by the time geçmiş bir an gerektirir ve geçmiş anlatım gerekir / **E** by the time geçmiş bir an gerektirir ve tek bir tamamlanmış olay.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$At this time last year, we ---- for a new house, and we ---- one in the suburbs just a month later.$q$, array[$o$looked / found$o$, $o$were looking / had found$o$, $o$had looked / find$o$, $o$were looking / found$o$, $o$are looking / have found$o$], 3, $e$1. **At this time last year** geçmişte süren eylemi gösterir: **were looking**.
2. **A month later** ile geçmiş bir olay Past Simple ile söylenir: **found**.

Diğer şıklar: **A** belirli bir anda süren eylem gerekir / **B** a month later geçmiş olaydır / **C** geçmişteki belirli an anlatılıyor ve geçmiş anlatım gerekir / **E** last year geçmiştir ve geçmiş anlatım gerekir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The students ---- for the exam when the electricity ---- off, so they had to continue by candlelight.$q$, array[$o$studied / went$o$, $o$were studying / went$o$, $o$were studying / goes$o$, $o$have studied / has gone$o$, $o$had studied / was going$o$], 1, $e$1. Sürmekte olan eylem Past Continuous ile söylenir: **were studying**.
2. Kesen kısa olay Past Simple ile verilir: **went**.

Diğer şıklar: **A** süren eylem Past Continuous ister / **C** geçmiş anlatım gerekir / **D** geçmiş anlatım gerekir ve geçmiş anlatım gerekir / **E** süren eylem vurgulanıyor ve kısa olay Past Simple ile verilir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$No sooner ---- the new policy been announced than the employees ---- to organise a protest.$q$, array[$o$did / began$o$, $o$had / begin$o$, $o$has / had begun$o$, $o$was / were beginning$o$, $o$had / began$o$], 4, $e$1. **No sooner had...been announced than** kalıbı: **had / began**.

Diğer şıklar: **A** no sooner ile Past Perfect devrik yapı gerekir / **B** than sonrasında Past Simple gelir / **C** no sooner ile Past Perfect gerekir ve than sonrasında Past Simple gelir / **D** no sooner ile Past Perfect gerekir ve anlık olay anlatılıyor.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$I ---- you a dozen times by now if I ---- your number, but you never gave it to me.$q$, array[$o$would call / had had$o$, $o$would have called / had$o$, $o$will have called / have$o$, $o$would have called / had had$o$, $o$had called / would have$o$], 3, $e$1. **Üçüncü tip koşul**: **would have called / had had**.

Diğer şıklar: **A** by now ve geçmiş koşul would have ister / **B** geçmiş koşul Past Perfect ister / **C** gerçek dışı geçmiş anlatılıyor ve geçmiş koşul Past Perfect ister / **E** sonuç cümlesi would have ister ve if cümlesinde would olmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The scientists, who ---- on the project since 2015, are convinced that they ---- a breakthrough by the end of next year.$q$, array[$o$have been working / will have achieved$o$, $o$worked / will have achieved$o$, $o$have been working / would achieve$o$, $o$had been working / achieved$o$, $o$are working / have achieved$o$], 0, $e$1. **Since 2015** şimdiye uzanan süreyi, **by the end of next year** gelecekteki tamamlanmayı gösterir.

Diğer şıklar: **B** since şimdiye uzanır / **C** by the end of next year tamamlanma ister / **D** geçmişteki bir an belirtilmiyor ve gelecek zaman gerekir / **E** since süre vurgusu ister ve gelecek zaman gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$By the time the rescue team ---- the mountain hut, the climbers ---- almost all their supplies, and they were suffering from extreme cold.$q$, array[$o$have reached / had consumed$o$, $o$reached / consumed$o$, $o$reach / were consuming$o$, $o$were reaching / have consumed$o$, $o$reached / had consumed$o$], 4, $e$1. **By the time** sonrası **reached**, önceki eylem **had consumed** ile verilir.

Diğer şıklar: **A** by the time sonrasında Past Simple gelir / **B** önceki eylem Past Perfect ister / **C** geçmiş anlatım gerekir ve tamamlanmış önceki eylem / **D** tamamlanmış olay gerekir ve geçmiş anlatım gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$When I called her last night, she ---- the final chapter of her thesis, so she asked me to ring back later.$q$, array[$o$finished$o$, $o$was finishing$o$, $o$had finished$o$, $o$has finished$o$, $o$would finish$o$], 1, $e$1. **When** ile kesilen sürmekte olan eylem Past Continuous ile söylenir: **was finishing**.

Diğer şıklar: **A** telefon anında süren eylem Past Continuous ister / **C** ardından ring back isteği bu anlamla çelişir / **D** last night geçmiştir / **E** geçmiş anlatım gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Next September my grandparents ---- married for fifty years, and they ---- a big party for all their relatives.$q$, array[$o$have been / are throwing$o$, $o$will have been / threw$o$, $o$will have been / are throwing$o$, $o$are / have thrown$o$, $o$were / threw$o$], 2, $e$1. **Next September...fifty years** gelecekteki bir noktada süre tamamlanmasını gösterir: **will have been**.
2. Önceden planlanmış yakın gelecek Present Continuous ile söylenir: **are throwing**.

Diğer şıklar: **A** next September gelecektir / **B** gelecek plan anlatılıyor / **D** gelecek tarih ve süre vurgusu vardır ve gelecek plan anlatılıyor / **E** gelecek tarih ve süre vurgusu vardır ve gelecek plan anlatılıyor.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Tenses konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Wish Clauses konu testi 2
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I wish I ---- more free time, but I ---- very busy these days.$q$, array[$o$have / am$o$, $o$had / was$o$, $o$had / am$o$, $o$will have / would be$o$, $o$had had / had been$o$], 2, $e$1. **Wish** şimdiki dilek için Past Simple ister: **had**.
2. **These days** şimdiki durumu gösterir: **am**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** these days şimdiki durumu gösterir / **D** wish sonrasında will olmaz ve these days şimdiki durumu gösterir / **E** şimdiki dilek Past Simple ister ve these days şimdiki durumu gösterir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She wishes she ---- a car, but she ---- afford one.$q$, array[$o$had / can't$o$, $o$has / can't$o$, $o$had / mustn't$o$, $o$will have / needn't$o$, $o$would have / wouldn't$o$], 0, $e$1. **Wish** şimdiki dilek için Past Simple ister: **had**.
2. Yetersizlik **can't** ile söylenir: **can't**.

Diğer şıklar: **B** wish sonrasında Past Simple gelir / **C** yetersizlik can't ile söylenir / **D** wish sonrasında will olmaz ve yetersizlik can't ile söylenir / **E** wish sonrasında would have olmaz ve yetersizlik can't ile söylenir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I wish I ---- the answer, but I ---- no idea.$q$, array[$o$know / have$o$, $o$knew / had$o$, $o$will know / will have$o$, $o$knew / have$o$, $o$had known / would have$o$], 3, $e$1. **Wish** şimdiki dilek için Past Simple ister: **knew**.
2. Şimdiki durum Present Simple ile söylenir: **have**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** şimdiki durum Present Simple ister / **C** wish sonrasında will olmaz ve şimdiki durum Present Simple ister / **E** geçmiş dilek için kullanılır ve şimdiki durum Present Simple ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I wish it ---- raining, because I ---- to go for a walk.$q$, array[$o$stops / want$o$, $o$would stop / would want$o$, $o$stopped / had wanted$o$, $o$had stopped / will want$o$, $o$would stop / want$o$], 4, $e$1. Şikayet ve gelecek dilek **wish + would** ile verilir: **would stop**.
2. Şimdiki istek Present Simple ile söylenir: **want**.

Diğer şıklar: **A** wish sonrasında would gelir / **B** şimdiki istek Present Simple ister / **C** şikayet ve gelecek dilek would ister ve şimdiki istek Present Simple ister / **D** geçmiş dilek için kullanılır ve şimdiki istek Present Simple ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$If only I ---- to the party last night, I ---- her.$q$, array[$o$went / would have met$o$, $o$had gone / would have met$o$, $o$had gone / would meet$o$, $o$go / met$o$, $o$would go / had met$o$], 1, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **had gone**.
2. Sonuç **would have + V3** ile verilir: **would have met**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** if only sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$He wishes he ---- harder when he was a student, but now it ---- too late.$q$, array[$o$had studied / is$o$, $o$studied / is$o$, $o$had studied / was$o$, $o$studies / will be$o$, $o$would study / has been$o$], 0, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had studied**.
2. **Now** şimdiki durumu gösterir: **is**.

Diğer şıklar: **B** geçmiş pişmanlık Past Perfect ister / **C** now şimdiki durumu gösterir / **D** geçmiş pişmanlık Past Perfect ister ve now şimdiki durumu gösterir / **E** geçmiş pişmanlık için would olmaz ve now şimdiki durumu gösterir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$I wish you ---- me tomorrow, because I ---- to talk to you urgently.$q$, array[$o$called / need$o$, $o$would call / needed$o$, $o$calls / will need$o$, $o$would call / need$o$, $o$have called / had needed$o$], 3, $e$1. Gelecek dilek **wish + would** ile verilir: **would call**.
2. Şimdiki gerçek durum Present Simple ile söylenir: **need**.

Diğer şıklar: **A** gelecek dilek would ister / **B** şimdiki gerçek durum Present Simple ister / **C** wish sonrasında would gelir ve şimdiki gerçek durum Present Simple ister / **E** wish sonrasında would gelir ve şimdiki gerçek durum Present Simple ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$She talks as if she ---- everything, but she ---- very little.$q$, array[$o$knows / knows$o$, $o$knew / knew$o$, $o$knew / knows$o$, $o$had known / will know$o$, $o$would know / had known$o$], 2, $e$1. **As if** gerçek dışı durumda Past Simple ister: **knew**.
2. Gerçek durum Present Simple ile söylenir: **knows**.

Diğer şıklar: **A** gerçek dışı karşılaştırma Past Simple ister / **B** gerçek durum Present Simple ister / **D** geçmiş durum için kullanılır ve gerçek durum Present Simple ister / **E** as if sonrasında would olmaz ve gerçek durum Present Simple ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$It's high time we ---- a decision, because the deadline ---- tomorrow.$q$, array[$o$make / is$o$, $o$made / was$o$, $o$will make / has been$o$, $o$had made / would be$o$, $o$made / is$o$], 4, $e$1. **It's high time** sonrasında Past Simple gelir: **made**.
2. Tarifeli gelecek Present Simple ile söylenir: **is**.

Diğer şıklar: **A** it's high time sonrasında Past Simple gelir / **B** tomorrow gelecek bir zaman, tarife Present Simple ister / **C** it's high time sonrasında will olmaz ve tomorrow gelecek bir zaman / **D** it's high time sonrasında Past Simple gelir ve tomorrow gelecek bir zaman.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I'd rather you ---- here, because the baby ---- asleep.$q$, array[$o$don't smoke / is$o$, $o$didn't smoke / is$o$, $o$didn't smoke / was$o$, $o$won't smoke / has$o$, $o$hadn't smoked / would be$o$], 1, $e$1. **Would rather + özne** şimdiki tercih için Past Simple ister: **didn't smoke**.
2. Şimdiki durum Present Simple ile söylenir: **is**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **C** bebek şu an uyuyor, Present gerekir / **D** would rather you sonrasında Past Simple gelir ve anlam bozulur / **E** şimdiki tercih için Past Simple gelir ve şimdiki durum Present Simple ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I wish I ---- swim, but I ---- never learned how.$q$, array[$o$could / have$o$, $o$can / have$o$, $o$could / am$o$, $o$will / did$o$, $o$would / do$o$], 0, $e$1. Yetenek dileği **wish + could** ile verilir: **could**.
2. **Never** ile Present Perfect gelir: **have**.

Diğer şıklar: **B** wish sonrasında could gelir / **C** never ile Present Perfect gerekir / **D** wish sonrasında could gelir ve never ile Present Perfect gerekir / **E** yetenek için could gelir ve never ile Present Perfect gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$If only he ---- to me last week, we ---- in this mess now.$q$, array[$o$listened / wouldn't be$o$, $o$had listened / won't be$o$, $o$had listened / wouldn't be$o$, $o$listens / weren't$o$, $o$would listen / hadn't been$o$], 2, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **had listened**.
2. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** karma koşulda would gerekir / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** if only sonrasında would geçmiş pişmanlığı anlatmaz ve now şimdiki sonuç ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I wish I ---- born in a warmer country, because the winters here ---- so cold.$q$, array[$o$was / are$o$, $o$had been / were$o$, $o$were / would be$o$, $o$would be / have been$o$, $o$had been / are$o$], 4, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had been**.
2. Genel durum Present Simple ile söylenir: **are**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** genel doğru Present Simple ister / **C** şimdiki dilek için kullanılır ve genel doğru Present Simple ister / **D** wish sonrasında would be anlam bozar ve genel doğru Present Simple ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He talks as if he ---- the boss, although he ---- only an assistant.$q$, array[$o$were / is$o$, $o$is / is$o$, $o$were / were$o$, $o$will be / had been$o$, $o$had been / would be$o$], 0, $e$1. **As if** gerçek dışı durumda Past Simple ister: **were**.
2. Gerçek durum Present Simple ile söylenir: **is**.

Diğer şıklar: **B** gerçek dışı karşılaştırma Past Simple ister / **C** gerçek durum Present Simple ister / **D** gerçek dışı karşılaştırma Past Simple ister ve gerçek durum Present Simple ister / **E** geçmiş durum için kullanılır ve gerçek durum Present Simple ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I wish I ---- you the truth yesterday, but I ---- scared.$q$, array[$o$told / was$o$, $o$had told / am$o$, $o$had told / was$o$, $o$tell / have been$o$, $o$would tell / would be$o$], 2, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had told**.
2. **Yesterday** geçmiş zamanı gösterir: **was**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** yesterday geçmiş zamanı gösterir / **D** geçmiş pişmanlık Past Perfect ister ve yesterday geçmiş zamanı gösterir / **E** geçmiş pişmanlık için would olmaz ve yesterday geçmiş zamanı gösterir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I would rather you ---- the matter with anybody else until the committee has made its decision.$q$, array[$o$don't discuss$o$, $o$won't discuss$o$, $o$hadn't discussed$o$, $o$didn't discuss$o$, $o$wouldn't discuss$o$], 3, $e$1. **Would rather + özne + Past Simple**: **didn't discuss**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **B** would rather you sonrasında will olmaz / **C** şimdiki tercih için Past Simple gelir / **E** would rather you sonrasında would olmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The accident happened last week, and I would rather you ---- me about it before I read it in the newspaper.$q$, array[$o$told$o$, $o$had told$o$, $o$tell$o$, $o$would tell$o$, $o$have told$o$], 1, $e$1. **Would rather + özne + Past Perfect** (geçmiş): **had told**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** would rather you sonrasında Past gelir / **D** would rather you sonrasında would olmaz / **E** biçim yanlış.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I wish I ---- more careful with the money when I was younger, because now I ---- in such financial difficulty.$q$, array[$o$was / wouldn't be$o$, $o$had been / won't be$o$, $o$were / am not$o$, $o$would be / hadn't been$o$, $o$had been / wouldn't be$o$], 4, $e$1. **Wish + Past Perfect**, **now** şimdiki sonuç: **had been / wouldn't be**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** karma koşulda would ister / **C** şimdiki dilek için kullanılır ve gerçek dışı sonuç would ister / **D** geçmiş pişmanlık için would olmaz ve now şimdiki sonuç ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$It's about time the government ---- the problem seriously instead of pretending that it ---- exist.$q$, array[$o$takes / didn't$o$, $o$took / wouldn't$o$, $o$will take / won't$o$, $o$took / didn't$o$, $o$had taken / hasn't$o$], 3, $e$1. **It's about time + Past Simple**, **pretend that + Past Simple**.

Diğer şıklar: **A** it's about time sonrasında Past Simple gelir / **B** pretending that sonrasında Past Simple gelir / **C** it's about time sonrasında will olmaz ve pretending that sonrasında Past Simple gelir / **E** it's about time sonrasında Past Simple gelir ve pretending that sonrasında Past Simple gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The manager behaves as though he ---- everything about the business, although in reality he ---- very little about it.$q$, array[$o$knows / knows$o$, $o$knew / knows$o$, $o$knew / knew$o$, $o$had known / had known$o$, $o$would know / would know$o$], 1, $e$1. **As though + Past Simple**, gerçek durum Present Simple.

Diğer şıklar: **A** as though gerçek dışı Past Simple ister / **C** gerçek durum Present Simple ister / **D** geçmiş durum için kullanılır ve gerçek durum Present Simple ister / **E** as though sonrasında would olmaz ve gerçek durum Present Simple ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Wish Clauses konu testi 2$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Wish Clauses konu testi 3
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I wish I ---- taller, but I'm only 1.60 metres, and I wish I ---- play basketball.$q$, array[$o$am / could$o$, $o$were / can$o$, $o$will be / would$o$, $o$had been / will$o$, $o$were / could$o$], 4, $e$1. **Wish** şimdiki dilek için Past Simple ister: **were**.
2. Yetenek dileği **wish + could** ile verilir: **could**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** wish sonrasında could gelir / **C** wish sonrasında will olmaz ve yetenek için could gelir / **D** geçmiş pişmanlık için kullanılır ve wish sonrasında could gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If only I ---- a bigger house, we could invite all our friends, and I ---- so cramped.$q$, array[$o$had / wouldn't feel$o$, $o$have / wouldn't feel$o$, $o$had / won't feel$o$, $o$will have / didn't feel$o$, $o$would have / haven't felt$o$], 0, $e$1. **If only** şimdiki dilek için Past Simple ister: **had**.
2. Sonuç **would + V1** ile verilir: **wouldn't feel**.

Diğer şıklar: **B** if only şimdiki dilek Past Simple ister / **C** gerçek dışı sonuç would ister / **D** if only sonrasında will olmaz ve sonuç cümlesi would ister / **E** if only sonrasında would have olmaz ve sonuç cümlesi would ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I wish I ---- my keys yesterday. Now I ---- break the window to get in.$q$, array[$o$didn't lose / have to$o$, $o$hadn't lost / have to$o$, $o$hadn't lost / had to$o$, $o$don't lose / must$o$, $o$wouldn't lose / will have$o$], 1, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **hadn't lost**.
2. **Now** şimdiki zorunluluk gösterir: **have to**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** now şimdiki zorunluluk gösterir / **D** geçmiş pişmanlık Past Perfect ister ve now şimdiki zorunluluk gösterir, ancak have to ister / **E** geçmiş pişmanlık için would olmaz ve anlam bozulur.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$She wishes her brother ---- more helpful, because he never ---- with the housework.$q$, array[$o$is / helps$o$, $o$were / helped$o$, $o$will be / will help$o$, $o$had been / has helped$o$, $o$were / helps$o$], 4, $e$1. **Wish** şimdiki dilek için Past Simple ister: **were**.
2. Genel durum Present Simple ile söylenir: **helps**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** never genel durum Present Simple ister / **C** wish sonrasında will olmaz ve never genel durum Present Simple ister / **D** geçmiş pişmanlık için kullanılır ve never genel durum Present Simple ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$I'd rather you ---- late tonight, because we ---- an early start tomorrow.$q$, array[$o$don't stay / have$o$, $o$didn't stay / had$o$, $o$won't stay / will have$o$, $o$didn't stay / have$o$, $o$hadn't stayed / would have$o$], 3, $e$1. **Would rather + özne** şimdiki tercih için Past Simple ister: **didn't stay**.
2. Planlı gelecek Present ile verilir: **have**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **B** tomorrow gelecek zaman, planlı gelecek ister / **C** would rather you sonrasında Past Simple gelir ve anlam ters yönde / **E** şimdiki tercih için Past Simple gelir ve anlam ters yönde.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I wish the neighbours ---- out next month, because I ---- sleep at night.$q$, array[$o$would move / can't$o$, $o$moved / can't$o$, $o$would move / couldn't$o$, $o$move / won't$o$, $o$had moved / mustn't$o$], 0, $e$1. Gelecek dilek **wish + would** ile verilir: **would move**.
2. Şimdiki yetersizlik **can't** ile söylenir: **can't**.

Diğer şıklar: **B** gelecek dilek would ister / **C** şimdiki durum can't ile söylenir / **D** wish sonrasında would gelir ve şimdiki durum can't ile söylenir / **E** geçmiş dilek için kullanılır ve şimdiki durum can't ile söylenir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He looked at me as though he ---- me before, although we ---- never met.$q$, array[$o$saw / had$o$, $o$had seen / were$o$, $o$had seen / had$o$, $o$sees / would have$o$, $o$would see / did$o$], 2, $e$1. **As though** geçmişteki gerçek dışı durumda Past Perfect ister: **had seen**.
2. Geçmiş anlatımda Past Perfect: **had**.

Diğer şıklar: **A** geçmişteki bir durum Past Perfect ister / **B** geçmişteki durum Past Perfect ister / **D** geçmişteki bir durum Past Perfect ister ve geçmişteki durum Past Perfect ister / **E** as though sonrasında would olmaz ve geçmişteki durum Past Perfect ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$If only she ---- me what was going on, I ---- her.$q$, array[$o$told / could have helped$o$, $o$had told / could help$o$, $o$tells / helped$o$, $o$would tell / had helped$o$, $o$had told / could have helped$o$], 4, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **had told**.
2. Sonuç **could have + V3** ile verilir: **could have helped**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** geçmiş sonuç could have + V3 ister / **C** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi could ister / **D** if only sonrasında would olmaz ve sonuç cümlesi could ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$It's time we ---- looking for a new flat, because the lease ---- next month.$q$, array[$o$started / expires$o$, $o$start / expires$o$, $o$started / expired$o$, $o$will start / has expired$o$, $o$had started / is expiring$o$], 0, $e$1. **It's time** sonrasında Past Simple gelir: **started**.
2. Tarifeli gelecek Present Simple ile söylenir: **expires**.

Diğer şıklar: **B** it's time sonrasında Past Simple gelir / **C** next month gelecek zaman ister / **D** it's time sonrasında will olmaz ve next month gelecek zaman ister / **E** it's time sonrasında Past Simple gelir ve tarife için Present Simple tercih edilir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I wish I ---- more attention in class last year. I ---- much better results now.$q$, array[$o$paid / would have$o$, $o$had paid / will have$o$, $o$pay / had$o$, $o$had paid / would have$o$, $o$would pay / have$o$], 3, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had paid**.
2. Şimdiki sonuç **would + V1** ile verilir: **would have**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** gerçek dışı sonuç would ister / **C** geçmiş pişmanlık Past Perfect ister ve gerçek dışı sonuç would ister / **E** geçmiş pişmanlık için would olmaz ve gerçek dışı sonuç would ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I wish I ---- a doctor when I was young. I ---- much more money now.$q$, array[$o$became / would earn$o$, $o$had become / will earn$o$, $o$had become / would earn$o$, $o$become / earned$o$, $o$would become / have earned$o$], 2, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had become**.
2. Şimdiki sonuç **would + V1** ile verilir: **would earn**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** gerçek dışı karma sonuç would ister / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** geçmiş pişmanlık için would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She spends money as though she ---- a millionaire, but in fact she ---- a modest salary.$q$, array[$o$is / earns$o$, $o$were / earns$o$, $o$were / earned$o$, $o$will be / had earned$o$, $o$had been / would earn$o$], 1, $e$1. **As though** gerçek dışı durumda Past Simple ister: **were**.
2. Gerçek durum Present Simple ile söylenir: **earns**.

Diğer şıklar: **A** gerçek dışı karşılaştırma Past Simple ister / **C** gerçek şimdiki durum Present Simple ister / **D** gerçek dışı karşılaştırma Past Simple ister ve gerçek şimdiki durum Present Simple ister / **E** geçmiş durum için kullanılır ve gerçek şimdiki durum Present Simple ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$I wish he ---- the contract tomorrow, because the company ---- him urgently.$q$, array[$o$signed / needs$o$, $o$would sign / needed$o$, $o$signs / will need$o$, $o$would sign / needs$o$, $o$had signed / had needed$o$], 3, $e$1. Gelecek dilek **wish + would** ile verilir: **would sign**.
2. Şimdiki gerçek durum Present Simple ile söylenir: **needs**.

Diğer şıklar: **A** gelecek dilek would ister / **B** şimdiki gerçek durum Present Simple ister / **C** wish sonrasında would gelir ve şimdiki gerçek durum Present Simple ister / **E** geçmiş dilek için kullanılır ve şimdiki gerçek durum Present Simple ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It's about time he ---- a job, because his savings ---- almost gone.$q$, array[$o$finds / are$o$, $o$found / were$o$, $o$found / are$o$, $o$will find / will be$o$, $o$had found / have been$o$], 2, $e$1. **It's about time** sonrasında Past Simple gelir: **found**.
2. Şimdiki durum Present Simple ile söylenir: **are**.

Diğer şıklar: **A** it's about time sonrasında Past Simple gelir / **B** almost gone şimdiki durumu gösterir / **D** it's about time sonrasında will olmaz ve şimdiki durumu gösterir / **E** it's about time sonrasında Past Simple gelir ve almost gone ile are gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$If only we ---- the map with us. We ---- lost now.$q$, array[$o$took / wouldn't be$o$, $o$had taken / won't be$o$, $o$take / aren't$o$, $o$would take / weren't$o$, $o$had taken / wouldn't be$o$], 4, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **had taken**.
2. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** karma koşulda would ister / **C** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **D** if only sonrasında would olmaz ve now şimdiki sonuç, would ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If only the driver ---- more attention to the road, the accident ---- and the children would still be alive.$q$, array[$o$paid / would not have happened$o$, $o$had paid / would not have happened$o$, $o$had paid / would not happen$o$, $o$pays / did not happen$o$, $o$would pay / has not happened$o$], 1, $e$1. **If only + Past Perfect**, sonuç **would not have happened**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** if only sonrasında would geçmiş pişmanlığı anlatmaz ve geçmiş sonuç perfect ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She wishes she ---- the courage to tell him the truth, because she ---- his reaction for the last three months.$q$, array[$o$has / has been dreading$o$, $o$had / dreaded$o$, $o$had / has been dreading$o$, $o$would have / is dreading$o$, $o$will have / had dreaded$o$], 2, $e$1. **Wish + Past Simple**, **for the last three months**: **has been dreading**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** for the last three months şimdiye uzanır / **D** wish sonrasında would have olmaz ve süre vurgusu ister / **E** wish sonrasında will olmaz ve şimdiye uzanan süre ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I wish the manager ---- our proposal at the meeting tomorrow. If he does, we ---- the funding we need.$q$, array[$o$would approve / will get$o$, $o$approved / will get$o$, $o$would approve / would get$o$, $o$approves / got$o$, $o$had approved / have got$o$], 0, $e$1. **Gelecek dilek**: **would approve**, **gerçekçi koşul**: **will get**.

Diğer şıklar: **B** gelecek dilek would ister / **C** if he does gerçekçi koşul will ister / **D** wish sonrasında would gelir ve gerçekçi koşul will ister / **E** geçmiş dilek anlamı verir ve gerçekçi koşul will ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He looked at me as though I ---- a ghost, and for a moment I wondered whether I ---- something wrong.$q$, array[$o$am / had done$o$, $o$were / would do$o$, $o$was / do$o$, $o$were / had done$o$, $o$had been / have done$o$], 3, $e$1. **As though + were**, **wondered whether + had done**.

Diğer şıklar: **A** as though gerçek dışı Past Simple ister / **B** wonder ile geçmişteki eylem Past Perfect ister / **C** resmi were tercih edilir ve geçmiş anlatım gerekir / **E** geçmiş durum için kullanılır ve geçmiş anlatım gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$If only I ---- the chance to start my life again, I ---- the same mistakes.$q$, array[$o$have / wouldn't make$o$, $o$had / wouldn't make$o$, $o$had / won't make$o$, $o$would have / didn't make$o$, $o$will have / wouldn't have made$o$], 1, $e$1. **If only + Past Simple**, sonuç **would**.

Diğer şıklar: **A** if only şimdiki dilek Past Simple ister / **C** gerçek dışı sonuç would ister / **D** if only sonrasında would have olmaz ve sonuç cümlesi would ister / **E** if only sonrasında will olmaz ve şimdiki gerçek dışılık would + V1 ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Wish Clauses konu testi 3$t$ and q.set_id = s.id and q.position = v.position;

-- ydt | konu | ydt-dil | Wish Clauses konu testi 4
update public.questions q
set stem = v.stem, options = v.options, correct = v.correct, explanation = v.explanation, difficulty = v.difficulty
from public.question_sets s, (values
  (1, 'ydt-dil', null::integer, $q$I wish I ---- a bicycle, but my parents ---- me one next month, so I will be happy soon.$q$, array[$o$have / will buy$o$, $o$had / didn't buy$o$, $o$had / will buy$o$, $o$will have / bought$o$, $o$would have / have bought$o$], 2, $e$1. **Wish** şimdiki dilek için Past Simple ister: **had**.
2. Gelecek plan **will + V1** ile verilir: **will buy**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** next month gelecek zaman ister / **D** wish sonrasında will olmaz ve next month gelecek zaman ister / **E** wish sonrasında would have olmaz ve next month gelecek zaman ister.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If only it ---- raining, we ---- go to the beach.$q$, array[$o$stopped / could$o$, $o$stops / could$o$, $o$stopped / can$o$, $o$will stop / will$o$, $o$had stopped / must$o$], 0, $e$1. **If only** şimdiki dilek için Past Simple ister: **stopped**.
2. Gerçek dışı olanak **could** ile söylenir: **could**.

Diğer şıklar: **B** if only sonrası Past Simple gelir / **C** if only ile gerçek dışı could gelir / **D** if only sonrasında will olmaz ve if only ile gerçek dışı could gelir / **E** geçmiş dilek için kullanılır ve if only ile gerçek dışı could gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$She wishes she ---- how to cook, but she ---- never learned.$q$, array[$o$knows / has$o$, $o$knew / had$o$, $o$will know / did$o$, $o$had known / does$o$, $o$knew / has$o$], 4, $e$1. **Wish** şimdiki dilek için Past Simple ister: **knew**.
2. **Never** ile Present Perfect gelir: **has**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** never ile şimdiki zaman Present Perfect ister / **C** wish sonrasında will olmaz ve never ile Present Perfect ister / **D** geçmiş dilek için kullanılır ve never ile Present Perfect ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I wish I ---- harder last year. I ---- the exam if I had.$q$, array[$o$studied / would have passed$o$, $o$had studied / would have passed$o$, $o$had studied / would pass$o$, $o$study / passed$o$, $o$would study / had passed$o$], 1, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had studied**.
2. Geçmiş sonuç **would have + V3** ile verilir: **would have passed**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** geçmiş pişmanlık için would olmaz ve sonuç cümlesi would ister.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$It's time we ---- home, because it ---- getting dark.$q$, array[$o$go / is$o$, $o$went / was$o$, $o$will go / has been$o$, $o$went / is$o$, $o$had gone / will be$o$], 3, $e$1. **It's time** sonrasında Past Simple gelir: **went**.
2. Şu an süren değişim **is getting** ile söylenir: **is**.

Diğer şıklar: **A** it's time sonrasında Past Simple gelir / **B** şimdiki durum Present ister / **C** it's time sonrasında will olmaz ve şimdiki durum Present Continuous ister / **E** it's time sonrasında Past Simple gelir ve şimdiki durum anlatılıyor.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I wish my sister ---- my clothes without asking in future, because she ---- them dirty every time.$q$, array[$o$wouldn't borrow / returns$o$, $o$didn't borrow / returns$o$, $o$wouldn't borrow / returned$o$, $o$doesn't borrow / will return$o$, $o$hasn't borrowed / has returned$o$], 0, $e$1. Gelecek dilek **wish + would** ile verilir: **wouldn't borrow**.
2. **Every time** genel durum Present Simple ister: **returns**.

Diğer şıklar: **B** gelecek dilek would ister / **C** every time genel durum Present Simple ister / **D** wish sonrasında would gelir ve every time genel durum Present Simple ister / **E** wish sonrasında would gelir ve every time genel durum Present Simple ister.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$You look as though you ---- a ghost. What ---- happened?$q$, array[$o$see / has$o$, $o$had seen / had$o$, $o$would see / have$o$, $o$will see / is$o$, $o$had seen / has$o$], 4, $e$1. **As though** geçmişteki gerçek dışı duruma Past Perfect ister: **had seen**.
2. **What has happened** kalıbı kullanılır: **has**.

Diğer şıklar: **A** as though sonrasında Past Perfect gelir / **B** what + Present Perfect gerekir / **C** as though sonrasında would olmaz ve what tekil, has gelir / **D** as though sonrasında will olmaz ve what has happened kalıbı.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'd rather you ---- me the truth than ---- to me.$q$, array[$o$tell / lied$o$, $o$told / to lie$o$, $o$told / lied$o$, $o$will tell / lying$o$, $o$had told / had lied$o$], 2, $e$1. **Would rather + özne** Past Simple ister: **told**.
2. Karşılaştırmada aynı zaman gelir: **lied**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **B** than sonrasında Past Simple gelir / **D** would rather you sonrasında will olmaz ve than sonrasında Past Simple gelir / **E** şimdiki tercih için Past Simple gelir ve than ile Past Simple verilir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He wishes he ---- more friends, because he ---- lonely at the moment.$q$, array[$o$has / feels$o$, $o$had / feels$o$, $o$had / felt$o$, $o$will have / has felt$o$, $o$would have / will feel$o$], 1, $e$1. **Wish** şimdiki dilek için Past Simple ister: **had**.
2. **At the moment** şimdiki durumu gösterir: **feels**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **C** at the moment şimdiki durumu gösterir / **D** wish sonrasında will olmaz ve şimdiki durumu gösterir / **E** wish sonrasında would have olmaz ve şimdiki durumu gösterir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$If only I ---- you the secret yesterday. Now everybody ---- it.$q$, array[$o$didn't tell / knows$o$, $o$hadn't told / knew$o$, $o$haven't told / had known$o$, $o$hadn't told / knows$o$, $o$wouldn't tell / will know$o$], 3, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **hadn't told**.
2. **Now** şimdiki durumu gösterir: **knows**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** now şimdiki durumu gösterir / **C** geçmiş pişmanlık Past Perfect ister ve now şimdiki durumu gösterir / **E** if only sonrasında would geçmiş pişmanlığı anlatmaz ve now şimdiki durumu gösterir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She wishes she ---- join us, but she ---- a prior engagement.$q$, array[$o$could / has$o$, $o$can / has$o$, $o$could / had$o$, $o$will / will have$o$, $o$would / would have$o$], 0, $e$1. Olanak dileği **wish + could** ile verilir: **could**.
2. Şimdiki durum Present Simple ile söylenir: **has**.

Diğer şıklar: **B** wish sonrasında could gelir / **C** şimdiki durum Present Simple ister / **D** wish sonrasında could gelir ve şimdiki durum Present Simple ister / **E** yetenek için could gelir ve şimdiki durum Present Simple ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I wish I ---- the answer to that question. I ---- a good mark if I knew it.$q$, array[$o$know / would get$o$, $o$knew / would get$o$, $o$knew / will get$o$, $o$had known / got$o$, $o$would know / have got$o$], 1, $e$1. **Wish** şimdiki dilek için Past Simple ister: **knew**.
2. Gerçek dışı sonuç **would + V1** ile verilir: **would get**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **C** gerçek dışı sonuç would ister / **D** şimdiki dilek Past Simple ister ve sonuç cümlesi would ister / **E** wish sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$If only the weather ---- better, we ---- the picnic outdoors.$q$, array[$o$is / could have$o$, $o$were / can have$o$, $o$were / could have$o$, $o$will be / will have$o$, $o$had been / must have$o$], 2, $e$1. **If only** şimdiki dilek için Past Simple ister: **were**.
2. Gerçek dışı olanak **could** ile söylenir: **could have**.

Diğer şıklar: **A** if only şimdiki dilek Past Simple ister / **B** gerçek dışı olanak could ister / **D** if only sonrasında will olmaz ve gerçek dışı olanak could ister / **E** geçmiş dilek için kullanılır ve gerçek dışı olanak could ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It's time you ---- about your future, and I'd rather you ---- it seriously.$q$, array[$o$think / took$o$, $o$thought / take$o$, $o$will think / will take$o$, $o$thought / took$o$, $o$had thought / had taken$o$], 3, $e$1. **It's time** sonrasında Past Simple gelir: **thought**.
2. **Would rather + özne** Past Simple ister: **took**.

Diğer şıklar: **A** it's time sonrasında Past Simple gelir / **B** would rather you sonrasında Past Simple gelir / **C** it's time sonrasında will olmaz ve would rather you sonrasında will olmaz / **E** it's time sonrasında Past Simple gelir ve şimdiki tercih için Past Simple gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I wish I ---- more patient as a child. I ---- many mistakes since then.$q$, array[$o$was / have made$o$, $o$had been / made$o$, $o$were / had made$o$, $o$would be / make$o$, $o$had been / have made$o$], 4, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had been**.
2. **Since then** Present Perfect ister: **have made**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** since then Present Perfect ister / **C** geçmiş pişmanlık Past Perfect ister ve since then Present Perfect ister / **D** geçmiş pişmanlık için would olmaz ve since then Present Perfect ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I'd rather you ---- the window open. It's freezing in here.$q$, array[$o$don't leave$o$, $o$didn't leave$o$, $o$won't leave$o$, $o$haven't left$o$, $o$wouldn't leave$o$], 1, $e$1. **Would rather you + Past Simple**: **didn't leave**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **C** would rather you sonrasında will olmaz / **D** şimdiki tercih için Past Simple gelir / **E** would rather you sonrasında would olmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Her colleagues treated her as if she ---- the one responsible for the failure, although the report clearly showed that she ----.$q$, array[$o$is / hadn't been$o$, $o$were / hasn't been$o$, $o$had been / isn't$o$, $o$were / hadn't been$o$, $o$would be / weren't$o$], 3, $e$1. **As if + were**, **showed that she hadn't been**.

Diğer şıklar: **A** as if gerçek dışı Past Simple ister / **B** report geçmişten önceki durum Past Perfect ister / **C** geçmiş durum için kullanılır ve geçmiş anlatım gerekir / **E** as if sonrasında would olmaz ve geçmişten önceki durum Past Perfect ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I regret not ---- the offer when I had the chance. I wish I ---- it without hesitation.$q$, array[$o$accepting / had accepted$o$, $o$to accept / had accepted$o$, $o$accepting / accepted$o$, $o$having accepted not / would accept$o$, $o$accepted / accept$o$], 0, $e$1. **Regret + not + gerund**, **wish + had accepted**.

Diğer şıklar: **B** regret sonrasında gerund gelir / **C** geçmiş pişmanlık Past Perfect ister / **D** sıra bozulur ve geçmiş pişmanlık için would olmaz / **E** regret sonrasında gerund gelir ve wish sonrasında Past gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$We missed the deadline last year, and the manager says it is high time we ---- better at planning ahead.$q$, array[$o$get$o$, $o$will get$o$, $o$got$o$, $o$had got$o$, $o$would get$o$], 2, $e$1. **It's high time + Past Simple**: **got**.

Diğer şıklar: **A** it's high time sonrasında Past Simple gelir / **B** it's high time sonrasında will olmaz / **D** it's high time sonrasında Past Simple gelir / **E** it's high time sonrasında would olmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She wishes her parents ---- more time with her when she was a child, but she never blames them for it.$q$, array[$o$spent$o$, $o$spend$o$, $o$would spend$o$, $o$have spent$o$, $o$had spent$o$], 4, $e$1. **Wish + Past Perfect**: **had spent**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** wish sonrasında Past gelir / **C** geçmiş pişmanlık için would olmaz / **D** biçim yanlış.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
where s.exam = 'YDT' and s.kind = 'konu' and s.subject_id = 'ydt-dil' and s.title = $t$Wish Clauses konu testi 4$t$ and q.set_id = s.id and q.position = v.position;

