-- 20261025020000_questions_lgs_mat_1. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-mat | Çarpanlar ve Katlar
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Çarpanlar ve Katlar konu testi$t$, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Çarpanlar ve Katlar$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Aşağıdaki sayılardan hangisi asal sayıdır?$q$, array[$o$$51$$o$, $o$$53$$o$, $o$$57$$o$, $o$$91$$o$], 1, $e$1. Asal sayı, yalnızca 1'e ve kendisine bölünen sayıdır. Küçük asallara bölünüp bölünmediğine bak.
2. $51 = 3 \cdot 17$, $57 = 3 \cdot 19$ ve $91 = 7 \cdot 13$ olduğundan bileşiktir.
3. $53$ sayısı 2, 3, 5 ve 7'ye bölünmez. Asaldır.

Diğer şıklar: **A** 3'e bölünür / **C** 3'e bölünür / **D** 7'ye bölünür.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$252$ sayısı asal çarpanlarına ayrılırsa aşağıdakilerden hangisi elde edilir?$q$, array[$o$$2 \cdot 3^2 \cdot 14$$o$, $o$$2^2 \cdot 3 \cdot 21$$o$, $o$$2^3 \cdot 3 \cdot 7$$o$, $o$$2^2 \cdot 3^2 \cdot 7$$o$], 3, $e$1. $252 \div 2 = 126$, $126 \div 2 = 63$, $63 \div 3 = 21$, $21 \div 3 = 7$. Son bölüm 7, asaldır.
2. $252 = 2 \cdot 2 \cdot 3 \cdot 3 \cdot 7 = 2^2 \cdot 3^2 \cdot 7$.

Diğer şıklar: **A** ve **B** 14 ile 21 asal değildir, çarpanlara ayırma bitmemiş / **C** çarpımı $168$ eder.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$A = 2^3 \cdot 3^2 \cdot 5$ sayısının kaç tane pozitif böleni vardır?$q$, array[$o$$6$$o$, $o$$24$$o$, $o$$12$$o$, $o$$30$$o$], 1, $e$1. Bölen sayısı için her üse 1 eklenip çarpılır.
2. $(3+1)(2+1)(1+1) = 4 \cdot 3 \cdot 2 = 24$.

Diğer şıklar: **A** üsleri toplamak ($3+2+1$) / **C** son çarpanın üssüne 1 eklememek / **D** tabanları çarpmak ($2 \cdot 3 \cdot 5$).$e$, 2),
  (4, 'lgs-mat', null::integer, $q$Boyları $84$ cm ve $120$ cm olan iki ip, hiç parça artmayacak biçimde ve eşit uzunlukta, en uzun parçalara ayrılıyor.

Buna göre toplam kaç parça elde edilir?$q$, array[$o$$12$$o$, $o$$15$$o$, $o$$17$$o$, $o$$840$$o$], 2, $e$1. Parçaların en uzun olması için uzunluk EBOB$(84, 120)$ olmalı. $84 = 2^2 \cdot 3 \cdot 7$ ve $120 = 2^3 \cdot 3 \cdot 5$ olduğundan EBOB $= 2^2 \cdot 3 = 12$ cm.
2. İlk ip $84 \div 12 = 7$, ikinci ip $120 \div 12 = 10$ parça verir.
3. Toplam $7 + 10 = 17$ parça.

Diğer şıklar: **A** parça uzunluğu / **B** kesim sayısı ($6 + 9$) / **D** EKOK değeri.$e$, 2),
  (5, 'lgs-mat', null::integer, $q$Üç alarm saati sırasıyla $12$, $18$ ve $30$ dakikada bir çalıyor. Üçü saat 09.00'da birlikte çalıyor.

Buna göre bu alarmlar yeniden ilk kez saat kaçta birlikte çalar?$q$, array[$o$$12.00$$o$, $o$$09.06$$o$, $o$$10.00$$o$, $o$$09.36$$o$], 0, $e$1. Birlikte buluşma anı EKOK ile bulunur.
2. $12 = 2^2 \cdot 3$, $18 = 2 \cdot 3^2$, $30 = 2 \cdot 3 \cdot 5$. EKOK $= 2^2 \cdot 3^2 \cdot 5 = 180$ dakika.
3. $180$ dakika $3$ saattir. $09.00 + 3$ saat $= 12.00$.

Diğer şıklar: **B** EBOB olan 6 dakikayı eklemek / **C** 60 dakika sanmak / **D** yalnızca ilk iki saatin EKOK'unu ($36$) almak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$İki doğal sayının çarpımı $720$, EBOB'u $6$ olduğuna göre bu iki sayının EKOK'u kaçtır?$q$, array[$o$$6$$o$, $o$$60$$o$, $o$$120$$o$, $o$$4320$$o$], 2, $e$1. EBOB$(a,b) \cdot$ EKOK$(a,b) = a \cdot b$ bağıntısını kullan.
2. $6 \cdot$ EKOK $= 720$ olduğundan EKOK $= 120$.

Diğer şıklar: **A** EBOB'un kendisi / **B** $720 \div 12$ gibi yanlış bölme / **D** $720 \cdot 6$ çarpmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$$24 < a < 32$ koşulunu sağlayan kaç tane $a$ doğal sayısı $36$ ile aralarında asaldır?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$7$$o$, $o$$3$$o$], 3, $e$1. $36 = 2^2 \cdot 3^2$. $a$ sayısında 2 ya da 3 çarpanı olmamalı.
2. $25, 26, 27, 28, 29, 30, 31$ sayılarından $26, 28, 30$ çifttir, $27$ ise 3'ün katıdır. Geriye $25, 29, 31$ kalır.
3. Toplam $3$ sayı vardır.

Diğer şıklar: **A** aralarında asalı yalnızca asal sayı sanmak ($29, 31$) / **B** tek sayıları saymak ($25, 27, 29, 31$) / **C** aralıktaki bütün sayıları saymak.$e$, 3),
  (8, 'lgs-mat', null::integer, $q$$3$'e, $4$'e ve $5$'e bölündüğünde $2$ kalanını veren en küçük doğal sayı kaçtır?$q$, array[$o$$60$$o$, $o$$62$$o$, $o$$58$$o$, $o$$122$$o$], 1, $e$1. Sayıdan 2 çıkarılırsa 3'e, 4'e ve 5'e tam bölünür. En küçük böyle sayı EKOK$(3,4,5) = 60$.
2. İstenen sayı $60 + 2 = 62$.

Diğer şıklar: **A** kalanı unutmak / **C** kalanı çıkarmak / **D** EKOK'un iki katına kalanı eklemek.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$$36$ öğrenci, her satırda aynı sayıda öğrenci olacak şekilde en az $2$ satıra oturtulacaktır.

Buna göre kaç farklı oturma düzeni oluşturulabilir?$q$, array[$o$$8$$o$, $o$$9$$o$, $o$$7$$o$, $o$$4$$o$], 0, $e$1. Satır sayısı $36$'nın 1'den büyük bir çarpanı olmalı.
2. $36 = 2^2 \cdot 3^2$ sayısının $(2+1)(2+1) = 9$ çarpanı vardır. Bunlardan 1 çıkarılır: $9 - 1 = 8$.

Diğer şıklar: **B** 1 satırı da saymak / **C** hem 1 hem 36'yı dışarıda bırakmak / **D** çarpanların yarısını almak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$180$ sayısının farklı asal çarpanlarının toplamı kaçtır?$q$, array[$o$$10$$o$, $o$$15$$o$, $o$$30$$o$, $o$$5$$o$], 0, $e$1. $180 = 2^2 \cdot 3^2 \cdot 5$. Farklı asal çarpanlar $2, 3, 5$.
2. Toplam $2 + 3 + 5 = 10$.

Diğer şıklar: **B** tekrarlayan çarpanları da toplamak ($2+2+3+3+5$) / **C** çarpmak / **D** üsleri toplamak.$e$, 1),
  (11, 'lgs-mat', null::integer, $q$$a = 2^x \cdot 3^2$ sayısının tam olarak $18$ pozitif böleni olduğuna göre $x$ kaçtır?$q$, array[$o$$3$$o$, $o$$4$$o$, $o$$6$$o$, $o$$5$$o$], 3, $e$1. Bölen sayısı $(x+1)(2+1) = 18$.
2. $x + 1 = 6$ olduğundan $x = 5$.

Diğer şıklar: **A** ve **B** hesap hatası / **C** $x+1$ değerini $x$ sanmak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$Kenar uzunlukları $48$ cm ve $72$ cm olan dikdörtgen biçimli bir zemin, hiç kesilmeden aynı boyutlu kare fayanslarla kaplanacaktır.

En az sayıda fayans kullanılacağına göre kaç fayans gerekir?$q$, array[$o$$144$$o$, $o$$24$$o$, $o$$6$$o$, $o$$12$$o$], 2, $e$1. Fayans sayısının en az olması için kare en büyük olmalı. Kenar EBOB$(48, 72) = 24$ cm.
2. $48 \div 24 = 2$ ve $72 \div 24 = 3$. Fayans sayısı $2 \cdot 3 = 6$.

Diğer şıklar: **A** EKOK değeri / **B** fayansın kenar uzunluğu / **D** iki sayının toplamı gibi hesap hatası.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$En küçük asal sayı ile en büyük iki basamaklı asal sayının toplamı kaçtır?$q$, array[$o$$98$$o$, $o$$97$$o$, $o$$99$$o$, $o$$101$$o$], 2, $e$1. En küçük asal sayı $2$'dir. En büyük iki basamaklı asal sayı $97$'dir ($99 = 9 \cdot 11$ ve $98$ çifttir).
2. Toplam $2 + 97 = 99$.

Diğer şıklar: **A** 1'i asal sayıp $1 + 97$ yapmak / **B** yalnızca büyük asalı almak / **D** $99$'u asal sanıp $99 + 2$ yapmak.$e$, 1),
  (14, 'lgs-mat', null::integer, $q$$N = 2^2 \cdot 3 \cdot 5$ sayısının kaç tane çift pozitif böleni vardır?$q$, array[$o$$4$$o$, $o$$8$$o$, $o$$6$$o$, $o$$12$$o$], 1, $e$1. $N$'nin bölen sayısı $(2+1)(1+1)(1+1) = 12$.
2. Tek bölenler 2'li çarpan içermeyenlerdir: $3 \cdot 5$'in bölen sayısı $(1+1)(1+1) = 4$.
3. Çift bölenler $12 - 4 = 8$ tanedir.

Diğer şıklar: **A** tek bölenleri saymak / **C** hesap hatası / **D** bütün bölenleri saymak.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$$100$'den büyük olup $3$'e, $4$'e ve $6$'ya tam bölünebilen en küçük doğal sayı kaçtır?$q$, array[$o$$96$$o$, $o$$102$$o$, $o$$120$$o$, $o$$108$$o$], 3, $e$1. Üç sayıya da bölünen sayılar EKOK$(3,4,6) = 12$'nin katlarıdır.
2. $12$'nin katları: $\ldots, 96, 108, 120$. $100$'den büyük ilk kat $108$.

Diğer şıklar: **A** 100'den küçük / **B** 3'e ve 6'ya bölünür ama 4'e bölünmez / **C** 108'den sonraki kat.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$EBOB'u $1$, EKOK'u $84$ olan iki doğal sayının toplamı en az kaçtır?$q$, array[$o$$19$$o$, $o$$25$$o$, $o$$31$$o$, $o$$85$$o$], 0, $e$1. EBOB $= 1$ ise sayılar aralarında asaldır ve çarpımları EKOK'a eşittir: $a \cdot b = 84$.
2. Aralarında asal çiftler: $(1, 84)$, $(3, 28)$, $(4, 21)$, $(7, 12)$.
3. Toplamlar: $85, 31, 25, 19$. En küçüğü $19$.

Diğer şıklar: **B, C, D** başka çiftlerin toplamları.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

