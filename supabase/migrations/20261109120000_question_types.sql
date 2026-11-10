-- YDT soru tipleri (Cloze, Paragraf Tamamlama vb.) genel denemelerden ayrı, kendi bölümünde listelenir.
alter table public.question_sets drop constraint question_sets_kind_check;
alter table public.question_sets add constraint question_sets_kind_check check (kind in ('konu', 'brans', 'deneme', 'tip'));
alter table public.question_sets add column question_type text check (question_type ~ '^[a-z0-9-]{1,40}$');
alter table public.question_sets add constraint question_sets_type_check check ((kind = 'tip') = (question_type is not null));

update public.question_sets set kind = 'tip', subject_id = 'ydt-dil', title = replace(title, 'YDT ', ''), question_type = case id
  when 80 then 'cloze'
  when 81 then 'cumle-tamamlama'
  when 82 then 'diyalog-tamamlama'
  when 83 then 'anlamca-en-yakin-cumle'
  when 84 then 'durum'
  when 85 then 'paragraf-tamamlama'
  when 86 then 'ingilizce-turkce-ceviri'
  when 87 then 'turkce-ingilizce-ceviri'
  when 88 then 'anlam-butunlugunu-bozan-cumle'
  when 89 then 'okuma'
end
where id between 80 and 89 and kind = 'deneme' and exam = 'YDT';

create index question_sets_type_idx on public.question_sets (exam, question_type, sort) where kind = 'tip';
