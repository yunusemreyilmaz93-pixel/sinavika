-- TYT Felsefe: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Felsefenin tanımı ve ortaya çıkışı, felsefi düşüncenin ve felsefi sorunun özellikleri, felsefe ile bilim, din ve sanat, felsefenin alanları.
Kazanım: FEL.10.1.1.
Doğrulama: MEB Felsefe Dersi Öğretim Programı ve 10. sınıf Felsefe ders kitabının 1. ünitesiyle karşılaştırıldı. Terimi ilk kullananın Pythagoras olması, felsefenin tek merkezde değil birçok medeniyetin birikimine dayanması ve Antik Yunan'da sistemli hâle gelmesi, felsefi düşüncenin refleksif ve yığılımlı gibi özellikleri, felsefi sorunun özellikleri, bilim ve felsefenin varlığa yaklaşımı ve UNESCO Dünya Felsefe Günü kitaba göre eklendi. Felsefenin Anadolu'da doğduğu iddiası geleneksel anlatım olarak korundu, ilk soru ve mini test buna göre yeniden yazıldı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Alt alanlara dil felsefesi ve mantık satırı kitapta ayrı ünite (2. ünite) olarak işlenir, bu konuda kısa tutuldu. Felsefe, mantık ve argümantasyon ünitesi TYT konu listesinde yok.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Felsefeyi Tanıma';

update public.lesson_notes n
set body = $n$Program: Bilgi felsefesinin soruları, bilginin imkânı (dogmatizm, septisizm, rölativizm, kritisizm), bilginin kaynağı (rasyonalizm, empirizm, kritisizm, sezgicilik, pozitivizm), doğruluk ölçütleri.
Kazanım: FEL.10.4.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 4. ünitesiyle karşılaştırıldı. Bilgi, sanı, doğruluk ve gerçeklik kavramları, bilginin koşulları, bilginin imkânı (septisizm: Protagoras, Gorgias, Pyrrhon, dogmatizm: Sokrates, Descartes), kaynağı (rasyonalizm, empirizm, kritisizm, entüisyonizm, apriori ve aposteriori) ve doğruluk ölçütleri (tümel uzlaşım dâhil) kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Kitap bilginin imkânında yalnızca iki görüşü verir. Rölativizm, kritisizm, fenomenalizm, pozitivizm, idealizm ve realizm satırları eski program geleneğinden, kitapta bu başlıkta yoktur.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Bilgi Felsefesi';

update public.lesson_notes n
set body = $n$Program: Varlık felsefesinin (ontoloji) soruları, varlığın doğası (materyalizm, idealizm, realizm, düalizm), varlığın sayısı (monizm, düalizm, plüralizm), değişim, nedensellik ve amaçlılık.
Kazanım: FEL.10.3.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 3. ünitesiyle karşılaştırıldı. Varlık felsefesinin temel kavramları (varlık, fenomen, idea, madde, oluş, öz, töz, varoluş), metafizik ve ontoloji ilişkisi, varlığın var olup olmadığı (nihilizm: Gorgias, realizm: Aristoteles) ve ne olduğu (idealizm: Platon, İbni Sina, Hegel, materyalizm: Demokritos, Hobbes, De La Mettrie, Marx, düalizm: Descartes), oluş felsefesi, fenomenoloji ve varoluşçuluk kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Varlığın sayısı (monizm, düalizm, plüralizm), nedensellik, determinizm, teleoloji ve Aristoteles'in dört nedeni güncel kitapta bu ünitede yoktur, eski program geleneği için tutuldu. Kitap Platon'u düalist saymaz, idealist sayar.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Varlık Felsefesi';

update public.lesson_notes n
set body = $n$Program: Ahlak, etik ve hukuk farkı, ahlaki eylemin özellikleri, vicdan, ahlaki özgürlük ve sorumluluk, erdem etiği, ödev ahlakı, faydacılık, hazcılık, Sofistler ve görecelik, Stoacılık.
Kazanım: FEL.10.5.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 5. ünitesiyle karşılaştırıldı. Ahlak, etik, erdem, iyi, kötü, özgürlük, sorumluluk ve vicdan tanımları, evrensel ahlak yasasını kabul edenler (Sokrates, Mill, Farabi, Kant) ve etmeyenler (Epikuros, Bentham, Hobbes, Stirner), özgürlük ve sorumluluk (determinizm, fatalizm, indeterminizm, otodeterminizm) kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Aristoteles'in orta yol erdemi, Platon'un dört erdemi, Stoacılık ve ahlak-hukuk karşılaştırması kitapta bu ünitede yoktur, eski program geleneği için tutuldu. Kitap Bentham'ı bireysel, Mill'i toplumsal fayda ayrımıyla verir, metinde klasik nicel-nitel ayrımı da duruyor.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Ahlak Felsefesi';

update public.lesson_notes n
set body = $n$Program: Estetik ve sanat felsefesinin soruları, güzel kavramı (nesnel ve öznel), sanatın tanımı ve özellikleri, sanat ile zanaat ve bilim farkı, sanat kuramları (taklit, ifade, biçimcilik, sanat için sanat), sanatın işlevleri.
Kazanım: FEL.10.6.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 6. ünitesiyle karşılaştırıldı. Estetik ile sanat felsefesi ayrımı, hoş ve yüce kavramları, sanat kuramları (taklit, yaratım ve ifade, oyun), sanat ve zanaat ayrımının 18. yüzyılda oluşması, güzellik tanımları (Aristoteles, Kant, Croce), doğa ve sanat güzelliği, güzellik-hakikat-iyi-yüce ilişkisi, ortak estetik yargıların imkânı (Platon, Baumgarten, Kant, Croce) kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Biçimcilik, sanat için sanat, toplumsal gerçekçilik, katharsis ve sanatın işlevleri listesi kitapta bu ünitede yoktur, eski program geleneği için tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Sanat Felsefesi';

update public.lesson_notes n
set body = $n$Program: Din felsefesinin konusu, din felsefesi ile teoloji ve din bilimleri farkı, Tanrı'nın varlığına dair deliller, teizm, deizm, panteizm, ateizm, agnostisizm, kötülük sorunu, din ile akıl ve bilim ilişkisi, dinin işlevleri.
Kazanım: FEL.10.8.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 8. ünitesiyle karşılaştırıldı. Din tanımı, din felsefesi ile teoloji ayrımı, dört temel problem, teizm, deizm, panteizm, ateizm, teleolojik, kozmolojik, ontolojik ve kötülük argümanları ve eleştirileri, evrenin sonluluğu ve sonsuzluğu (Kindi, Gazali, Aquinas ve Aristoteles, İbni Sina, Spinoza) ve ruhun ölümsüzlüğü (Epikuros, Platon, Farabi, İbni Sina) kitaba göre. Akıl ve inanç ilişkisi 11. sınıf ders kitabının 3. ünitesiyle karşılaştırıldı (fideizm, temelcilik, gönül kavramı, Gazali'nin iman mertebeleri).
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Agnostisizm, ahlaki delil (Kant), dinî deneyim delili ve dinin işlevleri kitapta bu ünitede yoktur, eski program geleneği için tutuldu. Fideizm temsilcisi olarak Kierkegaard 11. sınıf kitabında doğrulanamadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Din Felsefesi';

update public.lesson_notes n
set body = $n$Program: Siyaset felsefesinin soruları, devlet, iktidar, otorite, meşruiyet, egemenlik, devletin kaynağı (Aristoteles, Hobbes, Locke, Rousseau), kuvvetler ayrılığı, Platon, Farabi, İbn Haldun, Makyavelli, Mill, adalet, özgürlük, eşitlik, yönetim biçimleri ve ideolojiler.
Kazanım: FEL.10.7.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 7. ünitesiyle karşılaştırıldı. Devletin kökeni (doğal: Platon, Farabi, yapay: Hobbes, Locke, Rousseau, asabiyet: İbn Haldun), iktidar, otorite ve meşruiyet, üç otorite biçimi (geleneksel, karizmatik, akılsal), ideal düzen (özgürlük, eşitlik ve adalet temelli yaklaşımlar, anarşizm), ütopya ve distopya kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Kuvvetler ayrılığı, Makyavelli, Mill, Aristoteles'in adalet ve yönetim biçimleri ve ideolojiler tablosu kitapta bu ünitede yoktur, eski program geleneği için tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Siyaset Felsefesi';

update public.lesson_notes n
set body = $n$Program: Bilimin tanımı ve özellikleri, bilimlerin sınıflandırılması, bilimsel yöntem ve kavramlar, tümevarım, tümdengelim, hipotetik-dedüktif yöntem, mantıksal pozitivizm, Popper, Kuhn, Feyerabend, bilim ve değerler, sözde bilim.
Kazanım: FEL.10.9.1.
Doğrulama: MEB programı ve 10. sınıf ders kitabının 9. ünitesiyle karşılaştırıldı. Klasik ve çağdaş bilim anlayışı, sözde bilim, Carnap'ın doğrulanabilirlik ölçütü (doğrudan ve dolaylı doğrulama), Popper'ın yanlışlanabilirlik ve kuğu örneği, Kuhn'un paradigma, olağan bilim ve olağanüstü bilim dönemleri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Bilimlerin sınıflandırılması, tümevarım ve tümdengelim, hipotetik-dedüktif yöntem, Feyerabend, bilimsel gerçekçilik ve araççılık kitapta bu ünitede yoktur, eski program geleneği için tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'Bilim Felsefesi';

update public.lesson_notes n
set body = $n$Program: İlk Çağ felsefesinin dönemleri, doğa filozofları (Thales, Anaksimandros, Anaksimenes, Pythagoras, Herakleitos, Parmenides, Empedokles, Anaksagoras, Demokritos), Sofistler, Sokrates, Platon, Aristoteles, Helenistik okullar.
Kazanım: FEL.10.1.1.
Doğrulama: 10. sınıf kitabının zaman şeridiyle karşılaştırıldı. Thales'in tarihi (MÖ 624 ile 546), felsefenin Yunan, Çin ve Hint medeniyetlerinde eş zamanlı doğduğu iddiası ve Pythagoras'ın terimi ilk kullanması kitaba göre. Doğa filozoflarının arkhe görüşleri ve Sofistler kitabın varlık ünitesinde kısaca geçer ve uyumludur.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Sokrates, Platon, Aristoteles ve Helenistik okullar güncel kitaplarda ayrı konu olarak yoktur. Metin eski program geleneğine ve genel felsefe tarihi kaynaklarına dayanır, doğum ve ölüm yılları yaklaşıktır, ders kitabıyla doğrulanamadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'İlk Çağ Felsefesi';

update public.lesson_notes n
set body = $n$Program: MS 2. yüzyıldan 15. yüzyıla felsefenin genel özellikleri, Patristik felsefe, Skolastik felsefe, tümeller tartışması, İslam felsefesi (Kindi, Farabi, İbn Sina, Gazali, İbn Rüşd, İbn Haldun), Yahudi felsefesi, Rönesans'a geçiş.
Kazanım: FEL.10.1.1.
Doğrulama: 10. sınıf kitabının zaman şeridi (Beytülhikme, Akademi'nin kapatılması, Rönesans) ve 11. sınıf kitabının akıl-inanç ünitesiyle karşılaştırıldı. Augustinus (354 ile 430), Aquinas (1225 ile 1274), Anselmus (1033 ile 1109) yılları, Tertullianus ve apoloji kavramı kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı.
Açık nokta: Patristik ve Skolastik ayrımı, tümeller tartışması, Ockham, Kindi'den İbn Haldun'a İslam filozofları ve Yahudi felsefesi güncel kitaplarda ayrı konu olarak yoktur. Metin eski program geleneğine dayanır, doğrulanamadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fel' and t.name = 'MS 2. Yüzyıldan 15. Yüzyıla Felsefe';
