-- 20261026144000_questions_ydt_gramer_4. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Gerunds ve Infinitives konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (8, 'ydt-dil', null::integer, $q$The company has decided to stop ---- paper cups, and the workers stopped ---- to the road signs to check the map.$q$, array[$o$to use / to look$o$, $o$using / looking$o$, $o$use / look$o$, $o$using / to look$o$, $o$used / to looking$o$], 3, $e$1. Eylemi bırakmak **stop + gerund** ile söylenir: **using**.
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
  (15, 'ydt-dil', null::integer, $q$The suspect denied ---- the building at night, but the camera footage proved him ---- there at 2 a.m.$q$, array[$o$to enter / to have been$o$, $o$entering / to have been$o$, $o$entering / being$o$, $o$enter / have been$o$, $o$to have entered / been$o$], 1, $e$1. **Deny** sonrasında gerund gelir: **entering**.
2. Geçmişteki durum **to have been** ile söylenir: **to have been**.

Diğer şıklar: **A** deny sonrasında gerund gelir / **C** prove + nesne sonrasında to-infinitive gelir / **D** deny sonrasında gerund gelir ve prove + nesne sonrasında to gerekir / **E** deny sonrasında gerund gelir ve prove + nesne sonrasında to-infinitive gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$He seems ---- a lot of weight recently, and he admitted ---- very little since the diet began.$q$, array[$o$losing / eating$o$, $o$to have lost / to eat$o$, $o$to lose / eat$o$, $o$have lost / eaten$o$, $o$to have lost / eating$o$], 4, $e$1. **Seem** ile geçmişle ilgili durum perfect infinitive ile söylenir: **to have lost**.
2. **Admit** sonrasında gerund gelir: **eating**.

Diğer şıklar: **A** seem sonrasında to-infinitive gelir / **B** admit sonrasında gerund gelir / **C** geçmişle ilgili durum perfect infinitive ister ve admit sonrasında gerund gelir / **D** seem sonrasında to gerekir ve admit sonrasında gerund gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$I would rather ---- at home tonight than ---- to the party, because I have an exam tomorrow.$q$, array[$o$to stay / go$o$, $o$stay / to go$o$, $o$stay / go$o$, $o$staying / going$o$, $o$stayed / went$o$], 2, $e$1. **Would rather** sonrasında yalın fiil gelir: **stay**.
2. **Would rather...than** kalıbında ikinci fiil de yalın gelir: **go**.

Diğer şıklar: **A** would rather sonrasında yalın fiil gelir / **B** than sonrasında yalın fiil gelir / **D** would rather sonrasında yalın fiil gelir ve would rather than kalıbında yalın fiil gelir / **E** would rather sonrasında yalın fiil gelir ve than sonrasında yalın fiil gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The children were afraid of ---- by the strange noise, and they insisted on ---- the lights on all night.$q$, array[$o$to frighten / leaving$o$, $o$being frightened / leaving$o$, $o$being frightened / to leave$o$, $o$frightening / leave$o$, $o$having frightened / left$o$], 1, $e$1. **Afraid of** sonrasında gerund gelir ve anlam edilgendir: **being frightened**.
2. **Insist on** sonrasında gerund gelir: **leaving**.

Diğer şıklar: **A** afraid of sonrasında gerund gelir / **C** insist on sonrasında gerund gelir / **D** edilgen anlam gerekir ve insist on sonrasında gerund gelir / **E** edilgen anlam gerekir ve insist on sonrasında gerund gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The report is said ---- by an independent group, but its authors refused ---- any further details about it.$q$, array[$o$to have been written / to give$o$, $o$to write / to give$o$, $o$to have been written / giving$o$, $o$writing / give$o$, $o$written / given$o$], 0, $e$1. **Is said** sonrasında geçmişteki edilgen eylem **to have been written** ile söylenir.
2. **Refuse** sonrasında to-infinitive gelir: **to give**.

Diğer şıklar: **B** said ile geçmişteki edilgen eylem gerekir / **C** refuse sonrasında to-infinitive gelir / **D** said sonrasında to-infinitive gelir ve refuse sonrasında to gerekir / **E** said sonrasında to-infinitive gelir ve refuse sonrasında to-infinitive gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The machine needs ---- before it can be used again, and the engineer clearly remembered ---- the technician about the fault last week.$q$, array[$o$to repair / telling$o$, $o$repairing / to tell$o$, $o$repair / tell$o$, $o$repairing / telling$o$, $o$repaired / told$o$], 3, $e$1. **Need + gerund** edilgen anlam taşır: **repairing**.
2. Geçmişte yapılan eylemi hatırlama **remember + gerund** ile söylenir: **telling**.

Diğer şıklar: **A** need + gerund edilgen anlam taşır / **B** geçen hafta yapılmış eylem gerund ister / **C** need sonrasında gerund edilgen anlam verir ve remember sonrasında gerund gelir / **E** need sonrasında gerund gelir ve remember sonrasında gerund gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Gerunds ve Infinitives konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (15, 'ydt-dil', null::integer, $q$Not wanting ---- late for the interview, she left home early, but regretted ---- her umbrella, because it started raining heavily.$q$, array[$o$being / not taking$o$, $o$to be / not taking$o$, $o$to be / not to take$o$, $o$be / to not take$o$, $o$to being / not take$o$], 1, $e$1. **Want** sonrasında to-infinitive gelir: **to be**.
2. **Regret** sonrasında gerund gelir: **not taking**.

Diğer şıklar: **A** want sonrasında to-infinitive gelir / **C** regret sonrasında gerund gelir / **D** want sonrasında to gerekir ve regret sonrasında gerund gelir / **E** want sonrasında to + V1 gelir ve regret sonrasında gerund gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Having ---- the exam twice, he was determined ---- it this time, whatever the cost.$q$, array[$o$to fail / to pass$o$, $o$failed / passing$o$, $o$failed / to pass$o$, $o$failing / pass$o$, $o$fail / passed$o$], 2, $e$1. **Having** sonrasında V3 gelir: **failed**.
2. **Be determined** sonrasında to-infinitive gelir: **to pass**.

Diğer şıklar: **A** perfect participle yapısı having + V3 ister / **B** determined sonrasında to-infinitive gelir / **D** having sonrası V3 gelir ve determined sonrasında to gerekir / **E** having sonrası V3 gelir ve determined sonrasında to-infinitive gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The mayor is reported ---- the proposal at last night's meeting, and the council is likely ---- it next week.$q$, array[$o$to have rejected / to discuss$o$, $o$to reject / to discuss$o$, $o$to have rejected / discussing$o$, $o$rejecting / discuss$o$, $o$rejected / discussed$o$], 0, $e$1. **Is reported** ile geçmişteki eylem **to have rejected** ile söylenir.
2. **Be likely** sonrasında to-infinitive gelir: **to discuss**.

Diğer şıklar: **B** geçmişteki eylem perfect infinitive ister / **C** be likely sonrasında to-infinitive gelir / **D** is reported sonrasında to-infinitive gelir ve be likely sonrasında to gerekir / **E** is reported sonrasında to gerekir ve be likely sonrasında to-infinitive gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$She can't help ---- sorry for the homeless, but she objects to ---- money to charities that waste it.$q$, array[$o$to feel / giving$o$, $o$feeling / to give$o$, $o$feel / give$o$, $o$felt / gave$o$, $o$feeling / giving$o$], 4, $e$1. **Can't help** sonrasında gerund gelir: **feeling**.
2. **Object to** içindeki **to** edattır: **giving**.

Diğer şıklar: **A** can't help sonrasında gerund gelir / **B** object to içindeki to edattır / **C** can't help sonrasında gerund gelir ve object to sonrasında gerund gelir / **D** can't help sonrasında gerund gelir ve object to sonrasında gerund gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$The old woman appeared ---- asleep, but she was actually listening to us without ---- noticed.$q$, array[$o$being / being$o$, $o$to be / being$o$, $o$to be / be$o$, $o$be / to be$o$, $o$been / been$o$], 1, $e$1. **Appear** sonrasında to-infinitive gelir: **to be**.
2. **Without** edatından sonra gerund gelir: **being**.

Diğer şıklar: **A** appear sonrasında to-infinitive gelir / **C** without sonrasında gerund gelir / **D** appear sonrasında to gerekir ve without edatından sonra gerund gelir / **E** appear sonrasında to-infinitive gelir ve without sonrasında gerund gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The workers were made ---- overtime, and they weren't allowed ---- the factory until the order was complete.$q$, array[$o$work / to leave$o$, $o$to work / leave$o$, $o$working / leaving$o$, $o$to work / to leave$o$, $o$worked / left$o$], 3, $e$1. **Make** edilgen yapıda to-infinitive alır: **to work**.
2. **Be allowed** sonrasında to-infinitive gelir: **to leave**.

Diğer şıklar: **A** make edilgen yapıda to-infinitive ister / **B** allowed sonrasında to-infinitive gelir / **C** make edilgen yapıda to-infinitive ister ve allowed sonrasında to-infinitive gelir / **E** make edilgen yapıda to-infinitive ister ve allowed sonrasında to-infinitive gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Gerunds ve Infinitives konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (15, 'ydt-dil', null::integer, $q$The politician is believed ---- a large sum of money, but he denies ---- involved in any crime.$q$, array[$o$to receive / being$o$, $o$to have received / to be$o$, $o$receiving / be$o$, $o$to have received / being$o$, $o$received / been$o$], 3, $e$1. **Is believed** ile geçmişteki eylem **to have received** ile söylenir.
2. **Deny** sonrasında gerund gelir: **being**.

Diğer şıklar: **A** geçmişteki eylem perfect infinitive ister / **B** deny sonrasında gerund gelir / **C** is believed sonrasında to-infinitive gelir ve deny sonrasında gerund gelir / **E** is believed sonrasında to gerekir ve deny sonrasında gerund gelir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$Despite ---- ill, she insisted on ---- the match, which she eventually won.$q$, array[$o$to be / playing$o$, $o$being / to play$o$, $o$be / play$o$, $o$been / played$o$, $o$being / playing$o$], 4, $e$1. **Despite** sonrasında gerund gelir: **being**.
2. **Insist on** sonrasında gerund gelir: **playing**.

Diğer şıklar: **A** despite sonrasında gerund gelir / **B** insist on sonrasında gerund gelir / **C** despite sonrasında gerund gelir ve insist on sonrasında gerund gelir / **D** despite sonrasında gerund gelir ve insist on sonrasında gerund gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The report is worth ---- carefully, because it was written by people who have no reason ---- the facts.$q$, array[$o$to read / to hide$o$, $o$reading / to hide$o$, $o$reading / hiding$o$, $o$read / hide$o$, $o$being read / hidden$o$], 1, $e$1. **Be worth** sonrasında gerund gelir: **reading**.
2. **Reason** sonrasında to-infinitive gelir: **to hide**.

Diğer şıklar: **A** be worth sonrasında gerund gelir / **C** reason sonrasında to-infinitive gelir / **D** be worth sonrasında gerund gelir ve reason sonrasında to gerekir / **E** anlam bozulur ve reason sonrasında to-infinitive gelir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$He struggled ---- his anger when he heard himself ---- a liar in front of the whole class.$q$, array[$o$to control / called$o$, $o$controlling / called$o$, $o$to control / calling$o$, $o$control / call$o$, $o$controlled / to call$o$], 0, $e$1. **Struggle** sonrasında to-infinitive gelir: **to control**.
2. Edilgen anlam **hear + nesne + V3** ile verilir: **called**.

Diğer şıklar: **B** struggle sonrasında to-infinitive gelir / **C** hear + nesne + V3 edilgen anlam verir / **D** struggle sonrasında to gerekir ve hear + nesne sonrasında yalın fiil etken anlam verir / **E** struggle sonrasında to-infinitive gelir ve hear + nesne sonrasında to gelmez.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Unless you are prepared ---- hard, there is little chance of ---- the entrance exam.$q$, array[$o$working / passing$o$, $o$to work / to pass$o$, $o$to work / passing$o$, $o$work / pass$o$, $o$worked / passed$o$], 2, $e$1. **Be prepared** sonrasında to-infinitive gelir: **to work**.
2. **Chance of** sonrasında gerund gelir: **passing**.

Diğer şıklar: **A** be prepared sonrasında to-infinitive gelir / **B** chance of sonrasında gerund gelir / **D** be prepared sonrasında to gerekir ve of edatından sonra gerund gelir / **E** be prepared sonrasında to-infinitive gelir ve of edatından sonra gerund gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$She claims ---- the first woman ---- the Atlantic in a rowing boat, but nobody has confirmed it.$q$, array[$o$being / to cross$o$, $o$to have been / crossing$o$, $o$to be / cross$o$, $o$to have been / to cross$o$, $o$have been / crossed$o$], 3, $e$1. **Claim** ile geçmişteki durum **to have been** ile söylenir.
2. **The first** sonrasında to-infinitive gelir: **to cross**.

Diğer şıklar: **A** claim sonrasında to-infinitive gelir / **B** the first sonrasında to-infinitive gelir / **C** geçmişteki durum perfect infinitive ister ve the first sonrasında to gerekir / **E** claim sonrasında to gerekir ve the first sonrasında to-infinitive gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Modals konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Modals konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (16, 'ydt-dil', null::integer, $q$The man ---- have been the thief, because I was with him at the time, so the police ---- have arrested the wrong person.$q$, array[$o$must / must$o$, $o$can't / can't$o$, $o$might / shouldn't$o$, $o$should / needn't$o$, $o$can't / must$o$], 4, $e$1. İmkânsız geçmiş çıkarımı **can't have + V3** ile söylenir: **can't**.
2. Güçlü geçmiş çıkarımı **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** imkânsız çıkarım can't have ile söylenir / **B** güçlü çıkarım must have ile söylenir / **C** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir / **D** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- you like to join us for lunch? We ---- already ordered, but we can ask for another menu.$q$, array[$o$Would / have$o$, $o$Will / have$o$, $o$Would / would$o$, $o$Shall / must$o$, $o$Can / can$o$], 0, $e$1. Kibar davet **Would you like** ile söylenir: **Would**.
2. **Already** Present Perfect ister: **have**.

Diğer şıklar: **B** kibar davet would like ile söylenir / **C** already ile Present Perfect gerekir / **D** kibar davet would like ile söylenir ve already ile Present Perfect gerekir / **E** kibar davet would like ile söylenir ve already ile Present Perfect gerekir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$You ---- have called the police immediately after the accident, but instead you ---- have waited until the next morning.$q$, array[$o$needn't / shouldn't$o$, $o$should / must$o$, $o$should / shouldn't$o$, $o$mustn't / can't$o$, $o$can't / would$o$], 2, $e$1. Yapılması gereken eylem **should have + V3** ile söylenir: **should**.
2. Yapılmaması gereken eylem **shouldn't have + V3** ile söylenir: **shouldn't**.

Diğer şıklar: **A** geçmiş eleştirisi should have ile söylenir / **B** yanlış davranış shouldn't have ile söylenir / **D** geçmiş eleştirisi should have ile söylenir ve yanlış davranış shouldn't have ile söylenir / **E** geçmiş eleştirisi should have ile söylenir ve yanlış davranış shouldn't have ile söylenir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$I'd rather you ---- smoke in the house, and I'd prefer you ---- the windows open when it's warm.$q$, array[$o$hadn't / to keep$o$, $o$didn't / keep$o$, $o$haven't / keeping$o$, $o$didn't / to keep$o$, $o$won't / kept$o$], 3, $e$1. **Would rather + özne** sonrasında Past Simple gelir: **didn't**.
2. **Would prefer + nesne** sonrasında to-infinitive gelir: **to keep**.

Diğer şıklar: **A** would rather you sonrasında Past Simple gelir / **B** would prefer sonrasında to-infinitive gelir / **C** would rather you sonrasında Past Simple gelir ve would prefer you sonrasında to-infinitive gelir / **E** would rather you sonrasında Past Simple gelir ve would prefer you sonrasında to-infinitive gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The committee insists that the report ---- submitted by Monday, and it recommends that the budget ---- reviewed carefully.$q$, array[$o$is / be$o$, $o$be / be$o$, $o$be / is$o$, $o$was / was$o$, $o$will be / will be$o$], 1, $e$1. **Insist that** sonrasında yalın fiil (be) gelir: **be**.
2. **Recommend that** sonrasında da yalın fiil gelir: **be**.

Diğer şıklar: **A** insist that sonrasında yalın fiil gelir / **C** recommend that sonrasında yalın fiil gelir / **D** insist that sonrasında yalın fiil gelir ve recommend that sonrasında yalın fiil gelir / **E** insist that sonrasında yalın fiil gelir ve recommend that sonrasında yalın fiil gelir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Modals konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Modals konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (11, 'ydt-dil', null::integer, $q$When the exam results are announced, students ---- check them online, but they ---- call the school.$q$, array[$o$mustn't / needn't$o$, $o$can / can$o$, $o$shouldn't / must$o$, $o$can / needn't$o$, $o$can't / may$o$], 3, $e$1. Seçenek **can** ile söylenir: **can**.
2. Gerek olmaması **needn't** ile söylenir: **needn't**.

Diğer şıklar: **A** seçenek can ile söylenir / **B** gerek olmaması needn't ile söylenir / **C** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir / **E** seçenek can ile söylenir ve gerek olmaması needn't ile söylenir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$She looked so pale that I thought she ---- be ill, so I suggested that she ---- go home early.$q$, array[$o$had to / should$o$, $o$might / should$o$, $o$might / would$o$, $o$ought / could$o$, $o$shall / had to$o$], 1, $e$1. Olasılık **might** ile söylenir: **might**.
2. **Suggest that** sonrasında **should + V1** gelir: **should**.

Diğer şıklar: **A** olasılık might ile söylenir / **C** suggest that sonrası should + V1 gelir / **D** olasılık might ile söylenir ve suggest that sonrası should + V1 gelir / **E** olasılık might ile söylenir ve suggest that sonrası should + V1 gelir.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The company ---- invest a large amount of money in advertising, otherwise it ---- lose its customers.$q$, array[$o$has to / will$o$, $o$needn't / will$o$, $o$has to / would$o$, $o$mustn't / could$o$, $o$can't / should$o$], 0, $e$1. Zorunluluk **has to** ile söylenir: **has to**.
2. Gerçekçi sonuç **will** ile söylenir: **will**.

Diğer şıklar: **B** zorunluluk has to ile söylenir / **C** gerçekçi sonuç will ile söylenir / **D** zorunluluk has to ile söylenir ve gerçekçi sonuç will ile söylenir / **E** zorunluluk has to ile söylenir ve gerçekçi sonuç will ile söylenir.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$By the time the manager came back, the staff ---- have finished the report, but they hadn't, so he ---- have been angry.$q$, array[$o$can't / must$o$, $o$should / can't$o$, $o$should / must$o$, $o$needn't / needn't$o$, $o$mustn't / shouldn't$o$], 2, $e$1. Beklenen ama olmayan eylem **should have + V3** ile söylenir: **should**.
2. Güçlü çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** beklenti anlamı should have ile söylenir / **B** güçlü çıkarım must have ile söylenir / **D** beklenti anlamı should have ile söylenir ve güçlü çıkarım must have ile söylenir / **E** beklenti anlamı should have ile söylenir ve güçlü çıkarım must have ile söylenir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Ali ---- have been more careful, because the vase ---- have been broken so easily if he had held it properly.$q$, array[$o$needn't / wouldn't$o$, $o$ought to / can't$o$, $o$can't / mustn't$o$, $o$ought to / wouldn't$o$, $o$mustn't / needn't$o$], 3, $e$1. Geçmişte yapılması gereken **ought to have + V3** ile söylenir: **ought to**.
2. Gerçek dışı sonuç **wouldn't have + V3** ile söylenir: **wouldn't**.

Diğer şıklar: **A** pişmanlık ought to have ile söylenir / **B** gerçek dışı sonuç wouldn't have ile söylenir / **C** pişmanlık ought to have ile söylenir ve gerçek dışı sonuç wouldn't have ile söylenir / **E** pişmanlık ought to have ile söylenir ve gerçek dışı sonuç wouldn't have ile söylenir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$He ---- have been ill, because I saw him playing football an hour ago, so he ---- have called in sick to avoid the exam.$q$, array[$o$must / may$o$, $o$can't / may$o$, $o$can't / can't$o$, $o$should / shouldn't$o$, $o$needn't / needn't$o$], 1, $e$1. İmkânsız çıkarım **can't have + V3** ile söylenir: **can't**.
2. Olasılık **may have + V3** ile söylenir: **may**.

Diğer şıklar: **A** imkânsız çıkarım can't have ile söylenir / **C** olasılık may have ile söylenir / **D** imkânsız çıkarım can't have ile söylenir ve olasılık may have ile söylenir / **E** imkânsız çıkarım can't have ile söylenir ve olasılık may have ile söylenir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$When I was at school, we ---- wear a uniform, but we ---- choose our own shoes.$q$, array[$o$must / could$o$, $o$had to / can$o$, $o$had to / could$o$, $o$should / must$o$, $o$may / should$o$], 2, $e$1. Geçmişteki zorunluluk **had to** ile söylenir: **had to**.
2. Geçmişteki izin **could** ile söylenir: **could**.

Diğer şıklar: **A** geçmiş zorunluluk had to ile söylenir / **B** geçmişte izin could ile söylenir / **D** geçmiş zorunluluk had to ile söylenir ve geçmişte izin could ile söylenir / **E** geçmiş zorunluluk had to ile söylenir ve geçmişte izin could ile söylenir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$---- you possibly lend me some money until Friday? I promise I ---- pay you back as soon as I get my salary.$q$, array[$o$Must / will$o$, $o$Could / might$o$, $o$Need / must$o$, $o$Should / may$o$, $o$Could / will$o$], 4, $e$1. Kibar rica **Could you** ile söylenir: **Could**.
2. Söz **will** ile söylenir: **will**.

Diğer şıklar: **A** kibar rica could you ile söylenir / **B** söz will ile söylenir / **C** kibar rica could you ile söylenir ve söz will ile söylenir / **D** kibar rica could you ile söylenir ve söz will ile söylenir.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$It is essential that every applicant ---- a valid passport, and the officer insisted that nobody ---- the office without permission.$q$, array[$o$has / leave$o$, $o$have / leaves$o$, $o$had / left$o$, $o$have / leave$o$, $o$will have / would leave$o$], 3, $e$1. **Essential that** sonrasında yalın fiil gelir: **have**.
2. **Insist that** sonrasında yalın fiil gelir: **leave**.

Diğer şıklar: **A** essential that sonrasında yalın fiil gelir / **B** insist that sonrasında yalın fiil gelir / **C** essential that sonrasında yalın fiil gelir ve insist that sonrasında yalın fiil gelir / **E** essential that sonrasında yalın fiil gelir ve insist that sonrasında yalın fiil gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$---- you hear from him, please let me know at once, and I ---- be very grateful.$q$, array[$o$Should / will$o$, $o$Would / will$o$, $o$Should / must$o$, $o$Could / might$o$, $o$Must / can$o$], 0, $e$1. **Should + özne** gerçekçi koşulu devrik yapıyla kurar: **Should**.
2. Sonuç gelecektir: **will**.

Diğer şıklar: **B** gerçekçi koşul inversion Should ile kurulur / **C** sonuç cümlesi will ile söylenir / **D** gerçekçi koşul inversion Should ile kurulur ve sonuç cümlesi will ile söylenir / **E** gerçekçi koşul inversion Should ile kurulur ve sonuç cümlesi will ile söylenir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Modals konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Modals konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (14, 'ydt-dil', null::integer, $q$You ---- not have worried so much about the exam. The questions were quite easy, but then again, you ---- have known that.$q$, array[$o$need / couldn't$o$, $o$must / couldn't$o$, $o$need / needn't$o$, $o$should / mustn't$o$, $o$can / shouldn't$o$], 0, $e$1. **Need not have + V3** gereksiz endişeyi anlatır: **need**.
2. Bilme olanağının olmaması **couldn't have + V3** ile söylenir: **couldn't**.

Diğer şıklar: **B** olumsuz cümlede need not have V3 gelir / **C** geçmişte bilememe couldn't have ile söylenir / **D** olumsuz cümlede need not have V3 gelir ve geçmişte bilememe couldn't have ile söylenir / **E** olumsuz cümlede need not have V3 gelir ve geçmişte bilememe couldn't have ile söylenir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The door was locked from the inside, so the thief ---- have come in through it, and he ---- have used the window instead.$q$, array[$o$must / must$o$, $o$can't / can't$o$, $o$can't / must$o$, $o$might / needn't$o$, $o$should / shouldn't$o$], 2, $e$1. İmkânsız çıkarım **can't have + V3** ile söylenir: **can't**.
2. Güçlü çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** imkânsız çıkarım can't have ile söylenir / **B** güçlü çıkarım must have ile söylenir / **D** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir / **E** imkânsız çıkarım can't have ile söylenir ve güçlü çıkarım must have ile söylenir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$I would have helped you if you ---- asked me, but you ---- have been too proud to ask.$q$, array[$o$would / must$o$, $o$had / must$o$, $o$had / can't$o$, $o$have / needn't$o$, $o$should / shouldn't$o$], 1, $e$1. **If** cümlesinde geçmiş gerçek dışılık Past Perfect ister: **had**.
2. Güçlü çıkarım **must have + V3** ile söylenir: **must**.

Diğer şıklar: **A** if cümlesinde Past Perfect gerekir / **C** güçlü çıkarım must have ile söylenir / **D** if cümlesinde Past Perfect gerekir ve güçlü çıkarım must have ile söylenir / **E** if cümlesinde Past Perfect gerekir ve güçlü çıkarım must have ile söylenir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The lecturer said that students ---- not use their phones in the lecture hall, but they ---- listen to music with headphones in the library.$q$, array[$o$needn't / could$o$, $o$were not to / must$o$, $o$shall / may$o$, $o$were not to / could$o$, $o$had better / shall$o$], 3, $e$1. Dolaylı anlatımda yasak **were not to** ile söylenir: **were not to**.
2. Dolaylı anlatımda izin **could** ile söylenir: **could**.

Diğer şıklar: **A** dolaylı anlatımda yasak were not to ile söylenir / **B** dolaylı anlatımda izin could ile söylenir / **C** dolaylı anlatımda yasak were not to ile söylenir ve dolaylı anlatımda izin could ile söylenir / **E** dolaylı anlatımda yasak were not to ile söylenir ve dolaylı anlatımda izin could ile söylenir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Had she ---- the warning signs, she ---- have avoided the accident, but now it is too late.$q$, array[$o$notice / could$o$, $o$noticed / can$o$, $o$noticed / could$o$, $o$notices / must$o$, $o$noticing / should$o$], 2, $e$1. **Had + özne + V3** gerçek dışı geçmiş koşulu kurar: **noticed**.
2. Gerçek dışı geçmiş sonuç **could have + V3** ile söylenir: **could**.

Diğer şıklar: **A** Had sonrası V3 gelir / **B** gerçek dışı geçmiş could have ile söylenir / **D** Had sonrası V3 gelir ve gerçek dışı geçmiş could have ile söylenir / **E** Had sonrası V3 gelir ve gerçek dışı geçmiş could have ile söylenir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$You ---- better not ---- the rumours to anyone, because if the manager hears about it, he will be furious.$q$, array[$o$would / repeat$o$, $o$had / repeat$o$, $o$had / to repeat$o$, $o$should / repeating$o$, $o$might / repeated$o$], 1, $e$1. **Had better not** kalıbı kullanılır: **had**.
2. Kalıp sonrasında yalın fiil gelir: **repeat**.

Diğer şıklar: **A** had better not kalıbı ister / **C** had better not sonrasında yalın fiil gelir / **D** had better not kalıbı ister ve had better not sonrasında yalın fiil gelir / **E** had better not kalıbı ister ve had better not sonrasında yalın fiil gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$My brother ---- be a professional footballer one day if he keeps practising, but he ---- play in the national team yet.$q$, array[$o$must / hasn't been able to$o$, $o$could / doesn't$o$, $o$needn't / didn't$o$, $o$could / hasn't been able to$o$, $o$had better / won't have$o$], 3, $e$1. Gelecek olasılığı **could** ile söylenir: **could**.
2. **Yet** olumsuz cümlede Present Perfect ister: **hasn't been able to**.

Diğer şıklar: **A** olasılık could ile söylenir / **B** yet Present Perfect ister / **C** olasılık could ile söylenir ve yet Present Perfect ister / **E** olasılık could ile söylenir ve yet Present Perfect ister.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Participles konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Participles konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Participles$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (6, 'ydt-dil', null::integer, $q$---- the exam, the students left the hall quietly, and ---- the papers, the teacher put them in a bag.$q$, array[$o$Finished / collecting$o$, $o$Having finished / Collected$o$, $o$To finish / Being collected$o$, $o$Having finished / collecting$o$, $o$Being finished / To collect$o$], 3, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having finished**.
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
  (10, 'ydt-dil', null::integer, $q$Not ---- what to do, he asked a friend for advice, and, ---- her suggestion, he applied for the job.$q$, array[$o$Not known / following$o$, $o$knowing / to follow$o$, $o$Not to know / followed$o$, $o$Having not known / follow$o$, $o$knowing / following$o$], 4, $e$1. Olumsuz participle clause **Not + V-ing** ile kurulur: **knowing**.
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
  (15, 'ydt-dil', null::integer, $q$The report ---- by the committee last year suggested that students ---- more than five hours a day in front of a screen were more likely to feel anxious.$q$, array[$o$publishing / spending$o$, $o$published / spent$o$, $o$published / spending$o$, $o$having published / to spend$o$, $o$to publish / having spent$o$], 2, $e$1. Edilgen anlam **V-ed** ile verilir: **published**.
2. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **spending**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** etken anlam V-ing ister / **D** edilgen anlam V-ed ister ve etken anlam V-ing ister / **E** edilgen anlam V-ed ister ve sıra anlamı eklenir.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$---- by the noise, the baby started crying, and the mother, ---- her book aside, rushed into the room.$q$, array[$o$Frightening / putting$o$, $o$Frightened / put$o$, $o$Having frightened / having put$o$, $o$To frighten / to put$o$, $o$Frightened / putting$o$], 4, $e$1. Edilgen anlam **V-ed** ile verilir: **Frightened**.
2. Etken anlam **V-ing** ile verilir: **putting**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** etken anlam V-ing ister / **C** edilgen anlam V-ed ister ve sıra anlamı eklenir / **D** amaç anlamı verir ve amaç anlamı verir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$---- from a small village, he found city life difficult at first, but ---- by his colleagues, he soon felt at home.$q$, array[$o$Coming / welcomed$o$, $o$Come / welcomed$o$, $o$Coming / welcoming$o$, $o$Having come / having welcomed$o$, $o$Came / to welcome$o$], 0, $e$1. Etken eş zamanlı durum **V-ing** ile verilir: **Coming**.
2. Edilgen anlam **V-ed** ile verilir: **welcomed**.

Diğer şıklar: **B** etken anlam V-ing ister / **C** edilgen anlam V-ed ister / **D** eş zamanlı durum anlatılır ve edilgen anlam V-ed ister / **E** zaman bildiren fiil V-ing alır ve edilgen anlam V-ed ister.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The match will be played outdoors, weather ----, and the players, ---- in blue shirts, will wear red shorts.$q$, array[$o$permitted / dressed$o$, $o$permitting / dressed$o$, $o$permitting / dressing$o$, $o$to permit / dress$o$, $o$permits / to dress$o$], 1, $e$1. Absolute yapıda **weather permitting** kalıbı kullanılır: **permitting**.
2. Edilgen anlam **V-ed** ile verilir: **dressed**.

Diğer şıklar: **A** absolute yapıda etken V-ing gerekir / **C** edilgen anlam V-ed ister / **D** absolute yapıda V-ing gerekir ve edilgen anlam V-ed ister / **E** absolute yapıda çekimli fiil gelmez ve edilgen anlam V-ed ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- a lot of money, the company was able to expand, and ---- the competition, it entered new markets.$q$, array[$o$Raised / facing$o$, $o$Having raised / Faced$o$, $o$Having been raised / Having faced$o$, $o$To raise / To face$o$, $o$Having raised / facing$o$], 4, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having raised**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **facing**.

Diğer şıklar: **A** önce biten eylem Having + V3 ister / **B** etken anlam V-ing ister / **C** edilgen anlam eşleşmez ve sırayı bozar / **D** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$The children left alone in the house ---- frightened, and the ---- noise outside made them even more nervous.$q$, array[$o$feeling / growing$o$, $o$felt / grown$o$, $o$felt / growing$o$, $o$feel / grow$o$, $o$to feel / to grow$o$], 2, $e$1. Ana fiil çekimli olmalıdır: **felt**.
2. Artan gürültü etken anlamla **growing** ile söylenir: **growing**.

Diğer şıklar: **A** ana fiil gerekir / **B** sıfat edilgen anlam taşır / **D** ana fiil çekimli olmalı ve sıfat olarak kullanılmaz / **E** ana fiil çekimli olmalı ve sıfat olarak kullanılmaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Participles konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Participles konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Participles$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (7, 'ydt-dil', null::integer, $q$---- all the evidence, the jury found him guilty, and the judge, ---- by the decision, sentenced him to ten years.$q$, array[$o$Considering / convinced$o$, $o$Having considered / convincing$o$, $o$Considered / convince$o$, $o$Having considered / convinced$o$, $o$To consider / to convince$o$], 3, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having considered**.
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
  (14, 'ydt-dil', null::integer, $q$---- by the discovery, the scientists, ---- for years on the project, decided to publish their results at once.$q$, array[$o$Encouraged / working$o$, $o$Encouraging / working$o$, $o$Encouraged / worked$o$, $o$Having encouraged / having worked$o$, $o$To encourage / to work$o$], 0, $e$1. Edilgen anlam **V-ed** ile verilir: **Encouraged**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **working**.

Diğer şıklar: **B** edilgen anlam V-ed ister / **C** etken anlam V-ing ister / **D** edilgen anlam V-ed ister ve süre ve eş zamanlılık sorunu / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$With the lights ---- off and the doors ----, the building looked completely deserted.$q$, array[$o$turning / locked$o$, $o$turned / locking$o$, $o$turned / locked$o$, $o$turn / lock$o$, $o$to turn / to lock$o$], 2, $e$1. **With + nesne + V3** edilgen anlam verir: **turned**.
2. Aynı kurala göre: **locked**.

Diğer şıklar: **A** with + nesne + V3 edilgen anlam ister / **B** with + nesne + V3 edilgen anlam ister / **D** with + nesne + V3 ister ve with + nesne + V3 ister / **E** with + nesne + V3 ister ve with + nesne + V3 ister.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Anyone ---- to join the team should contact the coach, and all the members ---- the course will receive a certificate.$q$, array[$o$wanted / completing$o$, $o$wanting / completed$o$, $o$to want / to complete$o$, $o$wanting / completing$o$, $o$wants / completes$o$], 3, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **wanting**.
2. Aynı kurala göre: **completing**.

Diğer şıklar: **A** etken kısaltılmış sıfat cümlesi V-ing ister / **B** etken kısaltılmış sıfat cümlesi V-ing ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$Not ---- the area well, the tourists got lost, and, ---- that they were wasting time, they asked a passer-by for directions.$q$, array[$o$knowing / realising$o$, $o$Not known / realising$o$, $o$knowing / realised$o$, $o$Not to know / to realise$o$, $o$Not knew / realise$o$], 0, $e$1. Olumsuz participle clause **Not + V-ing** ile kurulur: **knowing**.
2. Etken eş zamanlı eylem **V-ing** ile verilir: **realising**.

Diğer şıklar: **B** etken anlam V-ing ister / **C** etken anlam V-ing ister / **D** amaç anlamı verir ve amaç anlamı verir / **E** Not sonrası V-ing gelir ve yapı bozulur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The more ---- the situation became, the more the managers worried, and the ---- employees started to look for other jobs.$q$, array[$o$complicating / worried$o$, $o$complicated / worrying$o$, $o$complicated / worried$o$, $o$complicate / worry$o$, $o$complication / worries$o$], 2, $e$1. Durum **complicated** ile söylenir: **complicated**.
2. Duyguyu hisseden kişi **V-ed** alır: **worried**.

Diğer şıklar: **A** durum sıfatı complicated kalıbı ister / **B** hisseden kişi için V-ed gerekir / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** isimdir ve fiil ya da çoğul isimdir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$---- with last year, sales have risen sharply, and ---- the prices stay low, the company expects to grow even more.$q$, array[$o$Comparing / provided$o$, $o$Compared / provided$o$, $o$Compared / Provide$o$, $o$Having compared / Provides$o$, $o$Comparison / To provide$o$], 1, $e$1. Edilgen anlam **Compared with** kalıbı ile verilir: **Compared**.
2. **Provided (that)** koşul bağlacıdır: **provided**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **C** bağlaç gerekir, fiil gelmez / **D** edilgen anlam V-ed ister ve bağlaç gerekir, fiil gelmez / **E** isimdir ve bağlaç gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$Having been ---- by the police for hours, the suspect finally confessed, and, ---- his head, he signed the statement.$q$, array[$o$question / lowering$o$, $o$questioned / lowered$o$, $o$questioning / to lower$o$, $o$to question / lowers$o$, $o$questioned / lowering$o$], 4, $e$1. **Having been + V3** edilgen perfect participle kurar: **questioned**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **lowering**.

Diğer şıklar: **A** Having been sonrası V3 gelir / **B** eş zamanlı etken eylem V-ing ister / **C** Having been sonrası V3 gelir ve amaç anlamı verir / **D** Having been sonrası V3 gelir ve çekimli fiil gelmez.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Participles konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Participles konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Participles$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (5, 'ydt-dil', null::integer, $q$---- my homework, I went to bed, and ---- up late, I felt exhausted the next day.$q$, array[$o$Having finished / staying$o$, $o$Finishing / staying$o$, $o$Having finished / stayed$o$, $o$Finished / having stayed$o$, $o$To finish / to stay$o$], 0, $e$1. Önce biten eylem **Having + V3** ile verilir: **Having finished**.
2. Etken sebep anlamı **V-ing** ile verilir: **staying**.

Diğer şıklar: **B** önce biten eylem Having + V3 ister / **C** etken anlam V-ing ister / **D** etken anlam gerekir ve sırayı bozar / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 1),
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
  (13, 'ydt-dil', null::integer, $q$---- by a friend, he applied for the job, and, ---- the interview, he was offered the position the same day.$q$, array[$o$Encouraging / having passed$o$, $o$Encouraged / having passed$o$, $o$Encouraged / passing$o$, $o$Having encouraged / passed$o$, $o$To encourage / to pass$o$], 1, $e$1. Edilgen anlam **V-ed** ile verilir: **Encouraged**.
2. Önce biten eylem **Having + V3** ile verilir: **having passed**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **C** önce biten eylem Having + V3 ister / **D** edilgen anlam V-ed ister ve etken anlam gerekir / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Not ---- how to repair the machine, the technician called the factory, and, ---- the manual, he found the answer.$q$, array[$o$Not known / consulting$o$, $o$knowing / consulted$o$, $o$knowing / consulting$o$, $o$Not to know / having consulted$o$, $o$Having not known / to consult$o$], 2, $e$1. Olumsuz participle clause **Not + V-ing** ile kurulur: **knowing**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **consulting**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **D** amaç anlamı verir ve sırayı bozar / **E** sıra anlamı eklenir ve amaç anlamı verir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$The room was full of people ---- loudly, and the music ---- from the speakers was too loud to bear.$q$, array[$o$talking / coming$o$, $o$talked / coming$o$, $o$talking / come$o$, $o$to talk / to come$o$, $o$talks / comes$o$], 0, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **talking**.
2. Aynı kurala göre: **coming**.

Diğer şıklar: **B** etken anlam V-ing ister / **C** etken kısaltılmış sıfat cümlesi V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** çekimli fiil gelmez ve çekimli fiil gelmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$A man ---- Tom was waiting at the door, and the girl ---- next to him smiled at us.$q$, array[$o$naming / standing$o$, $o$named / stood$o$, $o$name / to stand$o$, $o$to name / stands$o$, $o$named / standing$o$], 4, $e$1. Edilgen anlam **named** ile verilir: **named**.
2. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **standing**.

Diğer şıklar: **A** edilgen anlam V-ed ister / **B** etken anlam V-ing ister / **C** sıfat işlevi yok ve sıfat işlevi yok / **D** sıfat işlevi yok ve çekimli fiil gelmez.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The little boy sat ---- in the corner, ---- his toys, until his mother came back.$q$, array[$o$cried / holding$o$, $o$crying / held$o$, $o$crying / holding$o$, $o$cry / hold$o$, $o$to cry / to hold$o$], 2, $e$1. Eş zamanlı etken eylem **V-ing** ile verilir: **crying**.
2. Aynı kurala göre: **holding**.

Diğer şıklar: **A** etken anlam V-ing ister / **B** etken anlam V-ing ister / **D** sıfat işlevi yok ve sıfat işlevi yok / **E** amaç anlamı verir ve amaç anlamı verir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$Having been ---- of the danger, the villagers left their homes at once, and, ---- the road blocked, they crossed the river on foot.$q$, array[$o$warn / finding$o$, $o$warned / found$o$, $o$warning / to find$o$, $o$warned / finding$o$, $o$to warn / having found$o$], 3, $e$1. **Having been + V3** edilgen perfect participle kurar: **warned**.
2. Eş zamanlı etken eylem **V-ing** ile verilir: **finding**.

Diğer şıklar: **A** Having been sonrası V3 gelir / **B** etken anlam V-ing ister / **C** Having been sonrası V3 gelir ve amaç anlamı verir / **E** Having been sonrası V3 gelir ve eş zamanlı eylem V-ing ister.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Unlike most of his colleagues, he has no interest in ---- promoted, and he dislikes ---- about his own achievements.$q$, array[$o$to be / talking$o$, $o$being / talking$o$, $o$being / to talk$o$, $o$be / talk$o$, $o$been / talked$o$], 1, $e$1. **Interest in** sonrasında gerund gelir: **being**.
2. **Dislike** sonrasında gerund gelir: **talking**.

Diğer şıklar: **A** in sonrasında gerund gelir / **C** dislike sonrasında gerund gelir / **D** in sonrasında gerund gelir ve dislike sonrasında gerund gelir / **E** in sonrasında gerund gelir ve dislike sonrasında gerund gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The prices ---- sharply last year are expected to fall again, and the economists ---- the figures say it is too early to be sure.$q$, array[$o$risen / examining$o$, $o$rising / examined$o$, $o$rising / examining$o$, $o$rose / to examine$o$, $o$to rise / examines$o$], 2, $e$1. Etken kısaltılmış sıfat cümlesi **V-ing** alır: **rising**.
2. Aynı kurala göre: **examining**.

Diğer şıklar: **A** edilgen anlam yoktur, etken V-ing ister / **B** etken anlam V-ing ister / **D** çekimli fiil gelmez ve sıfat işlevi yok / **E** sıfat işlevi yok ve çekimli fiil gelmez.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Tenses konu testi 2
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Tenses konu testi 2$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (11, 'ydt-dil', null::integer, $q$I'm sure you ---- the film if you ---- it before, because everybody in my class loved it.$q$, array[$o$liked / haven't seen$o$, $o$will like / haven't seen$o$, $o$will like / don't see$o$, $o$have liked / didn't see$o$, $o$were liking / won't see$o$], 1, $e$1. Kesin gelecek tahmin will ile yapılır: **will like**.
2. **Before** kullanımı Present Perfect ister: **haven't seen**.

Diğer şıklar: **A** gelecek tahmin için will gerekir / **C** before ile Present Perfect gerekir / **D** gelecek tahmin söyleniyor ve before ile Present Perfect gerekir / **E** durum fiili sürekli yapıda olmaz ve if cümlesinde will kullanılmaz.$e$, 2),
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
  (16, 'ydt-dil', null::integer, $q$By the time she ---- her degree, she ---- in three different countries and learned four languages.$q$, array[$o$will get / will have lived$o$, $o$gets / will have lived$o$, $o$gets / would live$o$, $o$got / lives$o$, $o$has got / has lived$o$], 1, $e$1. **By the time** sonrasında gelecek için Present Simple kullanılır: **gets**.
2. Gelecekteki bir noktaya kadar tamamlanan eylem Future Perfect ile söylenir: **will have lived**.

Diğer şıklar: **A** by the time sonrasında will kullanılmaz / **C** gelecek bir noktaya kadar tamamlanan eylem Future Perfect ister / **D** gelecekteki bir noktadır ve gelecek bir noktaya kadar tamamlanan eylemdir / **E** by the time sonrası Present Simple ister ve gelecek bir noktaya kadar anlatılıyor.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$No sooner ---- the door than the alarm ---- off, and the guard rushed into the building.$q$, array[$o$did he open / went$o$, $o$had he opened / had gone$o$, $o$he had opened / goes$o$, $o$has he opened / was going$o$, $o$had he opened / went$o$], 4, $e$1. **No sooner** sonrasında devrik yapı ve Past Perfect gelir: **had he opened**.
2. **Than** sonrasında Past Simple gelir: **went**.

Diğer şıklar: **A** no sooner ile Past Perfect gerekir / **B** than sonrasında Past Simple gelir / **C** no sooner sonrası devrik yapı gerekir ve geçmiş anlatım gerekir / **D** no sooner ile Past Perfect gerekir ve tek ani olay anlatılır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$Hardly ---- the speech when the audience ---- to applaud and shout his name.$q$, array[$o$he finished / began$o$, $o$had he finished / had begun$o$, $o$had he finished / began$o$, $o$did he finish / begins$o$, $o$has he finished / was beginning$o$], 2, $e$1. **Hardly** sonrasında devrik yapı ve Past Perfect gelir: **had he finished**.
2. **When** sonrasında Past Simple gelir: **began**.

Diğer şıklar: **A** hardly sonrası devrik yapı gerekir / **B** when sonrasında Past Simple gelir / **D** hardly ile Past Perfect gerekir ve geçmiş anlatım gerekir / **E** hardly ile Past Perfect gerekir ve anlık olay anlatılıyor.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$This time next week, I ---- on a beach in Antalya, and my colleagues ---- on the final report without me.$q$, array[$o$will lie / will be working$o$, $o$will be lying / will have worked$o$, $o$am lying / work$o$, $o$will be lying / will be working$o$, $o$lay / have worked$o$], 3, $e$1. **This time next week** belirli bir anda sürecek eylemi gösterir: **will be lying**.
2. Aynı anda süren ikinci eylem de sürekli yapıdadır: **will be working**.

Diğer şıklar: **A** belirli bir anda sürecek eylem gerekir / **B** belirli bir anda süren eylem Future Continuous ister / **C** gelecek bir an anlatılıyor ve gelecek bir anda süren eylem anlatılıyor / **E** gelecek zaman gerekir ve gelecek zaman gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The villagers ---- on the new road for six months by the time the government finally ---- more money.$q$, array[$o$have been working / sent$o$, $o$had been working / has sent$o$, $o$were working / had sent$o$, $o$worked / sends$o$, $o$had been working / sent$o$], 4, $e$1. **For six months** ve geçmişteki bir an süre vurgulu eylemi gösterir: **had been working**.
2. Sonraki olay Past Simple ile verilir: **sent**.

Diğer şıklar: **A** by the time sonrası geçmiştir / **B** geçmiş anlatım gerekir / **C** süre vurgusu gerekir ve sonraki olay Past Simple ile verilir / **D** süre vurgusu gerekir ve geçmiş anlatım gerekir.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Tenses konu testi 3
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Tenses konu testi 3$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (7, 'ydt-dil', null::integer, $q$Last night, while I ---- the dishes, my sister ---- in to tell me the exciting news.$q$, array[$o$washed / came$o$, $o$was washing / was coming$o$, $o$have washed / had come$o$, $o$was washing / came$o$, $o$had washed / comes$o$], 3, $e$1. **While** ile süren eylem Past Continuous ile söylenir: **was washing**.
2. Kesen kısa olay Past Simple ile verilir: **came**.

Diğer şıklar: **A** süren eylem Past Continuous ister / **B** kısa olay kesen eylemdir / **C** geçmiş zaman gerekir ve kısa eylem Past Simple ile verilir / **E** süren eylem gerekir ve geçmiş zaman gerekir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The committee ---- the proposal for three hours when the chairman finally ---- everyone for their patience.$q$, array[$o$has been discussing / thanked$o$, $o$had been discussing / thanked$o$, $o$had been discussing / has thanked$o$, $o$discussed / had thanked$o$, $o$is discussing / thanks$o$], 1, $e$1. **For three hours when...** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been discussing**.
2. Başkanın teşekkürü sonraki olaydır: **thanked**.

Diğer şıklar: **A** when sonrası geçmiş zamandır / **C** geçmiş anlatım gerekir / **D** when anında süren eylem gerekir ve ana olay Past Simple ile verilir / **E** when sonrası geçmiş zamandır ve geçmiş anlatım gerekir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$Don't worry about the tickets. I ---- them for you as soon as the box office ---- tomorrow morning.$q$, array[$o$am buying / opens$o$, $o$will buy / will open$o$, $o$bought / opened$o$, $o$have bought / has opened$o$, $o$will buy / opens$o$], 4, $e$1. Konuşma anında verilen söz will ile söylenir: **will buy**.
2. **As soon as** sonrasında gelecek için Present Simple kullanılır: **opens**.

Diğer şıklar: **A** karar o anda verilir / **B** as soon as sonrasında will kullanılmaz / **C** tomorrow ile geçmiş olmaz ve gelecek zaman cümlesi anlatılır / **D** tomorrow ile Present Perfect olmaz ve gelecek zaman cümlesi anlatılır.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$My sister ---- in London since she ---- a scholarship at the university in 2020.$q$, array[$o$has lived / won$o$, $o$lived / won$o$, $o$has lived / has won$o$, $o$is living / had won$o$, $o$had lived / wins$o$], 0, $e$1. **Since** ana cümlede Present Perfect ister: **has lived**.
2. **In 2020** belirli bir geçmiş zamandır: **won**.

Diğer şıklar: **B** since ile Present Perfect gerekir / **C** 2020 ile Present Perfect olmaz / **D** since ile Present Perfect gerekir ve since sonrası Past Simple ister / **E** since şimdiyi kapsar ve 2020 geçmiştir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The workshop ---- at 10 a.m. every Monday, but this week it ---- at noon because of the holiday.$q$, array[$o$started / is starting$o$, $o$starts / starts$o$, $o$has started / started$o$, $o$starts / is starting$o$, $o$is going to start / has started$o$], 3, $e$1. **Every Monday** düzenli tekrarı gösterir: **starts**.
2. **This week** için değişen yakın plan Present Continuous ile söylenir: **is starting**.

Diğer şıklar: **A** her pazartesi tekrar eden program Present Simple ister / **B** bu hafta özel bir düzenleme anlatılıyor / **C** tekrarlayan bir program anlatılıyor ve this week gelecek planı belirtir / **E** tekrarlayan bir program anlatılıyor ve this week gelecek planı belirtir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$He ---- all day on the roof, so he ---- exhausted now and wants to go to bed.$q$, array[$o$worked / is$o$, $o$has been working / was$o$, $o$works / has been$o$, $o$was working / will be$o$, $o$has been working / is$o$], 4, $e$1. **All day** ile şimdiye etkisi süren eylem Present Perfect Continuous ile söylenir: **has been working**.
2. **Now** şimdiki durumu gösterir: **is**.

Diğer şıklar: **A** all day ve now şimdiye uzanır / **B** now şimdiki durum gerektirir / **C** all day süre vurgusu gerekir ve now ile şimdiki durum söylenir / **D** sonuç şimdiyi etkiler ve şimdiki durum anlatılıyor.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The prime minister ---- a speech at the moment, and thousands of people ---- the broadcast online.$q$, array[$o$gives / are watching$o$, $o$is giving / are watching$o$, $o$is giving / watch$o$, $o$gave / watched$o$, $o$has given / have watched$o$], 1, $e$1. **At the moment** şu an süren eylemi gösterir: **is giving**.
2. Aynı anda süren ikinci eylem de Present Continuous ile söylenir: **are watching**.

Diğer şıklar: **A** at the moment Present Continuous ister / **C** aynı anda süren eylem anlatılıyor / **D** at the moment şimdiyi anlatır ve şu anda gerçekleşiyor / **E** at the moment süren eylemi gösterir ve şu anda gerçekleşiyor.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$By next summer, the engineers ---- the tunnel, and trains ---- through it for the first time.$q$, array[$o$will have completed / will run$o$, $o$complete / will run$o$, $o$will have completed / ran$o$, $o$completed / have run$o$, $o$are completing / are run$o$], 0, $e$1. **By next summer** Future Perfect ister: **will have completed**.
2. Tünelin tamamlanmasından sonraki gelecek olay will ile söylenir: **will run**.

Diğer şıklar: **B** by next summer Future Perfect ister / **C** gelecek zaman gerekir / **D** gelecekteki bir tarih belirtilir ve gelecek zaman gerekir / **E** bitiş tarihi vurgulanıyor ve anlam bozulur.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The more I ---- about the project, the less I ---- that it can be finished on time.$q$, array[$o$thought / believe$o$, $o$think / am believing$o$, $o$am thinking / believed$o$, $o$think / believe$o$, $o$have thought / have believed$o$], 3, $e$1. **The more...the less** yapısında şimdiki düşünce Present Simple ile anlatılır: **think**.
2. **Believe** durum fiilidir ve sürekli yapıda kullanılmaz: **believe**.

Diğer şıklar: **A** the more ile genel şimdiki düşünce anlatılıyor / **B** believe durum fiilidir / **C** the more + the less ilişkisinde basit zaman gerekir ve şimdiki düşünce anlatılıyor / **E** the more ilişkisinde basit zaman gerekir ve şimdiki düşünce anlatılıyor.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The police ---- the suspect for weeks when he finally ---- himself in at the station last Friday.$q$, array[$o$were searching / turned$o$, $o$had been searching / had turned$o$, $o$had been searching / turned$o$, $o$searched / turns$o$, $o$have been searching / was turning$o$], 2, $e$1. **For weeks when...** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been searching**.
2. **Last Friday** belirli bir geçmiş zamandır: **turned**.

Diğer şıklar: **A** when anında süre vurgusu için Past Perfect Continuous gerekir / **B** ana olay Past Simple ile verilir / **D** süre vurgusu gerekir ve geçmiş anlatım gerekir / **E** geçmişte bir noktaya kadar süren eylem ve kısa tamamlanan eylem anlatılıyor.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The phone ---- three times in the last hour, but nobody ---- a message.$q$, array[$o$rang / has left$o$, $o$has rung / left$o$, $o$rings / leaves$o$, $o$was ringing / had left$o$, $o$has rung / has left$o$], 4, $e$1. **In the last hour** şimdiyi kapsayan dönemdir: **has rung**.
2. Aynı dönemde sonuç şimdiyi etkiler: **has left**.

Diğer şıklar: **A** in the last hour şimdiyi kapsar / **B** in the last hour şimdiyi kapsar / **C** süre ve sayı Present Perfect ister ve sonuç şimdiyi etkiler / **D** süre ve sayı Present Perfect ister ve geçmişteki bir an gösterilmiyor.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It ---- that the company ---- more than half of its profit through online sales since the pandemic began.$q$, array[$o$reports / has made$o$, $o$is reported / made$o$, $o$was reporting / had made$o$, $o$is reported / has made$o$, $o$has reported / is making$o$], 3, $e$1. **It is reported that...** kalıbı edilgen yapıdadır: **is reported**.
2. **Since the pandemic began** Present Perfect ister: **has made**.

Diğer şıklar: **A** haber edilen konudur / **B** since şimdiye uzanır / **C** özne it ve edilgen gerekir ve since pandemic ile şimdiye uzanır / **E** özne it ve edilgen gerekir ve since şimdiye uzanır.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$He ---- as a translator for ten years when the company ---- him a better position in the sales department.$q$, array[$o$had been working / offered$o$, $o$has been working / offered$o$, $o$had been working / had offered$o$, $o$was working / offers$o$, $o$worked / has offered$o$], 0, $e$1. **For ten years when...** geçmişteki bir noktaya kadar süren eylemi gösterir: **had been working**.
2. Şirketin teklifi sonraki olaydır: **offered**.

Diğer şıklar: **B** when sonrası geçmiş zamandır / **C** ana olay Past Simple ile verilir / **D** süre vurgusu gerekir ve geçmiş anlatım gerekir / **E** süre vurgusu gerekir ve geçmiş anlatım gerekir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$My neighbours ---- the same car for fifteen years, but next month they ---- it for a hybrid model.$q$, array[$o$had / are exchanging$o$, $o$have had / exchange$o$, $o$have had / are exchanging$o$, $o$are having / exchanged$o$, $o$have been having / have exchanged$o$], 2, $e$1. **For fifteen years** şimdiye uzanan durumu gösterir. **Have** durum fiilidir: **have had**.
2. **Next month** önceden planlanmış yakın geleceği gösterir: **are exchanging**.

Diğer şıklar: **A** for fifteen years şimdiye uzanır / **B** yakın planlı gelecek yerine genel şimdi anlatılır / **D** have durum fiilidir ve next month geçmiş zaman almaz / **E** have durum fiilidir ve next month geçmiş zaman almaz.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Tenses konu testi 4
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Tenses konu testi 4$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
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
  (10, 'ydt-dil', null::integer, $q$I ---- Spanish for two years, but I ---- it fluently until I move to Madrid next summer.$q$, array[$o$studied / won't speak$o$, $o$have been studying / don't speak$o$, $o$am studying / didn't speak$o$, $o$study / haven't spoken$o$, $o$have been studying / won't speak$o$], 4, $e$1. **For two years** şimdiye uzanan eylemi gösterir: **have been studying**.
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
  (14, 'ydt-dil', null::integer, $q$By the time the film ----, the audience ---- in their seats for almost three hours, and many of them were exhausted.$q$, array[$o$will end / had been sitting$o$, $o$ended / had been sitting$o$, $o$ended / have been sitting$o$, $o$had ended / were sitting$o$, $o$has ended / sat$o$], 1, $e$1. **By the time** sonrasında geçmiş olay Past Simple ile verilir: **ended**.
2. Filmin sonuna kadar süren eylem Past Perfect Continuous ile söylenir: **had been sitting**.

Diğer şıklar: **A** by the time sonrası will almaz / **C** geçmiş bir noktaya kadar süre anlatılıyor / **D** geçmiş anlatım Past Simple ister ve süre vurgusu için Past Perfect Continuous gerekir / **E** geçmiş anlatım Past Simple ister ve süre vurgusu gerekir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$Never before ---- such a beautiful sunset, and I ---- the same view every evening if I had the chance.$q$, array[$o$I had seen / would watch$o$, $o$had I seen / will watch$o$, $o$did I see / watched$o$, $o$have I seen / have watched$o$, $o$had I seen / would watch$o$], 4, $e$1. **Never before** sonrasında devrik yapı ve Past Perfect gelir: **had I seen**.
2. **If I had the chance** gerçek dışı koşuldur: **would watch**.

Diğer şıklar: **A** never before sonrası devrik yapı gerekir / **B** gerçek dışı koşul anlatılıyor / **C** never before ile Past Perfect gerekir ve gerçek dışı koşul anlatılıyor / **D** geçmiş anlatım Past Perfect ister ve gerçek dışı koşul anlatılıyor.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$The company ---- its profits for three years in a row now, and analysts expect that it ---- even more next year.$q$, array[$o$increased / will increase$o$, $o$has been increasing / increases$o$, $o$is increasing / increased$o$, $o$has been increasing / will increase$o$, $o$increases / has increased$o$], 3, $e$1. **For three years in a row now** şimdiye uzanan sürekli eylemi gösterir: **has been increasing**.
2. **Next year** gelecek tahmindir: **will increase**.

Diğer şıklar: **A** for three years in a row now şimdiye uzanır / **B** next year için gelecek tahmin will ister / **C** süre vurgusu şimdiye uzanır ve next year geçmiş almaz / **E** süre vurgusu gerekir ve next year geçmiş almaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$It's about time we ---- the old system, because it ---- us a lot of trouble ever since we installed it.$q$, array[$o$replaced / has caused$o$, $o$replace / has caused$o$, $o$replaced / caused$o$, $o$will replace / causes$o$, $o$are replacing / will cause$o$], 0, $e$1. **It's about time** sonrasında Past Simple gelir: **replaced**.
2. **Ever since** şimdiye uzanır: **has caused**.

Diğer şıklar: **B** it's about time sonrası Past Simple ister / **C** ever since Present Perfect ister / **D** it's about time sonrası Past Simple ister ve ever since şimdiye uzanır / **E** it's about time sonrası Past Simple ister ve ever since şimdiye uzanır.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The architect ---- the plans three times before the client finally ---- that the design was exactly what he wanted.$q$, array[$o$has revised / announced$o$, $o$had revised / has announced$o$, $o$was revising / had announced$o$, $o$will revise / announces$o$, $o$had revised / announced$o$], 4, $e$1. **Before** ile önce olan eylem Past Perfect ile söylenir: **had revised**.
2. Müşterinin açıklaması sonraki olaydır: **announced**.

Diğer şıklar: **A** before sonrası geçmiştir / **B** geçmiş anlatım gerekir / **C** tamamlanmış tekrar eden eylem ve ana olay Past Simple ile verilir / **D** before sonrası geçmiştir ve geçmiş anlatım gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Next September my grandparents ---- married for fifty years, and they ---- a big party for all their relatives.$q$, array[$o$have been / are throwing$o$, $o$will have been / are throwing$o$, $o$will have been / threw$o$, $o$are / have thrown$o$, $o$were / threw$o$], 1, $e$1. **Next September...fifty years** gelecekteki bir noktada süre tamamlanmasını gösterir: **will have been**.
2. Önceden planlanmış yakın gelecek Present Continuous ile söylenir: **are throwing**.

Diğer şıklar: **A** next September gelecektir / **C** gelecek plan anlatılıyor / **D** gelecek tarih ve süre vurgusu vardır ve gelecek plan anlatılıyor / **E** gelecek tarih ve süre vurgusu vardır ve gelecek plan anlatılıyor.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The students ---- for the exam when the electricity ---- off, so they had to continue by candlelight.$q$, array[$o$studied / went$o$, $o$were studying / goes$o$, $o$were studying / went$o$, $o$have studied / has gone$o$, $o$had studied / was going$o$], 2, $e$1. Sürmekte olan eylem Past Continuous ile söylenir: **were studying**.
2. Kesen kısa olay Past Simple ile verilir: **went**.

Diğer şıklar: **A** süren eylem Past Continuous ister / **B** geçmiş anlatım gerekir / **D** geçmiş anlatım gerekir ve geçmiş anlatım gerekir / **E** süren eylem vurgulanıyor ve kısa olay Past Simple ile verilir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

