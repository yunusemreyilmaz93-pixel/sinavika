-- TYT Biyoloji: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Canlıların ortak özellikleri, metabolizma, homeostazi, adaptasyon, organizasyon düzeyleri, virüslerin konumu.
Kazanım: BİY.9.1.4.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Virüslerin canlı ya da cansız olarak sınıflandırılamaması kitaptaki yaklaşımla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Ortak Özellikleri';

update public.lesson_notes n
set body = $n$Program: Su ve mineraller, karbonhidrat, lipit, protein, nükleik asit, enzim, vitamin, ATP, dehidrasyon sentezi ve hidroliz.
Kazanım: BİY.9.1.5 ile BİY.9.1.8.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Enzimler için 'çoğu proteindir' ifadesi kullanıldı (ribozimler istisnadır). Proteinin yapı düzeyleri metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Temel Bileşenleri';

update public.lesson_notes n
set body = $n$Program: Hücre kuramı, mikroskop büyütmesi, prokaryot ve ökaryot hücre, organeller, protein salgı yolu, hayvan ve bitki hücresi.
Kazanım: BİY.9.2.1.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Organel listesi ve sentrozomun hayvan hücresine özgülüğü kitapla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Şekil sadeleştirilmiştir, organellerin boyutları gerçeği yansıtmaz.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre ve Organelleri';

update public.lesson_notes n
set body = $n$Program: Hücre zarının yapısı, basit ve kolaylaştırılmış difüzyon, osmoz, aktif taşıma, endositoz ve ekzositoz, hipotonik, izotonik, hipertonik ortam, plazmoliz ve turgor.
Kazanım: BİY.9.2.2 ve BİY.9.2.3.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Hipotonik, hipertonik, izotonik ortam, turgor ve plazmoliz kitaptaki tanımlarla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Fagositoz ve pinositoz ayrımı kitapta geçmez, genel bilgi olarak bırakıldı. Na-K pompası oranı (3 Na, 2 K) standart bilgidir.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre Zarından Madde Geçişi';

update public.lesson_notes n
set body = $n$Program: Sınıflandırmanın amacı, taksonomik basamaklar, ikili adlandırma, üç üst âlem (domain) sistemi, ökaryot grupları, bitki grupları, omurgasız ve omurgalı sınıfları, tanımlama anahtarı.
Kazanım: BİY.9.2.4 ile BİY.9.2.6.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Güncel kitap beş âlem yerine üç üst âlem (bakteriler, arkeler, ökaryotlar) sistemini işlediği için bölüm buna göre yeniden yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Algler tabloda protistler içinde verildi. Bitki ve hayvan grupları genel bilgidir, kitaptaki ayrıntı düzeyine göre sadeleştirildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Sınıflandırılması';

update public.lesson_notes n
set body = $n$Program: Hücre döngüsü, mitoz, mayoz, krossing-over, kromozom, kromatit ve DNA miktarı değişimi, gamet oluşumu, ayrılmama.
Kazanım: BİY.12.1.1 ile BİY.12.1.6.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Konu programda 12. sınıfta yer alır, 12. sınıf ders kitabı henüz yayımlanmadığı için yalnızca programla karşılaştırıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Şekil yalnızca mitoz evrelerini gösterir, mayoz şeması yok.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Hücre Bölünmeleri';

update public.lesson_notes n
set body = $n$Program: Temel kalıtım kavramları, monohibrit ve dihibrit çaprazlama, test çaprazlaması, eksik baskınlık, çok alellilik (ABO), eşeye bağlı kalıtım, soyağacı, transkripsiyon ve translasyon, mutasyon.
Kazanım: BİY.12.2.1 ile BİY.12.2.7.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Konu programda 12. sınıfta yer alır, 12. sınıf ders kitabı henüz yayımlanmadığı için yalnızca programla karşılaştırıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Bağlantılı genler metne alınmadı. Soyağacı bölümü şekilsiz yazıldı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Kalıtım';

update public.lesson_notes n
set body = $n$Program: Ekosistemin bileşenleri, besin zinciri ve ağı, enerji akışı ve piramitler, karbon ve azot döngüleri, canlılar arası ilişkiler, popülasyon büyümesi.
Kazanım: BİY.10.2.1 ile BİY.10.2.4.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Komünite, popülasyon ve besin ağı terimleri kitapla uyumlu.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Komensalizm kitapta ayrı işlenmez, geleneksel sınıflamaya göre tutuldu. Biyokütle piramidinin ters örneği sadeleştirildi.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Ekosistem Ekolojisi';

update public.lesson_notes n
set body = $n$Program: Hava, su ve toprak kirliliği, sera etkisi ve küresel ısınma, ozon tabakasının incelmesi, asit yağmuru, ötrofikasyon, erozyon, atık yönetimi, ekolojik ayak izi, biyoçeşitlilik.
Kazanım: BİY.10.2.5 ile BİY.10.2.9.
Doğrulama: MEB 9. ve 10. sınıf Biyoloji ders kitapları ve 2026 öğretim programıyla karşılaştırıldı. Ekolojik ayak izi, biyokapasite ve ekolojik açıklık kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Paris Anlaşması ve Montreal Protokolü yalnızca adıyla anıldı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Güncel Çevre Sorunları';
