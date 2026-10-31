-- 20261026020000_questions_ydt_gramer_2. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Adjectives konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adjectives konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adjectives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The soup tastes ---- and the bread smells ---- in the kitchen.$q$, array[$o$deliciously / fresh$o$, $o$delicious / freshly$o$, $o$delicacy / freshness$o$, $o$delicious / fresh$o$, $o$delight / freshen$o$], 3, $e$1. **Taste** ve **smell** duyu fiilleridir, arkasından sıfat gelir: **delicious** ve **fresh**.

Diğer şıklar: **A** taste sonrasında sıfat gelir / **B** smell sonrasında sıfat gelir / **C** taste sonrasında sıfat gelir ve smell sonrasında sıfat gelir / **E** taste sonrasında sıfat gelir ve smell sonrasında sıfat gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$It was ---- a cold day that we stayed at home, and the wind was ---- strong that some trees fell down.$q$, array[$o$so / so$o$, $o$such / such$o$, $o$too / very$o$, $o$very / too$o$, $o$such / so$o$], 4, $e$1. **Such a + sıfat + isim** kalıbı: **such**.
2. **So + sıfat + that** kalıbı: **so**.

Diğer şıklar: **A** such a + sıfat + isim kalıbı gerekir / **B** sıfattan önce so gelir / **C** such a + sıfat + isim kalıbı gerekir ve that sonucu için so gerekir / **D** that sonucu için such ya da so gerekir ve that sonucu için so gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$It was a ---- journey, and we stayed in a ---- hotel.$q$, array[$o$ten-hours / five-stars$o$, $o$ten hours / five stars$o$, $o$ten-hour / five-star$o$, $o$ten-hour / five stars$o$, $o$ten hours / five-star$o$], 2, $e$1. Sayı içeren birleşik sıfatlarda isim tekil kalır ve tire kullanılır: **ten-hour** ve **five-star**.

Diğer şıklar: **A** birleşik sıfatlarda sayı çoğul olmaz / **B** birleşik sıfat tire ile yazılır ve tekil kalır / **D** birleşik sıfatlarda sayı çoğul olmaz / **E** birleşik sıfatlarda sayı çoğul olmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$I have ---- interesting to tell you, and there isn't ---- new in the newspaper today.$q$, array[$o$something / anything$o$, $o$anything / anything$o$, $o$something / something$o$, $o$any / some$o$, $o$some / nothing$o$], 0, $e$1. Olumlu cümlede **something interesting** kullanılır.
2. Olumsuz cümlede **anything new** kullanılır.

Diğer şıklar: **B** olumlu cümlede something gerekir / **C** olumsuz cümlede anything gerekir / **D** bileşik zamir gerekir ve olumsuz cümlede anything gerekir / **E** bileşik zamir gerekir ve isn't ile nothing çift olumsuzluk yapar.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$She bought a ---- vase from the market, and he gave her a ---- ring for her birthday.$q$, array[$o$Chinese old beautiful / small gold$o$, $o$old beautiful Chinese / gold small$o$, $o$beautiful old Chinese / gold small$o$, $o$Chinese beautiful old / small gold$o$, $o$beautiful old Chinese / small gold$o$], 4, $e$1. Sıfat sırası: görüş, boyut, yaş, renk, köken, madde.
2. **Beautiful old Chinese** vazo ve **small gold** yüzük bu sıraya uyar.

Diğer şıklar: **A** sıfat sırası: görüş, yaş, köken / **B** sıfat sırası: görüş yaştan önce, boyut maddeden önce / **C** sıfat sırası: boyut maddeden önce gelir / **D** sıfat sırası: köken en sonda gelir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$They live in a ---- cottage, and he drives a ---- car.$q$, array[$o$stone little lovely / big black German$o$, $o$little lovely stone / German black big$o$, $o$lovely little stone / big black German$o$, $o$lovely little stone / German big black$o$, $o$lovely stone little / black big German$o$], 2, $e$1. Sıfat sırası: görüş, boyut, yaş, renk, köken, madde.
2. **Lovely little stone** ve **big black German** bu sıraya uyar.

Diğer şıklar: **A** sıfat sırası bozulmuş / **B** sıfat sırası bozulmuş / **D** köken boyut ve renkten önce gelmez / **E** sıfat sırası bozulmuş.$e$, 3),
  (7, 'ydt-dil', null::integer, $q$He isn't ---- to drive a car, and this room isn't ---- for twenty people.$q$, array[$o$enough old / big enough$o$, $o$old enough / enough big$o$, $o$enough old / enough big$o$, $o$old enough / big enough$o$, $o$too old / too big$o$], 3, $e$1. **Enough** sıfattan sonra gelir: **old enough** ve **big enough**.

Diğer şıklar: **A** enough sıfattan sonra gelir / **B** enough sıfattan sonra gelir / **C** enough sıfattan sonra gelir / **E** too olumsuz anlamlı ve to-infinitive ile uyumlu değildir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$Society should look after ---- and ----.$q$, array[$o$elderly / disabled$o$, $o$the elderly / the disabled$o$, $o$the elderlies / the disableds$o$, $o$an elderly / a disabled$o$, $o$elderlies / disableds$o$], 1, $e$1. **The + sıfat** bir insan grubunu anlatır: **the elderly** ve **the disabled**.

Diğer şıklar: **A** sıfatla grup anlatmak için the gerekir / **C** bu sıfatlar çoğul takısı almaz / **D** grubu anlatmak için the + sıfat gerekir / **E** bu sıfatlar çoğul takısı almaz.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The students listened ---- to the teacher, and the lesson sounded ---- to them.$q$, array[$o$carefully / interesting$o$, $o$careful / interesting$o$, $o$carefully / interestingly$o$, $o$care / interest$o$, $o$carefulness / interested$o$], 0, $e$1. Eylemi niteleyen zarf gerekir: **carefully**.
2. **Sound** duyu fiilidir, sıfat gerekir: **interesting**.

Diğer şıklar: **B** listen fiilini zarf niteler / **C** sound sonrasında sıfat gelir / **D** listen fiilini zarf niteler ve sound sonrasında sıfat gelir / **E** listen fiilini zarf niteler ve dersi niteleyen sıfat -ing biçimindedir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The ---- baby is in the next room, and the baby is ---- now.$q$, array[$o$asleep / asleep$o$, $o$sleeping / sleeping$o$, $o$sleeping / asleep$o$, $o$sleep / sleep$o$, $o$slept / slept$o$], 2, $e$1. İsimden önce **sleeping** kullanılır.
2. **Be** fiilinden sonra **asleep** kullanılır.

Diğer şıklar: **A** asleep isimden önce kullanılmaz / **B** be fiilinden sonra asleep kullanılır / **D** isimden önce sıfat gerekir ve be fiilinden sonra sıfat gerekir / **E** isimden önce sıfat gerekir ve be fiilinden sonra sıfat gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The news made her very ----, and the loud music kept me ---- all night.$q$, array[$o$sadly / awake$o$, $o$sad / awake$o$, $o$sad / awaken$o$, $o$sadness / waking$o$, $o$sadden / wake$o$], 1, $e$1. **Make + nesne + sıfat** kalıbı: **sad**.
2. **Keep + nesne + sıfat** kalıbı: **awake**.

Diğer şıklar: **A** make sonrasında sıfat gelir / **C** keep sonrasında sıfat gelir / **D** make sonrasında sıfat gelir ve keep sonrasında sıfat gelir / **E** make sonrasında sıfat gelir ve keep sonrasında sıfat gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$We had ---- rain yesterday, and a ---- wind blew all night.$q$, array[$o$heavy / strong$o$, $o$big / strong$o$, $o$heavy / big$o$, $o$tall / high$o$, $o$large / tall$o$], 0, $e$1. Sık kullanılan sıfat birliktelikleri: **heavy rain** ve **strong wind**.

Diğer şıklar: **B** rain ile heavy kullanılır / **C** wind ile strong kullanılır / **D** rain ile heavy kullanılır ve wind ile strong kullanılır / **E** rain ile heavy kullanılır ve wind ile strong kullanılır.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She works ---- in the library and always arrives ----.$q$, array[$o$hardly / early$o$, $o$hard / earlily$o$, $o$harden / earliness$o$, $o$hardness / earlies$o$, $o$hard / early$o$], 4, $e$1. **Hard** hem sıfat hem zarftır ve çok çalışmak anlamında **hard** kullanılır.
2. **Early** hem sıfat hem zarftır: **early**.

Diğer şıklar: **A** hardly neredeyse hiç demektir / **B** early hem sıfat hem zarf olarak kullanılır / **C** uygun değildir ve uygun değildir / **D** uygun değildir ve uygun değildir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$It was very ---- of you to help me, and it is ---- for me to understand this rule.$q$, array[$o$kindly / difficult$o$, $o$kind / difficult$o$, $o$kind / difficultly$o$, $o$kindness / difficulty$o$, $o$kinder / difficulties$o$], 1, $e$1. **It was kind of you** kalıbı: **kind**.
2. **It is difficult for me to** kalıbı: **difficult**.

Diğer şıklar: **A** It was ... of you kalıbında sıfat gelir / **C** It is ... for me to kalıbında sıfat gelir / **D** It was ... of you kalıbında sıfat gelir ve It is ... for me to kalıbında sıfat gelir / **E** It was ... of you kalıbında sıfat gelir ve It is ... for me to kalıbında sıfat gelir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$She has ---- friends in this city, and she feels very ----.$q$, array[$o$little / lonely$o$, $o$few / loneliness$o$, $o$much / lonelily$o$, $o$few / lonely$o$, $o$least / lone$o$], 3, $e$1. Az arkadaşı olduğu için **few** kullanılır.
2. **Feel** sonrasında sıfat gelir: **lonely**.

Diğer şıklar: **A** friends sayılabilir isimdir, few gerekir / **B** feel sonrasında sıfat gelir / **C** friends sayılabilir isimdir ve uygun değildir / **E** friends sayılabilir isimdir ve feel sonrasında lonely kullanılır.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The suitcase is ---- heavy for me to carry, and the box is ---- heavy that nobody can lift it.$q$, array[$o$so / so$o$, $o$too / too$o$, $o$too / so$o$, $o$enough / enough$o$, $o$very / very$o$], 2, $e$1. **Too + sıfat + to-infinitive** kalıbı: **too**.
2. **So + sıfat + that** kalıbı: **so**.

Diğer şıklar: **A** to-infinitive ile too gerekir / **B** that sonucu için so gerekir / **D** to-infinitive ile too gerekir ve that sonucu için so gerekir / **E** to-infinitive ile too gerekir ve that sonucu için so gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$It was ---- a lovely day that we decided to go for a picnic, and it was ---- hot a day that we could hardly walk.$q$, array[$o$such / so$o$, $o$so / such$o$, $o$too / very$o$, $o$such / too$o$, $o$very / so$o$], 0, $e$1. **Such a + sıfat + isim** kalıbı: **such a lovely day**.
2. **So + sıfat + a + isim** kalıbı: **so hot a day**.

Diğer şıklar: **B** such a lovely day ve so hot a day kalıpları bu sırayla gelir / **C** that sonucu için such ya da so gerekir / **D** that sonucu için so gerekir / **E** such a lovely day kalıbı gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$In some countries, ---- are getting richer, while ---- are getting poorer.$q$, array[$o$rich / poor$o$, $o$the rich / the poor$o$, $o$the rich / poors$o$, $o$riches / poors$o$, $o$a rich / a poor$o$], 1, $e$1. **The + sıfat** insan grubunu anlatır: **the rich** ve **the poor**.

Diğer şıklar: **A** sıfatla grup anlatmak için the gerekir / **C** poor çoğul takısı almaz / **D** bu sıfatlar çoğul takısı almaz / **E** grubu anlatmak için the + sıfat gerekir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$I find it ---- to believe that he lied, and I felt ---- about the whole thing.$q$, array[$o$hardly / uncomfortable$o$, $o$hard / uncomfortably$o$, $o$hardness / comfort$o$, $o$hard / uncomfortable$o$, $o$harden / discomfort$o$], 3, $e$1. **Find it + sıfat + to-infinitive** kalıbı: **hard**.
2. **Feel** sonrasında sıfat gelir: **uncomfortable**.

Diğer şıklar: **A** find it sonrasında sıfat gelir / **B** feel sonrasında sıfat gelir / **C** find it sonrasında sıfat gelir ve feel sonrasında sıfat gelir / **E** find it sonrasında sıfat gelir ve feel sonrasında sıfat gelir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$There was something ---- in his voice, and I felt there was nothing ---- in his story.$q$, array[$o$strangely / convincing$o$, $o$strange / convincingly$o$, $o$strangeness / convince$o$, $o$strangest / convinced$o$, $o$strange / convincing$o$], 4, $e$1. **Something + sıfat** kalıbı: **strange**.
2. **Nothing + sıfat** kalıbı: **convincing**.

Diğer şıklar: **A** something + sıfat kalıbı gerekir / **B** nothing + sıfat kalıbı gerekir / **C** something + sıfat kalıbı gerekir ve nothing + sıfat kalıbı gerekir / **D** something + sıfat kalıbı gerekir ve hikayeyi niteleyen sıfat -ing biçimindedir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Adverbs konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Adverbs konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Adverbs$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$She speaks English very ----, and she plays tennis really ----.$q$, array[$o$fluently / well$o$, $o$fluent / well$o$, $o$fluently / good$o$, $o$fluency / goodly$o$, $o$fluentness / best$o$], 0, $e$1. **Speaks** fiilini niteleyen zarf gerekir: **fluently**.
2. **Plays** fiilini **well** zarfı niteler.

Diğer şıklar: **B** eylemi zarf niteler / **C** good sıfattır, zarf için well gerekir / **D** eylemi zarf niteler ve uygun değildir / **E** eylemi zarf niteler ve uygun değildir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He works very ----, but he can ---- afford a holiday because his salary is so low.$q$, array[$o$hardly / hardly$o$, $o$hard / hard$o$, $o$harden / hardness$o$, $o$hard / hardly$o$, $o$harder / harder$o$], 3, $e$1. Çok çalışmak anlamı için **hard** kullanılır.
2. **Hardly** neredeyse hiç demektir: **can hardly afford**.

Diğer şıklar: **A** çok çalışmak anlamı için hard gerekir / **B** neredeyse hiç anlamı için hardly gerekir / **C** uygun değildir ve uygun değildir / **E** very ile karşılaştırma yapılmaz ve uygun değildir.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$I have ---- finished my homework, so I can go out, but my brother hasn't finished ----.$q$, array[$o$yet / yet$o$, $o$already / already$o$, $o$still / still$o$, $o$ago / ago$o$, $o$already / yet$o$], 4, $e$1. Olumlu cümlede tamamlanmış işi **already** gösterir.
2. Olumsuz cümlenin sonunda **yet** kullanılır.

Diğer şıklar: **A** olumlu cümlede already kullanılır / **B** olumsuz cümle sonunda yet kullanılır / **C** olumlu cümlede already kullanılır ve olumsuz cümle sonunda yet kullanılır / **D** olumlu cümlede already kullanılır ve olumsuz cümle sonunda yet kullanılır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$They don't live in Paris ----, and I haven't seen them ---- last year.$q$, array[$o$yet / since$o$, $o$anymore / since$o$, $o$anymore / for$o$, $o$already / ago$o$, $o$still / from$o$], 1, $e$1. **Don't live anymore** artık yaşamıyor demektir.
2. **Last year** başlangıç noktasıdır: **since**.

Diğer şıklar: **A** anymore olumsuz cümle sonunda artık anlamı verir / **C** last year belirli bir başlangıç noktasıdır, since gerekir / **D** olumsuz cümlede anymore gerekir ve last year ile ago kullanılmaz / **E** olumsuz cümlede anymore gerekir ve present perfect ile since gerekir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$She doesn't like coffee, and her brother doesn't like it ----. His wife likes tea, and I like it ----.$q$, array[$o$too / too$o$, $o$either / either$o$, $o$neither / neither$o$, $o$either / too$o$, $o$so / so$o$], 3, $e$1. Olumsuz cümlede **either** kullanılır.
2. Olumlu cümlede **too** kullanılır.

Diğer şıklar: **A** olumsuz cümlede either gerekir / **B** olumlu cümlede too gerekir / **C** neither kendisi olumsuz anlam taşır ve olumlu cümlede too gerekir / **E** olumsuz cümlede either gerekir ve olumlu cümlede too gerekir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Rarely ---- such a brave rescue in this town.$q$, array[$o$have the residents seen$o$, $o$the residents have seen$o$, $o$did the residents seen$o$, $o$the residents had seen$o$, $o$have seen the residents$o$], 0, $e$1. **Rarely** olumsuz anlamlı bir zarftır ve cümle başında devrik yapı ister: **have the residents seen**.

Diğer şıklar: **B** olumsuz zarftan sonra devrik cümle gerekir / **C** did ile V3 kullanılmaz / **D** olumsuz zarftan sonra devrik cümle gerekir / **E** özne yardımcı fiilden sonra gelmelidir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Not until the manager arrived ---- the meeting.$q$, array[$o$they began$o$, $o$began they$o$, $o$they had begun$o$, $o$they did begin$o$, $o$did they begin$o$], 4, $e$1. **Not until** cümle başına gelirse ana cümle devrik olur: **did they begin**.

Diğer şıklar: **A** not until sonrasında devrik yapı gerekir / **B** devrik yapıda did gerekir / **C** not until sonrasında devrik yapı gerekir / **D** devrik yapıda did özneden önce gelir.$e$, 3),
  (8, 'ydt-dil', null::integer, $q$Only when she opened the letter ---- what had happened.$q$, array[$o$she realised$o$, $o$did she realise$o$, $o$realised she$o$, $o$she had realised$o$, $o$she did realise$o$], 1, $e$1. **Only when** cümle başına gelirse ana cümle devrik olur: **did she realise**.

Diğer şıklar: **A** only when sonrasında devrik yapı gerekir / **C** devrik yapıda did gerekir / **D** only when sonrasında devrik yapı gerekir / **E** did özneden önce gelmelidir.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$Little ---- that the project would change his whole life.$q$, array[$o$he knew$o$, $o$knew he$o$, $o$did he know$o$, $o$he had known$o$, $o$he did know$o$], 2, $e$1. **Little** olumsuz anlamlı bir zarftır ve devrik yapı ister: **did he know**.

Diğer şıklar: **A** little cümle başında devrik yapı ister / **B** devrik yapıda did gerekir / **D** little cümle başında devrik yapı ister / **E** did özneden önce gelmelidir.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$Not only ---- the exam, but she also got the highest score.$q$, array[$o$she passed$o$, $o$passed she$o$, $o$she has passed$o$, $o$she did pass$o$, $o$did she pass$o$], 4, $e$1. **Not only** cümle başına gelince devrik yapı gerekir: **did she pass**.

Diğer şıklar: **A** not only cümle başında devrik yapı ister / **B** devrik yapıda did gerekir / **C** not only cümle başında devrik yapı ister / **D** did özneden önce gelmelidir.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$Seldom ---- late for work, because he is always punctual.$q$, array[$o$he is$o$, $o$is he$o$, $o$he does$o$, $o$does he$o$, $o$he has been$o$], 1, $e$1. **Seldom** cümle başına gelince devrik yapı kurulur ve **be** fiili öznenin önüne geçer: **is he**.

Diğer şıklar: **A** seldom cümle başında devrik yapı ister / **C** be fiili ile devrik yapı kurulur / **D** be fiilinde yardımcı fiil kullanılmaz / **E** Present Simple gerekir.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$Under no circumstances ---- anyone to enter the laboratory.$q$, array[$o$we should allow$o$, $o$allow we$o$, $o$we allow$o$, $o$should we allow$o$, $o$should allow we$o$], 3, $e$1. **Under no circumstances** cümle başında devrik yapı ister: **should we allow**.

Diğer şıklar: **A** under no circumstances sonrasında devrik yapı gerekir / **B** devrik yapıda yardımcı fiil gerekir / **C** devrik yapıda yardımcı fiil gerekir / **E** özne yardımcı fiilden sonra gelmelidir.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$I haven't seen him ----, and he arrived ---- for the meeting.$q$, array[$o$late / late$o$, $o$lately / lately$o$, $o$latest / latter$o$, $o$later / lated$o$, $o$lately / late$o$], 4, $e$1. **Lately** yakın zamanda anlamındadır, present perfect ile kullanılır.
2. **Late** geç anlamındadır.

Diğer şıklar: **A** lately yakın zamanda anlamındadır / **B** geç kalmak anlamı için late gerekir / **C** uygun değildir ve uygun değildir / **D** uygun değildir ve uygun değildir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She was ---- injured in the accident, and she is ---- recovering.$q$, array[$o$serious / slowly$o$, $o$seriously / slow$o$, $o$seriously / slowly$o$, $o$seriousness / slowness$o$, $o$more serious / more slow$o$], 2, $e$1. **Injured** sıfatını zarf niteler: **seriously**.
2. **Recovering** fiilini zarf niteler: **slowly**.

Diğer şıklar: **A** sıfatı zarf niteler / **B** recovering fiilini zarf niteler / **D** sıfatı zarf niteler ve recovering fiilini zarf niteler / **E** sıfatı zarf niteler ve recovering fiilini zarf niteler.$e$, 1),
  (15, 'ydt-dil', null::integer, $q$He moved to London two years ----, and he hadn't visited the city ----.$q$, array[$o$ago / before$o$, $o$before / before$o$, $o$ago / ago$o$, $o$since / since$o$, $o$for / ever$o$], 0, $e$1. Şimdiden iki yıl öncesi **ago** ile söylenir.
2. Geçmişteki bir andan önce için **before** kullanılır.

Diğer şıklar: **B** şimdiden geriye sayarken ago kullanılır / **C** geçmişteki bir andan önce için before kullanılır / **D** şimdiden geriye sayarken ago kullanılır ve since bir başlangıç noktası ister / **E** şimdiden geriye sayarken ago kullanılır ve olumsuz cümlede ever kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The new model is ---- more expensive than the old one, and it is ---- as fast.$q$, array[$o$very / twice$o$, $o$much / twice$o$, $o$much / double$o$, $o$very / double$o$, $o$more / twice$o$], 1, $e$1. Karşılaştırma sıfatından önce **much** gelir: **much more expensive**.
2. **Twice as fast** kalıbı: **twice**.

Diğer şıklar: **A** karşılaştırma sıfatından önce much gelir / **C** twice as ... as kalıbı gerekir / **D** karşılaştırma sıfatından önce much gelir / **E** karşılaştırma öncesinde more kullanılmaz.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Prices have risen ---- over the past year, and people can ---- afford basic goods.$q$, array[$o$sharp / hardly$o$, $o$sharply / hard$o$, $o$sharply / hardly$o$, $o$sharpness / hardness$o$, $o$sharpen / harden$o$], 2, $e$1. **Risen** fiilini zarf niteler: **sharply**.
2. Neredeyse hiç karşılayamamak: **can hardly afford**.

Diğer şıklar: **A** risen fiilini zarf niteler / **B** neredeyse hiç anlamı için hardly gerekir / **D** risen fiilini zarf niteler ve neredeyse hiç anlamı için hardly gerekir / **E** risen fiilini zarf niteler ve neredeyse hiç anlamı için hardly gerekir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Is the water warm ----? Yes, it is ---- for us to swim.$q$, array[$o$enough warm / warm enough$o$, $o$enough / enough warm$o$, $o$too / warm enough$o$, $o$enough / warm enough$o$, $o$enough warm / enough warm$o$], 3, $e$1. **Enough** sıfattan sonra gelir: **warm enough**.
2. Sorudaki boşluk sıfatın ardından gelir ve **enough** olur.

Diğer şıklar: **A** enough sıfattan sonra gelir / **B** enough sıfattan sonra gelir / **C** soruda enough gerekir / **E** enough sıfattan sonra gelir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$The guests have ---- arrived, and dinner will be served ----.$q$, array[$o$just / soon$o$, $o$yet / soon$o$, $o$just / lately$o$, $o$still / ever$o$, $o$ever / ago$o$], 0, $e$1. Az önce gelmişlerdir: **just arrived**.
2. Gelecekte yakın zamanı **soon** anlatır.

Diğer şıklar: **B** olumlu cümlede just kullanılır / **C** gelecek zaman için soon kullanılır / **D** olumlu cümlede just kullanılır ve gelecek zaman için soon kullanılır / **E** olumlu cümlede just kullanılır ve gelecek zaman için soon kullanılır.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The bird flew ---- above the trees, and the book is ---- recommended by critics.$q$, array[$o$highly / highly$o$, $o$high / high$o$, $o$high / highly$o$, $o$highest / higher$o$, $o$higher / height$o$], 2, $e$1. Yükseklik için **high** kullanılır.
2. **Highly recommended** kalıbı: **highly**.

Diğer şıklar: **A** yükseklik için high kullanılır / **B** çok anlamı için highly kullanılır / **D** uygun değildir ve uygun değildir / **E** uygun değildir ve uygun değildir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conditionals konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conditionals konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$If you heat ice, it ----, and if it rains tomorrow, we ---- the picnic.$q$, array[$o$melted / will cancel$o$, $o$melts / will cancel$o$, $o$melts / would cancel$o$, $o$would melt / cancelled$o$, $o$had melted / had cancelled$o$], 1, $e$1. Genel doğrular Present Simple ile söylenir: **melts**.
2. **If it rains tomorrow** gelecekteki gerçekçi bir olasılıktır: **will cancel**.

Diğer şıklar: **A** genel doğru için Present Simple gerekir / **C** if + Present Simple ile will gerekir / **D** genel doğru için Present Simple gerekir ve if + Present Simple ile will gerekir / **E** genel doğru için Present Simple gerekir ve if + Present Simple ile will gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If I ---- you, I would see a doctor, and I ---- you if I had his number.$q$, array[$o$am / would call$o$, $o$were / will call$o$, $o$will be / called$o$, $o$were / would call$o$, $o$had been / had called$o$], 3, $e$1. **If I were you** gerçek dışı öneri kurar: **were**.
2. **If + Past Simple** ile **would + V1** kullanılır.

Diğer şıklar: **A** gerçek dışı durumda were kullanılır / **B** if + Past Simple ile would gerekir / **C** gerçek dışı durumda were kullanılır ve if + Past Simple ile would gerekir / **E** gerçek dışı durumda were kullanılır ve if + Past Simple ile would gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If she ---- harder, she would have passed the exam, but she didn't, so she ---- to retake it.$q$, array[$o$studied / has$o$, $o$had studied / had$o$, $o$had studied / has$o$, $o$would study / would have$o$, $o$studies / will have$o$], 2, $e$1. Geçmişteki gerçek dışı durum Past Perfect ile anlatılır: **had studied**.
2. Gerçek sonuç şimdiye bağlanır: **has to retake**.

Diğer şıklar: **A** geçmişteki gerçek dışı durumda Past Perfect gerekir / **B** sonuç sınavı yeniden alması için Present Perfect gerekir / **D** if sonrasında would kullanılmaz ve sonuç gerçek olmuştur / **E** geçmişteki gerçek dışı durumda Past Perfect gerekir ve sonuç gerçek olmuştur.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$Unless you ---- the instructions carefully, you ---- the machine properly.$q$, array[$o$don't follow / won't operate$o$, $o$follow / wouldn't operate$o$, $o$followed / haven't operated$o$, $o$will follow / didn't operate$o$, $o$follow / won't operate$o$], 4, $e$1. **Unless** kendisi olumsuz anlam taşır, fiil olumlu kalır: **follow**.
2. Sonuç gelecek zamanla verilir: **won't operate**.

Diğer şıklar: **A** unless zaten olumsuz anlam taşır / **B** unless + Present Simple ile will gerekir / **C** unless gerçek bir koşul bildirir ve gelecekteki sonuç gerekir / **D** if ve unless sonrasında will kullanılmaz ve gelecekteki sonuç gerekir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$Had I known the truth, I ---- him, and were I in your position, I ---- the offer.$q$, array[$o$would have told / would accept$o$, $o$would tell / would accept$o$, $o$would have told / would have accepted$o$, $o$will tell / accepted$o$, $o$told / will accept$o$], 0, $e$1. **Had + özne + V3** geçmiş koşul kurar: **would have told**.
2. **Were + özne** şimdiki gerçek dışı koşul kurar: **would accept**.

Diğer şıklar: **B** geçmişteki gerçek dışı durum için would have + V3 gerekir / **C** were I ... şimdiki gerçek dışı durumdur, would + V1 gerekir / **D** geçmişteki gerçek dışı durum için would have + V3 gerekir ve were I ... şimdiki gerçek dışı durumdur, would + V1 gerekir / **E** geçmişteki gerçek dışı durum için would have + V3 gerekir ve were I ... şimdiki gerçek dışı durumdur, would + V1 gerekir.$e$, 3),
  (6, 'ydt-dil', null::integer, $q$I would help you ---- I had time, but I won't help you ---- you apologise first.$q$, array[$o$unless / unless$o$, $o$if / unless$o$, $o$if / if$o$, $o$otherwise / when$o$, $o$until / because$o$], 1, $e$1. Zamanım olsaydı yardım ederdim: **if**.
2. Özür dilemedikçe yardım etmem: **unless**.

Diğer şıklar: **A** gerçek dışı durumda if gerekir / **C** unless gerekir / **D** if yerine kullanılmaz ve unless gerekir / **E** anlam bozulur ve unless gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$You can borrow my car ---- you drive carefully, and ---- you need it tomorrow, please call me.$q$, array[$o$unless / should$o$, $o$as long as / were$o$, $o$as long as / should$o$, $o$although / had$o$, $o$even if / would$o$], 2, $e$1. **As long as** yeter şart bildirir.
2. **Should you need ...** gelecekteki zayıf olasılığı devrik yapıyla anlatır.

Diğer şıklar: **A** koşulu ters çevirir / **B** olasılık için should gerekir / **D** koşul bildirmez ve olasılık için should gerekir / **E** koşul bildirmez ve olasılık için should gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$If he ---- more careful in the past, he ---- in trouble now.$q$, array[$o$had been / wouldn't be$o$, $o$were / wouldn't be$o$, $o$had been / wouldn't have been$o$, $o$was / won't be$o$, $o$is / isn't$o$], 0, $e$1. Geçmişteki durum Past Perfect ile verilir: **had been**.
2. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.

Diğer şıklar: **B** geçmiş zaman gerekir / **C** now şimdiki sonucu gösterir / **D** geçmiş zaman gerekir ve mixed conditional'da would gerekir / **E** geçmiş zaman gerekir ve mixed conditional'da would gerekir.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$If the weather ---- better, we would go to the beach, and if I ---- more money, I would buy a house.$q$, array[$o$is / had$o$, $o$were / had$o$, $o$were / have$o$, $o$will be / will have$o$, $o$had been / would have$o$], 1, $e$1. **If + Past Simple + would** yapısı şimdiki gerçek dışı durumu anlatır: **were** ve **had**.

Diğer şıklar: **A** gerçek dışı durumda Past Simple gerekir / **C** gerçek dışı durumda Past Simple gerekir / **D** gerçek dışı durumda Past Simple gerekir ve gerçek dışı durumda Past Simple gerekir / **E** gerçek dışı durumda Past Simple gerekir ve gerçek dışı durumda Past Simple gerekir.$e$, 1),
  (10, 'ydt-dil', null::integer, $q$Suppose you ---- a million dollars, what ---- you do?$q$, array[$o$win / would$o$, $o$won / will$o$, $o$will win / did$o$, $o$had won / had$o$, $o$won / would$o$], 4, $e$1. **Suppose** sonrasında Past Simple gerçek dışı durumu kurar: **won**.
2. Sonuç **would** ile sorulur.

Diğer şıklar: **A** suppose + Past Simple gerçek dışı durum kurar / **B** gerçek dışı durumda would gerekir / **C** suppose + Past Simple gerçek dışı durum kurar ve gerçek dışı durumda would gerekir / **D** suppose + Past Simple gerçek dışı durum kurar ve gerçek dışı durumda would gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I'll lend you the money ---- you promise to pay it back, but I'll call you ---- I need it back soon.$q$, array[$o$unless / in case$o$, $o$provided / unless$o$, $o$although / so that$o$, $o$provided / in case$o$, $o$whereas / because$o$], 3, $e$1. **Provided** koşul bildirir: **provided**.
2. Önlem amacı **in case** ile anlatılır.

Diğer şıklar: **A** mantık bozulur / **B** mantık bozulur / **C** mantık bozulur ve mantık bozulur / **E** mantık bozulur ve mantık bozulur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$If you ---- anything suspicious, ---- the police immediately.$q$, array[$o$see / call$o$, $o$saw / call$o$, $o$see / would call$o$, $o$would see / called$o$, $o$had seen / calling$o$], 0, $e$1. **If + Present Simple + emir** kalıbı: **see** ve **call**.

Diğer şıklar: **B** emir cümlesi ile if + Present Simple kullanılır / **C** emir cümlesinde yalın fiil kullanılır / **D** emir cümlesi ile if + Present Simple kullanılır ve emir cümlesinde yalın fiil kullanılır / **E** emir cümlesi ile if + Present Simple kullanılır ve emir cümlesinde yalın fiil kullanılır.$e$, 1),
  (13, 'ydt-dil', null::integer, $q$But for your help, we ---- the project, and without his advice, she ---- the mistake.$q$, array[$o$won't finish / would have made$o$, $o$wouldn't have finished / will make$o$, $o$wouldn't have finished / would have made$o$, $o$didn't finish / made$o$, $o$wouldn't finish / makes$o$], 2, $e$1. **But for** geçmişteki gerçek dışı durumu kurar: **wouldn't have finished**.
2. **Without** ile de **would have made** kullanılır.

Diğer şıklar: **A** but for geçmişte gerçekleşmeyen durumu gösterir / **B** geçmiş için would have V3 gerekir / **D** but for ile would have V3 gerekir ve would have V3 gerekir / **E** geçmiş için would have V3 gerekir ve would have V3 gerekir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$If you ---- water to 100 degrees, it boils, and plants die if they ---- sunlight.$q$, array[$o$heated / don't get$o$, $o$heat / didn't get$o$, $o$will heat / won't get$o$, $o$would heat / wouldn't get$o$, $o$heat / don't get$o$], 4, $e$1. Genel doğrularda if sonrası Present Simple kullanılır: **heat** ve **don't get**.

Diğer şıklar: **A** genel doğru için Present Simple gerekir / **B** genel doğru için Present Simple gerekir / **C** genel doğru için Present Simple gerekir ve genel doğru için Present Simple gerekir / **D** genel doğru için Present Simple gerekir ve genel doğru için Present Simple gerekir.$e$, 1),
  (15, 'ydt-dil', null::integer, $q$What ---- you do if you lost your job? If I ---- my job, I would look for another one.$q$, array[$o$will / lost$o$, $o$would / lost$o$, $o$would / lose$o$, $o$did / will lose$o$, $o$had / had lost$o$], 1, $e$1. **If + Past Simple** ile soru **would** ile sorulur.
2. Cevapta da **lost** kullanılır.

Diğer şıklar: **A** if + Past Simple ile would kullanılır / **C** gerçek dışı durumda Past Simple gerekir / **D** if + Past Simple ile would kullanılır ve gerçek dışı durumda Past Simple gerekir / **E** if + Past Simple ile would kullanılır ve gerçek dışı durumda Past Simple gerekir.$e$, 1),
  (16, 'ydt-dil', null::integer, $q$If the company ---- its profits last year, it ---- more employees now.$q$, array[$o$increased / would be hiring$o$, $o$had increased / will hire$o$, $o$would increase / hired$o$, $o$had increased / would be hiring$o$, $o$increases / hires$o$], 3, $e$1. Geçmişteki durum Past Perfect ile verilir: **had increased**.
2. Şimdiki sonuç **would be hiring** ile verilir.

Diğer şıklar: **A** geçmişteki gerçek dışı durumda Past Perfect gerekir / **B** mixed conditional'da would gerekir / **C** geçmişteki gerçek dışı durumda Past Perfect gerekir ve mixed conditional'da would gerekir / **E** geçmişteki gerçek dışı durumda Past Perfect gerekir ve mixed conditional'da would gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Were it not for the rain, we ---- outside right now, and had it not been for his help, I ---- the project.$q$, array[$o$would have sat / would have failed$o$, $o$would be sitting / would fail$o$, $o$sat / failed$o$, $o$will sit / will fail$o$, $o$would be sitting / would have failed$o$], 4, $e$1. **Were it not for** şimdiki gerçek dışı koşuldur: **would be sitting**.
2. **Had it not been for** geçmiş koşuldur: **would have failed**.

Diğer şıklar: **A** right now şimdiki durumu gösterir / **B** had it not been for geçmiş durumu gösterir / **C** right now şimdiki durumu gösterir ve had it not been for geçmiş durumu gösterir / **D** devrik koşul would ister ve had it not been for geçmiş durumu gösterir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I wouldn't have bought the car if I ---- how expensive it was, and I ---- it back if the shop accepted returns.$q$, array[$o$knew / would take$o$, $o$had known / would have taken$o$, $o$had known / would take$o$, $o$would know / will take$o$, $o$have known / took$o$], 2, $e$1. Geçmiş koşul için **had known** kullanılır.
2. **If the shop accepted** şimdiki gerçek dışı koşuldur: **would take**.

Diğer şıklar: **A** geçmişteki gerçek dışı durumda Past Perfect gerekir / **B** if the shop accepted ... şimdiki gerçek dışıdır, would + V1 gerekir / **D** geçmişteki gerçek dışı durumda Past Perfect gerekir ve if + Past Simple ile would gerekir / **E** geçmişteki gerçek dışı durumda Past Perfect gerekir ve if + Past Simple ile would gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$If water ---- below zero, it freezes, and if you mix red and blue, you ---- purple.$q$, array[$o$gets / get$o$, $o$will get / get$o$, $o$gets / would get$o$, $o$got / got$o$, $o$would get / had got$o$], 0, $e$1. Genel doğrularda her iki bölüm de Present Simple olur: **gets** ve **get**.

Diğer şıklar: **B** genel doğru için Present Simple gerekir / **C** genel doğru için Present Simple gerekir / **D** genel doğru için Present Simple gerekir ve genel doğru için Present Simple gerekir / **E** genel doğru için Present Simple gerekir ve genel doğru için Present Simple gerekir.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$If he ---- the interview well, he ---- the job last month, but he didn't.$q$, array[$o$did / would have got$o$, $o$had done / would get$o$, $o$would do / will get$o$, $o$had done / would have got$o$, $o$does / got$o$], 3, $e$1. Geçmişteki gerçek dışı durum Past Perfect ile verilir: **had done**.
2. Sonuç **would have got** olur.

Diğer şıklar: **A** geçmişteki gerçek dışı durumda Past Perfect gerekir / **B** last month geçmiş sonucu gösterir / **C** geçmişteki gerçek dışı durumda Past Perfect gerekir ve last month geçmiş sonucu gösterir / **E** geçmişteki gerçek dışı durumda Past Perfect gerekir ve would have V3 gerekir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Noun Clauses konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Noun Clauses konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$I wonder ---- she lives, and I don't know ---- she will accept the job.$q$, array[$o$that / whether$o$, $o$where / whether$o$, $o$where / what$o$, $o$what / which$o$, $o$who / who$o$], 1, $e$1. Yer sorulur ve noun clause kurulur: **where**.
2. Evet-hayır sorusunu noun clause yapmak için **whether** kullanılır.

Diğer şıklar: **A** wonder sonrasında soru sözcüğü gerekir / **C** kabul etme olasılığı için whether gerekir / **D** wonder sonrasında anlamlı soru sözcüğü gerekir ve kabul etme olasılığı için whether gerekir / **E** yer bildiren soru sözcüğü gerekir ve kabul etme olasılığı için whether gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$She asked me ---- I was doing, and he wanted to know ---- I would join them.$q$, array[$o$that / if$o$, $o$what / that$o$, $o$which / what$o$, $o$what / if$o$, $o$why / who$o$], 3, $e$1. Ne yaptığım sorulur: **what**.
2. Evet-hayır sorusu için **if** kullanılır.

Diğer şıklar: **A** ask sonrasında soru sözcüğü gerekir / **B** evet-hayır sorusu için if ya da whether gerekir / **C** ask sonrasında what gerekir ve evet-hayır sorusu için if ya da whether gerekir / **E** yaptığım şey sorulur ve evet-hayır sorusu için if ya da whether gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Could you tell me ---- , please?$q$, array[$o$where is the station$o$, $o$where does the station$o$, $o$where the station be$o$, $o$that the station is$o$, $o$where the station is$o$], 4, $e$1. Dolaylı soruda soru sözcüğünden sonra düz cümle sırası kullanılır: **where the station is**.

Diğer şıklar: **A** noun clause'ta devrik yapı kullanılmaz / **B** noun clause'ta yardımcı fiil kullanılmaz / **C** çekimli fiil gerekir / **D** yer sorulduğu için where gerekir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$I have no idea ---- she left so suddenly.$q$, array[$o$why did she leave$o$, $o$why she left$o$, $o$why she did leave$o$, $o$that she left$o$, $o$why left she$o$], 1, $e$1. Dolaylı soruda düz cümle sırası kullanılır: **why she left**.

Diğer şıklar: **A** dolaylı soruda devrik yapı kullanılmaz / **C** dolaylı soruda did kullanılmaz / **D** neden sorulduğu için why gerekir / **E** özne fiilden önce gelmelidir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$Nobody knows ---- will win the match, and it doesn't matter ---- he says.$q$, array[$o$whom / what$o$, $o$who / whom$o$, $o$who / what$o$, $o$whose / that$o$, $o$whoever / who$o$], 2, $e$1. Kazanan kişi özne konumundadır: **who**.
2. Söylediği şey için **what** kullanılır.

Diğer şıklar: **A** özne yerinde who gerekir / **B** söylenen şey için what gerekir / **D** özne yerinde who gerekir ve it doesn't matter sonrasında soru sözcüğü gerekir / **E** know sonrasında soru sözcüğü gerekir ve söylenen şey için what gerekir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$---- you said yesterday upset her, and ---- he arrived late was not surprising.$q$, array[$o$What / That$o$, $o$That / That$o$, $o$What / What$o$, $o$Which / Which$o$, $o$Whom / If$o$], 0, $e$1. Söylenen şey için **What** kullanılır.
2. Geç gelmesi bir olgudur: **That**.

Diğer şıklar: **B** söylenen şey için what gerekir / **C** olgu bildirdiği için that gerekir / **D** noun clause'ta what gerekir ve noun clause'ta that gerekir / **E** söylenen şey için what gerekir ve özne yerinde if kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The fact ---- he lied bothers me, and the question is ---- we can trust him.$q$, array[$o$what / whether$o$, $o$that / which$o$, $o$which / what$o$, $o$whether / who$o$, $o$that / whether$o$], 4, $e$1. **The fact that** kalıbı: **that**.
2. Evet-hayır sorusu için **whether** kullanılır.

Diğer şıklar: **A** the fact sonrasında that gelir / **B** evet-hayır sorusu için whether gerekir / **C** the fact sonrasında that gelir ve evet-hayır sorusu için whether gerekir / **D** the fact sonrasında that gelir ve evet-hayır sorusu için whether gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'm not sure ---- to do, and she can't decide ---- to accept the offer.$q$, array[$o$that / whether$o$, $o$what / whether$o$, $o$what / what$o$, $o$whom / that$o$, $o$whose / if$o$], 1, $e$1. Soru sözcüğü + to-infinitive: **what to do**.
2. Karar verirken **whether to accept** kullanılır.

Diğer şıklar: **A** to-infinitive ile that kullanılmaz / **C** to-infinitive ile whether kullanılır / **D** yapılacak şey için what gerekir ve to-infinitive ile that kullanılmaz / **E** yapılacak şey için what gerekir ve to-infinitive ile if kullanılmaz.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The teacher asked the students ---- they had finished, and she wanted to know ---- they had found difficult.$q$, array[$o$that / what$o$, $o$if / if$o$, $o$whom / that$o$, $o$if / what$o$, $o$whose / whom$o$], 3, $e$1. Evet-hayır sorusu için **if** kullanılır.
2. Zor bulunan şey nesnedir: **what**.

Diğer şıklar: **A** ask sonrasında that kullanılmaz / **B** nesnesi eksik olduğu için what gerekir / **C** evet-hayır sorusu için if gerekir ve nesnesi eksik olduğu için what gerekir / **E** evet-hayır sorusu için if gerekir ve nesnesi eksik olduğu için what gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- we should do next is not clear, and ---- the manager will agree remains a question.$q$, array[$o$That / Whether$o$, $o$What / If$o$, $o$What / Whether$o$, $o$If / What$o$, $o$Whom / Which$o$], 2, $e$1. Yapılacak şey için **What** kullanılır.
2. Özne konumunda evet-hayır sorusu **Whether** ile kurulur.

Diğer şıklar: **A** yapılacak şey için what gerekir / **B** özne konumunda if kullanılmaz / **D** yapılacak şey için what gerekir ve evet-hayır sorusu için whether gerekir / **E** yapılacak şey için what gerekir ve evet-hayır sorusu için whether gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She is interested in ---- the new system works, and he was surprised at ---- she said.$q$, array[$o$how / what$o$, $o$that / what$o$, $o$how / that$o$, $o$if / which$o$, $o$what / how$o$], 0, $e$1. Nasıl çalıştığı için **how** kullanılır.
2. Söylediği şey için **what** kullanılır.

Diğer şıklar: **B** in sonrasında how gerekir / **C** at sonrasında what gerekir / **D** in sonrasında if kullanılmaz ve at sonrasında what gerekir / **E** nasıl çalıştığı sorulur ve söylediği şey için what gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The problem is ---- he never listens, and we don't know ---- to do about it.$q$, array[$o$what / what$o$, $o$that / that$o$, $o$which / which$o$, $o$whether / whom$o$, $o$that / what$o$], 4, $e$1. **The problem is that** kalıbı: **that**.
2. **Know what to do** kalıbı: **what**.

Diğer şıklar: **A** the problem is sonrasında that gelir / **B** to-infinitive ile that kullanılmaz / **C** the problem is sonrasında that gelir ve yapılacak şey için what gerekir / **D** the problem is sonrasında that gelir ve yapılacak şey için what gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$He asked me ---- I had seen the thief, and I told him ---- I hadn't.$q$, array[$o$that / that$o$, $o$whether / whether$o$, $o$whether / that$o$, $o$what / if$o$, $o$whom / what$o$], 2, $e$1. Evet-hayır sorusu için **whether** kullanılır.
2. **Tell somebody that** kalıbı: **that**.

Diğer şıklar: **A** evet-hayır sorusu için whether gerekir / **B** tell sonrasında that gelir / **D** evet-hayır sorusu için whether gerekir ve tell sonrasında that gelir / **E** evet-hayır sorusu için whether gerekir ve tell sonrasında that gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$Do you remember ---- you met him first, and do you know ---- he was wearing?$q$, array[$o$where / what$o$, $o$what / what$o$, $o$where / where$o$, $o$who / whom$o$, $o$whom / why$o$], 0, $e$1. Yer sorulur: **where**.
2. Giydiği şey sorulur: **what**.

Diğer şıklar: **B** yer sorulduğu için where gerekir / **C** giysi için what gerekir / **D** yer sorulduğu için where gerekir ve giysi için what gerekir / **E** yer sorulduğu için where gerekir ve giysi için what gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I can't understand ---- he is so angry, and I'm not sure ---- he is angry with me.$q$, array[$o$what / whether$o$, $o$why / whether$o$, $o$why / what$o$, $o$who / which$o$, $o$which / who$o$], 1, $e$1. Neden sorulur: **why**.
2. Evet-hayır sorusu için **whether** kullanılır.

Diğer şıklar: **A** neden sorulduğu için why gerekir / **C** evet-hayır sorusu için whether gerekir / **D** neden sorulduğu için why gerekir ve evet-hayır sorusu için whether gerekir / **E** neden sorulduğu için why gerekir ve evet-hayır sorusu için whether gerekir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I wonder ---- will happen if the plan fails, and I don't know ---- will be responsible.$q$, array[$o$that / who$o$, $o$what / whom$o$, $o$whom / what$o$, $o$whether / whether$o$, $o$what / who$o$], 4, $e$1. Ne olacağı sorulur: **what**.
2. Sorumlu kişi özne olarak **who** ile sorulur.

Diğer şıklar: **A** wonder sonrasında soru sözcüğü gerekir / **B** özne yerinde who gerekir / **C** özne yerinde what gerekir ve sorumlu kişi için who gerekir / **D** özne yerinde what gerekir ve sorumlu kişi için who gerekir.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$---- she will win the election is not certain, but ---- she is popular is clear.$q$, array[$o$If / That$o$, $o$Whether / If$o$, $o$What / What$o$, $o$Whether / That$o$, $o$Which / Which$o$], 3, $e$1. Seçim kazanıp kazanmaması belirsizdir: **Whether**.
2. Popüler olması bir olgudur: **That**.

Diğer şıklar: **A** özne konumunda if kullanılmaz / **B** olgu bildirdiği için that gerekir / **C** evet-hayır belirsizliği için whether gerekir ve olgu bildirdiği için that gerekir / **E** evet-hayır belirsizliği için whether gerekir ve olgu bildirdiği için that gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He explained ---- he had been late, and she asked him ---- the traffic had been bad.$q$, array[$o$why / if$o$, $o$whether / if$o$, $o$why / that$o$, $o$what / what$o$, $o$whom / whom$o$], 0, $e$1. Geç kalma nedeni açıklanır: **why**.
2. Evet-hayır sorusu için **if** kullanılır.

Diğer şıklar: **B** neden açıklandığı için why gerekir / **C** ask sonrasında evet-hayır sorusu için if gerekir / **D** neden açıklandığı için why gerekir ve ask sonrasında evet-hayır sorusu için if gerekir / **E** neden açıklandığı için why gerekir ve ask sonrasında evet-hayır sorusu için if gerekir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Not knowing ---- to say, he kept silent, and she had no idea ---- to go.$q$, array[$o$that / where$o$, $o$what / that$o$, $o$what / where$o$, $o$whom / if$o$, $o$if / whom$o$], 2, $e$1. Soru sözcüğü + to-infinitive: **what to say**.
2. Gidilecek yer için **where to go**.

Diğer şıklar: **A** to-infinitive ile that kullanılmaz / **B** to-infinitive ile that kullanılmaz / **D** söylenecek şey için what gerekir ve yer sorulduğu için where gerekir / **E** to-infinitive ile if kullanılmaz ve yer sorulduğu için where gerekir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$No matter ---- he does, he can't please her, and no matter ---- he asks, he gets the same answer.$q$, array[$o$that / whom$o$, $o$what / whoever$o$, $o$whoever / whatever$o$, $o$what / whom$o$, $o$whichever / that$o$], 3, $e$1. **No matter + soru sözcüğü** kalıbı: **what** ve **whom**.

Diğer şıklar: **A** no matter sonrasında soru sözcüğü gelir / **B** no matter sonrasında -ever gelmez / **C** no matter sonrasında -ever gelmez ve no matter sonrasında -ever gelmez / **E** no matter sonrasında -ever gelmez ve no matter sonrasında soru sözcüğü gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Relative Clauses konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Relative Clauses konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The woman ---- lives next door is a doctor, and the book ---- I borrowed is very interesting.$q$, array[$o$which / which$o$, $o$who / who$o$, $o$whom / whose$o$, $o$whose / where$o$, $o$who / which$o$], 4, $e$1. Kişiyi tarif eden özne **who** olur.
2. Kitap bir nesnedir ve **which** kullanılır.

Diğer şıklar: **A** kişi için who kullanılır / **B** nesne için who kullanılmaz / **C** özne yerinde whom kullanılmaz ve sahiplik bildirir / **D** sahiplik bildirir, özne değildir ve yer bildirir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$This is the house ---- I was born, and 2005 was the year ---- we moved here.$q$, array[$o$which / when$o$, $o$where / when$o$, $o$where / where$o$, $o$when / which$o$, $o$why / why$o$], 1, $e$1. Yer bildiren isimden sonra **where** gelir.
2. Zaman bildiren isimden sonra **when** gelir.

Diğer şıklar: **A** yer için where gerekir / **C** zaman için when gerekir / **D** yer için where gerekir ve zaman için when gerekir / **E** yer için where gerekir ve zaman için when gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The man ---- car was stolen called the police, and the student ---- I met yesterday is from Spain.$q$, array[$o$whose / whom$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$which / which$o$, $o$whom / where$o$], 0, $e$1. Araba adamın olduğu için **whose** kullanılır.
2. Öğrenci cümlede nesnedir: **whom**.

Diğer şıklar: **B** sahiplik için whose gerekir / **C** nesne için whom gerekir / **D** kişi için which kullanılmaz ve kişi için which kullanılmaz / **E** sahiplik için whose gerekir ve yer bildirir.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$She is the person to ---- I gave the keys, and that is the reason ---- he left early.$q$, array[$o$who / why$o$, $o$whom / which$o$, $o$whom / why$o$, $o$which / where$o$, $o$whose / when$o$], 2, $e$1. Edattan sonra kişi için **whom** kullanılır.
2. **The reason** isminden sonra **why** gelir.

Diğer şıklar: **A** edattan sonra whom gelir / **B** reason isminden sonra why gelir / **D** kişi için which kullanılmaz ve reason isminden sonra why gelir / **E** sahiplik bildirir ve reason isminden sonra why gelir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$He told me the truth, ---- surprised everyone, and he gave me everything ---- he had.$q$, array[$o$what / that$o$, $o$which / what$o$, $o$who / whom$o$, $o$that / who$o$, $o$which / that$o$], 4, $e$1. Önceki cümleyi niteleyen virgüllü yan cümlede **which** kullanılır.
2. **Everything** sonrasında **that** gelir.

Diğer şıklar: **A** virgülden sonra which gerekir / **B** everything sonrasında that gelir / **C** cümleyi niteler, who olmaz ve everything sonrasında that gelir / **D** virgüllü yan cümlede that kullanılmaz ve everything sonrasında that gelir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$I have two brothers, both of ---- are doctors, and a sister, ---- lives in Canada.$q$, array[$o$who / who$o$, $o$whom / whom$o$, $o$which / which$o$, $o$whom / who$o$, $o$them / that$o$], 3, $e$1. Edat sonrası kişi için **whom** kullanılır.
2. Kız kardeşi niteleyen özne **who** olur.

Diğer şıklar: **A** of sonrasında whom gelir / **B** özne yerinde who gerekir / **C** kişi için which olmaz ve kişi için which olmaz / **E** ilgi zamiri gerekir ve virgüllü yan cümlede that kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The company, ---- products are sold worldwide, was founded in 1990, and the engineer ---- designed them has retired.$q$, array[$o$that / who$o$, $o$whose / whom$o$, $o$whose / who$o$, $o$which / whose$o$, $o$who / which$o$], 2, $e$1. Ürünler şirkete aittir: **whose**.
2. Tasarlayan mühendis özne olur: **who**.

Diğer şıklar: **A** sahiplik için whose gerekir / **B** özne yerinde who gerekir / **D** sahiplik için whose gerekir ve özne yerinde who gerekir / **E** sahiplik için whose gerekir ve kişi için which olmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The students, most of ---- had passed the exam, were happy, and the exams, some of ---- were difficult, ended.$q$, array[$o$who / which$o$, $o$whom / which$o$, $o$whom / whom$o$, $o$them / that$o$, $o$which / them$o$], 1, $e$1. **Most of whom** kalıbı kişi için kullanılır.
2. **Some of which** kalıbı nesne için kullanılır.

Diğer şıklar: **A** of sonrasında whom gelir / **C** nesne için which gerekir / **D** ilgi zamiri gerekir ve of sonrasında that gelmez / **E** kişi için which olmaz ve ilgi zamiri gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Everything ---- he said was true, and I am the only one ---- knows it.$q$, array[$o$what / who$o$, $o$that / whom$o$, $o$whom / whose$o$, $o$that / who$o$, $o$whose / which$o$], 3, $e$1. **Everything** sonrasında **that** gelir.
2. Kişiyi niteleyen özne **who** olur.

Diğer şıklar: **A** everything sonrasında that gelir / **B** özne yerinde who gerekir / **C** everything sonrasında that gelir ve sahiplik bildirir / **E** everything sonrasında that gelir ve kişi için which olmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The hotel ---- we stayed was near the beach, and the town ---- we visited the next day was beautiful.$q$, array[$o$where / which$o$, $o$which / which$o$, $o$where / where$o$, $o$when / whom$o$, $o$whose / when$o$], 0, $e$1. **Stayed** eyleminin yeri için **where** kullanılır.
2. **Visited** eyleminin nesnesi için **which** kullanılır.

Diğer şıklar: **B** yer bildiren eylem için where gerekir / **C** nesne yerinde which gerekir / **D** yer için where gerekir ve nesne için which gerekir / **E** yer için where gerekir ve yer için which gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$He passed the exam easily, ---- surprised nobody, and he asked ---- I thought about his plan.$q$, array[$o$what / what$o$, $o$which / which$o$, $o$which / what$o$, $o$that / that$o$, $o$who / whom$o$], 2, $e$1. Önceki cümleyi niteleyen **which** kullanılır.
2. **Ask what** noun clause kurar: **what**.

Diğer şıklar: **A** virgülden sonra which gerekir / **B** isim cümlesi için what gerekir / **D** virgüllü yan cümlede that kullanılmaz ve asked sonrasında that olmaz / **E** cümleyi niteler, who olmaz ve asked sonrasında whom olmaz.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The teacher ---- we respect most is retiring, and the book ---- cover is torn is mine.$q$, array[$o$whose / whose$o$, $o$whom / who$o$, $o$which / which$o$, $o$whom / whose$o$, $o$where / whom$o$], 3, $e$1. Saygı duyduğumuz öğretmen nesne konumundadır: **whom**.
2. Kapak kitaba aittir: **whose**.

Diğer şıklar: **A** nesne için whom gerekir / **B** sahiplik için whose gerekir / **C** kişi için which olmaz ve sahiplik için whose gerekir / **E** yer bildirir ve sahiplik için whose gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The man ---- the news on television is the president, and the documents ---- on the table are important.$q$, array[$o$read / lying$o$, $o$reading / lying$o$, $o$reading / lain$o$, $o$reads / lie$o$, $o$been reading / to lie$o$], 1, $e$1. Kısaltılmış sıfat cümlesinde etken anlam -ing ile verilir: **reading** ve **lying**.

Diğer şıklar: **A** kısaltılmış sıfat cümlesinde etken anlam -ing alır / **C** kısaltılmış sıfat cümlesinde etken anlam -ing alır / **D** kısaltılmış sıfat cümlesinde çekimli fiil olmaz ve yalın fiil kullanılmaz / **E** uygun yapı değildir ve uygun yapı değildir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$This is the only place ---- I feel comfortable, and it is the best film ---- I have ever seen.$q$, array[$o$where / that$o$, $o$which / that$o$, $o$where / what$o$, $o$what / who$o$, $o$whom / whom$o$], 0, $e$1. Yer bildiren eylem için **where** kullanılır.
2. **The best** gibi superlative sonrasında **that** gelir.

Diğer şıklar: **B** yer için where gerekir / **C** superlative sonrasında that gelir / **D** yer için where gerekir ve superlative sonrasında that gelir / **E** yer için where gerekir ve superlative sonrasında that gelir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$I don't know the reason ---- he left, and I don't know the way in ---- he did it.$q$, array[$o$how / which$o$, $o$why / how$o$, $o$whose / whom$o$, $o$whom / that$o$, $o$why / which$o$], 4, $e$1. **The reason** sonrasında **why** gelir.
2. **The way in which** kalıbı edattan sonra **which** ister.

Diğer şıklar: **A** reason sonrasında why gelir / **B** edattan sonra which gelir / **C** reason sonrasında why gelir ve nesne için which gerekir / **D** reason sonrasında why gelir ve edattan sonra that gelmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$My neighbour, ---- house was robbed last night, is very upset, and the thief, ---- has not been caught, is dangerous.$q$, array[$o$who / who$o$, $o$whose / who$o$, $o$whose / whom$o$, $o$whom / which$o$, $o$which / whose$o$], 1, $e$1. Ev komşuya aittir: **whose**.
2. Hırsız özne olarak **who** ile tarif edilir.

Diğer şıklar: **A** sahiplik için whose gerekir / **C** özne yerinde who gerekir / **D** sahiplik için whose gerekir ve kişi için which olmaz / **E** sahiplik için whose gerekir ve özne yerinde who gerekir.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$It was in 1923 ---- the republic was founded, and it was Atatürk ---- founded it.$q$, array[$o$when / who$o$, $o$that / whom$o$, $o$which / which$o$, $o$that / who$o$, $o$where / whose$o$], 3, $e$1. **It was ... that** vurgu kalıbında zaman ifadesinden sonra **that** gelir.
2. Kişi vurgulanıyorsa **who** kullanılır.

Diğer şıklar: **A** vurgu kalıbında that kullanılır / **B** özne yerinde who gerekir / **C** vurgu kalıbında that kullanılır ve kişi için which olmaz / **E** vurgu kalıbında that kullanılır ve sahiplik bildirir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The people with ---- I work are very friendly, and the topic about ---- we talked was interesting.$q$, array[$o$who / which$o$, $o$whom / that$o$, $o$which / what$o$, $o$whose / whom$o$, $o$whom / which$o$], 4, $e$1. Edattan sonra kişi için **whom** kullanılır.
2. Edattan sonra nesne için **which** kullanılır.

Diğer şıklar: **A** edattan sonra whom gelir / **B** edattan sonra that gelmez / **C** kişi için which olmaz ve edattan sonra what gelmez / **D** sahiplik bildirir ve konu için which gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The scientists ---- discovered the cure were awarded a prize, and the cure ---- they discovered saved millions.$q$, array[$o$whom / which$o$, $o$who / who$o$, $o$who / which$o$, $o$whose / whom$o$, $o$which / whose$o$], 2, $e$1. Bilim insanları özne konumundadır: **who**.
2. Tedavi bir nesnedir: **which**.

Diğer şıklar: **A** özne yerinde who gerekir / **B** nesne için which gerekir / **D** özne yerinde who gerekir ve nesne için which gerekir / **E** kişi için which olmaz ve sahiplik bildirir.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The film, ---- plot is quite simple, won an award, and the director, ---- I interviewed, was very pleased.$q$, array[$o$whose / whom$o$, $o$that / whom$o$, $o$whose / which$o$, $o$who / whose$o$, $o$which / that$o$], 0, $e$1. Konu filme aittir: **whose**.
2. Yönetmen, görüşmenin nesnesidir: **whom**.

Diğer şıklar: **B** sahiplik için whose gerekir / **C** kişi için which olmaz / **D** sahiplik için whose gerekir ve nesne için whom gerekir / **E** sahiplik için whose gerekir ve virgüllü yan cümlede that kullanılmaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

