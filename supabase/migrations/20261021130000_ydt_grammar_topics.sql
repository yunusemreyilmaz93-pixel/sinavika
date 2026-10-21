-- YDT İngilizce'de soru tipleri konu değil. 21. sorudan sonra konu yok, ilk 20 soru kelime ve gramer.
-- Konular kelime bilgisi ve gramer başlıkları olur. Dil Bilgisi tek konu olarak Tenses'e dönüştürülür.
do $$
declare
  names text[] := array[
    'Kelime Bilgisi', 'Pronouns', 'Tenses', 'Modals', 'Passive Voice', 'Gerunds ve Infinitives', 'Participles',
    'Adjectives', 'Adverbs', 'Relative Clauses', 'Noun Clauses', 'Conditionals', 'Wish Clauses',
    'Determiners ve Quantifiers', 'Prepositions', 'Conjunctions ve Linkers', 'Comparison ve Correlatives'
  ];
  n text;
  i integer := 0;
begin
  if not exists (select 1 from public.topics where subject_id = 'ydt-dil' and name = 'Tenses') then
    update public.topics set name = 'Tenses' where subject_id = 'ydt-dil' and name = 'Dil Bilgisi';
  end if;

  delete from public.topics
  where subject_id = 'ydt-dil'
    and name in ('Dil Bilgisi', 'Cloze Test', 'Cümle Tamamlama', 'İngilizceden Türkçeye Çeviri', 'Türkçeden İngilizceye Çeviri',
                 'Paragraf', 'Diyalog Tamamlama', 'Yakın Anlamlı Cümle', 'Anlamı Bozan Cümle');

  foreach n in array names loop
    i := i + 1;
    if exists (select 1 from public.topics where subject_id = 'ydt-dil' and name = n) then
      update public.topics set sort = i where subject_id = 'ydt-dil' and name = n;
    else
      insert into public.topics (subject_id, name, sort) values ('ydt-dil', n, i);
    end if;
  end loop;
end $$;
