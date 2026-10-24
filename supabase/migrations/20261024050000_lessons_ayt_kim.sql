-- 20261024050000_lessons_ayt_kim. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden sodyum bir mutfak tuzu için klor ile birleşirken helyum hiçbir şeyle birleşmez? Neden periyodik tablo bu kadar düzenli bir tabloya benzer ve neden benzer elementler alt alta gelir? Cevap, atomun içindeki **elektronların nasıl dizildiğidir.** 20. yüzyılın başında Bohr, elektronların belirli enerji düzeylerinde bulunduğunu söylemişti. Daha sonra kuantum mekaniği, elektronların yörüngelerde değil **orbitallerde**, yani bulunma olasılığı yüksek bölgelerde olduğunu gösterdi. Bu konuda **kuantum sayılarını**, **orbital türlerini**, **elektron dizilim kurallarını** (Aufbau, Pauli, Hund) ve **periyodik özelliklerin** (atom yarıçapı, iyonlaşma enerjisi, elektronegatiflik) nasıl değiştiğini öğreneceksin. TYT'de atomun yapısını ve periyodik tabloyu öğrenmiştin. Burada bu bilgi daha derin bir temele oturuyor.

:::hedefler
1. Bohr modelinin yetersizliğini ve kuantum modelinin temel fikrini açıklamak.
2. Dört kuantum sayısını ($n$, $\ell$, $m_\ell$, $m_s$) ve anlamlarını bilmek.
3. Orbital türlerini ($s$, $p$, $d$, $f$) ve en çok elektron sayılarını belirtmek.
4. Elektron dizilimini kurallara uygun yazmak.
5. Değerlik elektron sayısından grup ve periyodu bulmak.
6. Periyodik özelliklerin (atom yarıçapı, iyonlaşma enerjisi, elektronegatiflik) değişimini yorumlamak.
:::

:::ipucu
Elektron dizilimi sorularında üç kuralı sırayla uygula: **Aufbau** (enerjisi düşük orbitalden başla), **Pauli** (bir orbitalde en fazla 2 elektron, zıt spinli), **Hund** (aynı enerjili orbitallere önce teker teker, sonra çiftleyerek). Periyot, **en dış elektron kabuğu numarası**, A grubunda grup numarası **değerlik elektron sayısıdır**.
:::

::video{id="UFSUD8zm_P4" etiket="Konu anlatımı videosu" baslik="Atomun Kuantum Modeli" kanal="Benim Hocam"}

## 1. Atom modellerinin gelişimi

| Model | Fikir |
| --- | --- |
| Dalton | Atom bölünemez küredir |
| Thomson | Pozitif yük içinde elektronlar (üzümlü kek) |
| Rutherford | Küçük ve yoğun çekirdek, çevresinde elektronlar |
| Bohr | Elektronlar belirli enerji düzeylerinde, hidrojen için başarılı |
| Kuantum (modern) | Elektronlar orbitallerde, yeri ve hızı aynı anda kesin bilinemez |

Bohr modeli hidrojen spektrumunu açıkladı ama çok elektronlu atomları açıklayamadı. Modern modelde **orbital**, elektronun bulunma olasılığının yüksek olduğu bölgedir. Elektronun yörüngesi yoktur, bulunma olasılığı vardır (Heisenberg belirsizlik ilkesi).

## 2. Kuantum sayıları

Bir elektronun durumu dört sayıyla belirlenir:

| Sayı | Adı | Aldığı değerler | Anlamı |
| --- | --- | --- | --- |
| $n$ | Baş kuantum sayısı | $1,2,3,\dots$ | Enerji düzeyi (kabuk), orbitalin büyüklüğü |
| $\ell$ | Açısal momentum | $0,1,\dots,n-1$ | Alt kabuk ve orbital şekli ($0=s$, $1=p$, $2=d$, $3=f$) |
| $m_\ell$ | Manyetik | $-\ell,\dots,0,\dots,+\ell$ | Orbitalin uzaydaki yönü |
| $m_s$ | Spin | $+\tfrac12$ ya da $-\tfrac12$ | Elektronun dönüş yönü |

**Sayılar:**

- Bir alt kabuktaki orbital sayısı $2\ell+1$: $s$ için 1, $p$ için 3, $d$ için 5, $f$ için 7.
- Bir $n$ düzeyindeki orbital sayısı $n^2$, en çok elektron sayısı $2n^2$.
- $n=3$ düzeyinde $9$ orbital ve en fazla $18$ elektron vardır. $n=2$ için $4$ orbital ve $8$ elektron.

**Pauli dışarlama ilkesi:** Bir atomda hiçbir iki elektronun dört kuantum sayısı da aynı olamaz. Bir orbitaldeki iki elektron zıt spinlidir.

## 3. Elektron dizilimi

**Aufbau (yapılandırma) ilkesi:** Elektronlar en düşük enerjili orbitalden başlayarak yerleşir. Enerji sırası:

$$1s<2s<2p<3s<3p<4s<3d<4p<5s<4d<5p<6s<\dots$$

**Hund kuralı:** Aynı alt kabuktaki orbitallere önce **birer elektron paralel spinle** yerleşir, sonra eşleşme başlar.

::sim{tur="atom"}

**Örnekler:**

- ${}_{8}\text{O}$: $1s^22s^22p^4$
- ${}_{17}\text{Cl}$: $1s^22s^22p^63s^23p^5$
- ${}_{26}\text{Fe}$: $1s^22s^22p^63s^23p^64s^23d^6$ (kısa: $[\text{Ar}]4s^23d^6$)

**Kararlı istisnalar:** Yarı dolu ve tam dolu $d$ alt kabuğu kararlıdır. ${}_{24}\text{Cr}$: $[\text{Ar}]4s^13d^5$ ve ${}_{29}\text{Cu}$: $[\text{Ar}]4s^13d^{10}$.

**İyonlar:** Katyon yapılırken elektron **en dıştaki kabuktan** ($n$ en büyük) çıkar. ${}_{26}\text{Fe}^{2+}$: $[\text{Ar}]3d^6$ ($4s$ elektronları önce çıkar).

**Değerlik elektronları ve periyodik tablo:**

- **Periyot numarası** en dış kabuğun $n$ değerine eşittir.
- A grubu elementlerinde **değerlik elektron sayısı grup numarasıdır** (1A için 1, 7A için 7, 8A için 8).
- Örnek: $1s^22s^22p^63s^23p^4$ dizilimli element $3$. periyot, $6$ değerlik elektronu, $6$A grubu (kükürt).

## 4. Periyodik özellikler

**Atom yarıçapı:** Aynı grupta yukarıdan aşağı **artar** (kabuk sayısı artar). Aynı periyotta soldan sağa **azalır** (çekirdek yükü artar, kabuk sayısı sabit).

**İyonlaşma enerjisi (İE):** Gaz hâlindeki atomdan bir elektron koparmak için gereken enerji. Gruplarda yukarıdan aşağı azalır, periyotta soldan sağa genel olarak artar. **Anormallikler:**

- $\text{Be}>\text{B}$: Be'un dolu $2s$ alt kabuğu kararlıdır.
- $\text{N}>\text{O}$: N'un yarı dolu $2p$ alt kabuğu kararlıdır.
- Aynı atomun ardışık iyonlaşma enerjileri artar: $E_1<E_2<E_3$. Değerlik elektronları bittikten sonra iç kabuktan elektron koparılacağı için **büyük sıçrama** olur. Büyük sıçramanın yeri, değerlik elektron sayısını verir.

**Elektronegatiflik:** Bağ elektronlarını çekme eğilimi. Periyotta soldan sağa artar, grupta yukarıdan aşağı azalır. En elektronegatif element flordur. Soy gazlar için genellikle tanımlanmaz.

**Metalik ve ametalik özellik:** Soldan sağa metalik özellik azalır, yukarıdan aşağı artar.

**Örnek:** $\text{Na}$, $\text{Mg}$, $\text{Al}$ ve $\text{Si}$ aynı periyottadır. Atom yarıçapı $\text{Na}>\text{Mg}>\text{Al}>\text{Si}$ sıralanır.

## 5. Sık yapılan hatalar

- Orbital sayısı ile elektron sayısını karıştırmak. $n=3$ için orbital $9$, elektron $18$'dir.
- $4s$ orbitalini $3d$'den **sonra** doldurmak. Önce $4s$ dolar, ama katyon yapılırken önce $4s$ elektronları çıkar.
- Be-B ve N-O iyonlaşma enerjisi anormalliğini unutmak.
- Katyonun yarıçapının atomunkinden büyük olduğunu sanmak. Katyon küçülür, anyon büyür.

:::baglanti
Elektron dizilimi, **kimyasal bağların** nasıl oluştuğunu açıklar. **Gazlar**, **çözeltiler** ve **asit-baz** konularında maddelerin davranışı, atomların değerlik elektronlarına bağlıdır. **Fizikte atom modeli** ve enerji düzeyleri, burada kimyanın diliyle yeniden anlatılır. **Organik kimyada** karbonun dört bağ yapma özelliği, $2s^22p^2$ dizilimi ve hibritleşme ile açıklanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kuantum sayıları | $n$, $\ell$, $m_\ell$, $m_s$ |
| Orbital sayısı | $s{:}1$, $p{:}3$, $d{:}5$, $f{:}7$ |
| $n$ düzeyinde | $n^2$ orbital, $2n^2$ elektron |
| Aufbau | Düşük enerjiden başla |
| Pauli | Orbitalde en çok 2 elektron |
| Hund | Önce teker teker |
| Yarıçap | Periyotta azalır, grupta artar |
| İE anormallikleri | Be>B, N>O |

## Mini test

:::soru{cevap="A"}
$n=3$ enerji düzeyinde toplam kaç orbital bulunur?

- A) 9
- B) 18
- C) 27
- D) 32
- E) 54

---

1. $n$ düzeyindeki orbital sayısı $n^2$'dir.
2. $n=3$ için $3^2=9$ orbital vardır ($3s$: 1, $3p$: 3, $3d$: 5). Doğru cevap A.

Diğer şıklar: **18** en çok elektron sayısı ($2n^2$) yazılmış / **27** $n^3$ alınmış / **32** $n=4$ düzeyindeki elektron sayısı yazılmış / **54** elektron sayısı üç ile çarpılmış.
:::

:::soru{cevap="E"}
Elektron dizilimi $1s^22s^22p^63s^23p^4$ olan nötr atomla ilgili aşağıdakilerden hangisi doğrudur?

- A) 2. periyot ve 4A grubundadır.
- B) 3. periyot ve 4A grubundadır.
- C) 2. periyot ve 6A grubundadır.
- D) 3. periyot ve 4 değerlik elektronu vardır.
- E) 3. periyot ve 6A grubundadır.

---

1. En dış kabuk $n=3$ olduğundan atom 3. periyottadır.
2. Değerlik elektronları $3s^23p^4$ olup toplam $6$'dır. A grubunda değerlik elektron sayısı grup numarasını verir: 6A. Doğru cevap E.

Diğer şıklar: **A** ve **C** yanlış periyot / **B** ve **D** son alt kabuktaki $4$ elektron değerlik elektron sayısı sanılmış, $3s^2$ unutulmuş.
:::

:::soru{cevap="B"}
Aşağıdaki element çiftlerinden hangisinde birinci iyonlaşma enerjisi büyük olan element doğru verilmiştir?

- A) $\text{Be}<\text{Li}$
- B) $\text{N}>\text{O}$
- C) $\text{B}>\text{Be}$
- D) $\text{Na}>\text{Mg}$
- E) $\text{F}>\text{Ne}$

---

1. $\text{N}$ ve $\text{O}$ aynı periyottadır. Genel eğilim soldan sağa artıştır ama $\text{N}$'un yarı dolu $2p^3$ dizilimi kararlı olduğundan $\text{N}$'un iyonlaşma enerjisi $\text{O}$'dan büyüktür.
2. Doğru cevap B.

Diğer şıklar: **A** $\text{Be}$ ile $\text{Li}$'yi karşılaştırmada $\text{Be}$ büyüktür, ifade ters / **C** $\text{Be}$'un dolu $2s$ alt kabuğu nedeniyle $\text{Be}>\text{B}$ olur / **D** $\text{Mg}>\text{Na}$ olur / **E** soy gaz $\text{Ne}$ florden büyük iyonlaşma enerjisine sahiptir.
:::

:::soru{cevap="B"}
$\text{Na}$, $\text{Mg}$, $\text{Al}$ ve $\text{Si}$ atomlarının yarıçap sıralaması aşağıdakilerden hangisidir?

- A) $\text{Si}>\text{Al}>\text{Mg}>\text{Na}$
- B) $\text{Na}>\text{Mg}>\text{Al}>\text{Si}$
- C) $\text{Mg}>\text{Na}>\text{Si}>\text{Al}$
- D) $\text{Na}>\text{Al}>\text{Mg}>\text{Si}$
- E) $\text{Al}>\text{Na}>\text{Si}>\text{Mg}$

---

1. Dört element de 3. periyottadır. Kabuk sayıları aynıdır.
2. Soldan sağa gidildikçe çekirdek yükü artar ve elektronları daha güçlü çeker. Atom yarıçapı azalır: $\text{Na}>\text{Mg}>\text{Al}>\text{Si}$. Doğru cevap B.

Diğer şıklar: **A** sıralama tersine yazılmış, yarıçap artıyor sanılmış / **C** ve **E** periyottaki sıra rastgele karıştırılmış / **D** $\text{Al}$ ile $\text{Mg}$'nin yeri değiştirilmiş.
:::

## Kendini dene

:::dene
1. $p$ alt kabuğunda kaç orbital vardır? => 3.
2. Bir orbitalde en fazla kaç elektron bulunur? => 2.
3. ${}_{11}\text{Na}$ elementinin elektron dizilimi nedir? => $1s^22s^22p^63s^1$.
4. Aynı periyotta soldan sağa atom yarıçapı nasıl değişir? => Azalır.
5. En elektronegatif element hangisidir? => Flor.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-kim' and name = 'Modern Atom Teorisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir lastiğin şişirilirken sertleşmesi, yazın güneşte bırakılan balonun patlaması, dalgıcın yükselirken kanındaki gazın açığa çıkma tehlikesi ve bir spreyin basılınca soğuması gazların davranışıyla ilgilidir. Gazların hacmi, basıncı, sıcaklığı ve madde miktarı birbirine bağlıdır. Bu bağlantıyı bir denklemle anlatabiliriz: **ideal gaz denklemi**. Bu konuda **gaz yasalarını** (Boyle, Charles, Gay-Lussac, Avogadro), **ideal gaz denklemini**, **gaz karışımlarını** (Dalton kısmi basınç), **Graham difüzyon yasasını** ve **gerçek gazların** ideallikten sapmasını öğreneceksin. Maddenin hâlleri ve mol bilgisi, burada hesaplara dönüşüyor.

:::hedefler
1. Gazların kinetik teorisini ve ideal gaz kavramını açıklamak.
2. Boyle, Charles, Gay-Lussac ve Avogadro yasalarını uygulamak.
3. İdeal gaz denklemi $PV=nRT$ ile hesap yapmak.
4. Gaz karışımlarında kısmi basınç ve mol kesrini kullanmak.
5. Graham yasasıyla difüzyon hızlarını karşılaştırmak.
6. Gerçek gazların hangi koşullarda idealden saptığını yorumlamak.
:::

:::ipucu
Gaz sorularında **sıcaklık her zaman kelvin** ($K=^\circ\text{C}+273$) olmalıdır. Derece Celsius ile işlem yapmak en sık hatadır. Birimlere dikkat et: $R=0{,}082\ \text{L}\cdot\text{atm}/(\text{mol}\cdot\text{K})$ kullanıyorsan $P$ atm, $V$ litre olmalıdır.
:::

::video{id="hr_HjFHtJZc" etiket="Konu anlatımı videosu" baslik="Gazların Özellikleri" kanal="Benim Hocam"}

## 1. Gazların kinetik teorisi

Gaz parçacıkları çok küçüktür, sürekli ve rastgele hareket eder. Parçacıklar arası çekim kuvveti ihmal edilir. Çarpışmalar esnektir. **Ortalama kinetik enerji mutlak sıcaklıkla doğru orantılıdır.**

**Basınç**, parçacıkların kabın çeperine çarpmasıyla oluşur. Birimler: $1\ \text{atm}=760\ \text{mmHg}=101{,}3\ \text{kPa}$.

**İdeal gaz:** Parçacıklar arası çekim yoktur ve parçacıkların hacmi ihmal edilir. Gerçek gazlar yüksek sıcaklık ve düşük basınçta idealliğe yaklaşır.

## 2. Gaz yasaları

| Yasa | Sabit | Bağıntı |
| --- | --- | --- |
| Boyle | $T$, $n$ | $P_1V_1=P_2V_2$ ($P$ ile $V$ ters orantılı) |
| Charles | $P$, $n$ | $\dfrac{V_1}{T_1}=\dfrac{V_2}{T_2}$ |
| Gay-Lussac | $V$, $n$ | $\dfrac{P_1}{T_1}=\dfrac{P_2}{T_2}$ |
| Avogadro | $P$, $T$ | $\dfrac{V_1}{n_1}=\dfrac{V_2}{n_2}$ |

::sim{tur="gaz"}

**Birleşik gaz yasası:** $\dfrac{P_1V_1}{T_1}=\dfrac{P_2V_2}{T_2}$ ($n$ sabit).

**Örnek (Charles):** $300\ \text{K}$'de $6\ \text{L}$ gaz sabit basınçta $450\ \text{K}$'e ısıtılırsa $V_2=6\cdot\dfrac{450}{300}=9\ \text{L}$ olur.

**Boyle'un sonucu:** Sabit sıcaklıkta basınç iki katına çıkarsa hacim yarıya iner ve **yoğunluk iki katına çıkar** (kütle sabit, hacim yarıya iner).

## 3. İdeal gaz denklemi

$$PV=nRT$$

$R=0{,}082\ \dfrac{\text{L}\cdot\text{atm}}{\text{mol}\cdot\text{K}}$. $n=\dfrac mM$ ($m$ kütle, $M$ mol kütlesi).

**Örnek:** $2\ \text{mol}$ gaz $27^\circ\text{C}$'de $8{,}2\ \text{L}$'lik kaptadır. $T=300\ \text{K}$ ve $P=\dfrac{nRT}{V}=\dfrac{2\cdot0{,}082\cdot300}{8{,}2}=6\ \text{atm}$.

**Normal koşullar (NK):** $0^\circ\text{C}$ ve $1\ \text{atm}$. $1\ \text{mol}$ ideal gaz $22{,}4\ \text{L}$ hacim kaplar.

**Yoğunluk:** $PM=dRT$ bağıntısından $d=\dfrac{PM}{RT}$ bulunur. Aynı koşullarda mol kütlesi büyük gazın yoğunluğu büyüktür.

## 4. Gaz karışımları

**Dalton kısmi basınçlar yasası:** Birbirleriyle tepkimeye girmeyen gazlar karışımında toplam basınç, kısmi basınçların toplamıdır:

$$P_{toplam}=P_1+P_2+\dots,\qquad P_i=X_i\,P_{toplam}$$

$X_i=\dfrac{n_i}{n_{toplam}}$ mol kesridir. Her gaz kabın tüm hacmini kapladığı gibi davranır.

**Örnek:** Kapta $2\ \text{mol}$ He ve $3\ \text{mol}$ Ne var, toplam basınç $10\ \text{atm}$. $X_{He}=\dfrac25$ ve $P_{He}=10\cdot\dfrac25=4\ \text{atm}$, $P_{Ne}=6\ \text{atm}$.

**Su üzerinde gaz toplama:** Toplanan gazın basıncı $P_{gaz}=P_{atm}-P_{su\ buharı}$.

## 5. Graham yasası (difüzyon)

Gazların birbirine karışarak yayılmasına **difüzyon**, küçük bir delikten dışarı sızmasına **efüzyon** denir. Aynı koşullarda hız, mol kütlesinin karekökü ile ters orantılıdır:

$$\dfrac{v_1}{v_2}=\sqrt{\dfrac{M_2}{M_1}}$$

Hafif gaz daha hızlı yayılır.

**Örnek:** He ($M=4$) ve $\text{O}_2$ ($M=32$) için $\dfrac{v_{He}}{v_{O_2}}=\sqrt{\dfrac{32}{4}}=\sqrt8=2\sqrt2$. Helyum oksijenden $2\sqrt2$ kat hızlı yayılır.

## 6. Gerçek gazlar

Gerçek gazlar **düşük sıcaklıkta** ve **yüksek basınçta** idealden sapar. Çünkü parçacıklar yaklaştığında çekim kuvvetleri ve parçacıkların kendi hacmi ihmal edilemez. **Mol kütlesi büyük** ve **polar** gazlar idealden daha çok sapar. Helyum ve hidrojen en ideale yakın gazlardır. Van der Waals denklemi, bu iki etki için düzeltme terimleri ekler.

## 7. Sık yapılan hatalar

- Sıcaklığı $^\circ\text{C}$ ile yazmak. Kelvin kullan.
- Boyle yasasında $P$ ile $V$'yi doğru orantılı sanmak. Ters orantılıdır.
- Kısmi basıncı toplam mol ile hesaplamak. Mol **kesri** çarpılır.
- Graham yasasında kütle oranını karekök almadan yazmak.

:::baglanti
Gazlar, **mol kavramı** ve **tepkimelerde hesaplamalar** ile birlikte kullanılır. **Kimyasal denge** konusunda gaz tepkimelerinin dengesi basınçla incelenir ($K_p$). **Fizikte** basınç ve kinetik enerji bağlantısı, gaz parçacıklarının momentum aktarımıyla açıklanır. **Biyolojide** solunumda gazların kısmi basınç farkıyla yayılması bu konuya dayanır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Boyle | $PV=$ sabit |
| Charles | $\dfrac VT=$ sabit |
| Gay-Lussac | $\dfrac PT=$ sabit |
| İdeal gaz | $PV=nRT$ |
| NK | $1$ mol $=22{,}4$ L |
| Dalton | $P_i=X_iP_{toplam}$ |
| Graham | $\dfrac{v_1}{v_2}=\sqrt{\dfrac{M_2}{M_1}}$ |
| Gerçek gaz | Düşük $T$, yüksek $P$'de sapar |

## Mini test

:::soru{cevap="D"}
$2\ \text{mol}$ ideal gaz $27^\circ\text{C}$'de $8{,}2\ \text{L}$ hacimli kapta bulunuyor. Gazın basıncı kaç atm'dir? ($R=0{,}082\ \text{L}\cdot\text{atm}/(\text{mol}\cdot\text{K})$)

- A) $0{,}54$
- B) 3
- C) $5{,}46$
- D) 6
- E) 12

---

1. Sıcaklık kelvin'e çevrilir: $T=27+273=300\ \text{K}$.
2. $P=\dfrac{nRT}{V}=\dfrac{2\cdot0{,}082\cdot300}{8{,}2}=6\ \text{atm}$. Doğru cevap D.

Diğer şıklar: **0,54** sıcaklık $27$ olarak (Celsius) yazılmış / **3** mol sayısı $1$ alınmış / **5,46** $T=273\ \text{K}$ alınmış / **12** hacim $4{,}1\ \text{L}$ gibi yarıya düşürülmüş.
:::

:::soru{cevap="D"}
Sabit sıcaklıkta kapalı bir kaptaki ideal gazın basıncı iki katına çıkarılırsa gazın hacmi ve yoğunluğu için aşağıdakilerden hangisi doğru olur?

- A) Hacim iki katına çıkar, yoğunluk yarıya düşer.
- B) Hacim değişmez, yoğunluk iki katına çıkar.
- C) Hacim yarıya düşer, yoğunluk yarıya düşer.
- D) Hacim yarıya düşer, yoğunluk iki katına çıkar.
- E) Hacim ve yoğunluk iki katına çıkar.

---

1. Boyle yasasına göre sabit sıcaklıkta $P$ ile $V$ ters orantılıdır. Basınç iki katına çıkarsa hacim yarıya düşer.
2. Kütle sabit olduğundan $d=\dfrac mV$ ifadesinde hacim yarıya inince yoğunluk iki katına çıkar. Doğru cevap D.

Diğer şıklar: **A** hacim ile basınç doğru orantılı sanılmış / **B** hacmin sabit kaldığı sanılmış / **C** kütle azalıyormuş gibi düşünülmüş / **E** basınç artışıyla hacmin de artacağı sanılmış.
:::

:::soru{cevap="C"}
Sabit sıcaklıkta bir kapta $2\ \text{mol}$ He ve $3\ \text{mol}$ Ne gazı bulunuyor. Kaptaki toplam basınç $10\ \text{atm}$ ise He'un kısmi basıncı kaç atm'dir?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. He'un mol kesri $X_{He}=\dfrac{2}{2+3}=\dfrac25$.
2. $P_{He}=X_{He}P_{toplam}=\dfrac25\cdot10=4\ \text{atm}$. Doğru cevap C.

Diğer şıklar: **2** mol sayısı kısmi basınç sanılmış / **3** Ne'un mol sayısı yazılmış / **5** karışım eşit paylı sanılmış / **6** Ne'un kısmi basıncı yazılmış.
:::

:::soru{cevap="B"}
Aynı koşullarda He ($M=4$) ve $\text{O}_2$ ($M=32$) gazlarının difüzyon hızları oranı $\dfrac{v_{He}}{v_{O_2}}$ kaçtır?

- A) 2
- B) $2\sqrt2$
- C) 4
- D) 8
- E) 64

---

1. Graham yasası: $\dfrac{v_1}{v_2}=\sqrt{\dfrac{M_2}{M_1}}$.
2. $\dfrac{v_{He}}{v_{O_2}}=\sqrt{\dfrac{32}{4}}=\sqrt8=2\sqrt2$. Doğru cevap B.

Diğer şıklar: **2** kütle oranının karekökü yerine $\sqrt4$ alınmış / **4** He'un kütlesi yazılmış / **8** karekök alınmamış, kütle oranı yazılmış / **64** kütle oranının karesi alınmış.
:::

## Kendini dene

:::dene
1. $27^\circ\text{C}$ kaç kelvin'dir? => $300$ K.
2. NK'da $1$ mol ideal gaz kaç litre hacim kaplar? => $22{,}4$ L.
3. Hangi gaz idealliğe en yakındır? => Helyum.
4. Boyle yasasında hangi büyüklükler sabittir? => Sıcaklık ve madde miktarı.
5. Hafif gaz mı ağır gaz mı daha hızlı yayılır? => Hafif gaz.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-kim' and name = 'Gazlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Deniz suyu içme suyundan neden daha geç donar? Kışın yola tuz atılması buzu neden eritir? Arabanın radyatörüne konulan antifriz neden hem kışın donmayı hem yazın kaynamayı geciktirir? Gazozun şişesi açılınca neden köpürür? Bunların hepsi **çözeltilerin** özellikleriyle ilgilidir. Bu konuda **çözeltilerin derişimini** (yüzde, molarite, molalite, ppm), **seyreltme ve karıştırma** hesaplarını, **çözünürlüğü** ve onu etkileyen etkenleri, **gazların çözünürlüğünü** (Henry yasası) ve **koligatif özellikleri** (buhar basıncı, kaynama ve donma noktası, ozmotik basınç) öğreneceksin. TYT'de çözelti türlerini ve karışımları öğrenmiştin. Burada hesaplamalar derinleşiyor.

:::hedefler
1. Çözelti derişimini farklı birimlerle (kütle yüzdesi, molarite, molalite, ppm, mol kesri) hesaplamak.
2. Seyreltme ve karıştırma problemlerini $M_1V_1=M_2V_2$ ile çözmek.
3. Çözünürlüğe sıcaklık ve basıncın etkisini yorumlamak.
4. Doymuş, doymamış ve aşırı doymuş çözeltileri ayırt etmek.
5. Koligatif özelliklerin çözünen **tanecik sayısına** bağlı olduğunu bilmek ve hesaplamak.
6. Ozmotik basıncı $\pi=MRT$ ile bulmak.
:::

:::ipucu
Koligatif özellikler **çözünenin cinsine değil, tanecik sayısına** bağlıdır. Şeker çözününce tanecik sayısı değişmez ama $\text{NaCl}$ iyonlarına ayrışınca ($i=2$) etki iki katına çıkar. Sorularda önce **tanecik sayısını** hesapla: $n\cdot i$.
:::

::video{id="1pFFPhdTiOU" etiket="Konu anlatımı videosu" baslik="Sıvı Çözeltiler ve Çözünürlük" kanal="Görkem ŞAHİN"}

## 1. Çözelti ve derişim birimleri

Çözelti, **çözücü** ve **çözünenden** oluşan homojen karışımdır. Derişim, belirli miktarda çözeltide ya da çözücüde bulunan çözünen miktarıdır.

| Birim | Tanım | Formül |
| --- | --- | --- |
| Kütle yüzdesi | $100$ g çözeltideki çözünen (g) | $\dfrac{m_{çözünen}}{m_{çözelti}}\cdot100$ |
| Molarite ($M$) | $1$ L çözeltideki çözünen mol sayısı | $\dfrac{n}{V_{L}}$ |
| Molalite ($m$) | $1$ kg **çözücüdeki** çözünen mol sayısı | $\dfrac{n}{m_{çözücü(kg)}}$ |
| ppm | $10^6$ g çözeltideki çözünen (g) | $\dfrac{m_{çözünen}}{m_{çözelti}}\cdot10^6$ |
| Mol kesri | Çözünenin toplam mole oranı | $X=\dfrac{n_1}{n_1+n_2}$ |

**Örnek:** $20\ \text{g}$ $\text{NaOH}$ ($M=40$) suda çözülüp hacim $250\ \text{mL}$'ye tamamlanıyor. $n=\dfrac{20}{40}=0{,}5\ \text{mol}$ ve $M=\dfrac{0{,}5}{0{,}25}=2\ \text{M}$.

**Molarite ile molalite farkı:** Molarite çözeltinin hacmine, molalite çözücünün kütlesine bağlıdır. Sıcaklık değişince hacim değişir, bu yüzden **molarite sıcaklığa bağlıdır**, molalite değildir.

**Derişim değişmez:** Çözeltiden bir miktar alınınca kalan ve alınan kısmın derişimi aynıdır. Yalnızca mol sayısı ve hacim değişir.

## 2. Seyreltme ve karıştırma

**Seyreltme:** Su ekleyince çözünenin mol sayısı değişmez:

$$M_1V_1=M_2V_2$$

**Örnek:** $100\ \text{mL}$ $2\ \text{M}$ çözeltiye su ekleyerek $0{,}5\ \text{M}$ yapmak için $V_2=\dfrac{2\cdot100}{0{,}5}=400\ \text{mL}$ gerekir. Eklenecek su $400-100=300\ \text{mL}$.

**Karıştırma:** Aynı çözünenin iki çözeltisi karıştırılırsa toplam mol, toplam hacme bölünür:

$$M_{son}=\dfrac{M_1V_1+M_2V_2}{V_1+V_2}$$

Farklı iyonlu çözeltiler karıştırılırken tepkime olmuyorsa iyon sayıları ayrı ayrı hesaplanır.

## 3. Çözünürlük

Belirli sıcaklıkta $100\ \text{g}$ çözücüde çözünebilen en fazla madde miktarı **çözünürlüktür**.

- **Doymamış:** Daha fazla madde çözebilir.
- **Doymuş:** Çözünürlük sınırında, dipte çözünmeyen madde olabilir.
- **Aşırı doymuş:** Normalde çözünebileceğinden fazlasını kararsız biçimde içerir. Küçük bir kristal ya da çalkalama fazlayı çöktürür.

**Etkenler:**

- **Katılarda** çoğu zaman sıcaklık artınca çözünürlük artar (çözünme endotermikse). Basıncın etkisi yoktur.
- **Gazlarda** sıcaklık artınca çözünürlük **azalır**. **Henry yasası:** Sabit sıcaklıkta gazın çözünürlüğü, gazın kısmi basıncı ile doğru orantılıdır ($C=k_HP$). Gazozun şişesi açılınca basınç düştüğü için $\text{CO}_2$ çıkar.
- **Benzer benzeri çözer:** Polar çözücü polar maddeyi, apolar çözücü apolar maddeyi çözer. Su tuzu çözer, yağı çözmez.

**Çözünme olayı:** Çözücü ve çözünen arasında çekim kuvvetleri oluşur. Çözünme **ısısı** pozitif (endotermik) ya da negatif (ekzotermik) olabilir. Sıcaklıkla çözünürlük, çözünme ısısının işaretine bağlıdır.

## 4. Koligatif özellikler

Çözünen **uçucu değilse**, çözeltinin bazı özellikleri yalnızca çözünen **tanecik sayısına** bağlıdır:

1. **Buhar basıncı düşmesi:** Çözeltinin buhar basıncı saf çözücününkinden **düşüktür** (Raoult yasası).
2. **Kaynama noktası yükselmesi:** $\Delta T_k=K_k\cdot m\cdot i$
3. **Donma noktası alçalması:** $\Delta T_d=K_d\cdot m\cdot i$
4. **Ozmotik basınç:** $\pi=M\,R\,T\cdot i$

$m$ molalite, $i$ **Van't Hoff çarpanı** (çözünenin ayrıştığı tanecik sayısı: şeker için $1$, $\text{NaCl}$ için $2$, $\text{CaCl}_2$ için $3$).

**Örnek (kaynama):** $K_k=0{,}5\ ^\circ\text{C}\cdot\text{kg/mol}$ olan suda $0{,}5\ \text{mol}$ $\text{NaCl}$, $500\ \text{g}$ suda çözülüyor. $m=\dfrac{0{,}5}{0{,}5}=1\ \text{molal}$ ve $\Delta T_k=0{,}5\cdot1\cdot2=1\ ^\circ\text{C}$. Çözeltinin kaynama noktası $101\ ^\circ\text{C}$ olur.

**Örnek (ozmotik):** $0{,}1\ \text{M}$ glikoz çözeltisi $27^\circ\text{C}$'de $\pi=0{,}1\cdot0{,}082\cdot300=2{,}46\ \text{atm}$.

**Sıralama:** Aynı derişimde (molal) tanecik sayısı fazla olanın kaynama noktası daha yüksek, donma noktası daha düşük, buhar basıncı daha düşüktür. $0{,}1\ \text{m}$ $\text{CaCl}_2$ ($i=3$) $>$ $0{,}1\ \text{m}$ $\text{NaCl}$ ($i=2$) $>$ $0{,}1\ \text{m}$ şeker ($i=1$) olarak etkilidir.

**Ozmos:** Çözücü, yarı geçirgen zardan **seyrek çözeltiden derişik çözeltiye** doğru geçer. Ozmotik basınç, geçişi durdurmak için uygulanması gereken basınçtır. Biyolojide hücrelerin su alıp vermesi ve **ters ozmos** ile deniz suyundan içme suyu elde edilmesi bu olaya dayanır.

::sim{tur="osmoz"}

## 5. Sık yapılan hatalar

- Molaliteyi çözeltinin kütlesine, molariteyi çözücüye göre hesaplamak.
- Hacmi mL ile bırakıp molarite hesaplamak. Litreye çevir.
- Elektrolitlerde Van't Hoff çarpanını ($i$) unutmak.
- Gazların çözünürlüğünün sıcaklıkla arttığını düşünmek. Azalır.

:::baglanti
Çözeltiler konusu, **asit-baz dengesi** ve **çözünürlük dengesi** için zemin hazırlar. **Mol kavramı** burada derişime taşınır. **Biyolojide** osmoz, hücre zarından su geçişi ve vücut sıvılarının derişimi doğrudan bu bilgiye dayanır. **Gazlar** konusundaki kısmi basınç, Henry yasasında gazın çözünürlüğünü belirler. **Fizikte** donma ve kaynama olayları, hâl değişimi ile ilişkilidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Molarite | $\dfrac{n}{V_L}$ (hacme bağlı) |
| Molalite | $\dfrac{n}{m_{çözücü,kg}}$ |
| Seyreltme | $M_1V_1=M_2V_2$ |
| Henry | Gaz çözünürlüğü $\propto P$ |
| Koligatif | Tanecik sayısına bağlı |
| $\Delta T_k$ | $K_k\,m\,i$ |
| Ozmotik basınç | $\pi=MRTi$ |

## Mini test

:::soru{cevap="E"}
$20\ \text{g}$ $\text{NaOH}$ ($M=40\ \text{g/mol}$) suda çözülüp hacmi $250\ \text{mL}$'ye tamamlanıyor. Oluşan çözeltinin molar derişimi kaç $\text{mol/L}$'dir?

- A) $0{,}002$
- B) $0{,}5$
- C) $1$
- D) $1{,}25$
- E) $2$

---

1. $n=\dfrac{20}{40}=0{,}5\ \text{mol}$.
2. Hacim litreye çevrilir: $250\ \text{mL}=0{,}25\ \text{L}$.
3. $M=\dfrac{n}{V}=\dfrac{0{,}5}{0{,}25}=2\ \text{mol/L}$. Doğru cevap E.

Diğer şıklar: **0,002** hacim mL olarak yazılmış, $\dfrac{0{,}5}{250}$ / **0,5** mol sayısı derişim sanılmış / **1** hacim $500\ \text{mL}$ alınmış / **1,25** hacim $400\ \text{mL}$ alınmış.
:::

:::soru{cevap="E"}
Kaynama noktası yükselme sabiti $K_k=0{,}5\ ^\circ\text{C}\cdot\text{kg/mol}$ olan suda, $0{,}5\ \text{mol}$ $\text{NaCl}$ ($i=2$) $500\ \text{g}$ suda çözülüyor. Çözeltinin kaynama noktası kaç $^\circ\text{C}$ olur? (Saf suyun kaynama noktası $100\ ^\circ\text{C}$)

- A) 100
- B) $100{,}001$
- C) $100{,}25$
- D) $100{,}5$
- E) 101

---

1. Molalite $m=\dfrac{0{,}5\ \text{mol}}{0{,}5\ \text{kg}}=1\ \text{molal}$.
2. $\Delta T_k=K_k\cdot m\cdot i=0{,}5\cdot1\cdot2=1\ ^\circ\text{C}$.
3. Kaynama noktası $100+1=101\ ^\circ\text{C}$. Doğru cevap E.

Diğer şıklar: **100** kaynama noktasının değişmediği sanılmış / **100,001** çözücü kütlesi gram olarak yazılmış, $m=\dfrac{0{,}5}{500}$ / **100,25** çözücü $1\ \text{kg}$ alınmış ve $i$ unutulmuş / **100,5** yalnızca Van't Hoff çarpanı unutulmuş.
:::

:::soru{cevap="A"}
$100\ \text{mL}$ $2\ \text{M}$ $\text{KCl}$ çözeltisine saf su ekleyerek derişim $0{,}5\ \text{M}$'ye düşürülüyor. Eklenen su miktarı kaç mL'dir?

- A) 300
- B) 400
- C) 500
- D) 600
- E) 800

---

1. Seyreltmede çözünenin mol sayısı değişmez: $M_1V_1=M_2V_2$.
2. $2\cdot100=0{,}5\cdot V_2$ ve $V_2=400\ \text{mL}$.
3. Eklenen su $400-100=300\ \text{mL}$. Doğru cevap A.

Diğer şıklar: **400** son hacim eklenen su sanılmış / **500** başlangıç ve son hacim toplanmış / **600** eklenen su iki katı alınmış / **800** son hacim iki katı alınmış.
:::

:::soru{cevap="C"}
$0{,}1\ \text{M}$ glikoz çözeltisinin $27^\circ\text{C}$'deki ozmotik basıncı kaç atm'dir? ($R=0{,}082\ \text{L}\cdot\text{atm}/(\text{mol}\cdot\text{K})$)

- A) $0{,}0082$
- B) $0{,}22$
- C) $2{,}46$
- D) $24{,}6$
- E) 30

---

1. Ozmotik basınç $\pi=MRT$. Glikoz elektrolit olmadığından $i=1$.
2. $T=27+273=300\ \text{K}$.
3. $\pi=0{,}1\cdot0{,}082\cdot300=2{,}46\ \text{atm}$. Doğru cevap C.

Diğer şıklar: **0,0082** sıcaklık çarpılmamış, $0{,}1\cdot0{,}082$ / **0,22** sıcaklık Celsius olarak alınmış, $0{,}1\cdot0{,}082\cdot27$ / **24,6** molarite çarpılmamış, $0{,}082\cdot300$ / **30** $R$ çarpılmamış, $0{,}1\cdot300$.
:::

## Kendini dene

:::dene
1. Molarite neye bağlıdır? => Çözeltinin hacmine, dolayısıyla sıcaklığa.
2. Koligatif özellikler neye bağlıdır? => Çözünen tanecik sayısına.
3. Gazların çözünürlüğü sıcaklık artınca nasıl değişir? => Azalır.
4. Çözeltinin buhar basıncı saf çözücüye göre nasıldır? => Daha düşüktür.
5. Ozmos olayında çözücü hangi yönde geçer? => Seyrek çözeltiden derişik çözeltiye.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-kim' and name = 'Sıvı Çözeltiler ve Çözünürlük'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Soğuk paketler neden bir bükünce soğur, el ısıtıcıları neden ısınır? Benzin yanınca açığa çıkan enerji nereden gelir? Kimyasal tepkimelerde bağlar kırılır, yenileri oluşur ve bu sırada sistemle çevre arasında **ısı alışverişi** olur. Bu konuda **entalpi** kavramını, **ekzotermik ve endotermik** tepkimeleri, **oluşum entalpisini**, **bağ enerjilerinden** tepkime ısısı hesabını, **Hess yasasını**, **kalorimetriyi** ve **aktifleşme enerjisini** öğreneceksin. Tepkime ısısı hesapları AYT Kimya'da neredeyse her yıl sorulur.

:::hedefler
1. Ekzotermik ve endotermik tepkimeleri entalpi değişimi ve enerji diyagramıyla ayırt etmek.
2. Oluşum entalpilerinden tepkime entalpisini hesaplamak.
3. Bağ enerjilerinden tepkime entalpisini hesaplamak.
4. Hess yasasıyla tepkime denklemlerini toplayarak bilinmeyen entalpiyi bulmak.
5. Kalorimetrede $Q=m\cdot c\cdot\Delta T$ hesabı yapmak.
6. Aktifleşme enerjisini ve katalizörün etkisini yorumlamak.
:::

:::ipucu
Entalpi sorularında önce **işareti** düşün. Isı verirse $\Delta H<0$ (ekzotermik), ısı alırsa $\Delta H>0$ (endotermik). Sonra sayıya geç. Tepkimeyi **ters çevirirsen** $\Delta H$'nin işareti değişir, **katsayıyı $n$ ile çarparsan** $\Delta H$ da $n$ ile çarpılır.
:::

::video{id="Nci6ydFSDNw" etiket="Konu anlatımı videosu" baslik="Kimyasal Tepkimelerde Enerji" kanal="Benim Hocam"}

## 1. Entalpi ve tepkime ısısı

Sabit basınçta bir sistemin ısı içeriğine **entalpi** ($H$) denir. Tepkimede entalpi değişimi:

$$\Delta H=H_{ürünler}-H_{girenler}$$

- **Ekzotermik** tepkime: Çevreye ısı verir, ürünlerin entalpisi düşüktür, $\Delta H<0$. Yanma, nötrleşme, su buharının yoğuşması.
- **Endotermik** tepkime: Çevreden ısı alır, $\Delta H>0$. Suyun buharlaşması, amonyum nitratın suda çözünmesi, fotosentez, karbonatın ayrışması.

![Ekzotermik ve endotermik tepkimelerde enerji diyagramı](/lessons/ayt-kim/enerji-profili.svg "Aktifleşme enerjisi tepeye çıkmak için gereken enerjidir. Ürün girenden düşükse tepkime ekzotermiktir")

**Aktifleşme enerjisi** ($E_a$), tepkimenin başlaması için aşılması gereken enerji engelidir. Diyagramda girenlerden tepenin üstüne olan yüksekliktir.

- İleri tepkime: $E_{a(ileri)}$
- Geri tepkime: $E_{a(geri)}=E_{a(ileri)}-\Delta H$

**Katalizör** tepkimeyi farklı, daha düşük enerjili bir yoldan yürütür. $E_a$'yı (hem ileri hem geri) düşürür ama $\Delta H$'yi **değiştirmez**.

## 2. Standart oluşum entalpisi

Standart koşullarda ($25^\circ\text{C}$, $1$ atm) elementlerinden $1$ mol bileşik oluşurken olan entalpi değişimine **standart molar oluşum entalpisi** ($\Delta H_f^\circ$) denir. Kararlı hâlindeki elementlerin $\Delta H_f^\circ$ değeri **sıfırdır** ($\text{O}_2$, $\text{H}_2$, $\text{C}$ grafit gibi).

Tepkime entalpisi:

$$\Delta H^\circ=\sum n\,\Delta H_f^\circ(\text{ürünler})-\sum n\,\Delta H_f^\circ(\text{girenler})$$

**Örnek:** $\text{CH}_4+2\text{O}_2\rightarrow\text{CO}_2+2\text{H}_2\text{O}(s)$ için $\Delta H_f^\circ$ değerleri $\text{CH}_4:-75$, $\text{CO}_2:-394$, $\text{H}_2\text{O}(s):-286$ kJ/mol ise $\Delta H=(-394)+2(-286)-(-75)=-891\ \text{kJ}$.

## 3. Bağ enerjisinden tepkime entalpisi

Bağ kırmak enerji **ister** (endotermik), bağ oluşması enerji **verir** (ekzotermik).

$$\Delta H=\sum E_{kırılan\ bağlar}-\sum E_{oluşan\ bağlar}$$

**Dikkat:** Bu formülde "kırılan eksi oluşan" yazılır. Oluşum entalpisindeki "ürünler eksi girenler" ile karıştırma.

**Örnek:** $\text{N}_2+\text{O}_2\rightarrow2\text{NO}$ için $\text{N}\equiv\text{N}:945$, $\text{O}=\text{O}:498$, $\text{N}=\text{O}:630$ kJ/mol ise $\Delta H=(945+498)-2(630)=+183\ \text{kJ}$. Tepkime endotermiktir.

## 4. Hess yasası

Entalpi bir **hâl fonksiyonudur**, yani değişim yoldan bağımsızdır. Bir tepkime birkaç basamakta gerçekleşiyorsa toplam entalpi, basamakların entalpileri toplamıdır.

**Kurallar:**

1. Tepkimeyi ters çevirirsen $\Delta H$'nin işareti değişir.
2. Katsayıyı $n$ ile çarparsan $\Delta H$ da $n$ ile çarpılır.
3. Denklemleri toplarken iki tarafta aynı olan maddeler sadeleşir.

**Örnek:** Aşağıdakilerden $\text{C}+\tfrac12\text{O}_2\rightarrow\text{CO}$ tepkimesinin entalpisini bul.

- $\text{C}+\text{O}_2\rightarrow\text{CO}_2$, $\Delta H=-394\ \text{kJ}$
- $\text{CO}+\tfrac12\text{O}_2\rightarrow\text{CO}_2$, $\Delta H=-283\ \text{kJ}$

İkinciyi ters çevir ($+283$) ve birinciyle topla: $-394+283=-111\ \text{kJ}$.

## 5. Kalorimetri

Isı ölçümüne **kalorimetri** denir. Suyun aldığı ya da verdiği ısı:

$$Q=m\cdot c\cdot\Delta T$$

Suyun özısısı $c=4{,}18\ \text{J/g}\cdot^\circ\text{C}$. Tepkimede açığa çıkan ısı, kalorimetredeki suyun aldığı ısıya eşittir ($Q_{tepkime}=-Q_{su}$). Bir mol madde için entalpi hesaplanacaksa $Q$ önce mol sayısına bölünür.

**Örnek:** $200\ \text{g}$ suyun sıcaklığı $20^\circ\text{C}$'den $30^\circ\text{C}$'ye çıkıyorsa $Q=200\cdot4{,}18\cdot10=8360\ \text{J}=8{,}36\ \text{kJ}$ ısı almıştır.

## 6. Sık yapılan hatalar

- Bağ enerjisinde "ürünler eksi girenler" kullanmak. Doğrusu "kırılan eksi oluşan".
- Tepkime ters çevrilince işareti değiştirmeyi unutmak.
- Katsayıyla çarpmayı unutmak. $2\text{H}_2$ için entalpi $2$ katıdır.
- Kararlı elementin oluşum entalpisini sıfırdan farklı almak.
- Katalizörün $\Delta H$'yi değiştirdiğini düşünmek.
- Joule ile kilojoule'ü karıştırmak. $1\ \text{kJ}=1000\ \text{J}$.

:::baglanti
Tepkime ısısı, **kimyasal denge** ve **hız** konularıyla birlikte düşünülür. Isıtmanın dengeyi hangi yöne kaydıracağı $\Delta H$'nin işaretine bağlıdır. **Fizikte** iş, enerji ve enerjinin korunumu bu konunun temelidir. **Biyolojide** hücresel solunum yavaş yanma, fotosentez ise endotermik bir tepkimedir. **Karbon kimyasında** yakıtların ısıl değerleri bu hesaplarla bulunur.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ekzotermik | $\Delta H<0$, ısı verir |
| Endotermik | $\Delta H>0$, ısı alır |
| Oluşum entalpisi | Ürünler $-$ girenler |
| Bağ enerjisi | Kırılan $-$ oluşan |
| Hess | Ters çevir: işaret değişir, çarp: $\Delta H$ de çarpılır |
| Katalizör | $E_a$'yı düşürür, $\Delta H$'yi değiştirmez |
| $Q$ | $m\,c\,\Delta T$ |

## Mini test

:::soru{cevap="D"}
Aşağıdaki tepkimelerin entalpi değerleri verilmiştir.

$\text{C(k)}+\text{O}_2(g)\rightarrow\text{CO}_2(g)$, $\Delta H=-394\ \text{kJ}$

$\text{CO}(g)+\tfrac12\text{O}_2(g)\rightarrow\text{CO}_2(g)$, $\Delta H=-283\ \text{kJ}$

Buna göre $\text{C(k)}+\tfrac12\text{O}_2(g)\rightarrow\text{CO}(g)$ tepkimesinin entalpisi kaç kJ'dir?

- A) $-677$
- B) $-394$
- C) $-283$
- D) $-111$
- E) $+111$

---

1. Hedef tepkimede $\text{CO}$ ürün tarafındadır. İkinci tepkime ters çevrilir: $\text{CO}_2\rightarrow\text{CO}+\tfrac12\text{O}_2$, $\Delta H=+283$.
2. Birinci tepkimeyle toplanır, $\text{CO}_2$ ve $\tfrac12\text{O}_2$ sadeleşir.
3. $\Delta H=-394+283=-111\ \text{kJ}$. Doğru cevap D.

Diğer şıklar: **$-677$** ikinci tepkime ters çevrilmeden toplanmış / **$-394$** yalnızca birinci tepkime alınmış / **$-283$** yalnızca ikinci tepkime alınmış / **$+111$** işaret ters yazılmış.
:::

:::soru{cevap="E"}
Aşağıdaki olaylardan hangisi **endotermiktir**?

- A) Su buharının yoğuşması
- B) Metanın yanması
- C) Kuvvetli asit ile kuvvetli bazın nötrleşmesi
- D) Suyun donması
- E) Amonyum nitratın suda çözünmesi

---

1. Endotermik olay çevreden ısı alır ve çevre soğur.
2. Amonyum nitrat suda çözünürken ortamdan ısı alır, kap soğur. Bu yüzden soğuk paketlerde kullanılır.
3. Doğru cevap E.

Diğer şıklar: **Su buharının yoğuşması** ısı verir, ekzotermik / **Metanın yanması** her yanma ekzotermik / **Nötrleşme** ısı açığa çıkarır / **Suyun donması** ısı verir.
:::

:::soru{cevap="D"}
Bir tepkimenin ileri yöndeki aktifleşme enerjisi $80\ \text{kJ}$, entalpi değişimi $\Delta H=-30\ \text{kJ}$'dir. Buna göre geri tepkimenin aktifleşme enerjisi kaç kJ'dir?

- A) 30
- B) 50
- C) 80
- D) 110
- E) 140

---

1. Geri tepkimenin aktifleşme enerjisi $E_{a(geri)}=E_{a(ileri)}-\Delta H$.
2. $E_{a(geri)}=80-(-30)=110\ \text{kJ}$.
3. Ekzotermik tepkimede ürünler düşük enerjili olduğundan geri yöndeki engel daha yüksektir. Doğru cevap D.

Diğer şıklar: **30** yalnızca $\Delta H$'nin büyüklüğü alınmış / **50** işaret hatasıyla $80-30$ yapılmış / **80** ileri yöndeki değer geri yön sanılmış / **140** $\Delta H$ iki kez eklenmiş.
:::

:::soru{cevap="C"}
$\text{N}_2(g)+\text{O}_2(g)\rightarrow2\text{NO}(g)$ tepkimesi için $\text{N}\equiv\text{N}$, $\text{O}=\text{O}$ ve $\text{N}=\text{O}$ bağ enerjileri sırasıyla $945$, $498$ ve $630\ \text{kJ/mol}$'dür. Tepkimenin entalpi değişimi kaç kJ'dir?

- A) $-1260$
- B) $-183$
- C) $+183$
- D) $+813$
- E) $+1443$

---

1. Kırılan bağlar: $945+498=1443\ \text{kJ}$.
2. Oluşan bağlar: iki mol $\text{NO}$ için $2\cdot630=1260\ \text{kJ}$.
3. $\Delta H=\text{kırılan}-\text{oluşan}=1443-1260=+183\ \text{kJ}$. Tepkime endotermiktir. Doğru cevap C.

Diğer şıklar: **$-1260$** yalnızca oluşan bağlar alınmış / **$-183$** oluşan eksi kırılan yazılmış, işaret ters / **$+813$** $\text{NO}$ için $630$ bir kez alınmış, $1443-630$ / **$+1443$** yalnızca kırılan bağlar alınmış.
:::

## Kendini dene

:::dene
1. Ekzotermik tepkimede $\Delta H$'nin işareti nedir? => Negatif.
2. Bağ enerjisiyle entalpi hesabında hangi çıkarma yapılır? => Kırılan bağlar eksi oluşan bağlar.
3. Katalizör $\Delta H$'yi değiştirir mi? => Hayır, yalnızca aktifleşme enerjisini düşürür.
4. Tepkime ters çevrilirse $\Delta H$ ne olur? => İşareti değişir.
5. Kararlı elementlerin oluşum entalpisi kaçtır? => Sıfır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-kim' and name = 'Kimyasal Tepkimelerde Enerji'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden süt buzdolabında geç, sıcak odada çabuk ekşir? Toz şeker mi, kesme şeker mi suda daha hızlı çözünür? Arabanın egzozundaki katalitik konvertör zehirli gazları nasıl zararsızlaştırır? Bunlar **tepkime hızı** ile ilgilidir. Bu konuda hızın nasıl tanımlandığını, **çarpışma teorisini**, hızı etkileyen etkenleri (derişim, sıcaklık, temas yüzeyi, katalizör), **hız bağıntısını** ve **mekanizmayı** öğreneceksin. AYT'de özellikle deney verisinden hız bağıntısını bulma ve mekanizmada yavaş basamağı yorumlama soruları çıkar.

:::hedefler
1. Ortalama tepkime hızını derişim değişiminden hesaplamak.
2. Çarpışma teorisini ve etkin çarpışma kavramını açıklamak.
3. Derişim, sıcaklık, temas yüzeyi ve katalizörün hıza etkisini yorumlamak.
4. Deney verisinden hız bağıntısını ve tepkime derecesini bulmak.
5. Mekanizmada **yavaş basamağın** hızı belirlediğini bilmek.
6. Hız sabiti $k$'nin neye bağlı olduğunu bilmek.
:::

:::ipucu
Hız bağıntısı **deneyden** bulunur, denklemdeki katsayılardan değil. Yalnızca **tek basamaklı (elementer)** tepkimelerde derece katsayıya eşittir. Deney tablosunda iki deneyi karşılaştırırken bir madde dışında her şeyin sabit kaldığı iki satırı seç.
:::

::video{id="ULEbfTi1Hn4" etiket="Konu anlatımı videosu" baslik="Tepkime Hızları" kanal="Benim Hocam"}

## 1. Tepkime hızı

Birim zamanda **derişim değişimine** tepkime hızı denir. $\text{aA}\rightarrow\text{bB}$ için:

$$r=-\dfrac{1}{a}\dfrac{\Delta[A]}{\Delta t}=+\dfrac{1}{b}\dfrac{\Delta[B]}{\Delta t}$$

Girenlerin derişimi azaldığı için işaret eksi, ürünlerde artı konur, hız hep pozitiftir. Birim $\text{mol/L}\cdot\text{s}$ olarak yazılır.

**Örnek:** $\text{N}_2+3\text{H}_2\rightarrow2\text{NH}_3$ tepkimesinde $\text{H}_2$ hızı $0{,}6\ \text{M/s}$ ise $\text{N}_2$ için $0{,}2$, $\text{NH}_3$ için $0{,}4\ \text{M/s}$ olur. Katsayılara bölününce hepsi $0{,}2$'ye eşittir.

## 2. Çarpışma teorisi

Tepkime için taneciklerin **çarpışması** gerekir. Her çarpışma tepkime vermez. **Etkin çarpışma** için:

1. Taneciklerin kinetik enerjisi $E_a$'dan büyük ya da eşit olmalı.
2. Çarpışma **uygun doğrultuda** olmalı.

Hızı artıran her etken, birim zamandaki etkin çarpışma sayısını artırır.

## 3. Hızı etkileyen etkenler

| Etken | Etkisi | Neden |
| --- | --- | --- |
| Derişim | Artınca hız artar | Birim hacimde tanecik çok, çarpışma sıklığı artar |
| Sıcaklık | Artınca hız artar | $E_a$'yı aşan tanecik yüzdesi artar |
| Temas yüzeyi | Artınca hız artar | Çarpışma yapabilecek yüzey büyür (katı için) |
| Katalizör | Hızı artırır | $E_a$'yı düşürür, yeni yol sağlar |
| Basınç (gaz) | Artınca hız artar | Derişim artar |

Yaklaşık kural: Sıcaklık $10^\circ\text{C}$ artınca hız çoğu tepkimede yaklaşık $2$ ile $3$ kat artar. Hız sabiti $k$ **yalnızca sıcaklığa ve katalizöre bağlıdır**, derişime bağlı değildir.

**Katalizör** tepkimede harcanmaz, $\Delta H$'yi değiştirmez, dengeyi kaydırmaz, yalnızca dengeye **daha çabuk** ulaştırır. **Enzimler** biyolojik katalizörlerdir.

::sim{tur="hiz"}

## 4. Hız bağıntısı

$\text{aA}+\text{bB}\rightarrow\text{ürün}$ tepkimesinde hız bağıntısı:

$$r=k\,[A]^x\,[B]^y$$

$x$ ve $y$ **deneyden** bulunur ve derecelerdir. Toplam derece $x+y$.

**Örnek (deney tablosu):** $\text{A}+\text{B}\rightarrow\text{C}$

| Deney | $[A]$ (M) | $[B]$ (M) | Hız (M/s) |
| --- | --- | --- | --- |
| 1 | $0{,}1$ | $0{,}1$ | $2\cdot10^{-3}$ |
| 2 | $0{,}2$ | $0{,}1$ | $4\cdot10^{-3}$ |
| 3 | $0{,}2$ | $0{,}2$ | $16\cdot10^{-3}$ |

1. Deney 1 ile 2: $[A]$ iki katına çıkınca hız iki kat. Yani $A$'ya göre derece $1$.
2. Deney 2 ile 3: $[B]$ iki katına çıkınca hız dört kat. Yani $B$'ye göre derece $2$.
3. Hız bağıntısı $r=k[A][B]^2$, toplam derece $3$.
4. $k$: Deney 1'den $k=\dfrac{2\cdot10^{-3}}{0{,}1\cdot0{,}01}=2$.

Sıfırıncı derecede hız derişimden bağımsızdır. Birinci derecede hız derişimle orantılıdır, ikinci derecede derişimin karesiyle orantılıdır.

## 5. Tepkime mekanizması

Çoğu tepkime birkaç basamakta gerçekleşir. Basamakların toplamı net tepkimeyi verir. **Yavaş basamak** hızı belirler, çünkü zincirde en dar boğaz odur.

- **Ara ürün:** Önce oluşup sonra harcanan madde. Net denklemde görünmez.
- **Katalizör:** Önce harcanıp sonra yeniden oluşan madde.
- Hız bağıntısı **yavaş basamağın girenlerine** göre yazılır, basamaktaki katsayı derecedir.

**Örnek:** $2\text{NO}_2+\text{F}_2\rightarrow2\text{NO}_2\text{F}$ tepkimesinde mekanizma:

- Yavaş: $\text{NO}_2+\text{F}_2\rightarrow\text{NO}_2\text{F}+\text{F}$
- Hızlı: $\text{NO}_2+\text{F}\rightarrow\text{NO}_2\text{F}$

Hız bağıntısı yavaş basamaktan $r=k[\text{NO}_2][\text{F}_2]$ olur. $\text{F}$ bir ara üründür.

## 6. Sık yapılan hatalar

- Dereceyi denklemdeki katsayıdan almak. Deneyden bulunur.
- Katalizörün $\Delta H$'yi değiştirdiğini ya da dengeyi kaydırdığını düşünmek.
- Hız sabitinin derişimle değiştiğini düşünmek. Yalnızca sıcaklık ve katalizör etkiler.
- Mekanizmada hızlı basamağa göre hız bağıntısı yazmak.
- Sıcaklığın yalnızca çarpışma sayısını artırdığını sanmak. Asıl etki $E_a$'yı aşan tanecik oranının artmasıdır.

:::baglanti
Hız, **denge** konusunda karşına çıkar. Dengede ileri ve geri hız eşittir. **Enerji** konusundaki aktifleşme enerjisi hızın temel nedenidir. **Biyolojide** enzimler katalizör gibi çalışır ve sıcaklık ya da pH değişince enzim hızı değişir. **Gazlar** konusundaki kinetik teori, sıcaklığın taneciklerin hızını artırmasını açıklar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Hız | Birim zamanda derişim değişimi |
| Etkin çarpışma | $E\ge E_a$ ve uygun doğrultu |
| Katalizör | $E_a$'yı düşürür, $\Delta H$ ve denge değişmez |
| Hız bağıntısı | $r=k[A]^x[B]^y$, deneyden |
| $k$ | Sıcaklık ve katalizöre bağlı |
| Mekanizma | Yavaş basamak hızı belirler |

## Mini test

:::soru{cevap="E"}
$\text{A}+\text{B}\rightarrow\text{C}$ tepkimesi için aynı sıcaklıkta yapılan deneylerin verileri aşağıdadır.

| Deney | $[A]$ (M) | $[B]$ (M) | Hız (M/s) |
| --- | --- | --- | --- |
| 1 | $0{,}1$ | $0{,}1$ | $2\cdot10^{-3}$ |
| 2 | $0{,}2$ | $0{,}1$ | $4\cdot10^{-3}$ |
| 3 | $0{,}2$ | $0{,}2$ | $16\cdot10^{-3}$ |

Buna göre tepkimenin hız bağıntısı aşağıdakilerden hangisidir?

- A) $r=k[A]$
- B) $r=k[B]$
- C) $r=k[A]^2[B]$
- D) $r=k[A]^2[B]^2$
- E) $r=k[A][B]^2$

---

1. Deney 1 ve 2'de yalnızca $[A]$ iki katına çıkıyor, hız da iki kat oluyor. $A$'ya göre derece $1$.
2. Deney 2 ve 3'te yalnızca $[B]$ iki katına çıkıyor, hız dört kat oluyor. $B$'ye göre derece $2$.
3. Hız bağıntısı $r=k[A][B]^2$. Doğru cevap E.

Diğer şıklar: **$r=k[A]$** $B$'nin etkisi atlanmış / **$r=k[B]$** $A$'nın etkisi atlanmış ve derece yanlış / **$r=k[A]^2[B]$** dereceler ters alınmış / **$r=k[A]^2[B]^2$** $A$'nın hıza etkisi dört kat sanılmış.
:::

:::soru{cevap="B"}
Aşağıdakilerden hangisi için katalizör kullanmak **değiştirmez**?

- A) Aktifleşme enerjisi
- B) Tepkimenin entalpi değişimi
- C) Etkin çarpışma sayısı
- D) Tepkimenin gerçekleştiği yol
- E) Tepkime hızı

---

1. Katalizör tepkimeyi daha düşük $E_a$'lı yeni bir yoldan yürütür. Böylece etkin çarpışma sayısı ve hız artar.
2. Girenlerin ve ürünlerin enerjisi aynı kaldığından $\Delta H$ değişmez. Doğru cevap B.

Diğer şıklar: **Aktifleşme enerjisi** düşer / **Etkin çarpışma sayısı** artar / **Tepkimenin yolu** yeni mekanizmaya döner / **Tepkime hızı** artar.
:::

:::soru{cevap="A"}
$2\text{NO}_2+\text{F}_2\rightarrow2\text{NO}_2\text{F}$ tepkimesi iki basamakta gerçekleşiyor.

Basamak 1 (yavaş): $\text{NO}_2+\text{F}_2\rightarrow\text{NO}_2\text{F}+\text{F}$

Basamak 2 (hızlı): $\text{NO}_2+\text{F}\rightarrow\text{NO}_2\text{F}$

Buna göre tepkimenin hız bağıntısı aşağıdakilerden hangisidir?

- A) $r=k[\text{NO}_2][\text{F}_2]$
- B) $r=k[\text{NO}_2]^2[\text{F}_2]$
- C) $r=k[\text{NO}_2]^2$
- D) $r=k[\text{NO}_2][\text{F}]$
- E) $r=k[\text{NO}_2\text{F}]^2$

---

1. Hızı yavaş basamak belirler. Hız bağıntısı yavaş basamağın girenlerinden yazılır.
2. Basamak 1'de $\text{NO}_2$ ve $\text{F}_2$ birer mol girer: $r=k[\text{NO}_2][\text{F}_2]$. Doğru cevap A.

Diğer şıklar: **$r=k[\text{NO}_2]^2[\text{F}_2]$** net denklemin katsayıları derece yapılmış / **$r=k[\text{NO}_2]^2$** yalnızca bir girenin alınması ve derecenin iki yazılması / **$r=k[\text{NO}_2][\text{F}]$** hızlı basamak ve ara ürün kullanılmış / **$r=k[\text{NO}_2\text{F}]^2$** ürün derişimi yazılmış.
:::

:::soru{cevap="E"}
Sıcaklık yükseltildiğinde bir tepkimenin hızının artmasının temel nedeni aşağıdakilerden hangisidir?

- A) Aktifleşme enerjisinin yeni bir yolla düşmesi
- B) Tepkime entalpisinin daha pozitif olması
- C) Taneciklerin kütlelerinin artması
- D) Ürünlerin enerjisinin girenlerden düşük olması
- E) Aktifleşme enerjisini aşan tanecik oranının artması

---

1. Sıcaklık artınca taneciklerin ortalama kinetik enerjisi artar.
2. Böylece enerjisi $E_a$'dan büyük olan tanecik yüzdesi yükselir ve etkin çarpışma sayısı artar. Doğru cevap E.

Diğer şıklar: **Aktifleşme enerjisinin düşmesi** katalizörün etkisidir, sıcaklığın değil / **Entalpinin artması** hıza değil tepkime ısısına ilişkin, sıcaklık $\Delta H$'yi belirlemez / **Kütlenin artması** sıcaklıkla kütle değişmez / **Ürün enerjisinin düşük olması** hıza değil $\Delta H$'nin işaretine ilişkin.
:::

## Kendini dene

:::dene
1. Hız bağıntısı nasıl bulunur? => Deneyden.
2. Mekanizmada hızı hangi basamak belirler? => Yavaş basamak.
3. Hız sabiti $k$ neye bağlıdır? => Sıcaklığa ve katalizöre.
4. Etkin çarpışma için hangi iki koşul gerekir? => Yeterli enerji ve uygun doğrultu.
5. Ara ürün net denklemde görünür mü? => Hayır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-kim' and name = 'Kimyasal Tepkimelerde Hız'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Amonyak üretiminde fabrikalar neden yüksek basınç kullanır? Kapalı bir şişedeki gazoz neden kendiliğinden köpürmez ama kapağı açılınca köpürür? Birçok tepkime sonuna kadar gitmez, belli bir noktada durur gibi görünür. Aslında tepkime durmaz, ileri ve geri tepkimeler **aynı hızla** sürer. Bu konuda **dinamik dengeyi**, **denge sabiti** ($K_c$, $K_p$) hesaplarını, **Q ile K karşılaştırmasını** ve **Le Chatelier ilkesini** öğreneceksin. Denge, AYT Kimya'nın en çok soru çıkan başlıklarındandır.

:::hedefler
1. Dinamik dengenin özelliklerini açıklamak.
2. $K_c$ ve $K_p$ bağıntılarını yazmak ve hesaplamak.
3. Katı ve sıvıların (saf) denge ifadesine yazılmadığını bilmek.
4. $Q$ ile $K$'yi karşılaştırıp tepkimenin yönünü belirlemek.
5. Le Chatelier ilkesiyle derişim, basınç, hacim ve sıcaklık değişimlerini yorumlamak.
6. $K$'nin hangi etkenlere bağlı olduğunu bilmek.
:::

:::ipucu
Denge kaymasında üç soruyu sırayla sor: **Ne değişti?** (derişim, hacim, sıcaklık) **Sistem bunu nasıl azaltır?** **K değişti mi?** Yalnızca **sıcaklık** $K$'yi değiştirir. Derişim, basınç ve katalizör denge noktasını ya da hızı etkileyebilir ama $K$'yi değiştirmez.
:::

::video{id="nLrV-62MCZ0" etiket="Konu anlatımı videosu" baslik="Kimyasal Denge" kanal="Benim Hocam"}

## 1. Dinamik denge

Kapalı kapta tersinir bir tepkimede ileri tepkime hızı geri tepkime hızına eşitlendiğinde **denge** kurulur. Özellikler:

- Makroskobik özellikler (derişim, renk, basınç) **sabit** kalır.
- İleri ve geri tepkimeler **durmaz**, hızları eşittir. Bu yüzden denge **dinamiktir**.
- Denge, kapalı sistemde kurulur ve iki yönden de kurulabilir.
- Katalizör dengeye daha çabuk ulaştırır, denge noktasını değiştirmez.

## 2. Denge sabiti

$\text{aA}+\text{bB}\rightleftharpoons\text{cC}+\text{dD}$ için derişimlerle:

$$K_c=\dfrac{[C]^c\,[D]^d}{[A]^a\,[B]^b}$$

Gazlarda kısmi basınçlarla $K_p$ yazılır. İki sabit arasında $K_p=K_c(RT)^{\Delta n}$ ilişkisi vardır ($\Delta n$: gaz ürün mol sayısı eksi gaz giren mol sayısı).

**Kurallar:**

- **Saf katılar ve sıvılar** denge ifadesine yazılmaz. $\text{CaCO}_3(k)\rightleftharpoons\text{CaO}(k)+\text{CO}_2(g)$ için $K_c=[\text{CO}_2]$.
- $K$ büyükse denge ürünler yönündedir, küçükse girenler yönündedir.
- Tepkimeyi **ters çevirince** $K\rightarrow\dfrac{1}{K}$.
- Tepkimeyi $n$ ile çarpınca $K\rightarrow K^n$.
- Tepkimeleri **toplayınca** $K$'ler **çarpılır**.

**Örnek:** $\text{N}_2+3\text{H}_2\rightleftharpoons2\text{NH}_3$ dengesinde $[\text{N}_2]=1$, $[\text{H}_2]=2$, $[\text{NH}_3]=2\ \text{M}$ ise $K_c=\dfrac{2^2}{1\cdot2^3}=0{,}5$.

## 3. Q ile K karşılaştırması

Tepkime kabında anlık derişimlerle hesaplanan $Q$ (denge bölümü), $K$ ile karşılaştırılır:

- $Q<K$: Sistem dengede değil, **ileri yönde** ilerler.
- $Q=K$: Denge.
- $Q>K$: **Geri yönde** ilerler.

**Örnek:** $\text{H}_2+\text{I}_2\rightleftharpoons2\text{HI}$, $K_c=50$. Kapta $[\text{H}_2]=[\text{I}_2]=0{,}1$ ve $[\text{HI}]=1\ \text{M}$ ise $Q=\dfrac{1^2}{0{,}1\cdot0{,}1}=100>50$. Tepkime geri yönde ilerler.

## 4. Le Chatelier ilkesi

Dengedeki sisteme dışarıdan bir etki yapılırsa sistem, **etkiyi azaltacak yönde** yeni bir denge kurar.

| Etki | Denge kayar |
| --- | --- |
| Girenden ekleme | Ürünler yönüne |
| Üründen ekleme | Girenler yönüne |
| Hacmi küçültme (basınç artar) | Gaz mol sayısı **az** olan yöne |
| Hacmi büyütme (basınç azalır) | Gaz mol sayısı **çok** olan yöne |
| Sıcaklığı artırma | **Endotermik** yöne |
| Sıcaklığı azaltma | **Ekzotermik** yöne |
| Katalizör | Kayma yok |
| Sabit hacimde soygaz | Kayma yok |

Hacim ve basınç değişince mol sayısının eşit olduğu denklemlerde kayma olmaz ($\text{H}_2+\text{I}_2\rightleftharpoons2\text{HI}$ gibi). Derişim ya da basınç değişince denge kayar ama $K$ aynı kalır. Sıcaklık değişince denge kayar ve **$K$ değişir**: ekzotermik tepkimede sıcaklık artınca $K$ azalır.

::sim{tur="denge"}

**Örnek:** $\text{N}_2+3\text{H}_2\rightleftharpoons2\text{NH}_3$, $\Delta H=-92\ \text{kJ}$. Kabın hacmi küçülürse (gaz mol sayısı $4\rightarrow2$) denge ürünler yönüne, yani $\text{NH}_3$ artacak şekilde kayar. Sıcaklık artarsa endotermik yön, yani girenler yönü tercih edilir. Amonyak üretiminde (Haber) yüksek basınç ve orta sıcaklık bu yüzden seçilir.

## 5. Sık yapılan hatalar

- Katı ve sıvıları denge ifadesine yazmak.
- Kuvvet olarak katsayıyı yazmayı unutmak.
- Katalizörün dengeyi kaydırdığını sanmak.
- Sabit hacimde soygaz eklenince dengenin kaydığını sanmak.
- Basınç ya da derişim değişince $K$'nin değiştiğini düşünmek.
- $Q$ ile $K$'yi birbirine karıştırmak.

:::baglanti
Denge, **asit-baz** ve **çözünürlük dengesi** konularının temelidir. $K_a$, $K_b$ ve $K_{çç}$ birer denge sabitidir. **Enerji** konusunda öğrendiğin $\Delta H$'nin işareti, sıcaklığın denge üzerindeki etkisini belirler. **Biyolojide** hemoglobinin oksijen bağlaması ve kandaki tampon sistemi dengeler üzerine kuruludur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Dinamik denge | İleri hız = geri hız |
| $K_c$ | Ürünler / girenler (katsayılar üs) |
| Ters çevir | $1/K$ |
| Katsayı $n$ | $K^n$ |
| Toplama | $K$'ler çarpılır |
| $Q<K$ | İleri yönde ilerler |
| Sıcaklık | $K$'yi değiştiren tek etken |

## Mini test

:::soru{cevap="A"}
$\text{N}_2(g)+3\text{H}_2(g)\rightleftharpoons2\text{NH}_3(g)$ tepkimesi dengedeyken $[\text{N}_2]=1\ \text{M}$, $[\text{H}_2]=2\ \text{M}$ ve $[\text{NH}_3]=2\ \text{M}$'dir. Buna göre aynı sıcaklıkta $K_c$ değeri kaçtır?

- A) $0{,}5$
- B) $1$
- C) $2$
- D) $4$
- E) $8$

---

1. $K_c=\dfrac{[\text{NH}_3]^2}{[\text{N}_2][\text{H}_2]^3}$.
2. $K_c=\dfrac{2^2}{1\cdot2^3}=\dfrac{4}{8}=0{,}5$. Doğru cevap A.

Diğer şıklar: **1** katsayılar üs yazılmamış, $\dfrac{2}{1\cdot2}$ / **2** ürün ve girenler yer değiştirmiş, $\dfrac{8}{4}$ / **4** payda $[\text{H}_2]^3$ atlanmış, $\dfrac{4}{1}$ / **8** yalnızca giren çarpımı alınmış.
:::

:::soru{cevap="D"}
$\text{N}_2(g)+3\text{H}_2(g)\rightleftharpoons2\text{NH}_3(g)$, $\Delta H=-92\ \text{kJ}$ tepkimesi dengedeyken aşağıdaki işlemlerden hangisi dengeyi $\text{NH}_3$ artacak yönde kaydırır?

- A) Sıcaklığı yükseltmek
- B) Katalizör eklemek
- C) Kaba helyum eklemek
- D) Kabın hacmini küçültmek
- E) Kaba $\text{NH}_3$ eklemek

---

1. Hacim küçülünce basınç artar ve denge gaz mol sayısı az olan yöne kayar. Girenlerde $4$, ürünlerde $2$ mol gaz vardır.
2. Denge ürünler yönüne, yani $\text{NH}_3$ artacak yöne kayar. Doğru cevap D.

Diğer şıklar: **Sıcaklığı yükseltmek** tepkime ekzotermik olduğundan denge girenler yönüne kayar / **Katalizör** dengeyi kaydırmaz / **Helyum** sabit hacimde derişimler değişmez, kayma olmaz / **$\text{NH}_3$ eklemek** ürün eklendiği için denge girenler yönüne kayar.
:::

:::soru{cevap="E"}
$\text{X}\rightleftharpoons\text{Y}$ tepkimesinin belirli sıcaklıkta denge sabiti $K_c=0{,}25$'tir. Aynı sıcaklıkta $2\text{Y}\rightleftharpoons2\text{X}$ tepkimesinin denge sabiti kaçtır?

- A) $0{,}0625$
- B) $0{,}25$
- C) $4$
- D) $8$
- E) $16$

---

1. Tepkime ters çevrilince $K\rightarrow\dfrac{1}{K}=4$.
2. Katsayılar $2$ ile çarpılınca $K\rightarrow K^2$: $4^2=16$. Doğru cevap E.

Diğer şıklar: **0,0625** ters çevirmeden yalnızca kare alınmış, $0{,}25^2$ / **0,25** değişmeyeceği sanılmış / **4** yalnızca ters çevrilmiş, katsayı atlanmış / **8** katsayı üs yerine çarpan yapılmış, $4\cdot2$.
:::

:::soru{cevap="D"}
$\text{H}_2(g)+\text{I}_2(g)\rightleftharpoons2\text{HI}(g)$ tepkimesinin belirli sıcaklıkta $K_c=50$'dir. Bu sıcaklıkta kapta $[\text{H}_2]=[\text{I}_2]=0{,}1\ \text{M}$ ve $[\text{HI}]=1\ \text{M}$ iken aşağıdakilerden hangisi doğrudur?

- A) Sistem dengededir.
- B) İleri yönde ilerler ve $K_c$ artar.
- C) Geri yönde ilerler ve $K_c$ azalır.
- D) Geri yönde ilerler ve $K_c$ değişmez.
- E) İleri yönde ilerler ve $K_c$ değişmez.

---

1. $Q=\dfrac{[\text{HI}]^2}{[\text{H}_2][\text{I}_2]}=\dfrac{1}{0{,}01}=100$.
2. $Q>K$ olduğu için tepkime geri yönde ilerler.
3. Sıcaklık aynı kaldığı için $K_c$ değişmez. Doğru cevap D.

Diğer şıklar: **Dengededir** $Q=K$ değil / **İleri yönde, $K_c$ artar** hem yön hem $K$ yanlış / **Geri yönde, $K_c$ azalır** sıcaklık değişmedikçe $K_c$ değişmez / **İleri yönde, $K_c$ değişmez** $Q$ ile $K$ karşılaştırması ters okunmuş.
:::

## Kendini dene

:::dene
1. Dinamik denge ne demektir? => İleri ve geri hızlar eşit, tepkime sürüyor.
2. Denge sabitine ne etki eder? => Yalnızca sıcaklık.
3. Katı ve sıvılar $K_c$ ifadesinde yazılır mı? => Hayır.
4. $Q>K$ ise tepkime hangi yöne ilerler? => Geri yöne.
5. Sıcaklık artınca denge hangi yöne kayar? => Endotermik yöne.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-kim' and name = 'Kimyasal Tepkimelerde Denge'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Mide asidi ile antasit hapı birbirini nasıl dengeler? Limon suyu ve sabun neden farklı hisseder? Kan pH'ı neden $7{,}4$ civarında sabit kalır? Asitler ve bazlar günlük hayatın her yerinde ve hepsi **denge** kurallarına uyar. Bu konuda **asit-baz tanımlarını** (Arrhenius, Brønsted-Lowry), **eşlenik asit-baz çiftlerini**, **suyun iyonlaşmasını**, **pH hesaplarını**, **zayıf asit ve bazlarda $K_a$ ve $K_b$ ile hesabı**, **nötrleşme ve titrasyonu** ve **indikatörleri** öğreneceksin. TYT'de pH ölçeğinin temelini öğrenmiştin. Burada hesap derinleşiyor.

:::hedefler
1. Arrhenius ve Brønsted-Lowry tanımlarını ayırt etmek.
2. Eşlenik asit-baz çiftlerini ve amfoter türleri belirlemek.
3. Suyun iyonlaşma sabitini ($K_w=10^{-14}$) kullanarak $\text{pH}$, $\text{pOH}$ hesaplamak.
4. Kuvvetli asit ve bazlarda pH'yı, seyreltmede pH değişimini bulmak.
5. Zayıf asit ve bazlarda $[\text{H}^+]=\sqrt{K_a\cdot C}$ hesabı yapmak.
6. Nötrleşmeyi ve titrasyon eşdeğerlik noktasını yorumlayıp uygun indikatörü seçmek.
:::

:::ipucu
pH sorularında önce çözeltinin **kuvvetli mi zayıf mı** olduğuna bak. Kuvvetli asitte $[\text{H}^+]$ doğrudan derişimden gelir. Zayıf asitte $\sqrt{K_a\cdot C}$ kullanılır. Bazlarda önce $\text{pOH}$ bulup $14$'ten çıkar. Seyreltmede önce **yeni derişimi** bul.
:::

::video{id="1Zli-5REoXI" etiket="Konu anlatımı videosu" baslik="Asit Baz Dengesi" kanal="Görkem ŞAHİN"}

## 1. Asit-baz tanımları

- **Arrhenius:** Suda $\text{H}^+$ veren asit, $\text{OH}^-$ veren bazdır.
- **Brønsted-Lowry:** Proton ($\text{H}^+$) **veren** asit, proton **alan** bazdır. Tanım sulu ortamla sınırlı değildir.

$$\text{NH}_3+\text{H}_2\text{O}\rightleftharpoons\text{NH}_4^++\text{OH}^-$$

Bu tepkimede $\text{H}_2\text{O}$ proton verdiği için asit, $\text{NH}_3$ proton aldığı için bazdır.

**Eşlenik çift:** Bir proton farkı olan asit-baz çiftidir. $\text{NH}_4^+/\text{NH}_3$ ve $\text{H}_2\text{O}/\text{OH}^-$ birer eşlenik çifttir. Güçlü asidin eşlenik bazı çok zayıf, zayıf asidin eşlenik bazı güçlüdür.

**Amfoter (hem asit hem baz) türler:** Hem proton verebilir hem alabilir. $\text{H}_2\text{O}$, $\text{HCO}_3^-$, $\text{HS}^-$, $\text{H}_2\text{PO}_4^-$ örnektir.

## 2. Suyun iyonlaşması ve pH

Saf su çok az iyonlaşır: $\text{H}_2\text{O}\rightleftharpoons\text{H}^++\text{OH}^-$.

$$K_w=[\text{H}^+][\text{OH}^-]=10^{-14}\ (25^\circ\text{C})$$

$$\text{pH}=-\log[\text{H}^+],\quad\text{pOH}=-\log[\text{OH}^-],\quad\text{pH}+\text{pOH}=14$$

Nötr çözeltide $\text{pH}=7$, asidik çözeltide $\text{pH}<7$, bazik çözeltide $\text{pH}>7$. Sıcaklık artınca $K_w$ artar, nötr pH $7$'den küçük olur ama çözelti yine nötrdür çünkü $[\text{H}^+]=[\text{OH}^-]$.

::sim{tur="ph"}

**Kuvvetli asit ve bazlar** (tam iyonlaşır):

- $0{,}01\ \text{M}$ $\text{HCl}$: $[\text{H}^+]=10^{-2}$, $\text{pH}=2$.
- $0{,}05\ \text{M}$ $\text{Ba(OH)}_2$: $[\text{OH}^-]=0{,}1$, $\text{pOH}=1$, $\text{pH}=13$.

**Seyreltme:** $\text{pH}=2$ olan $100\ \text{mL}$ $\text{HCl}$'ye su ekleyerek $1\ \text{L}$'ye tamamlarsan derişim $10$ kat azalır, $\text{pH}=3$ olur. Kuvvetli asit ne kadar seyreltilirse seyreltilsin pH hiçbir zaman $7$'yi geçmez.

## 3. Zayıf asit ve bazlar

Zayıf asit suda **kısmen** iyonlaşır ve bir denge kurar: $\text{HA}\rightleftharpoons\text{H}^++\text{A}^-$.

$$K_a=\dfrac{[\text{H}^+][\text{A}^-]}{[\text{HA}]}$$

İyonlaşma çok küçükse ($C\gg K_a$) yaklaşık:

$$[\text{H}^+]=\sqrt{K_a\cdot C}$$

**Örnek:** $0{,}1\ \text{M}$ zayıf asit için $K_a=10^{-5}$ ise $[\text{H}^+]=\sqrt{10^{-5}\cdot10^{-1}}=10^{-3}$, $\text{pH}=3$.

Zayıf bazlar için aynı yolla $[\text{OH}^-]=\sqrt{K_b\cdot C}$. **Seyreltince** zayıf asidin iyonlaşma yüzdesi artar ama $[\text{H}^+]$ azalır. $K_a$ yalnızca sıcaklığa bağlıdır. Aynı derişimde $K_a$ büyük olan asit daha kuvvetlidir.

## 4. Nötrleşme ve titrasyon

Asit ile baz tepkimesi **nötrleşmedir**. Tam nötrleşme için mol $\text{H}^+$ = mol $\text{OH}^-$ olmalıdır:

$$n_{asit}\cdot(\text{H}^+\ sayısı)=n_{baz}\cdot(\text{OH}^-\ sayısı)$$

**Titrasyonda** derişimi bilinmeyen çözeltiye, derişimi bilinen çözelti damlatılır. **Eşdeğerlik noktasında** asit ve baz tam nötrleşmiştir.

| Titrasyon | Eşdeğerlik pH | Uygun indikatör |
| --- | --- | --- |
| Kuvvetli asit - kuvvetli baz | $7$ | Bromtimol mavisi, fenolftalein |
| Zayıf asit - kuvvetli baz | $>7$ | Fenolftalein |
| Kuvvetli asit - zayıf baz | $<7$ | Metil oranj, metil kırmızısı |

Zayıf asit ile kuvvetli baz nötrleşince oluşan tuzun anyonu bir miktar su ile tepkimeye girip $\text{OH}^-$ üretir (hidroliz). Bu yüzden eşdeğerlik noktasında çözelti baziktir.

**Tampon çözelti:** Zayıf asit ve eşlenik bazının karışımıdır. Az miktarda asit ya da baz eklenince pH'ı büyük ölçüde değişmez. Kan ve gözyaşı tampondur.

## 5. Sık yapılan hatalar

- pH ile pOH'u karıştırmak. Bazlarda önce pOH bulunur.
- Çift hidroksitli bazlarda ($\text{Ba(OH)}_2$) $\text{OH}^-$ sayısını unutmak.
- Seyreltince asidin pH'ının $7$'yi geçeceğini düşünmek.
- Zayıf asitte $[\text{H}^+]$'yı doğrudan derişime eşitlemek.
- Titrasyonda eşdeğerlik noktasının her zaman $\text{pH}=7$ olduğunu düşünmek.
- $K_a$'nın derişimle değiştiğini sanmak. Yalnızca sıcaklığa bağlıdır.

:::baglanti
Asit-baz dengesi, **kimyasal denge** konusunun uygulamasıdır. $K_a$, $K_b$, $K_w$ birer denge sabitidir. **Biyolojide** kan pH'ı, mide asidi, enzimlerin pH'a duyarlılığı ve solunumla kan tamponu bu konuyla bağlantılıdır. **Çözünürlük dengesi** konusunda pH'ın tuzların çözünürlüğüne etkisini göreceksin.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Brønsted-Lowry | Asit proton verir, baz alır |
| $K_w$ | $[\text{H}^+][\text{OH}^-]=10^{-14}$ |
| pH + pOH | $14$ |
| Zayıf asit | $[\text{H}^+]=\sqrt{K_aC}$ |
| Seyreltme | Derişim azalır, pH $7$'yi geçmez |
| Titrasyon | Eşdeğerlik: mol $\text{H}^+$ = mol $\text{OH}^-$ |
| Zayıf asit - kuvvetli baz | pH $>7$, fenolftalein |

## Mini test

:::soru{cevap="C"}
$\text{pH}=2$ olan $100\ \text{mL}$ $\text{HCl}$ çözeltisine saf su eklenerek hacmi $1\ \text{L}$'ye tamamlanıyor. Oluşan çözeltinin pH'ı kaçtır?

- A) $1$
- B) $2$
- C) $3$
- D) $4$
- E) $7$

---

1. Başlangıçta $[\text{H}^+]=10^{-2}\ \text{M}$.
2. Hacim $10$ katına çıkınca derişim $10$ kat azalır: $[\text{H}^+]=10^{-3}\ \text{M}$.
3. $\text{pH}=3$. Doğru cevap C.

Diğer şıklar: **1** derişim on kat artmış gibi hesaplanmış / **2** seyreltmenin pH'ı değiştirmeyeceği sanılmış / **4** hacim artışı $100$ kat sanılmış / **7** asit suyla seyrelince nötr olur sanılmış.
:::

:::soru{cevap="E"}
Aşağıdaki türlerden hangisi hem asit hem baz olarak davranabilir?

- A) $\text{Cl}^-$
- B) $\text{NH}_4^+$
- C) $\text{NO}_3^-$
- D) $\text{H}_3\text{O}^+$
- E) $\text{HCO}_3^-$

---

1. Amfoter tür hem proton verebilir hem alabilir.
2. $\text{HCO}_3^-$ proton verince $\text{CO}_3^{2-}$, proton alınca $\text{H}_2\text{CO}_3$ olur. Doğru cevap E.

Diğer şıklar: **$\text{Cl}^-$** protonu verecek hidrojeni yok, yalnızca çok zayıf baz / **$\text{NH}_4^+$** proton verir ama alamaz, asit / **$\text{NO}_3^-$** çok zayıf bir bazdır, proton veremez / **$\text{H}_3\text{O}^+$** proton verir ama alamaz, asit.
:::

:::soru{cevap="C"}
$0{,}1\ \text{M}$ zayıf bir $\text{HA}$ asidinin $K_a$ değeri $10^{-5}$'tir. Çözeltinin pH'ı kaçtır?

- A) $1$
- B) $2{,}5$
- C) $3$
- D) $5$
- E) $6$

---

1. $[\text{H}^+]=\sqrt{K_a\cdot C}=\sqrt{10^{-5}\cdot10^{-1}}=10^{-3}\ \text{M}$.
2. $\text{pH}=3$. Doğru cevap C.

Diğer şıklar: **1** asit tam iyonlaşıyor sanılmış, $[\text{H}^+]=0{,}1$ / **2,5** derişim unutulmuş, $\sqrt{K_a}$ / **5** $[\text{H}^+]=K_a$ alınmış / **6** $[\text{H}^+]=K_a\cdot C$ alınmış.
:::

:::soru{cevap="D"}
$0{,}1\ \text{M}$ $\text{CH}_3\text{COOH}$ çözeltisi $0{,}1\ \text{M}$ $\text{NaOH}$ ile titre ediliyor. Eşdeğerlik noktasındaki pH ve uygun indikatör aşağıdakilerden hangisidir? (Fenolftalein yaklaşık $8$ ile $10$, metil oranj yaklaşık $3$ ile $4{,}4$ aralığında renk değiştirir.)

- A) $\text{pH}=7$, metil oranj
- B) $\text{pH}=7$, fenolftalein
- C) $\text{pH}<7$, metil oranj
- D) $\text{pH}>7$, fenolftalein
- E) $\text{pH}<7$, fenolftalein

---

1. Zayıf asit kuvvetli bazla tam nötrleşince oluşan $\text{CH}_3\text{COO}^-$ iyonu suyla tepkimeye girip $\text{OH}^-$ üretir.
2. Eşdeğerlik noktasında çözelti baziktir, $\text{pH}>7$.
3. Renk değişim aralığı bu bölgeye yakın olan fenolftalein uygundur. Doğru cevap D.

Diğer şıklar: **$\text{pH}=7$, metil oranj** tuz hidroliz olur, nötr değil, indikatör de asidik bölgede / **$\text{pH}=7$, fenolftalein** kuvvetli asit-kuvvetli baz sanılmış / **$\text{pH}<7$, metil oranj** kuvvetli asit-zayıf baz titrasyonunun sonucu / **$\text{pH}<7$, fenolftalein** pH ve indikatör uyumsuz.
:::

## Kendini dene

:::dene
1. $\text{pH}+\text{pOH}$ kaçtır ($25^\circ\text{C}$)? => 14.
2. Zayıf asitte $[\text{H}^+]$ nasıl bulunur? => $\sqrt{K_a\cdot C}$.
3. $\text{HCO}_3^-$ gibi hem asit hem baz davranabilen türe ne denir? => Amfoter.
4. Zayıf asit - kuvvetli baz titrasyonunda eşdeğerlik pH'ı nasıldır? => 7'den büyük.
5. Tampon çözelti neyle oluşur? => Zayıf asit ve eşlenik bazı.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-kim' and name = 'Asit Baz Dengesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Böbrek taşları neden oluşur? Kazanda kireç nasıl birikir? Mağaralardaki sarkıt ve dikitler nasıl büyür? Suda az çözünen tuzlar, çözünürlük sınırına ulaşınca **çöker**. Bu konuda **çözünürlük çarpımı** ($K_{çç}$) kavramını, çözünürlük ile $K_{çç}$ arasındaki bağıntıyı, **ortak iyon etkisini**, **çökelme koşulunu** ($Q$ ile $K_{çç}$ karşılaştırması) ve **seçici çöktürmeyi** öğreneceksin. Konu, denge bilgisinin bir uygulamasıdır. $K_c$ yazabiliyorsan bu konuyu rahat öğrenirsin.

:::hedefler
1. Az çözünen bir tuzun $K_{çç}$ ifadesini yazmak.
2. $K_{çç}$ ile çözünürlüğü (mol/L) birbirine çevirmek.
3. Ortak iyonun çözünürlüğü azalttığını açıklamak.
4. $Q$ ile $K_{çç}$'yi karşılaştırarak çökelme olup olmayacağını bulmak.
5. Seçici çöktürmede hangi iyonun önce çöktüğünü belirlemek.
6. $\text{pH}$ ve kompleks oluşumunun çözünürlüğe etkisini yorumlamak.
:::

:::ipucu
$K_{çç}$ karşılaştırması **yalnızca aynı formül tipindeki** tuzlarda çözünürlük için doğrudur ($\text{AgCl}$ ile $\text{AgBr}$ gibi). Farklı tipte ($\text{AB}$ ile $\text{AB}_2$) tuzlarda önce **çözünürlüğü hesapla**, sonra karşılaştır.
:::

::video{id="3wup50JJ5_o" etiket="Konu anlatımı videosu" baslik="Çözünürlük Dengesi" kanal="Benim Hocam"}

## 1. Çözünürlük çarpımı

Suda az çözünen bir tuz doygun çözeltide dengededir. $\text{A}_m\text{B}_n(k)\rightleftharpoons m\text{A}^{n+}+n\text{B}^{m-}$ için:

$$K_{çç}=[\text{A}^{n+}]^m\,[\text{B}^{m-}]^n$$

Katı tuz ifadeye **yazılmaz**. $K_{çç}$ yalnızca **sıcaklığa** bağlıdır.

Çözünürlük $S$ (mol/L) ile $K_{çç}$ arasındaki bağıntı tuzun tipine göre değişir:

| Tuz tipi | Örnek | $K_{çç}$ |
| --- | --- | --- |
| AB | $\text{AgCl}$, $\text{BaSO}_4$ | $S^2$ |
| AB$_2$ ya da A$_2$B | $\text{CaF}_2$, $\text{Ag}_2\text{CrO}_4$ | $4S^3$ |
| AB$_3$ ya da A$_3$B | $\text{Al(OH)}_3$ | $27S^4$ |

**Örnek:** $\text{CaF}_2$ için $K_{çç}=4\cdot10^{-12}$ ise $4S^3=4\cdot10^{-12}$, $S^3=10^{-12}$, $S=10^{-4}\ \text{mol/L}$. Çözeltide $[\text{Ca}^{2+}]=10^{-4}$ ve $[\text{F}^-]=2\cdot10^{-4}\ \text{M}$ olur.

## 2. Ortak iyon etkisi

Doygun çözeltiye tuzla **ortak iyon** içeren başka bir madde eklenirse denge, Le Chatelier ilkesi gereği katı tuz yönüne kayar ve **çözünürlük azalır**. $K_{çç}$ aynı kalır.

$\text{AgCl}$ saf suda, $0{,}1\ \text{M}$ $\text{NaCl}$ çözeltisinde çok daha az çözünür. Ortak iyonu olmayan tuz ($\text{KNO}_3$) çözünürlüğü yaklaşık etkilemez.

**Örnek:** $K_{çç}(\text{AgCl})=10^{-10}$. $0{,}1\ \text{M}$ $\text{NaCl}$'de $[\text{Cl}^-]=0{,}1$ olduğundan $[\text{Ag}^+]=\dfrac{10^{-10}}{0{,}1}=10^{-9}$. Çözünürlük saf sudaki $10^{-5}$'ten $10^{-9}$'a düşer.

## 3. Çökelme koşulu

Karışımda iyonların anlık derişimleriyle **iyon çarpımı** ($Q$) hesaplanır:

- $Q<K_{çç}$: Doymamış, çökelme **olmaz**.
- $Q=K_{çç}$: Doygun.
- $Q>K_{çç}$: Aşırı doygun, **çökelme olur**.

::sim{tur="cozunurluk"}

**Dikkat:** İki çözelti karıştırılırken **derişimler seyrelir**. Önce karışımdaki yeni derişimleri bul.

**Örnek:** $K_{çç}(\text{AgCl})=10^{-10}$. $50\ \text{mL}$ $4\cdot10^{-5}\ \text{M}$ $\text{AgNO}_3$ ile $50\ \text{mL}$ $4\cdot10^{-5}\ \text{M}$ $\text{NaCl}$ karıştırılırsa hacim iki katına çıktığından $[\text{Ag}^+]=[\text{Cl}^-]=2\cdot10^{-5}$. $Q=(2\cdot10^{-5})^2=4\cdot10^{-10}>10^{-10}$ olduğundan $\text{AgCl}$ çöker.

## 4. Seçici çöktürme

İçinde birden fazla iyon bulunan çözeltiye çöktürücü ekleyince $Q$'su $K_{çç}$'yi **önce aşan** tuz önce çöker. Aynı tip tuzlarda $K_{çç}$'si küçük olan önce çöker. Böylece iyonlar birbirinden ayrılabilir.

## 5. Çözünürlüğü etkileyen diğer etkenler

- **Sıcaklık:** Çoğu tuzun çözünürlüğü sıcaklıkla artar ($K_{çç}$ değişir).
- **pH:** Zayıf asidin anyonunu içeren tuzlar ($\text{CaCO}_3$, $\text{Mg(OH)}_2$) asidik ortamda daha çok çözünür. Anyon asitle tepkimeye girip denge ürünler yönüne kayar.
- **Kompleks oluşumu:** $\text{AgCl}$ amonyak çözeltisinde $[\text{Ag(NH}_3)_2]^+$ kompleksi oluşturup çözünür.

## 6. Sık yapılan hatalar

- Katı tuzu $K_{çç}$ ifadesine yazmak.
- $S$ ile $K_{çç}$ ilişkisini tuz tipine bakmadan $S^2$ almak.
- Karıştırmada seyrelmeyi unutmak.
- Ortak iyon eklendiğinde $K_{çç}$'nin değiştiğini sanmak. Yalnızca çözünürlük değişir.
- $K_{çç}$'si küçük olan tuzun hep daha az çözündüğünü düşünmek. Tuz tipi farklıysa önce $S$ hesaplanır.

:::baglanti
Çözünürlük dengesi, **denge** konusunun uygulamasıdır ve **asit-baz** bilgisini kullanır. **Çözeltiler** konusundaki doygunluk kavramı burada hesaplanabilir hâle gelir. **Biyolojide** kemik ve diş mineralleri ($\text{Ca}_3(\text{PO}_4)_2$, hidroksiapatit), böbrek taşı oluşumu ve kanda kalsiyum dengesi çözünürlük dengesiyle ilgilidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $K_{çç}$ | İyon derişimlerinin çarpımı, katı yazılmaz |
| AB | $K_{çç}=S^2$ |
| AB$_2$ | $K_{çç}=4S^3$ |
| Ortak iyon | Çözünürlük azalır, $K_{çç}$ değişmez |
| $Q>K_{çç}$ | Çökelme olur |
| Karıştırma | Önce seyrelmeyi hesapla |
| Asidik ortam | Zayıf asit anyonlu tuz çok çözünür |

## Mini test

:::soru{cevap="C"}
$\text{CaF}_2$ katısının belirli sıcaklıktaki çözünürlük çarpımı $K_{çç}=4\cdot10^{-12}$'dir. Buna göre bu sıcaklıkta $\text{CaF}_2$'nin saf sudaki çözünürlüğü kaç mol/L'dir?

- A) $1\cdot10^{-12}$
- B) $2\cdot10^{-6}$
- C) $1\cdot10^{-4}$
- D) $1{,}6\cdot10^{-4}$
- E) $2\cdot10^{-4}$

---

1. $\text{CaF}_2\rightleftharpoons\text{Ca}^{2+}+2\text{F}^-$, $K_{çç}=[\text{Ca}^{2+}][\text{F}^-]^2=S\cdot(2S)^2=4S^3$.
2. $4S^3=4\cdot10^{-12}$ ve $S^3=10^{-12}$.
3. $S=10^{-4}\ \text{mol/L}$. Doğru cevap C.

Diğer şıklar: **$1\cdot10^{-12}$** küp kök alınmamış, $S^3$ değeri yazılmış / **$2\cdot10^{-6}$** karekök alınmış / **$1{,}6\cdot10^{-4}$** $4$ hesaba katılmadan $\sqrt[3]{K_{çç}}$ alınmış / **$2\cdot10^{-4}$** $\text{F}^-$ derişimi çözünürlük sanılmış.
:::

:::soru{cevap="A"}
$\text{AgCl}$ katısının çözünürlüğü aşağıdaki çözeltilerden hangisinde **en azdır**? (Aynı sıcaklıkta)

- A) $0{,}1\ \text{M}$ $\text{NaCl}$
- B) Saf su
- C) $0{,}1\ \text{M}$ $\text{KNO}_3$
- D) $0{,}1\ \text{M}$ $\text{NH}_3$
- E) $0{,}1\ \text{M}$ $\text{HNO}_3$

---

1. $\text{NaCl}$ çözeltisindeki $\text{Cl}^-$ iyonu $\text{AgCl}$ ile ortak iyondur.
2. Ortak iyon dengeyi katı yönüne kaydırır ve çözünürlük azalır. Doğru cevap A.

Diğer şıklar: **Saf su** referans değer, ortak iyon yok / **$\text{KNO}_3$** ortak iyonu yok, çözünürlük yaklaşık aynı kalır / **$\text{NH}_3$** $\text{Ag}^+$ ile kompleks oluşturup çözünürlüğü artırır / **$\text{HNO}_3$** ortak iyon içermez ve $\text{Cl}^-$ zayıf bazın anyonu değildir, etkisi yok.
:::

:::soru{cevap="B"}
$K_{çç}(\text{AgCl})=1\cdot10^{-10}$'dur. $50\ \text{mL}$ $4\cdot10^{-5}\ \text{M}$ $\text{AgNO}_3$ çözeltisi ile $50\ \text{mL}$ $4\cdot10^{-5}\ \text{M}$ $\text{NaCl}$ çözeltisi karıştırılıyor. Buna göre aşağıdakilerden hangisi doğrudur?

- A) Çökelme olmaz, $Q=4\cdot10^{-10}$
- B) Çökelme olur, $Q=4\cdot10^{-10}$
- C) Çökelme olmaz, $Q=1\cdot10^{-10}$
- D) Çökelme olur, $Q=1{,}6\cdot10^{-9}$
- E) Çökelme olmaz, $Q=1{,}6\cdot10^{-9}$

---

1. Hacim iki katına çıkınca derişimler yarıya iner: $[\text{Ag}^+]=[\text{Cl}^-]=2\cdot10^{-5}\ \text{M}$.
2. $Q=(2\cdot10^{-5})^2=4\cdot10^{-10}$.
3. $Q>K_{çç}$ olduğundan çökelme olur. Doğru cevap B.

Diğer şıklar: **A** $Q$ doğru ama $K_{çç}$'den büyük olduğu halde çökelme olmaz denmiş / **C** $Q=K_{çç}$ sanılmış / **D** ve **E** seyrelme hesaba katılmadan $Q=(4\cdot10^{-5})^2=1{,}6\cdot10^{-9}$ bulunmuş.
:::

:::soru{cevap="A"}
$\text{AgCl}(k)\rightleftharpoons\text{Ag}^+(aq)+\text{Cl}^-(aq)$ dengesindeki doygun çözeltiye sabit sıcaklıkta bir miktar katı $\text{AgNO}_3$ ekleniyor. Yeni dengede aşağıdakilerden hangisi gerçekleşir?

- A) $[\text{Cl}^-]$ azalır, $K_{çç}$ değişmez.
- B) $[\text{Cl}^-]$ artar, $K_{çç}$ artar.
- C) $[\text{Cl}^-]$ değişmez, $K_{çç}$ değişmez.
- D) $[\text{Cl}^-]$ azalır, $K_{çç}$ azalır.
- E) $[\text{Cl}^-]$ artar, $K_{çç}$ değişmez.

---

1. $\text{AgNO}_3$ çözününce $\text{Ag}^+$ derişimi artar, bu ortak iyon etkisidir.
2. Denge katı $\text{AgCl}$ oluşumu yönüne kayar, $[\text{Cl}^-]$ azalır.
3. Sıcaklık değişmediğinden $K_{çç}$ değişmez. Doğru cevap A.

Diğer şıklar: **B** ve **E** ortak iyon etkisi tersine yorumlanmış / **C** denge etkilenmiyor sanılmış / **D** $K_{çç}$ sıcaklıkla değişir, derişimle değil.
:::

## Kendini dene

:::dene
1. AB tipi tuzda $K_{çç}$ ile $S$ ilişkisi nedir? => $K_{çç}=S^2$.
2. Ortak iyon eklenince çözünürlük ne olur? => Azalır.
3. $Q>K_{çç}$ ise ne olur? => Çökelme olur.
4. $K_{çç}$ neye bağlıdır? => Yalnızca sıcaklığa.
5. İki çözelti karıştırılınca önce neye dikkat edilir? => Derişimlerin seyrelmesine.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-kim' and name = 'Çözünürlük Dengesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Telefonun pili elektriği nasıl üretir? Demir neden paslanır, gemilerin gövdesine neden çinko bloklar bağlanır? Altın kaplama takılar nasıl yapılır? Hepsi **elektron alışverişi**, yani yükseltgenme-indirgenme ile ilgilidir. Bu konuda **yükseltgenme basamaklarını**, **galvanik hücreleri** (piller), **standart elektrot potansiyellerini**, **hücre potansiyelini**, **elektrolizi**, **Faraday yasalarını** ve **korozyonu** öğreneceksin. AYT'de pil potansiyeli hesabı ve elektroliz hesabı her yıl sorulur.

:::hedefler
1. Yükseltgenme ve indirgenme tepkimelerini yükseltgenme basamağıyla belirlemek.
2. Galvanik hücrede anot, katot, elektron ve iyon yönünü göstermek.
3. Standart elektrot potansiyellerinden hücre potansiyelini hesaplamak ve tepkimenin kendiliğinden olup olmadığını söylemek.
4. Elektrolizde katot ve anotta oluşan ürünleri belirlemek.
5. Faraday yasasıyla elektrolizde toplanan madde miktarını hesaplamak.
6. Korozyonu ve katodik korumayı açıklamak.
:::

:::ipucu
Her şeyi tek cümleyle çöz: **anot yükseltgenir, katot indirgenir.** Pilde elektronlar **anottan katoda** akar. Hücre potansiyeli her zaman **$E^\circ_{katot}-E^\circ_{anot}$** ile bulunur ve pozitifse tepkime kendiliğinden olur.
:::

::video{id="JqZXt5wo9Do" etiket="Konu anlatımı videosu" baslik="Elektrotlar ve Elektrokimyasal Hücreler" kanal="Benim Hocam"}

## 1. Yükseltgenme ve indirgenme

- **Yükseltgenme:** Elektron vermek, yükseltgenme basamağının artması.
- **İndirgenme:** Elektron almak, yükseltgenme basamağının azalması.
- **İndirgen** madde yükseltgenir, **yükseltgen** madde indirgenir.

Yükseltgenme basamağı kuralları: Serbest elementte $0$, tek atomlu iyonda yükü, bileşiklerde $\text{H}$ genellikle $+1$, $\text{O}$ genellikle $-2$, nötr bileşikte toplam $0$.

**Örnek:** $\text{Zn}+\text{Cu}^{2+}\rightarrow\text{Zn}^{2+}+\text{Cu}$ tepkimesinde $\text{Zn}$ $0\rightarrow+2$ (yükseltgenir, indirgendir), $\text{Cu}^{2+}$ $+2\rightarrow0$ (indirgenir, yükseltgendir).

## 2. Galvanik hücre (pil)

Kendiliğinden gerçekleşen redoks tepkimesindeki elektron alışverişini dış devrede akım olarak veren düzeneğe **galvanik hücre** denir.

![Daniell pili: çinko anot, bakır katot, tuz köprüsü ve elektron akış yönü](/lessons/ayt-kim/pil-sema.svg "Elektronlar dış devrede anottan katoda akar. Tuz köprüsü iki yarı hücrenin yük dengesini korur")

**Daniell pili:** $\text{Zn}|\text{Zn}^{2+}\,||\,\text{Cu}^{2+}|\text{Cu}$

| | Anot | Katot |
| --- | --- | --- |
| Tepkime | Yükseltgenme | İndirgenme |
| Örnek | $\text{Zn}\rightarrow\text{Zn}^{2+}+2e^-$ | $\text{Cu}^{2+}+2e^-\rightarrow\text{Cu}$ |
| Elektrot kütlesi | Azalır | Artar |
| İşaret (pilde) | $-$ | $+$ |
| Çözeltideki iyon | $\text{Zn}^{2+}$ artar | $\text{Cu}^{2+}$ azalır |

- Elektronlar **dış devrede anottan katoda** akar.
- **Tuz köprüsü** iki yarı hücrenin elektrik yükünü dengeler: anyonlar anoda, katyonlar katoda doğru gider. Devreyi tamamlar.
- Pil tükenince yarı hücre derişimleri eşitlenir ve potansiyel sıfıra yaklaşır.

## 3. Standart elektrot potansiyelleri

Standart koşullarda ($25^\circ\text{C}$, $1\ \text{M}$, $1$ atm) bir yarı hücrenin indirgenme eğilimi **standart indirgenme potansiyeli** ($E^\circ$) ile verilir. Referans: $\text{H}^+/\text{H}_2$ yarı hücresi $0{,}00\ \text{V}$.

| İndirgenme yarı tepkimesi | $E^\circ$ (V) |
| --- | --- |
| $\text{Mg}^{2+}+2e^-\rightarrow\text{Mg}$ | $-2{,}37$ |
| $\text{Al}^{3+}+3e^-\rightarrow\text{Al}$ | $-1{,}66$ |
| $\text{Zn}^{2+}+2e^-\rightarrow\text{Zn}$ | $-0{,}76$ |
| $\text{Fe}^{2+}+2e^-\rightarrow\text{Fe}$ | $-0{,}44$ |
| $2\text{H}^++2e^-\rightarrow\text{H}_2$ | $0{,}00$ |
| $\text{Cu}^{2+}+2e^-\rightarrow\text{Cu}$ | $+0{,}34$ |
| $\text{Ag}^++e^-\rightarrow\text{Ag}$ | $+0{,}80$ |

$E^\circ$ büyük olan daha kolay **indirgenir** (güçlü yükseltgen), küçük olan daha kolay **yükseltgenir** (güçlü indirgen). Pilde potansiyeli büyük olan yarı hücre **katot** olur.

$$E^\circ_{hücre}=E^\circ_{katot}-E^\circ_{anot}$$

$E^\circ_{hücre}>0$ ise tepkime kendiliğinden olur. **Önemli:** Yarı tepkimeyi katsayıyla çarpsan bile $E^\circ$ **çarpılmaz**. Potansiyel madde miktarına bağlı olmayan bir niceliktir.

**Örnek:** $\text{Zn}|\text{Zn}^{2+}\,||\,\text{Cu}^{2+}|\text{Cu}$ pili için $E^\circ=0{,}34-(-0{,}76)=1{,}10\ \text{V}$.

Derişimler standart değilse **Nernst eşitliği** kullanılır: $E=E^\circ-\dfrac{0{,}059}{n}\log Q$. Ürün derişimi artınca ($Q$ büyüyünce) pil potansiyeli düşer.

::sim{tur="pil"}

## 4. Elektroliz

Kendiliğinden olmayan redoks tepkimesini **dış elektrik enerjisi** vererek gerçekleştirmeye **elektroliz** denir.

- **Katot** (indirgenme) $-$ kutuptur, **anot** (yükseltgenme) $+$ kutuptur. (Pilin tersi.)
- Erimiş tuzlarda tek tür katyon ve anyon bulunur: $\text{NaCl}(s)\rightarrow\text{Na}$ (katot), $\text{Cl}_2$ (anot).
- **Sulu çözeltide** su da yarışır. Aktif metaller ($\text{Na}^+$, $\text{Mg}^{2+}$, $\text{Al}^{3+}$) katotta indirgenmez, onların yerine su indirgenir: $2\text{H}_2\text{O}+2e^-\rightarrow\text{H}_2+2\text{OH}^-$. Anotta $\text{SO}_4^{2-}$ ve $\text{NO}_3^-$ yerine su yükseltgenir: $2\text{H}_2\text{O}\rightarrow\text{O}_2+4\text{H}^++4e^-$. Halojenürler ($\text{Cl}^-$) ise genellikle yükseltgenir.

**Uygulamalar:** Metallerin kaplanması (galvanizleme, gümüş kaplama), bakırın saflaştırılması, alüminyum üretimi, suyun ayrıştırılması.

## 5. Faraday yasası

Elektrolizde toplanan madde miktarı geçen **yük** ile orantılıdır. Yük $Q=I\cdot t$ (amper, saniye), bir mol elektronun yükü $96\,500\ \text{C}$.

$$n_{e^-}=\dfrac{I\cdot t}{96500},\qquad m=\dfrac{M\cdot I\cdot t}{z\cdot96500}$$

($z$: bir tanecik için alınan ya da verilen elektron sayısı).

**Örnek:** $\text{Cu}^{2+}$ çözeltisinden $1{,}93\ \text{A}$ akım $1000\ \text{s}$ geçiyor ($\text{Cu}=64$). $Q=1930\ \text{C}$, $n_{e^-}=0{,}02\ \text{mol}$, $n_{Cu}=0{,}01\ \text{mol}$ ve $m=0{,}64\ \text{g}$ bakır toplanır.

Aynı yük, seri bağlı hücrelerden geçtiği için hepsinde aynı mol elektron kullanılır.

## 6. Korozyon ve korunma

**Korozyon**, metalin çevresiyle redoks tepkimesine girerek bozunmasıdır. Demirin paslanması için oksijen ve su (nem) gerekir.

**Koruma yöntemleri:**

- **Boyama, yağlama, kaplama** (yüzeyi yalıtır).
- **Katodik koruma:** Demire, ondan **daha aktif** bir metal ($\text{Zn}$, $\text{Mg}$) bağlanır. Aktif metal yükseltgenerek tüketilir (kurban anot), demir korunur.
- **Galvanizleme:** Demiri çinkoyla kaplamak.

Demiri ondan **daha az aktif** bir metalle (kalay) kaplamak yüzey bozulana kadar korur. Çizilirse demir daha çabuk paslanır.

## 7. Sık yapılan hatalar

- Anot ve katodu pil ile elektrolizde karıştırmak. Anot her ikisinde de yükseltgenmedir ama işaretleri farklıdır.
- Hücre potansiyelini $E_{anot}-E_{katot}$ ile hesaplamak.
- Katsayıyla $E^\circ$'yi çarpmak.
- Sulu çözeltide $\text{Na}^+$'nın katotta indirgendiğini düşünmek.
- Faraday hesabında elektron sayısını ($z$) unutmak.
- Elektronların çözeltiden geçtiğini sanmak. Elektronlar telden, iyonlar çözeltiden hareket eder.

:::baglanti
Pil potansiyeli **denge sabitiyle** ilişkilidir. Kendiliğinden tepkimede $E^\circ>0$ ve $K>1$'dir. **Fizikte** akım, yük ve potansiyel fark kavramlarını burada kimyaya taşırsın. **Biyolojide** hücre zarında iyon dengeleri, sinir iletimi ve solunum zincirindeki elektron taşıma sistemi, birer redoks yoludur. **Karbon kimyasında** yanma tepkimeleri de birer yükseltgenmedir.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Anot / katot | Yükseltgenme / indirgenme |
| Pilde elektron | Anottan katoda (dış devre) |
| $E^\circ_{hücre}$ | $E^\circ_{katot}-E^\circ_{anot}$ |
| Katsayı | $E^\circ$ çarpılmaz |
| Elektroliz | Dış enerjiyle, katot $-$ anot $+$ |
| Faraday | $n_{e^-}=\dfrac{It}{96500}$ |
| Katodik koruma | Daha aktif metal bağlanır |

## Mini test

:::soru{cevap="C"}
$\text{Zn}(k)|\text{Zn}^{2+}(aq)\,||\,\text{Cu}^{2+}(aq)|\text{Cu}(k)$ pili çalışırken aşağıdakilerden hangisi doğrudur?

- A) $\text{Zn}$ elektrot katottur ve kütlesi artar.
- B) Elektronlar dış devrede $\text{Cu}$'dan $\text{Zn}$'ye akar.
- C) $\text{Cu}$ elektrot katottur ve kütlesi artar.
- D) Tuz köprüsündeki anyonlar katot yarı hücresine doğru gider.
- E) $\text{Zn}^{2+}$ derişimi azalır.

---

1. $\text{Zn}$ yükseltgenir ($\text{Zn}\rightarrow\text{Zn}^{2+}+2e^-$), anottur ve kütlesi azalır.
2. $\text{Cu}^{2+}$ indirgenir, $\text{Cu}$ elektrotta toplanır. $\text{Cu}$ katottur ve kütlesi artar. Doğru cevap C.

Diğer şıklar: **A** anot ve katot karıştırılmış / **B** elektronlar anottan katoda, yani $\text{Zn}$'den $\text{Cu}$'ya akar / **D** anyonlar anot yarı hücresine gider, çünkü orada $\text{Zn}^{2+}$ birikir / **E** anotta $\text{Zn}^{2+}$ derişimi artar.
:::

:::soru{cevap="B"}
Standart indirgenme potansiyelleri $E^\circ_{\text{Mg}^{2+}/\text{Mg}}=-2{,}37\ \text{V}$ ve $E^\circ_{\text{Ag}^+/\text{Ag}}=+0{,}80\ \text{V}$'tur. $\text{Mg}(k)|\text{Mg}^{2+}(aq)\,||\,\text{Ag}^+(aq)|\text{Ag}(k)$ pilinin standart hücre potansiyeli kaç V'tur?

- A) $1{,}57$
- B) $3{,}17$
- C) $3{,}97$
- D) $5{,}54$
- E) $6{,}34$

---

1. $\text{Mg}$ anot, $\text{Ag}$ katottur.
2. $E^\circ_{hücre}=E^\circ_{katot}-E^\circ_{anot}=0{,}80-(-2{,}37)=3{,}17\ \text{V}$. Gümüşün katsayısı ($2$) potansiyeli etkilemez. Doğru cevap B.

Diğer şıklar: **1,57** işaret hatasıyla $2{,}37-0{,}80$ alınmış / **3,97** gümüş potansiyeli $2$ ile çarpılmış / **5,54** magnezyum potansiyeli $2$ ile çarpılmış / **6,34** hücre potansiyeli $2$ ile çarpılmış.
:::

:::soru{cevap="B"}
$\text{Cu}^{2+}$ iyonları içeren çözeltiden $1{,}93\ \text{A}$ akım $1000$ saniye geçirildiğinde katotta kaç gram bakır toplanır? ($\text{Cu}=64\ \text{g/mol}$, $1$ mol elektron $=96\,500\ \text{C}$)

- A) $0{,}32$
- B) $0{,}64$
- C) $1{,}28$
- D) $6{,}4$
- E) $12{,}8$

---

1. Yük: $Q=I\cdot t=1{,}93\cdot1000=1930\ \text{C}$.
2. Elektron sayısı: $\dfrac{1930}{96500}=0{,}02\ \text{mol}$.
3. $\text{Cu}^{2+}+2e^-\rightarrow\text{Cu}$ olduğundan $0{,}01\ \text{mol}$ bakır, $m=0{,}01\cdot64=0{,}64\ \text{g}$. Doğru cevap B.

Diğer şıklar: **0,32** bakır için dört elektron alınmış / **1,28** bakır için bir elektron alınmış / **6,4** $96\,500$ yerine $9650$ alınmış / **12,8** hem $9650$ alınmış hem bir elektron kullanılmış.
:::

:::soru{cevap="A"}
Yeraltındaki demir boruyu paslanmaktan korumak için ona aşağıdaki metallerden hangisi bağlanmalıdır? ($E^\circ_{\text{Fe}^{2+}/\text{Fe}}=-0{,}44\ \text{V}$, $E^\circ_{\text{Mg}^{2+}/\text{Mg}}=-2{,}37\ \text{V}$, $E^\circ_{\text{Cu}^{2+}/\text{Cu}}=+0{,}34\ \text{V}$, $E^\circ_{\text{Ag}^+/\text{Ag}}=+0{,}80\ \text{V}$, $E^\circ_{\text{Pb}^{2+}/\text{Pb}}=-0{,}13\ \text{V}$, $E^\circ_{\text{Sn}^{2+}/\text{Sn}}=-0{,}14\ \text{V}$)

- A) $\text{Mg}$
- B) $\text{Cu}$
- C) $\text{Ag}$
- D) $\text{Pb}$
- E) $\text{Sn}$

---

1. Katodik korumada bağlanan metal demirden daha kolay yükseltgenmelidir, yani indirgenme potansiyeli demirinkinden küçük olmalıdır.
2. Yalnızca $\text{Mg}$ ($-2{,}37<-0{,}44$) bu koşulu sağlar, kurban anot olur ve demir korunur. Doğru cevap A.

Diğer şıklar: **Cu** ve **Ag** demirden daha az aktif, demirin kendisi yükseltgenir ve daha hızlı paslanır / **Pb** ve **Sn** potansiyelleri $-0{,}44$'ten büyük, demirden daha az aktif.
:::

## Kendini dene

:::dene
1. Anotta hangi olay gerçekleşir? => Yükseltgenme.
2. Pilde elektronlar hangi yönde akar? => Anottan katoda, dış devreden.
3. Hücre potansiyeli nasıl hesaplanır? => $E^\circ_{katot}-E^\circ_{anot}$.
4. Yarı tepkimeyi katsayıyla çarparsak $E^\circ$ ne olur? => Değişmez.
5. Katodik korumada demire nasıl bir metal bağlanır? => Demirden daha aktif.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-kim' and name = 'Kimya ve Elektrik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Canlı vücudunun, plastiklerin, ilaçların, yakıtların ve gıdaların ortak yapı taşı nedir? **Karbon.** Bilinen bileşiklerin büyük çoğunluğu karbon içerir. Bunun nedeni karbonun dört bağ yapabilmesi, kendi atomlarıyla zincir, dal ve halka oluşturabilmesidir. Bu konuda **organik ve anorganik bileşik** ayrımını, karbonun **hibritleşmesini** (sp³, sp², sp), **sigma ve pi bağlarını**, **molekül geometrisini**, **formül türlerini** ve **izomeri** kavramını öğreneceksin. Sonraki konu olan Organik Bileşikler'in temelini burada atıyorsun.

:::hedefler
1. Organik ve anorganik bileşikleri ayırt etmek.
2. Karbonun değerliğini ve bağ yapma özelliklerini açıklamak.
3. sp³, sp² ve sp hibritleşmelerini, bağ açılarını ve geometrilerini eşleştirmek.
4. Bir molekülde sigma ve pi bağlarını saymak.
5. Basit formülden molekül formülünü bulmak.
6. Yapı izomerlerini tanımak.
:::

:::ipucu
Hibritleşmeyi **bağ türüne** bakarak bul: Karbonun etrafında yalnızca **tekli bağ** varsa $sp^3$, bir **çift bağ** varsa $sp^2$, bir **üçlü bağ** (ya da iki çift bağ) varsa $sp$. Sigma sayısı: Her bağda bir sigma vardır. Çift bağda bir sigma ve bir pi, üçlü bağda bir sigma ve iki pi bulunur.
:::

::video{id="ty63xZEnl60" etiket="Konu anlatımı videosu" baslik="Hibritleşme ve Molekül Geometrisi" kanal="Benim Hocam"}

## 1. Organik ve anorganik bileşikler

**Organik bileşikler** karbon ve genellikle hidrojen içeren bileşiklerdir. Çoğunda $\text{C-H}$ bağı bulunur, bağlar **kovalenttir**, çoğu yanıcıdır ve suda iyi çözünmez. **Anorganik bileşikler** ise genellikle karbon içermeyenlerdir. Ancak şu karbonlu bileşikler anorganik sayılır: $\text{CO}$, $\text{CO}_2$, karbonatlar ($\text{CaCO}_3$), bikarbonatlar, siyanürler ($\text{KCN}$) ve karbürler.

| | Organik | Anorganik |
| --- | --- | --- |
| Bağ | Kovalent | Çoğunlukla iyonik |
| Suda çözünme | Çoğu çözünmez | Çoğu çözünür |
| Yanma | Yanıcı | Çoğu yanmaz |
| Erime-kaynama | Düşük | Yüksek (iyonikler) |
| Tepkime hızı | Yavaş | Hızlı |

Organik bileşikler **doğal** (petrol, şeker, protein) ya da **sentetik** (plastik, ilaç, boya) olabilir. Doğal organik bileşiklerin laboratuvarda sentezlenmesi 1828'de Wöhler'in üreyi sentezlemesiyle başladı.

## 2. Karbonun bağ yapısı

Karbon ($Z=6$) son kabukta $4$ elektrona sahiptir ve $4$ bağ yapar. Hem elektron almaz hem vermez, bağları **paylaşarak** yapar.

Karbonu ayıran özellikler:

- Kendi atomlarıyla uzun **zincir**, **dal** ve **halka** oluşturur.
- Tekli, ikili ve üçlü bağ yapar.
- $\text{H}$, $\text{O}$, $\text{N}$, halojenlerle kararlı bağ yapar.

## 3. Hibritleşme

Karbon, bağ yaparken orbitallerini karıştırır, buna **hibritleşme** denir. Hibrit orbital sayısı = sigma bağı sayısı + ortaklanmamış elektron çifti sayısı.

| Hibritleşme | Bağ yapısı | Geometri | Bağ açısı | Örnek |
| --- | --- | --- | --- | --- |
| $sp^3$ | 4 tekli bağ | Dörtyüzlü | $109{,}5^\circ$ | $\text{CH}_4$, $\text{C}_2\text{H}_6$ |
| $sp^2$ | 1 çift bağ | Düzlemsel üçgen | $120^\circ$ | $\text{C}_2\text{H}_4$, $\text{C}_6\text{H}_6$ |
| $sp$ | 1 üçlü ya da 2 çift bağ | Doğrusal | $180^\circ$ | $\text{C}_2\text{H}_2$, $\text{CO}_2$ |

![sp3, sp2 ve sp hibritleşmesi: metan, eten ve etin molekül geometrileri](/lessons/ayt-kim/hibritlesme.svg "Karbonun hibritleşmesi bağ açısını ve molekülün şeklini belirler")

**Sigma ($\sigma$) bağı:** Orbitallerin uç uca örtüşmesiyle oluşur, güçlüdür, dönmeye izin verir. **Pi ($\pi$) bağı:** Yan yana örtüşmeyle oluşur, daha zayıftır ve çift/üçlü bağlarda vardır. Pi bağı olan bileşikler daha **tepkimeye yatkındır** (katılma tepkimeleri).

**Örnek:** $\text{CH}_2=\text{CH}_2$ (eten) molekülünde $4$ tane $\text{C-H}$ ve $1$ tane $\text{C=C}$'nin sigma kısmı olmak üzere $5$ sigma, $\text{C=C}$'nin pi kısmı olmak üzere $1$ pi bağı vardır. Karbonlar $sp^2$ hibritleşmesi yapar.

## 4. Formül türleri

- **Basit (kaba) formül:** Atomların en sade tam sayı oranı. Glikoz için $\text{CH}_2\text{O}$.
- **Molekül formülü:** Molekülde gerçek atom sayısı. Glikoz için $\text{C}_6\text{H}_{12}\text{O}_6$. $n=\dfrac{M}{\text{basit formül kütlesi}}$.
- **Yapı (açık) formülü:** Atomların bağlanma düzeni.
- **Düzenlenmiş (yarı yapısal) formül:** $\text{CH}_3\text{CH}_2\text{OH}$ gibi.

**Örnek:** Basit formülü $\text{CH}_2\text{O}$ ($30\ \text{g/mol}$), mol kütlesi $180\ \text{g/mol}$ olan bileşikte $n=\dfrac{180}{30}=6$, molekül formülü $\text{C}_6\text{H}_{12}\text{O}_6$.

## 5. İzomeri

Molekül formülleri aynı, yapıları (ve özellikleri) farklı bileşiklere **izomer** denir.

- **Yapı izomerisi:** Atomların bağlanma sırası farklıdır. $\text{C}_4\text{H}_{10}$: bütan ve izobütan (2-metilpropan). $\text{C}_2\text{H}_6\text{O}$: etanol ($\text{CH}_3\text{CH}_2\text{OH}$) ve dimetil eter ($\text{CH}_3\text{OCH}_3$).
- İzomerlerin fiziksel ve kimyasal özellikleri farklıdır.
- Karbon sayısı arttıkça izomer sayısı hızla artar: $\text{C}_4\text{H}_{10}$: $2$, $\text{C}_5\text{H}_{12}$: $3$, $\text{C}_6\text{H}_{14}$: $5$.

## 6. Sık yapılan hatalar

- $\text{CO}_2$ ve $\text{CaCO}_3$ gibi karbonlu bileşikleri organik saymak.
- Hibritleşmeyi bağ sayısıyla değil atom sayısıyla bulmaya çalışmak.
- Çift bağda iki sigma olduğunu düşünmek. Çift bağda $1$ sigma ve $1$ pi vardır.
- Molekül formülü ve basit formülü karıştırmak.
- Homolog bileşikleri ($\text{CH}_4$ ve $\text{C}_2\text{H}_6$) izomer sanmak. Formülleri farklıdır.

:::baglanti
Karbon kimyası, sonraki **Organik Bileşikler** konusunun temelidir. **Biyolojide** karbonhidrat, yağ ve proteinler karbon iskeletli moleküllerdir. **Mol kavramı** burada basit formülden molekül formülüne geçişte kullanılır. **Atom yapısı** konusundaki orbital bilgisi, hibritleşmenin temelini oluşturur.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Karbon | 4 bağ yapar, zincir ve halka kurar |
| $sp^3$ | Tekli bağlar, $109{,}5^\circ$ |
| $sp^2$ | Bir çift bağ, $120^\circ$ |
| $sp$ | Üçlü bağ, $180^\circ$ |
| Çift bağ | $1\ \sigma+1\ \pi$ |
| Molekül formülü | $n\times$ basit formül |
| İzomer | Aynı formül, farklı yapı |

## Mini test

:::soru{cevap="C"}
Eten ($\text{C}_2\text{H}_4$) molekülü için aşağıdakilerden hangisi doğrudur?

- A) $4$ sigma, $2$ pi bağı vardır, karbonlar $sp$ hibritleşmesi yapar.
- B) $6$ sigma bağı vardır, pi bağı yoktur, karbonlar $sp^3$ hibritleşmesi yapar.
- C) $5$ sigma, $1$ pi bağı vardır, karbonlar $sp^2$ hibritleşmesi yapar.
- D) $3$ sigma, $2$ pi bağı vardır, karbonlar $sp$ hibritleşmesi yapar.
- E) $5$ sigma, $1$ pi bağı vardır, karbonlar $sp^3$ hibritleşmesi yapar.

---

1. Eten $\text{CH}_2=\text{CH}_2$'dir. Dört $\text{C-H}$ bağı ve bir $\text{C=C}$ bağı vardır.
2. $\text{C=C}$ çift bağında bir sigma ve bir pi bulunur. Toplam $4+1=5$ sigma, $1$ pi.
3. Her karbonun etrafında bir çift bağ olduğu için $sp^2$ hibritleşmesi görülür. Doğru cevap C.

Diğer şıklar: **A** ve **D** üçlü bağ özelliği (etin) verilmiş / **B** etan özelliği verilmiş / **E** sigma ve pi doğru ama hibritleşme tekli bağlı karbon gibi $sp^3$ alınmış.
:::

:::soru{cevap="D"}
Basit formülü $\text{CH}_2\text{O}$ olan bir bileşiğin mol kütlesi $180\ \text{g/mol}$'dür. Bu bileşiğin molekül formülü aşağıdakilerden hangisidir? ($\text{H}=1$, $\text{C}=12$, $\text{O}=16$)

- A) $\text{CH}_2\text{O}$
- B) $\text{C}_2\text{H}_4\text{O}_2$
- C) $\text{C}_3\text{H}_6\text{O}_3$
- D) $\text{C}_6\text{H}_{12}\text{O}_6$
- E) $\text{C}_{12}\text{H}_{24}\text{O}_{12}$

---

1. Basit formül kütlesi: $12+2+16=30\ \text{g/mol}$.
2. $n=\dfrac{180}{30}=6$.
3. Molekül formülü $(\text{CH}_2\text{O})_6=\text{C}_6\text{H}_{12}\text{O}_6$. Doğru cevap D.

Diğer şıklar: **$\text{CH}_2\text{O}$** basit formül molekül formülü sanılmış / **$\text{C}_2\text{H}_4\text{O}_2$** $n=2$, mol kütlesi $60$ / **$\text{C}_3\text{H}_6\text{O}_3$** $n=3$, mol kütlesi $90$ / **$\text{C}_{12}\text{H}_{24}\text{O}_{12}$** $n=12$, mol kütlesi $360$.
:::

:::soru{cevap="A"}
Aşağıdaki bileşik çiftlerinden hangisi birbirinin yapı izomeridir?

- A) $\text{CH}_3\text{CH}_2\text{OH}$ ve $\text{CH}_3\text{OCH}_3$
- B) $\text{CH}_4$ ve $\text{C}_2\text{H}_6$
- C) $\text{C}_2\text{H}_4$ ve $\text{C}_2\text{H}_6$
- D) $\text{CH}_3\text{COOH}$ ve $\text{CH}_3\text{CHO}$
- E) $\text{C}_2\text{H}_5\text{OH}$ ve $\text{C}_2\text{H}_5\text{Cl}$

---

1. İzomerlerin molekül formülü aynı, yapıları farklıdır.
2. Etanol ve dimetil eterin molekül formülü $\text{C}_2\text{H}_6\text{O}$'dur ama fonksiyonel grupları farklıdır. Doğru cevap A.

Diğer şıklar: **$\text{CH}_4$ ve $\text{C}_2\text{H}_6$** formülleri farklı (homolog) / **$\text{C}_2\text{H}_4$ ve $\text{C}_2\text{H}_6$** hidrojen sayıları farklı / **$\text{CH}_3\text{COOH}$ ve $\text{CH}_3\text{CHO}$** $\text{C}_2\text{H}_4\text{O}_2$ ve $\text{C}_2\text{H}_4\text{O}$, farklı formül / **$\text{C}_2\text{H}_5\text{OH}$ ve $\text{C}_2\text{H}_5\text{Cl}$** farklı elementler.
:::

:::soru{cevap="C"}
Normal koşullarda $0{,}1$ mol propan ($\text{C}_3\text{H}_8$) gazı oksijende tamamen yakıldığında kaç litre $\text{CO}_2$ gazı oluşur? ($1$ mol gaz $=22{,}4\ \text{L}$)

- A) $2{,}24$
- B) $4{,}48$
- C) $6{,}72$
- D) $8{,}96$
- E) $11{,}2$

---

1. $\text{C}_3\text{H}_8+5\text{O}_2\rightarrow3\text{CO}_2+4\text{H}_2\text{O}$.
2. $0{,}1$ mol propandan $0{,}3$ mol $\text{CO}_2$ oluşur.
3. $V=0{,}3\cdot22{,}4=6{,}72\ \text{L}$. Doğru cevap C.

Diğer şıklar: **2,24** propanın kendi mol sayısı alınmış / **4,48** iki karbon sanılmış / **8,96** $\text{H}_2\text{O}$'nun mol sayısı ($0{,}4$) kullanılmış / **11,2** harcanan oksijen hacmi hesaplanmış.
:::

## Kendini dene

:::dene
1. Karbon kaç bağ yapar? => Dört.
2. Çift bağlı karbon hangi hibritleşmeyi yapar? => $sp^2$.
3. Çift bağda kaç sigma ve kaç pi vardır? => Bir sigma, bir pi.
4. $\text{CO}_2$ organik midir? => Hayır, anorganiktir.
5. Aynı molekül formülü, farklı yapı için ne denir? => İzomer.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-kim' and name = 'Karbon Kimyasına Giriş'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Doğal gaz, alkollü dezenfektan, sirke, muz kokusu ve plastik poşet aynı bilimin konusudur. Hepsi karbon iskeletli ve üzerinde farklı **fonksiyonel gruplar** taşıyan **organik bileşiklerdir**. Bu konuda **hidrokarbonları** (alkan, alken, alkin, aromatik), **fonksiyonel gruplu bileşikleri** (alkol, eter, aldehit, keton, karboksilik asit, ester, amin), **adlandırmayı**, **fiziksel özellikleri**, **temel tepkimeleri** (yanma, katılma, yer değiştirme, yükseltgenme, esterleşme) ve **polimerleri** öğreneceksin.

:::hedefler
1. Alkan, alken ve alkinleri genel formüllerinden ayırt etmek.
2. Basit bileşikleri IUPAC kurallarına göre adlandırmak.
3. Fonksiyonel grupları ve bileşik sınıflarını eşleştirmek.
4. Kaynama noktasını hidrojen bağı ve molekül kütlesine göre sıralamak.
5. Yanma, katılma, yer değiştirme ve esterleşme tepkimelerinin ürünlerini yazmak.
6. Polimerleşmeyi ve yaygın polimerleri tanımak.
:::

:::ipucu
Adlandırmada sırayla: **en uzun zinciri bul**, zinciri **dallara en yakın uçtan numaralandır**, dalların adını ve yerini yaz, sonra zincirin adını ekle. Fonksiyonel grup önceliklidir ve **grubun bulunduğu karbon** en küçük numarayı almalıdır.
:::

::video{id="1A6R2WAXYGA" etiket="Konu anlatımı videosu" baslik="Organik Bileşikler" kanal="Ferrum"}

## 1. Hidrokarbonlar

Yalnızca $\text{C}$ ve $\text{H}$ içeren bileşiklerdir.

| Sınıf | Bağ | Genel formül | Örnek |
| --- | --- | --- | --- |
| Alkan | Tekli (doymuş) | $\text{C}_n\text{H}_{2n+2}$ | $\text{CH}_4$ metan |
| Alken | Bir çift bağ | $\text{C}_n\text{H}_{2n}$ | $\text{C}_2\text{H}_4$ eten |
| Alkin | Bir üçlü bağ | $\text{C}_n\text{H}_{2n-2}$ | $\text{C}_2\text{H}_2$ etin |
| Aromatik | Halkada değişen çift bağ | | $\text{C}_6\text{H}_6$ benzen |

**İlk on alkan:** metan, etan, propan, bütan, pentan, heksan, heptan, oktan, nonan, dekan.

**Homolog seri:** Ardışık üyeler arasında $\text{-CH}_2-$ farkı bulunur. Kimyasal özellikleri benzer, fiziksel özellikleri kademeli değişir.

**Adlandırma örneği:** $\text{CH}_3-\text{CH}(\text{CH}_3)-\text{CH}_2-\text{CH}_3$ en uzun zincir $4$ karbonlu (bütan). $\text{-CH}_3$ dalı soldan ikinci karbonda: **2-metilbütan**. Çift bağlıda zincir adı "-en", üçlü bağlıda "-in" ile biter ve bağın yeri numaralanır (**1-büten**).

## 2. Fonksiyonel gruplu bileşikler

| Sınıf | Fonksiyonel grup | Örnek |
| --- | --- | --- |
| Alkol | $\text{-OH}$ | Etanol $\text{CH}_3\text{CH}_2\text{OH}$ |
| Eter | $\text{-O-}$ | Dimetil eter $\text{CH}_3\text{OCH}_3$ |
| Aldehit | $\text{-CHO}$ | Etanal $\text{CH}_3\text{CHO}$ |
| Keton | $\text{-CO-}$ | Propanon $\text{CH}_3\text{COCH}_3$ |
| Karboksilik asit | $\text{-COOH}$ | Etanoik asit $\text{CH}_3\text{COOH}$ |
| Ester | $\text{-COO-}$ | Etil asetat $\text{CH}_3\text{COOC}_2\text{H}_5$ |
| Amin | $\text{-NH}_2$ | Metilamin $\text{CH}_3\text{NH}_2$ |

## 3. Fiziksel özellikler

Kaynama noktasını **molekül kütlesi** ve **moleküller arası kuvvetler** belirler:

1. **Hidrojen bağı** yapabilenler ($\text{-OH}$, $\text{-COOH}$, $\text{-NH}_2$) çok yüksek kaynar.
2. **Dipol-dipol** (eter, aldehit, keton, ester) orta düzeydedir.
3. **Apolar** hidrokarbonlar (yalnızca London kuvveti) en düşüktür.
4. Aynı sınıfta kütle ve zincir uzunluğu arttıkça kaynama noktası artar. Dallanma kaynama noktasını **düşürür**.

**Örnek:** Molekül kütleleri yaklaşık $46$ olan etanol (H bağı), dimetil eter (dipol) ve propan (apolar) için kaynama noktaları: propan $(-42^\circ\text{C})<$ dimetil eter $(-24^\circ\text{C})<$ etanol $(78^\circ\text{C})$.

**Çözünürlük:** Küçük alkoller, asitler suda her oranda karışır (H bağı). Karbon sayısı arttıkça apolar kısım büyür ve çözünürlük azalır. Hidrokarbonlar suda çözünmez.

## 4. Temel tepkimeler

1. **Yanma:** Tam yanmada $\text{CO}_2$ ve $\text{H}_2\text{O}$ oluşur. Eksik yanmada $\text{CO}$ ve $\text{C}$ (kurum) da çıkar.
2. **Katılma:** Doymamış bileşiklere ($\text{C=C}$, $\text{C}\equiv\text{C}$) $\text{H}_2$, $\text{Br}_2$, $\text{HCl}$, $\text{H}_2\text{O}$ katılır: $\text{CH}_2=\text{CH}_2+\text{Br}_2\rightarrow\text{CH}_2\text{Br}-\text{CH}_2\text{Br}$. Alkenler **bromlu suyun** kahverengi rengini giderir. Bu, doymamışlık deneyidir.
3. **Yer değiştirme (sübstitüsyon):** Alkanlar ışıkta halojenle tepkime verir: $\text{CH}_4+\text{Cl}_2\rightarrow\text{CH}_3\text{Cl}+\text{HCl}$.
4. **Yükseltgenme:** Birincil alkol $\rightarrow$ aldehit $\rightarrow$ karboksilik asit. İkincil alkol $\rightarrow$ keton.
5. **Esterleşme:** Asit + alkol $\rightleftharpoons$ ester + su. Güçlü asit (katalizör) bulunur. Esterler meyve kokularıdır.
6. **Hidroliz ve sabunlaşma:** Ester + baz $\rightarrow$ alkol + karboksilat tuzu. Yağlar bazla tepkimeye girip **sabun** ve gliserini verir.

## 5. Polimerler

**Polimer**, küçük birimlerin (monomer) tekrarlanarak bağlanmasıyla oluşan büyük moleküldür.

- **Katılma polimerleşmesi:** Çift bağlı monomerler birleşir. Eten $\rightarrow$ polietilen, vinil klorür $\rightarrow$ PVC, stiren $\rightarrow$ polistiren.
- **Yoğunlaşma (kondenzasyon) polimerleşmesi:** Her bağlanmada küçük bir molekül (genellikle su) çıkar. Poliamid (naylon) ve polyester buna örnektir.
- **Doğal polimerler:** Nişasta, selüloz, protein, DNA, doğal kauçuk.

## 6. Sık yapılan hatalar

- Adlandırmada en uzun zinciri değil, kâğıtta düz yazılan zinciri seçmek.
- Fonksiyonel grup varken numaralamayı dallardan başlatmak.
- Kaynama noktası sıralamasında yalnızca kütleye bakıp H bağını unutmak.
- Alkanların katılma tepkimesi verdiğini düşünmek. Alkanlar yer değiştirir.
- Esterleşmede suyun kaynağını karıştırmak. Su asitten $\text{-OH}$ ve alkolden $\text{H}$ ile oluşur.

:::baglanti
Organik bileşikler, **Karbon Kimyasına Giriş** bilginin devamıdır. **Enerji kaynakları** konusunda yakıtların (doğal gaz, benzin, biyodizel) hepsi bu bileşiklerdir. **Biyolojide** karbonhidrat, yağ ve protein sınıflarının tamamı fonksiyonel gruplu organik molekül ailesidir. **Asit-baz** konusundaki karboksilik asitler zayıf asittir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Alkan | $\text{C}_n\text{H}_{2n+2}$, yer değiştirme |
| Alken | $\text{C}_n\text{H}_{2n}$, katılma |
| Alkin | $\text{C}_n\text{H}_{2n-2}$, katılma |
| Kaynama noktası | H bağı $>$ dipol $>$ apolar |
| Alkol yükseltgenmesi | Alkol $\rightarrow$ aldehit $\rightarrow$ asit |
| Esterleşme | Asit + alkol |
| Polimer | Monomer tekrarı |

## Mini test

:::soru{cevap="B"}
$\text{CH}_3-\text{CH}(\text{CH}_3)-\text{CH}_2-\text{CH}_3$ bileşiğinin IUPAC adı aşağıdakilerden hangisidir?

- A) Bütan
- B) 2-Metilbütan
- C) 2,2-Dimetilbütan
- D) 3-Metilbütan
- E) Pentan

---

1. En uzun zincir $4$ karbonludur: bütan.
2. $\text{-CH}_3$ dalı ucundan itibaren ikinci karbondadır. Dalın numarası en küçük olacak şekilde numaralandırılır.
3. Ad **2-metilbütan**. Doğru cevap B.

Diğer şıklar: **Bütan** dal atlanmış / **2,2-Dimetilbütan** iki dal sanılmış / **3-Metilbütan** numaralama yanlış uçtan yapılmış / **Pentan** toplam karbon sayısı zincir sanılmış.
:::

:::soru{cevap="B"}
Fonksiyonel grup ve bileşik sınıfı eşleşmelerinden hangisi doğrudur?

- A) $\text{-OH}$ eter
- B) $\text{-COOH}$ karboksilik asit
- C) $\text{-CO-}$ aldehit
- D) $\text{-COO-}$ keton
- E) $\text{-O-}$ alkol

---

1. $\text{-COOH}$ karboksil grubudur ve karboksilik asitlerin fonksiyonel grubudur. Doğru cevap B.

Diğer şıklar: **$\text{-OH}$** alkoldür, eter değil / **$\text{-CO-}$** ketondur, aldehit uçta $\text{-CHO}$ taşır / **$\text{-COO-}$** esterdir / **$\text{-O-}$** eterdir.
:::

:::soru{cevap="A"}
$\text{CH}_2=\text{CH}_2$ ile $\text{Br}_2$ arasındaki tepkime hakkında aşağıdakilerden hangisi doğrudur?

- A) Katılma tepkimesidir, 1,2-dibromoetan oluşur.
- B) Yer değiştirme tepkimesidir, bromoetan oluşur.
- C) Yanma tepkimesidir, $\text{CO}_2$ ve $\text{H}_2\text{O}$ oluşur.
- D) Ayrışma tepkimesidir, etin oluşur.
- E) Polimerleşme tepkimesidir, polietilen oluşur.

---

1. Eten çift bağ içerir, doymamış bileşiktir.
2. Doymamış bileşiklere $\text{Br}_2$ **katılır**: $\text{CH}_2=\text{CH}_2+\text{Br}_2\rightarrow\text{CH}_2\text{Br}-\text{CH}_2\text{Br}$.
3. Ürün 1,2-dibromoetandır. Doğru cevap A.

Diğer şıklar: **B** yer değiştirme alkanların tepkimesi / **C** yanma için oksijen gerekir / **D** ayrışma değil katılma olur / **E** polimerleşme için çok sayıda monomer ve katalizör gerekir.
:::

:::soru{cevap="C"}
Mol kütleleri birbirine yakın olan propan ($\text{C}_3\text{H}_8$), dimetil eter ($\text{CH}_3\text{OCH}_3$) ve etanol ($\text{C}_2\text{H}_5\text{OH}$) bileşiklerinin kaynama noktaları arasındaki sıralama aşağıdakilerden hangisidir?

- A) $\text{CH}_3\text{OCH}_3<\text{C}_3\text{H}_8<\text{C}_2\text{H}_5\text{OH}$
- B) $\text{C}_2\text{H}_5\text{OH}<\text{CH}_3\text{OCH}_3<\text{C}_3\text{H}_8$
- C) $\text{C}_3\text{H}_8<\text{CH}_3\text{OCH}_3<\text{C}_2\text{H}_5\text{OH}$
- D) $\text{C}_3\text{H}_8<\text{C}_2\text{H}_5\text{OH}<\text{CH}_3\text{OCH}_3$
- E) $\text{C}_2\text{H}_5\text{OH}<\text{C}_3\text{H}_8<\text{CH}_3\text{OCH}_3$

---

1. Etanol hidrojen bağı yapar, kaynama noktası en yüksektir.
2. Dimetil eter polardır (dipol-dipol), propan apolardır (yalnızca London kuvveti).
3. Sıralama $\text{C}_3\text{H}_8<\text{CH}_3\text{OCH}_3<\text{C}_2\text{H}_5\text{OH}$. Doğru cevap C.

Diğer şıklar: **A** eter ile propan yer değiştirmiş / **B** sıralama tamamen tersine çevrilmiş / **D** eter ile alkol yer değiştirmiş, hidrojen bağı atlanmış / **E** alkol en düşük sanılmış.
:::

## Kendini dene

:::dene
1. Alkenlerin genel formülü nedir? => $\text{C}_n\text{H}_{2n}$.
2. Bromlu suyu hangi hidrokarbon grubu renksizleştirir? => Doymamış olanlar (alken, alkin).
3. Birincil alkol yükseltgenince sırayla ne oluşur? => Aldehit, sonra karboksilik asit.
4. Asit ile alkolün tepkimesinin adı nedir? => Esterleşme.
5. Kaynama noktasını en çok artıran moleküller arası kuvvet hangisidir? => Hidrojen bağı.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-kim' and name = 'Organik Bileşikler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Evinizdeki elektrik, arabanızın yakıtı ve telefonunuzun pili hangi kaynaklardan gelir? Bu kaynakların çevreye bedeli nedir? Bilim ve teknoloji bu bedeli nasıl azaltmaya çalışır? Bu konuda **enerji kaynaklarını** (fosil, yenilenebilir, nükleer), **yakıtların ısıl değerini**, **hidrojen ve yakıt pillerini**, enerji üretiminin **çevre etkilerini** (sera etkisi, asit yağmurları, ozon incelmesi) ve **kimyanın bilimsel ve teknolojik gelişmelerdeki yerini** (nanoteknoloji, polimerler, kompozitler, yarı iletkenler, yeşil kimya) öğreneceksin. Bu konu sorularında ezber değil, kavram yorumlama ve basit hesap istenir.

:::hedefler
1. Fosil, yenilenebilir ve nükleer enerji kaynaklarını sınıflandırmak ve karşılaştırmak.
2. Isıl değeri kullanarak yakıt miktarı ya da elde edilen enerjiyi hesaplamak.
3. Fisyon ve füzyonu ayırt etmek.
4. Sera etkisi, asit yağmuru ve ozon incelmesinin nedenlerini eşleştirmek.
5. Hidrojen yakıt pilinin çalışmasını ve çevre avantajını açıklamak.
6. Nanoteknoloji, kompozit, yarı iletken ve yeşil kimya gibi kavramları tanımak.
:::

:::ipucu
Çevre sorularında **gaz ile sorunu** eşleştir: $\text{CO}_2$ ve $\text{CH}_4$ sera etkisi, $\text{SO}_2$ ve $\text{NO}_x$ asit yağmuru, **CFC** ozon incelmesi. Enerji kaynaklarında ise ayırıcı soru: **Tükenir mi?** ve **Karbon salar mı?**
:::

::video{id="e192O3CesWc" etiket="Konu anlatımı videosu" baslik="Enerji Kaynakları ve Bilimsel Gelişmeler" kanal="Ferrum"}

## 1. Enerji kaynakları

| Grup | Örnekler | Özellik |
| --- | --- | --- |
| Fosil yakıtlar | Kömür, petrol, doğal gaz | Tükenir, yanınca $\text{CO}_2$ salar, çoğu zaman yakıtın ısıl değeri yüksektir |
| Yenilenebilir | Güneş, rüzgâr, hidroelektrik, jeotermal, biyokütle | Tükenmez ya da kısa sürede yenilenir, düşük salınım |
| Nükleer | Uranyum fisyonu | Çok büyük enerji, $\text{CO}_2$ salmaz, radyoaktif atık sorunu |
| Hidrojen | $\text{H}_2$ | Yakıt, birincil kaynak değil, üretilmesi gerekir |

**Biyokütle ve biyoyakıt:** Bitki ve hayvan atıklarından elde edilir. Biyodizel yağlardan, biyoetanol şeker ve nişastadan üretilir. Yanınca $\text{CO}_2$ çıkar ama bitkinin büyürken tükettiği miktar kadar olduğundan net salınım düşüktür.

## 2. Isıl değer

Bir maddenin $1$ gramının tam yanmasıyla açığa çıkan ısıya **ısıl değer** denir (kJ/g). Isıl değeri yüksek yakıt, aynı kütlede daha çok enerji verir.

$$Q=m\cdot\text{ısıl değer}$$

**Örnek:** Isıl değeri $50\ \text{kJ/g}$ olan yakıttan $400\ \text{kJ}$ ısı almak için $m=\dfrac{400}{50}=8\ \text{g}$ yakılır.

Kütle başına en yüksek enerji **hidrojendedir** (yaklaşık $143\ \text{kJ/g}$), metan yaklaşık $56$, benzin yaklaşık $46$, kömür yaklaşık $30\ \text{kJ/g}$'dır. Yakıt seçiminde yalnızca ısıl değer değil, **depolama, güvenlik, maliyet ve çevre etkisi** de önemlidir.

## 3. Nükleer enerji

- **Fisyon:** Ağır çekirdeğin ($^{235}\text{U}$) nötronla bölünmesi. Nükleer santrallerde kullanılır. Zincirleme tepkime kontrol çubuklarıyla yavaşlatılır.
- **Füzyon:** Hafif çekirdeklerin (hidrojen izotopları) birleşip daha ağır çekirdek (helyum) oluşturması. **Güneşte** ve yıldızlarda olur. Çok yüksek sıcaklık gerektirir, atığı azdır ve kontrollü olarak henüz ticari ölçekte sağlanamamıştır.

İki olayda da kütle bir miktar azalır ve kaybolan kütle $E=mc^2$ ile enerjiye dönüşür.

## 4. Hidrojen ve yakıt pili

**Yakıt pili,** yakıtın ($\text{H}_2$) ve oksijenin elektrokimyasal olarak tepkimesinden doğrudan elektrik üretir. Yanma gibi alevli değildir.

- Anot: $2\text{H}_2\rightarrow4\text{H}^++4e^-$
- Katot: $\text{O}_2+4\text{H}^++4e^-\rightarrow2\text{H}_2\text{O}$
- Net: $2\text{H}_2+\text{O}_2\rightarrow2\text{H}_2\text{O}$

Tek atığı **sudur**. Hidrojenin sorunu depolanması, taşınması ve üretiminde enerji gerektirmesidir. Güneş enerjisiyle suyun elektrolizinden elde edilirse temiz bir döngü kurulur.

## 5. Çevre etkileri

![Sera etkisi: güneş ışınları yeryüzünü ısıtır, sera gazları ısının bir kısmını geri tutar](/lessons/ayt-kim/sera-etkisi.svg "Sera gazları yeryüzünden yayılan ısının bir kısmını tutarak atmosferi ısıtır")

- **Sera etkisi ve küresel ısınma:** $\text{CO}_2$, $\text{CH}_4$, $\text{N}_2\text{O}$ ve su buharı yeryüzünden yayılan kızılötesi ışınımı tutar. Fosil yakıt yanması ve ormansızlaşma $\text{CO}_2$ miktarını artırır. Sera etkisi doğal olarak vardır ve yaşam için gereklidir, sorun **artışıdır**.
- **Asit yağmurları:** Yakıttaki kükürt ve yüksek sıcaklıktaki azot $\text{SO}_2$ ve $\text{NO}_x$ olarak havaya karışır, suyla tepkimeye girerek $\text{H}_2\text{SO}_4$ ve $\text{HNO}_3$ oluşturur. Zararları: Toprak ve göllerin asitleşmesi, mermer ve metal yapıların aşınması.
- **Ozon tabakasının incelmesi:** CFC gibi klorlu bileşikler stratosferde ozonu parçalar. Morötesi ışınların yeryüzüne ulaşması artar.
- **Hava kirliliği:** $\text{CO}$, partikül madde, uçucu organik bileşikler.

## 6. Bilimsel ve teknolojik gelişmeler

- **Nanoteknoloji:** $1$ ile $100$ nanometre ($10^{-9}\ \text{m}$) arasındaki yapıların tasarlanması. Boyut küçülünce özellikler değişir. Güneş kremi, ilaç taşıma, kaplamalar.
- **Polimerler ve kompozitler:** Birden çok malzemenin üstün özelliklerini birleştirir. Karbon fiber, cam elyaf.
- **Yarı iletkenler:** İletkenliği ısı, katkılama ve ışıkla değişir. Silisyum. Transistör, güneş paneli, LED.
- **Süper iletkenler:** Çok düşük sıcaklıkta direnci sıfır olur. Manyetik rezonans (MR) cihazları.
- **Katalizörler:** Egzoz konvertörleri zehirli gazları ($\text{CO}$, $\text{NO}_x$) zararsızlaştırır.
- **Yeşil kimya:** Atık oluşumunu en baştan önleyen, zararsız çözücü ve yenilenebilir hammadde kullanan, enerjiyi verimli kullanan üretim yaklaşımı.
- **Geri dönüşüm:** Metal, cam, kâğıt ve plastiklerin yeniden kullanımı. Hem hammaddeden hem enerjiden tasarruf sağlar.

## 7. Sık yapılan hatalar

- Nükleer santralde füzyon, güneşte fisyon olduğunu düşünmek. Tersidir.
- Sera etkisinin tamamen zararlı olduğunu düşünmek. Zararlı olan artışıdır.
- $\text{CO}_2$'yi asit yağmuru nedenleri arasında saymak. Asıl nedenler $\text{SO}_2$ ve $\text{NO}_x$.
- Hidrojenin yenilenebilir kaynak olduğunu sanmak. Üretilmesi gereken bir yakıttır.
- Isıl değer ile toplam enerjiyi karıştırmak. Isıl değer gram başınadır.

:::baglanti
Yakıtların yanması **tepkime enerjisi** konusuyla, yakıt pili ise **kimya ve elektrik** konusuyla doğrudan bağlantılıdır. **Karbon kimyası** yakıtların kaynağını, **asit-baz** ise asit yağmurlarını açıklar. **Fizikte** çekirdek enerjisi ve kütle-enerji eşdeğerliği, **Biyolojide** küresel ısınmanın ekosistem ve biyoçeşitlilik üzerindeki etkisi ile ilişkilidir. **Coğrafyada** enerji kaynaklarının dağılımı da aynı konuyu başka açıdan ele alır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Fosil | Tükenir, $\text{CO}_2$ salar |
| Yenilenebilir | Tükenmez, düşük salınım |
| Isıl değer | $Q=m\times$ ısıl değer |
| Fisyon | Ağır çekirdek bölünür, santraller |
| Füzyon | Hafif çekirdek birleşir, güneş |
| Sera gazları | $\text{CO}_2$, $\text{CH}_4$, $\text{N}_2\text{O}$ |
| Asit yağmuru | $\text{SO}_2$, $\text{NO}_x$ |
| Yakıt pili | Tek atık su |

## Mini test

:::soru{cevap="B"}
Isıl değeri $50\ \text{kJ/g}$ olan bir yakıttan $400\ \text{kJ}$ ısı elde edilmek isteniyor. Kaç gram yakıt yakılmalıdır?

- A) $0{,}125$
- B) $8$
- C) $350$
- D) $450$
- E) $20\,000$

---

1. $Q=m\cdot\text{ısıl değer}$ olduğundan $m=\dfrac{Q}{\text{ısıl değer}}$.
2. $m=\dfrac{400}{50}=8\ \text{g}$. Doğru cevap B.

Diğer şıklar: **0,125** oran ters yazılmış, $\dfrac{50}{400}$ / **350** iki değer çıkarılmış / **450** iki değer toplanmış / **20 000** iki değer çarpılmış.
:::

:::soru{cevap="E"}
Aşağıdaki gazlardan hangisi sera etkisine neden olan gazlardan biri **değildir**?

- A) $\text{CO}_2$
- B) $\text{CH}_4$
- C) $\text{N}_2\text{O}$
- D) Su buharı
- E) $\text{N}_2$

---

1. Sera gazları atmosferdeki kızılötesi ışınımı tutan, üç ya da daha fazla atomlu moleküllerdir.
2. Azot ($\text{N}_2$), atmosferin büyük bölümünü oluşturmasına rağmen iki atomlu ve simetriktir, ısıyı tutmaz. Doğru cevap E.

Diğer şıklar: **$\text{CO}_2$**, **$\text{CH}_4$**, **$\text{N}_2\text{O}$** ve **su buharı** sera gazlarıdır.
:::

:::soru{cevap="A"}
Asit yağmurlarının oluşumunda en çok payı olan gazlar aşağıdakilerden hangisidir?

- A) $\text{SO}_2$ ve $\text{NO}_2$
- B) $\text{CO}_2$ ve $\text{CH}_4$
- C) CFC ve $\text{O}_3$
- D) $\text{N}_2$ ve $\text{O}_2$
- E) $\text{H}_2$ ve $\text{He}$

---

1. $\text{SO}_2$ ve $\text{NO}_2$ atmosferde suyla tepkimeye girerek sülfürik asit ve nitrik asit oluşturur.
2. Bu asitler yağmurla yeryüzüne iner. Doğru cevap A.

Diğer şıklar: **$\text{CO}_2$ ve $\text{CH}_4$** sera etkisinden sorumlu / **CFC ve $\text{O}_3$** ozon tabakası ile ilgili / **$\text{N}_2$ ve $\text{O}_2$** havanın ana bileşenleri, asit yapmaz / **$\text{H}_2$ ve $\text{He}$** çevre sorunu oluşturmaz.
:::

:::soru{cevap="D"}
Nükleer enerji ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Fisyon, hafif çekirdeklerin birleşmesidir ve güneşte gerçekleşir.
- B) Füzyon, ağır çekirdeklerin bölünmesidir ve bugünkü santrallerde kullanılır.
- C) Güneşte enerji, uranyum çekirdeklerinin bölünmesiyle elde edilir.
- D) Füzyonda hafif çekirdekler birleşir ve büyük miktarda enerji açığa çıkar.
- E) Fisyonda enerji, kütlenin artmasıyla ortaya çıkar.

---

1. Füzyon, hidrojen izotopları gibi hafif çekirdeklerin birleşip daha ağır çekirdek oluşturmasıdır.
2. Bu sırada kütle azalır ve fark $E=mc^2$ ile büyük enerjiye dönüşür. Doğru cevap D.

Diğer şıklar: **A** fisyon ile füzyon karıştırılmış / **B** tanım ve kullanım yeri ters / **C** güneşte olay füzyondur / **E** her iki olayda da kütle azalır.
:::

## Kendini dene

:::dene
1. Güneşte enerji hangi olayla üretilir? => Füzyon.
2. Asit yağmuru hangi gazlardan oluşur? => $\text{SO}_2$ ve $\text{NO}_x$.
3. Yakıt pilinin tek atığı nedir? => Su.
4. Ozon tabakasını hangi bileşikler inceltir? => CFC'ler.
5. Nanoteknolojide boyut aralığı nedir? => Yaklaşık 1 ile 100 nanometre.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-kim' and name = 'Enerji Kaynakları ve Bilimsel Gelişmeler'
on conflict (topic_id) do nothing;

