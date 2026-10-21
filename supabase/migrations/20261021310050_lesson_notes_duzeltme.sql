-- LGS Fen konu anlatımı notlarında düz metinde görünen formül işaretlerini temizler.

update public.lesson_notes set body = $lesson$Program: Mevsimlerin oluşumu (eksen eğikliği, dolanma), hava olayları ve iklim, iklimi etkileyen faktörler, sera etkisi, küresel ısınma ve iklim değişikliği, karbon ayak izi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Mevsim başlangıç tarihleri (21 Mart, 21 Haziran, 23 Eylül, 22 Aralık), (b) eksen eğikliği değeri (23^° 27'), (c) 8. sınıf programında iklim türleri ya da Köppen sınıflaması aranmaz, bilerek konmadı, (d) soruların LGS tarzına uyup uymadığı.$lesson$
where topic_id = (select id from public.topics where subject_id = 'lgs-fen' and name = 'Mevsimler ve İklim') and body like '%$%';

update public.lesson_notes set body = $lesson$Program: Atomdaki yükler, yüklü cisimlerin etkileşimi, yüklenme çeşitleri (sürtünme, dokunma, etki), elektroskop, iletken ve yalıtkan, topraklama, paratoner, elektrik enerjisi ve tasarrufu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Etki ile yüklenme anlatımı (adımların sırası), (b) Elektrik enerjisi hesabında kWh ve E = P · t formülünün 8. sınıf kapsamında olup olmadığı, (c) Elektroskop ve yalıtkan örnekleri, (d) soruların LGS tarzına uyup uymadığı.$lesson$
where topic_id = (select id from public.topics where subject_id = 'lgs-fen' and name = 'Elektrik Yükleri ve Elektrik Enerjisi') and body like '%$%';
