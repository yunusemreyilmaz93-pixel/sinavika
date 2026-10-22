-- TYT Türkçe yönetici notlarını doğrulama durumuyla günceller

update public.lesson_notes n
set body = $n$Program: Sözcükte anlam (gerçek, yan, mecaz, terim), somut ve soyut anlam, eş sesli, eş anlamlı ve zıt anlamlı sözcükler, deyim ve atasözü.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Deyim ve atasözü örnekleri TDK sözlüklerine göre ayrıca taranmadı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Sözcükte Anlam';

update public.lesson_notes n
set body = $n$Program: Cümlede anlam, neden-sonuç, amaç-sonuç, koşul-sonuç, karşılaştırma, tanım, örnekleme, öznel ve nesnel yargı, kesinlik ve olasılık, çıkarım.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Soru köklerinin yazımı ÖSYM çıkmış sorularının biçimine göre kuruldu, güncel yıl soruları ayrıca taranmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümlede Anlam';

update public.lesson_notes n
set body = $n$Program: Paragrafın yapısı, konu, ana düşünce, yardımcı düşünce, anlatım biçimleri, düşünceyi geliştirme yolları, akışı bozan cümle, paragraf tamamlama, cümle sıralama, paragraf bölme.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Paragraf soruları ÖSYM biçimine göre özgün yazıldı. Anlatım biçimleri ve düşünceyi geliştirme yollarının adlandırması kaynaktan kaynağa değişebilir, metindeki adlandırma ders kitaplarında kullanılanla aynı olmayabilir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Paragraf';

update public.lesson_notes n
set body = $n$Program: Ünlüler, ünsüzler, büyük ve küçük ünlü uyumu, ünsüz benzeşmesi, ünsüz yumuşaması, ünlü düşmesi, ünlü daralması, ünsüz türemesi, ulama, hece.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Sert ünsüz benzeşmesi ve ulama ayrıntıları genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Ses Bilgisi';

update public.lesson_notes n
set body = $n$Program: Büyük harflerin kullanımı, de/da, ki, mi, birleşik sözcükler, sayıların yazımı, kesme işareti, sık yanlış yazılan sözcükler.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Ay ve gün adlarının büyük harfle yazımı ile sayıların yazımı bu çalışmada TDK kuralına göre düzeltildi. Sık yanlış yazılan sözcük listesi yeni TDK Yazım Kılavuzu baskısıyla tek tek karşılaştırılmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Yazım Kuralları';

update public.lesson_notes n
set body = $n$Program: Nokta, virgül, noktalı virgül, iki nokta, soru işareti, ünlem, üç nokta, tırnak, yay ayraç, kısa çizgi, eğik çizgi, uzun çizgi.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Tarihte virgül kullanımı bu çalışmada düzeltildi. Uzun çizgi ve eğik çizgi ayrıntıları TDK yazım kılavuzuna göre yazıldı, kılavuz baskısıyla satır satır karşılaştırılmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Noktalama İşaretleri';

update public.lesson_notes n
set body = $n$Program: Kök, gövde, ek, yapım ekleri, çekim ekleri, yapıca sözcük türleri (basit, türemiş, birleşik), birleşik sözcük çeşitleri.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Birleşik sözcük çeşitlerinde sınıflandırma kaynaktan kaynağa değişebilir. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Sözcükte Yapı';

update public.lesson_notes n
set body = $n$Program: İsim ve türleri (cins, özel, somut, soyut, topluluk), isim tamlamaları, sıfat ve türleri (niteleme, işaret, sayı, belgisiz, soru), sıfat tamlaması, adlaşmış sıfat.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Soru sıfatı örneği düzeltildi. Adlaşmış sıfat ve sıfat tamlaması ayrımı genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'İsim ve Sıfat';

update public.lesson_notes n
set body = $n$Program: Zamir ve türleri (kişi, işaret, belgisiz, soru, dönüşlülük, ilgi), zarf ve türleri (durum, zaman, yer-yön, miktar, soru), zamir-sıfat ve zarf-sıfat ayrımı.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Zamir-sıfat ve zarf-sıfat ayrımı genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Zamir ve Zarf';

update public.lesson_notes n
set body = $n$Program: Edat, bağlaç ve ünlem, bağlaç türleri, "ile", "de" ve "ki" sözcüklerinin görevleri.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Edat ve bağlaç listeleri kaynaktan kaynağa küçük farklar gösterir. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Edat, Bağlaç, Ünlem';

update public.lesson_notes n
set body = $n$Program: Fiilin anlam özellikleri, olumlu ve olumsuz fiil, haber ve dilek kipleri, birleşik zamanlı fiiller, ek fiil, kip ile zaman anlamı ilişkisi.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Kip ve zaman adlandırması ders kitaplarında kullanılanla aynı olmayabilir. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiiller ve Ek Fiil';

update public.lesson_notes n
set body = $n$Program: Fiilimsiler (isim-fiil, sıfat-fiil, zarf-fiil), ekleri, cümledeki görevleri, çekimli fiille ayrımı.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Fiilimsi eklerinin sınıflaması genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiilimsiler';

update public.lesson_notes n
set body = $n$Program: Fiil çatısı, özneye göre (etken, edilgen, dönüşlü, işteş) ve nesneye göre (geçişli, geçişsiz, ettirgen, oldurgan) çatılar, çatı ekleri.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Çatı sınıflaması (özneye ve nesneye göre) genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Fiil Çatısı';

update public.lesson_notes n
set body = $n$Program: Cümlenin ögeleri (yüklem, özne, nesne, dolaylı tümleç, zarf tümleci, edat tümleci), özne türleri, öge dizilişi.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Öge sınıflaması genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümlenin Ögeleri';

update public.lesson_notes n
set body = $n$Program: Cümle türleri, yapısına göre (basit, birleşik, sıralı, bağlı), yüklemin türüne göre (fiil, isim), yüklemin yerine göre (kurallı, devrik), anlamına göre (olumlu, olumsuz, soru, ünlem, emir, istek).
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Cümle türleri sınıflaması genel kabule göre yazıldı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Cümle Türleri';

update public.lesson_notes n
set body = $n$Program: Anlatım bozuklukları, anlamsal (gereksiz sözcük, anlamca çelişen sözcük, yanlış anlamlı sözcük) ve yapısal (özne-yüklem, kip-zaman, çatı, ortak öge) bozukluklar.
Kazanım: TYT Türkçe için MEB kazanım kodu eşleştirmesi yapılmadı. Sınav kapsamı ÖSYM TYT Türkçe bölümüne göre alındı.
Doğrulama: 9., 10. ve 11. sınıf Türk Dili ve Edebiyatı ders kitapları (2025-26 TYMM baskıları) incelendi. Bu kitaplar metin ve tema temellidir, ayrı dil bilgisi bölümü içermez, bu yüzden konu anlatımı kitapla satır satır karşılaştırılamadı. İçerik TDK Yazım Kuralları ve genel Türkçe dil bilgisi kabulleriyle gözden geçirildi.
Kaynak: Metin ve sorular özgündür, kitap metni kopyalanmadı. Kurallar TDK Yazım Kılavuzu ve Türkçe dil bilgisi kaynaklarındaki genel kabul gören anlatıma uygun yazılmıştır.
Açık nokta: Örnek cümlelerde birden çok düzeltme yolu olabilir, soruların çözümleri tek doğru şıkla sınırlandı. Dil bilgisi ayrıntısı ders kitabıyla doğrulanamadı, TDK ve genel kabul esas alındı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tr' and t.name = 'Anlatım Bozuklukları';
