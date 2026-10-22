-- TYT Temel Matematik konu anlatımları (b). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Problem çözmenin ilk adımı, sorudaki Türkçe cümleyi matematiğe çevirmektir. "Bir sayının 3 katının 5 fazlası" ifadesini $3x + 5$ yazabildiğin anda problem denkleme dönüşür ve geri kalanı denklem çözmedir. Bu konuda **cümleyi denkleme çevirmeyi**, kesirli ifadelerle çalışmayı ve ardışık sayı ile rakam problemlerini öğreneceksin.

:::hedefler
1. Günlük dildeki ifadeleri cebirsel ifadeye çevirmek.
2. Sayı problemlerini denklem kurarak çözmek.
3. Bir bütünün kesirli parçalarının art arda alındığı problemleri çözmek.
4. Ardışık sayı ve rakam problemlerinde bilinmeyen seçimi yapmak.
5. Çözümü soruyla karşılaştırarak kontrol etmek.
:::

:::ipucu
Problemi üç adımda çöz. **1)** Bilinmeyeni belirle ve bir harf ver. **2)** Cümleleri sırayla matematiğe çevir. **3)** Bulduğun değeri soruda yerine koy ve gerçekten doğru çıkıp çıkmadığına bak. Üçüncü adım, "soruyu yanlış okuma" hatalarını yakalar.
:::

## 1. Cümleden ifadeye

Aşağıdaki çeviri tablosu, bu konunun yarısıdır.

| Sözel ifade | Matematik |
| --- | --- |
| bir sayı | $x$ |
| sayının 3 katı | $3x$ |
| sayının 5 fazlası | $x + 5$ |
| sayının 5 eksiği | $x - 5$ |
| sayının 3 katının 5 fazlası | $3x + 5$ |
| sayının 5 fazlasının 3 katı | $3(x + 5)$ |
| sayının yarısı | $\dfrac{x}{2}$ |
| sayının $\dfrac{2}{3}$'ü | $\dfrac{2}{3}x$ |
| iki sayının toplamı | $a + b$ |
| iki sayının toplamının karesi | $(a + b)^2$ |
| iki sayının karelerinin toplamı | $a^2 + b^2$ |
| "...kadar fazla" | $a = b + (\text{fark})$ |

"Katı" ifadesi **çarpmayı**, "fazlası ve eksiği" **toplama ve çıkarmayı** gösterir. Sıra önemlidir: "3 katının 5 fazlası" ile "5 fazlasının 3 katı" farklı ifadelerdir.

## 2. Sayı problemleri

**Örnek.** Bir sayının 4 katının 6 fazlası, aynı sayının 7 katının 12 eksiğine eşittir. Bu sayı kaçtır?

$$4x + 6 = 7x - 12 \Rightarrow 18 = 3x \Rightarrow x = 6$$

Kontrol: $4 \cdot 6 + 6 = 30$ ve $7 \cdot 6 - 12 = 30$.

**Örnek.** Bir sayının yarısı ile üçte birinin toplamı, dörtte birinin 7 fazlasına eşittir.

$$\dfrac{x}{2} + \dfrac{x}{3} = \dfrac{x}{4} + 7$$

Paydaların EKOK'u 12 ile çarp: $6x + 4x = 3x + 84$ ve $7x = 84$, $x = 12$.

## 3. Kesirli parçalar

Bir bütünün **önce bir kısmı alınıp**, sonra **kalanın** bir kısmı alınıyorsa her adımda kalan miktara bak.

**Örnek.** Bir kitabın önce $\dfrac{1}{4}$'ü, sonra kalanın $\dfrac{1}{3}$'ü okunuyor. Geriye 90 sayfa kaldığına göre kitap kaç sayfadır?

- İlk okumadan sonra kalan: $1 - \dfrac{1}{4} = \dfrac{3}{4}$.
- İkinci okumada kalanın $\dfrac{1}{3}$'ü okunur, geriye $\dfrac{2}{3}$'ü kalır. Toplam kalan: $\dfrac{3}{4} \cdot \dfrac{2}{3} = \dfrac{1}{2}$.
- Kitabın yarısı 90 sayfa ise kitap $90 \cdot 2 = 180$ sayfadır.

Kontrol: $180 \cdot \dfrac{1}{4} = 45$ sayfa okundu, kalan 135. 135'in $\dfrac{1}{3}$'ü 45 okundu, kalan 90. Doğru.

:::baglanti
Burada "kalanın bir kısmı" ifadesi **çarpmayla** ilerlemeyi gerektirir: $\dfrac{3}{4} \cdot \dfrac{2}{3}$. Aynı mantığı "Yüzde Problemleri" konusunda art arda indirimlerde de kullanacaksın.
:::

:::ipucu{baslik="Sık yapılan hata"}
"Önce $\dfrac{1}{4}$'ü, sonra $\dfrac{1}{3}$'ü okundu" cümlesini $\dfrac{1}{4} + \dfrac{1}{3}$ toplamı gibi işlemek yaygın bir hatadır. İkinci kesir **kalan** miktarın kesridir, bütünün değil. Cümlede "kalanın" ya da "geri kalanın" kelimesine dikkat et.
:::

## 4. Ardışık sayı problemleri

Ardışık sayıları $n, n+1, n+2, \ldots$ olarak yaz. Ardışık çift ya da tek sayılarda fark 2'dir. Toplamı verilirse **ortadaki sayıyı** $x$ almak işi kolaylaştırır.

**Örnek.** Ardışık iki tek sayının kareleri farkı 48'dir. Bu sayıların toplamı kaçtır?

$a$ ve $a + 2$ olsun. İki kare farkı: $(a + 2)^2 - a^2 = (a + 2 - a)(a + 2 + a) = 2(2a + 2) = 48$ olur. $2a + 2 = 24$ ve $a = 11$. Sayılar 11 ve 13, toplamları 24.

Daha da kısa: İki ardışık tek sayıda $(x - y)(x + y) = 2 \cdot (x + y) = 48$ olduğundan $x + y = 24$.

## 5. Rakam problemleri

$\overline{ab}$ iki basamaklı sayısı $10a + b$ demektir. Sayının rakamları yer değiştirirse $10b + a$ olur. Bu konuyu "Sayı Basamakları"ndan hatırla.

**Örnek.** İki basamaklı bir sayının rakamları yer değiştirince sayı 18 artıyor. Bu koşulu sağlayan sayılar nedir?

$(10b + a) - (10a + b) = 9(b - a) = 18$ olduğundan $b - a = 2$. Sayılar 13, 24, 35, 46, 57, 68 ve 79'dur.

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| "katı" | Çarpma |
| "fazlası, eksiği" | Toplama, çıkarma |
| "kalanın..." | Kalan miktarın kesri, çarpma |
| Ardışık sayı | $x - 1, x, x + 1$ ya da $n, n+1, n+2$ |
| İki basamaklı sayı | $10a + b$ |
| Kontrol | Bulunan değeri soruda yerine koy |

## Mini test

:::soru{cevap="D"}
Bir sayının 5 katının 9 fazlası, aynı sayının 8 katının 6 eksiğine eşittir. Buna göre bu sayı kaçtır?

- A) 1
- B) 3
- C) 4
- D) 5
- E) 15

---

1. Denklem kurulur: $5x + 9 = 8x - 6$.
2. $x$ terimleri bir tarafa, sayılar diğer tarafa alınır: $15 = 3x$ ve $x = 5$.
3. Kontrol: $5 \cdot 5 + 9 = 34 = 8 \cdot 5 - 6$. Doğru cevap D.

Diğer şıklar: **1** $5x - 9 = 8x - 6$ kurulmuş (9 fazlası yerine eksiği alınmış) / **3** $3x = 15$ denklemindeki katsayı sonuç sanılmış / **4** işlem hatasıyla bir eksik bulunmuş / **15** $3x = 15$ değeri sonuç sanılmış.
:::

:::soru{cevap="D"}
Bir yolun önce $\dfrac{2}{5}$'i, sonra kalanın $\dfrac{1}{4}$'ü asfaltlanmıştır. Asfaltlanmayan 90 km yol kaldığına göre yolun tamamı kaç km'dir?

- A) 120
- B) 150
- C) 199
- D) 200
- E) 360

---

1. İlk asfaltlamadan sonra kalan $\dfrac{3}{5}$'tir.
2. İkinci aşamada kalanın $\dfrac{1}{4}$'ü asfaltlanır, geriye $\dfrac{3}{4}$'ü kalır. Toplam kalan $\dfrac{3}{5} \cdot \dfrac{3}{4} = \dfrac{9}{20}$.
3. Yolun $\dfrac{9}{20}$'si 90 km ise tamamı $90 \cdot \dfrac{20}{9} = 200$ km'dir. Doğru cevap D.

Diğer şıklar: **120** kalan $\frac{3}{4}$ sanılmış / **150** kalan $\frac{3}{5}$ sanılmış / **199** işlem hatasıyla bir eksik bulunmuş / **360** kalan $\frac{1}{4}$ sanılmış.
:::

:::soru{cevap="D"}
Ardışık iki çift sayının kareleri farkı 100 olduğuna göre bu iki sayının toplamı kaçtır?

- A) 24
- B) 25
- C) 26
- D) 50
- E) 100

---

1. Sayılar $a$ ve $a + 2$ olsun. $(a + 2)^2 - a^2 = 2(2a + 2) = 100$.
2. $2a + 2 = 50$ ve $a = 24$. Sayılar 24 ve 26.
3. Toplamları $24 + 26 = 50$ olur. Doğru cevap D.

Diğer şıklar: **24** küçük sayı bulunmuş / **25** toplamın yarısı alınmış / **26** büyük sayı bulunmuş / **100** fark toplam sanılmış.
:::

:::soru{cevap="E"}
Bir sayının $\dfrac{2}{3}$'ü ile $\dfrac{1}{4}$'ünün farkı, aynı sayının $\dfrac{1}{6}$'sının 5 fazlasına eşittir. Buna göre bu sayı kaçtır?

- A) 3
- B) 5
- C) 10
- D) 19
- E) 20

---

1. Denklem: $\dfrac{2x}{3} - \dfrac{x}{4} = \dfrac{x}{6} + 5$.
2. Paydaların EKOK'u 12 ile çarp: $8x - 3x = 2x + 60$.
3. $3x = 60$ ve $x = 20$. Kontrol: $\dfrac{40}{3} - 5 = \dfrac{25}{3}$ ve $\dfrac{20}{6} + 5 = \dfrac{25}{3}$. Doğru cevap E.

Diğer şıklar: **3** $3x = 60$ denklemindeki katsayı sonuç sanılmış / **5** sabit terim sonuç sanılmış / **10** işlem hatasıyla yarısı bulunmuş / **19** işlem hatasıyla bir eksik bulunmuş.
:::

## Kendini dene

:::dene
1. "Bir sayının 3 katının 5 eksiği 19" ise sayı kaçtır? => $3x - 5 = 19$ ve $x = 8$.
2. Bir sayının yarısının 6 fazlası 15 ise sayı kaçtır? => $\dfrac{x}{2} + 6 = 15$ ve $x = 18$.
3. Bir depodaki suyun önce $\dfrac{2}{5}$'i kullanılıyor. Geriye 36 litre kaldığına göre depo kaç litre su içeriyordu? => Kalan $\dfrac{3}{5}$ ise $36 \cdot \dfrac{5}{3} = 60$ litre.
4. Üç ardışık tam sayının toplamı 45 ise en büyüğü kaçtır? => Ortanca 15, en büyüğü 16.
5. İki sayının toplamı 40, farkı 8 ise büyük sayı kaçtır? => Büyük sayı $\dfrac{40 + 8}{2} = 24$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 14, false from public.topics where subject_id = 'tyt-mat' and name = 'Sayı ve Kesir Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Cümleyi cebirsel ifadeye çevirme, sayı problemleri, kesirli parça problemleri, ardışık sayı ve rakam problemleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Çeviri tablosundaki "iki sayının toplamının karesi" gibi ifadeler, (b) Mini test 4. sorunun zorluk düzeyi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Sayı ve Kesir Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yaş problemleri, yalnızca zamanın geçtiği bir sayı problemidir. Bugün 10 yaşında olan biri 3 yıl sonra 13, 4 yıl önce 6 yaşındadır. Bu basit fikir, bir kez doğru kurulduğunda en zor yaş sorusunu bile denkleme dönüştürür. Bu konuda **zamanla değişen yaşları** tablo ile göstermeyi, iki kişi arasındaki yaş farkının hep sabit kaldığını ve oranlı yaş problemlerini öğreneceksin.

:::hedefler
1. "Şimdi, $t$ yıl sonra, $t$ yıl önce" yaşlarını doğru yazmak.
2. İki kişi arasındaki yaş farkının sabit olduğunu kullanmak.
3. Toplam, fark ve oran verilen yaş problemlerini denklemle çözmek.
4. Tablo yöntemiyle koşulları sırayla işlemek.
5. Bulunan yaşları soruda kontrol etmek.
:::

:::ipucu
Bir yaş problemini görünce **önce tablo çiz**. Satırlara kişileri, sütunlara "şimdi", "kaç yıl sonra" ve "kaç yıl önce"yi yaz. Verilen her bilgiyi doğru sütuna yerleştir. Tablo, hangi sayının neye ait olduğunu karıştırmanı engeller.
:::

## 1. Zaman geçince yaşlar

$t$ yıl geçtiğinde **herkesin yaşı $t$ artar**. $t$ yıl öncesinde ise herkesin yaşı $t$ azalır.

| | Şimdi | $t$ yıl sonra | $t$ yıl önce |
| --- | --- | --- | --- |
| Ali | $a$ | $a + t$ | $a - t$ |
| Babası | $b$ | $b + t$ | $b - t$ |
| Fark ($b - a$) | $b - a$ | $b - a$ | $b - a$ |

**En önemli sonuç:** İki kişi arasındaki yaş farkı **hiç değişmez**. Ali her yıl bir yaş alıyorsa babası da bir yaş alır. Bu fark, problemin çoğu zaman en güvenilir bilgisidir.

## 2. Denklem kurmak

**Örnek.** Ali 12, babası 40 yaşındadır. Kaç yıl sonra babası Ali'nin yaşının 2 katı olur?

$t$ yıl sonra yaşlar $12 + t$ ve $40 + t$ olur.

$$40 + t = 2(12 + t) \Rightarrow 40 + t = 24 + 2t \Rightarrow t = 16$$

16 yıl sonra Ali 28, babası 56 olur ve $56 = 2 \cdot 28$.

Bu soruyu **fark** ile de çözebilirsin. Fark $40 - 12 = 28$. Baba, Ali'nin 2 katı olacaksa yaş farkı Ali'nin yaşına eşit olmalı. Yani Ali 28 olduğunda baba 56 olur. Ali'nin 28 olması için $28 - 12 = 16$ yıl geçmeli.

## 3. Toplam verilen problemler

**Örnek.** Anne ile kızın yaşları toplamı 48'dir. 6 yıl önce anne, kızın 5 katı yaşındaydı. Annenin şimdiki yaşı kaçtır?

Kızın yaşı $k$, annenin yaşı $a$ olsun.

- $a + k = 48$
- 6 yıl önce: $a - 6 = 5(k - 6)$ ve $a = 5k - 24$.

Birinci denklemde yerine koy: $5k - 24 + k = 48$ ve $6k = 72$, $k = 12$. Annenin yaşı $a = 36$.

Kontrol: 6 yıl önce anne 30, kız 6 yaşındaydı ve $30 = 5 \cdot 6$.

## 4. Üç kişi ya da gruplar

**Örnek.** Bir babanın yaşı, üç çocuğunun yaşları toplamının 2 katıdır. 10 yıl sonra babanın yaşı, çocukların yaşları toplamına eşit olacaktır. Baba şimdi kaç yaşındadır?

Çocukların yaşları toplamı $S$, baba $B$ olsun. $B = 2S$.

10 yıl sonra baba $B + 10$ olur. **Üç çocuğun** yaşı 10 yıl sonra $3 \cdot 10 = 30$ artar. Toplamları $S + 30$ olur. $B + 10 = S + 30$ ve $2S + 10 = S + 30$, $S = 20$ ve $B = 40$.

:::ipucu{baslik="Sık yapılan hata"}
Çocuk sayısı birden fazlaysa toplama **her çocuğun yaşı için** $t$ eklenir. Üç çocuk için toplam $3t$ artar. "$S + t$" yazmak yanlıştır.
:::

## 5. Oranlı yaş problemleri

**Örnek.** İki kişinin yaşları oranı şimdi $3 : 5$, 8 yıl sonra $5 : 7$ olacaktır. Yaşları toplamı şimdi kaçtır?

Yaşlar $3k$ ve $5k$ olsun. 8 yıl sonra $3k + 8$ ve $5k + 8$ olur.

$$\dfrac{3k + 8}{5k + 8} = \dfrac{5}{7} \Rightarrow 7(3k + 8) = 5(5k + 8) \Rightarrow 21k + 56 = 25k + 40$$

$16 = 4k$ ve $k = 4$. Yaşlar 12 ve 20, toplamları 32.

Kontrol: 8 yıl sonra 20 ve 28 olurlar ve $\dfrac{20}{28} = \dfrac{5}{7}$.

:::baglanti
Oran sabiti $k$'yı ("Oran ve Orantı" konusundaki gibi) burada da kullandın. Oran zamanla değişir ama **fark** sabit kalır. $5k - 3k = 2k = 8$ yaş farkı, 8 yıl sonra da $28 - 20 = 8$ olarak kalır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $t$ yıl sonra | Herkes $+t$ |
| $t$ yıl önce | Herkes $-t$ |
| Yaş farkı | Hiç değişmez |
| Birden çok kişi | Toplam her kişi için $t$ artar |
| Oran | $3k$ ve $5k$ yaz, zaman sonrasını ekle |
| Kontrol | Yıllar öncesi ve sonrası için dene |

## Mini test

:::soru{cevap="C"}
Elif 9, annesi 33 yaşındadır. Kaç yıl sonra annesinin yaşı Elif'in yaşının 2 katı olur?

- A) 9
- B) 14
- C) 15
- D) 18
- E) 24

---

1. $t$ yıl sonra yaşlar $9 + t$ ve $33 + t$ olur.
2. $33 + t = 2(9 + t) = 18 + 2t$ ve $t = 15$.
3. Kontrol: 15 yıl sonra Elif 24, annesi 48 yaşında olur ve $48 = 2 \cdot 24$. Doğru cevap C.

Diğer şıklar: **9** Elif'in yaşı alınmış / **14** işlem hatasıyla bir eksik bulunmuş / **18** Elif'in yaşının 2 katı alınmış / **24** yaş farkı alınmış.
:::

:::soru{cevap="E"}
Baba ile oğlun yaşları toplamı 56'dır. 4 yıl önce babanın yaşı oğlunun yaşının 7 katıydı. Buna göre babanın şimdiki yaşı kaçtır?

- A) 10
- B) 36
- C) 42
- D) 45
- E) 46

---

1. Baba $b$, oğul $o$ olsun. $b + o = 56$.
2. 4 yıl önce: $b - 4 = 7(o - 4)$ ve $b = 7o - 24$.
3. $7o - 24 + o = 56$ ve $o = 10$, $b = 46$. Kontrol: 4 yıl önce 42 ve 6 yaşındaydılar ve $42 = 7 \cdot 6$. Doğru cevap E.

Diğer şıklar: **10** oğlun yaşı bulunmuş / **36** yaş farkı bulunmuş / **42** 4 yıl önceki yaş bulunmuş / **45** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="B"}
Bir annenin yaşı, iki çocuğunun yaşları toplamının 3 katıdır. 6 yıl sonra annenin yaşı, çocukların yaşları toplamının 2 katı olacağına göre anne şimdi kaç yaşındadır?

- A) 36
- B) 54
- C) 55
- D) 56
- E) 60

---

1. Çocukların yaşları toplamı $S$, anne $A = 3S$ olsun.
2. 6 yıl sonra iki çocuğun toplamı $S + 12$ olur. $A + 6 = 2(S + 12)$.
3. $3S + 6 = 2S + 24$ ve $S = 18$, $A = 54$. Doğru cevap B.

Diğer şıklar: **36** çocukların yaşları toplamının 2 katı alınmış / **55** işlem hatasıyla bir fazla bulunmuş / **56** işlem hatasıyla iki fazla bulunmuş / **60** 6 yıl sonraki anne yaşı alınmış.
:::

:::soru{cevap="C"}
İki kişinin yaşları oranı şimdi $2 : 5$, 6 yıl önce $1 : 3$ idi. Buna göre büyük olanın şimdiki yaşı kaçtır?

- A) 24
- B) 54
- C) 60
- D) 61
- E) 84

---

1. Yaşlar $2k$ ve $5k$ olsun. 6 yıl önce $2k - 6$ ve $5k - 6$ idi.
2. $\dfrac{2k - 6}{5k - 6} = \dfrac{1}{3}$ ise $6k - 18 = 5k - 6$ ve $k = 12$.
3. Büyük olanın yaşı $5 \cdot 12 = 60$. Kontrol: 6 yıl önce 18 ve 54'tü ve $\dfrac{18}{54} = \dfrac{1}{3}$. Doğru cevap C.

Diğer şıklar: **24** küçük olanın yaşı bulunmuş / **54** 6 yıl önceki büyük yaş bulunmuş / **61** işlem hatasıyla bir fazla bulunmuş / **84** yaşlar toplamı bulunmuş.
:::

## Kendini dene

:::dene
1. Bugün Zeynep'in yaşı 10, annesinin yaşı 38'dir. Kaç yıl sonra annesi Zeynep'in 2 katı yaşında olur? => $38 + t = 2(10 + t)$ ve $t = 18$.
2. İki kardeşin yaşları toplamı 22, farkı 4 ise küçük kardeş kaç yaşındadır? => $\dfrac{22 - 4}{2} = 9$.
3. 5 yıl sonra yaşı 20 olacak birinin 3 yıl önceki yaşı kaçtır? => Şimdi 15 yaşında. 3 yıl önce 12.
4. Bir babanın yaşı oğlunun yaşının 4 katıdır. 10 yıl sonra 2 katı olacaksa oğul şimdi kaç yaşındadır? => $4x + 10 = 2(x + 10)$ ve $2x = 10$. $x = 5$.
5. Anne 36, kızı 12 yaşındadır. Kaç yıl sonra anne kızın 2 katı yaşında olur? => $36 + t = 2(12 + t)$ ve $t = 12$.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Yaş Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Yaşların zamanla değişimi, sabit yaş farkı, toplam ve oran verilen yaş problemleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 3. soru çok çocuklu yaş toplamını sınar, (b) Çeldirici etiketlerinin anlaşılırlığı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Yaş Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir araç saatte 80 km hızla 3 saat giderse kaç km yol alır? Aynı yolun iki ucundan çıkan iki araç ne zaman karşılaşır? Hareket problemleri, günlük hayatta sürekli kullandığımız **hız, yol ve zaman** ilişkisinin sorusudur. TYT'de bu ilişki, iki aracın yön durumuna göre değişen küçük bir kuralla birleşir. Bu konuda temel formülü, birimleri, ortalama hızı, **karşılıklı** ve **aynı yönlü** hareketi, akıntıyı ve tren-tünel problemlerini öğreneceksin.

:::hedefler
1. Hız, yol ve zaman arasındaki bağıntıyı ve birim dönüşümünü kullanmak.
2. Ortalama hızı toplam yol ve toplam zamandan hesaplamak.
3. Karşılıklı ve aynı yönlü hareket problemlerinde göreli hızı bulmak.
4. Akıntılı hareket problemlerinde gerçek ve göreli hızı ayırt etmek.
5. Uzunluğu olan cisimlerin (tren, tünel) geçiş sürelerini hesaplamak.
:::

:::ipucu
Her hareket sorusunda önce **birimlere** bak. Hız km/sa ise yol km, süre saat olmalı. Hız m/sn ise yol metre, süre saniye olmalı. Birimler uyuşmuyorsa önce birini dönüştür.
:::

## 1. Temel bağıntı

Sabit hızla giden bir araç için:

$$\text{Yol} = \text{Hız} \cdot \text{Zaman} \qquad x = v \cdot t$$

Bu bağıntıdan $v = \dfrac{x}{t}$ ve $t = \dfrac{x}{v}$ de yazılır. Üç değişkenden ikisini bilirsen üçüncüyü bulursun.

**Birim dönüşümü.** km/sa ile m/sn arasında şu çarpan kullanılır:

$$1 \text{ km/sa} = \dfrac{1000 \text{ m}}{3600 \text{ sn}} = \dfrac{5}{18} \text{ m/sn}$$

72 km/sa hızı m/sn'ye çevirmek için $72 \cdot \dfrac{5}{18} = 20$ m/sn yazılır. Tersi için $\dfrac{18}{5}$ ile çarp: $20 \cdot \dfrac{18}{5} = 72$ km/sa.

## 2. Ortalama hız

**Ortalama hız**, toplam yolun toplam süreye oranıdır:

$$v_{\text{ort}} = \dfrac{\text{Toplam yol}}{\text{Toplam zaman}}$$

Hızların aritmetik ortalaması **değildir**. Örnek: Bir araç 120 km'lik yolu 40 km/sa hızla, aynı uzunluktaki dönüş yolunu 60 km/sa hızla gidiyor.

- Gidiş süresi $\dfrac{120}{40} = 3$ saat, dönüş süresi $\dfrac{120}{60} = 2$ saat.
- Toplam yol 240 km, toplam süre 5 saat.
- Ortalama hız $\dfrac{240}{5} = 48$ km/sa.

Hızların aritmetik ortalaması $\dfrac{40 + 60}{2} = 50$ olurdu ama doğru değer 48'dir. Neden? Araç **yavaş giderken daha uzun süre** geçirdi ve bu yüzden ortalama yavaş hıza yaklaştı.

## 3. İki araç: karşılıklı ve aynı yön

![Karşılıklı hareket ve aynı yönlü hareket şemaları. Karşılıklı harekette hızlar toplanır, aynı yönde hızlar çıkarılır](/lessons/tyt-mat/hareket-yonleri.svg "İki aracın göreli hızı | Yolumnet")

**Karşılıklı hareket (zıt yönde).** Araçlar birbirine yaklaşırken aralarındaki uzaklık her saat **iki hızın toplamı** kadar azalır.

$$t = \dfrac{\text{Aradaki yol}}{v_1 + v_2}$$

Örnek: 720 km uzaklıktaki iki şehirden birbirine doğru çıkan araçlar 70 ve 50 km/sa hızla gidiyor. Karşılaşma süresi $\dfrac{720}{70 + 50} = 6$ saattir.

**Aynı yönde hareket.** Arkadaki araç öndekini yakalıyorsa aralarındaki fark her saat **hızların farkı** kadar azalır.

$$t = \dfrac{\text{Aradaki yol}}{v_{\text{hızlı}} - v_{\text{yavaş}}}$$

Örnek: A aracı 90 km/sa, 100 km önündeki B aracı 70 km/sa hızla gidiyor. A, B'yi $\dfrac{100}{90 - 70} = 5$ saat sonra yakalar.

:::baglanti
İki aracın **birbirine göre** hızını bulmak, aslında problemi basitleştirmektir. Karşılıklı harekette birini durup diğeri iki hızın toplamıyla ilerliyormuş gibi düşünebilirsin. Aynı yönde ise farkla ilerliyormuş gibi. Bu "göreli hız" fikri fizikte de karşına çıkacak.
:::

## 4. Akıntılı hareket

Bir kayık akıntıyla birlikte giderken hızı **artar**, akıntıya karşı giderken **azalır**. Kayığın durgun sudaki hızı $v$, akıntının hızı $a$ olsun:

| Durum | Gerçek hız |
| --- | --- |
| Akıntı yönünde | $v + a$ |
| Akıntıya karşı | $v - a$ |

**Örnek.** Durgun suda hızı 18 km/sa olan bir kayık, akıntı hızı 3 km/sa olan bir nehirde akıntı yönünde 63 km yol alacak. Akıntı yönündeki hız $18 + 3 = 21$ km/sa. Süre $\dfrac{63}{21} = 3$ saattir.

Kayığın akıntı yönündeki ve akıntıya karşı hızları biliniyorsa **ortalamaları** durgun sudaki hızı, **yarı farkları** akıntı hızını verir. 21 ve 15 için $\dfrac{21 + 15}{2} = 18$ ve $\dfrac{21 - 15}{2} = 3$.

## 5. Tren ve tünel problemleri

Cismin **uzunluğu** varsa geçiş süresine uzunluk da katılır.

- **Tamamen geçmek.** Aracın başı tünelin girişine girdiğinde süre başlar, aracın sonu tünelden çıktığında biter. Yol, tünelin ve aracın boylarının **toplamıdır**.
- **Direği geçmek.** Direğin boyu yok sayılır. Yol aracın kendi boyudur.

**Örnek.** 100 m uzunluğundaki bir tren, 20 m/sn hızla 300 m'lik bir tünelden tamamen geçiyor. Yol $100 + 300 = 400$ m ve süre $\dfrac{400}{20} = 20$ saniyedir.

:::ipucu{baslik="Sık yapılan hata"}
Tünel problemlerinde yalnızca tünelin boyunu ($300$ m) yola yazmak çok yapılan bir hatadır. Tren de **kendi boyu kadar** ilerlemek zorundadır. Başının girişinden sonunun çıkışına kadar $300 + 100$ m yol gider.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Temel bağıntı | $x = v \cdot t$ |
| km/sa $\rightarrow$ m/sn | $\dfrac{5}{18}$ ile çarp |
| Ortalama hız | Toplam yol bölü toplam zaman |
| Karşılıklı hareket | Hızlar toplanır |
| Aynı yönde yakalama | Hızlar çıkarılır |
| Akıntı yönü | $v + a$ |
| Akıntıya karşı | $v - a$ |
| Tren ve tünel | Yol = boylar toplamı |

## Mini test

:::soru{cevap="B"}
Bir araç 120 km uzunluğundaki bir yolu giderken 30 km/sa, dönerken aynı yolu 60 km/sa sabit hızla almıştır. Aracın tüm yolculuk boyunca ortalama hızı kaç km/sa'tir?

- A) 39
- B) 40
- C) 45
- D) 60
- E) 90

---

1. Gidiş süresi $\dfrac{120}{30} = 4$ saat, dönüş süresi $\dfrac{120}{60} = 2$ saattir.
2. Toplam yol $240$ km, toplam süre $6$ saattir.
3. Ortalama hız $\dfrac{240}{6} = 40$ km/sa. Doğru cevap B.

Diğer şıklar: **39** işlem hatasıyla bir eksik bulunmuş / **45** hızların aritmetik ortalaması alınmış / **60** toplam yol yalnızca ilk süreye bölünmüş / **90** hızlar toplanmış.
:::

:::soru{cevap="A"}
Aralarında 960 km bulunan A ve B şehirlerinden iki araç aynı anda birbirine doğru yola çıkıyor. Araçlar 55 km/sa ve 65 km/sa hızla gittiğine göre kaç saat sonra karşılaşırlar?

- A) 8
- B) 14
- C) 17
- D) 96
- E) 120

---

1. Karşılıklı harekette yaklaşma hızı iki hızın toplamıdır: $55 + 65 = 120$ km/sa.
2. Süre $\dfrac{960}{120} = 8$ saat. Doğru cevap A.

Diğer şıklar: **14** yalnızca 65 km/sa hızlı araç dikkate alınmış / **17** yalnızca 55 km/sa hızlı araç dikkate alınmış / **96** hızlar çıkarılmış / **120** hızlar toplanıp süre sanılmış.
:::

:::soru{cevap="C"}
Aynı yönde giden iki araçtan arkadaki araç 85 km/sa hızla gidiyor, 150 km önündeki araç 70 km/sa hızla gidiyor. Arkadaki araç öndekini kaç saat sonra yakalar?

- A) 8
- B) 9
- C) 10
- D) 15
- E) 150

---

1. Aynı yönde yakalamada yaklaşma hızı, hızların farkıdır: $85 - 70 = 15$ km/sa.
2. Süre $\dfrac{150}{15} = 10$ saat. Doğru cevap C.

Diğer şıklar: **8** işlem hatasıyla iki eksik bulunmuş / **9** işlem hatasıyla bir eksik bulunmuş / **15** hız farkı süre sanılmış / **150** aradaki yol süre sanılmış.
:::

:::soru{cevap="C"}
Uzunluğu 100 metre olan bir tren, saatteki hızı sabit ve 72 km/sa iken uzunluğu 300 metre olan bir tünele girdikten sonra tamamen tünelden çıkıncaya kadar kaç saniye geçer?

- A) 5
- B) 15
- C) 20
- D) 21
- E) 22

---

1. Hız m/sn'ye çevrilir: $72 \cdot \dfrac{5}{18} = 20$ m/sn.
2. Tren tünelden tamamen çıkana kadar $100 + 300 = 400$ m yol alır.
3. Süre $\dfrac{400}{20} = 20$ saniye. Doğru cevap C.

Diğer şıklar: **5** yalnızca tren boyu alınmış / **15** yalnızca tünel boyu alınmış / **21** işlem hatasıyla bir fazla bulunmuş / **22** dönüşüm çarpanı 18 hız sanılmış.
:::

## Kendini dene

:::dene
1. 54 km/sa hızı m/sn cinsinden yaz. => $54 \cdot \dfrac{5}{18} = 15$ m/sn.
2. Hızı 60 km/sa olan bir araç 150 km yolu kaç saatte alır? => $\dfrac{150}{60} = 2{,}5$ saat.
3. Bir araç ilk yarı yolu 30 km/sa, ikinci yarı yolu 60 km/sa hızla gidiyor. Ortalama hızı kaçtır? => Yarı yol $d$ olsun. Süre $\dfrac{d}{30} + \dfrac{d}{60} = \dfrac{d}{20}$. Ortalama hız $\dfrac{2d}{d/20} = 40$ km/sa.
4. 400 km uzaklıktaki iki araç 60 ve 40 km/sa hızla birbirine doğru gidiyor. Kaç saat sonra karşılaşırlar? => $\dfrac{400}{60 + 40} = 4$ saat.
5. Hızı 15 km/sa olan akıntıya karşı giden 25 km/sa hızlı bir tekne, 50 km yolu akıntıya karşı kaç saatte gider? => Hız $25 - 15 = 10$. Süre $\dfrac{50}{10} = 5$ saat.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'Hareket Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Hız-yol-zaman bağıntısı, birim dönüşümü, ortalama hız, karşılıklı ve aynı yönlü hareket, akıntılı hareket, tren ve tünel. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 3. soruda çeldirici etiketlerinin sadeleştirilmesi, (b) Mini test 4. sorunun 25 ve 80 şıklarının gerekçesi.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Hareket Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir işi tek başına 12 günde bitiren biri ile 6 günde bitiren biri birlikte çalışırsa iş kaç günde biter? Bir havuzu bir musluk doldururken tahliye borusu boşaltıyorsa havuz ne zaman dolar? Bu sorular aynı fikirle çözülür: **bir birim zamanda yapılan işe bak**. Bu konuda "bir günlük iş" kavramını, ortak çalışmayı, farklı katılım zamanlarını ve havuz problemlerini öğreneceksin.

:::hedefler
1. Bir birim zamandaki iş miktarını ($\dfrac{1}{t}$) bulmak.
2. Birlikte çalışan işçilerin işlerini toplamak.
3. Doldurma ve boşaltma işlemlerini ayrı işaretlerle toplamak.
4. Farklı sürelerde çalışan işçilerle yapılan işi kesirle ifade etmek.
5. İşçi sayısı, gün ve saat arasındaki bileşik orantıyı kullanmak.
:::

:::ipucu
İşi **1 bütün** al. Bir işi $t$ günde bitiren biri **günde $\dfrac{1}{t}$ iş** yapar. Birlikte çalışan kişilerin günlük işlerini topla. Toplam bir güne bölününce süreyi bulursun. Çoğu soru bu üç cümlenin içinde çözülür.
:::

## 1. Bir günlük iş

Bir işi tek başına $t$ günde bitiren işçi, bir günde işin $\dfrac{1}{t}$'sini yapar.

- 12 günde bitiren günde $\dfrac{1}{12}$ iş yapar.
- 6 günde bitiren günde $\dfrac{1}{6}$ iş yapar.

$n$ günde yapılan iş, bir günlük iş $\cdot$ $n$'dir. İşin tamamı bittiğinde yapılan iş toplamı 1 olur.

## 2. Birlikte çalışma

Birlikte çalışanların günlük işleri **toplanır**:

$$\dfrac{1}{t} = \dfrac{1}{a} + \dfrac{1}{b} \Rightarrow t = \dfrac{a \cdot b}{a + b}$$

**Örnek.** A bir işi 12 günde, B aynı işi 6 günde bitiriyor. İkisi birlikte çalışırsa iş kaç günde biter?

$$\dfrac{1}{12} + \dfrac{1}{6} = \dfrac{1}{12} + \dfrac{2}{12} = \dfrac{3}{12} = \dfrac{1}{4}$$

Günlük iş $\dfrac{1}{4}$ ise iş **4 günde** biter. Mantık kontrolü: Birlikte çalışmak işi hızlandırır. 4 gün, en hızlı işçinin tek başına süresi olan 6 günden **kısadır**.

**Örnek.** A ile B birlikte işi 10 günde, A tek başına 15 günde bitiriyor. B tek başına kaç günde bitirir?

$$\dfrac{1}{B} = \dfrac{1}{10} - \dfrac{1}{15} = \dfrac{3}{30} - \dfrac{2}{30} = \dfrac{1}{30}$$

B tek başına **30 günde** bitirir. Burada çıkarma yaptık, çünkü ortak işten A'nın kısmını çıkarıp B'ninkini buldun.

:::ipucu{baslik="Sık yapılan hata"}
Süreleri doğrudan toplamak ya da ortalamasını almak yanlıştır. 12 ve 6 gün için $\dfrac{12 + 6}{2} = 9$ ya da $12 + 6 = 18$ yazmak, birlikte çalışmanın işi hızlandırdığını yok sayar. **Günlük işleri topla**, süreleri değil.
:::

## 3. Havuz problemleri

Havuz problemleri aynı mantıkla çözülür. Havuzun tamamı 1 bütündür.

- **Doldurma borusu** işi artırır: $+\dfrac{1}{t}$.
- **Boşaltma borusu** işi azaltır: $-\dfrac{1}{t}$.

**Örnek.** Bir musluk havuzu 8 saatte doldurur, tahliye borusu dolu havuzu 24 saatte boşaltır. İkisi aynı anda açıkken boş havuz kaç saatte dolar?

$$\dfrac{1}{8} - \dfrac{1}{24} = \dfrac{3}{24} - \dfrac{1}{24} = \dfrac{2}{24} = \dfrac{1}{12}$$

Havuz **12 saatte** dolar. Eğer boru musluktan daha hızlı boşaltsaydı havuz hiç dolmazdı. Tahliye süresi 8 saatten kısa olsaydı günlük iş negatif çıkardı.

## 4. Farklı katılım zamanları

Bazı işçiler işe başladığında bir kısmı yapılmış olabilir. **Yapılan iş kesirlerini** topla, kalan işi hesapla.

**Örnek.** A bir işi tek başına 20 günde, B 30 günde bitirir. İkisi 6 gün birlikte çalıştıktan sonra ayrılıyor. Kalan işi C tek başına 10 günde bitirdiğine göre C bu işi tek başına kaç günde bitirirdi?

- Birlikte günlük iş: $\dfrac{1}{20} + \dfrac{1}{30} = \dfrac{3}{60} + \dfrac{2}{60} = \dfrac{1}{12}$.
- 6 günde yapılan iş: $6 \cdot \dfrac{1}{12} = \dfrac{1}{2}$. Kalan iş $\dfrac{1}{2}$.
- C, işin yarısını 10 günde yaptı. Bütün işi $10 \cdot 2 = 20$ günde yapardı.

Kontrol: C'nin günlük işi $\dfrac{1}{20}$, A'nınkiyle aynıdır. Yani C'nin A kadar hızlı olduğu sonucuna varırsın.

## 5. İşçi, gün ve saat: bileşik orantı

İşçi sayısı, gün sayısı ve günlük çalışma saati arasında şu çarpım **iş miktarı** için sabittir:

$$\text{İşçi} \cdot \text{Gün} \cdot \text{Saat} = \text{Toplam iş}$$

**Örnek.** 6 işçi günde 8 saat çalışarak bir işi 10 günde bitiriyor. Toplam iş $6 \cdot 8 \cdot 10 = 480$ işçi-saattir. 8 işçi günde 6 saat çalışırsa gün sayısı $\dfrac{480}{8 \cdot 6} = 10$ olur. İşçi sayısı arttı ama saat azaldı ve bu iki etki birbirini dengeledi.

:::baglanti
"Oran ve Orantı" konusunda gördüğün ters orantı burada da var. İşçi sayısı arttıkça gün azalır. İşçi-saat veya işçi-gün gibi bir **sabit çarpım** bulursan bileşik orantı tek denkleme iner.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Günlük iş | $t$ günde biten işin günlük kısmı $\dfrac{1}{t}$ |
| Birlikte çalışma | Günlük işleri **topla** |
| Biri bilinmiyorsa | Günlük işleri **çıkar** |
| Doldurma borusu | $+$ |
| Boşaltma borusu | $-$ |
| Kısmi iş | Yapılan iş kesirleri toplanır, kalan bulunur |
| Bileşik | İşçi $\cdot$ gün $\cdot$ saat sabit |

## Mini test

:::soru{cevap="B"}
A işçisi bir işi tek başına 24 günde, B işçisi aynı işi tek başına 8 günde bitirebilmektedir. İkisi birlikte çalışırsa bu iş kaç günde biter?

- A) 3
- B) 6
- C) 8
- D) 16
- E) 32

---

1. A'nın günlük işi $\dfrac{1}{24}$, B'nin günlük işi $\dfrac{1}{8} = \dfrac{3}{24}$.
2. Birlikte günlük iş $\dfrac{1}{24} + \dfrac{3}{24} = \dfrac{4}{24} = \dfrac{1}{6}$.
3. İş 6 günde biter. Doğru cevap B.

Diğer şıklar: **3** süreler bölünmüş ($24 \div 8$) / **8** en hızlı işçinin süresi alınmış / **16** sürelerin ortalaması alınmış / **32** süreler toplanmış.
:::

:::soru{cevap="B"}
A ile B birlikte çalışarak bir işi 12 günde bitirmektedir. A tek başına aynı işi 20 günde bitirebildiğine göre B aynı işi tek başına kaç günde bitirir?

- A) 8
- B) 30
- C) 31
- D) 32
- E) 240

---

1. Birlikte günlük iş $\dfrac{1}{12}$, A'nın günlük işi $\dfrac{1}{20}$.
2. B'nin günlük işi $\dfrac{1}{12} - \dfrac{1}{20} = \dfrac{5}{60} - \dfrac{3}{60} = \dfrac{2}{60} = \dfrac{1}{30}$.
3. B işi tek başına 30 günde bitirir. Doğru cevap B.

Diğer şıklar: **8** süreler çıkarılmış / **31** işlem hatasıyla bir fazla bulunmuş / **32** süreler toplanmış / **240** süreler çarpılmış.
:::

:::soru{cevap="C"}
Bir musluk boş bir havuzu 12 saatte doldurmakta, dolu bir havuzu tahliye borusu 36 saatte boşaltmaktadır. İki boru aynı anda açıkken boş havuz kaç saatte dolar?

- A) 3
- B) 9
- C) 18
- D) 24
- E) 48

---

1. Musluk günlük $\dfrac{1}{12}$ doldurur, boru $\dfrac{1}{36}$ boşaltır.
2. Birlikte $\dfrac{1}{12} - \dfrac{1}{36} = \dfrac{3}{36} - \dfrac{1}{36} = \dfrac{2}{36} = \dfrac{1}{18}$.
3. Havuz 18 saatte dolar. Doğru cevap C.

Diğer şıklar: **3** süreler bölünmüş ($36 \div 12$) / **9** boşaltma borusu da doldurma sanılmış / **24** süreler çıkarılmış / **48** süreler toplanmış.
:::

:::soru{cevap="B"}
A bir işi tek başına 30 günde, B aynı işi 60 günde bitirebilmektedir. A ve B birlikte 10 gün çalıştıktan sonra ayrılıyor, işin kalan kısmını C tek başına 6 günde bitiriyor. Buna göre C aynı işin tamamını tek başına kaç günde bitirir?

- A) 9
- B) 12
- C) 18
- D) 20
- E) 24

---

1. A ve B'nin günlük işi $\dfrac{1}{30} + \dfrac{1}{60} = \dfrac{3}{60} = \dfrac{1}{20}$.
2. 10 günde yapılan iş $\dfrac{10}{20} = \dfrac{1}{2}$ ve kalan iş $\dfrac{1}{2}$.
3. C, işin yarısını 6 günde yaptı. Tamamını $6 \cdot 2 = 12$ günde yapar. Doğru cevap B.

Diğer şıklar: **9** kalan iş $\frac{2}{3}$ sanılmış / **18** kalan iş $\frac{1}{3}$ sanılmış / **20** A ve B nin birlikte süresi alınmış / **24** kalan iş $\frac{1}{4}$ sanılmış.
:::

## Kendini dene

:::dene
1. A bir işi 15 günde, B 10 günde bitirir. Birlikte kaç günde bitirirler? => $\dfrac{1}{15} + \dfrac{1}{10} = \dfrac{5}{30} = \dfrac{1}{6}$. 6 gün.
2. Bir musluk bir havuzu 4 saatte doldurur. İkinci musluk aynı havuzu 12 saatte doldurur. İkisi birlikte kaç saatte doldurur? => $\dfrac{1}{4} + \dfrac{1}{12} = \dfrac{4}{12} = \dfrac{1}{3}$. 3 saat.
3. Bir işin $\dfrac{3}{5}$'ü 18 günde yapılıyorsa tamamı kaç günde yapılır? => Tamamı $18 \cdot \dfrac{5}{3} = 30$ gün.
4. 4 işçi bir işi 15 günde yapıyorsa 6 işçi kaç günde yapar? => İş $4 \cdot 15 = 60$ işçi-gün. $\dfrac{60}{6} = 10$ gün.
5. Bir havuzu A borusu 6 saatte doldurur, B borusu 3 saatte doldurur, C borusu 12 saatte boşaltır. Üçü açıkken havuz kaç saatte dolar? => $\dfrac{1}{6} + \dfrac{1}{3} - \dfrac{1}{12} = \dfrac{2}{12} + \dfrac{4}{12} - \dfrac{1}{12} = \dfrac{5}{12}$. Süre $\dfrac{12}{5} = 2{,}4$ saat.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'İşçi ve Havuz Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Bir günlük iş, birlikte çalışma, havuz problemleri (doldurma ve boşaltma), kısmi iş, işçi-gün-saat bileşik orantısı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 3. sorunun "6" şıkkı (boşaltmayı da doldurma saymak), (b) Havuz soruları dolu havuzun boşaltılması varsayımıyla yazıldı.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'İşçi ve Havuz Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir ürüne %35 indirim yapılınca ne kadar ödersin? Bir mal %20 kârla satılıyorsa ne kadara alınmıştır? Fiyatlar önce artıp sonra düşerse neden başlangıç fiyatına dönmez? Yüzde, günlük hayatın en sık karşılaşılan matematiğidir ve TYT'de **her yıl mutlaka** sorulur. Bu konuda yüzde hesabını, art arda artış ve azalışı, kâr-zarar ilişkisini ve basit faizi öğreneceksin.

:::hedefler
1. Yüzde kavramını kesir ve ondalık ile ilişkilendirmek.
2. Yüzde artış ve azalışı çarpanla ifade etmek.
3. Art arda yüzde değişimini çarparak bulmak.
4. Maliyet, satış fiyatı, kâr ve zarar arasındaki ilişkiyi kurmak.
5. İndirimli ve etiketli fiyat problemlerini çözmek.
:::

:::ipucu
Yüzdelerde en güvenilir yöntem **çarpan** kullanmaktır. %20 artış demek $\times 1{,}20$, %20 azalış demek $\times 0{,}80$ demektir. Bir tutarın %35 indirimli fiyatı için $\times 0{,}65$ yazarsan indirim miktarını ayrıca çıkarmana gerek kalmaz.
:::

## 1. Yüzde

**Yüzde**, bir sayının yüzde birini ifade eder. $x$ sayısının yüzde $p$'si şudur:

$$\dfrac{p}{100} \cdot x$$

800'ün %35'i $\dfrac{35}{100} \cdot 800 = 280$'dir. Yüzde, kesir ve ondalık yazılım birbirine eşittir:

| Yüzde | Kesir | Ondalık |
| --- | --- | --- |
| %50 | $\dfrac{1}{2}$ | 0,5 |
| %25 | $\dfrac{1}{4}$ | 0,25 |
| %20 | $\dfrac{1}{5}$ | 0,2 |
| %10 | $\dfrac{1}{10}$ | 0,1 |
| %75 | $\dfrac{3}{4}$ | 0,75 |

**Hangisinin yüzdesi?** "A, B'nin yüzde kaçıdır?" sorusunda cevap $\dfrac{A}{B} \cdot 100$ olur. Bölünen, soruda "-nin" ya da "-ın" ekini alan sayıdır.

## 2. Artış ve azalış

Bir tutar %$p$ artarsa yeni tutar $x\left(1 + \dfrac{p}{100}\right)$, azalırsa $x\left(1 - \dfrac{p}{100}\right)$ olur.

**Örnek.** 800 TL'lik ürüne %35 indirim yapılıyor. Ödenecek tutar $800 \cdot 0{,}65 = 520$ TL'dir. İndirim miktarı $800 \cdot 0{,}35 = 280$ TL'dir ve $800 - 280 = 520$.

:::ipucu{baslik="Sık yapılan hata"}
%35 indirimi $800 - 35 = 765$ olarak hesaplamak yaygın bir hatadır. 35 bir **oran**dır, TL değildir. Önce 800'ün %35'ini bul, sonra çıkar. Ya da doğrudan $0{,}65$ ile çarp.
:::

### Art arda artış ve azalış

Yüzdeler art arda uygulanırken **toplanmaz**, çarpılır.

![Başlangıç 100, yüzde 20 zamla 120, yüzde 20 indirimle 96 olur. Toplam yüzde 4 azalma](/lessons/tyt-mat/yuzde-zincir.svg "Art arda yüzde değişimi | Yolumnet")

Fiyat önce %50 artıp sonra %40 azalırsa toplam çarpan $1{,}5 \cdot 0{,}6 = 0{,}9$ olur. Yani fiyat başlangıç fiyatının %90'ına düşer, **%10 azalır**. "$50 - 40 = 10$ artış" demek yanlıştır.

## 3. Kâr ve zarar

| Kavram | Anlamı |
| --- | --- |
| Maliyet ($M$) | Malın alış fiyatı |
| Satış fiyatı ($S$) | Malın satıldığı fiyat |
| Kâr | $S - M$ ($S > M$ ise) |
| Zarar | $M - S$ ($S < M$ ise) |
| Kâr yüzdesi | $\dfrac{S - M}{M} \cdot 100$ |
| Zarar yüzdesi | $\dfrac{M - S}{M} \cdot 100$ |

**Kâr ve zarar yüzdesi her zaman maliyet üzerinden hesaplanır**, satış fiyatı üzerinden değil.

**%$p$ kârla satış:** $S = M\left(1 + \dfrac{p}{100}\right)$.
**%$p$ zararla satış:** $S = M\left(1 - \dfrac{p}{100}\right)$.

**Örnek.** %20 kârla 240 TL'ye satılan malın maliyeti $\dfrac{240}{1{,}2} = 200$ TL'dir. Kâr $240 - 200 = 40$ TL olur ve $\dfrac{40}{200} = \dfrac{1}{5}$ yani %20'dir.

## 4. Etiket fiyatı ve indirim

Bir malın üzerindeki fiyata **etiket fiyatı** denir. Etiket fiyatından indirim yapılarak satış fiyatı bulunur.

**Örnek.** Maliyeti 320 TL olan bir mal, etiket fiyatı üzerinden %20 indirimle 400 TL'ye satılıyor. Etiket fiyatı kaçtır?

$$\text{Etiket} \cdot 0{,}8 = 400 \Rightarrow \text{Etiket} = \dfrac{400}{0{,}8} = 500 \text{ TL}$$

Satıcı bu satıştan $400 - 320 = 80$ TL kâr eder ve kâr yüzdesi $\dfrac{80}{320} = \dfrac{1}{4}$ yani %25'tir. Etiket fiyatı maliyetten yüksek olsa da indirim sonrası kâr oranı etiket oranından farklıdır.

## 5. Basit faiz

Bir paranın belirli bir sürede getirisi **faiz**dir. Basit faizde faiz yalnızca ana paradan hesaplanır:

$$\text{Faiz} = \dfrac{\text{Anapara} \cdot \text{Oran} \cdot \text{Süre}}{100}$$

Süre **yıl** cinsinden yazılır. **Örnek.** 5000 TL, yıllık %24 faizle 9 ay yatırılırsa süre $\dfrac{9}{12}$ yıl olur ve faiz $\dfrac{5000 \cdot 24 \cdot 9/12}{100} = 900$ TL'dir.

:::baglanti
Yüzde problemlerinde en önemli beceri, **hangi sayının yüzdesi alındığını** bulmaktır. Aynı problemde bir yüzde başlangıç fiyatına, bir yüzde indirimli fiyata uygulanabilir. Cümleyi "…'nin %X'i" kalıbına çevirip sayıyı belirle.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| %$p$ artış | $\times \left(1 + \dfrac{p}{100}\right)$ |
| %$p$ azalış | $\times \left(1 - \dfrac{p}{100}\right)$ |
| Art arda | Çarpanları çarp |
| Kâr yüzdesi | $\dfrac{S - M}{M}$, maliyet üzerinden |
| %$p$ kârla satış | $S = 1{,}p \cdot M$ |
| Etiket ve indirim | $S = \text{Etiket} \cdot (1 - \text{indirim})$ |
| Basit faiz | $\dfrac{\text{Anapara} \cdot \text{Oran} \cdot \text{Süre(yıl)}}{100}$ |

## Mini test

:::soru{cevap="A"}
Etiket fiyatı 800 TL olan bir ürüne %35 indirim uygulandığına göre bu ürün için kaç TL ödenir?

- A) 520
- B) 521
- C) 765
- D) 1040
- E) 1080

---

1. %35 indirim, fiyatın %65'ini ödemek demektir.
2. $800 \cdot 0{,}65 = 520$ TL. Doğru cevap A.

Diğer şıklar: **521** işlem hatasıyla bir fazla bulunmuş / **765** yüzde TL gibi çıkarılmış / **1040** işlem hatasıyla iki katı bulunmuş / **1080** indirim yerine zam yapılmış.
:::

:::soru{cevap="C"}
Bir mal %25 kârla 300 TL'ye satılmıştır. Bu malın maliyeti kaç TL'dir?

- A) 75
- B) 225
- C) 240
- D) 275
- E) 375

---

1. Kâr maliyet üzerinden hesaplanır: $S = 1{,}25 \cdot M$.
2. $M = \dfrac{300}{1{,}25} = 240$ TL. Kontrol: Kâr $300 - 240 = 60$ ve $\dfrac{60}{240} = 0{,}25$.
3. Doğru cevap C.

Diğer şıklar: **75** satış fiyatının %25'i alınmış / **225** kâr satış fiyatından hesaplanmış / **275** kâr 25 TL alınmış / **375** kâr maliyet yerine satışa eklenmiş.
:::

:::soru{cevap="B"}
Bir malın fiyatı önce %60 artırılıp sonra %25 azaltılmıştır. Buna göre malın fiyatı başlangıç fiyatına göre yüzde kaç değişmiştir?

- A) %25 azalmıştır
- B) %20 artmıştır
- C) %35 artmıştır
- D) %60 artmıştır
- E) %85 artmıştır

---

1. Fiyat başlangıçta 100 olsun. %60 artışla 160 olur.
2. %25 azalışla $160 \cdot 0{,}75 = 120$ olur.
3. Başlangıç 100 iken son fiyat 120'dir. Fiyat %20 artmıştır. Doğru cevap B.

Diğer şıklar: **%25 azalmıştır** yalnızca indirim alınmış / **%35 artmıştır** yüzdelerin farkı alınmış / **%60 artmıştır** yalnızca artış alınmış / **%85 artmıştır** yüzdeler toplanmış.
:::

:::soru{cevap="E"}
Maliyeti 450 TL olan bir mal, etiket fiyatı üzerinden %25 indirimle 600 TL'ye satılmıştır. Buna göre bu malın etiket fiyatı kaç TL'dir?

- A) 450
- B) 600
- C) 625
- D) 750
- E) 800

---

1. İndirimden sonraki fiyat, etiket fiyatının %75'idir: $\text{Etiket} \cdot 0{,}75 = 600$.
2. $\text{Etiket} = \dfrac{600}{0{,}75} = 800$ TL. Maliyetin (450 TL) bu işlemde rolü yoktur.
3. Doğru cevap E.

Diğer şıklar: **450** maliyet sonuç sanılmış / **600** satış fiyatı sonuç sanılmış / **625** indirim 25 TL sanılmış / **750** indirim yerine zam yapılmış.
:::

## Kendini dene

:::dene
1. 60 sayısının %45'i kaçtır? => $60 \cdot 0{,}45 = 27$.
2. 40, 50'nin yüzde kaçıdır? => $\dfrac{40}{50} \cdot 100 = 80$. %80.
3. Bir fiyat %20 artıp sonra %25 azalırsa toplam değişim nedir? => $1{,}2 \cdot 0{,}75 = 0{,}9$. %10 azalır.
4. 480 TL'ye alınan mal %25 zararla kaç TL'ye satılır? => $480 \cdot 0{,}75 = 360$ TL.
5. 2000 TL yıllık %6 faizle 2 yıl yatırılırsa faiz kaç TL olur? => $\dfrac{2000 \cdot 6 \cdot 2}{100} = 240$ TL.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Yüzde, Kâr ve Zarar Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Yüzde hesabı, yüzde artış ve azalış, art arda yüzde değişimi, kâr ve zarar, etiket fiyatı ve indirim, basit faiz. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 3. sorunun şıkları yüzde etiketli olduğundan anahtar planına bağlı değildir, (b) Basit faiz TYT'de seyrek sorulur.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Yüzde, Kâr ve Zarar Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir bardak limonataya su ekleyince tadı hafifler. Tuzlu suyu kaynatıp suyunu buharlaştırırsan tuz oranı artar. İki farklı yoğunluktaki çözeltiyi karıştırınca ortaya yeni bir yoğunluk çıkar. Karışım problemlerinin hepsinde değişmeyen tek şey şudur: **Saf madde miktarı korunur**. Bu konuda karışım yüzdesini, su ekleme ve buharlaştırmayı ve iki çözeltiyi istenen yoğunlukta karıştırmayı öğreneceksin.

:::hedefler
1. Çözeltideki saf madde miktarını yüzdeden hesaplamak.
2. İki ya da daha fazla çözeltinin karışımının yüzdesini bulmak.
3. Su ekleme ve buharlaştırma problemlerini saf madde sabit kalacak biçimde çözmek.
4. İstenen yoğunlukta karışım için gerekli miktarları bulmak.
5. Eşitleme yöntemiyle karışım oranını hızlı bulmak.
:::

:::ipucu
Her karışım sorusunda üç değeri ayrı ayrı yaz: **toplam miktar**, **yüzde**, **saf madde miktarı**. Saf madde miktarı $= \text{toplam} \cdot \text{yüzde}$ ve karışımda saf maddeler toplanır. Su eklemek ya da buharlaştırmak yalnızca toplamı değiştirir, saf maddeyi değil.
:::

## 1. Çözelti ve yüzde

Bir **çözelti**, bir saf maddenin (tuz, şeker, alkol) su gibi bir sıvıda dağılmasıyla oluşur. Yoğunluk **yüzde** ile verilir.

%20'lik 150 gramlık şekerli suda saf şeker miktarı $150 \cdot 0{,}20 = 30$ gramdır. Geri kalan 120 gram sudur.

$$\text{Saf madde} = \text{Çözelti miktarı} \cdot \text{Yüzde}$$

$$\text{Yüzde} = \dfrac{\text{Saf madde}}{\text{Çözelti miktarı}} \cdot 100$$

## 2. İki çözeltiyi karıştırmak

Karıştırılan çözeltilerin **saf maddeleri toplanır**, **toplam miktarlar** da toplanır. Yeni yüzde, toplam saf maddenin toplam çözeltiye oranıdır.

**Örnek.** 30 litre %20'lik tuzlu su ile 20 litre %45'lik tuzlu su karıştırılıyor. Karışımın yüzdesi kaçtır?

- Birinci çözeltideki tuz: $30 \cdot 0{,}20 = 6$ litre.
- İkinci çözeltideki tuz: $20 \cdot 0{,}45 = 9$.
- Toplam tuz $6 + 9 = 15$ ve toplam çözelti $30 + 20 = 50$.
- Karışımın yüzdesi $\dfrac{15}{50} = 0{,}30$ yani **%30**.

Mantık kontrolü: Karışım, iki çözeltinin yoğunluğu olan %20 ile %45 arasında olmalı. %30 bu aralıktadır ve miktarı fazla olan %20'liğe daha yakındır.

:::ipucu{baslik="Sık yapılan hata"}
İki yüzdenin **aritmetik ortalamasını** almak ($\dfrac{20 + 45}{2} = 32{,}5$) yalnızca miktarlar **eşit** olduğunda doğrudur. Miktarlar farklıysa ağırlıklı ortalama gerekir. Büyük miktar, sonucu kendi yüzdesine doğru çeker.
:::

## 3. Su ekleme

Çözeltiye su eklenirse **saf madde değişmez**, toplam miktar artar ve yüzde düşer.

**Örnek.** 60 litre %30'luk çözeltiye kaç litre su eklenirse %20'lik olur?

- Saf madde $60 \cdot 0{,}30 = 18$ litredir ve eklenen suyla değişmez.
- Yeni toplam $60 + x$ ve yeni yüzde $0{,}20$. Eşitlik: $18 = 0{,}20(60 + x)$.
- $90 = 60 + x$ ve $x = 30$.

30 litre su eklenir. Kontrol: $18 / 90 = 0{,}20$.

## 4. Buharlaşma

Su buharlaşırsa **saf madde değişmez** ama toplam azalır ve yüzde artar.

**Örnek.** %20'lik 150 gramlık şekerli sudan 30 gram su buharlaşıyor. Yeni yüzde kaçtır?

- Şeker 30 gram ve sabit.
- Yeni toplam $150 - 30 = 120$ gram.
- Yeni yüzde $\dfrac{30}{120} = 0{,}25$ yani **%25**.

## 5. İstenen yoğunlukta karışım

İki çözeltiyi karıştırıp belirli bir yoğunluk elde etmek için **eşitleme (haç) yöntemi** kullanılır. Yoğunluklar arasındaki mesafelerin oranı, miktarların **ters** oranıdır.

**Örnek.** %20'lik çözelti ile %50'lik çözelti karıştırılıp %35'lik çözelti yapılacak. 35, 20'ye 15, 50'ye de 15 uzaklıkta, yani eşit uzaklıktadır. Demek ki iki çözeltiden **eşit miktarda** alınmalıdır.

Genel kural: Karışım yüzdesi $m$ ve çözeltiler $a < m < b$ ise

$$\dfrac{\text{a'lık miktarı}}{\text{b'lik miktarı}} = \dfrac{b - m}{m - a}$$

**Örnek.** %20'lik ile %50'lik çözeltiler karıştırılıp %40'lık 60 litre çözelti elde ediliyor. %50'likten kaç litre kullanılmıştır?

- Oran: $\dfrac{\%20\text{'lik}}{\%50\text{'lik}} = \dfrac{50 - 40}{40 - 20} = \dfrac{10}{20} = \dfrac{1}{2}$.
- Toplam 3 parça: 1 parça %20'lik, 2 parça %50'lik. 60 litrenin $\dfrac{2}{3}$'ü, yani 40 litre %50'liktir.

Doğrulama: Tuz $0{,}20 \cdot 20 + 0{,}50 \cdot 40 = 4 + 20 = 24$ ve $0{,}40 \cdot 60 = 24$.

:::baglanti
Burada kullandığın "saf madde toplanır" fikri, "Yüzde Problemleri" ve "Oran Orantı" konularının birleşimidir. Eşitleme yöntemi, ağırlıklı ortalamanın tersine çevrilmiş hâlidir. Miktar çoksa yoğunluk o miktara yakın olur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Saf madde | Toplam $\cdot$ yüzde |
| Karışım | Saf maddeler ve toplamlar ayrı ayrı toplanır |
| Su ekleme | Saf madde sabit, toplam artar |
| Buharlaşma | Saf madde sabit, toplam azalır |
| Eşitleme | Miktar oranı, yoğunluk mesafelerinin tersidir |
| Kontrol | Karışım yüzdesi iki yüzde arasında olmalı |

## Mini test

:::soru{cevap="D"}
20 litre %30'luk tuzlu su ile 30 litre %40'lık tuzlu su karıştırılıyor. Karışımın tuz yüzdesi kaçtır?

- A) %30
- B) %34
- C) %35
- D) %36
- E) %40

---

1. Birinci çözeltideki tuz $20 \cdot 0{,}30 = 6$, ikincideki tuz $30 \cdot 0{,}40 = 12$ litre.
2. Toplam tuz $6 + 12 = 18$ ve toplam çözelti $20 + 30 = 50$ litre.
3. Karışımın yüzdesi $\dfrac{18}{50} = 0{,}36$ yani %36'dır. Doğru cevap D.

Diğer şıklar: **%30** yalnızca birinci çözeltinin yüzdesi alınmış / **%34** miktarlar ters çarpılmış / **%35** yüzdelerin aritmetik ortalaması alınmış / **%40** yalnızca ikinci çözeltinin yüzdesi alınmış.
:::

:::soru{cevap="D"}
40 litrelik %20'lik bir çözeltiye kaç litre su eklenirse çözelti %10'luk olur?

- A) 10
- B) 20
- C) 39
- D) 40
- E) 80

---

1. Saf madde $40 \cdot 0{,}20 = 8$ litredir ve su eklenince değişmez.
2. Eklenen su $x$ ise $8 = 0{,}10(40 + x)$ ve $80 = 40 + x$.
3. $x = 40$ litre. Doğru cevap D.

Diğer şıklar: **10** yüzde değeri sonuç sanılmış / **20** yüzdelerin farkı çarpılmış / **39** işlem hatasıyla bir eksik bulunmuş / **80** yeni toplam hacim sonuç sanılmış.
:::

:::soru{cevap="C"}
100 gram %20'lik şekerli sudan 20 gram su buharlaştırılıyor. Kalan çözeltinin şeker yüzdesi kaçtır?

- A) %16
- B) %20
- C) %25
- D) %33
- E) %40

---

1. Şeker miktarı $100 \cdot 0{,}20 = 20$ gramdır ve buharlaşmayla değişmez.
2. Yeni toplam $100 - 20 = 80$ gramdır.
3. Yeni yüzde $\dfrac{20}{80} = 0{,}25$ yani %25. Doğru cevap C.

Diğer şıklar: **%16** su buharlaştırılmak yerine eklenmiş sanılmış / **%20** buharlaşmanın yüzdeyi değiştirmediği sanılmış / **%33** buharlaşan su iki kez çıkarılmış / **%40** buharlaşan miktar yüzdeye eklenmiş.
:::

:::soru{cevap="E"}
%20'lik ve %50'lik iki çözelti karıştırılarak %40'lık 60 litre çözelti elde ediliyor. Karışımda kaç litre %50'lik çözelti kullanılmıştır?

- A) 12
- B) 20
- C) 24
- D) 30
- E) 40

---

1. Eşitleme: $\dfrac{\%20\text{'lik}}{\%50\text{'lik}} = \dfrac{50 - 40}{40 - 20} = \dfrac{10}{20} = \dfrac{1}{2}$.
2. Toplam 3 parçadan 2'si %50'liktir: $60 \cdot \dfrac{2}{3} = 40$ litre.
3. Kontrol: Tuz $0{,}20 \cdot 20 + 0{,}50 \cdot 40 = 24 = 0{,}40 \cdot 60$. Doğru cevap E.

Diğer şıklar: **12** %20'lik miktarı yanlış alınmış / **20** %20'lik çözelti miktarı bulunmuş / **24** karışımdaki saf madde miktarı alınmış / **30** eşit miktar alınmış.
:::

## Kendini dene

:::dene
1. 80 gram %25'lik tuzlu suda kaç gram tuz vardır? => $80 \cdot 0{,}25 = 20$ gram.
2. 50 litre %10'luk çözelti ile 50 litre %30'luk çözelti karışırsa yüzde kaç olur? => Miktarlar eşit olduğundan ortalama: %20.
3. 100 gram %40'lık çözeltiye 100 gram su eklenirse yüzde kaç olur? => Saf madde 40 gram, toplam 200 gram. $\dfrac{40}{200} = 0{,}20$ yani %20.
4. 200 gram %15'lik şekerli sudan 50 gram su buharlaşırsa yeni yüzde kaç olur? => Şeker 30 gram. Toplam 150 gram. $\dfrac{30}{150} = 0{,}20$ yani %20.
5. %10'luk ve %40'lık çözeltilerden eşit miktar karıştırılırsa yüzde kaç olur? => $\dfrac{10 + 40}{2} = 25$. %25.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-mat' and name = 'Karışım Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Çözelti ve yüzde, karışımlar, su ekleme, buharlaşma, eşitleme (haç) yöntemi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı.
Kontrol edilecekler: (a) Mini test 1 ve 3. soruların şıkları yüzde etiketli olduğundan anahtar planına bağlı değildir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Karışım Problemleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir haber sitesinde, bir okul karnesinde, hava durumu uygulamasında ya da sağlık raporunda mutlaka bir grafik görürsün. Grafik, sayılar tablosunu gözle okunur hâle getirir. TYT'de grafik soruları, **veriyi doğru okumayı**, bir grafikten sayı çıkarmayı ve yüzde, ortalama ya da hız hesabıyla birleştirmeyi ister. Bu konuda sütun, çizgi ve daire grafiklerini, merkez açı hesabını ve hız-zaman grafiklerini öğreneceksin.

:::hedefler
1. Sütun, çizgi ve daire grafiklerinden veri okumak.
2. Daire grafiğinde merkez açı ile miktar arasında dönüşüm yapmak.
3. Grafik verisinden ortalama ve yüzde değişimi hesaplamak.
4. Hız-zaman grafiğinden toplam yolu ve ortalama hızı bulmak.
5. Grafikteki bilgiyle soruda verilen ek bilgiyi birleştirmek.
:::

:::ipucu
Her grafikte önce üç şeye bak: **başlık, eksenler ve birim**. "Binlik" ya da "yüzde" gibi bir birim, aynı sütunun iki farklı anlama gelmesini önler. Okuduğun değerleri hemen bir tabloya yaz, sonra hesap yap.
:::

## 1. Sütun grafiği

Sütun grafiği, ayrı kategorilerin değerlerini yan yana gösterir. Yüksek sütun büyük değerdir.

![Pazartesi 10, Salı 16, Çarşamba 12, Perşembe 20, Cuma 22 adet satış gösteren sütun grafiği](/lessons/tyt-mat/sutun-grafik.svg "Bir mağazanın günlük satışları | Yolumnet")

Bu grafikten şunlar okunur:

- En çok satış cuma günüdür: 22 adet. En az satış pazartesidir: 10 adet.
- Toplam satış $10 + 16 + 12 + 20 + 22 = 80$ adettir.
- **Ortalama** $\dfrac{80}{5} = 16$ adettir. Ortalama, toplamın gün sayısına bölünmesidir.
- En büyük ve en küçük değer arasındaki fark $22 - 10 = 12$'dir.

**Ortalama ile ilgili kural.** Ortalama bilinen $n$ sayıdan biri eksikse **toplamı** bul: $\text{Toplam} = \text{ortalama} \cdot n$. Eksik sayı, toplam ile bilinen sayıların toplamının farkıdır.

## 2. Daire grafiği

Daire grafiği, bir bütünün parçalarını gösterir. Bütün $360°$'dir. Bir dilimin merkez açısı, o parçanın bütündeki payıyla orantılıdır.

$$\text{Miktar} = \dfrac{\text{Açı}}{360} \cdot \text{Toplam} \qquad \text{Açı} = \dfrac{\text{Miktar}}{\text{Toplam}} \cdot 360$$

![240 öğrencinin spor tercihi. Futbol 120 derece, basketbol 90 derece, voleybol 60 derece, yüzme 90 derece](/lessons/tyt-mat/daire-grafik.svg "Daire grafiğinde merkez açı ve kişi sayısı | Yolumnet")

Bu grafikte 240 öğrenci var. Futbol dilimi $120°$ ise $\dfrac{120}{360} \cdot 240 = 80$ öğrenci futbol seçmiştir. Basketbol $90°$ ise 60, voleybol $60°$ ise 40 öğrenci.

**Dilimlerin açıları toplamı 360 olmalıdır.** $120 + 90 + 60 + 90 = 360$. Bir dilimin açısı verilmemişse 360'tan geri kalanı çıkararak bulursun.

Yüzdeyle de ifade edebilirsin. $120°$ dilim bütünün $\dfrac{120}{360} = \dfrac{1}{3}$'ü, yani yaklaşık %33,3'üdür.

## 3. Çizgi grafiği ve değişim yüzdesi

Çizgi grafiği, bir değerin zamanla değişimini gösterir. İki zaman arasındaki **yüzde değişim**, farkın **önceki değere** oranıdır:

$$\text{Yüzde değişim} = \dfrac{\text{Yeni} - \text{Eski}}{\text{Eski}} \cdot 100$$

**Örnek.** Bir değer 18'den 24'e çıkmışsa artış $24 - 18 = 6$ ve yüzde artış $\dfrac{6}{18} \cdot 100 \approx 33{,}3$'tür. Paydada **eski değer** vardır.

:::ipucu{baslik="Sık yapılan hata"}
Yüzde değişimi hesaplarken paydaya **yeni değeri** yazmak çok yapılan bir hatadır. $\dfrac{6}{24} = \%25$ yazmak yanlıştır. Karşılaştırma her zaman başlangıca göredir.
:::

## 4. Hız-zaman grafiği

Hız-zaman grafiğinde yatay eksen zaman, dikey eksen hızdır. Kurala göre:

- Yatay bir çizgi, o sürede hızın **sabit** olduğunu gösterir.
- Hız sıfırsa araç **durmuştur**.
- **Alan = yol.** Hız $\cdot$ zaman, o süredeki yoldur.

**Örnek.** Bir araç 0-2 saat arası 50 km/sa, 2-3 saat arası durmuş, 3-5 saat arası 70 km/sa hızla gidiyor.

| Aralık | Hız (km/sa) | Süre (saat) | Yol (km) |
| --- | --- | --- | --- |
| 0 - 2 | 50 | 2 | 100 |
| 2 - 3 | 0 | 1 | 0 |
| 3 - 5 | 70 | 2 | 140 |
| Toplam | | 5 | 240 |

Ortalama hız $\dfrac{240}{5} = 48$ km/sa'tir. Hızların aritmetik ortalaması $\dfrac{50 + 70}{2} = 60$ olurdu. Bu yanlış sonuçtur, çünkü araç durduğu süreyi ve farklı süreler boyunca gittiği gerçeğini yok sayar. Ortalama hızda **toplam yol / toplam süre** kuralı korunur ve duruş süresi de toplam süreye girer.

:::baglanti
"Hareket Problemleri" konusunda ortalama hızı toplam yol bölü toplam süre olarak tanımladın. Grafik, aynı bilgiyi **görsel olarak** verir. Grafikteki her yatay parçayı bir satır olarak tabloya çevirirsen sorun hareket problemine dönüşür.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Önce | Başlık, eksen ve birim |
| Ortalama | Toplam / adet |
| Daire | Açı toplamı 360, $\text{miktar} = \dfrac{\text{açı}}{360} \cdot \text{toplam}$ |
| Yüzde değişim | Fark / **eski** değer |
| Hız-zaman | Yatay çizgi sabit hız, alan yol |
| Ortalama hız | Toplam yol / toplam süre (duruş dahil) |

## Mini test

:::soru{cevap="A"}
Bir kütüphanedeki 300 kitabın türlere göre dağılımı gösteren daire grafiğinde roman dilimi $150°$, şiir dilimi $90°$ ve geri kalan dilim hikâye türüne aittir. Buna göre kütüphanede kaç hikâye kitabı vardır?

- A) 100
- B) 101
- C) 120
- D) 125
- E) 200

---

1. Hikâye diliminin açısı $360° - 150° - 90° = 120°$ olur.
2. Hikâye kitabı sayısı $\dfrac{120}{360} \cdot 300 = 100$.
3. Doğru cevap A.

Diğer şıklar: **101** işlem hatasıyla bir fazla bulunmuş / **120** hikâye diliminin açısı sayı sanılmış / **125** roman dilimi kitap sayısı alınmış / **200** işlem hatasıyla iki katı bulunmuş.
:::

:::soru{cevap="A"}
Bir mağazanın pazartesiden perşembeye kadar günlük satış adetleri sırasıyla 12, 18, 15 ve 21 olarak sütun grafiğinde gösterilmiştir. Cuma günkü satış adedi de eklendiğinde 5 günlük satışların ortalaması 18 olduğuna göre cuma günü kaç adet satış yapılmıştır?

- A) 24
- B) 25
- C) 48
- D) 66
- E) 90

---

1. Beş günün toplamı $5 \cdot 18 = 90$ olmalıdır.
2. İlk dört günün toplamı $12 + 18 + 15 + 21 = 66$.
3. Cuma günü satış $90 - 66 = 24$ adettir. Doğru cevap A.

Diğer şıklar: **25** işlem hatasıyla bir fazla bulunmuş / **48** işlem hatasıyla iki katı bulunmuş / **66** dört günün toplamı alınmış / **90** beş günün toplamı alınmış.
:::

:::soru{cevap="C"}
Bir şirketin çizgi grafiğinde gösterilen yıllık satış adetleri 2021'de 50, 2022'de 60 ve 2023'te 75 bin adettir. Buna göre 2022'den 2023'e satışlar yüzde kaç artmıştır?

- A) %15
- B) %20
- C) %25
- D) %50
- E) %125

---

1. 2022 ile 2023 arasındaki fark $75 - 60 = 15$ bin adettir.
2. Yüzde artış, farkın **önceki yıla** oranıdır: $\dfrac{15}{60} = 0{,}25$.
3. Satışlar %25 artmıştır. Doğru cevap C.

Diğer şıklar: **%15** fark yüzde sanılmış / **%20** yeni değere bölünmüş / **%50** 2021 ile 2023 karşılaştırılmış / **%125** oran yüzde artış sanılmış.
:::

:::soru{cevap="A"}
Bir araç hız-zaman grafiğine göre ilk 2 saat boyunca 60 km/sa hızla gitmiş, sonraki 1 saat boyunca durmuş, son 2 saat boyunca da 80 km/sa hızla gitmiştir. Buna göre aracın tüm yolculuk boyunca ortalama hızı kaç km/sa'tir?

- A) 56
- B) 60
- C) 70
- D) 80
- E) 280

---

1. İlk 2 saatte yol $60 \cdot 2 = 120$ km. Durma süresinde yol 0. Son 2 saatte yol $80 \cdot 2 = 160$ km.
2. Toplam yol 280 km ve toplam süre $2 + 1 + 2 = 5$ saattir (duruş dahil).
3. Ortalama hız $\dfrac{280}{5} = 56$ km/sa. Doğru cevap A.

Diğer şıklar: **60** yalnızca ilk hız alınmış / **70** hızların aritmetik ortalaması alınmış / **80** yalnızca son hız alınmış / **280** toplam yol sonuç sanılmış.
:::

## Kendini dene

:::dene
1. Bir daire grafiğinde 72° lik dilim bütünün yüzde kaçıdır? => $\dfrac{72}{360} = \dfrac{1}{5}$ yani %20.
2. Bir sınıfta 5 öğrencinin notları 60, 70, 80, 90 ve 100'dür. Ortalama kaçtır? => $\dfrac{400}{5} = 80$.
3. Bir değer 40'tan 50'ye çıkıyor. Yüzde artış kaçtır? => $\dfrac{10}{40} \cdot 100 = 25$. %25.
4. Bir araç 3 saat 40 km/sa, 2 saat 60 km/sa hızla gidiyor. Toplam yolu bul. => $3 \cdot 40 + 2 \cdot 60 = 120 + 120 = 240$ km.
5. Bir daire grafiğinde 150 kişinin 72° lik dilimi kaç kişiyi gösterir? => $\dfrac{72}{360} \cdot 150 = 30$ kişi.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-mat' and name = 'Grafik Problemleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Sütun, çizgi ve daire grafiği okuma, merkez açı, ortalama, yüzde değişim, hız-zaman grafiği. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin özgündür. Örnek ve sorular bu metin için yazıldı, sayısal sonuçlar python ile doğrulandı. Soru kökleri grafikteki veriyi metin olarak verir (görsel soru desteği olmadığı için).
Kontrol edilecekler: (a) "Kendini dene" 5. maddedeki tutarlı olmayan veri örneği öğretici amaçlıdır, (b) Mini test 3. soru yüzde etiketli olduğundan anahtar planına bağlı değildir.$lesson$ from public.topics where subject_id = 'tyt-mat' and name = 'Grafik Problemleri'
on conflict (topic_id) do nothing;
