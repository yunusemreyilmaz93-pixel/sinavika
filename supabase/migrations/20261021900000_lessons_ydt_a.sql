-- YDT İngilizce konu anlatımları. Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bağlaçlar ve bağlantı sözcükleri (conjunctions ve linkers) YDT’nin en geniş etkili konusudur. Dilbilgisi bölümünde iki soru bağlaçtır. **Cümle tamamlama bölümündeki 8 sorunun hepsi** bir bağlaç ya da bağlantı mantığına dayanır. Cloze testte her parçada en az bir bağlantı sözcüğü boşluğu bulunur. Paragraf tamamlama ve anlam bütünlüğünü bozan cümle sorularında da doğru seçeneği bağlantı sözcüğü ele verir. Bu konuyu iyi bilmek, YDT’de onlarca sorunun çözümünde işe yarar. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Bağlaçları ilişkiye göre (karşıtlık, sebep, sonuç, amaç, koşul, zaman, ekleme, örnekleme) gruplamak.
2. Bağlaç (conjunction), bağlantı sözcüğü (linker) ve edat arasındaki farkı cümle yapısından anlamak.
3. While, whereas, although, but, however, even if gibi karşıtlık bağlaçlarını ayırt etmek.
4. Since, as, given that, now that gibi sebep ve zaman bağlaçlarını bağlama göre yorumlamak.
5. Cümle tamamlama sorularında önce ilişkiyi, sonra yapıyı bulup seçeneği seçmek.
6. Noktalama ipucuyla (noktalı virgül ve virgül) bağlantı sözcüğü sorularını çözmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Cümle tamamlama sorusunda **önce bağlaca bak, sonra anlamı çöz**. Bağlaç iki yarı cümle arasındaki ilişkiyi (karşıtlık mı, sebep mi, sonuç mu) söyler. Doğru seçenek her zaman o ilişkiyi kurar. Sınavın 11. ve 12. sorusu olan iki bağlaç sorusunda ise sekiz yılın 16 sorusunun 11’i **karşıtlık** ilişkisiydi.
:::

## 1. YDT’de bağlaç soruları nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. Sınıflandırma ve sayımlar bu kitaptaki sorular tek tek çözülerek yapıldı.

### Dilbilgisi bölümü: 11. ve 12. sorular

Her yıl 11. ve 12. soru bağlaç sorusudur. Sekiz yılda doğru cevaplar şunlardı:

| Yıl | 11. soru | 12. soru |
| --- | --- | --- |
| 2018 | whereas (karşıtlık) | since (sebep) |
| 2019 | while (karşıtlık) | even if (karşıtlık) |
| 2020 | however (karşıtlık) | before (zaman) |
| 2021 | but (karşıtlık) | until (zaman) |
| 2022 | while (karşıtlık) | although (karşıtlık) |
| 2023 | but (karşıtlık) | although (karşıtlık) |
| 2024 | as (zaman) | given that (sebep) |
| 2025 | however (karşıtlık) | while (karşıtlık) |

:::neden-sonuc
- 16 sorunun 11’i karşıtlık => Önce “cümlenin iki yarısı birbirine ters mi?” diye sor. Cevap evetse seçenekleri while, whereas, although, but, however, even if arasında ara.
- While üç, although iki, but iki, however iki, whereas ve even if birer kez doğru => Karşıtlık ailesini bilmek, farklı seçeneklerin farkını bilmek demektir.
- Zaman bağlaçları üç kez, sebep bağlaçları iki kez => Zaman ve sebep geriye kalan beş sorunun tamamı. Bunlar before, until, as, since, given that.
- Doğru seçeneğin cümle içindeki yeri değişiyor => Bazen cümle başında (While most people...), bazen ortada (..., yet ...), bazen noktalı virgülden sonra (..., however, ...). Yapıyı okumak gerekir.
:::

### Cümle tamamlama: 21. - 28. sorular

Çıkmış 64 cümle tamamlama sorusunun **neredeyse hepsinde** cümlenin kökünde ya da seçeneklerin başında bir bağlaç ya da bağlantı sözcüğü vardı. Yaklaşık yarısında bağlaç kökteydi (Although..., Because..., While...), yaklaşık yarısında seçeneklerin başında yer alıyordu (but, so, because, although, even though). Beş soruda ise bağlantı sözcüğü noktalı virgülden sonra geliyordu (however, therefore, as a result gibi).

| Soru türü | Bağlaç nerede | Ne yapmalısın |
| --- | --- | --- |
| Kökte bağlaç var, seçenekler cümle | Although, Because, While, Despite, Even if ile başlayan yarı cümle | Bağlacın kurduğu ilişkiyi bul, ikinci yarıyı o ilişkiye göre seç |
| Kök yarım, seçenekler bağlaçla başlıyor | Seçenekler but, so, because, although, even though ile başlar | Önce kökle ilişkiyi belirle, sonra bağlacı seç, sonra anlamı kontrol et |
| Noktalı virgülden sonra | Kök noktalı virgülle biter, seçenekler however, therefore, nevertheless gibi bir linker ile başlar | Önce kökün söylediğini özetle, sonra ters ya da devam ilişkisini kuran linker’ı seç |

### Cloze testi: bağlantı sözcükleri

Cloze’da her parçadaki beş boşluktan en az biri bağlantı sözcüğüdür: However, For instance, In other words, As a result, Furthermore, On the contrary. Bu boşluklarda **önceki cümleyle sonraki cümle arasındaki ilişkiyi** bulmak gerekir.

## 2. Üç tür bağlantı

İngilizcede cümleleri birbirine bağlayan üç araç vardır. Karıştırmak, bağlaç sorularındaki yanlışların büyük kısmını yaratır.

| Tür | Örnek | Nasıl kullanılır |
| --- | --- | --- |
| Eş değerli bağlaç (coordinating) | and, but, or, so, yet, for, nor | İki cümleyi ya da öğeyi bağlar. Genelde önünde virgül olur |
| Yan cümle bağlacı (subordinating) | although, because, while, if, when, since, unless | Bir yan cümle başlatır. Yan cümle tek başına cümle olmaz |
| Bağlantı sözcüğü (linker) | however, therefore, moreover, for example | İki ayrı cümle ya da noktalı virgülle ayrılmış iki yarı arasına girer, **sonra virgül** gelir |

### Linker için noktalama ipucu

Linker (however, therefore, moreover) tek başına iki cümleyi **birleştiremez**. Önündeki cümle bir nokta ya da noktalı virgülle biter, sonrasında virgül gelir.

- `Robots can lift heavy loads; however, they cannot yet handle delicate objects as well as people.`
- `Robots can lift heavy loads. However, they cannot yet handle delicate objects as well as people.`

Bu yüzden sınavda boşluğun **önünde nokta ya da noktalı virgül, sonrasında virgül** varsa boşluk bir **linker**’dır. Although ve because gibi bağlaçlar bu konumda doğru olmaz.

:::ipucu
Boşluk **noktalı virgülden sonra** ve **virgülden önce** duruyorsa seçenekler arasında “however, therefore, moreover, for example, consequently, instead” gibi linker’ları ara. Although, while, because gibi bağlaçları ele.
:::

### Eş değerli bağlaçlar

| Bağlaç | Anlam | Örnek |
| --- | --- | --- |
| and | ve | She studied hard and passed. |
| but | ama | The test was short, but it was hard. |
| yet | yine de, ama | It was cheap, yet the quality was excellent. |
| or | veya, yoksa | Hurry up, or you will miss the bus. |
| so | bu yüzden | It was late, so we went home. |
| for | çünkü (resmî) | She was tired, for she had worked all day. |
| nor | ne de | He did not call, nor did he write. |

“So” bir sonuç bağlacıdır ve **sonuç cümlesinin başında** gelir. “Because” ise **sebep cümlesinin başında** gelir. Yön ters: “It rained, **so** we stayed home.” = “We stayed home **because** it rained.”

## 3. Karşıtlık ve ödün (contrast ve concession)

Bu grup sınavın en çok sorduğu gruptur.

### Yan cümle bağlaçları

| Bağlaç | Anlam | Not |
| --- | --- | --- |
| although | -e rağmen, -dığı hâlde | En yaygın. Cümle başında ya da ortasında kullanılır |
| though | -e rağmen | Although’la aynı, daha az resmî. Cümle sonunda da “ama” anlamında kullanılabilir |
| even though | -e rağmen | Although’dan **daha güçlü**, gerçek bir olguyu vurgular |
| even if | -se bile | **Varsayımsal** durum, “olsa bile”. Gerçek olmayabilir |
| while | -e karşılık, -dığı hâlde | İki durumu karşılaştırır. Zaman anlamı da vardır |
| whereas | -e karşılık | While’a benzer, yalnızca karşıtlık, zaman anlamı yoktur |
| no matter how, however + sıfat | ne kadar ... olursa olsun | However difficult it is, ... |

“**While**” hem karşıtlık hem zaman bildirir. Karşıtlık anlamında bir yarı cümle ile öteki arasında **zıtlık** olmalıdır: “**While** most students prefer morning classes, some work better in the evening.” (Çoğu öğrenci sabah derslerini tercih ederken bazıları akşam daha verimli çalışıyor.) Zaman anlamında iki eylem aynı anda gerçekleşir: “She read **while** he cooked.”

“**Whereas**” yalnızca karşıtlıktır: “Most residents of the old town work in tourism, **whereas** most residents of the new district work in industry.”

:::baglanti
Even though ile even if’in farkı sınavda sık sorulur. **Even though**: olgu gerçek ve biliniyor. **Even if**: olgu gerçek olmayabilir ya da henüz bilinmiyor. “Even though he is rich, he is unhappy.” (zengin, gerçekten.) “Even if he were rich, he would be unhappy.” (zengin değil, ama olsa bile.)
:::

### Eş değerli bağlaç ve linker

| Sözcük | Tür | Örnek |
| --- | --- | --- |
| but | eş değerli bağlaç | The plan was good, **but** it failed. |
| yet | eş değerli bağlaç | The plan was simple, **yet** it worked. |
| however | linker | The plan was good. **However**, it failed. |
| nevertheless, nonetheless | linker | He was ill. **Nevertheless**, he went to work. |
| still, even so, all the same | linker | It was expensive. **Even so**, she bought it. |
| on the other hand | linker (iki yönü karşılaştırır) | Cars are fast. **On the other hand**, they pollute. |
| in contrast, by contrast | linker | Summers are hot. **In contrast**, winters are cold. |
| on the contrary | linker (öncekini **reddeder**) | He isn’t lazy. **On the contrary**, he works very hard. |
| instead | linker | He didn’t go out. **Instead**, he stayed home. |

:::ipucu{baslik="on the contrary ve on the other hand"}
**On the contrary** bir önceki cümlenin **tam tersini söyler** ve onu reddeder. “Is he lazy? On the contrary, he works day and night.” **On the other hand** ise iki farklı yönü yan yana koyar, birini reddetmez.
:::

### Edat olarak karşıtlık

Despite ve in spite of **edattır**. Sonrasında isim ya da V-ing gelir, cümle gelmez. Ayrıntısı Prepositions konusundadır. Bağlaç mı edat mı ayrımı için her zaman boşluktan sonrasına bak.

## 4. Sebep ve sonuç

### Sebep bağlaçları

| Bağlaç | Anlam | Not |
| --- | --- | --- |
| because | çünkü | En yaygın. Sebep **yeni bilgidir** |
| since | -dığı için | Sebep **bilinen bir bilgidir** |
| as | -dığı için | Sebep bilinen ya da ikinci planda. Zaman anlamı da vardır |
| now that | artık ... olduğu için | Yeni bir durumun sonucu |
| given that, considering that, seeing that | -dığı düşünülürse | Sebep bilinen bir olgu |
| in that | -dığı bakımından (resmî) | Bir yönü açıklar |

“**Since**” iki farklı anlam taşır. Present Perfect ile zaman bildirir (since 2010). Bir cümle başlatıp sebep de bildirebilir: “**Since** the supply is limited, prices are high.” Sınavda “zaman mı sebep mi?” ayrımını ana cümlenin zamanından anla. Present Perfect ve bir tarih ya da dönem varsa zaman. Bilinen bir olgu ve sonuç cümlesi varsa sebep.

“**Given that**” sınavda 2024’te doğru cevaptı. Bilinen bir olguyu sebep gösterir: “**Given that** the region receives very little rain, farmers rely on irrigation.”

### Sonuç sözcükleri

| Sözcük | Tür | Örnek |
| --- | --- | --- |
| so | eş değerli bağlaç | It rained, **so** the match was cancelled. |
| therefore, thus, hence | linker | Prices rose. **Therefore**, demand fell. |
| consequently, as a result, accordingly | linker | The factory closed. **As a result**, many lost their jobs. |
| so ... that, such ... that | yan cümle yapısı | It was **so** cold **that** the lake froze. |

Sebep ve sonuç yönünü karıştırma:

- **Sebep bildiren**: because, since, as, now that, given that (sebep cümlesinin başında).
- **Sonuç bildiren**: so, therefore, thus, consequently, as a result (sonuç cümlesinin başında).

## 5. Amaç

| Kalıp | Sonrası | Örnek |
| --- | --- | --- |
| in order to, so as to | V1 | He saved money **in order to** buy a car. |
| so that, in order that | cümle (can, could, will, would ile) | He left early **so that** he could catch the train. |
| for + V-ing, for + isim | amaç ya da kullanım | This tool is used **for cutting** wood. |

“So that” hem amaç hem sonuç anlamı verir. Amaç bildirirken yan cümlede genelde can, could, will, would bulunur. Sonuç anlamı “so” ile aynıdır.

## 6. Koşul

| Bağlaç | Anlam | Not |
| --- | --- | --- |
| if | eğer | Temel koşul bağlacı |
| unless | -medikçe (if not) | Sonrasında **olumlu** fiil gelir, çünkü zaten olumsuzluk içerir |
| provided (that), providing (that) | şartıyla | Koşulu vurgular |
| as long as, so long as | -dığı sürece, şartıyla | Süre ya da şart |
| on condition that | şartıyla (resmî) | Resmî dil |
| only if | ancak ... ise | Devrik yapı kurabilir |
| in case | -ma ihtimaline karşı | Önlem bildirir, koşul değildir |
| otherwise, or else | aksi hâlde | Linker |
| whether ... or (not) | ... ya da | Seçenek bildirir |

:::ipucu{baslik="unless ile if not"}
“Unless you study, you won’t pass.” = “If you don’t study, you won’t pass.” Unless’ten sonra **olumsuz fiil gelmez**. “Unless you don’t study” yanlıştır.
:::

### In case, if değildir

“**In case**” bir şey **olursa** ne yapacağını söylemez, bir şey **olabilir diye** önceden ne yapacağını söyler.

- `I will take an umbrella in case it rains.` (Yağmur yağabilir diye yanıma alırım.)
- `If it rains, I will stay home.` (Yağmur yağarsa evde kalırım.)

Koşul konusunun ayrıntısı Conditionals konusunda.

## 7. Zaman bağlaçları

| Bağlaç | Anlam | Not |
| --- | --- | --- |
| when | -dığında | Genel |
| while | -erken | İki eylem aynı anda, biri sürekli |
| as | -erken, -dikçe | Eşzamanlılık ya da paralel değişim (as scientists learn more, ... increases) |
| before | -den önce | Sonrasında will gelmez |
| after | -den sonra | |
| until, till | -e kadar | Eylem o ana kadar sürer |
| since | -den beri | Present Perfect ile |
| once | bir kez ... olunca | “Once the data are collected, ...” |
| as soon as | -er etmez | |
| by the time | -diği zamana kadar | Sonrasında will gelmez |
| whenever | her ... -ışında | |
| the moment, the minute | tam ... -diği an | |
| no sooner ... than, hardly ... when | tam ... -mişti ki | Past Perfect ile devrik yapı |

Zaman bağlacından sonra **gelecek zaman için bile** Present Simple kullanılır: “I will call you **when I arrive**.” Ayrıntı Tenses konusunda.

“**As**” iki kullanımda yarar sağlar. “As cities grow, the demand for housing increases.” cümlesinde as, **paralel değişim** bildirir: biri arttıkça öteki artar.

## 8. Ekleme, örnekleme ve açıklama

### Ekleme

| Sözcük | Tür | Not |
| --- | --- | --- |
| and | eş değerli bağlaç | |
| besides, moreover, furthermore, in addition | linker | Benzer bir bilgi ekler |
| what is more | linker | Konuşma dili, ekleme vurgular |
| also, too, as well | zarf | |
| as well as | bağlaç ya da edat | Sonrası isim ya da V-ing |
| not only ... but also | ikili | Correlatives konusunda |

### Örnekleme ve açıklama

| Sözcük | Anlam |
| --- | --- |
| for example, for instance | örneğin |
| such as, like | gibi (cümle içinde) |
| in other words, that is | başka bir deyişle |
| namely | yani, şöyle ki |
| in particular, especially | özellikle |
| in fact, actually | aslında |

### Sıralama ve özet

| Sözcük | Anlam |
| --- | --- |
| first(ly), second(ly), then, next, finally | sıralama |
| in conclusion, to sum up, in short, overall | özetleme |
| briefly | kısaca |

## 9. Cümle tamamlama sorusunu çözme yolu

1. **Bağlacı bul.** Kökte ya da seçeneklerin başında. (Although, while, because, so, but, as a result.)
2. **İlişkiyi söyle.** Tek kelimeyle: karşıtlık, sebep, sonuç, ekleme, amaç, koşul. Bağlaç bir yarı cümlenin yönünü belirler.
3. **Yarı cümleyi anla.** Verilen kısım ne diyor? Aleyhine mi lehine mi?
4. **İlişkiye uyan seçeneği bul.** Kök olumluysa karşıtlık için olumsuz yan, sebep için sonuç yan gerekir.
5. **Dilbilgisini ve konuyu kontrol et.** Özne uyuyor mu, zaman uyuyor mu? Seçenek kökteki konuyla ilgili mi?

:::baglanti
Cümle tamamlama sorusunda yanlış seçenekler genellikle **doğru bilgi** içerir ama kökle **doğru ilişkiyi kurmaz**. “Doğru mu?” diye değil, “bu bağlaçla uyuyor mu?” diye sor.
:::

### Örnek analiz

`Although penguins are birds, ----.`

1. Bağlaç **although**: karşıtlık.
2. İlk yarı: penguenler kuştur. Karşıtlık, kuşlardan beklenen bir özelliğin tersini söylemeli.
3. Doğru yarı: “they cannot fly but they swim very well” (uçamazlar ama çok iyi yüzerler). Kuşlardan beklenen uçmak, bunun tersi söyleniyor.
4. “They lay eggs” gibi bir seçenek doğrudur ama kuş olmanın doğal bir sonucudur, karşıtlık kurmaz.

## 10. Cloze’da bağlantı sözcüğü

Cloze’da boşluk paragrafın ortasında olur. Önceki cümle ve sonraki cümle arasındaki ilişkiye bak.

| İki cümle arasında | Boşluğa gelen |
| --- | --- |
| Beklenti kırılıyor | However, Nevertheless, Yet, Even so |
| Önceki bilgi sebep, sonraki sonuç | Therefore, As a result, Consequently, Thus |
| Aynı yönde ek bilgi | Moreover, Furthermore, In addition, Besides |
| Örnek veriliyor | For instance, For example |
| Aynı bilgi başka sözcüklerle | In other words, That is |
| Önceki fikrin tam tersi | On the contrary, Instead |
| Önceki olumsuz, sonrası alternatif | Otherwise, Instead |

## Aklında kalsın

- Bağlaç sorusunda **önce ilişkiyi** (karşıtlık, sebep, sonuç, koşul, zaman) bul.
- Çıkmış 16 bağlaç sorusunun 11’i **karşıtlıktı**. En çok doğru çıkanlar: while, although, but, however.
- **while**: karşılaştırma, aynı anda. **whereas**: yalnızca karşıtlık. **even though**: gerçek. **even if**: varsayım.
- **Linker** (however, therefore, moreover) tek başına iki cümleyi birleştirmez. Önünde nokta ya da noktalı virgül, sonrasında virgül vardır.
- **Despite ve in spite of** edattır, sonrasında isim ya da V-ing gelir.
- **unless** = if not, sonrasında olumlu fiil gelir. **in case** = önlem.
- Zaman bağlaçlarından sonra **will gelmez**.
- **So** sonuç cümlesini başlatır, **because** sebep cümlesini.
- “Doğru bilgi mi?” değil, “bağlaçla uyuyor mu?” diye sor.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| although ve despite | although + cümle. despite + isim ya da V-ing. |
| because ve because of | because + cümle. because of + isim. |
| while ve whereas | İkisi karşıtlık. Yalnızca while zaman da bildirir. |
| even though ve even if | even though: gerçek olgu. even if: varsayım. |
| however ve but | but eş değerli bağlaç, cümle ortasında. however linker, noktadan ya da noktalı virgülden sonra, ardından virgül. |
| on the contrary ve on the other hand | on the contrary öncekini reddeder. on the other hand iki yönü karşılaştırır. |
| in case ve if | in case: önlem. if: koşul. |
| unless ve if not | Anlam aynı, ama unless’ten sonra olumlu fiil gelir. |
| so ve so that | so: sonuç. so that: amaç (can, could, would ile). |
| since (zaman) ve since (sebep) | Present Perfect ve tarih ya da dönem varsa zaman. Bilinen bir olgu ve sonuç varsa sebep. |
| as (zaman) ve as (sebep) | Bağlama bak. “As it was late, we left” sebep. “As we were leaving, it began to rain” zaman. |
| therefore ve because | therefore sonucu başlatır, because sebebi başlatır. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Dört tanesi dilbilgisi bölümündeki gibi tek boşluklu, dört tanesi cümle tamamlama biçimindedir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="A"}
---- many people believe that multitasking increases productivity, studies suggest that it usually slows people down.

- A) Although
- B) Because
- C) Unless
- D) Once
- E) As long as

---

1. İki yarı cümle **birbirine ters**: insanlar verimli olduğunu düşünüyor, çalışmalar yavaşlattığını gösteriyor. İlişki karşıtlık.
2. Boşluktan sonra özne ve fiil var (many people believe), bu yüzden bağlaç gerekir. **Although** karşıtlık bildirir.
3. Because sebep, unless koşul, once zaman, as long as şart bildirir ve anlam kurmaz. Doğru cevap **Although**.
:::

:::soru{cevap="D"}
Although the museum has a large collection of modern art, ----.

- A) it was founded in 1895 by a group of private collectors
- B) the building also hosts concerts and public lectures every week
- C) it attracts many visitors because of its large collection
- D) most visitors come to see its famous 17th-century paintings
- E) as a result, the number of visitors has increased significantly

---

1. **Although** karşıtlık kurar: modern sanat koleksiyonu büyük, ama bunun **tersine** bir durum bekleniyor.
2. D, koleksiyon büyük olsa da ziyaretçilerin çoğunun başka bir şey için geldiğini söyler. Beklentiyi kırar.
3. A ve B yalnızca bilgi ekler, karşıtlık kurmaz. C kökteki bilgiyi sebep gibi tekrarlar ve although mantığına ters düşer. E’deki as a result sonuç bildirir, although ile uyumsuzdur. Doğru cevap **D**.
:::

:::soru{cevap="C"}
The match was postponed ---- the pitch was covered with snow.

- A) unless
- B) although
- C) because
- D) whereas
- E) so that

---

1. Ertelemenin sebebi sahanın karla kaplı olması. İlişki **sebep-sonuç**.
2. Sebep bildiren bağlaç **because**.
3. Unless koşul, although karşıtlık, whereas karşılaştırma, so that amaç bildirir. Doğru cevap **because**.
:::

:::soru{cevap="B"}
Because much of the Amazon rainforest is difficult to reach, ----.

- A) it supports millions of species of plants and animals
- B) many of its species remain unknown to science
- C) deforestation has been increasing every year
- D) it is the largest rainforest in the world
- E) its rivers carry a huge amount of fresh water to the ocean

---

1. **Because** bir sebep bildirir. Sebep: ormanın büyük bölümüne ulaşmak zor. Boşluk bu sebebin **sonucunu** istiyor.
2. Ulaşılması zor bir yerin doğal sonucu, o yerin yeterince incelenememesidir: birçok türün bilimce bilinmemesi.
3. A, C, D ve E ormanla ilgili doğru bilgiler ama ulaşılmasının zorluğunun sonucu değiller. Doğru cevap **B**.
:::

:::soru{cevap="C"}
Solar power is clean and renewable. ----, it is still expensive to install in many countries.

- A) Therefore
- B) For example
- C) However
- D) Similarly
- E) In addition

---

1. İlk cümle olumlu, ikinci cümle bir **olumsuzluk** getiriyor (hâlâ pahalı). Beklenti kırılıyor, ilişki karşıtlık.
2. Karşıtlık için linker: **However**. Boşluk noktadan sonra, virgülden önce, bu da bir linker’a işaret eder.
3. Therefore sonuç, for example örnek, similarly benzerlik, in addition ekleme bildirir. Doğru cevap **However**.
:::

:::soru{cevap="B"}
Antibiotics can kill many kinds of bacteria ----.

- A) because they were discovered in the 20th century
- B) but they are ineffective against viral infections like the flu
- C) so they are the most common cause of infection
- D) unless the bacteria are harmful to the human body
- E) as long as doctors never prescribe them

---

1. Kök olumlu bir bilgi veriyor. Doğru devam, bu bilgiyi **sınırlayan** bir karşıtlık getirir.
2. B, antibiyotiklerin bakterilere karşı etkili olduğunu söyledikten sonra virüslere karşı etkisiz olduğunu belirtir. But bu ilişkiyi kurar.
3. A, sebep bağlacıyla ilgisiz bir tarih bilgisi verir. C’deki so yanlış bir sonuç çıkarır. D ve E koşul bağlaçlarıyla anlamsız yarı cümleler kurar. Doğru cevap **B**.
:::

:::soru{cevap="A"}
---- the company has already lost a large share of its market, it cannot afford another failed product.

- A) Now that
- B) Even though
- C) Unless
- D) Whereas
- E) Only when

---

1. İlk yarı **bir durum**, ikinci yarı o durumun **sonucudur**: pazar payı kaybedildiği için bir başarısızlığı daha kaldıramaz. İlişki sebep.
2. Sebep bildiren seçenek **Now that** (artık ... olduğu için).
3. Even though ve whereas karşıtlık, unless koşul, only when zaman anlamı verir. Doğru cevap **Now that**.
:::

:::soru{cevap="E"}
Public transport in the city has become faster and cheaper over the years, ----.

- A) unless the city centre is closed to traffic
- B) whereas it is the largest city in the country
- C) because fuel prices fell sharply in 1950
- D) in case there are fewer passengers in winter
- E) so many more people leave their cars at home

---

1. Toplu taşıma hızlanıp ucuzlamış. Doğal devam bir **sonuç**tur: insanlar arabalarını evde bırakıyor.
2. Sonuç bağlacı **so** bu ilişkiyi kurar.
3. A koşul, B karşılaştırma, C yanlış sebep, D önlem bildirir ve hiçbiri toplu taşımanın iyileşmesinden çıkan bir sonuç değildir. Doğru cevap **E**.
:::

:::ipucu{baslik="İpucu"}
Seçenekleri okurken önce **ilk sözcüklerine** bak. Hepsi farklı bağlaçla başlıyorsa soru, ilişkiyi bulma sorusudur. Hepsi aynı yapıyla başlıyorsa anlama ve bilgi sorusudur.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “He didn’t come to the party ---- he was ill.” boşluğa ne gelir? => because (ya da since, as). Sebep ilişkisi.
2. “She is very quiet, ---- her sister is very talkative.” boşluğa ne gelir? => whereas (ya da while, but). İki kişiyi karşılaştırır.
3. “---- you study hard, you won’t pass.” boşluğa ne gelir? => Unless. Sonrasında olumlu fiil gelir.
4. “Take an umbrella ---- it rains.” boşluğa if mi in case mi gelir? => in case. Önlem bildirir.
5. “The film was very long. ----, I enjoyed it.” boşluğa ne gelir? => However (ya da Nevertheless, Even so). Noktadan sonra linker gerekir.
6. “It was ---- cold ---- the lake froze.” boşlukları doldur. => so / that. Sonuç yapısı.
7. “---- the rain, we went out.” despite mi although mı? => Despite. Sonrasında isim öbeği var.
8. “Is he lazy? ----, he works day and night.” on the contrary mi on the other hand mi? => On the contrary. Önceki soruyu reddediyor.
9. “I will call you ---- (arrive).” boşluğa when I arrive mı when I will arrive mı gelir? => when I arrive. Zaman bağlacından sonra will gelmez.
10. While ve whereas arasındaki fark nedir? => İkisi de karşıtlık bildirir. While ayrıca zaman bildirir, whereas yalnızca karşıtlık.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 41, false from public.topics where subject_id = 'ydt-dil' and name = 'Conjunctions ve Linkers';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Koşul cümleleri (conditionals) “eğer ... ise ...” anlamı taşır. İngilizcede koşulun **ne kadar gerçekçi** olduğuna göre dört ana tür vardır ve her türün zaman kuralı farklıdır. YDT’de koşul cümleleri fiil biçimi sorularının içinde (modal + zaman), cümle tamamlamada ve cloze testte karşına çıkar. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Sıfır, birinci, ikinci ve üçüncü tür koşul cümlelerini ve karma (mixed) koşulu kurmak.
2. If cümleciği ile ana cümleciğin zamanlarını eşleştirmek.
3. Koşul cümlelerinde modal ve edilgen yapıyı kullanmak.
4. Devrik koşul yapılarını (Had I known, Should you need, Were he here) tanımak.
5. Unless, provided that, as long as, in case, otherwise, but for gibi koşul bağlaçlarını ayırt etmek.
6. If, when ve whether farkını bilmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Koşul cümleleri sınavda ayrı bir soru olarak değil, **bir boşluğun içinde** çıkar. Bu yüzden önce cümlede **if** (ya da if yerine geçen bir sözcük) var mı diye bak, sonra if cümleciğinin zamanına bak. If cümleciği Simple Past ise ana cümlecik would, if cümleciği Past Perfect ise would have V3 gerekir. Bu eşleşme sorunun yarısını çözer.
:::

## 1. YDT’de koşul cümleleri nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi.

Dilbilgisi bölümünün fiil biçimi sorularından **ikisinde** koşul cümlesi vardı ve ikisi de son iki yıldaydı.

| Yıl | Koşul türü | Kalıp |
| --- | --- | --- |
| 2024 | Birinci tür, edilgen | ... can + V1 ... if they are + V3 |
| 2025 | Üçüncü tür, edilgen | ... could not have + V3 ... if ... had not been + V3 |

Ayrıca bağlaç sorularında **even if** (2019) doğru cevaptı. Koşul cümlesi ayrı bir soru olarak çok sorulmasa da, **seçeneklerde sık sık koşul yapısı sınanır**: if cümleciği Past Perfect ise ana cümlecikte would have, Simple Past ise would. Seçeneklerde bu eşleşmeyi bozan yanlışlar yer alır.

:::neden-sonuc
- İki koşul sorusu da edilgen yapı içeriyor => Koşul cümlesini edilgen ve modal ile birlikte düşün (are misused, had not been introduced).
- 2025’teki soru üçüncü tür => Koşulun en zor türü olan Past Perfect + would have V3’ü iyi bil.
- Modal ana cümlecikte (can damage, could not have continued) => Ana cümlecikte yalnızca will ve would değil, can, could, may, might da gelebilir.
- Seçeneklerde zaman uyumunu bozan yanlışlar var => if cümleciği ile ana cümleciğin zaman çiftini ezberle.
:::

## 2. Dört tür koşul

| Tür | Kullanım | If cümleciği | Ana cümlecik | Örnek |
| --- | --- | --- | --- | --- |
| Sıfır | genel doğru, bilimsel gerçek | Simple Present | Simple Present | If you heat ice, it **melts**. |
| 1. tür | gerçekçi, gelecekte olabilir | Simple Present | will / can / may + V1 | If it rains, we **will stay** home. |
| 2. tür | gerçek dışı, şimdi ya da gelecek | Simple Past | would / could / might + V1 | If I **had** more time, I **would travel**. |
| 3. tür | geçmişte gerçekleşmemiş | Past Perfect | would / could / might + have V3 | If she **had known**, she **would have called**. |
| Karma | geçmiş koşul, şimdiki sonuç | Past Perfect | would + V1 | If he **had studied**, he **would be** a doctor now. |

:::baglanti
Koşulun zamanı tek bir kuralla çözülür: **if cümleciği ana cümlecikten bir adım geriye gider.** Gerçekçi ise present, şimdiye gerçek dışı ise past, geçmişe gerçek dışı ise past perfect.
:::

### Sıfır koşul

Her zaman doğru olan durumlar için. If yerine **when** da kullanılabilir.

- If you mix blue and yellow, you **get** green.
- Water **boils** at 100 degrees if the pressure is normal.

### Birinci tür

Gerçekçi, gelecekte gerçekleşebilir bir olasılık.

- If the bridge **is not repaired**, thousands of residents **will be cut off**.
- If you **leave** now, you **can catch** the train.
- If it **rains**, the match **may be cancelled**.

If cümleciğinde **will kullanılmaz**: “If it will rain” yanlıştır. İstisna: nazik rica ya da ısrar anlamındaki will: “If you **will** wait a moment, I’ll call him.”

### İkinci tür

Şimdi ya da gelecek için gerçek dışı ya da pek mümkün olmayan durum.

- If I **were** rich, I **would buy** a house. (zengin değilim)
- If governments **invested** more, fewer people **would use** cars.

**Were**: if cümleciğinde tüm kişilerle were kullanılabilir (“If I were you”, “If he were here”). Resmî yazıda tercih edilir.

### Üçüncü tür

Geçmişte olmuş ya da olmamış bir şeyin tersi. Sonuç da geçmişte, ama gerçekleşmedi.

- If the explorers **had carried** enough food, they **could have crossed** the mountain.
- If antibiotics **had not been introduced**, populations **could not have continued** to rise.

### Karma koşul

Geçmişteki bir koşul ile **şimdiki** sonuç.

- If she **had accepted** the job last year, she **would be living** in another city now.
- If rail transport **had not been developed**, many cities **would be** much smaller today.

Karma koşulda ipucu sözcüğü ana cümlecikte: **now, today, still, at the moment**.

## 3. Ana cümlecikte modal

Ana cümlecikte yalnızca will ve would değil, **can, could, may, might, must, should** da gelebilir.

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| If + present, **can** + V1 | yetenek, olasılık | If you practise, you **can** improve. |
| If + present, **may** + V1 | ihtimal | If it rains, the match **may** be cancelled. |
| If + past, **could** + V1 | olabilirdi | If I had time, I **could** help. |
| If + past perfect, **could have** V3 | olabilirdi, olmadı | If he had tried, he **could have** won. |
| If + past perfect, **might have** V3 | belki olurdu | If she had left, she **might have** missed it. |

## 4. Edilgen yapı

If cümleciği ya da ana cümlecik edilgen olabilir. Edilgenin zamanı koşulun zamanını izler.

| Tür | Örnek |
| --- | --- |
| 1. tür | If the data **are collected** carefully, the results **will be** reliable. |
| 2. tür | If the road **were repaired**, traffic **would flow** better. |
| 3. tür | If the road **had been repaired**, the accident **would not have happened**. |

## 5. Devrik koşul cümleleri

If'i atarak yardımcı fiili öne alma, resmî dilde yaygındır. Üç kalıp vardır.

| Devrik | If’li karşılığı | Tür |
| --- | --- | --- |
| **Should** you need help, call me. | If you should need help (ya da If you need help) | 1. tür |
| **Were** he here, he would agree. | If he were here | 2. tür |
| **Had** she known, she would have called. | If she had known | 3. tür |

Olumsuz: **Had it not been for** your help, I would have failed. Burada not, özneden **sonra** gelir.

:::ipucu
Cümle **Had**, **Were** ya da **Should** ile başlıyor, soru değil ve if yoksa, bu bir devrik koşul cümlesidir. If ve devrik yapıyı **birlikte** kullanma: “If had I known” yanlıştır.
:::

## 6. Koşul bağlaçları

| Bağlaç | Anlam | Not |
| --- | --- | --- |
| if | eğer | Genel |
| unless | -medikçe (if not) | Sonrası olumlu fiil: **Unless** you leave now, you will miss it. |
| provided / providing (that) | şartıyla | Koşulu vurgular |
| as long as, so long as | -dığı sürece | Süre ve şart |
| on condition that | şartıyla (resmî) | |
| supposing, suppose (that) | diyelim ki | Hipotetik |
| in case | -ma ihtimaline karşı | Önlem. If değildir |
| otherwise, or else | aksi hâlde | Linker |
| only if | ancak ... ise | Devrik yapı kurabilir |
| even if | -se bile | Karşıtlık ve koşul |
| if only | keşke | Wish anlamı |

### Unless

**Unless = if not.** “Unless you study, you will fail.” = “If you don’t study, you will fail.” Unless’ten sonra olumsuz fiil gelmez.

### In case

“**In case** it rains, take an umbrella.” Yağmur yağabilir diye önlem: yağmur yağmadan **önce** umbrella alınır. If ise yağmur **yağarsa** yapılacak şeyi anlatır.

### Otherwise

**Otherwise** bir linker’dir. Önceki cümlenin **tersini** söyler: “Leave now. **Otherwise**, you will miss the train.” Yani “Leave now. If you don’t leave now, you will miss the train.”

## 7. If’siz koşul

Bazı sözcük ve ifadeler if yerine geçer.

| İfade | Anlam | Örnek |
| --- | --- | --- |
| without | -sız | **Without** your help, I would fail. |
| but for | -ler olmasaydı | **But for** the scholarship, he would not have studied. |
| if it weren’t for | -ler olmasaydı (şimdiki) | **If it weren’t for** the rain, we would go. |
| if it hadn’t been for | -ler olmasaydı (geçmiş) | **If it hadn’t been for** the rain, we would have gone. |
| with | -ile | **With** more time, I could finish. |

## 8. If, when ve whether

| Sözcük | Kullanım | Örnek |
| --- | --- | --- |
| if | gerçekleşme **belirsiz** | If it rains, we will stay. |
| when | gerçekleşme **kesin** | When it rains, the river rises. |
| whether | iki seçenek, **bilmiyorum** | I don’t know whether he agrees or not. |

If ve whether dolaylı soruda karışır. “I wonder **if / whether** he knows” iki biçim de kullanılır. “Whether … or not” kalıbında resmî yazıda whether tercih edilir.

## 9. Koşul cümlesi ve haber aktarma

Haber aktarmada koşul cümlesi bir adım geriye gider.

- “If I **have** time, I **will** help.” => She said that if she **had** time, she **would** help.
- “If I **had** known, I **would have** told you.” => Üçüncü tür değişmez. She said that if she **had known**, she **would have told** me.

## 10. Çözüm yolu

1. **If cümleciğini ya da if yerine geçen ifadeyi bul.** Had, Were, Should, Unless, Provided, Without, But for, Otherwise.
2. **If cümleciğinin zamanına bak.** Present, past, past perfect?
3. **Ana cümlecik için eşleşen kalıbı seç.** will, would, would have.
4. **İpucu sözcük ara.** Last year, now, today, yesterday.
5. **Edilgen mi?** Özne eylemi yapıyor mu?
6. **Seçenekleri sına.** If cümleciğinde will ya da would gelen seçenekleri hemen ele.

## Aklında kalsın

- **1. tür**: If + present, will V1. If cümleciğinde will yok.
- **2. tür**: If + past, would V1. If I **were**.
- **3. tür**: If + past perfect, would have V3.
- **Karma**: If + past perfect, would V1 (now, today).
- **Sıfır**: If + present, present. Genel gerçekler.
- **Devrik**: Should + özne (1), Were + özne (2), Had + özne (3).
- **Unless** = if not. Sonrası olumlu fiil.
- **In case** = önlem. **Otherwise** = aksi hâlde (linker).
- **Provided that / as long as** = şartıyla.
- **Without / but for** = if’siz koşul.
- **Even if** = varsayımsal karşıtlık.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| If it will rain | **If it rains** (will yok) |
| If I would have time | **If I had time** (would yok) |
| If I had known, I would told | **would have told** |
| If he would study, he would pass | **If he studied, he would pass** |
| Unless you don’t study | **Unless you study** |
| If had I known | **Had I known** ya da **If I had known** |
| in case ve if | in case: önlem. if: koşul sonucu. |
| unless ve if not | Anlam çoğunlukla aynı, ama unless’ten sonra olumlu fiil gelir. |
| if ve when | if: belirsiz. when: kesin. |
| I wish I would have time | **I wish I had time** |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Çoğu iki boşluklu.

:::soru{cevap="A"}
If the bridge ---- before the winter, thousands of residents ---- cut off from the city.

- A) is not repaired / will be
- B) does not repair / will be
- C) will not be repaired / are
- D) had not repaired / would be
- E) was not repaired / will be

---

1. Gerçekçi bir gelecek olasılığı: **birinci tür koşul**. If cümleciği Simple Present, ana cümlecik will.
2. Köprü kendini tamir etmez, **tamir edilir**: edilgen, **is not repaired**. Sakinler de **cut off** edilir: will **be** cut off.
3. B etkendir. C’de if cümleciğinde will var. D ve E zamanları uyumlu değil. Doğru cevap **is not repaired / will be**.
:::

:::soru{cevap="B"}
If governments ---- much more money in public transport next year, fewer people ---- private cars in the city centre.

- A) will invest / would use
- B) invested / would use
- C) had invested / would use
- D) invest / would have used
- E) were investing / used

---

1. Gerçeğe uymayan ya da pek mümkün olmayan bir durum, şimdi ya da gelecek için: **ikinci tür koşul**.
2. İkinci türde if cümleciği **Simple Past**, ana cümlecik **would + V1**: invested / would use.
3. **Next year** gelecekle ilgili olduğu için C’deki had invested (geçmiş koşul) uymaz. A’da if cümleciğinde will var. D üçüncü türe ait bir ana cümlecik içeriyor. E’de ana cümlecikte would eksik. Doğru cevap **invested / would use**.
:::

:::soru{cevap="C"}
If the explorers ---- enough food, they ---- the mountain last winter.

- A) carried / could cross
- B) had carried / could cross
- C) had carried / could have crossed
- D) have carried / would have crossed
- E) carried / would have crossed

---

1. **Last winter** geçmişte gerçekleşmemiş bir durumu gösteriyor: **üçüncü tür koşul**.
2. Üçüncü türde if cümleciği **Past Perfect**, ana cümlecik **could / would + have V3**: had carried / could have crossed.
3. B karma koşul gibi görünür ama “last winter” geçmişe işaret eder. A, D ve E’de if cümleciğinin zamanı uyumsuz. Doğru cevap **had carried / could have crossed**.
:::

:::soru{cevap="E"}
If she ---- the job offer last year, she ---- in a different city now.

- A) accepts / would live
- B) accepted / would have lived
- C) would accept / lives
- D) had accepted / would have lived
- E) had accepted / would be living

---

1. **Last year** geçmişteki koşulu, **now** şimdiki sonucu gösteriyor: **karma koşul**.
2. If cümleciği **Past Perfect** (had accepted), ana cümlecik **would + V1** ya da **would be V-ing** (şimdi): would be living.
3. D’de would have lived geçmiş sonucu anlatır ve “now” ile uyuşmaz. A, B ve C’de if cümleciği uymuyor. Doğru cevap **had accepted / would be living**.
:::

:::soru{cevap="D"}
---- the committee reconsidered, the project would have been approved.

- A) If
- B) Should
- C) Were
- D) Had
- E) Unless

---

1. Ana cümlecikte **would have been approved**: üçüncü tür koşul. If cümleciği Past Perfect olmalı.
2. Sorudaki cümle **if olmadan** başlıyor ve yardımcı fiil öne alınmış: devrik koşul. Üçüncü türde devrik kalıp **Had + özne + V3**.
3. A seçeneğiyle cümle “If the committee reconsidered” olur, yani Simple Past kalır ve would have been approved ile uyuşmaz (üçüncü türde Past Perfect gerekir). Should birinci türe, Were ikinci türe aittir. Unless olumsuz bir koşul bildirir ve anlama uymaz. Doğru cevap **Had**.
:::

:::soru{cevap="A"}
The factory will remain open ---- it receives enough orders to cover its costs.

- A) provided that
- B) unless
- C) in case
- D) even if
- E) so that

---

1. Fabrikanın açık kalması bir **şarta** bağlı: yeterli sipariş gelmesi. Bu şart olumlu söyleniyor.
2. Olumlu şart için **provided that** (şartıyla) kullanılır.
3. B tam tersini söylerdi: sipariş alamadıkça açık kalır. C önlem, D varsayımsal karşıtlık, E amaç bildirir. Doğru cevap **provided that**.
:::

:::soru{cevap="C"}
---- the scholarship, he would not have been able to attend university.

- A) Unless
- B) If not
- C) But for
- D) In case of
- E) As long as

---

1. “Bursu olmasaydı üniversiteye gidemezdi” anlamı kuruluyor: **if’siz üçüncü tür koşul**.
2. If yerine geçen, isimle kullanılan kalıp: **But for** the scholarship (burs olmasaydı).
3. A ve B cümle ister. D önlem bildirir. E olumlu şart bildirir ve anlama uymaz. Doğru cevap **But for**.
:::

:::soru{cevap="B"}
Water ---- at 100 degrees Celsius unless the pressure ---- .

- A) boiled / changes
- B) boils / changes
- C) will boil / will change
- D) is boiling / changed
- E) has boiled / had changed

---

1. Bilimsel bir gerçek: **sıfır koşul**. Ana cümlecik Simple Present: **boils**.
2. **Unless** cümleciğinde de genel gerçek için Simple Present kullanılır: unless the pressure **changes** (basınç kendiliğinden değişir, etken fiil).
3. A geçmiş zaman, C ve D gelecek ya da süreklilik, E ise Present Perfect ve Past Perfect karışımı. Doğru cevap **boils / changes**.
:::

:::ipucu{baslik="İpucu"}
Koşul sorusunda **if cümleciğinin zamanı ana cümleciği belirler**. Birini bulduğunda ötekini bulursun. Seçeneklerde will ya da would geçen if cümleciklerini hemen ele.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “If it ---- tomorrow, we will stay home.” (rain) => rains.
2. “If I ---- you, I would accept.” (be) => were.
3. “If she ---- earlier, she would have caught the train.” (leave) => had left.
4. “If I had enough money, I ---- a car.” (buy) => would buy.
5. “---- you study, you won’t pass.” (unless / if) => Unless.
6. “Take an umbrella ---- it rains.” (önlem, in case / if) => in case.
7. “---- I known, I would have helped.” (devrik) => Had.
8. “If he had worked harder, he ---- a doctor now.” (be) => would be.
9. “---- the rain, we would have gone.” (olmasaydı) => But for (ya da Without).
10. “If you heat ice, it ----.” (melt, sıfır koşul) => melts.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 32, false from public.topics where subject_id = 'ydt-dil' and name = 'Conditionals';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sıfatlar (adjectives) isimleri tanımlar: a **crucial** factor, an **unprecedented** opportunity, an **independent** discipline. YDT’de sıfat dilbilgisi sorusu olarak çıkmaz ama **kelime bilgisi bölümünün her yıl ikinci sorusu** her zaman bir sıfat sorusudur. Bu yüzden sıfatları hem kuralları hem de sınavda sorulan sözcükleri açısından bilmek gerekir. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Sıfatın cümledeki yerini (isimden önce, bağlama fiilinden sonra, something’den sonra) bilmek.
2. Sıfat sırasını (görüş, boyut, yaş, şekil, renk, köken, malzeme, amaç) kurmak.
3. -ing ve -ed sıfatları ile bileşik sıfatları (five-year-old) doğru kullanmak.
4. Sıfat ile zarf arasındaki farkı (smells wonderful, works hard) ayırt etmek.
5. Derecelendirilebilen (gradable) ve derecelendirilemeyen (ungradable) sıfatları ayırt etmek.
6. Sınavda sorulan sıfatları ve eşanlamlılarını tanımak.
:::

:::ipucu{baslik="Sınavda bu konu"}
Kelime bilgisi bölümünün 2. sorusu sekiz yılın sekizinde **sıfat sorusuydu**. Seçeneklerin hepsi sıfat olduğu için dilbilgisi değil **anlam** soruyorlar. Cümledeki isme bak: o isim hangi sıfatla doğal bir kalıp kurar? (crucial factor, unprecedented opportunities, damaging effects).
:::

## 1. YDT’de sıfat nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki kelime bilgisi sorularına bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. Her yıl kelime bilgisi bölümü beş soru ile başladı ve **ikinci soru her yıl bir sıfat sorusuydu**.

| Yıl | Doğru sıfat | Kalıp |
| --- | --- | --- |
| 2018 | crucial | a crucial factor |
| 2019 | damaging | damaging effects |
| 2020 | independent | an independent discipline |
| 2021 | disastrous | proved disastrous |
| 2022 | abundant | abundant and readily available |
| 2023 | visible | still visible |
| 2024 | crucial | is crucial |
| 2025 | unprecedented | unprecedented opportunities |

:::neden-sonuc
- Sekiz yılın sekizinde ikinci soru sıfat => Sıfat bilgisi garantili 1 soru demek.
- Crucial iki kez doğru çıktı (2018 ve 2024) => Sınavın sevdiği sıfatları tanımak getiri sağlar.
- Seçenekler aynı kelime sınıfından (hepsi sıfat) => Dilbilgisi ipucu yok, anlam ve kalıp belirleyici.
- Doğru sıfatlar çoğunlukla akademik ve nötr (crucial, independent, abundant, visible) => Gündelik sıfatlardan çok akademik sıfatlar öncelikli.
:::

### Çıkmış sorularda doğru çıkan sıfatlar

| Sıfat | Anlam | Örnek kullanım |
| --- | --- | --- |
| crucial | çok önemli, belirleyici | a **crucial** factor in the decision |
| damaging | zarar verici | **damaging** effects on health |
| independent | bağımsız | an **independent** discipline |
| disastrous | felaket getiren | proved **disastrous** for the economy |
| abundant | bol | **abundant** natural resources |
| visible | görünür | still **visible** in modern cities |
| unprecedented | eşi görülmemiş | **unprecedented** growth |

Bu yedi sözcüğü kendi cümlenle yaz. Yeni bir sözcük öğrendiğinde yanına hep **birlikte kullanıldığı ismi** yaz.

## 2. Sıfatın yeri

### İsimden önce

Çoğu sıfat ismin **önünde** kullanılır: a **large** company, a **crucial** decision.

### Bağlama fiilinden sonra

Sıfat **be, become, seem, appear, look, feel, sound, taste, smell, get, grow, turn, remain** gibi bağlama fiillerinden sonra da kullanılır.

- The soup smells **wonderful**. (zarf değil, sıfat)
- She seems **tired**.
- It became **clear** that prices would rise.

:::baglanti
Bağlama fiilinden sonra **sıfat**, eylem fiilinden sonra **zarf** gelir. “She looks **angry**” (görünüşü) ama “She looked at me **angrily**” (bakış biçimi).
:::

### Something, anything, nothing’ten sonra

Bu zamirlerin ardından sıfat **sonra** gelir: something **interesting**, nothing **new**, someone **special**, anything **useful**.

### İsimden sonra gelen sıfatlar

Bazı sıfatlar ismin arkasında da kullanılır: **available** (the only tickets available), **possible** (the best method possible), **present**, **responsible**.

## 3. Sıfat sırası

Birden fazla sıfat kullanılırsa belirli bir sıra izlenir.

| Sıra | Tür | Örnek |
| --- | --- | --- |
| 1 | Görüş (opinion) | beautiful, awful, useful |
| 2 | Boyut (size) | large, small, tiny |
| 3 | Yaş (age) | old, new, ancient |
| 4 | Şekil (shape) | round, square, flat |
| 5 | Renk (colour) | red, blue, green |
| 6 | Köken (origin) | Turkish, Italian, Greek |
| 7 | Malzeme (material) | wooden, silk, plastic |
| 8 | Amaç (purpose) | cooking, sleeping, racing |

Ezberlemek için: **Görüş Boyut Yaş Şekil Renk Köken Malzeme Amaç**.

- a **beautiful round wooden** table
- a **small old red Italian** sports car
- a **lovely long white** dress

Sıfat sırası okuma ve çeviride bilinmesi gereken bir kuraldır.

## 4. -ing ve -ed sıfatları

| -ing sıfatı | -ed sıfatı |
| --- | --- |
| Bir şeyin yarattığı etki | Birinin hissettiği duygu |
| The lecture was **boring**. | The students were **bored**. |
| a **surprising** result | **surprised** researchers |
| a **frightening** experience | **frightened** children |
| **exciting** news | **excited** fans |

Participle konusunda ayrıntılıdır. Burada önemli olan: sıfat **neden** olan şeyse -ing, **hisseden** kişiyse -ed.

## 5. Bileşik sıfatlar

Birden fazla sözcükten oluşan sıfatlar tire ile yazılır ve içindeki sayı **çoğul olmaz**.

| Bileşik sıfat | Örnek |
| --- | --- |
| sayı + isim | a **five-year-old** child, a **ten-minute** walk, a **three-day** trip |
| isim + V-ing | a **time-consuming** task, an **awe-inspiring** view |
| isim + V3 | a **hand-made** gift, a **home-made** cake |
| sıfat + isim-ed | a **kind-hearted** man, a **cold-blooded** animal |
| sıfat + isim | **long-term** plans, a **full-time** job |
| zarf + V3 | a **well-known** author, a **highly paid** job, a **newly built** school |

:::ipucu{baslik="Tuzak"}
“A five-years-old child” yanlıştır, çünkü sıfat olan sözcük çoğul olmaz. Doğrusu **a five-year-old child**. Ama “The child is five years old” cümlesinde isim olarak çoğul kullanılır.
:::

## 6. Sıfat ve zarf farkı

| Sıfat | Zarf | Fark |
| --- | --- | --- |
| hard | hard / hardly | hard (çok): He works hard. hardly (neredeyse hiç): He hardly works. |
| late | late / lately | late (geç): She arrived late. lately (son zamanlarda): I haven’t seen him lately. |
| near | near / nearly | near (yakın): Don’t come too near. nearly (neredeyse): nearly finished. |
| high | high / highly | high (yüksek): She jumped high. highly (çok): highly effective. |
| fast | fast | He drives fast. (fastly yoktur) |
| good | well | She speaks English well. |

## 7. Derecelendirilebilir ve derecelendirilemeyen sıfatlar

**Gradable** sıfatlar derecelenir: cold, tired, interesting, important. **Very, quite, rather, extremely, fairly** ile kullanılır.

**Ungradable** (uç noktadaki) sıfatlar derecelenmez: impossible, perfect, unique, essential, freezing, exhausted, fantastic. **Absolutely, completely, totally, utterly** ile kullanılır.

| Gradable | Ungradable (uç) |
| --- | --- |
| cold | freezing |
| tired | exhausted |
| good | excellent |
| big | huge |
| bad | terrible |
| surprised | astonished |

- It was **very cold**. / It was **absolutely freezing**.
- “Very impossible” yanlıştır, doğrusu “absolutely impossible”.

## 8. Sıfat + edat

Sıfatların bir kısmı belirli bir edatla kullanılır (Prepositions konusunda ayrıntılı).

| Kalıp | Anlam |
| --- | --- |
| aware of | farkında |
| capable of | yapabilecek |
| responsible for | sorumlu |
| similar to | benzer |
| different from | farklı |
| essential to / for | gerekli |
| vulnerable to | savunmasız |
| kind to / hostile to | nazik / düşmanca |
| famous for | ünlü |
| interested in | ilgili |

## 9. Sıfat önekleri ve sonekleri

Bir sözcüğün sıfat olup olmadığını çoğunlukla sonekten anlayabilirsin.

| Soneklar | Örnek |
| --- | --- |
| -ful | useful, powerful, careful |
| -less | useless, harmless, endless |
| -able, -ible | reliable, visible, possible |
| -ive | effective, active, decisive |
| -al | national, annual, vital |
| -ous | various, famous, dangerous |
| -ic | economic, scientific, historic |
| -ary, -ory | necessary, satisfactory |
| -ent, -ant | dependent, important |
| -y | healthy, windy |
| -ing, -ed | interesting, tired |

Olumsuz önekler: **un-** (unusual, unprecedented), **in-/im-/il-/ir-** (inactive, impossible, illegal, irregular), **dis-** (dishonest), **non-** (non-profit).

## 10. Sıfatla ilgili sınav tuzakları

| Tuzak | Açıklama |
| --- | --- |
| Çeldirici sıfat anlamca yakın ama kalıba uymuyor | A **crucial** factor ama a **vital** factor da olur. İkisi aynı anlamda ise seçeneklerde yalnızca biri bulunur. |
| Çeldirici olumsuz anlam taşıyor | Cümle olumlu bir bağlamsa damaging gibi olumsuz sıfatları ele. |
| Çeldirici başka kelime sınıfı | Sınavda kelime bilgisi sorularının seçenekleri aynı sınıftan olur. |
| Eşanlamlılar | crucial = vital = essential = critical, abundant = plentiful = ample |

## 11. Çözüm yolu

1. **Boşluktan sonra gelen ismi bul.** Bu isimle hangi sıfat doğal kalıp kurar?
2. **Cümlenin tonuna bak.** Olumlu mu olumsuz mu? Sebep-sonuç var mı?
3. **Bağlayıcıları kontrol et.** Although, but, however: karşıtlık varsa tersi sıfat gerekir.
4. **Seçenekleri tek tek cümleye koy.** Doğal duyulanı seç.
5. **Anlamını bilmediğin sözcükleri ele.** Bildiklerinle çalış.

## Aklında kalsın

- Kelime bilgisi bölümünün **2. sorusu** sıfat sorusu.
- Sıfat ismin önünde, bağlama fiilinden sonra, something’den sonra.
- Sıfat sırası: **görüş, boyut, yaş, şekil, renk, köken, malzeme, amaç**.
- **-ing**: neden olan. **-ed**: hisseden.
- Bileşik sıfat tireli ve sayı tekil: a **five-year-old** child.
- **hard / hardly**, **late / lately**, **near / nearly**, **high / highly**: sıfat ve zarf anlam farkı.
- **very** gradable sıfatlarla, **absolutely** ungradable sıfatlarla.
- Sınavda çıkan sıfatlar: **crucial, damaging, independent, disastrous, abundant, visible, unprecedented**.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| She looks angrily | **She looks angry** |
| He works hardly | **He works hard** |
| a five-years-old child | **a five-year-old child** |
| something interesting ve interesting something | **something interesting** |
| very impossible | **absolutely impossible** |
| the poors | **the poor** |
| a bored lecture | **a boring lecture** |
| I am boring | **I am bored** |
| more better | **better** |
| more cheaper | **cheaper** |
| the most unique | **unique** (derecelendirilemez) |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="C"}
She bought a ---- table for her new apartment.

- A) wooden round beautiful
- B) round beautiful wooden
- C) beautiful round wooden
- D) wooden beautiful round
- E) round wooden beautiful

---

1. Üç sıfat var: görüş (beautiful), şekil (round), malzeme (wooden).
2. Sıra: **görüş, şekil, malzeme**. Beautiful round wooden.
3. Diğer seçeneklerde bu sıra bozuk. Doğru cevap **beautiful round wooden**.
:::

:::soru{cevap="C"}
The soup smells ---- , but it tastes ---- .

- A) wonderfully / terribly
- B) wonderful / badly
- C) wonderful / terrible
- D) wonderfully / terrible
- E) wonderfully / badly

---

1. **Smell** ve **taste** burada bağlama fiilidir. Bağlama fiilinden sonra **sıfat** gelir: smells **wonderful**, tastes **terrible**.
2. Zarf (wonderfully, terribly, badly) bağlama fiilinden sonra kullanılmaz.
3. A, B, D ve E’de en az bir zarf var. Doğru cevap **wonderful / terrible**.
:::

:::soru{cevap="A"}
She has a ---- daughter who is learning to read.

- A) five-year-old
- B) five-years-old
- C) five years old
- D) five-year-olds
- E) five year old

---

1. Boşluk ismin (daughter) önünde ve bir yaş bildiriyor. Bu bir **bileşik sıfat**.
2. Bileşik sıfatta sayıdan sonra gelen isim çoğul olmaz ve tire ile yazılır: **five-year-old**.
3. B’de çoğul years var. C ve E’de tire eksik. D’de çoğul ek var. Doğru cevap **five-year-old**.
:::

:::soru{cevap="B"}
The government plans to build more homes for ---- , who cannot afford to rent a flat.

- A) poor
- B) the poor
- C) poors
- D) a poor
- E) poorly

---

1. Cümlede “kiralayamayan” bir **grup insan** anlatılıyor. **The + sıfat** bir grup insanı gösterir.
2. Bir sınıf insanı anlatan kalıp: **the + sıfat** (the poor, the rich, the elderly).
3. A, C ve D yapıya uymuyor. E zarf. Doğru cevap **the poor**.
:::

:::soru{cevap="A"}
The room is not ---- for fifty people, so some guests will have to stand.

- A) big enough
- B) enough big
- C) too big
- D) so big
- E) enough bigger

---

1. **Enough** sıfattan **sonra** gelir: big **enough** (yeterince büyük).
2. Olumsuz cümlede bu yapı “yeterince büyük değil” anlamı verir.
3. B’de enough sıfattan önce. C, D ve E’de “bazı konuklar ayakta kalacak” sonucuyla uyum yok. Doğru cevap **big enough**.
:::

:::soru{cevap="E"}
The new model is ---- more reliable than the old one, but it is also ---- expensive.

- A) very / much
- B) much / far
- C) more / very
- D) very / very
- E) much / very

---

1. **Karşılaştırma sıfatı (more reliable)** **much / far / a lot** ile pekiştirilir, very ile değil: **much more reliable**.
2. **Expensive** derecelenebilir bir sıfattır: **very expensive**.
3. A’da very more, B’de far expensive, C’de more reliable fazlalığı, D’de very more yanlış. Doğru cevap **much / very**.
:::

:::soru{cevap="D"}
Without any equipment, the task was ---- impossible.

- A) very
- B) more
- C) extremely
- D) absolutely
- E) fairly

---

1. **Impossible** uç noktadaki, derecelendirilemeyen bir sıfattır.
2. Ungradable sıfatlar **absolutely, completely, totally** ile pekiştirilir.
3. Very, extremely ve fairly gradable sıfatlarla kullanılır. More karşılaştırma yapar. Doğru cevap **absolutely**.
:::

:::soru{cevap="B"}
I’m looking for something ---- to read on the plane.

- A) interested
- B) interesting
- C) interest
- D) interestingly
- E) more interested

---

1. Boşluktan önce **something** var. Sıfat bu zamirden **sonra** gelir: something **interesting**.
2. Okunacak şey ilgi çekici olmalı: -ing sıfatı.
3. Interested hisseden kişiyi anlatır. Diğerleri sıfat değil ya da yapıya uymaz. Doğru cevap **interesting**.
:::

:::ipucu{baslik="İpucu"}
Kelime bilgisi sorusunda **ismin bütün çevresine bak**. Hangi sıfat bu isimle doğal bir kalıp kurar? Kalıbı kulağına tanıdık gelen seçeneği seç. Dil duygusu gerçek metin okudukça gelişir.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “It was a ---- day.” (tiring mi tired mı?) => tiring.
2. “The students were ---- by the lecture.” (bored mu boring mi?) => bored.
3. “She looks ---- today.” (happy mi happily mi?) => happy.
4. “a ---- walk” (on dakikalık) => ten-minute.
5. “something ----” (yeni) => new (something new).
6. “The task was ---- impossible.” (absolutely mi very mi?) => absolutely.
7. “He works ----.” (çok çalışıyor) => hard.
8. “He ---- works.” (neredeyse hiç çalışmıyor) => hardly.
9. “a c---- factor in the decision” (çok önemli, c ile başlar) => crucial.
10. “The effects on health were d----.” (zarar verici, d ile başlar) => damaging.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 30, false from public.topics where subject_id = 'ydt-dil' and name = 'Adjectives';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Zamirler (pronouns), bir ismin yerini tutan sözcüklerdir: he, them, mine, itself, each other, one, that of. YDT’nin dilbilgisi bölümünde ayrı bir zamir sorusu yoktur, ama zamirler **okumanın, çevirinin ve cümle bağlama sorularının** temelidir. Bir zamirin neye gönderme yaptığını yanlış anlarsan paragraf tamamlama, anlamı bozan cümle ve çeviri sorularında yanılırsın. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Kişi, iyelik, dönüşlü ve karşılıklı zamirleri doğru seçmek.
2. Ayırıcı zamirleri (this, that, one, ones, the one) cümlede doğru kullanmak.
3. That of ve those of gibi karşılaştırma zamirlerini tanımak.
4. It’in farklı görevlerini (boş özne, önceden haber veren özne) ayırt etmek.
5. Belirsiz zamirleri (someone, anybody, everything, nothing) ve fiil uyumunu bilmek.
6. Zamirin neye gönderme yaptığını bularak paragraf ve çeviri sorularını çözmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Zamir sorusu doğrudan çıkmaz ama **iki yerde zamir bilgisi işine yarar**. Birincisi paragraf tamamlama ve anlamı bozan cümle sorularında: seçenek “This”, “These”, “They”, “It” ile başlıyorsa önceki cümlede bu zamirin gönderme yapacağı bir isim olmalıdır. İkincisi çeviri sorularında: İngilizce cümlede “that of” ya da “those of” görürsen bunun “…ninki” anlamına geldiğini bil.
:::

## 1. YDT’de zamirler nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki soruların incelenmesine dayanıyor. 2018-2025 arası 80 dilbilgisi sorusunun hiçbirinde ayrı bir zamir sorusu yoktu. Belirleyici ve nicelik sorusu (13. soru) zamir benzeri sözcükleri sınıyor (Determiners ve Quantifiers konusunda). Bunun dışında zamirler şu yerlerde karşına çıkar.

| Soru türü | Zamirin rolü |
| --- | --- |
| Paragraf tamamlama | Seçeneğin başındaki This, These, They, It önceki cümleye gönderme yapmalı |
| Anlam bütünlüğünü bozan cümle | Zamirin gönderme yaptığı isim yoksa cümle akışı bozar |
| Çeviri (İngilizce-Türkçe) | that of, those of, which, one, ones doğru çevrilmeli |
| Çeviri (Türkçe-İngilizce) | “-ninki” gibi yapılar zamirle kurulur (that of) |
| Cloze test | Dönüşlü zamir (themselves, itself) ve karşılıklı zamir (each other) |

:::neden-sonuc
- Dilbilgisi sorusu olarak çıkmıyor ama her paragrafta var => Zamirin neye gönderme yaptığını bulmak okumayı hızlandırır.
- That of ve those of akademik metinlerde sık geçer => Karşılaştırmada ikinci isim tekrarlanmaz, zamirle kısaltılır.
- Seçenek başındaki zamirler önceki cümleye bağlı => Paragraf tamamlamada zamirin göndermesini kontrol et.
- Dönüşlü zamir (themselves, itself) incelenen metinde on kez geçti => Dönüşlü zamirin özneyle uyumunu bil.
:::

## 2. Kişi zamirleri ve iyelik

| Kişi | Özne | Nesne | İyelik sıfatı | İyelik zamiri | Dönüşlü |
| --- | --- | --- | --- | --- | --- |
| 1. tekil | I | me | my | mine | myself |
| 2. tekil / çoğul | you | you | your | yours | yourself / yourselves |
| 3. tekil (eril) | he | him | his | his | himself |
| 3. tekil (dişil) | she | her | her | hers | herself |
| 3. tekil (cansız) | it | it | its | yok | itself |
| 1. çoğul | we | us | our | ours | ourselves |
| 3. çoğul | they | them | their | theirs | themselves |

### İyelik sıfatı ve iyelik zamiri

- İyelik **sıfatı** isimle birlikte: **my** book, **her** car.
- İyelik **zamiri** ismin yerini alır: The book is **mine**. This umbrella is **hers**.

“This is my” yanlıştır. Doğrusu “This is **mine**”.

### its ve it’s

- **its** = onun (iyelik): The company changed **its** logo.
- **it’s** = it is ya da it has: **It’s** raining. **It’s** been a long day.

## 3. Dönüşlü zamirler

Dönüşlü zamir (reflexive pronoun) iki durumda kullanılır.

### Eylem özneye döner

Özne ve nesne aynı kişidir.

- She cut **herself**.
- They taught **themselves** English.
- The company has set **itself** a new goal.

### Vurgu için

“Kendisi” anlamıyla özneyi vurgular.

- The children prepared the meal **themselves**. (kimsenin yardımı olmadan)
- The president **himself** attended the meeting.

### Dönüşlü zamir gerektirmeyen fiiller

Bazı fiillerde Türkçedeki dönüşlülük İngilizcede dönüşlü zamir gerektirmez.

| Fiil | Örnek |
| --- | --- |
| wash, shave, dress (kendini) | He **washed** and **dressed**. |
| feel, relax, hurry | I **feel** tired. |
| meet, get married | They **met** in 2010. |

### by + dönüşlü zamir

“**By oneself**” = tek başına: She lives **by herself**. They did it **by themselves**.

## 4. Karşılıklı zamirler

| Zamir | Anlam | Örnek |
| --- | --- | --- |
| each other | birbirini (iki ya da daha fazla kişi) | They respect **each other**. |
| one another | birbirini (genellikle üç ya da daha fazla) | The members support **one another**. |

“They hurt **themselves**” (her biri kendini) ile “They hurt **each other**” (biri ötekini) farklıdır. **Each other**’dan sonra iyelik de olabilir: “They borrow **each other’s** books.”

## 5. Ayırıcı zamirler

| Zamir | Kullanım | Örnek |
| --- | --- | --- |
| this, these | yakın | **This** is my bag. **These** are expensive. |
| that, those | uzak | **That** was a good idea. |
| one, ones | daha önce geçen sayılabilir ismin yerine | I need a pen. Do you have **one**? |
| the one(s) | belirli, tanımlanmış | The book on the table is **the one** I need. |
| that of / those of | karşılaştırmada tekrar edilen isim yerine | The population of Istanbul is larger than **that of** Ankara. |
| the former / the latter | ilk söylenen / sonraki | Both Ali and Ayşe came. The former was late. |
| such | böyle | **Such** is life. |
| the same | aynı | She wants **the same**. |

### That of ve those of

Karşılaştırmada, ilk isim tekrar edilmez, **that of** (tekil) ya da **those of** (çoğul) kullanılır.

- The climate of Turkey is milder than **that of** Russia. (= the climate of Russia)
- The salaries in Germany are higher than **those in** Poland. (= the salaries)

:::baglanti
**That of** ve **those of** zamirinin ardından of ya da in gibi bir edatla başlayan öbek gelir. “Than the climate of Russia” yazmak yerine “than that of Russia” kullanırız. Bu kalıp resmî ve akademik yazıda sık görülür.
:::

### one ve ones

**One**, bir sayılabilir ismin yerine geçer ve tekildir. **Ones** çoğuldur. İkisi de sayılamaz isimler yerine geçmez.

- Which dress do you prefer? The red **one**. (tekil)
- These shoes are too small. Show me bigger **ones**. (çoğul)
- “I need some water. Do you have **one**?” yanlıştır (sayılamaz). Doğrusu “Do you have **some**?”.

## 6. It’in kullanımları

| Görev | Örnek |
| --- | --- |
| Gerçek özne (cansız, hayvan) | **It** is a good book. |
| Boş özne (hava, zaman, mesafe) | **It** is raining. **It** is five o’clock. |
| Önceden haber veren özne | **It** is essential to drink water. (To drink water is essential.) |
| Cümle vurgusu (cleft) | **It was** John **who** broke the window. |
| Edilgen haber aktarma | **It is said that** he is rich. |

### Önceden haber veren it

Özne uzun bir mastar ya da that cümleciği olduğunda cümlenin başına **it** konur ve asıl özne cümlenin sonuna atılır.

- **It** is important **to arrive early**. = To arrive early is important.
- **It** is clear **that prices will rise**. = That prices will rise is clear.
- **It** takes two hours **to get there**.

### Cleft cümlesi

Bir parçayı vurgulamak için: It is/was + vurgulanan öğe + that / who / which + kalan cümle.

- It was **in 1923** that the Republic was founded.
- It is **the quality** that matters, not the price.

## 7. Belirsiz zamirler

| Zamir | Kullanım | Örnek |
| --- | --- | --- |
| someone, somebody, something, somewhere | olumlu cümle | **Someone** called. |
| anyone, anybody, anything, anywhere | olumsuz, soru | I didn’t see **anyone**. Did you find **anything**? |
| everyone, everybody, everything | hepsi | **Everyone** is here. |
| no one, nobody, nothing, nowhere | olumsuz | **Nobody** knows. |

### Fiil uyumu

Hepsi **tekil fiil** alır: Everyone **knows**. Nobody **was** late.

### Sıfat sonda

Sıfat bu zamirlerden **sonra** gelir: something **interesting**, nothing **new**, someone **special**.

### Everyone ve their

Çoğu zaman everyone, nobody gibi tekil zamirlere çoğul iyelik (their) bağlanır: “Everyone should bring **their** own lunch.” Resmî yazıda “his or her” kullanılır.

## 8. So ve not ile yerine koyma

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| I think / hope / believe / suppose / expect **so** | öyle | “Will it rain?” “I think **so**.” |
| I hope / suppose / believe **not** | öyle değil | “Will it rain?” “I hope **not**.” |
| say so, tell someone so | öyle söylemek | “Is he leaving?” “The newspapers say **so**.” |
| if so, if not | öyleyse, değilse | If **so**, please call us. |
| do so | öyle yapmak | You can apply online, or you can **do so** by post. |

## 9. Gönderme (reference)

Bir zamirin neye gönderme yaptığını bulmak okumada ve paragraf sorularında en önemli iştir.

| Zamir | Genellikle gönderme yapar |
| --- | --- |
| it | tekil, cansız ya da önceki cümlenin tamamı |
| they, them | çoğul isim |
| this, that | önceki cümlenin tamamı veya bir fikir |
| these, those | çoğul isim ya da fikir |
| which | önceki cümlenin tamamı ya da ismi |
| one, ones | sayılabilir isim |
| the former / the latter | iki öğenin ilki / ikincisi |

### Gönderme belirsizse

Bir cümlede iki olası isim varsa “it” hangisini kastettiği belirsiz olabilir. Okumada zamir genellikle **en yakın uygun isme** işaret eder.

- “The researchers studied the volcano, and **it** erupted in 2010.” (it = volcano)
- “The company asked its engineers to test the machine, but **they** failed.” (they = engineers)

## 10. Çözüm yolu

1. **Zamirin görevini bul.** Özne mi, nesne mi, iyelik mi?
2. **Neye gönderme yapıyor?** Tekil mi, çoğul mu, kişi mi şey mi?
3. **Dönüşlü ise** eylemi yapan ile alan aynı mı?
4. **Karşılaştırma varsa** that of / those of olabilir mi?
5. **Seçeneklerde** zamirin tekil / çoğul uyumunu kontrol et.

## Aklında kalsın

- **İyelik sıfatı** isimle (my book), **iyelik zamiri** tek başına (mine).
- **its** = onun. **it’s** = it is / it has.
- **Dönüşlü zamir**: eylem özneye döner ya da vurgu yapar (by oneself = tek başına).
- **each other / one another**: karşılıklı.
- **That of** (tekil) ve **those of** (çoğul): karşılaştırmada isim tekrarı yerine.
- **one** tekil, **ones** çoğul, sayılamaz isim yerine geçmez.
- **It**: boş özne, önceden haber veren özne (It is important to ...), cleft.
- **Someone, anybody, everything, nothing**: tekil fiil. Sıfat sonda (something new).
- **I think so / I hope not**: so ve not cümle yerine.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| This umbrella is her | **This umbrella is hers** |
| The company changed it’s logo | **The company changed its logo** |
| They respect themselves (karşılıklı) | **They respect each other** |
| They did it by theirself | **by themselves** |
| than the Ankara’s population | **than that of Ankara** |
| than those of Ankara (tekil isim) | **than that of Ankara** |
| Do you have one? (water) | **Do you have some?** |
| nothing interesting ve interesting nothing | **nothing interesting** |
| Everyone are here | **Everyone is here** |
| I hope so not | **I hope not** |
| It is important that to arrive | **It is important to arrive** |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="B"}
The children prepared the whole meal ----, without any help from adults.

- A) them
- B) themselves
- C) their own
- D) each other
- E) theirs

---

1. “Without any help from adults” çocukların yemeği **kendi başlarına** hazırladığını vurguluyor.
2. Özneyi (the children) vurgulayan zamir **themselves**.
3. Them nesne zamiridir. Their own isimle kullanılır. Each other karşılıklı eylem için, theirs iyelik zamiri için. Doğru cevap **themselves**.
:::

:::soru{cevap="C"}
The population of Istanbul is much larger than ---- of Ankara.

- A) it
- B) those
- C) that
- D) one
- E) this

---

1. Nüfus iki şehirde karşılaştırılıyor. “The population of Istanbul” ile “the population of Ankara” aynı isim, tekrar edilmez.
2. Tekil bir isim (population) yerine **that of** kullanılır.
3. Those çoğul, it ve this uyumsuz. One burada karşılaştırma yapısında that of yerine geçmez. Doğru cevap **that**.
:::

:::soru{cevap="E"}
The two neighbours have known ---- for more than twenty years.

- A) them
- B) themselves
- C) their
- D) one
- E) each other

---

1. İki kişi ve eylem **karşılıklı**: birbirlerini tanıyorlar.
2. Karşılıklı eylem için **each other**.
3. Them nesne zamiridir ama anlam kurmaz. Themselves her birinin kendini tanıdığını söylerdi. Their ve one yapıya uymaz. Doğru cevap **each other**.
:::

:::soru{cevap="C"}
This umbrella isn’t mine. I think it is ----.

- A) she
- B) her
- C) hers
- D) herself
- E) she’s

---

1. Boşlukta bir isim yok, sadece it is ile devam ediyor. İyelik bir **zamir** olarak tek başına durmalı.
2. “Onunki” anlamı **hers** ile kurulur.
3. Her isimden önce gelir, bu yüzden uymaz. She özne zamiridir. Herself dönüşlüdür. She’s = she is, anlam kurmaz. Doğru cevap **hers**.
:::

:::soru{cevap="A"}
This shirt is too small. Could you show me a bigger ---- ?

- A) one
- B) ones
- C) it
- D) that
- E) them

---

1. “A bigger” tekil bir ismi tamamlıyor ve boşlukta isim tekrarı yok. Önceden geçen **shirt** yerine geçecek tekil bir zamir gerekli.
2. Tekil sayılabilir isim yerine **one** kullanılır.
3. Ones çoğul olurdu ve a ile uyumsuz. It, that ve them sıfat almaz. Doğru cevap **one**.
:::

:::soru{cevap="B"}
I looked everywhere for my keys, but I couldn’t find them ----.

- A) somewhere
- B) anywhere
- C) nowhere
- D) everywhere
- E) elsewhere

---

1. Cümle **olumsuz** (couldn’t find). Olumsuz cümlede “hiçbir yerde” anlamı **anywhere** ile verilir.
2. Nowhere kendi başına olumsuzluk taşır, couldn’t ile çift olumsuzluk olur.
3. Somewhere olumlu cümle için, everywhere ve elsewhere anlam kurmaz. Doğru cevap **anywhere**.
:::

:::soru{cevap="D"}
---- is essential to drink enough water in hot weather.

- A) This
- B) That
- C) There
- D) It
- E) What

---

1. Cümlenin asıl öznesi sonda: “to drink enough water”. Başa **it** konur.
2. Önceden haber veren özne **it**: It is essential to drink.
3. This ve that bir isme ya da fikre gönderme yapar. There varlık bildirir. What isim cümleciği başlatır ve yapıya uymaz. Doğru cevap **It**.
:::

:::soru{cevap="A"}
“Will the exhibition be extended?” “The organisers say ----.”

- A) so
- B) it
- C) such
- D) thus
- E) that

---

1. Cevap, önceki cümlenin **tamamını** tekrar etmeden onaylıyor: evet, uzatılacak.
2. Say ile tüm bir cümlenin yerine geçen zamir **so**: say so, think so, hope so.
3. It tek başına cümleyi tekrar etmez. Such ve thus anlam kurmaz. That bir cümleciğin devamını gerektirir. Doğru cevap **so**.
:::

:::ipucu{baslik="İpucu"}
Zamir sorusunda önce **boşlukta bir isim olup olmadığına** bak. İsim varsa iyelik sıfatı (my, her), isim yoksa iyelik zamiri (mine, hers). Sonra eylemin kimden kime olduğuna bak: aynı kişiyse dönüşlü, karşılıklıysa each other.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “She cut ---- while cooking.” => herself.
2. “The two of them have known ---- for years.” (karşılıklı, iki kişi) => each other.
3. “This book is ----.” (benim) => mine.
4. “The climate of Turkey is milder than ---- of Russia.” => that.
5. “The salaries in Germany are higher than ---- in Poland.” => those.
6. “Do you have a pen? I need ----.” => one.
7. “I didn’t see ---- at the station.” (kimse) => anyone (ya da anybody).
8. “---- is important to arrive early.” => It.
9. ““Is he coming?” “I hope ----.”” (olumsuz) => not.
10. “The company changed ---- name last year.” (its mi it’s mi?) => its.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 32, false from public.topics where subject_id = 'ydt-dil' and name = 'Pronouns';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Participle (ortaç), fiilin sıfat ya da zarf gibi çalışan **-ing** ve **-ed (V3)** biçimidir. YDT’de en kolay gözden kaçan ama en çok çıkan yapılardan biridir, çünkü cümlede **ikinci bir çekimli fiil yoktur**. “Songs sung by the shamans”, “a reef extending along the coast”, “when painting the bedroom” gibi cümlelerde participle iki cümleciği tek cümleye sığdırır. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Present participle (-ing), past participle (-ed) ve perfect participle (having V3) arasındaki farkı anlamak.
2. -ing ve -ed sıfatlarını (interesting ile interested) ayırt etmek.
3. Kısaltılmış sıfat cümleciğini (the language spoken, the man standing) tanımak.
4. Zarf cümleciğini participle ile kısaltmak (when painting, having finished, based on).
5. Özne uyumunu kontrol ederek doğru participle’ı seçmek.
6. Given, considering, based on gibi sabit ifadeleri tanımak.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 6., 7. ve 8. sorusunda (dilbilgisi bölümünün ilk üç maddesi) ve cloze testteki fiil biçimi boşluklarında participle sık çıkar. Seçeneklerde -ing, -ed ve having V3 biçimleri yan yana ise cümlede **başka bir çekimli fiil var mı** diye bak. Çekimli fiil zaten varsa boşluk bir participle olmalıdır. Sonra tek soru: **participle’ın bağlı olduğu isim eylemi yapıyor mu, alıyor mu?**
:::

## 1. YDT’de participle nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki 24 fiil biçimi sorusuna bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. 24 sorunun **8’inde** doğru cevap bir participle’dır (her yıl bir tane).

| Yıl | Doğru seçenekte görülen participle |
| --- | --- |
| 2018 | ... of an undersea cable, **creating** a shorter path (sonuç) |
| 2019 | one of the longest reefs, **extending** more than 2000 km (sıfat cümleciği) |
| 2020 | **Serving** as the main shipping route (neden) |
| 2021 | the language **spoken** to them, the dialect **used** (kısaltılmış edilgen) |
| 2022 | all the planets **surrounding** the Sun (kısaltılmış etken) |
| 2023 | songs **sung** by the shamans (kısaltılmış edilgen) |
| 2024 | When **painting** the bedroom (zaman) |
| 2025 | other sources **referring** to a kingdom (kısaltılmış etken) |

Cloze testlerde de bir participle çıktı: **overseen** (2020).

:::neden-sonuc
- Sekiz yılda sekiz participle kalıbı birbirinden farklı => Tek bir kural yetmez, dört işlevi (sıfat, neden, zaman, sonuç) tanımak gerekir.
- Sekiz kalıbın altısı etken (-ing), ikisi edilgen (-ed) => Önce “özne eylemi yapıyor mu, alıyor mu?” sorusunu sor.
- Boşlukla aynı cümlede zaten çekimli bir fiil var => İkinci bir çekimli fiil seçeneği hemen düşer.
- Cloze testte de aynı kalıplar çıkıyor => Boşluğun bağlı olduğu ismi bulmak çözümün anahtarı.
:::

## 2. Üç participle

| Tür | Biçim | Anlam | Örnek |
| --- | --- | --- | --- |
| Present participle | V-ing | etken, eylemi yapan, aynı anda | a man **standing** at the door |
| Past participle | V3 | edilgen, eylemi alan, tamamlanmış | a letter **written** by hand |
| Perfect participle | having + V3 | önce biten etken | **Having finished**, she left. |
| Perfect passive | having been + V3 | önce biten edilgen | **Having been warned**, they left. |

Kural: nesne **eylemi yapıyorsa** -ing, **eylemi alıyorsa** -ed.

- The man **standing** at the door (adam duruyor: -ing).
- The language **spoken** in the region (dil konuşuluyor: -ed).

## 3. Sıfat olarak participle

-ing ve -ed sıfatları çok karıştırılır.

| -ing sıfatı | -ed sıfatı |
| --- | --- |
| Bir şeyin **yarattığı etki** | Birinin **hissettiği duygu** |
| The lecture was **boring**. | The students were **bored**. |
| The news is **surprising**. | I was **surprised**. |
| It was a **tiring** day. | She felt **tired**. |
| an **exciting** match | **excited** fans |
| a **confusing** map | **confused** tourists |

:::baglanti
-ing sıfatı **neden olan şeyi**, -ed sıfatı **hisseden kişiyi** tanımlar. “The film was boring” filmin kendisi sıkıcı. “He was bored” kişi sıkılmış.
:::

Bazı participle’lar kalıcı sıfattır: broken window (kırık cam), falling leaves (düşen yapraklar), growing population (artan nüfus), rising prices (artan fiyatlar), increasing demand (artan talep), declining sales (azalan satışlar), written exam (yazılı sınav).

## 4. Kısaltılmış sıfat cümleciği (reduced relative clause)

Sıfat cümleciği (who, which, that ile başlayan) bazı durumlarda participle ile kısaltılır.

| Tam cümle | Kısaltılmış |
| --- | --- |
| a reef **which extends** along the coast | a reef **extending** along the coast |
| songs **which are sung** by the shamans | songs **sung** by the shamans |
| the language **that is spoken** in the region | the language **spoken** in the region |
| planets **that surround** the Sun | planets **surrounding** the Sun |
| sources **that refer** to a kingdom | sources **referring** to a kingdom |

Kural:

- **Etken** cümle (who/which + sürekli ya da genel durum) => **V-ing**. (Tek seferlik geçmiş olay için olmaz: “the student who won the prize” kısaltılamaz.)
- **Edilgen** cümle (who/which + be + V3) => **V3**.
- Kısaltma, relative zamirini ve be fiilini atar.

:::ipucu{baslik="En güvenli yol"}
Kısaltmada tek soru yeter: **ismi eylemi yapıyor mu, alıyor mu?** Yapıyorsa -ing, alıyorsa -ed. Bu soru çoğu zaman cevabı verir.
:::

## 5. Zarf cümleciği olarak participle

Aynı özneye sahip iki cümlecikten biri kısaltılabilir. İkisinin **öznesi aynı** olmalıdır.

### Zaman

| Tam cümle | Kısaltılmış |
| --- | --- |
| When he was painting the bedroom, he found an old letter. | **When painting** the bedroom, he found an old letter. |
| While she was walking home, she met an old friend. | **While walking** home, she met an old friend. |
| After he had finished the report, he went home. | **After finishing** (ya da **Having finished**) the report, he went home. |

Zaman bağlaçları (when, while, before, after, since, once) participle ile birlikte kalabilir.

### Neden

| Tam cümle | Kısaltılmış |
| --- | --- |
| Because it serves as a shipping route, Singapore attracts traders. | **Serving** as a shipping route, Singapore attracts traders. |
| As she had no money, she stayed home. | **Having** no money, she stayed home. |
| Since he was warned about the storm, he stayed in. | **Having been warned** about the storm, he stayed in. |

### Sonuç

Önceki cümlenin **sonucunu** anlatan -ing: “The earthquake destroyed the bridge, **cutting** the town off from the capital.”

Örnek: “The ice is retreating, **enabling** ships to use a shorter route.” Bu yapıda -ing, öncekinin **sonucunu** söyler (2018’de de bir kez çıktı).

### Koşul ve ödün

- **Used** correctly, the tool saves time. (If it is used correctly)
- **Although tired**, she kept working. (Although she was tired)

## 6. Perfect participle: önce biten eylem

Participle eylemi ana eylemden **önce** olmuşsa **having + V3** kullanılır.

| Cümle | Anlam |
| --- | --- |
| **Having read** the instructions, he started the machine. | Önce okudu, sonra başlattı. |
| **Reading** the instructions, he started the machine. | Okurken başlattı (eşzamanlı). |
| **Having been told** to wait, she sat down. | Bekle denmişti, oturdu. |

:::baglanti
**Reading** eşzamanlılık, **Having read** sıra ilişkisi bildirir. Cümlede “önce” kavramı varsa (after, once, earlier, already) perfect participle’ı düşün.
:::

## 7. Özne uyumu (dangling participle)

Participle cümleciğinin öznesi **ana cümlenin öznesiyle aynı** olmalıdır. İstisna: önceki cümlenin tamamının **sonucunu** anlatan -ing (“..., cutting the town off”) bütün cümleye bağlanır.

- **Walking** home, **I** met an old friend. (Ben hem yürüdüm hem tanıştım: doğru.)
- **Walking** home, **the rain** started. (Yağmur yürümedi: yanlış.)

Sınavda cevap şıklarından biri bu hatayı içerir. Özneyi bulduktan sonra “bu özne bu eylemi gerçekten yapabiliyor mu?” diye sor.

## 8. Sabit participle ifadeleri

Bazı participle’lar edat ya da bağlaç gibi kullanılır. Bunlar ayrı ezberlenir.

| İfade | Anlam | Örnek |
| --- | --- | --- |
| based on | -e dayanarak | **Based on** interviews with farmers, the report concludes... |
| given (that) | göz önüne alındığında | **Given** the evidence, ... |
| considering | düşünülürse | **Considering** his age, he did well. |
| according to | -e göre | According to the report, ... |
| judging by | -e bakılırsa | Judging by the sky, it will rain. |
| depending on | -e bağlı olarak | Depending on the weather, ... |
| compared with / to | ile karşılaştırıldığında | **Compared with** last year, sales rose. |
| provided / providing (that) | şartıyla | You can go, provided that you finish. |
| regarding, concerning | ile ilgili | concerning your request |
| including, excluding | dahil, hariç | including taxes |
| owing to | yüzünden | owing to the delay |
| located in, situated in | -de bulunan | a city located in the north |
| known as | olarak bilinen | a bird known as the kiwi |
| born in | doğumlu | a writer born in 1950 |

## 9. Nesne + participle ve -ing alan kalıplar

Bazı fiillerden sonra nesne + -ing / V3 gelir.

| Kalıp | Örnek |
| --- | --- |
| see, hear, watch, notice + nesne + V-ing | I saw him **crossing** the road. |
| find, catch, leave + nesne + V-ing | They found her **reading**. |
| have / get + nesne + V3 (ettirgen) | We had the roof **repaired**. |
| spend / waste time + V-ing | He spends hours **playing** games. |
| be busy, be worth + V-ing | The museum is worth **visiting**. |
| keep, go on, carry on + V-ing | Keep **trying**. |

## 10. Çözüm yolu

1. **Cümlede başka çekimli fiil var mı?** Varsa ve boşluğun kendi öznesi ya da bağlacı yoksa, boşluk bir participle’dır.
2. **Boşluğun bağlı olduğu ismi bul.** Önündeki isim ya da cümlenin öznesi.
3. **Etken mi edilgen mi?** Nesne eylemi yapıyorsa -ing, alıyorsa -ed.
4. **Önce mi sonra mı?** Önce biten ise having V3.
5. **Sabit ifade olabilir mi?** based on, given, considering gibi.
6. **Seçenekleri sına.** Özne uyumu bozuk olanı ele.

## Aklında kalsın

- **-ing**: eylemi yapan, etken, aynı anda. **-ed**: eylemi alan, edilgen. **having V3**: önce biten.
- **-ing sıfatı** neden olan şey, **-ed sıfatı** hisseden kişi (boring / bored).
- **Kısaltılmış sıfat cümleciği**: who/which + V => V-ing. who/which + be + V3 => V3.
- Participle cümleciğinin **öznesi ana cümleyle aynı** olmalı.
- **Sonuç -ing**: cümlenin sonunda, virgülden sonra: “..., enabling ships to...”
- Sabit ifadeler: **based on, given, considering, judging by, depending on, compared with, provided that**.
- Cümlede zaten çekimli fiil varsa ve boşluğun kendi öznesi yoksa boşluk participle.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| interesting ve interested | interesting: ilginç (şey). interested: ilgilenen (kişi). |
| boring ve bored | boring: sıkıcı. bored: sıkılmış. |
| the language speaking ve the language spoken | dil konuşulur: **spoken**. |
| a man stood ve a man standing | kısaltılmış etken: **standing**. |
| Reading the book, he went ve Having read the book, he went | Birincisi eşzamanlı, ikincisi önce okudu. |
| Based on ve Basing on | Doğrusu **Based on** (edilgen). |
| Having no money ve Having had no money | İkincisi daha önce olmuş bir durumu anlatır. |
| Walking, the rain started | Özne uyumsuz. Participle’ın öznesi yağmur olamaz. |
| spent time to play | **spent time playing**. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="C"}
The ancient manuscripts ---- in the cave are now kept in a museum.

- A) finding
- B) to find
- C) found
- D) having found
- E) being found

---

1. Cümlede zaten çekimli bir fiil var (**are kept**). Boşluk bir participle olmalı.
2. Elyazmaları mağarada **bulunmuştur**, kendileri bir şey bulmaz. Eylemi alan nesne, edilgen: **found** (the manuscripts that were found).
3. A ve D etken anlamı verir. B amaç gibi okunur. E ise sürekli ve anlamsız. Doğru cevap **found**.
:::

:::soru{cevap="C"}
The river rises in the mountains and flows through three countries, ---- into the sea near the capital.

- A) to empty
- B) emptied
- C) emptying
- D) to have emptied
- E) having emptied

---

1. Cümlede iki çekimli fiil var (rises, flows). Bir de boşluk gelmiş, yani bu bir participle.
2. Nehrin kendisi yolculuğun sonunda denize **dökülür**: eylemi nehir yapıyor, etken. Aynı anda ve sonuç anlamı: **emptying**.
3. B edilgen anlam verir. A ve D amaç bildirir. E eylemin önce bittiğini söyler. Doğru cevap **emptying**.
:::

:::soru{cevap="B"}
---- about the storm, the sailors stayed in the harbour.

- A) Warning
- B) Having been warned
- C) To warn
- D) Having warned
- E) To have warned

---

1. Boşluğun öznesi **the sailors**. Denizciler uyarı **aldı**, uyarmadı. Edilgen gerekir.
2. Uyarı denizciler limanda kalmadan **önce** gerçekleşti: **having been warned**.
3. A ve D etken anlam verir. C ve E amaç ya da farklı zaman bildirir. Doğru cevap **Having been warned**.
:::

:::soru{cevap="A"}
The festival ---- in the old town every spring attracts thousands of visitors.

- A) held
- B) holding
- C) to hold
- D) having held
- E) hold

---

1. Cümlede **attracts** zaten çekimli fiil. Boşluk, festivali tanımlayan bir participle.
2. Festival bir şeyi düzenlemez, **düzenlenir**. Eylemi alan nesne: **held** (the festival that is held).
3. B ve D etken anlamdadır. C amaç bildirir. E çekimli fiil olur ve cümleyi bozar. Doğru cevap **held**.
:::

:::soru{cevap="E"}
The results of the experiment were ---- and the researchers were ---- by the discovery.

- A) surprised / surprising
- B) surprised / surprised
- C) surprising / surprising
- D) surprising / surprise
- E) surprising / surprised

---

1. **Sonuçlar** şaşırtıcı bir etki yaratıyor: -ing sıfatı, **surprising**.
2. **Araştırmacılar** şaşırdı, duyguyu hissediyorlar: -ed sıfatı, **surprised**.
3. A tersini söyler. B ve C iki boşlukta aynı biçimi kullanıyor. D’deki surprise bir isim. Doğru cevap **surprising / surprised**.
:::

:::soru{cevap="D"}
While ---- through the old archive, the student discovered a letter from 1890.

- A) searched
- B) to search
- C) having searched
- D) searching
- E) searches

---

1. **While** bir zaman bağlacı ve öznesi aynı olan bir cümleciği kısaltıyor: “While the student was searching”.
2. Öğrenci aramayı **kendisi yapıyor** ve mektubu bulurken aynı anda arıyor: etken ve eşzamanlı, **searching**.
3. A edilgen, B amaç, C önce biten eylem, E çekimli fiil olur. Doğru cevap **searching**.
:::

:::soru{cevap="B"}
---- on satellite data, the study estimates that forest cover has shrunk by ten per cent.

- A) Basing
- B) Based
- C) Having based
- D) To base
- E) Being basing

---

1. **Based on** sabit bir ifadedir ve “-e dayanarak” anlamına gelir.
2. Çalışma verilere **dayanır**, onları temel almaz: edilgen, **Based on**.
3. A, C ve E biçim olarak yanlış. D amaç bildirir ve anlamı bozar. Doğru cevap **Based**.
:::

:::soru{cevap="A"}
---- no money left, they had to cancel the trip.

- A) Having
- B) Had
- C) Having been
- D) To have
- E) Being had

---

1. “Because they had no money left” cümleciği kısaltılmış: neden bildiren participle.
2. Özne **they** ve “sahip olmak” eylemi: etken, **Having**.
3. B çekimli fiil olur ve cümleyi bozar. C edilgen. D amaç. E anlamsız. Doğru cevap **Having**.
:::

:::ipucu{baslik="İpucu"}
Participle sorusunda **özneyi** bul ve eylemi gerçekten yapıp yapamayacağını sına. Yapabiliyorsa -ing, yapamıyor ve alıyorsa -ed. “Önce” kavramı varsa having.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “The man ---- at the door is my uncle.” (stand) => standing.
2. “The book ---- by Orhan Pamuk is very popular.” (write) => written.
3. “The film was so ----.” (bore) => boring. Filmin kendisi sıkıcı.
4. “The students were ---- by the film.” (bore) => bored. Öğrenciler sıkılmış.
5. “---- the keys at home, she could not open the door.” (leave, önce oldu) => Having left.
6. “While ---- home, I met an old friend.” (walk) => walking.
7. “---- on the results, the plan was approved.” (base) => Based.
8. “The report, ---- by three experts, is long.” (write) => written.
9. “Rising prices” ve “risen prices” hangisi yerleşik kalıptır? => rising prices (artan fiyatlar). Risen ise Present Perfect’te kullanılır.
10. “The earthquake cut the town off, ---- many people homeless.” (leave) => leaving. Sonuç -ing.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 31, false from public.topics where subject_id = 'ydt-dil' and name = 'Participles';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Modal fiiller (can, could, may, might, must, should, would...) bir olayın **ne kadar kesin, mümkün, gerekli ya da izinli** olduğunu söyler. YDT’de modal hiçbir zaman tek başına sorulmaz. Dilbilgisi bölümünün ilk üç sorusunda **fiil biçimi** sorulur ve modal çoğu zaman zaman, edilgen ya da fiilimsiyle aynı soruda yan yana gelir. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Modal fiillerin yapısını (modal + V1) ve temel anlamlarını (yetenek, izin, ihtimal, zorunluluk, tavsiye) ayırt etmek.
2. Şimdiki ve geçmiş zaman için çıkarım kalıplarını (must be, must have been, can’t have been, may have been) doğru kurmak.
3. Geçmişe dair pişmanlık ve eleştiri kalıplarını (should have, needn’t have, could have) kullanmak.
4. Modal fiili edilgen (must be taken, can be formed) ve sürekli (must be working) yapılarla birleştirmek.
5. Cümledeki ipuçlarına (until recently, no evidence, so that, thanks to) bakarak modali seçmek.
6. İki boşluklu soruda modal ile zamanı birlikte çözmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 6., 7. ve 8. sorusunda (dilbilgisi bölümünün ilk üç maddesi) modal sık çıkar. Seçeneklere bak: aynı boşlukta may, must, should, would, could gibi modal çeşitleri yan yana duruyorsa **cümlenin kesinlik derecesini** bul. Kesinlik, ihtimal, zorunluluk ya da pişmanlıktan hangisi söyleniyor? İpucu sözcüğü (probably, no evidence, until recently, thanks to) neredeyse her zaman cümlededir.
:::

## 1. YDT’de modal nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi.

Dilbilgisi bölümünün her yıl ilk üç sorusu fiil biçimi sorusudur (toplam 24 soru). Bu 24 sorudan **en az 12’sinde** bir boşlukta modal vardır. Modal çoğunlukla zamanla ya da edilgenle aynı soruda yan yana gelir.

| Yıl | Doğru seçeneklerde görülen modal kalıpları |
| --- | --- |
| 2018 | had to wait, may enable |
| 2019 | can exist |
| 2020 | could cause |
| 2021 | might have caused |
| 2022 | must be taken |
| 2023 | can be formed, had to get, may not need to |
| 2024 | can damage |
| 2025 | may have been, can formulate, will result in, could not have continued |

:::neden-sonuc
- Modal kalıplarının üçte biri geçmişe bakıyor (had to, might have caused, may have been, could not have continued) => Geçmişe bakan cümlelerde modal + have + V3 kalıbını bil.
- Edilgen modal iki yılda doğru cevap (must be taken, can be formed) => Modal + be + V3 kalıbı sürekli karşına çıkıyor.
- Kesinlik farkı sorunun kendisi (may have been, must have been) => Metin “kanıt yok” diyorsa may, “kesin” diyorsa must gerekir.
- Koşul cümlesi içindeki modal (could not have continued) => Conditionals konusuyla birlikte çalış.
:::

## 2. Yapı: modal + V1

Modal fiillerin ortak özelliği:

- Arkasından **yalın fiil** (V1) gelir. To gelmez.
- Üçüncü tekil kişide -s almaz: She **can** swim. (cans yanlış.)
- Soru ve olumsuzda yardımcı fiil gerekmez: **Can** you swim? She **cannot** swim.
- Geçmişi **have + V3** ile gösterilir: She **must have forgotten**.

| Modal | Temel anlamı |
| --- | --- |
| can, could | yetenek, olasılık, izin |
| may, might | ihtimal, izin |
| must | zorunluluk, güçlü çıkarım |
| should, ought to | tavsiye, beklenti |
| will, would | gelecek, alışkanlık, varsayım |
| shall | öneri (I shall, shall we) |
| have to, need to | dışarıdan gelen zorunluluk |
| had better | uyarı niteliğinde tavsiye |

:::ipucu
Modalden sonra **to** ya da **-ing** gelmez. “She can to swim”, “He must going” yanlıştır. Ama ought to, have to, be able to ve used to kalıplarında to vardır, çünkü bunlar yarı modaldır.
:::

## 3. Yetenek ve izin

### Yetenek

| Zaman | Kalıp | Örnek |
| --- | --- | --- |
| Şimdi | can, be able to | She can speak three languages. |
| Geçmiş (genel) | could, was able to | He could swim at four. |
| Geçmiş (tek bir başarı) | was able to, managed to | He **was able to** escape. (could escape zayıf) |
| Gelecek | will be able to | You will be able to swim soon. |
| Olumsuz tek olay geçmiş | couldn’t, wasn’t able to | He couldn’t open the door. |

Geçmişte **belirli bir olayda başarmak** için was able to ya da managed to kullanılır, could değil. Olumsuzda ise ikisi de olur.

### İzin

- **can**: gündelik izin. Can I leave?
- **could**: nazik. Could I leave early?
- **may**: resmî izin. May I come in?
- **might**: çok resmî ve çekingen. Might I ask a question?

## 4. İhtimal ve çıkarım

Burası sınavın en çok sorduğu bölümdür. Çıkarım yaparken **kesinlik derecesi** söylenir.

| Derece | Şimdi ya da gelecek | Geçmiş |
| --- | --- | --- |
| Kesin olumlu | must be | must have been |
| Güçlü olasılık | should be, ought to be | should have been |
| Olasılık (belirsiz) | may be, might be, could be | may have been, might have been, could have been |
| Kesin olumsuz | can’t be, couldn’t be | can’t have been, couldn’t have been |

### Örnekler

- She has worked all day. She **must be** tired. (kesin çıkarım)
- The streets are wet. It **must have rained**. (geçmişe dair kesin çıkarım)
- He **can’t be** at home. I just saw him at the station. (imkânsız)
- I don’t know where she is. She **may be** at the library. (belirsiz)
- Historians are not sure, but the temple **might have been** built by traders. (belirsiz geçmiş)

:::ipucu{baslik="must mı may mi?"}
Cümlede **kanıt** varsa (the streets are wet, the lights are on) must. **Kanıt yoksa ya da “emin değiliz” deniyorsa** (no evidence, it is not clear, some historians believe) may ya da might. Sınavda bu ayrım sık sorulur.
:::

### can ile could

Çıkarımda **can**, olumlu cümlede kullanılmaz. “It can be true” çıkarım için kullanılmaz. Olumsuz ve soru cümlesinde can’t / can kullanılır: “It can’t be true.” “Can it be true?”

Teorik olasılıkta can bir şeyin **genelde mümkün olduğunu** söyler: “Heavy rain **can** cause floods.” (Ağır yağmur sel yaratabilir, genel gerçek.)

## 5. Zorunluluk, yasak ve tavsiye

### Zorunluluk

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| must | konuşanın ya da kuralın zorunluluğu | You must wear a seat belt. |
| have to, has to | dışarıdan gelen zorunluluk | I have to wear a uniform at work. |
| had to | geçmişte zorunluluk (must’un geçmişi yoktur) | We had to leave early. |
| need to | gerek var | You need to register. |
| be required to, be obliged to | resmî zorunluluk | Visitors are required to sign in. |

### Yasak ve gereksizlik

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| mustn’t | yasak, yapma | You mustn’t smoke here. |
| can’t | yasak (izin yok) | You can’t park here. |
| don’t have to, needn’t | gerek yok, serbest | You don’t have to come. |

:::baglanti
**Mustn’t** ve **don’t have to** karıştırılır. “You mustn’t tell him” = **söyleme**, yasak. “You don’t have to tell him” = **söylemek zorunda değilsin**, söyleyebilirsin de.
:::

### Tavsiye ve beklenti

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| should, ought to | tavsiye, ahlaki yükümlülük | You should see a doctor. |
| had better | uyarı (yoksa kötü olur) | You had better hurry. |
| be supposed to | beklenti, plan, kural | The train is supposed to arrive at six. |

## 6. Geçmişle ilgili modal kalıplar

Sınavın en sevdiği yer burasıdır.

| Kalıp | Anlamı | Örnek |
| --- | --- | --- |
| should have V3 | yapılması gerekirdi ama yapılmadı (pişmanlık, eleştiri) | You should have called me. |
| shouldn’t have V3 | yapılmamalıydı ama yapıldı | I shouldn’t have said that. |
| ought to have V3 | should have ile aynı | They ought to have told us. |
| could have V3 | yapabilirdi ama yapmadı | She could have won, but she gave up. |
| might have V3 | belki yapmıştı ya da yapabilirdi | He might have forgotten. |
| needn’t have V3 | gerek yoktu ama yaptı | You needn’t have bought a gift. |
| would have V3 | gerçek olmayan geçmiş senaryo | I would have helped you if you had asked. |
| must have V3 | kesin yapmıştır | She must have missed the bus. |
| can’t have V3 | yapmış olamaz | He can’t have seen us. |

### needn’t have ile didn’t need to

- “I **needn’t have taken** an umbrella.” Aldım ama gerek yokmuş (yağmur yağmadı).
- “I **didn’t need to take** an umbrella.” Gerek yoktu, almadım (ya da aldım mı belli değil).

## 7. Would

| Kullanım | Örnek |
| --- | --- |
| Geçmişte tekrar eden alışkanlık | Every summer we **would** visit my grandparents. |
| Gelecekte geçmişten bakış (future in the past) | He said he **would** call later. |
| Nazik rica | **Would** you open the window? |
| Gerçek dışı koşul sonucu | If I were you, I **would** accept. |
| Varsayım | That **would** be nice. |

“Used to” ve “would” alışkanlık için benzer, ama **durum** anlatırken yalnızca used to kullanılır: “She used to be shy” doğru, “She would be shy” bu anlamda yanlıştır.

## 8. Modal ve edilgen birlikte

Modal + **be + V3** kalıbı sınavda sık çıkar. Özne eylemi yapmıyor, eylem ona yapılıyorsa edilgen kullan.

| Kalıp | Örnek |
| --- | --- |
| modal + be + V3 (şimdi, gelecek) | The rules **must be followed**. Atoms heavier than iron **can be formed**. |
| modal + have been + V3 (geçmiş) | The letter **should have been sent** yesterday. |

Edilgen olup olmadığını anlamak için özneye bak: eylemi özne mi yapıyor, özneye mi yapılıyor?

- Precautions **must be taken** (önlemler alınmalıdır, edilgen).
- The doctors **must take** precautions (doktorlar önlem almalıdır, etken).

## 9. Modal ve sürekli yapı

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| modal + be + V-ing | şimdi, o an | She **must be working** right now. |
| modal + have been + V-ing | geçmişte süregelen | He **may have been waiting** for hours. |
| should be + V-ing | beklenti | The package **should be arriving** soon. |

## 10. Cümledeki ipuçları

| İpucu | Modal |
| --- | --- |
| there is no evidence, it is not certain, some believe | may, might, could |
| obviously, clearly, the evidence shows | must |
| until recently, in the past | had to, could, would |
| now, nowadays, thanks to + yenilik | can, are able to, no longer have to |
| so that, in order that | can, could, will, would |
| if + Past Perfect | could / would / might have V3 (geçmiş sonuç), would + V1 (now, today ile şimdiki sonuç) |
| if + Simple Past | could, would, might |

### so that ile modal

“We left early **so that** we **could** catch the train.” Amaç bildiren so that cümlesinde, ana fiil geçmişse **could / would**, şimdi ya da gelecekse **can / will** kullanılır.

- Marketers study consumers **so that** they **can** design effective campaigns. (şimdiki genel gerçek)
- She saved money **so that** she **could** buy a house. (geçmiş)

## 11. İki boşluklu soruyu çözme yolu

1. **İki boşluğu ayrı oku.** Her biri için bağlamı bul: zaman, kesinlik, edilgenlik.
2. **Kesin bildiğin boşluğa karar ver.** Hangi seçeneğin ikinci kısmı bu cümleye uyuyor?
3. **Her seçenek çiftinde iki yarıyı da sına.** Bir yarı uyup öteki uymuyorsa seçeneği ele.
4. **Edilgen mi etken mi?** Özneye bak.
5. **Modal anlamını Türkçe karşılığıyla dene.** “-malıydı”, “-miş olmalı”, “-ebilir”, “-ebilirdi”.

:::ipucu{baslik="Tuzak"}
Seçeneklerde sık görülen tuzak: iki yarıdan biri **zaman olarak** uyar (was, had to) ama modal **anlam olarak** uymaz (should yerine must gibi). İlk yarıyı bulmak seçenekleri azaltır, ikinci yarı karar verir.
:::

## Aklında kalsın

- Modal + **V1**. To ve -s yok.
- Geçmiş için **modal + have + V3**.
- **must**: kesin çıkarım. **may / might / could**: belirsiz ihtimal. **can’t**: kesin olumsuz.
- **should have**: yapılması gerekirdi, yapılmadı. **needn’t have**: yapıldı, gerek yoktu.
- **mustn’t**: yasak. **don’t have to**: zorunlu değil.
- Geçmişte zorunluluk: **had to** (must’un geçmişi yok).
- Edilgen: **modal + be + V3** (must be taken). Geçmiş edilgen: **modal + have been + V3**.
- Kanıt varsa **must**, kanıt yoksa **may**.
- Geçmişte tek başarı: **was able to / managed to**. Genel yetenek: **could**.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| must ve have to | must konuşanın iradesi, have to dışarıdan gelen zorunluluk. Geçmişte ikisi de had to olur. |
| mustn’t ve don’t have to | mustn’t yasak. don’t have to serbestlik. |
| should have ve must have | should have: yapılması gerekirdi. must have: kesin yaptı. |
| could have ve was able to | could have: yapabilirdi, yapmadı. was able to: yaptı, başardı. |
| may have ve must have | may have: belki. must have: kesin. |
| can’t have ve mustn’t have | can’t have: yapmış olamaz. mustn’t have diye çıkarım kalıbı yoktur. |
| needn’t have ve didn’t need to | needn’t have: yaptı ama gerek yoktu. didn’t need to: gerek yoktu. |
| would ve used to | durum için yalnızca used to. Eylem alışkanlığı için ikisi de. |
| modal + to V | modal + V1 olur. ought to, have to, be able to istisna. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Bazıları tek boşluklu ısınma, bazıları iki boşluklu.

:::soru{cevap="C"}
The streets were wet this morning, so it ---- during the night.

- A) must rain
- B) should rain
- C) must have rained
- D) would rain
- E) can rain

---

1. Konuşan, sokakların ıslak olmasından yola çıkarak **geçmiş hakkında kesin bir çıkarım** yapıyor. Kanıt var (the streets were wet).
2. Geçmişe dair kesin çıkarım **must have + V3** ile kurulur: must have rained.
3. A, D ve E geçmişe uygun değil. B’deki should rain beklenti bildirir ve geçmişi anlatmaz. Doğru cevap **must have rained**.
:::

:::soru{cevap="D"}
Until a few years ago, patients ---- travel abroad for this operation, but thanks to new technology it ---- now be done in local hospitals.

- A) must / should
- B) would / must
- C) have to / may
- D) had to / can
- E) could / has to

---

1. İlk boşlukta **until a few years ago** geçmişe işaret eder ve zorunluluk söyler: **had to**. Must ve have to şimdiki zamandır.
2. İkinci boşlukta **thanks to new technology** bir imkân anlatır: **can** be done.
3. B seçeneğinde would travel geçmiş alışkanlık olarak uyabilir, ama must be done teknolojinin getirdiği imkânla çelişir. E seçeneğindeki has to be done de aynı sebeple uymaz. Doğru cevap **had to / can**.
:::

:::soru{cevap="A"}
You ---- the report earlier. Now we have no time to correct the mistakes.

- A) should have submitted
- B) must have submitted
- C) could submit
- D) would submit
- E) needn’t submit

---

1. “Now we have no time” şikâyet ve pişmanlık anlamı taşıyor. Rapor zamanında verilmedi.
2. Yapılması gerekirdi ama yapılmadı: **should have + V3**.
3. B kesin çıkarımdır ve anlama uymaz. C, D ve E geçmişi anlatmaz. Doğru cevap **should have submitted**.
:::

:::soru{cevap="C"}
According to the new regulations, all personal belongings ---- in the lockers before the exam begins.

- A) may leave
- B) should have left
- C) must be left
- D) could leave
- E) would be leaving

---

1. Eşyalar kendi kendine bir şey yapmaz, eşyalara bir şey **yapılır**: dolaba bırakılırlar. Edilgen yapı gerekir.
2. Kural zorunluluğu söylüyor: **must be left** (modal + be + V3).
3. A, B ve D etken yapıdır. E ise sürekli ve etkendir. Doğru cevap **must be left**.
:::

:::soru{cevap="A"}
Historians are not certain who built the monument, but it ---- by a local tribe long before the Romans arrived.

- A) may have been built
- B) must build
- C) should have been built
- D) cannot be built
- E) would build

---

1. Tarihçiler kesin olarak bilmiyor. Bu **belirsiz bir geçmiş ihtimal**: may have + V3.
2. Anıtı yapan “biri”, anıt yapılan şey, bu yüzden edilgen: may have **been built**.
3. B ve E etkendir ve anlama uymaz. C pişmanlık ya da beklenti söyler. D şimdiki zaman ve imkânsızlık söyler. Doğru cevap **may have been built**.
:::

:::soru{cevap="B"}
He ---- the message because his phone was switched off the whole afternoon.

- A) must have received
- B) can’t have received
- C) should receive
- D) needn’t have received
- E) may receive

---

1. Telefon bütün öğleden sonra kapalıydı. Mesajı alması **imkânsız**.
2. Geçmişe dair kesin olumsuz çıkarım **can’t have + V3** ile kurulur.
3. A tam tersini söyler. C ve E geçmişe uygun değil. D “gerek yoktu” anlamı verir. Doğru cevap **can’t have received**.
:::

:::soru{cevap="B"}
Many cities ---- much smaller today if rail transport ---- in the 19th century.

- A) will be / is not developed
- B) would be / had not been developed
- C) would have been / were not developed
- D) are / has not been developed
- E) could have been / would not develop

---

1. Cümlede **if + Past Perfect** (geçmiş koşul) ve **today** (şimdiki sonuç) var. Bu karma bir koşul cümlesi: geçmiş şart, şimdiki sonuç.
2. If bölümü: **had not been developed** (edilgen, Past Perfect). Sonuç bölümü: **would be** (şimdiki sonuç).
3. C seçeneğinde zaman uyumu bozuk: today ile would have been olmaz. Diğerlerinde koşul bölümü uymuyor. Doğru cevap **would be / had not been developed**.
:::

:::soru{cevap="E"}
When I was a child, my grandfather ---- tell us stories every evening, and we ---- listen for hours without getting bored.

- A) will / can
- B) should / must
- C) may / might
- D) had to / would
- E) would / could

---

1. “Every evening” ve “when I was a child” geçmişte tekrar eden bir alışkanlığı gösterir. Bu anlamda **would** kullanılır.
2. İkinci boşlukta geçmişte süren imkân: **could listen** (would listen de olurdu).
3. D’de ikinci boşluk (would) uyar ama ilk boşluktaki had to tell “anlatmak zorundaydı” anlamı verir ve bağlama uymaz. Diğer seçenekler geçmiş alışkanlığı anlatmaz. Doğru cevap **would / could**.
:::

:::ipucu{baslik="İpucu"}
Modal sorusunda önce **cümlenin zamanına** bak (geçmiş mi şimdi mi?), sonra **kesinlik derecesine**, sonra **edilgen olup olmadığına**. Bu üç sorunun cevabı seçenekleri tek tek eler.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “The lights are on. They ---- at home.” (kesin çıkarım) => must be.
2. “She ---- be at the library. I really don’t know.” (belirsiz ihtimal) => may (ya da might, could).
3. “That ---- be true! It’s impossible.” => can’t.
4. “You ---- smoke in the hospital.” (yasak) => mustn’t.
5. “You ---- come tomorrow if you don’t want to.” (zorunlu değil) => don’t have to (ya da needn’t).
6. “I was ill, so I ---- stay in bed all week.” (geçmişte zorunluluk) => had to.
7. “You ---- me earlier. I was waiting for hours.” (pişmanlık) => should have told.
8. “The bill ---- by Friday.” (zorunluluk, edilgen) => must be paid.
9. “He didn’t answer my calls all day. He ---- his phone at home.” (geçmişe dair kesin çıkarım) => must have left.
10. Geçmişte tek bir başarıyı anlatırken could mu was able to mu kullanılır? => was able to (ya da managed to).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 34, false from public.topics where subject_id = 'ydt-dil' and name = 'Modals';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Wish cümleleri (wish clauses), gerçek olmayan bir durum ya da değişmesini istediğin bir olay hakkında **dilek ve pişmanlık** anlatır: “I wish I had more time” (keşke daha çok vaktim olsa), “If only I had known” (keşke bilseydim). Aynı mantık as if, as though, would rather ve it’s time yapılarında da vardır. Bu konunun ortak kuralı: **zaman bir adım geriye gider**. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Wish ve if only ile şimdiki zaman (wish + past), geçmiş zaman (wish + past perfect) ve gelecek istek (wish + would) cümlelerini kurmak.
2. As if ve as though yapılarını gerçek ve gerçek dışı bağlamda ayırt etmek.
3. Would rather ve it’s (high) time yapılarında doğru zamanı seçmek.
4. Suppose, supposing ve imagine ile varsayım cümleleri kurmak.
5. Wish ile hope arasındaki farkı bilmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Bu konu YDT’de **düşük sıklıklı** bir konudur. Zamanın kısıtlıysa önce Prepositions, Conjunctions, Tenses, Modals, Passive ve Gerunds ile Infinitives konularını bitir, sonra buraya dön. Yapıların kendisi basittir: **wish sonrası bir adım geriye git**.
:::

## 1. YDT’de wish yapıları nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki soruların incelenmesine dayanıyor. 2018-2025 arası 80 dilbilgisi sorusunun hiçbirinde doğrudan wish cümlesi sorulmadı. Kitabın vocabulary, grammar, cloze, sentence completion ve paragraph comprehension bölümlerinin metninde “if only” ve “would rather” hiç geçmedi. “As if” ve “as though” yaklaşık dört kez geçti, çoğunlukla cümle tamamlama seçeneklerinde ve bir dilbilgisi sorusunun metninde. Çıkmış metinlerde bu yapı çoğunlukla present zamanla (as if they cannot function) kullanılmıştı. Bu, durum gerçek olabileceği için doğrudur. Past Perfect ile bir örnek de vardı (as though its leaders had repeatedly requested).

| Yapı | Sınavdaki durumu |
| --- | --- |
| wish, if only | Dilbilgisi sorularında çıkmadı |
| would rather | İncelenen metinde hiç geçmedi |
| as if, as though | Yaklaşık dört kez cümle içinde geçti |
| Gerçek dışı koşul (3. tür) | Fiil biçimi sorularının içinde çıktı (Conditionals konusu) |

:::neden-sonuc
- Wish ve if only dilbilgisi sorusu olarak hiç çıkmadı => Bu konuya diğer konulardan sonra zaman ayır.
- As if ve as though yaklaşık dört kez geçti => Bu iki yapıyı bil, çünkü okuma ve çeviri sorularında karşına çıkar.
- Gerçek dışı yapıların hepsi aynı mantıkla çalışıyor => Bir kez öğrenince hepsi çözülür: zamanı bir adım geriye götür.
:::

## 2. Wish ve if only

**Wish**, gerçeğin tersini ya da değişmesini istediğin bir durumu anlatır. **If only** aynı anlamı daha güçlü verir.

| Anlam | Kalıp | Örnek |
| --- | --- | --- |
| Şimdi için dilek | wish + **Simple Past** | I **wish** I **had** more time. |
| Geçmiş için pişmanlık | wish + **Past Perfect** | I **wish** I **had accepted** the offer. |
| Gelecek ya da başkasının davranışı için istek | wish + **would** + V1 | I **wish** he **would stop** shouting. |
| Şimdi için yetenek | wish + **could** + V1 | I **wish** I **could** play the piano. |
| Geçmişte yeteneğin eksikliği | wish + **could have** + V3 | I wish I **could have attended**. |

### Şimdi: wish + Simple Past

Gerçekte olmayan bir şimdiki durumu dile getirir.

- I wish I **had** more free time. (Gerçekte az vaktim var.)
- She wishes she **lived** closer. (Uzakta yaşıyor.)
- I wish it **were** summer. (Yaz değil.)

**Be fiilinde** tüm kişilerle **were** kullanılır: “I wish I **were** taller.” Günlük dilde was de duyulur.

### Geçmiş: wish + Past Perfect

Geçmişte olmuş ya da olmamış şeye pişmanlık.

- I wish I **had accepted** the offer. (Kabul etmedim.)
- She wishes she **hadn’t said** that. (Söyledi.)

### Gelecek ve rahatsızlık: wish + would

Bir şeyin değişmesini ya da bir kişinin davranışını bırakmasını istemek için.

- I wish it **would stop** raining.
- I wish my neighbours **wouldn’t make** so much noise.
- I wish you **would listen** to me.

:::baglanti
**Wish + would**, konuşanın **dışındaki biri ya da bir şeyin** değişmesini ya da bir rahatsızlığın bitmesini ister (I wish it would stop, I wish he would listen). Konuşanın kendi durumu için kullanılmaz: “I wish I would be taller” yanlıştır, “I wish I were taller” doğrudur.
:::

### If only

If only, wish ile aynı kalıpları kullanır ama duygusu daha yoğundur.

- **If only** I **knew** the answer! (şimdi)
- **If only** he **had noticed** the warning signs. (geçmiş)
- **If only** it **would** stop raining! (istek)

### Wish ve hope

| Wish | Hope |
| --- | --- |
| Gerçek dışı ya da pek mümkün olmayan | Mümkün olan |
| I wish I **had** a car. (yok) | I hope you **have** a good trip. (olabilir) |
| zamanı bir adım geri götürür | zamanı değiştirmez, will bile alabilir |

## 3. As if ve as though

Bu iki yapı “sanki, -mış gibi” anlamı taşır. Eşanlamlıdırlar.

| Durum | Zaman | Örnek |
| --- | --- | --- |
| **Gerçek dışı** (şu an doğru değil) | Past | He talks as if he **knew** everything. (bilmiyor) |
| **Gerçek dışı geçmiş** | Past Perfect | He talks as though he **had lived** there. (yaşamadı) |
| **Gerçek ya da olası** | Present | It looks as if it **is** going to rain. (muhtemelen yağacak) |

### Gerçek mi gerçek dışı mı

- “She looks as if she **is** tired.” (gerçekten yorgun görünüyor, doğru olabilir)
- “She acts as if she **were** the boss.” (patron değil)

Kural: Konuşan söylenenin **doğru olmadığını** düşünüyorsa zaman geriye gider. Doğru olabileceğini düşünüyorsa zaman normal kalır.

## 4. Would rather

“Would rather”, bir tercih bildirir. Dört kalıbı vardır.

| Kalıp | Örnek |
| --- | --- |
| would rather + V1 (öznenin kendi tercihi) | I **would rather stay** home. |
| would rather + V1 + than + V1 | I would rather **walk than wait**. |
| would rather + **başka özne** + **Simple Past** (şimdi ya da gelecek) | I **would rather you stayed** home. |
| would rather + başka özne + **Past Perfect** (geçmiş) | I **would rather you had told** me the truth. |

Başka kişi için kullanıldığında kalıp **wish** kuralına benzer: **zaman bir adım geriye gider**.

## 5. It’s time

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| It’s time + **to V1** | zamanı geldi | It’s time **to leave**. |
| It’s time + özne + **Simple Past** | bir eylemin vakti geldi, hatta geçti | It’s time we **left**. |
| It’s **high** time + özne + Simple Past | zamanı çoktan geçti | It’s high time the government **took** action. |
| It’s about time + özne + Simple Past | artık zamanı geldi, gecikti | It’s about time you **found** a job. |

“It’s time we **leave**” konuşma dilinde duyulur ama standart değildir, “left” tercih edilir.

## 6. Suppose, supposing, imagine

Bu sözcükler varsayımsal durumlar kurar ve if gibi çalışır.

- **Suppose** you won the lottery, what would you do?
- **Supposing** he had refused, what would you have done?
- **Imagine** you could fly. Where would you go?

Zaman kuralı koşul cümleleriyle aynıdır: Past => would V1, Past Perfect => would have V3.

## 7. Wish ile ilgili kalıplar

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| wish + isim | (iyi dilek) | I **wish** you luck. |
| wish + to V1 | (resmî) istemek | I **wish to** speak to the manager. |
| wish for | -i temenni etmek | She **wished for** a better future. |
| wish + someone + isim | | We **wish** you a happy birthday. |

Bu kullanımlarda zaman geri gitmez.

## 8. Çözüm yolu

1. **Gerçek durum nedir?** Cümlede söylenen durum doğru mu, değil mi?
2. **Zaman ne?** Şimdi mi, geçmiş mi, gelecek mi?
3. **Kalıp seç.**
   - Şimdi => wish + Simple Past
   - Geçmiş => wish + Past Perfect
   - İstek ya da rahatsızlık => wish + would
   - Yetenek => wish + could
4. **Bağlam sözcüklerine bak.** Yesterday, last year (geçmiş), these days, now (şimdi).
5. **Seçenekleri sına.** Wish’ten sonra present ya da will gelen seçenekleri hemen ele.

## Aklında kalsın

- **wish + Simple Past**: şimdi için dilek. (I wish I **had** time.)
- **wish + Past Perfect**: geçmiş için pişmanlık. (I wish I **had known**.)
- **wish + would**: başkasının davranışı ya da değişim isteği. (I wish he **would stop**.)
- **wish + could**: yetenek isteği. (I wish I **could** swim.)
- **be** için **were** (I wish I **were**).
- **if only** wish ile aynı, daha yoğun.
- **as if / as though**: gerçek dışıysa zaman geri gider, gerçekse normal.
- **would rather + özne + past**: başkasından tercih.
- **It’s (high) time + özne + past**: zamanı geçti.
- **hope**: gerçek olabilecek dilek, zaman değişmez.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| I wish I have more time | **I wish I had more time** |
| I wish I will pass | **I hope I will pass** ya da I wish I could pass |
| I wish I would be taller | **I wish I were taller** |
| I wish it didn’t rain tomorrow | **I wish it wouldn’t rain tomorrow** |
| He talks as if he knows everything (bilmiyor olduğunu düşünüyorsan) | gerçek dışıysa past tercih edilir: **as if he knew everything**. Present, durum gerçek olabilecekse doğrudur. |
| I’d rather you don’t smoke | **I’d rather you didn’t smoke** |
| It’s time we leave | **It’s time we left** (leave konuşmada duyulur, standart değil) |
| If only I knew yesterday | **If only I had known yesterday** |
| I hope I had more time | **I wish I had more time** |
| wish ve hope | wish: gerçek dışı. hope: mümkün olan. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="E"}
I wish I ---- more free time these days, but my schedule is full.

- A) will have
- B) would have
- C) have
- D) am having
- E) had

---

1. “These days” şimdiki zamanı gösteriyor ve cümlenin sonu gerçeği söylüyor: boş vakit yok. Bu **şimdiki zamana dair bir dilek**.
2. Şimdiki dilek için **wish + Simple Past**: I wish I **had**.
3. A, C ve D normal zamanlardır, wish ile kullanılmaz. B bir değişim isteği kurar ve anlama uymaz. Doğru cevap **had**.
:::

:::soru{cevap="A"}
She wishes she ---- the offer last year, because the job she turned down paid much better.

- A) had accepted
- B) accepted
- C) would accept
- D) has accepted
- E) could accept

---

1. **Last year** geçmişi gösteriyor ve cümle bir **pişmanlık** taşıyor: teklifi kabul etmedi.
2. Geçmiş pişmanlık için **wish + Past Perfect**: wishes she **had accepted**.
3. B şimdiki dilek için, C ve E gelecek ya da yetenek için, D ise normal zaman. Doğru cevap **had accepted**.
:::

:::soru{cevap="B"}
It has been raining for three days. I wish it ---- soon.

- A) stops
- B) would stop
- C) stopped
- D) had stopped
- E) has stopped

---

1. Yağmurun bitmesini istiyor ve bu istek **gelecekle** ilgili: bir değişim bekliyor.
2. Değişim isteği için **wish + would + V1**: I wish it **would stop**.
3. A ve E normal zamanlar. C şimdiki durum için dilek kurar ve “soon” ile uyuşmaz. D geçmiş pişmanlık anlamı verir. Doğru cevap **would stop**.
:::

:::soru{cevap="D"}
If only he ---- the warning signs earlier, the accident could have been avoided.

- A) noticed
- B) notices
- C) would notice
- D) had noticed
- E) has noticed

---

1. **Earlier** ve **could have been avoided** geçmişte yaşanmış bir olaya pişmanlığı gösteriyor.
2. If only + **Past Perfect**: if only he **had noticed**.
3. A şimdiki dilek anlamı verir. B ve E normal zamanlar. C bir istek kurar ve geçmişe uymaz. Doğru cevap **had noticed**.
:::

:::soru{cevap="B"}
He talks about the city ---- he had lived there all his life, but he has never been there.

- A) as long as
- B) as though
- C) so that
- D) even if
- E) in case

---

1. Cümlenin ikinci yarısı gerçeği söylüyor: hiç gitmedi. Birinci yarı gerçek dışı bir izlenim veriyor: **yaşamış gibi**.
2. Gerçek dışı karşılaştırmada **as though** (ya da as if) + Past Perfect kullanılır.
3. As long as bir koşul, so that amaç, even if varsayımsal karşıtlık, in case önlem bildirir. Doğru cevap **as though**.
:::

:::soru{cevap="C"}
I would rather you ---- me the truth when I asked.

- A) told
- B) tell
- C) had told
- D) would tell
- E) tells

---

1. “Would rather + başka özne” kalıbı kullanılıyor. **When I asked** geçmişi gösteriyor.
2. Geçmişe dair tercih için **would rather + özne + Past Perfect**: would rather you **had told**.
3. A şimdi ya da gelecek için, B ve E normal zaman, D kalıba uymuyor. Doğru cevap **had told**.
:::

:::soru{cevap="C"}
It’s high time the government ---- action to protect the rivers.

- A) takes
- B) will take
- C) took
- D) has taken
- E) would be taking

---

1. **It’s high time** + özne kalıbında, zamanı geçmiş bir eylemi dile getiriyor.
2. Kalıbın zamanı **Simple Past**: It’s high time the government **took** action.
3. A ve D normal zamanlardır. B gelecek kurar. E kalıba uymaz. Doğru cevap **took**.
:::

:::soru{cevap="A"}
I wish I ---- play the piano, but I never had lessons.

- A) could
- B) can
- C) would
- D) will
- E) must

---

1. Yetenek isteği ve **şimdi** için: çalamıyor, çalabilmeyi diliyor.
2. Yetenek için **wish + could + V1**: I wish I **could** play.
3. B ve D wish ile kullanılmaz. C bir davranış değişimi isteği kurar. E zorunluluk bildirir. Doğru cevap **could**.
:::

:::ipucu{baslik="İpucu"}
Wish sorusunda **gerçek durumu** söyle: “Aslında … yok / değil / yapmadı.” Sonra dileği bir adım geriye götür: present => past, past => past perfect.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “I wish I ---- a car.” (şimdi, yok) => had.
2. “I wish I ---- harder last year.” (study, pişmanlık) => had studied.
3. “I wish it ---- raining.” (stop, istek) => would stop.
4. “If only I ---- the answer!” (know, şimdi) => knew.
5. “She acts as if she ---- the boss.” (be, değil) => were.
6. “I’d rather you ---- here.” (not smoke, şimdi) => didn’t smoke.
7. “It’s time we ---- .” (leave) => left.
8. “I wish I ---- fly.” (yetenek) => could.
9. “I wish I ---- taller.” (be) => were.
10. “I ---- you have a safe trip.” (wish mi hope mu?) => hope. Gerçekleşebilir bir dilek.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 30, false from public.topics where subject_id = 'ydt-dil' and name = 'Wish Clauses';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Gerund (V-ing) ve infinitive (to V1) fiilin isim gibi kullanılan biçimleridir. İkisi de fiilimsi (verbal) ailesinden gelir ve YDT’de **sınavın 8. sorusu (dilbilgisi bölümünün 3. maddesi)** hemen her yıl fiilimsi sorar. Hangi fiilden sonra hangisinin geldiğini bilmek bir ezber işidir ama düzenli bir ezber: listeler kısadır. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Gerund ve infinitive arasındaki farkı ve görevlerini (özne, nesne, amaç, edat sonrası) ayırt etmek.
2. Fiilden sonra gerund mı infinitive mi geldiğini kalıp listesinden bulmak.
3. Anlamı değiştiren fiilleri (remember, forget, stop, try, regret, go on) doğru yorumlamak.
4. Fiil + nesne + to V1 kalıbını (allow someone to, enable someone to) kullanmak.
5. Edattan sonra gerund, sıfat ve isimden sonra infinitive gelmesini kurmak.
6. Perfect ve passive biçimleri (to have done, being done, to have been done) seçmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 6., 7. ve 8. sorusunda (dilbilgisi bölümünün ilk üç maddesi) ve cloze testteki fiil biçimi boşluklarında fiilimsi sık çıkar. İlk adım her zaman: **boşluktan önceki sözcük ne?** Fiilse listeden bak. Edatsa gerund. Sıfat ya da isimse çoğunlukla infinitive. Bu üç kural sorunun çoğunu çözer.
:::

## 1. YDT’de gerund ve infinitive nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki 24 fiil biçimi sorusuna bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. 24 sorunun **10’unda** bir boşluk fiilimsidir. Bu fiilimsiler üç grupta toplanır.

| Grup | Doğru seçenekte görülen kalıplar |
| --- | --- |
| Edat sonrası gerund | in return for **hanging** (2018) |
| Amaç ya da sonuç infinitive | the right temperatures **to support** life (2022), songs sung **to attract** good spirits (2023), enable groups **to support** towns (2024) |
| Kısaltılmış cümlecik (participle) | a reef **extending** (2019), **serving** as a route (2020), **surrounding** the Sun (2022), when **painting** (2024), sources **referring** (2025) |

Aynı bilgi cloze testlerde de karşına çıkıyor. Kırk cloze boşluğunun sekizi fiil biçimiydi ve bunların dördü fiilimsiydi: **overseen** (2020), **to proceed** (2021), **to eliminate** (2024), **to govern** (2025).

:::neden-sonuc
- 10 fiilimsi sorusunun 4’ünde doğru cevap gerund ya da infinitive => Fiil listelerini ve edat kuralını bilmek bu soruları çözer.
- 8’inde -ing ya da -ed ile kısaltılmış cümlecik (participle) var, ikisinde infinitive ile birlikte => Bu konunun devamı Participles konusu.
- Seçeneklerde hep aynı fiilin farklı biçimleri => Cevabı bulmak için fiilin hangi biçimi aldığını bilmek gerekir.
- Fiilimsi sorusu genellikle iki boşluklu ve öteki boşluk zaman, modal ya da edilgen => İki boşluğu birlikte çöz.
:::

## 2. Gerund (V-ing)

Gerund fiilin **isim gibi** kullanılan -ing biçimidir.

| Görevi | Örnek |
| --- | --- |
| Özne | **Reading** improves vocabulary. |
| Nesne | She enjoys **reading**. |
| Edat sonrası | He is good at **drawing**. |
| İsim tamlaması | a **swimming** pool, a **washing** machine |

Olumsuz: **not + V-ing**. “He regrets not studying harder.”

## 3. Gerund alan fiiller

Bu fiillerden sonra **yalnızca gerund** gelir. Sınavda en çok çıkanlar kalın.

| Fiil | Anlam | Örnek |
| --- | --- | --- |
| **avoid** | kaçınmak | He avoided answering. |
| **consider** | düşünmek | Consider changing the plan. |
| **suggest** | önermek | She suggested going out. |
| **deny** | inkâr etmek | He denied stealing. |
| **admit** | itiraf etmek | She admitted breaking it. |
| **enjoy** | keyif almak | I enjoy cooking. |
| **finish** | bitirmek | Finish reading first. |
| **mind** | sakıncası olmak | Do you mind waiting? |
| **postpone, delay, put off** | ertelemek | They postponed announcing it. |
| **risk** | riske girmek | He risked losing his job. |
| **keep, keep on** | sürdürmek | Keep trying. |
| **practise** | alıştırma yapmak | Practise speaking daily. |
| **miss** | özlemek, kaçırmak | I miss living there. |
| **imagine** | hayal etmek | Imagine flying. |
| **involve** | gerektirmek | The job involves travelling. |
| **recommend** | tavsiye etmek | I recommend visiting early. |
| **give up, carry on** | vazgeçmek, sürdürmek | She gave up smoking. |
| **can’t help** | kendini tutamamak | I can’t help laughing. |
| **it’s worth, it’s no use, it’s no good** | değer, faydasız | It’s worth trying. |
| **be used to, get used to** | alışkın olmak | I’m used to waking early. |
| **look forward to, object to** | sabırsızlanmak, itiraz etmek | I look forward to meeting you. |

:::ipucu
**Suggest** ve **recommend** gibi fiillerden sonra “to + V1” gelmez. “She suggested to go out” yanlıştır. Doğrusu “She suggested **going** out” ya da “She suggested **that we go** out”.
:::

## 4. Infinitive alan fiiller

Bu fiillerden sonra **to + V1** gelir.

| Fiil | Anlam | Örnek |
| --- | --- | --- |
| **decide** | karar vermek | They decided to leave. |
| **plan, intend** | planlamak | We plan to expand. |
| **hope, wish** | ummak | I hope to see you. |
| **expect** | beklemek | She expects to win. |
| **want, would like** | istemek | He wants to travel. |
| **need** | gerek duymak | You need to register. |
| **manage** | başarmak | He managed to escape. |
| **fail** | başaramamak | They failed to notice. |
| **refuse** | reddetmek | She refused to speak. |
| **promise, agree** | söz vermek, kabul etmek | They agreed to help. |
| **offer** | önermek | He offered to pay. |
| **afford** | gücü yetmek | We can’t afford to buy. |
| **tend** | eğilimli olmak | Prices tend to rise. |
| **seem, appear** | görünmek | He seems to know. |
| **pretend** | numara yapmak | She pretended to sleep. |
| **learn, choose, arrange** | öğrenmek, seçmek, ayarlamak | He learned to drive. |

### Fiil + nesne + infinitive

Bu fiillerden sonra bir **kişi** gelir, ardından **to V1**.

| Kalıp | Örnek |
| --- | --- |
| allow / permit someone to | The law **allows citizens to** vote at 18. |
| enable someone to | Technology **enables researchers to** analyse data. |
| ask, tell, order someone to | She **told him to** wait. |
| want, expect, would like someone to | They **expect us to** arrive. |
| force, require, oblige someone to | The rules **require students to** wear uniforms. |
| encourage, persuade, advise someone to | He **encouraged her to** apply. |
| invite, warn, remind someone to | I **reminded him to** call. |
| cause, lead someone to | This **caused many to** leave. |

:::baglanti
**Enable** 2024’te çıktı, **allow** ile aynı kalıbı kurar. “Enable cultivating groups **to support** towns” gibi bir cümlede enable’dan sonra isim, sonra to V1 gelir. Bu kalıp 2024’te doğru cevaptı.
:::

## 5. İkisini de alan fiiller

### Anlamı değişmeyenler

begin, start, continue, like, love, hate, prefer: “She began **working**” ve “She began **to work**” aynı anlamda.

### Anlamı değişenler

Bu bölüm sınavın can alıcı kısmı. Aynı fiil, gerund ya da infinitive ile **farklı anlam** taşır.

| Fiil | + V-ing | + to V1 |
| --- | --- | --- |
| **remember** | daha önce yaptığını hatırlamak | yapması gerekeni unutmamak |
| **forget** | yaptığını unutmak | yapması gerekeni unutmak |
| **stop** | yaptığı işi bırakmak | bir işi yapmak için durmak |
| **try** | denemek, deneme olarak yapmak | çabalamak, uğraşmak |
| **regret** | yaptığına pişman olmak | (resmî) üzülerek bildirmek |
| **go on** | sürdürmek | bir sonraki işe geçmek |
| **mean** | demek olmak, gerektirmek | niyet etmek |
| **need** | (edilgen anlam) gerekmek | yapmak gerekmek |

Örnekler:

- I clearly **remember locking** the door. (kapıyı kilitlediğimi hatırlıyorum)
- Please **remember to lock** the door. (kilitlemeyi unutma)
- He **stopped smoking** last year. (sigarayı bıraktı)
- He **stopped to smoke** outside. (sigara içmek için durdu)
- I **tried opening** the window, but it was still hot. (denedim, işe yaramadı)
- I **tried to open** the window, but it was stuck. (açmaya çalıştım, açılmadı)
- She **regrets not telling** him. (söylemediğine pişman)
- We **regret to inform** you that the flight is cancelled. (üzülerek bildiririz)

:::ipucu{baslik="remember, forget, stop"}
**Bir iş önce yapıldıysa ve sonra hatırlanıyorsa** remember / forget + V-ing. **Bir iş hatırlanmalı ve sonra yapılmalıysa** remember / forget + to V1. Stop için ise ayrımı “bıraktı” (V-ing) ve “durup yaptı” (to V1) olarak yap.
:::

## 6. Bare infinitive (to’suz)

Aşağıdaki durumlarda **to gelmez**, yalın fiil (V1) kullanılır.

| Durum | Örnek |
| --- | --- |
| Modal fiillerden sonra | She **can swim**. |
| had better, would rather | You had better **leave**. |
| make, let, have + nesne | They **made him wait**. She **let us go**. |
| help + nesne | She **helped me (to) find** it. |
| see, hear, watch + nesne (olay bütün) | I **saw him enter**. |
| see, hear, watch + nesne + V-ing (olay sürüyor) | I **saw him entering**. |

:::baglanti
**Make** edilgen olduğunda to geri gelir. “They **made him wait**” ama “He **was made to wait**.” **Let** ise edilgende “be allowed to” olur.
:::

## 7. Edat sonrası gerund, sıfat ve isim sonrası infinitive

### Edat + gerund

Edattan sonra çoğu zaman isim ya da gerund gelir. Fiilin yalın hâli ya da to V1 gelmez (istisna: no choice but to, what to do gibi kalıplar).

- She insisted **on going**. (insist on)
- He is interested **in learning**. (be interested in)
- Before **leaving**, switch off the lights.
- In return for **hanging** a placard, she received sponsorship.
- Thanks to **working** together, they finished early.

**To** bazen edattır, o zaman gerund alır: look forward to, be used to, object to, be committed to, be devoted to, with a view to, in addition to.

### Sıfat + infinitive

| Kalıp | Örnek |
| --- | --- |
| sıfat + to V1 | easy to use, ready to start, likely to fail, able to help |
| too + sıfat + to V1 | too tired **to work** |
| sıfat + enough + to V1 | old enough **to vote** |
| sıfat + enough + for + nesne + to V1 | wide enough **for two trucks to pass** |

### İsim + infinitive

| Kalıp | Örnek |
| --- | --- |
| the ability to, the chance to, the right to | the right **to vote** |
| the first, the last, the only + to V1 | the first country **to eliminate** the disease |
| a way to, a reason to, a time to | a reason **to celebrate** |
| the need to, the decision to, the attempt to | the decision **to leave** |

### Amaç bildiren infinitive

| Kalıp | Örnek |
| --- | --- |
| to V1 | They use drones **to monitor** forests. |
| in order to V1 | He saved money **in order to buy** a car. |
| so as to V1 | She left early **so as not to miss** the bus. |

### Soru sözcükleri + infinitive

how to, what to, where to, when to, whether to: “I don’t know **what to do**.”

## 8. Perfect ve passive biçimler

| Biçim | Anlam | Örnek |
| --- | --- | --- |
| to V1 | şimdi ya da sonra | She seems **to know** the answer. |
| to be V-ing | o anda sürüyor | She seems **to be working**. |
| to have V3 | daha önce yapılmış | She seems **to have made** a mistake. |
| to be V3 | edilgen | He wants **to be told**. |
| to have been V3 | geçmişte edilgen | The city is thought **to have been destroyed**. |
| being V3 | edilgen gerund | He enjoys **being praised**. |
| having V3 | önceden yapılmış gerund | He denied **having seen** her. |

Bu biçimler özellikle seem, appear, claim, believe, be said, be thought kalıplarında sorulur. Zaman farkı anlam kurar: söylenen zamandan **önce** olmuşsa **to have V3**.

## 9. Çözüm yolu

1. **Boşluğun hemen önündeki sözcüğe bak.** Fiil, edat, sıfat ya da isim?
2. **Edatsa** gerund (V-ing).
3. **Fiilse** listeden bak: gerund mı, infinitive mı, nesneli mi?
4. **Sıfat ve isimse** çoğunlukla infinitive.
5. **Amaç mı?** To V1 ya da in order to V1.
6. **Seçeneklerde zaman farkı var mı?** to V1 / to have V3 / to be V-ing. Cümlenin zamanına göre seç.
7. **Edilgen mi?** Özne eylemi yapıyor mu, alıyor mu?

## Aklında kalsın

- **Edattan sonra** gerund: interested in learning, before leaving, in return for hanging.
- **Gerund alan**: avoid, consider, suggest, deny, admit, enjoy, finish, mind, postpone, risk, keep, practise, miss, imagine, recommend, give up.
- **Infinitive alan**: decide, plan, hope, expect, want, need, manage, fail, refuse, promise, agree, offer, afford, tend, seem, pretend.
- **Fiil + nesne + to V1**: allow, enable, ask, tell, force, require, encourage, advise, expect, want, persuade.
- **remember doing**: yaptığını hatırlamak. **remember to do**: yapmayı unutmamak.
- **stop doing**: bırakmak. **stop to do**: durup yapmak.
- **try doing**: denemek. **try to do**: çabalamak.
- **to** edat olabilir: look forward to, be used to, object to + V-ing.
- **Make / let / have + nesne + V1** (to’suz). Edilgende make’ten sonra to geri gelir.
- **Sıfat ve isimden sonra** çoğunlukla to V1: ready to, the first to, the ability to.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| suggest to go | **suggest going** ya da suggest that we go. |
| avoid to make | **avoid making**. |
| enjoy to read | **enjoy reading**. |
| decide going | **decide to go**. |
| want going | **want to go** ya da want someone to go. |
| insist on to go | **insist on going**. |
| look forward to see | **look forward to seeing**. |
| be used to do (alışkın anlamında) | **be used to doing**. |
| make him to wait | **make him wait**. |
| he was made wait | **he was made to wait**. |
| allow to go | **allow someone to go**, nesne gerekir. |
| enable to analyse | **enable researchers to analyse**, nesne gerekir. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Üçü iki boşluklu.

:::soru{cevap="B"}
The government has decided ---- the speed limit in residential areas, and drivers will be asked ---- more carefully near schools.

- A) reducing / drive
- B) to reduce / to drive
- C) to reduce / driving
- D) reduce / driving
- E) reducing / driving

---

1. **decide** infinitive alır: decided **to reduce**.
2. **ask someone to V1** kalıbı edilgende de sürer: drivers will be asked **to drive**.
3. Diğer seçeneklerde en az bir boşluk gerund ya da yalın fiil. Doğru cevap **to reduce / to drive**.
:::

:::soru{cevap="E"}
Scientists avoid ---- conclusions before ---- all the evidence.

- A) to draw / to examine
- B) drawing / to examine
- C) to draw / examining
- D) draw / examine
- E) drawing / examining

---

1. **avoid** gerund alır: avoid **drawing**. Avoid to draw yanlıştır.
2. **before** bir edat olarak da kullanılır ve sonrasında gerund gelir: before **examining**.
3. Doğru cevap **drawing / examining**.
:::

:::soru{cevap="A"}
I clearly remember ---- the document, but I can’t find it now.

- A) signing
- B) to sign
- C) sign
- D) to be signing
- E) signed

---

1. Konuşan belgeyi **imzaladığını hatırlıyor**: yapılan bir iş sonradan hatırlanıyor.
2. Bu anlam **remember + V-ing** ile kurulur: remember **signing**.
3. “Remember to sign” bir görevi yapmayı unutmamak demek ve anlama uymaz. Doğru cevap **signing**.
:::

:::soru{cevap="B"}
On the way to the airport, we stopped ---- some coffee, and then we continued our journey.

- A) buying
- B) to buy
- C) buy
- D) bought
- E) to buying

---

1. Yolculuk **durdu**, kahve almak için. Durmanın **amacı** kahve almak.
2. Amaç için **stop + to V1**: stopped **to buy**.
3. “Stopped buying” kahve almayı bıraktık demek olur. Doğru cevap **to buy**.
:::

:::soru{cevap="D"}
New technology allows researchers ---- huge amounts of data in a few seconds.

- A) analysing
- B) analyse
- C) analysed
- D) to analyse
- E) having analysed

---

1. **allow** nesne + infinitive alır: allows **researchers to analyse**.
2. Allow doğrudan gerund da alabilir (“allow analysing”) ama arada kişi (researchers) varsa to V1 kullanılır.
3. Doğru cevap **to analyse**.
:::

:::soru{cevap="A"}
Many people are interested in ---- a second language, but few of them are really committed to ---- it regularly.

- A) learning / practising
- B) to learn / to practise
- C) learning / practise
- D) learn / practising
- E) to learn / practising

---

1. **be interested in** edat içerir: interested in **learning**.
2. **be committed to** burada **to bir edattır**: committed to **practising**.
3. C seçeneğinde ikinci boşluk yalın fiil. B’de iki boşluk da infinitive. Doğru cevap **learning / practising**.
:::

:::soru{cevap="C"}
The tunnel is wide enough ---- two trucks to pass at the same time.

- A) so as
- B) that
- C) for
- D) to
- E) of

---

1. **enough** sıfatın arkasından gelir. Kalıp: **sıfat + enough + for + nesne + to V1**.
2. Araya bir kişi ya da şey (two trucks) girdiğinde for gerekir: wide enough **for** two trucks **to pass**.
3. Nesne olmasaydı: “wide enough to pass”. Doğru cevap **for**.
:::

:::soru{cevap="C"}
The company seems ---- a serious mistake last year, because its profits have fallen sharply.

- A) making
- B) to make
- C) to have made
- D) to be making
- E) having made

---

1. **seem** infinitive alır, seçenekler arasında tek yol to’lu biçim.
2. **Last year** geçmişi gösterir ve konuşma anından **önce** olmuş bir olay. Önce olan olay için **to have + V3**.
3. B şimdiki ya da gelecek, D ise o anda sürüyor anlamı verir. Doğru cevap **to have made**.
:::

:::ipucu{baslik="İpucu"}
Fiilimsi sorusunda önce **boşluğun önündeki sözcüğe** bak. Fiil ise listeden, edat ise gerund, sıfat ya da isim ise infinitive. Sonra zamana bak: önce mi olmuş (to have V3), sürüyor mu (to be V-ing)?
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “She suggested ---- out for dinner.” (go) => going.
2. “They decided ---- the contract.” (sign) => to sign.
3. “He denied ---- the money.” (take, basit biçim) => taking (having taken de olur).
4. “I look forward to ---- you.” (meet) => meeting. To burada edat.
5. “Please remember ---- the door when you leave.” (lock) => to lock.
6. “I remember ---- the door, I’m sure.” (lock) => locking.
7. “They made him ---- the room.” (leave) => leave. Make + nesne + V1.
8. “He was made ---- the room.” (leave) => to leave. Edilgende to geri gelir.
9. “The law allows citizens ---- at 18.” (vote) => to vote.
10. “She is the first woman ---- the prize.” (win) => to win (to have won da olur).
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 35, false from public.topics where subject_id = 'ydt-dil' and name = 'Gerunds ve Infinitives';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Belirleyiciler (determiners) ve nicelik sözcükleri (quantifiers), isimlerin **önüne** gelen küçük sözcüklerdir: a, the, this, my, some, any, many, much, few, little, each, every, both, all, no, another, other. Küçüktürler ama **YDT’de her yıl bir dilbilgisi sorusu** bu konudan çıkar. Soru hep aynı kalıptadır: iki boşluk, ikisinde de nicelik sözcüğü, ikisi birlikte anlamlı olmalı. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Sayılabilir ve sayılamaz isimlerle kullanılan nicelik sözcüklerini (many, much, few, little) ayırt etmek.
2. Few ile a few, little ile a little arasındaki anlam farkını bilmek.
3. Some, any, no, none ve not any sözcüklerini cümle türüne göre seçmek.
4. Each, every, all, both, either, neither sözcüklerinin sonrasında tekil mi çoğul mu geldiğini bilmek.
5. Other, another, the other, others, the others, each other farkını kurmak.
6. A number of ile the number of gibi özne-fiil uyumu tuzaklarını tanımak.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 13. sorusu (dilbilgisi bölümünün 8. maddesi) her yıl **belirleyici ve nicelik** sorusudur. İki boşluk birlikte okunur: önce her boşluğun sonrasındaki isme bak (sayılabilir mi, sayılamaz mı, tekil mi, çoğul mu?), sonra iki yarı cümle arasındaki **mantık ilişkisine** bak (karşıtlık mı, ek bilgi mi?).
:::

## 1. YDT’de belirleyici ve nicelik sorusu nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. Her yıl sınavın 13. sorusu bu konudan geldi (toplam 8 soru).

| Yıl | Doğru çift | Kalıp |
| --- | --- | --- |
| 2018 | every / anybody | Not every ... but anybody |
| 2019 | one / each | from one ... to the next, each ... |
| 2020 | no / other | no ... other ... |
| 2021 | several / much | several thousand, much sought after |
| 2022 | no one / most | No one ... most scientists |
| 2023 | very few / no | very few ... no ... |
| 2024 | all / other | all ... other ... |
| 2025 | some / most | Although some ..., most ... |

:::neden-sonuc
- 16 boşluğun 4’ü every, each ve other sözcükleri => Bu sözcükler arasındaki farkı iyi bilmek en yüksek getiri.
- Üç çift Although ya da but içeren karşıtlık cümlelerinde (not every / anybody, no one / most, some / most) => Karşıtlık varsa iki nicelik sözcüğü genelde **zıt** olur.
- Dört çift olumsuz anlamlı (not every, no, no one, very few / no) => Olumsuz nicelik sözcüklerinin fiille çelişmeden kullanımını bil.
- Sayılamaz isimle nicelik sözcüğü doğrudan sınanmadı, much 2021’de zarf olarak çıktı (much sought after) => Sayılabilir ve sayılamaz ayrımı yine de önemli, tuzak olarak seçeneklere girer.
:::

## 2. Belirleyici nedir

Belirleyiciler, isimlerin **önüne** gelir ve ismin hangisi, ne kadar, kimin olduğunu söyler.

| Tür | Örnek |
| --- | --- |
| Artikel (article) | a, an, the |
| İşaret | this, that, these, those |
| İyelik | my, your, his, her, its, our, their |
| Nicelik | some, any, no, many, much, few, little, several, enough, all, most |
| Dağıtım | each, every, either, neither, both |
| Sayı | one, two, first, second |
| Diğer | another, other, the other |

Bir ismin önünde çoğu zaman tek belirleyici bulunur: “the my book”, “a this table” yanlıştır. Birlikte gelenler belirli kalıplardır (all the, both my, the first two, the other).

## 3. Sayılabilir ve sayılamaz isimlerle

Sayılabilir tekil isim: a book, one idea. Sayılabilir çoğul isim: books, ideas. Sayılamaz isim: water, information, evidence, advice, knowledge, equipment, progress, research.

| Anlam | Sayılabilir çoğul | Sayılamaz |
| --- | --- | --- |
| çok | many | much |
| az (olumlu, “biraz var”) | a few | a little |
| az (olumsuz, “neredeyse yok”) | few | little |
| biraz, bazı | some | some |
| hiç, bir tane bile | no, not any, none | no, not any, none |
| yeterli | enough | enough |
| çok (iki türle de) | a lot of, plenty of | a lot of, plenty of |
| birkaç | several | (kullanılmaz) |
| tümü | all | all |
| çoğu | most | most |

### Few ve a few, little ve a little

- **a few / a little**: olumlu, “biraz var, işe yarar”. We have **a few** tickets left.
- **few / little**: olumsuz, “neredeyse hiç”. We have **few** tickets left. (Pek yok.)
- **very few / very little**: daha da güçlü olumsuz.

:::ipucu{baslik="few mu a few mu?"}
Cümle **olumsuz bir yargı** taşıyorsa (so, but, only, too, hardly, however...) few / little. **Olumlu ya da dengeli** ise a few / a little. “Very a few” demek yanlıştır, very yalnızca few ve little ile kullanılır.
:::

### Many, much

- **many** sayılabilir çoğulla: many people, many ideas.
- **much** sayılamazla: much information, much money.
- Olumlu cümlede much yerine genelde **a lot of** kullanılır: She has a lot of experience. Much olumsuz ve soruda doğaldır, olumlu cümlede ise resmî ya da sabit kalıplarda (much sought after, too much).

## 4. Some, any, no, none

| Sözcük | Kullanım | Örnek |
| --- | --- | --- |
| some | olumlu cümle, teklif ve rica | There are **some** apples. Would you like **some** tea? |
| any | olumsuz ve soru cümlesi, if cümlesi | I don’t have **any** money. Do you have **any**? |
| any | olumlu cümlede “herhangi bir” | **Any** child can learn. |
| no | not any anlamı, olumlu fiille | She has **no** money. = She doesn’t have **any** money. |
| none | tek başına ya da of ile, isim yok | **None** of the candidates passed. |

### no ve none

- **no** + isim: **No** student passed.
- **none (of)**: **None** of the students passed. None kendi başına isimsiz kullanılır.
- **no one, nobody, nothing, nowhere**: olumsuz yapı. Bunlarla fiil **olumlu** olur: **No one** knows.

:::baglanti
Çifte olumsuz yapma. “She doesn’t have **no** money” yanlıştır. Doğrusu “She has **no** money” ya da “She doesn’t have **any** money”. Aynı kural “nobody doesn’t know” için geçerli.
:::

## 5. Each, every, all, both, either, neither

### each ve every

| Sözcük | Not | Örnek |
| --- | --- | --- |
| each | tek tek, ayrı ayrı. Her tür sayıda | **Each** student has a laptop. **Each of** the students has... |
| every | genel, hepsi birlikte. İkiden fazla | **Every** student has a laptop. |
| each of + çoğul isim | fiil tekil | **Each of the** nests **has** its own style. |
| every one of + çoğul isim | fiil tekil | **Every one of** the nests **has** its own style. |
| everyone, everybody, everything | fiil tekil | **Everyone** knows. |

**Each** ve **every**’den sonra tekil isim gelir ve fiil tekildir (each student, every nest). **Each of** ve **one of**’tan sonra çoğul isim gelir, fiil yine tekildir.

### all, most, some

- **all + çoğul ya da sayılamaz**: all students, all water. **all of the / all of them**.
- **most + çoğul ya da sayılamaz**: most scientists, most information. **most of the / most of them**.
- **some** da aynı şekilde: some scientists, some of the scientists.

Belirli bir gruptan söz ediyorsan **of + the/these/my/them** gerekir: most **of the** scientists, all **of them**, some **of my** friends. Genel konuşuyorsan of ve the gelmez: most scientists (genel olarak).

### both, either, neither

| Sözcük | Anlam | Fiil | Örnek |
| --- | --- | --- | --- |
| both | ikisi de | çoğul | **Both** proposals were rejected. |
| either | ikisinden biri | tekil | **Either** answer is correct. |
| neither | ikisi de değil | tekil | **Neither** of the proposals was accepted. |

İkiden fazla öğede both / either / neither kullanılmaz. Orada all / any / none kullanılır.

## 6. Other, another, the other, others, the others

Bu sözcükler çıkmış sorularda sık görülür.

| Sözcük | Kullanım | Örnek |
| --- | --- | --- |
| another | tekil, belirsiz, “bir başka”, “bir tane daha” | Please give me **another** chance. |
| other | çoğul isimle, önünde artikel yok (sayılamaz isimle genellikle different kullanılır) | **Other** people disagree. |
| the other | belirli, kalan. Zamir olarak tekil (çoğulu the others), belirleyici olarak tekil ya da çoğul isimle | One is red, **the other** is blue. |
| others | çoğul zamir, belirsiz | Some like tea, **others** prefer coffee. |
| the others | çoğul zamir, belirli, kalan hepsi | One left, **the others** stayed. |
| each other, one another | karşılıklı | They respect **each other**. |

### Üç kural

1. **another** = an + other. Yalnızca **tekil sayılabilir** isimle: another book. Çoğulla: another three books (sayı varsa).
2. **other** + çoğul isim: other books. **the other** + tekil ya da çoğul: the other book, the other books.
3. **one ... the other** iki öğe için. Üç öğe için: **one ... another ... the other**. Sınırsız sayı için: **some ... others**.

:::ipucu
**Belirleyicisiz other** tekil isimle gelmez: “the other book” (belirli) ya da “another book” (belirsiz) denir, “other book” denmez. (Any other, no other, every other + tekil isim olur.)
:::

## 7. Nicelik sözcüğü + of

| Doğru | Yanlış |
| --- | --- |
| most of the students | most the students |
| most students | most of students (genel anlamda) |
| a lot of money | a lot money |
| plenty of time | plenty time |
| a number of problems | number of problems |
| one of the reasons | one of reason |
| each of the nests | each of nest |

## 8. Özne-fiil uyumu

| Özne | Fiil | Örnek |
| --- | --- | --- |
| a number of + çoğul isim | çoğul | **A number of** tourists **visit** the island. |
| the number of + çoğul isim | tekil | **The number of** hotels **is** limited. |
| one of + çoğul isim | tekil | **One of the** reasons **is** cost. |
| each / every + tekil isim | tekil | **Every** nest **has** its own style. |
| both | çoğul | **Both** are correct. |
| either / neither | tekil | **Neither** was accepted. |
| none of the + çoğul isim | tekil ya da çoğul | **None of the** students **was / were** late. |
| a lot of / most of / all of + isim | isme göre | **Most of the** information **is** reliable. |

## 9. Artikeller (a, an, the)

Cloze ve çeviri sorularında ara sıra çıkan artikel kuralları.

| Kural | Örnek |
| --- | --- |
| İlk kez geçen sayılabilir tekil isim: **a / an** | I saw **a** film. |
| İkinci kez geçen ya da belli olan: **the** | **The** film was long. |
| Dünyada tek olan: **the** | the Sun, the Moon, the Earth |
| Üstünlük ve sıra sayıları: **the** | the biggest, the first |
| Genel anlamda çoğul ya da sayılamaz: **artikel yok** | Cats are independent. Water is essential. |
| Dil, ders, spor, öğün: artikel yok | I speak English. We play football. |
| Okul, hastane gibi yer kendi amacıyla: artikel yok | She is at school. He is in hospital. |

## 10. Çözüm yolu

1. **İki boşluğu ayrı ayrı oku.** Her birinin arkasındaki isim tekil mi, çoğul mu, sayılamaz mı?
2. **Kesin bildiğin boşlukla başla.** “very ---- evidence” (sayılamaz, olumsuz), “every ---- student” (tekil).
3. **Mantık ilişkisini bul.** Although, but, while varsa iki nicelik sözcüğü genelde **zıt** olur (few / most). And ya da also varsa **aynı yönde** olur.
4. **Fiile bak.** Tekil ya da çoğul fiil, nicelik sözcüğünü eler.
5. **Seçenekleri sına.** İki yarıyı da cümleye koy ve gramer ile anlamı birlikte kontrol et.

## Aklında kalsın

- Sayılabilir çoğul: **many, few, a few, several, both**. Sayılamaz: **much, little, a little**.
- **few / little**: olumsuz, neredeyse yok. **a few / a little**: olumlu, biraz var.
- **very**, few ve little’ı pekiştirir: very few, very little.
- **no**: isimle. **none**: tek başına ya da of ile. **no one, nobody**: tekil, olumlu fiille.
- **each, every**: tekil isim, tekil fiil. **each of / one of** + çoğul isim, tekil fiil.
- **another**: tekil. **other**: çoğul. **the other**: belirli. **others**: belirsiz çoğul zamir. **the others**: kalan hepsi.
- Belirli bir gruptan söz ederken **of + the**: most of the students. Genel anlamda: most students.
- **a number of**: çoğul fiil. **the number of**: tekil fiil.
- Karşıtlık cümlelerinde nicelik sözcükleri çoğunlukla zıt çifttir: some / most, few / many.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| much people | **many people**. |
| many information | **much information**. |
| a few water | **a little water**. |
| very a few | **very few**. |
| every students | **every student**. |
| each of student | **each of the students**. |
| other book | **another book** ya da the other book. |
| another books | **other books**. |
| most of students | **most students** ya da most of the students. |
| doesn’t have no | **doesn’t have any** ya da has no. |
| a number of … is | **a number of … are**. |
| the number of … are | **the number of … is**. |
| neither of the two were | neither … **was**, resmî yazıda tekil. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Çoğu iki boşluklu.

:::soru{cevap="A"}
Although ---- of the new employees have worked in this field before, ---- of them learn very quickly.

- A) few / most
- B) much / all
- C) a little / many
- D) several / some
- E) every / most

---

1. **Although** karşıtlık kurar. Bu yüzden iki nicelik sözcüğü zıt olmalı: az sayıda deneyimli, çoğu hızlı öğreniyor.
2. **Employees** sayılabilir çoğul isim: **few of the new employees** ve **most of them**.
3. B’deki much sayılamaz isimle kullanılır. C’deki a little de sayılamazdır. D’de karşıtlık yok, ek bilgi var. E’deki every of kalıbı yanlış. Doğru cevap **few / most**.
:::

:::soru{cevap="C"}
---- student in the programme receives a laptop, and ---- of them must sign a contract.

- A) All / every
- B) Each of / each
- C) Every / each
- D) Every / every
- E) Both / each

---

1. Birinci boşlukta ismin hemen önü, **student** tekil. Tekil isimle **every** ya da **each** kullanılır. All ve both çoğul ister.
2. İkinci boşlukta **of them** var. “Every of them” yanlıştır, doğrusu **each of them** ya da every one of them.
3. D’de every of kalıbı var. A, B ve E ilk boşlukta tekil isimle uyuşmuyor. Doğru cevap **Every / each**.
:::

:::soru{cevap="E"}
Of the three proposals, one was accepted, ---- was rejected, and ---- was postponed.

- A) other / another
- B) another / other
- C) the other / another
- D) another / others
- E) another / the other

---

1. Üç öğe var: **one ... another ... the other**. İlk iki öğe belirsiz (**another**), kalan son öğe belirli (**the other**).
2. Fiiller tekil (was rejected, was postponed), bu yüzden tekil zamir: another, the other. Others çoğuldur.
3. A ve B’de other tek başına tekil kullanılamaz. C’de sıra bozuk. D’de others çoğul. Doğru cevap **another / the other**.
:::

:::soru{cevap="A"}
Despite the company’s claims, there is very ---- evidence that the drug works, so very ---- doctors are willing to prescribe it.

- A) little / few
- B) few / little
- C) a little / a few
- D) much / many
- E) little / little

---

1. **Evidence** sayılamaz isimdir. **Despite the company’s claims** ifadesi kanıtın zayıf olduğunu gösterir: **very little evidence**.
2. **Doctors** sayılabilir çoğul. Aynı olumsuz yargı: **very few doctors**.
3. **Very** few ve little’ı pekiştirir. C seçeneğindeki “very a little” yanlıştır. B ve E sayılabilir ve sayılamaz ayrımını bozar. Doğru cevap **little / few**.
:::

:::soru{cevap="B"}
---- of the candidates passed the test, so the company had ---- choice but to repeat it.

- A) None / any
- B) None / no
- C) No / any
- D) Nothing / no
- E) Any / none

---

1. “Of the candidates” sonrasında nicelik sözcüğü **of** ile bağlanır. **None of the candidates** doğru kalıptır. “No of” kalıbı yoktur.
2. “Had ---- choice but to repeat” kalıbında **no choice but to** sabit ifade, “başka çaresi yoktu” anlamında.
3. A’daki “had any choice but” anlamsız. C’de “No of” yanlış. D’de nothing isim olmaz. E’de ikinci boşluk yanlış. Doğru cevap **None / no**.
:::

:::soru{cevap="B"}
---- of the two proposals was accepted because ---- were too expensive.

- A) Both / neither
- B) Neither / both
- C) Either / both
- D) None / both
- E) Neither / either

---

1. İki öneri var ve hiçbiri kabul edilmedi. İki öğeden hiçbiri için **neither**. Fiil tekil (was accepted).
2. Sebep: ikisi de pahalıydı. **both** çoğul (were).
3. A tam tersini söyler. C’de either olumsuz sonucu kurmaz. D’de iki öğede none yerine neither tercih edilir. E’de either çoğul fiille uyumsuz. Doğru cevap **Neither / both**.
:::

:::soru{cevap="D"}
A large number of tourists ---- the island every summer, but the number of hotels ---- limited.

- A) visits / are
- B) visit / are
- C) visits / is
- D) visit / is
- E) are visiting / are

---

1. **A large number of tourists** çoğul. Fiil de çoğul: **visit**.
2. **The number of hotels** “otel sayısı” demektir ve tekil fiil alır: **is** limited.
3. Her yazın tekrar eden bir durum, bu yüzden Present Simple. E’deki are visiting zaman olarak uymaz. Doğru cevap **visit / is**.
:::

:::soru{cevap="C"}
Some children prefer outdoor games, while ---- prefer computer games.

- A) other
- B) another
- C) others
- D) the other
- E) each other

---

1. Boşluk bir **özne** yerine geçiyor ve fiil çoğul (prefer). Belirsiz çoğul zamir gerekiyor: **others**.
2. A sıfat olarak isimle kullanılır. B tekil. D belirli kalan öğeyi gösterir, çoğul zamir için the others gerekirdi. E karşılıklı eylem için.
3. Doğru cevap **others**.
:::

:::ipucu{baslik="İpucu"}
Nicelik sorusunda önce **boşluktan sonraki isme** bak: tekil mi, çoğul mu, sayılamaz mı? Bu tek bilgi seçeneklerin ikiden fazlasını eler.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “I don’t have ---- money.” (some mı any mi?) => any.
2. “---- of the students passed.” (hiçbiri) => None.
3. “There is ---- time left.” (neredeyse hiç) => little (very little).
4. “She has a ---- friends here.” (az sayıda, olumlu) => few.
5. “---- student has a locker.” (her, tekil) => Every (ya da Each).
6. “I have two brothers. One is a doctor, ---- is a pilot.” => the other.
7. “Some like tea, ---- prefer coffee.” => others.
8. “A number of students ---- late.” (be, Present Simple) => are.
9. “The number of students ---- increasing.” (be, Present Simple) => is.
10. “Most ---- the students passed.” => of.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 34, false from public.topics where subject_id = 'ydt-dil' and name = 'Determiners ve Quantifiers';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sıfat cümlecikleri (relative clauses), bir ismi **who, which, that, whose, where, when** gibi bir sözcükle başlayan cümlecikle tanımlar. YDT’nin 2018-2025 dilbilgisi bölümünde ayrı bir soru olarak çıkmadı. Ama okuma parçalarının, cloze testlerin ve cümle tamamlama seçeneklerinin **neredeyse her cümlesinde** bir sıfat cümleciği vardır. Bu yapıyı tanımak, uzun cümleleri bölebilmek demektir ve hem okumayı hem çeviriyi hızlandırır. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Who, whom, whose, which, that, where, when, why zamirlerini göreviyle birlikte seçmek.
2. Belirleyici (defining) ve ek bilgi veren (non-defining) sıfat cümleciğini ayırt etmek.
3. Edat + whom / which kalıplarını (to whom, in which, some of which) kurmak.
4. Whose ve of which yapılarını kullanmak.
5. Which ile bir önceki cümlenin tamamına gönderme yapmak.
6. Relative zamirinin atılabileceği ve atılamayacağı durumları bilmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Okuma ve çeviri sorularında sıfat cümleciği çoğu zaman cümleyi anlamsız uzatır. **Relative zamirini bul, cümleciğin nerede başlayıp nerede bittiğini işaretle, ismine bağla.** Cümle tamamlama seçeneklerinde ise “of which”, “in which”, “, which” gibi yapılar doğru seçeneği ele verir: seçeneğin dilbilgisi hem kökle hem kendi içinde tam olmalıdır.
:::

## 1. YDT’de sıfat cümleciği nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. 2018-2025 arası 80 dilbilgisi sorusunun hiçbirinde doğrudan sıfat cümleciği sorulmadı. Ama bu yapı sınavın dört yerinde karşına çıkar.

| Nerede | Nasıl |
| --- | --- |
| Okuma parçaları | Bilimsel ve tarihsel metinlerde which, who, that ile uzayan cümleler |
| Cümle tamamlama | Seçeneklerde ve soru köklerinde (of which, in which, to which gibi resmî yapılar) |
| Kısaltılmış biçimde | Dilbilgisi sorularındaki participle kalıplarının çoğu kısaltılmış sıfat cümleciği (Participles konusu) |
| Çeviri soruları | “-en, -an” ile biten Türkçe öbeklerin İngilizce karşılığı |

:::neden-sonuc
- Sıfat cümleciği doğrudan sorulmuyor ama her yerde var => Bu konuyu bilmemek okuma hızını düşürür.
- 2021 cümle tamamlama sorusunun doğru seçeneği “of which” yapısı içeriyor => Seçeneği bulmak için yapıyı tanıman gerekiyor.
- Dilbilgisi sorularındaki participle kalıpları kısaltılmış sıfat cümleciği => Bu konu Participles konusuna zemin hazırlıyor.
- Çeviri sorularında Türkçedeki -en / -an öbekleri sıfat cümleciğine dönüşüyor => Yapıyı tanımak çeviriyi hızlandırır.
:::

## 2. Relative zamirleri

| Zamir | Neyi tanımlar | Cümleciğin içindeki görevi | Örnek |
| --- | --- | --- | --- |
| **who** | kişi | özne (ya da nesne) | The scientists **who** led the expedition... |
| **whom** | kişi | nesne (resmî) | The professor **whom** I met... |
| **whose** | kişi ya da şey | iyelik | The company **whose** products are sold abroad... |
| **which** | şey, hayvan | özne ya da nesne | The report **which** was written by experts... |
| **that** | kişi ya da şey | özne ya da nesne | The book **that** I read... |
| **where** | yer | yer zarfı | The town **where** I was born... |
| **when** | zaman | zaman zarfı | The year **when** the factory closed... |
| **why** | neden | sebep zarfı | The reason **why** he left... |

### who ya da whom

- **who** özne ya da nesne olarak: The man **who** called is my uncle. (özne)
- **whom** nesne olarak (resmî): The man **whom** I called is my uncle.

Resmî yazıda **whom**, edattan sonra **zorunludur**: “the professor **to whom** I sent my application”.

### that ya da which

| Durum | that | which |
| --- | --- | --- |
| Belirleyici cümlecikte | doğru | doğru |
| Ek bilgi veren cümlecikte (virgülden sonra) | **kullanılmaz** | doğru |
| Edattan sonra | **kullanılmaz** | doğru |
| all, everything, nothing, the only, the first, en üstünlük sonrası | **tercih edilir** | tercih edilmez |

- Everything **that** he said was true. (Everything which pek kullanılmaz.)
- It was the only book **that** I liked.

## 3. Belirleyici ve ek bilgi veren cümlecik

### Belirleyici (defining)

İsmin **hangisi olduğunu** söyler. Cümleden çıkarsak cümlenin anlamı eksik kalır. **Virgül yok.**

- The students **who studied hard** passed. (Hepsi geçmedi, sadece çalışanlar.)

### Ek bilgi veren (non-defining)

İsim zaten belli. Cümlecik **ekstra bilgi** verir. **Virgülle ayrılır** ve çıkarılırsa cümle anlamını korur.

- My brother, **who lives in Ankara**, is a doctor. (Tek kardeşim var.)
- The Nile, **which flows through Egypt**, is the longest river in Africa.

:::baglanti
Ek bilgi veren cümlecikte **that kullanılmaz** ve relative zamiri **atılamaz**. Belirleyici cümlecikte, zamir nesne olarak kullanılıyorsa atılabilir.
:::

## 4. Zamirin atılabilmesi

Zamir cümleciğin **nesnesi** ise belirleyici cümlecikte atılabilir. **Öznesi** ise atılamaz.

| Cümle | Zamir atılabilir mi? |
| --- | --- |
| The book **that** I read was excellent. (nesne) | Evet: The book I read was excellent. |
| The man **who** called is my uncle. (özne) | Hayır. |
| The report, **which** I read yesterday, was long. (ek bilgi) | Hayır. |

Yapıyı kontrol etmek için: relative zamirinden **sonra** bir özne varsa (I, he, the company), zamir nesnedir ve atılabilir. Hemen bir fiil geliyorsa zamir özne ve atılamaz.

## 5. Edat + whom / which

Resmî yazıda edat relative zamirinden **önce** gelir. Günlük konuşmada ise edat fiilin yanında kalır.

| Resmî | Günlük |
| --- | --- |
| the professor **to whom** I sent my application | the professor **I sent my application to** |
| the tasks **in which** they feel incompetent | the tasks **they feel incompetent in** |
| the company **for which** she works | the company she works **for** |
| the method **by which** the data were collected | the method the data were collected **by** |

Edattan sonra **that** ve **who** kullanılmaz. Yalnızca **whom** ve **which**.

### Niceleyici + of whom / of which

Sayı, miktar ya da nicelik bildiren bir sözcükten sonra **of whom / of which** gelir.

| Kalıp | Örnek |
| --- | --- |
| some of whom / some of which | The museum has 5,000 objects, **most of which** are on loan. |
| many of whom / many of which | There were 200 guests, **many of whom** had travelled abroad. |
| all of whom / all of which | The company employs 300 people, **all of whom** are trained. |
| none of whom / none of which | There were 20 applicants, **none of whom** had experience. |
| one of whom / one of which | He wrote five books, **one of which** became a bestseller. |

Bu kalıpta of which, bir önceki ismin **sahipliğini ya da bağlı olduğu şeyi** gösterir: “Oil, **of which** the country has large reserves, is its main export.” Burada “of which” = “the country has large reserves **of oil**”.

## 6. Whose

**Whose** iyelik bildirir. Kişi ya da şey için kullanılır. Sonrasında **isim** gelir (whose + isim).

- The company **whose products** are sold in fifty countries plans to expand.
- The students **whose scores** were low received extra support.
- The house **whose roof** was damaged was repaired.

Yerine **of which** da kullanılabilir (yalnızca cansız varlık için, daha resmî): “the house **the roof of which** was damaged”.

:::ipucu{baslik="Whose, who’s"}
**Whose** iyelik (kimin). **Who’s** = who is ya da who has. “Who’s coming?” ama “The man whose car was stolen”.
:::

## 7. Which ile önceki cümlenin tamamına gönderme

Which, sadece bir isme değil, **önceki cümlenin tamamına** da bağlanabilir. Bu durumda virgülden sonra gelir ve **sonuç ya da yorum** getirir.

- Prices have risen sharply, **which** has forced many families to cut spending.
- He passed the test, **which** surprised everyone.
- The ice is melting faster, **which** means sea levels will rise.

Bu durumda **that** kullanılmaz, **what** da kullanılmaz.

## 8. Where, when, why

| Zamir | Kullanım | Örnek |
| --- | --- | --- |
| where | yer isminden sonra (in which yerine) | The town **where** I was born is small. |
| when | zaman isminden sonra (in which yerine) | The year **when** the factory closed was hard. |
| why | the reason'dan sonra | The reason **why** he left is unknown. |

**Where** yerine **in which**, **when** yerine **in/during which** de kullanılabilir: “The year in which the factory closed”.

## 9. Kısaltılmış sıfat cümleciği

Sıfat cümleciği participle ile kısaltılabilir (ayrıntı Participles konusunda).

| Tam cümle | Kısaltılmış |
| --- | --- |
| a reef **which extends** along the coast | a reef **extending** along the coast |
| songs **which are sung** by shamans | songs **sung** by shamans |
| the man **who is standing** at the door | the man **standing** at the door |

## 10. What ile farkı

**What** bir sıfat cümleciği başlatmaz, **isim cümleciği** başlatır. Önünde bir isim olmaz.

| That / which (sıfat cümleciği) | What (isim cümleciği) |
| --- | --- |
| Everything **that** he said was true. | **What** he said was true. |
| The thing **that** I need is time. | **What** I need is time. |

“Everything what” ya da “the thing what” yanlıştır.

## 11. Özne-fiil uyumu

Sıfat cümleciğindeki fiil, relative zamirinin bağlı olduğu **isme** uyar.

- He is one of the students **who are** very successful. (students: çoğul)
- She is the only one of the students **who is** very successful. (the only one: tekil)

## 12. Çözüm yolu

1. **Zamiri bul.** Who, which, that, whose, where, when, why ya da edat + whom / which.
2. **Cümleciğin başını ve sonunu işaretle.**
3. **Zamirin görevi ne?** Özne mi, nesne mi, iyelik mi, edatlı mı?
4. **Belirleyici mi, ek bilgi mi?** Virgül var mı? Virgül varsa that olmaz.
5. **Seçeneklerde zamir seç.** Kişi mi şey mi? Edattan sonra mı?
6. **Seçenekleri sına.** Zamir ile fiil arasında özne var mı? İkinci özne varsa zamir nesnedir.

## Aklında kalsın

- **who** kişi, **which** şey, **that** ikisi de, **whose** iyelik, **where** yer, **when** zaman, **why** neden.
- **Virgül varsa** ek bilgi veren cümlecik: **that** kullanılmaz, zamir atılamaz.
- **Edattan sonra** yalnızca **whom** ve **which**. That ve who olmaz.
- **Nesne zamiri** belirleyici cümlecikte atılabilir. **Özne zamiri** atılamaz.
- **Nicelik + of whom / of which**: most of which, some of whom.
- **Which** önceki cümlenin tamamına gönderme yapabilir (..., which means that).
- **Whose** + isim.
- **what** ile sıfat cümleciği kurulmaz.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| The man who he called | **The man who called** ya da **The man whom I called** (iki özne olmaz) |
| The book which I read it | **The book which I read** (nesne tekrarı yok) |
| The man to who I spoke | **The man to whom I spoke** |
| The book, that I read, is long | **The book, which I read, is long** |
| Everything what he said | **Everything that he said** |
| The man, whose his car was stolen | **The man whose car was stolen** |
| The year in that | **The year in which** |
| Many of which people | **Many of whom** (kişi için whom) |
| He failed, what surprised us | **He failed, which surprised us** |
| the reason because | **the reason why** |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="D"}
The scientists ---- led the expedition have published their first results.

- A) whom
- B) whose
- C) which
- D) who
- E) what

---

1. **The scientists** bir kişi grubu ve cümleciğin öznesi (led the expedition). Zamirden sonra hemen bir fiil geliyor.
2. Kişi + özne => **who**.
3. Whom nesne, whose iyelik, which şey için, what isim cümleciği içindir. Doğru cevap **who**.
:::

:::soru{cevap="B"}
The company, ---- products are sold in more than fifty countries, plans to open a new factory.

- A) which
- B) whose
- C) who
- D) of whom
- E) that

---

1. Zamirden sonra bir **isim** geliyor (products). Bu isim şirketin ürünleri: **iyelik** ilişkisi.
2. İyelik bildiren relative zamiri **whose**.
3. Which ve that bu yapıda isimle birlikte iyelik kurmaz. Who kişi içindir. Of whom, whose products yerine geçmez. Doğru cevap **whose**.
:::

:::soru{cevap="A"}
The professor to ---- I sent my application replied within a day.

- A) whom
- B) who
- C) which
- D) that
- E) whose

---

1. Zamirden önce bir **edat** var (to). Edattan sonra relative zamiri yalnızca **whom** (kişi) ya da **which** (şey) olabilir.
2. Professor bir kişi: **whom**.
3. Who ve that edattan sonra kullanılmaz. Which şey içindir. Whose iyelik içindir. Doğru cevap **whom**.
:::

:::soru{cevap="C"}
Prices have risen sharply this year, ---- has forced many families to reduce their spending.

- A) that
- B) what
- C) which
- D) who
- E) whose

---

1. Virgülden sonra bir cümlecik başlıyor ve **önceki cümlenin tamamına** (fiyatlar arttı) gönderme yapıyor.
2. Önceki cümlenin tamamına gönderme yapan zamir **which**.
3. That ek bilgi veren cümlecikte kullanılmaz. What isim cümleciği başlatır. Who kişi, whose iyelik içindir. Doğru cevap **which**.
:::

:::soru{cevap="A"}
The museum has about 5,000 objects, most ---- are on loan from other countries.

- A) of which
- B) which
- C) of them
- D) whose
- E) that

---

1. Virgülden sonra **most** gibi bir nicelik sözcüğü var ve **objects**’e gönderme yapıyor.
2. Nicelik sözcüğünden sonra relative zamiri **of which** (şey için) ya da **of whom** (kişi için) olur.
3. B nicelikle birlikte kullanılamaz. C iki bağımsız cümleyi virgülle birleştirir (comma splice). D iyelik ister. E ek bilgi veren cümlecikte kullanılmaz. Doğru cevap **of which**.
:::

:::soru{cevap="E"}
The year ---- the factory closed was the hardest one for the town.

- A) where
- B) who
- C) which
- D) what
- E) when

---

1. **The year** zaman bildiren bir isim ve sonrasında **tam bir cümlecik** var (the factory closed). Zamir cümleciğin içinde özne ya da nesne değil, zaman zarfı.
2. Zaman isminden sonra **when** kullanılır (ya da in which).
3. Where yer için, who kişi için kullanılır. Which burada ancak edatla (in which) kullanılabilir. What isim cümleciği başlatır. Doğru cevap **when**.
:::

:::soru{cevap="C"}
Everything ---- the lecturer said in the first session was repeated in the exam.

- A) what
- B) who
- C) that
- D) whose
- E) whom

---

1. Zamirden önce **everything** var. Everything, all, nothing, the only gibi sözcüklerden sonra relative zamiri olarak **that** tercih edilir.
2. Zamirden sonra bir özne var (the lecturer), yani zamir cümleciğin nesnesi.
3. What, everything gibi bir isimle kullanılmaz. Who ve whom kişi içindir. Whose iyelik ister. Doğru cevap **that**.
:::

:::soru{cevap="B"}
The report, ---- was written by two experts, includes several suggestions ---- would reduce costs.

- A) that / which
- B) which / that
- C) what / that
- D) who / which
- E) which / what

---

1. Birinci boşluk virgülle ayrılmış, ek bilgi veren bir cümlecik başlatıyor ve **report** bir şey. **Which** kullanılır. That virgülden sonra gelmez.
2. İkinci boşluk **suggestions** ismini belirliyor ve cümleciğin öznesi. Belirleyici cümlecikte **that** (ya da which) kullanılır. What olmaz.
3. A’da ilk boşlukta that var, C’de what var, D’de who bir şey için kullanılmaz, E’de ikinci boşlukta what var. Doğru cevap **which / that**.
:::

:::ipucu{baslik="İpucu"}
Relative zamir sorusunda **üç soru sor**: Önümdeki isim kişi mi, şey mi? Virgül var mı? Zamirin arkasından özne mi fiil mi geliyor? Bu üçü seçeneklerin çoğunu eler.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “The woman ---- lives next door is a nurse.” (özne, kişi) => who (ya da that).
2. “The book ---- I bought yesterday is excellent.” (nesne) => which (ya da that, ya da zamir atılabilir).
3. “The man ---- car was stolen called the police.” (iyelik) => whose.
4. “The town ---- I was born is small.” (yer) => where.
5. “The professor to ---- I wrote replied.” (edat sonrası, kişi) => whom.
6. “He passed the exam, ---- surprised everyone.” (önceki cümleye gönderme) => which.
7. “Everything ---- she said was true.” => that (zamir atılabilir de).
8. “The report, ---- I read yesterday, was long.” (ek bilgi, virgül var) => which.
9. “The company employs 300 people, all ---- are trained.” => of whom.
10. “The reason w---- he left is unknown.” (w ile başlar) => why.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 31, false from public.topics where subject_id = 'ydt-dil' and name = 'Relative Clauses';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

YDT’de kelime bilgisi yalnızca ilk beş soruyla sınırlı değildir. **Cloze testinde, cümle tamamlamada, okuma parçalarında ve çeviride** hep aynı akademik sözcük havuzu kullanılır. Bu yüzden kelime çalışmasının en iyi getirisi, sınavın gerçekten sorduğu sözcükleri ve onların **kalıplarını** öğrenmektir. Bu metin ayrıca YDT’nin 80 soruluk yapısını tek tabloda toplar: hangi soru nerede, kaç tane, nasıl çözülür. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. YDT’nin 80 soruluk yapısını ve her bölümün ne sorduğunu bilmek.
2. Kelime bilgisi sorularının 1-5 arasındaki sabit düzenini (isim, sıfat, zarf, fiil, deyimsel fiil) tanımak.
3. Bağlamdan ipucu bularak boşluğu tahmin etmek ve seçenekleri eleyerek doğruyu bulmak.
4. Sözcükleri öğeleriyle (ön ek, kök, son ek) çözümlemek ve sözcük ailelerini kurmak.
5. Sık kullanılan akademik sözcükleri, eşleşmeleri (collocations) ve deyimsel fiilleri tanımak.
6. Yakın anlamlı ve karıştırılan sözcükleri (affect ve effect, economic ve economical) ayırt etmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Kelime sorusunda ezber değil **bağlam** işe yarar. Önce cümleyi oku ve boşluğu kendi sözcüklerinle doldur. Sonra seçeneklere bak ve kendi tahminine en yakın olanı seç. Tahmin edemiyorsan boşluğun önünde ve sonundaki sözcüklere bak: hangi sözcükle birlikte doğal bir eşleşme kuruyor?
:::

## 1. YDT’nin yapısı: 80 soru

Bu bölüm, ÖSYM’nin 2018 ve 2025 YDT İngilizce kitapçıklarındaki yönergeler ile MEB’in çıkmış soru kitabına dayanıyor. Sekiz yılın bütün kitapçıklarında bölümler aynı sırada ve aynı sayıdaydı.

| Sorular | Bölüm | Soru sayısı | Ne soruyor |
| --- | --- | --- | --- |
| 1 - 5 | Kelime bilgisi | 5 | Cümlede boşluğa uygun sözcük ya da ifade |
| 6 - 15 | Dilbilgisi | 10 | Cümlede boşluğa uygun yapı (iki boşluklu) |
| 16 - 20 | Cloze test | 5 | Parçada numaralı boşluklara uygun sözcük ya da yapı |
| 21 - 28 | Cümle tamamlama | 8 | Verilen cümleyi uygun şekilde tamamlayan ifade |
| 29 - 43 | Okuma parçaları | 15 | Beş parça, her parça için üç soru |
| 44 - 48 | Diyalog tamamlama | 5 | Karşılıklı konuşmanın boş kısmı |
| 49 - 53 | Anlamca en yakın cümle | 5 | Verilen cümleye anlamca en yakın cümle |
| 54 - 58 | Durum | 5 | Verilen durumda söylenmiş olabilecek söz |
| 59 - 63 | Paragraf tamamlama | 5 | Parçadaki boşluğa getirilebilecek cümle |
| 64 - 69 | İngilizce-Türkçe çeviri | 6 | İngilizce cümleye anlamca en yakın Türkçe cümle |
| 70 - 75 | Türkçe-İngilizce çeviri | 6 | Türkçe cümleye anlamca en yakın İngilizce cümle |
| 76 - 80 | Anlam bütünlüğünü bozan cümle | 5 | Parçanın anlam bütünlüğünü bozan cümle |

Toplam: 80 soru, beş seçenekli. Net hesabı YKS ile aynı: **doğru sayısı eksi yanlış sayısının dörtte biri**. Boş bıraktığın soru net hesabına girmez. Sınav süresi 120 dakikadır. ÖSYM kılavuzundaki güncel süreyi ve soru ağırlıklarını sınavdan önce kontrol et.

:::neden-sonuc
- İlk 15 soru cümle düzeyinde, kalan 65 sorunun çoğu parça düzeyinde => Sözcük ve dilbilgisi 15 soru, ama okuma anlama, cümle bağlama ve çeviri 65 soru. Okuma hızın sonucu belirler.
- Cümle tamamlama ve cloze soruları bağlaçları sınıyor => Conjunctions konusu 15. sorudan sonra da işe yarar.
- Çeviri soruları toplam 12 => Dilbilgisini bilen, uzun cümleyi bölüp çevirebilen öğrenci 12 soruyu garantiler.
- Paragraf tamamlama ve anlam bütünlüğü 10 soru => Bu iki bölüm, zamir, bağlaç ve metin akışı bilgisine dayanıyor.
:::

### Bölüm bölüm sınav stratejisi

| Bölüm | Strateji |
| --- | --- |
| Kelime (1-5) | Her yıl aynı düzen: isim, sıfat, zarf, fiil, deyimsel fiil. Boşluğun sözcük sınıfını önceden tahmin et |
| Dilbilgisi (6-15) | Üç fiil biçimi, iki edat çifti, iki bağlaç, bir belirleyici, bir ikili kalıp, bir anlam edatı |
| Cloze (16-20) | Her parçada bir fiil biçimi, bir sözcük, üç edat ya da bağlantı sözcüğü |
| Cümle tamamlama (21-28) | Bağlaç ve bağlantı mantığı: karşıtlık, sebep, sonuç |
| Okuma (29-43) | Önce soruları oku, sonra parçada cevabı ara |
| Diyalog (44-48) | Önceki ve sonraki cümlenin işlevini bul (soru, öneri, kabul, red) |
| Anlamca en yakın cümle (49-53) | Zaman, bağlaç ve olumsuzluğu karşılaştır |
| Durum (54-58) | Konuşmanın amacını belirle (öneri, teşekkür, özür, itiraz) |
| Paragraf tamamlama (59-63) | Öncesi ve sonrası arasındaki bağlantıyı bul |
| Çeviri (64-75) | Cümlenin ana fiilini bul, bağlaç ve zamanı koru |
| Anlam bütünlüğü (76-80) | Konudan sapan cümleyi bul |

## 2. Kelime bilgisi soruları: 1 - 5

Bu bölüm sekiz yılda her yıl **aynı düzende** beş soru sordu. Sekiz yıl, kırk soru.

| Soru | Sözcük sınıfı | Örnek (2018-2025 doğru cevapları) |
| --- | --- | --- |
| 1 | **İsim** | conditions, demand, assumptions, capability, predictions, extinction, efficacy, availability |
| 2 | **Sıfat** | crucial, damaging, independent, disastrous, abundant, visible, crucial, unprecedented |
| 3 | **Zarf** | exactly, significantly, initially, decisively, primarily, widely, slightly, thoroughly |
| 4 | **Fiil** | occupy, provide, enhance, encompass, progress, overlook, maintain, enhance |
| 5 | **Deyimsel fiil ya da edatlı fiil** | set up, derive from, account for, bring about, result in, break down, credit with, call for |

:::baglanti
Bu düzen sekiz yıl boyunca bozulmadı. Bu yüzden **sınavda 1. soruyu görünce isim, 2. soruyu görünce sıfat, 3. soruyu görünce zarf, 4. soruyu görünce fiil, 5. soruyu görünce edatlı fiil ara**. Bu yalnızca bir örüntüdür ve ÖSYM’nin açıkladığı bir kural değil. Yine de sekiz yılın hepsi aynıydı.
:::

### Sınavda tekrar eden sözcükler

Kırk soruda bazı sözcükler iki kez doğru cevaptı: **crucial** (2018 ve 2024), **enhance** (2020 ve 2025). Ayrıca **account for / result in / bring about / stem from** gibi neden-sonuç fiilleri sık çıkar.

Bu sözcükleri kalıpla birlikte öğren:

| Sözcük | Anlam | Kalıp |
| --- | --- | --- |
| crucial | çok önemli | a crucial factor / role |
| enhance | artırmak, geliştirmek | enhance performance, enhance quality |
| account for | oluşturmak, açıklamak | account for a quarter of deaths |
| bring about | yol açmak | bring about change |
| result in | sonuçlanmak | result in the death of millions |
| derive from | -den türemek | derive from an old game |
| credit with | atfetmek | credited with inventing |
| call for | gerektirmek, talep etmek | call for strict regulation |

## 3. Bağlamdan anlam çıkarma

Kelime sorularında doğru cevap **cümlenin içinde ipucu** olarak durur. Dört ipucu türü vardır.

| İpucu türü | Nasıl çalışır | Örnek |
| --- | --- | --- |
| **Eşanlam** | Boşlukla aynı anlamlı bir sözcük cümlede geçer | The results were **unexpected**, even surprising to the researchers. |
| **Zıt anlam** | Although, but, however, whereas bağlacı ters yönde bir sözcük verir | Although the first test was **simple**, the second was extremely difficult. |
| **Sebep-sonuç** | Because, since, so, therefore ile anlam kurulur | The road was **closed** because of heavy snow. |
| **Örnek ya da açıklama** | such as, for example, that is ile açıklanır | Some **nutrients**, such as iron and calcium, are essential. |

### Bağlaçlar bağlamı verir

Boşluğun yanında bir bağlaç varsa önce ilişkiyi bul:

- **Although / while / but / however** => boşluk ters yönlü bir anlam ister.
- **Because / since / therefore** => boşluk nedeni ya da sonucu tamamlar.
- **and / also / moreover** => aynı yönde bir sözcük gerekir.

## 4. Kelime sorusu için çözüm yolu

1. **Cümleyi baştan sona oku.** Boşluğu atlayarak anlamı çıkar.
2. **Boşluğu kendi sözcüklerinle doldur.** “Burada ne olmalı?”
3. **Sözcük sınıfını belirle.** Boşluk bir isim mi, sıfat mı, zarf mı, fiil mi? (Kalıbı hatırla: 1 isim, 2 sıfat, 3 zarf, 4 fiil, 5 edatlı fiil.)
4. **Seçenekleri tahminle karşılaştır.** Anlamca yakın olan hangisi?
5. **Eşleşmeyi kontrol et.** Sıfatsa hangi isimle, zarfsa hangi fiil ya da sıfatla, fiilse hangi nesneyle doğal?
6. **Tonu kontrol et.** Cümle olumlu mu olumsuz mu? Seçenek de aynı tonda olmalı.
7. **Elemek için:** Bilmediğin sözcük varsa, bildiklerinle elemek yeterli.

## 5. Sözcük yapısı: ön ek, kök, son ek

Sözcükleri parçalarına ayırmak, bilmediğin bir sözcüğün anlamını çıkarmanı sağlar.

### Ön ekler

| Ön ek | Anlam | Örnek |
| --- | --- | --- |
| un-, in-, im-, il-, ir-, non-, dis- | olumsuz | unusual, inactive, impossible, illegal, irregular, non-profit, disagree |
| re- | tekrar | rebuild, rethink |
| pre- | önce | prehistoric, predict |
| post- | sonra | postwar, postpone |
| over- | üstünde, aşırı | overcome, overlook, overuse |
| under- | az, alt | underestimate, underdeveloped |
| mis- | yanlış | misunderstand, misuse |
| inter- | arası | international, interact |
| sub- | alt | subway, subdivide |
| multi- | çok | multicultural |
| anti- | karşıt | antibiotic, anti-social |
| co- | birlikte | cooperate, coexist |
| out- | aşan | outnumber, outperform |

### Son ekler

| Son ek | Sözcük sınıfı | Örnek |
| --- | --- | --- |
| -tion, -sion, -ment, -ness, -ity, -ance, -ence, -ship, -ism | isim | decision, development, availability, importance |
| -er, -or, -ist, -ian | kişi ismi | teacher, investigator, scientist |
| -ful, -less, -ous, -ive, -al, -ic, -able, -ible, -ent, -ant, -ary | sıfat | helpful, harmless, various, effective, national, economic, reliable |
| -ly | zarf | quickly, significantly |
| -ize, -ise, -ify, -en | fiil | organize, simplify, strengthen |

### Sözcük aileleri

Bir sözcüğün bütün biçimlerini bilmek kelime sorusunda ve cloze’da kritik. Cloze’da boşluk bazen aynı kökün farklı bir biçimidir.

| Fiil | İsim | Sıfat | Zarf |
| --- | --- | --- | --- |
| decide | decision | decisive | decisively |
| signify | significance | significant | significantly |
| economise | economy | economic / economical | economically |
| apply | application | applicable | |
| depend | dependence | dependent | |
| differ | difference | different | differently |
| predict | prediction | predictable | predictably |
| act | action | active | actively |
| succeed | success | successful | successfully |
| create | creation, creativity | creative | creatively |
| analyse | analysis | analytical | analytically |

## 6. Akademik isimler

| İsim | Anlam | Sık eşleşme |
| --- | --- | --- |
| assumption | varsayım | make an assumption |
| capability | yetenek, kapasite | the capability to |
| conclusion | sonuç, çıkarım | draw / reach a conclusion |
| consequence | sonuç | serious consequences |
| demand | talep | meet demand, growing demand |
| efficacy | etkililik | the efficacy of a drug |
| evidence | kanıt (sayılamaz) | provide evidence |
| extinction | neslin tükenmesi | species facing extinction |
| factor | etken | a key factor |
| feature | özellik | a distinctive feature |
| impact | etki | an impact on |
| issue | konu, sorun | raise an issue |
| measure | önlem | take measures |
| outcome | sonuç | a positive outcome |
| prediction | tahmin | accurate predictions |
| process | süreç | a complex process |
| range | aralık, çeşit | a wide range of |
| resource | kaynak | natural resources |
| role | rol | play a role |
| shortage | kıtlık, yetersizlik | a shortage of water |
| source | kaynak | a source of income |
| supply | arz, tedarik | a limited supply |
| threat | tehdit | pose a threat |
| trend | eğilim | a growing trend |
| availability | bulunabilirlik | the availability of resources |
| awareness | farkındalık | raise awareness |
| contribution | katkı | make a contribution |
| distribution | dağılım | the distribution of wealth |
| framework | çerçeve | a legal framework |
| hypothesis | hipotez | test a hypothesis |
| initiative | girişim | a new initiative |
| phenomenon | olgu | a natural phenomenon (çoğul: phenomena) |
| perspective | bakış açısı | from a different perspective |
| strategy | strateji | develop a strategy |
| criteria | ölçütler | meet the criteria |

## 7. Akademik fiiller

| Fiil | Anlam | Sık eşleşme |
| --- | --- | --- |
| achieve | başarmak | achieve a goal |
| acquire | edinmek | acquire knowledge |
| adapt | uyum sağlamak | adapt to |
| affect | etkilemek | affect health |
| allow | izin vermek | allow someone to |
| analyse | analiz etmek | analyse data |
| assess | değerlendirmek | assess the risk |
| assume | varsaymak | assume that |
| conduct | yürütmek | conduct research |
| consider | düşünmek | consider an option |
| contribute | katkıda bulunmak | contribute to |
| define | tanımlamak | define a term |
| demonstrate | göstermek | demonstrate that |
| derive | türemek | derive from |
| determine | belirlemek | determine the cause |
| enhance | artırmak | enhance quality |
| ensure | sağlamak, garanti etmek | ensure safety |
| establish | kurmak | establish a company |
| estimate | tahmin etmek | estimated at |
| evaluate | değerlendirmek | evaluate results |
| exceed | aşmak | exceed expectations |
| exhibit | sergilemek | exhibit symptoms |
| identify | belirlemek | identify a problem |
| indicate | göstermek | indicate that |
| interpret | yorumlamak | interpret results |
| maintain | sürdürmek | maintain balance |
| obtain | elde etmek | obtain data |
| occupy | kaplamak, işgal etmek | occupy a large area |
| overlook | gözden kaçırmak | overlook a detail |
| promote | desteklemek, tanıtmak | promote growth |
| provide | sağlamak | provide evidence |
| require | gerektirmek | require attention |
| reveal | ortaya çıkarmak | reveal the truth |
| spread | yayılmak | spread rapidly |
| sustain | sürdürmek | sustain growth |
| undergo | geçirmek | undergo changes |
| encompass | kapsamak | encompass many fields |
| progress | ilerlemek | progress rapidly |
| reduce | azaltmak | reduce costs |
| restrict | kısıtlamak | restrict access |
| suffer | acı çekmek | suffer from |
| survive | hayatta kalmak | survive in extreme conditions |
| threaten | tehdit etmek | threaten wildlife |

## 8. Akademik sıfatlar

| Sıfat | Anlam | Sık eşleşme |
| --- | --- | --- |
| abundant | bol | abundant supply |
| adequate | yeterli | adequate nutrition |
| appropriate | uygun | an appropriate method |
| beneficial | yararlı | beneficial effects |
| complex | karmaşık | a complex system |
| consistent | tutarlı | consistent results |
| crucial | çok önemli | a crucial role |
| damaging | zarar verici | damaging effects |
| dramatic | çarpıcı | a dramatic increase |
| essential | gerekli | essential nutrients |
| evident | belirgin | clearly evident |
| fundamental | temel | a fundamental change |
| harmful | zararlı | harmful chemicals |
| independent | bağımsız | independent research |
| limited | sınırlı | limited resources |
| major | büyük, önemli | a major cause |
| negligible | önemsiz | negligible differences |
| obvious | açık, belli | an obvious reason |
| potential | olası | potential risks |
| prevalent | yaygın | prevalent in |
| rapid | hızlı | rapid growth |
| reliable | güvenilir | reliable sources |
| severe | şiddetli | severe damage |
| significant | önemli, anlamlı | a significant increase |
| sufficient | yeterli | sufficient evidence |
| sustainable | sürdürülebilir | sustainable development |
| unprecedented | eşi görülmemiş | unprecedented growth |
| vulnerable | savunmasız | vulnerable to |
| visible | görünür | visible effects |
| widespread | yaygın | widespread use |
| inevitable | kaçınılmaz | inevitable change |
| obsolete | eski, modası geçmiş | obsolete technology |

## 9. Deyimsel ve edatlı fiiller

Bu bölüm kelime sorularının beşinci sorusu ve cloze’da boşlukların kaynağı.

### Sınavda çıkanlar

| Fiil | Anlam | Örnek |
| --- | --- | --- |
| set up | kurmak | set up a company |
| derive from | -den türemek | derive from an old tradition |
| account for | oluşturmak, açıklamak | account for 20 per cent |
| bring about | yol açmak | bring about change |
| result in | sonuçlanmak | result in failure |
| break down | parçalamak, bozulmak | break down a goal into steps |
| credit with | atfetmek | be credited with inventing |
| call for | gerektirmek | call for action |

### Neden-sonuç fiilleri

| Fiil | Yön | Örnek |
| --- | --- | --- |
| cause, lead to, result in, bring about, give rise to, trigger | sebep => sonuç | The storm **led to** flooding. |
| result from, stem from, arise from, derive from, be due to | sonuç => sebep | The flooding **resulted from** the storm. |

Bu iki grubu karıştırmak sık görülen bir tuzaktır: **result in** sonucu, **result from** nedeni getirir.

### Nesne zamiri nerede durur

Ayrılabilir deyimsel fiillerde nesne bir **isimse** fiil ile edat arasına ya da sonuna konabilir (switch off the light, switch the light off). Nesne bir **zamirse** mutlaka araya girer: switch **it** off (switch off it değil), throw **them** out.

### Sık kullanılan edatlı fiiller

| Fiil | Anlam |
| --- | --- |
| carry out | gerçekleştirmek, uygulamak |
| point out | belirtmek, işaret etmek |
| rely on, depend on | güvenmek, bağlı olmak |
| deal with | ele almak, başa çıkmak |
| come up with | akla getirmek, ortaya atmak |
| look into | araştırmak |
| make up | oluşturmak |
| consist of | oluşmak |
| turn out | sonuçlanmak, ortaya çıkmak |
| take place | gerçekleşmek |
| put forward | öne sürmek |
| rule out | elemek, hariç tutmak |
| back up | desteklemek |
| set out | yola çıkmak, amaçlamak |
| take over | devralmak |
| give up | vazgeçmek |
| cut down on | azaltmak |
| run out of | bitmek, kalmamak (run out of money) |
| pass on | aktarmak |
| hold back | engellemek |
| figure out | çözmek, anlamak |
| bring up | gündeme getirmek, yetiştirmek |
| keep up with | ayak uydurmak |
| look forward to | sabırsızlıkla beklemek |
| get along with | iyi geçinmek |
| take part in | katılmak |
| make sure | emin olmak |
| find out | öğrenmek |

## 10. Eşleşmeler (collocations)

Sözcükler yalnızca anlamıyla değil, **yanındaki sözcükle** öğrenilir.

### Fiil + isim

| Eşleşme | Anlam |
| --- | --- |
| make an assumption | varsayım yapmak |
| draw a conclusion | sonuç çıkarmak |
| conduct research / a survey | araştırma yürütmek |
| pose a threat | tehdit oluşturmak |
| play a role | rol oynamak |
| raise awareness | farkındalık yaratmak |
| meet demand | talebi karşılamak |
| take measures | önlem almak |
| gain access to | erişim sağlamak |
| bear in mind | akılda tutmak |
| reach an agreement | anlaşmaya varmak |
| face a challenge | zorlukla karşılaşmak |
| make progress | ilerleme kaydetmek |
| set a goal | hedef belirlemek |
| take advantage of | yararlanmak |
| pay attention to | dikkat etmek |
| have an effect on | etkisi olmak |

### Sıfat + isim

| Eşleşme | Anlam |
| --- | --- |
| a crucial factor | belirleyici etken |
| a growing trend | artan eğilim |
| a wide range of | geniş bir çeşitlilik |
| a heavy burden | ağır yük |
| a heated debate | sert tartışma |
| a vicious circle | kısır döngü |
| a serious threat | ciddi tehdit |
| heavy rain | sağanak |
| strong evidence | güçlü kanıt |
| high demand | yüksek talep |

### Zarf + sıfat ya da participle

Zarf konusunda ayrıntılıdır: widely used, thoroughly understood, deeply concerned, heavily dependent, highly effective.

## 11. Karıştırılan sözcükler

| Sözcük 1 | Sözcük 2 | Fark |
| --- | --- | --- |
| affect (fiil) | effect (isim) | affect: etkilemek. effect: etki. |
| economic | economical | economic: ekonomiye ait. economical: tasarruflu. |
| historic | historical | historic: tarihî önemde. historical: tarihe ait. |
| sensible | sensitive | sensible: mantıklı. sensitive: duyarlı. |
| principle | principal | principle: ilke. principal: ana, müdür. |
| lie | lay | lie: yatmak. lay: yatırmak, koymak. |
| rise | raise | rise: yükselmek. raise: yükseltmek. |
| lose | loose | lose: kaybetmek. loose: gevşek. |
| advice | advise | advice: öğüt (isim). advise: öğüt vermek. |
| besides | beside | besides: ayrıca. beside: yanında. |
| ensure | insure | ensure: sağlamak. insure: sigortalamak. |
| rob | steal | rob: kişiyi ya da yeri soymak. steal: şey çalmak. |
| say | tell | say: söylemek. tell: birine söylemek. |
| few | little | few: sayılabilir. little: sayılamaz. |
| look | watch | look: bakmak. watch: izlemek. |
| bring | take | bring: getirmek. take: götürmek. |
| lend | borrow | lend: ödünç vermek. borrow: ödünç almak. |

## 12. Eşanlamlı ve zıt anlamlı gruplar

### Eşanlamlılar

| Anlam | Sözcükler |
| --- | --- |
| artış | increase, rise, growth, surge, boost |
| azalma | decrease, decline, drop, reduction, fall |
| önemli | crucial, vital, essential, significant, critical, key |
| çok | numerous, abundant, plentiful, considerable |
| az | scarce, limited, sparse, scant |
| kullanışlı | useful, beneficial, valuable, practical |
| zararlı | harmful, damaging, detrimental, destructive |
| açık | clear, obvious, evident, apparent |
| tahmin etmek | predict, forecast, anticipate, estimate |
| göstermek | show, indicate, demonstrate, reveal |
| desteklemek | support, back up, promote, endorse |
| engellemek | prevent, hinder, prohibit, block |
| artırmak | enhance, improve, boost, enrich |
| başlamak | start, begin, initiate, launch |
| bitirmek | end, finish, terminate, conclude |

### Zıt anlamlılar

| Sözcük | Zıttı |
| --- | --- |
| abundant | scarce |
| beneficial | harmful |
| increase | decrease |
| accept | reject |
| allow | prohibit |
| ancient | modern |
| expand | shrink |
| improve | worsen |
| strengthen | weaken |
| temporary | permanent |
| rural | urban |
| optimistic | pessimistic |
| voluntary | compulsory |

## Aklında kalsın

- YDT’de **80 soru**: 5 kelime, 10 dilbilgisi, 5 cloze, 8 cümle tamamlama, 15 okuma, 5 diyalog, 5 yakın anlam, 5 durum, 5 paragraf tamamlama, 12 çeviri, 5 anlam bütünlüğü.
- Kelime bölümünde sırayla **isim, sıfat, zarf, fiil, edatlı fiil** çıkıyor (8 yıl, hep aynı).
- Boşluğu **kendi sözcüklerinle** doldurup seçeneklerle karşılaştır.
- Bağlaca bak: **although** ters yön, **because** sebep, **and** aynı yön.
- Sözcüğü **kalıbıyla** öğren: crucial **factor**, widely **used**, account **for**.
- **result in** sonucu, **result from** nedeni getirir.
- Sözcük ailesini bil: decide, decision, decisive, decisively.
- Sınavın sevdiği sözcükler: **crucial, enhance, account for, bring about, availability, unprecedented, thoroughly**.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| affect ve effect | affect fiil, effect isim. |
| economic ve economical | economic: ekonomik. economical: tasarruflu. |
| result in ve result from | in sonucu, from nedeni. |
| make a research | **conduct** research |
| do a mistake | **make** a mistake |
| say me | **tell** me |
| look the TV | **watch** the TV |
| lose ve loose | lose: kaybetmek. loose: gevşek. |
| raise ve rise | raise: yükseltmek (geçişli). rise: yükselmek (geçişsiz). |
| advices | **advice** (sayılamaz) |
| informations | **information** (sayılamaz) |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var ve sekiz yıllık düzene benzer sırada: önce isim, sıfat, zarf, fiil, edatlı fiil.

:::soru{cevap="B"}
The government has introduced new ---- to reduce the number of road accidents.

- A) rumours
- B) measures
- C) obstacles
- D) symptoms
- E) conflicts

---

1. Boşluk bir **isim**. Amaç kazaları azaltmak, bu yüzden hükümetin **aldığı önlemler**.
2. **take / introduce measures** doğal bir eşleşme: “önlem getirmek”.
3. Rumours söylentidir, obstacles engeldir, symptoms belirtidir, conflicts çatışmadır ve hiçbiri kaza sayısını azaltma amacıyla getirilmez. Doğru cevap **measures**.
:::

:::soru{cevap="B"}
Regular exercise has a ---- effect on mental health.

- A) hostile
- B) beneficial
- C) fragile
- D) reluctant
- E) obscure

---

1. Boşluk bir **sıfat** ve **effect** ismini tanımlıyor.
2. Düzenli egzersizin ruh sağlığına etkisi olumlu: **beneficial effect**.
3. Hostile düşmanca, fragile kırılgan, reluctant isteksiz, obscure belirsiz anlamı verir ve “effect” ile doğal eşleşme kurmaz. Doğru cevap **beneficial**.
:::

:::soru{cevap="C"}
The two models are ---- different, so customers often cannot tell them apart.

- A) deliberately
- B) extremely
- C) slightly
- D) entirely
- E) rarely

---

1. Boşluk bir **zarf** ve **different** sıfatını pekiştiriyor.
2. “Müşteriler ayırt edemiyor” sonucu, aradaki farkın **çok küçük** olduğunu gösteriyor: **slightly different**.
3. Extremely ve entirely farkın büyük olduğunu söyler ve sonuçla çelişir. Deliberately kasıt, rarely sıklık bildirir. Doğru cevap **slightly**.
:::

:::soru{cevap="A"}
The new law is expected to ---- the rights of workers in small companies and give them better protection.

- A) strengthen
- B) deny
- C) resign
- D) confuse
- E) interrupt

---

1. Boşluk bir **fiil** ve nesnesi **the rights**.
2. Yeni bir yasanın işçi haklarına etkisi olumlu bekleniyor: **strengthen the rights**.
3. Deny (inkâr etmek) “daha iyi koruma sağlamak” amacıyla çelişir. Resign nesne almaz. Confuse ve interrupt haklarla doğal eşleşme kurmaz. Doğru cevap **strengthen**.
:::

:::soru{cevap="E"}
The researchers will ---- a series of experiments next month to test the new vaccine.

- A) call off
- B) put up
- C) hold back
- D) take after
- E) carry out

---

1. Boşluk bir **edatlı fiil** ve nesnesi **a series of experiments**.
2. Deney yapmak: **carry out experiments** (uygulamak, gerçekleştirmek).
3. Call off (iptal etmek) deneyleri yapma amacıyla çelişir. Put up kurmak ya da konaklatmak, hold back engellemek, take after benzemek anlamı verir. Doğru cevap **carry out**.
:::

:::soru{cevap="C"}
The disease ---- poor sanitation and a lack of clean water.

- A) accounts for
- B) results in
- C) stems from
- D) leads to
- E) brings about

---

1. Cümle hastalığın **kaynağını** söylüyor: kötü hijyen ve temiz su eksikliği hastalığın **nedeni**.
2. Neden bildiren edatlı fiil: **stems from** (-den kaynaklanır).
3. Results in, leads to ve brings about hastalığın **sonucunu** getirir. Accounts for ise “oluşturmak, açıklamak” anlamı taşır ve burada uymaz. Burada hastalık sonuç, hijyen neden. Doğru cevap **stems from**.
:::

:::soru{cevap="D"}
Researchers have yet to ---- a cure for the disease.

- A) justify
- B) assume
- C) neglect
- D) develop
- E) occupy

---

1. Boşluk bir **fiil** ve nesnesi **a cure**.
2. Araştırmacıların henüz yapamadığı şey: bir tedavi **geliştirmek**.
3. Justify haklı çıkarmak, assume varsaymak, neglect ihmal etmek, occupy kaplamak anlamı verir ve “cure” ile eşleşmez. Doğru cevap **develop**.
:::

:::soru{cevap="A"}
Prices rose sharply last year. ----, many families had to cut their spending.

- A) Consequently
- B) Nevertheless
- C) Alternatively
- D) Likewise
- E) Otherwise

---

1. İlk cümle bir neden (fiyatlar arttı), ikinci cümle onun **sonucu** (aileler harcamayı kıstı).
2. Sonuç bildiren bağlantı sözcüğü: **Consequently**.
3. Nevertheless karşıtlık, alternatively seçenek, likewise benzerlik, otherwise aksi halde anlamı verir. Doğru cevap **Consequently**.
:::

:::ipucu{baslik="İpucu"}
Kelime sorusunda cevabı sana **cümlenin geri kalanı** verir. Boşluktan önceki ve sonraki sözcüklere, bağlaçlara ve cümlenin tonuna bak. Bildiğin sözcükleri kullanarak elemek, bilmediğin sözcüğü tahmin etmekten daha güvenilirdir.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “result ---- ” ve “result ---- ”: hangisi sebebi, hangisi sonucu getirir? => result **in** sonucu getirir (result in failure). result **from** nedeni getirir (result from poor planning).
2. “They c---- research on climate change.” (yürütmek, c ile başlar) => conduct.
3. “a c---- factor in the decision” (çok önemli, c ile başlar) => crucial.
4. “widely”, “thoroughly”, “slightly”: hangisi “yaygın olarak” demektir? => widely.
5. “account ----” (oluşturmak) => for. account for.
6. enhance ve increase arasındaki fark nedir? => enhance kaliteyi ya da değeri artırır (enhance quality). increase sayıyı ya da miktarı artırır (increase prices).
7. “derive ----” (-den türemek) => from.
8. “affect” ve “effect” hangisi fiil, hangisi isim? => affect fiil, effect isim.
9. “We must take m---- to protect the environment.” (önlemler, m ile başlar) => measures.
10. “abundant” sözcüğünün zıttı nedir? => scarce.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 48, false from public.topics where subject_id = 'ydt-dil' and name = 'Kelime Bilgisi';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Edilgen yapı (passive voice) YDT’nin her yerinde vardır. Dilbilgisi bölümündeki fiil biçimi sorularının yarısına yakınında bir boşluk edilgendir. Okuma parçalarında, cloze testlerde ve çeviri sorularında akademik İngilizce edilgen yapıyla yazılır. Edilgeni tanımak ve kurmak bu yüzden hem dilbilgisini hem okumayı hızlandırır. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Edilgen yapıyı (be + V3) bütün zamanlarda ve modallerle doğru kurmak.
2. Etken mi edilgen mi gerektiğini cümlenin yapısından anlamak (nesne var mı, by gelir mi, özne eylemi yapıyor mu?).
3. Edilgeni olmayan fiilleri (happen, occur, take place, consist of) tanımak.
4. It is said that ve He is said to be kalıplarıyla haber aktarma edilgenini kullanmak.
5. Mastar ve fiilimsilerin edilgenini (to be done, being done, to have been done) kurmak.
6. Ettirgen yapıyı (have something done) edilgenden ayırmak.
:::

:::ipucu{baslik="Sınavda bu konu"}
Edilgen sorusunda ilk iş **özneye bakmak**: eylemi özne mi yapıyor, özneye mi yapılıyor? Boşluktan sonra bir **nesne** varsa (ya da boşluktan sonra “by” + yapan geliyorsa) bunu hemen ayır. Nesne varsa etken, nesne yoksa ve özne eylemin alıcısıysa edilgen. Seçeneklerde be + V3 görürsen tense ve edilgeni aynı anda çöz.
:::

## 1. YDT’de edilgen nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki 24 fiil biçimi sorusuna bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. Sorulardan **11’inde** bir boşluk edilgendir: 9’unda çekimli fiil (is decided, was contaminated), 2’sinde edilgen fiilimsi (spoken, sung).

| Yıl | Doğru seçeneklerde görülen edilgen kalıplar |
| --- | --- |
| 2018 | edilgen yok (zaman, modal ve fiilimsi soruldu) |
| 2019 | is decided, has been disproven |
| 2020 | was contaminated |
| 2021 | spoken ve used (edilgen fiilimsi) |
| 2022 | was founded, must be taken |
| 2023 | are blasted off, can be formed, sung |
| 2024 | are misused, have been reported |
| 2025 | had not been introduced |

:::neden-sonuc
- 2018 hariç her yıl en az bir soruda edilgen var => Edilgeni kurmak, zaman bilgisi kadar öncelikli bir beceri.
- Edilgen çoğunlukla başka bir yapıyla yan yana (zaman, modal, fiilimsi) => Be + V3’ü bütün zamanlarda ve modalle birleşik biçimde bilmek gerekiyor.
- Edilgenin yanlış seçenekleri etken biçimde yazılmış => Özne eylemin alıcısıysa etken seçenekler hemen düşer.
- Akademik ve tarihsel metinler edilgen yoğun => Okuma sorularında da edilgeni görmek, cümleyi Türkçeye doğru çevirmeyi sağlar.
:::

## 2. Edilgen ne zaman kullanılır

Edilgen, **eylemi yapan önemsizse, bilinmiyorsa ya da zaten belliyse** ya da vurgu **eylemin sonucundaysa** kullanılır.

| Durum | Örnek |
| --- | --- |
| Yapan bilinmiyor | The window **was broken** last night. |
| Yapan önemsiz ya da belli | The road **is being repaired**. |
| Vurgu sonuçta | The bridge **was completed** in 1932. |
| Akademik, resmî dil | The data **were collected** over two years. |
| Genel yargı (haber aktarma) | It **is believed** that the earth is 4.5 billion years old. |

Yapan önemliyse **by** ile eklenir: “The bridge was designed **by** a Turkish engineer.”

## 3. Kuruluş: be + V3

Edilgenin tek kuralı: **uygun “be” biçimi + V3**. Zaman, be fiilinin biçiminden belli olur.

| Zaman | Etken | Edilgen |
| --- | --- | --- |
| Present Simple | They build houses. | Houses **are built**. |
| Present Continuous | They are building houses. | Houses **are being built**. |
| Present Perfect | They have built houses. | Houses **have been built**. |
| Past Simple | They built houses. | Houses **were built**. |
| Past Continuous | They were building houses. | Houses **were being built**. |
| Past Perfect | They had built houses. | Houses **had been built**. |
| Future (will) | They will build houses. | Houses **will be built**. |
| Future Perfect | They will have built houses. | Houses **will have been built**. |
| be going to | They are going to build houses. | Houses **are going to be built**. |
| Modal | They can build houses. | Houses **can be built**. |
| Modal perfect | They should have built houses. | Houses **should have been built**. |

:::baglanti
Edilgen bir zamanı kaldırmaz. Etkenin zamanı neyse edilgende de o kalır. Sadece **fiilin kendisi** be + V3’e dönüşür. Present Perfect Continuous ve Future Perfect Continuous edilgeni pek kullanılmaz, sınavda çıkmaz.
:::

### Nesne öne geçer

Etken cümlenin **nesnesi** edilgen cümlenin **öznesi** olur.

- Etken: **The committee** approved **the plan**.
- Edilgen: **The plan** was approved (by the committee).

Etken cümlede nesnesi olmayan bir fiilin edilgeni de olmaz. Bu yüzden edilgen cümleyi bulmak için “bu fiilin nesnesi var mıydı?” sorusunu sor.

## 4. Edilgeni olmayan fiiller

**Geçişsiz** (nesne almayan) fiillerin edilgeni olmaz. Sınavda seçeneklerin birinde “was happened” gibi bir hata saklanır.

| Fiil | Anlamı |
| --- | --- |
| happen, occur, take place | meydana gelmek |
| arise, appear, emerge | ortaya çıkmak |
| exist, remain, stay | var olmak, kalmak |
| die, fall, rise, grow (kendiliğinden) | ölmek, düşmek, yükselmek, büyümek |
| arrive, come, go | gelmek, gitmek |
| seem, become, look, sound | görünmek, olmak |
| consist of, belong to | oluşmak, ait olmak |
| last, lie, sit | sürmek, yatmak, oturmak |

- A major earthquake **occurred** in 1999. (**was occurred** yanlış.)
- The meeting **took place** in Ankara. (**was taken place** yanlış.)
- The cost **rose** sharply. (**was risen** yanlış.)

:::ipucu{baslik="Tuzak"}
Seçeneklerde “was occurred”, “was happened”, “has been existed”, “was died” gibi biçimler görürsen hemen ele. Bu fiillerin edilgeni yoktur.
:::

Bazı fiiller hem geçişli hem geçişsizdir: “She **grows** tomatoes” (geçişli, edilgeni var: tomatoes are grown) ve “Tomatoes **grow** in warm climates” (geçişsiz, edilgeni yok).

## 5. İki nesneli fiiller

give, send, show, offer, tell, teach, lend gibi fiillerin iki nesnesi vardır. Edilgen iki biçimde kurulabilir.

- Etken: They **gave her** a prize.
- Edilgen 1: **She was given** a prize. (kişi özne, daha yaygın)
- Edilgen 2: A prize **was given** to her.

## 6. Haber aktarma edilgeni

Genel görüşü ya da bilimsel iddiayı aktarırken kullanılır. İki biçimi vardır.

| Biçim | Örnek |
| --- | --- |
| It + be + V3 + that cümle | **It is believed that** the disease spreads through water. |
| Özne + be + V3 + to V1 | The disease **is believed to spread** through water. |
| Özne + be + V3 + to have V3 | The city **is thought to have been destroyed** by an earthquake. |
| Özne + be + V3 + to be V-ing | She **is said to be working** on a new book. |

Bu kalıba giren fiiller: say, think, believe, know, consider, report, claim, expect, estimate, suppose, allege, understand.

:::baglanti
Bu kalıpta **mastarın zamanı** önemlidir. Olay söylenen zamanla aynı anda ya da sonrasındaysa **to + V1**. Olay söylenen zamandan **önceyse** to **have + V3**. “He is said to be rich” (şimdi zengin). “He is said to have been rich” (zenginmiş, geçmişte).
:::

## 7. Mastar ve fiilimsilerin edilgeni

| Biçim | Edilgeni | Örnek |
| --- | --- | --- |
| to V1 | to be V3 | She wants **to be told** the truth. |
| to have V3 | to have been V3 | The paintings are thought **to have been stolen**. |
| V-ing | being V3 | He enjoys **being praised**. |
| having V3 | having been V3 | **Having been warned**, she left early. |

Fiilimsilerin ayrıntısı Gerunds ve Infinitives ile Participles konularında. Burada önemli olan: yapan özne eylemin alıcısıysa fiilimsi de edilgen olur.

### need, want, deserve, require + V-ing

Bazı fiillerden sonra V-ing gelirse **edilgen anlam** taşır.

- The car **needs washing**. = The car needs **to be washed**.
- The plan **requires checking**. = requires **to be checked**.

## 8. Ettirgen yapı

Bir işi başkasına yaptırmak için **have / get + nesne + V3** kullanılır. Edilgen gibi görünür ama anlamı farklıdır: biz işi başkasına **yaptırırız**.

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| have + nesne + V3 | yaptırmak | We **had the roof repaired**. |
| get + nesne + V3 | yaptırmak (konuşma dili) | She **got her hair cut**. |
| have + nesne + V1 | birine yaptırmak (etken) | He **had the mechanic check** the car. |

Edilgen: “The roof **was repaired**.” (Çatı onarıldı, kim yaptı önemli değil.) Ettirgen: “We **had** the roof **repaired**.” (Çatıyı onarttık.)

## 9. Edilgen ve edatlı fiiller

Edatlı fiillerin edilgeninde edat fiilde kalır.

- They **looked after** the children. => The children **were looked after**.
- The committee **dealt with** the problem. => The problem **was dealt with**.

## 10. Etken mi edilgen mi: karar yolu

1. **Özneyi bul.** Boşluktan önceki isim ya da zamir.
2. **Eylemi kim yapıyor?** Özne mi, yoksa özneye mi yapılıyor?
3. **Boşluktan sonra nesne var mı?** “The company launched **a new product**” (nesne var, etken). “A new product was launched” (nesne yok, edilgen).
4. **by + yapan var mı?** Varsa edilgen.
5. **Fiilin edilgeni var mı?** Geçişsiz fiilse edilgen olmaz.
6. **Seçenekleri sına.** Etken ve edilgen seçenekler yan yana ise özne bilgisi doğruyu seçtirir.

:::ipucu{baslik="Hızlı test"}
Cümleye “kim tarafından?” diye sorabiliyorsan edilgendir: The bridge was built (kim tarafından?). “The meeting took place” cümlesine bu soru sorulamaz, bu yüzden edilgen değildir.
:::

### Edilgenin zamanını bulma

Edilgen cümlede zamanı be fiili taşır. Sinyal sözcüklerine yine bak: in 1932, since 1950, by next year, at the moment.

- The bridge **was built** in 1932. (in 1932: Past Simple)
- The bridge **has been repaired** twice since then. (since: Present Perfect)
- The bridge **is being repaired** at the moment. (at the moment: Present Continuous)
- The bridge **will be reopened** next year. (next year: Future)

## Aklında kalsın

- Edilgen = **be + V3**. Zaman be’nin biçiminden belli olur.
- Özne eylemin alıcısıysa edilgen, yapıcısıysa etken.
- Nesne varsa etken. Nesne yoksa ve özne alıcıysa edilgen.
- **Geçişsiz fiillerin edilgeni yok**: happen, occur, take place, arise, exist, die, rise, fall, seem, remain, consist of.
- Haber aktarma: **It is said that** ve **He is said to V1 / to have V3**.
- Mastar edilgeni **to be V3**, **to have been V3**. Gerund edilgeni **being V3**, **having been V3**.
- **need, deserve, require + V-ing** edilgen anlam taşır.
- Ettirgen: **have / get + nesne + V3**.
- Modal edilgen: **modal + be + V3**. Geçmiş: **modal + have been + V3**.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| was happened | happen geçişsizdir, doğrusu **happened**. |
| was occurred, was taken place | **occurred**, **took place**. |
| It is said that ve He is said to | İkisi de edilgen haber aktarmadır. İkincisinde özne öne geçer ve fiil mastara döner. |
| is believed to be ve is believed to have been | Birincisi şimdiki durum, ikincisi geçmiş. |
| The roof was repaired ve We had the roof repaired | Birincisinde yapan belirsiz, ikincisinde biz yaptırdık. |
| being done ve to be done | being: gerund (enjoy, avoid, keep). to be: infinitive (want, need, hope). |
| needs washing ve needs to be washed | İkisi de aynı anlam. |
| has been built ve was built | Bitmiş ve belirli zaman (in 1932) varsa was built. Bağ şimdiyle sürüyorsa has been built. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Çoğu iki boşluklu.

:::soru{cevap="E"}
The ancient manuscript, which ---- in a cave in 1947, ---- in a museum ever since.

- A) found / has kept
- B) was finding / is kept
- C) has found / was keeping
- D) had found / has been kept
- E) was found / has been kept

---

1. Elyazması bir şey **bulmaz**, **bulunur**. Birinci boşluk edilgen ve **in 1947** belirli bir geçmiş zaman: **was found** (Past Simple edilgen).
2. İkinci boşlukta **ever since** şimdiye kadar süren bir durum anlatır: Present Perfect edilgen, **has been kept**.
3. A ve C etken, B ve D zaman olarak uymuyor. Doğru cevap **was found / has been kept**.
:::

:::soru{cevap="A"}
A major earthquake ---- in the region in 1999, and thousands of buildings ---- as a result.

- A) occurred / were destroyed
- B) was occurred / destroyed
- C) occurred / destroyed
- D) was occurring / were destroying
- E) has occurred / were destroying

---

1. **Occur** geçişsiz bir fiildir ve edilgeni olmaz. İlk boşlukta **occurred** gerekir. B’deki “was occurred” yanlıştır.
2. İkinci boşlukta binalar yıkılır, kendileri yıkmaz. Edilgen **were destroyed**.
3. C’de destroyed etken ve nesne yok. D ve E’de binaların “yıktığı” söyleniyor. Doğru cevap **occurred / were destroyed**.
:::

:::soru{cevap="D"}
The new treatment ---- to reduce recovery time by half, according to recent studies.

- A) is believing
- B) believes
- C) has believed
- D) is believed
- E) was believing

---

1. Bir görüşü aktaran **“according to recent studies”** ifadesi var. Tedavi “inanmaz”, ona “inanılır”.
2. Kalıp: **is believed to + V1**.
3. Diğer seçenekler etkendir. Doğru cevap **is believed**.
:::

:::soru{cevap="C"}
If the report ---- before Friday, the funding ---- to another project.

- A) will not finish / will give
- B) does not finish / is giving
- C) is not finished / will be given
- D) has not finished / gives
- E) was not finished / would give

---

1. Rapor kendini bitirmez, **bitirilir**. If cümleciğinde geleceği Present Simple anlatır ve edilgen kurulur: **is not finished**.
2. Fonlar kendi kendine vermez, **verilir**: will **be given**.
3. A, B ve D etkendir, rapor ve fon kendi başına eylem yapamaz. E’de zaman uyumu bozuk (was ... would). Doğru cevap **is not finished / will be given**.
:::

:::soru{cevap="B"}
Young children enjoy ---- stories by their parents before bed, and many of them want ---- the same story again and again.

- A) telling / to tell
- B) being told / to be told
- C) to be told / being told
- D) told / telling
- E) to tell / being told

---

1. **By their parents** yapanı gösterir. Çocuklara hikâye anlatılır, edilgen gerekir.
2. **enjoy** gerund alır: enjoy **being told**. **want** mastar alır: want **to be told**.
3. C seçeneğinde iki biçim yer değiştirmiş. A, D ve E etken ya da biçim olarak yanlış. Doğru cevap **being told / to be told**.
:::

:::soru{cevap="B"}
Our neighbours ---- their roof ---- last week after the storm.

- A) had / repair
- B) had / repaired
- C) have / repairing
- D) were having / repair
- E) got / to repair

---

1. Komşular çatıyı **kendileri tamir etmedi**, **onarttı**. Ettirgen yapı: **had their roof repaired** (have + nesne + V3).
2. **Last week** geçmiş zaman: had.
3. A ve D yalın fiil (repair) kullanıyor. C zaman olarak uymuyor. E’de got ... to repair kalıbı yok. Doğru cevap **had / repaired**.
:::

:::soru{cevap="A"}
Before the new law ---- last year, factories ---- to release waste into rivers without any limit.

- A) was introduced / were allowed
- B) introduced / allowed
- C) had introduced / had allowed
- D) was introducing / were allowing
- E) is introduced / have allowed

---

1. Yasa kendini çıkarmaz, **çıkarılır** (introduced). Fabrikalara atık bırakma **izni verilir**. İkisi de edilgen.
2. Zaman: **last year** geçmiş, ikisi de Past Simple edilgen: **was introduced / were allowed**.
3. B, C ve D etken. E’de zaman uyumsuz. Doğru cevap **was introduced / were allowed**.
:::

:::soru{cevap="C"}
The ancient city is thought ---- by an earthquake around 1200 BCE.

- A) to destroy
- B) destroying
- C) to have been destroyed
- D) to be destroying
- E) having destroyed

---

1. Haber aktarma kalıbı: **is thought + to ...**.
2. Şehir **yıkıldı** (edilgen) ve olay söylenen zamandan **önce** gerçekleşti (around 1200 BCE). Önce olan olayda **to have been V3**.
3. A, D ve E etken ya da yanlış biçim. B fiilimsi olarak bu kalıba girmez. Doğru cevap **to have been destroyed**.
:::

:::ipucu{baslik="İpucu"}
Edilgen sorusunda **seçeneklerin yarısı etkendir**. Önce nesne ya da by + yapan var mı diye bak. Yoksa etken seçeneklerin hepsi düşer.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “The bridge ---- in 1932.” (build) => was built.
2. “The road ---- at the moment.” (repair, Present Continuous) => is being repaired.
3. “The letters ---- before the deadline.” (should send, geçmiş) => should have been sent.
4. “The meeting ---- in Ankara last week.” (take place) => took place. Take place’in edilgeni yok.
5. “The disease is believed ---- through water.” (spread, şimdiki zaman) => to spread.
6. “The city is thought ---- by fire in 1666.” (destroy, geçmiş) => to have been destroyed.
7. “The car needs ---- .” (wash) => washing (ya da to be washed).
8. “We ---- our house ---- last month.” (paint, yaptırmak) => had / painted.
9. “She enjoys ---- by her friends.” (invite) => being invited.
10. “Houses ---- here since 1950.” (build, Present Perfect) => have been built.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 32, false from public.topics where subject_id = 'ydt-dil' and name = 'Passive Voice';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Karşılaştırma yapıları (as ... as, more ... than, the more ... the more) ve ikili bağlaçlar (either ... or, neither ... nor, both ... and, not only ... but also, so ... that, such ... that) YDT’de **her yıl bir dilbilgisi sorusu** olarak çıkar: 14. soru. Kalıplar birbirine benzer, boşluklar ise iki parçalıdır ve ikisi de doğru olmak zorundadır. Bu yüzden konu aslında bir **eşleştirme** konusudur. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Eşitlik, üstünlük ve en üstünlük kalıplarını (as ... as, -er than, the -est) doğru kurmak.
2. The more ..., the more ... gibi orantılı karşılaştırmayı tanımak.
3. So ... that ile such ... that arasındaki farkı bilmek.
4. Either ... or, neither ... nor, both ... and, not only ... but also ikililerini kurmak ve fiil uyumunu yapmak.
5. Eşit ya da paralel yapı (aynı türde sözcük ya da öbek) kuralını uygulamak.
6. İki parçalı boşluğu ilk bakışta tanımak ve eşleşmeyen seçenekleri elemek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 14. sorusu (dilbilgisi bölümünün 9. maddesi) her yıl **ikili kalıp** sorusudur. Seçeneklerin hepsi “X / Y” biçimindedir ve ikisi **birbiriyle uyumlu** olmalıdır: as / as, so / that, either / or. Bir parçayı bildiğin an ikinci parçayı otomatik olarak bulursun. Boşluğun yakınına bak: ilk boşluğun hemen arkasında ne var (sıfat mı, isim mi, much mı)?
:::

## 1. YDT’de ikili kalıplar nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki sorulara bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. Her yıl sınavın 14. sorusu bu konudan geldi (toplam 8 soru).

| Yıl | Doğru çift | Kalıp |
| --- | --- | --- |
| 2018 | as / as | çarpanlı: ... times as much ... as |
| 2019 | so / that | so + sıfat + that |
| 2020 | the more / the more | The more ..., the more ... |
| 2021 | as / as | not as + sıfat + as |
| 2022 | either / or | iki ihtimal: either ... or |
| 2023 | neither / nor | could + neither ... nor |
| 2024 | such / that | such + a + isim + that |
| 2025 | as / as | as much + isim + as |

:::neden-sonuc
- Sekiz yılın üçünde as ... as => Eşitlik kalıbı en sık çıkan kalıp. Çarpanla (six times) ya da olumsuzla (not as) gelebilir.
- So ... that ve such ... that toplam iki kez => Sonuç yapısı mutlaka bilinmeli. İkisi arasındaki farkı isimden anla.
- Either ... or ve neither ... nor birer kez => İkili bağlaçlar da çıkıyor. Bunlar iki seçenek ya da iki olumsuzluk anlatır.
- The more ... the more tek kez ama tuzaklı => Orantılı karşılaştırma kalıbı cümlenin başında gelir ve virgülle ikiye ayrılır.
:::

## 2. Karşılaştırma dereceleri

İngilizcede üç derece vardır.

| Derece | Anlam | Örnek |
| --- | --- | --- |
| Eşitlik (equality) | eşit | She is **as tall as** her brother. |
| Üstünlük (comparative) | daha | She is **taller than** her brother. |
| En üstünlük (superlative) | en | She is **the tallest** in her class. |
| Azlık | daha az | This is **less expensive than** that. |
| En az | en az | This is **the least expensive**. |

### Üstünlük ve en üstünlük kuralları

| Sıfat | Üstünlük | En üstünlük |
| --- | --- | --- |
| Tek heceli | -er | the -est (tall, taller, the tallest) |
| -y ile biten iki heceli | -ier | the -iest (happy, happier, the happiest) |
| Uzun sıfatlar (üç hece ve üstü, çoğu iki heceli) | more + sıfat | the most + sıfat (more important, the most important) |
| Düzensizler | | good, better, the best / bad, worse, the worst / far, farther ya da further, the farthest ya da the furthest / little, less, the least / many ya da much, more, the most |

**Tek heceli sıfatlarda -er** kullanılır, ama iki heceli bazı sıfatlar iki biçimi de alır: clever, narrow, simple, quiet.

### Pekiştirme

Karşılaştırmayı güçlendirmek için **much, far, a lot, even, still** gibi sözcükler üstünlük sıfatından önce kullanılır.

- Online shopping is **much more convenient** than visiting stores.
- This route is **far shorter** than the old one.

**Very** ve **too** karşılaştırma ile kullanılmaz: “very more important” yanlıştır. Doğrusu “much more important”.

En üstünlüğü pekiştirmek için **by far, easily, one of the** kullanılır: “**by far the best**”, “**one of the most important**”.

## 3. Eşitlik: as ... as

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| as + sıfat/zarf + as | -kadar | She is **as tall as** him. |
| not as/so + sıfat + as | kadar değil | It is **not as expensive as** I thought. |
| as many + çoğul isim + as | kadar çok | He has **as many books as** I do. |
| as much + sayılamaz isim + as | kadar çok | She earns **as much money as** he does. |
| twice / three times / half as + sıfat + as | iki / üç katı, yarısı kadar | The stadium holds **three times as many** people **as** the old one. |
| as + sıfat + as possible | olabildiğince | Come **as soon as possible**. |
| the same + isim + as | aynı | He has **the same** opinion **as** me. |
| similar to / different from | benzer, farklı | It is similar **to** yours. |

:::ipucu{baslik="Çarpan varsa as ... as"}
“Three times **as** many people **as**” kalıbında çarpan (twice, three times, half) **as ... as** ile birlikte gelir. “Three times more than” da kullanılır ama bu YDT’de “as ... as” ile sorulmuştur.
:::

### As ... as ile than karışıklığı

- Eşitlikte **as**: She is as tall **as** him.
- Üstünlükte **than**: She is taller **than** him.
- “as tall than” ya da “taller as” yanlıştır.

## 4. Üstünlük yapıları

| Kalıp | Örnek |
| --- | --- |
| sıfat-er / more + sıfat + than | A train is **faster than** a bus. |
| than any other + tekil isim | Everest is higher **than any other** mountain. |
| the + comparative … the + comparative | **The more** you practise, **the better** you become. |
| comparative + and + comparative | The weather is getting **colder and colder**. |
| the + comparative of the two | She is **the taller of the two**. |
| prefer … to … | I prefer tea **to** coffee. |
| would rather … than … | I would rather walk **than** wait. |

### The more ... the more

Bu kalıp, iki durumun **birlikte değiştiğini** gösterir.

- **The more** people you dine with, **the more** food you eat.
- **The earlier** you start, **the sooner** you finish.
- **The more widely** a language is spoken, **the more opportunities** its speakers have.

Kuruluş: **The + üstünlük + özne + fiil, the + üstünlük + özne + fiil.** İki cümlecik de **the** ile başlar. “More ... more” ya da “the more ... more” yanlıştır.

## 5. En üstünlük

| Kalıp | Örnek |
| --- | --- |
| the + sıfat-est / the most + sıfat | the **tallest** building, the **most expensive** car |
| in + yer/grup | the best student **in** the class |
| of + grup | the best of **all** |
| one of the + çoğul | one of the **most important** discoveries |
| ever, so far | the best film I have **ever** seen |

En üstünlükte çoğu zaman **the** gerekir (iyelik varsa gerekmez: my best friend). “Everest is highest” yanlıştır. Ama zarf olarak kullanılan most the olmadan kullanılabilir: “She works most carefully.”

## 6. So ... that ve such ... that

Bu iki kalıp bir **sonucu** anlatır: “o kadar ... ki ...”.

| Kalıp | Sonrası | Örnek |
| --- | --- | --- |
| so + sıfat/zarf + that | sıfat ya da zarf | The storm was **so severe that** flights were cancelled. |
| so + many/few + çoğul isim + that | | There were **so many people that** we left. |
| so + much/little + sayılamaz isim + that | | There was **so much** noise **that** I couldn’t sleep. |
| such + (a/an) + (sıfat) + isim + that | isim | It was **such a severe storm that** flights were cancelled. |

:::baglanti
**So** sonrası **sıfat ya da zarf**, **such** sonrası **isim** (önünde sıfat olabilir). “Such a deep **sense of dependency** that ...” isim sonrası olduğu için such. “So close to the Antarctic that ...” sıfat sonrası olduğu için so.
:::

### too ... to ve enough ... to

| Kalıp | Anlam | Örnek |
| --- | --- | --- |
| too + sıfat + to V1 | fazla ... -emeyecek kadar | The tea is **too hot to drink**. |
| sıfat + enough + to V1 | -ecek kadar | He is **old enough to vote**. |

## 7. İkili bağlaçlar (correlative conjunctions)

| Kalıp | Anlam | Fiil | Örnek |
| --- | --- | --- | --- |
| **both ... and** | hem ... hem | çoğul | **Both** the manager **and** his assistant were late. |
| **either ... or** | ya ... ya da | yakın özneye uyar | **Either** he **or** his parents **are** coming. |
| **neither ... nor** | ne ... ne | yakın özneye uyar, fiil olumlu | **Neither** the manager **nor** his assistants **were** aware. |
| **not only ... but also** | yalnız ... değil, ... de | yakın özneye uyar | **Not only** the manager **but also** his assistants **were** late. |
| **whether ... or** | ... mı ... mı | | I don’t know **whether** he agrees **or** not. |
| **not ... but** | ... değil, ... | | It was **not** the price **but** the quality that mattered. |
| **as well as** | -in yanı sıra | ilk özneye uyar | The manager **as well as** his assistants **was** late. |
| **rather ... than** | ... yerine | | She chose to walk **rather than** drive. |

### Neither ... nor’da fiil olumlu

Neither / nor kendi başına olumsuzluk taşır. Bu yüzden fiil **olumlu** kalır. “Neither he nor she **didn’t** come” yanlıştır. Doğrusu “Neither he nor she **came**”.

Modal ile de kullanılır: “You could **neither** stand **nor** walk.” **Neither** ilk öğeden önce, **nor** ikinci öğeden önce gelir.

### Not only ... but also ve devrik yapı

Cümleyi **not only** ile başlatırsan yardımcı fiil öne geçer: “**Not only did** he arrive late, **but** he **also** forgot the documents.”

### Paralellik

İkili bağlaçla bağlanan iki öğe **aynı yapıda** olmalıdır.

- **Both** the manager **and** his assistant. (isim ve isim)
- **Not only** to improve skills **but also** to build confidence. (to V1 ve to V1)
- **Either** a neutron star **or** a black hole. (isim öbeği ve isim öbeği)

“He is both clever and works hard” yanlıştır. Doğrusu “He is both clever and hard-working”.

## 8. Çözüm yolu

1. **Boşlukların çevresine bak.** İlk boşluğun hemen ardından ne geliyor? Sıfat (so, as), isim (such), fiil (either), karşılaştırma sıfatı (the more)?
2. **Cümlenin anlamını söyle.** Eşitlik mi, sonuç mu, seçenek mi, olumsuz mu?
3. **Kalıba karar ver.** As ... as eşitlik, so ... that sonuç, either ... or seçenek, neither ... nor ikisi de değil.
4. **İkinci boşluğu kontrol et.** Kalıbın ikinci yarısı uyuyor mu?
5. **Seçenekleri sına.** Birinci parçayı doğru ama ikinciyi yanlış seçenek genellikle tuzaktır.

## Aklında kalsın

- **as ... as** eşitlik. Çarpanla da gelir: three times as many as.
- **than** üstünlükte, **as** eşitlikte. Birbirine karıştırılmaz.
- **the more ..., the more ...**: iki cümlecik de the ile başlar.
- **so + sıfat/zarf + that**. **such + (a) + (sıfat) + isim + that**.
- **too ... to**: fazla ... -emeyecek. **enough ... to**: -ecek kadar.
- **either ... or**, **neither ... nor**, **both ... and**, **not only ... but also**: ikili, paralel yapı.
- **neither ... nor** ile fiil olumlu. Yakın özneye uyar.
- Üstünlüğü pekiştir: **much, far, a lot, even**. **Very** kullanma.
- En üstünlükte **the**, “in” + yer, “of” + grup.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| as tall than | **as tall as** |
| taller as | **taller than** |
| very more important | **much more important** |
| more and more tall | **taller and taller** |
| the more you practise, more you learn | **the more you practise, the more you learn** |
| so a big problem | **such a big problem** ya da so big a problem |
| so problem that | **such a problem that** |
| such big that | **so big that** |
| neither … or | **neither … nor** |
| either … nor | **either … or** |
| both … or | **both … and** |
| not only … also | **not only … but also** |
| neither doesn’t | **neither does** (fiil olumlu) |
| the highest mountain of the world | tercih edilen: **in the world** |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Çoğu iki boşluklu.

:::soru{cevap="B"}
The new stadium can hold nearly three times ---- many spectators ---- the old one.

- A) so / that
- B) as / as
- C) such / as
- D) more / than
- E) as / than

---

1. **Three times** çarpanı eşitlik kalıbıyla gelir: **three times as many ... as**.
2. İki boşluk da as olmalı. A’daki so / that sonuç kurar. C’deki such isimle, D’deki more / than ise “three times more many” hatası yaratır. E’de ikinci parça uyumsuz.
3. Doğru cevap **as / as**.
:::

:::soru{cevap="E"}
The exam was ---- a difficult one ---- only five students passed.

- A) so / that
- B) such / as
- C) too / that
- D) very / that
- E) such / that

---

1. Boşluktan sonra **a difficult one** var: **a/an + sıfat + isim (one)**. İsim öbeği olduğu için **such** gerekir.
2. Sonuç bildiren ikinci parça **that**.
3. A’daki so sıfat ya da zarfla kullanılır, a difficult one gibi bir isim öbeğiyle değil. B’de as uyumsuz. C ve D’de too ve very sonuç kurmaz. Doğru cevap **such / that**.
:::

:::soru{cevap="A"}
---- a company grows, ---- employees it needs.

- A) The more quickly / the more
- B) More quickly / more
- C) The quickly / the more
- D) The more quickly / more
- E) More quickly / the more

---

1. İki durumun birlikte değiştiğini gösteren **orantılı karşılaştırma**: the + comparative, the + comparative.
2. İki cümlecik de **the** ile başlar: **The more quickly ..., the more employees ...**.
3. Diğer seçeneklerde bir ya da iki cümlecikte the eksik. Doğru cevap **The more quickly / the more**.
:::

:::soru{cevap="A"}
Scientists believe the object is ---- a small asteroid ---- a piece of an old satellite.

- A) either / or
- B) neither / or
- C) both / or
- D) either / nor
- E) whether / nor

---

1. Bilim insanları **iki ihtimal** sayıyor: ya asteroit ya uydu parçası.
2. İki seçenek arasında kalmayı **either ... or** anlatır.
3. B, C, D ve E’de bağlaç çiftleri eşleşmiyor. Doğru cevap **either / or**.
:::

:::soru{cevap="B"}
---- the manager ---- his assistants were aware of the problem.

- A) Both / or
- B) Neither / nor
- C) Not only / nor
- D) Either / and
- E) Neither / or

---

1. Fiil **olumlu** (were aware) ve anlam olumsuz: “Hiçbiri farkında değildi.” Bu **neither ... nor** ile kurulur.
2. Neither / nor kendi başına olumsuzluk taşır, fiilde ayrıca olumsuz yoktur.
3. A, D ve E bağlaç çiftini eşleştirmiyor. C’de not only ile nor birlikte olmaz. Doğru cevap **Neither / nor**.
:::

:::soru{cevap="C"}
Online shopping is ---- more convenient than visiting stores, but it is not ---- reliable as many people think.

- A) very / as
- B) most / as
- C) much / as
- D) more / so
- E) so / as

---

1. Üstünlük sıfatı (**more convenient**) “very” ile değil, **much / far / a lot** ile pekiştirilir: **much more convenient**.
2. İkinci parça olumsuz eşitlik: **not as reliable as**. Boşluk bir as.
3. A’da very, B’de most üstünlükle kullanılmaz. D ve E’de ilk boşluk yanlış. Doğru cevap **much / as**.
:::

:::soru{cevap="C"}
The new curriculum aims to improve ---- students’ language skills ---- their confidence.

- A) both / as well
- B) either / and
- C) not only / but also
- D) neither / or
- E) whether / or

---

1. İki iyileştirme hedefi birbirine ekleniyor: dil becerisi ve özgüven.
2. Ekleme için uygun ikili: **not only ... but also**.
3. A’daki both ile as well eşleşmez (both ... and gerekir). B, D ve E bağlaç çiftlerini eşleştirmiyor. Doğru cevap **not only / but also**.
:::

:::soru{cevap="D"}
Mount Everest is ---- mountain in the world, and it is ---- than any other peak.

- A) higher / the highest
- B) the highest / the higher
- C) highest / higher
- D) the highest / higher
- E) the higher / highest

---

1. “Dünyadaki” bir grupla karşılaştırma ve en yüksek: **the highest mountain**.
2. **than any other peak** üstünlük bildirir: **higher than any other peak**.
3. A tam tersi sırada. B ve E’de the higher kullanımı yanlış. C’de ilk boşlukta the eksik. Doğru cevap **the highest / higher**.
:::

:::ipucu{baslik="İpucu"}
İkili kalıp sorusunda **önce bir tarafı kesinleştir**. “Not … as” görürsen as, “the more” görürsen the more. Bir tarafı bildiğin an ikinci tarafı otomatik bulursun.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “She is ---- tall ---- her brother.” (eşit) => as / as.
2. “It was ---- cold ---- we stayed home.” (sonuç) => so / that.
3. “It was ---- a cold day ---- we stayed home.” (sonuç, isim var) => such / that.
4. “---- you practise, ---- you improve.” (orantı) => The more / the more.
5. “---- he ---- his friends were there.” (ikisi de değil) => Neither / nor.
6. “You can ---- pay now ---- pay later.” (ya … ya) => either / or.
7. “She is ---- clever ---- hard-working.” (hem … hem) => both / and.
8. “He is taller ---- his father.” => than.
9. “The ---- you work, the ---- you earn.” (harder / more) => harder / more.
10. “This is ---- most expensive hotel in the city.” => the.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 34, false from public.topics where subject_id = 'ydt-dil' and name = 'Comparison ve Correlatives';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Zarflar (adverbs) fiilleri, sıfatları, başka zarfları ya da bütün bir cümleyi tanımlar: **significantly** greater, **thoroughly** understood, **decisively** against, **primarily** intended. YDT’de zarflar dilbilgisi bölümünde değil, **kelime bilgisi bölümünün her yıl üçüncü sorusunda** karşına çıkar. Üçüncü soru sekiz yılın sekizinde zarf sorusuydu. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. Zarf türlerini (tarz, yer, zaman, sıklık, derece, cümle zarfı) ayırt etmek.
2. Zarfın cümledeki yerini (fiilden önce, sıfattan önce, cümle başı) bilmek.
3. Sıfat ve zarf farkını (hard ve hardly, late ve lately) ayırt etmek.
4. Sınavda sorulan zarfları ve onlarla kullanılan kalıpları (widely used, thoroughly understood) tanımak.
5. Olumsuz zarflarla (hardly, seldom, never) kurulan devrik yapıları kurmak.
6. Zarf ile sıfat seçeneklerinin yan yana olduğu sorularda doğru sınıfı bulmak.
:::

:::ipucu{baslik="Sınavda bu konu"}
Kelime bilgisi bölümünün 3. sorusu sekiz yılın sekizinde **zarf sorusuydu**. Seçeneklerin hepsi -ly zarfıdır ve cümlenin anlamına göre birini seçmen gerekir. Zarfın **neyi tanımladığına** bak: boşluktan sonraki sıfata mı, fiile mi, participle’a mı? Bu zarfın doğal eşleşmelerini bil.
:::

## 1. YDT’de zarf nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki kelime bilgisi sorularına bakılarak hazırlandı. Doğru seçenekler tek tek çözülerek belirlendi. Her yıl üçüncü kelime sorusu bir zarf sorusuydu.

| Yıl | Doğru zarf | Kalıp |
| --- | --- | --- |
| 2018 | exactly | difficult to say **exactly** when |
| 2019 | significantly | **significantly** greater levels |
| 2020 | Initially | **Initially**, (cümle başı zarfı) |
| 2021 | decisively | act **decisively** against |
| 2022 | primarily | intended **primarily** for |
| 2023 | widely | **widely** associated with |
| 2024 | slightly | each **slightly** different |
| 2025 | thoroughly | not been **thoroughly** understood |

:::neden-sonuc
- Sekiz yılın sekizinde üçüncü kelime sorusu zarf => Zarf bilgisi garantili 1 soru demek.
- Zarfların üçü derece ve yaygınlık bildirir (significantly, slightly, widely) => Sıfat ya da participle önünde pekiştirici zarfları bil.
- İkisi cümle başı zarfı (Initially) ya da bir bağlaç sözcüğü tanımlayan zarf (exactly when) => Cümle zarflarını da bil.
- Bir zarf bir fiili tanımlıyor (act decisively) => Fiil + zarf eşleşmeleri öğrenilmeli.
:::

### Çıkmış sorularda doğru çıkan zarflar

| Zarf | Anlam | Tipik eşleşme |
| --- | --- | --- |
| exactly | tam olarak | say exactly, know exactly |
| significantly | önemli ölçüde | significantly higher, increase significantly |
| initially | başlangıçta | initially planned, initially thought |
| decisively | kararlılıkla | act decisively, decisively defeated |
| primarily | esas olarak | primarily designed for, primarily responsible |
| widely | yaygın olarak | widely used, widely known, widely available |
| slightly | hafifçe | slightly different, slightly higher |
| thoroughly | tamamen, iyice | thoroughly understood, thoroughly investigated |

Bu sekiz zarfı kendi cümlende kullan ve **ne ile birlikte kullanıldığını** (sıfat, participle, fiil) yaz.

## 2. Zarf türleri

| Tür | Soru | Örnek |
| --- | --- | --- |
| Tarz (manner) | nasıl? | She spoke **clearly**. They acted **decisively**. |
| Yer (place) | nerede? | He lives **nearby**. |
| Zaman (time) | ne zaman? | We arrived **yesterday**. **Initially**, it was hard. |
| Sıklık (frequency) | ne sıklıkla? | I **always** drink tea. |
| Derece (degree) | ne kadar? | It is **extremely** cold. They differ **slightly**. |
| Cümle zarfı (sentence adverb) | yazarın tutumu | **Fortunately**, nobody was hurt. |
| Bağlayıcı (linking) | iki cümle arası | **However**, prices rose. |

## 3. Zarf oluşturma

Çoğu zarf **sıfat + -ly** ile oluşur.

| Sıfat | Zarf | Not |
| --- | --- | --- |
| quick | quickly | |
| careful | carefully | |
| easy | easily | y => ily |
| happy | happily | |
| basic | basically | -ic ile biten sıfatlar -ically alır (scientific, scientifically) |
| public | publicly | istisna: publicly (publically değil) |
| true | truly | e düşer |
| whole | wholly | |
| possible | possibly | -le => -ly |

### Düzensiz zarflar

| Sıfat | Zarf |
| --- | --- |
| good | **well** |
| hard | **hard** (hardly farklı anlam) |
| fast | **fast** |
| early | **early** |
| late | **late** (lately farklı) |

### -ly ile biten sıfatlar

Bazı sözcükler -ly ile bitse de **sıfattır**: friendly, lovely, likely, unlikely, lonely, elderly, costly, daily, weekly, monthly, yearly. Zarf yapmak için “in a friendly way” gibi ifade kullanılır.

### Anlamı değişen çiftler

| Zarf 1 | Zarf 2 |
| --- | --- |
| hard (çok, güçlü) | hardly (neredeyse hiç) |
| late (geç) | lately (son zamanlarda) |
| near (yakın) | nearly (neredeyse) |
| high (yüksek) | highly (çok, oldukça) |
| deep (derin) | deeply (derinden, çok) |
| wide (geniş) | widely (yaygın olarak) |
| free (bedava) | freely (serbestçe) |
| most (en çok) | mostly (çoğunlukla) |
| short (kısa) | shortly (yakında) |

- He worked **hard**. (çok çalıştı) / He **hardly** worked. (neredeyse hiç)
- The book is **widely** used. (yaygın)

## 4. Zarfın yeri

### Tarz, yer, zaman

Genellikle **cümlenin sonunda** durur: She spoke **clearly**. They arrived **yesterday**.

### Sıklık zarfları

Ana fiilden **önce**, be fiilinden **sonra**.

- She **always** arrives early.
- She is **always** early.
- She has **always** arrived early. (yardımcı fiilden sonra)

Sıklık zarfları: always, usually, often, sometimes, seldom, rarely, never, hardly ever, frequently, occasionally, generally.

### Derece zarfları

Tanımladıkları **sıfatın ya da zarfın hemen önünde** durur: **extremely** important, **significantly** higher, **slightly** different.

**Enough** istisna: sıfattan **sonra** gelir (big **enough**).

### Cümle zarfları

Cümlenin başında, virgülle: **Fortunately**, nobody was hurt. **Initially**, the plan seemed easy. **Overall**, the results were positive.

### Participle önünde

Yardımcı fiil ile participle arasında durur: The effects **have not been thoroughly understood**. The new law **is widely opposed**.

:::baglanti
Zarf, yardımcı fiil ile participle **arasına** girer: has **significantly** improved, is **widely** used, was **thoroughly** investigated. Bu yer kelime bilgisi sorularında zarf ipucudur.
:::

## 5. Derece zarfları ve pekiştirme

| Derece | Zarflar | Örnek |
| --- | --- | --- |
| Çok güçlü | extremely, highly, deeply, remarkably | **highly** effective, **deeply** concerned |
| Güçlü | very, really, particularly, significantly | **significantly** different |
| Orta | quite, fairly, rather, relatively, somewhat | **relatively** cheap |
| Zayıf | slightly, a little, a bit | **slightly** higher |
| Neredeyse yok | barely, hardly, scarcely | **barely** noticeable |

### Fiil ile derece

Derece zarfları fiille de kullanılır: She **strongly** disagrees. The new law is **heavily** criticised. The two languages differ **considerably**.

### Sıfatla doğal eşleşmeler

| Zarf | Sık eşleştiği sözcükler |
| --- | --- |
| **highly** | developed, effective, likely, unlikely, skilled, qualified, recommended |
| **widely** | used, known, available, accepted, believed, reported |
| **deeply** | rooted, concerned, affected, divided |
| **closely** | related, linked, monitored, connected |
| **largely** | unknown, due to, based on, ignored |
| **fully** | understood, aware, developed, equipped |
| **thoroughly** | understood, investigated, enjoyed, tested |
| **strongly** | recommended, influenced, linked, opposed |
| **heavily** | dependent, populated, influenced, criticised |
| **severely** | damaged, limited, affected, restricted |
| **slightly** | different, higher, lower, improved |
| **significantly** | higher, increased, reduced, different |
| **increasingly** | popular, important, difficult, common |
| **virtually** | impossible, unknown, identical |

## 6. Zaman ve süreç zarfları

| Zarf | Anlam | Örnek |
| --- | --- | --- |
| initially | başlangıçta | **Initially**, the plan seemed simple. |
| eventually | sonunda | **Eventually**, they agreed. |
| ultimately | nihayetinde | **Ultimately**, the decision was theirs. |
| previously | daha önce | The building was **previously** a school. |
| currently | şu anda | They are **currently** negotiating. |
| recently, lately | yakın zamanda | She has **recently** moved. |
| subsequently | sonradan | He **subsequently** resigned. |
| already, yet, still, just | zaten, henüz, hâlâ, az önce | They have **already** left. |

### already, yet, still, just

| Zarf | Kullanım | Örnek |
| --- | --- | --- |
| already | olumlu, “zaten” | They have **already** discussed it. |
| yet | olumsuz ve soru, “henüz” | They haven’t decided **yet**. |
| still | “hâlâ” | They **still** haven’t decided. |
| just | “az önce” | She has **just** left. |

## 7. Cümle zarfları ve odak zarfları

### Tutum bildirenler

| Zarf | Anlam |
| --- | --- |
| fortunately, unfortunately | neyse ki, ne yazık ki |
| surprisingly | şaşırtıcı biçimde |
| obviously, clearly | belli ki |
| apparently, evidently | görünüşe göre |
| arguably | savunulabilir biçimde, denebilir ki |
| undoubtedly, certainly | şüphesiz |
| presumably | muhtemelen |
| admittedly | kabul etmek gerekir ki |

### Odak (focus) zarfları

| Zarf | Anlam |
| --- | --- |
| primarily, mainly, chiefly | esas olarak |
| merely, simply, just | sadece |
| solely, only, exclusively | yalnızca |
| particularly, especially | özellikle |
| largely, mostly | çoğunlukla |

## 8. Olumsuz zarflar ve devrik yapı

Olumsuz anlamlı zarflar cümlenin başına geldiğinde **yardımcı fiil öne geçer**.

| Zarf | Örnek |
| --- | --- |
| hardly … when | **Hardly had** the match started **when** it began to rain. |
| scarcely … when | **Scarcely had** she left **when** the phone rang. |
| no sooner … than | **No sooner had** he arrived **than** the meeting began. |
| never | **Never have** I seen such a thing. |
| seldom, rarely | **Seldom does** he complain. |
| only when / only if | **Only when** he arrived did we begin. |
| not only … but also | **Not only did** he lie, **but** he also cheated. |
| little | **Little did** they know. |
| under no circumstances | **Under no circumstances should** you open it. |

## 9. Karşılaştırma ve eşit derece

| Kalıp | Örnek |
| --- | --- |
| zarf + -er / more + zarf + than | He runs **faster than** me. She works **more carefully** than him. |
| the + en üstünlük zarfı | She answered **the most clearly**. |
| as + zarf + as | He drives **as carefully as** she does. |
| the more … the more | **The more carefully** you read, **the more** you learn. |

## 10. Too, also, either, neither, so

| Sözcük | Kullanım | Örnek |
| --- | --- | --- |
| too | olumlu cümle sonunda “de” | I like tea **too**. |
| also | fiilden önce | I **also** like tea. |
| either | olumsuz cümle sonunda “de” | I don’t like coffee **either**. |
| so + yardımcı fiil + özne | olumlu onay | **So do I**. |
| neither + yardımcı fiil + özne | olumsuz onay | **Neither do I**. |

## 11. Çözüm yolu

1. **Boşluğun neyi tanımladığını bul.** Boşluktan sonra sıfat mı, participle mı, fiil mi?
2. **Anlamı söyle.** “Ne kadar?”, “Ne zaman?”, “Nasıl?”
3. **Doğal eşleşmeyi hatırla.** widely used, thoroughly understood, significantly higher.
4. **Seçenekleri tek tek cümleye koy.** En doğal duyulanı seç.
5. **Cümle başındaysa** cümle zarflarına (initially, eventually, overall) bak.

## Aklında kalsın

- Kelime bilgisi bölümünün **3. sorusu** zarf sorusu.
- Sınavda çıkan zarflar: **exactly, significantly, initially, decisively, primarily, widely, slightly, thoroughly**.
- Zarf, **yardımcı fiil ile participle arasında** durur: has **significantly** improved.
- Derece zarfı **sıfatın önünde**: **slightly** different.
- Sıklık zarfı **ana fiilden önce**, **be’den sonra**.
- **hard / hardly**, **late / lately**, **near / nearly**, **high / highly**: anlam farkı.
- **Hardly, seldom, never** cümle başında => **devrik yapı**.
- **Already** olumlu, **yet** olumsuz ve soru.
- **Too** olumlu, **either** olumsuz.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| He works hardly | **He works hard** |
| She arrived lately | **She arrived late** |
| a highly mountain | **a high mountain** |
| The book is wide used | **The book is widely used** |
| She spoke clear | **She spoke clearly** |
| He drove fastly | **He drove fast** |
| She speaks English good | **She speaks English well** |
| Hardly he had arrived | **Hardly had he arrived** |
| I don’t like it too | **I don’t like it either** |
| They have yet left | **They have already left** |
| He hardly never works | **He hardly ever works** |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="A"}
She worked ---- to finish the report before the deadline.

- A) hard
- B) hardly
- C) hardy
- D) hardness
- E) hards

---

1. Çok çalıştı: bir **çaba** anlatılıyor. Fiili tanımlayan, tarz bildiren zarf.
2. “Çok çalışmak” için zarf **hard** (hardly değil).
3. Hardly “neredeyse hiç” anlamı verir ve cümlenin amacıyla çelişir. Diğerleri yapıya uymuyor. Doğru cevap **hard**.
:::

:::soru{cevap="B"}
The new law is ---- opposed by environmental groups.

- A) strong
- B) strongly
- C) strength
- D) stronger
- E) strongest

---

1. **Opposed** bir participle. Participle’ı tanımlayan sözcük zarf olmalı.
2. “Strongly opposed” doğal bir eşleşme.
3. Strong sıfat, strength isim. Stronger ve strongest karşılaştırma yapar. Doğru cevap **strongly**.
:::

:::soru{cevap="B"}
They have ---- discussed the plan twice, but they still haven’t made a decision.

- A) yet
- B) already
- C) ever
- D) since
- E) lately

---

1. Olumlu cümle ve “twice” ile sayılan bir geçmiş. Yan cümlede ise “still haven’t” karşıtlığı var.
2. Olumlu cümlede “zaten” anlamı **already** ile verilir.
3. Yet olumsuz ve soru cümlelerinde kullanılır. Ever sorularda, since başlangıç noktası, lately “son zamanlarda” anlamı verir ve bu cümleyi doğal kılmaz. Doğru cevap **already**.
:::

:::soru{cevap="C"}
---- had the match started when it began to rain.

- A) Just
- B) Almost
- C) Hardly
- D) Nearly
- E) Seldom

---

1. Cümle yardımcı fiil önde (**had** the match started) ve ardından **when** geliyor. Bu devrik kalıp.
2. “Hardly had ... when ...” kalıbı: biri biter bitmez ötekinin başlaması.
3. Just ve Almost devrik yapı kurmaz. Nearly anlam kurmaz. Seldom “nadiren” anlamı verir ve when ile uyuşmaz. Doğru cevap **Hardly**.
:::

:::soru{cevap="E"}
Of all the candidates, she answered the questions ----.

- A) most clear
- B) more clear
- C) clearer
- D) the more clearly
- E) the most clearly

---

1. “Of all the candidates” **en üstünlük** için bir grup belirtiyor.
2. Zarfın en üstünlüğü: **the most clearly** (uzun zarf, most).
3. A ve B’de sıfat var. C sıfat karşılaştırması. D iki kişi arasında karşılaştırma yapar. Doğru cevap **the most clearly**.
:::

:::soru{cevap="A"}
The company has ---- improved its profits this year.

- A) significantly
- B) significant
- C) significance
- D) signify
- E) more significant

---

1. **Has improved** bir fiil. Fiili tanımlayan sözcük **zarf** olmalı ve yardımcı fiil ile participle arasına girer.
2. “Önemli ölçüde” anlamı **significantly**.
3. B ve E sıfat, C isim, D fiil. Doğru cevap **significantly**.
:::

:::soru{cevap="D"}
The problem is ---- understood by the public.

- A) poor
- B) widen
- C) hard
- D) poorly
- E) widest

---

1. **Understood** bir participle. Onu tanımlayan **zarf** gerekir.
2. “Poorly understood” (yeterince anlaşılmamış) doğal bir eşleşme.
3. Poor sıfat, widen fiil, hard burada sıfat ya da zarf anlamı kurmaz, widest en üstünlük sıfatı. Doğru cevap **poorly**.
:::

:::soru{cevap="C"}
---- , the new policy was a success: costs fell and satisfaction rose.

- A) Hardly
- B) Rarely
- C) Overall
- D) Nearly
- E) Barely

---

1. Boşluk cümle başında ve virgülden önce. Bir **cümle zarfı** gerekli.
2. İki olumlu gelişmeden sonra genel bir değerlendirme: **Overall**.
3. Hardly, Rarely ve Barely olumsuz anlam verir ve başta devrik yapı ister. Nearly anlam kurmaz. Doğru cevap **Overall**.
:::

:::ipucu{baslik="İpucu"}
Zarf sorusunda **önce boşluktan sonraki sözcüğe** bak. Participle ya da sıfat ise derece zarfı, fiil ise tarz ya da derece zarfı, boşluk cümle başındaysa cümle zarfı arıyorsun.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “She speaks English ----.” (good mu well mi?) => well.
2. “He h---- ever visits us.” (neredeyse hiç, h ile başlar) => hardly.
3. “The book is ---- used.” (yaygın) => widely.
4. “The effects are not t---- understood.” (iyice, t ile başlar) => thoroughly.
5. “They differ ---- .” (hafifçe) => slightly.
6. “---- , the plan seemed easy.” (başlangıçta) => Initially.
7. “They haven’t decided ---- .” (henüz) => yet.
8. “Never ---- I seen such a thing.” (have mi I have mi?) => have (Never have I seen).
9. “I don’t like coffee ----.” (de, olumsuz) => either.
10. “It is difficult to say e---- when it happened.” (tam olarak, e ile başlar) => exactly.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 33, false from public.topics where subject_id = 'ydt-dil' and name = 'Adverbs';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

İsim cümlecikleri (noun clauses), bir cümlenin içinde **isim görevi** gören cümleciklerdir: özne, nesne ya da yüklem tamlayıcısı olurlar. “I know **that he is right**”, “**What she said** surprised us”, “I wonder **whether he agrees**” cümlelerinde koyu yazılan kısımlar birer isim cümleciğidir. YDT’de dilbilgisi bölümünde ayrı bir soru olarak çıkmaz, ama okuma parçalarında, cümle tamamlama seçeneklerinde ve çeviri sorularında sürekli karşına çıkar. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. That, wh- (what, who, where, when, why, how), whether ve if ile başlayan isim cümleciklerini tanımak.
2. Dolaylı soru cümlesinin kelime sırasını (özne + fiil) doğru kurmak.
3. Whether ile if arasındaki farkı bilmek.
4. What ile that arasındaki farkı bilmek.
5. It is clear that, the fact that, the problem is that gibi sık kalıpları kullanmak.
6. Suggest, demand, insist gibi fiillerden sonra gelen yapıyı (that + V1) tanımak.
:::

:::ipucu{baslik="Sınavda bu konu"}
İsim cümleciği bulunan bir cümlede **ana fiili** bulmak çok önemlidir. İkinci bir fiil (cümleciğin fiili) varsa, onu ana fiilden ayır. Dolaylı sorularda **özne + fiil** sırasını koru: “I wonder where **she lives**”, “where does she live” değil.
:::

## 1. YDT’de isim cümleciği nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki soruların incelenmesine dayanıyor. 2018-2025 arası 80 dilbilgisi sorusunun hiçbirinde doğrudan isim cümleciği sorulmadı. Ama kitaptaki vocabulary, grammar, cloze, sentence completion ve paragraph comprehension bölümlerinin metninde bu yapılar yoğun biçimde geçiyor. İncelenen metinde:

İncelenen metinde suggest, show, indicate, believe, claim, argue, find gibi fiillerden sonra that cümleciği yaklaşık 30 kez geçti. Bunların çoğu “göstermek” anlamında ve normal zamanla kullanılmış (studies suggest that, research shows that). Demand, insist, require + that + V1 kalıbı incelenen metinde geçmedi. Whether ve what büyük ölçüde seçeneklerde ve soru köklerinde yer aldı, bu yüzden sayıları isim cümleciği sıklığı için güvenilir bir ölçü değil.

:::neden-sonuc
- Bilimsel metinlerde sonuç aktarımı that ile yapılıyor (research shows that, studies suggest that) => That cümleciğini tanımak, okumayı hızlandırır.
- Suggest ve indicate çoğunlukla “göstermek” anlamında geçti => Bu anlamda that cümleciğinde fiil normal zaman alır.
- Doğrudan dilbilgisi sorusu yok => Bu konu çeviri ve cümle tamamlama sorularında dolaylı sınanıyor.
:::

## 2. That cümlecikleri

**That**, bir olguyu ya da bilgiyi aktarır. Ana fiil bir bilgi, düşünce ya da bildirme anlamı taşıyorsa that ile bağlanır.

| Görev | Örnek |
| --- | --- |
| Nesne | Research **shows that** sleep improves memory. |
| Özne | **That he failed** surprised everyone. (resmî) |
| Sıfattan sonra | I am **sure that** he will come. |
| İsimden sonra (fact, idea, claim, belief) | **The idea that** the Earth is flat is wrong. |
| Yüklem tamamlayıcı | **The problem is that** the data were incorrect. |

### That’i atma

Nesne konumundaki that çoğu zaman **atılabilir**: “She said (that) she was tired.” Sıfattan sonra da atılabilir: “I’m sure (that) he will come.” Ama özne olan that atılmaz: “That he failed surprised us.”

### That cümleciği alan fiiller

say, tell sb, think, believe, know, realise, find, show, suggest, indicate, claim, argue, report, explain, decide, discover, prove, mention, admit, deny, hope, expect, agree, promise.

### Sıfat + that

Kişi öznesiyle: sure, certain, aware, afraid, glad, sorry, surprised, pleased (I am sure that ...). It öznesiyle: clear, obvious, true, likely, important, essential, necessary (It is clear that ...).

### İsim + that

fact, idea, belief, claim, assumption, possibility, rumour, evidence, hope, news.

“**The fact that** the economy is growing” gibi bir yapıda that ismi açıklar ve atılmaz.

## 3. Wh- cümlecikleri

Soru sözcüğü ile başlayan isim cümlecikleridir. **Soru cümlesi değil**, normal cümle kelime sırasına sahiptir.

| Soru sözcüğü | Örnek |
| --- | --- |
| what | **What** she said surprised us. |
| who | I don’t know **who** called. |
| whom | I wonder **whom** she invited. |
| which | Tell me **which** you prefer. |
| where | He asked **where** the museum was. |
| when | She didn’t say **when** she would arrive. |
| why | Nobody knows **why** he left. |
| how | I wonder **how** they did it. |
| how many, how much, how long | She asked **how long** it would take. |

### Dolaylı soru: kelime sırası

Doğrudan soru: “Where **does she live**?”
Dolaylı soru: “I wonder where **she lives**.”

Kurallar:

- Soru sözcüğünden sonra **özne + fiil** gelir.
- Do / does / did kullanılmaz.
- Soru işareti kullanılmaz (ana cümle soru değilse).

| Yanlış | Doğru |
| --- | --- |
| I wonder where does she live. | I wonder where **she lives**. |
| He asked what was the problem. | He asked what **the problem was**. |
| Can you tell me how much does it cost? | Can you tell me how much **it costs**? |

:::baglanti
Soru sözcüğü **özne** olduğunda sıra zaten özne + fiil: “I don’t know **who called**.” (Who özne). Ama nesne olduğunda özne araya girer: “I don’t know **whom she called**.”
:::

## 4. Whether ve if

Evet / hayır sorularının dolaylı hâlinde **whether** ya da **if** kullanılır.

| Kalıp | Örnek |
| --- | --- |
| whether | I wonder **whether** he agrees. |
| if | I wonder **if** he agrees. |
| whether … or not | I don’t know **whether** he agrees **or not**. |
| whether to V1 | She hasn’t decided **whether to postpone** the vote. |

### Whether’ı zorunlu kılan durumlar

| Durum | Örnek |
| --- | --- |
| Edattan sonra | We talked **about whether** to move. |
| To V1 ile | I don’t know **whether to** accept. |
| Öznede | **Whether** he agrees is not clear. |
| Whether … or not (or not hemen sonra) | Whether **or not** he agrees. |

If yalnızca **nesne** konumunda kullanılır. **If**, “eğer” anlamıyla karışabileceği için akademik metinlerde whether tercih edilir.

## 5. What ve that

| What | That |
| --- | --- |
| isim cümleciği başlatır (the thing which) | bilgi aktarır |
| öncesinde isim yok | öncesinde fiil, sıfat ya da isim olabilir |
| **What** he said was true. | He said **that** it was true. |

**What**, “the thing that” anlamındadır ve kendi içinde bir isim barındırır. Bu yüzden “everything what” ya da “the thing what” yanlıştır.

**What** ve **that** özne konumunda da kullanılabilir:

- **What** the team needs most is time.
- **That** the team needs time is obvious.

## 6. -ever cümlecikleri

| Sözcük | Anlam | Örnek |
| --- | --- | --- |
| whatever | her ne | Do **whatever** you like. |
| whoever | her kim | **Whoever** wants to join must register. |
| whichever | hangisi | Take **whichever** you want. |
| whenever | her ne zaman | Call me **whenever** you need help. |
| wherever | nerede olursa | Sit **wherever** you like. |
| however | ne kadar | **However** hard he tries, he fails. |

## 7. It ile başlayan kalıplar

Uzun bir isim cümleciği özne olduğunda cümle **it** ile başlatılır.

| Kalıp | Örnek |
| --- | --- |
| It + be + sıfat + that | **It is clear that** prices will rise. |
| It + be + V3 + that (edilgen) | **It is believed that** the city was destroyed. |
| It + seems / appears + that | **It seems that** nobody noticed. |
| It + be + isim + that | **It is a pity that** he left. |
| It + matters + that | **It matters that** every vote is counted. |

## 8. That cümleciğinde yapı: suggest, demand, insist

Bazı fiiller **öneri, talep, zorunluluk** anlamı taşır. Bunlardan sonraki that cümleciğinde fiil **V1** (ya da should + V1) olur. Buna subjunctive denir.

:::baglanti
**Dikkat:** suggest “önermek” anlamında subjunctive alır (She suggested that he **take** a break) ama “göstermek” anlamında normal zaman alır (The data suggest that prices **rise**). Insist de “ısrar etmek, talep etmek” anlamında V1, “iddia etmek” anlamında normal zaman alır (He insisted that he **was** innocent). Fiilin anlamına bak.
:::

| Fiil | Örnek |
| --- | --- |
| suggest | She suggested that he **take** a break. |
| recommend | The doctor recommended that she **rest**. |
| demand | The union demanded that the company **reduce** working hours. |
| insist | He insisted that the report **be** finished. |
| require | The law requires that every driver **wear** a seat belt. |
| propose, request, advise, ask, order | |

Sıfatlarla da: **essential, vital, important, necessary, crucial, advisable** + that + V1.

- It is essential that every student **submit** the form.

:::ipucu
Bu yapıda fiil **kişiye göre çekimlenmez** ve zaman kuralına uymaz. Talep anlamındaki suggest ile “She suggested that he **takes**” yerine **take** (ya da should take) gelir. Olumsuz: “She suggested that he **not** go.” Edilgen: “It is important that the form **be** signed.”
:::

## 9. Zaman uyumu

Dolaylı anlatımda ve geçmiş zamanlı anlatıda, ana fiil geçmişse isim cümleciğinde de bir adım geriye gidilir (reported speech).

| Doğrudan | Dolaylı |
| --- | --- |
| He said, “I am tired.” | He said that he **was** tired. |
| She said, “I will come.” | She said that she **would** come. |
| They said, “We have finished.” | They said that they **had** finished. |

Genel gerçekler için zaman değişmeyebilir: “She said that water **boils** at 100 degrees.”

## 10. Çözüm yolu

1. **Ana fiili bul.** Kim ne yapıyor? (shows, wonder, asked, is)
2. **İkinci cümlecik ne tür?** Bilgi mi (that), soru mu (wh-), evet-hayır mı (whether)?
3. **Sözcük sırası.** Özne + fiil mi?
4. **Bağlaç seç.** That bilgi, whether seçenek, what “şey”.
5. **Zaman.** Dolaylı anlatımda ana fiil geçmişse bir adım geri.
6. **Subjunctive.** Suggest, demand, insist, require gibi bir fiil ya da essential, vital gibi bir sıfat var mı?

## Aklında kalsın

- **That** bilgi aktarır, nesne konumunda ve sıfattan sonra atılabilir.
- **Wh- cümleciğinde özne + fiil sırası**. Do / does / did yok.
- **Whether** seçeneği anlatır, to V1 ile ve edattan sonra zorunludur. **If** yalnızca nesne konumunda.
- **What** = the thing that. Öncesinde isim olmaz.
- **The problem is that**, **The reason is that**, **The fact that**: that ile.
- **suggest, demand, insist, recommend, require** + that + **V1** (should + V1).
- **It is essential / vital / important that** + V1.
- **Whoever, whatever, whenever, wherever, however**: her kim, her ne.
- Dolaylı anlatımda ana fiil geçmişse isim cümleciği de bir adım geriye gider.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| I wonder where does she live | **where she lives** |
| He asked what was the problem | **what the problem was** |
| The problem is because | **The problem is that** |
| The reason is because | **The reason is that** |
| I don’t know if to go | **whether to go** |
| She said me that | **She told me that** ya da She said that |
| Everything what he said | **Everything that he said** |
| She suggested that he takes (öneri anlamı) | **that he take** (ya da should take) |
| It is important that he comes | resmî dilde **that he come** ya da should come (comes konuşmada duyulur) |
| Whatever do you want | **Do whatever you want** |
| That he failed was obvious ve It was obvious that he failed | İkisi de doğru. İkincisi daha yaygın. |
| I don’t know what to do ve I don’t know what I should do | İkisi de doğru. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var.

:::soru{cevap="E"}
The manager asked the staff ----.

- A) when would the report be ready
- B) when was the report ready
- C) when the report ready would be
- D) that when the report would be ready
- E) when the report would be ready

---

1. **Dolaylı soru** cümlesi: asked the staff + soru sözcüğü. Dolaylı soruda kelime sırası **özne + fiil** olur, yardımcı fiil öne geçmez.
2. “When the report would be ready” hem sırası doğru hem de geçmiş zamanlı ana fiille uyumlu.
3. A ve B doğrudan soru sırasını koruyor. C’de fiil sırası bozuk. D’de that ile when bir arada kullanılmaz. Doğru cevap **when the report would be ready**.
:::

:::soru{cevap="B"}
Many scientists support the idea ---- the universe is still expanding.

- A) what
- B) that
- C) which
- D) whether
- E) how

---

1. **The idea** bir isim ve sonrasında onun içeriğini açıklayan bir cümlecik geliyor: “the idea (that) ...”.
2. Fikrin içeriğini anlatan, isimden sonra gelen bağlaç **that**.
3. What isimden sonra gelmez. Which sıfat cümleciği başlatır ve ismi tanımlar, içeriğini açıklamaz. Whether ve how anlam kurmaz. Doğru cevap **that**.
:::

:::soru{cevap="A"}
The committee has not decided ---- to postpone the vote or to hold it next week.

- A) whether
- B) if
- C) that
- D) what
- E) which

---

1. Cümlede iki seçenek var: ertelemek ya da önümüzdeki hafta yapmak. Seçenek anlatan bağlaç **whether**.
2. **Whether + to V1** kalıbında if kullanılmaz: whether to postpone.
3. That, what ve which bu yapıya uymaz. Doğru cevap **whether**.
:::

:::soru{cevap="A"}
The union demanded that the company ---- the working hours.

- A) reduce
- B) reduces
- C) reduced
- D) is reducing
- E) has reduced

---

1. **demand** bir talep fiilidir. Talep fiilinden sonra gelen that cümleciğinde fiil **yalın hâlde (V1)** kullanılır. Buna subjunctive denir.
2. Özne **the company** üçüncü tekil kişi olsa da fiil -s almaz: reduce.
3. B, C, D ve E zamanlı fiillerdir ve bu yapıya uymaz. Doğru cevap **reduce**.
:::

:::soru{cevap="D"}
---- the team needs most is more time to prepare.

- A) That
- B) Which
- C) How
- D) What
- E) Whether

---

1. Cümlenin öznesi bir **isim cümleciği**: “takımın en çok ihtiyaç duyduğu şey”. Bu anlam **“the thing that”** demektir.
2. “The thing that” anlamı veren, isimsiz isim cümleciği başlatan sözcük **what**.
3. That anlam kurmaz çünkü “ihtiyaç duyulan şey” cümlede eksik kalır. Which, how ve whether bu cümlede çalışmaz. Doğru cevap **What**.
:::

:::soru{cevap="C"}
The problem is ---- the data were collected incorrectly.

- A) what
- B) which
- C) that
- D) why
- E) because

---

1. Cümle “The problem is ...” ile başlıyor. “Sorun şu ki ...” anlamı bir **bilgi** aktarıyor.
2. Bilgi aktaran bağlaç **that**.
3. “The problem is because” konuşmada duyulur ama standart değildir. Because bir nedeni açıklar, burada ise sorunun içeriği söyleniyor. What, which ve why bu yerde anlam kurmaz. Doğru cevap **that**.
:::

:::soru{cevap="C"}
---- wants to join the project must register before Friday.

- A) Whatever
- B) Whichever
- C) Whoever
- D) Wherever
- E) However

---

1. Cümlede özne bir **kişi** ve “katılmak isteyen herkes” anlamı var.
2. “Her kim” anlamını veren sözcük **whoever**.
3. Whatever şey, whichever seçenekli şey, wherever yer, however biçim bildirir. Doğru cevap **Whoever**.
:::

:::soru{cevap="B"}
It is widely accepted ---- the climate ---- warmer over the last century.

- A) what / has become
- B) that / has become
- C) that / was becoming
- D) whether / became
- E) which / is becoming

---

1. “It is widely accepted ...” kalıbı bir olguyu aktarır: **that** cümleciği.
2. **Over the last century** şimdiye kadar süren bir dönemi gösterir. Present Perfect: **has become**.
3. A’da what, D’de whether, E’de which bu kalıba uymaz. C’de zaman uyumsuz. Doğru cevap **that / has become**.
:::

:::ipucu{baslik="İpucu"}
İsim cümleciği sorusunda **ana fiilden hemen sonraki sözcüğe** bak. Bilgi aktarıyorsa that, soru aktarıyorsa wh-, seçenek varsa whether. Sonra kelime sırasını kontrol et.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “I wonder where ---- .” (she lives mi does she live mi?) => she lives.
2. “She asked me ---- I could help.” (evet-hayır dolaylı soru) => if (ya da whether).
3. “I don’t know ---- to do.” (soru sözcüğü) => what.
4. “The fact ---- he left surprised us.” => that.
5. “---- you said was true.” (şey) => What.
6. “The doctor recommended that she ---- rest.” (rest, subjunctive) => rest (yalın fiil).
7. “It is important that the form ---- signed.” (sign, subjunctive edilgen) => be.
8. “---- he arrives, call me.” (her ne zaman) => Whenever.
9. “She said that she ---- tired.” (ana fiil geçmiş, am) => was.
10. “She asked me ---- time the train left.” (hangi) => what.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 32, false from public.topics where subject_id = 'ydt-dil' and name = 'Noun Clauses';

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Edat (preposition) YDT’de en çok soru çıkan dilbilgisi konusudur. Dilbilgisi bölümündeki 10 sorunun üçü her yıl edattır: iki soru **edat çifti**, bir soru **anlam edatı**. Üstüne cloze testteki 40 boşluktan yaklaşık 16’sı da edat ya da anlam edatıdır. Edatın kuralı yoktur, **kalıbı** vardır. Bu yüzden bu metin kuraldan çok, sınavda gerçekten karşına çıkan kalıpları toplar. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. At, on, in, by, until, during, through, across, along, between, among gibi temel edatları anlamına göre ayırt etmek.
2. Fiil, sıfat ve isimlerle birlikte kullanılan edatları (dependent prepositions) kalıp olarak tanımak.
3. Because of, due to, thanks to, despite, in spite of, rather than, in terms of gibi anlam edatlarını cümledeki mantığa göre seçmek.
4. Edat ile bağlaç arasındaki farkı (despite ile although, because of ile because) bilmek.
5. Edattan sonra gelen yapıyı (isim, V-ing, to’nun iki görevi) doğru kurmak.
6. İki boşluklu edat çifti sorusunu üç adımda çözmek.
:::

:::ipucu{baslik="Sınavda bu konu"}
Sınavın 9. ve 10. sorusu (dilbilgisi bölümünün 4. ve 5. maddesi) **edat çifti**, 15. soru (10. madde) **anlam edatı** sorusudur. 2018’den 2025’e her yıl böyle. Boşluğu doldurmadan önce edatın hangi sözcüğe bağlı olduğuna bak: önündeki fiil, sıfat ya da isim edatı belirler. Anlam edatlarında ise cümlenin mantığına bak: sebep mi, karşıtlık mı, tercih mi?
:::

## 1. YDT’de edat soruları nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025” kitabındaki 80 dilbilgisi sorusunun tek tek incelenmesine dayanıyor. Sınıflandırma kitaptaki sorulara bakılarak yapıldı, doğru seçenekler tek tek çözülerek belirlendi. Sayılar bu incelemenin sonucudur.

| Soru | Ne soruluyor | 8 yılda toplam |
| --- | --- | --- |
| 9. soru | İki boşluklu edat çifti | 8 |
| 10. soru | İki boşluklu edat çifti | 8 |
| 15. soru | Anlam edatı ya da edat grubu (due to, despite gibi) | 8 |

Toplam 24 soru. 15. sorunun cevapları sekiz yılda şunlardı: **thanks to** (2018), **despite** (2019), **rather than** (2020), **as well as** (2021), **due to** (2022), **because of** (2023), **due to** (2024), **thanks to** (2025). Yani sekiz yılın altısında 15. soru bir **sebep** ya da **karşıtlık**, ikisinde **tercih** ve **ekleme** sorusuydu. Bu ailelerin hepsini bilen öğrenci o soruyu hızlı çözer.

:::neden-sonuc
- 24 edat sorusunun 16’sı iki boşluklu çift => Bir boşluğu bilmek yetmez, ikisini de kalıba oturtmak gerekir.
- Çiftlerde boşluklar farklı türdedir => Biri çoğu zaman fiil ya da sıfat kalıbı (similar to, valued for), öteki yer ya da zaman edatıdır (along the coast, between neurons).
- 15. sorunun cevabı sekiz yılda altı farklı ifade => Tek bir ifadeyi ezberlemek yetmez, sebep, karşıtlık, tercih ve ekleme ailelerini bilmek gerekir.
- Bu edatlar cloze testte de çıkıyor => Cloze’daki edat boşlukları da aynı kalıplarla çözülür.
:::

### Çıkmış sorularda doğru çıkan çiftler

Aşağıdaki kalıplar 2018-2025 arası dilbilgisi sorularında doğru seçenekte yer aldı. Soru metnini vermiyorum, yalnızca kalıbı veriyorum. Her birini kendi cümlenle kurmayı dene.

| Kalıp | Anlamı |
| --- | --- |
| children with secure attachments, beyond their family | güvenli bağları olan çocuklar, ailelerinin ötesinde |
| within ethical guidelines, benefits for humans | etik ilkeler içinde, insanlar için yararlar |
| following World War II, during the fighting | savaştan sonra, çatışma sırasında |
| by building pathways, between neurons | yol kurarak, nöronlar arasında |
| similar to yoghurt, valued for its effects | yoğurda benzer, etkileri için değer verilen |
| at its core, used by the brain | özünde, beyin tarafından kullanılan |
| in the media, kind to the environment | medyada, çevreye karşı nazik |
| along the coast, between Tokyo and Kyushu | kıyı boyunca, Tokyo ile Kyushu arasında |
| equate to, largely from drinks | eşdeğer olmak, çoğunlukla içeceklerden |
| through photosynthesis, on land | fotosentez yoluyla, karada |
| the basis for, woven from fibres | için temel, liflerden dokunmuş |
| hostile towards, cooperation among | -e karşı düşmanca, aralarında işbirliği |
| with high reliability, warnings to | yüksek güvenilirlikle, -e uyarılar |

## 2. Edat nedir, ne ile kullanılır

Edat, bir isim ya da zamirin cümledeki **yerini, zamanını, aracını ya da ilişkisini** gösterir. Edattan sonra çoğu zaman bir **isim öbeği, zamir ya da V-ing** gelir. Fiilin yalın hâli genellikle gelmez (istisna: except, but, rather than gibi birkaç ifade).

- She is good **at** math. (isim)
- He left without **saying** goodbye. (V-ing)
- This is a gift **for** you. (zamir)

:::ipucu
Edattan sonra boşluk varsa ve seçeneklerde fiil formu varsa **V-ing** ara. “She insisted on **to go**” yanlıştır, “She insisted on **going**” doğrudur.
:::

### To’nun iki yüzü

İngilizcede **to** bazen mastar (infinitive) işaretidir, bazen edattır. Edat olan to’dan sonra V-ing gelir.

| to’nun görevi | Sonrası | Örnek |
| --- | --- | --- |
| Mastar işareti | V1 | He wants **to leave**. |
| Edat | isim ya da V-ing | I look forward **to meeting** you. |

Sonrasında V-ing alan to’lu kalıplar: look forward to, be used to, get used to, object to, be committed to, be devoted to, in addition to, with a view to, contribute to, admit to, confess to.

## 3. Zaman edatları

### at, on, in

| Edat | Kullanım | Örnek |
| --- | --- | --- |
| at | saat, an, kısa dönem | at 6 o’clock, at noon, at night, at the weekend (İngiliz kullanımı) |
| on | gün ve tarih | on Monday, on 5 May, on my birthday |
| in | ay, yıl, mevsim, yüzyıl, günün bölümleri | in May, in 1999, in winter, in the 20th century, in the morning |

“In the morning” der ama “at night” der. “On Monday morning” gibi belirli bir gün söz konusuysa on kullanılır.

### for, since, during, throughout, over

| Edat | Ne gösterir | Örnek |
| --- | --- | --- |
| for | süre | for three years |
| since | başlangıç noktası | since 2020 |
| during | bir olayın ya da dönemin içinde | during the war, during the meeting |
| throughout | baştan sona kesintisiz | throughout the year |
| over | belli bir dönem boyunca | over the past decade |

“During” ile “for” karışır: during sonrasında **olay ya da dönem** adı gelir (during the summer), for sonrasında **süre** gelir (for two months).

### by, until, within, before, after

| Edat | Anlam | Örnek |
| --- | --- | --- |
| by | en geç o zamana kadar (son tarih) | Finish it **by** Friday. |
| until, till | o ana kadar sürüp giden durum | He waited **until** Friday. |
| within | süre içinde | within two weeks |
| following | -in ardından (resmî, after’dan daha yazı dili) | Following the war, ... |
| prior to | -den önce | prior to the meeting |

:::ipucu{baslik="by ve until"}
Eylem **bir kerede biter** ve son tarih verilmişse **by**: “Submit the report by Monday.” Eylem **o ana kadar sürüyorsa** until: “The shop stays open until midnight.”
:::

## 4. Yer ve yön edatları

### at, in, on

| Edat | Kullanım | Örnek |
| --- | --- | --- |
| at | nokta, belirli yer | at the station, at school, at the top |
| in | içinde, kapalı alan, şehir ve ülke | in the box, in Ankara, in the media |
| on | yüzeyde, hat üzerinde | on the table, on the coast, on land |

### between ve among

- **between**: iki ya da belirli sayıda ayrı şey arasında: between Tokyo and Kyushu, between neurons.
- **among**: belirsiz, çok sayıda şey ya da kişi arasında: among the students, cooperation among communities.

### Hareket ve doğrultu

| Edat | Anlam | Örnek |
| --- | --- | --- |
| across | bir yüzeyin bir ucundan öbürüne | across the desert, across the river |
| along | bir çizgi boyunca | along the coast |
| through | bir şeyin içinden geçerek | through the tunnel, through photosynthesis |
| around | çevresinde, civarında | around the world, around 700 species |
| over | üzerinden | over the bridge |
| beyond | ötesinde | beyond the mountains, beyond one’s family |
| towards | doğru | towards the city, hostile towards strangers |
| into | içeri | into the room |
| out of | dışarı | out of the room |
| within | sınırlar içinde | within the guidelines |
| beneath, below | altında | beneath the surface |

:::baglanti
“Through” iki farklı anlamda da sınavda çıkıyor. Yer anlamı: tünelden geçerek. Araç anlamı: fotosentez yoluyla, deneyim yoluyla. İkincisinde “by means of” anlamı vardır.
:::

## 5. Bağımlı edatlar

Bu bölüm sınavın can alıcı kısmı. Birçok sözcük **kendi edatıyla** birlikte öğrenilir. Edat çifti sorusunda iki boşluğun en az biri genelde böyle bir kalıptır.

### Fiil + edat

| Kalıp | Anlamı |
| --- | --- |
| depend on, rely on | -e bağlı olmak, güvenmek |
| consist of | -den oluşmak |
| result in | sonuçlanmak, yol açmak |
| result from, stem from, derive from | -den kaynaklanmak |
| lead to, contribute to | -e yol açmak, katkıda bulunmak |
| account for | oluşturmak, açıklamak |
| equate to | -e eşit olmak |
| compete with someone, compete for something | biriyle yarışmak, bir şey için yarışmak |
| benefit from | -den yararlanmak |
| suffer from | -den muzdarip olmak |
| focus on, concentrate on | odaklanmak |
| specialise in | -de uzmanlaşmak |
| participate in, take part in | katılmak |
| protect from, protect against | -den korumak |
| prevent from, stop from | engellemek |
| refer to | -e atıfta bulunmak |
| belong to | -e ait olmak |
| differ from | -den farklı olmak |
| apologise for, blame for | özür dilemek, suçlamak |
| accuse of, suspect of | suçlamak, şüphelenmek |
| credit someone with | bir başarıyı birine mal etmek |

### Sıfat + edat

| Kalıp | Anlamı |
| --- | --- |
| similar to | -e benzer |
| different from | -den farklı |
| famous for, known for, valued for | -le ünlü, -le tanınan, -le değer verilen |
| known as | olarak bilinen |
| responsible for | -den sorumlu |
| capable of | -e muktedir |
| aware of | -in farkında |
| dependent on | -e bağımlı |
| essential to, essential for | -e gerekli |
| vulnerable to | -e karşı savunmasız |
| sensitive to | -e duyarlı |
| resistant to | -e dirençli |
| adapted to | -e uyum sağlamış |
| kind to, hostile to ya da towards | -e karşı nazik, -e karşı düşmanca |
| eligible for | -e hak kazanan |
| (be) interested in | ile ilgilenen |
| good at, bad at | -de iyi, -de kötü |
| afraid of, proud of, tired of | korkan, gurur duyan, bıkmış |

### İsim + edat

| Kalıp | Anlamı |
| --- | --- |
| increase in, decrease in, rise in | -deki artış, azalış |
| demand for | -e olan talep |
| effect on, impact on, influence on | -e etki |
| reason for, basis for, need for | -in nedeni, temeli, ihtiyacı |
| cause of | -in nedeni |
| solution to, answer to | -in çözümü, cevabı |
| access to | -e erişim |
| attitude towards | -e karşı tutum |
| damage to | -e verilen zarar |
| benefits of, benefit to | -in yararları, -e yarar |
| difference between | arasındaki fark |
| relationship between, relationship with | arasındaki ilişki, biriyle ilişki |
| role in | -deki rol |
| interest in | -e ilgi |
| interference from | -den müdahale |

:::ipucu{baslik="Edat çifti sorusunda tuzak"}
Seçeneklerin çoğunda iki edattan biri doğrudur, öteki yanlıştır. Kalıbını **kesin** bildiğin boşluğa önce karar ver, sonra o edatı içermeyen seçenekleri ele. Beş seçenekten ikisi ya da üçü ilk adımda düşer.
:::

### Edat almayan fiiller

Türkçede “-i / -e / -den” ile kurulan bazı fiiller İngilizcede **edatsız** kullanılır. Edat eklemek sık yapılan bir hatadır.

| Fiil | Doğru | Yanlış |
| --- | --- | --- |
| discuss | discuss the plan | discuss about the plan |
| lack | lack experience | lack of experience (fiil olarak) |
| enter | enter the room | enter into the room |
| reach | reach the city | reach to the city |
| approach | approach the problem | approach to the problem (fiil olarak) |
| mention | mention the problem | mention about the problem |
| marry | marry someone | marry with someone |
| resemble | resemble his father | resemble to his father |
| attend | attend the meeting | attend to the meeting |
| answer | answer the question | answer to the question (fiil olarak) |

Ayrıca **arrive**, yer isminin büyüklüğüne göre edat alır: arrive **in** a city, arrive **at** a station. “Arrive to” kullanılmaz.

## 6. Sabit edatlı ifadeler

Bu ifadelerde edat **değişmez**, kuralı yoktur, ezberlenir.

| İfade | Anlamı |
| --- | --- |
| at risk, in danger | risk altında, tehlikede |
| at its core | özünde |
| on average | ortalama olarak |
| by chance, by accident | tesadüfen |
| by means of | aracılığıyla |
| in the media | medyada |
| in charge of | sorumlu, başında |
| in favour of | lehine |
| on behalf of | adına |
| on the whole | genel olarak |
| in particular | özellikle |
| in general | genel olarak |
| in contrast to | tersine |
| in addition to | ek olarak |
| at the end of, in the end | sonunda (zaman noktası), sonunda (sonuç olarak) |
| in time, on time | zamanında yetişerek, tam vaktinde |
| under pressure | baskı altında |
| out of control | kontrolden çıkmış |

## 7. Anlam edatları: sebep, karşıtlık, tercih ve diğerleri

15. soru bu bölümden gelir. Önce **mantık ilişkisini** bul, sonra ifadeye karar ver.

### Sebep

| İfade | Not | Örnek |
| --- | --- | --- |
| because of | sebep | Flights were cancelled **because of** the storm. |
| due to | sebep, resmî yazı | Prices rose **due to** the shortage. |
| owing to | sebep, resmî yazı | Owing to the delay, ... |
| thanks to | **olumlu** sebep | **Thanks to** the new method, costs fell. |
| as a result of, as a consequence of | sonucunda | as a result of the war |

“Thanks to” sebep bildirir ama sonuç **olumlu** olmalıdır. Olumsuz sonuçta because of ya da due to kullanılır. Sınavda “thanks to” çoğunlukla başarı, artış, kazanım anlatan cümlelerde doğrudur.

### Karşıtlık

| İfade | Not | Örnek |
| --- | --- | --- |
| despite, in spite of | **isim ya da V-ing** alır | **Despite** the rain, we went out. |
| although, though, even though | **cümle** alır | **Although** it rained, we went out. |
| regardless of | -e bakmaksızın | regardless of age |
| contrary to | -in aksine | contrary to expectations |
| in contrast to, as opposed to | tersine | in contrast to his brother |
| unlike | -in aksine, ... gibi değil | unlike his father |

:::ipucu{baslik="despite ile although"}
“Despite the fact that” kalıbından sonra cümle gelebilir: Despite **the fact that** it rained, we went out. Yoksa despite ve in spite of’tan sonra cümle gelmez. “Despite it rained” yanlıştır.
:::

### Tercih ve ekleme

| İfade | Anlam | Örnek |
| --- | --- | --- |
| rather than | -mektense, yerine | Choose quality **rather than** quantity. |
| instead of | yerine | tea instead of coffee |
| in addition to, besides, as well as | ek olarak | In addition to math, she studies physics. |
| apart from | -in dışında ya da -e ek olarak | Apart from Tom, everyone came. |
| except for, with the exception of | -in dışında | everyone except for Tom |

“Rather than” iki öğeyi **aynı yapıda** karşılaştırır. Biri isimse öteki isim, biri V-ing ise öteki V-ing olur.

### Amaç, ölçüt, araç

| İfade | Anlam | Örnek |
| --- | --- | --- |
| in terms of | açısından | in terms of cost |
| with regard to, in relation to | ile ilgili olarak | with regard to safety |
| according to | -e göre | according to the report |
| in line with | ile uyumlu | in line with the plan |
| by means of | aracılığıyla | by means of a drone |
| with the aim of, for the purpose of, in order to | amacıyla | with the aim of saving energy |
| in pursuit of | peşinde | in pursuit of knowledge |
| in case of | -mesi durumunda (isim alır) | in case of fire |
| along with, together with | ile birlikte | along with his friends |
| such as, like | örneğin, gibi | fruits such as apples |

:::baglanti
“In case of” isim, “in case” cümle alır. “In case of fire, use the stairs.” ile “Take an umbrella in case it rains.” cümlelerini karşılaştır. Bu fark hem edat hem bağlaç konusunda çıkabilir.
:::

## 8. Edat mı bağlaç mı

Anlamı yakın olan edat ve bağlaç ikililerinde **sonrasında ne geldiğine** bak.

| Edat (isim ya da V-ing alır) | Bağlaç (cümle alır) | Anlam |
| --- | --- | --- |
| because of | because | -dığı için |
| due to, owing to | since, as | -dığı için |
| despite, in spite of | although, though, even though | -e rağmen |
| during | while | sırasında |
| in case of | in case | -mesi durumunda |

Soruda boşluktan sonra **isim** varsa (the storm, their durability) sol sütundan, **özne + fiil** varsa sağ sütundan seç.

## 9. İki boşluklu edat sorusunu çözme yolu

1. **Bağlı olduğu sözcüğü bul.** Boşluktan önceki fiil, sıfat ya da isim hangisi? (benefits **to**, valued **for**, similar **to**).
2. **Kesin bildiğin boşluğa karar ver.** Bir edat kalıbı hemen gelirse o edatı taşıyan seçeneklere bak, ötekileri ele.
3. **İkinci boşluğu anlamla doğrula.** Kalan seçeneklerde ikinci boşluğa anlamı uyanı seç. Yer ve zaman edatlarında “nerede, ne zaman, ne yoluyla?” sorusunu sor.

:::ipucu{baslik="Emin olamadığında"}
Kalıbı bilmiyorsan Türkçeye çevirip yorumlama. İngilizce edatlar Türkçe ekle birebir örtüşmez. Kalıbı kulağına tanıdık gelen seçeneği seç. Kulak, okuduğun metinlerle gelişir. Gerçek metin okumak bu yüzden önemli.
:::

## Aklında kalsın

- Edattan sonra **isim, zamir ya da V-ing** gelir. Fiilin yalın hâli gelmez.
- **to** hem mastar hem edattır. Edat olan to’dan sonra V-ing gelir (look forward to meeting).
- **by**: son tarih. **until**: sürüp giden durum. **for**: süre. **since**: başlangıç. **during**: dönem ya da olay.
- **between**: belirli sayıda iki ya da daha fazla öğe. **among**: belirsiz kalabalık.
- Bağımlı edatlar kalıp olarak öğrenilir: benefit from, depend on, similar to, valued for, access to, increase in.
- **thanks to**: olumlu sebep. **due to, because of**: sebep. **despite, in spite of**: karşıtlık, isim alır.
- **rather than**: tercih ve karşılaştırma, aynı yapıdaki iki öğeyi bağlar.
- **in case of**: isim alır. **in case**: cümle alır.

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| during ve for | during + dönem ya da olay (during the war). for + süre (for three years). |
| by ve until | by: en geç o zamana kadar. until: o zamana kadar sürüp giden. |
| between ve among | between: belirli iki ya da birkaç öğe. among: kalabalık, belirsiz sayıda. |
| despite ve although | despite + isim ya da V-ing. although + özne + fiil. |
| because of ve because | because of + isim. because + özne + fiil. |
| thanks to ve due to | thanks to: olumlu sonucun nedeni. due to: sebep, olumlu da olabilir, daha resmî. |
| in case of ve in case | in case of + isim. in case + özne + fiil. |
| result in ve result from | result in: ... ile sonuçlanmak (sonuç). result from: ... den kaynaklanmak (neden). |
| similar to ve similar with | doğrusu **similar to**. |
| depend on ve depend of | doğrusu **depend on**. |
| rather than ve instead of | instead of bir şeyin yerine geçer. rather than iki seçeneği karşılaştırır, iki öğe aynı yapıda olur. |
| according to ve in terms of | according to: kaynak gösterir. in terms of: bir yönden, açıdan. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. Beş edat çifti sorusu ve üç anlam edatı sorusu yer alıyor.

:::soru{cevap="E"}
The exhibition, which opened ---- Monday, will remain open ---- the end of the month.

- A) in / by
- B) at / during
- C) on / by
- D) in / until
- E) on / until

---

1. Birinci boşlukta bir **gün adı** var. Gün adlarıyla **on** kullanılır, in ve at olmaz. A, B ve D elenir.
2. İkinci boşlukta sergi ayın sonuna kadar **açık kalmaya devam edecek**. Eylem bir kerede bitmiyor, sürüyor. Sürüp giden durumlarda **until** kullanılır. By son tarih anlamı verir ve “open by the end” anlamsızdır.
3. C seçeneği ilk boşlukta doğru, ikincide yanlış olduğu için tuzaktır. Doğru cevap **on / until**.
:::

:::soru{cevap="D"}
Scientists believe that the sudden increase ---- global temperatures is closely related ---- the rising levels of carbon dioxide.

- A) on / with
- B) of / for
- C) at / by
- D) in / to
- E) for / from

---

1. İsim + edat kalıbı: **increase in** (bir şeydeki artış). On, at ve for bu isimle kullanılmaz.
2. Sıfat + edat kalıbı: **related to** (-e bağlantılı).
3. İki kalıbı da taşıyan tek seçenek D. Standart kalıp “related to” olduğu için A’daki “related with” seçeneği tercih edilmez, ilk boşluk da yanlış. Doğru cevap **in / to**.
:::

:::soru{cevap="B"}
---- their long history of rivalry, the two companies agreed to cooperate on the new project.

- A) Thanks to
- B) Despite
- C) Because of
- D) Rather than
- E) Due to

---

1. Cümlede bir **karşıtlık** var: uzun rekabet geçmişi ile işbirliği kararı birbirine ters.
2. Boşluktan sonra **isim öbeği** (their long history of rivalry) geliyor, cümle değil. Bu yüzden although olmaz, **despite** gerekir.
3. Thanks to, because of ve due to sebep bildirir. Rekabet işbirliğinin sebebi olamaz. Rather than tercih bildirir ve anlam kurmaz. Doğru cevap **Despite**.
:::

:::soru{cevap="A"}
The new law is intended to protect small farmers ---- unfair competition, and it makes them eligible ---- financial support.

- A) from / for
- B) with / to
- C) of / about
- D) at / on
- E) in / by

---

1. **protect someone from** bir şey: korumak. With, of, at ve in bu fiille kullanılmaz.
2. **eligible for**: -e hak kazanmış. Eligible sonrasında fiil gelirse to kullanılır (eligible to vote), isim gelirse for gerekir.
3. Doğru cevap **from / for**.
:::

:::soru{cevap="B"}
The museum attracted twice as many visitors this year, ---- the free entry offered on weekends.

- A) in spite of
- B) thanks to
- C) instead of
- D) except for
- E) regardless of

---

1. Ziyaretçi sayısı **ikiye katlandı**, yani sonuç olumlu. Boşluk bu sonucun nedenini veriyor: hafta sonu ücretsiz giriş.
2. Olumlu bir sonucun nedenini **thanks to** verir.
3. In spite of karşıtlık, instead of tercih, except for istisna, regardless of “fark etmeksizin” anlamı verir ve hiçbiri bu sebep-sonuç ilişkisini kurmaz. Doğru cevap **thanks to**.
:::

:::soru{cevap="C"}
Several ancient trade routes ran ---- the desert and connected the coastal cities ---- the interior regions.

- A) among / of
- B) against / for
- C) across / with
- D) beneath / on
- E) beside / at

---

1. Ticaret yolları çölün bir ucundan öbürüne uzanıyor: **across the desert**. Among belirsiz bir kalabalık arasında, against karşısında, beneath altında anlamı verir.
2. **connect A with B**, kıyı kentlerini iç bölgelere bağlar. Of, for, on ve at bu fiille kullanılmaz.
3. E seçeneğindeki beside ilk boşlukta makul görünür ama ikinci boşluk bozar. Doğru cevap **across / with**.
:::

:::soru{cevap="A"}
The committee has been working on the proposal ---- last March and expects to finish it ---- the end of the year.

- A) since / by
- B) for / until
- C) since / until
- D) during / by
- E) from / at

---

1. Present Perfect Continuous (has been working) ile **başlangıç noktası** belirten **since** kullanılır. “Last March” bir süre değil, bir başlangıç noktasıdır. For olmaz.
2. “Finish” bir kerede biten bir eylem ve **son tarih** veriyor: **by the end of the year**. Until sürüp giden bir durum için kullanılır.
3. C seçeneği ilk boşlukta doğru ama ikincide yanlıştır. Doğru cevap **since / by**.
:::

:::soru{cevap="C"}
The company preferred hiring an experienced manager ---- promoting one of its own employees.

- A) in case of
- B) owing to
- C) rather than
- D) in terms of
- E) according to

---

1. Şirket iki seçenek arasında tercih yapıyor: dışarıdan deneyimli yönetici almak ya da çalışanlarından birini terfi ettirmek. Boşluk bir **tercih** ifadesi istiyor.
2. “Hiring” ile “promoting” aynı yapıdaki iki seçeneği karşılaştırır ve **rather than** bu karşılaştırmayı kurar.
3. In case of “-mesi durumunda”, owing to “yüzünden”, in terms of “açısından”, according to “-e göre” anlamı verir ve cümleye uymaz. Doğru cevap **rather than**.
:::

:::ipucu{baslik="İpucu"}
Edat sorusunu okurken **boşluktan önceki** sözcüğe bak (benefit, similar, eligible) ve **boşluktan sonraki** yapıya bak (isim mi, cümle mi?). Çoğu soru bu iki bilgiyle çözülür.
:::

## Kendini dene

Cevaplara bakmadan önce her boşluğu kendin doldurmaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “He was accused ---- stealing.” boşluğa ne gelir? => of. accuse someone of.
2. “She insisted ---- paying the bill.” boşluğa ne gelir? => on. insist on + V-ing.
3. “The shop stays open ---- midnight.” boşluğa by mı until mi gelir? => until. Durum midnight’a kadar sürüyor.
4. “Submit the form ---- Friday at the latest.” boşluğa by mı until mi gelir? => by. Son tarih var.
5. “We have lived here ---- ten years.” boşluğa for mı since mi gelir? => for. Süre belirtiliyor.
6. “---- the heavy traffic, we arrived on time.” despite mi although mı? => Despite. Sonrasında isim öbeği var.
7. “---- it was raining, we went out.” despite mi although mı? => Although. Sonrasında özne ve fiil var.
8. “I look forward ---- you.” boşluğa ne gelir ve fiilin biçimi ne olur? => to seeing. Edat olan to’dan sonra V-ing gelir.
9. similar ve different sıfatları hangi edatlarla kullanılır? => similar **to**, different **from**.
10. “The increase ---- prices” boşluğa ne gelir? => in. increase in.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 43, false from public.topics where subject_id = 'ydt-dil' and name = 'Prepositions';
