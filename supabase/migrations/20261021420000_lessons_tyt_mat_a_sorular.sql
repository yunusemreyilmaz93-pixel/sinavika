-- TYT Matematik mini test sorularının sayıları anlatımdaki örneklerden ayrıldı. Yalnızca soru bölümü değişir.

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="D"}
İki basamaklı $\overline{ab}$ sayısı için $\overline{ab} - \overline{ba} = 36$ ve $a + b = 12$ olduğuna göre $\overline{ab}$ kaçtır?

- A) 48
- B) 66
- C) 75
- D) 84
- E) 93

---

1. $\overline{ab} - \overline{ba} = 9(a - b) = 36$ olduğundan $a - b = 4$.
2. $a + b = 12$ ve $a - b = 4$ denklemlerinden $a = 8$, $b = 4$.
3. Sayı 84'tür. Kontrol: $84 - 48 = 36$. Doğru cevap D.

Diğer şıklar: **48** $\overline{ba}$ bulunmuş / **66** $a - b = 0$ alınmış / **75** $a - b = 2$ alınmış ($36 \div 18$) / **93** $a - b = 6$ alınmış ($36 \div 6$).
:::

:::soru{cevap="C"}
Bir kitabın sayfaları 1'den 150'ye kadar (150 dahil) numaralandırılırken toplam kaç rakam kullanılır?

- A) 300
- B) 339
- C) 342
- D) 351
- E) 450

---

1. 1-9 arası 9 sayfa, 1 rakam: $9$.
2. 10-99 arası 90 sayfa, 2 rakam: $180$.
3. 100-150 arası $150 - 100 + 1 = 51$ sayfa, 3 rakam: $153$.
4. Toplam $9 + 180 + 153 = 342$. Doğru cevap C.

Diğer şıklar: **300** bütün sayfalar iki rakamlı sayılmış / **339** $150 - 100 = 50$ sayfa alınmış (+1 unutulmuş) / **351** tek basamaklılar iki kez sayılmış / **450** bütün sayfalar üç rakamlı sayılmış.
:::

:::soru{cevap="C"}
Rakamları birbirinden farklı kaç tane üç basamaklı çift doğal sayı yazılabilir?

- A) 320
- B) 324
- C) 328
- D) 360
- E) 405

---

1. Birler basamağı 0 ise: yüzler 9, onlar 8 seçenek. $9 \cdot 8 = 72$ sayı.
2. Birler basamağı 2, 4, 6 ya da 8 ise (4 seçenek): yüzler basamağı 0 ve birler rakamından farklı olmalı, 8 seçenek. Onlar basamağı kalan 8 rakamdan biri, 8 seçenek. $4 \cdot 8 \cdot 8 = 256$ sayı.
3. Toplam $72 + 256 = 328$. Doğru cevap C.

Diğer şıklar: **320** birler basamağında 0 özel durumu hesaba katılmamış / **324** farklı rakamlı sayıların yarısı alınmış / **360** $9 \cdot 8 \cdot 5$ hesaplanmış / **405** rakamların farklı olması unutulmuş.
:::

:::soru{cevap="D"}
Rakamları farklı ve $\overline{ab}$ iki basamaklı bir sayıdır. $a > b$ ve $\overline{ab} + \overline{ba}$ toplamı tam kare olduğuna göre bu koşulları sağlayan kaç farklı $\overline{ab}$ sayısı vardır?

- A) 1
- B) 2
- C) 3
- D) 4
- E) 6

---

1. $\overline{ab} + \overline{ba} = 11(a + b)$ olur.
2. $11(a+b)$ tam kare ise $a + b$ de 11'in katı olmalıdır. $a + b \leq 17$ olduğundan $a + b = 11$ ve toplam $121 = 11^2$.
3. $a > b$ koşuluyla $(9,2), (8,3), (7,4), (6,5)$ çiftleri bulunur. Sayılar 92, 83, 74, 65.
4. Toplam 4 sayı vardır. Doğru cevap D.

Diğer şıklar: **1** tek çift bulunmuş / **2** iki çift atlanmış / **3** bir çift atlanmış / **6** fazladan çift sayılmış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Sayı Basamakları';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="D"}
Bir doğal sayının 9'a bölümünden bölüm 14, kalan 6 olduğuna göre bu sayı kaçtır?

- A) 20
- B) 84
- C) 126
- D) 132
- E) 135

---

1. Bölme işleminde $a = b \cdot q + r$ yazılır.
2. $a = 9 \cdot 14 + 6 = 126 + 6 = 132$ bulunur. Doğru cevap D.

Diğer şıklar: **20** bölüm ile kalan toplanmış / **84** bölüm ile kalan çarpılmış / **126** kalan eklenmemiş / **135** kalan yerine bölen eklenmiş.
:::

:::soru{cevap="C"}
Dört basamaklı $\overline{3a4b}$ sayısı 45\'e tam bölünebildiğine göre $a + b$ toplamı en çok kaç olabilir?

- A) 7
- B) 9
- C) 11
- D) 12
- E) 18

---

1. $45 = 5 \cdot 9$ ve 5 ile 9 aralarında asaldır. Sayı hem 5'e hem 9'a bölünmelidir.
2. 5'e bölünmek için $b = 0$ ya da $b = 5$ olmalıdır.
3. 9'a bölünmek için $3 + a + 4 + b = 7 + a + b$ toplamı 9'un katı olmalıdır. Bu da $a + b = 2$ ya da $a + b = 11$ demektir.
4. $b = 0$ için $a = 2$ (3240). $b = 5$ için $a = 6$ (3645). $3645 = 45 \cdot 81$. En büyük toplam $6 + 5 = 11$. Doğru cevap C.

Diğer şıklar: **7** 3 ve 4 rakamlarının toplamı alınmış / **9** rakamlar toplamı 9 sanılmış / **12** işlem hatasıyla bir fazla bulunmuş / **18** $a$ ve $b$ en büyük rakam alınmış.
:::

:::soru{cevap="B"}
Bir $x$ doğal sayısının 5'e bölümünden kalan 3, 7'ye bölümünden kalan 5, 9'a bölümünden kalan 7 olduğuna göre bu koşulları sağlayan en küçük $x$ sayısı kaçtır?

- A) 63
- B) 313
- C) 314
- D) 315
- E) 316

---

1. Kalanlar bölenlerden 2 eksiktir: $5 - 3 = 2$, $7 - 5 = 2$, $9 - 7 = 2$. Bu yüzden $x + 2$ sayısı 5, 7 ve 9'a tam bölünür.
2. EKOK(5, 7, 9) = 315 olduğundan $x + 2 = 315k$.
3. En küçük pozitif $x = 315 - 2 = 313$. Kontrol: $313 = 5 \cdot 62 + 3 = 7 \cdot 44 + 5 = 9 \cdot 34 + 7$. Doğru cevap B.

Diğer şıklar: **63** yalnızca 7 ve 9 için EKOK alınmış / **314** işlem hatasıyla bir fazla bulunmuş / **315** EKOK sonuç sanılmış / **316** işlem hatasıyla üç fazla bulunmuş.
:::

:::soru{cevap="E"}
Bir $x$ doğal sayısının 11'e bölümünden kalan 6 olduğuna göre $x^2 - x$ sayısının 11'e bölümünden kalan kaçtır?

- A) 3
- B) 5
- C) 6
- D) 7
- E) 8

---

1. $x^2$ için: $6^2 = 36$ ve 36'nın 11'e bölümünden kalan 3.
2. $-x$ için: $-6$ ve $-6 + 11 = 5$ kalan olarak alınır.
3. Toplamın kalanı $3 + 5 = 8$. Kontrol: $x = 6$ için $36 - 6 = 30 = 2 \cdot 11 + 8$. Doğru cevap E.

Diğer şıklar: **3** yalnızca $x^2$ için kalan alınmış / **5** yalnızca $-x$ için kalan alınmış / **6** $x$ in kalanı alınmış / **7** işlem hatasıyla bir eksik bulunmuş.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Bölme ve Bölünebilme';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="C"}
48 ve 120 sayılarının EBOB'u ile EKOK'unun toplamı kaçtır?

- A) 144
- B) 252
- C) 264
- D) 265
- E) 5784

---

1. $48 = 2^4 \cdot 3$ ve $120 = 2^3 \cdot 3 \cdot 5$.
2. EBOB $= 2^3 \cdot 3 = 24$ ve EKOK $= 2^4 \cdot 3 \cdot 5 = 240$.
3. Toplam $24 + 240 = 264$ olur. Doğru cevap C.

Diğer şıklar: **144** EKOK yerine büyük sayı alınmış / **252** EBOB 12 bulunmuş / **265** işlem hatasıyla bir fazla bulunmuş / **5784** EKOK yerine çarpım alınmış.
:::

:::soru{cevap="C"}
270 cm $\times$ 420 cm boyutlarındaki dikdörtgen bir zemin, artık kalmayacak biçimde eş ve mümkün olan en büyük kare karolarla döşenecektir. Buna göre kaç karo gerekir?

- A) 23
- B) 30
- C) 126
- D) 504
- E) 3780

---

1. Karonun kenarı hem 270'i hem 420'yi bölmeli ve en büyük olmalıdır. EBOB(270, 420) = 30.
2. Bir kenara $\dfrac{270}{30} = 9$, diğer kenara $\dfrac{420}{30} = 14$ karo sığar.
3. Toplam $9 \cdot 14 = 126$ karo gerekir. Doğru cevap C.

Diğer şıklar: **23** $9 + 14$ toplanmış / **30** karo kenarı bulunmuş / **504** kenar 15 cm alınmış / **3780** EKOK alınmış.
:::

:::soru{cevap="D"}
Saat 08.00'de bir duraktan birlikte kalkan iki otobüsten biri 10 dakikada bir, diğeri 15 dakikada bir kalkmaktadır. Bu iki otobüs 08.00'den sonra saat 12.00'ye kadar (12.00 dahil) bu duraktan kaç kez birlikte kalkar?

- A) 5
- B) 6
- C) 7
- D) 8
- E) 9

---

1. 10 ve 15'in EKOK'u 30'dur. Otobüsler her 30 dakikada bir birlikte kalkar.
2. 08.00 ile 12.00 arası 240 dakikadır ve $240 \div 30 = 8$.
3. 08.00 kalkışı soruda sayılmaz, sonraki birlikte kalkışlar 8 tanedir. Doğru cevap D.

Diğer şıklar: **5** işlem hatasıyla üç eksik bulunmuş / **6** işlem hatasıyla iki eksik bulunmuş / **7** işlem hatasıyla bir eksik bulunmuş / **9** 08.00 kalkışı da sayılmış.
:::

:::soru{cevap="B"}
$x$ ve $y$ pozitif tam sayılar olmak üzere EBOB$(x, y) = 6$ ve EKOK$(x, y) = 180$ olduğuna göre $x + y$ toplamı en az kaçtır?

- A) 60
- B) 66
- C) 78
- D) 102
- E) 186

---

1. $x = 6a$ ve $y = 6b$ yazılır. $a$ ve $b$ aralarında asaldır.
2. EKOK $= 6ab = 180$ olduğundan $ab = 30$.
3. Aralarında asal çarpanlar: $(1, 30), (2, 15), (3, 10), (5, 6)$. Toplamlar $a + b = 31, 17, 13, 11$.
4. En küçüğü $a + b = 11$ ve $x + y = 6 \cdot 11 = 66$ (sayılar 30 ve 36). Doğru cevap B.

Diğer şıklar: **60** $a + b = 10$ alınmış / **78** $(18, 60)$ çifti seçilmiş / **102** $(12, 90)$ çifti seçilmiş / **186** $(6, 180)$ çifti seçilmiş.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'EBOB ve EKOK';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="D"}
$\dfrac{3}{4} - \dfrac{2}{5} + \dfrac{7}{10}$ işleminin sonucu kaçtır?

- A) $\dfrac{7}{20}$
- B) $\dfrac{8}{19}$
- C) $\dfrac{7}{10}$
- D) $\dfrac{21}{20}$
- E) $\dfrac{5}{4}$

---

1. Ortak payda 20'dir: $\dfrac{15}{20} - \dfrac{8}{20} + \dfrac{14}{20}$.
2. Paylar işleme girer: $\dfrac{15 - 8 + 14}{20} = \dfrac{21}{20}$. Doğru cevap D.

Diğer şıklar: **$\dfrac{7}{20}$** $\frac{7}{10}$ toplanmamış / **$\dfrac{8}{19}$** paylar ve paydalar ayrı ayrı işlenmiş / **$\dfrac{7}{10}$** $\frac{7}{10}$ nun paydası eşitlenmemiş / **$\dfrac{5}{4}$** $\frac{2}{5}$ yanlış genişletilmiş.
:::

:::soru{cevap="A"}
$\dfrac{a}{b} = \dfrac{2}{7}$ olduğuna göre $\dfrac{3a - b}{a + b}$ ifadesinin değeri kaçtır?

- A) $-\dfrac{1}{9}$
- B) $\dfrac{1}{9}$
- C) $\dfrac{1}{5}$
- D) $\dfrac{13}{9}$
- E) 2

---

1. $\dfrac{a}{b} = \dfrac{2}{7}$ olduğundan $a = 2k$ ve $b = 7k$ yazılır.
2. $\dfrac{3 \cdot 2k - 7k}{2k + 7k} = \dfrac{-k}{9k}$.
3. $k$ sadeleşir ve sonuç $-\dfrac{1}{9}$ olur. Doğru cevap A.

Diğer şıklar: **$\dfrac{1}{9}$** işaret hatası yapılmış / **$\dfrac{1}{5}$** payda $a - b$ alınmış / **$\dfrac{13}{9}$** $3a - b$ yerine $3a + b$ alınmış / **2** paydaki ve paydadaki terimler ayrı ayrı sadeleştirilmiş.
:::

:::soru{cevap="D"}
$a = \dfrac{7}{11}$, $b = \dfrac{9}{14}$ ve $c = \dfrac{5}{8}$ olduğuna göre aşağıdaki sıralamalardan hangisi doğrudur?

- A) $a < b < c$
- B) $b < a < c$
- C) $c < b < a$
- D) $c < a < b$
- E) $a < c < b$

---

1. Çapraz çarpımla karşılaştır: $\dfrac{7}{11}$ ile $\dfrac{9}{14}$ için $7 \cdot 14 = 98$ ve $9 \cdot 11 = 99$. Yani $a < b$.
2. $\dfrac{5}{8}$ ile $\dfrac{7}{11}$ için $5 \cdot 11 = 55$ ve $7 \cdot 8 = 56$. Yani $c < a$.
3. Sıralama $c < a < b$ olur. Ondalık olarak 0,625 < 0,636 < 0,643. Doğru cevap D.

Diğer şıklar: **$a < b < c$** yalnızca paylara bakılmış / **$b < a < c$** sıralama tersten yazılmış / **$c < b < a$** iki kesrin yeri karıştırılmış / **$a < c < b$** iki kesrin yeri karıştırılmış.
:::

:::soru{cevap="C"}
$\dfrac{0{,}\overline{5}}{0{,}2\overline{7}}$ işleminin sonucu kaçtır?

- A) $\dfrac{9}{5}$
- B) $\dfrac{50}{27}$
- C) 2
- D) $\dfrac{55}{27}$
- E) $\dfrac{20}{9}$

---

1. $0{,}\overline{5} = \dfrac{5}{9}$.
2. $0{,}2\overline{7}$ için devretmeyen kısım 2, tüm rakamlar 27. Pay $27 - 2 = 25$, payda 90: $\dfrac{25}{90} = \dfrac{5}{18}$.
3. $\dfrac{5}{9} \div \dfrac{5}{18} = \dfrac{5}{9} \cdot \dfrac{18}{5} = 2$. Doğru cevap C.

Diğer şıklar: **$\dfrac{9}{5}$** $0{,}2\overline{7}$ yerine $0{,}5$ alınmış / **$\dfrac{50}{27}$** $0{,}2\overline{7} = \frac{27}{90}$ alınmış / **$\dfrac{55}{27}$** $0{,}2\overline{7} = \frac{27}{99}$ alınmış / **$\dfrac{20}{9}$** $0{,}2\overline{7}$ yerine $0{,}25$ alınmış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Rasyonel Sayılar';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="C"}
$-5 < 4x - 3 \leq 17$ eşitsizliğini sağlayan kaç tam sayı $x$ değeri vardır?

- A) 4
- B) 5
- C) 6
- D) 7
- E) 8

---

1. Her tarafa 3 eklenir: $-2 < 4x \leq 20$.
2. Her taraf 4'e bölünür: $-\dfrac{1}{2} < x \leq 5$.
3. Tam sayılar 0, 1, 2, 3, 4, 5'tir. Toplam 6 tane olur. Doğru cevap C.

Diğer şıklar: **4** sınırlar yanlış çevrilmiş / **5** 0 tam sayısı sayılmamış / **7** $-1$ de sayılmış / **8** iki uçtan birer fazla sayılmış.
:::

:::soru{cevap="C"}
$2 < x < 6$ ve $-3 < y < 4$ olduğuna göre $3x - 2y$ ifadesinin alabileceği tam sayı değerlerinin sayısı kaçtır?

- A) 23
- B) 24
- C) 25
- D) 26
- E) 27

---

1. $2 < x < 6$ için $6 < 3x < 18$.
2. $-3 < y < 4$ için $-8 < -2y < 6$.
3. Taraf tarafa toplanır: $-2 < 3x - 2y < 24$.
4. Uçlar dışarıda olduğundan tam sayılar $-1$'den 23'e kadardır. $23 - (-1) + 1 = 25$. Doğru cevap C.

Diğer şıklar: **23** işlem hatasıyla iki eksik bulunmuş / **24** alt uçtaki $-1$ sayılmamış / **26** $-2$ de sayılmış / **27** iki uç da sayılmış.
:::

:::soru{cevap="D"}
$x$ bir tam sayı olmak üzere $-3 \leq x \leq 5$ olduğuna göre $x^2$ ifadesinin alabileceği farklı değerlerin toplamı kaçtır?

- A) 9
- B) 30
- C) 54
- D) 55
- E) 69

---

1. Tam sayılar $-3, -2, -1, 0, 1, 2, 3, 4, 5$ olur.
2. Kareleri $9, 4, 1, 0, 1, 4, 9, 16, 25$ olur.
3. Farklı değerler $0, 1, 4, 9, 16, 25$ ve toplamları $55$. Doğru cevap D.

Diğer şıklar: **9** $x$ değerleri toplanmış / **30** $x = 5$ alınmamış / **54** işlem hatasıyla bir eksik bulunmuş / **69** aynı değerler tekrar toplanmış.
:::

:::soru{cevap="E"}
$-3 < x < -1$ olduğuna göre $\dfrac{1}{x}$ ifadesi aşağıdakilerden hangisinin aralığındadır?

- A) $-\dfrac{1}{3} < \dfrac{1}{x} < -1$
- B) $-3 < \dfrac{1}{x} < -1$
- C) $\dfrac{1}{3} < \dfrac{1}{x} < 1$
- D) $-1 \leq \dfrac{1}{x} \leq -\dfrac{1}{3}$
- E) $-1 < \dfrac{1}{x} < -\dfrac{1}{3}$

---

1. $x$ negatif olduğundan ters alınınca da sonuç negatif kalır ve eşitsizlik yönü değişir.
2. $x = -3$ için $\dfrac{1}{x} = -\dfrac{1}{3}$ ve $x = -1$ için $\dfrac{1}{x} = -1$. Uçlar dışarıdadır.
3. $-1 < \dfrac{1}{x} < -\dfrac{1}{3}$ olur. Doğru cevap E.

Diğer şıklar: **$-\dfrac{1}{3} < \dfrac{1}{x} < -1$** sınırların sırası değiştirilmemiş / **$-3 < \dfrac{1}{x} < -1$** $x$ ile $\dfrac{1}{x}$ aynı aralıkta sanılmış / **$\dfrac{1}{3} < \dfrac{1}{x} < 1$** işaret unutulmuş / **$-1 \leq \dfrac{1}{x} \leq -\dfrac{1}{3}$** uçlar dahil edilmiş.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Basit Eşitsizlikler';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="B"}
$|x + 2| = 6$ denkleminin çözüm kümesindeki elemanların toplamı kaçtır?

- A) -8
- B) -4
- C) -2
- D) 4
- E) 12

---

1. $|x + 2| = 6$ ise $x + 2 = 6$ ya da $x + 2 = -6$ olur.
2. Çözümler $x = 4$ ve $x = -8$ dir.
3. Toplam $4 + (-8) = -4$ olur. Doğru cevap B.

Diğer şıklar: **-8** yalnızca negatif çözüm alınmış / **-2** merkez olan $-2$ alınmış / **4** yalnızca pozitif çözüm alınmış / **12** iki çözümün farkı alınmış.
:::

:::soru{cevap="A"}
$|2x + 3| < 9$ eşitsizliğini sağlayan kaç tane $x$ tam sayısı vardır?

- A) 8
- B) 9
- C) 10
- D) 11
- E) 16

---

1. $-9 < 2x + 3 < 9$ yazılır.
2. Her taraftan 3 çıkarılır: $-12 < 2x < 6$. 2'ye bölünür: $-6 < x < 3$.
3. Tam sayılar $-5, -4, \ldots, 2$ ve $2 - (-5) + 1 = 8$ tanedir. Doğru cevap A.

Diğer şıklar: **9** bir uç fazla sayılmış / **10** uçlar dahil edilmiş / **11** işlem hatasıyla üç fazla bulunmuş / **16** işlem hatasıyla iki katı bulunmuş.
:::

:::soru{cevap="E"}
$|x + 2| + |x - 5| = 7$ eşitliğini sağlayan kaç tane $x$ tam sayısı vardır?

- A) 2
- B) 4
- C) 6
- D) 7
- E) 8

---

1. İfade, $x$'in $-2$ ve 5 noktalarına uzaklıkları toplamıdır.
2. $|-2 - 5| = 7$ olduğundan en küçük değer 7'dir ve bu değer $-2 \leq x \leq 5$ için elde edilir.
3. Tam sayılar $-2, -1, 0, 1, 2, 3, 4, 5$ olup toplam 8 tanedir. Doğru cevap E.

Diğer şıklar: **2** yalnızca iki uç değeri alınmış / **4** işlem hatasıyla yarısı bulunmuş / **6** iki uç değer sayılmamış / **7** fark ($|{-2} - 5|$) sayı sanılmış.
:::

:::soru{cevap="E"}
$a < b$, $|a| = 3$ ve $|b| = 5$ olduğuna göre $a + b$ toplamının alabileceği değerlerin toplamı kaçtır?

- A) -10
- B) 0
- C) 2
- D) 8
- E) 10

---

1. $a = \pm 3$ ve $b = \pm 5$ olabilir.
2. $a < b$ koşulu: $b = -5$ ise $a$ ($-3$ ya da 3) $b$'den büyük olur, bu yüzden $b = -5$ olamaz. Geriye $b = 5$ kalır.
3. $a = -3$ için $a + b = 2$, $a = 3$ için $a + b = 8$.
4. Değerlerin toplamı $2 + 8 = 10$ olur. Doğru cevap E.

Diğer şıklar: **-10** işaret hatası yapılmış / **0** $a < b$ koşulu unutulmuş / **2** yalnızca bir durum bulunmuş / **8** yalnızca bir durum bulunmuş.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Mutlak Değer';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="B"}
$\dfrac{3^4 \cdot 9^2}{27^2}$ işleminin sonucu kaçtır?

- A) 3
- B) 9
- C) 10
- D) 27
- E) 81

---

1. $9 = 3^2$ ve $27 = 3^3$ olduğundan $9^2 = 3^4$ ve $27^2 = 3^6$.
2. $\dfrac{3^4 \cdot 3^4}{3^6} = 3^{8 - 6} = 3^2$.
3. $3^2 = 9$ olur. Doğru cevap B.

Diğer şıklar: **3** üsler yanlış çıkarılmış / **10** işlem hatasıyla bir fazla bulunmuş / **27** üslerin toplamı yanlış hesaplanmış / **81** $27^2$ ile sadeleşme yapılmamış.
:::

:::soru{cevap="A"}
$2^{x+1} + 2^x + 2^{x-1} = 56$ olduğuna göre $x$ kaçtır?

- A) 4
- B) 5
- C) 6
- D) 7
- E) 8

---

1. Ortak çarpan $2^{x-1}$ alınır: $2^{x-1}(2^2 + 2 + 1) = 56$.
2. $2^{x-1} \cdot 7 = 56$ ve $2^{x-1} = 8 = 2^3$.
3. $x - 1 = 3$ ve $x = 4$. Kontrol: $2^5 + 2^4 + 2^3 = 32 + 16 + 8 = 56$. Doğru cevap A.

Diğer şıklar: **5** işlem hatasıyla bir fazla bulunmuş / **6** işlem hatasıyla iki fazla bulunmuş / **7** $7 \cdot 2^{x-1} = 56$ denkleminden 7 alınmış / **8** $2^{x-1} = 8$ değeri sonuç sanılmış.
:::

:::soru{cevap="E"}
$a = 3^{50}$, $b = 5^{30}$ ve $c = 2^{80}$ olduğuna göre aşağıdaki sıralamalardan hangisi doğrudur?

- A) $a < b < c$
- B) $c < a < b$
- C) $c < b < a$
- D) $a < c < b$
- E) $b < a < c$

---

1. Üsler 10'a eşitlenir: $a = (3^5)^{10} = 243^{10}$, $b = (5^3)^{10} = 125^{10}$, $c = (2^8)^{10} = 256^{10}$.
2. Üsler aynı olduğundan tabanı büyük olan büyüktür: $125 < 243 < 256$.
3. Sıralama $b < a < c$ olur. Doğru cevap E.

Diğer şıklar: **$a < b < c$** yalnızca tabanlara bakılmış / **$c < a < b$** üsler eşitlenmeden tahmin edilmiş / **$c < b < a$** sıralama tersten yazılmış / **$a < c < b$** iki sayının yeri karıştırılmış.
:::

:::soru{cevap="D"}
$8^{2023} + 4^{2024} + 9^{2025}$ toplamının birler basamağındaki rakam kaçtır?

- A) 1
- B) 3
- C) 5
- D) 7
- E) 9

---

1. 8'in birler basamağı döngüsü 8, 4, 2, 6'dır. $2023 = 4 \cdot 505 + 3$ ve kalan 3 olduğundan üçüncü değer 2 alınır.
2. 4'ün döngüsü 4, 6'dır. $2024$ çift olduğundan birler basamağı 6.
3. 9'un döngüsü 9, 1'dir. $2025$ tek olduğundan birler basamağı 9.
4. Birler basamağı $2 + 6 + 9 = 17$'nin 7'si, yani 7 olur. Doğru cevap D.

Diğer şıklar: **1** $8^{2023}$ için 6 alınmış / **3** $8^{2023}$ için 8 alınmış / **5** $4^{2024}$ için 4 alınmış / **9** $8^{2023}$ için 4 alınmış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Üslü Sayılar';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="B"}
$\sqrt{75} + \sqrt{27} - \sqrt{12}$ işleminin sonucu aşağıdakilerden hangisidir?

- A) $3\sqrt{10}$
- B) $6\sqrt{3}$
- C) $7\sqrt{3}$
- D) $8\sqrt{3}$
- E) $10\sqrt{3}$

---

1. Her terim sadeleştirilir: $\sqrt{75} = 5\sqrt{3}$, $\sqrt{27} = 3\sqrt{3}$, $\sqrt{12} = 2\sqrt{3}$.
2. Katsayılar işleme girer: $(5 + 3 - 2)\sqrt{3} = 6\sqrt{3}$. Doğru cevap B.

Diğer şıklar: **$3\sqrt{10}$** kök içleri toplanıp çıkarılmış / **$7\sqrt{3}$** $\sqrt{12}$ yerine $\sqrt{3}$ alınmış / **$8\sqrt{3}$** çıkarma unutulmuş / **$10\sqrt{3}$** çıkarma yerine toplama yapılmış.
:::

:::soru{cevap="D"}
$\dfrac{2}{\sqrt{5} - \sqrt{3}} + \dfrac{2}{\sqrt{5} + \sqrt{3}}$ işleminin sonucu kaçtır?

- A) $\dfrac{\sqrt{5}}{2}$
- B) $\sqrt{5}$
- C) $2\sqrt{3}$
- D) $2\sqrt{5}$
- E) $4\sqrt{5}$

---

1. İlk kesir: $\dfrac{2}{\sqrt{5} - \sqrt{3}} = \dfrac{2(\sqrt{5} + \sqrt{3})}{5 - 3} = \sqrt{5} + \sqrt{3}$.
2. İkinci kesir: $\dfrac{2}{\sqrt{5} + \sqrt{3}} = \sqrt{5} - \sqrt{3}$.
3. Toplam $(\sqrt{5} + \sqrt{3}) + (\sqrt{5} - \sqrt{3}) = 2\sqrt{5}$. Doğru cevap D.

Diğer şıklar: **$\dfrac{\sqrt{5}}{2}$** payda $5 + 3 = 8$ alınmış / **$\sqrt{5}$** payın 2 çarpanı unutulmuş / **$2\sqrt{3}$** ikinci kesir çıkarılmış / **$4\sqrt{5}$** paydadaki 2 ile sadeleştirme yapılmamış.
:::

:::soru{cevap="D"}
$\sqrt{33} + \sqrt{71}$ toplamının tam kısmı kaçtır?

- A) 10
- B) 12
- C) 13
- D) 14
- E) 15

---

1. $25 < 33 < 36$ olduğundan $5 < \sqrt{33} < 6$ ve daha yakından $\sqrt{33} \approx 5{,}74$.
2. $64 < 71 < 81$ olduğundan $8 < \sqrt{71} < 9$ ve $\sqrt{71} \approx 8{,}43$.
3. Toplam yaklaşık $14{,}17$ ve tam kısmı 14'tür. Doğru cevap D.

Diğer şıklar: **10** kök içleri toplanmış ($\sqrt{104}$) / **12** iki kök de 6 sanılmış / **13** kökler ayrı ayrı aşağı yuvarlanmış / **15** kökler ayrı ayrı yukarı yuvarlanmış.
:::

:::soru{cevap="B"}
$\sqrt{17 - 12\sqrt{2}}$ ifadesi aşağıdakilerden hangisine eşittir?

- A) $2\sqrt{2} - 3$
- B) $3 - 2\sqrt{2}$
- C) $3 - \sqrt{2}$
- D) $5 - 2\sqrt{2}$
- E) $3 + 2\sqrt{2}$

---

1. $12\sqrt{2} = 2 \cdot 6\sqrt{2}$ olduğundan ifade $\sqrt{17 - 2 \cdot 6\sqrt{2}}$ biçimindedir.
2. Kare toplamı 17 ve çarpımı $6\sqrt{2}$ olan iki sayı 3 ile $2\sqrt{2}$'dir. Çünkü $3^2 + (2\sqrt{2})^2 = 9 + 8 = 17$.
3. İfade $\sqrt{(3 - 2\sqrt{2})^2} = 3 - 2\sqrt{2}$ olur ve $3 > 2\sqrt{2}$ olduğundan pozitiftir. Doğru cevap B.

Diğer şıklar: **$2\sqrt{2} - 3$** sonuç negatif bulunmuş / **$3 - \sqrt{2}$** kökün katsayısı 2 unutulmuş / **$5 - 2\sqrt{2}$** katsayılar ayrı işlenmiş / **$3 + 2\sqrt{2}$** eşlenik işareti yanlış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Köklü Sayılar';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="E"}
$1012^2 - 988^2$ işleminin sonucu kaçtır?

- A) 24
- B) 576
- C) 2000
- D) 24000
- E) 48000

---

1. İki kare farkı: $a^2 - b^2 = (a - b)(a + b)$.
2. $(1012 - 988)(1012 + 988) = 24 \cdot 2000$.
3. Sonuç $48000$ olur. Doğru cevap E.

Diğer şıklar: **24** yalnızca $a - b$ alınmış / **576** $(a - b)^2$ hesaplanmış / **2000** yalnızca $a + b$ alınmış / **24000** sonuç yarıya bölünmüş.
:::

:::soru{cevap="C"}
$x = 7$ için $\dfrac{x^2 - x - 12}{x^2 - 9}$ ifadesinin değeri kaçtır?

- A) $\dfrac{1}{2}$
- B) $\dfrac{3}{5}$
- C) $\dfrac{3}{4}$
- D) $\dfrac{5}{4}$
- E) $\dfrac{4}{3}$

---

1. Payı ve paydayı çarpanlarına ayır: $x^2 - x - 12 = (x - 4)(x + 3)$ ve $x^2 - 9 = (x - 3)(x + 3)$.
2. Ortak çarpan $(x + 3)$ sadeleşir: $\dfrac{x - 4}{x - 3}$.
3. $x = 7$ için $\dfrac{3}{4}$. Doğru cevap C.

Diğer şıklar: **$\dfrac{1}{2}$** $x - 3$ yerine $x - 1$ alınmış / **$\dfrac{3}{5}$** $x - 3$ yerine $x - 2$ alınmış / **$\dfrac{5}{4}$** $x - 4$ yerine $x - 2$ alınmış / **$\dfrac{4}{3}$** pay ile payda yer değiştirmiş.
:::

:::soru{cevap="E"}
$x - \dfrac{1}{x} = 4$ olduğuna göre $x^2 + \dfrac{1}{x^2}$ ifadesinin değeri kaçtır?

- A) 8
- B) 14
- C) 16
- D) 17
- E) 18

---

1. Verilen eşitliğin karesi alınır: $\left(x - \dfrac{1}{x}\right)^2 = x^2 - 2 + \dfrac{1}{x^2}$.
2. $16 = x^2 - 2 + \dfrac{1}{x^2}$ olduğundan $x^2 + \dfrac{1}{x^2} = 18$ olur. Doğru cevap E.

Diğer şıklar: **8** $2 \cdot 4$ hesaplanmış / **14** 2 çıkarılmış / **16** 2 eklemek unutulmuş / **17** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="C"}
$a + b = 7$ ve $a \cdot b = 10$ olduğuna göre $a^3 + b^3$ ifadesinin değeri kaçtır?

- A) 49
- B) 70
- C) 133
- D) 203
- E) 273

---

1. $a^3 + b^3 = (a + b)(a^2 - ab + b^2)$ ve $a^2 + b^2 = (a + b)^2 - 2ab = 49 - 20 = 29$.
2. $a^2 - ab + b^2 = 29 - 10 = 19$.
3. $a^3 + b^3 = 7 \cdot 19 = 133$. Doğru cevap C.

Diğer şıklar: **49** $(a + b)^2$ alınmış / **70** $ab(a + b)$ alınmış / **203** $a^2 - ab + b^2$ yerine $a^2 + b^2$ kullanılmış / **273** küp farkı özdeşliği karıştırılmış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Çarpanlara Ayırma';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="B"}
$\dfrac{a}{b} = \dfrac{5}{9}$ ve $b - a = 28$ olduğuna göre $a$ kaçtır?

- A) 20
- B) 35
- C) 36
- D) 63
- E) 140

---

1. $a = 5k$ ve $b = 9k$ yazılır.
2. $b - a = 9k - 5k = 4k = 28$ ve $k = 7$.
3. $a = 5 \cdot 7 = 35$. Doğru cevap B.

Diğer şıklar: **20** $k = 4$ alınmış / **36** işlem hatasıyla bir fazla bulunmuş / **63** $b$ bulunmuş / **140** fark $5$ ile çarpılmış.
:::

:::soru{cevap="A"}
12 işçi bir işi 15 günde bitirebilmektedir. Aynı işi 20 işçi kaç günde bitirir?

- A) 9
- B) 10
- C) 23
- D) 25
- E) 180

---

1. İş sabit olduğundan işçi sayısı ile gün sayısı **ters orantılıdır**.
2. Toplam iş $12 \cdot 15 = 180$ işçi-gündür.
3. 20 işçi için $\dfrac{180}{20} = 9$ gün gerekir. Doğru cevap A.

Diğer şıklar: **10** işlem hatasıyla bir fazla bulunmuş / **23** işçi farkı günlere eklenmiş / **25** doğru orantı kurulmuş / **180** toplam iş sonuç sanılmış.
:::

:::soru{cevap="B"}
$a : b = 3 : 4$, $b : c = 6 : 5$ ve $a + b + c = 155$ olduğuna göre $c$ kaçtır?

- A) 45
- B) 50
- C) 51
- D) 52
- E) 60

---

1. Ortak terim $b$'yi eşitle. 4 ile 6'nın EKOK'u 12'dir. $a : b = 9 : 12$ ve $b : c = 12 : 10$.
2. $a : b : c = 9 : 12 : 10$ ve parça toplamı 31'dir. $k = \dfrac{155}{31} = 5$.
3. $c = 10 \cdot 5 = 50$. Doğru cevap B.

Diğer şıklar: **45** $a$ bulunmuş / **51** işlem hatasıyla bir fazla bulunmuş / **52** işlem hatasıyla iki fazla bulunmuş / **60** $b$ bulunmuş.
:::

:::soru{cevap="A"}
$x$, $y$ ve $z$ sayıları için $2x = 3y = 4z$ ve $x + y + z = 65$ olduğuna göre $y$ kaçtır?

- A) 20
- B) 21
- C) 30
- D) 40
- E) 60

---

1. $2x = 3y = 4z = 12k$ yazılırsa $x = 6k$, $y = 4k$, $z = 3k$ olur. 2, 3 ve 4'ün EKOK'u 12'dir.
2. $6k + 4k + 3k = 13k = 65$ ve $k = 5$.
3. $y = 4 \cdot 5 = 20$. Doğru cevap A.

Diğer şıklar: **21** işlem hatasıyla bir fazla bulunmuş / **30** $x$ bulunmuş / **40** işlem hatasıyla iki katı bulunmuş / **60** ortak değer $12k$ alınmış.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Oran ve Orantı';

update public.lessons l
set body = left(l.body, position(E'## Mini test\n\n' in l.body) - 1) || $mt$## Mini test

:::soru{cevap="E"}
$\dfrac{3x - 2}{4} = \dfrac{x + 6}{3}$ denkleminin çözümü olan $x$ kaçtır?

- A) 2
- B) 3
- C) 4
- D) 5
- E) 6

---

1. Paydaların EKOK'u 12'dir. İçler dışlar çarpımıyla $3(3x - 2) = 4(x + 6)$.
2. $9x - 6 = 4x + 24$ ve $5x = 30$, $x = 6$.
3. Kontrol: $\dfrac{16}{4} = 4$ ve $\dfrac{12}{3} = 4$. Doğru cevap E.

Diğer şıklar: **2** işlem hatasıyla dört eksik bulunmuş / **3** işlem hatasıyla yarısı bulunmuş / **4** paydalar yok sayılmış / **5** $5x = 30$ denklemindeki katsayı sonuç sanılmış.
:::

:::soru{cevap="B"}
$3x + 2y = 19$ ve $x - y = -2$ denklem sisteminin çözümüne göre $x \cdot y$ kaçtır?

- A) 9
- B) 15
- C) 16
- D) 25
- E) 30

---

1. İkinci denklemden $x = y - 2$ yazılır ve ilk denklemde yerine konur: $3(y - 2) + 2y = 19$.
2. $5y - 6 = 19$ ve $y = 5$, $x = 3$.
3. $x \cdot y = 3 \cdot 5 = 15$. Doğru cevap B.

Diğer şıklar: **9** $x^2$ bulunmuş / **16** işlem hatasıyla bir fazla bulunmuş / **25** $y^2$ bulunmuş / **30** $2xy$ hesaplanmış.
:::

:::soru{cevap="E"}
$(a + 2)x + 5 = 3x - b$ denkleminin çözüm kümesi gerçek sayılar kümesi olduğuna göre $a - b$ ifadesinin değeri kaçtır?

- A) -4
- B) 1
- C) 4
- D) 5
- E) 6

---

1. Denklem $(a + 2 - 3)x = -b - 5$ yani $(a - 1)x = -(b + 5)$ olur.
2. Çözüm kümesi gerçek sayılar ise $a - 1 = 0$ ve $b + 5 = 0$ olmalıdır: $a = 1$ ve $b = -5$.
3. $a - b = 1 - (-5) = 6$. Doğru cevap E.

Diğer şıklar: **-4** $b = 5$ alınmış / **1** yalnızca $a$ bulunmuş / **4** $a = -1$ alınmış / **5** yalnızca $b$ nin mutlak değeri alınmış.
:::

:::soru{cevap="E"}
$x + y = 9$, $y + z = 11$ ve $x + z = 14$ olduğuna göre $x \cdot y \cdot z$ çarpımı kaçtır?

- A) 17
- B) 18
- C) 24
- D) 48
- E) 144

---

1. Üç denklemi topla: $2(x + y + z) = 34$ ve $x + y + z = 17$.
2. $z = 17 - 9 = 8$, $x = 17 - 11 = 6$, $y = 17 - 14 = 3$.
3. $x \cdot y \cdot z = 6 \cdot 3 \cdot 8 = 144$. Doğru cevap E.

Diğer şıklar: **17** $x + y + z$ sonuç sanılmış / **18** $x \cdot y$ bulunmuş / **24** $y \cdot z$ bulunmuş / **48** $x \cdot z$ bulunmuş.
:::$mt$ || substring(l.body from position(E'\n\n## Kendini dene' in l.body))
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Denklem Çözme';
