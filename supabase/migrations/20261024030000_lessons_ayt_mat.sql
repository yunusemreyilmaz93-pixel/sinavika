-- 20261024030000_lessons_ayt_mat. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir otomatın makinesine 5 lira atıp 2 numaralı tuşa basarsan her seferinde aynı ürünü alırsın. Makine her girdiye **tek bir çıktı** verir. Fonksiyon tam olarak budur. TYT'de fonksiyonun tanımını, değer bulmayı ve basit bileşkeyi öğrendin. AYT'de bu temel, **fonksiyon çeşitleri, bileşke, ters fonksiyon, grafik dönüşümleri, tek ve çift fonksiyonlar, parçalı fonksiyonlar** ile genişler. Türev ve integralin dili de bu konudan çıkar, bu yüzden burada sağlam durman gerekir.

:::hedefler
1. Birebir, örten, içine, sabit ve birim fonksiyonları ayırt etmek.
2. Bileşke işlemini yapmak ve $f(g(x))$ ile $g(f(x))$ farkını bilmek.
3. Bir fonksiyonun tersini bulmak ve grafikteki anlamını yorumlamak.
4. Öteleme ve yansıma ile grafik dönüşümlerini uygulamak.
5. Tek ve çift fonksiyonları cebirsel olarak ayırt etmek.
6. Parçalı fonksiyonlarda doğru kolu seçerek değer hesaplamak.
:::

:::ipucu
Fonksiyon sorularında önce **tanım kümesini** ve **verilen aralığı** kontrol et. Parçalı fonksiyonda hangi kolun kullanılacağı, değerin hangi aralığa düştüğüne bağlıdır. Bileşkede içten dışa doğru git: önce içteki fonksiyonu uygula.
:::

::video{id="M-Bufmo1Bz8" etiket="Konu anlatımı videosu" baslik="Fonksiyonlar" kanal="Matematiğin Güler Yüzü"}

## 1. Fonksiyon çeşitleri

$A$ kümesinden $B$ kümesine tanımlı $f$ fonksiyonunda $A$'nın her elemanı $B$'de **tam bir** elemanla eşlenir. Çeşitler eşleşme biçimine göre ayrılır.

| Tür | Tanım | Nasıl anlarsın |
| --- | --- | --- |
| Birebir | Farklı elemanlar farklı elemanlara gider | $f(a)=f(b)$ ise $a=b$. Grafikte yatay doğru en fazla bir noktada keser |
| Örten | Değer kümesinin her elemanı kullanılır | Görüntü kümesi değer kümesine eşit |
| İçine | Örten değildir | Değer kümesinde boşta eleman var |
| Sabit | Hepsi aynı elemana gider | $f(x)=c$ |
| Birim | Her eleman kendisine gider | $f(x)=x$ |

**Eleman sayısı bilgisi:** $s(A)=m$, $s(B)=n$ olsun.

- Toplam fonksiyon sayısı: $n^m$
- Birebir fonksiyon sayısı ($m\le n$): $n(n-1)\cdots(n-m+1)$
- Birebir ve örten ise $m=n$ olur ve sayı $m!$ olur.

**Örnek:** $A=\{1,2,3\}$ ve $B=\{a,b,c,d\}$ için birebir fonksiyon sayısı $4\cdot3\cdot2=24$ olur.

:::ipucu{baslik="Sık yapılan hata"}
Bir fonksiyonun örten olup olmadığı **değer kümesine** bağlıdır. $f:\mathbb{R}\to\mathbb{R}$, $f(x)=x^2$ içine fonksiyondur. Aynı kural $f:\mathbb{R}\to[0,\infty)$ olarak yazılırsa örten olur. Önce kümelere bak.
:::

## 2. Bileşke fonksiyon

$f$ ve $g$ için **bileşke** $(f\circ g)(x)=f(g(x))$ biçiminde tanımlanır. Önce $g$ uygulanır, çıkan değere $f$ uygulanır.

::sim{tur="fonksiyon"}

**Özellikler:**

- $f\circ g \neq g\circ f$ olabilir. Bileşke genelde değişmeli değildir.
- $(f\circ g)\circ h = f\circ(g\circ h)$. Birleşme özelliği vardır.
- $f\circ I = I\circ f = f$. Birim fonksiyon bileşkede etkisizdir.

**Örnek:** $f(x)=2x+3$ ve $g(x)=x^2-1$ ise

- $(f\circ g)(x)=2(x^2-1)+3=2x^2+1$
- $(g\circ f)(x)=(2x+3)^2-1=4x^2+12x+8$

**Bileşkeden fonksiyon bulma:** $g(x)=x+4$ ve $(f\circ g)(x)=3x+2$ ise $f$'yi bulmak için $x+4=t$ yaz, $x=t-4$ olur. $f(t)=3(t-4)+2=3t-10$. Yani $f(x)=3x-10$.

## 3. Ters fonksiyon

$f$ **birebir ve örten** ise tersi vardır. $f^{-1}$ şu özelliği sağlar:

$$f(a)=b \iff f^{-1}(b)=a$$

**Ters bulma yöntemi:**

1. $y=f(x)$ yaz.
2. $x$'i $y$ cinsinden çek.
3. $x$ ile $y$'nin yerini değiştir.

**Örnek:** $f(x)=\dfrac{3x+1}{x-2}$ olsun. $y(x-2)=3x+1$ olur, $xy-2y=3x+1$, $x(y-3)=2y+1$ ve $x=\dfrac{2y+1}{y-3}$. Yani $f^{-1}(x)=\dfrac{2x+1}{x-3}$.

**Önemli özellikler:**

- $(f^{-1})^{-1}=f$
- $(f\circ f^{-1})(x)=(f^{-1}\circ f)(x)=x$
- $(f\circ g)^{-1}=g^{-1}\circ f^{-1}$. Sıra **tersine** döner.
- $f$ ile $f^{-1}$ grafikleri $y=x$ doğrusuna göre **simetriktir**.
- Doğrusal $f(x)=ax+b$ için $f^{-1}(x)=\dfrac{x-b}{a}$.

![Bir fonksiyon ile tersinin grafikleri y = x doğrusuna göre simetrik](/lessons/ayt-mat/ters-fonksiyon.svg "Fonksiyon ve tersi")

## 4. Grafik dönüşümleri

$y=f(x)$ grafiğine uygulanan temel dönüşümler:

| Dönüşüm | Yeni fonksiyon | Etkisi |
| --- | --- | --- |
| Sağa $a$ öteleme | $f(x-a)$ | $x$ yönünde $a$ birim sağa |
| Sola $a$ öteleme | $f(x+a)$ | $a$ birim sola |
| Yukarı $b$ öteleme | $f(x)+b$ | $b$ birim yukarı |
| Aşağı $b$ öteleme | $f(x)-b$ | $b$ birim aşağı |
| $x$ eksenine göre yansıma | $-f(x)$ | Grafik yatay eksene göre döner |
| $y$ eksenine göre yansıma | $f(-x)$ | Grafik dikey eksene göre döner |
| Mutlak değer (değer) | $\lvert f(x)\rvert$ | $x$ ekseninin altı yukarı katlanır |
| Mutlak değer ($x$) | $f(\lvert x\rvert)$ | $y$ eksenin sağı sola yansıtılır |

**Hatırlatma:** $x$'in içine yazılan işlem **tersine** çalışır. $f(x-2)$ sağa gider, $f(x+2)$ sola gider. $x$'in dışına yazılan işlem düz çalışır.

## 5. Tek ve çift fonksiyonlar

- **Çift fonksiyon:** $f(-x)=f(x)$. Grafiği $y$ eksenine göre simetriktir. Örnek: $x^2$, $x^4$, $\lvert x\rvert$, $\cos x$.
- **Tek fonksiyon:** $f(-x)=-f(x)$. Grafiği orijine göre simetriktir. Örnek: $x$, $x^3$, $\sin x$.

**Ayırt etme yöntemi (polinom):** Yalnızca **çift kuvvet** varsa çift, yalnızca **tek kuvvet** varsa tek fonksiyondur. İkisi karışıksa (sabit terim çift kuvvet sayılır) ne tek ne çift olur.

**Toplam ve çarpım kuralları:** Çift ile çiftin çarpımı çift, tek ile tekin çarpımı çift, tek ile çiftin çarpımı tektir. İki tek fonksiyonun toplamı tektir.

**Önemli sonuç:** $f$ tek ve $x=0$'da tanımlıysa $f(0)=0$ olur.

## 6. Parçalı fonksiyonlar

Farklı aralıklarda farklı kurallarla tanımlanan fonksiyonlara **parçalı fonksiyon** denir.

$$f(x)=\begin{cases}2x-1 & x<2\\ x^2-3 & x\ge 2\end{cases}$$

**Değer bulma:** Önce $x$ değerinin hangi aralığa düştüğüne bak, sonra o kolu uygula. $f(0)=2\cdot0-1=-1$ ve $f(3)=3^2-3=6$.

**Bileşke işlemlerinde** önce içteki değeri bul, çıkan sonucun hangi aralığa düştüğünü yeniden kontrol et: $f(f(3))=f(6)=6^2-3=33$.

:::baglanti
Fonksiyonların grafik dönüşümleri, **parabol** ve **trigonometri** konularında grafik çizerken kullanılır. Ters fonksiyon **logaritma** (üstel fonksiyonun tersi) ve **trigonometri** (arcsin) için zemin hazırlar. Bileşke bilgisi **türevde zincir kuralı** için gereklidir. Parçalı fonksiyonlar **limit ve süreklilik** konusunun ana malzemesidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Birebir ve örten | Eşleşme bire bir ve değer kümesi tamamen dolu |
| Fonksiyon sayısı | $n^m$, birebir olanlar $n(n-1)\cdots$ |
| Bileşke | $f(g(x))$ için önce $g$ |
| Ters fonksiyon | $f(a)=b \iff f^{-1}(b)=a$, grafikte $y=x$'e simetri |
| $(f\circ g)^{-1}$ | $g^{-1}\circ f^{-1}$ |
| Öteleme | $f(x-a)$ sağa, $f(x)+b$ yukarı |
| Çift fonksiyon | $f(-x)=f(x)$ |
| Tek fonksiyon | $f(-x)=-f(x)$ |
| Parçalı fonksiyon | Aralığa bak, kolu seç |

## Mini test

:::soru{cevap="E"}
$f(x)=2x+3$ ve $g(x)=x^2-1$ olduğuna göre $(g\circ f)(1)$ değeri kaçtır?

- A) 0
- B) 3
- C) 5
- D) 12
- E) 24

---

1. $(g\circ f)(1)=g(f(1))$ olduğundan önce $f(1)$ hesaplanır: $f(1)=2\cdot1+3=5$.
2. $g(5)=5^2-1=24$. Doğru cevap E.

Diğer şıklar: **0** $f(1)\cdot g(1)$ alınmış, $g(1)=0$ olduğundan sonuç sıfır çıkmış / **3** sıra ters alınmış, $(f\circ g)(1)=f(0)=3$ / **5** $f(1)$ ile durulmuş ya da $f(1)+g(1)$ hesaplanmış / **12** $(2x+3)^2$ yerine $4x^2+9$ açılmış, $4+9-1=12$.
:::

:::soru{cevap="D"}
$g(x)=x+4$ ve $(f\circ g)(x)=3x+2$ olduğuna göre $f(x)$ aşağıdakilerden hangisidir?

- A) $3x-14$
- B) $3x+2$
- C) $3x+6$
- D) $3x-10$
- E) $3x+14$

---

1. $g(x)=x+4=t$ denirse $x=t-4$ olur.
2. $f(t)=3(t-4)+2=3t-12+2=3t-10$. Doğru cevap D.

Diğer şıklar: **$3x-14$** $+2$ eksiye çevrilmiş / **$3x+2$** $g$ yok sayılmış / **$3x+6$** $+4$ eklenmiş / **$3x+14$** $x$ yerine $t+4$ yazılmış.
:::

:::soru{cevap="A"}
Aşağıdaki fonksiyonlardan hangisi **çift** fonksiyondur?

- A) $f(x)=x^4-3x^2+1$
- B) $f(x)=x^3+x$
- C) $f(x)=x^2+x$
- D) $f(x)=\lvert x\rvert+x$
- E) $f(x)=x^3-x^2$

---

1. Çift fonksiyonda $f(-x)=f(x)$ olmalıdır.
2. $f(x)=x^4-3x^2+1$ için yalnızca çift kuvvetler ve sabit terim vardır. $f(-x)=x^4-3x^2+1=f(x)$ olur. Doğru cevap A.

Diğer şıklar: **$x^3+x$** tek kuvvetlerden oluştuğu için tek fonksiyon / **$x^2+x$** çift ve tek kuvvet karışık, ne tek ne çift / **$\lvert x\rvert+x$** $f(-x)=\lvert x\rvert-x$ olduğundan ne tek ne çift / **$x^3-x^2$** karışık kuvvet, ne tek ne çift.
:::

:::soru{cevap="C"}
$$f(x)=\begin{cases}2x-1 & x<2\\ x^2-3 & x\ge 2\end{cases}$$

fonksiyonuna göre $f(f(3))+f(0)$ toplamı kaçtır?

- A) 21
- B) 30
- C) 32
- D) 33
- E) 34

---

1. $3\ge2$ olduğundan $f(3)=3^2-3=6$.
2. $6\ge 2$ olduğundan $f(f(3))=f(6)=6^2-3=33$.
3. $0<2$ olduğundan $f(0)=2\cdot0-1=-1$.
4. Toplam $33+(-1)=32$. Doğru cevap C.

Diğer şıklar: **21** $f(3)$ için ilk kol kullanılmış, $f(3)=5$, $f(5)=22$, $22-1=21$ / **30** $f(0)$ ikinci kolla hesaplanmış, $0-3=-3$ ve $33-3=30$ / **33** $f(0)$ toplanmamış / **34** $f(0)=-1$ çıkarılmış, $33+1=34$.
:::

## Kendini dene

:::dene
1. $f(x)=3x-6$ ise $f^{-1}(x)$ nedir? => $f^{-1}(x)=\dfrac{x+6}{3}$.
2. $A=\{1,2\}$ ve $B=\{a,b,c\}$ için kaç fonksiyon tanımlanabilir? => $3^2=9$.
3. $f(x)=x^3$ tek mi çift midir? => $f(-x)=-x^3=-f(x)$ olduğu için tektir.
4. $f(x)$ grafiğini 2 birim sağa kaydırınca yeni fonksiyon nedir? => $f(x-2)$.
5. $f(x)=2x+1$ ise $(f\circ f)(x)$ nedir? => $2(2x+1)+1=4x+3$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, true from public.topics where subject_id = 'ayt-mat' and name = 'Fonksiyonlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir marangoz masa yaparken ayak, tabla ve çerçeve parçalarını ayrı ayrı hazırlar, sonra birleştirir. Polinomlar da $x$'li terimlerin **toplanıp çarpılarak birleştiği** ifadelerdir. Fonksiyonların, denklemlerin, parabolün ve türevin hepsi polinomlarla çalışır. Bu konuda polinomun derecesini, katsayılarını, bölme işlemini, **kalan teoremini** ve çarpanlara ayırmayı öğreneceksin. AYT'de her yıl bu konudan en az bir soru gelir. Kalan bulma soruları çoğunlukla uzun bölme yapmadan, tek bir değer yazarak çözülür.

:::hedefler
1. Polinomun derecesini, baş katsayısını ve sabit terimini belirlemek.
2. Katsayılar toplamını ve sabit terimi $P(1)$ ve $P(0)$ ile bulmak.
3. Polinomlarda toplama, çıkarma ve çarpma yapmak.
4. Bölme algoritmasını kullanmak ve kalanı bulmak.
5. Kalan teoremi ile uzun bölme yapmadan kalan bulmak.
6. Çarpan teoremi ile çarpanlara ayırmak.
:::

:::ipucu
Polinom sorularında **iki kısa yolu** hiç unutma: katsayılar toplamı için $x=1$, sabit terim için $x=0$ yaz. Sorunun yarısı bu iki değerle çözülür.
:::

::video{id="BsTDHd4AnIg" etiket="Konu anlatımı videosu" baslik="Polinomlar" kanal="Rehber Matematik"}

## 1. Temel kavramlar

$P(x)=a_nx^n+a_{n-1}x^{n-1}+\dots+a_1x+a_0$ biçimindeki ifadeye **polinom** denir. Burada üsler **doğal sayıdır**, katsayılar gerçek sayıdır.

- **Derece:** $x$'in en büyük üssü. $\text{der}[P(x)]=n$.
- **Baş katsayı:** En büyük dereceli terimin katsayısı, $a_n$.
- **Sabit terim:** $x$'siz terim, $P(0)=a_0$.
- **Katsayılar toplamı:** $P(1)$.
- **Çift dereceli terimlerin katsayıları toplamı:** $\dfrac{P(1)+P(-1)}{2}$.
- **Tek dereceli terimlerin katsayıları toplamı:** $\dfrac{P(1)-P(-1)}{2}$.

**Polinom olmayan ifadeler:** $\sqrt{x}$, $\dfrac{1}{x}$, $x^{-2}$ gibi üssü doğal sayı olmayan ifadeler polinom değildir.

**Örnek:** $P(x)=(2x-1)^3(x+1)^2$ için katsayılar toplamı $P(1)=1^3\cdot2^2=4$ olur. Sabit terim $P(0)=(-1)^3\cdot1=-1$. Derece $3+2=5$.

## 2. Polinomlarda işlemler

**Toplama ve çıkarma:** Aynı dereceli terimler toplanır. Sonucun derecesi en fazla büyük olan derecedir. Baş katsayılar birbirini götürürse derece düşebilir.

**Çarpma:** Her terim her terimle çarpılır. Çarpımın derecesi dereceler toplamıdır: $\text{der}(P\cdot Q)=\text{der}P+\text{der}Q$.

**Bileşke:** $\text{der}[P(Q(x))]=\text{der}P\cdot\text{der}Q$.

**Derece kuralları özeti:**

| İşlem | Derece |
| --- | --- |
| $P+Q$ | $\le \max(\text{der}P,\text{der}Q)$ |
| $P\cdot Q$ | $\text{der}P+\text{der}Q$ |
| $P(Q(x))$ | $\text{der}P\cdot\text{der}Q$ |
| $P^k$ | $k\cdot\text{der}P$ |

**Yerine koyma soruları:** $P(2x-1)=x^2+3x+5$ gibi verilirse, $P(a)$ için önce $2x-1=a$ denklemini çöz. $P(5)$ için $2x-1=5$ ve $x=3$ olur. Cevap $9+9+5=23$.

## 3. Bölme algoritması

$P(x)$ polinomu $B(x)$ ile bölünürse

$$P(x)=B(x)\cdot Q(x)+K(x)$$

yazılır. $Q(x)$ **bölüm**, $K(x)$ **kalan** polinomdur. Kalanın derecesi bölenin derecesinden **küçüktür**. Kalan sıfırsa $P(x)$, $B(x)$ ile **tam bölünür**.

**Derece ilişkileri:**

- $\text{der}Q=\text{der}P-\text{der}B$
- $\text{der}K<\text{der}B$

**Kalanın biçimi:** Bölen birinci dereceden ise kalan **sabittir**. Bölen ikinci dereceden ise kalan en fazla birinci derecedir, $K(x)=ax+b$.

## 4. Kalan teoremi

$P(x)$ polinomunun $(x-a)$ ile bölümünden kalan $P(a)$'dır.

**Neden?** $P(x)=(x-a)Q(x)+k$ yazılır. $x=a$ koyarsan $P(a)=k$ olur.

**Örnek:** $P(x)=x^3-2x^2+ax+6$ ve $(x-2)$ ile bölümünden kalan 4 ise $P(2)=8-8+2a+6=4$ olur. $2a=-2$ ve $a=-1$.

**Genel biçim:** $(ax+b)$ ile bölümünden kalan $P\!\left(-\dfrac{b}{a}\right)$.

**İkinci dereceden bölen:** $P(x)$ polinomunun $(x-1)(x+2)$ ile bölümünden kalan $K(x)=ax+b$ olsun. Kalanın biçimi yazılır ve iki bilinen değerden $a$ ile $b$ bulunur.

**Örnek:** $P(1)=5$ ve $P(-2)=-1$ olsun. $K(1)=a+b=5$ ve $K(-2)=-2a+b=-1$. Taraf tarafa çıkarırsan $3a=6$, $a=2$, $b=3$ olur. Kalan $2x+3$'tür.

## 5. Çarpan teoremi ve çarpanlara ayırma

$P(a)=0$ ise $(x-a)$ polinomun **çarpanıdır**. Tersi de doğrudur.

**Rasyonel kök testi:** Tam katsayılı polinomda $\dfrac{p}{q}$ kök ise $p$ sabit terimi, $q$ baş katsayıyı böler. Aday kökleri bu yolla listeleyip $P(a)=0$ kontrolü yaparsın.

**Örnek:** $P(x)=x^3-3x^2+ax+6$ polinomunun $(x-1)$ çarpanı olması için $P(1)=1-3+a+6=0$ gerekir. $a+4=0$ ve $a=-4$.

**Ortak çarpan ve özdeşlikler:** $a^2-b^2=(a-b)(a+b)$, $a^3\pm b^3=(a\pm b)(a^2\mp ab+b^2)$, $a^2+2ab+b^2=(a+b)^2$.

**Kökler toplamı ve çarpımı (iki kök için):** $ax^2+bx+c=0$ için $x_1+x_2=-\dfrac{b}{a}$ ve $x_1x_2=\dfrac{c}{a}$.

:::baglanti
Çarpan teoremi, **ikinci dereceden denklemler**, **parabol** ve **eşitsizlikler** konularında kökleri bulmanın temel aracıdır. Kalan teoremi **fonksiyonların bileşkesi** ve **trigonometri** denklemlerinde de ipucu verir. Türevde polinomların türevini alma kuralı bu konuya dayanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Katsayılar toplamı | $P(1)$ |
| Sabit terim | $P(0)$ |
| Bölme | $P=B\cdot Q+K$, $\text{der}K<\text{der}B$ |
| Kalan teoremi | $(x-a)$ ile kalan $P(a)$ |
| Çarpan teoremi | $P(a)=0 \iff (x-a)$ çarpan |
| Çarpımın derecesi | Dereceler toplanır |
| Bileşkenin derecesi | Dereceler çarpılır |
| İkinci derece bölen | Kalan $ax+b$ |

## Mini test

:::soru{cevap="D"}
$P(x)=(2x-1)^3(x+1)^2$ polinomunun **katsayılar toplamı** kaçtır?

- A) $-1$
- B) 0
- C) 2
- D) 4
- E) 5

---

1. Katsayılar toplamı $P(1)$'dir.
2. $P(1)=(2\cdot1-1)^3(1+1)^2=1\cdot4=4$. Doğru cevap D.

Diğer şıklar: **$-1$** sabit terim $P(0)$ bulunmuş / **0** $P(-1)$ hesaplanmış, $(x+1)$ çarpanı sıfırlanmış / **2** $(x+1)^2$ yerine $(x+1)$ alınmış, kare unutulmuş / **5** polinomun derecesi bulunmuş.
:::

:::soru{cevap="B"}
$P(x)$ polinomunun $(x-1)$ ile bölümünden kalan 5, $(x+2)$ ile bölümünden kalan $-1$ olduğuna göre $P(x)$ polinomunun $(x-1)(x+2)$ ile bölümünden kalan aşağıdakilerden hangisidir?

- A) $x+4$
- B) $2x+3$
- C) $3x+2$
- D) $2x-3$
- E) $5x-1$

---

1. Bölen ikinci dereceden olduğundan kalan $K(x)=ax+b$ biçimindedir.
2. $P(1)=5$ olduğundan $a+b=5$. $P(-2)=-1$ olduğundan $-2a+b=-1$.
3. Taraf tarafa çıkarırsan $3a=6$, $a=2$ ve $b=3$ olur. Kalan $2x+3$. Doğru cevap B.

Diğer şıklar: **$x+4$** yalnızca birinci koşulu sağlıyor, ikinci koşul kontrol edilmemiş / **$3x+2$** $a$ ile $b$ yer değiştirmiş / **$2x-3$** $b$'nin işareti yanlış bulunmuş / **$5x-1$** kalanlar doğrudan katsayı sanılmış.
:::

:::soru{cevap="A"}
$P(x)=x^3-3x^2+ax+6$ polinomu $(x-1)$ ile tam bölünüyorsa $a$ kaçtır?

- A) $-4$
- B) $-1$
- C) 2
- D) 4
- E) 6

---

1. Tam bölünme, kalanın sıfır olması demektir. $P(1)=0$ olmalıdır.
2. $P(1)=1-3+a+6=a+4=0$ ve $a=-4$. Doğru cevap A.

Diğer şıklar: **$-1$** $x-2$ çarpan sanılarak $P(2)=0$ çözülmüş / **2** $P(-1)=0$ denenmiş, $-1-3-a+6=0$ ve $a=2$ / **4** $a+4=0$ çözülürken işaret hatası yapılmış / **6** sabit terim $a$ yerine yazılmış.
:::

:::soru{cevap="E"}
$P(x-1)=x^2+3x+5$ olduğuna göre $P(5)$ kaçtır?

- A) 5
- B) 9
- C) 33
- D) 45
- E) 59

---

1. $P(5)$ için $x-1=5$ olmalıdır, yani $x=6$.
2. $P(5)=6^2+3\cdot6+5=36+18+5=59$. Doğru cevap E.

Diğer şıklar: **5** $x=0$ yazılmış, sabit terim bulunmuş / **9** $x=1$ yazılmış / **33** $x-1=5$ yerine $x=4$ alınmış / **45** $P(5)$ için $x=5$ doğrudan yazılmış.
:::

## Kendini dene

:::dene
1. $P(x)=3x^4-2x+7$ polinomunun derecesi ve sabit terimi nedir? => Derece 4, sabit terim 7.
2. $P(x)$ polinomunun $(x-3)$ ile bölümünden kalan nasıl bulunur? => $P(3)$ hesaplanır.
3. $\text{der}P=3$ ve $\text{der}Q=2$ ise $\text{der}(P\cdot Q)$ kaçtır? => 5.
4. $P(x)=(x-1)^2(x+2)$ için katsayılar toplamı kaçtır? => $P(1)=0$.
5. $(x-2)$ bir polinomun çarpanı ise $P(2)$ kaçtır? => 0.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-mat' and name = 'Polinomlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir top havaya atıldığında ne zaman yere düşeceğini, bir bahçenin kenarlarını alanından bulmayı ya da bir ürünün kâr-zarar dengesini hesaplamayı düşün. Bu soruların çoğu $ax^2+bx+c=0$ biçiminde bir denkleme çıkar. Bu konuda ikinci dereceden denklemin **köklerini**, **diskriminantı**, **köklerin toplamı ve çarpımı** bağıntılarını, kökleri verilen denklemi kurmayı ve karmaşık sayılara giriş kısmını öğreneceksin. AYT'de bu bağıntılar çok kısa çözüm yolları sunar. Kökleri tek tek bulmadan sonuca gidebilirsin.

:::hedefler
1. $ax^2+bx+c=0$ denkleminin köklerini çarpanlara ayırma ve formülle bulmak.
2. Diskriminant ile kök sayısını yorumlamak.
3. Köklerin toplamı ve çarpımı bağıntılarını kullanmak.
4. Kökleri verilen ya da kökleri dönüştürülen denklemi yazmak.
5. $i^2=-1$ ile karmaşık kökleri tanımak.
:::

:::ipucu
İkinci dereceden denklemlerde önce **çarpanlara ayırmayı** dene. Olmuyorsa diskriminanta geç. Soru "köklerin toplamı", "köklerin karesi" gibi bir ifade istiyorsa kökleri bulmak yerine $x_1+x_2$ ve $x_1x_2$ ile çalış.
:::

::video{id="8i8n1vVH3zo" etiket="Konu anlatımı videosu" baslik="İkinci Dereceden Denklemler" kanal="Matematiğin Güler Yüzü"}

## 1. Denklemin kökleri

$a\neq0$ olmak üzere $ax^2+bx+c=0$ denklemine **ikinci dereceden denklem** denir.

**Çözüm yöntemleri:**

- **Çarpanlara ayırma:** $x^2-5x+6=(x-2)(x-3)=0$ ise $x=2$ ya da $x=3$.
- **Tam kareye tamamlama:** $x^2+6x+5=(x+3)^2-4=0$ ise $x+3=\pm2$.
- **Formül:** $x_{1,2}=\dfrac{-b\pm\sqrt{\Delta}}{2a}$, $\Delta=b^2-4ac$.

## 2. Diskriminant ve kök sayısı

| Durum | Kök sayısı | Anlamı |
| --- | --- | --- |
| $\Delta>0$ | 2 farklı gerçek kök | Parabol $x$ eksenini iki noktada keser |
| $\Delta=0$ | Çakışık (çift katlı) kök | Parabol $x$ eksenine teğet |
| $\Delta<0$ | Gerçek kök yok | Parabol $x$ eksenini kesmez |

::sim{tur="parabol"}

**Örnek:** $x^2-6x+k=0$ denkleminin çift katlı kökü varsa $\Delta=36-4k=0$ olur ve $k=9$. Denklem $(x-3)^2=0$ olur.

**$b$ çift ise kısa formül:** $b=2b'$ için $\Delta'=b'^2-ac$ ve $x=\dfrac{-b'\pm\sqrt{\Delta'}}{a}$.

## 3. Köklerin toplamı ve çarpımı

$ax^2+bx+c=0$ denkleminin kökleri $x_1$ ve $x_2$ olsun.

$$x_1+x_2=-\dfrac{b}{a},\qquad x_1\cdot x_2=\dfrac{c}{a}$$

**Sık kullanılan ifadeler:**

| İstenen | Bağıntı |
| --- | --- |
| $x_1^2+x_2^2$ | $(x_1+x_2)^2-2x_1x_2$ |
| $(x_1-x_2)^2$ | $(x_1+x_2)^2-4x_1x_2$ |
| $\dfrac{1}{x_1}+\dfrac{1}{x_2}$ | $\dfrac{x_1+x_2}{x_1x_2}$ |
| $x_1^3+x_2^3$ | $(x_1+x_2)^3-3x_1x_2(x_1+x_2)$ |

**Örnek:** $x^2-3x-5=0$ için $x_1+x_2=3$ ve $x_1x_2=-5$. $(x_1-x_2)^2=9-4(-5)=29$.

**Köklerin işareti:** $x_1x_2>0$ ise kökler aynı işaretlidir. $x_1x_2<0$ ise zıt işaretlidir. Aynı işaretliyken $x_1+x_2>0$ ise ikisi de pozitiftir.

## 4. Kökleri verilen denklemi yazma

Kökleri $x_1$ ve $x_2$ olan denklem:

$$x^2-(x_1+x_2)x+x_1x_2=0$$

**Kökleri dönüştürülen denklem:** Yeni kökler $y=x+k$ ise eski kök $x=y-k$ yazılır.

**Örnek:** $x^2-5x+3=0$ denkleminin köklerinin **2 fazlasını** kök kabul eden denklem istenirse $y=x+2$ ve $x=y-2$.

$$(y-2)^2-5(y-2)+3=y^2-9y+17=0$$

Kontrol: yeni toplam $5+4=9$, yeni çarpım $3+2\cdot5+4=17$.

## 5. Karmaşık sayılara giriş

$\Delta<0$ iken gerçek kök yoktur ama **karmaşık kök** vardır. $i^2=-1$ tanımıyla $\sqrt{-4}=2i$ olur.

- $x^2+4=0$ ise $x=\pm2i$.
- Karmaşık sayı $z=a+bi$ biçimindedir. $a$ gerçek, $b$ sanal kısımdır.
- Kökler karmaşıksa **birbirinin eşleniğidir**: $x=\dfrac{-b\pm i\sqrt{-\Delta}}{2a}$.
- $i$'nin kuvvetleri 4'lü döngüdür: $i^1=i$, $i^2=-1$, $i^3=-i$, $i^4=1$. Üssü 4'e bölünce kalanı kullanırsın.

**Örnek:** $i^{27}$ için $27=4\cdot6+3$ ve $i^{27}=i^3=-i$.

## 6. Parametreli sorular

**Gerçek kök yok:** $\Delta<0$ koşulu bir eşitsizliğe dönüşür. $x^2+mx+m+3=0$ için $\Delta=m^2-4m-12=(m-6)(m+2)<0$ olur, yani $-2<m<6$.

**Kökler pozitif olsun:** $\Delta\ge0$, $x_1+x_2>0$, $x_1x_2>0$ koşullarının üçü birden sağlanır.

**Bir kök verilmişse:** Kökü denkleme yaz, parametreyi bul. Sonra diğer kökü Vieta ile bul.

:::baglanti
$\Delta$ ve kök sayısı mantığı **parabol** konusunda grafiğin $x$ eksenini kesmesine dönüşür. Eşitsizliklerde kökler işaret tablosunun sınırlarını verir. Karmaşık sayılar ve $i$'nin kuvvetleri, **trigonometri** ve **polinomlar** konusunda kök aramada da çıkar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $\Delta$ | $b^2-4ac$ |
| $\Delta>0$ | İki farklı gerçek kök |
| $\Delta=0$ | Çift katlı kök |
| $\Delta<0$ | Gerçek kök yok |
| Toplam ve çarpım | $-\dfrac{b}{a}$ ve $\dfrac{c}{a}$ |
| Kök kurma | $x^2-(\text{toplam})x+\text{çarpım}=0$ |
| $i$'nin kuvveti | 4'e bölümden kalana bak |

## Mini test

:::soru{cevap="C"}
$x^2-6x+k=0$ denkleminin **çakışık iki gerçek kökü** olduğuna göre $k$ kaçtır?

- A) 3
- B) 6
- C) 9
- D) 12
- E) 36

---

1. Çakışık kök için $\Delta=0$ olmalıdır.
2. $\Delta=(-6)^2-4\cdot1\cdot k=36-4k=0$ ve $k=9$. Doğru cevap C.

Diğer şıklar: **3** $\Delta=0$ yerine $b/2=3$ alınmış / **6** $b$'nin mutlak değeri $k$ sanılmış / **12** $4k=36$ yerine $3k=36$ çözülmüş / **36** $\Delta$ yerine yalnızca $b^2$ alınmış.
:::

:::soru{cevap="D"}
$x^2-3x-5=0$ denkleminin kökleri $x_1$ ve $x_2$ olduğuna göre $(x_1-x_2)^2$ kaçtır?

- A) 4
- B) 14
- C) 19
- D) 29
- E) 34

---

1. $x_1+x_2=3$ ve $x_1x_2=-5$.
2. $(x_1-x_2)^2=(x_1+x_2)^2-4x_1x_2=9-4(-5)=29$. Doğru cevap D.

Diğer şıklar: **4** $9+5$ yerine $9-5$ yapılmış / **14** çarpımın işareti dikkate alınmamış, $9+5$ bulunmuş / **19** $x_1^2+x_2^2=9+10$ hesaplanmış / **34** $9+25$ alınmış, çarpım karesi toplanmış.
:::

:::soru{cevap="E"}
$x^2-5x+3=0$ denkleminin köklerinin **2 fazlasını** kök kabul eden ikinci dereceden denklem aşağıdakilerden hangisidir?

- A) $x^2-x-3=0$
- B) $x^2-7x+17=0$
- C) $x^2-9x+3=0$
- D) $x^2-9x+13=0$
- E) $x^2-9x+17=0$

---

1. Yeni kökler $y=x+2$ olduğundan $x=y-2$ yazılır.
2. $(y-2)^2-5(y-2)+3=y^2-4y+4-5y+10+3=y^2-9y+17$. Doğru cevap E.

Diğer şıklar: **$x^2-x-3$** köklerin 2 eksiği alınmış / **$x^2-7x+17$** toplam 5'e yalnızca 2 eklenmiş / **$x^2-9x+3$** çarpım değişmemiş sanılmış / **$x^2-9x+13$** $(x_1+2)(x_2+2)$ açılırken $4$ unutulmuş, $3+10=13$.
:::

:::soru{cevap="A"}
$x^2+mx+m+3=0$ denkleminin **gerçek kökü bulunmadığına** göre $m$ hangi aralıktadır?

- A) $-2<m<6$
- B) $m<-2$ veya $m>6$
- C) $-6<m<2$
- D) $m<-6$ veya $m>2$
- E) $2<m<6$

---

1. Gerçek kök yoksa $\Delta<0$.
2. $\Delta=m^2-4(m+3)=m^2-4m-12=(m-6)(m+2)<0$.
3. Çarpım negatif olduğundan $m$ iki kökün arasındadır: $-2<m<6$. Doğru cevap A.

Diğer şıklar: **$m<-2$ veya $m>6$** $\Delta>0$ çözülmüş / **$-6<m<2$** kökler işaretçe ters alınmış / **$m<-6$ veya $m>2$** hem işaret hem eşitsizlik yönü yanlış / **$2<m<6$** yalnızca bir kökün işareti düzeltilmiş.
:::

## Kendini dene

:::dene
1. $x^2-7x+12=0$ denkleminin kökleri nedir? => 3 ve 4.
2. $x^2+2x+5=0$ denkleminin diskriminantı kaçtır? => $4-20=-16$, gerçek kök yok.
3. $2x^2-8x+3=0$ denkleminde kökler toplamı kaçtır? => $-\dfrac{-8}{2}=4$.
4. Kökleri 2 ve $-5$ olan denklem nedir? => $x^2+3x-10=0$.
5. $i^{10}$ kaçtır? => $10=4\cdot2+2$ olduğundan $i^2=-1$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-mat' and name = 'İkinci Dereceden Denklemler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir telefon tarifesinde ayda en az kaç dakika konuşunca yeni paketin daha ucuz olduğunu, bir asansörün taşıyabileceği en fazla kişi sayısını ya da bir fabrikanın zarar etmemesi için en az kaç ürün satması gerektiğini düşün. Bunların hepsi eşitlik değil, **eşitsizlik** problemidir. Eşitsizliğin cevabı tek bir sayı değil, bir **aralıktır**. Bu konuda birinci ve ikinci dereceden eşitsizlikleri, çarpım ve bölüm biçimindeki eşitsizlikleri, mutlak değerli eşitsizlikleri **işaret tablosu** ile çözeceksin.

:::hedefler
1. Eşitsizliğin özelliklerini ve işaret değiştiren durumu bilmek.
2. İşaret tablosu kurarak çarpım ve bölüm eşitsizliklerini çözmek.
3. İkinci dereceden eşitsizlikleri çözmek.
4. Rasyonel eşitsizliklerde paydayı sıfır yapan değeri dışarıda tutmak.
5. Mutlak değerli eşitsizlikleri aralık olarak yazmak.
6. Her $x$ için sağlanan eşitsizliklerde parametre bulmak.
:::

:::ipucu
Eşitsizliği **iki tarafı negatif bir sayıyla çarparken ya da bölerken** yön değiştirir. Paydada $x$ varsa içlerle dışları çarpma. Her şeyi bir tarafa topla, 0 ile karşılaştır ve işaret tablosu yap.
:::

::video{id="O2APQMPcV_8" etiket="Konu anlatımı videosu" baslik="Eşitsizlikler" kanal="Matematiğin Güler Yüzü"}

## 1. Eşitsizliğin temel özellikleri

- Her iki yana aynı sayıyı ekleyip çıkarabilirsin. Yön değişmez.
- Her iki yanı **pozitif** sayıyla çarpıp bölersen yön değişmez.
- Her iki yanı **negatif** sayıyla çarpıp bölersen **yön değişir**.
- $0<a<b$ ise $\dfrac{1}{a}>\dfrac{1}{b}$. Çarpmaya göre ters alınca yön değişir.
- $a<b$ ve $c<d$ ise $a+c<b+d$. Eşitsizlikleri toplayabilirsin, çıkaramazsın.

**Aralık gösterimi:** $a<x<b$ için $(a,b)$, $a\le x\le b$ için $[a,b]$, $x>a$ için $(a,\infty)$. Eşit olan uç **kapalı** köşeli parantezle yazılır. $\pm\infty$ her zaman açıktır.

## 2. Birinci derece ve çarpım eşitsizlikleri

**Birinci derece:** $3x-5<7$ için $3x<12$ ve $x<4$.

**Çarpım ve bölüm:** Terimleri sıfır yapan **kökleri** bul, sayı doğrusuna yerleştir, aralıkların işaretini yaz.

**İşaret tablosu kuralı:**

1. Her çarpanın kökünü bul ve küçükten büyüğe sırala.
2. En sağdaki aralıkta işaret, çarpanların $x$ katsayılarının işaretlerinin çarpımıdır. Çoğunlukla $+$.
3. Her **tek katlı** kökte işaret değişir.
4. Her **çift katlı** kökte işaret değişmez.

**Örnek:** $(x-1)(x+3)(x-5)<0$ için kökler $-3,1,5$. Sağ uçtan $+,-,+,-$ gelir: $x<-3$ ya da $1<x<5$.

## 3. İkinci dereceden eşitsizlikler

$ax^2+bx+c$ ifadesinin işareti, kökleri ve $a$'nın işaretiyle belirlenir.

- $\Delta>0$ ve $a>0$: Kökler arasında **negatif**, dışında **pozitif**.
- $\Delta=0$: Kök dışında ifade $a$ ile aynı işaretlidir, kökte sıfırdır.
- $\Delta<0$: İfade her yerde $a$ ile aynı işaretlidir.

**Örnek:** $x^2-x-6<0$ için $(x-3)(x+2)<0$ ve $-2<x<3$. Tam sayı çözümleri $-1,0,1,2$ olur, dört tanedir.

**Her $x$ için sağlanma:** $ax^2+bx+c>0$ her gerçek sayı için doğru ise $a>0$ ve $\Delta<0$ olmalıdır.

**Örnek:** $x^2-2mx+m+6>0$ her $x$ için sağlanıyorsa $\Delta=4m^2-4m-24<0$, yani $m^2-m-6<0$ ve $(m-3)(m+2)<0$. Buradan $-2<m<3$ bulunur. Tam sayı değerleri $-1,0,1,2$.

## 4. Rasyonel eşitsizlikler

$\dfrac{P(x)}{Q(x)}\ge0$ gibi ifadelerde payı ve paydayı ayrı ayrı sıfır yapan değerleri bul.

- Payı sıfır yapan değerler eşitlik varsa **dahil**.
- Paydayı sıfır yapan değerler **hiçbir zaman dahil değildir**.

**Örnek:** $\dfrac{x-2}{x+1}\ge0$ için kökler $x=2$ (pay) ve $x=-1$ (payda). İşaret tablosu sağdan $+,-,+$ olur. Çözüm: $x<-1$ ya da $x\ge2$. $x=-1$ dahil edilmez.

**Kesirli eşitsizliği karşıya geçirme:** $\dfrac{x+1}{x-3}>2$ ise $\dfrac{x+1}{x-3}-2>0$ ve $\dfrac{x+1-2x+6}{x-3}=\dfrac{7-x}{x-3}>0$ yazılır.

## 5. Mutlak değerli eşitsizlikler

$a>0$ için:

| Eşitsizlik | Çözüm |
| --- | --- |
| $\lvert x\rvert<a$ | $-a<x<a$ |
| $\lvert x\rvert\le a$ | $-a\le x\le a$ |
| $\lvert x\rvert>a$ | $x<-a$ ya da $x>a$ |
| $\lvert x\rvert\ge a$ | $x\le-a$ ya da $x\ge a$ |

**Örnek:** $\lvert 2x-3\rvert\le5$ için $-5\le2x-3\le5$, $-2\le2x\le8$ ve $-1\le x\le4$. Tam sayı çözümleri $-1,0,1,2,3,4$ ve toplamları $9$ olur.

::sim{tur="mutlak"}

**Yorum:** $\lvert x-a\rvert<r$, sayı doğrusunda $a$'ya uzaklığı $r$'den küçük sayıları anlatır. $\lvert x-3\rvert<2$ ise $1<x<5$.

## 6. Hata yapılan yerler

- Rasyonel eşitsizlikte paydayı çarpıp yön bozmak. İşareti bilinmeyen bir ifadeyle çarpma.
- Çift katlı kökte işareti değiştirmek.
- Paydayı sıfır yapan değeri çözüme almak.
- $\lvert x\rvert>a$ eşitsizliğini tek aralık yazmak. İki ayrı aralıktır.

:::baglanti
Bu konudaki işaret tablosu, **parabol** grafiğinin $x$ eksenine göre durumunu, **türevde** artan ve azalan aralıkları bulmayı, **limit ve süreklilik** konusunda tanım aralıklarını belirlemeyi doğrudan kullanır. İkinci dereceden denklemlerdeki $\Delta$ bilgisi buradaki parametre sorularının anahtarıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Negatifle çarpma | Yön değişir |
| İşaret tablosu | Kökleri sırala, tek katlıda işaret değiştir |
| Çift katlı kök | İşaret değişmez |
| Rasyonel | Payda sıfır olamaz |
| $\lvert x\rvert<a$ | $-a<x<a$ |
| $\lvert x\rvert>a$ | $x<-a$ ya da $x>a$ |
| Her $x$ için pozitif | $a>0$ ve $\Delta<0$ |

## Mini test

:::soru{cevap="C"}
$x^2-x-6<0$ eşitsizliğini sağlayan kaç tam sayı vardır?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. $x^2-x-6=(x-3)(x+2)$ olduğundan kökler $-2$ ve $3$.
2. Katsayı pozitif olduğundan ifade kökler arasında negatiftir: $-2<x<3$.
3. Tam sayılar $-1,0,1,2$ olup dört tanedir. Doğru cevap C.

Diğer şıklar: **2** yalnızca pozitif tam sayılar sayılmış / **3** negatif tarafı unutarak $0,1,2$ alınmış / **5** köklerden biri de dahil edilmiş / **6** iki kök de dahil edilmiş, $\le$ çözülmüş.
:::

:::soru{cevap="D"}
$\dfrac{x-2}{x+1}\ge0$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?

- A) $(-1,2]$
- B) $(-\infty,-1]\cup[2,\infty)$
- C) $[-1,2)$
- D) $(-\infty,-1)\cup[2,\infty)$
- E) $(-\infty,2]$

---

1. Pay $x=2$'de, payda $x=-1$'de sıfır olur.
2. İşaret tablosunda sağdan sola $+,-,+$ gelir. Pozitif bölgeler $x<-1$ ve $x>2$.
3. $x=2$ eşitliği sağladığından dahildir. $x=-1$ paydayı sıfır yaptığından dahil değildir. Doğru cevap D.

Diğer şıklar: **$(-1,2]$** negatif bölge alınmış / **$(-\infty,-1]\cup[2,\infty)$** paydayı sıfır yapan değer çözüme katılmış / **$[-1,2)$** hem bölge hem uçlar yanlış / **$(-\infty,2]$** payda tamamen yok sayılmış.
:::

:::soru{cevap="B"}
$\lvert 2x-3\rvert\le5$ eşitsizliğini sağlayan tam sayıların toplamı kaçtır?

- A) 6
- B) 9
- C) 10
- D) 18
- E) 33

---

1. $-5\le2x-3\le5$ yazılır. Her tarafa 3 eklenirse $-2\le2x\le8$.
2. 2'ye bölünürse $-1\le x\le4$.
3. Tam sayılar $-1,0,1,2,3,4$ ve toplamları $9$. Doğru cevap B.

Diğer şıklar: **6** uçlar dahil edilmemiş, $0+1+2+3$ / **10** negatif ve sıfır alınmamış, $1+2+3+4$ / **18** $x$ yerine $2x$ değerleri toplanmış / **33** 2'ye bölmek unutulmuş, $-2\le x\le8$ alınmış.
:::

:::soru{cevap="C"}
$x^2-2mx+m+6>0$ eşitsizliği her gerçek $x$ için sağlanıyorsa $m$'nin alabileceği **en büyük** ile **en küçük** tam sayı değerlerinin farkı kaçtır?

- A) 1
- B) 2
- C) 3
- D) 4
- E) 5

---

1. Baş katsayı pozitif olduğundan her $x$ için pozitif olması $\Delta<0$ ile mümkündür.
2. $\Delta=4m^2-4(m+6)=4(m^2-m-6)<0$ ve $(m-3)(m+2)<0$ olur, yani $-2<m<3$.
3. En büyük tam sayı 2, en küçük tam sayı $-1$. Fark $2-(-1)=3$. Doğru cevap C.

Diğer şıklar: **1** yalnızca bir uca bakılmış / **2** farkın yerine en büyük tam sayı verilmiş / **4** uçlardan biri dahil edilerek $3-(-1)$ alınmış / **5** iki uç da dahil edilerek $3-(-2)$ bulunmuş.
:::

## Kendini dene

:::dene
1. $-2x+6>10$ eşitsizliğini çöz. => $-2x>4$ ve $x<-2$.
2. $(x-4)(x+1)>0$ çözüm kümesi nedir? => $x<-1$ ya da $x>4$.
3. $\lvert x\rvert<3$ için kaç tam sayı vardır? => $-2,-1,0,1,2$ olmak üzere 5.
4. $\dfrac{x}{x-3}<0$ çözümü nedir? => $0<x<3$.
5. $x^2+4>0$ eşitsizliği hangi $x$ için doğrudur? => Her gerçek sayı için.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-mat' and name = 'Eşitsizlikler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir basketbol topunun potaya giden yolunu, bir köprünün kablo eğrisini ya da bir uydu çanağının kesitini düşün. Hepsinde **parabol** vardır. İkinci dereceden fonksiyonun grafiği olan parabol, AYT'de her yıl sorulur. Bu konuda parabolün **tepe noktasını**, **simetri eksenini**, eksenleri kestiği noktaları, **en büyük ve en küçük değerini** ve doğruyla kesişimini öğreneceksin. Bir önceki konularda öğrendiğin $\Delta$ ve kök bağıntıları burada grafiğe dönüşüyor.

:::hedefler
1. $y=ax^2+bx+c$ grafiğini $a$, $b$, $c$ ve $\Delta$ ile yorumlamak.
2. Tepe noktasını ve simetri eksenini bulmak.
3. Parabolün eksenleri kestiği noktaları belirlemek.
4. En büyük ya da en küçük değeri bulmak.
5. Üç farklı biçimde parabol denklemi yazmak.
6. Parabol ve doğrunun kesişimini incelemek.
:::

:::ipucu
Parabolde önce **tepe noktasını** bul. Çoğu soru tepe, kökler ve $y$ eksenini kestiği nokta üçlüsünden çözülür. Parabol simetrik olduğundan bir kök ve tepe biliniyorsa diğer kök de bilinir.
:::

::video{id="eHYKG3-j8HY" etiket="Konu anlatımı videosu" baslik="Parabol" kanal="Matematiğin Güler Yüzü"}

## 1. Grafiğin yorumu

$f(x)=ax^2+bx+c$ ($a\ne0$) fonksiyonunun grafiği paraboldür.

| Katsayı | Grafikteki anlamı |
| --- | --- |
| $a>0$ | Kolları yukarı, tepe **en küçük** değer |
| $a<0$ | Kolları aşağı, tepe **en büyük** değer |
| $c$ | $y$ eksenini kestiği nokta: $(0,c)$ |
| $\Delta>0$ | $x$ eksenini iki noktada keser |
| $\Delta=0$ | $x$ eksenine teğet, tepe $x$ ekseni üzerinde |
| $\Delta<0$ | $x$ eksenini kesmez |
| $\dfrac{b}{a}$ | İşareti simetri ekseninin yerini söyler. $-\dfrac{b}{2a}>0$ ise eksen sağda |

::sim{tur="parabol"}

## 2. Tepe noktası ve simetri ekseni

Tepe noktası $T(r,k)$:

$$r=-\dfrac{b}{2a},\qquad k=f(r)=-\dfrac{\Delta}{4a}$$

**Simetri ekseni:** $x=r$ doğrusu. $x_1$ ve $x_2$ kök ise $r=\dfrac{x_1+x_2}{2}$.

**Örnek:** $y=x^2-6x+5$ için $r=3$, $k=9-18+5=-4$. Tepe $T(3,-4)$. Kökler $1$ ve $5$, ortaları $3$.

**En büyük ve en küçük değer:** $a>0$ ise **en küçük** değer $k$, $a<0$ ise **en büyük** değer $k$. Kapalı aralıkta ise uç noktalardaki değerlere de bakılır.

**Örnek:** $f(x)=-x^2+4x+k$ fonksiyonunun en büyük değeri 7 ise $r=2$ ve $f(2)=-4+8+k=7$, $k=3$.

## 3. Parabol denklemi yazma

Elinde hangi bilgi varsa ona uygun biçim seç.

| Verilen | Kullanılacak biçim |
| --- | --- |
| Tepe noktası $(r,k)$ ve bir nokta | $y=a(x-r)^2+k$ |
| İki kök $x_1,x_2$ ve bir nokta | $y=a(x-x_1)(x-x_2)$ |
| Üç nokta | $y=ax^2+bx+c$, üç denklemle çöz |
| $x$ eksenine teğet, kök $r$ | $y=a(x-r)^2$ |

**Örnek:** Kökleri 1 ve 5 olan, $(0,-10)$ noktasından geçen parabolde $a(0-1)(0-5)=5a=-10$ ve $a=-2$ olur. Tepe $x=3$'tedir ve $y=-2(3-1)(3-5)=8$. Tepe $T(3,8)$.

## 4. Parabolün ötelenmesi

$y=ax^2$ parabolünün tepesi orijindedir. $y=a(x-r)^2+k$ parabolü, onun $r$ birim sağa ve $k$ birim yukarı ötelenmişidir. Öteleme, **fonksiyonlar** konusundaki dönüşüm kuralları ile aynıdır. Kolların genişliğini $a$ belirler. $\lvert a\rvert$ büyüdükçe parabol daralır.

## 5. Parabol ve doğrunun konumu

$y=ax^2+bx+c$ parabolü ile $y=mx+n$ doğrusunun kesişimi için iki denklem eşitlenir:

$$ax^2+bx+c=mx+n\ \Rightarrow\ ax^2+(b-m)x+(c-n)=0$$

Bu denklemin $\Delta$ değeri konumu belirler.

| $\Delta$ | Konum |
| --- | --- |
| $>0$ | İki noktada keser |
| $=0$ | Teğet |
| $<0$ | Kesmez |

**Örnek:** $y=x^2-4x+3$ ve $y=x-1$ için $x^2-5x+4=0$ olur. $\Delta=25-16=9>0$ olduğundan iki noktada keser ve kesim noktalarının apsisleri toplamı $5$'tir.

**Teğet olma şartı:** Doğru parabole teğetse $\Delta=0$ yazılır ve parametre bulunur.

## 6. Parabolde alan ve uzunluk soruları

- Parabolün $x$ eksenini kestiği noktalar arasındaki uzaklık $\lvert x_1-x_2\rvert=\dfrac{\sqrt{\Delta}}{\lvert a\rvert}$.
- Maksimum alan soruları: Çevresi sabit dikdörtgenin alanı ikinci dereceden bir fonksiyondur, tepe noktasında en büyük olur. Çevre 40 ise kenarlar $x$ ve $20-x$ olur ve alan $x(20-x)$ ifadesi $x=10$'da 100 ile en büyük olur.
- Atış sorularında yükseklik zamanın ikinci derece fonksiyonudur, tepe noktası en yüksek noktayı verir.

:::baglanti
Parabol, **ikinci dereceden denklemler** ve **eşitsizlikler** konusunun grafikle görüntüsüdür. $f(x)>0$ çözümü parabolün $x$ ekseninin üstünde kaldığı aralıktır. **Türevde** tepe noktası, türevin sıfır olduğu nokta olarak yeniden karşına çıkar. **Fizikte** atış hareketi bir paraboldür.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tepe | $r=-\dfrac{b}{2a}$, $k=f(r)$ |
| $a>0$ | Kollar yukarı, en küçük değer |
| $a<0$ | Kollar aşağı, en büyük değer |
| $y$ kesimi | $(0,c)$ |
| Kökler | $\Delta$ ile |
| Simetri | $x=\dfrac{x_1+x_2}{2}$ |
| Parabol-doğru | Denklemleri eşitle, $\Delta$'ya bak |

## Mini test

:::soru{cevap="A"}
$y=x^2-6x+5$ parabolünün tepe noktasının **ordinatı** kaçtır?

- A) $-4$
- B) 3
- C) 4
- D) 5
- E) 9

---

1. Tepe noktasının apsisi $r=-\dfrac{-6}{2}=3$.
2. Ordinat $f(3)=9-18+5=-4$. Doğru cevap A.

Diğer şıklar: **3** apsis bulunmuş / **4** işaret düşürülerek $\lvert k\rvert$ alınmış / **5** sabit terim yani $y$ eksenini kestiği nokta yazılmış / **9** $r^2$ değeri ordinat sanılmış.
:::

:::soru{cevap="B"}
$f(x)=-x^2+4x+k$ fonksiyonunun **en büyük değeri 7** olduğuna göre $k$ kaçtır?

- A) $-3$
- B) 3
- C) 4
- D) 7
- E) 11

---

1. Baş katsayı negatif olduğundan en büyük değer tepe noktasındadır. $r=-\dfrac{4}{-2}=2$.
2. $f(2)=-4+8+k=4+k=7$ ve $k=3$. Doğru cevap B.

Diğer şıklar: **$-3$** $4+k=7$ çözülürken işaret hatası yapılmış / **4** tepeyi $x=1$ alıp $f(1)=3+k=7$ bulunmuş / **7** en büyük değer $k$ sanılmış / **11** $4+7$ toplanmış.
:::

:::soru{cevap="D"}
Kökleri 1 ve 5 olan, $(0,-10)$ noktasından geçen parabolün **tepe noktasının ordinatı** kaçtır?

- A) $-8$
- B) $-4$
- C) 2
- D) 8
- E) 10

---

1. $y=a(x-1)(x-5)$ yazılır. $(0,-10)$ için $a\cdot(-1)(-5)=5a=-10$ ve $a=-2$.
2. Tepe, köklerin ortasındaki $x=3$'tedir. $y=-2(3-1)(3-5)=-2\cdot2\cdot(-2)=8$. Doğru cevap D.

Diğer şıklar: **$-8$** $a=2$ alınmış, işaret hatası / **$-4$** $(x-5)$ çarpanı unutulmuş, $-2\cdot2$ hesaplanmış / **2** $\lvert a\rvert$ ordinat sanılmış / **10** $y$ eksenini kestiği nokta yazılmış.
:::

:::soru{cevap="E"}
$y=x^2-4x+3$ parabolü ile $y=x-1$ doğrusunun kesim noktalarının **apsisleri toplamı** kaçtır?

- A) $-5$
- B) 1
- C) 3
- D) 4
- E) 5

---

1. Eşitlenirse $x^2-4x+3=x-1$ ve $x^2-5x+4=0$.
2. $\Delta=25-16=9>0$ olduğundan iki kesim noktası vardır. Kökler toplamı $-\dfrac{-5}{1}=5$. Doğru cevap E.

Diğer şıklar: **$-5$** Vieta'da işaret unutulmuş / **1** doğrunun eğimi yazılmış / **3** parabolün sabit terimi yazılmış / **4** kökler çarpımı ya da parabolün kendi köklerinin toplamı alınmış.
:::

## Kendini dene

:::dene
1. $y=2x^2-8x+3$ parabolünün simetri ekseni nedir? => $x=-\dfrac{-8}{4}=2$.
2. $y=x^2-4$ parabolünün $x$ eksenini kestiği noktalar nelerdir? => $(-2,0)$ ve $(2,0)$.
3. Kolları aşağı bakan parabolde tepe noktası ne olur? => En büyük değerin olduğu noktadır.
4. $\Delta=0$ olan parabol $x$ eksenine göre nasıl durur? => Eksene teğettir.
5. $y=-x^2+6x$ parabolünün en büyük değeri kaçtır? => $r=3$ ve $f(3)=-9+18=9$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-mat' and name = 'Parabol'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sınıfta bir başkan ve bir yardımcı seçerken sıra önemlidir, çünkü "Ali başkan, Ayşe yardımcı" ile "Ayşe başkan, Ali yardımcı" farklı durumlardır. İki kişilik bir nöbet ekibi seçerken ise sıra önemsizdir. İşte **permütasyon** ve **kombinasyon** bu farktan doğar. Olasılık ise bu saymaların oran olarak kullanılmasıdır. Bu konuda **sayma yöntemlerini**, permütasyon ve kombinasyonu, **binom açılımını** ve **olasılık hesaplarını** öğreneceksin. Bu konuda iyi bir sınıflandırma yapmak, yani hangi durumda hangi yöntemin kullanılacağını görmek, formül bilmekten daha önemlidir.

:::hedefler
1. Toplama ve çarpma kurallarıyla saymak.
2. Permütasyon ve kombinasyonu sıranın önemine göre ayırt etmek.
3. Tekrarlı permütasyon ve dairesel dizilişi hesaplamak.
4. Binom açılımının genel terimini kullanmak.
5. Olasılık hesaplarını yapmak ve koşullu olasılığı yorumlamak.
6. Bağımsız ve ayrık olayları ayırt etmek.
:::

:::ipucu
Her soruda ilk soru şu olsun: **Sıra önemli mi?** Önemliyse permütasyon, önemli değilse kombinasyon. Sonra bir sayma problemini küçük bir örnekle dene, yöntemin doğruluğunu o örnekte kontrol et.
:::

::video{id="JZ2b7oxSnGU" etiket="Konu anlatımı videosu" baslik="Permütasyon, Kombinasyon, Olasılık" kanal="Matematiğin Güler Yüzü"}

## 1. Sayma kuralları

- **Toplama kuralı:** İki iş birlikte yapılamıyorsa ($A$ ya da $B$), yollar toplanır. $m+n$.
- **Çarpma kuralı:** İki iş art arda yapılıyorsa ($A$ ve sonra $B$), yollar çarpılır. $m\cdot n$.

**Faktöriyel:** $n!=n(n-1)(n-2)\cdots2\cdot1$, $0!=1$.

**Örnek:** 3 gömlek ve 4 pantolonla $3\cdot4=12$ farklı kombin olur. Bir gömlek ya da bir ceket seçecek olsan $3+2=5$ seçenek olur.

## 2. Permütasyon

$n$ elemanın $r$ tanesinin **sıralı** seçimi:

$$P(n,r)=\dfrac{n!}{(n-r)!}$$

**Tekrarlı permütasyon:** $n$ elemanın içinde $a$, $b$, $c$ tane aynı eleman varsa $\dfrac{n!}{a!\,b!\,c!}$.

**Örnek:** ANKARA kelimesinde 6 harf var ve A harfi 3 kez geçer. Yer değiştirmeyle $\dfrac{6!}{3!}=120$ farklı dizilim yazılır.

**Dairesel permütasyon:** $n$ elemanın yuvarlak masaya dizilişi $(n-1)!$. Masa **çevrilebilir** olduğu için bir kişiyi sabitleyip diğerlerini dizeriz. Anahtarlık gibi çevrilip ters çevrilebilen dizilişte $\dfrac{(n-1)!}{2}$ olur.

**Şartlı dizilişler:** Yan yana olması gereken elemanları bir paket say, paketin içini ayrıca say. Yan yana gelmesi istenmeyenlerde önce hepsini say, yan yana gelenleri çıkar.

## 3. Kombinasyon

$n$ elemanın $r$ tanesinin **sırasız** seçimi:

$$C(n,r)=\dbinom{n}{r}=\dfrac{n!}{r!\,(n-r)!}$$

**Özellikler:**

- $\dbinom{n}{r}=\dbinom{n}{n-r}$
- $\dbinom{n}{0}=\dbinom{n}{n}=1$
- $\dbinom{n}{r}+\dbinom{n}{r+1}=\dbinom{n+1}{r+1}$ (Pascal)
- Toplam alt küme sayısı: $2^n$

::sim{tur="kombinasyon"}

**Örnek:** 7 kişilik gruptan 2 kişilik temsilci grubu $\dbinom{7}{2}=21$ yolla seçilir. Cinsiyet şartı varsa gruplar ayrı ayrı seçilir ve çarpılır: 6 erkek ve 4 kızdan 2 erkek, 2 kız seçilirse $\dbinom{6}{2}\dbinom{4}{2}=15\cdot6=90$.

## 4. Binom açılımı

$$(a+b)^n=\sum_{k=0}^{n}\dbinom{n}{k}a^{n-k}b^k$$

**Genel terim:** $T_{k+1}=\dbinom{n}{k}a^{n-k}b^k$.

**Katsayılar toplamı:** $a=b=1$ yazılır. $(x+y)^n$ için toplam $2^n$.

**Örnek:** $\left(x+\dfrac{2}{x}\right)^6$ açılımında genel terim $\dbinom{6}{k}x^{6-k}\dfrac{2^k}{x^k}=\dbinom{6}{k}2^kx^{6-2k}$. Sabit terim için $6-2k=0$ ve $k=3$. Sabit terim $\dbinom{6}{3}\cdot2^3=20\cdot8=160$.

## 5. Olasılık

**Klasik olasılık:** Örnek uzay eşit olasılıklıysa

$$P(A)=\dfrac{s(A)}{s(E)},\qquad 0\le P(A)\le1$$

**Temel kurallar:**

- $P(A')=1-P(A)$
- $P(A\cup B)=P(A)+P(B)-P(A\cap B)$
- $A$ ve $B$ **ayrık** ise $P(A\cap B)=0$ ve $P(A\cup B)=P(A)+P(B)$.
- $A$ ve $B$ **bağımsız** ise $P(A\cap B)=P(A)P(B)$.

**Koşullu olasılık:** $B$ olduğu biliniyorsa $A$'nın olasılığı

$$P(A\mid B)=\dfrac{P(A\cap B)}{P(B)}$$

**Örnek:** Torbada 4 kırmızı ve 6 mavi top var. İadesiz 2 top çekilirken ikisinin **aynı renkte** olma olasılığı $\dfrac{\dbinom42+\dbinom62}{\dbinom{10}{2}}=\dfrac{6+15}{45}=\dfrac{7}{15}$ olur.

::sim{tur="olasilik"}

:::ipucu{baslik="Sık yapılan hata"}
**Ayrık** ile **bağımsız** aynı şey değildir. Ayrık olaylar aynı anda olamaz, birbirini dışlar. Bağımsız olaylar birbirini etkilemez. Sıfırdan farklı olasılıklı iki ayrık olay bağımsız **değildir**, çünkü biri olunca diğerinin olamayacağı bellidir.
:::

:::baglanti
Kombinasyon ve binom, **polinomlar** konusundaki açılımlarla, **diziler** konusundaki toplamlarla bağlanır. Olasılık, **istatistik** (TYT) bilgilerinin devamıdır. Ayrık ve bağımsız olay ayrımı, **fonksiyon** ve **küme** konularında kullandığın mantıkla aynı dili konuşur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çarpma kuralı | Art arda işler, çarpılır |
| Permütasyon | Sıralı, $\dfrac{n!}{(n-r)!}$ |
| Kombinasyon | Sırasız, $\dfrac{n!}{r!(n-r)!}$ |
| Tekrarlı | $\dfrac{n!}{a!\,b!}$ |
| Dairesel | $(n-1)!$ |
| Binom | $T_{k+1}=\dbinom nk a^{n-k}b^k$ |
| Olasılık | İstenen bölü tüm durumlar |
| Koşullu | $\dfrac{P(A\cap B)}{P(B)}$ |

## Mini test

:::soru{cevap="A"}
7 kişilik bir gruptan sıra önemsiz olmak üzere **2 kişilik temsilci grubu** kaç farklı biçimde seçilebilir?

- A) 21
- B) 35
- C) 42
- D) 49
- E) 128

---

1. Sıra önemsiz olduğundan kombinasyon kullanılır.
2. $\dbinom{7}{2}=\dfrac{7\cdot6}{2}=21$. Doğru cevap A.

Diğer şıklar: **35** $\dbinom{7}{3}$ hesaplanmış / **42** sıra önemli sanılıp $P(7,2)$ bulunmuş / **49** $7\cdot7$ ile tekrar edilebilir seçim yapılmış / **128** tüm alt kümeler sayılmış, $2^7$.
:::

:::soru{cevap="C"}
ANKARA kelimesinin harfleri yer değiştirilerek yazılabilen anlamlı ya da anlamsız **6 harfli kaç farklı sözcük** vardır?

- A) 20
- B) 60
- C) 120
- D) 360
- E) 720

---

1. Kelimede 6 harf var ve A harfi 3 kez geçiyor. Tekrarlı permütasyon kullanılır.
2. $\dfrac{6!}{3!}=\dfrac{720}{6}=120$. Doğru cevap C.

Diğer şıklar: **20** $\dbinom{6}{3}$ yani A'ların yerleri sayılmış / **60** $2!$ de bölünmüş / **360** yalnızca $2!$'e bölünmüş / **720** harfler farklı sanılmış.
:::

:::soru{cevap="D"}
Bir torbada 4 kırmızı ve 6 mavi top vardır. Torbadan **iadesiz** olarak 2 top çekiliyor. Çekilen topların **aynı renkte** olma olasılığı kaçtır?

- A) $\dfrac{2}{15}$
- B) $\dfrac{1}{3}$
- C) $\dfrac{2}{5}$
- D) $\dfrac{7}{15}$
- E) $\dfrac{8}{15}$

---

1. Tüm durumlar $\dbinom{10}{2}=45$.
2. İkisi de kırmızı $\dbinom42=6$, ikisi de mavi $\dbinom62=15$. Toplam $21$ durum.
3. Olasılık $\dfrac{21}{45}=\dfrac{7}{15}$. Doğru cevap D.

Diğer şıklar: **$\dfrac{2}{15}$** yalnızca ikisi de kırmızı olma durumu / **$\dfrac13$** yalnızca ikisi de mavi olma durumu / **$\dfrac25$** tek çekilişte kırmızı olasılığı alınmış / **$\dfrac{8}{15}$** farklı renk olasılığı bulunmuş.
:::

:::soru{cevap="E"}
$\left(x+\dfrac{2}{x}\right)^6$ açılımındaki **sabit terim** kaçtır?

- A) 20
- B) 60
- C) 80
- D) 120
- E) 160

---

1. Genel terim $\dbinom6k x^{6-k}\left(\dfrac2x\right)^k=\dbinom6k2^kx^{6-2k}$.
2. Sabit terim için $6-2k=0$ ve $k=3$.
3. Terim $\dbinom63\cdot2^3=20\cdot8=160$. Doğru cevap E.

Diğer şıklar: **20** $2^3$ çarpanı unutulmuş / **60** $k=2$ alınmış, $\dbinom62\cdot2^2$ / **80** $2^3$ yerine $2^2$ alınmış / **120** $2^k$ yerine $2k$ alınmış, $20\cdot6$.
:::

## Kendini dene

:::dene
1. $5!$ kaçtır? => 120.
2. $\dbinom{8}{2}$ kaçtır? => 28.
3. 5 kişi yuvarlak masaya kaç farklı biçimde oturur? => $4!=24$.
4. Bir zar atılınca çift gelme olasılığı nedir? => $\dfrac36=\dfrac12$.
5. $(a+b)^4$ açılımında kaç terim vardır? => 5.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-mat' and name = 'Permütasyon, Kombinasyon, Olasılık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir dönme dolabın yüksekliğinin zamanla nasıl değiştiğini, bir salıncağın gidip gelişini ya da bir ses dalgasının şeklini düşün. Hepsi **dönme ve titreşim** olaylarıdır ve trigonometri bu olayların matematiğidir. TYT'de dik üçgendeki oranları öğrendin. AYT'de açıyı **birim çember** üzerinde genişletiyor, trigonometrik oranları her açı için tanımlıyor, **toplam-fark ve iki kat açı formüllerini**, grafikleri ve denklemleri işliyorsun. Bu konunun formülleri çok, ama hepsi birim çemberden çıkar. Çemberi gözünün önüne getirebilirsen formül ezberlemene gerek kalmaz.

:::hedefler
1. Dereceyi radyana çevirmek ve birim çemberde açıyı yerleştirmek.
2. $\sin$, $\cos$, $\tan$, $\cot$ değerlerini işaretleri ile bulmak.
3. İndirgeme ve özel açı değerlerini kullanmak.
4. Toplam-fark ve iki kat açı formüllerini uygulamak.
5. Grafiklerde periyot, genlik ve ötelemeyi okumak.
6. Temel trigonometrik denklemleri çözmek.
:::

:::ipucu
Trigonometri sorularında önce **açının bölgesine** bak. Hangi çeyrekte olduğu işareti belirler. Sonra **dar açıya indirge** ve değeri özel açı tablosundan al. İşareti en sonda koymak hatayı azaltır.
:::

::video{id="41aHNBRs3v8" etiket="Konu anlatımı videosu" baslik="Trigonometri" kanal="Matematiğin Güler Yüzü"}

## 1. Radyan ve birim çember

$\pi$ radyan $=180^\circ$. Dönüşüm için $\dfrac{D}{180}=\dfrac{R}{\pi}$ bağıntısı kullanılır.

| Derece | $0^\circ$ | $30^\circ$ | $45^\circ$ | $60^\circ$ | $90^\circ$ | $180^\circ$ | $270^\circ$ | $360^\circ$ |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Radyan | $0$ | $\dfrac{\pi}{6}$ | $\dfrac{\pi}{4}$ | $\dfrac{\pi}{3}$ | $\dfrac{\pi}{2}$ | $\pi$ | $\dfrac{3\pi}{2}$ | $2\pi$ |

**Birim çember:** Merkezi orijin, yarıçapı 1 olan çemberdir. Başlangıç noktasından saat yönünün tersine $\theta$ kadar dönen noktanın koordinatları $(\cos\theta,\sin\theta)$ olur. Yani **kosinüs $x$ koordinatı, sinüs $y$ koordinatıdır.**

::sim{tur="birimcember"}

**Bölgelere göre işaretler:**

| Bölge | $\sin$ | $\cos$ | $\tan$ |
| --- | --- | --- | --- |
| I. ($0^\circ$-$90^\circ$) | $+$ | $+$ | $+$ |
| II. ($90^\circ$-$180^\circ$) | $+$ | $-$ | $-$ |
| III. ($180^\circ$-$270^\circ$) | $-$ | $-$ | $+$ |
| IV. ($270^\circ$-$360^\circ$) | $-$ | $+$ | $-$ |

## 2. Özel açılar ve temel bağıntılar

| Açı | $30^\circ$ | $45^\circ$ | $60^\circ$ |
| --- | --- | --- | --- |
| $\sin$ | $\dfrac12$ | $\dfrac{\sqrt2}{2}$ | $\dfrac{\sqrt3}{2}$ |
| $\cos$ | $\dfrac{\sqrt3}{2}$ | $\dfrac{\sqrt2}{2}$ | $\dfrac12$ |
| $\tan$ | $\dfrac{\sqrt3}{3}$ | $1$ | $\sqrt3$ |

**Temel bağıntılar:**

- $\sin^2x+\cos^2x=1$
- $\tan x=\dfrac{\sin x}{\cos x}$, $\cot x=\dfrac{\cos x}{\sin x}$
- $1+\tan^2x=\dfrac{1}{\cos^2x}$

**Örnek:** $\sin x=\dfrac35$ ve $x$ ikinci bölgede ise $\cos x=-\dfrac45$ ve $\tan x=-\dfrac34$ olur.

## 3. İndirgeme

Açıyı $90^\circ$ ya da $180^\circ$ civarına yazıp dar açıya indirirsin.

- $180^\circ\pm x$ ve $360^\circ-x$ için fonksiyon **aynı kalır**, işaret bölgeye göre gelir.
- $90^\circ\pm x$ ve $270^\circ\pm x$ için fonksiyon **değişir** ($\sin\leftrightarrow\cos$), işaret bölgeye göre gelir.
- $\sin(-x)=-\sin x$, $\cos(-x)=\cos x$, $\tan(-x)=-\tan x$.

**Örnek:** $\sin150^\circ=\sin(180^\circ-30^\circ)=\sin30^\circ=\dfrac12$ ve $\cos120^\circ=\cos(180^\circ-60^\circ)=-\cos60^\circ=-\dfrac12$. $\tan135^\circ=-\tan45^\circ=-1$. Üçünün toplamı $\dfrac12-\dfrac12-1=-1$.

## 4. Toplam-fark ve iki kat açı

$$\sin(a\pm b)=\sin a\cos b\pm\cos a\sin b$$

$$\cos(a\pm b)=\cos a\cos b\mp\sin a\sin b$$

$$\tan(a\pm b)=\dfrac{\tan a\pm\tan b}{1\mp\tan a\tan b}$$

**İki kat açı formülleri:**

- $\sin2x=2\sin x\cos x$
- $\cos2x=\cos^2x-\sin^2x=2\cos^2x-1=1-2\sin^2x$
- $\tan2x=\dfrac{2\tan x}{1-\tan^2x}$

**Örnek:** $\sin x+\cos x=\dfrac12$ ise iki yanın karesi $1+2\sin x\cos x=\dfrac14$ olur. $\sin2x=\dfrac14-1=-\dfrac34$.

## 5. Grafikler

$y=a\sin(bx+c)+d$ ve $y=a\cos(bx+c)+d$ için:

| Büyüklük | Değer |
| --- | --- |
| Genlik | $\lvert a\rvert$ |
| Periyot | $\dfrac{2\pi}{\lvert b\rvert}$ |
| Yatay öteleme | $-\dfrac{c}{b}$ |
| Orta çizgi | $y=d$ |
| En büyük, en küçük değer | $d+\lvert a\rvert$, $d-\lvert a\rvert$ |

$\tan$ ve $\cot$ fonksiyonlarında periyot $\dfrac{\pi}{\lvert b\rvert}$'dir.

**Örnek:** $f(x)=3\sin\left(2x-\dfrac\pi3\right)+1$ için genlik 3, periyot $\pi$, orta çizgi $y=1$, en büyük değer 4, en küçük değer $-2$.

![Sinüs ve kosinüs fonksiyonlarının 0 ile 2π arasındaki grafikleri](/lessons/ayt-mat/sin-cos-grafigi.svg "Sinüs ve kosinüs grafikleri")

## 6. Trigonometrik denklemler

- $\sin x=\sin a$ ise $x=a+2k\pi$ ya da $x=\pi-a+2k\pi$.
- $\cos x=\cos a$ ise $x=\pm a+2k\pi$.
- $\tan x=\tan a$ ise $x=a+k\pi$.

**Örnek:** $2\sin x-1=0$ için $\sin x=\dfrac12$. $[0,2\pi)$ aralığında $x=\dfrac\pi6$ ya da $x=\dfrac{5\pi}6$. Çözüm toplamı $\pi$ olur.

**İkinci dereceden denklem:** $2\sin^2x-\sin x-1=0$ için $\sin x=t$ yazılır, $2t^2-t-1=0$ ve $t=1$ ya da $t=-\dfrac12$ olur.

## 7. Üçgende trigonometri

ABC üçgeninde kenarlar $a,b,c$ ve çevrel çemberin yarıçapı $R$ olsun.

- **Sinüs teoremi:** $\dfrac{a}{\sin A}=\dfrac{b}{\sin B}=\dfrac{c}{\sin C}=2R$
- **Kosinüs teoremi:** $a^2=b^2+c^2-2bc\cos A$
- **Alan:** $\dfrac12bc\sin A$

**Örnek:** $b=4$, $c=6$ ve aralarındaki açı $60^\circ$ ise $a^2=16+36-2\cdot4\cdot6\cdot\dfrac12=28$ ve alan $\dfrac12\cdot4\cdot6\cdot\dfrac{\sqrt3}{2}=6\sqrt3$.

:::baglanti
Trigonometrik fonksiyonların grafik dönüşümleri **fonksiyonlar** konusundaki kurallarla aynıdır. **Türev** ve **integral** konularında $\sin$ ve $\cos$ fonksiyonlarının türevi çıkacaktır. **Fizikte** dalga ve basit harmonik hareket, **dönüşüm geometrisinde** dönme matrisi bu konuya dayanır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Birim çember | $(\cos\theta,\sin\theta)$ |
| Temel bağıntı | $\sin^2x+\cos^2x=1$ |
| İndirgeme | $180$ ve $360$ aynı, $90$ ve $270$ değişir |
| Toplam formülü | $\sin(a+b)=\sin a\cos b+\cos a\sin b$ |
| İki kat | $\sin2x=2\sin x\cos x$ |
| Periyot | $\dfrac{2\pi}{\lvert b\rvert}$ |
| Sinüs teoremi | $\dfrac{a}{\sin A}=2R$ |

## Mini test

:::soru{cevap="A"}
$\sin150^\circ+\cos120^\circ+\tan135^\circ$ toplamı kaçtır?

- A) $-1$
- B) $-\dfrac12$
- C) 0
- D) $\dfrac12$
- E) 1

---

1. $\sin150^\circ=\sin30^\circ=\dfrac12$.
2. $\cos120^\circ=-\cos60^\circ=-\dfrac12$.
3. $\tan135^\circ=-\tan45^\circ=-1$.
4. Toplam $\dfrac12-\dfrac12-1=-1$. Doğru cevap A.

Diğer şıklar: **$-\dfrac12$** $\tan135^\circ$ yerine $-\dfrac12$ alınmış / **0** $\tan135^\circ$ unutulmuş / **$\dfrac12$** $\cos120^\circ$ pozitif alınmış / **1** $\tan135^\circ$ pozitif alınmış.
:::

:::soru{cevap="B"}
$\dfrac\pi2<x<\pi$ ve $\sin x=\dfrac35$ olduğuna göre $\tan x$ kaçtır?

- A) $-\dfrac43$
- B) $-\dfrac34$
- C) $-\dfrac35$
- D) $\dfrac34$
- E) $\dfrac43$

---

1. $\sin^2x+\cos^2x=1$ olduğundan $\cos^2x=1-\dfrac{9}{25}=\dfrac{16}{25}$.
2. İkinci bölgede kosinüs negatiftir: $\cos x=-\dfrac45$.
3. $\tan x=\dfrac{\sin x}{\cos x}=\dfrac{3/5}{-4/5}=-\dfrac34$. Doğru cevap B.

Diğer şıklar: **$-\dfrac43$** kotanjant bulunmuş / **$-\dfrac35$** sinüs değeri yazılmış / **$\dfrac34$** bölgeye göre işaret unutulmuş / **$\dfrac43$** hem kotanjant hem işaret yanlış.
:::

:::soru{cevap="D"}
$\sin x+\cos x=\dfrac12$ olduğuna göre $\sin2x$ kaçtır?

- A) $\dfrac14$
- B) $\dfrac34$
- C) $-\dfrac12$
- D) $-\dfrac34$
- E) 1

---

1. Eşitliğin iki yanının karesi alınır: $\sin^2x+2\sin x\cos x+\cos^2x=\dfrac14$.
2. $\sin^2x+\cos^2x=1$ olduğundan $1+\sin2x=\dfrac14$.
3. $\sin2x=-\dfrac34$. Doğru cevap D.

Diğer şıklar: **$\dfrac14$** $1$ eklenmeden $\sin2x=\dfrac14$ yazılmış / **$\dfrac34$** işaret hatası yapılmış / **$-\dfrac12$** karesi alınırken $\dfrac14$ yerine $\dfrac12$ kullanılmış, $\dfrac12-1$ / **1** $\sin^2x+\cos^2x=1$ değeri sonuç sanılmış.
:::

:::soru{cevap="C"}
$[0,2\pi)$ aralığında $2\sin x-1=0$ denkleminin çözüm kümesindeki elemanların toplamı kaçtır?

- A) $\dfrac\pi2$
- B) $\dfrac{2\pi}3$
- C) $\pi$
- D) $\dfrac{7\pi}6$
- E) $\dfrac{3\pi}2$

---

1. $\sin x=\dfrac12$ olur. Sinüs ilk iki bölgede pozitiftir.
2. $x=\dfrac\pi6$ ve $x=\pi-\dfrac\pi6=\dfrac{5\pi}6$.
3. Toplam $\dfrac\pi6+\dfrac{5\pi}6=\pi$. Doğru cevap C.

Diğer şıklar: **$\dfrac\pi2$** çözümler $\dfrac\pi6$ ve $\dfrac\pi3$ sanılmış / **$\dfrac{2\pi}3$** çözümler $\dfrac\pi6$ ve $\dfrac\pi2$ sanılmış / **$\dfrac{7\pi}6$** çözümler $\dfrac\pi6$ ve $\pi$ sanılmış / **$\dfrac{3\pi}2$** çözümler $\dfrac{5\pi}6$ ve $\dfrac{2\pi}3$ sanılmış.
:::

## Kendini dene

:::dene
1. $90^\circ$ kaç radyandır? => $\dfrac\pi2$.
2. $\sin30^\circ+\cos60^\circ$ kaçtır? => $\dfrac12+\dfrac12=1$.
3. $\sin^2x+\cos^2x$ kaçtır? => 1.
4. $y=2\sin3x$ fonksiyonunun periyodu nedir? => $\dfrac{2\pi}3$.
5. $\cos(-x)$ neye eşittir? => $\cos x$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-mat' and name = 'Trigonometri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir depremin şiddetini, bir sesin desibelini ya da bir çözeltinin pH değerini ölçerken çok büyük sayılarla uğraşırsın. Bu büyük sayıları küçük ve karşılaştırılabilir değerlere çeviren araç **logaritmadır**. Logaritma, üs almanın tersidir. $2^3=8$ ise "2'yi kaçıncı kuvvete yükseltirsek 8 olur?" sorusunun cevabı $\log_28=3$'tür. Bu konuda üstel fonksiyonu, logaritmanın tanımını ve özelliklerini, taban değiştirmeyi, üstel ve logaritmik denklemleri ve eşitsizlikleri öğreneceksin.

:::hedefler
1. Üstel fonksiyonun özelliklerini ve grafiğini bilmek.
2. Logaritmayı üs olarak tanımlamak ve değer bulmak.
3. Logaritma kurallarını ve taban değiştirmeyi uygulamak.
4. Üstel ve logaritmik denklemleri tanım kümesine dikkat ederek çözmek.
5. Logaritmik eşitsizliklerde tabana göre yön belirlemek.
:::

:::ipucu
Logaritma sorusunda önce **tanım koşullarına** bak: logaritması alınan ifade pozitif, taban pozitif ve 1'den farklı olmalıdır. Denklemi çözdükten sonra bulduğun kökü bu koşula göre **mutlaka kontrol et**.
:::

::video{id="fqUZVEKDwdw" etiket="Konu anlatımı videosu" baslik="Logaritma" kanal="Rehber Matematik"}

## 1. Üstel fonksiyon

$a>0$ ve $a\ne1$ olmak üzere $f(x)=a^x$ fonksiyonuna **üstel fonksiyon** denir.

- $a>1$ ise fonksiyon **artandır**. $x$ büyüdükçe $a^x$ büyür.
- $0<a<1$ ise fonksiyon **azalandır**.
- Grafik her zaman $(0,1)$ noktasından geçer ve $x$ eksenini kesmez. Değer kümesi $(0,\infty)$.
- $a^x=a^y$ ise $x=y$ olur (birebirdir).

**Üstel denklem:** Tabanları eşitleyip üsleri eşitle. $2^{x+1}=32$ ise $2^{x+1}=2^5$ ve $x=4$.

**Değişken değiştirme:** $3^{2x}-4\cdot3^x+3=0$ için $3^x=t$ yazılır, $t^2-4t+3=0$ ve $t=1$ ya da $t=3$. Buradan $x=0$ ya da $x=1$.

## 2. Logaritmanın tanımı

$a>0$, $a\ne1$ ve $b>0$ için

$$\log_ab=x\iff a^x=b$$

- $\log_a1=0$ ve $\log_aa=1$.
- $\log_aa^n=n$ ve $a^{\log_ab}=b$.
- **Ondalık logaritma:** Taban 10 ise yazılmaz. $\log100=2$.
- **Doğal logaritma:** Taban $e\approx2{,}718$ ise $\ln x$ yazılır.

**Tanım koşulları:** $\log_a f(x)$ için $f(x)>0$, $a>0$, $a\ne1$.

**Örnek:** $\log_28+\log_39+\log100=3+2+2=7$.

## 3. Logaritma kuralları

| Kural | Formül |
| --- | --- |
| Çarpım | $\log_a(xy)=\log_ax+\log_ay$ |
| Bölüm | $\log_a\dfrac xy=\log_ax-\log_ay$ |
| Kuvvet | $\log_ax^n=n\log_ax$ |
| Taban kuvveti | $\log_{a^m}x=\dfrac1m\log_ax$ |
| Taban değiştirme | $\log_ab=\dfrac{\log_cb}{\log_ca}$ |
| Ters | $\log_ab=\dfrac{1}{\log_ba}$ |
| Zincir | $\log_ab\cdot\log_bc=\log_ac$ |

**Örnek:** $\log_23=a$ ise $\log_312=\log_3(3\cdot4)=1+\log_34=1+\dfrac{2}{\log_23}=1+\dfrac2a=\dfrac{a+2}{a}$.

:::ipucu{baslik="Sık yapılan hata"}
$\log(x+y)$ ifadesi $\log x+\log y$ **değildir**. Toplamın logaritması açılmaz. Kural yalnızca **çarpımın** logaritması için geçerlidir.
:::

## 4. Logaritmik fonksiyon ve grafiği

$f(x)=\log_ax$ fonksiyonu $f(x)=a^x$'in tersidir. Grafikleri $y=x$ doğrusuna göre simetriktir.

- $a>1$ ise artan, $0<a<1$ ise azalandır.
- Tanım kümesi $(0,\infty)$, değer kümesi $\mathbb{R}$.
- Grafik daima $(1,0)$ noktasından geçer ve $y$ eksenini kesmez.

**Tanım kümesi örneği:** $f(x)=\log_2(-x^2+4x+5)$ için $-x^2+4x+5>0$ ve $x^2-4x-5<0$, $(x-5)(x+1)<0$ ve $-1<x<5$. Tam sayı değerleri $0,1,2,3,4$ olmak üzere beş tanedir.

## 5. Logaritmik denklemler

Denklemi $\log_af(x)=\log_ag(x)$ biçimine getirip $f(x)=g(x)$ çöz, sonra **tanım koşullarını** kontrol et.

**Örnek:** $\log_2(x+3)+\log_2(x-3)=4$ için $x+3>0$ ve $x-3>0$ olduğundan $x>3$ olmalıdır. Çarpım yazılırsa $\log_2(x^2-9)=4$ ve $x^2-9=16$, $x^2=25$ ve $x=\pm5$. $x>3$ olduğundan yalnızca $x=5$ kalır.

**Tabanlı denklem:** $\log_x16=2$ ise $x^2=16$ ve $x=4$ ($x=-4$ tabanın pozitif olması koşuluyla elenir).

## 6. Eşitsizlikler

- $a>1$ ise $\log_ax>\log_ay\iff x>y>0$. **Yön korunur.**
- $0<a<1$ ise $\log_ax>\log_ay\iff 0<x<y$. **Yön değişir.**
- Üstel eşitsizlikte de aynı: $a>1$ için $a^x<a^y\iff x<y$, $0<a<1$ için yön değişir.

**Örnek:** $\log_{1/2}(x-1)>\log_{1/2}3$ için taban $0<a<1$ olduğundan $0<x-1<3$ ve $1<x<4$.

:::baglanti
Üstel fonksiyon ve logaritma, **fonksiyonların** ters fonksiyon konusunun en güzel örneğidir. **Dizilerde** geometrik dizilerin toplamı ve **limitte** $e$ sayısı bu konuya dayanır. **Türev ve integralde** $e^x$ ve $\ln x$ fonksiyonları yer alır. **Kimyada** pH ve **fizikte** desibel logaritmik ölçeklerdir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tanım | $\log_ab=x\iff a^x=b$ |
| Koşul | Taban $>0$, $\ne1$, içi $>0$ |
| Çarpım | $\log(xy)=\log x+\log y$ |
| Kuvvet | $\log x^n=n\log x$ |
| Taban değiştirme | $\log_ab=\dfrac{\log_cb}{\log_ca}$ |
| Denklem | Çöz, sonra tanım kümesini kontrol et |
| Eşitsizlik | Taban $<1$ ise yön değişir |

## Mini test

:::soru{cevap="A"}
$\log_23=a$ olduğuna göre $\log_312$ değeri $a$ cinsinden aşağıdakilerden hangisidir?

- A) $\dfrac{a+2}{a}$
- B) $\dfrac{a}{a+2}$
- C) $2a+1$
- D) $a+2$
- E) $\dfrac2a$

---

1. $\log_312=\log_3(3\cdot4)=\log_33+\log_34=1+\log_34$.
2. $\log_34=\dfrac{\log_24}{\log_23}=\dfrac2a$.
3. Toplam $1+\dfrac2a=\dfrac{a+2}{a}$. Doğru cevap A.

Diğer şıklar: **$\dfrac{a}{a+2}$** sonucun tersi yazılmış / **$2a+1$** $\log_34$ yerine $2\log_23$ alınmış / **$a+2$** taban değiştirmede $a$ ile bölme yapılmamış / **$\dfrac2a$** $\log_33=1$ terimi unutulmuş.
:::

:::soru{cevap="C"}
$\log_2(x+3)+\log_2(x-3)=4$ denkleminin çözüm kümesi aşağıdakilerden hangisidir?

- A) $\{-5\}$
- B) $\{2\}$
- C) $\{5\}$
- D) $\{13\}$
- E) $\{25\}$

---

1. Tanım koşulu: $x+3>0$ ve $x-3>0$, yani $x>3$.
2. Çarpım olarak yazılırsa $\log_2(x^2-9)=4$ ve $x^2-9=16$, $x^2=25$.
3. $x=\pm5$ bulunur, $x>3$ olduğundan yalnızca $x=5$ kalır. Doğru cevap C.

Diğer şıklar: **$\{-5\}$** tanım koşulu kontrol edilmemiş, negatif kök alınmış / **$\{2\}$** logaritmaların toplamı içeride de toplanmış, $2x=4$ / **$\{13\}$** yalnızca ilk terim 4'e eşitlenmiş, $x+3=16$ / **$\{25\}$** $x^2=25$ iken kök almak unutulmuş.
:::

:::soru{cevap="B"}
$3^{2x}-4\cdot3^x+3=0$ denkleminin çözüm kümesindeki elemanların toplamı kaçtır?

- A) 0
- B) 1
- C) 2
- D) 3
- E) 4

---

1. $3^x=t$ yazılırsa $t^2-4t+3=0$ ve $(t-1)(t-3)=0$, yani $t=1$ ya da $t=3$.
2. $3^x=1$ ise $x=0$, $3^x=3$ ise $x=1$.
3. Toplam $0+1=1$. Doğru cevap B.

Diğer şıklar: **0** yalnızca $x=0$ çözümü alınmış / **2** $t=1$ ve $t=3$ için $x$ değerleri $1$ ve $1$ sanılmış / **3** $t$ değeri $x$ yerine yazılmış / **4** $t$ değerlerinin toplamı $1+3$ alınmış.
:::

:::soru{cevap="C"}
$f(x)=\log_2(-x^2+4x+5)$ fonksiyonunun tanım kümesinde **kaç tam sayı** vardır?

- A) 3
- B) 4
- C) 5
- D) 6
- E) 7

---

1. Logaritmanın içi pozitif olmalıdır: $-x^2+4x+5>0$, yani $x^2-4x-5<0$.
2. $(x-5)(x+1)<0$ ve $-1<x<5$.
3. Tam sayılar $0,1,2,3,4$ olup beş tanedir. Doğru cevap C.

Diğer şıklar: **3** yalnızca $1,2,3$ alınmış, ortadaki sayılar sayılmış / **4** yalnızca pozitif tam sayılar sayılmış, sıfır unutulmuş / **6** uçlardan biri dahil edilmiş / **7** iki uç da dahil edilmiş.
:::

## Kendini dene

:::dene
1. $\log_327$ kaçtır? => 3.
2. $\log2+\log5$ kaçtır? => $\log10=1$.
3. $2^x=64$ ise $x$ kaçtır? => 6.
4. $\log_ab$ ifadesinde $a$ hangi koşulları sağlamalıdır? => $a>0$ ve $a\ne1$.
5. $\log_{1/2}x>\log_{1/2}4$ eşitsizliğinde yön değişir mi? => Evet, taban 1'den küçük olduğu için $0<x<4$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, true from public.topics where subject_id = 'ayt-mat' and name = 'Logaritma'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bankadan çektiğin kredinin aylık taksitlerini, bir bakteri kolonisinin saat saat çoğalmasını ya da bir merdivenin basamak yüksekliklerini düşün. Hepsi bir **sıra ile dizilmiş sayılardır**. Matematikte böyle sıralı sayı listesine **dizi** denir. Bu konuda dizinin tanımını, **aritmetik ve geometrik dizileri**, terim ve toplam formüllerini, sonsuz geometrik serinin toplamını ve toplam sembolünü ($\sum$) öğreneceksin. Diziler, limit ve integrale geçiş için önemli bir köprüdür.

:::hedefler
1. Dizinin genel terimini kullanarak terim hesaplamak.
2. Aritmetik dizide ortak farkı ve $n$. terimi bulmak.
3. Geometrik dizide ortak çarpanı ve $n$. terimi bulmak.
4. İlk $n$ terimin toplamını hesaplamak.
5. Sonsuz geometrik serinin toplamını bulmak.
6. $\sum$ sembolünün özelliklerini kullanmak.
:::

:::ipucu
Terimler arasında **fark sabitse** aritmetik, **oran sabitse** geometrik dizidir. Toplam sorularında ilk ve son terimi bul, terim sayısını doğru say. Terim sayısı hatası bu konudaki en sık hatadır.
:::

::video{id="rZErPyBYEZo" etiket="Konu anlatımı videosu" baslik="Diziler" kanal="Rehber Matematik"}

## 1. Dizi kavramı

$a:\mathbb{N}^+\to\mathbb{R}$ fonksiyonuna **dizi** denir. $a(n)=a_n$ yazılır ve $n$. terim anlamına gelir.

**Genel terim örnekleri:**

- $a_n=3n-2$ ise $1,4,7,10,\dots$
- $a_n=2^n$ ise $2,4,8,16,\dots$
- $a_n=(-1)^n$ ise $-1,1,-1,1,\dots$

**Terimler arası ilişki:** $a_n$ ile $S_n$ (ilk $n$ terimin toplamı) arasında $a_n=S_n-S_{n-1}$ ($n\ge2$) ve $a_1=S_1$ bağıntısı vardır.

**Monotonluk:** Her $n$ için $a_{n+1}>a_n$ ise dizi **artan**, $a_{n+1}<a_n$ ise **azalandır**.

## 2. Aritmetik dizi

Ardışık terimler arasındaki fark sabit ise dizi aritmetiktir. Bu sabite **ortak fark** ($d$) denir.

$$a_n=a_1+(n-1)d,\qquad a_n=a_k+(n-k)d$$

**Toplam:**

$$S_n=\dfrac{n(a_1+a_n)}{2}=\dfrac{n\left[2a_1+(n-1)d\right]}{2}$$

**Özellikler:**

- Ortadaki terim, yanındaki iki terimin aritmetik ortalamasıdır: $a_n=\dfrac{a_{n-1}+a_{n+1}}{2}$.
- Baştan ve sondan eşit uzaklıktaki terimlerin toplamı sabittir.

**Örnek:** $a_3=7$ ve $a_7=19$ ise $4d=12$ ve $d=3$. $a_1=7-6=1$ ve $a_{10}=1+9\cdot3=28$.

**Toplam örneği:** $a_n=3n-2$ için ilk terim 1, yirminci terim $58$. $S_{20}=\dfrac{20(1+58)}{2}=590$.

## 3. Geometrik dizi

Ardışık terimlerin oranı sabit ise dizi geometriktir. Bu sabite **ortak çarpan** ($r$) denir.

$$a_n=a_1r^{n-1},\qquad a_n=a_kr^{n-k}$$

**Toplam:** $r\ne1$ için

$$S_n=a_1\dfrac{r^n-1}{r-1}=a_1\dfrac{1-r^n}{1-r}$$

**Özellik:** Ortadaki terim, yanındaki iki terimin **geometrik ortalamasıdır**: $a_n^2=a_{n-1}\cdot a_{n+1}$.

**Örnek:** $a_2=6$ ve $a_5=162$ ise $r^3=\dfrac{162}{6}=27$ ve $r=3$. $a_1=2$ ve $a_7=2\cdot3^6=1458$.

## 4. Sonsuz geometrik seri

Terim sayısı sonsuz olan geometrik toplam, **yalnızca $\lvert r\rvert<1$ ise** bir sayıya yaklaşır:

$$a_1+a_1r+a_1r^2+\dots=\dfrac{a_1}{1-r}$$

**Örnek:** $10+5+\dfrac52+\dots$ serisinde $a_1=10$ ve $r=\dfrac12$. Toplam $\dfrac{10}{1-\frac12}=20$.

**Tekrar eden ondalık sayılar:** $0{,}\overline{3}=0{,}3+0{,}03+0{,}003+\dots=\dfrac{0{,}3}{1-0{,}1}=\dfrac13$.

**Sıçrayan top problemi:** Bir top $h$ yüksekten düşüp her seferinde önceki yüksekliğin $r$ katı kadar sıçrıyorsa toplam yol $h+2h\cdot\dfrac{r}{1-r}$ olur.

## 5. Toplam sembolü

$\displaystyle\sum_{k=1}^{n}a_k=a_1+a_2+\dots+a_n$ biçiminde gösterilir.

**Özellikler:**

- $\displaystyle\sum(a_k+b_k)=\sum a_k+\sum b_k$
- $\displaystyle\sum c\,a_k=c\sum a_k$
- $\displaystyle\sum_{k=1}^{n}c=nc$ (sabit toplamı terim sayısı çarpı sabit)

**Bilinen toplamlar:**

| Toplam | Sonuç |
| --- | --- |
| $1+2+\dots+n$ | $\dfrac{n(n+1)}{2}$ |
| $1+3+\dots+(2n-1)$ | $n^2$ |
| $2+4+\dots+2n$ | $n(n+1)$ |
| $1^2+2^2+\dots+n^2$ | $\dfrac{n(n+1)(2n+1)}{6}$ |

**Örnek:** İlk 20 tek sayının toplamı $20^2=400$.

**Teleskopik toplam:** $\dfrac{1}{k(k+1)}=\dfrac1k-\dfrac1{k+1}$ yazılırsa ara terimler birbirini götürür. $\displaystyle\sum_{k=1}^{n}\dfrac{1}{k(k+1)}=1-\dfrac{1}{n+1}$.

:::baglanti
Dizilerde ortak çarpan konusu, **logaritma ve üstel fonksiyon** bilgisini kullanır. **Limitte** dizinin yakınsaklığı ve sonsuz seri, bu konunun devamıdır. **İntegralde** alt ve üst toplam fikri, sonsuz sayıda küçük terimin toplamına dayanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Aritmetik | $a_n=a_1+(n-1)d$ |
| Aritmetik toplam | $\dfrac{n(a_1+a_n)}{2}$ |
| Geometrik | $a_n=a_1r^{n-1}$ |
| Geometrik toplam | $a_1\dfrac{r^n-1}{r-1}$ |
| Sonsuz seri | $\dfrac{a_1}{1-r}$, $\lvert r\rvert<1$ |
| Tek sayılar | İlk $n$ tanesi $n^2$ |
| $a_n$ ve $S_n$ | $a_n=S_n-S_{n-1}$ |

## Mini test

:::soru{cevap="C"}
Bir aritmetik dizide $a_3=7$ ve $a_7=19$ olduğuna göre $a_{10}$ kaçtır?

- A) 22
- B) 25
- C) 28
- D) 30
- E) 31

---

1. $a_7-a_3=4d=12$ olduğundan $d=3$.
2. $a_{10}=a_7+3d=19+9=28$. Doğru cevap C.

Diğer şıklar: **22** yalnızca bir terim ilerlenmiş, $19+3$ / **25** $a_9$ bulunmuş, terim sayısı bir eksik / **30** $d\cdot n=3\cdot10$ alınmış / **31** $a_{11}$ bulunmuş, terim sayısı bir fazla.
:::

:::soru{cevap="D"}
Bir geometrik dizide $a_2=6$ ve $a_5=162$ olduğuna göre $a_7$ kaçtır?

- A) 54
- B) 486
- C) 729
- D) 1458
- E) 4374

---

1. $a_5=a_2\cdot r^3$ olduğundan $r^3=\dfrac{162}{6}=27$ ve $r=3$.
2. $a_7=a_5\cdot r^2=162\cdot9=1458$. Doğru cevap D.

Diğer şıklar: **54** $a_4$ bulunmuş / **486** $a_6$ bulunmuş / **729** yalnızca $r^6$ alınmış / **4374** $a_8$ bulunmuş.
:::

:::soru{cevap="E"}
$10+5+\dfrac52+\dfrac54+\dots$ sonsuz toplamının değeri kaçtır?

- A) $-10$
- B) 5
- C) 10
- D) 15
- E) 20

---

1. Dizi geometriktir. $a_1=10$ ve ortak çarpan $r=\dfrac12$.
2. $\lvert r\rvert<1$ olduğundan toplam $\dfrac{a_1}{1-r}=\dfrac{10}{1/2}=20$. Doğru cevap E.

Diğer şıklar: **$-10$** $r$ yerine $2$ alınmış, $\dfrac{10}{1-2}$ / **5** $a_1\cdot r$ hesaplanmış / **10** yalnızca ilk terim alınmış / **15** yalnızca ilk iki terim toplanmış.
:::

:::soru{cevap="A"}
$a_n=3n-2$ aritmetik dizisinin ilk 20 teriminin toplamı kaçtır?

- A) 590
- B) 610
- C) 630
- D) 1180
- E) 1220

---

1. $a_1=3\cdot1-2=1$ ve $a_{20}=3\cdot20-2=58$.
2. $S_{20}=\dfrac{20(1+58)}{2}=10\cdot59=590$. Doğru cevap A.

Diğer şıklar: **610** $a_{20}$ yerine $3\cdot20=60$ alınmış / **630** $-2$'ler unutulmuş, $3\cdot\dfrac{20\cdot21}{2}$ / **1180** 2'ye bölmek unutulmuş / **1220** hem $a_{20}=60$ alınmış hem 2'ye bölünmemiş.
:::

## Kendini dene

:::dene
1. $2,5,8,11,\dots$ dizisinin ortak farkı nedir? => 3.
2. $3,6,12,24,\dots$ dizisinin ortak çarpanı nedir? => 2.
3. İlk 10 doğal sayının toplamı kaçtır? => 55.
4. $\dfrac12+\dfrac14+\dfrac18+\dots$ sonsuz toplamı kaçtır? => 1.
5. $S_n=n^2+2n$ ise $a_1$ kaçtır? => $S_1=3$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, true from public.topics where subject_id = 'ayt-mat' and name = 'Diziler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir arabanın hız göstergesi, tam o anda kaç kilometre hızla gittiğini gösterir. Ama hız "yol bölü zaman" demektir ve **bir anda** geçen zaman sıfırdır. Sıfıra bölemediğimiz halde "anlık hız" nasıl bulunur? Cevap **limittir**: Zaman aralığını sıfıra yaklaştırırken oranın neye **yaklaştığına** bakarsın. Limit, bir fonksiyonun bir noktaya **yaklaşırken** aldığı değeri anlatır. **Süreklilik** ise grafiğin kalemi kaldırmadan çizilebilmesidir. Bu konu türevin ve integralin temelidir.

:::hedefler
1. Limitin ne anlattığını ve soldan, sağdan limiti yorumlamak.
2. Limit kurallarını kullanmak.
3. $\dfrac00$ belirsizliğini çarpanlara ayırarak ve eşlenikle çözmek.
4. $x\to\infty$ için limit ve yatay asimptotu bulmak.
5. $\dfrac{\sin x}{x}$ limitini kullanmak.
6. Bir noktada ve aralıkta sürekliliği incelemek, parametre bulmak.
:::

:::ipucu
Limit sorusunda **önce yerine koy**. Sayı çıkıyorsa iş bitmiştir. $\dfrac00$ çıkıyorsa belirsizlik vardır: çarpanlara ayır, sadeleştir, tekrar yerine koy. $\dfrac{k}{0}$ ($k\ne0$) çıkıyorsa limit $\pm\infty$ ya da yoktur, işaretlere bak.
:::

::video{id="5fekZ4ZlGcM" etiket="Konu anlatımı videosu" baslik="Limit ve Süreklilik" kanal="Matematiğin Güler Yüzü"}

## 1. Limit kavramı

$\displaystyle\lim_{x\to a}f(x)=L$, $x$, $a$'ya **yaklaşırken** ($x\ne a$) $f(x)$'in $L$'ye yaklaştığını anlatır. $f(a)$ değerinin ne olduğu ya da tanımlı olup olmadığı limiti **etkilemez**.

**Soldan ve sağdan limit:**

- $\displaystyle\lim_{x\to a^-}f(x)$: $a$'ya sol taraftan yaklaşırken.
- $\displaystyle\lim_{x\to a^+}f(x)$: $a$'ya sağ taraftan yaklaşırken.

Limitin var olması için **soldan ve sağdan limit eşit** olmalıdır.

**Örnek:** $f(x)=\begin{cases}x+1 & x<2\\ 5-x & x\ge2\end{cases}$ için $\displaystyle\lim_{x\to2^-}f(x)=3$ ve $\displaystyle\lim_{x\to2^+}f(x)=3$. Limit 3'tür, $f(2)=3$ de olur.

## 2. Limit kuralları

$\displaystyle\lim_{x\to a}f(x)=L$ ve $\displaystyle\lim_{x\to a}g(x)=M$ ise

- $\displaystyle\lim(f\pm g)=L\pm M$
- $\displaystyle\lim(f\cdot g)=L\cdot M$
- $\displaystyle\lim\dfrac fg=\dfrac LM$ ($M\ne0$)
- $\displaystyle\lim\sqrt[n]{f(x)}=\sqrt[n]{L}$ (kök tanımlıysa)
- $\displaystyle\lim c\cdot f(x)=cL$

Polinomlarda limit, değeri **yerine koymak** demektir.

## 3. Belirsizlikler

**$\dfrac00$ belirsizliği:** Pay ve payda aynı anda sıfır oluyorsa ortak çarpan vardır.

**Örnek:** $\displaystyle\lim_{x\to2}\dfrac{x^2-5x+6}{x-2}=\lim_{x\to2}\dfrac{(x-2)(x-3)}{x-2}=\lim_{x\to2}(x-3)=-1$.

**Kök varsa eşlenikle çarp:** $\displaystyle\lim_{x\to0}\dfrac{\sqrt{x+4}-2}{x}$ için pay ve paydayı $\sqrt{x+4}+2$ ile çarp: $\dfrac{x}{x(\sqrt{x+4}+2)}=\dfrac{1}{\sqrt{x+4}+2}\to\dfrac14$.

**$\dfrac\infty\infty$ belirsizliği ($x\to\pm\infty$, rasyonel fonksiyon):**

| Durum | Limit |
| --- | --- |
| Pay derecesi $<$ payda derecesi | 0 |
| Dereceler eşit | Baş katsayılar oranı |
| Pay derecesi $>$ payda derecesi | $\pm\infty$ |

**Örnek:** $\displaystyle\lim_{x\to\infty}\dfrac{3x^2-5x+1}{2x^2+x-7}=\dfrac32$.

**$\infty-\infty$:** Kök varsa eşlenikle çarp. $\displaystyle\lim_{x\to\infty}\left(\sqrt{x^2+x}-x\right)=\dfrac12$.

## 4. Trigonometrik limitler

$$\lim_{x\to0}\dfrac{\sin x}{x}=1,\qquad \lim_{x\to0}\dfrac{\tan x}{x}=1,\qquad \lim_{x\to0}\dfrac{1-\cos x}{x^2}=\dfrac12$$

**Kural:** İçteki ifade ile paydaki aynıysa sonuç 1'dir. $\displaystyle\lim_{x\to0}\dfrac{\sin ax}{bx}=\dfrac ab$.

**Örnek:** $\displaystyle\lim_{x\to0}\dfrac{\tan4x}{2x}=\lim\dfrac{\tan4x}{4x}\cdot\dfrac{4x}{2x}=1\cdot2=2$.

## 5. Süreklilik

$f$ fonksiyonu $x=a$ noktasında **sürekli** ise üç koşul birlikte sağlanır:

1. $f(a)$ tanımlıdır.
2. $\displaystyle\lim_{x\to a}f(x)$ vardır.
3. $\displaystyle\lim_{x\to a}f(x)=f(a)$.

**Süreksizlik çeşitleri:**

| Tür | Anlamı |
| --- | --- |
| Kaldırılabilir | Limit var ama $f(a)$ farklı ya da tanımsız |
| Sıçrama | Soldan ve sağdan limit farklı |
| Sonsuz | Limit $\pm\infty$ (dikey asimptot) |

**Sürekli fonksiyonlar:** Polinomlar her yerde, rasyonel fonksiyonlar paydayı sıfır yapmayan noktalarda, $\sin$ ve $\cos$ her yerde süreklidir. Sürekli iki fonksiyonun toplamı, çarpımı ve (payda sıfır değilse) bölümü süreklidir.

**Parametre bulma örneği:** $f(x)=\begin{cases}x+a & x<1\\ 5 & x=1\\ bx-1 & x>1\end{cases}$ fonksiyonu $x=1$'de sürekli ise soldan limit $1+a=5$ ve $a=4$, sağdan limit $b-1=5$ ve $b=6$. $a+b=10$.

## 6. Asimptotlar

- **Yatay asimptot:** $\displaystyle\lim_{x\to\pm\infty}f(x)=L$ ise $y=L$.
- **Dikey asimptot:** Payda sıfır, pay sıfır değilse $x=a$.

**Örnek:** $f(x)=\dfrac{2x+1}{x-3}$ için $x=3$ dikey, $y=2$ yatay asimptottur.

:::baglanti
Limit, **türevin** tanımının kendisidir: Türev, ortalama değişim hızının limitidir. **İntegral** küçük parçaların toplamının limiti olarak tanımlanır. **Fonksiyonlar** konusunda parçalı fonksiyonlar bu konunun malzemesidir. **Diziler**deki sonsuz seri de bir limittir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Var olma | Soldan limit = sağdan limit |
| $\dfrac00$ | Çarpanlara ayır ya da eşlenikle çarp |
| $\dfrac\infty\infty$ | Dereceleri karşılaştır |
| $\dfrac{\sin x}{x}$ | $x\to0$ için 1 |
| Süreklilik | $\lim f(x)=f(a)$ |
| Parametre | Soldan ve sağdan limiti eşitle |
| Asimptot | Dikey: payda 0, yatay: limit |

## Mini test

:::soru{cevap="A"}
$\displaystyle\lim_{x\to2}\dfrac{x^2-5x+6}{x-2}$ limitinin değeri kaçtır?

- A) $-1$
- B) 0
- C) 1
- D) 2
- E) Limit yoktur

---

1. $x=2$ yazılırsa $\dfrac00$ belirsizliği çıkar.
2. Pay çarpanlarına ayrılır: $x^2-5x+6=(x-2)(x-3)$.
3. Sadeleştirince $\displaystyle\lim_{x\to2}(x-3)=-1$. Doğru cevap A.

Diğer şıklar: **0** payın sıfır olması limiti sıfır yapar sanılmış / **1** işaret hatası yapılmış, $3-2$ alınmış / **2** $x$ yerine $2$ yazılmış / **Limit yoktur** $\dfrac00$ ifadesi limitin olmadığı anlamında yorumlanmış.
:::

:::soru{cevap="C"}
$\displaystyle\lim_{x\to\infty}\dfrac{3x^2-5x+1}{2x^2+x-7}$ limitinin değeri kaçtır?

- A) 0
- B) 1
- C) $\dfrac32$
- D) 3
- E) $\infty$

---

1. Pay ve payda aynı dereceden polinomlardır.
2. Bu durumda limit, baş katsayıların oranıdır: $\dfrac32$. Doğru cevap C.

Diğer şıklar: **0** payda derecesi büyük sanılmış / **1** kat sayılar dikkate alınmamış / **3** yalnızca pay katsayısı alınmış / **$\infty$** pay büyük sanılmış.
:::

:::soru{cevap="D"}
$\displaystyle\lim_{x\to0}\dfrac{\tan4x}{2x}$ limitinin değeri kaçtır?

- A) 0
- B) $\dfrac12$
- C) 1
- D) 2
- E) 4

---

1. $\dfrac{\tan4x}{2x}=\dfrac{\tan4x}{4x}\cdot\dfrac{4x}{2x}$ yazılır.
2. $x\to0$ iken $\dfrac{\tan4x}{4x}\to1$ ve $\dfrac{4x}{2x}=2$.
3. Limit $1\cdot2=2$. Doğru cevap D.

Diğer şıklar: **0** $x\to0$ olduğu için sonuç sıfır sanılmış / **$\dfrac12$** katsayı oranı ters alınmış / **1** $\dfrac{\tan x}{x}=1$ kuralı doğrudan uygulanmış / **4** paydaki $2$ ile bölme yapılmamış.
:::

:::soru{cevap="E"}
$$f(x)=\begin{cases}x+a & x<1\\ 5 & x=1\\ bx-1 & x>1\end{cases}$$

fonksiyonu $x=1$ noktasında sürekli olduğuna göre $a+b$ kaçtır?

- A) 4
- B) 5
- C) 6
- D) 9
- E) 10

---

1. Süreklilik için soldan limit, sağdan limit ve $f(1)=5$ birbirine eşit olmalıdır.
2. Soldan limit $1+a=5$ ve $a=4$.
3. Sağdan limit $b-1=5$ ve $b=6$.
4. $a+b=4+6=10$. Doğru cevap E.

Diğer şıklar: **4** yalnızca $a$ bulunmuş / **5** $f(1)$ değeri yazılmış / **6** yalnızca $b$ bulunmuş / **9** $b$ yerine $f(1)=5$ alınmış, $4+5$.
:::

## Kendini dene

:::dene
1. $\displaystyle\lim_{x\to3}(2x+1)$ kaçtır? => 7.
2. $\displaystyle\lim_{x\to0}\dfrac{\sin x}{x}$ kaçtır? => 1.
3. $\displaystyle\lim_{x\to\infty}\dfrac{1}{x}$ kaçtır? => 0.
4. $\displaystyle\lim_{x\to1}\dfrac{x^2-1}{x-1}$ kaçtır? => $\lim(x+1)=2$.
5. Soldan ve sağdan limiti farklı olan fonksiyon o noktada sürekli midir? => Hayır, limit yoktur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, true from public.topics where subject_id = 'ayt-mat' and name = 'Limit ve Süreklilik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir arabanın hız göstergesi, yolun zamanla ne kadar hızlı değiştiğini gösterir. Bir şirketin kârının hangi üretim miktarında en yüksek olduğunu, bir kutunun hangi ölçülerde en az malzemeyle yapılacağını bulmak için de bir şeyin başka bir şeye göre **ne kadar hızlı değiştiğini** bilmen gerekir. Bu hıza **türev** denir. Geometrik olarak türev, eğriye çizilen teğetin **eğimidir**. Bu konuda türevin tanımını, kurallarını, teğet ve normal denklemlerini, artan ve azalan aralıkları, **yerel en büyük ve en küçük değerleri** ve en iyi (optimizasyon) problemlerini öğreneceksin.

:::hedefler
1. Türevi limitle tanımlamak ve geometrik anlamını yorumlamak.
2. Toplam, çarpım, bölüm ve zincir kurallarıyla türev almak.
3. Teğet ve normal doğrusunun denklemini yazmak.
4. Birinci türevle artan ve azalan aralıkları bulmak.
5. Yerel ekstremum noktalarını belirlemek.
6. İkinci türevle konkavlık ve büküm noktasını yorumlamak.
7. En büyük, en küçük değer problemlerini çözmek.
:::

:::ipucu
Türev almada en sık yapılan hata **zincir kuralını unutmaktır**. $\left(f(g(x))\right)'=f'(g(x))\cdot g'(x)$. Dıştan içe doğru türev al ve içteki ifadenin türevini mutlaka çarp.
:::

::video{id="hwO4tx1b1WU" etiket="Konu anlatımı videosu" baslik="Türev" kanal="Rehber Matematik"}

## 1. Türevin tanımı

$f$ fonksiyonunun $x=a$ noktasındaki türevi

$$f'(a)=\lim_{h\to0}\dfrac{f(a+h)-f(a)}{h}=\lim_{x\to a}\dfrac{f(x)-f(a)}{x-a}$$

limitidir. Limit varsa fonksiyon $a$'da **türevlidir**.

**Geometrik anlamı:** $f'(a)$, $y=f(x)$ eğrisine $(a,f(a))$ noktasında çizilen **teğetin eğimidir.**

::sim{tur="turev"}

**Fiziksel anlamı:** Yer değiştirme $s(t)$ ise anlık hız $v(t)=s'(t)$, anlık ivme $a(t)=v'(t)=s''(t)$.

**Türevlenebilirlik:** Soldan ve sağdan türev eşit olmalıdır. Sivri uçlu noktalarda ($\lvert x\rvert$ fonksiyonunun $x=0$ noktası gibi) fonksiyon sürekli ama **türevsizdir**. Türevli olan fonksiyon her zaman süreklidir, tersi doğru değildir.

## 2. Türev kuralları

| Fonksiyon | Türevi |
| --- | --- |
| $c$ (sabit) | $0$ |
| $x^n$ | $nx^{n-1}$ |
| $\sin x$ | $\cos x$ |
| $\cos x$ | $-\sin x$ |
| $\tan x$ | $\dfrac{1}{\cos^2x}=1+\tan^2x$ |
| $e^x$ | $e^x$ |
| $a^x$ | $a^x\ln a$ |
| $\ln x$ | $\dfrac1x$ |
| $\log_ax$ | $\dfrac{1}{x\ln a}$ |

**İşlem kuralları:**

- $(f\pm g)'=f'\pm g'$
- $(c\,f)'=c\,f'$
- **Çarpım:** $(f\cdot g)'=f'g+fg'$
- **Bölüm:** $\left(\dfrac fg\right)'=\dfrac{f'g-fg'}{g^2}$
- **Zincir:** $\left(f(g(x))\right)'=f'(g(x))\cdot g'(x)$

**Örnek:** $f(x)=(x^2+1)^3$ için dıştan türev $3(x^2+1)^2$, içten türev $2x$. $f'(x)=6x(x^2+1)^2$ ve $f'(1)=6\cdot4=24$.

**Örnek:** $f(x)=x^3-3x^2+2x$ için $f'(x)=3x^2-6x+2$ ve $f'(2)=12-12+2=2$.

## 3. Teğet ve normal

$y=f(x)$ eğrisinin $x=a$ noktasındaki

- **Teğet:** $y-f(a)=f'(a)(x-a)$
- **Normal:** $y-f(a)=-\dfrac{1}{f'(a)}(x-a)$

Normal, teğete o noktada diktir. Eğimleri çarpımı $-1$ olur.

**Örnek:** $y=x^2-2x+3$ eğrisinin $x=2$ noktasında $f(2)=3$ ve $f'(x)=2x-2$ ile $f'(2)=2$. Teğet: $y-3=2(x-2)$, yani $y=2x-1$. Normal: $y-3=-\dfrac12(x-2)$, yani $y=-\dfrac{x}{2}+4$.

**Yatay teğet:** $f'(a)=0$ olan noktalarda teğet $x$ eksenine paraleldir.

## 4. Artan ve azalan fonksiyonlar, ekstremum

- Bir aralıkta $f'(x)>0$ ise $f$ **artan**.
- Bir aralıkta $f'(x)<0$ ise $f$ **azalan**.
- $f'(a)=0$ olan noktalar **kritik noktadır**.

**Yerel ekstremum:** Kritik noktada $f'$ işareti değişiyorsa ekstremum vardır.

- $f'$ işareti $+\to-$ ise **yerel maksimum**.
- $f'$ işareti $-\to+$ ise **yerel minimum**.

**Örnek:** $f(x)=x^3-3x^2-9x+5$ için $f'(x)=3x^2-6x-9=3(x-3)(x+1)$. Kritik noktalar $-1$ ve $3$. İşaret tablosu $+,-,+$. $x=-1$ yerel maksimum ($f(-1)=10$), $x=3$ yerel minimum ($f(3)=-22$).

## 5. İkinci türev ve konkavlık

- $f''(x)>0$ ise grafik **konveks** (içbükey, "çanak" gibi).
- $f''(x)<0$ ise grafik **konkav** (dışbükey, "tepe" gibi).
- $f''$ işaret değiştiriyorsa o nokta **büküm noktasıdır**.

**İkinci türev testi:** $f'(a)=0$ ve $f''(a)>0$ ise yerel minimum, $f''(a)<0$ ise yerel maksimum.

## 6. Maksimum ve minimum problemleri

1. Maksimum ya da minimum yapılacak büyüklüğü yaz.
2. Verilen koşulla **tek değişkene** indir.
3. Türevi al, sıfıra eşitle.
4. Bulunan değerin gerçekten en büyük ya da en küçük olduğunu kontrol et.

**Örnek:** Çevresi 60 m olan dikdörtgenin kenarları $x$ ve $30-x$ olur. Alan $A(x)=x(30-x)=30x-x^2$. $A'(x)=30-2x=0$ ve $x=15$. Alan $15\cdot15=225\ \text{m}^2$ ile en büyüktür, yani **kare**.

## 7. L'Hospital kuralı

$\dfrac00$ ya da $\dfrac\infty\infty$ belirsizliğinde pay ve paydanın **ayrı ayrı** türevi alınarak limit bulunabilir:

$$\lim\dfrac{f(x)}{g(x)}=\lim\dfrac{f'(x)}{g'(x)}$$

**Örnek:** $\displaystyle\lim_{x\to0}\dfrac{\sin3x}{x}=\lim_{x\to0}\dfrac{3\cos3x}{1}=3$.

Dikkat: Bölümün türevi alınmaz, pay ve payda ayrı ayrı türetilir.

:::baglanti
Türev, **limit** konusunun doğrudan uygulamasıdır. **Parabolün** tepe noktası $f'(x)=0$ olduğu nokta olarak yeniden bulunur. **İntegral**, türevin tersi işlemdir. **Fizikte** hız ve ivme kavramları, **kimyada** tepkime hızı türevin anlamlarıdır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tanım | Limit: $\dfrac{f(a+h)-f(a)}{h}$ |
| Geometrik | Teğet eğimi |
| Zincir | Dıştan türev $\times$ içten türev |
| Teğet | $y-f(a)=f'(a)(x-a)$ |
| Normal | Eğimi $-\dfrac1{f'(a)}$ |
| Artan | $f'>0$ |
| Yerel ekstremum | $f'=0$ ve işaret değişir |
| Büküm | $f''$ işaret değiştirir |
| L'Hospital | Pay ve paydanın ayrı türevi |

## Mini test

:::soru{cevap="C"}
$f(x)=x^3-3x^2+2x$ olduğuna göre $f'(2)$ kaçtır?

- A) $-2$
- B) 0
- C) 2
- D) 8
- E) 12

---

1. $f'(x)=3x^2-6x+2$.
2. $f'(2)=3\cdot4-6\cdot2+2=12-12+2=2$. Doğru cevap C.

Diğer şıklar: **$-2$** $+2$ terimi negatif alınmış / **0** sabit terimin türevi eklenmemiş ya da $f(2)=0$ alınmış / **8** $-6x$ yerine $-3x$ yazılmış, $12-6+2$ / **12** yalnızca $3x^2$ terimi hesaplanmış.
:::

:::soru{cevap="B"}
$y=x^2-2x+3$ eğrisine $x=2$ apsisli noktasında çizilen teğetin denklemi aşağıdakilerden hangisidir?

- A) $y=-\dfrac{x}{2}+4$
- B) $y=2x-1$
- C) $y=2x+1$
- D) $y=3x-3$
- E) $y=2x+3$

---

1. $f(2)=4-4+3=3$ olduğundan nokta $(2,3)$.
2. $f'(x)=2x-2$ ve $f'(2)=2$.
3. Teğet $y-3=2(x-2)$, yani $y=2x-1$. Doğru cevap B.

Diğer şıklar: **$y=-\dfrac{x}{2}+4$** teğet yerine normal yazılmış / **$y=2x+1$** denklem açılırken işaret hatası yapılmış / **$y=3x-3$** eğim yerine $f(2)=3$ alınmış / **$y=2x+3$** $y$ eksenini kesen sabit terim teğet sanılmış.
:::

:::soru{cevap="E"}
$f(x)=x^3-3x^2-9x+5$ fonksiyonunun **yerel maksimum değeri ile yerel minimum değeri arasındaki fark** kaçtır?

- A) 4
- B) 10
- C) 12
- D) 22
- E) 32

---

1. $f'(x)=3x^2-6x-9=3(x-3)(x+1)$. Kritik noktalar $x=-1$ ve $x=3$.
2. İşaret $+,-,+$ olduğundan $x=-1$ yerel maksimum, $x=3$ yerel minimumdur.
3. $f(-1)=-1-3+9+5=10$ ve $f(3)=27-27-27+5=-22$.
4. Fark $10-(-22)=32$. Doğru cevap E.

Diğer şıklar: **4** kritik noktaların $x$ değerleri farkı alınmış / **10** yalnızca yerel maksimum değeri yazılmış / **12** değerler toplanıp işaret düşürülmüş, $\lvert10-22\rvert$ / **22** yalnızca yerel minimumun mutlak değeri yazılmış.
:::

:::soru{cevap="D"}
$f(x)=(x^2+1)^3$ olduğuna göre $f'(1)$ kaçtır?

- A) 6
- B) 8
- C) 12
- D) 24
- E) 48

---

1. Zincir kuralı: $f'(x)=3(x^2+1)^2\cdot2x=6x(x^2+1)^2$.
2. $f'(1)=6\cdot1\cdot2^2=24$. Doğru cevap D.

Diğer şıklar: **6** $(x^2+1)^2$ çarpanı unutulmuş / **8** fonksiyonun değeri $f(1)$ yazılmış / **12** içteki ifadenin türevi $2x$ çarpılmamış, $3\cdot4$ / **48** iç türev $4x$ alınmış.
:::

## Kendini dene

:::dene
1. $f(x)=5x^2-3x+1$ ise $f'(x)$ nedir? => $10x-3$.
2. $f(x)=\sin x$ ise $f'\!\left(0\right)$ kaçtır? => $\cos0=1$.
3. $f'(x)>0$ olan aralıkta fonksiyon nasıldır? => Artandır.
4. $y=x^2$ eğrisinin $x=3$ noktasındaki teğetinin eğimi kaçtır? => $f'(3)=6$.
5. $f''(x)>0$ ise grafik nasıl bükülür? => Konveks, çanak biçimli.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-mat' and name = 'Türev'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir su deposunun içine saniyede ne kadar su aktığını biliyorsun ve bir dakika sonra depoda ne kadar su toplandığını bulmak istiyorsun. Ya da bir arabanın hızını biliyorsun ve ne kadar yol aldığını hesaplamak istiyorsun. Bu iki problem de bir değişim hızından **toplam miktarı** bulmaktır. Bu işlemin adı **integraldir.** Türev "bir şey ne kadar hızlı değişiyor?" sorusunun cevabıdır. İntegral bu sorunun tersidir: "Hızı bu olan şey toplamda ne kadar değişti?" Bu konuda belirsiz ve belirli integrali, integral kurallarını, **eğri altındaki alanı** ve **dönel cisimlerin hacmini** öğreneceksin.

:::hedefler
1. Belirsiz integralin türevin tersi olduğunu bilmek.
2. Temel integral formüllerini ve değişken değiştirmeyi kullanmak.
3. Belirli integralin özelliklerini bilmek ve hesaplamak.
4. Eğri ile eksen arasında kalan alanı bulmak.
5. İki eğri arasındaki alanı bulmak.
6. Dönel cismin hacmini hesaplamak.
:::

:::ipucu
Belirsiz integralde sonuca **$+c$** yazmayı unutma. Alan sorularında önce grafiğin **eksenin altında mı üstünde mi** olduğuna bak. Eksenin altındaki bölgenin integrali negatiftir, alan ise her zaman pozitiftir.
:::

::video{id="UxIOfP5PJtE" etiket="Konu anlatımı videosu" baslik="İntegral" kanal="Matematiğin Güler Yüzü"}

## 1. Belirsiz integral

$F'(x)=f(x)$ ise $F$'ye $f$'nin bir **ters türevi** denir ve

$$\int f(x)\,dx=F(x)+c$$

yazılır. $c$ keyfi sabittir, çünkü sabitin türevi sıfırdır.

**Temel formüller:**

| Fonksiyon | İntegrali |
| --- | --- |
| $k$ (sabit) | $kx+c$ |
| $x^n$ ($n\ne-1$) | $\dfrac{x^{n+1}}{n+1}+c$ |
| $\dfrac1x$ | $\ln\lvert x\rvert+c$ |
| $e^x$ | $e^x+c$ |
| $\sin x$ | $-\cos x+c$ |
| $\cos x$ | $\sin x+c$ |
| $\dfrac{1}{\cos^2x}$ | $\tan x+c$ |

**Kurallar:** $\int(f\pm g)=\int f\pm\int g$ ve $\int k\,f=k\int f$. Çarpımın ve bölümün integrali, ayrı ayrı integrallerin çarpımı ya da bölümü **değildir**.

## 2. Değişken değiştirme

İçteki ifadenin türevi de integralin içinde çarpan olarak duruyorsa $u=g(x)$ denir.

**Örnek:** $\displaystyle\int2x(x^2+1)^3\,dx$ için $u=x^2+1$ ve $du=2x\,dx$. İntegral $\displaystyle\int u^3\,du=\dfrac{u^4}{4}+c=\dfrac{(x^2+1)^4}{4}+c$.

**Doğrusal içteki ifade:** $\displaystyle\int(3x+1)^5dx=\dfrac{(3x+1)^6}{6\cdot3}+c$. İçteki ifadenin katsayısına bölersin.

## 3. Belirli integral

$f$, $[a,b]$ aralığında sürekli ve $F$ onun bir ters türevi ise

$$\int_a^bf(x)\,dx=F(b)-F(a)$$

(Analizin temel teoremi). Belirli integralin sonucu bir **sayıdır** ve $+c$ yazılmaz.

**Örnek:** $\displaystyle\int_0^2(3x^2-2x+1)\,dx=\Big[x^3-x^2+x\Big]_0^2=(8-4+2)-0=6$.

**Özellikler:**

- $\displaystyle\int_a^af=0$ ve $\displaystyle\int_a^bf=-\int_b^af$
- $\displaystyle\int_a^bf=\int_a^cf+\int_c^bf$
- $f$ **çift** ise $\displaystyle\int_{-a}^af=2\int_0^af$
- $f$ **tek** ise $\displaystyle\int_{-a}^af=0$
- $\displaystyle\int_a^b\lvert f\rvert$ için işaretin değiştiği noktada aralığı böl.

::sim{tur="integral"}

## 4. Alan hesabı

**Eksen ile eğri arasındaki alan:** $f$ aralıkta işaret değiştirmiyorsa $A=\left\lvert\displaystyle\int_a^bf(x)\,dx\right\rvert$. İşaret değiştiriyorsa her bölge ayrı hesaplanıp mutlak değerleri toplanır.

**Örnek:** $y=x^2-4$ ile $x$ ekseni arasında kalan alan için $x=\pm2$ kesim noktalarıdır. Bu aralıkta eğri eksenin altındadır:

$$A=\int_{-2}^{2}(4-x^2)\,dx=2\left[4x-\dfrac{x^3}{3}\right]_0^2=2\left(8-\dfrac83\right)=\dfrac{32}{3}$$

**İki eğri arasındaki alan:** Üstteki fonksiyondan alttakini çıkar, kesim noktalarında sınır al:

$$A=\int_a^b\left[f(x)-g(x)\right]dx\quad(f\ge g)$$

**Örnek:** $y=x$ ve $y=x^2$ eğrileri $x=0$ ve $x=1$'de kesişir. Arada $x\ge x^2$ olduğundan $A=\displaystyle\int_0^1(x-x^2)\,dx=\dfrac12-\dfrac13=\dfrac16$.

## 5. Dönel cismin hacmi

$y=f(x)$ eğrisi $[a,b]$ aralığında **$x$ ekseni etrafında** döndürülürse oluşan cismin hacmi

$$V=\pi\int_a^b\left[f(x)\right]^2dx$$

**Örnek:** $y=\sqrt{x}$ eğrisi $0\le x\le4$ aralığında döndürülürse $V=\pi\displaystyle\int_0^4x\,dx=\pi\left[\dfrac{x^2}{2}\right]_0^4=8\pi$.

**Not:** Hacimde fonksiyonun **karesi** alınır. Bu, dairesel kesitin alanı $\pi r^2$'den gelir.

## 6. Fizik ve günlük hayattan örnekler

- Hız-zaman grafiğinin altındaki alan **yer değiştirmedir**: $\displaystyle\int_{t_1}^{t_2}v\,dt$.
- Kuvvet-yol grafiğinin altındaki alan **iştir**.
- Debi (birim zamandaki hacim) integrali toplam hacmi verir.

**Örnek:** $v(t)=3t^2$ m/s ise ilk 2 saniyede yer değiştirme $\displaystyle\int_0^23t^2dt=[t^3]_0^2=8$ metredir.

:::baglanti
İntegral, **türevin** tersidir ve türev kuralları burada tersten çalışır. **Diziler** konusundaki toplam fikri, integralin "küçük parçaların toplamı" tanımına temel olur. **Fizikte** hareket grafikleri, **trigonometride** $\sin$ ve $\cos$ fonksiyonlarının integralleri ve **analitik geometride** alan problemleri bu konuda bir araya gelir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ters türev | $F'=f$, sonuna $+c$ |
| Kuvvet | $\dfrac{x^{n+1}}{n+1}$ |
| Belirli integral | $F(b)-F(a)$ |
| Çift / tek | $2\int_0^a$ / 0 |
| Alan | Üstten alttakini çıkar |
| Eksenin altı | İntegral negatif, alan pozitif |
| Hacim | $\pi\int f^2\,dx$ |

## Mini test

:::soru{cevap="A"}
$\displaystyle\int_0^2(3x^2-2x+1)\,dx$ integralinin değeri kaçtır?

- A) 6
- B) 8
- C) 9
- D) 12
- E) 14

---

1. Ters türev $F(x)=x^3-x^2+x$.
2. $F(2)-F(0)=(8-4+2)-0=6$. Doğru cevap A.

Diğer şıklar: **8** yalnızca $3x^2$ teriminin integrali alınmış / **9** integral yerine $f(2)=12-4+1$ hesaplanmış / **12** sonuç üst sınırla çarpılmış / **14** $-x^2$ terimi pozitif alınmış, $8+4+2$.
:::

:::soru{cevap="B"}
$\displaystyle\int2x\,(x^2+1)^3\,dx$ integralinin sonucu aşağıdakilerden hangisidir? ($c$ sabit)

- A) $(x^2+1)^4+c$
- B) $\dfrac{(x^2+1)^4}{4}+c$
- C) $\dfrac{(x^2+1)^4}{8x}+c$
- D) $\dfrac{(x^2+1)^3}{3}+c$
- E) $\dfrac{2x(x^2+1)^4}{4}+c$

---

1. $u=x^2+1$ denirse $du=2x\,dx$ olur.
2. İntegral $\displaystyle\int u^3\,du=\dfrac{u^4}{4}+c$.
3. $u$ yerine $x^2+1$ yazılırsa $\dfrac{(x^2+1)^4}{4}+c$. Doğru cevap B.

Diğer şıklar: **$(x^2+1)^4+c$** üssün artırılmasıyla gelen $4$'e bölme unutulmuş / **$\dfrac{(x^2+1)^4}{8x}+c$** $2x$ çarpanına göre bölme yapılmış / **$\dfrac{(x^2+1)^3}{3}+c$** üs artırılmamış / **$\dfrac{2x(x^2+1)^4}{4}+c$** $2x$ çarpanı sonuçta bırakılmış.
:::

:::soru{cevap="D"}
$y=x^2-4$ eğrisi ile $x$ ekseni arasında kalan **sınırlı bölgenin alanı** kaç birimkaredir?

- A) $-\dfrac{32}{3}$
- B) $\dfrac{16}{3}$
- C) 8
- D) $\dfrac{32}{3}$
- E) 16

---

1. Kesim noktaları $x=-2$ ve $x=2$. Bu aralıkta eğri $x$ ekseninin altındadır.
2. $A=\displaystyle\int_{-2}^{2}(4-x^2)\,dx=2\left[4x-\dfrac{x^3}{3}\right]_0^2=2\left(8-\dfrac83\right)=\dfrac{32}{3}$. Doğru cevap D.

Diğer şıklar: **$-\dfrac{32}{3}$** integralin işareti alan sanılmış, alan negatif olamaz / **$\dfrac{16}{3}$** yalnızca $0$ ile $2$ arası alınmış / **8** $4x$ terimi hesaplanıp kübik terim unutulmuş / **16** $-\dfrac{x^3}{3}$ terimi atlanmış, $2\cdot8$.
:::

:::soru{cevap="C"}
$y=\sqrt{x}$ eğrisi $0\le x\le4$ aralığında $x$ ekseni etrafında döndürülüyor. Oluşan dönel cismin hacmi kaç birimküptür?

- A) $4\pi$
- B) $\dfrac{16\pi}{3}$
- C) $8\pi$
- D) $16\pi$
- E) $32\pi$

---

1. Hacim formülü $V=\pi\displaystyle\int_0^4\left(\sqrt{x}\right)^2dx=\pi\int_0^4x\,dx$.
2. $\pi\left[\dfrac{x^2}{2}\right]_0^4=\pi\cdot8=8\pi$. Doğru cevap C.

Diğer şıklar: **$4\pi$** üst sınır 2 gibi hesaplanmış / **$\dfrac{16\pi}{3}$** fonksiyonun karesi alınmamış, $\pi\int\sqrt{x}\,dx$ / **$16\pi$** $\dfrac{x^2}{2}$'deki $2$'ye bölme unutulmuş / **$32\pi$** $2\pi$ ile çarpılıp bölme yapılmamış.
:::

## Kendini dene

:::dene
1. $\displaystyle\int x^2\,dx$ nedir? => $\dfrac{x^3}{3}+c$.
2. $\displaystyle\int_1^3 2\,dx$ kaçtır? => $2x\big|_1^3=4$.
3. $\displaystyle\int\cos x\,dx$ nedir? => $\sin x+c$.
4. $f$ tek fonksiyon ise $\displaystyle\int_{-3}^{3}f(x)\,dx$ kaçtır? => 0.
5. Hız-zaman grafiğinin altındaki alan neyi verir? => Yer değiştirmeyi.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-mat' and name = 'İntegral'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir haritada iki şehir arasındaki mesafeyi, bir navigasyonun en kısa yolu hesaplayışını ya da bir oyundaki karakterin ekranda hareketini düşün. Hepsinde konumlar **koordinatlarla** gösterilir ve işlemler cebirle yapılır. Analitik geometri, geometrik şekilleri koordinat düzleminde denklemlerle inceleme yöntemidir. Bu konuda iki nokta arasındaki uzaklığı, orta noktayı, bir doğrunun denklemini, doğrular arasındaki ilişkileri, **bir noktanın doğruya uzaklığını** ve üçgenin alanını koordinatla bulmayı öğreneceksin. Bu araçlar bir sonraki konu olan **çemberin analitik incelemesinin** temelidir.

:::hedefler
1. İki nokta arasındaki uzaklığı ve orta noktayı hesaplamak.
2. Doğru parçasını verilen oranda bölen noktayı bulmak.
3. Bir doğrunun denklemini farklı verilerle yazmak.
4. Paralel ve dik doğruları eğimlerle ayırt etmek.
5. Bir noktanın doğruya uzaklığını hesaplamak.
6. Üçgenin alanını koordinatlarla bulmak.
:::

:::ipucu
Analitik geometri sorularında çoğu zaman **şekli çizmek** işi yarı yarıya çözer. Noktaları düzleme yerleştir, doğruları çiz, sonra hesap yap. Çizimle sezgisel kontrol yapmak, işaret hatalarını yakalar.
:::

::video{id="4Z2BJN-vAD8" etiket="Konu anlatımı videosu" baslik="Analitik Geometri" kanal="Matematiğin Güler Yüzü"}

## 1. Uzaklık, orta nokta, bölme

$A(x_1,y_1)$ ve $B(x_2,y_2)$ için:

$$\lvert AB\rvert=\sqrt{(x_2-x_1)^2+(y_2-y_1)^2}$$

**Orta nokta:** $M\left(\dfrac{x_1+x_2}{2},\dfrac{y_1+y_2}{2}\right)$.

**Bölme oranı:** $C$ noktası $[AB]$ doğru parçasını $\lvert AC\rvert:\lvert CB\rvert=m:n$ oranında içten bölüyorsa

$$C\left(\dfrac{n\,x_1+m\,x_2}{m+n},\ \dfrac{n\,y_1+m\,y_2}{m+n}\right)$$

**Örnek:** $A(1,2)$ ve $B(9,10)$ için $\lvert AC\rvert:\lvert CB\rvert=3:1$ ise $C=\left(\dfrac{1\cdot1+3\cdot9}{4},\dfrac{1\cdot2+3\cdot10}{4}\right)=(7,8)$.

**Ağırlık merkezi:** Köşeleri $A,B,C$ olan üçgenin ağırlık merkezi $G\left(\dfrac{x_1+x_2+x_3}{3},\dfrac{y_1+y_2+y_3}{3}\right)$.

## 2. Doğrunun denklemi

| Verilen | Denklem |
| --- | --- |
| Eğim $m$ ve $y$ kesimi $n$ | $y=mx+n$ |
| Eğim $m$ ve bir nokta $(x_1,y_1)$ | $y-y_1=m(x-x_1)$ |
| İki nokta | $\dfrac{y-y_1}{y_2-y_1}=\dfrac{x-x_1}{x_2-x_1}$ |
| Eksen kesim noktaları $a$ ve $b$ | $\dfrac xa+\dfrac yb=1$ |
| Genel biçim | $ax+by+c=0$ |

**Eğim:** İki nokta için $m=\dfrac{y_2-y_1}{x_2-x_1}$. Genel biçimde $m=-\dfrac ab$. Eğim aynı zamanda doğrunun $x$ ekseniyle pozitif yönde yaptığı açının tanjantıdır: $m=\tan\alpha$.

::sim{tur="dogru"}

**Özel doğrular:** $x$ eksenine paralel doğrunun eğimi 0, denklemi $y=k$. $y$ eksenine paralel doğrunun eğimi tanımsız, denklemi $x=k$.

## 3. İki doğrunun durumu

$d_1:\ a_1x+b_1y+c_1=0$ ve $d_2:\ a_2x+b_2y+c_2=0$ olsun.

| Durum | Şart |
| --- | --- |
| Paralel | $m_1=m_2$ ya da $\dfrac{a_1}{a_2}=\dfrac{b_1}{b_2}\ne\dfrac{c_1}{c_2}$ |
| Çakışık | $\dfrac{a_1}{a_2}=\dfrac{b_1}{b_2}=\dfrac{c_1}{c_2}$ |
| Dik | $m_1\cdot m_2=-1$ ya da $a_1a_2+b_1b_2=0$ |
| Kesişen | Eğimleri farklı. Kesim noktası denklem sistemiyle bulunur |

**Örnek:** $(m-1)x+2y-3=0$ ve $3x+(m+1)y+5=0$ doğruları dik ise $3(m-1)+2(m+1)=0$ ve $5m-1=0$, $m=\dfrac15$.

**Açı:** İki doğru arasındaki dar açı $\tan\theta=\left\lvert\dfrac{m_1-m_2}{1+m_1m_2}\right\rvert$.

## 4. Noktanın doğruya uzaklığı

$P(x_0,y_0)$ noktasının $ax+by+c=0$ doğrusuna uzaklığı

$$d=\dfrac{\lvert ax_0+by_0+c\rvert}{\sqrt{a^2+b^2}}$$

**Örnek:** $P(2,3)$ noktasının $3x-4y+5=0$ doğrusuna uzaklığı $\dfrac{\lvert6-12+5\rvert}{\sqrt{9+16}}=\dfrac{1}{5}$.

**Paralel iki doğru arası uzaklık:** $ax+by+c_1=0$ ve $ax+by+c_2=0$ için $d=\dfrac{\lvert c_1-c_2\rvert}{\sqrt{a^2+b^2}}$. Denklemlerin **$x$ ve $y$ katsayıları aynı** olmalıdır.

## 5. Üçgenin alanı

$A(x_1,y_1)$, $B(x_2,y_2)$, $C(x_3,y_3)$ köşeli üçgenin alanı

$$A=\dfrac12\left\lvert x_1(y_2-y_3)+x_2(y_3-y_1)+x_3(y_1-y_2)\right\rvert$$

**Örnek:** $A(1,1)$, $B(5,2)$, $C(3,6)$ için $\dfrac12\lvert1(2-6)+5(6-1)+3(1-2)\rvert=\dfrac12\lvert-4+25-3\rvert=9$.

**Pratik yol:** Bir kenar eksene paralelse alan, o kenarın uzunluğu ile karşı köşenin kenara uzaklığının çarpımının yarısıdır.

**Doğrusallık:** Üç nokta doğrusal ise alan sıfırdır.

## 6. Simetri ve yansıma

- $P(a,b)$ noktasının $x$ eksenine göre simetriği $(a,-b)$, $y$ eksenine göre $(-a,b)$, orijine göre $(-a,-b)$.
- $y=x$ doğrusuna göre simetriği $(b,a)$.
- Bir noktanın bir doğruya göre simetriğini bulmak için, noktadan doğruya dik çizilir ve diğer tarafa aynı uzaklıkta alınır.

:::baglanti
Doğrunun eğimi **türevin** geometrik anlamının ilk örneğidir. Bu konudaki uzaklık ve denklem bilgisi, **çemberin analitik incelemesinde** teğet ve kesen doğruların incelenmesinde kullanılır. **Dönüşüm geometrisinde** öteleme ve yansıma doğrudan koordinatlarla yapılır. **Fonksiyonlarda** doğrusal fonksiyon grafiği, buradaki doğru denklemidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Uzaklık | $\sqrt{\Delta x^2+\Delta y^2}$ |
| Orta nokta | Koordinatların ortalaması |
| Eğim | $\dfrac{\Delta y}{\Delta x}=-\dfrac ab$ |
| Paralel | Eğimler eşit |
| Dik | Eğimler çarpımı $-1$ |
| Noktadan doğruya | $\dfrac{\lvert ax_0+by_0+c\rvert}{\sqrt{a^2+b^2}}$ |
| Üçgen alanı | Determinant biçimi |

## Mini test

:::soru{cevap="C"}
$A(1,2)$ ve $B(7,10)$ noktaları arasındaki uzaklık kaç birimdir?

- A) 6
- B) 8
- C) 10
- D) 12
- E) 14

---

1. $\Delta x=7-1=6$ ve $\Delta y=10-2=8$.
2. $\lvert AB\rvert=\sqrt{6^2+8^2}=\sqrt{100}=10$. Doğru cevap C.

Diğer şıklar: **6** yalnızca yatay fark alınmış / **8** yalnızca dikey fark alınmış / **12** yatay fark iki katı alınmış, $2\cdot6$ / **14** farklar doğrudan toplanmış, $6+8$.
:::

:::soru{cevap="A"}
$P(2,3)$ noktasının $3x-4y+5=0$ doğrusuna uzaklığı kaç birimdir?

- A) $\dfrac15$
- B) 1
- C) $\dfrac{11}{5}$
- D) $\dfrac{23}{5}$
- E) 5

---

1. $a=3$, $b=-4$, $c=5$ ve $P(2,3)$ için $\lvert3\cdot2-4\cdot3+5\rvert=\lvert6-12+5\rvert=1$.
2. $\sqrt{a^2+b^2}=\sqrt{9+16}=5$.
3. $d=\dfrac15$. Doğru cevap A.

Diğer şıklar: **1** paydadaki $\sqrt{a^2+b^2}=5$ ile bölme unutulmuş / **$\dfrac{11}{5}$** $c$'nin işareti ters alınmış, $\lvert6-12-5\rvert$ / **$\dfrac{23}{5}$** $y$ teriminin işareti yanlış, $\lvert6+12+5\rvert$ / **5** yalnızca payda hesaplanmış.
:::

:::soru{cevap="D"}
$A(1,2)$ ve $B(9,10)$ noktaları veriliyor. $C$ noktası $[AB]$ doğru parçası üzerinde olup $\lvert AC\rvert:\lvert CB\rvert=3:1$ ise $C$ noktasının koordinatları toplamı kaçtır?

- A) 7
- B) 11
- C) 13
- D) 15
- E) 22

---

1. $C$ noktası $A$'dan $B$'ye giden yolun $\dfrac34$'ünde bulunur.
2. $x=1+\dfrac34\cdot8=7$ ve $y=2+\dfrac34\cdot8=8$. $C(7,8)$.
3. Koordinatlar toplamı $7+8=15$. Doğru cevap D.

Diğer şıklar: **7** oran ters alınmış, $C(3,4)$ / **11** orta nokta bulunmuş, $(5,6)$ / **13** yalnızca $x$ koordinatına oran uygulanmış, $C(7,6)$ / **22** $A$ ve $B$'nin koordinatları toplanmış.
:::

:::soru{cevap="C"}
$(m-1)x+2y-3=0$ ve $3x+(m+1)y+5=0$ doğruları birbirine dik olduğuna göre $m$ kaçtır?

- A) $-5$
- B) $-\dfrac15$
- C) $\dfrac15$
- D) 1
- E) 5

---

1. Dik olma şartı $a_1a_2+b_1b_2=0$ yazılır.
2. $3(m-1)+2(m+1)=0$ ve $5m-1=0$ olur.
3. $m=\dfrac15$. Doğru cevap C.

Diğer şıklar: **$-5$** hem işaret hem oran hatası yapılmış / **$-\dfrac15$** $2(m+1)$ terimi eksi alınarak çözülmüş / **1** eğimlerin eşit olduğu varsayılmış / **5** çarpma yerine ters oran kurulmuş.
:::

## Kendini dene

:::dene
1. $A(0,0)$ ve $B(3,4)$ arasındaki uzaklık nedir? => 5.
2. $y=2x+1$ doğrusunun eğimi kaçtır? => 2.
3. Eğimi 2 olan doğruya dik doğrunun eğimi kaçtır? => $-\dfrac12$.
4. $(2,6)$ ile $(4,10)$ noktalarının orta noktası nedir? => $(3,8)$.
5. Orijinin $3x+4y-10=0$ doğrusuna uzaklığı kaçtır? => $\dfrac{10}{5}=2$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-mat' and name = 'Analitik Geometri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir cep telefonunun baz istasyonuna ne kadar uzakta olduğunu ve sinyalin hangi bölgeyi kapsadığını düşün. İstasyon bir merkezdir, sinyalin ulaştığı bölge bir **dairedir**. Bir koordinat düzleminde bu bölgenin sınırı bir **çemberdir** ve denklemle yazılabilir. Bu konuda çemberin denklemini, genel denklemden merkez ve yarıçapı bulmayı, bir noktanın ve doğrunun çembere göre konumunu, **teğet** ve **kiriş** problemlerini ve iki çemberin birbirine göre durumunu öğreneceksin. Önceki konu olan analitik geometri, burada sürekli kullanılacak.

:::hedefler
1. Merkezi ve yarıçapı bilinen çemberin denklemini yazmak.
2. Genel denklemden merkez ve yarıçapı bulmak.
3. Nokta ve çemberin konumunu belirlemek.
4. Doğru ve çemberin konumunu uzaklıkla incelemek, kiriş uzunluğunu bulmak.
5. Teğet denklemini yazmak.
6. İki çemberin birbirine göre durumunu yarıçaplar ve merkezler arası uzaklıkla belirlemek.
:::

:::ipucu
Çember sorularında çoğu hesap **merkezden doğruya uzaklık** ile yarıçapı karşılaştırmaya iner. Önce merkezi ve yarıçapı net yaz, sonra uzaklık formülünü uygula. Teğet, kiriş ve konum soruları aynı iki sayıya bakar: $d$ ve $r$.
:::

::video{id="pztg1r-ocCw" etiket="Konu anlatımı videosu" baslik="Çemberin Analitiği" kanal="Matematiğin Güler Yüzü"}

## 1. Çemberin denklemi

**Standart biçim:** Merkezi $M(a,b)$, yarıçapı $r$ olan çember

$$(x-a)^2+(y-b)^2=r^2$$

Merkez orijinde ise $x^2+y^2=r^2$.

**Genel biçim:** $x^2+y^2+Dx+Ey+F=0$ denkleminde

$$\text{Merkez }\left(-\dfrac D2,-\dfrac E2\right),\qquad r^2=\dfrac{D^2+E^2-4F}{4}$$

Bunun çember belirtmesi için $D^2+E^2-4F>0$ olmalıdır.

**Örnek:** $x^2+y^2-6x+4y-12=0$ için tam kareye tamamla: $(x-3)^2+(y+2)^2=12+9+4=25$. Merkez $(3,-2)$ ve $r=5$.

## 2. Nokta ve çemberin konumu

$P(x_0,y_0)$ noktası ve $(x-a)^2+(y-b)^2=r^2$ çemberi için $\lvert PM\rvert^2$ değerini yarıçapın karesi ile karşılaştır:

| Durum | Konum |
| --- | --- |
| $\lvert PM\rvert<r$ | Çemberin içinde |
| $\lvert PM\rvert=r$ | Çember üzerinde |
| $\lvert PM\rvert>r$ | Çemberin dışında |

**Pratik:** Noktanın koordinatlarını çemberin denkleminde yerine yaz. Sonuç $<r^2$ ise iç, $=r^2$ ise üzerinde, $>r^2$ ise dıştadır.

## 3. Doğru ve çemberin konumu

Merkezden $d$ doğrusuna olan uzaklığa $\ell$ dersen ($\ell=\dfrac{\lvert aa_0+bb_0+c\rvert}{\sqrt{a^2+b^2}}$):

| Uzaklık | Konum |
| --- | --- |
| $\ell>r$ | Doğru çemberi kesmez |
| $\ell=r$ | Doğru çembere **teğet** |
| $\ell<r$ | Doğru çemberi **iki noktada keser** |

**Kiriş uzunluğu:** Doğru çemberi iki noktada kesiyorsa kirişin uzunluğu

$$\lvert AB\rvert=2\sqrt{r^2-\ell^2}$$

**Örnek:** $x^2+y^2=25$ çemberi ve $3x+4y-15=0$ doğrusu için $\ell=\dfrac{15}{5}=3$ ve kiriş $2\sqrt{25-9}=8$.

**Cebirsel yol:** Doğrunun denklemini çemberde yerine yazarsan $x$ ya da $y$ için ikinci dereceden bir denklem çıkar. $\Delta>0$ ise iki nokta, $\Delta=0$ ise teğet, $\Delta<0$ ise kesişme yok.

**Örnek:** $x^2+y^2=8$ çemberine $y=x+k$ doğrusu teğetse $\ell=\dfrac{\lvert k\rvert}{\sqrt2}=2\sqrt2$ olur ve $\lvert k\rvert=4$.

![Doğrunun çembere göre üç konumu: kesmez, teğet, iki noktada keser](/lessons/ayt-mat/cember-dogru-konumu.svg "Merkezden doğruya uzaklık d ile yarıçap r karşılaştırılır")

## 4. Teğet denklemi

**Çember üzerindeki noktada teğet:** $x^2+y^2=r^2$ çemberinin $(x_0,y_0)$ noktasındaki teğeti

$$x_0x+y_0y=r^2$$

Genel durumda $(x-a)^2+(y-b)^2=r^2$ için $(x_0-a)(x-a)+(y_0-b)(y-b)=r^2$.

**Teğet, yarıçapa diktir:** Merkez ile değme noktasını birleştiren doğrunun eğimi ile teğetin eğimi çarpımı $-1$'dir.

**Dışardaki noktadan teğetler:** Dışarıdaki bir noktadan çembere iki teğet çizilir. Teğet uzunluğu $\sqrt{\lvert PM\rvert^2-r^2}$ olur ve iki teğet parçası eşittir.

## 5. İki çemberin birbirine göre konumu

Merkezleri arasındaki uzaklık $d$, yarıçapları $r_1>r_2$ olsun.

| Durum | Şart |
| --- | --- |
| Birbirinin dışında, kesişmez | $d>r_1+r_2$ |
| Dıştan teğet | $d=r_1+r_2$ |
| İki noktada keser | $r_1-r_2<d<r_1+r_2$ |
| İçten teğet | $d=r_1-r_2$ |
| Biri diğerinin içinde | $d<r_1-r_2$ |
| Eş merkezli | $d=0$ |

**Örnek:** $(x-1)^2+(y-2)^2=9$ ve $(x-5)^2+(y-5)^2=r^2$ çemberlerinin merkezleri $(1,2)$ ve $(5,5)$ olup $d=\sqrt{16+9}=5$. Dıştan teğet olmaları için $3+r=5$ ve $r=2$. İçten teğet olmaları için $r-3=5$ ve $r=8$.

**Ortak kiriş:** İki çemberin denklemleri taraf tarafa çıkarılırsa kesişim noktalarından geçen doğru bulunur.

## 6. Çemberde sık karşılaşılan durumlar

- Bir çember $x$ eksenine teğetse yarıçap, merkezin ordinatının mutlak değeridir: $r=\lvert b\rvert$.
- $y$ eksenine teğetse $r=\lvert a\rvert$.
- İki eksene birden teğet çemberde merkez $(r,r)$ biçimindedir (birinci bölgede).
- Çapın uç noktaları $A$ ve $B$ ise merkez, orta noktadır ve $r=\dfrac{\lvert AB\rvert}{2}$.

:::baglanti
Çemberin analitik incelemesi, **analitik geometrideki** uzaklık, doğru denklemi ve noktadan doğruya uzaklık formüllerini kullanır. **İkinci dereceden denklemlerdeki** $\Delta$ yorumu doğru-çember kesişiminde yeniden görünür. **Trigonometri**deki birim çember, merkezi orijinde ve yarıçapı 1 olan özel bir çemberdir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çember denklemi | $(x-a)^2+(y-b)^2=r^2$ |
| Genel denklem | Merkez $\left(-\dfrac D2,-\dfrac E2\right)$ |
| Doğru-çember | $\ell$ ile $r$'yi karşılaştır |
| Kiriş | $2\sqrt{r^2-\ell^2}$ |
| Teğet | $x_0x+y_0y=r^2$ |
| İki çember | $d$ ile $r_1\pm r_2$ |
| Eksene teğet | $r=\lvert b\rvert$ ya da $\lvert a\rvert$ |

## Mini test

:::soru{cevap="B"}
$x^2+y^2-6x+4y-12=0$ çemberinin yarıçapı kaç birimdir?

- A) 1
- B) 5
- C) 13
- D) 25
- E) 37

---

1. Genel denklemde $D=-6$, $E=4$, $F=-12$.
2. $r^2=\dfrac{D^2+E^2-4F}{4}=\dfrac{36+16+48}{4}=25$.
3. $r=5$. Doğru cevap B.

Diğer şıklar: **1** $F$'nin işareti ters alınmış, $9+4-12$ / **13** $F$ unutulmuş, $9+4$ / **25** yarıçapın karesi yarıçap sanılmış / **37** $F$ iki kez eklenmiş, $25+12$.
:::

:::soru{cevap="C"}
$x^2+y^2=8$ çemberine $y=x+k$ doğrusu teğet olduğuna göre $k$'nin pozitif değeri kaçtır?

- A) 2
- B) $2\sqrt2$
- C) 4
- D) 8
- E) 16

---

1. Doğru $x-y+k=0$ biçiminde yazılır. Merkez orijin ve $r=2\sqrt2$.
2. Teğet olması için merkezin doğruya uzaklığı yarıçapa eşittir: $\dfrac{\lvert k\rvert}{\sqrt{1+1}}=2\sqrt2$.
3. $\lvert k\rvert=2\sqrt2\cdot\sqrt2=4$ ve $k=4$. Doğru cevap C.

Diğer şıklar: **2** yarıçap $\sqrt2$ sanılmış, $\dfrac{\lvert k\rvert}{\sqrt2}=\sqrt2$ çözülmüş / **$2\sqrt2$** $\lvert k\rvert$ doğrudan yarıçapa eşitlenmiş / **8** yarıçapın karesi $k$ sanılmış / **16** $\dfrac{k^2}{2}=8$ çözülüp $k^2$ değeri yazılmış.
:::

:::soru{cevap="E"}
$x^2+y^2=25$ çemberi ile $3x+4y-15=0$ doğrusunun kesişiminden oluşan **kirişin uzunluğu** kaç birimdir?

- A) 3
- B) 4
- C) 5
- D) 6
- E) 8

---

1. Merkez orijindir ve $r=5$. Merkezden doğruya uzaklık $\ell=\dfrac{\lvert-15\rvert}{\sqrt{9+16}}=3$.
2. $\ell<r$ olduğundan doğru çemberi iki noktada keser.
3. Kiriş uzunluğu $2\sqrt{r^2-\ell^2}=2\sqrt{25-9}=8$. Doğru cevap E.

Diğer şıklar: **3** merkezden doğruya uzaklık yazılmış / **4** yarım kiriş bulunup 2 ile çarpılmamış / **5** yarıçap yazılmış / **6** uzaklığın iki katı alınmış.
:::

:::soru{cevap="A"}
Merkezi $(1,2)$ ve yarıçapı 3 olan çember ile merkezi $(5,5)$ ve yarıçapı $r$ olan çember **dıştan teğet** ise $r$ kaçtır?

- A) 2
- B) 3
- C) 5
- D) 8
- E) 15

---

1. Merkezler arası uzaklık $d=\sqrt{(5-1)^2+(5-2)^2}=\sqrt{25}=5$.
2. Dıştan teğetlikte $d=r_1+r_2$ olur: $5=3+r$.
3. $r=2$. Doğru cevap A.

Diğer şıklar: **3** diğer çemberin yarıçapı tekrar edilmiş / **5** uzaklık yarıçap sanılmış / **8** içten teğet formülü kullanılmış, $r-3=5$ / **15** uzaklık ile yarıçap çarpılmış.
:::

## Kendini dene

:::dene
1. Merkezi $(2,-1)$, yarıçapı 4 olan çemberin denklemi nedir? => $(x-2)^2+(y+1)^2=16$.
2. $x^2+y^2=9$ çemberinin yarıçapı kaçtır? => 3.
3. $d=r$ ise doğru çembere nasıl bir konumdadır? => Teğettir.
4. $(3,4)$ noktası $x^2+y^2=25$ çemberine göre nerededir? => Üzerinde, çünkü $9+16=25$.
5. $x^2+y^2=4$ ve $x^2+y^2=1$ çemberleri nasıl bir konumdadır? => Eş merkezli, biri diğerinin içinde.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-mat' and name = 'Çemberin Analitik İncelemesi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bilgisayar oyununda karakterin ekranda yürümesi, bir fotoğrafı döndürmen, aynadaki görüntün ya da bir logonun büyütülüp küçültülmesi, hepsi **geometrik dönüşümdür.** Bir şeklin yerini ya da boyunu değiştirirken yaptığın işlem düzenli kurallara bağlıdır. Bu konuda **öteleme, yansıma, dönme ve homotetiyi** koordinat düzleminde öğreneceksin. Bu dönüşümlerin hangisinin **şekli koruduğunu**, hangisinin boyu değiştirdiğini ve fonksiyon grafiklerinde nasıl kullanıldığını göreceksin.

:::hedefler
1. Öteleme, yansıma ve dönmenin koordinat kurallarını uygulamak.
2. Birden fazla dönüşümü art arda uygulamak.
3. Bir doğrunun ya da eğrinin dönüşüm sonrası denklemini yazmak.
4. Homotetide uzunluk ve alan değişimini hesaplamak.
5. Şeklin simetri eksenlerini ve dönel simetrisini belirlemek.
:::

:::ipucu
Her dönüşümün kuralını **tek bir noktayla** dene. $(1,0)$ ve $(0,1)$ gibi basit noktaların nereye gittiğini bilirsen dönüşümün kuralını hatırlarsın. Art arda dönüşümde **sıra önemlidir**, yanlış sırayla uygulama sonucu değiştirebilir.
:::

::video{id="fNxVMJbNnY8" etiket="Konu anlatımı videosu" baslik="Dönüşümler" kanal="Matematiğin Güler Yüzü"}

## 1. Dönüşüm çeşitleri

**İzometri (eş yapılı) dönüşümler:** Uzunluğu ve açıyı korur, şeklin boyu değişmez. Öteleme, yansıma ve dönme izometridir.

**Benzerlik dönüşümü (homoteti):** Şeklin biçimini korur ama boyunu değiştirir.

## 2. Öteleme

Her noktayı aynı yönde ve aynı uzaklıkta kaydırır. $\vec v=(a,b)$ vektörü ile öteleme:

$$P(x,y)\to P'(x+a,\,y+b)$$

**Özellikler:** Doğru, kendine paralel bir doğruya gider. Şekil dönmez, boyu değişmez.

**Eğri ötelemesi:** $y=f(x)$ grafiğini $(a,b)$ vektörüyle ötelemek için $x$ yerine $x-a$ yaz, $y$ yerine $y-b$ yaz: $y-b=f(x-a)$.

**Örnek:** $y=x^2-2x$ parabolü $(2,3)$ vektörüyle ötelenirse $y-3=(x-2)^2-2(x-2)$ ve $y=x^2-6x+11$ olur.

## 3. Yansıma (simetri)

| Yansıma | Kural |
| --- | --- |
| $x$ eksenine göre | $(x,y)\to(x,-y)$ |
| $y$ eksenine göre | $(x,y)\to(-x,y)$ |
| Orijine göre | $(x,y)\to(-x,-y)$ |
| $y=x$ doğrusuna göre | $(x,y)\to(y,x)$ |
| $y=-x$ doğrusuna göre | $(x,y)\to(-y,-x)$ |
| $x=a$ doğrusuna göre | $(x,y)\to(2a-x,\,y)$ |
| $y=b$ doğrusuna göre | $(x,y)\to(x,\,2b-y)$ |

::sim{tur="donusum"}

**Fonksiyonlarda:** $y=f(x)$ grafiğinin $x$ eksenine göre yansıması $y=-f(x)$, $y$ eksenine göre yansıması $y=f(-x)$, $y=x$ doğrusuna göre yansıması $f$'nin **tersidir**.

**Özellikler:** Doğru üzerindeki noktalar kendine gider. Yansıma, şeklin yönünü ters çevirir (saat yönü ters saat yönüne döner).

## 4. Dönme

**Orijin etrafında dönme** ($\theta$ kadar, saat yönünün tersine):

| Açı | Kural |
| --- | --- |
| $90^\circ$ | $(x,y)\to(-y,\,x)$ |
| $180^\circ$ | $(x,y)\to(-x,\,-y)$ |
| $270^\circ$ | $(x,y)\to(y,\,-x)$ |

**Genel dönme:** $(x,y)\to(x\cos\theta-y\sin\theta,\ x\sin\theta+y\cos\theta)$.

**Merkez başka bir nokta ise:** Önce merkezi orijine ötele, döndür, geri ötele.

**Özellikler:** Dönme açıyı ve uzaklığı korur. Merkez, sabit noktadır. $180^\circ$'lik dönme, orijine göre yansımayla aynıdır.

**Örnek:** $A(3,-2)$ noktası önce $x$ eksenine göre yansıtılır: $(3,2)$. Sonra orijin etrafında $90^\circ$ döndürülür: $(-2,3)$.

**Doğru örneği:** $y=2x+1$ doğrusu orijin etrafında $90^\circ$ döndürülürse $(x,y)\to(x',y')=(-y,x)$ olduğundan $x=y'$ ve $y=-x'$ yazılır. $-x'=2y'+1$ ve $y'=-\dfrac{x'}{2}-\dfrac12$. Eğim $2$'den $-\dfrac12$'ye geçer, doğrular birbirine diktir.

## 5. Homoteti

Merkezi $O$ ve oranı $k$ olan homotetide $P$ noktası $P'$'ne giderken $\vec{OP'}=k\vec{OP}$ olur. Merkez orijinse $(x,y)\to(kx,ky)$.

- $k>0$: Şekil aynı yönde kalır. $k<0$: Şekil ters yöne döner.
- $\lvert k\rvert>1$ büyütme, $\lvert k\rvert<1$ küçültme.
- **Uzunluk** $\lvert k\rvert$ katı olur, **açılar** değişmez.
- **Alan** $k^2$ katı olur, **hacim** $\lvert k\rvert^3$ katı olur.

**Örnek:** Köşeleri $(1,1)$, $(4,1)$, $(1,5)$ olan üçgenin alanı $\dfrac12\cdot3\cdot4=6$. Orijin merkezli ve $k=2$ oranlı homotetide alan $4\cdot6=24$ olur.

## 6. Simetri

- **Çizgisel (eksenel) simetri:** Şekil bir doğruya göre yansıyınca kendisiyle çakışır. Eşkenar üçgenin 3, karenin 4, dikdörtgenin 2, çemberin sonsuz simetri ekseni vardır.
- **Dönel simetri:** Şekil bir merkez etrafında bir açı kadar dönünce kendisiyle çakışır. Karede $90^\circ$ ve katları.
- **Noktasal simetri:** $180^\circ$ dönmede çakışır. Paralelkenar ve dikdörtgenin merkezi vardır.

**Fonksiyon simetrisi:** Çift fonksiyonun grafiği $y$ eksenine, tek fonksiyonun grafiği orijine göre simetriktir.

:::baglanti
Bu konudaki öteleme ve yansıma, **fonksiyonlardaki grafik dönüşümlerinin** geometrik yorumudur. Dönme formülü **trigonometrideki** toplam-fark formüllerine dayanır. Homotetideki alan ve hacim oranı, **benzerlik** (TYT) ve **katı cisimler** (sonraki konu) için gereklidir. Parçacıkların simetrisi **kimya** ve **fizikte** de karşına çıkar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Öteleme | $(x+a,\,y+b)$ |
| $x$ eksenine yansıma | $(x,-y)$ |
| $y=x$'e yansıma | $(y,x)$ |
| $90^\circ$ dönme | $(-y,\,x)$ |
| $180^\circ$ dönme | $(-x,-y)$ |
| Homoteti | Uzunluk $k$, alan $k^2$ |
| Sıra | Art arda dönüşümde sıra önemli |

## Mini test

:::soru{cevap="B"}
$A(3,-2)$ noktası önce $x$ eksenine göre yansıtılıyor, çıkan nokta orijin etrafında saat yönünün tersine $90^\circ$ döndürülüyor. Elde edilen noktanın **apsisi** kaçtır?

- A) $-3$
- B) $-2$
- C) 1
- D) 2
- E) 3

---

1. $x$ eksenine göre yansıma: $(3,-2)\to(3,2)$.
2. $90^\circ$ dönme kuralı $(x,y)\to(-y,x)$: $(3,2)\to(-2,3)$.
3. Apsis $-2$. Doğru cevap B.

Diğer şıklar: **$-3$** yansıma $y$ eksenine göre yapılmış / **1** apsis ile ordinat toplanmış, $-2+3$ / **2** dönme yönü ters alınmış, $(2,-3)$ / **3** yansıma yapılıp dönme unutulmuş, $(3,2)$.
:::

:::soru{cevap="D"}
$y=x^2-2x$ parabolü $(2,3)$ vektörü ile ötelendiğinde elde edilen parabolün denklemi aşağıdakilerden hangisidir?

- A) $y=x^2-2x+3$
- B) $y=x^2+2x+3$
- C) $y=x^2-6x+5$
- D) $y=x^2-6x+11$
- E) $y=x^2+2x-1$

---

1. Öteleme $(a,b)=(2,3)$ için $x$ yerine $x-2$, $y$ yerine $y-3$ yazılır: $y-3=(x-2)^2-2(x-2)$.
2. $y=x^2-4x+4-2x+4+3=x^2-6x+11$. Doğru cevap D.

Diğer şıklar: **$x^2-2x+3$** yalnızca $y$ yönünde ötelenmiş / **$x^2+2x+3$** $x$ için ters yönde, $x+2$ yazılmış / **$x^2-6x+5$** $y$ yönünde ters ötelenmiş, $-3$ / **$x^2+2x-1$** her iki yönde de ters ötelenmiş.
:::

:::soru{cevap="A"}
$y=2x+1$ doğrusu orijin etrafında saat yönünün tersine $90^\circ$ döndürülürse elde edilen doğrunun denklemi aşağıdakilerden hangisidir?

- A) $y=-\dfrac{x}{2}-\dfrac12$
- B) $y=-\dfrac{x}{2}+1$
- C) $y=-2x-1$
- D) $y=\dfrac{x}{2}-1$
- E) $y=2x-1$

---

1. $90^\circ$ dönmede $(x,y)\to(x',y')=(-y,x)$. Buradan $x=y'$ ve $y=-x'$.
2. Doğruda yerine yazılırsa $-x'=2y'+1$ olur.
3. $y'=-\dfrac{x'}{2}-\dfrac12$. Doğru cevap A.

Diğer şıklar: **$-\dfrac x2+1$** eğim doğru ama sabit terim dönmeden etkilenmemiş sanılmış / **$-2x-1$** eğim yalnızca işaret değiştirmiş / **$\dfrac x2-1$** dönme yönü ters alınmış, eğim yanlış işaretli / **$2x-1$** doğru $y=x$'e göre ya da kendine yansıtılmış gibi işlenmiş.
:::

:::soru{cevap="C"}
Köşeleri $(1,1)$, $(4,1)$ ve $(1,5)$ olan üçgen, orijin merkezli ve oranı $2$ olan homotetiye uğratılıyor. Yeni üçgenin alanı kaç birimkaredir?

- A) 6
- B) 12
- C) 24
- D) 36
- E) 48

---

1. İlk üçgen dik üçgendir. Kenarları $3$ ve $4$, alan $\dfrac12\cdot3\cdot4=6$.
2. Homotetide uzunluklar $2$ katına çıkar, alan $2^2=4$ katına çıkar.
3. Yeni alan $4\cdot6=24$. Doğru cevap C.

Diğer şıklar: **6** alan değişmez sanılmış / **12** alan yalnızca $2$ katına çıkarılmış / **36** alan oranı $3^2$ gibi alınmış, $6\cdot6$ / **48** hacim oranı $k^3$ gibi alınmış, $6\cdot8$.
:::

## Kendini dene

:::dene
1. $(2,5)$ noktasının $y$ eksenine göre yansıması nedir? => $(-2,5)$.
2. $(1,2)$ noktasını $(3,-1)$ vektörü ile ötelersen yeni nokta ne olur? => $(4,1)$.
3. $(3,4)$ noktasının $y=x$ doğrusuna göre yansıması nedir? => $(4,3)$.
4. $180^\circ$ dönmede $(x,y)$ nereye gider? => $(-x,-y)$.
5. Homotetide oran $k=3$ ise alan kaç katına çıkar? => 9 katına.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-mat' and name = 'Dönüşüm Geometrisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir su deposunun kaç litre aldığını, bir külahlı dondurmanın üstündeki topun külaha sığıp sığmayacağını ya da bir kutuyu kaplamak için kaç metrekare kâğıt gerektiğini hesaplarken **katı cisimlerle** uğraşırsın. TYT'de prizma ve silindirin hacmini öğrendin. AYT'de bu bilgi **piramit, koni ve küre** ile genişler. Bu konuda cisimlerin **yüzey alanını ve hacmini**, kesit ve açınım fikrini, **dönel cisimleri**, birleşik cisimleri ve su seviyesi problemlerini öğreneceksin. Formüller çok görünür ama hepsi "taban alanı çarpı yükseklik" fikrinin değişik biçimleridir.

:::hedefler
1. Prizma ve silindirin yüzey alanını ve hacmini hesaplamak.
2. Piramit ve koninin yüzey alanını ve hacmini hesaplamak.
3. Kürenin yüzey alanını ve hacmini hesaplamak.
4. Dönel cisimleri ve açınımlarını tanımak.
5. Birleşik cisimler ve su seviyesi problemlerini çözmek.
6. Benzer cisimlerde alan ve hacim oranlarını kullanmak.
:::

:::ipucu
Katı cisim sorularında önce **cismin cinsini** belirle, sonra bilinenleri şekle yaz. Koni ve piramitte **yüksekliği** (dik yükseklik) ile **yan yüzey yüksekliğini** (eğik yükseklik) karıştırma. Hacim formüllerinde ve yüzey alanı formüllerinde hangi uzunluğun kullanıldığına dikkat et.
:::

::video{id="EdbeKyozz-A" etiket="Konu anlatımı videosu" baslik="Katı Cisimler" kanal="Matematiğin Güler Yüzü"}

## 1. Prizma ve silindir

**Prizma:** Taban alanı $A_t$, yükseklik $h$. Hacim $V=A_t\cdot h$. Yanal alan $=$ taban çevresi $\times\ h$. Toplam alan $=$ yanal alan $+2A_t$.

**Dikdörtgenler prizması** ($a,b,c$): $V=abc$, $A=2(ab+bc+ac)$, cisim köşegeni $\sqrt{a^2+b^2+c^2}$.

**Küp** (ayrıt $a$): $V=a^3$, $A=6a^2$, cisim köşegeni $a\sqrt3$.

**Dik silindir** (yarıçap $r$, yükseklik $h$):

| Büyüklük | Formül |
| --- | --- |
| Hacim | $V=\pi r^2h$ |
| Yanal alan | $2\pi rh$ |
| Toplam alan | $2\pi rh+2\pi r^2$ |

**Örnek:** $r=3$ ve $h=5$ olan silindirin hacmi $\pi\cdot9\cdot5=45\pi$.

## 2. Piramit ve koni

Piramit ve koni, taban alanı ve yüksekliği aynı olan prizma ya da silindirin **hacminin üçte biridir**.

**Piramit:** $V=\dfrac13A_t\cdot h$. Yanal alan, yan yüzlerin alanlarının toplamıdır. Düzgün piramitte yan yüzler eş ikizkenar üçgendir.

**Dik koni** (yarıçap $r$, yükseklik $h$, ana doğru (eğik yükseklik) $l=\sqrt{r^2+h^2}$):

| Büyüklük | Formül |
| --- | --- |
| Hacim | $V=\dfrac13\pi r^2h$ |
| Yanal alan | $\pi rl$ |
| Toplam alan | $\pi rl+\pi r^2$ |

**Örnek:** $r=6$, $h=8$ olan koni için $l=\sqrt{36+64}=10$. Yanal alan $60\pi$, taban $36\pi$, toplam alan $96\pi$. Hacim $\dfrac13\pi\cdot36\cdot8=96\pi$.

**Koni açınımı:** Yanal yüzey, yarıçapı $l$ ve yay uzunluğu $2\pi r$ olan bir daire dilimidir. Dilimin merkez açısı $\theta=\dfrac{2\pi r}{l}$ radyandır.

**Kesik koni ve kesik piramit:** Üstten tabana paralel kesilince kalan parçadır. Kesilen küçük cisim ile bütün cisim **benzerdir**.

## 3. Küre

Yarıçapı $r$ olan kürede:

$$V=\dfrac43\pi r^3,\qquad A=4\pi r^2$$

- Kürenin büyük dairesinin alanı $\pi r^2$, çevresi $2\pi r$'dir.
- Bir düzlemle kesişimi bir **dairedir**. Merkezden $d$ uzaklıktaki düzlemin kestiği dairenin yarıçapı $\sqrt{r^2-d^2}$.
- Küre, yarım dairenin çapı etrafında döndürülmesiyle oluşur.

**Örnek:** Hacmi $288\pi$ olan kürede $\dfrac43r^3=288$ ve $r^3=216$, $r=6$. Yüzey alanı $4\pi\cdot36=144\pi$.

![Silindir, koni ve kürenin yarıçap ve yükseklik gösterimi ve hacim formülleri](/lessons/ayt-mat/kati-cisimler-formuller.svg "Silindir, koni ve küre")

## 4. Dönel cisimler

Bir düzlem şekli bir eksen etrafında döndürülünce dönel cisim oluşur.

| Dönen şekil | Cisim |
| --- | --- |
| Dikdörtgen (bir kenarı etrafında) | Silindir |
| Dik üçgen (dik kenarı etrafında) | Koni |
| Yarım daire (çapı etrafında) | Küre |
| Daire (dışındaki eksen etrafında) | Simit (tor) |

**Dik üçgenin hipotenüs etrafında dönmesi** iki konin birleşimini oluşturur.

## 5. Birleşik cisimler ve su seviyesi

**Birleşik cisim:** Cisimleri parçalarına ayır, hacimleri topla ya da çıkar. Ortak yüzeyin alanını toplam yüzey alanından düşmeyi unutma.

**Su seviyesi:** Kaba bir cisim batırılınca su, cismin hacmi kadar yükselir. Yükselme miktarı $\Delta h=\dfrac{V_{cisim}}{A_{taban}}$.

**Örnek:** Yarıçapı 4, su yüksekliği 6 olan silindirik kaba yarıçapı 3 olan bir küre atılıyor (tamamen batıyor). Kürenin hacmi $\dfrac43\pi\cdot27=36\pi$. Taban alanı $16\pi$. Yükselme $\dfrac{36\pi}{16\pi}=\dfrac94$ ve yeni yükseklik $6+\dfrac94=\dfrac{33}{4}$.

## 6. Benzer cisimler

İki cismin uzunluk oranı $k$ ise **alan oranı $k^2$**, **hacim oranı $k^3$** olur.

**Örnek:** İki kürenin yarıçapları 2 ve 6 ise oran $k=3$. Yüzey alanları oranı 9, hacimleri oranı 27.

**Üstten kesilen koni:** Yüksekliğin yarısında tabana paralel kesilirse üstteki küçük koninin hacmi bütünün $\left(\dfrac12\right)^3=\dfrac18$'idir.

:::baglanti
Cisimlerin hacmi, **integral** konusunda dönel cismin hacim formülüne bağlanır. Benzer cisimlerde alan ve hacim oranı, **dönüşüm geometrisindeki** homoteti kurallarıyla aynıdır. Koninin açınımı, **trigonometrik** ve **çember** bilgisini birlikte kullanır. Fizikteki yoğunluk, basınç ve kaldırma sorularının hepsinde hacim hesabı vardır.
:::

## 7. Konuyu toparla

| Cisim | Hacim | Alan |
| --- | --- | --- |
| Prizma | $A_t\cdot h$ | Yanal $+\ 2A_t$ |
| Silindir | $\pi r^2h$ | $2\pi rh+2\pi r^2$ |
| Piramit | $\dfrac13A_th$ | Yan yüzler $+\ A_t$ |
| Koni | $\dfrac13\pi r^2h$ | $\pi rl+\pi r^2$ |
| Küre | $\dfrac43\pi r^3$ | $4\pi r^2$ |
| Benzerlik | Hacim $k^3$ | Alan $k^2$ |

## Mini test

:::soru{cevap="B"}
Taban yarıçapı 3 ve yüksekliği 5 olan dik silindirin hacmi kaç birimküptür?

- A) $15\pi$
- B) $45\pi$
- C) $75\pi$
- D) $90\pi$
- E) $135\pi$

---

1. Silindirin hacmi $V=\pi r^2h$.
2. $V=\pi\cdot3^2\cdot5=45\pi$. Doğru cevap B.

Diğer şıklar: **$15\pi$** $\pi rh$ hesaplanmış, yarıçap kare alınmamış / **$75\pi$** $r$ yerine $5$, $h$ yerine $3$ yazılmış, $\pi\cdot25\cdot3$ / **$90\pi$** hacim iki katı alınmış / **$135\pi$** $r^3$ ile çarpılmış, $\pi\cdot27\cdot5$.
:::

:::soru{cevap="C"}
Taban yarıçapı 6 ve yüksekliği 8 olan dik koninin **toplam yüzey alanı** kaç birimkaredir?

- A) $48\pi$
- B) $60\pi$
- C) $96\pi$
- D) $120\pi$
- E) $144\pi$

---

1. Ana doğru $l=\sqrt{r^2+h^2}=\sqrt{36+64}=10$.
2. Yanal alan $\pi rl=60\pi$ ve taban alanı $\pi r^2=36\pi$.
3. Toplam alan $60\pi+36\pi=96\pi$. Doğru cevap C.

Diğer şıklar: **$48\pi$** $\pi rh$ hesaplanmış / **$60\pi$** yalnızca yanal alan bulunmuş / **$120\pi$** yanal alan $2\pi rl$ alınmış / **$144\pi$** $r\cdot h\cdot3$ gibi hacim formülüyle karıştırılmış.
:::

:::soru{cevap="D"}
Hacmi $288\pi$ birimküp olan kürenin **yüzey alanı** kaç birimkaredir?

- A) $36\pi$
- B) $72\pi$
- C) $108\pi$
- D) $144\pi$
- E) $288\pi$

---

1. $V=\dfrac43\pi r^3=288\pi$ olduğundan $r^3=216$ ve $r=6$.
2. Yüzey alanı $4\pi r^2=4\pi\cdot36=144\pi$. Doğru cevap D.

Diğer şıklar: **$36\pi$** büyük dairenin alanı $\pi r^2$ alınmış / **$72\pi$** $2\pi r^2$ alınmış / **$108\pi$** $3\pi r^2$ alınmış / **$288\pi$** hacim değeri yüzey alanı sanılmış.
:::

:::soru{cevap="D"}
Yarıçapı 4 ve su yüksekliği 6 olan silindirik bir kaba, yarıçapı 3 olan bir küre atılıyor ve küre tamamen suya batıyor. Su taşmadığına göre kaptaki **yeni su yüksekliği** kaçtır?

- A) $\dfrac94$
- B) 6
- C) $\dfrac{27}{4}$
- D) $\dfrac{33}{4}$
- E) 10

---

1. Kürenin hacmi $\dfrac43\pi\cdot3^3=36\pi$. Kabın taban alanı $\pi\cdot4^2=16\pi$.
2. Su seviyesi $\dfrac{36\pi}{16\pi}=\dfrac94$ kadar yükselir.
3. Yeni yükseklik $6+\dfrac94=\dfrac{33}{4}$. Doğru cevap D.

Diğer şıklar: **$\dfrac94$** yükselme miktarı yeni yükseklik sanılmış / **6** su seviyesi değişmez sanılmış / **$\dfrac{27}{4}$** küre hacmi $\dfrac43\pi r^2$ alınmış, $12\pi$ ile bölünmüş / **10** kürenin hacmi küre büyük dairesinin alanına bölünmüş, $6+4$.
:::

## Kendini dene

:::dene
1. Kenarı 3 olan küpün hacmi kaçtır? => 27.
2. Yarıçapı 3 olan kürenin yüzey alanı nedir? => $4\pi\cdot9=36\pi$.
3. Koninin hacmi aynı tabanlı ve yükseklikli silindirin kaçta kaçıdır? => Üçte biri.
4. Benzerlik oranı 2 olan iki cismin hacim oranı kaçtır? => 8.
5. Dik üçgen bir dik kenarı etrafında dönerse hangi cisim oluşur? => Koni.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, true from public.topics where subject_id = 'ayt-mat' and name = 'Katı Cisimler'
on conflict (topic_id) do nothing;

