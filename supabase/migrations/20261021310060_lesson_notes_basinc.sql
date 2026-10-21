-- Basınç anlatımının notunda düz metinde görünen formül işaretlerini temizler.
update public.lesson_notes set body = replace(replace(replace(replace(body, '$P = h \cdot d \cdot g$', 'P = h · d · g'), '$', ''), '\cdot', '·'), '  ', ' ')
where topic_id = (select id from public.topics where subject_id = 'lgs-fen' and name = 'Basınç') and body like '%$%';
