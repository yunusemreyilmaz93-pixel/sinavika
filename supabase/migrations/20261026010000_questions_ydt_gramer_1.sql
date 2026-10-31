-- 20261026010000_questions_ydt_gramer_1. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- ydt | konu | ydt-dil | Gerunds ve Infinitives konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Gerunds ve Infinitives konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Gerunds ve Infinitives$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$She enjoys ---- novels in her free time, and she hopes ---- a writer one day.$q$, array[$o$to read / to become$o$, $o$reading / to become$o$, $o$reading / becoming$o$, $o$read / become$o$, $o$to read / becoming$o$], 1, $e$1. **Enjoy** sonrasında gerund kullanılır: **reading**.
2. **Hope** sonrasında to-infinitive kullanılır: **to become**.

Diğer şıklar: **A** enjoy sonrasında gerund gelir / **C** hope sonrasında infinitive gelir / **D** enjoy sonrasında yalın fiil gelmez ve hope sonrasında to gerekir / **E** enjoy sonrasında gerund gelir ve hope sonrasında infinitive gelir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He avoided ---- the question, and he refused ---- anything about the incident.$q$, array[$o$to answer / to say$o$, $o$answering / saying$o$, $o$answering / to say$o$, $o$answer / say$o$, $o$to answer / saying$o$], 2, $e$1. **Avoid** sonrasında gerund gelir: **answering**.
2. **Refuse** sonrasında to-infinitive gelir: **to say**.

Diğer şıklar: **A** avoid sonrasında gerund gelir / **B** refuse sonrasında infinitive gelir / **D** avoid sonrasında yalın fiil gelmez ve refuse sonrasında to gerekir / **E** avoid sonrasında gerund gelir ve refuse sonrasında infinitive gelir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$I'm looking forward to ---- you next week, and I'm used to ---- hard, so the trip won't tire me.$q$, array[$o$see / working$o$, $o$seeing / work$o$, $o$to see / to work$o$, $o$seeing / working$o$, $o$see / work$o$], 3, $e$1. **Look forward to** kalıbında **to** edattır, gerund gelir: **seeing**.
2. **Be used to** kalıbında da gerund gelir: **working**.

Diğer şıklar: **A** to burada edat olduğu için gerund gerekir / **B** be used to sonrasında gerund gelir / **C** edat olan to sonrasında gerund gelir ve be used to sonrasında gerund gelir / **E** to burada edat olduğu için gerund gerekir ve be used to sonrasında gerund gelir.$e$, 1),
  (4, 'ydt-dil', null::integer, $q$My boss suggested ---- the meeting until Monday, but I would like ---- it earlier.$q$, array[$o$postponing / to hold$o$, $o$to postpone / to hold$o$, $o$postponing / holding$o$, $o$postpone / hold$o$, $o$to postpone / holding$o$], 0, $e$1. **Suggest** sonrasında gerund gelir: **postponing**.
2. **Would like** sonrasında to-infinitive gelir: **to hold**.

Diğer şıklar: **B** suggest sonrasında gerund gelir / **C** would like sonrasında infinitive gelir / **D** suggest sonrasında yalın fiil gelmez ve would like sonrasında to gerekir / **E** suggest sonrasında gerund gelir ve would like sonrasında infinitive gelir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$We stopped ---- at a cafe on the way because we were thirsty, and then we stopped ---- about the plan because the rain began.$q$, array[$o$having / talking$o$, $o$to have / to talk$o$, $o$have / talk$o$, $o$having / to talk$o$, $o$to have / talking$o$], 4, $e$1. Susadığımız için bir şey içmek amacıyla durduk: **stop to have**.
2. Yağmur başlayınca konuşmayı bıraktık: **stop talking**.

Diğer şıklar: **A** amaç bildirdiği için stop to + fiil gerekir / **B** bırakma anlamı için stop + gerund gerekir / **C** stop sonrasında yalın fiil gelmez ve stop sonrasında yalın fiil gelmez / **D** amaç bildirdiği için stop to + fiil gerekir ve bırakma anlamı için stop + gerund gerekir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$I remember ---- him at the conference last year, but I forgot ---- him about the new schedule.$q$, array[$o$to meet / to tell$o$, $o$meeting / telling$o$, $o$meeting / to tell$o$, $o$meet / tell$o$, $o$to meet / telling$o$], 2, $e$1. Geçen yılki toplantıyı hatırlamak: **remember meeting**.
2. Söylemeyi unutmak, yani yapılacak işi atlamak: **forget to tell**.

Diğer şıklar: **A** geçmişte yapılmış eylem için remember + gerund gerekir / **B** yapılması gereken eylem için forget + infinitive gerekir / **D** remember sonrasında yalın fiil gelmez ve forget sonrasında to gerekir / **E** geçmişte yapılmış eylem için remember + gerund gerekir ve yapılması gereken eylem için forget + infinitive gerekir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The teacher made us ---- the essay again, and she let us ---- our dictionaries during the exam.$q$, array[$o$rewrite / use$o$, $o$to rewrite / use$o$, $o$rewrite / to use$o$, $o$rewriting / using$o$, $o$to rewrite / to use$o$], 0, $e$1. **Make somebody do** kalıbında yalın fiil kullanılır: **rewrite**.
2. **Let somebody do** kalıbında da yalın fiil kullanılır: **use**.

Diğer şıklar: **B** make sonrasında yalın fiil gelir / **C** let sonrasında yalın fiil gelir / **D** make sonrasında gerund gelmez ve let sonrasında gerund gelmez / **E** make sonrasında yalın fiil gelir ve let sonrasında yalın fiil gelir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$It's not worth ---- so much money on a car that you rarely use, and it's no use ---- about it now.$q$, array[$o$to spend / worrying$o$, $o$spending / to worry$o$, $o$spend / worry$o$, $o$spending / worrying$o$, $o$to spend / to worry$o$], 3, $e$1. **Be worth** sonrasında gerund gelir: **spending**.
2. **It's no use** sonrasında da gerund gelir: **worrying**.

Diğer şıklar: **A** not worth sonrasında gerund gelir / **B** no use sonrasında gerund gelir / **C** not worth sonrasında yalın fiil gelmez ve no use sonrasında yalın fiil gelmez / **E** not worth sonrasında gerund gelir ve no use sonrasında gerund gelir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$She was too tired ---- the report, so she asked her colleague ---- it for her.$q$, array[$o$finishing / to complete$o$, $o$to finish / completing$o$, $o$finish / complete$o$, $o$finishing / completing$o$, $o$to finish / to complete$o$], 4, $e$1. **Too + sıfat + to-infinitive** kalıbı: **to finish**.
2. **Ask somebody to do** kalıbı: **to complete**.

Diğer şıklar: **A** too + sıfat sonrasında to-infinitive gelir / **B** ask somebody sonrasında to-infinitive gelir / **C** too + sıfat sonrasında yalın fiil gelmez ve ask somebody sonrasında to gerekir / **D** too + sıfat sonrasında to-infinitive gelir ve ask somebody sonrasında to-infinitive gelir.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$He is used to ---- up early, but he isn't used to ---- in a noisy office.$q$, array[$o$getting / working$o$, $o$get / working$o$, $o$getting / work$o$, $o$to get / to work$o$, $o$get / work$o$], 0, $e$1. **Be used to** kalıbında **to** edattır ve gerund gelir: **getting** ve **working**.

Diğer şıklar: **B** be used to sonrasında gerund gelir / **C** be used to sonrasında gerund gelir / **D** be used to sonrasında gerund gelir ve be used to sonrasında gerund gelir / **E** be used to sonrasında gerund gelir ve be used to sonrasında gerund gelir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$The manager wanted the project ---- by Friday, so he told the team ---- overtime.$q$, array[$o$being finished / to work$o$, $o$to be finished / working$o$, $o$to be finished / to work$o$, $o$finishing / work$o$, $o$to finish / work$o$], 2, $e$1. Proje bitirilecek bir nesnedir: **want something to be finished**.
2. **Tell somebody to do** kalıbı: **to work**.

Diğer şıklar: **A** want something sonrasında being kullanılmaz / **B** tell somebody sonrasında to-infinitive gelir / **D** want something sonrasında gerund gelmez ve tell somebody sonrasında to gerekir / **E** proje işi yapan değildir, edilgen gerekir ve tell somebody sonrasında to gerekir.$e$, 3),
  (12, 'ydt-dil', null::integer, $q$I'd rather ---- at home tonight than ---- to a crowded restaurant.$q$, array[$o$to stay / go$o$, $o$stay / going$o$, $o$staying / to go$o$, $o$stay / go$o$, $o$to stay / going$o$], 3, $e$1. **Would rather** sonrasında yalın fiil gelir: **stay**.
2. **Than** sonrasında da yalın fiil kullanılır: **go**.

Diğer şıklar: **A** would rather sonrasında yalın fiil gelir / **B** than sonrasında paralel yalın fiil gelir / **C** would rather sonrasında gerund gelmez ve than sonrasında paralel yalın fiil gelir / **E** would rather sonrasında yalın fiil gelir ve than sonrasında paralel yalın fiil gelir.$e$, 3),
  (13, 'ydt-dil', null::integer, $q$I regret ---- you that the flight has been cancelled, and I regret ---- the tickets so early.$q$, array[$o$informing / buying$o$, $o$to inform / buying$o$, $o$to inform / to buy$o$, $o$inform / buy$o$, $o$informing / to buy$o$], 1, $e$1. Üzücü bir haberi vermek: **regret to inform**.
2. Geçmişte yapılan bir eylemden pişmanlık: **regret buying**.

Diğer şıklar: **A** haber vermenin acısı için regret + to-infinitive gerekir / **C** geçmişte yapılan eylemden pişmanlık için regret + gerund gerekir / **D** regret sonrasında to gerekir ve regret sonrasında yalın fiil gelmez / **E** haber vermenin acısı için regret + to-infinitive gerekir ve geçmişte yapılan eylemden pişmanlık için regret + gerund gerekir.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$On ---- the news, she burst into tears, and after ---- herself she called her mother.$q$, array[$o$to hear / calming$o$, $o$hearing / to calm$o$, $o$hear / calm$o$, $o$to hear / to calm$o$, $o$hearing / calming$o$], 4, $e$1. **On** edatından sonra gerund gelir: **hearing**.
2. **After** edatından sonra da gerund gelir: **calming**.

Diğer şıklar: **A** on sonrasında gerund gelir / **B** after sonrasında gerund gelir / **C** on sonrasında gerund gelir ve after sonrasında gerund gelir / **D** on sonrasında gerund gelir ve after sonrasında gerund gelir.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$It is important for children ---- enough sleep, and not ---- up too late.$q$, array[$o$getting / to stay$o$, $o$to get / staying$o$, $o$to get / to stay$o$, $o$get / stay$o$, $o$getting / staying$o$], 2, $e$1. **It is important for somebody to do** kalıbı: **to get**.
2. Olumsuz infinitive: **not to stay**.

Diğer şıklar: **A** it is important for somebody sonrasında to-infinitive gelir / **B** olumsuz infinitive not to + fiil biçimindedir / **D** it is important for somebody sonrasında to gerekir ve not sonrasında to gerekir / **E** it is important for somebody sonrasında to-infinitive gelir ve olumsuz infinitive not to + fiil biçimindedir.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$He seems ---- a lot of weight recently, and he appears ---- much happier.$q$, array[$o$losing / to be$o$, $o$to have lost / to be$o$, $o$to have lost / being$o$, $o$to lose / be$o$, $o$losing / being$o$], 1, $e$1. **Recently** geçmiş bir değişimi gösterir. **Seem** sonrasında perfect infinitive gelir: **to have lost**.
2. **Appear** sonrasında **to be** gelir.

Diğer şıklar: **A** seem sonrasında infinitive gelir / **C** appear sonrasında infinitive gelir / **D** recently geçmişi gösterir, perfect infinitive gerekir ve appear sonrasında to gerekir / **E** seem sonrasında infinitive gelir ve appear sonrasında infinitive gelir.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$The child was afraid of ---- alone in the dark, so his mother promised ---- the light on all night.$q$, array[$o$being / to leave$o$, $o$to be / to leave$o$, $o$being / leaving$o$, $o$be / leave$o$, $o$to be / leaving$o$], 0, $e$1. **Of** edatından sonra gerund gelir: **being**.
2. **Promise** sonrasında to-infinitive gelir: **to leave**.

Diğer şıklar: **B** afraid of sonrasında gerund gelir / **C** promise sonrasında infinitive gelir / **D** afraid of sonrasında gerund gelir ve promise sonrasında to gerekir / **E** afraid of sonrasında gerund gelir ve promise sonrasında infinitive gelir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$There is no point in ---- him again, because he has made it clear that he is unwilling ---- us.$q$, array[$o$to ask / to help$o$, $o$asking / helping$o$, $o$ask / help$o$, $o$asking / to help$o$, $o$to ask / helping$o$], 3, $e$1. **There is no point in** kalıbında gerund gelir: **asking**.
2. **Be unwilling** sonrasında to-infinitive gelir: **to help**.

Diğer şıklar: **A** no point in sonrasında gerund gelir / **B** unwilling sonrasında to-infinitive gelir / **C** no point in sonrasında gerund gelir ve unwilling sonrasında to gerekir / **E** no point in sonrasında gerund gelir ve unwilling sonrasında to-infinitive gelir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$She was accused of ---- the documents, but she denied ---- anything wrong.$q$, array[$o$to steal / doing$o$, $o$stealing / to do$o$, $o$steal / do$o$, $o$to steal / to do$o$, $o$stealing / doing$o$], 4, $e$1. **Accuse of** edatlı kalıbında gerund gelir: **stealing**.
2. **Deny** sonrasında gerund gelir: **doing**.

Diğer şıklar: **A** accuse of sonrasında gerund gelir / **B** deny sonrasında gerund gelir / **C** accuse of sonrasında gerund gelir ve deny sonrasında yalın fiil gelmez / **D** accuse of sonrasında gerund gelir ve deny sonrasında gerund gelir.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$I can't help ---- when I see him dance, and I can't afford ---- such an expensive ticket.$q$, array[$o$to laugh / to buy$o$, $o$laughing / to buy$o$, $o$laughing / buying$o$, $o$laugh / buy$o$, $o$to laugh / buying$o$], 1, $e$1. **Can't help** sonrasında gerund gelir: **laughing**.
2. **Afford** sonrasında to-infinitive gelir: **to buy**.

Diğer şıklar: **A** can't help sonrasında gerund gelir / **C** afford sonrasında infinitive gelir / **D** can't help sonrasında gerund gelir ve afford sonrasında to gerekir / **E** can't help sonrasında gerund gelir ve afford sonrasında infinitive gelir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Modals konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Modals konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Modals$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$You ---- eat so much fast food, because it is bad for your health, and you ---- try to cook at home more often.$q$, array[$o$mustn't / can$o$, $o$shouldn't / should$o$, $o$can't / might$o$, $o$shouldn't / may$o$, $o$needn't / could$o$], 1, $e$1. Sağlığa zararlı olduğu için olumsuz öneri verilir: **shouldn't**.
2. Evde yemek yapmak olumlu bir önerinin konusudur: **should**.

Diğer şıklar: **A** can öneri anlamı vermez / **C** might öneri anlamı vermez / **D** may öneri anlamı vermez / **E** needn't gerek yok anlamı verir, öneri değildir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The museum is closed on Mondays, so visitors ---- buy tickets on that day, and you ---- check the opening hours before you go.$q$, array[$o$needn't / can$o$, $o$mustn't / might$o$, $o$can't / should$o$, $o$don't have to / may$o$, $o$shouldn't / could$o$], 2, $e$1. Müze kapalı olduğu için bilet almak mümkün değildir: **can't**.
2. Çalışma saatlerini kontrol etmek bir öneridir: **should**.

Diğer şıklar: **A** needn't gerek yok anlamı verir, yasak değildir / **B** might öneri anlamı vermez / **D** gerek yok anlamı verir ve may öneri vermez / **E** ilk boşlukta olasılık ya da imkânsızlık gerekir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The lights are on and his coat is on the chair, so he ---- be in the building, but I am not sure whether he ---- have gone to the cafeteria.$q$, array[$o$can / must$o$, $o$should / can$o$, $o$may / must$o$, $o$must / can't$o$, $o$must / may$o$], 4, $e$1. Işık ve ceket güçlü kanıttır: **must**.
2. Kafeteryaya gitmesi emin olunmayan bir olasılıktır: **may have gone**.

Diğer şıklar: **A** can çıkarım için kullanılmaz / **B** should çıkarım yapmaz / **C** çıkarım gücü ters sıralanmıştır / **D** can't ikinci boşlukta aynı kanıtla çelişir.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$When I was a child, I ---- ride a bike, but I ---- swim until I was eleven.$q$, array[$o$could / couldn't$o$, $o$can / can't$o$, $o$could / wasn't able$o$, $o$must / shouldn't$o$, $o$might / mustn't$o$], 0, $e$1. Geçmişteki genel yetenek **could** ile anlatılır.
2. Yüzmeyi on bir yaşına kadar bilmemek **couldn't** ile anlatılır.

Diğer şıklar: **B** geçmiş yetenek için can kullanılmaz / **C** ikinci boşluk modal biçiminde olmalıdır / **D** yetenek bildirmez / **E** yetenek bildirmez.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The report was full of errors. The assistant ---- checked it more carefully before sending it to the director.$q$, array[$o$must have$o$, $o$should have$o$, $o$can have$o$, $o$would have$o$, $o$needn't have$o$], 1, $e$1. Geçmişte yapılmayan ve yapılması gereken bir işe **should have + V3** ile eleştiri yapılır.

Diğer şıklar: **A** çıkarım anlamı verir / **C** can have yapısı yoktur / **D** pişmanlık vermez / **E** gerek yoktu anlamı verir.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The exam was cancelled at the last minute, so we ---- studied all night, and now we ---- rest for a day or two.$q$, array[$o$can't have / must$o$, $o$mustn't have / need$o$, $o$can't have / mustn't$o$, $o$needn't have / can$o$, $o$couldn't have / should$o$], 3, $e$1. Gereksiz yere yapılmış bir eylem **needn't have + V3** ile anlatılır.
2. Dinlenebilme imkânı **can** ile verilir.

Diğer şıklar: **A** can't have geçmiş için olumsuz çıkarımdır, bağlama uymaz / **B** mustn't have yapısı yoktur / **C** can't have çıkarımdır / **E** couldn't have uygun değildir.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Visitors ---- touch the exhibits, as the staff will remove anyone who does, but they ---- take photographs without a flash.$q$, array[$o$don't have to / must$o$, $o$needn't / mustn't$o$, $o$can't / need$o$, $o$shouldn't / would$o$, $o$mustn't / may$o$], 4, $e$1. Dokunmak kesin olarak yasaktır: **mustn't**.
2. Flaşsız fotoğraf çekmek izne bağlıdır: **may**.

Diğer şıklar: **A** don't have to yasak bildirmez / **B** needn't yasak bildirmez ve mustn't izin vermez / **C** need izin bildirmez / **D** would izin bildirmez.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- you pass me the salt, please? Thank you. By the way, ---- I use your phone for a moment?$q$, array[$o$Must / should$o$, $o$Shall / must$o$, $o$Could / may$o$, $o$Need / will$o$, $o$Will / ought$o$], 2, $e$1. Kibar rica için **Could you** kullanılır.
2. İzin istemek için **may I** kullanılır.

Diğer şıklar: **A** must rica için kullanılmaz / **B** shall ricayı kibar bir biçimde sormaz / **D** need rica için kullanılmaz / **E** ought izin istemede kullanılmaz.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$He ---- have forgotten the meeting, because he is always very careful about his schedule, so there ---- be another reason.$q$, array[$o$must / can't$o$, $o$can't / must$o$, $o$may / should$o$, $o$should / may$o$, $o$might / can$o$], 1, $e$1. Dikkatli biri olduğu için unuttuğu neredeyse imkânsızdır: **can't have forgotten**.
2. Bu durumda başka bir neden olduğu çıkarılır: **must be**.

Diğer şıklar: **A** çıkarım yönü ters kurulmuştur / **C** may güçlü olumsuz çıkarım yapmaz / **D** should çıkarım yapmaz / **E** might güçlü çıkarım değildir.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$If I ---- you, I would apply for the job immediately, because it ---- be a great opportunity.$q$, array[$o$were / might$o$, $o$am / must$o$, $o$would be / can$o$, $o$had been / could$o$, $o$was / will$o$], 0, $e$1. **If I were you** kalıbı öneri verir.
2. Fırsatın büyük olabileceği olasılığı **might** ile anlatılır.

Diğer şıklar: **B** If I were you kalıbı gerekir / **C** if sonrasında would be kullanılmaz / **D** yanlış zaman yapısı / **E** will koşullu cümlede uyuşmaz.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$She is not at her desk. She ---- be in the meeting, or she ---- have gone out for lunch.$q$, array[$o$must / should$o$, $o$can't / must$o$, $o$should / can$o$, $o$may / might$o$, $o$will / need$o$], 3, $e$1. Elde kesin kanıt olmadığı için olasılık bildiren modaller kullanılır: **may** ve **might**.

Diğer şıklar: **A** çıkarım için kesin kanıt yoktur ve should çıkarım yapmaz / **B** ilk boşlukta olumsuz çıkarım uygun değildir / **C** kesin olmayan olasılık için uygun değildir / **E** need olasılık bildirmez.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$By the time he arrived, the guests ---- already left, so he ---- apologise to the host the next day.$q$, array[$o$should have / has to$o$, $o$can have / must$o$, $o$must have / had to$o$, $o$may have / needed$o$, $o$would have / had better$o$], 2, $e$1. Misafirlerin ayrıldığına dair güçlü çıkarım: **must have left**.
2. Geçmişte zorunluluk: **had to**.

Diğer şıklar: **A** should have burada çıkarım değildir / **B** can have yapısı yoktur / **D** need burada yükümlülük için uygun değildir / **E** would have çıkarım yapmaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$Children under ten ---- be accompanied by an adult, but those who are older ---- come alone if their parents agree.$q$, array[$o$may / must$o$, $o$can / need$o$, $o$should / might$o$, $o$would / can't$o$, $o$must / may$o$], 4, $e$1. Zorunluluk için **must** kullanılır.
2. İzin için **may** kullanılır.

Diğer şıklar: **A** izin ve zorunluluk yer değiştirmiştir / **B** need izin bildirmez / **C** might izin bildirmez / **D** would zorunluluk bildirmez.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$He speaks perfect English. He ---- have lived abroad for a long time, or else he ---- never be so fluent.$q$, array[$o$can / must$o$, $o$should / would$o$, $o$may / will$o$, $o$must / could$o$, $o$must / may$o$], 3, $e$1. Kusursuz İngilizce konuşmasından çıkarım yapılır: **must have lived**.
2. Aksi halde bu kadar akıcı olamazdı: **could never be**.

Diğer şıklar: **A** can çıkarım için kullanılmaz / **B** should çıkarım yapmaz / **C** will kesin çıkarım için uygun değildir / **E** ikinci boşlukta may olumsuz anlam vermez.$e$, 3),
  (15, 'ydt-dil', null::integer, $q$She is trying to lose weight, so she ---- eat sweets anymore, and she ---- exercise every morning.$q$, array[$o$mustn't / has to$o$, $o$can't / must$o$, $o$needn't / should$o$, $o$couldn't / may$o$, $o$shouldn't / can$o$], 0, $e$1. Kilo verirken tatlı yememek kuraldır: **mustn't**.
2. Her sabah egzersiz yapmak gerekliliktir: **has to**.

Diğer şıklar: **B** kısıtlama ve zorunluluk dengesi bozulmuştur / **C** needn't yasak bildirmez / **D** geçmiş zaman ve olasılık amaca uymaz / **E** can zorunluluk bildirmez.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Passengers ---- show their passports at the gate, but they ---- bring any food into the country.$q$, array[$o$mustn't / must$o$, $o$may / need$o$, $o$can / shouldn't$o$, $o$might / needn't$o$, $o$must / mustn't$o$], 4, $e$1. Pasaport göstermek zorunludur: **must**.
2. Gıda getirmek yasaktır: **mustn't**.

Diğer şıklar: **A** yasak ve zorunluluk ters yazılmıştır / **B** need yasak bildirmez / **C** can zorunluluk bildirmez / **D** might zorunluluk bildirmez.$e$, 1),
  (17, 'ydt-dil', null::integer, $q$I ---- to call him last night, but I forgot, and now he ---- be angry with me.$q$, array[$o$must / will$o$, $o$meant / might$o$, $o$would / can$o$, $o$could / should$o$, $o$meant / will$o$], 1, $e$1. Planlayıp yapmayan kişi için **meant to + V1** kullanılır.
2. Kızgın olma ihtimali **might** ile anlatılır.

Diğer şıklar: **A** must to yapısı yoktur / **C** would to yapısı yoktur / **D** could to yapısı yoktur / **E** will olasılık için uygun değildir.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The new employee ---- have understood the instructions, because he did everything perfectly, but his colleagues think he ---- have received help.$q$, array[$o$must / may$o$, $o$can't / must$o$, $o$should / can$o$, $o$might / needn't$o$, $o$may / will$o$], 0, $e$1. Her şeyi mükemmel yapması güçlü çıkarım gerektirir: **must have understood**.
2. Meslektaşlarının tahmini zayıf bir olasılıktır: **may have received**.

Diğer şıklar: **B** kanıtla çelişir / **C** should çıkarım yapmaz / **D** needn't çıkarım yapmaz / **E** will olasılık bildirmez.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Applicants ---- speak two foreign languages, but it ---- be an advantage if they can type fast.$q$, array[$o$can / must$o$, $o$would / need$o$, $o$might / should$o$, $o$must / can$o$, $o$may / will$o$], 3, $e$1. İki yabancı dil gereklidir: **must**.
2. Hızlı yazı yazmak avantaj olabilir: **can**.

Diğer şıklar: **A** yükümlülük ve imkân ters verilmiştir / **B** need avantaj bildirmez / **C** might zorunluluk bildirmez / **E** will olasılık bildirmez.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$When I was young, I ---- play outside until late at night, but now I ---- go to bed early.$q$, array[$o$can / had to$o$, $o$must / can$o$, $o$could / have to$o$, $o$should / could$o$, $o$might / need$o$], 2, $e$1. Geçmişte izin ya da serbestlik **could** ile anlatılır.
2. Şimdiki zorunluluk **have to** ile anlatılır.

Diğer şıklar: **A** zaman çelişir / **B** must geçmişte kullanılmaz / **D** should izin bildirmez / **E** need zorunluluk anlamını bozar.$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Participles konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Participles konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Participles$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The film was so ---- that most of the audience felt ---- by the end.$q$, array[$o$bored / bored$o$, $o$boring / boring$o$, $o$boring / bored$o$, $o$bore / to bore$o$, $o$to bore / bore$o$], 2, $e$1. Filmin özelliğini anlatır ve neden olan şeyi niteler: **boring**.
2. Seyircilerin hissettiği duygu için **bored** kullanılır.

Diğer şıklar: **A** filmi niteleyen sıfat -ing biçimi alır / **B** kişilerin hissettiği duygu -ed biçimi alır / **D** sıfat görevinde kullanılmaz ve feel sonrasında sıfat gerekir / **E** sıfat görevinde kullanılmaz ve feel sonrasında sıfat gerekir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$The ---- children were laughing at the ---- clown.$q$, array[$o$exciting / amusing$o$, $o$excited / amused$o$, $o$excite / amuse$o$, $o$to excite / to amuse$o$, $o$excited / amusing$o$], 4, $e$1. Çocuklar heyecanı hisseder: **excited**.
2. Palyaço başkalarını eğlendirir: **amusing**.

Diğer şıklar: **A** çocuklar heyecanı hisseden kişilerdir, -ed gerekir / **B** palyaço eğlendiren kişidir, -ing gerekir / **C** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz / **D** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$---- from the top of the hill, the village looks like a toy town, and ---- by thousands of tourists every year, it has become very crowded.$q$, array[$o$Seeing / visited$o$, $o$Seen / visiting$o$, $o$See / visit$o$, $o$Seen / visited$o$, $o$Having seen / to visit$o$], 3, $e$1. Köy görülen şeydir, edilgen participle gerekir: **Seen**.
2. Köy turistler tarafından ziyaret edilir: **visited**.

Diğer şıklar: **A** köy görülen şeydir, edilgen participle gerekir / **B** köy ziyaret edilendir, edilgen participle gerekir / **C** participle yapısı kurmaz ve participle yapısı kurmaz / **E** köy görülen şeydir, edilgen participle gerekir ve participle yapısı kurmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$---- the exam, the students left the hall quietly, and ---- tired, they went straight to bed.$q$, array[$o$Finished / feeling$o$, $o$Having finished / felt$o$, $o$Having finished / feeling$o$, $o$To finish / to feel$o$, $o$Be finished / have felt$o$], 2, $e$1. Önce sınavı bitirmişlerdir, sonra çıkmışlardır: **Having finished**.
2. Aynı anda yorgun hissetmeleri **feeling** ile anlatılır.

Diğer şıklar: **A** etken anlam için having + V3 gerekir / **B** etken anlam için -ing gerekir / **D** participle yapısı kurmaz ve participle yapısı kurmaz / **E** participle yapısı kurmaz ve participle yapısı kurmaz.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The woman ---- next to me on the plane was a famous singer, and the song ---- on the radio at the moment is her latest hit.$q$, array[$o$sitting / playing$o$, $o$sit / playing$o$, $o$sitting / play$o$, $o$to sit / to play$o$, $o$sat / be playing$o$], 0, $e$1. Kısaltılmış sıfat cümlesinde süren eylem -ing ile anlatılır: **sitting**.
2. **At the moment** devam eden eylemi gösterir: **playing**.

Diğer şıklar: **B** kısaltılmış sıfat cümlesinde yalın fiil kullanılmaz / **C** kısaltılmış sıfat cümlesinde yalın fiil kullanılmaz / **D** devam eden eylemi anlatmaz ve devam eden eylemi anlatmaz / **E** kısaltılmış sıfat cümlesinde geçmiş zaman kullanılmaz ve participle yapısı kurmaz.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$Not ---- what to do, he asked his teacher for advice, and ---- no answer, he decided to try again.$q$, array[$o$known / receiving$o$, $o$knowing / receiving$o$, $o$knowing / received$o$, $o$to know / to receive$o$, $o$know / receive$o$], 1, $e$1. Olumsuz participle clause: **Not knowing**.
2. Cevap alamamanın sonucu: **receiving no answer**.

Diğer şıklar: **A** etken anlam için -ing gerekir / **C** etken anlam için -ing gerekir / **D** participle yapısı kurmaz ve participle yapısı kurmaz / **E** participle yapısı kurmaz ve participle yapısı kurmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$The ---- bridge was closed to traffic, and the ---- news worried the residents.$q$, array[$o$damaging / shocking$o$, $o$damaged / shocked$o$, $o$damage / shock$o$, $o$damaged / shocking$o$, $o$to damage / to shock$o$], 3, $e$1. Köprü hasar görmüştür: **damaged**.
2. Haber insanlarda şok etkisi yaratır: **shocking**.

Diğer şıklar: **A** köprü hasar görendir, -ed gerekir / **B** haber şaşırtandır, -ing gerekir / **C** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz / **E** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$---- his keys at home, he had to wait outside for his wife, and ---- by the long wait, he fell asleep.$q$, array[$o$Having left / tired$o$, $o$Left / tired$o$, $o$Having left / tiring$o$, $o$To leave / tire$o$, $o$Leave / to tire$o$], 0, $e$1. Anahtarları bırakma, beklemeden öncedir: **Having left**.
2. Uzun beklemeden yorulan kişi için **tired** kullanılır.

Diğer şıklar: **B** etken anlam için having + V3 gerekir / **C** kişi yorulan taraftır, -ed gerekir / **D** participle yapısı kurmaz ve participle yapısı kurmaz / **E** participle yapısı kurmaz ve participle yapısı kurmaz.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$The problem ---- by the committee yesterday is very serious, and the people ---- in it are all experienced engineers.$q$, array[$o$discussing / involved$o$, $o$discussed / involving$o$, $o$to discuss / to involve$o$, $o$discuss / involve$o$, $o$discussed / involved$o$], 4, $e$1. Sorun tartışılmıştır, edilgen anlam: **discussed**.
2. İnsanlar işe dahil olanlardır: **involved**.

Diğer şıklar: **A** sorun tartışılandır, edilgen participle gerekir / **B** insanlar işin içinde yer alanlardır, edilgen participle gerekir / **C** geçmişteki edilgen anlamı vermez ve uygun yapı değildir / **D** kısaltılmış sıfat cümlesinde yalın fiil olmaz ve kısaltılmış sıfat cümlesinde yalın fiil olmaz.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$I heard the baby ---- upstairs, so I went to check, and I found the window ---- open.$q$, array[$o$cried / left$o$, $o$crying / leaving$o$, $o$crying / left$o$, $o$to cry / leave$o$, $o$been crying / to leave$o$], 2, $e$1. **Hear + nesne + -ing** eylemin sürdüğünü gösterir: **crying**.
2. Pencere açık bırakılmıştır: **left open**.

Diğer şıklar: **A** hear sonrasında geçmiş zaman gelmez / **B** pencere bırakılandır, edilgen participle gerekir / **D** hear sonrasında to gelmez ve uygun yapı değildir / **E** uygun yapı değildir ve uygun yapı değildir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$She spent the whole evening ---- her homework, and she had trouble ---- the last question.$q$, array[$o$to do / solving$o$, $o$doing / solving$o$, $o$doing / to solve$o$, $o$do / solve$o$, $o$done / solved$o$], 1, $e$1. **Spend time + -ing** kalıbı: **doing**.
2. **Have trouble + -ing** kalıbı: **solving**.

Diğer şıklar: **A** spend time sonrasında -ing gelir / **C** have trouble sonrasında -ing gelir / **D** spend time sonrasında -ing gelir ve have trouble sonrasında -ing gelir / **E** spend time sonrasında -ing gelir ve have trouble sonrasında -ing gelir.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$---- by the loud noise, the baby started crying, and the parents, ---- everything to calm him, finally gave up.$q$, array[$o$Frightening / trying$o$, $o$Frightened / tried$o$, $o$To frighten / to try$o$, $o$Frighten / try$o$, $o$Frightened / trying$o$], 4, $e$1. Bebek gürültüden korkutulmuştur: **Frightened**.
2. Ebeveynler her şeyi deniyordu: **trying**.

Diğer şıklar: **A** bebek korkutulandır, edilgen participle gerekir / **B** ebeveynler deneyen taraftır, -ing gerekir / **C** participle yapısı kurmaz ve participle yapısı kurmaz / **D** participle yapısı kurmaz ve participle yapısı kurmaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The athlete, ---- the race by a large margin, was lifted by his teammates, and the medal ---- to him was made of gold.$q$, array[$o$won / given$o$, $o$having won / giving$o$, $o$to win / to give$o$, $o$having won / given$o$, $o$win / give$o$], 3, $e$1. Yarışı kazanma, kaldırılmadan öncedir: **having won**.
2. Madalya ona verilmiştir: **given**.

Diğer şıklar: **A** etken anlam için having + V3 gerekir / **B** madalya verilendir, edilgen participle gerekir / **C** participle yapısı kurmaz ve uygun yapı değildir / **E** participle yapısı kurmaz ve kısaltılmış sıfat cümlesinde yalın fiil olmaz.$e$, 3),
  (14, 'ydt-dil', null::integer, $q$Most of the students ---- for the scholarship are from small towns, and the committee ---- the applications has already met.$q$, array[$o$applying / reviewing$o$, $o$applied / reviewing$o$, $o$applying / reviewed$o$, $o$being applied / being reviewed$o$, $o$apply / review$o$], 0, $e$1. Öğrenciler başvuruyu yapan taraftır: **applying**.
2. Komite başvuruları inceleyendir: **reviewing**.

Diğer şıklar: **B** etken anlam için -ing gerekir / **C** komite inceleyen taraftır, -ing gerekir / **D** öğrenciler başvuruyu yapan taraftır ve komite inceleyen taraftır / **E** kısaltılmış sıfat cümlesinde yalın fiil olmaz ve kısaltılmış sıfat cümlesinde yalın fiil olmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$It was a very ---- experience, and everyone felt ---- after the trip.$q$, array[$o$tired / exhausted$o$, $o$tiring / exhausted$o$, $o$tiring / exhausting$o$, $o$tire / exhaust$o$, $o$to tire / to exhaust$o$], 1, $e$1. Deneyim yorucudur: **tiring**.
2. İnsanlar yorgun hisseder: **exhausted**.

Diğer şıklar: **A** deneyim yorucudur, -ing gerekir / **C** insanlar yorgun hisseder, -ed gerekir / **D** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz / **E** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz.$e$, 2),
  (16, 'ydt-dil', null::integer, $q$Look at the ---- leaves on the ground, and don't touch the ---- glass.$q$, array[$o$fall / broken$o$, $o$fallen / broke$o$, $o$fell / break$o$, $o$to fall / to break$o$, $o$fallen / broken$o$], 4, $e$1. Yere düşmüş yapraklar için **fallen**.
2. Kırılmış cam için **broken**.

Diğer şıklar: **A** sıfat görevinde kullanılmaz / **B** sıfat görevinde kullanılmaz / **C** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz / **D** sıfat görevinde kullanılmaz ve sıfat görevinde kullanılmaz.$e$, 1),
  (17, 'ydt-dil', null::integer, $q$With the weather ---- worse every day, the farmers were worried, and with the harvest ---- soon, they needed more workers.$q$, array[$o$getting / starting$o$, $o$get / starting$o$, $o$getting / start$o$, $o$got / started$o$, $o$to get / begun$o$], 0, $e$1. **With + nesne + -ing** eşzamanlı durumu anlatır: **getting** ve **starting**.

Diğer şıklar: **B** with + nesne + -ing yapısı gerekir / **C** with + nesne + -ing yapısı gerekir / **D** with + nesne + -ing yapısı gerekir ve hasat başlayacak, edilgen anlam yok / **E** with + nesne + -ing yapısı gerekir ve hasat başlayacak, edilgen anlam yok.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$---- from my window, the sea looks calm, but ---- there for years, I know how dangerous it is.$q$, array[$o$Seeing / having lived$o$, $o$Seen / having lived$o$, $o$Seen / lived$o$, $o$See / to live$o$, $o$Having seen / live$o$], 1, $e$1. Deniz pencereden görülür: **Seen**.
2. Yıllarca orada yaşamak önceden olmuştur: **having lived**.

Diğer şıklar: **A** deniz görülendir, edilgen participle gerekir / **C** etken anlam ve önceliği anlatmak için having + V3 gerekir / **D** participle yapısı kurmaz ve participle yapısı kurmaz / **E** deniz görülendir, edilgen participle gerekir ve participle yapısı kurmaz.$e$, 2),
  (19, 'ydt-dil', null::integer, $q$Not ---- his phone number, I couldn't call him, and ---- no other way to reach him, I wrote a letter.$q$, array[$o$have / seeing$o$, $o$having / saw$o$, $o$having / seeing$o$, $o$to have / see$o$, $o$had / to see$o$], 2, $e$1. Olumsuz participle clause: **Not having**.
2. Başka yol görmeyince mektup yazmıştır: **seeing no other way**.

Diğer şıklar: **A** olumsuz participle clause -ing ister / **B** participle yapısı kurmaz / **D** olumsuz participle clause -ing ister ve participle yapısı kurmaz / **E** olumsuz participle clause -ing ister ve participle yapısı kurmaz.$e$, 3),
  (20, 'ydt-dil', null::integer, $q$The students ---- the cheapest tickets had to stand, while those ---- the expensive ones sat comfortably.$q$, array[$o$bought / holding$o$, $o$buying / held$o$, $o$to buy / to hold$o$, $o$buying / holding$o$, $o$buy / hold$o$], 3, $e$1. Kısaltılmış sıfat cümlesinde etken anlam -ing ile verilir: **buying** ve **holding**.

Diğer şıklar: **A** kısaltılmış sıfat cümlesinde -ing gerekir / **B** kısaltılmış sıfat cümlesinde -ing gerekir / **C** devam eden ya da etken anlamı vermez ve devam eden ya da etken anlamı vermez / **E** kısaltılmış sıfat cümlesinde -ing gerekir ve kısaltılmış sıfat cümlesinde -ing gerekir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Passive Voice konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Passive Voice konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Passive Voice$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$The new bridge ---- by a Turkish company in 2018, and it ---- by thousands of drivers every day.$q$, array[$o$built / uses$o$, $o$is built / was used$o$, $o$has built / used$o$, $o$was building / is using$o$, $o$was built / is used$o$], 4, $e$1. **In 2018** geçmiştir ve köprüyü inşa edenler belirsizdir: **was built**.
2. **Every day** düzenli bir durumdur: **is used**.

Diğer şıklar: **A** etken yapı nesneyle uyuşmaz / **B** zamanlar ters verilmiştir / **C** etken biçimdedir / **D** etken biçimdedir.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$English ---- all over the world, and it ---- as a second language in many countries.$q$, array[$o$speaks / teaches$o$, $o$was spoken / has taught$o$, $o$is speaking / is teaching$o$, $o$is spoken / is taught$o$, $o$spoke / was teaching$o$], 3, $e$1. Genel gerçekler Present Simple ile anlatılır ve fail belirsizdir: **is spoken** ve **is taught**.

Diğer şıklar: **A** etken biçim uygun değildir / **B** zaman ve çatı uyuşmaz / **C** etken biçimdedir / **E** etken biçim uygun değildir.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$The documents ---- on the desk by the secretary last night, but they ---- yet.$q$, array[$o$were left / haven't been signed$o$, $o$left / haven't signed$o$, $o$are left / aren't signed$o$, $o$were leaving / didn't sign$o$, $o$have been left / weren't signed$o$], 0, $e$1. **Last night** bitmiş zamandır ve edilgen Simple Past gerekir: **were left**.
2. **Yet** olumsuz cümlede Present Perfect ister: **haven't been signed**.

Diğer şıklar: **B** etken biçim yanlıştır / **C** last night ile uyumsuzdur / **D** etken biçimdedir / **E** last night ile Present Perfect olmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The thief is said ---- the necklace from the jeweller's, but nothing ---- yet.$q$, array[$o$to steal / is proved$o$, $o$to have stolen / has been proved$o$, $o$stealing / proved$o$, $o$to be stolen / was proving$o$, $o$having stolen / will be proved$o$], 1, $e$1. **Be said to** yapısında geçmiş eylem **to have + V3** ile anlatılır.
2. **Yet** ile edilgen Present Perfect gerekir: **has been proved**.

Diğer şıklar: **A** geçmiş eylem için perfect infinitive gerekir / **C** said sonrasında gerund kullanılmaz / **D** etken ve edilgen karışmıştır / **E** said sonrası uygun yapı değildir.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$The report ---- by the end of this week, so the manager ---- the final decision tomorrow.$q$, array[$o$will complete / will be made$o$, $o$completes / makes$o$, $o$will have been completed / will make$o$, $o$is completed / is making$o$, $o$has been completed / has made$o$], 2, $e$1. **By the end of this week** gelecekteki bir ana kadar tamamlanmayı gösterir: **will have been completed**.
2. Karar yarın verilecektir: **will make**.

Diğer şıklar: **A** etken ve edilgen karışmıştır / **B** gelecek bir ana kadar tamamlanma anlatılmaz / **D** by the end of ile Future Perfect gerekir / **E** tomorrow ile Present Perfect olmaz.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$The old castle ---- every summer for the past ten years, and a new section ---- next month.$q$, array[$o$has been restored / will be opened$o$, $o$is restoring / will be opening$o$, $o$restored / will open up$o$, $o$was restored / has been opened$o$, $o$restores / was being opened$o$], 0, $e$1. **For the past ten years** şimdiye kadar süren dönemi gösterir: **has been restored**.
2. **Next month** gelecekte bir zamandır: **will be opened**.

Diğer şıklar: **B** etken biçimdedir / **C** etken biçimdedir / **D** for the past ten years ile Simple Past olmaz / **E** zaman uyumu yoktur.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$He was angry because he ---- by his colleagues, and he said that the plan ---- without him.$q$, array[$o$did not invite / made$o$, $o$has not been invited / is made$o$, $o$was not invited / makes$o$, $o$had not invited / was making$o$, $o$had not been invited / had been made$o$], 4, $e$1. Öfkeden önce gerçekleşen eylem Past Perfect ile anlatılır ve edilgendir: **had not been invited**.
2. Plan öncesinde yapılmıştır: **had been made**.

Diğer şıklar: **A** etken biçimdedir / **B** geçmiş öncelik anlatılmaz / **C** zaman uyumu yoktur / **D** etken biçimdedir.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$The students ---- to submit their projects before Friday, and the best one ---- on the school website.$q$, array[$o$told / publishes$o$, $o$are telling / is published$o$, $o$have told / will publish$o$, $o$were told / will be published$o$, $o$were telling / has published$o$], 3, $e$1. Öğrencilere söylenmiştir: **were told**.
2. En iyi proje yayımlanacaktır: **will be published**.

Diğer şıklar: **A** edilgen yapı gerekir / **B** etken biçimdedir / **C** etken biçimdedir / **E** etken biçimdedir.$e$, 2),
  (9, 'ydt-dil', null::integer, $q$By the time the guests ----, the table ---- by the waiters.$q$, array[$o$arrive / is set$o$, $o$arrived / had been set$o$, $o$had arrived / was setting$o$, $o$were arriving / has set$o$, $o$have arrived / was being set$o$], 1, $e$1. **By the time** bağlı cümlesinde Simple Past gelir: **arrived**.
2. Masa misafirlerden önce hazırlanmıştır: **had been set**.

Diğer şıklar: **A** geçmiş cümlede Present Simple olmaz / **C** etken biçimdedir / **D** etken biçimdedir / **E** by the time ile Present Perfect olmaz.$e$, 3),
  (10, 'ydt-dil', null::integer, $q$He is believed ---- the country last month, and the police ---- him since then.$q$, array[$o$to have left / have been looking for$o$, $o$to leave / looked for$o$, $o$leaving / are looked for$o$, $o$to be left / have looked$o$, $o$having left / were looking for$o$], 0, $e$1. **Is believed to have left** geçmişte olduğuna inanılan eylemi anlatır.
2. **Since then** Present Perfect ister: **have been looking for**.

Diğer şıklar: **B** geçmiş için perfect infinitive gerekir / **C** said sonrası gerund olmaz / **D** etken ve edilgen karışmıştır / **E** since then Present Perfect ister.$e$, 3),
  (11, 'ydt-dil', null::integer, $q$When I arrived at the airport, my luggage ---- , so I ---- a complaint form.$q$, array[$o$lost / was filling out$o$, $o$was losing / fill out$o$, $o$had been lost / filled out$o$, $o$has been lost / have filled out$o$, $o$would lose / filled out$o$], 2, $e$1. Bagaj varıştan önce kaybolmuştur: **had been lost**.
2. Daha sonra form doldurulmuştur: **filled out**.

Diğer şıklar: **A** edilgen yapı gerekir / **B** etken biçimdedir / **D** geçmiş öncelik anlatılmaz / **E** yanlış yapı.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$A lot of cars ---- in this factory every year, but the new model ---- yet.$q$, array[$o$produce / didn't announce$o$, $o$were produced / isn't announced$o$, $o$produced / hasn't announced$o$, $o$are producing / hadn't been announced$o$, $o$are produced / hasn't been announced$o$], 4, $e$1. **Every year** düzenli işi gösterir: **are produced**.
2. **Yet** Present Perfect ister: **hasn't been announced**.

Diğer şıklar: **A** etken biçimdedir / **B** every year ile Simple Past olmaz / **C** etken biçimdedir / **D** etken biçimdedir.$e$, 1),
  (13, 'ydt-dil', null::integer, $q$The new law ---- next year, and everyone ---- of the changes by the government.$q$, array[$o$introduces / is informing$o$, $o$is introducing / is being informed$o$, $o$will introduce / will inform$o$, $o$will be introduced / will be informed$o$, $o$introduced / will be informed$o$], 3, $e$1. Kanun gelecekte yürürlüğe girer: **will be introduced**.
2. Herkes bilgilendirilecektir: **will be informed**.

Diğer şıklar: **A** etken biçimdedir / **B** etken biçimdedir / **C** etken biçimdedir / **E** next year ile Simple Past olmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$The windows ---- at the moment, so the office ---- until the work finishes.$q$, array[$o$are cleaning / will be closing$o$, $o$were cleaned / was being closed$o$, $o$are being cleaned / will be closed$o$, $o$have been cleaned / closes down$o$, $o$cleans / is closing down$o$], 2, $e$1. **At the moment** şu an süren eylemdir: **are being cleaned**.
2. Kapalı kalacak ofis: **will be closed**.

Diğer şıklar: **A** etken biçimdedir / **B** at the moment ile geçmiş olmaz / **D** at the moment sürmekte olan eylemdir / **E** etken biçimdedir.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$The manager ---- to the new position next week, and he ---- his office by tomorrow noon.$q$, array[$o$promotes / left$o$, $o$will be promoted / will have left$o$, $o$is promoted / has left$o$, $o$has promoted / will leave$o$, $o$was promoted / will be leaving$o$], 1, $e$1. Gelecekte terfi alacaktır: **will be promoted**.
2. **By tomorrow noon** gelecekteki bir ana kadar tamamlanan eylemi gösterir: **will have left**.

Diğer şıklar: **A** edilgen yapı gerekir / **C** next week ile Present Simple olmaz / **D** etken biçimdedir / **E** next week ile Simple Past olmaz.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$She doesn't like ---- when people shout at her, and she hates ---- while she is working.$q$, array[$o$to shout at / to be interrupted$o$, $o$shouting at someone / to interrupt$o$, $o$to be shouted / interrupting$o$, $o$having shouted at / interrupted$o$, $o$being shouted at / being interrupted$o$], 4, $e$1. **Like** ve **hate** sonrasında kişi eylemin nesnesiyse edilgen gerund kullanılır: **being shouted at** ve **being interrupted**.

Diğer şıklar: **A** edilgen gerund gerekir / **B** edilgen gerund gerekir / **C** yanlış yapı / **D** yanlış yapı.$e$, 2),
  (17, 'ydt-dil', null::integer, $q$The package ---- yesterday, but it ---- to the wrong address.$q$, array[$o$supposed to deliver / sent$o$, $o$is supposed to be delivered / sends$o$, $o$was supposed to be delivered / was sent$o$, $o$was delivering / has sent$o$, $o$had delivered / was sending$o$], 2, $e$1. Teslim edilmesi beklenen paket **was supposed to be delivered** ile anlatılır.
2. Yanlış adrese gönderilmiştir: **was sent**.

Diğer şıklar: **A** edilgen yapı gerekir / **B** yesterday ile Present olmaz / **D** yanlış zaman ve çatı / **E** etken biçimdedir.$e$, 2),
  (18, 'ydt-dil', null::integer, $q$The report ---- by the committee for weeks, but no decision ---- yet.$q$, array[$o$has been discussed / has been taken$o$, $o$is discussing / is taking$o$, $o$was discussed / was being taken$o$, $o$had discussed / has been taking$o$, $o$discusses / is being taken$o$], 0, $e$1. **For weeks** şimdiye kadar süren dönemi gösterir: **has been discussed**.
2. **Yet** ile edilgen Present Perfect gerekir: **has been taken**.

Diğer şıklar: **B** etken biçimdedir / **C** yet ile Simple Past olmaz / **D** etken biçimdedir / **E** for weeks ile Present Simple olmaz.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Nobody knows who ---- the first telephone, but it ---- that Bell was the first to patent it.$q$, array[$o$invents / says$o$, $o$was invented / is saying$o$, $o$has invented / said$o$, $o$invented / is said$o$, $o$had invented / was said$o$], 3, $e$1. İlk telefonu icat eden kişi sorulmaktadır: **invented**.
2. Genel kanı edilgen yapıyla verilir: **is said**.

Diğer şıklar: **A** geçmişteki eylemi anlatmaz / **B** who sonrası etken geçmiş gerekir / **C** yanlış zaman / **E** zaman uyumu yoktur.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$The old factory ---- into a museum last year, and it ---- by more than 200,000 visitors since then.$q$, array[$o$converted / visited$o$, $o$was converted / has been visited$o$, $o$has been converted / was visited$o$, $o$is converted / had been visited$o$, $o$was converting / is visiting$o$], 1, $e$1. **Last year** bitmiş bir zamandır ve fabrikayı biri dönüştürmüştür: **was converted**.
2. **Since then** şimdiye kadar süren dönemi gösterir: **has been visited**.

Diğer şıklar: **A** etken biçimdedir / **C** last year ile Present Perfect olmaz ve since then Present Perfect ister / **D** last year ile Present Simple olmaz / **E** etken biçimdedir.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Pronouns konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Pronouns konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Pronouns$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Sarah and I have known ---- for ten years, and I trust ---- completely.$q$, array[$o$each other / her$o$, $o$ourselves / hers$o$, $o$one another / she$o$, $o$themselves / herself$o$, $o$each others / her$o$], 0, $e$1. Sarah ile ben birbirimizi tanıyoruz. Karşılıklı eylem **each other** ile anlatılır.
2. İkinci boşuk fiilin nesnesidir ve Sarah'ı gösterir: **her**.

Diğer şıklar: **B** ourselves karşılıklı eylemi anlatmaz ve hers isimsiz kullanılmaz / **C** she nesne yerinde kullanılmaz / **D** themselves özneyle uyuşmaz ve herself özne dışındaki kişiyi göstermez / **E** each others biçimi yoktur.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$He cut ---- while he was chopping onions, but the knife was not ----, it belonged to his brother.$q$, array[$o$him / his$o$, $o$himself / his$o$, $o$himself / him$o$, $o$his / himself$o$, $o$itself / her$o$], 1, $e$1. Özne ile nesne aynı kişidir. Yansıma zamiri gerekir: **himself**.
2. Bıçak başka birine aittir ve sahiplik bildiren isimsiz zamir gerekir: **his**.

Diğer şıklar: **A** özne ile nesne aynı kişiyse yansıma zamiri gerekir / **C** him sahiplik bildirmez / **D** his nesne olamaz ve himself sahiplik bildirmez / **E** özneyle uyuşmaz.$e$, 1),
  (3, 'ydt-dil', null::integer, $q$---- of the two candidates was qualified for the position, so the committee rejected ----.$q$, array[$o$Both / neither$o$, $o$Either / both$o$, $o$None / either$o$, $o$Neither / both$o$, $o$All / neither$o$], 3, $e$1. İki kişiden söz edilirken **neither** (ikisi de değil) kullanılır ve fiil tekildir: **was**.
2. Hiçbiri uygun olmadığı için komite ikisini de reddetmiştir: **both**.

Diğer şıklar: **A** both ile was kullanılmaz ve anlam çelişir / **B** either olumlu anlam verir, ret mantığı bozulur / **C** none iki kişi için kullanılmaz / **E** all iki kişi için kullanılmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$The company has launched a new product, and ---- is expected to increase ---- annual profit significantly.$q$, array[$o$it / it's$o$, $o$its / its$o$, $o$itself / its$o$, $o$which / itself$o$, $o$it / its$o$], 4, $e$1. Önceki cümledeki ürünün yerine **it** gelir ve özne olur.
2. Şirketin yıllık kârı için sahiplik sıfatı gerekir: **its**.

Diğer şıklar: **A** it's it is demektir, sahiplik bildirmez / **B** its özne olamaz / **C** itself özne olamaz / **D** which burada özne olarak cümleyi bağlamaz ve itself sahiplik bildirmez.$e$, 2),
  (5, 'ydt-dil', null::integer, $q$I lost my umbrella yesterday, so Tom lent me ----. It was a little too small, but I was happy with ----.$q$, array[$o$his / it$o$, $o$he / it$o$, $o$him / them$o$, $o$himself / its$o$, $o$his / them$o$], 0, $e$1. Tom'un şemsiyesi için isimsiz sahiplik zamiri gerekir: **his**.
2. Şemsiye tekildir ve nesne olarak **it** kullanılır.

Diğer şıklar: **B** he nesne olarak kullanılmaz / **C** him sahiplik bildirmez ve them tekil nesneye uymaz / **D** himself uygun değildir ve its nesne olamaz / **E** them tek şemsiyeyi göstermez.$e$, 2),
  (6, 'ydt-dil', null::integer, $q$---- who want to apply for the scholarship must submit ---- documents before the deadline.$q$, array[$o$Them / his$o$, $o$These / theirs$o$, $o$They / them$o$, $o$Those / their$o$, $o$Ones / its$o$], 3, $e$1. Belirli olmayan insan grubu için **those who** kalıbı kullanılır.
2. **Documents** isminden önce sahiplik sıfatı gelir: **their**.

Diğer şıklar: **A** them özne olamaz / **B** theirs isimle kullanılmaz / **C** they who kalıbı bu yapıda kullanılmaz / **E** ones tek başına özne olmaz.$e$, 2),
  (7, 'ydt-dil', null::integer, $q$Many students enjoy studying in groups, but ---- prefer to study by ----.$q$, array[$o$other / themselves$o$, $o$some / them$o$, $o$some / themselves$o$, $o$another / themselves$o$, $o$one / herself$o$], 2, $e$1. Öğrencilerin bir kısmı için **some** kullanılır ve çoğul fiille uyar: **prefer**.
2. **By + yansıma zamiri** tek başına anlamı verir: **by themselves**.

Diğer şıklar: **A** other tek başına özne olmaz / **B** by ile yansıma zamiri gerekir / **D** another tekil bir ismi gösterir ve prefer ile uyuşmaz / **E** one tekil olduğu için prefer ile uyuşmaz.$e$, 2),
  (8, 'ydt-dil', null::integer, $q$This laptop is much better than ---- I had last year, and I will give my old one to ---- who needs it.$q$, array[$o$that / whoever$o$, $o$the one / anyone$o$, $o$the ones / anybody$o$, $o$it / someone$o$, $o$one / those$o$], 1, $e$1. Önceden bahsedilen tek bir nesne için **the one** kullanılır.
2. **Who needs it** kısmı bir kişiyi tarif eder: **anyone**.

Diğer şıklar: **A** than that I had hatalı ve whoever who birlikte kullanılmaz / **C** the ones çoğuldur, laptop tekil / **D** it karşılaştırmada kullanılmaz / **E** one belirtisizdir ve those who beklenir.$e$, 3),
  (9, 'ydt-dil', null::integer, $q$I met a friend of ---- yesterday, and ---- told me about the new project.$q$, array[$o$me / she$o$, $o$my / she$o$, $o$mine / her$o$, $o$me / her$o$, $o$mine / she$o$], 4, $e$1. **A friend of + sahiplik zamiri** kalıbında **mine** kullanılır.
2. İkinci boşluk özne olduğundan **she** gerekir.

Diğer şıklar: **A** of sonrası sahiplik zamiri gerekir / **B** a friend of my biçimi yoktur / **C** her özne olamaz / **D** of sonrası sahiplik zamiri gerekir ve her özne olamaz.$e$, 1),
  (10, 'ydt-dil', null::integer, $q$The weather in the north is colder than ---- in the south, and the winters are much longer than ---- in Spain.$q$, array[$o$those / that$o$, $o$it / them$o$, $o$this / these$o$, $o$that / those$o$, $o$that / that$o$], 3, $e$1. Önceki isme tekrar yapmadan atıf yapmak için **that of** ya da **that in** kullanılır: **weather** tekildir, **that**.
2. **Winters** çoğuldur, **those**.

Diğer şıklar: **A** weather tekil, winters çoğuldur / **B** karşılaştırmada it ve them kullanılmaz / **C** yakınlık göstermez, karşılaştırmaya uymaz / **E** winters çoğul olduğu için those gerekir.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$---- is believed that the ancient city was destroyed by an earthquake, but ---- has been proved yet.$q$, array[$o$There / anything$o$, $o$That / something$o$, $o$It / nothing$o$, $o$What / none$o$, $o$It / anything$o$], 2, $e$1. **It is believed that** kalıbı kullanılır: **It**.
2. **Yet** olumsuz anlam taşır. Özne olarak **nothing** gerekir.

Diğer şıklar: **A** there is believed kalıbı yoktur / **B** that burada kalıbı kurmaz / **D** what is believed anlamı bozar / **E** anything olumlu özne olarak yet ile uyuşmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$There isn't ---- in the office, but ---- left a note on your desk.$q$, array[$o$someone / anyone$o$, $o$no one / someone$o$, $o$someone / nobody$o$, $o$nobody / anyone$o$, $o$anyone / someone$o$], 4, $e$1. Olumsuz cümlede **anyone** kullanılır.
2. **But** sonrasında not bırakan biri vardır ve olumlu cümlede **someone** kullanılır.

Diğer şıklar: **A** olumsuz cümlede anyone, olumlu cümlede someone beklenir / **B** isn't ile no one çift olumsuzluk yapar / **C** olumsuz cümlede someone kullanılmaz / **D** isn't ile nobody çift olumsuzluk yapar.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$The prime minister, ---- speech was broadcast live, thanked all of ---- who had supported him.$q$, array[$o$who / them$o$, $o$whom / ones$o$, $o$which / these$o$, $o$whose / those$o$, $o$whose / them$o$], 3, $e$1. Konuşmanın sahibi başbakandır, sahiplik için **whose**.
2. Bir grubu tarif eden **who** öncesinde **those** gelir.

Diğer şıklar: **A** who sahiplik bildirmez ve them who kalıbı yoktur / **B** whom sahiplik bildirmez / **C** which kişi için kullanılmaz / **E** them who kalıbı yoktur.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$I don't like this jacket. Could you show me ---- one, please? And ---- of them is available in red?$q$, array[$o$another / which$o$, $o$other / which$o$, $o$others / what$o$, $o$the another / who$o$, $o$another / what$o$], 0, $e$1. Başka bir tane istemek için **another one** kullanılır.
2. Seçenekler arasından seçmek için **which of them** sorulur.

Diğer şıklar: **B** other one biçimi tekil isimle kullanılmaz / **C** others çoğul olup one ile uyuşmaz / **D** the another biçimi yoktur / **E** what seçenekten seçmeyi sormaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Tom doesn't have many friends, so he spends most of his time by ----, but ---- doesn't mind it.$q$, array[$o$him / he$o$, $o$himself / him$o$, $o$himself / he$o$, $o$oneself / he$o$, $o$itself / himself$o$], 2, $e$1. **By himself** tek başına anlamı verir.
2. İkinci boşluk özne olduğundan **he** gerekir.

Diğer şıklar: **A** by ile yansıma zamiri gerekir / **B** him özne olamaz / **D** oneself genel özneyle kullanılır, Tom ile uyuşmaz / **E** itself kişi için kullanılmaz ve himself özne olamaz.$e$, 3),
  (16, 'ydt-dil', null::integer, $q$My brother prefers to do everything ----, but my sister always asks ---- for help.$q$, array[$o$him / others$o$, $o$himself / others$o$, $o$himself / other$o$, $o$his / another$o$, $o$he / others$o$], 1, $e$1. Özne ile eylemi yapan aynı kişidir. Yansıma zamiri gerekir: **himself**.
2. Başka insanlardan yardım istemek için **others** kullanılır.

Diğer şıklar: **A** yansıma zamiri gerekir / **C** other tek başına nesne olmaz / **D** his nesne olamaz ve another tekildir / **E** he nesne olarak kullanılmaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$There were three proposals, but ---- of them was acceptable, so we asked ---- to prepare another.$q$, array[$o$neither / them$o$, $o$none / themselves$o$, $o$any / they$o$, $o$no / them$o$, $o$none / them$o$], 4, $e$1. Üç seçenek söz konusu olduğunda hiçbiri için **none** kullanılır.
2. Teklif sahiplerinden istendiği için nesne zamiri gerekir: **them**.

Diğer şıklar: **A** neither iki seçenek için kullanılır / **B** themselves nesne olarak uygun değildir / **C** any olumlu cümlede uyumsuzdur ve they nesne olamaz / **D** no of them kalıbı yoktur.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$The researchers argue that ---- is no evidence for the theory, which ---- have tested for years.$q$, array[$o$it / they$o$, $o$that / them$o$, $o$there / they$o$, $o$there / them$o$, $o$it / them$o$], 2, $e$1. Varlık anlatmak için **there is** kalıbı kullanılır.
2. Teoriyi test edenler araştırmacılardır. Özne olarak **they** gerekir.

Diğer şıklar: **A** it is no evidence anlamlı değildir / **B** that burada özne gerektirmez ve them özne olamaz / **D** them özne olamaz / **E** it ve them kullanımı uyumsuzdur.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$We enjoyed ---- a lot at the party, and Jack introduced ---- to his cousins.$q$, array[$o$ourselves / us$o$, $o$us / ourselves$o$, $o$we / us$o$, $o$ourselves / ourselves$o$, $o$us / us$o$], 0, $e$1. **Enjoy oneself** kalıbında yansıma zamiri kullanılır: **ourselves**.
2. Jack bizi tanıştırmıştır, nesne zamiri gerekir: **us**.

Diğer şıklar: **B** enjoy yansıma zamiri ister ve introduced nesne zamiri ister / **C** we nesne olamaz / **D** Jack tanıştırdığı için nesne zamiri gerekir / **E** enjoy sonrası yansıma zamiri gerekir.$e$, 2),
  (20, 'ydt-dil', null::integer, $q$My phone is old, but ---- works well. Yours is newer than ----.$q$, array[$o$they / my$o$, $o$it / mine$o$, $o$it / me$o$, $o$its / mine$o$, $o$them / my$o$], 1, $e$1. Telefon tekildir ve özne olarak **it** gelir.
2. Karşılaştırmada sahiplik zamiri kullanılır: **than mine**.

Diğer şıklar: **A** they tekil telefona uymaz ve my isimsiz kullanılmaz / **C** me sahiplik bildirmez / **D** its özne olamaz / **E** them özne olamaz.$e$, 1)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- ydt | konu | ydt-dil | Tenses konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'YDT', 'konu', 'ydt-dil', t.id, $t$Tenses konu testi$t$, 20, true
  from public.topics t where t.subject_id = 'ydt-dil' and t.name = $n$Tenses$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'ydt-dil', null::integer, $q$Since the company launched its mobile app in 2019, the number of users ---- steadily, and last month it ---- three million.$q$, array[$o$grew / has reached$o$, $o$had grown / reaches$o$, $o$has grown / reached$o$, $o$is growing / had reached$o$, $o$was growing / will reach$o$], 2, $e$1. **Since 2019** başlangıcı verilen ve şimdiye kadar süren bir dönemdir. İlk boşluk Present Perfect ister: **has grown**.
2. **Last month** bitmiş ve belirli bir zamandır. İkinci boşluk Simple Past ister: **reached**.

Diğer şıklar: **A** since ile Simple Past ve last month ile Present Perfect kullanılmaz / **B** Past Perfect ve Present Simple zaman ifadelerine uymaz / **D** last month ile Past Perfect kullanılmaz / **E** will reach geçmişi anlatmaz.$e$, 1),
  (2, 'ydt-dil', null::integer, $q$While the technicians ---- the server on Sunday night, a power cut ---- the entire building.$q$, array[$o$repaired / has hit$o$, $o$have repaired / was hitting$o$, $o$had been repairing / hits$o$, $o$are repairing / had hit$o$, $o$were repairing / hit$o$], 4, $e$1. **While** ile geçmişte devam eden bir eylem anlatılır. İlk boşluk Past Continuous ister: **were repairing**.
2. Elektrik kesintisi bu eylemi bölen kısa ve bitmiş bir olaydır. İkinci boşluk Simple Past ister: **hit**.

Diğer şıklar: **A** while ile Simple Past devam eden eylemi anlatmaz ve Present Perfect geçmiş zamanla kullanılmaz / **B** Present Perfect geçmiş zamanla kullanılmaz / **C** hits geçmiş olayı anlatamaz / **D** are repairing şimdiki zamandır.$e$, 2),
  (3, 'ydt-dil', null::integer, $q$By the time the rescue team ----, the hikers ---- inside the cave for nearly two days.$q$, array[$o$arrives / have been waiting$o$, $o$had arrived / were waiting$o$, $o$was arriving / will have waited$o$, $o$arrived / had been waiting$o$, $o$has arrived / waited$o$], 3, $e$1. Cümle geçmişle ilgilidir. **By the time** bağlı cümlesinde geçmiş bir an verilir: **arrived**.
2. Kurtarma ekibi gelmeden önce iki gün boyunca süren bir bekleme vardır. Past Perfect Continuous gerekir: **had been waiting**.

Diğer şıklar: **A** Present Simple ve Present Perfect Continuous şimdiki zaman kurar / **B** for nearly two days ile Past Continuous süreyi tamamlanmış göstermez / **C** Future Perfect geçmiş cümlede kullanılmaz / **E** by the time ile zaman uyumu kurulmaz.$e$, 2),
  (4, 'ydt-dil', null::integer, $q$This time next year, I ---- my thesis in Canada, and by the end of the program I ---- all my research.$q$, array[$o$am writing / complete$o$, $o$will write / have completed$o$, $o$will be writing / will have completed$o$, $o$have been writing / would have completed$o$, $o$was writing / am completing$o$], 2, $e$1. **This time next year** gelecekte belirli bir anda devam eden eylemi gösterir. İlk boşluk Future Continuous ister: **will be writing**.
2. **By the end of the program** gelecekteki bir ana kadar tamamlanmış olayı gösterir. İkinci boşluk Future Perfect ister: **will have completed**.

Diğer şıklar: **A** Present Continuous ve Present Simple gelecekteki belirli anı anlatamaz / **B** will write devam eden eylemi göstermez ve have completed gelecek cümleye uymaz / **D** Present Perfect Continuous gelecek ifadesiyle kullanılmaz / **E** Past Continuous ve Present Continuous bu zamanla uyuşmaz.$e$, 3),
  (5, 'ydt-dil', null::integer, $q$The museum, which ---- in 1932, ---- by more than a million visitors since it reopened last spring.$q$, array[$o$was founded / has been visited$o$, $o$has founded / was visited$o$, $o$had been founded / is visiting$o$, $o$is founded / had visited$o$, $o$founded / has visited$o$], 0, $e$1. **In 1932** bitmiş bir zamandır ve müzeyi biri kurmuştur. İlk boşluk edilgen Simple Past ister: **was founded**.
2. **Since** ile başlayan süre şimdiye kadar sürer ve ziyaret edilen müzedir. İkinci boşluk edilgen Present Perfect ister: **has been visited**.

Diğer şıklar: **B** has founded etkendir ve in 1932 ile uyumsuzdur / **C** is visiting etken ve zaman olarak since ile uyumsuzdur / **D** Present Simple geçmişteki kuruluşu anlatamaz / **E** founded etkendir, müze kendini kurmaz.$e$, 3),
  (6, 'ydt-dil', null::integer, $q$Scientists ---- more than 5,000 planets outside our solar system so far, and astronomers ---- new ones almost every month.$q$, array[$o$discovered / find$o$, $o$had discovered / are finding$o$, $o$will discover / found$o$, $o$are discovering / had found$o$, $o$have discovered / find$o$], 4, $e$1. **So far** şimdiye kadar olan bir dönemi gösterir. İlk boşluk Present Perfect ister: **have discovered**.
2. **Almost every month** tekrarlanan bir durumdur. İkinci boşluk Present Simple ister: **find**.

Diğer şıklar: **A** so far ile Simple Past kullanılmaz / **B** so far ile Past Perfect kullanılmaz / **C** so far ile gelecek zaman kullanılmaz / **D** so far Present Perfect ister.$e$, 1),
  (7, 'ydt-dil', null::integer, $q$Yesterday, I ---- my keys, so I ---- late for work.$q$, array[$o$have lost / was$o$, $o$lose / was$o$, $o$lost / was$o$, $o$had lost / am$o$, $o$am losing / will be$o$], 2, $e$1. **Yesterday** bitmiş ve belirli bir zamandır. İlk boşluk Simple Past ister: **lost**.
2. Sonuç da aynı günün geçmiş bir olayıdır: **was**.

Diğer şıklar: **A** yesterday ile Present Perfect kullanılmaz / **B** yesterday ile Present Simple kullanılmaz / **D** am şimdiki zamandır, cümle geçmişi anlatıyor / **E** yesterday geçmiş zaman ister.$e$, 1),
  (8, 'ydt-dil', null::integer, $q$When I called her at 9 p.m. yesterday, she ---- a film, so she ---- my call.$q$, array[$o$watched / was not answering$o$, $o$was watching / didn't answer$o$, $o$has watched / doesn't answer$o$, $o$is watching / hasn't answered$o$, $o$will watch / won't answer$o$], 1, $e$1. **At 9 p.m. yesterday** geçmişte belirli bir anda devam eden eylemi gösterir. İlk boşluk Past Continuous ister: **was watching**.
2. Telefona cevap vermemek bitmiş bir sonuçtur: **didn't answer**.

Diğer şıklar: **A** devam eden eylem Past Continuous ister / **C** has watched geçmiş zamanla kullanılmaz / **D** is watching şimdiki zamandır / **E** will geçmiş cümleye uymaz.$e$, 1),
  (9, 'ydt-dil', null::integer, $q$I ---- for the bus for almost an hour, but it ---- yet.$q$, array[$o$waited / didn't come$o$, $o$am waiting / hasn't come$o$, $o$had waited / won't come$o$, $o$wait / hasn't come$o$, $o$have been waiting / hasn't come$o$], 4, $e$1. **For almost an hour** şimdiye kadar süren eylemi gösterir ve vurgu süredir. İlk boşluk Present Perfect Continuous ister: **have been waiting**.
2. **Yet** olumsuz cümlede Present Perfect ister: **hasn't come**.

Diğer şıklar: **A** yet ile Simple Past kullanılmaz / **B** for almost an hour süreyi belirten Present Perfect Continuous ister / **C** Past Perfect şimdiki durumu anlatamaz / **D** for almost an hour ile Present Simple kullanılmaz.$e$, 2),
  (10, 'ydt-dil', null::integer, $q$By the time we ---- at the station, the train ----, so we had to wait for the next one.$q$, array[$o$get / has left$o$, $o$had got / was leaving$o$, $o$were getting / leaves$o$, $o$got / had left$o$, $o$have got / left$o$], 3, $e$1. Cümle geçmişi anlatır. **By the time** bağlı cümlesinde Simple Past kullanılır: **got**.
2. Tren, biz gelmeden önce kalkmıştır. Ana cümlede Past Perfect gerekir: **had left**.

Diğer şıklar: **A** cümle geçmişi anlatıyor / **B** by the time bağlı cümlesinde Past Perfect olmaz ve was leaving önceliği anlatmaz / **C** leaves geçmiş cümleye uymaz / **E** have got by the time ile uyumsuzdur.$e$, 2),
  (11, 'ydt-dil', null::integer, $q$We ---- the meeting as soon as everyone ---- the room.$q$, array[$o$started / will enter$o$, $o$will start / enters$o$, $o$will start / will enter$o$, $o$are starting / would enter$o$, $o$have started / will have entered$o$], 1, $e$1. Cümle gelecekte yapılacak bir iş anlatıyor. Ana cümlede **will start** kullanılır.
2. **As soon as** gibi zaman bağlaçlarından sonra gelecek anlamı Present Simple ile verilir: **enters**.

Diğer şıklar: **A** as soon as sonrasında will kullanılmaz / **C** zaman bağlacından sonra will kullanılmaz / **D** would enter zaman bağlacından sonra kullanılmaz / **E** gelecek için zaman bağlacından sonra Future Perfect kullanılmaz.$e$, 2),
  (12, 'ydt-dil', null::integer, $q$Dr. Kaya ---- at this university since 2010, and last year she ---- the head of the department.$q$, array[$o$has worked / became$o$, $o$worked / has become$o$, $o$works / was becoming$o$, $o$had worked / has become$o$, $o$is working / becomes$o$], 0, $e$1. **Since 2010** şimdiye kadar süren bir dönemdir. İlk boşluk Present Perfect ister: **has worked**.
2. **Last year** bitmiş zamandır. İkinci boşluk Simple Past ister: **became**.

Diğer şıklar: **B** since ile Simple Past ve last year ile Present Perfect kullanılmaz / **C** since Present Perfect ister / **D** last year ile Present Perfect kullanılmaz / **E** since ile Present Continuous kullanılmaz.$e$, 2),
  (13, 'ydt-dil', null::integer, $q$It is the second time this week that the printer ---- , and the technician ---- it yet.$q$, array[$o$had broken down / hasn't repaired$o$, $o$is breaking down / didn't repair$o$, $o$will break down / hasn't repaired$o$, $o$has broken down / hasn't repaired$o$, $o$was breaking down / has not repaired$o$], 3, $e$1. **It is the second time ...** kalıbından sonra Present Perfect gelir: **has broken down**.
2. **Yet** olumsuz cümlede Present Perfect ister: **hasn't repaired**.

Diğer şıklar: **A** it is the second time sonrasında Present Perfect gerekir / **B** yet ile Simple Past kullanılmaz / **C** it is the second time sonrasında will kullanılmaz / **E** it is the second time sonrasında Past Continuous kullanılmaz.$e$, 2),
  (14, 'ydt-dil', null::integer, $q$While I ---- through the old photo album, I ---- a picture of my grandfather as a young soldier.$q$, array[$o$looked / was coming across$o$, $o$have looked / came across$o$, $o$am looking / came across$o$, $o$had looked / have come across$o$, $o$was looking / came across$o$], 4, $e$1. **While** ile geçmişte devam eden bir eylem verilir. İlk boşluk Past Continuous ister: **was looking**.
2. Fotoğrafı bulmak bu eylemi bölen kısa bir olaydır. İkinci boşluk Simple Past ister: **came across**.

Diğer şıklar: **A** while ile devam eden eylem Past Continuous ister / **B** have looked geçmiş zamanla kullanılmaz / **C** am looking şimdiki zamandır / **D** while bağlı cümlesinde Past Perfect olmaz.$e$, 2),
  (15, 'ydt-dil', null::integer, $q$Since the new manager ----, productivity ---- by nearly 15 percent.$q$, array[$o$arrives / has risen$o$, $o$had arrived / rose$o$, $o$arrived / has risen$o$, $o$was arriving / is rising$o$, $o$will arrive / rose$o$], 2, $e$1. **Since** bağlı cümlesinde başlangıç noktası Simple Past ile verilir: **arrived**.
2. Ana cümle şimdiye kadar süren sonucu anlatır: **has risen**.

Diğer şıklar: **A** since bağlı cümlesinde Present Simple kullanılmaz / **B** since sonrası ana cümle Present Perfect ister / **D** since ile Past Continuous ve Present Continuous uyumsuzdur / **E** since ile gelecek zaman kullanılmaz.$e$, 1),
  (16, 'ydt-dil', null::integer, $q$By the time the new stadium ---- next year, the workers ---- on it for more than four years.$q$, array[$o$opens / will have been working$o$, $o$will open / will have been working$o$, $o$opened / had been working$o$, $o$has opened / have been working$o$, $o$opens / were working$o$], 0, $e$1. **By the time** gelecek anlatıyorsa bağlı cümle Present Simple olur: **opens**.
2. Gelecekteki bir ana kadar süren eylemin süresi verilmiş: **will have been working**.

Diğer şıklar: **B** by the time sonrasında will kullanılmaz / **C** next year geçmiş zaman ile kullanılmaz / **D** next year ile Present Perfect kullanılmaz / **E** for more than four years ile Past Continuous süreyi tamamlamaz.$e$, 3),
  (17, 'ydt-dil', null::integer, $q$My laptop is very slow. I ---- it for five years, and I think it's time I ---- a new one.$q$, array[$o$had / buy$o$, $o$have had / bought$o$, $o$have been having / will buy$o$, $o$am having / bought$o$, $o$have had / will buy$o$], 1, $e$1. **For five years** şimdiye kadar süren bir durumdur. **Have** burada sahip olma anlamında durum fiilidir: **have had**.
2. **It's time** sonrasında gerçek dışı Simple Past kullanılır: **bought**.

Diğer şıklar: **A** for five years Present Perfect ister ve it's time sonrasında Simple Past gerekir / **C** have bu anlamda Continuous kullanılmaz ve it's time sonrasında will olmaz / **D** have sahip olma anlamında Continuous olmaz / **E** it's time sonrasında will kullanılmaz.$e$, 3),
  (18, 'ydt-dil', null::integer, $q$It's high time the government ---- stricter measures, because the problem ---- worse for years.$q$, array[$o$takes / is getting$o$, $o$will take / got$o$, $o$has taken / was getting$o$, $o$took / has been getting$o$, $o$takes / had got$o$], 3, $e$1. **It's high time** sonrasında gerçek dışı Simple Past kullanılır: **took**.
2. **For years** şimdiye kadar süren bir değişimdir. Present Perfect Continuous gerekir: **has been getting**.

Diğer şıklar: **A** it's high time sonrasında Simple Past gerekir / **B** it's high time sonrasında will olmaz / **C** it's high time sonrasında Present Perfect olmaz ve for years Present Perfect Continuous ister / **E** it's high time sonrasında Simple Past gerekir.$e$, 3),
  (19, 'ydt-dil', null::integer, $q$Last summer we ---- a lot of time on the beach, and we ---- a new water sport almost every day.$q$, array[$o$spent / tried$o$, $o$have spent / try$o$, $o$spend / have tried$o$, $o$were spending / will try$o$, $o$had spent / tries$o$], 0, $e$1. **Last summer** bitmiş bir dönemdir. Cümle Simple Past ister: **spent** ve **tried**.

Diğer şıklar: **B** last summer ile Present Perfect kullanılmaz / **C** last summer geçmiş zaman ister / **D** will try geçmiş cümleye uymaz / **E** tries geçmişi anlatmaz.$e$, 1),
  (20, 'ydt-dil', null::integer, $q$I'm afraid the manager is not here. He ---- to the airport and ---- back until noon tomorrow.$q$, array[$o$has been / won't be$o$, $o$has gone / won't be$o$, $o$went / hasn't been$o$, $o$had gone / isn't$o$, $o$was going / will not have been$o$], 1, $e$1. Yönetici şu an burada değildir ve havalimanına gitmiştir. Sonuç şimdiyi etkiler: **has gone**.
2. **Until noon tomorrow** gelecekte bir zamandır: **won't be**.

Diğer şıklar: **A** has been to dönüş anlamı taşır, yönetici burada değil / **C** tomorrow ile hasn't been uyumsuzdur / **D** Past Perfect şimdiki durumu anlatmaz / **E** Past Continuous şimdiki durumu anlatmaz.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

