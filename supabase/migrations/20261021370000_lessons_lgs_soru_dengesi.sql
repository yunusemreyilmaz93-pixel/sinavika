-- Anlatım sorularında şık uzunluğu dengelendi: doğru cevap, açıkça en uzun şık olmaktan çıkarıldı.
-- Yalnızca şık metinleri değişir, doğru cevap harfleri ve çözümler aynı kalır.

update public.lessons l
set body = replace(l.body, $o$- A) Selanik, yeni fikirlerin kolayca yayıldığı bir şehirdir.$o$, $n$- A) Selanik, yeni fikirlerin kolay yayıldığı bir şehirdir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Bir Kahraman Doğuyor';

update public.lessons l
set body = replace(l.body, $o$- C) Selanik, Osmanlı Devleti’nin başkentidir.$o$, $n$- C) Selanik, Osmanlı Devleti’nin başkenti olarak bilinirdi.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Bir Kahraman Doğuyor';

update public.lessons l
set body = replace(l.body, $o$- D) Selanik’te askeri okul bulunmamaktadır.$o$, $n$- D) Selanik’te hiçbir askeri okul bulunmamaktadır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Bir Kahraman Doğuyor';

update public.lessons l
set body = replace(l.body, $o$- A) Parçacık sayısı azalır.$o$, $n$- A) Kaptaki parçacıkların sayısı zamanla azalır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basınç';

update public.lessons l
set body = replace(l.body, $o$- B) Parçacıklar daha yavaş hareket eder.$o$, $n$- B) Parçacıklar yavaşlar ve duvara daha az çarpar.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basınç';

update public.lessons l
set body = replace(l.body, $o$- C) Parçacıklar duvara daha sık çarpar ve gaz basıncı artar.$o$, $n$- C) Parçacıklar duvara daha sık çarpar, basınç artar.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basınç';

update public.lessons l
set body = replace(l.body, $o$- D) Gaz basıncı azalır.$o$, $n$- D) Parçacıklar sıkışır ve gaz basıncı azalır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basınç';

update public.lessons l
set body = replace(l.body, $o$- B) Dünya’nın dönme ekseni eğik olduğu için Güneş ışınları yıl içinde farklı açılarla gelir.$o$, $n$- B) Eksen eğik olduğu için Güneş ışınları yıl boyunca farklı açılarla gelir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- C) Dünya kendi ekseni etrafında döndüğü için mevsimler oluşur.$o$, $n$- C) Dünya kendi ekseni etrafında döndüğü için gece gündüz ve mevsimler oluşur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- D) Güneş’in yaydığı enerji mevsimlere göre değişir.$o$, $n$- D) Güneş’in yaydığı enerji miktarı mevsimlere göre değişir ve iklimi belirler.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- A) Avustralya Güneş’ten çok uzakta olduğu için soğuktur.$o$, $n$- A) Avustralya, Güneş’ten çok uzakta bulunduğu için bu tarihte soğuk geçer.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- B) Avustralya’da bu tarihte gündüz süresi daha uzundur.$o$, $n$- B) Avustralya’da bu tarihte gündüz süresi Türkiye’dekinden daha uzundur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- C) Güney Yarım Küre bu tarihte Güneş’in tersine eğiktir, ışınlar eğik gelir ve gündüz kısadır.$o$, $n$- C) Güney Yarım Küre Güneş’in tersine eğiktir, ışınlar eğik gelir ve gündüz kısalır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- D) Avustralya’da bu tarihte Güneş hiç doğmaz.$o$, $n$- D) Avustralya’da bu tarihte Güneş hiç doğmaz, uzun bir gece yaşanır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- A) Dün akşam İzmir’de şiddetli yağmur yağdı.$o$, $n$- A) Dün akşam İzmir’de şiddetli yağmur yağdı ve yollar suyla doldu.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- B) Bugün Ankara’da hava 12 derece.$o$, $n$- B) Bugün Ankara’da hava sıcaklığı sabah saatlerinde 12 derece ölçüldü.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- C) Yarın Rize’de kuvvetli rüzgâr bekleniyor.$o$, $n$- C) Yarın Rize’de kuvvetli rüzgâr ve sağanak yağış bekleniyor.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- A) Sera etkisinin güçlenmesiyle ortaya çıkan küresel ısınmayı anlatır.$o$, $n$- A) Sera etkisinin güçlenmesiyle oluşan küresel ısınmayı anlatır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- B) Mevsimlerin oluşumunu anlatır.$o$, $n$- B) Mevsimlerin oluşumunu ve yıl içindeki değişimini anlatır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- C) Gece ile gündüzün oluşumunu anlatır.$o$, $n$- C) Gece ile gündüzün oluşumunu ve süre farkını anlatır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- D) Hava olayları ile iklim arasındaki farkı anlatır.$o$, $n$- D) Hava olayları ile iklim arasındaki farkı ve tanımlarını anlatır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Mevsimler ve İklim';

update public.lessons l
set body = replace(l.body, $o$- A) Nükleotitlerden oluşur.$o$, $n$- A) Nükleotit adı verilen küçük birimlerden oluşur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod';

update public.lessons l
set body = replace(l.body, $o$- B) Çift sarmal yapıdadır.$o$, $n$- B) İki zincirin birbirine sarıldığı çift sarmal yapıdadır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod';

update public.lessons l
set body = replace(l.body, $o$- C) Bazları arasında adenin guanin ile eşleşir.$o$, $n$- C) Adenin bazı, karşı zincirde guanin ile eşleşir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod';

update public.lessons l
set body = replace(l.body, $o$- D) Hücre çekirdeğinde bulunur.$o$, $n$- D) Hücre çekirdeğinde bulunan bir moleküldür.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'DNA ve Genetik Kod';

update public.lessons l
set body = replace(l.body, $o$- A) En çok kuvvet 8 m’lik düzlemde gerekir.$o$, $n$- A) En çok kuvvet 8 m’lik düzlemde gerekir, yapılan iş de en çoktur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler';

update public.lessons l
set body = replace(l.body, $o$- B) En çok iş 4 m’lik düzlemde yapılır.$o$, $n$- B) En çok iş 4 m’lik düzlemde yapılır, çünkü kuvvet orada büyüktür.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler';

update public.lessons l
set body = replace(l.body, $o$- C) Üçünde de gereken kuvvet eşittir.$o$, $n$- C) Üç düzlemde de gereken kuvvet eşittir, yapılan iş farklıdır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler';

update public.lessons l
set body = replace(l.body, $o$- D) En az kuvvet 8 m’lik düzlemde gerekir, üçünde de yapılan iş eşittir.$o$, $n$- D) En az kuvvet 8 m’lik düzlemde gerekir, yapılan iş eşittir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Basit Makineler';

update public.lessons l
set body = replace(l.body, $o$- A) Yılan üretici canlıdır.$o$, $n$- A) Yılan, bu besin zincirinde üretici canlı olarak yer alır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- B) Enerji miktarı yılana doğru artar.$o$, $n$- B) Enerji miktarı zincirde yılana doğru ilerledikçe artar.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- C) Çekirge ikincil tüketicidir.$o$, $n$- C) Çekirge bu zincirde ikincil tüketici konumundadır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- A) Bir cep telefonu bataryasının cihazı çalıştırması$o$, $n$- A) Bir cep telefonu pilinin cihazı çalıştırması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- B) Bir güneş panelinin evi aydınlatması$o$, $n$- B) Bir güneş panelinin evin ışıklarını yakması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- C) Bir rüzgâr türbininin elektrik üretmesi$o$, $n$- C) Bir rüzgâr türbininin şebekeye elektrik vermesi$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- D) Bir elektrik sobasının odayı ısıtması$o$, $n$- D) Bir elektrik sobasının odayı ısıtması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Enerji Dönüşümleri ve Çevre Bilimi';

update public.lessons l
set body = replace(l.body, $o$- A) Kapalı kalır.$o$, $n$- A) Yaprakların yükü değişmez, elektroskop kapalı kalır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Elektrik Yükleri ve Elektrik Enerjisi';

update public.lessons l
set body = replace(l.body, $o$- B) Pozitif yüklenerek açılır.$o$, $n$- B) Yapraklar pozitif yüklenir ve bu yüzden açılır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Elektrik Yükleri ve Elektrik Enerjisi';

update public.lessons l
set body = replace(l.body, $o$- D) Yaprakların yükü azalır, kapanır.$o$, $n$- D) Yaprakların yükü azalır ve elektroskop tamamen kapanır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-fen' and t.name = 'Elektrik Yükleri ve Elektrik Enerjisi';

update public.lessons l
set body = replace(l.body, $o$- B) Para kesin olarak hilelidir.$o$, $n$- B) Yazı fazla geldiği için para kesin olarak hilelidir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Basit Olayların Olma Olasılığı';

update public.lessons l
set body = replace(l.body, $o$- D) Deneme sayısı arttıkça yazı gelme sıklığının $\dfrac{1}{2}$ ye yaklaşması beklenir.$o$, $n$- D) Deneme sayısı arttıkça yazı sıklığı $\dfrac{1}{2}$ ye yaklaşır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Basit Olayların Olma Olasılığı';

update public.lessons l
set body = replace(l.body, $o$- A) Köşelerin koordinatları değişmez.$o$, $n$- A) Üçgenin köşe noktalarının koordinatları aynı kalır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Dönüşüm Geometrisi';

update public.lessons l
set body = replace(l.body, $o$- D) $A'B'C'$ üçgeninin kenar uzunlukları, ABC üçgeninin kenar uzunluklarına eşittir.$o$, $n$- D) $A'B'C'$ üçgeninin kenar uzunlukları ABC ile eşittir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-mat' and t.name = 'Dönüşüm Geometrisi';

update public.lessons l
set body = replace(l.body, $o$- A) Bahçedeki **gül** çok güzel kokuyordu.$o$, $n$- A) Bahçedeki kırmızı **gül** çok güzel kokuyordu.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- B) Annem, konuşurken hep **tatlı** bir dil kullanır.$o$, $n$- B) Annem konuşurken hep **tatlı** bir dil kullanır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- C) Pazardan taze **elma** aldık.$o$, $n$- C) Pazardan annemle birlikte taze **elma** aldık.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- D) Kapıyı yavaşça **açtı**.$o$, $n$- D) Misafir gelince kapıyı yavaşça **açtı**.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- A) Halterde ağır sıklet kategorisinde birinci oldu.$o$, $n$- A) Halterde ağır sıklette birinci oldu.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- C) Ağır bir hastalık geçirdi.$o$, $n$- C) Geçen yıl ağır bir hastalık geçirdi.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- D) Ağır ağır yürüyerek eve geldi.$o$, $n$- D) Yorgun olduğu için ağır ağır yürüdü.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Sözcükte Anlam';

update public.lessons l
set body = replace(l.body, $o$- C) Kitaplığımızı yeniden düzenlemek için bütün kitapları yere indirdik.$o$, $n$- C) Kitaplığı düzenlemek için bütün kitapları yere indirdik.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Deyimler ve Atasözleri';

update public.lessons l
set body = replace(l.body, $o$- B) Bir elin nesi var, iki elin sesi var.$o$, $n$- B) Birlikten kuvvet doğar.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Deyimler ve Atasözleri';

update public.lessons l
set body = replace(l.body, $o$Bu fikir “Bir elin nesi var, iki elin sesi var.” atasözüyle örtüşür.$o$, $n$Bu fikir “Birlikten kuvvet doğar.” atasözüyle örtüşür.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Deyimler ve Atasözleri';

update public.lessons l
set body = replace(l.body, $o$- A) Sayısal verilerden yararlanma$o$, $n$- A) Sayısal veriye başvurma$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Paragrafta Anlam';

update public.lessons l
set body = replace(l.body, $o$- B) Benzetme$o$, $n$- B) Benzetmeden yararlanma$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Paragrafta Anlam';

update public.lessons l
set body = replace(l.body, $o$- C) Tanımlama$o$, $n$- C) Tanımlamadan yararlanma$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Paragrafta Anlam';

update public.lessons l
set body = replace(l.body, $o$- D) Konuşturma$o$, $n$- D) Konuşturmadan yararlanma$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Paragrafta Anlam';

update public.lessons l
set body = replace(l.body, $o$- A) Çocuklar bahçede oynadı.$o$, $n$- A) Çocuklar bahçede uzun süre neşeyle oynadı.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Fiilde Çatı';

update public.lessons l
set body = replace(l.body, $o$- C) Elif sabah erkenden giyindi.$o$, $n$- C) Elif sabah erkenden kalkıp hızlıca giyindi.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Fiilde Çatı';

update public.lessons l
set body = replace(l.body, $o$- D) Ali ile Ayşe sokakta karşılaştı.$o$, $n$- D) Ali ile Ayşe dün akşam sokakta karşılaştı.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Fiilde Çatı';

update public.lessons l
set body = replace(l.body, $o$- A) Öğretmen sınıfa girdi.$o$, $n$- A) Öğretmen sabah erkenden sınıfa girdi.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümle Türleri';

update public.lessons l
set body = replace(l.body, $o$- B) Çocuklar dün parkta oynadı.$o$, $n$- B) Çocuklar dün akşam parkta oynadı.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümle Türleri';

update public.lessons l
set body = replace(l.body, $o$- C) Bu kitap çok ilginç.$o$, $n$- C) Bu kitap bana göre gerçekten çok ilginç.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Cümle Türleri';

update public.lessons l
set body = replace(l.body, $o$- B) Dün: sinemaya gittim.$o$, $n$- B) Dün akşam: arkadaşımla sinemaya gittik.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Noktalama İşaretleri';

update public.lessons l
set body = replace(l.body, $o$- C) Ali: geldi.$o$, $n$- C) Ali: bugün okula erken geldi ve oturdu.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Noktalama İşaretleri';

update public.lessons l
set body = replace(l.body, $o$- D) Hava çok: soğuk.$o$, $n$- D) Hava bugün çok: soğuk ve rüzgârlıydı.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Noktalama İşaretleri';

update public.lessons l
set body = replace(l.body, $o$- A) Ödevimi bitirdim.$o$, $n$- A) Ödevimi dün akşam eve gelince bitirdim.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Anlatım Bozuklukları';

update public.lessons l
set body = replace(l.body, $o$- C) Dün akşam sinemaya gittik.$o$, $n$- C) Dün akşam ailecek sinemaya gittik.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Anlatım Bozuklukları';

update public.lessons l
set body = replace(l.body, $o$- D) Sınavı kazandı.$o$, $n$- D) Sınavı büyük bir başarıyla kazandı.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-tr' and t.name = 'Anlatım Bozuklukları';

update public.lessons l
set body = replace(l.body, $o$- A) Milli egemenliğe dayalı yeni bir meclisin açılmasına sebep olmuştur.$o$, $n$- A) Milli egemenliğe dayalı yeni bir meclisin açılmasına yol açmıştır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar';

update public.lessons l
set body = replace(l.body, $o$- B) Milli mücadelenin sona ermesine yol açmıştır.$o$, $n$- B) Milli mücadelenin sona ermesine ve direnişin bitmesine yol açmıştır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar';

update public.lessons l
set body = replace(l.body, $o$- C) İstanbul Hükümeti’nin gücünü artırmıştır.$o$, $n$- C) İstanbul Hükümeti’nin Anadolu’daki gücünü artırmıştır.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar';

update public.lessons l
set body = replace(l.body, $o$- D) Mondros Ateşkesi’nin imzalanmasına neden olmuştur.$o$, $n$- D) Mondros Ateşkesi’nin imzalanmasına ve işgallere neden olmuştur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar';

update public.lessons l
set body = replace(l.body, $o$- A) Mondros Ateşkesi’nin imzalanması$o$, $n$- A) Mondros Ateşkesi’nin imzalanması ve ordunun dağıtılması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm';

update public.lessons l
set body = replace(l.body, $o$- B) Birinci İnönü’de düzenli ordunun ilk zaferini kazanması$o$, $n$- B) Birinci İnönü’de düzenli ordunun ilk zaferi kazanması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm';

update public.lessons l
set body = replace(l.body, $o$- C) İzmir’in işgal edilmesi$o$, $n$- C) İzmir’in Yunan ordusu tarafından işgal edilmesi$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm';

update public.lessons l
set body = replace(l.body, $o$- D) Amasya Genelgesi’nin yayımlanması$o$, $n$- D) Amasya Genelgesi’nin yayımlanarak ulusa duyurulması$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Milli Bir Destan: Ya İstiklal Ya Ölüm';

update public.lessons l
set body = replace(l.body, $o$- A) Harf İnkılabı$o$, $n$- A) Latin harflerinin kabulü$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye';

update public.lessons l
set body = replace(l.body, $o$- B) Medeni Kanun$o$, $n$- B) Medeni Kanun’un kabulü$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye';

update public.lessons l
set body = replace(l.body, $o$- D) Soyadı Kanunu$o$, $n$- D) Soyadı Kanunu’nun kabulü$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürkçülük ve Çağdaşlaşan Türkiye';

update public.lessons l
set body = replace(l.body, $o$- A) Yurtta sulh, cihanda sulh$o$, $n$- A) Yurtta sulh, cihanda sulh ilkesine bağlı kalmak$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk Dönemi Türk Dış Politikası';

update public.lessons l
set body = replace(l.body, $o$- B) Komşu ülkelerle sorunları silahlı çatışmayla çözmek$o$, $n$- B) Komşularla sorunları silahlı çatışmayla çözmek$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk Dönemi Türk Dış Politikası';

update public.lessons l
set body = replace(l.body, $o$- C) Tam bağımsızlık$o$, $n$- C) Tam bağımsızlığı her şeyin üstünde tutmak$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk Dönemi Türk Dış Politikası';

update public.lessons l
set body = replace(l.body, $o$- D) Uluslararası kuruluşlarla iş birliği$o$, $n$- D) Uluslararası kuruluşlarla iş birliği yapmak$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ink' and t.name = 'Atatürk Dönemi Türk Dış Politikası';

update public.lessons l
set body = replace(l.body, $o$- A) Allah olacak her şeyi bilir.$o$, $n$- A) Allah, bütün olacakları önceden bilir ve bu bilgi eksiksizdir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kader İnancı';

update public.lessons l
set body = replace(l.body, $o$- B) İnsan, iradesiyle seçim yapar.$o$, $n$- B) İnsan, kendi iradesiyle seçim yapar ve yaptıklarından sorumlu olur.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kader İnancı';

update public.lessons l
set body = replace(l.body, $o$- C) İnsan yaptığı kötülüklerden sorumlu değildir, çünkü her şey kaderdir.$o$, $n$- C) İnsan kötülüklerden sorumlu değildir, çünkü her şey kaderdir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kader İnancı';

update public.lessons l
set body = replace(l.body, $o$- D) Kader inancı insana çalışma azmi ve güven verir.$o$, $n$- D) Kader inancı insana çalışma azmi, güven ve huzur verir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Kader İnancı';

update public.lessons l
set body = replace(l.body, $o$- A) Zengin bir akrabaya$o$, $n$- A) Zengin olan uzak bir akrabaya$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Zekât ve Sadaka';

update public.lessons l
set body = replace(l.body, $o$- B) Borcunu ödeyemeyen bir kişiye$o$, $n$- B) Borcunu ödeyemeyen bir kişiye$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Zekât ve Sadaka';

update public.lessons l
set body = replace(l.body, $o$- C) Kendi çocuğuna$o$, $n$- C) Kendi çocuğuna ya da torununa$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Zekât ve Sadaka';

update public.lessons l
set body = replace(l.body, $o$- D) Annesine$o$, $n$- D) Yardıma muhtaç olan annesine$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Zekât ve Sadaka';

update public.lessons l
set body = replace(l.body, $o$- A) Çalışarak helal kazanç elde etmek$o$, $n$- A) Çalışarak helal yoldan kazanç elde etmeye gayret etmek$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- B) Hastalanınca doktora gitmek$o$, $n$- B) Hastalanınca tedavi olmak için doktora gitmek$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- C) Sorumluluk bilinciyle ders çalışmak$o$, $n$- C) Sorumluluk bilinciyle düzenli ders çalışmak$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- D) Kara kedinin yolu kesmesinin uğursuzluk getireceğine inanmak$o$, $n$- D) Kara kedi yolu keserse uğursuzluk geleceğine inanmak$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- A) Can$o$, $n$- A) Can güvenliği$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- C) Akıl$o$, $n$- C) Akıl sağlığı$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- D) Nesil$o$, $n$- D) Nesil sürekliliği$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Din ve Hayat';

update public.lessons l
set body = replace(l.body, $o$- A) Cömertlik$o$, $n$- A) Cömertlik ve paylaşmayı$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Hz. Muhammed''in Örnekliği';

update public.lessons l
set body = replace(l.body, $o$- B) Çalışkanlık$o$, $n$- B) Çalışkanlık ve üretkenliği$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Hz. Muhammed''in Örnekliği';

update public.lessons l
set body = replace(l.body, $o$- C) Hoşgörü ve affediciliği$o$, $n$- C) Hoşgörü ve affediciliği$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Hz. Muhammed''in Örnekliği';

update public.lessons l
set body = replace(l.body, $o$- D) Alçakgönüllülük$o$, $n$- D) Alçakgönüllülük ve sadeliği$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-din' and t.name = 'Hz. Muhammed''in Örnekliği';

update public.lessons l
set body = replace(l.body, $o$- A) You can sleep all day.$o$, $n$- A) You can sleep all day if you want.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- B) You are very tired.$o$, $n$- B) You are very tired after school.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- C) You shouldn’t use your phone before bed.$o$, $n$- C) You shouldn’t use your phone before bed.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- D) I like using my phone too.$o$, $n$- D) I like using my phone before bed too.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- A) He is playing football now.$o$, $n$- A) He is playing football in the park now.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- B) She doesn’t have a hobby.$o$, $n$- B) She doesn’t have a favourite hobby.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- C) They are at the cinema.$o$, $n$- C) They are at the cinema this evening.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- D) I prefer reading books to watching TV.$o$, $n$- D) I prefer reading books to watching TV.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Teen Life';

update public.lessons l
set body = replace(l.body, $o$- A) I’m fine, thanks.$o$, $n$- A) I’m fine, thanks. How are you?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- B) It’s Saturday.$o$, $n$- B) It’s Saturday today, I think.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- C) Hold on, please. I’ll call him.$o$, $n$- C) Hold on, please. I’ll call him.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- D) Yes, I have a phone.$o$, $n$- D) Yes, I have a new phone at home.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- A) Where are you from?$o$, $n$- A) Where are you calling from, please?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- B) Would you like to leave a message?$o$, $n$- B) Would you like to leave a message?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- C) What time is it?$o$, $n$- C) What time does the match begin?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- D) How old are you?$o$, $n$- D) Are you coming to the match today?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'On the Phone';

update public.lessons l
set body = replace(l.body, $o$- A) I use the internet to do research for my homework.$o$, $n$- A) I use the internet to do research for homework.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- B) I go to school every day.$o$, $n$- B) I go to school with my friends every day.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- C) She is next to me.$o$, $n$- C) She is sitting next to me in the class.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- D) We listened to the teacher.$o$, $n$- D) We listened to the teacher carefully today.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- A) You should answer him angrily.$o$, $n$- A) You should answer him angrily and argue with him.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- C) You should tell your parents or me and block that person.$o$, $n$- C) You should tell your parents and block that person.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- D) You should send bad messages back.$o$, $n$- D) You should send bad messages back to that person.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'The Internet';

update public.lessons l
set body = replace(l.body, $o$- A) I will go next week.$o$, $n$- A) I will go to the mountains next week.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Adventures';

update public.lessons l
set body = replace(l.body, $o$- B) I’m going to the airport.$o$, $n$- B) I’m going to the airport with my parents.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Adventures';

update public.lessons l
set body = replace(l.body, $o$- C) I don’t like traveling.$o$, $n$- C) I don’t like traveling by bus very much.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Adventures';

update public.lessons l
set body = replace(l.body, $o$- D) It was wonderful! We saw many beautiful places.$o$, $n$- D) It was wonderful! We saw lovely places.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Adventures';

update public.lessons l
set body = replace(l.body, $o$- A) I’m fine, thanks. And you?$o$, $n$- A) I’m fine, thanks. How about you today?$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Tourism';

update public.lessons l
set body = replace(l.body, $o$- B) It’s a nice hotel.$o$, $n$- B) It’s a nice hotel near the beach.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Tourism';

update public.lessons l
set body = replace(l.body, $o$- C) I’d like to book a double room, please.$o$, $n$- C) I’d like to book a double room, please.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Tourism';

update public.lessons l
set body = replace(l.body, $o$- D) My name is Zeynep.$o$, $n$- D) My name is Zeynep and I’m from Izmir.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Tourism';

update public.lessons l
set body = replace(l.body, $o$- A) Water boils in the freezer.$o$, $n$- A) Water boils in the freezer after a while.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Science';

update public.lessons l
set body = replace(l.body, $o$- B) Water gets hotter in the freezer.$o$, $n$- B) Water gets hotter in the freezer slowly.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Science';

update public.lessons l
set body = replace(l.body, $o$- C) Water turns into ice when it is very cold.$o$, $n$- C) Water turns into ice when it is very cold.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Science';

update public.lessons l
set body = replace(l.body, $o$- D) Water disappears in the freezer.$o$, $n$- D) Water disappears in the freezer completely.$n$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'lgs-ing' and t.name = 'Science';
