-- Olumsuz kökte olumsuzluk ifadesi de koyu yazıldı (MEB bağlam temelli soru yazım kılavuzu).

update public.lessons l
set body = replace(l.body, $o$Aşağıdaki cümlelerin hangisinde **büyük harf kullanımı** yanlıştır?$o$, $n$Aşağıdaki cümlelerin hangisinde **büyük harf kullanımı yanlıştır**?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Yazım Kuralları';
