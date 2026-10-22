-- TYT Temel Matematik konu anlatımları (d). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Merdivenin eğimi, iki yolun kesişme açısı, bir çatının iki kenarı arasındaki açı: Hepsi açıdır. Geometri sorularının büyük kısmı aslında açı hesabıdır. TYT geometride **açı bilgisi** her konunun temelidir: Üçgen, çokgen, çember ve benzerlik sorularında hep açı yazarak ilerlersin. Bu konuda doğrular arasındaki açıları, paralel doğruların oluşturduğu açı çiftlerini ve üçgende açı ilişkilerini öğreneceksin.

:::hedefler
1. Komşu bütünler ve ters açı ilişkilerini kullanmak.
2. Paralel doğruları kesen bir doğrunun oluşturduğu açı çiftlerini ayırt etmek.
3. Üçgenin iç ve dış açı özelliklerini uygulamak.
4. İç ve dış açıortayların oluşturduğu açı bağıntılarını kullanmak.
5. Üçgen eşitsizliğini ve kenar-açı ilişkisini kullanmak.
:::

:::ipucu
Geometri sorusunda **şekle bilinen her açıyı yazarak başla**. Bir açıyı bulduğunda ters, bütünler ya da iç ters olduğu açıları da hemen işaretle. Çoğu soru bu zincirin sonunda kendiliğinden çözülür.
:::

## 1. Doğruda açılar

Başlangıç noktaları aynı olan iki ışının oluşturduğu şekle **açı** denir. Açının ölçüsü derece ile verilir. Dik açı 90°, doğru açı 180°'dir. 90°'den küçük açı **dar**, büyük açı **geniş** açıdır.

**Bütünler açılar.** Toplamları 180° olan açılardır. Bir doğru üzerindeki komşu iki açı bütünlerdir. **Tümler açılar.** Toplamları 90° olan açılardır.

**Ters açılar.** İki doğru kesiştiğinde karşılıklı duran açılar eşittir.

**Örnek.** Bir doğru üzerindeki komşu iki açı $(3x + 10)°$ ve $(2x + 20)°$ ise $5x + 30 = 180$ ve $x = 30$ bulunur. Açılar $100°$ ve $80°$'dir.

## 2. Paralel doğrular ve kesen

İki paralel doğruyu bir kesen kestiğinde sekiz açı oluşur. Şekilde geniş açılar turuncu, dar açılar yeşil gösterilmiştir.

![İki paralel doğruyu bir kesen kesiyor. Kesişim noktalarında 1 ile 8 arasında numaralanmış sekiz açı var, geniş açılar turuncu, dar açılar yeşil](/lessons/tyt-mat/paralel-kesen.svg "Paralel doğrular ve kesen | Yolumnet")

| Açı çifti | Şekildeki örnek | İlişki |
| --- | --- | --- |
| Yöndeş | 1 ile 5, 2 ile 6, 3 ile 7, 4 ile 8 | Eşit |
| İç ters | 3 ile 5, 4 ile 6 | Eşit |
| Dış ters | 1 ile 7, 2 ile 8 | Eşit |
| Karşı durumlu (iç) | 3 ile 6, 4 ile 5 | Toplamları 180° |
| Ters | 1 ile 3, 2 ile 4 | Eşit |

**Örnek.** Şekildeki dar açılar 65° ise 2, 4, 6 ve 8 numaralı açıların hepsi 65°, diğer dört açının hepsi $180° - 65° = 115°$ olur. Paralellik varsa yalnızca iki ölçü vardır: Biri $\alpha$, diğeri $180° - \alpha$.

**Kırık çizgi kuralı.** İki paralel doğru arasında bir noktadan kırılan çizginin kırılma noktasındaki açı, paralel doğrularla yaptığı iki açının toplamına eşittir. $d_1 \parallel d_2$ olsun. P noktasından $d_1$'e ve $d_2$'ye doğrular çiziliyor ve bu doğrular paralellerle sırasıyla $30°$ ve $50°$ açı yapıyor. P noktasındaki açı $30° + 50° = 80°$ olur.

:::ipucu{baslik="Sık yapılan hata"}
Karşı durumlu açıları eşit sanmak çok sık yapılan bir hatadır. **İç ters, dış ters ve yöndeş açılar eşit, karşı durumlu açılar bütünlerdir.** Şekilde iki açı aynı tarafta ve paraleller arasındaysa toplamları 180°'dir.
:::

## 3. Üçgende açılar

**İç açılar toplamı.** Bir üçgenin iç açılarının toplamı $180°$'dir.

![ABC üçgeninde x, y ve z iç açıları ve C köşesindeki dış açı x artı y](/lessons/tyt-mat/ucgen-dis-aci.svg "İç ve dış açı | Yolumnet")

**Dış açı.** Bir kenarın uzantısı ile komşu kenarın yaptığı açıya dış açı denir. Dış açı, kendisine komşu olmayan iki iç açının toplamına eşittir.

**Örnek.** Bir üçgenin iki iç açısı 50° ve 60° ise üçüncü açı $180° - 110° = 70°$, o açının dış açısı ise $50° + 60° = 110°$'dir. Bu değer, üçüncü açının bütünleri olan $180° - 70° = 110°$ ile aynıdır.

**İkizkenar üçgen.** İki kenarı eşit olan üçgenin eşit kenarlarının karşısındaki açılar da eşittir. **Örnek.** Tepe açısı 40° olan ikizkenar üçgende taban açıları $\dfrac{180° - 40°}{2} = 70°$'dir. **Eşkenar üçgen.** Üç açısı da 60°'dir.

## 4. Açıortaylar

Açıyı iki eşit açıya bölen ışına **açıortay** denir. Bir üçgende iki iç açıortayın kesiştiği noktaya $I$ denirse, A köşesindeki açı $\alpha$ olmak üzere

$$m(\widehat{BIC}) = 90° + \frac{\alpha}{2}$$

**Örnek.** $\alpha = 50°$ ise $m(\widehat{BIC}) = 90° + 25° = 115°$. Bunun kontrolü: B ve C açılarının toplamı $130°$, yarısı $65°$ ve $180° - 65° = 115°$.

| Durum | Açı |
| --- | --- |
| İki iç açıortay arasındaki açı | $90° + \dfrac{\alpha}{2}$ |
| İki dış açıortay arasındaki açı | $90° - \dfrac{\alpha}{2}$ |
| Bir iç ve bir dış açıortay arasındaki açı | $\dfrac{\alpha}{2}$ |
| Aynı köşenin iç ve dış açıortayı | Birbirine dik |

**Örnek.** $\alpha = 50°$ iken iki dış açıortay arasındaki açı $90° - 25° = 65°$'dir.

## 5. Kenar ve açı ilişkisi

**Üçgen eşitsizliği.** Bir üçgenin herhangi bir kenarı, diğer iki kenarın farkından büyük, toplamından küçüktür: $\lvert b - c \rvert < a < b + c$.

**Örnek.** İki kenarı 5 ve 9 olan üçgenin üçüncü kenarı $4 < x < 14$ aralığındadır. Tam sayı değerleri 5, 6, ..., 13 olduğundan 9 farklı tam sayı değeri vardır.

**Büyük açı karşısında büyük kenar.** Üçgende en büyük açının karşısı en uzun kenar, en küçük açının karşısı en kısa kenardır. **Örnek.** $A = 40°$, $B = 60°$, $C = 80°$ ise $a < b < c$.

:::baglanti
Bu konudaki ilişkiler, "Özel Üçgenler" ve "Çokgenler ve Dörtgenler" konularında sürekli kullanılır. Çokgenin iç açılar toplamı da üçgene bölünerek bulunur: $n$ kenarlı çokgen $n - 2$ üçgene bölünür, iç açılar toplamı $(n - 2) \cdot 180°$ olur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Bütünler, tümler | $180°$ ve $90°$ |
| Paralel, kesen | Yöndeş ve ters çiftler eşit, karşı durumlu bütünler |
| İç açılar toplamı | $180°$ |
| Dış açı | İki uzak iç açının toplamı |
| İç açıortaylar | $90° + \dfrac{\alpha}{2}$ |
| Üçgen eşitsizliği | $\lvert b - c \rvert < a < b + c$ |
| Büyük açı | Karşısında büyük kenar |

## Mini test

:::soru{cevap="C"}
ABC üçgeninde B ve C köşelerinden çizilen iç açıortaylar I noktasında kesişiyor. $m(\widehat{BAC}) = 64°$ olduğuna göre $m(\widehat{BIC})$ kaç derecedir?

- A) 58
- B) 116
- C) 122
- D) 128
- E) 154

---

1. B ve C açılarının toplamı $180° - 64° = 116°$.
2. İç açıortaylar bu açıları ikiye böldüğünden BIC üçgeninde $\dfrac{116°}{2} = 58°$ eder.
3. $m(\widehat{BIC}) = 180° - 58° = 122°$. Doğru cevap C.

Diğer şıklar: **58** $90° - \dfrac{\alpha}{2}$ kullanılmış / **116** B ile C açılarının toplamı alınmış / **128** A açısının iki katı alınmış / **154** $90° + \alpha$ alınmış.
:::

:::soru{cevap="A"}
ABC üçgeninde $\lvert AB \rvert = \lvert AC \rvert$ ve D noktası [BC] ışınının C noktasından sonraki uzantısı üzerindedir. $m(\widehat{ACD}) = 118°$ olduğuna göre $m(\widehat{BAC})$ kaç derecedir?

- A) 56
- B) 59
- C) 62
- D) 118
- E) 124

---

1. C köşesindeki iç açı dış açının bütünleridir: $180° - 118° = 62°$.
2. $\lvert AB \rvert = \lvert AC \rvert$ olduğundan taban açıları eşit: $m(\widehat{B}) = m(\widehat{C}) = 62°$.
3. $m(\widehat{BAC}) = 180° - 2 \cdot 62° = 56°$. Doğru cevap A.

Diğer şıklar: **59** dış açı ikiye bölünmüş / **62** taban açısı bulunmuş / **118** dış açı alınmış / **124** taban açısının iki katı alınmış.
:::

:::soru{cevap="E"}
Bir üçgenin iki kenarının uzunluğu 7 cm ve 12 cm, çevresi tam sayı cm olduğuna göre bu üçgenin çevresi en çok kaç cm olabilir?

- A) 19
- B) 26
- C) 31
- D) 36
- E) 37

---

1. Üçgen eşitsizliği: $12 - 7 < x < 12 + 7$, yani $5 < x < 19$.
2. Tam sayı olması için en büyük $x = 18$.
3. Çevre $7 + 12 + 18 = 37$ cm. Doğru cevap E.

Diğer şıklar: **19** yalnızca verilen iki kenarın toplamı alınmış / **26** üçüncü kenar 7 alınmış / **31** üçüncü kenar 12 alınmış / **36** üçüncü kenar 17 alınmış.
:::

:::soru{cevap="D"}
$d_1 \parallel d_2$ olmak üzere bu iki doğruyu kesen bir doğru ile oluşan, aynı tarafta ve paralellerin arasında kalan iki açının ölçüleri $(3x - 10)°$ ve $(2x + 20)°$ olduğuna göre bu açılardan küçük olanı kaç derecedir?

- A) 34
- B) 38
- C) 80
- D) 88
- E) 92

---

1. Aynı tarafta ve paralellerin arasında kalan açılar karşı durumludur, toplamları 180°'dir.
2. $(3x - 10) + (2x + 20) = 180$ ise $5x = 170$ ve $x = 34$.
3. Açılar $3 \cdot 34 - 10 = 92°$ ve $2 \cdot 34 + 20 = 88°$. Küçük olan 88°. Doğru cevap D.

Diğer şıklar: **34** yalnızca $x$ değeri alınmış / **38** tümler açı sanılıp toplam 90 alınmış / **80** açılar eşit alınmış, iç ters sanılmış / **92** büyük açı alınmış.
:::

## Kendini dene

:::dene
1. Bütünleri, kendisinin 4 katı olan açı kaç derecedir? => $x + 4x = 180°$ ise $x = 36°$.
2. Bir üçgenin iki iç açısı 35° ve 85° ise en büyük dış açısı kaç derecedir? => Üçüncü açı 60°. Dış açılar $145°$, $95°$ ve $120°$ olduğundan en büyüğü $145°$.
3. İkizkenar bir üçgenin taban açılarından biri 55° ise tepe açısı kaç derecedir? => $180° - 2 \cdot 55° = 70°$.
4. Kenarları 4, 9 ve $x$ olan üçgende $x$ en çok kaç tam sayı olabilir? => $5 < x < 13$ olduğundan en çok 12.
5. Bir üçgende $\alpha = 80°$ ise iki iç açıortay arasındaki $\widehat{BIC}$ açısı kaç derecedir? => $90° + 40° = 130°$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-mat' and name = 'Doğruda ve Üçgende Açılar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Doğruda açılar, paralel doğrular ve kesen, üçgende iç ve dış açılar, açıortaylar, üçgen eşitsizliği, kenar ve açı ilişkisi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayısal sonuçlar python ile doğrulandı. Şekillerdeki geniş ve dar açı ölçüleri 115° ve 65° olarak çizilmiştir.
Kontrol edilecekler: Sorular şekilsiz, yalnızca metinle tanımlandı. İsterseniz şekilli sürüm eklenebilir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Doğruda ve Üçgende Açılar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir merdivenin duvara dayandığı yükseklik, bir dikdörtgen arsanın köşegeni, bir uçurtmanın ipinin boyu. Hepsinde dik üçgen vardır ve kenarları birbirine **Pisagor** bağıntısıyla bağlanır. TYT geometride özel üçgenler, hesabı kısaltan kalıplardır: Kenar oranlarını bilirsen kök hesabı yapmadan sonuca gidersin. Bu konuda dik üçgeni, 3-4-5 gibi üçlüleri, Öklid bağıntılarını, 45° ve 30° içeren üçgenleri, ikizkenar ve eşkenar üçgeni öğreneceksin.

:::hedefler
1. Pisagor bağıntısını ve Pisagor üçlülerini kullanmak.
2. Öklid bağıntılarıyla dik üçgendeki parçaları hesaplamak.
3. 45°-45°-90° ve 30°-60°-90° üçgenlerinin kenar oranlarını uygulamak.
4. Dik üçgende hipotenüse ait kenarortayı hesaplamak.
5. İkizkenar ve eşkenar üçgenin yüksekliğini bulmak.
:::

:::ipucu
Kenar uzunlukları verilmiş bir dik üçgende **önce bildik üçlüye bak**. Kenarlar 6, 8 ve ? ise cevap 10'dur, karekök almadan bulunur. Kenarlar 5 ve 12 ise 13'tür. Bu tanıdık sayılar sınavda dakikalar kazandırır.
:::

## 1. Dik üçgen ve Pisagor bağıntısı

Bir açısı 90° olan üçgene **dik üçgen** denir. Dik açının karşısındaki kenara **hipotenüs**, diğer iki kenara **dik kenar** denir. Dik kenarlar $b$ ve $c$, hipotenüs $a$ ise

$$a^2 = b^2 + c^2$$

**Örnek.** Dik kenarları 9 ve 12 olan üçgenin hipotenüsü $\sqrt{81 + 144} = 15$'tir. Hipotenüsü 17, bir dik kenarı 8 olan üçgenin diğer dik kenarı $\sqrt{289 - 64} = 15$'tir.

**Pisagor üçlüleri.** Kenarları tam sayı olan dik üçgenlerin en çok kullanılanları:

| Üçlü | Katları |
| --- | --- |
| 3, 4, 5 | 6, 8, 10 ve 9, 12, 15 |
| 5, 12, 13 | 10, 24, 26 |
| 8, 15, 17 | 16, 30, 34 |
| 7, 24, 25 | 14, 48, 50 |

## 2. Öklid bağıntıları

A köşesi dik olan ABC üçgeninde A'dan hipotenüse indirilen dikmenin ayağı H olsun. $\lvert BH \rvert = p$, $\lvert HC \rvert = q$, $\lvert AH \rvert = h$, hipotenüs $a = p + q$, dik kenarlar $c = \lvert AB \rvert$ ve $b = \lvert AC \rvert$ olmak üzere:

![A köşesi dik olan ABC üçgeninde AH yüksekliği hipotenüsü p ve q parçalarına ayırıyor. h kare p çarpı q, c kare p çarpı a, b kare q çarpı a ve b çarpı c a çarpı h](/lessons/tyt-mat/oklid.svg "Öklid bağıntıları | Yolumnet")

**Örnek.** $p = 9$ ve $q = 16$ ise $h = \sqrt{9 \cdot 16} = 12$ ve $a = 25$. Dik kenarlar $c = \sqrt{9 \cdot 25} = 15$ ve $b = \sqrt{16 \cdot 25} = 20$. Kontrol: $15^2 + 20^2 = 25^2$ ve $b \cdot c = 300 = a \cdot h = 25 \cdot 12$.

## 3. Özel dik üçgenler

![İkizkenar dik üçgende kenarlar k, k ve k kök 2. Otuz altmış doksan üçgeninde kenarlar k, k kök 3 ve 2k](/lessons/tyt-mat/ozel-ucgenler.svg "45-45-90 ve 30-60-90 üçgenleri | Yolumnet")

**45°-45°-90° üçgeni.** Dik kenarlar eşit, hipotenüs dik kenarın $\sqrt{2}$ katıdır. **Örnek.** Hipotenüsü $10\sqrt{2}$ olan ikizkenar dik üçgenin dik kenarları 10'dur.

**30°-60°-90° üçgeni.** 30°'nin karşısındaki kenar hipotenüsün yarısıdır, 60°'nin karşısındaki kenar $\sqrt{3}$ çarpanı taşır. **Örnek.** 30°'nin karşısındaki kenar 6 ise hipotenüs 12, 60°'nin karşısındaki kenar $6\sqrt{3}$'tür.

## 4. Dik üçgende kenarortay

Dik üçgende hipotenüse ait kenarortay, hipotenüsün yarısına eşittir. Hipotenüsün orta noktası, üç köşeye eşit uzaklıktadır.

**Örnek.** Dik kenarları 6 ve 8 olan üçgenin hipotenüsü 10, hipotenüse ait kenarortayı 5'tir.

## 5. İkizkenar ve eşkenar üçgen

**İkizkenar üçgen.** Eşit kenarlar $a$, taban $b$ ise tepeden tabana inen yükseklik tabanı ortalar ve

$$h = \sqrt{a^2 - \left(\frac{b}{2}\right)^2}$$

**Örnek.** Kenarları 10, 10 ve 12 olan üçgende $h = \sqrt{100 - 36} = 8$.

**Eşkenar üçgen.** Kenar uzunluğu $a$ ise yükseklik $h = \dfrac{a\sqrt{3}}{2}$'dir. Eşkenar üçgenin yüksekliği aynı zamanda açıortayı ve kenarortayıdır. **Örnek.** $a = 8$ ise $h = 4\sqrt{3}$.

:::ipucu{baslik="Sık yapılan hata"}
Pisagor bağıntısı **yalnızca dik üçgende** geçerlidir. Hipotenüs her zaman en uzun kenardır. Kenarları 5, 6, 7 olan üçgenin dik üçgen olup olmadığını $5^2 + 6^2 = 61 \neq 49$ ile test edersin: Dik değildir. Ayrıca $\sqrt{a^2 + b^2}$ ifadesini $a + b$ olarak yazmak çok yapılan bir hatadır.
:::

:::baglanti
Özel üçgenler, "Çember ve Daire" ile "Analitik Geometri" konularında sürekli geri döner. İki nokta arasındaki uzaklık formülü, koordinat düzleminde kurulan bir dik üçgenin Pisagor bağıntısından başka bir şey değildir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Pisagor | $a^2 = b^2 + c^2$ |
| Öklid | $h^2 = p \cdot q$, $c^2 = p \cdot a$, $b^2 = q \cdot a$ |
| 45°-45°-90° | $k, k, k\sqrt{2}$ |
| 30°-60°-90° | $k, k\sqrt{3}, 2k$ |
| Kenarortay | Hipotenüsün yarısı |
| İkizkenar yükseklik | $\sqrt{a^2 - (b/2)^2}$ |
| Eşkenar yükseklik | $\dfrac{a\sqrt{3}}{2}$ |

## Mini test

:::soru{cevap="D"}
A köşesindeki açısı 90° olan ABC üçgeninde A noktasından [BC] kenarına indirilen dikmenin ayağı H'dir. $\lvert BH \rvert = 4$ cm ve $\lvert HC \rvert = 9$ cm olduğuna göre $\lvert AB \rvert \cdot \lvert AC \rvert$ çarpımı kaç $\text{cm}^2$'dir?

- A) 13
- B) 36
- C) 39
- D) 78
- E) 169

---

1. Öklid bağıntısına göre $h^2 = 4 \cdot 9 = 36$, yani $h = 6$.
2. Hipotenüs $a = 4 + 9 = 13$.
3. $\lvert AB \rvert \cdot \lvert AC \rvert = a \cdot h = 13 \cdot 6 = 78$. Doğru cevap D.

Diğer şıklar: **13** hipotenüsün uzunluğu alınmış / **36** yüksekliğin karesi alınmış / **39** üçgenin alanı alınmış / **169** hipotenüsün karesi alınmış.
:::

:::soru{cevap="C"}
ABC üçgeninde $m(\widehat{A}) = 90°$, $m(\widehat{B}) = 30°$ ve $\lvert AC \rvert = 6$ cm'dir. D noktası [BC] üzerinde ve $[AD] \perp [BC]$ olduğuna göre $\lvert AD \rvert$ kaç cm'dir?

- A) 3
- B) $3\sqrt{2}$
- C) $3\sqrt{3}$
- D) 6
- E) 9

---

1. 30°'nin karşısındaki $\lvert AC \rvert = 6$ ise hipotenüs $\lvert BC \rvert = 12$ ve $\lvert AB \rvert = 6\sqrt{3}$.
2. Dik üçgende $\lvert AB \rvert \cdot \lvert AC \rvert = \lvert BC \rvert \cdot \lvert AD \rvert$ olduğundan $6\sqrt{3} \cdot 6 = 12 \cdot \lvert AD \rvert$.
3. $\lvert AD \rvert = 3\sqrt{3}$. Doğru cevap C.

Diğer şıklar: **3** $\lvert DC \rvert$ bulunmuş / **$3\sqrt{2}$** $\sqrt{3}$ yerine $\sqrt{2}$ alınmış / **6** $\lvert AC \rvert$ alınmış / **9** $\lvert BD \rvert$ bulunmuş.
:::

:::soru{cevap="C"}
ABC üçgeninde $m(\widehat{A}) = 90°$, $\lvert AB \rvert = 10$ cm ve $\lvert AC \rvert = 24$ cm'dir. [AM], hipotenüse ait kenarortay olduğuna göre $\lvert AM \rvert$ kaç cm'dir?

- A) 5
- B) 12
- C) 13
- D) 17
- E) 26

---

1. Hipotenüs $\lvert BC \rvert = \sqrt{10^2 + 24^2} = 26$ (5, 12, 13 üçlüsünün 2 katı).
2. Hipotenüse ait kenarortay hipotenüsün yarısıdır: $\lvert AM \rvert = 13$. Doğru cevap C.

Diğer şıklar: **5** $\lvert AB \rvert$ nin yarısı alınmış / **12** $\lvert AC \rvert$ nin yarısı alınmış / **17** iki dik kenarın ortalaması alınmış / **26** hipotenüs alınmış.
:::

:::soru{cevap="C"}
Kenar uzunlukları 13 cm, 13 cm ve 10 cm olan ikizkenar üçgenin 10 cm'lik tabana ait yüksekliği kaç cm'dir?

- A) 5
- B) 10
- C) 12
- D) 13
- E) 60

---

1. Yükseklik tabanı ortalar. Dik üçgenin hipotenüsü 13, bir dik kenarı $\dfrac{10}{2} = 5$.
2. Diğer dik kenar $h = \sqrt{13^2 - 5^2} = 12$ (5, 12, 13 üçlüsü). Doğru cevap C.

Diğer şıklar: **5** tabanın yarısı alınmış / **10** tabanın uzunluğu alınmış / **13** eşit kenarın uzunluğu alınmış / **60** üçgenin alanı alınmış.
:::

## Kendini dene

:::dene
1. Dik kenarları 20 ve 21 olan üçgenin hipotenüsü kaçtır? => $\sqrt{400 + 441} = 29$.
2. Hipotenüsü 13, bir dik kenarı 5 olan üçgenin diğer dik kenarı kaçtır? => 12.
3. İkizkenar dik üçgenin hipotenüsü $6\sqrt{2}$ ise dik kenarı kaçtır? => 6.
4. 30°-60°-90° üçgeninde hipotenüs 14 ise en kısa kenar kaçtır? => 7.
5. Eşkenar üçgenin kenarı 6 ise yüksekliği kaçtır? => $\dfrac{6\sqrt{3}}{2} = 3\sqrt{3}$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Özel Üçgenler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Pisagor bağıntısı, Öklid bağıntıları, 45-45-90 ve 30-60-90 üçgenleri, dik üçgende kenarortay, ikizkenar ve eşkenar üçgenin yüksekliği. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sorular şekilsiz, yalnızca metinle tanımlandı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Özel Üçgenler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir üçgen biçimindeki tabloyu tek parmakla dengede tutmak istersen parmağını nereye koyarsın? Cevap **ağırlık merkezidir**: Üç kenarortayın kesiştiği nokta. Bu konuda iki özel doğru parçasını öğreneceksin: açıortay ve kenarortay. Bu doğruların kenarları ve alanı nasıl böldüğünü de göreceksin. TYT'de bu konunun soruları çoğunlukla **oran** sorularıdır.

:::hedefler
1. İç açıortay teoremini uygulamak.
2. Açıortay üzerindeki bir noktadan kenarlara eşit uzaklık özelliğini kullanmak.
3. Kenarortayın tanımını ve ağırlık merkezinin 2'ye 1 özelliğini kullanmak.
4. Orta taban teoremini ve kenarortayın alanı ikiye bölmesini kullanmak.
5. İkizkenar ve eşkenar üçgendeki özel durumları bilmek.
:::

:::ipucu
Açıortay görünce **kenar oranı**, kenarortay görünce **alan ve 2'ye 1 oranı** aklına gelsin. Hangi teoremi seçeceğini şekilde işaretlenen eşit açı ya da eşit parça söyler.
:::

## 1. Açıortay

Bir açıyı iki eşit açıya bölen ışına **açıortay** denir. Açıortay üzerindeki her nokta açının iki kenarına eşit uzaklıktadır. Üçgenin iç açıortayları tek noktada kesişir. Bu nokta üçgenin iç teğet çemberinin merkezidir ve $I$ ile gösterilir.

**İç açıortay teoremi.** ABC üçgeninde [AD], A açısının iç açıortayı ve D noktası [BC] üzerinde ise karşı kenar, komşu kenarların oranında bölünür:

$$\frac{\lvert BD \rvert}{\lvert DC \rvert} = \frac{\lvert AB \rvert}{\lvert AC \rvert}$$

![ABC üçgeninde AD iç açıortayı BC kenarını x ve y parçalarına ayırıyor. x bölü y, c bölü b](/lessons/tyt-mat/acioortay-teoremi.svg "İç açıortay teoremi | Yolumnet")

**Örnek.** $\lvert AB \rvert = 6$, $\lvert AC \rvert = 9$ ve $\lvert BC \rvert = 10$ ise $\dfrac{\lvert BD \rvert}{\lvert DC \rvert} = \dfrac{6}{9} = \dfrac{2}{3}$. Toplam 10 olduğundan $\lvert BD \rvert = 4$ ve $\lvert DC \rvert = 6$.

**Dış açıortay.** Dış açının açıortayı da karşı kenarın uzantısını $\dfrac{\lvert AB \rvert}{\lvert AC \rvert}$ oranında böler. Aynı köşenin iç ve dış açıortayları birbirine diktir.

## 2. Kenarortay ve ağırlık merkezi

Bir köşeyi karşı kenarın orta noktasına birleştiren doğru parçasına **kenarortay** denir. Üç kenarortay tek noktada kesişir. Bu nokta **ağırlık merkezidir** ve $G$ ile gösterilir.

![ABC üçgeninde AD, BE ve CF kenarortayları G noktasında kesişiyor. AG uzunluğu GD uzunluğunun 2 katıdır](/lessons/tyt-mat/agirlik-merkezi.svg "Ağırlık merkezi | Yolumnet")

**Ağırlık merkezi özelliği.** $G$, her kenarortayı köşeden başlayarak $2 : 1$ oranında böler:

$$\lvert AG \rvert = 2 \cdot \lvert GD \rvert, \qquad \lvert AG \rvert = \frac{2}{3} \lvert AD \rvert$$

**Örnek.** $\lvert AD \rvert = 15$ ise $\lvert AG \rvert = 10$ ve $\lvert GD \rvert = 5$.

**Kenarortay uzunluğu.** $a$, $b$, $c$ kenarlar olmak üzere $a$ kenarına ait kenarortay

$$m_a^2 = \frac{2b^2 + 2c^2 - a^2}{4}$$

**Örnek.** $a = 8$, $b = 7$, $c = 9$ ise $m_a^2 = \dfrac{98 + 162 - 64}{4} = 49$ ve $m_a = 7$.

## 3. Alan ve orta taban

**Alan.** Kenarortay üçgeni alanları eşit iki üçgene böler. Üç kenarortay üçgeni alanları eşit **altı üçgene** ayırır. **Örnek.** $A(ABC) = 48$ ise $A(ABD) = 24$, $A(GBC) = \dfrac{48}{3} = 16$ ve altı küçük üçgenin her biri $\dfrac{48}{6} = 8$.

**Orta taban teoremi.** Bir üçgende iki kenarın orta noktalarını birleştiren doğru parçası üçüncü kenara paraleldir ve onun yarısı kadardır. **Örnek.** D ve E, [AB] ve [AC] kenarlarının orta noktaları ve $\lvert BC \rvert = 14$ ise $[DE] \parallel [BC]$ ve $\lvert DE \rvert = 7$. ADE üçgeni ABC üçgeninin yarı ölçekli bir kopyasıdır, çevresi de yarısıdır.

## 4. İkizkenar ve eşkenar üçgende

İkizkenar üçgende **tepe açısının açıortayı**, tabana ait **kenarortay** ve **yükseklik** aynı doğru parçasıdır. Eşkenar üçgende bu durum üç köşe için de geçerlidir ve ağırlık merkezi, iç teğet çemberin merkezi, yüksekliklerin kesim noktası aynı noktadır.

:::ipucu{baslik="Sık yapılan hata"}
İç açıortay teoreminde oran **komşu kenarlar** arasında kurulur, karşı kenar parçaları ile değil. $\dfrac{\lvert BD \rvert}{\lvert DC \rvert} = \dfrac{\lvert AB \rvert}{\lvert AC \rvert}$. $\lvert BD \rvert$, $\lvert AB \rvert$ ile aynı tarafta kalır. Açıortay teoremini kenarortayla karıştırıp parçaları eşit saymak da sık yapılan bir hatadır: Kenarortay karşı kenarı eşit böler, açıortay böyle bir şey yapmaz.
:::

:::baglanti
Kenarortay ve açıortay teoremleri "Üçgende Alan" ve "Üçgende Benzerlik" konularında alan oranlarının ve benzerlik oranlarının temelini oluşturur. Orta taban teoremi benzerliğin en basit örneğidir: ADE ve ABC üçgenlerinin benzerlik oranı $\dfrac{1}{2}$'dir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İç açıortay teoremi | $\dfrac{\lvert BD \rvert}{\lvert DC \rvert} = \dfrac{\lvert AB \rvert}{\lvert AC \rvert}$ |
| Açıortay noktası | Kenarlara eşit uzak |
| Ağırlık merkezi | Köşeden $2 : 1$ |
| Kenarortay alanı | Üçgeni iki eşit alana böler |
| Altı üçgen | Her biri $\dfrac{1}{6}$ alan |
| Orta taban | Paralel ve yarısı kadar |
| İkizkenar üçgen | Açıortay, kenarortay, yükseklik aynı |

## Mini test

:::soru{cevap="B"}
ABC üçgeninde [AD], A açısının iç açıortayıdır ve D noktası [BC] kenarı üzerindedir. $\lvert AB \rvert = 12$ cm, $\lvert AC \rvert = 18$ cm ve $\lvert BC \rvert = 20$ cm olduğuna göre $\lvert BD \rvert$ kaç cm'dir?

- A) 6
- B) 8
- C) 10
- D) 12
- E) 18

---

1. İç açıortay teoremi: $\dfrac{\lvert BD \rvert}{\lvert DC \rvert} = \dfrac{12}{18} = \dfrac{2}{3}$.
2. $\lvert BD \rvert = 2k$, $\lvert DC \rvert = 3k$ ve $5k = 20$ ise $k = 4$.
3. $\lvert BD \rvert = 8$ cm. Doğru cevap B.

Diğer şıklar: **6** $\lvert AC \rvert - \lvert AB \rvert$ alınmış / **10** açıortay yerine kenarortay sanılıp $\lvert BC \rvert$ nin yarısı alınmış / **12** $\lvert DC \rvert$ bulunmuş / **18** $\lvert AC \rvert$ alınmış.
:::

:::soru{cevap="C"}
ABC üçgeninde [AD] ve [BE] kenarortaylar olup G noktasında kesişmektedir. $\lvert AD \rvert = 18$ cm ve $\lvert BE \rvert = 24$ cm olduğuna göre $\lvert AG \rvert + \lvert BG \rvert$ toplamı kaç cm'dir?

- A) 14
- B) 21
- C) 28
- D) 34
- E) 36

---

1. Ağırlık merkezi kenarortayı köşeden $2 : 1$ böler.
2. $\lvert AG \rvert = \dfrac{2}{3} \cdot 18 = 12$ ve $\lvert BG \rvert = \dfrac{2}{3} \cdot 24 = 16$.
3. Toplam $12 + 16 = 28$ cm. Doğru cevap C.

Diğer şıklar: **14** $\lvert GD \rvert + \lvert GE \rvert$ bulunmuş / **21** iki kenarortayın ortalaması alınmış / **34** $\lvert AD \rvert$ ile $\lvert BG \rvert$ toplanmış / **36** $\lvert AG \rvert$ ile $\lvert BE \rvert$ toplanmış.
:::

:::soru{cevap="B"}
ABC üçgeninde D ve E noktaları sırasıyla [AB] ve [AC] kenarlarının orta noktalarıdır. $\lvert BC \rvert = 10$ cm ve ADE üçgeninin çevresi 18 cm olduğuna göre BCED dörtgeninin çevresi kaç cm'dir?

- A) 26
- B) 28
- C) 29
- D) 36
- E) 46

---

1. Orta taban teoremine göre $\lvert DE \rvert = 5$ cm. ADE çevresi 18 olduğundan $\lvert AD \rvert + \lvert AE \rvert = 13$.
2. D ve E orta nokta olduğundan $\lvert BD \rvert + \lvert CE \rvert = 13$.
3. BCED çevresi: $\lvert BC \rvert + \lvert DE \rvert + \lvert BD \rvert + \lvert CE \rvert = 10 + 5 + 13 = 28$ cm. Doğru cevap B.

Diğer şıklar: **26** $\lvert AB \rvert + \lvert AC \rvert$ bulunmuş / **29** işlem hatasıyla bir fazla bulunmuş / **36** ABC üçgeninin çevresi alınmış / **46** ABC çevresi ile $\lvert BC \rvert$ toplanmış.
:::

:::soru{cevap="B"}
Alanı 72 $\text{cm}^2$ olan ABC üçgeninde [AD] ve [BE] kenarortaylar, G ise ağırlık merkezidir. Buna göre AGE üçgeninin alanı kaç $\text{cm}^2$'dir?

- A) 9
- B) 12
- C) 18
- D) 24
- E) 36

---

1. Üç kenarortay üçgeni alanları eşit altı üçgene ayırır.
2. Her birinin alanı $\dfrac{72}{6} = 12$.
3. AGE bu altı üçgenden biridir. $A(AGE) = 12$ $\text{cm}^2$. Doğru cevap B.

Diğer şıklar: **9** ABC alanının sekizde biri alınmış / **18** ABC alanının dörtte biri alınmış / **24** ABC alanının üçte biri alınmış / **36** ABC alanının yarısı alınmış.
:::

## Kendini dene

:::dene
1. $\lvert AB \rvert = 4$, $\lvert AC \rvert = 6$, $\lvert BC \rvert = 10$ olan üçgende A açısının iç açıortayı [BC]'yi D noktasında kesiyor. $\lvert BD \rvert$ kaçtır? => $\dfrac{4}{6} = \dfrac{2}{3}$ olduğundan $\lvert BD \rvert = 4$.
2. Bir kenarortayın uzunluğu 24 ise ağırlık merkezinin köşeye uzaklığı kaçtır? => $\dfrac{2}{3} \cdot 24 = 16$.
3. D ve E, [AB] ve [AC]'nin orta noktalarıdır. $\lvert DE \rvert = 9$ ise $\lvert BC \rvert$ kaçtır? => $2 \cdot 9 = 18$.
4. Alanı 60 olan ABC üçgeninde G ağırlık merkezidir. $A(GAB)$ kaçtır? => $\dfrac{60}{3} = 20$.
5. Kenarları 5, 5 ve 6 olan ikizkenar üçgende tabana ait kenarortay kaçtır? => Kenarortay aynı zamanda yüksekliktir: $\sqrt{25 - 9} = 4$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Açıortay ve Kenarortay'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Açıortay, iç açıortay teoremi, kenarortay, ağırlık merkezi, kenarortay uzunluğu, orta taban teoremi, alan bölünmesi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sorular şekilsiz, metinle tanımlandı. Dış açıortay teoremi yalnızca oran olarak verildi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Açıortay ve Kenarortay'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir arsanın üçgen biçimli köşesinin ne kadar yer kapladığını, bir yelkenin kumaş miktarını ya da bir çatı yüzeyinin boyasını hesaplarken **alan** gerekir. TYT'de üçgen alanı soruları çoğunlukla iki türdendir: Doğrudan formül uygulamak ve **alanları birbirine oranlamak**. İkincisinde sayısal alan değerini bilmeden de sonuca gidersin. Bu konuda alan formüllerini ve alan oranı kurallarını öğreneceksin.

:::hedefler
1. Taban ve yükseklikle üçgenin alanını hesaplamak.
2. İki kenar ve aradaki açıyla alanı bulmak.
3. Üç kenar uzunluğu verilen üçgenin alanını Heron formülüyle hesaplamak.
4. İç teğet çember yarıçapı ile alan ilişkisini kullanmak.
5. Alan oranı sorularını taban ve açı oranlarıyla çözmek.
:::

:::ipucu
Alan sorularında **hangi kenara ait yüksekliğin verildiğine** dikkat et. Yükseklik yalnızca ait olduğu tabanla çarpılır. Aynı üçgenin farklı tabanları ve yükseklikleri vardır ama çarpımları aynı alanı verir.
:::

## 1. Taban ve yükseklikle alan

Bir üçgenin alanı, herhangi bir kenarı ile o kenara ait yüksekliğin çarpımının yarısıdır:

$$A = \frac{1}{2} \cdot a \cdot h_a$$

**Örnek.** Tabanı 12, yüksekliği 7 olan üçgenin alanı $\dfrac{12 \cdot 7}{2} = 42$.

![BC tabanı üzerinde ortak olan ve tepesi d doğrusu üzerinde kayan üç üçgen. Taban ve yükseklik aynı olduğundan alanları eşit](/lessons/tyt-mat/ucgen-alan-yukseklik.svg "Aynı taban, aynı yükseklik | Yolumnet")

**Aynı taban, aynı yükseklik.** Tabanı ortak olan ve tepeleri tabana paralel bir doğru üzerinde bulunan üçgenlerin alanları eşittir. Şekildeki üç üçgenin alanı eşittir.

**Dik üçgende** dik kenarlar birbirinin yüksekliği olduğundan $A = \dfrac{b \cdot c}{2}$. **Eşkenar üçgende** kenar $a$ ise $A = \dfrac{a^2\sqrt{3}}{4}$. **Örnek.** Kenarı 6 olan eşkenar üçgenin alanı $\dfrac{36\sqrt{3}}{4} = 9\sqrt{3}$.

## 2. İki kenar ve aradaki açı

İki kenarı $a$ ve $b$, aralarındaki açı $\alpha$ olan üçgenin alanı

$$A = \frac{1}{2} \cdot a \cdot b \cdot \sin\alpha$$

| Açı | 30° | 45° | 60° | 90° |
| --- | --- | --- | --- | --- |
| $\sin$ | $\dfrac{1}{2}$ | $\dfrac{\sqrt{2}}{2}$ | $\dfrac{\sqrt{3}}{2}$ | 1 |

**Örnek.** Kenarları 8 ve 10, aralarındaki açı 30° olan üçgenin alanı $\dfrac{1}{2} \cdot 8 \cdot 10 \cdot \dfrac{1}{2} = 20$. Açı 60° olsaydı alan $\dfrac{1}{2} \cdot 80 \cdot \dfrac{\sqrt{3}}{2} = 20\sqrt{3}$ olurdu. Açı 90° ise formül dik üçgen alanına döner.

## 3. Heron formülü ve iç teğet çember

Üç kenarı $a$, $b$, $c$ ve yarı çevresi $u = \dfrac{a + b + c}{2}$ olan üçgende

$$A = \sqrt{u\,(u - a)(u - b)(u - c)}$$

**Örnek.** Kenarları 13, 14, 15 olan üçgende $u = 21$ ve $A = \sqrt{21 \cdot 8 \cdot 7 \cdot 6} = \sqrt{7056} = 84$.

**İç teğet çember.** Çemberin yarıçapı $r$ ise $A = u \cdot r$. Yukarıdaki üçgende $84 = 21 \cdot r$ olduğundan $r = 4$.

## 4. Alan oranları

| Durum | Alan oranı |
| --- | --- |
| Yükseklikleri eşit | Tabanlarının oranı |
| Tabanları eşit | Yüksekliklerinin oranı |
| Bir açıları ortak ya da bütünler | Bu açıyı oluşturan kenarların çarpımlarının oranı |
| Benzer üçgenler | Benzerlik oranının karesi |

**Yükseklik ortaksa.** ABC üçgeninde D, [BC] üzerinde bir nokta ise ABD ve ADC üçgenlerinin yüksekliği ortaktır (A'dan BC'ye inen yükseklik). $\dfrac{A(ABD)}{A(ADC)} = \dfrac{\lvert BD \rvert}{\lvert DC \rvert}$. **Örnek.** $\lvert BD \rvert : \lvert DC \rvert = 2 : 3$ ve $A(ABC) = 50$ ise $A(ABD) = 20$, $A(ADC) = 30$.

**Açı ortaksa.** D, [AB] üzerinde, E, [AC] üzerinde ise ADE ve ABC üçgenlerinin A açısı ortaktır:

$$\frac{A(ADE)}{A(ABC)} = \frac{\lvert AD \rvert \cdot \lvert AE \rvert}{\lvert AB \rvert \cdot \lvert AC \rvert}$$

**Örnek.** $\lvert AB \rvert = 5$, $\lvert AC \rvert = 6$, $\lvert AD \rvert = 2$, $\lvert AE \rvert = 3$ ve $A(ABC) = 60$ ise $A(ADE) = 60 \cdot \dfrac{6}{30} = 12$.

:::ipucu{baslik="Sık yapılan hata"}
Açı ortak olduğunda oran **iki kenar oranının çarpımıdır**, toplamı ya da ortalaması değil. Yalnızca bir kenar oranını alıp çarpma işlemini unutmak sık yapılan bir hatadır. $\dfrac{\lvert AD \rvert}{\lvert AB \rvert}$ ile $\dfrac{\lvert AE \rvert}{\lvert AC \rvert}$ çarpılır.
:::

:::baglanti
Alan oranları "Üçgende Benzerlik" konusunda benzerlik oranının karesi olarak yeniden karşına çıkar. Bu konudaki "yükseklik ortak olunca oran tabanlar oranıdır" kuralı, kenarortayın alanı ikiye bölmesinin nedenidir: Kenarortay tabanı eşit böler, yükseklik ortaktır.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Temel formül | $\dfrac{1}{2} \cdot a \cdot h_a$ |
| Sinüslü | $\dfrac{1}{2} ab \sin\alpha$ |
| Heron | $\sqrt{u(u-a)(u-b)(u-c)}$ |
| Teğet çember | $A = u \cdot r$ |
| Eşkenar | $\dfrac{a^2\sqrt{3}}{4}$ |
| Ortak yükseklik | Alan oranı taban oranı |
| Ortak açı | Alan oranı kenar çarpımları oranı |

## Mini test

:::soru{cevap="B"}
Kenar uzunlukları 17 cm, 25 cm ve 26 cm olan üçgenin alanı kaç $\text{cm}^2$'dir?

- A) 102
- B) 204
- C) 205
- D) 408
- E) 41616

---

1. Yarı çevre $u = \dfrac{17 + 25 + 26}{2} = 34$.
2. $A = \sqrt{34 \cdot 17 \cdot 9 \cdot 8} = \sqrt{41616} = 204$. Doğru cevap B.

Diğer şıklar: **102** Heron sonucu 2 ye bölünmüş / **205** işlem hatasıyla bir fazla bulunmuş / **408** Heron sonucu 2 ile çarpılmış / **41616** karekök alınmamış.
:::

:::soru{cevap="C"}
Bir ABC üçgeninde $\lvert AB \rvert = 12$ cm, $\lvert AC \rvert = 20$ cm ve $m(\widehat{BAC}) = 30°$ olduğuna göre üçgenin alanı kaç $\text{cm}^2$'dir?

- A) 15
- B) 30
- C) 60
- D) $60\sqrt{3}$
- E) 120

---

1. $A = \dfrac{1}{2} \cdot \lvert AB \rvert \cdot \lvert AC \rvert \cdot \sin 30°$.
2. $A = \dfrac{1}{2} \cdot 12 \cdot 20 \cdot \dfrac{1}{2} = 60$. Doğru cevap C.

Diğer şıklar: **15** çarpım dört kez yarıya bölünmüş / **30** çarpım üç kez yarıya bölünmüş / **$60\sqrt{3}$** $\sin 60°$ alınmış / **120** $\sin 30°$ yerine 1 alınmış.
:::

:::soru{cevap="B"}
ABC üçgeninde D noktası [BC] üzerindedir. $\lvert BD \rvert = 3$ cm, $\lvert DC \rvert = 7$ cm ve $A(ABD) = 18$ $\text{cm}^2$ olduğuna göre $A(ADC)$ kaç $\text{cm}^2$'dir?

- A) 18
- B) 42
- C) 54
- D) 60
- E) 126

---

1. ABD ve ADC üçgenlerinin A'dan inen yüksekliği ortaktır, alanlar taban oranındadır.
2. $\dfrac{A(ABD)}{A(ADC)} = \dfrac{3}{7}$ ise $A(ADC) = 18 \cdot \dfrac{7}{3} = 42$. Doğru cevap B.

Diğer şıklar: **18** verilen alan alınmış / **54** $18 \cdot 3$ hesaplanmış / **60** ABC üçgeninin alanı alınmış / **126** $18 \cdot 7$ hesaplanmış.
:::

:::soru{cevap="A"}
ABC üçgeninde D noktası [AB] üzerinde, E noktası [AC] üzerindedir. $\lvert AD \rvert = 4$ cm, $\lvert DB \rvert = 2$ cm, $\lvert AE \rvert = 3$ cm, $\lvert EC \rvert = 6$ cm ve $A(ABC) = 90$ $\text{cm}^2$ olduğuna göre $A(ADE)$ kaç $\text{cm}^2$'dir?

- A) 20
- B) 30
- C) 45
- D) 60
- E) 90

---

1. $\lvert AB \rvert = 4 + 2 = 6$ ve $\lvert AC \rvert = 3 + 6 = 9$.
2. A açısı ortak: $\dfrac{A(ADE)}{A(ABC)} = \dfrac{4 \cdot 3}{6 \cdot 9} = \dfrac{2}{9}$.
3. $A(ADE) = 90 \cdot \dfrac{2}{9} = 20$ $\text{cm}^2$. Doğru cevap A.

Diğer şıklar: **30** yalnızca $\dfrac{\lvert AE \rvert}{\lvert AC \rvert}$ oranı alınmış / **45** iki oranın ortalaması alınmış / **60** yalnızca $\dfrac{\lvert AD \rvert}{\lvert AB \rvert}$ oranı alınmış / **90** iki oranın toplamı alınmış.
:::

## Kendini dene

:::dene
1. Dik kenarları 6 ve 8 olan üçgenin alanı kaçtır? => $\dfrac{6 \cdot 8}{2} = 24$.
2. Kenarları 10 ve 14, aralarındaki açı 30° olan üçgenin alanı kaçtır? => $\dfrac{1}{2} \cdot 10 \cdot 14 \cdot \dfrac{1}{2} = 35$.
3. Kenarları 5, 5 ve 6 olan üçgenin alanı kaçtır? => $u = 8$ ve $A = \sqrt{8 \cdot 3 \cdot 3 \cdot 2} = 12$.
4. D, [BC] üzerinde ve $\lvert BD \rvert = 2 \cdot \lvert DC \rvert$ iken $A(ABC) = 30$ ise $A(ADC)$ kaçtır? => $\dfrac{30}{3} = 10$.
5. Çevresi 24 ve iç teğet çember yarıçapı 3 olan üçgenin alanı kaçtır? => $u = 12$, $A = 12 \cdot 3 = 36$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Üçgende Alan'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Üçgende alan, sinüslü alan formülü, Heron, iç teğet çember, alan oranları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekil özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sinüs değerleri tablo olarak verildi, trigonometri ayrı konu. Sorular şekilsiz.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Üçgende Alan'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ağacın boyunu, ağaca çıkmadan, gölgesinden hesaplayabilirsin. Haritadaki 1 cm gerçekte kaç metredir, fotoğrafı büyütünce neden oranlar bozulmaz? Hepsinin arkasında **benzerlik** vardır: Şekil aynı kalır, ölçü değişir. TYT geometride benzerlik, "bir üçgenin içinde paralel çizgi görürsen" başlayan bir düşünce biçimidir. Bu konuda benzerlik koşullarını, temel orantı teoremini, Thales teoremini ve alan oranlarını öğreneceksin.

:::hedefler
1. İki üçgenin benzerliğini AA, KAK ve KKK koşullarıyla belirlemek.
2. Benzerlik oranını kullanarak kenar, çevre ve yükseklik hesaplamak.
3. Temel orantı teoremini ve Thales teoremini uygulamak.
4. Benzer şekillerde alan oranının benzerlik oranının karesi olduğunu kullanmak.
5. Yamukta köşegenlerin oluşturduğu benzer üçgenleri bulmak.
:::

:::ipucu
Paralel iki doğru görüyorsan **benzer üçgen aranır**. Eşit açıları (ters ve yöndeş açılar) işaretle, iki açı eşitse üçgenler benzerdir. Sonra yalnızca **karşılıklı kenarların oranını** yaz.
:::

## 1. Benzer üçgenler

Karşılıklı açıları eşit ve karşılıklı kenarları orantılı olan üçgenlere **benzer üçgenler** denir. ABC üçgeni DEF üçgenine benzerse $\triangle ABC \sim \triangle DEF$ yazılır ve

$$\frac{\lvert AB \rvert}{\lvert DE \rvert} = \frac{\lvert BC \rvert}{\lvert EF \rvert} = \frac{\lvert AC \rvert}{\lvert DF \rvert} = k$$

$k$ sayısına **benzerlik oranı** denir. Benzerlik yazımında köşelerin sırası eşleşen köşeleri gösterir.

**Benzerlik koşulları:**

| Koşul | Anlamı |
| --- | --- |
| AA (açı, açı) | İki açı eşitse üçgenler benzerdir |
| KAK (kenar, açı, kenar) | İki kenar orantılı ve aralarındaki açı eşitse benzerdir |
| KKK (kenar, kenar, kenar) | Üç kenar orantılıysa benzerdir |

**Örnek.** Bir üçgenin iki açısı 50° ve 60°, diğerinin iki açısı 60° ve 70° ise ilkinin üçüncü açısı $180° - 110° = 70°$'dir. Açılar ikisinde de 50°, 60°, 70° olduğundan üçgenler benzerdir.

## 2. Benzerlik oranı ve ölçüler

Benzerlik oranı $k$ olan iki şekilde:

| Ölçü | Oran |
| --- | --- |
| Kenar, yükseklik, kenarortay, açıortay | $k$ |
| Çevre | $k$ |
| Alan | $k^2$ |
| Hacim | $k^3$ |

**Örnek.** Benzerlik oranı $\dfrac{3}{5}$ olan iki üçgenden büyüğünün alanı 100 ise küçüğünün alanı $100 \cdot \dfrac{9}{25} = 36$.

**Gölge problemi.** Gün ışığında boyu 1,8 m olan bir kişinin gölgesi 2,4 m iken yanındaki ağacın gölgesi 12 m ise ağacın boyu, benzer dik üçgenlerden $\dfrac{1{,}8}{2{,}4} = \dfrac{h}{12}$ ile $h = 9$ m bulunur.

## 3. Temel orantı teoremi

Bir üçgende bir kenara paralel çizilen doğru, diğer iki kenarı orantılı böler ve kesilen küçük üçgen büyüğe benzer olur.

![ABC üçgeninde DE doğrusu BC kenarına paralel. AD bölü AB, AE bölü AC ve DE bölü BC birbirine eşit](/lessons/tyt-mat/temel-oranti.svg "Temel orantı teoremi | Yolumnet")

$$[DE] \parallel [BC] \Rightarrow \frac{\lvert AD \rvert}{\lvert AB \rvert} = \frac{\lvert AE \rvert}{\lvert AC \rvert} = \frac{\lvert DE \rvert}{\lvert BC \rvert}, \qquad \frac{\lvert AD \rvert}{\lvert DB \rvert} = \frac{\lvert AE \rvert}{\lvert EC \rvert}$$

**Örnek.** $\lvert AD \rvert = 4$, $\lvert DB \rvert = 2$ ve $\lvert BC \rvert = 15$ ise $\lvert AB \rvert = 6$ ve $\lvert DE \rvert = 15 \cdot \dfrac{4}{6} = 10$.

## 4. Thales teoremi

Paralel doğrular, kendilerini kesen doğrular üzerinde orantılı parçalar ayırır.

![Üç paralel doğru iki kesen doğruyu kesiyor. Birinci kesende m ve n, ikinci kesende p ve q parçaları oluşuyor. m bölü n, p bölü q](/lessons/tyt-mat/thales.svg "Thales teoremi | Yolumnet")

**Örnek.** Bir kesen üzerinde $\lvert AB \rvert = 3$, $\lvert BC \rvert = 5$, diğer kesen üzerinde $\lvert DE \rvert = 6$ ise $\dfrac{3}{5} = \dfrac{6}{\lvert EF \rvert}$ ve $\lvert EF \rvert = 10$.

## 5. Yamukta benzerlik

ABCD yamuğunda $[AB] \parallel [CD]$ ve köşegenler E noktasında kesişiyorsa ABE ve CDE üçgenleri benzerdir (ters açılar eşit). Bu durumda

$$\frac{\lvert AE \rvert}{\lvert EC \rvert} = \frac{\lvert BE \rvert}{\lvert ED \rvert} = \frac{\lvert AB \rvert}{\lvert CD \rvert}$$

:::ipucu{baslik="Sık yapılan hata"}
Benzer üçgenlerde **karşılıklı kenarlar** oranlanır. Yamukta $\dfrac{\lvert AE \rvert}{\lvert AB \rvert}$ yazmak hatadır: $\lvert AE \rvert$ ve $\lvert AB \rvert$ aynı üçgende yan yana duran kenarlardır. Doğrusu $\dfrac{\lvert AE \rvert}{\lvert EC \rvert} = \dfrac{\lvert AB \rvert}{\lvert CD \rvert}$. Ayrıca alan oranı için benzerlik oranını karesiyle çarpmayı unutma.
:::

:::baglanti
Orta taban teoremi bu konunun özel hâlidir: $\lvert AD \rvert = \lvert DB \rvert$ olduğunda benzerlik oranı $\dfrac{1}{2}$ olur. Benzerlik, "Çember ve Daire" konusunda kuvvet bağıntıları için de kullanılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Koşullar | AA, KAK, KKK |
| Kenar, çevre | $k$ |
| Alan | $k^2$ |
| Temel orantı | Paralel $\Rightarrow$ orantılı kenarlar |
| Thales | Paraleller kesenlerde orantı |
| Yamuk | Köşegenler tabanlar oranında bölünür |

## Mini test

:::soru{cevap="D"}
ABC üçgeninde D noktası [AB] üzerinde, E noktası [AC] üzerindedir ve $[DE] \parallel [BC]$'dir. $\lvert AD \rvert = 6$ cm, $\lvert DB \rvert = 3$ cm ve $\lvert DE \rvert = 8$ cm olduğuna göre $\lvert BC \rvert$ kaç cm'dir?

- A) 4
- B) 10
- C) 11
- D) 12
- E) 16

---

1. $[DE] \parallel [BC]$ olduğundan ADE ve ABC üçgenleri benzerdir.
2. $\lvert AB \rvert = 6 + 3 = 9$ cm.
3. $\dfrac{\lvert AD \rvert}{\lvert AB \rvert} = \dfrac{\lvert DE \rvert}{\lvert BC \rvert}$ ise $\dfrac{6}{9} = \dfrac{8}{\lvert BC \rvert}$ ve $\lvert BC \rvert = 12$ cm. Doğru cevap D.

Diğer şıklar: **4** oran ters kurulmuş / **10** işlem hatasıyla iki eksik bulunmuş / **11** işlem hatasıyla bir eksik bulunmuş / **16** $\dfrac{\lvert AD \rvert}{\lvert DB \rvert}$ oranı kullanılmış.
:::

:::soru{cevap="A"}
$d_1 \parallel d_2 \parallel d_3$ olmak üzere bu doğruları kesen iki doğrudan birincisi $d_1$, $d_2$, $d_3$ doğrularını sırasıyla A, B, C noktalarında, ikincisi D, E, F noktalarında kesiyor. $\lvert AB \rvert = 4$ cm, $\lvert BC \rvert = 6$ cm ve $\lvert DF \rvert = 25$ cm olduğuna göre $\lvert DE \rvert$ kaç cm'dir?

- A) 10
- B) 15
- C) 19
- D) 21
- E) 25

---

1. Thales teoremi: $\dfrac{\lvert DE \rvert}{\lvert EF \rvert} = \dfrac{\lvert AB \rvert}{\lvert BC \rvert} = \dfrac{4}{6} = \dfrac{2}{3}$.
2. $\lvert DE \rvert = 2k$, $\lvert EF \rvert = 3k$ ve $5k = 25$ ise $k = 5$.
3. $\lvert DE \rvert = 10$ cm. Doğru cevap A.

Diğer şıklar: **15** $\lvert EF \rvert$ bulunmuş / **19** $\lvert DF \rvert$ den $\lvert BC \rvert$ çıkarılmış / **21** $\lvert DF \rvert$ den $\lvert AB \rvert$ çıkarılmış / **25** $\lvert DF \rvert$ alınmış.
:::

:::soru{cevap="D"}
Benzer iki üçgenden ABC üçgeninin alanı 32 $\text{cm}^2$'dir. ABC üçgeninin $[AB]$ kenarı 6 cm, bu kenara karşılık gelen DEF üçgeninin $[DE]$ kenarı 9 cm olduğuna göre DEF üçgeninin alanı kaç $\text{cm}^2$'dir?

- A) 48
- B) 64
- C) 71
- D) 72
- E) 108

---

1. Benzerlik oranı $\dfrac{9}{6} = \dfrac{3}{2}$.
2. Alanlar oranı benzerlik oranının karesidir: $\dfrac{9}{4}$.
3. $A(DEF) = 32 \cdot \dfrac{9}{4} = 72$ $\text{cm}^2$. Doğru cevap D.

Diğer şıklar: **48** alan oranı yerine benzerlik oranı kullanılmış / **64** alan 2 ile çarpılmış / **71** işlem hatasıyla bir eksik bulunmuş / **108** benzerlik oranının küpü kullanılmış.
:::

:::soru{cevap="C"}
ABCD yamuğunda $[AB] \parallel [CD]$, $\lvert AB \rvert = 6$ cm ve $\lvert CD \rvert = 9$ cm'dir. Köşegenler E noktasında kesişiyor ve $\lvert AE \rvert = 4$ cm olduğuna göre $\lvert AC \rvert$ kaç cm'dir?

- A) 6
- B) 8
- C) 10
- D) 13
- E) 15

---

1. ABE ve CDE üçgenleri benzerdir (ters açılar eşit).
2. $\dfrac{\lvert AE \rvert}{\lvert EC \rvert} = \dfrac{\lvert AB \rvert}{\lvert CD \rvert} = \dfrac{6}{9} = \dfrac{2}{3}$ ise $\lvert EC \rvert = 6$ cm.
3. $\lvert AC \rvert = 4 + 6 = 10$ cm. Doğru cevap C.

Diğer şıklar: **6** $\lvert EC \rvert$ bulunmuş / **8** $\lvert AE \rvert$ nin iki katı alınmış / **13** $\lvert AE \rvert$ ile $\lvert CD \rvert$ toplanmış / **15** iki tabanın toplamı alınmış.
:::

## Kendini dene

:::dene
1. Benzerlik oranı $\dfrac{2}{3}$ olan iki üçgenden küçüğünün çevresi 20 ise büyüğünün çevresi kaçtır? => $20 \cdot \dfrac{3}{2} = 30$.
2. $[DE] \parallel [BC]$, $\lvert AD \rvert = 3$, $\lvert AB \rvert = 9$ ve $\lvert DE \rvert = 4$ ise $\lvert BC \rvert$ kaçtır? => $\dfrac{3}{9} = \dfrac{4}{\lvert BC \rvert}$ ise $\lvert BC \rvert = 12$.
3. Benzer iki üçgenin alanları 9 ve 25 ise benzerlik oranı kaçtır? => Alan oranı $\dfrac{9}{25} = k^2$ ise $k = \dfrac{3}{5}$.
4. Boyu 1 m olan bir çubuğun gölgesi 1,5 m iken bir direğin gölgesi 9 m ise direğin boyu kaç metredir? => $\dfrac{h}{9} = \dfrac{1}{1{,}5}$ ise $h = 6$.
5. $d_1 \parallel d_2 \parallel d_3$ ve bir kesen üzerinde parçalar 4 ve 6, diğer kesen üzerinde ilk parça 10 ise ikinci parça kaçtır? => $\dfrac{4}{6} = \dfrac{10}{x}$ ise $x = 15$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Üçgende Benzerlik'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Üçgenlerde benzerlik, benzerlik koşulları, temel orantı teoremi, Thales teoremi, alan oranı, yamukta benzerlik. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sorular şekilsiz. Açıortay teoremi ayrı konuda işlendi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Üçgende Benzerlik'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Zemin karoları, bir satranç tahtası, bir tarlanın çiti: Çevremizdeki şekillerin çoğu çokgendir. TYT'de bu konunun soruları iki işe indirgenir: **Açıları** bir formülle bulmak ve **dörtgenin türünü** tanıyıp özelliğini kullanmak. Bu konuda çokgenlerin açı ve köşegen bağıntılarını, paralelkenar, eşkenar dörtgen, dikdörtgen, kare, yamuk ve deltoidin özelliklerini öğreneceksin.

:::hedefler
1. Çokgenin iç ve dış açılar toplamını ve köşegen sayısını hesaplamak.
2. Düzgün çokgenin bir iç ve dış açısını bulmak.
3. Dörtgen çeşitlerini ve birbirleriyle ilişkisini bilmek.
4. Paralelkenar, eşkenar dörtgen, dikdörtgen ve karenin özelliklerini kullanmak.
5. Yamuk ve deltoidin alan ve uzunluk bağıntılarını uygulamak.
:::

:::ipucu
Dörtgen sorusunda **önce dörtgenin türünü belirle**. Türü bilince hangi özellikleri kullanabileceğin belli olur: Köşegenler dik mi, birbirini ortalıyor mu, eşit mi? Her tür için gerekli olan özellik farklıdır.
:::

## 1. Çokgenler

Kapalı ve kendini kesmeyen doğru parçalarından oluşan şekillere **çokgen** denir. $n$ kenarlı bir çokgende:

| Özellik | Formül |
| --- | --- |
| İç açılar toplamı | $(n - 2) \cdot 180°$ |
| Dış açılar toplamı | $360°$ |
| Köşegen sayısı | $\dfrac{n(n - 3)}{2}$ |
| Bir köşeden çizilen köşegen sayısı | $n - 3$ |

İç açılar toplamının nedeni, bir köşeden çizilen köşegenlerin çokgeni $n - 2$ üçgene bölmesidir.

![Altıgen, bir köşeden çizilen üç köşegenle dört üçgene ayrılıyor. İç açılar toplamı 720 derece, düzgün altıgende bir iç açı 120 derece](/lessons/tyt-mat/cokgen-ucgenler.svg "Çokgenin üçgenlere bölünmesi | Yolumnet")

**Düzgün çokgen.** Bütün kenarları ve bütün açıları eşit olan çokgendir. Bir dış açısı $\dfrac{360°}{n}$, bir iç açısı $180° - \dfrac{360°}{n}$ olur.

**Örnek.** Düzgün altıgende iç açılar toplamı $720°$, bir iç açı $120°$, bir dış açı $60°$, köşegen sayısı $\dfrac{6 \cdot 3}{2} = 9$. Düzgün sekizgende iç açılar toplamı $1080°$, bir iç açı $135°$, köşegen sayısı $\dfrac{8 \cdot 5}{2} = 20$. Bir dış açısı $36°$ olan düzgün çokgenin kenar sayısı $\dfrac{360}{36} = 10$ ve iç açısı $144°$'dir.

## 2. Dörtgenler

Dörtgenin iç açılar toplamı $360°$'dir. Dörtgenler birbirinin özel hâlidir:

![Dörtgenin alt türleri: yamuk, deltoid, paralelkenar, dikdörtgen, eşkenar dörtgen ve kare, okla bağlı](/lessons/tyt-mat/dortgen-ailesi.svg "Dörtgenler ailesi | Yolumnet")

Okun ucundaki şekil, başlangıçtakinin tüm özelliklerini taşır. Kare hem dikdörtgenin hem eşkenar dörtgenin özelliklerine sahiptir.

## 3. Paralelkenar ve özel hâlleri

**Paralelkenar.** Karşılıklı kenarları paralel dörtgendir. Karşılıklı kenarları eşit, karşılıklı açıları eşit, komşu açıları bütünler, köşegenleri birbirini ortalar. Alanı $A = a \cdot h_a$ ya da $A = a \cdot b \cdot \sin\alpha$.

**Eşkenar dörtgen.** Dört kenarı eşit paralelkenardır. Köşegenleri birbirini **dik** ortalar ve açıortaydır. Alanı $A = \dfrac{e \cdot f}{2}$ ($e$ ve $f$ köşegenler).

**Örnek.** Köşegenleri 10 ve 24 olan eşkenar dörtgenin alanı $\dfrac{10 \cdot 24}{2} = 120$. Köşegenler birbirini dik ortaladığından kenar $\sqrt{5^2 + 12^2} = 13$ ve çevre 52'dir.

**Dikdörtgen.** Dört açısı dik paralelkenardır. Köşegenleri eşit uzunlukta ve birbirini ortalar. Alanı $A = a \cdot b$.

**Kare.** Dört kenarı eşit, dört açısı dik dörtgendir. Köşegen $a\sqrt{2}$, alan $A = a^2 = \dfrac{d^2}{2}$ ($d$ köşegen). Köşegenleri eşit, dik ve birbirini ortalar. **Örnek.** Kenarı 6 olan karenin köşegeni $6\sqrt{2}$, alanı 36.

## 4. Yamuk ve deltoid

**Yamuk.** En az bir çift kenarı paralel olan dörtgendir. Paralel kenarlara **taban** ($a$ ve $c$) denir. Tabanlara paralel ve yan kenarların orta noktalarını birleştiren doğru parçasına **orta taban** denir:

$$\text{orta taban} = \frac{a + c}{2}, \qquad A = \frac{(a + c) \cdot h}{2}$$

**Örnek.** Tabanları 14 ve 6, yüksekliği 5 olan yamuğun orta tabanı 10, alanı $\dfrac{20 \cdot 5}{2} = 50$. **İkizkenar yamuk.** Yan kenarları eşit olan yamukta taban açıları eşit, köşegenler eşittir.

**Deltoid.** İki çift komşu kenarı eşit olan dörtgendir. Köşegenleri birbirine diktir. Alanı $A = \dfrac{e \cdot f}{2}$.

:::ipucu{baslik="Sık yapılan hata"}
**Köşegen özellikleri** karıştırılır. Dikdörtgende köşegenler eşittir ama dik değildir. Eşkenar dörtgende köşegenler diktir ama eşit değildir. Yalnızca karede hem dik hem eşittir. Alan formüllerinde de $\dfrac{e \cdot f}{2}$ yalnızca köşegenleri dik olan dörtgenlerde (eşkenar dörtgen, deltoid, kare) geçerlidir.
:::

:::baglanti
Yamukta köşegenlerin oluşturduğu benzer üçgenler "Üçgende Benzerlik" konusunda, dörtgenin alanını üçgenlere bölme yöntemi "Üçgende Alan" konusunda anlatıldı. Dörtgenlerde bu iki konuyu birlikte kullanırsın.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İç açılar toplamı | $(n - 2) \cdot 180°$ |
| Köşegen sayısı | $\dfrac{n(n - 3)}{2}$ |
| Düzgün çokgen dış açı | $\dfrac{360°}{n}$ |
| Eşkenar dörtgen | Köşegenler dik ortalar, alan $\dfrac{e f}{2}$ |
| Dikdörtgen | Köşegenler eşit |
| Kare | Köşegen $a\sqrt{2}$ |
| Yamuk | Orta taban $\dfrac{a + c}{2}$ |

## Mini test

:::soru{cevap="B"}
İç açılarının ölçüleri toplamı 1620° olan dışbükey çokgenin kaç köşegeni vardır?

- A) 11
- B) 44
- C) 45
- D) 55
- E) 88

---

1. $(n - 2) \cdot 180° = 1620°$ ise $n - 2 = 9$ ve $n = 11$.
2. Köşegen sayısı $\dfrac{n(n - 3)}{2} = \dfrac{11 \cdot 8}{2} = 44$. Doğru cevap B.

Diğer şıklar: **11** kenar sayısı bulunmuş / **45** işlem hatasıyla bir fazla bulunmuş / **55** tüm köşe çiftleri sayılmış / **88** 2 ye bölme unutulmuş.
:::

:::soru{cevap="A"}
Düzgün bir çokgenin bir iç açısının ölçüsü, bir dış açısının ölçüsünün 5 katıdır. Buna göre bu çokgenin kaç kenarı vardır?

- A) 12
- B) 13
- C) 24
- D) 30
- E) 150

---

1. İç ve dış açı bütünlerdir: $5x + x = 180°$ ise dış açı $x = 30°$.
2. Dış açılar toplamı $360°$ olduğundan $n = \dfrac{360}{30} = 12$. Doğru cevap A.

Diğer şıklar: **13** işlem hatasıyla bir fazla bulunmuş / **24** işlem hatasıyla iki katı bulunmuş / **30** dış açının ölçüsü bulunmuş / **150** iç açının ölçüsü bulunmuş.
:::

:::soru{cevap="B"}
Tabanları 9 cm ve 15 cm, yan kenarları 5 cm olan ikizkenar yamuğun alanı kaç $\text{cm}^2$'dir?

- A) 36
- B) 48
- C) 60
- D) 96
- E) 120

---

1. Tabanların farkı $15 - 9 = 6$. İkizkenar yamukta bu fark iki yana $3$'er cm dağılır.
2. Yükseklik $\sqrt{5^2 - 3^2} = 4$ cm.
3. $A = \dfrac{(9 + 15) \cdot 4}{2} = 48$ $\text{cm}^2$. Doğru cevap B.

Diğer şıklar: **36** küçük taban ile yükseklik çarpılmış / **60** yan kenar yükseklik sanılmış / **96** 2 ye bölme unutulmuş / **120** yan kenar yükseklik sanılıp 2 ye bölme unutulmuş.
:::

:::soru{cevap="D"}
Köşegen uzunlukları 16 cm ve 30 cm olan eşkenar dörtgenin çevresi kaç cm'dir?

- A) 17
- B) 34
- C) 46
- D) 68
- E) 240

---

1. Eşkenar dörtgenin köşegenleri birbirini dik ortalar. Dik üçgenin dik kenarları $8$ ve $15$.
2. Kenar $\sqrt{8^2 + 15^2} = 17$ cm.
3. Çevre $4 \cdot 17 = 68$ cm. Doğru cevap D.

Diğer şıklar: **17** bir kenar bulunmuş / **34** iki kenarın toplamı alınmış / **46** köşegenlerin toplamı alınmış / **240** alan alınmış.
:::

## Kendini dene

:::dene
1. Düzgün beşgenin bir iç açısı kaç derecedir? => $\dfrac{3 \cdot 180}{5} = 108°$.
2. 12 kenarlı bir çokgenin köşegen sayısı kaçtır? => $\dfrac{12 \cdot 9}{2} = 54$.
3. Bir paralelkenarın komşu iki açısından biri $70°$ ise diğeri kaç derecedir? => Komşu açılar bütünler: $110°$.
4. Köşegeni $8\sqrt{2}$ olan karenin alanı kaçtır? => Kenar 8, alan 64.
5. Tabanları 8 ve 12, yüksekliği 6 olan yamuğun alanı kaçtır? => $\dfrac{20 \cdot 6}{2} = 60$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Çokgenler ve Dörtgenler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Çokgenlerde açı ve köşegen, düzgün çokgen, dörtgenler, paralelkenar, eşkenar dörtgen, dikdörtgen, kare, yamuk, deltoid. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Yamuk tanımı "en az bir çift kenarı paralel" olarak alındı. Bu durumda paralelkenar yamuğun özel hâlidir. Sorular şekilsiz.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Çokgenler ve Dörtgenler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bisiklet tekerleği, saat kadranı, bir pizza dilimi: Hepsi çember ve daire üzerine kuruludur. TYT'de çember sorularının neredeyse tamamı **açı** ve **uzunluk** ilişkilerine dayanır. Merkez açıyı çevre açıya çevirmek, teğetin yarıçapa dik olduğunu kullanmak ve dik üçgen kurmak bu konunun üç ana aracıdır. Bu konuda çemberin elemanlarını, açı ilişkilerini, teğet ve kirişlerin özelliklerini ve çevre ile alan hesaplarını öğreneceksin.

:::hedefler
1. Çemberin elemanlarını (yarıçap, çap, kiriş, yay, teğet, kesen) tanımak.
2. Merkez, çevre, iç ve dış açı ilişkilerini yay ölçüleriyle kurmak.
3. Teğetin özelliklerini ve dışarıdaki noktadan çizilen teğet uzunluklarını kullanmak.
4. Kiriş, yarıçap ve merkezden uzaklıktan dik üçgen kurmak.
5. Çemberin çevresini, dairenin ve daire diliminin alanını hesaplamak.
:::

:::ipucu
Çember sorusunda **yarıçapları çiz**. Merkezden değme noktasına, merkezden kirişin uçlarına çizdiğin yarıçaplar ikizkenar üçgenler ve dik üçgenler oluşturur. Bu üçgenler sorunun çözümüdür.
:::

## 1. Çemberin elemanları

Bir noktadan eşit uzaklıktaki noktalar kümesine **çember** denir. Bu sabit noktaya **merkez**, uzaklığa **yarıçap** ($r$) denir. Çemberin iç bölgesi ile birlikte oluşturduğu şekle **daire** denir.

- **Kiriş:** Çemberin iki noktasını birleştiren doğru parçası. **Çap** merkezden geçen kiriştir, $2r$ uzunluğundadır.
- **Yay:** Çemberin iki nokta arasındaki parçası.
- **Kesen:** Çemberi iki noktada kesen doğru.
- **Teğet:** Çembere tek noktada değen doğru.

**Çevre ve alan.** Çemberin çevresi $2\pi r$, dairenin alanı $\pi r^2$. $r = 7$ ise çevre $14\pi$, alan $49\pi$.

**Daire dilimi.** Merkez açısı $\theta$ olan dilimin yay uzunluğu $\dfrac{\theta}{360} \cdot 2\pi r$, alanı $\dfrac{\theta}{360} \cdot \pi r^2$. **Örnek.** $r = 7$ ve $\theta = 90°$ ise yay uzunluğu $\dfrac{14\pi}{4} = \dfrac{7\pi}{2}$, alan $\dfrac{49\pi}{4}$.

## 2. Çemberde açılar

![O merkezli çemberde AOB merkez açısı 2 alfa, aynı yayı gören ACB çevre açısı alfa](/lessons/tyt-mat/cember-aci.svg "Merkez açı ve çevre açı | Yolumnet")

| Açı | Köşesi | Ölçüsü |
| --- | --- | --- |
| Merkez açı | Merkezde | Gördüğü yayın ölçüsü |
| Çevre açı | Çember üzerinde | Gördüğü yayın yarısı |
| Kiriş-teğet açı | Teğetin değme noktasında | Gördüğü yayın yarısı |
| İç açı (iki kiriş kesişince) | Çemberin içinde | $\dfrac{\text{yay}_1 + \text{yay}_2}{2}$ |
| Dış açı (iki kesen, ya da teğet ve kesen) | Çemberin dışında | $\dfrac{\text{büyük yay} - \text{küçük yay}}{2}$ |

**Örnek.** Merkez açı $80°$ ise aynı yayı gören çevre açı $40°$'dir. **Çapı gören çevre açı** $180° / 2 = 90°$'dir. Aynı yayı gören bütün çevre açılar eşittir. Bir teğet ile kiriş arasındaki açı $50°$ ise gördüğü yay $100°$'dir.

**Örnek.** Çemberin içinde kesişen iki kirişin gördüğü yaylar $70°$ ve $110°$ ise aralarındaki açı $\dfrac{70 + 110}{2} = 90°$. Dışarıdaki bir noktadan çizilen iki kesenin gördüğü yaylar $130°$ ve $50°$ ise aralarındaki açı $\dfrac{130 - 50}{2} = 40°$.

## 3. Teğet ve kiriş

![O merkezli çembere dışarıdaki P noktasından T1 ve T2 noktalarında iki teğet çiziliyor. Teğetler yarıçaplara dik, PT1 ile PT2 eşit](/lessons/tyt-mat/teget-cember.svg "Dışarıdaki noktadan teğetler | Yolumnet")

**Teğet.** Teğet, değme noktasındaki yarıçapa diktir. Dışarıdaki bir noktadan çembere çizilen iki teğetin uzunlukları eşittir. **Örnek.** $\lvert PO \rvert = 13$ ve $r = 5$ ise $\lvert PT \rvert = \sqrt{13^2 - 5^2} = 12$.

**Kiriş.** Merkezden kirişe indirilen dikme kirişi ortalar. **Örnek.** $r = 10$ ve kirişin merkeze uzaklığı 6 ise kirişin yarısı $\sqrt{10^2 - 6^2} = 8$ ve kiriş 16'dır. Merkeze yakın kiriş daha uzundur. Eşit kirişler merkeze eşit uzaklıktadır.

**Kuvvet bağıntıları.**

| Durum | Bağıntı |
| --- | --- |
| Çemberin içinde kesişen iki kiriş | $\lvert PA \rvert \cdot \lvert PB \rvert = \lvert PC \rvert \cdot \lvert PD \rvert$ |
| Dışarıdan teğet ve kesen | $\lvert PT \rvert^2 = \lvert PA \rvert \cdot \lvert PB \rvert$ |

**Örnek.** İç kesişimde parçalar $4, 6$ ve $3, 8$ ise $4 \cdot 6 = 3 \cdot 8 = 24$. Dışarıdan: $\lvert PT \rvert = 6$, kesen $\lvert PA \rvert = 4$ ve $\lvert PB \rvert = 9$ ise $36 = 4 \cdot 9$.

## 4. Dik üçgenin iç teğet çemberi

Bir dik üçgenin dik kenarları $a$ ve $b$, hipotenüsü $c$ ise iç teğet çemberin yarıçapı

$$r = \frac{a + b - c}{2}$$

**Örnek.** Kenarları 6, 8, 10 olan üçgende $r = \dfrac{6 + 8 - 10}{2} = 2$.

:::ipucu{baslik="Sık yapılan hata"}
**Merkez açı ile çevre açıyı karıştırmak** en sık yapılan hatadır. Köşe merkezdeyse açı yayın tamamı, köşe çember üzerindeyse yayın yarısıdır. Bir de **büyük yay** ve **küçük yay** ayrımı vardır: C noktası küçük yay üzerindeyse çevre açı $180°$ eksiğidir. Yay seçilmeden açı yazılmaz.
:::

:::baglanti
Çember sorularında özel üçgenler ve Pisagor sürekli kullanılır: Merkezden değme noktasına çizilen yarıçap dik üçgen oluşturur. "Analitik Geometri" konusunda çemberin denklemi bu uzunluk bağıntısından çıkar.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çevre, alan | $2\pi r$ ve $\pi r^2$ |
| Daire dilimi | $\dfrac{\theta}{360}$ oranıyla |
| Çevre açı | Yayın yarısı |
| Teğet | Yarıçapa dik, uzunlukları eşit |
| Kiriş | Merkezden dikme ortalar |
| Kuvvet | Çarpımlar eşit |
| Dik üçgende iç teğet | $r = \dfrac{a + b - c}{2}$ |

## Mini test

:::soru{cevap="C"}
O merkezli çemberde [AB] bir kiriş, C noktası da büyük yay üzerinde bir noktadır. $m(\widehat{OAB}) = 25°$ olduğuna göre $m(\widehat{ACB})$ kaç derecedir?

- A) 25
- B) 50
- C) 65
- D) 115
- E) 130

---

1. $\lvert OA \rvert = \lvert OB \rvert$ olduğundan OAB ikizkenardır. $m(\widehat{OBA}) = 25°$.
2. $m(\widehat{AOB}) = 180° - 50° = 130°$.
3. C büyük yay üzerinde olduğundan çevre açı merkez açının yarısıdır: $m(\widehat{ACB}) = 65°$. Doğru cevap C.

Diğer şıklar: **25** verilen açı alınmış / **50** verilen açının iki katı alınmış / **115** C küçük yay üzerindeymiş gibi $180° - 65°$ alınmış / **130** merkez açı alınmış.
:::

:::soru{cevap="D"}
Yarıçapı 6 cm olan O merkezli çemberin dışındaki P noktası için $\lvert PO \rvert = 10$ cm'dir. [PT] çembere T noktasında teğet olduğuna göre $\lvert PT \rvert$ kaç cm'dir?

- A) 4
- B) 6
- C) 7
- D) 8
- E) 10

---

1. Teğet, değme noktasındaki yarıçapa diktir: $[OT] \perp [PT]$.
2. OTP dik üçgeninde $\lvert PT \rvert = \sqrt{10^2 - 6^2} = 8$ cm (6, 8, 10 üçlüsü). Doğru cevap D.

Diğer şıklar: **4** $\lvert PO \rvert - r$ alınmış / **6** yarıçap alınmış / **7** işlem hatasıyla bir eksik bulunmuş / **10** $\lvert PO \rvert$ alınmış.
:::

:::soru{cevap="A"}
Yarıçapı 13 cm olan bir çemberde uzunluğu 24 cm olan kirişin merkeze uzaklığı kaç cm'dir?

- A) 5
- B) 6
- C) 12
- D) 13
- E) 25

---

1. Merkezden kirişe inen dikme kirişi ortalar: yarım kiriş 12 cm.
2. Yarıçap hipotenüs olan dik üçgende $d = \sqrt{13^2 - 12^2} = 5$ cm. Doğru cevap A.

Diğer şıklar: **6** işlem hatasıyla bir fazla bulunmuş / **12** kirişin yarısı alınmış / **13** yarıçap alınmış / **25** yarıçap ile kirişin yarısı toplanmış.
:::

:::soru{cevap="D"}
Yarıçapı 12 cm olan bir dairede merkez açısı $150°$ olan daire diliminin alanı kaç $\text{cm}^2$'dir?

- A) $10\pi$
- B) $24\pi$
- C) $30\pi$
- D) $60\pi$
- E) $72\pi$

---

1. Daire diliminin alanı $\dfrac{\theta}{360} \cdot \pi r^2$.
2. $\dfrac{150}{360} \cdot \pi \cdot 12^2 = \dfrac{5}{12} \cdot 144\pi = 60\pi$ $\text{cm}^2$. Doğru cevap D.

Diğer şıklar: **$10\pi$** yay uzunluğu bulunmuş / **$24\pi$** çemberin çevresi alınmış / **$30\pi$** dilimin alanı yarıya bölünmüş / **$72\pi$** merkez açı $180°$ alınmış.
:::

## Kendini dene

:::dene
1. Çapı 14 olan çemberin çevresi kaç $\pi$'dir? => $2\pi r = 14\pi$.
2. Merkez açısı $100°$ olan yayı gören çevre açı kaç derecedir? => $50°$.
3. Yarıçapı 17 olan çemberde merkeze uzaklığı 8 olan kirişin uzunluğu kaçtır? => Yarım kiriş $\sqrt{289 - 64} = 15$, kiriş 30.
4. Dış noktadan teğet uzunluğu 12, merkeze uzaklık 13 ise yarıçap kaçtır? => $\sqrt{169 - 144} = 5$.
5. Yarıçapı 6 olan daire diliminin merkez açısı $60°$ ise alanı kaç $\pi$'dir? => $\dfrac{60}{360} \cdot 36\pi = 6\pi$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Çember ve Daire'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Çember ve daire elemanları, merkez ve çevre açı, kiriş-teğet açı, iç ve dış açı, teğet ve kiriş özellikleri, kuvvet bağıntıları, dik üçgenin iç teğet çemberi, çevre, alan, daire dilimi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sorular şekilsiz. Dış açı için büyük yay eksi küçük yay formülü iki kesen ve teğet-kesen durumlarına birlikte uygulandı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Çember ve Daire'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Telefondaki harita iki konum arasındaki mesafeyi, yolun eğimini ve hedefe en kısa yolu hesaplar. Bunun arkasında her konumun bir **koordinat çifti** olması ve geometrinin sayılarla yapılabilmesi vardır. Analitik geometri, şekilleri çizmek yerine nokta ve denklemlerle çözmektir. TYT'de bu konunun soruları dört araca dayanır: İki nokta arası uzaklık, orta nokta, eğim ve doğru denklemi.

:::hedefler
1. Koordinat düzleminde noktaları yerleştirmek ve iki nokta arasındaki uzaklığı bulmak.
2. Orta nokta ve üçgenin ağırlık merkezinin koordinatlarını hesaplamak.
3. İki noktadan geçen doğrunun eğimini ve denklemini bulmak.
4. Paralel ve dik doğruların eğim ilişkilerini kullanmak.
5. Doğrunun eksenleri kestiği noktaları bulmak ve alan hesaplamak.
:::

:::ipucu
Analitik geometri sorusunu **şekil çizerek** başlat. Noktaları işaretle, aralarında dik üçgen kur, sonra formülü kullan. Şekil yoksa işaret hatası çok olur.
:::

## 1. İki nokta arasındaki uzaklık ve orta nokta

Koordinat düzleminde $A(x_1, y_1)$ ve $B(x_2, y_2)$ noktaları verilsin. Yatay uzaklık $\lvert x_2 - x_1 \rvert$, dikey uzaklık $\lvert y_2 - y_1 \rvert$ olan dik üçgenin hipotenüsü $\lvert AB \rvert$'dir:

$$\lvert AB \rvert = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$

![Koordinat düzleminde A(1, 2) ve B(7, 10) noktaları. Yatay uzaklık 6, dikey uzaklık 8, AB uzunluğu 10 ve orta nokta M(4, 6)](/lessons/tyt-mat/iki-nokta-uzaklik.svg "İki nokta arası uzaklık | Yolumnet")

**Orta nokta.** $[AB]$'nin orta noktası $M$ ise

$$M\left(\frac{x_1 + x_2}{2}, \frac{y_1 + y_2}{2}\right)$$

**Örnek.** $A(1, 2)$ ve $B(7, 10)$ için $\lvert AB \rvert = \sqrt{36 + 64} = 10$ ve $M(4, 6)$. $A(2, -1)$ ve $B(5, 3)$ için $\lvert AB \rvert = \sqrt{9 + 16} = 5$.

**Ağırlık merkezi.** Köşeleri $A(x_1, y_1)$, $B(x_2, y_2)$, $C(x_3, y_3)$ olan üçgenin ağırlık merkezi

$$G\left(\frac{x_1 + x_2 + x_3}{3}, \frac{y_1 + y_2 + y_3}{3}\right)$$

**Örnek.** $A(1, 2)$, $B(7, 10)$, $C(4, -3)$ için $G\left(\dfrac{12}{3}, \dfrac{9}{3}\right) = G(4, 3)$.

## 2. Eğim ve doğru denklemi

**Eğim.** Doğru, $x$ ekseninin pozitif yönüyle $\alpha$ açısı yapıyorsa eğimi $m = \tan\alpha$'dır. $A(x_1, y_1)$ ve $B(x_2, y_2)$ noktalarından geçen doğrunun eğimi

$$m = \frac{y_2 - y_1}{x_2 - x_1}$$

**Örnek.** $A(1, 2)$ ve $B(7, 10)$ için $m = \dfrac{8}{6} = \dfrac{4}{3}$.

| Eğim | Doğrunun durumu |
| --- | --- |
| $m > 0$ | Sağa doğru yükselir |
| $m < 0$ | Sağa doğru alçalır |
| $m = 0$ | $x$ eksenine paralel ($y = \text{sabit}$) |
| Tanımsız | $y$ eksenine paralel ($x = \text{sabit}$) |

**Doğru denklemi.** Eğimi $m$, $y$ eksenini $(0, n)$ noktasında kesen doğrunun denklemi $y = mx + n$'dir. Eğimi $m$ ve $(x_1, y_1)$ noktasından geçen doğrunun denklemi $y - y_1 = m(x - x_1)$'dir.

**Örnek.** $A(1, 2)$ ve $B(3, 8)$ noktalarından geçen doğru için $m = \dfrac{6}{2} = 3$ ve $y - 2 = 3(x - 1)$, yani $y = 3x - 1$. Kontrol: $x = 3$ için $y = 8$.

**Genel biçim.** $ax + by + c = 0$ doğrusunda eğim $m = -\dfrac{a}{b}$ ve eksenleri kesen noktalar $x = -\dfrac{c}{a}$, $y = -\dfrac{c}{b}$'dir. Bu nedenle bir doğrunun eksenleri kestiği noktaları bulmak için $y = 0$ ve $x = 0$ yazılır.

## Eğimi gör

Aşağıdaki çizimde eğimi ve $y$ eksenini kestiği noktayı değiştir. Eğim büyüdükçe doğru dikleşir, negatif olunca alçalır.

::sim{tur="dogru"}

## 3. Paralel ve dik doğrular

| Durum | Eğim ilişkisi |
| --- | --- |
| Paralel doğrular | $m_1 = m_2$ |
| Dik doğrular | $m_1 \cdot m_2 = -1$ |

**Örnek.** $y = 2x + 1$ doğrusuna paralel doğruların eğimi 2'dir. Dik doğruların eğimi $-\dfrac{1}{2}$'dir. $2x - y + 5 = 0$ doğrusu $y = 2x + 5$ biçimine gelir ve eğimi 2 olduğundan $y = 2x + 1$ ile paraleldir.

**Eksenlerle üçgen.** $3x + 4y = 12$ doğrusu eksenleri $(4, 0)$ ve $(0, 3)$ noktalarında keser. Eksenlerle oluşan dik üçgenin dik kenarları 4 ve 3, alanı $\dfrac{4 \cdot 3}{2} = 6$'dır.

:::ipucu{baslik="Sık yapılan hata"}
**İşaret hatası** bu konunun ana sorunudur. Eğim hesaplarken pay ve paydada çıkarmayı **aynı sırayla** yap: $\dfrac{y_2 - y_1}{x_2 - x_1}$. Pay için $B - A$, payda için $A - B$ yazarsan eğimin işareti ters çıkar. Uzaklık formülünde ise kare alındığı için sıra önemli değildir. Orta noktada çıkarma değil, toplama yapıldığını da unutma.
:::

:::baglanti
Uzaklık formülü, "Özel Üçgenler" konusundaki Pisagor bağıntısından başka bir şey değildir. Eğim, "Fonksiyonlar" konusundaki doğrusal fonksiyonun $x$ katsayısıdır ve "Denklem Çözme" konusunda iki bilinmeyenli denklem sistemlerinin neden bir noktada kesiştiği bu konuyla anlaşılır: Kesişim, iki doğrunun ortak noktasıdır.
:::

## 4. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Uzaklık | $\sqrt{(\Delta x)^2 + (\Delta y)^2}$ |
| Orta nokta | Koordinatların ortalaması |
| Ağırlık merkezi | Üç koordinatın ortalaması |
| Eğim | $\dfrac{\Delta y}{\Delta x}$ |
| Doğru denklemi | $y - y_1 = m(x - x_1)$ |
| Paralel | $m_1 = m_2$ |
| Dik | $m_1 m_2 = -1$ |

## Mini test

:::soru{cevap="A"}
Analitik düzlemde $A(-3, -2)$ ve $B(2, 10)$ noktaları veriliyor. $\lvert AB \rvert$ uzunluğu kaç birimdir?

- A) 13
- B) 14
- C) 17
- D) 60
- E) 169

---

1. Yatay uzaklık $2 - (-3) = 5$, dikey uzaklık $10 - (-2) = 12$.
2. $\lvert AB \rvert = \sqrt{5^2 + 12^2} = \sqrt{169} = 13$ birim. Doğru cevap A.

Diğer şıklar: **14** işlem hatasıyla bir fazla bulunmuş / **17** yatay ve dikey uzaklıklar toplanmış / **60** yatay ve dikey uzaklıklar çarpılmış / **169** karekök alınmamış.
:::

:::soru{cevap="B"}
Analitik düzlemde $A(-1, 5)$ ve $B(3, -3)$ noktalarından geçen doğrunun eğimi kaçtır?

- A) -4
- B) -2
- C) $-\dfrac{1}{2}$
- D) $\dfrac{1}{2}$
- E) 2

---

1. $m = \dfrac{y_2 - y_1}{x_2 - x_1} = \dfrac{-3 - 5}{3 - (-1)}$.
2. $m = \dfrac{-8}{4} = -2$. Doğru cevap B.

Diğer şıklar: **-4** $x$ koordinatlarının farkı yarıya bölünmüş / **$-\dfrac{1}{2}$** pay ile payda yer değiştirmiş / **$\dfrac{1}{2}$** pay ile payda yer değiştirip işaret hatası yapılmış / **2** işaret hatası yapılmış.
:::

:::soru{cevap="E"}
$y = 3x - 5$ doğrusuna dik olan ve $A(6, 1)$ noktasından geçen doğrunun $y$ eksenini kestiği nokta aşağıdakilerden hangisidir?

- A) $(0, 1)$
- B) $(0, 2)$
- C) $(0, -1)$
- D) $(0, -17)$
- E) $(0, 3)$

---

1. Dik doğruların eğimleri çarpımı $-1$ olduğundan $m = -\dfrac{1}{3}$.
2. $y - 1 = -\dfrac{1}{3}(x - 6)$ ise $y = -\dfrac{x}{3} + 3$.
3. $x = 0$ için $y = 3$. Kesim noktası $(0, 3)$. Doğru cevap E.

Diğer şıklar: **$(0, 1)$** $A$ noktasının ordinatı alınmış / **$(0, 2)$** denklemde $y_1$ eklemesi unutulmuş / **$(0, -1)$** eğim $\dfrac{1}{3}$ alınmış / **$(0, -17)$** eğim 3 alınmış, doğru paralel sanılmış.
:::

:::soru{cevap="E"}
$3x + 4y - 24 = 0$ doğrusunun koordinat eksenleriyle oluşturduğu üçgenin alanı kaç birimkaredir?

- A) 10
- B) 12
- C) 14
- D) 23
- E) 24

---

1. $y = 0$ için $3x = 24$ ve $x = 8$. $x = 0$ için $4y = 24$ ve $y = 6$.
2. Dik kenarları 8 ve 6 olan üçgenin alanı $\dfrac{8 \cdot 6}{2} = 24$. Doğru cevap E.

Diğer şıklar: **10** hipotenüsün uzunluğu alınmış / **12** çarpım 4 e bölünmüş / **14** kesim noktalarının toplamı alınmış / **23** işlem hatasıyla bir eksik bulunmuş.
:::

## Kendini dene

:::dene
1. $A(1, 1)$ ve $B(4, 5)$ noktaları arasındaki uzaklık kaçtır? => $\sqrt{9 + 16} = 5$.
2. $A(-2, 6)$ ve $B(4, 0)$ noktalarının orta noktası nedir? => $(1, 3)$.
3. $A(0, 1)$ ve $B(2, 7)$ noktalarından geçen doğrunun eğimi kaçtır? => $\dfrac{6}{2} = 3$.
4. Eğimi $-2$ olan ve $(1, 4)$ noktasından geçen doğrunun denklemi nedir? => $y - 4 = -2(x - 1)$, yani $y = -2x + 6$.
5. $y = 4x - 3$ doğrusuna dik olan bir doğrunun eğimi kaçtır? => $-\dfrac{1}{4}$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Analitik Geometri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Koordinat düzlemi, iki nokta arası uzaklık, orta nokta, ağırlık merkezi, eğim, doğru denklemi, paralel ve dik doğrular, eksen kesim noktaları. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekil özgündür. Sayılar python ile doğrulandı. "Eğimi gör" bölümü uygulamadaki doğru simülasyonunu kullanır.
Kontrol edilecekler: Noktanın doğruya uzaklığı ve çember denklemi AYT konusu olduğundan alınmadı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Analitik Geometri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir su deposunun kaç litre aldığı, bir kutuyu kaplamak için gereken kâğıt, bir koni biçimli külahın dondurma miktarı. Hepsi **hacim** ve **yüzey alanı** sorusudur. TYT'de katı cisim sorularında genellikle bir cismin ölçüleri verilir ve hacmi ya da alanı istenir. Çoğu soruda bir cisim başka bir cisme **dönüştürülür** ve hacim sabit kalır. Bu konuda prizmaları, silindiri, koniyi, küreyi, piramidi ve hacim korunumunu öğreneceksin.

:::hedefler
1. Küp ve dikdörtgenler prizmasının hacim, alan ve köşegenini hesaplamak.
2. Silindirin hacmini, yanal ve toplam alanını hesaplamak.
3. Koninin hacmini, yanal ve toplam alanını hesaplamak.
4. Kürenin ve piramidin hacmini ve alanını hesaplamak.
5. Bir cisim başka bir cisme dönüştürüldüğünde hacmin korunmasını kullanmak.
:::

:::ipucu
Hacim sorularında **birim tutarlılığına** dikkat et. 1 litre, 1000 cm³'tür. Uzunluklar cm ise hacim cm³, alan cm² olur. Cevabı istenen birime çevirmek, son adımdır.
:::

## 1. Prizmalar

Tabanları paralel ve eş çokgen olan, yan yüzleri dikdörtgen olan cisimlere **dik prizma** denir. Hacim, **taban alanı × yükseklik**'tir.

**Küp.** Ayrıtı $a$ ise $V = a^3$, yüzey alanı $A = 6a^2$, köşegeni $d = a\sqrt{3}$. **Örnek.** $a = 4$ ise $V = 64$, $A = 6 \cdot 16 = 96$, $d = 4\sqrt{3}$.

![Dikdörtgenler prizması: boyutlar a, b, c ve cisim köşegeni d. Hacim abc, köşegen a kare artı b kare artı c karenin karekökü](/lessons/tyt-mat/dikdortgenler-prizmasi.svg "Dikdörtgenler prizması | Yolumnet")

**Dikdörtgenler prizması.** Boyutları $a$, $b$, $c$ ise

$$V = a \cdot b \cdot c, \qquad A = 2(ab + bc + ac), \qquad d = \sqrt{a^2 + b^2 + c^2}$$

**Örnek.** Boyutları 3, 4 ve 12 olan prizmanın hacmi 144, yüzey alanı $2(12 + 48 + 36) = 192$ ve köşegeni $\sqrt{9 + 16 + 144} = 13$'tür.

## 2. Silindir, koni ve küre

![Silindir, koni ve kürenin çizimleri ve hacim formülleri](/lessons/tyt-mat/kati-cisimler.svg "Silindir, koni, küre | Yolumnet")

| Cisim | Hacim | Yanal alan | Toplam alan |
| --- | --- | --- | --- |
| Silindir | $\pi r^2 h$ | $2\pi r h$ | $2\pi r(r + h)$ |
| Koni | $\dfrac{1}{3}\pi r^2 h$ | $\pi r l$ | $\pi r(r + l)$ |
| Küre | $\dfrac{4}{3}\pi r^3$ | Yok | $4\pi r^2$ |

Koninin **ana doğrusu** $l$, yükseklik $h$ ve taban yarıçapı $r$ ile $l^2 = r^2 + h^2$ bağıntısındadır.

**Örnek (silindir).** $r = 3$ ve $h = 10$ ise $V = 90\pi$, yanal alan $60\pi$, toplam alan $60\pi + 2 \cdot 9\pi = 78\pi$.

**Örnek (koni).** $r = 3$ ve $h = 4$ ise $l = 5$, $V = \dfrac{1}{3}\pi \cdot 9 \cdot 4 = 12\pi$, yanal alan $15\pi$, toplam alan $24\pi$.

**Örnek (küre).** $r = 6$ ise $V = \dfrac{4}{3}\pi \cdot 216 = 288\pi$ ve alan $4\pi \cdot 36 = 144\pi$.

## 3. Piramit

Tabanı çokgen, yan yüzleri bir noktada birleşen üçgen olan cisme **piramit** denir. Hacmi

$$V = \frac{1}{3} \cdot \text{taban alanı} \cdot h$$

**Örnek.** Tabanı kenarı 6 olan kare, yüksekliği 4 olan dik piramitte $V = \dfrac{36 \cdot 4}{3} = 48$. Yan yüzün yüksekliği, tabanın merkezinden kenara uzaklık 3 ve yükseklik 4 olduğundan $\sqrt{9 + 16} = 5$. Yanal alan $4 \cdot \dfrac{6 \cdot 5}{2} = 60$.

## 4. Hacim korunumu

Bir cisim eritilip başka bir cisim yapılırsa, bir kaptan diğerine sıvı boşaltılırsa ya da bir cisim suya batırılırsa **hacim korunur**. Bu sorularda iki hacim eşitlenir.

**Örnek.** Taban yarıçapı 4 olan silindirde 9 cm yüksekliğinde su var. Bu su, taban yarıçapı 6 olan boş bir silindire boşaltılırsa yükseklik $h$ olsun: $\pi \cdot 16 \cdot 9 = \pi \cdot 36 \cdot h$ ve $h = 4$.

**Benzer cisimlerde.** Boyutlar $k$ kat artarsa alan $k^2$, hacim $k^3$ katına çıkar.

:::ipucu{baslik="Sık yapılan hata"}
Silindirde **hacim** formülündeki $r$ kare alınır, **yanal alan** formülünde kare alınmaz. Koninin hacmindeki $\dfrac{1}{3}$ çarpanı unutulabilir. Kürenin hacmi $r^3$, yüzey alanı $r^2$ içerir. Koninin hacminde **yükseklik** $h$, yanal alanında **ana doğru** $l$ kullanılır, ikisini karıştırmak sık yapılan bir hatadır.
:::

:::baglanti
Bu konudaki hacim ve alan oranları "Üçgende Benzerlik" konusundaki $k$, $k^2$, $k^3$ kuralının devamıdır. Katı cisimlerin kesitleri de yine daire, dikdörtgen ve üçgen gibi düzlem şekillerdir: Önceki geometri konularının hepsi burada geri döner.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Prizma hacmi | Taban alanı $\times$ yükseklik |
| Dikdörtgenler prizması köşegeni | $\sqrt{a^2 + b^2 + c^2}$ |
| Silindir | $V = \pi r^2 h$ |
| Koni | $V = \dfrac{1}{3}\pi r^2 h$, $l^2 = r^2 + h^2$ |
| Küre | $\dfrac{4}{3}\pi r^3$ ve $4\pi r^2$ |
| Piramit | $\dfrac{1}{3}$ taban $\times$ yükseklik |
| Hacim korunumu | İki hacmi eşitle |

## Mini test

:::soru{cevap="A"}
Boyutları 4 cm, 5 cm ve 20 cm olan dikdörtgenler prizmasının bir köşesinden, bu köşenin karşısındaki köşeye çizilen cisim köşegeninin uzunluğu kaç cm'dir?

- A) 21
- B) 22
- C) 29
- D) 41
- E) 441

---

1. $d = \sqrt{a^2 + b^2 + c^2} = \sqrt{16 + 25 + 400}$.
2. $\sqrt{441} = 21$ cm. Doğru cevap A.

Diğer şıklar: **22** işlem hatasıyla bir fazla bulunmuş / **29** üç boyut toplanmış / **41** yalnızca $a^2 + b^2$ toplanmış / **441** karekök alınmamış.
:::

:::soru{cevap="A"}
Taban yarıçapı 4 cm olan silindir biçimindeki bir kapta 9 cm yüksekliğinde su vardır. Bu suyun tamamı taban yarıçapı 6 cm olan boş bir silindire boşaltılırsa yükseklik kaç cm olur?

- A) 4
- B) 6
- C) 9
- D) 16
- E) 36

---

1. Su hacmi korunur: $\pi \cdot 4^2 \cdot 9 = \pi \cdot 6^2 \cdot h$.
2. $144 = 36h$ ve $h = 4$ cm. Doğru cevap A.

Diğer şıklar: **6** yarıçap oranı kare alınmadan kullanılmış / **9** yüksekliğin değişmediği sanılmış / **16** küçük yarıçapın karesi alınmış / **36** büyük yarıçapın karesi alınmış.
:::

:::soru{cevap="E"}
Yüksekliği 12 cm, taban yarıçapı 5 cm olan dik dairesel koninin yanal alanı kaç $\text{cm}^2$'dir?

- A) $25\pi$
- B) 32
- C) $60\pi$
- D) 64
- E) $65\pi$

---

1. Ana doğru $l = \sqrt{5^2 + 12^2} = 13$ cm.
2. Yanal alan $\pi r l = \pi \cdot 5 \cdot 13 = 65\pi$ $\text{cm}^2$. Doğru cevap E.

Diğer şıklar: **$25\pi$** taban alanı alınmış / **32** işlem hatasıyla yarısı bulunmuş / **$60\pi$** yarıçap ile yükseklik çarpılmış / **64** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="A"}
Yarıçapı 3 cm olan 8 tane özdeş metal küre eritilerek tek bir küre yapılıyor. Oluşan kürenin yarıçapı kaç cm'dir?

- A) 6
- B) 7
- C) 9
- D) 12
- E) 24

---

1. Hacim korunur: $8 \cdot \dfrac{4}{3}\pi \cdot 3^3 = \dfrac{4}{3}\pi R^3$.
2. $8 \cdot 27 = R^3$ ise $R^3 = 216$ ve $R = 6$ cm. Doğru cevap A.

Diğer şıklar: **7** işlem hatasıyla bir fazla bulunmuş / **9** yarıçap 3 ile çarpılmış / **12** yarıçapların toplamının yarısı alınmış / **24** sekiz kürenin yarıçapları toplanmış.
:::

## Kendini dene

:::dene
1. Ayrıtı 5 olan küpün yüzey alanı kaçtır? => $6 \cdot 25 = 150$.
2. Boyutları 2, 3 ve 6 olan dikdörtgenler prizmasının köşegeni kaçtır? => $\sqrt{4 + 9 + 36} = 7$.
3. Yarıçapı 2, yüksekliği 5 olan silindirin hacmi kaç $\pi$'dir? => $\pi \cdot 4 \cdot 5 = 20\pi$.
4. Yarıçapı 6, yüksekliği 8 olan koninin ana doğrusu kaçtır? => $\sqrt{36 + 64} = 10$.
5. 2 litre kaç $\text{cm}^3$'tür? => 2000.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Katı Cisimler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Prizma, küp, dikdörtgenler prizması, silindir, koni, küre, piramit, hacim ve yüzey alanı, hacim korunumu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve şekiller özgündür. Sayılar python ile doğrulandı.
Kontrol edilecekler: Sorular şekilsiz. Kesik koni ve kesik piramit alınmadı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Katı Cisimler'
on conflict (topic_id) do nothing;
