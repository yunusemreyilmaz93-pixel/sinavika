-- 20261025110000_questions_lgs_ing. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-ing | Friendship konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Friendship konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Friendship$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which sentence is an invitation?$q$, array[$o$Would you like to come to my birthday party?$o$, $o$I am sorry, I can't come to your party.$o$, $o$Yes, I would love to come.$o$, $o$Thank you for the present.$o$], 0, $e$1. An invitation asks someone to join an event. "Would you like to...?" is an invitation.
2. The other sentences refuse, accept or thank.

Diğer şıklar: **B** refusing an invitation / **C** accepting an invitation / **D** thanking.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$Ali: Would you like to go to the cinema with me tonight?
Ben: ______ I love that film.$q$, array[$o$No, I can't.$o$, $o$I'm sorry, I'm busy.$o$, $o$Not really.$o$, $o$Yes, I'd love to!$o$], 3, $e$1. Ben says he loves the film, so he accepts the invitation.
2. "Yes, I'd love to!" is the accepting answer.

Diğer şıklar: **A** refusing when the second sentence is positive / **B** refusing when the second sentence is positive / **C** refusing when the second sentence is positive.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which word describes a person who tells the truth and does not lie?$q$, array[$o$selfish$o$, $o$honest$o$, $o$lazy$o$, $o$rude$o$], 1, $e$1. An honest person tells the truth.
2. Selfish means thinking only about yourself, lazy means not wanting to work, rude means not polite.

Diğer şıklar: **A** opposite meaning / **C** unrelated meaning / **D** unrelated meaning.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Which one is a good quality of a friend?$q$, array[$o$jealous$o$, $o$dishonest$o$, $o$impolite$o$, $o$loyal$o$], 3, $e$1. A loyal friend stays by your side.
2. Jealous, dishonest and impolite are negative qualities.

Diğer şıklar: **A** negative quality / **B** negative quality / **C** negative quality.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$Mia: Would you like to join our picnic on Saturday?
Sam: ______ I have a piano lesson.$q$, array[$o$Sure, I'd love to.$o$, $o$I'm sorry, I can't.$o$, $o$That sounds great.$o$, $o$Yes, I will be there.$o$], 1, $e$1. Sam says he has a piano lesson, so he cannot join.
2. The refusing answer is "I'm sorry, I can't."

Diğer şıklar: **A** accepting instead of refusing / **C** accepting instead of refusing / **D** accepting instead of refusing.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$Which sentence refuses an invitation politely?$q$, array[$o$No, I hate your parties and I won't come.$o$, $o$Thanks for asking, but I have to study.$o$, $o$Of course, I will come to the party.$o$, $o$Sure, what time does it start?$o$], 1, $e$1. A polite refusal thanks the person and gives a reason.
2. "Thanks for asking, but I have to study." does this.

Diğer şıklar: **A** impolite refusal / **C** accepting / **D** accepting.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Zeynep: I'm planning a movie night. Can you come?
Elif: ______$q$, array[$o$That sounds fun. What time?$o$, $o$I'm afraid I can't. I'm ill.$o$, $o$No, I don't like you.$o$, $o$Maybe I'll buy a ticket.$o$], 0, $e$1. Elif is interested and asks about the time. This shows she accepts the invitation.

Diğer şıklar: **B** refusing instead of accepting / **C** impolite refusal / **D** unrelated answer.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Selin always tells her friends' secrets to other people.

Which word describes Selin?$q$, array[$o$generous$o$, $o$helpful$o$, $o$untrustworthy$o$, $o$patient$o$], 2, $e$1. A person who tells secrets cannot be trusted.
2. Untrustworthy means you cannot trust that person.

Diğer şıklar: **A** unrelated quality / **B** unrelated quality / **D** unrelated quality.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which sentence gives advice to a friend who is shy and has no friends?$q$, array[$o$You shouldn't talk to anyone.$o$, $o$You must stay at home.$o$, $o$You should join a club.$o$, $o$You mustn't go to school.$o$], 2, $e$1. "You should..." gives advice.
2. Joining a club helps a shy person meet new friends.

Diğer şıklar: **A** bad advice / **B** bad advice / **D** bad advice.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Which sentence is NOT an invitation?$q$, array[$o$I'm sorry, but I can't come.$o$, $o$Would you like to have dinner with us?$o$, $o$Why don't you come to my house?$o$, $o$Shall we go to the park?$o$], 0, $e$1. The first sentence refuses an invitation.
2. The others invite someone to do something.

Diğer şıklar: **B** invitation / **C** invitation / **D** invitation.$e$, 2),
  (11, 'lgs-ing', null::integer, $q$Deniz: Would you like to come to my house this weekend?
Kaan: I'd love to, but I have to help my mother.
Deniz: That's OK. Maybe next time.

What does Kaan do?$q$, array[$o$He accepts the invitation.$o$, $o$He invites Deniz to his house.$o$, $o$He gets angry with Deniz.$o$, $o$He refuses the invitation politely.$o$], 3, $e$1. Kaan says "I'd love to, but I have to help my mother." He gives a reason and does not go.
2. Deniz is understanding. Kaan refuses politely.

Diğer şıklar: **A** missing the word 'but' / **B** misunderstanding who invites / **C** misunderstanding the tone.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Aylin and Berk are good friends. Last week Berk didn't keep Aylin's secret. Aylin is upset.

Which advice is the best for Aylin?$q$, array[$o$She should never speak to Berk again.$o$, $o$She should tell Berk how she feels and talk to him.$o$, $o$She should tell Berk's secrets to everyone.$o$, $o$She should pretend nothing happened.$o$], 1, $e$1. A good way to solve friendship problems is talking honestly.
2. The other options make the problem bigger or ignore it.

Diğer şıklar: **A** extreme reaction / **C** revenge / **D** avoiding the problem.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Which pair of words has opposite meanings?$q$, array[$o$friendly - kind$o$, $o$honest - truthful$o$, $o$helpful - supportive$o$, $o$loyal - disloyal$o$], 3, $e$1. Loyal and disloyal are opposites.
2. The other pairs have similar meanings.

Diğer şıklar: **A** similar meaning / **B** similar meaning / **C** similar meaning.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Cem: Hi Emre. We are having a barbecue on Sunday. Do you want to come?
Emre: ______ What can I bring?

Which answer completes the dialogue?$q$, array[$o$Thanks, I'd love to.$o$, $o$Sorry, I'm not free.$o$, $o$No, thanks.$o$, $o$I'm afraid I can't.$o$], 0, $e$1. Emre asks what he can bring, so he accepts the invitation.
2. Only "Thanks, I'd love to." fits.

Diğer şıklar: **B** refusing but then asking what to bring / **C** refusing but then asking what to bring / **D** refusing but then asking what to bring.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$A good friend should be ______ when you are sad.$q$, array[$o$selfish$o$, $o$jealous$o$, $o$supportive$o$, $o$careless$o$], 2, $e$1. A supportive friend helps and comforts you when you are sad.
2. The other words describe negative behaviour.

Diğer şıklar: **A** opposite meaning / **B** opposite meaning / **D** opposite meaning.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which sentence is a suggestion to solve a problem between friends?$q$, array[$o$You must never talk to her.$o$, $o$I am angry with you.$o$, $o$Why don't you apologise to her?$o$, $o$She is not a good friend.$o$], 2, $e$1. "Why don't you...?" gives a suggestion. Apologising can solve the problem.

Diğer şıklar: **A** extreme suggestion / **B** not a suggestion / **D** not a suggestion.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Teen Life konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Teen Life konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Teen Life$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which sentence expresses a dislike?$q$, array[$o$I'm crazy about football.$o$, $o$I really enjoy reading books.$o$, $o$I can't stand getting up early.$o$, $o$I'm fond of swimming.$o$], 2, $e$1. "Can't stand" means dislike strongly.
2. Crazy about, enjoy and fond of are positive expressions.

Diğer şıklar: **A** like / **B** like / **D** like.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$Tom: Do you like pizza?
Ann: Yes, I ______ it.$q$, array[$o$hate$o$, $o$dislike$o$, $o$can't stand$o$, $o$love$o$], 3, $e$1. Ann answers "Yes", so she likes pizza. "Love" fits.

Diğer şıklar: **A** opposite meaning / **B** opposite meaning / **C** opposite meaning.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$You have a headache. Which advice is correct?$q$, array[$o$You shouldn't rest.$o$, $o$You should watch TV all night.$o$, $o$You should rest.$o$, $o$You should run in the sun.$o$], 2, $e$1. "Should" gives advice. Resting helps with a headache.

Diğer şıklar: **A** wrong advice / **B** wrong advice / **D** wrong advice.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Which of these is a healthy habit?$q$, array[$o$Skipping breakfast$o$, $o$Drinking enough water$o$, $o$Eating too much fast food$o$, $o$Staying up all night$o$], 1, $e$1. Drinking enough water is a healthy habit.
2. The others are unhealthy.

Diğer şıklar: **A** unhealthy habit / **C** unhealthy habit / **D** unhealthy habit.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$Would you rather go to the cinema or stay at home?

Which answer is correct?$q$, array[$o$I'd rather to stay at home.$o$, $o$I'd rather staying at home.$o$, $o$I'd rather stays at home.$o$, $o$I'd rather stay at home.$o$], 3, $e$1. After "would rather" we use the base form of the verb.
2. So the correct sentence is "I'd rather stay at home."

Diğer şıklar: **A** using to after would rather / **B** using -ing after would rather / **C** using -s after would rather.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$I ______ tea to coffee.$q$, array[$o$would rather$o$, $o$enjoy$o$, $o$want$o$, $o$prefer$o$], 3, $e$1. "Prefer A to B" is the correct structure.
2. "Would rather" is followed by "than", not "to".

Diğer şıklar: **A** wrong structure with to / **B** wrong structure with to / **C** wrong structure with to.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Selim eats a lot of sweets and has toothache.

What should he do?$q$, array[$o$He should eat more sweets.$o$, $o$He should visit a dentist.$o$, $o$He shouldn't brush his teeth.$o$, $o$He should drink only cola.$o$], 1, $e$1. He has toothache. A dentist can help him.
2. The other pieces of advice make the problem worse.

Diğer şıklar: **A** wrong advice / **C** wrong advice / **D** wrong advice.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$Teenagers shouldn't to spend too much time online.$o$, $o$Teenagers shouldn't spend too much time online.$o$, $o$Teenagers should spending too much time online.$o$, $o$Teenagers shoulds spend too much time online.$o$], 1, $e$1. After should or shouldn't we use the base form of the verb.

Diğer şıklar: **A** to after shouldn't / **C** -ing after should / **D** -s after should.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Ece: I like playing tennis. What about you?
Daniz: I ______ it, but I prefer swimming.$q$, array[$o$can't stand$o$, $o$hate$o$, $o$don't like at all$o$, $o$quite like$o$], 3, $e$1. Daniz does not hate tennis, but prefers swimming. "Quite like" fits.

Diğer şıklar: **A** contradicts the next part / **B** contradicts the next part / **C** contradicts the next part.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Jack's problem: He stays up late and feels tired at school.

Which advice is the best?$q$, array[$o$You should go to bed early.$o$, $o$You should drink more coffee at night.$o$, $o$You shouldn't go to school.$o$, $o$You should play games until midnight.$o$], 0, $e$1. Going to bed early solves the problem of being tired.
2. The other pieces of advice do not help.

Diğer şıklar: **B** makes the problem worse / **C** avoiding the problem / **D** makes the problem worse.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Look at the table.

| Name | Likes | Dislikes |
| --- | --- | --- |
| Ali | basketball | getting up early |
| Bora | reading | noisy places |
| Cem | cooking | doing homework |

Which sentence is true according to the table?$q$, array[$o$Ali likes getting up early.$o$, $o$Cem doesn't like doing homework.$o$, $o$Bora likes noisy places.$o$, $o$Cem dislikes cooking.$o$], 1, $e$1. The table shows Cem dislikes doing homework.
2. The other sentences give the wrong information.

Diğer şıklar: **A** misreading / **C** misreading / **D** misreading.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Ayşe: What do you prefer, tea or coffee?
Eda: I prefer tea ______ coffee.

Which word completes the sentence?$q$, array[$o$to$o$, $o$than$o$, $o$from$o$, $o$with$o$], 0, $e$1. The structure is "prefer A to B".

Diğer şıklar: **B** wrong linking word / **C** wrong linking word / **D** wrong linking word.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Which sentence has a similar meaning to "I'd rather play chess than watch TV"?$q$, array[$o$I prefer to play chess than watching TV.$o$, $o$I'd prefer watching TV to playing chess.$o$, $o$I prefer playing chess to watching TV.$o$, $o$I like neither chess nor TV.$o$], 2, $e$1. "Prefer A-ing to B-ing" means the same as "would rather A than B".

Diğer şıklar: **A** wrong structure / **B** opposite meaning / **D** different meaning.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which habit is NOT healthy for teenagers?$q$, array[$o$Eating chips for dinner every day$o$, $o$Doing sports regularly$o$, $o$Sleeping eight hours a night$o$, $o$Eating fruit and vegetables$o$], 0, $e$1. Eating chips every day is unhealthy.
2. The other habits are healthy.

Diğer şıklar: **B** healthy / **C** healthy / **D** healthy.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$Teenagers sometimes have problems at school. Which one is a school problem?$q$, array[$o$Having too much homework$o$, $o$Eating healthy food$o$, $o$Going on holiday$o$, $o$Meeting new friends$o$], 0, $e$1. Too much homework can cause stress.
2. The others are positive things.

Diğer şıklar: **B** not a problem / **C** not a problem / **D** not a problem.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Murat: I can't sleep at night.
Teacher: You ______ drink coffee in the evening.$q$, array[$o$should$o$, $o$must$o$, $o$shouldn't$o$, $o$can$o$], 2, $e$1. Coffee makes sleeping difficult, so the teacher says he shouldn't drink it.

Diğer şıklar: **A** advice in the wrong direction / **B** wrong modal / **D** wrong modal.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | In the Kitchen konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$In the Kitchen konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$In the Kitchen$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which word is uncountable?$q$, array[$o$egg$o$, $o$milk$o$, $o$apple$o$, $o$tomato$o$], 1, $e$1. Milk is a liquid and we do not count it directly.
2. Egg, apple and tomato are countable.

Diğer şıklar: **A** countable noun / **C** countable noun / **D** countable noun.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$There isn't ______ sugar in the bowl.$q$, array[$o$many$o$, $o$any$o$, $o$a few$o$, $o$an$o$], 1, $e$1. Sugar is uncountable. In negative sentences we use "any".

Diğer şıklar: **A** used with countable nouns / **C** used with countable nouns / **D** wrong article.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which verb means to heat food in the oven?$q$, array[$o$bake$o$, $o$chop$o$, $o$peel$o$, $o$pour$o$], 0, $e$1. Bake means to cook food in an oven, for example a cake.

Diğer şıklar: **B** cutting / **C** removing skin / **D** putting liquid.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Which kitchen tool do we use to cut vegetables?$q$, array[$o$spoon$o$, $o$knife$o$, $o$kettle$o$, $o$plate$o$], 1, $e$1. We cut vegetables with a knife.

Diğer şıklar: **A** tool for eating or stirring / **C** tool for boiling water / **D** tool for serving.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$How ______ eggs do we need for the cake?$q$, array[$o$much$o$, $o$a little$o$, $o$many$o$, $o$any$o$], 2, $e$1. Eggs are countable, so we ask "How many eggs?".

Diğer şıklar: **A** used with uncountable nouns / **B** not a question word / **D** not a question word.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$We need ______ flour for the pancakes.$q$, array[$o$a few$o$, $o$many$o$, $o$several$o$, $o$a little$o$], 3, $e$1. Flour is uncountable. We use "a little" with uncountable nouns.

Diğer şıklar: **A** used with countable nouns / **B** used with countable nouns / **C** used with countable nouns.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Put the sentences of the recipe in the correct order.

I. Then, add the eggs.
II. First, mix flour and sugar.
III. Finally, bake it for 30 minutes.

Which order is correct?$q$, array[$o$II, I, III$o$, $o$I, II, III$o$, $o$III, II, I$o$, $o$II, III, I$o$], 0, $e$1. "First" starts the recipe, "then" comes next and "finally" is the last step.

Diğer şıklar: **B** ignoring first / **C** reversed order / **D** finally in the middle.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Is there ______ milk in the fridge?$q$, array[$o$a$o$, $o$many$o$, $o$few$o$, $o$any$o$], 3, $e$1. In questions with uncountable nouns we use "any".

Diğer şıklar: **A** used with singular countable / **B** used with countable plural / **C** used with countable plural.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$There are a little tomatoes on the table.$o$, $o$There are a few tomatoes on the table.$o$, $o$There is a few tomatoes on the table.$o$, $o$There are much tomatoes on the table.$o$], 1, $e$1. Tomatoes are countable and plural, so "a few" and "are" are correct.

Diğer şıklar: **A** a little with countable / **C** is with plural / **D** much with countable.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Look at the recipe.

Omelette: 2 eggs, a little salt, some cheese, a few mushrooms, 1 tablespoon of oil

Which sentence is true according to the recipe?$q$, array[$o$We need many oils.$o$, $o$We need a few salt.$o$, $o$We need any cheese.$o$, $o$We need a few mushrooms.$o$], 3, $e$1. Mushrooms are countable, so "a few" is correct.
2. Salt and oil are uncountable, and "any" is not used in affirmative sentences.

Diğer şıklar: **A** oil is uncountable / **B** salt is uncountable / **C** any in an affirmative sentence.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Ayla: How much sugar do we need?
Mom: ______$q$, array[$o$Just a few.$o$, $o$Two pieces.$o$, $o$Just a little.$o$, $o$Many.$o$], 2, $e$1. Sugar is uncountable. The answer should use "a little".

Diğer şıklar: **A** a few with uncountable / **B** answer does not fit sugar in recipes / **D** many with uncountable.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which word does NOT belong to the group?$q$, array[$o$pour$o$, $o$flour$o$, $o$butter$o$, $o$sugar$o$], 0, $e$1. Flour, butter and sugar are ingredients.
2. Pour is a verb.

Diğer şıklar: **B** ingredient / **C** ingredient / **D** ingredient.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Can: Is there any bread?
Defne: Yes, but there ______ much.$q$, array[$o$aren't$o$, $o$don't$o$, $o$doesn't$o$, $o$isn't$o$], 3, $e$1. Bread is uncountable, so we use "isn't much".
2. The sentence means there is only a little bread.

Diğer şıklar: **A** wrong verb for an uncountable noun / **B** wrong auxiliary / **C** wrong auxiliary.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which sentence needs "much"?$q$, array[$o$There are ______ apples in the basket.$o$, $o$How ______ students are there?$o$, $o$How ______ water do you drink every day?$o$, $o$We don't have ______ eggs.$o$], 2, $e$1. Water is uncountable, so we use "much".
2. The others have countable nouns and use "many".

Diğer şıklar: **A** countable noun / **B** countable noun / **D** countable noun.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$Which verb is used with an onion before cooking?$q$, array[$o$peel$o$, $o$bake$o$, $o$boil$o$, $o$freeze$o$], 0, $e$1. We peel an onion to remove its skin.

Diğer şıklar: **B** oven verb / **C** water verb / **D** cold verb.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Finally, ______ the soup into bowls.$q$, array[$o$peel$o$, $o$chop$o$, $o$pour$o$, $o$slice$o$], 2, $e$1. We pour liquid foods like soup into bowls.

Diğer şıklar: **A** wrong verb / **B** wrong verb / **D** wrong verb.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | On the Phone konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$On the Phone konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$On the Phone$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which sentence do we use to answer the phone politely?$q$, array[$o$Who is this boy?$o$, $o$Hello, this is Ali speaking.$o$, $o$Go away.$o$, $o$What do you want now?$o$], 1, $e$1. On the phone we say who is speaking in a polite way.
2. "Hello, this is Ali speaking." is correct.

Diğer şıklar: **A** impolite / **C** impolite / **D** impolite.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$Which sentence do we use to ask for a person on the phone?$q$, array[$o$Is Mr Brown a teacher?$o$, $o$May I speak to Mr Brown, please?$o$, $o$Where does Mr Brown live?$o$, $o$Mr Brown is my uncle.$o$], 1, $e$1. "May I speak to...?" asks for a person on the phone.

Diğer şıklar: **A** unrelated question / **C** unrelated question / **D** statement.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which expression is used to end a phone call?$q$, array[$o$Hold on, please.$o$, $o$Who's calling?$o$, $o$Can I take a message?$o$, $o$Goodbye, talk to you later.$o$], 3, $e$1. We end a call by saying goodbye.

Diğer şıklar: **A** asking to wait / **B** asking for the caller / **C** offering to take a message.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Receptionist: Mr Green is in a meeting. Can I take a ______?$q$, array[$o$meal$o$, $o$photo$o$, $o$message$o$, $o$holiday$o$], 2, $e$1. "Can I take a message?" is a standard phone expression.

Diğer şıklar: **A** wrong noun / **B** wrong noun / **D** wrong noun.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$Caller: Hello, may I speak to Sarah, please?
Sarah: ______$q$, array[$o$She is not here.$o$, $o$Wrong number.$o$, $o$Hold on, please.$o$, $o$Speaking.$o$], 3, $e$1. Sarah is the person who answers the phone. "Speaking." means "I am Sarah."

Diğer şıklar: **A** wrong answer, Sarah is speaking / **B** wrong answer / **C** wrong answer.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$I can't hear you well. The line is bad.

Which sentence is the best answer?$q$, array[$o$Could you shut up, please?$o$, $o$Could you speak up, please?$o$, $o$I will break my phone.$o$, $o$You are a good speaker.$o$], 1, $e$1. "Could you speak up, please?" asks politely for a louder voice.

Diğer şıklar: **A** impolite / **C** silly / **D** unrelated.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Receptionist: Hello, Star Hotel.
Caller: ______
Receptionist: Sure. Hold on, please.$q$, array[$o$Can I speak to Mr Gül, please?$o$, $o$Thank you for the hotel.$o$, $o$I am at home now.$o$, $o$How old are you?$o$], 0, $e$1. The receptionist says "Hold on, please", so the caller asked for someone.

Diğer şıklar: **B** does not fit / **C** does not fit / **D** does not fit.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Mum: Sorry, Ece isn't here. Would you like to ______ a message?$q$, array[$o$leave$o$, $o$take$o$, $o$make$o$, $o$give up$o$], 0, $e$1. The caller leaves a message. The one who answers takes a message.

Diğer şıklar: **B** wrong verb / **C** wrong verb / **D** wrong verb.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which sentence means you will call back later?$q$, array[$o$I'll hang up now.$o$, $o$I'll call back later.$o$, $o$I'll talk to you at once.$o$, $o$I can't call you.$o$], 1, $e$1. "Call back" means to phone again.

Diğer şıklar: **A** different meaning / **C** different meaning / **D** different meaning.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Read the message note.

While you were out
For: Mr Kaya
From: Ms Demir
Message: Please call her at 5 pm.

What should Mr Kaya do?$q$, array[$o$Wait for Ms Demir's call at 5 pm.$o$, $o$Write a note to Ms Demir.$o$, $o$Call Ms Demir at 5 pm.$o$, $o$Meet Ms Demir at her office.$o$], 2, $e$1. The note says "Please call her at 5 pm", so Mr Kaya should call her.

Diğer şıklar: **A** misreading / **B** misreading / **D** misreading.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Ali: Hello, can I speak to Burak?
Burak's mum: He's in the shower. ______?
Ali: No, thanks. I'll call back.

Which question completes the dialogue?$q$, array[$o$Why are you calling so early$o$, $o$How old is your best friend$o$, $o$Where does your family live$o$, $o$Can I take a message$o$], 3, $e$1. Ali answers "No, thanks. I'll call back.", so the mum offered a message.

Diğer şıklar: **A** rude / **B** unrelated / **C** unrelated.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which sentence shows a problem on the phone?$q$, array[$o$Sorry, wrong number.$o$, $o$Thank you for calling.$o$, $o$Hello, how are you?$o$, $o$Speaking, how can I help?$o$], 0, $e$1. "Wrong number" is a problem on the phone.

Diğer şıklar: **B** polite closing / **C** greeting / **D** polite answer.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$The line is breaking up. Which sentence is the best to say?$q$, array[$o$I can't hear. I'll call back.$o$, $o$I can hear you perfectly.$o$, $o$Turn up the TV, please.$o$, $o$You are talking very loud.$o$], 0, $e$1. When the line is bad, we say we cannot hear and offer to call back.

Diğer şıklar: **B** contradicts the situation / **C** unrelated / **D** contradicts the situation.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which dialogue is NOT natural?$q$, array[$o$A: Hello? B: Hi, this is Mia.$o$, $o$A: May I speak to Tom? B: Speaking.$o$, $o$A: Is Eda there? B: Sorry, she is out.$o$, $o$A: Hello? B: Who cares?$o$], 3, $e$1. "Who cares?" is rude and not a natural answer on the phone.

Diğer şıklar: **A** natural / **B** natural / **C** natural.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$Which word means to put the receiver down?$q$, array[$o$pick up$o$, $o$call back$o$, $o$hang up$o$, $o$hold on$o$], 2, $e$1. Hang up means to end the call by putting the phone down.

Diğer şıklar: **A** start the call / **B** phone again / **D** wait.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$"Hold on" means ______.$q$, array[$o$hurry up$o$, $o$shout$o$, $o$wait$o$, $o$finish$o$], 2, $e$1. On the phone "Hold on, please" means "Wait a moment".

Diğer şıklar: **A** different meaning / **B** different meaning / **D** different meaning.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | The Internet konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$The Internet konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$The Internet$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which word means "a program to find information on the internet"?$q$, array[$o$search engine$o$, $o$keyboard$o$, $o$printer$o$, $o$microphone$o$], 0, $e$1. A search engine, such as Google, finds information on the internet.
2. Keyboard, printer and microphone are devices.

Diğer şıklar: **B** hardware / **C** hardware / **D** hardware.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$If you ______ your password, hackers can enter your account.$q$, array[$o$hide$o$, $o$share$o$, $o$forget$o$, $o$change$o$], 1, $e$1. If you share your password, hackers can enter your account. It is a first conditional sentence.

Diğer şıklar: **A** opposite meaning / **C** different meaning / **D** opposite meaning.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which one is an advantage of the internet?$q$, array[$o$We can lose our private information.$o$, $o$We can learn new things easily.$o$, $o$We can become addicted.$o$, $o$We can meet dangerous people.$o$], 1, $e$1. Learning new things quickly is an advantage.
2. The others are disadvantages.

Diğer şıklar: **A** disadvantage / **C** disadvantage / **D** disadvantage.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$If it ______ tomorrow, we will stay at home.$q$, array[$o$will rain$o$, $o$rained$o$, $o$raining$o$, $o$rains$o$], 3, $e$1. In the first conditional we use present simple in the if clause and "will" in the main clause.

Diğer şıklar: **A** will in the if clause / **B** past form / **C** wrong form.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$If you click on unknown links, your computer ______ a virus.$q$, array[$o$may get$o$, $o$got$o$, $o$getting$o$, $o$gets will$o$], 0, $e$1. The if clause is present simple. The main clause can use will, may or can.

Diğer şıklar: **B** past form / **C** wrong form / **D** wrong structure.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$If you will spend too much time online, you get tired.$o$, $o$If you spent too much time online, you will get tired.$o$, $o$If you spend too much time online, you got tired.$o$, $o$If you spend too much time online, you will get tired.$o$], 3, $e$1. First conditional: if + present simple, will + base form.

Diğer şıklar: **A** will in the if clause / **B** past in the if clause / **C** past in the main clause.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Someone sends cruel messages to Ali every day on social media.

This problem is called ______.$q$, array[$o$shopping$o$, $o$cyberbullying$o$, $o$blogging$o$, $o$downloading$o$], 1, $e$1. Cyberbullying means hurting someone with online messages.

Diğer şıklar: **A** unrelated word / **C** unrelated word / **D** unrelated word.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$What should you do if someone bullies you online?$q$, array[$o$Answer with cruel messages.$o$, $o$Share your password.$o$, $o$Tell a trusted adult.$o$, $o$Delete all your friends.$o$], 2, $e$1. The best advice is to tell a parent or teacher.

Diğer şıklar: **A** bad advice / **B** bad advice / **D** extreme reaction.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which one is NOT a safe behavior on the internet?$q$, array[$o$Using strong passwords$o$, $o$Talking to your parents about problems$o$, $o$Giving your address to strangers$o$, $o$Checking if a site is safe$o$], 2, $e$1. Giving personal information to strangers is dangerous.

Diğer şıklar: **A** safe behavior / **B** safe behavior / **D** safe behavior.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Look at the graph.

| Activity | Hours per week |
| --- | --- |
| Playing games | 10 |
| Doing homework | 6 |
| Chatting | 8 |

Which sentence is true according to the table?$q$, array[$o$He spends the most time doing homework.$o$, $o$He spends the most time playing games.$o$, $o$He chats more than he plays games.$o$, $o$He plays games for 6 hours a week.$o$], 1, $e$1. Games have the highest number, 10 hours.

Diğer şıklar: **A** misreading / **C** misreading / **D** misreading.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Mia: I'm tired of my phone. I use it all day.
Peter: If you ______ less time on it, you ______ more free time.$q$, array[$o$will spend / have$o$, $o$spent / will have$o$, $o$spend / will have$o$, $o$spend / had$o$], 2, $e$1. First conditional: if + present simple, will + verb.

Diğer şıklar: **A** will in if clause / **B** past in if clause / **D** past in main clause.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which sentence is a disadvantage of the internet?$q$, array[$o$False information spreads easily.$o$, $o$People can talk to friends abroad.$o$, $o$We can shop without leaving home.$o$, $o$We can watch educational videos.$o$], 0, $e$1. Sharing false information is a danger of the internet.

Diğer şıklar: **B** advantage / **C** advantage / **D** advantage.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Complete the sentence with a suitable ending.

If you download files from unknown sites, ______.$q$, array[$o$you may get a virus$o$, $o$you will get better grades$o$, $o$your phone becomes cleaner$o$, $o$you will be safer$o$], 0, $e$1. Unknown sites can have viruses. This ending is logical.

Diğer şıklar: **B** illogical result / **C** illogical result / **D** illogical result.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which pair is correct for the first conditional?$q$, array[$o$If I will finish early, I call you.$o$, $o$If I finished early, I will call you.$o$, $o$If I finish early, I will call you.$o$, $o$If I finish early, I called you.$o$], 2, $e$1. First conditional: if + present simple, will + base.

Diğer şıklar: **A** wrong tense placement / **B** past in if clause / **D** past in main clause.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$What does "to log in" mean?$q$, array[$o$To leave a website forever$o$, $o$To print a document$o$, $o$To turn off the computer$o$, $o$To enter your online account$o$], 3, $e$1. Logging in means entering your account.

Diğer şıklar: **A** log out / **B** unrelated / **C** unrelated.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which word is related to online safety?$q$, array[$o$sandwich$o$, $o$volcano$o$, $o$ticket$o$, $o$password$o$], 3, $e$1. Password protects your accounts.

Diğer şıklar: **A** unrelated / **B** unrelated / **C** unrelated.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Adventures konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Adventures konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Adventures$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Yesterday I ______ to a mountain village.$q$, array[$o$go$o$, $o$going$o$, $o$went$o$, $o$goes$o$], 2, $e$1. "Yesterday" shows past simple. The past form of go is went.

Diğer şıklar: **A** present form / **B** wrong form / **D** present form.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$We ______ a great time on holiday last summer.$q$, array[$o$had$o$, $o$have$o$, $o$has$o$, $o$having$o$], 0, $e$1. "Last summer" shows past simple. The past form of have is had.

Diğer şıklar: **B** present form / **C** present form / **D** wrong form.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which word describes a person who is afraid of dangerous things?$q$, array[$o$scared$o$, $o$brave$o$, $o$excited$o$, $o$proud$o$], 0, $e$1. Scared means afraid.
2. Brave is the opposite.

Diğer şıklar: **B** opposite meaning / **C** different feeling / **D** different feeling.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Past simple negative: I ______ visit the museum last week.$q$, array[$o$don't$o$, $o$didn't$o$, $o$doesn't$o$, $o$wasn't$o$], 1, $e$1. We use "didn't" + base verb in past simple negatives.

Diğer şıklar: **A** present auxiliary / **C** present auxiliary / **D** wrong verb be.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$I ______ TV when the phone rang.$q$, array[$o$watched$o$, $o$am watching$o$, $o$was watching$o$, $o$watch$o$], 2, $e$1. A longer action in progress (watching TV) is interrupted by a short action (the phone rang). We use past continuous.

Diğer şıklar: **A** past simple instead of continuous / **B** present continuous / **D** present simple.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$While Ali ______ a book, his sister was cooking.$q$, array[$o$read$o$, $o$was reading$o$, $o$reads$o$, $o$is reading$o$], 1, $e$1. "While" is used with past continuous for two actions at the same time.

Diğer şıklar: **A** past simple / **C** present / **D** present continuous.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Which question is correct?$q$, array[$o$Do you enjoyed your trip?$o$, $o$Did you enjoyed your trip?$o$, $o$Does you enjoy your trip?$o$, $o$Did you enjoy your trip?$o$], 3, $e$1. We use "Did" + subject + base verb in past simple questions.

Diğer şıklar: **A** do with past / **B** past verb after did / **C** does with you.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Mehmet ______ his leg while he was skiing.$q$, array[$o$break$o$, $o$breaks$o$, $o$breaking$o$, $o$broke$o$], 3, $e$1. Broke is the past form of break. A short action interrupts a longer action in progress.

Diğer şıklar: **A** present form / **B** present form / **C** wrong form.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which one is the past form of "swim"?$q$, array[$o$swam$o$, $o$swimmed$o$, $o$swum$o$, $o$swiming$o$], 0, $e$1. Swim is irregular: swim - swam - swum.

Diğer şıklar: **B** regular ending for an irregular verb / **C** past participle / **D** wrong form.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Read the story.

Last weekend, Efe went camping. He put up his tent and made a fire. Suddenly, a strange noise came from the forest. Efe was very scared.

What happened when Efe heard the noise?$q$, array[$o$He went home happily.$o$, $o$He felt scared.$o$, $o$He fell asleep.$o$, $o$He met a friend.$o$], 1, $e$1. The text says "Efe was very scared."

Diğer şıklar: **A** not in the text / **C** not in the text / **D** not in the text.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Elif: What were you doing at 8 pm yesterday?
Can: I ______ dinner with my family.$q$, array[$o$had$o$, $o$was having$o$, $o$have$o$, $o$am having$o$], 1, $e$1. The question uses past continuous. The answer should be "was having".

Diğer şıklar: **A** past simple / **C** present / **D** present continuous.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which sentence has the correct order of events?$q$, array[$o$First we had lunch, then we are going to the beach.$o$, $o$We went to the beach after we will have lunch.$o$, $o$First we go to the beach, then we had lunch.$o$, $o$First we went to the beach, then we had lunch.$o$], 3, $e$1. "First... then..." show the order of past events with past simple verbs.

Diğer şıklar: **A** wrong tenses / **B** wrong tenses / **C** mixed tenses.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$When the teacher ______ into the class, the students ______ loudly.$q$, array[$o$was coming / talked$o$, $o$comes / are talking$o$, $o$came / were talking$o$, $o$came / talked$o$], 2, $e$1. The short action (came) interrupts the longer action (were talking).

Diğer şıklar: **A** swapped tenses / **B** present forms / **D** past simple for both.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which sentence is about a past experience?$q$, array[$o$I am going to climb Mount Erciyes next year.$o$, $o$I climb mountains every summer.$o$, $o$I climbed Mount Erciyes two years ago.$o$, $o$I will climb Mount Erciyes soon.$o$], 2, $e$1. "Two years ago" and the past tense form "climbed" show a past experience.

Diğer şıklar: **A** future plan / **B** habit / **D** future plan.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$She ______ a postcard to her friend last week.$q$, array[$o$sent$o$, $o$send$o$, $o$sends$o$, $o$sending$o$], 0, $e$1. Sent is the past form of send.

Diğer şıklar: **B** present form / **C** present form / **D** wrong form.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which adjective means "very surprised"?$q$, array[$o$bored$o$, $o$tired$o$, $o$lazy$o$, $o$amazed$o$], 3, $e$1. Amazed means very surprised.

Diğer şıklar: **A** different feeling / **B** different feeling / **C** different meaning.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Tourism konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Tourism konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Tourism$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which sentence do we use to ask for directions?$q$, array[$o$How can I get to the museum?$o$, $o$What time is breakfast?$o$, $o$How much is the room?$o$, $o$Can I pay by card?$o$], 0, $e$1. "How can I get to...?" asks for directions.

Diğer şıklar: **B** different topic / **C** different topic / **D** different topic.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$Turn ______ at the traffic lights and go straight ahead.$q$, array[$o$left$o$, $o$down$o$, $o$over$o$, $o$under$o$], 0, $e$1. Left and right are direction words used with "turn".

Diğer şıklar: **B** wrong direction word / **C** wrong direction word / **D** wrong direction word.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$I ______ visit Antalya next summer.$q$, array[$o$went to$o$, $o$am going to$o$, $o$visited$o$, $o$was going$o$], 1, $e$1. "Next summer" shows the future. We use "be going to" for plans.

Diğer şıklar: **A** past / **C** past / **D** past.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Istanbul is ______ than Ankara.$q$, array[$o$bigger$o$, $o$big$o$, $o$biggest$o$, $o$more big$o$], 0, $e$1. One-syllable adjectives take -er in the comparative: big - bigger.

Diğer şıklar: **B** positive form / **C** superlative / **D** wrong comparative.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$Receptionist: Good evening. How can I help you?
Guest: I'd like to ______ a double room for two nights.$q$, array[$o$peel$o$, $o$book$o$, $o$bake$o$, $o$sing$o$], 1, $e$1. We book a room in a hotel.

Diğer şıklar: **A** unrelated verb / **C** unrelated verb / **D** unrelated verb.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$This is ______ hotel in the city.$q$, array[$o$more expensive$o$, $o$expensiver$o$, $o$most expensive$o$, $o$the most expensive$o$], 3, $e$1. For long adjectives we use "the most + adjective" for the superlative.

Diğer şıklar: **A** comparative / **B** wrong form / **C** missing the.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Look at the map.

The bank is next to the post office. The post office is opposite the library. The library is between the cafe and the park.

Where is the library?$q$, array[$o$Next to the bank$o$, $o$Opposite the bank$o$, $o$Between the cafe and the park$o$, $o$Next to the post office$o$], 2, $e$1. The text says: "The library is between the cafe and the park."

Diğer şıklar: **A** misreading / **B** misreading / **D** misreading.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Zeynep ______ visit the Hagia Sophia tomorrow.$q$, array[$o$is going to$o$, $o$went to$o$, $o$visits$o$, $o$visited$o$], 0, $e$1. "Tomorrow" shows a future plan, so we use "is going to".

Diğer şıklar: **B** past / **C** present simple / **D** past.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which one is a tourist attraction?$q$, array[$o$kitchen$o$, $o$pavement$o$, $o$pocket$o$, $o$castle$o$], 3, $e$1. Castles are visited by tourists.

Diğer şıklar: **A** not an attraction / **B** not an attraction / **C** not an attraction.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Tourist: Excuse me, where is the bus station?
Local: ______ It's on your right.$q$, array[$o$It's a very good restaurant.$o$, $o$Go straight ahead for two blocks.$o$, $o$The bus is yellow.$o$, $o$I love buses.$o$], 1, $e$1. The local gives directions: go straight ahead, then it is on the right.

Diğer şıklar: **A** unrelated answer / **C** unrelated answer / **D** unrelated answer.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Hotel A costs 80 dollars per night. Hotel B costs 120 dollars per night. Hotel C costs 100 dollars per night.

Which sentence is true?$q$, array[$o$Hotel B is the cheapest.$o$, $o$Hotel C is more expensive than Hotel B.$o$, $o$Hotel A is the cheapest.$o$, $o$Hotel A is more expensive than Hotel C.$o$], 2, $e$1. 80 is the lowest price, so Hotel A is the cheapest.

Diğer şıklar: **A** misreading / **B** misreading / **D** misreading.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$Summer is more hot than spring.$o$, $o$Summer is the hotter than spring.$o$, $o$Summer is hotter than spring.$o$, $o$Summer is hottest than spring.$o$], 2, $e$1. Comparative of hot: hotter. We use "than" after it.

Diğer şıklar: **A** wrong comparative / **B** extra the / **D** superlative with than.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$We are going to visit Cappadocia next month. We ______ the hot air balloons.$q$, array[$o$saw$o$, $o$see$o$, $o$have seen$o$, $o$are going to see$o$], 3, $e$1. The plan for the future needs "be going to".

Diğer şıklar: **A** past / **B** present / **C** present perfect.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which sentence gives a suggestion for tourists?$q$, array[$o$You shouldn't talk to anyone.$o$, $o$You must never leave the hotel.$o$, $o$You should try the local food.$o$, $o$You can't enjoy the holiday.$o$], 2, $e$1. "You should..." gives advice, and trying local food is a good suggestion for tourists.

Diğer şıklar: **A** unhelpful advice / **B** extreme advice / **D** negative.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$Which word is a direction word?$q$, array[$o$cheap$o$, $o$straight$o$, $o$noisy$o$, $o$tasty$o$], 1, $e$1. "Go straight" gives direction.

Diğer şıklar: **A** adjective of price / **C** adjective of sound / **D** adjective of food.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$The Blue Mosque is ______ than the Maiden's Tower.$q$, array[$o$old$o$, $o$oldest$o$, $o$more old$o$, $o$older$o$], 3, $e$1. Old - older - the oldest.

Diğer şıklar: **A** positive form / **B** superlative / **C** wrong comparative.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Chores konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Chores konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Chores$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which one is a household chore?$q$, array[$o$washing the dishes$o$, $o$playing chess$o$, $o$watching a film$o$, $o$listening to music$o$], 0, $e$1. Washing the dishes is a chore. The others are free time activities.

Diğer şıklar: **B** hobby / **C** free time / **D** free time.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$I ______ clean my room every Saturday.$q$, array[$o$has to$o$, $o$am have to$o$, $o$having to$o$, $o$have to$o$], 3, $e$1. With I we use "have to".

Diğer şıklar: **A** wrong subject agreement / **B** wrong structure / **C** wrong form.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which sentence asks for help politely?$q$, array[$o$Wash the dishes now.$o$, $o$You will wash the dishes.$o$, $o$Why don't you wash them?$o$, $o$Could you help me, please?$o$], 3, $e$1. "Could you...?" is a polite request.

Diğer şıklar: **A** order / **B** order / **C** complaint.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$Which sentence offers help?$q$, array[$o$Could you take out the rubbish?$o$, $o$Shall I take out the rubbish?$o$, $o$You must take out the rubbish.$o$, $o$Take out the rubbish.$o$], 1, $e$1. "Shall I...?" offers help.

Diğer şıklar: **A** request / **C** order / **D** order.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$You ______ run in the hospital. It is forbidden.$q$, array[$o$mustn't$o$, $o$don't have to$o$, $o$have to$o$, $o$doesn't have to$o$], 0, $e$1. "Mustn't" means it is forbidden.

Diğer şıklar: **B** not necessary / **C** necessary / **D** wrong subject.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$It's Sunday. I ______ get up early because I have no school.$q$, array[$o$don't have to$o$, $o$mustn't$o$, $o$must$o$, $o$have to$o$], 0, $e$1. "Don't have to" means it isn't necessary.

Diğer şıklar: **B** forbidden / **C** necessary / **D** necessary.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Mum: The kitchen is dirty.
Deniz: ______ I'll clean it right away.$q$, array[$o$No way!$o$, $o$I don't care.$o$, $o$OK, Mum.$o$, $o$Do it yourself.$o$], 2, $e$1. Deniz accepts to clean the kitchen. The answer should be positive.

Diğer şıklar: **A** refusing / **B** rude / **D** rude.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$She have to set the table every evening.$o$, $o$She has to sets the table every evening.$o$, $o$She has to set the table every evening.$o$, $o$She haves to set the table every evening.$o$], 2, $e$1. With she we use "has to" + base verb.

Diğer şıklar: **A** wrong agreement / **B** -s after to / **D** wrong form.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Selin: Could you pass me the broom, please?
Arda: ______$q$, array[$o$It's not fair.$o$, $o$Sure, here you are.$o$, $o$I'm sorry, I have a broom.$o$, $o$You must be joking.$o$], 1, $e$1. A positive answer to a request: "Sure, here you are."

Diğer şıklar: **A** unrelated / **C** illogical / **D** unrelated.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Look at the chore chart.

| Name | Chore |
| --- | --- |
| Ali | takes out the rubbish |
| Bora | sets the table |
| Cem | does the dishes |

Which sentence is true?$q$, array[$o$Ali has to do the dishes.$o$, $o$Cem has to take out the rubbish.$o$, $o$Bora has to set the table.$o$, $o$Bora doesn't have to set the table.$o$], 2, $e$1. The chart shows Bora sets the table.

Diğer şıklar: **A** misreading / **B** misreading / **D** contradicts the chart.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$You ______ tell lies to your parents. You ______ be honest with them.$q$, array[$o$must / mustn't$o$, $o$mustn't / must$o$, $o$don't have to / mustn't$o$, $o$mustn't / don't have to$o$], 1, $e$1. Lying is forbidden, so "mustn't". Being honest is necessary, so "must".

Diğer şıklar: **A** swapped / **C** wrong modals / **D** wrong second modal.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which pair has a similar meaning?$q$, array[$o$I must do my homework. - I have to do my homework.$o$, $o$You mustn't smoke. - You don't have to smoke.$o$, $o$I don't have to go. - I mustn't go.$o$, $o$She must come. - She doesn't have to come.$o$], 0, $e$1. Must and have to both express necessity.

Diğer şıklar: **B** different meaning / **C** different meaning / **D** different meaning.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Mother: Can you help me carry the bags?
Son: ______$q$, array[$o$No, thanks. You can do it.$o$, $o$Of course. I'll carry them.$o$, $o$I mustn't carry anything.$o$, $o$They are your bags.$o$], 1, $e$1. "I'll..." is used when we offer to help at that moment.

Diğer şıklar: **A** refusing but unnatural / **C** illogical / **D** unhelpful.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which sentence is NOT an offer?$q$, array[$o$Shall I wash the car?$o$, $o$I'll wash the car.$o$, $o$Could you wash the car?$o$, $o$Would you like me to wash the car?$o$], 2, $e$1. "Could you...?" is a request, not an offer.

Diğer şıklar: **A** offer / **B** offer / **D** offer.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$In my family, everybody ______ share the housework.$q$, array[$o$have to$o$, $o$mustn't$o$, $o$can't$o$, $o$has to$o$], 3, $e$1. Everybody is singular, so "has to".

Diğer şıklar: **A** wrong agreement / **B** forbidden / **C** wrong meaning.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which word is related to housework?$q$, array[$o$telescope$o$, $o$volcano$o$, $o$passport$o$, $o$vacuum$o$], 3, $e$1. We vacuum the carpet.

Diğer şıklar: **A** unrelated / **B** unrelated / **C** unrelated.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Science konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Science konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Science$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Who invented the telephone?$q$, array[$o$Thomas Edison$o$, $o$Albert Einstein$o$, $o$Alexander Graham Bell$o$, $o$Isaac Newton$o$], 2, $e$1. Alexander Graham Bell invented the telephone.
2. Edison is known for the light bulb.

Diğer şıklar: **A** inventor of the light bulb / **B** scientist of relativity / **D** scientist of gravity.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$The light bulb ______ by Thomas Edison.$q$, array[$o$invented$o$, $o$is inventing$o$, $o$was invented$o$, $o$invents$o$], 2, $e$1. Passive past simple: was/were + past participle.

Diğer şıklar: **A** active form / **B** wrong tense and voice / **D** active form.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$Which word means "a person who studies science"?$q$, array[$o$tourist$o$, $o$scientist$o$, $o$customer$o$, $o$neighbour$o$], 1, $e$1. A scientist does research.

Diğer şıklar: **A** person who travels / **C** person who buys / **D** person next door.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$If you heat water to 100 degrees, it ______.$q$, array[$o$boils$o$, $o$freezes$o$, $o$disappears forever$o$, $o$turns into gold$o$], 0, $e$1. Zero conditional: if + present simple, present simple. Water boils at 100 degrees.

Diğer şıklar: **B** opposite result / **C** wrong result / **D** wrong result.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$Penicillin ______ by Alexander Fleming in 1928.$q$, array[$o$discovered$o$, $o$is discovered$o$, $o$were discovered$o$, $o$was discovered$o$], 3, $e$1. Past passive: was discovered. The year 1928 shows past simple.

Diğer şıklar: **A** active form / **B** present passive / **C** wrong agreement.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$Which sentence is passive?$q$, array[$o$Millions of people watched the Moon landing.$o$, $o$People love the Moon.$o$, $o$The Moon landing was watched by millions of people.$o$, $o$Scientists study the Moon.$o$], 2, $e$1. The passive sentence has "was watched by".

Diğer şıklar: **A** active sentence / **B** active sentence / **D** active sentence.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$If you mix red and blue, you ______ purple.$q$, array[$o$will got$o$, $o$getting$o$, $o$gets will$o$, $o$get$o$], 3, $e$1. Zero conditional is used for facts. Present simple in both parts.

Diğer şıklar: **A** wrong form / **B** wrong form / **C** wrong structure.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$Put the steps of the scientific method in order.

I. Collect the data.
II. Ask a question.
III. Make a hypothesis.

Which order is correct?$q$, array[$o$I, II, III$o$, $o$III, I, II$o$, $o$II, I, III$o$, $o$II, III, I$o$], 3, $e$1. First we ask a question, then make a hypothesis, then collect data.

Diğer şıklar: **A** data first / **B** hypothesis first / **C** data before hypothesis.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which one is a famous Turkish scientist?$q$, array[$o$Aziz Sancar$o$, $o$Marie Curie$o$, $o$Isaac Newton$o$, $o$Nikola Tesla$o$], 0, $e$1. Aziz Sancar is a Turkish scientist who won the Nobel Prize in Chemistry in 2015.

Diğer şıklar: **B** Polish-French scientist / **C** English scientist / **D** Serbian-American inventor.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Look at the table.

| Invention | Inventor | Year |
| --- | --- | --- |
| Telephone | Bell | 1876 |
| Light bulb | Edison | 1879 |
| Airplane | Wright brothers | 1903 |

Which sentence is true?$q$, array[$o$The telephone was invented by Edison.$o$, $o$The airplane was invented in 1903.$o$, $o$The light bulb was invented in 1876.$o$, $o$The airplane was invented by Bell.$o$], 1, $e$1. The table shows the Wright brothers invented the airplane in 1903.

Diğer şıklar: **A** wrong inventor / **C** wrong year / **D** wrong inventor.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Complete the sentence.

If plants don't get enough water, they ______.$q$, array[$o$die$o$, $o$grow faster$o$, $o$become taller$o$, $o$turn blue$o$], 0, $e$1. Zero conditional gives a general fact. Plants die without water.

Diğer şıklar: **B** illogical result / **C** illogical result / **D** illogical result.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Which sentence is NOT correct?$q$, array[$o$The Eiffel Tower was built in 1889.$o$, $o$The telephone was invented by Bell.$o$, $o$The Eiffel Tower is built in 1889.$o$, $o$The first computer was built in the 1940s.$o$], 2, $e$1. The year 1889 is in the past, so we need "was built", not "is built".

Diğer şıklar: **A** correct / **B** correct / **D** correct.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$Mr Brown: Why is this experiment important?
Student: ______$q$, array[$o$Because it shows how plants grow.$o$, $o$Because I like my teacher.$o$, $o$Because it is lunch time.$o$, $o$Because I forgot my pencil.$o$], 0, $e$1. The student explains the purpose of the experiment.

Diğer şıklar: **B** unrelated answer / **C** unrelated answer / **D** unrelated answer.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which pair is correct?$q$, array[$o$microscope - telescope$o$, $o$heat - cold$o$, $o$laboratory - library$o$, $o$scientist - doctor$o$], 1, $e$1. Heat and cold are opposites. The other pairs are not opposite words.

Diğer şıklar: **A** not opposite / **C** not opposite / **D** not opposite.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$Which tool do scientists use to see very small things?$q$, array[$o$telescope$o$, $o$microscope$o$, $o$thermometer$o$, $o$calculator$o$], 1, $e$1. A microscope shows tiny objects.

Diğer şıklar: **A** for far objects / **C** for temperature / **D** for numbers.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which tool shows the temperature?$q$, array[$o$microscope$o$, $o$telescope$o$, $o$scale$o$, $o$thermometer$o$], 3, $e$1. A thermometer measures temperature.

Diğer şıklar: **A** for small objects / **B** for far objects / **C** for weight.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-ing | Natural Forces konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-ing', t.id, $t$Natural Forces konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Natural Forces$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', null::integer, $q$Which one is a natural disaster?$q$, array[$o$earthquake$o$, $o$birthday$o$, $o$festival$o$, $o$holiday$o$], 0, $e$1. An earthquake is a natural disaster.

Diğer şıklar: **B** event / **C** event / **D** event.$e$, 1),
  (2, 'lgs-ing', null::integer, $q$What should you do during an earthquake?$q$, array[$o$Drop, cover and hold on.$o$, $o$Run to the lift.$o$, $o$Stand near the window.$o$, $o$Go to the top floor.$o$], 0, $e$1. During an earthquake we drop to the ground, cover our head and hold on to something strong.

Diğer şıklar: **B** dangerous action / **C** dangerous action / **D** dangerous action.$e$, 1),
  (3, 'lgs-ing', null::integer, $q$You ______ stay near windows during a storm.$q$, array[$o$should$o$, $o$must$o$, $o$shouldn't$o$, $o$can$o$], 2, $e$1. Windows can break in a storm, so we shouldn't stay near them.

Diğer şıklar: **A** wrong advice / **B** wrong advice / **D** wrong advice.$e$, 1),
  (4, 'lgs-ing', null::integer, $q$A very strong wind that turns round and round is called a ______.$q$, array[$o$volcano$o$, $o$flood$o$, $o$tornado$o$, $o$drought$o$], 2, $e$1. A tornado is a rotating column of air.

Diğer şıklar: **A** different disaster / **B** different disaster / **D** different disaster.$e$, 1),
  (5, 'lgs-ing', null::integer, $q$A long time without rain causes a ______.$q$, array[$o$flood$o$, $o$drought$o$, $o$tsunami$o$, $o$avalanche$o$], 1, $e$1. Drought means a long dry period.

Diğer şıklar: **A** too much water / **C** sea wave / **D** snow slide.$e$, 2),
  (6, 'lgs-ing', null::integer, $q$Which item should be in an emergency kit?$q$, array[$o$a comic book and a toy$o$, $o$a torch and water$o$, $o$a football and a ball$o$, $o$a game console and chips$o$], 1, $e$1. An emergency kit has water, food, a torch and a first aid kit.

Diğer şıklar: **A** not useful in an emergency / **C** not useful in an emergency / **D** not useful in an emergency.$e$, 2),
  (7, 'lgs-ing', null::integer, $q$Last year there ______ a big flood in our town.$q$, array[$o$was$o$, $o$were$o$, $o$is$o$, $o$be$o$], 0, $e$1. Flood is singular and the sentence is in the past, so "was".

Diğer şıklar: **B** wrong agreement / **C** present / **D** wrong form.$e$, 2),
  (8, 'lgs-ing', null::integer, $q$When the earthquake started, we ______ dinner.$q$, array[$o$have$o$, $o$were having$o$, $o$had been have$o$, $o$are having$o$], 1, $e$1. A longer action in the past is shown with past continuous.

Diğer şıklar: **A** present / **C** wrong form / **D** present continuous.$e$, 2),
  (9, 'lgs-ing', null::integer, $q$Which sentence is good advice for a fire?$q$, array[$o$You should leave the building quickly.$o$, $o$You should hide in the cupboard.$o$, $o$You should open all the windows and wait.$o$, $o$You should take the lift.$o$], 0, $e$1. Leaving the building quickly is safer. We never use the lift during a fire.

Diğer şıklar: **B** dangerous advice / **C** dangerous advice / **D** dangerous advice.$e$, 2),
  (10, 'lgs-ing', null::integer, $q$Read the text.

A strong earthquake hit the city at 3 am. Many buildings fell down. Rescue teams worked day and night to help people. Volunteers brought food and blankets.

What did the volunteers do?$q$, array[$o$They built new buildings.$o$, $o$They worked as rescue teams.$o$, $o$They left the city.$o$, $o$They brought food and blankets.$o$], 3, $e$1. The text says: "Volunteers brought food and blankets."

Diğer şıklar: **A** not in the text / **B** confusing groups / **C** not in the text.$e$, 3),
  (11, 'lgs-ing', null::integer, $q$Why do volcanoes erupt?$q$, array[$o$Because the wind is very strong.$o$, $o$Because the sea is very deep.$o$, $o$Because there is too much rain.$o$, $o$Because hot melted rock rises up.$o$], 3, $e$1. Magma rises and erupts through the volcano.

Diğer şıklar: **A** wrong cause / **B** wrong cause / **C** wrong cause.$e$, 3),
  (12, 'lgs-ing', null::integer, $q$Ayşe: Where were you during the storm?
Can: ______ at home with my family.$q$, array[$o$I am$o$, $o$I was$o$, $o$I will be$o$, $o$I have been$o$], 1, $e$1. The question is in the past. "I was at home" fits.

Diğer şıklar: **A** present / **C** future / **D** wrong tense.$e$, 3),
  (13, 'lgs-ing', null::integer, $q$What does "evacuate" mean?$q$, array[$o$to build a new house$o$, $o$to play a computer game$o$, $o$to buy food and water$o$, $o$to leave a dangerous place$o$], 3, $e$1. People evacuate a place when it is dangerous, for example in a flood.

Diğer şıklar: **A** different meaning / **B** different meaning / **C** different meaning.$e$, 3),
  (14, 'lgs-ing', null::integer, $q$Which sentence is correct?$q$, array[$o$You should to prepare an emergency kit.$o$, $o$You should prepares an emergency kit.$o$, $o$You should preparing an emergency kit.$o$, $o$You should prepare an emergency kit.$o$], 3, $e$1. After should we use the base form.

Diğer şıklar: **A** to after should / **B** -s after should / **C** -ing after should.$e$, 3),
  (15, 'lgs-ing', null::integer, $q$What is a tsunami?$q$, array[$o$A very hot summer day$o$, $o$A heavy snowfall$o$, $o$A giant sea wave$o$, $o$A fast train$o$], 2, $e$1. A tsunami is a giant wave usually caused by an earthquake under the sea.

Diğer şıklar: **A** different meaning / **B** different meaning / **D** unrelated.$e$, 2),
  (16, 'lgs-ing', null::integer, $q$Which of these is a cause of floods?$q$, array[$o$a sunny day$o$, $o$dry weather$o$, $o$heavy rain$o$, $o$a cold wind$o$], 2, $e$1. Heavy rain can make rivers overflow.

Diğer şıklar: **A** opposite / **B** opposite / **D** not a cause.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

