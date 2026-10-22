-- TYT Fizik: MEB ders kitabıyla uyum (alt dallar, bilimsel yöntem, iç enerji, SI ısı değerleri, ısı iletim hızı, Bernoulli, vektörler, sürtünme, düşey atış, temel kuvvetler, Snell yasası, üreteçler, topraklama, enerji kaynakları, rezonans)

update public.lessons l
set body = replace(replace(l.body, $a$| Mekanik | Hareket, kuvvet, enerji, basınç |
| Elektrik ve manyetizma | Yük, akım, devreler, mıknatıslar |
| Optik | Işık, yansıma, kırılma, mercekler |
| Termodinamik | Isı, sıcaklık, hal değişimi |
| Dalgalar | Su, ses, ışık dalgaları |
| Atom ve nükleer fizik | Atomun yapısı, radyoaktivite |
| Katıhal fiziği | Katı maddelerin yapısı ve özellikleri |$a$, $b$| Mekanik | Kuvvet, hareket, denge ve enerji |
| Elektromanyetizma | Elektrik yükleri, elektrik akımı, mıknatıslar ve manyetik alan |
| Termodinamik | Isı, sıcaklık, genleşme, hâl değişimi, ısıl denge, ısı aktarım yolları |
| Optik | Işığın yapısı, yansıma ve kırılma gibi ışık olayları |
| Katı hâl fiziği | Kristal yapılı maddeler, yarı iletkenler, esneklik ve iletkenlik |
| Atom fiziği | Atomun yapısı, elektron dizilimi ve enerji seviyeleri |
| Nükleer fizik | Atom çekirdeği ve çekirdekte meydana gelen tepkimeler |
| Yüksek enerji ve plazma fiziği | Yüksek enerjili parçacıklar ve maddenin plazma hâli |$b$), $a$Hipotez deneyle desteklenirse **kuram (teori)** ve çok sayıda deneyle doğrulanırsa **yasa** olur.$a$, $b$Hipotez deneyle sınanır. Deney hipotezi desteklemiyorsa hipotez değiştirilir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Fizik Bilimine Giriş'
  and position($a$| Mekanik | Hareket, kuvvet, enerji, basınç |
| Elektrik ve manyetizma | Yük, akım, devreler, mıknatıslar |
| Optik | Işık, yansıma, kırılma, mercekler |
| Termodinamik | Isı, sıcaklık, hal değişimi |
| Dalgalar | Su, ses, ışık dalgaları |
| Atom ve nükleer fizik | Atomun yapısı, radyoaktivite |
| Katıhal fiziği | Katı maddelerin yapısı ve özellikleri |$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(l.body, $a$**Isı akışı** her zaman sıcak cisimden$a$, $b$**İç enerji:** Maddeyi oluşturan tüm taneciklerin kinetik ve potansiyel enerjilerinin toplamıdır. Madde miktarına ve sıcaklığa bağlıdır. Aynı sıcaklıktaki bir kova suyun iç enerjisi, bir bardak suyun iç enerjisinden büyüktür.

**Isı akışı** her zaman sıcak cisimden$b$), $a$**Örnek.** 200 g suyun sıcaklığı 20 °C’den 50 °C’ye çıkıyor. $Q = 200 \cdot 1 \cdot 30 = 6000\ \text{cal}$.$a$, $b$**Örnek.** 200 g suyun sıcaklığı 20 °C’den 50 °C’ye çıkıyor. $Q = 200 \cdot 1 \cdot 30 = 6000\ \text{cal}$.

**SI birimleriyle.** Ders kitaplarında öz ısı J/kg·°C ile de verilir. Suyun öz ısısı yaklaşık $4186\ \text{J/kg°C}$, buzun öz ısısı $2100\ \text{J/kg°C}$’tır. Aynı örnek için $Q = 0{,}2 \cdot 4186 \cdot 30 \approx 25116\ \text{J}$ bulunur. Bu, yaklaşık 6000 cal eder.$b$), $a$**Örnek.** 50 g buzun 0 °C’de erimesi$a$, $b$Ders kitaplarında hâl değişim ısısı kJ/kg ile verilir. Buzun erime ısısı $334\ \text{kJ/kg}$ (yaklaşık 80 cal/g), suyun buharlaşma ısısı $2260\ \text{kJ/kg}$’dır (yaklaşık 540 cal/g). Saf maddelerde erime ısısı donma ısısına, buharlaşma ısısı yoğuşma ısısına eşittir.

**Örnek.** 50 g buzun 0 °C’de erimesi$b$), $a$Koyu renkli yüzeyler ışımayı daha iyi soğurur.$a$, $b$Koyu renkli yüzeyler ışımayı daha iyi soğurur.

**Isı iletim hızı.** Birim zamanda iletilen ısıdır ve birimi joule/saniyedir (watt). Ortamları ayıran maddenin yüzey alanı ve ortamlar arasındaki sıcaklık farkı ile doğru, maddenin kalınlığı ile ters orantılıdır. Maddenin cinsine de bağlıdır. Metallerin ısıl iletkenliği büyüktür, yalıtkanların küçüktür. Bu yüzden binalarda ısı yalıtımı için kalın ve yalıtkan malzemeler kullanılır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Isı ve Sıcaklık'
  and position($a$**Isı akışı** her zaman sıcak cisimden$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$Deniz seviyesinde **yaklaşık $10^5\ \text{Pa}$** (76 cmHg) olup yükseldikçe azalır.$a$, $b$Deniz seviyesinde $1\ \text{atm} = 76\ \text{cmHg} \approx 1{,}013 \cdot 10^5\ \text{Pa}$ olup yükseldikçe azalır.$b$), $a$## 7. Konuyu toparla$a$, $b$## 7. Bernoulli ilkesi

Hareket hâlindeki akışkanlarda (sıvı ve gaz) **sürat arttıkça basınç azalır**, sürat azaldıkça basınç artar. Bu ilişkiyi ilk kez Daniel Bernoulli ortaya koymuştur. Borudan akan akışkanın debisi sabit olduğundan boru daraldığında akışkan hızlanır ve daralan yerde basınç daha küçük olur.

- Birbirine yakın tutulan iki kâğıdın arasına üflenince kâğıtlar birbirine yaklaşır. Aradaki hava hızlı aktığı için basınç düşer, dıştaki daha büyük basınç kâğıtları iter.
- Fırtınada bazı çatılar uçar. Çatının üstünden hızlı geçen havanın basıncı küçüktür, evin içindeki basınç ise büyüktür.
- Hızla birbirinin yanından geçen araçlar arasındaki basınç düşer ve araçlar birbirine doğru çekilir.

Uçakların havalanmasını yalnızca Bernoulli ilkesi açıklamaz, kanadın hava akımını aşağı doğru yönlendirmesi de etkilidir.

## 8. Konuyu toparla$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Basınç ve Kaldırma Kuvveti'
  and position($a$Deniz seviyesinde **yaklaşık $10^5\ \text{Pa}$** (76 cmHg) olup yükseldikçe azalır.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(l.body, $a$($\mu$: sürtünme katsayısı, $N$: yüzeyin tepki kuvveti). Yatay zeminde $N = mg$.$a$, $b$($\mu$: sürtünme katsayısı, $N$: yüzeyin tepki kuvveti). Yatay zeminde $N = mg$.

**Statik ve kinetik sürtünme.** Kuvvet uygulanmasına rağmen cisim hareket etmiyorsa yüzeyler arasında **statik sürtünme** vardır. Büyüklüğü uygulanan kuvvete eşittir ve $f_s \le \mu_s N$ koşulunu sağlar. Kuvvet bu sınırı aşınca cisim kaymaya başlar. Hareket başlayınca **kinetik sürtünme** etki eder: $f_k = \mu_k N$. Sürtünme katsayısı yüzeylerin cinsine bağlıdır, temas alanına ve hıza hemen hemen bağlı değildir. Aşağıdaki örnekte $\mu$, kinetik sürtünme katsayısıdır.$b$), $a$Tüy ve taş vakumda aynı anda yere ulaşır.$a$, $b$Tüy ve taş vakumda aynı anda yere ulaşır.

**Düşey atış.** Cisim yukarı doğru $v_0$ hızıyla atılırsa yerçekimi onu yavaşlatır: $v = v_0 - g t$. En yüksek noktada hız sıfırdır ama ivme yine $g$'dir. Çıkış süresi $\dfrac{v_0}{g}$, çıkılan yükseklik $\dfrac{v_0^2}{2g}$'dir. Aynı seviyeye dönüş süresi çıkış süresinin iki katıdır ve dönüş hızı atış hızına eşittir. **Örnek.** $v_0 = 20\ \text{m/s}$ ile atılan cisim $\dfrac{20}{10} = 2\ \text{s}$ sonra tepeye ulaşır, $\dfrac{400}{20} = 20\ \text{m}$ yükselir.$b$), $a$## 7. Konuyu toparla$a$, $b$## 7. Doğadaki temel kuvvetler

Doğadaki bütün etkileşimler dört temel kuvvetle açıklanır:

| Kuvvet | Nerede etkilidir |
| --- | --- |
| Kütle çekim | Bütün kütleli cisimler arasında, etki mesafesi sonsuz kabul edilir |
| Elektromanyetik | Elektrik yükleri ve mıknatıslar arasında itme ya da çekme, etki mesafesi sonsuz kabul edilir |
| Güçlü nükleer | Atom çekirdeğindeki proton ve nötronları bir arada tutar, etkisi çekirdek boyutundadır |
| Zayıf nükleer | Çekirdeğin parçalanmasında ve Güneş’teki çekirdek tepkimelerinde etkilidir, etki alanı güçlü nükleer kuvvetten kısadır |

Sürtünme, kaldırma ve tepki gibi günlük kuvvetler, bu temel kuvvetlerin makro düzeydeki sonuçlarıdır.

## 8. Konuyu toparla$b$), $a$Yer değiştirme her zaman yola eşit ya da küçüktür. Cisim bir yönde doğru giderse ikisi eşit olur.$a$, $b$Yer değiştirme her zaman yola eşit ya da küçüktür. Cisim bir yönde doğru giderse ikisi eşit olur.

**Vektörlerin toplanması.** Vektörel büyüklükler toplanırken yönleri de hesaba katılır. Aynı doğrultudaki vektörler aynı yönlüyse büyüklükler toplanır, zıt yönlüyse çıkarılır. İki vektör birbirine dik ise bileşke Pisagor bağıntısıyla bulunur. Genel durumda vektörler kuyruk kuyruğa getirilip paralelkenar çizilirse köşegen bileşkeyi verir: $R^2 = A^2 + B^2 + 2AB\cos\theta$ ($\theta$: vektörler arasındaki açı). Uç uca ekleme yönteminde ikinci vektörün başlangıcı birincinin ucuna getirilir, bileşke birincinin başlangıcından ikincinin ucuna çizilir. Bileşkenin büyüklüğü her zaman $|A - B| \le R \le A + B$ aralığındadır.

**Örnek.** Birbirine dik 3 N ve 4 N’luk kuvvetlerin bileşkesi $\sqrt{9 + 16} = 5\ \text{N}$’dur. Aralarında $120°$ açı bulunan 5 N ve 5 N’luk kuvvetler için $R^2 = 25 + 25 + 2 \cdot 25 \cdot \cos 120° = 25$ olduğundan $R = 5\ \text{N}$ bulunur.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Hareket ve Kuvvet'
  and position($a$($\mu$: sürtünme katsayısı, $N$: yüzeyin tepki kuvveti). Yatay zeminde $N = mg$.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$- **Frekans değişmez**. Dalga boyu ve hız değişir.
- Normal boyunca (dik) gelen ışın **sapmaz**.$a$, $b$- **Frekans değişmez**. Dalga boyu ve hız değişir.
- Normal boyunca (dik) gelen ışın **sapmaz**.

**Snell yasası.** Geliş ve kırılma açıları normalle yapılan açılar olmak üzere $n_1 \sin\theta_1 = n_2 \sin\theta_2$ yazılır.

**Tam yansıma.** Işık yoğun ortamdan seyrek ortama geçerken geliş açısı **sınır açıdan** büyükse ışık kırılmaz, tamamen yansır. Sınır açıda kırılma açısı $90°$’dir: $\sin\theta_s = \dfrac{n_2}{n_1}$. Optik fiberler tam yansımadan yararlanır. **Örnek.** Camdan ($n = 1{,}5$) havaya ($n = 1$) geçen ışık için $\sin\theta_s = \dfrac{1}{1{,}5} = \dfrac{2}{3}$ olur, sınır açı yaklaşık $42°$’dir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Optik'
  and position($a$- **Frekans değişmez**. Dalga boyu ve hız değişir.
- Normal boyunca (dik) gelen ışın **sapmaz**.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$Birimi **joule (J)** olup $1\ \text{J} = 1\ \text{N} \cdot 1\ \text{m}$’dir.$a$, $b$Birimi **joule (J)** olup $1\ \text{J} = 1\ \text{N} \cdot 1\ \text{m}$’dir.

Kuvvet yer değiştirme ile $\alpha$ açısı yapıyorsa yalnızca yer değiştirme yönündeki bileşen iş yapar: $W = F \cdot x \cdot \cos\alpha$. $\alpha = 90°$ iken iş sıfırdır.$b$), $a$## 7. Konuyu toparla$a$, $b$## 7. Enerji kaynakları

Enerji kaynakları yenilenemeyen ve yenilenebilen olarak ikiye ayrılır.

| Tür | Örnekler | Özellik |
| --- | --- | --- |
| Yenilenemeyen | Kömür, petrol, doğal gaz, uranyum | Kısa sürede yeniden oluşmaz ve tükenir. Fosil yakıtlar yanınca karbondioksit gibi sera gazları çıkarır |
| Yenilenebilen | Güneş, rüzgâr, akarsu, jeotermal, biyokütle | Doğada sürekli yenilenir. Güneş ve rüzgâr gibi kaynakların üretimi hava koşullarına bağlıdır |

## 8. Konuyu toparla$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'İş, Güç ve Enerji'
  and position($a$Birimi **joule (J)** olup $1\ \text{J} = 1\ \text{N} \cdot 1\ \text{m}$’dir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$Eşit $n$ direnç paralelse $R = \dfrac{R_1}{n}$.$a$, $b$Eşit $n$ direnç paralelse $R = \dfrac{R_1}{n}$.

**Üreteçlerin bağlanması.** Özdeş üreteçler (piller) seri bağlanırsa potansiyel farklar toplanır, $n$ özdeş pil $n V$ potansiyel fark sağlar. Paralel bağlanırsa devreye sağlanan potansiyel fark tek bir üretecinkine eşit kalır, ancak her üreteçten daha az akım geçer. Bu yüzden üreteçler daha geç tükenir ve biri bozulsa diğerleri çalışmaya devam eder.

**Elektrik güvenliği ve topraklama.** Vücuttan geçen akım zararlıdır. Islak elle prize dokunmamak, hasarlı kabloları kullanmamak ve sigorta kullanmak önlemlerdendir. Metal gövdeli cihazların gövdesi **topraklanır**: Gövdeye kaçak akım geçerse akım düşük dirençli topraklama hattından yere iletilir ve kişi çarpılmaz.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Elektrik ve Manyetizma'
  and position($a$Eşit $n$ direnç paralelse $R = \dfrac{R_1}{n}$.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 8. Konuyu toparla$a$, $b$## 8. Periyodik hareket ve rezonans

Belirli zaman aralıklarında kendini tekrar eden harekete **periyodik hareket** denir. Sarkaçlı saat, yaya bağlı kütle ve dalga geçerken titreşen su parçacığı örnektir. Bir tekrarın süresi **periyot** ($T$), birim zamandaki tekrar sayısı **frekans** ($f$) olup $f = \dfrac{1}{T}$’dir.

**Rezonans.** Her cismin kendine özgü bir **doğal frekansı** vardır. Dışarıdan uygulanan periyodik etkinin frekansı cismin doğal frekansına eşit olursa titreşimin genliği hızla büyür. Buna rezonans denir. Salıncağı doğru anlarda itmek bunun örneğidir.

**Deprem.** Depremin yer kabuğunda başladığı yere **odak noktası**, onun yeryüzündeki dik izdüşümüne **merkez üssü** denir. Zeminin titreşim frekansı bir yapının doğal frekansına yakınsa rezonans nedeniyle yapı büyük genlikle sallanır ve hasar artar.

## 9. Konuyu toparla$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Dalgalar'
  and position($a$## 8. Konuyu toparla$a$ in l.body) > 0;
