-- TYT Tarih: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Tarih bilimi, kaynaklar, yardımcı bilimler, takvimler, tarihin çağları.
Kazanım: TAR.9.1.1 ile TAR.9.1.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Yazının başlangıcı (MÖ 3200), ilk ay ve güneş takvimi, Jülyen ve Gregoryen takvimleri kitaba göre yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Hicri takvimin Hz. Ömer döneminde başlatılması kitapta geçmez, genel kabul gören bilgidir. Çağ bölümlemesi güncel kitapta yer almaz, TYT soru geleneği için tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Tarih ve Zaman';

update public.lesson_notes n
set body = $n$Program: Tarih öncesi çağlar, Anadolu'daki ilk yerleşimler, Mezopotamya, Mısır, Anadolu uygarlıkları, Yunan ve Roma.
Kazanım: TAR.9.2.1 ile TAR.9.2.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Kral Yolu'nun Pers İmparatoru Darius döneminde düzenlenmesi kitapla uyumlu. Mezolitikteki köpek evcilleştirme ifadesi kitapta olmadığı için çıkarıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Büyük İskender'in sınırları sadeleştirildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İnsanlığın İlk Dönemleri';

update public.lesson_notes n
set body = $n$Program: Orta Çağ'ın başlangıcı, Kavimler Göçü, feodalite, kilise, Bizans, 1054 ayrılığı, Haçlı Seferleri, Rönesans, matbaa, Coğrafi Keşifler, Reform.
Kazanım: TAR.9.3.1 ile TAR.9.3.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Gutenberg tarihi kitaptaki gibi 1450. Hristiyanlığın bölünmesi (1054) kitapta geçmez, genel bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Orta Çağ''da Dünya';

update public.lesson_notes n
set body = $n$Program: Türklerin ilk yurdu ve yaşamı, Asya Hun, Avrupa Hun, Göktürk, Uygur, Orhun Yazıtları, devlet yapısı ve kültür, diğer Türk toplulukları.
Kazanım: TAR.9.2.5.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Asya Hun Devleti'nin kuruluşu kitaptaki gibi MÖ 220, Mete'nin kağan olması MÖ 209 olarak yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Hazarların Musevi dinini kabul etmesi kitapta geçmez, tarihsel olarak bilinen bir bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk ve Orta Çağlarda Türk Dünyası';

update public.lesson_notes n
set body = $n$Program: İslam öncesi Arabistan, Hz. Muhammed dönemi, dört halife, Emeviler, Abbasiler, İslam'da bilim ve kültür, mezhepler.
Kazanım: TAR.9.3.2 ile TAR.9.3.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Hz. Muhammed'in doğum yılı kitaptaki gibi 571 olarak düzeltildi, 610 ilk vahiy, 622 hicret, 632 vefat kitapla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: İtikadi mezhepler bölümü Din Kültürü ile örtüşmemesi için kısa tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İslam Medeniyetinin Doğuşu';

update public.lesson_notes n
set body = $n$Program: Türklerin İslam'ı kabulü, Karahanlılar, Gazneliler, Büyük Selçuklu Devleti, Malazgirt, Nizamiye Medreseleri, ikta, dönemin eserleri.
Kazanım: TAR.10.1.1 ile TAR.10.1.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Karahanlılar 840-1212, Gazneliler 963-1187, Büyük Selçuklu 1040-1157 olarak kitaptaki aralıklarla yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Katvan Savaşı (1141) kitapta geçmez, genel kabul gören tarihtir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'İlk Türk İslam Devletleri';

update public.lesson_notes n
set body = $n$Program: Anadolu Selçuklu Devleti'nin kuruluşu, Miryokefalon, I. Alaeddin Keykubat dönemi, Kösedağ ve Moğol hakimiyeti, Anadolu'nun Türkleşmesi, yönetim, ekonomi, kültür ve medeniyet.
Kazanım: TAR.10.1.1 ile TAR.10.1.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Türkiye Selçuklu Devleti 1075-1308 aralığı ve II. Kılıç Arslan dönemi (1156-1192) düzeltildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Karamanoğlu Mehmet Bey'in Türkçeyi resmî dil ilan etmesi (1277) kitapta geçmez, genel kabul gören bilgidir. Mevlana ve Yunus Emre alıntıları kısaltılmıştır.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Selçuklu Türkiyesi';

update public.lesson_notes n
set body = $n$Program: Osmanlı'nın kuruluş şartları, Osman Bey, Orhan Bey, I. Murat, Yıldırım Bayezid, Ankara Savaşı, Fetret Devri, II. Murat, İstanbul'un Fethi, kurumlar.
Kazanım: TAR.10.2.1 ile TAR.10.2.5.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Savaş ve fetih yılları (1302, 1326, 1364, 1371, 1389, 1396, 1402, 1444, 1448, 1453) kitapta bulunuyor ve uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Osmanlı'nın kuruluş yılı (1299) gelenekseldir. Edirne'nin alınış yılı kaynaklarda 1361 ile 1363 arasında farklı verilir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Beylikten Devlete Osmanlı';

update public.lesson_notes n
set body = $n$Program: Fatih ve II. Bayezid dönemi, Yavuz Sultan Selim, Çaldıran, Mercidabık, Ridaniye, halifelik, Kanuni Sultan Süleyman, Mohaç, Viyana, Preveze, İnebahtı, yönetim, toplum ve kültür.
Kazanım: TAR.10.3.1 ile TAR.10.3.5.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Çaldıran, Mercidabık, Ridaniye, Mohaç, Preveze ve diğer yıllar kitapla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Kapitülasyonların başlangıç yılı kitaplarda farklı verildiği için metinde yıl yazılmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Dünya Gücü Osmanlı';

update public.lesson_notes n
set body = $n$Program: Coğrafi Keşifler, Rönesans, Reform, Aydınlanma, Sanayi İnkılabı, Fransız İhtilali, Osmanlı'nın dönemleri, duraklama, gerileme ve dağılma, III. Selim, II. Mahmud, Tanzimat, I. Meşrutiyet.
Kazanım: TAR.11.1.1 ile TAR.11.2.4.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Antlaşma, ıslahat ve savaş yılları 11. sınıf kitabıyla uyumlu (Mecelle ve Düyun-ı Umumiye 1881 dahil).
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Dönem adları (duraklama, gerileme, dağılma) güncel kitapta yer almaz, TYT soru geleneği için tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Değişim Çağında Avrupa ve Osmanlı';

update public.lesson_notes n
set body = $n$Program: II. Meşrutiyet, 31 Mart Vakası, Trablusgarp Savaşı, Balkan Savaşları, I. Dünya Savaşı'nın nedenleri ve cepheleri, Osmanlı'nın savaşa girişi, Çanakkale, Mondros Mütarekesi.
Kazanım: TAR.11.3.1 ile TAR.11.3.3.
Doğrulama: MEB Tarih Dersi Öğretim Programı (2026) ve 9., 10., 11. sınıf Tarih ders kitaplarıyla karşılaştırıldı. Kafkas Cephesi'nde Sevk ve İskân Kanunu kitaptaki ifadeyle kısaca eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Uşi Antlaşması ve Mondros ayrıntıları sadeleştirildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'XX. Yüzyıl Başlarında Osmanlı ve Dünya';

update public.lesson_notes n
set body = $n$Program: Mondros sonrası işgaller, Kuva-yi Milliye, Mustafa Kemal'in Samsun'a çıkışı, genelgeler, Erzurum ve Sivas kongreleri, Misak-ı Millî, TBMM, cepheler, Sakarya, Büyük Taarruz, Mudanya, Lozan.
Kazanım: Programda ayrı çıktı yok.
Doğrulama: 12. sınıf Tarih ders kitabı ve programı yayımlanmadığı için bu konu ders kitabıyla karşılaştırılamadı. Tarihler resmî kaynaklardaki bilinen değerlerle yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Amasya Genelgesi ve Sakarya sözü kısaltılmış biçimdedir. Lozan maddeleri kısaltıldı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Milli Mücadele';

update public.lesson_notes n
set body = $n$Program: Cumhuriyet'in ilanı, saltanat ve halifeliğin kaldırılması, hukuk, eğitim, toplumsal ve ekonomik inkılaplar, Atatürk ilkeleri, Atatürk dönemi dış politikası.
Kazanım: Programda ayrı çıktı yok.
Doğrulama: 12. sınıf Tarih ders kitabı ve programı yayımlanmadığı için bu konu ders kitabıyla karşılaştırılamadı. Tarihler resmî kaynaklardaki bilinen değerlerle yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Kadınlara tanınan haklar (1930, 1933, 1934), hafta tatili (1935) ve ilkelerin anayasaya girişi (1937) bilinen resmî tarihlerdir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-tar' and t.name = 'Atatürkçülük ve Türk İnkılabı';
