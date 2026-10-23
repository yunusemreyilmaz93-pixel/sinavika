-- YDT Tenses: doğru şıklar A-E arasında dengeli dağıtılır (önceden A ve B ağırlıklıydı, E hiç yoktu) ve giriş cümlesi düzeltilir.
-- Yalnızca anlatım bu sürümdeyse uygulanır, yönetici sonradan düzenlediyse dokunmaz.

update public.lessons l
set body = $tn$## Bu konuda ne öğreneceksin

Zamanlar (tenses) YDT’nin ilk yirmi sorusundaki dilbilgisi bölümünün omurgasıdır. Ama sınavda hiçbir zaman tek başına sorulmaz. Her soruda iki boşluk vardır ve zaman, modal, edilgen yapı ya da fiilimsiyle aynı soruda yan yana gelir. Bu yüzden her zamanı **ne anlattığıyla** bilmen ve onu başka yapılarla birlikte yorumlayabilmen gerekir. Konunun sonunda şunları yapabileceksin:

:::hedefler
1. On iki zamanı ve gelecek anlatan diğer kalıpları kuruluşlarıyla ve anlamlarıyla ayırt etmek.
2. Cümledeki zaman sinyalinden doğru zamanı bulmak.
3. İki cümlecik arasındaki zaman uyumunu kurmak (by the time, since, hardly, no sooner, when, while).
4. Zamanı çatıyla (passive) ve gerçek dışı yapılarla (wish, if only, as if) birlikte yorumlamak.
5. Türkçe cümleyi İngilizceye çevirirken doğru zamanı seçmek.
6. YDT’deki tense sorularını beş adımda çözmek.
:::

:::ipucu
Tense sorusunu çözmek için formül ezberleme, **üç şeye bak**: cümlede zaman sinyali var mı, öteki cümlecik hangi zamanda, cümle etken mi edilgen mi. Bu üç bilgi seçeneklerin çoğunu eler.
:::

## 1. YDT’de zamanlar sınavda nasıl çıkıyor

Bu bölüm, MEB’in “YDT İngilizce Çıkmış Sorular 2018-2025 (Konu Bazlı)” kitabındaki 80 dilbilgisi sorusunun (her yıl 10 soru) tek tek incelenmesine dayanıyor. Sınıflandırma kitaptaki sorulara bakılarak yapıldı, doğru seçenekler tek tek çözülerek belirlendi.

:::neden-sonuc
- Sekiz yılın hepsinde 10 dilbilgisi sorusu aynı düzende => 3 fiil biçimi sorusu, 2 edat çifti, 2 bağlaç, 1 belirleyici ya da nicelik, 1 karşılıklı bağlaç ya da karşılaştırma, 1 anlam bağlacı ya da edat.
- Her sorunun iki boşluğu var => Zaman hiç tek başına sorulmuyor. Bir boşluk zamansa öteki modal, edilgen, fiilimsi ya da ikinci bir zaman.
- 24 fiil biçimi sorusunun 18’inde en az bir boşlukta zaman seçimi var => Zaman her yıl 2 ya da 3 soruda karşına çıkıyor (2020 ve 2024’te 3, diğer yıllarda 2).
- Seçenekler aynı zaman ailesinden değil => Yanlış seçenekler modal ve edilgen karışımıyla kurulmuş. Zamanı bilmek tek başına yetmiyor.
:::

Fiil biçimi sorularının her yıl nasıl kurulduğu:

| Yıl | Soru no | Üç fiil biçimi sorusunun içeriği | Zaman içeren soru |
| --- | --- | --- | --- |
| 2018 | 1 - 3 | zaman + modal, modal + fiilimsi, zaman + fiilimsi | 2 |
| 2019 | 11 - 13 | zaman + zaman (edilgen), zaman (edilgen) + modal, fiilimsi | 2 |
| 2020 | 21 - 23 | zaman + zaman (edilgen), zaman + modal, fiilimsi + zaman | 3 |
| 2021 | 31 - 33 | zaman + modal, zaman + modal, fiilimsi + fiilimsi | 2 |
| 2022 | 41 - 43 | zaman + zaman (edilgen), zaman + modal (edilgen), fiilimsi + fiilimsi | 2 |
| 2023 | 51 - 53 | zaman + modal (edilgen), zaman + modal, fiilimsi + fiilimsi | 2 |
| 2024 | 61 - 63 | koşul (modal + zaman), zaman + fiilimsi, fiilimsi + zaman | 3 |
| 2025 | 71 - 73 | modal + fiilimsi, modal + zaman, koşul (modal + zaman, edilgen) | 2 |

Bu tablodan şunu çıkar: Üç sorunun **birincisi ve ikincisi** genellikle zaman ağırlıklıdır, **üçüncüsü** çoğu yıl fiilimsidir (participle, infinitive, gerund). Dilbilgisi bölümünde gördüğün zaman soruları hep modal ve edilgenle birlikte gelir. Bu yüzden bu metin zamanı ayrı, **modal ve edilgenle birleşmiş hâlini** ayrıca anlatıyor (14. bölüm).

### Sorulardaki zaman sinyalleri

Boşluğu çevreleyen cümlede zamanı gösteren bir ifade neredeyse her sorunun içinde duruyor. İncelediğim sorulardaki örnekler: for years, since, until recently ... now, currently, throughout the years, by about 7000 BCE, in 1793, at any one time, the moment, so far, following the ... (ardından). Önce bu ifadeyi bul, sonra seçeneklere bak.

### Diğer soru tiplerinde zaman

Dilbilgisi bölümünün dışında da zamanlar karşına çıkabilir. Bu tablo soru tiplerinin doğasına dayanan genel bir özet, bu kısmı kitaptaki soruları tek tek sayarak doğrulamadım.

| Soru tipi | Zaman nasıl saklanır | Ne yapmalısın |
| --- | --- | --- |
| Cloze test | Boşluk paragrafın ortasındadır, zaman paragrafın genel zamanına bağlıdır | Önceki ve sonraki cümlelerin zamanına bak |
| Cümle tamamlama | Cümlenin ilk yarısı zaman verir, ikinci yarıyı uygun zamanla tamamlarsın | İlk yarının zamanıyla uyumlu seçeneği bul |
| İngilizce → Türkçe çeviri | Seçeneklerde zaman farkı kaçar: -miş, -di, -ecek | Fiilin zamanını Türkçeye doğru yansıt |
| Türkçe → İngilizce çeviri | Aynı anlam farklı zamanlarla yazılır | Türkçedeki zaman ipucunu İngilizce zamana çevir |
| Anlamca en yakın cümle | Cümle zaman değiştirerek yeniden yazılır (since, for, ago, first time) | İki cümlenin zaman ilişkisini karşılaştır |

## 2. Zamanın haritası

İngilizcede zaman iki ayrı soruyla belirlenir. Birincisi **ne zaman?** (geçmiş, şimdi, gelecek). İkincisi **olay nasıl yaşanıyor?** (bütün olarak, süreç olarak, tamamlanmış olarak, süresiyle birlikte).

| İngilizce adı | Türkçe karşılığı | Kuruluşu |
| --- | --- | --- |
| Simple Present | Geniş zaman | V1 (he/she/it için -s) |
| Present Continuous | Şimdiki zaman | am/is/are + V-ing |
| Present Perfect | Yakın geçmiş, günümüze etki eden olay, geçmişte başlayıp hala devam eden olay | have/has + V3 |
| Present Perfect Continuous | Geçmişte başlamış şuan devam eden olaylar | have/has been + V-ing |
| Simple Past | Geçmiş zaman | V2 |
| Past Continuous | Geçmişte devam eden olay | was/were + V-ing |
| Past Perfect | İki geçmiş olaydan önceki (Geçmişin geçmişi) | had + V3 |
| Past Perfect Continuous | Geçmişte belirli bir noktaya kadar süregelen olay | had been + V-ing |
| Simple Future | Gelecek zaman | will + V1 |
| Future Continuous | Gelecekte süren olay | will be + V-ing |
| Future Perfect | Gelecekte tamamlanmış olay | will have + V3 |
| Future Perfect Continuous | Gelecekte belirli bri noktada devam edecek olan olay | will have been + V-ing |

Dört görünüşün anlamı hep aynıdır, hangi zamanda olursa olsun:

| Görünüş | Ne anlatır | Örnek (present) |
| --- | --- | --- |
| Simple | Olayı bir bütün, alışkanlık ya da gerçek olarak anlatır | She studies every night. |
| Continuous | Olay sürmektedir, yarımdır ya da geçicidir | She is studying now. |
| Perfect | Olay, söylenen zamandan **önce** olmuştur ve o zamanla bağı vardır | She has studied for the exam. |
| Perfect Continuous | Olay başlamış, o zamana kadar süre gelmiştir, süresi önemlidir | She has been studying for three hours. |

:::baglanti
Önce zamana (past, present, future), sonra görünüşe (simple, continuous, perfect, perfect continuous) karar ver. Her soruda bu iki adımı yap, seçeneklerin yarısı düşer.
:::

## 3. Present Simple


::video{url="https://www.youtube.com/watch?v=JLdIAa8jaZM" baslik="Sıfırdan İngilizce - İngilizce Present Simple Tense Detaylı Anlatım (Pdf konu anlatımı ile)" kanal="itsayseser"}


**Kuruluş:** özne + V1 (he, she, it için V1 + s/es). Olumsuz: do not / does not + V1. Soru: Do / Does + özne + V1?

**Ne zaman kullanılır:**

- **Alışkanlık ve tekrar:** She **takes** the bus every morning.
- **Genel doğrular ve bilimsel gerçekler:** Water **boils** at 100 degrees Celsius.
- **Durumlar (state):** He **works** at a bank. I **know** the answer.
- **Tarife ve programlı gelecek:** The train **leaves** at 8.15 tomorrow.
- **Zaman ve koşul cümleciklerinde gelecek:** I will call you when I **arrive**.
- **Anlatı ve başlık dili:** Government **announces** new tax plan.

**Sinyal sözcükleri:** always, usually, often, sometimes, seldom, rarely, never, every day/week, once a week, generally, as a rule, on Mondays.

:::ipucu
Gelecekten söz ediyorsa bile when, as soon as, before, after, until, if, unless, by the time cümleciklerinde **will kullanılmaz**, Present Simple kullanılır. “I will tell him when he will come” YDT’de yanlış seçenektir.
:::

## 4. Present Continuous


::video{url="https://www.youtube.com/watch?v=QTJS3nuEn-Y" baslik="Present Continuous Tense Konu Anlatımı | İngilizce Şimdiki Zaman Konu Anlatımı" kanal="MsJasminELT"}


**Kuruluş:** am / is / are + V-ing. Olumsuz: am/is/are + not + V-ing.

**Ne zaman kullanılır:**

- **Şu anda olan olay:** The students **are writing** an exam now.
- **Geçici durum:** I **am staying** with my aunt this month.
- **Değişim ve gelişim (trend):** Prices **are rising** every year. The climate **is getting** warmer.
- **Planlanmış, ayarlanmış gelecek:** We **are meeting** the dean on Friday.
- **Sinir bozucu alışkanlık (always ile):** He **is always losing** his keys.

**Sinyal sözcükleri:** now, at the moment, currently, today, this week/month/year, nowadays, these days, still, Look! Listen!

### Durum fiilleri (stative verbs)

Bazı fiiller süreç değil durum anlatır, genellikle continuous yapılmaz. Bunları Present Simple ile kullan.

| Grup | Fiiller |
| --- | --- |
| Duygu ve istek | love, like, hate, prefer, want, wish, need |
| Düşünce ve bilgi | know, believe, understand, remember, forget, doubt, realize, suppose |
| Sahiplik ve ilişki | have (sahip olmak), own, belong to, possess, contain, consist of, include |
| Algı ve görünüş | seem, appear (görünmek), look like, sound, resemble |
| Diğer | mean, cost, depend on, matter, owe, deserve |

Bazı fiillerin anlamı değişince continuous olur:

| Fiil | Durum anlamı (simple) | Süreç anlamı (continuous) |
| --- | --- | --- |
| think | I think he is right. (görüş) | I am thinking about the offer. (düşünüyorum, tartıyorum) |
| have | She has a car. (sahip) | She is having lunch. (yemek yemek) |
| see | I see what you mean. (anlamak) | He is seeing a doctor. (görüşmek) |
| taste | The soup tastes good. | She is tasting the soup. (tadına bakıyor) |
| be | He is kind. (karakter) | He is being rude today. (şimdilik öyle davranıyor) |

## 5. Present Perfect

**Kuruluş:** have / has + V3. Olumsuz: have / has not + V3.

Present Perfect, **geçmişle şimdi arasında bir köprü** kurar. Olayın ne zaman olduğundan çok, şimdiki etkisi ya da şimdiye kadar süren durum önemlidir.

**Ne zaman kullanılır:**

- **Deneyim:** I **have visited** Rome twice. (hayatım boyunca)
- **Hâlâ süren durum (for, since):** They **have lived** here **since 2015**.
- **Yakın geçmiş ve şimdiki sonuç:** I **have lost** my keys. (hâlâ yok)
- **Henüz bitmemiş zaman dilimi:** I **have read** two books **this week**.
- **Üstünlük derecesi ve ilk kez:** It is the best film I **have ever seen**. This is the first time he **has flown**.
- **Haber verme:** The prime minister **has resigned**.

**Sinyal sözcükleri:** for, since, so far, up to now, until now, yet, already, just, ever, never, lately, recently, before, today, this week/month/year, several times, how long, the first/second time.

### for ve since

| | Anlamı | Örnek |
| --- | --- | --- |
| for | Süre (ne kadar) | for three years, for a long time |
| since | Başlangıç noktası (ne zamandan beri) | since 2015, since Monday, since I was a child |

since’den sonra Past Simple de gelebilir: I **have known** her **since we were** at school. “It **has been** five years **since** I **last saw** him.” kalıbında since’den sonra Past Simple, ana cümlede Present Perfect gelir.

### has been ile has gone

| Kalıp | Anlamı |
| --- | --- |
| She **has been to** Paris. | Paris’e gitti ve döndü (deneyim) |
| She **has gone to** Paris. | Paris’e gitti, şu an orada ya da yolda |

### Present Perfect ile Simple Past farkı

| | Present Perfect | Simple Past |
| --- | --- | --- |
| Zaman | Belirtilmemiş ya da bitmemiş dönem | Bitmiş, belirli zaman |
| Bağ | Şimdiyle ilgisi var | Şimdiyle bağı yok |
| Sinyal | for, since, yet, already, just, ever, never, so far | yesterday, last year, in 1999, ago, when, then, in the 1990s |

:::ipucu{baslik="Altın kural"}
**ago**, **yesterday**, **last week**, **in 2010** ve “**when** (soru)” ile Present Perfect kullanılmaz. Bitmiş ve belirli bir zaman söyleniyorsa Simple Past gelir. “I have seen him yesterday” YDT’de yanlış seçenektir.
:::

## 6. Present Perfect Continuous

**Kuruluş:** have / has + been + V-ing.

**Ne zaman kullanılır:**

- **Geçmişte başlayıp şimdi de süren olay (süre vurgusu):** She **has been working** here **for ten years**.
- **Yeni bitmiş sürecin izi:** Your hands are dirty. **Have you been gardening?**
- **Tekrar eden süreç:** I **have been trying** to call you all day.

**Sinyal sözcükleri:** for, since, all day/week, lately, recently, how long, these days.

### Present Perfect ile Present Perfect Continuous

| | Present Perfect | Present Perfect Continuous |
| --- | --- | --- |
| Vurgu | Sonuç, sayı, bitmiş iş | Süreç, süre, bitmemiş iş |
| Örnek | I have painted three rooms. | I have been painting the rooms all day. |
| Soru | How many? How much? | How long? |
| Durum fiilleri | Kullanılır: I have known him for years. | Kullanılmaz: I have been knowing (yanlış) |

:::baglanti
How long sorusunda süre vurgusu varsa Present Perfect Continuous aklına gelmeli. Sorudaki fiil durum fiiliyse (know, own, love, belong) Present Perfect Continuous **yapılmaz**, Present Perfect seçilir.
:::

## 7. Simple Past

**Kuruluş:** özne + V2 (düzensiz fiillerde ikinci hal). Olumsuz: did not + V1. Soru: Did + özne + V1?

**Ne zaman kullanılır:**

- **Geçmişte bitmiş ve zamanı belli olay:** The earthquake **struck** in 1999.
- **Ardışık olaylar:** He **opened** the door, **looked** around and **left**.
- **Geçmiş alışkanlık ve durum:** We **lived** in a small village when I was a child.

**Sinyal sözcükleri:** yesterday, last night/week/year, ago, in 1990, then, once, when, the other day, in the past, in the 1990s, during, at that time.

### used to, would ve be used to

| Kalıp | Anlamı | Not |
| --- | --- | --- |
| used to + V1 | Eskiden yapardı, eskiden öyleydi (artık değil) | Hem alışkanlık hem durum için |
| would + V1 | Eskiden yapardı | Sadece tekrar eden eylem için, durum için kullanılmaz |
| be/get used to + V-ing | Alışkın olmak, alışmak | to burada edattır |

Örnekler: I **used to** live in Izmir. (durum, would yanlış olurdu) Every summer we **would** visit our grandparents. (tekrar eden eylem) She **is used to** getting up early. (alışkın)

## 8. Past Continuous

**Kuruluş:** was / were + V-ing.

**Ne zaman kullanılır:**

- **Geçmişte belirli bir anda süren olay:** At 9 last night, I **was studying**.
- **Kesilen olay:** I **was crossing** the street when a car hit the bicycle.
- **Eş zamanlı iki süreç:** While she **was cooking**, he **was setting** the table.
- **Arka plan (anlatıda ortam):** It **was raining** and people **were hurrying** home.
- **Gerçekleşmemiş plan:** I **was going to** call you, but I forgot.
- **Nazik rica:** I **was wondering** if you could help me.

**Sinyal sözcükleri:** while, when, as, at that moment, at 8 o’clock yesterday, all day yesterday, this time last year.

:::ipucu{baslik="when ve while"}
**while** genellikle sürmekte olan olayın önüne gelir: while I was studying. **when** ise kısa, olup biten olayın önüne gelir: when the phone rang. İki olay arasındaki ilişkiyi şöyle oku: uzun olay Past Continuous, onu kesen kısa olay Simple Past.
:::

## 9. Past Perfect

**Kuruluş:** had + V3. Olumsuz: had not + V3.

Past Perfect **geçmişin geçmişidir**. Geçmişte iki olay varsa, **önce olan** olay Past Perfect ile, sonra olan olay Simple Past ile anlatılır.

**Ne zaman kullanılır:**

- **Geçmişteki bir olaydan önce tamamlanmış olay:** When I arrived, the film **had** already **started**.
- **Haber aktarma (reported speech):** She said she **had finished** the report.
- **Hayal ve pişmanlık (gerçek dışı geçmiş):** If I **had known**, I would have helped. I wish I **had studied** harder.
- **Hardly, scarcely, no sooner yapıları (YDT’de nadir):** **Hardly had** she **entered** the room when the lights went out.

**Sinyal sözcükleri:** by the time (past), before, after, already, just, never ... before, by then, until then, by + geçmiş zaman, when.

### Zaman bağlaçlarıyla sıra

| Cümle | Önce olan | Sonra olan |
| --- | --- | --- |
| When I got to the station, the train had left. | Tren kalktı | Ben vardım |
| When I got to the station, the train left. | Ben vardım | Tren kalktı |
| After he had finished, he left. | Bitirdi | Ayrıldı |
| Before he left, he had finished the work. | Bitirdi | Ayrıldı |

Son iki cümlede after ve before sıra zaten belli ettiği için Past Perfect yerine Simple Past da kullanılabilir. **when** ile sıra bu şekilde anlaşılmadığı için fark yaratır.

### Hardly, scarcely, no sooner

Bu yapılar “-ir -mez”, “-diği anda” anlamındadır ve baştaki olumsuz ifadeden sonra yardımcı fiil öne geçer (devrik cümle).

| Kalıp | Örnek |
| --- | --- |
| Hardly + had + özne + V3 + when + Simple Past | Hardly had he sat down when the phone rang. |
| Scarcely + had + özne + V3 + when + Simple Past | Scarcely had we left when it started to rain. |
| No sooner + had + özne + V3 + than + Simple Past | No sooner had she arrived than the meeting began. |

:::ipucu{baslik="Bu kalıp ne kadar önemli"}
hardly / scarcely **when**, no sooner **than**. Bilinen tuzaklardır ama 2018-2025 arasındaki 80 dilbilgisi sorusunda hiç çıkmadı. Bunları öğren, ama zamanını zaman uyumu ve modal ile edilgen kalıplarına öncelik vererek kullan. Cümle tamamlama ve çeviri sorularında karşına çıkma ihtimalini göz ardı etme.
:::
## 10. Past Perfect Continuous

**Kuruluş:** had been + V-ing.

**Ne zaman kullanılır:**

- **Geçmişteki bir ana kadar süren olay:** She **had been waiting** for two hours when the bus finally arrived.
- **Geçmişteki bir durumun nedeni:** His eyes were red. He **had been crying**.

**Sinyal sözcükleri:** for, since, all day, how long (geçmiş bir an için), by the time, before.

Present Perfect Continuous ile aynı mantık, sadece bakış noktası şimdi değil geçmişteki bir andır.

## 11. Gelecek zamanı anlatan kalıplar

İngilizcede gelecek tek bir zamanla anlatılmaz. Hangi kalıbın seçileceğine konuşanın **niyeti** karar verir.

| Kalıp | Ne zaman | Örnek |
| --- | --- | --- |
| will + V1 | Anlık karar, söz, teklif, görüşe dayalı tahmin | I’ll help you. I think it will rain. |
| be going to + V1 | Önceden verilmiş karar, elde kanıt olan tahmin | I’m going to study law. Look at those clouds! It’s going to rain. |
| am/is/are + V-ing | Ayarlanmış, kesinleşmiş plan | I’m seeing my dentist tomorrow. |
| Simple Present | Tarife, program | The exam starts at 9 a.m. |
| will be + V-ing | Gelecekte belirli anda süren olay | This time tomorrow I will be flying to Berlin. |
| will have + V3 | Gelecekteki bir ana kadar tamamlanmış olay | By 2030, they will have built the new airport. |
| will have been + V-ing | Gelecekteki bir ana kadar süregelen olay (süre vurgusu) | By June, she will have been teaching for 20 years. |
| be about to + V1 | Çok yakın gelecek | The film is about to start. |
| be to + V1 | Resmi plan, emir | The president is to visit Japan next month. |

### will ve be going to

will ile konuşma anında karar veririz: “The phone is ringing. I’ll answer it.” be going to ile önceden planladığımız ya da elimizde kanıt olan şeyi söyleriz: “I’ve bought the tickets. We’re going to travel to Italy.”

### Future Perfect ve by the time

Future Perfect’in en tipik sinyali **by** ve **by the time**’dır:

- **By the time** you **arrive**, I **will have finished** the report.
- **By 2030**, many cities **will have banned** petrol cars.

Dikkat: by the time’dan sonra Present Simple gelir, will gelmez.

### Geçmişten bakınca gelecek (future in the past)

Geçmişteki bir andan bakıldığında gelecek olan olay would, was/were going to, was/were about to ile anlatılır.

| Örnek |
| --- |
| He said he **would** call me later. |
| I **was going to** tell her, but she left. |
| She knew he **would** become famous one day. |

## 12. Zaman bağlaçları ve zaman uyumu

YDT’nin en sevdiği soru tipi budur. İki cümlecik varsa, **ikisi birlikte** doğru olmalıdır. Aşağıdaki çiftleri ezber değil **mantık** olarak oku.

| Kalıp | Ana cümle | Bağlı cümle | Örnek |
| --- | --- | --- | --- |
| by the time (gelecek) | will have V3 | Present Simple | By the time you arrive, I will have left. |
| by the time (geçmiş) | had V3 | Simple Past | By the time we arrived, the film had started. |
| since | Present Perfect (Continuous) | Simple Past ya da başlangıç noktası | I have worked here since I graduated. |
| It is + süre + since | It is / has been | Simple Past | It has been three years since I last saw him. |
| It is the first time | Present Perfect | | It is the first time she has flown. |
| It was the first time | Past Perfect | | It was the first time she had flown. |
| while | Simple Past | Past Continuous | The phone rang while I was cooking. |
| when (kesme) | Past Continuous | Simple Past | I was cooking when the phone rang. |
| when (sıra) | Past Perfect | Simple Past | When I arrived, the film had started. |
| before / after | Simple Past veya Past Perfect | Simple Past | After he (had) left, I called her. |
| as soon as / once / the moment | will V1 | Present Simple | I will call you as soon as I arrive. |
| until / till | will V1 | Present Simple ya da Present Perfect | I won’t leave until she comes. |
| hardly / no sooner | Past Perfect (devrik) | Simple Past | No sooner had he left than it rained. |
| if / unless (Type 1) | will V1 | Present Simple | If you study, you will pass. |
| whenever / every time | Present Simple / Simple Past | | Whenever it rains, the road floods. |

:::ipucu{baslik="when ve if bazen will alır"}
**when** ve **if** isim cümleciği (noun clause) kurduğunda will alabilir: “I don’t know **when** he **will arrive**.” “I wonder **if** she **will come**.” Çünkü burada when “ne zaman” sorusudur, zaman bağlacı değildir. Zaman bağlacı olduğunda will almaz.
:::

### Present Perfect ya da Present Simple

Zaman bağlaçlarında tamamlanma vurgusu için Present Perfect de kullanılabilir: “I will call you as soon as I **have finished**.” Present Simple ile anlam neredeyse aynıdır. Seçeneklerde ikisi birlikte varsa dikkat et, YDT’de genellikle yalnızca biri doğru olur.

## 13. Zamanlar ve çatı (passive)

YDT sorularında zaman ile çatı çoğu zaman birlikte denenir. Aşağıdaki tablo her zamanın edilgen halidir.

| Zaman | Etken (active) | Edilgen (passive) |
| --- | --- | --- |
| Present Simple | They build bridges. | Bridges are built. |
| Present Continuous | They are building a bridge. | A bridge is being built. |
| Present Perfect | They have built a bridge. | A bridge has been built. |
| Simple Past | They built a bridge. | A bridge was built. |
| Past Continuous | They were building a bridge. | A bridge was being built. |
| Past Perfect | They had built a bridge. | A bridge had been built. |
| Simple Future | They will build a bridge. | A bridge will be built. |
| be going to | They are going to build a bridge. | A bridge is going to be built. |
| Future Perfect | They will have built a bridge. | A bridge will have been built. |

Passive’in kuruluşu her zaman **uygun to be + V3**’tür. Kural basit: zamanı belirleyen yardımcı fiil to be’nin içine girer, anlamlı fiil V3 olur.

:::baglanti
Cümlenin öznesi eylemi yapıyor mu yoksa eylemden etkileniyor mu? Etkileniyorsa passive’dir. “The report ---- by the manager” gibi bir cümlede özne raporu yazmıyor, rapor yazılıyor: **was written / has been written / will be written** seçeneklerinden birini zamana göre seç.
:::

Present Perfect Continuous ve Past Perfect Continuous’un edilgen halleri (has been being done) çok ağırdır ve sınavda beklenmez, bu benim değerlendirmem.

## 14. Zaman, modal ve edilgen bir arada

YDT’de zaman sorusu iki boşlukludur ve boşluklardan biri çoğu zaman modaldır. Modal konusu ayrıca anlatılacak. Burada sadece zamanla yan yana gelen kalıpları öğreniyorsun.

### Geçmiş için modal kalıplar

| Kalıp | Anlamı | Örnek |
| --- | --- | --- |
| must have + V3 | Geçmiş için kesin çıkarım | The pottery is 9,000 years old, so people must have farmed here. |
| may / might / could have + V3 | Geçmiş için olasılık | The signal may have come from a satellite. |
| can’t / couldn’t have + V3 | Geçmişte imkânsız olduğu çıkarımı | She can’t have left, her coat is still here. |
| should / ought to have + V3 | Yapılması gerekirdi ama yapılmadı | You should have called me. |
| would have + V3 | Gerçekleşmemiş geçmiş (3. tip koşul) | If he had studied, he would have passed. |
| needn’t have + V3 | Gereksiz yere yapıldı | We needn’t have hurried. |
| had to + V1 | Geçmişte zorunluluk | The company had to close its factory. |
| used to + V1 | Eskiden yapardı ya da öyleydi | Cities used to be much smaller. |
| were able to + V1 | Geçmişte başarmıştı | They were able to escape. |

### İki boşluklu soruyu çözme yolu

1. **İki boşluğa da bak.** Her seçenek iki parçadır (A / B gibi).
2. **Kolay olanı bul.** Zaman sinyali olan boşluk genellikle kolaydır (for years, since, until recently, by the time, in 1793).
3. **O boşluğa uymayan seçenekleri çiz.** Çoğu zaman 2 ya da 3 seçenek kalır.
4. **Ötekini kontrol et.** Kalan seçeneklerde ikinci boşluğun anlamı (kesinlik, olasılık, yükümlülük, edilgenlik) cümleyle uyuşuyor mu?
5. **Özne ve fiil uyumuna son kez bak.** Tekil özne has / is / was, çoğul özne have / are / were.

:::ipucu{baslik="Tuzak bu"}
Seçeneklerin yarısı birinci boşlukta doğru görünür, ikinci boşlukta yanlıştır. “Doğru zamanı buldum” diye hemen işaretleme, ikinci boşlukta modalın anlamına da bak. Past obligation (had to) ile logical deduction (must have) birbirine en çok karıştırılan çifttir.
:::

### Edilgen ve zaman birlikte

Zaman ve çatı aynı seçenekte birleşir. Özne eylemi **yapıyorsa** etken, **eylemden etkileniyorsa** edilgen kullan. Edilgenin zamanı to be fiilinden gelir.

| Özne | Cümle | Seçim |
| --- | --- | --- |
| The bridge | ---- in 1932. | was built (etken değil, çünkü köprü kendini yapmadı) |
| The data | ---- so far. | has been collected |
| The report | ---- next month. | will be published |
| Scientists | ---- the data so far. | have collected (etken, çünkü bilim insanları topluyor) |

## 15. Gerçek dışı zaman kullanımı

Bazı yapılarda zaman şekli gerçek zamanı değil **gerçek dışılığı** gösterir. Burada Past Simple şimdiyi, Past Perfect geçmişi anlatır.

| Yapı | Anlamı | Örnek |
| --- | --- | --- |
| I wish + Past Simple | Şimdiki durumdan pişmanlık | I wish I knew the answer. (şu an bilmiyorum) |
| I wish + Past Perfect | Geçmişten pişmanlık | I wish I had studied harder. |
| I wish + would + V1 | Şikâyet ya da gelecekten dilek | I wish it would stop raining. |
| If only | wish gibi, daha güçlü | If only I had more time. |
| It is (high / about) time + Past Simple | Artık yapılması gereken şey | It is time you went to bed. |
| would rather + Past Simple | Başkasının yapmasını tercih etme | I’d rather you stayed. |
| as if / as though + Past Simple | Gerçek olmayan benzetme (şimdi) | He talks as if he knew everything. |
| as if / as though + Past Perfect | Gerçek olmayan benzetme (geçmiş) | She looked as if she had seen a ghost. |

### Koşul cümleleri

| Tip | If cümleciği | Ana cümle | Anlamı |
| --- | --- | --- | --- |
| 0 | Present Simple | Present Simple | Genel gerçek |
| 1 | Present Simple | will + V1 | Gerçekleşebilir gelecek |
| 2 | Past Simple (were) | would + V1 | Şimdiki gerçek dışı |
| 3 | Past Perfect | would have + V3 | Geçmiş gerçek dışı |

### Haber aktarma (reported speech)

Haber aktaran fiil geçmişteyse (said, told, asked), aktarılan cümlenin zamanı bir adım geriye gider.

| Doğrudan söz | Dolaylı söz |
| --- | --- |
| “I work here.” | She said she worked there. |
| “I am working.” | She said she was working. |
| “I have finished.” | She said she had finished. |
| “I finished.” | She said she had finished. |
| “I will help.” | She said she would help. |
| “I can swim.” | She said she could swim. |

Aktarılan bilgi hâlâ doğruysa ya da aktaran fiil şimdiki zamandaysa (says, tells) zaman geriye gitmeyebilir.

## 16. Sinyal sözcüğü rehberi

| Zaman | Sinyal sözcükleri |
| --- | --- |
| Present Simple | always, usually, often, sometimes, never, every day, on Sundays, as a rule |
| Present Continuous | now, at the moment, currently, nowadays, these days, still, Look! Listen! |
| Present Perfect | for, since, so far, yet, already, just, ever, never, lately, recently, this week, the first time |
| Present Perfect Continuous | for, since, all day, lately, how long, these days |
| Simple Past | yesterday, last year, ago, in 1999, then, once, the other day, when did |
| Past Continuous | while, as, at that moment, at 8 last night, all day yesterday |
| Past Perfect | by the time (past), before, after, already, never before, by then, until then, hardly, no sooner |
| Past Perfect Continuous | for, since, all day (geçmiş bir ana kadar) |
| Simple Future | tomorrow, next week, soon, in two days, I think, probably, perhaps |
| Future Continuous | this time tomorrow, at 8 tomorrow, this time next week |
| Future Perfect | by, by then, by the time (gelecek), by 2030, by the end of this year |
| Future Perfect Continuous | by next year + for + süre |

## 17. Türkçeden İngilizceye zaman ipuçları

Çeviri sorularında Türkçedeki ek ya da ifade doğru İngilizce zamanı gösterir.

| Türkçe ipucu | İngilizce karşılığı | Örnek |
| --- | --- | --- |
| -dığından beri, -eli | since + Past Simple, ana cümlede Present Perfect | Bu şehre taşındığımdan beri hiç hasta olmadım. I haven’t been ill since I moved to this city. |
| -dir, -dır (hâlâ süren) + süre | Present Perfect (Continuous) + for | İki saattir bekliyorum. I have been waiting for two hours. |
| -ken | while / when + Past Continuous | Ders çalışırken telefon çaldı. The phone rang while I was studying. |
| -inca, -dığında | when + Simple Past (geçmişte) / Present Simple (gelecekte) | Geldiğinde seni arayacağım. I will call you when you arrive. |
| -miş olacak | Future Perfect | Sen geldiğinde ben çıkmış olacağım. I will have left by the time you arrive. |
| -mişti | Past Perfect | Ben vardığımda film başlamıştı. When I arrived, the film had started. |
| çoktan, bile, daha ... -medi | already, yet | Henüz bitirmedim. I haven’t finished yet. |
| ilk kez | It is the first time + Present Perfect | İlk kez uçağa biniyorum. This is the first time I have flown. |
| her zaman ... (sinir) | always + Present Continuous | Hep anahtarlarını kaybediyor. He is always losing his keys. |
| -mek üzere | be about to | Film başlamak üzere. The film is about to start. |
| -eceğini söyledi | said (that) ... would | Beni arayacağını söyledi. He said he would call me. |
| -ir -mez | as soon as / hardly ... when / no sooner ... than | Odaya girer girmez ışıklar söndü. Hardly had she entered the room when the lights went out. |

:::ipucu
Çeviri sorusunda seçeneklerin hepsi gramer olarak doğru görünebilir. Zamanı anlam farkı yaratan **tek** seçenek bile çoğu zaman cevaptır. Türkçedeki “-miş” ve “-di” arasındaki farka, “-eli / -dığından beri” ifadelerine dikkat et.
:::

## 18. YDT tense sorusu için beş adım

1. **Boşluğu ve çevresini oku.** Fiil yalnız değil, cümlenin tamamında anlamlıdır.
2. **Zaman sinyalini bul.** for, since, by the time, yesterday, already, tomorrow gibi.
3. **Öteki cümleciği kontrol et.** Past Perfect aranıyorsa ikinci cümlecik Simple Past mı? by the time varsa kuruluş hangisi?
4. **Çatıyı kontrol et.** Özne etken mi, edilgen mi? Passive’de to be + V3 gerekir.
5. **Özne ve fiil uyumunu kontrol et.** he/she/it + has / is / was. Çoğul özne + have / are / were.

Bu beş adımdan sonra elinde genellikle iki seçenek kalır. Anlam bütünlüğüne (cümlenin mantığına) bakarak kararı ver.

:::baglanti
Her tense sorusu bir **tuzak** barındırır: aynı fiilin aynı zamana yakın ama yanlış hali. Tuzakları tanımak doğru cevabı bulmaktan daha hızlıdır. Present Perfect’le ago, will ile when, had ile since, ing ile durum fiili yan yana gelince yanlış seçeneği hemen çıkar.
:::

## Aklında kalsın

- Zamanı iki adımda bul: **ne zaman** (past, present, future), **nasıl** (simple, continuous, perfect, perfect continuous).
- **Present Perfect**: for, since, yet, already, so far, ever, never. ago, yesterday, last, in 1999 ile **kullanılmaz**.
- **Past Perfect**: geçmişin geçmişi. by the time (past), hardly ... when, no sooner ... than.
- **Future Perfect**: by + gelecek zaman. by the time + Present Simple.
- **Zaman bağlaçlarından sonra will gelmez**: when, while, before, after, until, as soon as, if, unless.
- **Durum fiilleri** (know, love, belong, own) continuous olmaz.
- **since** + başlangıç noktası, **for** + süre.
- Anlatı sırasında önce olan olay Past Perfect, sonra olan Simple Past.
- Passive = uygun to be + V3.
- Gerçek dışı yapılarda zaman bir adım geriye gider: wish, if only, as if, it’s time, would rather.

::video{id="H9VX0L-r6IE" etiket="Konu anlatımı videosu" baslik="Tüm zamanlar konu anlatımı, YDS / YDT / YÖKDİL" kanal="Ozan Hoca"}

::video{id="JrNCJHkyh-k" etiket="Soru çözümü videosu" baslik="Tense soruları nasıl çözülür?" kanal="Full up English"}

## Sık karıştırılanlar

| Karıştırılan | Doğrusu |
| --- | --- |
| Present Perfect ile Simple Past | Bitmiş ve belirli zaman (ago, yesterday, in 2010) varsa Simple Past. Süre ya da şimdiyle bağ varsa Present Perfect. |
| for ile since | for + süre (for two years), since + başlangıç noktası (since 2022). |
| has been ile has gone | has been to: gitti ve döndü. has gone to: gitti, orada ya da yolda. |
| Past Perfect ile Simple Past (when) | When I arrived, the film started: ben vardım, sonra başladı. When I arrived, the film had started: film önce başlamıştı. |
| when ve while | while sürmekte olan olayın önünde, when kısa olayın önünde. |
| by the time + will | by the time’dan sonra will gelmez. By the time you arrive, I will have left. |
| Present Perfect Continuous ve durum fiilleri | have been knowing, have been owning yanlıştır. Durum fiilleri Present Perfect ile kullanılır. |
| be used to ve used to | be used to + V-ing: alışkın olmak. used to + V1: eskiden yapardı. |
| hardly ile no sooner | hardly ... when, no sooner ... than. İkisi de had + özne + V3 ile devrik kurulur. |
| will ile be going to | will: anlık karar, söz. be going to: planlanmış, elde kanıt var. |

## YDT tarzı sorular

Aşağıdaki sorular bu metin için yazıldı, ÖSYM sorusu değildir. Sınavdaki gibi her birinde beş seçenek var. İlk bölüm sınavdaki gibi **iki boşluklu**, ikinci bölüm ısınma için **tek boşluklu**. Önce sorudaki zaman sinyalini bul, sonra çözüme bak.

### İki boşluklu sorular (YDT biçimi)

:::soru{cevap="E"}
The Hagia Sophia, which ---- as a cathedral in the 6th century, ---- several times throughout its history.

- A) had been built / was restoring
- B) is built / had restored
- C) has been built / will restore
- D) was building / has restored
- E) was built / has been restored

---

1. İlk boşlukta **in the 6th century** bitmiş ve belirli bir zamandır. Present Perfect olmaz, geçmiş zaman gerekir. Ayasofya’yı biri inşa etti, yani edilgen: **was built**. C seçeneği (has been built) elenir.
2. İkinci boşlukta **several times throughout its history** şimdiye kadar süren bir dönemdir. Ayasofya kendini onarmadı, onarıldı: edilgen Present Perfect, **has been restored**.
3. D seçeneği iki boşlukta da etken kullanıyor, bu yüzden anlam bozuk.
:::

:::soru{cevap="D"}
The pottery found at the site is nearly 9,000 years old, which suggests that people in the region ---- farming long before historians ---- previously.

- A) will practise / had believed
- B) can practise / have been believing
- C) would practise / was believing
- D) must have practised / believed
- E) should have practised / would believe

---

1. “Which suggests” kanıta dayalı bir **çıkarım** bildirir. Geçmişe dair kesin çıkarım **must have + V3** ile yapılır.
2. İkinci boşlukta **previously** (daha önce) geçmişteki bir inanışı anlatır. Simple Past: **believed**.
3. E seçeneğinde should have practised yükümlülük anlamı taşır, çıkarım değil. A ve B seçenekleri gelecek ya da şimdiki zaman kurar, geçmişe uymaz.
:::

:::soru{cevap="E"}
By the time the new metro line ---- next year, the old network ---- more than 20 million passengers.

- A) will open / would carry
- B) opened / has carried
- C) has opened / will carry
- D) is opening / had carried
- E) opens / will have carried

---

1. **By the time** ile gelecek anlatılıyorsa bağlı cümlede Present Simple kullanılır, **will** kullanılmaz. Bu yüzden A elenir.
2. Ana cümlede gelecekteki bir ana kadar tamamlanmış olay var: **will have carried** (Future Perfect).
3. B ve D geçmişi, C ise ilişkisiz bir geleceği anlatıyor.
:::

:::soru{cevap="A"}
If the bridge ---- with stronger materials, it ---- during the storm last year.

- A) had been built / would not have collapsed
- B) was built / will not collapse
- C) is built / would not have collapsed
- D) has been built / did not collapse
- E) had built / would not collapse

---

1. **Last year** geçmişte gerçekleşmemiş bir durumu gösterir, 3. tip koşul gerekir.
2. If cümleciği **had + V3**, ana cümle **would have + V3**.
3. Köprü inşa edilir, edilgen olmalı: **had been built**. E seçeneği etken ve zaman uyumsuz.
:::

:::soru{cevap="C"}
The data collected so far ---- carefully, and the final report ---- until the end of the year.

- A) is analysing / will not publish
- B) was analysed / has not been published
- C) has been analysed / will not be published
- D) had been analysing / would not be published
- E) has analysed / is not publishing

---

1. **So far** Present Perfect gerektirir. Veri analiz edilir, edilgen: **has been analysed**. A, D ve E seçenekleri etken, bu yüzden anlam bozuk.
2. **until the end of the year** gelecekte bir noktaya kadar sürecek bir durum. **will not be published** (edilgen gelecek).
3. B seçeneğinde has not been published gelecekteki “until the end of the year” ile uyuşmaz.
:::

:::soru{cevap="C"}
---- in 1995 as a small research station, the institute ---- into one of the largest laboratories in Europe.

- A) Founding / has grown
- B) To found / grew
- C) Founded / has grown
- D) Having founded / is growing
- E) Being founded / have grown

---

1. Enstitü **kurulmuştur**, yani edilgen anlam var. Başta edilgen fiilimsi: **Founded** (V3).
2. “Into one of the largest” ile **since 1995** anlamı süren bir büyüme anlatıyor, **has grown** uygun.
3. E seçeneğinde “have grown” tekil özne ile uyumsuz. A ve D etken fiilimsi, anlam yanlış.
:::

:::soru{cevap="A"}
The committee ---- the proposal for months before it finally decided ---- the funding.

- A) had been discussing / to approve
- B) discussed / approving
- C) has discussed / to have approved
- D) was discussing / approve
- E) discusses / having approved

---

1. Karar vermeden **önce** aylarca süren bir süreç var. Geçmişteki bir ana kadar süregelen olay: **had been discussing**.
2. **decide** fiilinden sonra **to + V1** gelir: **to approve**.
3. B seçeneğinde decided approving yanlış. D seçeneğinde decided approve kalıbı yanlış.
:::

:::soru{cevap="C"}
Archaeologists ---- the tomb for three years when they finally ---- the hidden chamber.

- A) have been excavating / discovered
- B) were excavating / have discovered
- C) had been excavating / discovered
- D) excavated / were discovering
- E) had excavated / had been discovering

---

1. **for three years when they finally discovered** geçmişteki bir ana kadar süren olayı anlatır: **had been excavating**.
2. Ana olay Simple Past: **discovered**.
3. A seçeneğinde have been excavating geçmiş bir olayla uyuşmaz.
:::

:::soru{cevap="B"}
Since the 1990s, the number of people ---- the Internet ---- dramatically.

- A) to use / increased
- B) using / has increased
- C) used / was increasing
- D) uses / has been increased
- E) being used / increases

---

1. **Since the 1990s** Present Perfect gerektirir: **has increased** (sayı kendiliğinden artar, etken).
2. “The number of people ---- the Internet”: insanlar İnternet’i kullanıyor, etken ve eşzamanlı fiilimsi: **using**.
3. D seçeneğinde has been increased edilgen ve anlam yanlış.
:::

:::soru{cevap="D"}
Until recently, scientists ---- that the Moon had no water, but recent missions ---- evidence of ice in permanently shaded craters.

- A) believe / found
- B) have believed / had found
- C) were believing / would find
- D) believed / have found
- E) used to believe / must find

---

1. **Until recently ... but recent missions** geçmişteki inanç ve şimdiye uzanan keşfi karşılaştırıyor.
2. İlk boşluk geçmiş zaman: **believed** (belirli ve bitmiş dönem). İkinci boşluk **have found** (yakın zamanda, şimdiye etkisi olan keşif).
3. E seçeneğinde used to believe uygun, ama must find anlamsız. D tek doğru seçenek.
:::

### Isınma: tek boşluklu sorular

:::soru{cevap="B"}
By the time the police arrived at the bank, the robbers ---- with all the money.

- A) have escaped
- B) had escaped
- C) were escaping
- D) escape
- E) will have escaped

---

1. **By the time** + Simple Past (arrived) görüyorsun. Geçmişte iki olay var.
2. Polis geldiğinde hırsızlar **önceden** kaçmıştı. Önce olan olay Past Perfect ile anlatılır.
3. A seçeneği şimdiki zamana bağlı, hatalı. C seçeneği “kaçıyorlardı” der, olay tamamlanmamış olur. D ve E seçenekleri başka zamanlara ait.
4. Doğru cevap **had escaped**.
:::

:::soru{cevap="A"}
Scientists ---- the effects of climate change on coral reefs since the early 1980s.

- A) have been studying
- B) studied
- C) study
- D) are studying
- E) will study

---

1. **since the early 1980s** başlangıç noktası verir. Olay geçmişte başladı ve şimdi de sürüyor.
2. Bu durum Present Perfect (Continuous) gerektirir. Seçenekler arasında tek uygun olan A.
3. B bitmiş bir zamanı anlatır, since ile uyumsuz. C ve D since ile kullanılmaz. E gelecek zamandır.
:::

:::soru{cevap="B"}
I will not make a decision until I ---- all the reports.

- A) will read
- B) have read
- C) would read
- D) had read
- E) was reading

---

1. **until** bir zaman bağlacıdır. Ana cümle gelecek zamanda (will not make).
2. Zaman bağlacından sonra will gelmez, Present Simple ya da Present Perfect gelir. Burada tamamlanma vurgusu olduğu için Present Perfect (have read).
3. A ve C zaman bağlacıyla kullanılmaz. D geçmişi anlatır, bağlam geleceğe ait. E hem geçmiş hem de süreç anlatır.
:::

:::soru{cevap="A"}
It is the first time that she ---- abroad, so she is quite nervous.

- A) has travelled
- B) travelled
- C) had travelled
- D) is travelling
- E) would travel

---

1. **It is the first time** kalıbından sonra Present Perfect gelir.
2. Ana cümlede is (şimdiki zaman) var. Geçmiş zamana kayma olmadığı için Past Perfect değil.
3. Cevap **has travelled**. Geçmişte olsaydı, “It was the first time that she had travelled abroad” şeklinde kurulurdu.
:::

:::soru{cevap="D"}
Hardly ---- the room when the lights went out.

- A) he had entered
- B) did he enter
- C) he entered
- D) had he entered
- E) has he entered

---

1. **Hardly ... when** kalıbını gördün. Cümle olumsuz bir zarfla başlıyor, devrik olmalı.
2. Kalıp: Hardly **had** + özne + V3 **when** + Simple Past.
3. Sadece D seçeneğinde had öznenin önünde (had he entered).
:::

:::soru{cevap="D"}
This time next week, we ---- on a beach in Antalya.

- A) will lie
- B) are lying
- C) have lain
- D) will be lying
- E) lie

---

1. **This time next week** gelecekte belirli bir anda süren olayı gösterir.
2. Bu durum için Future Continuous kullanılır: will be + V-ing.
3. A olayı bir bütün olarak anlatır, süreci anlatmaz. B şimdiki zamanı gösterir. C tamamlanmış durumu anlatır, E genel gerçektir.
:::

:::soru{cevap="E"}
By the end of this year, the company ---- more than 500 employees.

- A) hires
- B) has hired
- C) hired
- D) would hire
- E) will have hired

---

1. **By the end of this year** gelecekteki bir ana kadar tamamlanmış olayı gösterir.
2. Bu durumda Future Perfect: will have + V3.
3. A genel gerçek anlatır. B ve C geçmişe ait, “this year” ile bu bağlamda uymuyor. D geçmişten bakılan geleceği anlatır.
:::

:::soru{cevap="C"}
The new bridge ---- at the moment, so drivers should use the alternative road.

- A) is built
- B) has built
- C) is being built
- D) was building
- E) will be built

---

1. **at the moment** şimdiki zaman, süreç anlamı verir. Köprü şu an yapılıyor.
2. Özne köprü, eylemi köprüyü **yapanlar** gerçekleştiriyor. Yani cümle edilgen.
3. Present Continuous passive: is / are being + V3. Cevap **is being built**.
4. B etken ve Present Perfect, D etken ve geçmiş, A süreç anlatmaz, E gelecek.
:::

:::soru{cevap="B"}
While the students ---- the exam, a loud noise came from the corridor.

- A) took
- B) were taking
- C) have taken
- D) had taken
- E) take

---

1. **while** sürmekte olan olayın önüne gelir.
2. Ana cümle Simple Past (came). Kısa olay (gürültü) uzun olayı (sınav) böler.
3. Uzun olay Past Continuous ile anlatılır: **were taking**.
:::

:::soru{cevap="D"}
We started working on this project five years ago and we are still working on it.

Which one is closest in meaning to the sentence above?

- A) We worked on this project for five years.
- B) We had worked on this project for five years.
- C) We will work on this project for five years.
- D) We have been working on this project for five years.
- E) We were working on this project five years ago.

---

1. Olay beş yıl önce başlamış ve **hâlâ sürüyor**.
2. Hâlâ süren, süre vurgusu olan olay için Present Perfect Continuous: have been working ... for five years.
3. A ve B bitmiş olayı anlatır. C gelecek zamandır. E ago ile geçmişte başlayıp biten bir süreci anlatır.
:::

:::soru{cevap="A"}
Bu şehre taşındığımdan beri hiç hasta olmadım.

Which one is the correct translation of the sentence above?

- A) I haven’t been ill since I moved to this city.
- B) I never get ill when I moved to this city.
- C) I wasn’t ill since I have moved to this city.
- D) I hadn’t been ill since I would move to this city.
- E) I don’t be ill since I moved to this city.

---

1. “-dığından beri” ifadesi **since** + Simple Past anlamına gelir. Ana cümlede olay şimdiye kadar sürdüğü için Present Perfect.
2. A tek doğru kuruluş: haven’t been ... since I moved.
3. B seçeneğinde when ile zaman uyumu bozuk. C seçeneğinde ana cümle Simple Past, since ile uyumsuz. D seçeneğinde Past Perfect ve would birlikte kullanılmış, uyumsuz. E seçeneğinde don’t be gramer hatasıdır.
:::

:::soru{cevap="E"}
No sooner had the manager announced the new policy ---- the employees started to protest.

- A) when
- B) before
- C) after
- D) while
- E) than

---

1. **No sooner** kalıbı hep **than** ile gelir.
2. Hardly / scarcely ile **when** kullanılır, no sooner ile **than**.
3. Cevap **than**.
:::

:::soru{cevap="C"}
When I got to the station, the train ----, so I had to wait for the next one.

- A) left
- B) has left
- C) had left
- D) was leaving
- E) leaves

---

1. Ben vardığımda tren zaten gitmişti. Bu yüzden bir sonraki treni beklemek zorunda kaldım.
2. Önce olan olay (tren kalktı) Past Perfect, sonra olan olay (ben vardım) Simple Past ile anlatılır.
3. A seçeneği “ben vardım, sonra tren kalktı” anlamına gelir, cümlenin devamıyla uyuşmaz.
4. Cevap **had left**.
:::

:::soru{cevap="B"}
The Wright brothers ---- the first successful powered flight in 1903.

- A) have made
- B) made
- C) had made
- D) are making
- E) make

---

1. **in 1903** bitmiş ve belirli bir zamanı gösterir.
2. Bu bilgi Present Perfect ile kullanılmaz. Simple Past kullanılır.
3. Cevap **made**.
:::

:::ipucu{baslik="İpucu"}
Soruyu okumadan önce seçeneklere bak. Beş seçenek aynı fiilin farklı zamanlarıysa, soru bir tense sorusudur. Hangi zaman sinyalini arayacağını daha okumadan bilirsin.
:::

## Kendini dene

Cevaplara bakmadan önce her soruyu kendi cümlelerinle cevaplamaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı öğretir.

:::dene
1. “I have seen him yesterday.” cümlesindeki hata nedir? Düzelt. => yesterday bitmiş ve belirli bir zamandır, Present Perfect ile kullanılmaz. Doğrusu: I saw him yesterday.
2. “By the time you will arrive, I will have left.” cümlesindeki hata nedir? => by the time’dan sonra will kullanılmaz. Doğrusu: By the time you arrive, I will have left.
3. She has been to Paris ile She has gone to Paris arasındaki fark nedir? => has been to: gitti ve döndü. has gone to: gitti, şu an orada ya da yolda.
4. For ve since arasındaki farkı iki örnekle göster. => for + süre: for three years. since + başlangıç noktası: since 2022.
5. “No sooner had she left ---- the phone rang.” boşluğa ne gelir? => than.
6. “I wish I ---- more time.” (şu an zamanım az) boşluğa hangi zaman gelir? => Simple Past: I wish I had more time.
7. Hangi durumlarda Present Perfect Continuous yerine Present Perfect kullanılır? => Durum fiilleriyle (know, own, love), sonuç ya da sayı vurgulandığında (How many?).
8. “A new stadium ---- at the moment.” boşluğa passive Present Continuous yaz. => is being built.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$tn$, updated_at = now()
from public.topics t
where t.id = l.topic_id and t.subject_id = 'ydt-dil' and t.name = 'Tenses'
  and md5(l.body) = '37fe593dff5c7f11dec2239d20847c55';
