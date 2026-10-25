-- 20261025070000_questions_lgs_mat_2. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.

-- lgs | konu | lgs-mat | Üslü İfadeler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Üslü İfadeler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üslü İfadeler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$2^{-3}$ ifadesinin değeri kaçtır?$q$, array[$o$$-8$$o$, $o$$-6$$o$, $o$$\frac{1}{8}$$o$, $o$$\frac{1}{6}$$o$], 2, $e$1. Negatif üs, tabanın çarpmaya göre tersini alır: $2^{-3} = \dfrac{1}{2^3}$.
2. $2^3 = 8$ olduğundan $2^{-3} = \dfrac{1}{8}$.

Diğer şıklar: **A** negatif üssü sayının işareti sanmak / **B** $2 \cdot (-3)$ işlemini yapmak / **D** $\frac{1}{2 \cdot 3}$ yazmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$(-2)^4 + (-3)^2$ işleminin sonucu kaçtır?$q$, array[$o$$14$$o$, $o$$25$$o$, $o$$64$$o$, $o$$144$$o$], 1, $e$1. Çift kuvvette negatif taban pozitif sonuç verir. $(-2)^4 = 16$ ve $(-3)^2 = 9$.
2. $16 + 9 = 25$.

Diğer şıklar: **A** üsleri tabanlarla çarpmak ($2 \cdot 4 + 3 \cdot 2$) / **C** $2^{4+2}$ gibi üsleri toplayıp tabanı korumak / **D** $16 \cdot 9$ çarpımını yazmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$\dfrac{3^7 \cdot 3^{-2}}{3^3}$ işleminin sonucu kaçtır?$q$, array[$o$$\frac{1}{9}$$o$, $o$$1$$o$, $o$$3$$o$, $o$$9$$o$], 3, $e$1. Çarpmada üsler toplanır: $3^7 \cdot 3^{-2} = 3^{5}$.
2. Bölmede üsler çıkarılır: $\dfrac{3^5}{3^3} = 3^2$.
3. $3^2 = 9$.

Diğer şıklar: **A** üssün işaretini ters yazmak / **B** üssü $0$ bulmak / **C** üssü $1$ bulmak.$e$, 2),
  (4, 'lgs-mat', null::integer, $q$$(2^3)^2 \cdot 2^{-4}$ işleminin sonucu kaçtır?$q$, array[$o$$4$$o$, $o$$8$$o$, $o$$16$$o$, $o$$64$$o$], 0, $e$1. Kuvvetin kuvvetinde üsler çarpılır: $(2^3)^2 = 2^6$.
2. Çarpmada üsler toplanır: $2^6 \cdot 2^{-4} = 2^{2}$.
3. $2^2 = 4$.

Diğer şıklar: **B** $2^{6-3}$ yazmak / **C** $2^{6-2}$ yazmak / **D** $2^{-4}$ çarpanını yok saymak.$e$, 2),
  (5, 'lgs-mat', null::integer, $q$$2^{x+1} = 64$ olduğuna göre $x$ kaçtır?$q$, array[$o$$4$$o$, $o$$5$$o$, $o$$6$$o$, $o$$31$$o$], 1, $e$1. $64 = 2^6$ olduğundan $2^{x+1} = 2^6$.
2. Tabanlar eşit olduğundan üsler eşit: $x + 1 = 6$.
3. $x = 5$.

Diğer şıklar: **A** $1$ değerini iki kez çıkarmak / **C** $x + 1 = 6$ bulup $1$ çıkarmayı unutmak / **D** $64 \div 2 - 1$ işlemi yapmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Bir polen tanesinin çapı $0{,}0000025$ metredir.

Bu uzunluğun bilimsel gösterimi aşağıdakilerden hangisidir?$q$, array[$o$$2{,}5 \cdot 10^{-5}$$o$, $o$$25 \cdot 10^{-7}$$o$, $o$$2{,}5 \cdot 10^{6}$$o$, $o$$2{,}5 \cdot 10^{-6}$$o$], 3, $e$1. Bilimsel gösterimde sayı, 1 ile 10 arasında bir katsayı ile 10'un kuvvetinin çarpımı olarak yazılır.
2. Virgülü $2$ ile $5$'in arasına almak için sağa 6 basamak kaydırırız. Küçük bir sayı olduğundan üs negatiftir: $10^{-6}$.
3. $0{,}0000025 = 2{,}5 \cdot 10^{-6}$.

Diğer şıklar: **A** virgülü bir basamak eksik kaydırmak / **B** katsayıyı 1 ile 10 arasında yazmamak / **C** üssün işaretini yanlış almak.$e$, 1),
  (7, 'lgs-mat', null::integer, $q$$a = 2^{30}$, $b = 3^{20}$ ve $c = 5^{10}$ olduğuna göre bu sayıların küçükten büyüğe sıralanışı aşağıdakilerden hangisidir?$q$, array[$o$$a < b < c$$o$, $o$$b < a < c$$o$, $o$$c < a < b$$o$, $o$$c < b < a$$o$], 2, $e$1. Üsleri $10$ yapalım: $a = (2^3)^{10} = 8^{10}$, $b = (3^2)^{10} = 9^{10}$, $c = 5^{10}$.
2. Üsler eşit olduğunda tabanı büyük olan daha büyüktür: $5 < 8 < 9$.
3. Bu yüzden $c < a < b$.

Diğer şıklar: **A** tabanı büyük olanı büyük sanmak / **B** üsleri karşılaştırmadan tabana bakmak / **D** üssü en büyük olanı en büyük sanmak.$e$, 3),
  (8, 'lgs-mat', null::integer, $q$Bir laboratuvarda başlangıçta $5$ bakteri vardır. Bakteri sayısı her saat sonunda $2$ katına çıkmaktadır.

Buna göre $6$ saat sonra kaç bakteri olur?$q$, array[$o$$60$$o$, $o$$64$$o$, $o$$160$$o$, $o$$320$$o$], 3, $e$1. Her saat sayı $2$ ile çarpılır. $6$ saat sonra $2^6$ katı olur.
2. $5 \cdot 2^6 = 5 \cdot 64 = 320$.

Diğer şıklar: **A** $5 \cdot 2 \cdot 6$ yapmak / **B** başlangıçtaki $5$ bakteriyi hesaba katmamak / **C** $5$ saat sonrasını bulmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$Aşağıdaki eşitliklerden hangisi doğrudur?$q$, array[$o$$\left(\dfrac{1}{3}\right)^{-2} = 9$$o$, $o$$2^3 \cdot 2^2 = 2^6$$o$, $o$$(2^3)^2 = 2^5$$o$, $o$$3^0 = 0$$o$], 0, $e$1. $\left(\dfrac{1}{3}\right)^{-2}$ ifadesinde negatif üs, kesri ters çevirir: $3^2 = 9$. Eşitlik doğrudur.
2. Diğer eşitliklerde işlem hatası vardır.

Diğer şıklar: **B** çarpmada üsleri çarpmak / **C** kuvvetin kuvvetinde üsleri toplamak / **D** sıfırıncı kuvveti $0$ sanmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$\left(\dfrac{2}{3}\right)^{-3}$ ifadesinin değeri kaçtır?$q$, array[$o$$\frac{8}{27}$$o$, $o$$\frac{27}{8}$$o$, $o$$\frac{9}{2}$$o$, $o$$\frac{27}{2}$$o$], 1, $e$1. Negatif üs, kesri ters çevirir: $\left(\dfrac{2}{3}\right)^{-3} = \left(\dfrac{3}{2}\right)^3$.
2. $\dfrac{3^3}{2^3} = \dfrac{27}{8}$.

Diğer şıklar: **A** kesri ters çevirmeden üssü pozitif almak / **C** $\dfrac{3}{2} \cdot 3$ yazmak / **D** paydayı küpe almamak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$$\dfrac{2^6 \cdot 3^4}{6^4}$ işleminin sonucu kaçtır?$q$, array[$o$$0$$o$, $o$$\frac{1}{4}$$o$, $o$$2$$o$, $o$$4$$o$], 3, $e$1. $6^4 = 2^4 \cdot 3^4$ olarak yazılır.
2. $\dfrac{2^6 \cdot 3^4}{2^4 \cdot 3^4} = 2^{6-4} \cdot 3^{4-4} = 2^2 \cdot 3^0$.
3. $3^0 = 1$ olduğundan sonuç $4 \cdot 1 = 4$.

Diğer şıklar: **A** $3^0$ değerini $0$ almak / **B** payı ve paydayı ters yazmak / **C** $2^2$ yerine $2$ yazmak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$$2^{x+2} + 2^x = 80$ olduğuna göre $x$ kaçtır?$q$, array[$o$$4$$o$, $o$$6$$o$, $o$$8$$o$, $o$$16$$o$], 0, $e$1. $2^{x+2} = 2^x \cdot 2^2 = 4 \cdot 2^x$.
2. Denklem $4 \cdot 2^x + 2^x = 80$, yani $5 \cdot 2^x = 80$ olur.
3. $2^x = 16 = 2^4$ olduğundan $x = 4$.

Diğer şıklar: **B** $2^{x+2} = 64$ alıp $x = 6$ bulmak / **C** $80 \div 10$ işlemi yapmak / **D** $2^x = 16$ bulup $x$ yerine $16$ yazmak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$$\dfrac{3{,}6 \cdot 10^5}{1{,}2 \cdot 10^2}$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$300$$o$, $o$$3000$$o$, $o$$30000$$o$, $o$$30000000$$o$], 1, $e$1. Katsayılar kendi arasında bölünür: $\dfrac{3{,}6}{1{,}2} = 3$.
2. $10$'un kuvvetleri bölünürken üsler çıkarılır: $\dfrac{10^5}{10^2} = 10^3$.
3. Sonuç $3 \cdot 10^3 = 3000$.

Diğer şıklar: **A** üssü $2$ bulmak / **C** üssü $4$ bulmak / **D** üsleri toplamak ($10^{5+2}$).$e$, 2),
  (14, 'lgs-mat', null::integer, $q$Aşağıdaki sayılardan hangisi en büyüktür?$q$, array[$o$$2^{-1}$$o$, $o$$3^{-2}$$o$, $o$$5^{-1}$$o$, $o$$4^{-1}$$o$], 0, $e$1. Negatif üsleri kesir olarak yaz: $2^{-1} = \dfrac{1}{2}$, $3^{-2} = \dfrac{1}{9}$, $4^{-1} = \dfrac{1}{4}$, $5^{-1} = \dfrac{1}{5}$.
2. Payları eşit olan kesirlerde paydası en küçük olan en büyüktür. En büyük $\dfrac{1}{2}$ yani $2^{-1}$.

Diğer şıklar: **B** tabanı büyük olan sayıyı büyük sanmak / **C** negatif üslü ifadelerde taban büyüdükçe değerin büyüdüğünü sanmak / **D** paydası büyük kesri büyük sanmak.$e$, 2),
  (15, 'lgs-mat', null::integer, $q$$2^{12}$ sayısı kaç basamaklıdır?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$4$$o$, $o$$5$$o$], 2, $e$1. $2^{10} = 1024$ olduğunu bildiğimizden $2^{12} = 1024 \cdot 4$.
2. $1024 \cdot 4 = 4096$ sayısı $4$ basamaklıdır.

Diğer şıklar: **A** $2^{12}$ yerine $2 \cdot 12 = 24$ almak / **B** $2^{12}$ yerine $2^{10} = 1024$ değerine bakmak / **D** $2^{16} = 65536$ ile karıştırmak.$e$, 1),
  (16, 'lgs-mat', null::integer, $q$$2^x = a$ olduğuna göre $8^{x+1}$ ifadesinin $a$ cinsinden eşiti aşağıdakilerden hangisidir?$q$, array[$o$$2a^3$$o$, $o$$a^3 + 8$$o$, $o$$8a^3$$o$, $o$$3a + 3$$o$], 2, $e$1. $8 = 2^3$ olduğundan $8^{x+1} = 2^{3(x+1)} = 2^{3x+3}$.
2. $2^{3x+3} = 2^{3x} \cdot 2^3 = (2^x)^3 \cdot 8$.
3. $2^x = a$ olduğundan sonuç $8a^3$.

Diğer şıklar: **A** $3(x+1)$ yerine $3x + 1$ yazmak / **B** çarpma yerine toplama yapmak / **D** üssü katsayı gibi çarpmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Kareköklü İfadeler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Kareköklü İfadeler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Kareköklü İfadeler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$\sqrt{144} + \sqrt{25}$ işleminin sonucu kaçtır?$q$, array[$o$$7$$o$, $o$$11$$o$, $o$$13$$o$, $o$$17$$o$], 3, $e$1. $12^2 = 144$ olduğundan $\sqrt{144} = 12$.
2. $5^2 = 25$ olduğundan $\sqrt{25} = 5$.
3. $12 + 5 = 17$.

Diğer şıklar: **A** $\sqrt{144} - \sqrt{25}$ işlemini yapmak / **B** $\sqrt{144}$ değerini yarısı kadar ($6$) almak / **C** $\sqrt{144 + 25}$ işlemini yapmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$\sqrt{75}$ sayısı $a\sqrt{b}$ biçiminde yazıldığında ($b$ en küçük pozitif tam sayı olacak şekilde) aşağıdakilerden hangisi elde edilir?$q$, array[$o$$3\sqrt{5}$$o$, $o$$25\sqrt{3}$$o$, $o$$15\sqrt{5}$$o$, $o$$5\sqrt{3}$$o$], 3, $e$1. $75$ sayısını içinde tam kare bulunan çarpanlarına ayır: $75 = 25 \cdot 3$.
2. $\sqrt{75} = \sqrt{25} \cdot \sqrt{3} = 5\sqrt{3}$.

Diğer şıklar: **A** çarpanları ters yerleştirmek / **B** kare olan çarpanı kökün dışına karesiyle çıkarmak / **C** $75 = 15 \cdot 5$ ayrımından $15$'i dışarı çıkarmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$\sqrt{30}$ sayısı aşağıdaki ardışık tam sayı çiftlerinden hangisinin arasındadır?$q$, array[$o$$4$ ile $5$$o$, $o$$6$ ile $7$$o$, $o$$5$ ile $6$$o$, $o$$15$ ile $16$$o$], 2, $e$1. $5^2 = 25$ ve $6^2 = 36$ olduğundan $25 < 30 < 36$.
2. Karekök alınırsa $5 < \sqrt{30} < 6$ bulunur.

Diğer şıklar: **A** $4^2 = 16$ ile $5^2 = 25$ aralığına bakmak / **B** $30$ sayısını $6$ ile $7$ gibi düşünmek / **D** $30$'u ikiye bölüp $15$ almak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$$\sqrt{12} \cdot \sqrt{3}$ işleminin sonucu kaçtır?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$6$$o$, $o$$15$$o$], 2, $e$1. Çarpma işleminde kök içindeki sayılar çarpılır: $\sqrt{12} \cdot \sqrt{3} = \sqrt{36}$.
2. $\sqrt{36} = 6$.

Diğer şıklar: **A** $\sqrt{12} \cdot \sqrt{3}$ yerine bölme yapmak / **B** $\sqrt{12 - 3}$ işlemini yapmak / **D** $12 + 3$ işlemini yapmak.$e$, 2),
  (5, 'lgs-mat', null::integer, $q$$3\sqrt{2} + 5\sqrt{2} - 2\sqrt{2}$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$10\sqrt{2}$$o$, $o$$6\sqrt{6}$$o$, $o$$6\sqrt{2}$$o$, $o$$8\sqrt{2}$$o$], 2, $e$1. Üç terimde de kök içi aynıdır, bu yüzden katsayılar toplanıp çıkarılır.
2. $(3 + 5 - 2)\sqrt{2} = 6\sqrt{2}$.

Diğer şıklar: **A** çıkarma işlemini yapmamak / **B** kök içindeki sayıları da toplamak / **D** $2\sqrt{2}$ terimini toplamak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Alanı $72$ metrekare olan kare şeklindeki bir bahçenin etrafı tel örgü ile çevrilecektir.

Buna göre gereken tel örgünün uzunluğu kaç metredir?$q$, array[$o$$6\sqrt{2}$$o$, $o$$12\sqrt{2}$$o$, $o$$18\sqrt{2}$$o$, $o$$24\sqrt{2}$$o$], 3, $e$1. Karenin alanı kenar uzunluğunun karesidir. Kenar $a$ ise $a = \sqrt{72}$.
2. $\sqrt{72} = \sqrt{36 \cdot 2} = 6\sqrt{2}$ metredir.
3. Çevre $4 \cdot 6\sqrt{2} = 24\sqrt{2}$ metredir.

Diğer şıklar: **A** çevre yerine kenar uzunluğunu bulmak / **B** çevreyi iki kenarın toplamı kadar almak / **C** kenarı $\sqrt{72} = 9\sqrt{2}$ sanmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$$\sqrt{0{,}81} + \sqrt{0{,}04}$ işleminin sonucu kaçtır?$q$, array[$o$$0{,}11$$o$, $o$$0{,}7$$o$, $o$$0{,}85$$o$, $o$$1{,}1$$o$], 3, $e$1. $0{,}9^2 = 0{,}81$ olduğundan $\sqrt{0{,}81} = 0{,}9$.
2. $0{,}2^2 = 0{,}04$ olduğundan $\sqrt{0{,}04} = 0{,}2$.
3. $0{,}9 + 0{,}2 = 1{,}1$.

Diğer şıklar: **A** virgülü yanlış kaydırmak / **B** $0{,}9 - 0{,}2$ işlemini yapmak / **C** $0{,}81 + 0{,}04$ toplamını kök almadan yazmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Aşağıdaki sayılardan hangisi irrasyonel sayıdır?$q$, array[$o$$\sqrt{20}$$o$, $o$$\sqrt{0{,}36}$$o$, $o$$\sqrt{\dfrac{25}{9}}$$o$, $o$$\sqrt{169}$$o$], 0, $e$1. Tam kare olmayan pozitif tam sayının karekökü irrasyoneldir.
2. $\sqrt{0{,}36} = 0{,}6$, $\sqrt{\dfrac{25}{9}} = \dfrac{5}{3}$ ve $\sqrt{169} = 13$ rasyoneldir.
3. $20$ tam kare olmadığından $\sqrt{20}$ irrasyoneldir.

Diğer şıklar: **B** ondalık gösterimli sayının kökünü irrasyonel sanmak / **C** kesirli ifadenin kökünü irrasyonel sanmak / **D** büyük sayının kökünü irrasyonel sanmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$$\dfrac{\sqrt{48}}{\sqrt{3}}$ işleminin sonucu kaçtır?$q$, array[$o$$4$$o$, $o$$8$$o$, $o$$16$$o$, $o$$45$$o$], 0, $e$1. Bölmede kök içindeki sayılar bölünür: $\dfrac{\sqrt{48}}{\sqrt{3}} = \sqrt{\dfrac{48}{3}} = \sqrt{16}$.
2. $\sqrt{16} = 4$.

Diğer şıklar: **B** $16 \div 2$ işlemini yapmak / **C** kök almadan $48 \div 3$ sonucunu yazmak / **D** $48 - 3$ işlemini yapmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$a = 2\sqrt{3}$, $b = 3\sqrt{2}$ ve $c = 4$ sayıları veriliyor.

Buna göre bu sayıların küçükten büyüğe doğru sıralanışı aşağıdakilerden hangisidir?$q$, array[$o$$a < b < c$$o$, $o$$a < c < b$$o$, $o$$c < a < b$$o$, $o$$b < c < a$$o$], 1, $e$1. Katsayıları kök içine alalım: $a = \sqrt{4 \cdot 3} = \sqrt{12}$ ve $b = \sqrt{9 \cdot 2} = \sqrt{18}$.
2. $c = 4 = \sqrt{16}$ olarak yazılır.
3. $\sqrt{12} < \sqrt{16} < \sqrt{18}$ olduğundan $a < c < b$.

Diğer şıklar: **A** kökün dışındaki katsayılara bakmak / **C** $4$ sayısını en küçük sanmak / **D** $a$ ve $b$ sayılarının sırasını ters almak.$e$, 3),
  (11, 'lgs-mat', null::integer, $q$$7 < \sqrt{m} < 8$ eşitsizliğini sağlayan kaç farklı $m$ doğal sayısı vardır?$q$, array[$o$$14$$o$, $o$$15$$o$, $o$$16$$o$, $o$$63$$o$], 0, $e$1. Her tarafın karesi alınırsa $49 < m < 64$ olur.
2. $m$ değerleri $50, 51, \dots, 63$ sayılarıdır.
3. Bu sayıların adedi $63 - 50 + 1 = 14$.

Diğer şıklar: **B** uç değer olan $64$ sayısını da sayımak / **C** $49$ ve $64$ sayılarını da saymak / **D** $m$ için en büyük değeri adet sanmak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$$4\sqrt{5} - \sqrt{20}$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$2\sqrt{5}$$o$, $o$$3\sqrt{5}$$o$, $o$$6\sqrt{5}$$o$, $o$$4\sqrt{15}$$o$], 0, $e$1. Önce $\sqrt{20}$ ifadesini sadeleştir: $\sqrt{20} = \sqrt{4 \cdot 5} = 2\sqrt{5}$.
2. Kök içleri eşit olduğundan katsayılar çıkarılır: $4\sqrt{5} - 2\sqrt{5} = 2\sqrt{5}$.

Diğer şıklar: **B** $\sqrt{20}$ ifadesini $\sqrt{5}$ olarak almak / **C** çıkarma yerine toplama yapmak / **D** $20 - 5$ işlemini kök içinde yapmak.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$$\sqrt{3} \cdot \sqrt{x} = 6\sqrt{2}$ olduğuna göre $x$ kaçtır?$q$, array[$o$$12$$o$, $o$$24$$o$, $o$$36$$o$, $o$$72$$o$], 1, $e$1. $6\sqrt{2}$ ifadesini kök içine alalım: $6\sqrt{2} = \sqrt{36 \cdot 2} = \sqrt{72}$.
2. Çarpma ile kök içleri çarpılır: $\sqrt{3x} = \sqrt{72}$.
3. $3x = 72$ olduğundan $x = 24$.

Diğer şıklar: **A** $6\sqrt{2}$ ifadesini $\sqrt{12}$ sanmak / **C** $6\sqrt{2}$ ifadesinde yalnızca $6$'yı karesi alınacak sayı saymak / **D** $\sqrt{x} = \sqrt{72}$ yazarak $3$'ü hesaba katmamak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$\sqrt{27} + \sqrt{12} - \sqrt{3}$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$\sqrt{36}$$o$, $o$$6\sqrt{3}$$o$, $o$$4\sqrt{3}$$o$, $o$$5\sqrt{3}$$o$], 2, $e$1. $\sqrt{27} = \sqrt{9 \cdot 3} = 3\sqrt{3}$ ve $\sqrt{12} = \sqrt{4 \cdot 3} = 2\sqrt{3}$.
2. İşlem $3\sqrt{3} + 2\sqrt{3} - \sqrt{3}$ olur.
3. Katsayılar işleme alınırsa $(3 + 2 - 1)\sqrt{3} = 4\sqrt{3}$.

Diğer şıklar: **A** kök içlerini toplayıp çıkarmak / **B** $\sqrt{3}$ terimini çıkarmayı unutmak / **D** $\sqrt{12}$ ifadesini $3\sqrt{3}$ yazmak.$e$, 2),
  (15, 'lgs-mat', null::integer, $q$$\sqrt{10}$ sayısına en yakın tam sayı aşağıdakilerden hangisidir?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$4$$o$, $o$$5$$o$], 1, $e$1. $3^2 = 9$ ve $4^2 = 16$ olduğundan $3 < \sqrt{10} < 4$.
2. $10$ sayısı $9$'a $16$'dan daha yakındır. Bu yüzden $\sqrt{10}$ sayısı $3$'e daha yakındır.

Diğer şıklar: **A** $\sqrt{4}$ ile $\sqrt{10}$ karıştırmak / **C** $\sqrt{16} = 4$ değerine yuvarlamak / **D** $10$ sayısının yarısını almak.$e$, 1),
  (16, 'lgs-mat', null::integer, $q$Bir dikdörtgenin kısa kenarı $2\sqrt{3}$ santimetre, alanı $12\sqrt{6}$ santimetrekaredir.

Buna göre bu dikdörtgenin uzun kenarı kaç santimetredir?$q$, array[$o$$10\sqrt{3}$$o$, $o$$6\sqrt{2}$$o$, $o$$6\sqrt{3}$$o$, $o$$24\sqrt{2}$$o$], 1, $e$1. Uzun kenar, alanın kısa kenara bölümüdür: $\dfrac{12\sqrt{6}}{2\sqrt{3}}$.
2. Katsayılar $\dfrac{12}{2} = 6$ ve kökler $\dfrac{\sqrt{6}}{\sqrt{3}} = \sqrt{2}$ olur.
3. Uzun kenar $6\sqrt{2}$ santimetredir.

Diğer şıklar: **A** alan ile kenarı çıkarmak / **C** $\sqrt{6} \div \sqrt{3} = \sqrt{3}$ sanmak / **D** alan ile kenarı çarpmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Veri Analizi konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Veri Analizi konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Veri Analizi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Bir veri grubu $4,\ 6,\ 6,\ 9,\ 15$ sayılarından oluşmaktadır.

Bu veri grubunun aritmetik ortalaması kaçtır?$q$, array[$o$$8$$o$, $o$$9{,}5$$o$, $o$$11$$o$, $o$$40$$o$], 0, $e$1. Aritmetik ortalama, değerlerin toplamının değer sayısına bölümüdür.
2. Toplam $4 + 6 + 6 + 9 + 15 = 40$.
3. $40 \div 5 = 8$.

Diğer şıklar: **B** en küçük ile en büyük değerin ortalamasını almak / **C** açıklığı yazmak / **D** toplamı beşe bölmemek.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$Bir veri grubu $7,\ 3,\ 9,\ 12,\ 5,\ 8$ sayılarından oluşmaktadır.

Bu veri grubunun ortancası (medyanı) kaçtır?$q$, array[$o$$7$$o$, $o$$7{,}5$$o$, $o$$8$$o$, $o$$10{,}5$$o$], 1, $e$1. Ortancayı bulmak için sayıları küçükten büyüğe sırala: $3,\ 5,\ 7,\ 8,\ 9,\ 12$.
2. Değer sayısı çift olduğundan ortadaki iki sayının ortalaması alınır.
3. $\dfrac{7 + 8}{2} = 7{,}5$.

Diğer şıklar: **A** sıralamada üçüncü değeri almak / **C** sıralamada dördüncü değeri almak / **D** sıralamadan önce ortadaki iki sayının ortalamasını almak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$Bir veri grubu $2,\ 5,\ 5,\ 7,\ 5,\ 9,\ 2$ sayılarından oluşmaktadır.

Bu veri grubunun tepe değeri kaçtır?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$5$$o$, $o$$7$$o$], 2, $e$1. Tepe değer, en çok tekrar eden değerdir.
2. $2$ sayısı $2$ kez, $5$ sayısı $3$ kez bulunur. Diğer sayılar birer kez bulunur.
3. Tepe değer $5$'tir.

Diğer şıklar: **A** iki kez tekrar eden değeri seçmek / **B** tepe değer yerine tekrar sayısını yazmak / **D** sıralamadan önce ortadaki sayıyı almak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Bir okuldaki öğrencilerin en çok okuduğu kitap türlerinin toplam içindeki yüzde paylarını tek bir bütün üzerinde göstermek isteyen bir öğretmen için en uygun grafik türü aşağıdakilerden hangisidir?$q$, array[$o$Çizgi grafiği$o$, $o$Kutu grafiği$o$, $o$Daire grafiği$o$, $o$Venn şeması$o$], 2, $e$1. Bir bütünün parçalarının yüzde paylarını göstermek için daire grafiği kullanılır.
2. Çizgi grafiği zamana bağlı değişimi, kutu grafiği verinin dağılımını gösterir. Venn şeması bir veri grafiği değildir.

Diğer şıklar: **A** çizgi grafiğinin zamana bağlı değişimi gösterdiğini bilmemek / **B** kutu grafiğinin dağılımı gösterdiğini bilmemek / **D** kümeler arası ilişkiyi gösteren şemayı seçmek.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$$5$ sayının aritmetik ortalaması $12$'dir. Bu sayılara bir sayı daha eklendiğinde ortalama $13$ oluyor.

Buna göre eklenen sayı kaçtır?$q$, array[$o$$1$$o$, $o$$6$$o$, $o$$13$$o$, $o$$18$$o$], 3, $e$1. İlk toplam $5 \cdot 12 = 60$.
2. Yeni toplam $6 \cdot 13 = 78$.
3. Eklenen sayı $78 - 60 = 18$.

Diğer şıklar: **A** iki ortalamanın farkını almak / **B** $78 - 72$ işlemini yapmak / **C** yeni ortalamayı eklenen sayı sanmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Bir sınıfta $12$ kız öğrencinin matematik notları ortalaması $80$, $8$ erkek öğrencinin ortalaması $70$'tir.

Buna göre sınıfın matematik not ortalaması kaçtır?$q$, array[$o$$75$$o$, $o$$76$$o$, $o$$150$$o$, $o$$1520$$o$], 1, $e$1. Kızların toplam puanı $12 \cdot 80 = 960$.
2. Erkeklerin toplam puanı $8 \cdot 70 = 560$.
3. Sınıf ortalaması $\dfrac{960 + 560}{20} = \dfrac{1520}{20} = 76$.

Diğer şıklar: **A** iki ortalamanın ortalamasını almak / **C** iki ortalamayı toplamak / **D** toplamı öğrenci sayısına bölmemek.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$Bir veri grubunun en küçük değeri $10$, birinci çeyreği $16$, ortancası $22$, üçüncü çeyreği $30$ ve en büyük değeri $44$'tür.

Buna göre bu veri grubunun çeyrekler açıklığı kaçtır?$q$, array[$o$$8$$o$, $o$$14$$o$, $o$$22$$o$, $o$$34$$o$], 1, $e$1. Çeyrekler açıklığı, üçüncü çeyrek ile birinci çeyreğin farkıdır.
2. $30 - 16 = 14$.

Diğer şıklar: **A** üçüncü çeyrek ile ortancanın farkını almak / **C** ortancayı yazmak / **D** açıklığı bulmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Bir okuldaki $240$ öğrencinin en çok sevdiği spor dalı bir daire grafiğinde gösterilmiştir. Futbolu gösteren daire diliminin merkez açısı $108^\circ$'dir.

Buna göre futbolu en çok seven kaç öğrenci vardır?$q$, array[$o$$72$$o$, $o$$108$$o$, $o$$120$$o$, $o$$162$$o$], 0, $e$1. Tam daire $360^\circ$ ve toplam öğrenci sayısı $240$'tır.
2. Futbolun payı $\dfrac{108}{360} = \dfrac{3}{10}$.
3. $240 \cdot \dfrac{3}{10} = 72$ öğrenci.

Diğer şıklar: **B** açıyı öğrenci sayısı sanmak / **C** açıyı $360$ yerine $180$ ile karşılaştırmak / **D** oranı ters kurmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$Bir veri grubu $12,\ 15,\ 18,\ 20,\ 30$ sayılarından oluşmaktadır. Bu veri grubundaki en büyük değer olan $30$, $50$ ile değiştirilmiştir.

Buna göre aşağıdakilerden hangisi değişmez?$q$, array[$o$Ortanca$o$, $o$Aritmetik ortalama$o$, $o$Açıklık$o$, $o$Değerlerin toplamı$o$], 0, $e$1. Ortanca, sıralanmış verinin ortasındaki değerdir ve $18$ olarak kalır.
2. Toplam artar, bu yüzden ortalama da artar.
3. Açıklık $30 - 12 = 18$ iken $50 - 12 = 38$ olur.

Diğer şıklar: **B** toplam değiştiği hâlde ortalamayı sabit sanmak / **C** en büyük değer değiştiği hâlde açıklığı sabit sanmak / **D** toplamın en büyük değerden etkilenmediğini sanmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$Bir şehirde beş günlük hava sıcaklığı sırasıyla pazartesi $12^\circ$C, salı $15^\circ$C, çarşamba $11^\circ$C, perşembe $18^\circ$C ve cuma $13^\circ$C ölçülmüştür.

Buna göre ardışık iki gün arasında sıcaklıktaki en büyük azalma hangi günler arasında yaşanmıştır?$q$, array[$o$Çarşamba ile perşembe$o$, $o$Pazartesi ile salı$o$, $o$Salı ile çarşamba$o$, $o$Perşembe ile cuma$o$], 3, $e$1. Ardışık günler arasındaki değişimler: $+3$, $-4$, $+7$, $-5$.
2. Azalma olan iki aralıktan $-5$ daha büyüktür. Bu perşembe ile cuma arasındadır.

Diğer şıklar: **A** en büyük değişimin artış olduğunu görmeden onu seçmek / **B** artışı azalma sanmak / **C** ikinci büyük azalmayı seçmek.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Bir veri grubu $10,\ 14,\ 14,\ 18,\ 24,\ x$ sayılarından oluşmaktadır. Bu veri grubunun aritmetik ortalaması $18$'dir.

Buna göre $x$ kaçtır?$q$, array[$o$$18$$o$, $o$$24$$o$, $o$$28$$o$, $o$$108$$o$], 2, $e$1. Altı sayının toplamı $6 \cdot 18 = 108$ olmalıdır.
2. Bilinen beş sayının toplamı $10 + 14 + 14 + 18 + 24 = 80$.
3. $x = 108 - 80 = 28$.

Diğer şıklar: **A** ortalamayı eksik sayı sanmak / **B** en büyük değeri eksik sayı sanmak / **D** toplamı eksik sayı sanmak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$$5$ sayının aritmetik ortalaması $20$'dir. Bu sayıların her birine $4$ eklenip elde edilen sayılar $3$ ile çarpılıyor.

Buna göre yeni sayıların aritmetik ortalaması kaçtır?$q$, array[$o$$24$$o$, $o$$60$$o$, $o$$64$$o$, $o$$72$$o$], 3, $e$1. Her sayıya aynı değer eklenirse ortalamaya da o değer eklenir: $20 + 4 = 24$.
2. Her sayı aynı sayıyla çarpılırsa ortalama da o sayıyla çarpılır: $24 \cdot 3 = 72$.

Diğer şıklar: **A** $3$ ile çarpmayı unutmak / **B** $4$ eklemeyi unutmak / **C** önce çarpıp sonra $4$ eklemek.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$$7$ sayının aritmetik ortalaması $14$'tür. Bu sayılardan biri çıkarıldığında kalan $6$ sayının ortalaması $13$ oluyor.

Buna göre çıkarılan sayı kaçtır?$q$, array[$o$$1$$o$, $o$$7$$o$, $o$$20$$o$, $o$$26$$o$], 2, $e$1. İlk toplam $7 \cdot 14 = 98$.
2. Kalan $6$ sayının toplamı $6 \cdot 13 = 78$.
3. Çıkarılan sayı $98 - 78 = 20$.

Diğer şıklar: **A** iki ortalamanın farkını almak / **B** yeni toplamı $7$ ile çarpmak / **D** ortalamaları ve değer sayılarını karıştırmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$Bir veri grubunun en küçük değeri $10$, birinci çeyreği $16$, ortancası $22$, üçüncü çeyreği $30$ ve en büyük değeri $44$'tür.

Bu veri grubunun kutu grafiğine göre aşağıdakilerden hangisi **yanlıştır**?$q$, array[$o$Verilerin yarısından fazlası $30$'dan büyüktür.$o$, $o$Verilerin yarısı $16$ ile $30$ arasındadır.$o$, $o$Verilerin dörtte biri $30$'dan büyüktür.$o$, $o$Verilerin yarısı $22$'den küçüktür.$o$], 0, $e$1. Kutu grafiğinde veri dört eşit parçaya ayrılır. Her parça verinin dörtte birini içerir.
2. $30$ üçüncü çeyrek olduğundan $30$'dan büyük değerler verinin yalnızca dörtte biridir.
3. Yarısından fazlasının $30$'dan büyük olduğu ifadesi yanlıştır.

Diğer şıklar: **B** kutunun verinin ortadaki yarısını gösterdiğini bilmemek / **C** üçüncü çeyrekten sonraki payı yanlış değerlendirmek / **D** ortancanın veriyi iki eşit parçaya böldüğünü bilmemek.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$Bir işyerinde çalışan beş kişinin aylık maaşları $20,\ 22,\ 24,\ 26$ ve $108$ bin TL'dir.

Bu çalışanların tipik maaşını en iyi temsil eden ölçü ve değeri aşağıdakilerden hangisidir?$q$, array[$o$Ortalama, $40$ bin TL$o$, $o$Ortanca, $24$ bin TL$o$, $o$Açıklık, $88$ bin TL$o$, $o$En büyük değer, $108$ bin TL$o$], 1, $e$1. Maaşların ortalaması $\dfrac{200}{5} = 40$ bin TL olur, ancak hiçbir çalışan bu maaşa yakın değildir. Çünkü $108$ aşırı büyük bir değerdir.
2. Ortanca bu tür uç değerlerden etkilenmez ve $24$ bin TL'dir.
3. Bu yüzden tipik maaşı ortanca daha iyi temsil eder.

Diğer şıklar: **A** aşırı büyük değerin ortalamayı yükselttiğini fark etmemek / **C** yayılma ölçüsünü merkezi eğilim ölçüsü sanmak / **D** en uç değeri tipik değer saymak.$e$, 3),
  (16, 'lgs-mat', null::integer, $q$Toplamları $120$ olan beş ardışık çift sayı veriliyor.

Buna göre bu sayıların en büyüğü kaçtır?$q$, array[$o$$22$$o$, $o$$24$$o$, $o$$26$$o$, $o$$28$$o$], 3, $e$1. Beş ardışık çift sayının ortalaması ortadaki sayıdır: $\dfrac{120}{5} = 24$.
2. Sayılar $20,\ 22,\ 24,\ 26,\ 28$ olur.
3. En büyük sayı $28$.

Diğer şıklar: **A** ortadan önceki sayıyı seçmek / **B** ortalamayı en büyük sayı sanmak / **C** ortadan sonraki sayıyı seçmek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Basit Olayların Olma Olasılığı konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Basit Olayların Olma Olasılığı konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Basit Olayların Olma Olasılığı$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Bir torbada $3$ kırmızı, $5$ mavi ve $2$ sarı bilye vardır. Torbadan rastgele bir bilye çekiliyor.

Çekilen bilyenin mavi olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{5}$$o$, $o$$\frac{3}{10}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{5}{8}$$o$], 2, $e$1. Torbadaki bilye sayısı $3 + 5 + 2 = 10$'dur.
2. Olasılık, istenen durum sayısının tüm durumların sayısına oranıdır.
3. $P(\text{mavi}) = \dfrac{5}{10} = \dfrac{1}{2}$.

Diğer şıklar: **A** sarı bilyelerin sayısını almak / **B** kırmızı bilyelerin sayısını almak / **D** sarı bilyeleri toplam dışında bırakmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$Bir zar atılıyor.

Üst yüze gelen sayının $3$'ün katı olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{3}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{2}{3}$$o$, $o$$2$$o$], 0, $e$1. Zarın üst yüzünde $1, 2, 3, 4, 5, 6$ sayılarından biri gelir. Tüm durum sayısı $6$'dır.
2. $3$'ün katları $3$ ve $6$ olduğundan istenen durum sayısı $2$'dir.
3. $\dfrac{2}{6} = \dfrac{1}{3}$.

Diğer şıklar: **B** çift sayıların olasılığıyla karıştırmak / **C** olayın tümleyenini yazmak / **D** olasılık yerine durum sayısını yazmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$Aşağıdaki olaylardan hangisinin olasılığı $0$'dır?$q$, array[$o$Bir madeni para atıldığında yazı gelmesi$o$, $o$Bir zar atıldığında üst yüze $7$ gelmesi$o$, $o$Bir zar atıldığında üst yüze $6$'dan küçük bir sayı gelmesi$o$, $o$Bir zar atıldığında üst yüze $1$ ile $6$ arasında bir sayı gelmesi$o$], 1, $e$1. Olasılığı $0$ olan olay imkânsız olaydır.
2. Zarın üst yüzünde $7$ sayısı bulunmadığından bu olay hiçbir zaman gerçekleşmez.
3. Diğer olayların olasılıkları sırasıyla $\dfrac{1}{2}$, $\dfrac{5}{6}$ ve $1$'dir.

Diğer şıklar: **A** olasılığı $\dfrac{1}{2}$ olan olayı imkânsız sanmak / **C** olasılığı küçük olan olayı imkânsız sanmak / **D** kesin olayı imkânsız olayla karıştırmak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Bir olayın gerçekleşme olasılığı $\dfrac{3}{8}$'tür.

Bu olayın gerçekleşmeme olasılığı kaçtır?$q$, array[$o$$\frac{1}{8}$$o$, $o$$\frac{3}{8}$$o$, $o$$\frac{3}{5}$$o$, $o$$\frac{5}{8}$$o$], 3, $e$1. Bir olayın olasılığı ile tümleyeninin olasılığının toplamı $1$'dir.
2. $1 - \dfrac{3}{8} = \dfrac{5}{8}$.

Diğer şıklar: **A** paydadan paydaki sayıyı çıkarmadan farkı almak / **B** olayın kendisinin olasılığını yazmak / **C** olasılığı gerçekleşmeyen duruma oranlamak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$Bir madeni para art arda iki kez atılıyor.

Buna göre en az bir kez tura gelme olasılığı kaçtır?$q$, array[$o$$\frac{1}{4}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{2}{3}$$o$, $o$$\frac{3}{4}$$o$], 3, $e$1. İki atışın sonuçları $TT,\ TY,\ YT,\ YY$'dir. Tüm durum sayısı $4$'tür.
2. En az bir tura olan durumlar $TT,\ TY,\ YT$ olduğundan istenen durum sayısı $3$'tür.
3. Olasılık $\dfrac{3}{4}$.

Diğer şıklar: **A** yalnızca iki turayı saymak / **B** tek atışın olasılığını yazmak / **C** üç durumu eşit olasılıklı saymak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Bir zar ve bir madeni para birlikte atılıyor.

Zarın asal sayı, paranın yazı gelme olasılığı kaçtır?$q$, array[$o$$\frac{1}{12}$$o$, $o$$\frac{1}{6}$$o$, $o$$\frac{1}{4}$$o$, $o$$\frac{1}{2}$$o$], 2, $e$1. Zarın üst yüzü asal olursa $2,\ 3,\ 5$ gelmelidir. Olasılık $\dfrac{3}{6} = \dfrac{1}{2}$.
2. Paranın yazı gelme olasılığı $\dfrac{1}{2}$'dir.
3. Bağımsız olaylarda olasılıklar çarpılır: $\dfrac{1}{2} \cdot \dfrac{1}{2} = \dfrac{1}{4}$.

Diğer şıklar: **A** zarın yalnızca bir sayısını saymak / **B** asal sayıları $2$ tane sayıp çarpmak / **D** yalnızca bir olayın olasılığını yazmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$Bir torbada $4$ beyaz ve $6$ siyah bilye vardır. Torbaya birkaç siyah bilye eklenerek rastgele çekilen bir bilyenin beyaz olma olasılığı $\dfrac{1}{3}$ yapılacaktır.

Buna göre torbaya kaç siyah bilye eklenmelidir?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$6$$o$, $o$$12$$o$], 0, $e$1. Beyaz bilye sayısı değişmediğinden $4$ olarak kalır. Olasılık $\dfrac{4}{\text{toplam}} = \dfrac{1}{3}$ olmalıdır.
2. Toplam bilye sayısı $12$ olmalıdır.
3. Şu an $10$ bilye olduğundan $12 - 10 = 2$ siyah bilye eklenmelidir.

Diğer şıklar: **B** beyaz bilye sayısını yazmak / **C** siyah bilye sayısını yazmak / **D** yeni toplam bilye sayısını yazmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Bir madeni para $100$ kez atılıyor ve $56$ kez tura geliyor.

Buna göre aşağıdakilerden hangisi doğrudur?$q$, array[$o$Turanın deneysel olasılığı $\dfrac{1}{2}$, teorik olasılığı $\dfrac{14}{25}$'tir.$o$, $o$Turanın hem deneysel hem teorik olasılığı $\dfrac{14}{25}$'tir.$o$, $o$Turanın deneysel olasılığı $\dfrac{14}{25}$, teorik olasılığı $\dfrac{1}{2}$'dir.$o$, $o$Turanın teorik olasılığı $\dfrac{1}{2}$ olduğundan para hilelidir.$o$], 2, $e$1. Deneysel olasılık, deneyde elde edilen sonuçlara göre bulunur: $\dfrac{56}{100} = \dfrac{14}{25}$.
2. Teorik olasılık, tüm durumların eşit olasılıklı olması esasına göre bulunur: $\dfrac{1}{2}$.
3. Küçük sapmalar doğal olduğundan paranın hileli olduğu söylenemez.

Diğer şıklar: **A** deneysel ve teorik olasılığı birbirine karıştırmak / **B** deneysel olasılığı teorik olasılık sanmak / **D** küçük sapmaları hileye bağlamak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$$1$'den $20$'ye kadar numaralanmış $20$ kart bir torbaya konuluyor. Torbadan rastgele bir kart çekiliyor.

Çekilen kartın numarasının $4$'ün katı olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{5}$$o$, $o$$\frac{1}{4}$$o$, $o$$\frac{3}{10}$$o$, $o$$\frac{1}{2}$$o$], 1, $e$1. $4$'ün katları $4,\ 8,\ 12,\ 16,\ 20$ olup $5$ tanedir.
2. Tüm kartların sayısı $20$'dir.
3. $\dfrac{5}{20} = \dfrac{1}{4}$.

Diğer şıklar: **A** $20$ sayısını $4$'ün katı saymamak / **C** $6$ tane katı saymak / **D** çift sayıları saymak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$Bir olayın gerçekleşme olasılığı $0{,}6$'dır. Bu deney aynı koşullarda $50$ kez tekrarlanıyor.

Buna göre bu olayın yaklaşık kaç kez gerçekleşmesi beklenir?$q$, array[$o$$3$$o$, $o$$20$$o$, $o$$30$$o$, $o$$50$$o$], 2, $e$1. Beklenen sayı, olasılık ile deneme sayısının çarpımıdır.
2. $0{,}6 \cdot 50 = 30$.

Diğer şıklar: **A** ondalık değeri yanlış ölçeklemek / **B** gerçekleşmeme sayısını bulmak / **D** olasılığı hesaba katmamak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Bir torbada $3$ mavi ve $5$ kırmızı bilye vardır. Torbaya birkaç mavi bilye eklenerek rastgele çekilen bir bilyenin mavi olma olasılığı $\dfrac{1}{2}$ yapılacaktır.

Buna göre torbaya kaç mavi bilye eklenmelidir?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$5$$o$, $o$$8$$o$], 0, $e$1. Eklenen mavi bilye sayısı $x$ olsun. Mavi sayısı $3 + x$, toplam bilye sayısı $8 + x$ olur.
2. $\dfrac{3 + x}{8 + x} = \dfrac{1}{2}$ eşitliğinde içler dışlar çarpımı: $6 + 2x = 8 + x$.
3. $x = 2$.

Diğer şıklar: **B** mevcut mavi bilye sayısını yazmak / **C** kırmızı bilye sayısını yazmak / **D** mevcut toplam bilye sayısını yazmak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$Bir torbada $12$ kırmızı ve birkaç mavi bilye vardır. Torbadan rastgele çekilen bir bilyenin kırmızı olma olasılığı $\dfrac{2}{5}$'dir.

Buna göre torbada kaç mavi bilye vardır?$q$, array[$o$$8$$o$, $o$$18$$o$, $o$$20$$o$, $o$$30$$o$], 1, $e$1. Toplam bilye sayısı $T$ olsun. $\dfrac{12}{T} = \dfrac{2}{5}$ olduğundan $T = 30$.
2. Mavi bilye sayısı $30 - 12 = 18$'dir.

Diğer şıklar: **A** $12$ sayısının $\dfrac{2}{3}$ ünü almak / **C** $12 \cdot \dfrac{5}{3}$ işlemini yapmak / **D** toplam bilye sayısını yazmak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$İki zar birlikte atılıyor.

Üst yüzlerdeki sayıların toplamının $8$ olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{9}$$o$, $o$$\frac{5}{36}$$o$, $o$$\frac{1}{6}$$o$, $o$$\frac{5}{12}$$o$], 1, $e$1. İki zar atıldığında tüm durum sayısı $6 \cdot 6 = 36$'dır.
2. Toplamı $8$ yapan çiftler $(2,6),\ (3,5),\ (4,4),\ (5,3),\ (6,2)$ olup $5$ tanedir.
3. Olasılık $\dfrac{5}{36}$.

Diğer şıklar: **A** yalnızca $4$ durumu saymak / **C** toplamı $7$ yapan durumları saymak / **D** tüm durum sayısını $12$ almak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$1$'den $12$'ye kadar numaralanmış $12$ kart bir torbaya konuluyor. Torbadan rastgele bir kart çekiliyor.

Çekilen kartın numarasının asal sayı ya da $3$'ün katı olma olasılığı kaçtır?$q$, array[$o$$\frac{1}{3}$$o$, $o$$\frac{5}{12}$$o$, $o$$\frac{1}{2}$$o$, $o$$\frac{2}{3}$$o$], 3, $e$1. Asal sayılar $2,\ 3,\ 5,\ 7,\ 11$'dir.
2. $3$'ün katları $3,\ 6,\ 9,\ 12$'dir.
3. $3$ iki grupta da vardır, bir kez sayılır. İstenen durumlar $2,\ 3,\ 5,\ 6,\ 7,\ 9,\ 11,\ 12$ olup $8$ tanedir.
4. $\dfrac{8}{12} = \dfrac{2}{3}$.

Diğer şıklar: **A** yalnızca $3$'ün katlarını saymak / **B** yalnızca asal sayıları saymak / **C** yalnızca ortak sayıları saymak.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$Bir mağazada $3$ farklı tişört ve $4$ farklı pantolon vardır. Rastgele bir tişört ve rastgele bir pantolon seçilerek kombin yapılıyor.

Buna göre belirli bir tişört ile belirli bir pantolondan oluşan kombinin seçilme olasılığı kaçtır?$q$, array[$o$$\frac{1}{12}$$o$, $o$$\frac{1}{7}$$o$, $o$$\frac{1}{4}$$o$, $o$$\frac{1}{3}$$o$], 0, $e$1. Çarpma ilkesine göre toplam kombin sayısı $3 \cdot 4 = 12$'dir.
2. İstenen kombin bir tanedir. Olasılık $\dfrac{1}{12}$.

Diğer şıklar: **B** tişört ve pantolon sayısını toplamak / **C** yalnızca pantolon sayısına bakmak / **D** yalnızca tişört sayısına bakmak.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$Aşağıdaki ifadelerden hangisi olasılıkla ilgili **yanlıştır**?$q$, array[$o$İmkânsız olayın olasılığı $0$'dır.$o$, $o$Kesin olayın olasılığı $1$'dir.$o$, $o$Bir olayın ve tümleyeninin olasılıkları toplamı $1$'dir.$o$, $o$Bir olayın olasılığı $\dfrac{7}{5}$ olabilir.$o$], 3, $e$1. Olasılık değeri her zaman $0$ ile $1$ arasındadır: $0 \le P \le 1$.
2. $\dfrac{7}{5} > 1$ olduğundan bir olayın olasılığı bu değer olamaz.
3. Diğer ifadeler doğrudur.

Diğer şıklar: **A** imkânsız olayın olasılığını bilmemek / **B** kesin olayın olasılığını bilmemek / **C** tümleyen kavramını bilmemek.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Cebirsel İfadeler ve Özdeşlikler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Cebirsel İfadeler ve Özdeşlikler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Cebirsel İfadeler ve Özdeşlikler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$(x + 5)^2$ ifadesinin açılımı aşağıdakilerden hangisidir?$q$, array[$o$$x^2 + 10x + 25$$o$, $o$$x^2 + 25$$o$, $o$$x^2 + 5x + 25$$o$, $o$$x^2 + 10x + 10$$o$], 0, $e$1. $(a + b)^2 = a^2 + 2ab + b^2$ özdeşliğinde $a = x$ ve $b = 5$ alınır.
2. $x^2 + 2 \cdot x \cdot 5 + 5^2 = x^2 + 10x + 25$.

Diğer şıklar: **B** ortadaki çarpımı yazmamak / **C** ortadaki çarpımdaki $2$ çarpanını unutmak / **D** son terimi $5^2$ yerine $5 \cdot 2$ yazmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$(2a - 3b)^2$ ifadesinin açılımı aşağıdakilerden hangisidir?$q$, array[$o$$4a^2 - 9b^2$$o$, $o$$4a^2 - 6ab + 9b^2$$o$, $o$$4a^2 - 12ab + 9b^2$$o$, $o$$4a^2 + 12ab + 9b^2$$o$], 2, $e$1. $(a - b)^2 = a^2 - 2ab + b^2$ özdeşliğinde birinci terim $2a$, ikinci terim $3b$'dir.
2. $(2a)^2 - 2 \cdot 2a \cdot 3b + (3b)^2 = 4a^2 - 12ab + 9b^2$.

Diğer şıklar: **A** ortadaki terimi yazmamak / **B** ortadaki terimde $2$ çarpanını unutmak / **D** ortadaki terimin işaretini yanlış almak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$(x - 4)(x + 4)$ çarpımı aşağıdakilerden hangisine eşittir?$q$, array[$o$$x^2 + 16$$o$, $o$$x^2 - 8x + 16$$o$, $o$$x^2 - 8$$o$, $o$$x^2 - 16$$o$], 3, $e$1. $(a - b)(a + b) = a^2 - b^2$ özdeşliğinde $a = x$ ve $b = 4$'tür.
2. $x^2 - 4^2 = x^2 - 16$.

Diğer şıklar: **A** ikinci terimin işaretini yanlış almak / **B** $(x - 4)^2$ özdeşliğiyle karıştırmak / **C** $4$'ün karesi yerine iki katını almak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$$3x^2y - 6xy^2$ ifadesinin çarpanlarına ayrılmış hâli aşağıdakilerden hangisidir?$q$, array[$o$$3xy(x - y)$$o$, $o$$3xy(x + 2y)$$o$, $o$$3xy(x - 2y)$$o$, $o$$3x^2y(1 - 2y)$$o$], 2, $e$1. İki terimin ortak çarpanı $3xy$'dir.
2. $3x^2y \div 3xy = x$ ve $6xy^2 \div 3xy = 2y$.
3. Çarpanlarına ayrılmış hâli $3xy(x - 2y)$.

Diğer şıklar: **A** ikinci terimden ortak çarpan çıkarırken $2$'yi unutmak / **B** işareti yanlış almak / **D** ortak çarpanı gereğinden büyük almak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$$x^2 - 9y^2$ ifadesinin çarpanlarına ayrılmış hâli aşağıdakilerden hangisidir?$q$, array[$o$$(x - 9y)(x + y)$$o$, $o$$(x - 3y)(x + 3y)$$o$, $o$$(x - 3y)^2$$o$, $o$$(x + 3y)^2$$o$], 1, $e$1. $a^2 - b^2 = (a - b)(a + b)$ özdeşliğinde $a = x$ ve $b = 3y$'dir.
2. $x^2 - (3y)^2 = (x - 3y)(x + 3y)$.

Diğer şıklar: **A** katsayının karekökünü almamak / **C** iki kare farkını tam kare sanmak / **D** iki kare farkını tam kare sanmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$$99 \cdot 101$ çarpımının sonucu kaçtır?$q$, array[$o$$9801$$o$, $o$$9900$$o$, $o$$9999$$o$, $o$$10000$$o$], 2, $e$1. $99 = 100 - 1$ ve $101 = 100 + 1$ yazılır.
2. $(100 - 1)(100 + 1) = 100^2 - 1^2$.
3. $10000 - 1 = 9999$.

Diğer şıklar: **A** $99^2$ değerini yazmak / **B** $99 \cdot 100$ işlemini yapmak / **D** $100^2$ değerini yazmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$$49^2 - 48^2$ işleminin sonucu kaçtır?$q$, array[$o$$1$$o$, $o$$2$$o$, $o$$96$$o$, $o$$97$$o$], 3, $e$1. İki kare farkı özdeşliği: $49^2 - 48^2 = (49 - 48)(49 + 48)$.
2. $1 \cdot 97 = 97$.

Diğer şıklar: **A** sayıların farkını yazmak / **B** farkın iki katını yazmak / **C** $2 \cdot 48$ işlemini yapmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$$a + b = 7$ ve $a \cdot b = 12$ olduğuna göre $a^2 + b^2$ kaçtır?$q$, array[$o$$19$$o$, $o$$25$$o$, $o$$37$$o$, $o$$49$$o$], 1, $e$1. $(a + b)^2 = a^2 + 2ab + b^2$ olduğundan $a^2 + b^2 = (a + b)^2 - 2ab$.
2. $7^2 - 2 \cdot 12 = 49 - 24 = 25$.

Diğer şıklar: **A** $7 + 12$ işlemini yapmak / **C** $49 - 12$ işlemini yapmak / **D** $(a + b)^2$ değerini yazmak.$e$, 3),
  (9, 'lgs-mat', null::integer, $q$$(a - b)^2 = 9$ ve $a \cdot b = 10$ olduğuna göre $(a + b)^2$ kaçtır?$q$, array[$o$$19$$o$, $o$$29$$o$, $o$$39$$o$, $o$$49$$o$], 3, $e$1. $(a + b)^2 = (a - b)^2 + 4ab$ olduğunu açılımlardan görürüz.
2. $(a + b)^2 = 9 + 4 \cdot 10 = 49$.

Diğer şıklar: **A** $9 + 10$ işlemini yapmak / **B** $9 + 2 \cdot 10$ işlemini yapmak / **C** $9 + 3 \cdot 10$ işlemini yapmak.$e$, 3),
  (10, 'lgs-mat', null::integer, $q$$x^2 + 14x + 49$ ifadesinin çarpanlarına ayrılmış hâli aşağıdakilerden hangisidir?$q$, array[$o$$(x + 7)^2$$o$, $o$$(x + 7)(x - 7)$$o$, $o$$(x + 14)^2$$o$, $o$$(x - 7)^2$$o$], 0, $e$1. Son terim $49 = 7^2$ ve ortadaki terim $14x = 2 \cdot x \cdot 7$ olduğundan ifade bir tam karedir.
2. $x^2 + 2 \cdot x \cdot 7 + 7^2 = (x + 7)^2$.

Diğer şıklar: **B** tam kareyi iki kare farkıyla karıştırmak / **C** ortadaki terimin katsayısını doğrudan almak / **D** işareti yanlış almak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$$x^2 - 6x + k$ ifadesi bir tam kare olduğuna göre $k$ kaçtır?$q$, array[$o$$6$$o$, $o$$9$$o$, $o$$12$$o$, $o$$36$$o$], 1, $e$1. Tam kare $(x - a)^2 = x^2 - 2ax + a^2$ biçimindedir.
2. $2a = 6$ olduğundan $a = 3$'tür.
3. $k = a^2 = 9$.

Diğer şıklar: **A** ortadaki terimin katsayısını yazmak / **C** ortadaki terimin iki katını yazmak / **D** ortadaki terimin katsayısının karesini almak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$Kenar uzunluğu $(x + 3)$ santimetre olan bir karenin her kenarı $3$ santimetre kısaltılıyor.

Buna göre karenin alanı kaç santimetrekare azalır?$q$, array[$o$$6x + 9$$o$, $o$$6x$$o$, $o$$9$$o$, $o$$x^2 + 9$$o$], 0, $e$1. Eski alan $(x + 3)^2 = x^2 + 6x + 9$ santimetrekaredir.
2. Yeni kenar $x$ santimetre, yeni alan $x^2$ santimetrekaredir.
3. Azalma $x^2 + 6x + 9 - x^2 = 6x + 9$.

Diğer şıklar: **B** ortadaki terimi alanın azalması sanmak / **C** sabit terimi alanın azalması sanmak / **D** yeni alan ile eski alanı karıştırmak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$$(x + 2)^2 - (x - 2)^2$ işleminin sonucu aşağıdakilerden hangisidir?$q$, array[$o$$4x$$o$, $o$$8x$$o$, $o$$8$$o$, $o$$2x^2 + 8$$o$], 1, $e$1. $(x + 2)^2 = x^2 + 4x + 4$ ve $(x - 2)^2 = x^2 - 4x + 4$.
2. Fark $x^2 + 4x + 4 - x^2 + 4x - 4 = 8x$.

Diğer şıklar: **A** ortadaki terimlerden yalnızca birini almak / **C** $x$ li terimi yazmamak / **D** ortadaki terimleri toplamak yerine çıkarmamak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$3x^2 - 12$ ifadesinin çarpanlarına ayrılmış hâli aşağıdakilerden hangisidir?$q$, array[$o$$(x - 2)(x + 2)$$o$, $o$$3(x - 4)(x + 4)$$o$, $o$$3(x - 2)^2$$o$, $o$$3(x - 2)(x + 2)$$o$], 3, $e$1. Önce ortak çarpan $3$ çıkarılır: $3(x^2 - 4)$.
2. $x^2 - 4 = (x - 2)(x + 2)$ olduğundan ifade $3(x - 2)(x + 2)$ olur.

Diğer şıklar: **A** ortak çarpan olan $3$'ü yazmamak / **B** iki kare farkında sayının karekökünü almamak / **C** iki kare farkını tam kare sanmak.$e$, 2),
  (15, 'lgs-mat', null::integer, $q$$(2x - 1)^2$ ifadesinin açılımında $x$'in katsayısı kaçtır?$q$, array[$o$$-4$$o$, $o$$-2$$o$, $o$$-1$$o$, $o$$2$$o$], 0, $e$1. $(a - b)^2 = a^2 - 2ab + b^2$ özdeşliğinde $a = 2x$ ve $b = 1$'dir.
2. Ortadaki terim $-2 \cdot 2x \cdot 1 = -4x$ olduğundan katsayı $-4$'tür.

Diğer şıklar: **B** ortadaki terimde $2$ çarpanını unutmak / **C** ikinci terimin katsayısını yazmak / **D** birinci terimin katsayısını yazmak.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$Alanı $(x^2 + 8x + 16)$ santimetrekare olan kare şeklindeki bir levhanın çevresi kaç santimetredir?$q$, array[$o$$x + 4$$o$, $o$$4x + 4$$o$, $o$$4x + 16$$o$, $o$$2x + 8$$o$], 2, $e$1. $x^2 + 8x + 16 = (x + 4)^2$ olduğundan kenar uzunluğu $(x + 4)$ santimetredir.
2. Çevre $4(x + 4) = 4x + 16$ santimetredir.

Diğer şıklar: **A** kenar uzunluğunu çevre sanmak / **B** kenar uzunluğunu $x + 1$ almak / **D** çevreyi iki kenarın toplamı kadar almak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Doğrusal Denklemler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Doğrusal Denklemler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Doğrusal Denklemler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$A(-3,\ 4)$ noktası koordinat düzleminin kaçıncı bölgesindedir?$q$, array[$o$$1.$ bölge$o$, $o$$3.$ bölge$o$, $o$$4.$ bölge$o$, $o$$2.$ bölge$o$], 3, $e$1. $x = -3$ negatif, $y = 4$ pozitiftir.
2. $x$ negatif ve $y$ pozitif olan noktalar $2.$ bölgededir.

Diğer şıklar: **A** iki koordinatı da pozitif almak / **B** iki koordinatı da negatif almak / **C** koordinatların sırasını karıştırmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$y = 2x - 3$ doğrusu üzerindeki noktanın apsisi $4$ ise ordinatı kaçtır?$q$, array[$o$$1$$o$, $o$$5$$o$, $o$$8$$o$, $o$$11$$o$], 1, $e$1. $x = 4$ değerini denklemde yerine yaz: $y = 2 \cdot 4 - 3$.
2. $y = 8 - 3 = 5$.

Diğer şıklar: **A** $4 - 3$ işlemini yapmak / **C** $-3$'ü yazmamak / **D** $-3$ yerine $+3$ almak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$y = -3x + 5$ doğrusunun eğimi kaçtır?$q$, array[$o$$-3$$o$, $o$$\frac{1}{3}$$o$, $o$$3$$o$, $o$$5$$o$], 0, $e$1. $y = mx + n$ biçimindeki denklemde $m$ eğimdir.
2. $y = -3x + 5$ için $m = -3$.

Diğer şıklar: **B** eğimin tersini almak / **C** eğimin işaretini yanlış almak / **D** sabit terimi eğim sanmak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$$y = 2x + 6$ doğrusunun $y$ eksenini kestiği nokta aşağıdakilerden hangisidir?$q$, array[$o$$(6,\ 0)$$o$, $o$$(-3,\ 0)$$o$, $o$$(0,\ 2)$$o$, $o$$(0,\ 6)$$o$], 3, $e$1. $y$ eksenini keserken $x = 0$ olur.
2. $y = 2 \cdot 0 + 6 = 6$ olduğundan nokta $(0,\ 6)$'dır.

Diğer şıklar: **A** koordinatların sırasını karıştırmak / **B** $x$ eksenini kestiği noktayı bulmak / **C** eğimi $y$ eksenini kestiği değer sanmak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$$3x + 2y = 12$ doğrusunun $x$ eksenini kestiği nokta aşağıdakilerden hangisidir?$q$, array[$o$$(0,\ 4)$$o$, $o$$(0,\ 6)$$o$, $o$$(4,\ 0)$$o$, $o$$(6,\ 0)$$o$], 2, $e$1. $x$ eksenini keserken $y = 0$ olur.
2. $3x = 12$ olduğundan $x = 4$'tür. Nokta $(4,\ 0)$'dır.

Diğer şıklar: **A** koordinatların sırasını karıştırmak / **B** $y$ eksenini kestiği noktayı bulmak / **D** $y$ eksenini kestiği değeri $x$ eksenine yazmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$$A(1,\ 2)$ ve $B(4,\ 11)$ noktalarından geçen doğrunun eğimi kaçtır?$q$, array[$o$$-3$$o$, $o$$\frac{1}{3}$$o$, $o$$\frac{13}{5}$$o$, $o$$3$$o$], 3, $e$1. Eğim, ordinat farkının apsis farkına oranıdır.
2. $m = \dfrac{11 - 2}{4 - 1} = \dfrac{9}{3} = 3$.

Diğer şıklar: **A** farkları ters sırayla almak / **B** eğimi ters kurmak / **C** koordinatları toplamak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$$A(a,\ 5)$ noktası $2x - y = 1$ doğrusunun üzerindedir.

Buna göre $a$ kaçtır?$q$, array[$o$$1$$o$, $o$$2$$o$, $o$$3$$o$, $o$$5$$o$], 2, $e$1. $x = a$ ve $y = 5$ değerlerini yerine yaz: $2a - 5 = 1$.
2. $2a = 6$ olduğundan $a = 3$.

Diğer şıklar: **A** denklemin sağ tarafını $a$ sanmak / **B** $5 - 1$ işlemini yapıp $2$'ye bölmemek / **D** ordinatı apsis sanmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Eğimi $2$ olan ve $(0,\ -1)$ noktasından geçen doğrunun denklemi aşağıdakilerden hangisidir?$q$, array[$o$$y = 2x + 1$$o$, $o$$y = 2x - 1$$o$, $o$$y = -x + 2$$o$, $o$$y = x - 2$$o$], 1, $e$1. $y = mx + n$ biçiminde $m = 2$'dir.
2. $(0,\ -1)$ noktası $y$ eksenindedir, bu yüzden $n = -1$.
3. Denklem $y = 2x - 1$.

Diğer şıklar: **A** sabit terimin işaretini yanlış almak / **C** eğim ile sabit terimi karıştırmak / **D** eğim ile sabit terimi yer değiştirmek.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$$x + y = 10$ ve $x - y = 4$ denklem sistemini sağlayan $x$ ve $y$ için $x \cdot y$ kaçtır?$q$, array[$o$$3$$o$, $o$$7$$o$, $o$$10$$o$, $o$$21$$o$], 3, $e$1. İki denklemi taraf tarafa topla: $2x = 14$, yani $x = 7$.
2. $x + y = 10$ olduğundan $y = 3$.
3. $x \cdot y = 7 \cdot 3 = 21$.

Diğer şıklar: **A** yalnızca $y$ değerini yazmak / **B** yalnızca $x$ değerini yazmak / **C** toplam denklemin sağını yazmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$2x + y = 11$ ve $x - y = 1$ denklem sistemini sağlayan $x$ ve $y$ için $x + 2y$ kaçtır?$q$, array[$o$$7$$o$, $o$$10$$o$, $o$$11$$o$, $o$$14$$o$], 1, $e$1. İki denklemi taraf tarafa topla: $3x = 12$, yani $x = 4$.
2. $x - y = 1$ olduğundan $y = 3$.
3. $x + 2y = 4 + 6 = 10$.

Diğer şıklar: **A** $x + y$ değerini bulmak / **C** ilk denklemin sağ tarafını yazmak / **D** $2x + 2y$ değerini bulmak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Bir kırtasiyede $2$ defter ile $3$ kalem $29$ TL, $3$ defter ile $2$ kalem $31$ TL'dir.

Buna göre $1$ defter ile $1$ kalemin toplam fiyatı kaç TL'dir?$q$, array[$o$$7$$o$, $o$$10$$o$, $o$$12$$o$, $o$$60$$o$], 2, $e$1. İki denklemi topla: $5$ defter $+$ $5$ kalem $= 60$ TL.
2. Her iki tarafı $5$'e böl: $1$ defter $+$ $1$ kalem $= 12$ TL.
3. Kontrol: defter $7$ TL, kalem $5$ TL için $2 \cdot 7 + 3 \cdot 5 = 29$ ve $3 \cdot 7 + 2 \cdot 5 = 31$ doğrulanır.

Diğer şıklar: **A** yalnızca defterin fiyatını bulmak / **B** iki fiyatı yuvarlamak / **D** iki denklemin toplamını almak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$$(-1,\ 5)$ ve $(3,\ -3)$ noktalarından geçen doğrunun denklemi aşağıdakilerden hangisidir?$q$, array[$o$$y = -2x + 3$$o$, $o$$y = 2x + 3$$o$, $o$$y = -2x + 5$$o$, $o$$y = -\dfrac{1}{2}x + 3$$o$], 0, $e$1. Eğim $m = \dfrac{-3 - 5}{3 - (-1)} = \dfrac{-8}{4} = -2$.
2. $y = -2x + n$ denkleminde $(-1,\ 5)$ noktasını yerine yaz: $5 = 2 + n$, yani $n = 3$.
3. Denklem $y = -2x + 3$.

Diğer şıklar: **B** eğimin işaretini yanlış almak / **C** bir noktanın ordinatını sabit terim sanmak / **D** eğimi ters hesaplamak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$$2x + 3y = 12$ doğrusu ile koordinat eksenlerinin sınırladığı üçgenin alanı kaç birimkaredir?$q$, array[$o$$10$$o$, $o$$12$$o$, $o$$\frac{25}{2}$$o$, $o$$24$$o$], 1, $e$1. $y = 0$ için $2x = 12$, yani $x = 6$. Doğru $x$ eksenini $(6,\ 0)$ noktasında keser.
2. $x = 0$ için $3y = 12$, yani $y = 4$. Doğru $y$ eksenini $(0,\ 4)$ noktasında keser.
3. Üçgen dik üçgendir. Alan $\dfrac{6 \cdot 4}{2} = 12$.

Diğer şıklar: **A** kesim noktalarını toplamak / **C** yanlış kesim noktası bulmak / **D** dik kenarların çarpımını $2$'ye bölmemek.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$y = 3x + 1$ doğrusuna paralel olan ve $(0,\ 5)$ noktasından geçen doğrunun denklemi aşağıdakilerden hangisidir?$q$, array[$o$$y = 3x + 5$$o$, $o$$y = -3x + 5$$o$, $o$$y = 3x + 1$$o$, $o$$y = \dfrac{1}{3}x + 5$$o$], 0, $e$1. Paralel doğruların eğimleri eşittir, bu yüzden eğim $3$'tür.
2. $(0,\ 5)$ noktası $y$ eksenindedir, bu yüzden sabit terim $5$'tir.
3. Denklem $y = 3x + 5$.

Diğer şıklar: **B** paralel doğruların eğimlerinin zıt işaretli olduğunu sanmak / **C** verilen doğruyu aynen yazmak / **D** paralel doğruların eğimlerinin ters olduğunu sanmak.$e$, 2),
  (15, 'lgs-mat', null::integer, $q$$y = -2x + 4$ doğrusu için aşağıdakilerden hangisi doğrudur?$q$, array[$o$$x$ bir artarsa $y$ iki artar.$o$, $o$$x$ bir artarsa $y$ dört azalır.$o$, $o$$x$ bir artarsa $y$ iki azalır.$o$, $o$$x$ bir azalırsa $y$ iki azalır.$o$], 2, $e$1. Eğim $-2$ dir: $x$ bir artarsa $y$ iki azalır.
2. Aynı eğimde $x$ bir azalırsa $y$ iki artar.

Diğer şıklar: **A** eğimin işaretini yanlış yorumlamak / **B** sabit terimi eğim sanmak / **D** eğim negatifken artış ve azalmayı karıştırmak.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$A taksisi $10$ TL açılış ücreti alıp her kilometre için $5$ TL, B taksisi $16$ TL açılış ücreti alıp her kilometre için $4$ TL almaktadır.

İki taksinin ücretinin eşit olduğu yol kaç kilometredir?$q$, array[$o$$6$$o$, $o$$10$$o$, $o$$16$$o$, $o$$40$$o$], 0, $e$1. A taksisi için ücret $5x + 10$, B taksisi için $4x + 16$ olur ($x$ yol).
2. Eşitlenirse $5x + 10 = 4x + 16$ ve $x = 6$.
3. Kontrol: $5 \cdot 6 + 10 = 40$ ve $4 \cdot 6 + 16 = 40$.

Diğer şıklar: **B** A taksisinin açılış ücretini yazmak / **C** B taksisinin açılış ücretini yazmak / **D** iki taksinin ortak ücretini yol sanmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Eşitsizlikler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Eşitsizlikler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşitsizlikler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Bir asansöre en fazla $8$ kişi binebilmektedir. Asansördeki kişi sayısı $x$ ile gösteriliyor.

Buna göre bu durum aşağıdaki eşitsizliklerden hangisiyle gösterilir?$q$, array[$o$$x < 8$$o$, $o$$x \ge 8$$o$, $o$$x \le 8$$o$, $o$$x > 8$$o$], 2, $e$1. En fazla $8$ demek, $8$ ya da $8$'den az demektir.
2. Bu durum $x \le 8$ ile gösterilir.

Diğer şıklar: **A** en fazla ifadesinde eşitliği dışarıda bırakmak / **B** en fazla ile en az ifadelerini karıştırmak / **D** eşitsizliğin yönünü ve eşitlik durumunu karıştırmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$2x + 3 > 11$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?$q$, array[$o$$x < 4$$o$, $o$$x > 7$$o$, $o$$x > 14$$o$, $o$$x > 4$$o$], 3, $e$1. Her iki taraftan $3$ çıkar: $2x > 8$.
2. Her iki tarafı pozitif olan $2$'ye böl: $x > 4$.

Diğer şıklar: **A** eşitsizliğin yönünü ters yazmak / **B** $3$'ü çıkarmak yerine toplamak / **C** $3$'ü çıkarıp $2$'ye bölmemek.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$x < 5$ eşitsizliğini sağlayan en büyük tam sayı değeri kaçtır?$q$, array[$o$$0$$o$, $o$$3$$o$, $o$$4$$o$, $o$$5$$o$], 2, $e$1. $x$ sayısı $5$'ten küçük olmalıdır. $5$'in kendisi çözüm değildir.
2. En büyük tam sayı $4$'tür.

Diğer şıklar: **A** tam sayıların başlangıç değerini seçmek / **B** gereğinden küçük bir değer seçmek / **D** eşitliği dahil etmek.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$$-3x < 12$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?$q$, array[$o$$x > -4$$o$, $o$$x < -4$$o$, $o$$x > 4$$o$, $o$$x < 4$$o$], 0, $e$1. Her iki tarafı negatif olan $-3$'e bölersek eşitsizliğin yönü değişir.
2. $x > -4$.

Diğer şıklar: **B** negatif sayıya bölerken yön değiştirmemek / **C** işareti yanlış almak / **D** hem yönü hem işareti yanlış almak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$$-2x + 5 \ge 11$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?$q$, array[$o$$x \le -3$$o$, $o$$x \ge -3$$o$, $o$$x \le 3$$o$, $o$$x \ge 3$$o$], 0, $e$1. Her iki taraftan $5$ çıkar: $-2x \ge 6$.
2. Negatif olan $-2$'ye bölerken eşitsizliğin yönü değişir: $x \le -3$.

Diğer şıklar: **B** negatif sayıya bölerken yön değiştirmemek / **C** işareti yanlış almak / **D** hem yönü hem işareti yanlış almak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$$3x - 7 < 8$ eşitsizliğini sağlayan en büyük doğal sayı kaçtır?$q$, array[$o$$4$$o$, $o$$5$$o$, $o$$6$$o$, $o$$15$$o$], 0, $e$1. Her iki tarafa $7$ ekle: $3x < 15$.
2. $3$'e böl: $x < 5$.
3. En büyük doğal sayı $4$'tür.

Diğer şıklar: **B** eşitliği dahil etmek / **C** $8 - 2$ işlemini yapmak / **D** $3x$ değerini $x$ sanmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$$-4 < x \le 3$ koşulunu sağlayan kaç tam sayı vardır?$q$, array[$o$$2$$o$, $o$$3$$o$, $o$$6$$o$, $o$$7$$o$], 3, $e$1. $x$ sayısı $-4$'ten büyük, $3$'e eşit ya da küçüktür.
2. Tam sayılar $-3,\ -2,\ -1,\ 0,\ 1,\ 2,\ 3$'tür.
3. Toplam $7$ tane.

Diğer şıklar: **A** uç değerlerin sayısını yazmak / **B** yalnızca pozitif sayıları saymak / **C** uçlardan birini dışarıda bırakmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$$x + 4 \ge 9$ ve $x < 8$ koşullarını sağlayan tam sayıların toplamı kaçtır?$q$, array[$o$$7$$o$, $o$$12$$o$, $o$$13$$o$, $o$$18$$o$], 3, $e$1. $x + 4 \ge 9$ koşulundan $x \ge 5$ bulunur.
2. Birlikte $5 \le x < 8$ olur. Tam sayılar $5,\ 6,\ 7$'dir.
3. Toplam $5 + 6 + 7 = 18$.

Diğer şıklar: **A** yalnızca en büyük değeri almak / **B** $5$ ile $7$'yi toplamak / **C** $5$'i dışarıda bırakmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$Elif'in $120$ TL parası vardır. Tanesi $15$ TL olan defterlerden $x$ tane alacak ve parasını aşmayacaktır.

Buna göre Elif en fazla kaç defter alabilir?$q$, array[$o$$7$$o$, $o$$8$$o$, $o$$9$$o$, $o$$15$$o$], 1, $e$1. $15x \le 120$ eşitsizliği yazılır.
2. $15$'e böl: $x \le 8$.
3. En fazla $8$ defter alabilir.

Diğer şıklar: **A** bir eksik hesaplamak / **C** parayı aşan değeri almak / **D** defter fiyatını adet sanmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$Sayı doğrusunda $-2$ noktası boş daire, $3$ noktası dolu daire ile gösterilmiştir. Bu iki nokta arasındaki bölge boyanmıştır.

Bu gösterim aşağıdakilerden hangisini ifade eder?$q$, array[$o$$-2 \le x < 3$$o$, $o$$-2 < x < 3$$o$, $o$$-2 < x \le 3$$o$, $o$$-2 \le x \le 3$$o$], 2, $e$1. Boş daire, o sayının çözüm kümesine dahil olmadığını gösterir. Bu yüzden $-2$ dahil değildir.
2. Dolu daire, o sayının çözüm kümesine dahil olduğunu gösterir. Bu yüzden $3$ dahildir.
3. Gösterim $-2 < x \le 3$.

Diğer şıklar: **A** boş ve dolu daireleri ters yorumlamak / **B** dolu daireyi dahil etmemek / **D** boş daireyi dahil etmek.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$$2(x - 3) > 3x - 10$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?$q$, array[$o$$x < 4$$o$, $o$$x > 4$$o$, $o$$x > -4$$o$, $o$$x < -4$$o$], 0, $e$1. Parantezi aç: $2x - 6 > 3x - 10$.
2. $x$ li terimleri bir tarafa topla: $-6 + 10 > 3x - 2x$, yani $4 > x$.
3. Bu $x < 4$ demektir.

Diğer şıklar: **B** negatif katsayıya bölerken yön değiştirmemek / **C** işaret ve yön hatası yapmak / **D** işaret hatası yapmak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$$\dfrac{x}{3} - 1 < \dfrac{x}{2}$ eşitsizliğinin çözüm kümesi aşağıdakilerden hangisidir?$q$, array[$o$$x < -6$$o$, $o$$x > -6$$o$, $o$$x > 6$$o$, $o$$x < 6$$o$], 1, $e$1. Paydaları eşitlemek için her iki tarafı $6$ ile çarp: $2x - 6 < 3x$.
2. $-6 < x$ bulunur, yani $x > -6$.

Diğer şıklar: **A** yön hatası yapmak / **C** işaret hatası yapmak / **D** hem yön hem işaret hatası yapmak.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$$-5 \le 3x + 1 < 13$ koşulunu sağlayan tam sayıların toplamı kaçtır?$q$, array[$o$$0$$o$, $o$$3$$o$, $o$$5$$o$, $o$$6$$o$], 1, $e$1. Her tarafa $-1$ ekle: $-6 \le 3x < 12$.
2. Her tarafı $3$'e böl: $-2 \le x < 4$.
3. Tam sayılar $-2,\ -1,\ 0,\ 1,\ 2,\ 3$'tür. Toplamları $3$.

Diğer şıklar: **A** eksi ve artı değerleri götürmek / **C** $-2$'yi dışarıda bırakmak / **D** tam sayıların adedini yazmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$A tarifesinde sabit $40$ TL ve dakika başına $0{,}4$ TL, B tarifesinde sabit $20$ TL ve dakika başına $0{,}8$ TL ödenmektedir.

A tarifesinin B tarifesinden daha ucuz olması için en az kaç dakika konuşulmalıdır?$q$, array[$o$$20$$o$, $o$$50$$o$, $o$$51$$o$, $o$$60$$o$], 2, $e$1. $x$ dakika için A: $40 + 0{,}4x$, B: $20 + 0{,}8x$ olur.
2. A daha ucuzsa $40 + 0{,}4x < 20 + 0{,}8x$, yani $20 < 0{,}4x$ ve $x > 50$.
3. Tam dakika olarak en az $51$ dakika konuşulmalıdır.

Diğer şıklar: **A** sabit ücret farkını dakika sanmak / **B** eşit ücretli durumu da ucuz saymak / **D** yaklaşık bir değer seçmek.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$$a < b$ olduğuna göre aşağıdakilerden hangisi her zaman doğrudur?$q$, array[$o$$3a > 3b$$o$, $o$$-3a > -3b$$o$, $o$$a - 3 > b - 3$$o$, $o$$-3a < -3b$$o$], 1, $e$1. Her iki tarafı negatif sayıyla çarpınca eşitsizliğin yönü değişir. $-3a > -3b$ olur.
2. Pozitif sayıyla çarpınca ya da aynı sayıyı çıkarınca yön değişmez.

Diğer şıklar: **A** pozitif sayıyla çarpınca yönün değiştiğini sanmak / **C** çıkarma yapınca yönün değiştiğini sanmak / **D** negatif sayıyla çarpınca yön değiştirmemek.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$Toplamları $20$'den büyük, $30$'dan küçük olan üç ardışık tam sayının en büyüğü en fazla kaç olabilir?$q$, array[$o$$7$$o$, $o$$8$$o$, $o$$9$$o$, $o$$10$$o$], 3, $e$1. Ortadaki sayı $a$ ise sayılar $a - 1,\ a,\ a + 1$ ve toplam $3a$'dır.
2. $20 < 3a < 30$ olduğundan $\dfrac{20}{3} < a < 10$, yani $a$ en fazla $9$'dur.
3. En büyük sayı $a + 1 = 10$.

Diğer şıklar: **A** en küçük sayıyı seçmek / **B** en küçük olası ortadaki sayıyı seçmek / **C** ortadaki sayıyı en büyük sanmak.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Üçgenler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Üçgenler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Üçgenler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Bir üçgenin iki iç açısının ölçüleri $50^\circ$ ve $60^\circ$'dir.

Buna göre üçüncü iç açının ölçüsü kaç derecedir?$q$, array[$o$$70$$o$, $o$$90$$o$, $o$$110$$o$, $o$$120$$o$], 0, $e$1. Üçgenin iç açılarının toplamı $180^\circ$'dir.
2. $180^\circ - (50^\circ + 60^\circ) = 70^\circ$.

Diğer şıklar: **B** üçgeni dik üçgen sanmak / **C** iki açının toplamını yazmak / **D** $180 - 60$ işlemini yapmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$Dik kenarlarının uzunlukları $6$ cm ve $8$ cm olan dik üçgenin hipotenüsü kaç cm'dir?$q$, array[$o$$7$$o$, $o$$10$$o$, $o$$14$$o$, $o$$100$$o$], 1, $e$1. Pisagor bağıntısına göre hipotenüsün karesi dik kenarların kareleri toplamına eşittir.
2. $6^2 + 8^2 = 36 + 64 = 100$ olduğundan hipotenüs $\sqrt{100} = 10$ cm'dir.

Diğer şıklar: **A** dik kenarların ortalamasını almak / **C** dik kenarları toplamak / **D** karekök almayı unutmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$Aşağıdaki uzunluk üçlülerinden hangisi bir üçgenin kenar uzunlukları **olamaz**?$q$, array[$o$$3$ cm, $4$ cm, $5$ cm$o$, $o$$5$ cm, $5$ cm, $8$ cm$o$, $o$$4$ cm, $4$ cm, $4$ cm$o$, $o$$2$ cm, $3$ cm, $6$ cm$o$], 3, $e$1. Bir üçgende herhangi iki kenarın toplamı üçüncü kenardan büyük olmalıdır.
2. $2 + 3 = 5 < 6$ olduğundan bu uzunluklarla üçgen çizilemez.

Diğer şıklar: **A** dik üçgenin kenarlarını üçgen olamaz sanmak / **B** ikizkenar üçgeni üçgen olamaz sanmak / **C** eşkenar üçgeni üçgen olamaz sanmak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Bir $ABC$ üçgeninde $m(\widehat{A}) = 40^\circ$, $m(\widehat{B}) = 60^\circ$ ve $m(\widehat{C}) = 80^\circ$'dir.

Buna göre kenar uzunlukları arasındaki sıralama aşağıdakilerden hangisidir?$q$, array[$o$$|BC| > |AC| > |AB|$$o$, $o$$|AC| > |AB| > |BC|$$o$, $o$$|AB| > |BC| > |AC|$$o$, $o$$|AB| > |AC| > |BC|$$o$], 3, $e$1. Bir üçgende büyük açının karşısındaki kenar daha uzundur.
2. $|AB|$ kenarı $C$'nin, $|AC|$ kenarı $B$'nin, $|BC|$ kenarı $A$'nın karşısındadır.
3. Açılar $80^\circ > 60^\circ > 40^\circ$ olduğundan $|AB| > |AC| > |BC|$.

Diğer şıklar: **A** açı ile kenarı aynı köşeden eşlemek / **B** kenar sıralamasını yanlış eşlemek / **C** orta açının karşısındaki kenarı yanlış yere koymak.$e$, 2),
  (5, 'lgs-mat', null::integer, $q$Hipotenüsü $17$ cm, bir dik kenarı $8$ cm olan dik üçgenin diğer dik kenarı kaç cm'dir?$q$, array[$o$$9$$o$, $o$$15$$o$, $o$$25$$o$, $o$$225$$o$], 1, $e$1. Pisagor bağıntısında hipotenüsün karesi, dik kenarların kareleri toplamına eşittir.
2. $17^2 - 8^2 = 289 - 64 = 225$.
3. Diğer dik kenar $\sqrt{225} = 15$ cm'dir.

Diğer şıklar: **A** hipotenüs ile dik kenarın farkını almak / **C** hipotenüs ile dik kenarı toplamak / **D** karekök almayı unutmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Tepe açısının ölçüsü $40^\circ$ olan bir ikizkenar üçgenin taban açılarından birinin ölçüsü kaç derecedir?$q$, array[$o$$40$$o$, $o$$70$$o$, $o$$100$$o$, $o$$140$$o$], 1, $e$1. İkizkenar üçgenin taban açıları eşittir. Üç açının toplamı $180^\circ$'dir.
2. İki taban açısının toplamı $180^\circ - 40^\circ = 140^\circ$ olur.
3. Her bir taban açısı $140^\circ \div 2 = 70^\circ$.

Diğer şıklar: **A** taban açısını tepe açısına eşit almak / **C** $180 - 80$ işlemini yapmak / **D** $180 - 40$ işlemini yapıp ikiye bölmemek.$e$, 1),
  (7, 'lgs-mat', null::integer, $q$Kenar uzunlukları $7$ cm, $12$ cm ve $x$ cm olan bir üçgende $x$ bir tam sayıdır.

Buna göre $x$ kaç farklı değer alabilir?$q$, array[$o$$11$$o$, $o$$12$$o$, $o$$13$$o$, $o$$14$$o$], 2, $e$1. Üçgen eşitsizliğine göre diğer iki kenarın farkı üçüncü kenardan küçük, toplamı büyük olmalıdır.
2. $12 - 7 < x < 12 + 7$, yani $5 < x < 19$.
3. Tam sayı değerleri $6,\ 7,\ \dots,\ 18$ olup $13$ tanedir.

Diğer şıklar: **A** uç değerlerden fazladan çıkarmak / **B** bir değeri eksik saymak / **D** $5$'i de saymak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Dik kenarlarının uzunlukları $9$ cm ve $12$ cm olan bir dik üçgenin çevresi kaç cm'dir?$q$, array[$o$$21$$o$, $o$$30$$o$, $o$$36$$o$, $o$$45$$o$], 2, $e$1. Hipotenüs $\sqrt{9^2 + 12^2} = \sqrt{225} = 15$ cm'dir.
2. Çevre $9 + 12 + 15 = 36$ cm.

Diğer şıklar: **A** hipotenüsü çevreye katmamak / **B** dik kenarları iki katı almak / **D** kenarları hesaplamadan çevreyi üç katı almak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$İki iç açısının ölçüsü $50^\circ$ ve $70^\circ$ olan bir üçgenin üçüncü köşesindeki dış açının ölçüsü kaç derecedir?$q$, array[$o$$110$$o$, $o$$120$$o$, $o$$130$$o$, $o$$180$$o$], 1, $e$1. Üçüncü iç açı $180^\circ - 50^\circ - 70^\circ = 60^\circ$'dir.
2. Dış açı, komşu iç açıyı $180^\circ$'ye tamamlar: $180^\circ - 60^\circ = 120^\circ$.
3. Dış açı, kendisine komşu olmayan iki iç açının toplamına da eşittir: $50^\circ + 70^\circ = 120^\circ$.

Diğer şıklar: **A** $180 - 70$ işlemini yapmak / **C** $180 - 50$ işlemini yapmak / **D** dış açı ile iç açının toplamını yazmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$Aşağıdaki kenar uzunluğu üçlülerinden hangisi bir dik üçgenin kenarları olabilir?$q$, array[$o$$4$ cm, $5$ cm, $6$ cm$o$, $o$$5$ cm, $6$ cm, $7$ cm$o$, $o$$7$ cm, $8$ cm, $9$ cm$o$, $o$$6$ cm, $8$ cm, $10$ cm$o$], 3, $e$1. Dik üçgende en uzun kenarın karesi diğer iki kenarın kareleri toplamına eşit olmalıdır.
2. $6^2 + 8^2 = 36 + 64 = 100 = 10^2$ olduğundan bu üçlü dik üçgendir.
3. Diğer üçlülerde bu eşitlik sağlanmaz.

Diğer şıklar: **A** kenarları ardışık sayılar olan üçgeni dik sanmak / **B** kenarları ardışık sayılar olan üçgeni dik sanmak / **C** kenarları ardışık sayılar olan üçgeni dik sanmak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Boyu $5$ metre olan bir merdiven, alt ucu duvardan $3$ metre uzakta olacak şekilde duvara yaslanmıştır.

Buna göre merdivenin üst ucu yerden kaç metre yüksekliktedir?$q$, array[$o$$4$$o$, $o$$8$$o$, $o$$16$$o$, $o$$34$$o$], 0, $e$1. Merdiven, duvar ve yer bir dik üçgen oluşturur. Merdiven hipotenüstür.
2. $h^2 = 5^2 - 3^2 = 25 - 9 = 16$.
3. $h = 4$ metre.

Diğer şıklar: **B** uzunlukları toplamak / **C** karekök almayı unutmak / **D** kareleri toplamak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$Kenar uzunlukları $12$ cm ve $16$ cm olan dikdörtgenin köşegeni kaç cm'dir?$q$, array[$o$$4$$o$, $o$$14$$o$, $o$$20$$o$, $o$$28$$o$], 2, $e$1. Köşegen, dikdörtgeni iki dik üçgene ayırır. Dik kenarlar $12$ ve $16$ cm'dir.
2. Köşegen $\sqrt{12^2 + 16^2} = \sqrt{400} = 20$ cm.

Diğer şıklar: **A** kenarların farkını almak / **B** kenarların ortalamasını almak / **D** kenarları toplamak.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$Dik kenarlarının uzunlukları $9$ cm ve $12$ cm olan bir dik üçgende hipotenüse ait yüksekliğin uzunluğu kaç cm'dir?$q$, array[$o$$7{,}2$$o$, $o$$7{,}5$$o$, $o$$9$$o$, $o$$54$$o$], 0, $e$1. Hipotenüs $\sqrt{9^2 + 12^2} = 15$ cm'dir.
2. Alan iki yolla yazılır: $\dfrac{9 \cdot 12}{2} = \dfrac{15 \cdot h}{2}$.
3. $108 = 15h$ olduğundan $h = 7{,}2$ cm.

Diğer şıklar: **B** hipotenüsün yarısını almak / **C** kısa dik kenarı yükseklik sanmak / **D** alanı yükseklik sanmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$Eş kenarlarının uzunluğu $13$ cm, tabanı $10$ cm olan ikizkenar üçgenin alanı kaç cm$^2$'dir?$q$, array[$o$$60$$o$, $o$$65$$o$, $o$$78$$o$, $o$$120$$o$], 0, $e$1. Tabana ait yükseklik tabanı ikiye böler. Yarım taban $5$ cm'dir.
2. Yükseklik $\sqrt{13^2 - 5^2} = \sqrt{144} = 12$ cm'dir.
3. Alan $\dfrac{10 \cdot 12}{2} = 60$ cm$^2$.

Diğer şıklar: **B** yan kenarı yükseklik sanmak / **C** yan kenar ile yüksekliği çarpıp ikiye bölmek / **D** alan formülündeki $\dfrac{1}{2}$ çarpanını unutmak.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$Bir ikizkenar üçgenin iki kenarının uzunluğu $5$ cm ve $11$ cm'dir.

Buna göre bu üçgenin çevresi kaç cm'dir?$q$, array[$o$$21$$o$, $o$$22$$o$, $o$$27$$o$, $o$$33$$o$], 2, $e$1. İkizkenar üçgenin iki kenarı eşittir. Eş kenarlar $5$ cm olsaydı kenarlar $5,\ 5,\ 11$ olurdu. $5 + 5 < 11$ olduğundan bu üçgen çizilemez.
2. Eş kenarlar $11$ cm olmalıdır. Kenarlar $11,\ 11,\ 5$ olur ve $11 + 5 > 11$ olduğundan üçgen çizilebilir.
3. Çevre $11 + 11 + 5 = 27$ cm.

Diğer şıklar: **A** eş kenarları $5$ cm alıp üçgen eşitsizliğini denetlememek / **B** eş kenarları $11$ cm alıp tabanı atlamak / **D** üç kenarı da $11$ cm almak.$e$, 3),
  (16, 'lgs-mat', null::integer, $q$Kenar uzunlukları $4$ cm, $9$ cm ve $x$ cm olan bir üçgende $x$ bir tam sayıdır.

Buna göre bu üçgenin çevresi en fazla kaç cm olabilir?$q$, array[$o$$13$$o$, $o$$17$$o$, $o$$21$$o$, $o$$25$$o$], 3, $e$1. Üçgen eşitsizliğine göre $9 - 4 < x < 9 + 4$, yani $5 < x < 13$.
2. $x$ tam sayı olduğundan en büyük değeri $12$'dir.
3. Çevre en fazla $4 + 9 + 12 = 25$ cm.

Diğer şıklar: **A** iki kenarın toplamını çevre sanmak / **B** yalnızca bir değer bulmak / **C** en büyük değeri küçük seçmek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Eşlik ve Benzerlik konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Eşlik ve Benzerlik konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Eşlik ve Benzerlik$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$ABC$ ve $DEF$ üçgenleri benzerdir ve $DEF$ üçgeninin kenarları $ABC$ üçgeninin karşılıklı kenarlarının $2$ katıdır. $ABC$ üçgeninin çevresi $12$ cm'dir.

Buna göre $DEF$ üçgeninin çevresi kaç cm'dir?$q$, array[$o$$6$$o$, $o$$14$$o$, $o$$24$$o$, $o$$36$$o$], 2, $e$1. Benzer üçgenlerde çevreler oranı, benzerlik oranına eşittir.
2. $12 \cdot 2 = 24$ cm.

Diğer şıklar: **A** oranla bölmek / **B** oranı çevreye eklemek / **D** oranı üç katı sanmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$Ölçeği $\dfrac{1}{500\,000}$ olan bir haritada iki şehir arasındaki uzaklık $4$ cm ölçülmüştür.

Buna göre bu şehirler arasındaki gerçek uzaklık kaç km'dir?$q$, array[$o$$8$$o$, $o$$20$$o$, $o$$200$$o$, $o$$2000$$o$], 1, $e$1. Gerçek uzaklık $4 \cdot 500\,000 = 2\,000\,000$ cm'dir.
2. $100\,000$ cm $= 1$ km olduğundan $2\,000\,000$ cm $= 20$ km.

Diğer şıklar: **A** ölçeği yanlış uygulamak / **C** birim çevirirken bir sıfır fazla yazmak / **D** cm yi doğrudan km sanmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$ABC$ ve $DEF$ üçgenleri benzerdir ($A$-$D$, $B$-$E$, $C$-$F$ köşeleri karşılıklıdır). $m(\widehat{A}) = 40^\circ$ ve $m(\widehat{E}) = 65^\circ$'dir.

Buna göre $m(\widehat{F})$ kaç derecedir?$q$, array[$o$$75$$o$, $o$$105$$o$, $o$$115$$o$, $o$$140$$o$], 0, $e$1. Benzer üçgenlerde karşılıklı açılar eşittir. $m(\widehat{D}) = 40^\circ$ ve $m(\widehat{E}) = 65^\circ$'dir.
2. $m(\widehat{F}) = 180^\circ - 40^\circ - 65^\circ = 75^\circ$.

Diğer şıklar: **B** iki açının toplamını yazmak / **C** $180 - 65$ işlemini yapmak / **D** $180 - 40$ işlemini yapmak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Boyu $1{,}5$ m olan bir çubuğun gölgesi, aynı anda $2$ m ölçülmüştür. Aynı anda bir ağacın gölgesi $12$ m'dir.

Buna göre ağacın boyu kaç metredir?$q$, array[$o$$9$$o$, $o$$10{,}5$$o$, $o$$13{,}5$$o$, $o$$16$$o$], 0, $e$1. Aynı anda boy ile gölge oranı sabittir: $\dfrac{1{,}5}{2} = \dfrac{h}{12}$.
2. $h = \dfrac{1{,}5 \cdot 12}{2} = 9$ m.

Diğer şıklar: **B** gölge ile çubuk boyunun farkını almak / **C** gölgeyle çubuk boyunu toplamak / **D** oranı ters kurmak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$İki benzer çokgenin benzerlik oranı $3$'tür. Küçük çokgenin alanı $8$ cm$^2$ ise büyük çokgenin alanı kaç cm$^2$'dir?$q$, array[$o$$11$$o$, $o$$24$$o$, $o$$36$$o$, $o$$72$$o$], 3, $e$1. Benzer şekillerde alanlar oranı, benzerlik oranının karesidir: $3^2 = 9$.
2. Büyük çokgenin alanı $8 \cdot 9 = 72$ cm$^2$.

Diğer şıklar: **A** oranı alana eklemek / **B** alanı benzerlik oranıyla çarpmak / **C** alanı oranın yarısının karesiyle çarpmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$$ABC$ ve $DEF$ üçgenleri benzerdir. $DEF$ üçgeninin kenarları, $ABC$ üçgeninin karşılıklı kenarlarının $\dfrac{2}{3}$'ü kadardır. $ABC$ üçgeninin çevresi $30$ cm'dir.

Buna göre $DEF$ üçgeninin çevresi kaç cm'dir?$q$, array[$o$$10$$o$, $o$$20$$o$, $o$$28$$o$, $o$$45$$o$], 1, $e$1. Benzer üçgenlerde çevreler oranı, kenarlar oranına eşittir.
2. $30 \cdot \dfrac{2}{3} = 20$ cm.

Diğer şıklar: **A** çevreyi $3$'e bölmek / **C** oranı çıkarmak / **D** oranı ters uygulamak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$Kenar uzunluğu $2$ cm olan bir karenin alanının, kenar uzunluğu $8$ cm olan bir karenin alanına oranı kaçtır?$q$, array[$o$$\frac{1}{16}$$o$, $o$$\frac{1}{8}$$o$, $o$$\frac{1}{4}$$o$, $o$$\frac{1}{2}$$o$], 0, $e$1. Kenarlar oranı $\dfrac{2}{8} = \dfrac{1}{4}$'tür.
2. Alanlar oranı, kenarlar oranının karesidir: $\left(\dfrac{1}{4}\right)^2 = \dfrac{1}{16}$.

Diğer şıklar: **B** kenar oranını $2$ ile çarpmak / **C** kenarlar oranını alanlar oranı sanmak / **D** kenarlar oranını yanlış yazmak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Güneşli bir günde boyu $6$ m olan bir ağacın gölgesi $4$ m'dir. Aynı anda bir binanın gölgesi $10$ m ölçülüyor.

Buna göre binanın yüksekliği kaç metredir?$q$, array[$o$$10$$o$, $o$$15$$o$, $o$$16$$o$, $o$$20$$o$], 1, $e$1. Aynı anda boy ile gölge oranı sabittir: $\dfrac{6}{4} = \dfrac{h}{10}$.
2. $h = \dfrac{6 \cdot 10}{4} = 15$ m.

Diğer şıklar: **A** gölge uzunluğunu aynen yazmak / **C** ağaç boyu ile gölgeyi toplamak / **D** gölge uzunluğunu iki katı almak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$Aşağıdaki bilgilerden hangisi iki üçgenin eş olduğunu kesin olarak gösterir?$q$, array[$o$Üç açısı karşılıklı eşit olan üçgenler$o$, $o$İki kenarı ve bir kenarın karşısındaki açısı karşılıklı eşit olan üçgenler$o$, $o$Bir kenarı ve bir açısı karşılıklı eşit olan üçgenler$o$, $o$İki kenarı ve aralarındaki açısı karşılıklı eşit olan üçgenler$o$], 3, $e$1. İki üçgende iki kenar ve bu kenarlar arasındaki açı karşılıklı eşitse üçgenler eştir (KAK).
2. Üç açı eşit olduğunda üçgenler yalnızca benzer olur. Açının iki kenarın arasında olmaması ya da eksik bilgi eşliği garanti etmez.

Diğer şıklar: **A** açıların eşitliğini eşlik sanmak / **B** açının kenarlar arasında olmasını önemsememek / **C** eşlik için gereken bilgi sayısını az almak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$ABC$ ve $DEF$ üçgenleri benzerdir ($A$-$D$, $B$-$E$, $C$-$F$ köşeleri karşılıklıdır). $|AB| = 6$ cm, $|DE| = 9$ cm ve $|BC| = 8$ cm'dir.

Buna göre $|EF|$ kaç cm'dir?$q$, array[$o$$\frac{16}{3}$$o$, $o$$9$$o$, $o$$11$$o$, $o$$12$$o$], 3, $e$1. Benzerlik oranı $\dfrac{|DE|}{|AB|} = \dfrac{9}{6} = \dfrac{3}{2}$'dir.
2. $|EF| = |BC| \cdot \dfrac{3}{2} = 8 \cdot \dfrac{3}{2} = 12$ cm.

Diğer şıklar: **A** oranı ters kurmak / **B** karşılıklı olmayan kenarı yazmak / **C** kenarlar arasındaki farkı eklemek.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Ölçeği $\dfrac{1}{200}$ olan bir planda dikdörtgen biçimli bir odanın kenar uzunlukları $5$ cm ve $3$ cm'dir.

Buna göre odanın gerçek alanı kaç metrekaredir?$q$, array[$o$$15$$o$, $o$$30$$o$, $o$$60$$o$, $o$$600$$o$], 2, $e$1. Gerçek kenarlar: $5 \cdot 200 = 1000$ cm $= 10$ m ve $3 \cdot 200 = 600$ cm $= 6$ m.
2. Alan $10 \cdot 6 = 60$ m$^2$.

Diğer şıklar: **A** planın alanını gerçek alan sanmak / **B** yalnızca bir kenarı gerçek ölçüye çevirmek / **D** bir kenarı metre yerine santimetre bırakmak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$Ölçeği $\dfrac{1}{1000}$ olan bir haritada bir arsanın alanı $12$ cm$^2$'dir.

Buna göre arsanın gerçek alanı kaç metrekaredir?$q$, array[$o$$1{,}2$$o$, $o$$12$$o$, $o$$120$$o$, $o$$1200$$o$], 3, $e$1. Uzunluklar $1000$ kat büyür, alanlar $1000^2 = 1\,000\,000$ kat büyür.
2. Gerçek alan $12 \cdot 1\,000\,000 = 12\,000\,000$ cm$^2$'dir.
3. $1$ m$^2 = 10\,000$ cm$^2$ olduğundan gerçek alan $1200$ m$^2$.

Diğer şıklar: **A** ölçeği alana tek kez uygulamak / **B** ölçeği hiç uygulamamak / **C** birim çevirirken bir sıfır eksik yazmak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$İki benzer üçgenin alanları $18$ cm$^2$ ve $50$ cm$^2$'dir.

Buna göre küçük üçgenin büyük üçgene benzerlik oranı kaçtır?$q$, array[$o$$\frac{9}{25}$$o$, $o$$\frac{3}{5}$$o$, $o$$\frac{5}{3}$$o$, $o$$\frac{25}{9}$$o$], 1, $e$1. Alanlar oranı $\dfrac{18}{50} = \dfrac{9}{25}$'dir.
2. Alanlar oranı benzerlik oranının karesi olduğundan benzerlik oranı $\sqrt{\dfrac{9}{25}} = \dfrac{3}{5}$.

Diğer şıklar: **A** alanlar oranını benzerlik oranı sanmak / **C** oranı ters yazmak / **D** alanlar oranının tersini yazmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$ABC$ üçgeninde $D$ noktası $[AB]$ üzerinde, $E$ noktası $[AC]$ üzerindedir ve $DE \parallel BC$'dir. $|AD| = 4$ cm, $|DB| = 2$ cm ve $|DE| = 6$ cm'dir.

Buna göre $|BC|$ kaç cm'dir?$q$, array[$o$$6$$o$, $o$$8$$o$, $o$$9$$o$, $o$$12$$o$], 2, $e$1. $DE \parallel BC$ olduğundan $ADE$ ve $ABC$ üçgenleri benzerdir.
2. $|AB| = |AD| + |DB| = 6$ cm'dir. $\dfrac{|AD|}{|AB|} = \dfrac{|DE|}{|BC|}$ yazılır: $\dfrac{4}{6} = \dfrac{6}{|BC|}$.
3. $|BC| = 9$ cm.

Diğer şıklar: **A** $|DE|$ ile $|BC|$'yi eşit sanmak / **B** uzunlukları toplayıp eksik hesaplamak / **D** $|AD|$ ile $|DB|$ oranını kullanmak.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$İki benzer üçgenin alanları oranı $\dfrac{4}{25}$'tür.

Buna göre bu üçgenlerin çevreleri oranı kaçtır?$q$, array[$o$$\frac{16}{625}$$o$, $o$$\frac{4}{25}$$o$, $o$$\frac{2}{5}$$o$, $o$$\frac{4}{5}$$o$], 2, $e$1. Alanlar oranı, benzerlik oranının karesidir. Benzerlik oranı $\sqrt{\dfrac{4}{25}} = \dfrac{2}{5}$.
2. Çevreler oranı benzerlik oranına eşittir: $\dfrac{2}{5}$.

Diğer şıklar: **A** oranın karesini almak / **B** alanlar oranını çevreler oranı sanmak / **D** payın karekökünü almayıp paydanın karekökünü almak.$e$, 3),
  (16, 'lgs-mat', null::integer, $q$Boyu $1{,}8$ m olan Ali'nin gölgesi $4$ m, aynı anda bir ışık direğinin gölgesi $12$ m ölçülüyor.

Buna göre direğin boyu kaç metredir?$q$, array[$o$$5{,}4$$o$, $o$$7{,}2$$o$, $o$$8$$o$, $o$$21{,}6$$o$], 0, $e$1. Aynı anda boy ile gölge oranı sabittir: $\dfrac{1{,}8}{4} = \dfrac{h}{12}$.
2. $h = \dfrac{1{,}8 \cdot 12}{4} = 5{,}4$ m.

Diğer şıklar: **B** boy ile gölgeyi çarpmak / **C** gölgeler arasındaki farkı almak / **D** boy ile direğin gölgesini çarpmak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Dönüşüm Geometrisi konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Dönüşüm Geometrisi konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Dönüşüm Geometrisi$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$$A(2,\ 3)$ noktası $4$ birim sağa, $2$ birim aşağı ötelenirse hangi noktaya gelir?$q$, array[$o$$(6,\ 1)$$o$, $o$$(6,\ 5)$$o$, $o$$(-2,\ 1)$$o$, $o$$(1,\ 6)$$o$], 0, $e$1. Sağa $4$ birim gitmek $x$ koordinatına $4$ eklemektir: $2 + 4 = 6$.
2. Aşağı $2$ birim gitmek $y$ koordinatından $2$ çıkarmaktır: $3 - 2 = 1$.
3. Yeni nokta $(6,\ 1)$.

Diğer şıklar: **B** aşağı ötelemeyi yukarı yapmak / **C** sağa ötelemeyi sola yapmak / **D** koordinatların yerini değiştirmek.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$$A(3,\ -2)$ noktasının $x$ eksenine göre yansıması aşağıdakilerden hangisidir?$q$, array[$o$$(-3,\ -2)$$o$, $o$$(-3,\ 2)$$o$, $o$$(-2,\ 3)$$o$, $o$$(3,\ 2)$$o$], 3, $e$1. $x$ eksenine göre yansımada $x$ koordinatı değişmez, $y$ koordinatının işareti değişir.
2. $A(3,\ -2)$ noktasının yansıması $(3,\ 2)$'dir.

Diğer şıklar: **A** $y$ eksenine göre yansıtmak / **B** orijine göre yansıtmak / **C** koordinatların yerini değiştirmek.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$$A(-4,\ 5)$ noktasının $y$ eksenine göre yansıması aşağıdakilerden hangisidir?$q$, array[$o$$(-4,\ -5)$$o$, $o$$(4,\ 5)$$o$, $o$$(4,\ -5)$$o$, $o$$(5,\ -4)$$o$], 1, $e$1. $y$ eksenine göre yansımada $y$ koordinatı değişmez, $x$ koordinatının işareti değişir.
2. $A(-4,\ 5)$ noktasının yansıması $(4,\ 5)$'tir.

Diğer şıklar: **A** $x$ eksenine göre yansıtmak / **C** orijine göre yansıtmak / **D** koordinatları değiştirip işaret koymak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Öteleme, yansıma ve dönme dönüşümlerinde aşağıdakilerden hangisi değişmez?$q$, array[$o$Şeklin yönü ve düzlemdeki konumu$o$, $o$Köşelerin koordinatları$o$, $o$Şeklin yönü$o$, $o$Kenar uzunlukları ve açı ölçüleri$o$], 3, $e$1. Bu üç dönüşüm şeklin biçimini ve boyutunu değiştirmez. Kenar uzunlukları ve açı ölçüleri aynı kalır.
2. Konum, yön ve koordinatlar değişebilir.

Diğer şıklar: **A** dönüşümle konumun değişmediğini sanmak / **B** koordinatların aynı kaldığını sanmak / **C** yansımada yönün değişmediğini sanmak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$$B(-2,\ 1)$ noktası orijin etrafında $180^\circ$ döndürülürse hangi noktaya gelir?$q$, array[$o$$(-2,\ -1)$$o$, $o$$(2,\ 1)$$o$, $o$$(2,\ -1)$$o$, $o$$(1,\ 2)$$o$], 2, $e$1. Orijin etrafında $180^\circ$ dönmede her iki koordinatın işareti de değişir.
2. $B(-2,\ 1)$ noktasının görüntüsü $(2,\ -1)$'dir.

Diğer şıklar: **A** $x$ eksenine göre yansıtmak / **B** $y$ eksenine göre yansıtmak / **D** koordinatların yerini değiştirmek.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$$A(1,\ 2)$ noktası bir öteleme sonucunda $A'(-3,\ 5)$ noktasına gelmiştir.

Aynı öteleme ile $B(2,\ -4)$ noktası hangi noktaya gelir?$q$, array[$o$$(-2,\ -1)$$o$, $o$$(6,\ -1)$$o$, $o$$(-2,\ -7)$$o$, $o$$(6,\ -7)$$o$], 0, $e$1. $A$'dan $A'$'ye giderken $x$ koordinatı $-3 - 1 = -4$ değişir (sola $4$ birim), $y$ koordinatı $5 - 2 = 3$ değişir (yukarı $3$ birim).
2. $B$ noktasına uygula: $(2 - 4,\ -4 + 3) = (-2,\ -1)$.

Diğer şıklar: **B** sola ötelemeyi sağa yapmak / **C** yukarı ötelemeyi aşağı yapmak / **D** iki yönü de ters uygulamak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$Aşağıdaki şekillerden hangisinin tam olarak $2$ simetri ekseni vardır?$q$, array[$o$Kare$o$, $o$Kare olmayan bir dikdörtgen$o$, $o$Eşkenar üçgen$o$, $o$İkizkenar (eşkenar olmayan) üçgen$o$], 1, $e$1. Kare dört, eşkenar üçgen üç, eşkenar olmayan ikizkenar üçgen bir simetri eksenine sahiptir.
2. Kare olmayan dikdörtgenin simetri eksenleri karşılıklı kenarların orta noktalarını birleştiren iki doğrudur.

Diğer şıklar: **A** karenin $4$ simetri ekseni olduğunu bilmemek / **C** eşkenar üçgenin $3$ simetri ekseni olduğunu bilmemek / **D** ikizkenar üçgenin $1$ simetri ekseni olduğunu bilmemek.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$$A(2,\ 1)$ noktası orijin etrafında saat yönünde $90^\circ$ döndürülürse hangi noktaya gelir?$q$, array[$o$$(-1,\ 2)$$o$, $o$$(1,\ -2)$$o$, $o$$(-2,\ -1)$$o$, $o$$(2,\ -1)$$o$], 1, $e$1. Saat yönünde $90^\circ$ dönmede $(x,\ y)$ noktası $(y,\ -x)$ noktasına gelir.
2. $A(2,\ 1)$ noktasının görüntüsü $(1,\ -2)$'dir.

Diğer şıklar: **A** saat yönünün tersine döndürmek / **C** $180^\circ$ döndürmek / **D** yalnızca $x$ eksenine göre yansıtmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$$A(-1,\ 3)$ noktası önce $x$ eksenine göre yansıtılıyor, sonra $2$ birim sağa öteleniyor.

Buna göre noktanın son konumu aşağıdakilerden hangisidir?$q$, array[$o$$(1,\ 3)$$o$, $o$$(1,\ -3)$$o$, $o$$(-3,\ -3)$$o$, $o$$(-1,\ -1)$$o$], 1, $e$1. $x$ eksenine göre yansıma: $(-1,\ 3) \to (-1,\ -3)$.
2. $2$ birim sağa öteleme: $(-1 + 2,\ -3) = (1,\ -3)$.

Diğer şıklar: **A** yansıma işlemini yapmamak / **C** ötelemeyi sola yapmak / **D** ötelemeyi yukarı doğru yapmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$$A(4,\ 2)$ noktasının $x = 1$ doğrusuna göre yansıması aşağıdakilerden hangisidir?$q$, array[$o$$(-2,\ 2)$$o$, $o$$(-4,\ 2)$$o$, $o$$(-3,\ 2)$$o$, $o$$(4,\ -2)$$o$], 0, $e$1. $A$ noktasının $x = 1$ doğrusuna uzaklığı $4 - 1 = 3$ birimdir.
2. Yansıma doğrunun diğer tarafında aynı uzaklıktadır: $x = 1 - 3 = -2$. $y$ koordinatı değişmez.
3. Yansıma $(-2,\ 2)$.

Diğer şıklar: **B** $y$ eksenine göre yansıtmak / **C** uzaklığı doğrudan işaret değiştirerek yazmak / **D** $x$ eksenine göre yansıtmak.$e$, 3),
  (11, 'lgs-mat', null::integer, $q$Köşeleri $A(1,\ 1)$, $B(4,\ 1)$ ve $C(1,\ 5)$ olan üçgen $x$ eksenine göre yansıtılıyor.

Buna göre yansıma sonucunda oluşan üçgenin çevresi kaç birimdir?$q$, array[$o$$7$$o$, $o$$9$$o$, $o$$12$$o$, $o$$24$$o$], 2, $e$1. Yansıma çevreyi değiştirmez. İlk üçgenin çevresini bulmak yeterlidir.
2. $|AB| = 3$, $|AC| = 4$ ve $|BC| = \sqrt{3^2 + 4^2} = 5$'tir.
3. Çevre $3 + 4 + 5 = 12$ birim.

Diğer şıklar: **A** yalnızca dik kenarları toplamak / **B** hipotenüsü $2$ almak / **D** çevreyi iki katı almak.$e$, 2),
  (12, 'lgs-mat', null::integer, $q$Bir kare, merkezi etrafında en az kaç derece döndürüldüğünde kendisiyle çakışır?$q$, array[$o$$45$$o$, $o$$60$$o$, $o$$90$$o$, $o$$180$$o$], 2, $e$1. Karenin dört köşesi vardır ve köşeler merkez etrafında eşit aralıklıdır.
2. Çakışma için gereken en küçük dönme açısı $\dfrac{360^\circ}{4} = 90^\circ$'dir.

Diğer şıklar: **A** dönme açısını yarıya indirmek / **B** kareyi altıgen sanmak / **D** yalnızca karşılıklı köşelerin çakışmasını düşünmek.$e$, 2),
  (13, 'lgs-mat', null::integer, $q$$A(3,\ 2)$ noktası önce $5$ birim sola ötelenip sonra $y$ eksenine göre yansıtılıyor.

Buna göre noktanın son konumu aşağıdakilerden hangisidir?$q$, array[$o$$(2,\ 2)$$o$, $o$$(-2,\ 2)$$o$, $o$$(2,\ -2)$$o$, $o$$(-8,\ 2)$$o$], 0, $e$1. $5$ birim sola öteleme: $(3 - 5,\ 2) = (-2,\ 2)$.
2. $y$ eksenine göre yansımada $x$ koordinatının işareti değişir: $(2,\ 2)$.

Diğer şıklar: **B** yansıma işlemini yapmamak / **C** $x$ eksenine göre yansıtmak / **D** ötelemeyi sağa yapıp yansıtmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$$A(2,\ 5)$ ve $A'(2,\ -1)$ noktaları hangi doğruya göre birbirinin yansımasıdır?$q$, array[$o$$y = 0$$o$, $o$$y = 3$$o$, $o$$x = 2$$o$, $o$$y = 2$$o$], 3, $e$1. İki nokta aynı apsise sahip olduğundan yansıma doğrusu $x$ eksenine paraleldir.
2. Doğru, ordinatların orta noktasından geçer: $\dfrac{5 + (-1)}{2} = 2$.
3. Yansıma doğrusu $y = 2$.

Diğer şıklar: **A** $x$ eksenini yansıma doğrusu sanmak / **B** iki ordinatın farkının yarısını almak / **C** noktaların ortak apsisini doğru sanmak.$e$, 3),
  (15, 'lgs-mat', null::integer, $q$$A(2,\ 3)$ noktası önce orijin etrafında $180^\circ$ döndürülüyor, sonra $x$ eksenine göre yansıtılıyor.

Buna göre noktanın son konumu aşağıdakilerden hangisidir?$q$, array[$o$$(-2,\ -3)$$o$, $o$$(2,\ -3)$$o$, $o$$(3,\ -2)$$o$, $o$$(-2,\ 3)$$o$], 3, $e$1. Orijin etrafında $180^\circ$ dönme: $(2,\ 3) \to (-2,\ -3)$.
2. $x$ eksenine göre yansıma: $(-2,\ -3) \to (-2,\ 3)$.

Diğer şıklar: **A** yansıma işlemini yapmamak / **B** dönme işlemini yapmamak / **C** koordinatların yerini değiştirmek.$e$, 3),
  (16, 'lgs-mat', null::integer, $q$Köşeleri $A(0,\ 0)$, $B(4,\ 0)$ ve $C(0,\ 3)$ olan üçgen önce $2$ birim sağa ve $1$ birim yukarı ötelenip sonra $y$ eksenine göre yansıtılıyor.

Buna göre son üçgenin alanı kaç birimkaredir?$q$, array[$o$$3$$o$, $o$$5$$o$, $o$$6$$o$, $o$$7$$o$], 2, $e$1. Öteleme ve yansıma şeklin alanını değiştirmez.
2. İlk üçgen $4$ ve $3$ birim dik kenarlı bir dik üçgendir. Alan $\dfrac{4 \cdot 3}{2} = 6$ birimkaredir.

Diğer şıklar: **A** yalnızca bir dik kenarı yazmak / **B** hipotenüsü alan sanmak / **D** dik kenarları toplamak.$e$, 2)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

-- lgs | konu | lgs-mat | Geometrik Cisimler konu testi
with s as (
  insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select 'LGS', 'konu', 'lgs-mat', t.id, $t$Geometrik Cisimler konu testi$t$, 32, true
  from public.topics t where t.subject_id = 'lgs-mat' and t.name = $n$Geometrik Cisimler$n$
  on conflict do nothing
  returning id, topic_id
)
insert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)
select s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty
from s, (values
  (1, 'lgs-mat', null::integer, $q$Bir ayrıtı $4$ cm olan küpün hacmi kaç cm$^3$'tür?$q$, array[$o$$12$$o$, $o$$16$$o$, $o$$64$$o$, $o$$96$$o$], 2, $e$1. Küpün hacmi ayrıtın küpüdür: $V = a^3$.
2. $4^3 = 64$ cm$^3$.

Diğer şıklar: **A** ayrıtı $3$ ile çarpmak / **B** bir yüzün alanını yazmak / **D** yüzey alanını yazmak.$e$, 1),
  (2, 'lgs-mat', null::integer, $q$Ayrıtları $6$ cm, $5$ cm ve $4$ cm olan dikdörtgenler prizmasının hacmi kaç cm$^3$'tür?$q$, array[$o$$15$$o$, $o$$30$$o$, $o$$60$$o$, $o$$120$$o$], 3, $e$1. Dikdörtgenler prizmasının hacmi, ayrıtların çarpımıdır.
2. $6 \cdot 5 \cdot 4 = 120$ cm$^3$.

Diğer şıklar: **A** ayrıtları toplamak / **B** iki ayrıtı çarpıp bırakmak / **C** $\dfrac{1}{2}$ ile çarpmak.$e$, 1),
  (3, 'lgs-mat', null::integer, $q$Taban yarıçapı $3$ cm, yüksekliği $4$ cm olan dik dairesel silindirin hacmi kaç cm$^3$'tür? ($\pi = 3$ olarak kabul edilir.)$q$, array[$o$$36$$o$, $o$$72$$o$, $o$$108$$o$, $o$$324$$o$], 2, $e$1. Silindirin hacmi $V = \pi r^2 h$'dir.
2. $3 \cdot 3^2 \cdot 4 = 3 \cdot 9 \cdot 4 = 108$ cm$^3$.

Diğer şıklar: **A** $\dfrac{1}{3}$ ile çarpmak / **B** yanal alanı yazmak / **D** $\pi r h$'nin karesini almak.$e$, 1),
  (4, 'lgs-mat', null::integer, $q$Taban yarıçapı $3$ cm, yüksekliği $4$ cm olan dik dairesel koninin hacmi kaç cm$^3$'tür? ($\pi = 3$ olarak kabul edilir.)$q$, array[$o$$18$$o$, $o$$36$$o$, $o$$72$$o$, $o$$108$$o$], 1, $e$1. Koninin hacmi, aynı taban ve yükseklikteki silindirin hacminin üçte biridir: $V = \dfrac{1}{3}\pi r^2 h$.
2. $\dfrac{1}{3} \cdot 3 \cdot 3^2 \cdot 4 = 36$ cm$^3$.

Diğer şıklar: **A** $\dfrac{1}{2}$ ile çarpmak / **C** yanal alanı yazmak / **D** silindirin hacmini yazmak.$e$, 1),
  (5, 'lgs-mat', null::integer, $q$Tabanı kenar uzunluğu $6$ cm olan kare, yüksekliği $9$ cm olan dik piramidin hacmi kaç cm$^3$'tür?$q$, array[$o$$54$$o$, $o$$108$$o$, $o$$162$$o$, $o$$324$$o$], 1, $e$1. Piramidin hacmi $V = \dfrac{1}{3} \cdot \text{taban alanı} \cdot \text{yükseklik}$'tir.
2. Taban alanı $6^2 = 36$ cm$^2$'dir.
3. $V = \dfrac{1}{3} \cdot 36 \cdot 9 = 108$ cm$^3$.

Diğer şıklar: **A** $\dfrac{1}{2}$ ile çarpmak / **C** taban alanını yanlış hesaplamak / **D** $\dfrac{1}{3}$ ile çarpmayı unutmak.$e$, 2),
  (6, 'lgs-mat', null::integer, $q$Tabanı $20$ cm $\times$ $30$ cm olan dikdörtgenler prizması biçimindeki bir kapta $25$ cm yüksekliğinde su vardır.

Buna göre kapta kaç litre su vardır?$q$, array[$o$$1{,}5$$o$, $o$$15$$o$, $o$$75$$o$, $o$$150$$o$], 1, $e$1. Suyun hacmi $20 \cdot 30 \cdot 25 = 15\,000$ cm$^3$'tür.
2. $1$ litre $= 1000$ cm$^3$ olduğundan $15\,000$ cm$^3$ $= 15$ litredir.

Diğer şıklar: **A** birim dönüşümünde bir basamak kaydırmak / **C** yüksekliği üç kat almak / **D** birim dönüşümünde bir basamak fazla kaydırmak.$e$, 2),
  (7, 'lgs-mat', null::integer, $q$Bir ayrıtı $3$ cm olan küpün yüzey alanı kaç cm$^2$'dir?$q$, array[$o$$18$$o$, $o$$27$$o$, $o$$36$$o$, $o$$54$$o$], 3, $e$1. Küpün $6$ yüzü vardır ve her yüz bir karedir.
2. Bir yüzün alanı $3^2 = 9$ cm$^2$'dir.
3. Yüzey alanı $6 \cdot 9 = 54$ cm$^2$.

Diğer şıklar: **A** iki yüzün alanını yazmak / **B** hacmi yazmak / **C** yalnızca dört yüzü saymak.$e$, 2),
  (8, 'lgs-mat', null::integer, $q$Taban yarıçapı $5$ cm, yüksekliği $12$ cm olan silindir biçimli bir kap tamamen suyla doludur. ($\pi = 3$ olarak kabul edilir.)

Buna göre kaptaki suyun hacmi kaç mililitredir? ($1$ cm$^3$ $= 1$ mL)$q$, array[$o$$0{,}9$$o$, $o$$300$$o$, $o$$900$$o$, $o$$1800$$o$], 2, $e$1. Silindirin hacmi $V = \pi r^2 h$'dir.
2. $3 \cdot 5^2 \cdot 12 = 3 \cdot 25 \cdot 12 = 900$ cm$^3$.
3. $1$ cm$^3$ $= 1$ mL olduğundan su $900$ mL'dir.

Diğer şıklar: **A** sonucu litre olarak yazmak / **B** $\dfrac{1}{3}$ ile çarpmak / **D** yarıçap yerine çapın yarısını iki kez kullanmak.$e$, 2),
  (9, 'lgs-mat', null::integer, $q$Bir küpün her ayrıtı $2$ katına çıkarılırsa hacmi kaç katına çıkar?$q$, array[$o$$2$$o$, $o$$4$$o$, $o$$6$$o$, $o$$8$$o$], 3, $e$1. Ayrıt $a$ iken hacim $a^3$'tür.
2. Ayrıt $2a$ olduğunda hacim $(2a)^3 = 8a^3$ olur. Hacim $8$ katına çıkar.

Diğer şıklar: **A** hacmi ayrıtla orantılı sanmak / **B** yüzey alanının değişimini yazmak / **C** ayrıt sayısına bakmak.$e$, 2),
  (10, 'lgs-mat', null::integer, $q$Hacmi $36$ cm$^3$ ve taban yarıçapı $3$ cm olan dik dairesel koninin yüksekliği kaç cm'dir? ($\pi = 3$ olarak kabul edilir.)$q$, array[$o$$1$$o$, $o$$4$$o$, $o$$9$$o$, $o$$12$$o$], 1, $e$1. $V = \dfrac{1}{3}\pi r^2 h$ eşitliğinde değerleri yaz: $36 = \dfrac{1}{3} \cdot 3 \cdot 9 \cdot h$.
2. $36 = 9h$ olduğundan $h = 4$ cm.

Diğer şıklar: **A** yanlış sadeleştirmek / **C** yarıçapın karesini yazmak / **D** koni formülündeki $\dfrac{1}{3}$'ü hacme uygulamak.$e$, 2),
  (11, 'lgs-mat', null::integer, $q$Taban yarıçapı $4$ cm olan silindir biçimli bir kapta $3$ cm yüksekliğinde su vardır. Kaba, tamamen suya batan ve hacmi $144$ cm$^3$ olan bir cisim atılıyor. ($\pi = 3$ olarak kabul edilir.)

Buna göre kaptaki su seviyesi kaç cm yükselir?$q$, array[$o$$3$$o$, $o$$6$$o$, $o$$9$$o$, $o$$48$$o$], 0, $e$1. Suyun yükselmesi, batan cismin hacmi kadar su hacmi demektir.
2. Kabın taban alanı $3 \cdot 4^2 = 48$ cm$^2$'dir.
3. Yükselme $\dfrac{144}{48} = 3$ cm.

Diğer şıklar: **B** ilk seviye ile yükselmeyi toplamak / **C** $\pi$'yi hesaba katmamak / **D** taban alanını yükselme sanmak.$e$, 3),
  (12, 'lgs-mat', null::integer, $q$Tabanı $10$ cm $\times$ $10$ cm olan dikdörtgenler prizması biçimindeki bir kapta $600$ cm$^3$ su vardır. Kaba, ayrıtı $5$ cm olan bir küp tamamen suya batacak şekilde bırakılıyor.

Buna göre kaptaki su seviyesi kaç cm olur?$q$, array[$o$$1{,}25$$o$, $o$$6$$o$, $o$$6{,}25$$o$, $o$$7{,}25$$o$], 3, $e$1. İlk su seviyesi $\dfrac{600}{100} = 6$ cm'dir.
2. Küpün hacmi $5^3 = 125$ cm$^3$ olduğundan toplam hacim $600 + 125 = 725$ cm$^3$ olur.
3. Yeni su seviyesi $\dfrac{725}{100} = 7{,}25$ cm.

Diğer şıklar: **A** yalnızca küpün hacmini taban alanına bölmek / **B** ilk seviyeyi yazmak / **C** küpün hacminden 100 çıkarmak.$e$, 3),
  (13, 'lgs-mat', null::integer, $q$Ayrıtı $6$ cm olan bir küpün içine yerleştirilebilecek, tabanı küpün bir yüzüne oturan en büyük dik dairesel silindirin hacmi kaç cm$^3$'tür? ($\pi = 3$ olarak kabul edilir.)$q$, array[$o$$162$$o$, $o$$216$$o$, $o$$324$$o$, $o$$648$$o$], 0, $e$1. Silindirin çapı küpün ayrıtına eşittir: yarıçap $r = 3$ cm. Yükseklik $h = 6$ cm.
2. $V = \pi r^2 h = 3 \cdot 9 \cdot 6 = 162$ cm$^3$.

Diğer şıklar: **B** küpün hacmini yazmak / **C** çapı yarıçap yerine kullanıp yüksekliği yarıya indirmek / **D** yarıçap yerine ayrıtı kullanmak.$e$, 3),
  (14, 'lgs-mat', null::integer, $q$Silindir biçimli bir kap tamamen suyla doludur. Bu su, tabanı ve yüksekliği silindirle aynı olan konik bir kapla ağzına kadar doldurulup boşaltılarak bitirilecektir.

Buna göre konik kap kaç kez doldurulup boşaltılmalıdır?$q$, array[$o$$3$$o$, $o$$4$$o$, $o$$6$$o$, $o$$9$$o$], 0, $e$1. Aynı taban ve yüksekliğe sahip koninin hacmi, silindirin hacminin üçte biridir.
2. Silindir, koni hacminin $3$ katı olduğundan $3$ kez boşaltmak gerekir.

Diğer şıklar: **B** koniyi dörtte bir silindir sanmak / **C** koni hacmini yanlış hesaplamak / **D** oranı karesini almak.$e$, 2),
  (15, 'lgs-mat', null::integer, $q$Taban yarıçapı $3$ cm, yüksekliği $4$ cm olan dik dairesel koninin ana doğrusunun (yan yüksekliğinin) uzunluğu kaç cm'dir?$q$, array[$o$$5$$o$, $o$$7$$o$, $o$$12$$o$, $o$$25$$o$], 0, $e$1. Yarıçap, yükseklik ve ana doğru bir dik üçgen oluşturur. Ana doğru hipotenüstür.
2. Ana doğru $\sqrt{3^2 + 4^2} = \sqrt{25} = 5$ cm.

Diğer şıklar: **B** yarıçap ile yüksekliği toplamak / **C** yarıçap ile yüksekliği çarpmak / **D** karekök almayı unutmak.$e$, 2),
  (16, 'lgs-mat', null::integer, $q$Ayrıtı $6$ cm olan dolu bir küp eritilerek tabanı kenar uzunluğu $3$ cm olan kare biçiminde bir dik prizma hâline getiriliyor.

Buna göre bu prizmanın yüksekliği kaç cm olur?$q$, array[$o$$6$$o$, $o$$12$$o$, $o$$24$$o$, $o$$36$$o$], 2, $e$1. Eritmede hacim değişmez. Küpün hacmi $6^3 = 216$ cm$^3$'tür.
2. Prizmanın taban alanı $3^2 = 9$ cm$^2$'dir.
3. Yükseklik $\dfrac{216}{9} = 24$ cm.

Diğer şıklar: **A** yüksekliği küp ayrıtı sanmak / **B** hacmi yanlış bölmek / **D** hacmi küp ayrıtına bölmek.$e$, 3)
) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);

