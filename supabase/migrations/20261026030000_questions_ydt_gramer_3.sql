-- 20261026030000_questions_ydt_gramer_3. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Comparison ve Correlatives konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Comparison ve Correlatives konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Comparison ve Correlatives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$This book is ---- than that one, and it is the ---- book I have ever read.$q$, array[$o$most interesting / most interesting$o$, $o$more interesting / more interesting$o$, $o$interestinger / interestingest$o$, $o$much interesting / much interesting$o$, $o$more interesting / most interesting$o$], 4, $e$1. İki kitap karşılaştırılır, uzun sıfatta **more interesting** kullanılır.
2. **The** ile superlative gerekir: **most interesting**.

Diğer şıklar: **A** iki şey karşılaştırılıyor, comparative gerekir / **B** the ile superlative gerekir / **C** uzun sıfatta more kullanılır ve uzun sıfatta most kullanılır / **D** karşılaştırma yapısı kurmaz ve superlative yapısı kurmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He runs faster ---- me, and he is the ---- runner in the team.$q$, array[$o$that / fastest$o$, $o$than / fastest$o$, $o$than / faster$o$, $o$then / most fast$o$, $o$as / more fast$o$], 1, $e$1. Comparative ile **than** kullanılır.
2. **The** sonrasında kısa sıfatın superlative biçimi gelir: **fastest**.

Diğer şıklar: **A** karşılaştırmada than kullanılır / **C** the ile superlative gerekir / **D** karşılaştırmada than kullanılır ve kısa sıfatta -est kullanılır / **E** comparative ile than gerekir ve kısa sıfatta -est kullanılır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The ---- you practise, the ---- you become.$q$, array[$o$most / best$o$, $o$more / best$o$, $o$much / good$o$, $o$more / better$o$, $o$many / more good$o$], 3, $e$1. **The + comparative, the + comparative** kalıbı: **more** ve **better**.

Diğer şıklar: **A** the + comparative, the + comparative kalıbı gerekir / **B** ikinci boşlukta comparative gerekir / **C** comparative biçimi gerekir / **E** better biçimi gerekir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Tom is the ---- of the three brothers, and Anna is the ---- girl in her class.$q$, array[$o$taller / most intelligent$o$, $o$tallest / more intelligent$o$, $o$tallest / most intelligent$o$, $o$more tall / intelligentest$o$, $o$most tall / most intelligenter$o$], 2, $e$1. Üç kişi arasından en uzun: **tallest**.
2. Uzun sıfatta superlative **most intelligent** olur.

Diğer şıklar: **A** üç kişi için superlative gerekir / **B** the ile superlative gerekir / **D** kısa sıfatta -est kullanılır ve uzun sıfatta most kullanılır / **E** kısa sıfatta -est kullanılır ve uzun sıfatta most kullanılır.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$It is getting ---- as winter approaches, and the days are getting ----.$q$, array[$o$more cold and more cold / more short and more short$o$, $o$colder and colder / shorter and shorter$o$, $o$colder than colder / shorter than shorter$o$, $o$coldest and coldest / shortest and shortest$o$, $o$colder and colder / short and shorter$o$], 1, $e$1. Giderek artan değişim **comparative and comparative** ile anlatılır: **colder and colder** ve **shorter and shorter**.

Diğer şıklar: **A** kısa sıfatlarda -er and -er kullanılır / **C** artan değişim için and kullanılır / **D** artan değişimde comparative gerekir / **E** ikinci boşluk da shorter and shorter olmalıdır.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$She is the ---- student in the class, and her handwriting is the ---- I have ever seen.$q$, array[$o$better / neatest$o$, $o$best / neater$o$, $o$most good / most neat$o$, $o$best / neatest$o$, $o$good / more neat$o$], 3, $e$1. **Good** sıfatının superlative biçimi **best** olur.
2. **Neat** kısa sıfattır, superlative biçimi **neatest** olur.

Diğer şıklar: **A** the ile superlative gerekir / **B** the ile superlative gerekir / **C** good sıfatının superlative biçimi best olur ve kısa sıfatta -est kullanılır / **E** the ile superlative gerekir ve kısa sıfatta -est kullanılır.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$He is much ---- than his brother, but he is not as ---- as his sister.$q$, array[$o$oldest / hardworking$o$, $o$older / more hardworking$o$, $o$most old / most hardworking$o$, $o$more old / hardworkinger$o$, $o$older / hardworking$o$], 4, $e$1. İki kişi karşılaştırılır, kısa sıfatta **older**.
2. **Not as ... as** kalıbında yalın sıfat gelir: **hardworking**.

Diğer şıklar: **A** iki kişi karşılaştırılıyor, comparative gerekir / **B** as ... as kalıbında yalın sıfat gelir / **C** kısa sıfatta -er kullanılır ve as ... as kalıbında yalın sıfat gelir / **D** kısa sıfatta -er kullanılır ve uzun sıfatta -er kullanılmaz.$e$, 1),
  (8, 'ydt-dil', null::integer, $q$I'd ---- walk than take the bus, and he prefers tea ---- coffee.$q$, array[$o$rather / to$o$, $o$prefer / to$o$, $o$rather / than$o$, $o$better / from$o$, $o$like / over$o$], 0, $e$1. **Would rather ... than** kalıbı: **rather**.
2. **Prefer A to B** kalıbı: **to**.

Diğer şıklar: **B** would rather + yalın fiil kalıbı gerekir / **C** prefer sonrasında to kullanılır / **D** would rather kalıbı gerekir ve prefer sonrasında to kullanılır / **E** would rather kalıbı gerekir ve prefer sonrasında to kullanılır.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$My phone is the same ---- yours, but my laptop is different ---- his.$q$, array[$o$that / from$o$, $o$as / from$o$, $o$as / than$o$, $o$like / as$o$, $o$to / with$o$], 1, $e$1. **The same as** kalıbı: **as**.
2. **Different from** kalıbı: **from**.

Diğer şıklar: **A** the same as kalıbı gerekir / **C** different from kalıbı gerekir / **D** the same as kalıbı gerekir ve different from kalıbı gerekir / **E** the same as kalıbı gerekir ve different from kalıbı gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The ---- the weather became, the ---- we felt.$q$, array[$o$cold / sad$o$, $o$more cold / more sad$o$, $o$colder / sadder$o$, $o$colder / more sad$o$, $o$coldest / saddest$o$], 2, $e$1. **The + comparative, the + comparative** kalıbı: **colder** ve **sadder**.

Diğer şıklar: **A** the + comparative kalıbı gerekir / **B** kısa sıfatta -er kullanılır / **D** ikinci boşlukta sadder gerekir / **E** iki taraflı karşılaştırmada comparative gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Of all the cities I have visited, Istanbul is by far the ---- , and Venice is the ---- romantic.$q$, array[$o$more beautiful / most$o$, $o$most beautiful / more$o$, $o$beautifulest / much$o$, $o$most beautifuller / mostly$o$, $o$most beautiful / most$o$], 4, $e$1. Çok şehir arasından en güzel: **most beautiful**.
2. **The most romantic** kalıbı: **most**.

Diğer şıklar: **A** by far the ile superlative gerekir / **B** the + most kullanılır / **C** uzun sıfatta most kullanılır ve the + most kullanılır / **D** uygun değildir ve the + most kullanılır.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$His new novel is not nearly ---- good as his first one, and it is ---- longer.$q$, array[$o$as / far$o$, $o$more / far$o$, $o$as / very$o$, $o$than / more$o$, $o$much / such$o$], 0, $e$1. **Not nearly as ... as** kalıbı: **as**.
2. Comparative önünde **far** kullanılır: **far longer**.

Diğer şıklar: **B** not nearly as ... as kalıbı gerekir / **C** comparative önünde very kullanılmaz / **D** not nearly as ... as kalıbı gerekir ve longer zaten comparative'tir / **E** not nearly as ... as kalıbı gerekir ve comparative önünde such kullanılmaz.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$I can speak English ---- fluently than I could last year, and I hope to improve ----.$q$, array[$o$most / further$o$, $o$more / more far$o$, $o$more / further$o$, $o$much / farthest$o$, $o$as / furthest$o$], 2, $e$1. **Than** ile **more fluently** kullanılır.
2. **Improve further** daha da gelişmek anlamındadır.

Diğer şıklar: **A** comparative gerekir / **B** further biçimi kullanılır / **D** than ile more kullanılır ve improve further kullanılır / **E** than ile more kullanılır ve improve further kullanılır.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The sooner we leave, the ---- we will arrive, and the ---- we wait, the more nervous we feel.$q$, array[$o$earliest / longer$o$, $o$earlier / long$o$, $o$more early / longest$o$, $o$earlier / longer$o$, $o$early / more long$o$], 3, $e$1. **The + comparative, the + comparative** kalıbı: **earlier** ve **longer**.

Diğer şıklar: **A** the + comparative gerekir / **B** the + comparative gerekir / **C** kısa sıfatta -er kullanılır ve the + comparative gerekir / **E** the + comparative gerekir ve kısa sıfatta -er kullanılır.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$She is far ---- popular than her sister, and she is ---- the most popular girl in school.$q$, array[$o$more / by far$o$, $o$most / by far$o$, $o$more / more$o$, $o$much / very$o$, $o$many / quite$o$], 0, $e$1. **Far more popular than** kalıbı: **more**.
2. Superlative vurgusu **by far the most** ile yapılır.

Diğer şıklar: **B** than ile comparative gerekir / **C** by far ile superlative vurgulanır / **D** than ile comparative gerekir ve the most ile very kullanılmaz / **E** than ile comparative gerekir ve the most ile quite kullanılmaz.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$This is the ---- interesting film I have ever seen, and it's even better ---- the first.$q$, array[$o$more / than$o$, $o$most / then$o$, $o$most / than$o$, $o$much / as$o$, $o$many / that$o$], 2, $e$1. **The most interesting** kalıbı: **most**.
2. **Better than** kalıbı: **than**.

Diğer şıklar: **A** the ile superlative gerekir / **B** comparative ile than gerekir / **D** the ile superlative gerekir ve comparative ile than gerekir / **E** the ile superlative gerekir ve comparative ile than gerekir.$e$, 1),
  (17, 'ydt-dil', null::integer, $q$The ---- of the two brothers is a lawyer, and the ---- is a teacher.$q$, array[$o$oldest / youngest$o$, $o$old / young$o$, $o$more old / more young$o$, $o$older / most young$o$, $o$older / younger$o$], 4, $e$1. İki kişi arasında **the older** ve **the younger** kullanılır.

Diğer şıklar: **A** iki kişi arasında comparative kullanılır / **B** the ile comparative gerekir / **C** kısa sıfatta -er kullanılır / **D** iki kişi arasında comparative gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is the ---- person I know, and he is ---- generous than any other person.$q$, array[$o$kindest / more$o$, $o$kinder / more$o$, $o$kindest / most$o$, $o$kindlier / much$o$, $o$most kind / mostly$o$], 0, $e$1. **The kindest person** kalıbı: **kindest**.
2. **More generous than** kalıbı: **more**.

Diğer şıklar: **B** the ile superlative gerekir / **C** than ile comparative gerekir / **D** the ile superlative gerekir ve than ile more gerekir / **E** kısa sıfatta -est kullanılır ve than ile more gerekir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Life in the countryside is not as expensive ---- life in the city, and it's ---- quieter.$q$, array[$o$than / much$o$, $o$as / much$o$, $o$as / very$o$, $o$that / so$o$, $o$like / more$o$], 1, $e$1. **Not as ... as** kalıbı: **as**.
2. Comparative önünde **much** kullanılır: **much quieter**.

Diğer şıklar: **A** not as ... as kalıbı gerekir / **C** comparative önünde very kullanılmaz / **D** not as ... as kalıbı gerekir ve comparative önünde so kullanılmaz / **E** not as ... as kalıbı gerekir ve quieter zaten comparative'tir.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The more carefully you drive, the ---- accidents you have, and the less sugar you eat, the ---- healthy you are.$q$, array[$o$less / more$o$, $o$fewer / most$o$, $o$least / much$o$, $o$fewer / more$o$, $o$little / better$o$], 3, $e$1. **Accidents** sayılabilir isimdir: **fewer**.
2. **The more healthy** kalıbı: **more**.

Diğer şıklar: **A** accidents sayılabilir isimdir / **B** the + comparative gerekir / **C** the + comparative gerekir ve the + more kalıbı gerekir / **E** the + comparative gerekir ve healthy sıfatının önünde more gerekir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conjunctions ve Linkers konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$He was very tired, ---- he went to bed early, ---- he couldn't fall asleep.$q$, array[$o$but / but$o$, $o$so / so$o$, $o$because / because$o$, $o$so / but$o$, $o$although / as$o$], 3, $e$1. Yorgun olduğu için erken yattı: **so**.
2. Uyuyamaması beklenmeyen bir durumdur: **but**.

Diğer şıklar: **A** sonuç bildirmek için so gerekir / **B** karşıtlık bildirmek için but gerekir / **C** sonuç bildirmek için so gerekir ve karşıtlık bildirmek için but gerekir / **E** sonuç bildirmek için so gerekir ve karşıtlık bildirmek için but gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$---- it was raining heavily, we went for a walk, and ---- the rain, we enjoyed it.$q$, array[$o$Although / despite$o$, $o$Despite / despite$o$, $o$Although / although$o$, $o$Because / because$o$, $o$However / however$o$], 0, $e$1. Cümle yapısı ile karşıtlık **although** ile kurulur.
2. İsim ile karşıtlık **despite** ile kurulur.

Diğer şıklar: **B** cümleyle although gerekir / **C** isimle despite kullanılır / **D** karşıtlık bildirmek için although gerekir ve isimle despite kullanılır / **E** cümleyi bağlamaz ve isimle despite kullanılır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$Ali is very generous, ---- his brother is selfish, and I won't go to the party ---- I feel better.$q$, array[$o$because / unless$o$, $o$whereas / although$o$, $o$so / whereas$o$, $o$unless / so$o$, $o$whereas / unless$o$], 4, $e$1. İki kişiyi karşılaştırmak için **whereas** kullanılır.
2. Kendimi daha iyi hissetmedikçe gitmem: **unless**.

Diğer şıklar: **A** zıtlık bildirmek için whereas gerekir / **B** olumsuz koşul için unless gerekir / **C** zıtlık bildirmek için whereas gerekir ve olumsuz koşul için unless gerekir / **D** zıtlık bildirmek için whereas gerekir ve olumsuz koşul için unless gerekir.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$She studied hard ---- to pass the exam, and she took notes ---- she could review later.$q$, array[$o$so that / so that$o$, $o$in order / in order$o$, $o$in order / so that$o$, $o$because / to$o$, $o$for / for$o$], 2, $e$1. **In order to + V1** kalıbı: **in order**.
2. Amaç cümlesi **so that + özne + fiil** ile kurulur.

Diğer şıklar: **A** to-infinitive önünde in order gerekir / **B** cümle ile so that kullanılır / **D** to-infinitive önünde in order gerekir ve cümle ile so that kullanılır / **E** to-infinitive önünde in order gerekir ve cümle ile so that kullanılır.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$---- the weather was terrible, the match continued. The players were tired. ---- , they won.$q$, array[$o$Despite / Nevertheless$o$, $o$Although / Nevertheless$o$, $o$Although / Because$o$, $o$However / Although$o$, $o$Because / Despite$o$], 1, $e$1. Cümleyi karşıtlıkla bağlayan **Although** kullanılır.
2. Önceki cümleyle karşıtlık kurmak için **Nevertheless** kullanılır.

Diğer şıklar: **A** cümleyle although gerekir / **C** karşıtlık için nevertheless gerekir / **D** cümleyi bağlamaz ve ayrı cümle başında nevertheless gerekir / **E** karşıtlık için although gerekir ve ayrı cümle başında nevertheless gerekir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$She is not only intelligent ---- also hardworking, and either you apologise ---- you leave.$q$, array[$o$and / or$o$, $o$but / and$o$, $o$so / nor$o$, $o$or / but$o$, $o$but / or$o$], 4, $e$1. **Not only ... but also** kalıbı: **but**.
2. **Either ... or** kalıbı: **or**.

Diğer şıklar: **A** not only ... but also kalıbı gerekir / **B** either ... or kalıbı gerekir / **C** not only ... but also kalıbı gerekir ve either ... or kalıbı gerekir / **D** not only ... but also kalıbı gerekir ve either ... or kalıbı gerekir.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Neither the teacher ---- the students knew the answer, and both Tom ---- Jerry were late.$q$, array[$o$nor / and$o$, $o$or / and$o$, $o$nor / or$o$, $o$and / nor$o$, $o$but / but$o$], 0, $e$1. **Neither ... nor** kalıbı: **nor**.
2. **Both ... and** kalıbı: **and**.

Diğer şıklar: **B** neither ... nor kalıbı gerekir / **C** both ... and kalıbı gerekir / **D** neither ... nor kalıbı gerekir ve both ... and kalıbı gerekir / **E** neither ... nor kalıbı gerekir ve both ... and kalıbı gerekir.$e$, 1),
  (8, 'ydt-dil', null::integer, $q$I will call you ---- I arrive, and I will wait ---- you come.$q$, array[$o$until / until$o$, $o$as soon as / as soon as$o$, $o$as soon as / until$o$, $o$unless / unless$o$, $o$although / although$o$], 2, $e$1. Hemen sonra **as soon as** ile anlatılır.
2. Gelene kadar beklemek **until** ile anlatılır.

Diğer şıklar: **A** hemen sonra anlamı için as soon as gerekir / **B** süreklilik için until gerekir / **D** hemen sonra anlamı için as soon as gerekir ve süreklilik için until gerekir / **E** hemen sonra anlamı için as soon as gerekir ve süreklilik için until gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Take an umbrella ---- it rains, and I will lend you my car ---- you return it tomorrow.$q$, array[$o$unless / provided that$o$, $o$in case / provided that$o$, $o$in case / in case$o$, $o$although / although$o$, $o$so that / unless$o$], 1, $e$1. Olasılığa karşı önlem **in case** ile anlatılır.
2. Koşul bildirmek için **provided that** kullanılır.

Diğer şıklar: **A** önlem için in case gerekir / **C** koşul için provided that gerekir / **D** önlem için in case gerekir ve koşul için provided that gerekir / **E** önlem için in case gerekir ve koşul için provided that gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$The shop was closed. ---- , we went to another one, ---- we couldn't find what we needed.$q$, array[$o$However / but$o$, $o$Therefore / because$o$, $o$Although / so$o$, $o$Because / therefore$o$, $o$Therefore / but$o$], 4, $e$1. Dükkanın kapalı olması sonucu: **Therefore**.
2. Aranan şeyin bulunamaması karşıtlıktır: **but**.

Diğer şıklar: **A** sonuç bildirmek için therefore gerekir / **B** karşıtlık için but gerekir / **C** sonuç bildirmek için therefore gerekir ve karşıtlık için but gerekir / **D** sonuç bildirmek için therefore gerekir ve karşıtlık için but gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Hardly had we left the house ---- it started raining, and no sooner had she sat down ---- the phone rang.$q$, array[$o$than / than$o$, $o$when / when$o$, $o$as / as$o$, $o$when / than$o$, $o$while / while$o$], 3, $e$1. **Hardly ... when** kalıbı: **when**.
2. **No sooner ... than** kalıbı: **than**.

Diğer şıklar: **A** hardly ... when kalıbı gerekir / **B** no sooner ... than kalıbı gerekir / **C** hardly ... when kalıbı gerekir ve no sooner ... than kalıbı gerekir / **E** hardly ... when kalıbı gerekir ve no sooner ... than kalıbı gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$You can stay ---- you keep quiet, and I won't leave ---- you ask me to.$q$, array[$o$unless / unless$o$, $o$as long as / unless$o$, $o$as long as / as long as$o$, $o$although / because$o$, $o$whereas / so that$o$], 1, $e$1. Yeter şart **as long as** ile anlatılır.
2. Sen istemedikçe gitmem: **unless**.

Diğer şıklar: **A** koşul bildirmek için as long as gerekir / **C** olumsuz koşul için unless gerekir / **D** koşul bildirmek için as long as gerekir ve olumsuz koşul için unless gerekir / **E** koşul bildirmek için as long as gerekir ve olumsuz koşul için unless gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$---- he is rich, he is not happy, and ---- being rich, he works every day.$q$, array[$o$Despite / despite$o$, $o$Although / Although$o$, $o$Although / despite$o$, $o$However / However$o$, $o$Because / Even though$o$], 2, $e$1. Cümleyle karşıtlık **although** ile kurulur.
2. Gerund ile karşıtlık **despite** ile kurulur.

Diğer şıklar: **A** cümleyle although gerekir / **B** isim ya da gerund ile despite gerekir / **D** cümleyi bağlamaz ve isim ya da gerund ile despite gerekir / **E** karşıtlık için although gerekir ve isim ya da gerund ile despite gerekir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$You must hurry, ---- you will miss the train, and he left early ---- avoid the traffic.$q$, array[$o$however / to$o$, $o$otherwise / for$o$, $o$therefore / so that$o$, $o$otherwise / to$o$, $o$moreover / because$o$], 3, $e$1. Aksi takdirde anlamı **otherwise** ile verilir.
2. Amaç **to + V1** ile bildirilir.

Diğer şıklar: **A** uyarı sonucu için otherwise gerekir / **B** amaç için to-infinitive gerekir / **C** uyarı sonucu için otherwise gerekir ve to-infinitive ile so that kullanılmaz / **E** uyarı sonucu için otherwise gerekir ve amaç için to-infinitive gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$As ---- as I know, he has left the company, and I'll stay ---- as you need me.$q$, array[$o$far / long$o$, $o$long / long$o$, $o$far / far$o$, $o$much / much$o$, $o$well / well$o$], 0, $e$1. **As far as I know** kalıbı: **far**.
2. **As long as** kalıbı: **long**.

Diğer şıklar: **B** as far as I know kalıbı gerekir / **C** as long as kalıbı gerekir / **D** as far as I know kalıbı gerekir ve as long as kalıbı gerekir / **E** as far as I know kalıbı gerekir ve as long as kalıbı gerekir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$He speaks German and French, ---- he doesn't speak Italian yet. ---- , he is learning it.$q$, array[$o$so / However$o$, $o$but / However$o$, $o$but / Because$o$, $o$because / So$o$, $o$or / Although$o$], 1, $e$1. Karşıtlık **but** ile kurulur.
2. Önceki cümleye karşıtlıkla devam etmek için **However** kullanılır.

Diğer şıklar: **A** karşıtlık için but gerekir / **C** karşıtlık için however gerekir / **D** karşıtlık için but gerekir ve karşıtlık için however gerekir / **E** karşıtlık için but gerekir ve ayrı cümle başında however gerekir.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Bring warm clothes ---- it gets cold at night, and don't go out ---- you finish your homework.$q$, array[$o$until / until$o$, $o$in case / in case$o$, $o$unless / although$o$, $o$although / because$o$, $o$in case / until$o$], 4, $e$1. Soğuk gece ihtimaline karşı **in case** kullanılır.
2. Ödev bitene kadar çıkmamak **until** ile anlatılır.

Diğer şıklar: **A** önlem için in case gerekir / **B** sınır belirtmek için until gerekir / **C** önlem için in case gerekir ve sınır belirtmek için until gerekir / **D** önlem için in case gerekir ve sınır belirtmek için until gerekir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$---- I arrived, he had left, and I will wait here ---- the rain stops.$q$, array[$o$Until / until$o$, $o$By the time / By the time$o$, $o$By the time / until$o$, $o$While / Since$o$, $o$Since / As soon as$o$], 2, $e$1. Varış anına kadar gerçekleşen eylem **By the time** ile anlatılır.
2. Yağmur duruncaya kadar beklemek **until** ile anlatılır.

Diğer şıklar: **A** önceden gerçekleşen eylem için by the time gerekir / **B** bekleme süresi için until gerekir / **D** önceden gerçekleşen eylem için by the time gerekir ve bekleme süresi için until gerekir / **E** önceden gerçekleşen eylem için by the time gerekir ve bekleme süresi için until gerekir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$She wore a coat ---- it wasn't cold, and she bought a ticket ---- she could enter.$q$, array[$o$because / so that$o$, $o$even though / because of$o$, $o$so that / even though$o$, $o$even though / so that$o$, $o$unless / unless$o$], 3, $e$1. Hava soğuk olmadığı halde ceket giymek **even though** ile anlatılır.
2. Girebilmek için bilet almak **so that** ile anlatılır.

Diğer şıklar: **A** karşıtlık için even though gerekir / **B** cümleyle so that kullanılır / **C** karşıtlık için even though gerekir ve amaç için so that gerekir / **E** karşıtlık için even though gerekir ve amaç için so that gerekir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$I can't decide ---- to take the job ---- to continue studying.$q$, array[$o$whether / or$o$, $o$if / or$o$, $o$whether / and$o$, $o$that / nor$o$, $o$what / but$o$], 0, $e$1. **Whether to ...** kalıbı: **whether**.
2. Seçenekleri bağlamak için **or** kullanılır.

Diğer şıklar: **B** to-infinitive ile whether kullanılır / **C** whether ... or kalıbı gerekir / **D** to-infinitive ile whether kullanılır ve whether ... or kalıbı gerekir / **E** to-infinitive ile whether kullanılır ve whether ... or kalıbı gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Determiners ve Quantifiers konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Determiners ve Quantifiers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$We have very ---- time left, and ---- people have arrived yet.$q$, array[$o$few / few$o$, $o$little / few$o$, $o$little / little$o$, $o$a few / much$o$, $o$many / a little$o$], 1, $e$1. **Time** sayılamaz isimdir: **little**.
2. **People** sayılabilir çoğul isimdir: **few**.

Diğer şıklar: **A** time sayılamaz isimdir / **C** people sayılabilir isimdir / **D** very ile birlikte kullanılmaz ve people sayılabilir isimdir / **E** time sayılamaz isimdir ve people sayılabilir isimdir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$How ---- sugar do you take, and how ---- cups of coffee do you drink a day?$q$, array[$o$many / many$o$, $o$much / much$o$, $o$much / many$o$, $o$few / little$o$, $o$a few / a little$o$], 2, $e$1. **Sugar** sayılamaz isimdir: **how much**.
2. **Cups** sayılabilir isimdir: **how many**.

Diğer şıklar: **A** sugar sayılamaz isimdir / **B** cups sayılabilir isimdir / **D** soru yapısında how few kullanılmaz ve cups sayılabilir isimdir / **E** soru yapısında kullanılmaz ve cups sayılabilir isimdir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I don't have ---- money, but there are ---- good restaurants nearby.$q$, array[$o$some / some$o$, $o$any / any$o$, $o$a / a$o$, $o$few / much$o$, $o$any / some$o$], 4, $e$1. Olumsuz cümlede **any** kullanılır.
2. Olumlu cümlede **some** kullanılır.

Diğer şıklar: **A** olumsuz cümlede any gerekir / **B** olumlu cümlede some gerekir / **C** money sayılamaz isimdir ve restaurants çoğuldur / **D** olumsuz cümlede few kullanılmaz ve restaurants sayılabilir isimdir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$Every student ---- required to bring a pen, and both of the students ---- late.$q$, array[$o$are / were$o$, $o$is / was$o$, $o$were / is$o$, $o$is / were$o$, $o$have been / has$o$], 3, $e$1. **Every** tekil fiil ister: **is**.
2. **Both** çoğul fiil ister: **were**.

Diğer şıklar: **A** every tekil fiil ister / **B** both çoğul fiil ister / **C** every tekil fiil ister ve both çoğul fiil ister / **E** every tekil fiil ister ve both çoğul fiil ister.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$---- of the two roads is safe, so I can't choose ---- of them.$q$, array[$o$Neither / either$o$, $o$None / either$o$, $o$Neither / neither$o$, $o$All / none$o$, $o$Both / all$o$], 0, $e$1. İki seçenek için olumsuz anlam **Neither** ile verilir.
2. Olumsuz cümlede iki seçenekten biri için **either** kullanılır.

Diğer şıklar: **B** iki seçenek için neither kullanılır / **C** çift olumsuzluk olur / **D** iki seçenek için neither kullanılır ve iki seçenek için either kullanılır / **E** iki seçenek için neither kullanılır ve iki seçenek için either kullanılır.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Most ---- the students passed the exam, and ---- students got full marks.$q$, array[$o$- / some$o$, $o$of / a$o$, $o$of / some$o$, $o$the / the$o$, $o$from / much$o$], 2, $e$1. **Most of the + çoğul isim** kalıbı: **of**.
2. Çoğul isimle belirsiz sayı için **some** kullanılır.

Diğer şıklar: **A** most of the kalıbı gerekir / **B** çoğul isimle some kullanılır / **D** most of the kalıbı gerekir ve çoğul isimle some kullanılır / **E** most of the kalıbı gerekir ve çoğul isimle some kullanılır.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$---- number of tourists visit the city every year, and ---- number of visitors has increased.$q$, array[$o$The / the$o$, $o$A / A$o$, $o$Many / Many$o$, $o$Much / Some$o$, $o$A / the$o$], 4, $e$1. **A number of** çoğul fiil ister: **A**.
2. **The number of** tekil fiil ister: **the**.

Diğer şıklar: **A** a number of çoğul fiil ister / **B** the number of tekil fiil ister / **C** number ile many kullanılmaz ve number ile many kullanılmaz / **D** number ile much kullanılmaz ve number ile some kullanılmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$She spent the ---- day cleaning the house, and she cleaned ---- the rooms.$q$, array[$o$all / all$o$, $o$whole / whole$o$, $o$every / every$o$, $o$whole / all$o$, $o$entire the / each$o$], 3, $e$1. **The whole day** kalıbı: **whole**.
2. **All the rooms** kalıbı: **all**.

Diğer şıklar: **A** the ile whole kullanılır / **B** whole the rooms yapısı olmaz / **C** the ile whole kullanılır ve every tekil isim ister / **E** uygun yapı değildir ve each tekil isim ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$There aren't ---- chairs for everyone, so ---- people will have to stand.$q$, array[$o$enough / some$o$, $o$little / some$o$, $o$enough / any$o$, $o$much / much$o$, $o$a little / a little$o$], 0, $e$1. Yetersizlik **enough** ile anlatılır.
2. Olumlu cümlede **some** kullanılır.

Diğer şıklar: **B** chairs sayılabilir isimdir / **C** olumlu cümlede some gerekir / **D** chairs sayılabilir isimdir ve people sayılabilir isimdir / **E** chairs sayılabilir isimdir ve people sayılabilir isimdir.$e$, 1),
  (10, 'ydt-dil', null::integer, $q$---- of the three candidates was suitable, so we interviewed ---- more people.$q$, array[$o$Neither / several$o$, $o$None / another$o$, $o$None / several$o$, $o$Either / much$o$, $o$Every / little$o$], 2, $e$1. Üç seçenek için olumsuz anlam **None** ile verilir.
2. Sayılabilir çoğul isimle **several more people** kullanılır.

Diğer şıklar: **A** üç kişi için neither kullanılmaz / **B** more people ile another kullanılmaz / **D** üç kişi için either kullanılmaz ve people sayılabilir isimdir / **E** of the ile every kullanılmaz ve people sayılabilir isimdir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$All of the money ---- stolen, and all of the jewels ---- missing.$q$, array[$o$were / were$o$, $o$was / were$o$, $o$was / was$o$, $o$are / is$o$, $o$have been / has been$o$], 1, $e$1. **Money** sayılamaz isimdir ve tekil fiil alır: **was**.
2. **Jewels** çoğul isimdir: **were**.

Diğer şıklar: **A** money sayılamaz isimdir / **C** jewels çoğuldur / **D** money sayılamaz isimdir ve cümle geçmişteki bir olayı anlatıyor ve jewels çoğuldur / **E** money sayılamaz isimdir ve zaman uyumu yoktur ve jewels çoğuldur.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$A number of problems ---- discussed, but the number of participants ---- small.$q$, array[$o$were / was$o$, $o$was / was$o$, $o$were / were$o$, $o$is / are$o$, $o$has / have been$o$], 0, $e$1. **A number of** çoğul fiil ister: **were**.
2. **The number of** tekil fiil ister: **was**.

Diğer şıklar: **B** a number of çoğul fiil ister / **C** the number of tekil fiil ister / **D** a number of çoğul fiil ister ve the number of tekil fiil ister / **E** a number of çoğul fiil ister ve the number of tekil fiil ister.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$There is ---- milk left, so I'll buy ---- more.$q$, array[$o$hardly / some$o$, $o$hardly any / any$o$, $o$a few / a$o$, $o$hardly any / some$o$, $o$many / many$o$], 3, $e$1. **Hardly any** neredeyse hiç anlamındadır.
2. Olumlu cümlede **some** kullanılır.

Diğer şıklar: **A** hardly any birlikte kullanılır / **B** olumlu cümlede some gerekir / **C** milk sayılamaz isimdir ve milk sayılamaz isimdir / **E** milk sayılamaz isimdir ve milk sayılamaz isimdir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He has ---- friends than I do, but ---- of them are reliable.$q$, array[$o$less / few$o$, $o$fewer / few$o$, $o$fewer / little$o$, $o$little / a little$o$, $o$lesser / much$o$], 1, $e$1. **Friends** sayılabilir isimdir: **fewer**.
2. **Few of them** sayılabilir isim grubunu niteler.

Diğer şıklar: **A** sayılabilir isimle fewer gerekir / **C** sayılabilir isimle few gerekir / **D** friends sayılabilir isimdir ve sayılabilir isimle few gerekir / **E** uygun değildir ve sayılabilir isimle few gerekir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$---- student has a locker, and ---- of the lockers has a number.$q$, array[$o$All / each$o$, $o$Every / every$o$, $o$Both / all$o$, $o$A / both$o$, $o$Every / each$o$], 4, $e$1. **Every + tekil isim** kalıbı: **Every**.
2. **Each of the + çoğul isim** kalıbı: **each**.

Diğer şıklar: **A** all tekil isimle kullanılmaz / **B** every of kalıbı yoktur / **C** both tekil isimle kullanılmaz ve tekil fiil ile uyumsuzdur / **D** uygun değildir ve tekil fiil ile uyumsuzdur.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I have read ---- of the book, but I haven't finished ---- of it.$q$, array[$o$half / all$o$, $o$many / all$o$, $o$half / every$o$, $o$few / each$o$, $o$a number / many$o$], 0, $e$1. Kitabın yarısı için **half of the book** kullanılır.
2. Olumsuz cümlede tamamı için **all of it** kullanılır.

Diğer şıklar: **B** book sayılamaz bir bölüm gibi of ile kullanılır / **C** every of kalıbı yoktur / **D** of the book ile few kullanılmaz ve tek bir kitapla uyumsuzdur / **E** of the book ile uyumsuzdur ve it ile uyumsuzdur.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$I like ---- of these two shirts, but I can't afford ---- of them.$q$, array[$o$each / either$o$, $o$both / neither$o$, $o$both / either$o$, $o$either / all$o$, $o$every / every$o$], 2, $e$1. İkisini de sevmek **both of** ile anlatılır.
2. Olumsuz cümlede iki seçenekten biri için **either of** kullanılır.

Diğer şıklar: **A** likes ile both gerekir / **B** çift olumsuzluk olur / **D** olumlu cümlede both gerekir ve iki seçenek için kullanılmaz / **E** every of kalıbı yoktur ve every of kalıbı yoktur.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Few people know the answer, and ---- of them can explain it.$q$, array[$o$no$o$, $o$nobody$o$, $o$neither$o$, $o$never$o$, $o$none$o$], 4, $e$1. **None of them** kalıbı, grup içinde hiçbirini anlatır.

Diğer şıklar: **A** no of them kalıbı yoktur / **B** nobody of them kalıbı yoktur / **C** neither iki kişi için kullanılır / **D** never of them kalıbı yoktur.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Since there is ---- traffic on this road, we arrived early, but there were ---- accidents last month.$q$, array[$o$few / several$o$, $o$little / several$o$, $o$little / much$o$, $o$a few / little$o$, $o$many / a little$o$], 1, $e$1. **Traffic** sayılamaz isimdir: **little**.
2. **Accidents** sayılabilir isimdir: **several**.

Diğer şıklar: **A** traffic sayılamaz isimdir / **C** accidents sayılabilir isimdir / **D** traffic sayılamaz isimdir ve accidents sayılabilir isimdir / **E** traffic sayılamaz isimdir ve accidents sayılabilir isimdir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$---- of the two sisters is a doctor, but ---- of them has children.$q$, array[$o$Both / neither$o$, $o$One / either$o$, $o$All / any$o$, $o$One / neither$o$, $o$Every / both$o$], 3, $e$1. İkisinden biri için **One of the two** kullanılır.
2. İkisi için olumsuz anlam **neither of them** ile verilir.

Diğer şıklar: **A** tek kişi anlamı vermez / **B** olumsuz anlam için neither gerekir / **C** iki kişi için all kullanılmaz ve iki kişi için neither gerekir / **E** of the two ile every kullanılmaz ve has ile uyumsuzdur.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Prepositions konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Prepositions konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$She is good ---- mathematics, and she is interested ---- physics.$q$, array[$o$in / in$o$, $o$at / on$o$, $o$at / in$o$, $o$on / at$o$, $o$with / about$o$], 2, $e$1. **Be good at** kalıbı: **at**.
2. **Be interested in** kalıbı: **in**.

Diğer şıklar: **A** good sonrasında at gelir / **B** interested sonrasında in gelir / **D** good sonrasında at gelir ve interested sonrasında in gelir / **E** good sonrasında at gelir ve interested sonrasında in gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He was born ---- 5 May and moved to Ankara ---- 2010.$q$, array[$o$on / in$o$, $o$in / in$o$, $o$on / on$o$, $o$at / at$o$, $o$by / for$o$], 0, $e$1. Belirli günlerle **on** kullanılır.
2. Yıllarla **in** kullanılır.

Diğer şıklar: **B** belirli günlerle on kullanılır / **C** yıllarla in kullanılır / **D** belirli günlerle on kullanılır ve yıllarla in kullanılır / **E** belirli günlerle on kullanılır ve yıllarla in kullanılır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The meeting was cancelled ---- the heavy snow, and the match was played ---- the rain.$q$, array[$o$in spite of / in spite of$o$, $o$because of / because of$o$, $o$although / although$o$, $o$because of / in spite of$o$, $o$because / because$o$], 3, $e$1. Kar toplantının iptal nedenidir: **because of**.
2. Maç yağmura rağmen oynanmıştır: **in spite of**.

Diğer şıklar: **A** neden bildirmek için because of gerekir / **B** karşıtlık için in spite of gerekir / **C** isimle although kullanılmaz ve isimle although kullanılmaz / **E** isimle because kullanılmaz ve isimle because kullanılmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$She is responsible ---- the project, and he is in charge ---- the budget.$q$, array[$o$of / of$o$, $o$for / of$o$, $o$for / for$o$, $o$to / at$o$, $o$with / on$o$], 1, $e$1. **Be responsible for** kalıbı: **for**.
2. **Be in charge of** kalıbı: **of**.

Diğer şıklar: **A** responsible sonrasında for gelir / **C** in charge sonrasında of gelir / **D** responsible sonrasında for gelir ve in charge sonrasında of gelir / **E** responsible sonrasında for gelir ve in charge sonrasında of gelir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$I haven't seen him ---- Monday, and I'll be away ---- two weeks.$q$, array[$o$since / for$o$, $o$for / for$o$, $o$since / since$o$, $o$from / during$o$, $o$during / at$o$], 0, $e$1. Başlangıç noktası için **since** kullanılır.
2. Süre için **for** kullanılır.

Diğer şıklar: **B** başlangıç noktası için since gerekir / **C** süre için for gerekir / **D** present perfect ile since gerekir ve süre için for gerekir / **E** başlangıç noktası için since gerekir ve süre için for gerekir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$He apologised ---- being late, and she congratulated him ---- his success.$q$, array[$o$of / on$o$, $o$for / about$o$, $o$to / with$o$, $o$at / at$o$, $o$for / on$o$], 4, $e$1. **Apologise for** kalıbı: **for**.
2. **Congratulate somebody on** kalıbı: **on**.

Diğer şıklar: **A** apologise sonrasında for gelir / **B** congratulate sonrasında on gelir / **C** apologise sonrasında for gelir ve congratulate sonrasında on gelir / **D** apologise sonrasında for gelir ve congratulate sonrasında on gelir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$We arrived ---- the airport early, and then we flew ---- Istanbul.$q$, array[$o$to / to$o$, $o$at / at$o$, $o$at / to$o$, $o$on / in$o$, $o$into / on$o$], 2, $e$1. **Arrive at** küçük yerler için kullanılır: **at**.
2. **Fly to** kalıbı: **to**.

Diğer şıklar: **A** arrive sonrasında at gelir / **B** fly sonrasında to gelir / **D** arrive sonrasında at gelir ve fly sonrasında to gelir / **E** arrive sonrasında at gelir ve fly sonrasında to gelir.$e$, 1),
  (8, 'ydt-dil', null::integer, $q$He succeeded ---- passing the exam, and he insisted ---- paying the bill.$q$, array[$o$at / on$o$, $o$in / on$o$, $o$in / in$o$, $o$on / at$o$, $o$for / to$o$], 1, $e$1. **Succeed in** kalıbı: **in**.
2. **Insist on** kalıbı: **on**.

Diğer şıklar: **A** succeed sonrasında in gelir / **C** insist sonrasında on gelir / **D** succeed sonrasında in gelir ve insist sonrasında on gelir / **E** succeed sonrasında in gelir ve insist sonrasında on gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$---- the end of the film, she cried, but ---- the end she forgave him.$q$, array[$o$In / in$o$, $o$At / At$o$, $o$On / On$o$, $o$At / in$o$, $o$By / By$o$], 3, $e$1. **At the end of** bir şeyin sonunda anlamındadır: **At**.
2. **In the end** sonunda anlamındadır: **in**.

Diğer şıklar: **A** at the end of kalıbında at gelir / **B** sonunda anlamı için in the end gelir / **C** at the end of kalıbında at gelir ve sonunda anlamı için in the end gelir / **E** at the end of kalıbında at gelir ve sonunda anlamı için in the end gelir.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$He was angry ---- me ---- forgetting his birthday.$q$, array[$o$to / for$o$, $o$with / of$o$, $o$on / at$o$, $o$by / from$o$, $o$with / for$o$], 4, $e$1. Birine kızmak **angry with** ile anlatılır.
2. Nedeni **for** ile bildirilir.

Diğer şıklar: **A** kişiyle öfke için with gelir / **B** neden için for gelir / **C** kişiyle öfke için with gelir ve neden için for gelir / **D** kişiyle öfke için with gelir ve neden için for gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The film is based ---- a true story, and it is known ---- its realistic scenes.$q$, array[$o$on / for$o$, $o$in / for$o$, $o$on / as$o$, $o$at / of$o$, $o$to / with$o$], 0, $e$1. **Be based on** kalıbı: **on**.
2. **Be known for** kalıbı: **for**.

Diğer şıklar: **B** based sonrasında on gelir / **C** özellik için known for kullanılır / **D** based sonrasında on gelir ve özellik için known for kullanılır / **E** based sonrasında on gelir ve özellik için known for kullanılır.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He was fined ---- driving too fast, and he was accused ---- breaking the law.$q$, array[$o$of / of$o$, $o$for / of$o$, $o$for / for$o$, $o$on / with$o$, $o$by / on$o$], 1, $e$1. **Be fined for** kalıbı: **for**.
2. **Be accused of** kalıbı: **of**.

Diğer şıklar: **A** fine sonrasında for gelir / **C** accuse sonrasında of gelir / **D** fine sonrasında for gelir ve accuse sonrasında of gelir / **E** fine sonrasında for gelir ve accuse sonrasında of gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Tom lives ---- his parents, and he travels to work ---- bus.$q$, array[$o$by / by$o$, $o$with / with$o$, $o$at / in$o$, $o$with / by$o$, $o$in / on$o$], 3, $e$1. Birlikte yaşamak **live with** ile anlatılır.
2. Araç türü **by bus** ile anlatılır.

Diğer şıklar: **A** birlikte yaşamak için with gelir / **B** araç türü için by gelir / **C** birlikte yaşamak için with gelir ve araç türü için by gelir / **E** birlikte yaşamak için with gelir ve araç türü için by gelir.$e$, 1),
  (14, 'ydt-dil', null::integer, $q$She is allergic ---- cats, and she is afraid ---- spiders.$q$, array[$o$of / of$o$, $o$to / from$o$, $o$to / of$o$, $o$with / to$o$, $o$against / with$o$], 2, $e$1. **Be allergic to** kalıbı: **to**.
2. **Be afraid of** kalıbı: **of**.

Diğer şıklar: **A** allergic sonrasında to gelir / **B** afraid sonrasında of gelir / **D** allergic sonrasında to gelir ve afraid sonrasında of gelir / **E** allergic sonrasında to gelir ve afraid sonrasında of gelir.$e$, 1),
  (15, 'ydt-dil', null::integer, $q$The price of oil has risen ---- 20 percent ---- the last year.$q$, array[$o$for / over$o$, $o$by / at$o$, $o$at / on$o$, $o$with / to$o$, $o$by / over$o$], 4, $e$1. Artış miktarı **by** ile verilir.
2. **Over the last year** son bir yıl boyunca anlamındadır.

Diğer şıklar: **A** artış miktarı için by gelir / **B** son bir yıl süresince için over gelir / **C** artış miktarı için by gelir ve son bir yıl süresince için over gelir / **D** artış miktarı için by gelir ve son bir yıl süresince için over gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$I'm not familiar ---- this software, but I'm used ---- working with computers.$q$, array[$o$to / to$o$, $o$with / to$o$, $o$with / with$o$, $o$of / at$o$, $o$about / for$o$], 1, $e$1. **Be familiar with** kalıbı: **with**.
2. **Be used to + gerund** kalıbı: **to**.

Diğer şıklar: **A** familiar sonrasında with gelir / **C** be used to kalıbı gerekir / **D** familiar sonrasında with gelir ve be used to kalıbı gerekir / **E** familiar sonrasında with gelir ve be used to kalıbı gerekir.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The company plans to invest ---- new technology, and it depends ---- foreign markets.$q$, array[$o$to / on$o$, $o$in / in$o$, $o$for / from$o$, $o$in / on$o$, $o$at / to$o$], 3, $e$1. **Invest in** kalıbı: **in**.
2. **Depend on** kalıbı: **on**.

Diğer şıklar: **A** invest sonrasında in gelir / **B** depend sonrasında on gelir / **C** invest sonrasında in gelir ve depend sonrasında on gelir / **E** invest sonrasında in gelir ve depend sonrasında on gelir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$He drove ---- the tunnel ---- the other side of the mountain.$q$, array[$o$across / to$o$, $o$through / at$o$, $o$over / in$o$, $o$among / on$o$, $o$through / to$o$], 4, $e$1. Tünelden geçmek **through** ile anlatılır.
2. Hedef noktası **to** ile verilir.

Diğer şıklar: **A** tünel için through gerekir / **B** hedef için to gerekir / **C** tünel için through gerekir ve hedef için to gerekir / **D** tünel için through gerekir ve hedef için to gerekir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$I read the news ---- the Internet ---- the morning.$q$, array[$o$on / in$o$, $o$in / in$o$, $o$on / on$o$, $o$at / at$o$, $o$by / by$o$], 0, $e$1. **On the Internet** kalıbı: **on**.
2. **In the morning** kalıbı: **in**.

Diğer şıklar: **B** Internet ile on kullanılır / **C** günün bölümleriyle in kullanılır / **D** Internet ile on kullanılır ve günün bölümleriyle in kullanılır / **E** Internet ile on kullanılır ve günün bölümleriyle in kullanılır.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$She is proud ---- her son, and she is worried ---- his health.$q$, array[$o$with / about$o$, $o$of / of$o$, $o$of / about$o$, $o$for / to$o$, $o$on / at$o$], 2, $e$1. **Be proud of** kalıbı: **of**.
2. **Be worried about** kalıbı: **about**.

Diğer şıklar: **A** proud sonrasında of gelir / **B** worried sonrasında about gelir / **D** proud sonrasında of gelir ve worried sonrasında about gelir / **E** proud sonrasında of gelir ve worried sonrasında about gelir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Wish Clauses konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Wish Clauses konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$I wish I ---- a car, but I can't afford one, and I wish it ---- raining.$q$, array[$o$have / would stop$o$, $o$had / stops$o$, $o$had / would stop$o$, $o$will have / will stop$o$, $o$would have / stopping$o$], 2, $e$1. Şimdiki gerçek dışı durum **wish + Past Simple** ile kurulur: **had**.
2. Rahatsız eden bir durumun bitmesi isteği **wish + would** ile anlatılır: **would stop**.

Diğer şıklar: **A** wish sonrasında Past Simple gerekir / **B** wish sonrasında would + V1 gerekir / **D** wish sonrasında will kullanılmaz ve wish sonrasında will kullanılmaz / **E** sahip olma durumu için had gerekir ve wish sonrasında -ing biçimi kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$I wish I ---- harder for the exam last week, and I wish I ---- more time then.$q$, array[$o$studied / had had$o$, $o$had studied / had$o$, $o$would study / have$o$, $o$have studied / would have$o$, $o$had studied / had had$o$], 4, $e$1. **Last week** geçmişteki pişmanlığı gösterir: **wish + had studied**.
2. **Then** de geçmişe işaret eder: **had had**.

Diğer şıklar: **A** geçmişteki pişmanlık için wish + Past Perfect gerekir / **B** geçmiş için wish + Past Perfect gerekir / **C** geçmişteki pişmanlık için wish + Past Perfect gerekir ve geçmiş için wish + Past Perfect gerekir / **D** geçmişteki pişmanlık için wish + Past Perfect gerekir ve geçmiş için wish + Past Perfect gerekir.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$He talks as if he ---- everything, although he actually knows very little, and he looks as though he ---- a ghost.$q$, array[$o$knows / had seen$o$, $o$knew / saw$o$, $o$will know / sees$o$, $o$knew / had seen$o$, $o$has known / would see$o$], 3, $e$1. Gerçek olmayan şimdiki durum **as if + Past Simple** ile verilir: **knew**.
2. Önceden yaşanmış bir deneyim **as though + Past Perfect** ile verilir: **had seen**.

Diğer şıklar: **A** gerçek olmayan durum için as if + Past Simple gerekir / **B** önceki bir olay için as though + Past Perfect gerekir / **C** as if + will kullanılmaz ve şimdiki zamandır, gerçek dışı geçmiş anlatılmıyor / **E** gerçek olmayan durum için as if + Past Simple gerekir ve as though + would kullanılmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$If only I ---- the answer, I would tell you, and if only he ---- the rules last month!$q$, array[$o$know / had followed$o$, $o$knew / had followed$o$, $o$knew / followed$o$, $o$had known / would follow$o$, $o$would know / follows$o$], 1, $e$1. Şimdiki gerçek dışı durum için **if only + Past Simple**: **knew**.
2. **Last month** geçmiştir: **had followed**.

Diğer şıklar: **A** if only + Past Simple gerekir / **C** geçmiş pişmanlık için if only + Past Perfect gerekir / **D** şimdiki gerçek dışı durum için Past Simple gerekir ve geçmiş pişmanlık için if only + Past Perfect gerekir / **E** if only sonrasında would kullanılmaz ve geçmiş pişmanlık için if only + Past Perfect gerekir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$I wish the neighbours ---- that loud music, it is driving me crazy, and I wish I ---- at the party last night.$q$, array[$o$stop / hadn't gone$o$, $o$would stop / didn't go$o$, $o$would stop / hadn't gone$o$, $o$will stop / wouldn't go$o$, $o$had stopped / haven't gone$o$], 2, $e$1. Rahatsız edici davranış için **wish + would**: **would stop**.
2. **Last night** geçmiştir. Pişmanlık **hadn't gone** ile anlatılır.

Diğer şıklar: **A** rahatsız edici durum için wish + would gerekir / **B** last night geçmiştir, Past Perfect gerekir / **D** wish sonrasında will kullanılmaz ve last night geçmiştir, Past Perfect gerekir / **E** rahatsız edici durum için wish + would gerekir ve wish sonrasında Present Perfect kullanılmaz.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$It's high time you ---- a decision, and I would rather you ---- me yesterday.$q$, array[$o$make / had told$o$, $o$made / told$o$, $o$will make / tell$o$, $o$would make / would tell$o$, $o$made / had told$o$], 4, $e$1. **It's high time** sonrasında Past Simple kullanılır: **made**.
2. Geçmişte yapılmayan bir iş için **would rather + had told** kullanılır.

Diğer şıklar: **A** it's high time sonrasında Past Simple gerekir / **B** yesterday geçmiştir, would rather + Past Perfect gerekir / **C** it's high time sonrasında will kullanılmaz ve yesterday geçmiştir, would rather + Past Perfect gerekir / **D** it's high time sonrasında would kullanılmaz ve would rather sonrasında would kullanılmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$She wishes she ---- taller, and he wishes he ---- a bigger house.$q$, array[$o$were / had$o$, $o$is / had$o$, $o$were / has$o$, $o$will be / will have$o$, $o$had been / would have$o$], 0, $e$1. Şimdiki gerçek dışı durumlar için **wish + Past Simple** kullanılır: **were** ve **had**.

Diğer şıklar: **B** wish sonrasında Past Simple gerekir / **C** wish sonrasında Past Simple gerekir / **D** wish sonrasında will kullanılmaz ve wish sonrasında will kullanılmaz / **E** şimdiki durum için Past Simple gerekir ve wish sonrasında would have kullanılmaz.$e$, 1),
  (8, 'ydt-dil', null::integer, $q$If only we ---- more careful, the accident wouldn't have happened, but now we ---- the consequences.$q$, array[$o$were / are facing$o$, $o$had been / faced$o$, $o$had been / are facing$o$, $o$would be / would face$o$, $o$are / had faced$o$], 2, $e$1. Geçmişteki pişmanlık **if only + had been** ile söylenir.
2. **Now** ile sonuç şimdiki zamandadır: **are facing**.

Diğer şıklar: **A** geçmiş pişmanlık için Past Perfect gerekir / **B** now şimdiki zamanı gösterir / **D** if only sonrasında would kullanılmaz ve now şimdiki zamanı gösterir / **E** geçmiş pişmanlık için Past Perfect gerekir ve now şimdiki zamanı gösterir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$I wish I ---- swim, but I never learned, and I wish my parents ---- me to take lessons.$q$, array[$o$can / had made$o$, $o$could / made$o$, $o$would / would make$o$, $o$could / had made$o$, $o$will / make$o$], 3, $e$1. Şimdiki yetenek isteği **wish + could**: **could**.
2. Geçmişteki pişmanlık **had made** ile anlatılır.

Diğer şıklar: **A** wish sonrasında could gerekir / **B** geçmiş pişmanlık için Past Perfect gerekir / **C** yetenek için could gerekir ve geçmiş pişmanlık için Past Perfect gerekir / **E** wish sonrasında will kullanılmaz ve geçmiş pişmanlık için Past Perfect gerekir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$She wishes she ---- to the party yesterday, but she was ill, and she wishes she ---- better now.$q$, array[$o$could have gone / felt$o$, $o$could go / felt$o$, $o$could have gone / would feel$o$, $o$can go / had felt$o$, $o$would go / will feel$o$], 0, $e$1. **Yesterday** geçmiştir: **could have gone**.
2. **Now** şimdiki durumdur: **felt**.

Diğer şıklar: **B** yesterday geçmiştir, could have V3 gerekir / **C** now şimdiki durumdur, Past Simple gerekir / **D** wish sonrasında can kullanılmaz ve now şimdiki durumdur, Past Simple gerekir / **E** yesterday geçmiştir, could have V3 gerekir ve wish sonrasında will kullanılmaz.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$He wishes he ---- to London last year, because he is lonely there now, and he wishes his family ---- with him.$q$, array[$o$didn't move / were$o$, $o$hadn't moved / are$o$, $o$wouldn't move / will be$o$, $o$hasn't moved / had been$o$, $o$hadn't moved / were$o$], 4, $e$1. Geçmişteki karar için pişmanlık **hadn't moved** ile anlatılır.
2. Şimdiki gerçek dışı durum **were** ile anlatılır.

Diğer şıklar: **A** last year geçmiştir, Past Perfect gerekir / **B** wish sonrasında Past Simple gerekir / **C** last year geçmiştir, Past Perfect gerekir ve wish sonrasında will kullanılmaz / **D** wish sonrasında Present Perfect kullanılmaz ve şimdiki durumdur, Past Simple gerekir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$I'd rather you ---- smoke here, and I'd rather they ---- us tomorrow.$q$, array[$o$don't / visited$o$, $o$didn't / visited$o$, $o$didn't / visit$o$, $o$won't / will visit$o$, $o$haven't / have visited$o$], 1, $e$1. Başkasının davranışı için **would rather + özne + Past Simple** kullanılır: **didn't** ve **visited**.

Diğer şıklar: **A** would rather sonrasında Past Simple gerekir / **C** would rather sonrasında Past Simple gerekir / **D** would rather sonrasında Past Simple gerekir ve would rather sonrasında will kullanılmaz / **E** would rather sonrasında Past Simple gerekir ve would rather sonrasında Past Simple gerekir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$It's about time we ---- , and it's high time he ---- a job.$q$, array[$o$leave / found$o$, $o$left / finds$o$, $o$left / found$o$, $o$will leave / will find$o$, $o$would leave / would find$o$], 2, $e$1. **It's time** sonrasında Past Simple kullanılır: **left** ve **found**.

Diğer şıklar: **A** it's about time sonrasında Past Simple gerekir / **B** it's high time sonrasında Past Simple gerekir / **D** it's about time sonrasında will kullanılmaz ve it's high time sonrasında will kullanılmaz / **E** it's about time sonrasında would kullanılmaz ve it's high time sonrasında would kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$She looked at me as though I ---- crazy, and she acted as if she ---- me before.$q$, array[$o$were / had never met$o$, $o$am / had never met$o$, $o$were / never met$o$, $o$will be / would never meet$o$, $o$had been / will never meet$o$], 0, $e$1. Gerçek olmayan durum **as though + were** ile anlatılır.
2. Önceki deneyim **as if + had never met** ile anlatılır.

Diğer şıklar: **B** as though sonrasında Past Simple gerekir / **C** önceki deneyim için as if + Past Perfect gerekir / **D** as though sonrasında will kullanılmaz ve as if sonrasında would kullanılmaz / **E** şimdiki gerçek dışı durumda Past Simple gerekir ve as if sonrasında will kullanılmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I wish I ---- more patient when I was young, and I wish I ---- you then.$q$, array[$o$was / had known$o$, $o$had been / knew$o$, $o$were / know$o$, $o$had been / had known$o$, $o$am / would know$o$], 3, $e$1. **When I was young** geçmiştir: **had been**.
2. **Then** geçmişe işaret eder: **had known**.

Diğer şıklar: **A** geçmiş pişmanlık için Past Perfect gerekir / **B** then geçmiş zamandır, Past Perfect gerekir / **C** geçmiş pişmanlık için Past Perfect gerekir ve then geçmiş zamandır, Past Perfect gerekir / **E** geçmiş pişmanlık için Past Perfect gerekir ve wish sonrasında would kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$If only it ---- raining, we could go out, and if only I ---- an umbrella!$q$, array[$o$stops / had$o$, $o$would stop / had$o$, $o$would stop / have$o$, $o$will stop / would have$o$, $o$had stopped / will have$o$], 1, $e$1. Devam eden olayın bitmesi isteği **would stop** ile anlatılır.
2. Şimdiki sahiplik isteği **had** ile anlatılır.

Diğer şıklar: **A** if only + would gerekir / **C** if only + Past Simple gerekir / **D** if only sonrasında will kullanılmaz ve sahip olma durumunda had gerekir / **E** devam eden olay için would stop gerekir ve if only sonrasında will kullanılmaz.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$I wish I ---- here yesterday, but I had an appointment, and I wish I ---- here tomorrow too.$q$, array[$o$could be / could be$o$, $o$could have been / could have been$o$, $o$can be / had been$o$, $o$would be / would have been$o$, $o$could have been / could be$o$], 4, $e$1. **Yesterday** geçmiştir: **could have been**.
2. **Tomorrow** gelecektir: **could be**.

Diğer şıklar: **A** yesterday geçmiştir, could have V3 gerekir / **B** tomorrow gelecektir, could be gerekir / **C** wish sonrasında can kullanılmaz ve tomorrow gelecektir, could be gerekir / **D** yesterday geçmiştir, could have V3 gerekir ve tomorrow gelecektir, could be gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He is behaving as if he ---- the king of the world, as though he ---- a single mistake in his life.$q$, array[$o$is / had never made$o$, $o$were / would never make$o$, $o$will be / will never make$o$, $o$were / had never made$o$, $o$has been / has never been making$o$], 3, $e$1. Gerçek dışı durum **as if + were** ile anlatılır.
2. Geçmiş deneyim **as though + had never made** ile anlatılır.

Diğer şıklar: **A** gerçek dışı durumda were gerekir / **B** geçmiş deneyim için had never made gerekir / **C** as if sonrasında will kullanılmaz ve geçmiş deneyim için had never made gerekir / **E** gerçek dışı durumda were gerekir ve uygun yapı değildir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$I wish I ---- to the concert last night, and I wish I ---- the tickets while they were available.$q$, array[$o$had gone / had bought$o$, $o$went / had bought$o$, $o$had gone / bought$o$, $o$would go / would buy$o$, $o$have gone / have bought$o$], 0, $e$1. Geçmişteki pişmanlık **wish + had + V3** ile anlatılır: **had gone** ve **had bought**.

Diğer şıklar: **B** geçmiş pişmanlık için Past Perfect gerekir / **C** geçmiş pişmanlık için Past Perfect gerekir / **D** geçmiş pişmanlık için Past Perfect gerekir ve geçmiş pişmanlık için Past Perfect gerekir / **E** geçmiş pişmanlık için Past Perfect gerekir ve geçmiş pişmanlık için Past Perfect gerekir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$If only he ---- me that he was ill, I ---- him in hospital.$q$, array[$o$told / would have visited$o$, $o$had told / would have visited$o$, $o$had told / would visit$o$, $o$would tell / visited$o$, $o$tells / will visit$o$], 1, $e$1. Geçmiş pişmanlık: **had told**.
2. Geçmişteki gerçekleşmeyen sonuç: **would have visited**.

Diğer şıklar: **A** geçmiş pişmanlık için Past Perfect gerekir / **C** geçmiş sonuç için would have V3 gerekir / **D** if only sonrasında would kullanılmaz ve geçmiş sonuç için would have V3 gerekir / **E** geçmiş pişmanlık için Past Perfect gerekir ve geçmiş sonuç için would have V3 gerekir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

