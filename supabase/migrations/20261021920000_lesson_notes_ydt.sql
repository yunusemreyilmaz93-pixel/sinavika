-- YDT İngilizce yönetici notları: program, doğrulama durumu ve açık noktalar

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Zaman, yer ve yön edatları, fiil, sıfat ve isim sonrası bağımlı edatlar, sabit edatlı ifadeler, anlam edatları (because of, due to, thanks to, despite, rather than gibi), edat ile bağlaç farkı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Bağımlı edat listeleri genel kabul gören kullanıma göre yazıldı, tek bir sözlükle satır satır karşılaştırılmadı. 15. soru cevaplarının listesi çıkmış sorulardan elle çıkarıldı.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Prepositions'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Bağlaç türleri, karşıtlık, sebep-sonuç, amaç, koşul, zaman, ekleme ve örnekleme bağlantıları, linker noktalaması, cümle tamamlama ve cloze çözüm yolu.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Cümle tamamlama sayımında bir soru birden çok ölçüte uyuyor olabilir, bu yüzden sayılar yaklaşıktır. Bağlantı sözcüğü noktalaması İngiliz yazım kuralına göre anlatıldı.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Conjunctions ve Linkers'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Modal fiillerin yapısı, yetenek, izin, ihtimal ve çıkarım, zorunluluk ve yasak, tavsiye, geçmiş modal kalıpları, would, modal ile edilgen ve sürekli yapı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Modal anlamları genel dilbilgisi kabulüne göre yazıldı. Bazı kullanımlar (needn't have ile didn't need to farkı) farklı kaynaklarda farklı sunulabilir.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Modals'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Edilgen yapının bütün zamanlarda ve modalle kuruluşu, edilgeni olmayan fiiller, iki nesneli fiiller, haber aktarma edilgeni, mastar ve fiilimsi edilgeni, ettirgen yapı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Edilgenin sınav sayısı (11 soru) bir soruda iki yapı bulunduğu için tek tek sayıldı ve fiilimsi edilgenleri de içeriyor.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Passive Voice'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Gerund ve infinitive görevleri, gerund ve infinitive alan fiiller, anlamı değişen fiiller (remember, stop, try), nesneli kalıplar, bare infinitive, edat sonrası gerund, perfect ve passive biçimler.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Fiil listeleri sınavda en sık çıkan fiilleri kapsar, tüm fiilleri içermez. Suggest ve recommend sonrası subjunctive anlatımı Noun Clauses konusunda ayrıca verildi.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Gerunds ve Infinitives'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Present, past ve perfect participle, -ing ve -ed sıfatları, kısaltılmış sıfat cümleciği, zarf cümleciği kısaltması, özne uyumu, sabit participle ifadeleri.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Sekiz participle sorusunun bir kısmı infinitive ile birlikte sayıldı, bu yüzden Gerunds ve Infinitives konusundaki sayıyla örtüşür.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Participles'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Sıfatın yeri, sıfat sırası, -ing ve -ed sıfatları, bileşik sıfatlar, sıfat ve zarf farkı, derecelendirilebilir ve derecelendirilemeyen sıfatlar, sıfat soneki, sınavda çıkan sıfatlar.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Kelime bölümünde 2. sorunun sekiz yılın sekizinde sıfat olması çıkmış sorulardan çıkarılan bir örüntüdür. ÖSYM bunu açıklanmış bir kural olarak yayımlamadı.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Adjectives'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Zarf türleri, oluşturma, anlamı değişen çiftler, zarfın yeri, derece zarfları, zarf ve sıfat eşleşmeleri, cümle zarfları, olumsuz zarflarla devrik yapı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Kelime bölümünde 3. sorunun sekiz yılın sekizinde zarf olması çıkmış sorulardan çıkarılan bir örüntüdür. ÖSYM bunu açıklanmış bir kural olarak yayımlamadı.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Adverbs'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Relative zamirleri, belirleyici ve ek bilgi veren cümlecik, edat + whom / which, nicelik + of which, whose, which ile önceki cümleye gönderme, where, when, why, kısaltma.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Sıfat cümleciği 2018-2025 dilbilgisi sorularında doğrudan çıkmadı. Önemi okuma, cümle tamamlama ve çeviri sorularındaki yoğunluğa dayanıyor, bu yönüyle bir öngörüdür.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Relative Clauses'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: That, wh- ve whether cümlecikleri, dolaylı soru sözcük sırası, whether ve if farkı, what ve that farkı, -ever cümlecikleri, it ile başlayan kalıplar, subjunctive, zaman uyumu.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: İsim cümleciği 2018-2025 dilbilgisi sorularında doğrudan çıkmadı. Metinde verilen geçiş sayıları (that, whether, what) basit bir metin taramasına dayanır ve yaklaşıktır.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Noun Clauses'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Sıfır, birinci, ikinci ve üçüncü tür koşul, karma koşul, ana cümlecikte modal, edilgen, devrik koşul, unless, provided that, in case, if'siz koşul, if, when ve whether farkı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Koşul cümlesi iki soruda açık biçimde çıktı (2024 ve 2025). Diğer yıllarda koşul yapısı seçeneklerin içinde yer alıyor olabilir, bu sayıma dahil değil.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Conditionals'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Wish ve if only ile şimdiki, geçmiş ve gelecek dilekler, as if ve as though, would rather, it's time, suppose, wish ile hope farkı.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Wish yapıları 2018-2025 dilbilgisi sorularında çıkmadı. Konu düşük sıklıklı olarak sunuldu. YDS ve YÖKDİL gibi sınavlardaki sıklığı bu çalışmada incelenmedi.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Wish Clauses'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Belirleyici türleri, sayılabilir ve sayılamaz isimle nicelik sözcükleri, few ve a few, some, any, no, none, each, every, all, both, either, neither, other ve another ailesi, özne-fiil uyumu, artikeller.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: 13. soru cevap listesi çıkmış sorulardan elle çıkarıldı. Artikel bölümü özet niteliğinde, sınavda doğrudan çıkmadı.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Determiners ve Quantifiers'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Kişi ve iyelik zamirleri, dönüşlü ve karşılıklı zamirler, this, that, one, ones, that of ve those of, it'in kullanımları, belirsiz zamirler, so ve not ile yerine koyma, gönderme.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Zamirler 2018-2025 dilbilgisi sorularında ayrı bir soru olarak çıkmadı. Paragraf tamamlama ve çeviri sorularındaki önemi çıkmış çeviri ve paragraf soruları incelenmeden yazıldı, bu bir öngörüdür.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Pronouns'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: Eşitlik, üstünlük ve en üstünlük, as ... as kalıpları, the more ... the more, so ... that, such ... that, too ve enough, ikili bağlaçlar (either ... or, neither ... nor, both ... and, not only ... but also), paralellik.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: 14. soru cevap listesi çıkmış sorulardan elle çıkarıldı. Eşitlik kalıplarının sekiz yılın üçünde çıkması küçük bir örneklemdir.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Comparison ve Correlatives'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();

insert into public.lesson_notes (topic_id, body)
select id, $n$Program: YDT'nin 80 soruluk bölüm yapısı, kelime bilgisi sorularının 1-5 düzeni, bağlamdan anlam çıkarma, sözcük yapısı ve sözcük aileleri, akademik isim, fiil ve sıfat listeleri, deyimsel fiiller, eşleşmeler, karıştırılan sözcükler, eşanlam ve zıt anlam grupları.
Kazanım: MEB'in YDT 11 ve 12. sınıf Grammar ve Vocabulary kitapları (OGM Materyal) taranmış görüntü olduğu için okunamadı, kazanım eşleştirmesi yapılmadı. Kapsam ÖSYM'nin 2018 ve 2025 YDT İngilizce kitapçıkları ile MEB'in 2018-2025 çıkmış soru kitabına göre belirlendi.
Doğrulama: Çıkmış soru kitabındaki 80 dilbilgisi, 40 kelime, 40 cloze ve 64 cümle tamamlama sorusu tek tek çözülerek sayımlar çıkarıldı. Metindeki sayılar bu incelemenin sonucudur. Sorular ve anlatım, dilbilgisi doğruluğu için ayrıca bağımsız bir okumadan geçti.
Kaynak: Metin ve sorular özgündür. ÖSYM soruları kopyalanmadı, yalnızca kalıp ve sayım olarak kullanıldı. Doğru cevap anahtarı yayımlanmış bir kaynaktan alınmadı, çıkmış sorular elle çözüldü.
Açık nokta: Sınav süresi (120 dakika) ve net hesabı (doğru eksi yanlışın dörtte biri) ÖSYM kılavuzundan doğrulanmadı. Yayından önce güncel YKS kılavuzuyla karşılaştırılmalı. Akademik sözcük listeleri çıkmış sorulardan ve genel akademik kullanıma göre seçildi, tam bir sıklık listesi değildir.$n$ from public.topics where subject_id = 'ydt-dil' and name = 'Kelime Bilgisi'
on conflict (topic_id) do update set body = excluded.body, updated_at = now();
