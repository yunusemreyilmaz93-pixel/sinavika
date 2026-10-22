-- TYT Coğrafya: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Coğrafyanın tanımı, fiziki ve beşeri coğrafya, doğal ve beşeri unsurlar, coğrafya ilkeleri, yardımcı bilimler, CBS, uzaktan algılama, GPS, doğa ve insan etkileşimi, sürdürülebilirlik.
Kazanım: COĞ.9.1.1 ile COĞ.9.1.3.
Doğrulama: MEB Coğrafya Dersi Öğretim Programı ve 9. sınıf Coğrafya ders kitabıyla karşılaştırıldı. Beş küre, doğal, beşerî ve coğrafi ortam, fiziki ve beşerî coğrafya alt dalları, coğrafi sorgulama soruları, coğrafi teknikler ve coğrafya biliminin gelişimi (bilim insanlarının yaşam yılları) kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Coğrafyanın ilkeleri (nedensellik, dağılış, bağlantı, mekân, karşılaştırma, analiz ve sentez) güncel kitapta ayrı başlık olarak geçmez, eski TYT geleneği için tutuldu. Yardımcı bilimler tablosundaki astronomi kitapta yok.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğa ve İnsan';

update public.lesson_notes n
set body = $n$Program: Dünya'nın şekli, dönüş hareketi, dolanma hareketi, eksen eğikliği, mevsimler, ekinokslar ve gün dönümleri, dönenceler ve kutup daireleri.
Kazanım: COĞ.9.3.2.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabının iklim ünitesiyle karşılaştırıldı. 21 Aralık (önceki 22 Aralık düzeltildi), günberi 3 Ocak ve günöte 4 Temmuz, 365 gün 6 saat, 23° 27′ eksen eğikliği, saatte 1670 km ve matematik iklim kuşakları kitaba göre. Yörünge şekli de aynı tarihlerle güncellendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Dönencelerin dışına ışınların hiç dik gelmemesi, yer çekimi ve basıklık ilişkisi kitapta ayrıntılı geçmez, standart bilgi olarak tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Dünya''nın Şekli ve Hareketleri';

update public.lesson_notes n
set body = $n$Program: Paralel ve meridyen, enlem ve boylam, yön bulma, yerel saat ve ortak saat, mutlak ve göreceli konum, Türkiye'nin matematik ve özel konumu.
Kazanım: COĞ.9.2.1 ile COĞ.9.2.2.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabının harita ünitesiyle karşılaştırıldı. Türkiye'nin 36° ile 42° K ve 26° ile 45° D konumu, yaklaşık 76 dakikalık yerel saat farkı, 45° D ortak saat (+3. saat dilimi), 780 043 km² yüzölçümü, kara ve deniz komşuları, Mavi Vatan, Gök Vatan, tarih değiştirme çizgisi ve dakika, saniye gösterimi kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Enlem derecesinin yaklaşık 111 km olması ve 666 km hesabı kitapta geçmez, standart hesap olarak tutuldu. Eski kaynaklardaki 783 562 km² değeri metinde not edildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Coğrafi Konum';

update public.lesson_notes n
set body = $n$Program: Harita ve öğeleri, ölçek ve ölçek hesabı, harita türleri, izohips ve eğim, projeksiyonlar.
Kazanım: COĞ.9.2.1.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabıyla karşılaştırıldı. Kesir ve çizgi ölçek, genel ve tematik harita türleri, tematik gösterim yöntemleri (korokromatik, koroplet, izoplet, noktalama, oransal sembol, akış), yükselti gösterimi (renklendirme, izohips, kabartma), izohips özellikleri, profil ve üç projeksiyon türü kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Eğim yüzdesi formülü ve yön oku kuralı kitapta yok, standart bilgi olarak tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Harita Bilgisi';

update public.lesson_notes n
set body = $n$Program: Atmosferin bileşimi ve katmanları, sıcaklığı etkileyen etmenler, basınç ve rüzgâr, nem ve yağış, iklim tipleri, Türkiye'nin iklimi.
Kazanım: COĞ.9.3.1 ile COĞ.9.3.4.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabının iklim ünitesiyle karşılaştırıldı. Standart basınç koşulları, termik ve dinamik basınç kuşakları, Türkiye'yi etkileyen basınç merkezleri, rüzgârların dört grupta toplanması, Türkiye'deki yerel rüzgârlar, doyma noktası, yağış türleri, sıcaklık kuşakları, sıcak, ılıman ve soğuk iklim grupları, geçiş iklimleri, Türkiye'nin sıcaklık, yağış ve güneşlenme dağılışı ile aşırı hava olayları kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Yükseltiyle sıcaklığın her 200 m'de 1°C, basıncın her 10 m'de 1 mb azalması kitapta sayı olarak geçmez, TYT geleneği için tutuldu. Katman sınırları kaynaklara göre değişir, kitap şemasında troposfer üst sınırı yaklaşık 13 km.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Atmosfer ve İklim';

update public.lesson_notes n
set body = $n$Program: Levha hareketleri, orojenez, epirojenez, volkanizma, deprem, Türkiye'nin fay hatları, ayrışma, aşınma, taşınma ve birikme, akarsu, buzul, rüzgâr, kıyı ve karst şekilleri.
Kazanım: COĞ.10.3.1 ile COĞ.10.3.3.
Doğrulama: MEB programı ve 10. sınıf Coğrafya ders kitabının doğal sistemler ünitesiyle karşılaştırıldı. Wegener ve Pangea, levha sınırları, volkan konisi türleri ve derinlik volkanizması, fay türleri, iç ve dış merkez, Türkiye'nin üç ana fay sistemi ve ova örnekleri, ayrışma türleri, buzul izlerinin dağılışı, rüzgâr aşındırması ve karst şekilleri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Epirojenez ve Mercalli ölçeği güncel kitapta geçmez, eski TYT kapsamı için tutuldu. Kızılırmak ve Büyük Menderes deltaları kitapta yok.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'İç ve Dış Kuvvetler';

update public.lesson_notes n
set body = $n$Program: Okyanus ve deniz suyunun tuzluluğu, dalga, akıntı, gel-git, akarsu, göl ve yer altı suları, toprak oluşumu ve tipleri, erozyon, bitki örtüsü, Türkiye'de su, toprak ve bitki.
Kazanım: COĞ.11.3.1, COĞ.12.3.1 ile COĞ.12.3.3.
Doğrulama: MEB programı ve 11. sınıf Coğrafya ders kitabının su kaynakları bölümüyle karşılaştırıldı. Suların oransal dağılışı, deniz tuzluluğu örnekleri, göl sınıflandırması, gideğen, akarsu rejimi ve Türkiye akarsularının özellikleri, sınıraşan ve sınır oluşturan sular, kaynak türleri, Ramsar alanları kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Toprak ve bitki örtüsü bölümleri 12. sınıf kazanımlarına denk gelir, 12. sınıf ders kitabı yayımlanmadığı için doğrulanamadı. Gel-git, Kızılırmak'ın uzunluğu (1355 km) ve Van Gölü'nün en büyük göl olması kitapta geçmez, genel bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Su, Toprak ve Bitki';

update public.lesson_notes n
set body = $n$Program: Nüfus sayımı, doğal artış, nüfus yoğunluğu, nüfusun dağılışını etkileyen etmenler, nüfus piramitleri, göç türleri ve sonuçları, Türkiye'nin nüfus özellikleri.
Kazanım: COĞ.9.4.1 ile COĞ.9.4.4.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabının nüfus ünitesiyle karşılaştırıldı. Üç sıçrama dönemi, nüfusun dağılışını etkileyen etmenler, beş aşamalı demografik dönüşüm modeli, demografik fırsat penceresi, nüfus politikası türleri, itici ve çekici faktörler, engeller ve TÜİK 2025 verileri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Piramit sınıflaması (genç, yetişkin, yaşlı) kitapta yaş gruplarıyla anlatılır, örnek ülkeler TYT geleneğinden. TÜİK verileri her yıl değişir, metinde yıl belirtildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Nüfus ve Göç';

update public.lesson_notes n
set body = $n$Program: Kırsal ve kentsel yerleşme, toplu ve dağınık yerleşme, geçici yerleşmeler (yayla, kışlak), yerleşmeyi etkileyen etmenler, şehirlerin işlevleri, kentleşme ve sorunları.
Kazanım: COĞ.10.4.1, COĞ.10.4.2, COĞ.11.4.1 ile COĞ.11.4.2.
Doğrulama: MEB programı ile 10. ve 11. sınıf Coğrafya ders kitaplarının yerleşme üniteleriyle karşılaştırıldı. Köy, kasaba ve şehir ayrımı ve nüfus ölçütleri, köy altı yerleşmeleri (kasaba kır yerleşmesidir, mezra sürekli, yayla, oba ve kom geçicidir), mekânsal desenler, on yerleşme işlevi ve örnekleri ve etki alanı kitaba göre düzeltildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Konut tipleri (ahşap, toprak damlı) ve çarpık kentleşme çözümleri kitapta ayrıntılı geçmez, genel bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Yerleşme';

update public.lesson_notes n
set body = $n$Program: Türkiye'nin yer şekillerinin oluşumu, dağlar, platolar, ovalar (delta, graben, tabanlı), kıyılar ve boğazlar, yer şekillerinin etkileri.
Kazanım: COĞ.10.3.1 ile COĞ.10.3.3.
Doğrulama: MEB programı ile 9. ve 10. sınıf Coğrafya ders kitaplarının harita ve tektonik bölümleriyle karşılaştırıldı. Kaçkar 3932 m, KAF, DAF ve Batı Anadolu ova ve horst örnekleri, volkan dağları, boyuna ve enine kıyı tipleri kitaba göre. Iğdır ve Muş ovaları çöküntü ovası olarak düzeltildi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Ortalama yükselti (1132 m), Uludağ (2543 m, kitap haritasında 2542), Erciyes ve Hasan yükseltileri, plato adları ve Montrö Sözleşmesi kitapta ayrıca verilmez.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Türkiye''nin Yer Şekilleri';

update public.lesson_notes n
set body = $n$Program: Ekonomik faaliyetler ve sektörler, tarım ürünlerinin dağılışı, hayvancılık, ormancılık, balıkçılık, madencilik, enerji kaynakları, sanayinin yer seçimi, turizm ve ticaret, GAP.
Kazanım: COĞ.9.5.1, COĞ.10.5.1 ile COĞ.10.5.3, COĞ.11.5.1 ile COĞ.11.5.5.
Doğrulama: MEB programı ile 9., 10. ve 11. sınıf Coğrafya ders kitaplarıyla karşılaştırıldı. Beş sektör ayrımı, Türkiye'de çalışan nüfusun 1990 ve 2025 dağılımı, bor rezervi (%74) ve stratejik-kritik madenler, GAP verileri ve tarımda dünya birincilikleri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Ürün-bölge eşleştirmeleri, verim hesabı, sanayi dağılışı ve maden yerleri klasik TYT içeriğidir, kitapta ayrıntılı geçmez.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ekonomik Faaliyetler';

update public.lesson_notes n
set body = $n$Program: Bölge kavramı, Türkiye'nin yedi coğrafi bölgesi, bölgelerin iklim, yer şekli ve ekonomik özellikleri, bölgesel kalkınma projeleri.
Kazanım: COĞ.9.7.1.
Doğrulama: MEB programı ve 9. sınıf Coğrafya ders kitabının bölgeler ünitesiyle karşılaştırıldı. Şekilsel ve işlevsel bölge kavramları, bölge sınırlarının ölçüte bağlılığı, GAP ve KOP bilgileri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Yedi coğrafi bölgenin ayrıntıları güncel kitapta yer almaz, klasik kaynaklara dayanır. Bölgelerin yüzölçümü sıralaması (Doğu Anadolu en büyük, Güneydoğu en küçük) ve 1941 Birinci Coğrafya Kongresi bilgisi kitapla doğrulanamadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Bölgeler';

update public.lesson_notes n
set body = $n$Program: Ulaşımı etkileyen etmenler, ulaşım türleri ve karşılaştırması, Türkiye'de karayolu, demiryolu, denizyolu, havayolu ve boru hatları, ulaşımın etkileri.
Kazanım: COĞ.12.5.1 ile COĞ.12.5.2.
Doğrulama: MEB programıyla karşılaştırıldı. Konu 12. sınıf kazanımlarına denk gelir ve 12. sınıf ders kitabı yayımlanmadığı için kitapla doğrulanamadı. Köprü adları ve açılış yılları (1973, 1988, 2016, 2022), BTC (2006), Mavi Akım, TürkAkım ve TANAP yılları genel bilgiyle kontrol edilip metne eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Boru hatlarının güncel durumu ve YHT hatları değişebilir. 2026 sonrası açılan hatlar eklenmedi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ulaşım Hatları';

update public.lesson_notes n
set body = $n$Program: İnsan ve çevre etkileşimi, doğal kaynaklar, çevre sorunları, sürdürülebilir kalkınma, ekolojik ayak izi, çevreyi koruma çalışmaları.
Kazanım: COĞ.11.6.1, COĞ.11.6.2 ile COĞ.12.6.3 ile COĞ.12.6.5.
Doğrulama: MEB programı ve 11. sınıf Coğrafya ders kitabının afetler ve sürdürülebilir çevre ünitesiyle karşılaştırıldı. Dokuz gezegen sınırı, Antroposen, Dünya Limit Aşım Günü, Rio Zirvesi, Kyoto Protokolü (2020'de sona erdi), Paris İklim Anlaşması ve Türkiye'nin 2053 net sıfır hedefi, Ramsar alanları kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Marmara müsilajı (2021), Yellowstone (1872), Yozgat Çamlığı (1958) ve ekolojik ayak izi tanımı kitapta geçmez, genel kabul gören bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Çevre ve Toplum';

update public.lesson_notes n
set body = $n$Program: Doğal olay, afet ve risk kavramları, afet türleri, deprem, sel, heyelan, çığ, orman yangını, kuraklık, Türkiye'de afetlerin dağılışı, afet yönetimi evreleri, AFAD.
Kazanım: COĞ.9.6.1 ile COĞ.9.6.3, COĞ.10.6.1 ile COĞ.10.6.4.
Doğrulama: MEB programı ile 9. ve 10. sınıf Coğrafya ders kitaplarının afet üniteleriyle karşılaştırıldı. Tehlike, maruziyet, risk ve afet tanımları, afet sınıflaması (jeolojik, klimatik-hidrolojik, biyolojik, sosyal, teknolojik), 1999 ve 2023 depremlerinin tarih, saat, büyüklük ve can kaybı, bütüncül afet yönetimi evreleri ve AFAD görevleri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Çök-kapan-tutun ve DASK kitapta geçmez, AFAD ve genel kabul gören bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğal Afetler';
