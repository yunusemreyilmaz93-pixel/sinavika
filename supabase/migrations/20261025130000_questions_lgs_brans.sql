-- 20261025130000_questions_lgs_brans. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | brans | lgs-din | Din Kültürü branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-din', $t$Din Kültürü branş denemesi 1$t$, 20, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$Din Kültürü branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kader İnancı$n$), $q$Aşağıdaki davranışlardan hangisi kader inancıyla en uyumludur?$q$, array[$o$Hiçbir çaba göstermeden her şeyi kadere bırakmak$o$, $o$Elinden geleni yaptıktan sonra sonucu kabullenmek$o$, $o$Başarısızlığın nedenini her zaman başkalarında aramak$o$, $o$Zorluk çıkınca çabalamaktan tamamen vazgeçmek$o$], 1, $e$1. Kader inancı, insanı çalışmaya ve sorumluluk almaya yöneltir.
2. Elinden geleni yapıp sonucu kabullenmek bu inançla örtüşür.

Diğer şıklar: **A** kaderi çalışmamak sanmak / **C** sorumluluktan kaçmayı kader sanmak / **D** kaderi pes etmek sanmak.$e$, 1),
  (2, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kader İnancı$n$), $q$İnsanın özgür iradesiyle yaptığı seçimlerden sorumlu tutulmasını açıklayan kavram aşağıdakilerden hangisidir?$q$, array[$o$Tevekkül$o$, $o$Kaza$o$, $o$Cüz'i irade$o$, $o$Sabır$o$], 2, $e$1. İnsanın seçme gücüne cüz'i irade denir. İnsan bu iradeyle yaptıklarından sorumludur.

Diğer şıklar: **A** gereğini yapıp Allah'a güvenmeyi seçmek / **B** Allah'ın hükmünü seçmek / **D** ilgisiz bir kavramı seçmek.$e$, 2),
  (3, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Zekât ve Sadaka$n$), $q$Aşağıdakilerden hangisi zekât vermekle yükümlü olmanın şartlarından biridir?$q$, array[$o$Her yıl hacca gitmiş olmak$o$, $o$Ticaretle uğraşmak zorunda olmak$o$, $o$Bir yıl boyunca oruç tutmuş olmak$o$, $o$Nisap miktarı mala sahip olmak$o$], 3, $e$1. Zekât için kişinin dinen zengin sayılması gerekir. Bunun ölçüsü nisap miktarı mala sahip olmaktır.

Diğer şıklar: **A** başka bir ibadetin şartını seçmek / **B** gereksiz bir şart eklemek / **C** başka bir ibadetin şartını seçmek.$e$, 2),
  (4, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Zekât ve Sadaka$n$), $q$Aşağıdakilerden hangisi sadaka verme amacına uygun bir davranış **değildir**?$q$, array[$o$Yaptığı yardımı herkese duyurarak övünmek$o$, $o$İhtiyaç sahibine karşılık beklemeden yardım etmek$o$, $o$Komşusuna her zaman güler yüzle davranmak$o$, $o$Yolun ortasındaki taşı kenara kaldırmak$o$], 0, $e$1. Sadaka Allah rızası için ve gösterişten uzak verilir.
2. Yardımı duyurarak övünmek bu amaca aykırıdır.

Diğer şıklar: **B** sadakaya uygun davranışı seçmek / **C** sadakaya uygun davranışı seçmek / **D** sadakaya uygun davranışı seçmek.$e$, 2),
  (5, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Din ve Hayat$n$), $q$Aşağıdakilerden hangisi iman esaslarından biri **değildir**?$q$, array[$o$Allah'ın gönderdiği meleklere iman etmek$o$, $o$Hac ibadetini yerine getirmek$o$, $o$Ahiret gününün varlığına iman etmek$o$, $o$Allah'ın indirdiği kitaplara iman etmek$o$], 1, $e$1. Hac, İslam'ın şartlarından biridir ve bir ibadettir.
2. Diğerleri iman esaslarındandır.

Diğer şıklar: **A** iman esasını seçmek / **C** iman esasını seçmek / **D** iman esasını seçmek.$e$, 1),
  (6, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Din ve Hayat$n$), $q$Aşağıdakilerden hangisi dinin korumayı amaçladığı temel değerlerden biridir?$q$, array[$o$Ayrıcalıklı sınıfların korunması$o$, $o$Gösteriş merakının korunması$o$, $o$Aklın korunması$o$, $o$Rekabet ve üstünlüğün korunması$o$], 2, $e$1. Din canı, aklı, dini, nesli ve malı korumayı amaçlar.
2. Bu nedenle aklın korunması temel değerlerdendir.

Diğer şıklar: **A** dinin amacına ters bir şeyi seçmek / **B** dinin amacına ters bir şeyi seçmek / **D** dinin amacına ters bir şeyi seçmek.$e$, 1),
  (7, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Hz. Muhammed'in Örnekliği$n$), $q$Mekkeliler, Hz. Muhammed'e doğruluğu ve güvenilirliği nedeniyle hangi lakabı vermişlerdir?$q$, array[$o$el-Fârûk$o$, $o$el-Emin$o$, $o$es-Sıddîk$o$, $o$Zinnureyn$o$], 1, $e$1. Güvenilir kişi anlamına gelen el-Emin lakabı Hz. Muhammed'e verilmiştir.

Diğer şıklar: **A** Hz. Ömer'in lakabını seçmek / **C** Hz. Ebubekir'in lakabını seçmek / **D** Hz. Osman'ın lakabını seçmek.$e$, 1),
  (8, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Hz. Muhammed'in Örnekliği$n$), $q$Hz. Muhammed, Medine'de toplumsal birliği güçlendirmek için aşağıdakilerden hangisini yapmıştır?$q$, array[$o$Muhacirler ile Ensar arasında kardeşlik bağı kurmuştur.$o$, $o$Medine'deki toplulukların birbirinden ayrı yaşamasını sağlamıştır.$o$, $o$Muhacirlerin mallarına el konulmasına izin vermiştir.$o$, $o$Ensarın tüm mallarını Muhacirlere devretmesini istemiştir.$o$], 0, $e$1. Hz. Muhammed Muhacirler ile Ensar'ı kardeş ilan etmiştir.
2. Bu uygulama yardımlaşmayı ve birliği güçlendirmiştir.

Diğer şıklar: **B** birlik amacına ters uygulama seçmek / **C** adalet ilkesine ters uygulama seçmek / **D** olmayan bir uygulamayı seçmek.$e$, 2),
  (9, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kur'an-ı Kerim ve Özellikleri$n$), $q$Kur'an-ı Kerim'in ilk inen ayetleri hangi surenin başında yer alır?$q$, array[$o$Fâtiha suresi$o$, $o$Bakara suresi$o$, $o$İhlâs suresi$o$, $o$Alak suresi$o$], 3, $e$1. Kur'an'ın ilk inen ayetleri "Oku" emriyle başlayan Alak suresinin ilk ayetleridir.

Diğer şıklar: **A** mushaftaki ilk sureyi seçmek / **B** en uzun sureyi seçmek / **C** kısa sureyi seçmek.$e$, 1),
  (10, 'lgs-din', (select t.id from public.topics t where t.subject_id = 'lgs-din' and t.name = $n$Kur'an-ı Kerim ve Özellikleri$n$), $q$Kur'an-ı Kerim'in çoğaltılarak önemli şehirlere gönderilmesi hangi halife döneminde gerçekleşmiştir?$q$, array[$o$Hz. Ebubekir$o$, $o$Hz. Ömer$o$, $o$Hz. Ali$o$, $o$Hz. Osman$o$], 3, $e$1. Hz. Osman döneminde mushaflar çoğaltılıp önemli merkezlere gönderilmiştir.

Diğer şıklar: **A** ilk toplama dönemini seçmek / **B** farklı bir halifeyi seçmek / **C** farklı bir halifeyi seçmek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | brans | lgs-fen | Fen Bilimleri branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-fen', $t$Fen Bilimleri branş denemesi 1$t$, 40, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$Fen Bilimleri branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Aşağıdaki gözlemlerden hangisi mevsimlerin Dünya'nın Güneş'e uzaklığı nedeniyle oluşmadığını destekler?$q$, array[$o$Ekvator'da yıl boyunca sıcaklığın yüksek kalması$o$, $o$Gece ile gündüzün dönme hareketiyle oluşması$o$, $o$Yükselti arttıkça sıcaklığın düşmesi$o$, $o$Güneş'e en yakınken Türkiye'de kış olması$o$], 3, $e$1. Dünya Ocak başında Güneş'e en yakındır, ama Türkiye'de kış yaşanır. Bu, mevsimlerin uzaklıkla oluşmadığını gösterir.

Diğer şıklar: **A** enlem etkisini mevsim nedeni sanmak / **B** dönmeyi mevsim nedeni sanmak / **C** iklim etkenini mevsim nedeni sanmak.$e$, 1),
  (2, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Kuzey Yarım Küre'de 21 Haziran tarihinde yaşanan olaylar için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Güneş ışınları Ekvator'a dik gelir ve gece ile gündüz eşittir.$o$, $o$Güneş ışınları Oğlak Dönencesi'ne dik gelir ve gündüz en kısadır.$o$, $o$Güneş ışınları Yengeç Dönencesi'ne dik gelir ve gündüz en uzundur.$o$, $o$Güneş ışınları kutup bölgelerine dik gelir.$o$], 2, $e$1. 21 Haziran'da Kuzey Yarım Küre Güneş'e doğru eğiktir. Işınlar Yengeç Dönencesi'ne dik gelir ve gündüz yılın en uzun süresidir.

Diğer şıklar: **A** 21 Mart ile karıştırmak / **B** 22 Aralık ile karıştırmak / **D** ilgisiz bir bölge seçmek.$e$, 2),
  (3, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Mevsimler ve İklim$n$), $q$Aşağıdaki tabloda aynı enlemdeki iki kentin ortalama Temmuz sıcaklıkları verilmiştir.

| Kent | Yükselti (m) | Denize durumu | Temmuz sıcaklığı (°C) |
| --- | --- | --- | --- |
| K | 10 | Kıyıda | 26 |
| L | 1500 | Kara içinde | 19 |

Bu tabloya göre iki kentin sıcaklık farkı hangi etkenlerle açıklanabilir?$q$, array[$o$Yükselti ve denize uzaklık$o$, $o$Yalnızca enlem$o$, $o$Yalnızca Dünya'nın dönme hızı$o$, $o$Ay'ın evreleri$o$], 0, $e$1. Enlemleri aynı olduğundan fark enlemden kaynaklanmaz.
2. L kenti daha yüksektedir ve denizden uzaktır. Yükselti arttıkça sıcaklık düşer.

Diğer şıklar: **B** ortak etkeni neden sanmak / **C** ilgisiz etkeni seçmek / **D** ilgisiz etkeni seçmek.$e$, 3),
  (4, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Baskın gen A, çekinik gen a ile gösterilen bir özellik için Aa ve Aa genotipli iki bireyin çaprazlanmasından oluşan yavruların genotip oranı aşağıdakilerden hangisidir?$q$, array[$o$1 AA : 1 aa$o$, $o$1 AA : 2 Aa : 1 aa$o$, $o$2 AA : 1 Aa : 1 aa$o$, $o$3 Aa : 1 aa$o$], 1, $e$1. Aa x Aa çaprazlamasında A ve a gametleri birleşir: AA, Aa, aA, aa.
2. Genotip oranı 1 AA : 2 Aa : 1 aa.

Diğer şıklar: **A** melez bireyleri unutmak / **C** oranı yanlış yazmak / **D** oranı yanlış yazmak.$e$, 2),
  (5, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Bir bitkide yeşil tohum rengi baskın (Y), sarı tohum rengi çekiniktir (y). Yeşil tohumlu bir bitkiyle sarı tohumlu bir bitkinin çaprazlanmasından oluşan 100 tohumdan yaklaşık 50'si yeşil, 50'si sarı çıkmıştır.

Buna göre yeşil tohumlu bitkinin genotipi nedir?$q$, array[$o$Heterozigot (Yy)$o$, $o$Homozigot baskın (YY)$o$, $o$Homozigot çekinik (yy)$o$, $o$Genotip belirlenemez$o$], 0, $e$1. Sarı tohumlu bitki yy'dir. Yavruların yarısı sarı (yy) olduğundan yeşil bitki Yy olmalıdır.

Diğer şıklar: **B** tüm yavruların yeşil olacağını görmemek / **C** çekinik genotip yeşil fenotip vermez / **D** oran bilgisinden genotip çıkarmamak.$e$, 3),
  (6, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$DNA ve Genetik Kod$n$), $q$Bir insan vücut hücresinde 46 kromozom vardır.

Buna göre bu insanın sperm hücresinde bulunan kromozom sayısı kaçtır?$q$, array[$o$$22$$o$, $o$$23$$o$, $o$$46$$o$, $o$$92$$o$], 1, $e$1. Üreme hücreleri kromozom sayısının yarısını taşır: $46 \div 2 = 23$.

Diğer şıklar: **A** vücut kromozomu sayısını yazmak / **C** üreme hücresinde sayının yarıya indiğini bilmemek / **D** sayıyı iki katına çıkarmak.$e$, 2),
  (7, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$), $q$Ağırlığı $60$ N olan bir cisim 3 m yüksekliğe sürtünmesiz bir eğik düzlemle çıkarılacaktır. Eğik düzlemin boyu 6 m'dir.

Buna göre cismi çıkarmak için gereken kuvvet kaç N'dur?$q$, array[$o$$10$$o$, $o$$30$$o$, $o$$60$$o$, $o$$120$$o$], 1, $e$1. Eğik düzlemde $F \cdot \ell = G \cdot h$ dir.
2. $F \cdot 6 = 60 \cdot 3$ olduğundan $F = 30$ N.

Diğer şıklar: **A** oranı yanlış kurmak / **C** kuvvet kazancını yok saymak / **D** kuvveti iki katı almak.$e$, 1),
  (8, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$), $q$Kolları 20 cm ve 80 cm olan bir kaldıraçta 40 N'luk yük kısa koldadır.

Buna göre dengeyi sağlayan kuvvet kaç N'dur?$q$, array[$o$$10$$o$, $o$$20$$o$, $o$$40$$o$, $o$$100$$o$], 0, $e$1. $F \cdot l_k = G \cdot l_y$ eşitliği yazılır: $F \cdot 80 = 40 \cdot 20$.
2. $F = 10$ N.

Diğer şıklar: **B** kolları ters kurmak / **C** kaldıraç etkisini yok saymak / **D** yanlış işlem yapmak.$e$, 2),
  (9, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basit Makineler$n$), $q$Birbirine temas eden iki dişli çarkın diş sayıları $d_1 = 30$ ve $d_2 = 10$ dur. Birinci dişli saat yönünde 2 tur atıyor.

Buna göre ikinci dişli hangi yönde kaç tur atar?$q$, array[$o$Saat yönünün tersinde 6 tur$o$, $o$Saat yönünde 6 tur$o$, $o$Saat yönünün tersinde 2 tur$o$, $o$Saat yönünde 2/3 tur$o$], 0, $e$1. Temas eden dişliler zıt yönde döner.
2. $30 \cdot 2 = 10 \cdot N$ olduğundan $N = 6$ tur.

Diğer şıklar: **B** yönü karıştırmak / **C** dönme sayısını eşit sanmak / **D** oranı ters kurmak.$e$, 3),
  (10, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Bir kişinin ağırlığı 600 N'dur. Ayakkabısının tabanı toplam $0{,}03$ m$^2$ yer kaplamaktadır.

Buna göre kişinin zemine uyguladığı basınç kaç Pa'dır?$q$, array[$o$$18$$o$, $o$$600$$o$, $o$$2000$$o$, $o$$20000$$o$], 3, $e$1. $P = \dfrac{F}{A} = \dfrac{600}{0{,}03} = 20\,000$ Pa.

Diğer şıklar: **A** çarpmak / **B** ağırlığı basınç sanmak / **C** bir sıfırı eksik yazmak.$e$, 1),
  (11, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Yoğunluğu $1000$ kg/m$^3$ olan suda $4$ m derinlikteki sıvı basıncı kaç Pa'dır? ($g = 10$ m/s$^2$)$q$, array[$o$$4000$$o$, $o$$10000$$o$, $o$$40000$$o$, $o$$400000$$o$], 2, $e$1. $P = h \cdot d \cdot g = 4 \cdot 1000 \cdot 10 = 40\,000$ Pa.

Diğer şıklar: **A** bir sıfırı eksik yazmak / **B** derinliği hesaba katmamak / **D** bir sıfırı fazla yazmak.$e$, 2),
  (12, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Basınç$n$), $q$Kapalı ve hacmi değişmeyen bir kapta bulunan gazın sıcaklığı artırılıyor.

Buna göre gaz için aşağıdakilerden hangisi doğrudur?$q$, array[$o$Parçacık sayısı artar, böylece basınç yükselir.$o$, $o$Parçacıklar hızlanır ve duvara daha sık çarpar.$o$, $o$Gaz basıncı azalır ve parçacıklar yavaşlar.$o$, $o$Parçacıklar durur ve basınç sıfırlanır.$o$], 1, $e$1. Sıcaklık artınca gaz parçacıkları hızlanır. Duvara daha sık ve daha sert çarpmaları basıncı artırır.

Diğer şıklar: **A** sıcaklıkla sayının arttığını sanmak / **C** ilişkiyi ters kurmak / **D** ilişkiyi ters kurmak.$e$, 3),
  (13, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$pH değeri 3 olan bir çözelti için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Bazdır ve kırmızı turnusolu maviye çevirir.$o$, $o$Nötrdür ve turnusolu değiştirmez.$o$, $o$Bazdır ve fenolftaleini pembe yapar.$o$, $o$Asittir ve mavi turnusolu kırmızıya çevirir.$o$], 3, $e$1. pH 7'den küçükse çözelti asittir. Asitler mavi turnusolu kırmızıya çevirir.

Diğer şıklar: **A** pH ile türü ters yorumlamak / **B** nötr pH'ı karıştırmak / **C** pH ile türü ters yorumlamak.$e$, 1),
  (14, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$$\text{H}_2 + \text{O}_2 \longrightarrow \text{H}_2\text{O}$ denklemi denkleştirildiğinde katsayılar toplamı kaç olur?$q$, array[$o$$3$$o$, $o$$4$$o$, $o$$6$$o$, $o$$5$$o$], 3, $e$1. Denkleştirilmiş denklem $2\,\text{H}_2 + \text{O}_2 \longrightarrow 2\,\text{H}_2\text{O}$ dur.
2. Katsayılar toplamı $2 + 1 + 2 = 5$.

Diğer şıklar: **A** denkleştirmemek / **B** bir katsayıyı eksik yazmak / **C** bir katsayıyı fazla yazmak.$e$, 2),
  (15, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Madde ve Endüstri$n$), $q$Kapalı bir kapta 16 g oksijen ile 2 g hidrojen tepkimeye girerek su oluşturmuştur.

Buna göre oluşan su kaç gramdır?$q$, array[$o$$14$$o$, $o$$16$$o$, $o$$18$$o$, $o$$32$$o$], 2, $e$1. Kütlenin korunumu gereği ürünün kütlesi girenlerin toplamına eşittir: $16 + 2 = 18$ g.

Diğer şıklar: **A** farkı almak / **B** yalnızca oksijeni yazmak / **D** çarpımı yazmak.$e$, 3),
  (16, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$), $q$Bir besin zincirinde ot, çekirge, kurbağa ve yılan yer almaktadır.

Bu zincirde enerji akışı sırasında aşağıdakilerden hangisi gözlenir?$q$, array[$o$Üst basamaklara çıkıldıkça enerji miktarı artar.$o$, $o$Üst basamaklara çıkıldıkça enerji miktarı azalır.$o$, $o$Enerji bir basamaktan diğerine kayıpsız geçer.$o$, $o$Yılan bu zincirin üreticisi konumundadır.$o$], 1, $e$1. Her basamakta enerjinin büyük kısmı solunum ve ısıyla kullanılır. Üst basamaklara küçük bir kısmı aktarılır.

Diğer şıklar: **A** ters yorumlamak / **C** kayıpsız aktarım sanmak / **D** üretici-tüketici karışıklığı.$e$, 2),
  (17, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Enerji Dönüşümleri ve Çevre Bilimi$n$), $q$Fotosentezle ilgili aşağıdaki ifadelerden hangisi doğrudur?$q$, array[$o$Kimyasal enerji ışık enerjisine dönüşür.$o$, $o$Oksijen bu olayın girenlerinden biridir.$o$, $o$Işık enerjisi kimyasal enerjiye dönüşür.$o$, $o$Yalnızca hayvan hücrelerinde gerçekleşir.$o$], 2, $e$1. Fotosentezde ışık enerjisi kimyasal enerjiye çevrilir ve glikozun içinde depolanır.

Diğer şıklar: **A** yönü ters yorumlamak / **B** girenlerle ürünleri karıştırmak / **D** olayın yerini yanlış bilmek.$e$, 3),
  (18, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$), $q$Yünlü kumaşa sürtülen ebonit çubuk negatif yüklenmiştir.

Buna göre yünlü kumaşın yükü için aşağıdakilerden hangisi söylenebilir?$q$, array[$o$Pozitif yüklenmiştir.$o$, $o$Negatif yüklenmiştir.$o$, $o$Nötr kalmıştır.$o$, $o$Proton kazanmıştır.$o$], 0, $e$1. Sürtünmeyle yüklenmede cisimler zıt cins ve eşit miktarda yüklenir. Kumaş elektron kaybettiği için pozitif olur.

Diğer şıklar: **B** aynı yük sanmak / **C** yük alışverişini yok saymak / **D** proton geçtiğini sanmak.$e$, 1),
  (19, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$), $q$Gücü $100$ W olan bir ampul günde $5$ saat yanıyor.

Buna göre bu ampulün 10 günde harcadığı elektrik enerjisi kaç kWh'dir?$q$, array[$o$$0{,}5$$o$, $o$$1$$o$, $o$$5$$o$, $o$$50$$o$], 2, $e$1. Gücü kilowatta çevir: $100$ W $= 0{,}1$ kW.
2. $E = P \cdot t = 0{,}1 \cdot 5 \cdot 10 = 5$ kWh.

Diğer şıklar: **A** gün sayısını katmamak / **B** yanlış çarpmak / **D** bir sıfır fazla yazmak.$e$, 2),
  (20, 'lgs-fen', (select t.id from public.topics t where t.subject_id = 'lgs-fen' and t.name = $n$Elektrik Yükleri ve Elektrik Enerjisi$n$), $q$Nötr bir iletken küre, topraklanmışken negatif yüklü bir çubuk küreye dokundurulmadan yaklaştırılıyor. Önce topraklama kesiliyor, sonra çubuk uzaklaştırılıyor.

Buna göre küre nasıl yüklenir?$q$, array[$o$Negatif$o$, $o$Nötr kalır$o$, $o$Önce negatif sonra pozitif$o$, $o$Pozitif$o$], 3, $e$1. Etki ile yüklenmede iletken, yaklaştırılan cismin tersi cins yükle yüklenir. Çubuk negatifse küre pozitif olur.

Diğer şıklar: **A** etki ile yüklenmede aynı yükü almak / **B** topraklamanın etkisini bilmemek / **C** adımları karıştırmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | brans | lgs-ing | İngilizce branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-ing', $t$İngilizce branş denemesi 1$t$, 20, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$İngilizce branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Friendship$n$), $q$Emma: I'm sorry I forgot your birthday.
Zoe: ______ It happens to everyone.$q$, array[$o$Yes, I would like to come.$o$, $o$I really like your new bag.$o$, $o$That's all right, don't worry.$o$, $o$No, I didn't know that.$o$], 2, $e$1. Emma apologizes. Zoe should accept the apology.
2. "That's all right, don't worry." accepts an apology.

Diğer şıklar: **A** davete verilen cevabı seçmek / **B** konuyla ilgisiz cevap seçmek / **D** mantıksız cevap seçmek.$e$, 2),
  (2, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Teen Life$n$), $q$Cara: I think teenagers spend too much time on their phones.
Tom: ______ They should do more outdoor activities.$q$, array[$o$I'm afraid I can't come.$o$, $o$You're welcome.$o$, $o$That is very kind of you.$o$, $o$I totally agree with you.$o$], 3, $e$1. Tom supports Cara's idea and adds a suggestion.
2. "I totally agree with you." shows agreement.

Diğer şıklar: **A** davet reddi cevabını seçmek / **B** teşekküre verilen cevabı seçmek / **C** teşekkür cevabını seçmek.$e$, 2),
  (3, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$In the Kitchen$n$), $q$First, peel the potatoes. ______, cut them into small pieces. Finally, fry them.$q$, array[$o$Then$o$, $o$Because$o$, $o$But$o$, $o$Or$o$], 0, $e$1. The text gives steps in order: first, then, finally.
2. "Then" is the sequence word for the second step.

Diğer şıklar: **B** neden bağlacını seçmek / **C** karşıtlık bağlacını seçmek / **D** tercih bağlacını seçmek.$e$, 1),
  (4, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$On the Phone$n$), $q$Caller: May I speak to Ben, please?
Mum: He isn't here at the moment. Can I take a message?
Caller: ______$q$, array[$o$No, I can't speak to him.$o$, $o$Yes, he is my best friend.$o$, $o$Sorry, I have the wrong number.$o$, $o$Yes, please tell him to call me back.$o$], 3, $e$1. The caller wants to leave a message for Ben.
2. "Please tell him to call me back" is a suitable message.

Diğer şıklar: **A** soruyla ilgisiz cevap seçmek / **B** soruyla ilgisiz cevap seçmek / **C** durumla uyuşmayan cevap seçmek.$e$, 2),
  (5, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$The Internet$n$), $q$Which one is a safe online behavior?$q$, array[$o$Using a strong password for each account$o$, $o$Sharing your password with your friends$o$, $o$Opening emails from unknown people$o$, $o$Giving your address to strangers online$o$], 0, $e$1. A strong and different password protects your accounts.
2. The other choices put your personal information at risk.

Diğer şıklar: **B** güvenli olmayan davranışı seçmek / **C** güvenli olmayan davranışı seçmek / **D** güvenli olmayan davranışı seçmek.$e$, 1),
  (6, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Adventures$n$), $q$Last weekend, we ______ rafting and ______ a lot of fun.$q$, array[$o$go / have$o$, $o$went / had$o$, $o$going / having$o$, $o$goes / has$o$], 1, $e$1. "Last weekend" shows past time.
2. The past forms of go and have are "went" and "had".

Diğer şıklar: **A** geçmiş zaman yerine geniş zaman kullanmak / **C** fiil -ing hâlini seçmek / **D** üçüncü tekil geniş zamanı seçmek.$e$, 2),
  (7, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Tourism$n$), $q$Receptionist: ______
Tourist: A double room for two nights, please.$q$, array[$o$How was your trip to the museum?$o$, $o$What kind of room would you like?$o$, $o$Where is the nearest bank here?$o$, $o$What time is the city tour today?$o$], 1, $e$1. The tourist answers with a room type and number of nights.
2. The receptionist asked what kind of room he wants.

Diğer şıklar: **A** cevapla uyuşmayan soru seçmek / **C** cevapla uyuşmayan soru seçmek / **D** cevapla uyuşmayan soru seçmek.$e$, 2),
  (8, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Chores$n$), $q$Which chore do we do to keep our clothes clean?$q$, array[$o$Make the bed$o$, $o$Feed the cat$o$, $o$Do the laundry$o$, $o$Set the table$o$], 2, $e$1. We wash our clothes when we do the laundry.

Diğer şıklar: **A** başka bir ev işini seçmek / **B** başka bir ev işini seçmek / **D** başka bir ev işini seçmek.$e$, 1),
  (9, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Science$n$), $q$Which word means "a scientific test to find out something"?$q$, array[$o$Invention$o$, $o$Planet$o$, $o$Experiment$o$, $o$Battery$o$], 2, $e$1. Scientists do an experiment to test an idea.

Diğer şıklar: **A** buluşu deneyle karıştırmak / **B** ilgisiz sözcüğü seçmek / **D** ilgisiz sözcüğü seçmek.$e$, 1),
  (10, 'lgs-ing', (select t.id from public.topics t where t.subject_id = 'lgs-ing' and t.name = $n$Natural Forces$n$), $q$During an earthquake, you ______ stay under a strong table and cover your head.$q$, array[$o$shouldn't$o$, $o$should$o$, $o$mustn't$o$, $o$won't$o$], 1, $e$1. It is good advice to protect yourself in an earthquake.
2. "Should" is used for advice.

Diğer şıklar: **A** olumsuz kipi seçmek / **C** olumsuz kipi seçmek / **D** gelecek zaman olumsuzunu seçmek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | brans | lgs-ink | İnkılap Tarihi branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-ink', $t$İnkılap Tarihi branş denemesi 1$t$, 20, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$İnkılap Tarihi branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Bir Kahraman Doğuyor$n$), $q$Mustafa Kemal'in öğrenim hayatıyla ilgili aşağıdaki sıralamalardan hangisi doğrudur?$q$, array[$o$Selanik Askerî Rüştiyesi, Manastır Askerî İdadisi, Harp Okulu$o$, $o$Manastır Askerî İdadisi, Selanik Askerî Rüştiyesi, Harp Okulu$o$, $o$Harp Okulu, Selanik Askerî Rüştiyesi, Manastır Askerî İdadisi$o$, $o$Selanik Askerî Rüştiyesi, Harp Okulu, Manastır Askerî İdadisi$o$], 0, $e$1. Mustafa Kemal önce Selanik Askerî Rüştiyesi'ne, sonra Manastır Askerî İdadisi'ne, ardından Harp Okulu'na devam etmiştir.

Diğer şıklar: **B** okulların sırasını karıştırmak / **C** okulların sırasını karıştırmak / **D** okulların sırasını karıştırmak.$e$, 1),
  (2, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar$n$), $q$Amasya Genelgesi'nde yer alan aşağıdaki ifadelerden hangisi milli egemenlik anlayışının ilk işaretlerinden biridir?$q$, array[$o$İstanbul Hükûmeti'nin kararları her koşulda uygulanmalıdır.$o$, $o$Ülkenin geleceğine yabancı devletler karar verecektir.$o$, $o$Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır.$o$, $o$Bağımsızlık için padişahtan ayrı bir yönetim kurulamaz.$o$], 2, $e$1. Bağımsızlığı kurtaracak gücün millet olduğu belirtilmiştir.
2. Bu, egemenliğin millete ait olduğu anlayışının ilk işaretlerindendir.

Diğer şıklar: **A** genelgeye ters bir yargı seçmek / **B** genelgeye ters bir yargı seçmek / **D** genelgeye ters bir yargı seçmek.$e$, 2),
  (3, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Bir Destan: Ya İstiklal Ya Ölüm$n$), $q$Sakarya Meydan Muharebesi'nin kazanılmasının ardından TBMM, Mustafa Kemal'e hangi unvanları vermiştir?$q$, array[$o$Başkomutanlık ve Paşalık$o$, $o$Müşirlik ve Kahramanlık$o$, $o$Mareşallik ve Gazilik$o$, $o$Meclis Başkanlığı ve Gazilik$o$], 2, $e$1. Başkomutanlık yetkisi muharebeden önce verilmişti.
2. Zaferin ardından Mareşallik rütbesi ve Gazi unvanı verildi.

Diğer şıklar: **A** Başkomutanlığı muharebeden sonra verilmiş sanmak / **B** var olmayan unvanı seçmek / **D** mevcut görevi unvan sanmak.$e$, 2),
  (4, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürkçülük ve Çağdaşlaşan Türkiye$n$), $q$Harf Devrimi ile ilgili aşağıdakilerden hangisi doğrudur?$q$, array[$o$Arap alfabesi yerine Latin alfabesine dayanan Türk harfleri kabul edildi.$o$, $o$Türkçenin yazımında Arap alfabesi korunarak sadeleştirildi.$o$, $o$Yabancı dillerin eğitimi tüm okullarda zorunlu hale getirildi.$o$, $o$Osmanlı Türkçesi okullarda yeniden zorunlu ders yapıldı.$o$], 0, $e$1. 1928'de Latin alfabesine dayanan yeni Türk harfleri kabul edilmiştir.
2. Amaç okuma yazmayı kolaylaştırmak ve yaygınlaştırmaktır.

Diğer şıklar: **B** alfabenin değişmediğini sanmak / **C** ilgisiz bir uygulamayı seçmek / **D** devrimin amacına ters bir yargı seçmek.$e$, 1),
  (5, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Demokratikleşme Çabaları$n$), $q$Atatürk Dönemi'nde çok partili hayata geçiş denemelerinden biri aşağıdakilerden hangisidir?$q$, array[$o$Serbest Cumhuriyet Fırkası'nın kurulması$o$, $o$Demokrat Parti'nin kurulması$o$, $o$İttihat ve Terakki Cemiyeti'nin kurulması$o$, $o$Hürriyet ve İtilaf Fırkası'nın kurulması$o$], 0, $e$1. Serbest Cumhuriyet Fırkası 1930'da kurulmuştur.
2. Diğer seçenekler Atatürk Dönemi'nin dışındaki yıllara aittir.

Diğer şıklar: **B** sonraki dönemi karıştırmak / **C** önceki dönemi karıştırmak / **D** önceki dönemi karıştırmak.$e$, 2),
  (6, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk Dönemi Türk Dış Politikası$n$), $q$Atatürk Dönemi'nde Türkiye'nin Balkan ülkeleriyle güvenliğini sağlamak amacıyla imzaladığı antlaşma aşağıdakilerden hangisidir?$q$, array[$o$Sadabat Paktı$o$, $o$Balkan Antantı$o$, $o$Montrö Boğazlar Sözleşmesi$o$, $o$Lozan Barış Antlaşması$o$], 1, $e$1. Balkan Antantı 1934'te Yunanistan, Romanya ve Yugoslavya ile imzalanmıştır.
2. Sadabat Paktı Orta Doğu ülkeleriyle yapılmıştır.

Diğer şıklar: **A** Orta Doğu ülkeleriyle yapılan paktı seçmek / **C** Boğazlar sözleşmesini seçmek / **D** barış antlaşmasını seçmek.$e$, 2),
  (7, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürk'ün Ölümü ve Sonrası$n$), $q$Atatürk'ün vefatının ardından TBMM tarafından Cumhurbaşkanı seçilen kişi aşağıdakilerden hangisidir?$q$, array[$o$Celal Bayar$o$, $o$Fevzi Çakmak$o$, $o$Kazım Karabekir$o$, $o$İsmet İnönü$o$], 3, $e$1. Atatürk'ün ölümünden sonra 11 Kasım 1938'de İsmet İnönü Cumhurbaşkanı seçilmiştir.

Diğer şıklar: **A** sonraki dönemin cumhurbaşkanını seçmek / **B** ünlü bir komutanı cumhurbaşkanı sanmak / **C** ünlü bir komutanı cumhurbaşkanı sanmak.$e$, 1),
  (8, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar$n$), $q$Sivas Kongresi'nde alınan hangi karar, yurdun çeşitli yerlerindeki direniş cemiyetlerinin tek çatı altında birleşmesini sağlamıştır?$q$, array[$o$TBMM'nin Ankara'da açılması kararının alınması$o$, $o$Cemiyetlerin Müdafaa-i Hukuk adıyla birleştirilmesi$o$, $o$Heyet-i Temsiliye'nin görevden alınması kararı$o$, $o$Amerikan mandasının kabul edilmesi kararının verilmesi$o$], 1, $e$1. Sivas Kongresi'nde bölgesel cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti adı altında birleştirilmiştir.

Diğer şıklar: **A** kongre kararını sonraki gelişmeyle karıştırmak / **C** kongrenin amacına ters karar seçmek / **D** kongrenin amacına ters karar seçmek.$e$, 2),
  (9, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Milli Bir Destan: Ya İstiklal Ya Ölüm$n$), $q$Aşağıdaki gelişmelerden hangisi diğerlerinden önce gerçekleşmiştir?$q$, array[$o$Büyük Taarruz'un başlaması$o$, $o$Mudanya Ateşkes Antlaşması'nın imzalanması$o$, $o$Sakarya Meydan Muharebesi$o$, $o$Lozan Barış Antlaşması'nın imzalanması$o$], 2, $e$1. Sakarya Meydan Muharebesi 1921'de yapılmıştır.
2. Büyük Taarruz 1922'de, Lozan ise 1923'te gerçekleşmiştir.

Diğer şıklar: **A** sırayı karıştırmak / **B** sırayı karıştırmak / **D** sırayı karıştırmak.$e$, 1),
  (10, 'lgs-ink', (select t.id from public.topics t where t.subject_id = 'lgs-ink' and t.name = $n$Atatürkçülük ve Çağdaşlaşan Türkiye$n$), $q$Aşağıdaki inkılaplardan hangisi laiklik ilkesi doğrultusunda gerçekleştirilmiştir?$q$, array[$o$Saltanatın kaldırılması$o$, $o$Soyadı Kanunu'nun kabul edilmesi$o$, $o$Kabotaj Kanunu'nun kabul edilmesi$o$, $o$Halifeliğin kaldırılması$o$], 3, $e$1. Halifelik, din ve devlet işlerinin birbirinden ayrılması yolunda 1924'te kaldırılmıştır.
2. Bu adım laiklik ilkesiyle ilgilidir.

Diğer şıklar: **A** milli egemenlik adımını laiklik sanmak / **B** toplumsal düzenlemeyi laiklik sanmak / **C** ekonomik düzenlemeyi laiklik sanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | brans | lgs-mat | Matematik branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-mat', $t$Matematik branş denemesi 1$t$, 40, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$Matematik branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Çarpanlar ve Katlar$n$), $q$Bir manav, 36 kg elma ile 48 kg armudu eşit ağırlıkta ve her kasada yalnızca aynı tür meyve olacak biçimde kasalara koyacaktır.

Buna göre kasa sayısı en az kaç olur?$q$, array[$o$$6$$o$, $o$$7$$o$, $o$$12$$o$, $o$$84$$o$], 1, $e$1. Kasadaki meyve miktarı 36 ve 48'in ortak böleni olmalıdır. En az kasa için kasa başına en çok meyve konur: EBOB(36, 48) = 12.
2. Elma $36 \div 12 = 3$ kasa, armut $48 \div 12 = 4$ kasa. Toplam $3 + 4 = 7$ kasa.

Diğer şıklar: **A** farklı bir bölümü yazmak / **C** EBOB değerini kasa sayısı sanmak / **D** toplamı kasa sayısı sanmak.$e$, 1),
  (2, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Çarpanlar ve Katlar$n$), $q$İki otobüs bir durağa aynı anda gelmiştir. Birincisi her 12 dakikada, ikincisi her 18 dakikada bu durağa uğramaktadır.

Buna göre iki otobüs bu duraktan sonra ilk kez kaç dakika sonra yine aynı anda bulunur?$q$, array[$o$$6$$o$, $o$$30$$o$, $o$$72$$o$, $o$$36$$o$], 3, $e$1. Aynı anda bulunma süresi 12 ve 18'in EKOK'udur.
2. $12 = 2^2 \cdot 3$ ve $18 = 2 \cdot 3^2$ olduğundan EKOK $= 2^2 \cdot 3^2 = 36$ dakikadır.

Diğer şıklar: **A** EBOB'u yazmak / **B** toplamı yazmak / **C** çarpımı yarıya bölmemek.$e$, 2),
  (3, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üslü İfadeler$n$), $q$$\dfrac{2^5 \cdot 2^{-2}}{2^0}$ işleminin sonucu kaçtır?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$8$$o$, $o$$16$$o$], 2, $e$1. Üsler toplanır: $2^5 \cdot 2^{-2} = 2^{3}$.
2. $2^0 = 1$ olduğundan sonuç $2^3 = 8$.

Diğer şıklar: **A** üssü yanlış almak / **B** üssü yanlış toplamak / **D** üssü yanlış almak.$e$, 2),
  (4, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üslü İfadeler$n$), $q$$3^x = 81$ olduğuna göre $2^{x-1}$ ifadesinin değeri kaçtır?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$8$$o$, $o$$16$$o$], 2, $e$1. $81 = 3^4$ olduğundan $x = 4$.
2. $2^{x-1} = 2^3 = 8$.

Diğer şıklar: **A** x değerini 2 bulmak / **B** x değerini 3 bulmak / **D** x - 1 yerine x almak.$e$, 2),
  (5, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Kareköklü İfadeler$n$), $q$$\sqrt{8} \cdot \sqrt{2}$ işleminin sonucu kaçtır?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$6$$o$, $o$$10$$o$], 1, $e$1. Kök içleri çarpılır: $\sqrt{8 \cdot 2} = \sqrt{16} = 4$.

Diğer şıklar: **A** çarpmak yerine bölmek / **C** farkı almak / **D** toplamak.$e$, 1),
  (6, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Kareköklü İfadeler$n$), $q$Alanı $50$ santimetrekare olan karenin bir kenarı kaç santimetredir?$q$, array[$o$$2\sqrt{5}$$o$, $o$$25$$o$, $o$$10\sqrt{5}$$o$, $o$$5\sqrt{2}$$o$], 3, $e$1. Karenin kenarı alanın karekökü kadardır: $\sqrt{50} = \sqrt{25 \cdot 2} = 5\sqrt{2}$.

Diğer şıklar: **A** çarpanları ters yerleştirmek / **B** alanı kenar sanmak / **C** yanlış sadeleştirmek.$e$, 2),
  (7, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Veri Analizi$n$), $q$Bir veri grubu $5,\ 7,\ 7,\ 9,\ 12$ sayılarından oluşmaktadır.

Buna göre bu veri grubunun aritmetik ortalaması kaçtır?$q$, array[$o$$7{,}5$$o$, $o$$8$$o$, $o$$9$$o$, $o$$40$$o$], 1, $e$1. Toplam $5 + 7 + 7 + 9 + 12 = 40$ ve değer sayısı $5$ tir.
2. Ortalama $40 \div 5 = 8$.

Diğer şıklar: **A** uç değerlerin ortalamasını almak / **C** ortadaki ikinci değeri yazmak / **D** toplamı yazmak.$e$, 1),
  (8, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Basit Olayların Olma Olasılığı$n$), $q$Bir zar atılıyor.

Üst yüze gelen sayının $4$'ten büyük olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{6}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{2}{3}$$o$, $o$$\frac{1}{3}$$o$], 3, $e$1. $4$'ten büyük sayılar $5$ ve $6$ olduğundan olasılık $\dfrac{2}{6} = \dfrac{1}{3}$.

Diğer şıklar: **A** yalnızca 6'yı saymak / **B** büyük ya da eşit saymak / **C** tümleyeni yazmak.$e$, 1),
  (9, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Basit Olayların Olma Olasılığı$n$), $q$Bir torbada $6$ sarı ve $4$ mavi bilye vardır. Torbadan rastgele bir bilye çekilip geri atılmadan ikinci bir bilye çekiliyor.

Buna göre ilk bilyenin sarı olduğu bilindiğine göre ikinci bilyenin mavi olma olasılığı kaçtır?$q$, array[$o$$\frac{4}{9}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{5}{9}$$o$, $o$$\frac{3}{5}$$o$], 0, $e$1. İlk bilye sarı çekildiğinde torbada $5$ sarı ve $4$ mavi, toplam $9$ bilye kalır.
2. Mavi olasılığı $\dfrac{4}{9}$ dur.

Diğer şıklar: **B** yanlış oran kurmak / **C** sarı bilyeleri karıştırmak / **D** sarı olasılığını yazmak.$e$, 3),
  (10, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Cebirsel İfadeler ve Özdeşlikler$n$), $q$$(x + 3)^2 - (x - 3)^2$ ifadesi aşağıdakilerden hangisine eşittir?$q$, array[$o$$12x$$o$, $o$$6x$$o$, $o$$18$$o$, $o$$2x^2 + 18$$o$], 0, $e$1. $(x + 3)^2 = x^2 + 6x + 9$ ve $(x - 3)^2 = x^2 - 6x + 9$.
2. Fark $12x$.

Diğer şıklar: **B** ortadaki terimin yarısını almak / **C** sabit terimleri toplamak / **D** terimleri toplamak yerine çıkarmamak.$e$, 2),
  (11, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Cebirsel İfadeler ve Özdeşlikler$n$), $q$$x^2 - 16$ ifadesinin çarpanlarına ayrılmış hâli aşağıdakilerden hangisidir?$q$, array[$o$$(x - 4)^2$$o$, $o$$(x - 8)(x + 2)$$o$, $o$$(x - 4)(x + 4)$$o$, $o$$(x + 4)^2$$o$], 2, $e$1. $a^2 - b^2 = (a - b)(a + b)$ özdeşliğinde $a = x$ ve $b = 4$ tür.

Diğer şıklar: **A** iki kare farkını tam kare sanmak / **B** yanlış çarpanlara ayırmak / **D** iki kare farkını tam kare sanmak.$e$, 2),
  (12, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Doğrusal Denklemler$n$), $q$$y = 3x - 2$ doğrusunun eğimi kaçtır?$q$, array[$o$$-2$$o$, $o$$\frac{1}{3}$$o$, $o$$2$$o$, $o$$3$$o$], 3, $e$1. $y = mx + n$ biçiminde $m$ eğimdir. Burada $m = 3$ tür.

Diğer şıklar: **A** sabit terimi eğim sanmak / **B** eğimin tersini almak / **C** sabit terimi eğim sanmak.$e$, 1),
  (13, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Doğrusal Denklemler$n$), $q$$x + y = 12$ ve $x - y = 4$ denklem sistemini sağlayan $x$ değeri kaçtır?$q$, array[$o$$8$$o$, $o$$4$$o$, $o$$6$$o$, $o$$12$$o$], 0, $e$1. Denklemleri taraf tarafa topla: $2x = 16$, yani $x = 8$.

Diğer şıklar: **B** y değerini yazmak / **C** ortalamayı yazmak / **D** toplamı yazmak.$e$, 2),
  (14, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşitsizlikler$n$), $q$$3x - 5 < 10$ eşitsizliğini sağlayan en büyük tam sayı kaçtır?$q$, array[$o$$3$$o$, $o$$4$$o$, $o$$5$$o$, $o$$6$$o$], 1, $e$1. Her iki tarafa $5$ ekle: $3x < 15$.
2. $x < 5$ olduğundan en büyük tam sayı $4$ tür.

Diğer şıklar: **A** gereğinden küçük seçmek / **C** eşitliği dahil etmek / **D** yanlış işlem yapmak.$e$, 2),
  (15, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üçgenler$n$), $q$Kenar uzunlukları $5$ cm ve $12$ cm olan bir dik üçgenin hipotenüsü kaç cm'dir?$q$, array[$o$$7$$o$, $o$$13$$o$, $o$$17$$o$, $o$$60$$o$], 1, $e$1. Pisagor bağıntısı: $5^2 + 12^2 = 25 + 144 = 169$.
2. Hipotenüs $\sqrt{169} = 13$ cm.

Diğer şıklar: **A** dik kenarların farkını almak / **C** dik kenarları toplamak / **D** çarpmak.$e$, 2),
  (16, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üçgenler$n$), $q$Kenar uzunlukları $5$ cm ve $9$ cm olan bir üçgenin üçüncü kenarı tam sayıdır.

Buna göre bu kenar en çok kaç cm olabilir?$q$, array[$o$$13$$o$, $o$$4$$o$, $o$$12$$o$, $o$$14$$o$], 0, $e$1. Üçgen eşitsizliği: $9 - 5 < x < 9 + 5$, yani $4 < x < 14$.
2. Tam sayı olan en büyük değer $13$ tür.

Diğer şıklar: **B** farkı kenar sanmak / **C** bir eksik almak / **D** toplamı kenar sanmak.$e$, 2),
  (17, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşlik ve Benzerlik$n$), $q$$ABC$ ve $DEF$ üçgenleri benzerdir. $|AB| = 6$ cm, $|DE| = 9$ cm ve $|BC| = 10$ cm'dir.

Buna göre $|EF|$ kaç cm'dir?$q$, array[$o$$15$$o$, $o$$\frac{20}{3}$$o$, $o$$12$$o$, $o$$13$$o$], 0, $e$1. Benzerlik oranı $\dfrac{9}{6} = \dfrac{3}{2}$ dir.
2. $|EF| = 10 \cdot \dfrac{3}{2} = 15$ cm.

Diğer şıklar: **B** oranı ters kurmak / **C** yanlış oranlamak / **D** farkı eklemek.$e$, 2),
  (18, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşlik ve Benzerlik$n$), $q$Ölçeği $\dfrac{1}{500}$ olan bir planda dikdörtgen biçimli bir arsanın boyutları $4$ cm ve $3$ cm'dir.

Buna göre arsanın gerçek alanı kaç metrekaredir?$q$, array[$o$$12$$o$, $o$$60$$o$, $o$$300$$o$, $o$$3000$$o$], 2, $e$1. Gerçek kenarlar: $4 \cdot 500 = 2000$ cm $= 20$ m ve $3 \cdot 500 = 1500$ cm $= 15$ m.
2. Alan $20 \cdot 15 = 300$ m$^2$.

Diğer şıklar: **A** plandaki alanı yazmak / **B** kenarı eksik dönüştürmek / **D** birimi yanlış dönüştürmek.$e$, 3),
  (19, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Dönüşüm Geometrisi$n$), $q$$A(3,\ -2)$ noktasının $y$ eksenine göre yansıması aşağıdakilerden hangisidir?$q$, array[$o$$(3,\ 2)$$o$, $o$$(-3,\ 2)$$o$, $o$$(2,\ 3)$$o$, $o$$(-3,\ -2)$$o$], 3, $e$1. $y$ eksenine göre yansımada $x$ koordinatının işareti değişir: $(-3,\ -2)$.

Diğer şıklar: **A** x eksenine göre yansıtmak / **B** orijine göre yansıtmak / **C** koordinatların yerini değiştirmek.$e$, 2),
  (20, 'lgs-mat', (select t.id from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Geometrik Cisimler$n$), $q$Taban yarıçapı $3$ cm, yüksekliği $4$ cm olan dik dairesel silindirin hacmi kaç cm$^3$'tür? ($\pi = 3$ olarak kabul edilir.)$q$, array[$o$$36$$o$, $o$$72$$o$, $o$$108$$o$, $o$$324$$o$], 2, $e$1. $V = \pi r^2 h = 3 \cdot 9 \cdot 4 = 108$ cm$^3$.

Diğer şıklar: **A** üçe bölmek / **B** yanal alanı yazmak / **D** yarıçapı yanlış kullanmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | brans | lgs-tr | Türkçe branş denemesi 1
with s as (
  insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select 'LGS', 'brans', 'lgs-tr', $t$Türkçe branş denemesi 1$t$, 40, true
  where not exists (select 1 from public.question_sets x where x.exam = 'LGS' and x.kind = 'brans' and x.title = $t$Türkçe branş denemesi 1$t$)
  returning id, null::integer as topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözcükte Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde "sıcak" sözcüğü mecaz anlamda kullanılmıştır?$q$, array[$o$Sıcak çorbayı üfleyerek ağır ağır içti.$o$, $o$Yaz aylarında hava çok sıcak olduğu için dışarı çıkmadık.$o$, $o$Elini sıcak suyla yıkayıp havluyla kuruladı.$o$, $o$Misafirlerini sıcak bir gülümsemeyle karşıladı.$o$], 3, $e$1. "Sıcak" burada ısı bildirmez, içten ve samimi bir tavrı anlatır. Bu yüzden mecaz anlamlıdır.

Diğer şıklar: **A** gerçek anlamı seçmek / **B** gerçek anlamı seçmek / **C** gerçek anlamı seçmek.$e$, 1),
  (2, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözcükte Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde "çay" sözcüğü diğerlerinden farklı anlamda kullanılmıştır?$q$, array[$o$Kahvaltıda iki bardak sıcak çay içti.$o$, $o$Çayı demledikten sonra misafirlere ikram etti.$o$, $o$Köyün yakınından geçen çay yaz aylarında kuruyor.$o$, $o$Çay, ülkemizde en çok içilen sıcak içeceklerdendir.$o$], 2, $e$1. Diğer üç cümlede "çay" içeceği anlatır.
2. İlk cümlede ise küçük akarsu anlamındadır.

Diğer şıklar: **A** içecek anlamını farklı sanmak / **B** içecek anlamını farklı sanmak / **D** içecek anlamını farklı sanmak.$e$, 2),
  (3, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Deyimler ve Atasözleri$n$), $q$Aşağıdaki deyimlerden hangisi "çok korkmak" anlamında kullanılır?$q$, array[$o$Gözü pek olmak$o$, $o$Başı göğe ermek$o$, $o$Yüzü gülmek$o$, $o$Ödü patlamak$o$], 3, $e$1. "Ödü patlamak" çok korkmak demektir.
2. "Gözü pek" ise korkusuz anlamına gelir.

Diğer şıklar: **A** korkusuz olmayı çok korkmak sanmak / **B** çok sevinmeyi korkmak sanmak / **C** sevinmeyi korkmak sanmak.$e$, 1),
  (4, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Deyimler ve Atasözleri$n$), $q$Aşağıdaki cümlelerin hangisi "Damlaya damlaya göl olur." atasözünün anlamını en iyi yansıtır?$q$, array[$o$Her ay biraz para biriktiren Ali, istediği bisikleti aldı.$o$, $o$Ali ne yaparsa yapsın arkadaşlarını memnun edemiyordu.$o$, $o$Ali, haftalık harçlığının hepsini tek günde harcadı.$o$, $o$Ali, aldığı hediyeyi bütün arkadaşlarıyla paylaştı.$o$], 0, $e$1. Atasözü, küçük birikimlerin zamanla büyük bir sonuç verdiğini anlatır.
2. Her ay biraz para biriktirip bisiklet almak bu anlama uyar.

Diğer şıklar: **B** ilgisiz bir durumu seçmek / **C** atasözünün tersi bir durumu seçmek / **D** ilgisiz bir durumu seçmek.$e$, 2),
  (5, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde neden-sonuç ilişkisi vardır?$q$, array[$o$Hem şiir yazar hem de resim yapmayı çok severdi.$o$, $o$Ya bu akşam bize gelirsin ya da evde kalırsın.$o$, $o$Bahçede güller açmış, kuşlar neşeyle ötüyordu.$o$, $o$Ders çalışmadığı için sınavdan düşük not aldı.$o$], 3, $e$1. "Ders çalışmadığı için" neden, "düşük not aldı" sonuçtur.

Diğer şıklar: **A** ekleme ilişkisini seçmek / **B** tercih ilişkisini seçmek / **C** art arda gelen olayları neden-sonuç sanmak.$e$, 1),
  (6, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$), $q$Öğrenmek yalnızca okulda değil, yaşamın her anında sürer.

Bu cümleden aşağıdakilerden hangisi çıkarılabilir?$q$, array[$o$Okulda öğrenilenler günlük yaşamda işe yaramaz.$o$, $o$Öğrenme yalnızca çocukluk döneminde gerçekleşir.$o$, $o$Öğrenme, yaşam boyu devam eden bir süreçtir.$o$, $o$Okul, öğrenmenin gerçekleştiği tek yerdir.$o$], 2, $e$1. Cümle, öğrenmenin her anda sürdüğünü söyler. Bu da öğrenmenin yaşam boyu sürdüğünü gösterir.

Diğer şıklar: **A** cümlede olmayan bir yargı çıkarmak / **B** cümlenin tersini çıkarmak / **D** cümlenin tersini çıkarmak.$e$, 2),
  (7, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$Bir kilogram bal üretmek için arılar milyonlarca çiçeği ziyaret eder. Bu çalışma sırasında bitkilerin döllenmesine de yardımcı olurlar. Yani arılar yalnızca bal vermekle kalmaz, doğadaki besin zincirinin sürmesini de sağlar.

Bu parçanın ana düşüncesi aşağıdakilerden hangisidir?$q$, array[$o$Bal üretmek için çok sayıda çiçeğe ihtiyaç vardır.$o$, $o$Bitkilerin döllenmesi yalnızca arılar sayesinde gerçekleşir.$o$, $o$Arılar, hem bal üretir hem de doğanın dengesine katkıda bulunur.$o$, $o$Arıcılık, ülkemizde yaygın olarak yapılan bir meslektir.$o$], 2, $e$1. Parça, arıların bal üretmenin yanında bitkileri döllediğini ve doğal dengeye katkı sağladığını anlatır.

Diğer şıklar: **A** ayrıntıyı ana düşünce sanmak / **B** parçada olmayan bir kesinlik eklemek / **D** parçada geçmeyen bir bilgi vermek.$e$, 2),
  (8, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$(I) Kütüphaneler, toplumun ortak bilgi hazinesidir. (II) Buradaki kitaplar herkesin yararlanması için düzenlenmiştir. (III) Bu yıl hava sıcaklıkları mevsim normallerinin üzerinde seyretti. (IV) Okuyucular istedikleri kitabı ödünç alıp evlerinde okuyabilir. (V) Böylece kitaplara ulaşmak çok kolaylaşır.

Bu parçadaki numaralanmış cümlelerden hangisi anlam bütünlüğünü bozmaktadır?$q$, array[$o$I. cümle$o$, $o$III. cümle$o$, $o$II. cümle$o$, $o$V. cümle$o$], 1, $e$1. Parça kütüphaneler üzerinedir.
2. III. cümle hava sıcaklıklarından söz ettiği için konudan sapar.

Diğer şıklar: **A** konuyla ilgili cümleyi seçmek / **C** konuyla ilgili cümleyi seçmek / **D** konuyla ilgili cümleyi seçmek.$e$, 1),
  (9, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Paragrafta Anlam$n$), $q$Ela, her sabah okula yürüyerek gider. Yolda gördüğü sokak kedilerine mutlaka su ve mama bırakır. Geçen hafta kedilerden biri hastalanınca onu veterinere götürmek için harçlığını biriktirdi.

Bu parçadan Ela ile ilgili aşağıdakilerden hangisine **ulaşılamaz**?$q$, array[$o$Sokak hayvanlarının ihtiyaçlarını düzenli olarak karşıladığı$o$, $o$Okula servisle gidip gelmeyi tercih ettiği$o$, $o$Gerektiğinde harçlığını başkaları için kullanabildiği$o$, $o$Hayvanlara karşı duyarlı davrandığı$o$], 1, $e$1. Ela'nın her sabah okula yürüyerek gittiği söylenmiştir.
2. Servisle gidip geldiğine dair bir bilgi yoktur.

Diğer şıklar: **A** parçadan çıkarılabilen bir yargıyı seçmek / **C** parçadan çıkarılabilen bir yargıyı seçmek / **D** parçadan çıkarılabilen bir yargıyı seçmek.$e$, 3),
  (10, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlede Anlam$n$), $q$Aşağıdaki cümlelerin hangisinde amaç-sonuç ilişkisi vardır?$q$, array[$o$Sınavı kazanmak için gece geç saatlere kadar çalışıyor.$o$, $o$Yağmur yağdığı için maç ertelendi.$o$, $o$Hava çok soğuk olsa da dışarı çıkmaktan vazgeçmedik.$o$, $o$Kitabı bitirdiğinde onu bana verebilirsin.$o$], 0, $e$1. "Sınavı kazanmak için" bir amaç bildirir, çalışmak bu amaca ulaşmak için yapılan eylemdir.

Diğer şıklar: **B** neden-sonuç ilişkisini seçmek / **C** karşıtlık ilişkisini seçmek / **D** zaman ilişkisini seçmek.$e$, 2),
  (11, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Metin Türleri$n$), $q$Aşağıdaki cümlelerden hangisi anı türündeki bir metinden alınmış olabilir?$q$, array[$o$Ankara'da dün gece etkili olan sağanak nedeniyle bazı yollar kapandı.$o$, $o$Sevgili Ayşe, sana bu mektubu uzun bir aradan sonra yazıyorum.$o$, $o$Kapı gıcırdayarak açıldı ve içeri sırılsıklam bir çocuk girdi.$o$, $o$O yaz dedemin köyünde geçirdiğim günleri hâlâ dün gibi hatırlıyorum.$o$], 3, $e$1. Anıda yazar yaşadıklarını birinci kişi ağzından ve geçmişe bakarak anlatır.
2. İlk seçenek bu özelliği taşır.

Diğer şıklar: **A** haber metnini seçmek / **B** mektup türünü seçmek / **C** kurmaca anlatımı anı sanmak.$e$, 2),
  (12, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Söz Sanatları$n$), $q$Aşağıdaki cümlelerin hangisinde kişileştirme sanatı kullanılmıştır?$q$, array[$o$Deniz kadar sakin ve huzurlu bir adamdı.$o$, $o$Rüzgâr, ağaçların kulağına eski sırlar fısıldadı.$o$, $o$Bu kadar yemeği bir günde bir ordu bile bitiremezdi.$o$, $o$Yarın okulda toplanıp birlikte müzeye gideceğiz.$o$], 1, $e$1. Rüzgâr insana özgü bir davranış olan fısıldamayı yapmıştır. Bu bir kişileştirmedir.

Diğer şıklar: **A** benzetmeyi seçmek / **C** abartıyı seçmek / **D** söz sanatı içermeyen cümleyi seçmek.$e$, 1),
  (13, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilimsiler$n$), $q$Aşağıdaki cümlelerin hangisinde sıfat-fiil (ortaç) kullanılmıştır?$q$, array[$o$Koşarak okula yetişti ve derse başladı.$o$, $o$Yazdığı mektubu dün akşam postaya verdi.$o$, $o$Kitap okumak çok güzel bir alışkanlıktır.$o$, $o$Hiçbir şey söylemeden odadan çıkıp gitti.$o$], 1, $e$1. "Yazdığı" sözcüğü, "mektup" adını niteleyen bir sıfat-fiildir.

Diğer şıklar: **A** zarf-fiili seçmek / **C** isim-fiili seçmek / **D** zarf-fiili seçmek.$e$, 1),
  (14, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümlenin Ögeleri$n$), $q$Ayşe, dün akşam arkadaşına güzel bir hediye aldı.

Bu cümlede dolaylı tümleç aşağıdakilerden hangisidir?$q$, array[$o$dün akşam$o$, $o$güzel bir hediye$o$, $o$Ayşe$o$, $o$arkadaşına$o$], 3, $e$1. Yönelme hâli (-e) alan ve "kime?" sorusuna cevap veren öge dolaylı tümleçtir: arkadaşına.

Diğer şıklar: **A** zarf tümlecini seçmek / **B** nesneyi seçmek / **C** özneyi seçmek.$e$, 1),
  (15, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Fiilde Çatı$n$), $q$Aşağıdaki cümlelerin hangisinde fiil, çatı bakımından diğerlerinden farklıdır?$q$, array[$o$Yeni ders programı dün okulda duyuruldu.$o$, $o$Annem sofrayı akşam yemeği için hazırladı.$o$, $o$Çocuklar bahçede uzun süre top oynadı.$o$, $o$Öğretmen soruyu hemen tahtaya yazdı.$o$], 0, $e$1. Diğer cümlelerde işi yapan belli olduğundan fiiller etkendir.
2. "Duyuruldu" fiilinde ise işi yapan belli değildir, fiil edilgendir.

Diğer şıklar: **B** etken çatıyı seçmek / **C** etken çatıyı seçmek / **D** etken çatıyı seçmek.$e$, 1),
  (16, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Cümle Türleri$n$), $q$Aşağıdaki cümlelerin hangisi yapısı bakımından birleşik cümledir?$q$, array[$o$Yağmur dindi, hava birden açıldı.$o$, $o$Eve geldiğimde yemek çoktan hazırlanmıştı.$o$, $o$Okuldan sonra doğruca kütüphaneye gitti.$o$, $o$Bu kitabı çok beğendim ve herkese önerdim.$o$], 1, $e$1. "Geldiğimde" bir fiilimsi içerir.
2. Cümlede yüklem dışında fiilimsi bulunduğu için cümle birleşiktir.

Diğer şıklar: **A** sıralı cümleyi birleşik sanmak / **C** basit cümleyi seçmek / **D** bağlı cümleyi seçmek.$e$, 2),
  (17, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Yazım Kuralları$n$), $q$Aşağıdaki cümlelerin hangisinde yazım yanlışı **yoktur**?$q$, array[$o$Bu konuyu birşey söylemeden hızla geçti.$o$, $o$Yanlız başına uzun bir yolculuğa çıktı.$o$, $o$Sınıfta herkes sessizce öğretmenini bekliyordu.$o$, $o$Hiç bir şey söylemeden odadan hemen çıktı.$o$], 2, $e$1. Diğer cümlelerde "bir şey", "yalnız" ve "hiçbir" sözcükleri yanlış yazılmıştır.

Diğer şıklar: **A** "bir şey" sözcüğünü bitişik yazmak / **B** "yalnız" sözcüğünü yanlış yazmak / **D** "hiçbir" sözcüğünü ayrı yazmak.$e$, 1),
  (18, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Noktalama İşaretleri$n$), $q$Aşağıdaki cümlelerden hangisinin sonuna soru işareti (?) konmalıdır?$q$, array[$o$Kaçta başlayacağını bana söyler misin$o$, $o$Bu konuda ne düşündüğünü bana sormuştu$o$, $o$Ne kadar güzel bir manzaraya sahip burası$o$, $o$Yarın ne yapacağını henüz bilmiyorum$o$], 0, $e$1. Doğrudan soru soran cümlenin sonuna soru işareti konur.
2. Diğer cümleler dolaylı soru ya da ünlem içerir.

Diğer şıklar: **B** dolaylı soruyu soru cümlesi sanmak / **C** ünlem cümlesini seçmek / **D** dolaylı soruyu soru cümlesi sanmak.$e$, 2),
  (19, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Anlatım Bozuklukları$n$), $q$Aşağıdaki cümlelerin hangisinde anlatım bozukluğu vardır?$q$, array[$o$Kitabı bitirdikten sonra bana geri iade etti.$o$, $o$Ödevini zamanında teslim ederse iyi not alır.$o$, $o$Arkadaşım yeni aldığı çantayı bana gösterdi.$o$, $o$Bütün çocuklar parkta toplanıp uzun süre oyun oynadı.$o$], 0, $e$1. "İade etmek" zaten geri vermek demektir.
2. "Geri iade" sözcük tekrarı yaptığı için anlatım bozukluğu oluşur.

Diğer şıklar: **B** anlatım bozukluğu olmayan cümleyi seçmek / **C** anlatım bozukluğu olmayan cümleyi seçmek / **D** anlatım bozukluğu olmayan cümleyi seçmek.$e$, 2),
  (20, 'lgs-tr', (select t.id from public.topics t where t.subject_id = 'lgs-tr' and t.name = $n$Sözel Mantık ve Görsel Okuma$n$), $q$Ayşe, Burak, Can ve Deniz bir sırada yan yana oturuyor. Can en solda oturuyor. Burak, Deniz'in hemen sağında oturuyor. Ayşe ile Deniz yan yana oturuyor.

Buna göre soldan ikinci sırada kim oturmaktadır?$q$, array[$o$Burak$o$, $o$Can$o$, $o$Ayşe$o$, $o$Deniz$o$], 2, $e$1. Can birinci sıradadır.
2. Burak, Deniz'in hemen sağındadır. Ayşe ile Deniz yan yana olacağından sıra Can, Ayşe, Deniz, Burak olur.

Diğer şıklar: **A** yerleşimi yanlış kurmak / **B** en solda oturanı ikinci sanmak / **D** yerleşimi yanlış kurmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

