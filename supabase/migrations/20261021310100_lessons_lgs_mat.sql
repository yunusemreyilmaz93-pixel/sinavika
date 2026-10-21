-- LGS Matematik konu anlatımları. Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir otobüs durağından iki hat farklı aralıklarla kalkıyor. İkisi aynı anda ne zaman tekrar kalkar? Bir odaya en büyük kare karolarla artık kalmadan nasıl döşeme yapılır? Bu soruların ikisi de **çarpanlar ve katlar** konusuyla çözülür. Bu konuda sayıları asal çarpanlarına ayırmayı, EBOB ve EKOK’u bulmayı ve problemlerde hangisini kullanacağını öğreneceksin.

:::hedefler
1. Sayıları asal çarpanlarına ayırmak ve pozitif çarpan sayısını bulmak.
2. İki ya da daha fazla sayının EBOB ve EKOK değerini bulmak.
3. Aralarında asal sayıları ve EBOB ile EKOK arasındaki ilişkiyi kullanmak.
4. EBOB ve EKOK içeren günlük hayat problemlerini çözmek.
:::

:::ipucu
Problem okurken şu iki soruyu sor. **“Bir şeyi eşit parçalara bölüyor muyum?”** ise EBOB. **“Bir olay yeniden aynı anda mı gerçekleşiyor?”** ise EKOK. Bu iki soru çoğu problemin yönünü belirler.
:::

## 1. Asal sayılar ve asal çarpanlara ayırma

**Asal sayı**, yalnızca 1’e ve kendisine bölünebilen, 1’den büyük doğal sayıdır. En küçük asal sayı **2** dir ve tek çift asal sayı odur. İlk asal sayılar: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29.

Asal olmayan sayıya **bileşik sayı** denir. 1 ne asaldır ne bileşiktir.

Her bileşik sayı, asal sayıların çarpımı biçiminde yazılabilir. Buna **asal çarpanlara ayırma** denir.

Örnek: 72 sayısını asal çarpanlarına ayıralım.

$$72 = 2 \cdot 36 = 2 \cdot 2 \cdot 18 = 2 \cdot 2 \cdot 2 \cdot 9 = 2^3 \cdot 3^2$$

### Bölünebilme kuralları

Çarpanlara ayırırken şu kurallar işini hızlandırır.

| Sayı | Kural |
| --- | --- |
| 2 | Son rakam çift |
| 3 | Rakamların toplamı 3’ün katı |
| 4 | Son iki basamak 4’ün katı |
| 5 | Son rakam 0 ya da 5 |
| 6 | Hem 2 hem 3’e bölünür |
| 8 | Son üç basamak 8’in katı |
| 9 | Rakamların toplamı 9’un katı |
| 10 | Son rakam 0 |

## 2. Pozitif çarpan sayısı

Bir sayının **çarpanları**, o sayıyı kalansız bölen sayılardır. Sayı asal çarpanlarına ayrılmış hâldeyken, **üslerin 1 fazlasını çarparak** pozitif çarpan sayısı bulunur.

$$a = p^m \cdot q^n \Rightarrow \text{Çarpan sayısı} = (m+1)(n+1)$$

Örnek: $72 = 2^3 \cdot 3^2$ ise çarpan sayısı $(3+1)(2+1) = 12$ dir. Çarpanlar: 1, 2, 3, 4, 6, 8, 9, 12, 18, 24, 36, 72.

:::dene
1. 60 sayısının pozitif çarpan sayısı kaçtır? => $60 = 2^2 \cdot 3 \cdot 5$ olduğundan $(2+1)(1+1)(1+1) = 12$.
2. Bir asal sayının pozitif çarpan sayısı kaçtır? => 2. Çarpanları yalnızca 1 ve kendisidir.
:::

## 3. EBOB: En büyük ortak bölen

İki ya da daha fazla sayıyı **aynı anda kalansız bölen en büyük sayıya** EBOB denir.

Bulma yolu: Sayıları asal çarpanlarına ayır. **Ortak olan asal çarpanları, en küçük üsleriyle** çarp.

Örnek: 48 ve 72’nin EBOB’u.

$$48 = 2^4 \cdot 3 \qquad 72 = 2^3 \cdot 3^2$$

Ortak çarpanlar 2 ve 3. En küçük üsler: $2^3$ ve $3^1$.

$$\text{EBOB}(48, 72) = 2^3 \cdot 3 = 24$$

## 4. EKOK: En küçük ortak kat

İki ya da daha fazla sayının **ortak katlarının en küçüğüne** EKOK denir.

Bulma yolu: Sayıları asal çarpanlarına ayır. **Bütün asal çarpanları, en büyük üsleriyle** çarp.

$$\text{EKOK}(48, 72) = 2^4 \cdot 3^2 = 144$$

| | EBOB | EKOK |
| --- | --- | --- |
| Hangi çarpanlar? | Yalnızca ortak olanlar | Hepsi |
| Hangi üs? | En küçük | En büyük |
| Sonuç | Sayılardan küçük ya da eşit | Sayılardan büyük ya da eşit |

:::baglanti
İki sayı için şu ilişki her zaman geçerlidir: **Sayıların çarpımı = EBOB × EKOK.** Örneğin $48 \cdot 72 = 3456$ ve $24 \cdot 144 = 3456$. Bu ilişki, bir değer eksik olduğunda hızlı çözüm sağlar.
:::

### Aralarında asal sayılar

EBOB’u 1 olan iki sayıya **aralarında asal** denir. Örneğin 8 ile 15 aralarında asaldır, çünkü ortak asal çarpanları yoktur. Aralarında asal sayıların EKOK’u çarpımlarına eşittir: $\text{EKOK}(8, 15) = 120$.

Dikkat: İki sayının aralarında asal olması, ikisinin de asal olduğu anlamına gelmez. 8 asal değildir ama 15 ile aralarında asaldır.

## 5. Problemler: EBOB mu, EKOK mu?

### EBOB problemleri (bölme, paylaştırma)

**Örnek:** 180 cm × 252 cm boyutlarındaki dikdörtgen bir zemin, artık kalmayacak şekilde, eş ve en büyük kare karolarla döşenecektir. Karo kaç cm kenarlıdır ve kaç karo gerekir?

Kenar uzunluğu hem 180’i hem 252’yi bölmelidir, en büyük olması için EBOB alınır.

$$180 = 2^2 \cdot 3^2 \cdot 5, \quad 252 = 2^2 \cdot 3^2 \cdot 7 \Rightarrow \text{EBOB} = 2^2 \cdot 3^2 = 36$$

Karo 36 cm’dir. Karo sayısı: $\dfrac{180}{36} \cdot \dfrac{252}{36} = 5 \cdot 7 = 35$.

### EKOK problemleri (tekrar eden olaylar)

**Örnek:** Bir durakta A hattı 12 dakikada bir, B hattı 18 dakikada bir kalkıyor. İkisi saat 08.00’de birlikte kalkıyorsa tekrar ne zaman birlikte kalkar?

$$\text{EKOK}(12, 18) = 36$$

36 dakika sonra, yani 08.36’da birlikte kalkarlar.

:::neden-sonuc
- Bir şey eşit parçalara bölünüyor, “en fazla”, “en büyük” deniyor => EBOB kullan.
- Bir olay periyodik olarak tekrarlanıyor, “yeniden aynı anda”, “en az” deniyor => EKOK kullan.
- Kare, karo, kutu, grup sayısı soruluyor => EBOB, sonra bölme işlemi.
- Kaç dakika, saat, gün sonra denmişse => EKOK.
:::

## 6. Konuyu toparla

| Kavram | Kısa not |
| --- | --- |
| Asal çarpanlara ayırma | Sayıyı asal sayıların çarpımı olarak yazma |
| Çarpan sayısı | Üsler + 1 çarpılır |
| EBOB | Ortak çarpanlar, en küçük üs |
| EKOK | Tüm çarpanlar, en büyük üs |
| Çarpım ilişkisi | $a \cdot b = \text{EBOB} \cdot \text{EKOK}$ |
| Aralarında asal | EBOB = 1 |

## Mini test

:::soru{cevap="D"}
84 sayısının pozitif çarpan sayısı kaçtır?

- A) 6
- B) 8
- C) 10
- D) 12

---

1. $84 = 2^2 \cdot 3 \cdot 7$
2. Çarpan sayısı $(2+1)(1+1)(1+1) = 3 \cdot 2 \cdot 2 = 12$ olur. Doğru cevap D.
:::

:::soru{cevap="C"}
24 ve 36 sayılarının EBOB’u $a$, EKOK’u $b$ olduğuna göre $a + b$ toplamı kaçtır?

- A) 60
- B) 72
- C) 84
- D) 96

---

1. $24 = 2^3 \cdot 3$ ve $36 = 2^2 \cdot 3^2$.
2. $a = \text{EBOB} = 2^2 \cdot 3 = 12$ ve $b = \text{EKOK} = 2^3 \cdot 3^2 = 72$.
3. $a + b = 12 + 72 = 84$. Doğru cevap C.
:::

:::soru{cevap="A"}
Bir öğretmen elindeki 40 kalem, 56 silgi ve 72 defteri, hiçbiri artmayacak biçimde ve her öğrenciye her üründen eşit sayıda düşecek şekilde öğrencilere dağıtacaktır.

Buna göre en fazla kaç öğrenciye dağıtım yapılabilir?

- A) 8
- B) 6
- C) 4
- D) 2

---

1. “En fazla öğrenci” ve “eşit paylaştırma” ifadeleri EBOB’u işaret eder.
2. $40 = 2^3 \cdot 5$, $56 = 2^3 \cdot 7$, $72 = 2^3 \cdot 3^2$. Ortak çarpan $2^3$ tür.
3. $\text{EBOB}(40, 56, 72) = 8$. Her öğrenciye 5 kalem, 7 silgi, 9 defter düşer. Doğru cevap A.
:::

:::soru{cevap="B"}
Saat 09.00’da iki otobüs bir duraktan birlikte kalkıyor. Birinci otobüs 15 dakikada bir, ikinci otobüs 20 dakikada bir kalkıyor.

Buna göre otobüsler bu duraktan tekrar birlikte hangi saatte kalkar?

- A) 09.45
- B) 10.00
- C) 10.15
- D) 10.30

---

1. “Tekrar birlikte” ifadesi EKOK’u işaret eder.
2. $15 = 3 \cdot 5$, $20 = 2^2 \cdot 5$. $\text{EKOK} = 2^2 \cdot 3 \cdot 5 = 60$.
3. 60 dakika sonra, yani 10.00’da birlikte kalkarlar. Doğru cevap B.
:::

## Kendini dene

:::dene
1. 90 sayısını asal çarpanlarına ayır. => $90 = 2 \cdot 3^2 \cdot 5$
2. 18 ve 30’un EBOB ve EKOK değerlerini bul. => $18 = 2 \cdot 3^2$, $30 = 2 \cdot 3 \cdot 5$. EBOB = $2 \cdot 3 = 6$, EKOK = $2 \cdot 3^2 \cdot 5 = 90$.
3. İki sayının EBOB’u 6, EKOK’u 60’tır. Sayılardan biri 12 ise diğeri kaçtır? => Çarpım $= 6 \cdot 60 = 360$ olduğundan diğer sayı $360 / 12 = 30$.
4. 12 ile 35 aralarında asal mıdır? Neden? => Evet. $12 = 2^2 \cdot 3$, $35 = 5 \cdot 7$. Ortak asal çarpanları yok, EBOB’ları 1.
5. 150 cm ve 210 cm uzunluğundaki iki tahta, artık kalmayacak biçimde eşit uzunlukta en uzun parçalara bölünecek. Her parça kaç cm olur? => EBOB(150, 210) = 30. Her parça 30 cm olur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-mat' and name = 'Çarpanlar ve Katlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Asal çarpanlara ayırma, pozitif çarpan sayısı, EBOB ve EKOK, aralarında asal sayılar, EBOB ve EKOK problemleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Çarpan sayısı formülünün 8. sınıf kapsamında olması, (b) Bölünebilme kuralları tablosu (7. sınıf kazanımı olabilir, tekrar amacıyla konuldu), (c) Soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Çarpanlar ve Katlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Dünya’dan Güneş’e uzaklık yaklaşık 150 000 000 km, bir bakterinin boyu ise 0,000002 m. Bu kadar büyük ve küçük sayıları her seferinde sıfırlarla yazmak hem uzun hem hataya açıktır. **Üslü ifadeler** bu sayıları kısa yazmanın yoludur. Bu konuda üslü ifadelerle işlem yapmayı ve çok büyük ya da küçük sayıları **bilimsel gösterimle** yazmayı öğreneceksin.

:::hedefler
1. Üslü ifadelerin anlamını, sıfırıncı ve negatif üssü açıklamak.
2. Üslü ifadelerle çarpma, bölme ve üssün üssünü işlemek.
3. Üslü ifadeleri taban eşitleyerek karşılaştırmak ve sadeleştirmek.
4. Sayıları bilimsel gösterimle yazmak ve bu gösterimi yorumlamak.
:::

:::ipucu
Üslü ifade sorularında en güçlü silahın **tabanı eşitlemektir**. $4$, $8$, $16$, $32$ gibi sayıları görünce 2’nin kuvveti olarak yazmayı dene. İşlemler hemen kolaylaşır.
:::

## 1. Üslü ifade nedir?

Bir sayının kendisiyle tekrarlı çarpımı **üslü ifade** ile gösterilir.

$$a^n = \underbrace{a \cdot a \cdot a \cdots a}_{n\ \text{tane}}$$

Burada $a$ **taban**, $n$ **üs** (kuvvet) olarak adlandırılır. Örneğin $2^4 = 2 \cdot 2 \cdot 2 \cdot 2 = 16$.

### Negatif tabanlı ifadeler

Parantezin olup olmaması sonucu değiştirir.

- $(-2)^4 = (-2)(-2)(-2)(-2) = +16$ (taban $-2$)
- $-2^4 = -(2 \cdot 2 \cdot 2 \cdot 2) = -16$ (taban $2$, önünde eksi var)

**Negatif tabanın çift kuvveti pozitif, tek kuvveti negatiftir.** Örneğin $(-3)^2 = 9$ ve $(-3)^3 = -27$.

### Sıfırıncı ve negatif üs

- $a^0 = 1$ ($a \neq 0$ için). Örneğin $7^0 = 1$ ve $(-5)^0 = 1$.
- $a^{-n} = \dfrac{1}{a^n}$ ($a \neq 0$ için). Örneğin $2^{-3} = \dfrac{1}{2^3} = \dfrac{1}{8}$.
- Kesirli tabanda: $\left(\dfrac{a}{b}\right)^{-n} = \left(\dfrac{b}{a}\right)^n$. Örneğin $\left(\dfrac{2}{3}\right)^{-2} = \left(\dfrac{3}{2}\right)^2 = \dfrac{9}{4}$.

:::baglanti
Negatif üs, **sayıyı negatif yapmaz**, ters çevirir. $2^{-3}$ sayısı $-8$ değil, $\dfrac{1}{8}$ dir. Bu, öğrencilerin en çok karıştırdığı noktalardan biridir.
:::

## 2. Üslü ifadelerle işlemler

### Çarpma ve bölme

**Tabanlar aynıysa** üsler toplanır ya da çıkarılır.

$$a^m \cdot a^n = a^{m+n} \qquad \dfrac{a^m}{a^n} = a^{m-n}$$

Örnekler:

- $3^2 \cdot 3^4 = 3^6 = 729$
- $\dfrac{5^7}{5^4} = 5^3 = 125$
- $2^5 \cdot 2^{-2} = 2^3 = 8$

### Üssün üssü

$$(a^m)^n = a^{m \cdot n}$$

Örnek: $(3^2)^3 = 3^6 = 729$.

### Çarpımın ve bölümün üssü

$$(a \cdot b)^n = a^n \cdot b^n \qquad \left(\dfrac{a}{b}\right)^n = \dfrac{a^n}{b^n}$$

Örnek: $(2 \cdot 5)^3 = 2^3 \cdot 5^3 = 8 \cdot 125 = 1000$.

| Kural | Formül |
| --- | --- |
| Aynı tabanlı çarpma | $a^m \cdot a^n = a^{m+n}$ |
| Aynı tabanlı bölme | $a^m / a^n = a^{m-n}$ |
| Üssün üssü | $(a^m)^n = a^{m \cdot n}$ |
| Çarpımın üssü | $(ab)^n = a^n b^n$ |
| Sıfırıncı üs | $a^0 = 1$ |
| Negatif üs | $a^{-n} = 1 / a^n$ |

:::dene
1. $2^3 \cdot 2^{-5}$ işleminin sonucu kaçtır? => $2^{3-5} = 2^{-2} = \dfrac{1}{4}$
2. $\dfrac{9^2}{3^3}$ işleminin sonucu kaçtır? => $9^2 = (3^2)^2 = 3^4$ olduğundan $\dfrac{3^4}{3^3} = 3$.
:::

### Tabanı eşitleme

Tabanlar farklıysa ama biri diğerinin kuvvetiyse **tabanları eşitle**.

Örnek: $4^2 \cdot 2^3$ ifadesinde $4 = 2^2$ olduğundan:

$$4^2 \cdot 2^3 = (2^2)^2 \cdot 2^3 = 2^4 \cdot 2^3 = 2^7 = 128$$

## 3. On’un kuvvetleri ve bilimsel gösterim

On’un kuvvetleri çok büyük ve çok küçük sayıları kolay yazmamızı sağlar.

| Kuvvet | Değeri |
| --- | --- |
| $10^3$ | 1 000 |
| $10^1$ | 10 |
| $10^0$ | 1 |
| $10^{-1}$ | 0,1 |
| $10^{-3}$ | 0,001 |

**Bilimsel gösterim**, bir sayıyı $a \times 10^n$ biçiminde yazmaktır. Burada $1 \leq a < 10$ ve $n$ bir tam sayıdır.

- Çok büyük sayılarda üs **pozitiftir**. $45\,000 = 4{,}5 \times 10^4$
- Çok küçük sayılarda üs **negatiftir**. $0{,}00032 = 3{,}2 \times 10^{-4}$

Virgülü kaç basamak kaydırdığın üssü verir. Büyük sayıda **sola** kaydırırsan üs pozitif, küçük sayıda **sağa** kaydırırsan üs negatif olur.

:::neden-sonuc
- Sayı 10’dan büyük (ör. 45 000) => Virgül **sola** 4 basamak kaydırılır. $4{,}5 \times 10^4$
- Sayı 1’den küçük (ör. 0,00032) => Virgül **sağa** 4 basamak kaydırılır. $3{,}2 \times 10^{-4}$
- Çarpandaki ilk sayı 1 ile 10 arasında değilse => Gösterim bilimsel gösterim değildir. $32 \times 10^3$ yazmak yerine $3{,}2 \times 10^4$ yazılmalı.
:::

### Bilimsel gösterimle işlem

Çarpma ve bölmede önce $a$’lar, sonra on’un kuvvetleri işlenir.

$$(2 \times 10^3) \cdot (3 \times 10^4) = 6 \times 10^7$$

$$\dfrac{8 \times 10^5}{2 \times 10^2} = 4 \times 10^3$$

Sonuçta $a$ değeri 10 ya da daha büyük olursa düzeltilir: $(5 \times 10^3)(4 \times 10^2) = 20 \times 10^5 = 2 \times 10^6$.

## 4. Üslü ifadeleri karşılaştırma

Tabanlar ya da üsler eşitlenerek karşılaştırma yapılır.

- Tabanlar **aynı ve 1’den büyükse** üssü büyük olan büyüktür. $2^5 > 2^3$.
- Üsler **aynı ve taban pozitifse** tabanı büyük olan büyüktür. $5^2 > 3^2$.
- Tabanları farklıysa tabanları eşitle: $4^3$ ile $2^7$ için $4^3 = 2^6$ olduğundan $2^7 > 4^3$.

## 5. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Çift kuvvet | Negatif tabanın çift kuvveti pozitif |
| Tek kuvvet | Negatif tabanın tek kuvveti negatif |
| $a^0$ | 1 |
| $a^{-n}$ | $1 / a^n$ (ters çevirir) |
| Çarpma | Üsler toplanır |
| Bölme | Üsler çıkarılır |
| Bilimsel gösterim | $a \times 10^n$, $1 \leq a < 10$ |

## Mini test

:::soru{cevap="B"}
$\dfrac{2^5 \cdot 4^2}{8^2}$ işleminin sonucu kaçtır?

- A) 4
- B) 8
- C) 16
- D) 32

---

1. Tabanları 2’ye eşitle: $4^2 = 2^4$ ve $8^2 = 2^6$.
2. $\dfrac{2^5 \cdot 2^4}{2^6} = \dfrac{2^9}{2^6} = 2^3 = 8$.
3. Doğru cevap B.
:::

:::soru{cevap="C"}
Bir kumaş ipliğinin kalınlığı 0,00045 m’dir.

Bu kalınlığın bilimsel gösterimi aşağıdakilerden hangisidir?

- A) $45 \times 10^{-5}$
- B) $4{,}5 \times 10^{4}$
- C) $4{,}5 \times 10^{-4}$
- D) $0{,}45 \times 10^{-3}$

---

1. Bilimsel gösterimde $a$ sayısı 1 ile 10 arasında olmalıdır. A ve D bu şartı sağlamaz.
2. 0,00045 sayısında virgül sağa 4 basamak kaydırılarak 4,5 elde edilir. Sayı 1’den küçük olduğu için üs negatiftir: $-4$.
3. Doğru cevap C.
:::

:::soru{cevap="A"}
$(-3)^2 - 3^2 + (-3)^3$ işleminin sonucu kaçtır?

- A) $-27$
- B) $-9$
- C) $0$
- D) $18$

---

1. $(-3)^2 = 9$ ve $3^2 = 9$. Bu ikisinin farkı 0’dır.
2. $(-3)^3 = -27$ (negatifin tek kuvveti negatiftir).
3. Sonuç $0 + (-27) = -27$. Doğru cevap A.
:::

:::soru{cevap="D"}
Bir bakterinin uzunluğu $2 \times 10^{-6}$ metredir. Bu bakteriden 5 000 tanesi uç uca dizilirse oluşan sıranın uzunluğu kaç santimetre olur?

- A) 0,1
- B) 0,5
- C) 2
- D) 1

---

1. 5 000 sayısını bilimsel gösterimle yazalım: $5 \times 10^3$.
2. Toplam uzunluk $= (5 \times 10^3) \cdot (2 \times 10^{-6}) = 10 \times 10^{-3} = 10^{-2}$ metre.
3. $10^{-2}$ m $= 0{,}01$ m $= 1$ cm. Doğru cevap D.
:::

## Kendini dene

:::dene
1. $5^0 + 2^{-1}$ işleminin sonucu kaçtır? => $1 + \dfrac{1}{2} = \dfrac{3}{2}$
2. $(2^3)^2 \cdot 2^{-4}$ ifadesini sadeleştir. => $2^6 \cdot 2^{-4} = 2^2 = 4$
3. $\left(\dfrac{3}{2}\right)^{-3}$ işleminin sonucu kaçtır? => $\left(\dfrac{2}{3}\right)^3 = \dfrac{8}{27}$
4. 7 300 000 sayısını bilimsel gösterimle yaz. => $7{,}3 \times 10^6$
5. $(4 \times 10^5) \cdot (3 \times 10^{-2})$ işleminin sonucunu bilimsel gösterimle yaz. => $12 \times 10^3 = 1{,}2 \times 10^4$
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 12, false from public.topics where subject_id = 'lgs-mat' and name = 'Üslü İfadeler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Tam sayı kuvvetleri (sıfırıncı ve negatif üs dahil), üslü ifadelerle işlemler, ondalık gösterimin 10’un kuvvetleriyle yazılması, bilimsel gösterim. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Kesirli tabanın negatif üssü ve bilimsel gösterimle çarpma-bölme programda aranıyorsa kalır, (b) Üslü ifadeleri karşılaştırma bölümü, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Üslü İfadeler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Alanı 49 cm² olan bir karenin kenarı kaç santimetredir? 7. Peki alanı 50 cm² olan karenin kenarı? 7’den biraz büyük, ama tam sayı değil. İşte bu sayılar **kareköklü ifadelerdir**. Bu konuda karekökü tanıyacak, kök içindeki ifadeleri sadeleştirmeyi ve kareköklü sayılarla işlem yapmayı öğreneceksin. Ayrıca sayı kümelerinde yeni bir grup olan **irrasyonel sayıları** tanıyacaksın.

:::hedefler
1. Tam kare sayıları ve bir sayının karekökünü açıklamak.
2. Kareköklü ifadeyi $a\sqrt{b}$ biçiminde yazmak ve kök içine almak.
3. Kareköklü ifadelerle çarpma, bölme, toplama ve çıkarma işlemlerini yapmak.
4. Rasyonel ve irrasyonel sayıları ayırt etmek, kareköklü sayıları sayı doğrusunda yaklaşık yerine yerleştirmek.
:::

:::ipucu
Kareköklü sorularda ilk hamle hep aynıdır. **Kökün içini en büyük tam karenin çarpımı olarak yaz.** Örneğin 72’yi görünce “36 · 2” diye düşün. Sonra kök dışına çıkar.
:::

## 1. Tam kare sayılar ve karekök

Bir doğal sayının kendisiyle çarpımına **tam kare sayı** denir. İlk tam kareleri ezbere bil.

| Sayı | Karesi | Sayı | Karesi |
| --- | --- | --- | --- |
| 1 | 1 | 7 | 49 |
| 2 | 4 | 8 | 64 |
| 3 | 9 | 9 | 81 |
| 4 | 16 | 10 | 100 |
| 5 | 25 | 11 | 121 |
| 6 | 36 | 12 | 144 |

**Karekök**, karesi o sayıya eşit olan negatif olmayan sayıdır. $\sqrt{a}$ ile gösterilir.

$$\sqrt{49} = 7 \quad \text{çünkü} \quad 7^2 = 49$$

Dikkat edilecek noktalar:

- Karekök işaretinin sonucu **negatif olmaz**. $\sqrt{16} = 4$ tür, $-4$ değildir.
- Negatif sayıların karekökü gerçek sayılarda **tanımsızdır**. $\sqrt{-9}$ bir gerçek sayı değildir.
- $\sqrt{a^2} = a$ ($a \geq 0$ için).

Ondalık sayıların ve kesirlerin de kareköklerini alabiliriz: $\sqrt{0{,}04} = 0{,}2$ ve $\sqrt{\dfrac{9}{25}} = \dfrac{3}{5}$.

## 2. Karekökün yaklaşık değeri

Tam kare olmayan bir sayının karekökü, iki ardışık doğal sayı arasındadır. Sayıyı kendisine en yakın iki tam kare arasına yerleştir.

Örnek: $\sqrt{20}$

$$16 < 20 < 25 \Rightarrow 4 < \sqrt{20} < 5$$

$\sqrt{20}$, 4 ile 5 arasındadır. 20, 16’ya 25’ten daha yakın olduğu için sonuç 4’e daha yakındır (yaklaşık 4,5).

:::dene
1. $\sqrt{50}$ hangi iki ardışık doğal sayı arasındadır? => $49 < 50 < 64$ olduğundan 7 ile 8 arasındadır.
2. $\sqrt{40}$ ile $\sqrt{90}$ arasında kaç tam sayı vardır? => $\sqrt{40}$ yaklaşık 6,3 ve $\sqrt{90}$ yaklaşık 9,5 tir. Aradaki tam sayılar 7, 8, 9 olup 3 tanedir.
:::

## 3. Kök dışına çıkarma ve kök içine alma

İç içe çarpımlar kökün içinden dışarı çıkarılabilir.

$$\sqrt{a^2 \cdot b} = a\sqrt{b}$$

Örnekler:

- $\sqrt{72} = \sqrt{36 \cdot 2} = 6\sqrt{2}$
- $\sqrt{48} = \sqrt{16 \cdot 3} = 4\sqrt{3}$
- $\sqrt{200} = \sqrt{100 \cdot 2} = 10\sqrt{2}$

Tersi de mümkündür. Katsayıyı **karesi alınarak** kök içine alınır.

$$a\sqrt{b} = \sqrt{a^2 \cdot b}$$

Örnek: $3\sqrt{5} = \sqrt{9 \cdot 5} = \sqrt{45}$.

Kök içine alma, iki kareköklü ifadeyi **karşılaştırırken** işe yarar.

**Örnek:** $3\sqrt{2}$ ile $2\sqrt{5}$’i karşılaştır.

$$3\sqrt{2} = \sqrt{18} \qquad 2\sqrt{5} = \sqrt{20} \Rightarrow 2\sqrt{5} > 3\sqrt{2}$$

:::baglanti
Kök dışına çıkarırken yalnızca **tam kare çarpanlar** dışarı çıkar. $\sqrt{18}$ için $18 = 9 \cdot 2$ yazıp $3\sqrt{2}$ buluruz. $\sqrt{18}$ sayısını $\sqrt{2 \cdot 9}$ yerine $\sqrt{6 \cdot 3}$ gibi bölmek işe yaramaz, çünkü 6 ve 3 tam kare değildir.
:::

## 4. Kareköklü ifadelerle işlemler

### Çarpma ve bölme

$$\sqrt{a} \cdot \sqrt{b} = \sqrt{a \cdot b} \qquad \dfrac{\sqrt{a}}{\sqrt{b}} = \sqrt{\dfrac{a}{b}}$$

Örnekler:

- $\sqrt{12} \cdot \sqrt{3} = \sqrt{36} = 6$
- $\dfrac{\sqrt{75}}{\sqrt{3}} = \sqrt{25} = 5$
- $2\sqrt{3} \cdot 5\sqrt{2} = 10\sqrt{6}$ (katsayılar kendi arasında, kök içleri kendi arasında çarpılır)

### Toplama ve çıkarma

Toplama ve çıkarma yapabilmek için **kök içleri aynı** olmalıdır. Katsayılar toplanır, kök aynen yazılır. Kök içleri farklıysa önce kök dışına çıkararak aynı hâle getir.

$$5\sqrt{3} + 2\sqrt{3} = 7\sqrt{3}$$

$$\sqrt{50} + \sqrt{18} = 5\sqrt{2} + 3\sqrt{2} = 8\sqrt{2}$$

:::neden-sonuc
- Kök içleri aynı => Katsayılar toplanır ya da çıkarılır. $4\sqrt{7} - \sqrt{7} = 3\sqrt{7}$
- Kök içleri farklı ve tam kare çarpanı var => Önce kök dışına çıkar, sonra işlem yap.
- Kök içleri farklı ve sadeleşmiyor => İşlem yapılamaz. $\sqrt{2} + \sqrt{3}$ ifadesi $\sqrt{5}$ **değildir**.
:::

## 5. Rasyonel ve irrasyonel sayılar

- **Rasyonel sayılar:** $\dfrac{a}{b}$ biçiminde yazılabilen sayılardır ($a$ ve $b$ tam sayı, $b \neq 0$). Tam sayılar, ondalık sayılar ve devirli ondalık sayılar rasyoneldir. Örneğin $\sqrt{49} = 7$, $0{,}25$, $\dfrac{2}{3}$.
- **İrrasyonel sayılar:** Kesir biçiminde yazılamayan sayılardır. Ondalık açılımı **ne bitiyor ne de belli bir düzende tekrar ediyor**. Örneğin $\sqrt{2}$, $\sqrt{3}$, $\pi$.

Rasyonel ve irrasyonel sayıların birleşimine **gerçek (reel) sayılar** denir. Sayı doğrusundaki her nokta bir gerçek sayıya karşılık gelir.

| Sayı | Rasyonel mi? | Neden |
| --- | --- | --- |
| $\sqrt{25}$ | Evet | $=5$ |
| $\sqrt{18}$ | Hayır | $3\sqrt{2}$, tam kare değil |
| $\sqrt{0{,}09}$ | Evet | $=0{,}3$ |
| $\pi$ | Hayır | Ondalık açılımı bitmez ve tekrar etmez |
| $2\sqrt{9}$ | Evet | $=6$ |

## 6. Kareköklü sayıların sayı doğrusunda gösterimi

$\sqrt{10}$ sayısının yerini bulmak için önce en yakın tam kareleri bul: $9 < 10 < 16$ olduğundan $3 < \sqrt{10} < 4$. 10, 9’a çok yakın olduğu için $\sqrt{10}$ yaklaşık 3,2’dir. Sayı doğrusunda 3 ile 4 arasında, 3’e yakın bir yere işaretlenir.

## 7. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Karekök sonucu | Negatif olmaz |
| Kök dışına çıkarma | $\sqrt{a^2 b} = a\sqrt{b}$ |
| Kök içine alma | $a\sqrt{b} = \sqrt{a^2 b}$ |
| Çarpma | $\sqrt{a}\sqrt{b} = \sqrt{ab}$ |
| Toplama | Yalnızca kök içleri aynıysa |
| İrrasyonel sayı | Kesir olarak yazılamaz ($\sqrt{2}$, $\pi$) |

## Mini test

:::soru{cevap="B"}
$\sqrt{72} + \sqrt{18} - \sqrt{8}$ işleminin sonucu kaçtır?

- A) $5\sqrt{2}$
- B) $7\sqrt{2}$
- C) $9\sqrt{2}$
- D) $11\sqrt{2}$

---

1. $\sqrt{72} = \sqrt{36 \cdot 2} = 6\sqrt{2}$
2. $\sqrt{18} = \sqrt{9 \cdot 2} = 3\sqrt{2}$
3. $\sqrt{8} = \sqrt{4 \cdot 2} = 2\sqrt{2}$
4. $6\sqrt{2} + 3\sqrt{2} - 2\sqrt{2} = 7\sqrt{2}$. Doğru cevap B.
:::

:::soru{cevap="D"}
$\sqrt{20}$ ile $\sqrt{70}$ arasında kaç tane doğal sayı vardır?

- A) 2
- B) 3
- C) 5
- D) 4

---

1. $16 < 20 < 25$ olduğundan $\sqrt{20}$, 4 ile 5 arasındadır.
2. $64 < 70 < 81$ olduğundan $\sqrt{70}$, 8 ile 9 arasındadır.
3. $\sqrt{20}$ ile $\sqrt{70}$ arasındaki doğal sayılar 5, 6, 7, 8 olup 4 tanedir. Doğru cevap D.
:::

:::soru{cevap="C"}
Alanı 48 cm² olan bir karenin çevresi kaç santimetredir?

- A) $8\sqrt{3}$
- B) $12\sqrt{3}$
- C) $16\sqrt{3}$
- D) $24\sqrt{3}$

---

1. Karenin kenarı alanın karekökü olduğundan $a = \sqrt{48} = \sqrt{16 \cdot 3} = 4\sqrt{3}$ cm.
2. Çevre $= 4a = 4 \cdot 4\sqrt{3} = 16\sqrt{3}$ cm. Doğru cevap C.
:::

:::soru{cevap="A"}
Aşağıdaki sayılardan hangisi **irrasyonel** bir sayıdır?

- A) $\sqrt{20}$
- B) $\sqrt{25}$
- C) $\sqrt{0{,}36}$
- D) $\sqrt{\dfrac{9}{16}}$

---

1. $\sqrt{25} = 5$, $\sqrt{0{,}36} = 0{,}6$ ve $\sqrt{\dfrac{9}{16}} = \dfrac{3}{4}$. Üçü de rasyoneldir.
2. $20$ tam kare değildir, $\sqrt{20} = 2\sqrt{5}$ kesir olarak yazılamaz. İrrasyoneldir. Doğru cevap A.
:::

## Kendini dene

:::dene
1. $\sqrt{98}$ ifadesini $a\sqrt{b}$ biçiminde yaz. => $\sqrt{49 \cdot 2} = 7\sqrt{2}$
2. $4\sqrt{3}$ ifadesini kök içine al. => $\sqrt{16 \cdot 3} = \sqrt{48}$
3. $\sqrt{6} \cdot \sqrt{24}$ işleminin sonucu kaçtır? => $\sqrt{144} = 12$
4. $\sqrt{45} - 2\sqrt{5}$ işleminin sonucu kaçtır? => $3\sqrt{5} - 2\sqrt{5} = \sqrt{5}$
5. $2\sqrt{7}$ ile $3\sqrt{3}$ sayılarından hangisi büyüktür? => $2\sqrt{7} = \sqrt{28}$, $3\sqrt{3} = \sqrt{27}$. Bu yüzden $2\sqrt{7}$ büyüktür.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-mat' and name = 'Kareköklü İfadeler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Tam kare sayılar, karekök, kök içine alma ve dışına çıkarma, kareköklü ifadelerle çarpma, bölme, toplama, çıkarma, rasyonel ve irrasyonel sayılar, gerçek sayılar, sayı doğrusunda gösterim. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Paydayı rasyonel yapma konusu bilerek konmadı, programda varsa eklenmeli, (b) Kareköklü ifadeleri karşılaştırma, (c) Sayı kümeleri (rasyonel, irrasyonel, gerçek) anlatımı, (d) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Kareköklü İfadeler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sınıfın not ortalaması 70 olabilir ama bu, herkesin 70 civarında aldığı anlamına gelmez. Bir mahalledeki evlerin ortalama fiyatı, tek bir lüks villa yüzünden yanıltıcı çıkabilir. Veri analizi, sayılara **doğru okuma** gözüyle bakmayı öğretir. Bu konuda verileri grafiklerle göstermeyi ve **ortalama, ortanca, tepe değer ve açıklık** gibi ölçülerle yorumlamayı öğreneceksin.

:::hedefler
1. Verilerin türüne göre uygun grafiği (sütun, çizgi, daire) seçmek.
2. Aritmetik ortalama, ortanca (medyan), tepe değer (mod) ve açıklığı hesaplamak.
3. Bir veri eklendiğinde ya da çıkarıldığında ortalamanın nasıl değiştiğini yorumlamak.
4. Aşırı değerlerin hangi ölçüyü daha çok etkilediğini açıklamak.
:::

:::ipucu
Soruyu çözmeden önce şu soruyu sor: **“Bu ölçü neyi anlatıyor?”** Ortalama “tüm değerleri eşitleyince ne olur” der, ortanca “ortadaki değer”, tepe değer “en çok tekrar eden”, açıklık “veriler ne kadar yayılmış” der.
:::

## 1. Veri nedir, nasıl gösterilir?

**Veri**, bir durumla ilgili toplanan bilgilerdir (boy, not, sıcaklık, satış sayısı gibi). Veriler önce **tabloya** yazılır, sonra grafikle gösterilir. Grafik seçimi, verinin türüne bağlıdır.

| Grafik | Ne zaman kullanılır? | Örnek |
| --- | --- | --- |
| Sütun grafiği | Kategorileri karşılaştırmak | Sınıftaki öğrencilerin sevdiği spor dalları |
| Çizgi grafiği | Zaman içindeki değişimi göstermek | Bir bitkinin haftalara göre boyu |
| Daire grafiği | Bütünün parçalarını göstermek | Bir ailenin aylık bütçesinin dağılımı |

### Daire grafiği

Daire grafiğinde bütün, **360°** lik daireyi temsil eder. Her dilimin açısı, o kategorinin bütündeki payıyla orantılıdır.

$$\text{Dilim açısı} = \dfrac{\text{Kategorideki sayı}}{\text{Toplam}} \cdot 360^\circ$$

Örnek: 120 öğrencinin 30’u futbolu seviyorsa, futbol diliminin açısı $\dfrac{30}{120} \cdot 360^\circ = 90^\circ$ olur.

Dilimlerin açıları toplamı her zaman 360°’dir. Yüzde olarak da gösterilebilir: $90^\circ$ dilim $\%25$ e karşılık gelir.

:::dene
1. 200 öğrencinin 50’si müziği seviyor. Daire grafiğinde müzik diliminin açısı kaç derecedir? => $\dfrac{50}{200} \cdot 360^\circ = 90^\circ$
2. Bir daire grafiğinde 72°’lik dilim toplam 150 kişiden kaç kişiyi gösterir? => $\dfrac{72}{360} \cdot 150 = 30$ kişi
:::

## 2. Aritmetik ortalama

**Aritmetik ortalama**, bütün verilerin toplamının veri sayısına bölünmesidir.

$$\text{Ortalama} = \dfrac{\text{Verilerin toplamı}}{\text{Veri sayısı}}$$

Örnek: 4, 7, 7, 8, 10, 12, 15 sayılarının ortalaması:

$$\dfrac{4+7+7+8+10+12+15}{7} = \dfrac{63}{7} = 9$$

### Ortalama değişirse ne olur?

Ortalama problemlerinde **toplam** kavramı işini kolaylaştırır. $\text{Toplam} = \text{Ortalama} \cdot \text{Veri sayısı}$ olduğunu hatırla.

**Örnek:** 5 sayının ortalaması 12’dir. Bu sayılara bir sayı daha eklenince ortalama 14 oluyor. Eklenen sayı kaçtır?

1. İlk toplam: $5 \cdot 12 = 60$
2. Yeni toplam: $6 \cdot 14 = 84$
3. Eklenen sayı: $84 - 60 = 24$

:::neden-sonuc
- Ortalamadan büyük bir veri eklenir => Ortalama artar.
- Ortalamadan küçük bir veri eklenir => Ortalama azalır.
- Ortalamaya eşit bir veri eklenir => Ortalama değişmez.
- Bütün verilere aynı sayı eklenir => Ortalama da o sayı kadar artar.
:::

## 3. Ortanca (medyan)

Veriler **küçükten büyüğe sıralandığında ortadaki** değere ortanca denir.

- Veri sayısı **tekse**, tam ortadaki değer ortancadır. 4, 7, 7, 8, 10, 12, 15 için ortanca 8’dir.
- Veri sayısı **çiftse**, ortadaki iki değerin ortalaması ortancadır. 3, 5, 6, 9 için ortanca $\dfrac{5+6}{2} = 5{,}5$.

**Önce sırala, sonra ortayı bul.** Veriler sıralı verilmemişse en sık yapılan hata budur.

## 4. Tepe değer (mod)

Veri grubunda **en çok tekrar eden** değere tepe değer denir.

- 4, 7, 7, 8, 10, 12, 15 verisinde tepe değer 7’dir.
- Hiçbir değer tekrar etmiyorsa tepe değer yoktur.
- İki değer eşit sayıda ve en çok tekrar ediyorsa **iki tepe değer** vardır.

Tepe değer, kategorik verilerde de kullanılır. “En çok sevilen renk” bir tepe değer sorusudur.

## 5. Açıklık

**Açıklık**, en büyük veri ile en küçük veri arasındaki farktır. Verilerin ne kadar yayıldığını gösterir.

$$\text{Açıklık} = \text{En büyük değer} - \text{En küçük değer}$$

4, 7, 7, 8, 10, 12, 15 verisinin açıklığı $15 - 4 = 11$ dir.

| Ölçü | 4, 7, 7, 8, 10, 12, 15 için | Ne söyler? |
| --- | --- | --- |
| Aritmetik ortalama | 9 | Değerlerin “denge noktası” |
| Ortanca | 8 | Sıralı verinin ortası |
| Tepe değer | 7 | En çok tekrar eden |
| Açıklık | 11 | Yayılım |

## 6. Aşırı değerler hangi ölçüyü etkiler?

Diğerlerinden çok farklı bir değere **aşırı değer** denir.

Örnek: 2, 3, 3, 4, 100 verisi için:

- Ortalama $= \dfrac{112}{5} = 22{,}4$ (yüksek, aşırı değerden çok etkilendi)
- Ortanca $= 3$ (neredeyse hiç etkilenmedi)
- Tepe değer $= 3$
- Açıklık $= 98$ (çok arttı)

:::baglanti
Aşırı değer olduğunda **ortalama yanıltıcı olabilir**. Bu yüzden maaş, ev fiyatı gibi uç değerlerin bulunduğu verilerde ortanca daha dürüst bir göstergedir. Bu, soruda “hangi ölçü daha uygun?” diye sorulursa kullanabileceğin bir argümandır.
:::

## 7. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Daire grafiği | Toplam 360°, dilim açısı pay oranına eşit |
| Ortalama | Toplam / veri sayısı |
| Ortanca | Sıralı verinin ortası (çiftse ortadaki ikinin ortalaması) |
| Tepe değer | En çok tekrar eden |
| Açıklık | En büyük − en küçük |
| Aşırı değer | Ortalamayı ve açıklığı çok etkiler, ortancayı az |

## Mini test

:::soru{cevap="B"}
Bir sınıftaki 6 öğrencinin matematik puanları 4, 6, 8, 10, 14, 18 şeklindedir.

Buna göre bu verinin ortancası kaçtır?

- A) 8
- B) 9
- C) 10
- D) 12

---

1. Veri zaten küçükten büyüğe sıralıdır ve 6 değer vardır. Ortadaki iki değer 8 ile 10’dur.
2. Ortanca $\dfrac{8+10}{2} = 9$ olur. Doğru cevap B.
:::

:::soru{cevap="C"}
Bir okulda 200 öğrenciye en sevdikleri ders sorulmuştur. Sonuçlar daire grafiğiyle gösterilmiş ve “Matematik” dilimi 72° çıkmıştır.

Buna göre matematiği seçen öğrenci sayısı kaçtır?

- A) 20
- B) 30
- C) 40
- D) 72

---

1. Dilimin tüm daire içindeki oranı $\dfrac{72}{360} = \dfrac{1}{5}$ tir.
2. Öğrenci sayısı $\dfrac{1}{5} \cdot 200 = 40$. Doğru cevap C.
:::

:::soru{cevap="A"}
5 sayının aritmetik ortalaması 12’dir. Bu sayılara 24 sayısı eklenirse yeni ortalama kaç olur?

- A) 14
- B) 15
- C) 16
- D) 18

---

1. İlk toplam: $5 \cdot 12 = 60$.
2. 24 eklenince toplam $60 + 24 = 84$ ve veri sayısı 6 olur.
3. Yeni ortalama $\dfrac{84}{6} = 14$. Doğru cevap A.
:::

:::soru{cevap="D"}
Bir öğrenci, evde yetiştirdiği fasulye bitkisinin boyunu her hafta ölçüp 8 hafta boyunca kaydetmiştir. Bitkinin zaman içindeki büyümesini en iyi gösterecek grafik hangisidir?

- A) Daire grafiği
- B) Sütun grafiği
- C) Tablo
- D) Çizgi grafiği

---

1. Daire grafiği bütünün parçalarını gösterir, zaman değişimi için uygun değildir.
2. Zaman içindeki **değişimi** göstermek için en uygun grafik çizgi grafiğidir. Doğru cevap D.
:::

## Kendini dene

:::dene
1. 12, 15, 15, 18, 20 verisinin ortalamasını, ortancasını, tepe değerini ve açıklığını bul. => Ortalama $\dfrac{80}{5} = 16$, ortanca 15, tepe değer 15, açıklık $20 - 12 = 8$.
2. Bir sınıfta 10 öğrencinin sınav ortalaması 70’tir. 70 alan bir öğrenci daha gelirse ortalama ne olur? => Değişmez. Ortalamaya eşit bir veri eklendi.
3. 1, 2, 2, 3, 3, 3, 50 verisinde ortalama ve ortancadan hangisi daha güvenilir bir özet verir? => Ortanca (3). Ortalama, 50 gibi aşırı değerden çok etkilenir.
4. Bir daire grafiğinde dilimlerden biri toplamın %30’udur. Bu dilimin açısı kaç derecedir? => $0{,}30 \cdot 360^\circ = 108^\circ$
5. Beş sayının ortalaması 8’dir. Sayılardan biri çıkarılınca ortalama 7 oluyor. Çıkarılan sayı kaçtır? => İlk toplam 40, yeni toplam $4 \cdot 7 = 28$. Çıkarılan sayı $40 - 28 = 12$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 12, false from public.topics where subject_id = 'lgs-mat' and name = 'Veri Analizi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Verileri sütun, çizgi ve daire grafiğiyle gösterme, aritmetik ortalama, ortanca, tepe değer ve açıklık, aşırı değerin ölçülere etkisi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Histogram ve kutu grafiği 8. sınıf programında yok varsayıldı, bilerek konmadı, (b) Daire grafiğinde dilim açısı hesapları, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Veri Analizi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yazı tura atarken “yazı gelme şansı yarı yarıya” deriz. Peki bu “şans” sayıyla nasıl ifade edilir? Bir torbadan rastgele çekilen topun kırmızı olma ihtimali nasıl hesaplanır? Bu konuda şansı **olasılık** adı verilen bir sayıyla ifade etmeyi öğreneceksin.

:::hedefler
1. Deney, çıktı, örnek uzay ve olay kavramlarını açıklamak.
2. Basit bir olayın olma olasılığını kesir, ondalık sayı ve yüzde olarak yazmak.
3. Kesin ve imkânsız olayları ayırt etmek.
4. Bir olayın olmama olasılığını hesaplamak ve deneysel ile teorik olasılığı karşılaştırmak.
:::

:::ipucu
Olasılık sorularında önce **tüm durumların sayısını**, sonra **istenen durumların sayısını** say. Cevap her zaman “istenen / tüm” kesridir. Sonuç 0 ile 1 arasında çıkmıyorsa bir yerde hata yapmışsındır.
:::

## 1. Temel kavramlar

- **Deney:** Sonucu önceden kesin bilinmeyen işlem. Zar atmak, yazı tura atmak, torbadan top çekmek.
- **Çıktı:** Deneyin her bir olası sonucu. Zar atılınca 1, 2, 3, 4, 5, 6 ayrı çıktılardır.
- **Örnek uzay:** Bir deneyin bütün olası çıktılarının kümesi. Zar için örnek uzay $\{1, 2, 3, 4, 5, 6\}$ dir. Örnek uzaydaki eleman sayısı **tüm durumların sayısıdır**.
- **Olay:** Örnek uzayın istediğimiz çıktılardan oluşan parçası. “Çift sayı gelmesi” olayı $\{2, 4, 6\}$ dır.

## 2. Olasılık nasıl hesaplanır?

Çıktıların **eşit şansa sahip** olduğu bir deneyde, bir olayın olasılığı şöyle hesaplanır.

$$P(\text{olay}) = \dfrac{\text{İstenen durum sayısı}}{\text{Tüm durum sayısı}}$$

Örnek: Bir zar atıldığında asal sayı gelme olasılığı. Asal sayılar: 2, 3, 5. İstenen durum sayısı 3, tüm durum sayısı 6’dır.

$$P(\text{asal}) = \dfrac{3}{6} = \dfrac{1}{2}$$

Olasılık kesir, ondalık sayı ya da yüzde ile yazılabilir. $\dfrac{1}{2} = 0{,}5 = \%50$.

:::dene
1. Bir zar atıldığında 3’ten büyük bir sayı gelme olasılığı kaçtır? => 4, 5, 6 istenen durumlardır. $\dfrac{3}{6} = \dfrac{1}{2}$.
2. Bir madeni para atıldığında tura gelme olasılığı kaçtır? => Tüm durumlar yazı ve tura olmak üzere 2, istenen 1. $\dfrac{1}{2}$.
:::

### Olasılığın sınırları

Bir olayın olasılığı her zaman **0 ile 1 arasındadır**.

$$0 \leq P(\text{olay}) \leq 1$$

- **İmkânsız olay:** Hiçbir durumda gerçekleşemez. Olasılığı $0$. Örneğin zar atılınca 7 gelmesi.
- **Kesin olay:** Her durumda gerçekleşir. Olasılığı $1$. Örneğin zar atılınca 6’dan küçük ya da 6’ya eşit bir sayı gelmesi.
- Olasılığı 1’e yaklaştıkça olay **daha olası**, 0’a yaklaştıkça **daha az olasıdır**.

## 3. Olmama olasılığı

Bir olayın olmama olasılığı, o olayın **tümleyenidir**. Bir olay ya olur ya olmaz, bu iki olasılığın toplamı 1’dir.

$$P(\text{olmama}) = 1 - P(\text{olma})$$

Örnek: Bir torbada 5 kırmızı, 3 mavi ve 2 yeşil top vardır. Rastgele çekilen topun mavi **olmama** olasılığı:

1. Mavi olma olasılığı $\dfrac{3}{10}$.
2. Mavi olmama olasılığı $1 - \dfrac{3}{10} = \dfrac{7}{10}$.

Aynı sonuca “istenen durumları doğrudan say” yoluyla da ulaşılır: mavi olmayan toplar $5 + 2 = 7$ tanedir ve $\dfrac{7}{10}$ bulunur.

:::baglanti
Soruda “en az”, “değil”, “olmayan” gibi ifadeler varsa **tümleyenden** gitmek işi kısaltabilir. Önce olmayanın ya da zıt olayın olasılığını bul, sonra 1’den çıkar.
:::

## 4. Örneklerle pekiştirelim

**Çarkıfelek:** 8 eşit dilimli bir çarkıfelekte 3 dilim kırmızı, 5 dilim mavidir. Çark çevrilince kırmızıya gelme olasılığı $\dfrac{3}{8}$ dir. Dilimler eşit olmasaydı bu kesir kullanılamazdı. Önce çıktıların eşit şansa sahip olup olmadığına bak.

**Numaralı kartlar:** 1’den 20’ye kadar numaralı kartlardan rastgele biri çekiliyor. 4’ün katı olan kartlar: 4, 8, 12, 16, 20. İstenen 5, tüm durum 20.

$$P(4\text{'ün katı}) = \dfrac{5}{20} = \dfrac{1}{4}$$

**Torba ve iki olay:** Torbada 5 kırmızı, 3 mavi, 2 yeşil top varken “yeşil ya da mavi” olma olasılığı için istenen sayısı $3 + 2 = 5$, olasılık $\dfrac{5}{10} = \dfrac{1}{2}$ dir.

## 5. Deneysel ve teorik olasılık

- **Teorik olasılık:** Matematiksel olarak hesaplanan olasılık. Bir paranın yazı gelme olasılığı $\dfrac{1}{2}$ dir.
- **Deneysel olasılık:** Deney yapılarak elde edilen sonuçlara dayalı olasılık.

$$\text{Deneysel olasılık} = \dfrac{\text{Olayın gerçekleşme sayısı}}{\text{Toplam deneme sayısı}}$$

Örnek: Bir para 50 kez atılıyor ve 32 kez yazı geliyor. Deneysel olasılık $\dfrac{32}{50} = 0{,}64$ tür. Teorik olasılık ise $0{,}5$ tir.

Deneme sayısı **arttıkça** deneysel olasılık genellikle teorik olasılığa **yaklaşır**. 5 kez atınca 4 yazı gelmesi çok şaşırtıcı olmaz ama 5 000 kez atınca %80 yazı gelmesi paranın hileli olduğunu düşündürür.

:::neden-sonuc
- Deneme sayısı az => Deneysel sonuç, teorik sonuçtan çok sapabilir.
- Deneme sayısı çok => Deneysel sonuç teorik olasılığa yaklaşır.
- Çıktılar eşit şansa sahip değil => “İstenen / tüm” formülü doğrudan kullanılamaz.
:::

## 6. Konuyu toparla

| Kavram | Hatırlanacak |
| --- | --- |
| Örnek uzay | Tüm olası çıktılar |
| Olasılık | İstenen / tüm |
| Sınırlar | $0 \leq P \leq 1$ |
| Kesin olay | $P = 1$ |
| İmkânsız olay | $P = 0$ |
| Olmama olasılığı | $1 - P(\text{olma})$ |
| Deneysel olasılık | Gerçekleşme sayısı / deneme sayısı |

## Mini test

:::soru{cevap="C"}
Bir zar atıldığında 3’ten büyük bir sayı gelme olasılığı kaçtır?

- A) $\dfrac{1}{6}$
- B) $\dfrac{1}{3}$
- C) $\dfrac{1}{2}$
- D) $\dfrac{2}{3}$

---

1. 3’ten büyük sayılar 4, 5 ve 6’dır. İstenen durum sayısı 3’tür.
2. Zarda 6 durum vardır. Olasılık $\dfrac{3}{6} = \dfrac{1}{2}$. Doğru cevap C.
:::

:::soru{cevap="A"}
Bir torbada 5 kırmızı, 4 mavi ve 3 yeşil top bulunuyor. Torbadan rastgele çekilen bir topun kırmızı **olmama** olasılığı kaçtır?

- A) $\dfrac{7}{12}$
- B) $\dfrac{5}{12}$
- C) $\dfrac{1}{3}$
- D) $\dfrac{3}{4}$

---

1. Torbada toplam $5 + 4 + 3 = 12$ top vardır.
2. Kırmızı olma olasılığı $\dfrac{5}{12}$ dir.
3. Kırmızı olmama olasılığı $1 - \dfrac{5}{12} = \dfrac{7}{12}$. Doğru cevap A.
:::

:::soru{cevap="B"}
1’den 30’a kadar numaralandırılmış 30 kart bir torbaya konuyor ve rastgele biri çekiliyor.

Çekilen kartın numarasının asal sayı olma olasılığı kaçtır?

- A) $\dfrac{1}{5}$
- B) $\dfrac{1}{3}$
- C) $\dfrac{3}{10}$
- D) $\dfrac{1}{2}$

---

1. 1 ile 30 arasındaki asal sayılar 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 olup 10 tanedir.
2. Olasılık $\dfrac{10}{30} = \dfrac{1}{3}$. Doğru cevap B.
:::

:::soru{cevap="D"}
Bir madeni para 50 kez atıldığında 32 kez yazı gelmiştir.

Buna göre aşağıdakilerden hangisi doğrudur?

- A) Paranın yazı gelme teorik olasılığı $\dfrac{32}{50}$ dir.
- B) Para kesin olarak hilelidir.
- C) Yazı gelme olasılığı artık $\dfrac{1}{2}$ den büyüktür.
- D) Deneme sayısı arttıkça yazı gelme sıklığının $\dfrac{1}{2}$ ye yaklaşması beklenir.

---

1. $\dfrac{32}{50}$ deneysel olasılıktır. Teorik olasılık $\dfrac{1}{2}$ dir. A yanlış.
2. 50 deneme, paranın hileli olduğuna karar vermek için yeterli değildir. B yanlış.
3. Paranın doğası değişmez, olasılığı hâlâ $\dfrac{1}{2}$ dir. C yanlış.
4. Deneme sayısı arttıkça deneysel olasılık teorik olasılığa yaklaşır. Doğru cevap D.
:::

## Kendini dene

:::dene
1. Bir zar atıldığında çift sayı gelme olasılığı kaçtır? => $\dfrac{3}{6} = \dfrac{1}{2}$
2. Bir torbada 4 beyaz, 6 siyah top var. Çekilen topun beyaz olma olasılığını yüzde olarak yaz. => $\dfrac{4}{10} = \%40$
3. “Bir zar atıldığında 0 gelmesi” olayının olasılığı kaçtır, olay türü nedir? => 0. İmkânsız olay.
4. Bir olayın olma olasılığı 0,35 ise olmama olasılığı kaçtır? => $1 - 0{,}35 = 0{,}65$
5. Bir çarkıfelek 10 eşit dilimden oluşuyor. 4’ü mavi, 3’ü yeşil, 3’ü sarıdır. Çark çevrildiğinde sarı ya da yeşile gelme olasılığı kaçtır? => $\dfrac{6}{10} = \dfrac{3}{5}$
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 11, false from public.topics where subject_id = 'lgs-mat' and name = 'Basit Olayların Olma Olasılığı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Deney, çıktı, örnek uzay, olay, basit olayın olma olasılığı, kesin ve imkânsız olay, olmama olasılığı, deneysel ve teorik olasılık. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Ardışık ve bağımsız olaylar 8. sınıf programında yoksa eklenmedi, (b) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Basit Olayların Olma Olasılığı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

$101^2$ sayısını hesap makinesi olmadan, hatta kâğıt kalem bile kullanmadan bulabilir misin? $(100+1)^2$ yazıp bir özdeşlikten yararlanırsan 10 201’i saniyeler içinde bulursun. Cebirsel ifadeler ve özdeşlikler, hem işlemleri hızlandırır hem de geometride alan hesaplarını kolaylaştırır. Bu konuda cebirsel ifadelerle işlem yapmayı, özdeşlikleri ve çarpanlara ayırmayı öğreneceksin.

:::hedefler
1. Cebirsel ifadenin terim, katsayı ve benzer terim kavramlarını açıklamak.
2. Cebirsel ifadelerle toplama, çıkarma ve çarpma yapmak.
3. Özdeşlikleri açıp uygulamak ve geometrik modelle yorumlamak.
4. Cebirsel ifadeleri çarpanlarına ayırmak.
:::

:::ipucu
Özdeşliklerde **ilk ve son terim hep karesi**, ortadaki terim **iki katı çarpım**dır. $(a+b)^2$ yazınca kendine şunu söyle: “İlkin karesi, ikincinin karesi, ve ikisinin çarpımının iki katı.” Orta terimi unutmak en sık hatadır.
:::

## 1. Cebirsel ifadeler

Sayıların ve harflerin (değişkenlerin) işlem işaretleriyle birleşmesinden oluşan ifadelere **cebirsel ifade** denir. Örnek: $3x^2 + 5x - 7$.

- **Terim:** Toplama ve çıkarma ile ayrılan her parça ($3x^2$, $5x$, $-7$).
- **Katsayı:** Değişkenin önündeki sayı. $3x^2$ teriminde katsayı 3’tür.
- **Sabit terim:** Değişken içermeyen terim ($-7$).
- **Benzer terimler:** Değişken ve üsleri aynı olan terimler. $3x$ ile $5x$ benzerdir, $3x$ ile $3x^2$ benzer değildir.

### Toplama ve çıkarma

Yalnızca **benzer terimler** toplanır ya da çıkarılır. Katsayılar toplanır, değişken aynen yazılır.

$$(4x^2 + 3x - 2) + (x^2 - 5x + 6) = 5x^2 - 2x + 4$$

Çıkarırken ikinci parantezin önündeki eksi, parantez içindeki **bütün işaretleri değiştirir**.

$$(5x - 3) - (2x - 7) = 5x - 3 - 2x + 7 = 3x + 4$$

### Çarpma

Bir terim ile bir ifade çarpılırken **dağılma özelliği** kullanılır.

$$2x(x - 3) = 2x^2 - 6x$$

İki ifadeyi çarparken her terim diğerinin her terimiyle çarpılır, sonra benzer terimler toplanır.

$$(x + 2)(x + 5) = x^2 + 5x + 2x + 10 = x^2 + 7x + 10$$

:::dene
1. $(3x + 4) + (2x - 9)$ ifadesini sadeleştir. => $5x - 5$
2. $(x + 3)(x - 2)$ çarpımını yap. => $x^2 - 2x + 3x - 6 = x^2 + x - 6$
:::

## 2. Özdeşlikler

Değişkenin her değeri için doğru olan eşitliklere **özdeşlik** denir. Bu ünitede dört özdeşliği bileceksin.

### Tam kare özdeşlikleri

$$(a + b)^2 = a^2 + 2ab + b^2$$

$$(a - b)^2 = a^2 - 2ab + b^2$$

Bu özdeşliği **geometrik modelle** görebilirsin. Kenar uzunluğu $a + b$ olan bir kare, bir $a^2$ karesi, bir $b^2$ karesi ve iki tane $ab$ dikdörtgenine ayrılır. Alan, bu parçaların toplamıdır: $a^2 + 2ab + b^2$.

Örnekler:

- $(x + 3)^2 = x^2 + 6x + 9$
- $(2x - 5)^2 = 4x^2 - 20x + 25$
- $101^2 = (100 + 1)^2 = 10\,000 + 200 + 1 = 10\,201$

### İki kare farkı

$$a^2 - b^2 = (a - b)(a + b)$$

Örnekler:

- $x^2 - 49 = (x - 7)(x + 7)$
- $99 \cdot 101 = (100 - 1)(100 + 1) = 100^2 - 1 = 9\,999$

### Çarpım özdeşliği

$$(x + a)(x + b) = x^2 + (a + b)x + ab$$

Örnek: $(x + 4)(x + 5) = x^2 + 9x + 20$.

| Özdeşlik | Açılımı |
| --- | --- |
| $(a+b)^2$ | $a^2 + 2ab + b^2$ |
| $(a-b)^2$ | $a^2 - 2ab + b^2$ |
| $a^2 - b^2$ | $(a-b)(a+b)$ |
| $(x+a)(x+b)$ | $x^2 + (a+b)x + ab$ |

:::baglanti
$(a+b)^2$ ifadesi $a^2 + b^2$ **değildir**. Aradaki fark $2ab$ dir. Bunu bir sayıyla dene: $(2+3)^2 = 25$ ama $2^2 + 3^2 = 13$ tür. İkisinin farkı $12 = 2 \cdot 2 \cdot 3$ tür.
:::

## 3. Çarpanlara ayırma

Çarpma işleminin tersi **çarpanlara ayırmadır**. Bir cebirsel ifadeyi çarpım biçiminde yazarız.

### Ortak çarpan parantezine alma

Bütün terimlerde ortak olan çarpanı dışarı al.

$$6x^2 + 9x = 3x(2x + 3)$$

### Tam kare ifade

Önce ifadenin $a^2 \pm 2ab + b^2$ biçiminde olup olmadığına bak.

$$x^2 + 10x + 25 = (x + 5)^2$$

$$4x^2 - 12x + 9 = (2x - 3)^2$$

### İki kare farkı

$$49x^2 - 81 = (7x)^2 - 9^2 = (7x - 9)(7x + 9)$$

### $x^2 + (a+b)x + ab$ biçimi

Çarpımları sabit terimi, toplamları $x$’in katsayısını veren iki sayı bul.

$$x^2 + 7x + 12 \Rightarrow 3 \cdot 4 = 12,\ 3 + 4 = 7 \Rightarrow (x + 3)(x + 4)$$

$$x^2 - 2x - 15 \Rightarrow 3 \cdot (-5) = -15,\ 3 + (-5) = -2 \Rightarrow (x + 3)(x - 5)$$

:::neden-sonuc
- Bütün terimlerde ortak çarpan var => Önce parantezine al.
- İki terim kare, aralarında eksi => İki kare farkı.
- Üç terimli, baştaki ve sondaki kare, ortadaki iki katı çarpım => Tam kare.
- Üç terimli, x karenin katsayısı 1 => Toplamı ve çarpımı uygun iki sayı ara.
:::

## 4. Özdeşliklerle hesap kolaylığı

- $103^2 - 97^2 = (103 - 97)(103 + 97) = 6 \cdot 200 = 1\,200$
- $52^2 = (50 + 2)^2 = 2\,500 + 200 + 4 = 2\,704$
- $\dfrac{x^2 - 9}{x - 3} = \dfrac{(x-3)(x+3)}{x-3} = x + 3$ ($x \neq 3$ için)

## 5. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Benzer terim | Değişken ve üs aynı |
| Toplama, çıkarma | Yalnızca benzer terimler |
| Tam kare | $(a \pm b)^2 = a^2 \pm 2ab + b^2$ |
| İki kare farkı | $a^2 - b^2 = (a-b)(a+b)$ |
| Ortak çarpan | Önce parantezine al |
| Üç terimli | Toplamı ve çarpımı uygun sayıları bul |

## Mini test

:::soru{cevap="B"}
$(x - 4)^2$ ifadesinin açılımı aşağıdakilerden hangisidir?

- A) $x^2 - 16$
- B) $x^2 - 8x + 16$
- C) $x^2 + 8x + 16$
- D) $x^2 - 8x - 16$

---

1. $(a - b)^2 = a^2 - 2ab + b^2$ özdeşliğinde $a = x$ ve $b = 4$ alınır.
2. $x^2 - 2 \cdot x \cdot 4 + 16 = x^2 - 8x + 16$. Doğru cevap B.
:::

:::soru{cevap="C"}
$x^2 + 9x + 20$ ifadesinin çarpanlarından biri aşağıdakilerden hangisidir?

- A) $x + 2$
- B) $x + 3$
- C) $x + 5$
- D) $x + 10$

---

1. Çarpımı 20, toplamı 9 olan iki sayı 4 ve 5’tir.
2. $x^2 + 9x + 20 = (x + 4)(x + 5)$. Çarpanlardan biri $x + 5$ tir. Doğru cevap C.
:::

:::soru{cevap="A"}
$103^2 - 97^2$ işleminin sonucu kaçtır?

- A) 1200
- B) 600
- C) 1000
- D) 2000

---

1. İki kare farkı özdeşliği kullanılır: $a^2 - b^2 = (a - b)(a + b)$.
2. $(103 - 97)(103 + 97) = 6 \cdot 200 = 1200$. Doğru cevap A.
:::

:::soru{cevap="D"}
Alanı $x^2 + 10x + 25$ cm² olan bir karenin çevresi kaç santimetredir?

- A) $2x + 10$
- B) $4x + 10$
- C) $x + 5$
- D) $4x + 20$

---

1. $x^2 + 10x + 25 = (x + 5)^2$ olduğundan karenin bir kenarı $x + 5$ cm’dir.
2. Çevre $= 4 \cdot (x + 5) = 4x + 20$ cm. Doğru cevap D.
:::

## Kendini dene

:::dene
1. $(3x + 2)^2$ ifadesini aç. => $9x^2 + 12x + 4$
2. $x^2 - 100$ ifadesini çarpanlarına ayır. => $(x - 10)(x + 10)$
3. $5x^2 - 15x$ ifadesini çarpanlarına ayır. => $5x(x - 3)$
4. $98 \cdot 102$ çarpımını özdeşlik kullanarak hesapla. => $(100 - 2)(100 + 2) = 10\,000 - 4 = 9\,996$
5. $x^2 + 2x - 24$ ifadesini çarpanlarına ayır. => Çarpımı $-24$, toplamı 2 olan sayılar 6 ve $-4$. $(x + 6)(x - 4)$
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-mat' and name = 'Cebirsel İfadeler ve Özdeşlikler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Cebirsel ifadeler (terim, katsayı, benzer terim), toplama, çıkarma, çarpma, özdeşlikler (tam kare, iki kare farkı, geometrik modelle gösterim), çarpanlara ayırma. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) (x+a)(x+b) özdeşliği ve x² + (a+b)x + ab çarpanlara ayırma biçimi program kapsamında mı, değilse silin, (b) rasyonel sadeleştirme örneği 8. sınıf dışı olabilir, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Cebirsel İfadeler ve Özdeşlikler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir taksiye bindiğinde ücret, gittiğin yola göre belli bir kuralla artar. Bir telefon paketinin faturası kullandığın dakikayla orantılı büyür. Bu tür “bir şey değişince diğeri de belli bir düzende değişiyor” ilişkilerini matematikte **doğrusal denklemler** ile ifade ederiz. Bu konuda doğrusal ilişkileri tablo, denklem ve grafikle göstermeyi, eğimi bulmayı ve iki bilinmeyenli denklem sistemlerini çözmeyi öğreneceksin.

:::hedefler
1. Koordinat sisteminde noktaları göstermek, doğrusal denklemin tablosunu ve grafiğini oluşturmak.
2. Doğrunun eğimini bulmak ve yorumlamak.
3. Doğrunun eksenleri kestiği noktaları bulmak.
4. İki bilinmeyenli doğrusal denklem sistemlerini çözmek ve problemlere uygulamak.
:::

:::ipucu
Doğrusal denklem sorularında üç şeyi bil. **x yerine sayı koy, y’yi bul. İki noktadan eğimi hesapla. Eksenleri keserken x ya da y’yi sıfır yap.** Bu üç adım ünitenin çoğu sorusunu çözer.
:::

## 1. Koordinat sistemi

Yatay eksene **x ekseni**, dikey eksene **y ekseni** denir. İki eksenin kesiştiği nokta **orijindir** ve $(0, 0)$ ile gösterilir. Bir nokta, sıralı ikili $(x, y)$ ile ifade edilir.

- İlk bileşen $x$, orijinden **yatay** uzaklığı (sağa pozitif, sola negatif) gösterir.
- İkinci bileşen $y$, orijinden **dikey** uzaklığı (yukarı pozitif, aşağı negatif) gösterir.

Örneğin $(3, -2)$ noktası orijinden 3 birim sağda ve 2 birim aşağıdadır. Eksen üzerindeki noktalarda bileşenlerden biri sıfırdır: x ekseni üzerindeki noktalar $(a, 0)$, y ekseni üzerindeki noktalar $(0, b)$ biçimindedir.

## 2. Doğrusal denklem

Grafiği bir **doğru** olan denklemlere doğrusal denklem denir. En sık $y = mx + n$ biçiminde karşılaşırız ($m$ ve $n$ sayılardır).

Örnek: $y = 2x + 1$ denkleminde x’e değer verip y’yi bulalım.

| $x$ | $y = 2x + 1$ | Nokta |
| --- | --- | --- |
| $-1$ | $-1$ | $(-1, -1)$ |
| $0$ | $1$ | $(0, 1)$ |
| $1$ | $3$ | $(1, 3)$ |
| $2$ | $5$ | $(2, 5)$ |

Bu noktalar koordinat düzleminde işaretlenip birleştirilince bir doğru elde edilir. Bir doğruyu çizmek için **iki nokta** yeterlidir.

Bir noktanın denklemin doğrusu üzerinde olup olmadığını anlamak için x ve y değerlerini denklemde yerine yaz. Denklem sağlanıyorsa nokta doğrunun üzerindedir. Örneğin $(3, 7)$ noktası $y = 2x + 1$ doğrusu üzerindedir, çünkü $2 \cdot 3 + 1 = 7$.

:::dene
1. $y = 3x - 2$ doğrusunda $x = 4$ için $y$ kaçtır? => $y = 3 \cdot 4 - 2 = 10$
2. $(2, 5)$ noktası $y = x + 3$ doğrusunun üzerinde midir? => $2 + 3 = 5$ olduğundan evet.
:::

## 3. Eğim

**Eğim**, doğrunun ne kadar dik olduğunu gösteren sayıdır. x değeri 1 birim arttığında y’nin ne kadar değiştiğini söyler. Doğru üzerindeki iki nokta $A(x_1, y_1)$ ve $B(x_2, y_2)$ ise eğim:

$$m = \dfrac{y_2 - y_1}{x_2 - x_1}$$

Yani eğim, **dikey değişimin yatay değişime oranıdır**.

Örnek: $A(1, 3)$ ve $B(4, 9)$ noktalarından geçen doğrunun eğimi

$$m = \dfrac{9 - 3}{4 - 1} = \dfrac{6}{3} = 2$$

$y = mx + n$ denkleminde $x$’in katsayısı **eğimdir**, $n$ sabit terimi ise doğrunun **y eksenini kestiği noktanın** y değeridir, yani doğru $(0, n)$ noktasından geçer.

| Eğim | Doğrunun durumu |
| --- | --- |
| $m > 0$ | Soldan sağa yükselir (artan) |
| $m < 0$ | Soldan sağa alçalır (azalan) |
| $m = 0$ | Yatay doğru ($y = n$) |
| Eğimin mutlak değeri büyüdükçe | Doğru daha diktir |

:::baglanti
Hız-zaman ya da yol-zaman grafiklerinde **eğim, hızı** verir. Sabit hızla giden bir araç için yol-zaman grafiği bir doğrudur ve doğrunun eğimi aracın hızıdır. Matematikteki eğim ile fizikteki bu yorum aynı fikirdir.
:::

## 4. Eksenleri kestiği noktalar

- **y eksenini kestiği nokta:** $x = 0$ yazılır.
- **x eksenini kestiği nokta:** $y = 0$ yazılır.

Örnek: $2x + 3y = 12$ doğrusu için

- $x = 0 \Rightarrow 3y = 12 \Rightarrow y = 4$. Nokta $(0, 4)$.
- $y = 0 \Rightarrow 2x = 12 \Rightarrow x = 6$. Nokta $(6, 0)$.

Bu iki noktayı birleştiren doğru $2x + 3y = 12$ doğrusudur.

## 5. Denklem sistemleri

Aynı iki bilinmeyeni içeren iki denkleme **denklem sistemi** denir. Her iki denklemi de sağlayan $(x, y)$ ikilisi sistemin çözümüdür. Grafikte bu ikili, iki doğrunun **kesiştiği noktadır**.

### Yok etme yöntemi

Denklemleri toplayarak ya da çıkararak bir bilinmeyeni yok edebilirsin.

$$\begin{cases} x + y = 10 \\ x - y = 2 \end{cases}$$

Denklemleri taraf tarafa toplarsak $2x = 12$ olur ve $x = 6$ bulunur. Birinci denklemde yerine yazarsak $6 + y = 10$ ve $y = 4$ çıkar. Çözüm $(6, 4)$.

Katsayılar uygun değilse bir denklemi sayıyla çarparak eşitle.

### Yerine koyma yöntemi

Bir denklemde bir bilinmeyeni diğeri cinsinden yaz, diğer denklemde yerine koy.

$$\begin{cases} y = 2x \\ x + y = 12 \end{cases}$$

$y = 2x$ ifadesini ikinci denklemde yazalım: $x + 2x = 12 \Rightarrow x = 4$ ve $y = 8$.

### Problem çözme

**Örnek:** 3 defter ve 2 kalem 26 TL, 1 defter ve 2 kalem 14 TL’dir. Defter ve kalemin fiyatı kaçtır?

Defter $x$, kalem $y$ olsun.

$$\begin{cases} 3x + 2y = 26 \\ x + 2y = 14 \end{cases}$$

Denklemleri çıkarırsak $2x = 12$ ve $x = 6$ olur. İkinci denklemden $6 + 2y = 14$ ve $y = 4$ bulunur. Defter 6 TL, kalem 4 TL’dir.

:::neden-sonuc
- İki denklemde aynı bilinmeyenin katsayısı aynı ya da zıt => Toplama ya da çıkarma ile o bilinmeyen yok edilir.
- Bir denklemde bir bilinmeyen yalnız => Yerine koyma daha pratiktir.
- Sonuç bulundu => İki denklemde de yerine yazıp **kontrol et**.
:::

## 6. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Doğrusal denklem | $y = mx + n$, grafiği doğru |
| Eğim | $m = (y_2 - y_1)/(x_2 - x_1)$ |
| y eksenini kesme | $x = 0$ yazılır, nokta $(0, n)$ |
| x eksenini kesme | $y = 0$ yazılır |
| Denklem sistemi | Yok etme ya da yerine koyma |

## Mini test

:::soru{cevap="B"}
$y = 3x - 2$ doğrusunun y eksenini kestiği nokta aşağıdakilerden hangisidir?

- A) $(0, 2)$
- B) $(0, -2)$
- C) $(-2, 0)$
- D) $\left(\dfrac{2}{3}, 0\right)$

---

1. y eksenini kesen noktada $x = 0$ olur.
2. $y = 3 \cdot 0 - 2 = -2$. Nokta $(0, -2)$. Doğru cevap B.
:::

:::soru{cevap="C"}
Koordinat düzleminde $A(1, 2)$ ve $B(5, 10)$ noktalarından geçen doğrunun eğimi kaçtır?

- A) 4
- B) 3
- C) 2
- D) 1

---

1. Eğim $m = \dfrac{y_2 - y_1}{x_2 - x_1} = \dfrac{10 - 2}{5 - 1}$.
2. $m = \dfrac{8}{4} = 2$. Doğru cevap C.
:::

:::soru{cevap="A"}
$\begin{cases} 2x + y = 7 \\ x - y = 2 \end{cases}$ denklem sistemini sağlayan $x$ ve $y$ değerleri için $x \cdot y$ çarpımı kaçtır?

- A) 3
- B) 5
- C) 6
- D) 10

---

1. Denklemleri taraf tarafa toplayalım: $3x = 9$ olduğundan $x = 3$.
2. İkinci denklemde $3 - y = 2$ olduğundan $y = 1$.
3. $x \cdot y = 3 \cdot 1 = 3$. Doğru cevap A.
:::

:::soru{cevap="D"}
Bir taksi durağında açılış ücreti 20 TL’dir ve gidilen her kilometre için 8 TL eklenir. Bir yolcu toplam 100 TL ödemiştir.

Buna göre yolcu kaç kilometre yol gitmiştir?

- A) 8
- B) 9
- C) 12
- D) 10

---

1. Ücret $y$, yol $x$ olsun. Denklem: $y = 8x + 20$.
2. $100 = 8x + 20 \Rightarrow 8x = 80 \Rightarrow x = 10$.
3. Yolcu 10 km yol gitmiştir. Doğru cevap D.
:::

## Kendini dene

:::dene
1. $y = -x + 4$ doğrusunun eğimini ve y eksenini kestiği noktayı yaz. => Eğim $-1$, y eksenini $(0, 4)$ noktasında keser.
2. $4x - 2y = 8$ doğrusunun eksenleri kestiği noktaları bul. => $x = 0$ için $y = -4$, nokta $(0, -4)$. $y = 0$ için $x = 2$, nokta $(2, 0)$.
3. $(2, 1)$ ve $(6, 9)$ noktalarından geçen doğrunun eğimi kaçtır? => $\dfrac{9 - 1}{6 - 2} = 2$
4. $x + y = 14$ ve $x - y = 4$ sistemini çöz. => Toplarsak $2x = 18$, $x = 9$, $y = 5$.
5. Bir bakkal 2 su ve 3 ekmek için 21 TL, 1 su ve 3 ekmek için 15 TL almıştır. Bir suyun fiyatı kaç TL’dir? => Denklemleri çıkarırsak su $= 21 - 15 = 6$ TL olur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'lgs-mat' and name = 'Doğrusal Denklemler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Koordinat sistemi, doğrusal denklem (tablo, grafik), eğim, eksenleri kesme noktaları, iki bilinmeyenli denklem sistemleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Denklem sistemleri bölümünün bu ünitede yer alıp almadığı (programda ayrı bir ünite ya da bu ünitenin kazanımı olabilir), (b) y = mx + n gösterimi ve süslü parantezli biçimli sistemlerin sitede doğru görünmesi, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Doğrusal Denklemler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Bu asansör en fazla 8 kişi taşır.” “Bu filmi izlemek için en az 13 yaşında olmalısın.” “Sınırı geçmeyin: 90 km/saat.” Bu cümlelerde tek bir sayı değil, bir **sınır** vardır. Matematikte bunları **eşitsizliklerle** ifade ederiz. Bu konuda eşitsizlikleri yazmayı, çözmeyi ve sayı doğrusunda göstermeyi öğreneceksin.

:::hedefler
1. Günlük hayattaki sınırları eşitsizlik olarak yazmak.
2. Eşitsizlik sembollerini doğru kullanmak ve sayı doğrusunda göstermek.
3. Bir bilinmeyenli birinci dereceden eşitsizlikleri çözmek.
4. Negatif bir sayıyla çarpma ve bölmede eşitsizliğin yön değiştirdiğini uygulamak.
:::

:::ipucu
Eşitsizlik çözerken **tek bir tuzak** vardır. Her iki tarafı **negatif bir sayıyla** çarpar ya da bölersen eşitsizliğin yönü **ters döner**. Soruda bir bilinmeyenin önünde eksi gördüğünde bu kuralı mutlaka hatırla.
:::

## 1. Eşitsizlik sembolleri

| Sembol | Okunuşu | Günlük dil |
| --- | --- | --- |
| $x < 5$ | x, 5’ten küçüktür | 5’ten az |
| $x > 5$ | x, 5’ten büyüktür | 5’ten çok |
| $x \leq 5$ | x, 5’ten küçük ya da eşittir | En fazla 5 |
| $x \geq 5$ | x, 5’ten büyük ya da eşittir | En az 5 |

Günlük hayatta sık geçen ifadeler:

- “En fazla 8 kişi” $\Rightarrow$ $x \leq 8$
- “En az 13 yaşında” $\Rightarrow$ $x \geq 13$
- “18’den küçük” $\Rightarrow$ $x < 18$
- “En çok 90 km/saat” $\Rightarrow$ $x \leq 90$

## 2. Sayı doğrusunda gösterim

Bir eşitsizliği sağlayan bütün sayılar **sayı doğrusunda** gösterilir.

- **Boş daire** ($\circ$) sınır sayısının **dahil olmadığını** gösterir ($<$ ve $>$).
- **Dolu daire** ($\bullet$) sınır sayısının **dahil olduğunu** gösterir ($\leq$ ve $\geq$).
- Çözüm kümesi, dairenin bulunduğu yönde ok ile gösterilir.

| Eşitsizlik | Gösterim |
| --- | --- |
| $x > 3$ | 3’te boş daire, sağa doğru ok |
| $x \geq 3$ | 3’te dolu daire, sağa doğru ok |
| $x < 3$ | 3’te boş daire, sola doğru ok |
| $x \leq 3$ | 3’te dolu daire, sola doğru ok |

Eşitsizliği sağlayan **sonsuz sayıda** gerçek sayı vardır. Soru tam sayı ister ya da sorunun bağlamı bunu sınırlarsa (örneğin “kişi sayısı”) yalnızca uygun değerler alınır.

:::dene
1. “Bir otobüste en fazla 45 yolcu seyahat edebilir” cümlesini eşitsizlikle yaz. => $x \leq 45$
2. $x > -2$ eşitsizliğini sağlayan en küçük tam sayı kaçtır? => $-1$. Çünkü $-2$ dahil değildir.
:::

## 3. Eşitsizlik çözme

Eşitsizliğin iki tarafına **aynı sayıyı eklemek ya da çıkarmak** yönü değiştirmez. Her iki tarafı **pozitif** sayıyla çarpmak ya da bölmek de yönü değiştirmez.

**Örnek 1:** $3x - 5 < 10$

$$3x < 15 \Rightarrow x < 5$$

**Örnek 2:** $2x + 3 \geq 11$

$$2x \geq 8 \Rightarrow x \geq 4$$

### Negatif sayıyla çarpma ve bölme

Her iki tarafı **negatif** bir sayıyla çarpar ya da bölersen **eşitsizliğin yönü değişir**.

**Örnek 3:** $-2x \geq 8$

Her iki tarafı $-2$ ye bölelim ve yön değiştirelim.

$$x \leq -4$$

Neden yön değişir? Bir sayı doğrusu düşün: $2 < 5$ doğru. İki tarafı $-1$ ile çarparsan $-2$ ve $-5$ olur. $-2$, $-5$’ten **büyüktür**, yani $-2 > -5$. Yön gerçekten ters döndü.

:::neden-sonuc
- İki tarafa aynı sayı eklenir ya da çıkarılır => Yön aynı kalır.
- İki taraf pozitif sayıyla çarpılır ya da bölünür => Yön aynı kalır.
- İki taraf negatif sayıyla çarpılır ya da bölünür => Yön **ters döner**.
:::

**Örnek 4:** $5 - 3x > 20$

1. $-3x > 15$
2. Her iki tarafı $-3$ e böl ve yönü değiştir: $x < -5$.

Çözümün doğru olup olmadığını kontrol etmek için kümeden bir sayı al ve eşitsizlikte dene. $x = -6$ al: $5 - 3(-6) = 23 > 20$ olduğundan doğru.

## 4. Problem çözme

Eşitsizlik problemlerinde “en az”, “en fazla”, “en çok”, “yetmez”, “yeter” gibi ifadeler eşitsizliği kurdurur.

**Örnek:** Ayşe’nin 100 TL’si var. 15 TL’lik defterlerden 3 tane aldıktan sonra kalan parayla 7 TL’lik kalemlerden **en çok** kaç tane alabilir?

1. Defterlere $3 \cdot 15 = 45$ TL ödenir. Kalan para $100 - 45 = 55$ TL.
2. Kalem sayısı $x$ olsun: $7x \leq 55$.
3. $x \leq 7{,}85\ldots$ Kalem sayısı tam sayı olmalıdır. En çok **7** kalem alabilir.

:::baglanti
Problemde sonuç genellikle **tam sayı** ister. $7{,}85$ yazıp bırakma. “En çok” isteniyorsa aşağıya yuvarla, “en az” isteniyorsa yukarıya yuvarla ve **durumu bağlama göre yorumla**. Kişi, kalem, kutu gibi sayılabilen varlıklar kesirli olmaz.
:::

## 5. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| En fazla, en çok | $\leq$ |
| En az | $\geq$ |
| Boş daire | Sınır dahil değil ($<$, $>$) |
| Dolu daire | Sınır dahil ($\leq$, $\geq$) |
| Negatifle çarpma ya da bölme | Yön değişir |
| Problem | Sonucu bağlama göre tam sayıya yuvarla |

## Mini test

:::soru{cevap="B"}
$2x + 3 > 11$ eşitsizliğini sağlayan en küçük tam sayı kaçtır?

- A) 4
- B) 5
- C) 6
- D) 7

---

1. $2x > 8 \Rightarrow x > 4$.
2. $x$, 4’ten büyük olmalıdır. 4 dahil değildir, en küçük tam sayı 5’tir. Doğru cevap B.
:::

:::soru{cevap="A"}
$-3x \leq 12$ eşitsizliğini sağlayan en küçük tam sayı kaçtır?

- A) $-4$
- B) $-3$
- C) $4$
- D) $12$

---

1. Her iki tarafı $-3$ e bölerken eşitsizliğin yönü değişir: $x \geq -4$.
2. $-4$ dahil olduğu için en küçük tam sayı $-4$ tür. Doğru cevap A.
:::

:::soru{cevap="D"}
Bir parkta “Giriş için yaşınız en az 5 olmalıdır” yazmaktadır. Yaşı $x$ ile gösterirsek bu ifade aşağıdakilerden hangisi ile gösterilir?

- A) $x < 5$
- B) $x > 5$
- C) $x \leq 5$
- D) $x \geq 5$

---

1. “En az 5” demek 5 **ve** 5’ten büyük değerler demektir.
2. 5 dahil olduğu için “büyük ya da eşit” sembolü kullanılır: $x \geq 5$. Doğru cevap D.
:::

:::soru{cevap="C"}
Ali’nin 100 TL’si vardır. 15 TL’lik 3 defter aldıktan sonra kalan parayla tanesi 7 TL olan kalemlerden en çok kaç tane alabilir?

- A) 6
- B) 8
- C) 7
- D) 5

---

1. Defterlere $3 \cdot 15 = 45$ TL ödenir. Kalan para $100 - 45 = 55$ TL.
2. Kalem sayısı $x$ ise $7x \leq 55$ ve $x \leq 7{,}85$.
3. Kalem sayısı tam sayı olacağından en çok 7 kalem alınır. Doğru cevap C.
:::

## Kendini dene

:::dene
1. $x - 7 \leq 3$ eşitsizliğini çöz. => $x \leq 10$
2. $4 - 2x < 10$ eşitsizliğini çöz. => $-2x < 6 \Rightarrow x > -3$ (negatife bölündüğü için yön değişir)
3. “Bir asansöre en fazla 8 kişi binebilir” cümlesindeki $x$ hangi değerleri alabilir? => $x \leq 8$ ve $x$ bir doğal sayı olduğundan $0, 1, 2, \ldots, 8$.
4. $x \geq 3$ eşitsizliğinin sayı doğrusunda gösterimini tarif et. => 3 noktasında dolu daire ve sağa doğru ok.
5. Bir telefon paketinde ilk 100 dakika ücretsiz, sonrası dakikası 2 TL’dir. Faturayı en fazla 50 TL tutmak isteyen biri toplam en çok kaç dakika konuşabilir? => $2(x - 100) \leq 50 \Rightarrow x \leq 125$. En çok 125 dakika.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 11, false from public.topics where subject_id = 'lgs-mat' and name = 'Eşitsizlikler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Eşitsizlik sembolleri, sayı doğrusunda gösterim, bir bilinmeyenli birinci dereceden eşitsizlikler, negatif sayıyla çarpma ve bölmede yön değişimi, problem çözme. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Sayı doğrusu gösterimi şekil yerine tabloyla anlatıldı, ileride görsel eklenebilir, (b) Soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Eşitsizlikler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir merdiven duvara dayanıyor. Merdivenin boyu ve duvardan uzaklığı belli, duvarda ne kadar yüksekliğe çıkar? Üç çubuğu uç uca getirip bir üçgen yapabilir miyiz? Bu soruların cevabı **üçgenlerin kenar ve açı kurallarında** gizli. Bu konuda üçgende açı-kenar ilişkilerini, üçgen oluşturma şartını ve meşhur **Pisagor bağıntısını** öğreneceksin.

:::hedefler
1. Üçgenin iç ve dış açıları arasındaki ilişkileri kullanmak.
2. Üçgenin kenar uzunlukları ile açıları arasındaki ilişkiyi yorumlamak.
3. Üç uzunluğun bir üçgen oluşturup oluşturmadığını belirlemek.
4. Pisagor bağıntısını dik üçgenlerde ve günlük hayat problemlerinde uygulamak.
:::

:::ipucu
Üçgen sorularında önce **şekli** iyi oku. Dik açı var mı? Eşit kenarlar var mı? Bilinen açılar neler? Bu üç soru, hangi kuralı kullanacağını söyler. Dik açı gördüğünde Pisagor, açı toplamı aradığında 180° kuralı aklına gelsin.
:::

## 1. Üçgenin açıları

Her üçgende **iç açıların toplamı 180°** dir.

$$m(\hat{A}) + m(\hat{B}) + m(\hat{C}) = 180^\circ$$

Örnek: Bir üçgenin iki açısı 50° ve 60° ise üçüncü açısı $180^\circ - 110^\circ = 70^\circ$ dir.

**Dış açı**, bir kenarın uzantısı ile komşu kenar arasındaki açıdır. Bir üçgenin bir dış açısı, **kendisine komşu olmayan iki iç açının toplamına** eşittir.

Örnek: İç açıları 50° ve 60° olan üçgenin üçüncü köşesindeki dış açı $50^\circ + 60^\circ = 110^\circ$ dir. Kontrol: Üçüncü iç açı 70° ve dış açı $180^\circ - 70^\circ = 110^\circ$.

### Üçgen çeşitleri

| Kenarlara göre | Özellik |
| --- | --- |
| Eşkenar | Üç kenar eşit, her açı 60° |
| İkizkenar | İki kenar eşit, o kenarların karşısındaki iki açı (taban açıları) eşit |
| Çeşitkenar | Kenarların hepsi farklı |

| Açılara göre | Özellik |
| --- | --- |
| Dar açılı | Üç açı da 90°’den küçük |
| Dik açılı | Bir açı 90° |
| Geniş açılı | Bir açı 90°’den büyük |

:::dene
1. İkizkenar bir üçgenin tepe açısı 40° ise taban açıları kaçar derecedir? => $(180^\circ - 40^\circ)/2 = 70^\circ$
2. Bir üçgenin dış açısı 120° ve komşu olmayan iç açılardan biri 50° ise diğeri kaç derecedir? => $120^\circ - 50^\circ = 70^\circ$
:::

## 2. Kenar ve açı ilişkisi

Bir üçgende **büyük açının karşısında büyük kenar, küçük açının karşısında küçük kenar** bulunur. Eşit açıların karşısındaki kenarlar da eşittir.

Örnek: ABC üçgeninde $m(\hat{A}) = 40^\circ$, $m(\hat{B}) = 60^\circ$ ise $m(\hat{C}) = 80^\circ$ dir.

- A açısının karşısındaki kenar $|BC|$, 40° ile en küçük açının karşısında olduğu için **en kısa** kenardır.
- C açısının karşısındaki kenar $|AB|$, 80° ile en büyük açının karşısında olduğu için **en uzun** kenardır.

$$|BC| < |AC| < |AB|$$

:::baglanti
Açıyı **karşısındaki kenarla** eşleştirmek bu ünitenin en temel becerisidir. Köşe harfi ile karşısındaki kenarın harfi **farklı**dır: A köşesinin karşısı $|BC|$, B köşesinin karşısı $|AC|$, C köşesinin karşısı $|AB|$.
:::

## 3. Üçgen eşitsizliği

Üç uzunluk ile bir üçgen çizilebilmesi için, **herhangi iki kenarın toplamı üçüncü kenardan büyük** olmalıdır. Bir başka ifadeyle bir kenar, diğer ikisinin **farkından büyük, toplamından küçük** olmalıdır.

$$|a - b| < c < a + b$$

Örnek: İki kenarı 5 ve 9 olan bir üçgenin üçüncü kenarı $x$ ise

$$|9 - 5| < x < 9 + 5 \Rightarrow 4 < x < 14$$

$x$ tam sayı ise $x$, 5’ten 13’e kadar değer alabilir, yani 9 farklı değeri vardır. En küçük değer 5, en büyük değer 13’tür.

**Üç uzunluk üçgen oluşturur mu?** En uzun kenarı seç ve diğer ikisinin toplamıyla karşılaştır.

- 3, 4, 5: $3 + 4 = 7 > 5$. Üçgen oluşur.
- 2, 3, 6: $2 + 3 = 5 < 6$. Üçgen **oluşmaz**.
- 4, 6, 10: $4 + 6 = 10$, eşit olduğu için üçgen oluşmaz.

:::neden-sonuc
- İki kısa kenarın toplamı en uzun kenardan küçük => Kenarlar uçlarda buluşamaz, üçgen oluşmaz.
- İki kısa kenarın toplamı en uzun kenara eşit => Kenarlar tek doğru üzerinde kalır, üçgen oluşmaz.
- İki kısa kenarın toplamı en uzun kenardan büyük => Üçgen oluşur.
:::

## 4. Pisagor bağıntısı

**Dik üçgende** dik açının karşısındaki kenara **hipotenüs**, diğer iki kenara **dik kenar** denir. Hipotenüs her zaman en uzun kenardır.

Pisagor bağıntısına göre dik kenarların kareleri toplamı hipotenüsün karesine eşittir.

$$a^2 + b^2 = c^2$$

Burada $a$ ve $b$ dik kenarlar, $c$ hipotenüstür.

Örnek: Dik kenarları 9 cm ve 12 cm olan üçgenin hipotenüsü

$$c^2 = 9^2 + 12^2 = 81 + 144 = 225 \Rightarrow c = 15\ \text{cm}$$

### Pisagor üçlüleri

Kenarları tam sayı olan bazı dik üçgenleri ezbere bilmek hız kazandırır.

| Dik kenarlar | Hipotenüs | Katları |
| --- | --- | --- |
| 3, 4 | 5 | 6, 8, 10 ve 9, 12, 15 |
| 5, 12 | 13 | 10, 24, 26 |
| 8, 15 | 17 | |
| 7, 24 | 25 | |

### Pisagor’un günlük hayattaki uygulamaları

**Merdiven problemi:** Boyu 10 m olan bir merdiven duvarın dibinden 6 m uzağa konuyor. Merdiven duvarda yerden kaç metre yüksekliğe ulaşır?

Duvar, zemin ve merdiven bir dik üçgen oluşturur. Merdiven hipotenüs, duvar ile zemin dik kenarlardır.

$$h^2 + 6^2 = 10^2 \Rightarrow h^2 = 100 - 36 = 64 \Rightarrow h = 8\ \text{m}$$

**İkizkenar üçgenin yüksekliği:** Kenarları 13, 13 ve 10 cm olan ikizkenar üçgende, tabana inilen yükseklik tabanı ortalar. Yükseklik, dik kenarları $h$ ve 5 olan, hipotenüsü 13 olan bir dik üçgen oluşturur.

$$h^2 + 5^2 = 13^2 \Rightarrow h^2 = 169 - 25 = 144 \Rightarrow h = 12\ \text{cm}$$

Alan $= \dfrac{10 \cdot 12}{2} = 60$ cm² dir.

:::ipucu
Pisagor’u **yalnızca dik üçgende** kullanabilirsin. Şekilde dik açı belirtilmemişse kendi başına dik varsaymayacaksın. Bazı sorularda önce ek bir yükseklik çizip dik üçgen oluşturman gerekir.
:::

## 5. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| İç açılar toplamı | 180° |
| Dış açı | Komşu olmayan iki iç açının toplamı |
| Büyük açı | Karşısında büyük kenar |
| Üçgen eşitsizliği | $\lvert a - b \rvert < c < a + b$ |
| Pisagor | $a^2 + b^2 = c^2$ (dik üçgende) |
| Pisagor üçlüleri | 3-4-5, 5-12-13, 8-15-17, 7-24-25 |

## Mini test

:::soru{cevap="B"}
Bir üçgenin iki kenarının uzunluğu 5 cm ve 9 cm’dir. Üçüncü kenarının uzunluğu **tam sayı** ise bu kenarın alabileceği **en büyük** değer kaç cm’dir?

- A) 12
- B) 13
- C) 14
- D) 15

---

1. Üçgen eşitsizliğine göre $|9 - 5| < x < 9 + 5$, yani $4 < x < 14$.
2. $x$ tam sayı olduğundan en büyük değeri 13’tür. Doğru cevap B.
:::

:::soru{cevap="A"}
Dik kenarlarının uzunluğu 8 cm ve 15 cm olan dik üçgenin hipotenüsü kaç cm’dir?

- A) 17
- B) 23
- C) 13
- D) 19

---

1. Pisagor bağıntısı: $c^2 = 8^2 + 15^2 = 64 + 225 = 289$.
2. $c = 17$ cm. (8, 15, 17 bir Pisagor üçlüsüdür.) Doğru cevap A.
:::

:::soru{cevap="C"}
ABC üçgeninde $m(\hat{A}) = 40^\circ$ ve $m(\hat{B}) = 60^\circ$ dir.

Buna göre kenar uzunlukları arasındaki sıralama aşağıdakilerden hangisidir?

- A) $|AB| < |AC| < |BC|$
- B) $|BC| < |AB| < |AC|$
- C) $|BC| < |AC| < |AB|$
- D) $|AC| < |AB| < |BC|$

---

1. $m(\hat{C}) = 180^\circ - 40^\circ - 60^\circ = 80^\circ$.
2. Açıların sıralaması $A < B < C$ olduğundan karşılarındaki kenarların sıralaması $|BC| < |AC| < |AB|$ olur.
3. Doğru cevap C.
:::

:::soru{cevap="D"}
Boyu 10 m olan bir merdiven, duvarın dibinden 6 m uzağa yerleştirilerek duvara dayanıyor.

Buna göre merdiven duvarda yerden kaç metre yüksekliğe ulaşır?

- A) 4
- B) 6
- C) 7
- D) 8

---

1. Merdiven, duvar ve zemin dik üçgen oluşturur. Merdiven hipotenüstür.
2. $h^2 + 6^2 = 10^2 \Rightarrow h^2 = 100 - 36 = 64 \Rightarrow h = 8$ m. Doğru cevap D.
:::

## Kendini dene

:::dene
1. 4 cm, 7 cm ve 12 cm uzunluğundaki çubuklarla üçgen yapılabilir mi? => Hayır. $4 + 7 = 11 < 12$ olduğundan üçgen oluşmaz.
2. Bir eşkenar üçgenin açıları kaç derecedir? => Üç açı da 60°’dir.
3. Bir dik üçgenin dik kenarları 5 cm ve 12 cm ise hipotenüsü kaç cm’dir? => 13 cm.
4. Bir üçgende iki açı 35° ve 85° ise en uzun kenar hangi açının karşısındadır? => Üçüncü açı 60°’dir. En büyük açı 85° olduğundan en uzun kenar onun karşısındadır.
5. Kenarları 13, 14, 15 cm olan üçgende 14 cm’lik kenara inen yükseklik 12 cm’dir. Üçgenin alanı kaç cm²’dir? => $\dfrac{14 \cdot 12}{2} = 84$ cm²
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-mat' and name = 'Üçgenler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Üçgenin iç ve dış açıları, kenar-açı ilişkisi, üçgen eşitsizliği, Pisagor bağıntısı ve uygulamaları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Dış açı özelliği ve ikizkenar üçgen bilgileri 7. sınıf tekrarıdır, (b) “Kendini dene” 5. sorudaki 13-14-15 üçgeninin yüksekliği (12) doğru ve LGS dışı olabilir, silebilirsiniz, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Üçgenler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir fotoğrafı büyütüp küçültebilirsin, ama içindeki şekiller bozulmaz. Bir haritada 5 cm, gerçekte kilometrelerce yol olabilir. Güneşli bir günde gölgelerden bir ağacın boyunu hesaplamak da mümkündür. Bütün bunlar **eşlik ve benzerlik** ile açıklanır. Bu konuda şekillerin eş ya da benzer olması ne demek, benzerlik oranı nasıl bulunur ve bu oran çevre ve alanı nasıl etkiler, öğreneceksin.

:::hedefler
1. Eş ve benzer şekilleri ayırt etmek.
2. Benzer çokgenlerde karşılıklı kenarlar ve açılar arasındaki ilişkiyi kullanmak.
3. Benzerlik oranını bulmak, çevre ve alan oranıyla ilişkilendirmek.
4. Benzerlik ile gölge, harita ve ölçek problemlerini çözmek.
:::

:::ipucu
Benzerlikte **karşılıklı** kelimesi çok önemlidir. Kenarları eşleştirirken **en uzun kenarı en uzunla, en kısa kenarı en kısayla** eşle. Yanlış eşleştirme, yanlış oran demektir.
:::

## 1. Eşlik

İki şeklin **şekli ve boyutu tamamen aynıysa** bu şekillere **eş** denir. Birini diğerinin üzerine koyduğunda tam örtüşürler. Eş şekiller yer değiştirebilir, döndürülebilir ya da çevrilebilir, ama boyutları değişmez.

Eş çokgenlerde:

- Karşılıklı **kenarların uzunlukları** eşittir.
- Karşılıklı **açıların ölçüleri** eşittir.
- **Çevreleri ve alanları** eşittir.

Eşliği $\cong$ sembolüyle gösteririz. ABC üçgeni ile DEF üçgeni eşse $ABC \cong DEF$ yazılır. Köşe sırası karşılıklı olmalıdır: A köşesi D’ye, B köşesi E’ye, C köşesi F’ye karşılık gelir.

### Üçgenlerde eşlik şartları

İki üçgenin eş olduğunu anlamak için altı eşitliğin hepsini kontrol etmek gerekmez. Aşağıdaki şartlardan biri yeterlidir.

| Şart | Anlamı |
| --- | --- |
| Kenar - Kenar - Kenar (KKK) | Üç kenar karşılıklı eşit |
| Kenar - Açı - Kenar (KAK) | İki kenar ve aralarındaki açı karşılıklı eşit |
| Açı - Kenar - Açı (AKA) | İki açı ve aralarındaki kenar karşılıklı eşit |

## 2. Benzerlik

Biri, diğerinin **büyütülmüş ya da küçültülmüş** hâli olan şekillere **benzer** şekiller denir. Bir fotokopiyi büyütmek ya da küçültmek benzer şekil üretir.

İki çokgen benzerse:

- **Karşılıklı açıların ölçüleri eşittir.**
- **Karşılıklı kenarların oranları eşittir.**

Benzerliği $\sim$ sembolüyle gösteririz. Karşılıklı kenarların ortak oranı **benzerlik oranıdır** ($k$ ile gösterilir).

Örnek: Kenarları 3, 4, 5 cm olan üçgen ile kenarları 6, 8, 10 cm olan üçgen benzerdir.

$$k = \dfrac{6}{3} = \dfrac{8}{4} = \dfrac{10}{5} = 2$$

Büyük üçgenin her kenarı küçüğün 2 katıdır.

:::baglanti
Eş şekiller, **benzerlik oranı 1 olan** benzer şekillerdir. Yani her eş şekil aynı zamanda benzerdir, ama her benzer şekil eş olmak zorunda değildir.
:::

### Üçgenlerde benzerlik şartları

| Şart | Anlamı |
| --- | --- |
| Açı - Açı (AA) | İki açı karşılıklı eşit (üçüncü açı da eşit olur) |
| Kenar - Açı - Kenar (KAK) | İki kenarın oranı eşit ve aralarındaki açı eşit |
| Kenar - Kenar - Kenar (KKK) | Üç kenarın oranları eşit |

Örnek: Bir üçgenin açıları 40° ve 60°, diğerinin açıları 60° ve 80° ise üçgenler benzerdir. Çünkü birincinin üçüncü açısı 80°, ikincinin üçüncü açısı 40°’dir. Her iki üçgenin açıları 40°, 60°, 80° olur.

:::dene
1. Kenarları 6, 8, 10 ve 9, 12, $x$ olan iki üçgen benzerse $x$ kaçtır? => Oran $9/6 = 1{,}5$ olduğundan $x = 10 \cdot 1{,}5 = 15$.
2. İki benzer üçgenin benzerlik oranı 1 ise bu üçgenler için ne söylenebilir? => Eştirler.
:::

## 3. Benzerlik oranı ile çevre ve alan

Benzerlik oranı $k$ olan iki benzer çokgen için:

- **Çevreler oranı** $= k$
- **Alanlar oranı** $= k^2$

Örnek: Kenarları 3, 4, 5 cm olan üçgen (çevresi 12 cm, alanı 6 cm²) ile $k = 2$ olan benzeri:

| | Küçük üçgen | Büyük üçgen ($k = 2$) |
| --- | --- | --- |
| Kenarlar | 3, 4, 5 | 6, 8, 10 |
| Çevre | 12 | 24 ($2$ kat) |
| Alan | 6 | 24 ($4$ kat) |

:::neden-sonuc
- Kenarlar k kat büyür => Çevre de $k$ kat büyür.
- Hem uzunluk hem genişlik k kat büyür => Alan $k \cdot k = k^2$ kat büyür.
- Benzerlik oranı 3 ise => Çevre 3 kat, alan 9 kat olur.
:::

Bu yüzden iki kare ya da iki daire her zaman benzerdir. Kenarı 2 cm ve 6 cm olan iki karenin benzerlik oranı 3, alanlar oranı 9’dur: $4$ cm² ile $36$ cm².

## 4. Günlük hayat uygulamaları

### Gölge problemi

Aynı anda, güneş ışınlarının geliş açısı aynıdır. Bu yüzden boy ile gölge oluşturan dik üçgenler **benzerdir**.

**Örnek:** Boyu 1,5 m olan bir kişinin gölgesi 2 m iken, yanındaki bir ağacın gölgesi 8 m ölçülüyor. Ağacın boyu kaç metredir?

$$\dfrac{1{,}5}{2} = \dfrac{h}{8} \Rightarrow h = \dfrac{1{,}5 \cdot 8}{2} = 6\ \text{m}$$

### Harita ve ölçek

Haritalar gerçek yerlerin küçültülmüş, benzer halidir. **Ölçek**, harita üzerindeki uzunluğun gerçekteki uzunluğa oranıdır. $1/200\,000$ ölçekli bir haritada 1 cm, gerçekte 200 000 cm, yani 2 km demektir.

**Örnek:** $1/200\,000$ ölçekli haritada iki şehir arası 5 cm ise gerçek uzaklık:

$$5 \cdot 200\,000 = 1\,000\,000\ \text{cm} = 10\ \text{km}$$

Alan sorularında dikkat: Ölçek **uzunluk** oranıdır. Harita üzerindeki alan ile gerçek alan oranı ölçeğin karesi olur.

## 5. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Eş şekiller | Şekil ve boyut aynı |
| Benzer şekiller | Şekil aynı, boyut farklı olabilir |
| Benzerlik oranı | Karşılıklı kenarların oranı $k$ |
| Çevre oranı | $k$ |
| Alan oranı | $k^2$ |
| Üçgen benzerliği | AA, KAK, KKK |
| Ölçek | Harita uzunluğu / gerçek uzunluk |

## Mini test

:::soru{cevap="B"}
Kenar uzunlukları 6, 8, 10 cm olan bir üçgen ile kenar uzunlukları 9, 12, $x$ cm olan bir üçgen benzerdir.

Buna göre $x$ kaçtır?

- A) 14
- B) 15
- C) 16
- D) 18

---

1. Benzerlik oranı $\dfrac{9}{6} = \dfrac{12}{8} = \dfrac{3}{2}$.
2. $x = 10 \cdot \dfrac{3}{2} = 15$. Doğru cevap B.
:::

:::soru{cevap="C"}
İki kare benzerdir ve benzerlik oranı 3’tür. Küçük karenin alanı 4 cm² olduğuna göre büyük karenin alanı kaç cm²’dir?

- A) 12
- B) 18
- C) 36
- D) 81

---

1. Benzer şekillerde alanlar oranı, benzerlik oranının karesidir: $3^2 = 9$.
2. Büyük karenin alanı $4 \cdot 9 = 36$ cm². Doğru cevap C.
:::

:::soru{cevap="A"}
Aynı anda boyu 1,8 m olan bir kişinin gölgesi 2,4 m, bir direğin gölgesi 12 m ölçülüyor.

Buna göre direğin boyu kaç metredir?

- A) 9
- B) 8
- C) 7,2
- D) 16

---

1. Aynı anda güneş ışınlarının açısı aynı olduğundan kişi ve direk benzer dik üçgenler oluşturur.
2. $\dfrac{1{,}8}{2{,}4} = \dfrac{h}{12}$. Buradan $h = \dfrac{1{,}8 \cdot 12}{2{,}4} = 9$ m. Doğru cevap A.
:::

:::soru{cevap="D"}
Ölçeği $1/500\,000$ olan bir haritada iki şehir arasındaki uzaklık 6 cm’dir.

Buna göre bu iki şehir arasındaki gerçek uzaklık kaç kilometredir?

- A) 3
- B) 12
- C) 15
- D) 30

---

1. Gerçek uzaklık $= 6 \cdot 500\,000 = 3\,000\,000$ cm.
2. $100\,000$ cm $= 1$ km olduğundan $3\,000\,000$ cm $= 30$ km. Doğru cevap D.
:::

## Kendini dene

:::dene
1. Eş ve benzer şekiller arasındaki farkı bir cümleyle söyle. => Eş şekillerin şekli ve boyutu aynıdır. Benzer şekillerin şekli aynıdır ama boyutu farklı olabilir.
2. Benzerlik oranı 4 olan iki benzer üçgenden küçüğünün çevresi 9 cm ise büyüğünün çevresi kaç cm’dir? => $9 \cdot 4 = 36$ cm
3. Benzerlik oranı 5 olan iki benzer dikdörtgenden küçüğünün alanı 6 cm² ise büyüğünün alanı kaç cm²’dir? => $6 \cdot 25 = 150$ cm²
4. İki üçgenin ikişer açısı 50° ve 70° ise bu üçgenler benzer midir? => Evet. AA benzerlik şartı sağlanır, üçüncü açılar da 60° olur.
5. $1/50\,000$ ölçekli haritada 8 cm olarak ölçülen uzaklık gerçekte kaç kilometredir? => $8 \cdot 50\,000 = 400\,000$ cm $= 4$ km
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 12, false from public.topics where subject_id = 'lgs-mat' and name = 'Eşlik ve Benzerlik'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Eş ve benzer şekiller, benzerlik oranı, benzer çokgenlerde çevre ve alan oranı, benzerlik uygulamaları (gölge, harita, ölçek). Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Üçgenlerde eşlik ve benzerlik şartları (KKK, KAK, AKA ve AA) 8. sınıf programında bu ayrıntıda aranmayabilir, fazla ise silin, (b) alan oranı k² bilgisi, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Eşlik ve Benzerlik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Aynadaki yansımana bak. Boyun, yüzün aynı ama sağ elin sol el gibi görünüyor. Bir kapı açılırken menteşe etrafında dönüyor, bir kızak sabit yöne kayıyor. Matematikte bu üç hareketin adı **yansıma, dönme ve ötelemedir**. Bu konuda şekilleri koordinat düzleminde bu üç dönüşümle hareket ettirmeyi, simetriyi ve dönüşümün şekle ne yaptığını öğreneceksin.

:::hedefler
1. Öteleme, yansıma ve dönme kavramlarını açıklamak.
2. Bir noktanın ya da şeklin koordinatlarını bu dönüşümler sonucunda bulmak.
3. Dönüşümlerde şeklin hangi özelliklerinin değişmediğini söylemek.
4. Simetri doğrusunu ve simetrik şekilleri tanımak.
:::

:::ipucu
Dönüşüm sorularında **bir noktayı takip et**. Şeklin tamamı yerine bir köşenin yeni konumunu bulursan çoğunlukla cevap kolayca ortaya çıkar. Sonra aynı kuralı diğer köşelere uygula.
:::

## 1. Öteleme

**Öteleme**, bir şeklin her noktasının **aynı yönde ve aynı uzaklık kadar** kaydırılmasıdır. Şekil dönmez, ters çevrilmez, boyutu da değişmez.

Koordinat düzleminde bir noktayı yatayda $a$, düşeyde $b$ birim ötelemek için $x$’e $a$, $y$’ye $b$ eklenir.

$$(x, y) \longrightarrow (x + a,\ y + b)$$

- Sağa ötelemede $a$ pozitif, sola ötelemede negatiftir.
- Yukarı ötelemede $b$ pozitif, aşağı ötelemede negatiftir.

Örnek: $A(2, 3)$ noktası sağa 4 birim ve aşağı 5 birim ötelenirse $A'(2 + 4,\ 3 - 5) = A'(6, -2)$ olur.

:::dene
1. $B(-1, 4)$ noktası sola 2, yukarı 3 birim ötelenirse yeni noktanın koordinatları nedir? => $(-1 - 2,\ 4 + 3) = (-3, 7)$
2. Bir noktanın $(3, 5)$ noktasına ötelenmesiyle $(7, 2)$ noktası elde ediliyor. Öteleme miktarı nedir? => $x$ yönünde $7 - 3 = 4$ birim sağa, $y$ yönünde $2 - 5 = -3$, yani 3 birim aşağı.
:::

## 2. Yansıma

**Yansıma**, bir şeklin bir doğruya (**yansıma doğrusuna**) göre “ayna görüntüsünün” oluşturulmasıdır. Her nokta ile görüntüsü, yansıma doğrusundan **eşit uzaklıktadır** ve noktaları birleştiren doğru, yansıma doğrusuna **diktir**.

Koordinat eksenlerine göre yansıma kuralları:

| Yansıma doğrusu | Kural | Örnek: $(5, -2)$ |
| --- | --- | --- |
| x ekseni | $(x, y) \to (x, -y)$ | $(5, 2)$ |
| y ekseni | $(x, y) \to (-x, y)$ | $(-5, -2)$ |
| Orijin (noktaya göre) | $(x, y) \to (-x, -y)$ | $(-5, 2)$ |

Hatırlama yolu: **x eksenine göre yansıtırsan y’nin işareti değişir**, çünkü nokta eksenin diğer tarafına yukarı-aşağı geçer. **y eksenine göre yansıtırsan x’in işareti değişir**.

Yansımada şeklin **yönü ters döner**, yani sağ taraf sol tarafa geçer. Ancak boyut ve açılar korunur.

## 3. Dönme

**Dönme**, bir şeklin bir **merkez** etrafında belli bir **açı** kadar çevrilmesidir. Dönme yönü, **saat yönü** ya da **saat yönünün tersi** olarak belirtilir.

Merkezi orijin olan dönmelerde noktanın yeni koordinatları şöyledir.

| Dönme | Kural | Örnek: $(2, 3)$ |
| --- | --- | --- |
| 90°, saat yönünün tersi | $(x, y) \to (-y, x)$ | $(-3, 2)$ |
| 90°, saat yönü | $(x, y) \to (y, -x)$ | $(3, -2)$ |
| 180° | $(x, y) \to (-x, -y)$ | $(-2, -3)$ |

Dönmede merkez noktası **yerinden oynamaz**. Her nokta merkeze olan uzaklığını korur.

:::baglanti
180° dönme, orijine göre simetriyle aynı sonucu verir: $(x, y) \to (-x, -y)$. 90° dönmeyi iki kere uygularsan 180° dönme elde edersin.
:::

## 4. Dönüşümlerde değişmeyenler

Öteleme, yansıma ve dönme sırasında şeklin **boyutu ve biçimi** korunur. Yani:

- Kenar uzunlukları değişmez.
- Açı ölçüleri değişmez.
- Çevre ve alan değişmez.

Bu yüzden bu dönüşümlerle elde edilen şekiller, ilk şekille **eştir**. Şeklin değişen tek özelliği **konumu** (ve yansımada yönelimi) dir.

:::neden-sonuc
- Bir şekil ötelenir => Konumu değişir, yönü ve boyutu aynı kalır.
- Bir şekil yansıtılır => Konumu ve yönelimi değişir, boyutu aynı kalır. Görüntü aynadaki gibidir.
- Bir şekil döndürülür => Konumu ve yönü değişir, boyutu aynı kalır. Merkez sabittir.
:::

## 5. Simetri

Bir şekil bir doğru boyunca katlandığında iki yarısı **tam örtüşüyorsa** şeklin **simetri doğrusu** vardır. Bu doğruya göre şeklin bir yarısı, diğer yarısının yansımasıdır.

| Şekil | Simetri doğrusu sayısı |
| --- | --- |
| Eşkenar üçgen | 3 |
| Kare | 4 |
| Dikdörtgen (kare değil) | 2 |
| İkizkenar üçgen | 1 |
| Çember | Sonsuz sayıda (her çap) |

Harflerde de simetri görürüz. A, M, T, U harflerinin dikey bir simetri doğrusu vardır. H harfinin hem dikey hem yatay doğrusu vardır.

## 6. Konuyu toparla

| Dönüşüm | Kural | Ne değişir? |
| --- | --- | --- |
| Öteleme | $(x + a,\ y + b)$ | Konum |
| x eksenine yansıma | $(x, -y)$ | Konum, yönelim |
| y eksenine yansıma | $(-x, y)$ | Konum, yönelim |
| 180° dönme (orijin) | $(-x, -y)$ | Konum, yön |
| 90° dönme (saat yönünün tersi) | $(-y, x)$ | Konum, yön |

Dönüşümlerde kenar uzunlukları, açılar, çevre ve alan **değişmez**.

## Mini test

:::soru{cevap="A"}
$B(-1, 4)$ noktası sağa 3 birim, aşağı 6 birim ötelenirse yeni noktanın koordinatları aşağıdakilerden hangisi olur?

- A) $(2, -2)$
- B) $(2, 10)$
- C) $(-4, -2)$
- D) $(-4, 10)$

---

1. Sağa 3 birim: $x$ değerine $+3$ eklenir, $-1 + 3 = 2$.
2. Aşağı 6 birim: $y$ değerinden 6 çıkarılır, $4 - 6 = -2$.
3. Yeni nokta $(2, -2)$. Doğru cevap A.
:::

:::soru{cevap="C"}
$C(5, -2)$ noktasının y eksenine göre yansıması aşağıdakilerden hangisidir?

- A) $(5, 2)$
- B) $(-5, 2)$
- C) $(-5, -2)$
- D) $(5, -2)$

---

1. y eksenine göre yansımada $x$’in işareti değişir, $y$ aynı kalır.
2. $(5, -2) \to (-5, -2)$. Doğru cevap C.
:::

:::soru{cevap="B"}
$D(4, 1)$ noktası orijin etrafında saat yönünün tersine 90° döndürülüyor.

Buna göre yeni noktanın koordinatları aşağıdakilerden hangisidir?

- A) $(1, -4)$
- B) $(-1, 4)$
- C) $(-4, -1)$
- D) $(4, -1)$

---

1. Saat yönünün tersine 90° dönme kuralı: $(x, y) \to (-y, x)$.
2. $(4, 1) \to (-1, 4)$. Doğru cevap B.
:::

:::soru{cevap="D"}
Bir ABC üçgeni bir doğruya göre yansıtılarak $A'B'C'$ üçgeni elde ediliyor.

Buna göre aşağıdakilerden hangisi her zaman doğrudur?

- A) Köşelerin koordinatları değişmez.
- B) $A'B'C'$ üçgeninin alanı, ABC üçgeninin alanından büyüktür.
- C) $A'B'C'$ üçgeninin açıları, ABC üçgeninin açılarından farklıdır.
- D) $A'B'C'$ üçgeninin kenar uzunlukları, ABC üçgeninin kenar uzunluklarına eşittir.

---

1. Yansıma, şeklin konumunu ve yönelimini değiştirir. Köşelerin koordinatları değişir. A yanlış.
2. Yansımada boyut ve açılar korunur, alan değişmez. B ve C yanlış.
3. Kenar uzunlukları aynı kalır. Doğru cevap D.
:::

## Kendini dene

:::dene
1. $(3, -4)$ noktasının x eksenine göre yansımasını bul. => $(3, 4)$
2. $(-2, 6)$ noktasının orijin etrafında 180° dönmesiyle elde edilen nokta nedir? => $(2, -6)$
3. $(1, 2)$ noktası orijin etrafında saat yönünde 90° döndürülürse nereye gider? => $(x, y) \to (y, -x)$ kuralıyla $(2, -1)$.
4. Kare kaç simetri doğrusuna sahiptir? => 4 (iki köşegen, iki kenar orta dikmesi).
5. Bir şekil ötelenirse alanı değişir mi? => Hayır. Öteleme boyutu değiştirmez.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 11, false from public.topics where subject_id = 'lgs-mat' and name = 'Dönüşüm Geometrisi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Öteleme, yansıma, dönme, koordinat düzleminde dönüşümler, simetri, dönüşümlerde korunan özellikler. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Orijin etrafında 90° ve 180° dönme kuralları programda ayrıntılı aranmayabilir, fazla ise silin, (b) Orijine göre yansıma ifadesi (180° dönmeyle aynı), (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Dönüşüm Geometrisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir su deposuna kaç litre su sığar? Bir konserve kutusunun etiketi ne kadar kâğıt ister? Bir külah dondurma ile bir bardak aynı yükseklikte olunca hangisine daha çok sığar? Bu soruların hepsi **geometrik cisimlerin hacim ve yüzey alanı** hesabına dayanır. Bu konuda prizma, silindir, koni ve piramidin yüzey alanı ile hacmini hesaplamayı öğreneceksin.

:::hedefler
1. Dik prizma, silindir, koni ve piramidi tanımak, açınımlarını yorumlamak.
2. Bu cisimlerin yüzey alanını hesaplamak.
3. Bu cisimlerin hacmini hesaplamak.
4. Hacim ile litre ve su dökme problemlerini çözmek.
:::

:::ipucu
Hacim sorularında önce **taban alanını**, sonra **yüksekliği** bul. Prizma ve silindirde hacim $\text{taban alanı} \times \text{yükseklik}$ tir. Koni ve piramitte bu çarpımın $\dfrac{1}{3}$ ü alınır. Bu tek fark, çoğu hatayı önler.
:::

## 1. Dik prizma

**Prizma**, iki tabanı eş ve paralel çokgenlerden, yan yüzleri dikdörtgenlerden oluşan cisimdir. Yan kenarlar tabana dikse prizmaya **dik prizma** denir. Taban şekline göre isim alır: üçgen prizma, dikdörtgen prizma (kutu), kare prizma gibi.

$$V = \text{Taban alanı} \cdot \text{Yükseklik}$$

$$\text{Yüzey alanı} = 2 \cdot \text{Taban alanı} + \text{Yanal alan}$$

Yanal alan, taban çevresi ile yüksekliğin çarpımıdır: $\text{Yanal alan} = \text{Taban çevresi} \cdot h$.

**Örnek:** Ayrıtları 4 cm, 5 cm ve 6 cm olan dikdörtgenler prizması.

- Hacim: $4 \cdot 5 \cdot 6 = 120$ cm³
- Yüzey alanı: $2(4 \cdot 5 + 4 \cdot 6 + 5 \cdot 6) = 2(20 + 24 + 30) = 148$ cm²

:::dene
1. Taban alanı 24 cm², yüksekliği 7 cm olan dik prizmanın hacmi kaç cm³’tür? => $24 \cdot 7 = 168$ cm³
2. Bir küpün bir ayrıtı 3 cm ise hacmi ve yüzey alanı kaçtır? => Hacim $3^3 = 27$ cm³. Yüzey alanı $6 \cdot 3^2 = 54$ cm².
:::

## 2. Dik dairesel silindir

**Silindir**, iki tabanı eş daireler olan, yan yüzü açılınca dikdörtgen olan cisimdir. Taban yarıçapı $r$, yüksekliği $h$ olsun. Bu ünitede $\pi$ yaklaşık olarak 3 alınır (soruda belirtilir).

$$V = \pi r^2 h$$

$$\text{Yanal alan} = 2\pi r h$$

$$\text{Toplam yüzey alanı} = 2\pi r h + 2\pi r^2$$

Yan yüz açılınca kenarları $2\pi r$ ve $h$ olan bir dikdörtgen oluşur. Bu yüzden yanal alan çevre çarpı yüksekliktir.

**Örnek:** $r = 3$ cm, $h = 10$ cm, $\pi = 3$ olan silindir.

- Hacim: $3 \cdot 3^2 \cdot 10 = 270$ cm³
- Yanal alan: $2 \cdot 3 \cdot 3 \cdot 10 = 180$ cm²
- Toplam yüzey: $180 + 2 \cdot 3 \cdot 3^2 = 180 + 54 = 234$ cm²

## 3. Dik dairesel koni

**Koni**, bir dairesel tabandan ve bir tepe noktasından oluşur. Tabanın merkezi ile tepe noktası arasındaki dik uzaklık **yüksekliktir** ($h$). Tepe noktasından taban çemberindeki bir noktaya olan uzaklığa **ana doğru** ($l$) denir. Dik üçgen oluşur, bu yüzden Pisagor kullanılır.

$$l^2 = r^2 + h^2$$

$$V = \dfrac{1}{3}\pi r^2 h$$

$$\text{Yanal alan} = \pi r l \qquad \text{Toplam yüzey alanı} = \pi r l + \pi r^2 = \pi r (l + r)$$

**Örnek:** $r = 3$ cm, $h = 4$ cm, $\pi = 3$ olan koni.

- Ana doğru: $l = \sqrt{3^2 + 4^2} = 5$ cm
- Hacim: $\dfrac{1}{3} \cdot 3 \cdot 9 \cdot 4 = 36$ cm³
- Yanal alan: $3 \cdot 3 \cdot 5 = 45$ cm²
- Toplam yüzey: $45 + 3 \cdot 9 = 72$ cm²

:::baglanti
Tabanı ve yüksekliği aynı olan bir **koninin hacmi, silindirin hacminin $\dfrac{1}{3}$ ü** kadardır. Yani koni şeklindeki bir kabı üç kere doldurup bir silindir kaba boşaltırsan silindir tam dolar. Bu bilgi, su dökme sorularında işini kolaylaştırır.
:::

## 4. Piramit

**Piramit**, çokgen bir tabanı ve tabandaki köşeleri tek bir tepe noktasına bağlayan üçgen yüzlerden oluşur. Taban kare ise kare piramit, üçgen ise üçgen piramit adını alır.

$$V = \dfrac{1}{3} \cdot \text{Taban alanı} \cdot \text{Yükseklik}$$

Yükseklik, tepe noktasından tabana indirilen dik uzunluktur. Yüzey alanı, taban alanı ile yan yüz üçgenlerinin alanları toplamıdır.

**Örnek:** Tabanı 6 cm kenarlı bir kare olan, yüksekliği 5 cm olan piramidin hacmi

$$V = \dfrac{1}{3} \cdot 36 \cdot 5 = 60\ \text{cm}^3$$

| Cisim | Hacim | Not |
| --- | --- | --- |
| Prizma | $A_{taban} \cdot h$ | Dikdörtgenler prizması: $a \cdot b \cdot c$ |
| Silindir | $\pi r^2 h$ | Taban daire |
| Piramit | $\dfrac{1}{3} A_{taban} \cdot h$ | Prizmanın $\dfrac{1}{3}$ ü |
| Koni | $\dfrac{1}{3}\pi r^2 h$ | Silindirin $\dfrac{1}{3}$ ü |

:::neden-sonuc
- Aynı taban ve yükseklikte prizma ve piramit => Piramidin hacmi prizmanın $\dfrac{1}{3}$ ü kadardır.
- Aynı taban ve yükseklikte silindir ve koni => Koninin hacmi silindirin $\dfrac{1}{3}$ ü kadardır.
- Yarıçap iki katına çıkar => Silindir ya da koninin hacmi **4 katına** çıkar, çünkü $r^2$ ile orantılıdır.
:::

## 5. Hacim, litre ve su problemleri

Birimler arasındaki ilişkiyi bil.

| Hacim | Karşılığı |
| --- | --- |
| 1 dm³ | 1 litre |
| 1 000 cm³ | 1 litre |
| 1 m³ | 1 000 litre |

**Örnek:** Tabanı 20 cm × 25 cm olan dikdörtgenler prizması şeklindeki bir akvaryumda su yüksekliği 12 cm’dir. Kaç litre su vardır?

$$V = 20 \cdot 25 \cdot 12 = 6\,000\ \text{cm}^3 = 6\ \text{litre}$$

**Örnek:** Yarıçapı 5 cm, yüksekliği 12 cm olan silindir şeklindeki bir bardakla, taban ve yüksekliği aynı olan koni şekilli bir kabın hacimleri oranı $3 : 1$ dir. Çünkü koni, silindirin $\dfrac{1}{3}$ ü kadar su alır.

## 6. Konuyu toparla

| Başlık | Hatırlanacak |
| --- | --- |
| Prizma hacmi | Taban alanı $\times$ yükseklik |
| Silindir hacmi | $\pi r^2 h$ |
| Silindir yanal alanı | $2\pi r h$ |
| Koni hacmi | $\dfrac{1}{3}\pi r^2 h$ |
| Koni ana doğrusu | $l = \sqrt{r^2 + h^2}$ |
| Piramit hacmi | $\dfrac{1}{3} \cdot$ taban alanı $\cdot$ yükseklik |
| Litre | 1 dm³ = 1 L |

## Mini test

:::soru{cevap="B"}
Taban alanı 24 cm², yüksekliği 7 cm olan bir dik prizmanın hacmi kaç cm³’tür?

- A) 31
- B) 168
- C) 96
- D) 48

---

1. Dik prizmanın hacmi taban alanı ile yüksekliğin çarpımıdır.
2. $V = 24 \cdot 7 = 168$ cm³. Doğru cevap B.
:::

:::soru{cevap="C"}
Taban yarıçapı 2 cm, yüksekliği 5 cm olan bir silindirin hacmi kaç cm³’tür? ($\pi = 3$ alınız.)

- A) 30
- B) 40
- C) 60
- D) 120

---

1. Silindirin hacmi $V = \pi r^2 h$ dir.
2. $V = 3 \cdot 2^2 \cdot 5 = 3 \cdot 4 \cdot 5 = 60$ cm³. Doğru cevap C.
:::

:::soru{cevap="A"}
Taban yarıçapı 6 cm, yüksekliği 8 cm olan dik dairesel koninin yanal alanı kaç cm²’dir? ($\pi = 3$ alınız.)

- A) 180
- B) 144
- C) 216
- D) 96

---

1. Ana doğru: $l = \sqrt{r^2 + h^2} = \sqrt{36 + 64} = 10$ cm.
2. Yanal alan $= \pi r l = 3 \cdot 6 \cdot 10 = 180$ cm². Doğru cevap A.
:::

:::soru{cevap="D"}
Bir silindir ile bir koninin taban yarıçapları ve yükseklikleri aynıdır. Silindirin hacmi 90 cm³ olduğuna göre koninin hacmi kaç cm³’tür?

- A) 15
- B) 45
- C) 60
- D) 30

---

1. Aynı taban ve yükseklikte koninin hacmi silindirin hacminin $\dfrac{1}{3}$ ü kadardır.
2. $\dfrac{90}{3} = 30$ cm³. Doğru cevap D.
:::

## Kendini dene

:::dene
1. Bir kenarı 5 cm olan küpün hacmi ve yüzey alanı kaçtır? => Hacim $5^3 = 125$ cm³. Yüzey alanı $6 \cdot 25 = 150$ cm².
2. Yarıçapı 3 cm, yüksekliği 10 cm olan silindirin hacmi kaç cm³’tür? ($\pi = 3$) => $3 \cdot 9 \cdot 10 = 270$ cm³
3. Tabanı kenarı 6 cm olan bir kare, yüksekliği 5 cm olan bir piramidin hacmi nedir? => $\dfrac{1}{3} \cdot 36 \cdot 5 = 60$ cm³
4. Bir akvaryum 40 cm × 30 cm × 25 cm boyutundadır. Tamamen dolduğunda kaç litre su alır? => $40 \cdot 30 \cdot 25 = 30\,000$ cm³ $= 30$ litre.
5. Silindirin yarıçapı iki katına çıkarılırsa hacmi kaç katına çıkar? => 4 katına. Hacim $r^2$ ile orantılıdır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'lgs-mat' and name = 'Geometrik Cisimler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Dik prizma, dik dairesel silindir, dik dairesel koni ve piramidin yüzey alanı ile hacmi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek sorular bu metin için yazıldı.
Kontrol edilecekler: (a) Piramit ve koninin hacim ile yüzey alanı 8. sınıf kapsamında olup olmadığı (küre bilerek konmadı), (b) π değeri soruda verilmediyse hesaplamayı sembolle bırakma uyarısı, (c) soruların LGS tarzına uyup uymadığı.$lesson$ from public.topics where subject_id = 'lgs-mat' and name = 'Geometrik Cisimler'
on conflict (topic_id) do nothing;

