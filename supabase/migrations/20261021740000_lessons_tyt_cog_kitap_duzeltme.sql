-- TYT Coğrafya: MEB ders kitaplarıyla uyum (beş küre, 21 Aralık, basınç kuşakları ve merkezleri, rüzgârlar, iklim türleri, tektonik yapı, demografik dönüşüm, yerleşme sınıflaması, işlevler, afetler, çevre anlaşmaları ve diğer düzeltmeler)

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$| **Fiziki (doğal) coğrafya** | Klimatoloji, jeomorfoloji, hidrografya, biyocoğrafya | İklim, yer şekilleri, sular, bitki ve hayvan dağılışı |$a$, $b$| **Fiziki (doğal) coğrafya** | Jeomorfoloji, klimatoloji, hidrografya, biyocoğrafya, toprak coğrafyası | Yer şekilleri, iklim, sular, canlıların dağılışı, topraklar |$b$), $a$| **Beşeri coğrafya** | Nüfus, yerleşme, ekonomi, ulaşım, kültür coğrafyası | Nüfus, şehirler, tarım, sanayi, ticaret, göç |$a$, $b$| **Beşeri coğrafya** | Nüfus, yerleşme, siyasi, sosyal, kültürel ve ekonomik coğrafya | Nüfus, yerleşmeler, devletler, toplumsal yapı, kültür, tarım, sanayi, ticaret |$b$), $a$Beşeri coğrafya, insanın doğayı **nasıl kullandığını ve değiştirdiğini** inceler.$a$, $b$Beşeri coğrafya, insanın doğayı **nasıl kullandığını ve değiştirdiğini** inceler.

İnsanın etkisi olmayan yere **doğal ortam** denir. Doğal ortam beş kürenin etkileşiminden oluşur: **taş küre** (litosfer), **hava küre** (atmosfer), **su küre** (hidrosfer), **buz küre** (kriyosfer) ve **yaşam küre** (biyosfer). İnsanın doğal ortam üzerine kurduğu yaşam alanına **beşerî ortam**, ikisinin birlikteliğine **coğrafi ortam** denir.$b$), $a$## 3. Coğrafyanın ilkeleri

Coğrafi bir olayı doğru incelemek için bazı ilkelere dayanılır:$a$, $b$## 3. Coğrafi bakış ve ilkeler

Coğrafi bakış açısı bir olayı şu sorularla ele alır: **Ne? Nerede? Ne zaman? Neden orada? Neden önemli? Doğal ve beşerî ortamlarla nasıl bir ilişkisi var?** Bu soruların arkasındaki çalışma ilkeleri şunlardır:$b$), $a$| Ekonomi, sosyoloji | Beşeri faaliyetler |$a$, $b$| Ekonomi, sosyoloji | Beşeri faaliyetler |
| Demografi, istatistik | Nüfus verileri ve çözümleme |$b$), $a$- **Arazi gözlemi, anket ve ölçme.**$a$, $b$- **Niceleme (istatistik) yöntemleri:** Verilerin sayısal olarak toplanıp çözümlenmesi.
- **Arazi gözlemi, anket ve ölçme.**$b$), $a$## 7. Konuyu toparla$a$, $b$## 7. Coğrafya biliminin gelişimi

Coğrafya sözcüğü Eski Yunancada **geo** (yer) ve **graphein** (tasvir etmek) sözcüklerinden gelir. Eratosthenes bu sözcüğü ilk kullanan kişidir.

| Çağ | Başlıca isimler | Öne çıkanlar |
| --- | --- | --- |
| Eski Çağ | Tales, Herodot, Aristoteles, Eratosthenes (MÖ 276 ile 194), Amasyalı Strabon (MÖ 64 ile MS 24), İskenderiyeli Batlamyus (100 ile 170) | Yerlerin tasviri ve haritalanması, Dünya’nın şekli ve boyutları, koordinat sistemi |
| Orta Çağ | Harizmi, Biruni (973 ile 1048), Muhammed İdrisi (1100 ile 1166), İbni Haldun, seyyahlar İbni Battuta (1304 ile 1369) ve Mesudi | Müslüman bilginlerin matematik ve astronomi çalışmaları, İpek Yolu ve Baharat Yolu ticareti |
| Yeni Çağ | Kristof Kolomb, Magellan, Piri Reis (1470 ile 1554), Ortelius (1527 ile 1598), Kâtip Çelebi (1609 ile 1657), Evliya Çelebi | Coğrafi keşifler, haritacılık, Seyahatname |
| Yakın Çağ | Von Humboldt (1769 ile 1859), Carl Ritter (1779 ile 1859), Friedrich Ratzel, Blache (1845 ile 1918), Sauer (1889 ile 1975) | Yöntemlerin oluşması, neden-sonuç ilişkileri, bugünkü bölümlerin ortaya çıkması |

Cumhuriyet Dönemi’nde Besim Darkot, Faik Sabri Duran, Reşat İzbırak ve Sırrı Erinç coğrafya bilimine katkıda bulunmuştur.

## 8. Konuyu toparla$b$), $a$5. Kaynakları gelecek kuşakları da düşünerek kullanmaya ne denir? => Sürdürülebilirlik.$a$, $b$5. Kaynakları gelecek kuşakları da düşünerek kullanmaya ne denir? => Sürdürülebilirlik.
6. Coğrafya sözcüğünü ilk kullanan bilim insanı kimdir? => Eratosthenes.
7. Doğal ortamı oluşturan beş küre nedir? => Taş küre, hava küre, su küre, buz küre, yaşam küre.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğa ve İnsan'
  and position($a$| **Fiziki (doğal) coğrafya** | Klimatoloji, jeomorfoloji, hidrografya, biyocoğrafya | İklim, yer şekilleri, sular, bitki ve hayvan dağılışı |$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(l.body, $a$| **22 Aralık** | **Oğlak$a$, $b$| **21 Aralık** | **Oğlak$b$), $a$| 22 Aralık | Oğlak Dönencesi, kuzeyde kış |$a$, $b$| 21 Aralık | Oğlak Dönencesi, kuzeyde kış |$b$), $a$22 Aralık’taki duruma ait bilgi verilmiş$a$, $b$21 Aralık’taki duruma ait bilgi verilmiş$b$), $a$Dünya, Güneş’e **Ocak ayında en yakın** (günberi), **Temmuz ayında en uzak** (günöte) olur.$a$, $b$Dünya, Güneş’e **3 Ocak’ta en yakın** (günberi), **4 Temmuz’da en uzak** (günöte) olur. Bu uzaklık farkı dolanma hızını ve yarım kürelerdeki mevsim sürelerini etkiler, sıcaklık üzerinde belirgin etkisi yoktur.$b$), $a$- **Ekvatorda** gece ve gündüz yıl boyunca yaklaşık 12 saattir, mevsim farkı yoktur.$a$, $b$- **Ekvatorda** gece ve gündüz yıl boyunca yaklaşık 12 saattir, mevsim farkı yoktur.
- **Matematik iklim kuşakları:** İki dönence arası **tropikal kuşak**, dönenceler ile kutup daireleri arası **orta kuşak**, kutup daireleri ile kutuplar arası **kutup kuşağı** olarak adlandırılır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Dünya''nın Şekli ve Hareketleri'
  and position($a$| **22 Aralık** | **Oğlak$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(l.body, $a$### Özel paraleller$a$, $b$Enlem ve boylam **derece (°), dakika (′) ve saniye (″)** olarak ifade edilir. Örneğin Çanakkale Şehitler Abidesi, 40° 03′ 00″ kuzey enlemi ile 26° 13′ 08″ doğu boylamının kesiştiği noktadadır.

### Özel paraleller$b$), $a$Sıfır meridyeninin saatine göre **3 saat ilerde** olur.$a$, $b$Sıfır meridyeninin saatine göre **3 saat ilerde** olur. Dünya 15°’lik **24 saat dilimine** ayrılır. Doğu yarım kürede dilimler +1, +2, +3 ..., batı yarım kürede -1, -2, -3 ... şeklinde numaralanır. Türkiye **+3. saat diliminde** yer alır.$b$), $a$**Gün çizgisi (180° meridyeni):** Doğuya giderken bu çizgiyi geçince bir gün geri, batıya giderken bir gün ileri alınır.$a$, $b$**Tarih değiştirme çizgisi (180° meridyeni):** Çizginin batısında tarih bir gün ileri, doğusunda bir gün geridir. Doğuya giderken bu çizgiyi geçince bir gün geri, batıya giderken bir gün ileri alınır. Çizgi, zaman karışıklığını önlemek için siyasi sınırlara uyularak yer yer zikzak çizilmiştir.$b$), $a$- Yüzölçümü yaklaşık **783 562 km²**’dir.$a$, $b$- Yüzölçümü **780 043 km²**’dir. Eski kaynaklarda 783 562 km² yazılabilir.$b$), $a$- Komşuları: Yunanistan, Bulgaristan, Gürcistan, Ermenistan, Azerbaycan (Nahçıvan), İran, Irak, Suriye.$a$, $b$- **Kara sınırı komşuları:** Batıda Yunanistan ve Bulgaristan, doğuda Gürcistan, Ermenistan, Azerbaycan (Nahçıvan) ve İran, güneyde Irak ve Suriye.
- **Deniz sınırı komşuları:** Karadeniz’de Bulgaristan, Romanya, Ukrayna, Rusya ve Gürcistan, Ege Denizi’nde Yunanistan, Akdeniz’de KKTC, Libya, Mısır, Filistin, İsrail, Lübnan ve Suriye.
- **Mavi Vatan** Türkiye’nin deniz yetki alanlarını, **Gök Vatan** kara ve deniz yetki alanlarının üzerindeki hava sahasını ifade eder.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Coğrafi Konum'
  and position($a$### Özel paraleller$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(l.body, $a$- **Kesir ölçek:** $\dfrac{1}{100\,000}$ gibi. Haritada 1 cm,$a$, $b$- **Kesir ölçek:** $\dfrac{1}{100\,000}$ gibi. Pay her zaman 1, birim santimetredir. Haritada 1 cm,$b$), $a$## 3. Harita türleri
$a$, $b$## 3. Harita türleri

Haritalar kullanım amacına göre **genel** (fiziki, siyasi, topoğrafya) ve **tematik** (jeoloji, iklim, toprak, bitki örtüsü, nüfus, ulaşım, turizm, ekonomi gibi tek bir konuyu gösteren) haritalar olarak ikiye ayrılır.
$b$), $a$## 4. İzohips (eş yükselti) eğrileri
$a$, $b$## 4. Yükselti gösterimi ve izohips eğrileri

Yer şekilleri ve yükselti haritada üç yöntemle gösterilir: **renklendirme** (yükselti arttıkça yeşilden koyu kahverengiye, derinlik arttıkça açık maviden koyu maviye), **izohips** ve **kabartma** (üç boyutlu maket).
$b$), $a$- İzohips eğrileri **birbirini kesmez** ve birleşmez. Yalnızca çok dik uçurumlarda üst üste gelebilir.$a$, $b$- İzohips eğrileri **birbirini kesmez** ve birleşmez. Yalnızca falez ve şelale gibi dik yapılarda üst üste çizilebilir.
- Komşu iki izohips arasındaki yükselti farkı haritanın tamamında **aynıdır**. 0 m izohipsi **kıyı çizgisidir**.$b$), $a$**Profil çıkarma:** İki nokta arasında kesit alarak yükseltinin nasıl değiştiğini grafiğe dökmek. Eğim, yer şekli ve görüş analizi yapmak için kullanılır.$a$, $b$**Profil:** Haritada belirlenen iki nokta arasında ya da bir hat (akarsu, yol) boyunca yer şekillerinin yandan görünüşünü, eğim ve yükselti değerlerini gösteren grafiktir. Yol güzergâhı seçiminde ve eğim analizinde kullanılır.$b$), $a$| **Kadastro, imar haritası** | Mülkiyet ve yapılaşma |$a$, $b$| **Kadastro, imar haritası** | Mülkiyet ve yapılaşma |

Tematik haritalar şu gösterim yöntemleriyle çizilir:

- **Korokromatik:** Renk ya da desenlerle yalnızca alansal dağılışı gösterir, miktar belirtmez (iklim türleri, toprak türleri).
- **Koroplet:** Miktarı ya da yoğunluğu renk tonlarıyla gösterir (nüfus yoğunluğu).
- **İzoplet ve izometrik:** Eşit değerli noktaları çizgiyle birleştirir. İzohips (eş yükselti), izobat (eş derinlik), izoterm (eş sıcaklık), izobar (eş basınç) ve izoseist (eş sismik) izometrik hatlardır.
- **Noktalama:** Her nokta belli bir miktarı temsil eder ve dağılışı gösterir.
- **Oransal sembol:** Değere göre boyutu değişen semboller kullanılır, en yaygını dairedir.
- **Akış haritası:** Göç, ticaret gibi hareketlerin yönünü ve miktarını gösterir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Harita Bilgisi'
  and position($a$- **Kesir ölçek:** $\dfrac{1}{100\,000}$ gibi. Haritada 1 cm,$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$Su buharının tamamına yakını burada |$a$, $b$Gazların yaklaşık %80’i ve su buharının tamamına yakını burada |$b$), $a$- **Bitki örtüsü, rüzgârlar, bulutluluk** ve **kar örtüsü** da etkilidir.

**İzoterm:** Aynı sıcaklıktaki yerleri birleştiren eğridir.$a$, $b$- **Rüzgârlar:** Ekvator yönünden esenler sıcaklığı artırır, kutup yönünden esenler düşürür.
- **Nem:** Nemli yerlerde sıcaklık farkları azdır. Nemin az olduğu çöllerde gündüz çok ısınılır, gece hızla soğunulur.
- **Bitki örtüsü, bulutluluk, kar örtüsü** ve **güneşlenme süresi** de etkilidir. Büyük kentler beton ve asfalt nedeniyle çevresinden sıcaktır (**kentsel ısı adası**).

**İzoterm:** Aynı sıcaklıktaki yerleri birleştiren eğridir. Yükselti etkisini ortadan kaldırmak için değerler deniz seviyesine indirgenir (indirgenmiş izoterm haritası).

**Sıcaklık kuşakları:** Yıllık ortalaması 20°C’un üstünde olan yerler sıcak, 0°C ile 20°C arasında olanlar ılıman, 0°C’un altında olanlar soğuk kuşaktır.$b$), $a$**Basınç**, havanın yeryüzüne yaptığı ağırlıktır. Birimi **milibar (mb)** ya da hPa’dır. Deniz seviyesinde ortalama **1013 mb**.$a$, $b$**Basınç**, havanın yeryüzüne yaptığı ağırlıktır. Birimi **milibar (mb)** ya da hPa’dır. **Standart basınç**, 45° enleminde, deniz seviyesinde ve 15°C’ta **1013 mb**’dır. Bu değerin üstü **yüksek basınç** (antisiklon), altı **alçak basınç** (siklon) sayılır. Eş basınç noktalarını birleştiren eğriye **izobar** denir.$b$), $a$- **Rüzgâr:** Yüksek basınçtan alçak basınca doğru esen hava hareketidir. Basınç farkı arttıkça (izobarlar sıklaşırsa) **rüzgâr hızı artar.**$a$, $b$- **Rüzgâr:** Yüksek basınçtan alçak basınca doğru esen hava hareketidir. Basınç farkı arttıkça (izobarlar sıklaşırsa) **rüzgâr hızı artar**, basınç merkezleri arası uzaklık arttıkça ve sürtünme (engebe, kent, orman) arttıkça azalır.$b$), $a$**Örnek.** Deniz seviyesinde 1013 mb olan basınç 500 m yükseklikte$a$, $b$**Basınç kuşakları:**

| Enlem | Kuşak | Oluşum ve etkisi |
| --- | --- | --- |
| 0° | Termik alçak basınç | Sıcaklıktan. Hava yükselir, yağışlı |
| 30° (iki yarım kürede) | Dinamik yüksek basınç | Dünya’nın dönüşünden. Hava alçalır, kurak |
| 60° (iki yarım kürede) | Dinamik alçak basınç | Farklı hava kütleleri karşılaşır. Hava yükselir, yağışlı |
| 90° (kutuplar) | Termik yüksek basınç | Soğuktan. Hava alçalır, kurak |

- **Alçak basınç merkezinde** hava çevreden merkeze akar ve yükselir. Hava bulutlu ve yağışlıdır.
- **Yüksek basınç merkezinde** hava merkezden çevreye akar ve alçalır. Hava açıktır, yağış beklenmez.

**Türkiye’yi etkileyen basınç merkezleri:**

| Merkez | Etkisi |
| --- | --- |
| İzlanda (dinamik alçak) | Kışın batı ve kuzeybatıdan yağış getirir |
| Sibirya (termik yüksek) | Kışın soğuk ve yağışsız günlere neden olur |
| Asor (dinamik yüksek) | Yazın sıcak ve kurak havayı sağlar |
| Basra (termik alçak) | Yazın sıcak, yağışsız ve bunaltıcı günler getirir |

**Örnek.** Deniz seviyesinde 1013 mb olan basınç 500 m yükseklikte$b$), $a$- **Sürekli rüzgârlar:** Alizeler (dönenceler çevresinden ekvatora), batı rüzgârları (orta enlemlerde batıdan doğuya), kutup doğu rüzgârları.$a$, $b$- **Sürekli rüzgârlar:** Yıl boyunca aynı yönden eser. **Alizeler** 30° dinamik yüksek basınçtan ekvatordaki termik alçak basınca eser ve kıtaların doğu kıyılarına bol yağış bırakır. **Batı rüzgârları** 30°’den 60°’ye doğru batıdan doğuya eser ve kıtaların batı kıyılarına bol yağış getirir. **Kutup rüzgârları** kutuplardan 60°’ye eser, soğuktur.
- **Tropikal rüzgârlar:** Sıcak kuşakta okyanuslar üzerinde oluşur. Bol yağış getirir, hortum ve kasırgaya dönüşebilir (tayfun, hurricane, tornado).$b$), $a$- **Yerel rüzgârlar:** Meltem (gündüz denizden karaya, gece karadan denize), fön (dağdan inen kuru ve sıcak rüzgâr).$a$, $b$- **Yerel rüzgârlar:** **Meltem** günlük sıcaklık farkından doğar. Deniz meltemi gündüz denizden karaya, kara meltemi gece karadan denize eser. Dağ meltemi gece dağdan vadiye, vadi meltemi gündüz vadiden dağa eser. **Fön**, dağın diğer yamacında alçalırken ısınan sıcak ve kurutucu rüzgârdır, karları hızla eritebilir.
- **Türkiye’deki yerel rüzgârlar:** Poyraz, yıldız ve karayel kuzeyden eser, sıcaklığı düşürür. Lodos, kıble ve keşişleme güneyden eser, sıcaklığı artırır. Lodos güneybatıdan ılık eser ve yağmur getirir. Keşişleme sıcak ve kuru bir rüzgârdır, en çok Güneydoğu Anadolu’da etkilidir.$b$), $a$- Sıcak hava daha çok buhar taşır. Soğuyunca fazla buhar **yoğunlaşır**, bulut ve yağış oluşur.$a$, $b$- Sıcak hava daha çok buhar taşır. Havanın neme doyması için soğuması gereken sıcaklığa **doyma (çiy) noktası** denir. Bu noktaya ulaşınca fazla buhar **yoğunlaşır**, sis, bulut ve yağış oluşur.$b$), $a$**İklim**, bir yerde uzun yıllar boyunca gözlenen ortalama hava koşullarıdır.$a$, $b$**İklim**, bir yerde uzun yıllar boyunca gözlenen ortalama hava koşullarıdır. Sıcaklığa göre iklimler üçe ayrılır: **sıcak** (ekvatoral, savan, çöl, muson), **ılıman** (Akdeniz, okyanusal, ılıman karasal, sert karasal) ve **soğuk** (tundra, kutup, yüksek dağ) iklimler.$b$), $a$| **Karasal** | Kışlar soğuk, yazlar sıcak, yağış az | **Bozkır**, iğne yapraklı orman |
| **Tundra ve kutup** | Çok soğuk | Yosun ve likenler, buzul |$a$, $b$| **Ilıman karasal (step)** | Kışlar soğuk, yazlar sıcak, yağış az | **Bozkır** |
| **Sert karasal** | Kışlar çok soğuk ve uzun, yazlar kısa ve serin | İğne yapraklı orman (tayga) |
| **Tundra (kutup altı)** | Kısa ve serin yaz, uzun ve çok soğuk kış | Yosun ve likenler |
| **Kutup** | Yıl boyu çok soğuk | Buzul, bitki yok denecek kadar az |
| **Yüksek dağ** | Yükseldikçe sıcaklık düşer | Yükselti kuşaklarına göre değişir |$b$), $a$Türkiye **orta kuşakta** yer alır, **dört mevsim** görülür. Üç iklim tipi egemendir:$a$, $b$Türkiye **orta kuşakta** yer alır, **dört mevsim** görülür. Mutlak konumu nedeniyle Akdeniz iklim kuşağındadır, ancak yükselti, denizellik-karasallık ve dağların uzanışı farklı iklimlerin oluşmasına yol açmıştır. Üç iklim tipi egemendir:$b$), $a$**Marmara** bölgesi, bu iklimlerin **geçiş** özelliklerini gösterir.$a$, $b$**Marmara** bölgesi ve Batı Anadolu’nun iç kesimleri (Uşak, Afyon, Kütahya) bu iklimlerin **geçiş** özelliklerini gösterir. İklimler arasında kesin sınır yoktur, geçiş dereceli olur.

- **Sıcaklık** güneyden kuzeye doğru enlemin, batıdan doğuya doğru yükseltinin etkisiyle azalır. **Güneşlenme süresi** güneyden kuzeye azalır, en fazla Şanlıurfa ve Mardin’de (yıllık 3250 saat), en az Trabzon, Rize ve Artvin’dedir (1750 saat).
- **Yağış** en çok Doğu ve Batı Karadeniz kıyılarında, Akdeniz’de güneye bakan dağlık kesimlerde düşer. En çok yağış alan yer Rize’dir. En az yağış Iğdır ile Tuz Gölü çevresine düşer.$b$), $a$## 7. Konuyu toparla$a$, $b$## 7. Aşırı hava olayları

Normal koşulların çok üstünde ya da altında seyreden sıcaklık, yağış ve rüzgâr değerlerine **aşırı hava olayları** denir.

- **Sıcak hava dalgası:** Sıcaklıkların mevsim normallerinden 3 ile 5 derece fazla olması ve art arda en az 5 gün sürmesidir (Dünya Meteoroloji Örgütü).
- **Soğuk hava dalgası:** Ani ve önemli sıcaklık düşüşüdür.
- **Fırtına:** Rüzgâr hızı saatte 62 ile 117 km arasında olur.
- **Şiddetli yağış:** Genellikle 24 saatte 50 mm’yi aşan yağıştır. Sel ve taşkına yol açabilir.
- **Kuraklık:** Yağışın uzun süre normalin çok altında kalmasıdır. Tarımsal ve hidrolojik kuraklık olarak ayrılır.

## 8. Konuyu toparla$b$), $a$| Rüzgâr | Yüksek basınçtan alçak basınca |$a$, $b$| Rüzgâr | Yüksek basınçtan alçak basınca |
| Basınç kuşakları | 0° termik alçak, 30° dinamik yüksek, 60° dinamik alçak, 90° termik yüksek |$b$), $a$## Kendini dene$a$, $b$:::soru{cevap="D"}
Kış aylarında Türkiye üzerine yerleşerek soğuk ve yağışsız günlere neden olan basınç merkezi aşağıdakilerden hangisidir?

- A) İzlanda dinamik alçak basıncı
- B) Asor dinamik yüksek basıncı
- C) Basra termik alçak basıncı
- D) Sibirya termik yüksek basıncı
- E) Ekvatoral termik alçak basıncı

---

1. Kışın Sibirya üzerinde oluşan termik yüksek basınç, Türkiye’ye soğuk ve kuru hava taşır.
2. Diğer merkezler yağış, yaz kuraklığı ya da yaz sıcağı getirir. Doğru cevap D.

Diğer şıklar: **İzlanda dinamik alçak basıncı** batı ve kuzeybatıdan yağış getirir / **Asor dinamik yüksek basıncı** yazın sıcak ve kurak havaya neden olur / **Basra termik alçak basıncı** yazın sıcak ve bunaltıcı günler getirir / **Ekvatoral termik alçak basınç** Türkiye’yi doğrudan etkileyen bir merkez değildir.
:::

:::soru{cevap="B"}
Dünya’nın dönüşü nedeniyle hava kütlelerinin alçalıp yığıldığı 30° enlemlerinde oluşan basınç kuşağı ve buradaki iklim koşulu aşağıdakilerden hangisinde doğru verilmiştir?

- A) Dinamik alçak basınç, yağışlı
- B) Dinamik yüksek basınç, kurak
- C) Termik yüksek basınç, kurak
- D) Termik alçak basınç, yağışlı
- E) Dinamik yüksek basınç, yağışlı

---

1. 30° enlemlerinde hava alçalır ve yığılır, bu yüzden dinamik yüksek basınç oluşur.
2. Alçalan hava bulut oluşturmaz, iklim kurak olur. Doğru cevap B.

Diğer şıklar: **Dinamik alçak basınç, yağışlı** 60° enlemlerinin özelliğidir / **Termik yüksek basınç, kurak** kutupların özelliğidir / **Termik alçak basınç, yağışlı** ekvatorun özelliğidir / **Dinamik yüksek basınç, yağışlı** alçalan hava yağış getirmez.
:::

## Kendini dene$b$), $a$5. Karadeniz iklimi hangi özelliğiyle bilinir? => Her mevsim yağışlıdır.$a$, $b$5. Karadeniz iklimi hangi özelliğiyle bilinir? => Her mevsim yağışlıdır.
6. Poyraz, yıldız ve karayel hangi yönden eser? => Kuzeyden.
7. Termik alçak basınç kuşağı hangi enlemdedir? => Ekvator (0°).$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Atmosfer ve İklim'
  and position($a$Su buharının tamamına yakını burada |$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$Levhalar mantonun üstünde çok yavaş (yılda birkaç cm) hareket eder.$a$, $b$Levhalar, mantodaki konveksiyon akıntılarının etkisiyle mantonun üstünde çok yavaş (yılda birkaç cm) hareket eder. Kıtaların kayması kuramını 1915’te Alfred Wegener ortaya atmıştır. Levha tektoniği kuramı ise 1960’tan sonra okyanus tabanlarındaki yayılma araştırmalarıyla geliştirilmiştir. Kurama göre kıtalar eskiden **Pangea** adlı tek bir süper kıtaydı.$b$), $a$Türkiye’de **Gediz ve Büyük Menderes grabenleri**.$a$, $b$Batı Anadolu’da horst dağları **Bozdağlar, Aydın ve Menteşe dağları**, graben ovaları **Bakırçay, Gediz, Küçük Menderes ve Büyük Menderes**’tir.$b$), $a$- **Epirojenez:** Karaların **yavaş yükselmesi ya da alçalması**. Teraslar, kıyı değişiklikleri.$a$, $b$- **Yaşlı dağlar:** 250 ile 400 milyon yıl önce oluşan Appalaş, İskandinav ve Ural dağları aşınarak alçalmıştır.
- **Epirojenez:** Karaların **yavaş yükselmesi ya da alçalması**. Teraslar, kıyı değişiklikleri.$b$), $a$Volkanlar çoğunlukla levha sınırlarında görülür.$a$, $b$Volkanların çoğu levha sınırlarında, özellikle Pasifik çevresindeki **ateş çemberinde** görülür. Hawaii gibi levha sınırı olmayan **sıcak nokta**larda da volkanizma olur.$b$), $a$- **Tabakalı (konik) volkan:** Erciyes, Ağrı.
- **Kalkan volkan:** Hawaii.$a$, $b$- **Tabakalı (konik) volkan:** Fuji, Etna, Vezüv, Erciyes, Ağrı.
- **Kalkan volkan:** Hawaii.
- **Tüf konisi:** Piroklastik malzemenin yığılmasıyla oluşan küçük koni (Kula, Divlit).
- **Çizgisel (fisür) püskürme:** Çatlaklardan çıkan akışkan lavlar geniş lav platoları oluşturur.
- **Derinlik volkanizması:** Magma yeryüzüne çıkamadan kabuk içinde katılaşır (sill, dayk, batolit, lakolit).$b$), $a$- **Odak (hiposantr):** Depremin yerin içinde başladığı yer.
- **Yüzey merkezi (episantr):**$a$, $b$- **Odak (iç merkez, hiposantr):** Depremin yerin içinde başladığı yer.
- **Yüzey merkezi (dış merkez, episantr):**$b$), $a$- **Sismograf** depremleri kaydeder.$a$, $b$- **Sismograf** depremleri kaydeder. Depremler normal, ters ve doğrultu atımlı faylarda olur. Deniz tabanındaki depremler **tsunami** denilen dev dalgalar oluşturabilir.$b$), $a$**Avrasya, Afrika ve Arap levhaları** arasında sıkışan **Anadolu levhası** vardır.$a$, $b$**Avrasya, Afrika ve Arap levhaları** arasında sıkışan **Anadolu levhası** vardır. Bu sıkışmayla Kuzey Anadolu Dağları ve Toroslar yükselmiş, levha yılda yaklaşık 2 ile 3 cm batıya kaymıştır.$b$), $a$- **Kuzey Anadolu Fay Hattı (KAF):** Marmara’dan Doğu Anadolu’ya uzanan en önemli fay.$a$, $b$- **Kuzey Anadolu Fay Hattı (KAF):** Anadolu ile Avrasya levhalarını ayıran, Marmara’dan Doğu Anadolu’ya uzanan en önemli fay. Boyunca Adapazarı, Bolu, Düzce, Erzincan ve Iğdır gibi graben ovaları vardır.$b$), $a$- **Doğu Anadolu Fay Hattı (DAF):** Karlıova’dan Hatay’a.$a$, $b$- **Doğu Anadolu Fay Hattı (DAF):** Karlıova’dan Hatay’a uzanır, Anadolu levhasını Arap ve Afrika levhalarından ayırır. Amik, Kahramanmaraş, Elâzığ ve Muş ovaları bu fay boyunca çöküntü alanlarıdır.$b$), $a$- **Batı Anadolu graben sistemi:** Gediz, Büyük Menderes, Küçük Menderes. Ege’de deprem sık görülür.$a$, $b$- **Batı Anadolu fay zonları:** Bakırçay, Gediz, Küçük Menderes ve Büyük Menderes grabenleri. Ege’de deprem sık görülür.$b$), $a$- Türkiye’de **volkanlar** (Erciyes, Hasan, Ağrı, Nemrut, Süphan) ve **jeotermal** alanlar vardır.$a$, $b$- Türkiye’de **volkanlar** (Ağrı, Tendürek, Süphan, Nemrut, Erciyes, Karadağ, Hasan, Melendiz, Kula) ve **jeotermal** alanlar vardır. Sıcak su kaynaklarının büyük kısmı üç ana fay sisteminin bulunduğu bölgelerdedir.$b$), $a$**Fiziksel** (donma-çözülme, sıcaklık farkı) ya da **kimyasal** (suyla çözülme).$a$, $b$**Fiziksel** (sıcaklık farkı, donma, tuz çatlaması, kavlama), **kimyasal** (suyla çözünme) ya da biyolojik (bitki kökü, humus asidi). Fiziksel ayrışma kurak ve soğuk, kimyasal çözünme sıcak ve nemli yerlerde etkilidir.$b$), $a$- **U biçimli vadi**, **sirk** (buzul oyuğu), **moren** (buzulun bıraktığı yığın), buzul gölleri.
- Türkiye’de Ağrı, Erciyes, Cilo ve Kaçkar dağlarında küçük buzullar var.$a$, $b$- **Sirk** (buzul oyuğu), **U biçimli vadi**, **fiyort** (buzul vadisine denizin dolması), buzul gölleri. Birikme şekilleri **moren** (buzulun bıraktığı yığın), **sandur** ve **drumlin**’dir.
- Türkiye’de buzul izleri Ağrı, Süphan, Tendürek, Bingöl, Kaçkar, Uludağ ve birçok Toros dağında görülür. Son buzul çağında kalıcı kar sınırı 3500 m civarından 2200 m civarına inmiştir.$b$), $a$- **Aşındırma:** Mantar kaya, yardang.$a$, $b$- **Aşındırma:** Süpürme (deflasyon) ve yüzey aşındırması (abrazyon). **Çöl kaldırımı**, mantar kaya, yardang.$b$), $a$- **Lapya, dolin (obruk), uvala, polye** (karstik ova), **mağara**.$a$, $b$- **Lapya, dolin (koyak), uvala, polye** (karstik ova), **düden**, **kör vadi**, **mağara**, **obruk** (mağara tavanının çökmesiyle oluşan çukur), **traverten**.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'İç ve Dış Kuvvetler'
  and position($a$Levhalar mantonun üstünde çok yavaş (yılda birkaç cm) hareket eder.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$Ortalama tuzluluk **binde 35 (‰35)**’tir.$a$, $b$Ortalama tuzluluk **binde 35 (‰35)**’tir. Suların %97,5’i tuzlu, %2,5’i tatlıdır. Tatlı suyun %68,7’si buzullarda, %30,1’i yer altı sularında, %1,2’si göl ve akarsulardadır. Kuzey yarım kürede denizler %61, güney yarım kürede %81 yer kaplar.$b$), $a$Akdeniz’de (‰38) tuzluluk yüksektir.$a$, $b$Akdeniz’de (‰38) ve Kızıldeniz’de (yaklaşık ‰41) tuzluluk yüksektir.$b$), $a$Karadeniz’de (yaklaşık ‰18) tuzluluk düşüktür.$a$, $b$Karadeniz’de (yaklaşık ‰18) tuzluluk düşüktür, Baltık Denizi’nin bazı kesimlerinde ‰2’ye kadar iner.$b$), $a$- Kapalı ve sığ denizlerde tuzluluk daha çok değişir.$a$, $b$- Kapalı ve sığ denizlerde tuzluluk daha çok değişir.
- Deniz suyunun **sıcaklığı** başta enlem olmak üzere akıntılara bağlıdır. Ekvator çevresinde yaklaşık 25°C, kutuplarda -2°C’a kadar düşer.$b$), $a$**Kuzey Atlantik Akıntısı** (sıcak) Kuzeybatı Avrupa kıyılarını aynı enlemdeki Kuzey Amerika kıyılarından daha ılık yapar.$a$, $b$**Gulf Stream** (sıcak) İngiltere’nin batı kıyılarını ısıtır, Kanada’nın doğu kıyılarından geçen **Labrador** (soğuk) akıntısı ise aynı enlemde sıcaklığı düşürür.$b$), $a$Türkiye’de akarsu rejimleri **düzensizdir**, yağış ve kar erimesine bağlıdır.$a$, $b$Yıl boyu debisi az değişen akarsuların rejimi **düzenli** (Amazon, Kongo), mevsimsel farkların büyük olduğu akarsuların rejimi **düzensizdir** (Ganj, Mekong). Türkiye’de akarsu rejimleri **düzensizdir**, yağış ve kar erimesine bağlıdır. Türkiye akarsularının akış hızı yüksek, boyu kısa ve debisi düşüktür, denge profiline ulaşmamıştır. Hidroelektrik potansiyeli fazladır, yük gemisi taşımacılığına elverişli değildir.$b$), $a$Akarsuyun yatağının eğimi, taşıdığı su ve yük, aşındırma ve biriktirmeyi belirler.$a$, $b$Akarsuyun yatağının eğimi, taşıdığı su ve yük, aşındırma ve biriktirmeyi belirler. Akarsu havzalarını ayıran sınıra **su bölümü çizgisi**, yataktan saniyede geçen su miktarına **debi (akım)** denir. Türkiye’de **sınıraşan sular** Fırat, Dicle, Kura, Aras, Çoruh, Meriç ve Asi’dir. **Sınır oluşturan sular** Meriç, Aras ve Arpaçay’dır.$b$), $a$**Göller:** Oluşumuna göre **tektonik** (Tuz, Burdur), **volkanik** (Nemrut Krater Gölü), **karstik** (çukurlarda), **set** (heyelan ya da volkanik set: Van Gölü), **buzul gölleri** ve **baraj gölleri** (insan yapımı).$a$, $b$**Göller:** Oluşumuna göre **yerlikaya** (tektonik: Tuz ve Burdur, volkanik: Nemrut Krater Gölü, buzul, karstik, meteorit), **set** (lav set: Van Gölü, heyelan, alüvyal, moren ve yapay set, yani baraj gölleri) ve **relikt** göllerdir. Fazla suyunu bir akarsuyla boşaltan (**gideğenli**) göllerin suyu çoğunlukla tatlıdır (Beyşehir, Eğirdir). Dışa akışı olmayan ve buharlaşmanın fazla olduğu Tuz Gölü gibi göllerde tuzluluk yüksektir.$b$), $a$**Kaynak**, **artezyen** (basınçlı su) ve **kaplıcalar** (jeotermal) buradan çıkar.$a$, $b$Geçirimli tabakalarda biriken suya **akifer** denir. Yer altı suyunun yeryüzüne çıktığı yere **kaynak** denir. Kaynaklar karstik (voklüz), artezyen (basınçlı su), yamaç (vadi), fay ve gayzer olarak ayrılır. **Kaplıcalar** (jeotermal) da buradan çıkar.$b$), $a$## 3. Toprak
$a$, $b$**Sulak alanlar:** Ramsar Sözleşmesi (1971) doğal ya da yapay, sürekli ya da geçici, tatlı, acı ya da tuzlu suları, bataklık, sazlık ve turbalıkları sulak alan sayar. Türkiye sözleşmeyi 1994’te onaylamıştır. Kızılırmak Deltası, Gediz Deltası, Seyfe, Burdur, Manyas (Kuş) ve Uluabat gölleri, Akyatan Lagünü ve Göksu Deltası gibi 14 Ramsar alanı vardır.

## 3. Toprak
$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Su, Toprak ve Bitki'
  and position($a$Ortalama tuzluluk **binde 35 (‰35)**’tir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$## 2. Nüfus yoğunluğu
$a$, $b$**Dünya nüfusunun artışında üç sıçrama dönemi** vardır: Yaklaşık 1 milyon yıl önce aletlerin yapılması, yaklaşık 10 bin yıl önce tarım devrimi ve yerleşik hayat, Sanayi Devrimi ile tıptaki gelişmeler. Dünya nüfusu 1800’lerin başında 1 milyara, 1927’de 2 milyara ulaşmıştır. Hızlı nüfuslanma 1950’den sonra daha çok gelişmekte olan ülkelerde yaşanmıştır. Birleşmiş Milletler tahminlerine göre 2100’de dünya nüfusu 9 ile 13 milyar arasında olacaktır.

## 2. Nüfus yoğunluğu
$b$), $a$- **Doğal etmenler:** İklim (ılıman iklimler), yer şekilleri (ovalar), su kaynakları, toprak verimliliği, yükselti.$a$, $b$- **Doğal etmenler:** İklim (ılıman iklimler), yer şekilleri (ovalar), yükselti ve eğim, su kaynakları, toprak verimliliği, bitki örtüsü, kıyılar, doğa kökenli afetler.$b$), $a$- **Beşeri etmenler:** Ekonomik faaliyetler (sanayi, ticaret), ulaşım, tarihî gelişme, iş imkânları, savaşlar.$a$, $b$- **Beşeri etmenler:** Ekonomik faaliyetler (tarım, sanayi, madencilik, turizm, ticaret), ulaşım, tarihî ve dinî nedenler, siyasi nedenler ve nüfus politikaları, iş imkânları, savaşlar, göçler.$b$), $a$**Yaşlı nüfus fazlalığının** sorunları:$a$, $b$**Demografik dönüşüm modeli**, bir ülkenin doğum ve ölüm oranlarına göre beş aşamadan hangisinde olduğunu gösterir. Model İngiltere, Fransa ve Almanya’nın nüfuslanma sürecinden çıkarılmıştır ve göçü dikkate almaz. Günümüzde 1. aşamada ülke yoktur, gelişmekte olan ülkelerde 2. ya da 3. aşama özellikleri görülür.

| Aşama | Doğum | Ölüm | Nüfus artışı | Özellik |
| --- | --- | --- | --- | --- |
| **1** | Yüksek | Yüksek | Çok düşük | Sanayi öncesi, sağlık hizmeti yetersiz |
| **2** | Yüksek | Düşmeye başlar | Yüksek | Sanayileşmenin ilk dönemi, beslenme ve sağlık iyileşir |
| **3** | Düşmeye başlar | Düşük | Yavaşlar | Kentleşme, eğitim, kadının çalışma hayatına girmesi |
| **4** | Çok düşük | Düşük | Çok düşük | Sanayi sonrası toplum |
| **5** | Çok düşük | Biraz daha yüksek | Negatif | Yaşlı nüfus fazla, nüfus azalır |

**Yaşlı nüfus fazlalığının** sorunları:$b$), $a$Çalışan nüfusa oranı **bağımlılık oranıdır.**$a$, $b$Çalışan nüfusa oranı **bağımlılık oranıdır.** Çalışma çağındaki nüfus oranının bağımlı nüfustan yüksek olduğu döneme **demografik fırsat penceresi** denir.$b$), $a$**Zorunlu göç:** Savaş, doğal afet, baskı nedeniyle (mübadele, sığınmacılar).$a$, $b$**Zorunlu göç:** Savaş, doğal afet, iklim değişikliği, baskı nedeniyle (mübadele, sığınmacılar).$b$), $a$- **Çekici faktörler:** Gidilen yerde iş, eğitim, sağlık hizmetleri, güvenlik.$a$, $b$- **Çekici faktörler:** Gidilen yerde iş, eğitim, sağlık hizmetleri, güvenlik.
- **Engeller:** Mesafe, ulaşım olanakları, politikalar, hukuki durum.
- **Kişisel özellikler:** Göç edenin dili, dini, mesleği, eğitim durumu.$b$), $a$- **Zorunlu göçler:** 1923 Türk-Yunan nüfus mübadelesi, 1989’da Bulgaristan’dan göç ve son yıllarda sığınmacılar.$a$, $b$- **Zorunlu göçler:** 1923 Türk-Yunan nüfus mübadelesi (Lozan Barış Antlaşması), 1989’da Bulgaristan’dan göç ve son yıllarda sığınmacılar.
- **TÜİK 2025 verileri:** Nüfus 86 092 168, ortanca yaş 34,9, kaba doğum hızı ‰10,6, kaba ölüm hızı ‰6, nüfus artış hızı ‰5, toplam doğurganlık hızı 1,62.$b$), $a$**Nüfus politikaları:** Devletler nüfusu **artırmak** (doğum teşviki) ya da **sınırlamak** (doğum kontrolü) amacıyla politika izleyebilir. Çin uzun yıllar “tek çocuk” politikasını uyguladı.$a$, $b$**Nüfus politikası**, devletlerin nüfusun yapısı, dağılışı, niteliği ve niceliğine yönelik karar ve uygulamalarıdır. Başlıca türleri:

- **Nüfus artış hızını azaltma:** Doğum oranı yüksek ülkeler (Hindistan, Pakistan, Afganistan) uygular. Çin uzun yıllar “tek çocuk” politikasını uygulamıştır.
- **Nüfus artış hızını artırma:** Yaşlı nüfusu fazla ülkeler (Almanya, Japonya, İsveç) iş gücü açığını önlemek için uygular.
- **Dağılışı düzenleme:** Nüfusun ülke içinde dengeli dağılması hedeflenir (Kanada, Endonezya, Avustralya, Norveç, Çin, Hindistan).
- **Demografik yapıyı iyileştirme:** Eğitim, sağlık ve istihdam düzeyi yükseltilir.
- **Göç politikası:** İş gücü ihtiyacı olan ülkeler göç alır (Almanya, Katar, ABD, Kanada, Avustralya).$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Nüfus ve Göç'
  and position($a$## 2. Nüfus yoğunluğu
$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$| Örnek | Köy, mezra, kom | Şehir, kasaba, metropol |$a$, $b$| Örnek | Köy, kasaba, mezra | Şehir, büyükşehir, metropol |$b$), $a$Yerleşmeler **sürekli** ya da **geçici** olabilir:$a$, $b$Türkiye’de nüfusu 2000’in altındaki kır yerleşmesine **köy**, 2000 ile 10 000 arasında olana **kasaba** denir. Şehirler nüfusa göre küçük (20 bine kadar), orta (20 bin ile 100 bin), büyük (100 bin ile 1 milyon) ve **metropol** (1 milyonun üzeri) olarak sınıflandırılır. Köy, kasaba, şehir, büyükşehir ve metropol yerleşmelerin **mekânsal hiyerarşisini** oluşturur.

Yerleşmeler **sürekli** ya da **geçici** olabilir:$b$), $a$- **Sürekli yerleşme:** Yıl boyu oturulan köy ve şehirler.$a$, $b$- **Sürekli yerleşme:** Yıl boyu oturulan şehir, kasaba ve köyler. Köy altı yerleşmelerinden **mahalle** ve **mezra** (köyden uzakta birkaç ev ve tarım alanı) da sürekli oturulur.$b$), $a$- **Geçici yerleşme:** **Yayla** (yazın hayvan otlatmak için çıkılan yüksek yerler), **kışlak** (kışın inilen yer), çiftlik evi, mezra. Mevsimlik kullanılır.$a$, $b$- **Geçici yerleşme (köy altı):** **Yayla** (yazın hayvancılık, tarım ve turizm için kullanılan yüksek yerler), **oba** (konargöçer ailelerin yazlık yerleşmesi), **kom** (köyden uzakta hayvancılık için ev ve eklentileri), **kışlak** (kışın inilen yer). Mevsimlik kullanılır.$b$), $a$- **Çizgisel yerleşme:** Yol ya da akarsu boyunca sıralı.$a$, $b$- **Çizgisel yerleşme:** Yol ya da akarsu boyunca sıralı (Amasya, Gümüşhane).
- **Kümelenmiş yerleşme:** Evler bir merkez etrafında sıkışık yapıdadır (Safranbolu). **Rassal yerleşme:** Evler düzensiz ve birbirinden uzaktır (Doğu Karadeniz yaylaları). **Radyal yerleşme:** Yollar bir odaktan çevreye ışınsal yayılır. **Izgara kalıp:** Sokaklar birbirine dik uzanır (planlı şehirler).$b$), $a$| İşlev | Örnek |
| --- | --- |
| **Ticaret** | İstanbul, İzmir, Gaziantep |
| **Sanayi** | Kocaeli, Bursa, Eskişehir |
| **Turizm** | Antalya, Bodrum, Muğla, Nevşehir (Kapadokya) |
| **Liman ve ulaşım** | Mersin, İskenderun, Samsun |
| **Madencilik** | Zonguldak, Batman (petrol) |
| **Tarım ticareti** | Konya, Adana |
| **Dinî** | Mekke, Konya (Mevlana) |
| **İdari (başkent)** | Ankara |
| **Eğitim** | Eskişehir, Ankara |
| **Askerî** | Kars, Çanakkale (tarihte) |$a$, $b$| İşlev | Örnek |
| --- | --- |
| **Tarım** | Çarşamba (Samsun), Söke (Aydın), Salihli (Manisa) |
| **Madencilik** | Ereğli (Zonguldak), Afşin-Elbistan (Kahramanmaraş), Maden (Elâzığ) |
| **Sanayi** | Tuzla (İstanbul), Aliağa (İzmir), Gebze (Kocaeli), Gaziantep |
| **Ticaret** | Ataşehir (İstanbul), İnegöl (Bursa) |
| **Yönetim** | Ankara |
| **Sağlık** | Afyonkarahisar, İstanbul, İzmir, Antalya, Adana, Ankara |
| **Ulaşım** | İstanbul (hava yolu), İzmir ve Mersin (deniz yolu), Eskişehir (demir yolu), Ankara ve Konya (kara yolu) |
| **Turizm** | Çeşme (İzmir), Bodrum (Muğla), Kuşadası (Aydın), Kemer (Antalya) |
| **Eğitim ve kültür** | Eskişehir (eğitim), Konya ve İstanbul (tarihî ve kültürel) |
| **Askerî** | Gölcük (Kocaeli), Foça (İzmir), Polatlı (Ankara) |$b$), $a$Bir şehir **birden fazla işleve** sahip olabilir. Kuruluşundaki işlev zamanla değişebilir.$a$, $b$Bir şehir **birden fazla işleve** sahip olabilir. Kuruluşundaki işlev zamanla değişebilir.

**Etki alanı:** Bir yerleşmenin çevresine yaptığı etkinin sınırıdır. Konum, ulaşım, sosyal, kültürel, ekonomik, siyasi ve idari faktörlerle belirlenir. Etki alanına göre yerleşmeler **yerel** (Şirince, Kadirli, Bayburt), **bölgesel** (Eskişehir, Samsun) ve **küresel** (İstanbul, New York, Londra, Paris, Şanghay) etkili olarak ayrılır.$b$), $a$**Mezra** mezra küçük ve geçici/yarı sürekli yerleşmedir.$a$, $b$**Mezra** mezra köyden uzakta birkaç ev ve tarım alanından oluşan küçük bir köy altı yerleşmesidir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Yerleşme'
  and position($a$| Örnek | Köy, mezra, kom | Şehir, kasaba, metropol |$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(replace(replace(replace(l.body, $a$Doğuda yüksek (Kaçkar 3937 m)$a$, $b$Doğuda yüksek (Kaçkar 3932 m)$b$), $a$**Erciyes (3917 m)**, Hasan Dağı (3268 m)$a$, $b$**Erciyes (3917 m)**, Hasan Dağı (3268 m), Karadağ, Melendiz$b$), $a$- **Doğu Anadolu Platoları** (Erzurum-Kars, Muş)$a$, $b$- **Doğu Anadolu Platoları** (Erzurum-Kars)$b$), $a$**Gediz, Büyük Menderes, Küçük Menderes** (Ege), **Antalya** ovası.$a$, $b$Batı Anadolu’da **Bakırçay, Gediz, Küçük Menderes ve Büyük Menderes**, Kuzey Anadolu Fayı boyunca **Adapazarı, Bolu, Düzce, Erzincan ve Iğdır**, Doğu Anadolu Fayı boyunca **Amik, Kahramanmaraş, Elâzığ ve Muş** ovaları.$b$), $a$**Konya Ovası**, **Iğdır**, **Muş** ovaları.$a$, $b$**Konya Ovası**.$b$), $a$- **Karadeniz kıyısı:** Dağlar kıyıya paralel, **düz ve girintisiz** kıyıdır.$a$, $b$- **Karadeniz kıyısı:** Dağlar kıyıya paralel (**boyuna kıyı tipi**), **düz ve girintisiz** kıyıdır.$b$), $a$kıyılar **girintili çıkıntılıdır** (ria).$a$, $b$kıyılar **girintili çıkıntılıdır** (**enine kıyı tipi**, güneybatıda rialı ve Dalmaçya tipleri).$b$), $a$| Graben ovası | Gediz, Büyük Menderes |$a$, $b$| Graben ovası | Gediz, Büyük Menderes, Muş, Iğdır |$b$), $a$| Tabanlı ova | Konya, Iğdır |$a$, $b$| Tabanlı ova | Konya |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Türkiye''nin Yer Şekilleri'
  and position($a$Doğuda yüksek (Kaçkar 3937 m)$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(l.body, $a$Gelişmiş ülkelerde **üçüncü sektörün payı** yüksektir. Gelişmekte olan ülkelerde birinci sektörün payı fazladır.$a$, $b$Gelişmiş ülkelerde **üçüncü sektörün payı** yüksektir. Gelişmekte olan ülkelerde birinci sektörün payı fazladır.

Hizmet sektörünün büyümesiyle üçüncül sektörden iki sektör daha ayrılmıştır. **Dördüncül sektör** bilgi ve veri işlemeyi (yazılım, bilişim, CBS, AR-GE danışmanlığı), **beşincil sektör** üst düzey karar vermeyi (yöneticiler, hükûmet liderleri, bilimsel araştırmaları yönlendirenler) kapsar. İstatistiklerde bu ikisi çoğunlukla üçüncül sektöre dâhil edilir. Türkiye’de çalışan nüfusun dağılımı 1990’da %46,8 birincil, %20,3 ikincil, %32,9 üçüncül iken 2025’te %14,6 birincil, %27,6 ikincil, %57,8 üçüncüldür.$b$), $a$**GAP (Güneydoğu Anadolu Projesi):**$a$, $b$Türkiye fındık, kuru incir, kuru kayısı, kiraz ve ayva üretiminde dünya birincisidir. Tarım arazileri 2000’de 26,6 milyon hektarken 2024’te 24 milyon hektara düşmüştür. Buğday, mısır, pirinç ve ayçiçeğinde ihtiyacın bir kısmı ithalatla karşılanır. **Sürdürülebilir tarım** organik tarım, iyi tarım uygulamaları, hidroponik (topraksız tarım), dikey tarım ve tarım 4.0 (uydu, drone, yapay zekâ) uygulamalarını kapsar.

**GAP (Güneydoğu Anadolu Projesi):**$b$), $a$Türkiye dünya bor rezervinde ilk sıralardadır.$a$, $b$Türkiye dünya bor rezervlerinin yaklaşık %74’üne sahiptir ve rezervde ilk sıradadır (üretimde payı yaklaşık %40).$b$), $a$- **Krom** (Elazığ, Muğla), **bakır** (Artvin, Elazığ), **demir** (Sivas Divriği, Malatya Hekimhan), **boksit**, **mermer** (Afyon, Muğla).$a$, $b$- **Krom** (Elazığ, Muğla), **bakır** (Artvin, Elazığ), **demir** (Sivas Divriği, Malatya Hekimhan), **boksit** (Konya-Seydişehir, Antalya-Akseki, Muğla-Milas), **çinko** (Rize-Çayeli, Adana-Horzum), **manganez** (Denizli, Burdur, Adıyaman, Sivas), **kobalt** (Manisa-Gördes), **mermer** (Afyon, Muğla).
- **Stratejik-kritik madenler** sanayi ve teknoloji için vazgeçilmezdir. Dünya rezervinin %50’si kobalt için Kongo Demokratik Cumhuriyeti’nde, %42’si nikel için Endonezya’da, %28’i demir için Avustralya’dadır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ekonomik Faaliyetler'
  and position($a$Gelişmiş ülkelerde **üçüncü sektörün payı** yüksektir. Gelişmekte olan ülkelerde birinci sektörün payı fazladır.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$Türkiye’nin **yedi coğrafi bölgesi**, **1941’deki Birinci Coğrafya Kongresi’nde** belirlenmiştir.$a$, $b$Bölgeler **şekilsel** ve **işlevsel** olmak üzere ikiye ayrılır. **Şekilsel bölge** belirlenen ölçüte göre türdeştir ve belirli bir merkezi yoktur. Ölçüt doğal olabilir (Akdeniz iklim bölgesi, Orta Toroslar) ya da beşerî olabilir (pamuk üretim bölgesi, seyrek nüfuslu bölgeler). **İşlevsel bölge** bir merkez ile ona bağlı çevreden oluşur, etkileşim merkezden uzaklaştıkça azalır (liman ya da metropol etki alanı). Bölge sınırı kullanılan ölçüte göre belirlenir, bazı sınırlar net, bazıları geçişlidir.

Türkiye’nin **yedi coğrafi bölgesi**, **1941’deki Birinci Coğrafya Kongresi’nde** belirlenmiştir.$b$), $a$Amaç: bölgeler arası dengesizliği azaltmak, sulama, enerji, sanayi ve istihdamı geliştirmek.$a$, $b$Amaç: bölgeler arası dengesizliği azaltmak, sulama, enerji, sanayi ve istihdamı geliştirmek. GAP kapsamında 22 baraj ve 19 hidroelektrik santrali yapılarak 1,8 milyon hektar alanın sulanması planlanmıştır. KOP sulama temelli bir projedir ve bölgede aşırı yer altı suyu kullanımını önlemeyi hedefler.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Bölgeler'
  and position($a$Türkiye’nin **yedi coğrafi bölgesi**, **1941’deki Birinci Coğrafya Kongresi’nde** belirlenmiştir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$**Boğaz köprüleri** (1973’te açılan ilk Boğaz köprüsü, Fatih Sultan Mehmet Köprüsü, Yavuz Sultan Selim Köprüsü), **Osmangazi Köprüsü** (İzmit Körfezi), **1915 Çanakkale Köprüsü**.$a$, $b$**Boğaz köprüleri** (15 Temmuz Şehitler Köprüsü 1973, Fatih Sultan Mehmet Köprüsü 1988, Yavuz Sultan Selim Köprüsü 2016), **Osmangazi Köprüsü** (İzmit Körfezi, 2016), **1915 Çanakkale Köprüsü** (2022).$b$), $a$**Mavi Akım** ve **TürkAkım** (Rusya doğal gazı), **TANAP** (Azerbaycan gazı)$a$, $b$**Mavi Akım** (2003) ve **TürkAkım** (2020) (Rusya doğal gazı), **TANAP** (2018, Azerbaycan gazı)$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Ulaşım Hatları'
  and position($a$**Boğaz köprüleri** (1973’te açılan ilk Boğaz köprüsü, Fatih Sultan Mehmet Köprüsü, Yavuz Sultan Selim Köprüsü), **Osmangazi Köprüsü** (İzmit Körfezi), **1915 Çanakkale Köprüsü**.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(l.body, $a$- **Kaynakları verimli kullanma:** Enerji ve su tasarrufu, geri dönüşüm.$a$, $b$- **Gezegen sınırları:** İnsanlığın güvenle yaşayabilmesi için aşılmaması gereken dokuz çevresel sınırdır: iklim değişikliği, ozon incelmesi, atmosferik aerosol yükü, okyanusların asitlenmesi, biyojeokimyasal döngüler (azot ve fosfor), tatlı sulardaki değişim, arazi kullanımındaki değişim, biyosfer bütünlüğü ve kimyasal kirlilik. İnsan etkisinin belirginleştiği yeni jeolojik döneme **Antroposen** denir.
- **Dünya Limit Aşım Günü:** Yıllık kaynak tüketiminin Dünya’nın o yılki biyolojik kapasitesini aştığı gündür.
- **Kaynakları verimli kullanma:** Enerji ve su tasarrufu, geri dönüşüm.$b$), $a$Buzullar erir, deniz seviyesi yükselir, kuraklık ve aşırı hava olayları artar.$a$, $b$Buzullar erir, deniz seviyesi yükselir, kuraklık ve aşırı hava olayları artar. Küresel ortalama sıcaklık Sanayi Devrimi öncesine göre yaklaşık 1,5°C artmıştır.$b$), $a$- **Uluslararası anlaşmalar:** **Kyoto Protokolü** ve **Paris Anlaşması** (sera gazı azaltma), **Montreal Protokolü** (ozon tabakası).$a$, $b$- **Uluslararası anlaşmalar:** 1992 Rio Zirvesi’nde BM İklim Değişikliği Çerçeve Sözleşmesi kabul edilmiştir. **Kyoto Protokolü** (1997) sera gazı azaltımına bağlayıcılık kazandırmış ve 2020’de sonlanmıştır. **Paris İklim Anlaşması** 2015’te imzalanmış, 2016’da yürürlüğe girmiştir ve sıcaklık artışını mümkünse 1,5°C’de tutmayı hedefler. Türkiye anlaşmayı 2016’da imzalamış, 2021’de onaylamış, 2053 için net sıfır emisyon hedefi açıklamıştır. **Montreal Protokolü** ozon tabakasını korur.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Çevre ve Toplum'
  and position($a$- **Kaynakları verimli kullanma:** Enerji ve su tasarrufu, geri dönüşüm.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(replace(l.body, $a$- **Tehlike:** Zarar verme potansiyeli olan olay.$a$, $b$- **Tehlike:** Zarar verme potansiyeli olan olay. İnsanların ve yapıların tehlikeye açık olma durumuna **maruziyet** denir.$b$), $a$İnsansız bir çölde olan deprem afet değildir.$a$, $b$İnsansız bir çölde olan deprem afet değildir. Afet olağan hayat düzenini bozar, insanların uyum kapasitesini aşar ve dış yardıma gereksinim doğurur.$b$), $a$| **Jeolojik (yerle ilgili)** | Deprem, volkan, heyelan, çığ, tsunami |
| **Meteorolojik ve hidrolojik (hava ve su ile ilgili)** | Sel ve taşkın, kuraklık, fırtına, hortum, dolu, don, aşırı sıcak |
| **Biyolojik ve diğer** | Orman yangını, salgın hastalık, çekirge istilası |
| **İnsan kaynaklı** | Sanayi kazaları, kirlilik, bina çökmesi |$a$, $b$| **Jeolojik (doğa kaynaklı)** | Deprem, volkanik faaliyet, tsunami, heyelan, çığ, kaya düşmesi |
| **Klimatik-hidrolojik (doğa kaynaklı)** | Sel ve taşkın, kuraklık, fırtına, hortum, kasırga, dolu, buzlanma, sıcak ve soğuk hava dalgası |
| **Biyolojik (doğa kaynaklı)** | Erozyon, salgın hastalık, böcek istilası |
| **Sosyal (insan kaynaklı)** | Savaş, terör saldırısı, göç |
| **Teknolojik (insan kaynaklı)** | Maden, nükleer santral, sanayi ve ulaşım kazaları |

Orman yangını yıldırım ya da aşırı sıcak gibi doğa kaynaklı nedenlerle çıkabileceği gibi insan kaynaklı da olabilir.$b$), $a$**1999 İzmit** ve **6 Şubat 2023 Kahramanmaraş** depremleri.$a$, $b$**17 Ağustos 1999** Gölcük (Kocaeli) merkezli depremin (Mw 7,4) can kaybı 17 480’dir. **6 Şubat 2023**’te saat 04.17’de Pazarcık (Mw 7,7) ve 13.24’te Elbistan (Mw 7,6) merkezli iki deprem olmuş, 53 bini aşkın kişi hayatını kaybetmiştir. Daha önce 1939 Erzincan (Mw 7,9) ve 2011 Van depremleri yaşanmıştır. Türkiye nüfusunun yaklaşık %75’i deprem riskinin yüksek olduğu alanlarda yaşar.$b$), $a$Afet yönetimi **dört evreden** oluşur:$a$, $b$**Bütüncül afet yönetimi** afet öncesini, sırasını ve sonrasını birlikte ele alır ve **dört evreden** oluşur:$b$), $a$- Eğitim ve bilinç, afet çantası, aile planı.$a$, $b$- Eğitim ve bilinç, afet çantası, aile planı. 12 Kasım **Afet Eğitimi Hazırlık Günü**’dür.
- **Erken uyarı sistemleri**, CBS ve uzaktan algılama (uydu ve hava fotoğrafları) risk analizinde ve kurtarma çalışmalarında kullanılır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-cog' and t.name = 'Doğal Afetler'
  and position($a$- **Tehlike:** Zarar verme potansiyeli olan olay.$a$ in l.body) > 0;
