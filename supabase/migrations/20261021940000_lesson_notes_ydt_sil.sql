-- YDT İngilizce konu anlatımlarının yönetici notları kaldırılır

delete from public.lesson_notes n
using public.topics t
where t.id = n.topic_id and t.subject_id = 'ydt-dil';
