-- TYT Temel Matematik konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

TYT Matematik'in ilk sorusu çoğu zaman bu konudan gelir. Sayıların hangi kümeye ait olduğunu, tek ve çift sayıların toplama ile çarpmada nasıl davrandığını, ardışık sayıları ve asal sayıları bilmek, sonraki bütün konuların zeminidir. Bu konuda kümeleri ayırt etmeyi, **toplam formüllerini**, işlem önceliğini ve asal sayılarla ilgili kuralları öğreneceksin.

:::hedefler
1. Doğal sayı, tam sayı, rasyonel ve irrasyonel sayıları ayırt etmek.
2. Tek ve çift sayılarla yapılan işlemlerin sonucunun tek mi çift mi olduğunu bulmak.
3. Ardışık sayılar ve düzenli sayı dizilerinin toplamını formülle hesaplamak.
4. Asal sayıları ve aralarında asal sayıları tanımak.
5. İşlem önceliğine uyarak karmaşık işlemleri doğru sonuçlandırmak.
:::

:::ipucu
TYT'de bu konunun soruları kısa ama tuzaklıdır. Sonuca koşmadan önce her sayının **hangi türden** olduğunu (tek mi çift mi, asal mı, negatif mi) küçük bir notla yaz. Çoğu soru tek bir ayrıntıyı atlayanı yakalamak için yazılır.
:::

## 1. Sayı kümeleri

Sayılar küçükten büyüğe doğru birbirini içeren kümelerde toplanır.

![Doğal sayılar tam sayıların içinde, tam sayılar rasyonel sayıların içinde, rasyonel ve irrasyonel sayılar birlikte gerçek sayıları oluşturur](/lessons/tyt-mat/sayi-kumeleri.svg "Sayı kümelerinin iç içe gösterimi | Yolumnet")

| Küme | Gösterim | İçindekiler |
| --- | --- | --- |
| Sayma sayıları | $\mathbb{N}^+$ | 1, 2, 3, ... |
| Doğal sayılar | $\mathbb{N}$ | 0, 1, 2, 3, ... |
| Tam sayılar | $\mathbb{Z}$ | ..., -2, -1, 0, 1, 2, ... |
| Rasyonel sayılar | $\mathbb{Q}$ | $\dfrac{a}{b}$ biçiminde yazılabilen sayılar ($a$ ve $b$ tam sayı, $b$ sıfırdan farklı) |
| İrrasyonel sayılar | $\mathbb{Q}'$ | Kesir olarak yazılamayanlar: $\sqrt{2}$, $\pi$ |
| Gerçek sayılar | $\mathbb{R}$ | Rasyonel ve irrasyonel sayıların hepsi |

Üç noktaya dikkat et:

- Türkiye'deki programda **0 doğal sayıdır**, ama sayma sayısı değildir.
- Her tam sayı rasyoneldir, çünkü $5 = \dfrac{5}{1}$ yazılabilir.
- Ondalık yazılımı sonlanan ya da tekrar eden sayılar rasyoneldir. Örneğin $0{,}25 = \dfrac{1}{4}$ ve $0{,}\overline{3} = \dfrac{1}{3}$. Tekrar etmeden sonsuza giden sayılar irrasyoneldir.

## 2. Tek ve çift sayılar

Çift sayılar $2k$, tek sayılar $2k+1$ biçimindedir ($k$ tam sayı). İşlemlerin sonucunu sayı denemeden şu tablodan okuyabilirsin.

| İşlem | Sonuç |
| --- | --- |
| çift + çift, çift - çift | çift |
| tek + tek, tek - tek | **çift** |
| tek + çift, tek - çift | tek |
| çift $\cdot$ herhangi bir sayı | çift |
| tek $\cdot$ tek | tek |
| tek$^n$ | tek |
| çift$^n$ ($n \geq 1$) | çift |

Çarpımın tek olması için **bütün çarpanların tek** olması gerekir. Bir tane çift çarpan, çarpımı çift yapar. Bu yüzden "çarpım tek" bilgisi sana iki çarpanın da tek olduğunu söyler.

**Örnek.** $a$ ve $b$ tam sayıları için $a \cdot b$ tek ise $a + b$ nedir? Çarpım tek olduğundan ikisi de tektir. Tek + tek = çift olur.

Ardışık iki tam sayıdan biri mutlaka çifttir. Bu yüzden $n(n+1)$ çarpımı **her zaman çifttir**.

## 3. Ardışık sayılar

Ardışık tam sayılar $n, n+1, n+2, \ldots$ biçimindedir. Ardışık çift ya da ardışık tek sayılarda fark 2'dir: $2k, 2k+2, 2k+4$.

Üç ardışık sayı ile çalışırken **ortadakini $x$ almak** işini kolaylaştırır: $x-1, x, x+1$. Toplam doğrudan $3x$ olur.

**Örnek.** Üç ardışık çift sayının toplamı 78 ise en büyüğü kaçtır? Ortanca $x$ olsun: $3x = 78$ ve $x = 26$. Sayılar 24, 26, 28 olur. En büyük 28'dir.

### Sayı dizilerinin toplamı

Terimleri arasındaki fark sabit olan dizilerde şu iki bilgi her şeyi çözer:

$$\text{Terim sayısı} = \dfrac{\text{son} - \text{ilk}}{\text{fark}} + 1$$

$$\text{Toplam} = \dfrac{(\text{ilk} + \text{son}) \cdot \text{terim sayısı}}{2}$$

**Örnek.** $5 + 10 + 15 + \ldots + 100$ toplamını bulalım. Fark 5'tir. Terim sayısı $\dfrac{100-5}{5}+1 = 20$. Toplam $\dfrac{(5+100) \cdot 20}{2} = 1050$.

Sık kullanılan özel durumlar:

| Toplam | Sonuç |
| --- | --- |
| $1 + 2 + 3 + \ldots + n$ | $\dfrac{n(n+1)}{2}$ |
| $2 + 4 + 6 + \ldots + 2n$ | $n(n+1)$ |
| $1 + 3 + 5 + \ldots + (2n-1)$ | $n^2$ |

Örneğin ilk 15 tek sayının toplamı $15^2 = 225$'tir. Son terim 29 olur ve $1 + 3 + \ldots + 29$ toplamını tek tek toplamana gerek kalmaz.

:::baglanti
"Terim sayısı" hesabında **+1** unutulursa cevap yanlış çıkar. Kontrol için küçük bir örnek dene: 3'ten 7'ye kadar ardışık sayılar 5 tanedir ve $\dfrac{7-3}{1}+1 = 5$ yapar. Fark kadar bölme, aradaki **boşlukları** sayar. Terim sayısı boşluk sayısından bir fazladır.
:::

## 4. Asal sayılar

**Asal sayı**, 1'den büyük olup yalnızca 1'e ve kendisine bölünen doğal sayıdır. İlk asal sayılar:

$$2,\ 3,\ 5,\ 7,\ 11,\ 13,\ 17,\ 19,\ 23,\ 29,\ 31,\ 37$$

Bilmen gereken kurallar:

- **2, tek çift asal sayıdır.** Diğer bütün çift sayılar 2'ye bölünür.
- 1 asal değildir ve bileşik de değildir.
- Bir sayının asal olup olmadığını anlamak için sayının kareköküne kadar olan asal sayılara bölünüp bölünmediğine bak. 97 için $\sqrt{97}$ yaklaşık 9,8 olduğundan 2, 3, 5, 7'ye bakmak yeter. Hiçbiri bölmez, 97 asaldır.
- Sonu 1, 3, 7 ya da 9 ile biten bir sayının asal olması **gerekmez**. Örneğin 91, $7 \cdot 13$ olduğundan asal değildir. Sonu 0, 2, 4, 5, 6, 8 olan sayılar ise (2 ve 5 dışında) asal olamaz.

**Aralarında asal** iki sayının 1'den başka ortak böleni yoktur. 14 ile 15 aralarında asaldır, ama 15 asal değildir. İki ardışık sayı her zaman aralarında asaldır.

**Örnek.** 20 ile 40 arasında kaç asal sayı vardır? 23, 29, 31, 37 olmak üzere 4 tane.

## 5. İşlem önceliği

İşlemler şu sırayla yapılır:

1. Parantezin içi (en içteki parantezden başla)
2. Üs ve kök
3. Çarpma ve bölme (soldan sağa)
4. Toplama ve çıkarma (soldan sağa)

**Örnek.** $3 + 4 \cdot (2-5)^2 \div 6 - 1$ işleminde önce parantez: $2 - 5 = -3$. Sonra üs: $(-3)^2 = 9$. Sonra soldan sağa çarpma ve bölme: $4 \cdot 9 = 36$ ve $36 \div 6 = 6$. En son $3 + 6 - 1 = 8$.

Çıkarma işaretini taşırken en çok hata burada yapılır. $-(a - b) = -a + b$ ve $(-3)^2 = 9$ iken $-3^2 = -9$'dur.

:::ipucu{baslik="Sık yapılan hata"}
$-3^2$ ile $(-3)^2$ aynı değildir. Parantez yoksa üs yalnızca 3'e uygulanır ve sonuç $-9$ olur. Parantez varsa eksi işareti de üssün içindedir ve sonuç $9$ olur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Sayı kümeleri | $\mathbb{N}^+ \subset \mathbb{N} \subset \mathbb{Z} \subset \mathbb{Q} \subset \mathbb{R}$ |
| Tek ve çift | tek + tek = çift, çarpım tek ise çarpanların hepsi tek |
| Terim sayısı | (son - ilk) / fark + 1 |
| Toplam | (ilk + son) $\cdot$ terim sayısı / 2 |
| $1+2+\ldots+n$ | $n(n+1)/2$ |
| İlk $n$ tek sayı | $n^2$ |
| Asal | 2 tek çift asal, 1 asal değil |

## Mini test

:::soru{cevap="A"}
$1 + 2 + 3 + \ldots + 40$ toplamı kaçtır?

- A) 820
- B) 861
- C) 1600
- D) 1640
- E) 1681

---

1. Ardışık sayıların toplam formülü $\dfrac{n(n+1)}{2}$ dir.
2. $n = 40$ için $\dfrac{40 \cdot 41}{2} = 820$ bulunur. Doğru cevap A.

Diğer şıklar: **861** 41'e kadar toplanmış / **1600** $n^2$ ile karıştırılmış / **1640** 2'ye bölmek unutulmuş / **1681** $(n+1)^2$ ile karıştırılmış.
:::

:::soru{cevap="D"}
$4 + 7 + 10 + \ldots + 100$ toplamı kaçtır?

- A) 1650
- B) 1664
- C) 1715
- D) 1716
- E) 1717

---

1. Fark 3'tür. Terim sayısı $\dfrac{100-4}{3}+1 = 33$ olur.
2. Toplam $\dfrac{(4+100) \cdot 33}{2} = 52 \cdot 33 = 1716$ bulunur. Doğru cevap D.

Diğer şıklar: **1650** ilk terim hesaba katılmamış, ortalama 50 alınmış / **1664** terim sayısında +1 unutulmuş / **1715** bir eksik sayılmış / **1717** bir fazla sayılmış.
:::

:::soru{cevap="D"}
$a$, $b$ ve $c$ tam sayıları için $a \cdot c$ tek ve $a + b$ tek olduğuna göre aşağıdakilerden hangisi **tek** sayıdır?

- A) $a + c$
- B) $a \cdot b$
- C) $b \cdot c$
- D) $b + c$
- E) $a + b + c$

---

1. $a \cdot c$ tek olduğundan $a$ ve $c$ ikisi de tektir.
2. $a$ tek ve $a + b$ tek olduğundan $b$ çifttir.
3. $b + c$ = çift + tek = **tek**. Diğerleri: $a + c$ çift, $a \cdot b$ çift, $b \cdot c$ çift, $a + b + c$ = tek + çift + tek = çift. Doğru cevap D.

Diğer şıklar: **$a + c$** tek + tek toplamı tek sanılmış / **$a \cdot b$** tek ile çiftin çarpımı tek sanılmış / **$b \cdot c$** çift çarpanlı çarpım tek sanılmış / **$a + b + c$** üç toplananın biri çift sayılmış.
:::

:::soru{cevap="C"}
Rakamları toplamı 10 olan iki basamaklı asal sayıların toplamı kaçtır?

- A) 110
- B) 128
- C) 129
- D) 130
- E) 220

---

1. Rakamları toplamı 10 olan iki basamaklı sayılar: 19, 28, 37, 46, 55, 64, 73, 82, 91.
2. Çift olanlar ve 5'in katı olan 55 asal değildir. 91 = $7 \cdot 13$ olduğundan asal değildir.
3. Asal olanlar 19, 37 ve 73'tür. Toplamları $19 + 37 + 73 = 129$ olur. Doğru cevap C.

Diğer şıklar: **110** 19 unutulmuş / **128** bir eksik sayılmış / **130** bir fazla sayılmış / **220** 91 de asal sanılmış.
:::

## Kendini dene

:::dene
1. Bir tam sayı hem rasyonel hem irrasyonel olabilir mi? => Hayır. Her tam sayı rasyoneldir, irrasyonel sayılar rasyonel değildir. İki küme ortak eleman içermez.
2. $a$ tek, $b$ çift bir tam sayı ise $a \cdot b + a$ çift midir, tek midir? => $a \cdot b$ çifttir. Çift + tek = tek olduğundan sonuç tektir.
3. $2 + 4 + 6 + \ldots + 50$ toplamı kaçtır? => $2 + 4 + \ldots + 2n$ toplamı $n(n+1)$ ve $n = 25$ olduğundan $25 \cdot 26 = 650$.
4. 40 ile 60 arasında kaç asal sayı vardır? => 41, 43, 47, 53, 59 olmak üzere 5 tane.
5. $-2^4$ ile $(-2)^4$ sayılarını karşılaştır. => $-2^4 = -16$ ve $(-2)^4 = 16$. İkincisi büyüktür.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-mat' and name = 'Temel Kavramlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Sayı kümeleri, tek-çift sayılar, ardışık sayılar ve toplam formülleri, asal sayılar, işlem önceliği. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) 0'ın doğal sayı kabul edilmesi (Türkiye programı), (b) Soruların TYT düzeyine uygunluğu.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Temel Kavramlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sayının kaç basamaklı olduğunu, her basamağın o sayıya ne kattığını ve rakamlarının yerini değiştirince sayının nasıl değiştiğini bilmek TYT'nin klasik soru tiplerinden birini çözer. Kitap sayfalarını numaralandırırken kaç rakam kullanıldığı ya da rakamları farklı kaç sayı yazılabileceği gibi sorular tamamen bu konudandır. Bu konuda **çözümleme**, rakam-sayı farkı ve sayma kurallarını öğreneceksin.

:::hedefler
1. Rakam, basamak, basamak değeri ve sayı değeri kavramlarını ayırt etmek.
2. İki ve üç basamaklı sayıları çözümleyerek denklem kurmak.
3. Rakamlarının yeri değişen sayılarda toplam ve farkı hızlı hesaplamak.
4. Belirli koşullu sayıların kaç tane olduğunu saymak.
5. Sayfa numaralandırma problemlerini çözmek.
:::

:::ipucu
Bu konunun anahtar kelimesi **çözümlemedir**. $\overline{ab}$ yazdığında bunun iki ayrı sayı değil, $10a + b$ olduğunu hatırla. Her soruda ilk adım sayıyı çözümlemek olsun.
:::

## 1. Rakam ve basamak

Sayıları yazmakta kullandığımız 0, 1, 2, ..., 9 sembollerine **rakam** denir. Rakamlar 10 tanedir. Bir sayıdaki her rakam sağdan sola birler, onlar, yüzler, binler... basamağında durur.

**345** sayısında:

| Rakam | Basamak | Basamak değeri | Sayıya katkısı |
| --- | --- | --- | --- |
| 5 | birler | 5 | 5 |
| 4 | onlar | 4 | 40 |
| 3 | yüzler | 3 | 300 |

Buradaki **basamak değeri** rakamın kendisidir. Rakamın **sayı değeri** (yani sayıya katkısı) ise $3 \cdot 100 = 300$ gibi hesaplanır. Soruda "basamak değeri" dendiğinde rakamın kendisini, "sayı değeri" dendiğinde basamağıyla çarpılmış hâlini düşün.

Bir sayının üstüne çizgi çekmek, onun **rakamlardan oluşan bir sayı** olduğunu gösterir: $\overline{ab}$ iki rakamlı sayıdır, $a \cdot b$ çarpımı değildir.

## 2. Çözümleme

Rakamlarla yazılmış sayıyı basamak değerlerinin toplamı olarak yazmaya **çözümleme** denir.

$$\overline{ab} = 10a + b$$

$$\overline{abc} = 100a + 10b + c$$

$$\overline{abcd} = 1000a + 100b + 10c + d$$

Baştaki rakam sıfır olamaz. $\overline{ab}$ iki basamaklıysa $a \neq 0$ olmalıdır. Bu bilgiyi soruda **yazılmamış gizli koşul** olarak hatırla.

**Örnek.** $\overline{ab} + \overline{ba}$ toplamını çözümleyelim.

$$(10a + b) + (10b + a) = 11a + 11b = 11(a+b)$$

Demek ki iki rakamı yer değiştirmiş iki sayının toplamı **her zaman 11'in katıdır**. Fark ise şöyledir:

$$\overline{ab} - \overline{ba} = (10a + b) - (10b + a) = 9a - 9b = 9(a - b)$$

Bu fark **9'un katıdır**. Üç basamaklı bir sayı için de aynı mantık geçerlidir:

$$\overline{abc} - \overline{cba} = 99(a - c)$$

:::baglanti
Çözümleme ile bölünebilme birbirine bağlıdır. $11(a+b)$ ve $9(a-b)$ ifadeleri, sonraki konuda göreceğin 9 ve 11 ile bölünebilme kurallarının kaynağıdır.
:::

**Örnek.** $\overline{ab} - \overline{ba} = 27$ ve $a + b = 11$ ise $\overline{ab}$ kaçtır?

$9(a - b) = 27$ olduğundan $a - b = 3$. Denklem çifti: $a + b = 11$ ve $a - b = 3$. Taraf tarafa toplarsak $2a = 14$, $a = 7$ ve $b = 4$. Sayı **74** olur. Kontrol: $74 - 47 = 27$.

## 3. Kaç tane sayı yazılır?

Sayma sorularında basamakları sırayla düşün ve **her basamak için seçenek sayısını** çarp.

**n basamaklı doğal sayılar.** İlk basamak 1 ile 9 arasında (9 seçenek), diğer basamakların her biri 0 ile 9 arasında (10 seçenek) olabilir.

| Basamak sayısı | Kaç tane |
| --- | --- |
| 1 | 10 (0 dahil) |
| 2 | $9 \cdot 10 = 90$ |
| 3 | $9 \cdot 10 \cdot 10 = 900$ |
| 4 | $9 \cdot 10^3 = 9000$ |

**Rakamları farklı sayılar.** Her basamakta bir önceki rakamlar kullanılamayacağından seçenekler azalır.

**Örnek.** Rakamları birbirinden farklı kaç tane üç basamaklı doğal sayı vardır?

- Yüzler basamağı 0 olamaz: 9 seçenek.
- Onlar basamağı, yüzlerdekinden farklı ama 0 olabilir: $10 - 1 = 9$ seçenek.
- Birler basamağı, ilk ikisinden farklı: $10 - 2 = 8$ seçenek.

Toplam $9 \cdot 9 \cdot 8 = 648$ olur.

:::ipucu{baslik="Sık yapılan hata"}
"Rakamları farklı" koşulunda yüzler basamağına $10 \cdot 9 \cdot 8 = 720$ gibi hesap yapmak, 0'ı baş basamağa koymak demektir. Sıfırın baş basamakta olduğu sayı üç basamaklı değildir. Önce **kısıtlı basamaktan** başla.
:::

## 4. Sayfa numaralandırma

Bir kitabın sayfalarını 1'den $n$'ye kadar numaralandırırken kullanılan rakam sayısı sorulur. Basamak gruplarına ayırıp topla.

| Sayfalar | Kaç sayfa | Her sayfada rakam | Toplam rakam |
| --- | --- | --- | --- |
| 1 - 9 | 9 | 1 | 9 |
| 10 - 99 | 90 | 2 | 180 |
| 100 - 999 | 900 | 3 | 2700 |

**Örnek.** 1'den 120'ye kadar sayfa numaraları yazılırken kaç rakam kullanılır?

- 1'den 9'a: $9 \cdot 1 = 9$
- 10'dan 99'a: $90 \cdot 2 = 180$
- 100'den 120'ye: $21 \cdot 3 = 63$ (100 ve 120 dahil, sayfa sayısı $120 - 100 + 1 = 21$)

Toplam $9 + 180 + 63 = 252$ rakam.

Bu tür sorularda sık yapılan hata, sınır sayısını sayarken **+1 unutmaktır**. Son sayfa dahil, ilk sayfa dahil ise sayfa sayısı $\text{son} - \text{ilk} + 1$ olur.

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $\overline{ab}$ | $10a + b$, çarpım değil |
| $\overline{abc}$ | $100a + 10b + c$ |
| $\overline{ab} + \overline{ba}$ | $11(a+b)$ |
| $\overline{ab} - \overline{ba}$ | $9(a-b)$ |
| $\overline{abc} - \overline{cba}$ | $99(a-c)$ |
| 3 basamaklı sayı sayısı | 900 |
| Rakamları farklı 3 basamaklı | $9 \cdot 9 \cdot 8 = 648$ |
| Sayfa numarası | Basamak grubu $\times$ rakam sayısı |

## Mini test

:::soru{cevap="B"}
İki basamaklı $\overline{ab}$ sayısı için $\overline{ab} - \overline{ba} = 27$ ve $a + b = 11$ olduğuna göre $\overline{ab}$ kaçtır?

- A) 65
- B) 74
- C) 75
- D) 83
- E) 92

---

1. $\overline{ab} - \overline{ba} = 9(a - b) = 27$ olduğundan $a - b = 3$.
2. $a + b = 11$ ve $a - b = 3$ denklemlerinden $a = 7$ ve $b = 4$ bulunur.
3. Sayı 74'tür. Kontrol: $74 - 47 = 27$. Doğru cevap B.

Diğer şıklar: **65** $a - b = 1$ alınmış / **75** bir fazla sayılmış / **83** $a - b = 5$ alınmış / **92** $a - b = 7$ alınmış.
:::

:::soru{cevap="E"}
1'den 120'ye kadar (120 dahil) sayfa numaraları yazılırken toplam kaç rakam kullanılır?

- A) 231
- B) 240
- C) 249
- D) 251
- E) 252

---

1. 1-9 arası 9 sayfa, her biri 1 rakam: $9$.
2. 10-99 arası 90 sayfa, her biri 2 rakam: $180$.
3. 100-120 arası $120 - 100 + 1 = 21$ sayfa, her biri 3 rakam: $63$.
4. Toplam $9 + 180 + 63 = 252$. Doğru cevap E.

Diğer şıklar: **231** üç basamaklı sayfalar iki rakamlı sayılmış / **240** bütün sayfalar iki rakamlı sayılmış / **249** 120. sayfa sayılmamış / **251** bir eksik sayılmış.
:::

:::soru{cevap="E"}
Rakamları birbirinden farklı kaç tane üç basamaklı doğal sayı yazılabilir?

- A) 324
- B) 504
- C) 576
- D) 647
- E) 648

---

1. Yüzler basamağı 0 olamaz: 9 seçenek.
2. Onlar basamağı yüzlerdekinden farklı, 0 olabilir: $10 - 1 = 9$ seçenek.
3. Birler basamağı ilk ikisinden farklı: $10 - 2 = 8$ seçenek.
4. $9 \cdot 9 \cdot 8 = 648$. Doğru cevap E.

Diğer şıklar: **324** yarısı alınmış / **504** $9 \cdot 8 \cdot 7$ hesaplanmış / **576** $9 \cdot 8 \cdot 8$ hesaplanmış / **647** bir eksik sayılmış.
:::

:::soru{cevap="B"}
Rakamları farklı ve $\overline{ab}$ iki basamaklı bir sayıdır. $a > b$ ve $\overline{ab} + \overline{ba}$ toplamı tam kare olduğuna göre bu koşulları sağlayan kaç farklı $\overline{ab}$ sayısı vardır?

- A) 3
- B) 4
- C) 5
- D) 6
- E) 8

---

1. $\overline{ab} + \overline{ba} = 11(a + b)$ olur.
2. $11(a+b)$ tam kare ise $a + b$ de 11'in katı olmalıdır. $a + b \leq 17$ olduğundan $a + b = 11$ ve toplam $121 = 11^2$.
3. $a > b$ koşuluyla $(9,2), (8,3), (7,4), (6,5)$ çiftleri bulunur. Sayılar 92, 83, 74, 65.
4. Toplam 4 sayı vardır. Doğru cevap B.

Diğer şıklar: **3** bir çift atlanmış / **5** bir fazla sayılmış / **6** fazladan çift sayılmış / **8** $a > b$ şartı unutulmuş.
:::

## Kendini dene

:::dene
1. $\overline{ab} + \overline{ba} = 121$ ise $a + b$ kaçtır? => $11(a+b) = 121$ olduğundan $a + b = 11$.
2. 3 basamaklı kaç doğal sayı vardır? => $9 \cdot 10 \cdot 10 = 900$.
3. 1'den 99'a kadar sayfa numaralarında kaç tane 0 rakamı kullanılır? => Yalnızca 10, 20, ..., 90 sayılarının birler basamağında 0 vardır. Toplam 9 tane.
4. Rakamları farklı kaç tane iki basamaklı sayı vardır? => Onlar basamağı için 9, birler basamağı için 9 seçenek olduğundan $9 \cdot 9 = 81$.
5. $\overline{abc} - \overline{cba}$ farkı en çok kaç olabilir? => Fark $99(a - c)$ olduğundan $a - c$ en büyük 9 olmalı. $a = 9$ ve $c = 0$ alınır. Örneğin $900 - 009 = 891$ ve en büyük fark $99 \cdot 9 = 891$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'Sayı Basamakları'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Rakam, basamak, çözümleme, rakamları yer değiştiren sayılar, sayma, sayfa numaralandırma. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) "basamak değeri" ve "sayı değeri" terimlerinin ders kitabı kullanımıyla uyumu, (b) Kendini dene 5. sorunun ifadesi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Sayı Basamakları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sayıyı başka bir sayıya bölüp kalanı bulmak, ilk bakışta basit görünür. TYT'de ise bu konu çok işe yarar: sayıların yapısını, rakam bulma sorularını ve gün, hafta, saat gibi periyodik problemleri kalanla çözersin. Bu konuda **bölme algoritmasını**, bölünebilme kurallarını ve kalan hesabının püf noktalarını öğreneceksin.

:::hedefler
1. Bölme işlemini $a = b \cdot q + r$ biçiminde yazmak ve kalanın koşullarını bilmek.
2. 2, 3, 4, 5, 6, 8, 9, 10 ve 11 ile bölünebilme kurallarını uygulamak.
3. Bilinmeyen rakam içeren sayılarda bölünebilme koşulundan rakam bulmak.
4. Kalan verilen sayılarla toplama ve çarpma işlemlerinin kalanını bulmak.
5. İki farklı kalan koşulunu aynı anda sağlayan sayıları belirlemek.
:::

:::ipucu
Kalan sorularında en güçlü fikir şudur: Kalan **bölenden küçük** olmalıdır. Bir sayıyı 7'ye böldüğünde kalan 0 ile 6 arasında olur. Cevabın bu aralığın dışına çıkıyorsa bir yerde hata yaptın demektir.
:::

## 1. Bölme algoritması

$a$ sayısı $b$ sayısına bölündüğünde bölüm $q$, kalan $r$ ise

$$a = b \cdot q + r \qquad 0 \leq r < b$$

yazılır. Burada $b$ bölen, $q$ bölüm, $r$ kalandır.

**Örnek.** Bir sayının 7'ye bölümünden bölüm 12, kalan 5 ise sayı $7 \cdot 12 + 5 = 89$ olur.

Üç temel sonuç:

- $r = 0$ ise $a$, $b$'ye **tam bölünür**, yani $b$, $a$'nın bir çarpanıdır.
- Bir sayının 5'e bölümünden kalan 3 ise sayı $5k + 3$ biçimindedir. Böyle sayılar 3, 8, 13, 18, ... diye gider.
- Sayıya $(b - r)$ eklenirse $b$'ye tam bölünür. Örneğin 5'e bölümünden kalan 3 olan bir sayıya 2 eklenirse 5'in katı olur. Bu fikir "kalan eksik tamamlama" sorularının anahtarıdır.

## 2. Bölünebilme kuralları

Bir sayıyı bölmeden, **hangi sayılara tam bölündüğünü** anlamanın yolları vardır.

| Bölen | Kural | Örnek |
| --- | --- | --- |
| 2 | Birler basamağı çift | 7436 |
| 3 | Rakamların toplamı 3'ün katı | 4251 ($4+2+5+1=12$) |
| 4 | Son iki basamak 4'ün katı | 2024 (24, 4'ün katı) |
| 5 | Birler basamağı 0 ya da 5 | 3475 |
| 6 | Hem 2'ye hem 3'e bölünür | 1254 |
| 8 | Son üç basamak 8'in katı | 7016 (016, 8'in katı) |
| 9 | Rakamların toplamı 9'un katı | 4563 ($4+5+6+3=18$) |
| 10 | Birler basamağı 0 | 5230 |
| 11 | Sağdan başlayarak rakamlar sırayla $+$ ve $-$ işaretiyle toplanır, sonuç 11'in katı (0 da olur) | 918082 |

11 kuralını bir örnekle gösterelim. 918082 sayısında sağdan sola: $2 - 8 + 0 - 8 + 1 - 9 = -22$. $-22$, 11'in katı olduğundan sayı 11'e bölünür.

**Birleşik kurallar.** 6, 12, 15, 18, 24 gibi bileşik sayıların kuralı, **aralarında asal** çarpanlarına ayrılarak bulunur. 12'ye bölünmek için hem 3'e hem 4'e bölünmek gerekir. 6'ya bölünmek için hem 2'ye hem 3'e. Ama 12'ye bölünmek için "2'ye ve 6'ya bölünmek" yeterli değildir, çünkü 2 ile 6 aralarında asal değildir.

### Rakam bulma soruları

**Örnek.** $\overline{5a8b}$ dört basamaklı sayısı 45'e bölünebiliyorsa $a + b$ en çok kaç olabilir?

45 = 5 · 9 ve 5 ile 9 aralarında asaldır. Sayı hem 5'e hem 9'a bölünmelidir.

- 5'e bölünmek için $b = 0$ ya da $b = 5$.
- 9'a bölünmek için $5 + a + 8 + b = 13 + a + b$ toplamı 9'un katı olmalı. Yani $a + b$, $9k - 13$ biçiminde olmalı. Rakamlar için $a + b \leq 18$ olduğundan $a + b = 5$ ya da $a + b = 14$ olabilir.
- $b = 0$ ise $a = 5$. $b = 5$ ise $a = 0$ ya da $a = 9$.

Üç çözüm vardır: 5580, 5085, 5985. $a + b$ en çok $9 + 5 = 14$ olur.

## 3. Kalanlarla işlem

Kalanlarla ilgili üç kural çok kullanılır.

**Toplama.** İki sayının toplamının kalanı, kalanların toplamının kalanıdır.

**Çarpma.** İki sayının çarpımının kalanı, kalanların çarpımının kalanıdır.

**Üs.** Bir sayının üssünün kalanı, kalanın üssünün kalanıdır.

**Örnek.** 47 ile 53'ün çarpımının 10'a bölümünden kalanı bulalım. 47'nin kalanı 7, 53'ün kalanı 3 olduğundan $7 \cdot 3 = 21$ ve 21'in 10'a bölümünden kalan 1'dir. Gerçekten de $47 \cdot 53 = 2491$ ve son rakamı 1'dir.

**Örnek.** Bir $x$ sayısının 7'ye bölümünden kalan 4 ise $x^2 + 2x$ sayısının 7'ye bölümünden kalanı bulalım.

- $x^2$ için kalan: $4^2 = 16$ ve 16'nın 7'ye bölümünden kalan 2.
- $2x$ için kalan: $2 \cdot 4 = 8$ ve 8'in 7'ye bölümünden kalan 1.
- Toplam kalan: $2 + 1 = 3$.

:::baglanti
Kalan kuralı, bir bölme işlemini **küçük bir sayıya indirgemek** demektir. Büyük sayıyla uğraşmak yerine her adımda kalanı alıp sadeleştirirsin. Bu, TYT'de "kaç gün sonra hangi gün" tarzı sorularda da aynen kullanılır, çünkü haftanın günleri 7'lik bir kalan döngüsüdür.
:::

## 4. İki kalan koşulu birlikte

**Örnek.** Bir $x$ sayısının 6'ya bölümünden kalan 4, 8'e bölümünden kalan 6 ise $x$'in 24'e bölümünden kalanı bulalım.

Kalanlar bölenlerden **2 eksik** ($6 - 4 = 2$ ve $8 - 6 = 2$). Yani $x + 2$ hem 6'ya hem 8'e tam bölünür. $x + 2$, 6 ve 8'in ortak katı olmalıdır. EKOK(6, 8) = 24 olduğundan $x + 2 = 24k$ ve $x = 24k - 2$ olur. 24'e bölümünden kalan $24 - 2 = 22$'dir.

Bu koşulları sağlayan en küçük üç basamaklı sayı $24k - 2 \geq 100$ eşitsizliğinden $k = 5$ için $118$ olur. Kontrol: $118 = 6 \cdot 19 + 4$ ve $118 = 8 \cdot 14 + 6$.

:::ipucu{baslik="Sık yapılan hata"}
İki kalan koşulu varken yalnızca birinin kalanıyla ilerlemek yanlış sonuç verir. Her iki koşulu da **aynı anda** kontrol et. Kalanların bölenden aynı miktar eksik olduğunu fark etmek işi tek adımda çözer.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Bölme | $a = b \cdot q + r$ ve $0 \leq r < b$ |
| 3 ve 9 | Rakamlar toplamına bak |
| 4 ve 8 | Son iki ve son üç basamağa bak |
| 11 | Rakamları sırayla $+$ ve $-$ ile topla |
| Birleşik bölenler | Aralarında asal çarpanlara ayır |
| Kalanlarla işlem | Önce kalanları al, sonra işlemi yap |
| Eksik tamamlama | Kalanlar bölenden aynı kadar eksikse EKOK ile çöz |

## Mini test

:::soru{cevap="C"}
Bir doğal sayının 7'ye bölümünden bölüm 12, kalan 5 olduğuna göre bu sayı kaçtır?

- A) 84
- B) 88
- C) 89
- D) 90
- E) 91

---

1. Bölme işleminde $a = b \cdot q + r$ yazılır.
2. $a = 7 \cdot 12 + 5 = 84 + 5 = 89$ bulunur. Doğru cevap C.

Diğer şıklar: **84** kalan eklenmemiş / **88** bir eksik sayılmış / **90** bir fazla sayılmış / **91** kalan yerine bölen eklenmiş.
:::

:::soru{cevap="A"}
Dört basamaklı $\overline{5a8b}$ sayısı 45\'e tam bölünebildiğine göre $a + b$ toplamı en çok kaç olabilir?

- A) 14
- B) 15
- C) 16
- D) 18
- E) 19

---

1. $45 = 5 \cdot 9$ ve 5 ile 9 aralarında asaldır. Sayı hem 5'e hem 9'a bölünmelidir.
2. 5'e bölünmek için $b = 0$ ya da $b = 5$ olmalıdır.
3. 9'a bölünmek için $5 + a + 8 + b = 13 + a + b$ toplamı 9'un katı olmalıdır. Bu da $a + b = 5$ ya da $a + b = 14$ demektir.
4. $b = 5$ için $a = 9$ olduğunda sayı 5985 olur ve $5985 = 45 \cdot 133$ yazılabilir. En büyük toplam $9 + 5 = 14$ tür. Doğru cevap A.

Diğer şıklar: **15** bir fazla sayılmış / **16** $a = 9$ ve $b = 7$ alınmış / **18** $a$ ve $b$ en büyük rakam alınmış / **19** rakam sınırı unutulmuş.
:::

:::soru{cevap="A"}
Bir $x$ doğal sayısının 6'ya bölümünden kalan 4, 8'e bölümünden kalan 6 olduğuna göre bu koşulları sağlayan en küçük üç basamaklı $x$ sayısı kaçtır?

- A) 118
- B) 119
- C) 130
- D) 142
- E) 166

---

1. Kalanlar bölenlerden 2 eksiktir: $6 - 4 = 2$ ve $8 - 6 = 2$. Bu yüzden $x + 2$ hem 6'ya hem 8'e tam bölünür.
2. EKOK(6, 8) = 24 olduğundan $x + 2 = 24k$ ve $x = 24k - 2$ olur.
3. $x \geq 100$ için en küçük $k = 5$ ve $x = 118$ bulunur. Kontrol: $118 = 6 \cdot 19 + 4$ ve $118 = 8 \cdot 14 + 6$. Doğru cevap A.

Diğer şıklar: **119** bir fazla sayılmış / **130** yalnızca 6 koşulu sağlanmış / **142** bir sonraki çözüm bulunmuş / **166** iki sonraki çözüm bulunmuş.
:::

:::soru{cevap="B"}
Bir $x$ doğal sayısının 7'ye bölümünden kalan 4 olduğuna göre $x^2 + 2x$ sayısının 7'ye bölümünden kalan kaçtır?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. $x^2$ için: $4^2 = 16$ ve 16'nın 7'ye bölümünden kalan 2.
2. $2x$ için: $2 \cdot 4 = 8$ ve 8'in 7'ye bölümünden kalan 1.
3. Toplamın kalanı $2 + 1 = 3$ olur. Doğru cevap B.

Diğer şıklar: **2** yalnızca $x^2$ için kalan alınmış / **4** $x$ in kalanı alınmış / **5** $x^2$ yerine $x$ in kalanı toplanmış / **6** $x + 2$ nin kalanı alınmış.
:::

## Kendini dene

:::dene
1. Bir sayının 9'a bölümünden kalan 4 ise sayıya kaç eklenirse 9'a tam bölünür? => $9 - 4 = 5$ eklenir.
2. $\overline{3a4}$ sayısı 3'e bölünüyorsa $a$ yerine yazılabilecek rakamlar hangileridir? => $3 + a + 4 = 7 + a$ 3'ün katı olmalı. $a = 2, 5, 8$ olur.
3. 123456 sayısının 9'a bölümünden kalan kaçtır? => Rakamlar toplamı $1+2+3+4+5+6 = 21$ ve 21'in 9'a bölümünden kalan 3'tür.
4. Bir sayının 5'e bölümünden kalan 3, 4'e bölümünden kalan 3 ise 20'ye bölümünden kalan kaçtır? => Kalanlar aynı (3) olduğundan $x - 3$ hem 5'e hem 4'e bölünür. $x - 3 = 20k$ ve kalan 3'tür.
5. Bugün salı ise 100 gün sonra hangi gündür? => $100 = 7 \cdot 14 + 2$ olduğundan kalan 2'dir. Salıdan 2 gün sonra **perşembe** olur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-mat' and name = 'Bölme ve Bölünebilme'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Bölme algoritması, bölünebilme kuralları (2-11), rakam bulma, kalanlarla işlem, iki kalan koşulu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) 11 ile bölünebilme kuralının alternatif toplam anlatımı, (b) Tablodaki "4,563" örneği yerine daha sade bir örnek düşünülebilir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Bölme ve Bölünebilme'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir odaya artık kalmadan en büyük karelerle döşeme yapmak ya da iki otobüsün aynı anda yeniden ne zaman kalkacağını bulmak, ilk bakışta farklı sorular gibi görünür. İkisi de aynı iki araçla çözülür: **EBOB** ve **EKOK**. Bu konuda iki aracı da, aralarındaki ilişkiyi ve hangi problemde hangisini seçeceğini öğreneceksin.

:::hedefler
1. Sayıları asal çarpanlarına ayırarak EBOB ve EKOK bulmak.
2. $\text{EBOB} \cdot \text{EKOK} = $ sayıların çarpımı ilişkisini kullanmak.
3. Aralarında asal sayıların EBOB ve EKOK değerini söylemek.
4. Bölme (paylaştırma) ve periyodik (tekrar eden) problemlerde doğru aracı seçmek.
5. Kalan koşulu içeren EKOK problemlerini çözmek.
:::

:::ipucu
Problemi okurken iki soru sor. **"Bir şeyi eşit parçalara mı ayırıyorum?"** ise EBOB. **"Bir olay yeniden aynı anda mı oluyor?"** ise EKOK. Bu iki cümle, soruların çoğunun yönünü tek başına belirler.
:::

## 1. Asal çarpanlara ayırma

Her bileşik sayı asal sayıların çarpımı olarak yazılabilir. Bunu bölerek yaparsın.

$$36 = 2^2 \cdot 3^2 \qquad 60 = 2^2 \cdot 3 \cdot 5 \qquad 72 = 2^3 \cdot 3^2$$

Bölünebilme kurallarını bildiğin için hangi asal sayıya bölüneceğini hızlı seçersin. 60'ı ele alalım: 60'ın yarısı 30, 30'un yarısı 15, 15 = $3 \cdot 5$. Çarpanlar 2, 2, 3, 5 olur.

## 2. EBOB: en büyük ortak bölen

İki ya da daha fazla sayıyı **aynı anda tam bölen en büyük sayıya** EBOB denir.

**Yol:** Sayıları asal çarpanlarına ayır. Ortak olan asal çarpanları **en küçük üsleriyle** çarp.

**Örnek.** 36 ve 60'ın EBOB'u: Ortak çarpanlar 2 ve 3. En küçük üsler $2^2$ ve $3^1$. Sonuç $2^2 \cdot 3 = 12$.

## 3. EKOK: en küçük ortak kat

İki ya da daha fazla sayının **ortak katlarının en küçüğüne** EKOK denir.

**Yol:** Sayıları asal çarpanlarına ayır. **Bütün** asal çarpanları **en büyük üsleriyle** çarp.

**Örnek.** 36 ve 60'ın EKOK'u: Çarpanlar 2, 3, 5. En büyük üsler $2^2$, $3^2$, $5^1$. Sonuç $4 \cdot 9 \cdot 5 = 180$.

| | EBOB | EKOK |
| --- | --- | --- |
| Hangi çarpanlar | Yalnızca ortak olanlar | Hepsi |
| Hangi üs | En küçük | En büyük |
| Büyüklük | Sayılardan büyük olamaz | Sayılardan küçük olamaz |

## 4. EBOB ve EKOK arasındaki ilişki

**İki sayı için** şu eşitlik her zaman doğrudur:

$$a \cdot b = \text{EBOB}(a, b) \cdot \text{EKOK}(a, b)$$

Örneğin $48 \cdot 72 = 3456$ ve EBOB $= 24$, EKOK $= 144$ olduğundan $24 \cdot 144 = 3456$. Bu ilişki sayıların biri bilinmediğinde çok işe yarar. Bu eşitlik **yalnızca iki sayı** için geçerlidir. Üç sayıda kullanma.

:::baglanti
$a = \text{EBOB} \cdot x$ ve $b = \text{EBOB} \cdot y$ yazabilirsin. Burada $x$ ve $y$ **aralarında asaldır**. Bu yazım, EBOB ve EKOK değeri verilen sayı çiftlerini bulmanın standart yoludur. EKOK da $\text{EBOB} \cdot x \cdot y$ olur.
:::

### Aralarında asal sayılar

EBOB'u 1 olan iki sayıya **aralarında asal** denir. Aralarında asal iki sayının EKOK'u çarpımlarına eşittir: EBOB(8, 15) = 1 ve EKOK(8, 15) = 120. İki ardışık doğal sayı her zaman aralarında asaldır. Aralarında asal sayıların kendilerinin asal olması gerekmez. 8 asal değildir ama 15 ile aralarında asaldır.

## 5. EBOB problemleri: eşit bölme

Bir bütünü artık kalmadan, **eşit ve en büyük** parçalara ayırma sorularında EBOB kullanılır.

![30 cm ile 18 cm'lik dikdörtgen, 6 cm'lik 15 kare ile kaplanmış. 6, 18 ile 30'un EBOB'udur](/lessons/tyt-mat/ebob-karo.svg "Dikdörtgeni en büyük kare karolarla kaplamak | Yolumnet")

**Örnek.** 210 cm $\times$ 330 cm boyutlarındaki dikdörtgen bir zemin, artık kalmadan eş kare karolarla döşenecek. Karolar en büyük boyutta ise kaç karo gerekir?

Karonun kenarı hem 210'u hem 330'u bölmeli ve en büyük olmalı. EBOB(210, 330) = 30. Kenar 30 cm olur. Karo sayısı $\dfrac{210}{30} \cdot \dfrac{330}{30} = 7 \cdot 11 = 77$.

**Örnek.** 40 kalem, 56 silgi ve 72 defter, hiçbiri artmayacak biçimde ve her öğrenciye üç üründen de eşit sayıda düşecek şekilde dağıtılacak. En fazla kaç öğrenciye dağıtılır? EBOB(40, 56, 72) = 8 olduğundan 8 öğrenciye.

## 6. EKOK problemleri: tekrar eden olaylar

Birden fazla olay belirli aralıklarla tekrar ediyor ve **yeniden aynı anda** gerçekleşmesi soruluyorsa EKOK kullanılır.

**Örnek.** Bir durakta üç otobüs sırasıyla 12, 15 ve 20 dakikada bir kalkıyor. Saat 08.00'de birlikte kalktıklarına göre tekrar ne zaman birlikte kalkarlar? EKOK(12, 15, 20) = 60 dakika. Saat 09.00'da.

**Örnek.** Saat 08.00'de birlikte kalkan iki otobüs 14 ve 21 dakikada bir kalkıyor. 08.00'den sonra 12.00'ye kadar (12.00 dahil) kaç kez birlikte kalkarlar? EKOK(14, 21) = 42 dakika. 08.00 ile 12.00 arası $4 \cdot 60 = 240$ dakikadır. $\dfrac{240}{42} \approx 5{,}7$ ve tam kısım 5'tir. Demek ki 5 kez birlikte kalkarlar.

Bölme sonucunun **tam kısmı** alınır, yuvarlama yapılmaz. 5,7 kez diye bir şey olmaz, 6. buluşma 12.00'den sonradır.

### Kalan koşullu EKOK

Bir sayı 4, 6 ve 9'a bölündüğünde hep **aynı kalan** (örneğin 3) kalıyorsa sayı $\text{EKOK}(4, 6, 9) \cdot k + 3 = 36k + 3$ biçimindedir. En küçük $k = 0$ için 3 olur. 3'ten büyük en küçük sayı 39'dur. Kontrol: $39 = 4 \cdot 9 + 3$, $39 = 6 \cdot 6 + 3$, $39 = 9 \cdot 4 + 3$.

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| EBOB | Ortak asal çarpanlar, en küçük üs |
| EKOK | Tüm asal çarpanlar, en büyük üs |
| İlişki | $a \cdot b = \text{EBOB} \cdot \text{EKOK}$ (iki sayı) |
| Eşit paylaştırma, kare, karo | EBOB |
| Birlikte yeniden, kaç dakika sonra | EKOK |
| Aynı kalan $r$ | $\text{EKOK} \cdot k + r$ |
| Aralarında asal | EBOB = 1 |

## Mini test

:::soru{cevap="D"}
36 ve 60 sayılarının EBOB'u ile EKOK'unun toplamı kaçtır?

- A) 102
- B) 186
- C) 191
- D) 192
- E) 193

---

1. $36 = 2^2 \cdot 3^2$ ve $60 = 2^2 \cdot 3 \cdot 5$.
2. EBOB $= 2^2 \cdot 3 = 12$ ve EKOK $= 2^2 \cdot 3^2 \cdot 5 = 180$.
3. Toplam $12 + 180 = 192$ olur. Doğru cevap D.

Diğer şıklar: **102** EKOK 90 bulunmuş / **186** EBOB 6 bulunmuş / **191** bir eksik sayılmış / **193** bir fazla sayılmış.
:::

:::soru{cevap="A"}
210 cm $\times$ 330 cm boyutlarındaki dikdörtgen bir zemin, artık kalmayacak biçimde eş ve mümkün olan en büyük kare karolarla döşenecektir. Buna göre kaç karo gerekir?

- A) 77
- B) 78
- C) 308
- D) 693
- E) 2310

---

1. Karonun kenarı hem 210'u hem 330'u bölmeli ve en büyük olmalıdır. EBOB(210, 330) = 30.
2. Bir kenara $\dfrac{210}{30} = 7$, diğer kenara $\dfrac{330}{30} = 11$ karo sığar.
3. Toplam $7 \cdot 11 = 77$ karo gerekir. Doğru cevap A.

Diğer şıklar: **78** bir fazla sayılmış / **308** kenar 15 cm alınmış / **693** kenar 10 cm alınmış / **2310** EKOK alınmış.
:::

:::soru{cevap="E"}
Saat 08.00'de bir duraktan birlikte kalkan iki otobüsten biri 14 dakikada bir, diğeri 21 dakikada bir kalkmaktadır. Bu iki otobüs 08.00'den sonra saat 12.00'ye kadar (12.00 dahil) bu duraktan kaç kez birlikte kalkar?

- A) 1
- B) 2
- C) 3
- D) 4
- E) 5

---

1. 14 ve 21'in EKOK'u 42'dir. Otobüsler her 42 dakikada bir birlikte kalkar.
2. 08.00 ile 12.00 arası 240 dakikadır. $240 \div 42 \approx 5{,}7$ olduğundan tam kısım 5'tir.
3. Birlikte kalkış sayısı 5'tir. Doğru cevap E.

Diğer şıklar: **1** dört eksik sayılmış / **2** EKOK 84 bulunmuş / **3** iki eksik sayılmış / **4** bir buluşma eksik sayılmış.
:::

:::soru{cevap="B"}
$x$ ve $y$ pozitif tam sayılar olmak üzere EBOB$(x, y) = 6$ ve EKOK$(x, y) = 180$ olduğuna göre $x + y$ toplamı en az kaçtır?

- A) 65
- B) 66
- C) 67
- D) 78
- E) 102

---

1. $x = 6a$ ve $y = 6b$ yazılır. $a$ ve $b$ aralarında asaldır.
2. EKOK $= 6ab = 180$ olduğundan $ab = 30$.
3. Aralarında asal çarpanlar: $(1, 30), (2, 15), (3, 10), (5, 6)$. Toplamlar $a + b = 31, 17, 13, 11$.
4. En küçüğü $a + b = 11$ ve $x + y = 6 \cdot 11 = 66$ (sayılar 30 ve 36). Doğru cevap B.

Diğer şıklar: **65** bir eksik sayılmış / **67** bir fazla sayılmış / **78** $(18, 60)$ çifti seçilmiş / **102** $(12, 90)$ çifti seçilmiş.
:::

## Kendini dene

:::dene
1. EBOB(84, 126) ve EKOK(84, 126) kaçtır? => $84 = 2^2 \cdot 3 \cdot 7$ ve $126 = 2 \cdot 3^2 \cdot 7$. EBOB $= 2 \cdot 3 \cdot 7 = 42$, EKOK $= 2^2 \cdot 3^2 \cdot 7 = 252$.
2. İki sayının çarpımı 540, EBOB'u 6 ise EKOK'u kaçtır? => $540 / 6 = 90$.
3. EBOB'u 1 olan iki sayının EKOK'u neye eşittir? => Çarpımlarına eşittir.
4. 18 cm ve 30 cm uzunluğundaki iki şerit, artık kalmadan eşit uzunlukta en uzun parçalara bölünecek. Her parça kaç cm olur ve toplam kaç parça çıkar? => EBOB(18, 30) = 6 cm. Parça sayısı $3 + 5 = 8$.
5. 3 ve 4 aralarında asaldır. EKOK(3, 4) kaçtır? => $3 \cdot 4 = 12$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'EBOB ve EKOK'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Asal çarpanlara ayırma, EBOB, EKOK, aralarında asal sayılar, EBOB-EKOK ilişkisi, eşit bölme ve periyodik problemler, kalan koşullu EKOK. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Üç sayı için EBOB-EKOK çarpım ilişkisinin geçerli olmadığı uyarısı, (b) Mini test 4. soru zor düzeydedir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'EBOB ve EKOK'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Pizzanın yarısı, bir saatin çeyreği, yüzde yirmi indirim: Hepsi rasyonel sayıdır. TYT'de ise bu sayıları **karşılaştırmak, sıralamak, işlem yapmak** ve ondalık yazılımla kesir arasında geçiş yapmak istenir. Konu kolay görünür ama işlem hatası çok yapıldığından soruların çoğu dikkat sorusudur.

:::hedefler
1. Kesir türlerini ve denk kesirleri tanımak.
2. Rasyonel sayıları büyüklüklerine göre sıralamak.
3. Rasyonel sayılarla dört işlemi doğru yapmak.
4. Ondalık ve devirli ondalık sayıları kesre çevirmek.
5. Oran içeren ifadelerde sabit bir değişkenle çalışmak.
:::

:::ipucu
Kesirli işlemlerde ilk iş **paydayı kontrol etmek**tir. Toplama ve çıkarmada paydalar eşit olmalı, çarpmada eşit olmasına gerek yoktur. Bölmede ise ikinci kesri ters çevirip çarparsın.
:::

## 1. Kesir türleri

$\dfrac{a}{b}$ kesrinde $a$ paydır, $b$ paydadır ve $b \neq 0$ olmalıdır.

| Tür | Anlamı | Örnek |
| --- | --- | --- |
| Basit kesir | Pay paydadan küçük | $\dfrac{3}{5}$ |
| Bileşik kesir | Pay paydadan büyük ya da eşit | $\dfrac{7}{3}$ |
| Tam sayılı kesir | Tam kısım ve basit kesir | $2\dfrac{1}{3}$ |

Tam sayılı kesir ile bileşik kesir arasında geçiş:

$$2\dfrac{1}{3} = \dfrac{2 \cdot 3 + 1}{3} = \dfrac{7}{3} \qquad \dfrac{23}{4} = 5 + \dfrac{3}{4} = 5\dfrac{3}{4}$$

## 2. Denk kesirler

Pay ve payda **aynı sayıyla** çarpılırsa ya da bölünürse kesrin değeri değişmez. Çarparsan **genişletme**, bölersen **sadeleştirme** olur.

![2/3, 4/6 ve 8/12 kesirlerinin eşit uzunlukta üç çubukta aynı kısmı boyadığı gösterilmiştir](/lessons/tyt-mat/denk-kesirler.svg "Denk kesirler | Yolumnet")

$$\dfrac{2}{3} = \dfrac{4}{6} = \dfrac{8}{12}$$

Sadeleştirmede yapılan en sık hata, toplama işareti varken **terimleri ayrı ayrı sadeleştirmektir**. $\dfrac{2a + b}{a + b}$ ifadesinde $a$ ve $b$ sadeleşmez. Yalnızca **çarpan** olan ortak ifadeler sadeleşir.

## 3. Rasyonel sayıları sıralama

İki kesri karşılaştırmanın üç yolu vardır.

**Yol 1: Paydaları eşitle.** $\dfrac{3}{4}$ ve $\dfrac{5}{7}$ için paydaları 28 yapınca $\dfrac{21}{28}$ ve $\dfrac{20}{28}$ olur. İlki büyüktür.

**Yol 2: Çapraz çarpım.** $\dfrac{a}{b}$ ve $\dfrac{c}{d}$ için ($b, d > 0$) $a \cdot d$ ile $c \cdot b$ karşılaştırılır. $\dfrac{3}{4}$ ve $\dfrac{5}{7}$ için $3 \cdot 7 = 21$ ve $5 \cdot 4 = 20$. Büyük çıkan, soldaki kesri büyük yapar.

**Yol 3: Bire tamamlama.** Payı paydadan 1 eksik olan kesirlerde (örneğin $\dfrac{3}{4}, \dfrac{4}{5}, \dfrac{5}{6}$) **paydası büyük olan daha büyüktür**, çünkü bire daha yakındır.

Pozitif kesirlerde pay eşitse paydası **büyük** olan **küçüktür**: $\dfrac{3}{5} < \dfrac{3}{4}$. Payda eşitse payı büyük olan büyüktür.

**Örnek.** $a = \dfrac{5}{8}$, $b = \dfrac{7}{12}$, $c = \dfrac{11}{18}$ sayılarını sıralayalım. Ortak payda 72: $a = \dfrac{45}{72}$, $b = \dfrac{42}{72}$, $c = \dfrac{44}{72}$. Sıralama $b < c < a$ olur.

## 4. Dört işlem

**Toplama ve çıkarma:** Paydalar eşitlenir, paylar işleme girer, payda aynen yazılır.

$$\dfrac{2}{3} + \dfrac{3}{4} - \dfrac{1}{6} = \dfrac{8}{12} + \dfrac{9}{12} - \dfrac{2}{12} = \dfrac{15}{12} = \dfrac{5}{4}$$

**Çarpma:** Paylar kendi arasında, paydalar kendi arasında çarpılır. Çapraz sadeleştirme işi kolaylaştırır.

$$\dfrac{2}{3} \cdot \dfrac{9}{4} = \dfrac{2 \cdot 9}{3 \cdot 4} = \dfrac{3}{2}$$

**Bölme:** Bölen kesir ters çevrilip çarpılır.

$$\dfrac{5}{6} \div \dfrac{10}{9} = \dfrac{5}{6} \cdot \dfrac{9}{10} = \dfrac{3}{4}$$

## 5. Ondalık sayıları kesre çevirme

**Sonlu ondalık sayılar:** Virgülden sonraki basamak sayısı kadar sıfırlı bir paydaya yazılır. $0{,}125 = \dfrac{125}{1000} = \dfrac{1}{8}$.

**Devirli ondalık sayılar:** Devreden kısım üstü çizili yazılır. Çevirme kuralı şudur:

$$\text{Pay} = (\text{tüm rakamlar}) - (\text{devretmeyen kısım})$$

$$\text{Payda} = \text{devreden basamak sayısı kadar 9, ardından devretmeyen basamak sayısı kadar 0}$$

**Örnekler.**

- $0{,}\overline{3} = \dfrac{3}{9} = \dfrac{1}{3}$
- $0{,}\overline{45} = \dfrac{45}{99} = \dfrac{5}{11}$
- $1{,}\overline{7} = \dfrac{17 - 1}{9} = \dfrac{16}{9}$
- $0{,}1\overline{6}$ sayısında devretmeyen kısım 1, tüm rakamlar 16. Pay $16 - 1 = 15$ ve payda 90. Sonuç $\dfrac{15}{90} = \dfrac{1}{6}$.

:::ipucu{baslik="Sık yapılan hata"}
$0{,}1\overline{6}$ sayısını $\dfrac{16}{90}$ ya da $\dfrac{16}{99}$ yazmak çok yapılan bir hatadır. **Pay çıkarmayla bulunur**, paydada ise önce 9'lar sonra 0'lar gelir. Küçük bir deneme yap: $0{,}1\overline{6}$ yaklaşık 0,1666 ve $\dfrac{1}{6}$ de 0,1666'dır.
:::

## 6. Oran içeren ifadelerde sabit seçmek

$\dfrac{a}{b} = \dfrac{3}{5}$ verildiğinde $a$ ile $b$'yi doğrudan bulamazsın. Ama $a = 3k$ ve $b = 5k$ yazabilirsin ($k$ sıfırdan farklı). İfadeyi $k$ ile hesaplarsın ve $k$ sadeleşir.

**Örnek.** $\dfrac{a}{b} = \dfrac{3}{5}$ ise $\dfrac{2a + b}{a + b}$ değerini bulalım.

$$\dfrac{2 \cdot 3k + 5k}{3k + 5k} = \dfrac{11k}{8k} = \dfrac{11}{8}$$

:::baglanti
Oran içeren bu yazım, "Oran ve Orantı" ve "Denklem Çözme" konularında sürekli karşına çıkacak. Bir kesri **tek bir $k$ ile iki sayıya bölmek**, çok işe yarayan bir alışkanlıktır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Denk kesir | Pay ve payda aynı sayıyla çarpılır ya da bölünür |
| Sıralama | Payda eşitle ya da çapraz çarp |
| Toplama ve çıkarma | Payda eşitle |
| Çarpma | Pay pay, payda payda |
| Bölme | Ters çevirip çarp |
| Devirli ondalık | Pay: tüm rakamlar $-$ devretmeyen, payda: 9'lar sonra 0'lar |
| $\dfrac{a}{b} = \dfrac{m}{n}$ | $a = mk$ ve $b = nk$ |

## Mini test

:::soru{cevap="A"}
$\dfrac{2}{3} + \dfrac{3}{4} - \dfrac{1}{6}$ işleminin sonucu kaçtır?

- A) $\dfrac{5}{4}$
- B) $\dfrac{4}{3}$
- C) $\dfrac{17}{12}$
- D) $\dfrac{19}{12}$
- E) $\dfrac{5}{3}$

---

1. Ortak payda 12'dir: $\dfrac{8}{12} + \dfrac{9}{12} - \dfrac{2}{12}$.
2. Paylar işleme girer: $\dfrac{8 + 9 - 2}{12} = \dfrac{15}{12}$.
3. Sadeleştirince $\dfrac{5}{4}$ bulunur. Doğru cevap A.

Diğer şıklar: **$\dfrac{4}{3}$** $\frac{1}{6}$ yerine $\frac{1}{12}$ çıkarılmış / **$\dfrac{17}{12}$** çıkarma işlemi unutulmuş / **$\dfrac{19}{12}$** çıkarma yerine toplama yapılmış / **$\dfrac{5}{3}$** payda eşitlemede hata yapılmış.
:::

:::soru{cevap="A"}
$\dfrac{a}{b} = \dfrac{3}{5}$ olduğuna göre $\dfrac{2a + b}{a + b}$ ifadesinin değeri kaçtır?

- A) $\dfrac{11}{8}$
- B) $\dfrac{13}{8}$
- C) $\dfrac{11}{5}$
- D) 3
- E) $\dfrac{11}{3}$

---

1. $\dfrac{a}{b} = \dfrac{3}{5}$ olduğundan $a = 3k$ ve $b = 5k$ yazılır.
2. $\dfrac{2 \cdot 3k + 5k}{3k + 5k} = \dfrac{11k}{8k}$.
3. $k$ sadeleşir ve sonuç $\dfrac{11}{8}$ olur. Doğru cevap A.

Diğer şıklar: **$\dfrac{13}{8}$** $a$ ile $b$ yer değiştirmiş / **$\dfrac{11}{5}$** payda yalnızca $b$ alınmış / **3** paydaki ve paydadaki terimler ayrı ayrı sadeleştirilmiş / **$\dfrac{11}{3}$** payda yalnızca $a$ alınmış.
:::

:::soru{cevap="E"}
$a = \dfrac{5}{8}$, $b = \dfrac{7}{12}$ ve $c = \dfrac{11}{18}$ olduğuna göre aşağıdaki sıralamalardan hangisi doğrudur?

- A) $a < b < c$
- B) $c < b < a$
- C) $a < c < b$
- D) $b < a < c$
- E) $b < c < a$

---

1. Ortak payda 72 alınır: $a = \dfrac{45}{72}$, $b = \dfrac{42}{72}$, $c = \dfrac{44}{72}$.
2. Paylar küçükten büyüğe $42 < 44 < 45$ sıralanır.
3. Dolayısıyla $b < c < a$ olur. Doğru cevap E.

Diğer şıklar: **$a < b < c$** yalnızca paylara bakılmış / **$c < b < a$** paydası büyük kesir küçük sanılmış / **$a < c < b$** sıralama tersten yazılmış / **$b < a < c$** iki kesrin yeri karıştırılmış.
:::

:::soru{cevap="D"}
$\dfrac{0{,}\overline{3} + 0{,}\overline{6}}{0{,}1\overline{6}}$ işleminin sonucu kaçtır?

- A) 1
- B) $\dfrac{27}{5}$
- C) $\dfrac{45}{8}$
- D) 6
- E) $\dfrac{99}{16}$

---

1. $0{,}\overline{3} = \dfrac{1}{3}$ ve $0{,}\overline{6} = \dfrac{2}{3}$ olduğundan toplam 1 olur.
2. $0{,}1\overline{6} = \dfrac{16 - 1}{90} = \dfrac{15}{90} = \dfrac{1}{6}$.
3. $\dfrac{1}{\;1/6\;} = 6$ bulunur. Doğru cevap D.

Diğer şıklar: **1** paydadaki ondalık sayı hesaba katılmamış / **$\dfrac{27}{5}$** $0{,}\overline{3} + 0{,}\overline{6}$ yerine $0{,}9$ alınmış / **$\dfrac{45}{8}$** $0{,}1\overline{6} = \frac{16}{90}$ alınmış / **$\dfrac{99}{16}$** $0{,}1\overline{6} = \frac{16}{99}$ alınmış.
:::

## Kendini dene

:::dene
1. $\dfrac{3}{7}$ ile $\dfrac{4}{9}$ kesirlerinden hangisi büyüktür? => Çapraz çarpım: $3 \cdot 9 = 27$ ve $4 \cdot 7 = 28$. İkincisi büyüktür.
2. $0{,}\overline{36}$ sayısını sadeleşmiş kesir olarak yaz. => $\dfrac{36}{99} = \dfrac{4}{11}$.
3. $\dfrac{3}{5} \div \dfrac{9}{10}$ işleminin sonucu kaçtır? => $\dfrac{3}{5} \cdot \dfrac{10}{9} = \dfrac{30}{45} = \dfrac{2}{3}$.
4. $\dfrac{a}{b} = \dfrac{2}{7}$ ise $\dfrac{a + b}{b}$ kaçtır? => $a = 2k$ ve $b = 7k$ olur. $\dfrac{9k}{7k} = \dfrac{9}{7}$.
5. $\dfrac{4}{5}, \dfrac{5}{6}, \dfrac{6}{7}$ kesirlerini küçükten büyüğe sırala. => Payı paydadan 1 eksik olan kesirlerde paydası büyük olan büyüktür. Sıra $\dfrac{4}{5} < \dfrac{5}{6} < \dfrac{6}{7}$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Rasyonel Sayılar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Kesir türleri, denk kesir, sıralama, dört işlem, ondalık ve devirli ondalık sayıların kesre çevrilmesi, oran sabiti. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Sıralama sorusunda seçenekler metinsel (sayısal olmadığından anahtar planına bağlı kalınmadı), (b) Devirli ondalık kuralının anlatımı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Rasyonel Sayılar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Eşitlik "bu sayı tam olarak şuna eşit" der. Eşitsizlik ise "bu sayı şu iki değer arasında bir yerde" der. Sınırlar, yaş aralıkları, kapasiteler, hız limitleri hep eşitsizliktir. TYT'de bu konu, **aralıkları doğru yazmayı**, aralıktaki tam sayıları saymayı ve iki aralığı işleme sokmayı sorar. En çok yapılan hata, negatif bir sayıyla işlem yapınca **yönü değiştirmeyi unutmaktır**.

:::hedefler
1. Eşitsizlikleri sayı doğrusunda ve aralık gösterimiyle ifade etmek.
2. Eşitsizliklerde işlem özelliklerini, özellikle negatifle çarpmayı doğru kullanmak.
3. Birinci dereceden eşitsizlikleri ve çift eşitsizlikleri çözmek.
4. Verilen aralıktaki tam sayıları saymak.
5. İki bilinmeyenin aralıklarından yeni bir ifadenin aralığını bulmak.
:::

:::ipucu
Eşitsizlik çözerken her adımdan sonra ucunu kontrol et. Sınır dahil mi değil mi? **Küçük ya da büyük** işareti sınırı dışarıda bırakır, **küçük eşit ya da büyük eşit** işareti sınırı içeri alır.
:::

## 1. Eşitsizlik, sayı doğrusu ve aralıklar

Eşitsizlik işaretleri $<$, $>$, $\leq$, $\geq$ biçimindedir. Çözüm kümesi sayı doğrusunda bir aralık olarak gösterilir.

![Sayı doğrusunda x büyüktür 3, x büyük eşit 3, x küçüktür 3 ve x küçük eşit 3 için boş ve dolu noktalarla gösterilen çözüm kümeleri](/lessons/esitsizlikler/sayi-dogrusu.svg "Açık ve kapalı uçlar | Yolumnet")

| Eşitsizlik | Aralık gösterimi | Anlamı |
| --- | --- | --- |
| $a < x < b$ | $(a, b)$ | İki uç da dışarıda |
| $a \leq x \leq b$ | $[a, b]$ | İki uç da içeride |
| $a \leq x < b$ | $[a, b)$ | Sol uç içeride, sağ uç dışarıda |
| $x > a$ | $(a, \infty)$ | $a$ dışarıda, sağa sonsuza |
| $x \leq b$ | $(-\infty, b]$ | $b$ içeride, sola sonsuza |

Parantez ucun **dışarıda**, köşeli parantez ucun **içeride** olduğunu gösterir. Sonsuz sembolünün yanına her zaman yuvarlak parantez konur.

## 2. Eşitsizliklerin temel özellikleri

Bir eşitsizliğin iki tarafına aynı işlem yapıldığında sonucun yönünü bilmen gerekir.

| İşlem | Eşitsizlik yönü |
| --- | --- |
| İki tarafa aynı sayıyı ekle ya da çıkar | Aynı kalır |
| Pozitif bir sayıyla çarp ya da böl | Aynı kalır |
| **Negatif** bir sayıyla çarp ya da böl | **Ters döner** |

**Örnek.** $-3x < 12$ eşitsizliğinde iki tarafı $-3$'e bölersen yön değişir: $x > -4$.

Küçük bir kontrol yap: $x = 0$ için $-3 \cdot 0 = 0 < 12$ doğrudur. $0 > -4$ de doğrudur. Yön yanlış olsaydı çelişirdi.

**Aynı yönlü iki eşitsizlik taraf tarafa toplanabilir.** $2 < x < 5$ ve $1 < y < 3$ ise $3 < x + y < 8$ olur. **Çıkarma yoktur.** $x - y$ için önce $y$'yi $-1$ ile çarpıp yönü çevirirsin: $-3 < -y < -1$. Sonra toplarsın: $2 - 3 < x - y < 5 - 1$ yani $-1 < x - y < 4$.

## 3. Birinci dereceden eşitsizlik

Denklem çözer gibi çöz, yalnız yön kuralına dikkat et.

**Örnek.** $5 - 2x \geq 11$ eşitsizliğini çözelim.

$$-2x \geq 6 \Rightarrow x \leq -3$$

Çözüm kümesi $(-\infty, -3]$ olur.

### Çift eşitsizlik

$a < f(x) < b$ biçimindeki eşitsizliklerde işlemleri **üç tarafa birden** uygula.

**Örnek.** $-4 < 2x - 3 \leq 9$ eşitsizliğini sağlayan kaç tam sayı vardır?

- Her tarafa 3 ekle: $-1 < 2x \leq 12$.
- Her tarafı 2'ye böl: $-\dfrac{1}{2} < x \leq 6$.
- Bu aralıktaki tam sayılar 0, 1, 2, 3, 4, 5, 6 olur. Toplam **7** tam sayı vardır.

Aralıkta kaç tam sayı olduğunu bulurken $\text{son} - \text{ilk} + 1$ hesabını yap. Burada ilk tam sayı 0, son tam sayı 6'dır ve $6 - 0 + 1 = 7$.

:::baglanti
$a < x \leq b$ gibi eşitsizliklerde **uç değer** tam sayı ise ve dahilse sayılır, dahil değilse sayılmaz. Bunu "Temel Kavramlar" konusundaki "terim sayısı" mantığıyla birleştir: ilk ve son terimi ayrı ayrı belirle, sonra say.
:::

## 4. İki aralığı birleştirme

$x$ ve $y$'nin aralığı biliniyorsa $x + y$, $x - y$ ya da $2x - y$ gibi ifadelerin aralığı bulunur.

**Örnek.** $3 < x < 8$ ve $-2 < y < 5$ ise $2x - y$ ifadesi hangi aralıktadır?

- $3 < x < 8$ için $6 < 2x < 16$.
- $-2 < y < 5$ için tarafları $-1$ ile çarp: $-5 < -y < 2$.
- Taraf tarafa topla: $6 - 5 < 2x - y < 16 + 2$ yani $1 < 2x - y < 18$.

$2x - y$'nin tam sayı değerleri 2'den 17'ye kadardır ve $17 - 2 + 1 = 16$ tanedir. Uçlar **dışarıda** olduğundan 1 ve 18 sayılmaz.

:::ipucu{baslik="Sık yapılan hata"}
$-y$ için sınırları ters çevirmeyi unutmak çok yapılan bir hatadır. $-2 < y < 5$ iken $-y$ için aralık $-5 < -y < 2$ olur. Sınırlar yer değiştirir ve işaretleri değişir.
:::

## 5. Kareler ve terslerle ilgili sorular

Karelerde tek yönlü düşünmek yanıltır.

- $x > 0$ için $x$ büyüdükçe $x^2$ büyür.
- $x < 0$ için $x$ küçüldükçe $x^2$ büyür.
- Aralık 0'ı içeriyorsa $x^2$'nin en küçük değeri **0** olur.

**Örnek.** $-3 < x < 2$ ise $x^2$ hangi aralıktadır? $x$'in alabileceği en uzak değer $-3$ olduğundan ($x$ hiçbir zaman $-3$ olmaz) $x^2 < 9$. Aralık 0'ı içerdiğinden $x^2 \geq 0$. Sonuç $0 \leq x^2 < 9$.

**Tam sayılar.** $-3 < x \leq 4$ ise tam sayı değerleri $-2, -1, 0, 1, 2, 3, 4$. Karelerinin **farklı** değerleri 0, 1, 4, 9, 16'dır. Toplamları 30.

**Terslerde.** Pozitif sayılarda ters alınırsa yön değişir. $2 < x < 5$ ise $\dfrac{1}{5} < \dfrac{1}{x} < \dfrac{1}{2}$ olur. Aralıktaki sayıların hepsi aynı işaretliyse bu kural geçerlidir.

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $<, >$ | Uç dışarıda, yuvarlak parantez |
| $\leq, \geq$ | Uç içeride, köşeli parantez |
| Negatifle çarpma ya da bölme | Yön değişir |
| İki eşitsizliği toplama | Yönler aynıysa taraf tarafa topla |
| Çıkarma | Önce $-1$ ile çarp, sonra topla |
| Kare | Aralıkta 0 varsa en küçük değer 0 |
| Pozitif sayılarda ters | Yön değişir |
| Tam sayı sayısı | $\text{son} - \text{ilk} + 1$ |

## Mini test

:::soru{cevap="E"}
$-4 < 2x - 3 \leq 9$ eşitsizliğini sağlayan kaç tam sayı $x$ değeri vardır?

- A) 3
- B) 4
- C) 5
- D) 6
- E) 7

---

1. Her tarafa 3 eklenir: $-1 < 2x \leq 12$.
2. Her taraf 2'ye bölünür: $-\dfrac{1}{2} < x \leq 6$.
3. Tam sayılar 0, 1, 2, 3, 4, 5, 6'dır. Toplam 7 tane olur. Doğru cevap E.

Diğer şıklar: **3** yarısı alınmış / **4** üç eksik sayılmış / **5** sınırlar yanlış çevrilmiş / **6** 0 tam sayısı sayılmamış.
:::

:::soru{cevap="C"}
$3 < x < 8$ ve $-2 < y < 5$ olduğuna göre $2x - y$ ifadesinin alabileceği tam sayı değerlerinin sayısı kaçtır?

- A) 14
- B) 15
- C) 16
- D) 17
- E) 18

---

1. $3 < x < 8$ için $6 < 2x < 16$.
2. $-2 < y < 5$ için $-5 < -y < 2$.
3. Taraf tarafa toplanır: $1 < 2x - y < 18$.
4. Uçlar dışarıda olduğundan tam sayılar 2'den 17'ye kadardır. $17 - 2 + 1 = 16$ tane. Doğru cevap C.

Diğer şıklar: **14** iki eksik sayılmış / **15** bir değer eksik sayılmış / **17** alt uç da sayılmış / **18** iki uç da sayılmış.
:::

:::soru{cevap="A"}
$x$ bir tam sayı olmak üzere $-3 < x \leq 4$ olduğuna göre $x^2$ ifadesinin alabileceği farklı değerlerin toplamı kaçtır?

- A) 30
- B) 31
- C) 35
- D) 44
- E) 60

---

1. Tam sayılar $-2, -1, 0, 1, 2, 3, 4$ olur.
2. Kareleri $4, 1, 0, 1, 4, 9, 16$ olur.
3. Farklı değerler $0, 1, 4, 9, 16$ ve toplamları $30$. Doğru cevap A.

Diğer şıklar: **31** bir fazla sayılmış / **35** aynı değerler tekrar toplanmış / **44** $-3$ de alınmış ve tekrarlar toplanmış / **60** iki katı alınmış.
:::

:::soru{cevap="C"}
$2 < x < 5$ olduğuna göre $\dfrac{1}{x}$ ifadesi aşağıdakilerden hangisinin aralığındadır?

- A) $\dfrac{1}{2} < \dfrac{1}{x} < \dfrac{1}{5}$
- B) $2 < \dfrac{1}{x} < 5$
- C) $\dfrac{1}{5} < \dfrac{1}{x} < \dfrac{1}{2}$
- D) $\dfrac{1}{5} \leq \dfrac{1}{x} \leq \dfrac{1}{2}$
- E) $-5 < \dfrac{1}{x} < -2$

---

1. $x$ pozitif olduğundan ters alınınca eşitsizlik yönü değişir.
2. $2 < x < 5$ için $\dfrac{1}{5} < \dfrac{1}{x} < \dfrac{1}{2}$ olur. Uçlar dışarıdadır.
3. Doğru cevap C.

Diğer şıklar: **$\dfrac{1}{2} < \dfrac{1}{x} < \dfrac{1}{5}$** sınırların sırası değiştirilmemiş / **$2 < \dfrac{1}{x} < 5$** $x$ ile $\dfrac{1}{x}$ aynı aralıkta sanılmış / **$\dfrac{1}{5} \leq \dfrac{1}{x} \leq \dfrac{1}{2}$** uçlar dahil edilmiş / **$-5 < \dfrac{1}{x} < -2$** işaret hatası yapılmış.
:::

## Kendini dene

:::dene
1. $3x - 5 < 7$ eşitsizliğinin çözüm kümesini yaz. => $3x < 12$ ve $x < 4$. Çözüm kümesi $(-\infty, 4)$.
2. $-2x \leq 8$ eşitsizliğini çöz. => $-2$'ye bölünce yön değişir: $x \geq -4$.
3. $-5 < x \leq 3$ eşitsizliğini sağlayan kaç tam sayı vardır? => $-4, -3, \ldots, 3$ olduğundan $3 - (-4) + 1 = 8$ tam sayı.
4. $1 < x < 4$ ve $2 < y < 6$ ise $x + y$ hangi aralıktadır? => $3 < x + y < 10$.
5. $x$ tam sayı ve $-2 \leq x < 5$ ise $x^2$ en çok kaç olabilir? => Tam sayılar $-2, -1, 0, 1, 2, 3, 4$. En büyük kare $4^2 = 16$ olur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Basit Eşitsizlikler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Eşitsizlik gösterimleri, temel özellikler, birinci dereceden ve çift eşitsizlik, iki aralığın birleştirilmesi, kare ve ters. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı. Görsel olarak LGS eşitsizlik şeması yeniden kullanıldı.
Kontrol edilecekler: (a) Kendini dene 5. soru yorum gerektirir, (b) Mini test 4. soru seçenekleri metinsel olduğundan anahtar planına bağlı değildir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Basit Eşitsizlikler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Mutlak değer, bir sayının işaretini boş vermen demektir. Ama TYT'de asıl önemli olan, mutlak değeri **uzaklık** olarak görmektir. $|x - 3|$ ifadesi "$x$ ile 3 arasındaki mesafe" demektir. Bu bakışla denklem ve eşitsizlikler sayı doğrusunda çizilince çözülür. Bu konuda tanımı, özellikleri, mutlak değerli denklem ve eşitsizlikleri ve iki mutlak değerin toplamıyla ilgili en küçük değer sorularını öğreneceksin.

:::hedefler
1. Mutlak değerin tanımını ve uzaklık anlamını kullanmak.
2. Mutlak değerin temel özelliklerini uygulamak.
3. $|x - a| = b$ biçimindeki denklemleri sayı doğrusunda çözmek.
4. $|x| < a$ ve $|x| > a$ eşitsizliklerini yazıp çözmek.
5. $|x - a| + |x - b|$ ifadesinin en küçük değerini bulmak.
:::

:::ipucu
Mutlak değerli bir soruyu görünce önce şunu sor: **"Burada hangi iki nokta arasındaki uzaklık soruluyor?"** Çoğu soruyu bu cümleyle sayı doğrusunda çizerek çözersin ve işaret karmaşasına girmezsin.
:::

## 1. Tanım

Bir $x$ sayısının mutlak değeri, $x$'in sayı doğrusunda **0'a olan uzaklığıdır**. Uzaklık negatif olamaz.

$$|x| = \begin{cases} x & x \geq 0 \text{ ise} \\ -x & x < 0 \text{ ise} \end{cases}$$

Örneğin $|7| = 7$ ve $|-7| = 7$. Eksi işareti $x$ **negatifken** sayıyı pozitif yapar. Yani $|x| = -x$ yazıldığında $-x$ pozitif bir sayıdır.

İki sayı arasındaki uzaklık ise mutlak değerle yazılır: $|a - b|$, $a$ ile $b$ arasındaki uzaklıktır. Örneğin $|3 - 8| = 5$.

## 2. Mutlak değerin özellikleri

| Özellik | Örnek |
| --- | --- |
| $\lvert x \rvert \geq 0$ | $\lvert -4 \rvert = 4$ |
| $\lvert -x \rvert = \lvert x \rvert$ | $\lvert -9 \rvert = \lvert 9 \rvert$ |
| $\lvert a \cdot b \rvert = \lvert a \rvert \cdot \lvert b \rvert$ | $\lvert -2 \cdot 6 \rvert = 2 \cdot 6 = 12$ |
| $\left\lvert \dfrac{a}{b} \right\rvert = \dfrac{\lvert a \rvert}{\lvert b \rvert}$ | $\left\lvert \dfrac{-3}{4} \right\rvert = \dfrac{3}{4}$ |
| $\lvert a + b \rvert \leq \lvert a \rvert + \lvert b \rvert$ | $\lvert -3 + 5 \rvert = 2 \leq 8$ |
| $\lvert x \rvert^2 = x^2$ | $\lvert -5 \rvert^2 = 25$ |

Mutlak değer toplama ve çıkarmaya **dağılmaz**. $|a + b|$ ile $|a| + |b|$ aynı değildir. Aynı işaretli sayılarda eşit, farklı işaretli sayılarda $|a + b|$ daha küçüktür.

## 3. Mutlak değerli denklemler

### $|x| = a$ ve $|x - a| = b$

- $|x| = a$ ve $a > 0$ ise $x = a$ ya da $x = -a$. İki çözüm vardır.
- $|x| = 0$ ise $x = 0$.
- $|x| = a$ ve $a < 0$ ise çözüm yoktur, çünkü uzaklık negatif olamaz.

$|x - 3| = 5$ denklemi şu demektir: $x$'in 3'e uzaklığı 5. Sayı doğrusunda 3'ün 5 sağı ve 5 solu: $x = 8$ ya da $x = -2$.

![Sayı doğrusunda 3 noktası merkez alınmış, 3'ün 5 birim solu eksi 2, 5 birim sağı 8 noktası](/lessons/tyt-mat/mutlak-deger-uzaklik.svg "|x - 3| = 5 uzaklık olarak | Yolumnet")

Çözüm kümesinin eleman toplamı $8 + (-2) = 6$ yani iki çözümün ortası (3) çarpı 2.

### $|f(x)| = |g(x)|$

İki mutlak değerin eşit olması için iç ifadeler **ya eşit ya da birbirinin negatifidir**: $f(x) = g(x)$ ya da $f(x) = -g(x)$.

**Örnek.** $|x + 4| = |2x - 1|$ denklemini çözelim.

- $x + 4 = 2x - 1$ ise $x = 5$.
- $x + 4 = -(2x - 1) = -2x + 1$ ise $3x = -3$ ve $x = -1$.

Dikkat: Denklemi gerçekten çözerek bulduğun iki değerin ikisini de denemelisin. $x = 5$ için $|9| = |9|$. $x = -1$ için $|3| = |-3|$ doğru. İki çözüm de geçerlidir. Kümeler $\{-1, 5\}$ olur.

## 4. Mutlak değerli eşitsizlikler

$a > 0$ olmak üzere:

| Eşitsizlik | Çözüm | Sayı doğrusunda |
| --- | --- | --- |
| $\lvert x \rvert < a$ | $-a < x < a$ | 0'a uzaklığı $a$'dan küçük, **tek aralık** |
| $\lvert x \rvert > a$ | $x < -a$ ya da $x > a$ | 0'a uzaklığı $a$'dan büyük, **iki ayrı parça** |
| $\lvert x \rvert \leq a$ | $-a \leq x \leq a$ | uçlar dahil |

**Örnek.** $|2x - 5| \leq 9$ eşitsizliğini sağlayan kaç tam sayı vardır?

$-9 \leq 2x - 5 \leq 9$ olur. Her tarafa 5 ekle: $-4 \leq 2x \leq 14$. 2'ye böl: $-2 \leq x \leq 7$. Tam sayılar $-2, -1, \ldots, 7$ ve $7 - (-2) + 1 = 10$ tanedir.

:::ipucu{baslik="Sık yapılan hata"}
$|x| > 3$ eşitsizliğini $-3 < x < 3$ yazmak çok yapılan bir hatadır. **Küçüktür** ise ara değerler, **büyüktür** ise dış değerler çözümdür. $|x| > 3$ için $x < -3$ ya da $x > 3$ olur.
:::

## 5. İki mutlak değerin toplamı

$|x - a| + |x - b|$ ifadesi, $x$'in $a$ ve $b$ noktalarına uzaklıkları toplamıdır. $x$ bu iki noktanın **arasında** olduğunda toplam sabittir ve $|a - b|$'ye eşittir. Dışarıda olduğunda daha büyüktür.

**Örnek.** $|x - 2| + |x - 7|$ ifadesi $x = 4$ için $2 + 3 = 5$, $x = 6$ için $4 + 1 = 5$ olur. Ama $x = 0$ için $2 + 7 = 9$.

- **En küçük değer** $|2 - 7| = 5$ olur.
- Bu değeri veren $x$ değerleri $2 \leq x \leq 7$ aralığındadır. Tam sayı olarak 2, 3, 4, 5, 6, 7 yani **6 tane**.

:::baglanti
$|x - a| + |x - b|$ ifadesinin grafiği iki noktanın arasında yatay bir çizgi olur. Bu fikir, sonraki konularda "en az maliyet" ya da "iki nokta arasındaki toplam mesafe" gibi soruların arkasında da vardır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $\lvert x \rvert$ | 0'a uzaklık |
| $\lvert a - b \rvert$ | $a$ ile $b$ arası uzaklık |
| $\lvert x \rvert = a$ | $x = \pm a$ ($a > 0$) |
| $\lvert x \rvert < a$ | $-a < x < a$ |
| $\lvert x \rvert > a$ | $x < -a$ ya da $x > a$ |
| $\lvert f \rvert = \lvert g \rvert$ | $f = g$ ya da $f = -g$ |
| $\lvert x - a \rvert + \lvert x - b \rvert$ | En küçük değer $\lvert a - b \rvert$ |

## Mini test

:::soru{cevap="C"}
$|x - 3| = 5$ denkleminin çözüm kümesindeki elemanların toplamı kaçtır?

- A) 4
- B) 5
- C) 6
- D) 7
- E) 8

---

1. $|x - 3| = 5$ ise $x - 3 = 5$ ya da $x - 3 = -5$ olur.
2. Çözümler $x = 8$ ve $x = -2$ dir.
3. Toplam $8 + (-2) = 6$ olur. Doğru cevap C.

Diğer şıklar: **4** iki eksik sayılmış / **5** bir eksik sayılmış / **7** bir fazla sayılmış / **8** yalnızca pozitif çözüm alınmış.
:::

:::soru{cevap="B"}
$|2x - 5| \leq 9$ eşitsizliğini sağlayan kaç tane $x$ tam sayısı vardır?

- A) 9
- B) 10
- C) 11
- D) 12
- E) 14

---

1. $-9 \leq 2x - 5 \leq 9$ yazılır.
2. Her tarafa 5 eklenir: $-4 \leq 2x \leq 14$. 2'ye bölünür: $-2 \leq x \leq 7$.
3. Tam sayılar $-2, -1, \ldots, 7$ ve $7 - (-2) + 1 = 10$ tanedir. Doğru cevap B.

Diğer şıklar: **9** bir uç sayılmamış / **11** bir uç fazla sayılmış / **12** iki fazla sayılmış / **14** $2x - 5$ ile $x$ aralıkları karıştırılmış.
:::

:::soru{cevap="E"}
$|x - 2| + |x - 7| = 5$ eşitliğini sağlayan kaç tane $x$ tam sayısı vardır?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. İfade, $x$'in 2 ve 7 noktalarına uzaklıkları toplamıdır.
2. $|2 - 7| = 5$ olduğundan en küçük değer 5'tir ve bu değer $2 \leq x \leq 7$ için elde edilir.
3. Tam sayılar 2, 3, 4, 5, 6, 7 olup toplam 6 tanedir. Doğru cevap E.

Diğer şıklar: **2** yalnızca iki uç değeri alınmış / **3** iç noktalardan birkaçı atlanmış / **4** uç değerler sayılmamış / **5** fark ($7 - 2$) sayı sanılmış.
:::

:::soru{cevap="C"}
$a < b$, $|a| = 3$ ve $|b| = 5$ olduğuna göre $a + b$ toplamının alabileceği değerlerin toplamı kaçtır?

- A) 2
- B) 8
- C) 10
- D) 11
- E) 16

---

1. $a = \pm 3$ ve $b = \pm 5$ olabilir.
2. $a < b$ koşulu: $b = -5$ ise $a$ ($-3$ ya da 3) $b$'den büyük olur, bu yüzden $b = -5$ olamaz. Geriye $b = 5$ kalır.
3. $a = -3$ için $a + b = 2$, $a = 3$ için $a + b = 8$.
4. Değerlerin toplamı $2 + 8 = 10$ olur. Doğru cevap C.

Diğer şıklar: **2** yalnızca bir durum bulunmuş / **8** yalnızca bir durum bulunmuş / **11** bir fazla sayılmış / **16** aynı değer iki kez toplanmış.
:::

## Kendini dene

:::dene
1. $|x - 4| = 7$ denkleminin çözüm kümesini yaz. => $x - 4 = 7$ ise $x = 11$. $x - 4 = -7$ ise $x = -3$. Çözüm kümesi $\{-3, 11\}$.
2. $|{-8}| + |3| - |{-2}|$ işleminin sonucu kaçtır? => $8 + 3 - 2 = 9$.
3. $|x| < 3$ eşitsizliğini sağlayan tam sayıları yaz. => $-2, -1, 0, 1, 2$.
4. $|x + 1| = -4$ denkleminin çözümü var mıdır? => Hayır. Mutlak değer negatif olamaz.
5. $|x - 1| + |x + 2|$ ifadesinin en küçük değeri kaçtır? => Noktalar 1 ve $-2$. Aralarındaki uzaklık $|1 - (-2)| = 3$ olduğundan en küçük değer 3.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Mutlak Değer'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Mutlak değerin tanımı ve uzaklık anlamı, özellikler, mutlak değerli denklem ve eşitsizlikler, iki mutlak değerin toplamının en küçük değeri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Tabloda \lvert ve \rvert kullanıldı (KaTeX), (b) Mini test 4. soru zor düzeydedir. Simülasyon sonradan eklenecek (mutlak değer uzaklık).$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Mutlak Değer'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bakteri her saat ikiye bölünüyorsa 10 saat sonra kaç bakteri olur? $2^{10} = 1024$. Üslü sayılar hızlı büyümeyi ve çok küçük ya da çok büyük değerleri kısa yazmayı sağlar. TYT'de bu konu iki ana yolla sorulur: **tabanı eşitleyerek** karşılaştırma, denklem çözme ve **birler basamağı** bulma. Bu konuda üs kurallarını, negatif ve sıfır üssü, üslü denklemleri ve birler basamağı döngülerini öğreneceksin.

:::hedefler
1. Üslü ifadelerin tanımını ve temel üs kurallarını uygulamak.
2. Sıfırıncı ve negatif üssü yorumlamak.
3. Tabanı eşitleyerek üslü ifadeleri sadeleştirmek ve karşılaştırmak.
4. Üslü denklemleri çözmek.
5. Birler basamağını döngü yöntemiyle bulmak.
:::

:::ipucu
Üslü sorularda en güçlü hamle **tabanı eşitlemektir**. 4, 8, 16, 32 gördüğünde 2'nin kuvveti, 9, 27, 81 gördüğünde 3'ün kuvveti olduğunu düşün. Taban eşitlenince işlem üslerin işlemine dönüşür.
:::

## 1. Tanım ve temel kurallar

$a^n$ ifadesinde $a$ **taban**, $n$ **üs**tür. $n$ pozitif tam sayı ise $a$'yı $n$ kez kendisiyle çarp.

$$a^n = \underbrace{a \cdot a \cdots a}_{n \text{ tane}}$$

Temel kurallar ($a$ ve $b$ sıfırdan farklı):

| Kural | Örnek |
| --- | --- |
| $a^m \cdot a^n = a^{m+n}$ | $2^3 \cdot 2^4 = 2^7$ |
| $\dfrac{a^m}{a^n} = a^{m-n}$ | $\dfrac{5^6}{5^2} = 5^4$ |
| $(a^m)^n = a^{m \cdot n}$ | $(3^2)^4 = 3^8$ |
| $(a \cdot b)^n = a^n \cdot b^n$ | $(2 \cdot 5)^3 = 2^3 \cdot 5^3$ |
| $\left(\dfrac{a}{b}\right)^n = \dfrac{a^n}{b^n}$ | $\left(\dfrac{2}{3}\right)^2 = \dfrac{4}{9}$ |
| $a^0 = 1$ | $7^0 = 1$ |
| $a^{-n} = \dfrac{1}{a^n}$ | $2^{-3} = \dfrac{1}{8}$ |

Dikkat edilecek üç nokta:

- $a^m \cdot a^n$ ile $(a^m)^n$ farklıdır. Birinde üsler toplanır, diğerinde çarpılır. $(5^2)^3 = 5^6$ iken $5^{2^3} = 5^8$.
- **Toplama ve çıkarma** için kural yoktur. $2^3 + 2^4$ ifadesi $2^7$ **değildir**. Ortak çarpan parantezine alırsın: $2^3(1 + 2) = 24$.
- $0^0$ tanımsızdır, $0^n = 0$ ($n > 0$).

### Negatif tabanlı ifadeler

- Eksi işaretli taban **parantez içindeyse** üssün içine girer: $(-3)^4 = 81$ ve $(-2)^3 = -8$.
- Parantez yoksa eksi, üssün dışındadır: $-3^4 = -81$.
- Negatif tabanın üssü **çiftse sonuç pozitif**, **tekse negatiftir**.

## 2. Tabanı eşitleme

**Örnek.** $\dfrac{2^5 \cdot 4^3}{8^2}$ ifadesini bulalım. $4 = 2^2$ ve $8 = 2^3$ yazılır: $4^3 = 2^6$ ve $8^2 = 2^6$.

$$\dfrac{2^5 \cdot 2^6}{2^6} = 2^5 = 32$$

### Üslü ifadeleri karşılaştırma

Tabanları eşitleyemiyorsan **üsleri eşitle**. $a = 2^{40}$, $b = 3^{30}$ ve $c = 5^{20}$ sayılarını sıralayalım. Üsleri 10'a göre eşitleriz:

$$a = (2^4)^{10} = 16^{10} \qquad b = (3^3)^{10} = 27^{10} \qquad c = (5^2)^{10} = 25^{10}$$

Üsler aynı olduğuna göre tabanı büyük olan büyüktür. $16 < 25 < 27$ olduğundan $a < c < b$.

## 3. Üslü denklemler

**Taban aynıysa üsler eşittir** ($a > 0$ ve $a \neq 1$): $a^x = a^y$ ise $x = y$.

**Örnek.** $2^{x+3} - 2^x = 112$ denklemini çözelim. Ortak çarpan $2^x$:

$$2^x(2^3 - 1) = 112 \Rightarrow 2^x \cdot 7 = 112 \Rightarrow 2^x = 16 = 2^4$$

$x = 4$ bulunur. Kontrol: $2^7 - 2^4 = 128 - 16 = 112$.

**Aynı üslü toplamlar.** $2^{10} + 2^{10} = 2 \cdot 2^{10} = 2^{11}$ ve $3^5 + 3^5 + 3^5 = 3 \cdot 3^5 = 3^6$. Aynı terim kaç tane varsa tabanın o kadarı çarpılır.

:::baglanti
Üslü denklemde tabanı eşitleyince "$x$ nedir?" sorusu üslerin denklemine dönüşür. Bu, "Denklem Çözme" konusundaki ilk ve ikinci dereceden denklem çözme becerileriyle birleşir.
:::

## 4. Birler basamağı

Bir üslü sayının **birler basamağı**, üs arttıkça belirli bir döngüyle tekrar eder. Döngüleri bilirsen devasa sayıların son rakamı hesaplanır.

| Taban birler rakamı | Birler basamağı (üs 1, 2, 3, ... için) | Döngü uzunluğu |
| --- | --- | --- |
| 0, 1, 5, 6 | Hep aynı (0, 1, 5, 6) | 1 |
| 4 | 4, 6, 4, 6, ... | 2 |
| 9 | 9, 1, 9, 1, ... | 2 |
| 2 | 2, 4, 8, 6, 2, 4, ... | 4 |
| 3 | 3, 9, 7, 1, 3, 9, ... | 4 |
| 7 | 7, 9, 3, 1, 7, 9, ... | 4 |
| 8 | 8, 4, 2, 6, 8, 4, ... | 4 |

**Yöntem:** Üssü döngü uzunluğuna böl, **kalana** bak. Kalan 0 ise döngünün **son** değeri alınır.

**Örnek.** $7^{2024} + 3^{2025}$ toplamının birler basamağını bulalım.

- 7'nin döngüsü 7, 9, 3, 1 (uzunluk 4). $2024 = 4 \cdot 506$ olduğundan kalan 0 ve son değer **1**.
- 3'ün döngüsü 3, 9, 7, 1 (uzunluk 4). $2025 = 4 \cdot 506 + 1$ olduğundan kalan 1 ve ilk değer **3**.
- Toplam $1 + 3 = 4$. Birler basamağı **4**.

:::ipucu{baslik="Sık yapılan hata"}
Üssü döngü uzunluğuna bölüp kalan 0 çıkınca "birler basamağı 0" demek yanlıştır. Kalan 0 ise **döngünün son elemanı** alınır. $7^4$ sayısı 2401'dir ve birler basamağı 1'dir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çarpma | Üsler toplanır |
| Bölme | Üsler çıkarılır |
| Üssün üssü | Üsler çarpılır |
| $a^0$ | 1 ($a \neq 0$) |
| $a^{-n}$ | $\dfrac{1}{a^n}$ |
| Toplama ve çıkarma | Ortak çarpan parantezine al |
| Karşılaştırma | Tabanı ya da üssü eşitle |
| Birler basamağı | Döngü, kalan 0 ise son değer |

## Mini test

:::soru{cevap="B"}
$\dfrac{2^5 \cdot 4^3}{8^2}$ işleminin sonucu kaçtır?

- A) 31
- B) 32
- C) 33
- D) 34
- E) 64

---

1. $4 = 2^2$ ve $8 = 2^3$ olduğundan $4^3 = 2^6$ ve $8^2 = 2^6$.
2. $\dfrac{2^5 \cdot 2^6}{2^6} = 2^5$.
3. $2^5 = 32$ olur. Doğru cevap B.

Diğer şıklar: **31** bir eksik sayılmış / **33** bir fazla sayılmış / **34** iki fazla sayılmış / **64** $8^2$ ile sadeleşme yapılmamış.
:::

:::soru{cevap="D"}
$2^{x+3} - 2^x = 112$ olduğuna göre $x$ kaçtır?

- A) 1
- B) 2
- C) 3
- D) 4
- E) 5

---

1. $2^{x+3} = 2^x \cdot 2^3$ yazılır, ortak çarpan $2^x$ alınır: $2^x(8 - 1) = 112$.
2. $2^x \cdot 7 = 112$ ve $2^x = 16 = 2^4$.
3. $x = 4$ bulunur. Doğru cevap D.

Diğer şıklar: **1** üç eksik sayılmış / **2** $2^x = 28$ gibi işlem hatası / **3** $2^x = 8$ sanılmış / **5** $16 = 2^5$ sanılmış.
:::

:::soru{cevap="B"}
$a = 2^{40}$, $b = 3^{30}$ ve $c = 5^{20}$ olduğuna göre aşağıdaki sıralamalardan hangisi doğrudur?

- A) $a < b < c$
- B) $a < c < b$
- C) $b < a < c$
- D) $c < a < b$
- E) $b < c < a$

---

1. Üsler 10'a eşitlenir: $a = 16^{10}$, $b = 27^{10}$, $c = 25^{10}$.
2. Üsler aynı olduğundan tabanı büyük olan büyüktür: $16 < 25 < 27$.
3. Sıralama $a < c < b$ olur. Doğru cevap B.

Diğer şıklar: **$a < b < c$** yalnızca tabanlara bakılmış / **$b < a < c$** üsler eşitlenmeden tahmin edilmiş / **$c < a < b$** tabanlar yanlış karşılaştırılmış / **$b < c < a$** sıralama tersten yazılmış.
:::

:::soru{cevap="E"}
$7^{2024} + 3^{2025}$ toplamının birler basamağındaki rakam kaçtır?

- A) 0
- B) 1
- C) 2
- D) 3
- E) 4

---

1. 7'nin birler basamağı döngüsü 7, 9, 3, 1'dir. $2024 = 4 \cdot 506$ ve kalan 0 olduğundan son değer 1 alınır.
2. 3'ün döngüsü 3, 9, 7, 1'dir. $2025 = 4 \cdot 506 + 1$ ve kalan 1 olduğundan ilk değer 3 alınır.
3. Birler basamağı $1 + 3 = 4$ olur. Doğru cevap E.

Diğer şıklar: **0** $7^{2024}$ için 7 alınmış / **1** üç eksik sayılmış / **2** $3^{2025}$ için 1 alınmış / **3** $7^{2024}$ için 0 alınmış.
:::

## Kendini dene

:::dene
1. $\dfrac{3^5 \cdot 9^2}{27}$ işleminin sonucu kaçtır? => $9^2 = 3^4$ ve $27 = 3^3$. $\dfrac{3^5 \cdot 3^4}{3^3} = 3^6 = 729$.
2. $2^{-3} + 2^{-2}$ toplamı kaçtır? => $\dfrac{1}{8} + \dfrac{1}{4} = \dfrac{3}{8}$.
3. $5^x = 125$ ise $x$ kaçtır? => $125 = 5^3$ olduğundan $x = 3$.
4. $-2^4$ ile $(-2)^4$ değerlerini yaz. => $-2^4 = -16$ ve $(-2)^4 = 16$.
5. $2^{2025}$ sayısının birler basamağı kaçtır? => $2025 = 4 \cdot 506 + 1$ ve 2'nin döngüsünde kalan 1 ilk değer olan 2'yi verir. Birler basamağı 2.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Üslü Sayılar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Üslü ifadeler, üs kuralları, sıfır ve negatif üs, taban eşitleme, üslü denklemler, birler basamağı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Birler basamağı tablosunda kalan 0 kuralı, (b) Mini test 3. soru seçenekleri metinsel olduğundan anahtar planına bağlı değildir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Üslü Sayılar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir karenin alanı 50 cm² ise kenarı kaç cm'dir? Cevap $\sqrt{50}$ ve bu sayıyı $5\sqrt{2}$ diye yazabilmek kök sorularının temelidir. TYT'de köklü sayılarda **sadeleştirme, işlem, paydayı kökten kurtarma ve karşılaştırma** sorulur. Bu konuda kök kurallarını, iç içe kökleri ve eşlenik kullanımını öğreneceksin.

:::hedefler
1. Karekökün tanımını ve $\sqrt{x^2} = |x|$ ilişkisini kullanmak.
2. Köklü ifadeleri sadeleştirmek ve kök dışına çıkarmak.
3. Köklü sayılarla dört işlemi yapmak.
4. Paydayı eşlenikle kökten kurtarmak.
5. Köklü sayıları karşılaştırmak ve iki tam sayı arasına yerleştirmek.
:::

:::ipucu
Kök dışına çıkarmak için kökün içindeki sayıyı **tam kare çarpanlarına** ayır. 50 = 25 $\cdot$ 2 olduğundan $\sqrt{50} = 5\sqrt{2}$ olur. Tam kareleri ezberle: 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144.
:::

## 1. Karekök

$a \geq 0$ için $\sqrt{a}$, **negatif olmayan** ve karesi $a$ olan sayıdır. $\sqrt{49} = 7$ yazılır, $-7$ değil. Karekökün sonucu hiçbir zaman negatif olmaz.

Bir sayının karesinin kökü, sayının **mutlak değeridir**:

$$\sqrt{x^2} = |x|$$

Örneğin $\sqrt{(-5)^2} = \sqrt{25} = 5 = |-5|$. $x$'in işareti belli değilse $\sqrt{x^2} = x$ yazmak yanlıştır.

## 2. Kök kuralları

$a, b \geq 0$ ve paydada kök varsa $b > 0$ olmak üzere:

| Kural | Örnek |
| --- | --- |
| $\sqrt{a} \cdot \sqrt{b} = \sqrt{a \cdot b}$ | $\sqrt{3} \cdot \sqrt{12} = \sqrt{36} = 6$ |
| $\dfrac{\sqrt{a}}{\sqrt{b}} = \sqrt{\dfrac{a}{b}}$ | $\dfrac{\sqrt{48}}{\sqrt{3}} = \sqrt{16} = 4$ |
| $a\sqrt{b} = \sqrt{a^2 \cdot b}$ | $2\sqrt{3} = \sqrt{12}$ |
| $(\sqrt{a})^2 = a$ | $(\sqrt{7})^2 = 7$ |

**Toplama ve çıkarmada** kök içleri **toplanmaz**. $\sqrt{2} + \sqrt{3}$ ifadesi $\sqrt{5}$ değildir ve $\sqrt{9} + \sqrt{16} = 7$ iken $\sqrt{25} = 5$ olduğu bunu gösterir.

## 3. Sadeleştirme ve işlem

**Kök dışına çıkarma:** Kökün içini tam kare çarpanlara ayır.

$$\sqrt{72} = \sqrt{36 \cdot 2} = 6\sqrt{2} \qquad \sqrt{75} = \sqrt{25 \cdot 3} = 5\sqrt{3}$$

**Toplama ve çıkarma:** Yalnızca **kök içleri aynı** olan terimler toplanıp çıkarılır. Önce her terimi sadeleştir.

**Örnek.** $\sqrt{50} + \sqrt{18} - \sqrt{8}$ işlemini yapalım.

$$5\sqrt{2} + 3\sqrt{2} - 2\sqrt{2} = (5 + 3 - 2)\sqrt{2} = 6\sqrt{2}$$

**Çarpma ve bölme:** Katsayılar kendi arasında, kök içleri kendi arasında işlenir. $2\sqrt{3} \cdot 3\sqrt{5} = 6\sqrt{15}$.

## 4. Paydayı kökten kurtarma

Payda kökten kurtarılmadan sonuç tamamlanmış sayılmaz.

**Tek terimli payda:** Pay ve paydayı paydadaki köke çarp.

$$\dfrac{6}{\sqrt{3}} = \dfrac{6\sqrt{3}}{\sqrt{3}\cdot\sqrt{3}} = \dfrac{6\sqrt{3}}{3} = 2\sqrt{3}$$

**İki terimli payda:** Paydanın **eşleniği** ile çarp. $a + \sqrt{b}$'nin eşleniği $a - \sqrt{b}$'dir. Çarpım iki kare farkı olur: $(a + b)(a - b) = a^2 - b^2$.

**Örnek.** $\dfrac{1}{\sqrt{3} - 1} + \dfrac{1}{\sqrt{3} + 1}$ toplamını bulalım.

$$\dfrac{1}{\sqrt{3} - 1} = \dfrac{\sqrt{3} + 1}{(\sqrt{3} - 1)(\sqrt{3} + 1)} = \dfrac{\sqrt{3} + 1}{2} \qquad \dfrac{1}{\sqrt{3} + 1} = \dfrac{\sqrt{3} - 1}{2}$$

$$\dfrac{\sqrt{3} + 1}{2} + \dfrac{\sqrt{3} - 1}{2} = \dfrac{2\sqrt{3}}{2} = \sqrt{3}$$

:::baglanti
Eşlenik çarpımı, "Çarpanlara Ayırma" konusundaki **iki kare farkı** özdeşliğinin köklü sayılardaki uygulamasıdır. Aynı özdeşliği iki yerde de görmen, ezber yerine mantıkla ilerlemeni sağlar.
:::

## 5. İç içe kökler

$\sqrt{a \pm 2\sqrt{b}}$ biçiminde bir ifade, toplamları $a$ ve çarpımları $b$ olan iki sayı bulunursa **tam kareye** dönüşür:

$$\sqrt{(x + y) + 2\sqrt{xy}} = \sqrt{x} + \sqrt{y}$$

**Örnek.** $\sqrt{14 - 6\sqrt{5}}$ ifadesini sadeleştirelim. $6\sqrt{5} = 2 \cdot 3\sqrt{5} = 2\sqrt{45}$ olduğundan $14 - 2\sqrt{45}$ yazılır. Toplamı 14, çarpımı 45 olan sayılar 9 ve 5'tir.

$$\sqrt{14 - 2\sqrt{45}} = \sqrt{9} - \sqrt{5} = 3 - \sqrt{5}$$

Eksi işaretliyse **büyük kökten küçüğü** çıkarılır, çünkü karekök negatif olamaz. $3 > \sqrt{5}$ olduğundan sonuç pozitiftir.

## 6. Karşılaştırma ve tam kısım

**Kökleri karşılaştırma:** Kök içindeki sayı büyüdükçe kök büyür. $\sqrt{3} < \sqrt{5} < 3 < \sqrt{10}$ gibi. Katsayılı ifadelerde katsayıyı kök içine al: $2\sqrt{3} = \sqrt{12}$ ve $3\sqrt{2} = \sqrt{18}$ olduğundan $2\sqrt{3} < 3\sqrt{2}$.

**İki tam sayı arasına yerleştirme:** Kök içindeki sayıyı komşu iki tam karenin arasına al. $36 < 40 < 49$ olduğundan $6 < \sqrt{40} < 7$.

**Örnek.** $\sqrt{45} + \sqrt{55}$ toplamının tam kısmı kaçtır?

- $36 < 45 < 49$ yani $6 < \sqrt{45} < 7$. Daha dar: $6{,}7^2 = 44{,}89$ ve $6{,}71^2 = 45{,}02$ olduğundan $\sqrt{45} \approx 6{,}708$.
- $49 < 55 < 64$ yani $7 < \sqrt{55} < 8$ ve $\sqrt{55} \approx 7{,}416$.
- Toplam yaklaşık $14{,}12$. Tam kısım **14**.

:::ipucu{baslik="Sık yapılan hata"}
Toplamın tam kısmını bulmak için her kökün tam kısmını ayrı ayrı alıp toplamak yanlıştır. Burada $6 + 7 = 13$ bulunur ama gerçek toplam 14,12'dir. Aralığı **toplam üzerinde** daralt.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $\sqrt{x^2}$ | $\lvert x \rvert$ |
| Çarpma ve bölme | Kök içleri çarpılır ve bölünür |
| Toplama ve çıkarma | Yalnızca aynı kök içli terimler |
| Kök dışına çıkarma | Tam kare çarpanlara ayır |
| Payda tek terim | Köke çarp |
| Payda iki terim | Eşleniğiyle çarp |
| $\sqrt{(x+y) \pm 2\sqrt{xy}}$ | $\sqrt{x} \pm \sqrt{y}$ |
| Tam kısım | Komşu tam karelere sıkıştır |

## Mini test

:::soru{cevap="C"}
$\sqrt{50} + \sqrt{18} - \sqrt{8}$ işleminin sonucu aşağıdakilerden hangisidir?

- A) $4\sqrt{2}$
- B) $2\sqrt{15}$
- C) $6\sqrt{2}$
- D) $7\sqrt{2}$
- E) $8\sqrt{2}$

---

1. Her terim sadeleştirilir: $\sqrt{50} = 5\sqrt{2}$, $\sqrt{18} = 3\sqrt{2}$, $\sqrt{8} = 2\sqrt{2}$.
2. Katsayılar işleme girer: $(5 + 3 - 2)\sqrt{2} = 6\sqrt{2}$. Doğru cevap C.

Diğer şıklar: **$4\sqrt{2}$** $\sqrt{8} = 4\sqrt{2}$ alınmış / **$2\sqrt{15}$** kök içleri toplanıp çıkarılmış / **$7\sqrt{2}$** $\sqrt{8}$ yerine $\sqrt{2}$ alınmış / **$8\sqrt{2}$** çıkarma unutulmuş.
:::

:::soru{cevap="D"}
$\dfrac{1}{\sqrt{3} - 1} + \dfrac{1}{\sqrt{3} + 1}$ işleminin sonucu kaçtır?

- A) $\dfrac{1}{2}$
- B) $\dfrac{\sqrt{3}}{2}$
- C) 1
- D) $\sqrt{3}$
- E) $\sqrt{3} + 1$

---

1. İlk kesir: $\dfrac{1}{\sqrt{3} - 1} = \dfrac{\sqrt{3} + 1}{(\sqrt{3} - 1)(\sqrt{3} + 1)} = \dfrac{\sqrt{3} + 1}{3 - 1} = \dfrac{\sqrt{3} + 1}{2}$.
2. İkinci kesir benzer biçimde $\dfrac{\sqrt{3} - 1}{2}$ olur.
3. Toplam $\dfrac{(\sqrt{3} + 1) + (\sqrt{3} - 1)}{2} = \sqrt{3}$. Doğru cevap D.

Diğer şıklar: **$\dfrac{1}{2}$** paydaların çarpımı sonuç sanılmış / **$\dfrac{\sqrt{3}}{2}$** toplam ikiye bölünmüş / **1** yalnızca sabit terimler toplanmış / **$\sqrt{3} + 1$** paydadaki 2 unutulmuş.
:::

:::soru{cevap="B"}
$\sqrt{45} + \sqrt{55}$ toplamının tam kısmı kaçtır?

- A) 13
- B) 14
- C) 15
- D) 16
- E) 17

---

1. $36 < 45 < 49$ olduğundan $6 < \sqrt{45} < 7$. Daha yakından $\sqrt{45} \approx 6{,}71$.
2. $49 < 55 < 64$ olduğundan $7 < \sqrt{55} < 8$ ve $\sqrt{55} \approx 7{,}42$.
3. Toplam yaklaşık $14{,}13$ ve tam kısmı 14'tür. Doğru cevap B.

Diğer şıklar: **13** kökler ayrı ayrı aşağı yuvarlanmış / **15** kökler ayrı ayrı yukarı yuvarlanmış / **16** iki kök de 8 sanılmış / **17** üç fazla sayılmış.
:::

:::soru{cevap="B"}
$\sqrt{14 - 6\sqrt{5}}$ ifadesi aşağıdakilerden hangisine eşittir?

- A) $\sqrt{5} - 3$
- B) $3 - \sqrt{5}$
- C) $\sqrt{14} - \sqrt{5}$
- D) $3 + \sqrt{5}$
- E) $8 - \sqrt{5}$

---

1. $6\sqrt{5} = 2\sqrt{45}$ olduğundan ifade $\sqrt{14 - 2\sqrt{45}}$ olur.
2. Toplamı 14, çarpımı 45 olan sayılar 9 ve 5'tir. İfade $\sqrt{9} - \sqrt{5} = 3 - \sqrt{5}$.
3. $3 > \sqrt{5}$ olduğundan sonuç pozitiftir. Doğru cevap B.

Diğer şıklar: **$\sqrt{5} - 3$** sonuç negatif bulunmuş / **$\sqrt{14} - \sqrt{5}$** kök içindeki terimlerin karekökleri ayrı alınmış / **$3 + \sqrt{5}$** eşlenik işareti yanlış / **$8 - \sqrt{5}$** katsayılar ayrı işlenmiş.
:::

## Kendini dene

:::dene
1. $\sqrt{48}$ ifadesini sadeleştir. => $\sqrt{16 \cdot 3} = 4\sqrt{3}$.
2. $\sqrt{3} \cdot \sqrt{12}$ kaçtır? => $\sqrt{36} = 6$.
3. $\dfrac{10}{\sqrt{5}}$ ifadesinin paydasını kökten kurtar. => $\dfrac{10\sqrt{5}}{5} = 2\sqrt{5}$.
4. $\sqrt{7 + 2\sqrt{10}}$ ifadesini sadeleştir. => Toplamı 7, çarpımı 10 olan sayılar 5 ve 2'dir. Sonuç $\sqrt{5} + \sqrt{2}$.
5. $\sqrt{(-4)^2}$ kaçtır? => $\sqrt{16} = 4$. Karekök negatif olmaz.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Köklü Sayılar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Karekök, kök kuralları, sadeleştirme, köklü işlemler, paydayı kökten kurtarma (eşlenik), iç içe kökler, karşılaştırma ve tam kısım. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) İç içe kök konusu AYT'ye yakındır, TYT için gereken düzeyde mi, (b) Mini test 4. soru zor düzeydedir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Köklü Sayılar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ifadeyi çarpanlarına ayırmak, onu çarpım biçiminde yazmaktır. Sadeleştirme, denklem çözme, değer hesaplama ve büyük sayılarla işlem yapma sorularının çoğunun arkasında çarpanlara ayırma vardır. $2025^2 - 2023^2$ gibi bir işlemi hesap makinesiz saniyeler içinde çözmek bu konunun gücüdür. Bu konuda **özdeşlikleri**, üç terimlilerin ayrılmasını ve değer sorularında özdeşlik kullanmayı öğreneceksin.

:::hedefler
1. Ortak çarpan parantezine alma ve gruplama yöntemlerini uygulamak.
2. İki kare farkı, tam kare ve küp özdeşliklerini kullanmak.
3. $x^2 + bx + c$ ve $ax^2 + bx + c$ üç terimlilerini çarpanlarına ayırmak.
4. Özdeşliklerle sayısal hesapları kolaylaştırmak.
5. $x + \dfrac{1}{x}$ ve $a + b$, $a \cdot b$ verilen sorularda özdeşliği kullanmak.
:::

:::ipucu
Çarpanlara ayırmada sırayla şunları dene: **1)** Ortak çarpan var mı? **2)** İki terim varsa iki kare farkı ya da küp farkı/toplamı mı? **3)** Üç terim varsa tam kare ya da üç terimli mi? **4)** Dört terim varsa gruplama olur mu?
:::

## 1. Ortak çarpan ve gruplama

Her terimde bulunan ortak çarpan parantezin dışına alınır.

$$6x^3 - 9x^2 = 3x^2(2x - 3)$$

**Gruplama:** Dört terimli ifadede terimler ikişerli gruplanıp ortak çarpan alınır.

$$ax + ay + bx + by = a(x + y) + b(x + y) = (a + b)(x + y)$$

## 2. Özdeşlikler

Aşağıdaki özdeşlikler her $a$ ve $b$ değeri için doğrudur.

| Özdeşlik | Adı |
| --- | --- |
| $a^2 - b^2 = (a - b)(a + b)$ | İki kare farkı |
| $(a + b)^2 = a^2 + 2ab + b^2$ | Toplamın karesi |
| $(a - b)^2 = a^2 - 2ab + b^2$ | Farkın karesi |
| $a^3 - b^3 = (a - b)(a^2 + ab + b^2)$ | Küp farkı |
| $a^3 + b^3 = (a + b)(a^2 - ab + b^2)$ | Küp toplamı |
| $(a + b)^3 = a^3 + 3a^2b + 3ab^2 + b^3$ | Toplamın küpü |

![Kenarı a artı b olan karenin alanı, a kare, iki tane ab ve b kare parçalarına ayrılmıştır](/lessons/tyt-mat/tam-kare-alan.svg "Toplamın karesinin alan modeli | Yolumnet")

Resimde $(a + b)^2$ kenarı $a + b$ olan karenin alanıdır. Bu alan $a^2$, iki tane $ab$ ve $b^2$ parçalarından oluşur. Bu yüzden ortadaki terim $2ab$'dir ve onu yazmayı unutmak çok yapılan bir hatadır.

**Dikkat:** $(a + b)^2 \neq a^2 + b^2$ ve $a^2 + b^2$ gerçek sayılarda çarpanlarına ayrılmaz.

## 3. Üç terimli ifadeler

**$x^2 + bx + c$ biçimi.** Çarpımı $c$, toplamı $b$ olan iki sayı bulunur.

$$x^2 - 5x + 6 = (x - 2)(x - 3) \qquad (\text{çarpım } 6, \text{ toplam } -5)$$

**$ax^2 + bx + c$ biçimi.** Çapraz çarpma ile ayrılır. $2x^2 + 5x + 2$ için $2x \cdot x$ ve $1 \cdot 2$ çaprazlarının toplamı $4x + x = 5x$ olur. Sonuç $(2x + 1)(x + 2)$.

**Tam kare üç terimli.** İlk ve son terim tam kareyse ve ortadaki terim bunların çarpımının 2 katıysa tam karedir: $x^2 + 6x + 9 = (x + 3)^2$.

**Örnek.** $\dfrac{x^2 - 5x + 6}{x^2 - 4}$ ifadesinin $x = 8$ için değerini bulalım.

$$\dfrac{(x - 2)(x - 3)}{(x - 2)(x + 2)} = \dfrac{x - 3}{x + 2}$$

$x = 8$ için $\dfrac{5}{10} = \dfrac{1}{2}$. Sadeleşebilmek için çarpan olması gerektiğini unutma. Terimleri ayrı ayrı sadeleştirmek yanlıştır.

## 4. Büyük sayılarla hesap

İki kare farkı sayısal hesapları saniyelere indirir.

$$2025^2 - 2023^2 = (2025 - 2023)(2025 + 2023) = 2 \cdot 4048 = 8096$$

$$101^2 - 99^2 = 2 \cdot 200 = 400$$

Tam kareler için de bir sayıyı yuvarlağa yaklaştırırsın: $1002^2 = (1000 + 2)^2 = 1000000 + 4000 + 4 = 1004004$. Ya da $51 \cdot 49 = (50 + 1)(50 - 1) = 2500 - 1 = 2499$.

## 5. Değer soruları

Soruda "$a + b$ ve $a \cdot b$ verildi, şunun değeri nedir?" ya da "$x + \dfrac{1}{x}$ verildi" diye sorular çıkar. Özdeşliği **parçalayıp** istediğin ifadeye getirirsin.

**Örnek.** $x + \dfrac{1}{x} = 5$ ise $x^2 + \dfrac{1}{x^2}$ kaçtır?

$$\left(x + \dfrac{1}{x}\right)^2 = x^2 + 2 \cdot x \cdot \dfrac{1}{x} + \dfrac{1}{x^2} = x^2 + 2 + \dfrac{1}{x^2}$$

$25 = x^2 + 2 + \dfrac{1}{x^2}$ olduğundan $x^2 + \dfrac{1}{x^2} = 23$ bulunur.

**Örnek.** $a - b = 3$ ve $a \cdot b = 10$ ise $a^3 - b^3$ kaçtır? Küp farkı özdeşliğinde $a^2 + ab + b^2 = (a - b)^2 + 3ab$ yazılır.

$$a^3 - b^3 = (a - b)\left[(a - b)^2 + 3ab\right] = 3 \cdot (9 + 30) = 117$$

Kontrol: $a = 5$ ve $b = 2$ alınır. $5^3 - 2^3 = 125 - 8 = 117$.

:::baglanti
$a + b$ ve $a \cdot b$ bilindiğinde $a^2 + b^2$, $a^3 + b^3$ gibi **simetrik** ifadelerin hepsi bulunur. İki sayıyı tek tek hesaplamana gerek kalmaz. "İkinci Dereceden Denklemler" konusunda kökler toplamı ve çarpımı tam bu fikirle çalışır.
:::

:::ipucu{baslik="Sık yapılan hata"}
$(a + b)^2$ ifadesini $a^2 + b^2$ olarak açmak çok yaygındır. Orta terim $2ab$ eksik kalır. Küçük bir deneme yap: $a = 1$ ve $b = 2$ için $(1 + 2)^2 = 9$ iken $1 + 4 = 5$ olur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ortak çarpan | En büyük ortak ifadeyi dışarı al |
| $a^2 - b^2$ | $(a - b)(a + b)$ |
| $(a \pm b)^2$ | $a^2 \pm 2ab + b^2$ |
| $a^3 \pm b^3$ | $(a \pm b)(a^2 \mp ab + b^2)$ |
| $x^2 + bx + c$ | Çarpımı $c$, toplamı $b$ olan iki sayı |
| $(x + 1/x)^2$ | $x^2 + 2 + 1/x^2$ |
| $a^3 - b^3$ | $(a - b)[(a - b)^2 + 3ab]$ |

## Mini test

:::soru{cevap="A"}
$2025^2 - 2023^2$ işleminin sonucu kaçtır?

- A) 8096
- B) 8097
- C) 8098
- D) 8100
- E) 16192

---

1. İki kare farkı: $a^2 - b^2 = (a - b)(a + b)$.
2. $(2025 - 2023)(2025 + 2023) = 2 \cdot 4048$.
3. Sonuç $8096$ olur. Doğru cevap A.

Diğer şıklar: **8097** bir fazla sayılmış / **8098** iki fazla sayılmış / **8100** $4 \cdot 2025$ yaklaşık sonuç alınmış / **16192** sonuç iki kez çarpılmış.
:::

:::soru{cevap="A"}
$x = 8$ için $\dfrac{x^2 - 5x + 6}{x^2 - 4}$ ifadesinin değeri kaçtır?

- A) $\dfrac{1}{2}$
- B) $\dfrac{3}{5}$
- C) $\dfrac{5}{6}$
- D) $\dfrac{11}{10}$
- E) $\dfrac{17}{2}$

---

1. Payı ve paydayı çarpanlarına ayır: $x^2 - 5x + 6 = (x - 2)(x - 3)$ ve $x^2 - 4 = (x - 2)(x + 2)$.
2. Ortak çarpan $(x - 2)$ sadeleşir: $\dfrac{x - 3}{x + 2}$.
3. $x = 8$ için $\dfrac{5}{10} = \dfrac{1}{2}$. Doğru cevap A.

Diğer şıklar: **$\dfrac{3}{5}$** $x - 3$ yerine $x - 2$ alınmış / **$\dfrac{5}{6}$** $x + 2$ yerine $x - 2$ alınmış / **$\dfrac{11}{10}$** $x - 3$ yerine $x + 3$ alınmış / **$\dfrac{17}{2}$** $x^2$ terimleri sadeleştirilmiş.
:::

:::soru{cevap="E"}
$x + \dfrac{1}{x} = 5$ olduğuna göre $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?

- A) 5
- B) 10
- C) 21
- D) 22
- E) 23

---

1. Verilen eşitliğin karesi alınır: $\left(x + \dfrac{1}{x}\right)^2 = x^2 + 2 + \dfrac{1}{x^2}$.
2. $25 = x^2 + 2 + \dfrac{1}{x^2}$ olduğundan $x^2 + \dfrac{1}{x^2} = 23$ olur. Doğru cevap E.

Diğer şıklar: **5** ifade değişmeden bırakılmış / **10** $2 \cdot 5$ hesaplanmış / **21** 4 çıkarılmış / **22** bir eksik sayılmış.
:::

:::soru{cevap="C"}
$a + b = 7$ ve $a \cdot b = 10$ olduğuna göre $a^3 + b^3$ ifadesinin değeri kaçtır?

- A) 70
- B) 132
- C) 133
- D) 134
- E) 203

---

1. $a^3 + b^3 = (a + b)(a^2 - ab + b^2)$ ve $a^2 + b^2 = (a + b)^2 - 2ab = 49 - 20 = 29$.
2. $a^2 - ab + b^2 = 29 - 10 = 19$.
3. $a^3 + b^3 = 7 \cdot 19 = 133$. Doğru cevap C.

Diğer şıklar: **70** $ab(a + b)$ alınmış / **132** bir eksik sayılmış / **134** bir fazla sayılmış / **203** $a^2 - ab + b^2$ yerine $a^2 + b^2$ kullanılmış.
:::

## Kendini dene

:::dene
1. $x^2 - 16$ ifadesini çarpanlarına ayır. => $(x - 4)(x + 4)$.
2. $x^2 + 8x + 16$ ifadesini çarpanlarına ayır. => $(x + 4)^2$.
3. $101^2 - 99^2$ işlemini kolay yoldan yap. => $(101 - 99)(101 + 99) = 2 \cdot 200 = 400$.
4. $a + b = 6$ ve $a \cdot b = 8$ ise $a^2 + b^2$ kaçtır? => $(a + b)^2 - 2ab = 36 - 16 = 20$.
5. $x^2 - 7x + 12$ ifadesini çarpanlarına ayır. => Çarpımı 12, toplamı $-7$ olan sayılar $-3$ ve $-4$. Sonuç $(x - 3)(x - 4)$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'tyt-mat' and name = 'Çarpanlara Ayırma'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Ortak çarpan, gruplama, özdeşlikler (iki kare farkı, tam kare, küp), üç terimliler, sayısal hesapta kullanım, simetrik ifade değerleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Küp özdeşlikleri TYT kapsamında ama sık sorulmaz, (b) Mini test 4. soru zor düzeydedir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Çarpanlara Ayırma'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir yemek tarifini 4 kişiden 10 kişiye çevirmek, harita ölçeğiyle gerçek uzaklığı bulmak ya da bir işi daha fazla işçiyle ne kadar kısa sürede bitirebileceğini hesaplamak, hepsi oran ve orantıdır. TYT'de oran-orantı hem kendi başına hem de problemlerin altyapısı olarak sorulur. Bu konuda oran ve orantı kavramını, **doğru ve ters orantıyı**, orantı sabitini ve orantılı bölmeyi öğreneceksin.

:::hedefler
1. Oran ve orantı kavramlarını ve orantı özelliklerini kullanmak.
2. Doğru ve ters orantıyı problem durumundan tanımak.
3. Orantı sabiti $k$ ile birden fazla değişkeni ifade etmek.
4. Üç ya da daha fazla sayı arasındaki oranları birleştirmek.
5. Bileşik orantı ve orantılı bölme problemlerini çözmek.
:::

:::ipucu
Oran sorularında en kullanışlı hamle **$k$ yazmaktır**. $a : b = 3 : 5$ ise $a = 3k$ ve $b = 5k$ de. Soruyu $k$ ile yazınca bilinmeyenlerin hepsi tek değişkene iner.
:::

## 1. Oran

İki çokluğun **bölümüne** oran denir. $a$ ile $b$'nin oranı $\dfrac{a}{b}$ ya da $a : b$ biçiminde yazılır. Oran birimsizdir ve aynı türden büyüklükler arasında kurulur.

Örneğin sınıfta 12 kız ve 18 erkek öğrenci varsa kızların erkeklere oranı $\dfrac{12}{18} = \dfrac{2}{3}$'tür.

## 2. Orantı

İki oranın eşitliğine **orantı** denir:

$$\dfrac{a}{b} = \dfrac{c}{d}$$

Orantının özellikleri ($b, d$ sıfırdan farklı):

| Özellik | Anlamı |
| --- | --- |
| $a \cdot d = b \cdot c$ | İçler çarpımı dışlar çarpımına eşittir |
| $\dfrac{a + b}{b} = \dfrac{c + d}{d}$ | Paydaya paydayı ekle |
| $\dfrac{a - b}{b} = \dfrac{c - d}{d}$ | Paydadan çıkar |
| $\dfrac{a + c}{b + d} = \dfrac{a}{b}$ | Payları ve paydaları ayrı ayrı topla |

**Örnek.** $\dfrac{4}{6} = \dfrac{8}{12}$ için $4 \cdot 12 = 48$ ve $6 \cdot 8 = 48$ olur.

### $k$ ile çözüm

$\dfrac{a}{b} = \dfrac{3}{4}$ ve $a + b = 56$ ise $a = 3k$, $b = 4k$ yazılır. $3k + 4k = 56$ ve $k = 8$. Sonuç $a = 24$ ve $b = 32$.

Birden çok oranı **aynı değişkene** bağlayabilirsin: $\dfrac{x}{3} = \dfrac{y}{4} = \dfrac{z}{5} = k$ yazarsan $x = 3k$, $y = 4k$, $z = 5k$ olur.

## 3. Doğru orantı

İki çokluktan biri **artarken diğeri de aynı oranda artıyorsa** doğru orantılıdır. Oranları sabittir:

$$\dfrac{y}{x} = k \quad (\text{sabit})$$

Örnek: Bir kilo elmanın fiyatı sabitse alınan kilo ile ödenen para doğru orantılıdır. 3 kg için 60 lira ödeniyorsa 4 kg için $60 \cdot \dfrac{4}{3} = 80$ lira ödenir.

## 4. Ters orantı

İki çokluktan biri **artarken diğeri aynı oranda azalıyorsa** ters orantılıdır. Çarpımları sabittir:

$$x \cdot y = k \quad (\text{sabit})$$

Örnek: İş sabitse işçi sayısı arttıkça günler azalır. 12 işçi bir işi 15 günde bitiriyorsa toplam iş $12 \cdot 15 = 180$ işçi-günüdür. 18 işçi aynı işi $\dfrac{180}{18} = 10$ günde bitirir.

**Dikkat:** Ters orantıda cevabı doğru orantı gibi çarparsan yanlış çıkar. $15 \cdot \dfrac{18}{12} = 22{,}5$ olurdu ve işçi arttığı hâlde gün arttı sonucuna varırdın. **Mantık kontrolü:** İşçi arttıysa süre kısalmalı.

## 5. Üç değişkenli oranlar

$a : b = 2 : 3$ ve $b : c = 4 : 5$ ise $a : b : c$ oranını bulmak için **ortak terim olan $b$'yi eşitle.** $b$ için 3 ve 4'ün EKOK'u 12'dir.

- $a : b = 2 : 3 = 8 : 12$
- $b : c = 4 : 5 = 12 : 15$

Sonuç $a : b : c = 8 : 12 : 15$ olur. $a + b + c = 140$ ise toplam parça $8 + 12 + 15 = 35$ ve $k = \dfrac{140}{35} = 4$. $a = 32$, $b = 48$, $c = 60$.

:::ipucu{baslik="Sık yapılan hata"}
$a : b = 2 : 3$ ve $b : c = 4 : 5$ iken $a : b : c = 2 : 3 : 5$ yazmak yanlıştır. Ortak terim $b$ iki oranda farklı sayılarla yer alıyor (3 ve 4). Önce $b$ değerlerini eşitle, sonra yaz.
:::

## 6. Orantılı bölme

Bir miktarı verilen oranlarda paylaştırma sorularıdır.

**Örnek.** 200 lira, üç kardeşe 2 : 3 : 5 oranında bölünecek. Parçalar $2k$, $3k$, $5k$ ve toplam $10k = 200$ olduğundan $k = 20$. Kardeşler 40, 60 ve 100 lira alır.

**Ters orantılı bölme.** Oran $2 : 3 : 4$ ile **ters** orantılı bölünecekse $\dfrac{1}{2} : \dfrac{1}{3} : \dfrac{1}{4}$ yazılır. Paydaların EKOK'u 12 ile genişletilir: $6 : 4 : 3$.

## 7. Bileşik orantı

Üç ya da daha fazla çokluk birbirine bağlı olduğunda her çoklukla **ayrı ayrı** orantının yönüne bak.

**Örnek.** 6 işçi günde 8 saat çalışarak bir işi 10 günde bitiriyor. 8 işçi günde 6 saat çalışırsa aynı işi kaç günde bitirir?

İş sabit. Toplam iş $6 \cdot 8 \cdot 10 = 480$ işçi-saat'tir. Yeni durumda günlük işçi-saat $8 \cdot 6 = 48$ ve gün sayısı $\dfrac{480}{48} = 10$ olur.

:::baglanti
Bileşik orantıda "işçi sayısı $\times$ saat $\times$ gün = toplam iş" yazmak, "İşçi ve Havuz Problemleri" konusundaki çözümün de temelidir. Orada iş miktarını 1 alıp işçilerin hızlarını toplayacaksın.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Orantı | $a \cdot d = b \cdot c$ |
| $a : b = 3 : 5$ | $a = 3k$, $b = 5k$ |
| Doğru orantı | Oran sabit ($y/x = k$) |
| Ters orantı | Çarpım sabit ($xy = k$) |
| Üç değişkenli oran | Ortak terimi eşitle |
| Orantılı bölme | Toplam $= (\text{oranlar toplamı}) \cdot k$ |
| Ters orantılı bölme | Oranların tersini al, paydayı eşitle |

## Mini test

:::soru{cevap="D"}
$\dfrac{a}{b} = \dfrac{3}{4}$ ve $a + b = 56$ olduğuna göre $a$ kaçtır?

- A) 14
- B) 21
- C) 23
- D) 24
- E) 25

---

1. $a = 3k$ ve $b = 4k$ yazılır.
2. $3k + 4k = 56$ ve $k = 8$.
3. $a = 3 \cdot 8 = 24$. Doğru cevap D.

Diğer şıklar: **14** $a = 56 \div 4$ alınmış / **21** $k = 7$ alınmış / **23** bir eksik sayılmış / **25** bir fazla sayılmış.
:::

:::soru{cevap="C"}
12 işçi bir işi 15 günde bitirebilmektedir. Aynı işi 20 işçi kaç günde bitirir?

- A) 7
- B) 8
- C) 9
- D) 10
- E) 23

---

1. İş sabit olduğundan işçi sayısı ile gün sayısı **ters orantılıdır**.
2. Toplam iş $12 \cdot 15 = 180$ işçi-gündür.
3. 20 işçi için $\dfrac{180}{20} = 9$ gün gerekir. Doğru cevap C.

Diğer şıklar: **7** işçi farkı günlerden çıkarılmış / **8** bir eksik sayılmış / **10** bir fazla sayılmış / **23** işçi farkı günlere eklenmiş.
:::

:::soru{cevap="E"}
$a : b = 2 : 3$ ve $b : c = 4 : 5$ ve $a + b + c = 140$ olduğuna göre $c$ kaçtır?

- A) 30
- B) 32
- C) 48
- D) 59
- E) 60

---

1. Ortak terim $b$'yi eşitle. 3 ile 4'ün EKOK'u 12'dir. $a : b = 8 : 12$ ve $b : c = 12 : 15$.
2. $a : b : c = 8 : 12 : 15$ ve parça toplamı 35'tir. $k = \dfrac{140}{35} = 4$.
3. $c = 15 \cdot 4 = 60$. Doğru cevap E.

Diğer şıklar: **30** yarısı alınmış / **32** $a$ bulunmuş / **48** $b$ bulunmuş / **59** bir eksik sayılmış.
:::

:::soru{cevap="E"}
$x$, $y$ ve $z$ sayıları için $2x = 3y = 4z$ ve $x + y + z = 65$ olduğuna göre $y$ kaçtır?

- A) 5
- B) 13
- C) 15
- D) 19
- E) 20

---

1. $2x = 3y = 4z = 12k$ yazılırsa $x = 6k$, $y = 4k$, $z = 3k$ olur. 2, 3 ve 4'ün EKOK'u 12'dir.
2. $6k + 4k + 3k = 13k = 65$ ve $k = 5$.
3. $y = 4 \cdot 5 = 20$. Doğru cevap E.

Diğer şıklar: **5** yalnızca $k$ bulunmuş / **13** $65 \div 5$ alınmış / **15** $z$ bulunmuş / **19** bir eksik sayılmış.
:::

## Kendini dene

:::dene
1. $\dfrac{x}{5} = \dfrac{12}{20}$ ise $x$ kaçtır? => $20x = 60$ ve $x = 3$.
2. 5 işçi bir işi 12 günde bitiriyorsa 6 işçi kaç günde bitirir? => İş $5 \cdot 12 = 60$ işçi-gün. $60 / 6 = 10$ gün.
3. $a : b = 3 : 4$ ve $a - b = -6$ ise $a$ kaçtır? => $a = 3k$, $b = 4k$ ve $-k = -6$ yani $k = 6$. $a = 18$.
4. 90 lira, iki kişiye 4 : 5 oranında bölünecek. Küçük pay kaç lira olur? => $9k = 90$, $k = 10$ ve küçük pay $4 \cdot 10 = 40$ lira.
5. Bir haritada 1 cm gerçekte 5 km'yi gösteriyor. Haritada 7 cm olan yol gerçekte kaç km'dir? => Doğru orantı: $7 \cdot 5 = 35$ km.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Oran ve Orantı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Oran, orantı ve özellikleri, doğru ve ters orantı, orantı sabiti, üç değişkenli oran, orantılı ve ters orantılı bölme, bileşik orantı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Ters orantılı bölme anlatımı, (b) Mini test 2. sorunun 22 şıkkı (22,5 yaklaşığı) ders bağlamında anlaşılır mı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Oran ve Orantı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bilmediğin bir sayıyı bir harfle göstermek ve onu bulmak, matematiğin en güçlü araçlarından biridir. Problem konularının hepsi, soruyu bir **denklem** kurmaya ve onu çözmeye indirir. Bu konuda birinci dereceden denklemleri, kesirli denklemleri, iki ve üç bilinmeyenli denklem sistemlerini ve denklemin **çözümü olup olmadığını** nasıl anlayacağını öğreneceksin.

:::hedefler
1. Birinci dereceden bir bilinmeyenli denklemleri çözmek.
2. Kesirli ve parantezli denklemleri düzenleyip çözmek.
3. Bir denklemin tek, sonsuz ya da hiç çözümü olmayacağı durumları ayırt etmek.
4. İki ve üç bilinmeyenli denklem sistemlerini yok etme ve yerine koyma ile çözmek.
5. Parametre içeren denklemlerde koşul kurmak.
:::

:::ipucu
Denklem bir **terazidir**. Bir kefeye yaptığın işlemi diğer kefeye de yaparsan denge bozulmaz. Her adımda iki tarafa da aynı işlemi uyguladığından emin ol. Hata genellikle bir tarafa yapılan işlemin diğer tarafta unutulmasından çıkar.
:::

## 1. Birinci dereceden denklem

$ax + b = 0$ biçimindeki denklemlere birinci dereceden bir bilinmeyenli denklem denir ($a \neq 0$). Çözüm şu adımlarla bulunur:

1. Parantezleri aç.
2. Bilinmeyenli terimleri bir tarafa, sayıları diğer tarafa topla.
3. Bilinmeyenin katsayısına böl.

**Örnek.** $3x - 7 = 2x + 5$ denkleminde $x$ terimlerini sola alalım: $3x - 2x = 5 + 7$ ve $x = 12$. Kontrol: $3 \cdot 12 - 7 = 29$ ve $2 \cdot 12 + 5 = 29$.

**Parantezli:** $4(x - 1) = 2x + 6$ denkleminde parantezi aç: $4x - 4 = 2x + 6$. Sonra $2x = 10$ ve $x = 5$.

## 2. Kesirli denklemler

Kesirler varsa **tüm terimleri paydaların EKOK'u ile çarp**. Paydalar yok olur.

**Örnek.** $\dfrac{2x + 1}{3} = \dfrac{x + 5}{2}$ denklemini çözelim. Paydaların EKOK'u 6'dır.

$$2(2x + 1) = 3(x + 5) \Rightarrow 4x + 2 = 3x + 15 \Rightarrow x = 13$$

Kontrol: $\dfrac{27}{3} = 9$ ve $\dfrac{18}{2} = 9$. Eşit.

:::ipucu{baslik="Sık yapılan hata"}
EKOK ile çarparken **her terimi** çarpmalısın, sayıları değil yalnızca kesirli terimleri değil. Örneğin $\dfrac{x}{2} + 3 = 5$ denkleminde 3 ve 5 de 2 ile çarpılır: $x + 6 = 10$.
:::

## 3. Çözüm kümesi: tek, sonsuz ya da yok

$ax = b$ denkleminde üç durum olur:

| Durum | Sonuç |
| --- | --- |
| $a \neq 0$ | Tek çözüm: $x = \dfrac{b}{a}$ |
| $a = 0$ ve $b = 0$ | **Sonsuz çözüm** (her gerçek sayı) |
| $a = 0$ ve $b \neq 0$ | **Çözüm yok** ($0 = b$ olamaz) |

**Örnek.** $(a - 1)x + 3 = 2x + b$ denkleminin çözüm kümesi tüm gerçek sayılar olsun. Denklemi düzenle: $(a - 1 - 2)x = b - 3$ yani $(a - 3)x = b - 3$. Sonsuz çözüm için hem $a - 3 = 0$ hem $b - 3 = 0$ olmalı. $a = 3$, $b = 3$ ve $a + b = 6$.

**Parametre soruları** böyle çözülür: Denklemi $ax = b$ biçimine getir, sonra istenen duruma göre katsayıyı ve sabiti ayrı ayrı incele.

## 4. İki bilinmeyenli denklem sistemi

İki denklemden $x$ ve $y$ bulunur. İki yöntem vardır.

**Yok etme (toplama) yöntemi.** Bir bilinmeyenin katsayısını eşitleyip denklemleri toplarsın ya da çıkarırsın.

**Örnek.** $2x + y = 11$ ve $x - 3y = -5$ sistemini çözelim. İkinci denklemi 2 ile çarp: $2x - 6y = -10$. Birinci denklemden çıkar:

$$(2x + y) - (2x - 6y) = 11 - (-10) \Rightarrow 7y = 21 \Rightarrow y = 3$$

$y = 3$ ilk denklemde yerine konur: $2x + 3 = 11$ ve $x = 4$. Kontrol: $4 - 9 = -5$. Doğru.

**Yerine koyma yöntemi.** Bir denklemden bir bilinmeyeni çekip diğerine yerleştirirsin. Katsayısı 1 olan terim varsa kolaydır.

**Sistemin çözümü.** Doğrusal iki denklemin grafiği iki doğrudur. Doğrular bir noktada kesişirse tek çözüm, üst üste biniyorsa sonsuz çözüm, paralelse çözüm yoktur. "Analitik Geometri" konusunda bunu görseller üzerinde de göreceksin.

## 5. Üç bilinmeyenli sistem

Üç denklem ve üç bilinmeyen varsa **toplamayı akıllıca kullan**.

**Örnek.** $x + y = 5$, $y + z = 8$ ve $x + z = 7$ olduğuna göre $x \cdot y \cdot z$ kaçtır?

- Üçünü taraf tarafa topla: $2(x + y + z) = 20$ ve $x + y + z = 10$.
- Toplamdan her denklemi çıkar: $z = 10 - 5 = 5$, $x = 10 - 8 = 2$, $y = 10 - 7 = 3$.
- Çarpım $2 \cdot 3 \cdot 5 = 30$.

:::baglanti
Burada tek tek bilinmeyenleri bulmak yerine **toplamlarını** buldun. Çoğu TYT sorusu böyle bir kestirme sunar. Denklemlerin toplamı, farkı ya da çarpımı çoğunlukla istenen ifadeye doğrudan götürür.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Birinci derece | Bilinmeyenleri bir tarafa, sayıları diğer tarafa topla |
| Kesirli denklem | Tüm terimleri EKOK ile çarp |
| $ax = b$ | $a \neq 0$ tek çözüm, $a = b = 0$ sonsuz, $a = 0$ ve $b \neq 0$ çözümsüz |
| İki bilinmeyen | Yok etme ya da yerine koyma |
| Üç bilinmeyen | Denklemleri topla, toplamı bul |
| Kontrol | Bulduğun değeri denklemde dene |

## Mini test

:::soru{cevap="D"}
$\dfrac{2x + 1}{3} = \dfrac{x + 5}{2}$ denkleminin çözümü olan $x$ kaçtır?

- A) 4
- B) 9
- C) 12
- D) 13
- E) 14

---

1. Paydaların EKOK'u 6'dır. İçler dışlar çarpımıyla $2(2x + 1) = 3(x + 5)$.
2. $4x + 2 = 3x + 15$ ve $x = 13$.
3. Kontrol: $\dfrac{27}{3} = 9$ ve $\dfrac{18}{2} = 9$. Doğru cevap D.

Diğer şıklar: **4** iki taraftaki sabitler çarpılmamış / **9** eşitliğin değeri sonuç sanılmış / **12** bir eksik sayılmış / **14** soldaki 1 sabiti çarpılmamış.
:::

:::soru{cevap="D"}
$2x + y = 11$ ve $x - 3y = -5$ denklem sisteminin çözümüne göre $x \cdot y$ kaçtır?

- A) 3
- B) 7
- C) 11
- D) 12
- E) 13

---

1. İkinci denklemi 2 ile çarp: $2x - 6y = -10$. İlk denklemden çıkar: $7y = 21$ ve $y = 3$.
2. $2x + 3 = 11$ ve $x = 4$.
3. $x \cdot y = 4 \cdot 3 = 12$. Doğru cevap D.

Diğer şıklar: **3** yalnızca $y$ bulunmuş / **7** $x + y$ bulunmuş / **11** bir eksik sayılmış / **13** bir fazla sayılmış.
:::

:::soru{cevap="C"}
$(a - 1)x + 3 = 2x + b$ denkleminin çözüm kümesi gerçek sayılar kümesi olduğuna göre $a \cdot b + a^2$ ifadesinin değeri kaçtır?

- A) 9
- B) 12
- C) 18
- D) 19
- E) 20

---

1. Denklem $(a - 1 - 2)x = b - 3$ yani $(a - 3)x = b - 3$ olur.
2. Çözüm kümesi gerçek sayılar ise $a - 3 = 0$ ve $b - 3 = 0$ olmalıdır: $a = 3$ ve $b = 3$.
3. $a \cdot b + a^2 = 9 + 9 = 18$. Doğru cevap C.

Diğer şıklar: **9** yalnızca $a \cdot b$ hesaplanmış / **12** $a^2 + b$ hesaplanmış / **19** bir fazla sayılmış / **20** iki fazla sayılmış.
:::

:::soru{cevap="D"}
$x + y = 5$, $y + z = 8$ ve $x + z = 7$ olduğuna göre $x \cdot y \cdot z$ çarpımı kaçtır?

- A) 10
- B) 15
- C) 29
- D) 30
- E) 31

---

1. Üç denklemi topla: $2(x + y + z) = 20$ ve $x + y + z = 10$.
2. $z = 10 - 5 = 5$, $x = 10 - 8 = 2$, $y = 10 - 7 = 3$.
3. $x \cdot y \cdot z = 2 \cdot 3 \cdot 5 = 30$. Doğru cevap D.

Diğer şıklar: **10** $x + y + z$ sonuç sanılmış / **15** $y \cdot z$ bulunmuş / **29** bir eksik sayılmış / **31** bir fazla sayılmış.
:::

## Kendini dene

:::dene
1. $5x - 3 = 2x + 9$ denklemini çöz. => $3x = 12$ ve $x = 4$.
2. $\dfrac{x}{2} + \dfrac{x}{3} = 10$ denklemini çöz. => EKOK 6 ile çarp: $3x + 2x = 60$ ve $x = 12$.
3. $x + y = 10$ ve $x - y = 2$ ise $x \cdot y$ kaçtır? => Toplayınca $2x = 12$ ve $x = 6$. $y = 4$. Çarpım 24.
4. $(m - 2)x = 6$ denkleminin kökü 3 ise $m$ kaçtır? => $3(m - 2) = 6$ ve $m - 2 = 2$ yani $m = 4$.
5. Üç ardışık sayının toplamı 48 ise en küçüğü kaçtır? => $x + (x + 1) + (x + 2) = 48$ ve $3x = 45$. $x = 15$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Denklem Çözme'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Birinci dereceden denklem, kesirli denklem, çözüm kümesi (tek, sonsuz, yok), iki ve üç bilinmeyenli denklem sistemleri, parametreli denklemler. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 3. soru parametreli, TYT'nin orta-zor düzeyidir, (b) Üç bilinmeyenli sistem anlatımı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Denklem Çözme'
on conflict (topic_id) do nothing;
