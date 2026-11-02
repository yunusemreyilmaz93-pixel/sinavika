-- 20261026147000_questions_ydt_gramer_7. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conjunctions ve Linkers konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$---- the fact that he had been warned several times, he refused to change his behaviour, ---- he was dismissed.$q$, array[$o$Although / and so$o$, $o$Despite / and but$o$, $o$Despite / and so$o$, $o$Because / but so$o$, $o$Whereas / so that$o$], 2, $e$1. **Despite the fact that** kalıbı kullanılır: **Despite**.
2. Sonuç **and so** ile eklenir: **and so**.

Diğer şıklar: **A** sonrasında the fact that gelmez / **B** biçim yanlış / **D** zıtlık anlamı gerekir ve biçim yanlış / **E** zıtlık anlamı gerekir ve amaç bildirir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- the teacher explained the rule twice, many students still didn't understand it. ----, they were afraid to ask questions.$q$, array[$o$Even though / Moreover$o$, $o$Despite / Moreover$o$, $o$Even though / Therefore$o$, $o$Because / Otherwise$o$, $o$So / For example$o$], 0, $e$1. Zıtlık **Even though** ile kurulur: **Even though**.
2. Ek bilgi **moreover** ile eklenir: **moreover**.

Diğer şıklar: **B** sonrasında cümle gelmez / **C** ek bilgi moreover ister / **D** zıtlık anlamı gerekir ve ek bilgi moreover ister / **E** zıtlık anlamı gerekir ve örnek verir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The company must reduce its costs. ----, it will go bankrupt, but it must do so ---- damaging its reputation.$q$, array[$o$However / without$o$, $o$Otherwise / instead of$o$, $o$Therefore / despite$o$, $o$Moreover / unless$o$, $o$Otherwise / without$o$], 4, $e$1. Aksi durumu **otherwise** verir: **otherwise**.
2. **Without** sonrasında gerund gelir: **without**.

Diğer şıklar: **A** sonuç otherwise ister / **B** without ile gerund gerekir, anlam bozulur / **C** önceki koşulun tersi otherwise ister ve anlam bozulur / **D** ek bilgi verir ve sonrasında cümle gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He is not only intelligent but he is also extremely hardworking. ----, he deserves the promotion, ---- he hasn't been given it yet.$q$, array[$o$However / although$o$, $o$Therefore / although$o$, $o$Therefore / because$o$, $o$Otherwise / so$o$, $o$Nevertheless / unless$o$], 1, $e$1. Sonuç **therefore** ile kurulur: **therefore**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** sonuç therefore ister / **C** zıtlık although ister / **D** sonuç therefore ister ve zıtlık although ister / **E** sonuç therefore ister ve zıtlık although ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- some critics praised the film, others found it dull. ----, it won several awards.$q$, array[$o$Despite / Nevertheless$o$, $o$While / Therefore$o$, $o$While / Nevertheless$o$, $o$Because / Moreover$o$, $o$Since / As a result$o$], 2, $e$1. Karşıtlık **While** ile kurulur: **While**.
2. Zıtlık **nevertheless** ile kurulur: **nevertheless**.

Diğer şıklar: **A** sonrasında cümle gelmez / **B** zıtlık nevertheless ister / **D** zıtlık anlamı gerekir ve ek bilgi verir / **E** zıtlık anlamı gerekir ve sonuç bildirir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conjunctions ve Linkers konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (7, 'ydt-dil', null::integer, $q$The match was cancelled ---- the heavy rain, and the fans were sent home ---- they were disappointed.$q$, array[$o$because of / although$o$, $o$because / although$o$, $o$because of / because$o$, $o$despite / so$o$, $o$although / despite$o$], 0, $e$1. **Because of** sonrasında isim öbeği gelir: **because of**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **B** sonrasında isim öbeği gelir, because of kullanılır / **C** zıtlık although ister / **D** sebep anlamı bozulur ve zıtlık although ister / **E** sonrasında isim öbeği gelmez ve sonrasında cümle gelmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- you have finished your homework, you can go out and play, ---- you must be back by six.$q$, array[$o$Unless / but$o$, $o$Now that / so$o$, $o$Although / because$o$, $o$Because of / although$o$, $o$Now that / but$o$], 4, $e$1. **Now that** sebep ve zaman ilişkisi kurar: **Now that**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** anlam bozulur / **B** zıtlık but ister / **C** anlam bozulur ve zıtlık but ister / **D** sonrasında cümle gelmez ve zıtlık but ister.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He was late for work ---- the bus broke down, but ---- his boss was angry, he didn't say a word.$q$, array[$o$although / although$o$, $o$because / because$o$, $o$despite / despite$o$, $o$because / although$o$, $o$so / so$o$], 3, $e$1. Sebep **because** ile kurulur: **because**.
2. Zıtlık **although** ile kurulur: **although**.

Diğer şıklar: **A** sebep anlamı because ister / **B** zıtlık although ister / **C** sonrasında cümle gelmez ve sonrasında cümle gelmez / **E** sebep anlamı because ister ve zıtlık although ister.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$---- the tickets were expensive, we bought them, ---- the concert was sold out.$q$, array[$o$Because / because$o$, $o$Although / although$o$, $o$Although / because$o$, $o$Despite / despite$o$, $o$So / so$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
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
  (15, 'ydt-dil', null::integer, $q$The firm has expanded rapidly. ----, it has failed to increase profits, ---- many analysts doubt its long-term strategy.$q$, array[$o$Therefore / and$o$, $o$Nevertheless / but$o$, $o$Nevertheless / and$o$, $o$Moreover / although$o$, $o$For instance / because$o$], 2, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Sonuç **and** ile eklenir: **and**.

Diğer şıklar: **A** zıtlık nevertheless ister / **B** bu bağlamda sonuç and ister / **D** ek bilgi verir ve sonuç and ister / **E** örnek verir ve anlam bozulur.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$---- the new regulations come into force, all employees must attend a training session, ---- they will not be allowed to work.$q$, array[$o$After / otherwise$o$, $o$Before / therefore$o$, $o$Since / however$o$, $o$Before / otherwise$o$, $o$As soon as / moreover$o$], 3, $e$1. Zaman ilişkisi **Before** ile kurulur: **Before**.
2. Aksi durumu **otherwise** verir: **otherwise**.

Diğer şıklar: **A** zaman ilişkisi anlam bozar / **B** önceki koşulun tersi otherwise ister / **C** zaman ilişkisi anlam bozar ve sonuç otherwise ister / **E** zaman ilişkisi anlam bozar ve ek bilgi verir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Few people attended the lecture, ---- the speaker was well-known, ---- it was held during the holidays.$q$, array[$o$despite / since$o$, $o$even though / since$o$, $o$even though / although$o$, $o$because / despite$o$, $o$so / so that$o$], 1, $e$1. Zıtlık **even though** ile kurulur: **even though**.
2. Sebep **since** ile kurulur: **since**.

Diğer şıklar: **A** sonrasında cümle gelmez / **C** sebep anlamı since ister / **D** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **E** zıtlık anlamı gerekir ve amaç bildirir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He apologised ---- the harm he had caused, ---- he didn't offer any compensation.$q$, array[$o$about / but$o$, $o$for / and$o$, $o$of / so$o$, $o$to / because$o$, $o$for / but$o$], 4, $e$1. **Apologise for** kalıbı kullanılır: **for**.
2. Zıtlık **but** ile kurulur: **but**.

Diğer şıklar: **A** apologise for kalıbı / **B** zıtlık but ister / **C** apologise for kalıbı ve zıtlık but ister / **D** apologise for kalıbı ve zıtlık but ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- the plan seemed risky, the board approved it, ---- the profits it promised were too tempting to refuse.$q$, array[$o$Although / because$o$, $o$Despite / because$o$, $o$Although / although$o$, $o$Because / despite$o$, $o$So / so$o$], 0, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **B** sonrasında cümle gelmez / **C** sebep anlamı because ister / **D** zıtlık anlamı gerekir ve sonrasında cümle gelmez / **E** zıtlık anlamı gerekir ve sebep anlamı because ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She has been unwell for weeks. ----, she insists on working, ---- she is afraid of losing her job.$q$, array[$o$Therefore / because$o$, $o$Nevertheless / because$o$, $o$Nevertheless / although$o$, $o$Moreover / so$o$, $o$As a result / unless$o$], 1, $e$1. Zıtlık **nevertheless** ile kurulur: **nevertheless**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** zıtlık nevertheless ister / **C** sebep because ister / **D** ek bilgi verir ve sebep because ister / **E** sonuç bildirir ve sebep because ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Conjunctions ve Linkers konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Conjunctions ve Linkers konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Conjunctions ve Linkers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$Despite the fact that prices have risen, demand has not fallen. ----, it has increased, ---- consumers are more confident.$q$, array[$o$Therefore / because$o$, $o$On the contrary / although$o$, $o$However / despite$o$, $o$On the contrary / because$o$, $o$For example / so$o$], 3, $e$1. Önceki olumsuzlamanın tersi **on the contrary** ile kurulur: **on the contrary**.
2. Sebep **because** ile kurulur: **because**.

Diğer şıklar: **A** olumsuzlamanın tersi on the contrary ister / **B** sebep because ister / **C** önceki olumsuzu düzeltmez ve sonrasında cümle gelmez / **E** örnek verir ve sebep because ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The manager was not angry ---- his employees were late. ----, he was disappointed by their lack of respect.$q$, array[$o$because / Rather$o$, $o$although / Rather$o$, $o$because / Therefore$o$, $o$despite / Moreover$o$, $o$so / However$o$], 0, $e$1. Sebep **because** ile kurulur: **because**.
2. Düzeltme **rather** ile yapılır: **rather**.

Diğer şıklar: **B** sebep because ister / **C** düzeltme rather ister / **D** sonrasında cümle gelmez ve ek bilgi verir / **E** sebep because ister ve düzeltme rather ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- all the evidence pointed to him, the police released him. ----, they kept him under surveillance.$q$, array[$o$Despite / Nevertheless$o$, $o$Although / Therefore$o$, $o$Although / Nevertheless$o$, $o$Because / Moreover$o$, $o$So / As a result$o$], 2, $e$1. Zıtlık **Although** ile kurulur: **Although**.
2. Zıtlık **nevertheless** ile kurulur: **nevertheless**.

Diğer şıklar: **A** sonrasında cümle gelmez / **B** zıtlık nevertheless ister / **D** zıtlık anlamı gerekir ve ek bilgi verir / **E** zıtlık anlamı gerekir ve sonuç bildirir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$No matter ---- hard he tried, he could not solve the puzzle, ---- he refused to ask for help.$q$, array[$o$what / and$o$, $o$how / so$o$, $o$when / because$o$, $o$how / and$o$, $o$who / although$o$], 3, $e$1. **No matter how** kalıbı kullanılır: **how**.
2. Ek bilgi **and** ile eklenir: **and**.

Diğer şıklar: **A** how hard kalıbı / **B** ek bilgi and ister / **C** how hard kalıbı ve ek bilgi and ister / **E** how hard kalıbı ve ek bilgi and ister.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The more he practised, the ---- he became. ----, he never took the credit for his success.$q$, array[$o$good / However$o$, $o$better / However$o$, $o$better / Therefore$o$, $o$best / Moreover$o$, $o$more good / As a result$o$], 1, $e$1. **The more..., the better** yapısı kullanılır: **better**.
2. Zıtlık **however** ile kurulur: **however**.

Diğer şıklar: **A** the + karşılaştırma ister / **C** zıtlık however ister / **D** the + karşılaştırma ister ve ek bilgi verir / **E** good düzensizdir ve sonuç bildirir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Determiners ve Quantifiers konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Determiners ve Quantifiers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$There isn't ---- milk in the fridge, but there are ---- eggs on the table.$q$, array[$o$many / a few$o$, $o$much / a little$o$, $o$few / little$o$, $o$a few / much$o$, $o$much / a few$o$], 4, $e$1. Sayılamayan isim için **much** kullanılır: **much**.
2. Sayılabilir çoğul için **a few** kullanılır: **a few**.

Diğer şıklar: **A** sayılamayan milk ile much gelir / **B** sayılabilir eggs ile a few gelir / **C** olumsuz cümlede much gerekir ve sayılabilir eggs ile few/a few gelir / **D** sayılamayan isimle kullanılmaz ve sayılabilir eggs ile kullanılmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He has ---- friends, so he often feels lonely, and he spends ---- time alone.$q$, array[$o$few / a lot of$o$, $o$a few / a lot of$o$, $o$few / a many$o$, $o$little / many of$o$, $o$much / much$o$], 0, $e$1. Olumsuz anlamda sayılabilir çoğul için **few** kullanılır: **few**.
2. Olumlu cümlede **a lot of** kullanılır: **a lot of**.

Diğer şıklar: **B** olumsuz anlam için few gerekir / **C** biçim yanlış / **D** sayılabilir friends ile few gelir ve anlam bozulur / **E** sayılabilir friends ile kullanılmaz ve olumlu cümlede a lot of kullanılır.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I'd like ---- apple and ---- orange juice, please.$q$, array[$o$a / an$o$, $o$an / a$o$, $o$the / the$o$, $o$an / an$o$, $o$some / some$o$], 3, $e$1. Ünlü seste **an** gelir: **an**.
2. Aynı kurala göre: **an**.

Diğer şıklar: **A** ünlü sesle başlayan apple için an gelir / **B** ünlü sesle başlayan orange için an gelir / **C** belirsiz tek bir nesne için an gelir ve belirsiz nesne için an gelir / **E** tekil isimle kullanılmaz ve sayılamayan anlam için kullanılır.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$---- sun rises in ---- east, and sets in the west.$q$, array[$o$A / the$o$, $o$The / the$o$, $o$The / a$o$, $o$An / an$o$, $o$This / this$o$], 1, $e$1. Tek olan varlık için **the** kullanılır: **The**.
2. Yön adı için **the** kullanılır: **the**.

Diğer şıklar: **A** tek olan varlık için the gelir / **C** yön adı için the gelir / **D** tek olan varlık için the gelir ve yön adı için the gelir / **E** tek olan varlık için the gelir ve yön adı için the gelir.$e$, 1),
  (5, 'ydt-dil', null::integer, $q$---- of the students passed the exam, but ---- of them got full marks.$q$, array[$o$Most / none$o$, $o$Every / none$o$, $o$Most / any$o$, $o$Much / every$o$, $o$Each / each$o$], 0, $e$1. **Most of** sonrasında çoğul isim gelir: **Most**.
2. **None of** hiçbiri anlamını verir: **none**.

Diğer şıklar: **B** of ile kullanılmaz / **C** olumlu cümlede none gerekir / **D** sayılabilir çoğul ile kullanılmaz ve of ile kullanılmaz / **E** of ile pass anlamı bozulur ve none anlamı gerekir.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$I don't have ---- money with me, so could you lend me ----?$q$, array[$o$some / some$o$, $o$any / any$o$, $o$no / no$o$, $o$none / none$o$, $o$any / some$o$], 4, $e$1. Olumsuz cümlede **any** kullanılır: **any**.
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
  (16, 'ydt-dil', null::integer, $q$He found ---- job that he liked, but ---- salary was too low, so he refused the offer.$q$, array[$o$a / the$o$, $o$the / the$o$, $o$a / a$o$, $o$an / some$o$, $o$some / any$o$], 0, $e$1. İlk kez bahsedilen tekil isim için **a** kullanılır: **a**.
2. Daha önce belirlenen şey için **the** kullanılır: **the**.

Diğer şıklar: **B** ilk kez bahsedilen iş için a gelir / **C** bilinen maaş için the gelir / **D** consonant ile a gelir ve bilinen maaş için the gelir / **E** tekil sayılabilir isimle kullanılmaz ve bilinen maaş için the gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$She is ---- only person in the office who speaks Chinese, so she is ---- very valuable employee.$q$, array[$o$a / a$o$, $o$the / the$o$, $o$the / a$o$, $o$an / an$o$, $o$this / some$o$], 2, $e$1. **The only** kalıbı kullanılır: **the**.
2. Belirsiz tekil isim için **a** kullanılır: **a**.

Diğer şıklar: **A** only ile the gelir / **B** belirsiz tek bir çalışan için a gelir / **D** only ile the gelir ve very ünsüzle başlar, a gelir / **E** only ile the gelir ve tekil sayılabilir isimle kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- police are investigating a crime that took place on ---- High Street last night.$q$, array[$o$A / the$o$, $o$The / a$o$, $o$Some / zero$o$, $o$The / the$o$, $o$Any / an$o$], 3, $e$1. **The police** kalıbı kullanılır: **The**.
2. **The High Street** kalıbı kullanılır: **the**.

Diğer şıklar: **A** police her zaman the ile kullanılır / **B** cadde adı için the gelir / **C** belirli kurum için the gelir ve cadde adı için the gelir / **E** belirli kurum için the gelir ve cadde adı için the gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Neither of ---- twins likes spinach, but both of ---- love chocolate.$q$, array[$o$a / them$o$, $o$the / they$o$, $o$these / their$o$, $o$their / theirs$o$, $o$the / them$o$], 4, $e$1. **Neither of the** kalıbı belirli çoğul alır: **the**.
2. **Of** sonrasında nesne zamiri gelir: **them**.

Diğer şıklar: **A** neither of ile belirli çoğul gerekir / **B** of sonrasında nesne zamiri gelir / **C** neither of the twins kalıbı ve of sonrasında nesne zamiri gelir / **D** neither of the twins kalıbı ve of sonrasında nesne zamiri gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- information he gave us was useful, and ---- advice he offered saved us a lot of time.$q$, array[$o$An / the$o$, $o$The / an$o$, $o$The / the$o$, $o$A / a$o$, $o$Another / another$o$], 2, $e$1. Belirli sayılamayan isim için **the** kullanılır: **The**.
2. Aynı kurala göre: **the**.

Diğer şıklar: **A** sayılamayan isimle an kullanılmaz / **B** sayılamayan isimle an kullanılmaz / **D** sayılamayan isimle a kullanılmaz ve sayılamayan isimle a kullanılmaz / **E** sayılamayan isimle another kullanılmaz ve sayılamayan isimle another kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Determiners ve Quantifiers konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Determiners ve Quantifiers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (10, 'ydt-dil', null::integer, $q$---- of the two candidates is suitable for the job, so ---- of them will be hired.$q$, array[$o$Both / neither$o$, $o$Neither / both$o$, $o$Each / either$o$, $o$Either / each$o$, $o$Neither / neither$o$], 4, $e$1. İki varlıktan hiçbiri **neither of** ile söylenir: **Neither**.
2. Aynı kurala göre: **neither**.

Diğer şıklar: **A** olumsuz sonuç neither ister / **B** olumsuz sonuç neither ister / **C** olumsuz sonuç neither ister ve olumsuz sonuç neither ister / **D** olumsuz sonuç neither ister ve olumsuz sonuç neither ister.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$Not ---- of the information he gave us was accurate, and ---- of the figures he quoted were wrong.$q$, array[$o$all / some$o$, $o$every / some$o$, $o$all / little$o$, $o$each / much$o$, $o$many / every$o$], 0, $e$1. **Not all of** kısmi olumsuzluk kurar: **all**.
2. Sayılabilir çoğul için **some of** kullanılır: **some**.

Diğer şıklar: **B** of ile kullanılmaz / **C** sayılabilir figures ile kullanılmaz / **D** sayılamayan information ile kullanılmaz ve sayılabilir figures ile kullanılmaz / **E** sayılamayan information ile kullanılmaz ve of ile kullanılmaz.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$---- the fact that he works long hours, he has ---- little time for his family.$q$, array[$o$Despite / very$o$, $o$Owing to / a$o$, $o$Although / the$o$, $o$Owing to / very$o$, $o$Because / an$o$], 3, $e$1. **Owing to the fact that** sebep bildirir: **Owing to**.
2. **Very little** azlığı pekiştirir: **very**.

Diğer şıklar: **A** sebep-sonuç ilişkisi owing to ile kurulur / **B** a little olumlu anlam verir, sebep-sonuç bozulur / **C** sonrasında the fact that gelmez ve little ile the kullanılmaz / **E** sonrasında the fact that gelmez ve little ile an kullanılmaz.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$---- Alps are among the highest mountains in Europe, and Mont Blanc is the tallest ----.$q$, array[$o$A / peak$o$, $o$The / peaks$o$, $o$The / peak$o$, $o$An / a peak$o$, $o$Some / the peak$o$], 2, $e$1. Dağ silsilesi için **The Alps** kullanılır: **The**.
2. Üstünlük sonrası tekil isim gelir: **peak**.

Diğer şıklar: **A** dağ silsilesi için the gelir / **B** tekil superlatif sonrası tekil isim gelir / **D** dağ silsilesi için the gelir ve the tallest sonrası artikel gelmez / **E** belirli dağ silsilesi için the gelir ve the tallest sonrası artikel gelmez.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$---- of the two brothers is a doctor, but ---- of them has a car.$q$, array[$o$Both / neither$o$, $o$One / both$o$, $o$All / each$o$, $o$Each / all$o$, $o$One / neither$o$], 4, $e$1. **One of the two** iki kişiden birini anlatır: **One**.
2. Olumsuz anlam **neither of** ile verilir: **neither**.

Diğer şıklar: **A** iki kişiden biri one ile söylenir / **B** olumsuz anlam neither ister / **C** iki kişi için both/one gelir ve but ile olumsuz anlam gerekir / **D** iki kişiden biri one ile söylenir ve iki kişi için kullanılmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I need ---- advice, but I don't want ---- information about the price.$q$, array[$o$a / any$o$, $o$some / any$o$, $o$some / some$o$, $o$many / no$o$, $o$few / none$o$], 1, $e$1. Sayılamayan olumlu istek **some** ile verilir: **some**.
2. Olumsuz cümlede **any** kullanılır: **any**.

Diğer şıklar: **A** sayılamayan advice ile a kullanılmaz / **C** olumsuz cümlede any gelir / **D** sayılamayan advice ile kullanılmaz ve olumsuz fiille kullanılmaz / **E** sayılamayan advice ile kullanılmaz ve sonrasında isim gelmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$There was ---- noise outside, so we couldn't hear ---- word of what he said.$q$, array[$o$so many / a$o$, $o$so much / the$o$, $o$so few / some$o$, $o$so much / a$o$, $o$so little / many$o$], 3, $e$1. Sayılamayan isimle **so much** kullanılır: **so much**.
2. Tekil sayılabilir isim için **a** kullanılır: **a**.

Diğer şıklar: **A** sayılamayan noise ile so much gelir / **B** olumsuz cümlede a single/any anlamı a ile verilir / **C** anlam bozulur ve olumsuz cümlede kullanılmaz / **E** anlam bozulur ve tekil word ile kullanılmaz.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$---- information you gave me was very helpful, and ---- advice I received from him was even better.$q$, array[$o$The / the$o$, $o$An / the$o$, $o$The / an$o$, $o$A / a$o$, $o$Another / another$o$], 0, $e$1. Belirli sayılamayan isim için **the** kullanılır: **The**.
2. Aynı kurala göre: **the**.

Diğer şıklar: **B** sayılamayan isimle an kullanılmaz / **C** sayılamayan isimle an kullanılmaz / **D** sayılamayan isimle a kullanılmaz ve sayılamayan isimle a kullanılmaz / **E** sayılamayan isimle another kullanılmaz ve sayılamayan isimle another kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She spent ---- money on clothes, and she bought ---- shoes in a single day.$q$, array[$o$a lots of / ten pairs of$o$, $o$a lot of / ten pairs of$o$, $o$a lot of / ten pair of$o$, $o$many / a pairs$o$, $o$few / pair of ten$o$], 1, $e$1. Sayılamayan isimle **a lot of** kullanılır: **a lot of**.
2. Ölçü sözcüğü çoğul olur: **ten pairs of**.

Diğer şıklar: **A** biçim yanlış / **C** pairs çoğul kullanılır / **D** sayılamayan money ile kullanılmaz ve biçim yanlış / **E** olumlu cümlede a lot of gelir ve sıra yanlış.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$---- of the information in the report was out of date, and ---- of the figures were wrong.$q$, array[$o$Many / many$o$, $o$Much / much$o$, $o$Much / many$o$, $o$Few / little$o$, $o$Every / every$o$], 2, $e$1. Sayılamayan isimle **much of** kullanılır: **Much**.
2. Sayılabilir çoğulla **many of** kullanılır: **many**.

Diğer şıklar: **A** sayılamayan information ile much gelir / **B** sayılabilir figures ile many gelir / **D** anlam bozulur ve sayılabilir figures ile kullanılmaz / **E** of ile kullanılmaz ve of ile kullanılmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$He is ---- honest man and ---- university professor, so everybody respects him.$q$, array[$o$a / a$o$, $o$an / an$o$, $o$the / the$o$, $o$some / some$o$, $o$an / a$o$], 4, $e$1. Sessiz h'li honest için **an** gelir: **an**.
2. /j/ sesiyle başlayan university için **a** gelir: **a**.

Diğer şıklar: **A** honest sessiz h ile ünlüyle başlar, an gelir / **B** university /j/ sesiyle başlar, a gelir / **C** belirsiz tek kişi için an gelir ve belirsiz tek kişi için a gelir / **D** tekil sayılabilir isimle kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Determiners ve Quantifiers konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Determiners ve Quantifiers konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Determiners ve Quantifiers$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (14, 'ydt-dil', null::integer, $q$There is ---- little sugar in the jar. We'll have to buy ---- more.$q$, array[$o$a / some$o$, $o$very / some$o$, $o$very / any$o$, $o$quite / no$o$, $o$so / none$o$], 1, $e$1. **Very little** azlığı pekiştirir: **very**.
2. Olumlu cümlede **some** kullanılır: **some**.

Diğer şıklar: **A** very little kalıbı / **C** olumlu cümlede some gelir / **D** very little kalıbı ve olumlu cümlede some gelir / **E** very little kalıbı ve sonrasında isim gelmez.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$I know ---- people in this city, so I don't feel like ---- stranger.$q$, array[$o$little / a$o$, $o$few / the$o$, $o$few / a$o$, $o$a little / an$o$, $o$much / some$o$], 2, $e$1. Olumsuz anlamda sayılabilir çoğul **few** alır: **few**.
2. Belirsiz tekil isim için **a** kullanılır: **a**.

Diğer şıklar: **A** sayılabilir people ile few gelir / **B** belirsiz tek nesne için a gelir / **D** sayılabilir people ile few gelir ve consonant ile a gelir / **E** sayılabilir çoğul ile kullanılmaz ve tekil sayılabilir isimle kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$---- teachers, however experienced, make mistakes, and ---- mistakes are a normal part of learning.$q$, array[$o$Every / all$o$, $o$All / each$o$, $o$Each / every$o$, $o$Much / much$o$, $o$All / all$o$], 4, $e$1. Genel çoğul için **all** kullanılır: **All**.
2. Aynı kurala göre: **all**.

Diğer şıklar: **A** çoğul teachers ile kullanılmaz / **B** çoğul mistakes ile kullanılmaz / **C** çoğul teachers ile kullanılmaz ve çoğul mistakes ile kullanılmaz / **D** sayılabilir çoğul ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$Not ---- the guests enjoyed the party, and ---- of them left early.$q$, array[$o$all / several$o$, $o$every / several$o$, $o$all / much$o$, $o$each / every$o$, $o$much / little$o$], 0, $e$1. **Not all** kısmi olumsuzluk kurar: **all**.
2. **Several of** sonrasında çoğul isim gelir: **several**.

Diğer şıklar: **B** of ile kullanılmaz / **C** sayılabilir çoğul ile kullanılmaz / **D** not ile kısmi olumsuzluk all ister ve of ile kullanılmaz / **E** sayılabilir çoğul ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It was such a hot day that ---- people stayed indoors, and ---- shops were empty.$q$, array[$o$every / the$o$, $o$most / a$o$, $o$most / the$o$, $o$each / an$o$, $o$much / much$o$], 2, $e$1. Genel çoğul için **most** kullanılır: **most**.
2. Belirli çoğul için **the** kullanılır: **the**.

Diğer şıklar: **A** çoğul people ile kullanılmaz / **B** çoğul shops ile a kullanılmaz / **D** çoğul people ile kullanılmaz ve çoğul shops ile an kullanılmaz / **E** sayılabilir çoğul ile kullanılmaz ve sayılabilir çoğul ile kullanılmaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$There is ---- chance of success if we have ---- more time to prepare.$q$, array[$o$few / a little$o$, $o$little / a few$o$, $o$a few / few$o$, $o$little / a little$o$, $o$many / many$o$], 3, $e$1. Olumsuz anlamda sayılamayan isimle **little** kullanılır: **little**.
2. Olumlu anlamda sayılamayan isimle **a little** kullanılır: **a little**.

Diğer şıklar: **A** sayılamayan chance ile little gelir / **B** sayılamayan time ile a little gelir / **C** sayılamayan chance ile kullanılmaz ve sayılamayan time ile kullanılmaz / **E** sayılamayan chance ile kullanılmaz ve sayılamayan time ile kullanılmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The workers have been on strike for ---- week now, and ---- of them is willing to return to work.$q$, array[$o$the / none$o$, $o$a / any$o$, $o$an / no$o$, $o$one / neither$o$, $o$a / none$o$], 4, $e$1. Belirsiz süre **a week** ile verilir: **a**.
2. Olumsuz anlam **none of** ile verilir: **none**.

Diğer şıklar: **A** belirsiz süre için a gelir / **B** olumsuz anlam none ister / **C** consonant ile a gelir ve of ile kullanılmaz / **D** belirsiz süre kalıbı bozulur ve ikiden çok işçi için kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Prepositions konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Prepositions konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (10, 'ydt-dil', null::integer, $q$She was accused ---- stealing, and she was sentenced ---- two years in prison.$q$, array[$o$for / to$o$, $o$of / to$o$, $o$of / with$o$, $o$with / at$o$, $o$about / on$o$], 1, $e$1. **Accuse of** kalıbı kullanılır: **of**.
2. **Sentence to** kalıbı kullanılır: **to**.

Diğer şıklar: **A** accuse of kalıbı / **C** sentence to kalıbı / **D** accuse of kalıbı ve sentence to kalıbı / **E** accuse of kalıbı ve sentence to kalıbı.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$He arrived ---- the airport ---- the morning and left again in the evening.$q$, array[$o$in / in$o$, $o$at / on$o$, $o$to / at$o$, $o$at / in$o$, $o$on / by$o$], 3, $e$1. **Arrive at** küçük yer için kullanılır: **at**.
2. **In the morning** kalıbı kullanılır: **in**.

Diğer şıklar: **A** havalimanına varmak at ister / **B** sabah için in the morning kalıbı / **C** arrive to kullanılmaz ve sabah için in the morning kalıbı / **E** arrive on kullanılmaz ve sabah için in the morning kalıbı.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He was blamed ---- the accident, although he had not been present ---- the time.$q$, array[$o$of / at$o$, $o$for / in$o$, $o$for / at$o$, $o$on / by$o$, $o$with / on$o$], 2, $e$1. **Blame for** kalıbı kullanılır: **for**.
2. **At the time** kalıbı kullanılır: **at**.

Diğer şıklar: **A** blame for kalıbı / **B** at the time kalıbı / **D** blame for kalıbı ve at the time kalıbı / **E** blame for kalıbı ve at the time kalıbı.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$The new rules will come ---- effect on January 1st, and they apply ---- all employees.$q$, array[$o$in / to$o$, $o$into / for$o$, $o$on / with$o$, $o$at / on$o$, $o$into / to$o$], 4, $e$1. **Come into effect** kalıbı kullanılır: **into**.
2. Genel kural için **apply to** kullanılır: **to**.

Diğer şıklar: **A** come into effect kalıbı / **B** apply to kalıbı / **C** come into effect kalıbı ve apply to kalıbı / **D** come into effect kalıbı ve apply to kalıbı.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$The decision was made ---- purpose, not ---- mistake, as the report clearly shows.$q$, array[$o$by / by$o$, $o$on / on$o$, $o$in / in$o$, $o$on / by$o$, $o$at / with$o$], 3, $e$1. **On purpose** kasıtlı anlamını verir: **on**.
2. **By mistake** yanlışlıkla anlamını verir: **by**.

Diğer şıklar: **A** on purpose kalıbı / **B** by mistake kalıbı / **C** on purpose kalıbı ve by mistake kalıbı / **E** on purpose kalıbı ve by mistake kalıbı.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$---- the end of the film, the hero dies, but ---- the end, his name is cleared.$q$, array[$o$In / in$o$, $o$At / at$o$, $o$At / in$o$, $o$On / on$o$, $o$By / by$o$], 2, $e$1. **At the end of** bir şeyin sonunu belirtir: **At**.
2. **In the end** sonunda anlamını verir: **in**.

Diğer şıklar: **A** filmin sonunda at the end kalıbı / **B** sonunda anlamı in the end ister / **D** at the end kalıbı ve in the end kalıbı / **E** at the end kalıbı ve in the end kalıbı.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The shop is open ---- Monday to Friday, and it stays open ---- midnight on Saturdays.$q$, array[$o$since / until$o$, $o$from / by$o$, $o$at / at$o$, $o$by / in$o$, $o$from / until$o$], 4, $e$1. **From...to** kalıbı kullanılır: **from**.
2. Devam eden süre **until** ile verilir: **until**.

Diğer şıklar: **A** geçmişten şimdiye uzanır / **B** until süre devam eder, by son zamanı bildirir / **C** from ... to kalıbı ve anlam bozulur / **D** from ... to kalıbı ve anlam bozulur.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$He is married ---- a doctor, and he is very proud ---- his wife.$q$, array[$o$to / of$o$, $o$with / of$o$, $o$to / for$o$, $o$by / about$o$, $o$of / with$o$], 0, $e$1. **Married to** kalıbı kullanılır: **to**.
2. **Proud of** kalıbı kullanılır: **of**.

Diğer şıklar: **B** married to kalıbı / **C** proud of kalıbı / **D** married to kalıbı ve proud of kalıbı / **E** married to kalıbı ve proud of kalıbı.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The report must be finished ---- Friday, so we can't wait ---- the results.$q$, array[$o$until / for$o$, $o$by / for$o$, $o$by / of$o$, $o$at / to$o$, $o$in / on$o$], 1, $e$1. Son zaman **by** ile verilir: **by**.
2. **Wait for** kalıbı kullanılır: **for**.

Diğer şıklar: **A** son zaman by ile verilir / **C** wait for kalıbı / **D** son zaman by ile verilir ve wait for kalıbı / **E** son zaman by ile verilir ve wait for kalıbı.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$She is interested ---- art, and she often goes ---- exhibitions at the weekend.$q$, array[$o$at / to$o$, $o$in / at$o$, $o$on / in$o$, $o$in / to$o$, $o$for / for$o$], 3, $e$1. **Interested in** kalıbı kullanılır: **in**.
2. **Go to** kalıbı kullanılır: **to**.

Diğer şıklar: **A** interested in kalıbı / **B** go to kalıbı / **C** interested in kalıbı ve go to kalıbı / **E** interested in kalıbı ve go to kalıbı.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$He congratulated her ---- her success, and she thanked him ---- his kind words.$q$, array[$o$on / for$o$, $o$for / for$o$, $o$on / of$o$, $o$at / on$o$, $o$about / at$o$], 0, $e$1. **Congratulate on** kalıbı kullanılır: **on**.
2. **Thank for** kalıbı kullanılır: **for**.

Diğer şıklar: **B** congratulate on kalıbı / **C** thank for kalıbı / **D** congratulate on kalıbı ve thank for kalıbı / **E** congratulate on kalıbı ve thank for kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Prepositions konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Prepositions konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (5, 'ydt-dil', null::integer, $q$He walked ---- the room and sat ---- the sofa.$q$, array[$o$in / on$o$, $o$into / at$o$, $o$on / by$o$, $o$into / on$o$, $o$from / with$o$], 3, $e$1. Hareket için **into** kullanılır: **into**.
2. Yüzey üstü için **on** kullanılır: **on**.

Diğer şıklar: **A** hareket için into gelir / **B** sofa üstünde oturmak on ister / **C** hareket için into gelir ve sofa üstünde oturmak on ister / **E** hareket için into gelir ve sofa üstünde oturmak on ister.$e$, 1),
  (6, 'ydt-dil', null::integer, $q$She is jealous ---- her sister, but she is proud ---- her own talent.$q$, array[$o$for / of$o$, $o$of / of$o$, $o$of / for$o$, $o$with / with$o$, $o$at / at$o$], 1, $e$1. **Jealous of** kalıbı kullanılır: **of**.
2. **Proud of** kalıbı kullanılır: **of**.

Diğer şıklar: **A** jealous of kalıbı / **C** proud of kalıbı / **D** jealous of kalıbı ve proud of kalıbı / **E** jealous of kalıbı ve proud of kalıbı.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ball flew ---- the fence and landed ---- the neighbour's garden.$q$, array[$o$over / in$o$, $o$at / in$o$, $o$over / at$o$, $o$by / by$o$, $o$with / to$o$], 0, $e$1. Üstünden aşmak **over** ile verilir: **over**.
2. Bahçenin içi **in** ile verilir: **in**.

Diğer şıklar: **B** çit üstünden aşmak over ister / **C** bahçenin içine düşmek in ister / **D** çit üstünden aşmak over ister ve bahçenin içine düşmek in ister / **E** çit üstünden aşmak over ister ve bahçenin içine düşmek in ister.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$I'm tired ---- waiting, and I'm fed up ---- his excuses.$q$, array[$o$from / with$o$, $o$of / of$o$, $o$at / from$o$, $o$for / at$o$, $o$of / with$o$], 4, $e$1. **Tired of** kalıbı kullanılır: **of**.
2. **Fed up with** kalıbı kullanılır: **with**.

Diğer şıklar: **A** tired of kalıbı / **B** fed up with kalıbı / **C** tired of kalıbı ve fed up with kalıbı / **D** tired of kalıbı ve fed up with kalıbı.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$The result depends ---- many factors, and it differs ---- last year's.$q$, array[$o$of / from$o$, $o$on / to$o$, $o$on / from$o$, $o$in / with$o$, $o$from / of$o$], 2, $e$1. **Depend on** kalıbı kullanılır: **on**.
2. **Differ from** kalıbı kullanılır: **from**.

Diğer şıklar: **A** depend on kalıbı / **B** differ from kalıbı / **D** depend on kalıbı ve differ from kalıbı / **E** depend on kalıbı ve differ from kalıbı.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He insisted ---- paying the bill, and I agreed ---- him.$q$, array[$o$in / with$o$, $o$on / with$o$, $o$on / to$o$, $o$at / on$o$, $o$to / at$o$], 1, $e$1. **Insist on** kalıbı kullanılır: **on**.
2. **Agree with** kişi için kullanılır: **with**.

Diğer şıklar: **A** insist on kalıbı / **C** agree with someone kalıbı / **D** insist on kalıbı ve agree with someone kalıbı / **E** insist on kalıbı ve agree with someone kalıbı.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The prize was divided ---- the three winners, and each received a certificate ---- the director.$q$, array[$o$into / from$o$, $o$among / by$o$, $o$for / with$o$, $o$among / from$o$, $o$at / of$o$], 3, $e$1. Üç kişi arasında bölüşüm **among** ile verilir: **among**.
2. **Receive from** kalıbı kullanılır: **from**.

Diğer şıklar: **A** bölüşüm among ile verilir / **B** receive from kalıbı / **C** bölüşüm among ile verilir ve receive from kalıbı / **E** bölüşüm among ile verilir ve receive from kalıbı.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He has been working ---- this company ---- ten years.$q$, array[$o$to / for$o$, $o$at / since$o$, $o$at / for$o$, $o$on / during$o$, $o$by / from$o$], 2, $e$1. Çalışılan şirket için **at** kullanılır: **at**.
2. Süre **for** ile verilir: **for**.

Diğer şıklar: **A** çalışılan şirket için at gelir / **B** süre for ile verilir / **D** çalışılan şirket için at gelir ve süre for ile verilir / **E** çalışılan şirket için at gelir ve süre for ile verilir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$She is famous ---- her paintings, and she is known ---- an artist all over the world.$q$, array[$o$of / as$o$, $o$for / to$o$, $o$in / for$o$, $o$with / like$o$, $o$for / as$o$], 4, $e$1. **Famous for** kalıbı kullanılır: **for**.
2. **Known as** rol bildirir: **as**.

Diğer şıklar: **A** famous for kalıbı / **B** known as kalıbı rol bildirir / **C** famous for kalıbı ve known for özellik bildirir, rol için as / **D** famous for kalıbı ve known as kalıbı.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$We discussed the plan ---- length and finally agreed ---- a date.$q$, array[$o$at / on$o$, $o$in / on$o$, $o$at / to$o$, $o$on / for$o$, $o$by / with$o$], 0, $e$1. **At length** uzun uzun anlamını verir: **at**.
2. **Agree on** konu için kullanılır: **on**.

Diğer şıklar: **B** at length kalıbı / **C** agree on a date kalıbı / **D** at length kalıbı ve agree on a date kalıbı / **E** at length kalıbı ve agree on a date kalıbı.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The temperature fell ---- zero ---- the night, and the lake froze.$q$, array[$o$at / during$o$, $o$to / while$o$, $o$by / for$o$, $o$to / during$o$, $o$under / since$o$], 3, $e$1. **Fall to** ulaşılan değeri belirtir: **to**.
2. **During** isim ile süreyi belirtir: **during**.

Diğer şıklar: **A** fall to kalıbı / **B** during isim ister / **C** fall to kalıbı ve durum süresi for ile verilir / **E** fall to kalıbı ve anlam bozulur.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$He was dismissed ---- the company ---- spite of his long service.$q$, array[$o$of / in$o$, $o$from / in$o$, $o$from / on$o$, $o$out of / at$o$, $o$off / by$o$], 1, $e$1. **Dismiss from** kalıbı kullanılır: **from**.
2. **In spite of** kalıbı kullanılır: **in**.

Diğer şıklar: **A** dismiss from kalıbı / **C** in spite of kalıbı / **D** dismiss from kalıbı ve in spite of kalıbı / **E** dismiss from kalıbı ve in spite of kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$He is committed ---- improving the service and responsible ---- training the staff.$q$, array[$o$to / for$o$, $o$for / for$o$, $o$to / of$o$, $o$in / to$o$, $o$with / in$o$], 0, $e$1. **Committed to** kalıbı kullanılır: **to**.
2. **Responsible for** kalıbı kullanılır: **for**.

Diğer şıklar: **B** committed to kalıbı / **C** responsible for kalıbı / **D** committed to kalıbı ve responsible for kalıbı / **E** committed to kalıbı ve responsible for kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The film is based ---- a true story and was directed ---- a young Turkish director.$q$, array[$o$in / by$o$, $o$on / from$o$, $o$at / with$o$, $o$on / by$o$, $o$from / of$o$], 3, $e$1. **Based on** kalıbı kullanılır: **on**.
2. Edilgen yapıda yapan kişi **by** ile verilir: **by**.

Diğer şıklar: **A** based on kalıbı / **B** edilgen yapıda by gelir / **C** based on kalıbı ve edilgen yapıda by gelir / **E** based on kalıbı ve edilgen yapıda by gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$They objected ---- the plan ---- the grounds that it was too expensive.$q$, array[$o$at / on$o$, $o$to / on$o$, $o$to / in$o$, $o$with / at$o$, $o$against / by$o$], 1, $e$1. **Object to** kalıbı kullanılır: **to**.
2. **On the grounds that** kalıbı kullanılır: **on**.

Diğer şıklar: **A** object to kalıbı / **C** on the grounds that kalıbı / **D** object to kalıbı ve on the grounds that kalıbı / **E** object to kalıbı ve on the grounds that kalıbı.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She was prevented ---- leaving the country ---- the police.$q$, array[$o$of / by$o$, $o$from / with$o$, $o$from / by$o$, $o$to / from$o$, $o$against / of$o$], 2, $e$1. **Prevent from** kalıbı kullanılır: **from**.
2. Edilgen yapıda yapan kişi **by** ile verilir: **by**.

Diğer şıklar: **A** prevent from kalıbı / **B** edilgen yapıda by gelir / **D** prevent from kalıbı ve edilgen yapıda by gelir / **E** prevent from kalıbı ve edilgen yapıda by gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Prepositions konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Prepositions konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Prepositions$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (8, 'ydt-dil', null::integer, $q$The children were excited ---- the trip, but their parents were worried ---- the weather.$q$, array[$o$at / about$o$, $o$about / about$o$, $o$about / for$o$, $o$in / of$o$, $o$for / with$o$], 1, $e$1. **Excited about** kalıbı kullanılır: **about**.
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
  (16, 'ydt-dil', null::integer, $q$The manager was criticised ---- his failure to act, and he was held responsible ---- the losses.$q$, array[$o$of / for$o$, $o$for / of$o$, $o$about / to$o$, $o$on / with$o$, $o$for / for$o$], 4, $e$1. **Criticise for** kalıbı kullanılır: **for**.
2. **Responsible for** kalıbı kullanılır: **for**.

Diğer şıklar: **A** criticise for kalıbı / **B** responsible for kalıbı / **C** criticise for kalıbı ve responsible for kalıbı / **D** criticise for kalıbı ve responsible for kalıbı.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The success of the project is attributed ---- good teamwork, and the failure was due ---- poor planning.$q$, array[$o$for / to$o$, $o$to / for$o$, $o$to / to$o$, $o$on / on$o$, $o$with / with$o$], 2, $e$1. **Attribute to** kalıbı kullanılır: **to**.
2. **Due to** kalıbı kullanılır: **to**.

Diğer şıklar: **A** attribute to kalıbı / **B** due to kalıbı / **D** attribute to kalıbı ve due to kalıbı / **E** attribute to kalıbı ve due to kalıbı.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He took advantage ---- the situation and made a fortune ---- selling old furniture.$q$, array[$o$from / by$o$, $o$of / at$o$, $o$in / in$o$, $o$of / by$o$, $o$on / with$o$], 3, $e$1. **Take advantage of** kalıbı kullanılır: **of**.
2. Yöntem **by + gerund** ile verilir: **by**.

Diğer şıklar: **A** take advantage of kalıbı / **B** by + gerund yolu belirtir / **C** take advantage of kalıbı ve by + gerund yolu belirtir / **E** take advantage of kalıbı ve by + gerund yolu belirtir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$She prides herself ---- her honesty, and she is known ---- being very direct.$q$, array[$o$in / for$o$, $o$on / as$o$, $o$of / of$o$, $o$at / to$o$, $o$on / for$o$], 4, $e$1. **Pride oneself on** kalıbı kullanılır: **on**.
2. **Known for** özellik bildirir: **for**.

Diğer şıklar: **A** pride oneself on kalıbı / **B** known for + gerund özellik bildirir / **C** pride oneself on kalıbı ve known for + gerund özellik bildirir / **D** pride oneself on kalıbı ve known for + gerund özellik bildirir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The two countries are on the verge ---- war, ---- spite of repeated attempts at peace.$q$, array[$o$of / in$o$, $o$to / in$o$, $o$of / despite$o$, $o$at / on$o$, $o$for / at$o$], 0, $e$1. **On the verge of** kalıbı kullanılır: **of**.
2. **In spite of** kalıbı kullanılır: **in**.

Diğer şıklar: **B** on the verge of kalıbı / **C** despite of kullanılmaz / **D** on the verge of kalıbı ve in spite of kalıbı / **E** on the verge of kalıbı ve in spite of kalıbı.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Wish Clauses konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Wish Clauses konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$I wish he ---- us last summer, and I wish he ---- us again soon.$q$, array[$o$visited / would visit$o$, $o$had visited / visits$o$, $o$visits / visited$o$, $o$had visited / would visit$o$, $o$would visit / had visited$o$], 3, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had visited**.
2. Gelecek dilek **wish + would** ile verilir: **would visit**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** gelecek dilek would ister / **C** geçmiş pişmanlık Past Perfect ister ve gelecek dilek would ister / **E** geçmiş pişmanlık için would olmaz ve gelecek dilek would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$It is time the government ---- action, and it is about time it ---- the problem seriously.$q$, array[$o$takes / took$o$, $o$took / took$o$, $o$took / takes$o$, $o$will take / will take$o$, $o$had taken / had taken$o$], 1, $e$1. **It is time** sonrasında Past Simple gelir: **took**.
2. Aynı kurala göre: **took**.

Diğer şıklar: **A** it is time sonrasında Past Simple gelir / **C** it is about time sonrasında Past Simple gelir / **D** it is time sonrasında will olmaz ve it is about time sonrasında will olmaz / **E** it is time sonrasında Past Simple gelir ve it is about time sonrasında Past Simple gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He acts as if he ---- the whole company, though he ---- only a junior clerk.$q$, array[$o$owns / is$o$, $o$owned / were$o$, $o$will own / had been$o$, $o$would own / would be$o$, $o$owned / is$o$], 4, $e$1. **As if** gerçek dışı durumda Past Simple ister: **owned**.
2. Gerçek durum Present Simple ile söylenir: **is**.

Diğer şıklar: **A** gerçek dışı karşılaştırma Past Simple ister / **B** gerçek durum Present Simple ister / **C** gerçek dışı karşılaştırma Past Simple ister ve gerçek durum Present Simple ister / **D** as if sonrasında would olmaz ve gerçek durum Present Simple ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$I'd rather you ---- anyone about this, and I'd rather you ---- it a secret until tomorrow.$q$, array[$o$don't tell / kept$o$, $o$didn't tell / will keep$o$, $o$won't tell / would keep$o$, $o$didn't tell / kept$o$, $o$hadn't told / have kept$o$], 3, $e$1. **Would rather + özne** şimdiki tercih için Past Simple ister: **didn't tell**.
2. Aynı kurala göre: **kept**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **B** would rather you sonrasında will olmaz / **C** would rather you sonrasında Past Simple gelir ve would rather you sonrasında would olmaz / **E** şimdiki tercih için Past Simple gelir ve şimdiki tercih için Past Simple gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$If only I ---- earlier, I ---- the train and wouldn't be late now.$q$, array[$o$left / would have caught$o$, $o$had left / would have caught$o$, $o$had left / would catch$o$, $o$leave / caught$o$, $o$would leave / had caught$o$], 1, $e$1. **If only** geçmiş pişmanlık için Past Perfect ister: **had left**.
2. Sonuç **would have + V3** ile verilir: **would have caught**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **C** geçmiş sonuç would have + V3 ister / **D** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi would ister / **E** if only sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Wish Clauses konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Wish Clauses konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$Supposing you ---- a million pounds, what ---- you do with it?$q$, array[$o$win / would$o$, $o$won / would$o$, $o$won / will$o$, $o$will win / did$o$, $o$had won / shall$o$], 1, $e$1. **Supposing** gerçek dışı durumda Past Simple ister: **won**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** Supposing gerçek dışı Past Simple ister / **C** gerçek dışı sonuç would ister / **D** Supposing sonrasında will olmaz ve sonuç cümlesinde would gerekir / **E** şimdiki gerçek dışılık Past Simple ister ve gerçek dışı sonuç would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I wish I ---- more careful when I ---- the contract, but I was in a hurry.$q$, array[$o$was / signed$o$, $o$had been / sign$o$, $o$had been / signed$o$, $o$were / had signed$o$, $o$would be / have signed$o$], 2, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had been**.
2. Geçmiş olay Past Simple ile söylenir: **signed**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** geçmiş anlatım Past Simple ister / **D** geçmiş pişmanlık Past Perfect ister ve when ile ana olay Past Simple verilir / **E** geçmiş pişmanlık için would olmaz ve geçmiş anlatım Past Simple ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She wishes she ---- come to the party, because she ---- the whole evening if she were free.$q$, array[$o$could / would enjoy$o$, $o$can / would enjoy$o$, $o$could / will enjoy$o$, $o$will / enjoyed$o$, $o$would / enjoys$o$], 0, $e$1. Olanak dileği **wish + could** ile verilir: **could**.
2. Gerçek dışı sonuç **would + V1** ile verilir: **would enjoy**.

Diğer şıklar: **B** wish sonrasında could gelir / **C** gerçek dışı sonuç would ister / **D** wish sonrasında could gelir ve sonuç cümlesi would ister / **E** yetenek için could gelir ve sonuç cümlesi would ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He behaves as though he ---- above the law, but he knows that he ---- punished if he is caught.$q$, array[$o$is / will be$o$, $o$were / would be$o$, $o$will be / was$o$, $o$were / will be$o$, $o$had been / has been$o$], 3, $e$1. **As though** gerçek dışı durumda Past Simple ister: **were**.
2. Gerçekçi koşulun sonucu **will + V1** ile verilir: **will be**.

Diğer şıklar: **A** gerçek dışı karşılaştırma Past Simple ister / **B** if he is caught gerçekçi koşul will ister / **C** gerçek dışı karşılaştırma Past Simple ister ve anlam bozulur / **E** geçmiş durum için kullanılır ve anlam bozulur.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Had I known about the delay, I ---- earlier, and I wish somebody ---- me.$q$, array[$o$will leave / had told$o$, $o$would have left / had told$o$, $o$would have left / told$o$, $o$would leave / would tell$o$, $o$left / tells$o$], 1, $e$1. **Had I known** geçmiş koşulu kurar: **would have left**.
2. **Wish** geçmiş pişmanlık için Past Perfect ister: **had told**.

Diğer şıklar: **A** Had I known sonrası would have gelir / **C** geçmiş pişmanlık Past Perfect ister / **D** Had I known sonrası would have gelir ve geçmiş pişmanlık için would olmaz / **E** sonuç cümlesi would have ister ve geçmiş pişmanlık Past Perfect ister.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Wish Clauses konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Wish Clauses konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Wish Clauses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (8, 'ydt-dil', null::integer, $q$I'd rather you ---- me the truth than ---- to me.$q$, array[$o$tell / lied$o$, $o$told / lie$o$, $o$told / lied$o$, $o$will tell / lying$o$, $o$had told / had lied$o$], 2, $e$1. **Would rather + özne** Past Simple ister: **told**.
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
  (12, 'ydt-dil', null::integer, $q$Were it not for the traffic, I ---- there on time. I wish I ---- the other road.$q$, array[$o$will be / had taken$o$, $o$would be / had taken$o$, $o$would be / took$o$, $o$am / take$o$, $o$was / would take$o$], 1, $e$1. **Were it not for** gerçek dışı koşuldur: **would be**.
2. **Wish** geçmiş pişmanlık için Past Perfect ister: **had taken**.

Diğer şıklar: **A** gerçek dışı sonuç would ister / **C** geçmiş pişmanlık Past Perfect ister / **D** sonuç cümlesi would ister ve geçmiş pişmanlık Past Perfect ister / **E** sonuç cümlesi would ister ve geçmiş pişmanlık için would olmaz.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$He talks as if he ---- everything about politics, though he hardly ever ---- the news.$q$, array[$o$knows / reads$o$, $o$knew / read$o$, $o$knew / reads$o$, $o$had known / will read$o$, $o$would know / has read$o$], 2, $e$1. **As if** gerçek dışı durumda Past Simple ister: **knew**.
2. Genel durum Present Simple ile söylenir: **reads**.

Diğer şıklar: **A** gerçek dışı karşılaştırma Past Simple ister / **B** hardly ever genel durum Present Simple ister / **D** geçmiş durum için kullanılır ve genel durum Present Simple ister / **E** as if sonrasında would olmaz ve genel durum Present Simple ister.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$It is high time the authorities ---- the problem seriously, instead of acting as if it ---- exist.$q$, array[$o$take / didn't$o$, $o$took / wouldn't$o$, $o$will take / won't$o$, $o$took / didn't$o$, $o$had taken / hasn't$o$], 3, $e$1. **It is high time** sonrasında Past Simple gelir: **took**.
2. **As if** gerçek dışı durumda Past Simple ister: **didn't**.

Diğer şıklar: **A** high time sonrasında Past Simple gelir / **B** as if sonrasında gerçek dışı Past Simple ister / **C** high time sonrasında will olmaz ve as if sonrasında Past Simple ister / **E** high time sonrasında Past Simple gelir ve as if sonrasında Past Simple ister.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$I wish she ---- me about the problem earlier. I ---- it much more easily.$q$, array[$o$told / could have solved$o$, $o$had told / could solve$o$, $o$tells / solved$o$, $o$would tell / had solved$o$, $o$had told / could have solved$o$], 4, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had told**.
2. Geçmiş sonuç **could have + V3** ile verilir: **could have solved**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** geçmiş sonuç could have + V3 ister / **C** geçmiş pişmanlık Past Perfect ister ve sonuç cümlesi could ister / **D** geçmiş pişmanlık için would olmaz ve sonuç cümlesi could ister.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Suppose he ---- the truth tomorrow. How ---- you react?$q$, array[$o$would tell / would$o$, $o$told / would$o$, $o$told / will$o$, $o$had told / did$o$, $o$will tell / shall$o$], 1, $e$1. **Suppose** gerçek dışı durumda Past Simple ister: **told**.
2. Sonuç **would + V1** ile verilir: **would**.

Diğer şıklar: **A** Suppose sonrasında would olmaz / **C** gerçek dışı sonuç would ister / **D** şimdiki gerçek dışılık Past Simple ister ve sonuç cümlesinde would gerekir / **E** Suppose sonrasında will olmaz ve gerçek dışı sonuç would ister.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I wish I ---- the answer to that question. I ---- a good mark if I knew it.$q$, array[$o$know / would get$o$, $o$knew / will get$o$, $o$had known / got$o$, $o$knew / would get$o$, $o$would know / have got$o$], 3, $e$1. **Wish** şimdiki dilek için Past Simple ister: **knew**.
2. Gerçek dışı sonuç **would + V1** ile verilir: **would get**.

Diğer şıklar: **A** wish sonrasında Past Simple gelir / **B** gerçek dışı sonuç would ister / **C** şimdiki dilek Past Simple ister ve sonuç cümlesi would ister / **E** wish sonrasında would olmaz ve sonuç cümlesi would ister.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$If only the weather ---- better, we ---- the picnic outdoors.$q$, array[$o$were / could have$o$, $o$is / could have$o$, $o$were / can have$o$, $o$will be / will have$o$, $o$had been / must have$o$], 0, $e$1. **If only** şimdiki dilek için Past Simple ister: **were**.
2. Gerçek dışı olanak **could** ile söylenir: **could have**.

Diğer şıklar: **B** if only şimdiki dilek Past Simple ister / **C** gerçek dışı olanak could ister / **D** if only sonrasında will olmaz ve gerçek dışı olanak could ister / **E** geçmiş dilek için kullanılır ve gerçek dışı olanak could ister.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$It's time you ---- about your future, and I'd rather you ---- it seriously.$q$, array[$o$think / took$o$, $o$thought / take$o$, $o$thought / took$o$, $o$will think / will take$o$, $o$had thought / had taken$o$], 2, $e$1. **It's time** sonrasında Past Simple gelir: **thought**.
2. **Would rather + özne** Past Simple ister: **took**.

Diğer şıklar: **A** it's time sonrasında Past Simple gelir / **B** would rather you sonrasında Past Simple gelir / **D** it's time sonrasında will olmaz ve would rather you sonrasında will olmaz / **E** it's time sonrasında Past Simple gelir ve şimdiki tercih için Past Simple gelir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$I wish I ---- more patient as a child. I ---- many mistakes since then.$q$, array[$o$was / have made$o$, $o$had been / made$o$, $o$were / had made$o$, $o$would be / make$o$, $o$had been / have made$o$], 4, $e$1. **Wish** geçmiş pişmanlık için Past Perfect ister: **had been**.
2. **Since then** Present Perfect ister: **have made**.

Diğer şıklar: **A** geçmiş pişmanlık Past Perfect ister / **B** since then Present Perfect ister / **C** geçmiş pişmanlık Past Perfect ister ve since then Present Perfect ister / **D** geçmiş pişmanlık için would olmaz ve since then Present Perfect ister.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

