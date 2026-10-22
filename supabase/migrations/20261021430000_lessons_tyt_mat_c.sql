-- TYT Temel Matematik konu anlatımları (c). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sınıfta hem müzik hem resim kursuna giden öğrencileri saymak, iki grubun birleşiminde kimsenin iki kez sayılmaması gerektiğini bilmek, kümelerin konusudur. Kümeler, matematiğin dilidir ve sonraki konuların (fonksiyon, olasılık, mantık) hepsi bu dili kullanır. Bu konuda küme gösterimlerini, alt kümeleri, birleşim, kesişim ve fark işlemlerini ve iki kümeli **Venn şeması problemlerini** öğreneceksin.

:::hedefler
1. Kümeyi liste ve ortak özellik yöntemiyle göstermek.
2. Alt küme, öz alt küme ve alt küme sayısını hesaplamak.
3. Birleşim, kesişim, fark ve tümleyen işlemlerini yapmak.
4. $s(A \cup B) = s(A) + s(B) - s(A \cap B)$ bağıntısını kullanmak.
5. İki kümeli problemleri Venn şemasıyla çözmek.
:::

:::ipucu
Küme sorularında en güvenli yöntem **Venn şeması çizmektir**. Önce **iki kümenin ortak bölgesini** ($A \cap B$) bulmaya çalış. O bölge belli olunca diğer bölgeler tek işlemde bulunur.
:::

## 1. Küme ve gösterimi

**Küme**, iyi tanımlanmış nesneler topluluğudur. Nesnelere **eleman** denir. $a$, $A$ kümesinin elemanıysa $a \in A$, değilse $a \notin A$ yazılır.

İki gösterim yöntemi vardır:

- **Liste yöntemi:** $A = \{1, 2, 3, 4, 5\}$.
- **Ortak özellik yöntemi:** $A = \{x \mid x \text{ bir doğal sayı ve } 1 \leq x \leq 5\}$.

Elemanı olmayan kümeye **boş küme** denir ve $\emptyset$ ile gösterilir. Tek elemanlı $\{0\}$ boş küme değildir, çünkü içinde 0 vardır. Bir kümede **aynı eleman iki kez yazılmaz** ve elemanların **sırası önemli değildir**.

Elemanların sayısı $s(A)$ ile yazılır. $A = \{1, 2, 3, 4, 5\}$ için $s(A) = 5$.

## 2. Alt küme

$A$'nın her elemanı $B$'de de varsa $A$, $B$'nin **alt kümesidir**: $A \subset B$. Boş küme her kümenin alt kümesidir ve her küme kendisinin alt kümesidir.

$s(A) = n$ ise:

| Ne | Sayı |
| --- | --- |
| Alt küme sayısı | $2^n$ |
| Öz alt küme sayısı (kendisi hariç) | $2^n - 1$ |
| $k$ elemanlı alt küme sayısı | $\binom{n}{k}$ |

4 elemanlı kümenin $2^4 = 16$ alt kümesi, 15 öz alt kümesi vardır. 5 elemanlı kümenin 2 elemanlı alt küme sayısı $\binom{5}{2} = 10$ olur (kombinasyonu sonraki konularda öğreneceksin).

Her eleman için iki seçenek vardır: alt kümede **olur** ya da **olmaz**. Bu yüzden $2 \cdot 2 \cdot \ldots \cdot 2 = 2^n$.

## 3. Kümelerde işlemler

$A = \{1, 2, 3, 4, 5\}$ ve $B = \{4, 5, 6, 7\}$ olsun.

| İşlem | Anlamı | Sonuç |
| --- | --- | --- |
| $A \cup B$ (birleşim) | İkisinden en az birindekiler | $\{1,2,3,4,5,6,7\}$ |
| $A \cap B$ (kesişim) | İkisinde de olanlar | $\{4, 5\}$ |
| $A - B$ (fark) | $A$'da olup $B$'de olmayanlar | $\{1, 2, 3\}$ |
| $B - A$ | $B$'de olup $A$'da olmayanlar | $\{6, 7\}$ |
| $A'$ (tümleyen) | Evrensel kümede olup $A$'da olmayanlar | $E$'ye bağlı |

Evrensel küme $E = \{1, 2, \ldots, 10\}$ ise $A' = \{6, 7, 8, 9, 10\}$.

**De Morgan kuralları.** Tümleyen alınırken birleşim kesişime, kesişim birleşime dönüşür:

$$(A \cup B)' = A' \cap B' \qquad (A \cap B)' = A' \cup B'$$

Yukarıdaki örnekte $(A \cup B)' = \{8, 9, 10\}$ ve $A' \cap B' = \{6,7,8,9,10\} \cap \{1,2,3,8,9,10\} = \{8, 9, 10\}$. İki ifade eşit çıktı.

**Kartezyen çarpım.** $A \times B$, ilk elemanı $A$'dan, ikinci elemanı $B$'den seçilen sıralı ikililerin kümesidir. $s(A \times B) = s(A) \cdot s(B)$. Burada $5 \cdot 4 = 20$ ikili olur.

## 4. İki kümenin eleman sayısı

İki kümenin birleşimindeki eleman sayısını bulurken ortak elemanlar **iki kez sayılmaz**:

$$s(A \cup B) = s(A) + s(B) - s(A \cap B)$$

Ortak elemanların ($4$ ve $5$) $A$ toplanırken bir kez, $B$ toplanırken bir kez daha sayılması yüzünden, bir kez çıkarılır. $s(A \cup B) = 5 + 4 - 2 = 7$.

## 5. Venn şemasıyla problem çözme

**Örnek.** 30 öğrencilik bir sınıfta 18 öğrenci müzik, 15 öğrenci resim kursuna gidiyor. 5 öğrenci hiçbir kursa gitmiyor. Kaç öğrenci hem müzik hem resim kursuna gidiyor?

- Kursa gidenler $30 - 5 = 25$ öğrencidir. Yani $s(M \cup R) = 25$.
- $s(M \cup R) = s(M) + s(R) - s(M \cap R)$ ise $25 = 18 + 15 - x$ ve $x = 8$.
- Yalnızca müzik $18 - 8 = 10$, yalnızca resim $15 - 8 = 7$.

![İki daire müzik ve resim kümelerini gösterir. Yalnızca müzik 10, ikisi de 8, yalnızca resim 7, hiçbiri 5 öğrenci](/lessons/tyt-mat/kume-venn.svg "İki kümeli Venn şeması | Yolumnet")

Kontrol: $10 + 8 + 7 + 5 = 30$. Şemadaki bütün bölgelerin toplamı evrensel kümeye (30) eşit olmalı.

:::ipucu{baslik="Sık yapılan hata"}
"Hiçbirine gitmeyen" öğrencileri unutmak yaygın bir hatadır. $18 + 15 - 30 = 3$ yazmak yanlıştır, çünkü $s(M \cup R)$ evrensel kümeye eşit değildir. Önce **birleşimin eleman sayısını** (30'dan hiçbiri çıkarılarak) bul.
:::

:::baglanti
$s(A \cup B) = s(A) + s(B) - s(A \cap B)$ bağıntısı, "Olasılık" konusunda $P(A \cup B)$ formülüne dönüşecek. Ortak durumları iki kez saymamak, orada da aynı mantıktır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Alt küme sayısı | $2^n$ |
| Öz alt küme sayısı | $2^n - 1$ |
| Birleşim | $s(A \cup B) = s(A) + s(B) - s(A \cap B)$ |
| De Morgan | $(A \cup B)' = A' \cap B'$ |
| Kartezyen çarpım | $s(A \times B) = s(A) \cdot s(B)$ |
| Venn şeması | Önce ortak bölgeyi bul |
| Kontrol | Bölgelerin toplamı evrensel küme |

## Mini test

:::soru{cevap="C"}
$s(A) = 18$, $s(B) = 14$ ve $s(A \cap B) = 6$ olduğuna göre $s(A \cup B)$ kaçtır?

- A) 12
- B) 20
- C) 26
- D) 32
- E) 38

---

1. $s(A \cup B) = s(A) + s(B) - s(A \cap B)$.
2. $18 + 14 - 6 = 26$. Doğru cevap C.

Diğer şıklar: **12** $18 - 6$ hesaplanmış / **20** kesişim iki kez çıkarılmış / **32** kesişim çıkarılmamış / **38** kesişim toplanmış.
:::

:::soru{cevap="B"}
$n$ elemanlı bir kümenin öz alt küme sayısı 127 olduğuna göre $n$ kaçtır?

- A) 6
- B) 7
- C) 8
- D) 63
- E) 127

---

1. Öz alt küme sayısı $2^n - 1$ dir. $2^n - 1 = 127$ ise $2^n = 128$.
2. $128 = 2^7$ olduğundan $n = 7$. Doğru cevap B.

Diğer şıklar: **6** $2^6 = 64$ ile karıştırılmış / **8** $127 + 1 = 128 = 2^8$ sanılmış / **63** yarısı alınmış / **127** öz alt küme sayısı $n$ sanılmış.
:::

:::soru{cevap="C"}
40 kişilik bir sınıfta 25 öğrenci futbol, 18 öğrenci basketbol oynuyor. 6 öğrenci hiçbirini oynamıyor. Buna göre her ikisini de oynayan kaç öğrenci vardır?

- A) 3
- B) 6
- C) 9
- D) 16
- E) 34

---

1. En az bir spor yapanlar $40 - 6 = 34$ kişidir.
2. $34 = 25 + 18 - x$ olduğundan $x = 9$.
3. Kontrol: Yalnızca futbol $25 - 9 = 16$, yalnızca basketbol $18 - 9 = 9$ ve ikisi $9$. $16 + 9 + 9 + 6 = 40$. Doğru cevap C.

Diğer şıklar: **3** hiçbirini oynamayanlar hesaba katılmamış / **6** hiçbirini oynayanların sayısı alınmış / **16** yalnızca futbol oynayanların sayısı alınmış / **34** birleşimin eleman sayısı alınmış.
:::

:::soru{cevap="C"}
$s(A) = 9$, $s(B) = 6$ ve $A \cap B$ kümesinin öz alt küme sayısı 7 olduğuna göre $s(A \cup B)$ kaçtır?

- A) 8
- B) 9
- C) 12
- D) 15
- E) 18

---

1. $A \cap B$ kümesi $k$ elemanlıysa öz alt küme sayısı $2^k - 1 = 7$ ve $2^k = 8$, $k = 3$.
2. $s(A \cup B) = 9 + 6 - 3 = 12$. Doğru cevap C.

Diğer şıklar: **8** $A \cap B$ nin alt küme sayısı alınmış / **9** $s(A)$ alınmış / **15** kesişim çıkarılmamış / **18** kesişim iki kez toplanmış.
:::

## Kendini dene

:::dene
1. 3 elemanlı bir kümenin kaç alt kümesi vardır? => $2^3 = 8$.
2. $A = \{a, b, c\}$ ve $B = \{b, c, d, e\}$ ise $A \cup B$ ve $A \cap B$ nedir? => $A \cup B = \{a, b, c, d, e\}$ ve $A \cap B = \{b, c\}$.
3. $s(A) = 12$, $s(B) = 9$, $s(A \cup B) = 17$ ise $s(A \cap B)$ kaçtır? => $17 = 12 + 9 - x$ ve $x = 4$.
4. $s(A \times B) = 24$ ve $s(A) = 6$ ise $s(B)$ kaçtır? => $s(B) = \dfrac{24}{6} = 4$.
5. 25 kişilik bir grubun 14'ü çay, 16'sı kahve içiyor. Herkes en az birini içiyorsa kaç kişi ikisini de içer? => $25 = 14 + 16 - x$ ve $x = 5$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Kümeler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Küme gösterimi, alt küme ve alt küme sayısı, birleşim, kesişim, fark, tümleyen, De Morgan, kartezyen çarpım, iki kümeli problemler. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Alt küme sayısı tablosunda kombinasyona ileri gönderme, (b) Üç kümeli Venn problemleri bu anlatımda yoktur.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Kümeler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

"Yağmur yağarsa yer ıslanır" cümlesi doğru bir kural gibi görünür. Peki yer ıslak ise yağmur yağmış mıdır? Cevap hayır olabilir, çünkü yeri başka biri de ıslatmış olabilir. Mantık, böyle çıkarımları **doğru ya da yanlış** diye netleştirir. TYT'de mantık sorusu tamamen kuraldır: işlemin sonucu için tablo bilirsin, kurala göre bulursun. Bu konuda önermeleri, bağlaçları, doğruluk tablolarını, denk önermeleri ve niceleyicileri öğreneceksin.

:::hedefler
1. Önerme kavramını ve doğruluk değerini kullanmak.
2. Değil, ve, veya, ise, ancak ve ancak bağlaçlarının doğruluk tablosunu uygulamak.
3. Denk önermeleri ve De Morgan kurallarını kullanmak.
4. Bir koşullu önermenin karşıtını, tersini ve ters karşıtını ayırt etmek.
5. "Her" ve "bazı" niceleyicili önermelerin olumsuzunu yazmak.
:::

:::ipucu
Mantık sorusunda **tabloyu ezberleme, mantığını anla**. "Ve" için iki taraf da doğru olmalıdır. "Veya" için en az biri doğru olması yeter. "İse" bir sözdür: söz tutulmadıysa yani önce doğru, sonra yanlışsa **yalnızca o zaman** yanlış olur.
:::

## 1. Önerme

**Önerme**, doğru ya da yanlış kesin bir hüküm bildiren cümledir. Doğru ise doğruluk değeri **1** (D), yanlış ise **0** (Y) yazılır.

- "7 bir asal sayıdır." Önermedir, doğruluk değeri 1.
- "4 + 5 = 10." Önermedir, doğruluk değeri 0.
- "Matematik güzel midir?" Soru cümlesi, önerme değildir.
- "Hadi ders çalış!" Emir cümlesi, önerme değildir.
- "x + 3 = 8." $x$ bilinmiyorsa kesin hüküm yoktur, önerme değildir.

Önermeler genellikle $p$, $q$, $r$ harfleriyle gösterilir.

## 2. Bağlaçlar ve doğruluk tabloları

**Değil** ($\neg p$): Önermenin doğruluk değerini tersine çevirir.

| $p$ | $\neg p$ |
| --- | --- |
| 1 | 0 |
| 0 | 1 |

**Ve, Veya, İse, Ancak ve ancak:**

| $p$ | $q$ | $p \land q$ (ve) | $p \lor q$ (veya) | $p \Rightarrow q$ (ise) | $p \Leftrightarrow q$ (ancak ve ancak) |
| --- | --- | --- | --- | --- | --- |
| 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | **0** | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 0 | 0 | 1 | 1 |

- **Ve:** Yalnızca ikisi de doğruysa doğru.
- **Veya:** Yalnızca ikisi de yanlışsa yanlış.
- **İse ($p \Rightarrow q$):** Yalnızca $p$ doğru ve $q$ yanlışsa yanlış. Başlangıç yanlışsa ($p = 0$) önerme **her zaman doğrudur**.
- **Ancak ve ancak:** İki önermenin doğruluk değeri **aynıysa** doğru.

**Örnek.** $p$: "$2 + 3 = 5$" (1), $q$: "4 bir asal sayıdır" (0) olsun. $p \land q = 0$, $p \lor q = 1$, $p \Rightarrow q = 0$, $q \Rightarrow p = 1$, $p \Leftrightarrow q = 0$.

## 3. Denk önermeler

İki önermenin doğruluk tabloları aynıysa **denktir** ($\equiv$ ile gösterilir). Önemli denklikler:

| Denklik | Adı |
| --- | --- |
| $\neg(\neg p) \equiv p$ | Çift değil |
| $\neg(p \land q) \equiv \neg p \lor \neg q$ | De Morgan |
| $\neg(p \lor q) \equiv \neg p \land \neg q$ | De Morgan |
| $p \Rightarrow q \equiv \neg p \lor q$ | "İse" yerine |
| $p \Rightarrow q \equiv \neg q \Rightarrow \neg p$ | Ters karşıt |
| $\neg(p \Rightarrow q) \equiv p \land \neg q$ | "İse"nin değili |

De Morgan'da **olumsuzluk dağılırken ve veya'ya, veya ve'ye döner**. Çift değil ve De Morgan'ı birlikte kullanırsan bir sürü ifadeyi sadeleştirirsin.

**Örnek.** $\neg(p \land \neg q)$ ifadesini sadeleştirelim. De Morgan: $\neg p \lor \neg(\neg q) = \neg p \lor q$. Bu da $p \Rightarrow q$'ya denktir.

### Karşıt, ters ve ters karşıt

$p \Rightarrow q$ koşullu önermesi için:

| Önerme | Yazılışı | $p \Rightarrow q$ ile ilişki |
| --- | --- | --- |
| Ters | $q \Rightarrow p$ | Denk **değil** |
| Karşıt (olumsuz) | $\neg p \Rightarrow \neg q$ | Denk **değil** |
| Ters karşıt | $\neg q \Rightarrow \neg p$ | **Denk** |

"Yağmur yağarsa yer ıslanır" ifadesine denk olan tek cümle "Yer ıslak değilse yağmur yağmamıştır" cümlesidir. "Yer ıslaksa yağmur yağmıştır" cümlesi ise **tersi**dir ve denk değildir.

## 4. Niceleyiciler

**"Her"** ($\forall$) ve **"bazı"** ($\exists$) niceleyicileridir.

- $\forall x \in A, \, p(x)$: $A$'daki her $x$ için $p(x)$ doğru.
- $\exists x \in A, \, p(x)$: $A$'da $p(x)$'in doğru olduğu en az bir $x$ var.

**Olumsuzlama kuralı:** Niceleyici **değişir**, özellik de **değilleştirilir**.

$$\neg\left(\forall x, \, p(x)\right) \equiv \exists x, \, \neg p(x) \qquad \neg\left(\exists x, \, p(x)\right) \equiv \forall x, \, \neg p(x)$$

**Örnek.** "Her öğrenci ödevini yaptı" önermesinin olumsuzu "**Ödevini yapmayan en az bir öğrenci vardır**" olur. "Hiçbir öğrenci ödevini yapmadı" yazmak yanlıştır.

:::ipucu{baslik="Sık yapılan hata"}
"Her $x$ için $x > 3$" önermesinin olumsuzunu "Her $x$ için $x < 3$" yazmak çok yapılan bir hatadır. Doğru olumsuz "Öyle bir $x$ vardır ki $x \leq 3$" olur. Niceleyici de değişmeli, işaret de **tam tersine** ($>$ yerine $\leq$) çevrilmelidir.
:::

:::baglanti
$p \Rightarrow q$ ifadesi, "Kümeler" konusundaki alt küme ilişkisiyle bağlantılıdır. $A \subset B$ demek, "$x \in A \Rightarrow x \in B$" demektir. Ters karşıtı olan "$x \notin B \Rightarrow x \notin A$" ifadesi de aynı bilgiyi verir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $p \land q$ | Yalnızca 1 ve 1 iken 1 |
| $p \lor q$ | Yalnızca 0 ve 0 iken 0 |
| $p \Rightarrow q$ | Yalnızca 1 ve 0 iken 0 |
| $p \Leftrightarrow q$ | Değerler aynıysa 1 |
| De Morgan | Ve veya yer değiştirir |
| $p \Rightarrow q$ | $\equiv \neg q \Rightarrow \neg p$ |
| Niceleyici değili | Niceleyici değişir, özellik değilleşir |

## Mini test

:::soru{cevap="D"}
$p$, $q$ ve $r$ önermeleri için $p \equiv 0$, $q \equiv 1$ ve $r \equiv 1$ olduğuna göre aşağıdaki bileşik önermelerden hangisinin doğruluk değeri 1'dir?

- A) $p \land q$
- B) $q \Rightarrow p$
- C) $r \Rightarrow p$
- D) $p \Rightarrow q$
- E) $\neg q \lor p$

---

1. $p \Rightarrow q$: $p = 0$ olduğundan "ise" önermesi her zaman doğrudur. Değeri 1.
2. $p \land q = 0$, $q \Rightarrow p = 1 \Rightarrow 0 = 0$, $r \Rightarrow p = 0$ ve $\neg q \lor p = 0 \lor 0 = 0$ olur.
3. Doğruluk değeri 1 olan tek ifade $p \Rightarrow q$'dur. Doğru cevap D.

Diğer şıklar: **$p \land q$** "ve" için yalnızca birinin doğru olması yeterli sanılmış / **$q \Rightarrow p$** doğru ve yanlış durumunda "ise" doğru sanılmış / **$r \Rightarrow p$** doğru ve yanlış durumunda "ise" doğru sanılmış / **$\neg q \lor p$** $\neg q$ nun doğruluk değeri 1 sanılmış.
:::

:::soru{cevap="B"}
$\neg(p \lor \neg q)$ önermesi aşağıdakilerden hangisine denktir?

- A) $\neg p \lor q$
- B) $\neg p \land q$
- C) $p \land \neg q$
- D) $p \lor \neg q$
- E) $\neg p \land \neg q$

---

1. De Morgan: $\neg(p \lor \neg q) = \neg p \land \neg(\neg q)$.
2. Çift değil: $\neg(\neg q) = q$. Sonuç $\neg p \land q$.
3. Doğru cevap B.

Diğer şıklar: **$\neg p \lor q$** De Morgan'da "ve" ile "veya" değiştirilmemiş / **$p \land \neg q$** değil işareti dağıtılmamış / **$p \lor \neg q$** dıştaki değil unutulmuş / **$\neg p \land \neg q$** $\neg(\neg q)$ yerine $\neg q$ yazılmış.
:::

:::soru{cevap="A"}
"Her $x$ gerçek sayısı için $x^2 \geq x$" önermesinin olumsuzu aşağıdakilerden hangisidir?

- A) Öyle bir $x$ gerçek sayısı vardır ki $x^2 < x$
- B) Her $x$ gerçek sayısı için $x^2 < x$
- C) Öyle bir $x$ gerçek sayısı vardır ki $x^2 \leq x$
- D) Öyle bir $x$ gerçek sayısı vardır ki $x^2 > x$
- E) Her $x$ gerçek sayısı için $x^2 \leq x$

---

1. "Her" niceleyicisinin olumsuzu "öyle bir ... vardır" olur.
2. Özellik de değilleştirilir: $x^2 \geq x$ ifadesinin değili $x^2 < x$'tir.
3. Olumsuz: Öyle bir $x$ gerçek sayısı vardır ki $x^2 < x$. Örneğin $x = \dfrac{1}{2}$ için $\dfrac{1}{4} < \dfrac{1}{2}$. Doğru cevap A.

Diğer şıklar: **Her $x$ gerçek sayısı için $x^2 < x$** niceleyici değiştirilmemiş / **Öyle bir $x$ gerçek sayısı vardır ki $x^2 \leq x$** işaret tam tersine çevrilmemiş / **Öyle bir $x$ gerçek sayısı vardır ki $x^2 > x$** yalnızca işaret ters çevrilmiş ($\geq$ yerine $>$) / **Her $x$ gerçek sayısı için $x^2 \leq x$** hem niceleyici hem işaret yanlış.
:::

:::soru{cevap="D"}
$p \Rightarrow q$ önermesi yanlış, $q \Leftrightarrow r$ önermesi doğru olduğuna göre aşağıdaki önermelerden hangisi doğrudur?

- A) $p \land r$
- B) $\neg p \lor q$
- C) $q \lor r$
- D) $r \Rightarrow p$
- E) $p \Leftrightarrow q$

---

1. $p \Rightarrow q$ yalnızca $p = 1$ ve $q = 0$ iken yanlıştır. Demek ki $p = 1$, $q = 0$.
2. $q \Leftrightarrow r$ doğru ise $q$ ve $r$ aynı değerdedir: $r = 0$.
3. $r \Rightarrow p = 0 \Rightarrow 1 = 1$ doğrudur. Diğerleri: $p \land r = 0$, $\neg p \lor q = 0$, $q \lor r = 0$, $p \Leftrightarrow q = 0$.
4. Doğru cevap D.

Diğer şıklar: **$p \land r$** $r$ nin doğruluk değeri 1 sanılmış / **$\neg p \lor q$** $p$ nin doğruluk değeri 0 sanılmış / **$q \lor r$** $q$ ve $r$ nin doğruluk değeri 1 sanılmış / **$p \Leftrightarrow q$** farklı değerler aynı sanılmış.
:::

## Kendini dene

:::dene
1. $p$ doğru, $q$ yanlış ise $p \Rightarrow q$ nedir? => 0 (yanlış). Doğru ve yanlış durumunda "ise" yanlıştır.
2. $\neg(p \lor q)$ ifadesine denk olan ifade nedir? => $\neg p \land \neg q$ (De Morgan).
3. "Her kuş uçar" önermesinin olumsuzu nedir? => "Uçmayan en az bir kuş vardır."
4. $p \Rightarrow q$ koşullu önermesinin ters karşıtı nedir? => $\neg q \Rightarrow \neg p$.
5. "$x^2 = 4$" önermesinin $x \in \mathbb{R}$ için "bazı" niceleyicisiyle doğruluk değeri nedir? => $\exists x \in \mathbb{R}, x^2 = 4$ doğrudur ($x = 2$ için). Değeri 1.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'Mantık'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Önerme, doğruluk değeri, bağlaçlar (değil, ve, veya, ise, ancak ve ancak), denk önermeler, De Morgan, ters ve karşıt, niceleyiciler. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, doğruluk tabloları python ile doğrulandı.
Kontrol edilecekler: (a) Mantık sembolleri (\land, \lor, \Rightarrow) KaTeX'te doğru görünür mü, (b) Ders kitaplarında karşıt ve ters kavramlarının adlandırması değişebilir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Mantık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir otopark ücretinin süreye bağlı olması, sıcaklığın saate bağlı değişmesi, bir sayının kendisiyle ikiye çarpılması, hepsi bir fonksiyon örneğidir. Fonksiyon, bir girdiyi tam bir çıktıya bağlayan **kuraldır**. TYT'de fonksiyon sorularının çoğu, kuralı bulmak ve belirli bir değere uygulamaktır. Bu konuda fonksiyonu, tanım ve değer kümesini, bileşkeyi ve ters fonksiyonu öğreneceksin.

:::hedefler
1. Fonksiyon tanımını ve fonksiyon olmayan eşlemeleri ayırt etmek.
2. $f(a)$ değerini hesaplamak ve $f(ax + b)$ biçimli ifadelerden $f(x)$ kuralını bulmak.
3. İki fonksiyonun bileşkesini hesaplamak.
4. Bir fonksiyonun tersini bulmak ve ters fonksiyon değeri hesaplamak.
5. Doğrusal fonksiyonları verilen iki noktadan yazmak.
:::

:::ipucu
Fonksiyon sorusunda **kuralı bulmadan önce hangi değerin istendiğine bak**. Çoğu zaman $f(x)$ kuralını tam çıkarmak gerekmez, istenen değer için gereken $x$'i bulmak yeter. Gereksiz işlem hata yapma ihtimalini artırır.
:::

## 1. Fonksiyon nedir?

$A$ ve $B$ boş olmayan iki küme olsun. $A$'nın **her elemanını** $B$'nin **yalnızca bir elemanıyla** eşleyen kurala fonksiyon denir ve $f: A \to B$ yazılır.

![A kümesindeki 1, 2, 3 elemanları B kümesindeki 3, 5, 7 elemanlarına f(x) = 2x + 1 kuralıyla eşleniyor](/lessons/tyt-mat/fonksiyon-eslesme.svg "Bir fonksiyon eşlemesi | Yolumnet")

Bir eşlemenin fonksiyon olması için iki şart vardır:

- $A$'da **eşlenmemiş eleman kalmamalı**.
- $A$'nın bir elemanı $B$'de **birden çok elemana** gitmemeli.

$B$'de eşleşmeyen eleman kalabilir. Bu bir sorun değildir. İki farklı elemanın aynı değere gitmesi de olabilir.

| Küme | Adı |
| --- | --- |
| $A$ | Tanım kümesi |
| $B$ | Değer kümesi |
| $f(A) = \{f(x) \mid x \in A\}$ | Görüntü kümesi |

Görüntü kümesi, değer kümesinin alt kümesidir ve fonksiyonun **gerçekten aldığı** değerleri içerir.

## 2. Fonksiyon değeri hesaplama

$f(x) = 2x + 1$ için $f(3) = 2 \cdot 3 + 1 = 7$ olur. $x$ yerine ne yazılırsa her yerde o yazılır: $f(a + 1) = 2(a + 1) + 1 = 2a + 3$.

### $f(ax + b)$ biçimli ifadelerden değer bulma

**Örnek.** $f(x + 2) = 3x - 1$ ise $f(7)$ kaçtır?

$f$'in içi 7 olmalı: $x + 2 = 7$ ve $x = 5$. Bu $x$ değeri verilen kuralda yerine yazılır: $f(7) = 3 \cdot 5 - 1 = 14$.

Bu yöntem **kuralı tam bulmadan** işi çözer. Kuralı bulmak istersen $t = x + 2$ yazıp $x = t - 2$ yerine koyabilirsin: $f(t) = 3(t - 2) - 1 = 3t - 7$ ve $f(7) = 14$.

## 3. Bileşke fonksiyon

$f$ ve $g$ iki fonksiyon olsun. **Önce $g$, sonra $f$** uygulanırsa bileşke elde edilir:

$$(f \circ g)(x) = f(g(x))$$

**Sıra önemlidir.** $(f \circ g)(x)$ ile $(g \circ f)(x)$ genellikle farklıdır.

**Örnek.** $f(x) = 3x + 2$ ve $g(x) = x^2 - 4$ olsun.

- $(g \circ f)(1) = g(f(1)) = g(5) = 25 - 4 = 21$.
- $(f \circ g)(1) = f(g(1)) = f(-3) = -9 + 2 = -7$.

İki sonuç farklıdır. "$f \circ g$" okurken **sağdaki fonksiyon önce** çalışır.

## 4. Ters fonksiyon

$f$ birebir ve örten ise $f^{-1}$ ters fonksiyonu vardır ve şunu sağlar:

$$f(a) = b \iff f^{-1}(b) = a$$

**Ters fonksiyonu bulma yöntemi:**

1. $y = f(x)$ yaz.
2. $x$'i $y$ cinsinden çöz.
3. $x$ ile $y$'nin yerini değiştir.

**Örnek.** $f(x) = 4x - 8$ ise $y = 4x - 8$ ve $x = \dfrac{y + 8}{4}$. Yerleri değiştirirsek $f^{-1}(x) = \dfrac{x + 8}{4}$.

Kontrol: $f(5) = 12$ ve $f^{-1}(12) = \dfrac{20}{4} = 5$. Ters fonksiyon, fonksiyonun yaptığını geri alır.

**Kestirme.** $f^{-1}(b)$ değeri soruluyorsa $f(x) = b$ denklemini çöz. Bu kuralı bulmadan çözümü verir.

## 5. Doğrusal fonksiyon

$f(x) = ax + b$ biçimindeki fonksiyonlara doğrusal fonksiyon denir. İki değer bilinirse kural yazılır.

**Örnek.** $f(0) = 2$ ve $f(1) = 5$ olan doğrusal fonksiyonu bulalım. $b = f(0) = 2$. $f(1) = a + 2 = 5$ ve $a = 3$. Kural $f(x) = 3x + 2$.

Eğim iki nokta arasındaki değişimdir: $a = \dfrac{f(x_2) - f(x_1)}{x_2 - x_1}$.

:::ipucu{baslik="Sık yapılan hata"}
$f(g(x))$ ile $f(x) \cdot g(x)$ ifadesini karıştırmak yaygındır. Bileşkede $g(x)$'in sonucu $f$'in **içine** yazılır, çarpılmaz. $f(x) = x + 1$ ve $g(x) = 2x$ için $f(g(x)) = 2x + 1$ iken $f(x) \cdot g(x) = 2x(x + 1)$ olur.
:::

:::baglanti
Fonksiyonun tersi, "Denklem Çözme" konusundaki bir denklemi tersine çözme işine benzer. $f(x) = b$ denklemini çözdüğünde $f^{-1}(b)$'yi bulursun. Ayrıca doğrusal fonksiyon, "Analitik Geometri" konusundaki doğru denklemidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Fonksiyon | $A$'nın her elemanı $B$'de bir tek elemana gider |
| $f(ax+b)$ verilmişse | İçi istenen değere eşitle, $x$'i bul |
| $f \circ g$ | Önce $g$, sonra $f$ |
| Ters fonksiyon | $y = f(x)$'ten $x$'i çöz, yer değiştir |
| $f^{-1}(b)$ | $f(x) = b$ denkleminin çözümü |
| Doğrusal | $f(x) = ax + b$, $a$ eğim, $b = f(0)$ |

## Mini test

:::soru{cevap="B"}
$f(2x - 1) = 6x + 4$ olduğuna göre $f(5)$ kaçtır?

- A) 16
- B) 22
- C) 23
- D) 28
- E) 34

---

1. $f$'in içi 5 olmalı: $2x - 1 = 5$ ve $x = 3$.
2. $x = 3$ kuralda yerine yazılır: $f(5) = 6 \cdot 3 + 4 = 22$. Doğru cevap B.

Diğer şıklar: **16** $2x - 1 = 5$ den $x = 2$ bulunmuş / **23** işlem hatasıyla bir fazla bulunmuş / **28** $2x - 1 = 5$ den $x = 4$ bulunmuş / **34** 5, $6x + 4$ te doğrudan yerine yazılmış.
:::

:::soru{cevap="D"}
$f(x) = 2x + 3$ ve $g(x) = x^2 - 1$ olduğuna göre $(g \circ f)(1) - (f \circ g)(1)$ farkı kaçtır?

- A) -21
- B) 3
- C) 5
- D) 21
- E) 24

---

1. $f(1) = 5$ ve $(g \circ f)(1) = g(5) = 25 - 1 = 24$.
2. $g(1) = 0$ ve $(f \circ g)(1) = f(0) = 3$.
3. Fark $24 - 3 = 21$. Doğru cevap D.

Diğer şıklar: **-21** fark ters sırada alınmış / **3** yalnızca $(f \circ g)(1)$ bulunmuş / **5** $f(1)$ alınmış / **24** yalnızca $(g \circ f)(1)$ bulunmuş.
:::

:::soru{cevap="C"}
$f(x) = \dfrac{2x + 5}{x - 1}$ olduğuna göre $f^{-1}(3)$ değeri kaçtır?

- A) 2
- B) 3
- C) 8
- D) 9
- E) 11

---

1. $f^{-1}(3) = a$ ise $f(a) = 3$ olur. $\dfrac{2a + 5}{a - 1} = 3$.
2. İçler dışlar: $2a + 5 = 3a - 3$ ve $a = 8$.
3. Kontrol: $f(8) = \dfrac{21}{7} = 3$. Doğru cevap C.

Diğer şıklar: **2** paydadaki $3 - 1$ sonuç sanılmış / **3** değer, argüman sanılmış / **9** işlem hatasıyla bir fazla bulunmuş / **11** $f(3)$ ün payı alınmış.
:::

:::soru{cevap="B"}
$f$ doğrusal bir fonksiyondur. $f(1) = 5$ ve $f(3) = 11$ olduğuna göre $f(f(2))$ değeri kaçtır?

- A) 16
- B) 26
- C) 27
- D) 29
- E) 32

---

1. Eğim $\dfrac{11 - 5}{3 - 1} = 3$ ve $f(x) = 3x + b$. $f(1) = 3 + b = 5$ ise $b = 2$. Kural $f(x) = 3x + 2$.
2. $f(2) = 8$.
3. $f(f(2)) = f(8) = 3 \cdot 8 + 2 = 26$. Doğru cevap B.

Diğer şıklar: **16** $2 \cdot f(2)$ hesaplanmış / **27** işlem hatasıyla bir fazla bulunmuş / **29** kural $3x + 5$ alınmış / **32** $f(10)$ hesaplanmış.
:::

## Kendini dene

:::dene
1. $f(x) = x^2 - 3x$ ise $f(4)$ kaçtır? => $16 - 12 = 4$.
2. $f(x - 1) = 2x + 5$ ise $f(3)$ kaçtır? => $x - 1 = 3$ ve $x = 4$. $f(3) = 2 \cdot 4 + 5 = 13$.
3. $f(x) = x + 4$ ve $g(x) = 3x$ ise $(f \circ g)(2)$ kaçtır? => $g(2) = 6$ ve $f(6) = 10$.
4. $f(x) = 2x - 6$ ise $f^{-1}(8)$ kaçtır? => $2x - 6 = 8$ ve $x = 7$.
5. Doğrusal bir $f$ için $f(2) = 7$ ve $f(5) = 16$ ise $f(0)$ kaçtır? => Eğim $\dfrac{16 - 7}{5 - 2} = 3$. $f(0) = 7 - 3 \cdot 2 = 1$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'tyt-mat' and name = 'Fonksiyonlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fonksiyon kavramı, tanım ve değer kümesi, fonksiyon değeri, f(ax+b) türü sorular, bileşke, ters fonksiyon, doğrusal fonksiyon. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Birebir ve örten kavramları kısaca geçildi, ayrıntılı sorular için ek bir anlatım gerekebilir, (b) Mini test 4. soruda "14" şıkkının gerekçesi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Fonksiyonlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ifadeyi $x$'in kuvvetlerinin toplamı biçiminde yazmak, ilk bakışta soyut görünür. Ama bir fonksiyonun grafiğini çizmek, bir denklemin köklerini bulmak ya da bir eğri hesaplamak için hep polinomlarla çalışırsın. TYT'de polinom soruları **değer bulma kısayolları** ile çözülür: $P(1)$, $P(0)$ ve kalan teoremi. Bu konuda polinom kavramını, derece ve katsayıları, polinomlarla işlemleri, bölmeyi ve kalan teoremini öğreneceksin.

:::hedefler
1. Polinom, derece, katsayı ve sabit terim kavramlarını kullanmak.
2. $P(1)$ ve $P(0)$ ile katsayılar toplamı ve sabit terimi bulmak.
3. İki polinomu toplamak, çıkarmak ve çarpmak.
4. Polinom bölmesinde bölüm, bölen ve kalan ilişkisini kurmak.
5. Kalan teoremini ve çarpan teoremini uygulamak.
:::

:::ipucu
Polinom sorularında **işlemi yapmadan değer bulmak** en hızlı yoldur. Katsayılar toplamı için $x = 1$ yaz. Sabit terim için $x = 0$ yaz. Bir $(x - a)$ ile bölümünden kalan için $x = a$ yaz. Çoğu soru bu üç kısayolla çözülür.
:::

## 1. Polinom nedir?

$n$ negatif olmayan tam sayı olmak üzere

$$P(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_1 x + a_0$$

biçimindeki ifadeye **polinom** denir. $a_n \neq 0$ ise en büyük üs $n$ polinomun **derecesidir** ($d[P] = n$). $a_i$'ler **katsayı**, $a_0$ **sabit terimdir**.

Polinom olmayan ifadeler: $x^{-2} + 3$ (negatif üs), $\sqrt{x} + 1$ (kesirli üs), $\dfrac{1}{x} + x$ ($x$ paydada).

**Örnek.** $P(x) = 3x^3 - 2x^2 + x - 5$ üçüncü derecedendir. Başkatsayı 3, sabit terim $-5$'tir.

## 2. Kısayollar: $P(1)$ ve $P(0)$

| Ne isteniyor? | Ne yapılır? | $P(x) = 3x^3 - 2x^2 + x - 5$ için |
| --- | --- | --- |
| Katsayılar toplamı | $P(1)$ | $3 - 2 + 1 - 5 = -3$ |
| Sabit terim | $P(0)$ | $-5$ |
| Çift dereceli terimlerin katsayıları toplamı | $\dfrac{P(1) + P(-1)}{2}$ | $\dfrac{-3 + (-11)}{2} = -7$ |
| Tek dereceli terimlerin katsayıları toplamı | $\dfrac{P(1) - P(-1)}{2}$ | $\dfrac{-3 - (-11)}{2} = 4$ |

Burada $P(-1) = -3 - 2 - 1 - 5 = -11$.

**$P(ax + b)$ için aynı kısayol.** $P(2x - 1)$ polinomunun katsayılar toplamı için $x = 1$ yazarsın: $P(2 \cdot 1 - 1) = P(1)$. Sabit terimi için $x = 0$ yazarsın: $P(-1)$.

## 3. Polinomlarla işlemler

**Toplama ve çıkarma:** Aynı dereceli terimler birbiriyle işleme girer.

**Çarpma:** Her terim, diğer polinomun her terimiyle çarpılır, benzer terimler toplanır. **Örnek.** $(x^2 + 3x - 1)(x - 2)$:

$$x^3 - 2x^2 + 3x^2 - 6x - x + 2 = x^3 + x^2 - 7x + 2$$

Dereceler şöyle davranır: $d[P \cdot Q] = d[P] + d[Q]$ ve $d[P + Q] \leq \max(d[P], d[Q])$.

## 4. Polinom bölmesi

$P(x)$ polinomu $B(x)$'e bölündüğünde bölüm $Q(x)$ ve kalan $K(x)$ ise

$$P(x) = B(x) \cdot Q(x) + K(x)$$

yazılır. Kalanın derecesi, bölenin derecesinden **küçüktür**: $d[K] < d[B]$. Bölenin derecesi 1 ise kalan sabit sayıdır. Bölenin derecesi 2 ise kalan en çok birinci dereceden olur ($ax + b$).

**Dereceler:** $d[Q] = d[P] - d[B]$.

## 5. Kalan teoremi ve çarpan teoremi

**Kalan teoremi.** $P(x)$ polinomunun $(x - a)$ ile bölümünden kalan $P(a)$'dır.

**Örnek.** $P(x) = x^3 - 4x^2 + 5$ polinomunun $(x - 3)$ ile bölümünden kalan $P(3) = 27 - 36 + 5 = -4$ olur.

**Çarpan teoremi.** $(x - a)$, $P(x)$'in çarpanıdır ancak ve ancak $P(a) = 0$ ise. Yani kalan sıfırsa bölünebilir.

**Örnek.** $x^3 - 6x^2 + 11x - 6$ polinomunda $P(1) = 1 - 6 + 11 - 6 = 0$, $P(2) = 8 - 24 + 22 - 6 = 0$, $P(3) = 27 - 54 + 33 - 6 = 0$. Üçü de kök olduğundan polinom $(x - 1)(x - 2)(x - 3)$'e eşittir.

**Bölen birinci dereceden değilse.** $x^2 - 3x + 2 = (x - 1)(x - 2)$ gibi çarpanlı bölende kalan $ax + b$ biçimindedir. $P(1)$ ve $P(2)$ değerleri bilinirse $a$ ve $b$ iki denklemle bulunur.

:::ipucu{baslik="Sık yapılan hata"}
$(x + 3)$ ile bölümünden kalan için $P(3)$ yazmak yanlıştır. $x + 3 = x - (-3)$ olduğundan kalan $P(-3)$'tür. Böleni sıfır yapan $x$ değerini yaz: $x + 3 = 0$ ise $x = -3$.
:::

:::baglanti
Bir polinomun köklerini bulmak, "İkinci Dereceden Denklemler" konusunun genelleştirilmiş hâlidir. $x^2 - 3x + 2 = 0$ denkleminin kökleri 1 ve 2 ise polinom $(x - 1)(x - 2)$ biçiminde çarpanlara ayrılır. Kök ve çarpan arasındaki bu bağ burada da geçerlidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Katsayılar toplamı | $P(1)$ |
| Sabit terim | $P(0)$ |
| $P(ax+b)$'nin katsayılar toplamı | $x = 1$ yaz |
| Bölme | $P = B \cdot Q + K$, $d[K] < d[B]$ |
| Kalan teoremi | $(x - a)$ ile kalan $P(a)$ |
| Çarpan teoremi | $P(a) = 0 \iff (x - a)$ çarpan |
| Derece | $d[P \cdot Q] = d[P] + d[Q]$ |

## Mini test

:::soru{cevap="B"}
$P(x) = x^3 - 2x^2 + 5x + 3$ olduğuna göre $P(2x - 1)$ polinomunun katsayıları toplamı kaçtır?

- A) 3
- B) 7
- C) 11
- D) 13
- E) 27

---

1. $P(2x - 1)$ polinomunun katsayıları toplamı, $x = 1$ yazılınca bulunur.
2. $x = 1$ için $P(2 \cdot 1 - 1) = P(1)$.
3. $P(1) = 1 - 2 + 5 + 3 = 7$. Doğru cevap B.

Diğer şıklar: **3** $P(x)$ in sabit terimi alınmış / **11** $-2x^2$ teriminin katsayısı $+2$ alınmış / **13** $x = 2$ yazılmış / **27** $x = 3$ yazılmış.
:::

:::soru{cevap="A"}
$P(x) = x^3 + ax^2 - 4x + 6$ polinomunun $(x - 2)$ ile bölümünden kalan 10 olduğuna göre $a$ kaçtır?

- A) 1
- B) 2
- C) 4
- D) 6
- E) 10

---

1. Kalan teoremi: $(x - 2)$ ile bölümünden kalan $P(2)$'dir.
2. $P(2) = 8 + 4a - 8 + 6 = 4a + 6 = 10$.
3. $4a = 4$ ve $a = 1$. Doğru cevap A.

Diğer şıklar: **2** bölen $x - 2$ nin kökü alınmış / **4** $4a = 4$ denkleminin sağ tarafı alınmış / **6** $P(0)$ sabit terimi alınmış / **10** kalan sonuç sanılmış.
:::

:::soru{cevap="E"}
$P(x) = x^3 + px^2 + qx - 12$ polinomu $(x - 2)$ ve $(x + 3)$ ile tam bölünebildiğine göre $p - q$ değeri kaçtır?

- A) -7
- B) -4
- C) -1
- D) 3
- E) 7

---

1. $P(2) = 8 + 4p + 2q - 12 = 0$ ise $2p + q = 2$.
2. $P(-3) = -27 + 9p - 3q - 12 = 0$ ise $3p - q = 13$.
3. İki denklemi toplayınca $5p = 15$, $p = 3$ ve $q = -4$.
4. $p - q = 3 - (-4) = 7$. Doğru cevap E.

Diğer şıklar: **-7** $q - p$ hesaplanmış / **-4** yalnızca $q$ bulunmuş / **-1** $p + q$ hesaplanmış / **3** yalnızca $p$ bulunmuş.
:::

:::soru{cevap="C"}
$P(x)$ polinomunun $(x - 1)$ ile bölümünden kalan 5, $(x - 2)$ ile bölümünden kalan 9'dur. Buna göre $P(x)$ polinomunun $x^2 - 3x + 2$ ile bölümünden kalan polinom $R(x)$ için $R(3)$ kaçtır?

- A) 5
- B) 9
- C) 13
- D) 15
- E) 27

---

1. $x^2 - 3x + 2 = (x - 1)(x - 2)$ olduğundan kalan $R(x) = ax + b$ biçimindedir.
2. $P(1) = R(1) = a + b = 5$ ve $P(2) = R(2) = 2a + b = 9$.
3. İki denklemi çıkar: $a = 4$ ve $b = 1$. $R(x) = 4x + 1$.
4. $R(3) = 13$. Doğru cevap C.

Diğer şıklar: **5** $P(1)$ alınmış / **9** $P(2)$ alınmış / **15** $5 \cdot 3$ hesaplanmış / **27** $9 \cdot 3$ hesaplanmış.
:::

## Kendini dene

:::dene
1. $P(x) = x^2 + 4x - 7$ ise $P(2)$ kaçtır? => $4 + 8 - 7 = 5$.
2. $P(x) = 2x^3 + x - 4$ polinomunun katsayılar toplamı kaçtır? => $P(1) = 2 + 1 - 4 = -1$.
3. $P(x) = x^3 + 2x - 5$ polinomunun $(x - 1)$ ile bölümünden kalan kaçtır? => $P(1) = 1 + 2 - 5 = -2$.
4. $P(x)$ polinomu $(x + 2)$ ile tam bölünüyorsa $P(-2)$ kaçtır? => 0.
5. $d[P] = 4$ ve $d[Q] = 2$ ise $d[P \cdot Q]$ ve $d[P + Q]$ nedir? => $d[P \cdot Q] = 6$ ve $d[P + Q] = 4$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 13, false from public.topics where subject_id = 'tyt-mat' and name = 'Polinomlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Polinom, derece, katsayı, işlemler, polinom bölmesi, kalan teoremi, çarpan teoremi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Yatay bölme algoritması gösterimi yer almadı, istenirse eklenebilir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Polinomlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bahçenin alanı verilip kenar uzunluğu sorulduğunda, bir topun havada kaç saniye kaldığı hesaplandığında ya da iki sayının çarpımı ve toplamı bilinip sayıların kendisi istendiğinde ikinci dereceden bir denklem ortaya çıkar. TYT'de bu konunun soruları üç beceriye dayanır: Denklemin köklerini bulmak, kökler hakkında **denklemi çözmeden** bilgi vermek ve kökleri bilinen denklemi yazmak.

:::hedefler
1. İkinci dereceden denklemi çarpanlara ayırarak ve formülle çözmek.
2. $\Delta$ (diskriminant) ile köklerin sayısını ve türünü belirlemek.
3. Kökler toplamı ve çarpımı formüllerini kullanmak.
4. Köklerin simetrik ifadelerini denklemi çözmeden hesaplamak.
5. Kökleri verilen ikinci dereceden denklemi kurmak.
:::

:::ipucu
Soruda **kökleri tek tek bulman istenmiyorsa** bulma. $x_1 + x_2 = -\dfrac{b}{a}$ ve $x_1 \cdot x_2 = \dfrac{c}{a}$ çoğu zaman işi yarım satırda bitirir. Önce istenen ifadeyi toplam ve çarpım cinsinden yazmaya bak.
:::

## 1. Genel biçim ve çözüm yolları

$a \neq 0$ olmak üzere

$$ax^2 + bx + c = 0$$

denklemine ikinci dereceden bir bilinmeyenli denklem denir. Denklemi sağlayan $x$ değerleri **köklerdir**. İkinci dereceden denklemin en çok iki reel kökü olur.

**Yol 1: Çarpanlara ayırma.** $x^2 - 5x + 6 = 0$ denkleminde çarpımı 6, toplamı $-5$ olan iki sayı $-2$ ve $-3$'tür. Denklem $(x - 2)(x - 3) = 0$ olur. Çarpım sıfırsa çarpanlardan biri sıfırdır. Kökler 2 ve 3'tür.

**Yol 2: Formül.** Çarpanlara ayırmak zor olduğunda

$$\Delta = b^2 - 4ac, \qquad x_{1,2} = \frac{-b \pm \sqrt{\Delta}}{2a}$$

formülü kullanılır. **Örnek.** $2x^2 + 3x - 5 = 0$ için $\Delta = 9 + 40 = 49$ ve

$$x = \frac{-3 \pm 7}{4} \Rightarrow x_1 = 1, \quad x_2 = -\frac{5}{2}$$

## 2. Diskriminant köklerin türünü söyler

![a pozitifken üç parabol. Delta sıfırdan büyükse x eksenini iki noktada, sıfıra eşitse tek noktada keser, sıfırdan küçükse hiç kesmez](/lessons/tyt-mat/diskriminant-parabol.svg "Diskriminant ve kökler | Yolumnet")

| Durum | Kökler |
| --- | --- |
| $\Delta > 0$ | İki farklı reel kök |
| $\Delta = 0$ | Eşit iki reel kök (çakışık kök), $x = -\dfrac{b}{2a}$ |
| $\Delta < 0$ | Reel kök yok |

Parametreli sorularda genellikle $\Delta$ üzerinden bir eşitlik ya da eşitsizlik kurulur. **Örnek.** $x^2 - 4x + m = 0$ denkleminin reel kökü olmaması için $\Delta = 16 - 4m < 0$ olmalıdır, yani $m > 4$.

:::ipucu{baslik="Sık yapılan hata"}
$\Delta$ hesaplarken $b^2$'yi $b$ negatif olduğunda da pozitif al. $b = -5$ ise $b^2 = 25$'tir, $-25$ değildir. Ayrıca $x = \dfrac{-b \pm \sqrt{\Delta}}{2a}$ formülünde payın tamamı $2a$'ya bölünür, yalnızca kök değil.
:::

## 3. Kökler toplamı ve çarpımı

Kökler $x_1$ ve $x_2$ ise formülle ve toplama ile çarpma yapılarak şu sonuçlar bulunur:

$$x_1 + x_2 = -\frac{b}{a}, \qquad x_1 \cdot x_2 = \frac{c}{a}, \qquad |x_1 - x_2| = \frac{\sqrt{\Delta}}{|a|}$$

**Örnek.** $x^2 - 5x + 6 = 0$ için toplam 5, çarpım 6, fark $\sqrt{25 - 24} = 1$. Gerçekten $3 + 2 = 5$, $3 \cdot 2 = 6$, $3 - 2 = 1$.

**Kökleri bulmadan hesaplama.** Köklerin simetrik ifadeleri toplam ve çarpım cinsinden yazılır:

| İfade | Toplam ($T$) ve çarpım ($Ç$) cinsinden |
| --- | --- |
| $x_1^2 + x_2^2$ | $T^2 - 2Ç$ |
| $\dfrac{1}{x_1} + \dfrac{1}{x_2}$ | $\dfrac{T}{Ç}$ |
| $(x_1 - x_2)^2$ | $T^2 - 4Ç$ |
| $x_1^3 + x_2^3$ | $T^3 - 3TÇ$ |

**Örnek.** $x^2 - 6x + 4 = 0$ için $T = 6$ ve $Ç = 4$. Bu durumda $x_1^2 + x_2^2 = 36 - 8 = 28$ ve $\dfrac{1}{x_1} + \dfrac{1}{x_2} = \dfrac{6}{4} = \dfrac{3}{2}$.

## 4. Özel durumlar

Katsayılara bakarak kökler hakkında hızlı karar verilebilir:

| Koşul | Sonuç |
| --- | --- |
| $c = 0$ | Köklerden biri 0 |
| $b = 0$ | Kökler toplamı 0, kökler birbirinin zıt işaretlisi |
| $a + b + c = 0$ | Köklerden biri 1 |
| $a - b + c = 0$ | Köklerden biri $-1$ |
| $a = c$ | Kökler çarpımı 1, kökler birbirinin çarpma işlemine göre tersi |
| $a \cdot c < 0$ | $\Delta > 0$, kökler zıt işaretli |

$2x^2 + 3x - 5 = 0$ denkleminde $2 + 3 - 5 = 0$ olduğundan 1 köktür. Diğer kök çarpımdan bulunur: $1 \cdot x_2 = -\dfrac{5}{2}$.

## 5. Kökleri verilen denklemi kurmak

Kökleri $x_1$ ve $x_2$ olan ikinci dereceden denklem

$$x^2 - (x_1 + x_2)\,x + x_1 \cdot x_2 = 0$$

biçimindedir. **Örnek.** Kökleri 3 ve $-2$ olan denklemde toplam 1, çarpım $-6$'dır. Denklem $x^2 - x - 6 = 0$ olur. Kontrol: $x = 3$ için $9 - 3 - 6 = 0$ ve $x = -2$ için $4 + 2 - 6 = 0$.

**Köklerle oynanan denklemler.** Verilen denklemin köklerinin 2 fazlası gibi yeni kökler isteniyorsa yeni toplam ve yeni çarpım eski toplam ve çarpımdan hesaplanır. Kökler tek tek bulunmaz.

:::baglanti
Bir polinomun kökü, o polinomun bir çarpanını verir. İkinci dereceden denklemde kökler $x_1$ ve $x_2$ ise $ax^2 + bx + c = a(x - x_1)(x - x_2)$ yazılır. "Polinomlar" konusundaki çarpan teoremi bu bağlantıyı genel hâle getirir. Üçüncü dereceden bir polinomda da kök bulunursa polinom çarpanlarına ayrılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Diskriminant | $\Delta = b^2 - 4ac$ |
| Kökler | $x = \dfrac{-b \pm \sqrt{\Delta}}{2a}$ |
| Toplam ve çarpım | $-\dfrac{b}{a}$ ve $\dfrac{c}{a}$ |
| $x_1^2 + x_2^2$ | $T^2 - 2Ç$ |
| Denklem kurma | $x^2 - Tx + Ç = 0$ |
| Kök 1 ise | $a + b + c = 0$ |
| Reel kök yok | $\Delta < 0$ |

## Mini test

:::soru{cevap="D"}
$x^2 - (m + 1)x + 12 = 0$ denkleminin köklerinden biri 3 olduğuna göre $m$ kaçtır?

- A) -8
- B) 3
- C) 4
- D) 6
- E) 7

---

1. Kök denklemi sağlar: $3^2 - 3(m + 1) + 12 = 0$.
2. $21 - 3(m + 1) = 0$ ise $m + 1 = 7$.
3. $m = 6$. Kontrol: Çarpım 12 olduğundan diğer kök 4, toplam $3 + 4 = 7 = m + 1$. Doğru cevap D.

Diğer şıklar: **-8** kökler toplamı $-(m + 1)$ alınmış / **3** verilen kök alınmış / **4** diğer kök bulunmuş / **7** kökler toplamı $m + 1$ yerine $m$ alınmış.
:::

:::soru{cevap="C"}
$x^2 - 6x + (k + 2) = 0$ denkleminin eşit iki reel kökü olduğuna göre $k$ kaçtır?

- A) 3
- B) 6
- C) 7
- D) 9
- E) 11

---

1. Eşit iki reel kök için $\Delta = 0$.
2. $\Delta = (-6)^2 - 4 \cdot 1 \cdot (k + 2) = 36 - 4(k + 2) = 0$.
3. $k + 2 = 9$ ve $k = 7$. Doğru cevap C.

Diğer şıklar: **3** çakışık kök bulunmuş / **6** işlem hatasıyla bir eksik bulunmuş / **9** $k + 2$ ifadesi 9 bulunup $k$ sanılmış / **11** $k + 2 = 9$ denkleminde 2 çıkarılacağı yerde eklenmiş.
:::

:::soru{cevap="B"}
$x^2 - 5x + 3 = 0$ denkleminin kökleri $x_1$ ve $x_2$ olduğuna göre $x_1^2 + x_2^2$ kaçtır?

- A) 8
- B) 19
- C) 22
- D) 25
- E) 31

---

1. Kökler toplamı $x_1 + x_2 = 5$, çarpımı $x_1 \cdot x_2 = 3$.
2. $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1x_2 = 25 - 6 = 19$. Doğru cevap B.

Diğer şıklar: **8** kökler toplamı ile çarpımı toplanmış / **22** $2x_1x_2$ yerine $x_1x_2$ çıkarılmış / **25** kökler toplamının karesi alınmış / **31** $T^2 - 2Ç$ yerine $T^2 + 2Ç$ yazılmış.
:::

:::soru{cevap="D"}
$x^2 - 4x - 7 = 0$ denkleminin köklerinin 2 fazlası kök kabul eden ikinci dereceden denklem aşağıdakilerden hangisidir?

- A) $x^2 - 6x + 5 = 0$
- B) $x^2 - 8x - 3 = 0$
- C) $x^2 + 8x + 5 = 0$
- D) $x^2 - 8x + 5 = 0$
- E) $x^2 - 8x - 5 = 0$

---

1. Eski kökler için toplam 4, çarpım $-7$.
2. Yeni kökler $x_1 + 2$ ve $x_2 + 2$. Yeni toplam $4 + 4 = 8$.
3. Yeni çarpım $x_1x_2 + 2(x_1 + x_2) + 4 = -7 + 8 + 4 = 5$.
4. Denklem $x^2 - 8x + 5 = 0$. Doğru cevap D.

Diğer şıklar: **$x^2 - 6x + 5 = 0$** toplam için yalnızca 4 + 2 yapılmış / **$x^2 - 8x - 3 = 0$** çarpımda $2(x_1 + x_2)$ terimi unutulmuş / **$x^2 + 8x + 5 = 0$** toplam işareti hatalı yazılmış / **$x^2 - 8x - 5 = 0$** çarpıma yalnızca 2 eklenmiş.
:::

## Kendini dene

:::dene
1. $x^2 - 9x + 20 = 0$ denkleminin kökleri nedir? => $(x - 4)(x - 5) = 0$ olduğundan 4 ve 5.
2. $3x^2 - 2x - 8 = 0$ denkleminin kökler çarpımı kaçtır? => $\dfrac{c}{a} = -\dfrac{8}{3}$.
3. $x^2 + 4x + n = 0$ denkleminin iki farklı reel kökü olması için $n$ hangi aralıkta olmalıdır? => $\Delta = 16 - 4n > 0$ ise $n < 4$.
4. Kökleri 1 ve 6 olan ikinci dereceden denklemi yaz. => $x^2 - 7x + 6 = 0$.
5. $x^2 - 3x - 10 = 0$ denkleminin kökleri $x_1$ ve $x_2$ ise $\dfrac{1}{x_1} + \dfrac{1}{x_2}$ kaçtır? => $\dfrac{T}{Ç} = \dfrac{3}{-10} = -\dfrac{3}{10}$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'İkinci Dereceden Denklemler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İkinci dereceden denklem, diskriminant, kökler toplamı ve çarpımı, simetrik ifadeler, denklem kurma, özel durumlar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: Parabol grafiği ve işaret tablosu ayrı konuda (AYT) işlendiği için burada yer almadı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'İkinci Dereceden Denklemler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sınıfta 5 kişilik bir sıra kaç farklı şekilde oluşturulur, 8 kişiden 3 kişilik bir ekip kaç farklı biçimde seçilir? Bu soruların cevabını tek tek yazarak bulmak mümkün değildir. **Saymanın kuralları** bunu birkaç çarpmayla çözer. TYT'de bu konuda iki karar vardır: **Sıra önemli mi** ve **elemanlar birbirinden farklı mı**. Bu konuda toplama ve çarpma kurallarını, permütasyonu, kombinasyonu ve özel durumları öğreneceksin.

:::hedefler
1. Toplama ve çarpma kuralını ayırt edip kullanmak.
2. Faktöriyel kavramını ve $P(n, r)$ değerini hesaplamak.
3. Sıra önemsiz seçimlerde $C(n, r)$ değerini hesaplamak.
4. Tekrarlı ve dairesel sıralamaları hesaplamak.
5. "En az" ve "yan yana" koşullarını sayma yöntemleriyle çözmek.
:::

:::ipucu
Soruyu okuyunca kendine tek bir şey sor: **Seçilenlerin sırası değişince yeni bir durum oluşuyor mu?** Evet ise permütasyon, hayır ise kombinasyon. Başkan ile başkan yardımcısı seçmek sıralıdır. Aynı kişilerden bir ekip kurmak sırasızdır.
:::

## 1. Sayma kuralları

**Çarpma kuralı.** Bir iş ardışık $k$ aşamada yapılıyor ve aşamalar sırayla $n_1, n_2, \ldots, n_k$ farklı biçimde gerçekleşiyorsa iş $n_1 \cdot n_2 \cdots n_k$ biçimde yapılır. "Ve" geçen durumlarda çarparsın.

**Toplama kuralı.** İş, birbirini engelleyen iki ayrı yoldan biriyle yapılıyorsa seçenekler toplanır. "Ya da" geçen durumlarda toplarsın.

![Üç gömlek ve iki pantolondan altı kombin elde edildiğini gösteren ağaç diyagramı](/lessons/tyt-mat/sayma-agac.svg "Çarpma kuralı | Yolumnet")

**Örnek.** 3 gömlek ve 2 pantolonla $3 \cdot 2 = 6$ farklı kombin yapılır. Her gömlek için pantolon seçimi bağımsız olduğundan sayılar çarpılır.

## 2. Faktöriyel

$n$ doğal sayı olmak üzere

$$n! = n \cdot (n-1) \cdot (n-2) \cdots 2 \cdot 1, \qquad 0! = 1, \quad 1! = 1$$

**Örnek.** $5! = 120$ ve $\dfrac{6!}{4!} = 6 \cdot 5 = 30$. Faktöriyelli bir kesri sadeleştirirken büyük faktöriyeli, küçük faktöriyel görünene kadar aç.

## 3. Permütasyon (sıralama)

$n$ farklı elemandan $r$ tanesi **sıralı** seçilirse

$$P(n, r) = \frac{n!}{(n - r)!} = n(n-1)\cdots(n - r + 1)$$

**Örnek.** 6 kişiden başkan ve başkan yardımcısı $P(6, 2) = 6 \cdot 5 = 30$ biçimde seçilir. Tüm elemanlar sıralanıyorsa $P(n, n) = n!$ olur: 5 kişi bir sırada $5! = 120$ farklı biçimde dizilir.

## 4. Kombinasyon (seçme)

$n$ farklı elemandan $r$ tanesi **sırasız** seçilirse

$$C(n, r) = \binom{n}{r} = \frac{n!}{r!\,(n - r)!}$$

Bu formül, permütasyonun $r!$ sıralamaya bölünmüş hâlidir. Seçilen $r$ kişinin sırası önemsiz olduğundan aynı ekip $r!$ kez sayılmıştır.

**Örnek.** 8 kişiden 3 kişilik komite $C(8, 3) = \dfrac{8 \cdot 7 \cdot 6}{3 \cdot 2 \cdot 1} = 56$ biçimde seçilir.

**Özellikler:**

| Özellik | Örnek |
| --- | --- |
| $C(n, 0) = C(n, n) = 1$ | $C(7, 0) = 1$ |
| $C(n, r) = C(n, n - r)$ | $C(7, 3) = C(7, 4) = 35$ |
| $C(n, 1) = n$ | $C(9, 1) = 9$ |
| $C(n, r) + C(n, r + 1) = C(n + 1, r + 1)$ | $C(5, 2) + C(5, 3) = C(6, 3) = 20$ |

## 5. Özel durumlar

**Tekrarlı permütasyon.** $n$ elemanın içinde $a$ tanesi birbirinin aynı, $b$ tanesi birbirinin aynı ise dizilişlerin sayısı

$$\frac{n!}{a!\,b!}$$

**Örnek.** ANKARA kelimesinin harfleriyle 6 harfli anlamlı ya da anlamsız kelimelerin sayısı, 3 tane A olduğundan $\dfrac{6!}{3!} = 120$'dir.

**Dairesel sıralama.** $n$ kişi yuvarlak masaya oturursa dönmekle aynı olan sıralar bir sayılır, sayı $(n - 1)!$ olur. **Örnek.** 5 kişi yuvarlak masaya $4! = 24$ biçimde oturur.

**Yan yana koşulu.** Yan yana olması istenen elemanlar tek bir birim gibi sayılır, sonra kendi aralarında yer değiştirir. **Örnek.** 5 kişi bir sırada A ve B yan yana olacak biçimde $2 \cdot 4! = 48$ biçimde dizilir.

**"En az" koşulu.** Çoğu zaman **tümleyen** yolu kısadır: Tüm durumlardan istenmeyeni çıkar. **Örnek.** 5 erkek ve 4 kadından en az bir kadın içeren 3 kişilik kurul $C(9, 3) - C(5, 3) = 84 - 10 = 74$ biçimde seçilir. Çıkarılan $C(5, 3)$, hiç kadın olmayan kurullardır.

:::ipucu{baslik="Sık yapılan hata"}
"Ve" ile "ya da" birbirine karışır. Bir ekipte 2 matematik **ve** 1 fizik öğretmeni isteniyorsa iki seçimi çarparsın. "2 matematik **ya da** 3 matematik öğretmeni" isteniyorsa iki durumu toplarsın.
:::

:::baglanti
Bu konu "Olasılık" konusunun temelidir. Olasılıkta bir olayın kaç farklı biçimde gerçekleşeceğini, tüm durumların sayısıyla karşılaştırırsın. Saymayı iyi yapmak, olasılık sorularının yarısını çözmektir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çarpma kuralı | "Ve", aşamalar çarpılır |
| Toplama kuralı | "Ya da", durumlar toplanır |
| Permütasyon | $P(n, r) = \dfrac{n!}{(n-r)!}$ |
| Kombinasyon | $C(n, r) = \dfrac{n!}{r!(n-r)!}$ |
| Tekrarlı | $\dfrac{n!}{a!\,b!}$ |
| Dairesel | $(n - 1)!$ |
| Yan yana | Birimi tek say, $\times$ iç sıralama |

## Mini test

:::soru{cevap="E"}
0, 1, 2, 3, 4, 5 rakamları kullanılarak rakamları birbirinden farklı üç basamaklı kaç çift sayı yazılabilir?

- A) 20
- B) 32
- C) 48
- D) 51
- E) 52

---

1. Son basamak 0 ise ilk iki basamak kalan 5 rakamdan sıralı seçilir: $5 \cdot 4 = 20$.
2. Son basamak 2 ya da 4 ise ilk basamak 0 ve son rakam dışında 4 rakamdan, orta basamak ise kalan 4 rakamdan seçilir: $2 \cdot 4 \cdot 4 = 32$.
3. Toplam $20 + 32 = 52$. Doğru cevap E.

Diğer şıklar: **20** yalnızca son basamağı 0 olanlar sayılmış / **32** son basamağı 0 olan sayılar unutulmuş / **48** son basamak 0 olduğunda da ilk iki basamak için $4 \cdot 4$ alınmış / **51** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="D"}
5 matematik ve 4 fizik öğretmeni arasından en az 2 matematik öğretmeni bulunan 4 kişilik bir kurul kaç farklı biçimde seçilebilir?

- A) 60
- B) 65
- C) 100
- D) 105
- E) 126

---

1. Tüm 4 kişilik kurullar: $C(9, 4) = 126$.
2. İstenmeyenler: Hiç matematik öğretmeni olmayan $C(4, 4) = 1$ ve tam 1 matematik öğretmenli $C(5, 1) \cdot C(4, 3) = 20$ kurul.
3. $126 - (1 + 20) = 105$. Doğru cevap D.

Diğer şıklar: **60** yalnızca tam 2 matematik öğretmenli durum sayılmış / **65** 3 matematik öğretmenli durum unutulmuş / **100** 4 matematik öğretmenli durum unutulmuş / **126** koşulsuz tüm seçimler sayılmış.
:::

:::soru{cevap="D"}
KAYAK kelimesinin harfleri kullanılarak anlamlı ya da anlamsız 5 harfli kaç farklı kelime yazılabilir?

- A) 15
- B) 20
- C) 29
- D) 30
- E) 60

---

1. 5 harf içinde K iki kez, A iki kez, Y bir kez geçer.
2. $\dfrac{5!}{2!\,2!} = \dfrac{120}{4} = 30$. Doğru cevap D.

Diğer şıklar: **15** $2!$ üç kez bölünmüş / **20** bir harf 3 kez tekrar ediyormuş gibi bölünmüş / **29** işlem hatasıyla bir eksik bulunmuş / **60** yalnızca bir harfin tekrarına bölünmüş.
:::

:::soru{cevap="A"}
Aralarında Ayşe ile Burak'ın da bulunduğu 7 kişi yuvarlak bir masa etrafına, Ayşe ile Burak yan yana olacak biçimde kaç farklı şekilde oturabilir?

- A) 240
- B) 241
- C) 720
- D) 1440
- E) 5040

---

1. Ayşe ile Burak tek birim sayılır: $6$ birim yuvarlak masaya $(6 - 1)! = 120$ biçimde oturur.
2. Ayşe ile Burak kendi aralarında 2 biçimde yer değiştirir.
3. $120 \cdot 2 = 240$. Doğru cevap A.

Diğer şıklar: **241** işlem hatasıyla bir fazla bulunmuş / **720** yalnızca dairesel sıralama $6!$ hesaplanıp yan yana koşulu unutulmuş / **1440** birim sayısı 6 iken doğrusal sıralama $6!$ ile $2$ çarpılmış / **5040** doğrusal sıralama $7!$ alınmış.
:::

## Kendini dene

:::dene
1. $\dfrac{7!}{5!}$ işleminin sonucu kaçtır? => $7 \cdot 6 = 42$.
2. 10 kişilik bir gruptan 2 kişilik ekip kaç farklı biçimde seçilir? => $C(10, 2) = 45$.
3. MASA kelimesinin harfleriyle yazılabilecek, anlamlı ya da anlamsız 4 harfli kelimelerin sayısı kaçtır? => 2 tane A olduğundan $\dfrac{4!}{2!} = 12$.
4. 6 kişi yuvarlak bir masaya kaç farklı biçimde oturur? => $(6 - 1)! = 120$.
5. $C(n, 2) = 21$ ise $n$ kaçtır? => $\dfrac{n(n-1)}{2} = 21$ ise $n(n-1) = 42$ ve $n = 7$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Permütasyon ve Kombinasyon'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Sayma kuralları, faktöriyel, permütasyon, kombinasyon, tekrarlı ve dairesel permütasyon, en az ve yan yana koşulları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayılar python ile kaba kuvvetle doğrulandı.
Kontrol edilecekler: Binom açılımı bu metne alınmadı. 11. sınıf müfredatında yer alır, TYT için gerekirse ayrı eklenebilir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Permütasyon ve Kombinasyon'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Hava durumu yüzde 70 yağış diyor, bir sınav sorusunu rastgele işaretlemenin doğru çıkma ihtimali beşte bir. Bu cümlelerin hepsi **olasılık** ölçüsüdür. TYT'de olasılık soruları, "Permütasyon ve Kombinasyon" konusunda öğrendiğin saymayı kullanarak **istenen durumların sayısını, tüm durumların sayısına** oranlamaya dayanır. Bu konuda olasılığın tanımını, tümleyen ve birleşim kurallarını, bağımsız olayları ve koşullu olasılığı öğreneceksin.

:::hedefler
1. Örnek uzay, olay ve olasılık kavramlarını kullanmak.
2. Tümleyen olayın ve iki olayın birleşiminin olasılığını hesaplamak.
3. Bağımsız ve ayrık olayları ayırt etmek.
4. Koşullu olasılığı hesaplamak.
5. "En az bir" ve iadeli ya da iadesiz çekiliş sorularını çözmek.
:::

:::ipucu
Olasılık sorularında önce **örnek uzayın büyüklüğünü** yaz, sonra istenen olayı say. İki zarın atıldığı bir soruda örnek uzay 36'dır, 21 ya da 12 değildir. Sıralı çiftler farklı durumlardır: $(2, 5)$ ile $(5, 2)$ iki ayrı sonuçtur.
:::

## 1. Temel kavramlar

- **Deney:** Sonucu önceden kesin bilinmeyen işlem. Zar atmak, bir torbadan top çekmek.
- **Örnek uzay** ($E$): Deneyin tüm olası sonuçlarının kümesi. Bir zar için $E = \{1, 2, 3, 4, 5, 6\}$.
- **Olay** ($A$): Örnek uzayın bir alt kümesi. "Çift gelmesi" olayı $A = \{2, 4, 6\}$.

Tüm sonuçların **eş olasılıklı** olduğu durumda bir olayın olasılığı

$$P(A) = \frac{s(A)}{s(E)}$$

**Örnek.** Bir zar atılırken çift gelme olasılığı $\dfrac{3}{6} = \dfrac{1}{2}$. İki zar atılırken toplamın 7 gelme olasılığı için $(1,6), (2,5), (3,4), (4,3), (5,2), (6,1)$ olmak üzere 6 durum vardır. Olasılık $\dfrac{6}{36} = \dfrac{1}{6}$.

**Sınır değerler.** $0 \leq P(A) \leq 1$. Kesinlikle olmayacak olayın olasılığı 0, kesinlikle olacak olayın olasılığı 1'dir.

## 2. Tümleyen ve birleşim

**Tümleyen.** $A$ olayının olmaması olayına tümleyen denir: $P(A') = 1 - P(A)$. "En az bir" sorularında çoğu zaman tümleyen yolu kısadır.

**Örnek.** Bir torbada 4 kırmızı ve 6 mavi top var. Kırmızı çekme olasılığı $\dfrac{4}{10} = \dfrac{2}{5}$. Kırmızı çekmeme olasılığı $1 - \dfrac{2}{5} = \dfrac{3}{5}$.

**Birleşim.** İki olaydan en az birinin gerçekleşme olasılığı

$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

**Örnek.** 1'den 20'ye kadar numaralanmış 20 karttan biri çekiliyor. 3'ün katı olma olasılığı $\dfrac{6}{20}$ (3, 6, 9, 12, 15, 18). 4'ün katı olma olasılığı $\dfrac{5}{20}$ (4, 8, 12, 16, 20). İkisinin de katı olan tek sayı 12'dir. Bu durumda

$$P(A \cup B) = \frac{6}{20} + \frac{5}{20} - \frac{1}{20} = \frac{10}{20} = \frac{1}{2}$$

12 iki kez sayıldığı için bir kez çıkarılır. İki olay **ayrık** ise ($A \cap B = \emptyset$) çıkarılacak bir şey kalmaz ve $P(A \cup B) = P(A) + P(B)$ olur.

## 3. Bağımsız olaylar

Bir olayın gerçekleşmesi diğerinin olasılığını değiştirmiyorsa olaylar **bağımsızdır**. Bu durumda

$$P(A \cap B) = P(A) \cdot P(B)$$

**Örnek.** Bir madeni para iki kez atılıyor. İkisinin de yazı gelme olasılığı $\dfrac{1}{2} \cdot \dfrac{1}{2} = \dfrac{1}{4}$.

**Örnek.** Bir madeni para üç kez atılıyor. En az bir yazı gelmesinin tümleyeni, üçünün de tura gelmesidir: $1 - \left(\dfrac{1}{2}\right)^3 = \dfrac{7}{8}$.

:::ipucu{baslik="Sık yapılan hata"}
**Ayrık** ile **bağımsız** aynı şey değildir. Ayrık olaylar aynı anda olamaz, yani biri olursa diğeri kesinlikle olmaz, dolayısıyla birbirine bağlıdır. Olasılığı sıfırdan büyük iki olay hem ayrık hem bağımsız olamaz.
:::

## 4. Koşullu olasılık

$B$ olayının gerçekleştiği biliniyorsa $A$ olayının olasılığı, örnek uzay $B$'ye daraltılarak bulunur:

$$P(A \mid B) = \frac{P(A \cap B)}{P(B)}$$

**Örnek.** İki zar atılıyor ve toplamın 8 olduğu biliniyor. Toplamı 8 olan 5 durum vardır: $(2,6), (3,5), (4,4), (5,3), (6,2)$. Bunlardan ikisinin de çift olduğu 3 durum vardır: $(2,6), (4,4), (6,2)$. Olasılık $\dfrac{3}{5}$. Formülle de aynı sonuç çıkar: $\dfrac{3/36}{5/36} = \dfrac{3}{5}$.

**İadesiz çekiliş.** Torbadan çekilen top geri konmuyorsa ikinci çekilişin olasılığı birinciye bağlıdır. **Örnek.** 5 mavi ve 3 kırmızı topun bulunduğu torbadan iadesiz 2 top çekiliyor. İkisinin de mavi olma olasılığı hem sayma ile $\dfrac{C(5, 2)}{C(8, 2)} = \dfrac{10}{28}$ hem de çarpma ile $\dfrac{5}{8} \cdot \dfrac{4}{7} = \dfrac{5}{14}$ bulunur.

## Deneyle gör

Madeni para ve zarla yapılan deneyi tekrarla. Atış sayısını artırdıkça gözlenen oranın kuramsal olasılığa yaklaştığını görürsün.

::sim{tur="olasilik"}

:::baglanti
"Permütasyon ve Kombinasyon" konusu olasılığın hesap aracıdır. Bir olayın sayısı kombinasyonla bulunur, olasılık bu sayının tüm durumlara oranıdır. "Veri ve İstatistik" konusunda ise gerçekleşmiş deney sonuçlarının nasıl özetlendiğini göreceksin.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Olasılık | $P(A) = \dfrac{s(A)}{s(E)}$ |
| Aralık | $0 \leq P(A) \leq 1$ |
| Tümleyen | $P(A') = 1 - P(A)$ |
| Birleşim | $P(A) + P(B) - P(A \cap B)$ |
| Bağımsız | $P(A \cap B) = P(A) \cdot P(B)$ |
| Koşullu | $P(A \mid B) = \dfrac{P(A \cap B)}{P(B)}$ |
| En az bir | Hiç olmama olasılığını 1'den çıkar |

## Mini test

:::soru{cevap="B"}
İki zar birlikte atılıyor. Üste gelen sayıların toplamının 9 ya da 10 olma olasılığı kaçtır?

- A) $\dfrac{4}{21}$
- B) $\dfrac{7}{36}$
- C) $\dfrac{1}{4}$
- D) $\dfrac{5}{18}$
- E) $\dfrac{1}{3}$

---

1. Örnek uzay $6 \cdot 6 = 36$ sıralı çifttir.
2. Toplam 9: $(3,6), (4,5), (5,4), (6,3)$, yani 4 durum.
3. Toplam 10: $(4,6), (5,5), (6,4)$, yani 3 durum.
4. İki olay ayrık olduğundan $\dfrac{4 + 3}{36} = \dfrac{7}{36}$. Doğru cevap B.

Diğer şıklar: **$\dfrac{4}{21}$** sırasız çiftler örnek uzay sayılmış / **$\dfrac{1}{4}$** toplamı 11 olan durumlar da eklenmiş / **$\dfrac{5}{18}$** toplamı 11 ve 12 olan durumlar da eklenmiş / **$\dfrac{1}{3}$** pay 7 doğru bulunup payda sırasız çiftlerle 21 alınmış.
:::

:::soru{cevap="E"}
İki zar birlikte atılıyor. Üste gelen sayıların toplamının 7'den büyük olduğu bilindiğine göre zarlardan en az birinin 6 gelmiş olma olasılığı kaçtır?

- A) $\dfrac{1}{4}$
- B) $\dfrac{11}{36}$
- C) $\dfrac{5}{12}$
- D) $\dfrac{8}{15}$
- E) $\dfrac{3}{5}$

---

1. Toplamı 7'den büyük olan durumlar. Toplam 8, 9, 10, 11, 12 için $5 + 4 + 3 + 2 + 1 = 15$ durum.
2. Bunlardan en az bir zarı 6 olanlar: $(2,6), (3,6), (4,6), (5,6), (6,6), (6,2), (6,3), (6,4), (6,5)$, yani 9 durum.
3. $P = \dfrac{9}{15} = \dfrac{3}{5}$. Doğru cevap E.

Diğer şıklar: **$\dfrac{1}{4}$** payda 36 bırakılmış / **$\dfrac{11}{36}$** koşul dikkate alınmamış / **$\dfrac{5}{12}$** yalnızca koşul olayının olasılığı alınmış / **$\dfrac{8}{15}$** $(6, 6)$ durumu unutulmuş.
:::

:::soru{cevap="E"}
Bir basketbolcunun serbest atışı isabet ettirme olasılığı $0{,}7$'dir. Ardışık 3 serbest atışın bağımsız olduğu varsayılırsa tam 2 atışın isabet etme olasılığı kaçtır?

- A) $0{,}027$
- B) $0{,}147$
- C) $0{,}189$
- D) $0{,}343$
- E) $0{,}441$

---

1. İsabet olasılığı 0,7, kaçırma olasılığı 0,3.
2. Hangi iki atışın isabet edeceği $C(3, 2) = 3$ biçimde seçilir.
3. Her biçimin olasılığı $0{,}7 \cdot 0{,}7 \cdot 0{,}3 = 0{,}147$.
4. $3 \cdot 0{,}147 = 0{,}441$. Doğru cevap E.

Diğer şıklar: **$0{,}027$** üç atışın da kaçma olasılığı alınmış / **$0{,}147$** sıra sayısı olan 3 ile çarpma unutulmuş / **$0{,}189$** tam bir isabet olasılığı alınmış / **$0{,}343$** üç atışın da isabet olma olasılığı alınmış.
:::

:::soru{cevap="C"}
Bir torbada 4 beyaz ve 6 siyah top vardır. Torbadan geri konmadan 2 top çekiliyor. Çekilen iki topun aynı renkte olma olasılığı kaçtır?

- A) $\dfrac{7}{30}$
- B) $\dfrac{1}{3}$
- C) $\dfrac{7}{15}$
- D) $\dfrac{13}{25}$
- E) $\dfrac{8}{15}$

---

1. Tüm çekilişler: $C(10, 2) = 45$.
2. İkisi de beyaz: $C(4, 2) = 6$. İkisi de siyah: $C(6, 2) = 15$.
3. $\dfrac{6 + 15}{45} = \dfrac{21}{45} = \dfrac{7}{15}$. Doğru cevap C.

Diğer şıklar: **$\dfrac{7}{30}$** pay sırasız, payda sıralı sayılmış / **$\dfrac{1}{3}$** yalnızca ikisinin de siyah olma olasılığı alınmış / **$\dfrac{13}{25}$** çekiliş iadeli sanılmış / **$\dfrac{8}{15}$** farklı renkte olma olasılığı alınmış.
:::

## Kendini dene

:::dene
1. Bir zar atılıyor. Asal sayı gelme olasılığı kaçtır? => Asal gelenler 2, 3, 5 olduğundan $\dfrac{3}{6} = \dfrac{1}{2}$.
2. Bir torbada 3 kırmızı ve 5 mavi top var. Çekilen topun kırmızı olmama olasılığı kaçtır? => $1 - \dfrac{3}{8} = \dfrac{5}{8}$.
3. $A$ ve $B$ bağımsız, $P(A) = 0{,}5$ ve $P(B) = 0{,}3$ ise $P(A \cap B)$ kaçtır? => $0{,}5 \cdot 0{,}3 = 0{,}15$.
4. $A$ ve $B$ ayrık, $P(A) = 0{,}2$ ve $P(B) = 0{,}35$ ise $P(A \cup B)$ kaçtır? => $0{,}2 + 0{,}35 = 0{,}55$.
5. Bir madeni para iki kez atılıyor. En az bir tura gelme olasılığı kaçtır? => $1 - \dfrac{1}{4} = \dfrac{3}{4}$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Olasılık'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Örnek uzay, olay, olasılık, tümleyen, birleşim, ayrık ve bağımsız olaylar, koşullu olasılık, iadeli ve iadesiz çekiliş. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, olasılıklar python ile kaba kuvvetle doğrulandı.
Kontrol edilecekler: Bayes kuralı ve deneysel olasılık bölümü yer almadı. Yayına almadan önce "Deneyle gör" simülasyonunun yerini görün.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Olasılık'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir sınıfın deneme sonuçları, bir şehrin aylık sıcaklıkları, bir maçtaki sayılar: Hepsi **veridir**. Veriye bakıp "bu sınıfın durumu nasıl" sorusuna tek bir sayıyla cevap vermek için ortalama, ortanca ve tepe değer kullanılır. Verilerin birbirinden ne kadar uzaklaştığını ise açıklık ve standart sapma gösterir. Bu konuda merkezi eğilim ve yayılım ölçülerini, frekans tablosunu ve grafik okumayı öğreneceksin.

:::hedefler
1. Aritmetik ortalama, ortanca ve tepe değeri hesaplamak.
2. Frekans tablosundan ortalama bulmak.
3. Açıklık, çeyrekler ve standart sapmayı yorumlamak.
4. Verilere işlem uygulandığında ölçülerin nasıl değiştiğini bilmek.
5. Sütun, daire ve kutu grafiklerini okumak.
:::

:::ipucu
Ortalama sorularında **toplamları** ele al. "5 sayının ortalaması 12" cümlesini "5 sayının toplamı 60" olarak yaz. Sayı eklenip çıkarılan sorularda ortalamalarla değil toplamlarla çalışırsan hata yapmazsın.
:::

## 1. Merkezi eğilim ölçüleri

**Aritmetik ortalama.** Tüm değerlerin toplamının değer sayısına bölümüdür:

$$\bar{x} = \frac{x_1 + x_2 + \cdots + x_n}{n}$$

**Örnek.** 6, 8, 9, 11, 16 sayılarının ortalaması $\dfrac{50}{5} = 10$.

**Ortanca (medyan).** Değerler küçükten büyüğe sıralanınca **ortadaki** değerdir. Değer sayısı çiftse ortadaki iki değerin ortalaması alınır.

**Örnek.** 3, 7, 9, 12, 20 için ortanca 9. 4, 6, 10, 14 için ortanca $\dfrac{6 + 10}{2} = 8$. Sıralama yapmadan ortanca bulunmaz.

**Tepe değer (mod).** En çok tekrar eden değerdir. **Örnek.** 2, 3, 3, 5, 5, 5, 8 için tepe değer 5. Hiçbir değer tekrar etmiyorsa tepe değer yoktur, iki değer eşit sayıda en çok tekrar ediyorsa iki tepe değer vardır.

**Ortalama eklenen ve çıkarılan değerlerle değişir.** **Örnek.** 5 kişinin yaş ortalaması 12 ise yaşlar toplamı 60'tır. Yeni bir kişi katılınca ortalama 14 oluyorsa 6 kişinin toplamı $6 \cdot 14 = 84$, yeni kişinin yaşı $84 - 60 = 24$'tür.

## 2. Yayılım ölçüleri

**Açıklık.** En büyük değer ile en küçük değerin farkıdır. **Çeyrekler** sıralanmış veriyi dörde böler: $Q_1$ alt yarının ortancası, $Q_2$ tüm verinin ortancası, $Q_3$ üst yarının ortancasıdır. $Q_3 - Q_1$ farkına **çeyrekler açıklığı** denir.

![12 öğrencinin deneme netleri için kutu grafiği. En küçük 14, Q1 19,5, ortanca 25,5, Q3 30,5, en büyük 40](/lessons/tyt-mat/kutu-grafigi.svg "Kutu grafiği | Yolumnet")

**Örnek.** 12 öğrencinin netleri: 14, 18, 18, 21, 23, 25, 26, 28, 30, 31, 35, 40.

| Ölçü | Değer |
| --- | --- |
| Ortalama | $\dfrac{309}{12} = 25{,}75$ |
| Ortanca | $\dfrac{25 + 26}{2} = 25{,}5$ |
| Tepe değer | 18 |
| Açıklık | $40 - 14 = 26$ |
| $Q_1$ ve $Q_3$ | $19{,}5$ ve $30{,}5$ |
| Çeyrekler açıklığı | $30{,}5 - 19{,}5 = 11$ |

**Standart sapma.** Verilerin ortalamadan ortalama ne kadar uzaklaştığını gösterir:

$$\sigma = \sqrt{\frac{(x_1 - \bar{x})^2 + \cdots + (x_n - \bar{x})^2}{n}}$$

Standart sapmanın karesine **varyans** denir. **Örnek.** 2, 4, 4, 4, 5, 5, 7, 9 için ortalama 5, sapmaların kareleri toplamı 32'dir. Varyans $\dfrac{32}{8} = 4$ ve $\sigma = 2$.

Standart sapma küçükse veriler ortalamaya yakın toplanmıştır. Büyükse veriler dağınıktır. Tüm değerler birbirine eşitse standart sapma 0'dır.

## 3. Verilere işlem uygulanırsa

Bütün değerler $k$ ile çarpılıp $c$ eklenirse ($x \to kx + c$):

| Ölçü | Yeni değer |
| --- | --- |
| Ortalama, ortanca, tepe değer | $k \cdot (\text{eski}) + c$ |
| Açıklık, çeyrekler açıklığı | $\lvert k \rvert \cdot (\text{eski})$ |
| Standart sapma | $\lvert k \rvert \cdot (\text{eski})$ |
| Varyans | $k^2 \cdot (\text{eski})$ |

**Örnek.** 1, 2, 3, 4, 5 değerlerinin ortalaması 3. Her değer 3 ile çarpılıp 2 eklenince ortalama $3 \cdot 3 + 2 = 11$, açıklık $3 \cdot 4 = 12$ olur. Sabit eklemek yayılımı değiştirmez, yalnızca verileri kaydırır.

## 4. Frekans tablosu ve grafikler

Frekans tablosunda ortalama, her değerin frekansıyla çarpımlarının toplamının toplam frekansa bölümüdür:

$$\bar{x} = \frac{x_1 f_1 + x_2 f_2 + \cdots}{f_1 + f_2 + \cdots}$$

**Örnek.** Bir sınıfta 1 puan alan 2, 2 puan alan 3, 3 puan alan 5 kişi var. Ortalama $\dfrac{2 + 6 + 15}{10} = 2{,}3$.

**Daire grafiğinde** bir dilimin merkez açısı, tüm verinin 360° olduğu orantıyla bulunur. 120 kişilik bir grupta 90°'lik dilim $\dfrac{90}{360} \cdot 120 = 30$ kişidir.

**Sütun grafiği** kategorilerin sayılarını yükseklikle gösterir. En yüksek sütun tepe değerdir. Sütun grafiğinde eksenlerin hangi değerden başladığına dikkat et, yanıltıcı olabilir.

:::ipucu{baslik="Sık yapılan hata"}
Ortanca ile ortalama farklı şeylerdir. Verilerden biri çok uç bir değerse ortalama kayar ama ortanca neredeyse sabit kalır. 12 öğrencinin 11'i 20 net, biri 80 net yapmışsa ortalama 25, ortanca 20'dir. Sıralamadan ortanca bulmak da sık yapılan bir hatadır.
:::

:::baglanti
Gerçekleşmiş sonuçları özetlediğin bu konu, "Olasılık" konusunun tamamlayıcısıdır. Olasılık henüz gerçekleşmemiş bir durumun ihtimalini, istatistik gerçekleşmiş verinin özetini verir. Bir deneme sınavı sonucunu yorumlarken ortalama ve standart sapmayı birlikte kullanırsın. Ortalama düzeyi, standart sapma ise sınıfın ne kadar dağınık olduğunu gösterir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ortalama | Toplam $\div$ sayı |
| Ortanca | Sıralı verinin ortası |
| Tepe değer | En çok tekrar eden |
| Açıklık | En büyük $-$ en küçük |
| Standart sapma | $\sigma = \sqrt{\text{varyans}}$ |
| $x \to kx + c$ | Ortalama $k\bar{x} + c$, $\sigma$ için $\lvert k \rvert\sigma$ |
| Frekans tablosu | $\dfrac{\sum x f}{\sum f}$ |

## Mini test

:::soru{cevap="A"}
5 sayının aritmetik ortalaması 14'tür. Bu sayılardan biri çıkarıldığında kalan 4 sayının aritmetik ortalaması 12 olduğuna göre çıkarılan sayı kaçtır?

- A) 22
- B) 23
- C) 26
- D) 48
- E) 70

---

1. 5 sayının toplamı $5 \cdot 14 = 70$.
2. Kalan 4 sayının toplamı $4 \cdot 12 = 48$.
3. Çıkarılan sayı $70 - 48 = 22$. Doğru cevap A.

Diğer şıklar: **23** işlem hatasıyla bir fazla bulunmuş / **26** iki ortalamanın toplamı alınmış / **48** kalan 4 sayının toplamı alınmış / **70** 5 sayının toplamı alınmış.
:::

:::soru{cevap="E"}
9 sayıdan oluşan bir veri grubunun aritmetik ortalaması 15'tir. Bu gruptaki her sayı önce 3 ile çarpılıp sonra 4 azaltılırsa yeni grubun aritmetik ortalaması kaç olur?

- A) 11
- B) 19
- C) 33
- D) 40
- E) 41

---

1. Her sayı $x \to 3x - 4$ olur. Ortalama da aynı dönüşümden geçer.
2. $3 \cdot 15 - 4 = 41$. Doğru cevap E.

Diğer şıklar: **11** yalnızca 4 azaltılmış / **19** 4 çıkarılacağı yerde eklenmiş ve çarpma unutulmuş / **33** önce 4 azaltılıp sonra 3 ile çarpılmış / **40** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="C"}
Bir sınıftaki 40 öğrenciden 4'ü 50, 6'sı 60, 14'ü 70, 10'u 80 ve 6'sı 90 not almıştır. Bu sınıfın not ortalaması kaçtır?

- A) 68
- B) 70
- C) 72
- D) 576
- E) 2880

---

1. Not ile öğrenci sayılarının çarpımları: $200 + 360 + 980 + 800 + 540 = 2880$.
2. Toplam öğrenci sayısı 40.
3. Ortalama $\dfrac{2880}{40} = 72$. Doğru cevap C.

Diğer şıklar: **68** frekanslar ters sırayla eşlenmiş / **70** ortanca ya da tepe değer alınmış / **576** toplam frekansa değil not sayısı olan 5'e bölünmüş / **2880** toplam frekansa bölme yapılmamış.
:::

:::soru{cevap="E"}
Bir okuldaki öğrencilerin tercih ettiği spor dallarını gösteren daire grafiğinde futbol 135°, basketbol 90°, yüzme 45° ve geri kalan dilim voleybol için ayrılmıştır. Voleybolu tercih eden 60 öğrenci olduğuna göre okuldaki toplam öğrenci sayısı kaçtır?

- A) 60
- B) 90
- C) 160
- D) 180
- E) 240

---

1. Voleybol dilimi $360° - (135° + 90° + 45°) = 90°$.
2. 90° dilim 60 kişiyi gösteriyor. Tam daire 360° olduğundan $60 \cdot \dfrac{360}{90} = 240$.
3. Okuldaki öğrenci sayısı 240. Doğru cevap E.

Diğer şıklar: **60** voleybolu seçen sayısı alınmış / **90** futbolu seçen sayısı bulunmuş / **160** voleybol dilimi 135° alınmış / **180** voleybol dilimi 120° alınmış.
:::

## Kendini dene

:::dene
1. 4, 8, 9, 15 sayılarının aritmetik ortalaması kaçtır? => $\dfrac{36}{4} = 9$.
2. 2, 9, 5, 7, 12, 1 sayılarının ortancası kaçtır? => Sıralı hâli 1, 2, 5, 7, 9, 12. Ortadaki iki değer 5 ve 7 olduğundan $\dfrac{5 + 7}{2} = 6$.
3. 6 sayının ortalaması 15 iken yeni bir sayı eklenince ortalama 18 oluyor. Eklenen sayı kaçtır? => Eski toplam 90, yeni toplam $7 \cdot 18 = 126$. Eklenen sayı $126 - 90 = 36$.
4. Bir veri grubunun standart sapması 5'tir. Her değer 4 ile çarpılırsa yeni standart sapma kaç olur? => $4 \cdot 5 = 20$.
5. Bir daire grafiğinde 72°'lik dilim 30 kişiyi gösteriyorsa toplam kaç kişi vardır? => $\dfrac{72}{360} = \dfrac{1}{5}$ olduğundan toplam 150 kişidir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'Veri ve İstatistik'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Aritmetik ortalama, ortanca, tepe değer, açıklık, çeyrekler, standart sapma ve varyans, verilere işlem uygulanması, frekans tablosu, grafik okuma. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayılar python ile doğrulandı.
Kontrol edilecekler: Çeyrek hesaplama yöntemi, alt ve üst yarının ortancası olarak alındı (veri sayısı çiftken). Kitaplarda farklı yöntemler olabilir, sınavda ortanca yöntemi esas alınır. Histogram yer almadı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Veri ve İstatistik'
on conflict (topic_id) do nothing;
