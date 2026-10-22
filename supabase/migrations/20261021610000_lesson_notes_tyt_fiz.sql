-- TYT Fizik: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Fizik biliminin tanımı ve alt dalları, bilimsel yöntem, temel ve türetilmiş büyüklükler, skaler ve vektörel büyüklükler, SI ön ekleri, birim dönüşümü, ölçü aletleri.
Kazanım: FİZ.9.1.1, FİZ.9.1.2, FİZ.9.2.1, FİZ.9.2.2.
Doğrulama: MEB 9. sınıf Fizik ders kitabı ve 2026 öğretim programıyla karşılaştırıldı. Alt dallar kitaptaki sekiz dala göre düzeltildi. Bilimsel yöntem paragrafındaki hatalı kuram ve yasa ilişkisi kaldırıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Ölçü aletlerinin duyarlılık değerleri tipik değerlerdir, kitapta verilmez.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Fizik Bilimine Giriş';

update public.lesson_notes n
set body = $n$Program: Kütle, hacim, özkütle, birim dönüşümü, karışımın özkütlesi, ayırt edici özellikler, adezyon, kohezyon, yüzey gerilimi, kılcallık.
Kazanım: 2026 programının 9., 10. ve 11. sınıf Fizik ünitelerinde bu konu ayrı bir ünite olarak yer almaz, konu listesine göre tutuldu.
Doğrulama: Ders kitaplarında özkütle yerine yoğunluk terimi kullanılır, metinde ikisi birlikte verildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Karışım örneğinde hacmin toplam olarak korunduğu varsayıldı, ilk soruda belirtildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Madde ve Özellikleri';

update public.lesson_notes n
set body = $n$Program: Konum, yol, yer değiştirme, vektörlerin toplanması, sürat ve hız, düzgün doğrusal hareket, ivme, düzgün hızlanan hareket, grafikler, serbest düşme, düşey atış, Newton'un hareket yasaları, statik ve kinetik sürtünme, doğadaki temel kuvvetler.
Kazanım: FİZ.9.2.3 ile FİZ.9.2.7, FİZ.10.1.1 ile FİZ.10.1.3, FİZ.11.1.1 ile FİZ.11.1.7.
Doğrulama: MEB 9., 10. ve 11. sınıf Fizik ders kitaplarıyla karşılaştırıldı. Vektörlerin toplanması, statik ve kinetik sürtünme, düşey atış ve doğadaki temel kuvvetler kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Yerçekimi ivmesi 10 alındı. İki boyutlu sabit ivmeli hareket, limit hız ve düzgün çembersel hareket metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Hareket ve Kuvvet';

update public.lesson_notes n
set body = $n$Program: İş, güç, kinetik ve potansiyel enerji, iş-enerji teoremi, mekanik enerjinin korunumu, verim, enerji kaynakları.
Kazanım: FİZ.10.2.1 ile FİZ.10.2.5.
Doğrulama: MEB 10. sınıf Fizik ders kitabıyla karşılaştırıldı. Açılı kuvvette iş ve enerji kaynakları kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Yay potansiyel enerjisi yalnızca formülle verildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'İş, Güç ve Enerji';

update public.lesson_notes n
set body = $n$Program: İç enerji, ısı ve sıcaklık, öz ısı, ısı sığası, ısı alışverişi, ısıl denge, hal değişimi, genleşme, ısı iletim yolları, ısı iletim hızı.
Kazanım: FİZ.9.4.1 ile FİZ.9.4.6.
Doğrulama: MEB 9. sınıf Fizik ders kitabıyla karşılaştırıldı. Kitapta öz ısı ve hâl değişim ısıları SI birimleriyle verildiği için J/kg·°C ve kJ/kg değerleri, iç enerji ve ısı iletim hızı eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Genleşme katsayısı sayısal sorulmadığı için kısa tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Isı ve Sıcaklık';

update public.lesson_notes n
set body = $n$Program: Elektrik yükü, yük korunumu, iletken ve yalıtkan, sürtme, dokunma ve etki ile yükleme, elektroskop, Coulomb yasası, elektrik alanı.
Kazanım: FİZ.11.2.1 ile FİZ.11.2.3.
Doğrulama: MEB 11. sınıf Fizik ders kitabıyla karşılaştırıldı, Coulomb yasası ve elektroskop kitaptaki biçimiyle uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Elektriksel potansiyel enerji ve potansiyel farkı, çok yüklü sistemlerde alanın vektörel toplamı metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrostatik';

update public.lesson_notes n
set body = $n$Program: Elektrik akımı, gerilim, direnç, Ohm yasası, seri ve paralel bağlama, üreteçlerin bağlanması, elektrik güvenliği ve topraklama, elektriksel güç ve enerji, mıknatıs, manyetik alan, akımın manyetik etkisi, elektromıknatıs.
Kazanım: FİZ.10.3.1 ile FİZ.10.3.7, FİZ.11.2.4 ile FİZ.11.2.7.
Doğrulama: MEB 10. ve 11. sınıf Fizik ders kitaplarıyla karşılaştırıldı. Üreteçlerin bağlanması, elektrik güvenliği ve topraklama kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Manyetik kuvvet ve indüksiyon (FİZ.11.2.8 ve sonrası) metne alınmadı. Karma devreler tek bir örnekle verilmedi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrik ve Manyetizma';

update public.lesson_notes n
set body = $n$Program: Katı basıncı, sıvı basıncı, Pascal ilkesi, hidrolik sistem, açık hava basıncı, kaldırma kuvveti, yüzme, batma ve askıda kalma, Bernoulli ilkesi.
Kazanım: FİZ.9.3.1 ile FİZ.9.3.7.
Doğrulama: MEB 9. sınıf Fizik ders kitabıyla karşılaştırıldı. 1 atm değeri kitaptaki gibi yazıldı, Bernoulli ilkesi kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Gaz basıncı (kapalı kap) bu konuya alınmadı, kimya konusunda yer alıyor.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Basınç ve Kaldırma Kuvveti';

update public.lesson_notes n
set body = $n$Program: Periyodik hareket, dalga türleri, genlik, dalga boyu, periyot, frekans, dalga denklemi, su dalgalarında yansıma ve kırılma, yay dalgaları, ses dalgaları, rezonans ve deprem, elektromanyetik dalgalar.
Kazanım: FİZ.10.4.1 ile FİZ.10.4.7.
Doğrulama: MEB 10. sınıf Fizik ders kitabıyla karşılaştırıldı. Periyodik hareket, rezonans ve deprem kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Doppler etkisi ve durağan dalgalar metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Dalgalar';

update public.lesson_notes n
set body = $n$Program: Işığın yayılması, gölge, yansıma, düzlem ayna, küresel aynalar, kırılma, Snell yasası, tam yansıma, mercekler, ışığın renkleri.
Kazanım: FİZ.11.3.1 ile FİZ.11.3.10.
Doğrulama: MEB 11. sınıf Fizik ders kitabıyla karşılaştırıldı. Snell yasası ve tam yansıma kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Prizmalar, görünür derinlik ve göz kusurları kısa tutuldu. Sorular şekilsiz, metinle tanımlandı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Optik';
