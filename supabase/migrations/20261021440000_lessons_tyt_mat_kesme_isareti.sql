-- Bölme ve Bölünebilme mini testinde kesme işaretinin önünde kalan ters eğik çizgiyi kaldırır.
update public.lessons l
set body = replace(l.body, $o$sayısı 45\'e tam bölünebildiğine$o$, $n$sayısı 45'e tam bölünebildiğine$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Bölme ve Bölünebilme';
