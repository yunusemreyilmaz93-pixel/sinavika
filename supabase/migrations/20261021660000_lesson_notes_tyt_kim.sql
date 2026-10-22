-- TYT Kimya: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Kimyanın tanımı ve alt disiplinleri, maddenin sınıflandırılması, fiziksel ve kimyasal değişim, element sembolleri, laboratuvar güvenliği ve tehlike işaretleri.
Kazanım: KİM.9.1.1 ve KİM.9.1.2.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Alt disiplinler kitaptaki altı disipline göre düzeltildi (endüstriyel kimya yerine polimer kimyası).
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Tehlike sembolleri yalnızca adıyla anıldı, görsel eklenmedi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimya Bilimi';

update public.lesson_notes n
set body = $n$Program: Atom modelleri, atomun yapısı, atom ve kütle numarası, izotop, iyon, elektron dizilimi (katman ve orbital gösterimi), Aufbau, Pauli ve Hund, periyodik sistem, grup özellikleri, atom yarıçapı, iyonlaşma enerjisi, elektronegatiflik.
Kazanım: KİM.9.1.3 ile KİM.9.1.8.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Orbital gösterimi, Pauli, Aufbau ve Hund ilkeleri, izoelektronik kavramı ve 1A, 2A, 3A grup özellikleri kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: İyonlaşma enerjisinde Be-B ve N-O gibi istisnalar metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Atom ve Periyodik Sistem';

update public.lesson_notes n
set body = $n$Program: İyonik, kovalent ve metalik bağ, Lewis nokta yapısı, formül ve adlandırma, polar ve apolar moleküller, zayıf etkileşimler (London, dipol-dipol, hidrojen bağı, iyon-dipol, indüklenmiş dipol), kaynama noktası ve çözünürlük.
Kazanım: KİM.9.2.1 ile KİM.9.2.8.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Lewis nokta yapısı ve indüklenmiş dipol etkileşimleri kitaba göre eklendi, adlandırma ifadesi düzeltildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Lewis yapıları ayrı şekille verilmedi. Çok atomlu iyonlar (SO4, NO3) metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Türler Arası Etkileşimler';

update public.lesson_notes n
set body = $n$Program: Katı, sıvı, gaz ve plazma, hâl değişimleri, sıvıların özellikleri (buhar basıncı, kaynama, viskozite, adezyon, kohezyon, yüzey gerilimi), katılar, gaz basıncı, mutlak sıcaklık, Boyle, Charles, Gay-Lussac yasaları, ideal gaz denklemi, Avogadro yasası.
Kazanım: KİM.9.2.8 ile KİM.9.2.13, KİM.10.1.8 ile KİM.10.1.11.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Sıvıların ve katıların özellikleri kitaba göre eklendi, NŞA terimi belirtildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Gerçek gazlar ve kısmi basınç metne alınmadı. Plazma kitaplarda ayrı işlenmiyor, genel bilgi olarak bırakıldı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Maddenin Halleri';

update public.lesson_notes n
set body = $n$Program: Havanın bileşimi, atmosfer katmanları, ozon tabakası, hava kirliliği, asit yağmuru, sera etkisi, su ve toprak kirliliği, ötrofikasyon, geri dönüşüm, katalitik konvertör, yeşil kimya.
Kazanım: KİM.10.3.2.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Metin programdaki atmosfer ve çevre çıktılarıyla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Havanın bileşim yüzdeleri yuvarlaktır. Sayısal küresel ısınma projeksiyonları metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Doğa ve Kimya';

update public.lesson_notes n
set body = $n$Program: Kütlenin korunumu, sabit oranlar, katlı oranlar, sınırlayıcı bileşen, kütlece yüzde bileşim.
Kazanım: KİM.10.1.6 (kütlenin korunumu).
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Güncel ders kitaplarında kütlenin korunumu işlenir, Proust ve Dalton kanunları ayrıca işlenmez.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Sabit ve katlı oranlar önceki programdan kaldı ve TYT soru geleneğinde sürdüğü için tutuldu. Hacim oranları (Gay-Lussac) metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyanın Temel Kanunları';

update public.lesson_notes n
set body = $n$Program: Mol kavramı, Avogadro sayısı, molar kütle, mol-kütle-tanecik-hacim dönüşümleri, NŞA'da gaz hacmi, formülden atom sayısı, kütlece yüzde bileşim.
Kazanım: KİM.10.1.4 ve KİM.10.1.5.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. NŞA terimi belirtildi, değerler (6,02·10²³ ve 22,4 L) kitaptaki gibi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Basit ve molekül formülü bulma metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Mol Kavramı';

update public.lesson_notes n
set body = $n$Program: Tepkime türleri (yanma, sentez, ayrışma, yer değiştirme, nötrleşme, çökelme, redoks), denkleştirme, stokiyometri, sınırlayıcı bileşen, verim, tepkime ısısı.
Kazanım: KİM.10.1.2, KİM.10.1.3, KİM.10.1.6, KİM.10.1.7.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Çökelme ve redoks tepkimeleri kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Entalpi hesapları ve tepkime hızı (KİM.11.1) metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Tepkimeler ve Hesaplamalar';

update public.lesson_notes n
set body = $n$Program: Homojen ve heterojen karışımlar, çözelti, doygunluk, çözünürlük, derişim (kütlece yüzde, molarite, ppm), seyreltme, ayırma yöntemleri, kolloid, süspansiyon, emülsiyon.
Kazanım: KİM.10.2.1 ile KİM.10.2.7.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. ppm derişimi kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Kolligatif özellikler (KİM.10.2.8) metne alınmadı. Kolloid, süspansiyon ve emülsiyon kitaplarda ayrı işlenmez, genel bilgi olarak tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Karışımlar';

update public.lesson_notes n
set body = $n$Program: Asit ve baz tanımı (Arrhenius), indikatörler, pH ve pOH, güçlü ve zayıf asit ve baz, nötrleşme, tuzlar, asit yağmuru.
Kazanım: KİM.11.2.6 ile KİM.11.2.10.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. pH ve nötrleşme anlatımı kitaptaki tanımlarla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Brønsted-Lowry ve Lewis teorileri, tuz hidrolizi ve titrasyon metne alınmadı. Tablodaki pH değerleri yaklaşıktır.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Asitler, Bazlar ve Tuzlar';

update public.lesson_notes n
set body = $n$Program: Sert su ve kireç, sabun ve deterjan, çamaşır suyu ve güvenli kullanım, polimerler ve geri dönüşüm, fosil ve yenilenebilir enerji, ilaç ve gıda katkıları, yeşil kimya.
Kazanım: Yeşil kimya bölümü KİM.9.3 ile ilişkilidir. Diğer başlıklar programda ayrı çıktı olarak yer almaz.
Doğrulama: MEB 9., 10. ve 11. sınıf Kimya ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Yeşil kimya ve atık önleme ilkesi programla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Sayısal sonuçlar python ile doğrulandı.
Açık nokta: Polimer tablosundaki monomerler genel bilgidir. Gıda katkıları için yönetmelik ayrıntısı metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimya Her Yerde';
