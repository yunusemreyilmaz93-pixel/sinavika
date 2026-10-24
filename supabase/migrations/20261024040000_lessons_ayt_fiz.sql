-- 20261024040000_lessons_ayt_fiz. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir tekneyi karşı kıyıya geçirmeye çalışırken hem motorunun gücü hem de nehrin akıntısı tekneyi etkiler. Tekne ne tam karşıya ne de akıntı yönünde gider, ikisinin **bileşkesi** yönünde gider. Fizikte kuvvet, hız, ivme gibi büyüklükler yönleri olan **vektörlerdir** ve sayılar gibi toplanamazlar. Bu konuda vektörlerin gösterimini, toplama ve çıkarmayı, **bileşenlere ayırmayı**, bileşke vektörün büyüklüğünü ve dengeyi öğreneceksin. Vektörler, bütün mekanik konularının dilidir: Newton yasaları, atışlar, iş ve enerji, tork, elektrik alan ve manyetizma hep vektörle yazılır.

:::hedefler
1. Skaler ve vektörel büyüklükleri ayırt etmek.
2. Vektörleri uç uca ekleme ve paralelkenar yöntemiyle toplamak.
3. Vektörleri $x$ ve $y$ bileşenlerine ayırmak.
4. Bileşke vektörün büyüklüğünü ve yönünü bulmak.
5. Vektörde çıkarma ve skalerle çarpmayı uygulamak.
6. Dengedeki kuvvetlerde bileşkenin sıfır olduğunu kullanmak.
:::

:::ipucu
Vektör sorularında önce **bir eksen takımı seç**, her vektörü $x$ ve $y$ bileşenlerine ayır ve bileşenleri ayrı ayrı topla. Sonra bileşkenin büyüklüğünü Pisagor ile bul. Bu yol her açıda çalışır ve şekle bağlı kalmaz.
:::

::video{id="erXh3zjH-uU" etiket="Konu anlatımı videosu" baslik="Vektörler" kanal="VIP FİZİK"}

## 1. Vektör nedir?

**Skaler büyüklük** yalnızca sayı ve birimle belirtilir: kütle, zaman, yol, sürat, enerji, sıcaklık.

**Vektörel büyüklük** büyüklük, yön ve doğrultu ile belirtilir: yer değiştirme, hız, ivme, kuvvet, momentum, elektrik alan.

Vektör bir **ok** ile gösterilir: okun uzunluğu büyüklüğü, doğrultusu ve ucu yönü verir. $\vec A$ vektörünün büyüklüğü $\lvert\vec A\rvert=A$ yazılır.

**Eşit vektörler:** Büyüklükleri ve yönleri aynı olan vektörler eşittir. Vektörü kendine paralel kaydırmak onu değiştirmez.

**Ters vektör:** $-\vec A$, büyüklüğü aynı, yönü zıt vektördür.

## 2. Vektörlerin toplanması

**Uç uca ekleme:** İkinci vektörün başlangıcını birincinin ucuna koy. Bileşke, birincinin başından ikincinin ucuna çizilen vektördür.

**Paralelkenar yöntemi:** İki vektörü aynı noktadan çiz. Onlardan paralelkenar oluştur. Bileşke, ortak noktadan çizilen köşegendir.

::sim{tur="vektor"}

**Bileşke büyüklüğü:** Aralarındaki açı $\theta$ olan $\vec A$ ve $\vec B$ için

$$R=\sqrt{A^2+B^2+2AB\cos\theta}$$

| Durum | $\theta$ | Bileşke |
| --- | --- | --- |
| Aynı yönlü | $0^\circ$ | $R=A+B$ (en büyük) |
| Dik | $90^\circ$ | $R=\sqrt{A^2+B^2}$ |
| Zıt yönlü | $180^\circ$ | $R=\lvert A-B\rvert$ (en küçük) |
| Eşit büyüklük, $120^\circ$ | $120^\circ$ | $R=A$ |

**Sınır değerler:** İki vektörün bileşkesi $\lvert A-B\rvert\le R\le A+B$ aralığındadır.

**Örnek:** $A=3$ ve $B=5$ birim, aralarındaki açı $60^\circ$ ise $R=\sqrt{9+25+2\cdot15\cdot\frac12}=\sqrt{49}=7$.

## 3. Vektörün bileşenleri

$x$ ekseniyle $\alpha$ açısı yapan $\vec F$ vektörünün bileşenleri:

$$F_x=F\cos\alpha,\qquad F_y=F\sin\alpha$$

Bileşenlerden büyüklük ve yön bulunur: $F=\sqrt{F_x^2+F_y^2}$ ve $\tan\alpha=\dfrac{F_y}{F_x}$.

**Önemli açılar:**

| Açı | $\sin$ | $\cos$ |
| --- | --- | --- |
| $30^\circ$ | $0{,}5$ | $0{,}87$ |
| $37^\circ$ | $0{,}6$ | $0{,}8$ |
| $45^\circ$ | $0{,}71$ | $0{,}71$ |
| $53^\circ$ | $0{,}8$ | $0{,}6$ |
| $60^\circ$ | $0{,}87$ | $0{,}5$ |

**Örnek:** $20\ \text{N}$ büyüklüğündeki kuvvet $x$ ekseniyle $37^\circ$ yapıyorsa $F_x=20\cdot0{,}8=16\ \text{N}$ ve $F_y=20\cdot0{,}6=12\ \text{N}$.

**Birim vektörler:** $\hat\imath$ ve $\hat\jmath$, $x$ ve $y$ yönündeki birim vektörlerdir. $\vec F=F_x\hat\imath+F_y\hat\jmath$ yazılır.

![Bir kuvvet vektörünün x ve y bileşenlerine ayrılması](/lessons/ayt-fiz/vektor-bilesenler.svg "Vektörün bileşenleri")

## 4. Bileşenlerle toplama ve çıkarma

Birden çok vektör varsa her birini bileşenlerine ayır. $x$ bileşenlerini kendi arasında, $y$ bileşenlerini kendi arasında topla:

$$R_x=\sum F_x,\qquad R_y=\sum F_y,\qquad R=\sqrt{R_x^2+R_y^2}$$

**Çıkarma:** $\vec A-\vec B=\vec A+(-\vec B)$. $\vec B$'nin yönünü çevirip toplarsın.

**Skalerle çarpma:** $k\vec A$ vektörünün büyüklüğü $\lvert k\rvert A$ olur. $k>0$ ise yön aynı, $k<0$ ise zıt yöndedir.

## 5. Denge

Bir cisme etki eden kuvvetlerin **bileşkesi sıfırsa** cisim dengededir: $\sum\vec F=0$. Bu, $\sum F_x=0$ ve $\sum F_y=0$ demektir.

**Örnek:** $\vec F_1=(6,8)$ ve $\vec F_2=(-2,-4)$ olsun. Cisim üçüncü bir $\vec F_3$ ile dengedeyse $\vec F_1+\vec F_2+\vec F_3=0$ olur. $\vec F_1+\vec F_2=(4,4)$ olduğundan $\vec F_3=(-4,-4)$. Büyüklüğü $4\sqrt2$.

**Üç kuvvet dengesi:** Üç vektör uç uca eklendiğinde kapalı bir üçgen oluşur.

:::baglanti
Vektörler, **Newton'un hareket yasaları** ve **atışlar** konusunda kuvvet ve hızı bileşenlere ayırmanın temelidir. **Tork ve denge** konusunda kuvvetlerin bileşkesi sıfırdır. **Elektriksel kuvvet ve alan** ve **manyetizma** konularında kuvvetler vektörel toplanır. **Matematikte** analitik geometrideki vektör işlemleri ve trigonometri burada kullanılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Vektörel büyüklük | Büyüklük ve yön |
| Bileşke | $\sqrt{A^2+B^2+2AB\cos\theta}$ |
| En büyük bileşke | Aynı yönde, $A+B$ |
| En küçük bileşke | Zıt yönde, $\lvert A-B\rvert$ |
| Bileşenler | $F\cos\alpha$ ve $F\sin\alpha$ |
| Denge | $\sum\vec F=0$ |

## Mini test

:::soru{cevap="B"}
Büyüklükleri 3 N ve 4 N olan birbirine dik iki kuvvetin bileşkesi kaç N'dur?

- A) 1
- B) 5
- C) 7
- D) 12
- E) 25

---

1. Kuvvetler dik olduğundan bileşke Pisagor ile bulunur.
2. $R=\sqrt{3^2+4^2}=\sqrt{25}=5\ \text{N}$. Doğru cevap B.

Diğer şıklar: **1** kuvvetler zıt yönlü sanılıp çıkarılmış / **7** kuvvetler aynı yönlü sanılıp toplanmış / **12** büyüklükler çarpılmış / **25** karekök alınmamış.
:::

:::soru{cevap="C"}
Büyüklükleri 3 N ve 5 N olan iki kuvvet arasındaki açı $60^\circ$ dir. Bu kuvvetlerin bileşkesi kaç N'dur?

- A) $\sqrt{19}$
- B) $\sqrt{34}$
- C) 7
- D) 8
- E) 15

---

1. $R=\sqrt{A^2+B^2+2AB\cos\theta}=\sqrt{9+25+2\cdot3\cdot5\cdot\dfrac12}$.
2. $R=\sqrt{34+15}=\sqrt{49}=7\ \text{N}$. Doğru cevap C.

Diğer şıklar: **$\sqrt{19}$** kosinüs terimi çıkarılmış / **$\sqrt{34}$** kuvvetler dik sanılmış / **8** kuvvetler aynı yönlü sanılıp toplanmış / **15** büyüklükler çarpılmış.
:::

:::soru{cevap="B"}
Büyüklüğü 20 N olan bir kuvvet $x$ ekseni ile $37^\circ$ lik açı yapıyor. ($\sin37^\circ=0{,}6$ ve $\cos37^\circ=0{,}8$) Kuvvetin $y$ eksenindeki bileşeni kaç N'dur?

- A) 8
- B) 12
- C) 16
- D) 20
- E) 25

---

1. $y$ bileşeni için sinüs kullanılır: $F_y=F\sin37^\circ$.
2. $F_y=20\cdot0{,}6=12\ \text{N}$. Doğru cevap B.

Diğer şıklar: **8** açı yanlış alınıp $20\cdot0{,}4$ hesaplanmış / **16** $x$ bileşeni, yani kosinüs kullanılmış / **20** bileşen alınmadan büyüklük yazılmış / **25** pozitif bir değere bölünmüş, $20\div0{,}8$.
:::

:::soru{cevap="D"}
$\vec F_1=(6,8)$ N ve $\vec F_2=(-2,-4)$ N kuvvetleri ile birlikte etki eden üçüncü bir $\vec F_3$ kuvveti cismi **dengede** tutuyor. $\vec F_3$ aşağıdakilerden hangisidir?

- A) $(4,4)$
- B) $(8,12)$
- C) $(-8,-12)$
- D) $(-4,-4)$
- E) $(4,-4)$

---

1. Denge için $\vec F_1+\vec F_2+\vec F_3=0$ olmalıdır.
2. $\vec F_1+\vec F_2=(6-2,\ 8-4)=(4,4)$.
3. $\vec F_3=-(4,4)=(-4,-4)$. Doğru cevap D.

Diğer şıklar: **$(4,4)$** işaret ters alınmamış, bileşke yazılmış / **$(8,12)$** $\vec F_1-\vec F_2$ hesaplanmış / **$(-8,-12)$** $\vec F_2-\vec F_1$ hesaplanmış / **$(4,-4)$** $y$ bileşeninin işareti yanlış alınmış.
:::

## Kendini dene

:::dene
1. Hız vektörel mi skaler mi? => Vektöreldir.
2. Aynı yönlü 6 N ve 2 N kuvvetin bileşkesi kaçtır? => 8 N.
3. Zıt yönlü 6 N ve 2 N kuvvetin bileşkesi kaçtır? => 4 N.
4. 10 N büyüklüğündeki kuvvetin $30^\circ$ ile $x$ bileşeni nedir? => $10\cdot\cos30^\circ\approx8{,}7$ N.
5. Dengedeki bir cisme etki eden kuvvetlerin bileşkesi kaçtır? => Sıfır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Vektörler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Otobüste otururken yanından geçen başka bir otobüs, aynı hızla gidiyorsa duruyormuş gibi görünür. Karşıdan gelen araç ise çok hızlı geçiyormuş gibi görünür. Aynı hareket, **bakan kişinin hareketine göre** farklı görünür. Fizikte bir hareketi tanımlamak için bir **referans sistemi** seçersin ve hız referansa göre belirlenir. Bu konuda **bağıl hız** kavramını, aynı ve zıt yönlü hareketlerde bağıl hızı, **nehir problemlerini** ve yağmur-yaya benzeri iki boyutlu problemleri öğreneceksin. Bu konu, önceki vektör bilgisini hareket problemlerine uygular.

:::hedefler
1. Referans sistemi kavramını ve hareketin göreceli olduğunu bilmek.
2. Bağıl hızı $\vec v_{AB}=\vec v_A-\vec v_B$ ile hesaplamak.
3. Aynı ve zıt yönlü hareketlerde bağıl hızı bulmak.
4. Nehir problemlerinde kayma ve yer hızını hesaplamak.
5. Karşıya en kısa sürede ve en kısa yoldan geçişi ayırt etmek.
6. Yağmur-yaya türü iki boyutlu bağıl hız problemlerini vektörle çözmek.
:::

:::ipucu
Bağıl hızda **kim kime göre?** sorusunu net yaz. $\vec v_{AB}$, $A$'nın $B$'ye göre hızıdır. Bakan kişiyi durağan kabul et ve diğer cismin hızından bakanın hızını vektörel olarak çıkar.
:::

::video{id="3_21Bbmi7d4" etiket="Konu anlatımı videosu" baslik="Bağıl Hareket" kanal="Fizikle Barış"}

## 1. Referans sistemi ve bağıl hız

Bir cismin konumu ve hızı, seçilen **referans sistemine** göre belirtilir. Yere göre durağan bir sistemde "durağan" olan bir cisim, hareketli bir araçtan bakınca hareketli görünür.

**Bağıl hız:** $A$ cisminin $B$ gözlemcisine göre hızı

$$\vec v_{AB}=\vec v_A-\vec v_B$$

Hızlar yere (ya da ortak bir referansa) göre verilir ve vektör olarak çıkarılır.

| Durum | Bağıl hız büyüklüğü |
| --- | --- |
| Aynı yönde, $v_A>v_B$ | $v_A-v_B$ |
| Zıt yönlerde | $v_A+v_B$ |
| Birbirine dik | $\sqrt{v_A^2+v_B^2}$ |

::sim{tur="hareket"}

**Örnek:** Birbirine doğru $20\ \text{m/s}$ ve $15\ \text{m/s}$ hızlarıyla giden iki araç için bağıl hız $20+15=35\ \text{m/s}$ olur. Araçlar birbirine $35\ \text{m/s}$ hızla yaklaşır.

**Örnek:** Aynı yönde $30\ \text{m/s}$ ve $25\ \text{m/s}$ ile giden iki aracın bağıl hızı $5\ \text{m/s}$'dir. Hızlı araç, yavaşı $5\ \text{m/s}$ hızla yakalar.

## 2. Karşılaşma ve yakalama

- **Zıt yönde:** Aralarındaki mesafe $d$ ise karşılaşma süresi $t=\dfrac{d}{v_1+v_2}$.
- **Aynı yönde:** Arkadaki hızlıysa yakalama süresi $t=\dfrac{d}{v_1-v_2}$.

**Örnek:** $120\ \text{m}$ uzaklıktaki iki araç $20$ ve $10\ \text{m/s}$ ile birbirine doğru gidiyor. Karşılaşma süresi $\dfrac{120}{30}=4\ \text{s}$ olur.

## 3. Nehir problemleri

Nehirde akan suyun hızı $\vec v_a$ (akıntı), teknenin durgun suya göre hızı $\vec v_t$ olsun. Teknenin **yere göre hızı** bunların vektörel toplamıdır:

$$\vec v_{yer}=\vec v_t+\vec v_a$$

**Durum 1: Tekne kıyıya dik yönelirse.** $v_t$ karşı kıyıya dik, $v_a$ kıyıya paraleldir.

- Karşıya geçme süresi $t=\dfrac{d}{v_t}$ ($d$ nehir genişliği). Bu, **en kısa süredir**.
- Akıntı yönünde kayma $x=v_a\cdot t$.
- Yer hızı $v=\sqrt{v_t^2+v_a^2}$.

**Örnek:** Akıntı hızı $3\ \text{m/s}$, tekne hızı $5\ \text{m/s}$, nehir genişliği $100\ \text{m}$ olsun. Tekne dik yönelirse $t=\dfrac{100}{5}=20\ \text{s}$ ve kayma $3\cdot20=60\ \text{m}$ olur.

**Durum 2: Tekne tam karşıya (en kısa yoldan) geçecekse.** Tekne akıntıya karşı bir açıyla yönelir ki akıntının etkisi dengelensin. Kıyıya dik net hız $\sqrt{v_t^2-v_a^2}$ olur ($v_t>v_a$ olmalıdır).

**Örnek:** Aynı tekne ($5\ \text{m/s}$) ve akıntı ($3\ \text{m/s}$), genişlik $80\ \text{m}$ olsun. Net hız $\sqrt{25-9}=4\ \text{m/s}$ ve süre $\dfrac{80}{4}=20\ \text{s}$.

**Özet:**

| Amaç | Yönelim | Süre |
| --- | --- | --- |
| En kısa süre | Kıyıya dik | $\dfrac{d}{v_t}$ |
| En kısa yol (kayma sıfır) | Akıntıya karşı açılı | $\dfrac{d}{\sqrt{v_t^2-v_a^2}}$ |

**Akıntı yönünde ve aksi yönde:** Akıntıyla aynı yönde giden teknenin yer hızı $v_t+v_a$, akıntıya karşı $v_t-v_a$'dır.

## 4. İki boyutlu bağıl hız: yağmur ve yaya

Düşey yağmur ($4\ \text{m/s}$ aşağı) ve yatay koşan yaya ($3\ \text{m/s}$) için yağmurun **yayaya göre** hızı

$$\vec v_{yağmur,yaya}=\vec v_{yağmur}-\vec v_{yaya}$$

Bileşenler dik olduğundan büyüklük $\sqrt{4^2+3^2}=5\ \text{m/s}$ olur. Yaya yağmuru, düşeyden $\tan\alpha=\dfrac34$ açıyla öne eğik gelirken görür. Şemsiyeyi bu doğrultuda tutmak gerekir.

**Örnek:** Rüzgârsız havada düşey yağan yağmur, hareketli bir araçta oturan yolcuya eğik görünür. Araç hızlandıkça eğim artar.

## 5. Sık yapılan hatalar

- Hızları yön dikkate almadan toplamak ya da çıkarmak.
- **Yere göre** hız ile **suya göre** hızı karıştırmak.
- Tam karşıya geçişi en kısa süre sanmak. En kısa süre kıyıya dik yönelmektir, bu durumda tekne kayar.
- Akıntıya karşı yönelmede $v_t>v_a$ şartını unutmak.

:::baglanti
Bağıl hız, **vektörler** konusundaki toplama ve çıkarmanın hareket problemlerine uygulamasıdır. **Atışlar** ve **Newton'un hareket yasaları** konusunda hızın bileşenlere ayrılması aynı mantıkla yapılır. **Modern fizikte** (özel görelilik) hızların göreceli olduğu fikri, ışık hızıyla birlikte daha derin bir anlam kazanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Bağıl hız | $\vec v_{AB}=\vec v_A-\vec v_B$ |
| Zıt yön | Hızlar toplanır |
| Aynı yön | Hızlar çıkarılır |
| Nehir | $\vec v_{yer}=\vec v_t+\vec v_a$ |
| En kısa süre | Kıyıya dik yönel, $t=\dfrac{d}{v_t}$ |
| Kayma | $x=v_a\,t$ |
| Tam karşıya | $\sqrt{v_t^2-v_a^2}$ |

## Mini test

:::soru{cevap="D"}
Doğrusal bir yolda birbirine doğru giden iki araçtan birinin hızı 20 m/s, diğerinin hızı 15 m/s'dir. Araçların birbirine göre bağıl hızı kaç m/s'dir?

- A) 5
- B) 15
- C) 20
- D) 35
- E) 300

---

1. Araçlar zıt yönde hareket ettiğinden bağıl hız büyüklüğü hızların toplamıdır.
2. $v_{bağıl}=20+15=35\ \text{m/s}$. Doğru cevap D.

Diğer şıklar: **5** araçlar aynı yönlü sanılıp hızlar çıkarılmış / **15** yalnızca yavaş aracın hızı alınmış / **20** yalnızca hızlı aracın hızı alınmış / **300** hızlar çarpılmış.
:::

:::soru{cevap="B"}
Akıntı hızı 3 m/s olan 100 m genişliğindeki bir nehirde, durgun suya göre hızı 5 m/s olan bir tekne kıyıya dik yönelerek karşıya geçiyor. Teknenin akıntı yönünde **kayma miktarı** kaç m'dir?

- A) 20
- B) 60
- C) 80
- D) 100
- E) 300

---

1. Tekne dik yöneldiğinde geçiş süresi $t=\dfrac{d}{v_t}=\dfrac{100}{5}=20\ \text{s}$.
2. Bu sürede akıntı tekneyi $x=v_a\cdot t=3\cdot20=60\ \text{m}$ sürükler. Doğru cevap B.

Diğer şıklar: **20** geçiş süresi, saniye değeri olarak yazılmış / **80** $\sqrt{v_t^2-v_a^2}=4$ ile süre çarpılmış, $4\cdot20$ / **100** nehir genişliği yazılmış / **300** akıntı hızı ile genişlik çarpılmış.
:::

:::soru{cevap="D"}
Rüzgârsız bir havada düşey doğrultuda 4 m/s hızla yağan yağmur altında, bir yaya yatay yolda 3 m/s hızla yürüyor. Yağmurun yayaya göre hızı kaç m/s'dir?

- A) 1
- B) 3
- C) 4
- D) 5
- E) 7

---

1. Yağmurun yayaya göre hızı $\vec v_{y}-\vec v_{yaya}$ ile bulunur. Hızlar birbirine diktir.
2. $v=\sqrt{4^2+3^2}=5\ \text{m/s}$. Doğru cevap D.

Diğer şıklar: **1** hızlar aynı doğrultuda sanılıp çıkarılmış / **3** yalnızca yayanın hızı alınmış / **4** yalnızca yağmurun hızı alınmış / **7** hızlar düz toplanmış.
:::

:::soru{cevap="C"}
Akıntı hızı 3 m/s olan 80 m genişliğindeki bir nehirde, durgun suya göre hızı 5 m/s olan bir tekne **tam karşıya** (kayma olmadan) geçecek biçimde yöneliyor. Geçiş süresi kaç s'dir?

- A) 10
- B) 16
- C) 20
- D) $\dfrac{80}{3}$
- E) 40

---

1. Tam karşıya geçmek için akıntıya karşı bir açıyla yönelinir. Kıyıya dik net hız $\sqrt{5^2-3^2}=4\ \text{m/s}$.
2. Süre $t=\dfrac{80}{4}=20\ \text{s}$. Doğru cevap C.

Diğer şıklar: **10** hızlar toplanmış, $\dfrac{80}{5+3}$ / **16** tekne hızı dik net hız sanılmış, $\dfrac{80}{5}$ / **$\dfrac{80}{3}$** akıntı hızıyla bölünmüş / **40** hızlar çıkarılmış, $\dfrac{80}{5-3}$.
:::

## Kendini dene

:::dene
1. Aynı yönde 25 m/s ve 20 m/s hızla giden araçların bağıl hızı nedir? => 5 m/s.
2. Akıntı ile aynı yönde giden teknenin yer hızı nasıl bulunur? => $v_t+v_a$ olarak.
3. Nehri en kısa sürede geçmek için tekne nasıl yönelmelidir? => Kıyıya dik.
4. $v_t=5$ ve $v_a=3$ m/s ise tam karşıya geçişte net hız kaçtır? => 4 m/s.
5. Hareketin göreceli olması ne demektir? => Hız, seçilen referans sistemine göre değişir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Bağıl Hareket'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir otobüs aniden fren yaptığında vücudun öne doğru savrulur. Bir arabayı iterken ne kadar çok yük koyarsan o kadar zor hızlandırırsın. Raketin gazı aşağı püskürtmesi onu yukarı iter. Bu üç olay, Newton'un üç hareket yasasının günlük hayattaki görüntüsüdür. Bu konuda **eylemsizlik**, **net kuvvet ve ivme ilişkisi** ($F=ma$), **etki-tepki**, ağırlık, **sürtünme**, eğik düzlem ve ip-makara sistemlerini öğreneceksin. Bu konu mekaniğin kalbidir: İş-enerji, momentum, atışlar ve çembersel hareket hep buradaki ilkelere dayanır.

:::hedefler
1. Newton'un üç yasasını yorumlamak.
2. Serbest cisim diyagramı çizip net kuvveti bulmak.
3. $F_{net}=ma$ ile ivmeyi hesaplamak.
4. Sürtünme kuvvetini ($f_s$ ve $f_k$) ayırt etmek ve hesaplamak.
5. Eğik düzlemde kuvveti bileşenlere ayırarak ivmeyi bulmak.
6. İp ve makara sistemlerinde ivme ve ip gerilmesini bulmak.
:::

:::ipucu
Her Newton sorusunda aynı üç adımı uygula: **(1)** cismi çiz ve kuvvetleri göster, **(2)** hareket yönünü eksen seç ve kuvvetleri bu eksene göre ayır, **(3)** $\sum F=ma$ yaz. Hareket yönündeki kuvvetler $+$, zıt yöndekiler $-$ olur.
:::

::video{id="1yvItGPDEpA" etiket="Konu anlatımı videosu" baslik="Newton'ın Hareket Yasaları" kanal="Özcan Aykın FİZİK"}

## 1. Newton'un yasaları

**1. Yasa (eylemsizlik):** Net kuvvet sıfırsa cisim durgun ise durmaya, hareketli ise sabit hızla doğrusal hareketine devam eder. Cisimlerin bu eğilimine **eylemsizlik** denir. Kütle eylemsizliğin ölçüsüdür.

**2. Yasa:** Cismin ivmesi net kuvvetle doğru, kütlesiyle ters orantılıdır:

$$\vec a=\dfrac{\vec F_{net}}{m}\quad\Longleftrightarrow\quad\vec F_{net}=m\vec a$$

Birimler: $1\ \text{N}=1\ \text{kg}\cdot\text{m/s}^2$.

**3. Yasa (etki-tepki):** $A$ cismi $B$'ye bir kuvvet uygularsa $B$ de $A$'ya **aynı büyüklükte, zıt yönde** bir kuvvet uygular. Bu iki kuvvet **farklı cisimlere** etki ettiği için birbirini dengelemez.

::sim{tur="newton"}

**Örnek:** Kütlesi $4\ \text{kg}$ olan cisme $20\ \text{N}$ kuvvet uygulanıyor ve $8\ \text{N}$ sürtünme var. Net kuvvet $12\ \text{N}$ ve ivme $a=\dfrac{12}{4}=3\ \text{m/s}^2$.

## 2. Ağırlık ve normal kuvvet

**Ağırlık:** $G=mg$, yerçekimi kuvvetidir. Yönü yer merkezine doğrudur. Vektörel büyüklüktür, kütle ise skalerdir. Bu konuda $g=10\ \text{m/s}^2$ alınır.

**Normal kuvvet ($N$):** Yüzeyin cisme dik uyguladığı tepki kuvvetidir. Yatay zeminde başka düşey kuvvet yoksa $N=mg$ olur. Ama $N$ her zaman $mg$'ye eşit **değildir**. Eğik kuvvet ya da ivmeli asansörde değişir.

**Asansör problemi:** Asansördeki kişinin **hissettiği ağırlık** $N$'dir.

| Hareket | $N$ |
| --- | --- |
| Sabit hızla ya da duruyor | $mg$ |
| Yukarı doğru hızlanıyor ya da aşağı doğru yavaşlıyor | $m(g+a)$ |
| Aşağı doğru hızlanıyor ya da yukarı doğru yavaşlıyor | $m(g-a)$ |
| Serbest düşüyor | $0$ (ağırlıksızlık) |

**Örnek:** $60\ \text{kg}$'lık bir kişi $2\ \text{m/s}^2$ ile yukarı hızlanan asansörde $N=60(10+2)=720\ \text{N}$ kuvvetle zemine bastırır.

## 3. Sürtünme kuvveti

Sürtünme, yüzeylerin birbirine göre hareketine **ters yönde** etki eder.

- **Statik sürtünme ($f_s$):** Cisim henüz hareket etmiyorsa uygulanan kuvveti dengeler. $f_s\le f_{s,max}=\mu_sN$.
- **Kinetik sürtünme ($f_k$):** Cisim kayıyorsa sabittir: $f_k=\mu_kN$. $\mu_k<\mu_s$.

**Önemli:** Sürtünme kuvveti **temas yüzeyinin alanına ve hıza bağlı değildir**. Normal kuvvete ve yüzeylerin cinsine bağlıdır.

**Örnek:** $\mu_k=0{,}2$ ve $m=5\ \text{kg}$ olan cisim yatayda kayarken $f_k=0{,}2\cdot50=10\ \text{N}$.

## 4. Eğik düzlem

Sürtünmesiz $\theta$ eğimli düzlemde ağırlık iki bileşene ayrılır:

- Düzleme paralel: $mg\sin\theta$ (cismi aşağı çeker).
- Düzleme dik: $mg\cos\theta$ ($N$ ile dengelenir, $N=mg\cos\theta$).

**İvme:** $a=g\sin\theta$ (sürtünmesiz), $a=g(\sin\theta-\mu\cos\theta)$ (sürtünmeli, kayıyorsa).

**Örnek:** $30^\circ$ eğimli sürtünmesiz düzlemde $a=10\cdot0{,}5=5\ \text{m/s}^2$ olur. Kütle ne olursa olsun ivme aynıdır.

![Eğik düzlemdeki cisme etkiyen ağırlık, normal kuvvet ve düzleme paralel bileşen](/lessons/ayt-fiz/egik-duzlem-kuvvetler.svg "Eğik düzlemde kuvvetler")

## 5. İp ve makara sistemleri

İp hafif ve esnemezse ipin her yerinde gerilme aynıdır ve bağlı cisimler aynı büyüklükte ivmeyle hareket eder. Sistem için $\sum F=m_{toplam}\,a$ yazılır.

**Atwood makinesi:** $m_2>m_1$ kütleleri hafif makaradan geçen ipe bağlıysa

$$a=\dfrac{(m_2-m_1)g}{m_1+m_2},\qquad T=\dfrac{2m_1m_2g}{m_1+m_2}$$

**Örnek:** $m_1=2\ \text{kg}$ ve $m_2=3\ \text{kg}$ için $a=\dfrac{1\cdot10}{5}=2\ \text{m/s}^2$ ve $T=m_1(g+a)=2\cdot12=24\ \text{N}$ olur. Kontrol: $T=\dfrac{2\cdot2\cdot3\cdot10}{5}=24\ \text{N}$.

**Gerilme bulma yöntemi:** Önce sistem için ivmeyi bul. Sonra tek bir cisme $\sum F=ma$ yazıp $T$'yi çöz.

## 6. Hata yapılan yerler

- Etki ve tepki kuvvetlerini aynı cisme çizmek. Farklı cisimlere etki ederler.
- $N=mg$ varsaymak. Eğik düzlemde ya da düşey kuvvet varken değişir.
- Kinetik sürtünmeyi hıza bağlı sanmak.
- Net kuvvetin yönünü ivmenin yönü ile karıştırmak. İvme her zaman net kuvvet yönündedir.

:::baglanti
Newton yasaları, **vektörler** konusunun kuvvetlere uygulamasıdır. **İş, güç ve enerji** kuvvetin yol boyunca etkisini ele alır, **itme ve momentum** ise $F=ma$'nın zaman cinsinden yazılmış hâlidir. **Çembersel hareketin** merkezcil kuvveti, net kuvvetin çemberin merkezine doğru olmasıdır. **Basit makineler** ve **tork** konusunda denge yine $\sum F=0$ ilkesine dayanır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| 1. yasa | Net kuvvet 0 ise ivme 0 |
| 2. yasa | $F_{net}=ma$ |
| 3. yasa | Etki-tepki farklı cisimlerde |
| Ağırlık | $G=mg$ |
| Kinetik sürtünme | $\mu_kN$ |
| Eğik düzlem | $a=g\sin\theta$ |
| Asansör (yukarı hızlanma) | $N=m(g+a)$ |

## Mini test

:::soru{cevap="B"}
Sürtünmeli yatay bir zeminde durmakta olan 4 kg kütleli cisme 20 N'luk yatay kuvvet uygulanıyor. Cisme etki eden sürtünme kuvveti 8 N olduğuna göre cismin ivmesi kaç m/s² dir?

- A) 2
- B) 3
- C) 5
- D) 7
- E) 12

---

1. Net kuvvet $F_{net}=20-8=12\ \text{N}$.
2. $a=\dfrac{F_{net}}{m}=\dfrac{12}{4}=3\ \text{m/s}^2$. Doğru cevap B.

Diğer şıklar: **2** yalnızca sürtünme kütleye bölünmüş, $\dfrac84$ / **5** sürtünme dikkate alınmamış, $\dfrac{20}{4}$ / **7** sürtünme kuvvete eklenmiş, $\dfrac{28}{4}$ / **12** net kuvvet ivme sanılmış.
:::

:::soru{cevap="D"}
Kütlesi 60 kg olan bir kişi, yukarı doğru 2 m/s² ivmeyle hızlanan bir asansörün zeminine kaç N kuvvetle bastırır? ($g=10\ \text{m/s}^2$)

- A) 120
- B) 480
- C) 600
- D) 720
- E) 1200

---

1. Asansör yukarı doğru hızlanırken kişinin hissettiği ağırlık $N=m(g+a)$ olur.
2. $N=60\cdot(10+2)=720\ \text{N}$. Doğru cevap D.

Diğer şıklar: **120** yalnızca $m\cdot a$ alınmış / **480** ivme çıkarılmış, $60(10-2)$ / **600** ağırlık yazılmış, ivme dikkate alınmamış / **1200** ağırlık ile ivme çarpılmış, $600\cdot2$.
:::

:::soru{cevap="C"}
Kütleleri $m_1=2\ \text{kg}$ ve $m_2=3\ \text{kg}$ olan cisimler, sürtünmesiz hafif bir makaradan geçen ipin uçlarına bağlanmıştır. Sistem serbest bırakıldığında ipteki gerilme kuvveti kaç N olur? ($g=10\ \text{m/s}^2$)

- A) 4
- B) 20
- C) 24
- D) 30
- E) 48

---

1. Sistemin ivmesi $a=\dfrac{(m_2-m_1)g}{m_1+m_2}=\dfrac{1\cdot10}{5}=2\ \text{m/s}^2$.
2. Hafif cisim yukarı hızlanır: $T-m_1g=m_1a$.
3. $T=2(10+2)=24\ \text{N}$. Doğru cevap C.

Diğer şıklar: **4** $T=m_1a$ yazılmış, ağırlık unutulmuş / **20** $m_1g$ yazılmış, cisim dengede sanılmış / **30** $m_2g$ yazılmış / **48** gerilme iki kat alınmış.
:::

:::soru{cevap="A"}
Sürtünmesiz $30^\circ$ eğimli bir düzlemde serbest bırakılan cismin ivmesi kaç m/s² dir? ($g=10\ \text{m/s}^2$, $\sin30^\circ=0{,}5$)

- A) 5
- B) $5\sqrt3$
- C) 10
- D) 30
- E) 60

---

1. Düzleme paralel bileşen $mg\sin30^\circ$ cismi aşağı çeker.
2. $ma=mg\sin30^\circ$ ve $a=g\sin30^\circ=10\cdot0{,}5=5\ \text{m/s}^2$. Doğru cevap A.

Diğer şıklar: **$5\sqrt3$** sinüs yerine kosinüs kullanılmış / **10** serbest düşme ivmesi yazılmış / **30** kütle $6$ kg alınıp kuvvet ivme sanılmış / **60** ağırlık ivme sanılmış.
:::

## Kendini dene

:::dene
1. Net kuvvet sıfır ise cisim nasıl hareket eder? => Durur ya da sabit hızla gider.
2. $m=5$ kg ve $F_{net}=20$ N ise ivme nedir? => 4 m/s².
3. Etki ve tepki kuvvetleri birbirini dengeler mi? => Hayır, farklı cisimlere etki ederler.
4. Yatay zeminde kütlesi 2 kg cismin ağırlığı kaç N'dur? => 20 N ($g=10$).
5. Kinetik sürtünme kuvveti neye bağlıdır? => Normal kuvvete ve yüzey cinsine.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Newton''un Hareket Yasaları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir basketbol topu potaya doğru atıldığında, bir futbol topu kalecinin üzerinden aşırtıldığında ya da bir su fıskiyesinin suyu kavis çizdiğinde cisimler **atış hareketi** yapar. Bu hareketin sırrı şudur: Yatay ve düşey hareketler **birbirinden bağımsızdır**. Yatayda hız sabit kalır, düşeyde ise yerçekimi ivmesi vardır. Bu konuda **serbest düşmeyi, düşey atışı, yatay atışı ve eğik atışı** öğreneceksin. Önceki konulardaki vektör bileşenlerine ayırma ve sabit ivmeli hareket formülleri burada birleşiyor. Havanın direnci bu konuda her zaman ihmal edilir ve $g=10\ \text{m/s}^2$ alınır.

:::hedefler
1. Sabit ivmeli hareket formüllerini ($v=v_0+at$, $x=v_0t+\tfrac12at^2$) kullanmak.
2. Serbest düşme ve düşey atışı çözmek.
3. Yatay atışta düşey ve yatay hareketi ayrı ayrı ele almak.
4. Eğik atışta ilk hızı bileşenlere ayırmak, uçuş süresini, en yüksek noktayı ve menzili bulmak.
5. Atış hareketlerinde enerji ve hız ilişkisini yorumlamak.
:::

:::ipucu
Her atış problemini **iki ayrı hareket** olarak çöz: **yatay** ($a=0$, sabit hız) ve **düşey** ($a=g$ aşağı doğru). İkisini bağlayan tek ortak büyüklük **zamandır**. Önce süreyi düşeyden bul, sonra yatayda $x=v_xt$ yaz.
:::

::video{id="LMme2brJ-nQ" etiket="Konu anlatımı videosu" baslik="Serbest Düşme ve Atışlar" kanal="Özcan Aykın FİZİK"}

## 1. Düşey atışlar

**Serbest düşme:** İlk hız sıfırdır, tek kuvvet ağırlıktır. $h=\tfrac12gt^2$, $v=gt$, $v^2=2gh$.

**Düşey yukarı atış:** İlk hız $v_0$ yukarı doğrudur. Yükselirken yavaşlar, en yüksek noktada hız sıfır olur.

- Çıkış süresi $t_{çık}=\dfrac{v_0}{g}$
- Maksimum yükseklik $H=\dfrac{v_0^2}{2g}$
- Toplam uçuş süresi (aynı seviyeye dönüş) $2\dfrac{v_0}{g}$
- Aynı seviyeden geçerken hızlar eşit büyüklüktedir: aynı noktadan yukarı ve aşağı giderken hız büyüklüğü aynıdır.

**Örnek:** $v_0=30\ \text{m/s}$ ile atılan cisim için $t_{çık}=3\ \text{s}$ ve $H=\dfrac{900}{20}=45\ \text{m}$.

**Düşey aşağı atış:** İlk hız aşağı doğru $v_0$ ise $v=v_0+gt$ ve $h=v_0t+\tfrac12gt^2$.

## 2. Yatay atış

Yüksekten yatay doğrultuda atılan cisim için:

- **Yatay:** $v_x=v_0$ sabit, $x=v_0t$.
- **Düşey:** ilk düşey hız sıfır, $h=\tfrac12gt^2$ ve $v_y=gt$.
- **Uçuş süresi** yalnızca yüksekliğe bağlıdır: $t=\sqrt{\dfrac{2h}{g}}$.
- **Menzil** $x=v_0t$.
- Yere çarpma hızı $v=\sqrt{v_0^2+(gt)^2}$.

**Örnek:** $80\ \text{m}$ yükseklikten $15\ \text{m/s}$ ile yatay atılan cisim için $t=\sqrt{\dfrac{160}{10}}=4\ \text{s}$ ve menzil $15\cdot4=60\ \text{m}$ olur.

**Kritik fikir:** Aynı yükseklikten **serbest bırakılan** cisim ile **yatay atılan** cisim aynı anda yere çarpar. Yatay hız düşey hareketi etkilemez.

## 3. Eğik atış

Yatayla $\theta$ açısı yapan $v_0$ ilk hızıyla atılan cismin ilk hızı bileşenlere ayrılır:

$$v_{0x}=v_0\cos\theta,\qquad v_{0y}=v_0\sin\theta$$

::sim{tur="atis"}

| Büyüklük | Formül |
| --- | --- |
| Çıkış süresi | $\dfrac{v_0\sin\theta}{g}$ |
| Toplam uçuş süresi | $T=\dfrac{2v_0\sin\theta}{g}$ |
| Maksimum yükseklik | $H=\dfrac{(v_0\sin\theta)^2}{2g}$ |
| Menzil | $R=v_0\cos\theta\cdot T=\dfrac{v_0^2\sin2\theta}{g}$ |

**Özellikler:**

- En yüksek noktada **düşey hız sıfırdır**, yatay hız $v_0\cos\theta$ vardır. Hız sıfır olmaz.
- Yatay hız her an aynıdır.
- Aynı hızla atılan cisimde **$\theta$ ve $90^\circ-\theta$ açıları aynı menzili verir.** En büyük menzil $\theta=45^\circ$'de olur.
- Yörünge paraboldür.

**Örnek:** $v_0=50\ \text{m/s}$ ve $\theta=37^\circ$ ($\sin=0{,}6$, $\cos=0{,}8$) için $v_{0x}=40$ ve $v_{0y}=30\ \text{m/s}$. $T=\dfrac{2\cdot30}{10}=6\ \text{s}$, $H=\dfrac{900}{20}=45\ \text{m}$ ve $R=40\cdot6=240\ \text{m}$ olur.

## 4. Atışlarda enerji

Hava direnci yoksa **mekanik enerji korunur**. Atılma noktasındaki kinetik enerji, en yüksek noktada hem kinetik (yatay hızdan) hem potansiyel enerjiye dönüşür. Aynı seviyeden hızların büyüklüğü eşittir.

$$\tfrac12mv_0^2+mgh_0=\tfrac12mv^2+mgh$$

**Örnek:** $20\ \text{m}$ yükseklikten $v_0$ ile (hangi yönde atılırsa atılsın) atılan cismin yere çarpma hızı, atış açısına bağlı değildir. Yere çarpma hızı $v=\sqrt{v_0^2+2gh}$ olur.

## 5. Sık yapılan hatalar

- Eğik atışın en yüksek noktasında hızın sıfır olduğunu sanmak. Yatay bileşen devam eder.
- Atışlarda yatay doğrultuda ivme olduğunu varsaymak.
- Uçuş süresini yatay hıza bağlamak. Süre yalnızca düşey harekete bağlıdır.
- $\sin2\theta$ formülünde $\theta$ ile $2\theta$'yı karıştırmak.

:::baglanti
Atışlar, **vektörler** konusundaki bileşenlere ayırmayı ve **Newton'un hareket yasalarındaki** sabit ivmeyi birleştirir. **Bağıl hareket**, atış yapan cismin hareketli bir platformdan görünmesini açıklar. **İş ve enerji** konusunda mekanik enerjinin korunumu atışların çözümünü kısaltır. **Matematikte parabol** konusundaki ikinci dereceden fonksiyon, atışın yörüngesidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Serbest düşme | $h=\tfrac12gt^2$ |
| Düşey yukarı atış | $H=\dfrac{v_0^2}{2g}$ |
| Yatay atış süresi | $\sqrt{\dfrac{2h}{g}}$ |
| Eğik atış bileşenleri | $v_0\cos\theta$ ve $v_0\sin\theta$ |
| Menzil | $\dfrac{v_0^2\sin2\theta}{g}$ |
| En büyük menzil | $\theta=45^\circ$ |
| Tepe noktası | Düşey hız 0 |

## Mini test

:::soru{cevap="C"}
Yerden 80 m yükseklikteki bir noktadan yatay doğrultuda 15 m/s hızla atılan cismin yere çarptığı noktanın atış noktasının hizasına uzaklığı kaç m'dir? ($g=10\ \text{m/s}^2$)

- A) 30
- B) 45
- C) 60
- D) 80
- E) 120

---

1. Uçuş süresi yalnızca düşey harekete bağlıdır: $80=\tfrac12\cdot10\cdot t^2$ ve $t=4\ \text{s}$.
2. Yatay doğrultuda sabit hız vardır: $x=v_0t=15\cdot4=60\ \text{m}$. Doğru cevap C.

Diğer şıklar: **30** süre 2 s alınmış / **45** süre 3 s alınmış / **80** yükseklik menzil sanılmış / **120** süre 8 s alınmış, $h=gt^2$ kullanılmış.
:::

:::soru{cevap="B"}
Yerden düşey doğrultuda yukarı doğru 30 m/s hızla atılan cismin çıkabileceği **maksimum yükseklik** kaç m'dir? ($g=10\ \text{m/s}^2$)

- A) 15
- B) 45
- C) 60
- D) 90
- E) 900

---

1. En yüksek noktada hız sıfırdır. $v^2=v_0^2-2gH$ ile $0=900-20H$.
2. $H=45\ \text{m}$. Doğru cevap B.

Diğer şıklar: **15** hız yarıya bölünmüş, $\dfrac{v_0}{2}$ / **60** $v_0t_{çık}-gt$ gibi hatalı birleşim kullanılmış / **90** formüldeki $2$ unutulmuş, $\dfrac{v_0^2}{g}$ / **900** yalnızca $v_0^2$ yazılmış.
:::

:::soru{cevap="D"}
Yerden $50\ \text{m/s}$ hızla, yatayla $37^\circ$ açı yapacak biçimde eğik atılan cismin **menzili** kaç m'dir? ($g=10\ \text{m/s}^2$, $\sin37^\circ=0{,}6$ ve $\cos37^\circ=0{,}8$)

- A) 90
- B) 120
- C) 180
- D) 240
- E) 300

---

1. $v_{0x}=50\cdot0{,}8=40\ \text{m/s}$ ve $v_{0y}=50\cdot0{,}6=30\ \text{m/s}$.
2. Uçuş süresi $T=\dfrac{2v_{0y}}{g}=\dfrac{60}{10}=6\ \text{s}$.
3. Menzil $R=v_{0x}T=40\cdot6=240\ \text{m}$. Doğru cevap D.

Diğer şıklar: **90** maksimum yüksekliğin iki katı alınmış / **120** yarım süre kullanılmış, $40\cdot3$ / **180** sinüs ve kosinüs karıştırılmış, $30\cdot6$ / **300** ilk hız ile süre çarpılmış, $50\cdot6$.
:::

:::soru{cevap="E"}
Aynı yükseklikteki iki noktadan aynı anda K cismi serbest bırakılıyor, L cismi yatay doğrultuda $20\ \text{m/s}$ hızla atılıyor. Hava direnci ihmal edildiğine göre aşağıdakilerden hangisi doğrudur?

- A) K cismi L cisminden önce yere çarpar.
- B) L cismi K cisminden önce yere çarpar.
- C) K cisminin yere çarpma hızı L cismininkinden büyüktür.
- D) L cisminin yere çarpma süresi daha uzundur.
- E) İki cisim aynı anda yere çarpar.

---

1. Düşey harekette iki cismin de ilk hızı sıfırdır ve ivme $g$'dir.
2. Yere çarpma süresi $t=\sqrt{\dfrac{2h}{g}}$ yalnızca yüksekliğe bağlıdır. İki cisim aynı anda çarpar. Doğru cevap E.

Diğer şıklar: **K önce çarpar** yatay hızın yolu uzattığı için L'nin geç düşeceği sanılmış / **L önce çarpar** hızlı olan cismin önce düşeceği sanılmış / **K'nin çarpma hızı büyük** L'nin yatay hızı unutulmuş, L'nin hızı daha büyüktür / **L'nin süresi uzun** yatay hız süreyi uzatır sanılmış.
:::

## Kendini dene

:::dene
1. Serbest düşen cisim 2 s sonra kaç m/s hıza ulaşır? => $v=gt=20$ m/s.
2. Eğik atışın en yüksek noktasında hangi hız bileşeni sıfırdır? => Düşey bileşen.
3. Yatay atışta uçuş süresi neye bağlıdır? => Yalnızca yüksekliğe.
4. En büyük menzil hangi açıyla elde edilir? => $45^\circ$.
5. Atışlarda yatay doğrultudaki ivme kaçtır? => Sıfır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Atışlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir kutuyu rampadan yukarı itmek yorucudur. Aynı kutuyu yatay zeminde itmek daha kolaydır. Bir bisiklet yokuş aşağı inerken pedal çevirmene gerek kalmadan hızlanır. Bunları açıklayan kavramlar **iş, enerji ve güçtür**. Fizikte "iş yapmak", bir kuvvetin cismi **kuvvet doğrultusunda yer değiştirmesi** demektir. Enerji, iş yapabilme yeteneğidir. Güç ise işin ne kadar hızlı yapıldığını söyler. Bu konuda iş ve güç tanımlarını, kinetik ve potansiyel enerjiyi, **iş-enerji teoremini** ve **mekanik enerjinin korunumunu** öğreneceksin. Atışlardaki ve Newton'daki bütün problemlerin daha kolay çözümü bu konudan gelir.

:::hedefler
1. Sabit kuvvetin yaptığı işi $W=Fx\cos\theta$ ile hesaplamak.
2. Kuvvet-yol grafiğinin altındaki alanın işe eşit olduğunu kullanmak.
3. Kinetik ve potansiyel enerjiyi hesaplamak.
4. İş-enerji teoremini uygulamak.
5. Mekanik enerjinin korunumuyla hız ve yükseklik bulmak.
6. Gücü $P=\dfrac{W}{t}=Fv$ ile hesaplamak, verimi yorumlamak.
:::

:::ipucu
Hız ya da yükseklik soran ve zamanı sormayan problemlerde **enerji korunumunu** tercih et. Kuvvet ve ivme bulmaktan çok daha kısa sürer. Sürtünme varsa enerjinin bir kısmı ısıya dönüşür: $E_{ilk}=E_{son}+W_{sürtünme}$.
:::

::video{id="96GM19HIyxo" etiket="Konu anlatımı videosu" baslik="İş ve Enerji" kanal="Özcan Aykın FİZİK"}

## 1. İş

Sabit bir $F$ kuvveti, cismi $x$ kadar yer değiştirirken, kuvvet ile yer değiştirme arasındaki açı $\theta$ ise

$$W=F\,x\cos\theta$$

İşin birimi joule ($1\ \text{J}=1\ \text{N}\cdot\text{m}$). İş **skaler** büyüklüktür.

| $\theta$ | İş |
| --- | --- |
| $0^\circ$ (aynı yön) | $W=Fx$ (pozitif) |
| $90^\circ$ (dik) | $W=0$ |
| $180^\circ$ (zıt yön) | $W=-Fx$ (negatif) |

**Örnek:** Yatayla $37^\circ$ yukarı doğru $10\ \text{N}$ kuvvetle cisim $5\ \text{m}$ çekiliyor. $W=10\cdot5\cdot\cos37^\circ=10\cdot5\cdot0{,}8=40\ \text{J}$.

**Sıfır iş:** Yatay yürürken taşıdığın çantanın ağırlığı iş yapmaz, çünkü ağırlık yer değiştirmeye dik. Çember üzerinde dönen cismin merkezcil kuvveti de iş yapmaz.

**Kuvvet-yol grafiği:** $F$-$x$ grafiğinde eğri altındaki alan işi verir. Eksenin altındaki alan negatif iştir.

**Örnek:** Bir cisme $0$-$2\ \text{m}$ arasında $20\ \text{N}$, $2$-$5\ \text{m}$ arasında $10\ \text{N}$ kuvvet uygulanıyor. Toplam iş $20\cdot2+10\cdot3=70\ \text{J}$.

## 2. Enerji çeşitleri

**Kinetik enerji (hareket enerjisi):**

$$E_k=\tfrac12mv^2$$

**Yer çekimi potansiyel enerjisi:**

$$E_p=mgh$$

($h$, seçilen referans seviyesinden yüksekliktir.)

**Esneklik potansiyel enerjisi** (yay): $E_{yay}=\tfrac12kx^2$.

**Mekanik enerji:** $E_{mek}=E_k+E_p$.

## 3. İş-enerji teoremi

Bir cisme etki eden **net kuvvetin yaptığı iş**, kinetik enerjisindeki değişime eşittir:

$$W_{net}=\Delta E_k=\tfrac12mv_{son}^2-\tfrac12mv_{ilk}^2$$

Bu teorem sürtünmeli problemlerde de, değişken kuvvetlerde de çalışır.

**Örnek:** Durgun $2\ \text{kg}$ cisme $70\ \text{J}$'lük net iş yapılırsa $\tfrac12\cdot2\cdot v^2=70$ ve $v=\sqrt{70}\ \text{m/s}$ olur.

## 4. Mekanik enerjinin korunumu

Cisme yalnızca **korunumlu kuvvetler** (yer çekimi, yay kuvveti) etki ediyorsa mekanik enerji korunur:

$$E_{k1}+E_{p1}=E_{k2}+E_{p2}$$

::sim{tur="enerji"}

**Örnek:** Sürtünmesiz eğik düzlemde $5\ \text{m}$ yükseklikten serbest bırakılan cismin düzlemin alt ucundaki hızı $mgh=\tfrac12mv^2$ ile $v=\sqrt{2gh}=\sqrt{100}=10\ \text{m/s}$ olur. Kütle ve eğim açısı sonucu değiştirmez.

**Sürtünmeli durumda:** Sürtünme kuvvetinin yaptığı iş enerji kaybıdır:

$$E_{ilk}-E_{son}=f\cdot x$$

Kaybolan enerji ısıya dönüşür. Enerji yok olmaz, **dönüşür**.

## 5. Güç ve verim

**Güç:** Birim zamanda yapılan iştir.

$$P=\dfrac{W}{t}\qquad\text{ve sabit hızda}\qquad P=Fv$$

Birimi watt ($1\ \text{W}=1\ \text{J/s}$). $1\ \text{kW}=1000\ \text{W}$ ve elektrik tüketiminde kullanılan $1\ \text{kWh}=3{,}6\cdot10^6\ \text{J}$.

**Örnek:** $500\ \text{N}$ çekme kuvveti uygulayan bir motor, cismi $4\ \text{m/s}$ sabit hızla çekiyorsa $P=500\cdot4=2000\ \text{W}$.

**Verim:**

$$\eta=\dfrac{\text{yararlı enerji (iş)}}{\text{harcanan enerji (iş)}}\cdot100$$

Verim hiçbir zaman %100'ü geçmez. Sürtünme ve ısı kayıpları verimi düşürür.

## 6. Sık yapılan hatalar

- $W=Fx$ yazıp açıyı unutmak. Kuvvet ile yer değiştirme arasındaki açıya bak.
- Potansiyel enerjide referans seviyesini belirtmemek.
- Sürtünmeli durumda mekanik enerjinin korunduğunu sanmak.
- Gücü iş ile karıştırmak. Güç, **işin süreye oranıdır**.

:::baglanti
İş-enerji teoremi, **Newton'un hareket yasalarının** ($F=ma$) yol boyunca integralidir. **Atışlarda** enerji korunumu hızı doğrudan verir. **İtme ve momentum** konusunda çarpışmalarda enerji korunur mu korunmaz mı sorusu önemlidir. **Elektriksel potansiyel** konusu, yer çekimi potansiyel enerjisinin elektriksel karşılığıdır. **Termodinamik** ve **modern fizik** de enerji korunumu üzerine kuruludur.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İş | $W=Fx\cos\theta$ |
| $F$-$x$ grafiği | Alan iştir |
| Kinetik enerji | $\tfrac12mv^2$ |
| Potansiyel enerji | $mgh$ |
| İş-enerji | $W_{net}=\Delta E_k$ |
| Korunum | $E_{mek}$ sabit (sürtünmesiz) |
| Güç | $\dfrac{W}{t}=Fv$ |

## Mini test

:::soru{cevap="B"}
Yatayla $37^\circ$ yukarı doğru 10 N büyüklüğünde sabit bir kuvvetle bir cisim yatay zeminde 5 m çekiliyor. Bu kuvvetin yaptığı iş kaç J'dür? ($\cos37^\circ=0{,}8$, $\sin37^\circ=0{,}6$)

- A) 30
- B) 40
- C) 50
- D) 62,5
- E) 80

---

1. İş, kuvvetin yer değiştirme doğrultusundaki bileşeni ile yer değiştirmenin çarpımıdır: $W=Fx\cos\theta$.
2. $W=10\cdot5\cdot0{,}8=40\ \text{J}$. Doğru cevap B.

Diğer şıklar: **30** kosinüs yerine sinüs kullanılmış / **50** açı dikkate alınmamış, $Fx$ / **62,5** $0{,}8$'e bölünmüş / **80** iş iki katı alınmış.
:::

:::soru{cevap="C"}
Sürtünmesiz bir eğik düzlemde yerden 5 m yükseklikten serbest bırakılan cismin düzlemin alt ucundaki hızı kaç m/s olur? ($g=10\ \text{m/s}^2$)

- A) 5
- B) $5\sqrt2$
- C) 10
- D) 50
- E) 100

---

1. Sürtünme olmadığından mekanik enerji korunur: $mgh=\tfrac12mv^2$.
2. $v=\sqrt{2gh}=\sqrt{2\cdot10\cdot5}=10\ \text{m/s}$. Doğru cevap C.

Diğer şıklar: **5** yükseklik hız sanılmış / **$5\sqrt2$** $\sqrt{gh}$ hesaplanmış, $2$ unutulmuş / **50** $gh$ çarpımı alınmış / **100** $v^2$ değeri yazılmış, karekök alınmamış.
:::

:::soru{cevap="D"}
Bir motor, 500 N'luk sabit bir çekme kuvvetiyle bir cismi 4 m/s sabit hızla çekiyor. Motorun gücü kaç W'dır?

- A) 125
- B) 496
- C) 504
- D) 2000
- E) 4000

---

1. Sabit hızda güç $P=Fv$ ile bulunur.
2. $P=500\cdot4=2000\ \text{W}$. Doğru cevap D.

Diğer şıklar: **125** kuvvet hıza bölünmüş / **496** hız kuvvetten çıkarılmış / **504** hız kuvvete eklenmiş / **4000** hız 8 m/s sanılmış.
:::

:::soru{cevap="C"}
Durmakta olan bir cisme yol boyunca uygulanan kuvvet, 0-2 m arasında 20 N, 2-5 m arasında 10 N'dur. Kuvvet doğrultusunda hareket eden cisim 5 m sonunda kaç J kinetik enerjiye sahip olur? (Sürtünme yoktur.)

- A) 30
- B) 40
- C) 70
- D) 100
- E) 140

---

1. Kuvvet-yol grafiğinin altındaki alan işi verir: $20\cdot2+10\cdot3=40+30=70\ \text{J}$.
2. İş-enerji teoremine göre $W=\Delta E_k=E_k-0$, yani $E_k=70\ \text{J}$. Doğru cevap C.

Diğer şıklar: **30** yalnızca ikinci bölge alınmış / **40** yalnızca ilk bölge alınmış / **100** ilk kuvvet tüm yolla çarpılmış, $20\cdot5$ / **140** iş iki katı alınmış.
:::

## Kendini dene

:::dene
1. Kuvvet yer değiştirmeye diktir. Yapılan iş kaçtır? => Sıfır.
2. $m=2$ kg ve $v=3$ m/s olan cismin kinetik enerjisi nedir? => $\tfrac12\cdot2\cdot9=9$ J.
3. $5$ kg cisim $2$ m yükseğe çıkarılırsa potansiyel enerji kazancı nedir? => $5\cdot10\cdot2=100$ J.
4. $600$ J iş $20$ s'de yapılıyor. Güç kaçtır? => 30 W.
5. Verim %100'den büyük olabilir mi? => Hayır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'İş, Güç ve Enerji'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Hızlı gelen bir tenis topunu raketle yakalamak ile yavaş gelen bir topu karşılamak aynı çabayı istemez. Bir kamyon ile bir bisiklet aynı hızda gitse de kamyonu durdurmak çok daha zordur. Çarpışma sonrası araçların ne kadar savrulacağı, bir roketin nasıl yükseldiği, bir bilardo topunun diğerine çarpınca nasıl hareket ettiği hep **momentum** ile açıklanır. Bu konuda **momentum** ($p=mv$), **itme** ($I=F\Delta t$), **itme-momentum teoremini**, **momentumun korunumunu** ve **çarpışma türlerini** öğreneceksin. Çarpışma sorularının çoğu, momentumun korunumuyla birkaç satırda çözülür.

:::hedefler
1. Momentumu ve birimini tanımlamak.
2. İtmeyi hesaplamak ve itme-momentum teoremini kullanmak.
3. $F$-$t$ grafiğinin altındaki alanın itmeyi verdiğini bilmek.
4. Momentumun korunumu şartlarını belirlemek.
5. Esnek ve esnek olmayan çarpışmaları ayırt etmek.
6. Çarpışmada enerji kaybını hesaplamak.
:::

:::ipucu
Çarpışma sorularında **önce momentum korunumunu yaz**, çünkü dış kuvvet yoksa her çarpışmada geçerlidir. Kinetik enerji ise yalnızca **esnek çarpışmada** korunur. Yönleri işaretle: bir yönü $+$, zıt yönü $-$ al.
:::

::video{id="BRquBxkajpk" etiket="Konu anlatımı videosu" baslik="İtme ve Çizgisel Momentum" kanal="Özcan Aykın FİZİK"}

## 1. Momentum

Kütle ile hızın çarpımına **momentum** (çizgisel momentum) denir:

$$\vec p=m\vec v$$

Birimi $\text{kg}\cdot\text{m/s}$. Momentum **vektörel** büyüklüktür, yönü hızın yönündedir.

**Örnek:** $2\ \text{kg}$ kütleli cisim $5\ \text{m/s}$ ile gidiyorsa momentumu $10\ \text{kg}\cdot\text{m/s}$.

**Momentum ve kinetik enerji ilişkisi:** $E_k=\dfrac{p^2}{2m}$. Aynı momentumlu cisimlerden kütlesi küçük olanın kinetik enerjisi büyüktür.

## 2. İtme

Bir cisme etki eden kuvvetin zamanla çarpımı **itme**dir:

$$\vec I=\vec F\,\Delta t$$

Birimi $\text{N}\cdot\text{s}=\text{kg}\cdot\text{m/s}$. İtme vektörel büyüklüktür.

**İtme-momentum teoremi:** Net kuvvetin itmesi, momentum değişimine eşittir:

$$\vec I=\Delta\vec p=m\vec v_{son}-m\vec v_{ilk}$$

Bu teorem $F_{net}=ma$'nın başka bir yazılışıdır: $F=\dfrac{\Delta p}{\Delta t}$.

**Örnek:** $3\ \text{kg}$ kütleli cismin hızı $4\ \text{m/s}$'den $10\ \text{m/s}$'ye çıkıyorsa $\Delta p=3(10-4)=18\ \text{kg}\cdot\text{m/s}$ ve itme $18\ \text{N}\cdot\text{s}$ olur.

**$F$-$t$ grafiği:** Kuvvet-zaman grafiğinin altındaki alan itmeyi verir.

**Günlük örnek:** Araçlardaki hava yastığı ve çarpışma bölgeleri, aynı momentum değişimini **daha uzun sürede** gerçekleştirir. $\Delta p$ sabitken $\Delta t$ büyürse ortalama kuvvet $F$ küçülür.

**Yön örneği:** Kütlesi $m$ olan top duvara $v$ hızıyla çarpıp aynı büyüklükte hızla geri dönerse $\Delta p=-mv-mv=-2mv$. Duvarın topa itmesinin büyüklüğü $2mv$'dir. Top duvara yapışsaydı yalnızca $mv$ olurdu.

## 3. Momentumun korunumu

Bir sistemin üzerine **dış net kuvvet etki etmiyorsa** toplam momentum sabittir:

$$\sum\vec p_{ilk}=\sum\vec p_{son}$$

Çarpışma ve patlamalarda iç kuvvetler çok büyük, süre çok kısa olduğundan sistemin momentumu çarpışmadan hemen önce ve hemen sonra aynı kabul edilir.

::sim{tur="carpisma"}

**Örnek (patlama):** Durgun bir cisim iki parçaya ayrılırsa toplam momentum sıfır kalır. Parçalar zıt yönlerde ve momentumları eşit büyüklükte gider: $m_1v_1=m_2v_2$.

## 4. Çarpışma türleri

| Tür | Momentum | Kinetik enerji |
| --- | --- | --- |
| Esnek çarpışma | Korunur | Korunur |
| Esnek olmayan çarpışma | Korunur | Bir kısmı kaybolur |
| Tam esnek olmayan (yapışma) | Korunur | En çok kaybolan, cisimler birlikte gider |

**Tam esnek olmayan çarpışma:** Kütleleri $m_1$, $m_2$ ve hızları $v_1$, $v_2$ ise

$$v_{ortak}=\dfrac{m_1v_1+m_2v_2}{m_1+m_2}$$

**Örnek:** $m_1=4\ \text{kg}$ kütle $6\ \text{m/s}$ ile durgun $m_2=2\ \text{kg}$ kütleye çarpıp yapışıyor. $v=\dfrac{4\cdot6+0}{6}=4\ \text{m/s}$. Kinetik enerji kaybı $\tfrac12\cdot4\cdot36-\tfrac12\cdot6\cdot16=72-48=24\ \text{J}$.

**Esnek çarpışma (aynı doğrultuda):** İki bağıntı birden yazılır: momentum korunumu ve kinetik enerji korunumu. Eşit kütleli cisimler esnek çarpışmada hızlarını **değiştirir**. Özel durum: $m_1=m_2$ ve ikinci cisim durgun ise, birinci cisim durur, ikinci cisim $v_1$ hızıyla gider.

**Enerji kaybı:** Esnek olmayan çarpışmada kaybolan kinetik enerji ısı, ses ve şekil değişimi enerjisine dönüşür.

## 5. İki boyutlu çarpışmalar

Cisimler farklı doğrultularda hareket ediyorsa momentum **bileşenlere ayrılır** ve $x$ ile $y$ doğrultularında ayrı ayrı korunur. Dik gelen iki cisim birbirine yapışırsa $p_x$ ve $p_y$ ayrı ayrı yazılır ve bileşke momentum Pisagor ile bulunur.

## 6. Sık yapılan hatalar

- Momentumu skaler gibi toplamak. Yönleri işaretle.
- Esnek olmayan çarpışmada kinetik enerjinin korunduğunu sanmak.
- İtme ile kuvveti karıştırmak. İtme, kuvvetin zamanla etkisidir.
- Çarpışmada sürtünme gibi dış kuvvet varken momentum korunumunu tüm süreç boyunca uygulamak.

:::baglanti
İtme-momentum teoremi, **Newton'un ikinci yasasının** zamanla yazılmış hâlidir. **İş ve enerji** konusuyla birlikte çarpışmalarda enerji kaybını hesaplamakta kullanılır. **Vektörler**, momentumun yön bilgisini taşır. **Kimyada** gaz moleküllerinin çeperlere çarpması basıncı doğurur, bu da momentum aktarımıdır. **Modern fizikte** fotonun momentumu da bu fikrin devamıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Momentum | $p=mv$ |
| İtme | $I=F\Delta t=\Delta p$ |
| $F$-$t$ grafiği | Alan itmedir |
| Korunum | Dış kuvvet yoksa $\sum p$ sabit |
| Esnek | $p$ ve $E_k$ korunur |
| Yapışma | $v=\dfrac{m_1v_1+m_2v_2}{m_1+m_2}$ |

## Mini test

:::soru{cevap="C"}
Kütlesi 3 kg olan bir cismin hızı bir kuvvet etkisiyle 4 m/s'den aynı doğrultuda 10 m/s'ye çıkıyor. Cisme uygulanan itmenin büyüklüğü kaç N·s'dir?

- A) 6
- B) 12
- C) 18
- D) 30
- E) 42

---

1. İtme, momentum değişimine eşittir: $I=\Delta p=m(v_{son}-v_{ilk})$.
2. $I=3(10-4)=18\ \text{N}\cdot\text{s}$. Doğru cevap C.

Diğer şıklar: **6** hız farkı kütle ile çarpılmamış / **12** yalnızca ilk momentum alınmış / **30** yalnızca son momentum alınmış / **42** ilk ve son momentumlar toplanmış.
:::

:::soru{cevap="B"}
Kütlesi 4 kg olan bir cisim 6 m/s hızla gelip durgun hâldeki 2 kg kütleli cisme çarpıyor ve ikisi birlikte hareket ediyor. Çarpışmadan sonraki ortak hız kaç m/s'dir?

- A) 2
- B) 4
- C) 6
- D) 8
- E) 12

---

1. Dış kuvvet yok. Momentum korunur: $m_1v_1+m_2\cdot0=(m_1+m_2)v$.
2. $4\cdot6=6v$ ve $v=4\ \text{m/s}$. Doğru cevap B.

Diğer şıklar: **2** toplam kütle yanlışlıkla 12 kg alınmış, $\dfrac{24}{12}$ / **6** hızın değişmediği sanılmış / **8** toplam kütle yerine 3 kg alınmış, $\dfrac{24}{3}$ / **12** kütle farkı olan 2 kg ile bölünmüş, $\dfrac{24}{2}$.
:::

:::soru{cevap="D"}
Kütlesi $m$ olan bir top, bir duvara dik olarak $v$ hızıyla çarpıyor ve aynı büyüklükteki hızla geri dönüyor. Duvarın topa uyguladığı itmenin büyüklüğü kaçtır?

- A) 0
- B) $\dfrac{mv}{2}$
- C) $mv$
- D) $2mv$
- E) $4mv$

---

1. Yönü seç: duvara doğru $+$ olsun. İlk momentum $+mv$, son momentum $-mv$.
2. $\Delta p=-mv-mv=-2mv$. İtmenin büyüklüğü $2mv$. Doğru cevap D.

Diğer şıklar: **0** hız büyüklüğü aynı olduğu için momentum değişmez sanılmış / **$\dfrac{mv}{2}$** ortalama momentum alınmış / **$mv$** top duvara yapışsaymış gibi hesaplanmış, yön değişimi unutulmuş / **$4mv$** momentum değişimi iki kez sayılmış.
:::

:::soru{cevap="C"}
Zıt yönlerde hareket eden 2 kg kütleli cisim 6 m/s, 4 kg kütleli cisim 3 m/s hızla birbirine çarpıp yapışıyor. Çarpışmada kaybolan kinetik enerji kaç J'dür?

- A) 18
- B) 36
- C) 54
- D) 72
- E) 90

---

1. Momentum korunur: $2\cdot6-4\cdot3=0$ olduğundan yapışık cisimler duruyor, $v=0$.
2. Çarpışma öncesi kinetik enerji $\tfrac12\cdot2\cdot36+\tfrac12\cdot4\cdot9=36+18=54\ \text{J}$.
3. Son kinetik enerji sıfır olduğundan kayıp $54\ \text{J}$. Doğru cevap C.

Diğer şıklar: **18** yalnızca ikinci cismin enerjisi alınmış / **36** yalnızca birinci cismin enerjisi alınmış / **72** birinci cismin enerjisi iki katı alınmış / **90** her iki enerji toplanıp birinci cismin enerjisi bir kez daha eklenmiş.
:::

## Kendini dene

:::dene
1. $5$ kg cisim $3$ m/s ile gidiyor. Momentumu kaçtır? => $15\ \text{kg}\cdot\text{m/s}$.
2. İtmenin birimi nedir? => $\text{N}\cdot\text{s}$.
3. $F$-$t$ grafiğinin altındaki alan neyi verir? => İtmeyi.
4. Esnek olmayan çarpışmada hangi büyüklük korunur? => Momentum.
5. Hava yastığı çarpışma kuvvetini neden azaltır? => $\Delta t$ süresini uzatır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'İtme ve Momentum'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir kapıyı menteşeye yakın yerden itmek zordur, kolu ya da kenarından itmek kolaydır. Anahtarı ne kadar uzun tutarsan somunu o kadar kolay sıkarsın. Tahterevallide ağır olan arkadaşın merkeze yakın oturursa hafif olanla dengede kalırsın. Bütün bu olaylarda önemli olan yalnızca kuvvetin büyüklüğü değil, kuvvetin **dönme ekseninden uzaklığıdır**. Kuvvetin döndürme etkisine **tork** denir. Bu konuda torku, **dönme dengesini**, denge şartlarını, **ağırlık merkezini** ve çubuk-ip problemlerini öğreneceksin. Önceki konulardaki kuvvet ve vektör bilgisi burada, cismin sadece öteleme değil dönme hareketi için de kullanılıyor.

:::hedefler
1. Torku $\tau=F\,d$ ile hesaplamak ve yönünü belirlemek.
2. Kuvvet kolu kavramını ve eğik kuvvette torku bulmak.
3. Denge için $\sum F=0$ ve $\sum\tau=0$ şartlarını kullanmak.
4. Tahterevalli ve çubuk dengesi problemlerini çözmek.
5. Ağırlık merkezini ve kütle merkezini hesaplamak.
6. Denge türlerini (kararlı, kararsız, yansız) ayırt etmek.
:::

:::ipucu
Tork sorularında dönme eksenini **bilmediğin bir kuvvetin üzerinden** seç. O kuvvetin torku sıfır olur ve denklemden çıkar. Saat yönündeki torkları $+$, ters yöndekileri $-$ al ve toplamı sıfıra eşitle.
:::

::video{id="AsWX1fzRrg4" etiket="Konu anlatımı videosu" baslik="Tork ve Denge" kanal="Fizikle Barış"}

## 1. Tork

Bir kuvvetin bir eksen etrafında döndürme etkisine **tork (moment)** denir:

$$\tau=F\cdot d$$

Burada $d$, dönme ekseninden kuvvetin **doğrultusuna olan dik uzaklıktır** (kuvvet kolu). Birimi $\text{N}\cdot\text{m}$.

**Eğik kuvvet:** Kuvvet, çubuğa $\theta$ açısıyla uygulanıyorsa kuvvet kolu $d=\ell\sin\theta$ olur:

$$\tau=F\,\ell\sin\theta$$

Kuvvet çubuğa dik uygulanınca $\theta=90^\circ$ ve tork **en büyüktür**. Kuvvet çubuk doğrultusundaysa tork sıfırdır.

**Yön:** Saat yönünün tersi $+$, saat yönü $-$ seçilir (ya da tersi). Tork vektörel bir büyüklüktür.

**Örnek:** $20\ \text{N}$ kuvvet, $0{,}5\ \text{m}$ uzunluğundaki bir çubuğa $30^\circ$ açıyla uygulanıyor. $\tau=20\cdot0{,}5\cdot\sin30^\circ=5\ \text{N}\cdot\text{m}$.

![Dönme eksenine bağlı çubuğa eğik uygulanan kuvvet ve kuvvet kolu](/lessons/ayt-fiz/tork-kuvvet-kolu.svg "Tork ve kuvvet kolu")

## 2. Denge şartları

Bir cismin **dengede** olması için iki şart birlikte sağlanmalıdır:

1. **Öteleme dengesi:** $\sum\vec F=0$
2. **Dönme dengesi:** $\sum\tau=0$ (herhangi bir noktaya göre)

**Örnek:** Tahterevallide sol tarafta $40\ \text{kg}$'lık çocuk eksenden $2\ \text{m}$ uzakta, sağ tarafta $50\ \text{kg}$'lık çocuk $d$ uzaklıkta oturuyor. Dönme dengesi için $40\cdot10\cdot2=50\cdot10\cdot d$ ve $d=1{,}6\ \text{m}$.

::sim{tur="kaldirac"}

**Çubuk ve ip problemleri:** Homojen bir çubuk duvara bir ucundan mafsallı, öbür ucundan bir iple tavana bağlı ise

- Dönme ekseni mafsal olarak seçilir, mafsalın tepkisi denklemden çıkar.
- Çubuğun ağırlığı **ortasına** etki eder.

**Örnek:** Duvara bir ucundan mafsallı, $4\ \text{m}$ uzunluğunda, $20\ \text{kg}$'lık homojen yatay çubuğun serbest ucu düşey bir iple tavana bağlanmış. Mafsala göre tork denklemi $T\cdot4=200\cdot2$ ve $T=100\ \text{N}$ olur.

## 3. Kuvvet çifti

Eşit büyüklükte, zıt yönde ve farklı doğrultulardaki iki kuvvete **kuvvet çifti** denir. Bileşkesi sıfırdır ama cismi **döndürür**. Torku $\tau=F\cdot d$ ($d$ iki kuvvet arasındaki dik uzaklık). Direksiyon simidini iki elle çevirmek ve musluğu açmak örnektir.

## 4. Ağırlık merkezi ve kütle merkezi

**Ağırlık merkezi:** Cismin bütün ağırlığının etki ettiği varsayılan noktadır. Düzgün (homojen) cisimlerde geometrik merkezdedir.

**Kütle merkezi:** Noktasal kütleler için

$$x_{km}=\dfrac{m_1x_1+m_2x_2+\dots}{m_1+m_2+\dots}$$

**Örnek:** $x=0$'da $2\ \text{kg}$, $x=4\ \text{m}$'de $6\ \text{kg}$ varsa $x_{km}=\dfrac{2\cdot0+6\cdot4}{8}=3\ \text{m}$. Kütle merkezi ağır kütleye yakındır.

**Bilinen şekiller:** Dikdörtgen ve daire, merkezde. Üçgen, medyanların kesişimi olan ağırlık merkezi tabana $\dfrac13$ yükseklikte. L biçimli cisimlerde parçalara ayırıp kütle merkezi formülü uygulanır.

## 5. Denge türleri

Dengede olan bir cisim hafifçe itilirse:

- **Kararlı denge:** Cisim ilk konumuna döner. Ağırlık merkezi en alçak konumdadır (çukurdaki top).
- **Kararsız denge:** Cisim uzaklaşır. Ağırlık merkezi en yüksek konumdadır (tepedeki top).
- **Yansız denge:** Cisim yeni konumunda da dengede kalır (düz zeminde top).

**Devrilme:** Cismin ağırlık merkezinden inen düşey doğru taban alanının dışına çıkarsa cisim devrilir. Tabanı geniş, ağırlık merkezi alçak cisimler kararlıdır.

## 6. Sık yapılan hatalar

- Kuvvet kolunu eksenden kuvvetin uygulandığı noktaya olan uzaklık sanmak. Kol **dik** uzaklıktır.
- Çubuğun ağırlığını unutmak ya da uçlarına koymak. Homojen çubukta ağırlık ortadadır.
- Dönme dengesinde sadece kuvvetlerin eşitliğine bakmak. Tork da dengelenmeli.
- Torku skaler gibi toplamak. Yönleri işaretle.

:::baglanti
Tork, **vektörler** ve **Newton'un yasalarının** dönme hareketine uyarlamasıdır. **Basit makineler** konusunda kaldıraç, tork dengesinin pratik uygulamasıdır. **Çembersel hareket** konusunda dönen cisimlerin dinamiği tork ile anlatılır. **Manyetizma** konusunda akım taşıyan telin manyetik alandaki dönme eğilimi de torkla açıklanır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tork | $\tau=F\cdot d$ |
| Eğik kuvvet | $\tau=F\ell\sin\theta$ |
| Denge | $\sum F=0$ ve $\sum\tau=0$ |
| Tahterevalli | $m_1d_1=m_2d_2$ |
| Kütle merkezi | $\dfrac{\sum m_ix_i}{\sum m_i}$ |
| Kararlı denge | Ağırlık merkezi en alçakta |

## Mini test

:::soru{cevap="A"}
20 N büyüklüğündeki bir kuvvet, 0,5 m uzunluğundaki bir çubuğun ucuna, çubukla $30^\circ$ açı yapacak biçimde uygulanıyor. Kuvvetin çubuğun diğer ucuna göre torku kaç N·m'dir? ($\sin30^\circ=0{,}5$, $\cos30^\circ\approx0{,}87$)

- A) 5
- B) 8,7
- C) 10
- D) 20
- E) 40

---

1. Kuvvet kolu, çubuk uzunluğunun kuvvete dik bileşenidir: $d=\ell\sin\theta$.
2. $\tau=F\ell\sin30^\circ=20\cdot0{,}5\cdot0{,}5=5\ \text{N}\cdot\text{m}$. Doğru cevap A.

Diğer şıklar: **8,7** sinüs yerine kosinüs kullanılmış / **10** açı dikkate alınmamış, $F\ell$ / **20** yalnızca kuvvet yazılmış / **40** kuvvet uzunluğa bölünüp açı atılmış, $\dfrac{20}{0{,}5}$.
:::

:::soru{cevap="C"}
Bir tahterevallide eksenden 2 m uzaklıkta oturan 40 kg kütleli çocuk, karşı tarafta eksenden 1,6 m uzakta oturan çocukla dengededir. Karşıdaki çocuğun kütlesi kaç kg'dır?

- A) 32
- B) 40
- C) 50
- D) 64
- E) 80

---

1. Dönme dengesi için torklar eşittir: $m_1gd_1=m_2gd_2$.
2. $40\cdot2=m_2\cdot1{,}6$ ve $m_2=50\ \text{kg}$. Doğru cevap C.

Diğer şıklar: **32** oran ters kurulmuş, $\dfrac{40\cdot1{,}6}{2}$ / **40** kütleler eşit sanılmış / **64** yalnızca kütle ile kol çarpılmış, $40\cdot1{,}6$ / **80** tork değeri kütle sanılmış.
:::

:::soru{cevap="B"}
Uzunluğu 4 m, kütlesi 20 kg olan homojen bir çubuk, bir ucundan duvara mafsallıdır. Serbest ucundan düşey bir iple tavana bağlanarak yatay dengede tutuluyor. İpteki gerilme kuvveti kaç N'dur? ($g=10\ \text{m/s}^2$)

- A) 50
- B) 100
- C) 150
- D) 200
- E) 400

---

1. Dönme eksenini mafsal seç. Çubuğun ağırlığı ($200\ \text{N}$) ortasında, yani $2\ \text{m}$ uzakta etki eder.
2. $T\cdot4=200\cdot2$ ve $T=100\ \text{N}$. Doğru cevap B.

Diğer şıklar: **50** kuvvet kolu 8 m sanılmış / **150** ağırlığın $\dfrac34$'ü alınmış, ağırlık merkezi 3 m alınmış / **200** gerilme ağırlığa eşit sanılmış / **400** gerilme ağırlığın iki katı alınmış.
:::

:::soru{cevap="C"}
Doğru üzerinde $x=0$ noktasında 2 kg, $x=4\ \text{m}$ noktasında 6 kg kütleli iki cisim bulunmaktadır. Sistemin kütle merkezinin konumu kaç m'dir?

- A) 1
- B) 2
- C) 3
- D) 4
- E) 6

---

1. Kütle merkezi $x_{km}=\dfrac{m_1x_1+m_2x_2}{m_1+m_2}$ ile bulunur.
2. $x_{km}=\dfrac{2\cdot0+6\cdot4}{2+6}=\dfrac{24}{8}=3\ \text{m}$. Doğru cevap C.

Diğer şıklar: **1** kütleler ters yerleştirilmiş, hafif cisim ağır sanılmış / **2** orta nokta alınmış, kütleler dikkate alınmamış / **4** yalnızca ağır cismin konumu yazılmış / **6** ağır cismin kütlesi konum sanılmış.
:::

## Kendini dene

:::dene
1. Kuvvet çubuk doğrultusunda ise tork kaçtır? => Sıfır.
2. $F=10$ N ve $d=0{,}3$ m ise tork nedir? => 3 N·m.
3. Dengede olan cisim için $\sum\tau$ kaçtır? => Sıfır.
4. Homojen çubuğun ağırlığı nerede etki eder? => Orta noktasında.
5. Çukurdaki top hangi denge türündedir? => Kararlı denge.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Tork ve Denge'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bidonu kamyona çıkarmak için rampa kullanırsın. Kuyudan su çekmek için makara, çivi sökmek için levye, bisikletin pedallarını çevirmek için dişli kullanırsın. Bunların hepsi **basit makinedir**: Kuvveti artırmaya ya da yönünü değiştirmeye yarayan düzeneklerdir. Basit makineler **iş yapmaz**, işi **kolaylaştırır**. Daha az kuvvetle aynı işi yapman için daha uzun yol almanı isterler. Bu konuda **kaldıraç, makara, eğik düzlem, çıkrık ve dişli** sistemlerini, **mekanik avantajı** ve **işin korunumu** ilkesini öğreneceksin. Önceki konulardaki tork ve iş bilgisi burada doğrudan kullanılıyor.

:::hedefler
1. Basit makinelerin amacını ve işin korunumunu ("altın kural") açıklamak.
2. Kaldıraçta denge ve kuvvet kazancını hesaplamak.
3. Sabit ve hareketli makara ile palangada kuvvet ve yol ilişkisini bulmak.
4. Eğik düzlemde kuvvet kazancını hesaplamak.
5. Çıkrık ve dişli sistemlerinde dönme ilişkisini kurmak.
6. Verim ile gerçek kuvveti hesaplamak.
:::

:::ipucu
Basit makine sorularında önce **işin korunumunu** düşün: $F\cdot x_F=G\cdot x_G$. Kuvvetten ne kazanıyorsan **yoldan** o kadar kaybedersin. Ağırlığı ve sürtünmeyi ihmal ettiğini soru söylemişse ideal makine olarak çöz.
:::

::video{id="dsTIUsQM2d8" etiket="Konu anlatımı videosu" baslik="Kuvvet Kazancı ve Verim" kanal="Özcan Aykın FİZİK"}

## 1. Mekanik avantaj ve işin korunumu

**Mekanik avantaj:**

$$MA=\dfrac{\text{yük}}{\text{uygulanan kuvvet}}=\dfrac{G}{F}$$

$MA>1$ ise makine kuvvetten kazandırır. Sürtünme yoksa **işin korunumu** geçerlidir:

$$F\cdot x_F=G\cdot x_G$$

Kuvvet $n$ kat azalırsa, kuvvetin uygulandığı yol $n$ kat artar. **Hiçbir basit makine enerji kazandırmaz.**

**Verim:** Gerçek makinelerde $\eta=\dfrac{G\,x_G}{F\,x_F}<1$. Verimli makinede gerçek kuvvet, ideal kuvvetin $\dfrac{1}{\eta}$ katıdır.

## 2. Kaldıraç

Bir mesnet (dayanak) etrafında dönebilen çubuğa kaldıraç denir. Denge ya da sabit hızda dönmede torklar eşittir:

$$F\cdot d_F=G\cdot d_G$$

| Tür | Mesnet konumu | Örnek |
| --- | --- | --- |
| 1. tür | Kuvvet ile yük arasında | Makas, tahterevalli |
| 2. tür | Yük, mesnet ile kuvvet arasında | El arabası, fındık kıracağı |
| 3. tür | Kuvvet, mesnet ile yük arasında | Cımbız, olta |

::sim{tur="kaldirac"}

**Örnek:** Yük $300\ \text{N}$, yük kolu $20\ \text{cm}$ ve kuvvet kolu $60\ \text{cm}$ ise $F\cdot60=300\cdot20$ ve $F=100\ \text{N}$. $MA=3$. Kuvvet 3 kat azalır ama kuvvetin yolu 3 kat artar.

3. tür kaldıraçta $MA<1$'dir. Kuvvet büyür ama yük daha hızlı ve geniş hareket eder.

## 3. Makaralar

**Sabit makara:** Yönü değiştirir, kuvvetten kazandırmaz. $F=G$, $MA=1$.

**Hareketli makara:** Yük makaraya bağlıdır. Yükü iki ip taşır. $F=\dfrac G2$ ve $MA=2$. İp yolu yükün yolunun 2 katıdır.

**Palanga:** Birden çok makaranın birleşimidir. Yükü taşıyan **ip sayısı** $n$ ise ideal durumda

$$F=\dfrac Gn,\qquad x_F=n\cdot x_G$$

**Örnek:** İki sabit, iki hareketli makaradan oluşan palangada yükü $4$ ip taşıyorsa $800\ \text{N}$'luk yükü kaldırmak için $F=200\ \text{N}$ yeter. Yükü $2\ \text{m}$ yükseltmek için ip $8\ \text{m}$ çekilir.

**Ağırlığı olan makara:** Hareketli makaranın ağırlığı $G_m$ ise $F=\dfrac{G+G_m}{n}$.

## 4. Eğik düzlem

Yükü yükseğe çıkarmak için eğik düzlem kullanılır. Sürtünmesiz durumda iş korunumu: $F\cdot\ell=G\cdot h$ ve

$$F=G\dfrac{h}{\ell},\qquad MA=\dfrac{\ell}{h}$$

($\ell$ eğik düzlemin boyu, $h$ yükseklik). Düzlem ne kadar **uzun ve az eğimliyse** kuvvet kazancı o kadar büyük, ama yol o kadar uzundur.

**Örnek:** $\ell=3\ \text{m}$ ve $h=1{,}2\ \text{m}$ ise $MA=\dfrac{3}{1{,}2}=2{,}5$. $600\ \text{N}$ yük için $F=600\cdot\dfrac{1{,}2}{3}=240\ \text{N}$.

**Türevleri:** **Kama** (balta, bıçak) ve **vida** eğik düzlemin farklı biçimleridir. Vidanın adımı küçüldükçe kuvvet kazancı artar.

## 5. Çıkrık ve dişli çarklar

**Çıkrık:** Büyük yarıçaplı bir tekerle (kol) küçük yarıçaplı silindir (mil) aynı eksende dönüyor. Denge: $F\cdot R=G\cdot r$ ve $MA=\dfrac Rr$. Kuyu çıkrığı, direksiyon, tornavida örneğidir.

**Dişli çarklar:** Birbirine geçmiş dişlilerde **diş sayısı ile dönme sayısı ters orantılıdır**:

$$N_1\cdot f_1=N_2\cdot f_2$$

($N$ diş sayısı, $f$ devir sayısı ya da frekans). Dişliler birbirine geçmişse **zıt yönde** döner. Aynı eksendeki dişliler **aynı yönde ve aynı açısal hızla** döner. Aynı kayışla bağlı çarklarda kenar hızları eşittir.

**Örnek:** $A$ dişlisinde $40$ diş, $B$ dişlisinde $10$ diş var. $A$ bir tur döndüğünde $B$, $\dfrac{40}{10}=4$ tur döner. Küçük dişli büyükten daha hızlı döner.

## 6. Sık yapılan hatalar

- Basit makinelerin enerji kazandırdığını sanmak. Kazanılan kuvvet, kaybedilen yoldur.
- Palangada yükü taşıyan ip sayısını yanlış saymak. Çekilen ucun kendisi sayılmaz, yalnızca yükü ve hareketli makarayı taşıyan iplere bakılır.
- Kaldıraçta kuvvet kolunu mesnetten kuvvetin etki ettiği noktaya olan uzaklıkla karıştırmak. Dik uzaklık alınır.
- Dişlilerde diş sayısı ile devir sayısını doğru orantılı sanmak.

:::baglanti
Kaldıraç **tork ve denge** konusunun, eğik düzlem **Newton'un yasaları** ve **iş-enerji** konusunun uygulamasıdır. **Makara** sistemleri ip gerilmesi ve ağırlık bilgisini birleştirir. Dişli çarklar **çembersel hareket** ve dönme hızı bilgisiyle bağlanır. **Teknolojide** vinçler, krikolar, bisiklet vitesleri ve robotik kollar basit makine ilkelerine dayanır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İşin korunumu | $F\,x_F=G\,x_G$ |
| Kaldıraç | $F\,d_F=G\,d_G$ |
| Sabit makara | Yön değiştirir, $MA=1$ |
| Hareketli makara | $F=\dfrac G2$ |
| Palanga | $F=\dfrac Gn$, yol $n$ katı |
| Eğik düzlem | $MA=\dfrac{\ell}{h}$ |
| Dişli | $N_1f_1=N_2f_2$ |

## Mini test

:::soru{cevap="B"}
Ağırlığı 300 N olan bir yük, 20 cm yük kolu ve 60 cm kuvvet kolu olan ideal bir kaldıraçla dengede tutuluyor. Uygulanan kuvvet kaç N'dur?

- A) 33
- B) 100
- C) 300
- D) 600
- E) 900

---

1. Kaldıraç dengesi: $F\cdot d_F=G\cdot d_G$.
2. $F\cdot60=300\cdot20$ ve $F=100\ \text{N}$. Doğru cevap B.

Diğer şıklar: **33** kol oranı iki kez uygulanmış, $300\cdot\dfrac{20}{60}\cdot\dfrac{20}{60}$ / **300** kaldıraç kuvvet kazandırmaz sanılmış / **600** yük iki katı alınmış / **900** kollar ters alınmış, $300\cdot\dfrac{60}{20}$.
:::

:::soru{cevap="D"}
Yükü 4 ip taşıyan ideal bir palanga ile bir yük 2 m yükseltiliyor. Çekilen ipin ucu kaç m yol alır?

- A) 2
- B) 4
- C) 6
- D) 8
- E) 16

---

1. İşin korunumu: $F\cdot x_F=G\cdot x_G$ ve palangada $F=\dfrac G4$.
2. $x_F=4\cdot x_G=4\cdot2=8\ \text{m}$. Doğru cevap D.

Diğer şıklar: **2** yolun değişmediği sanılmış / **4** yalnızca $4$ ip sayısı yol sanılmış / **6** ip sayısı bir eksik alınmış, $3\cdot2$ / **16** yol iki kez dört katına çıkarılmış.
:::

:::soru{cevap="C"}
Boyu 3 m, yüksekliği 1,2 m olan sürtünmesiz bir eğik düzlemin mekanik avantajı kaçtır?

- A) 0,4
- B) 1,8
- C) 2,5
- D) 3,6
- E) 4,2

---

1. Eğik düzlemde mekanik avantaj boyun yüksekliğe oranıdır: $MA=\dfrac{\ell}{h}$.
2. $MA=\dfrac{3}{1{,}2}=2{,}5$. Doğru cevap C.

Diğer şıklar: **0,4** oran ters alınmış, $\dfrac{h}{\ell}$ / **1,8** boy ile yükseklik farkı alınmış / **3,6** boy ile yükseklik çarpılmış / **4,2** boy ile yükseklik toplanmış.
:::

:::soru{cevap="D"}
Birbirine geçmiş iki dişliden A'nın 40 dişi, B'nin 10 dişi vardır. A dişlisi 1 tur döndüğünde B dişlisi kaç tur döner?

- A) $\dfrac14$
- B) 1
- C) 3
- D) 4
- E) 30

---

1. Dişlilerde diş sayısı ile devir sayısı ters orantılıdır: $N_Af_A=N_Bf_B$.
2. $40\cdot1=10\cdot f_B$ ve $f_B=4$ tur. Doğru cevap D.

Diğer şıklar: **$\dfrac14$** oran ters alınmış / **1** dişliler aynı devirde dönüyor sanılmış / **3** diş sayıları farkı alınıp 10'a bölünmüş, $\dfrac{30}{10}$ / **30** diş sayıları farkı yazılmış.
:::

## Kendini dene

:::dene
1. Basit makineler enerji kazandırır mı? => Hayır, kuvvet kazancı yoldan kayıptır.
2. Hareketli makarada kuvvet kazancı kaçtır? => 2 kat.
3. Sabit makaranın görevi nedir? => Kuvvetin yönünü değiştirmek.
4. Eğik düzlem daha uzun ve az eğimli olursa ne olur? => Gereken kuvvet azalır, yol uzar.
5. Küçük dişli büyük dişliden daha hızlı mı döner? => Evet.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-fiz' and name = 'Basit Makineler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Kazağını çıkarırken saçının havalandığını, plastik tarağı kuru saça sürtüp küçük kâğıt parçalarını kaldırdığını ya da bulutlardaki yıldırımı düşün. Hepsinde **elektrik yükleri** arasındaki kuvvetler vardır. Yükler birbirini uzaktan çeker ya da iter. Bu etkiyi anlatmak için **elektrik alan** kavramı kullanılır: Bir yük çevresindeki uzayı değiştirir ve başka bir yük bu alanda kuvvet hisseder. Bu konuda **Coulomb yasasını**, **elektrik alanı**, alan çizgilerini, yüklerin dengesini ve iletken kürenin özelliklerini öğreneceksin. Kuvvet ve vektör bilgin burada yeniden kullanılıyor, çünkü elektriksel kuvvet ve alan vektörel büyüklüklerdir.

:::hedefler
1. Yük türlerini ve yükün korunumunu bilmek.
2. Coulomb yasası ile iki yük arasındaki kuvveti hesaplamak.
3. Nokta yükün elektrik alanını $E=\dfrac{kq}{d^2}$ ile hesaplamak.
4. Alan çizgilerini yorumlamak.
5. Birden çok yükün oluşturduğu bileşke alanı vektörel toplamak.
6. Düzgün elektrik alanda yüklü parçacığın hareketini ve iletken kürenin özelliklerini bilmek.
:::

:::ipucu
Elektriksel kuvvet ve alan **vektördür**. Önce büyüklüğü hesapla, yönü ayrı olarak belirle: **aynı işaretli yükler iter, zıt işaretliler çeker**. Alan yönü, **pozitif deneme yükünün** hissedeceği kuvvetin yönüdür. Birden çok yük varsa her yükün alanını ayrı bul ve vektörel topla.
:::

::video{id="m_4P76oYHqI" etiket="Konu anlatımı videosu" baslik="Elektriksel Kuvvet" kanal="Fizikle Barış"}

## 1. Elektrik yükü

- Yük iki türlüdür: pozitif ($+$) ve negatif ($-$).
- Aynı cins yükler birbirini **iter**, zıt cins yükler birbirini **çeker**.
- Yük **korunur**: Yalıtılmış bir sistemde toplam yük değişmez.
- Yük **kuantumludur**: En küçük yük $e=1{,}6\cdot10^{-19}\ \text{C}$. Her yük $e$'nin tam katıdır.
- Birimi coulomb (C). $1\ \mu\text{C}=10^{-6}\ \text{C}$ ve $1\ \text{nC}=10^{-9}\ \text{C}$.

Yüklenme: **Sürtünme, dokunma ve etki** ile cisimler yüklenir. Nötr bir cisimde pozitif ve negatif yükler eşittir. Elektron alan cisim negatif, elektron veren cisim pozitif yüklenir.

## 2. Coulomb yasası

İki nokta yük arasındaki elektriksel kuvvet, yüklerin çarpımı ile doğru, aralarındaki uzaklığın karesiyle ters orantılıdır:

$$F=k\dfrac{q_1q_2}{d^2},\qquad k=9\cdot10^9\ \dfrac{\text{N}\cdot\text{m}^2}{\text{C}^2}$$

Kuvvet, yükleri birleştiren doğru boyunca etki eder. **Etki-tepki** gereği iki yüke etkiyen kuvvetler eşit büyüklükte ve zıt yöndedir.

::sim{tur="coulomb"}

**Örnek:** $q_1=q_2=3\ \mu\text{C}$ ve $d=0{,}3\ \text{m}$ ise $F=9\cdot10^9\cdot\dfrac{9\cdot10^{-12}}{0{,}09}=0{,}9\ \text{N}$.

**Uzaklık etkisi:** Uzaklık 2 katına çıkarsa kuvvet $\dfrac14$'ü olur. Yüklerden biri iki katına çıkarsa kuvvet iki katına çıkar.

## 3. Elektrik alan

Bir $Q$ yükünün çevresinde, $q$ deneme yüküne etkiyen kuvvetin $q$'ya oranı **elektrik alan şiddetidir**:

$$E=\dfrac{F}{q}\qquad\text{ve nokta yük için}\qquad E=k\dfrac{Q}{d^2}$$

Birimi $\text{N/C}$ (ya da $\text{V/m}$). Alan vektörel büyüklüktür. $Q>0$ ise alan yükten **uzağa**, $Q<0$ ise yüke **doğru** yönelir.

**Örnek:** $Q=2\ \text{nC}$ yükünün $3\ \text{m}$ uzağındaki alan $E=9\cdot10^9\cdot\dfrac{2\cdot10^{-9}}{9}=2\ \text{N/C}$.

**Alan yüke bağlı değildir:** Bir noktadaki alan, o noktaya konulan deneme yükünün büyüklüğüne bağlı değildir. Alanı oluşturan kaynak yüke ve konuma bağlıdır. Deneme yüküne etkiyen kuvvet $F=qE$.

## 4. Alan çizgileri

- Pozitif yükten **çıkar**, negatif yüke **girer**.
- Çizgiler birbirini **kesmez**.
- Çizgilerin sıklığı alan şiddetini gösterir. Sık yerde alan büyüktür.
- Alan çizgisi, o noktadaki alan vektörünün doğrultusunu gösterir (teğetidir).

**Düzgün elektrik alan:** Birbirine paralel iki levha arasında alan çizgileri paralel ve eşit aralıklıdır, alan her yerde aynıdır. Bu alanda yüklü parçacığa sabit kuvvet etki eder: $F=qE$ ve $a=\dfrac{qE}{m}$. Parçacık yatay atış benzeri parabolik yol izler.

## 5. Bileşke alan ve denge

**Bileşke alan:** Her yükün alanı ayrı hesaplanır, sonra vektörel toplanır.

**Örnek:** $+Q$ ve $-Q$ ($Q=2\ \mu\text{C}$) yükleri $0{,}6\ \text{m}$ aralıklı. Tam ortada her yük $0{,}3\ \text{m}$ uzakta olup alanlar **aynı yönde** olur: $E=2\cdot9\cdot10^9\cdot\dfrac{2\cdot10^{-6}}{0{,}09}=4\cdot10^5\ \text{N/C}$. Aynı işaretli iki yükün ortasında alanlar zıt yönlüdür ve bileşke sıfırdır.

**Yüklerin dengesi:** Aynı işaretli $q_1$ ve $q_2$ yükleri arasında $d$ uzaklık varsa, üçüncü bir yükün dengede olacağı nokta **arada** ve **küçük yüke yakın** bir yerdir. Kuvvet eşitliğinden

$$\dfrac{q_1}{x_1^2}=\dfrac{q_2}{x_2^2}$$

**Örnek:** $x=0$'da $4Q$, $x=3\ \text{m}$'de $Q$ yükü varsa üçüncü yükün denge noktası $x$'te $\dfrac{4}{x^2}=\dfrac{1}{(3-x)^2}$ olur. $2(3-x)=x$ ve $x=2\ \text{m}$.

## 6. İletkenler

- İletken kürede yük **yüzeyde** toplanır, **içinde alan sıfırdır**.
- Yüzeyde alan yüzeye diktir.
- Yüklü iletken küre dışarıdan nokta yük gibi davranır: $E=\dfrac{kQ}{d^2}$ ($d\ge r$).
- **Sivri uçlarda** yük yoğunluğu ve alan büyüktür (paratonerin çalışma ilkesi).
- Yüklü bir iletken, nötr bir iletkene dokundurulunca yük **yarıçaplara göre** paylaşılır. Aynı büyüklükteki kürelerde yük eşit paylaşılır.

:::baglanti
Coulomb yasası, **Newton'un yasaları ve vektörler** konularının elektrik yüklerine uygulamasıdır. Kuvvetin uzaklığın karesiyle ters orantılı olması, **çembersel harekette** gördüğün kütle çekim kuvvetinin yapısına benzer. **Elektriksel potansiyel** konusu, bu konunun enerji boyutudur. **Manyetizma** da hareket halindeki yüklerin etkisini anlatır. **Kimyada** iyonik bağlar Coulomb kuvvetidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Aynı yük | İter |
| Zıt yük | Çeker |
| Coulomb | $F=\dfrac{kq_1q_2}{d^2}$ |
| Alan | $E=\dfrac{F}{q}=\dfrac{kQ}{d^2}$ |
| Alan yönü | $+$'dan çıkar, $-$'ye girer |
| Düzgün alan | $F=qE$, sabit |
| İletken kürenin içi | $E=0$ |

## Mini test

:::soru{cevap="C"}
İkisi de $3\ \mu\text{C}$ olan iki nokta yük birbirinden $0{,}3\ \text{m}$ uzaklıktadır. Yükler arasındaki elektriksel kuvvet kaç N'dur? ($k=9\cdot10^9\ \text{N}\cdot\text{m}^2/\text{C}^2$)

- A) $0{,}09$
- B) $0{,}27$
- C) $0{,}9$
- D) $2{,}7$
- E) $9$

---

1. Coulomb yasası: $F=k\dfrac{q_1q_2}{d^2}$.
2. $F=9\cdot10^9\cdot\dfrac{(3\cdot10^{-6})^2}{(0{,}3)^2}=9\cdot10^9\cdot\dfrac{9\cdot10^{-12}}{0{,}09}=0{,}9\ \text{N}$. Doğru cevap C.

Diğer şıklar: **0,09** uzaklık 1 m alınmış, $9\cdot10^9\cdot9\cdot10^{-12}$ / **0,27** uzaklığın karesi alınmamış / **2,7** yüklerden biri 9 µC alınmış / **9** uzaklık 0,1 m alınmış.
:::

:::soru{cevap="B"}
$2\ \text{nC}$ değerindeki nokta yükten $3\ \text{m}$ uzaktaki bir noktada elektrik alan şiddeti kaç N/C'dur? ($k=9\cdot10^9\ \text{N}\cdot\text{m}^2/\text{C}^2$)

- A) $\dfrac23$
- B) 2
- C) 6
- D) 18
- E) 54

---

1. Nokta yükün alanı $E=\dfrac{kQ}{d^2}$.
2. $E=9\cdot10^9\cdot\dfrac{2\cdot10^{-9}}{9}=2\ \text{N/C}$. Doğru cevap B.

Diğer şıklar: **$\dfrac23$** uzaklık küp alınmış, $\dfrac{18}{27}$ / **6** uzaklığın karesi yerine kendisi kullanılmış, $\dfrac{18}{3}$ / **18** uzaklığa hiç bölünmemiş, $kQ$ / **54** uzaklık çarpılmış, $kQ\cdot3$.
:::

:::soru{cevap="E"}
$+Q$ ve $-Q$ ($Q=2\ \mu\text{C}$) noktasal yükleri birbirinden $0{,}6\ \text{m}$ uzaklıktadır. Yükleri birleştiren doğrunun tam ortasındaki noktada elektrik alan şiddeti kaç N/C'dur? ($k=9\cdot10^9\ \text{N}\cdot\text{m}^2/\text{C}^2$)

- A) 0
- B) $5\cdot10^4$
- C) $1\cdot10^5$
- D) $2\cdot10^5$
- E) $4\cdot10^5$

---

1. Orta nokta her yükten $0{,}3\ \text{m}$ uzaktadır. Her yükün alanı $E_1=\dfrac{9\cdot10^9\cdot2\cdot10^{-6}}{0{,}09}=2\cdot10^5\ \text{N/C}$.
2. Orta noktada $+Q$ alanı yükten uzağa, $-Q$ alanı yüke doğrudur. İkisi de aynı yönü gösterir ve toplanır.
3. $E=2\cdot2\cdot10^5=4\cdot10^5\ \text{N/C}$. Doğru cevap E.

Diğer şıklar: **0** alanlar zıt yönlü sanılıp birbirini götürmüş / **$5\cdot10^4$** tek yükün alanı $0{,}6\ \text{m}$ ile hesaplanmış / **$1\cdot10^5$** iki alan $0{,}6\ \text{m}$ ile hesaplanıp toplanmış / **$2\cdot10^5$** yalnızca bir yükün alanı alınmış.
:::

:::soru{cevap="C"}
$x=0$ noktasında $+4Q$ yükü, $x=3\ \text{m}$ noktasında $+Q$ yükü sabit tutuluyor. Bu iki yük arasında üçüncü bir yük, üzerine etkiyen net kuvvet sıfır olacak biçimde hangi $x$ noktasına konulmalıdır?

- A) 0,6 m
- B) 1,5 m
- C) 2 m
- D) 2,4 m
- E) 3 m

---

1. Net kuvvet sıfır için iki yükün uyguladığı kuvvetler eşit olmalı: $\dfrac{4Q}{x^2}=\dfrac{Q}{(3-x)^2}$.
2. Karekök alınırsa $2(3-x)=x$ olur. $6-2x=x$ ve $x=2\ \text{m}$. Doğru cevap C.

Diğer şıklar: **0,6 m** uzaklıklar yüklerle doğru orantılı, ters alınmış / **1,5 m** orta nokta alınmış / **2,4 m** uzaklıklar yüklerle doğru orantılı alınmış, kare unutulmuş / **3 m** küçük yükün bulunduğu nokta yazılmış.
:::

## Kendini dene

:::dene
1. Aynı cins yükler birbirini nasıl etkiler? => İter.
2. Uzaklık iki katına çıkarsa Coulomb kuvveti nasıl değişir? => Dörtte birine iner.
3. Alan çizgileri pozitif yükten nasıl yönelir? => Dışarı doğru çıkar.
4. İletken kürenin içinde elektrik alan kaçtır? => Sıfır.
5. En küçük yük miktarı nedir? => Elektron yükü, $1{,}6\cdot10^{-19}$ C.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Elektriksel Kuvvet ve Alan'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir pilin iki ucu arasında "1,5 volt" yazar. Bir prizde 220 volt vardır. Bir fotoğraf makinesinin flaşı, bir kondansatörde biriken enerjiyi bir anda boşaltarak çalışır. Bu büyüklükler, yerçekimi alanındaki yükseklik ve potansiyel enerji kavramlarının elektriksel karşılığıdır. Bu konuda **elektriksel potansiyel enerjiyi**, **potansiyel** ve **potansiyel farkı** (gerilimi), **düzgün alanda potansiyel** ilişkisini, **sığa** kavramını ve **kondansatörlerin bağlanmasını** öğreneceksin. Önceki konudaki elektriksel kuvvet ve alan bilgisi, burada enerji diliyle yeniden ele alınıyor.

:::hedefler
1. Elektriksel potansiyel enerjiyi ve potansiyeli hesaplamak.
2. Potansiyel farkı ile iş ilişkisini ($W=q\,\Delta V$) kullanmak.
3. Düzgün elektrik alanda $V=Ed$ ilişkisini uygulamak.
4. Eş potansiyel yüzeyleri yorumlamak.
5. Sığanın tanımını ve paralel levhalı sığacın özelliklerini bilmek.
6. Kondansatörleri seri ve paralel bağlamak, depolanan enerjiyi hesaplamak.
:::

:::ipucu
Potansiyel **skalerdir**. Birden çok yükün potansiyelini toplarken yönü düşünme, yalnızca işareti dikkate al: pozitif yükün katkısı $+$, negatif yükün katkısı $-$. Alan ise vektördür. Bu fark bileşke hesaplarında işini kolaylaştırır.
:::

::video{id="4IQaPx9Av1I" etiket="Konu anlatımı videosu" baslik="Elektriksel Potansiyel Fark ve İş" kanal="Özcan Aykın FİZİK"}

## 1. Elektriksel potansiyel enerji ve potansiyel

İki nokta yükün birbirine göre potansiyel enerjisi:

$$U=k\dfrac{q_1q_2}{d}$$

$q_1q_2>0$ ise (aynı işaret) $U>0$, zıt işaretli yüklerde $U<0$.

**Potansiyel (elektriksel potansiyel):** Birim yük başına potansiyel enerji:

$$V=\dfrac{U}{q}\qquad\text{nokta yük için}\qquad V=k\dfrac{Q}{d}$$

Birimi volt ($1\ \text{V}=1\ \text{J/C}$). Potansiyel skalerdir. Yükten uzaklaştıkça $V$ azalır (pozitif yük için).

**Örnek:** $Q=4\ \text{nC}$ yükünün $3\ \text{m}$ uzağında $V=9\cdot10^9\cdot\dfrac{4\cdot10^{-9}}{3}=12\ \text{V}$.

**Birden çok yük:** Potansiyeller cebirsel toplanır: $V=V_1+V_2+\dots$

## 2. Potansiyel farkı ve iş

İki nokta arasındaki potansiyel farkı $\Delta V=V_B-V_A$. Bir $q$ yükünü $A$'dan $B$'ye taşırken elektriksel kuvvetin yaptığı iş

$$W_{AB}=-q\,\Delta V=q\,(V_A-V_B)$$

Yükün potansiyel enerjisindeki değişim $\Delta U=q\Delta V$.

**Pratik kural:** Pozitif yük, kendiliğinden **yüksek potansiyelden alçak potansiyele** gider ve alan iş yapar. Negatif yük ise tersi yönde gider.

**Enerji:** Alan tarafından hızlandırılan yükün kinetik enerjisi kazancı $q\,\lvert\Delta V\rvert$ kadardır. $1\ \text{eV}$, bir elektronun $1\ \text{V}$'luk potansiyel farkta kazandığı enerjidir: $1\ \text{eV}=1{,}6\cdot10^{-19}\ \text{J}$.

## 3. Düzgün elektrik alan

Düzgün alanda alana paralel $d$ uzaklığı için

$$V=E\,d\qquad\Longleftrightarrow\qquad E=\dfrac{V}{d}$$

**Örnek:** $E=200\ \text{V/m}$ olan düzgün alanda alan yönünde $5\ \text{cm}$ ilerlenirse $\Delta V=200\cdot0{,}05=10\ \text{V}$. $3\ \mu\text{C}$'luk yükü bu aralıkta taşımak için yapılan iş $W=3\cdot10^{-6}\cdot10=30\ \mu\text{J}$.

**Eş potansiyel yüzeyler:** Potansiyelin aynı olduğu yüzeylerdir. Elektrik alan çizgileri eş potansiyel yüzeylere **diktir**. Bir yükü eş potansiyel yüzey üzerinde taşımak iş gerektirmez, $W=0$.

## 4. Sığa ve kondansatör

Kondansatör, yük (enerji) depolayan elemandır. Paralel iki iletken levhadan oluşur. Levhalar arası potansiyel farkı $V$ ve levhalardaki yük $Q$ ise

$$C=\dfrac{Q}{V}$$

Birimi farad ($1\ \text{F}=1\ \text{C/V}$). Pratikte $\mu\text{F}$ ve $\text{pF}$ kullanılır.

**Paralel levhalı sığa:**

$$C=\varepsilon\dfrac{A}{d}$$

- Levha alanı $A$ büyürse $C$ artar.
- Levhalar arası uzaklık $d$ büyürse $C$ azalır.
- Araya yalıtkan (dielektrik) konursa $C$ artar.

Sığa yalnızca kondansatörün geometrisine ve ortama bağlıdır, $Q$ ve $V$'ye bağlı **değildir**.

**Depolanan enerji:**

$$U=\tfrac12QV=\tfrac12CV^2=\dfrac{Q^2}{2C}$$

**Örnek:** $C=2\ \mu\text{F}$ ve $V=10\ \text{V}$ ise $Q=20\ \mu\text{C}$ ve $U=\tfrac12\cdot2\cdot10^{-6}\cdot100=100\ \mu\text{J}$.

**Levha aralığı değişimi:** Alan yarıya iner ve uzaklık iki katına çıkarsa $C'=\dfrac{\frac A2}{2d}\varepsilon=\dfrac C4$ olur.

## 5. Kondansatörlerin bağlanması

| Bağlama | Eşdeğer sığa | Ortak büyüklük |
| --- | --- | --- |
| Paralel | $C_{eş}=C_1+C_2+\dots$ | Gerilim ($V$) aynı |
| Seri | $\dfrac{1}{C_{eş}}=\dfrac1{C_1}+\dfrac1{C_2}+\dots$ | Yük ($Q$) aynı |

(Dirençlerde formüller tersidir. Kondansatörde **paralel toplanır**.)

**Örnek:** $C_1=6\ \mu\text{F}$ ve $C_2=3\ \mu\text{F}$ seri bağlıysa $C_{12}=\dfrac{6\cdot3}{9}=2\ \mu\text{F}$. Bu birim, $C_3=4\ \mu\text{F}$ ile paralel bağlanırsa $C_{eş}=2+4=6\ \mu\text{F}$ olur.

**Yük paylaşımı:** Yüklü bir kondansatör yüksüz bir kondansatöre bağlanırsa toplam yük korunur. Ortak gerilim $V=\dfrac{Q_{toplam}}{C_1+C_2}$ olur.

## 6. Sık yapılan hatalar

- Potansiyeli vektör gibi toplamak. Potansiyel skalerdir.
- Kondansatör bağlamada seri ve paralel formülleri direnç ile karıştırmak.
- Sığanın yüke ve gerilime bağlı olduğunu sanmak. Sığa geometriyle belirlenir.
- Pozitif yükün hangi yönde hareket ettiğini potansiyel yönüne göre belirlememek.

:::baglanti
Potansiyel ve potansiyel fark, **iş ve enerji** konusunun elektriksel karşılığıdır. **Elektriksel kuvvet ve alan** konusuyla $E=\dfrac Vd$ ilişkisi üzerinden bağlanır. **Alternatif akım** konusunda kondansatörün devredeki davranışı incelenir. **Modern fizikte** elektron-volt (eV) birimi, atomik enerjilerin ve fotonların enerjisini ölçmek için kullanılır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Potansiyel | $V=\dfrac{kQ}{d}$ (skaler) |
| İş | $W=q\,\Delta V$ |
| Düzgün alan | $V=Ed$ |
| Sığa | $C=\dfrac QV=\varepsilon\dfrac Ad$ |
| Enerji | $\tfrac12CV^2$ |
| Paralel | $C_{eş}=C_1+C_2$ |
| Seri | $\dfrac1{C_{eş}}=\dfrac1{C_1}+\dfrac1{C_2}$ |

## Mini test

:::soru{cevap="B"}
$4\ \text{nC}$ değerindeki nokta yükten $3\ \text{m}$ uzaktaki bir noktanın elektriksel potansiyeli kaç V'tur? ($k=9\cdot10^9\ \text{N}\cdot\text{m}^2/\text{C}^2$)

- A) 4
- B) 12
- C) 36
- D) 108
- E) 324

---

1. Nokta yükün potansiyeli $V=\dfrac{kQ}{d}$.
2. $V=9\cdot10^9\cdot\dfrac{4\cdot10^{-9}}{3}=12\ \text{V}$. Doğru cevap B.

Diğer şıklar: **4** uzaklığın karesine bölünmüş, alan formülü kullanılmış, $\dfrac{36}{9}$ / **36** uzaklığa hiç bölünmemiş / **108** uzaklık çarpılmış / **324** uzaklığın karesi çarpılmış.
:::

:::soru{cevap="C"}
Şiddeti $200\ \text{V/m}$ olan düzgün elektrik alanda, alan çizgilerine paralel olarak $5\ \text{cm}$ uzaklıktaki iki nokta arasında $3\ \mu\text{C}$ yükü taşınıyor. Alanın yaptığı iş kaç $\mu\text{J}$'dür?

- A) 3
- B) 10
- C) 30
- D) 60
- E) 300

---

1. Potansiyel farkı $\Delta V=Ed=200\cdot0{,}05=10\ \text{V}$.
2. İş $W=q\,\Delta V=3\ \mu\text{C}\cdot10\ \text{V}=30\ \mu\text{J}$. Doğru cevap C.

Diğer şıklar: **3** yük 1 V ile çarpılmış / **10** potansiyel farkı iş sanılmış / **60** uzaklık $10\ \text{cm}$ alınmış / **300** uzaklık 50 cm alınmış.
:::

:::soru{cevap="C"}
$C_1=6\ \mu\text{F}$ ve $C_2=3\ \mu\text{F}$ kondansatörleri seri bağlanıyor. Bu birim, $C_3=4\ \mu\text{F}$ kondansatörle paralel bağlanırsa devrenin eşdeğer sığası kaç $\mu\text{F}$ olur?

- A) 2
- B) 4
- C) 6
- D) 9
- E) 13

---

1. Seri bağlı $C_1$ ve $C_2$: $C_{12}=\dfrac{6\cdot3}{6+3}=2\ \mu\text{F}$.
2. Paralelde sığalar toplanır: $C_{eş}=2+4=6\ \mu\text{F}$. Doğru cevap C.

Diğer şıklar: **2** yalnızca seri kısım alınmış / **4** yalnızca $C_3$ alınmış / **9** $C_1$ ile $C_2$ paralel gibi toplanmış, $6+3$ / **13** üçü de paralel gibi toplanmış.
:::

:::soru{cevap="A"}
Paralel levhalı bir kondansatörün sığası $C$'dir. Levhaların alanı yarıya indirilip levhalar arası uzaklık iki katına çıkarılırsa sığa kaç $C$ olur?

- A) $\dfrac C4$
- B) $\dfrac C2$
- C) $C$
- D) $2C$
- E) $4C$

---

1. Paralel levhalı sığa $C=\varepsilon\dfrac{A}{d}$ ile bulunur.
2. $C'=\varepsilon\dfrac{A/2}{2d}=\dfrac14\cdot\varepsilon\dfrac Ad=\dfrac C4$. Doğru cevap A.

Diğer şıklar: **$\dfrac C2$** yalnızca alan değişimi dikkate alınmış / **$C$** iki değişimin birbirini götürdüğü sanılmış / **$2C$** uzaklık sığa ile doğru orantılı sanılmış / **$4C$** oran ters alınmış.
:::

## Kendini dene

:::dene
1. Potansiyelin birimi nedir? => Volt (V).
2. $E=100$ V/m ve $d=0{,}2$ m ise $\Delta V$ kaçtır? => 20 V.
3. Eş potansiyel yüzeyde yük taşırken iş kaçtır? => Sıfır.
4. Paralel bağlı kondansatörlerde eşdeğer sığa nasıl bulunur? => Sığalar toplanır.
5. Levhalar arası uzaklık artarsa sığa nasıl değişir? => Azalır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fiz' and name = 'Elektriksel Potansiyel ve Sığa'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Pusulanın iğnesi neden hep kuzeyi gösterir? Bir elektrik motoru akımdan dönme hareketi, bir jeneratör ise dönme hareketinden akım üretir. Kredi kartındaki şerit, hoparlör, MR cihazı ve deprem sensörü de manyetizmaya dayanır. Elektrik ve manyetizma aynı olgunun iki yüzüdür: **Hareketli yükler manyetik alan oluşturur, değişen manyetik alan ise elektrik akımı doğurur.** Bu konuda **manyetik alanı**, akım taşıyan tel ve yüklü parçacık üzerindeki **manyetik kuvveti**, **manyetik akıyı** ve **elektromanyetik indüklemeyi** (Faraday ve Lenz) öğreneceksin. Teknolojinin elektrik üretimi ve dağıtımı bu konuya dayanır.

:::hedefler
1. Mıknatıs ve akım taşıyan telin manyetik alanını açıklamak.
2. Sağ el kuralını kullanarak alan ve kuvvet yönünü belirlemek.
3. Yüklü parçacığa ve akım taşıyan tele etkiyen manyetik kuvveti hesaplamak.
4. Manyetik alanda dairesel harekette yarıçapı bulmak.
5. Manyetik akıyı ve akı değişimini hesaplamak.
6. Faraday ve Lenz yasalarıyla indüksiyon emk'sını ve akımın yönünü bulmak.
:::

:::ipucu
Manyetik kuvvet her zaman **hem hıza hem alana diktir**, bu yüzden **iş yapmaz** ve parçacığın hızının büyüklüğünü değiştirmez. Yalnızca yönünü değiştirir. Yön için **sağ el kuralı** kullan, negatif yükte sonucu ters çevir.
:::

::video{id="CFwMHMYHqs4" etiket="Konu anlatımı videosu" baslik="Hareket Eden Telde Oluşan İndüksiyon Emk'sı" kanal="Özcan Aykın FİZİK"}

## 1. Manyetik alan

Manyetik alan, mıknatıs ya da **hareketli yük** (akım) çevresinde oluşur. Birimi tesla ($\text{T}$). Vektörel büyüklüktür ve $\vec B$ ile gösterilir.

- Manyetik alan çizgileri mıknatısın **dışında N kutbundan S kutbuna**, içinde S'den N'ye doğrudur. Kapalı eğrilerdir.
- Alan çizgileri birbirini **kesmez**. Sık çizgi güçlü alan demektir.
- Dünya da büyük bir mıknatıs gibidir. Coğrafi kuzey yakınındaki manyetik kutup, aslında bir S kutbudur.

**Akım taşıyan telin alanı:** Sağ başparmak akım yönünü gösterirken kıvrılan dört parmak alan çizgilerinin yönünü verir (sağ el kuralı).

| Düzenek | Alan şiddeti |
| --- | --- |
| Uzun düz tel | $B=\dfrac{\mu_0\,i}{2\pi r}$ |
| Dairesel halka (merkez) | $B=\dfrac{\mu_0\,i}{2r}$ |
| Solenoid (içi) | $B=\mu_0\,n\,i$ ($n$ birim uzunluktaki sarım) |

$\mu_0=4\pi\cdot10^{-7}\ \text{T}\cdot\text{m/A}$. Telden uzaklaştıkça alan azalır, akım arttıkça artar.

## 2. Manyetik kuvvet

**Hareketli yüke etkiyen kuvvet:**

$$F=q\,v\,B\sin\theta$$

$\theta$, hız ile alan arasındaki açıdır. Hız alana **paralelse** ($\theta=0$) kuvvet sıfırdır. Hız alana **dikse** kuvvet en büyüktür: $F=qvB$. Yön: sağ el kuralı, $q$ negatifse ters.

**Akım taşıyan tele etkiyen kuvvet:**

$$F=B\,i\,\ell\sin\theta$$

**Örnek:** $B=0{,}2\ \text{T}$, $i=5\ \text{A}$, $\ell=0{,}4\ \text{m}$ ve tel alanla $30^\circ$ yapıyorsa $F=0{,}2\cdot5\cdot0{,}4\cdot0{,}5=0{,}2\ \text{N}$.

**Paralel akımlı teller:** Aynı yönlü akımlar birbirini **çeker**, zıt yönlü akımlar birbirini **iter**.

**Dairesel hareket:** Parçacık alana **dik** girerse manyetik kuvvet merkezcil kuvvet olur ve daire çizer:

$$qvB=\dfrac{mv^2}{r}\quad\Rightarrow\quad r=\dfrac{mv}{qB}$$

Periyot $T=\dfrac{2\pi m}{qB}$ ve **hıza bağlı değildir**. Hızlı parçacık büyük daire çizer ama aynı sürede tamamlar.

**Örnek:** Hızı iki katına çıkarılan, manyetik alanı yarıya düşürülen aynı parçacığın yarıçapı $r'=\dfrac{m\cdot2v}{q\cdot B/2}=4r$ olur.

## 3. Manyetik akı

Bir yüzeyden geçen manyetik alan çizgilerinin ölçüsüne **manyetik akı** denir:

$$\Phi=B\,A\cos\theta$$

$\theta$ alan ile yüzeyin **normali** arasındaki açıdır. Birimi weber ($1\ \text{Wb}=1\ \text{T}\cdot\text{m}^2$). Alan yüzeye dik ise akı en büyük, yüzeye paralel ise sıfırdır.

Akı şu yollarla değişebilir: $B$ değişir, $A$ değişir ya da $\theta$ değişir (halka döner).

## 4. Elektromanyetik indükleme

**Faraday yasası:** Bir devreden geçen akı değişirse devrede bir **indüksiyon emk'sı** oluşur:

$$\varepsilon=-N\dfrac{\Delta\Phi}{\Delta t}$$

$N$ sarım sayısıdır. Emk'nın büyüklüğü akının **değişim hızıyla** doğru orantılıdır. Akı sabitse emk yoktur.

**Lenz yasası (eksi işareti):** İndüksiyon akımı, kendisini oluşturan **akı değişimine karşı koyacak** yönde alan oluşturur. Akı artarsa indüksiyon akımı artışa karşı, akı azalırsa azalmaya karşı yönde alan yaratır. Bu, enerjinin korunumunun bir sonucudur.

**Örnek:** $N=50$ sarımlı bir bobinde akı $0{,}5\ \text{s}$'de $0{,}04\ \text{Wb}$ değişirse $\varepsilon=50\cdot\dfrac{0{,}04}{0{,}5}=4\ \text{V}$.

**Hareketli çubuk:** Uzunluğu $\ell$ olan iletken çubuk, düzgün $B$ alanına dik doğrultuda $v$ hızıyla hareket ederse çubuğun uçları arasında

$$\varepsilon=B\,\ell\,v$$

emk oluşur. Devre kapalıysa $i=\dfrac{\varepsilon}{R}$.

**Örnek:** $B=0{,}5\ \text{T}$, $\ell=0{,}5\ \text{m}$ ve $v=4\ \text{m/s}$ ise $\varepsilon=0{,}5\cdot0{,}5\cdot4=1\ \text{V}$. $R=2\ \Omega$ ise $i=0{,}5\ \text{A}$.

**Özindüksiyon:** Bobinden geçen akım değişince bobin kendi akısını değiştirir ve kendisine zıt emk oluşur: $\varepsilon=-L\dfrac{\Delta i}{\Delta t}$. $L$ özindüktans (henri).

## 5. Uygulamalar

- **Elektrik motoru:** Alan içindeki akımlı çerçeve, manyetik kuvvetin torkuyla döner.
- **Jeneratör (dinamo):** Alan içinde dönen bobinde akı sürekli değişir ve emk üretilir.
- **Transformatör:** Ortak demir çekirdekteki iki bobin arasında indüksiyon ile gerilim değiştirilir (sonraki konu).
- **Manyetik kaldırmalı tren, MR, hoparlör** manyetik kuvvete dayanır.

## 6. Sık yapılan hatalar

- Hareketsiz yükün manyetik kuvvet hissettiğini düşünmek. Yük **hareketli** olmalıdır.
- Hız alana paralel iken kuvvet olduğunu sanmak.
- Akı sabitken emk oluşacağını düşünmek. Önemli olan akının **değişmesi**dir.
- Lenz yasasında yönü ters bulmak. İndüksiyon akımı, **değişime** karşı koyar.

:::baglanti
Manyetik kuvvet, **vektörler** ve **elektriksel kuvvet** konularının devamıdır. Dairesel harekette $qvB=\dfrac{mv^2}{r}$ eşitliği **çembersel hareket** bilgisini kullanır. **Alternatif akım ve transformatör** konusu, indükleme olayının doğrudan uygulamasıdır. **Modern fizikte** (kütle spektrometresi, parçacık hızlandırıcıları) yüklü parçacıklar manyetik alanla yönlendirilir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yüke kuvvet | $F=qvB\sin\theta$ |
| Tele kuvvet | $F=Bi\ell\sin\theta$ |
| Dairesel hareket | $r=\dfrac{mv}{qB}$ |
| Akı | $\Phi=BA\cos\theta$ |
| Faraday | $\varepsilon=-N\dfrac{\Delta\Phi}{\Delta t}$ |
| Çubuk | $\varepsilon=B\ell v$ |
| Lenz | Değişime karşı koyar |

## Mini test

:::soru{cevap="A"}
Düzgün $0{,}2\ \text{T}$'lık manyetik alanda, alanla $30^\circ$ açı yapan $0{,}4\ \text{m}$ uzunluğundaki telden $5\ \text{A}$ akım geçmektedir. Tele etkiyen manyetik kuvvet kaç N'dur? ($\sin30^\circ=0{,}5$, $\cos30^\circ\approx0{,}87$)

- A) $0{,}2$
- B) $0{,}35$
- C) $0{,}4$
- D) $2$
- E) $4$

---

1. Akım taşıyan tele etkiyen kuvvet $F=Bi\ell\sin\theta$.
2. $F=0{,}2\cdot5\cdot0{,}4\cdot0{,}5=0{,}2\ \text{N}$. Doğru cevap A.

Diğer şıklar: **0,35** sinüs yerine kosinüs kullanılmış / **0,4** açı dikkate alınmamış, tel alana dik sanılmış / **2** uzunluk 4 m alınmış / **4** uzunluk ve açı dikkate alınmamış.
:::

:::soru{cevap="C"}
$50$ sarımlı bir bobinden geçen manyetik akı $0{,}5\ \text{s}$ içinde düzgün olarak $0{,}04\ \text{Wb}$ değişiyor. Bobinde oluşan indüksiyon emk'sının büyüklüğü kaç V'tur?

- A) $0{,}08$
- B) $2$
- C) $4$
- D) $100$
- E) $1000$

---

1. Faraday yasası: $\varepsilon=N\dfrac{\Delta\Phi}{\Delta t}$.
2. $\varepsilon=50\cdot\dfrac{0{,}04}{0{,}5}=50\cdot0{,}08=4\ \text{V}$. Doğru cevap C.

Diğer şıklar: **0,08** sarım sayısı unutulmuş / **2** süreye bölünmemiş, $50\cdot0{,}04$ / **100** akı yerine sarım sayısı süreye bölünmüş, $\dfrac{50}{0{,}5}$ / **1000** süre 0,002 s alınmış, birim karıştırılmış.
:::

:::soru{cevap="B"}
Düzgün $0{,}5\ \text{T}$'lık manyetik alana dik doğrultuda, $0{,}5\ \text{m}$ uzunluğundaki iletken çubuk $4\ \text{m/s}$ hızla hareket ettiriliyor. Çubuk $2\ \Omega$'luk bir dirençle kapalı devre oluşturuyorsa devreden geçen akım kaç A'dir?

- A) $0{,}25$
- B) $0{,}5$
- C) $1$
- D) $2$
- E) $4$

---

1. Çubuğun uçlarında oluşan emk $\varepsilon=B\ell v=0{,}5\cdot0{,}5\cdot4=1\ \text{V}$.
2. Devre akımı $i=\dfrac{\varepsilon}{R}=\dfrac{1}{2}=0{,}5\ \text{A}$. Doğru cevap B.

Diğer şıklar: **0,25** hız 2 m/s alınmış / **1** emk akım sanılmış, dirence bölünmemiş / **2** akım yerine direnç yazılmış / **4** hız akım sanılmış.
:::

:::soru{cevap="D"}
Manyetik alana dik giren yüklü bir parçacık $r$ yarıçaplı çembersel yörünge çiziyor. Parçacığın hızı iki katına çıkarılır ve manyetik alan yarıya düşürülürse (diğer her şey aynı) yörünge yarıçapı kaç $r$ olur?

- A) $\dfrac r4$
- B) $\dfrac r2$
- C) $2r$
- D) $4r$
- E) $8r$

---

1. Yarıçap $r=\dfrac{mv}{qB}$ ile bulunur, yani $r\propto\dfrac vB$.
2. $r'=\dfrac{2v}{B/2}\to4$ kat artar: $r'=4r$. Doğru cevap D.

Diğer şıklar: **$\dfrac r4$** oran ters kurulmuş / **$\dfrac r2$** yalnızca alan değişimi ters alınmış / **$2r$** yalnızca hız değişimi dikkate alınmış / **$8r$** hız için 2, alan için 2 ve fazladan bir 2 daha uygulanmış.
:::

## Kendini dene

:::dene
1. Hareketsiz bir yük manyetik kuvvet hisseder mi? => Hayır.
2. Hız alana paralel ise manyetik kuvvet kaçtır? => Sıfır.
3. Akı sabit kalırsa indüksiyon emk'sı olur mu? => Hayır.
4. Lenz yasası neyi belirler? => İndüksiyon akımının yönünü.
5. Aynı yönlü akım taşıyan paralel teller birbirini nasıl etkiler? => Çeker.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-fiz' and name = 'Manyetizma ve Elektromanyetik İndükleme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Prizdeki elektrik pilin verdiği elektrikten farklıdır. Pil akımı hep aynı yönde itir, prizdeki akımın yönü ise saniyede 100 kez değişir. Bu akıma **alternatif akım (AC)** denir. Evlerimize AC gelir, çünkü gerilimi **transformatörle** kolayca yükseltip alçaltabiliriz ve elektriği yüzlerce kilometre taşırken kayıpları azaltabiliriz. Şarj aletleri, ses sistemleri ve radyolar da AC devre elemanlarıyla çalışır. Bu konuda **alternatif gerilim ve akımı**, **etkin (efektif) değerleri**, direnç, bobin ve kondansatörün AC davranışını, **seri RLC devresini**, **rezonansı** ve **transformatörü** öğreneceksin. Önceki konudaki elektromanyetik indüklemenin doğrudan uygulamasıdır.

:::hedefler
1. Alternatif akım ve gerilimin zamanla değişimini yorumlamak.
2. Etkin (efektif) ve maksimum değer ilişkisini kullanmak.
3. Bobin ve kondansatörün AC'de gösterdiği dirence (reaktansa) karar vermek.
4. Seri RLC devresinde empedansı ve akımı hesaplamak.
5. Rezonans şartını bilmek.
6. İdeal transformatörde gerilim, akım ve sarım sayısı ilişkisini kullanmak.
:::

:::ipucu
AC problemlerinde **hangi değerin verildiğine** dikkat et. Voltmetre ve ampermetre **etkin değeri** gösterir. Evdeki $220\ \text{V}$ etkin değerdir, maksimum değeri $220\sqrt2\approx311\ \text{V}$'tur. Maksimum değer sorulursa $\sqrt2$ ile çarp.
:::

::video{id="T4HQuD0ejRs" etiket="Konu anlatımı videosu" baslik="Alternatif Akım Nasıl Oluşur?" kanal="Özcan Aykın FİZİK"}

## 1. Alternatif akım ve gerilim

Zamanla yönü ve büyüklüğü periyodik değişen akıma **alternatif akım** denir. Sinüzoidal AC için

$$v(t)=V_{max}\sin(\omega t),\qquad i(t)=I_{max}\sin(\omega t)$$

Burada $\omega=2\pi f$ açısal frekans, $f$ frekanstır (Hz), $T=\dfrac1f$ periyottur. Türkiye'de şebeke frekansı $50\ \text{Hz}$'dir ($T=0{,}02\ \text{s}$). Akım saniyede 100 kez yön değiştirir.

**Etkin (efektif) değer:** Aynı dirençte aynı ısıyı açığa çıkaran doğru akımın değeridir:

$$V_{ef}=\dfrac{V_{max}}{\sqrt2},\qquad I_{ef}=\dfrac{I_{max}}{\sqrt2}$$

Voltmetre ve ampermetre bu değerleri gösterir. Bir tam periyotta ortalama değer sıfırdır, ama etkin değer sıfır değildir.

**Örnek:** Etkin değeri $220\ \text{V}$ olan şebekenin maksimum değeri $220\sqrt2\approx311\ \text{V}$.

## 2. Devre elemanları

**Direnç:** Akım ile gerilim **aynı fazdadır**. $V=IR$.

**Bobin:** AC'ye karşı gösterdiği zorluğa **indüktif reaktans** denir:

$$X_L=\omega L=2\pi fL$$

Frekans arttıkça artar. Bobinde gerilim, akımdan $90^\circ$ **ileridedir**. DC'de ($f=0$) $X_L=0$, yani bobin tel gibi davranır.

**Kondansatör:** AC'ye karşı gösterdiği zorluğa **kapasitif reaktans** denir:

$$X_C=\dfrac{1}{\omega C}=\dfrac{1}{2\pi fC}$$

Frekans arttıkça azalır. Kondansatörde gerilim, akımdan $90^\circ$ **geridedir**. DC'de $X_C\to\infty$, yani kondansatör akımı geçirmez.

| Eleman | Direnç türü | Frekansla | Faz |
| --- | --- | --- | --- |
| Direnç | $R$ | Değişmez | Akım ile aynı fazda |
| Bobin | $X_L=2\pi fL$ | Artar | Gerilim $90^\circ$ ileride |
| Kondansatör | $X_C=\dfrac{1}{2\pi fC}$ | Azalır | Gerilim $90^\circ$ geride |

## 3. Seri RLC devresi

Direnç, bobin ve kondansatör seri bağlıdır. Toplam zorluk **empedans**:

$$Z=\sqrt{R^2+(X_L-X_C)^2}$$

Etkin akım $I=\dfrac{V}{Z}$.

**Örnek:** $R=30\ \Omega$, $X_L=60\ \Omega$ ve $X_C=20\ \Omega$ ise $Z=\sqrt{30^2+40^2}=50\ \Omega$. Gerilim $100\ \text{V}$ ise $I=2\ \text{A}$.

**Davranış:** $X_L>X_C$ ise devre indüktif, $X_L<X_C$ ise kapasitif davranır. Faz farkı $\tan\varphi=\dfrac{X_L-X_C}{R}$.

**Güç:** Ortalama güç yalnızca dirençte harcanır: $P=I_{ef}^2R=V_{ef}I_{ef}\cos\varphi$. Bobin ve kondansatör enerji harcamaz, depolayıp geri verir.

## 4. Rezonans

$X_L=X_C$ olduğunda devre **rezonansa girer**. Bu frekansa **rezonans frekansı** denir:

$$f_0=\dfrac{1}{2\pi\sqrt{LC}}\qquad\text{ya da}\qquad\omega_0=\dfrac{1}{\sqrt{LC}}$$

Rezonansta:

- $Z=R$ ve en küçük değerindedir.
- Akım **en büyük** değerindedir.
- Devre tamamen dirençli gibi davranır, faz farkı sıfırdır.

**Örnek:** $L=1\ \text{H}$ ve $C=4\ \mu\text{F}$ için $\omega_0=\dfrac{1}{\sqrt{4\cdot10^{-6}}}=500\ \text{rad/s}$.

Radyonun istasyon seçmesi rezonans olayıdır: Devrenin sığası ayarlanır ve istenen frekansta akım büyük olur.

## 5. Transformatör

Ortak bir demir çekirdek üzerindeki iki bobin (primer ve sekonder) arasında, **indüksiyon** ile AC gerilimi yükseltilir ya da alçaltılır. Transformatör **yalnızca AC'de** çalışır. DC'de akı değişmediği için indüksiyon olmaz.

İdeal transformatörde ($N_p$ ve $N_s$ sarım sayıları):

$$\dfrac{V_s}{V_p}=\dfrac{N_s}{N_p},\qquad\dfrac{I_p}{I_s}=\dfrac{N_s}{N_p},\qquad P_p=P_s\ (V_pI_p=V_sI_s)$$

- $N_s>N_p$ ise **gerilim yükseltici**, akım azalır.
- $N_s<N_p$ ise **gerilim alçaltıcı**, akım artar.
- Gerilimi yükselten transformatör akımı **azaltır**, güç aynıdır.

**Örnek:** $N_p=500$, $N_s=100$ ve $V_p=220\ \text{V}$ ise $V_s=220\cdot\dfrac{100}{500}=44\ \text{V}$.

**Verim:** Gerçek transformatörde $\eta=\dfrac{P_s}{P_p}<1$. Kayıplar telin direncinden, demir çekirdekteki girdap akımlarından ve histerezisten gelir.

**Enerji nakli:** Elektrik santralinde gerilim transformatörle çok yükseltilir. Aynı güç düşük akımla taşınır ve hat kayıpları ($I^2R$) azalır. Şehre yakın yerde gerilim alçaltılır.

## 6. Sık yapılan hatalar

- Etkin ve maksimum değeri karıştırmak.
- Bobin ve kondansatörün frekansa bağlı davranışlarını ters bilmek.
- Empedansı $R+X_L+X_C$ diye toplamak. Reaktanslar **çıkarılır**, sonra Pisagor kullanılır.
- Transformatörün DC'de de çalışacağını sanmak.
- Gerilimin yükselince akımın da arttığını sanmak. Güç sabit olduğunda akım azalır.

:::baglanti
Bu konu, **manyetizma ve elektromanyetik indüklemenin** en önemli uygulamasıdır. Kondansatör bilgisi **elektriksel potansiyel ve sığa** konusundan gelir. Rezonans fikri **dalga mekaniğinde** de karşımıza çıkar. **Basit harmonik hareket** ile LC devresi arasında matematiksel bir benzerlik vardır: Enerji, bobin ile kondansatör arasında salınır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Etkin değer | $V_{ef}=\dfrac{V_{max}}{\sqrt2}$ |
| $X_L$ | $2\pi fL$ |
| $X_C$ | $\dfrac{1}{2\pi fC}$ |
| Empedans | $\sqrt{R^2+(X_L-X_C)^2}$ |
| Rezonans | $X_L=X_C$, $Z=R$ |
| Transformatör | $\dfrac{V_s}{V_p}=\dfrac{N_s}{N_p}$ |
| Güç | İdeal trafoda $P_p=P_s$ |

## Mini test

:::soru{cevap="D"}
Alternatif akımın etkin (efektif) değeri için aşağıdakilerden hangisi doğrudur?

- A) Maksimum değere eşittir.
- B) Maksimum değerin yarısıdır.
- C) Bir periyottaki ortalama değerine eşittir.
- D) Maksimum değerin $\dfrac{1}{\sqrt2}$ katıdır.
- E) Maksimum değerin $\sqrt2$ katıdır.

---

1. Etkin değer, dirençte aynı ısıyı sağlayan doğru akımın değeridir ve $V_{ef}=\dfrac{V_{max}}{\sqrt2}$ olur.
2. Bu, maksimum değerin yaklaşık $0{,}71$ katıdır. Doğru cevap D.

Diğer şıklar: **Maksimum değere eşittir** doğru akım ile karıştırılmış / **Yarısıdır** $\sqrt2$ yerine $2$ kullanılmış / **Ortalama değer** sinüs bir periyotta ortalaması sıfır olduğu için yanlış / **$\sqrt2$ katı** maksimum ile etkin değer ters alınmış.
:::

:::soru{cevap="B"}
İdeal bir transformatörün primer sarım sayısı 500, sekonder sarım sayısı 100'dür. Primere $220\ \text{V}$'luk alternatif gerilim uygulanırsa sekonder gerilimi kaç V olur?

- A) 22
- B) 44
- C) 110
- D) 220
- E) 1100

---

1. Gerilimler sarım sayılarıyla doğru orantılıdır: $\dfrac{V_s}{V_p}=\dfrac{N_s}{N_p}$.
2. $V_s=220\cdot\dfrac{100}{500}=44\ \text{V}$. Doğru cevap B.

Diğer şıklar: **22** sarım sayıları farkı kullanılmış, $\dfrac{220}{10}$ / **110** gerilim yarıya indirilmiş / **220** transformatör gerilimi değiştirmez sanılmış / **1100** oran ters alınmış.
:::

:::soru{cevap="C"}
Seri bağlı bir devrede $R=30\ \Omega$, indüktif reaktans $X_L=60\ \Omega$ ve kapasitif reaktans $X_C=20\ \Omega$'dur. Devrenin empedansı kaç $\Omega$'dur?

- A) 30
- B) 40
- C) 50
- D) 70
- E) 110

---

1. Empedans $Z=\sqrt{R^2+(X_L-X_C)^2}$.
2. $Z=\sqrt{30^2+(60-20)^2}=\sqrt{900+1600}=50\ \Omega$. Doğru cevap C.

Diğer şıklar: **30** yalnızca direnç alınmış / **40** yalnızca reaktans farkı alınmış / **70** $R+X_L-X_C$ gibi cebirsel toplanmış / **110** üç değer de toplanmış.
:::

:::soru{cevap="E"}
Seri RLC devresi rezonans frekansında çalıştırılıyor. Bu durumla ilgili aşağıdakilerden hangisi doğrudur?

- A) $X_L$, $X_C$'den büyüktür ve devre indüktif davranır.
- B) Empedans en büyük değerindedir.
- C) Devreden geçen akım en küçük değerindedir.
- D) $X_C$, $X_L$'den büyüktür ve devre kapasitif davranır.
- E) $X_L=X_C$, empedans dirence eşit ve akım en büyüktür.

---

1. Rezonans şartı $X_L=X_C$'dir. Bu durumda reaktanslar birbirini götürür.
2. $Z=\sqrt{R^2+0}=R$ olur ve en küçük değerindedir. Gerilim sabitse akım $I=\dfrac VR$ ile en büyüktür. Doğru cevap E.

Diğer şıklar: **A** ve **D** reaktansların eşit olmadığı durumlar / **B** empedans rezonansta en küçüktür, en büyük değildir / **C** akım rezonansta en büyüktür, en küçük değildir.
:::

## Kendini dene

:::dene
1. Şebekenin etkin değeri 220 V ise maksimum değeri yaklaşık kaçtır? => 311 V.
2. Frekans artarsa bobinin reaktansı nasıl değişir? => Artar.
3. DC'de kondansatör akımı geçirir mi? => Hayır.
4. Gerilim yükselten transformatörde akım nasıl değişir? => Azalır.
5. Rezonansta empedans neye eşittir? => Dirence, $Z=R$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fiz' and name = 'Alternatif Akım ve Transformatörler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir dönme dolapta, virajı dönen bir otomobilde ya da bir çamaşır makinesinin tamburunda hep aynı şeyi yaşarsın: Cisim bir **çember üzerinde** hareket eder ve onu çemberde tutan bir **merkeze doğru kuvvet** vardır. Hızın büyüklüğü sabit kalsa bile hızın **yönü** sürekli değiştiği için bu hareketin ivmesi vardır. Bu konuda **düzgün çembersel hareketi**, periyot, frekans, açısal ve çizgisel hızı, **merkezcil ivmeyi ve kuvveti**, düşey ve yatay çemberlerdeki gerilmeyi ve **kütle çekim** ile **Kepler yasalarını** öğreneceksin. Newton'un yasaları ve vektör bilgin burada yeni bir durumda sınanıyor.

:::hedefler
1. Periyot, frekans, açısal hız ve çizgisel hız arasındaki ilişkiyi kullanmak.
2. Merkezcil ivmeyi ve merkezcil kuvveti hesaplamak.
3. Düşey ve yatay çemberde gerilme ve normal kuvveti bulmak.
4. Virajda ve eğimli yolda merkezcil kuvvetin kaynağını belirlemek.
5. Kütle çekim yasasını ve uydu hareketini yorumlamak.
6. Kepler yasalarını uygulamak.
:::

:::ipucu
Merkezcil kuvvet **yeni bir kuvvet değildir**. Gerilme, sürtünme, normal kuvvet, yerçekimi gibi var olan kuvvetlerin **merkeze doğru bileşkesidir**. Her çembersel hareket sorusunda önce kuvvetleri çiz, sonra merkeze doğru olan bileşkeyi $\dfrac{mv^2}{r}$'ye eşitle.
:::

::video{id="LtPiqUuUy90" etiket="Konu anlatımı videosu" baslik="Düzgün Çembersel Hareket" kanal="Özcan Aykın FİZİK"}

## 1. Düzgün çembersel hareket

Sabit büyüklükte hızla çember üzerinde yapılan harekete **düzgün çembersel hareket** denir.

- **Periyot ($T$):** Bir tam turun süresi (s).
- **Frekans ($f$):** Birim zamandaki tur sayısı (Hz), $f=\dfrac1T$.
- **Çizgisel hız:** $v=\dfrac{2\pi r}{T}=2\pi rf$. Yönü çembere **teğettir** ve sürekli değişir.
- **Açısal hız:** $\omega=\dfrac{2\pi}{T}=2\pi f$ (rad/s). Aynı eksen etrafında dönen tüm noktalarda aynıdır.
- **İlişki:** $v=\omega r$.

**Örnek:** $r=2\ \text{m}$ ve $\omega=3\ \text{rad/s}$ ise $v=\omega r=6\ \text{m/s}$.

**Aynı eksendeki noktalar:** $\omega$ eşit, $v$ yarıçapla doğru orantılı. **Aynı kayışla bağlı çarklar:** Çizgisel hızlar eşit, açısal hızlar yarıçapla ters orantılıdır.

## 2. Merkezcil ivme ve kuvvet

Hızın yönü değiştiği için ivme vardır ve **merkeze doğrudur**:

$$a_m=\dfrac{v^2}{r}=\omega^2r$$

Newton'un ikinci yasasına göre merkeze doğru net kuvvet:

$$F_m=ma_m=\dfrac{mv^2}{r}=m\omega^2r$$

**Örnek:** $r=2\ \text{m}$ ve $\omega=3\ \text{rad/s}$ için $a_m=\omega^2r=9\cdot2=18\ \text{m/s}^2$. $m=2\ \text{kg}$ ise $F_m=36\ \text{N}$.

**Hız sabit, yarıçap değişirse:** $F_m\propto\dfrac1r$. Yarıçap iki katına çıkarsa merkezcil kuvvet yarıya iner.

**Kuvvet kesilirse:** Cisim çembere **teğet** doğrultuda, sabit hızla düz gider. Merkezkaç diye gerçek bir kuvvet yoktur. Dönen sistemde hissedilen, eylemsizliğin sonucudur.

## 3. Yatay ve düşey çember

**Yatay çember** (örneğin bir ip ucunda döndürülen cisim, sürtünmesiz yatay düzlemde): Merkezcil kuvvet ipteki gerilmedir: $T=\dfrac{mv^2}{r}$.

**Düşey çember** (bir ip ucunda ya da bir yarıçaplı çukurda düşey düzlemde): Hız sabit **değildir**, yükseklik arttıkça azalır. En alt ve en üst noktada merkezcil denklem yazılır.

| Nokta | Merkeze doğru net kuvvet |
| --- | --- |
| En alt | $T-mg=\dfrac{mv^2}{r}$ |
| En üst | $T+mg=\dfrac{mv^2}{r}$ |

**Örnek:** $m=2\ \text{kg}$, $v=10\ \text{m/s}$ ve $r=5\ \text{m}$ için $\dfrac{mv^2}{r}=40\ \text{N}$. En üst noktada $T=40-20=20\ \text{N}$, en alt noktada $T=40+20=60\ \text{N}$ olur. En alt noktada gerilme en büyüktür.

**En üst noktada ip gevşemeden dönme:** $T\ge0$ olmalı. Kritik durumda $T=0$ ve $mg=\dfrac{mv^2}{r}$, yani $v_{min}=\sqrt{gr}$.

**Virajlar:** Yatay yolda araç virajı dönerken merkezcil kuvveti **sürtünme** sağlar: $f_s\ge\dfrac{mv^2}{r}$. Hız çok yüksekse araç savrulur. Eğimli yollarda ($\theta$ açısı) normal kuvvetin yatay bileşeni de merkezcil kuvvete katkı yapar: $\tan\theta=\dfrac{v^2}{rg}$ (sürtünmesiz).

## 4. Kütle çekim ve Kepler yasaları

**Evrensel kütle çekim yasası:** Kütleleri $m_1$ ve $m_2$ olan cisimler arasındaki çekim kuvveti

$$F=G\dfrac{m_1m_2}{d^2},\qquad G=6{,}67\cdot10^{-11}\ \text{N}\cdot\text{m}^2/\text{kg}^2$$

Yüzeyde $g=\dfrac{GM}{R^2}$. Yükseldikçe $g$ azalır: $g\propto\dfrac1{d^2}$.

**Uydu hareketi:** Uydu, çekim kuvvetinin merkezcil kuvvet olduğu düzgün çembersel hareket yapar: $\dfrac{GMm}{r^2}=\dfrac{mv^2}{r}$ ve $v=\sqrt{\dfrac{GM}{r}}$. Yörünge yarıçapı büyüdükçe uydunun hızı azalır, periyodu artar. Uydu **serbest düşmektedir**, bu yüzden içindeki cisimler ağırlıksız görünür.

**Kepler yasaları:**

1. **Yörüngeler yasası:** Gezegenler, odaklarından birinde Güneş bulunan elips yörüngelerde döner.
2. **Alanlar yasası:** Güneş-gezegen doğrusu eşit sürelerde eşit alanlar tarar. Güneş'e yakınken gezegen daha hızlıdır.
3. **Periyotlar yasası:** $\dfrac{T^2}{r^3}=$ sabit.

**Örnek:** Bir gezegenin Güneş'e olan ortalama uzaklığı $4$ katına çıkarsa $T^2\propto r^3$ olduğundan $T\propto r^{3/2}=4^{3/2}=8$. Periyot 8 katına çıkar.

## 5. Sık yapılan hatalar

- Merkezkaç kuvvetini gerçek bir kuvvet sanmak.
- Düşey çemberde hızın sabit olduğunu varsaymak.
- En üst noktada gerilmenin $T-mg$ ile hesaplandığını sanmak. En üstte ağırlık da merkeze doğrudur, $T+mg$ yazılır.
- Kepler'in üçüncü yasasında $T\propto r$ yazmak. Doğrusu $T^2\propto r^3$.

:::baglanti
Çembersel hareket, **Newton'un hareket yasalarının** ve **vektörlerin** (hızın yön değişimi) bir uygulamasıdır. **Elektriksel kuvvet** ve **manyetizma** konusunda yüklü parçacıkların çember çizmesi aynı merkezcil denklemle çözülür. **Basit harmonik hareket**, çembersel hareketin bir doğru üzerine izdüşümüdür. **Atom fiziğinde** Bohr modelinde elektron çekirdek etrafında dairesel yörüngededir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çizgisel hız | $v=\omega r=\dfrac{2\pi r}{T}$ |
| Merkezcil ivme | $\dfrac{v^2}{r}=\omega^2r$ |
| Merkezcil kuvvet | $\dfrac{mv^2}{r}$ |
| Düşey çember tepe | $T+mg=\dfrac{mv^2}{r}$ |
| Düşey çember alt | $T-mg=\dfrac{mv^2}{r}$ |
| Kütle çekim | $G\dfrac{m_1m_2}{d^2}$ |
| Kepler 3 | $T^2\propto r^3$ |

## Mini test

:::soru{cevap="C"}
Yarıçapı $2\ \text{m}$ olan çember üzerinde düzgün çembersel hareket yapan bir cismin açısal hızı $3\ \text{rad/s}$'dir. Cismin merkezcil ivmesi kaç $\text{m/s}^2$'dir?

- A) 6
- B) 9
- C) 18
- D) 36
- E) 54

---

1. Merkezcil ivme $a_m=\omega^2r$.
2. $a_m=3^2\cdot2=18\ \text{m/s}^2$. Doğru cevap C.

Diğer şıklar: **6** çizgisel hız $\omega r$ yazılmış / **9** açısal hızın karesi, yarıçapla çarpılmamış / **36** $v^2$ değeri yazılmış, yarıçapa bölünmemiş / **54** açısal hızın küpü yarıçapla çarpılmış, $27\cdot2$.
:::

:::soru{cevap="B"}
Düzgün çembersel hareket yapan bir cismin çizgisel hızı sabit tutularak çemberin yarıçapı iki katına çıkarılırsa cisme etkiyen merkezcil kuvvet nasıl değişir?

- A) $\dfrac14$ katına iner.
- B) $\dfrac12$ katına iner.
- C) Değişmez.
- D) 2 katına çıkar.
- E) 4 katına çıkar.

---

1. Merkezcil kuvvet $F=\dfrac{mv^2}{r}$ ve hız sabit olduğundan $F\propto\dfrac1r$.
2. Yarıçap iki katına çıkınca kuvvet yarıya iner. Doğru cevap B.

Diğer şıklar: **$\dfrac14$** yarıçap karesiyle ters orantılı sanılmış / **Değişmez** hızın sabit olması kuvvetin sabit olduğu anlamına gelir sanılmış / **2 katı** doğru orantılı sanılmış / **4 katı** $r^2$ ile doğru orantılı sanılmış.
:::

:::soru{cevap="C"}
Kütlesi $2\ \text{kg}$ olan bir cisim, $5\ \text{m}$ uzunluğundaki bir ipin ucunda düşey düzlemde dönüyor. Cisim en üst noktadan $10\ \text{m/s}$ hızla geçerken ipteki gerilme kaç N'dur? ($g=10\ \text{m/s}^2$)

- A) 0
- B) 10
- C) 20
- D) 40
- E) 60

---

1. En üst noktada ağırlık ve gerilme merkeze (aşağı) doğrudur: $T+mg=\dfrac{mv^2}{r}$.
2. $\dfrac{mv^2}{r}=\dfrac{2\cdot100}{5}=40\ \text{N}$ ve $mg=20\ \text{N}$.
3. $T=40-20=20\ \text{N}$. Doğru cevap C.

Diğer şıklar: **0** ip gevşek sanılmış / **10** yarım ağırlık çıkarılmış / **40** ağırlık dikkate alınmamış, yalnızca merkezcil kuvvet yazılmış / **60** en alt nokta formülü kullanılmış, $T=40+20$.
:::

:::soru{cevap="C"}
Bir gezegenin Güneş'e olan ortalama uzaklığı Dünya'nın Güneş'e uzaklığının 4 katıdır. Bu gezegenin yörünge periyodu kaç yıldır?

- A) 2
- B) 4
- C) 8
- D) 16
- E) 64

---

1. Kepler'in üçüncü yasasına göre $\dfrac{T^2}{r^3}$ sabittir. Dünya için $T=1\ \text{yıl}$ ve $r=1$ birim alınır.
2. $T^2=4^3=64$ ve $T=8\ \text{yıl}$. Doğru cevap C.

Diğer şıklar: **2** $T\propto\sqrt r$ sanılmış / **4** $T\propto r$ sanılmış / **16** $T\propto r^2$ sanılmış / **64** $T^2$ değeri periyot sanılmış.
:::

## Kendini dene

:::dene
1. Düzgün çembersel harekette hızın hangi büyüklüğü sabit kalır? => Hızın büyüklüğü.
2. Merkezcil ivmenin yönü nedir? => Çemberin merkezine doğru.
3. Frekansı $5$ Hz olan cismin periyodu kaçtır? => $0{,}2$ s.
4. Düşey çemberde ipteki gerilme hangi noktada en büyüktür? => En alt noktada.
5. Kepler'in üçüncü yasası neyi ilişkilendirir? => Periyodun karesini yarıçapın küpüyle.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-fiz' and name = 'Çembersel Hareket'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir salıncağın gidip gelişi, bir yaya asılı cismin aşağı yukarı titreşmesi, bir gitar telinin titreşimi ya da duvar saatinin sarkacı aynı tür harekettir. Cisim bir denge noktasının iki yanında **düzenli ve tekrarlı** biçimde gidip gelir. Bu hareketin en temel hâline **basit harmonik hareket (BHH)** denir. Bu hareket yalnızca mekanikte değil, ses dalgalarında, ışıkta, alternatif akımda ve atomların titreşiminde de karşına çıkar. Bu konuda **yay-kütle sistemini**, **basit sarkacı**, konum-hız-ivme ilişkisini ve hareketteki **enerji dönüşümünü** öğreneceksin. Çembersel hareket ve enerji bilgin burada birleşiyor.

:::hedefler
1. BHH'nin şartını (geri çağırıcı kuvvet) ve özelliklerini bilmek.
2. Genlik, periyot, frekans ve açısal frekansı yorumlamak.
3. Yay-kütle sisteminde periyodu hesaplamak.
4. Basit sarkacın periyodunu ve neye bağlı olduğunu bilmek.
5. Konum, hız ve ivmenin zamanla ve konumla ilişkisini yorumlamak.
6. BHH'de enerji dönüşümünü hesaplamak.
:::

:::ipucu
BHH'nin tek şartı şudur: **Kuvvet denge noktasına doğrudur ve uzaklıkla doğru orantılıdır** ($F=-kx$). Denge noktasında hız **en büyük**, ivme **sıfırdır**. Uç noktalarda hız **sıfır**, ivme **en büyüktür**. Bu iki cümle çoğu soruyu çözer.
:::

::video{id="59qz24nCgF8" etiket="Konu anlatımı videosu" baslik="Basit Harmonik Hareket" kanal="Özcan Aykın FİZİK"}

## 1. BHH nedir?

Bir cisim denge noktası etrafında, uzaklığı ile doğru orantılı ve denge noktasına doğru bir geri çağırıcı kuvvet etkisinde salınıyorsa hareketi basit harmoniktir:

$$F=-k\,x$$

- **Genlik ($A$):** Denge noktasından en büyük uzaklık.
- **Periyot ($T$):** Bir tam salınımın süresi.
- **Frekans ($f$):** Birim zamandaki salınım sayısı, $f=\dfrac1T$.
- **Açısal frekans:** $\omega=2\pi f=\dfrac{2\pi}{T}$.

Hareketin bir tam turunda yol $4A$'dır. Uç noktalar arası uzaklık $2A$.

## 2. Yay-kütle sistemi ve basit sarkaç

**Yay-kütle:** Yay sabiti $k$, kütle $m$ ise

$$T=2\pi\sqrt{\dfrac{m}{k}}$$

Periyot genliğe **bağlı değildir**, kütle ve yay sabitine bağlıdır. Yaya asılı kütle düşey salınıyorsa denge noktası, yayın ağırlık altında uzadığı konumdur. Periyot formülü yine aynıdır. Yay sabiti $k$ olan yayı yarıya kesersen her parçanın yay sabiti $2k$ olur.

**Basit sarkaç:** Uzunluğu $\ell$ olan hafif ip ve küçük kütle, küçük açılarda ($<10^\circ$) BHH yapar:

$$T=2\pi\sqrt{\dfrac{\ell}{g}}$$

- Periyot **kütleye ve genliğe bağlı değildir.**
- Uzunluk arttıkça periyot artar. $g$ arttıkça periyot azalır.
- Ay'da ($g$ küçük) sarkaç daha yavaş salınır.

**Örnek:** $m=4\ \text{kg}$ ve $k=100\ \text{N/m}$ için $T=2\pi\sqrt{\dfrac{4}{100}}=0{,}4\pi\ \text{s}$.

**Örnek:** Periyodu $2\ \text{s}$ olan sarkacın ip boyu $4$ katına çıkarılır ve $g$ değeri $4$ katı olan bir yere götürülürse $T'=2\sqrt{\dfrac{4}{4}}=2\ \text{s}$ olur.

## 3. Konum, hız ve ivme

Denge noktasından geçerken zaman başlıyorsa konum $x=A\sin\omega t$ olur.

| Büyüklük | İfade | En büyük değer |
| --- | --- | --- |
| Konum | $x=A\sin\omega t$ | $A$ |
| Hız | $v=A\omega\cos\omega t$ | $A\omega$ |
| İvme | $a=-A\omega^2\sin\omega t$ | $A\omega^2$ |

**İlişkiler:**

- $a=-\omega^2x$: İvme, konumla doğru orantılı ve zıt yönlü.
- $v=\omega\sqrt{A^2-x^2}$.
- Hız ile konum $90^\circ$ faz farklıdır.
- Denge noktasında: $x=0$, $v=A\omega$ (en büyük), $a=0$.
- Uç noktada: $x=\pm A$, $v=0$, $\lvert a\rvert=A\omega^2$ (en büyük).

**Örnek:** $A=0{,}1\ \text{m}$ ve $T=0{,}2\pi\ \text{s}$ ise $\omega=\dfrac{2\pi}{0{,}2\pi}=10\ \text{rad/s}$. $v_{max}=A\omega=1\ \text{m/s}$ ve $a_{max}=A\omega^2=10\ \text{m/s}^2$.

::sim{tur="harmonik"}

## 4. BHH'de enerji

Sürtünme yoksa toplam mekanik enerji korunur:

$$E=\tfrac12kA^2=\tfrac12mv_{max}^2$$

Herhangi bir $x$ konumunda:

- Potansiyel enerji $E_p=\tfrac12kx^2$
- Kinetik enerji $E_k=\tfrac12k(A^2-x^2)$

Denge noktasında enerji tamamen kinetik, uç noktalarda tamamen potansiyeldir. Kinetik ve potansiyel enerji **periyodun yarısı** kadar sürede bir değişir.

**Örnek:** $k=200\ \text{N/m}$ ve $A=0{,}1\ \text{m}$ ise toplam enerji $\tfrac12\cdot200\cdot0{,}01=1\ \text{J}$. $x=0{,}05\ \text{m}$ konumunda $E_k=\tfrac12\cdot200\cdot(0{,}01-0{,}0025)=0{,}75\ \text{J}$.

## 5. Çembersel hareketle ilişki

Düzgün çembersel hareket yapan bir cismin bir çap üzerindeki izdüşümü BHH yapar. Çemberin yarıçapı genlik, çemberin açısal hızı BHH'nin açısal frekansıdır. Bu yüzden sinüs-kosinüs fonksiyonları bu hareketi tanımlar.

**Sönümlü salınım:** Gerçek sistemlerde sürtünme genliği zamanla azaltır. Periyot yaklaşık sabit kalır, enerji ısıya dönüşür. **Zorlanmış salınım** ve **rezonans:** Dışarıdan uygulanan kuvvetin frekansı doğal frekansa eşitse genlik çok büyür (köprülerin ve binaların depremde salınması, salıncağı doğru anda itmek).

## 6. Sık yapılan hatalar

- Denge noktasında ivmenin en büyük olduğunu sanmak. Orada ivme **sıfırdır**.
- Sarkaç periyodunun kütleye bağlı olduğunu düşünmek.
- Periyodun genliğe bağlı olduğunu sanmak. BHH'de bağlı değildir.
- Yay sarkacını yarıya kesince yay sabitinin yarıya indiğini sanmak. Artar, iki katı olur.

:::baglanti
BHH, **çembersel hareketin** izdüşümüdür ve **iş-enerji** konusundaki enerji dönüşümünün güzel bir örneğidir. **Dalga mekaniği** konusundaki dalgalar, ortam parçacıklarının BHH yapmasından oluşur. **Alternatif akımdaki** LC devresi de aynı denkleme uyar. **Modern fizikte** atomların ve moleküllerin titreşimi harmonik osilatör modeliyle anlatılır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Şart | $F=-kx$ |
| Yay-kütle | $T=2\pi\sqrt{\dfrac mk}$ |
| Sarkaç | $T=2\pi\sqrt{\dfrac\ell g}$ |
| Denge noktası | $v$ en büyük, $a=0$ |
| Uç noktalar | $v=0$, $a$ en büyük |
| $v_{max}$ | $A\omega$ |
| $a_{max}$ | $A\omega^2$ |
| Enerji | $\tfrac12kA^2$ |

## Mini test

:::soru{cevap="C"}
Yay sabiti $100\ \text{N/m}$ olan bir yaya bağlı $4\ \text{kg}$ kütleli cisim sürtünmesiz yatay düzlemde basit harmonik hareket yapıyor. Hareketin periyodu kaç saniyedir?

- A) $0{,}04\pi$
- B) $0{,}2\pi$
- C) $0{,}4\pi$
- D) $2\pi$
- E) $4\pi$

---

1. Yay-kütle sisteminde $T=2\pi\sqrt{\dfrac mk}$.
2. $T=2\pi\sqrt{\dfrac{4}{100}}=2\pi\cdot0{,}2=0{,}4\pi\ \text{s}$. Doğru cevap C.

Diğer şıklar: **$0{,}04\pi$** karekök alınmamış, oran $\dfrac{4}{100}$ kullanılmış / **$0{,}2\pi$** kütle 1 kg alınmış / **$2\pi$** kütle ve yay sabiti dikkate alınmamış / **$4\pi$** kütle ile $\pi$ çarpılmış.
:::

:::soru{cevap="B"}
Bir basit sarkacın periyodu $2\ \text{s}$'dir. Sarkacın ip boyu 4 katına çıkarılıp yerçekimi ivmesi bu yerin 4 katı olan bir gezegene götürülürse periyot kaç s olur?

- A) 1
- B) 2
- C) 4
- D) 8
- E) 16

---

1. Periyot $T=2\pi\sqrt{\dfrac\ell g}$ olduğundan $T\propto\sqrt{\dfrac\ell g}$.
2. $\dfrac{\ell'}{g'}=\dfrac{4\ell}{4g}=\dfrac\ell g$ olduğundan periyot değişmez, $T'=2\ \text{s}$. Doğru cevap B.

Diğer şıklar: **1** yalnızca $g$ değişimi dikkate alınmış / **4** yalnızca boy değişimi dikkate alınmış / **8** boydaki değişim periyotla çarpılmış, $2\cdot4$ / **16** boy değişimi iki kez uygulanmış.
:::

:::soru{cevap="C"}
Genliği $0{,}1\ \text{m}$ ve periyodu $0{,}2\pi\ \text{s}$ olan basit harmonik hareket yapan bir cismin denge noktasından geçerken hızı kaç m/s'dir?

- A) $0{,}1$
- B) $0{,}5$
- C) $1$
- D) $10$
- E) $100$

---

1. Açısal frekans $\omega=\dfrac{2\pi}{T}=\dfrac{2\pi}{0{,}2\pi}=10\ \text{rad/s}$.
2. Denge noktasında hız en büyüktür: $v_{max}=A\omega=0{,}1\cdot10=1\ \text{m/s}$. Doğru cevap C.

Diğer şıklar: **0,1** genlik hız sanılmış / **0,5** yarım periyotla işlem yapılmış / **10** en büyük ivme $A\omega^2$ yazılmış / **100** açısal frekans $\omega^2$ ile hız hesaplanmış.
:::

:::soru{cevap="C"}
Yay sabiti $200\ \text{N/m}$ olan bir yaya bağlı cisim $0{,}1\ \text{m}$ genlikle basit harmonik hareket yapıyor. Cisim denge noktasından $0{,}05\ \text{m}$ uzaktayken kinetik enerjisi kaç J'dür?

- A) $0{,}25$
- B) $0{,}5$
- C) $0{,}75$
- D) $1$
- E) $1{,}5$

---

1. Toplam enerji $E=\tfrac12kA^2=\tfrac12\cdot200\cdot0{,}01=1\ \text{J}$.
2. Konumdaki potansiyel enerji $E_p=\tfrac12kx^2=\tfrac12\cdot200\cdot0{,}0025=0{,}25\ \text{J}$.
3. Kinetik enerji $E_k=E-E_p=1-0{,}25=0{,}75\ \text{J}$. Doğru cevap C.

Diğer şıklar: **0,25** potansiyel enerji yazılmış / **0,5** toplam enerjinin yarısı alınmış / **1** toplam enerji yazılmış / **1,5** enerjiler toplanmış, $1+0{,}5$ gibi hesaplanmış.
:::

## Kendini dene

:::dene
1. BHH'de denge noktasında ivme kaçtır? => Sıfır.
2. Sarkaç periyodu kütleye bağlı mıdır? => Hayır.
3. Genlik $A$ ise bir tam turda alınan yol kaçtır? => $4A$.
4. Uç noktada hız ne olur? => Sıfır.
5. Yay-kütle sisteminde kütle 4 katına çıkarsa periyot ne olur? => 2 katına çıkar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Basit Harmonik Hareket'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Suya bir taş attığında oluşan halkalar, bir gitarın teli, radyodan gelen ses, cep telefonunun sinyali, gökkuşağındaki renkler ve mikrodalga fırın hep **dalgadır**. Dalgalar enerjiyi bir yerden başka bir yere **madde taşımadan** iletir. Bu konuda dalgaların **özelliklerini**, **yansıma, kırılma, girişim ve kırınım** olaylarını, **durağan dalgaları** ve **ışığın dalga doğasını** öğreneceksin. TYT'de dalga özelliklerini ve ses ve ışık temellerini öğrenmiştin. AYT'de bunlar nicel ve ayrıntılı hâle geliyor. Basit harmonik hareket bilgisi burada önemlidir, çünkü ortamın her noktası BHH yapar.

:::hedefler
1. Dalga türlerini (mekanik, elektromanyetik, enine, boyuna) ayırt etmek.
2. $v=\lambda f$ bağıntısını kullanmak.
3. Yansıma ve kırılma yasalarını (Snell) uygulamak.
4. Girişim şartlarını (yapıcı ve yıkıcı) yorumlamak.
5. Çift yarıkta girişim ve tek yarıkta kırınımı anlamak.
6. Durağan dalgaları ve bağıntılarını bilmek.
:::

:::ipucu
Dalga sorularında **frekans kaynağa aittir** ve ortam değişince **değişmez**. Ortam değişince hız ve dalga boyu değişir ($v=\lambda f$). Kırılmada bu kural pek çok soruyu çözer.
:::

::video{id="PiopPOZLyiU" etiket="Konu anlatımı videosu" baslik="Dalga Mekaniği" kanal="tonguç KAMPÜS"}

## 1. Dalga türleri ve özellikleri

**Mekanik dalga:** Yayılmak için ortam ister (su, ses, yay dalgası). **Elektromanyetik dalga:** Boşlukta da yayılır (ışık, radyo, X ışını).

**Titreşim yönüne göre:** **Enine dalga** (titreşim yayılmaya dik): su yüzeyi, ip, ışık. **Boyuna dalga** (titreşim yayılma doğrultusunda): ses, yayda sıkışma-genişleme.

**Büyüklükler:**

- **Genlik ($A$):** Denge konumundan en büyük uzaklık. Enerji ile ilgilidir.
- **Dalga boyu ($\lambda$):** Ardışık iki özdeş nokta arası uzaklık.
- **Frekans ($f$):** Bir saniyedeki dalga sayısı. **Periyot** $T=\dfrac1f$.
- **Hız:** $v=\lambda f=\dfrac\lambda T$.

**Örnek:** $\lambda=0{,}4\ \text{m}$ ve $T=0{,}2\ \text{s}$ ise $v=\dfrac{0{,}4}{0{,}2}=2\ \text{m/s}$.

::sim{tur="dalga"}

**Dalga hızı** ortamın özelliklerine bağlıdır: ipte gerilmeye ve ipin kütle yoğunluğuna, suda derinliğe, seste sıcaklığa ve ortama. Frekansa bağlı değildir.

## 2. Yansıma ve kırılma

**Yansıma yasaları:** Gelen ışın, yansıyan ışın ve normal aynı düzlemdedir. Gelme açısı yansıma açısına eşittir. Yansımada $v$, $\lambda$ ve $f$ değişmez.

**Kırılma:** Dalga bir ortamdan başka bir ortama geçerken hızı ve yönü değişir. **Frekans değişmez**, hız ve dalga boyu değişir.

$$\dfrac{\sin\theta_1}{\sin\theta_2}=\dfrac{v_1}{v_2}=\dfrac{\lambda_1}{\lambda_2}=\dfrac{n_2}{n_1}$$

Işıkta $n=\dfrac cv$ kırılma indisidir. Yoğun ortama ($n$ büyük) girerken ışın **normale yaklaşır**, seyrek ortama girerken normalden **uzaklaşır**.

**Örnek:** Havadan ($n=1$) cama ($n=1{,}6$) $53^\circ$ ile gelen ışının kırılma açısı: $\sin\theta_2=\dfrac{\sin53^\circ}{1{,}6}=\dfrac{0{,}8}{1{,}6}=0{,}5$ ve $\theta_2=30^\circ$.

**Tam yansıma:** Yoğun ortamdan seyrek ortama geçerken gelme açısı **kritik açıdan** büyükse ışık geçmez, tamamen yansır: $\sin\theta_k=\dfrac{n_2}{n_1}$. Optik fiber bu olaya dayanır.

## 3. Girişim

İki dalganın aynı yerde üst üste gelip toplanmasına **girişim** denir (süperpozisyon).

**Yol farkı $\Delta x$ ile:**

| Durum | Yol farkı | Sonuç |
| --- | --- | --- |
| Yapıcı girişim | $\Delta x=n\lambda$ ($n=0,1,2,\dots$) | Genlik büyür |
| Yıkıcı girişim | $\Delta x=\left(n+\tfrac12\right)\lambda$ | Genlik küçülür, sıfır olabilir |

(Kaynaklar aynı fazlıysa.)

**Çift yarık (Young deneyi):** Tek renkli ışık, aralarındaki uzaklık $d$ olan iki yarıktan geçip $L$ uzaklıktaki ekranda aydınlık-karanlık saçaklar oluşturur. Ardışık aydınlık saçaklar arası uzaklık

$$\Delta y=\dfrac{\lambda L}{d}$$

**Örnek:** $\lambda=600\ \text{nm}$, $d=0{,}3\ \text{mm}$ ve $L=1{,}5\ \text{m}$ ise $\Delta y=\dfrac{600\cdot10^{-9}\cdot1{,}5}{3\cdot10^{-4}}=3\cdot10^{-3}\ \text{m}=3\ \text{mm}$.

Bu deney ışığın **dalga doğasının** en güçlü kanıtlarından biridir. $\lambda$ artarsa ve $d$ azalırsa saçaklar genişler. Beyaz ışıkta renkler farklı yerde yapıcı girişim verir, sabun köpüğündeki renkler bu olaydır.

## 4. Kırınım

Dalganın bir **engelin kenarından ya da dar bir aralıktan** geçerken yayılmasına **kırınım** denir. Kırınım en çok açıklık dalga boyuyla **aynı mertebede** olduğunda belirgindir. Ses dalgaları (dalga boyu metre mertebesi) köşeyi dönebilir, ışık dalgaları (dalga boyu mikrometreden küçük) günlük açıklıklarda belli etmez. **Tek yarıkta** kırınımda ekranda geniş merkezi aydınlık ve yanlarda daha sönük saçaklar oluşur.

## 5. Durağan dalga

Aynı frekanslı, zıt yönlü iki dalga üst üste gelince **durağan (duran) dalga** oluşur. Düğüm noktaları sürekli duruyor, karın noktaları en büyük genlikle titreşiyor.

- İki ucu sabit tel ya da boru: $L=n\dfrac\lambda2$ ($n=1,2,3,\dots$), $f_n=n\dfrac{v}{2L}$.
- Ardışık iki düğüm (ya da karın) arası uzaklık $\dfrac\lambda2$.
- Temel frekans ($n=1$) en düşük frekanstır. Gitar telinin ve flütün sesi bu modlarla oluşur.

**Örnek:** $L=1{,}2\ \text{m}$ iki ucu sabit tel için temel mod $\lambda=2L=2{,}4\ \text{m}$ ve 3. harmonik $\lambda=\dfrac{2L}{3}=0{,}8\ \text{m}$.

## 6. Ses ve ışık dalgaları

**Ses:** Boyuna mekanik dalgadır, boşlukta yayılmaz. Havada ($20^\circ\text{C}$) yaklaşık $340\ \text{m/s}$. Ses şiddeti genlikle, **yükseklik (ton)** frekansla, **tını** dalga şeklinin karmaşıklığıyla ilgilidir. **Doppler olayı:** Kaynak ve gözlemci birbirine yaklaşırsa algılanan frekans artar, uzaklaşırsa azalır.

**Işık:** Elektromanyetik dalgadır, boşlukta $c=3\cdot10^8\ \text{m/s}$. **Elektromanyetik spektrum** (dalga boyu büyükten küçüğe): radyo, mikrodalga, kızılötesi, görünür ışık (kırmızıdan mora), mor ötesi, X ışını, gama. Hepsi boşlukta aynı hızla gider. Frekansı büyük olanın enerjisi büyüktür.

## 7. Sık yapılan hatalar

- Kırılmada frekansın değiştiğini sanmak. Frekans değişmez.
- Yoğun ortama girişte ışının normalden uzaklaştığını düşünmek. Yaklaşır.
- Yapıcı ve yıkıcı girişim şartlarını karıştırmak.
- Sesin boşlukta yayılabileceğini sanmak.

:::baglanti
Dalga hızı ve $v=\lambda f$ ilişkisi, **temel hareket konularında** öğrendiğin hız kavramının dalgalara uyarlamasıdır. **Basit harmonik hareket**, dalganın ortam taneciklerindeki davranışını açıklar. **Alternatif akım** devresindeki rezonans, durağan dalgaya benzer bir olaydır. **Modern fizikte** ışığın hem dalga hem parçacık gibi davrandığı keşfedilir (foton). **Teknolojide** fiber optik, radyo, radar, ultrason ve lazer dalga olaylarına dayanır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Dalga hızı | $v=\lambda f$ |
| Kırılmada değişmeyen | Frekans |
| Snell | $\dfrac{\sin\theta_1}{\sin\theta_2}=\dfrac{n_2}{n_1}$ |
| Yapıcı girişim | $\Delta x=n\lambda$ |
| Yıkıcı girişim | $\Delta x=\left(n+\tfrac12\right)\lambda$ |
| Çift yarık | $\Delta y=\dfrac{\lambda L}{d}$ |
| Durağan dalga | $L=n\dfrac\lambda2$ |

## Mini test

:::soru{cevap="C"}
Dalga boyu $0{,}4\ \text{m}$ ve periyodu $0{,}2\ \text{s}$ olan bir dalganın yayılma hızı kaç m/s'dir?

- A) $0{,}08$
- B) $0{,}5$
- C) 2
- D) 5
- E) 12,5

---

1. Dalga hızı $v=\dfrac{\lambda}{T}$.
2. $v=\dfrac{0{,}4}{0{,}2}=2\ \text{m/s}$. Doğru cevap C.

Diğer şıklar: **0,08** dalga boyu ile periyot çarpılmış / **0,5** oran ters alınmış, $\dfrac{T}{\lambda}$ / **5** frekans $f=\dfrac1T$ hız sanılmış / **12,5** frekans dalga boyuna bölünmüş, $\dfrac{5}{0{,}4}$.
:::

:::soru{cevap="B"}
Dalga boyu $600\ \text{nm}$ olan tek renkli ışık, aralarında $0{,}3\ \text{mm}$ uzaklık bulunan iki yarıktan geçiyor ve $1{,}5\ \text{m}$ uzaktaki ekranda girişim saçakları oluşturuyor. Ardışık iki aydınlık saçak arasındaki uzaklık kaç mm'dir?

- A) $0{,}3$
- B) 3
- C) 12
- D) 30
- E) 300

---

1. Saçak aralığı $\Delta y=\dfrac{\lambda L}{d}$.
2. $\Delta y=\dfrac{600\cdot10^{-9}\cdot1{,}5}{0{,}3\cdot10^{-3}}=3\cdot10^{-3}\ \text{m}=3\ \text{mm}$. Doğru cevap B.

Diğer şıklar: **0,3** sonuç bir basamak küçük yazılmış, birim dönüşümü hatalı / **12** yarık aralığı $0{,}075\ \text{mm}$ alınmış / **30** birim dönüşümünde bir basamak fazla / **300** iki basamak fazla dönüştürülmüş.
:::

:::soru{cevap="A"}
Havadan ($n=1$) camın yüzeyine ($n=1{,}6$) normalle $53^\circ$ açı yaparak gelen bir ışının kırılma açısı kaç derecedir? ($\sin53^\circ=0{,}8$, $\sin30^\circ=0{,}5$, $\sin37^\circ=0{,}6$)

- A) 30
- B) 33
- C) 37
- D) 53
- E) 60

---

1. Snell yasası: $n_1\sin\theta_1=n_2\sin\theta_2$.
2. $1\cdot0{,}8=1{,}6\cdot\sin\theta_2$ ve $\sin\theta_2=0{,}5$, yani $\theta_2=30^\circ$. Doğru cevap A.

Diğer şıklar: **33** açı doğrudan kırılma indisine bölünmüş, $\dfrac{53}{1{,}6}$ / **37** cam $n=\dfrac43$ sanılmış, $\sin\theta_2=0{,}6$ / **53** kırılma olmadığı sanılmış / **60** kırılma açısı $90^\circ-30^\circ$ olarak yüzeyle yapılan açı alınmış.
:::

:::soru{cevap="D"}
Aynı fazlı iki kaynaktan çıkan dalga boyu $\lambda$ olan dalgaların girişim yaptığı bir noktada **yıkıcı girişim** oluşması için bu noktaya olan yol farkı aşağıdakilerden hangisi olabilir?

- A) 0
- B) $\lambda$
- C) $2\lambda$
- D) $\dfrac{3\lambda}{2}$
- E) $3\lambda$

---

1. Aynı fazlı kaynaklarda yıkıcı girişim için yol farkı $\left(n+\tfrac12\right)\lambda$ olmalıdır, yani yarım dalga boyunun tek katı.
2. $\dfrac{3\lambda}{2}=\left(1+\tfrac12\right)\lambda$ bu şartı sağlar. Doğru cevap D.

Diğer şıklar: **0**, **$\lambda$**, **$2\lambda$** ve **$3\lambda$** dalga boyunun tam katlarıdır ve yapıcı girişim verir.
:::

## Kendini dene

:::dene
1. Kırılmada hangi büyüklük değişmez? => Frekans.
2. Sesin boşlukta yayılması mümkün müdür? => Hayır.
3. $f=50$ Hz ve $\lambda=6$ m ise hız kaçtır? => 300 m/s.
4. Ardışık iki düğüm arası uzaklık kaçtır? => $\dfrac\lambda2$.
5. Işık yoğun ortama girerken normale mi yaklaşır, uzaklaşır mı? => Yaklaşır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-fiz' and name = 'Dalga Mekaniği'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir neon tabelanın kırmızı, sodyum lambasının sarı ışık vermesi, gökyüzündeki yıldızların renkleri, bir nükleer santralin enerji üretmesi ve bir hastanede kanser tedavisinde kullanılan ışınlar atomun içindeki olaylarla açıklanır. Atom bir zamanlar "bölünemeyen en küçük parça" sanılıyordu. Bugün çekirdek, elektron ve enerji düzeylerinden oluşan bir yapı olduğunu biliyoruz. Bu konuda **atom modellerinin gelişimini**, **Bohr modelini**, **enerji düzeyleri arasındaki geçişleri**, **çekirdeğin yapısını**, **bağlanma enerjisini** ve **radyoaktif bozunmayı** öğreneceksin. Elektrik, enerji ve dalga bilgin, atomun dünyasına giriş için gerekli.

:::hedefler
1. Thomson, Rutherford ve Bohr atom modellerini karşılaştırmak.
2. Bohr modelinde enerji düzeylerini ve foton salma ya da soğurma geçişlerini hesaplamak.
3. Çekirdeğin yapısını ($Z$, $N$, $A$) ve izotop kavramını bilmek.
4. Kütle kusurundan bağlanma enerjisini hesaplamak.
5. Alfa, beta ve gama ışımalarını ayırt etmek, çekirdek denklemlerini denkleştirmek.
6. Yarı ömür ile kalan madde miktarını hesaplamak.
:::

:::ipucu
Çekirdek tepkimelerinde iki şey **her zaman korunur**: **kütle numarası** ($A$, üst sayı toplamı) ve **atom numarası** ($Z$, alt sayı toplamı). Denklemin iki yanındaki üst sayıları ve alt sayıları ayrı ayrı topla ve eşitle.
:::

::video{id="eVv6Jh8HtH4" etiket="Konu anlatımı videosu" baslik="Atom Fiziği ve Radyoaktivite" kanal="Fizikfinito"}

## 1. Atom modelleri

| Model | Fikir | Eksik |
| --- | --- | --- |
| Thomson (üzümlü kek) | Pozitif yüklü kütle içine gömülü elektronlar | Saçılma deneyini açıklayamaz |
| Rutherford (gezegen) | Küçük ve yoğun pozitif çekirdek, etrafında dönen elektronlar | Dönen elektron enerji yayıp çekirdeğe düşmeli, kararlılığı ve çizgi spektrumunu açıklayamaz |
| Bohr | Elektronlar yalnızca belirli (kuantumlu) yörüngelerde bulunur, geçişte foton alır ya da verir | Çok elektronlu atomları açıklayamaz |

**Rutherford saçılma deneyi:** Altın levhaya gönderilen alfa parçacıklarının çoğu doğrultusunu korudu, çok azı büyük açıyla saçıldı. Sonuç: Atomun kütlesi ve pozitif yükü çok küçük bir **çekirdekte** toplanmıştır, atomun büyük kısmı boşluktur.

## 2. Bohr modeli

Bohr varsayımları:

1. Elektron çekirdek etrafında, yalnızca **belirli yörüngelerde** ve **enerji yaymadan** bulunur (kararlı hâller).
2. Elektron bir yörüngeden diğerine geçerken **foton** alır ya da verir. Foton enerjisi iki düzey arasındaki farka eşittir.

**Hidrojen atomunun enerji düzeyleri:**

$$E_n=-\dfrac{13{,}6}{n^2}\ \text{eV}\qquad(n=1,2,3,\dots)$$

$n=1$ temel hâldir ($-13{,}6\ \text{eV}$). Enerji düzeyleri yukarı çıktıkça sıklaşır ve $0$'a yaklaşır. $0$ eV iyonlaşma sınırıdır. Temel haldeki atomu iyonlaştırmak için $13{,}6\ \text{eV}$ gerekir.

**Foton enerjisi:**

$$E_{foton}=hf=\dfrac{hc}{\lambda}=\lvert E_i-E_f\rvert$$

- Üst düzeyden alt düzeye geçişte foton **salınır** (ışıma, emisyon).
- Alt düzeyden üst düzeye geçişte aynı enerjili foton **soğurulur** (absorpsiyon).

**Örnek:** $n=3\to n=2$ geçişinde $E=-\dfrac{13{,}6}{9}-\left(-\dfrac{13{,}6}{4}\right)=-1{,}51+3{,}4\approx1{,}89\ \text{eV}$ (görünür bölgede kırmızı ışık).

**Spektrum çizgileri:** Her elementin kendine özgü enerji düzeyleri olduğundan yaydığı ışığın çizgi spektrumu bir **parmak izi** gibidir. Yıldızların bileşimi spektrumlarından bulunur. $n=2$'ye geçişler (Balmer serisi) görünür bölgededir, $n=1$'e geçişler (Lyman) mor ötesidir.

![Hidrojen atomunun enerji düzeyleri ve foton salınımı geçişleri](/lessons/ayt-fiz/bohr-duzeyleri.svg "Hidrojen atomunun enerji düzeyleri")

## 3. Çekirdeğin yapısı

Çekirdek **protonlar** ve **nötronlardan** oluşur (**nükleonlar**).

- $Z$: atom numarası (proton sayısı)
- $N$: nötron sayısı
- $A=Z+N$: kütle numarası

Gösterim ${}^A_ZX$. **İzotop**, protonu ($Z$) aynı, nötronu farklı atomlardır (${}^{12}_6\text{C}$ ve ${}^{14}_6\text{C}$). Kimyasal özellikleri aynı, kararlılıkları farklıdır.

**Çekirdek kuvvetleri:** Protonlar birbirini iterken çekirdeği bir arada tutan **güçlü nükleer kuvvet** çok kısa menzilli ve çok şiddetlidir.

**Bağlanma enerjisi:** Bir çekirdeğin kütlesi, onu oluşturan nükleonların kütleleri toplamından **küçüktür**. Aradaki farka **kütle kusuru** ($\Delta m$) denir. Kayıp kütle, çekirdeği bir arada tutan enerjiye dönüşmüştür:

$$E_b=\Delta m\,c^2$$

Atomik birimde $1\ \text{u}=931{,}5\ \text{MeV}/c^2$. Yani $\Delta m$ (u cinsinden) ile $931{,}5$ çarpılırsa $E_b$ MeV olarak bulunur.

**Örnek:** Kütle kusuru $0{,}03\ \text{u}$ ise $E_b=0{,}03\cdot931{,}5\approx28\ \text{MeV}$.

Nükleon başına bağlanma enerjisi demir civarında (kütle numarası yaklaşık 56) en büyüktür. Bu yüzden **hafif çekirdekler birleşerek (füzyon)**, **ağır çekirdekler bölünerek (fisyon)** enerji verir.

## 4. Radyoaktivite

Kararsız çekirdeklerin kendiliğinden ışıma yaparak başka çekirdeğe dönüşmesine **radyoaktif bozunma** denir.

| Işıma | Parçacık | Çekirdekte değişim | Nüfuz etme |
| --- | --- | --- | --- |
| Alfa ($\alpha$) | ${}^4_2\text{He}$ | $A$ 4 azalır, $Z$ 2 azalır | En az (kâğıt durdurur) |
| Beta ($\beta^-$) | Elektron | $A$ aynı, $Z$ 1 artar (nötron protona dönüşür) | Orta (alüminyum levha durdurur) |
| Gama ($\gamma$) | Yüksek enerjili foton | $A$ ve $Z$ aynı, çekirdek uyarılmış durumdan çıkar | En çok (kurşun, beton) |

**Örnek:** ${}^{238}_{92}\text{U}\to{}^{A}_{Z}\text{Th}+{}^4_2\text{He}$. $A=238-4=234$ ve $Z=92-2=90$. Yeni çekirdek ${}^{234}_{90}\text{Th}$.

**Bozunma serisi:** Bir çekirdek peş peşe $\alpha$ ve $\beta$ bozunmaları yaparak kararlı bir çekirdeğe ulaşır.

## 5. Yarı ömür

**Yarı ömür ($T_{1/2}$):** Radyoaktif bir örnekteki çekirdeklerin yarısının bozunması için geçen süredir. Her çekirdek için sabit bir değerdir ve sıcaklık, basınç gibi dış etkenlerden **etkilenmez**.

$$N=N_0\left(\dfrac12\right)^{t/T_{1/2}}$$

**Örnek:** Yarı ömrü $4$ gün olan maddeden $80\ \text{g}$ varsa $12$ gün sonra $\dfrac{12}{4}=3$ yarı ömür geçer. Kalan $80\cdot\dfrac18=10\ \text{g}$ ve bozunan $70\ \text{g}$.

| Geçen süre | Kalan oran |
| --- | --- |
| $T_{1/2}$ | $\dfrac12$ |
| $2T_{1/2}$ | $\dfrac14$ |
| $3T_{1/2}$ | $\dfrac18$ |

**Aktivite:** Birim zamandaki bozunma sayısı. Birimi becquerel ($1\ \text{Bq}=1\ \text{bozunma/s}$). Aktivite de yarı ömürle yarıya iner.

**Karbon-14 yaş tayini:** Canlılar öldükten sonra ${}^{14}\text{C}$ miktarı yarı ömrüyle ($\approx5730$ yıl) azalır. Kalan oran ölçülerek fosil ve tarihî eserlerin yaşı bulunur.

## 6. Sık yapılan hatalar

- Yarı ömür süresinde maddenin tamamının bozunduğunu sanmak. Her yarı ömürde **kalanın yarısı** bozunur.
- Beta bozunumunda kütle numarasının değiştiğini düşünmek. Değişmez, yalnızca $Z$ değişir.
- Alfa bozunumunda $Z$'nin 4 azaldığını sanmak. $A$ 4, $Z$ 2 azalır.
- Foton salımı ile soğurumunu karıştırmak. Üst düzeyden alta geçişte foton **salınır**.

:::baglanti
Atom fiziği, **elektriksel kuvvet** (çekirdek-elektron çekimi) ve **dalga mekaniği** (fotonun enerjisi ve dalga boyu) ile bağlantılıdır. **Modern fizik** konusunda fotoelektrik olay ve madde dalgaları, atom modelinin devamıdır. **Modern fiziğin teknolojideki uygulamaları** konusunda nükleer enerji, tıpta görüntüleme ve radyoterapi bu bilgilere dayanır. **Kimyada** periyodik tablo, çekirdek yükü ve elektron dizilimiyle açıklanır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Hidrojen düzeyi | $E_n=-\dfrac{13{,}6}{n^2}$ eV |
| Foton | $hf=\lvert E_i-E_f\rvert$ |
| Kütle numarası | $A=Z+N$ |
| Bağlanma enerjisi | $\Delta m\,c^2$ |
| Alfa | $A-4$, $Z-2$ |
| Beta | $A$ aynı, $Z+1$ |
| Yarı ömür | $N=N_0\left(\tfrac12\right)^{t/T}$ |

## Mini test

:::soru{cevap="B"}
Hidrojen atomunda elektron $n=3$ düzeyinden $n=2$ düzeyine geçerken yayılan fotonun enerjisi yaklaşık kaç eV'dur? ($E_n=-\dfrac{13{,}6}{n^2}\ \text{eV}$)

- A) $1{,}51$
- B) $1{,}89$
- C) $3{,}4$
- D) $10{,}2$
- E) $12{,}1$

---

1. $E_3=-\dfrac{13{,}6}{9}\approx-1{,}51\ \text{eV}$ ve $E_2=-\dfrac{13{,}6}{4}=-3{,}4\ \text{eV}$.
2. Foton enerjisi iki düzeyin farkıdır: $-1{,}51-(-3{,}4)\approx1{,}89\ \text{eV}$. Doğru cevap B.

Diğer şıklar: **1,51** yalnızca $n=3$ düzeyinin enerjisi yazılmış / **3,4** yalnızca $n=2$ düzeyinin enerjisi yazılmış / **10,2** $n=2\to n=1$ geçişi hesaplanmış / **12,1** $n=3\to n=1$ geçişi hesaplanmış.
:::

:::soru{cevap="E"}
Yarı ömrü 4 gün olan radyoaktif bir maddeden başlangıçta 80 g bulunmaktadır. 12 gün sonra bozunmuş madde miktarı kaç g'dır?

- A) 10
- B) 20
- C) 40
- D) 60
- E) 70

---

1. $12$ gün $=\dfrac{12}{4}=3$ yarı ömür eder. Kalan madde $80\cdot\left(\dfrac12\right)^3=10\ \text{g}$.
2. Bozunan miktar $80-10=70\ \text{g}$. Doğru cevap E.

Diğer şıklar: **10** kalan madde miktarı yazılmış / **20** 8 gün sonraki kalan miktar alınmış / **40** 4 gün sonraki bozunan ya da kalan miktar alınmış / **60** 8 gün sonraki bozunan miktar alınmış.
:::

:::soru{cevap="C"}
${}^{238}_{92}\text{U}$ çekirdeği bir alfa bozunumu yaparak bir toryum (Th) çekirdeğine dönüşüyor. Oluşan toryum çekirdeğinin kütle numarası kaçtır?

- A) 230
- B) 232
- C) 234
- D) 236
- E) 238

---

1. Alfa parçacığı ${}^4_2\text{He}$'dur. Tepkimede kütle numarası korunur: $238=A+4$.
2. $A=234$ (ve $Z=92-2=90$). Doğru cevap C.

Diğer şıklar: **230** iki alfa bozunumu sanılmış, $238-8$ / **232** alfanın kütle numarası $6$ alınmış / **236** alfanın kütle numarası $2$ alınmış / **238** kütle numarasının değişmediği sanılmış.
:::

:::soru{cevap="D"}
Bir çekirdeğin kütle kusuru $0{,}03\ \text{u}$'dur. ($1\ \text{u}$ kütlenin enerji karşılığı $931{,}5\ \text{MeV}$) Bu çekirdeğin toplam bağlanma enerjisi yaklaşık kaç MeV'dir?

- A) $0{,}03$
- B) $2{,}8$
- C) $14$
- D) $28$
- E) $931{,}5$

---

1. Bağlanma enerjisi $E_b=\Delta m\,c^2$ ve $1\ \text{u}=931{,}5\ \text{MeV}$ karşılığındadır.
2. $E_b=0{,}03\cdot931{,}5\approx28\ \text{MeV}$. Doğru cevap D.

Diğer şıklar: **0,03** kütle kusuru enerji sanılmış / **2,8** $0{,}003$ ile çarpılmış, bir basamak küçük / **14** $\tfrac12\Delta m\,c^2$ alınmış / **931,5** yalnızca $1\ \text{u}$'nun enerji karşılığı yazılmış.
:::

## Kendini dene

:::dene
1. Rutherford deneyi neyi gösterdi? => Atomun pozitif yükünün küçük bir çekirdekte toplandığını.
2. $Z=6$ ve $N=8$ olan çekirdeğin kütle numarası kaçtır? => 14.
3. Beta bozunumunda kütle numarası değişir mi? => Hayır.
4. Yarı ömür sıcaklığa bağlı mıdır? => Hayır.
5. Hangi ışımanın nüfuz etme gücü en fazladır? => Gama ışıması.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-fiz' and name = 'Atom Fiziği ve Radyoaktivite'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

19. yüzyılın sonunda bazı fizikçiler fiziğin neredeyse tamamlandığını düşünüyordu. Sonra iki gözlem hiçbir şeyi eskisi gibi bırakmadı: Işık, metale çarptığında elektron koparıyordu ama bunu dalga teorisiyle açıklamak mümkün değildi. Işığın hızı da, hangi hızla koşarsan koş, hep aynı ölçülüyordu. Birincisi **kuantum fiziğini**, ikincisi **özel göreliliği** doğurdu. Bu konuda **fotoelektrik olayı**, **ışığın tanecik doğasını**, **madde dalgalarını**, **belirsizlik ilkesini** ve **özel görelilik**'in temel sonuçlarını öğreneceksin. Önceki konulardaki dalga ve atom bilgin burada sınanıyor ve genişliyor.

:::hedefler
1. Fotoelektrik olayı açıklamak ve $E_{foton}=\phi+K_{max}$ bağıntısını kullanmak.
2. Fotoelektrik olayda ışık şiddetinin ve frekansın etkisini ayırt etmek.
3. Foton enerjisini ve momentumunu hesaplamak.
4. de Broglie dalga boyunu hesaplamak.
5. Belirsizlik ilkesini yorumlamak.
6. Özel göreliliğin zaman genişlemesi, boy kısalması ve $E=mc^2$ sonuçlarını kullanmak.
:::

:::ipucu
Fotoelektrik olayda **frekans** ile **şiddet** farklı işler yapar: Frekans, sökülen elektronun **enerjisini** belirler. Şiddet ise sökülen elektronun **sayısını** (akımı) belirler. Frekans eşik değerin altındaysa şiddet ne kadar büyük olursa olsun elektron sökülmez.
:::

::video{id="q-1gY7LhSrA" etiket="Konu anlatımı videosu" baslik="Özel Görelilik" kanal="Fizikle Barış"}

## 1. Fotoelektrik olay

Metal yüzeyine uygun frekansta ışık düşürülünce yüzeyden elektron sökülmesidir. Klasik dalga kuramı şu üç gözlemi açıklayamadı:

1. Işığın frekansı **eşik frekansından** küçükse, şiddet ne kadar büyük olursa olsun elektron sökülmez.
2. Sökülen elektronların **maksimum kinetik enerjisi şiddete bağlı değildir**, frekansla artar.
3. Işık düşer düşmez (gecikmesiz) elektron sökülür.

**Einstein'ın açıklaması:** Işık, her biri $E=hf$ enerjisi taşıyan **fotonlardan** oluşur. Bir foton bir elektrona tüm enerjisini verir. Elektronun metalden kopması için gerekli en küçük enerjiye **bağlanma (iş) fonksiyonu** ($\phi$) denir:

$$hf=\phi+K_{max}\qquad\text{ve}\qquad\phi=hf_0$$

($f_0$: eşik frekansı). $h=6{,}63\cdot10^{-34}\ \text{J}\cdot\text{s}$ Planck sabitidir.

::sim{tur="fotoelektrik"}

**Durdurma potansiyeli:** Sökülen en hızlı elektronları durdurmak için uygulanan ters potansiyel: $eV_0=K_{max}$.

**Örnek:** İş fonksiyonu $2\ \text{eV}$ olan metale $5\ \text{eV}$ enerjili foton düşüyor. $K_{max}=5-2=3\ \text{eV}$ ve durdurma potansiyeli $3\ \text{V}$.

| Değişen | Etkisi |
| --- | --- |
| Işık şiddeti artar (frekans sabit, eşik üstü) | Sökülen elektron sayısı (akım) artar, $K_{max}$ değişmez |
| Frekans artar | $K_{max}$ ve durdurma potansiyeli artar |
| Frekans $<f_0$ | Elektron sökülmez |
| Metal değişir | $\phi$ ve $f_0$ değişir |

## 2. Foton ve ışığın ikili doğası

**Foton enerjisi:** $E=hf=\dfrac{hc}{\lambda}$. Kolaylık için $hc\approx1240\ \text{eV}\cdot\text{nm}$, yani $E(\text{eV})=\dfrac{1240}{\lambda(\text{nm})}$.

**Foton momentumu:** $p=\dfrac{h}{\lambda}$. Kütlesiz olduğu hâlde momentumu vardır. Compton olayında bir foton, elektrona çarpınca enerji ve momentum aktararak dalga boyu artar. Bu, fotonun parçacık gibi davrandığının kanıtıdır.

**İkili doğa:** Girişim ve kırınımda ışık **dalga**, fotoelektrik ve Compton olayında **tanecik (foton)** gibi davranır. İkisi birden aynı deneyde gözlenmez.

## 3. Madde dalgaları

Louis de Broglie: Işık hem dalga hem tanecik ise **madde parçacıkları da dalga özelliği gösterir.** Momentumu $p$ olan parçacığın dalga boyu

$$\lambda=\dfrac{h}{p}=\dfrac{h}{mv}$$

Bu dalga boyu günlük cisimlerde çok küçük olduğu için fark edilmez. Elektron gibi küçük kütleli parçacıklarda belirgindir. Elektron kırınımı deneyi (Davisson-Germer) bu fikri doğruladı, **elektron mikroskobu** bu özelliğe dayanır.

**Örnek:** Aynı kütleli bir parçacığın hızı yarıya inerse momentumu yarıya iner ve de Broglie dalga boyu **iki katına** çıkar.

## 4. Belirsizlik ilkesi

Heisenberg: Bir parçacığın **konumu ve momentumu aynı anda** istenildiği kadar kesin ölçülemez:

$$\Delta x\cdot\Delta p\ \gtrsim\ \dfrac{h}{4\pi}$$

Bu, ölçüm aletinin yetersizliği değil, doğanın temel bir özelliğidir. Konum ne kadar kesin bilinirse momentum o kadar belirsizleşir. Elektronun atomdaki kesin yörüngesinden söz edilmez, bulunma olasılığından söz edilir (orbital).

## 5. Özel görelilik

Einstein'ın iki postülası:

1. Fizik yasaları, birbirine göre sabit hızla hareket eden **tüm eylemsiz gözlemciler için aynıdır.**
2. **Işığın boşluktaki hızı** ($c=3\cdot10^8\ \text{m/s}$) kaynağın ve gözlemcinin hareketinden bağımsız olarak herkes için aynıdır.

**Sonuçlar:**

- **Zaman genişlemesi:** Hareketli saat yavaş işler. Durağan gözlemcinin ölçtüğü süre $\Delta t=\gamma\,\Delta t_0$, burada $\Delta t_0$ cisimle birlikte hareket eden saatin ölçtüğü (öz) süre ve $\gamma=\dfrac{1}{\sqrt{1-v^2/c^2}}\ge1$.
- **Boy kısalması:** Hareket doğrultusundaki uzunluk durağan gözlemciye kısa görünür: $L=\dfrac{L_0}{\gamma}$.
- **Hız sınırı:** Kütleli hiçbir cisim $c$'ye ulaşamaz.
- **Kütle-enerji eşdeğerliği:**

$$E=mc^2$$

Hareketsiz kütlenin enerjisi $E_0=m_0c^2$. Küçük bir kütle büyük bir enerjiye karşılık gelir. Çekirdek tepkimelerinde ve Güneş'te bu dönüşüm olur.

**Örnek:** $v=0{,}6c$ için $\gamma=\dfrac{1}{\sqrt{1-0{,}36}}=1{,}25$. Cisimle birlikte hareket eden saat $8\ \text{s}$ ölçerse yerdeki gözlemci $8\cdot1{,}25=10\ \text{s}$ ölçer.

**Örnek:** $v=0{,}6c$ ile giden $5\ \text{m}$'lik bir cismin yerdeki gözlemciye göre boyu $\dfrac{5}{1{,}25}=4\ \text{m}$ görünür.

**GPS uydularında** görelilik düzeltmeleri yapılmazsa konum günde kilometrelerce kayar.

## 6. Sık yapılan hatalar

- Işık şiddeti arttığında elektronların kinetik enerjisinin de arttığını sanmak.
- Foton enerjisi eşik enerjisinden küçük olduğu hâlde elektron söküleceğini düşünmek.
- Zaman genişlemesinde hangi saatin "öz zaman" ölçtüğünü karıştırmak.
- $E=mc^2$'de kütleyi gram olarak $c^2$ ile çarpmak. Kütle **kg** olmalıdır.

:::baglanti
Modern fizik, **atom fiziğinin** (enerji düzeyleri) devamıdır. Fotonun dalga ve tanecik doğası, **dalga mekaniğinin** girişim ve kırınım bilgisiyle çelişkili görünüp onu tamamlar. **İş-enerji** konusundaki enerji korunumu, burada kütle-enerji korunumuna genişler. **Teknolojide** güneş pilleri, fotosel, dijital kamera sensörü ve lazer bu konunun uygulamalarıdır (sonraki konu).
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Foton enerjisi | $hf=\dfrac{hc}{\lambda}$ |
| Fotoelektrik | $hf=\phi+K_{max}$ |
| Şiddet | Elektron sayısını belirler |
| Frekans | $K_{max}$'ı belirler |
| de Broglie | $\lambda=\dfrac hp$ |
| Belirsizlik | $\Delta x\,\Delta p\gtrsim\dfrac{h}{4\pi}$ |
| Zaman genişlemesi | $\Delta t=\gamma\Delta t_0$ |
| Kütle-enerji | $E=mc^2$ |

## Mini test

:::soru{cevap="B"}
İş fonksiyonu $2\ \text{eV}$ olan bir metal yüzeyine $5\ \text{eV}$ enerjili fotonlar düşürülüyor. Sökülen elektronları durdurmak için gerekli durdurma potansiyeli kaç V'tur?

- A) 2
- B) 3
- C) 5
- D) 7
- E) 10

---

1. $K_{max}=hf-\phi=5-2=3\ \text{eV}$.
2. Durdurma potansiyeli $eV_0=K_{max}$ olduğundan $V_0=3\ \text{V}$. Doğru cevap B.

Diğer şıklar: **2** iş fonksiyonu yazılmış / **5** foton enerjisi yazılmış / **7** enerjiler toplanmış, $5+2$ / **10** foton enerjisi iki katı alınmış.
:::

:::soru{cevap="D"}
Bir parçacığın de Broglie dalga boyu $\lambda$'dır. Parçacığın hızı yarıya indirilirse (kütle ve ortam değişmeden) dalga boyu kaç $\lambda$ olur?

- A) $\dfrac{\lambda}{4}$
- B) $\dfrac{\lambda}{2}$
- C) $\lambda$
- D) $2\lambda$
- E) $4\lambda$

---

1. de Broglie dalga boyu $\lambda=\dfrac{h}{mv}$ olduğundan $\lambda\propto\dfrac1v$.
2. Hız yarıya inince dalga boyu iki katına çıkar: $2\lambda$. Doğru cevap D.

Diğer şıklar: **$\dfrac\lambda4$** dalga boyunun hızın karesiyle doğru orantılı olduğu sanılmış / **$\dfrac\lambda2$** doğru orantı sanılmış / **$\lambda$** dalga boyunun hıza bağlı olmadığı sanılmış / **$4\lambda$** dalga boyunun hızın karesiyle ters orantılı olduğu sanılmış.
:::

:::soru{cevap="D"}
Işık hızının $0{,}6$ katı ($v=0{,}6c$) hızla giden bir uzay aracındaki saat $8\ \text{s}$ ölçüyor. Yerdeki durağan bir gözlemci bu süreyi kaç s ölçer? ($\gamma=1{,}25$)

- A) $4{,}8$
- B) $6{,}4$
- C) 8
- D) 10
- E) $12{,}5$

---

1. Araçtaki saat öz zamanı ölçer: $\Delta t_0=8\ \text{s}$.
2. Yerdeki gözlemci için zaman genişler: $\Delta t=\gamma\,\Delta t_0=1{,}25\cdot8=10\ \text{s}$. Doğru cevap D.

Diğer şıklar: **4,8** $v=0{,}6c$ ile çarpılmış, $8\cdot0{,}6$ / **6,4** $\gamma$'ya bölünmüş, boy kısalması gibi hesaplanmış / **8** zamanın değişmediği sanılmış / **12,5** $\gamma^2$ ile çarpılmış, $8\cdot1{,}25^2$.
:::

:::soru{cevap="E"}
Bir metal yüzeyine, eşik frekansından büyük frekansta ve sabit frekanslı ışık düşürülüyor. Işığın **şiddeti artırılırsa** aşağıdakilerden hangisi gerçekleşir?

- A) Sökülen elektronların maksimum kinetik enerjisi artar.
- B) Metalin eşik frekansı artar.
- C) Sökülen elektron sayısı azalır.
- D) Durdurma potansiyeli artar.
- E) Sökülen elektron sayısı artar, maksimum kinetik enerji değişmez.

---

1. Işık şiddeti birim zamanda gelen foton sayısıdır. Foton sayısı artarsa sökülen elektron sayısı da artar.
2. Her foton aynı enerjiyi taşıdığından $K_{max}=hf-\phi$ değişmez, durdurma potansiyeli de değişmez. Doğru cevap E.

Diğer şıklar: **Maksimum kinetik enerji artar** şiddet frekansla karıştırılmış / **Eşik frekansı artar** eşik frekansı metale aittir / **Elektron sayısı azalır** şiddet artışı etkisiz sanılıp ters yorumlanmış / **Durdurma potansiyeli artar** kinetik enerjiye bağlı olduğu için değişmez.
:::

## Kendini dene

:::dene
1. Foton enerjisi hangi büyüklüklere bağlıdır? => Frekansa ve dalga boyuna ($E=hf$).
2. Eşik frekansının altında fotoelektrik olay olur mu? => Hayır.
3. Hız artarsa de Broglie dalga boyu nasıl değişir? => Azalır.
4. Özel göreliliğe göre ışık hızı gözlemciye göre değişir mi? => Hayır.
5. $E=mc^2$ neyi anlatır? => Kütle ile enerjinin eşdeğer olduğunu.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-fiz' and name = 'Modern Fizik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Telefonunun ekranı, kamerasının sensörü, otomatik kapıların gözü, hastanedeki MR ve röntgen cihazı, kasadaki barkod okuyucu, internetin fiber kablolarından gelen ışık ve evini aydınlatan LED lamba… Hepsinin ortak noktası, 20. yüzyılın fiziğine, yani **kuantum fiziğine ve atom-çekirdek bilgisine** dayanmasıdır. Önceki konularda fotonu, enerji düzeylerini, fotoelektrik olayı ve radyoaktiviteyi öğrendin. Bu konuda bu bilgilerin **yarı iletkenler, LED, lazer, güneş pili, optik fiber, görüntüleme teknikleri ve nükleer enerji** gibi teknolojilerde nasıl kullanıldığını göreceksin. Bu konuda hesaptan çok **kavram ve yorum** ağırlıktadır.

:::hedefler
1. Yarı iletken, diyot, transistör ve LED'in çalışma ilkesini açıklamak.
2. Güneş pili ve fotoselin fotoelektrik olayla ilişkisini yorumlamak.
3. Lazerin özelliklerini ve kullanım alanlarını bilmek.
4. Optik fiberin tam yansımayla çalıştığını açıklamak.
5. Tıbbi görüntüleme tekniklerini (X ışını, MR, ultrason, PET) ayırt etmek.
6. Fisyon ve füzyonu, nükleer reaktörün yapısını karşılaştırmak.
:::

:::ipucu
Bu konuda her teknolojiyi **hangi fizik olayına dayandığıyla** eşleştir: LED ve güneş pili için foton ve enerji düzeyi, lazer için uyarılmış ışıma, optik fiber için tam yansıma, nükleer reaktör için kütle-enerji eşdeğerliği. Soru çoğunlukla bu eşleştirmeyi ölçer.
:::

::video{id="IPDpooiWl_k" etiket="Konu anlatımı videosu" baslik="Modern Fiziğin Teknolojideki Uygulamaları" kanal="Fizikle Barış"}

## 1. Yarı iletkenler ve elektronik

**İletken, yalıtkan ve yarı iletken:** Katılarda enerji düzeyleri **bantlar** hâlinde bulunur. Yalıtkanda iletim bandı ile değerlik bandı arasındaki yasak aralık büyüktür, elektron geçemez. İletkende bantlar örtüşür. **Yarı iletkende** (silisyum, germanyum) yasak aralık küçüktür, ısı ya da ışık enerjisiyle elektron iletim bandına geçebilir.

**Katkılama:** Saf silisyuma az miktarda başka atom eklenir:

- **n tipi:** Fazladan serbest **elektron** (fosfor ekleyerek).
- **p tipi:** Fazladan **boşluk (oyuk)** (bor ekleyerek).

**Diyot (p-n eklemi):** p ve n tipi yarı iletkenin birleşimidir. Akımı **yalnızca bir yönde** (ileri beslemede) geçirir, ters yönde engeller. AC'yi DC'ye çevirmekte (doğrultucu) kullanılır.

**Transistör:** Üç uçlu elemandır. Küçük bir akımla büyük bir akımı kontrol eder, **anahtar ya da yükseltici** olarak çalışır. Bilgisayar işlemcilerinde milyarlarca transistör vardır.

**LED (ışık yayan diyot):** İleri beslemede n bölgesinden gelen elektron, p bölgesindeki oyukla birleşirken fazla enerjiyi **foton** olarak yayar. Fotonun rengi yarı iletkenin yasak aralığına bağlıdır. Akkor lambaya göre çok verimlidir, çünkü enerjiyi ısıya harcamaz.

## 2. Işığın elektrik üretimi ve algılanması

**Fotosel ve ışık sensörü:** Fotoelektrik olay prensibiyle ışık, akıma çevrilir. Otomatik kapılar, sokak lambalarının ışığa göre yanması, asansör ve alarm gözleri fotosel kullanır.

**Güneş pili (fotovoltaik):** p-n eklemine düşen foton, yasak aralığı aşacak enerjideyse elektron-oyuk çifti oluşturur. İç elektrik alanı bunları ayırır ve devreden akım geçer. Verimi sınırlıdır, çünkü fotonun enerjisi aralıktan küçükse soğurulmaz, büyükse fazlası ısıya gider.

**Dijital kamera (CCD, CMOS):** Her piksel bir ışık sensörüdür. Gelen foton sayısı elektrik yüküne çevrilir.

## 3. Lazer

**Lazer** (Light Amplification by Stimulated Emission of Radiation) **uyarılmış ışıma** ile ışığı kuvvetlendiren cihazdır. Uyarılmış bir atom, kendisini uyaran fotonla **aynı fazda, aynı yönde, aynı enerjide** yeni bir foton yayar.

**Lazer ışığının özellikleri:**

- **Tek renkli** (monokromatik): Tek dalga boyunda.
- **Eş fazlı** (koherent): Tüm fotonlar aynı fazda.
- **Paralel** ve ince demet: Çok az yayılır.
- **Yüksek yoğunluklu**: Enerji küçük bir alana toplanır.

**Kullanım alanları:** Barkod okuyucu, CD-DVD, lazer yazıcı, göz ameliyatı, kesme-kaynak, mesafe ölçme, lazer işaretleyici, haberleşme.

## 4. Optik fiber

Çok ince cam ya da plastik liflerdir. Işık, lifin içinde **tam yansıma** ile ilerler: Çekirdeğin kırılma indisi dış katmandan büyüktür ve ışık kritik açıdan büyük açıyla çarptığı için dışarı çıkmaz. Kayıplar çok azdır.

**Kullanım:** İnternet ve telefon haberleşmesi (milyonlarca ayrı sinyali ışık darbesi olarak taşır), tıpta endoskopi, dekoratif aydınlatma.

## 5. Tıbbi görüntüleme

| Yöntem | Temel ilke | Not |
| --- | --- | --- |
| X ışını (röntgen) | Yüksek enerjili elektromanyetik dalga, dokulara göre farklı soğurulur | Kemik gibi yoğun dokular net görünür, iyonlaştırıcıdır |
| BT (tomografi) | Farklı açılardan çekilen X ışını görüntülerinin birleştirilmesi | Kesit görüntü |
| MR (manyetik rezonans) | Güçlü manyetik alan ve radyo dalgası ile hidrojen çekirdeklerinin tepkisi | İyonlaştırıcı ışın yok, yumuşak doku net |
| Ultrason | Yüksek frekanslı ses dalgalarının yansıması | Gebelik izleme, iyonlaştırıcı değil |
| PET | Radyoaktif işaretli madde, pozitron-elektron yok olmasıyla gama fotonları | Metabolik aktiviteyi gösterir |

**Radyoterapi:** Kanser hücrelerine yüksek enerjili ışın (gama, X, hızlandırılmış parçacık) yöneltilir.

## 6. Nükleer enerji

**Fisyon (bölünme):** Ağır bir çekirdeğin (${}^{235}\text{U}$) nötron soğurup iki orta kütleli çekirdeğe bölünmesidir. Tepkimede kütle kusuru enerjiye ($E=\Delta m\,c^2$) dönüşür ve **birkaç nötron** açığa çıkar. Bu nötronlar başka çekirdekleri bölerse **zincir tepkime** oluşur.

**Nükleer reaktör:**

- **Yakıt çubukları:** Zenginleştirilmiş uranyum.
- **Yavaşlatıcı (moderatör):** Su ya da grafit, hızlı nötronları yavaşlatır.
- **Kontrol çubukları:** Bor ya da kadmiyum gibi **nötron soğuran** maddeler. Çubuklar aşağı indirilince nötron sayısı azalır ve tepkime yavaşlar ya da durur.
- **Soğutucu:** Isıyı taşır, buhar türbinini döndürür.

**Füzyon (birleşme):** Hafif çekirdeklerin (hidrojen izotopları) birleşip daha ağır çekirdek oluşturmasıdır. Güneş ve yıldızların enerji kaynağıdır. Çekirdekler pozitif yüklü olduğundan birbirini iter, bu yüzden **milyonlarca derece sıcaklık** gerekir. Füzyonun yakıtı bol, atığı az, ama kontrol altında yapılması çok zordur.

| | Fisyon | Füzyon |
| --- | --- | --- |
| Çekirdek | Ağır çekirdek bölünür | Hafif çekirdekler birleşir |
| Koşul | Nötron çarpması | Çok yüksek sıcaklık ve basınç |
| Atık | Radyoaktif atık | Çok az |
| Kullanım | Santraller | Güneş, araştırma reaktörleri |

## 7. Diğer teknolojiler

- **Süper iletkenlik:** Çok düşük sıcaklıkta bazı maddeler elektrik direncini tamamen kaybeder. MR cihazlarında ve manyetik havada kalan trenlerde güçlü mıknatıslar bu sayede elde edilir.
- **Nanoteknoloji:** $1$-$100\ \text{nm}$ ölçeğindeki yapılarla çalışılır. Bu boyutta kuantum etkileri baskındır. İlaç taşıma, güneş pilleri ve yeni malzemelerde kullanılır.
- **GPS:** Uydu saatleri, hızları ve yer çekimi nedeniyle özel ve genel görelilik düzeltmeleri gerektirir.

## 8. Sık yapılan hatalar

- Kontrol çubuklarının nötron **ürettiğini** sanmak. Soğururlar.
- Fisyon ile füzyonu karıştırmak. Fisyon ağır çekirdeği böler, füzyon hafifleri birleştirir.
- LED'in akkor lamba gibi telin kızması ile ışık verdiğini düşünmek.
- Lazerin yalnızca "güçlü ışık" olduğunu sanmak. Asıl özelliği eş fazlı ve tek renkli olmasıdır.

:::baglanti
Bu konu, **modern fizik** (foton, fotoelektrik, görelilik) ve **atom fiziği** (enerji düzeyleri, bozunma, bağlanma enerjisi) konularının uygulamasıdır. **Dalga mekaniğindeki** tam yansıma, optik fiberi, girişim ve eş fazlılık ise lazeri açıklar. **Manyetizma** konusundaki yüklü parçacık hareketi, MR ve parçacık hızlandırıcıları için temeldir. **Kimya** ve **biyolojide** nükleer tıp, radyoizotop işaretleme ve enerji kaynakları ile bağlanır.
:::

## 9. Konuyu toparla

| Teknoloji | Dayandığı olay |
| --- | --- |
| LED | Elektron-oyuk birleşmesiyle foton salınması |
| Güneş pili, fotosel | Fotoelektrik olay |
| Lazer | Uyarılmış ışıma |
| Optik fiber | Tam yansıma |
| MR | Manyetik alan ve radyo dalgası |
| Nükleer santral | Fisyon |
| Güneş | Füzyon |

## Mini test

:::soru{cevap="A"}
Işık yayan diyotun (LED) çalışma ilkesiyle ilgili aşağıdakilerden hangisi doğrudur?

- A) İleri beslemede elektron-oyuk birleşmesinde enerji foton olarak yayılır.
- B) Ters beslemede akım geçer ve telin kızarmasıyla ışık oluşur.
- C) Işık yalnızca dış ortamdan gelen fotonların yansımasıyla oluşur.
- D) Işığın rengi diyottan geçen akımın yönüne göre belirlenir.
- E) Işık, çekirdeğin bozunması sonucu yayılan gama ışınlarıdır.

---

1. LED, ileri yönde beslenen bir p-n eklemidir. n bölgesinden gelen elektronlar p bölgesindeki oyuklarla birleşir.
2. Birleşme sırasında fazla enerji foton olarak yayılır ve fotonun rengi yarı iletkenin yasak aralığına bağlıdır. Doğru cevap A.

Diğer şıklar: **B** akkor lambanın ilkesi LED'e uygulanmış / **C** LED kendi ışığını üretir / **D** renk yasak aralıkla belirlenir, akım yönüyle değil / **E** LED'de çekirdek olayı yoktur, elektronik geçiş vardır.
:::

:::soru{cevap="D"}
Lazer ışığı için aşağıdakilerden hangisi doğrudur?

- A) Farklı dalga boylarını bir arada içerir ve her yöne eşit yayılır.
- B) Fotonlarının fazları birbirinden bağımsızdır.
- C) Bir ampulün ışığıyla aynı yapıdadır, yalnızca daha parlaktır.
- D) Tek dalga boylu, eş fazlı ve paralel bir demet oluşturur.
- E) Yalnızca boşlukta yayılabilir ve maddeye enerji aktaramaz.

---

1. Lazerde uyarılmış ışıma ile yayılan fotonlar, uyaran fotonla aynı fazda, aynı yönde ve aynı enerjidedir.
2. Bu yüzden lazer tek renkli, eş fazlı ve paralel bir demettir. Doğru cevap D.

Diğer şıklar: **A** akkor lamba ışığının özelliği lazere verilmiş / **B** faz bağımsızlığı doğal ışık kaynaklarının özelliğidir / **C** doğal ışık ile lazer arasındaki temel farklar unutulmuş / **E** lazer maddeye enerji aktarır, kesme ve kaynakta kullanılır.
:::

:::soru{cevap="B"}
Füzyon tepkimeleriyle ilgili aşağıdakilerden hangisi doğrudur?

- A) Ağır bir çekirdek, nötron soğurarak daha küçük çekirdeklere bölünür.
- B) Hafif çekirdekler birleşir ve çok yüksek sıcaklık gerektirir.
- C) Günümüzdeki nükleer santrallerin tamamında kullanılır.
- D) Tepkimede kütle korunur, kütle kusuru oluşmaz.
- E) Zincir tepkime kontrol çubuklarıyla yönetilir.

---

1. Füzyonda hidrojen izotopları gibi hafif çekirdekler birleşip daha ağır çekirdek oluşturur.
2. Çekirdekler pozitif yüklü olduğundan birbirini iter. Bu itmeyi aşmak için milyonlarca derece sıcaklık gerekir. Doğru cevap B.

Diğer şıklar: **A** fisyonun tanımı verilmiş / **C** santraller fisyonla çalışır / **D** füzyonda da kütle kusuru enerjiye dönüşür / **E** kontrol çubukları fisyon reaktörlerinde kullanılır.
:::

:::soru{cevap="E"}
Bir nükleer reaktörde kontrol çubuklarının görevi aşağıdakilerden hangisidir?

- A) Yakıt olarak uranyum sağlayıp zincir tepkimeyi başlatmak.
- B) Nötronları hızlandırarak fisyon sayısını artırmak.
- C) Reaktörden ısıyı alıp buhar türbinine taşımak.
- D) Fisyonla açığa çıkan kütleyi artırarak enerji kazandırmak.
- E) Nötronları soğurarak zincir tepkimenin hızını kontrol etmek.

---

1. Fisyon zincir tepkimesi, açığa çıkan nötronların yeni çekirdekleri bölmesiyle sürer.
2. Kontrol çubukları bor ya da kadmiyum gibi nötron soğuran maddelerden yapılır. Çubuklar indirilince nötron sayısı azalır ve tepkime yavaşlar. Doğru cevap E.

Diğer şıklar: **A** yakıt çubuklarının görevi / **B** yavaşlatıcı nötronları hızlandırmaz, yavaşlatır / **C** soğutucunun görevi / **D** kütle kusuru enerjiye dönüşür, kütle artmaz.
:::

## Kendini dene

:::dene
1. Diyot akımı kaç yönde geçirir? => Yalnızca ileri yönde.
2. Optik fiberde ışık hangi olayla ilerler? => Tam yansıma.
3. Güneş pili hangi fizik olayına dayanır? => Fotoelektrik olaya.
4. Güneş'in enerji kaynağı fisyon mudur füzyon mu? => Füzyon.
5. MR cihazı iyonlaştırıcı ışın kullanır mı? => Hayır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-fiz' and name = 'Modern Fiziğin Teknolojideki Uygulamaları'
on conflict (topic_id) do nothing;

