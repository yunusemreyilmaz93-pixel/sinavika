-- AYT Coğrafya anlatımlarında "Kendini dene" soruları öğrenciye "sen" diliyle yazılır.
update public.lessons l
set body = replace(l.body, 'söyleyiniz', 'söyle')
from public.topics t
where t.id = l.topic_id
  and t.subject_id in ('ayt-cog1', 'ayt-cog2')
  and position('söyleyiniz' in l.body) > 0;
