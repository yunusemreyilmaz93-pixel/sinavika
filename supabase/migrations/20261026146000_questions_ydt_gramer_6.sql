-- 20261026146000_questions_ydt_gramer_6. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Comparison ve Correlatives konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (11, 'ydt-dil', null::integer, $q$The ---- he studied, the ---- confident he felt, but the less sleep he got, the less he was able to concentrate.$q$, array[$o$hard / more$o$, $o$harder / most$o$, $o$harder / more$o$, $o$hardest / much$o$, $o$more hard / very$o$], 2, $e$1. **The + karşılaştırma** yapısı kullanılır: **harder**.
2. Aynı kurala göre: **more**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** hard -er alır ve the + karşılaştırma ister.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$The new model is not nearly ---- reliable as the old one, although it is considerably ----.$q$, array[$o$more / cheaper$o$, $o$as / cheap$o$, $o$so / cheapest$o$, $o$than / more cheap$o$, $o$as / cheaper$o$], 4, $e$1. **Not nearly as...as** kalıbı kullanılır: **as**.
2. **Considerably** karşılaştırmayı pekiştirir: **cheaper**.

Diğer şıklar: **A** not nearly as ... as kalıbı ister / **B** considerably ile karşılaştırma gerekir / **C** so ... as olumsuzda kullanılabilir, şık eşleşmesi bozulur ve considerably ile üstünlük kullanılmaz / **D** not nearly as ... as kalıbı ister ve cheap -er alır.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$Of the two proposals, the first is ---- practical, and it is ---- the more economical of the two.$q$, array[$o$the most / also$o$, $o$the more / even$o$, $o$most / so$o$, $o$the more / also$o$, $o$more / either$o$], 3, $e$1. İki öğe arasında **the more** kullanılır: **the more**.
2. Ek bilgi **also** ile verilir: **also**.

Diğer şıklar: **A** iki öğe arasında the more kullanılır / **B** anlam bozulur / **C** iki öğe arasında the more kullanılır ve anlam bozulur / **E** the olmadan iki öğe arasında kalıp bozulur ve anlam bozulur.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Not only ---- she a brilliant scientist, but she is ---- an excellent teacher.$q$, array[$o$does / also$o$, $o$is / also$o$, $o$is / too$o$, $o$has / either$o$, $o$was / neither$o$], 1, $e$1. **Not only** sonrası devrik yapı kurulur: **is**.
2. **But also** kalıbı kullanılır: **also**.

Diğer şıklar: **A** Not only sonrası be fiili devrik gelir / **C** but ile also kullanılır / **D** Not only sonrası be fiili devrik gelir ve but ile also kullanılır / **E** şimdiki anlatım is ister ve but ile also kullanılır.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Her handwriting is ---- as mine, but her spelling is far ---- than mine.$q$, array[$o$same / better$o$, $o$the same / good$o$, $o$the same / better$o$, $o$like / best$o$, $o$similar / more good$o$], 2, $e$1. **The same as** kalıbı kullanılır: **the same**.
2. **Than** ile **better** gelir: **better**.

Diğer şıklar: **A** as ile the gerekir / **B** than ile karşılaştırma gerekir / **D** as ile the same kalıbı ve than ile üstünlük kullanılmaz / **E** as ile kullanılmaz ve good düzensizdir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The longer the film went on, the ---- bored the audience became, and the ---- they talked.$q$, array[$o$more / louder$o$, $o$most / louder$o$, $o$more / loudest$o$, $o$much / loud$o$, $o$very / more loud$o$], 0, $e$1. **The + karşılaştırma** yapısı kullanılır: **more**.
2. Aynı kurala göre: **louder**.

Diğer şıklar: **B** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** the + karşılaştırma ister ve loud -er alır.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$It is ---- the most difficult exam I have ever taken, and ---- the most important one.$q$, array[$o$far by / probably$o$, $o$by far / probably$o$, $o$by far / probable$o$, $o$much / probability$o$, $o$very / more probably$o$], 1, $e$1. Üstünlüğü **by far** pekiştirir: **by far**.
2. Zarf **probably** olur: **probably**.

Diğer şıklar: **A** by far kalıbı / **C** zarf gerekir / **D** the most ile by far kullanılır ve isimdir / **E** the most ile by far kullanılır ve anlam bozulur.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Neither my brother ---- my sister likes spicy food, so we ---- order anything hot.$q$, array[$o$or / never$o$, $o$nor / ever$o$, $o$and / hardly$o$, $o$nor / never$o$, $o$but / seldom$o$], 3, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. **Never** hiç anlamı verir: **never**.

Diğer şıklar: **A** neither ile nor kullanılır / **B** olumlu fiille never gerekir / **C** neither ile nor kullanılır ve anlam bozulur / **E** neither ile nor kullanılır ve anlam bozulur.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$This year's profits are slightly ---- than last year's, but the sales are ---- higher.$q$, array[$o$higher / considerably$o$, $o$high / considerably$o$, $o$higher / considerable$o$, $o$highest / consider$o$, $o$more high / considering$o$], 0, $e$1. **Than** ile **higher** gelir: **higher**.
2. Karşılaştırmayı **considerably** pekiştirir: **considerably**.

Diğer şıklar: **B** than ile karşılaştırma ister / **C** zarf gerekir / **D** than ile üstünlük kullanılmaz ve fiildir / **E** high -er alır ve bağlaç işlevi görür.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$Neither the coach nor the players ---- ready when the match started, and neither of them ---- an explanation.$q$, array[$o$was / offered$o$, $o$were / offer$o$, $o$is / have offered$o$, $o$are / are offering$o$, $o$were / offered$o$], 4, $e$1. **Nor** sonrası en yakın özne çoğul olduğundan **were** gelir: **were**.
2. **Neither of** tekil fiil ister, geçmiş anlatımda **offered** gelir: **offered**.

Diğer şıklar: **A** nor sonrası en yakın özne çoğul olduğundan were gelir / **B** neither of tekil fiil ister, geçmiş anlatım Past Simple / **C** geçmiş anlatım gerekir ve geçmiş anlatım Past Simple ister / **D** geçmiş anlatım gerekir ve geçmiş anlatım Past Simple ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Comparison ve Correlatives konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$My house is ---- than yours, but your garden is ---- than mine.$q$, array[$o$small / bigger$o$, $o$smaller / big$o$, $o$smallest / biggest$o$, $o$more small / more big$o$, $o$smaller / bigger$o$], 4, $e$1. **Than** ile **smaller** gelir: **smaller**.
2. Aynı kurala göre: **bigger**.

Diğer şıklar: **A** than ile karşılaştırma ister / **B** than ile karşılaştırma ister / **C** than ile üstünlük kullanılmaz ve than ile üstünlük kullanılmaz / **D** small -er alır ve big -er alır.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$Mehmet is the ---- player in the team, and he is also the ----.$q$, array[$o$best / most experienced$o$, $o$better / most experienced$o$, $o$best / more experienced$o$, $o$good / experiencedest$o$, $o$most good / most experienced$o$], 0, $e$1. Düzensiz üstünlük **best** olur: **best**.
2. Uzun sıfatta **most experienced** kullanılır: **most experienced**.

Diğer şıklar: **B** takım içinde üstünlük gerekir / **C** takım içinde üstünlük gerekir / **D** takım içinde üstünlük gerekir ve biçim yanlış / **E** good düzensizdir ve doğru, şık eşleşmesi bozulur.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$This bag is ---- expensive as that one, but it is not as ----.$q$, array[$o$so / durable$o$, $o$as / durable$o$, $o$as / durabler$o$, $o$than / more durable$o$, $o$more / most durable$o$], 1, $e$1. **As...as** kalıbı kullanılır: **as**.
2. **As** sonrası yalın sıfat gelir: **durable**.

Diğer şıklar: **A** as ... as kalıbı ister / **C** biçim yanlış / **D** as ... as kalıbı ister ve as ... as arasında yalın sıfat gelir / **E** as ... as kalıbı ister ve as ... as arasında yalın sıfat gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Both my father ---- my mother work at the hospital, and neither of them ---- a car.$q$, array[$o$or / drives$o$, $o$and / drive$o$, $o$and / drives$o$, $o$nor / are driving$o$, $o$but / have drive$o$], 2, $e$1. **Both...and** kalıbı kullanılır: **and**.
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
  (11, 'ydt-dil', null::integer, $q$Neither the manager ---- his two assistants were informed of the change, and ---- of them complained.$q$, array[$o$or / none$o$, $o$nor / neither$o$, $o$and / no$o$, $o$but / nobody$o$, $o$nor / none$o$], 4, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
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
  (16, 'ydt-dil', null::integer, $q$Not only ---- the manager reject the proposal, but he also ---- the team for wasting his time.$q$, array[$o$does / criticised$o$, $o$did / criticised$o$, $o$did / has criticised$o$, $o$has / criticises$o$, $o$was / was criticising$o$], 1, $e$1. **Not only** sonrası devrik yapı **did** ile kurulur: **did**.
2. Geçmiş anlatım Past Simple ister: **criticised**.

Diğer şıklar: **A** geçmiş anlatım gerekir / **C** geçmiş anlatım gerekir / **D** geçmiş anlatım gerekir ve geçmiş anlatım gerekir / **E** Not only sonrası did gerekir ve tamamlanmış eylem anlatılıyor.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$He has neither the experience ---- the qualifications for the job, ---- is he willing to learn.$q$, array[$o$nor / nor$o$, $o$or / nor$o$, $o$nor / or$o$, $o$and / and$o$, $o$but / but$o$], 0, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
2. Devrik yapıda **nor is he** kullanılır: **nor**.

Diğer şıklar: **B** neither ile nor kullanılır / **C** nor ile devrik yapı kurulur / **D** neither ile nor kullanılır ve nor ile devrik yapı kurulur / **E** neither ile nor kullanılır ve nor ile devrik yapı kurulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The more she thought about the offer, the ---- convinced she became that it was ---- good to be true.$q$, array[$o$most / too$o$, $o$more / so$o$, $o$much / very$o$, $o$very / enough$o$, $o$more / too$o$], 4, $e$1. **The more..., the more** yapısı kullanılır: **more**.
2. **Too good to be true** kalıbı kullanılır: **too**.

Diğer şıklar: **A** the + karşılaştırma ister / **B** to be true ile too kullanılır / **C** the + karşılaştırma ister ve to be true ile too kullanılır / **D** the + karşılaştırma ister ve too good to be true kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Of the three candidates, Ayşe is ---- qualified, but her sister, the younger of the two, is ---- experienced.$q$, array[$o$more / more$o$, $o$the most / the most$o$, $o$most / most$o$, $o$the most / more$o$, $o$the more / much$o$], 3, $e$1. Üç kişi arasında **the most** kullanılır: **the most**.
2. İki kişi arasında **more** kullanılır: **more**.

Diğer şıklar: **A** üç kişi arasında üstünlük the most ister / **B** iki kişi arasında more kullanılır / **C** the olmadan üstünlük kalıp bozulur ve iki kişi arasında more kullanılır / **E** iki kişi için kullanılır ve karşılaştırma için more gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The film was not as ---- as I had expected, nor was the book it was based on as ---- as people say.$q$, array[$o$good / great$o$, $o$well / great$o$, $o$good / greater$o$, $o$better / greatest$o$, $o$best / greatly$o$], 0, $e$1. **As...as** arasında yalın sıfat gelir: **good**.
2. Aynı kurala göre: **great**.

Diğer şıklar: **B** sıfat gerekir / **C** as ... as arasında yalın sıfat gelir / **D** as ... as arasında yalın sıfat gelir ve as ... as arasında yalın sıfat gelir / **E** as ... as arasında yalın sıfat gelir ve sıfat gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Comparison ve Correlatives konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (5, 'ydt-dil', null::integer, $q$Neither Ali ---- Veli passed the exam, so ---- of them can go to university this year.$q$, array[$o$or / neither$o$, $o$nor / none$o$, $o$nor / neither$o$, $o$and / both$o$, $o$but / either$o$], 2, $e$1. **Neither...nor** kalıbı kullanılır: **nor**.
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
  (9, 'ydt-dil', null::integer, $q$Neither of the answers ---- correct, but the second is ---- better than the first.$q$, array[$o$are / slightly$o$, $o$is / slight$o$, $o$were / slightness$o$, $o$have been / slighter$o$, $o$is / slightly$o$], 4, $e$1. **Neither of** tekil fiil ister: **is**.
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
  (13, 'ydt-dil', null::integer, $q$Both my sisters ---- doctors, and neither of them ---- to move abroad.$q$, array[$o$is / wants$o$, $o$are / want$o$, $o$be / are wanting$o$, $o$are / wants$o$, $o$being / have wanted$o$], 3, $e$1. **Both** çoğul fiil ister: **are**.
2. **Neither of** tekil fiil ister: **wants**.

Diğer şıklar: **A** both çoğul fiil ister / **B** neither of tekil fiil ister / **C** çekimli fiil gerekir ve neither of tekil fiil ister / **E** çekimli fiil gerekir ve neither of tekil fiil ister.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The higher you climb, the ---- the air becomes, and the ---- it gets to breathe.$q$, array[$o$thinner / harder$o$, $o$thin / harder$o$, $o$thinner / hard$o$, $o$thinnest / hardest$o$, $o$more thin / more hard$o$], 0, $e$1. **The + karşılaştırma** yapısı kullanılır: **thinner**.
2. Aynı kurala göre: **harder**.

Diğer şıklar: **B** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** the + karşılaştırma ister ve the + karşılaştırma ister / **E** thin -er alır ve hard -er alır.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The test was ---- difficult as we had feared, but it was ---- longer than usual.$q$, array[$o$no / considerably$o$, $o$not as / considerable$o$, $o$not as / considerably$o$, $o$less / consider$o$, $o$not so / considering$o$], 2, $e$1. **Not as...as** kalıbı kullanılır: **not as**.
2. Karşılaştırmayı **considerably** pekiştirir: **considerably**.

Diğer şıklar: **A** not as ... as kalıbı ister / **B** zarf gerekir / **D** not as ... as kalıbı ister ve fiildir / **E** so ... as olumsuzda kullanılabilir, şık eşleşmesi bozulur ve bağlaç işlevi görür.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The weather in the north is far ---- than in the south, but the south is ---- more expensive.$q$, array[$o$cold / far$o$, $o$colder / far$o$, $o$colder / very$o$, $o$coldest / so$o$, $o$more cold / too$o$], 1, $e$1. **Than** ile **colder** gelir: **colder**.
2. Karşılaştırmayı **far** pekiştirir: **far**.

Diğer şıklar: **A** than ile karşılaştırma ister / **C** karşılaştırmayı far pekiştirir / **D** than ile üstünlük kullanılmaz ve karşılaştırmayı far pekiştirir / **E** cold -er alır ve karşılaştırmayı far pekiştirir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Not until the results were published ---- he realise ---- badly he had done.$q$, array[$o$does / how$o$, $o$did / what$o$, $o$was / that$o$, $o$did / how$o$, $o$had / which$o$], 3, $e$1. **Not until** sonrası devrik yapı **did** ile kurulur: **did**.
2. **How badly** kalıbı kullanılır: **how**.

Diğer şıklar: **A** geçmiş anlatım gerekir / **B** how badly kalıbı / **C** Not until sonrası did gerekir ve how badly kalıbı / **E** Not until sonrası did gerekir ve how badly kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is by far ---- most experienced of the three, and he is ---- the oldest.$q$, array[$o$a / also$o$, $o$the / too$o$, $o$the / also$o$, $o$his / either$o$, $o$that / neither$o$], 2, $e$1. **By far the most** kalıbı kullanılır: **the**.
2. Ek bilgi **also** ile verilir: **also**.

Diğer şıklar: **A** by far ile the most gelir / **B** also bir cümlede ek bilgi verir, şık eşleşmesi bozulur / **D** by far ile the most gelir ve olumlu cümlede kullanılmaz / **E** by far ile the most gelir ve olumlu cümlede kullanılmaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The longer the negotiations dragged on, the ---- optimistic the delegates became, and the ---- likely a deal seemed.$q$, array[$o$least / less$o$, $o$less / less$o$, $o$less / least$o$, $o$fewer / fewer$o$, $o$much / much$o$], 1, $e$1. **The less..., the less** yapısı kullanılır: **less**.
2. Aynı kurala göre: **less**.

Diğer şıklar: **A** the + karşılaştırma ister / **C** the + karşılaştırma ister / **D** sayılamayan sıfatla less gelir ve sıfatla less gelir / **E** the + karşılaştırma ister ve the + karşılaştırma ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The manager was not so much angry ---- disappointed, and not nearly ---- annoyed as his colleagues.$q$, array[$o$than / as$o$, $o$as / than$o$, $o$but / like$o$, $o$like / very$o$, $o$as / as$o$], 4, $e$1. **Not so much...as** kalıbı kullanılır: **as**.
2. **Not nearly as...as** kalıbı kullanılır: **as**.

Diğer şıklar: **A** not so much ... as kalıbı ister / **B** not nearly as ... as kalıbı ister / **C** not so much ... as kalıbı ister ve not nearly as ... as kalıbı ister / **D** not so much ... as kalıbı ister ve not nearly as ... as kalıbı ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conditionals konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conditionals konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$If you ---- ice, it ---- into water, so be careful.$q$, array[$o$heated / melts$o$, $o$heat / melted$o$, $o$will heat / will melt$o$, $o$would heat / would melt$o$, $o$heat / melts$o$], 4, $e$1. Genel doğruda **if + Present Simple** kullanılır: **heat**.
2. Sonuç Present Simple ile devam eder: **melts**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **C** if cümlesinde will kullanılmaz ve genel doğruda Present Simple tercih edilir / **D** genel doğru Present Simple ister ve genel doğruda would kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If it ---- tomorrow, we ---- the match, so let's hope for good weather.$q$, array[$o$will rain / will cancel$o$, $o$rains / cancelled$o$, $o$rained / would cancel$o$, $o$rains / will cancel$o$, $o$is raining / cancel$o$], 3, $e$1. Gerçekçi koşulda **if + Present Simple** kullanılır: **rains**.
2. Sonuç **will + V1** ile verilir: **will cancel**.

Diğer şıklar: **A** if cümlesinde will kullanılmaz / **B** sonuç cümlesi will ister / **C** gerçekçi koşul Present Simple ister ve gerçekçi koşulda will gelir / **E** gelecek koşul Present Simple ister ve gelecek kararı will ile verilir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If I ---- you, I ---- that job offer without thinking twice.$q$, array[$o$am / would accept$o$, $o$were / will accept$o$, $o$were / would accept$o$, $o$was / accepted$o$, $o$would be / have accepted$o$], 2, $e$1. **If I were you** gerçek dışı tavsiye kurar: **were**.
2. Sonuç **would + V1** ile verilir: **would accept**.

Diğer şıklar: **A** gerçek dışı durumda were kullanılır / **B** gerçek dışı sonuç would ister / **D** resmi anlatımda were tercih edilir ve sonuç cümlesi would ister / **E** if cümlesinde would kullanılmaz ve sonuç cümlesi would ister.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$If she ---- the bus, she ---- late for the interview, so she took a taxi instead.$q$, array[$o$had missed / would have been$o$, $o$missed / would have been$o$, $o$had missed / would be$o$, $o$has missed / was$o$, $o$would miss / had been$o$], 0, $e$1. Geçmiş gerçek dışılık **if + Past Perfect** ile kurulur: **had missed**.
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
  (13, 'ydt-dil', null::integer, $q$---- I known about the delay, I ---- earlier, and I wouldn't be waiting at the airport now.$q$, array[$o$If / would have left$o$, $o$Had / would leave$o$, $o$Should / left$o$, $o$Were / had left$o$, $o$Had / would have left$o$], 4, $e$1. Geçmiş koşul devrik yapı **Had + özne + V3** ile kurulur: **Had**.
2. Sonuç **would have + V3** ile verilir: **would have left**.

Diğer şıklar: **A** if olmadan devrik yapı Had ile kurulur / **B** geçmiş sonuç would have + V3 ister / **C** geçmiş koşul Had ister ve sonuç cümlesi would ister / **D** geçmiş koşul Had ister ve sonuç cümlesi would ister.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$---- you need any help, don't hesitate to ask, and ---- you decide to join us, let me know in advance.$q$, array[$o$Would / should$o$, $o$Should / should$o$, $o$Should / would$o$, $o$Could / could$o$, $o$Might / might$o$], 1, $e$1. **Should + özne** gerçekçi koşulu devrik yapıyla kurar: **Should**.
2. Aynı kurala göre: **should**.

Diğer şıklar: **A** gerçekçi koşul Should ile kurulur / **C** gerçekçi koşul should ile kurulur / **D** gerçekçi koşul Should ile kurulur ve gerçekçi koşul should ile kurulur / **E** gerçekçi koşul Should ile kurulur ve gerçekçi koşul should ile kurulur.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Were he ---- the truth, he ---- the situation differently, but he has been misinformed.$q$, array[$o$knew / would see$o$, $o$to know / saw$o$, $o$to know / would see$o$, $o$known / will see$o$, $o$knowing / would have seen$o$], 2, $e$1. **Were he to** gerçek dışı devrik koşuldur: **to know**.
2. Sonuç **would + V1** ile verilir: **would see**.

Diğer şıklar: **A** Were he sonrasında to-infinitive gelir / **B** sonuç cümlesi would ister / **D** Were he sonrasında to know gelir ve gerçek dışı sonuç would ister / **E** Were he sonrasında to know gelir ve şimdiki gerçek dışılık would ister.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$If it ---- for her help, I ---- the project on time, so I owe her a lot.$q$, array[$o$isn't / wouldn't have finished$o$, $o$hadn't been / won't finish$o$, $o$wasn't / wouldn't finish$o$, $o$wouldn't be / didn't finish$o$, $o$hadn't been / wouldn't have finished$o$], 4, $e$1. **If it hadn't been for** geçmiş koşulu kurar: **hadn't been**.
2. Sonuç **wouldn't have + V3** ile verilir: **wouldn't have finished**.

Diğer şıklar: **A** geçmiş koşul hadn't been ister / **B** geçmiş sonuç wouldn't have + V3 ister / **C** geçmiş koşul hadn't been ister ve geçmiş sonuç wouldn't have + V3 ister / **D** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- the traffic been lighter, we ---- on time, but we were stuck for two hours.$q$, array[$o$If / would have arrived$o$, $o$Had / would arrive$o$, $o$Were / arrived$o$, $o$Had / would have arrived$o$, $o$Should / had arrived$o$], 3, $e$1. **Had + özne + V3** geçmiş koşulu kurar: **Had**.
2. Sonuç **would have + V3** ile verilir: **would have arrived**.

Diğer şıklar: **A** devrik yapıda Had gerekir / **B** geçmiş sonuç would have + V3 ister / **C** geçmiş koşul Had ister ve sonuç cümlesi would ister / **E** geçmiş koşul Had ister ve sonuç cümlesi would ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Suppose you ---- a million pounds, what ---- you do with the money?$q$, array[$o$had won / would$o$, $o$won / will$o$, $o$won / would$o$, $o$will win / did$o$, $o$would win / shall$o$], 2, $e$1. **Suppose** gerçek dışı durumda Past Simple alır: **won**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** gerçek dışı şimdi Past Simple ister / **B** gerçek dışı sonuç would ister / **D** Suppose gerçek dışı Past Simple ister ve sonuç cümlesinde would gerekir / **E** Suppose sonrasında would olmaz ve gerçek dışı sonuç would ister.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$You can borrow my car ---- you promise to drive carefully, otherwise I ---- be able to trust you.$q$, array[$o$unless / won't$o$, $o$as long as / won't$o$, $o$as long as / wouldn't$o$, $o$although / shouldn't$o$, $o$despite / can't$o$], 1, $e$1. **As long as** koşul bildirir: **as long as**.
2. Gerçekçi sonuç **won't** ile verilir: **won't**.

Diğer şıklar: **A** olumsuz anlam yaratır / **C** gerçekçi sonuç won't ister / **D** zıtlık anlamı yaratır ve anlam bozulur / **E** edat olarak kullanılır ve anlam bozulur.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$If the water ---- to boil away, the pan ---- empty, so turn off the gas immediately.$q$, array[$o$were / would be$o$, $o$had / would be$o$, $o$were / will be$o$, $o$is going / was$o$, $o$would / is$o$], 0, $e$1. Gerçek dışı koşulda **were** kullanılır: **were**.
2. Sonuç **would + V1** ile verilir: **would be**.

Diğer şıklar: **B** if cümlesinde gerçek dışı Past Simple ister / **C** gerçek dışı sonuç would ister / **D** anlam bozulur ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conditionals konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conditionals konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (6, 'ydt-dil', null::integer, $q$I didn't tell her the truth. ----, she would have been very upset, and I ---- have hurt her for the world.$q$, array[$o$Unless / wouldn't$o$, $o$Otherwise / won't$o$, $o$Otherwise / wouldn't$o$, $o$If / didn't$o$, $o$Although / am not$o$], 2, $e$1. **Otherwise** önceki duruma göre alternatif sonucu verir: **otherwise**.
2. Sonuç **wouldn't have + V3** ile verilir: **wouldn't**.

Diğer şıklar: **A** önceki cümleyle bağlam kurmaz / **B** gerçek dışı geçmiş sonuç wouldn't have ister / **D** önceki cümleyle bağlam kurmaz ve anlam bozulur / **E** zıtlık anlamı yaratır ve anlam bozulur.$e$, 3),
  (7, 'ydt-dil', null::integer, $q$If you had left earlier, you ---- stuck in the traffic now, and you ---- the beginning of the film.$q$, array[$o$wouldn't be / wouldn't have missed$o$, $o$won't be / wouldn't have missed$o$, $o$wouldn't be / won't miss$o$, $o$aren't / didn't miss$o$, $o$hadn't been / hadn't missed$o$], 0, $e$1. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.
2. Geçmiş sonuç **would have + V3** ile verilir: **wouldn't have missed**.

Diğer şıklar: **B** karma koşulda would gerekir / **C** geçmiş sonuç wouldn't have + V3 ister / **D** karma koşulda would gerekir ve sonuç cümlesi would ister / **E** now şimdiki sonuç ister ve sonuç cümlesi would ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$If only I ---- more money, I ---- that expensive house, but I can't afford it.$q$, array[$o$have / would buy$o$, $o$had / would buy$o$, $o$had / will buy$o$, $o$will have / bought$o$, $o$would have / have bought$o$], 1, $e$1. **If only + Past Simple** gerçek dışı dilek kurar: **had**.
2. Sonuç **would + V1** ile verilir: **would buy**.

Diğer şıklar: **A** gerçek dışı dilek Past Simple ister / **C** gerçek dışı sonuç would ister / **D** if only sonrasında will olmaz ve sonuç cümlesi would ister / **E** if only sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Even if he ---- the exam, he ---- the course because his attendance was too low.$q$, array[$o$passes / would still have failed$o$, $o$had passed / would still fail$o$, $o$passed / still failed$o$, $o$would pass / fails$o$, $o$had passed / would still have failed$o$], 4, $e$1. **Even if + Past Perfect** geçmiş gerçek dışılığı kurar: **had passed**.
2. Sonuç **would still have + V3** ile verilir: **would still have failed**.

Diğer şıklar: **A** geçmiş gerçek dışılık Past Perfect ister / **B** geçmiş sonuç would have + V3 ister / **C** geçmiş gerçek dışılık Past Perfect ister ve sonuç cümlesi would have ister / **D** if cümlesinde would olmaz ve sonuç cümlesi would have ister.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$If you ---- to see the manager, ---- him that the report is ready.$q$, array[$o$happen / tell$o$, $o$happened / tell$o$, $o$happen / told$o$, $o$will happen / telling$o$, $o$would happen / to tell$o$], 0, $e$1. **If you happen to** olasılık bildirir: **happen**.
2. Emir kipi yalın fiille kurulur: **tell**.

Diğer şıklar: **B** imperative ile Present Simple gelir / **C** if cümlesinden sonra emir kipi gelir / **D** if cümlesinde will olmaz ve if cümlesinden sonra emir kipi gelir / **E** if cümlesinde would olmaz ve if cümlesinden sonra emir kipi gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$I'll call you as soon as I ---- there, and if you ---- me, I'll ask my brother to pick you up.$q$, array[$o$will get / need$o$, $o$get / will need$o$, $o$get / need$o$, $o$got / needed$o$, $o$have got / would need$o$], 2, $e$1. **As soon as** sonrasında gelecek için Present Simple gelir: **get**.
2. **If** sonrasında Present Simple gelir: **need**.

Diğer şıklar: **A** as soon as sonrasında will olmaz / **B** if cümlesinde will olmaz / **D** gelecek zaman Present Simple ister ve gerçekçi koşul Present Simple ister / **E** anlam bozulur ve gerçekçi koşul Present Simple ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$If I ---- the lottery, I ---- round the world, but the chance is very small.$q$, array[$o$win / would travel$o$, $o$won / will travel$o$, $o$had won / travelled$o$, $o$won / would travel$o$, $o$would win / have travelled$o$], 3, $e$1. Gerçek dışı koşul **if + Past Simple** ile kurulur: **won**.
2. Sonuç **would + V1** ile verilir: **would travel**.

Diğer şıklar: **A** gerçek dışı koşul Past Simple ister / **B** gerçek dışı sonuç would ister / **C** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$You won't succeed ---- you try harder, and you will regret it ---- you give up now.$q$, array[$o$if / if$o$, $o$unless / unless$o$, $o$although / although$o$, $o$because / because$o$, $o$unless / if$o$], 4, $e$1. **Unless** olumsuz koşul bildirir: **unless**.
2. Olumlu koşul **if** ile kurulur: **if**.

Diğer şıklar: **A** unless olumsuz anlam taşır, won't succeed ile birlikte unless gerekir / **B** olumlu sonuç gerekir, if kullanılır / **C** zıtlık anlamı yaratır ve zıtlık anlamı yaratır / **D** sebep anlamı yaratır ve sebep anlamı yaratır.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$If I had known you were ill, I ---- you, but nobody told me about it until yesterday.$q$, array[$o$will visit$o$, $o$would have visited$o$, $o$would visit$o$, $o$visited$o$, $o$have visited$o$], 1, $e$1. Geçmiş sonuç **would have + V3** ile verilir: **would have visited**.

Diğer şıklar: **A** geçmiş sonuç would have + V3 ister / **C** geçmiş sonuç would have + V3 ister / **D** sonuç cümlesi would ister / **E** sonuç cümlesi would ister.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Unless the government ---- action soon, the situation ---- even worse.$q$, array[$o$will take / will get$o$, $o$takes / would get$o$, $o$takes / will get$o$, $o$took / got$o$, $o$has taken / gets$o$], 2, $e$1. **Unless** sonrasında Present Simple gelir: **takes**.
2. Gerçekçi sonuç **will + V1** ile verilir: **will get**.

Diğer şıklar: **A** unless sonrasında will olmaz / **B** gerçekçi sonuç will ister / **D** gerçekçi koşul Present Simple ister ve gerçekçi sonuç will ister / **E** gelecek koşul Present Simple ister ve gelecek tahmin will ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If she ---- so stubborn, she ---- more friends now, but she never listens to anyone.$q$, array[$o$weren't / would have$o$, $o$hadn't been / would have$o$, $o$weren't / would had$o$, $o$isn't / will have$o$, $o$wouldn't be / had$o$], 0, $e$1. Şimdiki gerçek dışılık **if + Past Simple** ile kurulur: **weren't**.
2. Sonuç **would + V1** ile verilir: **would have**.

Diğer şıklar: **B** şimdiki karakter için Past Simple gelir / **C** biçim yanlış / **D** gerçek dışı karma koşul ister ve gerçek dışı sonuç would ister / **E** if cümlesinde would olmaz ve sonuç cümlesi would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$But for his quick reaction, the child ---- killed, and the driver ---- never forgiven himself.$q$, array[$o$will be / would have$o$, $o$would have been / will have$o$, $o$was / had$o$, $o$had been / would$o$, $o$would have been / would have$o$], 4, $e$1. **But for** gerçek dışı geçmiş koşulu kurar: **would have been**.
2. Aynı kurala göre: **would have**.

Diğer şıklar: **A** geçmiş sonuç would have + V3 ister / **B** geçmiş sonuç would have + V3 ister / **C** But for sonrası would have ister ve But for sonrası would have ister / **D** But for sonrası would have ister ve ardından V3 gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I wouldn't have lent him the money if I ---- him so unreliable, and I ---- him again even if he asked.$q$, array[$o$knew / wouldn't trust$o$, $o$had known / wouldn't trust$o$, $o$had known / didn't trust$o$, $o$know / haven't trusted$o$, $o$would know / won't have trusted$o$], 1, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had known**.
2. Gelecek gerçek dışı sonuç **wouldn't + V1** ile verilir: **wouldn't trust**.

Diğer şıklar: **A** geçmiş koşul Past Perfect ister / **C** even if ile gerçek dışı sonuç would ister / **D** geçmiş koşul Past Perfect ister ve gerçek dışı gelecek would ister / **E** if cümlesinde would olmaz ve gerçek dışı gelecek would ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Were it not for the scholarship, he ---- study abroad, and he says he ---- always be grateful for it.$q$, array[$o$couldn't / will$o$, $o$can't / will$o$, $o$couldn't / is$o$, $o$won't be able to / was$o$, $o$hadn't / had been$o$], 0, $e$1. **Were it not for** gerçek dışı şimdiki koşuldur: **couldn't**.
2. **Will always be** gelecek bildirir: **will**.

Diğer şıklar: **B** gerçek dışı sonuç could ister / **C** always be ile will gerekir / **D** gerçek dışı sonuç could ister ve always be ile will gerekir / **E** anlam bozulur ve always be ile will gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Supposing the plane ---- delayed, what ---- you do about your connection?$q$, array[$o$is / would$o$, $o$were / will$o$, $o$will be / did$o$, $o$were / would$o$, $o$had been / should$o$], 3, $e$1. **Supposing** gerçek dışı durumda Past Simple alır: **were**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** Supposing sonrasında gerçek dışı Past Simple gelir / **B** gerçek dışı sonuç would ister / **C** Supposing sonrasında will olmaz ve soru yapısında would gerekir / **E** şimdiki gerçek dışılık Past Simple ister ve anlam bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conditionals konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conditionals konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conditionals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$If you ---- sugar and water, it ---- into a sweet liquid.$q$, array[$o$mixed / turns$o$, $o$mix / turned$o$, $o$will mix / will turn$o$, $o$would mix / would turn$o$, $o$mix / turns$o$], 4, $e$1. Genel doğruda **if + Present Simple** kullanılır: **mix**.
2. Sonuç Present Simple ile söylenir: **turns**.

Diğer şıklar: **A** genel doğru Present Simple ister / **B** genel doğru Present Simple ister / **C** if cümlesinde will olmaz ve genel doğrularda Present Simple tercih edilir / **D** genel doğru Present Simple ister ve genel doğruda would olmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$If I ---- rich, I ---- a big house, but I'm not rich.$q$, array[$o$am / would buy$o$, $o$were / would buy$o$, $o$were / will buy$o$, $o$will be / bought$o$, $o$had been / have bought$o$], 1, $e$1. Gerçek dışı koşulda **were** kullanılır: **were**.
2. Sonuç **would + V1** ile verilir: **would buy**.

Diğer şıklar: **A** gerçek dışı koşulda were kullanılır / **C** gerçek dışı sonuç would ister / **D** if cümlesinde will olmaz ve sonuç cümlesi would ister / **E** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesi would ister.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$If it ---- tomorrow, I ---- at home and read a book.$q$, array[$o$will rain / will stay$o$, $o$rains / stayed$o$, $o$rained / would stay$o$, $o$rains / will stay$o$, $o$is rained / have stayed$o$], 3, $e$1. Gerçekçi koşulda **if + Present Simple** kullanılır: **rains**.
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
  (15, 'ydt-dil', null::integer, $q$Had it not been for the flood, the harvest ---- better, and the farmers ---- in debt today.$q$, array[$o$would have been / wouldn't be$o$, $o$will be / wouldn't be$o$, $o$would have been / won't be$o$, $o$would be / weren't$o$, $o$had been / hadn't been$o$], 0, $e$1. **Had it not been for** geçmiş gerçek dışı koşuldur: **would have been**.
2. Şimdiki sonuç **would + V1** ile verilir: **wouldn't be**.

Diğer şıklar: **B** geçmiş sonuç would have + V3 ister / **C** karma sonuç wouldn't be ister, şık eşleşmesi bozulur / **D** geçmiş sonuç would have + V3 ister ve sonuç cümlesi would ister / **E** Had it not been for sonrası would have ister ve sonuç cümlesi would ister.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The company would not be in such trouble now if it ---- its customers more seriously in the past.$q$, array[$o$took$o$, $o$had taken$o$, $o$takes$o$, $o$would have taken$o$, $o$will take$o$], 1, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had taken**.

Diğer şıklar: **A** karma koşulda geçmiş koşul Past Perfect ister / **C** karma koşulda geçmiş koşul Past Perfect ister / **D** if cümlesinde would olmaz / **E** if cümlesinde will olmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- you ever need a reference, I ---- happy to write one for you, provided you give me notice.$q$, array[$o$Would / will be$o$, $o$Should / was$o$, $o$Could / am$o$, $o$Might / have been$o$, $o$Should / will be$o$], 4, $e$1. **Should + özne** gerçekçi koşulu devrik yapıyla kurar: **Should**.
2. Sonuç **will + V1** ile verilir: **will be**.

Diğer şıklar: **A** gerçekçi koşul Should ile kurulur / **B** sonuç gelecek bir zaman anlatır / **C** gerçekçi koşul Should ile kurulur ve sonuç gelecek bir zaman anlatır / **D** gerçekçi koşul Should ile kurulur ve sonuç gelecek bir zaman anlatır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$If she ---- anything about the plan, she would have told us, so she probably ---- nothing at the time.$q$, array[$o$had known / knew$o$, $o$knew / knew$o$, $o$had known / knows$o$, $o$knows / has known$o$, $o$would know / will know$o$], 0, $e$1. Geçmiş koşul **if + Past Perfect** ile kurulur: **had known**.
2. **At the time** geçmiş zaman ister: **knew**.

Diğer şıklar: **B** geçmiş koşul Past Perfect ister / **C** at the time geçmiş zaman ister / **D** geçmiş koşul Past Perfect ister ve at the time geçmiş zaman ister / **E** if cümlesinde would olmaz ve at the time geçmiş zaman ister.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Were the company ---- its prices, it ---- a large number of customers, so the board is hesitating.$q$, array[$o$raising / would lose$o$, $o$to raise / will lose$o$, $o$to raise / would lose$o$, $o$raised / lost$o$, $o$raises / would have lost$o$], 2, $e$1. **Were + özne + to** gerçek dışı devrik koşuldur: **to raise**.
2. Sonuç **would + V1** ile verilir: **would lose**.

Diğer şıklar: **A** Were the company sonrasında to-infinitive gelir / **B** gerçek dışı sonuç would ister / **D** Were the company sonrasında to raise gelir ve sonuç cümlesi would ister / **E** Were the company sonrasında to raise gelir ve şimdiki gerçek dışılık would ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$I'm afraid I can't go with you. I ---- gladly otherwise, but I ---- my sister's children this weekend.$q$, array[$o$will / am looking after$o$, $o$would / look after$o$, $o$can / looked after$o$, $o$would / am looking after$o$, $o$must / have looked after$o$], 3, $e$1. Gerçek dışı sonuç **would + V1** ile verilir: **would**.
2. Planlanmış yakın gelecek **Present Continuous** ile söylenir: **am looking after**.

Diğer şıklar: **A** gerçek dışı bağlam would ister / **B** planlı eylem Present Continuous ister / **C** gerçek dışı bağlam would ister ve this weekend gelecek zaman ister / **E** gerçek dışı bağlam would ister ve this weekend gelecek zaman ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Noun Clauses konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Noun Clauses konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (15, 'ydt-dil', null::integer, $q$The manager insisted that every employee ---- present at the meeting, and he demanded that nobody ---- early.$q$, array[$o$is / leave$o$, $o$be / leaves$o$, $o$be / leave$o$, $o$was / left$o$, $o$will be / would leave$o$], 2, $e$1. **Insist that** sonrasında yalın fiil gelir: **be**.
2. **Demand that** sonrasında yalın fiil gelir: **leave**.

Diğer şıklar: **A** insist that sonrasında yalın fiil gelir / **B** demand that sonrasında yalın fiil gelir / **D** insist that sonrasında yalın fiil gelir ve demand that sonrasında yalın fiil gelir / **E** insist that sonrasında yalın fiil gelir ve demand that sonrasında yalın fiil gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$It is essential that the patient ---- lifted until the doctor arrives, and it is advisable that she ---- still.$q$, array[$o$is not / stay$o$, $o$not be / stay$o$, $o$not be / stays$o$, $o$does not be / stayed$o$, $o$will not be / would stay$o$], 1, $e$1. **Essential that** sonrasında yalın fiil gelir: **not be**.
2. **Advisable that** sonrasında yalın fiil gelir: **stay**.

Diğer şıklar: **A** essential that sonrasında yalın fiil gelir / **C** advisable that sonrasında yalın fiil gelir / **D** biçim yanlış ve advisable that sonrasında yalın fiil gelir / **E** essential that sonrasında yalın fiil gelir ve advisable that sonrasında yalın fiil gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I can't remember ---- I put my keys, so I'll search ---- I have been today.$q$, array[$o$what / wherever$o$, $o$where / however$o$, $o$which / whatever$o$, $o$whom / whoever$o$, $o$where / wherever$o$], 4, $e$1. Yer dolaylı sorusunda **where** gelir: **where**.
2. Yer bağlacı **wherever** kullanılır: **wherever**.

Diğer şıklar: **A** yer sorusu where ister / **B** yer anlamı wherever ister / **C** yer sorusu where ister ve yer anlamı wherever ister / **D** yer sorusu where ister ve kişi zamiridir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Nobody was sure ---- the old building would be demolished, but everyone agreed ---- it was dangerous.$q$, array[$o$whether / that$o$, $o$that / that$o$, $o$whether / whether$o$, $o$what / what$o$, $o$which / which$o$], 0, $e$1. Belirsizlik **whether** ile verilir: **whether**.
2. Bildirme cümlesinde **that** gelir: **that**.

Diğer şıklar: **B** whether sonrası seçenek bildirir, belirsizlik için whether gerekir / **C** agree sonrası that gelir / **D** belirsizlik için whether gerekir ve agree sonrası that gelir / **E** belirsizlik için whether gerekir ve agree sonrası that gelir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$---- surprised me most was ---- she had never told anyone about her plan.$q$, array[$o$That / that$o$, $o$What / what$o$, $o$What / that$o$, $o$Which / which$o$, $o$Whose / whether$o$], 2, $e$1. **What** konu yan cümlesi başlatır: **What**.
2. Bildirme cümlesinde **that** gelir: **that**.

Diğer şıklar: **A** konu yan cümlesi what ister / **B** bildirme cümlesinde that gelir / **D** kısıtlama yoktur, what gerekir ve bildirme cümlesinde that gelir / **E** anlam bozulur ve olgu bildirir, that gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- you choose to do is entirely up to you, but you must tell me ---- you have decided.$q$, array[$o$Whichever / what$o$, $o$Whatever / whom$o$, $o$Whoever / whose$o$, $o$Whatever / what$o$, $o$However / whereas$o$], 3, $e$1. **Whatever** konu yan cümlesi başlatır: **Whatever**.
2. Nesne yan cümlesi **what** ile başlar: **what**.

Diğer şıklar: **A** sınırsız seçenek whatever ister / **B** cansız nesne için what gerekir / **C** eylem için whatever gerekir ve sahiplik anlamı yok / **E** zarftır ve bağlaç anlamı bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Noun Clauses konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Noun Clauses konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$---- the new law will take effect remains unclear, and ---- it will be enforced is equally uncertain.$q$, array[$o$That / how$o$, $o$When / where$o$, $o$What / what$o$, $o$Which / that$o$, $o$When / how$o$], 4, $e$1. Konu yan cümlesi **When** ile başlar: **When**.
2. Konu yan cümlesi **how** ile başlar: **how**.

Diğer şıklar: **A** when konu yan cümlesi başlatır / **B** nasıl anlamı how ister / **C** zaman anlamı when ister ve how anlamı bozulur / **D** zaman anlamı when ister ve how anlamı bozulur.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The teacher was impressed by ---- clearly the boy had explained the problem and by ---- he had solved it.$q$, array[$o$what / the way$o$, $o$how / the way$o$, $o$how / how way$o$, $o$that / by way$o$, $o$which / the how$o$], 1, $e$1. **How clearly** kalıbı kullanılır: **how**.
2. **The way** yöntemi bildirir: **the way**.

Diğer şıklar: **A** how clearly kalıbı / **C** biçim yanlış / **D** how clearly kalıbı ve anlam bozulur / **E** how clearly kalıbı ve biçim yanlış.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She didn't realise ---- serious the situation was until the doctor told her ---- she had to do.$q$, array[$o$how / what$o$, $o$what / what$o$, $o$how / that$o$, $o$that / which$o$, $o$which / whether$o$], 0, $e$1. **How + sıfat** kalıbı kullanılır: **how**.
2. Dolaylı soruda **what** kullanılır: **what**.

Diğer şıklar: **B** how serious kalıbı / **C** wh-sorusu what ister / **D** how serious kalıbı ve sınırsız seçenek what ister / **E** how serious kalıbı ve anlam bozulur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$We were not told ---- the delay had occurred, but we were assured ---- it would not happen again.$q$, array[$o$who / that$o$, $o$why / what$o$, $o$whom / if$o$, $o$which / how$o$, $o$why / that$o$], 4, $e$1. Neden dolaylı sorusu **why** ile kurulur: **why**.
2. **Assure** sonrası **that** gelir: **that**.

Diğer şıklar: **A** neden anlamı why ister / **B** assured sonrası that gelir / **C** neden anlamı why ister ve assured sonrası that gelir / **D** neden anlamı why ister ve assured sonrası that gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$I'm not interested in ---- he says, but I'm interested in ---- he does.$q$, array[$o$that / what$o$, $o$what / that$o$, $o$which / which$o$, $o$what / what$o$, $o$whether / whether$o$], 3, $e$1. **In** sonrası **what** konu yan cümlesi başlatır: **what**.
2. Aynı kurala göre: **what**.

Diğer şıklar: **A** in sonrası what gelir / **B** in sonrası what gelir / **C** in sonrası what gelir ve in sonrası what gelir / **E** anlam bozulur ve anlam bozulur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Noun Clauses konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Noun Clauses konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Noun Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (10, 'ydt-dil', null::integer, $q$---- the minister resigned surprised nobody, but ---- he did it so suddenly puzzled everyone.$q$, array[$o$What / why$o$, $o$That / whom$o$, $o$That / why$o$, $o$Which / whose$o$, $o$How / what$o$], 2, $e$1. Olgu bildiren konu yan cümlesi **That** ile başlar: **That**.
2. Neden konu yan cümlesi **why** ile başlar: **why**.

Diğer şıklar: **A** olgu bildirir, that gerekir / **B** neden anlamı why ister / **D** olgu bildirir, that gerekir ve sahiplik anlamı yok / **E** olgu bildirir, that gerekir ve neden anlamı why ister.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$He answered ---- he was asked, and he explained ---- he had done it.$q$, array[$o$that / why$o$, $o$what / because$o$, $o$which / what$o$, $o$who / where$o$, $o$what / why$o$], 4, $e$1. Nesne yan cümlesi **what** ile başlar: **what**.
2. Neden dolaylı sorusu **why** ile kurulur: **why**.

Diğer şıklar: **A** nesne yan cümlesi what ister / **B** explain sonrası why gelir / **C** sınırsız seçenek what ister ve neden anlamı why ister / **D** cansız nesne için kullanılmaz ve neden anlamı why ister.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I can't decide ---- to buy the red dress or the blue one, so I'll take ---- is cheaper.$q$, array[$o$which / whichever$o$, $o$what / whichever$o$, $o$which / whatever$o$, $o$that / whoever$o$, $o$who / however$o$], 0, $e$1. Sınırlı seçenekte **which** kullanılır: **which**.
2. Sınırlı seçenekte **whichever** kullanılır: **whichever**.

Diğer şıklar: **B** iki seçenek which ister / **C** iki seçenek whichever ister / **D** iki seçenek which ister ve cansız nesne için kullanılmaz / **E** cansız nesne için kullanılmaz ve zarftır.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The news ---- the team had won the cup made everyone happy, and the rumour ---- he was leaving upset them.$q$, array[$o$what / that$o$, $o$that / that$o$, $o$that / what$o$, $o$which / which$o$, $o$whether / whether$o$], 1, $e$1. **The news that** özdeş yapıyı kurar: **that**.
2. **The rumour that** özdeş yapıyı kurar: **that**.

Diğer şıklar: **A** the news sonrası that gelir / **C** the rumour sonrası that gelir / **D** the news sonrası that gelir ve the rumour sonrası that gelir / **E** bu yapıda that gelir ve bu yapıda that gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She asked him ---- he had been, and he said he had been to the dentist ----.$q$, array[$o$what / yesterday$o$, $o$where / tomorrow$o$, $o$who / next week$o$, $o$which / soon$o$, $o$where / yesterday$o$], 4, $e$1. Yer dolaylı sorusu **where** ile kurulur: **where**.
2. Geçmiş zaman zarfı **yesterday** olur: **yesterday**.

Diğer şıklar: **A** yer anlamı where ister / **B** Past Perfect ile gelecek zaman olmaz / **C** yer anlamı where ister ve Past Perfect ile gelecek zaman olmaz / **D** yer anlamı where ister ve Past Perfect ile kullanılmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I'm interested in ---- he is going to say, and I'm curious about ---- he will say it.$q$, array[$o$that / how$o$, $o$what / what$o$, $o$what / how$o$, $o$which / that$o$, $o$whether / whether$o$], 2, $e$1. Dolaylı soruda **what** kullanılır: **what**.
2. Yöntem dolaylı sorusu **how** ile kurulur: **how**.

Diğer şıklar: **A** in sonrası what gelir / **B** yöntem anlamı how ister / **D** in sonrası what gelir ve yöntem anlamı how ister / **E** anlam bozulur ve anlam bozulur.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$---- really matters is not ---- you win but how you play, as the old saying goes.$q$, array[$o$That / whether$o$, $o$What / that$o$, $o$Which / what$o$, $o$What / whether$o$, $o$Whether / which$o$], 3, $e$1. Konu yan cümlesi **What** ile başlar: **What**.
2. **Whether** seçenek bildirir: **whether**.

Diğer şıklar: **A** konu yan cümlesi what ister / **B** not ... but kalıbı whether ister / **C** sınırsız seçenek what ister ve not ... but kalıbı whether ister / **E** anlam bozulur ve not ... but kalıbı whether ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The committee was asked to determine ---- the allegations were true, and, if so, ---- action should be taken.$q$, array[$o$whether / what$o$, $o$that / what$o$, $o$whether / that$o$, $o$what / whether$o$, $o$which / which$o$], 0, $e$1. Belirsizlik **whether** ile verilir: **whether**.
2. **What action** kalıbı kullanılır: **what**.

Diğer şıklar: **B** belirsizlik için whether gerekir / **C** what action kalıbı / **D** belirsizlik için whether gerekir ve what action kalıbı / **E** belirsizlik için whether gerekir ve what action kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It never occurred to him ---- his words might offend anyone, and he was shocked by ---- angry the audience became.$q$, array[$o$what / how$o$, $o$that / how$o$, $o$that / what$o$, $o$which / that$o$, $o$whether / which$o$], 1, $e$1. **It occurred to him that** kalıbı kullanılır: **that**.
2. **How + sıfat** kalıbı kullanılır: **how**.

Diğer şıklar: **A** occurred to him sonrası that gelir / **C** how angry kalıbı / **D** occurred to him sonrası that gelir ve how angry kalıbı / **E** bu yapıda that gelir ve how angry kalıbı.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The question of ---- the funds should be spent was debated for hours, and ---- it was finally decided remains a mystery to me.$q$, array[$o$what / why$o$, $o$how / what$o$, $o$that / how$o$, $o$which / that$o$, $o$how / why$o$], 4, $e$1. **Question of how** kalıbı kullanılır: **how**.
2. **Why it was decided** neden sorusunu sorar: **why**.

Diğer şıklar: **A** how the funds should be spent kalıbı / **B** why it was decided anlamlı kalıp / **C** how the funds should be spent kalıbı ve anlam bozulur / **D** how the funds should be spent kalıbı ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He is not the person ---- he used to be, and I don't recognise ---- he has become.$q$, array[$o$what / what$o$, $o$that / that$o$, $o$which / which$o$, $o$that / what$o$, $o$whose / who$o$], 3, $e$1. **The person that** kalıbı kullanılır: **that**.
2. Nesne yan cümlesi **what** ile başlar: **what**.

Diğer şıklar: **A** the person sonrası that gelir / **B** recognise sonrası what gelir / **C** insan için that gelir ve sınırsız seçenek what ister / **E** anlam bozulur ve cansız nesne için kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Relative Clauses konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Relative Clauses konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (9, 'ydt-dil', null::integer, $q$Everything ---- he said was true, and the only person ---- could help us was Tom.$q$, array[$o$which / who$o$, $o$that / which$o$, $o$that / who$o$, $o$what / whom$o$, $o$whom / whose$o$], 2, $e$1. **Everything** sonrasında **that** gelir: **that**.
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
  (16, 'ydt-dil', null::integer, $q$The scientist, ---- research was funded by the government, published the results, ---- caused a great debate.$q$, array[$o$who / which$o$, $o$whose / that$o$, $o$whose / which$o$, $o$whom / what$o$, $o$which / who$o$], 2, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** virgülden sonra that kullanılmaz / **D** sahiplik anlamı whose ile verilir ve virgülden sonra what kullanılmaz / **E** insan için sahiplik whose gerekir ve cümleyi niteler, which gerekir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$This is the book about ---- I told you, and that is the author about ---- I was talking.$q$, array[$o$who / whom$o$, $o$which / whom$o$, $o$which / which$o$, $o$whose / whose$o$, $o$where / where$o$], 1, $e$1. Edat sonrasında cansız varlık için **which** gelir: **which**.
2. Edat sonrasında insan için **whom** gelir: **whom**.

Diğer şıklar: **A** cansız varlık için which gelir / **C** insan için whom gelir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It was in 1999 ---- the earthquake struck the region, and it was the city of Izmit ---- suffered the most.$q$, array[$o$when / that$o$, $o$that / where$o$, $o$which / who$o$, $o$where / which$o$, $o$that / that$o$], 4, $e$1. **It was ... that** vurgu yapısı kullanılır: **that**.
2. Aynı kurala göre: **that**.

Diğer şıklar: **A** vurgu yapısında that gelir / **B** vurgu yapısında that gelir / **C** vurgu yapısında that gelir ve cansız varlık için that gelir / **D** vurgu yapısında that gelir ve vurgu yapısında that gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The more experience a person has, the greater the number of opportunities ---- are open to him, ---- explains why older candidates often succeed.$q$, array[$o$who / which$o$, $o$that / that$o$, $o$whose / what$o$, $o$that / which$o$, $o$what / who$o$], 3, $e$1. Tanımlayıcı cümlede **that** kullanılır: **that**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** cansız varlık için that/which gelir / **B** virgülden sonra that kullanılmaz / **C** sahiplik anlamı yok ve virgülden sonra what kullanılmaz / **E** the number sonrası what kullanılmaz ve cümleyi niteler, which gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Everyone ---- attended the lecture received a certificate, and the few ---- did not were given another chance.$q$, array[$o$who / who$o$, $o$whom / who$o$, $o$who / whom$o$, $o$which / which$o$, $o$whose / whose$o$], 0, $e$1. Özne insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **B** özne olduğundan who gerekir / **C** özne olduğundan who gerekir / **D** insan için who gelir ve insan için who gelir / **E** sahiplik anlamı yok ve sahiplik anlamı yok.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Relative Clauses konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Relative Clauses konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (6, 'ydt-dil', null::integer, $q$This is the only film ---- I have ever seen twice, and it is the best ---- he has directed.$q$, array[$o$which / that$o$, $o$that / which$o$, $o$that / that$o$, $o$who / who$o$, $o$what / what$o$], 2, $e$1. **The only** sonrasında **that** gelir: **that**.
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
  (16, 'ydt-dil', null::integer, $q$The man ---- we thought was the thief turned out to be a policeman, and the woman ---- we were sure was lying told the truth.$q$, array[$o$whom / who$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$which / which$o$, $o$who / who$o$], 4, $e$1. Araya cümle girse de özne olan insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **A** araya giren ifade sonrası özne olduğundan who gelir / **B** araya giren ifade sonrası özne olduğundan who gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **D** insan için who gelir ve insan için who gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The speech, ---- most of the audience found inspiring, was criticised by the press, ---- opinion matters little to the president.$q$, array[$o$that / whose$o$, $o$which / which$o$, $o$which / whose$o$, $o$who / who$o$, $o$whom / whom$o$], 2, $e$1. Virgüllü cansız nesne için **which** gelir: **which**.
2. Sahiplik **whose** ile verilir: **whose**.

Diğer şıklar: **A** virgülden sonra that kullanılmaz / **B** sahiplik anlamı whose ile verilir / **D** cansız varlık için which gelir ve sahiplik anlamı whose ile verilir / **E** cansız varlık için which gelir ve sahiplik anlamı whose ile verilir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$I have two sisters, ---- is a nurse and the other a teacher, and I admire ---- for their dedication.$q$, array[$o$one of which / both of them$o$, $o$one of whom / both of them$o$, $o$one of whom / both of whom$o$, $o$one of who / both of which$o$, $o$whose / both who$o$], 1, $e$1. **One of whom** insanlar için kalıbı kurar: **one of whom**.
2. Nesne zamiri **both of them** olur: **both of them**.

Diğer şıklar: **A** insan için whom gelir / **C** nesne zamiri gerekir / **D** of sonrasında whom gelir ve insan için whom gelir / **E** sahiplik anlamı yok ve biçim yanlış.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The more attention you pay to the details ---- matter, the fewer mistakes you will make, ---- is what the examiners value most.$q$, array[$o$that / which$o$, $o$who / which$o$, $o$that / that$o$, $o$what / what$o$, $o$whose / who$o$], 0, $e$1. Tanımlayıcı cümlede **that** kullanılır: **that**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **B** cansız varlık için that gelir / **C** virgülden sonra that kullanılmaz / **D** the details sonrasında what kullanılmaz ve virgülden sonra what kullanılmaz / **E** sahiplik anlamı yok ve cümleyi niteler, which gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Those ---- are interested in the project should contact the manager, ---- office is on the second floor.$q$, array[$o$whom / whose$o$, $o$who / who$o$, $o$which / which$o$, $o$whose / whom$o$, $o$who / whose$o$], 4, $e$1. **Those who** kalıbı kullanılır: **who**.
2. Sahiplik **whose** ile verilir: **whose**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** sahiplik anlamı whose ile verilir / **C** insan için who gelir ve sahiplik anlamı whose ile verilir / **D** sahiplik anlamı yok ve sahiplik anlamı whose ile verilir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Relative Clauses konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Relative Clauses konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Relative Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (6, 'ydt-dil', null::integer, $q$Tom, ---- brother I know well, has moved to London, ---- is a great city for young people.$q$, array[$o$who / which$o$, $o$whose / that$o$, $o$whose / which$o$, $o$whom / what$o$, $o$which / who$o$], 2, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **B** virgülden sonra that kullanılmaz / **D** sahiplik anlamı whose ile verilir ve virgülden sonra what kullanılmaz / **E** insan için whose gelir ve cümleyi niteler, which gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The report ---- by the committee last week has been published, and the people ---- in the study were paid.$q$, array[$o$preparing / involved$o$, $o$prepared / involving$o$, $o$prepare / involve$o$, $o$prepared / involved$o$, $o$to prepare / to involve$o$], 3, $e$1. Edilgen kısaltılmış sıfat cümlesi **V-ed** alır: **prepared**.
2. Aynı kurala göre: **involved**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** edilgen anlam V-ed ister / **C** edilgen anlam V-ed ister ve edilgen anlam V-ed ister / **E** edilgen anlam V-ed ister ve edilgen anlam V-ed ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The students ---- in the front row are the best, and the teacher ---- them is very proud.$q$, array[$o$sitting / teaching$o$, $o$sat / teaching$o$, $o$sitting / taught$o$, $o$seated / taught by$o$, $o$sit / teach$o$], 0, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **sitting**.
2. Aynı kurala göre: **teaching**.

Diğer şıklar: **B** kısaltılmış sıfat cümlesi V-ing ister / **C** etken kısaltılmış sıfat cümlesi V-ing ister / **D** oturma eylemi etken anlam ister ve anlam bozulur / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The book ---- you recommended was excellent, and the author ---- you told me about is amazing.$q$, array[$o$who / that$o$, $o$that / that$o$, $o$that / which$o$, $o$whose / whose$o$, $o$where / where$o$], 1, $e$1. Tanımlayıcı cümlede nesne için **that** kullanılır: **that**.
2. Aynı kurala göre: **that**.

Diğer şıklar: **A** cansız varlık için that gelir / **C** insan için that/whom gelir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$I have a friend ---- lives in Canada, and I often visit the city ---- he works.$q$, array[$o$whom / where$o$, $o$who / which$o$, $o$whose / who$o$, $o$which / whose$o$, $o$who / where$o$], 4, $e$1. Özne insan için **who** gelir: **who**.
2. Yer için **where** gelir: **where**.

Diğer şıklar: **A** özne olduğundan who gerekir / **B** yer anlamı where ister / **C** sahiplik anlamı yok ve yer anlamı where ister / **D** insan için who gelir ve yer anlamı where ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She bought a dress ---- she never wore, and a pair of shoes ---- she lost the next day.$q$, array[$o$who / which$o$, $o$which / who$o$, $o$whose / whose$o$, $o$which / which$o$, $o$where / where$o$], 3, $e$1. Cansız nesne için **which** gelir: **which**.
2. Aynı kurala göre: **which**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** cansız varlık için which gelir / **C** sahiplik anlamı yok ve sahiplik anlamı yok / **E** yer anlamı verir ve yer anlamı verir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$The architect ---- designed the bridge won an award, and the engineers ---- built it were praised.$q$, array[$o$who / who$o$, $o$whom / who$o$, $o$who / whom$o$, $o$whose / whose$o$, $o$which / which$o$], 0, $e$1. Özne insan için **who** gelir: **who**.
2. Aynı kurala göre: **who**.

Diğer şıklar: **B** özne olduğundan who gerekir / **C** özne olduğundan who gerekir / **D** sahiplik anlamı yok ve sahiplik anlamı yok / **E** insan için who gelir ve insan için who gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$All the money ---- he had saved was stolen, and the little ---- remained was spent on food.$q$, array[$o$what / that$o$, $o$that / that$o$, $o$that / what$o$, $o$who / who$o$, $o$whom / whom$o$], 1, $e$1. **All** sonrasında **that** gelir: **that**.
2. **The little** sonrasında **that** gelir: **that**.

Diğer şıklar: **A** all sonrasında that gelir / **C** the little sonrasında that gelir / **D** cansız varlık için that gelir ve cansız varlık için that gelir / **E** cansız varlık için that gelir ve cansız varlık için that gelir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The man ---- you were talking about is my teacher, and the house ---- he lives in is huge.$q$, array[$o$where / which$o$, $o$whom / what$o$, $o$whose / whom$o$, $o$whom / which$o$, $o$where / where$o$], 3, $e$1. Nesne insan için **whom** gelir: **whom**.
2. Cansız nesne için **which** gelir: **which**.

Diğer şıklar: **A** yer anlamı verir / **B** in sonrasında which gelir / **C** sahiplik anlamı yok ve cansız varlık için which gelir / **E** yer anlamı verir ve in ile birlikte kullanılmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$My neighbour, ---- we invited to dinner, never came, ---- annoyed us a little.$q$, array[$o$where / which$o$, $o$whom / that$o$, $o$whom / which$o$, $o$whose / what$o$, $o$which / who$o$], 2, $e$1. Virgüllü nesne insan için **whom** gelir: **whom**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** yer anlamı verir / **B** virgülden sonra that kullanılmaz / **D** sahiplik anlamı yok ve virgülden sonra what kullanılmaz / **E** insan için whom gelir ve cümleyi niteler, which gelir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$The company, ---- employees are underpaid, is planning to lay off workers, ---- will make the situation worse.$q$, array[$o$who / which$o$, $o$whose / which$o$, $o$whose / that$o$, $o$whom / what$o$, $o$which / who$o$], 1, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **C** virgülden sonra that kullanılmaz / **D** sahiplik anlamı whose ile verilir ve virgülden sonra what kullanılmaz / **E** sahiplik anlamı whose ile verilir ve cümleyi niteler, which gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The exam, the results of ---- will be announced next week, was taken by 3,000 candidates, most of ---- passed.$q$, array[$o$which / whom$o$, $o$whose / whom$o$, $o$which / who$o$, $o$who / them$o$, $o$what / which$o$], 0, $e$1. **The results of which** kalıbı kullanılır: **which**.
2. **Most of whom** kalıbı kullanılır: **whom**.

Diğer şıklar: **B** the results of whose kalıbı yoktur / **C** most of sonrasında whom gelir / **D** of sonrasında which gelir ve most of whom kalıbı gerekir / **E** of sonrasında what kullanılmaz ve insan için whom gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He wasn't told about the changes, ---- made him angry, and he complained to the person ---- he believed was responsible.$q$, array[$o$what / who$o$, $o$which / whom$o$, $o$that / which$o$, $o$who / whose$o$, $o$which / who$o$], 4, $e$1. Cümleyi niteleyen sıfat cümlesinde **which** gelir: **which**.
2. Araya giren ifadeye rağmen özne için **who** gelir: **who**.

Diğer şıklar: **A** virgülden sonra what kullanılmaz / **B** araya giren ifadeyle özne olduğundan who gelir / **C** virgülden sonra that kullanılmaz ve insan için who gelir / **D** cümleyi niteler, which gelir ve sahiplik anlamı yok.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The professor gave us a list of books, some of ---- were out of print, and a list of websites, ---- we had to visit.$q$, array[$o$whom / all of which$o$, $o$which / all of whom$o$, $o$which / all of which$o$, $o$who / all of them$o$, $o$that / which all$o$], 2, $e$1. **Some of which** cansız varlıklar için kalıbı kurar: **which**.
2. **All of which** cansız varlıklar için kalıbı kurar: **all of which**.

Diğer şıklar: **A** cansız varlık için which gelir / **B** cansız varlık için which gelir / **D** of sonrasında which gelir ve sıfat cümlesi bağlaç ister / **E** of sonrasında that kullanılmaz ve biçim yanlış.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The boy ---- mother is a nurse lives next door, and the dog ---- barks all night is his.$q$, array[$o$who / that$o$, $o$whose / that$o$, $o$whose / whose$o$, $o$which / what$o$, $o$whom / where$o$], 1, $e$1. Sahiplik **whose** ile verilir: **whose**.
2. Tanımlayıcı cümlede özne için **that** kullanılır: **that**.

Diğer şıklar: **A** sahiplik anlamı whose ile verilir / **C** sahiplik anlamı yok, özne gerekir / **D** sahiplik anlamı whose ile verilir ve the dog sonrasında what kullanılmaz / **E** sahiplik anlamı whose ile verilir ve yer anlamı verir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

