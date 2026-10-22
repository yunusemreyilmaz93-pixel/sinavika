-- TYT Türkçe konu anlatımları (b). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Bu kitabı aldım.” cümlesinde “bu”, kitabı belirten bir **sıfattır**. “Bunu aldım.” cümlesinde ise “bunu”, bir ismin yerine geçen bir **zamirdir**. “Hızlı bir araba” cümlesinde “hızlı” ismi niteler. “Hızlı koştu” cümlesinde aynı sözcük fiili niteler ve **zarf** olur. İsim, sıfat, zamir ve zarf birbirine karışan türlerdir. Bu konuda zamirleri, zarfları ve onları sıfattan ayıran ölçütleri öğreneceksin.

:::hedefler
1. Zamir türlerini (kişi, işaret, belgisiz, soru, dönüşlülük, ilgi) ayırt etmek.
2. Zamiri sıfattan ayırmak.
3. Zarf türlerini (durum, zaman, yer-yön, miktar, soru) ayırt etmek.
4. Zarfı sıfattan ayırmak.
5. Bir sözcüğün cümledeki türünü belirlemek.
:::

:::ipucu
Sözcüğün türünü bulmak için **sözcüğün neyi niteliyor ya da neyin yerine geçiyor** olduğuna bak. Bir ismin yerine geçiyorsa zamirdir. Bir ismi niteliyorsa sıfattır. Fiili, sıfatı ya da başka bir zarfı niteliyorsa zarftır.
:::

## 1. Zamir

**İsimlerin yerine geçen** ve isim gibi kullanılan sözcüklere zamir (adıl) denir. Zamir, ismin yerini alır ve isim gibi çekim eki alır.

| Zamir türü | Örnek |
| --- | --- |
| Kişi zamirleri | ben, sen, o, biz, siz, onlar |
| İşaret zamirleri | bu, şu, o, bunlar, şunlar, bunu, şuraya |
| Belgisiz zamirler | herkes, kimse, biri, birisi, hepsi, hiçbiri, bazısı, kimi |
| Soru zamirleri | kim, ne, hangisi, kaçı, kimi, neresi |
| Dönüşlülük zamiri | kendi, kendim, kendisi |
| İlgi zamiri | benimki, seninki, bizimki, evdeki |

**Sıfat mı, zamir mi?** “Bu”, “şu”, “o” sözcükleri **bir ismi niteliyorsa** işaret sıfatıdır, **tek başına kullanılıp ismin yerine geçiyorsa** zamirdir.

- **Bu** kitabı sen mi aldın? (“kitap” ismini belirtiyor: sıfat)
- **Bunu** sana ben aldım. (“Bu” isim yerine kullanılmış, ek almış: zamir)

Aynı ayrım belgisiz sıfat ile belgisiz zamir arasında da yapılır: “**Bazı** öğrenciler geç kaldı.” (sıfat) - “**Bazısı** geç kaldı.” (zamir). “**Herkes** geldi.” herkes yalnızca zamirdir.

## 2. Zarf

Fiilleri, sıfatları ya da başka zarfları **niteleyen veya belirten** sözcüklere zarf (belirteç) denir. Zarflar çekim eki almaz, cümlede yerleri sabittir ve çoğu zaman fiilin hemen önünde bulunur.

| Zarf türü | Sorusu | Örnek |
| --- | --- | --- |
| Durum zarfı | Nasıl? | Çocuk **hızlı** koştu. **Yavaş** konuş. |
| Zaman zarfı | Ne zaman? | **Dün** geldi. **Şimdi** çıkıyor. **Akşam** görüşürüz. |
| Yer-yön zarfı | Nereye? | **İçeri** girdi. **Dışarı** çıktı. **İleri** git. |
| Miktar zarfı | Ne kadar? | **Çok** koştu. **Az** yedi. **Fazla** konuştu. |
| Soru zarfı | Soru sorar | **Nasıl** geldin? **Ne zaman** başlıyor? |

**Zarfın sıfattan farkı:** Aynı sözcük bazen sıfat, bazen zarf olabilir. Nitelediği sözcüğe bak:

- **Hızlı** bir araba geçti. (İsmi niteliyor: sıfat)
- Çocuk **hızlı** koştu. (Fiili niteliyor: zarf)
- **Güzel** bir ev. (Sıfat) - **Güzel** konuştu. (Zarf)

**Zarfın sıfata bağlı kullanılışı:** “**Çok** güzel kız” cümlesinde “çok”, “güzel” sıfatını niteleyen **miktar zarfıdır**. Zarf, sıfatı ya da başka bir zarfı niteleyebilir.

## 3. Zarf ve zamir kafa karışıklıkları

- **“O”:** Bir ismi niteliyorsa sıfat (“o ev”), tek başına isim yerine geçiyorsa zamirdir (“O geldi”). Aynı zamanda kişi zamiridir.
- **“Çok”:** Fiili ya da sıfatı niteliyorsa zarf (“çok koştu”, “çok güzel”), isme gelirse belgisiz sıfattır (“çok insan”).
- **“Hepsi”, “kimi”:** Genellikle zamirdir. “Hep”, “bütün” ise zarf ya da sıfat olabilir.

:::neden-sonuc
- Sözcük bir ismi niteliyor => Sıfattır.
- Sözcük bir ismin yerine geçmiş, ek alabiliyor => Zamirdir.
- Sözcük fiili niteliyor => Zarftır.
- Sözcük sıfatı ya da zarfı niteliyor => Zarftır (miktar zarfı).
:::

:::ipucu{baslik="Sık yapılan hata"}
**“Bu”, “şu”, “o” sözcüklerini her zaman zamir saymak** sık yapılan bir hatadır. “Bu kitap”ta “bu” ismi niteler, işaret sıfatıdır. İsmin yerine geçip tek başına kullanıldığında zamir olur. Bir de “hızlı, güzel, yavaş” gibi sözcüklerin **sıfat mı zarf mı** olduğunu **sözcüğe bakarak** belirlemeye çalışırsın. Önce “bu sözcük neyi niteliyor?” diye sor.
:::

:::baglanti
Zamir ve zarf, “İsim ve Sıfat” konusunun devamıdır: Sıfat ve zamir aynı sözcüğün farklı kullanımlarıdır. “Cümlenin Ögeleri” konusunda zamirler özne ve nesne olarak kullanılır. Zarflar ise genellikle zarf tümleci görevindedir.
:::

## 4. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Zamir | İsim yerine geçer |
| Kişi zamiri | ben, sen, o, biz, siz, onlar |
| İşaret zamiri | bu, şu, o (tek başına) |
| Belgisiz zamir | herkes, kimse, biri, hepsi |
| Zarf | Fiili, sıfatı ya da zarfı niteler |
| Zarf türleri | Durum, zaman, yer-yön, miktar, soru |
| Sıfat-zarf ayrımı | İsmi niteliyorsa sıfat, fiili niteliyorsa zarf |

## Mini test

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **zamir**dir?

- A) **Bu** kitabı çok sevdim.
- B) **Şu** adamı tanıyor musun?
- C) **O** evde kimse yoktu.
- D) **Bunu** sana ben aldım.
- E) **Hangi** yola saptın?

---

1. Zamir, bir ismin yerine geçer ve tek başına kullanılır.
2. “Bunu” sözcüğü bir ismin yerine kullanılmıştır ve nesne ekini almıştır. Zamirdir.
3. Diğer seçeneklerde sözcükler bir ismin önünde onu belirten sıfattır. Doğru cevap D.

Diğer şıklar: ****Bu** kitabı çok sevdim.** “kitap” ismini belirten işaret sıfatı / ****Şu** adamı tanıyor musun?** “adam” ismini belirten işaret sıfatı / ****O** evde kimse yoktu.** “ev” ismini belirten işaret sıfatı / ****Hangi** yola saptın?** “yol” ismini belirten soru sıfatı.
:::

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **zarf** olarak kullanılmıştır?

- A) **Hızlı** bir araba geçti.
- B) **Güzel** bir gün geçirdik.
- C) **Uzun** yoldan geldik.
- D) Çocuk **hızlı** koştu.
- E) **Kırmızı** elmayı sepete koydu.

---

1. Zarf fiili, sıfatı ya da başka bir zarfı niteler.
2. “Hızlı” sözcüğü “koştu” fiilini niteler. Koşmanın nasıl olduğunu söyler.
3. Diğer seçeneklerde sözcükler isimleri niteler, sıfattır. Doğru cevap D.

Diğer şıklar: ****Hızlı** bir araba geçti.** “araba” ismini niteleyen sıfat / ****Güzel** bir gün geçirdik.** “gün” ismini niteleyen sıfat / ****Uzun** yoldan geldik.** “yol” ismini niteleyen sıfat / ****Kırmızı** elmayı sepete koydu.** “elma” ismini niteleyen sıfat.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **zaman zarfı**dır?

- A) Misafirler **içeri** girdi.
- B) Çocuk yoldan **yavaş** yürüdü.
- C) Bu yemek **çok** lezzetli olmuş.
- D) Bu yola **nasıl** vardın?
- E) **Dün** akşam arkadaşlarımla sinemaya gittik.

---

1. Zaman zarfı, eylemin ne zaman yapıldığını bildirir.
2. “Dün” sözcüğü “ne zaman?” sorusuna cevap verir.
3. Diğer seçeneklerdeki zarflar yer, durum, miktar ve soru bildirir. Doğru cevap E.

Diğer şıklar: **Misafirler **içeri** girdi.** yer-yön zarfı / **Çocuk yoldan **yavaş** yürüdü.** durum zarfı / **Bu yemek **çok** lezzetli olmuş.** miktar zarfı / **Bu yola **nasıl** vardın?** soru zarfı.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde **belgisiz zamir** kullanılmıştır?

- A) **Bazı** öğrenciler sınava geç kaldı.
- B) **Hiçbir** çocuk ağlamadı.
- C) **Birkaç** arkadaşımız bize geldi.
- D) **Her** gün erkenden kalkar.
- E) **Herkes** toplantıya zamanında katıldı.

---

1. Belgisiz zamir, belirsiz bir kişi ya da şeyin yerine geçer ve tek başına kullanılır.
2. “Herkes” sözcüğü bir ismi niteleyip belirtmez, kişilerin yerine geçer.
3. Diğer seçeneklerdeki sözcükler bir isimden önce gelir, belgisiz sıfattır. Doğru cevap E.

Diğer şıklar: ****Bazı** öğrenciler sınava geç kaldı.** “öğrenciler” ismini belirten belgisiz sıfat / ****Hiçbir** çocuk ağlamadı.** “çocuk” ismini belirten belgisiz sıfat / ****Birkaç** arkadaşımız bize geldi.** “arkadaşımız” ismini belirten belgisiz sıfat / ****Her** gün erkenden kalkar.** “gün” ismini belirten belgisiz sıfat.
:::

## Kendini dene

:::dene
1. “Bu çocuğu tanıyorum.” cümlesinde “bu” sıfat mı zamir midir? => Sıfat, çünkü “çocuk” ismini belirtiyor.
2. “Bunu sana ben aldım.” cümlesinde “bunu” hangi türdedir? => Zamir, isim yerine kullanılmış.
3. “Dün akşam sinemaya gittik.” cümlesinde “dün” hangi tür zarftır? => Zaman zarfı.
4. “Çocuk yavaş yürüdü.” cümlesinde “yavaş” sıfat mı zarf mıdır? => Zarf, çünkü fiili niteliyor.
5. “Herkes toplantıya katıldı.” cümlesinde “herkes” hangi tür zamirdir? => Belgisiz zamir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-tr' and name = 'Zamir ve Zarf'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Zamir ve türleri (kişi, işaret, belgisiz, soru, dönüşlülük, ilgi), zarf ve türleri (durum, zaman, yer-yön, miktar, soru), zamir-sıfat ve zarf-sıfat ayrımı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: "Hep" ve "bütün" gibi sözcüklerin sıfat ya da zarf sayılması kaynaklara göre değişebilir, metinde yalnızca temkinli ifade kullanıldı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Zamir ve Zarf'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Sınav için çok çalıştı ama istediği sonucu alamadı.” Bu cümlede “için” ve “ama” gibi küçük sözcükler, cümlenin anlamını kurar. İkisi de **tek başına bir varlığı ya da eylemi anlatmaz**, başka sözcükleri birbirine bağlar. Edat, bağlaç ve ünlem, bu işi yapan görev sözcükleridir. Bu konuda üç türü, aralarındaki farkı ve sık karıştırılan sözcükleri öğreneceksin.

:::hedefler
1. Edatın görevini ve başlıca edatları bilmek.
2. Bağlaçları anlam ilişkilerine göre ayırmak.
3. Ünlemleri ve kullanım yerlerini tanımak.
4. “İle” ve “de” gibi sözcüklerin edat ya da bağlaç olduğunu belirlemek.
5. Aynı sözcüğün farklı türlerdeki kullanımını ayırt etmek.
:::

:::ipucu
Edat ile bağlacı ayırmak için **bağladığı şeye** bak. Edat, **bir sözcüğün ya da öbeğin yanında** durur ve onunla birlikte cümlede görev yapar (“ders için”, “sen gibi”). Bağlaç, **eş görevli sözcükleri ya da cümleleri** birbirine bağlar (“Ali ve Ayşe”, “geldi ama yoktu”).
:::

## 1. Edat (ilgeç)

**Tek başına anlamı olmayan, ama başka sözcüklerle ilişki kurarak cümleye anlam katan** sözcüklerdir. Edatlar, bir sözcüğe ya da öbeğe bağlanır ve onunla birlikte cümlenin ögesi olur.

| Edat | Kurduğu ilişki | Örnek |
| --- | --- | --- |
| için | Amaç, neden | Sınav **için** çalıştı. |
| gibi | Benzetme | Kuş **gibi** hafifti. |
| kadar | Eşitlik, sınır | Ali **kadar** uzun. Akşama **kadar** bekledik. |
| ile | Araç, birliktelik | Otobüs **ile** gitti. Arkadaşı **ile** geldi. |
| göre | Karşılaştırma, bakış | Bana **göre** doğru. |
| karşı | Yönelme, zıtlık | Ona **karşı** çok kibardı. |
| rağmen | Karşıtlık | Yağmura **rağmen** çıktı. |
| doğru | Yönelme | Eve **doğru** yürüdü. |
| üzere | Amaç | Sana söylemek **üzere** geldim. |
| beri | Başlangıç | Sabahtan **beri** bekliyorum. |

Edatlar bazen **“-e göre”, “-den dolayı”, “-den başka”** gibi öbeklerle kullanılır.

## 2. Bağlaç

**Eş görevli sözcükleri, söz öbeklerini ve cümleleri bağlayan** sözcüklerdir. Bağlaçlar **anlam ilişkilerine** göre gruplanır:

| Bağlaç türü | Bağlaçlar | Örnek |
| --- | --- | --- |
| Ekleme, sıralama | ve, ile, hem...hem, ayrıca, üstelik, hatta | Ali **ve** Ayşe geldi. **Hem** çalıştı **hem** eğlendi. |
| Karşıtlık | ama, fakat, ancak, lakin, oysa, hâlbuki | Çok çalıştı **ama** başaramadı. |
| Seçenek | ya da, veya, ya...ya, yoksa | Çay **ya da** kahve içebilirsin. |
| Neden-sonuç | çünkü, madem, dolayısıyla | Yorgundu **çünkü** gece uyumamıştı. |
| Açıklama | yani, ki, şöyle ki | Biliyorum **ki** yarın gelecek. |

**Bağlaçların özellikleri:**

- Cümlenin yapısını bozmadan çıkarılabilir ya da değiştirilebilir.
- Başka bir sözcüğü bağlayarak ya da cümleleri birbirine bağlayarak görev yaparlar.
- Çekim eki almazlar.

**“İle” ve “de/da”:**

- **“İle” edat:** Araç ve birliktelik bildirir. “Okula otobüs **ile** gitti.” (araç) “Arkadaşı **ile** geldi.” (birliktelik)
- **“İle” bağlaç:** “Ve” anlamında kullanılır. “Ali **ile** Ayşe parkta buluştu.” (Ali ve Ayşe)
- **“De/da” bağlaç:** “Bile, ayrıca” anlamı taşır ve ayrı yazılır. “Sen **de** gel.”
- **“Ki” bağlaç:** Cümleleri bağlar. “Öyle bir yorgundum **ki**…”

## 3. Ünlem

**Duyguları (sevinç, üzüntü, şaşkınlık, korku, kızgınlık) ya da seslenmeyi** anlatan sözcüklerdir. Ünlemler cümlenin yapısına girmez, **tek başına duygu ya da seslenme anlatır**.

| Ünlem türü | Örnek |
| --- | --- |
| Sevinç | oh, hay hay, yaşasın, bravo |
| Üzüntü | ah, vah, yazık, eyvah |
| Şaşkınlık | ay, aa, hay Allah, vay |
| Korku | aman, eyvah |
| Seslenme | hey, ey, alo, ya |
| Kızgınlık | hey, tüh, öf |

Ünlemler cümlede **virgülle ya da ünlem işaretiyle** ayrılır: “Eyvah, otobüs kaçtı!”

## 4. Sık karıştırılan durumlar

| Durum | Açıklama |
| --- | --- |
| “İçin” edat, “çünkü” bağlaç | “Çalıştığı için başardı” (edat) - “Çalıştı çünkü başarmak istedi” (bağlaç) |
| “Gibi” edat | “Kuş gibi” benzetme. Ek almaz |
| “Kadar” edat | “Ali kadar”, “akşama kadar” |
| “Ama” bağlaç | Karşıtlık. Cümleleri bağlar |
| “Ya” ünlem ya bağlaç | “Ya sen gel ya ben” (bağlaç), “Ya, öyle mi?” (ünlem) |

:::neden-sonuc
- Sözcük başka bir sözcüğün yanında onunla birlikte görev yapıyor => Edattır.
- Sözcük iki cümleyi ya da iki eş görevli sözcüğü bağlıyor => Bağlaçtır.
- Sözcük duygu ya da seslenme bildiriyor ve cümleden ayrı duruyor => Ünlemdir.
- “İle” araç ya da birliktelik bildiriyor => Edattır.
- “İle”, “ve” anlamında kullanılmış => Bağlaçtır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**“İle” sözcüğünü her zaman edat saymak** en sık yapılan hatadır. “Ali ile Ayşe geldi” cümlesinde “ile”, “ve” anlamında bağlaçtır. “Otobüs ile gitti” cümlesinde ise araç bildiren edattır. Bir de “için” ve “çünkü”yü karıştırırsın: “Çünkü” bir cümleyi başka bir cümleye bağlar (bağlaç), “için” ise bir sözcüğe bağlanır (edat).
:::

:::baglanti
Edat, bağlaç ve ünlem, “İsim ve Sıfat”, “Zamir ve Zarf” konularında öğrendiğin türlerden farklı olarak **yalın anlamı olmayan görev sözcükleridir**. “Cümlenin Ögeleri” konusunda edat grubu, zarf tümleci ya da dolaylı tümleç olabilir. “Cümle Türleri”nde bağlaçlar bağlı cümleleri kurar.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Edat | Sözcüğün yanında onunla görev yapar: için, gibi, kadar, ile |
| Bağlaç | Eş görevli ögeleri ya da cümleleri bağlar: ve, ama, çünkü |
| Ünlem | Duygu ve seslenme: ah, eyvah, hey |
| “İle” | Araç, birliktelik edat. “Ve” anlamında bağlaç |
| “Ama, fakat, ancak” | Karşıtlık bağlaçları |
| “Çünkü” | Neden bağlacı |

## Mini test

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **edat**tır?

- A) Çok çalıştı **ama** başaramadı.
- B) Yorgundu **çünkü** gece uyumamıştı.
- C) Elma **veya** armut alalım.
- D) Sınavı kazanmak **için** çok çalıştı.
- E) Çocuk **hem** güldü hem koştu.

---

1. Edat, bir sözcüğün ya da öbeğin yanında onunla birlikte cümlede görev yapar.
2. “Sınavı kazanmak için” öbeğinde “için” amaç bildirir ve bir eylem öbeğine bağlanır. Edattır.
3. Diğer seçeneklerdeki sözcükler cümleleri ya da sözcükleri birbirine bağlar, bağlaçtır. Doğru cevap D.

Diğer şıklar: **Çok çalıştı **ama** başaramadı.** iki cümleyi karşıtlık ilişkisiyle bağlayan bağlaç / **Yorgundu **çünkü** gece uyumamıştı.** iki cümleyi neden ilişkisiyle bağlayan bağlaç / **Elma **veya** armut alalım.** iki sözcüğü seçenek ilişkisiyle bağlayan bağlaç / **Çocuk **hem** güldü hem koştu.** “hem...hem” iki eylemi birbirine bağlayan bağlaç.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde **ünlem** kullanılmıştır?

- A) Yarın okula gideceğiz.
- B) Sen gelmeden önce çıktım.
- C) Çok yorulduğum için erken yattım.
- D) Bu kitabı sana ben verdim.
- E) Eyvah, otobüs kaçtı!

---

1. Ünlem, duyguyu ya da seslenmeyi bildiren ve cümleden ayrı duran sözcüktür.
2. “Eyvah” üzüntü ve telaşı bildirir.
3. Diğer cümlelerde ünlem yoktur. Doğru cevap E.

Diğer şıklar: **Yarın okula gideceğiz.** ünlem içermeyen düz bir cümle / **Sen gelmeden önce çıktım.** ünlem içermeyen düz bir cümle / **Çok yorulduğum için erken yattım.** “için” edat, ünlem yok / **Bu kitabı sana ben verdim.** ünlem içermeyen düz bir cümle.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerin hangisinde **karşıtlık** bildiren bir bağlaç vardır?

- A) Hava soğuktu **ama** biz yine de dışarı çıktık.
- B) Yemek yedi **ve** erkenden uyudu.
- C) Çay **ya da** kahve içebilirsin.
- D) Çok yorulmuştu **çünkü** gece uyuyamamıştı.
- E) **Hem** çalıştı **hem** eğlendi.

---

1. Karşıtlık bağlaçları: ama, fakat, ancak, lakin, oysa.
2. “Ama”, soğuk havaya karşın dışarı çıkıldığını söyler.
3. Diğer bağlaçlar ekleme, seçenek ve neden bildirir. Doğru cevap A.

Diğer şıklar: **Yemek yedi **ve** erkenden uyudu.** “ve” ekleme, sıralama bildirir / **Çay **ya da** kahve içebilirsin.** “ya da” seçenek bildirir / **Çok yorulmuştu **çünkü** gece uyuyamamıştı.** “çünkü” neden bildirir / ****Hem** çalıştı **hem** eğlendi.** “hem...hem” ekleme bildirir.
:::

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde “ile” **bağlaç** olarak kullanılmıştır?

- A) Okula otobüs **ile** gitti.
- B) Ali **ile** Ayşe parkta buluştu.
- C) Kardeşi **ile** sinemaya gitti.
- D) Rüzgâr **ile** birlikte yağmur başladı.
- E) Mektubu elinde bir kalem **ile** yazdı.

---

1. “İle” sözcüğü “ve” anlamında iki ismi bağlıyorsa bağlaçtır.
2. “Ali ile Ayşe” öbeği “Ali ve Ayşe” anlamındadır.
3. Diğer seçeneklerde “ile” araç ya da birliktelik bildirir, edattır. Doğru cevap B.

Diğer şıklar: **Okula otobüs **ile** gitti.** araç bildiren edat / **Kardeşi **ile** sinemaya gitti.** birliktelik bildiren edat / **Rüzgâr **ile** birlikte yağmur başladı.** birliktelik bildiren edat / **Mektubu elinde bir kalem **ile** yazdı.** araç bildiren edat.
:::

## Kendini dene

:::dene
1. “Sınav için çalıştı.” cümlesinde “için” hangi türdür? => Edat.
2. “Çok çalıştı ama başaramadı.” cümlesinde “ama” hangi türdür? => Karşıtlık bağlacı.
3. “Eyvah, otobüs kaçtı!” cümlesinde “eyvah” hangi türdür? => Ünlem.
4. “Ali ile Ayşe geldi.” cümlesinde “ile” hangi türdür? => Bağlaç, “ve” anlamında.
5. “Okula otobüs ile gitti.” cümlesinde “ile” hangi türdür? => Edat, araç bildiriyor.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tr' and name = 'Edat, Bağlaç, Ünlem'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Edat, bağlaç ve ünlem, bağlaç türleri, "ile", "de" ve "ki" sözcüklerinin görevleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Edat listesi ve ünlem türleri tablosu örnekleyicidir, eksiksiz değildir. "Hem ... hem" bağlaç sayıldı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Edat, Bağlaç, Ünlem'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Yarın sabah erkenden yola çıkıyoruz.” cümlesinde fiil “çıkıyoruz”dur. Şimdiki zaman ekiyle çekimlenmiştir ama anlamı gelecektir. Türkçede fiil, **iş, oluş ve durum bildiren** ve cümlenin yüklemini çoğu zaman oluşturan sözcüktür. Kip ve zaman ekleri, kişi ekleri ve ek fiil, cümlenin ne zaman, kim tarafından ve hangi kesinlikte söylendiğini belirler. Bu konuda fiilin anlam türlerini, kipleri, birleşik zamanlı fiilleri ve ek fiili öğreneceksin.

:::hedefler
1. Fiilin anlamına göre (iş, oluş, durum) türlerini ayırt etmek.
2. Haber ve dilek kiplerini tanımak.
3. Birleşik zamanlı fiilleri (hikâye, rivayet, şart) belirlemek.
4. Ek fiilin görevini ve çekimlerini bilmek.
5. Kipin bildirdiği zaman ile cümlenin anlamındaki zamanı karşılaştırmak.
:::

:::ipucu
Kip sorularında önce **fiil kökünü bul**, sonra **kip ekini ayır**. Eylemi çekim eklerinden sıyırınca ne kaldığına bak: “çalış-ı-yor-du”: kök çalış, şimdiki zaman eki -yor, hikâye eki -du. Zaman anlamı sorulursa **cümlenin anlamına** bak, ekin görüntüsüne değil.
:::

## 1. Fiilin anlam özellikleri

Fiiller **anlamlarına göre** üç gruba ayrılır:

| Tür | Anlamı | Örnek |
| --- | --- | --- |
| İş (kılış) fiili | Özne bilinçli bir iş yapar | koşmak, yazmak, okumak |
| Oluş fiili | Özne bilinçsiz bir değişime uğrar | solmak, kurumak, erimek |
| Durum fiili | Bir varlığın bulunduğu hâli bildirir | yatmak, durmak, oturmak |

**Olumlu ve olumsuz fiil:** Olumsuz fiil “-me/-ma” ekiyle yapılır (gelme, yazma). Soru eki “mi” ise fiilin sonuna ayrı yazılarak gelir (geldi mi?).

## 2. Kipler

**Haber kipleri**, işin ya da oluşun bir zamana bağlı olarak bildirildiği kiplerdir.

| Kip | Eki | Örnek |
| --- | --- | --- |
| Görülen geçmiş zaman | -dı, -di, -du, -dü, -tı, -ti... | gel-**di** |
| Öğrenilen geçmiş zaman | -mış, -miş, -muş, -müş | gel-**miş** |
| Şimdiki zaman | -yor | gel-**iyor** |
| Gelecek zaman | -acak, -ecek | gel-**ecek** |
| Geniş zaman | -r, -ar, -er, -ir, -ır | gel-**ir**, yaz-**ar** |

**Dilek kipleri**, işin bir zamana bağlı olmayıp bir dilek, istek, gereklilik ya da şart olarak bildirildiği kiplerdir.

| Kip | Eki | Örnek |
| --- | --- | --- |
| İstek kipi | -a, -e | gel-**e**-yim, yaz-**a**-lım |
| Gereklilik kipi | -malı, -meli | gel-**meli**-yim |
| Dilek-şart kipi | -sa, -se | gel-**se**-m |
| Emir kipi | Kök ya da -sın, -sin | gel, gel-**sin** |

## 3. Birleşik zamanlı fiiller

Bir basit kipe **ek fiilin (i-) hikâye, rivayet ya da şart** çekimi eklenir:

| Birleşik zaman | Yapı | Örnek |
| --- | --- | --- |
| Hikâye | Basit kip + -di | gel-iyor-**du**, gel-miş-**ti**, gel-ecek-**ti** |
| Rivayet | Basit kip + -miş | gel-iyor-**muş**, gel-ecek-**miş**, gel-se-**ymiş** |
| Şart | Basit kip + -se | gel-iyor-**sa**, gel-ecek-**se**, gel-miş-**se** |

**Örnek:** “Akşama kadar ders çalışıyordu.” cümlesinde yüklem “çalışıyordu”: çalış (kök) + -ıyor (şimdiki zaman) + -du (hikâye). Bu, **birleşik zamanlı** bir fiildir (şimdiki zamanın hikâyesi).

## 4. Ek fiil

**Ek fiil (i-)**, isim soylu sözcükleri (isim, sıfat, zamir, zarf) **yüklem yapan** ya da fiillere birleşik zaman anlamı katan bir eylemdir. Yazıda genellikle ek olarak görünür:

| Çekim | Örnek |
| --- | --- |
| Bildirme (-dir) | Öğrenci**dir**. Çalışkan**dır**. |
| Hikâye (-di) | Öğrenci**ydi**. Hasta**ydı**. |
| Rivayet (-miş) | Öğrenci**ymiş**. Hasta**ymış**. |
| Şart (-se) | Öğrenci**yse**. Hasta**ysa**. |

**Ek fiilin işlevi:** “Ali çalışkan.” cümlesi yüklem içermez gibi görünür ama “Ali çalışkan(dır)” anlamında ek fiilin gizli olduğu bir yüklemdir.

## 5. Kipin zamanı ile anlamın zamanı

Bir fiil, kip ekinin bildirdiği zamandan **başka bir zaman anlamı** taşıyabilir. Bu duruma **zaman kayması** denir.

- **Yarın sabah erkenden yola çıkıyoruz.** Şimdiki zaman kipi, gelecek zaman anlamı.
- **Gelecek hafta sınava giriyorum.** Şimdiki zaman kipi, gelecek zaman anlamı.

**Geniş zaman** kayma değildir. Her zaman geçerli durumları ve alışkanlıkları anlatmak onun kendi görevidir: “Su yüz derecede kaynar.” “Her sabah yürüyüşe çıkar.”

Cümlede **zaman zarfı** (yarın, dün, şimdi) varsa fiilin zamanı büyük ölçüde onunla belirlenir.

:::neden-sonuc
- Fiil -dı ekiyle çekimlenmiş => Görülen geçmiş zaman.
- Fiil -iyor ekiyle çekimlenmiş ama “yarın” sözcüğü var => Şimdiki zaman kipiyle gelecek anlamı.
- Fiilin sonunda hem kip hem -di eki var => Hikâye birleşik zamanı.
- İsim soylu sözcük yüklem olmuş => Ek fiil görev yapıyor.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Kip ekiyle zamanı aynı sanmak** en sık yapılan hatadır. “Yarın geliyorum” cümlesinde fiil şimdiki zaman kipindedir ama anlamı gelecektir. Ayrıca “geldi” (görülen geçmiş, basit zaman) ile “gelmişti” (öğrenilen geçmişin hikâyesi, birleşik zaman) arasındaki farkı karıştırırsın. Basit zamanda tek kip eki, birleşik zamanda kip ekinden sonra bir ek fiil çekimi vardır.
:::

:::baglanti
Fiiller konusu “Fiilimsiler”, “Fiil Çatısı” ve “Cümlenin Ögeleri” konularıyla doğrudan ilişkilidir. Yüklem, cümlenin en önemli ögesidir ve fiilin ya da ek fiilin biçimine göre belirlenir. “Cümle Türleri”nde yüklemin türüne göre cümleler fiil cümlesi ve isim cümlesi olarak ikiye ayrılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Fiil türleri | İş, oluş, durum |
| Haber kipleri | -di, -miş, -yor, -ecek, -r |
| Dilek kipleri | -e, -meli, -se, emir |
| Birleşik zaman | Basit kip + -di, -miş ya da -se |
| Ek fiil | İsim soylu sözcüğü yüklem yapar |
| Zaman kayması | Kip ile anlamdaki zaman farklıdır |

## Mini test

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde **dilek-şart kipiyle** çekimlenmiş bir fiil vardır?

- A) Erkenden uyanıp hemen yola çıktık.
- B) Yarın sabah sana uğrayacağım.
- C) Çocuklar bahçede top oynuyor.
- D) Her sabah gazete okur.
- E) Ders çalışsan sınavı rahatça kazanırsın.

---

1. Dilek-şart kipi -sa/-se ekiyle yapılır ve bir koşul bildirir.
2. “Çalışsan” sözcüğündeki -san, dilek-şart kipi ve kişi ekidir: Çalışırsan sınavı kazanırsın.
3. Diğer seçeneklerde görülen geçmiş, gelecek, şimdiki ve geniş zaman kipleri vardır. Doğru cevap E.

Diğer şıklar: **Erkenden uyanıp hemen yola çıktık.** fiil görülen geçmiş zaman kipinde / **Yarın sabah sana uğrayacağım.** fiil gelecek zaman kipinde / **Çocuklar bahçede top oynuyor.** fiil şimdiki zaman kipinde / **Her sabah gazete okur.** fiil geniş zaman kipinde.
:::

:::soru{cevap="C"}
Aşağıdaki cümlelerin hangisinde yüklemin **kipinin bildirdiği zaman ile cümlenin anlamındaki zaman farklıdır**?

- A) Dün akşam sinemaya **gittik**.
- B) Şu anda ders **çalışıyorum**.
- C) Yarın sabah erkenden yola **çıkıyoruz**.
- D) Geçen yıl Ankara’ya **taşındık**.
- E) Her sabah yürüyüşe **çıkar**.

---

1. “Çıkıyoruz” sözcüğü şimdiki zaman kipindedir.
2. “Yarın” sözcüğü işin gelecekte yapılacağını gösterir. Kip ile anlam arasında zaman kayması vardır.
3. Diğer cümlelerde kip ile anlam uyumludur. Doğru cevap C.

Diğer şıklar: **Dün akşam sinemaya **gittik**.** görülen geçmiş kipi, geçmiş zaman anlamıyla uyumlu / **Şu anda ders **çalışıyorum**.** şimdiki zaman kipi, şimdiki zaman anlamıyla uyumlu / **Geçen yıl Ankara’ya **taşındık**.** görülen geçmiş kipi, geçmiş zaman anlamıyla uyumlu / **Her sabah yürüyüşe **çıkar**.** geniş zaman kipi, alışkanlık anlamıyla uyumlu.
:::

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde **ek fiilin rivayet çekimi** kullanılmıştır?

- A) Ali, çok çalışkan bir öğrenciydi.
- B) Ali, çok çalışkan bir öğrenciyse sınavı kazanır.
- C) Ali, çok çalışkan bir öğrencidir.
- D) Ali, çok çalışkan bir öğrenciymiş.
- E) Ali, çok çalışkan olacak.

---

1. Ek fiilin rivayet çekimi -ymiş/-miş ekidir ve duyulan, sonradan öğrenilen bir durumu bildirir.
2. “Öğrenciymiş” yüklemindeki -ymiş eki rivayet çekimidir.
3. Diğer seçeneklerde hikâye, şart, bildirme ve gelecek zaman vardır. Doğru cevap D.

Diğer şıklar: **Ali, çok çalışkan bir öğrenciydi.** ek fiilin hikâye çekimi / **Ali, çok çalışkan bir öğrenciyse sınavı kazanır.** ek fiilin şart çekimi / **Ali, çok çalışkan bir öğrencidir.** ek fiilin bildirme çekimi / **Ali, çok çalışkan olacak.** gelecek zaman, ek fiil yok.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerin hangisinde yüklem **birleşik zamanlı** bir fiildir?

- A) Akşama kadar ders **çalışıyordu**.
- B) Çocuklar bahçede **oynuyor**.
- C) Yarın erkenden yola **çıkacağız**.
- D) Sen de bizimle **gel**.
- E) Her sabah gazete **okur**.

---

1. Birleşik zamanlı fiil, basit bir kipe ek fiil çekimi eklenerek oluşur.
2. “Çalışıyordu”: çalış (kök) + -ıyor (şimdiki zaman) + -du (hikâye).
3. Diğer yüklemler tek kip eki taşır, basit zamanlıdır. Doğru cevap A.

Diğer şıklar: **Çocuklar bahçede **oynuyor**.** yalnızca şimdiki zaman, basit zaman / **Yarın erkenden yola **çıkacağız**.** yalnızca gelecek zaman, basit zaman / **Sen de bizimle **gel**.** emir kipi, basit / **Her sabah gazete **okur**.** yalnızca geniş zaman, basit zaman.
:::

## Kendini dene

:::dene
1. “Geldi” fiili hangi kiptedir? => Görülen geçmiş zaman.
2. “Çalışmalıyım” fiili hangi kiptedir? => Gereklilik kipi.
3. “Gelseydi” fiilinde hangi birleşik zaman vardır? => Dilek-şart kipinin hikâyesi.
4. “Öğrenciymiş” sözcüğündeki “-ymiş” nedir? => Ek fiilin rivayet çekimi.
5. “Yarın sana uğruyorum.” cümlesinde kip ile anlam arasında nasıl bir fark vardır? => Şimdiki zaman kipi, gelecek zaman anlamı verir.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tr' and name = 'Fiiller ve Ek Fiil'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fiilin anlam özellikleri, olumlu ve olumsuz fiil, haber ve dilek kipleri, birleşik zamanlı fiiller, ek fiil, kip ile zaman anlamı ilişkisi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Üçüncü soruda "öğrenciymiş" ek fiilin rivayeti kabul edildi. Kip adları kaynaklara göre farklı yazılabilir (örneğin "geniş zaman" yerine "aorist").$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Fiiller ve Ek Fiil'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Gelen misafirleri karşıladık.” cümlesinde “gelen” sözcüğü bir fiil kökünden gelir ama cümlede **fiil gibi değil, sıfat gibi** davranır: “misafirleri” niteler. “Gezmek bana iyi geliyor.” cümlesinde “gezmek” fiil kökünden gelir ama **isim gibi** özne olmuştur. Bu sözcüklere **fiilimsi (eylemsi)** denir. Fiilimsiler fiil kökünden türer, fiil gibi çekim eki almaz, cümlede isim, sıfat ya da zarf görevi yapar. Bu konuda üç fiilimsi türünü ve onları ayıran ölçütleri öğreneceksin.

:::hedefler
1. İsim-fiil, sıfat-fiil ve zarf-fiil eklerini tanımak.
2. Bir fiilimsinin cümledeki görevini belirlemek.
3. Fiilimsi ile çekimli fiili ayırt etmek.
4. Fiilimsi eklerini yapım eklerinden ayırmak.
5. Fiilimsi içeren cümlelerin yüklemini bulmak.
:::

:::ipucu
Fiilimsi sorusunda sözcüğün **cümlede hangi görevi yaptığına** bak. İsim gibi özne ya da nesne olmuşsa isim-fiil, bir ismi niteliyorsa sıfat-fiil, yüklemi niteliyor ya da cümleyi zamana, duruma bağlıyorsa zarf-fiildir.
:::

## 1. Fiilimsi nedir?

Fiil kök ve gövdelerine getirilen bazı eklerle yapılan, **fiil gibi çekimlenmeyip isim, sıfat ya da zarf görevi yapan** sözcüklere fiilimsi denir. Fiilimsi cümlenin yüklemi olamaz (yüklem olabilmesi için ek fiil gerekir).

| Fiilimsi türü | Görevi | Örnek |
| --- | --- | --- |
| İsim-fiil | İsim gibi kullanılır | **Gezmek** bana iyi geliyor. |
| Sıfat-fiil | Sıfat gibi kullanılır | **Gelen** misafirleri karşıladık. |
| Zarf-fiil | Zarf gibi kullanılır | Eve **gelince** haber verdi. |

## 2. İsim-fiil

Fiil kökünden isim türeterek **işi ya da oluşu isim hâlinde** gösterir. İsim gibi çekim eki alabilir, özne, nesne, tamlayan gibi görevlerde bulunabilir.

| Ek | Örnek |
| --- | --- |
| -mak, -mek | **Gezmek** bana iyi geliyor. Okumak güzeldir. |
| -ma, -me | **Okuma** alışkanlığı kazandı. Yazma işini bitirdi. |
| -ış, -iş, -uş, -üş | **Yazış** biçimini beğenmedim. Bakış açısı değişti. |

Örnek cümle: “**Sabahları erken kalkmak** zor geliyor.” İsim-fiil grubu, cümlenin öznesidir.

## 3. Sıfat-fiil

Fiil kökünden sıfat türeterek **bir ismi niteler**. Sıfat-fiil bir isimden önce gelir ve onu belirtir. İsim düşerse sıfat-fiil adlaşır, isim gibi ek alır.

| Ek | Örnek |
| --- | --- |
| -an, -en | **Gelen** misafir, **çalan** kişi |
| -ası, -esi | **Gelesi** yıl, **görülesi** yer |
| -dık, -dik, -duk, -dük | **Okuduğum** kitap, **yaptığı** iş |
| -ecek, -acak | **Gelecek** hafta, **yapılacak** iş |
| -mış, -miş, -muş, -müş | **Yorulmuş** çocuk, **solmuş** çiçek |
| -mez, -maz | **Bitmez** tükenmez, **kurumaz** çiçek |
| -ar, -er, -ır, -ir | **Okur** yazar, **gider** ayak |

**Ölçü:** Sıfat-fiilin nitelediği isim cümlede bulunmalıdır. “**Çalışan** kişiyi gördüm.” cümlesinde “çalışan”, “kişi”yi niteler: sıfat-fiil.

## 4. Zarf-fiil

Fiil kökünden zarf türeterek **yüklemi niteler ya da cümleyi zaman, durum, neden gibi bir anlamla bağlar**. Cümleye zarf görevi katar.

| Ek | Anlam | Örnek |
| --- | --- | --- |
| -ıp, -ip, -up, -üp | Ardışıklık, birliktelik | Kalkıp gitti. |
| -arak, -erek | Durum, yol | Okuyarak öğrendi. |
| -ınca, -ince, -unca, -ünce | Zaman | Eve gelince haber verdi. |
| -dıkça, -dikçe | Süreklilik | Okudukça öğreniyor. |
| -madan, -meden | Olumsuzluk, zaman | Bakmadan geçti. |
| -ken | Eşzamanlılık | Eve gelirken süt aldım. |
| -a...-a, -ar...-maz | Süreklilik, ardışıklık | Koşa koşa geldi. Gelir gelmez uyudu. |
| -alı, -eli | Başlangıç | Geleli iki gün oldu. |

Zarf-fiil, yüklemin hemen yanında bulunur ve “nasıl, ne zaman, hangi yolla” sorularına cevap verir.

## 5. Fiilimsi ile çekimli fiil ve eklerin karışımı

**Çekimli fiil** kip ve kişi eki alır, cümlenin yüklemi olabilir: “Gel-di-m”. **Fiilimsi** kip ve kişi eki almaz: “Gelen”, “gelmek”, “gelince”. Ek fiil alırsa yüklem olabilir: “Bu iş okumaktır.”

**Karışabilen sözcükler:**

- “**Gelecek**”: “Gelecek hafta” (sıfat-fiil), “O yarın gelecek” (gelecek zaman çekimi, yüklem).
- “**Okuma**”: “Okuma alışkanlığı” (isim-fiil), “Kitabı okuma” (emir kipinin olumsuzu).

:::neden-sonuc
- Sözcük fiil kökünden türemiş, isim gibi özne ya da nesne => İsim-fiildir.
- Sözcük fiil kökünden türemiş, bir ismi niteliyor => Sıfat-fiildir.
- Sözcük fiil kökünden türemiş, yüklemi niteliyor ya da cümleyi zamana bağlıyor => Zarf-fiildir.
- Sözcük kip ve kişi eki almış, cümlenin yüklemi => Çekimli fiildir, fiilimsi değildir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Fiilimsiyi yüklem sanmak** en sık yapılan hatadır. “Gelen misafirleri karşıladık” cümlesinde yüklem “karşıladık”tır, “gelen” değildir. Ayrıca “-ma” ekini her zaman olumsuzluk eki sanma: “Okuma alışkanlığı”nda isim-fiildir. “Okuma!” cümlesinde ise emir kipinin olumsuzudur. Önce sözcüğün cümledeki **görevine** bak.
:::

:::baglanti
Fiilimsiler, “Fiiller ve Ek Fiil” konusunda öğrendiğin çekimli fiillerden farklı olarak çekimlenmez. “Cümlenin Ögeleri” konusunda fiilimsi grupları özne, nesne ya da zarf tümleci olabilir. “Cümle Türleri”nde ise fiilimsi içeren cümleler **birleşik cümle** türünü oluşturur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İsim-fiil | -mak, -ma, -ış: isim gibi |
| Sıfat-fiil | -an, -dık, -ecek, -mış: ismi niteler |
| Zarf-fiil | -ıp, -arak, -ınca, -ken: yüklemi niteler |
| Yüklem | Fiilimsi yüklem olmaz |
| Çekimli fiil | Kip ve kişi eki alır |

## Mini test

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **isim-fiil**dir?

- A) **Gelen** misafirleri kapıda karşıladık.
- B) Sabahları erken **kalkmak** zor geliyor.
- C) Ders **çalışarak** başarılı oldu.
- D) Eve **gelince** bana haber verdi.
- E) **Okuduğum** kitabı çok sevdim.

---

1. İsim-fiil, fiil kökünden türer ve cümlede isim gibi kullanılır.
2. “Kalkmak” sözcüğü cümlenin öznesidir. Fiil kökünden gelir ve isim görevindedir.
3. Diğer seçeneklerde sıfat-fiil ve zarf-fiil vardır. Doğru cevap B.

Diğer şıklar: ****Gelen** misafirleri kapıda karşıladık.** “misafir” ismini niteleyen sıfat-fiil / **Ders **çalışarak** başarılı oldu.** yüklemi niteleyen zarf-fiil / **Eve **gelince** bana haber verdi.** cümleyi zamana bağlayan zarf-fiil / ****Okuduğum** kitabı çok sevdim.** “kitap” ismini niteleyen sıfat-fiil.
:::

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde **zarf-fiil** vardır?

- A) Kapıyı çalan kişiyi tanımadım.
- B) Ali, derse hazırlanarak sınava girdi.
- C) Gezmeyi çok severim.
- D) Okuduğum kitap çok güzeldi.
- E) Çalışmayan öğrenci başarısız olur.

---

1. Zarf-fiil, yüklemi niteleyen ya da cümleyi zamana, duruma bağlayan fiilimsidir.
2. “Hazırlanarak” sözcüğündeki -arak eki zarf-fiil ekidir ve “girdi” yüklemini niteler.
3. Diğer seçeneklerde isim-fiil ve sıfat-fiil bulunur. Doğru cevap B.

Diğer şıklar: **Kapıyı çalan kişiyi tanımadım.** “çalan” sıfat-fiil, zarf-fiil yok / **Gezmeyi çok severim.** “gezmeyi” isim-fiil, zarf-fiil yok / **Okuduğum kitap çok güzeldi.** “okuduğum” sıfat-fiil, zarf-fiil yok / **Çalışmayan öğrenci başarısız olur.** “çalışmayan” sıfat-fiil, zarf-fiil yok.
:::

:::soru{cevap="C"}
Aşağıdaki cümlelerin hangisinde koyu yazılan sözcük **sıfat-fiil**dir?

- A) **Gezmek** bana çok iyi geliyor.
- B) Ders **çalışarak** başarılı oldu.
- C) Kapıyı **çalan** kişiyi tanımadım.
- D) Eve **gelirken** süt aldım.
- E) Onun **yazış** biçimini beğenmedim.

---

1. Sıfat-fiil, fiil kökünden türer ve bir ismi niteler.
2. “Çalan”, “kişi” ismini niteler. Kişiyi tanımlar.
3. Diğer seçeneklerde isim-fiil ve zarf-fiil vardır. Doğru cevap C.

Diğer şıklar: ****Gezmek** bana çok iyi geliyor.** özne olan isim-fiil / **Ders **çalışarak** başarılı oldu.** yüklemi niteleyen zarf-fiil / **Eve **gelirken** süt aldım.** yüklemi niteleyen zarf-fiil / **Onun **yazış** biçimini beğenmedim.** “biçim” isminin tamlayanı olan isim-fiil.
:::

:::soru{cevap="C"}
“**Gelecek** hafta sınava gireceğiz.” cümlesindeki koyu yazılan “gelecek” sözcüğü hangi türdedir?

- A) İsim-fiil
- B) Zarf-fiil
- C) Sıfat-fiil
- D) Gelecek zaman çekimli fiil
- E) Ek fiil

---

1. “Gelecek” sözcüğü “hafta” ismini niteliyor.
2. Fiil kökünden türemiş ve isim niteleyen sözcüktür, sıfat-fiildir.
3. Cümlenin yüklemi “gireceğiz”dir. Doğru cevap C.

Diğer şıklar: **İsim-fiil** özne ya da nesne görevinde değil, “hafta”yı niteliyor / **Zarf-fiil** yüklemi değil, “hafta” ismini niteliyor / **Gelecek zaman çekimli fiil** yüklem değil, kişi eki almamış ve ismi niteliyor / **Ek fiil** ek fiil çekimi almamış, ismi niteleyen sıfat-fiil.
:::

## Kendini dene

:::dene
1. “Yürümek sağlığa yararlıdır.” cümlesindeki “yürümek” hangi fiilimsidir? => İsim-fiil.
2. “Açılan kapıdan içeri girdi.” cümlesindeki “açılan” hangi fiilimsidir? => Sıfat-fiil.
3. “Koşarak eve geldi.” cümlesindeki “koşarak” hangi fiilimsidir? => Zarf-fiil.
4. “Eve gelince seni arayacağım.” cümlesindeki “gelince” hangi fiilimsidir? => Zarf-fiil.
5. “Okuduğum kitap çok güzeldi.” cümlesindeki “okuduğum” hangi fiilimsidir? => Sıfat-fiil.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tr' and name = 'Fiilimsiler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fiilimsiler (isim-fiil, sıfat-fiil, zarf-fiil), ekleri, cümledeki görevleri, çekimli fiille ayrımı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Ek listelerinde "-ası" gibi seyrek kullanılanlar da yer aldı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Fiilimsiler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Ali kapıyı açtı.” ile “Kapı açıldı.” cümleleri aynı olayı anlatır ama işi yapan özneyi farklı gösterir: İlkinde işi **Ali yapmıştır**, ikincisinde ise işi yapan **belli değildir**. Fiil çatısı, fiilin **özneyle ve nesneyle ilişkisini** gösterir. TYT’de çatı sorularının temeli iki sorudur: Özne işi yapıyor mu? Fiil nesne alıyor mu? Bu konuda özneye ve nesneye göre fiil çatılarını, çatı eklerini ve çatıyı belirleme yöntemini öğreneceksin.

:::hedefler
1. Fiili özneye göre etken, edilgen, dönüşlü ve işteş olarak sınıflandırmak.
2. Fiili nesneye göre geçişli, geçişsiz, ettirgen ve oldurgan olarak sınıflandırmak.
3. Çatı eklerini tanımak.
4. Bir cümlede özneyi ve nesneyi belirleyerek fiil çatısını bulmak.
5. Çatı değişimlerini uygulamak.
:::

:::ipucu
Çatı sorusunda önce **“özne işi yapıyor mu, yapan belli mi?”** sorusunu sor. Sonra **“fiil nesne alıyor mu?”** sorusunu sor. Bu iki sorunun cevabı çatıyı büyük ölçüde belirler. Fiilin üzerine gelen eke bakmak yeterli olmaz, cümlenin anlamına da bak.
:::

## 1. Özneye göre fiil çatısı

**Etken çatı:** Özne **işi kendisi yapar**. Yüklemde çatı eki yoktur (ya da ettirgen eki dışında bir çatı eki yoktur). Nesne alabilir ya da almayabilir.

- Ali kapıyı **açtı**. (Özne “Ali”, işi yapan)
- Çocuk **uyudu**.

**Edilgen çatı:** İşi yapan **belli değildir ya da önemli değildir**. Özne, işi yapan değil işten etkilenendir. **-ıl, -il, -ul, -ül** ve **-ın, -in, -un, -ün** ekleriyle yapılır.

- Kapı **açıldı**. (Kimin açtığı belli değil)
- Mektup **yazıldı**.

**Dönüşlü çatı:** Özne **işi kendi üzerine yapar**, iş öznenin kendisini etkiler. **-ın, -in, -un, -ün** ekiyle yapılır.

- Çocuk **yıkandı**. (Kendini yıkadı)
- Ali **giyindi**. (Kendini giydirdi)

**İşteş çatı:** İş **birden çok kişi tarafından birlikte ya da karşılıklı** yapılır. **-ış, -iş, -uş, -üş** ekiyle yapılır.

- İki arkadaş **kucaklaştı**. (Karşılıklı)
- Çocuklar **koşuştu**. (Birlikte)

| Çatı | Ek | Özne durumu | Örnek |
| --- | --- | --- | --- |
| Etken | Yok | İşi yapan | Ali kapıyı açtı. |
| Edilgen | -ıl, -ın | İşten etkilenen, yapan belli değil | Kapı açıldı. |
| Dönüşlü | -ın | İşi kendisine yapan | Ali yıkandı. |
| İşteş | -ış | İşi karşılıklı ya da birlikte yapan | Arkadaşlar kucaklaştı. |

## 2. Nesneye göre fiil çatısı

**Geçişli fiil:** Nesne alan, yani **“neyi, kimi?”** sorusuna cevap verilebilen fiildir.

- Ali kitabı **okudu**. (Neyi okudu? Kitabı)
- Anne sofrayı **hazırladı**.

**Geçişsiz fiil:** Nesne almayan, **“neyi, kimi?”** sorusuna cevap verilemeyen fiildir.

- Çocuk **uyudu**. (Neyi uyudu? Cevap yok)
- Ali sabah **kalktı**.

**Ettirgen fiil:** İşi **başkasına yaptırmayı** bildirir. **-dır, -tır, -t, -ır, -ar, -it** ekleriyle yapılır.

- Terziye pantolonunu **kısalttırdı**. (Kısalt-tır-dı)
- Ali yemeği **pişirtti**.

**Oldurgan fiil:** Geçişsiz fiili **geçişli yapan** fiildir. Çatı ekleri aynıdır.

- Çocuğu **uyuttu**. (uyu-t-tu: Geçişsiz fiil geçişli oldu)
- Yaprağı **soldurdu**. (sol-dur-du: Geçişsiz fiil geçişli oldu)

| Çatı | Soru | Örnek |
| --- | --- | --- |
| Geçişli | Neyi, kimi? | Kitabı okudu. |
| Geçişsiz | (Cevap yok) | Çocuk uyudu. |
| Ettirgen | Kime yaptırdı? | Terziye kısalttırdı. |
| Oldurgan | Geçişsizi geçişli yapar | Çocuğu uyuttu. |

## 3. Çatıyı belirleme adımları

**Adım 1:** Cümlenin yüklemini ve öznesini bul.
**Adım 2:** Özne işi yapıyor mu? Yapıyorsa etken. Yapmıyorsa ve yapan belli değilse edilgen. Kendi üzerine ise dönüşlü. Birden çok kişi ise işteş.
**Adım 3:** Fiil nesne alıyor mu? Alıyorsa geçişli. Almıyorsa geçişsiz.
**Adım 4:** Fiil başkasına yaptırılıyorsa ettirgen, geçişsizi geçişli yapıyorsa oldurgan.

**Örnek:** “Ali, terziye pantolonunu kısalttırdı.”

- Özne: Ali. İşi yaptıran özne olduğu için etken.
- Nesne: Pantolonunu (neyi?). Geçişli.
- Fiilde -tır eki var. Ettirgen.

## 4. Çatı eklerinin karışabildiği durumlar

- **-ın** hem edilgen hem dönüşlü olabilir. Anlama bak: “Mektup yazıldı” edilgen, “Çocuk yıkandı” dönüşlü (kendini yıkadı). “Çamaşır yıkandı” ise edilgendir, çünkü çamaşır kendini yıkamaz.
- Çatı eki almayan fiil **etken**dir. Etken fiil nesne alabilir (geçişli) ya da almayabilir (geçişsiz).
- Bir cümlede **birden fazla çatı eki** bulunabilir: “yaz-dır-ıl-dı” (ettirgen ve edilgen). Çatıyı **son ek** belirler.

:::neden-sonuc
- İşi yapan özne ve belli => Etken.
- İşi yapan belli değil, özne işten etkileniyor => Edilgen.
- Özne işi kendi üzerine yapıyor => Dönüşlü.
- Özneler işi karşılıklı ya da birlikte yapıyor => İşteş.
- Fiil nesne alıyor => Geçişli.
- İş başkasına yaptırılıyor => Ettirgen.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Edilgen ile dönüşlüyü karıştırmak** en sık yapılan hatadır. İkisi de -ın ekiyle yapılabilir. “Çocuk yıkandı” (kendini yıkadı) dönüşlüdür. “Çamaşır yıkandı” (biri yıkadı) edilgendir. Bir de **özneyi nesneyle karıştırırsın**: Edilgen cümlede özne işi yapmaz, işten etkilenir, bu yüzden nesne almaz.
:::

:::baglanti
Fiil çatısı, “Cümlenin Ögeleri” konusunda özne ve nesneyi belirlemenin bir yoludur. Edilgen cümlede özne işi yapan değildir, bu da cümlenin yapısını etkiler. “Cümle Türleri”nde de yüklemin çatısı cümlenin yorumlanmasında kullanılır.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Etken | Özne işi yapar |
| Edilgen | İşi yapan belli değil, -ıl, -ın |
| Dönüşlü | İşi kendi üzerine yapar, -ın |
| İşteş | Karşılıklı ya da birlikte, -ış |
| Geçişli | Neyi, kimi? sorusuna cevap verir |
| Geçişsiz | Nesne almaz |
| Ettirgen | İşi yaptırır, -dır, -t |

## Mini test

:::soru{cevap="A"}
Aşağıdaki cümlelerin hangisinde yüklem **edilgen** çatılıdır?

- A) Kapı yavaşça açıldı.
- B) Ali, yüzünü sabunla yıkadı.
- C) Çocuk sabahları erkenden kalkar.
- D) Ayşe ile Ali sokakta tokalaştı.
- E) Çocuk hemen yıkandı.

---

1. Edilgen çatıda işi yapan belli değildir, özne işten etkilenir. Fiil -ıl ya da -ın eki alır.
2. “Kapı açıldı” cümlesinde kapıyı kimin açtığı belli değildir.
3. Diğer seçeneklerde etken, işteş ve dönüşlü çatı vardır. Doğru cevap A.

Diğer şıklar: **Ali, yüzünü sabunla yıkadı.** özne işi yapıyor, etken çatı / **Çocuk sabahları erkenden kalkar.** özne işi yapıyor, etken ve geçişsiz / **Ayşe ile Ali sokakta tokalaştı.** iş karşılıklı yapılıyor, işteş çatı / **Çocuk hemen yıkandı.** özne işi kendi üzerine yapıyor, dönüşlü çatı.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerin hangisinde yüklem **işteş** çatılıdır?

- A) İki arkadaş uzun süre sonra karşılaşınca kucaklaştılar.
- B) Kitap, rafa dikkatlice kaldırıldı.
- C) Çocuk, ellerini sabunla yıkadı.
- D) Sınıf, teneffüste temizlendi.
- E) Annem akşam yemeği pişirdi.

---

1. İşteş çatıda iş birden çok özne tarafından karşılıklı ya da birlikte yapılır. Fiil -ış, -iş, -uş, -üş eki alır.
2. “Kucaklaştılar” fiilinde iki arkadaş karşılıklı olarak birbirini kucaklıyor.
3. Diğer seçeneklerde edilgen ve etken çatı vardır. Doğru cevap A.

Diğer şıklar: **Kitap, rafa dikkatlice kaldırıldı.** işi yapan belli değil, edilgen / **Çocuk, ellerini sabunla yıkadı.** özne işi yapıyor, etken / **Sınıf, teneffüste temizlendi.** işi yapan belli değil, edilgen / **Annem akşam yemeği pişirdi.** özne işi yapıyor, etken.
:::

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde yüklem **ettirgen** çatılıdır?

- A) Pantolonu yıkanınca kısaldı.
- B) Terziye pantolonunu kısalttırdı.
- C) Ayşe kapıyı hemen açtı.
- D) Mektup dün akşam yazıldı.
- E) Ali sabah erkenden uyandı.

---

1. Ettirgen fiil, işin başkasına yaptırıldığını bildirir. -dır, -tır, -t ekleriyle yapılır.
2. “Kısalttırdı” fiilinde işi terzi yapıyor, özne yaptırıyor.
3. Diğer seçeneklerde yaptırma anlamı yoktur. Doğru cevap B.

Diğer şıklar: **Pantolonu yıkanınca kısaldı.** oluş bildiren geçişsiz fiil, ettirgen değil / **Ayşe kapıyı hemen açtı.** özne işi yapıyor, etken ve geçişli / **Mektup dün akşam yazıldı.** işi yapan belli değil, edilgen / **Ali sabah erkenden uyandı.** özne işi yapıyor, etken ve geçişsiz.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde yüklem **geçişsizdir**?

- A) Anne sofrayı özenle hazırladı.
- B) Ali kitabı bir günde okudu.
- C) Ayşe mektubu dün yazdı.
- D) Öğretmen soruyu tahtada açıkladı.
- E) Çocuk akşamüstü derin bir uykuya daldı.

---

1. Geçişsiz fiil “neyi, kimi?” sorusuna cevap vermez.
2. “Daldı” fiili için “neyi daldı?” diye sorulamaz. Nesne yoktur.
3. Diğer seçeneklerde “neyi hazırladı, okudu, yazdı, açıkladı” sorularının cevabı vardır, geçişlidir. Doğru cevap E.

Diğer şıklar: **Anne sofrayı özenle hazırladı.** “neyi hazırladı?” sorusuna cevap veriyor, geçişli / **Ali kitabı bir günde okudu.** “neyi okudu?” sorusuna cevap veriyor, geçişli / **Ayşe mektubu dün yazdı.** “neyi yazdı?” sorusuna cevap veriyor, geçişli / **Öğretmen soruyu tahtada açıkladı.** “neyi açıkladı?” sorusuna cevap veriyor, geçişli.
:::

## Kendini dene

:::dene
1. “Mektup yazıldı.” cümlesinde yüklem hangi çatıdadır? => Edilgen.
2. “Çocuk yıkandı.” cümlesinde yüklem hangi çatıdadır? => Dönüşlü, çünkü kendini yıkamıştır.
3. “İki arkadaş kucaklaştı.” cümlesinde yüklem hangi çatıdadır? => İşteş.
4. “Ali kitabı okudu.” cümlesindeki yüklem geçişli mi geçişsiz midir? => Geçişli, çünkü “neyi okudu?” sorusuna cevap verilir.
5. “Terzi pantolonu kısalttı.” cümlesindeki “kısalttı” hangi çatıdadır? => Oldurgan, çünkü geçişsiz “kısalmak” geçişli yapılmıştır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tr' and name = 'Fiil Çatısı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Fiil çatısı, özneye göre (etken, edilgen, dönüşlü, işteş) ve nesneye göre (geçişli, geçişsiz, ettirgen, oldurgan) çatılar, çatı ekleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Ettirgen ve oldurgan ayrımı bazı kitaplarda tek başlık altında verilir.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Fiil Çatısı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Dün akşam arkadaşım bana güzel bir kitap verdi.” cümlesinde kim, kime, neyi, ne zaman? Cümle, bir bina gibi **ögelerden** kurulur. Her öge belli bir soruya cevap verir. Ögeleri bulmak, cümleyi çözümlemenin ve doğru anlamanın temelidir. TYT’de bu konunun soruları, bir cümledeki ögenin **türünü ve görevini** belirlemeyi ister. Bu konuda yüklemi, özneyi, nesneyi, dolaylı tümleci, zarf tümlecini ve edat tümlecini öğreneceksin.

:::hedefler
1. Cümlenin yüklemini ve öznesini bulmak.
2. Özne türlerini (gerçek, gizli, sözde) ayırt etmek.
3. Nesneyi (belirtili, belirtisiz) ve dolaylı tümleci belirlemek.
4. Zarf tümlecini ve edat tümlecini tanımak.
5. Ögelerin sorularını kullanarak cümleyi çözümlemek.
:::

:::ipucu
Ögeleri bulurken **önce yüklemi bul**, sonra yükleme sırayla sor: “Kim? Ne?” (özne), “Neyi? Kimi?” (nesne), “Kime? Neye? Nerede? Nereden?” (dolaylı tümleç), “Nasıl? Ne zaman? Nereye?” (zarf tümleci). Cevabı olmayan soruyu atla.
:::

## 1. Yüklem

Cümlede **işi, oluşu ya da durumu bildiren** ögedir. Genellikle cümlenin sonunda bulunur. Yüklem bulunurken “Cümlede ne yapılıyor?” sorusu sorulur.

- **Fiil yüklemi:** Ali kitabı **okudu**. (Çekimli fiil)
- **İsim yüklemi:** Bu çocuk çok **çalışkan(dır)**. (İsim soylu sözcük + ek fiil)

Yüklemsiz cümle olmaz ama bazı cümlelerde yüklem gizlidir (ek fiil düşmüştür): “Hava çok güzel.” (güzel+dir)

## 2. Özne

Yüklemin bildirdiği **işi yapan ya da oluşu üstlenen** ögedir. Yükleme **“kim?”** ya da **“ne?”** sorusu sorularak bulunur.

| Özne türü | Açıklama | Örnek |
| --- | --- | --- |
| Gerçek özne | İşi yapan, cümlede açıkça yazılan | **Çocuklar** bahçede oynuyor. |
| Gizli özne | Cümlede yazılmaz, yüklemin kişi ekinden anlaşılır | Dün akşam sinemaya **gittik**. (Biz) |
| Sözde özne | İşi yapan değil, işten etkilenen, edilgen yüklemin öznesi | **Mektup** dün yazıldı. |

**Sözde özne:** Edilgen yüklemin öznesidir. “Mektup yazıldı” cümlesinde mektubu **yazan kişi belli değildir**, mektup yalnızca işten etkilenir.

## 3. Nesne

Geçişli fiilin **“neyi, kimi?”** sorusuna verdiği cevaptır. Nesne **belirtili** ya da **belirtisiz** olur.

| Nesne türü | Açıklama | Örnek |
| --- | --- | --- |
| Belirtili nesne | Belirtme hâl eki (-ı, -i, -u, -ü) alır, belli bir varlığı gösterir | Çocuk **kitabı** okudu. |
| Belirtisiz nesne | Ek almaz, genel bir varlığı gösterir | Annem **yemek** pişirdi. |

**Ayırma yöntemi:** “Kitabı” cümlede belirli bir kitabı gösterir (belirtili). “Yemek” genel bir yemeği anlatır (belirtisiz).

## 4. Tümleçler

**Dolaylı tümleç (yer tamlayıcısı):** Yüklemin **yönelme (-e, -a), bulunma (-de, -da) ya da ayrılma (-den, -dan)** ekini almış ismin oluşturduğu ögedir. Yükleme **“kime, neye, nerede, nereden?”** soruları sorulur.

- Öğrenciler **okula** gitti. (Nereye? Okula)
- Çocuk **bahçede** oynuyor. (Nerede? Bahçede)
- Ali **evden** çıktı. (Nereden? Evden)
- Ayşe **arkadaşına** mektup yazdı. (Kime? Arkadaşına)

**Zarf tümleci:** Yüklemin **durumunu, zamanını, miktarını, nedenini** bildirir. **“Nasıl, ne zaman, ne kadar, niçin?”** sorularına cevap verir.

- Çocuk **hızlı** koştu. (Nasıl?)
- **Dün** erkenden uyandı. (Ne zaman?)
- Misafirler **içeri** girdi. (Nereye? Yer-yön zarfı)
- Çok **fazla** konuştu. (Ne kadar?)

**Edat tümleci:** Bir edat ile kurulan öbek, yüklemi tamamlıyorsa edat tümlecidir. “Sınav **için** çalıştı.” “Arkadaşı **ile** geldi.”

| Öge | Soru | Örnek |
| --- | --- | --- |
| Yüklem | Ne yapıyor? | okudu |
| Özne | Kim? Ne? | Ali |
| Nesne | Neyi? Kimi? | kitabı |
| Dolaylı tümleç | Kime? Nerede? Nereden? | okula, bahçede, evden |
| Zarf tümleci | Nasıl? Ne zaman? Ne kadar? | hızlı, dün, çok |
| Edat tümleci | Edat ile | sınav için |

## 5. Ögelerin dizilişi

Türkçede yüklem **cümlenin sonunda** bulunur ve öge dizilişi: **Özne, zarf tümleci, dolaylı tümleç, nesne, yüklem**. Böyle cümleye **kurallı cümle** denir. Yüklem sonda değilse cümle **devrik cümle**dir: “Çok yorulmuştum **dün**.” Devrik cümle, vurgu ve söyleyiş zenginliği için kullanılır.

**Örnek çözümleme:** “Dün akşam arkadaşım bana güzel bir kitap verdi.”

- Yüklem: verdi
- Özne: arkadaşım
- Dolaylı tümleç: bana (kime?)
- Nesne: güzel bir kitap (neyi?)
- Zarf tümleci: Dün akşam (ne zaman?)

:::neden-sonuc
- Yükleme “kim?” ya da “ne?” diye sorulunca cevap geliyor => Özne.
- Yükleme “neyi?” ya da “kimi?” diye sorulunca cevap geliyor => Nesne.
- Yükleme “kime, nerede, nereden?” diye sorulunca ek almış isim geliyor => Dolaylı tümleç.
- Yükleme “nasıl, ne zaman, ne kadar?” diye sorulunca cevap geliyor => Zarf tümleci.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Dolaylı tümleç ile zarf tümlecini karıştırmak** en sık yapılan hatadır. “Okula gitti”de “okula” yönelme ekiyle dolaylı tümleçtir. “İçeri girdi”de “içeri” bir zarf olduğu için zarf tümlecidir. Bir de **özneyi nesneden ayırmak**: Edilgen cümlede “kapı”, “açıldı”nın sözde öznesidir, nesnesi değildir.
:::

:::baglanti
Ögeler, “İsim ve Sıfat”, “Zamir ve Zarf”, “Fiilimsiler” ve “Fiil Çatısı” konularında öğrendiğin sözcük türlerinin **cümledeki görevidir**. “Cümle Türleri” konusunda yüklemin yerine ve ögelerin dizilişine bakılarak cümleler sınıflandırılır. “Anlatım Bozuklukları” konusunda eksik ya da fazla öge, cümlenin bozulmasına yol açar.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Yüklem | Cümlenin sonunda, işi bildirir |
| Özne | Kim? Ne? |
| Nesne | Neyi? Kimi? |
| Dolaylı tümleç | -e, -de, -den ekli isim |
| Zarf tümleci | Nasıl? Ne zaman? |
| Gizli özne | Kişi ekinden anlaşılır |
| Sözde özne | Edilgen yüklemin öznesi |

## Mini test

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde **gizli özne** vardır?

- A) Çocuklar bahçede hep birlikte oynuyor.
- B) Kapı dün akşam özenle açıldı.
- C) Öğretmen soruyu tahtada açıkladı.
- D) Dün akşam arkadaşlarımla sinemaya gittik.
- E) Ali ödevini zamanında teslim etti.

---

1. Gizli özne cümlede yazılmaz, yüklemdeki kişi ekinden anlaşılır.
2. “Gittik” yüklemindeki -k eki “biz” kişisini gösterir. Özne yazılı değildir.
3. Diğer seçeneklerde özne cümlede yer almıştır ya da sözde öznedir. Doğru cevap D.

Diğer şıklar: **Çocuklar bahçede hep birlikte oynuyor.** özne “çocuklar” cümlede açıkça yazılmış, gerçek özne / **Kapı dün akşam özenle açıldı.** özne “kapı” edilgen yüklemin öznesi, sözde özne / **Öğretmen soruyu tahtada açıkladı.** özne “öğretmen” cümlede açıkça yazılmış, gerçek özne / **Ali ödevini zamanında teslim etti.** özne “Ali” cümlede açıkça yazılmış, gerçek özne.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerin hangisinde koyu yazılan öge **belirtili nesne**dir?

- A) Çocuk **kitabı** bir solukta okudu.
- B) Annem akşam **yemek** pişirdi.
- C) Ali **eve** erkenden geldi.
- D) Ayşe **kitaptan** uzun uzun bahsetti.
- E) Çocuklar **bahçede** top oynuyor.

---

1. Belirtili nesne belirtme hâl ekini (-ı, -i, -u, -ü) alır ve “neyi, kimi?” sorusuna cevap verir.
2. “Kitabı” sözcüğü belirtme eki almıştır ve “neyi okudu?” sorusuna cevap verir.
3. Diğer seçeneklerde nesne ek almamıştır ya da dolaylı tümleç vardır. Doğru cevap A.

Diğer şıklar: **Annem akşam **yemek** pişirdi.** belirtme eki almamış, belirtisiz nesne / **Ali **eve** erkenden geldi.** yönelme eki almış, dolaylı tümleç / **Ayşe **kitaptan** uzun uzun bahsetti.** ayrılma eki almış, dolaylı tümleç / **Çocuklar **bahçede** top oynuyor.** bulunma eki almış, dolaylı tümleç.
:::

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde koyu yazılan öge **dolaylı tümleç**tir?

- A) **Sabah** erkenden uyandı.
- B) Çocuk yoldan **hızlı** koştu.
- C) Misafirler **içeri** girdi.
- D) Öğrenciler **okula** erkenden gitti.
- E) Ali **kitabı** hemen aldı.

---

1. Dolaylı tümleç yönelme, bulunma ya da ayrılma hâl eki alan isimden oluşur.
2. “Okula” sözcüğü yönelme eki almıştır ve “nereye gitti?” sorusuna cevap verir.
3. Diğer seçeneklerde zarf tümleci ve nesne vardır. Doğru cevap D.

Diğer şıklar: ****Sabah** erkenden uyandı.** “ne zaman?” sorusuna cevap veren zarf tümleci / **Çocuk yoldan **hızlı** koştu.** “nasıl?” sorusuna cevap veren zarf tümleci / **Misafirler **içeri** girdi.** zarf olan “içeri” yer-yön zarf tümleci / **Ali **kitabı** hemen aldı.** “neyi?” sorusuna cevap veren nesne.
:::

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde **sözde özne** vardır?

- A) Çocuklar bahçede oynuyor.
- B) Mektup dün akşam yazıldı.
- C) Dün akşam sinemaya gittik.
- D) Ali kitabı okudu.
- E) Annem yemek pişirdi.

---

1. Sözde özne, edilgen yüklemin öznesidir. İşi yapan değil, işten etkilenen ögedir.
2. “Yazıldı” edilgen çatılıdır. “Mektup”, yazma işini yapan değil, yazma işinden etkilenendir.
3. Diğer seçeneklerde gerçek ya da gizli özne vardır. Doğru cevap B.

Diğer şıklar: **Çocuklar bahçede oynuyor.** işi yapan özne yazılmış, gerçek özne / **Dün akşam sinemaya gittik.** yüklemdeki kişi ekinden anlaşılan gizli özne / **Ali kitabı okudu.** işi yapan özne yazılmış, gerçek özne / **Annem yemek pişirdi.** işi yapan özne yazılmış, gerçek özne.
:::

## Kendini dene

:::dene
1. “Çocuk kitabı okudu.” cümlesinde nesne hangisidir? => Kitabı (belirtili nesne).
2. “Dün sinemaya gittik.” cümlesinin öznesi nedir? => Gizli özne, biz.
3. “Ali okula gitti.” cümlesinde “okula” hangi ögedir? => Dolaylı tümleç.
4. “Mektup yazıldı.” cümlesinin öznesi hangi türdendir? => Sözde özne.
5. “Çocuk hızlı koştu.” cümlesinde “hızlı” hangi ögedir? => Zarf tümleci.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-tr' and name = 'Cümlenin Ögeleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Cümlenin ögeleri (yüklem, özne, nesne, dolaylı tümleç, zarf tümleci, edat tümleci), özne türleri, öge dizilişi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Dolaylı tümleç tanımı hâl eklerine dayandırıldı (yönelme, bulunma, ayrılma). Bazı yayınlarda "nerede" sorusu zarf tümleci olarak da değerlendirilir. İkinci ve üçüncü soru bu tanıma göre yazıldı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Cümlenin Ögeleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Ali geldi.” ile “Ali geldi ama kimseyle konuşmadan odasına çıktı.” cümleleri farklı yapıdadır: İlki tek bir yargı bildirir, ikincisi iki yargıyı birleştirir. Cümleler **yapılarına, yüklemlerine, yüklemlerinin yerine ve anlamlarına** göre gruplanır. TYT’de cümle türü sorusu çoğunlukla **yapıca** ya da **yüklemin türüne** göre sorulur. Bu konuda dört sınıflandırmayı ve her birinin ölçütünü öğreneceksin.

:::hedefler
1. Cümleleri yapılarına göre (basit, birleşik, sıralı, bağlı) sınıflandırmak.
2. Yüklemin türüne göre fiil cümlesi ve isim cümlesini ayırt etmek.
3. Yüklemin yerine göre kurallı ve devrik cümleyi ayırt etmek.
4. Anlamına göre cümleleri (olumlu, olumsuz, soru, ünlem) tanımak.
5. Aynı cümlenin farklı ölçütlerle sınıflandırılmasını yapmak.
:::

:::ipucu
Cümle türü sorusunda **önce hangi ölçüte göre sorulduğuna** bak. “Yapısına göre” ise yargı sayısına ve yargıları nasıl bağladığına bak. “Yüklemine göre” ise yüklemin fiil mi isim mi olduğuna bak. Her ölçüt farklı bir ayrım yapar.
:::

## 1. Yapılarına göre cümleler

**Basit cümle:** **Tek yargı** bildirir, yani **tek yüklemi** vardır. Fiilimsi, bağlaç ya da yan cümle içermez.

- Ali kitabı okudu.
- Çocuk bahçede oynuyor.

**Birleşik cümle:** Bir temel cümle ile bir ya da birkaç **yan cümleden** oluşur. Yan cümle, temel cümleyi tamamlar ve tek başına yargı bildirmez. Üç şekilde yapılır:

| Birleşik cümle türü | Yan cümle | Örnek |
| --- | --- | --- |
| Fiilimsili | Fiilimsi içerir | **Gelen** misafirleri karşıladık. Eve **gelince** haber verdi. |
| Şartlı | Dilek-şart kipli fiil içerir | Ders **çalışırsan** sınavı kazanırsın. |
| “Ki”li | “Ki” ile bağlanan yan cümle içerir | **Biliyorum ki** yarın gelecek. |

**Sıralı cümle:** Birden çok **bağımsız cümlenin** virgül ya da noktalı virgülle yan yana getirilmesiyle oluşur. Aralarında bağlaç bulunmaz. Her cümlenin kendi yüklemi vardır ve yargıları bağımsızdır.

- Kapıyı açtı, içeri girdi, oturdu.
- Geldi, gördü, yendi.

**Bağlı cümle:** Birden çok bağımsız cümlenin **bağlaçla** birbirine bağlanmasıyla oluşur. Bağlaçlar: ve, ama, fakat, çünkü, yani, ya da.

- Çok çalıştı **ama** başaramadı.
- Yorgundu **çünkü** gece uyumamıştı.

| Tür | Yargı | Ölçüt |
| --- | --- | --- |
| Basit | Tek | Tek yüklem, fiilimsi yok |
| Birleşik | Birden çok ama yan cümleli | Fiilimsi, şart ya da “ki” |
| Sıralı | Birden çok bağımsız | Bağlaçsız, virgülle |
| Bağlı | Birden çok bağımsız | Bağlaçla |

## 2. Yüklemin türüne göre

**Fiil cümlesi:** Yüklemi **fiil** olan cümledir. Ali kitabı okudu.

**İsim cümlesi:** Yüklemi **isim soylu bir sözcük** olan cümledir. Yüklem isim, sıfat, zamir ya da zarf olabilir ve ek fiil alır. Bu çocuk çok **çalışkan(dır)**. Kitap çok **güzel**. Soru **zor(du)**.

## 3. Yüklemin yerine göre

**Kurallı cümle:** Yüklem **cümlenin sonundadır**. Dün çok yorulmuştum.

**Devrik cümle:** Yüklem **cümlenin sonunda değildir**. Çok yorulmuştum dün. (Yüklem “yorulmuştum”, cümlenin sonunda “dün” var.)

Devrik cümle vurgu için kullanılır. Şiirlerde ve konuşma dilinde sık görülür.

## 4. Anlamlarına göre

| Tür | Anlam | Örnek |
| --- | --- | --- |
| Olumlu cümle | Eylem yapılır ya da oluşur | Ali geldi. |
| Olumsuz cümle | Eylem yapılmaz | Ali gelmedi. |
| Soru cümlesi | Cevap beklenir | Ali geldi mi? |
| Ünlem cümlesi | Duygu, şaşkınlık | Ne güzel bir gün! |
| Emir cümlesi | Emir bildirir | Buraya gel! |
| İstek cümlesi | İstek, dilek | Keşke gelse. |

## 5. Çözümleme örneği

**“Dersi çalışırsan sınavı rahatça kazanırsın.”**

- Yapısına göre: **Birleşik** (şartlı yan cümle: “dersi çalışırsan”).
- Yüklemine göre: **Fiil cümlesi** (“kazanırsın”).
- Yüklemin yerine göre: **Kurallı** (yüklem sonda).
- Anlamına göre: **Olumlu**.

**“Çok çalıştı ama başaramadı.”**

- Yapısına göre: **Bağlı** (“ama” bağlacı).
- Yüklemine göre: **Fiil cümlesi**.
- Yüklemin yerine göre: **Kurallı**.
- Anlamına göre: **Olumsuz** (ikinci yargı olumsuz).

:::neden-sonuc
- Tek yüklem var, fiilimsi ve bağlaç yok => Basit cümle.
- Cümlede fiilimsi, şart eki ya da “ki” var => Birleşik cümle.
- Bağımsız cümleler virgülle yan yana => Sıralı cümle.
- Bağımsız cümleler bağlaçla birleşmiş => Bağlı cümle.
- Yüklem fiil => Fiil cümlesi, yüklem isim soylu => İsim cümlesi.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Birleşik cümle ile bağlı cümleyi karıştırmak** en sık yapılan hatadır. Bağlı cümlede bağlaç iki bağımsız cümleyi bağlar, her birinin kendi yüklemi vardır (“Çok çalıştı **ama** başaramadı”). Birleşik cümlede ise yan cümle tek başına yargı bildirmez, temel cümleyi tamamlar (“Gelen misafirleri karşıladık”). Bir de **fiilimsi** görünce yüklem sanmak hatasına dikkat et: Fiilimsi yüklem olmaz.
:::

:::baglanti
Cümle türleri, “Fiilimsiler”, “Fiiller ve Ek Fiil” ve “Cümlenin Ögeleri” konularının uygulamasıdır. Fiilimsi içeren cümle birleşiktir, yüklemin türü fiil ya da isim olabilir. “Anlatım Bozuklukları” konusunda bağlı cümleler arasındaki ilişkinin doğru kurulması sorulur.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Basit | Tek yüklem |
| Birleşik | Fiilimsi, şart, “ki” |
| Sıralı | Virgülle, bağlaçsız |
| Bağlı | Bağlaçla |
| Fiil cümlesi | Yüklem fiil |
| İsim cümlesi | Yüklem isim soylu |
| Devrik | Yüklem sonda değil |

## Mini test

:::soru{cevap="C"}
Aşağıdaki cümlelerden hangisi **birleşik cümle**dir?

- A) Ali ödevini zamanında teslim etti.
- B) Çok çalıştı ama istediği sonucu alamadı.
- C) Gelen misafirleri kapıda karşıladık.
- D) Geldi, gördü, yendi.
- E) Bu akşam hava çok güzel.

---

1. Birleşik cümle, bir temel cümle ile yan cümleden oluşur. Yan cümle fiilimsi, şart ya da “ki” ile kurulur.
2. “Gelen” sözcüğü sıfat-fiildir ve “misafirleri” niteler. Cümle fiilimsi içerdiği için birleşiktir.
3. Diğer seçenekler basit, bağlı ve sıralı cümledir. Doğru cevap C.

Diğer şıklar: **Ali ödevini zamanında teslim etti.** tek yüklemli basit cümle / **Çok çalıştı ama istediği sonucu alamadı.** bağlaçla bağlanan iki bağımsız cümle, bağlı cümle / **Geldi, gördü, yendi.** bağlaçsız, virgülle ayrılmış sıralı cümle / **Bu akşam hava çok güzel.** tek yüklemli basit isim cümlesi.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerden hangisi **sıralı cümle**dir?

- A) Kapıyı açtı, içeri girdi, koltuğa oturdu.
- B) Yağmur yağınca yollar kapandı.
- C) Yorgundu çünkü gece uyumamıştı.
- D) Çocuk bahçede top oynuyor.
- E) Biliyorum ki yarın bize gelecek.

---

1. Sıralı cümlede bağımsız cümleler virgülle yan yana gelir, aralarında bağlaç bulunmaz.
2. “Açtı, girdi, oturdu” üç yüklemli ve bağlaçsızdır.
3. Diğer seçenekler birleşik, bağlı ve basit cümledir. Doğru cevap A.

Diğer şıklar: **Yağmur yağınca yollar kapandı.** zarf-fiil içeren birleşik cümle / **Yorgundu çünkü gece uyumamıştı.** “çünkü” ile bağlanan bağlı cümle / **Çocuk bahçede top oynuyor.** tek yüklemli basit cümle / **Biliyorum ki yarın bize gelecek.** “ki” ile kurulan birleşik cümle.
:::

:::soru{cevap="A"}
Aşağıdaki cümlelerden hangisi **isim cümlesi**dir?

- A) Bu çocuk gerçekten çok çalışkan.
- B) Çocuk dün akşam eve geldi.
- C) Ali ödevini dikkatle okudu.
- D) Annem akşam yemeği pişirdi.
- E) Öğrenciler teneffüste bahçeye çıktı.

---

1. İsim cümlesinin yüklemi isim soylu bir sözcüktür ve ek fiil alır.
2. “Çalışkan” sıfattır ve “Bu çocuk çok çalışkan(dır)” cümlesinin yüklemidir.
3. Diğer seçeneklerin yüklemi fiildir. Doğru cevap A.

Diğer şıklar: **Çocuk dün akşam eve geldi.** yüklemi fiil olan fiil cümlesi / **Ali ödevini dikkatle okudu.** yüklemi fiil olan fiil cümlesi / **Annem akşam yemeği pişirdi.** yüklemi fiil olan fiil cümlesi / **Öğrenciler teneffüste bahçeye çıktı.** yüklemi fiil olan fiil cümlesi.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerden hangisi **devrik cümle**dir?

- A) Dün çok yorulmuştum.
- B) Ali kitabı okudu.
- C) Annem yemek pişirdi.
- D) Çocuk okula erkenden gitti.
- E) Çok yorulmuştum dün.

---

1. Devrik cümlede yüklem cümlenin sonunda değildir.
2. “Çok yorulmuştum dün” cümlesinde yüklem “yorulmuştum”dur ve sonunda “dün” vardır.
3. Diğer seçeneklerde yüklem sondadır, kurallı cümledir. Doğru cevap E.

Diğer şıklar: **Dün çok yorulmuştum.** yüklem cümlenin sonunda, kurallı cümle / **Ali kitabı okudu.** yüklem cümlenin sonunda, kurallı cümle / **Annem yemek pişirdi.** yüklem cümlenin sonunda, kurallı cümle / **Çocuk okula erkenden gitti.** yüklem cümlenin sonunda, kurallı cümle.
:::

## Kendini dene

:::dene
1. “Çocuk bahçede oynuyor.” cümlesi yapıca hangi türdendir? => Basit cümle.
2. “Gelen misafirleri karşıladık.” cümlesi yapıca hangi türdendir? => Birleşik cümle, çünkü fiilimsi var.
3. “Geldi, gördü, yendi.” cümlesi yapıca hangi türdendir? => Sıralı cümle.
4. “Yorgundu ve eve gitti.” cümlesi yapıca hangi türdendir? => Bağlı cümle.
5. “Bu çocuk çok çalışkan.” cümlesi yüklemine göre hangi türdendir? => İsim cümlesi.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tr' and name = 'Cümle Türleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Cümle türleri, yapısına göre (basit, birleşik, sıralı, bağlı), yüklemin türüne göre (fiil, isim), yüklemin yerine göre (kurallı, devrik), anlamına göre (olumlu, olumsuz, soru, ünlem, emir, istek). Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Bazı kaynaklarda bağlı cümle ve sıralı cümle ayrımı farklı adlarla verilir. Bu metinde bağlaçlı ve bağlaçsız ayrımı esas alındı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Cümle Türleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

“Dün akşam sinemaya gideceğiz.” cümlesini okuyunca bir şey rahatsız eder: “Dün” geçmişi, “gideceğiz” geleceği gösterir. Cümlenin bir yerinde **anlam ya da yapı bozulmuştur**. Anlatım bozuklukları, cümlenin ya da paragrafın doğru, akıcı ve anlaşılır olmasını engelleyen hatalardır. TYT’de her yıl sorulur. Soru, hatanın nerede ve **hangi türde** olduğunu bulmayı ister. Bu konuda anlamsal ve yapısal anlatım bozukluklarını öğreneceksin.

:::hedefler
1. Anlamsal anlatım bozukluklarını (gereksiz sözcük, anlamca çelişen sözcük, yanlış anlamlı sözcük) bulmak.
2. Yapısal anlatım bozukluklarını (özne-yüklem uyumsuzluğu, kip-zaman uyumsuzluğu, çatı uyuşmazlığı, eksik öge) bulmak.
3. Bozuk bir cümleyi düzeltmek.
4. Hatanın türünü adlandırmak.
5. Doğru cümlede hata aramamak.
:::

:::ipucu
Anlatım bozukluğu sorusunda **önce cümleyi sesli ya da içinden oku**. Kulağına garip gelen bir yer varsa orada hata vardır. Sonra hatayı bulmak için sırayla şunlara bak: Gereksiz sözcük var mı? Zıt anlamlı sözcükler yan yana mı? Özne ile yüklem uyuşuyor mu? Zaman uyuyor mu?
:::

## 1. Anlamsal anlatım bozuklukları

**Gereksiz sözcük kullanımı.** Aynı anlamı veren iki sözcüğün bir arada bulunmasıdır. Birini atınca cümlenin anlamı değişmez.

- Yanlış: Toplantıya **yaklaşık** elli **civarında** kişi katıldı. (Yaklaşık ve civarında aynı anlamı taşır)
- Doğru: Toplantıya yaklaşık elli kişi katıldı.
- Yanlış: Çocuklar **karşılıklı** birbirine baktı.
- Doğru: Çocuklar birbirine baktı.
- Yanlış: Kitabın **bütün hepsini** okudum.
- Doğru: Kitabın hepsini okudum.

**Anlamca çelişen sözcükler.** Cümlede birbirine **zıt ya da birbirini bozan** sözcükler yan yana kullanılır.

- Yanlış: **Kesinlikle belki** yarın size uğrarım. (Kesinlik ile olasılık çelişir)
- Doğru: Belki yarın size uğrarım. Ya da: Kesinlikle yarın size uğrarım.
- Yanlış: Çocuk **yavaş yavaş hızla** koştu.
- Doğru: Çocuk hızla koştu.

**Yanlış anlamda kullanılan sözcük.** Sözcük, cümlenin anlamına uymayan bir anlamda kullanılır. Cümleyi dikkatle okuyunca sözcüğün yeri uymaz.

## 2. Yapısal anlatım bozuklukları

**Özne-yüklem uyumsuzluğu.** Özne ile yüklemin kişi ve sayı bakımından uyması gerekir.

- Yanlış: **Çocuklar ve biz** sinemaya **gitti**. (Özne çoğul, yüklem “gitti” 3. kişi)
- Doğru: Çocuklar ve biz sinemaya gittik.
- Yanlış: Sen ve ben sinemaya gidecek.
- Doğru: Sen ve ben sinemaya gideceğiz.

**Kip (zaman) uyumsuzluğu.** Cümledeki zaman sözcüğü ile yüklemin kipi birbirini bozmamalıdır.

- Yanlış: **Dün** akşam sinemaya **gideceğiz**. (Geçmiş zaman sözcüğü, gelecek zaman kipi)
- Doğru: Dün akşam sinemaya gittik.
- Yanlış: **Yarın** toplantıya **gelemedim**.
- Doğru: Yarın toplantıya gelemeyeceğim.

**Çatı uyuşmazlığı.** Aynı yükleme bağlanan fiillerin çatıları (etken, edilgen) uyumlu olmalıdır.

- Yanlış: Bu kitap **okunmalı** ve **düşünmeli**. (Edilgen ve etken karışmış)
- Doğru: Bu kitap okunmalı ve düşünülmelidir.

**Ortak ögelerin ek ve kip uyuşmazlığı.** Bir yükleme bağlanan birden çok ögenin ekleri aynı olmalıdır.

- Yanlış: Ahmet’i **ve** Ayşe’ye çağırdım. (İkisi de aynı eki almalı)
- Doğru: Ahmet’i ve Ayşe’yi çağırdım.
- Yanlış: Hem **sınıfta** hem de **bahçeden** çocuk sesleri geliyordu.
- Doğru: Hem sınıftan hem de bahçeden çocuk sesleri geliyordu.

**Eksik öge ya da eksik yüklem.** Cümlede ortak yüklem, ortak ek eksikse cümle anlaşılmaz.

## 3. Hata bulma ve düzeltme

| Hata türü | Nasıl bulunur? | Nasıl düzeltilir? |
| --- | --- | --- |
| Gereksiz sözcük | İki sözcük aynı anlamda | Birini at |
| Çelişen sözcük | İki sözcük birbirine zıt | Birini at ya da değiştir |
| Özne-yüklem | Çoğul özne, tekil yüklem | Yüklemin kişi ekini düzelt |
| Kip-zaman | Zaman sözcüğü ile kip uyuşmuyor | Kipi ya da zaman sözcüğünü düzelt |
| Çatı | Etken ve edilgen karışmış | Hepsini aynı çatıya çevir |
| Ortak öge | Ekler farklı | Ortak ek ver |

:::neden-sonuc
- İki sözcük aynı anlamı veriyor => Gereksiz sözcük vardır.
- İki sözcük birbirine zıt anlam taşıyor => Anlamca çelişki vardır.
- Özne çoğul, yüklem tekil kişi ekli => Özne-yüklem uyumsuzluğu vardır.
- Zaman sözcüğü geçmiş, kip gelecek => Kip-zaman uyumsuzluğu vardır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Doğru cümlede hata aramak** sık yapılan bir hatadır. Her cümle bozuk olmaz. Seçeneklerden **yalnızca birinde** bozukluk vardır. Her seçeneği ayrı ayrı oku ve “bu cümlede hangi hata var?” diye sorma. Önce kulağına bozuk gelen cümleyi ara. Bir de “**çok fazla**”, “**tekrar yeniden**” gibi yaygın kullanımlarda hatayı fark etmeyebilirsin, çünkü kulağın alışmıştır.
:::

:::baglanti
Anlatım bozuklukları, bütün dil bilgisi konularının bir araya geldiği bir konudur. “Cümlenin Ögeleri” ve “Fiil Çatısı” konularındaki bilgiler hataları bulmanı sağlar. “Noktalama İşaretleri” ve “Yazım Kuralları” da yazılı anlatımın doğruluğunu tamamlar. “Paragraf” konusunda akışı bozan cümle de bir tür anlatım bozukluğudur.
:::

## 4. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Gereksiz sözcük | Aynı anlamda iki sözcük |
| Çelişen sözcük | Zıt anlamlı iki sözcük |
| Özne-yüklem | Kişi ve sayı uyumu |
| Kip-zaman | Zaman zarfı ile kip uyumu |
| Çatı | Etken ve edilgen karışmamalı |
| Ortak öge | Ekler aynı olmalı |

## Mini test

:::soru{cevap="B"}
Aşağıdaki cümlelerin hangisinde **gereksiz sözcük kullanımından** kaynaklanan bir anlatım bozukluğu vardır?

- A) Toplantıya elli kadar kişi katıldı.
- B) Toplantıya yaklaşık elli civarında kişi katıldı.
- C) Misafirler akşam yemeğinden sonra evden ayrıldı.
- D) Çocuklar bahçede birlikte oynadı.
- E) Sınav sonuçları yarın açıklanacak.

---

1. “Yaklaşık” ve “civarında” aynı anlamı taşır, ikisi birlikte kullanılamaz.
2. Doğru kullanım: Toplantıya yaklaşık elli kişi katıldı.
3. Diğer seçeneklerde gereksiz sözcük yoktur. Doğru cevap B.

Diğer şıklar: **Toplantıya elli kadar kişi katıldı.** tek bir yaklaşıklık sözcüğü kullanılmış, bozukluk yok / **Misafirler akşam yemeğinden sonra evden ayrıldı.** gereksiz sözcük yok, anlatım düzgün / **Çocuklar bahçede birlikte oynadı.** gereksiz sözcük yok, anlatım düzgün / **Sınav sonuçları yarın açıklanacak.** gereksiz sözcük yok, anlatım düzgün.
:::

:::soru{cevap="C"}
Aşağıdaki cümlelerin hangisinde **anlamca çelişen** sözcükler kullanılmıştır?

- A) Belki yarın size uğrarım.
- B) Kesinlikle yarın size uğrarım.
- C) Kesinlikle belki yarın size uğrarım.
- D) Galiba bu akşam gelmeyecek.
- E) Mutlaka bu işi bitireceğim.

---

1. “Kesinlikle” bir şeyin kesin olduğunu, “belki” ise kesin olmadığını bildirir.
2. İki sözcük aynı cümlede çelişir.
3. Diğer seçeneklerde yalnızca bir anlam vardır. Doğru cevap C.

Diğer şıklar: **Belki yarın size uğrarım.** yalnızca olasılık bildiriyor, çelişki yok / **Kesinlikle yarın size uğrarım.** yalnızca kesinlik bildiriyor, çelişki yok / **Galiba bu akşam gelmeyecek.** yalnızca olasılık bildiriyor, çelişki yok / **Mutlaka bu işi bitireceğim.** yalnızca kesinlik bildiriyor, çelişki yok.
:::

:::soru{cevap="E"}
Aşağıdaki cümlelerin hangisinde **özne-yüklem uyumsuzluğu** vardır?

- A) Ayşe ile ben sinemaya gittik.
- B) Sen ve ben sinemaya gideceğiz.
- C) Çocuklar parkta oynadı.
- D) Öğretmenler toplantıya katıldı.
- E) Çocuklar ve biz sinemaya gitti.

---

1. “Çocuklar ve biz” öznesinde “biz” de bulunduğu için yüklem 1. çoğul kişi olmalıdır.
2. “Gitti” 3. kişidir. Doğru kullanım: Çocuklar ve biz sinemaya gittik.
3. Diğer seçeneklerde özne ile yüklem uyumludur. Doğru cevap E.

Diğer şıklar: **Ayşe ile ben sinemaya gittik.** özne “Ayşe ile ben” ile yüklem “gittik” uyumlu / **Sen ve ben sinemaya gideceğiz.** özne “sen ve ben” ile yüklem “gideceğiz” uyumlu / **Çocuklar parkta oynadı.** özne “çocuklar” ile yüklem “oynadı” uyumlu / **Öğretmenler toplantıya katıldı.** özne “öğretmenler” ile yüklem “katıldı” uyumlu.
:::

:::soru{cevap="D"}
Aşağıdaki cümlelerin hangisinde **zaman (kip) bakımından** bir anlatım bozukluğu vardır?

- A) Yarın sinemaya gideceğiz.
- B) Dün akşam sinemaya gittik.
- C) Her hafta sonu sinemaya gideriz.
- D) Dün akşam sinemaya gideceğiz.
- E) Şimdi sinemaya gidiyoruz.

---

1. “Dün” geçmişi gösterir. “Gideceğiz” ise gelecek zaman kipidir.
2. Zaman sözcüğü ile kip birbirini bozar.
3. Diğer seçeneklerde zaman sözcüğü ve kip uyumludur. Doğru cevap D.

Diğer şıklar: **Yarın sinemaya gideceğiz.** “yarın” ile gelecek zaman uyumlu / **Dün akşam sinemaya gittik.** “dün” ile geçmiş zaman uyumlu / **Her hafta sonu sinemaya gideriz.** “her hafta sonu” ile geniş zaman uyumlu / **Şimdi sinemaya gidiyoruz.** “şimdi” ile şimdiki zaman uyumlu.
:::

## Kendini dene

:::dene
1. “Kitabın bütün hepsini okudum.” cümlesindeki bozukluk nedir? => Gereksiz sözcük: “bütün” ve “hepsi” aynı anlamı taşır.
2. “Çocuklar ve biz sinemaya gitti.” cümlesindeki bozukluk nedir? => Özne-yüklem uyumsuzluğu.
3. “Dün akşam sinemaya gideceğiz.” cümlesindeki bozukluk nedir? => Kip ve zaman uyumsuzluğu.
4. “Kesinlikle belki gelirim.” cümlesindeki bozukluk nedir? => Anlamca çelişen sözcükler.
5. “Ahmet’i ve Ayşe’ye çağırdım.” cümlesindeki bozukluk nedir? => Ortak ögelerin ek uyumsuzluğu.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-tr' and name = 'Anlatım Bozuklukları'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Anlatım bozuklukları, anlamsal (gereksiz sözcük, anlamca çelişen sözcük, yanlış anlamlı sözcük) ve yapısal (özne-yüklem, kip-zaman, çatı, ortak öge) bozukluklar. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Bazı gereksiz sözcük örnekleri (geri dönmek, yukarı çıkmak gibi) yayınlarda tartışmalıdır, bu nedenle metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-tr' and name = 'Anlatım Bozuklukları'
on conflict (topic_id) do nothing;
