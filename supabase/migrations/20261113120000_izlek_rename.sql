-- Uygulamanın adı İzlek, adresi izlek.site oldu. Anlatım görsellerindeki ve bildirimlerdeki eski ad güncellenir.
update public.lessons set body = replace(body, 'Yolumnet', 'İzlek') where body like '%Yolumnet%';
update public.notifications set title = replace(title, 'Yolumnet', 'İzlek'), body = replace(body, 'Yolumnet', 'İzlek') where title like '%Yolumnet%' or body like '%Yolumnet%';
